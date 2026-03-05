Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03403C6A46
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725348; cv=fail; b=I0S4RkIfH4ftdEYZU70uqfH3K8XhnZO71TPeMUMaAsozKZayxPssKbOwkFxjmZUGklFOAQ/afu4v/8aVaiOhM3Xw6AteCh5is7mQcgL5KTBGSFkzZQgu6EvjmckMtwe3IEhGzOpvNVDhoULyZTCpylcApfdxyZPICmpeOe3luHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725348; c=relaxed/simple;
	bh=mRsaxSDgfa0SHlrJexDjjK2yTeUNcaQmOOXJcc9dWnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZMxjSLoEsWkhlAHXzGXKlpys4rWxQ8zvU3f8J9RXlCcWB/Ww5R97g68ozUdKjpf69gS8ptifOOQB98JbMaPbn8tKgIaHoE1fP83NJU2KOinhEsU0wcehzCV+6mNOoTQc92PVaJR5D8YkkbKfaub7c554HL7b39u98eo9dBbcS4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j7xwELHC; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j7xwELHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aD6osQQGYtkyrP5YXcsZmx4DaSh4WD5In9xANHuUMoIZA8F7qrOq2kK7rNPMQZGdVoLeLTrnuOasmv9vQcdUX675MbJJOvJQHFlfg8l66IYlOd/WViAJ7LYEBIYQL1vcmzDaHwMpNB/DmdWwoyiWYZX25TtYNL3o5AepapgoTFI4sVovpHYPr7q+avJGeKjKINBFDjDPS8I47vhj33QSlkX7QlL9tk7WlNN0GyOoZg0mxQXXzQUk6TWqqfJxECAEjrlh5mgcbwMis4FTpfgG7gRhBBh3JNtj16sA6iD0xltrgSWZZ8L5CdIFj112c54MHpVCpgrw5MAImToi3UhvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhBL+uNCJn+PCrR4JmCAN0bMUELHeDdg11rc+UKOp1Y=;
 b=X1NJMziVd30tSlH8qCaDd1Yy7u7j/xaIyPoSVJV604siENfctcgGygQSXNdO7NcEk1eb3pRuPG35Ou/hFu5MFZ5zUXJ37SHD0gdHCYWy86y6NN6PuOTQReyVV+BcLHxvjxcsOIMQ7NldEUkQkwuykMQaa50R1HBsVpWOjbWsbDi+7Z45if4g7hedm25l5kaStZbTV2vMto3H7yGyIsye0QiR5tvzIQVZfWekAsWexab1TzAqN7j+8PaeQI7Kv4A2G4sT2wafIAe7EL1DllH/vfz8CdF7ICbO09q25T2WG9lZerLqrGhG0Ejov8y850ZIR6jGkCO3kZNnWZbs4awzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhBL+uNCJn+PCrR4JmCAN0bMUELHeDdg11rc+UKOp1Y=;
 b=j7xwELHCtyDpJufbI9AmDPznNepybPeNdKjFWCW15CRwsWn/mvdDfMHKHJfwYMFAiqA+X/TaLZ+MYuWEl33YogXkjARsyNdgE2l89TnIr3T6wt/eREBa9y8n1+8kV/O2ni3o+Zd0DJf8NABnxUVxzoWTmPcUv9kYwPV8JrwHjZsTFXO2Z0P0Hopx8LnIMexho83Tmy2ZHOIAAa8psK5+wLarqOzF53JndqT+Zda2/JBH7VS5VXeszHnUmYO3fAkcwlO3fftlqBuGqT/jIZzRdE0VSzPG6wu+3UIJnjK/RbDFcxtv6GPW/FGDqbPkL9B3hqPAZjpT2ypCbHi1SdjO5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:42:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 15:42:23 +0000
Date: Thu, 5 Mar 2026 10:42:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: imx943-evk: add Type-C node and enable
 USB node
