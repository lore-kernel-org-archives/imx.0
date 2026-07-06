Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D044C81;
	Mon,  6 Jul 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334877; cv=none; b=mu4aNuxWsbjkilsr90vMa6nmpOvU5eLtiOjsiSr6iLG/HKN4bhqQkXtAJQmNP0qiLVPQkvoq15fwWyezyd0WoIKnfseVnfFzrIZINmyHCR1/RkJGpbj1Og5RrEC5uaiDmneiDL+u7srceVVsmor+7+uLLPeHhdR12O+2+leptHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334877; c=relaxed/simple;
	bh=Gtk6EHmzfHZR7gLfNLT8AhWb8J2fFiFjfs1O8Wub8ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXdXPTWgqLotW9dT2HFqAcnd3sR3iqtb7hoekKLUiNS1XIStlonBE/E/UFR3AD5UAmYu76ItHoS0je4JH01Q5KQJ8db8Z8flMYAzWeTOER3XcK50GuxLxVWoEz0VMmfJtyeACUGSte7K9cKAP1I0inOp6eugmMTb4MKPkxMqOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXDAR4eT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXDAR4eT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B40D1F000E9;
	Mon,  6 Jul 2026 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783334875;
	bh=nR6lIf0xZDMLn8XpW5DtqbVhn+YcthXZqdlw6PEzE5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXDAR4eTgK7X+cT7KKW/VCr554GsjYiD5WXNtzo6ew+vOAVDs6VOw4iqhsZAd4eP5
	 MXNKd71qJ0s7ORT67u5T955sKSoylTs3z/+hl9Yv8rFrWCkPLtWlz+V8UK1mQsG2oQ
	 sid7E3rhlDUpetwWWN7tT4jbbLJtXrxqrwnGjsEdvHVE0MlUzGHYPxVn3uNb9uhSwu
	 sb+ErMQIFlnsa48tGxU8SrGyNaYJCarS1mQ7uj4l7xTPz4wp+zlbzJpthAWftFsj0L
	 JEMtcnbPaSt4vElD/LAjjFt/j9XCiOyp7wWSDWRQwYPnHZIfWS2pygB3ud/yh7hkbp
	 IIurirYIz12kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <7cd17d03fa70ee1f5fd5986fbb0e8a39ad7b4fbe.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <7cd17d03fa70ee1f5fd5986fbb0e8a39ad7b4fbe.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:47:54 +0000
Message-Id: <20260706104755.2B40D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree specifies `reset-gpios` for the TPM device, but =
the kernel lacks support to drive this GPIO, potentially leaving the TPM st=
uck in reset.
--

commit 5bd051d2688db25353ab678262b0998bf9810906
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mn-var-som-symphony: Add TPM2 support

This commit adds support for the ST33K TPM2 device on the VAR-SOM Symphony
carrier board over I2C. It also adds the PCA6408 GPIO expander node used to
control the TPM reset signal.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> index 53130b521b5b7..7d016ed5e911a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts

[ ... ]

> @@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
>  };
> =20
>  &i2c3 {
> +	pca6408: gpio@21 {
> +		compatible =3D "nxp,pcal6408";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible =3D "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg =3D <0x2e>;
> +		label =3D "tpm";
> +		reset-gpios =3D <&pca6408 4 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Will the kernel actually use this reset-gpios property to release the TPM?

The commit message states the PCA6408 is used to control the reset signal
to release the TPM from reset. However, neither the tpm_tis_i2c driver nor
the TPM core appear to parse the reset-gpios property or request a reset GP=
IO.
There is also no gpio-hog configured in the pca6408 node to force the pin
state.

Does this setup rely entirely on the bootloader initializing the PCA6408
and leaving the GPIO driven to the correct state?

If the system goes through a suspend/resume sequence or if the PCA6408
defaults back to an input state, could the TPM become stuck in reset and
fail to probe?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783330236.gi=
t.stefano.r@variscite.com?part=3D10
