Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1154785
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211785; cv=none; b=Hnn9n0G82QuXrH7q7WlSHY5XLKGCcok0WWWJuOWpyhDaNZ8JXpHOc2uANDPc8+E73MwsR6ZwxwOC5vO2wqGrXPITxwle0ofIx+mtDicFqvplVPO0eou8e5wHpZvB7BIsgkuBvysSfCpk0GzXY4CR6J4EIaMWpL+k6BkbjYZf57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211785; c=relaxed/simple;
	bh=S/WidZXzv3HjCuEqmXi0+f/n2WIJeqVR+a2EybaaZJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mSNLoJUV7fSvd0kEi6bBEc7F6c0iPZykc6GHwHXfhZpFJNE0Sx5PF2JCVc0bRh1owSsAwhajReNqAFSrEh17KUGMRvek/AUogtgLkGrh5FrEvflMXUOJYg5UgqZuQlM0Mi0XVYa/MIqqqPmoCfmZtdH1r4qPTp4ZyIvSsNgb9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzUlluJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzUlluJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91DF1F000E9;
	Tue, 23 Jun 2026 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782211782;
	bh=WSJhtpHc5SB7skgOGNlnFNcvApxhXm3LzEEwJ/0g7CQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzUlluJmgFWvWkNxNpEANeUI2bMt+bggAwkjJKG17ltvMOnw6W4zR/3U5g0hv4g3N
	 YLu38nxdtWaCtHTtAmQGN0EzgZ+nSnDqeYkS2OvaqetYy9MHHxDnk5E0Ky0IY2f/o1
	 wE2gHm4CB+soFNvLqiddZcbxgFpoclK7s4OdknJNn0MSgabhPdmizT1mqeZS7oA7Vw
	 fWzIogK2VJNUcdP1jNrXvNMn2vPYc81PPe46s0sRaUpfP+r/7OdtcLJpewL9U1DgfS
	 AicobQ8na3vTldMUUQGw6XtihLylion7aQsQ+lYrklynpqlqJJbZEVmyxGSA0DaLVb
	 NCqGB3C1AzCqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: imx-jpeg: cancel timeout worker when streaming
 stops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fan Wu" <fanwu01@zju.edu.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260623103031.3051-1-fanwu01@zju.edu.cn>
References: <20260623103031.3051-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 10:49:42 +0000
Message-Id: <20260623104942.B91DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A race condition between the frame-done IRQ handler and the timeou=
t callback can lead to a NULL pointer dereference and hardware state corrup=
tion due to incorrectly processing a timeout for a finished job.
- [High] Missing v4l2_m2m_job_finish() on error paths in mxc_jpeg_device_ru=
n() causes the V4L2 mem2mem framework to hang permanently.
--

commit d5e489df2b36369b3ad5503c5a3b9a1b62e681de
Author: Fan Wu <fanwu01@zju.edu.cn>

media: imx-jpeg: cancel timeout worker when streaming stops

The commit adds a synchronous cancellation of the timeout worker to
mxc_jpeg_stop_streaming(). This prevents a use-after-free race condition
where the delayed work might execute after the context has been freed
when closing the file descriptor.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each fra=
me")
Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 725e941528848..ea2fad5dd646d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1798,6 +1798,8 @@ static void mxc_jpeg_stop_streaming(struct vb2_queu=
e *q)
> =20
>  	dev_dbg(ctx->mxc_jpeg->dev, "Stop streaming ctx=3D%p", ctx);
> =20
> +	cancel_delayed_work_sync(&ctx->task_timer);
> +

[Severity: High]
This isn't a bug introduced by this patch, but does a race condition
still exist between the frame-done IRQ handler and the timeout callback?

When a job completes, mxc_jpeg_dec_irq() calls cancel_delayed_work(),
which is non-synchronous and doesn't wait if the timeout worker is
already executing and spinning on hw_lock:

drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:mxc_jpeg_dec_irq() {
    ...
    cancel_delayed_work(&ctx->task_timer);
    ...
}

If the IRQ handler finishes the job, the framework can immediately queue
a new job for a different context, acquiring hw_lock and setting
jpeg->slot_data.used =3D true.

Can the timeout worker for the original ctx then erroneously see
used =3D=3D true?

drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:mxc_jpeg_device_run_timeout(=
) {
    ...
    if (ctx->mxc_jpeg->slot_data.used) {
        ...
        mxc_jpeg_job_finish(ctx, VB2_BUF_STATE_ERROR, true);
    ...
}

This could cause mxc_jpeg_job_finish() to be called when ctx has no
buffers left, leading to v4l2_m2m_next_src_buf() returning NULL which
is then dereferenced in v4l2_m2m_buf_done().


[Severity: High]
This is also a pre-existing issue, but can an error in
mxc_jpeg_device_run() cause a permanent hang?

If mxc_jpeg_alloc_slot_data() fails, the code drops hw_lock and returns
without clearing the V4L2 TRANS_RUNNING state or calling
v4l2_m2m_job_finish():

drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:mxc_jpeg_device_run() {
    ...
    if (!mxc_jpeg_alloc_slot_data(jpeg)) {
        dev_err(dev, "Cannot allocate slot data\n");
        goto end;
    }
    ...
}

Because schedule_delayed_work() is skipped, the timeout worker never runs
to rescue the job.

Would this cause v4l2_m2m_cancel_job() to spin-wait indefinitely for
TRANS_RUNNING to clear when the device is closed?

drivers/media/v4l2-core/v4l2-mem2mem.c:v4l2_m2m_cancel_job() {
    ...
    wait_event(m2m_ctx->finished,
               !(m2m_ctx->job_flags & TRANS_RUNNING));
    ...
}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623103031.3051=
-1-fanwu01@zju.edu.cn?part=3D1
