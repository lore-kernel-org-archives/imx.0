Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829872;
	b=aNJC6AtO/LTXSrMGTPzyDllPXEyMkrwVXf4GDFPeuouozAjYdBiuY742V5SJT8olPGHL
	 0o/WgNv5FECmGjqf8vI/73mwuqDMjnkzRFjDJVkgpxqpjPAfvhNK2F0zN2kkv+qdG6MHU
	 iETXQN6oiL2ZDW5RZ6MDWIm7d7fZWeqiHLmzHqnsHn4LwDPxSx7l2P1/z1gHiDVo0BKQ4
	 8tmC2kFwgS/AE0dPIGD8/IYvADffbyO6z+mPqPXMXxVKfHAYXoMdBmnVPkIaOdPJbaCe1
	 o8rJfEUQCUveCSfap36PN5b/h25nJvYybGutS9n1OQNIfooVR3Gg4eNKsTvO16OcgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829872;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zTkxsQc21wO6nR8EzcMfxAFih7yH7L6CH8YM1Ko7Pkk=;
	b=luYJoicxxNrGoI0V3L+/rJfMbtpeb8NoVG3Sm+JOc5dfKlfjxsy8M0wL/YtkmnZcTZX4
	 bL/xE2XpYlv9DBTR8nQY+PI4w+FcOB0eGRx56w395fqDMPk01iMUQU25tz9Fn1Nb3aTl4
	 jWmaqldCr2zb2TeFvS5/0lj/lSWgJIn/VbElwkkhHADwOoaar9F5TXdVvYMHT2ZssG60b
	 ImLQjmhbXihYK96JKZlFWkgusOvOj6XdWautKRm0xAwRe+c5McTvafwvgCdEq4HmtJP/S
	 X+druO8tgAOt/88YUUSseaPHWtQQNZ74V91mocMTtNfUvuMIMVJHHkk27Fivc0Qbrvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNY4VlX6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECC606A31C;
	Mon, 16 Nov 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNY4VlX6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0171F000C5;
	Mon, 16 Nov 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794829872;
	bh=zTkxsQc21wO6nR8EzcMfxAFih7yH7L6CH8YM1Ko7Pkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iNY4VlX6AizIl8sRnEwnR4RQae63oy7QAjyaoUWfwVy1V1EkTzbIjVltl07Tubw7k
	 g4mTITP6GBGHXDP5iGpjV9g8w6VRRs2jXkZLCx+2JtUN/rzp+zylBG7MRtCt5frIGv
	 bbveIpkqs5TIVfLj1HWrRj8IwORNF843YKj/9M86gfEg594tAgCfAewbDbfnoLIDm6
	 4oMF3WLxNkMzeaJcbfsFHNNmq3x4PZTJ1bmYyqVqAKNovm3dD5P7OaRMU1/zTsGvD8
	 6Fh3/FnBWb8TzZXvHI2ieAm+WFkc5S2ormN3w20Rq+S8IYN7ezb8NOlsMG3hh+wvzt
	 m6xcFjqJPyuKg==
Message-ID: <sashiko-outbox-216961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: imx8mp-phyflex-libra: add display
 overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yannic Moog" <y.moog@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261116-imx8mp-phyflex-v1-3-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-3-4adcf8b4d373@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:51:11 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] arm64: dts: imx8mp-phyflex-libra: sound and sai5 left disabled
  on PEB-AV-10
- [High] arm64: dts: imx8mp-phyflex-libra: wrong backlight enable-gpios
  on PEB-AV-10
- [Low] arm64: dts: imx8mp-phyflex-libra: unused reg_vcc_12v and shared
  backlight_lvds
--

commit 19f62dd057ed6706b50af0f2de5fcf9ee9c1e80f
Author: Yannic Moog <y.moog@phytec.de>

arm64: dts: imx8mp-phyflex-libra: add display overlays

