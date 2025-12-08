Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A13AC39
	for <imx@lists.linux.dev>; Mon,  8 Dec 2025 02:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765160271; cv=none; b=ZjIbJNzIm21eYpFlmIyk2cYVSGhyaZgiTTfJ9GTMilNe1lByCAEWm+VIMPuksFx7FoHM4tC4VXM1XAmjd/raum0u1fL+8dsjClQnf4crRZShHaNh+TQmlGAxFo+VanH5hlvMdvcfTsbDx176a6n6R+xqHP2baWwT1TfJSGO/CAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765160271; c=relaxed/simple;
	bh=WfsJ5B3tNQDFq9ImxRv2wvJFd+Vm64XZWgVS1ppeaDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGlJcIGF9hZ+uFZOTJmDdC+yI/68bWrvOL4npL/XgqUmL59oRRsVYkVp/w2NfVDgvGPqRFqRyyn1FUzu2x0WmRgDdqICKESCCT6dZTEQjXmI6DK/6Qdm7NnAN3wLyHJWJeQ8g0rdXBwRmLf+K7FianodCoB2iqXuwbV7BaL+vmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ACF9C1A07C4;
	Mon,  8 Dec 2025 03:17:46 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 46B3C1A07BF;
	Mon,  8 Dec 2025 03:17:46 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1AE811800082;
	Mon,  8 Dec 2025 10:17:44 +0800 (+08)
Date: Mon, 8 Dec 2025 11:17:43 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: "Yanan.Yang" <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aTY1R9x0J9zzGx+0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Dec 05, 2025 at 05:03:59PM +0900, Yanan.Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
> 
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> (FRDM-IMX91 board page)
> 
> Co-developed-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 692 +++++++++++++++++++++
>  2 files changed, 693 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..927bf76a05f3 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -368,6 +368,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> new file mode 100644
> index 000000000000..0952a685c3f5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
> @@ -0,0 +1,692 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx91-11x11-frdm-s", "fsl,imx91";
> +	model = "NXP FRDM-IMX91S board";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c4 = &lpi2c5;
> +		i2c5 = &lpi2c6;
> +		i2c6 = &lpi2c7;
> +		i2c7 = &lpi2c8;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
> +		rtc0 = &bbnsm_rtc;
Hi Yanan,

Please add pcf2131 alias here.

[snip]
> +	};
> +};
> +
> +&iomuxc {

Please don't mix table and space here.
And all marcro value should keep alignment.
Please take care and fix. Thanks.

Regards,
Joseph

> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
> +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
> +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
> +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
> +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqossleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__GPIO4_IO0                           0x31e
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1                          0x31e
> +			MX91_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> +			MX91_PAD_ENET1_RD1__GPIO4_IO11                          0x31e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12                          0x31e
> +			MX91_PAD_ENET1_RD3__GPIO4_IO13                          0x31e
> +			MX91_PAD_ENET1_RXC__GPIO4_IO9                           0x31e
> +			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8                        0x31e
> +			MX91_PAD_ENET1_TD0__GPIO4_IO5                           0x31e
> +			MX91_PAD_ENET1_TD1__GPIO4_IO4                           0x31e
> +			MX91_PAD_ENET1_TD2__GPIO4_IO3                           0x31e
> +			MX91_PAD_ENET1_TD3__GPIO4_IO2                           0x31e
> +			MX91_PAD_ENET1_TXC__GPIO4_IO7                           0x31e
> +			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6                        0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__CAN1_TX			0x139e
> +			MX91_PAD_GPIO_IO29__CAN1_RX			0x139e
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1_sleep: flexcan1sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__GPIO2_IO28			0x31e
> +			MX91_PAD_GPIO_IO29__GPIO2_IO29			0x31e
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_flexspi1: flexspi1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__FLEXSPI1_A_SCLK	0x3fe
> +			MX91_PAD_SD3_CMD__FLEXSPI1_A_SS0_B	0x3fe
> +			MX91_PAD_SD3_DATA0__FLEXSPI1_A_DATA0	0x3fe
> +			MX91_PAD_SD3_DATA1__FLEXSPI1_A_DATA1	0x3fe
> +			MX91_PAD_SD3_DATA2__FLEXSPI1_A_DATA2	0x3fe
> +			MX91_PAD_SD3_DATA3__FLEXSPI1_A_DATA3	0x3fe
> +		>;
> +	};
> +
> +	pinctrl_gpio_key: gpiokeysgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO1__GPIO3_IO26             0x0000031E
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__LPI2C1_SCL                           0x40000b9e
> +			MX91_PAD_I2C1_SDA__LPI2C1_SDA                           0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C2_SCL__LPI2C2_SCL                           0x40000b9e
> +			MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__MQS1_LEFT			0x31e
> +			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO2__GPIO3_IO27                          0x31e
> +			MX91_PAD_SD1_DATA5__GPIO3_IO15			0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
> +			MX91_PAD_UART1_TXD__LPUART1_TX                          0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX                   0x31e
> +			MX91_PAD_DAP_TDI__LPUART5_RX                            0x31e
> +			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B                   0x31e
> +			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B                  0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x1582
> +			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x1382
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x1382
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x1382
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x1382
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x1382
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x158e
> +			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x138e
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x138e
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x138e
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x138e
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x138e
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x15fe
> +			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x13fe
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x13fe
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x13fe
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x13fe
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x13fe
> +			MX91_PAD_SD1_DATA4__GPIO3_IO14		0x031E
> +			MX91_PAD_SD1_STROBE__GPIO3_IO18		0x031E
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x1582
> +			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x1382
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x1382
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x1382
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x1382
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x1382
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__GPIO3_IO1                             0x51e
> +			MX91_PAD_SD2_CMD__GPIO3_IO2                             0x51e
> +			MX91_PAD_SD2_DATA0__GPIO3_IO3                           0x51e
> +			MX91_PAD_SD2_DATA1__GPIO3_IO4                           0x51e
> +			MX91_PAD_SD2_DATA2__GPIO3_IO5                           0x51e
> +			MX91_PAD_SD2_DATA3__GPIO3_IO6                           0x51e
> +			MX91_PAD_SD2_VSELECT__GPIO3_IO19                        0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x158e
> +			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x138e
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x138e
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x138e
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x138e
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x138e
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x15fe
> +			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x13fe
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x13fe
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x13fe
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x13fe
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX91_PAD_WDOG_ANY__WDOG1_WDOG_ANY       0x31e
> +		>;
> +	};
> +};
> +
