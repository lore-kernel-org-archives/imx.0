Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899EA37E5C4
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600990; cv=none; b=Z9lTGZP+jgMEDV9YXf6Y7aFU6MxUuyabuWiIy2RO6q+PywqgTl/CGN0u+6+L1Un1J1I1NkKLka04ZlaJkKq2Ivu310YdHW4AYI/bv8NUfGZr+C/uLmxWXN6CS0C43XrV58SxqQXRsOIbnAwqSnbuGiSEaH2jx++VbzI5kL9hHB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600990; c=relaxed/simple;
	bh=CCiFESx5M/1JmncX1IoMX4AZ5aBg+WYLfapSGVxn5rE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qHKmC9JIUEBJBHsfPkKS75Kj0Nkn1xFycHYK4Sz1+Mbmew2Y0TVJM33Cd0pUEMtj/ouAv0C51my+GwKYxzFLfYje+o8UXphlU6H5f3ZNahx/aWaQvBa9Mt8yIpZQFefkr0T3fiJGaxowji97lDVPDerC3uFDEJ3fPBxYtunetBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3xO0BO5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3xO0BO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BC21F000E9;
	Mon, 24 Aug 2026 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787600989;
	bh=xK8S0PCJrIreGg8VGuJYrgCfmu18MF8Ot8wmzG0GikA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3xO0BO5LLg4ms1m/liWvm07/eVX97KUeNOIRIPoUB0NSnmy8R94ZHe9NXdtgNntb
	 YidyfjHzbOnhzY+3pcR7nVOG2pY2KwcFdf2ECzrAhZzwuBJL4A/bjgCGJGA+OKjTWV
	 vFg9UBSgkmIFxYC/12fHW7qsLKGDm6YEBW2OFSa2hS142vCaW1U337pd8dC/dv4Wdd
	 DgcgMJ7O0eqc2H4JS81qOu11I5bCO4MibykkSCVxmZOkjNYF2BovaHAsNvEDd/tlYT
	 MeXLdgk+SoGHCuEsSWZnpIhR7TpN+qbgJvZzSn5o0O4n2fqCJSYTVIQzaknRPfl9hq
	 /gSMa0TXdwzKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: verisilicon: hantro: cancel watchdog work
 before m2m release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: imx@lists.linux.dev, media-ci@linuxtv.org, Frank.Li@kernel.org
In-Reply-To: <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
 <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:49:48 +0000
Message-Id: <20260824194948.E0BC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete Fix: Pending V4L2 m2m jobs can re-arm the watchdog afte=
r cancellation, causing a Use-After-Free.
- [High] Hardware interrupt is not masked or freed before freeing `m2m_dev`=
, leading to a Use-After-Free and Bus Error.
- [High] Incorrect object lifetime management causes devres and `v4l2_m2m_p=
ut()` to unconditionally free `m2m_dev` and `vpu` while open file descripto=
rs still exist.
- [High] Missing cancellation of `watchdog_work` in the `hantro_probe()` er=
ror paths.
--

--- Patch [2]: [PATCH 2/3] media: verisilicon: hantro: cancel watchdog work=
 before m2m release ---
commit 36d662041efb45f2c47f99503f908090f9994b94
Author: Shengzhuo Wei <me@cherr.cc>
Subject: media: verisilicon: hantro: cancel watchdog work before m2m release

This commit adds a cancel_delayed_work_sync() call to hantro_remove() to
drain pending watchdog work before releasing the m2m device. This aims to
prevent a use-after-free where the watchdog dereferences the m2m device aft=
er
hantro_remove() drops the final reference.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1284,6 +1284,7 @@ static void hantro_remove(struct platform_device *p=
dev)
>  	hantro_remove_dec_func(vpu);
>  	hantro_remove_enc_func(vpu);
>  	media_device_cleanup(&vpu->mdev);
> +	cancel_delayed_work_sync(&vpu->watchdog_work);

[Severity: High]
This isn't a bug introduced by this patch, but is this fix complete?

Because the driver does not abort the m2m job queue or stop the hardware
before cancelling the watchdog, an active or pending m2m job can run
concurrently with driver removal.

If a job is processing, the m2m framework executes it via m2m_dev->job_work,
which eventually calls hantro_end_prepare_run(). That function explicitly
calls schedule_delayed_work(&ctx->dev->watchdog_work, ...).

Could this allow the watchdog to be re-armed immediately after the
cancel_delayed_work_sync() call here, leading to the exact use-after-free
this patch intends to resolve?

>  	v4l2_m2m_put(vpu->m2m_dev);

[Severity: High]
This is a pre-existing issue, but does freeing the m2m_dev here leave us
vulnerable to an interrupt handler use-after-free?

The hardware interrupt is managed by devres and is not explicitly masked or
freed before this point. If a hardware interrupt fires during this teardown
window, hantro_irq_done() will execute and call
v4l2_m2m_get_curr_priv(vpu->m2m_dev), dereferencing the freed m2m_dev.

[Severity: High]
This is also a pre-existing issue, but is it safe to unconditionally drop t=
he
m2m_dev reference here while userspace might still have open file descripto=
rs?

The vpu and func structures are allocated with devm_kzalloc(), and the V4L2
device release callback is stubbed out (video_device_release_empty). This
means when hantro_remove() returns, devres will immediately free these
structures.

If userspace later closes an open file descriptor, hantro_release() will ca=
ll
v4l2_m2m_ctx_release(), which then calls v4l2_m2m_cancel_job(). This will
access the already freed m2m_dev and vpu.

Could this also cause the kernel workqueue subsystem to dereference a freed
work_struct if the m2m_dev's embedded job_work is pending on the system
workqueue when it is freed?

>  	v4l2_device_unregister(&vpu->v4l2_dev);
>  	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);

Since clk_bulk_unprepare() is called right after dropping the m2m_dev, could
an active interrupt handler accessing registers with disabled clocks cause a
synchronous bus error?

There is another pre-existing issue in the hantro_probe() error path.

In hantro_probe(), the video devices are registered and exposed to userspace
before the rest of the initialization completes. If a later step in probe
fails, the error path tears down the device and allows devres to free the v=
pu
structure:

hantro_probe() {
    ...
err_rm_dec_func:
    hantro_remove_dec_func(vpu);
err_rm_enc_func:
    hantro_remove_enc_func(vpu);
err_m2m_rel:
    media_device_cleanup(&vpu->mdev);
    v4l2_m2m_put(vpu->m2m_dev);
    ...
}

[Severity: High]
Since cancel_delayed_work_sync(&vpu->watchdog_work) is missing from this
error path, could a job queued by userspace during the brief registration
window arm the watchdog, leading to a use-after-free when the pending timer
executes on the freed vpu memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-media-time=
out-work-v1-0-ebfebbeb6c31@cherr.cc?part=3D2
