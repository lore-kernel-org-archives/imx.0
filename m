Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014E39479E
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977716; cv=fail; b=QkzBR1CO1pH/+Gj0srQEgv4mpK75e1thN0Uldeq/d0NHF9di09W7uQMbilVPC/FpHrlaL9oifMo9FCp9V4AJ4cKJvl0Fe5Wh5U62YQQ/sOiKKBe96DgdtFjqon0fbUYUxQMunB5vBwjNOXic4W8Q2MR0SISfycJH/fKzsHbwfWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977716; c=relaxed/simple;
	bh=w3e3Z9rgODKGmZLGOrxFBEbJndfGj9bji/Alsp2jxzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jKLf9qAknNV+Itr+535d7sLKLnsFYxZ+0dDvoDRxN2zjyHxzNAQbd46gRxW/gKUw+7LbP+cfj3FrjAgGQivO0AwIy+s7Vtfke4z/ZGSNFHtV9Vvub0D0/ajOwl83F8OChjFW9/epsbKE4QAq4+aFVIy6VUar3EGR0z2X7IyNXx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M75hCs2s; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M75hCs2s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwPAkFJWpC/X3RwRPtODfGXgUL2AO6mT7fyGdD4LYjHyWtEq8LayuMdAgCr218lVjNoyJMBHblYb+mP5w64sxBq+gdwfQwL2kqgdZTCNP/6EcJJa0VLPYyMv6getCJ0b3tiw4bag4qS2Cft62/Gd5Dc6Uco94TJQMK6wxKCpxWHlQa3+2Y1VJY9MjDmHJBzDvOL41xkxrA4hlA1sCQLZknU15h28zEw00VB9PLAN7xlDFDwacMUk0g5iop5UJN6Snl+BndHXY1aK7tuMq04/LC5zrn/wKSuZv0FHnx7te6Ja7Vpoc5YathGusOn8q1qEcXXHNhlppBtygWy7UXlCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzjKbo1Rl3w5YbQDt+R8Lnmmg5dyp0EufeIhKRxCW+w=;
 b=VRI2kbCem+bmguOCRcxnu56jy46gGziscjZ6sFxIvR5lOay7Ux66H4+r6C57FbB2qQB03nM1vZe9To1GNQH4UXE7HcPJnoTFgq8Z3unn4awlMU6FS3AMW24Pzoe5YWSG9Ozw/SVacoqqSDbphD7n/9Eadye1sVdZbnFUHoZ1WsqQ7vfZGUtVlTUZh00WZGiNkB4XCH5mtWNLGC8NZJIfQ4cXd7yHykF8X50UTeoh4m1xP8+0mjF90jB2uffyzqsPxer0NwGHQ6TaMg9A6EktyreAtH4tC3Xllc16509oz+7koCFL06sfSNS7yV9AfWNrtIKNbNz4Q3HRySfqpIxfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzjKbo1Rl3w5YbQDt+R8Lnmmg5dyp0EufeIhKRxCW+w=;
 b=M75hCs2s+SsRmJzyUqeW1OYI16k0OIKqa+B6bKThWIab4gQfrLus+dznQkoP4KCjK2dM7TKwjQyT7Qd7FV67YcJZzkFjjJaNgIlPdhxumzFmNu6lKrEzyYk51eLiGw67hmc73OXcFqx4cYSSrdJx0DzXpkou3oeFIP/F2NkAgcJmHYlrsnW2MG/tvlIbNK9x+Hbsup0qqOuAueJajL00PAd3jU8adKZlB5safF0YYmgR1AWqOBLSPhBxb+k9skfoBP+RnUut27OxHknTb8FV3nNAW+ZYBKmVRujHNYqBoilqt3th8ok9Ll01mo+giCJkZ8SbhsBY7ibjz6Q39ezMsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by VI1PR04MB7072.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 07:35:06 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 07:35:05 +0000
