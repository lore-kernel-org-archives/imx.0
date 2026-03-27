Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622793BADB5
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621958; cv=fail; b=f5Adt8LF2ag2Ufnz+HV4UsOTtjHsjO+8zxo6qetxzNvhKpK43j/AWzhY+AgpmBTc1uG9/KPHkArreiMzVHWyWmfwIogBarwLRlpvjrljpXQxThf4hs7nj5ddNsLcoaKLOjYs62x4ijOrrOd+EgkPPXVOBvbrj9txP6fFCGuPaLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621958; c=relaxed/simple;
	bh=4hOKi8ImEPvTIZ5aT6M82MPIkpG2neLrGdgoLKd4RDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b6aPIxRTAUZle33rKHeGo91qA4ghPsch/Js3KFrXnzzm7A9s7+DcHDfHQM66owEpPkyHol52nCIb5s7o2JkZTY29Znawk0/9TIk6TPsohWCxYfo1/SDUIhszrMytim9Asu1sIwzOPklkvv2pAGIFuPSX/PNr8vyslDA9xrGlhE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q4PigAW8; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q4PigAW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3gDyXVLqxNudLPYnfy1sY7sHjXbJL9AeW4Dl//5nZpKh0QpKRuTu9Ml3kKru/eWCRlxHI0wmmTO+HScqfeGNGPoX7I1dVvpY1WwFdV08ExCy7nmwSoIl4EvXxbw0UQYRDkw2qOBD/+pOQCJHRj9tQxy7O74SzSZFaI12mDFBZGbw1pTdjBMe0dz1FPpvRyiVX5nV9koeBH2liO9bKH1u8kcEvzGF4wHUMyvmLnV7RSZHoNdGH/FUI0PnLMU6AAo6HiwfcnB5POfXLj9D1MiVO6y45IjNVKwNPYBZcy8MN3RbFh6BvZ49QroE8te7FpkmtrDHSf4f+YLI3fQGCYltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDAGWYFnOWrSyzhJRtFUl6uWjJY92VZ2GiL2CNjA8NQ=;
 b=OS9IV11R2RtXQ/MLUKcEjzg1BOdno7kvkj7QWvbolbJXrnNsiEZUeF32oWOd3KCC6Kem1mqZCN9rjvtOCF7hAKbY8Lkr42Zf4MevdZdkXT6NPUVOhvf59yQi/GCJZ+zWy1Cg3AyVy62H80qSROTnsy1nACQ9sUBYKH0e+Q542jvVmyUIW3I+2NqBRmvS42QWd4SbG2VgNi3T3gXBLu8MZMcfwV27NHIUn0V7iA7VTZomcDzvfKLZD7sRtwiejS8/n5VKqsXpdZvXeSC1IhC1VQATBwkbWC5rrUUZkuAE7OKBH8FnwU28gl8u8LdrNBk75utv2TqSZUrG9e8ANoNC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDAGWYFnOWrSyzhJRtFUl6uWjJY92VZ2GiL2CNjA8NQ=;
 b=Q4PigAW8EsV2Fmuze7l9uU0dFQteeopy/SJEtwxsybA6mYk3FalhzUTpq29hF2oyZAwmlWwzw4kNCLEpuls9HteY+R8GUbqyKsUlkqNyTYwr0nWm7ocHxjRS608OwP/bsRPuayIt2agb+huoVIFJaQ3Ltr0ggKhR2HGL3u+nkoHZR6WSi9Afg8VX5ogSBVu/e/X0nt/tLUEZUgxCUDS/ak/WEr18Lewa76ITwopYtFkvlAwmsWybEVSk410J/xX392o+LTk5Fe7OykdOHcebNamHzKzTZFwJo0Sg02UkN6/Bq+uBkflSjBgjvbU1ImAvw+KMjiTeiQn9TC5gNmyNnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7566.eurprd04.prod.outlook.com (2603:10a6:102:f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 14:32:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 14:32:32 +0000
Date: Fri, 27 Mar 2026 10:32:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Gilles Talis <gilles.talis@gmail.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Ray Chang <ray.chang@technexion.com>,
	Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Josua Mayer <josua@solid-run.com>,
	Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
	Peng Fan <peng.fan@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 00/12] arm64: dts: imx8mp: Correct PAD settings for
 PMIC_nINT
