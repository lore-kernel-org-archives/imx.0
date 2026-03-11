Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82820E702
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244260; cv=fail; b=BjoX8816ORPizYUMhctQcKVACAPX8VmEMTVLw4esZ44xoCDOgc/xMx8ktrUsd8z25waTv49lROI2K/VsjH0te3zDdx4so++G4nGqUHwmy/qrk1y0qAdMzFSHLAoR4NuxM/R1xzbJBlGHadJj4SWFlcKSNpSxR2jthCfqwRZUw6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244260; c=relaxed/simple;
	bh=g3ui0rFS97BcUWDfNz8ebgSP5sPhjg03nCNx9MBzbjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VEF1NOZqk7D3zlOpHjQE2sPdEo9iZ3iG89Gy0+IzC4mvz2crsFJYgiqkprQ59OO+BzeX2pgsC0fqcxtJli7pQDcLwpKBRxjt0joz5/WNomNuKD9zk2hTV+peR4x65TnhVXgm8Kn2R/xp476yp1OFEtj1aXyeEPj49ze2DrViW4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KjHYAusA; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KjHYAusA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcO7aImL6tErqOSnFupogaxUYognlalT4dR1P+HbUeI2v7JHcE6P+3m3420zb5CkGY9DF/uLLCd9Qqp0qwKJj9MKB7jDRIYzcqpniXNAydo/fjVH4TD9pslleimLqRNd4rsIG2XlTIP2gFl1z4fL7NWOrygQUUgMUoAOVoNIY+Y2Dt7Q6q4yIUZDVKjD3HWBLui8Crvaf1HgG4Tnu3kcU47PN7LSjH47jstQn19GK8OGw9DX7zibBDKsgiaji5C0UmVA4AK5YjNc5oHVTwULnKyEWY+Zbk/z4JDd1z37ZP4AMmTVE9OUkvVBWbu5bVGugAU8qeLEi9hl+PEIsrjItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duEABk7jZeGGCUUp2pKQqWCQ+UVLN+0UZ+3zjnl34SY=;
 b=RbhsL7rXp2ejOUSggswPj1LHmvHiFvcLBCxa/A/q44YKwRFLWjkdmTz+VnkWx9C0l/ftA1fByqXW7y3gsMINAwT+GgLmuVspPISE5gIkO6UjuA304nV12fnDOYjdzVMZsLzZgVVc6MICjH0jj8xMSABU3EV1755CN+hHDg/HfrTkF63UXSkI3bYbAx5nQjgjR1pH9TMvLWBZ89T9pKo5Avazfop+m3Math2n/mN5xECe187igop6PySKxnCVWTVjVZs/pC3WnePPv/1cXT2I6kO95P6SqFG0AMo7VtlWNWBXm8G3pakQqHTu1jJuJbOLeqUlNdTB9D/0oH5nxK/08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duEABk7jZeGGCUUp2pKQqWCQ+UVLN+0UZ+3zjnl34SY=;
 b=KjHYAusAttV7KvzKDcRcz8a3vGyPbT+Fh7chfGz/c6/bmmRt9lIExcgmHI3E+RL3WbkxkYI2K0uNn5AJM9xBm4rVOM/JPK8+GRClAlowQYJeUxgu25w3zDO3yuZ9ZM9NVEhb6quIjNOenchS3cp9EzTSKzTD/JUQZanDoP8jTcBjYFPbqa3Q71D5J0J1CpDBGk1ugZq6pP46dy0kPhJA8cq11SYP1wqNZbJcnHd2XLP3OMyOOr7TxnT/APlkZozN8LXTWVXHlfm9/I7BGt/a5HwNU/9oG0sNuoOyyqI85VW6zWtIX1IFQT45kqkajfTTU9mBwegqJvtIhHuyOlYEGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10225.eurprd04.prod.outlook.com (2603:10a6:102:467::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Wed, 11 Mar
 2026 15:50:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 15:50:53 +0000
Date: Wed, 11 Mar 2026 11:50:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Message-ID: <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
 <87h5qmraum.ffs@tglx>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5qmraum.ffs@tglx>
X-ClientProxiedBy: PH2PEPF00003854.namprd17.prod.outlook.com
 (2603:10b6:518:1::74) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10225:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fd0e2d-8bbf-4819-dc75-08de7f85f9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	PUWPfNgRuYdInTzPIW6nY0lAMb/guUAihsqT4LvZ1pCZUaEz7MCCdTNTf4UKmrB1pRz0LHP1FiAaaB1DYD6Dd3czrMpsmrhSWeHPch2I5NXIlCeRyc36l36YUE+G4ywo0/kePrCqb0FIe0yRxu7GOnLhTOTzNHhFEuTTYwKnknHDzAmRz/25Gz2ga6AyjEKyBLKWdAyTCYIZGC/RqsUvhw7pjx8fIZRGUDqBAKYvAFJob3bhBvdRthk1UlCdFBwEqURQXIuTyZU7wyn3kDrtDigd3ftrU6R9EfrHRjnBPfAPgph2wR2KkWmsrlMfjVFSpu2EXARiHUhRZSlsfVcCeJbycTZoIEU4i72jWJ+XGpPjo/jPlzQ0M3U9y/4BTiVG6A7fwbJz15+2iUbqiJkwSQn7Z9r6b9W+lEa3dGX/H1MyUOpTMpqFpPSd3h5yCLx1SBwAZ5hDFipY5IrgRwgNv5az2q/UYWQaGCq/QqGe6CLp52rvF5iQWamkR8zmBdJ9hWpcI71cvWvRPRquZbwLOclgpY8aXOReH+5b+Z3eGqhKx8WkR/BdIHZBbEHgCU5RWRXSSGihspWK0tGp5PUWP9unOHQuI4QcB28vyBmX/qVwXnl7HA6QtMD/PmoUw1CHM7dvaatI9ZgYvVlYDJhXZBsq+MQw5HM2XWhUEBGcgUn/Th6SJzfPYJ0tQZkjhuqQinmH42erQuEJzgeODlBWDMREYQ1XCnWDrjkcTm8ilnJ9k3phvM8H0gikbf9Rdf0dakM1GuYMPxnVw2pvj6bnXLzFgn4dp3BabBZ9KKmKdRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8EmQ9vJcA3+psi5xkWXVB3lLUtMJugUwuNQgITCizEUM8KCbDyxen3Nb3CP?=
 =?us-ascii?Q?2CRKbwqKgJcWKqZBwgiCOnaHHwUMj30vA4vpNigd3w2PjKVv2ynJAL86l5x7?=
 =?us-ascii?Q?gfwp2G4EIr2gqrh1HA0oAN9rlGaK+WjRVswo/vRYseXwJ5TPP7ZzNLESMXEx?=
 =?us-ascii?Q?PiiXPkroXh8aAenlGe0WoeNYmgVqwf3YXqXJuGjMAs2qaPP6LrH910/tIAVn?=
 =?us-ascii?Q?3GZ3OIzzxraoM44vFnA6ux1uBuvAsqFyJB83t8zGcmSSa7kPhRHX72nQGiQ2?=
 =?us-ascii?Q?+1PP7r+nNIEE/cXKOG5kPPw3qKVYjBdly9uffNw5H59cJdXJZstKO9O5iKmY?=
 =?us-ascii?Q?Gu3qUrHlLxXhxsBUEoSvx8RwRrbGLUTP6l4RExu3sQe1cfp84+G0zvTu3ohR?=
 =?us-ascii?Q?1HcImlDFQ8bqs4qVzsk5mtiPzL9CKs2fil6Z11Tyold653r6lI8HvZv4B+3r?=
 =?us-ascii?Q?qyLrazDC8B5KU3tqizjYetR6VV2WgtAcoAl7vXf075IeXUQDqjqVe78AuBUc?=
 =?us-ascii?Q?RacKZTPZ40rZi6UxZM1Xhj+0NN5xhoRQbG/KowFENzozisAMt1J5ItoEJDL6?=
 =?us-ascii?Q?IhhrYwR3ITWtc6hqCU2aCZ/qmxBMTVNfv0l06r5L7nU4OaxlUa616OTdKcyU?=
 =?us-ascii?Q?Xco16ngYGLrjotxEiI4VHgMXshhSm0BXKZc6GO5JbyaVuN+s6xB13wburXnF?=
 =?us-ascii?Q?1gQf6LaVumcPcoFWjICVHYogaV34C0T3zkkuCZMLE6NXHlq4mtffyIIGMJ06?=
 =?us-ascii?Q?Rj6SfqhLYHz9GdM8wMS13AWlblhmpprBejASCYh55u6lAHmcAnhwzBjsWZsJ?=
 =?us-ascii?Q?XgKR9YanolLxTDy6To07EIHuFRqB/SkEkYTn4qaIFoK1+6RL8q8l6krNBKtq?=
 =?us-ascii?Q?sDM0L5fKsxfOspINdHa1unPWcK9gpHS3uRbfsunU0fYlm+2FVuixhghDhW4r?=
 =?us-ascii?Q?1T7I/SsLpXhAKSyqKI9RH5db9zlqo8UZpaSAMbgLPZq3d0A3Yg8lKD3MPxLU?=
 =?us-ascii?Q?Nuh1L2tEAvoKqR/m+tbiS490+aVCjbROTU4oa+fZEyXFI/bQD4rbDlUNwNN6?=
 =?us-ascii?Q?evvyc/MM6w1VLm8uTfSzsNFmOJ3G9gwz0xjXqq9t9MT1fCSo16Q37sjwEBzO?=
 =?us-ascii?Q?isOoRTQdJF3A3hPgkG+quC3WtWdPmnzIJbya3+A3Dw373CvEeu65HgAAPzwj?=
 =?us-ascii?Q?gBapMXW/qTe4XLdwuvQHBU1jQrNkNO9iyFoqQSdLvjQiluP8mxVmnorLqq9l?=
 =?us-ascii?Q?OCVPHnobzV2YgcQcbN8toOrpAY2QOo4TEPGtGMvmuZC+Pc8nhOC1qnegmB6C?=
 =?us-ascii?Q?mBK3wbECeoneT8k7crXI5C2/lxFadT63UqewA0Rm/0LzpvTmSXpUH2m5Yfyo?=
 =?us-ascii?Q?kXk9B65yzEpX1VSFmj/wFCwi4Mg87sQkLOr1GmFb/66T7Znk9kMB/aspnftt?=
 =?us-ascii?Q?OJGlfK+zW48jGcAoKKN2rA6UJAez9paDn6hJpmM2nvxayDpbMENkaxOzhrkN?=
 =?us-ascii?Q?BM6fVQ4u5Qbw0OcSc0LLiOoOVi00rGvM9FcP0lzPlScyFxJT/nd8ScZMaAQx?=
 =?us-ascii?Q?3uh3wVhXgTz61/rtbbYPiBqd3tWxHDi21mkzZldmTN5jf952AWvTIUPUok8v?=
 =?us-ascii?Q?UfBe7C43CkNGIH2uASPQ3lb4NZFU937coE7Te4gY7HqGOR27GUPiSEA0tkaO?=
 =?us-ascii?Q?vvNeV3vO+BeBti32F3TymJdIc63Mtqx85cyLwpCpqMT/4aJJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fd0e2d-8bbf-4819-dc75-08de7f85f9bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:50:53.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6PeeM6J5BRwaxE02ZyF7dZYnr9q++S4g8DZzMoWAcYv2ElC7B++zXu19aEogrEgQXT1j9stoXM4jaTCDVKTRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10225

On Wed, Mar 11, 2026 at 10:09:37AM +0100, Thomas Gleixner wrote:
> On Wed, Mar 11 2026 at 09:11, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > Add support for the interrupt steering controller found in NXP S32N79
> > series automotive SoCs.
> >
> > The S32N79 IRQ_STEER variant differs from the i.MX version by not
> > implementing the CHANCTRL register. To handle this hardware difference,
> > introduce a device type data structure with quirks field. The
> > IRQSTEER_QUIRK_NO_CHANCTRL quirk skips CHANCTRL register access for S32N79
> > variants.
> >
> > The interrupt routing functionality and register layout are otherwise
> > identical between the two variants.
> >
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> I've picked up this one. Can the ARM64 folks please pick up the DT muck
> as that really has close to zero relevance to irqchips.

Did you pick binding one?

PATCH v6 1/5] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support

I have not founnd at linux-next yet.

Frank
>
> Thanks,
>
>         tglx
