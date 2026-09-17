Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A24DE732;
	Thu, 17 Sep 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660242; cv=none; b=RPNoNSXjQQ/IydxKv6LKntQXeoOQWcy4NfZTnqxWtnRF42eOrYXfDeLCr+rSvAlpL1wWwR4E/0YlP1VH3AQ49CWC6h6wPJX6uI9dPrelze4Ovnn0CtRsunEVZ8czoc8JXHEO3OLKedxbC56HEiKswreO7j15kdKt7aIbllfTcJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660242; c=relaxed/simple;
	bh=Am1wggZCCMTrhe9VdM2aPbonIbrmONfidDMG3UkayBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nZ53U48HdFMiQH55i4nAfnlSNEf/EljWs/toHWsy1B25mYxjo9UeE0rYc28b1TNOmEZa44mussBslgCZN5RT2LDLRb+70vb06J4w4pP9luj2EuFRqWHJye+G1ngSBv2roCwlB792eVpsT5TWNCClmC/fA0e9+ogtekXzex4FKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9V6Ph+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9V6Ph+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43521F00899;
	Thu, 17 Sep 2026 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660234;
	bh=Ti7QuQO1RsiQ38IYeC78Yj1HhM6nW4a5F9QPt4kKwnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i9V6Ph+pcXAIKtIzOHnhdbNOB3DlV5Yw0xo2bjN63Pw/uzFHAsabJ7Eyk6e+a4wwI
	 eE0MaMxIzK3mWc1v+27awhIN7zT6ND1RtzjCFMlqHYki4DqBo1FJSFxa7Ro511psx9
	 GguKEnw2JpmljKtsMANHPgc6pue2nkn8bq8M1Jn4rQlDSwINpdUelEGAAtQuQJlcEP
	 6e6t3VkCarxkmHlx6Na/1YKiEL+ck3z+EyZ7YEartVXFhku8lEqJIYAE4NS//FsB8r
	 WpY8E5m8O9Zwe9UpqwhpzTZ4uZwQMa9jJeim8xfLHRoRuHDYXmCL3PGYyfiFRSSAAH
	 QXEY7XV/Us+rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 15:50:33 +0000
Message-Id: <20260917155033.C43521F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: incorrect reset-gpios polarity contradicts hardware description
--

commit 3fe00f46f78811d6ed3d86dcccba4b6f6cd29139
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-dart: add TPM support

This commit adds device tree support for the TPM module available on the=20
Variscite DART-MX8M-MINI SOM.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mm-var-dart.dtsi
> index c7a9eb23e5e88..953950e55bf99 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> @@ -138,6 +138,16 @@ &i2c1 {
>  	sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status =3D "okay";
> =20
> +	st33ktpm2xi2c_som: tpm@2e {
> +		compatible =3D "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg =3D <0x2e>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tpm_reset>;
> +		label =3D "tpm";
> +		/* active-low TPM reset line. */
> +		reset-gpios =3D <&gpio4 31 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does the device tree polarity match the actual hardware description here? T=
he
GPIO_ACTIVE_HIGH flag directly contradicts the inline comment that the
physical line is active-low. Standard device tree practice requires the
logical flag to match the physical active state (GPIO_ACTIVE_LOW).

If this property is parsed by a bootloader (like U-Boot) or a future Linux=
=20
driver update, wouldn't the reset line be driven to the wrong polarity (hig=
h=20
for reset, low for de-assert), potentially holding the TPM in reset and=20
breaking device initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789659585.gi=
t.stefano.r@variscite.com?part=3D2
