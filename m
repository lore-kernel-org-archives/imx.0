Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0A35DA49
	for <imx@lists.linux.dev>; Wed, 22 Apr 2026 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829545; cv=fail; b=ejvCp/c5Etl6vHYzDYlLtE8Ezevbuyh0ZLI5ReDwShlkZApk5z8mJ7IS7BFO+x9yj4O4K4apcJmI5g4YPSPT4Tu6sejuHxJ1+sAmnkQATVKvuvDcEcrraNfrc6xzFQ5CnynZbu2Qymx24q8QBz8QylAXXnFrEI25u/CsxUTAYX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829545; c=relaxed/simple;
	bh=rBZ3Mv7/p7qT4WzbR84exGAuA4VJ33/sq4DCYu+qTPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DjJKLh32ION8nx7FHosv1p7El6a0rfeK1HFXdEe6x+7wEmAjJEWv9cdOgk3rSVF3A/qvUPUNxvw2nn9PgZV4hRbFnGmRH2jQ8BKpmKVyp/fLPb3tyN2oPC64gCqLYJOBWM3fwhXx+gdmKobBDJuF4SBe8Q4ABB8UJ5P42FdbqN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iOU8NC4N; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iOU8NC4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF/bls15XHv80jCrYKlEdQyErQWPitzLui4/vaex2VW4boxq9nVDnMdER90Mq1e4r2dW5Kah3d6Ns/m7PPR/J/D8Dg/sUu6JsrMhPhXe+bLpiG034UJyTYBbj6WWnYQYlue9Dm1490lnmjx7p142A5gLIcVmv1S+DdKREze/BfYFiZjpM8uNfxPQ2fNB01YHNfWar8isCyP9k0HqeNWFG89tkUr5SgvPrwDECTvdqkLOJ3S8UITJhkDvmhDEYhrcynVfd0wFpXs4hjcrRIItVoB6CvixuY9HIby4LVVEY+uijLAT+WJAvljoor1r3RACJc/WqFWcCNEATqLS1zLd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKOaKb1CaP+0i92nUceq0mry2HNFtst0EkXHT5PpNe8=;
 b=o0xIVApN0A11F01vSWyXgqdSYoke0lP4r6UhS++jr7e4ypNY0VMv7qVda7+2EO5ZfO17UnXUem0ah8WRazeeNUZ9zmh7hjoKFTHhv/JUnXOTh/lBIrnIZrL0NN6d8nwnMKZFrkvhALaDB3/pYOipgqBeWthj0EjphMtGvWjF7CMkG3bgr/r8oTM1EWbGHZ1MIuKkiaK41Wkyr2R7blNVI8brShsYyNP2jpCjxkU0MEIp4wn0vEpic3FafpBvwhmdxLS5MwAEenWx1utwBsonBVX8tZojAqPCeJPwa7s/d7aOIYUezW/vLo+0yUJGpfxIC3Zws+kURJdodvwJC+biPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKOaKb1CaP+0i92nUceq0mry2HNFtst0EkXHT5PpNe8=;
 b=iOU8NC4NGK+qkT7/nteL4BmuS7d85LjFCXbqqJODF/MEKz41O1eR3x1D4rjB0JuV1gBBKrvrNHG5W7uD16mPpJU5oHhEEXECWvIGqc98/hnO8jFtW5pmh6lKESr1j7D7FY97CBulwNealCyl/grGme/FoLKe9BScZaKsnKeAWd4Id2yqNxAck//M/dL79YtIxGbyx0Rc6MHZxuhg+ZnNg9FujgHz1l2v4YyjersoWZBHZDMBZP3Ny1ahWx5ooJHE/4PjA2OiJ/8s51dmAKPHwuNsTKgDBTyxCt1fkZNHWffAH4g1zcJxsXguvTgW2sah/5jX1QNivsgyjClbCVBP3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11429.eurprd04.prod.outlook.com (2603:10a6:102:4f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Wed, 22 Apr
 2026 03:45:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:45:40 +0000
Date: Tue, 21 Apr 2026 23:45:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: switch usb controller to
 flattened model
