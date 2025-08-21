Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074502E5B3C
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802274; cv=none; b=M1U330LU9IrFa9YU8W1llbvm5t1eQEuqOlP2jiHrsNxxQ19cE4uX6HGNrfDa9ApUBvHO2yRAyOzhkgN3Rs1PQ8Wpu2mFiUk2I+zeJy7qhwHVmwdBNEbYOexBv2qo6akBxx9UnW0esH/H22+TLFyFvVHfkUGCzOrgR8M5+wlrZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802274; c=relaxed/simple;
	bh=WfEAcJ0ggpc2omENZVpBGZxma8qNQPYbtD+Q6JaezKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu13IknIYPJ3S4puwTn2zrDFyliH6RQ3KJjaHxejKJU27WYIux1+9iXhoZbJa1A6qGdCCptGpgbdOup6Tc4JEOmRQW7F14RooFacJr8iKCLzUu46xSDUEpFx+XqkAvrtni5mF+sE9TPjjed26U2iLk3cBaWlDgVsr1rQhyFssxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qKxU0Lzo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qKxU0Lzo"
Received: from ideasonboard.com (mob-5-90-51-28.net.vodafone.it [5.90.51.28])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C7756DE;
	Thu, 21 Aug 2025 20:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755802211;
	bh=WfEAcJ0ggpc2omENZVpBGZxma8qNQPYbtD+Q6JaezKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKxU0LzoXsDES1YemgzgBgdzznbXDriaIALnH0PXAnPP1WQw0c7OJdV7NwaCKcq0R
	 v8QNW8YRPzDDtbmjrSaOce1D5t4tUTxwD1eloC98rfp1fhz8xaztBW77I3XhNGcc/5
	 pp+QIa1CyNNlR9rykCL8C9TsFxjTCWrnBkKEHS+c=
Date: Thu, 21 Aug 2025 20:51:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH 4/6] media: rkisp1: Acquire pclk clock on i.MX8MP
Message-ID: <xy4qvgjeu64cjvthi573vzngn6elhnnzgmkyqne2qlfu7hughh@euq6ffzr6tfn>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-5-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Mon, Jun 16, 2025 at 04:11:13AM +0300, Laurent Pinchart wrote:
> The ISP instances in the NXP i.MX8MP need the input pixel clock to be
> enabled in order to access the HDR stitching registers. The clock should
> ideally be mandatory, but that would break backward compatibility with
> old DT. Try to acquire it as an optional clock instead.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 0788b7a64ae9..fb4ccf497bad 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -584,6 +584,24 @@ static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
>  		return ret;
>
>  	rkisp1->clk_size = info->num_clocks;
> +
> +	/*
> +	 * On i.MX8MP the pclk clock is needed to access the HDR stitching
> +	 * registers, but wasn't required by DT bindings. Try to acquire it as
> +	 * an optional clock to avoid breaking backward compatibility.
> +	 */
> +	if (info->isp_ver == RKISP1_V_IMX8MP) {
> +		struct clk *clk;
> +
> +		clk = devm_clk_get_optional(rkisp1->dev, "pclk");
> +		if (IS_ERR(clk))
> +			return dev_err_probe(rkisp1->dev, PTR_ERR(clk),
> +					     "Failed to acquire pclk clock\n");
> +
> +		if (clk)
> +			rkisp1->clks[rkisp1->clk_size++].clk = clk;

Ah no, we still need rkisp1->clk_size!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> +	}
> +
>  	return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>
>
