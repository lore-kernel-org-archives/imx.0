Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50764400
	for <imx@lists.linux.dev>; Tue, 31 Dec 2024 01:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607645; cv=fail; b=dci73QCJ2+0jFEfnRlmqYTcSsYYVNAR2BQtlRABLjF46jUmY5V+OYbpEMQfJ2vbptlY4BrMQAE2EYeZ4U+4/M1gkK2PEIxZ6NL9zH+BpTXdWCXi1Op2CAKS7kYifK9VD89/PoHaqZUB3QWeyMpAJFavQj2b8SZ8il9QNGnTXLUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607645; c=relaxed/simple;
	bh=TzqX/HVUk+knzCJyAkMfI//QK3r+PNrSRJ2gdS1qDhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a1BsUTLIKmw8nSHPpul8w4HmAkr+/1ww3wp31b9Nz9AFPXq0f9a0bvrBkI/0LU5l4CZ673Iu9h/wTTrKFlUtTZqcZnHbaba2NmX1mTQCE6groSu5et5Agx13GHuvdyiqZa5vJSmXf6GZLVUAwo/rtTu1vvf/EKRVwpZXnQg1fQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e0u3YT/R; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e0u3YT/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+/tzp5NPBFdXvt5KFxBzp4MWFYvAFLekppZqokTEiv0TYFwgt9dn5pbFJJOj7U6ysTki4DgxGwFyuc7hhtRdxzUIpGSczQl7ME1WlSSy1tY8okpcZ7ZGg94tR7578aF/wM4RHNQR75Z2az/3y1wxYLrkUFmPU4DrVpv7OOZ5Ksl6RWRUR4zdWce22MVZ61coLZBL3NG3zJYwZRvWbJqA2Scv7ipwVu42jII8HDMCjd3BWwhYcSuomY+Wxux+inwMtpIK9yJa2z4KHRjeErSfSUoIr5rOP/U17+bwTKSlTJJ1/lMFhb7tOgfbMKWweebP6GcQu69pv0bzy8+NVH0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zpcdud94VGd3owJrLgd5EuxtmvYQPWlMx9M9HLa/30=;
 b=lvWTwY41nAYUei6fSe3Qn4zzhMd5ar9eR4qn8Cqj+v57jxwCNsSc7wI80A9iMDcQkZHIQ3XkELMuBcfzErnwV6QICcyy/G070hXUspuFMqe+j1otnkArTdLYp/RFhVIDQXW4h59J+T3CFnNIBbXSywXM+cF3wiIJbdf/h4ghfvEVgsusVVNI9HilVIgPrb52GszylpTrf150hj+azysIQKfknrypJaTojKjzKknpI8c1dRL2RDFaGrfr+e206PR2ZY9yxE8JycxzEGeFIGeVFRkujrFFpWJfJO2BSunQqqPn+PypDHtOFdVLBLtQyHDS/9ffY3Lu6U1zK0G5/s0ZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zpcdud94VGd3owJrLgd5EuxtmvYQPWlMx9M9HLa/30=;
 b=e0u3YT/RXQjRQJ0is1XJR51Qqf41qw4F9aGD5Dkz2ZMBLiN7AA4NZa4qmUmUGarXWI7vBtPuA56ZQ72Ge0P1zUlMgdM8Czj9GmhYB1kT+hR33wh+eUOXKxFqoch9k4a3GlHh3E71q9CR+5nbpL8JQsO4YmvAYfRYXgmTcPNaXnAdPy6va/00N9j/5yIKBnxXjU0o0xIpHhSXhZJE+DbX0GPgPVLjYSnzFw3Td8CEajZg+zmn4M0h26mIPv+OzV6cVpj/4SLmDxuUSrzGXIQbDPwhSuJ/OLccaH2PKfAQJiv4u2sRJ1bQHAe2GsrJm08uboaJu+LO/cWlBnLcHFHhhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8597.eurprd04.prod.outlook.com (2603:10a6:10:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 01:13:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 01:13:53 +0000
Date: Tue, 31 Dec 2024 10:19:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] Make i.MX9 OCOTP work as accessing controller
Message-ID: <20241231021938.GA11277@localhost.localdomain>
References: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: f55bb36d-67c9-41c6-f38e-08dd29386448
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ISR5mGsFx+S2jch2JmJ2OOw5c9jnM7kGi3r7iTv2+SFBwz4/fOflHO830GMV?=
 =?us-ascii?Q?TVvr7lgc0suOMjTklk2DEDEDlPfMSfVIBtd0tRIl1B0vk67cz+DITRNUwycv?=
 =?us-ascii?Q?+XnNnnnPNnl3OhxnItwu0o2u1kWwBXNhjwHo1mgs31HR9k/NTKDrcEBqxuOK?=
 =?us-ascii?Q?y5vOIWsG2gZGaIIrZ0Q3GDMDTGSFmTRCF/Mpd9ZTNbe+57ZPFGfQLmsuwJDO?=
 =?us-ascii?Q?piOJS/oiyML6i90ExLKQ2zzpKMI/nfz+3ykbNu4rscu5jRxE0U1gtwDNTKC/?=
 =?us-ascii?Q?2byx7j8e98tAbDue8OVxPRKJmwciQ5qDqW0mo7WADEssDd8DKhHpT6tGUK93?=
 =?us-ascii?Q?tbFHelwb4A7v7ui/6PntV5QnrB36giC5/MUDPusvGpXWccDBKSL8uiJzil7Y?=
 =?us-ascii?Q?WgVWijOg2DyWf6kNYbdDiHel2tlgFeZIVi+ShYRAOlf4PIsxWBeTOz9nyp//?=
 =?us-ascii?Q?dQyTq7hr/uz4OiKjh65O17Tq7XvV4YoZirkqRU7bZ0SKqnViqJqdIAretapu?=
 =?us-ascii?Q?FqMBFbW2nICUBO8TsP+eaqMq5XHIvlrNCzq4Bcw3KPRFzaJEgIDUX6AqkS0Z?=
 =?us-ascii?Q?fO6F3EX6wIWWjggquXu432m6t+3wQUWyQ178ptKalOckBSBNCCygKUvlVvun?=
 =?us-ascii?Q?pGfOzTyPEmljxOkebgw8mMGqAbwwoMvk1F9BfklnF1Fd51xNQn3OAafvOQTU?=
 =?us-ascii?Q?3gKQr5pu1shzep9fxKYnJOTgw7FNMsDQLzCK04v8KK7OcLNNSCJsxbBtw3h+?=
 =?us-ascii?Q?EvdAnC1s3FmIt7FQXP3MQ0p6ndZl32hMKBDUK9IkWQMv/CF7cOO7HFrTudtE?=
 =?us-ascii?Q?DTuAI4YZZ3qFxx5qb2X5ILdVTfUguOiH9kQPa0N9H3WN+uka6E0JOlJzCW4/?=
 =?us-ascii?Q?JTwqWJP/05aJNu82q1VhbV4MlfUD6if7TPl29+/sb6Iv+JDyM8RGzredZqeJ?=
 =?us-ascii?Q?68yHWZHZ0x7PFkjrbxJqvCFy9TEYQCNHjG/kc6aTdqLNKIu7WcIKW4DRlbTn?=
 =?us-ascii?Q?5I3WS7XiuJYb2fQ0SyJicp78dJubUTfGNG2HyS8e0Z9u2vPNdNdT6VorhtZq?=
 =?us-ascii?Q?WN+h5ZByfH0zNoFbaGRTQagwairauetdZtc1ErPfXI+GdyB3OHydXrQlkQGM?=
 =?us-ascii?Q?QcU94agKlCJaXWaFLc5T6dcMx53zWpC50TIUqsL6JDNxMCem0l3uwf5ms1A2?=
 =?us-ascii?Q?DX3p3+KOpQh/vV9VsLt4wN/E0kfaF+R7fUvrKUpSFsXTCTb0HlYsaqnthoaq?=
 =?us-ascii?Q?h1FpHB/QUAH8vb7mox+McFWSJC6PXdT+QVddSyidvv6HfWQa5V8ZhW/0DWne?=
 =?us-ascii?Q?4siJfoPlcYtlvmRC1E8A4WP5macFOdCWrYE8FZIClQ9UA2mnuXIMXvLIjPjt?=
 =?us-ascii?Q?6Q+r/+BcjiSoFb1hZKxBn7X62N9Od0VNwhfC1Ba3lWgnWLWSVBUaWWCDhNlC?=
 =?us-ascii?Q?NXI9hOgOvMHzjtCE/1ajCHclTruc8phbtDceXiPSFXfdyKcAeBM5lA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DeGs78ZkNq+Hu3CoNA0QZ7eaveWV118HJvVBH1kN0TvMhecH0eplZWvSIZjV?=
 =?us-ascii?Q?HIvDIKrzgiY2ksueJAGGgfm4JgYv9z1KiV+qDyJtJx1eo4C2UD0JRiwO/FAb?=
 =?us-ascii?Q?D0mvsqbsraoAl7jKP1HlDov7iBXihBm73ubWYV+IzCzZdHVNWRtQKdy/5Kba?=
 =?us-ascii?Q?zxdb4mU72nGSb0TBjJGQ498Cx0x3dh1HkZSv7Y8q/vsAtL6Nc/yCRqIDv4Ad?=
 =?us-ascii?Q?7lBC1tjBbj+A5++LE4HiDXgiPQ/8StwV3+HwYteF1H+Cf/N2VMY8W7JiZ/rg?=
 =?us-ascii?Q?9bkXZSmWG4wczTPHoVsK8NAPDGtaJtacDKNSCsrmeZPcitHad2TO+WDp8nDw?=
 =?us-ascii?Q?nCYygwUr1qEYkOZgtdAn2akKvHCj3afn9BZqLZ/j0yb2HYMI690v30i/Ah72?=
 =?us-ascii?Q?gjjZdKYQI1bfDjHvV+70Cp7UEbUcfMD7V2dB+1EtxX7+Fhwq+sqkIeLv/fcU?=
 =?us-ascii?Q?wrYH4bymVgEzs3vpBWSEkN/BbLKGXivRfzU/3uW9Rl3OiDtIHTlzH5s/ACDd?=
 =?us-ascii?Q?RP6QoC7RMbFy/nO+fBa+hRhGgIYuCtLfc/TcyzHWt6TtrDGYIwzOIo14l6TC?=
 =?us-ascii?Q?+g09LXRbeUiS4wkNf1GS23U6GLEIz0E7dNqZwHgBMGicSubvzYTiwTL3OgFK?=
 =?us-ascii?Q?OPmTDOIOcMgko87mWtegY3uDpvmGfloiYsFuy4Lk2YTzT/rFNPNKKtwHOy/G?=
 =?us-ascii?Q?2HcRdOFtslU+7tdUowwiEcbnAyrOgjwJyjgWf7DGJAY9nmMgZIykskr9pyS1?=
 =?us-ascii?Q?HyUe6n97gphtBzTlS6dBwzIvzUOC6JwO9Qzpsp2P/6opDqk6Vos/33xo9DCr?=
 =?us-ascii?Q?z/1uYUZBP8bZX+vRa8szGOqgNdFQZjFVKmheciAJbU7oqYUIKYzquYRgwfz0?=
 =?us-ascii?Q?cDEcAXfcBgbaqlZUIK5A7FTwaqHPvCxjvbtjQy0r9NVbIgvmU4vYVAwrGg76?=
 =?us-ascii?Q?ZrdzeXBk7vIiLVT4JB9zpe/yIXKnJtYnosbt4Xx9NFwniDQkDJigez1O/mds?=
 =?us-ascii?Q?T10QFJdPsW7CgU/OCUiNq88SuahbI+YaAZKDtGbfdkQheGv6UvVMdomGklJc?=
 =?us-ascii?Q?1u/OvvEnyzBDoz0Yt3gAauDaUOWFxZ1G7BO4/ntdtkW6wdQqfWwhnhbkeDJH?=
 =?us-ascii?Q?3Y6azAkaTeMbmT8l2ejXu4Mh61JUghl8Dil9XWYA+s64iRSKQLMq8sHOKJdY?=
 =?us-ascii?Q?iYAgizJi5HMWUo9ohn9jj2SXt9FUTUrcmB2CDXNFYuCPlwO3k1Y46lrMnzei?=
 =?us-ascii?Q?tVAK/5UzRh3IvQLZ0agAIxIJ499yGYYKbqZRDsrxxMW/v/DhOKGQf720/epv?=
 =?us-ascii?Q?19n5k9at3nQMouvxBv4KeYs0yB+mnTLHCk5qSke7p/pTtJSPR9CjP5c0+aoe?=
 =?us-ascii?Q?G2AlAdtImF4c4oVYXKR8sfFIuNG7lfy9whY/oZGFIipmkPn+ILmY6eeYoxqL?=
 =?us-ascii?Q?IEOcgBvHNI+ZqpIm2oNxokigtVqVJBOXzRBiza6CfrIPye5uAkUyCbNuKoow?=
 =?us-ascii?Q?jZ2SPXL/cUKfYUgp7Mk4vg97QeAxgS+0OVPC0+XSUn/4QKsFec1gZDjKKpqo?=
 =?us-ascii?Q?zJn6lAA9+w4xULl8Dhwj9mPzsS/ROflO9L1SgLRp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55bb36d-67c9-41c6-f38e-08dd29386448
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 01:13:53.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bh6QFs8i4G8vZXBeR5E7I4oBxWXMLlVkly11MnL6l+X1YEbd8v7bEPfSlEN8V7GB8Rggpv/2Rmd9J/J3vQtdsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8597

