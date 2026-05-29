Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EC370D7D;
	Fri, 29 May 2026 07:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039465; cv=none; b=UfzJPmVtVR1b+kNJ4L5p1lwet27Mz2sReBxjcCEC+AK9ms9iOTHjNiyPXv5y4/Gtm+hwyROP/QB8V4a6pVVnaSCOca2y513+kVv8sg04P079i7Wp5+RNN9PvFPu/IgQBt4hy7UvmLS6U9KEuAjexBTs23v3/SyN5qSGDrbqbp1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039465; c=relaxed/simple;
	bh=WMAmlcIQIPKKaaMrURLfmXiIMthOS57LRPxLd8C34iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GfNUwqPLe0AOGeKxhHwl2WeuPRAn1ScT0C8UUmAOidLorgy0ISv/e/YcVG6cSjrbNmEJHIJy9aWkjrkhO/o0/VMAdi3VfswdT9waSBdkEdirPbpGHedW2Zgj1dekLVsysxqVliANGaqqj1wx/1N6d+qbAyAcQA3I0INb7nMv6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSuM0eX3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSuM0eX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1243F1F00893;
	Fri, 29 May 2026 07:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780039463;
	bh=um2tEqxlS5jXXenlbeIzjx6dLrc8aF079F+kbyhM/tk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JSuM0eX3r81RILfe5zcgvSIrQoa/Tt7q2Lnb9Ffl3oCzMZ92n0HUyrYKrT8yy12Hv
	 /ledjrN1XDbDeCo6J/h9NcC3ZTcDnDjmynrF8uWSBR1MPwYTDENlPVu6L6rYBgrY/c
	 MXlMLASs6XX1HL6Rwrl9KgAnHeVuYzlakFPDlKPZTUisObbv3f2c8Rztfd3TGugPAR
	 2bhu+BNvJ0/jyD/BPpSd6NTUFr6NnyWFW1YWX8/7k52DQ9SRdnQnz0NKTyfwScFLBM
	 hdEF7qPRC71cdBPjjXGzBY6Iec3S/6DbTOYxokimSLC7tLSMiRDBVlGDf5bv3eamId
	 thYIJWYoIOEIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: s32g: add PWM support for s32g2 and
 s32g3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529070502.1749632-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260529070502.1749632-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 07:24:22 +0000
Message-Id: <20260529072423.1243F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Devicetree node names use underscores instead of hyphens.
- [Low] Inconsistent indentation for property continuations in DTS nodes.
--

commit ffbe8dd9e7b30291bb99de8bc8fc2e7bc1d421ea
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: add PWM support for s32g2 and s32g3

This commit adds PWM0 and PWM1 nodes for S32G2 and S32G3 SoCs. It configures
the device nodes in the respective dtsi files and adds the corresponding
pinctrl configurations in the EVB dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12deb..9f5f18d541183 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
[ ... ]
> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>  			status =3D "disabled";
>  		};
> =20
> +		pwm0: pwm@401f4000 {
> +			compatible =3D "nxp,s32g2-ftm-pwm";
> +			reg =3D <0x401f4000 0x1000>;
> +			#pwm-cells =3D <3>;
> +			clocks =3D <&clks 5>,
> +				 <&clks 6>,
> +				 <&clks 5>,
> +				 <&clks 5>;
> +			clock-names =3D "ftm_sys", "ftm_ext",
> +					  "ftm_fix", "ftm_cnt_clk_en";

[Severity: Low]
This isn't a bug, but there is an indentation inconsistency here. The second
line of the clock-names property appears to be over-indented compared to the
alignment used in the pwm1 node. Should this align evenly with the strings =
on
the first line?

> +			status =3D "disabled";
> +		};
> +
[ ... ]
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
This isn't a bug, but similarly to the clock-names above, the compatible
string continuation appears to be over-indented. Would it be better to align
it evenly with the first string?

> +			reg =3D <0x401f4000 0x1000>;
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
This isn't a bug, but the Devicetree specification generally recommends usi=
ng
hyphens instead of underscores for node names to avoid dtc warnings. Should
these node names be changed to use hyphens (e.g., ftm0-pins and ftm0-grp0) =
to
stay consistent with other nodes like dspi5-grp4 in this file? The node
labels (ftm0_pins:) can safely keep their underscores.

> +
> +		ftm0_grp1 {
> +			pinmux =3D <0x122>,
> +				 <0xb42>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529070502.1749=
632-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1
