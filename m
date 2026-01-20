Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BA43DA3D
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926195; cv=fail; b=dsp+9F41KiTu+tqyAD51xhZJFa/tp6CkBmRDbV4HsbzUuKP6jnLqFAt7jHAkacE2LUxzPxPT8W3MuPZYv2IqtRjyyDeOLeut3s7j1Nr1ecAvEkwOLW8tvZN8JkdFuY9Sm/MKLu3ZYe/f6e1pMjpfIVsvVIJT2dwIQtePRfEkCp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926195; c=relaxed/simple;
	bh=qxyFhwauaCvreCuXrj96BN3Qrem+SghE1DZ9tgea8xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=id2VCVkB4NRZkR8xdAciW5/bub3ItwxZcGSTeIuT59Z9Ugaaf7W4P5yWk78f+p8kuf+VSEmARzPSCNWnJ2CZjKCcCXeXMk67BFUzghiWF54Ycct9FnI0f849t/CTpd1nXmxB7rnNvqwG7PfhCguPPjyGNWBjnoneKORJppmlD6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gGRAG1k7; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gGRAG1k7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKUThmjy5/ax8lffIiNmeZtoEy8PLto8PzRU73RH2c0PHvGEF9hjFJMTmHmtAvauPgZ31P22c02LsqJqP6A4Fp825MLFi3Q3gMu+zu5qGrgDDIHXqytkcFFusAXX25nImbKpAxpvpUSz59S53zLNVll5LlymrA/SfA5O4lvzE2R0A7/NgdS3hveCfx/ul15tVr+GNl8F4K134u0++nQrpks6NuChqwNVIeG1NL8olYp9pBj5miAiNEYVH6XMcEg1osxoyvSCJWY3Y2yeLPVOKxNlDvonYiGgyoldWeD1BAKuTfKgV5EUMORFPqYVVEOIcxsaYuLoISNiZ7PoueR5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hba4kNZtDtZEgYO+F3uzb/3+EdFtoluWNaS1XYW5Cyk=;
 b=PByzZKrg8oyM6GkOuqOaMMUgNLcew5vIcwNK8uEjjYUtarg72qLd2YaqKqsF2qJBBPu4X6omEX9vI6Z1tk5ACMXU5bzEJ1wuxO8RYctYnCHkjh+6XuJ/wp8uZ5sFW5SkUz9OCEqK1SsiQnqICyk+SuvWWPMfZOei6z/eJyzEfb0LRMXiWutbx1XxEVnD0QJWtgNLW7H8SAPHRx/+EWnZaVQj4e/I6U9V6y6TI3XGcGKukce7Uak0fYOYZ5YRF7ic3OlIEuRgBs+12PNov3s/N4idk32UkuBFA7OhKjP+lpwiBAUZoXEu2tUUqanWdpUrguhbD9rNbxL4Z/CoE3ya7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hba4kNZtDtZEgYO+F3uzb/3+EdFtoluWNaS1XYW5Cyk=;
 b=gGRAG1k7qDSq5eciq8I0pCLUOLEfgALJePoWCdUJK/ISRq13jrEqC9iI1tp1W7vr3KK7CoVfVVYy+rGPRYh/c94HJzcG/xlPwmulG0dY4XXsYh2EWQ7Zk2IAzjLXhSOu6sGvSnMQX1VJU8pTA3xWA6PYYo+SZhNlibzpgwwSOBqxhtfiLkhBEZ8vp076EWvvccJp7z5ClIkCe4nK2oLPUEeLWv7IblIpV7WC0mt/EkZiUdGkwa8sP0GWpsH/7bvw8J4XzMJsM3Wovi3YSwn8pwTfI3X6Zr1oJGcumJA5eQcW5MM9ctGrx8nWa6cZIPJTNHRotItG+cCsUkbuZhJQGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:23:08 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:23:08 +0000
