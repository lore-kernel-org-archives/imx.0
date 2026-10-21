Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575819;
	b=rHYaqDA4UJizZHOvI1y+yLOEo1JyD4hwNPJUb70omPSBSrq9cNxMVzHMcZbqofYY5j9B
	 ODqTUIhJzuA0k7AurNmxRoKPAg8nkenW4UOR5cYFCEd72CjfyskpZqIyQ5K1xiCtGcmhd
	 nPmj+UazoIph0+G5v3I/xqzBJRvE7F3aqWsw17H0pcfcR7YT3J9OQpnC4ZRF8A536sZFp
	 jqA1mV6oSSuenUbNhUxmMfiJ+vOU0P0cqMKwgefqN9e1OybnpekeyyLrfoLd90I4J8LIS
	 UhKsEVhXfa1/qZ+fEB1pPaOUAa5X+AU85kzI+wkNDCShAj1+uqxHosaTmLlkMDg/OYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v8RjLRdh07kwuUBeHPoP4UoL1RXignKxNhLp2yK86f4=;
	b=U2eobIaZ5/mUGscnXN6mBNVM7McDvxIYwhkg+jRCRBcefYCNFA6AqBFtCEHaXHWRsx9M
	 WFu9Xvs+CRqWcVkdFFPeBJbXDoK8G8f4Syy/uryxAvkcp+CaopfmSReS1fQ4wt+0RQBHx
	 cAoCeYItVOCqPCYpvSTpGDlC+wC2Z5+1S8ZDtixY49F/gsKadMmR5TIRb+bnI8ikifuy+
	 LAJCyV1do2mEDyyUzh2+HsnGW2TBEu/8UY+llU/oF+fQj9C28/qCNoFTJIP4vToHesaQM
	 lQYiYyJM462xUSMYWElLxks9YExXP7ZiQTJU0S0DdsS0I3JkYwloeUw5ZuuY98JfjLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTQYwpKj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A2606A31B;
	Wed, 21 Oct 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTQYwpKj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2295C1F000C9;
	Wed, 21 Oct 2026 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575818;
	bh=v8RjLRdh07kwuUBeHPoP4UoL1RXignKxNhLp2yK86f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTQYwpKjBq3N8ZeQOUXqS+hoCXDeUOHWN/LwlUNEBgUH40+VsbHHBCSv7wtquiUUX
	 ZKzHJGK2T6AyUr1tLhIZupkIBKqY2S0lHKHXMPJ2GUHz43rZhBXAvekT133TaAv2qQ
	 XAyf859dOP2VrwlHifn/txhYFgMBLfDn9FCzQBoXyaos36nNWtMKjBRnbOTPu1Z7Zy
	 4yfxv+GKmaFJ7iw2mHyGr4eDGWxlJMrr0yznoj9pO5CedVogE+eubpXR1/g+oAvitO
	 Ol+s8XBVUjK4awITnPD1sCpMdBh63vdOx5BRlQ6JDaapHicNBMpNfxrBCWlwltIFJR
	 pEchrCjSVcFUg==
Message-ID: <sashiko-outbox-180049@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021092140.4142493-3-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
 <20261021092140.4142493-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 09:43:37 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] ARM: dts: imx6qdl-draeger-m48: missing GPIO_OPEN_DRAIN on I2C re=
covery GPIOs
- [Medium] ARM: dts: imx6qdl-draeger-m48: halved LVDS pixel clock in split =
mode
- [Medium] ARM: dts: imx6: missing ODE and SION bits on HDMI DDC pins in dr=
aeger-m48
- [Low] ARM: dts: imx6qdl-draeger-m48: undocumented draeger vendor prefix
--

commit 1f358a609d69dc3047258ea0965effc8740f95c7
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: nxp: imx: Add devicetree files for M48

This commit adds devicetree files for the i.MX6 DualLite and i.MX6 Quad
variants of the Draeger M48 board.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> new file mode 100644
> index 0000000000000..b0bc9a67f5b34
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> @@ -0,0 +1,16 @@
[ ... ]
> +/ {
> +	model =3D "Draeger M48 i.MX6 DualLite";
> +	compatible =3D "draeger,imx6dl-m48", "fsl,imx6dl";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6q-draeger-m48.dts
> new file mode 100644
> index 0000000000000..ff9c337e93fbf
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
> @@ -0,0 +1,16 @@
[ ... ]
> +/ {
> +	model =3D "Draeger M48 i.MX6 Quad";
> +	compatible =3D "draeger,imx6q-m48", "fsl,imx6q";
> +};

[Severity: Low]
The root compatible properties in
arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts and
arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts introduce the "draeger"
vendor prefix, but Documentation/devicetree/bindings/vendor-prefixes.yaml
only contains entries for "^dptel,.*" and "^dragino,.*" in patternPropertie=
s:

  "^dptel,.*":
    description: Guangdong Dapu Telecom Co., Ltd.
  "^dragino,.*":
    description: Dragino Technology Co., Limited

Should the "draeger" vendor prefix be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml so that checkpatch.pl
and schema validation do not warn about an undocumented compatible string
vendor?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> new file mode 100644
> index 0000000000000..19207d45764c0
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> @@ -0,0 +1,213 @@
[ ... ]
> +&hdmi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_hdmi>;
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> +	scl-gpios =3D <&gpio4 12 GPIO_ACTIVE_HIGH>;
> +	sda-gpios =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +
> +	eeprom_mac: eeprom@50 {
> +		compatible =3D "atmel,24c08";
> +		reg =3D <0x50>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> +	scl-gpios =3D <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +	sda-gpios =3D <&gpio3 18 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};

[Severity: Medium]
During adapter registration for &i2c2 and &i2c3,
i2c_init_recovery() -> i2c_gpio_init_generic_recovery() in
drivers/i2c/i2c-core-base.c requests scl-gpios with
GPIOD_OUT_HIGH_OPEN_DRAIN and sda-gpios with GPIOD_IN.

When GPIO_OPEN_DRAIN is not set on scl-gpios in the devicetree,
gpiod_configure_flags() in drivers/gpio/gpiolib.c logs a runtime warning:

	if (lflags & GPIO_OPEN_DRAIN)
		set_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags);
	else if (dflags & GPIOD_FLAGS_BIT_OPEN_DRAIN) {
		set_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags);
		gpiod_warn(desc,
			   "enforced open drain please flag it properly in DT/ACPI DSDT/board fi=
le\n");
	}

