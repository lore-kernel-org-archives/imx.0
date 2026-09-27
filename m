Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96555370AE6;
	Sun, 27 Sep 2026 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507182; cv=none; b=JmWCr3iGALRacJxFOEcpTUvcTzrOhlAtvMMuDFEbn66Hl0VzRF6JzTwYoGeOUhbdksQLelbLNsUj14iSGw15p/UsJH+Z5F95QTynrLq+VoEvbIwChKyoKhrZTJa8IvYI5n+1+5xjomjQ2iR94GfsyDllS9o1P4t3RDZ8/ejdxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507182; c=relaxed/simple;
	bh=kWM4MpPKFDCINnCA/Lks2/ycRxTtBB7y28iKoD4V7r0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V8khke91QIV2MBdzBqXRNpGj43VUqE/z6wXJz8yWXt+G9cfkVvsxwKllpYgdNQGxZgqzpfR9tmc1XY+bsdAUb9vYauXvMqzSdsbHzA0C2Jh8gFJW+V1YCScEXrpBEetARn7okO7/LrqTYTE+UknDJL+fWeNJ29V2yMNW5pvlfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jucVydHv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jucVydHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAF21F000FF;
	Sun, 27 Sep 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507181;
	bh=5IeREHfJN4Ntdq4u38f7jkw6rlsLTuf8C6UhRTyvfSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jucVydHveystxjL1CYJGM1mFv8fw5CAsaPg7n/9fSR6evUKPQG0ZZbBQ7aJBBfeF/
	 ORcwP64EINPqOT1VkQLl0DHsr5PTQlCH33zZhH9xkokqpeRZdGFblT3gfdhJ+/pFRI
	 tzbqNtacr31UAf1obeoLjITBTHmUgpReUCe4PoLpLpmYP5Hl8pUhFA4JBgYmJfbslm
	 nUC2SlLYF42sMMuk00Q7RmyTm/Xf7ch/aFCJPEhGJc00h/ptF5Jd4nBnN/FmDxIbYq
	 rMEsndcMxnx+P2wXUN9G9C+44SB/8WtZ9NQ3o3WmMyo657p9tNJv980uxLeOd39c3L
	 A5y7cZjuThu/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] ARM: dts: imx6ul: Add Variscite carrier board
 files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <574d8f2be44ad9957d796d155b2be366f5eee8f5.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <574d8f2be44ad9957d796d155b2be366f5eee8f5.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:20 +0000
Message-Id: <20260927110620.EAAF21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] dt: pinctrl configures SNVS pin in wrong iomuxc on i.MX6ULL breaki=
ng extcon
- [Medium] dt: SD card fixed regulator reg_sd1_vmmc is unreferenced by usdh=
c1
- [Low] dt: interrupts use IRQ_TYPE_NONE or 0 instead of hardware trigger t=
ype
- [Low] dt: ineffective backlight node disable on i.MX6ULZ Concerto board
--

commit 0f5f420751205e116ebd8d4705179e8c32c39131
Author: Stefano Radaelli <stefano.r@variscite.com>
ARM: dts: imx6ul: Add Variscite carrier board files

This commit adds DTSI files for the Concerto-Board, Symphony-Board, and
VAR-6ULCustomBoard carriers used with VAR-SOM-6UL and DART-6UL. It shares
common carrier wiring across SoC variants and keeps SoC-specific connections
in separate wrappers.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcu=
stomboard-sd-card.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd=
-card.dtsi

[ ... ]

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

[Severity: Medium]
Should this node reference the regulator via a vmmc-supply =3D <&reg_sd1_vm=
mc>;
property? Without it, the MMC subsystem is unaware of the slot's operating
voltage, and the regulator framework might leave it uninitialized or disabl=
ed
since it appears unreferenced.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomb=
oard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboar=
d.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard.dt=
si

[ ... ]

> +	touchscreen@38 {
> +		compatible =3D "edt,edt-ft5406";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ft5x06_ts_gpio>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <4 0>;

[Severity: Low]
Does this properly configure the hardware trigger type? Specifying 0 instead
of a physical active state (like IRQ_TYPE_EDGE_FALLING or
IRQ_TYPE_LEVEL_LOW) causes the kernel to rely on bootloader remnants or
driver-level hardcoded overrides.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-bo=
ard-sd-card.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concert=
o-board-sd-card.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board-sd-=
card.dtsi

[ ... ]

> +&usdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Medium]
Similarly here, should this node link the 3.3V fixed regulator using
vmmc-supply =3D <&reg_sd1_vmmc>; to ensure it is properly managed?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-bo=
ard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.=
dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-concerto-board.dtsi

[ ... ]

> +	touchscreen@38 {
> +		compatible =3D "edt,edt-ft5406";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ft5x06_ts_gpio>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <9 0>;

[Severity: Low]
Is the interrupt trigger type intentionally set to 0 here as well? Providing
the explicit trigger type described in the device specification and schemat=
ic
is generally preferred.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-bo=
ard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.=
dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi

[ ... ]

> +	/* USB Type-C Controller */
> +	extcon_ptn5150: typec@3d {
> +		compatible =3D "nxp,ptn5150";
> +		reg =3D <0x3d>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_extcon>;
> +		interrupt-parent =3D <&gpio5>;
> +		interrupts =3D <3 IRQ_TYPE_NONE>;

[Severity: Low]
Does this correctly describe the physical interrupt pin? IRQ_TYPE_NONE
often relies on driver-level fallbacks rather than strictly defining the
expected hardware state in the devicetree.

[ ... ]

> +&iomuxc {
> +	pinctrl_ft5x06_ts_gpio: ft5x06-ts-gpio-grp {

[ ... ]

> +	pinctrl_extcon: extcon-grp {
> +		fsl,pins =3D <
> +			MX6UL_PAD_SNVS_TAMPER3__GPIO5_IO03		0x1b0b0
> +		>;
> +	};

[Severity: High]
Will this clobber the JTAG TDO pad on i.MX6ULL/ULZ variants? On i.MX6UL,
SNVS tamper pads are configured via the main iomuxc controller, which works
correctly. However, on i.MX6ULL and i.MX6ULZ, SNVS tamper pads were moved to
a completely separate iomuxc_snvs controller with different base addresses.

Since this is defined inside the shared &iomuxc node, booting an i.MX6ULL
will incorrectly apply the SNVS pin offset (0x0028) to the main iomuxc
base, breaking the Type-C extcon interrupt. Should this be moved or
overridden in the i.MX6ULL specific file using &iomuxc_snvs?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi

[ ... ]

> +	touchscreen@38 {
> +		compatible =3D "edt,edt-ft5406";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ft5x06_ts_gpio>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <6 0>;

[Severity: Low]
Like the other touchscreen definitions, should this specify the exact
hardware interrupt trigger instead of 0?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dts=
i b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi

[ ... ]

> +#include "imx6ul-imx6ull-var-som-concerto-board.dtsi"
> +
> +/ {
> +	backlight {
> +		status =3D "disabled";
> +	};
> +};

[Severity: Low]
Will this actually disable the backlight? The common inclusion file
imx6ul-imx6ull-var-som-concerto-board.dtsi defines the node with the name
lcd-backlight rather than backlight.=20

Because the node names mismatch, this will likely leave the lcd-backlight
node enabled and create a dead node named backlight. The kernel might
unexpectedly attempt to probe the PWM backlight driver. Should this be
&lcd_backlight { status =3D "disabled"; }; instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D6
