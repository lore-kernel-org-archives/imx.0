Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572810;
	b=UrX7f5oMmDRp2/Kmk54kQdKDdUNe3A0cYmG3OHjKSyYyvADyX7B6Bo5bSylyMdl6ji6J
	 NnP/7MLMo4BP3KMvKXEWEDRf9ZUpcs09k0M0Om4V5GNALe6wT/Y2wpPt2Ni+23TsHteFB
	 Kgx8sLp6cqQGU1nDditxgym0M/dJpmSlnK3V68jWdTJ5PoqqSHCJTjXRO+nN9BKiwEuQJ
	 vqMM8fyEoShs+sfiV8gH8g693et/uMMmXDei+ViTET9E5zVZSe8Bi0h6ctmEj/wLGD8sV
	 QcKm5ldmqni6jXmAY4J6aiyRBCT2beHvJ2+P5e79s6BZwUzhPDiOQLEGWGADq1xohxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572810;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QfifPJMf0jj3XcnoaFXRLLnQtKD3QBHTpiJ+wC9FSO4=;
	b=yQX0wj0Q8Wvzm73wM4SgHfQzSabV4RkmYeKhgXn1Am2E63PZHms+ATJ5A/Ihgocz91M6
	 AETXf3ZylqC7esOebtmrvFPTRA2A98SrrQJVGfUknS21ottvhr0ewyEBKLHD31ogERsoG
	 IDh8qjZJvZi/o/DWVKH8yMV8rnMo+Yd83CITaTpE0Psj7lme0Ca/a7/TSNLJtbJGJoyKR
	 fjD3ttmzox5xzpFJWRGYS4/nmy5fPR9QPHpCv9EE5eDeaBBfzjV+v+Em7Fk1kXY/4nWoh
	 Lf34XL1vqgYbzu78f5yJ1472kuLDj5fnKRRLhtGPbzRLWA8el9vxMMcQh2wOV1asimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqt6miEW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030F606A31B;
	Wed, 21 Oct 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqt6miEW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EB41F000C9;
	Wed, 21 Oct 2026 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792572810;
	bh=QfifPJMf0jj3XcnoaFXRLLnQtKD3QBHTpiJ+wC9FSO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqt6miEWeV9aK2twfFzpl2nG9OalkQ74dFbzpK67AZVTTh/fy8Yz1jERfslz5thKJ
	 1dc46SrABiWPg0fKciZbzRPnFcVHT8F1NJf3mWfrEJe2udtFi4KqHdOiCrlPqPqb1x
	 l4BRuU2KNd/V5BNbMczz7qfZ4Iam4ObV84fA7IESDrLkqUdSCkJkmiJdmDs1Z1vuUN
	 PaYnsu7Xq1gidOAP53D99xZYsgdKIUitkGm5Kk92uqMxVnwHrh9gYqlP11NRlUmV42
	 zdnpm1Z22X6KDaxGVl3AeYcuIHo6j92rAzkgfD1pArAFMwjH5XcH2c5Q/o9WSldDgM
	 EMFS7GrKohTXQ==
Message-ID: <sashiko-outbox-179991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kaszubski" <sympthicode@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
References: <20261021084602.121087-1-sympthicode@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:53:29 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARM: dts: imx7ulp: tpm6 placed under ahbbridge0 instead of ahbbridg=
e1
--

commit cb9013d8dcda32d8a277bf006e44680f1bf14cb8
Author: Krzysztof Kaszubski <simpthicode@gmail.com>

ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP

This commit adds the tpm6 (pwm@40a10000) device tree node to
arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi to enable PWM and timer support in t=
he
Application Domain.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/n=
xp/imx/imx7ulp.dtsi
> index 39e37ae9b2b1e..f5ec5e9d65de2 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
>  			clock-names =3D "ipg", "per";
>  		};
> =20
> +		tpm6: pwm@40a10000 {
> +			compatible =3D "fsl,imx7ulp-pwm";
> +			reg =3D <0x40a10000 0x1000>;
> +			assigned-clocks =3D <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +			assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
> +			clocks =3D <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
>  		usbotg1: usb@40330000 {
>  			compatible =3D "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
>  			reg =3D <0x40330000 0x200>;

[Severity: Low]
Should tpm6 (pwm@40a10000) be placed under ahbbridge1 instead of ahbbridge0?

In arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi, this hunk inserts tpm6 inside
ahbbridge0 (bus@40000000) between tpm5 (tpm@40260000) and usbotg1
(usb@40330000). However, ahbbridge0 only covers the address range 0x40000000
through 0x407fffff:

	ahbbridge0: bus@40000000 {
		compatible =3D "simple-bus";
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		reg =3D <0x40000000 0x800000>;
		ranges;

Peripherals in the 0x40800000..0x40ffffff range and clocked by pcc3 reside
under ahbbridge1 (bus@40800000):

	ahbbridge1: bus@40800000 {
		compatible =3D "simple-bus";
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		reg =3D <0x40800000 0x800000>;
		ranges;

		lpi2c6: i2c@40a40000 {

Placing pwm@40a10000 under ahbbridge0 puts it outside the parent bus reg
range and out of unit-address order when compiling or validating device tre=
es
that include imx7ulp.dtsi. Should tpm6 be moved under ahbbridge1 right befo=
re
lpi2c6 (i2c@40a40000)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021084602.1210=
87-1-sympthicode@gmail.com?part=3D1
