Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133B3B8405;
	Wed,  8 Jul 2026 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539197; cv=none; b=DgoSdKRbBgTqUssC7H3t7y/MnPSz11YrqjCTdykIby0+F2HFF9tLCkxflvIbXA+ioS40bx4dgy1pBViCUqWFauCnrZEeF2YEPEX6W9PG/V6Piuk8I0dnwqC384ItLFmTBxrEj8PuReVqc7gvDgizstYY0+h1XEXC8CG9Fl2Ws1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539197; c=relaxed/simple;
	bh=IA2X3JrtXkQ0X5oDzj1XlIo+bnOml/YZMG7g0W/D/xY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+Y7QB34lIYOb8ho+QtqQpROEdSbh7W/qs3Vf/5rZSaRx/mDAfRp6KPP9/cjURToFu9DF3BvVPFUjPdBnzCvY+yMmAYDzivd49Wc7kmT3S8POI0U0n2FCLwz+y8c/p0VabRvBVNbnLKmmEOw9nz0fesjO4sTlwmT1TIQhbGmiiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvGalbIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvGalbIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8821F000E9;
	Wed,  8 Jul 2026 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783539196;
	bh=qcBYfFq0WQmCqqQUoi03aFwT1WzRmvljiH1w8pTgowI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lvGalbIB/V/Dm3bNWQzJUni1XDWEmpZ1TdDT+tzGlXEZRFI6ZrB60y07pf/HV0GUP
	 WjgVtIG80Qqr6mhiIhwEA2jRm/UgYCLDSW+rIy+co9Or5OwLCvHOAOzhivJDTEi/ze
	 B94FhaY0Rn7j9a3+8yjV4FI9m+SteUBlt9gmGvSZ80ra7he0/0neiWRLdClyfRz39C
	 67aFbY4o3BXJ1MSxCb4u4oKYMs7xIqE46/Hqe1hZKqh7mHGtjoxcfo/UsAqsP5RrBV
	 9oW6i3KBc8EAiu9fgP2iV7diJ35OV/ujjc3Ed1kHGn1tOmqa53G95f9KqbN3BEUcdX
	 1glw8L1/OGC2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to
 fix CHECK_DTBS warnings
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-ls-dts-warning-v1-1-5daa24061c31@nxp.com>
References: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
 <20260708-ls-dts-warning-v1-1-5daa24061c31@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 19:33:14 +0000
Message-Id: <20260708193315.9B8821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Appending the '-led' suffix to non-LED hardware components artifici=
ally bypasses DT schema validation while falsely describing the hardware.
--

--- Patch [1]: [PATCH 1/5] ARM: dts: ls1021a-moxa-uc-8410a: add led suffix =
to fix CHECK_DTBS warnings ---
commit 74fab37b2f25e9ccf8e82f5b1103b80dbcd12253
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix CHECK_DTBS warnings

This commit appends the -led suffix to several nodes within a gpio-leds
block to resolve dtbs_check warnings.

> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts b/arch/ar=
m/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
> index d2cae8c7d7a61..8efe6b615ca85 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
> @@ -40,13 +40,13 @@ reg_3p3v: regulator-3p3v {
>  	leds {
>  		compatible =3D "gpio-leds";
> =20
> -		cel-pwr {
> +		cel-pwr-led {
>  			label =3D "UC8410A:CEL-PWR";
>  			gpios =3D <&gpio3 27 GPIO_ACTIVE_LOW>;
>  			default-state =3D "off";
>  		};
> =20
> -		cel-reset {
> +		cel-reset-led {
>  			label =3D "UC8410A:CEL-RESET";
>  			gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
>  			default-state =3D "off";
>  		};

[Severity: Low]
Does appending the -led suffix here artificially bypass DT schema validation
while falsely describing the hardware?

Placing these cellular modem control lines under the gpio-leds compatible
node was existing behavior, but renaming them to include -led simply hides
the validation warning from the linter instead of migrating the pins to an
appropriate modem or power controller abstraction.

> @@ -58,13 +58,13 @@ str-led {
>  			linux,default-trigger =3D "mmc0";
>  		};
> =20
> -		sw-ready {
> +		sw-ready-led {
>  			label =3D "UC8410A:GREEN:SWRDY";
>  			gpios =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
>  			default-state =3D "on";
>  		};
> =20
> -		beeper {
> +		beeper-led {
>  			label =3D "UC8410A:BEEP";
>  			gpios =3D <&gpio0 20 GPIO_ACTIVE_HIGH>;
>  			default-state =3D "off";
>  		};

[Severity: Low]
Is it correct to label an acoustic device as an LED?

Similar to the cellular GPIOs above, using gpio-leds for a beeper is an
existing inaccuracy, but renaming it to beeper-led strictly to satisfy
the regex solidifies an incorrect hardware description. Would it be better
to migrate this to use gpio-beeper instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls-dts-war=
ning-v1-0-5daa24061c31@nxp.com?part=3D1
