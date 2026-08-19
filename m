Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451213B71DA
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152656; cv=fail; b=ZoXZt+g6p4RFzatoAatjOB4Iy1VL2SurTquleFP4SWD/EOOFbA6A1nXfzCbZyywPwBl+3sYvEequcKACws5dSwz8AVb9xnqmfGIjCg4MeNge/Ju4S29rkVRvhn1Kf6Lk612ddC8fMwJRpVb45Rb3yreM5TUmMwo6mx+6Xroh9xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152656; c=relaxed/simple;
	bh=i/xMrkmVU/4r0ycj6TgMFNc91FnKPw1p5M8F7z8u2nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CxDOUw98jdaNfKV16hXpsMhxF3ODrCYS/DTBn4+yn7OuspqU0Zr6hNNalr4/jlaKA8H0RCMtjuzHrQvz3cqPxzJCMb5JRH7gWpBoDuwRagVEXbNWP5wSNaVhtsKL2zgo1nQKGgrRZt0CEBgvGyHa73jrEiJBPqUaFnYe7S9RouU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JOEF/AYL; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JOEF/AYL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5ozuTABF9vnq8lOliP1Cfn/d1KjTBA+q4n8WoaSeSrSdjXeixlfyWWUdq7qhfS5FGbkpSz3qmdktwfEfXkDDZ5OU9DsxejsehvotZwfgOx7DcRrLLuJROxIesVbKGxhaYmMHZJBoEKG2tO5RfDeJ9I5C1LRo28oi+w4tCnpX6mu2wB3aZL6dYIRJVrYn9N05KW8uA8eWIMoThAg9Egq0knfHnYwFoS3kEUPcZn7Bzugg3pr5SmWxCB5e3YFqJ2hnMmhqKTBaDww+xT6S5U4OkTifbapgj380Kt1uvCFVGhb0N7ZgAh6yE2RunpJ+1nutUMMYgLRVp+sDEcIE0U/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4QWcUJiio/9HLgXjgINLfnyjtSRinPNGm+gjd8rgPA=;
 b=klrSAi+feWEZ1Y+VxviaVcccOg9EBLQb8LLPflXql4btw0jnRLxNcxju8VoTnZfd8YX5Vt/m2ySGl7SL+5TXgEnrrjpPJXB4G8ZcZW+BLG0Tl0mwNQF7PdZd3/olmSRzfZ10irnuQlOVUHEkzRW4TPUhV/qBbQpgEd7XRyUqeexdwD3HUKXJ6/mRjsXmvZ4yqoUXC9poKr7wnXW/GETCopsbco8qb+JHqjajgINEC5UhcB3vqqMSJOJbx0SA4UiWfuApB5OpexZafBNP+Ug0lcC2ZlbVDtaimapGWn7z0sMsnE/6KAvZ60Td6TvHv46oMI5otk8HJINNGsgMUH9WnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4QWcUJiio/9HLgXjgINLfnyjtSRinPNGm+gjd8rgPA=;
 b=JOEF/AYLeIhNzg57UDwxC++KK9oDMdEVhHVGqNs2VvNSRT9LZHLCXRxIYKNiEp4I+v9y77bPi/p6R8cZsaAmn3iiDyczGAW6btBF6uzV9jFXP9jPtACgxZNAHUEIzdlvUgwEOiTqbCKkbOdSBdTI5RJu1CTlfmW2cZq03j7x2XWT8uVaI0kW8te/uhfkKtf3lpX39VkhsIH0L7KZNnSxrONwvAgdjXTbvq/xIK/DuLzwKSBbj6WpNifUnzNZpBckJ1ZSPJOeQEb7eRQZ9p/poDgSCJ08H6coZ4CWk1FDptMLHbChocHk4+KoeRvZ0FSYmwZoYc8eDTsjE2gRaRzYLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 15:17:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:17:31 +0000
