Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16D41879
	for <imx@lists.linux.dev>; Mon, 27 Nov 2023 06:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r7UsE-0004vi-Dd; Mon, 27 Nov 2023 07:13:38 +0100
Message-ID: <7046940b-854c-c4c0-461a-c817484f5d50@pengutronix.de>
Date: Mon, 27 Nov 2023 07:13:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/4] arm64: dts: freescale: Add support for the
 Variscite DART-MX8M-PLUS SoM
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: devicetree@vger.kernel.org, Harshesh Valera <harshesh.v@variscite.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Li Yang
 <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 FrancescoFerraro <francesco.f@variscite.com>,
 Nate Drude <nate.d@variscite.com>, Shawn Guo <shawnguo@kernel.org>,
 Marco Contenti <marco.c@variscite.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
 <20231025165058.31697-3-laurent.pinchart@ideasonboard.com>
 <962e1d33-bc97-6bf8-b94d-581762dd6afa@pengutronix.de>
In-Reply-To: <962e1d33-bc97-6bf8-b94d-581762dd6afa@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 27.11.23 06:58, Ahmad Fatoum wrote:
> Hello Laurent,

Ah, I see now, that this series was about to be merged. I missed it at first,
because of the MAINTAINERS entry losing a F:, which I now sent a fix for.

Anyways, should you resend to fix the binding errors, you could address some
of the nitpicks, but I found nothing critical.

Cheers,
Ahmad

> 
> On 25.10.23 18:50, Laurent Pinchart wrote:
>> +	reg_eqos_phy: regulator-eqos-phy {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "eqos-phy";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		regulator-always-on;
> 
> Apparently, https://lore.kernel.org/all/20230721110345.3925719-1-m.felsch@pengutronix.de/
> didn't make it upstream. Perhaps you mentioning that you could use this would help get
> it unstuck? :)
> 
>> +&eqos {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_eqos>;
>> +	phy-mode = "rgmii";
>> +	phy-handle = <&ethphy0>;
>> +	status = "okay";
>> +
>> +	mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		ethphy0: ethernet-phy@0 {
>> +			compatible = "ethernet-phy-ieee802.3-c22";
>> +			reg = <0>;
>> +			eee-broken-1000t;
>> +			reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
> 
> Nitpick: Separate pinctrl entry for PHY GPIOs that's added to the PHY node?
> Makes it easier to check that all used signals are indeed muxed.
> 
>> +	pmic@25 {
>> +		compatible = "nxp,pca9450c";
>> +		reg = <0x25>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_pmic>;
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		regulators {
>> +			BUCK1 {
>> +				regulator-name = "BUCK1";
>> +				regulator-min-microvolt = <600000>;
>> +				regulator-max-microvolt = <2187500>;
> 
> Nitpick: These may be the limits of what the BUCK can output, but they
> don't look like a safe operating range for the board. The Linux driver already
> has ranges hardcoded to cover what's possible by the hardware, so if you specify
> regulator range here, it should pertain to what the board and SoC are designed
> to handle.
> 
>> +/* eMMC */
>> +&usdhc3 {
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>> +	pinctrl-0 = <&pinctrl_usdhc3>;
>> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
>> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
>> +	bus-width = <8>;
>> +	non-removable;
> 
> no-sd
> no-sdio
> 
> may give you a tiny bit of speedup during probe, if you know that there will
> always be an eMMC here.
> 
>> +	pinctrl_i2c1: i2c1grp {
>> +		fsl,pins = <
>> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c2
>> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
>> +		>;
>> +	};
>> +
>> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
>> +		fsl,pins = <
>> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14				0x1c2
>> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15				0x1c2
> 
> This surprises me. I'd expect that the SION bit needs to be set for GPIO bus recovery.
> 
> Cheers,
> Ahmad
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

