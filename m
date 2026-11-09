Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230119;
	b=ptFnqWoVG1vVRK+lNw9sC7uv2aWueanZqdB/2dbR/OV+xf4qiYBWcXV8jyllwVVl4iMU
	 ucRh29QOWlAFiM45jDSpdVyKP/TmQ4d19C7v3K0qRgaUJUKwGHaKQpr6sjUJauCTTGFtS
	 svZeyOaZ//KIHusV/tdi0MDqVTVXkoNveg57Vumi5nlqjWErsKqjaqHJKKFn0Zyqh90Qx
	 UK8YIKhNNPd1v2AwhesGbvn06V78tDE5/WPlmvTlNcw9ZuChPwBZRlbjQr4DSzQfh/Xdm
	 HVYfRJbeTOEXCJGhY27G4qe09De77Z6hV0aVBFPb8V7tkvGsMk+elsc+CwqYv2J95Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230119;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dDqyC+CGRrHhoZ5SG82i0phSZb+neNtWLnPOcTsqAIo=;
	b=exmir/ayC+nwSKtb1//PVidiYHtHTURTeks145Ohg9L+ivolhqpMvGy0dF8FBDS4KQ31
	 9a+ibDgd71eETzI+RNEuIfMSSZt/J+AulfyuKKHs9tCX6k+Q43fCH+vkqD+XpnAf5VBa+
	 ke1zP9J4G/EG/QPqIKWi5DCbiuGDHkFNTutFtNXlouoMaLfmHAg0NDTahs7vudvSNDGys
	 azFEbt/xtwRl7A9cORE7f+vyOSEJjdoA/tq3XSPU1/j5e5OBCuhaLYoNCAML+ML7dxu4Z
	 pfKfd9PHVK1+R9i/j+tT1+GPAy2og4GVC8ep4TPOUehtTxsfAy5ABH0+iDDBR5n8B6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZkxJRr9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9D606A321;
	Mon,  9 Nov 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZkxJRr9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AAD1F0089F;
	Mon,  9 Nov 2026 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230118;
	bh=dDqyC+CGRrHhoZ5SG82i0phSZb+neNtWLnPOcTsqAIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZkxJRr9Iixkh0R8qctRWdqNbi1+nM3+daJAgvFQHYjs9REhhxLsRAVGYaz1S8VQe
	 6LCklI0tTzZ7wv9E3GPsw3ZBO81/UP3RiovBcr8Pxiu0WpFvRyQ7MMY+ywraxU9fFh
	 1eXsbE33ukwQ5eNQpNj8CIUbrTUVw8PbSkA9g7NGflMGzHtU8yZC5vkfdJmuG+NkfQ
	 t4FmtJUuNcScVpf7V9ElJx94FxPQmko6Ox2rFOcfD9EZUz9ZYaHfQdBuRYyvpwk2RE
	 7m+Saot84p8EX3hKjLkynTh3+csYkKO35uqX5UevuIG3/UmbM+85tyH+zFt1Ihj4BZ
	 xtyw8J5re9tjg==
Message-ID: <sashiko-outbox-204992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: freescale: Add support for bytesatwork
 i.MX93
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Obergfell" <frank.obergfell@bytesatwork.ch>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109122250.720757-6-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
 <20261109122250.720757-6-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:15:17 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] arm64: dts: freescale: inverted GT911 GPIO polarity in
  touchscreen@5d nodes
- [Medium] arm64: dts: freescale: GPIO pinctrl groups assigned to wrong
  device nodes
- [Medium] arm64: dts: freescale: missing disable-over-current on
  usbotg1 and usbotg2
- [Low] arm64: dts: freescale: invalid ethernet-phy node names and
  deprecated property
- [Low] arm64: dts: freescale: underscores in pinctrl node names and
  non-generic gpio name
- [Low] arm64: dts: freescale: carrier board duplication between
  bytedevkit v1 and v2
--

commit 1273f35fed75113bbeefbcede52975d930b5ccbf
Author: Frank Obergfell <frank.obergfell@bytesatwork.ch>

arm64: dts: freescale: Add support for bytesatwork i.MX93

This commit adds devicetree support for the bytesatwork i.MX93 byteengine
module and the bytedevkit v1.0 and v2.0 carrier boards.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts
> new file mode 100644
> index 0000000000000..9662dd2c38e66
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v1-0.dts

[ ... ]

> +	reg_usb_otg1_vbus: regulator-otg {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "USB1_VBUS";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb2_vbus: regulator-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "USB2_VBUS";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&gpio2 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

[Severity: Medium]
Should pinctrl_usb1 and pinctrl_usb2 be assigned to reg_usb_otg1_vbus and
reg_usb2_vbus rather than to &usbotg1 and &usbotg2, with vbus-supply =3D
<&reg_usb2_vbus> added to &usbotg2?

On i.MX93, pinctrl-imx does not implement .gpio_request_enable, so a pad is
only muxed when the device node owning its pinctrl-0 property probes.
Because &usbotg1 depends on reg_usb_otg1_vbus and reg_usb2_vbus is marked
regulator-always-on, both regulators request and drive their GPIOs before
&usbotg1 or &usbotg2 probes.

Similarly, panel@0 under &dsi drives reset-gpios (<&gpio2 10>) in
ili9806e_probe() before acquiring its backlight, while that pad is muxed in
pinctrl_mipi_backlight on mipi_bl (in both v1-0 and v2-0), and the interrupt
pad for tca6418e@34 in imx93-byteengine.dtsi is muxed in pinctrl_lpi2c2
instead of on the GPIO expander node.

[ ... ]

> +		ethphy_qos: ethernet-phyqos@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			enet-phy-lane-no-swap;
> +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&pinctrl_fec>;
> +	pinctrl-1 =3D <&pinctrl_fec_sleep>;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy_fec>;
> +	fsl,magic-packet;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		clock-frequency =3D <5000000>;
> +
> +		ethphy_fec: ethernet-phyfec@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			enet-phy-lane-no-swap;
> +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +		};

