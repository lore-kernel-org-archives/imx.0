Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE46633F375
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771969460; cv=fail; b=dSKTZY93SNnQfwAVxA6o/lfT0VunjZBRKUbVn7uYLBDrMBhUddGcYTEeIXx3QhQcKvxCt6nUbVYylPKRxsMQjfL91cw6oaWCvfpGlmkX8RqlvmsH7KVu40vQtozqxMBXynpmheugFrxc443/qHdkugMubT+PV95LARRcHKMjf0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771969460; c=relaxed/simple;
	bh=BeypzAlOnPOrsOZOGfo6WWpf0Fmc4wxsxzX08X9ON/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BoxRKAx9qNH4OJZWZ3B4apJnv3Ln1/ggpvyUwztQmcp+segYnfSQ1VkEUYI+Xgf1zWDTXuoIqP6Ap1KzFx6eZyWszM0/cVJwkdDflJtnJn2Vy0diCE0lzPN2cUQvf1HRM8KIfmGUlcRD+xlA2MjVltQxkA6gjnbisje7hkSSP30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aeN0eSwj; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aeN0eSwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENqvwq8oCIBaA+UK6PrNknu6TluSKws3EOV3w59rhfm4R1mu/dAO16v2ML3rrI6c+jX3qc2BZytKF3HihN+XKcT1AEuDYgXbOK6HSojwA9If+Og1NOSLr6eNhwwqoe+o7/EF5076qgKaOfj69l7GBYx9S/R9sPGaGpTGqugPNYVGy0ZecbU2fAjGSvI7sprP8BHIvJtKU4WzyZ+jaz1Gtu3FLd93oU8sOVn92A8xaquKpJK1OL98Psow+t/3LgCOYp3HXvzL9GjTkArj63o1DSs5zatkCP7v0rTfBydR0t3+fCVSjD/epA5iDyGWBGvMBUUnN8TIeBwRfBVPXN3Jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Cvo15V8HMwlfta1TYeTZawxL3SLT7Ja48t4Yj72SGg=;
 b=YqyKGJfzcuPjXci+OjeaN0afRWR/plYpUhVtd8xpuOYPlBIx5PZpKP0p3VrBlUSsxDUmxawevfQLrGsHgSuUN/2MQg6hFWFVAzD7jn55wX375BYf7ZBqGK+GZI5aJIwkMFnbWrLSb0Unq+0BfHVgvBLiMcPzx8NK4JbhU2CS83cp5hR0aqad+zD1ewB8aCNYBBcBM1PY/hbZ7P1qTXvYgK7LL/WU04fOqn8oBjO0qjKSo9ZxECEWydSMitZgGg/Gfy7ZIRfHhGMgL50wONziSo14qatB/arWwoRWyL1um0gUnzcNiTeuPJnkjbrcNm7gJrj4s3avoJGpac73w3tNgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Cvo15V8HMwlfta1TYeTZawxL3SLT7Ja48t4Yj72SGg=;
 b=aeN0eSwjM1Xbx6xr2T5lB84sjz84F8QydMKEQ/KzqzsZKkdPbmFZ/2rWsIR5KJqK4OO3U9GZCGpFuvcETrWvKH8svr9ZJkMlZsDo+knmnglpQM7Y8Di8XSkQ+XJVta0MFFVCbqnOvzlWH540u+o5CjTNeJcP8QxH0YIeCHoS9Knk5/zjkSssxCS4YZ17QeJab2Nuc8TjbiuZfjRfIWqXtAq2IxjSqz+SGOtlbweDmG3W8PPsZ3cacrmxG/jT053mR7KQTEakfg3doY+6UVVxMJWFrM6XRens6Zynr4COITHSejV3AB4FPw580QcVYl7jJxj7oYtNMb016kWUSnb0cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 21:44:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:44:14 +0000
