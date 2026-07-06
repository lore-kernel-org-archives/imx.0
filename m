Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B56374E62;
	Mon,  6 Jul 2026 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334297; cv=none; b=LdMqqwVT8kYhxalu4FH1aoeFcW68Ykt9+ApJwlXYe029QazdLNORSV4Ez3EFwKt6lqt1Xx1G+lyjdLRNiP6hoiWHU/vTBugHI5ZlOqoAo72P4a7x6cFVIf7hGroA0UAAVrMHGVFKayW8xOxCU+2/q6d7y2sIZvLB2HEhzObsfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334297; c=relaxed/simple;
	bh=jXH5uikLilh0GjsNFQtMlf4YAdOO0KTEtG67HPp1Etc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nW2Xb8EHbhnTGRuY+WAMpncrCQBKYGrAMAEgU+An+rh4vsOP1wjrOxltEs94lcLRDd1mhRBZoqp6Z22IYWYV6Wi31zrss6DneFwqlJwVoB0P49LKpuLtATE219xHWC6i/Fde3UTLGoUhlogc2nRCDUjzVP7G5YqG4evhAoxzjBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8gRo9oO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8gRo9oO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354A41F000E9;
	Mon,  6 Jul 2026 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783334295;
	bh=30VSOIRa77iZmz+twNLwjPyHuyPZ86Y1pLBMB8RoP/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J8gRo9oOaU/fuSrPwsST8msYn+sMfgyPlNrIxVgYQ2J47HXxCi/Bg9v0mn89o/3cO
	 Y+5Ik1mKEFZqCoBUHMb5SXTFDdkfKmM5uoLMEz0WyE/jD9T5z42QCs6ubgtxFBFqz+
	 FC/+/jnNcHNvWFZLqJ4UxkRifYvNeL6ddXorYmioDO/JmSX960uAFV9d1YWhsa6V2H
	 NmnTb8dY+u11nggrTjznrintfIAdxTy3mfT7RkbRPtQCvX5DCSPo/1A7fi49nWw8I0
	 n7oLlsNuDqSDWBOqbvOV8+5+B2g3NUN4jto/qTwYJSdJW2fQnx6rq1+rPZZyen7bu1
	 PYkbYd/aOMr0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/15] arm64: dts: freescale: imx8mn-var-som: enable
 FlexSPI interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <4cb1d292b7899c72cbdaea212dcefc04e6705dda.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4cb1d292b7899c72cbdaea212dcefc04e6705dda.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:38:14 +0000
Message-Id: <20260706103815.354A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The FlexSPI controller is unconditionally enabled in the SOM dtsi b=
ut lacks a child node for the connected SPI flash device.
--

commit 636db0e489f17ce6e70d2d0ddbe2135a87fefaff
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface

This commit enables the FlexSPI controller on the VAR-SOM-MX8MN and adds
the corresponding pin multiplexing configuration.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mn-var-som.dtsi
> index 7a4c7455a1622..0bc9fb44069e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
[ ... ]
> @@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
>  	};
>  };
> =20
> +&flexspi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexspi0>;
> +	status =3D "okay";
> +};

[Severity: Low]
Is it intentional to enable the FlexSPI controller unconditionally in the S=
OM
dtsi without defining a child node for a connected SPI flash device?

> +
>  &i2c1 {
>  	clock-frequency =3D <400000>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783330236.gi=
t.stefano.r@variscite.com?part=3D9