Message-ID: <aehEXEsiFl2PVIye@lizhi-Precision-Tower-5810>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421105503.1416566-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11429:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a3145c-f331-41a1-46de-08dea0219f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A7pD1H3aFJemFdC5+ADiNrT4dZtLz7/WROcU8PEA/cdP0ojx//ETzPSA5fbhtGjDvszOPUcEDFaqIawAh9b+/s8aeDkG8OZHUUD3aeo3uMNszvU5z8GQn8sz6dA6q63amFfPkbOMIaLiwydlKIugYRQS9bFmmaZ2G4W9Eh4DGYxQgOhy8QQaldaNF+DsyCERYJ0l3wDBcwiWAXw0gTsEBiG5sqEFcO71DkGhSmaQTIbKGv/tf9tMMC+bp7wbEn2O7WfvuagcG/2fDj5wBKJ1m2PJOj6WJO+EQGFVwNhcqprgHh2FjBZDeMYjXBu66q4rLmX7XKytzMcNwojlFMXcWUTxdc7MeJC2Hy83pKP6xqvmOr5VW+uQqyHTjUeE60ZrXdEo8M8eZten5Rr86ZV0+C7Zsayc96YCV1cWKDt08bNnF0RD9mDbVs+uGraeHTlApibV7vidNP4jiOn4AqEH5wOHu5tKyMVWdnEGJdIM7Gn8CDys91edf48ANxozy1GfHjXM/rLt8Wa/FA02iOxvRIVWBXSAwTia+tA/rEO8M4gnUSUaQziOWjnvHH30DhrtIRg4l4fmuGbwDbCNpEYNXTXw+NaAKW96ly+mBMEbA4lfW7dqkvL2hutkLRLYGzmzdzmabf6EgyOKPi8U/jUZ86gFPYDZPLI/+Ob+l6MfH9y5eTSoRdhkU429gKefnkibx1Q1RrUcHD8mYfJmbJRYx0S0iy5oY3DethQl/eBnxShRy/+INZHEM0I8ti1V3siIM3s6zpzKZYFdfy8LgVPoesW/S75wQj07I/UfEA2nXzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1za3kkLhMJzPij4lcBW3OUJVmz9JEPZdjxgOJg6BTkyuwWxQCOYQ/KwldCsW?=
 =?us-ascii?Q?c/flfWzuCQJfJMD5UEk9HjCpSUmio/M5H0HNze09A01dFhK80P08ghvIWRKo?=
 =?us-ascii?Q?bIiHE+IWwaF4ucpSLIqyEPP07DbiuWQ3E5/rGFh/f38n7CTL6RKPXzKMAsvs?=
 =?us-ascii?Q?Uj9T/AOekE+TmgHfZJ2sV9hjw8RJipiNS/9SyacfdXvju7oeYHv2496/Mv9I?=
 =?us-ascii?Q?K+Ugor2KNeshvX7BPjctSkgEIxRuaLS9gGaCOS4qvPIN4VyHKxBSU0kgVf40?=
 =?us-ascii?Q?nwgqgxhoq5O/TUXyCAKcvO4Dxv+LiWXASzphb9Ox3S1d82Fu/FeAn9ExZzlS?=
 =?us-ascii?Q?quQzkrjvFhXNi279Mbf5+ulxSK1u6TcPvgfapIHVDzRcpMqyrsx/NHmmaxrE?=
 =?us-ascii?Q?D6U80ieCtTPZIJiOCDuJgOUVbYn7E2KbLK5D1exd0ogOo0sSo6sG47u4GReD?=
 =?us-ascii?Q?CRnjmFH3qABV7I8ugUnEqS6eBLeq+Jrj5x7aSshAXCyLbeQlEIcqPDootAK/?=
 =?us-ascii?Q?4+92D70FZwC3YOjGY0ILaUzNtaisLTSLJcFut6o0XrCrZTLk9BeRQijXNgEU?=
 =?us-ascii?Q?MLOgxgW+R6bJk93RVdQPbGWj+Q+YCaHMqHzh3e4FiK/TiIoOx2QjmSxS0luH?=
 =?us-ascii?Q?ovYK5oA8nw+0mm7HZA5nd96yv3R194B4QtK1J3OtJfdsFGCpPx6PlG9n+aGn?=
 =?us-ascii?Q?8oxd7zMlbud5gbSIbMPdXFdHIGt/NKKfioyvMdaEZH99OQ/HJxKNfbfo+OoM?=
 =?us-ascii?Q?vnlhGc3Pg5g6NWZsCsfMt8DXKUb/dflJfkBCsSG+rht97ERsBdpv6o1Wr9jz?=
 =?us-ascii?Q?4pMcK1+8oSSR9BIWQkNlrxDgjWCRucTYwjXBqby9dEjFeId7cobr+dzq6s3H?=
 =?us-ascii?Q?ivbas1EOSy3dOxZhW7kygDcUwI0Noam2mLokWpDR2uVlRR3TJpM/m+1VT/Rd?=
 =?us-ascii?Q?OnnHJl4hChCkNyJ9zFdK5GKfVKd+g0FMFSQ1P25vjUPJOj6mFGzsxZlexBkO?=
 =?us-ascii?Q?b22/BOqUX+7uTG22ZgGK1hX+CYO+RCqakhUEBCvT2gmAVYCZuiGEcb33U6GH?=
 =?us-ascii?Q?b+t9A23kYm/HZZKq1Se5XfzBlBpJrS4My4ol6qr6rCuDoVWFNG7iDwcIKojS?=
 =?us-ascii?Q?okdX+gy3vXp36WfnK0AniRnOvvU1ACqUGTvOiJ06kQl/pYaMDv+1fBo7HyDY?=
 =?us-ascii?Q?mcfRA57iksLkNmW+2W2hugsjniLJarMxNV6YqE7YE3hP6rwM91d9L/mrluSX?=
 =?us-ascii?Q?2QPzgVYOd//BJtD6Ww7IAWZR3MwloE+O1HfcWXZicVDfvMOXFEy0ouzXBLfP?=
 =?us-ascii?Q?aLJNU+WC0V3q9MtkaBIOBN2xQDOpZwSYkoq85qgNQbRTc2kMTuiOLfnHpmDI?=
 =?us-ascii?Q?U+C4JmYnEGFplnnB86ZpT1SHva+grogiZK70kIVngcwxFka3OwYz31q7rhdy?=
 =?us-ascii?Q?zEVB6g5kxg/QD0Ob9j58OX8e0FufdnD73engQmt8jqdZ9uTm+WcodZBwHPZW?=
 =?us-ascii?Q?8tkuIofi83szteOcIKOWPh9/Hk+5hYSl7iEXw7/N3prILz2NRmMY7PYv6Iqv?=
 =?us-ascii?Q?MUqMoeg971PmrwruVHNK6acDypkoZXmztqU4sVg5qR2r15axsM/wSZZqL0D0?=
 =?us-ascii?Q?FCEYNEXRlVfCJZchpzZ5NdiHtAzH5PBmleL8MM+9xlydFeTxcBAZCYQeayxc?=
 =?us-ascii?Q?gmjRq3dDhIl24D9wTZxVCGV4YXFGw63S4FgGwstzgRbxCMhW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a3145c-f331-41a1-46de-08dea0219f9b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:45:40.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zc4EmNFkpD5aTQl5rxLGH0aGCmLrvgHGTsBw76jvJ7IOTyRkim7viEHWlRjYK1DA4C0byrh92mqmlo30SARC7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11429

