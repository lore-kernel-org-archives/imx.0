Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59124252D5;
	Sat, 26 Sep 2026 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432014; cv=none; b=eP+l+XD44dCzJAgN+paduIBhUM7liU2LW5YydW1wgdg9antk2/VhU9lLBHRUZ/npEWolBFvq1i3cWFIVYVmXIWer/MqRVO5XJMOQ6+pyuBPIEBXoUwAxPYtUjpPq5TKCAuf9v+0+MpnnsJa2jpQ5KGAMS5qzvdRpeiNrotpxo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432014; c=relaxed/simple;
	bh=5p2gbMKOjqWR0+ZtFLGuPjRQbdVK9kLPn55ZlRnf9WU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G9rll03S5XtL5+oR7SBc/WbM0NxqnnZAe4ZZ3ZDLTRDTyGdL57qRDoR1kV4B2HMcbdnvH5QKy2GH7cMTLg40CorFN1KOIPY/M3zBTwW4ji+C/sfYJ1H9ag/phdZGkDUbB9IjD72XqpHv/r46yhn6UJiM8/MRCtqzR3E+dXp5GIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdUB3wtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdUB3wtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A4F1F00893;
	Sat, 26 Sep 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432012;
	bh=DQlaNFcbS/CcPdXMTNnZGp0iNQxZdT5el3ZwDEXgicQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdUB3wtMWUBYZyk3RRIWmthmmy/7GlygyIa3eU2/CH0bLF55dq3Rl1igC/hWrDpuQ
	 TY/A5/LLFcdV/soknYR7ZU/hD/JouvRqGf9K+BgRzKx0bhIv/VC+BMyT7dhpQMlytt
	 tTltNvG2JaVF6HJfwY4JYkMU+gg6w2dPGBF1Rf6yuGVJhPtoKCehaTvgOz/0Rz5zRn
	 RBLm/Ap97XW9U7qOQudgd4BQone71jyso7j2TO45WbwOptJ7pTx6jCF5N84Q3tfjU2
	 zKD6oCtKpL0Lz7xlfi6gWV3ehpzKvIPmkOaQjXy9DiqZr5hdp7U4M55q51EeJb4VGz
	 bONWd7a7w2tpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec
 files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:32 +0000
Message-Id: <20260926141332.74A4F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ASoC: dt-bindings: missing DAPM routing for Microphone Jack on SOM=
 WM8904
- [High] ASoC: simple-audio-card: fixed 12.288MHz clock on WM8731 breaks 44=
.1kHz playback
- [High] dt-bindings: wm8904: DCVDD and CPVDD supplies incorrectly set to 3=
.3V
- [Low] dt-bindings: wm8731: 100% file duplication between DART and SOM var=
iants
--

commit 85c31b80442521c0f29d03e856f06165c8f204fc
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite audio codec files

Add separate DTSI files for the WM8904 and WM8731 audio options on
VAR-SOM-6UL and DART-6UL modules. Put each codec node, the SAI2 setup and
its pinctrl in the selected audio DTSI.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi
> new file mode 100644
> index 0000000000000..7d74fc3b7014c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8731.dtsi
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */

[ ... ]

> +		sound_master: simple-audio-card,cpu {
> +			sound-dai =3D <&sai2>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&codec>;
> +			system-clock-frequency =3D <12288000>;

[Severity: High]
Does this fixed clock frequency break 44.1kHz audio playback?

Using a static 12.288MHz system-clock-frequency without
simple-audio-card,mclk-fs prevents dynamic ALSA reclocking. The wm8731 driv=
er
needs 11.2896MHz for 44.1kHz playback, so setting a fixed 12.288MHz might
cause 44.1kHz streams to be rejected.

> +		};
> +	};
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
> new file mode 100644
> index 0000000000000..1e1ff8c6d7b56
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
> @@ -0,0 +1,88 @@

[ ... ]

> +&i2c2 {
> +	codec: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&clks IMX6UL_CLK_SAI2>;
> +		clock-names =3D "mclk";
> +		AVDD-supply =3D <&reg_3p3v>;
> +		CPVDD-supply =3D <&reg_3p3v>;
> +		DBVDD-supply =3D <&reg_3p3v>;
> +		DCVDD-supply =3D <&reg_3p3v>;

[Severity: High]
Is it safe to assign a 3.3V supply to CPVDD and DCVDD?

These pins on the WM8904 have a 2.0V absolute maximum rating. Assigning
reg_3p3v to CPVDD-supply and DCVDD-supply misrepresents the hardware and
could be dangerous if the regulator is dynamically controllable or used as
a reference.

> +		MICVDD-supply =3D <&reg_3p3v>;

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi
> new file mode 100644
> index 0000000000000..7d74fc3b7014c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8731.dtsi
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */

[Severity: Low]
Could this file be consolidated with the DART variant?

This entire file appears to be a 100% byte-for-byte duplicate of
imx6ul-imx6ull-var-dart-wm8731.dtsi, which might create a maintenance burden
when making future updates.

[ ... ]

> +		sound_master: simple-audio-card,cpu {
> +			sound-dai =3D <&sai2>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&codec>;
> +			system-clock-frequency =3D <12288000>;

[Severity: High]
Does this fixed clock frequency break 44.1kHz audio playback?

Using a static 12.288MHz system-clock-frequency without
simple-audio-card,mclk-fs prevents dynamic ALSA reclocking. The wm8731 driv=
er
needs 11.2896MHz for 44.1kHz playback, so setting a fixed 12.288MHz might
cause 44.1kHz streams to be rejected.

> +		};
> +	};
> +};

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi
> new file mode 100644
> index 0000000000000..72a73011af6f7
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wm8904.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/ {
> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&sound_master>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&sound_master>;
> +		simple-audio-card,name =3D "wm8904audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN1L", "Line In Jack",
> +			"IN1R", "Line In Jack";
> +		simple-audio-card,widgets =3D
> +			"Microphone", "Microphone Jack",

[Severity: High]
Is the microphone input path broken here due to missing DAPM routing?

The Microphone Jack widget is declared in simple-audio-card,widgets but
it is completely omitted from the simple-audio-card,routing map. Without th=
is
routing, the DAPM framework will consider the microphone path inactive and
won't power on the mic bias or ADC paths when recording.

> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";

[ ... ]

> +&i2c2 {
> +	codec: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&clks IMX6UL_CLK_SAI2>;
> +		clock-names =3D "mclk";
> +		AVDD-supply =3D <&reg_3p3v>;
> +		CPVDD-supply =3D <&reg_3p3v>;
> +		DBVDD-supply =3D <&reg_3p3v>;
> +		DCVDD-supply =3D <&reg_3p3v>;

[Severity: High]
Is it safe to assign a 3.3V supply to CPVDD and DCVDD?

These pins on the WM8904 have a 2.0V absolute maximum rating. Assigning
reg_3p3v to CPVDD-supply and DCVDD-supply misrepresents the hardware and
could be dangerous if the regulator is dynamically controllable or used as
a reference.

> +		MICVDD-supply =3D <&reg_3p3v>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D4
