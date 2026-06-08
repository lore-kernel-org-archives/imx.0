Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B53B895F;
	Mon,  8 Jun 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914843; cv=none; b=JLNjNbJui0uaxk373lgbew1z5OrnA3MsKPyp9P9RANVYeXftQYOdkPLLpXUgKlvn+tmIv7dJsiYMjNoStqXRuELTeXvUAIcU2IANxzrvZfxiPCkGBiv3gX0Epo/eDKLuzgw8JPewXCiepHN1a8WqZ36N6+UdCRjHmd6bWdFCyhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914843; c=relaxed/simple;
	bh=c7Nxe6BRLa0vKMhHVVsh0Dgv0kgaj7/AlDh3nSa8AqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mx2q5JGxwyW0bFBEm+MO3+HN9lNet+P/m3YdytX0Zg7dOLqUJwKZpcVa8a2sVUg1XTGqVIJKpb/cgcT2utieSdHEpp+3wUcN7EhdQC6yGwEYY8Vw2qHUOlVBwMb5dY2Czdn/tTKlvSqey5Z0mC9eZ1id2PCpG90nncYDKKrSyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTZ9E0sH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTZ9E0sH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F5E1F00898;
	Mon,  8 Jun 2026 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780914841;
	bh=aIwwJ8gmYTRKFY2Mo/GBlH/sOSAFbkRsK+B4UR2WagU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTZ9E0sH1VpO5frZ+P0T16uwOqQOafYcltqhrNyStu88burpHtSKLFowmoqCjHBah
	 NQqn8V86cPSaTdHew5QPmxVoq/ERGixI59ewIM0o8vxIPi9z2/nyZONluwDy+U+cEf
	 yA2BCnywfTMdG/3mG9RI4vTySGOADb0p+HtadINZ/P77yqxRTx33spP2slmUHSn0Sh
	 x7xLTQOUTIvtuTvq83l6w7mbRqbC3eEGUvzRaDneggTnovvc8otJbMwItE9h3pXoCF
	 wm0CLDMad0QKyjMfBd5QXlkZl3F3+/5dea8j6+IxMu56ZiXeqREEQxp7/hkPzAJcF9
	 RQCgj2ufRX93g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/14] arm64: dts: imx8mp-var-som-symphony: enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <69418a0a09103d0982e474d3d5ca8a3543fb39ea.1780912893.git.stefano.r@variscite.com>
References: <69418a0a09103d0982e474d3d5ca8a3543fb39ea.1780912893.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 10:34:00 +0000
Message-Id: <20260608103401.86F5E1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing SION bit in I2C GPIO recovery pinmux configuration, whic=
h breaks I2C stuck-bus detection during recovery.
--

commit 8540c0ff1319c92d20f6a6b155aa57f03c50adce
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: enable USB support

This commit enables the USB controllers on the Symphony carrier board. It
adds the PTN5150 Type-C controller, configures the associated I2C bus,
enables the USB3 PHYs, and sets up port modes for OTG and host operations.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 25f707012f62c..2b04c90271250 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts

[ ... ]

> @@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                    =
             0x400001c2
>  		>;
>  	};
> =20
> +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2

[Severity: Medium]
Does this configuration omit the SION (Software Input On) bit for the I2C
recovery pins?

When an I2C bus hangs, the i2c-imx driver initiates a recovery sequence
by reconfiguring the I2C pins to GPIO mode. The driver sets SCL as an
output to manually toggle the clock, and then reads the state of SCL to
verify if the line successfully went high or if a slave is stuck stretching
the clock.

On i.MX processors, if a pad is configured as a GPIO output, reading its
state returns the value written to the data register, rather than the
actual physical voltage level on the pad, unless the SION bit (0x40000000)
is set.

Without the SION bit set here (0x1c2 instead of 0x400001c2), the kernel
will read back the logic value it just wrote. Will this defeat the
stuck-bus detection, causing the driver to assume a successful recovery
even if the bus is physically still held low?

> +		>;
> +	};
> +
>  	pinctrl_pca9534: pca9534grp {
>  		fsl,pins =3D <
>  			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780912893.gi=
t.stefano.r@variscite.com?part=3D2