On Tue, Apr 21, 2026 at 06:55:00PM +0800, Xu Yang wrote:
> Switch to use flattened model for all USB controllers. To enable USB
> controllers with restricted DMA access range to work correctly, add a
> pseudo simple-bus to constrain the dma address.

This should not "pseudo", and bus is physical existed, which limited dma
range since it transparent to SW, which may not mention in spec.

>
> Also reorder USB-related nodes.

this need new patch to just do reorder.

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 161 ++++++++++------------
>  1 file changed, 76 insertions(+), 85 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 90d7bb8f5619..8b3aab14ccf1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2329,6 +2329,82 @@ gpu2d: gpu@38008000 {
>  			power-domains = <&pgc_gpu2d>;
>  		};
>
> +		bus@38100000 {
> +			compatible = "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
> +			ranges;
> +
> +			usb3_0: usb_dwc3_0: usb@38100000 {
> +				compatible = "nxp,imx8mp-dwc3";
> +				reg = <0x38100000 0x10000>,
> +				      <0x32f10100 0x8>,
> +				      <0x381f0000 0x20>;
> +				reg-names = "core", "blkctl", "glue";
> +				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +					 <&clk IMX8MP_CLK_USB_ROOT>,
> +					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> +					 <&clk IMX8MP_CLK_USB_SUSP>;
> +				clock-names = "hsio", "bus_early", "ref", "suspend";
> +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "dwc_usb3", "wakeup";
> +				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
> +				phys = <&usb3_phy0>, <&usb3_phy0>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,gfladj-refclk-lpm-sel-quirk;
> +				snps,parkmode-disable-ss-quirk;
> +				status = "disabled";
> +			};
> +
> +			usb3_1: usb_dwc3_1: usb@38200000 {
> +				compatible = "nxp,imx8mp-dwc3";
> +				reg = <0x38200000 0x10000>,
> +				      <0x32f10108 0x8>,
> +				      <0x382f0000 0x20>;
> +				reg-names = "core", "blkctl", "glue";
> +				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +					 <&clk IMX8MP_CLK_USB_ROOT>,
> +					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> +					 <&clk IMX8MP_CLK_USB_SUSP>;
> +				clock-names = "hsio", "bus_early", "ref", "suspend";
> +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "dwc_usb3", "wakeup";
> +				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
> +				phys = <&usb3_phy1>, <&usb3_phy1>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				snps,gfladj-refclk-lpm-sel-quirk;
> +				snps,parkmode-disable-ss-quirk;
> +				status = "disabled";
> +			};
> +		};
> +
> +		usb3_phy0: usb-phy@381f0040 {
> +			compatible = "fsl,imx8mp-usb-phy";
> +			reg = <0x381f0040 0x40>;
> +			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> +			clock-names = "phy";
> +			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> +			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY1>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		usb3_phy1: usb-phy@382f0040 {
> +			compatible = "fsl,imx8mp-usb-phy";
> +			reg = <0x382f0040 0x40>;
> +			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> +			clock-names = "phy";
> +			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> +			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY2>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		vpu_g1: video-codec@38300000 {
>  			compatible = "nxp,imx8mm-vpu-g1";
>  			reg = <0x38300000 0x10000>;
> @@ -2407,91 +2483,6 @@ ddr-pmu@3d800000 {
>  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>
> -		usb3_phy0: usb-phy@381f0040 {
> -			compatible = "fsl,imx8mp-usb-phy";
> -			reg = <0x381f0040 0x40>;
> -			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> -			clock-names = "phy";
> -			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> -			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> -			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY1>;
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		usb3_0: usb@32f10100 {
> -			compatible = "fsl,imx8mp-dwc3";

Delete these will broken back compatible. You can delete later or descript
impact judgement in commit message.

Frank

> -			reg = <0x32f10100 0x8>,
> -			      <0x381f0000 0x20>;
> -			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> -				 <&clk IMX8MP_CLK_USB_SUSP>;
> -			clock-names = "hsio", "suspend";
> -			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> -			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
> -			ranges;
> -			status = "disabled";
> -
> -			usb_dwc3_0: usb@38100000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x38100000 0x10000>;
> -				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
> -					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> -					 <&clk IMX8MP_CLK_USB_SUSP>;
> -				clock-names = "bus_early", "ref", "suspend";
> -				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usb3_phy0>, <&usb3_phy0>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				snps,gfladj-refclk-lpm-sel-quirk;
> -				snps,parkmode-disable-ss-quirk;
> -			};
> -
> -		};
> -
> -		usb3_phy1: usb-phy@382f0040 {
> -			compatible = "fsl,imx8mp-usb-phy";
> -			reg = <0x382f0040 0x40>;
> -			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
> -			clock-names = "phy";
> -			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
> -			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> -			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY2>;
> -			#phy-cells = <0>;
> -			status = "disabled";
> -		};
> -
> -		usb3_1: usb@32f10108 {
> -			compatible = "fsl,imx8mp-dwc3";
> -			reg = <0x32f10108 0x8>,
> -			      <0x382f0000 0x20>;
> -			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> -				 <&clk IMX8MP_CLK_USB_SUSP>;
> -			clock-names = "hsio", "suspend";
> -			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> -			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
> -			ranges;
> -			status = "disabled";
> -
> -			usb_dwc3_1: usb@38200000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x38200000 0x10000>;
> -				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
> -					 <&clk IMX8MP_CLK_USB_CORE_REF>,
> -					 <&clk IMX8MP_CLK_USB_SUSP>;
> -				clock-names = "bus_early", "ref", "suspend";
> -				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usb3_phy1>, <&usb3_phy1>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				snps,gfladj-refclk-lpm-sel-quirk;
> -				snps,parkmode-disable-ss-quirk;
> -			};
> -		};
> -
>  		dsp: dsp@3b6e8000 {
>  			compatible = "fsl,imx8mp-hifi4";
>  			reg = <0x3b6e8000 0x88000>;
> --
> 2.34.1
>
