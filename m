Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428ED443E21
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568625; cv=none; b=pON4TWw+uACvEJowt4LzRRFFPjlFmobbGY+Zb0Cw+yGY4gIgAZCuPqTwdClHHLah68Gfq7N6zGW3X19gFtFfX+7ALRQtLSXrPBFnmLKsqWzb+BHmtIJ3UbLklb51msORD6hMKMsAsLXVF95cYxIoE+3YYRB+O5pnTWMVxJyor68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568625; c=relaxed/simple;
	bh=QGe2zkMIj440LpHSElWITNhDanOcV8/IoDRy49i+JyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfo6NlQTPMxF/A8m/4ucZKyfSKpBkpEomwTlFpoa/ViIZMu/5LLiGv5BjQHww3nQjaGrmEcnc1WNOo9T+l8o+FuAbgxsiIjSa3zeylfmgfKOV5MQQfEJaO9FnO7Ho3BYeWvK6j/qt22oZsjhUjsQ7FlDDMbX1yr0Z9XwS4scuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ouMjBkc5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ouMjBkc5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89341289;
	Mon, 20 Jul 2026 19:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784568557;
	bh=QGe2zkMIj440LpHSElWITNhDanOcV8/IoDRy49i+JyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouMjBkc59JtGChjTnDsswVYyEJSyCRbjalQhJdaN34nCXHbFohltcioWP/JMxhsal
	 bePv8o/AjQ4CZoJ65Ls1UN0jHejP206L88hFImIS9cYZz6CcGyu+Rl0eubedn6I6Zh
	 GrDv1gzo+xSap+2UCFQT7cYfnBURLaysr94tGwA4=
Date: Mon, 20 Jul 2026 20:30:14 +0300
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
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: nxp: imx8-isi: Fix stream ID validation
 bypass in crossbar routing
Message-ID: <20260720173014.GA50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:03AM +0800, Guoniu Zhou wrote:
> The crossbar routing validation has a critical bug where it validates
> the wrong routing table, allowing userspace to bypass validation entirely.
> 
> The __mxc_isi_crossbar_set_routing() function is called to validate and
> apply a new routing table from userspace. However, the validation loop
> iterates over state->routing (the currently active routing table) instead
> of the routing parameter (the new table being validated):
> 
>     for_each_active_route(&state->routing, route) {
> 
> This means userspace can submit any invalid routing configuration and it
> will pass validation as long as the currently active routing is valid.
> This is a security issue as it allows userspace to configure routes that
> violate hardware constraints, potentially causing undefined hardware
> behavior.
> 
> Fix by validating the routing table that will actually be applied.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Split v1 patch 1/5 into two patches: this patch fixes the core
>   for_each_active_route() bug, next patch adds additional stream
>   validation (Frank Li)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index c580c831972e..84871bceb31d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -107,7 +107,7 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  		return ret;
>  
>  	/* The memory input can be routed to the first pipeline only. */
> -	for_each_active_route(&state->routing, route) {
> +	for_each_active_route(routing, route) {
>  		if (route->sink_pad == xbar->num_sinks - 1 &&
>  		    route->source_pad != xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,
> 

-- 
Regards,

Laurent Pinchart
