Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17742A158
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305792; cv=fail; b=uPx+ejqQ30R3lCD5CGF5pMj3TBVIVM2eFhbV0zmomHCjQtSkIBQrS+FbeyBtYciRbn/YxwNOpSbzvFK/Dg3BiC7XkKRNQM3qIaHnqIevx6CaBj7TjLOAnmmeeImH3dsoSfvFL/f+XTmIkA2MAZ4CmgfwcyWnvilqfJwksLxts14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305792; c=relaxed/simple;
	bh=MTNtPhIQaRyLlStIIAPwS3Xla7N4pmahCfxSYp7b1ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QC0Xl/V0cfo4BMxhXwY1ec2mq0m3AX+f2hl78cEvh6ugCqSTa8ZMi/NMsrBL4p+kxbpPfkKtgb/bg033l4VoiRaoElkiiyWVABcCuwOnrcFxOIFBIaShBjckI1HqA2JkMG434pEn9jWg0i++8qrLxFVnXx5mMvoLc7no+GB8dj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p+Q8Kfxg; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p+Q8Kfxg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwAOZmlzu+Qa1CovLn7SsuvS6HZoeEG8TDu3UZKKGmtYSZxmPvzSojWGx1Zk95DCqn6h8WuPeG/WFDRUgveC98VC3jQBGDulXnSOGrlHTuNMpWLEHVW5nk/21ECFZ1eMHc7qy+T2GKYKqlrXP2dH0gdMxxn4hEYTDArwATseWTNdaz70HEDBzV5tNwpb1ODR5jfpUpUXuu76+gxYTXMqhkOaHFRkVGCJzq2/+F4BlfpGcvRD+PuzudwVDlbt3/VwTxtldN8W5h/bGAME/L+TGB3l6mrqhMUbdEKBv8MQpSh1i0OiKe+dY4SXobZ1a1F6wKiqd7ZUUAqOIp87z3cYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bkxkjdTP7bt8b43FuJslKE7jflsC8BymBoPRYRRcBQ=;
 b=CgHlPNKa5YzfLO11WnRACPQ/28JdhOQpkjHJ8Cxt6lTq91hLogkss/wmG7ugpz5hcOG41KnSKUzQx8dBYwFlIBJ8vL8bwMoN/7IsBATp+YXnFYSZQDDg9HU6hNZkMtHRMHsvuJ2DCCSVrw8AvYuvzLYfRtDHBbLfg2aVyvt3Sm6Ijv6Dgd6sBUwXJmLzAf7FT3kuJZ84Ox8mhzevd3FMeOHe1bG/1Jz0tnHeotVdgkq9sEtF/JlZLrwDgBzxhD8mhOi+IIiODgXGLUhQUnt4I/We3TXJ4tEPUSwaVOOplwzrIN48rG1idYg/TWryZge2NUWpirVs6T+Mun9i7e+fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bkxkjdTP7bt8b43FuJslKE7jflsC8BymBoPRYRRcBQ=;
 b=p+Q8KfxgFCOhjtvQrhfHAkjQ/3m+fWSHxrRQXTHjt7PFzDsMixaUHfxn2uPtxXF2CijN4iEoYUpTShDcTjlYE/NA1DidZEmku5EKkrzJQ6/o/8eWW6Ya432qEAaYXgqm+5gA8/xrJt6Sp8MiVgDWbvClV+MtROpn2+a5KVVqFsc4j19Jb3/I8ZTaVqvNosS+OTts5Yjh4FhOfQZwQFJLE81dwQ488f/zspusutgJMvJisIevMKPfmElKHWwpWUA612BeWdb0DPDUFw9ZMcwDKf6ontBoF1S7tx5aS/mdpknjslGHWO3tVJNPuIVWEJY7BiXIJqGDKhOttEbeXSJ1XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 16:29:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 16:29:45 +0000
Date: Fri, 17 Jul 2026 11:29:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: imx93-11x11-frdm: factor out common
 parts into dtsi
Message-ID: <alpYcJwx0DMRKq_R@SMW015318>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
 <20260717-imx93w_frdm-v1-1-0cca6c0ba2f5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-imx93w_frdm-v1-1-0cca6c0ba2f5@nxp.com>
