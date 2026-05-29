Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3733067C;
	Fri, 29 May 2026 11:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053010; cv=none; b=kiCH/uFPqqxi8O4m9Ajp7FCGwHMlSdZoT2JbHxaU0u++924oC7Xg85Guy8Al/w3cRd3S4F2ksUTIbWBIW3x1m4ljWzWl1wBPVdSs3vJ77X6RWKa1KSmdKE0pxJZdmfAySYr5MK1Uuczn+dvf3Fe9cBBUIClEtq/xpfVwZ7uhypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053010; c=relaxed/simple;
	bh=3BszXj+baSCfwrrN3L6DU9yeSg03wGDLKGUdlYrMr/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZss6FljRLma/JYPsTwcaueWU3BriqZWfJSR3i/AhOMIDPD2u4OFhlk0YLvQ0vclOUy3FJJX1HdREXb9n+XLEE2+pcxk53EqW1BPR3mg+Gif5gC2WcbMn/xOEdtPF3h3Q6WPOSoAGPIvZ+4hAbD7Pp48J+CnBkAsyeVAe+frji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyfYwUwA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyfYwUwA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B50D1F00893;
	Fri, 29 May 2026 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780053009;
	bh=gHwKF2TNJxXyL8XVI6BcLgm9K/40EzKEL958bBffgmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lyfYwUwALx8RbPuzADgJQjjJkWmCTV3KQcHFdMiLvBp/TWN1IWNnEdFjQXo4S0q8G
	 M4NcnsFo+zGoYkdRXI1j1RQ3hCpt7HYTEfpDKOp4zZ522WZCWj/SPw95KOIFTXH2VQ
	 BZLzOq8hDcnDHgHin5nnJDTwElNDGnmh/fir1eKjdbDT6nDkcDw/bUN6LD0y/EXTjy
	 EvT11DyYg79E6nr3QkRZNtHGvo1HBV3hjgq9U2GXzay83uJ2r/oKPFZTdHQcl3/Y4/
	 Cv4iwG8X32205aYowWVuxYczS6I0SaeiolsHUBqTh7mHn6yMEXoCh1hF2tDRVFxDP0
	 88kOMfnIVOmQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
References: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 11:10:08 +0000
Message-Id: <20260529111008.8B50D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The TPM device relies on a GPIO hog from a sibling I2C GPIO expand=
er to be enabled, but lacks a structural device dependency, leading to a pr=
obe race condition and potential initialization failures.
--

commit 2c29a43f4e74b7d0f118dc8b7401c07e3617e874
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx93-var-som-symphony: add TPM support

This commit adds the ST33KTPM2XI2C TPM device to the Symphony carrier
board. It uses a GPIO hog on the PCAL6408 GPIO expander to assert the
TPM enable line, since the binding lacks a dedicated enable GPIO property.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/a=
rch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index c0842fb3cfa33..f541308ebf6b8 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
[ ... ]
> @@ -208,6 +208,26 @@ &lpi2c1 {
>  	sda-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";
> =20
> +	pcal6408: gpio@21 {
> +		compatible =3D "nxp,pcal6408";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		status =3D "okay";
> +
> +		tpm-enable-hog {
> +			gpio-hog;
> +			gpios =3D <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name =3D "tpm_en";
> +		};
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible =3D "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg =3D <0x2e>;
> +	};

[Severity: High]
Since there is no explicit structural dependency between the TPM device and
the GPIO expander, could this introduce a probe order race condition?

Because fw_devlink is unaware of this relationship, if the drivers are
loaded asynchronously and the tpm_tis_i2c driver probes before the
gpio-pca953x driver, the enable line will remain deasserted.=20

The TPM driver's initial I2C read might receive a NACK and return a
permanent error like -ENXIO instead of returning -EPROBE_DEFER.

Does this setup inadvertently rely on undefined probe ordering to ensure
the TPM is enabled before it is initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780051874.gi=
t.stefano.r@variscite.com?part=3D1
