Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9A3AC0E4;
	Wed, 20 May 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264825; cv=none; b=d8oNSk9tf6De1cMKXcFwPFu/0aRFFnjnzWxsABnNrJNAIrClrsGtXezO3mo0sj88ZnlieQlg0RmWsreoHzi1gVwd5AGl8uNHjEt6GCgS8ppDYgaM37hI3dp0pEroc/oI6RDYVUy6xvijd0PvzBb6lWtwoZzib5gJRW+gGjRAUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264825; c=relaxed/simple;
	bh=0w45RpFwA6keXNTvQqmYNbouz6Am7+btlJss54a17Gk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c5Qv+rbs8bdNjvDcdlAc8bJAeweOnFNLyEuzH+qjeH/+RAMQHhYWQVWUlqgStbfPjdHYC2aCnCDSjhxgz+r93n7VUHcOOaS2VkSVfBi6F0PcCOh1H8o6XNBqXlRy+mjbd024Vr0UWjmADf0wrFk0a5hAZxXfWt1h9sC1y78OhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQxqs486; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQxqs486"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153F51F00894;
	Wed, 20 May 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264823;
	bh=BJttpTR+K8jLpIrSpvbL3LP2BZLPtwUAQdNDcTHBsgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQxqs486h2pYI8Df9pgu/jlzSN6WFedRBx3lWmF3q1Tm1jsF3ip2mUA5YCTaxCkHW
	 QFZDilK9cNiaiJ3J1YwEhH0NkhhzK+S/EK4R5Y14Ia2UanvPnYAfwpeZowZ1W+Wxi6
	 dUp/vnNq6UBYYQPt/9ZYB1udVAYuj0ZVoD4vyhhASPDcn94yBMcTF3TrAj1QFqzNyc
	 SZSs6hW1LMsIIjyowhMokE2WeIRrOakkr0i7sLAAeW0fh15YTJRUl3fbhfJu3kjWer
	 OCug3NtzpWA6ztXGl6LFgmkggDEcukikW1rHYRdCE/ITysmd+DrL77pl8yfnNoLoEV
	 2P5sWlVFpXeuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260520074754.1631543-2-alexander.stein@ew.tq-group.com>
References: <20260520074754.1631543-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:13:42 +0000
Message-Id: <20260520081343.153F51F00894@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] PCIe peripheral reset (PERST#) is statically hogged high instead o=
f being managed by the PCIe controller driver.
- [High] The DisplayPort bridge `reset-gpios` property is configured as `GP=
IO_ACTIVE_HIGH` for an active-high Enable pin, which will cause the driver =
to permanently disable the bridge.
- [High] The `.dtsi` file uses the `IMX8_PCIE_REFCLK_PAD_INPUT` macro witho=
ut including the required header.
- [High] Mismatch in array lengths between `assigned-clocks` and `assigned-=
clock-parents` in `media_blk_ctrl`.
- [Medium] The pin `MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05` is configured twice=
 with conflicting pad settings in the same state.
- [Medium] The `dp-hpd-int-hog` claims a GPIO pin whose pinmux configuratio=
n is located in a disabled device node.
- [Medium] The `tmp1075` temperature sensor node lacks the `interrupts` pro=
perty, disabling its alarm functionality.
- [Medium] Active device interrupt lines are redundantly claimed as `gpio-h=
og` inputs.
--

commit 94f71b7114703e908e4afab6cc26436862728cfb
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
   =20
This adds support for TQMa8MPQS module on MB-SMARC-2 board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> new file mode 100644
> index 0000000000000..9576152657405
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> @@ -0,0 +1,1177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Paul Gerber
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "imx8mp.dtsi"

[Severity: High]
Does this file need to include <dt-bindings/phy/phy-imx8-pcie.h>?

The IMX8_PCIE_REFCLK_PAD_INPUT macro is used later in the &pcie_phy node,
which could cause a compilation error if another board includes this .dtsi
without manually adding the missing header.

[ ... ]
> +&gpio1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_gpio1>;
> +
> +	gpio-line-names =3D "SLEEP", "BATLOW#", "", "LID",
> +			  "", "GPIO10", "CHARGING#", "CHG_PRSNT#",
> +			  "PMIC_IRQ#", "ESPI_CS1_ALERT#", "USB1_OTG_ID", "USB2_OTG_ID",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +
> +	pmic_irq_hog: pmic-irq-hog {
> +		gpio-hog;
> +		gpios =3D <8 0>;
> +		input;
> +		line-name =3D "PMIC_IRQ#";
> +	};
> +};

[Severity: Medium]
Is this gpio-hog for the interrupt pin necessary?

