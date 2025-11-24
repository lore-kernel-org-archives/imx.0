Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844DF21773F
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763986053; cv=none; b=dAOHiaECB2gUh+a9JVW935at1YsrunLVBPdJ5vumZ8WS33ULZEic02qsUNMOnwictG074DKhZ0zCMuPoGFrYn2jfvbPL2e/NlJsHSvlsC8AkT4X/OgA0bxwUNCVrpvDfxFaHcRrmig+TrL+JF/QVveVdtNzTDEMm/ROZLc5HAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763986053; c=relaxed/simple;
	bh=dAuWrnMtD98AM0vHxF63YffYjz4k/gqR0d88cB6nCJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7cvEweIMAOcHiioGPNAHTPQQBp826LHtzLpeUFMqVITJb46ZyBOS5vKBmXNj+m6ezlklemzQ2ef1X0//5YbRfXK4ZpTKrETH4kaW1t2Ch6bDtJtRpAp5o/iW7aHIwJxR7LGOBi4jc6DWYlVwqOZWjN30RiNIHFioZv4zZav7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNVLk-0005vA-OA; Mon, 24 Nov 2025 13:07:20 +0100
Message-ID: <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
Date: Mon, 24 Nov 2025 13:07:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
To: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, dongas86@gmail.com, Anson Huang <Anson.Huang@nxp.com>,
 imx@lists.linux.dev, frank.li@nxp.com, kernel@dh-electronics.com,
 kernel@pengutronix.de, francesco.dolcini@toradex.com, krzk+dt@kernel.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251124095449.4027676-1-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 11/24/25 10:54 AM, Dong Aisheng wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Update i.MX8MP imx8mp-pinfunc.h file according to reference manual Rev.D.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

At the very least, we should keep around the old defines.

I don't think though that aligning with slightly different naming in a
newer reference manual is worth the churn.

> ---
> NOTE: I met the following checkpatch error, could you advise how to
> handle it?
> ERROR: Macros with complex values should be enclosed in parentheses
> +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x014 0x274 0x000 0x5 0x0

Not applicable, ok to ignore.
Thanks,
Ahmad