Date: Tue, 24 Feb 2026 16:44:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: add more features
Message-ID: <aZ4bpkUn-oMEFbqg@lizhi-Precision-Tower-5810>
References: <20260224-fpf-imx8mp-frdm-v1-1-d7f3b57c18e0@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-fpf-imx8mp-frdm-v1-1-d7f3b57c18e0@pengutronix.de>
X-ClientProxiedBy: PH7PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:510:325::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2ccf6b-9551-4893-f977-08de73edda1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FoAhsf2a1uinCNTVwevaVvRNuLEdhCY3VVID7+qM4ZnBlMDav6boXJmvSzco?=
 =?us-ascii?Q?bEOvy8ztLrM/pLGbCgF59rLi+3epMYGPu3wJlTuHdKA2ysfEJzDexJbvGHy1?=
 =?us-ascii?Q?LcnW/fyb/wAWOuWneJAHh6n1oFsYKt+Cqz2XslfJrSfSjQB8AQlW+gxeIGqK?=
 =?us-ascii?Q?Cw0YeYg9WBCii0lr7w+tsViKpI/75RWiBADKHnBQ7ZtRfZWL7QjkOpQAy0c+?=
 =?us-ascii?Q?wHa5mLLgmm+EZpu9Z3TS7pliVkMekrmPXIWXsK3Uo+W9C1hNACsTjbw2+arr?=
 =?us-ascii?Q?R7mx/RHM0HTB1YTfkVtDCQnYW8w+yx1rFaPi1yGMEFDcA3OnuKhFZ3keAYRD?=
 =?us-ascii?Q?jPNMmZu5lz5ee4B0tSM0wcWqFSwFAcb6+qCl9iKnG45ucu9SqvBFe7um8MRE?=
 =?us-ascii?Q?7S7AUnA1MxqLBl9ylRIDV5K1Oo7E0obnL7coh/bkqxr9lKc9a1AVxZ8GO1Za?=
 =?us-ascii?Q?MIsqbYKOZEye8klSrH+LK6BV6gUeYew8K5lOzjFKO/OziXGh5Bu4fBRfMPCt?=
 =?us-ascii?Q?quZtWmIiqS6EA1nw4NZquxJmSv+u2Q08vmvEPEDkEDIr3G3digShgaYXahdn?=
 =?us-ascii?Q?jcVcDIulYEP3SBSii72Sbw0Iu75x9YR297tBWzsfAsl3JX1bgVwKAr0ogRKi?=
 =?us-ascii?Q?QPElpvNw2ggnqquoNMK7zIM+DZoUU/t7csP0MeeCAmmeao1Qf32Q2VBNi+Fk?=
 =?us-ascii?Q?jnkC+WBIjL7tdQdNLPlm8BGfze6KM3W9heSUFUv6KtU9idYpGtHWwsK3lr+p?=
 =?us-ascii?Q?4/2N9FXxbn2bOnRvMEWvEyYcG9GAQkU8HdCwAPyCTHNC8WxQ5kXAsLxtBRcw?=
 =?us-ascii?Q?xsQD5P/CWuV3J6hMEjSCpaDOwsPg6KyKC7Qte3GHY8hg5/TRw3m3GrqjdIBh?=
 =?us-ascii?Q?YXyWglipzuuON24Psg9Y4gnoCt5nYBS2vqMdjGZDe2JVz74wnDtjR/+VAbGn?=
 =?us-ascii?Q?AMsiBGx2TTrlI9qEaG0o/+SJiALnjAagFfF/Ur1eyEkPpsS0S1eDp03ig33G?=
 =?us-ascii?Q?kAnHWIVrqtpLQnAWggzHb6e//I+wxXMJ9TQt1ozeNHZT6CxZtp3QBnzpo0nJ?=
 =?us-ascii?Q?AnbUbXv4HduItb/F2uKC/kEt8f4B/hnHjLE0aFHivPkkRG7O5ZpoePb98Qn9?=
 =?us-ascii?Q?2smJ/XE4CbASUZg/l8B+gWJfB9RqTyL7Qwu2yzHev6/yYXsS8pQMK6OKlDoc?=
 =?us-ascii?Q?uZ2z0v1D4CoDMluBzEPTSe+K4oCDG6Jn5dJ+gVZ6pYOeDrqhA2QD5MBMUP4o?=
 =?us-ascii?Q?xGEeRhb5tRZ16HwqZntwNW9wbAKhfOxuaptYumQ26TGX5b3Vgv4v4LIDEbsS?=
 =?us-ascii?Q?APHynux7vDaFoBlUPW3NhKznOZaGN5h6rCztntV3fsQTSIsSkgNlnjErMjFK?=
 =?us-ascii?Q?RDcVAL/wrBL3NhCrStDWYt+Vabz+WPaPVUoL0X+gCudfVzDOXUfsWqUr6g4S?=
 =?us-ascii?Q?pknvLc6CJF5PcuHuey/3h+Q3e93f89n66SahzOqteytaKrrd9rGk/6xbfhds?=
 =?us-ascii?Q?HUcw2lx67hqZlE7TB+yoiCHv1eCtcNOiwskR5yYk1VEKE800XBK7rFY+5bme?=
 =?us-ascii?Q?4kNyoMrsroFD7M0wbj5kGNMx7AYyC2bnE4+N/x6A7yyIkXoIiqOT3o6DLhGu?=
 =?us-ascii?Q?PAVQMU0TrO0xrfvLSgdmFvw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Q3UmaLw6NVNnea1zXp80GJnyOV4Z696EGK9QSF6pi1XmoyLiwVZUjszqNBq?=
 =?us-ascii?Q?1g0CAmuHNpEgAEpBbdtT6gOtdlG8UC1BLiYDVmPvRRRpEQyxqHVMUPUbtw3n?=
 =?us-ascii?Q?XbnHWGEhKaWhK5j2dM7TcYfutjD10G6N03e3bpEemjVj+HZ7PicSfBSxLXsy?=
 =?us-ascii?Q?4A06TqU9qCy32uAfJ+m7MB9f1g10+5raGsgZBBQ5UseqIDPE3jbOYODpTYRQ?=
 =?us-ascii?Q?ailUwEcYlqgqA+XZvuy+SSkqanVGNtsuvsGPiI4mNts8Opq14kyRh9nh0dGQ?=
 =?us-ascii?Q?xL/Ra4scxjBKULt8rYjB3t5PGKMVvX2yFFLiKf7aq+VJgzF6rLZkLCy9MfO2?=
 =?us-ascii?Q?lgUbaEmJoEb62H1StIh9fICB3quu+XG9SUoZISq7wL26g1bzAP3Habrr+l9t?=
 =?us-ascii?Q?KVj66psI+rj3zNJ+rxNX3AOldOvqTLUml7FSL5i0YVmB2ebXBE01NapS/69R?=
 =?us-ascii?Q?UzHU0Eeh0wZD+Hrz8Qhw281JPvkrPFti05M+KU0yEbeKN94YCD84puhCoDl9?=
 =?us-ascii?Q?vWVccLsc67M67kTkm7Duq7JZtbzh+cMGaQ0X0x0UJECcj95PzqhN+jjHGCCe?=
 =?us-ascii?Q?/t8ilhNHL5sTnBzQ4PwbiPUKMfgre6e5UaV23EseuJEnDIRmcRMgqHSTB6xk?=
 =?us-ascii?Q?o3a3AtMRF4bEwNnXCqmBftZcff2WkxPHKGGYl02C1IOunE6MyCHSIqyBw91t?=
 =?us-ascii?Q?K8rpNCueDjG2GZxJlIJecR5GC9G+P1Z2cPclVbnbK0Fr+2JxpeJrbVBd5Rx9?=
 =?us-ascii?Q?r4SCtcJg8fvE/6rrOtM3joUMM0Er1ORwJMJVtVjsHh3uLh+Pw115smS6fbzl?=
 =?us-ascii?Q?mFemH86vgDUB8SsaHDTS8Nz8DmnY1mSSx+bBLT6xBBgxF3GHJfKxush6glIu?=
 =?us-ascii?Q?4csGy1er9O+I/4wj6KawamDmxxYNWE91P2wQy19qnR3oAxqDkWCELUI6tD/f?=
 =?us-ascii?Q?+LFW6oT7e1y7L94zZGF94vtNfh7ghPmaSLcXOUWiudIW5j/VMRMCl7UXDiQ1?=
 =?us-ascii?Q?4gfVqekZy20xcOApnk22VXNLfxgSnCPoBJfUE8+Om/ju24hODh/jJM+1oRKf?=
 =?us-ascii?Q?xkoCZY16ujM4rXkUz3x1x8gxCJCVi+Rjdqd4j1tnaDCFTzq04uGUMJZURoMO?=
 =?us-ascii?Q?obhf77kZJdMkKDHjjwnN+SS7ok5+xZjAleLZ2xwomUyZ95YORb7XWxVSol/c?=
 =?us-ascii?Q?a/Ao2HhS/zlj3zwkzOwsr6B9plppjFyYQTjzPTl8YsTUwbQ8Gk+vukylzpKx?=
 =?us-ascii?Q?cwaedqhW3w9QmY3zwNm7HO5qqhYxmKVWhWnVBWectNKCMq7n5adVf3pNW4Kn?=
 =?us-ascii?Q?/omCpZSYnP5f4PnWBgUNS6WdoqvOAlExH1bHc2vjKaSiE69xQchLkc/A2bNt?=
 =?us-ascii?Q?lVREVePzOhUiwRJatmX83smOECIj/R1sSGojHYvIkQb48R05vxGIns7WHCP8?=
 =?us-ascii?Q?OPYj9Sir0dH8X3xRfIsH68xZaazuc7b8XWzP7aXZMe0oy2rNJ1ZVAtrB9Bw3?=
 =?us-ascii?Q?euNwjoBHUS1AEOdht0RDYlzQR0CmJwqaNPl1LtkZD0WNwYrRnybgMEe5V3Qd?=
 =?us-ascii?Q?Y/4iX4YEIeOmOAJsNXLYZqoTgOrAwDEbKyAO5CCfX1VAoOVOj7KpGe3PF7ny?=
 =?us-ascii?Q?BZ57fQ3i6ZKWzC+fHwjtVsf8KUTYDlme2q4TeUUlAWSgNLa4x+txv0di2y0w?=
 =?us-ascii?Q?7pKGk3V8SdwIBUF3DjJujB6bYqEWsXqyly8IySn8HSJV6sQGEZ9vGPF84TO6?=
 =?us-ascii?Q?2M831jjJqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2ccf6b-9551-4893-f977-08de73edda1f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:44:13.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kil3F8dzEcLW/6lc+A0/BRogvO475HWRhNxsEy6HPWA4qFmw+1h6OJ/dDl1hKz5MfmN7bcyptqo4He/+6OKfQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062

