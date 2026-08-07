Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670D4B04A3;
	Fri,  7 Aug 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112136; cv=none; b=mF2cyG4OXlBBzdfaPoyBB7Iq4ZsCnqagTiO6Ahw5+PY4gId3KKHBbo0XKxExNEBwUekjgvMKNh2ifELeiFXvPPiFbv+9drV9sbQ3Wsf0pCfPh6MRKOTmJ9wquz2TdmzZp9G4YEwD3+bVfnSHiLBoRWMuVQYu9lndC1LRIn3MXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112136; c=relaxed/simple;
	bh=pZpH/u/LM5E9fBIiQ6+JG9IcsnK8w5ToHk42IU7wfSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Txhsn2C1cchVMBEZB9Futm8L3uoGGTHEghH19ZNBB2YcCNizm9LjGIRai0yxVt0Ijf6H1LhLF/2S75OitlJffHdIONL8pMhnfpZEEHXKnpsESkZMIyvtahCxnifpMKkLmo5cwhq+zkdqX93Ez5yGYcylBhuz2v+FuwyeT1nZc1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK137S7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK137S7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179AB1F00A3A;
	Fri,  7 Aug 2026 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112124;
	bh=IyNvYtrh1w2zinN4OOL5ZqVtVfqtY/LXpQ0kleOjjYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QK137S7bMKKwo3ds8ljGwjYaRC6tAVQY4d2xj41hq8acEs7fJbDBsZBFNHxQRKsJj
	 uv7mOQB0kzKeM8AgQsm/Ie1cDxbgNK148n/7xuD01uRnFNGkwnqSmkS305VbsaiUuj
	 afS3iHxrUZ7xqTkpfP/Zj0+goYKHcJ+HBx8EjoapLJ/YhFtmt/R5MQyesdOmI1Qs/p
	 DZljNSDTatjVOneanKntbAjJsh+1UM5MVgDOajEHRKdH4hVXn6UPX7Cz1n9HFlw6sC
	 9/2+snHTqeNptGeKbRqvZYDULacU5MGnEH/3qmWMUI8RBJeuvRDpWG1f7twi5AoyF9
	 U+K6RUe2Yn33Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645
 analog audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudi Heitbaum" <rudi@heitbaum.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <54ab90ba6c05b38c6561e0ea732d487da9443f1e.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
 <54ab90ba6c05b38c6561e0ea732d487da9443f1e.1786107926.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:15:22 +0000
Message-Id: <20260807141524.179AB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incomplete DAPM routing for the external Headphone Microphone brea=
ks headset recording.
- [High] Using `system-clock-direction-out` without an explicit clock misco=
nfigures the Audio PLL and breaks audio playback.
- [Low] Missing required regulator supply properties `avdd-supply` and `cpv=
dd-supply` in the `rt5645` codec node.
--

--- Patch [5]: [PATCH 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645 a=
nalog audio ---
commit c3b167f1c120ceab271f952ec9169de906983534
Author: Rudi Heitbaum <rudi@heitbaum.com>

arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio

The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
microphone and two on-board DMICs, fed by sai2.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm=
64/boot/dts/freescale/imx8mq-phanbell.dts
> index 2d134eefb7659..b819e644fa54e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> @@ -46,6 +46,41 @@ fan: gpio-fan {
>  		pinctrl-0 =3D <&pinctrl_gpio_fan>;
>  		status =3D "okay";
>  	};
> +
> +	sound-analog {
> +		compatible =3D "simple-audio-card";

[ ... ]

> +		simple-audio-card,routing =3D "Headphone Jack", "HPOL",
> +					    "Headphone Jack", "HPOR",
> +					    "Headphone Mic", "micbias1",
> +					    "DMIC L1", "Internal Mic",
> +					    "DMIC R1", "Internal Mic";

[Severity: High]
Is there a missing route here to connect Headphone Mic to a codec input pin,
such as IN1P or IN2P?

Without this route, will ALSA DAPM see the microphone as a dead end, failing
to power up the codec's ADC and breaking headset microphone recording?

> +
> +		/*
> +		 * 32 bit slots regardless of the sample width. sai2 divides its
> +		 * 24.576 MHz root by an even integer only, so a 24 bit frame at
> +		 * 48 kHz would ask for 2.304 MHz, a ratio of 10.67.
> +		 */
> +		sound_analog_cpu: simple-audio-card,cpu {
> +			sound-dai =3D <&sai2>;
> +			system-clock-direction-out;

[Severity: High]
By specifying system-clock-direction-out here without an explicit clocks or
system-clock-frequency property, does this cause simple-card to fall back to
the child node's first clock (IMX8MQ_CLK_SAI2_IPG at 133MHz)?

If so, simple_init_dai() will set the Audio PLL to 133MHz during probe.
Because fsl_sai_set_dai_sysclk() blocks clock changes once playback starts
(when sai->mclk_streams > 0), the PLL remains stuck at 133MHz.

Will this cause fsl_sai_hw_params() to fail to derive valid BCLK dividers
from 133MHz, breaking audio playback completely?

> +			dai-tdm-slot-num =3D <2>;
> +			dai-tdm-slot-width =3D <32>;
> +		};

[ ... ]

> @@ -272,6 +307,18 @@ &i2c3 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_i2c3>;
>  	status =3D "okay";
> +
> +	rt5645: audio-codec@1a {
> +		compatible =3D "realtek,rt5645";
> +		reg =3D <0x1a>;
> +		pinctrl-names =3D "default";

[Severity: Low]
Are the avdd-supply and cpvdd-supply properties required for this codec nod=
e?

Will omitting them cause device tree schema validation (dtbs_check) to fail?

> +		pinctrl-0 =3D <&pinctrl_hp_det>;
> +		#sound-dai-cells =3D <0>;
> +		interrupt-parent =3D <&gpio5>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786107925.gi=
t.rudi@heitbaum.com?part=3D5
