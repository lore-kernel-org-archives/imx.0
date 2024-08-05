Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2760A165F00
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722883051; cv=fail; b=DeLzallvhAyPOwCMOr7mOg70zQNQSeI+argiYGT2z13F+BMxmEJwhaXSY6yQWzD66v5KdOA5CC0l54xD74mtUekDdBeO7f7l+c9IR/6XAQBRyR+EpMJInmi4OABCcCCGANzBJGNusQ0YSc+j/uWnE35XJ/U3w4PU2Z17hdv2EUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722883051; c=relaxed/simple;
	bh=x1VVkFvO0F/+dnopkyaWzJdIxmSqmPRBWCfYo2k78/8=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sjJ0oZp2jFmlmSmRJjpvyvQ2D6gSQASTk3Rvl18E7ApGFFOBqlBqAUinOx8VwO7lnyPx+lCoElF+Hw+7IDFIt+M+ic/uesxySM9u2OVT8aUkzahnqLpa1idjs+QIAidFHrUluI48zncKhAdVnGdRsrL//1Siz8kWIzLJuchb8RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oTFwkTqg; arc=fail smtp.client-ip=40.107.104.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oTFwkTqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeTlFFhVMkUOpqhQpixgs25icEQzCWEshEZ6T+PPXij2NJLEA+NnUhVULS7v1JpfGZni4b+O8qZw7z8ro7tNbhTeehY9iT8qp6YQjekThN1nmUPBJfqclGpoatSlwbEwnKrGU9pQU4ifefxdAZjyUdop5gY/X+Ync0Xtfvnl+QxmAOFoRVuiblA/mgIm0mabz/O5YlYQlc64JXV0qpVmSVMbrSPLzOLlU0StxxsyptrBjVPn7Hy7KsbUuuZM+ekQJL3JbEBjmBm1rgJQpOiohXdzy21D70ZTMMVIN6a+J8h0CDx3XEfPFaJjTblPgIBfd9btTje1uOtrlm6vqC7XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ1U3SPIwgWA5y4r+4vAs7VQU8o8SFcIz6Z6ZOeJ6a8=;
 b=qlc+dIu0Grx5iqcY3f/66FsuFHLpsj0yO/lwW+6g35faGhmM/U0xa/Augmes/i1T/MlCDzZ/NvCgAlkV3hkDp9GK3qKHEN/y6nZ7bWZZcDg6PZjIjCwCf0TO3aoLHe8RMeEysxprsheSeGabFrGbTnnBjQ8dWJXZZ+nT6G1EnFvmxIqZmrr/rRReM1HYxnMQS4ENgmWc0IICS5rzNanyDtj0rfG0fF0atWjKlwPlpxPrX989zFHGZabVXF5rR5K3G93d4NVV2qz4lEjrTr88obrR7JCHA8i5XLF+l3mAY249BzoXM5hncHfr62vy0JkB0v23LqVPgFjCbrhBkzZ4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ1U3SPIwgWA5y4r+4vAs7VQU8o8SFcIz6Z6ZOeJ6a8=;
 b=oTFwkTqgaqPVuMifPFFPxhvd6T+n7P16OmU5eZdcWN1Iuv9zlUi3svrLMgSsfEkYm7b3Sty+vGZgGTSLNZNvAc0YX/F4Asd0J3qqF9EFg/NTK5FqIajxuYgxbOSweN4o/wRIyvqGOsBWuqfGd6/RTuWim04AFsvzWsDFUsWz2hYF5XhntVVAQJIQ/r2VHoFtMXemDswOMNEHts88342MreoT5EOP63olNNGbJ+SLzBvZHlpbtTwl+KeuV7gk5UboA8OE7eBBedmh+bnCzx4uVUDTnW4Lon2xD1LPcsCT9rcLi51CF0udkGebuQ1d6mq2AaINpmV9rN3uDDFqqBTxEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 18:37:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 18:37:25 +0000
