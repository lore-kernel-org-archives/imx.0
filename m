Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB013C198A
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880227; cv=none; b=NaAQUduddAIg5h48twbOhnBGRcPUylaue9Szilu2zTyjce4Uo8pcR+RlxlMzOA5i1lvrFqVLfZXa+VkrxCp3RwEuAB0T5ulFTmPVbq3HCN6gdqrh/2k7MZsdwMCA5lG4I+JmQgTW+wJu9IYwCo6molBflM4GycQoPWOZePpSflU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880227; c=relaxed/simple;
	bh=OXqYVDP2nCSF1oxE6eP4jbXzFMLU2Rri6qfrmtjbSZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UagFCebvyVQqn7JDeL4jE428Luazxq3bVKAx9F3zcLDZAEoMbgJTuaqvwTtpgWMqvzCSeJB0sveWPAUpz9Nl4nS1YJziDgzdYgQ5ZNoF35h21m2L4UFlW++P3WRW7po9/zdIU6yVhAQ5ai42a0WPE1FE6sBy/dF0qc+Yn7K8FJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ow3M6BFY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow3M6BFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998CE1F000E9;
	Fri, 24 Jul 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880222;
	bh=UHp8rlXVB8UDTB8NzIYgyCjuESg6FU0ZVRJPfd+aWPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ow3M6BFYFovvj5T1yxuYZhY/eQHjPuepzbyb/Zj23E9qRmYhoReFHhNL9nXWG95cf
	 MrF9XRcnlXFWBf//aIKOCpeyaPNXE37rBkdp7JcwsDV5/qlStIDXrAWNBUlwMfDjkq
	 vps0W2LW8ulWEi0b5QMDOl3WZge+bji9ONk0IvIExriwh5/wEtfjkTl+y02Q3nQ+Wt
	 pufDaL7x4RPSUGicoOy8HcYiWVKtefmtLk5Ht8CPQWEDibAQSmN9GPsfI775h0dP+X
	 HwaZ3ejrC338fa7HQmfdc5ByUeuoEnVT6+tPzePO+iSxxN2woxAI01BcKz+Sag2+zl
	 Ve8IyES4lqBIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260724-isi-v4-3-27df7b5f6060@oss.nxp.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
 <20260724-isi-v4-3-27df7b5f6060@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:03:42 +0000
Message-Id: <20260724080342.998CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] V4L2_PIX_FMT_RGBX32 and V4L2_PIX_FMT_XBGR32 share the same isi_in_=
format, which will result in swapped color channels during M2M reads.
--

--- Patch [3]: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit R=
GB format support ---
commit 60dac66057b0040d017034c0952f79ec30cec366
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Add additional 32-bit RGB format support

This commit adds support for additional 32-bit RGB pixel formats (BGRA32,
RGBA32, BGRX32, RGBX32, ARGB2101010) to the i.MX8 ISI driver. Formats with
an alpha channel only support capture, as the ISI ignores alpha bits when
reading from memory.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
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
Does this mapping for V4L2_PIX_FMT_RGBX32 swap the red and blue channels
during M2M reads?

The newly added V4L2_PIX_FMT_RGBX32 format (memory layout R,G,B,X) maps to
CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8 for DMA reads.

However, earlier in mxc_isi_formats[], the pre-existing V4L2_PIX_FMT_XBGR32
format (memory layout B,G,R,X) uses this exact same configuration:

	{
		.mbus_code	=3D MEDIA_BUS_FMT_RGB888_1X24,
		.fourcc		=3D V4L2_PIX_FMT_XBGR32,
		.type		=3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
				| MXC_ISI_VIDEO_M2M_CAP,
		.isi_in_format	=3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
        ...
	}

Since these two formats have opposite red and blue channel locations in
memory, can the hardware DMA controller correctly interpret both layouts
using the identical input format configuration?=20

It looks like this could result in corrupted color conversions for one of=20
these formats during M2M operations.

> +		.isi_out_format	=3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	=3D 1,
> +		.color_planes	=3D 1,
> +		.depth		=3D { 32 },
> +		.encoding	=3D MXC_ISI_ENC_RGB,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-isi-v4-0-2=
7df7b5f6060@oss.nxp.com?part=3D3