Date: Thu, 2 Jul 2026 10:35:00 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, vladimir.oltean@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] arm64: dts: lx2160a: transition to
 device-specific SerDes compatible strings
Message-ID: <b5lpw3xu6svsq7xmmgp3jn4cg455zhp3iw4q6lcsxq4bqy7mwh@guuitghg3xal>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
 <20260701131137.940145-2-ioana.ciornei@nxp.com>
 <akUjt5OPiO5cJ1D9@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akUjt5OPiO5cJ1D9@SMW015318>
X-ClientProxiedBy: AM0P309CA0012.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::19) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: e56ddcd7-2145-4826-1d9b-08ded80c6f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|11063799006|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	eo093gF3zQWXzQU32NOMY8oVzYl2Ncpr9+xLFtC/fpD5XudY//XWJXfFTs/693k8lB6a7bgYP2gCMj+L1LJr/ubvMOQmWjUyu0buqoU/46vYeg+mIzKV7ZkcUR4VesK7sQhmzzpHNqkxnqy5+q+YpuLPqy4U/nRkJcl+SNv5i7XOBZARYc+pv8YdrtlZmKov9iWTH5rfPKfAw0ucAd2mHhrhYIKjM7MISKthiUSuDWR38JOISuqrv/RtCi5DNFbnYNx6AW8QGN5m3WRgVVv+r0+iFB+xeRuGlD6hw/EaUIx+kEpf7gE8mLk69tPnzMR4vs1UISU/Ku4AJoU4FTigujg2U5MXrTHKgB1FvmXHZve69n9kDyEMjhSlN6Bxy0e9dbcL+pNhk35sB5mI1OdwKgYHEIpQW5Z8rS9P6KP/VSqD23vA7ea5JbGLEv2EIbTwAP1+ybckzLM+UCoz71HQR9h+FBDbshYfkV8NOLv/3NjHgMtJHzzIFJf+JrQjV/c4zoam7qXGAJyaAg0MXx2o+C0cCzAqQZj2+M2IBrwhe8kwLXEv/Rlim+YE83t1d9dsKNCdrqo+TzRcmmeRMFiWJjpCGyRfXDpB0v+rl8j+E36kvM69vIqTwpOd31XYfm83MXPC3CATfjFvCu7Vfn/0jLjuHM/vvtO9GZPTrVHmsVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZdXdV8765Rmyn3b6NFMkyuuZhRjr3i1Js+YmdygbPHM8PhEUVvuY8F8mtNac?=
 =?us-ascii?Q?ugJ8eyDF5sCZPjFavnkmb1G/2aPr2YvUcg3grWuKHjW947gkHWKDeQ+oa81T?=
 =?us-ascii?Q?037vRxtsKSL+4w/y5SCGk0axX85yOp3MR/2AXDa6X8i8QjUrhgc2ib4GzS/e?=
 =?us-ascii?Q?Gjf+Zjxb6MjFfj8V+0mD7DYrkMwLmfaa8xAS2tFBNbk5T03C3xooHPvh3ZGo?=
 =?us-ascii?Q?yrsD8gjiKfovlUkJZSKwYNX4IxAJD0JF32WafSRlMMunM5v44W7YobqvVDSO?=
 =?us-ascii?Q?SyNcQ2YDkl90SCF07j50oMnYB78AIqEimnGrRm8KDKjYxJpLeBpIFNWKkXKy?=
 =?us-ascii?Q?FnRDdJUMaFg0LRlDtKkazuGdN0fFRebXO73Y/0qeke1Vm7Z2x+fcirbKdkqx?=
 =?us-ascii?Q?lhZsmUO28r+miwErzL2Am/+K5+S5oFud6jPY24tYEMxIzMzSdl5nF4XVzvBV?=
 =?us-ascii?Q?pDXLn1kL0nOzyF9s4mCxjaySAVCJwHY11mB/G7STTE2se7qrrDfk6sRYFQmQ?=
 =?us-ascii?Q?ubrbgBmhiSJZ7NmJIsHFmwDdM4NiPEq8AzFUjTyWZeVpIKYH93tTZCAh8Osa?=
 =?us-ascii?Q?9SToyhvUQgfBq0Assn0WS18atoz2r5AuGv8TF7sHVhWTxj5LJgcubEH5JfwF?=
 =?us-ascii?Q?ML8WROTfXiw5m6W5FgQif/Yjdj/7QAW+R3ekMu6X5En8hC4jJfp9IJeQoQ3k?=
 =?us-ascii?Q?CG/0ud2MFWZouC9YOEyCZiH52JDbX3OjOwHERYI9utJxTQGfB85tfgy3MRAU?=
 =?us-ascii?Q?T6djcMzJmlQp+wKJzBUgp7g385roOqWY0t4mA4Pk+b/ZUphzNe5PmQmm8C2W?=
 =?us-ascii?Q?Y3aB+O85gB+6HzpIzAjMHu2FfXI1caG/qHjdxxeW2zpH8FC4+SJOkyfT4NTq?=
 =?us-ascii?Q?Js56r3i48L2eDI+CBDCMDvAOlPkN10X/KjKCu0HpGxieiXHaRsbsz1yLYEi4?=
 =?us-ascii?Q?9M6QDraNkxoNzsknHQP9AgUMOgBaCM3GZ3Qvd5zuC7ICVfk+UawjRfyi6Y6n?=
 =?us-ascii?Q?HJ7uAdtDjQUFLHSv2fveA2pCLdBxN5Cyyrch+eMi7Dq32Bne/knz4gYOpHAC?=
 =?us-ascii?Q?MJm9JwGOFPBWhnDA/HLbKomvFYgJy04WeRLcTzrjBFWNuvEDh0Kta7ER/H5y?=
 =?us-ascii?Q?v4JQ/rwUBFYf/888dUxNhfTetMzf1dG+3WPa+kqgWmLfAlPxtSBxHkTpwOqE?=
 =?us-ascii?Q?0a9WODNs9fkFIYMD7li9OUzMY6tR5TBO0j5h+B7nuBz63nUyN5sFXU8GCdzp?=
 =?us-ascii?Q?SCDcPU1C3GvjVRyjjZfBO+RWgvAGfHdqAWEYU2/8pS2EVrCpXB+aeLr6lXTh?=
 =?us-ascii?Q?nTCsx6WN6mgxmOCpU+Fm5/L/9Aj8gMPGiRLgt0dPUDar44q4vUtmcw1AgmMs?=
 =?us-ascii?Q?iIV1M/RlH9RTqSO65ZsVsotrPwFy2mKAGnSoL/TfLW3o5ItrGJOhTFlk+7E+?=
 =?us-ascii?Q?bvPkL3iJ9SJ9wtDbsh6IV0Xi0tYHa8T0T33I9LhqgUTBOj5qrj+PLY7/94V8?=
 =?us-ascii?Q?4Zs2e0f+HHWKawoElp/CFf9brOlqu3zNauPEql7vgUOKEF9RJ4yj4f75f/JL?=
 =?us-ascii?Q?am+6HRyiGih7aAwZa+UJm3KEKrfjpmAV0VhGxJrEbraSFVTFBOlMM/AB0gh+?=
 =?us-ascii?Q?/mbH7ZvgvElEEdDg6kZV1oznO05722xLl2PjkmaOJQppS0sKeLgE7O91fhix?=
 =?us-ascii?Q?gs8ZoHrqwZBDnREk3zYm/ctGod2NvIotaB/FkozXQMsQ+/FY/dPW5R31hKS7?=
 =?us-ascii?Q?4M1ocjCy9Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56ddcd7-2145-4826-1d9b-08ded80c6f44
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 07:35:05.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPNVHwUpd+zJ8WyUvK5w+ZNGqw8LXn0pP75cxe8Ge1wjVBhyeAobdmzmLDCNUkqs+vV+iHvIEN8HeZMao7eiNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