On Tue, Feb 24, 2026 at 12:46:35PM +0100, Fabian Pfitzner wrote:

Subject need provide detail informaiton

arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support

> Add support for the following new features:
>
> - SD Card
> - Ethernet (FEC + EQOS)
> - Wifi
> - USB
> - HDMI
>
> The imx8mp-evk dt and the NXP downstream imx8mp-frdm dts were
> taken as a reference [1].
>
> [1] https://github.com/nxp-imx/linux-imx

Needn't this at commit message.

>
> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> ---
> Add support for the following new features:
>
> - SD Card
> - Ethernet (FEC + EQOS)
> - Wifi
> - USB
> - HDMI
>
> The imx8mp-evk dt and the NXP downstream imx8mp-frdm dts were
> taken as a reference [1].
>
> [1] https://github.com/nxp-imx/linux-imx
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 409 ++++++++++++++++++++++++++
>  1 file changed, 409 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 55690f5e53d7e1fbf7eae8a1f31eb064465ccb6c..09a44ff8fb6aaf8b083c8af06d9cf1926f5ac197 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -42,6 +42,68 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0 0xc0000000>,
>  		      <0x1 0x00000000 0 0x40000000>;
>  	};
> +
> +	native-hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI OUT";
> +		type = "a";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
> +	sdio_pwrseq: usdhc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_usdhc1_vmmc: regulator-wifi-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_1 10 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		enable-active-high;
> +		startup-delay-us = <20000>;
> +	};
> +
> +	reg_usdhc1_vqmmc: regulator-wifi-vqmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "regulator-wifi-vqmmc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-sd {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb_vbus: regulator-vbus {