Active device interrupt lines such as PMIC_IRQ#, ENET0_INT#, ENET_INT#, and
RTC_INT# are assigned to their respective devices using the interrupts
property. Simultaneously claiming these pins as gpio-hog inputs requests
exclusive ownership of the GPIO descriptor, which might conflict with the
interrupt subsystem's attempt to use them.

[ ... ]
> +&gpio2 {
[ ... ]
> +	perst-hog {
> +		gpio-hog;
> +		gpios =3D <10 0>;
> +		output-high;
> +		line-name =3D "PERST#";
> +	};

[Severity: High]
Will this static PERST# configuration prevent the PCIe driver from properly
sequencing the reset?

The PCI Express specification requires the host to toggle the PERST# signal
during link training. By hogging the pin statically high and omitting
reset-gpios from the &pcie node, the controller driver cannot toggle the pi=
n.

[ ... ]
> +&gpio3 {
[ ... ]
> +	temp-event--hog {
> +		gpio-hog;
> +		gpios =3D <28 0>;
> +		input;
> +		line-name =3D "TEMP_EVENT#";
> +	};
> +};

[Severity: Medium]
Should this pin be configured as an interrupt for the tmp1075 device instead
of a static gpio-hog?

The tmp1075 temperature sensor node applies pinctrl_tmp1075 to multiplex
GPIO3_IO28 for the TEMP_EVENT# alert pin, but lacks the interrupts and
interrupt-parent properties. Without them, the thermal alarm feature is
unusable.

[ ... ]
> +&gpio5 {
[ ... ]
> +	dp-hpd-int-hog {
> +		gpio-hog;
> +		gpios =3D <21 0>;
> +		input;
> +		line-name =3D "DP_HPD_INT";
> +	};
> +};

[Severity: Medium]
Will this gpio-hog function correctly when its corresponding pinmux
configuration is located in a disabled device node?

This claims GPIO5_IO21 as an input, but the required pinmux setting
(pinctrl_tc9595) is assigned to the dp_bridge node, which has
status =3D "disabled". The pinctrl is never applied, leaving the physical
pin in its default state.

[ ... ]
> +&i2c3 {
[ ... ]
> +	dp_bridge: dp-bridge@f {
> +		compatible =3D "toshiba,tc9595", "toshiba,tc358767";
> +		reg =3D <0xf>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tc9595>;
> +		clock-names =3D "ref";
> +		clocks =3D <&clk_dp>;
> +		reset-gpios =3D <&expander0 4 GPIO_ACTIVE_HIGH>;

[Severity: High]
Could this polarity configuration keep the bridge permanently disabled?

The DP_BRIDGE_EN pin is an enable pin that requires driving HIGH. When the
driver deasserts the reset (logical 0), it will drive the physical line LOW
due to the GPIO_ACTIVE_HIGH polarity. Should this be GPIO_ACTIVE_LOW so
that deasserting the reset translates to driving the pin HIGH?

[ ... ]
> +// Change parent clock of disp1 pixel clock to audio_pll2
> +&media_blk_ctrl {
> +	assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_AXI>,
> +			  <&clk IMX8MP_CLK_MEDIA_APB>,
> +			  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> +			  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> +			  <&clk IMX8MP_CLK_MEDIA_ISP>,
> +			  <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> +				 <&clk IMX8MP_SYS_PLL1_800M>,
> +				 <&clk IMX8MP_AUDIO_PLL2_OUT>,
> +				 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> +				 <&clk IMX8MP_SYS_PLL2_500M>;
> +};

[Severity: High]
Are we missing a clock parent in the assigned-clock-parents list?

The assigned-clocks list contains 6 elements, but assigned-clock-parents
only has 5. There is also no assigned-clock-rates property. This means
IMX8MP_VIDEO_PLL1 will not find a corresponding parent or rate entry.

[ ... ]
> +&iomuxc {
[ ... ]
> +	pinctrl_espi_rst: espirstgrp {
> +		fsl,pins =3D <MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05		0x144>;
> +	};
[ ... ]
> +	pinctrl_gpio4: gpio4grp {
> +		fsl,pins =3D <MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01		0x10>,
> +			   <MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04		0x10>,
> +			   <MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05		0x10>,

[Severity: Medium]
Is this pin meant to be configured twice with different pad settings?

The &gpio4 node applies both pinctrl_gpio4 and pinctrl_espi_rst, configuring
MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05 twice with conflicting settings
(0x144 and 0x10). This creates a pinmux overlap that can result in
unpredictable pin configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520074754.1631=
543-1-alexander.stein@ew.tq-group.com?part=3D2