X-ClientProxiedBy: SA9PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:806:28::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 30dd7a84-2075-43ff-f5ee-08dee4209cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	N4Ocnn6qufmXzTo8kZbKLzPU8absREOB17BojOYgN37fPgQCPEB7Xk3UcU5XP8HUH0rQIOz1kxQfHpT5DuKg2YBdACTp2szg5q8UBPR47YiythDXeAFHYoewUqr7YVVF48jbBj2J4vGG7GSbznnJgVtXDU7xADXylFlc4PaDO7MjSKzTjXSESZF/tEbsIMQ2hmtF88Ibi/lp8KU+4hl67jbR94UZP51hferTtu5SKRMKTvyS/hfxUSMarpGFJW5cYrrCBwQgxTSsyPh+MwxioYD2y40JietSVCFIHutksWuMR/0X1onK17HKuCFvT8qNVQkOn0Qy0+rLbKnmPMWjVgH4VrMzhz//+gfXnONZ0OXKgV8YUKJLeEvg7vlVcKd8l+8LW+Y8F0XXWHObSxXbDlyzH7AhrIU6whB4AtP3Hvsm2EUWCWILoJkK+lkdqt3DWe1jzrIfC6I7XgroGe02m3Cf25kU7KuTFqG65BeCZkt4uGB+ZrLAUiWpu6RClQ25ufk5419Hp8ZRusxe9b0XHHNFi6qjulKMW39hrAANWFwJ+R8D6NMvdYhwx7kIZi7yry1sLQ7BbpfukeX1RfFnSDp8aA0qReARdJywQU8036oPxyzeM/KIOE1f4HF8syi4nd1sUn2UDWeWNTRMwa30p1DdKCvf1+b9icE/qf6YSyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKrlYChbzKrIvtI+/kIUIRZ5RcVCwo1nRYHdL+rbd9e1iCS4VypD8O3D6s2I?=
 =?us-ascii?Q?GFmP4TKfwCqy0LqwktBFFWuNmKkel87Dryc0jGblC5eV/667zdXq9uiPVfDy?=
 =?us-ascii?Q?OL0W1Yew+erMWcfjSPJtddYme8+a6LcM6N87gZzvB/g0RyevQ557pYVlRY37?=
 =?us-ascii?Q?J3MLlxxzx9/d2qdwFHnRY861YvF1lzSx6hb0arA5Mbx9XRAsGmvieBQAe45G?=
 =?us-ascii?Q?nVcQ0KyatXYN/qGSxgnO2a0heh44cK9Cih1MnR15HBp+DeTn+ajZONrYfzqJ?=
 =?us-ascii?Q?zPNgbGnzyk1YPtqorxQtNbhW+FWn2IpkxoYj86f5WwpWB0Q55uIJiR0E8URP?=
 =?us-ascii?Q?95QX+q0zIKm6exEN/FolMfWZlWVcJ0Sx5NRDd6CveoYEln34jWAPbb/TDd6E?=
 =?us-ascii?Q?XIh4g/XK9guUgBgmespTRypmEZyaN/3WECla73Gh7G8WAVqG74nLPQ1pOG/K?=
 =?us-ascii?Q?rv48s55AvjH/EQvddvT7izD/FxgzwVFMgh0VhskcuHX0S65gHEPGLtyaOWUB?=
 =?us-ascii?Q?RHIykqcWzfiAJ9F8DX2nMMrusuyoavTqCDF+0jtdyCLKn55v7lzYhnuzQfXP?=
 =?us-ascii?Q?xRj9NmdvtCo9IoQQd0eTyTglTFBUhwUbL2FEzL7iM0KRiHs0BfSBQ0pqHzIm?=
 =?us-ascii?Q?j9B98ti0jh3nXnrhvx6uWKk/O2EqGc8hAmm9jvmekLHEO2yKl60egIWTwTKS?=
 =?us-ascii?Q?vpXKepfE+CLBvVmeL9hhYPp4oIEvSqRCNfIB36wouFuVxgkH4Vb/Rq0tbgKS?=
 =?us-ascii?Q?BhkITFnFspXdv9+CpUUYbRPm6PmkYpaIkAj1U3SL7h9HJXsBdp8h4Y2vlPB8?=
 =?us-ascii?Q?fzRYYCIPGiHI6zvmRKyCBE2m60BmAWTSCEcudtw+S2OfVT5yf5+bjo4ho0Rr?=
 =?us-ascii?Q?DWIIEZasHMk4LJDuDMJ1OWVsPZr4VDjURkq/5pokTAHfIE6dbUsD0KwyoQFk?=
 =?us-ascii?Q?BicUVt3SGAPYEptHaJ2owSDDaZJ+k6KJdY6pHvF8hYuEqZdXFoMjZCksiQqE?=
 =?us-ascii?Q?u3VfzJ9dqLNV3etc9svkyu2UyIwSUhqc0xo/9dwdtUsyaktxsKL2IExuDgSU?=
 =?us-ascii?Q?tFBPMgYcHJ54ogjp2g0/iQLpukecAPqxKTfW6CLp0s56MWrKu4z4M09kDxWi?=
 =?us-ascii?Q?YqFpiVRSaNxaQSCaoXUpQOC8vf3lA2dYLQsVVT8uofwp9FEfVvVSUILpfdpz?=
 =?us-ascii?Q?MkQXTroqUugxD3RgTILC/7NWIJzG1l7DcyNgBgxoSxc7jSe/HmXMBkj4Ipzh?=
 =?us-ascii?Q?WhxeZS4LwC2bteaKtCROf3gP+iKmg08NZ21Qc9qW9zCrtuefLPsHbC0DxDdc?=
 =?us-ascii?Q?xKrhAJmbyeHGJksq50icZwbZwLwAmzv3ZVGtEyTAAy3EwCKwSH9MFj09KsbP?=
 =?us-ascii?Q?bf5BIH26mYKeCTrwoYo6Jp5dR6paIViTzNMBygBx0ytBI0tJFJbQzmgxM1Ch?=
 =?us-ascii?Q?tedWPEfvrP8Fy6+WvetZ2aMTI9uUoYYmQ5SLvMZh1KivOOGs1g+VXY+6Bu9P?=
 =?us-ascii?Q?QVBpWDe0abhgJojVjdsCSMr9XqPIQ5j/4+ugKPWPDiv4eyzBuDx+OwVf0isV?=
 =?us-ascii?Q?XaYn+dxgGxd81L4qhFlZg/RGp2GznIosqsBqo9XHzfAgvL2RZS2HvIlAub0O?=
 =?us-ascii?Q?YxCS2QEAiMLzGm1i4nJK1vFlZ0N1n8STKBkRkhPPGf9Y80ugyKU6vISpzGsT?=
 =?us-ascii?Q?ifohSB0UboUTQXCJz+Gh1mUzgqFOHb+bkFtVqoOAsGYhHyCU27EBdN2vZ5wj?=
 =?us-ascii?Q?3No0nUg9gHUWB5B4hfrx/FsCfY11k0GPzhxYp5qfsI7dN50J6APX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dd7a84-2075-43ff-f5ee-08dee4209cc5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:29:45.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6e93vblEaO2ndqw3RBrzyLl5r8A8euL1Gpf2dAseyirB0Cih49P+Ycz8mASsaiimEQXLeJcc+2Aeg315JgSbD5+y6RFbE1uOqpQZjT7Cy9dlb48LZ8dQa+MKiFt8Xicp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