Message-ID: <aamkWBGOPDlc8Bxu@lizhi-Precision-Tower-5810>
References: <20260305075527.1116943-1-xu.yang_2@nxp.com>
 <20260305075527.1116943-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305075527.1116943-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA1PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 848eff75-216f-406f-0fe5-08de7acdcb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Z4hWe5ZE8VZWWpEwDAS5o7pewu5CwndLD8EOjQwfYfYYWLYtA1GdIts8xly+qvfBwny3J3AEzje16AIhrFVchocxK5VJl4++7KfpL/S1BrxVpxUUQ7oiQdhdCP/AFoiRUiog9fMSNayYV4Hd5/35CWShG9lAmkpF3cpgeXXWHvG1Av77RAuXzPa6c4W+I26cqk4VmtUDs1oo+2G+iQFVgEeqOqhInyvFsoCUaL9iP5A5ukzN7J5i50uBtVl88UtEomtw1+c4x+uiRgg+GVA4wqs8dXkxQo59buee6QZ+hXF/UN8iUwcaUBA8faj9ePGrG3/QD6gxp6rbX9XLSWPMgOhsHtuwaK5oyxHV9of2XeeCzZYLasxyWStyeVrpjwHSRxAbz4afJJXjLP2isO79atvyiBMmTRwrvea8Sq6pklglARgF2CkKOwmTQasvbSbDCGepxMoz7m6skEoDTIwboKAwUAyeZM3A0tsxmRlGfE3iqJIluLzMtXcjRTInJkdRy7pOcG/oakxvT43I5/OZwWkZbxuJ/1xXJTnu0B+EjDE8E8IpI8ppWEDt94GTeytrFzkrmhtYJ5c9ebvBgADeZMXfPD+yGYhZbxNzY59VgCye+eiYFTZxYVumj/rCVaibGtUnAfAT08x2FO2UIklBhFv/DpQxlccAzaxBF9rT1dRuwJEaBg+3Q3C8Bq3kSlnqt6/GI+dM5aJkacpuUSvt/WgTxEROkfO4aMjEEZY6sB3m6XN67mjOdvrcsVcJfH8gp1m2tEUWABYM1Y9wuCqBPILvQVnaedODWLiyDV0eQvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83E9xJfIJ4a2zHuCcsH2Hdzd4DfSOfTwnmgshSThSpJQlGU3LVkHST/KQrag?=
 =?us-ascii?Q?HJr0amnLI8QOcmQL1nfngdm+F+7SWXtVzRLeAyKF1Cr+H4j4LD2Dice7m1yt?=
 =?us-ascii?Q?T4rmGeWI4Gqxhu3envOPlltJ4NHwvC45UtH0UIrRiijI8DGef2LeCn8nCJek?=
 =?us-ascii?Q?fqlleECytn/JkLkhEl9+I263mh0nsQH7ZpEhinEkAEPyt8TGnfFUI/qlwXo1?=
 =?us-ascii?Q?U5n1i7FqtJD0fDVN/yP6bvf6iM36LZ3cMuzf63RIVIk9VlgkY0wVk8Tu5aW3?=
 =?us-ascii?Q?DUYR4MfgS6e/ITU4mf14QGGn9TDO6mhAURaKDDWQ4heXdkuY8kODFgyOwHNX?=
 =?us-ascii?Q?Vs51tLfo0Mi8d2G+XgWY2EoPAjlM2NwlOIHv5ipnc/qfGXFZkmHNQIA8ZXv6?=
 =?us-ascii?Q?1WAiugb7G3REMGSmJGxbK1hHrzijb3x5mV93FYpufF1ItmnF2mA3Iu4SM3be?=
 =?us-ascii?Q?zV2ZpKNAnInl+h7B6eGQA1ainvYMB7HbSLtuW0iNiKrMjoqFQpoXQMm4N5Dh?=
 =?us-ascii?Q?Hn9hMlMhXgSgBZrnheJ2fQOlH+R53j8gE9qEHQA3vZrwU4k/wKNJU7Zxj2+V?=
 =?us-ascii?Q?nDbxR7KRYqWPlbP3oW1fXZUk4WShLAI7wL04UvOEcoxYLgg4muh+Wcl3XKGN?=
 =?us-ascii?Q?Cnej4//z5tp4BPTkSljxGUmoo6HJO2Il23G2P4x0Beo7YUU7fTGACezcfDW9?=
 =?us-ascii?Q?fFbDeJGnavhGHSish69gbuZs+eIpbmQkVZLQNiR+XG5R2eTHyNjpWKVOewOy?=
 =?us-ascii?Q?K9gq3Iku/k3hcU8hiM2TIrhGRuC2bXGOc/qxfyT/j8t+wF5TcHrBynU4zVTP?=
 =?us-ascii?Q?sTtJ0p65iWmbz8KJs/5vEokFLpMjPdFY4rs+Jmtd79Tj1IrKqVF3Qe7wC1F6?=
 =?us-ascii?Q?TahvH/4nOc0kvl6K5JLD6ozf5GyYJ3iiE1wz24Jp0zc6dyLjU6EEI73GRpLS?=
 =?us-ascii?Q?3TW+0OH9d+9Bd4Zf6f8cNDCKJ+ysNhpa61joBSfZtFMdNREMl5XEmPB3caNf?=
 =?us-ascii?Q?fJKH7pak107tUrJ6m0fNmbZBkt2zYscKNrs4NHbVYzl8vUNZ7w3pS7kM+Uzt?=
 =?us-ascii?Q?hs74WbfSp6EeabjDW4GmAEMaORCU+dZOYqioNdFlyclaz1UxqGl7MG0Xv51G?=
 =?us-ascii?Q?dfQ8yc5iKGiGm6sD1LiT70D3pfwHaP9j3uIxHa+f0VQ0ZMj1JiwaJgdUFoku?=
 =?us-ascii?Q?EqAtBLKqaDlNBu9jVLFFAXooR8BEQJIOlODbIJSwqKaEcyy0rmOvCnM0hXn3?=
 =?us-ascii?Q?myn71d9br59RPYif3X9Fn5W4wvj+t+cfVMVDP7ZfCGqLBisJHJajzhHPUz4I?=
 =?us-ascii?Q?msxTImzMSlHifjSPCnT52IZ4qYV1AKtdWY/aUEi8AXJU1JWAcJNF9gIPa7bO?=
 =?us-ascii?Q?bX79cM546PqnlY3EClKwy8ptyD0vlwZWyl9dJvcq8A9kY+CAJf5iPpJpsIlH?=
 =?us-ascii?Q?igzOWfRAE0rnG7ZMS6RL1JS74gQ7AeE0mzJu0r4cU+XwTA1vsOQcfLoJVFQa?=
 =?us-ascii?Q?6suiinJgg6oTZU0TsgBzv6xBk7wJ9EOdju2I+9TC+5w6gNz3Lalex4EU0Chp?=
 =?us-ascii?Q?fuByNagVoVe3xUpGEBR3IpUW0o1QtiK9mNTsVc4QOuprKcnfwcTyLIX5Uag5?=
 =?us-ascii?Q?t7kCFm7tfNQ3UrdeUgVDvrDH4dnCJ2//C03d4A4ybD8x7nX5b+/cVDIuWe+E?=
 =?us-ascii?Q?x+9E8f3vIrzguniCBc4cnpbg0eH31cTvk5a8cvsq8JxStqWHNmQhBN1wGPgN?=
 =?us-ascii?Q?kxh6PYeOxA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848eff75-216f-406f-0fe5-08de7acdcb56
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:42:23.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xAJQ6bHEYdgr+EtMjRey76SUW4xxHOJcgSGqJvTUIh/sYewQEp7ZMYsvglah6cYG+l66LnEpqXfqPq5U9cehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349