Hi Srinivas,

Is this patchset good for you to pick up?

Thanks,
Peng
On Mon, Dec 23, 2024 at 08:46:12AM +0800, Peng Fan (OSS) wrote:
>Previously there was discussion on using "feature-controller" or
>adding a specific node to group the fuse information for U-Boot to
>parse and update node. But rejected by DT maintainer(Rob).
>
>Since the STM32 engineers added access controller concept and landed
>the support in Linux Kernel, reuse the concept for i.MX.
>
>i.MX OCOTP eFuse has some bits to indicate a specific periphral or
>function is avaiable for current chip, for example i.MX93 has variants
>that not have NPU. So introduce '#access-controller-cells' for OCOTP,
>and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
>that needs accessing control checking.
>
>In OCOTP driver, the nodes under "/" will be iterated, and checked
>if property "#access-controllers" exsits. If not allow access, detach
>the node.
>
>In the end, cpu nodes should still be handled by bootloader.
>And I may also update i.MX8M to use same method to support variants
>if this patchset is good.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v4:
>- Add missing of_node_put(provider)
>- Typo fix in commit log
>- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com
>
>Changes in v3:
>- Add A-b for patch 1
>- Use scoped API when iterate nodes and address build warning in patch 2
>- I am also thinking that to drop patch 2 to let
> bootloader to iterate the nodes that have access-controllers property and
> update the nodes before booting the kernel. Then just need patch 1 for
> the binding updates. Anyway, comments are welcomed.
>- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com
>
>Changes in v2:
>- Add R-b for patch 1
>- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
>- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com
>
>---
>Peng Fan (2):
>      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
>      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
>
> .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
> drivers/nvmem/imx-ocotp-ele.c                      | 184 ++++++++++++++++++++-
> include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
> include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 +++++
> 4 files changed, 255 insertions(+), 1 deletion(-)
>---
>base-commit: 6d13015b67d58ddba56631c56e0a6f376ade0867
>change-id: 20241212-imx-ocotp-cbef304140f5
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