> ---
>  .../dts/freescale/imx8mp-data-modul-edm-sbc.dts  |  4 ++--
>  .../boot/dts/freescale/imx8mp-debix-model-a.dts  |  2 +-
>  .../boot/dts/freescale/imx8mp-dhcom-som.dtsi     |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts     |  2 +-
>  .../boot/dts/freescale/imx8mp-iota2-lumpy.dts    |  2 +-
>  .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  6 +++---
>  .../imx8mp-nitrogen-enc-carrier-board.dts        |  2 +-
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi  | 12 ++++++------
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   | 16 ++++++++--------
>  .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  |  4 ++--
>  .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi |  2 +-
>  .../boot/dts/freescale/imx8mp-venice-gw74xx.dts  |  2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi |  2 +-
>  15 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> index 16078ff60ef08..7a05e0692d78d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> @@ -1085,8 +1085,8 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01		0x4
>  
>  	pinctrl_usb1: usb1-grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR		0x6
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x80
> +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x6
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x80
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b29..2df6434bde652 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -485,7 +485,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x49
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR				0x10
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR				0x10
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> index 68c2e0156a5c8..755ea967bb9cb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
> @@ -1061,8 +1061,8 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
>  
>  	pinctrl_usb1_vbus: dhcom-usb1-grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR		0x6
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x80
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x6
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x80
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index c6facb2ad9aaa..57accd33ec62c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -1088,7 +1088,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
>  
>  	pinctrl_usb1_vbus: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR		0x19
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> index f48cf22b423db..f66c6b9236fbe 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
> @@ -363,7 +363,7 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x0
>  
>  	pinctrl_usb_host_vbus: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x0
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x0
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> index b97bfeb1c30f8..6de4d4ace8a73 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> @@ -734,19 +734,19 @@ MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x1c4 /* USB_A_ID */
>  
>  	pinctrl_usb1_oc: usb1ocgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0 /* USB_A_OC# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0 /* USB_A_OC# */
>  		>;
>  	};
>  
>  	pinctrl_usb2_id: usb2idgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID		0x1c4 /* USB_B_ID */
> +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID		0x1c4 /* USB_B_ID */
>  		>;
>  	};
>  
>  	pinctrl_usb2_oc: usb2ocgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC		0x1c0 /* USB_B_OC# */
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC		0x1c0 /* USB_B_OC# */
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> index 1df9488aaeb22..9ffeeb382bad4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> @@ -406,7 +406,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
>  
>  	pinctrl_usb3_0: usb3-0grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> index 8b0e8cf86cadb..7b5c402ff9f27 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> @@ -579,17 +579,17 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3_TXD */
>  
>  	pinctrl_usb0: usb0grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
> -			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106	/* USB1_ID */
> +			MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR	0x106	/* USB1_PWR_EN */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x106	/* USB1_OC */
> +			MX8MP_IOMUXC_GPIO1_IO10__USB1_ID	0x106	/* USB1_ID */
>  		>;
>  	};
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
> -			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
> -			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
> +			MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR	0x106	/* USB2_PWR_EN */
> +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OC	0x106	/* USB2_OC */
> +			MX8MP_IOMUXC_GPIO1_IO11__USB2_ID	0x106	/* USB2_ID */
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 16f5899de4152..50f5e674a6b71 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -46,10 +46,12 @@
>  #define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                          0x014 0x274 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_ENET_PHY_REF_CLK_ROOT           0x014 0x274 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__ISP_FL_TRIG_0                       0x014 0x274 0x5D4 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x014 0x274 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1                        0x014 0x274 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                          0x018 0x278 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                            0x018 0x278 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__ISP_SHUTTER_TRIG_0                  0x018 0x278 0x5DC 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M                  0x018 0x278 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO01__CCM_EXT_CLK2                        0x018 0x278 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                          0x01C 0x27C 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B                        0x01C 0x27C 0x000 0x1 0x0
> @@ -91,26 +93,26 @@
>  #define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B                      0x038 0x298 0x000 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO09__SDMA2_EXT_EVENT00                   0x038 0x298 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                          0x03C 0x29C 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID                         0x03C 0x29C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__USB1_ID                             0x03C 0x29C 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                            0x03C 0x29C 0x000 0x2 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                          0x040 0x2A0 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID                         0x040 0x2A0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__USB2_ID                             0x040 0x2A0 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                            0x040 0x2A0 0x000 0x2 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT                      0x040 0x2A0 0x000 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO11__CCM_PMIC_READY                      0x040 0x2A0 0x554 0x5 0x1
>  #define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                          0x044 0x2A4 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR                        0x044 0x2A4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR                            0x044 0x2A4 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO12__SDMA2_EXT_EVENT01                   0x044 0x2A4 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                          0x048 0x2A8 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC                         0x048 0x2A8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__USB1_OC                             0x048 0x2A8 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                            0x048 0x2A8 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                          0x04C 0x2AC 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR                        0x04C 0x2AC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__USB2_PWR                            0x04C 0x2AC 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B                         0x04C 0x2AC 0x608 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                            0x04C 0x2AC 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1                           0x04C 0x2AC 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                          0x050 0x2B0 0x000 0x0 0x0
> -#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC                         0x050 0x2B0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__USB2_OC                             0x050 0x2B0 0x000 0x1 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                           0x050 0x2B0 0x634 0x4 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                            0x050 0x2B0 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2                           0x050 0x2B0 0x000 0x6 0x0
> @@ -291,10 +293,8 @@
>  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF1_IN                   0x0D4 0x334 0x544 0x3 0x1
>  #define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_PDM_BIT_STREAM03            0x0D4 0x334 0x4CC 0x4 0x2
>  #define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                           0x0D4 0x334 0x000 0x5 0x0
> -#define MX8MP_IOMUXC_SD2_DATA3__SRC_EARLY_RESET                      0x0D4 0x334 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B                     0x0D8 0x338 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                         0x0D8 0x338 0x000 0x5 0x0
> -#define MX8MP_IOMUXC_SD2_RESET_B__SRC_SYSTEM_RESET                   0x0D8 0x338 0x000 0x6 0x0
>  #define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                               0x0DC 0x33C 0x000 0x0 0x0
>  #define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                              0x0DC 0x33C 0x000 0x5 0x0
>  #define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI                        0x0DC 0x33C 0x000 0x6 0x0
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> index 59642a8a2c445..50c8a7c2a7bd3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> @@ -976,8 +976,8 @@ pinctrl_uart4: uart4grp {
>  	};
>  
>  	pinctrl_usb0: usb0grp {
> -		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x1c0>,
> -			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x1c0>;
> +		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c0>,
> +			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_PWR		0x1c0>;
>  	};
>  
>  	pinctrl_usbcon0: usb0congrp {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> index 4bf818873fe3c..162329b403d30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
> @@ -219,7 +219,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x146
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> index 76020ef89bf3e..02ea0e8bcc6ff 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
> @@ -318,7 +318,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN */
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> index 5eb114d2360a3..2b6bb9fcbc7a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
> @@ -359,7 +359,7 @@ MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12	0x146 /* USB1_EN */
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140 /* USB1_FLT# */
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140 /* USB1_FLT# */
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> index 7662663ff5dad..6d752fe0d1bf5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
> @@ -1060,7 +1060,7 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140
>  
>  	pinctrl_usb1: usb1grp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x140
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OC	0x140
>  		>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> index d43ba00871269..28f5983a78469 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -1316,7 +1316,7 @@ pinctrl_usb_1_id: usb1idgrp {
>  	/* USB_1_OC# */
>  	pinctrl_usb_1_oc_n: usb1ocngrp {
>  		fsl,pins =
> -			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c4>;	/* SODIMM 157 */
> +			<MX8MP_IOMUXC_GPIO1_IO13__USB1_OC		0x1c4>;	/* SODIMM 157 */
>  	};
>  
>  	pinctrl_usb2_vbus: usb2vbusgrp {

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