Message-ID: <acaU8SPQ3aJkG808@lizhi-Precision-Tower-5810>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 1884c198-d762-42a1-7737-08de8c0dae7e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 /p+xIP5a70ieozD9xAN3eFWqAF7FrGAR5AuibV7ph3CBwkmnixY3D5LEYC9KUNtFwDhIofHdvxWtIJuZz6/L1chMnPEmS+OdqV4WS4AOlCE6onJi6aL60PapPJ2UM7uy+cDjB1VDfEqk2lC7Qtw081CC2Ryon5gAH7Cf1crX5neV/Nae3Bhu4PU2DoUZ4I4u28SHuQzwfB1jndSp4LNP8aazGt6Rt1yUC3TvGGKCljoDvAEENYp6aYaoovXFIoniuVOLjmjtKvvPJMBLu+t9rvY1n+Nmc/U8bWXaKM4W4uwdpKqwX7BdcVVWVaoMVzrrYw5hNX1YC6os6zR3LSeGGqTz6/8ZHzMJliVmfjWCC6Jh1u9g2b+MvdxVr1aRSTvH3b56ekjlQvVP7brkiNrHueMybPCZEqCP/MC8hJ2HIxVDjCU9YpzwQQCVTNWzilaInAJ/yhJnk2x98FCA57GaZB3cJR+xI9Jk05egCVA11UtOuBKVzJlPse/4/ifL3ZvJvDEgas3L22ZQBriCXo06MzODutuVwfGr6+pC7ON6+RNCfIoP02WIuCR7BIp1URXfeBbII49yBkh4j3rOa72m2hzEMyGTrnqLPdK7T2NVsZ3dtQk9MGXAVOMHhOgwv+apIKxi3a+nfVbAgTQoI0q5z7de7VMYoHQyCyWS811dVbvXISeQ8xhvhQAQ6e2o0MRZVPFkAJhDJtpdsBRDNN5c5GWVxx+cJGSrnO1IY47aCnysbmumNkVjc/VjFF8DNhd0m6GMLMZxiIy/xMNASmT5aqy5LcgFmOhqmjpIQ9RxUgHt+TyzcuVjboIGcfXcgoFY
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lRTl6NE3QrhOkplOm8Xq59zFnmFg4sIAdZij5MSp/AMCgOCsLhNvM6F53i7y?=
 =?us-ascii?Q?wzwdasiZx093Geg7f0TaPkDQ9RiBxvaC2rPr/EmMojUzEuO0wZu70lkfgSHS?=
 =?us-ascii?Q?s4tdjf06B3tEKHiO8uZBIOj0r1tVumqUEaZOq6ZtzuUiwJyf66rblq2V5dZ1?=
 =?us-ascii?Q?mffegVPFHfOmc4yb7OOA79rtlYmbYFvRqOuRgSHaODg2llnrAffbV1mjI3lQ?=
 =?us-ascii?Q?WfMmax9Zpa0cEYOa7phBoXGj/Notu3Fz3ouRP9DMm1Zc47C5pzmGM9tZguUb?=
 =?us-ascii?Q?6ULkk5x+IUdtwvvrK8yCXm02WVNUKOS/We+14nA3C9ryTQbl1LQZi/+Celkp?=
 =?us-ascii?Q?BBz2/63VP7FAiGHCLyLzkBIRqnOAkh/J0qu4VN01YXvPm46Ux+7rb4lNDG3G?=
 =?us-ascii?Q?mCJHLmWoio1qTKE/Krf99Agv/TcwC2sofq+F8VFQUBKn8gtVNPTNPvbn1Dq3?=
 =?us-ascii?Q?dLdqofYHyfkoGXoO08upYoUO9PYQ+UGs3GlwGhNX27vY3zr9vHpUxn5fJJfl?=
 =?us-ascii?Q?KwK3O5B+jyvMIyLaZ0l6viYoDZxPpmocc0LpSX2FkMrGWeDr1CboCvKdrTzG?=
 =?us-ascii?Q?sobm+wGzOth1+UAfaAy9Hmeh82192CwLOKlVZs1Xx2BfqB4fG+u4buKC0/cv?=
 =?us-ascii?Q?86tyrk8jT1uYQDvi68umxHt/JH0QBskmshUzAF43Xit6wCf5njavKIplVaW7?=
 =?us-ascii?Q?t8wBM9ph9D9KzjHlU08iGC5TGrb+C2Dunhi5HsWcFv25b0sgWLcYllEcbW7L?=
 =?us-ascii?Q?fBzQn0Wuh25ufIbF4aBNydCmddxGcbb8uznMsGU9CWaPGyRD0YdEwq6MBVw/?=
 =?us-ascii?Q?SZNDg/iOGhPRFWQ3RHKLfxArGT6pi56VSLQIN9ZbbJB+EPzNFngakJzfvtDm?=
 =?us-ascii?Q?7Z0SWCtBX9MC19cK+lZwWijheYPzAJ/X3KOEsN7IQFUYfDvaVSOu9HLh8bHd?=
 =?us-ascii?Q?9iKdDo+X+ZkyV6VXx7DVG2ochPzzkNlS3EwXMdJLMZHF2yDfwm9yMn09JuqD?=
 =?us-ascii?Q?SU6tuOflsEc1T3atDHtzt9MjRKmlPa9zdFwRiOA2rtNZatppyZg6vrMDLbfM?=
 =?us-ascii?Q?gUtmxJ5QUaL9xM+J6pGSCUWAJtFBDmMgX1GGBkU23P2q5was1IijywcJqiQf?=
 =?us-ascii?Q?xkyYusnAOWyuNZgVkjvBk/no7SXxRMECk3qbLZ+flqXW/E5GcqWT8jgTYtH0?=
 =?us-ascii?Q?ucH2kQebsoXD3gikXUEE/G4YthAUogV+vKpWo/+cwATRDoGyKFnY0r5pO+26?=
 =?us-ascii?Q?579Ra9e/oMZspewm2S5FYc7BlItO2g5EqPpdtsloYMOmecqLrqLVBDbRQtWe?=
 =?us-ascii?Q?2zxXrNFYHarDvRaG+Es5AGxKu/K5DA5yYxbJMFJyvkw1qcbO9BUzZE4uxYe4?=
 =?us-ascii?Q?tjGZf4eZCq05Ct1RDN+L62CtIVy8Cv1NXFqx9KJr0WgClZw7N0YXxZ8+t2Q2?=
 =?us-ascii?Q?yQs8CnUzgW5PwmC9blO80llqvhqg5iUwOeP0Vh5KXU0I/7e5SUhIRjrJ6fg2?=
 =?us-ascii?Q?1gXCKua4lXFDkwMz2GOCRzANc+lW5O+Dqv+sv+fDvgMdiwGxkfQMDA8tgD+Z?=
 =?us-ascii?Q?O/W9gKuOofvpbCnTNaO9qW2h5SgkMrd1Fz9ENYsfWpWCwHO3hmoIQbBOezBT?=
 =?us-ascii?Q?maWwnycRKXb6441v7HpFZd4OJ2Su5IxLqGT1H1f+0iGtDUuFDP1g6DJl+abZ?=
 =?us-ascii?Q?gjcTsAlJ7FBSGC6pM9rtwRcAi+qzJE2qPKOuO3qOWMhlJM1v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1884c198-d762-42a1-7737-08de8c0dae7e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 14:32:32.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6h5Tj/njmHv/jRts6mx2BkyDkQdu/QozyeNqX4NI0kXpccpHYpZbVHRCQC/UpyNsW0G3b0FhB8997efWGFEfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7566

