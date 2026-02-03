Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CA3164D6
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129418; cv=none; b=LlRSPETLsyNG0dJIVunmZSH6I7G7GAnZ2OS93rzT7XOZvLAyz1pXxRwx3AWhPb7+Gvi31Q2qrZvrX2+Qicf7en0jcPHLL9tQXi9wZDQ4sr1Mbp6khxGoNO88Ta+1SGZ1tAsHWgvz/gfPDsERz/AR6XjEPUPM/yu2wWpgarlY/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129418; c=relaxed/simple;
	bh=IF/ELhrYDLTu7nf4ax3TUPV7Rxc3qy5omtUnB/Wu8ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwUC8pDdflJev4d7aPE3THAy4HQFM2EcQTTZXD/L+DJsPrjSGGHNh7gT4zhxbouIL4WZ82yjtm7tlBxLUUuK433aYq7WqsvfcdjKfjflMLxPIWoIugWH5qLG65qfqanzMQaNNWil3Aoo7T+KrEzkq7qBN2nuQmGVEbNqZeMp+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vnHW2-0006dU-Jr; Tue, 03 Feb 2026 15:36:30 +0100
Message-ID: <b69b73b5-cde0-444a-875d-ef817cfa7504@pengutronix.de>
Date: Tue, 3 Feb 2026 15:36:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-evk: share usdhc3 setup
To: Mario Peter <mario.peter@leica-geosystems.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
References: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello Mario,

thanks for your patch.

On 2/3/26 3:21 PM, Mario Peter wrote:
> The eMMC controller on EVK and EVKB uses the same usdhc3
> configuration and pinmux. Move the common node and pinctrl groups
> into imx8mm-evk.dtsi so both boards inherit the shared setup and
> avoid duplication in the board DTS files.

What about the imx8mm-ddr4-evk.dts? Did you check if it also has
something connected to usdhc3?

Cheers,
Ahmad

> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> v1: submitted
> 
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 61 -------------------
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index b68954bcc383..002ebdeeb2d6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -53,18 +53,6 @@ flash@0 {
>  	};
>  };
>  
> -&usdhc3 {
> -	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> -	assigned-clock-rates = <400000000>;
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc3>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
>  &iomuxc {
>  	pinctrl_flexspi: flexspigrp {
>  		fsl,pins = <
> @@ -76,53 +64,4 @@ MX8MM_IOMUXC_NAND_DATA02_QSPI_A_DATA2           0x82
>  			MX8MM_IOMUXC_NAND_DATA03_QSPI_A_DATA3           0x82
>  		>;
>  	};
> -
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> -		>;
> -	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 6eab8a6001db..6e53828b5d30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -649,6 +649,18 @@ &usdhc2 {
>  	status = "okay";
>  };
>  
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &wdog1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -839,6 +851,55 @@ MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
>  		>;
>  	};
>  
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> +		>;
> +	};
> +
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

