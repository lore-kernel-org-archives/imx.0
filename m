Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F63B5E07
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435287; cv=none; b=MsxK5BTLFxOruHAe5L0JP2XqKRmVvULafIMsFmphf9LS50LtEmNwID6GymYzwnpOg/qp//tLGl8rotdGG2IvXuCsQF3GHJOBnPr/OnwbxLrNKVclvvps6DkfqP1kLCtIvPG28pnrgsYiTyA7e7l5II3TcDA+952usN/wlhp30nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435287; c=relaxed/simple;
	bh=F6+Om4p+4oo6ZFQCdI73ewqN7GtwaTrmcvQiBnOu/Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV92xpcVOCnOEXYA5g6Y4kvH5SI4eedWqnQ2eyUzjpCxgnOBZuIGAIwh72wNo9aHTh2GKCt3JuPBM2ROgurv/GZt/hCfkHWFJ9iycvCkQTQM3/HuP3tsp3nK/cIppgyjeiOBMZVYUV8zcKnlag0Zj8BR2bto9RC71+FVejkt5/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LFQS8PGv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LFQS8PGv"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18411E4;
	Thu, 30 Jul 2026 20:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785435215;
	bh=F6+Om4p+4oo6ZFQCdI73ewqN7GtwaTrmcvQiBnOu/Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFQS8PGvLUXcVO9hXUO7yjUvuMrfoYeFfqgPRhlZA1/M5CacOvTHFAttRNwEJMr4V
	 uTm2W/bVzaPnN3S+Xa71H+xLOjeNJ+D/iLefMGf2TnlItELijO0xfBy41cjbQH6izR
	 Ug7vW3uOvgFEElhDlwMuG8XkERfjmD2vZ+RMtrCM=
Date: Thu, 30 Jul 2026 21:14:40 +0300
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
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
Message-ID: <20260730181440.GA1600813@killaraus.ideasonboard.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Tue, Jul 28, 2026 at 02:58:56PM +0800, Guoniu Zhou wrote:
> Use BIT_ULL() instead of BIT() for u64 stream masks to avoid incorrect
> results on 32-bit architectures when stream IDs are 32 or greater.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org

I'm not sure this deserves being backported, as streams IDs won't be
larger than 31 in normal use cases, but it doesn't hurt.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..9db9c6e55c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -157,10 +157,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
>  	 */
>  	for_each_active_route(&state->routing, route) {
>  		if (route->source_pad != source_pad ||
> -		    !(source_streams & BIT(route->source_stream)))
> +		    !(source_streams & BIT_ULL(route->source_stream)))
>  			continue;
>  
> -		sink_streams |= BIT(route->sink_stream);
> +		sink_streams |= BIT_ULL(route->sink_stream);
>  		sink_pad = route->sink_pad;
>  	}
>  

-- 
Regards,

Laurent Pinchart