This commit adds devicetree overlays for the Powertip ph128800t006-zhc01 LV=
DS
panel connected to the Libra baseboard or the PEB-AV-10 expansion board, as
well as a standalone overlay for the PEB-AV-10 expansion board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-a=
v-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra=
-rdk-peb-av-10-ph128800t006.dtso
> new file mode 100644
> index 0000000000000..33677601789bd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10-ph=
128800t006.dtso
> @@ -0,0 +1,45 @@
[ ... ]
> +&backlight_lvds {
> +	brightness-levels =3D <0 8 16 32 64 128 255>;
> +	default-brightness-level =3D <8>;
> +	enable-gpios =3D <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +	num-interpolated-steps =3D <2>;
> +	pwms =3D <&pwm1 0 66667 0>;
> +	status =3D "okay";
> +};

[Severity: High]
Should enable-gpios reference <&gpio4 28 GPIO_ACTIVE_HIGH> here instead of
<&gpio5 1 GPIO_ACTIVE_HIGH>?

In imx8mp-phyflex-libra-rdk-peb-av-10.dtsi, backlight_lvds is assigned
pinctrl_lvds2, which muxes MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28 rather than
GPIO5_IO01, so the pwm-backlight driver will drive the wrong pin and fail to
enable the PEB-AV-10 display backlight.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-a=
v-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-1=
0.dtsi
> new file mode 100644
> index 0000000000000..e94ce6691a620
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyflex-libra-rdk-peb-av-10.dt=
si
> @@ -0,0 +1,152 @@
[ ... ]
> +&{/} {
> +	panel_lvds2: panel-lvds2 {
> +		backlight =3D <&backlight_lvds>;
> +		power-supply =3D <&reg_vdd_3v3>;
> +		status =3D "disabled";
> +
> +		port {
> +			panel2_in: endpoint {
> +				remote-endpoint =3D <&ldb_lvds_ch1>;
> +			};
> +		};
> +	};
> +
> +	reg_vcc_12v: regulator-12v {
> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt =3D <12000000>;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-name =3D "VCC_12V";
> +	};

[Severity: Low]
reg_vcc_12v is defined here but never referenced anywhere, while panel_lvds2
reuses the baseboard's backlight_lvds node (which uses reg_vdd_12v0) and
overwrites its pinctrl-0 with pinctrl_lvds2 even when only the standalone
PEB-AV-10 audio overlay is applied.  Was a dedicated backlight node supplied
by reg_vcc_12v intended for panel_lvds2, or can reg_vcc_12v be dropped and =
the
backlight_lvds pinctrl override moved to
imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso?

[ ... ]

> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "snd-peb-av-10";
[ ... ]
> +		status =3D "disabled";
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&codec>;
> +		};
> +
> +		dailink_master: simple-audio-card,cpu {
> +			sound-dai =3D <&sai5>;
> +		};
> +	};
> +};
[ ... ]
> +&sai5 {
> +	assigned-clocks =3D <&clk IMX8MP_CLK_SAI5>;
> +	assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates =3D <12288000>;
> +	clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
> +		 <&clk IMX8MP_CLK_DUMMY>,
> +		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
> +		 <&clk IMX8MP_CLK_DUMMY>,
> +		 <&clk IMX8MP_CLK_DUMMY>,
> +		 <&clk IMX8MP_AUDIO_PLL1_OUT>,
> +		 <&clk IMX8MP_AUDIO_PLL2_OUT>;
> +	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
> +		      "pll11k";
> +	#sound-dai-cells =3D <0>;
> +	fsl,sai-mclk-direction-output;
> +};

[Severity: High]
Does this leave both the sound card and sai5 disabled when the PEB-AV-10
overlays are applied?

The sound node here sets status =3D "disabled", and &sai5 omits status =3D =
"okay"
(leaving it disabled as defined in imx8mp.dtsi).  Neither
imx8mp-phyflex-libra-rdk-peb-av-10.dtso nor
imx8mp-phyflex-libra-rdk-peb-av-10-ph128800t006.dtso enables either node, so
the PEB-AV-10 audio device will not probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-imx8mp-phy=
flex-v1-0-4adcf8b4d373@phytec.de?part=3D3
