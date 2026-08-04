Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522B477285;
	Tue,  4 Aug 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861465; cv=none; b=OauGPsBhqu7Sv9KmNgpUkKe89oYdEsH4LrEYxA8lFRNXgNYPxjR77xBJeHCY/2DFnj7U5xtGDBtR3vlAoWYYWfiMmBBtOvK/VeZvRkGj1W0kghkzlvChCc1CNByMHsKZ8UVMDosWKSMZLUU1YczO1vvw8E6J4hxcJACkUSRSntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861465; c=relaxed/simple;
	bh=FkjP6otm0o6yy7b/ktpjAfjxkpYkBuycKwY4tPhkXNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WX4eivNoHZpVYnEjbRxv/4Tud7tkQE5q2xQor8hzR/g4crI5bGoOqu1U7k2lvBgbJSgD5pZ5o9VXNn0UE3VCT7PT6wVC5h23CnRWGAPjmqUGmPPX6FPhmLewigDHq3IBvgafV8K2oPEQsb76wYysuyxwMkrWF7+aqgKK9au1vvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnW6V/V0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnW6V/V0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9751F000E9;
	Tue,  4 Aug 2026 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861446;
	bh=5FkBxZTNITsbu/MDmQLfWF2iUrskB8LBvnw8UUCDDKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WnW6V/V0I3eAOjykbdhhPfgnWf5adY2aJZSqiKE48+42RvvzC4XIrNiWLiCOOA9/6
	 G4gdEd8ECYtBSIVLY5GtGijj7C45LPq2ORqEG7xE3br0jYhRRISj+O21+y//OM9eSt
	 Ny2wx6g5JBatC/8gKdulvkVjVDhRoWMGaL2u3zpZH3G66CYChGJv5dOTCV2V0VnxBe
	 ph+UPgLu7ufx/HkN63rQqruabPOFlOlXuBa5YwXHZEOtiOKu2D0T1gjmGEOhwTHOZ/
	 mUxpyqO/Uq4J/KWZ7f+w77ycpy5r5dy0ubADqn+t246ywOEFViwuoVcL7+bEcpHP3X
	 +3IeoExfbAWtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260804162310.24374-2-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
 <20260804162310.24374-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:37:24 +0000
Message-Id: <20260804163725.AF9751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The G215HVN011 panel overlay hardcodes the backlight enable GPIO=
, breaking the backlight functionality when used with the native i.MX8MP SB=
C LVDS interface.
- [Low] Mismatch between the mathematical comment and the actual assigned c=
lock rate for the G156HCE-L01 panel.
- [Low] The built-in i.MX8MP LVDS overlay inherits and incorrectly configur=
es the external adapter's SoC pinctrls for its regulators.
--

--- Patch [2]: [PATCH v9 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 9eb4f5b623d7a9a7866c31e6663fe324b4e72663
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
with Lontium LT9211 bridge. This adapter can be optionally populated onto
the eDM SBC.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> index 0000000000000..3585170bd59dd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi

[ ... ]

> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does hardcoding enable-gpios here break the backlight for the native
i.MX8MP SBC LVDS interface?

Since the native LVDS overlay does not override this property, the driver
will toggle the SoC GPIO3_IO00 instead of the correct I2C expander pin,
which might leave the screen black.

Could we abstract this using the reg_panel_bl node instead?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/im=
x8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
> new file mode 100644
> index 0000000000000..86163d6ddd5c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds-g156hce-l01.dtso

[ ... ]

> +&media_blk_ctrl {
> +	/*
> +	 * The G156HCE-L01 panel requires 141.86 MHz LVDS clock.
> +	 * Set IMX8MP_VIDEO_PLL1 to 993.2 MHz , since 993.2 MHz / 7 =3D 141.86 =
MHz .
> +	 */
> +	assigned-clock-rates =3D <500000000>, <200000000>,
> +			       <0>, <0>, <500000000>, <993020000>;
> +};

[Severity: Low]
Is there a typo in the comment here? It mentions 993.2 MHz, but the code
configures 993020000 (993.02 MHz).

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-mo=
dul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
> new file mode 100644
> index 0000000000000..95f4761869d75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-sbc-imx8mp-lvds.dtsi

[ ... ]

> +&reg_panel_bl {
> +	gpio =3D <&gpiowifi 0 0>;
> +	vin-supply =3D <&reg_panel_bl_supply>;
> +};
> +
> +&reg_panel_vcc {
> +	enable-gpios =3D <&gpiowifi 4 0>;

[Severity: Low]
Since this native LVDS overlay routes the regulator GPIOs to the gpiowifi
I2C expander, does it also need to delete the pinctrl-0 properties inherited
from the base tree and external adapter include?

Without /delete-property/ pinctrl-0; the regulators might still needlessly
request and configure the SoC pins via pinctrl.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804162310.2437=
4-1-marex@nabladev.com?part=3D2
