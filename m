Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C829175A83
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303617; cv=fail; b=OOrkGxhE5nbqhFuMn72oLLwxBWUYJuiBT8seTSOqaA+h0yd1j5g3mRI1uoGcDYU01yaWkhCGWipD2vSFE0xzx9+K6EfiwxHC3ZNoh0Mv5QYGcabAd6MjKTvdjDu7rGknNnmD7Qm7EnraJFphhcpG1Q1on3qe6dx51WBaN9hg3zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303617; c=relaxed/simple;
	bh=NqNjaKtjdZDBnYiS7EnnDGV9EgF1xf22CTj00LqKcao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pyD2533xq2F7PdeuDNkr+0GrquJW0lH+hvDB9RqAYVGcOZmU3mVBC+cbHEJXWe9KgePPjGYsb3mc9lDuHOlBrhE6kO1rTqb6duAdGRlSqycSlFOB/4RPqQ9vbQIGYvx2n637+CAeP56qQjUveH5qV71luLyitKSb+SglZBbRXbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=toUgkIFk; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="toUgkIFk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5NEpqplXbUmW3i1Df9AW0itntlrzMjTi6Z/CnLAb/Mu+Y2C1Mb1fBCh6h4eASVPNpwrYHRGiCLvk5h8XPNY6LY93j3VHTR6JfXTonxowzeTOCkZsTp1swg8r+e8UnJKeTNiNhoH16qZSlzJyrEyrVlPdzBh0ogvxH9N/LX+toW/L6QGV7wBp7NLumCIWIwtgbvGsaW7ihKFc3cQQBCwi3ib3ZoC11MTJkZxAeDvT6wG+8GQb7xht8PLHGyfcWV6rJR5hTlTtnPffSgEsAvGA8n43SoUnrz8U1x3FAX3qYhRrUlTZ9KTCH/XQ7DUWcUHKgZcQ4V+EtLNWtxPaDtXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9PtFBKONkkxF2iv7PJAwMscMUhm4BjVVqn5L+vLsak=;
 b=XoHPpFp7VPb6jLHt7zkk4a2NG4QGFGK8Q0R1VHzN+45jGRY6d3CQcz0EADR2QhUxyVUUF3cRuN6cOb9rLx0ztuVr9zlB0ZlLinftYCvGeh++c/V9dAu+LYjjMl5RIN0B+gJkwYitnfgfUNFayCKyHaIoAX6KB38MjxxUC/1IIobDXttunh5CXqGkD2S+XdseNbKc71WoOwQNxUYpmpbS3pr4ZFz6koGyI2ulZo1dx3wNH10y1Ci/tXumyCvQbNraReJMTEGaQEW8hx4z1F7SZminaIxD0BQjv+/A9B7NartXxQmCsM75jOQyvkhStHUAvbBgAaQ9L4A9xoMWGDVXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9PtFBKONkkxF2iv7PJAwMscMUhm4BjVVqn5L+vLsak=;
 b=toUgkIFk/tjPx31O2Y9UdUVsmCF+exT0pnbN2hUXA6N0NyKurpbWLA7oKClN4sotrgSDSi6Lc+n2aeMxx1aMmz09cEUPPlGD3XyJB58M7rohxZyf1vNxjhP4czilxICbq5JnIAPSW9zh+o4QUOFrQylf5X/NW9pCrokIx9SEguL3h6Bd22m8bivQeeaQXJojQpwHw6j4xndZP2xsgNaIpcCrmdYC2sxro/J2KMNx6DpfQN1420tdAtCFsAdi9fF5iNC3bNciuUFYcMwzyeyIMw5h6btZbvU21FonM/aZACEk9U554NkwOeGpF/ztKh1GxWEvTiiJAqoJbyF5+u5u9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 15:53:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:53:32 +0000
Date: Fri, 17 Jul 2026 10:53:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: Re: [PATCH v3 00/11] arm64: dts: describe the Lynx 10G and 28G
 SerDes blocks for Layerscape SoCs
