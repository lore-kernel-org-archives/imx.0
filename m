Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77ED17335A
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712349787; cv=none; b=UQS4sPkZxh+gwhC0iL6FpEzjTrSg0D7x90Pm9NNoMxIYYyp4bJVesGI9OLKaqCWYaEGDJovP0pD7Z+queiZpJH8LKFcTCfVEV6XbYdZJuJbBghqIsaRmz8pQam1hmuFpakuN39KjoxsBbJvwuGi3Ka5PukwYNwLAO9uhW89/xko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712349787; c=relaxed/simple;
	bh=kIeKCdSrGc8xYy96lsN4JtpNY4g0x9ttPiWqATX+mTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQdqkNIrrQUekjaG8nt2+nOoGhpMIXnc0H0fDMkZ8SAkPaOynTisd78iB4LTMuRin02vGidPWrPWqMKzG0GlbwOMYE8cziXtCavnlJBlGQI21w+deuGHkDtByaAvFUhCRibR/MH+jS10IXM6PQNf4FAMLncyFOhHtPTpvOeEQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MXPtaPs7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MXPtaPs7"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2ECEACB;
	Fri,  5 Apr 2024 22:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712349743;
	bh=kIeKCdSrGc8xYy96lsN4JtpNY4g0x9ttPiWqATX+mTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXPtaPs7pQEeWjC5ZoADu4nTb4jS+XCb0Aw58F4QOHGGICf1S8S8AjVe0nFvh2D1+
	 lkT0P8Yvqv07WSKinBHuBleh+/cOnU9rfiErm6oEU59xSOegN6qmAjac7qt7nyTZH8
	 v7rsOHLRPZ5uC2csh4QmfVnnHexmuVIn0V8VJhl4=
Date: Fri, 5 Apr 2024 23:42:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Align both CSI2 pixel clock
Message-ID: <20240405204251.GE12507@pendragon.ideasonboard.com>
References: <20240405202243.46278-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240405202243.46278-1-marex@denx.de>

Hi Marek,

(CC'ing Adam)

Thank you for the patch.

On Fri, Apr 05, 2024 at 10:22:26PM +0200, Marek Vasut wrote:
> Configure both CSI2 assigned-clock-rates the same way.
> There does not seem to be any reason for keeping the
> two CSI2 pixel clock set to different frequencies.

There's an issue when using two cameras concurrently. This has been
discussed some time ago on the linux-media mailing list, see [1]. Adam
knows more than I do on this topic.

[1] https://lore.kernel.org/linux-media/CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com/

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Paul Elder <paul.elder@ideasonboard.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 1bb96e96639f2..2e9ce0c3a9815 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1703,7 +1703,7 @@ mipi_csi_1: csi@32e50000 {
>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_CLK_24M>;
> -				assigned-clock-rates = <266000000>;
> +				assigned-clock-rates = <500000000>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
>  				status = "disabled";
>  

-- 
Regards,

Laurent Pinchart
