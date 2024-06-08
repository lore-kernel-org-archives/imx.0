Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290C17B500
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717865462; cv=none; b=d0WQA0TFFsQjX1Go3u0yEEGCgID1zrAp366AXi8z7gLLGK60HYupEeJUW9pRXk1JTP/w5QprF71l7YjgdhATUgriWi7B2AlZqoDlrS2vJaNZ5MYHpKvUuRHfEClVrVGsCxX5Q0NeXSaBkwbV6AyJZIDU43g/zVEvbpMIpu9e54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717865462; c=relaxed/simple;
	bh=NR+U+CNKQauqseXIio4VAlyFeO1ifNiLWsnsAqPQSkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyTHtdE9SnjqutA6TXLAowWeZ0k0HWgPKIdqg2H8Yh83NVVIhJYOnRYnNIqSZGeqyA4dlhhJnnUJP8fOfmqaChO08PgNCJ1iAUDepcSCJAxTguxv6bbKhE5bU2hybOaWOZ9llSiGVH9Gl8tpkwSN0d6F555vDd7KBYU4ODdQRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PyWZaVPb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PyWZaVPb"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB73E4CA;
	Sat,  8 Jun 2024 18:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717865449;
	bh=NR+U+CNKQauqseXIio4VAlyFeO1ifNiLWsnsAqPQSkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyWZaVPb8FZDImIFRChwkX7UjSx5WbPxtmSjdCnMoHRDfJpXWYGvTq7bgRO70AuaF
	 T+B9tL4FpoW/7w+FfppV6ZJR1tUGDnfCStDg8ovkRuguoP/6vSMZS22PeFV98l1haz
	 ekRBaRQThh66wrzZdZF7G0LUsWt1zle/oeGUJ6Ug=
Date: Sat, 8 Jun 2024 19:50:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	Harshesh Valera <harshesh.v@variscite.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Nate Drude <nate.d@variscite.com>, Shawn Guo <shawnguo@kernel.org>,
	Marco Contenti <marco.c@variscite.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: freescale: Add support for the
 Variscite DART-MX8M-PLUS SoM
Message-ID: <20240608165040.GF18479@pendragon.ideasonboard.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
 <20231025165058.31697-3-laurent.pinchart@ideasonboard.com>
 <962e1d33-bc97-6bf8-b94d-581762dd6afa@pengutronix.de>
 <7046940b-854c-c4c0-461a-c817484f5d50@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7046940b-854c-c4c0-461a-c817484f5d50@pengutronix.de>

On Mon, Nov 27, 2023 at 07:13:37AM +0100, Ahmad Fatoum wrote:
> On 27.11.23 06:58, Ahmad Fatoum wrote:
> > Hello Laurent,
> 
> Ah, I see now, that this series was about to be merged. I missed it at first,
> because of the MAINTAINERS entry losing a F:, which I now sent a fix for.
> 
> Anyways, should you resend to fix the binding errors, you could address some
> of the nitpicks, but I found nothing critical.

As the series hasn't been merged yet, I'll submit a v3 that addresses
your comments. Thanks for the detailed review.

> > On 25.10.23 18:50, Laurent Pinchart wrote:
> >> +	reg_eqos_phy: regulator-eqos-phy {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "eqos-phy";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +		regulator-always-on;
> > 
> > Apparently, https://lore.kernel.org/all/20230721110345.3925719-1-m.felsch@pengutronix.de/
> > didn't make it upstream. Perhaps you mentioning that you could use this would help get
> > it unstuck? :)
> > 
> >> +&eqos {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&pinctrl_eqos>;
> >> +	phy-mode = "rgmii";
> >> +	phy-handle = <&ethphy0>;
> >> +	status = "okay";
> >> +
> >> +	mdio {
> >> +		compatible = "snps,dwmac-mdio";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		ethphy0: ethernet-phy@0 {
> >> +			compatible = "ethernet-phy-ieee802.3-c22";
> >> +			reg = <0>;
> >> +			eee-broken-1000t;
> >> +			reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> > 
> > Nitpick: Separate pinctrl entry for PHY GPIOs that's added to the PHY node?
> > Makes it easier to check that all used signals are indeed muxed.
> > 
> >> +	pmic@25 {
> >> +		compatible = "nxp,pca9450c";
> >> +		reg = <0x25>;
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&pinctrl_pmic>;
> >> +		interrupt-parent = <&gpio1>;
> >> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> >> +
> >> +		regulators {
> >> +			BUCK1 {
> >> +				regulator-name = "BUCK1";
> >> +				regulator-min-microvolt = <600000>;
> >> +				regulator-max-microvolt = <2187500>;
> > 
> > Nitpick: These may be the limits of what the BUCK can output, but they
> > don't look like a safe operating range for the board. The Linux driver already
> > has ranges hardcoded to cover what's possible by the hardware, so if you specify
> > regulator range here, it should pertain to what the board and SoC are designed
> > to handle.
> > 
> >> +/* eMMC */
> >> +&usdhc3 {
> >> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> >> +	pinctrl-0 = <&pinctrl_usdhc3>;
> >> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> >> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> >> +	bus-width = <8>;
> >> +	non-removable;
> > 
> > no-sd
> > no-sdio
> > 
> > may give you a tiny bit of speedup during probe, if you know that there will
> > always be an eMMC here.
> > 
> >> +	pinctrl_i2c1: i2c1grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c2
> >> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
> >> +		>;
> >> +	};
> >> +
> >> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14				0x1c2
> >> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15				0x1c2
> > 
> > This surprises me. I'd expect that the SION bit needs to be set for GPIO bus recovery.

-- 
Regards,

Laurent Pinchart
