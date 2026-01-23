Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E512D8DCF;
	Fri, 23 Jan 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158957; cv=none; b=Tr/na45MqfabIDKUbSd5iSH3BJ8b23Xf5o3+jZllflDbZASy7vw+IGZkKm24NrVpyIehtDy/zhKgkouVMeX3pWkCOPMxE05dpBNtUQgRes34q8j7J38E9SqQTRL73Ig0YTBRDYuvlwRKbSj9b5jld2tKR7WodvxlUxJ+oC5hTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158957; c=relaxed/simple;
	bh=PIa/I7R0BydZfomtSmkapB5g2iSIYkR0v+oP3tOPoZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzgEYwfeGRh2/mnxypmHwvxmKsO9kuJMEqi1deax+a07CIJQCniO1zTQLuJds7t/EZS9ucXfQuTjVHd/76YTZH7HFoJXw8HFPNAKQ7k/0Sb9bf6dksWQGWTJ1iyZ4usRCZVlTpWS5ar7O0iF3OWtKXBvXdzx+QgV5vwt7kdvWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n735dr/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n735dr/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0667C4CEF1;
	Fri, 23 Jan 2026 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769158957;
	bh=PIa/I7R0BydZfomtSmkapB5g2iSIYkR0v+oP3tOPoZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n735dr/6ogETtT6sqt4DE/Ng81anX6mk40ARL40MDPFpZQnr7lRf41GaGu+4KqdmI
	 Etay7mXNqlH3I99fjMPqHlP64X4sxVRfD+2W98IHZTBkTttfsep85w95vqqk+k1Ghp
	 bMarHx8y1sHTY0ap+UTco0SenlfReRl5Y97jI+GoxuZLFhwu2fANuBZgtC3NM4PTmE
	 VIV0wp/pniVEsx7qbaWh220t+HGkXt5oQ9ArDTZcMQcY4YjNdZuU86SMt4/wnqdgBd
	 gVZYVpSXhf8zUAGSSV4izXhrCnh3G9l70BI1EhRCORqmAgHkTIZRDjg47fV2lQaPLd
	 Lu0Y4u2xQRNwQ==
Date: Fri, 23 Jan 2026 10:02:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
	y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
	primoz.fiser@norik.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
Message-ID: <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-3-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123024448.3909345-3-sherry.sun@nxp.com>

On Fri, Jan 23, 2026 at 10:44:48AM +0800, Sherry Sun wrote:
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences.
> 
> Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> 11x11 EVK board.
> 
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
> 
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..d0ea746c59b8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..f09587dc74f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx93-11x11-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> +
> +	/delete-node/ regulator-m2-pwr;

If you remove nodes then clearly you do not share a common design, thus
you should not include other DTSI... and definitely even more confusing
to include other DTS.

> +
> +	sound-bt-sco {
> +		status = "disabled";
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";

Kind of same here.

It's poor practice to include DTS inside DTS, some platforms disallow
this. Is it acceptable pattern in NXP/iMX?

> +	};
> +};
> +
> +&pcal6524 {
> +	/delete-node/ m2-pcm-level-shifter-hog;

Why do you remove so much?

> +};
> +
> +&reg_usdhc3_vmmc {
> +	/delete-property/ vin-supply;

Do you understand how inclusion works? You claim here you have common
parts. Removing them means they are not common.

Best regards,
Krzysztof

