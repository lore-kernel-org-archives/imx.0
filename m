Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259F28B4E2
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958721; cv=fail; b=H1HFxYjQYd3Pc5UBsGXir94Yt0mt3edqe+mk711ihUNgCu6egOGEs+f7/Ib9kPXWAH3j5sNLDZJWpS0Hg6FmBKo3J0VgCW2f5iyM+RTgii/DGJ2p1YahR3cEhav8wBO9+DQ/iVR9Rd/SJ729m2rVT4/xQYzZ10Sx0Kk6yqYfXxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958721; c=relaxed/simple;
	bh=wIS2cZ1TbnteU74M5DQZjE1ImDyKYE5+fr7ZGCwQc0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=djVPPKQ4iqj0HxVD817O+YsH9MO2jbTaTCFyIO3jm/AcCqwCq3cnjqlKm4OVIOtpM4c/EpZyHP3f0XZWdJj9E3F5dm9rzvbJ1jBI8QYbRKsVhZomPamVmJ0g5Q9vVkkL1M9OvrM9LCcqP5UgTxtjRZ59xadvPARJkCNeh5+gSKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k+3+VeEG; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k+3+VeEG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cN8tpnmt5NymBujDCdpqkLp14gsx/1RwfaMhcc8hRCdVfLV8y2BCGX2PhFw303pZq4h1t7ERAY+dr7MXHfYC1oieuCkX/WEG8I8U7AL5sZKPptR31PDH9uo2SzQsKWRiL5diMgJfMMFTD8xIbKHXtVCf4M8NKufKqJH8x3AgxEG13qSMHUhBdUtzYjAoR+I9Qa+1K+2HILQ/+lkoxAfczepnBO4QrZxJ4Y5JuDHq6O7IVYshlpM15aH8gj8C/RJ0wJMYPo0r6iAEeEYcDmod1rtHrxMIALewBlEcdZidlid9DbALySNRgjqV9PICDZbAsA6BGEjYtL196r21nrm+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ35GYIYlVwFTaihCasqpY5nXUQeLI2+WO95gT9phhQ=;
 b=b5RlK2MBe8KNKj9YdL+uUF6zfbsjLDjQnH+HenJlnZsjwvj7yevWVouV/1ZqQbUWmjOt3xAV8UevSBI4KY/2NZJ1iNKnSZfkGZ4gfJT2OMvxh1aVRc7/ZRJ+C70HhuPuYKE1zCwBJH+4ARUtarEObYXURJRN6Fd8SvymEsF8FZzX2gbU1uxxoGmayY30pSXPVUDLTqIJqHgM4P/zJimo5jVUi7rDOgGWYHcE1PZkyt9e3oxRNlcL+Ge9uY/T+F2wzEHuz6QZ2KeThDMIHNVWcrkHOP5ekUxwGCBViNy6ZB/r+1/7//YPTuqRg6js66/HVpgSZofyaDl+S63gW512/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ35GYIYlVwFTaihCasqpY5nXUQeLI2+WO95gT9phhQ=;
 b=k+3+VeEG2tSwxXADC6NP28nwMv1Im0PBCsDou+KxpgnHkCPdkov2WIQVqNhO3msq9huJ1lKg6k0GqqPg7ZM1XwdOg17SjFPRW/b1io/FPSPhH9w8E+uFyScVBAfd3YvbH63CYPRMJwzONOOrlpNbPWUhlaPAuqObs/dDAUD1bIBCeRWttb98MtBob1w1ZUHsm/wRh3tKhj6WYVWrphxUrNldMecgAefFFNO+3WEdsm68jMJ9ACZg1ySCkahyfOGkw+UUtY5yTInDfVPIUWmu3+8qcdc5I5KzuoACACBQ5V0p9AAWK9mRJrQxK625P6vzJGcKIF46OqLJTv/OPCgyag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11388.eurprd04.prod.outlook.com (2603:10a6:10:5ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 13 Jul
 2026 16:05:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:05:15 +0000
Date: Mon, 13 Jul 2026 11:05:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 04/15] arm64: dts: freescale: imx8mn-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <alUMscf-psfP6v8U@SMW015318>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SN7PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:806:f3::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2739b9aa-489c-4c53-8b49-08dee0f886f3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|18002099003|22082099003|4143699003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
 tQYIiwTp8RAD4LrttIXIRCqScsL/Y50hvBpWRm65fgi9a8Uf23fgtwRqGsFYemqhACZFzjBV0KCfbVFUuayH3Y+llvm7t8+VGg+iH5YIs2EVd4gpErndo9l3UEtJ0x409LTk3I6FwfEelSJ7MIas7XyGjXHs7Wsnt8Y47hg9KrO7EtZAcO2V4Kp1rwI2se2hV5zBEW4MqNkpwoj/U+vTd/0UM29mjAc+DrKxlQy0RLqrARvSNPSjArYPIAX4yZfCEMnV9YNG9AbZPuy6AxnVJY/WqWz13/lu7BSFNKtas55TIuBGIr3EyQROhGU84jLKyQQIOqKp4TuaLLj/fsTGcjOUN3s/sNRaKctgwxntFEf/DKGjPnCVAZDfQ7tmy4yymsVtBwqoiNYnlhNktWIBGY3qP7AkgJc1jjhgqMhh0PtocnLu/Q0+nox+Xg4ZRiwnFSomfhQUdrRR5WRU5g510/5A96QY1zMasN3HuE0kRG3lGj9OpNXpJKTwdrUpboZQss0hz6EUjTgGGF4G9RlkbSOuB9QXrZicAkatB1N2Mm1NykztO+iDTjhTmr+r1d8Bc3HyJ6RbViRxFMlv5e7WExtZcSzkF2xsLpeBO6Ep4eHDyYG912yqpGwurRGptPnf2TIC0JcRN8G395VYw7lf81ziaLGlCCeK4Yz+8xRzQVY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xQYEzzajbZ6eKU38bziGpfpF7lhNmeGq7vio6oZ1D54fixGf7E5vDvXhiHcb?=
 =?us-ascii?Q?eNS/kOOb7eF/bN4C8MmhokdnUTJzH4ype12cvh7HS/lJHTpf2Kwj4Au3IIfL?=
 =?us-ascii?Q?519A45/YaTIswH9b5PWje2toRSqwz8bVqT2cykjr5GM5w9+6Zmrqug+RWfIM?=
 =?us-ascii?Q?oZLQ43YmILlKPs9+FXQ6muij5P9InQ+1g4Rj2C0fI5bf+6ebjK/V0UKlL5nJ?=
 =?us-ascii?Q?chPPKUUqvcP0WCUAyem6stqsjxC7oYbfVlbHws/KQ2Ux+mpoAjwAXBP7uYk8?=
 =?us-ascii?Q?sisoak1Hze9pPFHVnkrYScTxMRl9nJMAlREAD+gBfO+TthxAjk75Fb6hZmt3?=
 =?us-ascii?Q?wbNRtZo7AfEB5GvhiyaSw4y6aZSa2PGkhJNgMkcqNhEC0sgX9yT6XKjReYMn?=
 =?us-ascii?Q?elR1+LNOY3FEjSzJkO8sHG3NaCOlu8m4VvwAK96E/mJIQmAQ/E9vy/EE5wrS?=
 =?us-ascii?Q?hnHQNW/zCJcOTYrP70OiiWC4N1ZITbDObOEiH9hxlU37Abn4hFMj8Jw9codf?=
 =?us-ascii?Q?09Q4BByEFcF0bCc0ybv3sQcNtDwAiixeJ75dVVqlLaBaD0ttfY8GFFY6KAN2?=
 =?us-ascii?Q?xxsjGYuKt6NS98CfN9rIZBd0BabpXYOxdB88BPnOndeXO+CLT+Nftfg47BWO?=
 =?us-ascii?Q?PRnzXJDPr1YMF1m2wGFv8GD3odSpI3G4ZJlTtiCg4YV7efATqp14iLwXXxc2?=
 =?us-ascii?Q?lZGF7Q+LPLV55hjtjJFYauWTp12c49JqKzhTnEYs62XTyAmGbxNUY94R2WcA?=
 =?us-ascii?Q?1EZm9daFvwd61myCfq4nCxGnObYK0vtCn8UmPoFmSK5CL+f5SLj9DSPVBhtc?=
 =?us-ascii?Q?gEeNm6R4dSS7h4a4f1kaThIKPB3bj7yZRaUYKql32c8hdkIrA0ZJcmVhQBFg?=
 =?us-ascii?Q?EkjobYhGX4Dkuepss01cJ9TtAFsVLDHeBsljlhAUKBNNIcmrcthQBbRt/JZx?=
 =?us-ascii?Q?GHHlLl8oCzIgpedPGuiCDWjbbq+po8D0pemPJkVbqUIQ8vNr9uHm0aU3RG77?=
 =?us-ascii?Q?FIfvGe9Vzk7wgDTXgisIUA52ONmqtbj92H/6nARtArN9DZv1Du/K2Osj7cxF?=
 =?us-ascii?Q?knRSL2vSS8kdbkp5T4cEt3CmAof2kURHr7EK9Cgn92aM13vaUQZ6rlw3qzI7?=
 =?us-ascii?Q?wdQFHVmIWqoolLbxIj7YbiNdw+MCuI4OgWLsMJAWeSXtOc5l4QO5xCtlXioE?=
 =?us-ascii?Q?cKX9moyIcAcXK9xlVrDm537OdMsS1U/qCpu8ijbGK/ZlkPqePcVcP2I3Isx8?=
 =?us-ascii?Q?BnZAJnPhQLTfPd3tg7iit/VBO95YqyqNb55ewcNQH6J4XAhEU/E0EzYrnc02?=
 =?us-ascii?Q?qNybYiEusqUhZ2PFHidr9Vb06LxHsnyCtdeedt1x7dq7nYesvxXLl0ROFJ36?=
 =?us-ascii?Q?0c6Oa4J/DFIDCH4vIbM0IBVyWmIO+rOMs9+ZCHOtJ7i00gWYElX239SvPr56?=
 =?us-ascii?Q?ocL4xwpCV9GrZvYPZCXKd3cbbdyi6uBtpODVuk+jcAHTUlxW8j4m1tBqRpSU?=
 =?us-ascii?Q?SkiH9Gs3g431xtJacWgxZ4GBXLIv3pHyXQTdZFw4Ia9rDff9Bjknqppyl4j8?=
 =?us-ascii?Q?l+oNnEs96e+Hsk3SesCSuId8nBSKJlmJrYTvc+rsk6ErnIw/Z5ItnyqxlG8+?=
 =?us-ascii?Q?7D9NnrLz+gzY9UFJDG8nibhHF0QqqUu7RAyInYprhTFyl3BMkJ7NX4hMVbnq?=
 =?us-ascii?Q?0mwI9n5B1hajRJB9O2SCO1GVt16lpbRMZ/1fzl6mhJXWoTy8e+t0TEKngOLI?=
 =?us-ascii?Q?r/Z+3NjkEg9ZBAfJbJEgo6opBR0N5UULT7I9f9EDm0+BgGiTOx3/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739b9aa-489c-4c53-8b49-08dee0f886f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:05:15.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4DfDuG2Oir7K3YI292FrEZhWMRGpVViZYsHbJZ8JuwADuH62XBAA1vPTsQzp2vuDHAWlOPIyK51fBwlPbW0BXqtBhoOS2D5M/9v4/WBFVur25WFoH+zWAZ12yAA5Ik+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11388

