Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140F8415F2F
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633144; cv=fail; b=DtEtppNTbQRUmjIUj+HyBPqHNR3w4K7rnAT4zIodu3myfzvRxZh6ALZqN7C1Mo/4impFMo3eMs83FGEs8e/rnWrla3mcMHHXJUHRqvY9+/r02+ErSbLtAi1X1A7u5Ci4jY3nH7raQntR7hWZA11IlHzL6fwGvoN1zUImB/e12EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633144; c=relaxed/simple;
	bh=RrvBOYlKv06mwLSc2O5vHbTMIbFjDKXOyM79ihdCAy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hSBhkYZBof1eDjnoZptwWYNHFk3vJ9eQm4fHU4JaoqjRQthDFw9WDGxEH7HTCdEMU9oT2620ysJ/sF5ENriXfqyUk2MvnDg2P4gVzBHV09WKeDs7CKgk4Jo8mQ58hqcSjenjyfElbtZsRvlV7pcF15WhA/kGanVFHJKDrhQRK1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JLBMT/NN; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JLBMT/NN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuMtLESm94aRcgTiu/7pshyrJYLFuO0U++vA9XWSmbLMju1jOjVrnb1klf2bVY4RgbTF6H84KE/PPXzb8D4B2/qAmQXfDnIWtdaiNUu5SlwIabubYPNIhDqtq5qYGQYxcPVbgQbqhG8T3DeAWX8Jf4dFpsRMA0//9Wxl30nTvcWa26VD/88rh+CUgq5JTDY5ejo1TPRRAIV7T/RCKfUIc7V1mRMtyf6qFfjiqL/nEUjOlYd0kPERCn23aP1hX1q8wvssZUMr0S71TfgH0rFanwUr/s+wm05iILhgzqAfrhZqC8o26KG6SY3RoTcIfVMyFXfTWVt8kF+4Vwbfq5V+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKK4fzgTuBxNfGpyQCi4qRTfdbIaj/fZLWsUZBUqozI=;
 b=JUW4QNR5GEkMayg2P/rSuR02iKGzDTA7XL2FMU0xMHi0OrrmeeTGHke+xh8LrwFzrj8YE1YJ34Gp+/5UX/xUe1rk5ykdT5URpQYDCbBJDx+oLIJL/XuiSIHEl46AenGsDHPmzvCEvsmNGsXNaOIJiggBQx4cWyOBoFq7nHD1+CHAnUVoNvboPdjOKUOsX5xrXgY1WGxMiM4SvCvr41Bg6p8CG5ddmO5kkeRLlGBZGBtyGsvWSiPkkpMxIW+ub+NCJYscXJXFihb+msF3mxitNpnq5wIHtrRxwwr1Qtj2CyE3X36S9cSU7kArcws2wNpLtWWr5CjqrxNGBX65CvDXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKK4fzgTuBxNfGpyQCi4qRTfdbIaj/fZLWsUZBUqozI=;
 b=JLBMT/NNvEjS5yHQstDsjS/iJCKC6r7FzEI5tW0jbQpOmhpxWrNdt6kTBvO/nOr1hUvUfoWDTMMf4X+UMBuFEYwz28nzuovHUKDLiKRvVWXyTSC/nJ/4a0vwmZr0gapuqx2D9psOM6Z1YJ6jCa76waIowiSet7xCzSTl/PF+6OCFg2fo1U2E2XxKzE72aKNjzDGgBUlO19QQX1wrDwhJVdHbjTgWY3yOhjW3pGuLGZiMsRwMIRzqbuhsT4JLB+6zXLYuzrHuRgzWHythjGiZUidHKL8SsWlA5hLygHwTxw5HM6hzsla2KSA5b5M+1hJgzDwWR4fUS8OcYZpK9PDtXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by OSKPR04MB11438.eurprd04.prod.outlook.com (2603:10a6:e10:9d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 14:58:58 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:58:58 +0000
Date: Thu, 13 Aug 2026 09:58:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <an3brO5COdw_F76m@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813133335.1941580-7-leoreis.costa@gmail.com>
X-ClientProxiedBy: SN7PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:806:122::35) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|OSKPR04MB11438:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ee3ba5-2283-4b22-e276-08def94b66e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|13003099007|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2m9XDvad8icZt5ctgO5Q0oP5GwdxBBonPxAd08op2ME0MM+bt3//XsGyDTl8Nsoh6qI2GSJ+L8y9rsjS58of4cW3sR5nAsbdobMoZ0RfIbxpygbBe1YLXqyPKoWHSzRB8pdeyBcsWw4t1HMtqGMHuOUpWsTMwVWl4df5Z/6Zo8NMWrJEc3W2TEkWKoQ4XKHlrCXnYtUbFIBUFJa7d4Kc0G0upTHgM1kjYPgmI7TW4feAIzVrNRg0JJ5BIcjJfexUwG400ioJ2Jvle1AXox4TL36j1HwKBU3EjW69ZojpxqqTLMa41vl4GiME66Fm0W+Qq2GYMTCa8hWPiMX1ZAg16npgN4Yfde+nOO3ehSYUl0Rrj/kofIebHMFsX+MY3yul7aiTRJVaio4SXFqI9CK5OKGiv1ey3G6wwR8E3RDzttcqqhv9pA9ISdzsqFCheBugZNrCLdL1hJQULSjUglN0455Sh6G0cT4hWtPBMPOl+gDSMXWb1QCqh7cqbFepuYs/lotu9HZCzpr3GA1mf+0cmEdX2Ivt8txuX0DYezEMfoNhEcG3mYqhbF4D4BIegFz2BZljRBnIp7UOdzO2twOxFx42NX9DUOi7sBGyezn8nKG4IVCClueaWwogYiOIirX4SxP6nQmwey6fpXWTir1NGOpiW/uCh2bm8SzOPdgTDPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(13003099007)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEzR6L8EM3qWzOHVBF23LnJGr3d4LMJig/2qeKX5Lh5tTWLLti4egRyuGHI4?=
 =?us-ascii?Q?yskzUcd3ja8j+zEIp0S4dtMYBhXhxI8L+ZZqz+S8TKm8yzbJIbUgDyeL66x+?=
 =?us-ascii?Q?6VOziMw39f7fN1p7EFut7+Wf+dTMzzl1G4/Bqz4fNxGXchcxK/h4wGOffBJL?=
 =?us-ascii?Q?AVgnuyL8HcUdeKSMT61f0rKeTNfgdcsiff6Mvytfqju75eVKCbM7ngos5zro?=
 =?us-ascii?Q?Kz9h7jWKNRmxe9+dRODuNcj/fUUvnNQ9r8Za77S0bcW/VpYOc0ok140N0ADU?=
 =?us-ascii?Q?ZxNkp9Epr/6XrEgKxtJh8QvmZtXban36TYgKDr+7pJQY3cJg8VHnd01YIUiW?=
 =?us-ascii?Q?+BCSpozNkbKN4Tj8mtf40t5ytsCEQ8uW+nKpGNlVR+XOE/wQC2Nwu8rlLZ2N?=
 =?us-ascii?Q?WVgRQ6raHvIys30NwO9M8er/m9PsuhpJP27QJu7kQGECkEYZD12WsINlIEAC?=
 =?us-ascii?Q?mzBrBOPRyEbPJdgfOxcIH4Hc0hVQqvwwLxY674n5+ZdbRFfWziDFw+wkRL12?=
 =?us-ascii?Q?eKI468Ti7kVqMPkAuRDHiaVa4yiUxFM+hzUEjuCj6VBEs+rROMF37Takvs3k?=
 =?us-ascii?Q?nhw/EdVHh2qrd9ZtleQwBPHzPLOtTPR2Wf6s9c/PhVNkpPyebD2LT149Zjob?=
 =?us-ascii?Q?am3a4M+xnbhwGmS9UeuWoR9g6ilPpIbvYYSytF1f0Qne0GjxPOm7HsM6F6bK?=
 =?us-ascii?Q?TZzRlY6K5Dfq9ReZkpfTlwXMLZPxJPSDqRLMqmO/mQxDGtMX9R/W7k5WrmeQ?=
 =?us-ascii?Q?j0YlTDxbNVqCz44NoA6+zo3R0KeLiHLROI3AfDLH1CXxRFIEl6Kjg1eM98j8?=
 =?us-ascii?Q?xtrivtbae5Nvyi61htTCeAUQ1MeE7QOKvF2MDlRxLrhjCMA5rk/0AmA1Zlg9?=
 =?us-ascii?Q?Ynx1nktsMJ3RKsiVI7ZrrLdwe0BTBxWD0GyCl6NKj0ibcJprGlLVu6a6XBgK?=
 =?us-ascii?Q?o5g1pSCzTO80Mizs520KSLZo4U1HzpGtsj9s25Qzf/DBERjNQ4ZlwbkLNeL/?=
 =?us-ascii?Q?JNX0zuIcPV7grFbJKp6yuW/BZ0V6YIlEftN/uq1AxI/rCzXjenzcqZQisA9q?=
 =?us-ascii?Q?RAi5E45sreBpeyEIpObLGTI0dOTWFw7ptv9UuiqFZLSON8xSiGFoUNTbjFO/?=
 =?us-ascii?Q?Rd9hClLiLA62wsLOlxiXrBAH+732nKfLc9GrbO/+6VthVaZ/VoFNENxhjoD2?=
 =?us-ascii?Q?tQTKEL9JD89GczZ8857s6bfRgSpdpF1Af5mXN6PgVqVMDK0cND9YGNbG83In?=
 =?us-ascii?Q?qgBvGCC9ZgbGm02UF8Fjh/HdZL/4CpbldErDXc9qDRm+3F64FcsTaxJtkZXB?=
 =?us-ascii?Q?aBXJcPDsfp2XlB6bKD/CDUkMdOaXBMTLWFOYi7RjYv9LH/OPWxt4kIPuetaK?=
 =?us-ascii?Q?5GYp8fc9h1oeBHcHrdUEpfHc6tJxWCnSObBjh1EqDLLlgemiIpFAZ97stUfZ?=
 =?us-ascii?Q?ZtubOpzp4fn+QWUwBftHkg3xXeoFLoP8NutTheZpEyFwKggtlJf+THE6vqdN?=
 =?us-ascii?Q?ugQNtR7It6d5FtR3ASXQ+ue5F5yNTWaJUd/YjFK41Hb1T0LLAmabYzq79lwt?=
 =?us-ascii?Q?pfflnVksY4LwD3oxoHcZsyQuxUyYgGrDdsRBKreJLND5h1HVkCcgTyl9OmCG?=
 =?us-ascii?Q?KUDWBIAeGNtZCv5PEhF5kOxPjDCnRllDh6XTMd+9CIqcF+j5gOlmFOhJx96e?=
 =?us-ascii?Q?CmMSZKOL1SOeLQ2YGLm6WVcVNVdcjunybY87GKg2UyzZ3ZHmeUwl5MilSgvq?=
 =?us-ascii?Q?diduC7dkS+5JCsIfq0rJYfAtUuI6Wj+mCdzkl7uSq8SrphpzuI13?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ee3ba5-2283-4b22-e276-08def94b66e0
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:58:58.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oh7qipztzY/Z2heTvzcX1Qk17nsBbAP+QWEfOWKWGmQYdd4tkRWcDpE60EjYgkurfy4mfXQXxf06ASOXiJppFBg04wK59EwQXWb8DQMgfX68uqdfFUs9bWyM3tKyZJnI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11438

