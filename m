Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007203BBFD0
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222800; cv=none; b=Nl/3fpq/iglJZuZyw/XuUrSQwR1//pBuL4LlgwOmtkYiLCg5joSJhu8m8a+gAN8+idpCA066FrRrCFR7VrGGt8JZIUWqygXMYzIzOZNn0OfFZksEo3VV50QYmqKLgwqKpmySj8wL6QCvyWVjiBbjo3eQ1VLJYkpnO+kd5K6SG/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222800; c=relaxed/simple;
	bh=YFFh937MfXSJB8O3h+uNgxbZD+1lmszUVUdfSOdOEh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J2HWbFKjrJGEPMzVvogiqDjCPpSBMHlwSR8wgvvlchKN+J2E60uKWhKNAGnesdjSzStbke+tBSb2uZMB6BGsM4wc/s9njqjQtNe8LPdutKRkJLyvJOCXZNevwq4PwXRZZoYH+pN6ct0sNNeT0rsDWxoO4p7eiOYDM89pOAVbN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFjY7ut8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFjY7ut8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54C81F000E9;
	Tue, 28 Jul 2026 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222797;
	bh=sj3uYvHP+0TfckSd6R5F0NUJrEwitMRepkNQF7Xctvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFjY7ut8hwPBQ/e/xPqPVHrph8mkZmf0CXAvV95L4KUkf1jRYoJfyQ7V2gjqdV5vY
	 SxHisKZuaLxbg4NlQ7tZllt4gZY/dNFxKezP2zawyTovvXcs7DysBBEtbE0u37EmIQ
	 QucCk6MvIZ8vJlN/uzMyBGr9umPk51fuBmv6kCE0yt8b4AbeaLocJIQECPeR/txu9F
	 mLNE2WsE5Ir8uSgAPkTI8vvgoJebbmNEJmXZNX0md502cQWLTY/aH8Vv5U0KJAZCa9
	 Ft/THHsS4NaiQ+N5f1CiRHPZYV1XOU3u/cxZDva1OzGj4/oqOWKHuXnrELeMjjKA4T
	 OQbAaGBoKUZTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:13:16 +0000
Message-Id: <20260728071316.B54C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect M2M input format mapping for V4L2_PIX_FMT_XBGR32 causes =
Red and Blue channels to be swapped.
--

--- Patch [4]: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit R=
GB format support ---
commit 14f1b0edd57844d1618923f42c7d14b79400e9d8
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: media: nxp: imx8-isi: Add additional 32-bit RGB format support

This commit adds support for additional 32-bit RGB pixel formats,
including BGRA32, RGBA32, BGRX32, RGBX32, and ARGB2101010. Formats with
an alpha channel are configured to only support capture since the hardware
ignores alpha bits when reading from memory.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 92647ee1e7933..646a7c3d12639 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>  		.color_planes	=3D 1,
>  		.depth		=3D { 32 },
>  		.encoding	=3D MXC_ISI_ENC_RGB,

[ ... ]

> +	}, {
> +		.mbus_code	=3D MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		=3D V4L2_PIX_FMT_RGBX32,
> +		.type		=3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	=3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_out_format	=3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	=3D 1,
> +		.color_planes	=3D 1,
> +		.depth		=3D { 32 },
> +		.encoding	=3D MXC_ISI_ENC_RGB,

[Severity: High]
This is a pre-existing issue, but I noticed the newly added
V4L2_PIX_FMT_RGBX32 format maps its isi_in_format to
CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8. This happens to be the exact same mapping
used for the pre-existing V4L2_PIX_FMT_XBGR32 format.

Since V4L2_PIX_FMT_XBGR32 and V4L2_PIX_FMT_RGBX32 have swapped Red and
Blue byte orders in memory, they shouldn't map to the same hardware input
format.

Does the pre-existing V4L2_PIX_FMT_XBGR32 format in mxc_isi_formats
incorrectly use CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8 instead of
CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8? This would cause the Red and Blue channels
to be swapped when a userspace application uses V4L2_PIX_FMT_XBGR32 for the
M2M output queue.

> +	}, {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-isi-v5-0-1=
d22ab91602a@oss.nxp.com?part=3D4
