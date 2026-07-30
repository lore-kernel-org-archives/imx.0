Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36328407597
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423081; cv=fail; b=T757EeswPHmFPQXuoau5U2RoahBa/Qcty3UEGwSrcBnmCsSOjcXiNzzwH/Cqfa8IZ5l84E/0NeEBRzV0bEJOQ6eKcx5lROp+I4L5BvKG6ctnQqVkLoPa+KyssAYJyFCheTZ6u5P+F5rYbmFw0S0Ak2u8SSMcujmXHEsvJ3aju6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423081; c=relaxed/simple;
	bh=d+MV7t2o23TnaFR/Ak9LlS5bCrlsBXwiU+gFY2B8Xic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fg+X76pI7Ny29hROqTUQTKzx7zR7nL6gSy2IYVCtHmyMlnjaveDv5ktwSHnsnbNoNFuW7/68j0M9ewPcSvoy+ETkodO9bxAU+CP/RFk6ZyDsHBjKUdrpLx6MkVDaf01Kb72dpUaycqzTBPoKDx0cifnfmFtvWiCGoWUiiMyz5uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RBrhGPe0; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RBrhGPe0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u87Zt2btGpaXQmcGiUjX9JRdJR4oUOI5oVPczOCfI8SyjBOHVh/jCG4SVN3VtrU2nAQwIsUH+JswtY4XiI0S9jYkME4rV6IJulEVkwhj1EUF8Brp0IEBF4+xd6383i95jHrCJ4kLj6YZ5BJ2jeiYh+jGB0uxLyhgo6hmyeO1Ms9UAiDdmt55Ri3JVDO9ZvIiPf30cRDKJQAO+cZ80scWeG/8dIvsoq/wyaIcrG8iiCIaDpU3p1izcrEt56oNLwEJlCGtLzr0mtYicHFzYmmne9Bqecp1FrPXeJiVFA05wPk8M33LkhiMpoanqPEHqwQJWBkgX/erC9H1oSFXhPRfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3CdtuI8tz7+skFn9ch4nMgYwYMvHoPyHAjfV9QPMzk=;
 b=NxwA1CVHxvQqgU8t2wGK940l6yiksiZFQ7ChUjFLt/PGfcQIENh63w77zy/Hq1W9iN7wlx9xNRa2sBzmoBEF+gBoADHP6cIargWEmaYuqsO4pEGi0nj1/wRQXz2XY/39ZNd61Txg9Agv/U0/gD3PAo5Xb4iNCow7WGRD60XiBpO0RNR/fuB2/7KiXEAh+ermUTi24ic3e5AFm7xKvSTtvX1j28kRYLUT28QrHjAR3bloh9zmpDiO/FrT3+32kCK3bqGt3I9M72ijDjHncfJWwSjVuwwJzQRq9r643s5sJ0EWf/TV5JGVe3OIU8+IDPoFL3yf2n/O1Yr6p0CO/1wOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3CdtuI8tz7+skFn9ch4nMgYwYMvHoPyHAjfV9QPMzk=;
 b=RBrhGPe0Lk+SVfPV+5ATCSLo3Jymlx4MMjCUQzL/zwExqLFbO57IXfaAsTiyEM3dI7EGQqlbMpt7Qo/dBlvBrpJY7rueWQXTJG1VUmN1S6/S5LCNjw1/l8ymykaL2w7Fp9B/mAFB8ABafP9vC/A+Vbn9xe5XRyQEm7Wj0dR9tOzf9GQLcUHFzIq/bLPm+NFBtGeV4b3ee2ERSFnt+YqDl7y9ceAFPSwn7d6u5o2h/7zNN4BO2zxEbK+HH13h8zmxo4rMkarsxRyKq3w7JBY74fdhqJFoSGFTEWMbWWWxK26s+wqBzmx/91s6YOn2rLUu+sXJsHiYitatUH5ydF8eYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 14:51:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 14:51:14 +0000
