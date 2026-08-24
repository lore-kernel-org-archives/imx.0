Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858638331B
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600974; cv=none; b=jTIVtBux1ueTw97Pq2AHK+HACBeUZYxnBxKCIaLgxqWzSpsFjCx0OBHrLTgL0630kGUyYVPmIHmGejOcawkZSo54EXMHmdVtW7eWaizWlj9RaWXO2Zy4jP9098JZH+PLLDsPCyE1HgCmB7BRPdjNRlKmSOOrWKks+bFb3zk0tm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600974; c=relaxed/simple;
	bh=zjwVoOoZpKfpb/fttAv+Xy0JVkIOc/0tfiVmg9l5pkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U7LjXF/iIWxMkxxsXPFmPzW2keAGfjPiFudQ0RCr3rSHrzkgvMK0ephJOCsauSnMuDZuHZURPTUG+D7vJSR4y3G39/eyK87Ub8d69ZdUatOszl5k0cv3H8ZeG236vAYt2RyqnWmaLMcB3OxeJT+qG+h5OddxslJYodhqYfHqW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asdjpYDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asdjpYDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D141F000E9;
	Mon, 24 Aug 2026 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787600973;
	bh=5z1Sr6R2RKXsy6fAtnIYUrusbRHhNc9lWV0T+4gEpAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asdjpYDEkyvPdwydDeMp4I2/0+FLMnkoLkgJk7zLoRC+NWK/SXTvwd9NF1ny16/8u
	 0NapKWz52OWM1cOLu1Fcwoi2A0eXKGCgnQbg9FArk2tfPwlPhTvWQ5qkG/rYY2eMU/
	 lO8vRei3Zti28+DRWlTAYdG8+HW4q6s7l9NdxzCDrxo49a94Vm5icdaXjvNibHaP60
	 6Tmn88DeJIJ7uiUKPougfHhpy+gmMBIi02Fad55XOAjS5czau9cNvqgPP2Y4bHC/nx
	 J+vEj/EYHccbmYfSOiD0IKS0ilxSZ+W046Op/lKLYcq+yFoE9J03Ny35U2ws14aNAm
	 tH+Ake918Idpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] media: mediatek: jpeg: cancel job timeout work
 before m2m release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: imx@lists.linux.dev, media-ci@linuxtv.org, Frank.Li@kernel.org
In-Reply-To: <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
 <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 19:49:32 +0000
Message-Id: <20260824194933.28D141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Cancelling the job timeout work in remove leaves stalled jobs in T=
RANS_RUNNING state forever, causing a deadlock on file close.
- [Medium] Calling cancel_delayed_work_sync() on an uninitialized delayed_w=
ork struct for multi-core variants causes a kernel WARNING.

Pre-existing issues:
- [High] Releasing m2m_dev in mtk_jpeg_remove() causes a Use-After-Free whe=
n open file descriptors are eventually closed.
- [High] Missing cleanup of sub-device job_timeout_work in multi-core mode =
causes a use-after-free.
- [High] Pending multi-core workers in jpeg->workqueue cause a use-after-fr=
ee during devres cleanup.
- [High] Missing hardware stop and IRQ disable before freeing m2m_dev cause=
s UAF in IRQ handler.
- [High] A race condition between the hardware IRQ handler and the timeout =
worker can result in a NULL pointer dereference.
- [Medium] Missing PM usage counter balance on cancellation and error paths.
--

--- Patch [3]: [PATCH 3/3] media: mediatek: jpeg: cancel job timeout work b=
efore m2m release ---
commit 783b89e56f061c0e51e278c73a5f2399a27451fa
Author: Shengzhuo Wei <me@cherr.cc>

media: mediatek: jpeg: cancel job timeout work before m2m release

This patch attempts to fix a use-after-free by cancelling the job timeout
work before releasing the m2m device in mtk_jpeg_remove().

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec4830811..f0fe14e83d515 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1405,6 +1405,7 @@ static void mtk_jpeg_remove(struct platform_device =
*pdev)
> =20
>  	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->vdev);
> +	cancel_delayed_work_sync(&jpeg->job_timeout_work);

[Severity: High]
Does cancelling the job timeout work here leave stalled jobs in the
TRANS_RUNNING state forever?

If a job is currently hanging when the driver is unbound, the timeout work
is cancelled and will never execute. Since the hardware is hung, no IRQ
will arrive to complete the job, and the driver does not implement the
job_abort m2m callback.

When the user subsequently closes the file descriptor,
v4l2_m2m_ctx_release() invokes v4l2_m2m_cancel_job(), which indefinitely
blocks in wait_event() waiting for TRANS_RUNNING to be cleared. Could this
create an unkillable process in the D state?

