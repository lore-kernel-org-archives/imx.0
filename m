Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D71344D85;
	Thu, 28 May 2026 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952469; cv=none; b=PBH6ssZ3d+AttHnffAYVYcHUF0XfIg6eYJUcNjPJC3BFjCNCps8NqMj13bKBEK6K3imzlQHlaACWmxags7ZJn1f05tW2ZfaNB5Aji05zyjNB+yabjXXRSQA2FD2JcWBDhH2w2wLq1GpvznRw5fy5nVShBbvvDz4FE77LwE7bWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952469; c=relaxed/simple;
	bh=x9EyM01FOM43mnA4zeMmNv5Itikmz+R93LlCpHlkeWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pc9WBgjsP1Ubb7IgpWdhtd4SihbVMcK2pMqlQkj67l97Jzo2xAAOdP9gcUJLuUuO72QCLOKiKWNrRB0aNWN2vzZLCuAEtyXVoRK6nj5DiWwBhRcFkMXVaCJKlhzPgH4ONY2Nb3LGjGGQ1Zp8o4S/DGeEyvdSkoNbh7V1QyFicsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA4H4NBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA4H4NBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9C91F00A3A;
	Thu, 28 May 2026 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779952468;
	bh=xKHvp74XNwJ5bs6EzdPM6zlVX4pqjdmFr3KZoKriYbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kA4H4NBb+COq2/5SwWskSQAUtpSaKavwkDMXoyIBt+3j8A71x6K26diCI/slLSG4m
	 DjN8+vwGgPnfcuEyoFkl6N683kduvycOv0EECy39J7t/vFSs2dcLqaCochjQpb9oj3
	 HmkscNFOW4l/g7ZinzHh4cWukVIfQTygCShOxswNb3UBdNjtQC64zZZj52E14X9kkG
	 89wVXetMWM5a8clf1JWIXOpgq21gMm6hJQdcFi/vEPfJZaG16wUFUCSC18syCMqohc
	 lHeuViR9qnr1ljmMnRqmbIvmxlHF6eQs4uUs1Scldt5BU04GT1NaJ9tdSZ4TvEh6My
	 iQpRWsnx1ZQGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: s32g: add PWM support for s32g2 and
 s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260528065228.1300779-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260528065228.1300779-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 07:14:26 +0000
Message-Id: <20260528071427.BB9C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Pinctrl node and subnode names contain underscores (`_`) instead of=
 hyphens (`-`).
- [Low] The overriding board-level nodes `&pwm0` and `&pwm1` are appended a=
t the end of the file rather than being sorted alphabetically.
- [Low] Inconsistent and misaligned indentation for multi-line properties.
--

commit 93bb27d5fd3b95357925ced6b98931cf0038033a
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add PWM support for s32g2 and s32g3

This commit adds PWM0 and PWM1 support for the S32G2 and S32G3 SoCs.

> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d0..408bf0b407346 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
[ ... ]
> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>  			status =3D "disabled";
>  		};
> =20
> +		pwm0: pwm@401f4000 {
> +			compatible =3D "nxp,s32g3-ftm-pwm",
> +					 "nxp,s32g2-ftm-pwm";

[Severity: Low]
This isn't a bug, but could the indentation of the continuation string be
aligned with spaces instead of tabs? The excessive tabs misalign the second
string relative to the opening quote of the first value. The same formatting
question applies to the clock-names property below, as well as the pwm1
additions.

> +			reg =3D <0x401f4000 0x1000>;
> +			#pwm-cells =3D <3>;
> +			clocks =3D <&clks 5>,
> +				 <&clks 6>,
> +				 <&clks 5>,
> +				 <&clks 5>;
> +			clock-names =3D "ftm_sys", "ftm_ext",
> +					  "ftm_fix", "ftm_cnt_clk_en";
> +			status =3D "disabled";
> +		};
> +
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff45310771..844d2c4fabf76 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
[ ... ]
> @@ -245,6 +245,70 @@ dspi5-grp4 {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	ftm0_pins: ftm0_pins {
> +		ftm0_grp0 {
> +			pinmux =3D <0x2912>;
> +		};

[Severity: Low]
This isn't a bug, but should these pinctrl node and subnode names use hyphe=
ns
instead of underscores?

The Device Tree specification and dts-coding-style.rst indicate that node n=
ames
should use hyphens (for example, ftm0-pins and ftm0-grp0) rather than
underscores. This deviation from the existing file conventions might also
trigger node_name_chars_strict warnings from dtc.

> +
> +		ftm0_grp1 {
> +			pinmux =3D <0x122>,
> +				 <0xb42>;
> +			output-enable;
> +			input-enable;
> +		};
[ ... ]
> @@ -304,3 +368,15 @@ &spi5 {
>  	pinctrl-names =3D "default";
>  	status =3D "okay";
>  };
> +
> +&pwm0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ftm0_pins>;
> +	status =3D "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ftm1_pins>;
> +	status =3D "okay";
> +};

[Severity: Low]
This isn't a bug, but would it be better to sort these overriding nodes
alphabetically?

The official devicetree coding style notes that overriding nodes at the boa=
rd
level should be sorted alphabetically. Sorting them correctly would place t=
he
&pwm0 and &pwm1 nodes before &spi5 instead of appending them at the end of =
the
file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528065228.1300=
779-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1