Date: Thu, 30 Jul 2026 09:51:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Valla <francesco@valla.it>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node
 names for remoteproc
Message-ID: <amtk2Lp_u9VAXMKa@SMW015318>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <amozP57T9CUYWAmk@SMW015318>
 <MRWPR04MB12330D5FC8F5B3FABF23572AF88C92@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MRWPR04MB12330D5FC8F5B3FABF23572AF88C92@MRWPR04MB12330.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SN7PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:806:121::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e72f479-c101-4551-e1c5-08deee4a0076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|19092799006|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ftvn5UBXD6mrKLIxkzozU85eqpA3w6l/VK01SpNYFzvwCAUT94CtN5opfnxzfNhlGD+Iiogl/QTuM+RI1fYgnRgIMVUeiKbufBH7Wmwxxaoc+OnEZX9K7hX4jSbaQdoSYbtfp/8al5d0VJQtdolhB5CLFJ2hpxtg50ezXtcHc0qNWh5+HZxQjqPDJw+cHaTuKiPx4LsifB6MIPODUqAxXmZ188+728ZY1YJIVyejnRXGKjPEslJgVJMvivtOL4eO6lk2zJ9Bosq+9ntvLMnJAHZvKPXRRs51bt1RPojBNc2GIAqchw6JIpbZ36MOb/+l2BU1m218eoL5uubvzLs8tR1iPGsW1vUFtaTupBZVcfmD7kKzgxdy/IlwArYqV/0j7sIqd6qg5f+Nfn5KydrUCRg9HI/9OM2GpFHSM4GnakwzaCnrrbH4V/PCab9WFqxV/owjSsX6D7i+0Jym4pvZ4M5tJZX5cXsvNBgrjpH1Jj1lKbxRPcKOFX1ie3gEiwjqAVLhOFNaBAfyPhPrDla37OOBC472rTfZoSYGQRkozXIFjFjCfdMKb7c4L8kORDtXeLyfIflUn1ZFQaoZp6FKLIepRosl151KM7cn1PNkBOz4vdSXX+dlEEbj0c1Fwxb/iiMHSRngGykuUu+uP0Us28c7M2UpX9qwpTDy1GDB2nQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3rlEmW74Y0bTVjx9Ec1bi5A09KJu+X3COooH75umrxb6ItmlkL3/vjIl+St?=
 =?us-ascii?Q?h1xOSBjQikd53fnxm4wr9xTxFRYe9Y9q/CnzIP5eKgCQ2KmeefFc83KBxTCs?=
 =?us-ascii?Q?5BItL4sWiQdGSwOHj9YH2n1ggqAq7wdP4SmvAGDU4xEOifLwh5VKQubsAcy2?=
 =?us-ascii?Q?P5o/0L96kErvYcCEuDb/jDHapv+ZeF4uNgzCwlpTZ1EAoyIm51OaU9DZ3ic2?=
 =?us-ascii?Q?+CLIgFxUVutGl/WgK4dtfbuSq7trjv3diGHIYxX0ZVzXayPl1hY4JOjT/vEv?=
 =?us-ascii?Q?M+tMnXljCZeQ0m8xnCpt4e4RgmKRGZTR+U4EHsZsebEi0V+VREmixWFizmt2?=
 =?us-ascii?Q?0Aof55gWIqFGONlUITTw0LSgY6Ty/wuT1/D7Pz/TbR0vHANMO/mlUAx+nmoC?=
 =?us-ascii?Q?2p1HJ8xyLSQNNPnsvWrtxXqpfGe6j+aWkoUcE5DNtbNDYLS/uj4zav0qQK6f?=
 =?us-ascii?Q?HtnlvIRiyVson4y/9xuahODMKSgb5nNAm4aODzvrconXfJ7rbMQp58fzTHnD?=
 =?us-ascii?Q?ukWNaZnxmNkhP4amXHPzy17Bf6ODROPzHrD+8LXf76y1dg9ho2jJ8wWEgjHy?=
 =?us-ascii?Q?juewkHcCzYRcUKt4ZpbAe2kihI/6Z+VVU4Sh2E0KpU58U62Jgm2qEa2n88qT?=
 =?us-ascii?Q?bITNV8xfR6x91iyN4uTmAyzyPMovTFuMKxwDuxyn99ahLmxSyD2kQiJyDp5P?=
 =?us-ascii?Q?vjRNe2yhNftlvnjIfHpur1LF13VJBpkJPNA6w+25jqE8t0RoCohmV3ibSGWT?=
 =?us-ascii?Q?kYXrnNamoTO9tThqzYbPpA8f+RAR6bV+Z3j1UGE8qb7J9e9A2LkiZ61STWck?=
 =?us-ascii?Q?bst3Bfhf/gPAPvcCVUaxjNzfIuQInTIJJmoc1lrOd6ulBmOAzb1WksP7fzRY?=
 =?us-ascii?Q?5C5czlG0nzH+PmB5s3QIgf0YJZp8xJs4pnE2HKYj/vRcSuQ8iewi/XvJJLbo?=
 =?us-ascii?Q?OI0NFG2BuKyaCyTfU7WOic5+zAlTdhXMu5gzLGYW/wIcI47gDTSemLyHQIjK?=
 =?us-ascii?Q?KBQqwnTr30fbdvmF+BqFaGv9O/rndwg8hiSsjbhLjiKQCEoxlB+AFwBD3s3/?=
 =?us-ascii?Q?BMCvCVxDTS8WwvoxEkPoTQVZwEt8xQO9i2WRhwieHmEYmcJc6s9z7bP5rv08?=
 =?us-ascii?Q?zo/6yxDLkyoC6ByLFYICvxrGd/4pa0pb2EoTKj1q85cJsESw0zccBEcwRd0a?=
 =?us-ascii?Q?h2+811D8t1wX/oYyC8vniA9t9Pmu/eYjlM3H4iG5O0IZSP3bQ8tQPNs2IYSC?=
 =?us-ascii?Q?R9yblYSio5sl2UfqQ3rP+idlhvIlxFLyImI1FjJLmSbUnHRY3sHvSBqoA4b1?=
 =?us-ascii?Q?7GqhbeTPqeh2M2Q2/uXoq6FmIIHNBTX1Ud7d1NwiZkQZzmCR0RLUKOfXeAJY?=
 =?us-ascii?Q?M6/nMuZNeKa6LvbIl6TkdNiBDqHoLnfgVRQqfdw78uH/laAkCyRbJwr289w7?=
 =?us-ascii?Q?Dvcva6Tse2t1MswDj264aS8Dbrct88I6H3zpHtCNI8vrqlemVrEp8aaNZvpd?=
 =?us-ascii?Q?CqQWLumdYFD89KQ3XOLXmGa5qnYHV0efDZxD4nrZYmlSOBRMKI3dPbfTD8o3?=
 =?us-ascii?Q?vQ1UvxHOFJW+BC4YVqaEMqYIzpf1sD856zZ/rxPfiUgpx+GyMthEuDr4QcyK?=
 =?us-ascii?Q?1qoy+q07/OSFaD46LCx773GyEkkZH4DyzPqj73whQQMpli9qwPoLSIzZgQvc?=
 =?us-ascii?Q?zzNmYWVWolu17MQD+4NAwcEYA88cx9+yBCMPZAB3Q/+cre/ltu9TBdE3H3d1?=
 =?us-ascii?Q?OUC7OR0IPUc/B2Z/MkWcVt8jEfkEN43MnwhsxwAloQdo42yHa+aT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e72f479-c101-4551-e1c5-08deee4a0076
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:51:14.0166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 351pBPIl4NytWu2UdC7of5AcYIU3BMWRwbETAhUVv35xhjV1HfH60xeRZgWod3aNujU0PfwJwLBRQaKKXeh486yFQM/saWXWV8B1BSz+CBbG6lHt4khN8S1WH4qeUIiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439

