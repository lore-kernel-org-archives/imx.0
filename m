Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8260383318
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757517; cv=fail; b=PKImw5EHFBlLANm4BAsE3H3s3HC7VU6ZR6SE07DTYM9q4gJv/DHFhj33E6EhkRuomOib9etH+7gvJ9dbBk6Tm+VEfb65V6ngXeVhK+tSzvSblNXMbXWWOmWYtqmluOB7VLO9nILgLXxJIIU+qw1Vvnn/J8aJqz0Ke/ehiCXTDAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757517; c=relaxed/simple;
	bh=pLgjF4l7/wNyaSxgRdv0BJZpvUqCt7kzodzxalC2LKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MoKXQh/tsise7jb/TwjYnkKPMEhV/uaIqV7qNVnGwkTsISsfCd+BRHTI8FEncZpViyFK7038RjRxv1TQAa3ZA0SbX8Bn19fooQa3HmNEu+d7ulXuWsgMGbBSI51hQ0CDXHSSVEnmTA2lp7C+pPiJyEH3XzEgzelQg4MSYp1Ztx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QfIzNuqU; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QfIzNuqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wERaE96RtRGST0nnDH5uPGya3X/SPvqRPzZJNSznQFTY4jx7v30BfB2u61ROoHoHSvfg4HWfWMz5FifTh1vUucUm83N6BrkLj2IoMYPNRm8Liw7tnnZ1wJt+kUNVxsS0s9r8+joib6Q0mc2NIb+pgXkFWA9zReo81+PKnZDTrmzPhwzqsPtjaE1WnJYR7HkKtT+FgD4Es67pw4ql5jttppjG3IVihyTn+NO4Q941+KfhTkhU88jSZtC+qSREBmSbY1+EYwZYF/BtdCWWoif9f51dQvCOvNea2J0MzbDghl2gKjhaJ1Zb56/uW0TrbAYvZ3bZ2DmR1kK/az4fKhxcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5c8sTgkQLrAjJ2Aptku8DAQUuLWIo8D4bZfP7gsboc=;
 b=Liz8Xcf0+RfGz6mDNzFURWpQk63HN8r732R9+T391H2jB8kmMtTggoTIM3Eo4cMoKlBXlUA0I+VjUuIvurIzGV8cUNjyZbmh63x7I3MnSeYLmxxVRQCDur/RUp1ZNf18QxhIh+b3+/XGUD8R8eNaX66nPXhKkZr9rhtNSJtRwt13ZoJnWIjLMguviLtMWXWUghkn6/hZvTJ6OeuZBwcO63nQha6Z30jAygSWUNWgXTGnj9gkOBc5POWPAWS8Ep/77CmkP/fvJ6joPcQOZZHPKhRek4xYXvAMa8jZzKUBWZzrfTcfPt3FpCf/bm27KsDj/4rRmfoVISQM8nHxLuiUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5c8sTgkQLrAjJ2Aptku8DAQUuLWIo8D4bZfP7gsboc=;
 b=QfIzNuqUxs6/GuhesRNbockALkj3Rd25fnbvumrmVhthob+NyE/4dRaMmEZD3H5wu1FMRKFBHYGaGGiAmWpmDBQzUrvM6jp3nEwr6xs5hHPJNRRqPHphH2cPRUPhkCTwRnlPch0EKKVvc3mY1DVmt6tRJ3/43ogzIM6sakACy8j8kr3IlDgG58CmDFI/Sh/E51DTRNdriRd7fPIwtupht35M3IDnRz4ekwhE9IATiMRAcQ0Ewf/CgUGfraL6Q6M7X9G52ednbuPbEAdaQtnogVUGDpK07mAx08TTZP/r/hglkE9zS8vt+aX6253D0UfLVmReMePs7+NU4tzk4jQzqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8683.eurprd04.prod.outlook.com (2603:10a6:20b:43e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 18:25:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 18:25:12 +0000
Date: Mon, 29 Jun 2026 13:25:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akK4fubaHtjViXtr@SMW015318>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
 <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
 <akKf_akO7IZ2ltHd@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKf_akO7IZ2ltHd@Lord-Beerus.station>
X-ClientProxiedBy: SA0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:806:130::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfab224-ddd5-4975-f3fb-08ded60bc252
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 ndi6QkvAoYe/2Tpzq72NSqx2mE6cqJa3TI3ZTtITGMxBi+jE6uRkWQz09S8CRVehTJ0Tu22SJnD/8TbGuQuCeLkLcZxWbfelPcgA9W4WHYbVX76HYD9cI5FtUYWCrWqWuJiKHXv69HmcXTAH0pAF2SaH27NWodNPTwQ9jANpozWdHdzkf/Kaia8Hrzj5JbrzvXfIKQY15Tb9Exw9US/y2khiMtk9WLfW8mqaWuA0GhPtTeldGYNytxMLsEYGm3JWKrUxBYzX6JiO1cL/ey2QcGL5JoCjSJTmgjsVa263/jOPLSE7eaHZNb/kpXSLv8W+i+HwA3AMuBnJUzzr9U8tyry/MUk7WkphRRRejjcwhW+Lyunj/a6gUKJ3vjy7rtyesKmtus5iGTa/GhIL8Wibw6YkUazlLn/IA/gsO5Rg39tiiBGdgCOQkO1Dzi/G9xfyck4eCqLPmG7GbFxiP9BwRst+eeL6u8hJcZ8oLO+gyapSOHdzPIWc7sUw0Lc/smT6hsDtUYf+lvgfRi2wji+XNJg5TXa9TEDOCy53PHl/7taK+y4GfBcheGv40WOWYUx/PIzznT74a+hUcmyRxYNtzlMysRhlT1uJ3Ma63R+tmWB6kO39nuNslE/EggbQs0DNw2/rs/0FxPzsUn9Nuj9gyVOWqfv2MaIgOsai+E4qiwM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?E3Z2SKxVdmNGesm1lJdK3H0/Cb/JbFZZ0GFH4qi1RSALSLny6oAfHrvq82X5?=
 =?us-ascii?Q?0kdRmhdNaHn9k5/Dic0FDsluIzLvMMtoac52H2jI7AFV9H/SbrBunn42ASNO?=
 =?us-ascii?Q?O+KmegYld7yMnv6gqYl/mZ8CtavoSvr75LmsUWnfQAnJ73t2ecx+Xq914NKX?=
 =?us-ascii?Q?ebxNQ4J9RnWAtNcT6gKwEyPoKlNe7nuY1V1z8stL4phGTFXRPCA2cz7MRurG?=
 =?us-ascii?Q?dtPe52btEJI5p+RdPw0qn9/pbqF+ub3KGLqkoxP6p8tXJvmeggk1EpuDJo4N?=
 =?us-ascii?Q?V/uPVo2fE6lBzwTQSB6uRH6b2qd7CypfuroFDq8OAvYKc0PqZ2Ku+yEfrrRY?=
 =?us-ascii?Q?05DK7ktZuq40JXqQh88ecMXzCXkfAggV2O91m+ZCVvrmkADcsx+Xrkmq8zTp?=
 =?us-ascii?Q?l1pjmde4exEwvNlOupf/gV6nZrWRYb4TUmNeMCvsJNbDI/9HV5scnga8hP6f?=
 =?us-ascii?Q?G+NUX9YlGoOn3FdulCM7N4vqCdj3+VnZDSMypo20Mm/NEileuNpqMErmUH4V?=
 =?us-ascii?Q?iaf+7XmCDqzGgMCEZS3EgZKMf3cDpNVqx5sBXikz5eFVgPHZCVsuZVLM5NJW?=
 =?us-ascii?Q?8yVDsIKvwAfHy+u8aKzjlunSZ4Ayx7RC8aEALNIWdkX0Xi0ZqdDiaX7r7H1M?=
 =?us-ascii?Q?D8L8Ax0umBvyi/1t2vT1YUBAPalg9c+0GoM2gEkX/xbTTKGd2l++VwsqgsEc?=
 =?us-ascii?Q?B+Px5wctYwcYWnf/0bQtiI0d8FEj/THG7RS7VeEw9jd/+mnKEcIuWAv9sabk?=
 =?us-ascii?Q?l3k8rmiUJen+685oyHmXWxoHiYxpf9VqwTMQbzQYX7ZKZv0PhcjcNe5fSX5V?=
 =?us-ascii?Q?OeoIn1wlbBLRvJTJlQHYbgncm5F635ZtLtXsElOc0oNKcgeAv4hm3Citc+j6?=
 =?us-ascii?Q?xGDA1+fx/1RW+YKzV084eBjzP+RjOJFMLvT6G9HJxjyP7Me8+JmuYxMPrrDo?=
 =?us-ascii?Q?a1loX0XeyJvZsnwIiJCvJiqBqbEE4wSZW3nvrye4H9k7Gf6d/8QMVYYcoVU/?=
 =?us-ascii?Q?DMUyEMc3vFN+ZweuGyMmmrMjnARHbOjeEhu+c//o4VhJMSEVzpJ3OXrjAzgt?=
 =?us-ascii?Q?ISBxkoLnhCeRt5Gr56eivKjmrF8TUK7AGxaHDTmfhk0cpBITQYUg//YUQ7h0?=
 =?us-ascii?Q?MMw1MsG+YPznjXDf7f4hgKlvbFNsaaSQmc2x11oh0wH8k0gfcKNB+t9+PfSY?=
 =?us-ascii?Q?fVqjZgB2ZfGZOOGwE6tgDMv8qLKSaYHKhTsUxQwWr13k3gHBVNitiHyzIzpr?=
 =?us-ascii?Q?q/6peLFapeHjfYFvzZrtz8JR4UecH0yg2MwEZCXe3AkdWKqFpTlxABQGaCqy?=
 =?us-ascii?Q?qiygqh6KbnjDozig2mX1xGm6Ni9WTHZTD3R/zIn4pfIwZnyhFozqkbCWjcEI?=
 =?us-ascii?Q?pL2OHL/LqfZ/bYg7uztje1LnBcOGnRVJKWC5qxCYmDm30Pik1ZcE+6PYbfC3?=
 =?us-ascii?Q?zBlhHXA4/f4oIUVYl+Tjzdq/0dCisQ0F9CYHBuM3RrIqnDBfk5UNYzG9SCaJ?=
 =?us-ascii?Q?SzNQsyTmrNlrl4S86wah+FYlCRmozkZjqpjE1LxSRSu3oX7SiAdup9L+jq2c?=
 =?us-ascii?Q?ACdwcln04srLtD5+Bvx6UYLsX0A+YT7qxcJKI14U9ucxlaava8vjXzKw8PPm?=
 =?us-ascii?Q?9F/hLm9kFfSzFRIInzkuGQuhgW2+O232UMxZilbmEtWokcABiQsyA4vcgBhD?=
 =?us-ascii?Q?X3o55dwfbtLT8tSvYX9LzVE+B2CMNahKn7xhPmDl8vJEZGoYJzx7mVkZcQG9?=
 =?us-ascii?Q?o35IpCo0jwR0IxSJjpuAc0HLFGCkm/G2T3iGdvhXKBgKOin/6yhP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfab224-ddd5-4975-f3fb-08ded60bc252
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 18:25:12.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JIVj3MZFURrYP86V7g5wbCHFusjkpHobLG+GiWg3ldaj0kXQz0JBO4pnWWE/Fy06Qq9vkKTYY1yP6XkJXZAKd74mpTTDboi+KC5zVotlniY0cpoyHwSSz3jorILfpVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8683

On Mon, Jun 29, 2026 at 06:40:29PM +0200, Stefano Radaelli wrote:
> Hi Frank,
>
> On Mon, Jun 29, 2026 at 12:30:09PM -0400, Frank Li wrote:
> >
> > You have to provide all clocks, otherwise, whole clocks and clock-names will
> > by overwrite with one clock "ref".
> >
> > suppose CHECK_DTBS should report warning about clocks items.
> >
> > Frank
> >
>
> thanks for checking.
>
> In this case the SoC dtsi does not provide any clocks or clock-names for
> the PCIe PHY node, so this is not overriding an existing clock list. It
> only adds the external reference clock used by the board.
>
> This follows the same pattern used by the i.MX8MP EVK, where the PCIe
> PHY node only provides the external "ref" clock together with
> fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>.
>
> This is also why CHECK_DTBS does not report any warnings for this node.

Oh! I missed think it is pcie node.

Frank

>
> $: sed -n '/^&pcie_phy {/,/^};/p' arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> &pcie_phy {
>         fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
>         clocks = <&pcie0_refclk>;
>         clock-names = "ref";
>         status = "okay";
> };
>
> Thanks,
> Stefano
