Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA3C1E8320;
	Sat,  9 May 2026 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778313125; cv=none; b=A0nQ0TrNMTQjmOBlo2aNMwo6pP0Dw2mXgrAaCuxOSdc8bMr9FYuhDxjy4r0VMKXHkYTQe97E47lpQBxo12kfUzGab1c2ZD41ExGvc8DXMI2Zao/U/33dzJmYSh07JN2hrBE7D1STAUWDDKErqZ5t+uYi8Q21sidRe/q+UK1GyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778313125; c=relaxed/simple;
	bh=Q+5aEMnMqZ9rPSshP3zxmEfWAw2dlBy3fSi9kqzaCuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHkTQIk/T7KtT9Gu2ocYr2PUWCASLp6SSkgs2H0R2vmvInZV4XaOj1czNZG+Gna99acTnk7JilQLuvEIIeMmYSvv7xEh8x0XAr8wuz5Z2fEJvBKAQE3QOBHKqBoHRwuKb8gRmEW6qiUTnrOfPthLCc+FWZ0zhJU6R4Hewj+0jeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQKXoafT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQKXoafT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B916AC2BCB2;
	Sat,  9 May 2026 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778313125;
	bh=Q+5aEMnMqZ9rPSshP3zxmEfWAw2dlBy3fSi9kqzaCuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kQKXoafTnw/REVG8fWymKMJ7a7f1Db82bElndzdHY31/j8qNaqv/9tIHhhcbe9fdu
	 ++2VypwFzPHEn2Xf/0IyL9FWWcOgUo27plbDjarmss6T7oh5SX6kJRLOz5+dYSmY5N
	 LnMvyjoYRzFJEE4+XBu2R5K/dZ42iycEaS4mGkf1WAGSuJSu32wp+XH2XK/Tm7wTEV
	 /mfA/sIzQqbfewhq+p4lzPijQrx+ELTwwzdGM/LT1cLUMNY0jXHcAEwPh4qOsCCynf
	 040/TnFhgHjI55ufSOnAh3a/7v5AvLdD2L59tuTVSBR86MWXAJjF3buvzV046eruGV
	 PYNEYBSelr3iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
Reply-To: sashiko@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260509-imx95_frdm_pro-v3-2-96290b471396@nxp.com>
References: <20260509-imx95_frdm_pro-v3-2-96290b471396@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 07:52:04 +0000
Message-Id: <20260509075204.B916AC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `silent-gpios` for `flexcan1_phy` and `flexcan3_phy` (which us=
e the `nxp,tja1057` CAN transceiver) are defined with the `GPIO_ACTIVE_LOW`=
 polarity. This is incorrect for the TJA1057.
- [High] The pad configuration for the `pcal6416` I2C GPIO expander's inter=
rupt pin (`IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14`) in `pinctrl_pcal6416` is i=
ncorrectly set to `0x31` instead of the expected `0x31e`.
- [Low] The `pcie0` and `pcie1` nodes use the deprecated `reset-gpio` prope=
rty instead of the standard `reset-gpios`.
- [Low] Device tree node names contain underscores, which violates DT namin=
g specifications.
--

commit e8bda174f6b9f1f5508fbd640dcc59ff092dd5cd
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive expansion
capabilities based on the i.MX95 19x19 SoC. Add device tree for this board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arc=
h/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> new file mode 100644
> index 0000000000000..ce638ed8dc0f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> @@ -0,0 +1,1021 @@

[ ... ]

> +	aliases {
> +		ethernet0 =3D &enetc_port0;
> +		ethernet1 =3D &enetc_port1;

[ ... ]

> +		serial0 =3D &lpuart1;
> +		serial4 =3D &lpuart5;
> +	};
> +
> +	bt_sco_codec: bt_sco_codec {
> +		compatible =3D "linux,bt-sco";
> +		#sound-dai-cells =3D <1>;
> +	};

This isn't a bug, but should this node name use hyphens instead of
underscores to comply with Devicetree naming specifications?

> +
> +	flexcan1_phy: can-phy0 {
> +		compatible =3D "nxp,tja1057";
> +		#phy-cells =3D <0>;
> +		max-bitrate =3D <5000000>;
> +		silent-gpios =3D <&i2c4_gpio_expander_22 11 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	flexcan3_phy: can-phy2 {
> +		compatible =3D "nxp,tja1057";
> +		#phy-cells =3D <0>;
> +		max-bitrate =3D <5000000>;
> +		silent-gpios =3D <&i2c4_gpio_expander_22 13 GPIO_ACTIVE_LOW>;
> +	};

Does this incorrectly configure the TJA1057 transceiver?

The hardware's silent pin is active-high, so when the driver deasserts the
silent GPIO to enable transmission (logical 0), setting the polarity to
active-low will drive a physical high level.

This would force the transceiver into silent mode and prevent any CAN
transmissions.

Should the polarity be set to active-high instead?

[ ... ]

> +	sound-mqs {
> +		compatible =3D "audio-graph-card2";
> +		links =3D <&sai1_port1>;
> +		label =3D "mqs-audio";
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&i2c4_gpio_expander_22 9 GPIO_ACTIVE_LOW>;
> +	};

This isn't a bug, but should this node name also use hyphens instead of
underscores?

[ ... ]

> +&netcmix_blk_ctrl {
> +	status =3D "okay";
> +};
> +
> +&pcie0 {
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	pinctrl-names =3D "default";
> +	reset-gpio =3D <&i2c4_gpio_expander_22 19 GPIO_ACTIVE_LOW>;
> +	vpcie-supply =3D <&reg_m2_mkey_1_pwr>;
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 =3D <&pinctrl_pcie1>;
> +	pinctrl-names =3D "default";
> +	reset-gpio =3D <&i2c3_gpio_expander_20 9 GPIO_ACTIVE_LOW>;
> +	vpcie-supply =3D <&reg_m2_mkey_2_pwr>;
> +	status =3D "okay";
> +};

This isn't a bug, but should these properties use the standard reset-gpios
name instead of the deprecated reset-gpio?

Using the singular form violates strict DT schema definitions and might
trigger validation warnings.

[ ... ]

> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins =3D <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
> +		>;
> +	};
> +
> +	pinctrl_pcal6416: pcal6416grp {
> +		fsl,pins =3D <
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31
> +		>;
> +	};

Is this pad missing the pull-up enable bit?

In i.MX95 pad configurations, the trailing 0xe enables the pull-up resistor.

Since the pcal6416 interrupt output is open-drain and configured as
active-low, leaving it floating could cause an interrupt storm or missed
interrupts.

Should this be 0x31e instead of 0x31?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-imx95_frdm=
_pro-v3-0-96290b471396@nxp.com?part=3D2