order nodes according to node name.

> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pcal6416_1 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  };
>
>  &A53_0 {
> @@ -60,6 +122,148 @@ &A53_3 {
>  	cpu-supply = <&reg_arm>;
>  };
>
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	snps,force_thresh_dma_mode;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@2 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <2>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_eqos_phy>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			realtek,clkout-disable;

I suppose there are CHECK_DTB warning for it.

realtek,clkout-disable, which only for ethernet-phy-id*

> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <5>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <5>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +			snps,map-to-dma-channel = <0>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +			snps,map-to-dma-channel = <1>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +			snps,map-to-dma-channel = <2>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +			snps,map-to-dma-channel = <3>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +			snps,map-to-dma-channel = <4>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_fec_phy>;
> +			eee-broken-1000t;
> +			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			realtek,aldps-enable;
> +			realtek,clkout-disable;
> +		};
> +	};
> +};
> +
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -218,6 +422,32 @@ &i2c3 {
>  	status = "okay";
>  };
>
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usb_vbus>;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};

order by name

Frank
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> @@ -237,6 +467,36 @@ &uart3 {
>  	status = "okay";
>  };
>
> +&usdhc1 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
> +	assigned-clock-rates = <200000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	vmmc-supply = <&reg_usdhc1_vmmc>;
> +	vqmmc-supply = <&reg_usdhc1_vqmmc>;
> +	bus-width = <4>;
> +	non-removable;
> +	no-sd;
> +	no-mmc;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
>  &usdhc3 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
>  	assigned-clock-rates = <400000000>;
> @@ -250,6 +510,74 @@ &usdhc3 {
>  };
>
>  &iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +		>;
> +	};
> +
> +	pinctrl_eqos_phy: eqosphygrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22				0x10
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x16
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x16
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x16
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x16
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x16
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x16
> +		>;
> +	};
> +
> +	pinctrl_fec_phy: fecphygrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmigrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
> +		>;
> +	};
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			/* Pin might be required by multiple drivers
> +			 * (e. g. HDMI Audio and HDMI TX)
> +			 */
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
> @@ -289,6 +617,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
>  		>;
>  	};
>
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
>  	pinctrl_uart2: uart2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
> @@ -305,6 +639,81 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
>  		>;
>  	};
>
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
> +		>;
> +	};
> +
>  	pinctrl_usdhc3: usdhc3grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260224-fpf-imx8mp-frdm-402c4df06302
>
> Best regards,
> --
> Fabian Pfitzner <f.pfitzner@pengutronix.de>
>