[Severity: Low]
Should ethernet-phyqos@0 and ethernet-phyfec@0 (and ethernet-phyfec@c in
imx93-bytedevkit-v2-0.dts) be named ethernet-phy@0 and ethernet-phy@c?
Documentation/devicetree/bindings/net/ethernet-phy.yaml selects nodes using
^ethernet-phy(@[a-f0-9]+)?$, so these names cause dtbs_check to fail schema
matching for ethernet-phy-ieee802.3-c22.

Also, ti,fifo-depth is deprecated in ti,dp83867.yaml in favor of
tx-fifo-depth.

[ ... ]

> +	/* LVDS Touch */
> +	touchscreen@5d {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_lvds_touch>;
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios =3D <&gpio2 20 GPIO_ACTIVE_LOW>;
> +		reset-gpios =3D <&gpio2 21 GPIO_ACTIVE_LOW>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +	};
> +};
> +
> +&lpi2c2 {
> +	/* Mipi Touch */
> +	touchscreen@5d {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_mipi_touch>;
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios =3D <&gpio2 21 GPIO_ACTIVE_LOW>;
> +		reset-gpios =3D <&gpio2 20 GPIO_ACTIVE_LOW>;
> +	};
> +};

[Severity: High]
Does marking irq-gpios and reset-gpios as active-low in the touchscreen@5d
nodes (here and in imx93-bytedevkit-v2-0.dts) leave the gt911 held in reset
during probe?

In drivers/input/touchscreen/goodix.c, goodix_reset_no_int_sync() asserts
reset with gpiod_direction_output(ts->gpiod_rst, 0), drives the interrupt
line with gpiod_direction_output(ts->gpiod_int, ts->client->addr =3D=3D 0x1=
4) to
strap the I2C address, and deasserts reset with
gpiod_direction_output(ts->gpiod_rst, 1).  With active-low polarity flags,
gpiolib inverts these logical levels, strapping the controller to address
0x14 instead of 0x5d and driving the physical reset line low when
goodix_i2c_test() runs.  Both properties should use active-high flags.

[ ... ]

> +&usbotg2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usb2>;
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usbotg1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usb1>;
> +	dr_mode =3D "otg";
> +	vbus-supply =3D <&reg_usb_otg1_vbus>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should &usbotg1 and &usbotg2 specify disable-over-current in both
imx93-bytedevkit-v1-0.dts and imx93-bytedevkit-v2-0.dts?

When disable-over-current is absent, usbmisc_imx7d_init() enables hardware
over-current detection, but the only i.MX93 over-current pads (enet1_td1 and
enet1_td2) are muxed to &eqos in pinctrl_eqos.

[ ... ]

> +	pinctrl_lvds_backlight: lvds_backlight-grp {
> +		fsl,pins =3D <
> +			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e	/* LVDS Backlight */
> +		>;
> +	};
> +
> +	pinctrl_lvds_touch: lvds_touch-grp {
> +		fsl,pins =3D <
> +			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* LVDS Touch INT */
> +			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* LVDS Touch RST */
> +		>;
> +	};
> +
> +	pinctrl_mipi_touch: mipi_touch-grp {
> +		fsl,pins =3D <
> +			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e	/* MIPI Touch INT */
> +			MX93_PAD_GPIO_IO20__GPIO2_IO20		0x31e	/* MIPI Touch RST */
> +		>;
> +	};
> +
> +	pinctrl_mipi_backlight: mipi_bl-grp {

[Severity: Low]
These pinctrl node names (and those in imx93-bytedevkit-v2-0.dts) contain
underscores, which triggers dtc node_name_chars_strict warnings when
building with W=3D1; hyphens should be used instead.  Also, tca6418e@34 in
imx93-byteengine.dtsi should use the generic node name gpio@34.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
> new file mode 100644
> index 0000000000000..52b38edfe5b62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-bytedevkit-v2-0.dts
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 bytesatwork AG
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "imx93-byteengine.dtsi"

[Severity: Low]
This isn't a bug, but imx93-bytedevkit-v2-0.dts duplicates over 400 lines of
imx93-bytedevkit-v1-0.dts verbatim, differing only in the model string, the
&fec PHY address, and the &usbotg1 configuration.  Could the shared carrier
board description be factored into a common .dtsi (or included from one
board .dts into the other) so only the differences are specified?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109122250.7207=
57-1-frank.obergfell@bytesatwork.ch?part=3D5
