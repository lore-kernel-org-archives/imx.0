Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119F2E0902
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 00:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782262071; cv=none; b=KWMYhZ6mNOvvGdIl4Dnzr3zPCJvnSsY6qocy1kNQDcVS5h6LccolREHs3vrU2dwrOxV+/t67QKwkEfJVBDhR8rFOOJMEGoyjWfJyWuLvR1KCenhs7gXZIudzt0l4xLl5Pe66/N3U198jZGWnfcW4a/F2y8KHlHat4k8cIQcBeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782262071; c=relaxed/simple;
	bh=0PKsqi1ZRSCnmr8qnV+ZDXzIOsGczHI/szQfE0Yh/Is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lko/AbaGur1OEFuts1PlStBatWBAGDAAorAR+VUGReSWgok9m6meqTdJ9KOiSbwYVCIUx9y0MVyidnRNtjpoM+7lh+bvT6b0LpLK1etvyEfGRmXErFhSZBQaE0Puy0wrcva7dnZjI1fMD3XreXU9Ql5SgRndSO5fRKYhL67W/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2kx+ZoB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2kx+ZoB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCA21F000E9;
	Wed, 24 Jun 2026 00:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782262068;
	bh=BYaqMORpqtpsh106FNtMvqEwW74azLRUBHDzRyuLDOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2kx+ZoB7PxWY9F+QNBPU4VAZozpliw+6Z4elLJpmauP0GsLhxZMp3rZpObeCW5vH
	 R/6IWI+tYwitXwg2xThc81Ra5TLaFEnb3BBQEYjtfDVb5aKgqtM8+RBPOsuSxc/BBm
	 sE4Cwpx0vbD67piraLhpnFDdpV0dGbQ+t+3ndoX3AkzWCxNqCaqBTyMuRO7um1Ehub
	 fyLXirmRzpZHDv6Mn8tEGiyJpK7yLoMU3FEGaA52l9KYTVCsA721jr1+h4dmdaaWWv
	 /2LLxHwy8UgVXbjHW6ukGCprHfTMANs80JiXOr72O4hMYIX5F17G/LFM4p11Y+/dXe
	 wv2Oq5pkgLGUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: imx-jpeg: finish the job on device_run() error
 paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fan Wu" <fanwu01@zju.edu.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260624003208.12400-1-fanwu01@zju.edu.cn>
References: <20260624003208.12400-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 00:47:48 +0000
Message-Id: <20260624004748.ADCA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Missing V4L2 EOS Event / Draining Flag on error paths

Pre-existing issues:
- [High] Unconditional free of unallocated slot resources leads to a NULL p=
ointer dereference
- [High] Use-After-Free in timeout handler due to missing cancel_delayed_wo=
rk_sync
- [High] Sleeping in Atomic Context during error handling
--

commit 0484749a5489fb19f99621dd05d2af93fb5f8033
Author: Fan Wu <fanwu01@zju.edu.cn>

media: imx-jpeg: finish the job on device_run() error paths

mxc_jpeg_device_run() returns early through a shared "end" label on several
error paths. This commit ensures those paths correctly complete the buffers
and call v4l2_m2m_job_finish() to prevent hangs during close.

> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 725e941528848..3a1c69ecb09ac 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

[ ... ]

> @@ -1636,11 +1636,11 @@ static void mxc_jpeg_device_run(void *priv)
>  	ctx->slot =3D mxc_get_free_slot(&jpeg->slot_data);
>  	if (ctx->slot < 0) {
>  		dev_err(dev, "No more free slots\n");
> -		goto end;
> +		goto buf_finish;
>  	}
>  	if (!mxc_jpeg_alloc_slot_data(jpeg)) {
>  		dev_err(dev, "Cannot allocate slot data\n");
> -		goto end;
> +		goto buf_finish;
>  	}

[Severity: High]
This is a pre-existing issue, but does the error path in
mxc_jpeg_alloc_slot_data() sleep in atomic context?

In mxc_jpeg_device_run(), the ctx->mxc_jpeg->hw_lock spinlock is held with
IRQs disabled via spin_lock_irqsave(). If mxc_jpeg_alloc_slot_data() fails,
its error path calls mxc_jpeg_free_slot_data() which invokes
dma_free_coherent().

Since dma_free_coherent() can sleep, does this cause a sleep-in-atomic
violation?

[Severity: High]
This is a pre-existing issue, but does mxc_jpeg_alloc_slot_data()
unconditionally free unallocated pointers on failure?

If the very first allocation desc =3D mxc_jpeg_alloc(...) fails, it jumps to
the err label and calls mxc_jpeg_free_slot_data(). This function
unconditionally passes jpeg->slot_data.desc to dma_free_coherent() even if
it is NULL.

Since the DMA mapping API doesn't safely handle NULL virtual addresses, can
this cause a kernel panic due to invalid memory access?

> =20
>  	mxc_jpeg_enable_slot(reg, ctx->slot);
> @@ -1660,8 +1660,17 @@ static void mxc_jpeg_device_run(void *priv)
>  		mxc_jpeg_dec_mode_go(dev, reg);
>  	}
>  	schedule_delayed_work(&ctx->task_timer, msecs_to_jiffies(hw_timeout));
> -end:
> +
>  	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);

[Severity: High]
This is a pre-existing issue, but can mxc_jpeg_device_run_timeout() race
with mxc_jpeg_release() and cause a use-after-free?

When mxc_jpeg_release() calls v4l2_m2m_ctx_release(), it blocks until
TRANS_RUNNING is cleared. If a hardware timeout occurs and
mxc_jpeg_device_run_timeout() executes, it calls v4l2_m2m_job_finish()
which clears the state and wakes up mxc_jpeg_release(). The release
function then proceeds to kfree(ctx).

However, mxc_jpeg_device_run_timeout() then attempts to unlock the spinlock
using the same ctx pointer:

    spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);

Does mxc_jpeg_release() need to synchronously cancel the delayed work to
prevent this use-after-free?

> +	return;
> +buf_finish:
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);

[Severity: Medium]
Will this error path skip sending the V4L2 EOS event if this happens to be
the last buffer in a draining stream?

If an error occurs exactly when processing the final draining frame, it
looks like we remove and complete the buffers with VB2_BUF_STATE_ERROR but
miss calling mxc_jpeg_check_and_set_last_buffer() like the jpeg_parse_error
path does.

Could this cause the userspace video decoder application to hang
indefinitely while waiting for the stream to drain?

> +job_finish:
> +	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
> +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624003208.1240=
0-1-fanwu01@zju.edu.cn?part=3D1