[Severity: Medium]
Will this unconditionally pass a zero-initialized work struct to the
workqueue subsystem for multi-core variants?

In mtk_jpeg_probe(), jpeg->job_timeout_work is only initialized via
INIT_DELAYED_WORK if jpeg->variant->multi_core is false. For multi-core
variants, it remains uninitialized.

When cancel_delayed_work_sync() executes on multi-core variants during
unbind, could it hit a WARN_ON(!work->func) inside flush_work() and
trigger debug object warnings?

[Severity: Medium]
Does unconditionally cancelling the timeout worker here leak the PM usage
counter?

When a job starts, it takes a PM reference via pm_runtime_get_sync(). If
the job stalls, the timeout work normally balances this reference by
calling pm_runtime_put(). By cancelling the worker without issuing a
compensating pm_runtime_put(), the usage counter may never be balanced.

This also relates to a pre-existing issue in mtk_jpegenc_worker() and
mtk_jpegdec_worker(). If pm_runtime_get_sync() fails, the code branches to
the error path without calling pm_runtime_put_noidle(). Since
pm_runtime_get_sync() increments the counter even on failure, does this
also permanently leak the usage counter?

>  	v4l2_m2m_release(jpeg->m2m_dev);

[Severity: High]
This is a pre-existing issue, but does releasing m2m_dev here cause a
use-after-free when open file descriptors are eventually closed?

video_unregister_device() does not forcefully close existing open file
descriptors. If a user-space process holds an FD open during device
unbind, jpeg->m2m_dev is freed while ctx->fh.m2m_ctx remains active.

When the user eventually closes the FD, mtk_jpeg_release() accesses the
freed jpeg struct and calls v4l2_m2m_ctx_release(). This internally
accesses the freed m2m_dev (e.g., locking m2m_dev->job_spinlock in
v4l2_m2m_cancel_job()), which seems reachable by unprivileged users simply
keeping the FD open.

[Severity: High]
This is a pre-existing issue, but does freeing m2m_dev here race with
pending multi-core workers in jpeg->workqueue?

Active multi-core jobs are executed on a devm-managed workqueue
(jpeg->workqueue). This workqueue is destroyed via devres, which flushes
pending work after mtk_jpeg_remove() has completed and freed
jpeg->m2m_dev.

When the workqueue is flushed during devres destruction, delayed workers
like mtk_jpegenc_worker() are forced to execute. Do they dereference the
already freed jpeg->m2m_dev via v4l2_m2m_next_src_buf() and
v4l2_m2m_job_finish(), resulting in a use-after-free?

[Severity: High]
This is a pre-existing issue, but is m2m_dev released here while the IRQ
is still active and hardware might still be running?

Because the interrupt was registered using devm_request_irq(), it remains
fully active during and after mtk_jpeg_remove() executes. If a hardware
job completes shortly after v4l2_m2m_release(), the IRQ handler
mtk_jpeg_enc_irq() will execute and call mtk_jpeg_enc_done().

Does this unconditionally dereference the already freed jpeg->m2m_dev in
the interrupt handler?

>  	v4l2_device_unregister(&jpeg->v4l2_dev);
>  }

[Severity: High]
This is a pre-existing issue, but does the lack of a remove callback for
sub-devices cause a use-after-free for their timeout works?

Multi-core variants use timeout works embedded in component hardware
devices, such as dev->job_timeout_work in mtk_jpeg_dec_hw.c. However,
component drivers like mtk_jpegdec_hw_driver lack a remove callback.

When the master device unbinds, devres frees the sub-devices' memory
without cancelling their timeout works. If a multi-core job is stalled
during removal, will the uncancelled component timeout work eventually
execute on freed memory?

[Severity: High]
This is a pre-existing issue, but is there a race condition between the
hardware IRQ handler and the timeout worker that can result in a NULL
pointer dereference?

In mtk_jpeg_job_timeout_work(), buffers are removed via
v4l2_m2m_src_buf_remove() and passed directly to v4l2_m2m_buf_done(). The
IRQ handlers, like mtk_jpeg_enc_irq(), call cancel_delayed_work(), which
is asynchronous and returns immediately if the timeout worker is already
running.

The IRQ handler then proceeds to remove buffers from the same context. If
the timeout worker and IRQ handler execute concurrently on different CPUs,
they will both pop from the queue. One will receive a valid buffer and the
other will receive NULL.

Since the one receiving NULL passes it to v4l2_m2m_buf_done(), which
directly dereferences buf->vb2_buf without a NULL check, could this cause
a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-media-time=
out-work-v1-0-ebfebbeb6c31@cherr.cc?part=3D3
