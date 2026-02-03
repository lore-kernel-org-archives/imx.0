Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCB531B82A
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140763; cv=fail; b=tVIVx4ps4MXxytCOfsKzkd0XASgweyNXj7ncrromaIW0X+TL7r1bxNeFqdfavbV7Hjeryq27O1pNX2OFfdmAdAvC2+zAZs7PvaFdznP2pkh10a745VvHZ+fN3DbQ5Lqk07P/j2zSMm5rve5A0dj8J5eCSBrvNQ+e3Zmcf5SPvwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140763; c=relaxed/simple;
	bh=beDji9UsjmK7grFLNLsY1ipu/6rpMRS2fze4q6h5Z50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TN0GXE5ufw6cJMkVaHPzTGDl4Qt8wMwYmgYfcVkG8ydsHgfcqt//MyrnEw1oXQ5tuVvGQvgzfJmRk/CDUxRb7gpdRBPR4yiq0zOvBM0opoDN/oP3CIitl4Fn1QAGGtFmgJfkd1/Sjw95G0UvWeitkTmnw2N9knJN9JRwobs1QLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h9xhib6Q; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h9xhib6Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKbK1uA5vVJVNyAAVptUBrAQyG1R2lWaa6DxqxSzZgqlniLs1l3Fn2I+r/W2tv1yamRLjmlX79z1QdpgVPDJL0Em+Ikr4KatNlC6FQzSa9aREpBQ/B+kC4hqXv/egXjEHJKswZDU2aehtx7l0P7O3F6uE0LqaHRqnv+pGQdZfEPdBNlIQY5p9/2+nL1yHix+oDPTfCTju4Y/BCz5RtAqNaNktqeGwTAu8ryM46PLyWh0mhmQKtOIJjUnAbf126K8pDk8fxUN/pVH8Y7NECVO4iTpZ1fkqYA2NxoJHo42BEk008TZXZ2Dl1RxoXhysrJk5hyt+P9nNmW1NMzc0WUdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0VFRM23vMrlGr4u1tZMSkBIvAv1MU4n8swFVkzEqYA=;
 b=U2XkiagnDjsloVBS71F6N+H0n7mER4L95+2GuFrvWGG64f35SjgUqt1fMHiAXN/zc5/NPsAff7nmopjNsi/1JnkUCmlrrsLTouHsg1MghmdBQUM2dY4XYhKsyI9xsPeAj8Ut/QMKIbMgIV4ccSHMaP9Nn2of6T/NnLtP1xqaK9gxdYrzEVuR5+Tg4iJUjltiHUOoJbLrowzMPIhjP2lq6Qd45zB19uw9s/UEN+qggkMZHYEEWIuG7Ti1lqvOIwLs1MXjTKdYjiMvIbllrcXqDTpaOMwrQKbivb8Ozl9RMppv7Y+NC0yY8ivYqeUAVJ7o62NEZJO+f11ayBloL4bfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0VFRM23vMrlGr4u1tZMSkBIvAv1MU4n8swFVkzEqYA=;
 b=h9xhib6QYVAv4wttifwSOb5R7k4gv89Gxpeg3o5qvsLYJ5wVU/IqasN6iXeutDqwqu7YFukp6NYayCxCAMWvZSRo1J9KRPb5dG+O+Gbc296NPEBfTl0eHTD4qPQ51s+rutQAiOZ1oMcfF9rXjG7fDrMjxF0zS34wJQ/xmF9yPdfreXvBWVJVXKbpPhKQciU6tkMpfJkHrG9S5pjMVN7r9Io6ZtztULiQ77jkJO8IBY1juVCYoQPAupPttlUWyuaSq1wihXviyoFUOEPMQ6xEOrpEzYRMYofT+arV2oovQEa14r0mr0rjS5i60wCRH0fdlnOgEDXhjKcy+ksgmsaFQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:45:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:45:58 +0000