On Wed, Jul 01, 2026 at 09:27:03AM -0500, Frank Li wrote:
> On Wed, Jul 01, 2026 at 04:11:33PM +0300, Ioana Ciornei wrote:
> > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> >
> > Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
> > instance is present in the compatible string, to allow reliable per-lane
> > capability detection and per-lane customization of electrical properties.
> >
> > The modern bindings are backward-incompatible with old kernels, due
> > to the consumer phandles being either in one form or in another, as
> > explained here:
> > https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/
> >
> > One of the major differences between the LX2160A and LX2162A is the
> > SerDes. So far, LX2162A has used fsl-lx2160a-rev2.dtsi, but we need to
> > split that up even further, and derive a fsl-lx2162a.dtsi which
> > overrides the SerDes properties.
> >
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Enable serdes_1 on all board DTs that has consumers for it.
> > - Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
> > - Remove paragraph from commit message which mentioned some consumer
> > changes that are no longer needed nor part of the commit.
> > ---
> >  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
> >  .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
> >  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
> >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
> >  .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
> >  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
> >  .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
> >  7 files changed, 190 insertions(+), 4 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
> >
> ...
> >
> > +&serdes_1 {
> > +       status = "okay";
> > +};
> > +
> 
> Can you try keep alphabet order? may old file is not ordersed, but try
> best, at least should before &uart0

