Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC583B3C12
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786129876; cv=fail; b=XeWVTNjZQH342DTkx4flif9CeEgZ4BNlMlSpnifSRkz4O0mAWvCt9uvVgkPOiYJKcx8l2Y6fUrtX7oZTKYH+bLhNSRd9g8S2PGQn+cZ062UA/nWYG3mZGpv8f7I5pQuleUJ44b0HcfrfGLraC967jV+lNYWc2rwn0cMNIS9k27w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786129876; c=relaxed/simple;
	bh=7VXSV5Nq0RRXTwEgIo4fDAj2ZbaFq3TQPz+x1LKT3H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KnQntcVqDZgTRVZ1m48Zg0uAzFRWpoFTIy/F9ZDnN/CMqz60GrpC2Zi3aSLlS2zBa/qmsZy/WVriQO+UYW8hURYRG1zbCzHvQkLcPN9nK9OsnRnWbcEKpxDIsu15X9FfGQbKSXyob7xwN6eQjUKtJLPdvl8oI3FyePkf80bgcYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=muVAjjHr; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="muVAjjHr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjRLk0WN/ECo/YVRqzwIEgB9AYqEfT2cPjrIh3bXUXSPXODxiYu0c0FA1naiXohDPQid7ssvYfjWEcbcCcRekUg66bkPp1jE9WGh309rERuxxanhk4Zo5r70Iz8yOv8Wl50T0FdeEE0I1jiWRBtJPJZ30Fy4IysStR5zCNnhigPNjHX/BQxIzGpv1QGEuVxpeQHGAEXuhjQ/ClOVxkEc2YkSuzOw7ItxwRZUIU1CLHxtUYm7OgnbS8dgKsoZu0FxPiR7HSt0qVW71FpvqdibfV6i6AAep5p00vnEVjjYTmjRV1ZxaUkksM2AbUWnOjD5SJ7jbR7fDTTe1WHF0kWdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBz6fg0rDTbg6TsmkZXpudUoZ9GA/al6aoiLNPAJcIo=;
 b=rH0WaNRqmN6D/jF6iYUMI2hKYO1xESVuEq4jdPtvh7UZ12JTFJdDa5uRI924lGIf2Zd1jP6kyoQAD17g0TTutVsN/7cl93hZxTCg9FUVikz3TmOFmkiRm4iVprfav+0jUL0w5yYZQQBUncX8W6PxHY3nm8ZyoGA9Z4aeZkK9J5vBMQjryL1eXGA6ufZdgHtxsgdZwIx/LV6xuQx8GlJa0plsFGXYvWBZWcpoWLdLzpPbMzOvH3AlkD495Rh/Oa5aRHZUlfDOFpIObEY5H31mhWT0+ZnXipaysYXpp10JpjYYlPYtKmFFDvjeMpYVIwmvltPRiOcM5zsFwNYRzQ5GdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBz6fg0rDTbg6TsmkZXpudUoZ9GA/al6aoiLNPAJcIo=;
 b=muVAjjHrDEC83pF0i9+A+u4dTVpDAi6dLCrYGePeafjGgAr20g08Xm4bJ7frskW7fPvaPYI9UllaG89Qx+2h+49v9t6UGCdFz7lG+4T5BiTCB33FxRxx8HaSCSLRsp8d1sMAQTj9vUlHs49Il4vYUb9Bxz4Jn9ZpPLzbDuCCNig5T/iJhp7HrFYeKOYM7kJ6Y6nn75WIW19wfP7mqQ/5LveEDUWlrv4hKROPPu6iGvVBAYD3DILgCyxbJfMn0W2VkjulBkRwlLP4JynbefC9y/paoMwwPzx5U3WXKfJTyPfq1fjd/JYqpv8fJzyEp/S8G/tPW/fUEosZYejSotKTAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7765.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 19:11:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:11:10 +0000
Date: Fri, 7 Aug 2026 14:11:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] irqchip/imx-irqsteer: Dispose of IRQ mappings in
 remove()
