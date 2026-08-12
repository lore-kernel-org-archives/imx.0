Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1DE45A2A1
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544271; cv=fail; b=citz+i+wQiAXa8c3j0FsyeTe+EQBst9Wjcxqh/NPra777TCQaXjElOkZkfCmYgoQy3wsO9lqOQWAzpfddBcpWiolDGzNTTEh7QgyBIbAzYbDUbrxJnWmvh82ofaI/lt5cH+99wNScITxMQxXlXFCdLxz4q06XttovWDSsR/niug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544271; c=relaxed/simple;
	bh=QSeAdio0TYOLtVD+H0j7BfJqhM0tVpUIYAB30cu071M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HZstiisdxwHz5/9V45QjpxXo50gZTLUcC/g2UKyKc2DFwzaSXkmMisYzhs9qIdSQ53bKe23aORoO8xBypV46izGUWjwnhulgHWQ9wtGjiMcV1BhxOS2C+42Ya3UnLfjGuyX9r/7YuZEdggBG6yszopY+yHzQGzXJRhQNXJkUkv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S6WRfmuE; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S6WRfmuE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHoHmLt8TCn7P13Z6xdxOx5iRvPG3YK9Ntrs9184sngkj6t2nPJGcvAlnLrIwNwDiLxJXGBlaYw4/2bZI6c8Xde5L3vUaZIBjaABABi7Xd/1XBH8pfvraLjUHTJyS4vYMIypPbNqdNXEnnwAdCH2+0n2RXZ+uh2gpaB3FdqocuP9wNhGMn3tuu3ahsNCt4eLiSGkb1azvqmNSHsmsKNLwWYbp+yKRc5yvbKpvvfVyMJRcBgHdflJ6EJTvrwH6VtGpLIRyRpsoVGSbbuefw1zrXDHtudwJJFvgcAFzpe8GNDX1ephB/+ntxwfEVR86WvPjE42B/bcanwj8kPTJRA+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NCN8/tXa6K/qKOhy53IHufKRtJi4E0jITJHAX7PLFI=;
 b=hvsGuIh7WCt/UXcuFKpgA4lwSw6O+I/uT1VbdpqK92+r3L4QpA9LS9Nys9YmMGBPnPH5t+wGogCp1HLezfOgp1z2VX29Kwy0kHmS704nHLWoXoEB/vETFBlakZgT2AnTpP9/lUwW/qNVijQxXqnp7ZAH0kzL64lkjSgE6VzW+3R9wBvrLtIMTxQmVYLWI19mi5XPSmy9kIyAaSzpbR+whtmupFX3DnSszBv9atNpsYnX4o6pSCeZUVk+JqOvv/xP9gBBzM6oSXK/RMqKp6LXCPyWz1ctH4VJy+0IGAZwW/9X7fc30eqlJYfcsTzdZwo5mAnKvkDpDjMJlIL1aDj6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NCN8/tXa6K/qKOhy53IHufKRtJi4E0jITJHAX7PLFI=;
 b=S6WRfmuE9gOcDcXgxy8wbVCTZZDwT8nwgO+FmTbgpj80BiuPskOChM5U9gW7oB2Gwxrauy0F6BFTv4yv08w7COZQbZF2Q5qyrCK4Ti0LAdAKynNxZGyQh1u/vYg3rxqESpHXjUgyio/BX7ZdyEuVGrdnSKnKY0bejFWiNjP7tAVSF0SbI8UeLfNRvlKXROZQqRF6S/Z0SLPXwTF1PjxVkQhNnc9QlciuFr4jKTY4P6UkWqq2eIDNX7QmzK2xyOTiU1wLal9ooKGggGRf3OoMaF4MybdIZDwvjAQAl4ofh9o7g6a1YfbqjytjX2Qe6dUbwHpEVtAyTHUocFUOaX8mEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6889.eurprd04.prod.outlook.com (2603:10a6:10:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 14:17:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 14:17:42 +0000
Date: Wed, 12 Aug 2026 09:17:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Frank Li <Frank.Li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: mxs-saif: Use dev_err_probe() for error
 handling
Message-ID: <anyAfDrujtFivH5H@SMW015318>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
 <20260812101418.37966-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812101418.37966-2-phucduc.bui@gmail.com>
X-ClientProxiedBy: PH7P220CA0170.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 992e96d5-1c60-40d7-0449-08def87c78f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XixY8ZEto0j7Fn3H2mqq0IA5ABL/507F5Z2jJ95RJRWj3OakVcJX38NFUd6x1e7fdDSbi8dIrqTUfKXJ7wye09RwJZ3Xjvk1OSFF5s0/MNdweNHIkCLfTd+Z0tRTclIDcQc9nmR35CXIuMZIy6EFBp2kxEw/ELSRCK+wspNpskWHJSCigpqRktIwFD9N8SxPjEqQ/AL3kmLoyrijbzHB9VXc4xj5BjcMT+ouVbqAy2qSZB3hPu6O3SeBuPHjuhzy0AaHUAPHWswxvuVKue9bd5N7WcDSLEdn1UDYQ6Nu0I2k3L5LAy1+HFExmyLZu4nrifgO+FT5fuDRJxB8u+OAjIejtzQT7abd/aPGl/PPBYUToFO6kFSEXFdAenl4QqmQsZrz6q0EyMJ4nhWeBtO7YvQxKRdf/apaxL2ld9Ubk/CryxNqnveMx7Y+Hy4YQ/+Rw7IyzrNv18jRSktBwqLPa8d/BqmIPvXmNBAnmWgpBCKVRKP1x3XOQi+kW+1W0cTFgXYD4vhZwqWkBAZ05MqWAxKc8KvWJXyObK8QQ6XWOTtmaqkR29JGS6Fn+WbvFfCo1LBNmGAgrrZiIxhzwJJzdPC9pt5PBqfkRDM8yJacAAznW4vRN/TVlFepdL5KyyM2+mQxLb/Fb1I5ga9zHm7v3Bmcs9iIxCZoOZqzuLpmy9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rJAwCT3/UtZvtUgmxZQj8yG8aC6WgGRY8Ru9IdQonNGeWfYJIjt0X1rgVlkT?=
 =?us-ascii?Q?aC5nRyIjVKsbg+Io37v9vAAJta9SHQvmbqmW2h2vtxyBhtXApO9OZYaZSLJF?=
 =?us-ascii?Q?7LEMfO2ctdQiwvKJ8/iVfzKpGrEJsgZngH+KaqXirChSn2XQCz8n4rUuO+vk?=
 =?us-ascii?Q?JkImn8AKUL0AJyMzWw//8Ho1AbTyvaUuKx5YiJC5KAhWXbT30IA1DqLbPriH?=
 =?us-ascii?Q?zSgb0p2CgkG4c5TDuaBCfYSeoxJZP9SxFhmKkPD/QmmFmvEIDRJm+vlepdUS?=
 =?us-ascii?Q?TUR7vvtjeddc9o0YPnn2xcPyQ64SLRlom2tZKNiH58nDodw2+jxu+G1aRbKP?=
 =?us-ascii?Q?8tGGKLxsIhgN9HJ/M1dEYcI9SfknaXEN7n2i6uaQmTQZuVdMOgxzRw+8+4AS?=
 =?us-ascii?Q?MQgIyvkreDUUEW4R/o6tn8xXY1sfYXIy+o7BV2fnlus2pohs4dm6i9d9zZCn?=
 =?us-ascii?Q?t0hC3A+RD7y5qqwUIaESRPTDBVfSPG4ybsKhD0d8qOWnajrbpziOscipLLdE?=
 =?us-ascii?Q?P+g2uvKUJSAt1ppDimc2QC8GLHyKfogR7ednYg34Le73gzrQafvza/t1hG2Y?=
 =?us-ascii?Q?l2T82YhbNLrfskaFZnfaM/eV578A4CJHbQxcUE24jzQaam+ChPN9OmfBFv2H?=
 =?us-ascii?Q?m+0CJmyaxOSqssse0P529lnMXJKpVo9tFDbyx5IsSmDFxl0yWtm1oyfqJXwc?=
 =?us-ascii?Q?vnjyywOwEzHebag8sREtk71zA9d231BLGaNeAV278FObW32hb8wEHWq8SYor?=
 =?us-ascii?Q?1XsDIIyJx+wHj9z2jJMOY/JYNpODRCSgjYD4X0qLSfBiOScKVh0aps4U4qM0?=
 =?us-ascii?Q?Y9CVmxq8m6liMcoxXcEvcWQibpkuKjvX3J29r09jE43X7YbyvRVIclSC7h0q?=
 =?us-ascii?Q?fHcaVOM0T/vKza5dtpOfALtcmHBbS9UCloCUSpqcuFiy9FVsrN4u9MPc7V0/?=
 =?us-ascii?Q?MXfTfbKf0vGsug4aO5LkSO17SkemxOa+gfZzk+0kYdQXBuz3ByAsslz3KtfL?=
 =?us-ascii?Q?f2N6RsuFLjFvEH5qEM9JmRIUaGxPktIDRz6B6RUZo4aWd0YxCsEyQG/d/HxB?=
 =?us-ascii?Q?DQCaYLHpPmQhYG8mCAaWsvS7XwwpgNznUGZqHnj5SrbjHYPmi0CmSv4Zh0Sa?=
 =?us-ascii?Q?9KUF2S5OQfT5ZsotEDZR5i7hP8j4ksxB0QwWRH+So+BleKS2BPbO+QLxgVYf?=
 =?us-ascii?Q?lREetQbV3f9RJdo22ZBgebKXusw+3cttSqkoeOuHOzPPe2FfzP87xq39CGKq?=
 =?us-ascii?Q?mP7SpvR5xHeMH3GdO/8So/iO3d5PLDL8HE9TFeqep8ZFBiUqcNawY1aHzQ7M?=
 =?us-ascii?Q?z0zyQZZ7JmauX1Nqzth6/6ymP1+kfu0HMDHFYbJj9Gtq/KMpGS0Au/81YQMx?=
 =?us-ascii?Q?uGikAdJQYNoI6N6RUd8XpmkTugJpmeXRLQ7OcD8P83Ps5HldroH+8hm6jbk3?=
 =?us-ascii?Q?19w74jyRPwRZtFs6bNbjHftPh2/+0gO3vZMyZACfe2HymQFOHLwQWdy1/IOi?=
 =?us-ascii?Q?yD3MTOKS5bkHnDeBUt4C3SGh3gGhU7+GsUmxP/kzI+Jz7TITe2GPlt6dwZOV?=
 =?us-ascii?Q?QqJ/xbGZzUs5NcV0qjeIHlioT3JcZx6QyI8ynfYGbRmbNEnp5lIbUGVqDL98?=
 =?us-ascii?Q?wawttuwW6jAKpxWiAALeO1Mwc8rksUwHHgc0uibFQY1ZoG9CRPCDot7oq2Rg?=
 =?us-ascii?Q?iXBl15bl5woDSpFW3FR9vc3Y0ubweNF7AFk+Ny4igc4bCA5B2X5gd/nlDEXG?=
 =?us-ascii?Q?Kg3tWbqiaeMbBZc3E8fBLGR547aQJYRuN2oGfZKX+ei3CYELQPeS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992e96d5-1c60-40d7-0449-08def87c78f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 14:17:42.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K3080AHbRsvFQRhmpg43vSE3FsKgfvSQ4udGHkUT3rnrcNvVRgGoKeoEk46seNwb4D2vDo7H5nSSZuvhQBsFodTvRLuCb4fuWBv5AL5SKRJg5TGJ64tVFhPRba0XbS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6889

On Wed, Aug 12, 2026 at 05:14:16PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Replace dev_err() with dev_err_probe() to prevent log spam when probe
> returns -EPROBE_DEFER.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/mxs/mxs-saif.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
> index a01a680ad4d7..b877c978a04c 100644
> --- a/sound/soc/mxs/mxs-saif.c
> +++ b/sound/soc/mxs/mxs-saif.c
> @@ -826,12 +826,9 @@ static int mxs_saif_probe(struct platform_device *pdev)
>  	mxs_saif[saif->id] = saif;
>
>  	saif->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(saif->clk)) {
> -		ret = PTR_ERR(saif->clk);
> -		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(saif->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(saif->clk),
> +				     "Cannot get the clock\n");
>
>  	saif->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(saif->base))
> --
> 2.43.0
>
>