On Fri, Jul 17, 2026 at 02:11:52PM +0900, Joseph Guo wrote:
> [You don't often get email from qijian.guo@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The i.MX93 Wireless FRDM board reuses most of the i.MX93 FRDM board.
> To avoid duplication and DTS-to-DTS includes, extract common hardware
> definitions from imx93-11x11-frdm.dts into imx93-11x11-frdm-common.dtsi
> to allow the common description shared by both boards.
>
> The FRDM-IMX93 board-specific .dts now includes the common dtsi and only
> contains board-specific overrides.
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 692 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 686 +-------------------
>  2 files changed, 694 insertions(+), 684 deletions(-)

Please use -M -C to generate patch. git can auto detect copy.

Frank

>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..69e23570f71f40a3f3517d31e16a9ca1d3dfb1f2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> @@ -0,0 +1,692 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +#include <dt-bindings/usb/pd.h>
> +
> +/ {
> +
> +       aliases {
> +               can0 = &flexcan2;
> +               ethernet0 = &fec;
> +               ethernet1 = &eqos;
> +               i2c0 = &lpi2c1;
> +               i2c1 = &lpi2c2;
> +               i2c2 = &lpi2c3;
> +               mmc0 = &usdhc1; /* EMMC */
> +               mmc1 = &usdhc2; /* uSD */
> +               rtc0 = &pcf2131;
> +               serial0 = &lpuart1;
> +               serial4 = &lpuart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &lpuart1;
> +       };
> +
> +       flexcan2_phy: can-phy {
> +               compatible = "nxp,tja1051";
> +               #phy-cells = <0>;
> +               max-bitrate = <5000000>;
> +               silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               button-k2 {
> +                       label = "Button K2";
> +                       linux,code = <BTN_1>;
> +                       gpios = <&pcal6524 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +                       interrupt-parent = <&pcal6524>;
> +                       interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +               };
> +
> +               button-k3 {
> +                       label = "Button K3";
> +                       linux,code = <BTN_2>;
> +                       gpios = <&pcal6524 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +                       interrupt-parent = <&pcal6524>;
> +                       interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +               };
> +       };
> +
> +       reg_usdhc2_vmmc: regulator-usdhc2 {
> +               compatible = "regulator-fixed";
> +               off-on-delay-us = <12000>;
> +               pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +               pinctrl-names = "default";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-name = "VSD_3V3";
> +               vin-supply = <&buck4>;
> +               gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       reserved-memory {
> +               ranges;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +
> +               linux,cma {
> +                       compatible = "shared-dma-pool";
> +                       alloc-ranges = <0 0x80000000 0 0x30000000>;
> +                       reusable;
> +                       size = <0 0x10000000>;
> +                       linux,cma-default;
> +               };
> +
> +               rsc_table: rsc-table@2021e000 {
> +                       reg = <0 0x2021e000 0 0x1000>;
> +                       no-map;
> +               };
> +
> +               vdev0vring0: vdev0vring0@a4000000 {
> +                       reg = <0 0xa4000000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev0vring1: vdev0vring1@a4008000 {
> +                       reg = <0 0xa4008000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev1vring0: vdev1vring0@a4010000 {
> +                       reg = <0 0xa4010000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdev1vring1: vdev1vring1@a4018000 {
> +                       reg = <0 0xa4018000 0 0x8000>;
> +                       no-map;
> +               };
> +
> +               vdevbuffer: vdevbuffer@a4020000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0xa4020000 0 0x100000>;
> +                       no-map;
> +               };
> +       };
> +};
> +
> +&adc1 {
> +       vref-supply = <&buck5>;
> +       status = "okay";
> +};
> +
> +&mu1 {
> +       status = "okay";
> +};
> +
> +&cm33 {
> +       mboxes = <&mu1 0 1>,
> +                <&mu1 1 1>,
> +                <&mu1 3 1>;
> +       mbox-names = "tx", "rx", "rxdb";
> +       memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +                       <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +       status = "okay";
> +};
> +
> +&eqos {
> +       pinctrl-names = "default", "sleep";
> +       pinctrl-0 = <&pinctrl_eqos>;
> +       pinctrl-1 = <&pinctrl_eqos_sleep>;
> +       phy-handle = <&ethphy1>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               clock-frequency = <5000000>;
> +
> +               ethphy1: ethernet-phy@1 {
> +                       reg = <1>;
> +                       reset-assert-us = <10000>;
> +                       reset-deassert-us = <80000>;
> +                       reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> +                       realtek,clkout-disable;
> +               };
> +       };
> +};
> +
> +&fec {
> +       pinctrl-names = "default", "sleep";
> +       pinctrl-0 = <&pinctrl_fec>;
> +       pinctrl-1 = <&pinctrl_fec_sleep>;
> +       phy-mode = "rgmii-id";
> +       phy-handle = <&ethphy2>;
> +       fsl,magic-packet;
> +       status = "okay";
> +
> +       mdio {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               clock-frequency = <5000000>;
> +
> +               ethphy2: ethernet-phy@2 {
> +                       reg = <2>;
> +                       reset-assert-us = <10000>;
> +                       reset-deassert-us = <80000>;
> +                       reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> +                       realtek,clkout-disable;
> +               };
> +       };
> +};
> +
> +&flexcan2 {
> +       phys = <&flexcan2_phy>;
> +       pinctrl-0 = <&pinctrl_flexcan2>;
> +       pinctrl-1 = <&pinctrl_flexcan2_sleep>;
> +       pinctrl-names = "default", "sleep";
> +       status = "okay";
> +};
> +
> +&lpi2c1 {
> +       clock-frequency = <400000>;
> +       pinctrl-0 = <&pinctrl_lpi2c1>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       pcal6408: gpio@20 {
> +               compatible = "nxp,pcal6408";
> +               reg = <0x20>;
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +               reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
> +&lpi2c2 {
> +       clock-frequency = <400000>;
> +       pinctrl-0 = <&pinctrl_lpi2c2>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       pcal6524: gpio@22 {
> +               compatible = "nxp,pcal6524";
> +               reg = <0x22>;
> +               #interrupt-cells = <2>;
> +               interrupt-controller;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +               pinctrl-0 = <&pinctrl_pcal6524>;
> +               pinctrl-names = "default";
> +               /* does not boot with supplier set, because it is the bucks interrupt parent */
> +               /* vcc-supply = <&buck4>; */
> +       };
> +
> +       pmic@25 {
> +               compatible = "nxp,pca9451a";
> +               reg = <0x25>;
> +               interrupt-parent = <&pcal6524>;
> +               interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +
> +               regulators {
> +
> +                       buck1: BUCK1 {
> +                               regulator-name = "VDD_SOC_0V8";
> +                               regulator-min-microvolt = <610000>;
> +                               regulator-max-microvolt = <950000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-ramp-delay = <3125>;
> +                       };
> +
> +                       buck2: BUCK2 {
> +                               regulator-name = "LPD4_x_VDDQ_0V6";
> +                               regulator-min-microvolt = <600000>;
> +                               regulator-max-microvolt = <670000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-ramp-delay = <3125>;
> +                       };
> +
> +                       buck4: BUCK4 {
> +                               regulator-name = "VDD_3V3";
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       buck5: BUCK5 {
> +                               regulator-name = "VDD_1V8";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <1800000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       buck6: BUCK6 {
> +                               regulator-name = "LPD4_x_VDD2_1V1";
> +                               regulator-min-microvolt = <1060000>;
> +                               regulator-max-microvolt = <1140000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       ldo1: LDO1 {
> +                               regulator-name = "NVCC_BBSM_1V8";
> +                               regulator-min-microvolt = <1620000>;
> +                               regulator-max-microvolt = <1980000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       ldo4: LDO4 {
> +                               regulator-name = "VDD_ANA_0V8";
> +                               regulator-min-microvolt = <800000>;
> +                               regulator-max-microvolt = <840000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       ldo5: LDO5 {
> +                               regulator-name = "NVCC_SD";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +               };
> +       };
> +
> +       eeprom: eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +               pagesize = <64>;
> +               vcc-supply = <&buck4>;
> +       };
> +};
> +
> +&lpi2c3 {
> +       clock-frequency = <400000>;
> +       pinctrl-0 = <&pinctrl_lpi2c3>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       ptn5110: tcpc@50 {
> +               compatible = "nxp,ptn5110", "tcpci";
> +               reg = <0x50>;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +               typec1_con: connector {
> +                       compatible = "usb-c-connector";
> +                       data-role = "dual";
> +                       label = "USB-C";
> +                       op-sink-microwatt = <15000000>;
> +                       power-role = "dual";
> +                       self-powered;
> +                       sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +                                       PDO_VAR(5000, 20000, 3000)>;
> +                       source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +                       try-power-role = "sink";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       typec1_dr_sw: endpoint {
> +                                               remote-endpoint = <&usb1_drd_sw>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       pcf2131: rtc@53 {
> +               compatible = "nxp,pcf2131";
> +               reg = <0x53>;
> +               interrupt-parent = <&pcal6524>;
> +               interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +       };
> +};
> +
> +&lpuart1 { /* console */
> +       pinctrl-0 = <&pinctrl_uart1>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&lpuart5 {
> +       pinctrl-0 = <&pinctrl_uart5>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       uart-has-rtscts;
> +
> +       bluetooth {
> +               compatible = "nxp,88w8987-bt";
> +               device-wakeup-gpios = <&pcal6408 3 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&pcal6524 19 GPIO_ACTIVE_LOW>;
> +               vcc-supply = <&reg_usdhc3_vmmc>;
> +       };
> +};
> +
> +&usbotg1 {
> +       adp-disable;
> +       disable-over-current;
> +       dr_mode = "otg";
> +       hnp-disable;
> +       srp-disable;
> +       usb-role-switch;
> +       samsung,picophy-dc-vol-level-adjust = <7>;
> +       samsung,picophy-pre-emp-curr-control = <3>;
> +       status = "okay";
> +
> +       port {
> +               usb1_drd_sw: endpoint {
> +                       remote-endpoint = <&typec1_dr_sw>;
> +               };
> +       };
> +};
> +
> +&usbotg2 {
> +       disable-over-current;
> +       dr_mode = "host";
> +       samsung,picophy-dc-vol-level-adjust = <7>;
> +       samsung,picophy-pre-emp-curr-control = <3>;
> +       status = "okay";
> +};
> +
> +&usdhc1 {
> +       bus-width = <8>;
> +       non-removable;
> +       pinctrl-0 = <&pinctrl_usdhc1>;
> +       pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +       pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +       vmmc-supply = <&buck4>;
> +       status = "okay";
> +};
> +
> +&usdhc2 {
> +       bus-width = <4>;
> +       cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +       no-mmc;
> +       no-sdio;
> +       pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +       vmmc-supply = <&reg_usdhc2_vmmc>;
> +       status = "okay";
> +};
> +
> +&wdog3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdog>;
> +       fsl,ext-reset-output;
> +       status = "okay";
> +};
> +
> +&iomuxc {
> +
> +       pinctrl_eqos: eqosgrp {
> +               fsl,pins = <
> +                       MX93_PAD_ENET1_MDC__ENET_QOS_MDC                        0x57e
> +                       MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> +                       MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> +                       MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> +                       MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> +                       MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> +                       MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK  0x58e
> +                       MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> +                       MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> +                       MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1                  0x57e
> +                       MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> +                       MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> +                       MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x58e
> +                       MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> +               >;
> +       };
> +
> +       pinctrl_eqos_sleep: eqossleepgrp {
> +               fsl,pins = <
> +                       MX93_PAD_ENET1_MDC__GPIO4_IO00                  0x31e
> +                       MX93_PAD_ENET1_MDIO__GPIO4_IO01                 0x31e
> +                       MX93_PAD_ENET1_RD0__GPIO4_IO10                  0x31e
> +                       MX93_PAD_ENET1_RD1__GPIO4_IO11                  0x31e
> +                       MX93_PAD_ENET1_RD2__GPIO4_IO12                  0x31e
> +                       MX93_PAD_ENET1_RD3__GPIO4_IO13                  0x31e
> +                       MX93_PAD_ENET1_RXC__GPIO4_IO09                  0x31e
> +                       MX93_PAD_ENET1_RX_CTL__GPIO4_IO08               0x31e
> +                       MX93_PAD_ENET1_TD0__GPIO4_IO05                  0x31e
> +                       MX93_PAD_ENET1_TD1__GPIO4_IO04                  0x31e
> +                       MX93_PAD_ENET1_TD2__GPIO4_IO03                  0x31e
> +                       MX93_PAD_ENET1_TD3__GPIO4_IO02                  0x31e
> +                       MX93_PAD_ENET1_TXC__GPIO4_IO07                  0x31e
> +                       MX93_PAD_ENET1_TX_CTL__GPIO4_IO06               0x31e
> +               >;
> +       };
> +
> +       pinctrl_fec: fecgrp {
> +               fsl,pins = <
> +                       MX93_PAD_ENET2_MDC__ENET1_MDC                   0x57e
> +                       MX93_PAD_ENET2_MDIO__ENET1_MDIO                 0x57e
> +                       MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0             0x57e
> +                       MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1             0x57e
> +                       MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2             0x57e
> +                       MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3             0x57e
> +                       MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC             0x58e
> +                       MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL       0x57e
> +                       MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0             0x57e
> +                       MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1             0x57e
> +                       MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2             0x57e
> +                       MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3             0x57e
> +                       MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC             0x58e
> +                       MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL       0x57e
> +               >;
> +       };
> +
> +       pinctrl_fec_sleep: fecsleepgrp {
> +               fsl,pins = <
> +                       MX93_PAD_ENET2_MDC__GPIO4_IO14                  0x51e
> +                       MX93_PAD_ENET2_MDIO__GPIO4_IO15                 0x51e
> +                       MX93_PAD_ENET2_RD0__GPIO4_IO24                  0x51e
> +                       MX93_PAD_ENET2_RD1__GPIO4_IO25                  0x51e
> +                       MX93_PAD_ENET2_RD2__GPIO4_IO26                  0x51e
> +                       MX93_PAD_ENET2_RD3__GPIO4_IO27                  0x51e
> +                       MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> +                       MX93_PAD_ENET2_RX_CTL__GPIO4_IO22               0x51e
> +                       MX93_PAD_ENET2_TD0__GPIO4_IO19                  0x51e
> +                       MX93_PAD_ENET2_TD1__GPIO4_IO18                  0x51e
> +                       MX93_PAD_ENET2_TD2__GPIO4_IO17                  0x51e
> +                       MX93_PAD_ENET2_TD3__GPIO4_IO16                  0x51e
> +                       MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> +                       MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> +               >;
> +       };
> +
> +       pinctrl_flexcan2: flexcan2grp {
> +               fsl,pins = <
> +                       MX93_PAD_GPIO_IO25__CAN2_TX                     0x139e
> +                       MX93_PAD_GPIO_IO27__CAN2_RX                     0x139e
> +               >;
> +       };
> +
> +       pinctrl_flexcan2_sleep: flexcan2sleepgrp {
> +               fsl,pins = <
> +                       MX93_PAD_GPIO_IO25__GPIO2_IO25                  0x31e
> +                       MX93_PAD_GPIO_IO27__GPIO2_IO27                  0x31e
> +               >;
> +       };
> +
> +       pinctrl_lpi2c1: lpi2c1grp {
> +               fsl,pins = <
> +                       MX93_PAD_I2C1_SCL__LPI2C1_SCL                   0x40000b9e
> +                       MX93_PAD_I2C1_SDA__LPI2C1_SDA                   0x40000b9e
> +               >;
> +       };
> +
> +       pinctrl_lpi2c2: lpi2c2grp {
> +               fsl,pins = <
> +                       MX93_PAD_I2C2_SCL__LPI2C2_SCL                   0x40000b9e
> +                       MX93_PAD_I2C2_SDA__LPI2C2_SDA                   0x40000b9e
> +               >;
> +       };
> +
> +       pinctrl_lpi2c3: lpi2c3grp {
> +               fsl,pins = <
> +                       MX93_PAD_GPIO_IO28__LPI2C3_SDA                  0x40000b9e
> +                       MX93_PAD_GPIO_IO29__LPI2C3_SCL                  0x40000b9e
> +               >;
> +       };
> +
> +       pinctrl_pcal6524: pcal6524grp {
> +               fsl,pins = <
> +                       MX93_PAD_CCM_CLKO2__GPIO3_IO27                  0x31e
> +               >;
> +       };
> +
> +       pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_RESET_B__GPIO3_IO07                0x31e
> +               >;
> +       };
> +
> +       pinctrl_uart1: uart1grp {
> +               fsl,pins = <
> +                       MX93_PAD_UART1_RXD__LPUART1_RX                  0x31e
> +                       MX93_PAD_UART1_TXD__LPUART1_TX                  0x31e
> +               >;
> +       };
> +
> +       pinctrl_uart5: uart5grp {
> +               fsl,pins = <
> +                       MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX           0x31e
> +                       MX93_PAD_DAP_TDI__LPUART5_RX                    0x31e
> +                       MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B           0x31e
> +                       MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B          0x31e
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc1: usdhc1grp {
> +               fsl,pins = <
> +                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x1582
> +                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x40001382
> +                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x40001382
> +                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x40001382
> +                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x40001382
> +                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x40001382
> +                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x40001382
> +                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x40001382
> +                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x40001382
> +                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x40001382
> +                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x1582
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x158e
> +                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x4000138e
> +                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x4000138e
> +                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x4000138e
> +                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x4000138e
> +                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x4000138e
> +                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x4000138e
> +                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x4000138e
> +                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x4000138e
> +                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x4000138e
> +                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x158e
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x15fe
> +                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x400013fe
> +                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x400013fe
> +                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x400013fe
> +                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x400013fe
> +                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x400013fe
> +                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x400013fe
> +                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x400013fe
> +                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x400013fe
> +                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x400013fe
> +                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x15fe
> +               >;
> +       };
> +
> +       pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CD_B__GPIO3_IO00           0x31e
> +               >;
> +       };
> +
> +       pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CD_B__GPIO3_IO00           0x51e
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc2: usdhc2grp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x1582
> +                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x40001382
> +                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x40001382
> +                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x40001382
> +                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x40001382
> +                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x40001382
> +                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x158e
> +                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x4000138e
> +                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x4000138e
> +                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x4000138e
> +                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x4000138e
> +                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x4000138e
> +                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +               >;
> +       };
> +
> +       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> +       pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x15fe
> +                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x400013fe
> +                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x400013fe
> +                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x400013fe
> +                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x400013fe
> +                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x400013fe
> +                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +               >;
> +       };
> +
> +       pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
> +               fsl,pins = <
> +                       MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> +                       MX93_PAD_SD2_CMD__GPIO3_IO02            0x51e
> +                       MX93_PAD_SD2_DATA0__GPIO3_IO03          0x51e
> +                       MX93_PAD_SD2_DATA1__GPIO3_IO04          0x51e
> +                       MX93_PAD_SD2_DATA2__GPIO3_IO05          0x51e
> +                       MX93_PAD_SD2_DATA3__GPIO3_IO06          0x51e
> +                       MX93_PAD_SD2_VSELECT__GPIO3_IO19        0x51e
> +               >;
> +       };
> +
> +       pinctrl_wdog: wdoggrp {
> +               fsl,pins = <
> +                       MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY       0x31e
> +               >;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index bd14ba28690c081817111aaabef12fb56a7c56a4..f2a31a0eacabff07532aee989eebd75a0c3e22e0 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -1,71 +1,14 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
>  /dts-v1/;
>
> -#include <dt-bindings/usb/pd.h>
>  #include "imx93.dtsi"
> +#include "imx93-11x11-frdm-common.dtsi"
>
>  / {
>         compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
>         model = "NXP i.MX93 11X11 FRDM board";
>
> -       aliases {
> -               can0 = &flexcan2;
> -               ethernet0 = &fec;
> -               ethernet1 = &eqos;
> -               i2c0 = &lpi2c1;
> -               i2c1 = &lpi2c2;
> -               i2c2 = &lpi2c3;
> -               mmc0 = &usdhc1; /* EMMC */
> -               mmc1 = &usdhc2; /* uSD */
> -               rtc0 = &pcf2131;
> -               serial0 = &lpuart1;
> -               serial4 = &lpuart5;
> -       };
> -
> -       chosen {
> -               stdout-path = &lpuart1;
> -       };
> -
> -       flexcan2_phy: can-phy {
> -               compatible = "nxp,tja1051";
> -               #phy-cells = <0>;
> -               max-bitrate = <5000000>;
> -               silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
> -       };
> -
> -       gpio-keys {
> -               compatible = "gpio-keys";
> -
> -               button-k2 {
> -                       label = "Button K2";
> -                       linux,code = <BTN_1>;
> -                       gpios = <&pcal6524 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -                       interrupt-parent = <&pcal6524>;
> -                       interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> -               };
> -
> -               button-k3 {
> -                       label = "Button K3";
> -                       linux,code = <BTN_2>;
> -                       gpios = <&pcal6524 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> -                       interrupt-parent = <&pcal6524>;
> -                       interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> -               };
> -       };
> -
> -       reg_usdhc2_vmmc: regulator-usdhc2 {
> -               compatible = "regulator-fixed";
> -               off-on-delay-us = <12000>;
> -               pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> -               pinctrl-names = "default";
> -               regulator-min-microvolt = <3300000>;
> -               regulator-max-microvolt = <3300000>;
> -               regulator-name = "VSD_3V3";
> -               vin-supply = <&buck4>;
> -               gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> -               enable-active-high;
> -       };
> -
>         reg_usdhc3_vmmc: regulator-usdhc3 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "VPCIe_3V3";
> @@ -76,51 +19,6 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
>                 enable-active-high;
>         };
>
> -       reserved-memory {
> -               ranges;
> -               #address-cells = <2>;
> -               #size-cells = <2>;
> -
> -               linux,cma {
> -                       compatible = "shared-dma-pool";
> -                       alloc-ranges = <0 0x80000000 0 0x30000000>;
> -                       reusable;
> -                       size = <0 0x10000000>;
> -                       linux,cma-default;
> -               };
> -
> -               rsc_table: rsc-table@2021e000 {
> -                       reg = <0 0x2021e000 0 0x1000>;
> -                       no-map;
> -               };
> -
> -               vdev0vring0: vdev0vring0@a4000000 {
> -                       reg = <0 0xa4000000 0 0x8000>;
> -                       no-map;
> -               };
> -
> -               vdev0vring1: vdev0vring1@a4008000 {
> -                       reg = <0 0xa4008000 0 0x8000>;
> -                       no-map;
> -               };
> -
> -               vdev1vring0: vdev1vring0@a4010000 {
> -                       reg = <0 0xa4010000 0 0x8000>;
> -                       no-map;
> -               };
> -
> -               vdev1vring1: vdev1vring1@a4018000 {
> -                       reg = <0 0xa4018000 0 0x8000>;
> -                       no-map;
> -               };
> -
> -               vdevbuffer: vdevbuffer@a4020000 {
> -                       compatible = "shared-dma-pool";
> -                       reg = <0 0xa4020000 0 0x100000>;
> -                       no-map;
> -               };
> -       };
> -
>         sound-mqs {
>                 compatible = "fsl,imx-audio-mqs";
>                 model = "mqs-audio";
> @@ -134,269 +32,6 @@ usdhc3_pwrseq: mmc-pwrseq {
>         };
>  };
>
> -&adc1 {
> -       vref-supply = <&buck5>;
> -       status = "okay";
> -};
> -
> -&mu1 {
> -       status = "okay";
> -};
> -
> -&cm33 {
> -       mboxes = <&mu1 0 1>,
> -                <&mu1 1 1>,
> -                <&mu1 3 1>;
> -       mbox-names = "tx", "rx", "rxdb";
> -       memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -                       <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> -       status = "okay";
> -};
> -
> -&eqos {
> -       pinctrl-names = "default", "sleep";
> -       pinctrl-0 = <&pinctrl_eqos>;
> -       pinctrl-1 = <&pinctrl_eqos_sleep>;
> -       phy-handle = <&ethphy1>;
> -       phy-mode = "rgmii-id";
> -       status = "okay";
> -
> -       mdio {
> -               compatible = "snps,dwmac-mdio";
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               clock-frequency = <5000000>;
> -
> -               ethphy1: ethernet-phy@1 {
> -                       reg = <1>;
> -                       reset-assert-us = <10000>;
> -                       reset-deassert-us = <80000>;
> -                       reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> -                       realtek,clkout-disable;
> -               };
> -       };
> -};
> -
> -&fec {
> -       pinctrl-names = "default", "sleep";
> -       pinctrl-0 = <&pinctrl_fec>;
> -       pinctrl-1 = <&pinctrl_fec_sleep>;
> -       phy-mode = "rgmii-id";
> -       phy-handle = <&ethphy2>;
> -       fsl,magic-packet;
> -       status = "okay";
> -
> -       mdio {
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -               clock-frequency = <5000000>;
> -
> -               ethphy2: ethernet-phy@2 {
> -                       reg = <2>;
> -                       reset-assert-us = <10000>;
> -                       reset-deassert-us = <80000>;
> -                       reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> -                       realtek,clkout-disable;
> -               };
> -       };
> -};
> -
> -&flexcan2 {
> -       phys = <&flexcan2_phy>;
> -       pinctrl-0 = <&pinctrl_flexcan2>;
> -       pinctrl-1 = <&pinctrl_flexcan2_sleep>;
> -       pinctrl-names = "default", "sleep";
> -       status = "okay";
> -};
> -
> -&lpi2c1 {
> -       clock-frequency = <400000>;
> -       pinctrl-0 = <&pinctrl_lpi2c1>;
> -       pinctrl-names = "default";
> -       status = "okay";
> -
> -       pcal6408: gpio@20 {
> -               compatible = "nxp,pcal6408";
> -               reg = <0x20>;
> -               #gpio-cells = <2>;
> -               gpio-controller;
> -               reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
> -       };
> -};
> -
> -&lpi2c2 {
> -       clock-frequency = <400000>;
> -       pinctrl-0 = <&pinctrl_lpi2c2>;
> -       pinctrl-names = "default";
> -       status = "okay";
> -
> -       pcal6524: gpio@22 {
> -               compatible = "nxp,pcal6524";
> -               reg = <0x22>;
> -               #interrupt-cells = <2>;
> -               interrupt-controller;
> -               interrupt-parent = <&gpio3>;
> -               interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -               #gpio-cells = <2>;
> -               gpio-controller;
> -               pinctrl-0 = <&pinctrl_pcal6524>;
> -               pinctrl-names = "default";
> -               /* does not boot with supplier set, because it is the bucks interrupt parent */
> -               /* vcc-supply = <&buck4>; */
> -       };
> -
> -       pmic@25 {
> -               compatible = "nxp,pca9451a";
> -               reg = <0x25>;
> -               interrupt-parent = <&pcal6524>;
> -               interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> -
> -               regulators {
> -
> -                       buck1: BUCK1 {
> -                               regulator-name = "VDD_SOC_0V8";
> -                               regulator-min-microvolt = <610000>;
> -                               regulator-max-microvolt = <950000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                               regulator-ramp-delay = <3125>;
> -                       };
> -
> -                       buck2: BUCK2 {
> -                               regulator-name = "LPD4_x_VDDQ_0V6";
> -                               regulator-min-microvolt = <600000>;
> -                               regulator-max-microvolt = <670000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                               regulator-ramp-delay = <3125>;
> -                       };
> -
> -                       buck4: BUCK4 {
> -                               regulator-name = "VDD_3V3";
> -                               regulator-min-microvolt = <3300000>;
> -                               regulator-max-microvolt = <3300000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       buck5: BUCK5 {
> -                               regulator-name = "VDD_1V8";
> -                               regulator-min-microvolt = <1800000>;
> -                               regulator-max-microvolt = <1800000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       buck6: BUCK6 {
> -                               regulator-name = "LPD4_x_VDD2_1V1";
> -                               regulator-min-microvolt = <1060000>;
> -                               regulator-max-microvolt = <1140000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       ldo1: LDO1 {
> -                               regulator-name = "NVCC_BBSM_1V8";
> -                               regulator-min-microvolt = <1620000>;
> -                               regulator-max-microvolt = <1980000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       ldo4: LDO4 {
> -                               regulator-name = "VDD_ANA_0V8";
> -                               regulator-min-microvolt = <800000>;
> -                               regulator-max-microvolt = <840000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       ldo5: LDO5 {
> -                               regulator-name = "NVCC_SD";
> -                               regulator-min-microvolt = <1800000>;
> -                               regulator-max-microvolt = <3300000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -               };
> -       };
> -
> -       eeprom: eeprom@50 {
> -               compatible = "atmel,24c256";
> -               reg = <0x50>;
> -               pagesize = <64>;
> -               vcc-supply = <&buck4>;
> -       };
> -};
> -
> -&lpi2c3 {
> -       clock-frequency = <400000>;
> -       pinctrl-0 = <&pinctrl_lpi2c3>;
> -       pinctrl-names = "default";
> -       status = "okay";
> -
> -       ptn5110: tcpc@50 {
> -               compatible = "nxp,ptn5110", "tcpci";
> -               reg = <0x50>;
> -               interrupt-parent = <&gpio3>;
> -               interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -               typec1_con: connector {
> -                       compatible = "usb-c-connector";
> -                       data-role = "dual";
> -                       label = "USB-C";
> -                       op-sink-microwatt = <15000000>;
> -                       power-role = "dual";
> -                       self-powered;
> -                       sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -                                       PDO_VAR(5000, 20000, 3000)>;
> -                       source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -                       try-power-role = "sink";
> -
> -                       ports {
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -
> -                               port@0 {
> -                                       reg = <0>;
> -
> -                                       typec1_dr_sw: endpoint {
> -                                               remote-endpoint = <&usb1_drd_sw>;
> -                                       };
> -                               };
> -                       };
> -               };
> -       };
> -
> -       pcf2131: rtc@53 {
> -               compatible = "nxp,pcf2131";
> -               reg = <0x53>;
> -               interrupt-parent = <&pcal6524>;
> -               interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> -       };
> -};
> -
> -&lpuart1 { /* console */
> -       pinctrl-0 = <&pinctrl_uart1>;
> -       pinctrl-names = "default";
> -       status = "okay";
> -};
> -
> -&lpuart5 {
> -       pinctrl-0 = <&pinctrl_uart5>;
> -       pinctrl-names = "default";
> -       status = "okay";
> -
> -       uart-has-rtscts;
> -
> -       bluetooth {
> -               compatible = "nxp,88w8987-bt";
> -               device-wakeup-gpios = <&pcal6408 3 GPIO_ACTIVE_HIGH>;
> -               reset-gpios = <&pcal6524 19 GPIO_ACTIVE_LOW>;
> -               vcc-supply = <&reg_usdhc3_vmmc>;
> -       };
> -};
> -
>  &mqs1 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_mqs1>;
> @@ -418,57 +53,6 @@ &sai1 {
>         status = "okay";
>  };
>
> -&usbotg1 {
> -       adp-disable;
> -       disable-over-current;
> -       dr_mode = "otg";
> -       hnp-disable;
> -       srp-disable;
> -       usb-role-switch;
> -       samsung,picophy-dc-vol-level-adjust = <7>;
> -       samsung,picophy-pre-emp-curr-control = <3>;
> -       status = "okay";
> -
> -       port {
> -               usb1_drd_sw: endpoint {
> -                       remote-endpoint = <&typec1_dr_sw>;
> -               };
> -       };
> -};
> -
> -&usbotg2 {
> -       disable-over-current;
> -       dr_mode = "host";
> -       samsung,picophy-dc-vol-level-adjust = <7>;
> -       samsung,picophy-pre-emp-curr-control = <3>;
> -       status = "okay";
> -};
> -
> -&usdhc1 {
> -       bus-width = <8>;
> -       non-removable;
> -       pinctrl-0 = <&pinctrl_usdhc1>;
> -       pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> -       pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> -       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -       vmmc-supply = <&buck4>;
> -       status = "okay";
> -};
> -
> -&usdhc2 {
> -       bus-width = <4>;
> -       cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> -       no-mmc;
> -       no-sdio;
> -       pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> -       pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> -       pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> -       pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> -       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -       vmmc-supply = <&reg_usdhc2_vmmc>;
> -       status = "okay";
> -};
> -
>  &usdhc3 {
>         bus-width = <4>;
>         keep-power-in-suspend;
> @@ -483,126 +67,8 @@ &usdhc3 {
>         status = "okay";
>  };
>
> -&wdog3 {
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_wdog>;
> -       fsl,ext-reset-output;
> -       status = "okay";
> -};
>
>  &iomuxc {
> -
> -       pinctrl_eqos: eqosgrp {
> -               fsl,pins = <
> -                       MX93_PAD_ENET1_MDC__ENET_QOS_MDC                        0x57e
> -                       MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> -                       MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> -                       MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> -                       MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> -                       MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> -                       MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK  0x58e
> -                       MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> -                       MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> -                       MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1                  0x57e
> -                       MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> -                       MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> -                       MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x58e
> -                       MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> -               >;
> -       };
> -
> -       pinctrl_eqos_sleep: eqossleepgrp {
> -               fsl,pins = <
> -                       MX93_PAD_ENET1_MDC__GPIO4_IO00                  0x31e
> -                       MX93_PAD_ENET1_MDIO__GPIO4_IO01                 0x31e
> -                       MX93_PAD_ENET1_RD0__GPIO4_IO10                  0x31e
> -                       MX93_PAD_ENET1_RD1__GPIO4_IO11                  0x31e
> -                       MX93_PAD_ENET1_RD2__GPIO4_IO12                  0x31e
> -                       MX93_PAD_ENET1_RD3__GPIO4_IO13                  0x31e
> -                       MX93_PAD_ENET1_RXC__GPIO4_IO09                  0x31e
> -                       MX93_PAD_ENET1_RX_CTL__GPIO4_IO08               0x31e
> -                       MX93_PAD_ENET1_TD0__GPIO4_IO05                  0x31e
> -                       MX93_PAD_ENET1_TD1__GPIO4_IO04                  0x31e
> -                       MX93_PAD_ENET1_TD2__GPIO4_IO03                  0x31e
> -                       MX93_PAD_ENET1_TD3__GPIO4_IO02                  0x31e
> -                       MX93_PAD_ENET1_TXC__GPIO4_IO07                  0x31e
> -                       MX93_PAD_ENET1_TX_CTL__GPIO4_IO06               0x31e
> -               >;
> -       };
> -
> -       pinctrl_fec: fecgrp {
> -               fsl,pins = <
> -                       MX93_PAD_ENET2_MDC__ENET1_MDC                   0x57e
> -                       MX93_PAD_ENET2_MDIO__ENET1_MDIO                 0x57e
> -                       MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0             0x57e
> -                       MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1             0x57e
> -                       MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2             0x57e
> -                       MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3             0x57e
> -                       MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC             0x58e
> -                       MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL       0x57e
> -                       MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0             0x57e
> -                       MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1             0x57e
> -                       MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2             0x57e
> -                       MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3             0x57e
> -                       MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC             0x58e
> -                       MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL       0x57e
> -               >;
> -       };
> -
> -       pinctrl_fec_sleep: fecsleepgrp {
> -               fsl,pins = <
> -                       MX93_PAD_ENET2_MDC__GPIO4_IO14                  0x51e
> -                       MX93_PAD_ENET2_MDIO__GPIO4_IO15                 0x51e
> -                       MX93_PAD_ENET2_RD0__GPIO4_IO24                  0x51e
> -                       MX93_PAD_ENET2_RD1__GPIO4_IO25                  0x51e
> -                       MX93_PAD_ENET2_RD2__GPIO4_IO26                  0x51e
> -                       MX93_PAD_ENET2_RD3__GPIO4_IO27                  0x51e
> -                       MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> -                       MX93_PAD_ENET2_RX_CTL__GPIO4_IO22               0x51e
> -                       MX93_PAD_ENET2_TD0__GPIO4_IO19                  0x51e
> -                       MX93_PAD_ENET2_TD1__GPIO4_IO18                  0x51e
> -                       MX93_PAD_ENET2_TD2__GPIO4_IO17                  0x51e
> -                       MX93_PAD_ENET2_TD3__GPIO4_IO16                  0x51e
> -                       MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> -                       MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> -               >;
> -       };
> -
> -       pinctrl_flexcan2: flexcan2grp {
> -               fsl,pins = <
> -                       MX93_PAD_GPIO_IO25__CAN2_TX                     0x139e
> -                       MX93_PAD_GPIO_IO27__CAN2_RX                     0x139e
> -               >;
> -       };
> -
> -       pinctrl_flexcan2_sleep: flexcan2sleepgrp {
> -               fsl,pins = <
> -                       MX93_PAD_GPIO_IO25__GPIO2_IO25                  0x31e
> -                       MX93_PAD_GPIO_IO27__GPIO2_IO27                  0x31e
> -               >;
> -       };
> -
> -       pinctrl_lpi2c1: lpi2c1grp {
> -               fsl,pins = <
> -                       MX93_PAD_I2C1_SCL__LPI2C1_SCL                   0x40000b9e
> -                       MX93_PAD_I2C1_SDA__LPI2C1_SDA                   0x40000b9e
> -               >;
> -       };
> -
> -       pinctrl_lpi2c2: lpi2c2grp {
> -               fsl,pins = <
> -                       MX93_PAD_I2C2_SCL__LPI2C2_SCL                   0x40000b9e
> -                       MX93_PAD_I2C2_SDA__LPI2C2_SDA                   0x40000b9e
> -               >;
> -       };
> -
> -       pinctrl_lpi2c3: lpi2c3grp {
> -               fsl,pins = <
> -                       MX93_PAD_GPIO_IO28__LPI2C3_SDA                  0x40000b9e
> -                       MX93_PAD_GPIO_IO29__LPI2C3_SCL                  0x40000b9e
> -               >;
> -       };
> -
>         pinctrl_mqs1: mqs1grp {
>                 fsl,pins = <
>                         MX93_PAD_PDM_CLK__MQS1_LEFT             0x31e
> @@ -610,149 +76,7 @@ MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT       0x31e
>                 >;
>         };
>
> -       pinctrl_pcal6524: pcal6524grp {
> -               fsl,pins = <
> -                       MX93_PAD_CCM_CLKO2__GPIO3_IO27                  0x31e
> -               >;
> -       };
> -
> -       pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_RESET_B__GPIO3_IO07                0x31e
> -               >;
> -       };
> -
> -       pinctrl_uart1: uart1grp {
> -               fsl,pins = <
> -                       MX93_PAD_UART1_RXD__LPUART1_RX                  0x31e
> -                       MX93_PAD_UART1_TXD__LPUART1_TX                  0x31e
> -               >;
> -       };
> -
> -       pinctrl_uart5: uart5grp {
> -               fsl,pins = <
> -                       MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX           0x31e
> -                       MX93_PAD_DAP_TDI__LPUART5_RX                    0x31e
> -                       MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B           0x31e
> -                       MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B          0x31e
> -               >;
> -       };
> -
> -       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc1: usdhc1grp {
> -               fsl,pins = <
> -                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x1582
> -                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x40001382
> -                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x40001382
> -                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x40001382
> -                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x40001382
> -                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x40001382
> -                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x40001382
> -                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x40001382
> -                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x40001382
> -                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x40001382
> -                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x1582
> -               >;
> -       };
> -
> -       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x158e
> -                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x4000138e
> -                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x4000138e
> -                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x4000138e
> -                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x4000138e
> -                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x4000138e
> -                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x4000138e
> -                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x4000138e
> -                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x4000138e
> -                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x4000138e
> -                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x158e
> -               >;
> -       };
> -
> -       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD1_CLK__USDHC1_CLK            0x15fe
> -                       MX93_PAD_SD1_CMD__USDHC1_CMD            0x400013fe
> -                       MX93_PAD_SD1_DATA0__USDHC1_DATA0        0x400013fe
> -                       MX93_PAD_SD1_DATA1__USDHC1_DATA1        0x400013fe
> -                       MX93_PAD_SD1_DATA2__USDHC1_DATA2        0x400013fe
> -                       MX93_PAD_SD1_DATA3__USDHC1_DATA3        0x400013fe
> -                       MX93_PAD_SD1_DATA4__USDHC1_DATA4        0x400013fe
> -                       MX93_PAD_SD1_DATA5__USDHC1_DATA5        0x400013fe
> -                       MX93_PAD_SD1_DATA6__USDHC1_DATA6        0x400013fe
> -                       MX93_PAD_SD1_DATA7__USDHC1_DATA7        0x400013fe
> -                       MX93_PAD_SD1_STROBE__USDHC1_STROBE      0x15fe
> -               >;
> -       };
> -
> -       pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CD_B__GPIO3_IO00           0x31e
> -               >;
> -       };
> -
> -       pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CD_B__GPIO3_IO00           0x51e
> -               >;
> -       };
> -
> -       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc2: usdhc2grp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x1582
> -                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x40001382
> -                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x40001382
> -                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x40001382
> -                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x40001382
> -                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x40001382
> -                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> -               >;
> -       };
> -
>         /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x158e
> -                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x4000138e
> -                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x4000138e
> -                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x4000138e
> -                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x4000138e
> -                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x4000138e
> -                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> -               >;
> -       };
> -
> -       /* need to config the SION for data and cmd pad, refer to ERR052021 */
> -       pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CLK__USDHC2_CLK            0x15fe
> -                       MX93_PAD_SD2_CMD__USDHC2_CMD            0x400013fe
> -                       MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x400013fe
> -                       MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x400013fe
> -                       MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x400013fe
> -                       MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x400013fe
> -                       MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> -               >;
> -       };
> -
> -       pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
> -               fsl,pins = <
> -                       MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> -                       MX93_PAD_SD2_CMD__GPIO3_IO02            0x51e
> -                       MX93_PAD_SD2_DATA0__GPIO3_IO03          0x51e
> -                       MX93_PAD_SD2_DATA1__GPIO3_IO04          0x51e
> -                       MX93_PAD_SD2_DATA2__GPIO3_IO05          0x51e
> -                       MX93_PAD_SD2_DATA3__GPIO3_IO06          0x51e
> -                       MX93_PAD_SD2_VSELECT__GPIO3_IO19        0x51e
> -               >;
> -       };
> -
> -               /* need to config the SION for data and cmd pad, refer to ERR052021 */
>         pinctrl_usdhc3: usdhc3grp {
>                 fsl,pins = <
>                         MX93_PAD_SD3_CLK__USDHC3_CLK            0x1582
> @@ -798,10 +122,4 @@ MX93_PAD_SD3_DATA2__GPIO3_IO24             0x31e
>                         MX93_PAD_SD3_DATA3__GPIO3_IO25          0x31e
>                 >;
>         };
> -
> -       pinctrl_wdog: wdoggrp {
> -               fsl,pins = <
> -                       MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY       0x31e
> -               >;
> -       };
>  };
>
> --
> 2.34.1
>
>