On Thu, Mar 05, 2026 at 03:55:27PM +0800, Xu Yang wrote:
> This board has 2 Type-C port, one has USB2 capability and another one
> has USB3 capability. This will add Type-C node and enable USB nodes.

last sentense change to:

arm64: dts: imx943-evk: add Type-C and USB related nodes.

Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
only and another is USB3.

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 92 ++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8ceabe3d923..fd67cc8e919b 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>
>  #include "imx943.dtsi"
> +#include <dt-bindings/usb/pd.h>
>
>  / {
>  	compatible = "fsl,imx943-evk", "fsl,imx94";
> @@ -230,6 +231,48 @@ pca9670_i2c3: gpio@23 {
>  		gpio-controller;
>  	};
>
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +
> +		typec_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <0>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	pca9548_i2c3: i2c-mux@77 {
>  		compatible = "nxp,pca9548";
>  		reg = <0x77>;
> @@ -680,6 +723,12 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
>  		>;
>  	};
>
> +	pinctrl_typec: typecgrp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO44__GPIO3_IO12		0x30e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
> @@ -821,6 +870,49 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
>  	};
>  };
>
> +&usb2 {
> +	dr_mode = "otg";
> +	disable-over-current;
> +	adp-disable;
> +	hnp-disable;
> +	srp-disable;
> +	samsung,picophy-dc-vol-level-adjust = <10>;
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	dr_mode = "otg";
> +	adp-disable;
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_hs: endpoint {
> +			remote-endpoint = <&typec_con_hs>;
> +		};
> +	};
> +};
> +
> +&usb3_phy {
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> +	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
> +	orientation-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_ss: endpoint {
> +			remote-endpoint = <&typec_con_ss>;
> +		};
> +	};
> +};
> +
>  &usdhc1 {
>  	pinctrl-0 = <&pinctrl_usdhc1>;
>  	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> --
> 2.34.1
>
