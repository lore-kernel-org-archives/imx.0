Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626C1E487
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 03:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770262346; cv=fail; b=gbzYf1hLhdmWwu2Y0H7rFZlAa4ftH30ze5zomUFJbpvIq73S81I+c0DwmojURCDhIyP3KCwfzhOhw3M0865hsM/27VeCJEgktBEAqIf7mqINkCJg7lLNGxrIJsHJKaTQMQ5iSNwih7XTNtVDJhASIcA/EiGUthFDAbpKuPA28oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770262346; c=relaxed/simple;
	bh=4DwOQunlshDeRBNrJ2+nEgjxyeCqQGH5/wf0aApDZGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nHnIKpobvM+UolF7BvC0OmWkXGr/ixgghkh7YDUdCq4dyDaT2Hl9CXN157YfjvZcOUO1sJdU6ftEp5JmKSzXTtVb4OJ89YnJ5Y7UXWo1GQ2BAGn0vmNVqV5jtx3Ki512SSC+JxceVw2Ha+Tgd43ximheC1bc7EDsmLV2Gzb5L/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F2T1ROS1; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F2T1ROS1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLyVYXb6xSLG7a4Mzaza+C3NpgPEYMQoea613xMeWA9fx49pYZHiGPrsMymxJu4WRYRU3s171sRY60Ew7s5w//rvctDpekYx00oLl9j1gV15oPUPbt7i04dRbL1vQiKeu/refJq+WhfMnDGKoKAp3jc9wHw+DGNNMS1Sk35t0DZkgOJ4q65cQBYGIkjbeEPunjyFhit6OPENmeQTk9IhVUCgkx5S4PRPFQpne7Lnao8wVNifWWoEYKA1uMfqrI+jVhxSRXholOtPejk9OyR0hWuq4dwtReUgcsvhcr08rnTliG43qjoMt1sZ1zuCmpj4dCgbSFid/t+JZ2xltgmN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdaYOK0H+T27bVbZWpC2kFPtVVh4VS1TDaRWZgLEBJ0=;
 b=xtMHimVygPYRIUZfPS5CDEKq/KMp8CzRxMpm6wYjtDuWVp83HBflBwHOwpqUmxby4YHl1fiDvnaKljkjHFRcnf7thFCN8aY9zwkrMF0YnOmHMAEephY8OI08J1e7lTKDguuSr0rc6OGNADicY4IPGuNFJ/81aaJKhiIQNVavmHjltqMz9omVxMLfcWh8NT1phS1VqwYhn2SkmKzlP7Y2hbyJquvd+lNL+uImdiqZ+ExcWzxBUREhXBM/bNEtfn33pDut8IYNL2U36rzDvh8iAo2aUK4MtqX/txhrodlHexQrET5jd8BQIxoX9CcEmRPCYubUjHuWc1wvxHK8mk7ICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdaYOK0H+T27bVbZWpC2kFPtVVh4VS1TDaRWZgLEBJ0=;
 b=F2T1ROS1vT7ZU7sdJmGbau+mt5BymXgcYHDY7r4c5nLHSH9nE+3cfGITN8F7lmuR7BHCt8COz5fM89TaCKKjbSC2YsL2cuz5/+ZLE9lYaNf8d/Qch7PpDD15FbeDtbQfY+DCm+nr5Qry6wIdgbDBtP37XfxlMYraeDQZAbYzfMK+es+DvUHiWV02qi8OqUE+6FGq7eWJwGLauKCdqJ8YPnPxSQeaGrwdhoxti+gpQBduuiFU/6HtG/B+/jcmZxvJeZefx3KcV+OmNlsvqgTszSEVpM1bE1Wf+IdMdHo3rVAKBSRy1eR7XfemNKHcna/HL9GzI5ppoBHQRvKgewg+kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 03:32:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 03:32:22 +0000
Date: Wed, 4 Feb 2026 22:32:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts
 support
Message-ID: <aYQPPv-J5qWDRSXd@lizhi-Precision-Tower-5810>
References: <20260204225020.2039367-1-tharvey@gateworks.com>
 <20260204225020.2039367-2-tharvey@gateworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204225020.2039367-2-tharvey@gateworks.com>
