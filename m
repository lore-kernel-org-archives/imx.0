Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8F3C5DD4
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798843; cv=none; b=CyuHqVBOZIQEY3m5s1tEz6NaMLFYtHNPOvLAVy/COnJVvYp+IodBCSlSB1EsVD9BgSjZVuqGucDPhqKUBAdbHRQFpLSUJQ2bOqI3tK6Krm9ThJQHEDEYhKWXjQkLSljhG1blhehOK9g0gJ+b8ezfkMVGjq4I0fZh8lH0SAGTT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798843; c=relaxed/simple;
	bh=l4DUqtFCv/L6Eqlk7vZmyCYo+RLW6OCVaNVAvSA19x0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Znb2l5NFUJvr6VK7DoamTZYmuAam+Hm8K1o2d5g/QA7WG7taKfUqFTCLSUuTfmKYEG/Tn0W/acex5TXRyNaP3uo3AV04e6RTxDWtwz86C4Y/NYuZDLZlgBU9iO89sayBL05wuPOCEUsM4/tCWQcRVMsaOXkEJlYMYUFfzNTDSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271DE1F000E9;
	Thu, 23 Jul 2026 09:27:22 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: media-ci@linuxtv.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260723-isi-v3-3-594919eae847@oss.nxp.com>
References: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
 <20260723-isi-v3-3-594919eae847@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:27:21 +0000
Message-Id: <20260723092722.271DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware format configuration collision between V4L2_PIX_FMT_RGBX3=
2 and V4L2_PIX_FMT_XBGR32 causing color swap in M2M reads.
--

--- Patch [3]: [PATCH v3 3/3] media: nxp: imx8-isi: Add additional 32-bit R=
GB format support ---
commit 02b3513d44dce2138fe49ccef7f4dc91a18d3043
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Add additional 32-bit RGB format support

Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
BGRX32, RGBX32, ARGB2101010).

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 92647ee1e7933..646a7c3d12639 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
[ ... ]
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
[ ... ]
> +	}, {
> +		.mbus_code	=3D MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		=3D V4L2_PIX_FMT_RGBX32,
> +		.type		=3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	=3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,

[Severity: High]
This is a pre-existing issue, but does mapping V4L2_PIX_FMT_RGBX32 to the s=
ame
hardware input format (CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8) as V4L2_PIX_FMT_XBG=
R32
cause a color swap during M2M reads?

Since V4L2_PIX_FMT_XBGR32 (memory layout: [B, G, R, X]) and V4L2_PIX_FMT_RG=
BX32
(memory layout: [R, G, B, X]) have opposite red and blue channel positions =
in
memory, mapping both to the exact same hardware input configuration
structurally guarantees that one of these formats will suffer from a silent
color swap when read by the hardware.

> +		.isi_out_format	=3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	=3D 1,
> +		.color_planes	=3D 1,
> +		.depth		=3D { 32 },
> +		.encoding	=3D MXC_ISI_ENC_RGB,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-isi-v3-0-5=
94919eae847@oss.nxp.com?part=3D3
