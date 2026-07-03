Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF434374197;
	Fri,  3 Jul 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068896; cv=none; b=CbB/p+/+Q3aIPG+jIdGU/jcJvGhIO2u5DdK+Ner9dEggonnT02KlM62Cq/KdzHVZxMGksYcieocOHmWXwUIko0nVUr66rQChLdtkJ6anlt7T5n0tVMe5zVp6yM5zBV9nRxPbx3u9X7RzMAdCWQCqeSJrbkIuYu3DZQNtQdetGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068896; c=relaxed/simple;
	bh=C36EPu5rCol49T5JLzGXrNw7f+01jLKDrDGptm5/bHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SoIor0m6WbxWcHbAZ4S1MvWryAG3DmzAjlZle7OW5DnbVeEs52qAOLOL5nVcId9bflyfOfvtpKcXcL0ZlbAiILIdFkCbAnNt0vQzpgogTRLp9ee+rAG7i7kSL+U5Wb6VIMkcgCXCZmo2p1EsDx/8I56lUT2s/OHKiUD6Nk5U4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5/OkcBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5/OkcBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533071F000E9;
	Fri,  3 Jul 2026 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783068889;
	bh=Fiev911C411quc5m+ft3Tzixg47hOm8rSJ1E5OZBY7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5/OkcBhMLYPXfuaGjMeXhRUTYj5TZUf2H3SrhOcsFu8ZEYwOTnfBU6GOl69T4xcn
	 Ap9cEbOcedsnlitYuyoMhZ4RzqF+1Na3d5f0iw6yo+P8RpjPVmAjld3KHkAGZvufTf
	 hSS2GYhYzlgWVFK5bOkoziEuWzHXhJm+PvAmEkrJnxnN7SrBrCeFABrmRgZUoO8ukG
	 dvPvk3co5GtStVLenG8KWmZBRHkes6RfrbcpD1hqUJ7Wo94GZNLAXdvvwTQDBSFgxh
	 1G6G+8mj27puZGwJeQ0gvhZynETmrbbrKgrxy7yynCb7gqkXAWb+pTKgidPE4BL5c1
	 PomtF9f1y/EjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/15] arm64: dts: freescale: imx8mn-var-som: move SD
 card support to Symphony
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <87e54dbf65c27944b015335ac699fce7f45369f4.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
 <87e54dbf65c27944b015335ac699fce7f45369f4.1783067947.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:54:48 +0000
Message-Id: <20260703085449.533071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Moving the `&usdhc2` base configuration out of `imx8mn-var-som.dts=
i` completely disables SD card support on the `imx8mn-rve-gateway.dts` carr=
ier board.
- [Medium] The patch silently introduces a functional change to the regulat=
or power sequencing by adding `off-on-delay-us =3D <20000>;` to the SD card=
 VMMC regulator.
--

commit 2f4cda5f00417bf4a0771aca7e26c1a6e92521a3
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: move SD card support to Symphony

The commit moves the USDHC2 node and pinctrl configuration from the SOM dev=
ice
tree to the Symphony carrier board device tree. It intends to keep the SOM =
dtsi
limited only to hardware present on the module itself.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> index b07e71d3adeee..7308613a48b2b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> @@ -28,6 +28,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		regulator-max-microvolt =3D <3300000>;
>  		gpio =3D <&gpio4 22 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> +		off-on-delay-us =3D <20000>;
>  	};

[Severity: Medium]
Is it intentional to add off-on-delay-us here without mentioning it in the
commit message? This introduces a functional change to the regulator power
sequencing that seems unrelated to simply moving the nodes between files.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mn-var-som.dtsi
> index 32f101ef28500..e1d2e2a72e1f5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> @@ -295,20 +295,6 @@ brcmf: wifi@1 {
>  	};
>  };
> =20
> -/* SD */
> -&usdhc2 {
> -	assigned-clocks =3D <&clk IMX8MN_CLK_USDHC2>;
> -	assigned-clock-rates =3D <200000000>;
> -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> -	cd-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> -	bus-width =3D <4>;
> -	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> -	status =3D "okay";
> -};
> -

[Severity: High]
Does moving this base configuration out of the SOM dtsi break SD card suppo=
rt
on other carrier boards like the RVE gateway?

The imx8mn-rve-gateway.dts relies on the SOM dtsi setting status =3D "okay"=
 and
configuring base hardware requirements for &usdhc2. Because the SoC devicet=
ree
imx8mn.dtsi sets status =3D "disabled" for usdhc2 by default, moving this
enabling and setup exclusively to the Symphony board leaves the RVE gateway
with a disabled SD card interface lacking clock assignments and pinmux
configurations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783067947.gi=
t.stefano.r@variscite.com?part=3D2