On Thu, Mar 26, 2026 at 03:28:04PM +0800, Peng Fan (OSS) wrote:
> As reported in [1], there is interrupt storm for i.MX8MP DEBIX Model A.
> Per schematic, there is no on board PULL-UP resistors for GPIO1_IO03,
> so need to set PAD PUE and PU together to make pull up work properly.
>
> DEBIX Model SOM also has same issue as reported in [2].
>
> I gave a check on current i.MX8MP based boards, most boards have wrong
> PAD settings with PMIC_nINT. It is low level triggered interrupt.
> many boards only set PU, but PUE not set, so pull up not work properly.
>
> Patch 1 and 2 are to fix issue that confirmed by Laurent and  Kieran.
>
> I checked AB2 and NAVQ schematic, so these two boards are also having
> same issue.
>
> For other boards, I not able to find any public schematics. For per
> the DT settings(interrupt is configured LOW LEVEL trigger), so PMIC_nINT
> should be configured as PULL UP, per NXP reference design, there is no
> on-board resistors for PMIC_nINT, it counts on SoC internal PULL. So I think
> these boards are also having issues. But I use phase "there might be" in
> commit log.
>
> The last two patches, I think the PAD settings are wrong, but not sure
> they have interrupt storm issues, so just correct the settings.
>
> For imx8mp-skov-reva.dtsi, I am not sure whether it needs same fix, so
> not touch it.
>
> [1] https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
> [2] https://lore.kernel.org/all/20260324194353.GB2352505@killaraus.ideasonboard.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in V2:
>  - Fix more boards
>  - Drop preceding zero
>  - Link to v1: https://lore.kernel.org/all/20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com/
>
> ---
> Peng Fan (12):
>       arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-navqp: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-ab2: Correct PAD settings for PMIC_nINT

This one squash to 7adad1a52c420 ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
because it is still in my tree.

>       arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-edm-g: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-aristainetos3a-som-v1: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-nitrogen-som: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-sr-som: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
>       arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT

Other apply to 7.0 fixes branch. Thanks

Frank
>
>  arch/arm64/boot/dts/freescale/imx8mp-ab2.dts                    | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts          | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi           | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi             | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                 | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi           | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-navqp.dts                  | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi          | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi                | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts         | 4 ++--
>  13 files changed, 15 insertions(+), 15 deletions(-)
> ---
> base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
> change-id: 20260326-imx8mp-dts-fix-v2-89ede7320c6a
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
