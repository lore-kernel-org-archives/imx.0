Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8833F8D2
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141005; cv=fail; b=e7o5ItQMw4F0e/rvPF3px5DyEQFA7TQ/iX4ol5h18zGUKmu9jpEsd61vwZ3ffQigFKcWOMUWEfpXlayuw1Wk9ifg1jcWwdbtblntx9qCtM/fFSk26GtygxSHj8r8fqiu5BUCs/rALBQq6FVR6VSgnVWcGWbwV85gsZcoHE/SGDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141005; c=relaxed/simple;
	bh=qF9/cXhcDClye8bAgrHj6Z56TXkcRwGlPSse7S1zBDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dm7m1IoPwz8zfqAQHDRC15AXcRV876q9Gi/oNswTO1Eyk/3BdtqaUWGn19bpY3VfARLg+lsQEZ+EQMvD6rJjcjlERoOzGDlyS53mN+CPMzOMxXEL/PSfaw7Fd5DJ4CBjhnjbTx3PIwYuHGqaudn02H1cTwMevTzfgEcCj2UMtY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X78QS9kF; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X78QS9kF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wox71V/9YVj8It+OVlPwXsbZkipRvQ8qxvrPWNBiY8Df7gST1wSNoU5fD8LpkzEfeg0+1v48xxRVnkA3s5uGTh1CHDTUFys3AljOjuLvfpF4THoE2RIXGUCZksgayhPSi1RRA0iocqEF/Ci8jMw9Io78ofXFhQbBOiNfNsruWDDyXABQvUyxpt6L/TclFXiwJI/tDvPR+3czUNCchnoxqEO9Izd1dbIDTdq0Wnuem21D+wTQ1CBsxEb7lKnng1panWnOpHjE3kq+u2TJbRizZRKmyRF+129laWeQlbZZOPtZ69FWKwPU1WQdNHWLDwpiVCGYfnqweSykXLGDnEMDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDTYjguXTm8PgZWINX96540aSzdB5SUy/DqjGgXjUWU=;
 b=EKDxE+HOrH+6PkrIBIcHLsQ2WOkl8Z21P9GKQeMb7awf59K5s3j3Fo4BrmtGx6HcJmEiKo60cxT9Vu+c95cskU5anO0ow8P5lvlwRJbhrCPBFHy3JajI5r1Baf72gk8O1hXKh1GdQngeUQPS8FJEPTqVW74QcZUOAGXKZkPo0eH8sA3t4u58Qwdw5IuwSmv87Ip84dG+EOGOMx8UifdoLWrrzyLZjQKlItYzCEd2VZ7TOA8GrnlLXFpGxDa8HPYwIybxgdUkd5wggJbQHd9eKdyD2NAiQ10UatoiJ1TsLZUzopgaBPb16/a6yMpz5aa2SWQYCU7C9SOjZpVLzeMZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDTYjguXTm8PgZWINX96540aSzdB5SUy/DqjGgXjUWU=;
 b=X78QS9kF7PY5Wrq9mbl+VkHBahCL/YNqEKqWfmrpqehiqyJpwNbqr+YRqWqCLSizmPq+ArQEW1gNiVOo7+aeUKrvqi1X2+HYcpYirbZPqdVftgTuQLZQ95aYTeZtZg5yhXi+ULdhA1NvlGVcqudQSJrTZ/VtQZrFt/syk+oTyaeVvgwkvYDXIQUZsC1Kzn5qT5uS2e0ycR6JqFQ0aNom3Jjtz5yBnMH/x7BnMGFJr5eNKfXHQgVO1mHTWvI3u3SCJM+Gsbz/2OH+XLByd5RPNmGFcEMefMeAvJxkoWy+1sSJixJ9uMtJcg4AjMQct3C77q5EU2oryrcs8pHJqYlZhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:50:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:50:00 +0000
