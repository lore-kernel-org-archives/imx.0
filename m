Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D7374E5A
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 00:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784593306; cv=none; b=J6PIbbiieEASHWFQf/sKPknyOeT6rWC03K2VjRI2aPhijMwpm0bGTHjdLWzNB9Ys8jdn063NvHG1VczjspmUBg8sFVP4UetDoNfP0TwKa6O41cyC7Ewp0KWXU9TT/q0h2itAMr3K32FtFPVHP9wmfbF/yKi0ehg4Mqxi97tQYo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784593306; c=relaxed/simple;
	bh=jJrpOSbeTf34j9iiFEHrzsvZoGTsWVLoBLS5eWxjPqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXcP9ks77wlvb7UNltvRjFDfUAVaCV6al4RL11T0ewni9hWTHZuang/WTUh/o8YZ+JJRyAixhkfbLLmIra9YRuAVjVG4o37Zi+UrP6U3Y56QXv0Br04rRctFrsFy7fO2ICd0Q9vSQDXUpigXw3F2OdcYVdwKmYaQSdgGNmv67gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wRH/Nrkk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wRH/Nrkk"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66956517;
	Tue, 21 Jul 2026 02:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784593243;
	bh=jJrpOSbeTf34j9iiFEHrzsvZoGTsWVLoBLS5eWxjPqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRH/NrkkbXTQKpCZr5joGqIY/jc1bbUUolWjSU06RWrOQFhhgjkqvxOoxVtq53mUs
	 OAkrPlxZK9EID9WZ/d0VCiVQKx/OGV2L2/wqfqUxwPLRbfz6JiTQTMhDF3e5cpUZI8
	 UE1H+hz66YJp6EQMPIqE43ESQAOxty8nvgQxIgts=
Date: Tue, 21 Jul 2026 03:21:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
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
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 6/6] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Message-ID: <20260721002141.GF50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-6-45845bc5d4fa@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-6-45845bc5d4fa@oss.nxp.com>

Hi Guoniu, Robert,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:08AM +0800, Guoniu Zhou wrote:
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010) and extend existing ABGR32 format with
> full memory-to-memory capabilities to meet Android requirements.

What are those Android requirements ?

> All formats support capture, M2M input, and M2M output operations,
> enabling complete format conversion pipelines.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 59 +++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 05b51b98344b..ef638af350fe 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -160,12 +160,69 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
>  		.fourcc		= V4L2_PIX_FMT_ABGR32,
> -		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,

This doesn't seem right. The value is the same as for
V4L2_PIX_FMT_XBGR32. As far as I understand, the ISI will ignore the
alpha bits (MSBs in the 32-bit data).

This is why the V4L2_PIX_FMT_ABGR32 format doesn't set
MXC_ISI_VIDEO_M2M_OUT: to be supported as an output format (input to the
ISI), we would need a hardware mode where the alpha bits are read from
memory and used by the ISI. I recommend dropping this part of the patch.

>  		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 32 },
>  		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,

Same comment here, this format should not have MXC_ISI_VIDEO_M2M_OUT
set.

> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,

Same here too.

> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,

The rest looks good. I have tested all the new formats, both on the
input and output side, and have not noticed any issue.

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	},
>  	/*
>  	 * RAW formats

-- 
Regards,

Laurent Pinchart