Date: Mon, 5 Aug 2024 14:37:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: layerscape interrupt-map warning problem, may be dtb.py bug
Message-ID: <ZrEb3sF08WHQwWHY@lizhi-Precision-Tower-5810>
References: <Zq053X7eZG/8blYM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq053X7eZG/8blYM@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f490298-63b8-4e31-b832-08dcb57da6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/ioKuRS+R/G6TyrmEQZdN+uwEQfvUjnc2gxiEBlithe3f/MpfCHlSPro9x5?=
 =?us-ascii?Q?HifWcNjCfoBQ+UQftPAE7UhZPB1WgLhlKZfqKWkfPF9412w/6r17gn+Y6kpg?=
 =?us-ascii?Q?W7VDtOhRxf4bo0w4cDlkOB57Qo56z59ffUxRhaQls5oCXc5+3Fk6jOxkvNy8?=
 =?us-ascii?Q?Rf1clNYZSmTeQzxp9Rc+wN8eoRE8NHiSZiEOnGWlyzNpAgKUQEgpm/Z2BqKA?=
 =?us-ascii?Q?v51WKiTjtjCj48J6s9yuVXBGywXAmaQ2YqSjU75AmGxEyIru9e35LMeAhQj1?=
 =?us-ascii?Q?xQaoqxZxV2kqBTudfrY1o6nfhPYu4+e25C1S+ZwGWFsTH6XQHP8ixQG/OE2S?=
 =?us-ascii?Q?dYLa4vVYGUFPcvDIcvrfOuDNj+1kvVEDvtHqgdIXIF6HQvB9Bt8i6PZ+z7pH?=
 =?us-ascii?Q?tqKQNadstMM6otSveDuGjNnisF/eFOFYiON8bej/unrWdLjrOhKi8JtLkcKw?=
 =?us-ascii?Q?GUBsfaf4eXXBUuHTvrvWoy5+wa5xVU+PUx2BxAqXa3bn4PmQHgA9/exfJ9Z+?=
 =?us-ascii?Q?GSyu6mQW6yzy6f09+AFLaPV5Nw2NX9vtJTc0G1kWvB7QXvb02nXPXeVVswma?=
 =?us-ascii?Q?lLaEfaZ5WQ3OAyCFCBpDQ7I4LXPg5R7ywWg47la47IKohko7NuwZoTOpX8wq?=
 =?us-ascii?Q?Wj3nd5+7XuUFZvhyRHVSXevv6IYUvq3pLsRJrE8Lii0jg1xR111MMhoYc852?=
 =?us-ascii?Q?YP2Zj3ybT46SyPDi7TMC/JK836HbiCfS35af6zUIfR6SaGzCxfz69Nt7pWa9?=
 =?us-ascii?Q?EicxmbyjsBTjt8Ey8HvnaNT3EQCLmD/THnDuEX1mH2yqSfR7IAA9R/f7K3Hr?=
 =?us-ascii?Q?ViDnsqclopRGnRKOAAsuimKu9Fed4wWxpGMNp5WZoJjidBbFa09Ep24mpOM2?=
 =?us-ascii?Q?1OFwZQanq86k9qB9bn+/DAy3lWFMYN1056q18bpGGmdZfYlnuyxr98jcnljR?=
 =?us-ascii?Q?jXsrlpJEvTsNy0i6u74AKU17c+EhiUwWuRIMSUx5IIqAL0nnc7/z7fU5F1SV?=
 =?us-ascii?Q?w51SdmIpzltMfawgzErDDRtRMXuIpDJouJCFgKVRBTtwyXz7zf8rDygj44U1?=
 =?us-ascii?Q?i5DpIUPQBXN6Vwhmvl3poxS6br9NfKkZjzm5UAsC+rsU80Ex3GZbKuo7rIrZ?=
 =?us-ascii?Q?99NnbnARh1GihhEP50r1CKlCDAkICgOd+xfMdsoBE1wHpItUsaKUSMGfAIqG?=
 =?us-ascii?Q?pu4Q+S5YqKm4hGQTI7hiThOKeuIk2C9YpfuoHxxrqDVBHEjpkKnRe85Toql1?=
 =?us-ascii?Q?W7dXlffpo79PlbZo8MFrEFtIPl3k9Ugh5wxbagZeMJshwuJZfjngdDCo9jIM?=
 =?us-ascii?Q?LjgVlSChd/rclSwLcEvJCzwU85TBb/Gds5ty5MxcNIwXpX8zssP758M2YvSX?=
 =?us-ascii?Q?FGtEHHpxFjTRCTfFkNn+YWZmUMMmcX1KGoLMMm5l4lW/69Lnww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SAgc5XDgM/yj/CUSRUBAsZDVJHCu2mzGrlW/hGEm1XszUFwp08x+QknXnMBn?=
 =?us-ascii?Q?5ohWlBJ/wIJB3F9eKRM3TbusKPiyurk+CUEk75AW1BMGPt5Meywpm1xAp5Bp?=
 =?us-ascii?Q?FyXcvVvfSGDvspJ9W49S+6XXXUsSbzgCxwMwC2VsqgUkEB2atqScu9Y5koqe?=
 =?us-ascii?Q?PEhuz9GTGvxl9NnHp5YQGWNWEhXwLtThPSBfAa+BcMiHIQ/SayGUhJ/7+7cY?=
 =?us-ascii?Q?zKS25omlD7tUD2CsQl4lcYjS3ls7FZsP6FpozFAc6HR5Hyy1dcGflUn8gTF2?=
 =?us-ascii?Q?gK8Anq2Q/7gxGKSJPmCdljWtu+FPnM0YSoPW/eWY86Zc983R3Bu4JUkMLo1y?=
 =?us-ascii?Q?rme6LfKAYGZVE1q4BRxRXoeMYlhooXSt7ENd/F69OQfCQQEBfKUOgDAIYg6/?=
 =?us-ascii?Q?cwJoiMXaqvxEGsnJupuFuOwsb6QNgpCVSVP8BNcvp708UM0XtARv4la+pPCl?=
 =?us-ascii?Q?jnSrNr5YUMrVm8zw0rWqvpSi3Fu7CDB7eJq5CBCepjFOmZG3XBTx/u7LcvSu?=
 =?us-ascii?Q?SzW4SyD+0kyPRDly3AoVhty6ZMElYT7NQHk/ac9jcbDOc/t/3kJZLJ4fqPld?=
 =?us-ascii?Q?KcVG+tNzNZTNZyk/+S6YUtg5ufV6GrZsFVYZy6M41ks36WUoMMMfAOKJEAuE?=
 =?us-ascii?Q?4S1wypShdvwJHYspFOCkwNLlxoeup69gbyKcgPkJ7lk44cwUUtZEHg3jkaxy?=
 =?us-ascii?Q?HLBax2dQgPwnoJfEPMTqMSrJq4PYhT/E3ZukvqL51Qucg1AlgvGMEQvLBNI9?=
 =?us-ascii?Q?F0Edbv5CdgkdT9NOSWEEyPrioyNuMS7JDJlqa9W8SNJgxGmTsfAIHHfM/e4C?=
 =?us-ascii?Q?mf+8Lt5hjsa6DBWw2vaujPTQ+pLFPyaW+VjQvqRYaxkMClshE+zz6ImKwPGE?=
 =?us-ascii?Q?D5Ie5qJwEQUgFTBcpjWDl8nEFrJokWfPs3EJZgp1ryyu+VBSj5n7Glsiqas4?=
 =?us-ascii?Q?07qsOsVOJ4rqUd4O/vCmjDGdYpWNg4NoSt0Zjf3qImwFpwpdOWhOgmh4XJpo?=
 =?us-ascii?Q?+G8ni+2ybXdvjv8ivgReVfSWlvhSZfiXYzBrrJMZAadIm+0uDxiA96HQMSEs?=
 =?us-ascii?Q?o6ANlJ01CpDKmtaXAcWpQGCH15i7IUZwK60vRb1nnffWh/7WjIFyHGlO8Rcq?=
 =?us-ascii?Q?tyvwt8oy5EVtDbuKdD0XtULobAvcw8Kn+KAYyYdYA5it5h52t67WbkVWK7hz?=
 =?us-ascii?Q?lnJRn6kIe/k8y+gxb95+us60tIbyLW/kPOuQ74igYkV7uM1Obu05Nx+2RDuO?=
 =?us-ascii?Q?vyTnymYdBK4JRkLLkxLga3u+a7xDusHb1uUc0MZTHm/FsX2KA15L7+9R8UnA?=
 =?us-ascii?Q?BNfjB/w/vLPCTeqdIW7fgSAZRH+9drDbgakf9aphhfG6q6oWLfi3VCXQKY3Z?=
 =?us-ascii?Q?q9PGOO3RMjTaG3gcpWdh6PJIlbd7yvvfVUZOtU1mrY58qLT6vgAyltsZ9N7j?=
 =?us-ascii?Q?49tG+xc2hyk61VDLmQlc3ahdk2+NeZ0+/x1TEUgpwCFvLW11tE0cilqFVhMe?=
 =?us-ascii?Q?0oyVjix3SLT2ESqo3T6BIJcvcviUGmPzQixZw1wR78bnzvyl/u/qJcchDRTU?=
 =?us-ascii?Q?f1mMfOR0cmNBQrJrHM2e0E6K+zC7F2eqQ3QguSsT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f490298-63b8-4e31-b832-08dcb57da6b0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 18:37:25.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NfXyIPcxOvu55tuu0XH/glAwOgqq+iPugQTf7MLo8PGAPj3Zsfm7ROi6ZTHSCPL8Eo5kw263K3bzA59oxPSow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262

