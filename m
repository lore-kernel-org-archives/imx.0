Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BED2D3217
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557813; cv=fail; b=R6IeO1sYZx3+uWFhSMKkM5/vtnVZ9HXUfLFDl9rLwMxF8bdLPwSEwt8zKjUYXwfJHRtoKOSwIL6rHxRf6JfBkX6W1DYxWzV4YOfDJOodPV1GssW+6mhyODb6Vl7XznodGSfguToErg7aTzU3C2cEdj1kwBuQIM7WmR2oD/GQDcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557813; c=relaxed/simple;
	bh=RdzXaRcmhd74M1FDzHTWcDdtpKQPqoEFZQo4SjbgctI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E18Qt7TG0F1W+Yj2fXPMBUchJfsupHKJXNMuxz5SYu2NtHoWJgICMVlaMwZ8KtTvf7dxveWrMYsMdBEpIdAOw/XlS6GOd/OsiUD7/Fu9OFrXojntvbIqq0zNEtgsq5MUvoRdqyJDp1q6dRaGDh4K0YXYRMQSoCfhwtTxG8dnK10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bnmpcsxM; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bnmpcsxM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNrwO0QQLMMJYWCiHwr4ketGLNbxRQZrVHl+4NIFRLER1KNjmoSO0RNKPFQLGbuKZNZQOhZt6R3ROaOoGOSO90ZUkcD9akJTJFv2SbuxBIQRtfHVnKczzif5zD7XkKmFvw8hiWc+/nSa7iqt5c78rNnXBZV70SnzXFNAadeMq0L2X+zcpted+K3El3Pz8YBnkyFUkINGAjcbz6LrVn6yc5WFGJk+ZYt4k9OyMqEj53hf8MYPUHMBFNrvLCeZEcP1Wj3V1wGVnM86TJkVX/VUAlEGUo0g9XfZjZLZpkFzY7o8PyGKZPIPbVahm+KwCY83JT9+SUn36r5SeW1I5QoZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5yr7Z7q37hAl98M6BQ8lJYNXkYBcg0IHUuSDwCQYT8=;
 b=kNSCpVNnAZsUYZRN1qpSK7aB5ZCoFBCMbcJAooZFFLOHFlQASB4cy8pkFHi/E+ngyap/7I4eM0UdJ1A0SXcL5ZIOHvURZJFiI8w6MMdR6L+2pdTDzJwG3DP19HYaWVfyuVvBHIcAxT74ekFCxKuPbIjDlsEhvOJ+LYqGtge547aEIRomCIJXjA9wAh91wEDyVipnB2VR4Avch1+3CJFD+zQjkW9r+9jk0bjn4U68uK0b/8UKSMMhAL/OJ6nUHe7IMKSCqZ39uYKwYP9GVVU/87vcHw444JR3YxMooExMTwSTz+Z/LxlrcAVng9pZuL18fp3ZAYgyiPlquU9rf5rhGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5yr7Z7q37hAl98M6BQ8lJYNXkYBcg0IHUuSDwCQYT8=;
 b=bnmpcsxMFGf1B22xP8KuWR/ZmMNON9oV9TWlfV2g/kZoKzdl4VFz5p+02rHFsJKU4B9T3/KBmA0ZtvvC301HTcT8PsmfQ8uldpSm2DzexlXdzogY7MOKKERXhsIIePEg/m9M2CiaFryjC2lamDcuHC6nlq1KZ86OQfBktQcsH/u0/1hSIM68osHEXBWpadSad7XQS9K+ZAwCphmXcTgxlf4zmGWnv79ZOXaiT0DlHg5LDvVUABtDbr4+XCaK8KzeQ6CpurME3uR42+Ip8/wK1Q9rHPE+EefpoLxYxQZpHOehgOeV0DLLZ1HYQkL3PCFyqvxkWz648nWYRdFWyMOCRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10692.eurprd04.prod.outlook.com (2603:10a6:800:278::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:43:27 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:43:27 +0000
Date: Fri, 12 Dec 2025 11:43:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx91: Add tempsensor node
Message-ID: <aTxGJfQDQVXb+Nd9@lizhi-Precision-Tower-5810>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
 <20251212-imx91-dts-v1-1-2bb3c13762dd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91-dts-v1-1-2bb3c13762dd@nxp.com>
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10692:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf04bac-6d5a-4c8c-decf-08de399d92ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QyJYh8JE/NsNSfQfS40mPoguq73Ym1gVNd8mcObHuYOX4Jzz/xZjJ3RIrNgn?=
 =?us-ascii?Q?s10yBCY6VZO2NYKplUz4I1EmTDnCOMBP4pw0vl1FDBXPj25GjegvJ+eZ8ObC?=
 =?us-ascii?Q?8h2etPY9CIJzeeevcyOWDWCj03iWDSs9d7w0k4NpGA+Oxmjo6Uxpck1EX7py?=
 =?us-ascii?Q?tLsjM7txWRex9+rmInWflQHkS6l0Y1VhPgTiUUjOPOD32wj9byPA6qdSJdu3?=
 =?us-ascii?Q?aysXUc3hicc3ypVMF6cIYUPSZOwgmNicffSZjmROYBxTqUO1uFzAN06oavA4?=
 =?us-ascii?Q?1I4DqlMkjha9sHSIeYXbAuPTRt7lwLG4i7cYYDNlPdtkIC/oS4GjblhTQonh?=
 =?us-ascii?Q?HTMjQTyDYEioFNdTJ3++B/E06hPwRRthMQcl/jQ+DS5eRTPA/Yq4RbACydkd?=
 =?us-ascii?Q?Hx3Y6zrihgeA9VAi+cvtdmZh2Nk6b+P1OQNND2hpKlwobUVos6j8T7zdd8uR?=
 =?us-ascii?Q?7ksHHB/Rjjpcd1jJavdJjErp0uSf7ETPYDxqswPxHaUNx78jBOu+46xS3CGa?=
 =?us-ascii?Q?gVdT0ZaD5No4FT0YM9qcjDHVxTCkgAU2rcbi4ZzqFVzl750QT1I+AoAAyQaR?=
 =?us-ascii?Q?jyS3HNFDbJN/VMMJabiuXSoB3CtykuaWbdgZbaS06RRxoaMRF7TFwybKEmQL?=
 =?us-ascii?Q?j6OVG8TP1sOBJf9r+5zgsMlq08/B1YenNuy1NLfDuWpd2CNRZLhEtQgDwpuK?=
 =?us-ascii?Q?LxkhXB3sk79L3b7BYNe/OrmRQAUyyFU29juMJixoTt7HDTYqnhf2VobGgMgU?=
 =?us-ascii?Q?memcPtxslmBGO11+0fqKK5LFh3iZPN4GnBgGuZckTGBV9Bn5Exyh4jMVbzUT?=
 =?us-ascii?Q?O0pNg8WHD3bb/Yk2IipQ6ZUexOViIGFZqvICgwwwdbpFBm4IvWkYFAnGuXRk?=
 =?us-ascii?Q?S8jsoSuGLDZgYHc0qC8+hy8XOLhZtxteCJ0K3rKCx4rlYTuPb/8EocBWPjHI?=
 =?us-ascii?Q?w+MLpW/1cjhkbUfp6pRMV89hf5iiobPuDTahLWM/CXjP+4BoZTOc7yMIA1Bh?=
 =?us-ascii?Q?2Qfifka5OTsTFNHbmsuXCY75I6cavIilsxAf95M+Dfr1b3IOsNDb6bogZPKt?=
 =?us-ascii?Q?SkPWnMWgQLt4gjyUhdMD0bD1JlZGpPuNfS0n3sRq7qIpJQwBezMOn0mpawtb?=
 =?us-ascii?Q?sytzGq0rjvtHUPdOylxPl1NfuJW6/FvWqya0DV0bTHpvkCk58uuVEu2fLk6H?=
 =?us-ascii?Q?4HjAh5R+MGoTIBlEZT7FiUR1daAXMREo0EgSFLHUikG3wFvWl4ujbYL9v+Uu?=
 =?us-ascii?Q?0Z1EENmhXyj8Ai7uI7JhRRIE6lG7XIJ+2qxxU5TmT6WeHRIZ+3sCZcSIAYtv?=
 =?us-ascii?Q?CG1PgS9CoM3xWIapO+c7i6o4XD0ydNtTiHuP6iD8zZ6YNPyvtCpegki9zRVS?=
 =?us-ascii?Q?7ro/6zP1GSrL4dw8PE5YgYKSKszAiogFRDvhwTnTevq5PA3GzoeZtL25PZVS?=
 =?us-ascii?Q?kIWYYtnjE9jAmwzX+1RNVW4kVbM0mmHAEAHiIsTnDP+uWCi7LRKr/dp05Flt?=
 =?us-ascii?Q?HqyJBJfuYfHVYcpNsoj85t3RfggCyWZl26/e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q41oZ7sR+Ll5Fu8JfXptOba9cELzeGNpR9sdto9ILfK+8YaGVGhQcaIriO/U?=
 =?us-ascii?Q?fllZLS/7mz7dYs7+u4oTcYrq07Eve7/gpOyBX36YHvCehKk18ZYW5OVctZxE?=
 =?us-ascii?Q?v8Aw2+6cf1k8WT4yVii5WBKIQiliLPwqcRl6uLjnT3/y9HxU1zfAu6nV3dLV?=
 =?us-ascii?Q?wGOfEKrWI2W0K87u9TZo3gMdjffKBPiTJdwg7PY+SM/tdAYER7jFRi9KP6KM?=
 =?us-ascii?Q?a1CE/9SteHbpYGQvnQrOlxX1f2d4qHLqyDa7i5HwCPNY47Bmqxcp17JlyAxo?=
 =?us-ascii?Q?kxcG8M1NJculPPBwOrAyECfgtgUiHhKGpy3/xgn1KkjEGmom71Gzz7ui5eN3?=
 =?us-ascii?Q?WnT8syaAK8+fwZKYUeYAk0GpomLKixg6MlG8xTWJxfKPLEg1FVaTHnAYnvg9?=
 =?us-ascii?Q?otwsudFRUraLf9s1a4v3/ajF6EaC3xkgwCwsFutvHn+nE+F2PYNJUXyGUkbD?=
 =?us-ascii?Q?Mk1YdKDvQFdEsXJUh7xlT5fck7x3rzd984sYyJr5VAErWXkPxEG4OptjhSD+?=
 =?us-ascii?Q?HnpFDqYcKJDay6H8XPzM1crYcl+jP8MgctHOOpxWYb3VEjeRtf3OLp8eMhpC?=
 =?us-ascii?Q?LaaHXVJjdpAzDel+CUk8y+lY2gJm7gKlZwGWEHvfSMbMeeSpSDb2lHXkc+Lr?=
 =?us-ascii?Q?FEMcM8jFo5j0MI84eNKDvSINXaDvqJcIPWK27WOy537DHr+KP+3B2ysGbnyR?=
 =?us-ascii?Q?2lGnBtWoB4Hpt3BGi5LsaWb7wwqZh6+YUX3qmfEcaOmQXyawM10YOIOxjiqo?=
 =?us-ascii?Q?D8tv3lXye/TvJRxGddOvZs0+76bPDD4CN2lWLIyW2AABu1VTV2YmckhAoWZF?=
 =?us-ascii?Q?C1G77B3OjEXHtHgjfXOiSD0altgqY36umdol4lkf1hNK25QhP4AN4MlJ1E9+?=
 =?us-ascii?Q?xTa0scCdIUb6v5CdoyQbNdB3BBw//opdCNq05QZuhPeG373govpdip8TL/6U?=
 =?us-ascii?Q?O1GwkI6rkkN2GDITCVIfKn9yBqFiB28q/u9E8NDx/C5jZ0U97jCQMeCfG1+w?=
 =?us-ascii?Q?BpHt+LnpVMckgccDjnbiqfLbCUDULlOnNwH076QeLomRUSzSWwyIwt4CkWJq?=
 =?us-ascii?Q?Ohp1ggmGT+9cTPSf5U5qh7myUoAK7hweam1lobzXm1IsCKghZKvW3jTlqBPg?=
 =?us-ascii?Q?U57eszE/1fPIgVHziiCqSg8KiligEsRalXxMzvwkl8fzDeZH05aMsYODgQLH?=
 =?us-ascii?Q?gbujKA/LgtcPiHU0CMS5GPV+Vdj0s9kFVwsM/36/L8zjhkRcdJ1i8y3QL3TG?=
 =?us-ascii?Q?Rg2QCQPH8ugcCsu0SL3T97SoiBqZVr6TVyd99AZlJ3RbAxnOj+e+0ZgEgkIX?=
 =?us-ascii?Q?hrJZ24T7aN/Yerh5mkJY+d4lnAbViYK5Obg6ZO3JeR+s4/7bJTiJnrVLuPhB?=
 =?us-ascii?Q?Wj7GRDRRUaZjAxkzFnzV4kMqGmXS2cgOXhJyM8PVUUUvJDRfdfiLF0f/kVmc?=
 =?us-ascii?Q?HBSzVY1i/BP1HGQPev7xOLF7p50tHns15dFrjHycwA/N6Gw2roHLbQ3bkmGz?=
 =?us-ascii?Q?TgH5bEJ4ykW3XaK33Cg/gukIOFyVdqUK3YGyYuAhSbK76Mm4R1z2NQ2r3aek?=
 =?us-ascii?Q?8pz6LwM0NVRPv6cpZzbzbJzf8VYiMt1LZVeaPLeO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf04bac-6d5a-4c8c-decf-08de399d92ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:43:27.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9EPyL2F8zFg4M17tMe758UtxlELvCp9E2YQa7NRRaQABYsk3vZs3/hhK7bU0O1HWCxiHpWklCOO6EaL6APaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10692

On Fri, Dec 12, 2025 at 05:16:07PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add tempsensor node and trim sub-nodes in ocotp.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

I posted it when upstream tmu driver

https://lore.kernel.org/imx/20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com/

Frank
>  arch/arm64/boot/dts/freescale/imx91.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> index 4d8300b2a7bca33bd0613db9e79d2fba6b40c052..c08db08ca9607b9780a77e215cdb5997e4daae4e 100644
> --- a/arch/arm64/boot/dts/freescale/imx91.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -6,6 +6,21 @@
>  #include "imx91-pinfunc.h"
>  #include "imx91_93_common.dtsi"
>
> +&aips1 {
> +	tempsense0: thermal-sensor@44482000 {
> +		compatible = "fsl,imx91-tmu";
> +		reg = <0x44482000 0x1000>;
> +		clocks = <&clk IMX93_CLK_TMC_GATE>;
> +		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "thr1", "thr2", "ready";
> +		#thermal-sensor-cells = <0>;
> +		nvmem-cells = <&tmu_trim1>, <&tmu_trim2>;
> +		nvmem-cell-names = "trim1", "trim2";
> +	};
> +};
> +
>  &clk {
>  	compatible = "fsl,imx91-ccm";
>  };
> @@ -69,3 +84,13 @@ &media_blk_ctrl {
>  	clock-names = "apb", "axi", "nic", "disp", "cam",
>  		      "lcdif", "isi", "csi";
>  };
> +
> +&ocotp {
> +	tmu_trim1: tmu-trim@a0 {
> +		reg = <0xa0 0x4>;
> +	};
> +
> +	tmu_trim2: tmu-trim@a4 {
> +		reg = <0xa4 0x4>;
> +	};
> +};
>
> --
> 2.37.1
>
