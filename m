Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F37381EB5
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600914; cv=none; b=KZ9PusShXmAkA3qwL2XNtOEOWpkspk29sMdrmhOmL1D4a/JZ3SOQDNxPAc+twYISZQLeILFiARPKkzg3ymNF+olQaGc+dgQeMvpNrJ6Rf2Jf9SEPAaSfkzg74oj3En9LYbqivzeSPYKkW5irJmcQDdOcjfKhthSLE5NYjdUmT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600914; c=relaxed/simple;
	bh=A9Ads47VKv7a0nsB8nNIK3G2hCWXWg1YjzahU52ngDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QBPkgvJ3mVJLV4acmyZYFQ0isSTroiozrWHCI9WoUXZnceqKVFvfMP9Ey2k056LFc0IpB6llP3WKRfK6odVijSXgN/AnKqBWe8KtX5Dgp2tWCzHweCQJgkSGOlSgun3UgJ87u+6ktTuJyuKAjCEHYhlH/PiNk/pR35gEERJJHl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bytrOhR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bytrOhR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530311F000E9;
	Mon, 24 Aug 2026 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787600912;
	bh=GwI8/Cg0vjEhFnqcYFHzAxSvd41aE7++yIIjeLfTQe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bytrOhR+hhX+305k7DMPkuYfegQe/39t6/N3b4ntexbStAGYBMbOxGGsFJa1nx19b
	 dap8w6X/o7LvSISMhOM3yo/Q2wxqqCVm/14TOn0yZiDgsojdSk1+2ho+DsvC7Ac5bq
	 RqfhcrPIRIjO3nmPgeArskO2sbde7YkFXJGH7uaAmRgWxI2kpwJbZI/58gRifmqeK1
	 ljdHwUMv9+taXGpoTMgOD8LKp3o/QFAo+uR0oVVNCnYnnZHzu6bIo8BOclTVRypyKc
	 kmdgq2J5N7bU4MPnTtrKQEPpWTgKPfxzBRVtZpP//RWxxDp0ScNWWR6F1E/OnPWHCG
	 yymrpNVv6Do3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] media: nxp: imx-jpeg: cancel task_timer before
 freeing ctx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260825-media-timeout-work-v1-1-ebfebbeb6c31@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
 <20260825-media-timeout-work-v1-1-ebfebbeb6c31@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:48:31 +0000
Message-Id: <20260824194832.530311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Canceling the timeout timer before releasing the V4L2 mem2mem cont=
ext causes an uninterruptible kernel hang if the hardware is hung, and fail=
s to fully prevent the original Use-After-Free.

Pre-existing issues:
- [High] The timeout handler checks the shared device-level slot state rath=
er than context-specific state, leading to a race condition that causes a N=
ULL pointer dereference.
- [High] Error paths in mxc_jpeg_device_run() skip calling v4l2_m2m_job_fin=
ish(), stalling the M2M queue and causing a deadlock on release.
--

--- Patch [1]: [PATCH 1/3] media: nxp: imx-jpeg: cancel task_timer before f=
reeing ctx ---
commit 80a788b1c14931407edfcc537272f62c4cc6d308
Author: Shengzhuo Wei <me@cherr.cc>

media: nxp: imx-jpeg: cancel task_timer before freeing ctx

This commit attempts to fix a use-after-free issue by canceling the
ctx->task_timer before the ctx is torn down in mxc_jpeg_release(). The timer
is canceled before acquiring the mxc_jpeg->lock to avoid deadlocks with
workers.

> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 725e941528848..fbb64a1ecb518 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2796,6 +2796,8 @@ static int mxc_jpeg_release(struct file *file)
>  	struct mxc_jpeg_ctx *ctx =3D mxc_jpeg_file_to_ctx(file);
>  	struct device *dev =3D mxc_jpeg->dev;
> =20
> +	cancel_delayed_work_sync(&ctx->task_timer);
> +

[Severity: High]
Does canceling the timeout timer before releasing the mem2mem context creat=
e a
potential deadlock and leave a race window?

If the hardware has hung, the TRANS_RUNNING flag remains set. When
v4l2_m2m_ctx_release() is called, v4l2_m2m_cancel_job() will wait indefinit=
ely
for the running flag to clear because this driver lacks a job_abort callbac=
k.
Since the timeout timer was already canceled, it will never fire to clear t=
he
flag, causing the close() operation to hang in an uninterruptible state.

Additionally, because the V4L2 M2M queues are not paused during the sync
cancel, could a concurrent worker thread dequeue a pending job and call
mxc_jpeg_device_run(), re-arming the timer after the cancel but before the
context release? This would re-introduce the use-after-free this patch seeks
to fix.

>  	mutex_lock(&mxc_jpeg->lock);
>  	if (mxc_jpeg->mode =3D=3D MXC_JPEG_DECODE)
>  		dev_dbg(dev, "Release JPEG decoder instance on slot %d.",
[ ... ]
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_fh_del(&ctx->fh, file);


[Severity: High]
This isn't a bug introduced by this patch, but does the timeout handler che=
ck
the wrong state flag?

In mxc_jpeg_device_run_timeout():
	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
	if (ctx->mxc_jpeg->slot_data.used) {
...
		mxc_jpeg_job_finish(ctx, VB2_BUF_STATE_ERROR, true);

If mxc_jpeg_dec_irq() completes its job, sets jpeg->slot_data.used =3D fals=
e,
unlocks hw_lock, and schedules a new job for a different context,
jpeg->slot_data.used could be set back to true before the timeout handler
acquires the lock.

When the timeout handler acquires the lock, it checks this shared device-le=
vel
flag instead of its own context state. Will it incorrectly assume its own j=
ob
timed out and call mxc_jpeg_job_finish() with NULL buffers (since they were
already removed by the IRQ handler), leading to a NULL pointer dereference =
in
v4l2_m2m_buf_done()?


[Severity: High]
This is a pre-existing issue, but do the error paths in mxc_jpeg_device_run=
()
leak the running state?

In mxc_jpeg_device_run():
	if (!mxc_jpeg_alloc_slot_data(jpeg)) {
		dev_err(dev, "Cannot allocate slot data\n");
		goto end;
	}
...
end:
	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);

If mxc_jpeg_alloc_slot_data() fails, the function jumps to the end label and
returns without calling v4l2_m2m_job_finish() and without arming the timeout
timer. Does this leave the job in the TRANS_RUNNING state? If so, when
mxc_jpeg_release() is later called, v4l2_m2m_cancel_job() will wait
indefinitely for the running flag to clear.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-media-time=
out-work-v1-0-ebfebbeb6c31@cherr.cc?part=3D1
