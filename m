Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA6326951
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321731; cv=fail; b=BYrAJQbaZPBz0ZLnV4ZhpaQAihPDJG6bmoIefUxTBwJG6Zi7v4pgGkzgDkVT/qpGrGAQ+lQWfN4anDQxgaaT/5oW3sUUH86lOgBkZ0hx0XlCvguxk1XqpVoLz7hY7I2+uoJf3FrbQ69/OEXAvs7z3tvVNF6XAcHRlL/xkbrvBks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321731; c=relaxed/simple;
	bh=J0lmi8jXH5QB/vwU3F9mKvFzDay626Agn5DpbW38f2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qfb6QSbhZqFxxj3ZX8fT3GMWEhkfSzBBcF1O7gaQq/xEGdmSRtuVA+zzSLV89pxb8ZEl0lbJcy0m9bCIsYv1eXK7cNbzW3Ek3APMjDVeNy62Tlip8xyBNpen358MfhntA8UPd3aKNkCpK7nZSIFJ7mITFl5aRMYfNVY0QPsjHOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dP77Wyd7; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dP77Wyd7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfgQGEPXGWzXwsH8BCHLa943tsTuSODVTCsiIJxFK+q1oG/F4siLrHSTJRmiTY8Ywr8pLUiiLg1UaHY26C7DBOHjKXQlOYFuxU+l+O0yXqmF6pRwq4m0pA0TPkgNr7YvfWMchdD0V4JJkY7rPNB6Ze2HzucGK+Jsf7sNF0B2hkG3+Ad2y1glZtFYnUnyHS1vb8asXrkAj3mUQYz0yvosDaSZMUsmh4tYEi18omyLqMFwCqr6jRW/S9Aii0DXV7l64hb1/EWsrKWQ7U9rffCI0BcvYmv3b+hksWZ1aYFRe9yyMCIC+olgjZh4M3mAC2xUsi6PQNzaESoOGF6rhRMUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s16IKdpLJRfDYpDNzUCONtkPI26CsB1V8ZfBYbJmy14=;
 b=cnzub0ehGSkO2g44F2nF+bcJu+ih7AjLMdIwpZkqlCcl0csBw3lm+TTj8qngiO26fWDI1WfF5EGnMeDNArH2Vb28FfWuCBM8cnIbwg69zst5JClHjXnaLElkeSvPYB/RImDNAu2U2gku3MH+OdIsTRHS+dIF5X9nls9rAfraXALEJK8iiuf3ezTLqkYFBKC2ywszN9i4u0MaWmwOPaSYkdYWq/7Hl3IxmOnvuOzMFfzTsejAuYhzV2NmoUJZGSvYnSM4kg8A5xOGXVc1quaCgp372s6KZSbGZ6eNPCE+Aa7cvqjBvDxG4y1hr8lEuKAUJ3QJsP/fTIUk5sueAJgIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s16IKdpLJRfDYpDNzUCONtkPI26CsB1V8ZfBYbJmy14=;
 b=dP77Wyd7MOXDVljQtfAZEiYTMlXvQON4lZCxfD5hDV1BFTGjFmaQ4ZAqsfYvHttzzk3SwfIqzIN8eCLEwac1nU0KNiYAdrpKtDCZ7A8xn8r1Mc8+nYonu2fZRCAWwO9q/zSkx9y48jx77uxN10hnqhWOq2+Fl63jIK2lXg12gkKI4aE4Quj0pW2iO+Gtpg0bSf5gGwu6pBEB8KDmurVhup4H0Ie52q/aV8zDSFdKN+mvHGfjj56nh3TG2GECkNKlTREF81tGqfqQVUzZ/1jfVnYQn53c+yMNnvPrweAL8QLZY3BwdtZseKlyZ6V+rz4gUc/aY8lkkisS80ZpC0s2rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 14:15:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:15:25 +0000
Date: Fri, 21 Aug 2026 09:15:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/9] irqchip/imx-irqsteer: Call chained_irq_exit() on
 the handler error path