Date: Tue, 3 Feb 2026 12:49:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Message-ID: <aYI1QN6g/DbtfIz+@lizhi-Precision-Tower-5810>
References: <20260203091459.1595474-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203091459.1595474-1-sherry.sun@nxp.com>
X-ClientProxiedBy: PH7P220CA0081.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 983ee9aa-bcaf-40f3-8a09-08de634ca69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JCHjtWEqCzaCGgg9fHqFD390kELAxoshkiErYPJu4DnaE2IJ8ep3Ee4V9scU?=
 =?us-ascii?Q?b0b1TnqCYSs/obZEHuTZH/WPq7rnaBdoooMBXddjF6PFPvh7PP6ll4rIySBG?=
 =?us-ascii?Q?3fiCmSWqA08KmuN9G4+0L1DYIcp4fbvJ0baPhHQn1k86fcO428vHYeaO0WWb?=
 =?us-ascii?Q?NS6K5R4fRUOC1+uafd5UmDtkotJBgRWbd8UJRfaFr2/84ACywCIOVIXvPS7X?=
 =?us-ascii?Q?FDDPK4FG8XBVrGdcMDv+i0Df270IqwU8r/2NN/e96n1beD3fU8ftN7L52NnZ?=
 =?us-ascii?Q?tZO/LKVMix0LWvGVQAZAzaV1G9wuSeQHmBShaOK1GcDmR1g2DlWG2jK/wbr2?=
 =?us-ascii?Q?QQATBlyZiTvaxPsmosmiGhRaucOByyBH5CgFjXRuE0x/AZEwV+/d/htT48aF?=
 =?us-ascii?Q?lNEgzlDRq2gR7pClZsb/zHlUGS9HfSggw42YT9cd8Sz3ndj2W9lKRHdktdZC?=
 =?us-ascii?Q?QZQNGvVr07N6FhxQ5fCSvZVmspq0Pj99UcfYlWFrlPrKjfsIOpdU8DV1bFQI?=
 =?us-ascii?Q?e+CoSb+c87vgGMlKV4kFo0mr0SdXVHsTqCqQTxFaIiTMo7aQga8JGm6yr/gU?=
 =?us-ascii?Q?prZsKjTLN2OympIZNrB8/fspVnl7CqLAQFCVFSf17cCBAqRqm3lqapx3W59b?=
 =?us-ascii?Q?qjnVfZjwnQZskrIF0O1MFLpHNt+B4zKX3Whsdi5rhlCA7U1OY9nOHpYA8G5J?=
 =?us-ascii?Q?4MTnYjMdF3UTXVhTrHwznCk5AOsq7eBWKSXR/yYzn2t8Mz5m1dBddF0zQlw+?=
 =?us-ascii?Q?6FgUxxbvqE2tKM7+5btBRAYk/uTsOMNrlFYlar16LtlRO+MeTsRF6SCZ6L1/?=
 =?us-ascii?Q?WUucKf4aYPjamVAlqfJQqf1Jf/9mUNkSLMaeBVfdr4QJ5coLaRx7CkW+jCy4?=
 =?us-ascii?Q?+KbIdnZQF5MRXlxB/ZGLMAlnVHshbFIgMh8em2FDjzcVcCTCb9BJjhnQADtz?=
 =?us-ascii?Q?oLnlR0X2xYb+ImIFyaeH8mqOS+cK9pOvf6ffyRRz6tskNBdaRVWhIrqT8wAw?=
 =?us-ascii?Q?Q8YqYK6B50s3y51S2FL7j+3S+vkD8f2vFP1/xE1R/ufHHiPfz66S/bLcYaY4?=
 =?us-ascii?Q?02ykZGenB9kAVyh/y3KbMlKEE+7Fsp6p/2T6kcipV9LmyekcINiuLXdd01Fs?=
 =?us-ascii?Q?fbTmnSq8xsXUxzCsrMlwDG0bjup0Bap4V5OW4HqyhHmeZU55crwTOyrSrkVG?=
 =?us-ascii?Q?dxAWc8AKgAInue0qAqVmQotdTkQvdeUqVBGLQ4zHKlRij9rRLYJ0wA+nwnja?=
 =?us-ascii?Q?CCJ6A2+3MV7B0WzXrLSRtZat7UPVn4a+JXPoKFs4yyZLToVKmBA2phs42v4B?=
 =?us-ascii?Q?mYCg+CMNOah18h+lHtGPMK/HJULi1VhRHR5SYt9sAA8UBluq2UdJ+Q9dtqKK?=
 =?us-ascii?Q?JyH9aYXHU/mQr8l5XkUNieIPd8MTEhadjAFegPYj6PheYLt2GmsI5ux6Wkr4?=
 =?us-ascii?Q?evccJanprFzW04gUcrhcIz7IS7f4CW159/pSD48b8wEdaW5UCFcX7GjfftDr?=
 =?us-ascii?Q?gvMj6uOZ8RYn1xltURWYc0gHxJa2qAB1vj5dr2fDwlitLaF6OZBx42Qq7uKw?=
 =?us-ascii?Q?1GVAFo3o+TUiEYKzgFuziRYaonJNUuBLSAlhDp5KAOpCenUDsRLL/GTmYByY?=
 =?us-ascii?Q?kAfFt8FzthrW1jYlR6eaI/4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l7IRTe1cyc+yg6Saji2lYecKpT9QIW+7tQZcgYXDmpbv++w4ITXVny+MZX9g?=
 =?us-ascii?Q?ETDZq54io2/Akbf1HuGuqJL8bBs9+UVThHwKP1eyeyFrv04gGaFBdGfApvai?=
 =?us-ascii?Q?Zeerz8L8N9kIBfN48XaR+y4O7DszurrXolxjTnwnRM9513E2GmSgNFGWxACP?=
 =?us-ascii?Q?aluvZvQOPF9ne6GCTBPMToAMZ/1tFb651gB30s3IrpG61/SDkgQ5GalJ+m1N?=
 =?us-ascii?Q?AKMDMwmI8HHWrrCfkuBLzleGbAxiswgCy+SCaFH5hx4tUCL6vCOV1yW4CyBA?=
 =?us-ascii?Q?qN7/XIE2ZUvwHyfZAwAph2RX6ahwQ6qpLPTmEj+ZsvQVhJOqddOKbZFYE2W8?=
 =?us-ascii?Q?5HDS8cP+PBDL/4wG9AUyBjpWKIdKLIOBhlxT1QEe0tij2AbAjjsFBknQhj/8?=
 =?us-ascii?Q?0D7jDvjpi4YlKZ5DgzE5IPD6W5LGogJPKTpzqt/qI55Y8whrxmlQt1u7CvWY?=
 =?us-ascii?Q?wkqf7SOJhEXFGPRW9/SxYh2rPcT8lrzP5gVrPl/GU2FpRgItDTvHlnOmDLsU?=
 =?us-ascii?Q?ZXGDJy1gNjrxPmWEFJIhDIMsppBxnJ6uEIa4ZFJRZV+t+BkGjYGQi4mrutFz?=
 =?us-ascii?Q?W8gm9DCG2oQRPWwpfrLg/7DJwRP34bEgS2O2yPAXItbVt4xAZlweM/b55DPA?=
 =?us-ascii?Q?I8PHlW+5K6vka0M4R7RNiy/aeoeoijZVYSCE4QamefVjjlc1hpMWaUqfGk9E?=
 =?us-ascii?Q?eHSMKy9KovGp6zb+s3Wecql/fESolj2dNz9CIcaQ2muTAmxTqkApoykso3+z?=
 =?us-ascii?Q?X2LU0Eydx1AaI6xTQIRYKcNO4jMpmPWFRBQHYnbYfavCe2UkD6PdyhFXNTi9?=
 =?us-ascii?Q?IYw3rkDomrlR3lRErk5p+/nCn6VZl+kj5Fzip284giM+b+MVb2cOTPF6w4Yk?=
 =?us-ascii?Q?sP5ekdwJ1OqK4QN1Ig54M+PAFaV5rXkoS+VsaJsNYbjjHmlMLcNGhIx/Y9lO?=
 =?us-ascii?Q?ufYXLTD0LwfRKIHPemA1DOiRAWMqJFR4qoEsfgHimb3nvESs2MoUM5B0xlVG?=
 =?us-ascii?Q?NVOzsdSiI9uFRJgJWsog3AMrbZWZ8qELwBtVV5mjD4mbyTu3M+Jip4du5znK?=
 =?us-ascii?Q?a1CtDBVFp5HqKZzuB0RhmJHtztbPC3JX4U3rFwil6brndQzRDLf9ccX7bgLd?=
 =?us-ascii?Q?3rakv+vlEGi+xIyJs7DeabkckCgUF+xd2GJxn7jllxPppn+AB5U6j0/COrth?=
 =?us-ascii?Q?OEv3QM9moaB67wfztvt1uNXk1b1E3MeeSi43zU42Y7XqyVAuskHjVIzowlPO?=
 =?us-ascii?Q?9F8r8rgFpJwXSP0hPNeKTxcuYroo1qohA8ocgvRYexwo1l4OWwodAT70bjHB?=
 =?us-ascii?Q?gOSuQx2yOb1hY3/D8hnnKx/bRZmB4Bdgq399rKBW9V5d6Eyok759my7Mle8z?=
 =?us-ascii?Q?zIRdhAbpSBRWPLICeHJpRmW2r+SgnOQvJDnVOSRFpS29xQfhN6Lhx1pf7W9P?=
 =?us-ascii?Q?yAog91oJpj575QqBHR3RbTU3b25qrGz0N1wVjmNUeMHxUYU3sXdB1zEjQnRp?=
 =?us-ascii?Q?qW5sdGokt2oIeQGROm9j7B4b4zYs5bxaAkdysmN6fCFfrqPiLuCkr/T2shxJ?=
 =?us-ascii?Q?RNox1vbY2O4MjidYzkGJwDqUOfaSPktxTqGbn5p3r8dmvqHFLS2jRyG5ZBIy?=
 =?us-ascii?Q?0uynMpWGsCwi2EmLch70R+9TwFipiuY/4QCispLNEKnZyQlfNQqDujM4Zeoj?=
 =?us-ascii?Q?ACYgc9rSEouPTCopB8O7iUvoz8HS630J6PDoEPX+EntaQA87?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983ee9aa-bcaf-40f3-8a09-08de634ca69e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:50:00.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TTKFuG/8rHvmDGMjEnJb3vXb/XuanVphm9rfHIxYdtxdRL7bL9ma/8ojrcL9HFDexnbSvYo2msR0tKxQdB5qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499

