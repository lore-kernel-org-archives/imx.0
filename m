Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FE1327E0
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348914; cv=none; b=Sji4x9aBBtXM2PB4IROpX9By12dWzzDa2m+rPBIH3v2oiD5Vbsx+YlIyO6cFhWqa05w+eYgXFsvastLrmvbz7fsEPOO3Vjkuvm5C1qsPjeNdABkSuX2MUusyS4iWcCTfL/iLMsLdLss6ZYfO0BeZd+GHKJK1TeaCgDFrgaHHdxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348914; c=relaxed/simple;
	bh=QGWe+amBAZzWV9gRaAbbm3NPOnMa2F/UdNO4TT/URkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwpzLtImAZM5VMo0JWKdZ8UjslY/bqXxUL/J0RccQpOLIu9tjJF9vs/Nv9aUVcK1xWBIxy50Hic0gKjTRkj5Ib973wmMNbyhE2miQdZ7M2JoJkbit4p2Syj8/X8Ga0dLPkBTkv4qJDihZ0PFfZPwpVEqbkuEaKNcDGMjAKulgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1rx2Jf-0006pF-HD; Wed, 17 Apr 2024 12:14:59 +0200
Message-ID: <352388ee-a267-4c1f-b968-e1a7709d46ea@pengutronix.de>
Date: Wed, 17 Apr 2024 12:14:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Elder <paul.elder@ideasonboard.com>, imx@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20240416141914.9375-1-marex@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20240416141914.9375-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 16.04.24 16:19, Marek Vasut wrote:
> Configure both CSI2 assigned-clock-rates the same way.
> There does not seem to be any reason for keeping the
> two CSI2 pixel clock set to different frequencies.
> 
> This also reduces first CSI2 clock from overdrive mode
> frequency which is 500 MHz down below the regular mode
> frequency of 400 MHz.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

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
> V2: Align both clock to 266 MHz and update commit message
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 1bb96e96639f2..7883f5c056f4e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_CLK_24M>;
> -				assigned-clock-rates = <500000000>;
> +				assigned-clock-rates = <266000000>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
>  				status = "disabled";
>  

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

