Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BEB24113C
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309386; cv=fail; b=W9pPLaVlELHhtSFq74jjgw5vZt0ryfnMcyV/bIpWeNdheYGiTl1lfPlwHpp65C+/v4xvjzeFkeO2jzcKUXL2KvUyYRLCibYjOn4xlQgjSrLybwZqXwepFKQJ6JBZ2jA1GC7OYyeJOHbyFLitVmPItwa9cqaESlLtLYxn1+K3urE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309386; c=relaxed/simple;
	bh=fcM0PZmT+wRGsBAUAN10JNO/wWWC4rUvMGPZ4xH5xKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HcOR7icevQO9OeyfenAAfH9LbQnRZG2j4waI2jyL3n4Nq7wWKQBjQK/LB2XONyYKdLAtzOFdCLQ6oeya0db+fto8M6bXZQujRF3gnPE9O0qXFtV3FFP5NyTfbdXb8nTBUnIFlwgDwyLnyw9aXl9mvUEZDbpLFSqKYnTMUcBWj4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F9R6ciR8; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F9R6ciR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQDrRW0Ip6pTA8NUzQibjDOjeC7JH0zeEf6xZ56zfgEsrGZjDAzeSChxC6SjD6tfZy61aS6uKCBFx9IfazCFjM8hZPpDfGUvwjICluIPbvdmsDcnvO+UXUvqk/g/MWWhJwf7zCvWWD4fovELxq4ilFJKWG+8dkkuZTZlC169YIkfAEv5FKaD6MD2zHwG8hbIcm17VWkXM1LTJpsswFzeCg8SXa96fyuGOYLikj7TSasqNn/2WwG/vkvl1ORtsxNyY/NwOC4a5xGBX0HdCIyRoGtaPs40crVkC9ahItDu/eS+wkK9Q2RlQrgoN+QcXp3rKQ3vV2U0IBaZSZ/GkBRS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gmiwu7j4R2HOuxrb0/Q3A/ZMurv6uP7ob5JCTYYkMg=;
 b=nd95cYHiusuQZb3/PN/RFpV4wQB/1hVdKkSdF9ltkQjHILNcWMPSKjreRm9+iLlqIZUCmgQSWlAzMY/sh3LLP/wgAcRyuKRyO5ayncv2hUdq57p7POtdMcWkrz3hJYMGl8qaKy33w6w+r82dlp/+xPvm+/gycuAVuMy8+sOfqm6IsiEbOt9ygkyhklYAPzMjYXB/Ey8a0EpXvPzHzT56kkYVXwXfusyVrreSYUyyaFMgf9XxhGZkD5fP2O/FBYS8NDfTuqZRukWNYg4uZLd8v6xw0iR/nJ8sybiKX/kknPEqy5AUxiUBZT0nkZj++Rb67M1+0T2Dw5Y9CerFGQ+Vow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gmiwu7j4R2HOuxrb0/Q3A/ZMurv6uP7ob5JCTYYkMg=;
 b=F9R6ciR8ZKFV70Wlwh5kjT2J/2FDWrVQttqhEj7cvsFU9PyF95+fhT8NMX0xGR6VAXsXby4o1NH/0pO5H6HfaaB+Vx9+IyTVbvYLoL9FY6QMUU4cKR96s5AGir4dI94aBzapXO9OKLTR0tH1qLtLPZ00VnO8r89J/Mk4QrJXfSviD0FbtkRQyAYD3sXVc7uJGAgeoepEC2BzSQb3v1ItrEdU2He7nIXFGAi0QC3KNbAkVIqDp/3g5YJkj5abdbgqm8kk4CQpyy7mNXkcTnR534hY165a5RUg/3GT65r6ksQqs0q4lnQTbeLDl04jD/5amAEZ8zu8d73S01gShgf23g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by MRWPR04MB11496.eurprd04.prod.outlook.com (2603:10a6:501:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 16:36:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 16:36:20 +0000
Date: Thu, 5 Feb 2026 11:36:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aYTG_Vpk7789CWzd@lizhi-Precision-Tower-5810>
References: <20260129022910.3942028-1-onlywig@gmail.com>
 <20260129022910.3942028-2-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129022910.3942028-2-onlywig@gmail.com>
X-ClientProxiedBy: PH7PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:510:323::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|MRWPR04MB11496:EE_
X-MS-Office365-Filtering-Correlation-Id: 63100d25-e568-4d60-b0ed-08de64d4b17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsHotrB7B5Z021E3CYXBhxf1rvqPzZi2wpKaXE4HbhEm7/ip7JHyqZDP+eze?=
 =?us-ascii?Q?3Ey1pZHX9DYLUQN9Om4D06ngOVL1ul+6oUhWuqpcmkgJAKMzcfj/9D/BGmKX?=
 =?us-ascii?Q?qBnrS5r4K/WSjS17SyRAXu0I9hW9PR05//LkleydNjCh3wCxXPkAxiWQVS5l?=
 =?us-ascii?Q?4/okk272Q+PdsKMrxSknF513YvsHxOhmvnZXMKS5ycPBNcbavL62aA51H0Ff?=
 =?us-ascii?Q?qmyIy6UsdNO3MCU6EK1lLU0GLigSJwREyIJC7ppbdESeVP/etbzQGhaRjMUG?=
 =?us-ascii?Q?6b8Ut87HJvnIJYFLEwcgv8VDM4y8ElS4YXshDSte/O1KokTbDPViz6WNvziE?=
 =?us-ascii?Q?GLi+sUtBjn3LGlvnADOO7IC8cQlCs3O2M0FYmC1D1EqDIg9B+5FKJleKdnXM?=
 =?us-ascii?Q?qff+9TrH2cPZ+KmmbPwphexr+YQcmxNJbtycnF7QYfRVLoDGQn1SkRO3uUO1?=
 =?us-ascii?Q?7L0Oy/I5sUVCiMO2I0qZH7c00dUp+nNhxiCtqfOo5JZ64WrHCqIu75jWiBm2?=
 =?us-ascii?Q?CDCI5BkQI8PJ9PVnVrt5uLDv2RU0jAaA0rpF+O9wasJTgBHf0YleA1PkOLTm?=
 =?us-ascii?Q?tlgzFVtyXQoQtsL8IclDT2bK36hJyzCK9zfpxto+fhMSoAPlDohyFQxsYRJQ?=
 =?us-ascii?Q?0TsWQRwrRRnWZs1OS35sVJVyle9ieVSwCsLIgB13QKJR7/13NU3BAmE+BldY?=
 =?us-ascii?Q?QL5JGgzXt+hbGdY9feiZgP81EvTecZNsgm2/h1TrOb/tIkSb0g3CqbmQpqO5?=
 =?us-ascii?Q?OvNZqZ8tD3zeSP0WilqBjQLuZALT8mx08SiOtHXVlAA99sXYKExOX+mnXoi0?=
 =?us-ascii?Q?/TbSxbwbRZw80FXv3nSSebMHwRoEuPI8tTlcB3HKFHqdIzV5+sjaq0I3f69x?=
 =?us-ascii?Q?Jxn7OSz1EnHwDUd1xClYEw+4T8cCZlZeiS++9mNe9xV3p1hirx5yoMji1dOu?=
 =?us-ascii?Q?r6NfSiW+gfa7XzL3pko9oNiU6GbwSR25u8j07Zf+ASrwTO8wMWL82biv1x+s?=
 =?us-ascii?Q?XCVwX9iL0PN2bggWrjqjM4QlWJmAjwxbZls2kU1WH5r87VvNIeJqvy9d/+TK?=
 =?us-ascii?Q?f43bMT0XSdmq9H5mVz6B5B2G5r7iPXpZ0601ARZVEbSZZUVpkLstoeRmXKaN?=
 =?us-ascii?Q?e02Yar4gZasemeell7JSyYzTnrj7QpBebnJXMQMko/vHIe1hGvZ06RrMLGf8?=
 =?us-ascii?Q?IzjbVfKLeUSYjVle+FhoOz2FoMUKqfmIWQB9DtP9ZuQm9TyTtXs8zXoiexJi?=
 =?us-ascii?Q?ogS4hNXkKowL5O0O+Umoc5JINBMi9K/RaCUiHrWPxfaE0S+N0Xtb67knfpRd?=
 =?us-ascii?Q?CxsTXRWn9UbtCo2UWIbYgmMMUXY9YVNMBQbn+5KA052EukpfjphVUrgM8jhK?=
 =?us-ascii?Q?GhRMVyzQ4k2FyEidhRvyQlxSef+mjpa3iv3jh9leAmUdxkoR2p2Ljh6X+Mzh?=
 =?us-ascii?Q?naOjfEFJ8B0ISr6wr8s5EKjywzTOzq4cd58IfcctDuMm0VS/1WINRLwtMnQf?=
 =?us-ascii?Q?5+p8pRUi0mgK2s/RaPq0tpdEn427LAYzbO4HXCUWlpyuV/qYR/qQgLDMecS6?=
 =?us-ascii?Q?dQ1+k/v3BfYev+AXSEw3kiLEUuw1fs9VS4yAvEsmQpJz0tUpqkx0TUkcEx6o?=
 =?us-ascii?Q?qdY3HasKJSOJbW98OcGU/lk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4PK4NWw5XlwLs9hp8ZnQHIwGMsWDVmdVNy2qvE0iNVkHcl4QsFGrZomnaCo?=
 =?us-ascii?Q?gXk4eLazmEzw44u3lZqFFkC2e7eBRtxLmywEvKDh02RDEbBIw+cNYXSwe7Cy?=
 =?us-ascii?Q?uORjGFvJP2NlUzj74LW3qlby1gSrUPVgl+n9NBc4PHjFCH4eBCKoBAqAkQkb?=
 =?us-ascii?Q?RTo+jcU+xmZ6MRcf4TOqKBCYZiYnqCDaggocaT/j2jKaeTbKeDsmLMXqVbEQ?=
 =?us-ascii?Q?0137t/QzKqLF8QD8IWzwf+uGGxAGwjS3x4/MwYpp/lpRwNC+nFwb2rXZuwNJ?=
 =?us-ascii?Q?DooYXANkHwsApXP1VpYdUThT2Wy3LGZwRMgz/AEyvh5Mmxekga0gWtlOKlRz?=
 =?us-ascii?Q?lu5h/UdQ5Is1z7kUfug/A1xErj9sKfvoBtS3tdrchlFCr7zY7pNFrnw5cHxL?=
 =?us-ascii?Q?F67tqjM26OT5a9MFrNNktuxYDSfjgACT2CAx47HDjyMIWtuX8XEvmoQVrTHC?=
 =?us-ascii?Q?RRkPBUvyBknUKk8au8obRRTAVXLIy0RAxY3bV1q+qSl4R9CdVHWXo40VFGDy?=
 =?us-ascii?Q?QJQflP1fS7riucix451ARadrNXh7vJ4KmPTjKySldcnpU1JwN2t4ShG30cAT?=
 =?us-ascii?Q?jsC20mDqVpDRfEVLCafGdGl1S8tSNaZveZKJDw+3nZUsd7YOwtqoj9LkgCvB?=
 =?us-ascii?Q?hXwnbZwrCQb10jUX1c9QDPUNpX8iOYoyzH+9mmTtsvQqR+koTPsSAN5qVd+F?=
 =?us-ascii?Q?K80SgJRNL986l+vXm561j3AmhiibXnssGdhfI8hfNW7FXeYG8lyUgWULW5QP?=
 =?us-ascii?Q?LHibJ/C6wcn3iuOzO9o2Wg3pAYpbgYJYeU/2keRsjGRbXRCBM0elkSbBCTNT?=
 =?us-ascii?Q?0taEdnkkeIDIJTpi4yyNDnsTkDFCsMfADTvf8ojmME0TZXopkQ2qK43oremP?=
 =?us-ascii?Q?aqwTiFNyL6S0dsaKJPpa/FdS73IWXInoN4OM7mPWJNrXVuq8JXwkEKR9tIt9?=
 =?us-ascii?Q?FLL6Obu//5qIBhakTovrBDekLZx3wNLb1jCNKXSq5x+Ec5igGlx5qEEbYIeq?=
 =?us-ascii?Q?bRXP8Ea3VEeH/op9m28T/awHxoLnXXOTLcF34ohGb83IrFG2osCRXK9fu4xh?=
 =?us-ascii?Q?HWudxoMzgRnqzTey0c6QWtqe5g/FPJq3+ds06YeI6XkPxScdmH6JzcPlqKbD?=
 =?us-ascii?Q?wiacKvwWon3nSWZ2tEUX2eCVwS9GCO/nmQ+WBSjg+C7WY1uYw3sCnUTgYY16?=
 =?us-ascii?Q?1bF+2RJbH0I6T4t4rbykQ+FEdwj7wWaK9Nk77Q9qPVL0Jh+H6y26JnTjgu1E?=
 =?us-ascii?Q?RMCgJJ/ld9i5k6Ab+PKoc+9iF74Hu0bDPDIYZZzZKffngc2eP9onkljoW+Op?=
 =?us-ascii?Q?R40mHHsQpg3xSJp8cHTW9tRBzsz0BCaMJ6JADZj0UKjYNr3rhsUnReJWb5hS?=
 =?us-ascii?Q?NUsJHIZyOXGSfgr9XjuOIdMPZaIWz36BQaG/RnN5YbMM65obBNdEG7xkSVtO?=
 =?us-ascii?Q?ibtkKtFVlFhnferZ8FJRgYpr1ITLQ8lSik54VXQb0zBzLmgh9OKD26B/naSx?=
 =?us-ascii?Q?u01gpwzfGn+NaMtyjeJLzGe/roEe2NSU5nQ4LNOUiJFMOIvqjac207IK0UBi?=
 =?us-ascii?Q?H9t/SvxeeNSL4XvLphfg+8Ph5QR10oYezVZwDLsem04mn+JMhdtAr6ORrXGa?=
 =?us-ascii?Q?MsAHtY6DmIslgusl6eaTgcXzllJhiQHJWEvZA4lL7Lvrk28B932TjcZlcyOW?=
 =?us-ascii?Q?/BI8WU9bkFndfednULNjcNzMltZTklkRbqjmdvcHgyuB+5Oy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63100d25-e568-4d60-b0ed-08de64d4b17c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:36:20.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUO8mblHPRbv66kDLyQVste/PmHejLUnS+iirAurdgzDf0V2wP5X2gEr4/xHL29KixehT5mcSnkjlChrhqBReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11496

On Thu, Jan 29, 2026 at 10:29:10AM +0800, Wig Cheng wrote:
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> interface and uses GPIO pins for reset, busy and DC control.
>
> The overlay configures:
>     - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 5MHz for stable operation
>
> Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ce8f937c2315..c2727f8061e2 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
> +
> +imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> new file mode 100644
> index 000000000000..5fee27a589b5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
> + * support on NXP FRDM i.MX 93 Development Board
> + *
> + * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iomuxc {
> +	pinctrl_lpspi3: lpspi3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
> +			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
> +			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
> +			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
> +		>;
> +	};
> +
> +	pinctrl_epd_ctrl: epdctrlgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
> +			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
> +			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
> +		>;
> +	};
> +};
> +
> +&lpspi3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "mayqueen,pixpaper";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> --
> 2.43.0
>
