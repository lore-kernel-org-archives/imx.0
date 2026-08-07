Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD43C1D44
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130075; cv=fail; b=q1gavtn0Y2S/Bcq0BPbvNNRv4O5eZYWKcgarHCQYAajnmDGhFD4XB/ZforGht5xDqmxhc9c9uiTZr1eK09vn+fH9+Vt/TQ17/afezve52lVKohuuLvxVsRVvzYVQtArsKJpqjaxq1Pl28aBWCfcMWyEQsNhL8zScCrzeVkyH2lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130075; c=relaxed/simple;
	bh=rERRA9TEXh0w5IfkfY26zk1vqLPr+14NRm7w9PAIDdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OBDNiUMkdoJV+e0DUyS6jGMxlrGHC+8HxBAXfjJpobm5UG4Q9wYhiIXejyrG3opeFyXct4q7i2WJ2e4nOEPFdpjiZ6bNuUP9hjo6+CCOSmchcn8sDAsRO6HkIHQoI1VluUYT4m6ZMYX4+tSzLC096vmOrCQ+TyZScvauY6T4aHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BRJmgtFs; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BRJmgtFs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rba6yEi1f1AVA8AL9QEjN7VcDG+/VSyRBNV+klwGZnlTjCzldfNUfQLjuQ4WnOPihOHJ1S5jIKTNzMTBEAZgjFtsbtIJH8cmE3NBFJPEhR29xCV3GXbv6MFc7PV1a/11ul2yP+bWzcp8Ds8DUS/9qkqITNsDSIim2pxGcdfCCAlZv2eE5YgT9J5GrMCjaNASgMyA4y7ZRRNTUanMfAyTCNg6GYEYe/oe/+nZ34Zs3MulropvdUsmdJKyuqCwHPtyfeRsCfwqDGYnyiuFUJ14QiHTQ711XaPxfzVvcKPJjgrWBq85yXWpy/WX1OESsZwFq4ci5ie5Xa0uet/tN889tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YRn7XzUHvgGtNZ079Tv/5u5lmT5/qCiS+Kyi0lI22Y=;
 b=B3aZ2hdQER+XmcsrW+1YNufGPXqb09ZK+xhYae5pavX6YA/wrjCsPR0OhZX6xEd42oUAH+4ikVaprqwVshqz/j82984z+19/diqnpel/Eww3jUuQF040s+E6T8EhA9yI888be71mMdi1/hVNvE8byz3quNcqHfVStSgzXZ4Yx4I2skLLYGPX/xELrAorWDhdxU0PK7ORX0wTrqBpUeHpeVwBIVaChsTP1z0n0OlPdcDM/Pan5mWfnv76PI3w8aafm1OeuqyjqMMs5Mhq76DdDpB+YtLjZtgPeE2Ct2fnBHNRu5IQgqdcZFbIsKnSQGzu7Qs2HuHEsr/s/hMgikmDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YRn7XzUHvgGtNZ079Tv/5u5lmT5/qCiS+Kyi0lI22Y=;
 b=BRJmgtFsutT2917qoUwW1DltDGAl2cNvvvC/SlTCp4IEBi+aA8GKv5r5bIoYPgFVZmTVaZuUctLQgf4uSUzjvgzKSLiYgB2V6gMS35vLDNdz/N+3B9knpMNsfZcqfuVz0Wvpwwr9GxmecFBkbpT4Uq3VHKH4jv79F9BqXxJuqUlBrYSXwlSsutx6QLb4LHJjs9UsAdR7YKd3VgFQe9y6h/ZQ6g31Sfg6/vSsem9750O+ocWsPtuHYIZ2yeFhh+zDR3Y4bW7iLRxcjcDsjLjVdnkimXDl+9fcBsCZ8+5MoOLGFxn1fXjpI6asfR7WLCcgbBdDxBeE5mDzXfvU5CFgZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:14:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:14:28 +0000
Date: Fri, 7 Aug 2026 14:14:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in
 probe() and remove()