On Fri, Aug 02, 2024 at 03:56:13PM -0400, Frank Li wrote:
> Rob:
> 	I am trying to fix the below issue
>
> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
>
> gic: interrupt-controller@6000000 {
>                 compatible = "arm,gic-v3";
>                 reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
>                         <0x0 0x06100000 0 0x100000>, /* GICR (RD_base + SGI_base) */
>                         <0x0 0x0c0c0000 0 0x2000>, /* GICC */
>                         <0x0 0x0c0d0000 0 0x1000>, /* GICH */
>                         <0x0 0x0c0e0000 0 0x20000>; /* GICV */
>                 #interrupt-cells = <3>;
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
>                 interrupt-controller;
>                 interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>
>                 its: msi-controller@6020000 {
>                         compatible = "arm,gic-v3-its";
>                         msi-controller;
>                         #msi-cells = <1>;
>                         reg = <0x0 0x6020000 0 0x20000>;
>                 };
> };
>
> extirq: interrupt-controller@14 {
> 	compatible = "fsl,ls2080a-extirq", "fsl,ls1088a-extirq";
>         #interrupt-cells = <2>;
>         #address-cells = <0>;
>         interrupt-controller;
>         reg = <0x14 4>;
>         interrupt-map =
>         	<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>                 <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>                 <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>                 <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>                 <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>                 <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>                 <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>                 <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>                 <8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>                 <9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>                 <10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>                 <11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>                 interrupt-map-mask = <0xf 0x0>;
>         };
>
> the binding doc
> interrupt-map:
>           minItems: 12
>           maxItems: 12
>
> *The key problem is wrong split matrix
>
> [0, 0, 1, 0, 0, 4, 1, 0]
>                    ^^^^, there are *two* data more than expected 6.
>
>
> in def fixup_interrupts(dt, icells) of dtb.py
>
> if '#address-cells' in phandles[phandle]:
>       p_ac = _get_cells_size(phandles[phandle], '#address-cells')
> else:
>       p_ac = 0
>
>
> I am not sure why need check '#address-ceslls' in here. If set
> #address-cells = <0>, or remove #address-ceslls in gic, this problem can be
> fixed.
>
> But I think it possible dtb.py bugs, '#address-cells' should descript
> child node's address size.

I figure out the problem, it is because parse interrupt-map in driver
instead of use standard method, which suppose gic's #address-cells is 0.
It is not easy to fix it.

A simple method is set minItems to small number. Is it okay?

Frank

>
> Frank
>
>
>
