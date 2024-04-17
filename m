Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5913C8EA
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354474; cv=none; b=N8zenmR+E80m5hWGwzR43oTKGV0nh0t6qIjHZtZP4SDvZwluMVwS7FPDQgDTTRaY5EWIVEeqDhhisoDZElLR+jBhxXqKc1MLaNfjukbAW3tw3PL/qIOaVyajdCAdQ4LBLYMGI+mnC/UNXJkssWDzzRB9elfwo+5hHAnJDUGhC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354474; c=relaxed/simple;
	bh=iDWuzD3inCfODBkWjMmHehtkg7fsYRDRg5Yj+P1zeAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBAHg8cSgz/ipTTjNbojv+RsNNO2IWlqCAOnQJnrefOK5rXBSyEigjafQGitTZSsHCpoXAATVQMSoLEBzYhPglhzg7UoNo2Rc0r9h5InjesMyqblwp9GQhX7pznUmrwh6LuBSI8sVLupY+7Jnbb0s7LJauz21O0rHONDNN+lPkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1rx3lH-0008Rr-FI; Wed, 17 Apr 2024 13:47:35 +0200
Message-ID: <4fdb7940-02ce-45bd-ab2d-f43c02b16b2d@pengutronix.de>
Date: Wed, 17 Apr 2024 13:47:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Align both CSI2 pixel clock
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Peng Fan <peng.fan@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev
References: <20240417114231.7044-1-marex@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20240417114231.7044-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 17.04.24 13:42, Marek Vasut wrote:
> Configure both CSI2 clock-frequency and assigned-clock-rates
> the same way. There does not seem to be any reason for keeping
> the two CSI2 pixel clock set to different frequencies.
> 
> This also reduces first CSI2 clock from overdrive mode
> frequency which is 500 MHz down below the regular mode
> frequency of 400 MHz.
> 
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,
Ahmad

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
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
> V3: - Fix up clock-frequency to 266 MHz as well, update commit message
>     - Add RB from Peng and Alexander, but maybe those need to be updated?
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 1bb96e96639f2..b92abb5a5c536 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1657,7 +1657,7 @@ mipi_csi_0: csi@32e40000 {
>  				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
>  				reg = <0x32e40000 0x10000>;
>  				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> -				clock-frequency = <500000000>;
> +				clock-frequency = <266000000>;
>  				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
>  					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
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

