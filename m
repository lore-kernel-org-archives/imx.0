Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A03517966E
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717863535; cv=none; b=R1zU9UlmFXgy6MPKilh25dJdjp9KVaiIV6xLIpHw7NFp10Ra8z+r6A28v1d4Ct8FwHa/S06dbXGllT4zlr97CJEsfOdaAqQyg1JS4NxFoUBsfR+T+TJWBdgz7+WrY7gxysg1YOjIj3Tm893V+G8b2qKMv1msURW81wnqzYxIRIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717863535; c=relaxed/simple;
	bh=x9Fpv1O9XtaMUh9Z3dvrT8x71mFFi+rG8tC/qZ3WeUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i77M218EfBk1fJLwTl6HzzCieRjILUXXArUYG+1RTsfTcFi+6UGyls+q9HvPDvcxeJaU90JxEJHzOtSQjg/OVOFMfxJE3Ila6Qz6OYGdDu7hdU9YSAr5YsTydZWThxtKTRrdDm5qod2Z4KAU4ZryS8qG1tGzM9brqEEYRwa1onw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zwc3zGBD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zwc3zGBD"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1EE4CA;
	Sat,  8 Jun 2024 18:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717863522;
	bh=x9Fpv1O9XtaMUh9Z3dvrT8x71mFFi+rG8tC/qZ3WeUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zwc3zGBDae4FbzWtxuvhLq0OMXxt9wj664LkS6EY5ivxsW7EheHsa/u0AtaJW6Y3h
	 grihq0No/0heDqmwNpsDGOCvOdESbL/wyswzbW9t9Cr3CpUQX+S54wld516GLZGAh8
	 W/XJrQcNKEky/JVmJUCYGJX1CPJhCgU2DkC4TdPo=
Date: Sat, 8 Jun 2024 19:18:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] arm64: dts: freescale: Add support for the
 Variscite DART-MX8M-PLUS SoM
Message-ID: <20240608161833.GA13794@pendragon.ideasonboard.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
 <20231025165058.31697-3-laurent.pinchart@ideasonboard.com>
 <962e1d33-bc97-6bf8-b94d-581762dd6afa@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <962e1d33-bc97-6bf8-b94d-581762dd6afa@pengutronix.de>

Hi Ahmad,

On Mon, Nov 27, 2023 at 06:58:31AM +0100, Ahmad Fatoum wrote:
> On 25.10.23 18:50, Laurent Pinchart wrote:
> > +	reg_eqos_phy: regulator-eqos-phy {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "eqos-phy";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> 
> Apparently, https://lore.kernel.org/all/20230721110345.3925719-1-m.felsch@pengutronix.de/
> didn't make it upstream. Perhaps you mentioning that you could use this would help get
> it unstuck? :)

I've replied to the series, but I agree with Rob, we need a better
solution. Someone will need to do the work :-)

> > +&eqos {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_eqos>;
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy0>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> > +			eee-broken-1000t;
> > +			reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> 
> Nitpick: Separate pinctrl entry for PHY GPIOs that's added to the PHY node?
> Makes it easier to check that all used signals are indeed muxed.

Fine with me.

> > +	pmic@25 {
> > +		compatible = "nxp,pca9450c";
> > +		reg = <0x25>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_pmic>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		regulators {
> > +			BUCK1 {
> > +				regulator-name = "BUCK1";
> > +				regulator-min-microvolt = <600000>;
> > +				regulator-max-microvolt = <2187500>;
> 
> Nitpick: These may be the limits of what the BUCK can output, but they
> don't look like a safe operating range for the board. The Linux driver already
> has ranges hardcoded to cover what's possible by the hardware, so if you specify
> regulator range here, it should pertain to what the board and SoC are designed
> to handle.

I'll restrict that to [0.85V 0.95V], which are the typical voltages in
nominal and overdrive mode. If someone wants to lower it down to 0.805V
or increase it up to 1.0V, which are the minimum and maximum values
specified in the SoC's operating ranges, they can send a patch. I will
similarly restrict BUCK2 to [0.85V 1.0V].

BUCK4, BUCK5 and BUCK6 are more annoying. There is no public schematics,
and little information in the board's documentation.

For BUCK5, there's a mention in the board's documentation that indicates
it powers NVCC_SAI1_SAI5 with 1.8V by default before LDO4 takes over. It
is further set to 1.85V in U-Boot with a comment that states

	/* Set BUCK5 voltage to 1.85V to fix Ethernet PHY reset */
	if (var_detect_board_id() == BOARD_ID_DART)
		pmic_reg_write(p, PCA9450_BUCK5OUT, 0x32);

I will restrict the range to [1.65V 1.95V] as documented in the i.MX8MP
operating ranges, and exclude the 3.3V operation mode given the
explanation in the board's documentation.

BUCK4 and BUCK6 are not mentioned anywhere, and not programmed by
U-Boot. I can only assume they're used at their 3.3V and 1.1V defaults.
BUCK6 likely powers NVCC_DRAM as in the EVK, which is consistent with
the board using LPDDR4. I'll set the output voltages to 3.3V and 1.1V
respectively.

LDOs are even worse. Only LDO4 is mentioned in the documentation (as
powering NVCC_SAI1_SAI5) and touched by the boot loader (set to 1.8V).
I'll modify the LDO4 range from the current 3.3V fixed value to [1.8V
3.3V], and won't touch the other LDOs.

> > +/* eMMC */
> > +&usdhc3 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc3>;
> > +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> > +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> > +	bus-width = <8>;
> > +	non-removable;
> 
> no-sd
> no-sdio
> 
> may give you a tiny bit of speedup during probe, if you know that there will
> always be an eMMC here.

I'll add that, thanks.

> > +	pinctrl_i2c1: i2c1grp {
> > +		fsl,pins = <
> > +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c2
> > +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> > +		fsl,pins = <
> > +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14				0x1c2
> > +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15				0x1c2
> 
> This surprises me. I'd expect that the SION bit needs to be set for
> GPIO bus recovery.

I haven't tested GPIO bus recovery. I'll add the SION bits, as they make
sense.

-- 
Regards,

Laurent Pinchart