Date: Wed, 19 Aug 2026 10:17:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
Message-ID: <aoXJAx131-gU4qXu@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0076.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9aa968-2222-46ae-4e8b-08defe04fcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sf9DabCW/UV9vU9Z7XrMjWf4lcngLbEPMamGaTYHsm6rS0JmNtgO9rGjRwlTC6+bGlvV/4IcLwZkGE4Zv/uXM4KilsV7bC5Rm0ixf8VFCiiEbaWrVSIXrQurx9mS20Ec4ClW3Gkwi7B7uVyJQOqcq+laShcR65N6DXVloMJB4crv8BQDEYM89AHkIDaMfBz+IVIrV8jdJLHx8Mxumkud72Q3nUYyF4gYad8++OrgRj0oIfye1/tSkOU1SyruIZXEbtTGeIrrMDn29Jh+wyk881cXbUQnCoBwhZ2PMZlcTZyYT4GVLjddAUBUmJaPPqWDd66rdDruaXJYXt3fi9a//riYOtiweK/SszOUgP968t8oXY3GKQKwXEDB0Zg/syTsK7iQymLMVGVUqf8pQSUET/1aFeCdIeXkbsRBRKNOrrviH4UG3WIsELMZ253KXXmW0a3dvA2daJFw6hPQNSVHSUl5yAhiGRSxySD7W+geQificHkd0iVX+BqvXNXzlOaUbN3UaqvsTuOJNuP+6ezW0U34mvFLTItCdv2wCqLqkzSDiCpFczIDzWzweyF6SQPmW77vfP0vgTG3NpzzrJ+sq46oL0Wxa81d/UUT4RU997ca4EXsXDjoeEbdn9L4r9RODKfSbb0xnPVeUdHR6zRvbbHeYCNU0O7wBpPspNlyxJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6nzlqgGq4VQ06mbZGgk/mnJKlF0owttyTNLrs8LD3tBuuffRC4TEfeV6QrGy?=
 =?us-ascii?Q?7+M4IE7JAHKoJI42F4LkqiclWFWW5InVDqX5rNYB3pdm2zyR184Nu/JRuc0T?=
 =?us-ascii?Q?+APQpfJajU048UK7R8VQGroWqvaHbdjWJU22hfIwubkO7TS7C44JnqFQQxwa?=
 =?us-ascii?Q?L6NAiVGvpXQDNoXxn1z0xUMxyeZTBkIC/tjiFgk2C9GORyzKbEFeckdt9+cF?=
 =?us-ascii?Q?Aopm4V9FA0vpyDRu6Rb94P8CQw+Eqro3m8vVJobIJMvrq/C5OZsrErg6Psv7?=
 =?us-ascii?Q?rqHls9IYBsoryDZX5SiTaELwlqXzx3rx/fvVJYJ2stSJlRUJrWQ+d5YyHjxn?=
 =?us-ascii?Q?2HHZvCgkebCc6ukcSOeHfK6+9gSbs6brHF0B9Oy8/j396w+GlviRntCiOG50?=
 =?us-ascii?Q?t6sRb8WEp9B8GyoSFN5knJyLdOe3ipwXVB1KPfwegFhda4ONFtr+stv3Upcz?=
 =?us-ascii?Q?YnJ3hDFxdIiMwHOaoqE4ufza5ey6N/UAHMSGUollI8qDP9u+JWZ28uHoCiTC?=
 =?us-ascii?Q?47Uqs71iurYtqQv+AIr189HE+9e7LLTAAMISTQUBaaHOzh0l08tDMcdlUO0L?=
 =?us-ascii?Q?9RAhpZYzO69riIEj7VS9VzuAXTkZsdYfLqRZKGHq8M79tMTibhwIiRbgwzzu?=
 =?us-ascii?Q?AKztSNQJImmE7++KJbFOrXBvgA59rv0Bmgw2bY4Xk5NbWc8x4IKcMk9eu9ZN?=
 =?us-ascii?Q?1oHBmKddx0m7ne5RWcJMQFFxQCACT3matIue1jAIOM05Nws0uq8xBMYsXGd1?=
 =?us-ascii?Q?IxyxfJs8OjyluUAAmh4xl031JBEw/IE2ea6rTJKHpYjyC4OHoL2JV3BFP8xl?=
 =?us-ascii?Q?QWCeQHYQxlWjZ+IuZsIHw3FiwjN5vOhFhz4YdLgkW6xT7xVFKVWSSblGBr+J?=
 =?us-ascii?Q?p0T/S07SdFVmAmwW9MhnMXnSrmtswAaWfgkCU9X+kSA0ILipserwelt6CtFV?=
 =?us-ascii?Q?Ek03vNh+5mprSbcT/uT7k5NJNWzbxD8g4sOo0tPsEaC6NjoWQU3SunFzg3Ru?=
 =?us-ascii?Q?Oyhf+Z9NAH3Le+/uEgeTAi6xk8ZnvveTLpKcy3V+0oH9HsulVaVldWWaFaCg?=
 =?us-ascii?Q?E1QY8d2QktJgOTjv5FS2t4nmPQwUKu+seKNS2i0U5UDwTb8GiiwpPsp65fiO?=
 =?us-ascii?Q?LmcHsdjTca7MF8upfW/fftgH7f/7G8aaZMPG8golhQwRpLUdRUqpxi7dJVvu?=
 =?us-ascii?Q?VlvzQWWjmjXd4bG6HqPMlcr6Tr9RkDDLatFFbZFOJdw3L8Jf/D/F4SxJZ/It?=
 =?us-ascii?Q?lG2KsAykZUNY6CfypshKRS9uCupy/xeJATMO1EQI/SJr0a3mIyuLX4Mm3jPH?=
 =?us-ascii?Q?6gAQZmvcXVa7zf5TybdCNzEWGeKXgxOO+T8Xa/XI/CjSCfnVbiPnitjsc2Bl?=
 =?us-ascii?Q?0k8A6TQ5MJOAzUNIXxlUIkm4RdI09AffnqzDv0p8mWYeGBX34XaTMUPIfTa1?=
 =?us-ascii?Q?biUiIrQvVDAm7j1QUQoTh709/aDD5WDpg1ZlbrBcvcAZVz1nfeVBTNyN1fXf?=
 =?us-ascii?Q?oLOIrW1t8s23aCQHyteKOc8WcmOWfDT1coAE1flzK4rvAB3EVB7LhBRk5loY?=
 =?us-ascii?Q?48i++jvcdDiedJgAX0BSUD8MFmSWLqHw44e95oSeOeUC9jg+gfy97SWxBbP6?=
 =?us-ascii?Q?6u6QZgk8FVYIKc+OeWe1isVYoza+AsY+GVVY6zi0QYdiAW2XKPQtocf1kCP7?=
 =?us-ascii?Q?bbSmvYedWm7n/xeiLSJPhhKC6B1/HBJkxqMVbDroKcmyczjv5oyntnG5l8fM?=
 =?us-ascii?Q?tiL/xNi6CTnIaL8ymNpQVr2HFooe+nFaQaxw6tZ4SvPko2N2Bpa9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9aa968-2222-46ae-4e8b-08defe04fcd8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:17:31.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba3nAentCIThXrmZuFU9boVU3tL+DDgNi3Vb5qMaOaBJ9ykTnjhNG/3k7+xICum9iRppG2PXVFgz4zM01MQAtKKbA8SsBd8z5TaV/8v0t9WTVe2/nbj0sYwUR3PNuWaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