On Thu, Jul 30, 2026 at 03:26:24AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: fix reserved
> > memory node names for remoteproc
> >
> > On Wed, Jul 29, 2026 at 09:07:56PM +0800, Peng Fan (OSS) wrote:
> > > The imx_rproc driver uses node names to identify reserved memory
> > regions.
> > > It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
> > > resource table, and "vdev" prefix to filter vdev regions. Several i.MX
> > > board dts files used incorrect node names (e.g. "vdevbuffer",
> > > "memory-rsc-table", "memory@..."), causing the driver to fail these
> > > checks.
> > >
> > > This series renames the reserved memory nodes across all affected
> > > boards to use the expected names.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Also fix vring, rsc-table, and dsp buffer node names in imx8dxl-evk,
> > > imx8qm-mek, imx8qxp-mek
> > > - Add fixes for imx8dxl-sr-som, imx93-11x11-evk, imx95-15x15-frdm
> > > - Update commit messages to reflect expanded scope
> > > - Link to v1:
> > > https://patch.msgid.link/20260729-rproc-dts-v1-0-
> > 368bca0b309f@nxp.com
> >
> > I hope Laurentiu Mihalcea's
> > https://lore.kernel.org/imx/20260605113621.1479-1-
> > laurentiumihalcea111@gmail.com/
> >
> > move forwards,  by use memory-region-names to fix these problem
>
> I thought DT maintainers rejected the idea to use
> memory-region-names.