On Mon, Jul 06, 2026 at 11:34:34AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
> latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.
>
> Add the PHY VDDIO supply regulator and adjust reset timings.
>
> The PHY LED signals originate on the SOM, but the actual LEDs are part
> of the carrier implementation (RJ45 connector). Move the LED
> configuration to the Symphony carrier device tree, matching the
> evaluation board LED wiring.
>
> Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
> is therefore not enabled in the SOM device tree nor in the official
> evaluation carrier board configuration (symphony).
> Designs requiring WoL support may enable it in their own carrier-specific
> device trees if properly integrated at the hardware level.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - Fixed commit message
>
>  .../dts/freescale/imx8mn-var-som-symphony.dts | 20 ++++++++++++++++++-
>  .../boot/dts/freescale/imx8mn-var-som.dtsi    | 20 ++++++++++---------
>  2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> index 7308613a48b2..520aff23e587 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
> @@ -8,6 +8,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "imx8mn-var-som.dtsi"
>
> @@ -74,7 +75,24 @@ reg_per_3v3: regulator-peripheral-3v3 {
>  };
>
>  &ethphy {
> -	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;

why remove this reset-gpios?

Frank

> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			linux,default-trigger = "netdev";
> +		};
> +
> +		led@1 {
> +			reg = <1>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			linux,default-trigger = "netdev";
> +		};
> +	};
>  };
>
>  &i2c2 {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> index 71a2f0866822..09146ab76385 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> @@ -35,6 +35,13 @@ reg_3v3_fixed: regulator-3v3-fixed {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
>  	};
> +
> +	reg_phy_vddio: regulator-phy-vddio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vddio-1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
>  };
>
>  &A53_0 {
> @@ -96,24 +103,19 @@ &fec1 {
>  	phy-mode = "rgmii";
>  	phy-handle = <&ethphy>;
>  	phy-supply = <&reg_eth_phy>;
> -	fsl,magic-packet;
>  	status = "okay";
>
>  	mdio {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>
> -		ethphy: ethernet-phy@4 { /* AR8033 or ADIN1300 */
> +		ethphy: ethernet-phy@4 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
>  			reg = <4>;
>  			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
> -			/*
> -			 * Deassert delay:
> -			 * ADIN1300 requires 5ms.
> -			 * AR8033   requires 1ms.
> -			 */
> -			reset-deassert-us = <20000>;
> +			reset-deassert-us = <100000>;
> +			vddio-supply = <&reg_phy_vddio>;
>  		};
>  	};
>  };
> @@ -342,7 +344,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
>  			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
>  			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
>  			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> -			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x159
> +			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
>  		>;
>  	};
>
> --
> 2.47.3
>
>