Message-ID: <alpP81Et1Z2qWEH5@SMW015318>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
X-ClientProxiedBy: SA0PR11CA0168.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e3d8ea-03eb-4c34-197f-08dee41b8d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|56012099006|5023799004|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vfjeJL38xAdM7wtzYE0duMGUa8hRtmtSzBWA4W3aa6+ZqXYlEnHIRt/Bc/06NRhJR7E9V+VLVXlEvHwGuPwqwAgck8S9Mpo2fmMQhpjAr9PP90wrwSKPKnnOcT5juylJB5gAL5ZPdqjTfdffe2gXI6zYpSuJ5ncpX/je3D9EClhmgP0OWfHwqROTNekan/1H21d3z98w1KzXb882u6jpDiqagePSz4PArGgAv2hyTmnXV9CAPGIez7XzAagqFb4yyHLHhtnDiAcFSOQTsdMo4uUJZPRpz/G9aGp4Yd+whq4c90YiypY7me7A6pQitXTQdLg6d4cD0UIeElNWCbPeMfb/xG7OO4/M7Ap+0X8bTGknzwkBANUvsFm2AF9hYj8hWSSfMj1fRjq/OPfn8gB7MjdRYtDtxFtzz+ulSuqfPxEkpjmiWRIwvaderqoIflrgHTCH60j1M0YiJpcSRyp9AU53fqMiPe9GfAK1P+epkQH3YvZL104f7br94AGFw4W7eqOxg0thOAeTptKJFJ1EBoEqdHWj3wp8566o5j88SGDh0JLnFVwQQRVchJrJy/HQPBwKhS2r4uW8dIL1tzFFLsefx7bD9NYNvdnmthAubSa0v4wsNUuYMqseS3M9l47f8du7bNzpC6+vj3hMtRFCgeLtX2EDA9FPz2qoN5e6IJw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zm1QD8OWc652EZ9vVu+53kdLAFcCETrB1AptZlH3lJK1BZeWyJFOEO+AA6Ur?=
 =?us-ascii?Q?Ks6X8YeTY1A0nlG0Tq/7cv7MEisZQOSTiqvcvuZbG649b1xO91y/6DK40tyG?=
 =?us-ascii?Q?pOE1tMfzI4Fylba8sZm+vMrrLyQrAZD9UX9ObYBzwNjyx+dLz0KZqRKZtJN7?=
 =?us-ascii?Q?EoHpRHOM3qFK0iYZ0NQJQDz6tThyvMIuUHP2qvF8FUQxp74Se6gzfpMOZWu2?=
 =?us-ascii?Q?LI7sJPxNjjQouEErXwmWOzgyIWU+xVq/j9/O0jTqd3Mb8eCuYdF35r5i8JBG?=
 =?us-ascii?Q?Wn1K1wfJtoSl78HT81TPvN7HPcfyvngvMlzeBTJbwcBUKm80VfIF/q4rsqe4?=
 =?us-ascii?Q?amdFeyeS6CkXfPPcdjzi5voov73Yhirhy0BzB9INUYNDxzCTvvD03ctRtIZg?=
 =?us-ascii?Q?GDnTZCxiXv6+aMhVOpy3CGAkHUNLvb1mnF11hbvHsf7Yey16ujQuEanLi0Zk?=
 =?us-ascii?Q?cbEaFRnvSAZCDlBuYSSaSXXqega4BqZDKJL687G7C/wUuSzRdC8SX4+Pd6Vb?=
 =?us-ascii?Q?QW8xhpSx+EKGrBO/5ev62+we2XruAt4pjwQXY7kcJMSWtMxqpzuH6lsqsoq+?=
 =?us-ascii?Q?CKkAWRAAHaoeNNhAwA29p3BTfa39lVsbwF//dqhN3VQVd+eAZ68Bf3+LgNtl?=
 =?us-ascii?Q?PlKBZJ1aJylHYSKsdC7f4KGQlP3sHMOd6OZmiUor612fvstn810+bnb29SvA?=
 =?us-ascii?Q?eq1UoPhf03+PzTh3oQ1JKehiLruBffeckkaMlg8vzRODUza9q5piroDsjP3e?=
 =?us-ascii?Q?3IUFKfidlF2y3RwL6OBIpoTYG7MNwozFINFNr54C7TkL0ndTFqOLKaeAtPFS?=
 =?us-ascii?Q?eGt/n4t/N2sN26Si+6V1u6AxkDc//wutBgyPyJxYFHBvli3wSJYpNJpiR0mi?=
 =?us-ascii?Q?kz05L1Zvr4v7RGCGoi7t54lJ66BoRdKseaGNKry5umtZkv6il+2YDxMmoDYd?=
 =?us-ascii?Q?sAt6G05K4P//lbCwQ+vFX4MRrOjK0HI5rLB5UWHs4g/UprlxaqQg2pN0RPfu?=
 =?us-ascii?Q?+dO8uB6vQ8c8jwiPhKablLkkNMJsiCypte6GJgz4yenqFTuO9C/U3eSzVTRf?=
 =?us-ascii?Q?1IwMJMk5kl6eGbQ+tf+ruxqx2lOC5BOswMrGov8/wuitP9jL3KEYOJLTIAUX?=
 =?us-ascii?Q?vupgKLTfyOgtDg2rCz9K8Mb6+k+MYJGKsUhDx6uX1lUfAReu6gyOinv7RSyv?=
 =?us-ascii?Q?AhG4bLT81D7Hz2jD1x6NIPhN2hT/aDXGZio+atrwOFtmqHJErlqP2MceOPP6?=
 =?us-ascii?Q?YmBp8s0BvUW9ccDIVYxjR3lpfXmCh5QFFWj9tNzAmhXuqlffjXgEMe7z+djV?=
 =?us-ascii?Q?cRCrlVmbq6Rr5FqW08+kFmFqOLQo6ECGbTlG6ucr5lyVK2K/xpNCq8dDCQK5?=
 =?us-ascii?Q?r7p/tJdLBSDfRhvM90z278YHfPNyIRn6i24YPnF5aZ8KDz+Wx5JWTJ8BMaRd?=
 =?us-ascii?Q?AAUT71Ku8PeVKgtLSrB8bmiIe1zyKlT/Jparo/GigCTlrFZ4LbTZfZxjDkim?=
 =?us-ascii?Q?iBA9gi6OPEqYXawPmYmLXL/jWc8nXwUiH5qeyP/D8GhyrZ2dDHYMopr3BU6I?=
 =?us-ascii?Q?VmQUP6ABaCb+2RvvgeHIA1FT05cocemTbN+6IDtCXPv2U/E/AQFBUsAoVcrh?=
 =?us-ascii?Q?BaIBNYCm5L5EqDQHAWkTP4AbDR+6fVyFRFtwUipRb5GV/33EFFBU46UIC4Ey?=
 =?us-ascii?Q?pyS8kiXEzWtN0H526Jh8Kf5WhFRdPkvyfVbptwRmc/20sjN1LHl8hmoKm0XU?=
 =?us-ascii?Q?9ghqcFMHDSZSFtjjfyMMGjfrv6UOyYiFITNvuGY6kEvJXZh9jWL1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e3d8ea-03eb-4c34-197f-08dee41b8d59
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:53:32.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIx40t6G6B2/BmvCXuzY22Alg1OTEfPCfWP84OIbexOOO/Nw0dWBu6Z81F5nON3iHyKxhGrytwNmmuW5kAKtY8Xjj4elpiL6t4JqUgNC4kw0yB0gpmhh7Cicpa+yybfs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106