On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Add a device tree overlay enabling the Toradex Capacitive Touch Display
> 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> by an ILITEK ILI251x capacitive touch controller.
>
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---

what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2

why not share one dtso?

Frank

>  arch/arm64/boot/dts/freescale/Makefile        |   5 +
>  ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 ++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 236bfb6a1e19..39c5f0db5203 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -509,6 +509,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
> @@ -524,6 +525,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
> @@ -540,6 +542,9 @@ imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
>  imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
>  	imx8mp-verdin-wifi-dev.dtb \
>  	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
> +imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
> +	imx8mp-verdin-wifi-dev.dtb \
> +	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
>  imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
>  	imx8mp-verdin-wifi-mallow.dtb \
>  	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
> new file mode 100644
> index 000000000000..b78322907192
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin iMX8M Plus
> + * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
> + *
> + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> + * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
> + * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> + * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#include "imx8mp-pinfunc.h"
> +
> +&{/} {
> +	panel-lvds-native {
> +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> +		backlight = <&backlight_mezzanine>;
> +		data-mapping = "vesa-24";
> +		power-supply = <&reg_3p3v>;
> +		height-mm = <136>;
> +		width-mm = <217>;
> +
> +		panel-timing {
> +			clock-frequency = <64500000>;
> +			hactive = <1280>;
> +			hback-porch = <20>;
> +			hfront-porch = <20>;
> +			hsync-len = <2>;
> +			vactive = <800>;
> +			vback-porch = <5>;
> +			vfront-porch = <5>;
> +			vsync-len = <3>;
> +			de-active = <1>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			pixelclk-active = <0>;
> +		};
> +
> +		port {
> +			panel_lvds_native_in: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +};
> +
> +&backlight_mezzanine {
> +	/* Verdin PWM_2 (SODIMM 16) */
> +	pwms = <&pwm2 0 6666667 0>;
> +
> +	status = "okay";
> +};
> +
> +/* Verdin I2C_2_DSI */
> +&i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@41 {
> +		compatible = "ilitek,ili251x";
> +		reg = <0x41>;
> +		/* Verdin GPIO_3 (SODIMM 210) */
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
> +		/* Verdin GPIO_2 (SODIMM 208) */
> +		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> +			  <&clk IMX8MP_VIDEO_PLL1>;
> +	/*
> +	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
> +	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
> +	 * always divide the output LVDS clock by 7.
> +	 */
> +	assigned-clock-rates = <0>, <451500000>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint = <&panel_lvds_native_in>;
> +			};
> +		};
> +	};
> +};
>
