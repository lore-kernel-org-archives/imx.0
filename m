Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450938;
	b=oSZHykocrrkcit5FHt7i8vbQ+YolatHvyQZR/GzquU/PKFpRRRabDdxzX+DYk98oYgto
	 VFHRRNXG5Cs3YN0M22acKMw1dsRerJWplkcxf1a+ezEMEpTIa50KcOk926X+2IVmOlF8/
	 sp3CetJ0BBEj0KnvHXydAQi6UwM+ky/VkU/h8+P1o4WJfuPFDo1NzIvLVyT9lw0/WDYJz
	 JqFLBrjVy6ZepRTgQFnb6v5+1E3yPQ3Wk71i6WIyJA8HuSLSjzrxrW8FydHTfY2PrCtmQ
	 E8sQUxRf0aiHSK1e622mqiZB+bp3X72K4gkmQnzc3+xxv+nApNisEb9lNwaORGYKE8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450938;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZJIWTTh4jLAJL2YIJISnmsgKKKnYP569dAL2nXkqu3w=;
	b=263IC0rLE75fFxo8zMWFVolT769uaClsT2xfierwfZ43Bag3/u3+Qkdh/5yA8MKBV6Wf
	 BPXXx2beIbvOY6D1Gu8yJiw0QefvL2HIStIHmxb33mhOJBc/B/guR1oyP5FBgjFjIu4Qq
	 WR3C3z3eDJoTEsfsZvthAdKlD51UNqerZ7yrjg7jcIyNwldChpw34xQPpaegsjuSSwwp4
	 Aks0JFZNjYit7CqKmFDPVm9xySQiVBOVrygF3mA/7++HZOt1hbw9piwwBTHSzTTbvTk0A
	 z5ZEdyd24LfB+9DVvneDm6R8IITYhtVEnU60xP3pD5n/c59rSH+njNCNrl2ruyBC2FA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="xbS/kIat";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F8606A31F
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 16:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xbS/kIat
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbVVToFU4Y72yaaTL3bg3cPzmMN3zvn5o7AnkbRN7gT/tqKmJOJpSjI7wW7yXzNQKyEFLT7zD2WdpgK60fWIvBfRvd4YXOCKnNDZRWycrAm+OlV7H6S28chgZIx/ikCozAPqbHiUyL1cCvo0oKwG/s/wHqKYWtnTzLYEvU3LTEpa6Da5OdiksAQ7Lr2kglsENXX+wBylsZvKXwW3wUZ25LIQXN5PR1m5AphNJxCUZ7oJp0n7j7UpNdShRdMID2iEvEF4nK/O2ePVMvvE/RRsgpMPJyUOw8bU6hzT+WTQXGcYaRmo+YLmTVt8gt90QVR5Ek5PTC/ZcS2VM+7e2MCCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJIWTTh4jLAJL2YIJISnmsgKKKnYP569dAL2nXkqu3w=;
 b=jsbmMw2CtiFIJqL2RFpOFeYw2C2JFwpnXnJoGePjc4QjqXruNV5pVgHIcIyC/kTIEwwSCcOT90Hmsj9CVaONpKFRMb+9OEWB7BBegZGzhRqxk7PAxKypXNbrMRCP+W0t2FdrEbfRlNVfYpnEAMGyyYb5GbIBRcBxOoHs9pgtNgNYUb8DyGNXT/9BgbUCu+fjwZLDLn65TwM2fBwsX7OxAXrNNxoDUu/3goO4TF8S8nKcq+RttZz8DUjNv0G+HUJAREPWEBgGI9IBsUlp3H6uXMe6qibSiE7Ms/91neZuNp6xBaEy+0D0fSifZnobVsUEd8eRNFuQ58J4yFGcQAJ6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJIWTTh4jLAJL2YIJISnmsgKKKnYP569dAL2nXkqu3w=;
 b=xbS/kIatPLk8DfUALE0kcWoJfJCIw8gcA7Yf8IG1H60zPicg0RmHhks27OtDzeV7IBHX64M00uXdXr1qBHQk7jX3T/WiuXhd8HLseDxcEyMq6klSNEcNOojtRKRALQsdTD2q0PC6cZ9vlWSVr/b4RYoakAhYkWMsKSTKL+5H3V2myN59uuLhjPMOaAiV0ScfcEwXcL7n4bVlfPf594TvP+oIxeY9GRvGnWn5yy5fFqZMgTeb66XNPSMNi3kqoAvjkgDZhht+Ie/V9RY3jA8rpbtdbOpZ1GexdqkuZ3ZsUDVLwKjZhG9MU8a8BpmPziXN12tEaCSzrCIIGNgDiC8LQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPHPR04MB660717.eurprd04.prod.outlook.com (2603:10a6:380:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 16:22:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:22:14 +0000
Date: Mon, 23 Nov 2026 10:22:05 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Freimut Diener <f.diener@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
 virtual timer interrupt
Message-ID: <awRoLHZY3ySkU5e0@SMW015318>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-4-dd97c7fca4b1@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-imx93-frdm-fixes-v2-4-dd97c7fca4b1@pengutronix.de>
X-ClientProxiedBy: PH8PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:510:2da::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPHPR04MB660717:EE_
X-MS-Office365-Filtering-Correlation-Id: bc27e7e0-e00e-41f5-0662-08df497deef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|10067099003|5023799004|4143699003|11063799006|261102123227099003|261102124527099003|261021121427099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	19kTdYu/EhZ3mctuVTDTibBOoaUrUSd49JiY/VIS/AGXHMOkevXdM0v7Fhkk8ERh+weJ/a4XSGfxJCHE3e2lZMnAJtngCzqseKD0wzWt8Iaip4zLMSaHTJx/h3mGg3v8BVh/3wpuuelgDUBbjmJyAWSK7ZXnvp72p3/un/opfz+CMs2eAyCo4P+m8NI3drgNOPM8DR81pGz5Hombe4Nl6q1jSXH7SZPMbnXgubu5UFlSXEAT77C/jjXx8wsyEBHTKf2jrmgRd4htG7raEDkE8Y3DyGmwTawOYUxjWaCdi/XPXRr8KdmKUZgLnjyyexgRtxW8ZTeMF69qf6zqM88JOl/uzPKkuh+UT9/nV6Myqb/CNHigl24WRHgTaFZLBR9V2Nf6wEd/5eb3OL8nh8E66efBDInCfuR/PyGJiOhhcVxXjInzcXyjR30WiBFKnyHF+Ww2quBe4UxQ7/H4uMuycEA4H79Q1MEBvBgWsAx4wxBCR4uknIZrIqr5W7bW4CC/jZ+rz2EZd98t4FC6IpHAPxJE8DE3nWX2EjcP2I2+DYZU1IEymUtUsMugcfp7LWYErVNgH27dFIK7V+QVsZgHUBpG8JqxbaUOaw8NgfCnUTAJBMd50GIqT10CXFOAUzbw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(261102123227099003)(261102124527099003)(261021121427099003)(261021123027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HuK2f5a+Qms6/3hOC9ywLTW9c1Ipe9XhkTJj16vtKrJW9GFJUhGpQ93Grtww?=
 =?us-ascii?Q?WU6KDs7jkytKGsO+4YKf/k9mxKF5rG47Q2rBTzjToIe7OXyRYuhUEetHni+S?=
 =?us-ascii?Q?Q2PoN8dovyXzILuE/TJW4LvQasveVjRySByy75S1p7W/Tz2xkx/oZRAcC9eB?=
 =?us-ascii?Q?BDurEBM+Xfdr3IUlDp0779fD/XlZS7qH1qzq/ceydgdoEcf0iDftTXBWiDZG?=
 =?us-ascii?Q?NhFH0IfrWlP5oHqG2G75S5aGaMDQtuKo0LnoPGbxQe1j5qZSX0DEbP60Ogyi?=
 =?us-ascii?Q?LL1W2LygYVoxJCqj8WcUZRgCwXMJM63jAGJ3PxS/s03Z3YnD4LmTG9tDCLZ+?=
 =?us-ascii?Q?dheuXCUogu4AyUaouLIbHqvOFTTc5/pmlMY9K0qxNXqP/DApfgnRyL6kbH3R?=
 =?us-ascii?Q?UPom6JqJGFMPcri83TF2t7c93Eo61TDLSzvETXJ8g4DReMEaQLbx8x8nVu1W?=
 =?us-ascii?Q?vGAuQqQ8Fy4Mwfhi5cPlg1++tW6Ppw/TedNZ1SEqYacn5ofXWY1vbH27JvQs?=
 =?us-ascii?Q?XNFUnDsUXc1w86c+JDXlPw/g2HwiwHTvogGA8/4kAl1blOiCaiKa6Ok6avOB?=
 =?us-ascii?Q?HghdwHcrSpdZTtYCU8eXXDUwipZ1bnAJESmIizdSynz4BkyH3I3QZ5DTiI57?=
 =?us-ascii?Q?j74kM1WF4xKZxh0YhA7D2umk/sGUfSQ4gpZyH3vi3sXlIeh+YOvr8own5avP?=
 =?us-ascii?Q?wvx+wZ6P3pVjvra3Q7/uqDaBig5LKebTqWSV3XjQuKLay7EZBHpEopkDKWtk?=
 =?us-ascii?Q?l73ItZxo188+2EQ7zBuD/Ft/PcxZ4/4NKTkw9PB8AeLbQQRN2hlqURfsc13s?=
 =?us-ascii?Q?aCqdUhplXk9Smq6eL/MNdafW6DtoOh3d0+rD/4LFwx2mMxpXiv6j+EvMwh6f?=
 =?us-ascii?Q?a0NQfYm/KUydJz83ZHInW6sdAQAaTSpKySK8zNiR5DXqT7rwuk66Dlh5Gl+i?=
 =?us-ascii?Q?dTdQN2PQmn9/+9RB8PsT21z4pD0avc5EiatEGlRHm9wZPJer9/XMY8NgFinx?=
 =?us-ascii?Q?6zYGMLAxxWkYc0z6++x8sdLDCtYA2LQCxjGOt5SSJHvYMUdpSoRQZjYP8SnG?=
 =?us-ascii?Q?IVTbux9b844j+2k2IE5JOwHxkRADCpJIX2/WGFMV0YB/wgjDopO1S8Wlk6ed?=
 =?us-ascii?Q?2s1feBHY6mmSLE/GVQKKWlCvvC2xqnVNAmRQ59Y98AoZZQbZtYrrDENBbx6L?=
 =?us-ascii?Q?0KZEGYGM9DIzslKS1wpL2GxQJ2Ra5s/l6HXUvVJZt8fymuDC3PmZGumkPQi+?=
 =?us-ascii?Q?4fb2Og0RADmlvOT1KnD9frfhfaXLZjtPKfTc4+ajAySndoaoYPAdz/DRLbBT?=
 =?us-ascii?Q?aJA8XkXC7i9pYhVimPtH2tbDlVIMVmq2gh23JUoueA0K4ZdKUGp/CudQYncy?=
 =?us-ascii?Q?8byKnxLa52aX/xffHCS/HrAAcMrwtyGQtpINeatoPSEN6GU6S5LY2e+ishdE?=
 =?us-ascii?Q?/cKUOc48hLfTXiuwDqIRQAiWLKncV0xFcqlPAL8CqdBd5G7OCMX1f0WMLXlU?=
 =?us-ascii?Q?aD/WH/g9ocTMxOAYxXzV482m6yAZN4KkSfQB7gwBV03pxkWTsqFJyr3Ke9Rj?=
 =?us-ascii?Q?L1jLaFSqU22YviUCw+2Zru8R9JYa2PZL2V+I55YinI9vOo057MbTGjCMPdQn?=
 =?us-ascii?Q?l733m6DT4v9/10rhhQM4IMG/LFnEghly1Vwyc84mNPyAeItmpcG77lpYpbJo?=
 =?us-ascii?Q?X/Lmr2q1swvTDsPSF1nlaig47gpYHgwu/FqbnDP/hGYVA/JcdP4G4Nz5W+/C?=
 =?us-ascii?Q?VxRpd9/Zfi1E31iTHJ2pcOdDU2ZBcoroyIWjyQB6gCKmQko9LBe1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc27e7e0-e00e-41f5-0662-08df497deef6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:22:14.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg9m5tCgP6J9brSGqyidFUzpTed3m/A06QbXEJBimcX1bM7tqWBHKVqd0M0PtWP73mOL8TjDUgkEMAB6t0n9dC300c8RAnQKybajD2bXC5B/+wYQN5BI4sIfQ7M+ydce
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB660717

On Mon, Nov 23, 2026 at 12:25:18PM +0100, Freimut Diener wrote:
> The Cortex-A55 CPUs in the i.MX91 and i.MX93 SoCs support Virtual Host
> Extensions (VHE). When running at EL2 with VHE enabled, Linux prefers
> the EL2 virtual timer over the EL2 physical timer.
>
> The timer node in imx91_93_common.dtsi only describes four architected
> timer interrupts, omitting the EL2 virtual timer interrupt. As a result,
> Linux reports:
>
>     [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt
>
> and falls back to the EL2 physical timer.
>
> Add the missing EL2 virtual timer interrupt (PPI 12) to allow Linux to
> use the EL2 virtual timer.
>
> Tested on an NXP FRDM-i.MX93 board. Linux selects the EL2 virtual
> timer (hyp-virt), and interrupt counts increase on both CPUs. Timer
> operation was also verified across CPU idle transitions.
>
> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
>
> ---
> While this change fixes a real bug for me, this same change was already
> previously proposed by Marc Zyngier <maz@kernel.org> in May as part of a
> larger series.
>
> Link: https://lore.kernel.org/all/20260523140242.586031-10-maz@kernel.org/

Thanks, I missed this one. I will pick Marc Zyngier's patches.

Frank

> ---
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> index a68ffd04ee084..af4c93c128d31 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -82,7 +82,8 @@ timer {
>  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>  		clock-frequency = <24000000>;
>  		arm,no-tick-in-suspend;
>  		interrupt-parent = <&gic>;
>
> --
> 2.56.0
>
>
