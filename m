Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA50442100;
	Mon,  6 Jul 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332590; cv=none; b=bfLi6qdTUXtZoXpYwYsE4KVd/cDyC3zK9YsP/DSR35XtrTDhVXGmjzZTD3+C292yj3jrXEyATkAVILVRuyz3r47oxVGi0fpfnd93KlWrxHP+mPrRcVaijC1gyIWPpS2bEFIMRGWvlGUXlLhBS7ldJ3g6jiIEwY4D5fsShjhkYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332590; c=relaxed/simple;
	bh=VVJ72efO/ecrpVpGStmneA5Zct5Ppsu3pJ+te3UUKUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d73BR+YLIf8AHXSMQfbvcGH2nZIghzzEu5CywwCzz9z4KBuaoHMa/H3rN+mN5/Zh1qjmS7lSC7k99gbJfpovpEXv8Pm4btMNmHyzAm5olJSOHJHKsiKWw3utqlK1FtSVEP1BePb9QMb5PF6TR70vd8b4wSMbp0wICg3Fi9H04Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cufcBLBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cufcBLBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA391F000E9;
	Mon,  6 Jul 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783332589;
	bh=rA2xl8M38053qoAVrxeI5gnS2rBkRzkBmrD7Wjrybao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cufcBLBtLfNm1IHo/915Pg/CqBizUwP2hdI6kS5AnW8CEQY8/p5eIxHqmsXMVEfNj
	 wBXWH6BDKU5MTE0ct4xN19QtLrC9EGoYG/tzdKv/rudICEcVesPq9rRyQ6xHRGIV7R
	 +OHWYzEMATXUxIbk0tPpboXg/BXHxdjWXVQrp3iRhSVpXZq+e0AXg/snHt0vZYezq+
	 vR6m1qpNGOlcPY2BmEobCiciC+wJzNZ3eLSKVA1wDOjZdvTI40pyNQbW1dw2swos2B
	 a2fAUzAYfkJmiKWrT+STbX5d9oHpYl0JdkYoLjHA3bQaRsHLM9BWrbdI5Z5XNEI0+l
	 f1v/pK2xQpcYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:09:47 +0000
Message-Id: <20260706100948.DDA391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `simple-audio-card,routing` property maps `Microphone Jack` =
to `IN1L` and `IN1R` but omits the connection to the `MICBIAS` supply, whic=
h will leave standard electret microphones unpowered.
--

commit 78e4da0f71f2e53ae4312cbe5ceecb0f6f2345db
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec

This commit adds support for the WM8904 audio codec on the VAR-SOM-MX8MN bo=
ard.
It configures the device on the I2C bus, enables the SAI peripheral, and ad=
ds a
simple-audio-card sound node to expose the sound card to the system.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mn-var-som.dtsi
> index 09146ab763858..e2e04ad2fbb65 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi

[ ... ]

> @@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
>  		regulator-min-microvolt =3D <1800000>;
>  		regulator-max-microvolt =3D <1800000>;
>  	};
> +
> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&codec_dai>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&codec_dai>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,name =3D "wm8904-audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack";
[Severity: Medium]
Will standard electret microphones remain unpowered with this routing?

The routing maps "Microphone Jack" to "IN1L" and "IN1R", but omits a link to
the "MICBIAS" supply (e.g., "Microphone Jack", "MICBIAS"). Because "MICBIAS"
is defined as a DAPM supply widget in the codec driver, DAPM will not enable
it unless it has an explicit routing link connecting it to the active audio
path. This could leave the microphone without its required bias voltage when
recording.

> +		simple-audio-card,widgets =3D
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai =3D <&wm8904>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783330236.gi=
t.stefano.r@variscite.com?part=3D5
