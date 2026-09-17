Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D739CD06;
	Thu, 17 Sep 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658475; cv=none; b=mKpK3qU7izCq7vDl6vOmVqanwL31RdE/vo2ePgSqApBI994J8BngSbp5KRfhGBVak0MSskpNP2jdIdNDIDsdAOu5bt0DQ+5wmUJm/9Qz/btU2hYR7LY4uLilug8B52bwWncaUCXS3PR9KAxEUqNadP982lcYKsKAysIohKm6XOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658475; c=relaxed/simple;
	bh=ziM2pd8+jGmINRAZLnO/JT2BZ7tsF/nTDJur5PxuMhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kWcQNsGiVDGc8oJ+CmoLMEmx4jSBPnXFWq32S+wFPF530VwA3DBQMlj9Mkl6fHo2oRWdLG/dbotEyIVbeDLky1+3NiKx6GshpEhQOMKnbfr2zILFliKzASuskhR7wKLo2pNwBFEZKyAinOHvIA4yS33L52+dqW1yyhWJ8PHuxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbW1XWO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbW1XWO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEDE1F00898;
	Thu, 17 Sep 2026 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789658462;
	bh=om10Q1wr0c9Kk0+vJ41ckFDh4/lWoJOYDeAzD8FoDVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QbW1XWO2njHhA+1d4qzx/sw7c2h0TR7kqGtrxa2ZxoGEfufXCIOZJudh+hJmHtqE+
	 qLl5osJpcAX/1Z0ApzWmaJkrXEq1dbKwgsnSc5K0KO0Ctq03OQHynghKwuopJqUWWJ
	 01SoVKD+PkcETYnrdg3OmaM+B43gih1+AW90Gmzk4+/ctY8iyXDZhsaxcE1HKv6TVl
	 uk3o6t0owENXPzGOUP8TXdbo+OQThMaQeie0UOjUoSY5vELO/Oh1BF6eX19sXXkDyA
	 q2JeIVbBo3GUQU8XdklVxHUZXRl4Upyv6Kq6/yuSOpjKfgwsgK6LGn+o96RpJ/VBfp
	 Lq0YdY8G3a+7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
 <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 15:21:01 +0000
Message-Id: <20260917152101.AFEDE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: incorrect polarity for TPM reset gpio
- [Medium] arm64: dts: missing pinctrl for TPM reset gpio
--

commit b6842f762ba714e622e3da081d4b664400c4462d
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-dart: add TPM support

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mm-var-dart.dtsi
> index c7a9eb23e5e88..9fc0f7e551ca7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi

[ ... ]

> @@ -138,6 +138,13 @@ &i2c1 {
>  	sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status =3D "okay";
> =20
> +	st33ktpm2xi2c_som: tpm@2e {
> +		compatible =3D "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg =3D <0x2e>;
> +		label =3D "tpm";
> +		reset-gpios =3D <&gpio4 31 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Will this reset line work without a corresponding pinctrl configuration?

The node requests &gpio4 31 (pad SAI3_TXFS) as its reset line but lacks a
pinctrl-0 property to configure the pad's multiplexer to GPIO mode.

Since the i.MX pinctrl driver does not implement .gpio_request_enable(),
the GPIO subsystem cannot automatically reconfigure the pad when requested.

Does this leave the pad in its default or bootloader-assigned state,
causing software toggling of the GPIO to silently fail and breaking
the hardware reset capability?

[Severity: High]
Is the reset GPIO polarity correct for the ST33K TPM hardware?

The STMicroelectronics ST33K TPM hardware reset line is active-low
(RST_N), but the reset-gpios property specifies GPIO_ACTIVE_HIGH.

When the driver attempts to release the device from reset by logically
de-asserting the GPIO, won't gpiolib drive the physical line LOW (0V)?

Driving the active-low hardware pin LOW will hold the TPM in reset
permanently, causing device initialization to fail entirely. Should this
be configured as GPIO_ACTIVE_LOW instead?

> +	};
> +
>  	pmic@4b {
>  		compatible =3D "rohm,bd71847";
>  		reg =3D <0x4b>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789657399.gi=
t.stefano.r@variscite.com?part=3D2
