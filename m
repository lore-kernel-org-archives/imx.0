Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C343242A4
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 03:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703766; cv=fail; b=ZG1Yxdo4uD9zcBnqmL6cYUyHZuFu8sKGqhWU7+08XTjn16a+p7d7dgB6m1kyXqRfue9ToGdJgsuozxos/x6IHwHL6av+ZYGYiKJcuai9Zk7UbHpMaxqHzDRlPWCdHJymzf8EcSDeRDxtFDljy4u29Q9JFwV9dxglHe/nkiaenJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703766; c=relaxed/simple;
	bh=RYUyxNlnzhfOE/C2EfPBg5ItunfGSVzcs54vUxgd1F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cOvGSfPh2Wt7uk2KoyAMBdDRPqTlQHPti1pt+XATjxmOrEZNFlLhtDzl8aLLMBgFmdzKfqXDHyF2nfcUMXplMY/CR6FC12DoUYa6E93QUb5JZvUZ/3viySHeKbdfTvpvGDY1I7DvG2s2WHJy41cCIQ457wFfgoTumS8kmdNKdBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zz3ubw1E; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zz3ubw1E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofc9NYT3+4m9Vmq4gO5YfiS7cDbJL5bRl8n1qh3hgc+bocP2nzwSdtMIQwYwwSjNyKemAjyGNVZAeukYuPIdOZUR3uVqab+sEgtIO9G7B8FxE0a2PAVl6rthkBQ1qM2kQr4OAyZ6DaSJFsB7TmTYIVk8eRq41Co/fCQ2Yn75fRyYMXrVnrTKeznkd1ofGqsF6XKYuB5INVByMKqW9pF1FWt4k5V/OwdzpFgr/YvQc2eYs+B9OcdhY9p1QW2nEqGiHdQChyH28pxU4QelmoXk4xrLkPE1MBi4iE/bxuiLufQpEf758fV1odUJsd6B7jMRlpNhoN5FvrG96Ku0+i8QtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYUyxNlnzhfOE/C2EfPBg5ItunfGSVzcs54vUxgd1F4=;
 b=G8o/E8fIegdj9T5dxiVW0/lTuHw7oJO+sHfL8FJF0bJm6Wshwolecsl9OgvxsMzRWx9iKYGS2mptxT4PNlRQ/AyjLEChM79cQWygrTjKeycYt+oMO6EnKCN7ho+anIaR1o/zU5BHs5JB1qnTZsK25NZY7Trr/aEoIq8bIRWOi8t2mGIWj9XX0ePM64dDHuMFStIo1eOvT1qEPp1LGQM1+PftxfBM3TFvdQuU3MzeUjKLTlv8vmGPX++KFZsNV64MMNsS3jiApoLFRgKSYGIXlWjfcnSII3++81lRl3M5UJ4X1ztI5KN+QL5quvYg7+fY0enPfQvYet4cV3GZqN8NWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYUyxNlnzhfOE/C2EfPBg5ItunfGSVzcs54vUxgd1F4=;
 b=Zz3ubw1Ejlbr0u7G+AtjELkqKC8GDGs2JtCBFKTcSqHrYO1CXIXk13OjICDo6uTLUGPzD+NjfkK3l1HwcKbJ6SsZnuGE0/BxhD/cp5glHW91vwtUFgMXAg7q10cFyVggp6QC0FQAlWFUCmYei5SdixrKHhVQCkw79MiiwY1/kTE02hr9Zr6FEUKDLE7oLmtQg4xEWoVfYtiqeTw6ZB32TjPIpH09eIAYxqchdV9ePvuMShgxhdMnwoa7P8GtBaLM2fRbCUE0N4bm170CO1vabraxEnE+kT0Mja2tL+hlUileqQS41cmcMbaFE1Lfbjsc4iEiNQH80hS/dtfqARx0oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8630.eurprd04.prod.outlook.com (2603:10a6:10:2dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 03:02:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 03:02:40 +0000
Date: Thu, 9 Apr 2026 11:05:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
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
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91
 Boards
Message-ID: <adcXXK7jPn+ynoU0@shlinux89>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <86635091cd5db0ecb7f07c5ad9d6f735ec349485.1775669847.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86635091cd5db0ecb7f07c5ad9d6f735ec349485.1775669847.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: 58925156-af3d-4c9f-4cf7-08de95e4763f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|52116014|19092799006|1800799024|7416014|22082099003|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 UkBQZGCWe+BuzHTXik/UwQSy8VpQCRAo/Df8QSDHNMrvz1g+3IqdryGsm0jJKVBnIbgWVmfCaB2de1YTWi7LT9CZIlpfWsayflGrXdnJC/lFeyztTVPorWlEKFtp/ZxJy0ITRBbmuTXsCQZ9OPO2Rbi0gGWbr2/dSLPn6c/WTdqgeNWrHweeBzBJWz6pQLaAxCSelamXPtF0PijXY/yICREniY9DoGUaFLtVOoQ/Ood5wX6fUvPp/dFstbZWtYrrWTz0yUjnkc/xGhqStqb6RQC+HKnoMJMdH0w3dqEqa0il2S923FFkxZCC1XNYqJxMzg26AEhXMoL1cKKAaQBMyujU5jHIK/qM5dODlU/PEMFlvClyplQp+ssC0KWi8Wm71hH9eOBhx9cZA5XsisLTrQzuaVkBxGQ1rLnrs2NKzfkQf2Aps3U6axYirb6twEUChVn3dkDk8H+IcYGOsPm/KyapQutZswhQGbfYi0lr1+HKjpUXxZcNMrf3RUHHl8VFsIjcFCK21Dp2JvYtOEpI//MzHVmEwMYizciQYfpF2IRGtVjje5tNBKoieCLr8XXiCgTIpQrWyyCFEUMlEM8Om/XWN8mO/22czuXEMUSmeZPwI3L4RkgT9R9gcO6nKCzYhCrkqMBtrdGETLeSwNlMTQsGOo+wFKr7A1IOlti4z37m+Ua0ax6dOsD91JpXku0ZVBy+zIDGu5fIzPwNszEjEM6oCQ3uiRTGAk2dDTWEskD3fKd3ybNW24ail72nVn2jTGLTIMkTG3VL0rWNLd0OH+tyzCFdH4KkZWqLzEe5loI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(19092799006)(1800799024)(7416014)(22082099003)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?s+XdSlN/RWtTDJflhcqY/YOfropUgFUEWSyAjPu8WktriBoNui7lu1sBR7CI?=
 =?us-ascii?Q?rB5danTAz25eJPUjp4qHgZ51GJfKLJoLNKdm2OFIgNl+zfLWtKgoLTD55d+7?=
 =?us-ascii?Q?WbOI70j+oRi6Z1yvYWNaJtFOVgPu3VYHezbv2X8rmR7lm7fVrmFbXzCEyQnI?=
 =?us-ascii?Q?oWLuzBEp68QUP+S09xhYODPggKs7SHW/gIUh0CytpiZJjjoTHY0AsgZgPinF?=
 =?us-ascii?Q?SYYNPmB6wR2mb88HN7JlafkliDuGgcKp88+YtjnncbUlyynWHkmfQyPCfxfX?=
 =?us-ascii?Q?4pyBa7xfdPCjUS/LNmj6SN4A+T0/dfvJWT+0rdXqIJd1Nh0uzxVxepA77BPk?=
 =?us-ascii?Q?1Uy+31Ripw3XjCHgQo21dmD/Va9MRVQ+Pk2fPRty/BHLSPgibhvEijN1Rf3Z?=
 =?us-ascii?Q?NfbKuXYhYGDJoMS+IMFg2ZX+TxcUhiyZs69yBIpRviOu6Nf0yJsiIFbIx9L1?=
 =?us-ascii?Q?bpuGXV15ehyT0FaCFMsHg2TzebjpjFYFZuY4DjCe4DVvEQHcwb4/1pvzUr4J?=
 =?us-ascii?Q?0TvckTTwRtF2WGYgeeJIvN5WA2xdwc3DMNg/5WDC11TWE8n0dzVkh3El0VvT?=
 =?us-ascii?Q?0AQqnVAyNCdQDkCL2AcVksK+nOh/+LLXzjx+33N921hJVPQpLsinecpRYqju?=
 =?us-ascii?Q?pw/YyaQ3FO/AllbsuJIKPkPm2AcOoqk1VkqgIorQiivyGbH06QHRK59HzHmQ?=
 =?us-ascii?Q?PPp7oul4OQVKYdrjbJL0Rmg8ZfG6rhG5M9E0+K393Y5fP43Zwg0Ixne5an41?=
 =?us-ascii?Q?/mQdr5kIeC8VE9AggaR0UYmHw1/wlRIMW8Kh/bRFZOrax6XHaauqMr0zVjav?=
 =?us-ascii?Q?eFy2hd34WxfUkY/1qjhwAY24aglk+CEGphA5cG3D+gKUhK3mY0NSj1dsY4GP?=
 =?us-ascii?Q?fjWdW76/Ftsx0ZDTRPzAJscGcme8enoa/4sqZtrINSvZJrWjz2/wcbuCldNp?=
 =?us-ascii?Q?sZ7LQLAxSbPkR/VIzkqQxl6qfZf50FhoKFU4ld/IfX/0GdocdClpacvJuMxi?=
 =?us-ascii?Q?Uti/Z8QVLsZrk9sFAvl6PCNim6NaHu3q3k2qioIoDMZDpH6nXF0Dck6pUEnM?=
 =?us-ascii?Q?/h5AXCOVhIZw+wtya3I0v0lTxlQorhKYqox2OMZk2ps2IJBWpQxvAyFF6ylp?=
 =?us-ascii?Q?LmE3U9oDRoY7MTEnuqd21kBgPcHA8g54Win0efyqlFXuwDt6sBX67FJM5Sqw?=
 =?us-ascii?Q?gH2TuL2npWbtWwK0CTgo+8z7ScL1cfWysXvTd5Rv9A1N9xpEZa3erPBhECWc?=
 =?us-ascii?Q?JFpTf+6EDr54UDaGwdzbEQhtV0pGaPAX+C5ILSXAkX0iEuiBUwtTUJWOLjy/?=
 =?us-ascii?Q?QvDmJNRzG6ezEnaKOCD/JUm6QRNl1n1HoRzWH8EjzNepcFVrjwxbp0Vf+7le?=
 =?us-ascii?Q?us3EOBrogHwqE4k2MPtMjfJSrOHxxxiJwLM+e9MK55kchUOejejrWTp4ylRI?=
 =?us-ascii?Q?ZBpnJPyy/Fa1IUKJWa7uUz9la+ssBAK1bE3QK+HXevBYq1Wz7zhIslU5fO/9?=
 =?us-ascii?Q?Qgt7u5YKS9/MBwkQliji4Dh0sdK4Neomc2MqrYwIsG2RvMOUuEFDgaXQ9kYi?=
 =?us-ascii?Q?QeR5ydOFfMbiT+w3FyKtkgsuWRmJelKOp75+h+Ts52GaCphi3mTfnkOCpyhm?=
 =?us-ascii?Q?YBWtTTwqUEFQoEIjVv/dKOO/2h0T7F3E+7MGTCnky9AJhTZNO98Nyd/8q6uQ?=
 =?us-ascii?Q?kWgpJzaqNO0Djea472EHr7tQRKfCs/zLlz0XFRiihA624yOWOsK2JhJeIOC7?=
 =?us-ascii?Q?NUbVRJaH2A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58925156-af3d-4c9f-4cf7-08de95e4763f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 03:02:40.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hittfp2M4Lp4IX4lbiL03WEUY1p4rXvIy6P8cHABDmaQ9yRgc+xPGfltlxRFeEP5MCnLnvglvVJZc16hSo1rQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8630

On Wed, Apr 08, 2026 at 07:39:44PM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Add DT compatible strings for Variscite VAR-SOM-MX91 SoM and Symphony
>development carrier Board.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