On Wed, Aug 19, 2026 at 06:05:43PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver().
>
> Now that the driver can be unloaded and reloaded, let the driver core
> own the clock and runtime PM lifetime so that the probe() error path and
> remove() do not have to hand-balance them:
>
>  - acquire the clock with devm_clk_get_enabled() instead of a bare
>    devm_clk_get() followed by a manual clk_prepare_enable(), so it is
>    prepared/enabled for the device lifetime and released on unbind;
>  - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
>    since prepare/unprepare is now handled once by devres;

devm_clk_get_enable() will do prepare() and enable(). tear down also do
unprepare() and disable()

To avoid both devm_clk() and runtime pm suspend both unprepare and
disable() clock to make wrong clock refererence.

need in remove function

    /*
     * Resume the device so runtime_resume() re-enables the clock.
     * devm cleanup (clk_disable_unprepare) runs after .remove() returns,
     * so the clock will be enabled and the disable is safe.
     */
    pm_runtime_resume_and_get(dev);

    /* devm_clk_get_enable and devm_pm_runtime_enable clean up automatically */

Frank

>  - enable runtime PM with devm_pm_runtime_set_active_enabled(), which
>    marks the device active (matching the enabled clock) and disables
>    runtime PM on unbind.
>
> With the clock, runtime PM and IRQ domain all owned by devres, remove()
> and the probe() error path only have to dispose of the parent IRQ
> mappings.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/irqchip/Kconfig            |  2 +-
>  drivers/irqchip/irq-imx-irqsteer.c | 36 +++++++++++++++++-------------
>  2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 20b77fbc51ee..105108d2e6ff 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -555,7 +555,7 @@ config CSKY_APB_INTC
>  	  the controller's register.
>
>  config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"
>  	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
>  	default y if ARCH_MXC || ARCH_S32
>  	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index a9909ecb6fef..a60cc527e619 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -10,6 +10,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> @@ -193,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  		return PTR_ERR(data->regs);
>  	}
>
> -	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
>  	if (IS_ERR(data->ipg_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
>  				     "failed to get ipg clk\n");
> @@ -226,12 +227,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  			return -ENOMEM;
>  	}
>
> -	ret = clk_prepare_enable(data->ipg_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> -		return ret;
> -	}
> -
>  	/* steer all IRQs into configured channel */
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> @@ -271,12 +266,21 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, data);
>
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto err_irq;
>
>  	return 0;
> +
> +err_irq:
> +	for (i = 0; i < data->irq_count; i++) {
> +		if (!data->irq[i])
> +			break;
> +
> +		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
> +		irq_dispose_mapping(data->irq[i]);
> +	}
>  out:
> -	clk_disable_unprepare(data->ipg_clk);
>  	return ret;
>  }
>
> @@ -293,8 +297,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>  						 NULL, NULL);
>  		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
> -
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
>  }
>
>  #ifdef CONFIG_PM
> @@ -324,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
>  	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
>
>  	imx_irqsteer_save_regs(irqsteer_data);
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	clk_disable(irqsteer_data->ipg_clk);
>
>  	return 0;
>  }
> @@ -334,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
>  	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
>  	int ret;
>
> -	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
> +	ret = clk_enable(irqsteer_data->ipg_clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
>  		return ret;
> @@ -357,6 +359,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
>  	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
>
>  static struct platform_driver imx_irqsteer_driver = {
>  	.driver = {
> @@ -367,4 +370,7 @@ static struct platform_driver imx_irqsteer_driver = {
>  	.probe		= imx_irqsteer_probe,
>  	.remove		= imx_irqsteer_remove,
>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);
> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>