Message-ID: <anYui4Xjc1iphPL4@SMW015318>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: SA9PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:806:a7::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f347eb-c00f-4c8e-23d3-08def4b81a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	WL7jMrT0jD9kb616BRzjhPm3IE4NydiNjSuURqDYQmCZYZILxgvu1N4Mh00tC3VbWYwEp4HBq8WDub0OM4BayO7qYO24QuXvjxvGVmjm4s6YhjOwMfIMiQP9YuSWV6DEdZaS5pt4W8/ioIXJVrFLv/qsiPACEfg5fvKb3SzUEM491NE9kVQjCh4wpX3oqQry4Jwu9Qyb8SIK3ddR5NEMe1ajeX4v86pUdwgWgdsGT56LTQr8y82oooviDkb7wncS7rVhiAXywVDOdlxqlJat/XPFExunOxUsytJgxFRa6LSOoYTM1/XYC19UGqwHZrx02YnWRifOwRhtpMWAb6R3IoNa1Nyh1mIRkzkmpRRXfRzjopFocJ40mA0qoTEYzYtEiYyeCREqlIUY01ENlGXRaweWsk4zye6cYP7DzdoBKKSRBjVRDud6GrOQsAL0/y3z8MEstCc+Q/GR3tuP228BcSVR1ebbcEypZ8dDdqjWpqzGJ/O19vfCwpgMk34SMpgzl2ky9O//1n+mfmmpad15fbMmgY2pVbjeXfnBirK9xi7eNE9kv/8Kfv9+Dk0hwxhvAdQh6JsYaKf+lgtOPORA7IVABgoDof2tiEl5jbc6z9vOMohbTEho4VjSA9x84uktTy72pLJVE/XUPKhqLepjUCzQ+fB7tDj2f2itQ9MYyzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tUD74pv885pel8sq6l5UXLCjE4e0cdxPQOm/1SlSefUoefggyRLKZmPFM3gq?=
 =?us-ascii?Q?EXII59oF7qJlacvTG6+kD49NLy/L8ntdLfEWeME/IuiE1ecX6y9nPf49FB4b?=
 =?us-ascii?Q?JMOGM+oUxfO7QiJDWFsZ3L5PNfjLr+dNdeogXOnnYgXrgiEgFNkWACszBmwv?=
 =?us-ascii?Q?8ZfGc+YHEKNyVDhDiM8i1icisBRj+8A9dXby8NXGDE0QFX0eU4jblZ0W39Mh?=
 =?us-ascii?Q?gx9Hz+je825GxZziIJeJ8Ipwfmrr36wVYjifspIcCGKlTMC0M8+gLmUekx1m?=
 =?us-ascii?Q?cWKeP92MAxAagMUbJ3/qAFW4pa+gs1wK3Jq6JrUJKwxEov+Ll5qu8SEivpT0?=
 =?us-ascii?Q?5nZsKQurNbh3k1HGN/SJu2aDet5Ym612sdvGpM99NFyZICjFPj0FQ39NMtwE?=
 =?us-ascii?Q?EVDF/BWA1ese9/ue60+huAPVjOMD8n8DWh+YlGm0VYBM3ViEqbAvEeNcuRD0?=
 =?us-ascii?Q?0w+XhaVssHWD0IvR/n/cltVNPlcQCdn07NPZjophcPXQ2gfP/qWOQQcM3R58?=
 =?us-ascii?Q?5FPY2fZG9TtCKBP7tpUOK5lFFCQV7mOmOSSmq3/XYnwuq8hBRrMhrRtaxZck?=
 =?us-ascii?Q?c7HReIH+VDpE1ZgmSHndekjkiAJl7DtLi4c/ivAANkRsyC+gW2pp40l1Cstn?=
 =?us-ascii?Q?PA22rzB6X+0MxOUSwx3Ok46taesFXtHT7vuLZMN2AJVNSFsFf5k2DWTeb/FY?=
 =?us-ascii?Q?KsQg5rJ71+l562wgYjVqpcAF41lX1TpV1LwxfONSsB32V5iQabozrwHzFP79?=
 =?us-ascii?Q?31ALCJYbydbJ2vMqC3gPpyqVPx/h8zwZmBwS4OxYvTEk2UWP8e7cvJOoMtmZ?=
 =?us-ascii?Q?ct03E7P3I+kt5TX0inT1ZVraZ1BBQ+khwFCH3qLSMHHcULxgLI3opfJo8M1P?=
 =?us-ascii?Q?Q+pULJ0e+YC/UTbn31Z3V9BqJtq3Jp42Wc4fe2FI55GaEJ1s9XWOfxT8TcZA?=
 =?us-ascii?Q?i+XgbnWGwDjPI/2noyqTkC2M+P38avU3C1aXVF5yLIquZ79LU70Y3mHDgCjE?=
 =?us-ascii?Q?KN2h1YL39x81e+DrZ3xN8UuTNW8WJGNSdBIG+PrUsv78QuubTU/4d36gz2y9?=
 =?us-ascii?Q?Yr2ZGL0uG4jZ8yzwcKpk8ZdcIMzp0aBNlS8KJAhMWIb9DHBZdVzrydGXldPl?=
 =?us-ascii?Q?K4xMY+jG9NW6V6hN3GBO5zn4KJCLNc/GPwEwMMjYYFoTvdr5oo3EFtkW8BtB?=
 =?us-ascii?Q?ncpQfd3mjLuOii+RiDt4Wti+tktFvTpa4FysXb1NLVpOL/YKNrksywr8JGvd?=
 =?us-ascii?Q?1TKcrdgyA7RfeGVY7zEMOyOlC4Dk+1T3tXnwgAb+iNrj4SjIW0SeEAFQEGh+?=
 =?us-ascii?Q?sTpC6vgX1KHQq0rjSTzrrMn6jA2wuqYcLNkSoiAq/jZeleagTMR+x9NWN3tW?=
 =?us-ascii?Q?fbb+CqT2RgnAvpwRwUTcvXorySMhjMTPC7yb9bI01CDX61Vzfann0WuCGRRp?=
 =?us-ascii?Q?cyfoMefQiXLbMkaTVh1FZoXYi/8io0yW4RrzpfTflRN9JGEPTXzbdqVitAXz?=
 =?us-ascii?Q?HdrS9og1Oceue+ddLxC89jyhiDLLpOaxJWc6zV5m9WdHOQIGqzz+0ieDeybh?=
 =?us-ascii?Q?/REZiUfEyeUH527Vj2TN9NvQVgyeM5h3oSCF+/FTlY+6+Yp+2oKeFC8T02Zl?=
 =?us-ascii?Q?4/L/tMJjrFjGJAxg2gN/ZZ6aeJ0x+a3XTQq80HoOkdtrq5Ahh4C0iLUptkZ9?=
 =?us-ascii?Q?LYt0yIBmmoJ6W2cg8hudgIDGpMVaJVQxjVRDwp5YeZLdPjBeNu+KrlDxxYtt?=
 =?us-ascii?Q?8bFZUuz+PrkVwLTYsZCdK9GSglV/g5fKXo/ZzsNANyLbTD4U61eS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f347eb-c00f-4c8e-23d3-08def4b81a42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:14:28.7941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT4M671sEDARBMOVOk7tAnwnc7nW654EAepk0yACamLv+1N7BJXlX32x30LKtPZxRCzNGQ2wuTjaWNbvAdpkAyRSW+IBw5RD83S6I8D7WAX6OLowu36trkRJCB1v1E+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838

