Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAC2F5A29
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515506; cv=none; b=XRGwwEnKZd9fu2bz9cg+WPMNxzT7Akogtr1qkXOkWBEh41LPlUxRGOSxfRLCFbixV7nsfshWrTw0BuXFB2KWKR6S7lMxpSaIc+r4OL81IMpjRiRsJcGEelWrUIDyuRefharwSezpmeoRKULZ97CJooNwGdnhMNa5a0F44YOn3uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515506; c=relaxed/simple;
	bh=Q2z7nIl9Zoe/83NJvE1/x3WCuB6ACYFQkU+mBKqbubU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfKe2ow856ZcQyUucKoTzvCmjP3xI1kshWc8WAwe6q2ilEtqj/zX1e0xJS6NdtZoPbrV5fw0oBGqhPI0MGPBQROqAQA1woTqxrf4gOSJh0m68TijigNJigXm9hES95M1Alvcm/OU8qosSkrD5iDt++XjcaFFlR/BFxSzn6TLKFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vkKVLOOl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vkKVLOOl"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CECCAF90;
	Thu, 26 Mar 2026 09:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774515423;
	bh=Q2z7nIl9Zoe/83NJvE1/x3WCuB6ACYFQkU+mBKqbubU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vkKVLOOlHLE3wSuMiYkfrrBCYD3tc+A0g2WIsGFOY7JCZMxsqpolgMrhXVdb0x4+r
	 SMp/DGTgBsYtx9TbFzol6XviLPVgJx+w9hlBtyHCyWgHgIdplETSXdBrgXEaT3V1eD
	 qDIEoQBl8EJrbwbPDY12yMEX8gEsuiWQQP2wBVxs=
Date: Thu, 26 Mar 2026 10:58:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gilles Talis <gilles.talis@gmail.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Ray Chang <ray.chang@technexion.com>,
	Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Josua Mayer <josua@solid-run.com>,
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Message-ID: <20260326085820.GA2770072@killaraus.ideasonboard.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
 <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>

On Thu, Mar 26, 2026 at 03:28:13PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> there might be interrupt storm for this board. Need to set PAD PUE and PU
> together to make pull up work properly.
> 
> Fixes: a009c0c66ecb4 ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> index 3cdb0bc0ab721709fc892931ea00a538ec6216ff..c3f7daa773eaf335deb6cc976a5e120abdae5967 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
> @@ -174,7 +174,7 @@ pmic: pmic@25 {
>  		pinctrl-0 = <&pmic_pins>;
>  		pinctrl-names = "default";
>  		interrupt-parent = <&gpio1>;
> -		interrupts = <3 GPIO_ACTIVE_LOW>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;

This is a good change, but it should be mentioned in the commit message,
or split to a separate patch. Same for other patches in this series
where you make the same change.

>  		nxp,i2c-lt-enable;
>  
>  		regulators {
> @@ -417,7 +417,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x160
>  
>  	pmic_pins: pinctrl-pmic-grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
>  		>;
>  	};
>  

-- 
Regards,

Laurent Pinchart
