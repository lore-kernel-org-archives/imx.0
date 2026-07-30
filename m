Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573D3DE429;
	Thu, 30 Jul 2026 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452284; cv=none; b=c7pfSDwY8T+fo6oUefEaYIWnlP2fUredwzXNi0Cdc09HFeRqu2QzDYvDK6427/pJDjf3v633G6ukFzpy/Ry6C0cjGJBK6lqn1yttU8DUeBgkFTrNRs+BAEcHuxwf9tt7DtLs7nMmjFPrCAPwCX8TWnF3pv8L9p+TTAjT3yoOdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452284; c=relaxed/simple;
	bh=1jcVZI3BGRxkLZ78EjUc/6n1a/zfiRmYJapLbAjk28k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UW6qneQWuEzz8bprc9eU7acUqIEO9IO87CxkXHODI79u8rRe9s61uT19jTQBbsB7U55bndq3oHl38wxG5kAC3iRVNQUBpFsopyzKYknPWFlWrYDytkRGmmmqL64zmpSqsIfN5ukBxfREIgsnYM5xzXQ6to0udnoQMq8TtdzU8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8hy0TB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8hy0TB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A493F1F000E9;
	Thu, 30 Jul 2026 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452283;
	bh=4vqSJz95Tr8G5oJ9CeWcUu4d5FSSIr248BCA2OGwYOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8hy0TB3VrAHVC0s41EPwtLnMYZ1qqT1AI+4qvUlbEjCopS/OVQ/gYWtcDf7F6neZ
	 gCmq1fcySnY8Da3rDi1IfUn79tbZGLNB3JeNlRXOyjE1Tj9ZJP1d+lCQHRJKPfA4HB
	 zZF7IdzbIklswwhFNeW9UE1aKU/shgOnFmoNei1hMSX7h0jRvNC/GiXmh7jjB3aNhh
	 8ypTp2DE3mYOGVW2io2vtqhLEb921pDAQGdeI8Jej5JZNdZHoOaBIyDrU92WCtHel8
	 p2rgzZ0SveCYeAnpRsfaJbtDt7s44GGx58oe/HS9so2SAOSYkzMul1UIODZa3KlOew
	 rECeuZgbWqYJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260730224351.95006-2-marex@nabladev.com>
References: <20260730224351.95006-1-marex@nabladev.com>
 <20260730224351.95006-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 22:58:02 +0000
Message-Id: <20260730225802.A493F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The G215HVN011 panel overlay hardcodes the adapter-specific back=
light enable pin, breaking the backlight on the i.MX8MP native LVDS adapter.
- [Low] The documented MP2328 voltage divider formulas and resistor values =
mathematically contradict the claimed output voltages, risking hardware dam=
age if copied.
--

--- Patch [2]: [PATCH v8 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 7f9fe59083c08b9930a9101dbccb23e4a6fbf244
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
with Lontium LT9211 bridge. This adapter can be optionally populated onto
the eDM SBC. This adapter can be extended with multiple panels.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> index 0000000000000..3585170bd59dd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi
> @@ -0,0 +1,30 @@
[ ... ]
> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;
> +	/* 6.5 POWER ON/OFF SEQUENCE, T6 >=3D 10 ms */
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx=
8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
> new file mode 100644
> index 0000000000000..a6d13c3609796
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g215hvn011.dtso
> @@ -0,0 +1,36 @@
[ ... ]
> +#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
> +
> +&backlight {
> +	power-supply =3D <&reg_panel_bl_supply>;
> +};

[Severity: Medium]
Will this hardcoded adapter-specific backlight enable pin break the backlig=
ht
on the i.MX8MP native LVDS adapter?

By setting enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>; in
imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi, the adapter-specific
gpio3 0 pin configuration leaks into the generic panel configuration.

Because the native adapter overlay
(imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso)
includes this generic panel file but fails to override enable-gpios
(to <&gpiowifi 0 GPIO_ACTIVE_HIGH>) and remove pinctrl-0, the native adapter
inherits the incorrect gpio3 0 pin, which may leave the backlight off.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-mo=
dul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
> new file mode 100644
> index 0000000000000..b06af369a9245
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds.dtsi
> @@ -0,0 +1,79 @@
[ ... ]
> +	reg_panel_bl_supply: regulator-panel-bl-supply {
[ ... ]
> +		/*
> +		 * MP2328 voltage divider settings:
> +		 *   R1=3D51k1
> +		 *   R2=3D5k62 with optional series Rs=3D2k21 (12V)
> +		 *
> +		 * 1 / Rx =3D (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
> +		 * Vout =3D 0.5 + ((R1 / Rx) * 0.5)
> +		 */

[Severity: Low]
Is this mathematical formula for the MP2328 correct?

For the 12V backlight supply, calculating Rx in parallel (1/Rx =3D 1/R2 + 1=
/Rs)
using R1=3D51.1k, R2=3D5.62k, and Rs=3D2.21k yields Rx=3D1.586k.

Applying that to Vout =3D 0.5 + ((51.1k / 1.586k) * 0.5) gives approximately
16.6V, not 12V.

To achieve 12V, Rx needs to be exactly 2.21k, which means Rs would have to
replace R2 rather than run in parallel with it. Is it possible the formula
was copied from the AP63300 comment without updating the calculation method?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730224351.9500=
6-1-marex@nabladev.com?part=3D2
