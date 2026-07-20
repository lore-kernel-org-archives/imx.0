Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5F395AE9
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566419; cv=none; b=PnH3gh5LajWoOMHM9JVLU+4H+0EgsQDa86B+NupPKc0mhoPXO3i9WiEUcgfmLRToRnPmZQ08OQ9yaKSBU/aUIQgNGb9qQp1oJRec5OTmq8Obr5M2jNAXDqxnmv7woO2LO1oe2IbDCwhDHbOr0DYa1T7nHv8sdFHQAqEPwR+Jrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566419; c=relaxed/simple;
	bh=r69KWif/WluETzLaObyRwXUP59GDiT0sfR5I8jHTQl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeBQ1g31mKdQU7EAaFH0xjquFi+irzs9GSx+EiKOA9UH9LPjh5pjxhjLheOy3/hFkKwiZkZSeEjdJyjHr6n35EMiE/PgC3DBOR1waf2oE9RJtGnGgngGOyjbhljp2pqE0htcO3h/zQkCdOpiOn/seQts6ukMCxax1lj+DStPlv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fSd3YdkK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fSd3YdkK"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A113270;
	Mon, 20 Jul 2026 18:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784566358;
	bh=r69KWif/WluETzLaObyRwXUP59GDiT0sfR5I8jHTQl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSd3YdkKBtHHk+KYSmbdJ9WdF5PChKyzb2dZ3az35o0PUhNDHLqxGQwWlKmrJgeCf
	 uCXbeUnNxoGTYo1v0KDhdPlCav0OKPB8KgJO5IVwqWuJ41ePhqZCQEJmQYNIJ0AWQl
	 e00Zw4kisruOQvhYPA5aT+WVvt3jPruyWgSJVzy0=
Date: Mon, 20 Jul 2026 19:53:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 1/2] media: imx8-isi: crossbar: Add get_frame_desc
 operation
Message-ID: <20260720165335.GB42426@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <20260521-isi_vc-v5-1-a38eb4fcd58e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-isi_vc-v5-1-a38eb4fcd58e@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, May 21, 2026 at 05:10:04PM +0800, Guoniu Zhou wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Implement the get_frame_desc pad operation for the crossbar subdev using
> the v4l2_subdev_get_frame_desc_passthrough() helper. This allows the
> crossbar to properly propagate frame descriptors from its sink pads to
> its source pads, which is necessary for proper stream configuration in
> multiplexed streams scenarios.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v5:
> - Use v4l2_subdev_get_frame_desc_passthrough helper
> - Rewrote commit message
> 
> Changes in v4:
> - Use %d instead of %u for ret variable in error messages
> - Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
> 
> Changes in v3:
> - New patch added based on feedback from Laurent Pinchart
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 605a45124103..0b593aed618b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -404,6 +404,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
>  	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mxc_isi_crossbar_set_fmt,
> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
>  	.set_routing = mxc_isi_crossbar_set_routing,
>  	.enable_streams = mxc_isi_crossbar_enable_streams,
>  	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
Regards,

Laurent Pinchart