X-ClientProxiedBy: PH8PR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: e34df92f-f6d3-4ee3-2b76-08de64672c25
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?fLJM9p3NPu7yaua0BW01Vlp/R0UJIjr9HVivTZmFa6t8Vcc3jN3GrF1kDBk8?=
 =?us-ascii?Q?8gy6x9+9YIV4JtnVTrRQlgprbBbXdis6udy7fa5G38/3bdj2Oqjp691l/5n4?=
 =?us-ascii?Q?gXtfm44Bpfu9T9GT4FtvI4bdEbxquLAl/96A+3bLomKVfA6pWpagbvpfxguW?=
 =?us-ascii?Q?LpdOBhZpQB3/RvRqne57QMyrMxzbjZAD/fSspCBGEqgQh9MzM7+C7vYjCywz?=
 =?us-ascii?Q?sR6qIdXFVyNqxqCmhH/phR1azFJdAhm1uvXIWtreFOTSM1HJTmYIioob+nSg?=
 =?us-ascii?Q?65YNcii8HfCjGDeW0T26k8GwFW4+95N8EAUVKy9rqdUgNtNP0dmh5kBEtmG9?=
 =?us-ascii?Q?6g0xlaNFy/Z3K47h6Dp7rUrYuha6PLt+AUjuqJrBPtk2tqT72WSY8yxXMwxC?=
 =?us-ascii?Q?D/sWt6xbvEzumQCrL9A/MeUYmU0SNk9ZUr8kgR/yNcC2qWQ+hfP4nXVNRqHd?=
 =?us-ascii?Q?O1W1kSrUV5BOubYqXhceLSovQ3gouamlk8v3U6yngz1XEfkXwREwENXsJ6Es?=
 =?us-ascii?Q?mkthJiSTnGXlbqPWdKGfYl5U0bc7ffYdqNRDEbfLiS8oo60PCLrGjS8kYkBF?=
 =?us-ascii?Q?zAgs/ZPJa4hsGEdWkXAhE+4V9k+3GKsHOpW4ALzxmwy5ypQuXqHL31b9czxO?=
 =?us-ascii?Q?VfREybYkkv18xvSfXvrMkhaEA5HYatF6n6hxIYJITcpi8me6OrRlCDKFIUC2?=
 =?us-ascii?Q?IOTdw/NXda9ZQgcUD9tXSA6vO5mpYyLgp7SO+U0WCvZwB96R+A39+pPK8mwo?=
 =?us-ascii?Q?FMSicuO+PXwpAwFYt7udZ+lZ4PMWNubJOuV0IDfUrW1vWg/lSa7On31JLoVo?=
 =?us-ascii?Q?CzHrspNg6sXvrIFRl7+exdWygAAwnMVWz+tQ0Q/m9NGD+7TQJXPrK6jqcxWv?=
 =?us-ascii?Q?P6m4Gi8TfRu78ltk0ycjKtEnQB7RJyWIAg8HCp6SFHVtt97DCPMW9zteR/PT?=
 =?us-ascii?Q?bwKiFSOSXg8uG3j9RTldvvnuctgH6fzK2SAjM0wVBuEwreF1Bre2WHqu7/Gd?=
 =?us-ascii?Q?I5DCfUXMF38OA95Cqf32gLfkNBjL6z+kyCvfkSLmd+fzs/C1n48DSnlnfDmn?=
 =?us-ascii?Q?Pz1zXk+C2Zuw+/A+oW9eddduhIq77S1PxMdYqTF7dak0WEs9nJMk15lyD5Q6?=
 =?us-ascii?Q?I/UaBXeJ/XOgE9jdCOnsMs6ePTgl6CJgv0lF7qH+ALe6N0oiObJ6KfSy2I4r?=
 =?us-ascii?Q?uvyMGG6PJUtNJVYt8GiD3B+0/+ABl9LSnrAQNG0hRpFt6/KY+EO1DI7Gwu6P?=
 =?us-ascii?Q?bxnS8iGfOJjwGRDU8E+wTT+mvFp+l3fIxhn7JvdJiodjTjhTDy+JNkKcoDUB?=
 =?us-ascii?Q?ggJzDCKxozRqVgqFu/w4y/5f9EN4kpty3WC8A8xh97D4U1tStQW3Ij4G/fQo?=
 =?us-ascii?Q?xahvvriw8W5YqiRj5h36FtA9nHNNMvJEzZ8fVINcK/tQDytzegAIFGf86hXx?=
 =?us-ascii?Q?tY4shJRgnQx/U+uEXwDiJSCtQr58d1yzACVUDQ0A14i6uyGqJifyPkS3L1zv?=
 =?us-ascii?Q?vDxN11p4xTY+Ea7ulRMQgdjef7lHNSHoBPLMxXh67oXI7kmMSLF0RSJNBkqg?=
 =?us-ascii?Q?eJ+sz8JrVxIoVBqAutlcUc/+b9cC7hnjd2VtuKS41FrukJv6WhIWmNHVhApH?=
 =?us-ascii?Q?hpR+MOveCPdzRT31Xbvikdo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Wua7eiGGrIVqqb8YWomxBUXmSz+ScuI5slIIxF9b4SI6sPRtHPmWoy3ou/HU?=
 =?us-ascii?Q?+kfsJEAFmKmvvpuibUrrhcsQ/UJ4aAgu3vITQ0tLywxTRD6cqvRREWlTrscb?=
 =?us-ascii?Q?JYQpmhNBfj27acGENifb177y9aOku8Uzx69n36iAk5UW4NXIBdshCouT9MpE?=
 =?us-ascii?Q?xDU6gvoYo+HDaFiibh3/aRaMT5cDSZXWqO+PpoEcjhegivT2umYmqQJSgMNq?=
 =?us-ascii?Q?V3ntKIQSm2UstftFdMsViczHMT6XmffO9MLn9wffx9cnOuP0bfyh9HoYwcl3?=
 =?us-ascii?Q?vymAiCeZaTwXnDD9N2y5JPWAeFYdg92UOeJ5gEw+CicZqyVwqJBeOEGwgvN7?=
 =?us-ascii?Q?xn9oKTq42zrhvXU+fzwYYWMRYHLB1ZBCRBQCaXxDgc8dPJJf6VrsvZneaAVY?=
 =?us-ascii?Q?ghuFNBalkXuIcn9Duace2Whhk6kWOTPg1BuXga3dDcrhAqGA63c1CPPk9EN2?=
 =?us-ascii?Q?sRzoY8MeTTTlp2/qX/6glDXpwZ3c8qDrSNWGNFfwKdn9vJJf7Lh1E9je84vw?=
 =?us-ascii?Q?xe8mZgTriVQ6RXtUaaIwtu7I+5V/z8VybWB3VtIX3jUd4GLlV3yODTWx5uZW?=
 =?us-ascii?Q?/QvqrnNhAEZJgRYRIPaE4fejkiG6TrD5BLrvjVf6d3oOFmTZ+Do6wT5KhYEl?=
 =?us-ascii?Q?OFWqfAEWUsliuAb2jz1KJH75if91dHqjXJXNtCw1zfNfXiWn+lAszvuxjU61?=
 =?us-ascii?Q?PvynPr4xuDyiYZGYTTRlCDUoRWxbly7d7VZEEmnpt0QTQKVEC59On+hMgTt3?=
 =?us-ascii?Q?V+rVKy9F6V/EKnMaJr0KX2d7K8jHleJP++BHjGeCKkec99BI2lHLGJKrj6Cg?=
 =?us-ascii?Q?N6a34nQk3vCa50HX9mP25wiWfFGy0jWNtc0QBCAIr0Jm4Hd/eQGOuWEXqiv5?=
 =?us-ascii?Q?sZegPbESeltLG61UMCBkEQjM4KQet6vObOqYp3datWQ9Hys7CXyoO74aPbyY?=
 =?us-ascii?Q?Ib397jHWeCGyObmrmTxOpXOwbjPJvU+bd/Ii+OEscyHgGUhIgPpOSK8wCZIR?=
 =?us-ascii?Q?OGvR2gYgrr73R0+NWMmpMA2Q9B3Plk4f88cnPjAD5lNpuv2PEosD3D+NuplO?=
 =?us-ascii?Q?AZfvYlOXraTfk7Q0p7nSDmuJHxGzcuZtbZkUzbHQODXFbxX1rK2bnSSzdt5w?=
 =?us-ascii?Q?tRMAfHQHbzB97b4ylkyw9NxtSNjBN8HC5RcYtLKZ5/0OYHRryupI5PoNrJvC?=
 =?us-ascii?Q?C8VTrxwNbhFSbDg2hsM09ymQpQdDtEvSmLad6AnGbLkXub+CkNZp9BP/CATi?=
 =?us-ascii?Q?p+IM688T3IvWViIT6Pti1/ASusEZXEJQMdL2/Cf1hyh0q6yMyNOaHa8pAf24?=
 =?us-ascii?Q?5JN63lcT/FuVL8H829knzYrsf9s3hhHUGX3PxwaMrVo102SnBDa2L1SoOBpj?=
 =?us-ascii?Q?3KzKd74A8fEb3776xxPNYlMHZWOMK6+FRS/+S++e+w1DDPeyt2/9mCY1e/H0?=
 =?us-ascii?Q?X2dT0iE8fCzYI3kWh0iqiyL0Y9nRr0YBiJCFXaeThrQYUYgxCFsTrtxYRgGt?=
 =?us-ascii?Q?zOavtUhfXTK+TsfN4Kyh/uO3kLijk4CniCmNp/EdmZymhDdykrLZy8Y4SmrX?=
 =?us-ascii?Q?ZKcSb50CevME9wbx6pUOw7BHdOO9zm3HBoYUWzdlladwt/DITZeqHIPTupwr?=
 =?us-ascii?Q?EP59BDI6h1jAG3MqVx22M/OChTMtJzXvqhDymNM8B6RDn/5yTtWZUccGaAoa?=
 =?us-ascii?Q?RTaGUFnhoDUD34WNQzF1ZsptIczAL4l7bgdrh5RcmNCK/iLGzN6fZb8QDamU?=
 =?us-ascii?Q?XPK/lUBAzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34df92f-f6d3-4ee3-2b76-08de64672c25
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:32:22.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atJH766zRJiTcNfbJVpJn8+yaB6jGrELtYADGeCXpH0VefssBsmuerVxSSsSnx73wVMxycpbdI6l3UwXw1TPmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