In addition, because sda-gpios is requested with GPIOD_IN,
i2c_init_recovery() in drivers/i2c/i2c-core-base.c checks whether the line =
is
single-ended before enabling sda driving for bus recovery:

		if (bri->sda_gpiod) {
			bri->get_sda =3D get_sda_gpio_value;
			if (gpiod_get_direction(bri->sda_gpiod) =3D=3D GPIO_LINE_DIRECTION_OUT ||
			    gpiod_is_single_ended(bri->sda_gpiod))
				bri->set_sda =3D set_sda_gpio_value;
		}

Without GPIO_OPEN_DRAIN on sda-gpios, gpiod_is_single_ended(bri->sda_gpiod)
returns false and bri->set_sda remains NULL, preventing recovery from drivi=
ng
sda to generate a stop condition. Also, pinctrl_i2c2_gpio and
pinctrl_i2c3_gpio below use pad config 0x1b820 without the sion bit
(0x40000000), unlike pinctrl_i2c2 and pinctrl_i2c3 (0x4001b820).

Should scl-gpios and sda-gpios in &i2c2 and &i2c3 be flagged with
(GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN), and should pinctrl_i2c2_gpio and
pinctrl_i2c3_gpio also set 0x4001b820?

> +
> +&ldb {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lvds>;
> +	fsl,dual-channel;
> +	status =3D "okay";
> +
> +	lvds-channel@0 {
> +		fsl,data-mapping =3D "spwg";
> +		fsl,data-width =3D <24>;
> +		status =3D "okay";
> +
> +		display-timings {
> +			native-mode =3D <&timing0>;
> +
> +			/* LVDS split mode */
> +			timing0: timing-1920x1080 {
> +				clock-frequency =3D <71190000>;	/* pixclk / 2 */
> +				hactive =3D <1920>;
> +				vactive =3D <1080>;
> +				hback-porch =3D <60>;		/* left * 2 */
> +				hfront-porch =3D <60>;		/* right * 2 */
> +				vback-porch =3D <30>;
> +				vfront-porch =3D <3>;
> +				hsync-len =3D <60>;		/* hsync * 2 */
> +				vsync-len =3D <17>;
> +			};

[Severity: Medium]
In timing0 under &ldb, the horizontal parameters specify the full two-chann=
el
line totals (1920 + 60 + 60 + 60 =3D 2100 pixels per line, 1130 lines per
frame), which require a 142.38 MHz pixel clock for 60 Hz, while
clock-frequency is pre-divided by 2 to 71190000.

When fsl,dual-channel is enabled, imx_ldb_encoder_atomic_mode_set() in
drivers/gpu/drm/imx/ipuv3/imx-ldb.c treats mode->clock as the full combined
display interface pixel clock (di_clk =3D mode->clock * 1000) and already
halves the per-channel serial clock multiplier:

	if (dual) {
		serial_clk =3D 3500UL * mode->clock;
		imx_ldb_set_clock(ldb, mux, 0, serial_clk, di_clk);
		imx_ldb_set_clock(ldb, mux, 1, serial_clk, di_clk);
	} else {
		serial_clk =3D 7000UL * mode->clock;
		imx_ldb_set_clock(ldb, mux, imx_ldb_ch->chno, serial_clk,
				  di_clk);
	}

Meanwhile, ipu_di_sync_config_noninterlaced() in
drivers/gpu/ipu-v3/ipu-di.c clocks all 2100 horizontal pixels per line at
di_clk.

Will pre-dividing clock-frequency to 71190000 here cause the display
interface and lvds channels to run at half the intended clock rate (30 Hz
instead of 60 Hz), and should clock-frequency be <142380000> instead?

> +		};
> +	};
> +};
[ ... ]
> +&iomuxc {
[ ... ]
> +	pinctrl_hdmi: hdmigrp {
> +		fsl,pins =3D <
> +			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA	0x1b0b0
> +			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL	0x1b0b0
> +		>;
> +	};

[Severity: Medium]
The &hdmi node in arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi does n=
ot
specify an external ddc-i2c-bus phandle, so dw_hdmi_probe() in
drivers/gpu/drm/bridge/synopsys/dw-hdmi.c uses the internal DesignWare ddc
i2c master on the pads configured by pinctrl_hdmi.

Here MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA and
MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL are configured with 0x1b0b0, which omits
both open drain enable (0x800) and software input on (0x40000000). Other
i.MX6 boards using the internal hdmi ddc controller (such as
imx6qdl-apalis.dtsi and imx6qdl-colibri.dtsi in pinctrl_hdmi_ddc) configure
these pads with 0x4001b8b1.

Without open drain and software input on enabled on these pads, can hdmi ed=
id
reads over the internal ddc i2c bus fail?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021092140.4142=
493-1-petko.manolov@konsulko.com?part=3D2