Date: Tue, 20 Jan 2026 11:22:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Message-ID: <aW+r4m0Nsah4UCA7@lizhi-Precision-Tower-5810>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120150329.1486-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR01CA0072.prod.exchangelabs.com (2603:10b6:a03:94::49)
 To DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6ae3a8-81fc-455a-8d19-08de5840327c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eA+BnizLKGFXwZvm37jo56fjBN/OaoLQfwpz5UNWUr6E3otRttatTo73P5uU?=
 =?us-ascii?Q?mev99DZq9c2C/wfePoUWydlf0SSdSfeS7B+wm2SsZgm4UoNMi3YwpDAQbI5k?=
 =?us-ascii?Q?kvzGxch3O697L98UUHs3oma+MhkrmLxYwUNK6zjLdkz1LSbjs+HuWgsQ8EV7?=
 =?us-ascii?Q?vH11Iw031mZaxL5l9WB5Uh+jCGJYhRBQZuabZNqZRCPLQYH255lIu9qSF1+M?=
 =?us-ascii?Q?tgESuYMrePk1BHuzbWtHIFIGzLBj91YUtZNgokAo9ceV11C9pa87FcN3tpMi?=
 =?us-ascii?Q?mJqaL5h2GzwoYi3XjxjdeWWrkJFiWnFxGDkrS3fsPtRCpnNPLqNg8N49DIst?=
 =?us-ascii?Q?gu88ph3q4QgLIOai0EDs+oGyIEC9uEgM4igq1MmeBnqzB/AQX/NH8FAXJZCO?=
 =?us-ascii?Q?GdTyPZC9CqZCGn+2GbLaWXG6se3pLS0XAwwtEcaBiNDVwwJkakGAjezOnpxw?=
 =?us-ascii?Q?QecjWg4qNgmYuXy707M5C03fIjGWj+i/7yoR9d9BU2GisP8TD3FYFszoBypi?=
 =?us-ascii?Q?cSahOkjqqXAvbGhKaMfjoWnq0CHo4MIAYGgmP6fJbuXSD7u+Tt4vV/Qnm65q?=
 =?us-ascii?Q?bR63YaznRkRyyCRzkQjG6IT46gcvh6rxuaopwh50UmDvR5kH8TaVQsxVbrRw?=
 =?us-ascii?Q?S+WJukU01s7UF3XAg0Ceqxf85zOf1vAYXZ8QUyAI2/2Nhu3Pids8JP9C3HhJ?=
 =?us-ascii?Q?Y6iYmu+3whGGvDurjn2Ze3nYXwTUx5Qh20/YZxXVtgU/iJjlJKq8yyjWNTHO?=
 =?us-ascii?Q?BV+WNXObUuIiwgbisDNhWxfH+HTOyycgO69oqi3LnEXAEkkYWXrwb31O33Fv?=
 =?us-ascii?Q?41hs/GGIBcx51M3DLuWBmm8k8zqSk/M3D3JQ9Key5XxX3DfX9Qux7rklMfE0?=
 =?us-ascii?Q?RIo/RMNB5hjqDh6K4DUt7ib5eSb8lMpA1061wdfaMVcP1X6TJhCK7MZnazx8?=
 =?us-ascii?Q?2pFYh41ZJ10EKp7rYlZPbHXjo21jTZ5hHh+Z/ty34/VhrKhQUDwR633/Fvg+?=
 =?us-ascii?Q?vcLBYtDwzAIyau3oocKqHIkfq4Y6do4buVSh+33r+zOc6R2AosToP0u9A0lX?=
 =?us-ascii?Q?JbTWrkAf7ber8x7xMdQokLWXHHsapSLHjWDK56BYRcACMM7CIQ7YLAV+xYT0?=
 =?us-ascii?Q?O593M44SOWQ9eNxtqHmyzi2UM/wW5RQVlgh091EkIOKwvoKpUZUMbqTYXSZS?=
 =?us-ascii?Q?H2A1r2Upcx9W1kpoiQz2y9XdrVEKFdUnYZmc2F2rGvhdJzzS4yhiAC1OdoZg?=
 =?us-ascii?Q?lQQKGB6KzkhBsESCmyHas7gGPT7eSGXAtZ2nwEtfKgzPr5nkbbrBwBJhlYzN?=
 =?us-ascii?Q?arFNwmgTV3QRcXheUeVVfHqgP7S5NDs+JuB9OG207enwbxu4VEH6GaHJchxN?=
 =?us-ascii?Q?3B1tomILivGaqkYSpvkNtDJ6UXMphV7yZX+AAxBVLjooSmYc73BTcs4dqHjE?=
 =?us-ascii?Q?SFoLx64AeYfN4gEGAsctnocCqe6GQscX4cKDtOyuC4GxIbZS0UcIQM7+vZvb?=
 =?us-ascii?Q?FQWgW2wZlc3U8QWIpKMGpMl1V84jvcTbrKCdudfLUtza9t4OrQboTdhvZJ0q?=
 =?us-ascii?Q?gHnAmZ8QhU+p/K/iXYtuYyF/JxyDlr6DziC9gOOjy4YzjwCzIPpJkinRHW+d?=
 =?us-ascii?Q?wRF9NDmBf03eXKS94FrmYFk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VmesxnwV5qMut8BbM+OjJyDzK66Ast5INsT8dL+3WRBigQx0KVr6Dg/Xt5hJ?=
 =?us-ascii?Q?jKg+ckkBUnpU2LrEUj0pQ/uqlw3y9Y2GoPcyK3cES5fIAbIimdG9i9+phP5B?=
 =?us-ascii?Q?ghuqUR6QhMsdh3CSvXzTDNTP5mxJLpTvmPLZtH1FscK8bcI4J3HGOKP3DQzi?=
 =?us-ascii?Q?FfII3/GduNoyctl/0cZnmzZ7r3c1xI0d9xsAlZRhp2C2mXw8m1XjpziDdo+X?=
 =?us-ascii?Q?NnJyN1btsSeOIK++8oXfJZw/G+0czGRvjyNfMUWWCqfv9m2JMlINhu5t7ebC?=
 =?us-ascii?Q?EVmHLYcDgnLL62di1scfulahZ4fNPvGzPJEeBHhE0jS/9XYTLLgRrRqZpLUl?=
 =?us-ascii?Q?CGjhnlPJTfRF9HL4tYjMuJ1OG6eAjA3Y+PASf8ErkIIGUJJy9bo/rUWEnsTx?=
 =?us-ascii?Q?g1QrEWvrvp3HqIhb+l3PLk8n+spwZJ43WkDxVFj4rTybIqEAv+VOjeyG4BXt?=
 =?us-ascii?Q?WWSrdAE2id3eMhpK4VwM5j5RmswsBk56A/rZVeoT7JdjXjqeYLNY9Etk5et+?=
 =?us-ascii?Q?TSIQZR+sbecd2guIAmX3PUIaFGBguEv5U/+nK4mZwDjDkQnfnujlRsufjzeP?=
 =?us-ascii?Q?+93cNNypFQxOnc5yJfMBHicb+EiKGls8QAmd9u/Iz8PaLm1aaPvVzbW4fEb8?=
 =?us-ascii?Q?VfmGEuFBa8Os7f/No387bcUS4AKV4HBpfFhdThbVDkklouQ20rTySE+BQp8G?=
 =?us-ascii?Q?KYatiAbYFsRuKcocLaCwlZ4Uk9l0AMZhxeiJ/fD+RVv3Wt/iO105/0I+cY6r?=
 =?us-ascii?Q?7P707xk/Bnmuc9w+jrdmIec5R0xZzm08dARpYoXWB8cIRS+T81i9sdlob2QM?=
 =?us-ascii?Q?Rr0I2pQJq1mEGeu/iskNsies+aBo9lrD43mFvcHuSh2fr/VDeGqlgPSw1Kp/?=
 =?us-ascii?Q?YzZhch5an3z90njKmvEYAJzAXFJv+YMXPqApDDzWp9Zp7Vcj5dtNYjMdjm8v?=
 =?us-ascii?Q?Kqdsmsd8mZyPl8ZLfn5AKSMhpFg/RWTEnbQ9aAlUTE6QbCcVQcCLj38Jzl4p?=
 =?us-ascii?Q?W7tAKPc1s9SMHqRXy24PqYWiYXrKYIqj2pNq6Zd9dCqT6eMoQ9y5O7Iwjz55?=
 =?us-ascii?Q?yXpm4GkcOSpU6y/chZ9riByVEHvnDYzuTASa0rP/hyjMjJXAilj0v2C5Zsp5?=
 =?us-ascii?Q?MpZ3fjrQZcGuZXtY2fdeAiGk49mJChqEID7Qo/FvmMKOcUpZv3UNz4rw2UoE?=
 =?us-ascii?Q?ZxMUJAqIMte2gCvmbcnzUhP+gW5u2UlvaejEwIVzsd+/Xa3gDfAQ+fPDPO6r?=
 =?us-ascii?Q?KSy63omzoDaa3AjeV3fTO0DQGELSyelLyUy7eYAMDUEsJWvo2fbxdFYYC7hE?=
 =?us-ascii?Q?cnX00fwZO5JVioGlRGPPW84rExkTuu4k9md9vcSS8yo/7XWkZxmI5K16w53q?=
 =?us-ascii?Q?KAqF+4zOYcoq1I1e4+dkUoqNaRD1j2OOAT9e1+ud83tSwPnmeqa18xwQOiDu?=
 =?us-ascii?Q?aGLZMBUAqCbdOd8RKHUxBJL3TWZrOzVDEgPs52B/ohpZdWIEbvogJIX6+Py7?=
 =?us-ascii?Q?skAIpw0rql7Q7bz22xE3xsmexRsKL3XzgfoIZ65/1bs9/xva9X8DBUpuaoyv?=
 =?us-ascii?Q?CguVxnOst7GVCa/hZ5CYZZFrlUQHXU0tFAIyGHoGaLNsll/1ZL6WL33+wGDw?=
 =?us-ascii?Q?LNZnvqdRy/A5194FG0zH0uDpuOUCSYRKzM4qDz+GjoAQSX8i2hUuv43i/6mc?=
 =?us-ascii?Q?1hpyFE0HBl5SwBQOWuOu0jU7DVK+D4HNuJ0APQ+H1eMKN5ce?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6ae3a8-81fc-455a-8d19-08de5840327c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:23:08.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLSq6Dbqaf8Ztu/S5lIKz5OV/idu37QRVL7FnIAtn/zQIdbX2rtEbu3xxfvqDsr3MWeM5yYf+IqazJPCbdRNAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On Tue, Jan 20, 2026 at 07:03:29AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
>  2 files changed, 78 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index ca1c4966c867..53aae25db7e4 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -243,6 +243,12 @@ codec {
>  		};
>  	};
>
...
> +
>  &scmi_iomuxc {
>  	pinctrl_emdio: emdiogrp {
>  		fsl,pins = <
> @@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT               0x31e
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT              0x31e

Can you use tab instead of space for 0x31e

Frank
> +		>;
> +	};
> +
>  	pinctrl_pcal6524: pcal6524grp {
>  		fsl,pins = <
>  			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c88..0c55861d673c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
>  		};
>  	};
>
> +	mqs1: mqs-1 {
> +		compatible = "fsl,imx95-aonmix-mqs";
> +		status = "disabled";
> +	};
> +
>  	pmu {
>  		compatible = "arm,cortex-a55-pmu";
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> --
> 2.43.0
>