Message-ID: <anYtxoIxO9tuMUTz@SMW015318>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807072346.1222389-3-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: SN6PR2101CA0003.namprd21.prod.outlook.com
 (2603:10b6:805:106::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 3037bfbe-c8b4-4921-eef6-08def4b7a43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NKutZ273ON4a5Fv94/7Q3RjRfedoUcoapAzUhJvbHWRNdvBr/MQuw0FJFufggXjpN19dkMTsjjYTD8GnGZBncRNDnJEE0VEfRyFRROaECP5aF+hHSSX7qQixFFNctKhULwsWCW/G9WVS7mioGsLChRjnykFe3I7JRuklx0TWjxRDban/9I0FGYPN7+H1Nwyw7gHtu+k7un0nG8r+vC2fXwCtF+m+iHpGK6zOG9Q7hjVPeB/sWeu723hXJ/hn9xvm0qye8Gh99Lz8PQtmwnrLAatPV8UGkljr83jTh0koYE+15OCFvveLPnP3iL/WTf3xNi8SJMWb1PS/OTV0KKWqdUVD/kD9EAyyrhKAuzQdrVHfe4TjIP1OAD12eU4DkBFtj8ENP8Je/Nf38+KFgGGFpTd7pIGcA8FdvE9hW5UKEttFddXJHM8Dgw0p5itIoDBUjiBUXg9t9b+clkWf7aCtmMsjhFH0lXQ4/42CWGGxF1Zp0s8zHgaS//IaZ+Fuj3+HlrfdJtcRB9J8tXEqY+HCudZLpTvnBjPowbKOnxna2DyHMUNalLpJ9p5nzIG/YkBLI/muDaf5EIpm1sfrhBYTPm0MA2EMMrIpNCr5EtPMVUi0lT2IGDRaf11q41rIDuNjJpR6AqbZXp9WsphHmPbUhpNSsIx7vBZy5SpeFY7JFMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewNLm1i4djxMd9sxqFJg6gA5HNUi0DF9nJAE5fhB4trTTCMlamkqh6oBU8/0?=
 =?us-ascii?Q?i2irubk4fJsmpbcEZequUqea1PNscKq+oep1aym5xNIM70t0Hr3kDgluwkeU?=
 =?us-ascii?Q?YViSgUI2acSZbwJtenGenetm/CVyj4+UKjaodrG8VDqZPgt3eS/0Uf3VVkvY?=
 =?us-ascii?Q?LKRKVwn2cReT4jRU0grA5KBFhTs6/tIE63sv9LSdGCWGTE+fgCKeuK/LguPn?=
 =?us-ascii?Q?eDKu5eohTvW5YyOK2ySDpBJW6Z7DdxrR+6sz2wOjhqF0nFmoocD4BmQNguwL?=
 =?us-ascii?Q?yyBbp86qzi6nLm0zOmr9cb7DtceDfjOMhsmpYgkZK39z8zpwOwB2ZFjEOYBv?=
 =?us-ascii?Q?PAyAUwMrCnX0FP09OY74nBZggiAEVq7Jx5J/b/BA1wbUh3G3yqqWUF//GBZo?=
 =?us-ascii?Q?4yWgDKKP48KKB6S/r/hgq8zt2Z1Syx8RBM9Z9HrCAYrlr5v4+O+HD7rpGmQ0?=
 =?us-ascii?Q?2oRirLjGgaWNpEY7BP0qaPbb2Gmyhxvg64XdReeqs/LESgm+W+O80m1JzBXo?=
 =?us-ascii?Q?DYTQBKt6s1OHvKZkZ7GGqkWeKbk2mC1ljAwHkHibLNv3JQaUYGAqIoLK85pj?=
 =?us-ascii?Q?0ORg5mbhpb8zmLkScU8LKU+FuvAiizUgOMXMI4ucwvPOgkUAsPvU0Uh/qmP9?=
 =?us-ascii?Q?NPtHs7EmEhbgBcfw1SOJiocjiv04a6IaLMmShvdfWRPqUr1jkVLQuNgtQdV3?=
 =?us-ascii?Q?uGxwKy+YkAYdGVGSONawUNyx/oHOOFetcTDi5BCmfMfniraJYxC7y7y8VLVw?=
 =?us-ascii?Q?huaG3GAmruvgPiOQlFZnfx7tq+VQBkbZcU2cHlefDn28zHPfA90ycLJeFhaG?=
 =?us-ascii?Q?oWNGPp0Yxnu/FIRqX6xQkW6O1wtevFC1Jud0ANVgxnYRlUlV0a7szpLcLZhI?=
 =?us-ascii?Q?ItPNvbt04M1gP7AqpBhGy7hdtAdsz/nsEOek6ZNklhJhDasVjd+9uCz6s/2U?=
 =?us-ascii?Q?iJF4/EZ36jfUHsjNzL3jp4SpYYFFIaXtXFLsOhc+lFbbOtKQWgoDA0FGApt8?=
 =?us-ascii?Q?X/OkMtRt/M+f9hxZTW7jgfYP/mNN4H0Pxu1G8jAw0Q60CyXOxrDtqFSAhlzA?=
 =?us-ascii?Q?EIPhACCA42VcaXQNfqaQNaJ0ou50FRVVaa1bjZNyQPrOeBWQgKTEtu+SOcbn?=
 =?us-ascii?Q?zAk4VDowuAR8kTR7muNUtpe66q2n+CdM7obNUsdI0le7CAbcVh5tIPuHHZSs?=
 =?us-ascii?Q?YKEFSTeo427Q6fWMrqk15XmSV7rNx0Pd6dBt5HsUvdJZ457CwI1Bjin/hbyo?=
 =?us-ascii?Q?W+dZ3Q6xFG7/w5cXCwjrRASuZlemvjVbU9kEjMdpLEirhDeYy3QefFzJO28Z?=
 =?us-ascii?Q?kUtFJfi3FrSxgNI90DYbRTVmbstdOPaFd0rifxblIc3DD/50KPJ9IaMO87T/?=
 =?us-ascii?Q?vSMDmx9cMrVDyXpkXaFhT/AjguoEienoDZFueebTzuHN4NyUS30WmViHYOoS?=
 =?us-ascii?Q?mM4Fr5EF7Ma09lI9tpE3bMOpM0RZtKWrmIpNbmsrhVlBY5jkP858rNqg6AoG?=
 =?us-ascii?Q?z9V19RET8VLKua50xbNMuZipmm37T09l09pealH29K0hTObpNeVjtx/wM1at?=
 =?us-ascii?Q?sx5u8Qez5fnPacaAeN/AO9tzSBFHeRSuqiPyg200KBMrimEfocSJAFlwECjw?=
 =?us-ascii?Q?0wjsPQE2dAroe5iOuU+N3tolAO3y78ivD1Q07P+XP0JhydcWn18cWYuljMa+?=
 =?us-ascii?Q?RWIZh47b6tXZIfLTtGfFJRSWI5aO2/MeB/uivE4rZDB+Ri2kwUZrA3/Zoteu?=
 =?us-ascii?Q?/qGAjb4ILOvbMNNLr/PRiQKLtSiMVE1o3m07oV6h+LzLwWj4Ffic?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3037bfbe-c8b4-4921-eef6-08def4b7a43a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:11:10.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdXQA2pmctQCS15ecdU8CytubFXf1uwMlhbg3HzF0qDg+XppJ1CgwVo32lUnfg9PtEwFeZBDaRnWXDGDbVOevFwBXRwRCEUZT7cZlIJ4mTZRWyUAQ4gAxSXk15kLyq82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7765

On Fri, Aug 07, 2026 at 04:23:44PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> remove() tears down the chained handlers and the IRQ domain but never
> disposes of the IRQ mappings it created. The parent mappings from
> irq_of_parse_and_map() and the child mappings handed out by the domain
> are leaked, and the child irq_descs are left pointing at the driver's
> irq_chip past irq_domain_remove().
>
> Dispose of the parent mappings alongside the chained handler teardown,
> and dispose of the child mappings before removing the domain.
>
> Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> Changes in v3:
>  - Split out of the single v2 patch. In v2 this was folded into the
>    module-conversion patch; no functional change.
>
>  drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index a2f0629b22a3..4a2fe8ba97f5 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -277,7 +277,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  static void imx_irqsteer_remove(struct platform_device *pdev)
>  {
>  	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
> -	int i;
> +	int hwirq, i;
>
>  	for (i = 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
> @@ -285,8 +285,13 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>
>  		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
>  						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
>
> +	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain,
> +						     hwirq));
> +

only call once irq_of_parse_and_map(), why need irq_dispose_mapping() twice?

Frank

>  	irq_domain_remove(irqsteer_data->domain);
>
>  	clk_disable_unprepare(irqsteer_data->ipg_clk);
> --
> 2.34.1
>
>
