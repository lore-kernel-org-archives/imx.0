Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263F18B0A
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582133; cv=none; b=UFcmDxH1jAcon2kpaYtCps66iZl9l5T33Qt1o62yLLncbwwpWkrhXtGgUwdt9PM4s6YaLqA7uhxWWcjzvHvUi8CRdshZKewQU5cvulkML8OP5gaHnRAkMIUvQUEnN9AWXzpX2PstB2U2cDykdS+IgkfE4cOZA+gNfhYTNDj46eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582133; c=relaxed/simple;
	bh=fwkvO1BlTuFLr5TUGCzW1d48NNwgkil0zWOpeTLxt3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGNKzM9erkJRIb9C2gh0hUuFtrFtxQGymuJSXBg2J9ArMBYGQH9qLYMKrDG8YnEJx3ru/dlCGUbq2XbeeXBx2hQ5Q5FfRmvHuPJQYWyUdEteGT7T2u4Jb0px6IWlXrYqA+PpstGZ7ICrrk8sv8w6k7bDkOAPbUqVkXdBRVK4a3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a2vj4h5f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a2vj4h5f"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16078C1;
	Mon, 20 Jul 2026 23:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784582071;
	bh=fwkvO1BlTuFLr5TUGCzW1d48NNwgkil0zWOpeTLxt3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2vj4h5fb+jeY11Sxl4+xM2vB02xWxZmhqISZwnk38K2AFshkUYgo8wH3mDnooQOq
	 YcPww7sOzpbMtaR9spni/jA6FAE4mE5RzUxpDo2YTtMP5AMrEZcyEny99fcc3CZAfO
	 FvXoo2M2GGPJWnBY6tZJW+RUZO48CwPUybAMuWoU=
Date: Tue, 21 Jul 2026 00:15:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 4/6] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Message-ID: <20260720211528.GE50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-4-45845bc5d4fa@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-4-45845bc5d4fa@oss.nxp.com>

Hello Guoniu, Laurentiu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:06AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
> 
> These formats are commonly used by high-end image sensors that output
> 16-bit raw data, enabling the ISI to process and capture full dynamic
> range from such sensors.

It's not really high-end any more :-) Lots of sensors can output RAW16
today.

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 2d0843c86534..e58925d71164 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
>  		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
>  				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
>  		.encoding	= MXC_ISI_ENC_RAW,

While at it, could you please also add support for
MEDIA_BUS_FMT_Y16_1X16, for 16-bit monochrome sensors (here and in
mxc_isi_formats) ? With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
> +				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index fe4adfa3a1f0..5eb448f4c26f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.color_planes	= 1,
>  		.depth		= { 16 },
>  		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SBGGR16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGBRG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SGRBG16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.fourcc		= V4L2_PIX_FMT_SRGGB16,
> +		.type		= MXC_ISI_VIDEO_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 16 },
> +		.encoding	= MXC_ISI_ENC_RAW,
>  	},
>  	/* JPEG */
>  	{

-- 
Regards,

Laurent Pinchart
