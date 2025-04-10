Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2C204584
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267599; cv=none; b=iF4aKAUYYXctK5mT1wLgw28xtQFxtJW4SYcHyP0NxAn+BkRwc5Y4ivypUQgpWvQx9HjqX/rcY2ekDPMtYgsNUI3GKByCyCXbcJS46rCjKTdiZ8OA4SIuUuReEjjX88EcP5iVs9QFpTr6Q8nW8wpPe2HV5B5uh4SWNi/dDQsUPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267599; c=relaxed/simple;
	bh=0X1VRhLWVu1Os0QmeVRy5jVmkThieLulTpQLXTIax3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/A5r8yctySyWeXCVesLampaDTwrdMaI6NjcrVU/cdezo4MBCk7fQViFJn/ibe0BAxGNy4aFraLyEQKyz8/y87eXisaGO34WT7H3puw/loz0NW3P6C0Fmg1pRPBf8T6cJ+qN0RufhTr7w3qZIFS7h7qEanCZD9UzQ2N6XJ4ge5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=R2hdi96c; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PSAvIW3P reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="R2hdi96c";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PSAvIW3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744267594; x=1775803594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LhTk5eEl1mfzJeZRCk8tqJRARMxVGHA4PYoLJRHQY/U=;
  b=R2hdi96ci5bXYDSxmHhOOWnUopRnuFYK+InXI3ymlmxrcA77PsgWT0IY
   DhHDGli1Rv6fBPzCs0z1nueWyLSUFsCAJip6khA04wrVp58AcWh4su1xo
   PS3LZd0dL3ti6Cft6Utdpz0OoNHBE8PuV2QwiuRrPFNPDu7KjXUgeShku
   KGQROtLuqQ5odgjRskBiBItvtEXmXHyA1BLbOT10LUzV7IEEUfBv2Qv2U
   4WbiqJO2HVthOiEcfTHOMXzj7U9eYrjimXdboi3r7hAOga5B5IiooR4S9
   om8aKq9VHr9QzdNACF/3EI1e10lbLBcg26+UXpNK6EBWSzN6WhJOQZiMy
   g==;
X-CSE-ConnectionGUID: 62GB+poBTYesEavmwqwQdg==
X-CSE-MsgGUID: AYRWs7IISduZAutwYzqOwg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739833200"; 
   d="scan'208";a="43444076"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Apr 2025 08:46:31 +0200
X-CheckPoint: {67F76947-F-F35B2447-E1635CDE}
X-MAIL-CPID: 7D6055AE6D1CC76D938C826B4F8389AB_1
X-Control-Analysis: str=0001.0A006378.67F76945.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00ECD166944;
	Thu, 10 Apr 2025 08:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744267587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhTk5eEl1mfzJeZRCk8tqJRARMxVGHA4PYoLJRHQY/U=;
	b=PSAvIW3Plv9L8n0jLSX4an9g+Uo2DobBiEFKAGC930tF4ujS3LaszrX8dokMs/O6uxhEgs
	6naRi983sXQDmQ1Sd/IZ1Kt3npiGSfZRoMLdqjVTPzB/da0VXxyiL7I6HLwESgCNEZ/bh5
	UtWt4ZEX9D/GMMZHY2z6eQTtM2UtKEFMlOUbPIgsZBdUo/FTGuwSRf6N2diIhAM7UB0Ijm
	20HTJEpBDxtmOabWKd7wU0inXrPNtlxuR+mmV7shbNpNxwcVA3wXFe+V06Of+PHd61p3tl
	JAQqYZ0JBNyUltp/bMKBG5lRDMKDhSSE2Iwyld3Eg0/Bh15ZaCMrDUmnqwEGlg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 Jacky Bai <ping.bai@nxp.com>
Subject:
 Re: [PATCH v5 3/3] arm64: dts: freescale: Add minimal dts support for imx943
 evk
Date: Thu, 10 Apr 2025 08:46:25 +0200
Message-ID: <3627104.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250410062826.3344545-4-ping.bai@nxp.com>
References:
 <20250410062826.3344545-1-ping.bai@nxp.com>
 <20250410062826.3344545-4-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 10. April 2025, 08:28:26 CEST schrieb Jacky Bai:
> Add the minimal board dts support for i.MX943 EVK. Only the
> console uart, SD & eMMC are enabled for linux basic boot.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  - v5 changes:
>   - remove the unused and not documented 'fsl,cd-gpio-wakeup-disable'
>     property from usdhc node.
>=20
>  - v4 changes:
>   - no
>=20
>  - v3 changes:
>   - no
>=20
>  - v2 changes:
>   - newly added for board dts
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |   1 +
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 195 +++++++++++++++++++
>  2 files changed, 196 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index b6d3fe26d621..2fe86fc6d73a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla.=
dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx943-evk.dtb

Uh, please sort the entries alphabetically, thus imx94 goes before imx95.

> =20
>  imx8mm-kontron-dl-dtbs			:=3D imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dt=
bo
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> new file mode 100644
> index 000000000000..b0bb08bb67d5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024-2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx943.dtsi"
> +
> +/ {
> +	compatible =3D "fsl,imx943-evk", "fsl,imx94";
> +	model =3D "NXP i.MX943 EVK board";
> +
> +	aliases {
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		serial0 =3D &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &lpuart1;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		off-on-delay-us =3D <12000>;
> +		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> +		pinctrl-names =3D "default";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-name =3D "VDD_SD2_3V3";
> +		gpio =3D <&gpio4 27 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0 0x80000000 0 0x7f000000>;
> +			reusable;
> +			size =3D <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		reg =3D <0x0 0x80000000 0x0 0x80000000>;
> +		device_type =3D "memory";
> +	};
> +};
> +
> +&lpuart1 {
> +	pinctrl-0 =3D <&pinctrl_uart1>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins =3D <
> +			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> +			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
> +			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
> +			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
> +			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
> +			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
> +			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
> +			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
> +			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
> +			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
> +			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
> +			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> +			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> +			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> +			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
> +			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
> +		fsl,pins =3D <
> +			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
> +		>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-0 =3D <&pinctrl_usdhc1>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 =3D <&pinctrl_usdhc1>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";

Is the sleep pinctrl necessary if it is the same as 'default'?

> +	bus-width =3D <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status =3D "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";

Same here.

> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio4 20 GPIO_ACTIVE_LOW>;
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;

This is probably also 'no-mmc', no? Maybe even 'no-sdio'.

Best regards,
Alexander

> +	status =3D "okay";
> +};
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +	status =3D "okay";
> +};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


