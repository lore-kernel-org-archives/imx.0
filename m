Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7103033EC;
	Sun,  5 Jul 2026 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282932; cv=none; b=NEDQkCHRd9S1OQ5GBaSB5D9f8HXL3Z/WXjQ8rqFfhQQb7n/wuhUUf79YOfpYAT3hrYhAp07zdqp8orQNmwey1i+xOO+WHNvvYNGrFYYDx0s2HOpMkYQwRmFtYvt8ikc6rwpAgOoH7puM6uEKgafoeIXuuftrhUuoJeSuzoM4Tw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282932; c=relaxed/simple;
	bh=630NZWIWghc2i1xEWQEupUfCvZrp0c+SaC+EFiCdVjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YjUaxLrP7tx1bsNWQ1VB1zszjagM06y5NDAAXGSeilQnHpyzQ4K7++tsm1PazZg1uYPxyxhqmA6UMSqTJXUroZarQcZyF++iWPP/zIU65K5DZbd2MsD2oasE+Kkt8mHRTYIkIl5cvDO0Iqf7LKUAiQ4+ERCvrnv3LO4SZLZ5KYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMA1D4Cf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMA1D4Cf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B33C1F000E9;
	Sun,  5 Jul 2026 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783282931;
	bh=7twe035JGRukfZHpyLgKiHv9eL4dM3dECJc4yFf2aZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMA1D4CfjV7hjCrAdz23EgdfRJfjt3L9bbm+gEyxRQcVsWsrs5Ju/28zcP6Df9zwv
	 4RAvUg9zLd6nkkqQ37M+4wXenmK4brRgKe5fK/hrrxvZBvVMZpNYmIDtUMf0ET1GPO
	 8e0xW63uRYIsMQZCWcbShxvzZO3HcZSrEbPW8UdDjhRYLHic/tskX+Rg2mNnaaL4rh
	 YarHAMXjhLJZvVl3pxTQeLj5He23pM78IEhDxwcuoIdPOvsEDk2TDL7GpHJ08OBcqQ
	 yIzbbl8MFlljYA8fcBoL9ODjbeB06bl7Jm0OhCdBInGmaJ5kHWHobOeQfdCoayag4m
	 kt2CyK1U8WEyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705200534.151803-1-marex@nabladev.com>
References: <20260705200534.151803-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 20:22:10 +0000
Message-Id: <20260705202211.1B33C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The G215HVN011 panel overlay hardcodes the backlight GPIO (`&gpi=
o3 0`) and pinctrl, breaking compatibility with the native i.MX8MP LVDS ada=
pter which requires `&gpiowifi 0`.
- [Low] The DTSI file for the G156HCE panel has a typo in its filename, usi=
ng 'g151hce' instead of 'g156hce'.
--

commit efae14021476e67ea060b69a60b51676e1ba8af5
Author: Marek Vasut <marex@nabladev.com>
arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

This commit adds DT overlays for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS
populated with a Lontium LT9211 bridge. The adapter can be extended with
multiple panels, supported on i.MX8M Mini and Plus eDM SBCs.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi b/arch/arm64/boot/dts/freescale/im=
x8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi
> new file mode 100644
> index 0000000000000..f478f4e557cce
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-lvds-g151hce-l01.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Marek Vasut
> + */
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"

[Severity: Low]
Is this filename supposed to be imx8mm-data-modul-edm-sbc-overlay-edm-mod-i=
mx8mm-lvds-g156hce-l01.dtsi
instead of g151hce? The panel appears to be G156HCE based on the included
files and the commit message.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/im=
x8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
> new file mode 100644
> index 0000000000000..5f77946e042e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-lvds-g156hce-l01.dtso
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023-2026 Marek Vasut
> + */
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-=
l01.dtsi"

[Severity: Low]
This includes the potentially misnamed g151hce file from above.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-=
edm-sbc-overlay-lvds-g215hvn011.dtsi
> new file mode 100644
> index 0000000000000..3585170bd59dd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvd=
s-g215hvn011.dtsi
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
> +
> +&backlight {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_panel_backlight>;
> +	enable-gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Will hardcoding the backlight GPIO and pinctrl here break compatibility when
using this panel with the native i.MX8MP LVDS adapter?

By setting enable-gpios to <&gpio3 0> here instead of using the abstracted
reg_panel_bl regulator pattern seen in other panels, the native i.MX8MP
adapter (which requires <&gpiowifi 0>) will likely fail to turn on the
backlight.

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
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023-2026 Marek Vasut
> + */
> +
> +#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
> +#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
> +
> +&backlight {
> +	power-supply =3D <&reg_panel_bl_supply>;
> +};

[Severity: Medium]
Should this native i.MX8MP adapter overlay override enable-gpios to=20
<&gpiowifi 0> and delete the pinctrl-0 property? As it stands, it inherits =
the
<&gpio3 0> setting from imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.d=
tsi
above, which means it will toggle the wrong GPIO for the backlight.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705200534.1518=
03-1-marex@nabladev.com?part=3D1
