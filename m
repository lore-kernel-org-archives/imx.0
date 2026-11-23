Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433517;
	b=L9/VPsRMZ20JpCH0HN8B9NjT4Oks35H07AQd+DOu947HqnjtxjB0qX/VHOB09TX0zrDk
	 APe7rtGQ4xCl4DHJgsBhcG//6U2rwNK0GY1KjBy28HEcWlnFS/XvKrY8c7HjEO6cAGXIT
	 gnwckGgxoyZRWSpg3pwoptigj3AKDXsBiXW7AUky7J3CzDpNk5ui8LuJg+Fwd1QbhZeM0
	 jfTUsMAy0lpbx1LTPaC2sjjoI7zgD0SzTK+Rm7u5UmKdhKVVORoHh5iKfrdyxNnf3N5bj
	 u9vgbrtYxizwaVjBE9tYBN35UvpLxFVmueAFuwR0dSyFzj+gbX92lnoT7EPE8gfjJ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iFQx7ij9ao3ncm+SaqcJRRS379BU6ubkMJ9vCKsJ9PQ=;
	b=qwDSzU/ilfayLRo30i/GyliYn2hpUhc8ttMurW0gUt7fxKwjo775bZ7RLbNggNVTxGsQ
	 3NmPsZiwf/mZuxFY+/XkAC/UwvIebS92xfuMdb3zNDoO2ez7AaLWAdx3jABr9BU4EAORF
	 q0GFUUBVQS66KtX0ISRmD1eVwQ/j+83YE6bo4U+HHe7ZK8tRgNiOAW2LLx4JXHubhwjoz
	 B8HPufW2Q1G5b2fC/fy2okltk8A6GL0bv+vrlNodlHy+6qZmuE8O1mcqi7TfYckZNBcOh
	 j+f2L26lBPtbKsMJzVk3Su40XVqLUx3i+q3/QZXKzCSIY5XAvd5s8It7dpF4Wx1FuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQxKqQ3i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B1606A31A;
	Mon, 23 Nov 2026 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQxKqQ3i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA51F1F000C6;
	Mon, 23 Nov 2026 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433517;
	bh=iFQx7ij9ao3ncm+SaqcJRRS379BU6ubkMJ9vCKsJ9PQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQxKqQ3i1pr04Ae/CToJvR9MaTlNlt96KW7ucZDBfBdghcdGo1VG3036vAcv2fkQo
	 F1k4jgS3f5NVdQfW8ccxYsh6QMk7bRFKrZsUCdHeffoDhb2Fo7+Fx1EaBEjA/dPS7U
	 XhVK5VRh/FxPX/CjpVI/VCLtikOv7tmvuxhmixws8Vt+qAvml+ir4qUsxxlVIYiToY
	 sc19JmfVEv5syfBLOLs8Jvgt9W8vFw5WUWH/eSXjffWykyZHlk4tnL2Lz0ygqHAHRQ
	 lTdVpbQ6THZSC7t4dZAhDRBIcZ08D6wm6NaByYR3ZcuIMvjgaUJFJJsDSfdx1TdljD
	 LE2ntX37fXWFA==
Message-ID: <sashiko-outbox-229145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe PCAL6524 supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Freimut Diener" <f.diener@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:31:56 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: imx93-11x11-frdm-common: fake fixed regulator for
  pcal6524 vcc-supply
--

commit e42789fdf3e25ebbcd3c5baf782ad166ded4e5f4
Author: Freimut Diener <f.diener@pengutronix.de>

arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply

This commit adds a fixed 3.3 V regulator node as a proxy for PMIC BUCK4
and wires it to the PCAL6524 GPIO expander's vcc-supply to avoid a circular
probe dependency between the PMIC and its interrupt parent.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b=
/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> index b3dfe516b1d55..e81b2342c50dc 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> @@ -49,6 +49,19 @@ button-k3 {
>  		};
>  	};
> =20
> +	/*
> +	 * PCAL6524 is powered by PMIC BUCK4, but the PMIC uses PCAL6524
> +	 * as its interrupt controller. Model the supply with a fixed
> +	 * regulator to avoid a circular device dependency.
> +	 */
> +	reg_pcal6524_vcc: regulator-pcal6524-vcc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_3V3_PCAL6524";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible =3D "regulator-fixed";
>  		off-on-delay-us =3D <12000>;
> @@ -207,8 +220,7 @@ pcal6524: gpio@22 {
>  		gpio-controller;
>  		pinctrl-0 =3D <&pinctrl_pcal6524>;
>  		pinctrl-names =3D "default";
> -		/* does not boot with supplier set, because it is the bucks interrupt =
parent */
> -		/* vcc-supply =3D <&buck4>; */
> +		vcc-supply =3D <&reg_pcal6524_vcc>;
>  	};

[Severity: Medium]
Should reg_pcal6524_vcc be added to the Devicetree when no separate
fixed regulator exists on the board?

Devicetree describes the physical hardware topology rather than encoding
workarounds for Linux driver probe ordering or dummy-regulator log
messages.  Modeling BUCK4 as a standalone always-on regulator-fixed node
misrepresents the board's power tree in the DT ABI and instantiates a
redundant platform device duplicating the regulator core's dummy
regulator.

In Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml, vcc-supply
is optional, and other i.MX91/i.MX93 boards with the same PCA9451A and
PCAL6524 topology (such as imx93-11x11-evk-common.dtsi and
imx91-11x11-frdm.dts) omit vcc-supply on pcal6524 until the cyclic
dependency between PMIC IRQ resolution and expander supply lookup is
handled in the kernel drivers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-imx93-frdm=
-fixes-v2-0-dd97c7fca4b1@pengutronix.de?part=3D2
