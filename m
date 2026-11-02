Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603408;
	b=2/SrTlMLvPwdXttdFisLRdeuSufh1Ys6RL+KWeiyf8mvxl2+WomS6KL4FL8k+L/ycDAb
	 W4JxR9wQkSRa0jM2E5yMtUohy60xM++K/BdjWx9dTjwHLgG2RNUw87eRIrtyR4UfLODfM
	 MWzkSlfRvquFiovupfFA6q0oNy6vF1V3fUFZSm8pDTO1L+jnY9E09qZBjK3QhEYtO/8M3
	 X5mNImdSnRN8niv5kcjTnGyHgbeHO9EPrur510b077EFpRR2E6sdnz+/FJnRBCa+Sh4dF
	 fBToKSV4TA1wwUZUpat1QHmr5hZ265LWfeHfOEqV59b7C6JzcRfsvvF7Fm/aJ0xvQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603408;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kU6IofXCn5PA/zOH+cWAXeqWn3DUsOgIFPE2GbgIRAI=;
	b=vxfW3S53+wM4duHbgfxgCUoggG5mZAEXLzFXhah9BD0MCuYa9vOfnn+aTww/VWsdj268
	 mZgWYHMSXcw4H39iPJcMBpHuvVVKIuOcrxCWyZnXKml6ibAX1u+GwP3JotnehuYaOERJA
	 Sq5XNALUJd7RwzSa/tiy5UBBVAJj84tev/ecNIqcXwmHMLqRkkYKfH11mWb89LRTKMhhO
	 OZSOblzURqFmMc3uC4xK1UiLHQvSJy3JT+/93zsMWwWr446nF0gTGgSx4O47Xhynhs/Ts
	 6KzgLg+jtMaQ88ELfmHt+92MDGViSJ319dpalt5VPAdSjcAxyNv6YhKA5aOSqc6RXwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7f8oJG1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8D606A32C;
	Mon,  2 Nov 2026 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7f8oJG1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BD21F0093A;
	Mon,  2 Nov 2026 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793603408;
	bh=kU6IofXCn5PA/zOH+cWAXeqWn3DUsOgIFPE2GbgIRAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7f8oJG1QsO3FGg77wjuEHGo2InHPla8LtEpCSmWwREtLQjus64/N0Iv/BoTm8Bje
	 7i/5pKRriqwmlrpr3IAuXXffM3ZcnQ5TXrd1hDKYJuXHunpNRm9dVBkLFMCHn673jE
	 WpTFp7Cxx8wdYwuicDZpPrU8RMPVQp/Gj5j6i10qW7VpXx5g465CWMWdB8lIZ8q2/7
	 GrU+tQ/bmhMktTgXZGRqaLv3jwAO+dJF9mNTcOD14OokoySZb8LAYevUX9RTafu23H
	 DNRjYDCcb4Y2Gw79zG8IipAS/MY9NUbqZsHa8u3PrAPHsHO6qR9SFdWFpJ7whp29eB
	 JakdHVYTZul4g==
Message-ID: <sashiko-outbox-193001@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx95: Add ADLINK LEC-iMX95 board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102065645.121046-3-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102065645.121046-3-dinesh.v@adlinktech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 07:10:07 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx95: missing open-drain bit in pinctrl_lpi2c8 pad =
config
- [Low] arm64: dts: imx95: undocumented adlink vendor prefix in compatible
--

commit 248f6e79db5b8ae0d4d8bd60d96acbf1ad1f767b
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

This commit adds device tree descriptions for the ADLINK LEC-iMX95 System on
Module and the I-Pi SMARC Plus carrier board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts b/arch=
/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
> new file mode 100644
> index 0000000000000..9a77bff42b225
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (C) 2026 ADLINK Technology Inc.
> + *
> + * https://www.adlinktech.com/products/Computer_on_Modules/SMARC/LEC-IMX=
95
> + * https://www.adlinktech.com/products/computer_on_modules/SMARCStarterK=
its/I-Pi_SMARC_IMX95
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95-lec.dtsi"
> +
> +/ {
> +	model =3D "ADLINK LEC-iMX95 on I-Pi SMARC Plus Carrier Board";
> +	compatible =3D "adlink,lec-imx95-ipi-smarc",
> +		     "adlink,lec-imx95",
> +		     "fsl,imx95";
> +};

[Severity: Low]
The root node uses the "adlink" vendor prefix in its compatible property,
along with the new board and module compatible strings, but "adlink" does
not appear in Documentation/devicetree/bindings/vendor-prefixes.yaml and
the compatible strings are not documented in
Documentation/devicetree/bindings/arm/fsl.yaml.

Should the vendor prefix and board compatible bindings be documented so
dtbs_check and checkpatch.pl pass without undocumented DT string warnings?

> diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx95-lec.dtsi
> new file mode 100644
> index 0000000000000..5402cb360888a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi

[ ... ]

> +&scmi_iomuxc {

[ ... ]

> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins =3D <IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e>,
> +			   <IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e>,
> +			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e>;
> +	};
> +
> +	pinctrl_lpi2c8: lpi2c8grp {
> +		fsl,pins =3D <IMX95_PAD_GPIO_IO13__LPI2C8_SCL		0x4000007e>,
> +			   <IMX95_PAD_GPIO_IO12__LPI2C8_SDA		0x4000007e>;
> +	};

[Severity: Medium]
In pinctrl_lpi2c8, IMX95_PAD_GPIO_IO13__LPI2C8_SCL and
IMX95_PAD_GPIO_IO12__LPI2C8_SDA are configured with 0x4000007e rather than
0x40000b9e as used in pinctrl_lpi2c2 and pinctrl_lpi2c3 above.

On i.MX95, bit 11 (0x800) of the IOMUXC pad control register enables
open-drain output and bit 9 (0x200) enables the internal pull-up. With
0x4000007e, both bits are cleared while lpi2c8 is enabled in
imx95-lec-ipi-smarc.dts, driving the I2C8 SCL and SDA lines as push-pull
outputs.

Should pinctrl_lpi2c8 use 0x40000b9e so that open-drain mode is enabled on
the I2C8 bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102065645.1210=
46-1-dinesh.v@adlinktech.com?part=3D2
