Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165D36AB57;
	Fri,  9 Oct 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575375; cv=none; b=WDrk/sET65Ui7W3lXWqis9m3AyJiLQ5sa8OiUjCJuoey9ynHok2rOILzH6d/z2FGc7Zjwj70EpnQMj7Ilg5bBlC4ZZ73d6Gs9uPtzEDJvU59EHOJzVx9X7p0NB+cr3LM/OrlGatg5sfDSiI8EZbt0rzcpvosIENB2b0Z/QDI4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575375; c=relaxed/simple;
	bh=Cd3pyvwHTdkeTBhiqlWmKZuETcr4ezo572YKu7LNlIA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QErGixjXobOGibIRONkRHHK/ghNuOySrClLuxVwS5aQRpYeqlfLsBZws4VhMi+t84sgiBesw6QC8K0MEu8JmBNlL0cAVX1e50L9tj3W+W76FPmEXbqax6LBj1IBQd1o5balb4hLsU+nRRolESrens2UCKhkiydcJYCkcWFdhRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS+ryji7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS+ryji7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAF91F00898;
	Fri,  9 Oct 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791575367;
	bh=bynrQpX/acVHxCzUDJLM8xg8SOHun+G+wT9lT9OVwQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JS+ryji7rZW6nomQf/ev0a+dmbv3F6Sc383iA9VXdW5Ac5qaH7pWMmYH68xdnr82y
	 kMYNBbkbjDkNCXGYu58N1rAg4BGXQtptgHig9GeZmPvfFE4RyAD5p8h2d835BDk7zv
	 f6YHh/cz5ie2SBcSmLJJR5K5qI+D5EXGvKBeMhi2CuwTxSiLS+nGys6GFJuqKWkjf1
	 RrrbRpOS2ypR0VArYNb3+3qksOAD4OLD7cvBZjZU4WAHwRWc2H+LIm8wz5qIKn7MHd
	 g3t3Rl/WGU2ycZnRgVJDFoHxB5pvld1e+D+CN3NxnE3QCzUBqTa8hPq1s1O+XwS2jp
	 YpDZqFh91v09Q==
Message-ID: <sashiko-outbox-166015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/13] ARM: dts: imx6ul: Add Variscite storage and
 wireless options
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <cfcd21519e92c74761875912dab36762ae304e2f.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <cfcd21519e92c74761875912dab36762ae304e2f.1791487179.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 19:49:26 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dts: mmc: missing no-1-8-v property in iw61x SDIO configuration
- [Medium] dts: mmc: missing vmmc-supply linkage for usdhc1 SD card interfa=
ce
- [Medium] arm: dts: imx: tsc disabled in IW61x variant without documented =
pin conflict
--

commit aa7d3a1b7e7dcf63c97315306517bc7b3d2e56da
Author: Stefano Radaelli <stefano.r@variscite.com>
Date:   Thu Oct 8 19:37:48 2026 +0000

ARM: dts: imx6ul: Add Variscite storage and wireless options
   =20
Extract usdhc2 and its pinctrl groups from the VAR-SOM-6UL common
file into imx6ul-imx6ull-var-emmc.dtsi. Add shared NAND and IW61x
descriptions for VAR-SOM-6UL and DART-6UL, and describe the fixed
3.3 V supply in the existing SD card option. Rename
imx6ul-var-som-wifi.dtsi to imx6ul-var-som-wifi-brcm.dtsi and
update both existing users to distinguish Broadcom from IW61x.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi=
 b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
> new file mode 100644
> index 0000000000000..d2f116bc8d70f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	iw61x_pwrseq: mmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};
> +};
> +
> +&tsc {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Is it intentional to unconditionally disable the touch screen controller
(tsc) for the IW61x module?

In the Broadcom variant, tsc is disabled due to a hardware conflict where
GPIO1_IO03 is multiplexed as OSC32K_32K_OUT to supply the Wi-Fi module,
which conflicts with tsc's xnur-gpios. However, this IW61x variant does
not declare pinctrl_32k_clk or multiplex GPIO1_IO03.

Without a documented hardware or pin conflict, this removes touch
functionality for all users of the IW61x Wi-Fi variant. Could this be an
unintended copy-paste from the Broadcom variant?

> +
> +&uart2 {
> +	bluetooth_iw61x: bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	vmmc-supply =3D <&reg_sd1_vmmc>;
> +	mmc-pwrseq =3D <&iw61x_pwrseq>;
> +	status =3D "okay";
> +};

[Severity: High]
Does this iw61x SDIO configuration need the no-1-8-v property?

The SDIO interface for the Wi-Fi module is powered by a fixed 3.3V
supply (reg_sd1_vmmc). Modern NXP Wi-Fi modules (such as IW61x)
advertise UHS capabilities (1.8V modes). Without no-1-8-v, the MMC core
will negotiate a 1.8V switch (CMD11) if the card advertises it.

Since the i.MX6UL SDHCI controller on this board lacks a mechanism to
physically drop the IO voltage, it will continue driving 3.3V signals to a
Wi-Fi module that has switched to 1.8V receivers, causing immediate CRC
errors and probe failure.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/=
boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> index 0e6d9b945eb4a..bef0a60abfa94 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> @@ -4,8 +4,18 @@
>   *
>   * Copyright 2019-2024 Variscite Ltd.
>   * Copyright 2026 Dimonoff
> + * Copyright (C) 2026 Variscite Ltd.
>   */
> =20
> +/ {
> +	reg_sd1_vmmc: regulator-sd1-vmmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +};
> +

[Severity: Medium]
Does the newly added reg_sd1_vmmc need to be linked to the usdhc1 SD card
interface?

The patch adds reg_sd1_vmmc to explicitly describe the fixed 3.3V supply,
but it doesn't link this regulator to the usdhc1 controller node via the
vmmc-supply =3D <&reg_sd1_vmmc>; property.

Without this linkage, the MMC subsystem remains unaware of the supply,
rendering the newly added regulator definition practically dead code and
failing to fulfill the commit's stated intent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791487179.gi=
t.stefano.r@variscite.com?part=3D8