On Wed, Feb 04, 2026 at 02:50:20PM -0800, Tim Harvey wrote:
> The GW7906 is based on the i.MX8M Mini SoC featuring:
>  - LPDDR4 DRAM
>  - eMMC FLASH
>  - microSD connector with UHS support
>  - LIS2DE12 3-axis accelerometer
>  - Gateworks System Controller
>  - IMX8M FEC
>  - software selectable RS232/RS485/RS422 serial transceiver
>  - PMIC
>  - 1x isolated RS232 UART
>  - 1x off-board bi-directional opto-isolated digital I/O
>  - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
>    (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)
>
> The GW7906 has much in common with the GW7903 so it is used as a base.
> Differences include:
>  - different GbE PHY
>  - a couple of new GPIO's added
>  - removal of uart1
>  - removal of io-expander
>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
> v2:
>  - ran through dt-format

Thanks

>  - use gw7903 as a base due to little difference in boards
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../dts/freescale/imx8mm-venice-gw7906.dts    | 92 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..83fc7faf81d8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> new file mode 100644
> index 000000000000..c4d0610e34ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Gateworks Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +#include "imx8mm-venice-gw7903.dts"

In
https://lore.kernel.org/imx/20260123-gifted-wolverine-from-mars-47b9d4@quoll/

don't prefer dts include dts.