On Fri, Jul 17, 2026 at 03:06:24PM +0300, Ioana Ciornei wrote:
> This patch set adds the device tree nodes for the Lynx10G SerDes blocks
> found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.
>
> The first 5 patches slowly change the LX2160A DTS support to a new
> structure which does not use any delete-node or delete-property
> directives. This is a direct result of the discussion with Frank in the
> v2 of this set:
> https://lore.kernel.org/all/akwAmzAbtg0Ejey0@SMW015318/
>
> Patches 5 and 6 transition the LX2160A and LX2162 SoC dtsi to use the
> device-specific Lynx28G SerDes compatible while the remainder of the set
> adds the SerDes block descriptions for the LS1028A, LS1046A, LS2088A and
> LS1088A SoCs.
>
> Changes in v3:
> - Changes how the LX216XA based SoC dtsi files are structured.
> - Split the enabling of serdes_1 into a separate patch
> - Split the LX2162A changes to another patch
> - Move the status property to be the last for serdes_3
> - Move the changes to the new fsl-lx2160a-serdes.dtsi file

Overall look good, let wait for some days for other reviewers.

Frank

>
> Changes in v2:
> - Enable serdes_1 on all board DTs that has consumers for it.
> - Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
> - Remove paragraph from commit message which mentioned some consumer
> changes that are no longer needed nor part of the commit.
> - Change the size of the SerDes region to 0x2000
>
> Ioana Ciornei (8):
>   arm64: dts: lx2160a: explicitly enable serdes_1 node
>   arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
>   arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
>   arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a
>     separate file
>   arm64: dts: lx2160a: split the dtsi to avoid delete-property
>   arm64: dts: lx2160a: transition to device-specific SerDes compatible
>     strings
>   arm64: dts: lx2162a: transition to device-specific SerDes compatible
>     strings
>   arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
>
> Vladimir Oltean (3):
>   arm64: dts: ls1028a: describe the Lynx 10G SerDes
>   arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
>   arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
>
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  29 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  60 ++++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  58 ++++
>  .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  98 +++++++
>  .../dts/freescale/fsl-lx2160a-bluebox3.dts    |   2 +-
>  .../dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +-
>  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
>  .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
>  .../dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +-
>  .../dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi  | 176 ++++++++++++
>  .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
>  .../boot/dts/freescale/fsl-lx2160a-rev1.dtsi  |   9 +
>  .../boot/dts/freescale/fsl-lx2160a-rev2.dtsi  | 188 +------------
>  .../dts/freescale/fsl-lx2160a-serdes.dtsi     | 167 ++++++++++++
>  .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |   2 +-
>  .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
>  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
>  .../dts/freescale/fsl-lx2162a-serdes.dtsi     |  86 ++++++
>  .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |   9 +
>  .../{fsl-lx2160a.dtsi => fsl-lx216x.dtsi}     | 181 ------------
>  .../dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  | 257 ++++++++++++++++++
>  21 files changed, 974 insertions(+), 372 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
>  rename arch/arm64/boot/dts/freescale/{fsl-lx2160a.dtsi => fsl-lx216x.dtsi} (86%)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
>
> --
> 2.25.1
>
>
