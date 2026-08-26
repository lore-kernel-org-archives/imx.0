Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879B28851F;
	Wed, 26 Aug 2026 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733095; cv=none; b=AkZzgPFBgjFwVjsRXQj7HcJ3HEGXLv0Z2JWjx7NRfusQEEfCzH5VQkVqFmIxIOd2Xh/H4N6L02l/BYofIjPO+K3EYys1Bj/D8098lvnSzNvr4TWqPBOJs4fB3hCNVCbBDpkZc0F/tVAXhnr8COdQ9uiwC1a5hO3l+513jtwDh+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733095; c=relaxed/simple;
	bh=bIu8tI3yU6X1BL4P5b+SxJlNy4ULld7e9CXtqTwT/ME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SDMKtKB1q/J3hpBhhiHq9p8Hieg5ogoOHAhPCIhm+3Tr5+F63qiyUN65eCrjpPok6YBDa8XD/PHtIFclR9a/ML9PvB63F+LcE30ey94g7AY3dYfkjF1U156rUngK/90z3o6sqe5mQSJvVyh9nqgnSxtFiWSbv5msmSnDN2kfqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A50cAfaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A50cAfaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97A21F000E9;
	Wed, 26 Aug 2026 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787733094;
	bh=ZvoUOKFF0fE0YJD0y3CsTSCPhtjPOzRw+3qgOUmTpw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A50cAfaZFhH4L1mcg7ORk9RwHX+NY+jsZRPXJV2SuUWAnw2VpBz6ubaiIr9n/wzMv
	 vbIEBT96KruBCcuf+hugtzHqhO5CC78OSzet3gz5WtcFFfxGPH9qIfp9NoejSw0C9B
	 KIbwU3KYlR4DfhxjPhfro8MkF7QbccNecF8h9ZFUnlUknbsvDtxc7AH0yXX9uWqMYk
	 5RYKq9ilhb2Y9sIBKdHNZofq/ZG1Ek9c8KHmb0Khlz7nDypvbtRdJ0WIDbFbOyq/TX
	 ABajQ1ZSsS1ovcTotoNbhj5NAMuZ0gk7RO3zdBBKVP2HXYUD6oHsrgHcLOtLbqVWEU
	 92+hQF7WUM96w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <749f32d1a92ec87ce76f1ac0ce0d780c431fdde2.1787674237.git.stefano.r@variscite.com>
References: <cover.1787674237.git.stefano.r@variscite.com>
 <749f32d1a92ec87ce76f1ac0ce0d780c431fdde2.1787674237.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 08:31:32 +0000
Message-Id: <20260826083133.C97A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Contradictory microphone routing disables analog capture on WM89=
04.
- [Medium] Contradictory `no-1-8-v` property in usdhc1 disables UHS SD card=
 speeds despite hardware support.
--

commit 5821f4e873dc44e1cfd4f21d2d7e03f1e0298edd
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

Add device tree support for the Variscite VAR-SOM-MX7 system on module.
The module is based on the NXP i.MX7Dual SoC and is available in
multiple configurations and hardware revisions.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> index 0000000000000..aecc8c747f041
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
[ ... ]
> +&usdhc1 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;

[Severity: Medium]
Does including the no-1-8-v property here needlessly cap SD card performance
by explicitly disabling all 1.8V capabilities and preventing UHS-I
negotiation?

The pinctrl configurations below for SD1_VSELECT prove the hardware supports
1.8V switching:

> +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> +		fsl,pins =3D <
> +			MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59
> +			MX7D_PAD_GPIO1_IO08__SD1_VSELECT	0x59
> +		>;
> +	};

With no-1-8-v present, the MMC subsystem will never switch to 1.8V, renderi=
ng
the UHS-I pinctrl states dead code and capping speeds at 50MHz.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> index 0000000000000..158158afc3391
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
[ ... ]
> +	codec_wm8904: sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&dailink_master>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&dailink_master>;
> +		simple-audio-card,name =3D "wm8904-audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack",
> +			"Microphone Jack", "MICBIAS";

[Severity: Medium]
Does this routing contradict the configuration of IN1L as a digital input?

The routing maps the analog Microphone Jack to IN1L. However, the wm8904
node configures IN1L as a digital microphone input via wlf,in1l-as-dmicdat1:

> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
[ ... ]
> +		/* DMIC is connected to IN1L */
> +		wlf,in1l-as-dmicdat1;
> +	};

Because IN1L is placed in digital mode, does this cause the analog signal
from the Microphone Jack to be ignored and break analog audio capture?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787674237.gi=
t.stefano.r@variscite.com?part=3D2