Date: Tue, 3 Feb 2026 12:45:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: add AONMIX MQS node
Message-ID: <aYI0T/xIQoavzICY@lizhi-Precision-Tower-5810>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
 <20260203100332.915-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203100332.915-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH0PR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:510:4::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af35cfd-5d37-4c10-5666-08de634c16d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OuUgYJnBg9vHzwyT+ymIrE1kdokk/Zw2sZJEVhQ4scEjfL4H9WuQ7Rfh5Ops?=
 =?us-ascii?Q?jJA+HHC9vlHELJye4iIjQT7pMp+XLi0/FzJ75fD+x2XDm/7uouUcI7gOBi4r?=
 =?us-ascii?Q?B+mjBcU2M2BqZn/GiwMZvrL+4ZR19423bCpXOE8OKUh/DtoOtc16/ppLIW/c?=
 =?us-ascii?Q?iU426o2qmcFYcMFxDbALbTmIBLErfNgoSNWoJ+bAT/kHFQw5vbnN1yuwwmoG?=
 =?us-ascii?Q?3wJO5tqTmB9V5gSODI7stSmipJOkzZR7sn4AM+d8F/l9y14ZizZenT+OSzEm?=
 =?us-ascii?Q?odIjTElQgRyisMsVs4v0ykPfg3wOKznCRiHqHcbUiEWLq9Z5u52vNzaRpNlO?=
 =?us-ascii?Q?DLa7jsuDF7DUKoj4tEp4l+N8jtVpTfbL3/3kBCRXCxHNV/yt0vIKFE2H12WH?=
 =?us-ascii?Q?FZuZRnlfwgx2xGUqzteCm0asOSqxYdIVqPecxkzQUzYyG/h1AEMpXUg24LQG?=
 =?us-ascii?Q?uKxRLbiPQ9+bkHWq/ABZQX6bPXmeJN1JdC5nUv/xNvYxPMVMal3+g/KXxyCe?=
 =?us-ascii?Q?VWtUNUf+gp7RRrONvu7LCMIu4VFTVaFvfxer5bT5azMNhkItEaO6C6k5KKbf?=
 =?us-ascii?Q?5NlgEfFG7BBxiacjDYptBQsLkRK2yumz7qymSWGNkr8V1TkOusc2jCjtV5ok?=
 =?us-ascii?Q?uCfwQGSUIm5H/58IX1Vd49YTOol8JNMIlPoE7cNo9cOY7l+fIGLUhoXTmp8E?=
 =?us-ascii?Q?L+ioLYR1dKz9YKuxDTHuyTbnSL35bzNbQqbVIl0zxRs1HLQEnfrjgWFYpcap?=
 =?us-ascii?Q?ZTypD2zWJUEnbelIMOC6ZsxFRr6CZfmv4IB9Y2j9va26YwOIlO00OSRWm/yx?=
 =?us-ascii?Q?wDsinOqyHox2MqEzRmZBikXs6/iRqqnNXk9ahHX/t633CYhdE5erYwskUzCX?=
 =?us-ascii?Q?3vJiozYCSGZkhwcg25D2ZaIqDyeBhTQ6wS14J9TRICVu14jdPpSp8kFoEOzS?=
 =?us-ascii?Q?8g+vuWfNpc8HUrkxMiKCjfrghFs7An1/PG34CU62yA3gpGrV5eDHtKsfv/uV?=
 =?us-ascii?Q?u7o3j73OG4KHW0jIQMeNiGnB1M6V8a3x4TXHp0PaqB56AFW7yjpMy6tye7XH?=
 =?us-ascii?Q?Hrg/tmKPcl3Ie0tbcblCTcX8x6Z/s84uGamH4UcAn/mX+jad5pcOjWYx4+kP?=
 =?us-ascii?Q?AEyyLY3tgHzzg30vFPJsmErritJNbPtJxnVttPXJgP+BS1JB/q4xWoj9fpT+?=
 =?us-ascii?Q?/RSAH74wf0Z7rQ8nEPn6751bblwRLA65B2iqEQprMeuY16/XakPoiXBP9yXS?=
 =?us-ascii?Q?UXxBKD6/OnetCBBenvtktbp8mELU+zP+e/2cWCFgI8917thhfa6dQKfICFHH?=
 =?us-ascii?Q?xQp6D5tsiW1etTLcnQzvayM6Giy2rj2sde9nykeAc60JbrvZbpLt8da6R+/+?=
 =?us-ascii?Q?Hv0H5ZF5OlqdRdU/a1oNhnjtYvpvI+bBsXexC9cEC7JlN5OE4ZZUFItJ+k22?=
 =?us-ascii?Q?HXeCMwYiTKM69C3tbDdhUk2xIc8PwwD/R5X54tMp64edK0AJ65wDEOPRYOPO?=
 =?us-ascii?Q?rSeF9yXijrIrKWjVusoPzi2Q3eyS1J+2T3otMPxD7a7IAODUFzI9QafZ5jhf?=
 =?us-ascii?Q?XDSHtUzjzR/mvMfbx2f6b4soS1YFp86QPYpxnUx8n38yaARW8KsKsDTt9+mA?=
 =?us-ascii?Q?Fo7KIUoMM8TvM0h1w0gNyVE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?05vSstSEuallTjM9P/G9TWgHGzZpW/dF8X7P8RMuQ7K4rKgdk5CDEIoZQ4qZ?=
 =?us-ascii?Q?pDhr1ziHdJ3tBfLe8k2kLwX235+9zy/hagEiATqGZAssXhQ6Lx2yllUCZ2Oz?=
 =?us-ascii?Q?vPBAV9DDhcPAqVquSrBhXitGz/a0rGs6uIJw526G+9Gwzs9xwC5m52lB3kbd?=
 =?us-ascii?Q?3zu5ju61qWvV6YPIQyAHetcHw9dwkgKIF+ups5TcuE+YhPZnOTunhFCXihfL?=
 =?us-ascii?Q?b6TgY8RTaEkAcmaa51YB9seSHbg/lyV0ZZslORlGg43wXsbOta7OUm/rZmKR?=
 =?us-ascii?Q?jbpJs0DZFECg7KGQ0jn3BOc0cKI2WjetQRu/Y9AHG2Ee4OZqRTUf7OAR6Oyo?=
 =?us-ascii?Q?Ny12PMtncZILflsM4h2/pT7in0U+rBsYIO1rsLrMdnvx3jvn047vZY7UHwhr?=
 =?us-ascii?Q?BTNuuojEsS5b2IsOGPXpqgN3kf0jKl2iD3NvhIsvZ0pyUfVDHP6ZJXLM6Y2b?=
 =?us-ascii?Q?BCu5LNcgzCadjBgU8pdKVyRtSLY5fVMg8TOnbJQdGdrdZbpii05Jtownkjru?=
 =?us-ascii?Q?XzckdQVQ+1LoZrZl5qTyYA1z0OZYXe6MmTXqXTMns+fgnH7UUYGrG45eyzop?=
 =?us-ascii?Q?PkZ8F9AO0Z5vCUk6JXJJWSQ0IBO4pA9KzwEdf5CHIyLMFcDo3b7UWpwHnfym?=
 =?us-ascii?Q?NWYzv+NbLmleJxov53j5NtsKgcg9PUL1t7UhBdEweP6uBeuOxjdBltu70R4p?=
 =?us-ascii?Q?Brqqx1SZ+V9fv4yU5sQhWzf4eufgZhN8+k5ypDJC4I0DSzxcF/cxnsbt2i5X?=
 =?us-ascii?Q?Zx5GEg2bCQOjP0+crXa8epURxFWHWgbmNXP2a4nTsEzP1OPgVt2zVNHGvJYG?=
 =?us-ascii?Q?WJUwUlZNdQwVVKti1vNRXeLeJDcMskTABA2lb5j1daUcSHENzcY5Qo4Ip5Li?=
 =?us-ascii?Q?rKt0hWkqcDDbSvIkQHdtkPdgjoxxjNobjzc5kObB0nwunTl6yTYqncaFX96z?=
 =?us-ascii?Q?Fyg35QrJzr4qZI63ikH+EInahhQ0n6hnb+AoxSgFExZbe4SODyZ4T+3lgYI/?=
 =?us-ascii?Q?zaDLgYlgwmoP+LHwnvHcAx+681ch5lCkgveyCNfRyIJryKlE5kdCPlaW8tzP?=
 =?us-ascii?Q?LeBZ53F5atTNFt7F3K1S/itptICe8JRo+LIWSAXQCnSBZtmZZj5xFoA2rsAh?=
 =?us-ascii?Q?t/pQx/Y2erBSE7anVXt/2BkpFuJdgQNlcygomhOmSIlQMvYLBa80HHfPOFUv?=
 =?us-ascii?Q?V3PRjHOWjoxuhP/yr7Y026mclq4weFSAUYwpNUD4sT48e+ke/hqid+6Mhm6A?=
 =?us-ascii?Q?FTq9I0lj45iAp0/igdUF+JNdvCYygPxlvgwXk3MFnfd5dpiQVReumfowxHsW?=
 =?us-ascii?Q?edfKjBUhRHoCTCF9+1ZJam+VcfNn1o1xblPbg5FA7YD03yTxoZbnwzvzmdk7?=
 =?us-ascii?Q?UzgCKhyL4dG7U3vTTAlIB4my4umiCspZxZ5lBZD2vOauYy+jvfaUur2bc0+P?=
 =?us-ascii?Q?kTVMESTFBFlo3fO1wyVIlAmOa4HWch6DmT70HovyU6hQqjNM6etUUiu/OiWm?=
 =?us-ascii?Q?kYgNVsueeOlzUbQjBsk9ay/wVWp5gkuV+EFPP33NiftBSaSorWfNHEa4spdn?=
 =?us-ascii?Q?W8MKuV2tcHe4oGe65+cMHBl1UyxjgCeKHf5YnL1aK1vsc+Pfwgma5NO1iHPM?=
 =?us-ascii?Q?PQz14SBjhemTSOATdaGMNLBUcCmwLXAfi58fhufDaTRqLdBDu+9eLvWi1mzD?=
 =?us-ascii?Q?wyTCsosrECNUAffwGqouRE6UMm2KhsEq8uZuQwVdvQ3geQTX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af35cfd-5d37-4c10-5666-08de634c16d3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:45:58.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7pZ3xOW3jEQIJvEOj3OWzwsUjs9m15/mj/cVD2usHkeW8gfMDl6DGaKHtZxe4Dd7emrbXnEKlpAH3e097BH/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499

On Tue, Feb 03, 2026 at 02:03:31AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
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