Message-ID: <aohddKWL31fSXH2D@SMW015318>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:510:324::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9cddce-2021-46da-d954-08deff8ea541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|376014|10067099003|56012099006|6133799003|3023799007|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uo+y3vPNENJG28G7ySf08WL9Kt2INqxj7TOw87NrnAPuDqdsTEpwJnyTQycsnPpMeS7Oq8PprzzpbVs8l07Z1w5kX7BHjeUI61C8V8NputvgMuX1AEBazI0ElKe+3nMcq7SEdrAyYrZIOvKrhoPhpn5235cKKxusMAclw0p86SHqkpmdsY+gvC6ukdWPjvEVwcGFcf0K1bJ9OBtBxc0J6bbrfl33ZQR3aO4IYYsajwmMXg6rvIP0BzS6uIgPDtEkEkzGLGeoHn/OyJj7xBQHtTg4ZR6+0pjc2DYVrMOLHmFmJK+U2nrUNpv751zbmI9QOXIVuQPuvQkmS/aZh7gPb0LXg3Qn5eVZNY3vqQtJpl3n+Jz9XuanO8L27a+qedUVYp5S3Hf3VnrpKU0e3oCVPhf3Fi0zFxEDewc5vXrq/mfXvIe9yNDM6PqXrdaznGLXKwWtiCVpP4SQiZxx5bVCXC4Ev3P3yCL6ONo6r5FIy7DVg0631B6O6GhJsYGtLQFcCmlWWdC9ervaqCS3LcwwBGd+TR7aGD+l/z9uFoakNCrYRTGlanPTuyVzfNbBkUo0x7cuYP6iK88B/niugxdCDZJa3OdPCaFxuD0lt9GysBDT0sXm1y9G+CSeMCStS9GrRu/m3JJOKyN4VeYaAGh3kdiW18/KPYb9cwxw8KEEbv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBLgzgqfy5GZ8BzifEAKy+aFynO4pGbkncNjuk+NyMVPFAPvyYu4eIKSs5wk?=
 =?us-ascii?Q?rmQx9WoqayVBu9duLdQeCwbvQYbf+owL+NUb8JGo3Wegs+Ok2R9KqUsxc/CX?=
 =?us-ascii?Q?obqXlODHp9W0NTaifIoWD90agmTQ4+1L9e/S+Jl9Du0TbfkX6cQ4R7ll7MrR?=
 =?us-ascii?Q?9SSvC4mAkPn4xnDlY73opax/AIqlNuJ/ipwXbOEjpxolWQDwiebG2OIapxY1?=
 =?us-ascii?Q?a6pmMtDsU6gcnh6zKI/TXbaXou2fQMVzM3OKAs+kZIk4PPt4FshGDZTN2xbJ?=
 =?us-ascii?Q?nAHNayTTZtIAbkILkAawS4EQ8v36o0XDG5UMdChouJyMGxfhpIID8KZrzNne?=
 =?us-ascii?Q?KyDtppCw/6iu/aQBNxrGozyXMJtPrtCdVe+dCOHEwZTyZWWVKbX3Dt+9mlin?=
 =?us-ascii?Q?V3iyoqYQ9H5qqE+6zqn+ifbxToI9lIST5K4t/pDDUSZyrsgVJ3ACr0KwkQAV?=
 =?us-ascii?Q?HazaRM5WB6RK/3JlQrRFz+/s+galUG2BScHYaJnP0Zt0mZyWBdfch+wTo+4g?=
 =?us-ascii?Q?IpEIKmgGvtRDbJaaZaKLfD53y7RbV9JGYOBaeudqD+6GI1RrILdn3kw3hMaU?=
 =?us-ascii?Q?1ivEfIHJSLYv1DufjhOj2USfY9XBAosnGatHxEHypUN1JMvWN+5bkUIJsghF?=
 =?us-ascii?Q?LwPjy8G+3V405wJKIKTGkEGndqV8ruLS4oG8+AanFmR52e7/l2cccC/sUVvc?=
 =?us-ascii?Q?3Ux2qCl39iCsYNvpSF1zP5J1Kl0s5tYOWZlcQTo3mg7CfERsLYxu32GzyzEs?=
 =?us-ascii?Q?Hlm196kUH9XUleYxDPxAffXB0pMZTi7f72F0oAeA4OgcVtUU1v2UnozXbVg2?=
 =?us-ascii?Q?TZ6OgKRbeFEgmTkYU2Bb2qQcLPIdSXpdJdDWY0uVpHxG1z0uP2Fv8c6iG1Y7?=
 =?us-ascii?Q?oXN0Orl3M0dfgf+XBtp5iOaejUWB+gujxdEKHLYGkAATUrGVzGLYzsSRBdOw?=
 =?us-ascii?Q?jMBFd5r5Hg1fIrDhKyGHRrec3Fza6hV9z6JqPRIF3QdzSnhG60CNAPnXGV1p?=
 =?us-ascii?Q?QBQQRiOiaBwAWC1Nt27cK2z49bhQxgTU202EGaXTMPkeYFAgai49VaVZFHLy?=
 =?us-ascii?Q?vWo+H8yTGjxU5270ti+jh0F2Ob7aaHAmeFuxUy+vbgHasX159tEkXs7HMVsl?=
 =?us-ascii?Q?iE4GXLArQOON4zFiffA6xo6F29PHyLKwqonjH64tosA7Ko+XpjO1SOIKc7pE?=
 =?us-ascii?Q?UcIipOdKMs5FHtSMZZp85ZKN56rsBIeyYbPs/+fdzdhJiLHYhKwShR8SP96F?=
 =?us-ascii?Q?xKbG0trTSiXe/kpBXp71e9lCoJmSHpg6yLmBimq3vb9yiJT+Irlg8fE4Yxsp?=
 =?us-ascii?Q?HUIZrWi3KlBO3iAX2vPSRHurDtw5WDTYaq5QyIuLFuwiL5mKZFYEgSe2EvNT?=
 =?us-ascii?Q?xvrpjumreIP7YoXFQCSy48ob1WFi4pI7tPiaV8t65EFEsE59BG8PHxs7iioW?=
 =?us-ascii?Q?c3YBpBreOSDo7Ibv4nZ66L3z7erzTZRrpR6CIsBBG6aE9szM3u0sXHbHKHMd?=
 =?us-ascii?Q?H5bxQaz1oyLCaQbRL/bkPuGU49tfM4NPdbMK6ZgZkWagrohw0Gr8UAFNxtXl?=
 =?us-ascii?Q?/Mn7Sw9otAwMKQu6oRbyfUyfBmXY6d7k1Nz7WPbY/xo5IvaaU5dsl6Lhcmzj?=
 =?us-ascii?Q?N0WRtcMooscPY0fdiXq9sICXduJwFhxA5p94UdnHe9ZMlIztE0dVI6kZJQsz?=
 =?us-ascii?Q?4sJGk2N8nMNnFUlzwfqq/l3zqFim5dvRAvuHaRibO8IKlpnbjt8FQ22x9CUs?=
 =?us-ascii?Q?/tRjkTsTMtHKmKrpD3CLOi5JO4eEzZQDwBOniyoXo+mx/mBwvWfi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9cddce-2021-46da-d954-08deff8ea541
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:15:25.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsqUOFhYtShk2BnOHL95OdbRpHIq40N41kgu56XG3GAh4SgHbBhgefMN06+EhduN5YVfnf7ANHFW3APr6ak0+OcBwdfxstdS5JxLo5FsPXSN3GNdsDXQIMPaxd6mKHxu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

On Fri, Aug 21, 2026 at 07:10:31PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> A chained handler must pair every chained_irq_enter() with a
> chained_irq_exit() before returning, so that the parent interrupt's flow
> control is completed (EOI for fasteoi parents, unmask for level-triggered
> parents). Skipping it leaves the parent interrupt unacknowledged, blocking
> further interrupts multiplexed through that line.
>
> When imx_irqsteer_get_hwirq_base() fails, the handler returned early
> without calling chained_irq_exit(). Route the error path through the
> existing chained_irq_exit() so the parent interrupt is always completed
> before returning.
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..1b8d0c8eedb9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
>  	if (hwirq < 0) {
>  		pr_warn("%s: unable to get hwirq base for irq %d\n",
>  			__func__, irq);
> -		return;
> +		goto out;
>  	}
>
>  	for (i = 0; i < 2; i++, hwirq += 32) {
> @@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
>  			generic_handle_domain_irq(data->domain, pos + hwirq);
>  	}
>
> +out:
>  	chained_irq_exit(irq_desc_get_chip(desc), desc);
>  }
>
>
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> --
> 2.34.1
>
>