On Tue, Feb 03, 2026 at 05:14:59PM +0800, Sherry Sun wrote:
> Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index f54404c9bfc9..8f4f6875d036 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -20,6 +20,7 @@ aliases {
>  		i2c5 = &lpi2c6;
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
>  		serial0 = &lpuart1;
>  		serial5 = &lpuart6;
>  	};
> @@ -54,6 +55,33 @@ dmic: dmic {
>  		#sound-dai-cells = <0>;
>  	};
>
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
> +		 * Rails reach their minimum operating voltage (PCI Express M.2
> +		 * Specification r5.1 3.1.4 Power-up Timing).
> +		 * Set a delay equal to the max value of Tsettle here.
> +		 */
> +		startup-delay-us = <5000>;
> +	};
> +
> +	reg_m2_wlan: regulator-wlan {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -145,6 +173,12 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
>  	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6416_i2c3_u46 4 GPIO_ACTIVE_LOW>;
> +	};
> +

put usdhc3_pwrseq before @hexvalue nodes.

Frank
>  };
>
>  &enetc1 {
> @@ -760,6 +794,18 @@ IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
>  		>;
>  	};
>
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO48__USDHC3_CLK		0x158e
> +			/* Need to config the SION for CMD pad, refer to ERR053138 */
> +			IMX94_PAD_GPIO_IO49__USDHC3_CMD		0x4000138e
> +			IMX94_PAD_GPIO_IO50__USDHC3_DATA0	0x138e
> +			IMX94_PAD_GPIO_IO51__USDHC3_DATA1	0x138e
> +			IMX94_PAD_GPIO_IO52__USDHC3_DATA2	0x138e
> +			IMX94_PAD_GPIO_IO53__USDHC3_DATA3	0x138e
> +		>;
> +	};
> +
>  	pinctrl_xspi1: xspi1grp {
>  		fsl,pins = <
>  			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
> @@ -802,6 +848,23 @@ &usdhc2 {
>  	status = "okay";
>  };
>
> +&usdhc3 {
> +	/*
> +	 * Only enable SDIO2.0 mode as the corresponding GPIO pads are 3.3V, the
> +	 * max frequency is 50MHz.
> +	 */
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3>;
> +	pinctrl-names = "default", "sleep";
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_m2_wlan>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
>  &wdog3 {
>  	fsl,ext-reset-output;
>  	status = "okay";
> --
> 2.37.1
>