On Fri, Aug 07, 2026 at 04:23:45PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> probe() sets up the chained handlers without first masking the input
> interrupts, and remove() leaves the CHANMASK registers untouched. For a
> built-in driver this happened to be harmless because CHANMASK resets to
> all-masked, but once the driver can be unloaded and reloaded a child
> interrupt left unmasked at unload time survives in hardware. On the next
> probe() the parent interrupts are re-mapped and unmasked before the new
> domain is ready, so a still-asserted line immediately storms the parent
> with no handler to service it.
>
> Mask all interrupts in probe() before wiring up the chained handlers, and
> again in remove() so the hardware is left quiesced for the next probe().
> Note CHANMASK uses inverted polarity (a set bit enables the interrupt), so
> masking means writing zero. This mirrors the sibling NXP chained mux
> irq-imx-intmux.c, which has masked all sources in both probe() and remove()
> since commit 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer
> support").
>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> Changes in v3:
>  - New patch. Masks all CHANMASK interrupts in probe() and remove() to
>    prevent the interrupt storm on module reload reported by Sashiko AI
>    on v2.
>
>  drivers/irqchip/irq-imx-irqsteer.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 4a2fe8ba97f5..0c9c99f1141a 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -236,6 +236,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
>
> +	/* mask all interrupts before setting up the chained handlers */
> +	for (i = 0; i < data->reg_num; i++)
> +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> +
>  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
> @@ -279,6 +283,11 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>  	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
>  	int hwirq, i;
>
> +	/* mask all interrupts so a stale line cannot storm on the next probe */
> +	for (i = 0; i < irqsteer_data->reg_num; i++)
> +		writel_relaxed(0, irqsteer_data->regs +
> +			       CHANMASK(i, irqsteer_data->reg_num));
> +

You access register here, do you need call runtime pm get to enable clock
first?

Frank

>  	for (i = 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
>  			break;
> --
> 2.34.1
>
>
