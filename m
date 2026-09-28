Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C73C7DF5;
	Mon, 28 Sep 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600262; cv=none; b=MARSccpeOWOos5G8JUR4DHz+7R1NWoIqEVPD9EVUuzPXKDRM0kJdb1pXH8y6Ie3wifOthiV8kcIy9z++z4eblmitpn4SSrFvckXzHOHnqLClGd7mMpQpr4KyhN851A3BNCnPH/OD+0kt6xka7I1CA8kQvi920liL4/L5NK9OJnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600262; c=relaxed/simple;
	bh=s8BpYZHfV+Jl6Mzj13qjpN6/lBxhXRWSOLjhiMDlm0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BIuXFMb+uWq/On29FunyAkwQlU8n1CPWTxASHJl1mBWVhqMvCxInmat2EeSrQIi4JZE+qcoHnWiC9MOOlUvFd9zhnBf8hhRJNFVRdtPLCn0Ma7CQU9vTxMI5IthPcYLHySpUNUSCnCB3q998lLyagPhk5LESOqlzVHd2GWtF16o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjCYm8v/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjCYm8v/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818391F00893;
	Mon, 28 Sep 2026 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600260;
	bh=MZQQkNX9ewrTt0VZpuxELaQgzkW90GGoiBgsZijt5SE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FjCYm8v/6DIkY6PBUJfIh2GVEZ4zO7isPPFQYHz5N3x7TXafV3bYErg8ZlJSIIs+n
	 iuWVxczVmyVnQ7+HZtoQMtwCzk/VO7fvhN66oHj1oBgSVp9w73/h0KPbitt2dr3zjs
	 AlnCt5oIGZ3qw+L2kcZu1ie/Kd5F63pXWvMMD+ww4ZuT2gi1t6enT1UwiGHUWG/JZJ
	 0zEYbdZSIQMDq/Jlr0+5sU2mzJ2wKUXtyPL1OqePxk1aEQ/Ks+c8V9Yx+XImEpkZXN
	 1fGyRycsVGZHJDER17rrJj0g3dDSfwIvXExcnRhrfOwfUZpGmok5jhhUBVCTepRZ4x
	 ifyFuABIGiO4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/12] ARM: dts: imx6ul: Add Variscite SoM and DART
 base files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <113cc7361186943effcbcfe88913c6f528a54db6.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <113cc7361186943effcbcfe88913c6f528a54db6.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:40 +0000
Message-Id: <20260928125740.818391F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dts: silent removal of usdhc2 node drops eMMC/NAND storage suppo=
rt
- [Low] build: missing base includes break dtb compilation
- [Low] build: undefined and duplicate labels break dtb compilation
--

commit 48ae04371b34d465ad552c0745c3a4c8f91da9cf
Author: Stefano Radaelli <stefano.r@variscite.com>
ARM: dts: imx6ul: Add Variscite SoM and DART base files

This patch adds shared DTSI files for VAR-SOM-6UL and DART-6UL modules and
SoC-specific wrappers for i.MX6UL, i.MX6ULL, and i.MX6ULZ. It drops and
replaces older shared DTSI files and restructures common components.

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
new file mode 100644
index 0000000000000..cd93f618e907b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som.dtsi
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	memory@80000000 {
+		device_type =3D "memory";
+		reg =3D <0x80000000 0x20000000>;
+	};
+
+	/* ref_clk for micrel ethernet phy */
+	rmii_ref_clk: clock-rmii-ref {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <25000000>;
+		clock-output-names =3D "rmii-ref";
+	};

[Severity: Low]
Does adding the rmii_ref_clk label here conflict with the existing
rmii_ref_clk label in legacy downstream enet2.dtsi files?

Since those legacy files are still included by dependent boards, redefining
this label leads to duplicate label errors during compilation. Although this
build regression is fixed later in the series by replacing the legacy
components in Patch 6 and Patch 8, it breaks git bisect at this step.

[ ... ]

+	reg_gpio_dvfs: regulator-gpio-dvfs {
+		compatible =3D "regulator-gpio";
+		regulator-name =3D "gpio_dvfs";
+		regulator-min-microvolt =3D <1300000>;
+		regulator-max-microvolt =3D <1400000>;
+		regulator-type =3D "voltage";
+		gpios =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Will this fail to compile because GPIO_ACTIVE_HIGH is undefined?

The previous includes provided standard bindings like
<dt-bindings/gpio/gpio.h>, but the new file chain omits them. Consequently,
downstream board .dts files like imx6ul-var-som-concerto.dts fail to
compile due to undefined macros and missing node references.=20

This build regression is fixed later in the series by Patch 8, but it
currently breaks git bisect.

[ ... ]

+	pinctrl_usdhc1_200mhz: usdhc1-200mhz-grp {
+		fsl,pins =3D <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};

[Severity: Medium]
Does the removal of the usdhc2 node here drop eMMC/NAND storage support?

The patch removes the inclusion of imx6ul-var-som-common.dtsi, which
previously supplied the usdhc2 node for storage. By omitting it in this
replacement file, dependent boards lose their primary storage capability.

Although this regression is resolved later in the series by Patch 6
via imx6ul-imx6ull-var-emmc.dtsi, could the storage node be preserved here
temporarily to prevent breaking git bisect?

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6ul-var-som.dtsi
index feea24c0e0683..8e3c2d72811f0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -2,37 +2,30 @@
 /*
  * Support for Variscite VAR-SOM-6UL Module
  *
- * Copyright 2019 Variscite Ltd.
+ * Link: https://variscite.com/system-on-module-som/i-mx-6/i-mx-6ul/var-so=
m-6ul/
+ *
  * Copyright 2025 Bootlin
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
  */
=20
-/dts-v1/;
-
-#include "imx6ul.dtsi"
-#include "imx6ul-var-som-common.dtsi"
+#include "imx6ul-imx6ull-var-som.dtsi"

[Severity: Low]
Does the deletion of the SoC includes here cause undefined node labels in t=
he
remainder of the build?

This drops standard bindings and base SoC node labels. Downstream board fil=
es
fail to compile due to missing node references and macros. This build
regression breaks git bisect, though it is fully fixed later in the series
by Patch 8.

[ ... ]

 &iomuxc {
-	pinctrl_brcm_bt: brcm-bt-grp {
-		fsl,pins =3D <
-			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
-		>;
-	};
-
-	pinctrl_brcm_wifi: brcm-wifi-grp {
+	pinctrl_enet1_gpio: enet1-gpio-grp {
 		fsl,pins =3D <
-			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
-			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
+			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0
 		>;
 	};
=20
-	pinctrl_enet1_gpio: enet1-gpiogrp {
+	pinctrl_wifi: wifi-grp {
 		fsl,pins =3D <
-			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
+			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
+			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
 		>;
 	};
 };

[Severity: Low]
Does renaming pinctrl_brcm_wifi to pinctrl_wifi break downstream
dependencies?

Downstream legacy included files like imx6ul-var-som-wifi.dtsi still
reference the old labels. This leads to unresolved phandle errors during
compilation and breaks git bisect, though it is fixed later in the series by
Patch 6 and Patch 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D4
