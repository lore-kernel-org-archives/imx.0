Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871A3E3C56
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330388; cv=fail; b=GfcfWC+vv2PrIKhtfkGQf0Ht5p1VtIq0A9FRhrbRdM5TWR110nyUIo5dyEOrC6YXRpiRy3P/2G2iFFkQ9IAMitYAG6iSyl1lrVmPjQo716prA+wo1VSaEequD5TyGMSoN0l/gsi6dfGXn8dr8GPjV2Zm7x770wEurrvQZQTyllA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330388; c=relaxed/simple;
	bh=yI424gL2FpH73wbz//4Zp0nb8+A1OGwRGL+eeJ06QBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cHVw6vapIdtZAnZjUs6M+wT1ZIUAC2mh+ldiiLu81I6LfKIjeZ8EC6Rx/IC5BSCXPimubHsUn57yfrVNi4IE1WFe8z4U8VkToHIM/WJwHpsVGSCW4qxZp0rb4MdhS4Qm7fzNZojZJ2HJV8wIfn3LhvtUdoN69On3kvvRwFPA7Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LDkqpp6D; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LDkqpp6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4XN5SmZ1LwU6TSCTILoXVrpojsyH8Cqt+4a1LML7JuI0EnGtcDw5L4jfWuPGuJLs1/jfOAaEqJLShK9J71a0cjyxQ/R9UjElewtKKZcrgskfwgqueMXci/roKB5/w3acwxYf5ZCoMXLV5ZeK/MwGHaiFbCyJxorVsgnH4MemFtAh5XKXijMDS5IZil2qk1SFkvneNeF/aQBE6hVzb4h1jvdloqqfyJNaK3t774b/57jB/E40NwBw3CikWW86Wm+Bw3iRbjAhIqR6RVpcwc0oekDd4O7UQWRv9oDbWhgBRHb3HlhT/BoFujyZe/+KoU/Hje1I75Ygw6sjvCo4/3H+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zm6qRfSFYAS4aSECGN+3ZwFnKLqtaBlm2bYRthAqk9U=;
 b=Oq7ymsFkrSxh9BZww2vsJh0SpBSK6b1fqRPJBa4Cl9zjYJpP9UA/Jil1ZAJPDecF9K8+kKbPZW5hZnD52yCWkz3m1WlZGjOxtTQPIZqNm97U2ZeNLPUcGxJi9bBHkbGa1aEtvFUmzqZJpKjRLi64Pv9nZ4MwAHhwnHizs/zDZdB239fYpykVIs0EXuSQ73ShDsLpYeGlijIxliQ2UQVIMSvd/M0pM1BbnGECDV25WSmarietvp/23fZIwaj7qTARPnhkay9CfYSg/hjR9Ltc7LPgdD5pjV0MzrvhX+kM1auNzRCNrW1388bCe43HS5OxLGvgoEn6bEZlWmZWKK7w9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm6qRfSFYAS4aSECGN+3ZwFnKLqtaBlm2bYRthAqk9U=;
 b=LDkqpp6De325x9pjsxpCc5Zw1xfGuhLklo/ChClRyDOZwGaawYW7I02TLRMXbgfqmR/rN9jd/rR3WdBbLIVLNjF0e/f91h4eTDHzlyfrjOtTTH5kmHVMruPyfVRwB80O21BzV3MwYFuN2zo6HWm2qRwd7BVIthxpl/z6T36rQMdyvW1Z0o0Tq3mPrW1MgvGKLq4Tj1LV+IIZsIwcyUQrGihqU/5Oz/L9wpD/oFlLbirIy2nvZ6bDAK9fC39eptL10W1jWFiAGa/6s0z96afHJUb61+8ZV4OoCo1ntFP6oc3CsWrOLN5ddl1qqQzUluvztDv8uc3IMLRhakHrZAU7CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10382.eurprd04.prod.outlook.com (2603:10a6:150:1eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 15:46:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 15:46:20 +0000
Date: Thu, 12 Mar 2026 11:46:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Samuel Kayode <samkay014@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: pf1550: Remove redundant regmap assignment
Message-ID: <abLfx7-KXTOPw7dQ@lizhi-Precision-Tower-5810>
References: <20260312-1550-v1-1-5a84b886ccfe@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-1550-v1-1-5a84b886ccfe@gmail.com>
X-ClientProxiedBy: PH1PEPF000132FA.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10382:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bae90a6-68b5-44df-4b5f-08de804e81b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|7053199007|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	tOj2yd6NIoqFVcLBj47APN2VcwGr5A9dEJs8C1lFoaj9F4TiQHkrGY8Z373CqY/kmhXq0BLi6zY2ZLxLMbMZKblJW50M9OSI9r4kEg9L7XwHC00uWEWTf4pmJ6lMU38w/dTmXGxP9JGUGijclHBbIpURp1O6GL0AVSFzqJID+Zm/IF7vqVqKVwRVS11Z/glhaZE6V3d+FeY2HjqWgIlwym1J3iuA22LO7eT4L0kyEVUQn8A2MDV94qihWMvm2S7gQo3vOx1nzOo/ZqCW37aNCeR+35oQ99P6theVZ/xIMVrchCmeaASvDm4CThRk5S8C1lk5IJnd38SBXL2JOhfKhfab34Kqa6EB6zKN1bPQUqkhgjQw8fODK3IHUcjh/MT1qaN2J0l0NmWhlnftJEn0I91TcoghZ04f8seFg9NSr88UZb1N4e1fMm0q4LapOHFVnRk+zQUTdrjNicTLZeG1X4ov7GwkCguqlnJGNicmHsUqwyut/RRofHVS7UO7pH+ZV37VGOWmJr88fw34XQttYIVBDeZ6nlQNRndMcjECdbBukq93mqGVNEFrGsK8Ll+4flerTzrjuNARnYrLb+ccBuqcLvGsrZ4k+QiMennH/N7LCRP6F/oYCBzqFb6B3+6JKcviB2ljduCD4dI0Nqk3Y9f1L95NbsdRgZIfWAqF42TTSaGBWsPdEXR8/8yAIWSfy6mjvci/ceJ6H9I+euDatdpUQNIslXNH8cNa7YFAzic+I32jcnf1NT6gFjiaDfu0xaG5V7GfyJacDNJ+09rP3g98hRrXFVevvqvNGEbYG7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(7053199007)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tMXvV40DlyiBsQ3gKtCA6d09/V+1TYkcfxPUh4uNeiHSFtMAlW/dfXLsbm96?=
 =?us-ascii?Q?oluZhZ9SfmXwLJNhlL+AvONGcRIVYYf3rODxq0zAROZa6mo8JrLL13V9L72X?=
 =?us-ascii?Q?9++SCFGFbt/XPpqzivXJIdz5/QpVYotDZuoGAq4GLghMxTmMk+WqF+MQnJcT?=
 =?us-ascii?Q?/cw0VkiJYm+Z8EXGKIBYxC54WVt/hXOdgRAYLcBU4dbLJJ7/Ss1ST3KMQlqW?=
 =?us-ascii?Q?oPYWHGfyfTVau2Izz8vFOdr0lnNXGI8RY7r0JHb1uyaA3VePJILO9bUladV4?=
 =?us-ascii?Q?D1abF1NuNmtn1g7xSn5gEJAF7VnlQdOhdhqwWUmiKf+jlGWcDr58MRhdzXDJ?=
 =?us-ascii?Q?FK7uel7x5150b7aXkBwPsq2esCx7c5wUf+qZAVVWQbMj07rYhg346bXdCHTo?=
 =?us-ascii?Q?Hkzft4fsbTuGSnqiD+9hgRGw4RnInTqSROZVGcwqYw4eK3KDbiHVY31GDAAg?=
 =?us-ascii?Q?sGpMNNP91I9V4N63lmKitj5FDge4GiESWvnx6g5WCuYVbcPpvPxY9Ub+UGBP?=
 =?us-ascii?Q?iBtd9UTcegna+jUZ1iXjvEZ/DlcDisoN4F4K0DeUY3tUf62cF8ClWNj+8z7j?=
 =?us-ascii?Q?m5VMgLqGVkOUySrcx0IbNV5kwpKoqfYWItkngKnJHKIz3ruj+cZtxugh3fUj?=
 =?us-ascii?Q?9Ca06Ed/eWIPYgvhFHjv3QtjD1R3DEuhaTgsrdXWj3K9oM85mQpWmiQSlQJJ?=
 =?us-ascii?Q?v7PUOJSKAVwUXWJrUrlfSr2mwYELbLfyqQKadvanVym+ImmwZ+z4OyxyX5uw?=
 =?us-ascii?Q?aCGlyhRW7p47c2YrAMlwZ81KP0fEnkBnbmGCNrcSexSBcmBuLD7n/hTzkwLy?=
 =?us-ascii?Q?EyeK2NQZpyX9AhMGDUoYCpj0+2Br+jF8XtSa0dvEAL6g0a7XsAzVo4uszQP7?=
 =?us-ascii?Q?DsIxLEsnaOMNsOa7dOtoLQG2IDJ/0op0kJFWMHME6QSQHBqofqcC0Hn3S6Yz?=
 =?us-ascii?Q?idLi3hFUQgjVzhtXDlNvj43KGIuucZNEcDnAETgQOmrEhLgcQvjxSV8yVhwU?=
 =?us-ascii?Q?R6VJjoxpN5HDwubee5EILR7mpaEXCTAnSB+pW5Z+J/RmJmki0l8psmNc28RN?=
 =?us-ascii?Q?S6ss/K+QBmF+yOCZeNdCoAQYEo4UGBEyg3TlzerlZxBXNIr7jWYZpOuPwk0/?=
 =?us-ascii?Q?ASNFhf/Ohyj782Y7axZf11cUllIkjVXvgpPU/04ILD/I4j6Bxt0ieTzHRKNg?=
 =?us-ascii?Q?6/3+/Kjz4P+DqdWxdkFovs4dWtLX8PUEy/iA1UaaETE3sYbCo2F9zXU3luZ8?=
 =?us-ascii?Q?5/n7+Iz0UXLWaA4Ex8bLDOC3F4FCqKgHT27bmhGfeZCFcj9CcHBUcj+0Ae5x?=
 =?us-ascii?Q?eyHZPjgxB43CAx0v4kxZB7iZdF8uK4e9SbMQDL1iwIBeYyFexRRnrqjmAPsS?=
 =?us-ascii?Q?ivAo2mw2yoZPdtFG3FiflcPfDT9vvQCrTLhBdWP8ZuNmd+rEET8ECdsTJi/h?=
 =?us-ascii?Q?clopgDcHoV7QeAz/NQQgPKWh5acO1GEF8/3CoQ13RKdNXrw8snU2ydx9gtwp?=
 =?us-ascii?Q?G3mUtp/CK3afXssfUXvEDUNLxuguDoJYV5XWA66iiiU7ZHIvw2ohg2B2GyfD?=
 =?us-ascii?Q?eZNwBYxF6Rvc8T95wikpFHNGohDuS/rNzEe2SdKPkUTyR6OiNpQcOyViQkBe?=
 =?us-ascii?Q?DZeU26CsqtDCn5U3rwEoToWAubJGPOR56uaITjFzzocr4TvT6eEkBML2OiN2?=
 =?us-ascii?Q?nIyW9xRrYQaiID/0+UjmNgBwZnVnlQXw4/hHHKbKuIUm1/PMtqHjda4B9VS/?=
 =?us-ascii?Q?/rPbMZI1fw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bae90a6-68b5-44df-4b5f-08de804e81b7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:46:20.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+k4G6dnob5rNWKptu1D3KI2LQwPGO+J4r4rX33cnI9FNNPCKqBu/Wr/uuVUawlvOrHyNIDAAMig3zK/aFVPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10382

On Thu, Mar 12, 2026 at 10:30:31PM +0800, Felix Gu wrote:
> The config.regmap is already correctly initialized using dev_get_regmap()
> on the parent device. Remove the redundant second assignment that was
> overwriting it with pf1550->regmap.
>
> Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")

Nit: This is not bug fix and it is code cleanup. Needn't fixes tag here

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/regulator/pf1550-regulator.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
> index 037b8ec94066..1d1726528460 100644
> --- a/drivers/regulator/pf1550-regulator.c
> +++ b/drivers/regulator/pf1550-regulator.c
> @@ -360,7 +360,6 @@ static int pf1550_regulator_probe(struct platform_device *pdev)
>  				     "failed to get parent regmap\n");
>
>  	config.dev = pf1550->dev;
> -	config.regmap = pf1550->regmap;
>  	info->dev = &pdev->dev;
>  	info->pf1550 = pf1550;
>
>
> ---
> base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
> change-id: 20260312-1550-327017c6f56c
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