Sure, will move it.

> 
> >  &uart1 {
> >         status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > index 1d73abffa6b7..a687eb3e3190 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> 
> Please split chips dtsi and boards dts to two patch.

Ok, I will split the serdes_1 explicit enable into a prep patch.

> 
> > @@ -621,17 +621,163 @@ soc: soc {
> >                 ranges;
> >                 dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
> >
> > +               /* Note on the interpretation of SerDes lane numbering from
> > +                * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
> > +                * The letters (A-H) correspond to logical lane numbers in the
> > +                * SerDes register map (lane A's registers start with LNAGCR0),
> > +                * while the numbers (0-7) correspond to physical lanes as
> > +                * routed to pins.  SerDes block #1 is flipped in the LX2160A
> > +                * floorplan (logical lane A goes to physical lane 7's pins),
> > +                * while SerDes blocks #2 and #3 are not.  The lanes below are
> > +                * listed right to left when looking at that table.
> > +                * Both the numbers and the letters are according to the logical
> > +                * numbering scheme, and do not account for the flipping.
> > +                */
> ...
> > +                       compatible = "fsl,lx2160a-serdes3";
> > +                       reg = <0x0 0x1ec0000 0x0 0x1e30>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       status = "disabled";
> 
> status should be last property

Ok, will move it.

> 
> > +                       #phy-cells = <1>;
> > +
> > +                       serdes_3_lane_a: phy@0 {
> > +                               reg = <0>;
> > +                               #phy-cells = <0>;
> > +                       };
> > +
> ...
> > +
> > +#include "fsl-lx2160a-rev2.dtsi"
> > +
> > +&serdes_1 {
> > +       compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
> > +
> > +       /delete-node/ phy@0;
> > +       /delete-node/ phy@1;
> > +       /delete-node/ phy@2;
> > +       /delete-node/ phy@3;
> 
> Now, do not perfer delete-node. if ver2 is not include phy@0, ...
> 
> create ver2 files, let ver2 include it. Now most people like A + B, not
> A - B.
> 

I am not sure I follow what you say about the ver2 files - are you
referring to -rev2 or LX2162A?

The LX2162A is a version of the LX2160A SoC, also known as "LX2-Lite".
And the main difference is that the LX2162A does not have the 3rd SerDes
block and only 4 SerDes lanes on the first block.

The delete-node is reflecting exactly how the SoCs came about, the
LX2162A is a smaller version of the LX2160A (which came first) and not
the other way around.

I feel like it's unnecessary churn but let me know if you feel strongly
about this.

Thanks,
Ioana
