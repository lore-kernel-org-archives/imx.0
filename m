Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB947F2D0
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435402; cv=none; b=dhET/xBNT62A3aiLtwKQWk54QUaWxkbmksNsPpSJg/A5Fv/G5Dv0h10t03Kd67TK2Yi6DfnaOBvIpPTLH90ZVJcGQfMK1p+puNrTpsjEk0/6B02Vkio6gUgtcmawVN2r+ZKtZyfDNyg9pAM9DgNO3G1PrmRKkZFHyPM5CVhFOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435402; c=relaxed/simple;
	bh=DtCP/N/4s4lcvVqc/rDjiWB4XcyWX/YxR5f7p2ctCHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CONMkS/SguTUov69GpWaGLPCYAk3kJbV3i/FK2WQx3MboOc9XaqGFKjQR5Po/724C+sXuQhX2Z3XVaGzp1ao1Kj0iJAFhtpMMICJ1WYjBS5dmJOL/MCDBMY+45O5Xakb53f9qgwstRnupnLwH+KxBSncNoJpXcI/g06vW3JfCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRJ7JWLB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRJ7JWLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3221F00A3A;
	Thu,  3 Sep 2026 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435389;
	bh=Z+FkFSnFQTOsqj3sIQ04wgxA1+8UrZbwDE6NkMDoAVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bRJ7JWLBwTnnbID0BYhvtlY1KqutbCnsdOfhMhwJTgGg09ZLJVSc4lPUa/GOrXUA9
	 6lm3k5RV0dKRz3YV8bItbvQFdo7Gd1ZzXwDSnNruC+pNzXzrKJ5ogHgIJDFsz0l7GZ
	 LLJwjrdWL87I1zL4I0GWTok3MQHTTrCV+B6m24S+jdIwLPXTNE8ZcpSrpl6lp+kkRF
	 e2npoiROZaBltpdwQza8gBpt9yIqulntF/RBGlLXOAYIiKrcbWeRYNKLOMzcQ+i98N
	 fFmSaPl4kXm8glWehhnPoH7jBPWydeKwLVh/wjyes05Vy9xnc/z+TqAWa5hS1SkVEe
	 /VfyTf4HFbFEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/13] media: imx7-media-csi: Don't use GFP_DMA when
 calling dma_alloc_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baoquan He" <hebaoquan@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903111836.1777265-11-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
 <20260903111836.1777265-11-hebaoquan@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:36:28 +0000
Message-Id: <20260903113629.1D3221F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Integer overflow in `sizeimage` calculation and signedness tru=
ncation in `imx7_csi_alloc_dma_buf()` allow userspace to trigger a massive =
out-of-bounds DMA write, corrupting kernel memory.
--

commit 007baffc77bd7059db343099782a06610465cf12
Author: Baoquan He <hebaoquan@kylinos.cn>
Subject: media: imx7-media-csi: Don't use GFP_DMA when calling dma_alloc_co=
herent()

This commit removes the redundant GFP_DMA flag from the dma_alloc_coherent()
call in imx7_csi_alloc_dma_buf(). The DMA core already handles device
addressing limitations and ignores GFP_DMA.

> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/=
platform/nxp/imx7-media-csi.c
> index 7ddc7ba06e3d4..22c0cbdc92bfb 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -466,7 +466,7 @@ static int imx7_csi_alloc_dma_buf(struct imx7_csi *cs=
i,
> =20
>  	buf->len =3D PAGE_ALIGN(size);
>  	buf->virt =3D dma_alloc_coherent(csi->dev, buf->len, &buf->dma_addr,
> -				       GFP_DMA | GFP_KERNEL);
> +				       GFP_KERNEL);
[Severity: Critical]
This isn't a bug introduced by this patch, but could this allocation lead to
arbitrary kernel memory corruption?

The size parameter in imx7_csi_alloc_dma_buf() is a signed int. This allows
large unsigned 32-bit sizeimage values (e.g., between 2 GB and 4 GB) to be
interpreted as negative, subverting the PAGE_ALIGN macro.

This seems to be reachable from userspace because imx7_csi_try_fmt() lacks
bounds checking for width and height in the IMX7_CSI_PAD_SINK case:

drivers/media/platform/nxp/imx7-media-csi.c:imx7_csi_try_fmt() {
    ...
    case IMX7_CSI_PAD_SINK:
        *cc =3D imx7_csi_find_mbus_format(sdformat->format.code);
    ...
}

This allows massive dimensions to bypass validation. When passed to
__imx7_csi_video_try_fmt(), the 32-bit multiplication overflows without
prior bounds checking on the total pixel volume:

drivers/media/platform/nxp/imx7-media-csi.c:__imx7_csi_video_try_fmt() {
    ...
    pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
    ...
}

If a user calls VIDIOC_S_FMT with large dimensions (e.g., width=3D32896,
height=3D65281, and a 16-bpp format), the product wraps around modulo 2^32,
producing a very small positive sizeimage, or a negative size when passed
as a signed int to imx7_csi_alloc_dma_buf().

As a result, a tiny buffer is allocated here, but the CSI hardware could
capture the massive frame and DMA up to 4 GB of data into it, seamlessly
crossing the buffer boundary.

>  	if (!buf->virt)
>  		return -ENOMEM;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903111836.1777=
265-1-hebaoquan@kylinos.cn?part=3D10