Can you create common dtsi?

then both mx8mm-venice-gw7906.dts  and mx8mm-venice-gw7903.dts include
this common dtsi.

Ref the method at
https://lore.kernel.org/imx/20260204083551.2867263-6-sherry.sun@nxp.com/

Frank

> +
> +/ {
> +	compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> +	model = "Gateworks Venice GW7906 i.MX8MM board";
> +};
> +
> +&fec1 {
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_AMBER>;
> +					default-state = "keep";
> +					function = LED_FUNCTION_LAN;
> +				};
> +
> +				led@2 {
> +					reg = <2>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					default-state = "keep";
> +					function = LED_FUNCTION_LAN;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
> +		"dig1_out#", "dig1_in", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "iob", "ioa", "", "", "", "", "", "",
> +		"", "", "", "", "pci_wdis#", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&i2c1 {
> +	/delete-node/ gpio@27;
> +};
> +
> +&iomuxc {
> +	pinctrl-0 = <&pinctrl_hog>;
> +	pinctrl-names = "default";
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x40000041 /* RS422# */
> +			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x40000041 /* RS485# */
> +			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x40000041 /* RS232# */
> +			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x40000041 /* DIG1_IN */
> +			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x40000041 /* DIG1_OUT */
> +			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x40000041 /* DIG1_CTL */
> +			MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12	0x40000041 /* PCI_WDIS# */
> +			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x40000041 /* IOA */
> +			MX8MM_IOMUXC_SAI3_TXC_GPIO5_IO0		0x40000041 /* IOB */
> +		>;
> +	};
> +};
> +
> +&uart1 {
> +	status = "disabled";
> +};
> --
> 2.25.1
>