They agree we wrong use node name as ABI. but commit message need be
improved. wait for larentiu post new version.

Frank

>
> Regards
> Peng.
>
> >
> > Frank
> >
> > >
> > > To: Rob Herring <robh@kernel.org>
> > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > To: Conor Dooley <conor+dt@kernel.org>
> > > To: Frank Li <Frank.Li@nxp.com>
> > > To: Sascha Hauer <s.hauer@pengutronix.de>
> > > To: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > To: Fabio Estevam <festevam@gmail.com>
> > > To: Peng Fan <peng.fan@nxp.com>
> > > Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > >
> > > ---
> > > Peng Fan (12):
> > >       arm64: dts: imx8dxl-evk: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx8qm-mek: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx8qm-mek: fix dsp reserved memory node names
> > for remoteproc
> > >       arm64: dts: imx8qxp-mek: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx8qxp-mek: fix dsp reserved memory node names
> > for remoteproc
> > >       arm64: dts: imx8ulp-evk: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx93-11x11-frdm: fix reserved memory node names
> > for remoteproc
> > >       arm64: dts: imx93-14x14-evk: fix reserved memory node names
> > for remoteproc
> > >       arm64: dts: imx93-9x9-qsb: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx8dxl-sr-som: fix reserved memory node names for
> > remoteproc
> > >       arm64: dts: imx93-11x11-evk: fix reserved memory node names
> > for remoteproc
> > >       arm64: dts: imx95-15x15-frdm: fix reserved memory node names
> > for
> > > remoteproc
> > >
> > >  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 14 +++++-----
> > >  arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 14 +++++-----
> > >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 32
> > +++++++++++-----------
> > >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 20 +++++++----
> > ---
> > >  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  4 +--
> > >  .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  4 +--
> > > arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  4 +--
> > > arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |  4 +--
> > >  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  4 +--
> > >  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 12 ++++----
> > >  10 files changed, 56 insertions(+), 56 deletions(-)
> > > ---
> > > base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
> > > change-id: 20260728-rproc-dts-3f331df7ceaa
> > >
> > > Best regards,
> > > --
> > > Peng Fan <peng.fan@nxp.com>
> > >
> > >
