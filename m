Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC580463B89;
	Sat, 26 Sep 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432015; cv=none; b=tsAoYzpzz+02+8kgexrxoaKQfh4OhTtJngUQYYoYh92xQdiITMFt7Lm9JuoHVjE3m5htzE+ZtY837V4V7eAaKvTZdkdy7+4bBtkklkZqR90ptHHchyY/4Xca7r+v+z91aSS14wZw8wkzAeO3YLmCsebzAhW7L8wFuE8cZZGQbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432015; c=relaxed/simple;
	bh=/cIwmyDyOk3uv2kESLu+/iUBmNNuBxN3PzvAl3u5UUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ECJvxz8JfxMoy+n0Rw6aPdkit5V6mIN41DZTTn8P6VSjpfmNO3pNT73w+DellRxSjQrZ50BrlbcFj6kcsK6ImlokvKsXhugTZe9Ad2yRvAmkNvrEWyXeI4dFNdx+Dvz3Adq0muZulOXGoNhwVzppkW2ZAoL5qaWM3NwhEPfmjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEF1MYHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEF1MYHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212921F00898;
	Sat, 26 Sep 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432013;
	bh=sxLy17oBDekk7izYlePTkx26ixmTqwIiVNenWHIKaVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OEF1MYHiJemxiyLHrbjmOofe+AwIsApOrOLGZQ7i1sNkfXxWZeqnD2tG8WG25e/hv
	 YbqSTTE7jVmeQfDXdmiNzMulBKdAFQdpleo54ol3+CJ9iLnS4zRor2gR2TiuTnesXn
	 r/9iDk6V2pdJLBiH4EFnI04noxLWE6Cwc2WEZYTSsgyKHxc6rJ7cgHQQllYQnorMBC
	 HN2Pzw7+Tet/xgzNSuatdxcnm2lLyojW5Szt1DfhJkYxoCsSbuPeHEpavr3h7fM4SZ
	 1xhA/yCix6IG6TWkb4PqhWI4uQ6fO+KtWtfjqsZ162e+HDXg35wdcIQaascPHiVq2B
	 HVsvCFhQrGa0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/11] ARM: dts: imx6ul: Add Variscite carrier board
 files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <cb4e36a01f0e6dbbcebe86fff78686934dd845c6.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <cb4e36a01f0e6dbbcebe86fff78686934dd845c6.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:32 +0000
Message-Id: <20260926141333.212921F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] fec1 Ethernet broken on i.MX6ULZ due to shared MDIO bus disabled w=
ith fec2
- [Medium] extcon SNVS pin configured in main IOMUXC on i.MX6ULL/ULZ Sympho=
ny boards
- [Low] SD card fixed regulator defined but not assigned via vmmc-supply
- [Low] Backlight disablement override fails on i.MX6ULZ Concerto due to no=
de name mismatch
--

commit 4d8151d793ce057a2bcfb49c31175fc33cfe60f1
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite carrier board files

Add DTSI files for the Concerto-Board, Symphony-Board and VAR-6ULCustomBoard
carriers used with VAR-SOM-6UL and DART-6UL. This shares common carrier wir=
ing
across the SoC variants and keeps SoC-specific connections in separate wrap=
per
files.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcu=
stomboard-sd-card.dtsi
> new file mode 100644
> index 0000000000000..f6cec58f5a4e4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd=
-card.dtsi
[ ... ]
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Low]
Does this node miss a vmmc-supply property referencing the reg_sd1_vmmc
regulator defined above? Without it, the MMC controller is unaware of the
voltage constraints.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-bo=
ard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concert=
o-board-sd-card.dtsi
> new file mode 100644
> index 0000000000000..a6a3f417ca5e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board-sd-=
card.dtsi
[ ... ]
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Low]
Is this usdhc1 node also missing the vmmc-supply property to utilize the
reg_sd1_vmmc regulator?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-bo=
ard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.=
dtsi
> new file mode 100644
> index 0000000000000..070011d37205f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi
[ ... ]
> +	pinctrl_extcon: extcon-grp {
> +		fsl,pins =3D <
> +			MX6UL_PAD_SNVS_TAMPER3__GPIO5_IO03		0x1b0b0
> +		>;
> +	};

[Severity: Medium]
Will this SNVS pinmux group inadvertently write to the main IOMUXC controll=
er
instead of the iomuxc_snvs controller on i.MX6ULL/ULZ Symphony boards? Since
it is placed in the common &iomuxc node, it could leave the SNVS TAMPER3 pin
unconfigured and break Type-C extcon interrupts.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dt=
si b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dtsi
> new file mode 100644
> index 0000000000000..a421888663a51
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dtsi
[ ... ]
> +&fec2 {
> +	status =3D "disabled";
> +};

[Severity: High]
Does disabling the fec2 interface here also disable its child mdio bus? If =
so,
could this prevent fec1 from probing properly on the i.MX6ULZ DART board si=
nce
its ethphy0 relies on that mdio bus?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
> new file mode 100644
> index 0000000000000..377715fb4d78e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +#include "imx6ul-imx6ull-var-som-concerto-board.dtsi"
> +
> +/ {
> +	backlight {
> +		status =3D "disabled";
> +	};
> +};

[Severity: Low]
Will this override fail to disable the backlight because the original node =
in
imx6ul-imx6ull-var-som-concerto-board.dtsi is named "lcd-backlight"? It app=
ears
this creates an empty unused "backlight" node while leaving the PWM backlig=
ht
enabled.

> +
> +&can1 {
> +	status =3D "disabled";
> +};
> +
> +&fec2 {
> +	status =3D "disabled";
> +};

[Severity: High]
Does disabling fec2 here break the fec1 Ethernet interface on the i.MX6ULZ
Concerto board by also disabling the shared mdio bus that hosts ethphy0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D6
