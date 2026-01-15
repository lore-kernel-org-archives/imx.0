Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C332863D
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461579; cv=fail; b=g36yNaNIIov3+6tlaKVffk+Bp6AOzAjJQtYsOUHJnzdHrBBdiImN9/YRPSj0st+Zker5s+TXntFGT5eBs7taqjRU/DoRdAkP2VLVJjAL4ji1uVJ5OrrzrYb9KBWDqS+7TNPJsfy3zxYD9qBmKLie1a7yCZxn/8LdaOxWCOCJe8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461579; c=relaxed/simple;
	bh=Vj9mn6MAC+rcNBENhPruZFNxfZSfEATtBd9kh/au5e4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A0Befa1VW2oVWaTwjRAvVH2GKYVMfZDp5gngQl4UZpd4WdiOFQzqA4rAx25/kaiiq2zauvs28Ryw3GQDibHVsG4kxTR3Tq+dOTUo/2lJ8yKMC5ofBtJ7lHgCkkpRbWd8IJ7+dkvXi/H1qDAtDcFLMV5R2gDlJYXBQWUjcHzxMgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XniAbbWc; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XniAbbWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuIv9LyWTpXGGb9xuMR4zAfbinQZixF/3vmwrScN2R9mFt0CW0oCytGxvzZR2ZVct6MzIqJMMRrNb6Bx8hOPrPlsquH3PiflIHDtnFWW84trra/60V0g8ZPNX5quVZPZfM6kWAG3oHit9evA5PGiwNSCblS+ncynXO1xrr7OdI/5zG9ZBjR0MYMCIBERMljnvzmUmMOijNilJuvEmCmDLTxz380iubTjn/rrQ9IoOEHuZMwHlLOHv6haOOZszR4FLWDYXY634UPEJ7e3Vtm74PnbDKyERlHU8L733ojqO8cuPK2Xh/LpvobwQHBsBe3RSCjF3DRaz6XZIH9IMbsW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKXz0XaI7IVCzgj6HoNhAWeSYB82A6QkX7F1CTJ2pMA=;
 b=aPeLRyo+2mnQfZtOAj3P5lNNeD0D85LLZXyxCjXUsqH83SRbHWg78CU/hVfxvvRH7KBxN3fSM7eU9xJGUl+t49e6F7mAg5glyrZYP30tya6oZy3RqmV4j7vXLnmH0YqHm3zwWf0LTjh4kidAWIXFIhJRPosR2PaXLmqgL9eq5AaT7KRFAuTQWvHVuOaD6Sc0jxKfxbsLCs3Ln7SeEwd7Axg3u3TL0Ajc5M+HXzSbjPaFVJxpx0ttVKqvCptKD+Zv/HgF8XbZRPP0YAuJHyWADcoj5rRRcBqlbJE2QSjHzJ3K0O9MmmYX8lnWf+XF7h67UmtFHcceVqUikTAjsJWxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKXz0XaI7IVCzgj6HoNhAWeSYB82A6QkX7F1CTJ2pMA=;
 b=XniAbbWcT9zxbkTYeq3qL80NpW6MNxrKY15rCoTXqqfzDfEh7qWU8KqoqOdlCRENnSyqx7sAYhmIMbgs5hi+ktYkJ1DVll4jCBXJsLI15TPvOsWT0vDEALkCMoXiRl7kdrCDTqm51hV9HOo+saHbKyleOUNpNNN0u4FzicsL9KANvQcLqvghvFtH71jhY/+Us4SgOHvsgFiY/uK0FQSMLQqtct2njYcJZrKNLqRKJg4wxQo3LJVXwz1JWlVVTfnEIljbMip420ZYugwx839C4MILWb/iffPnl1nLiG/slEUeyfpoKXuUCOSE9TFIT3sdb44W8liSMZIEg6xw47v6dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7322.eurprd04.prod.outlook.com
 (2603:10a6:102:8e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:19:31 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:19:31 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kwilczynski@kernel.org,
	mani@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: imx6sx-softing-vining-2000: Remove the deprecated "reset-gpio-active-high" property
Date: Thu, 15 Jan 2026 15:18:15 +0800
Message-Id: <20260115071816.115798-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260115071816.115798-1-sherry.sun@nxp.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f76c35-c563-4981-fd50-08de54066d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNtbK7HiA6KUxUdoBomwK1/L24FGEO4Wnl1hMpxeXGwHLCKImVtIVpvCejyw?=
 =?us-ascii?Q?wcyV/+/g+RPEW4nWaa9BBD2uJdP9FUizOdUG2soYfDoq0oi2IlzCjA0snl3R?=
 =?us-ascii?Q?oa1E+reqQ1ajBN5RfnFxAoMkryk+bkPyPT9l9uPsXzG+CT4wuvtLr6xgciAk?=
 =?us-ascii?Q?f4DX/ihYZXFIY7GBnsJRn6EtyWxVwcv1FdaOE7tQIiMm6zkeWJJBpzBOL//g?=
 =?us-ascii?Q?Ay52KdED2AhpZ7FQrYaLttdDSiLTwaoU8WRnCvih2uwxMsEUm7hgHIn+Zxgg?=
 =?us-ascii?Q?h4hHNw00J6HffK+U7Tt+IdJ8/bGJ9KKvMUINaps9Ld7pGJxVRMdEqmUoDaEe?=
 =?us-ascii?Q?ki0w3KweX0mlrjOuQIhoY0p63UGc/BY3BPz0jNYD45+SrKIk5o9YLizwtPPL?=
 =?us-ascii?Q?TfIKBpD8TJ0Je8TmaZ7u8ryttmy5Km58CqmyEEKFKd9aQGLOfIkQgbR4RtSW?=
 =?us-ascii?Q?6ilpnCwCB3Br32GUBft0LuMMIL7Kz8OmuCO1kkLz64PoyQKA7LkQjeJ2Rt/x?=
 =?us-ascii?Q?YAj/UP0O8rQ1v3SF1MK8jBQyxCzwMrdyfttT+dXWEYR7o9+yLvV/loqP79OA?=
 =?us-ascii?Q?j1BTr1niG5Ezt4LsCFiwk1GMYbAP83PxzUjY7A1sA8Mk1FCpH4unmpIvFSMO?=
 =?us-ascii?Q?oaXxluBzbNVebNEsjlrVqUdsTei1hm+w4JkW8EeAXcvqJvBrbAFVJ6c+sYFp?=
 =?us-ascii?Q?2mV0GvXuEb8zbmMu/rk1KrOv9q9Kl/9y4wUT0eLW0aYpHkHpB3H350FeYyK0?=
 =?us-ascii?Q?CmyZot4+BjZNy7Po0x6t0LE4Wxg22cT5MUsremTBdm5zLyvdXdKI36gi7+H/?=
 =?us-ascii?Q?uijIKCwWF/RHhiaZBuEHLUM2V9f10Xj8bH5fpsiUjSprZLEwesYwz6+5/muW?=
 =?us-ascii?Q?/gOjQM+O6lMZw/2GWi+0GlJW9sI21Z4J5AxEaSJtfHf9ghvzUcmG8UgLBNxJ?=
 =?us-ascii?Q?fZJ4ZkeRnSyMtVjy3RlmtO3c+gomB2lYYxiIYiemb/nL9pThpOh/yenLcmtE?=
 =?us-ascii?Q?BVcLWQ/DkhB2VgwmSibHgUo0tDAbajUkm3iJXBv7DW3S/pA2XSbzYLwgpBoN?=
 =?us-ascii?Q?x4eXo+rOA4XoXhQtBQLfQA9KzU8bHIfl4LXiqDT3lAcfYqFFDVA/32oGtALa?=
 =?us-ascii?Q?9gn2TRL4pawiYX/W//BZsk2TBsll1UStFQbOAazG9JdP3HecVLOtSmmVyWZr?=
 =?us-ascii?Q?gkSsP2aXEt+moCRpdzBrHs/YnsMENENxGxfxUlhxw8r502qKaUZ9Aohj8X6R?=
 =?us-ascii?Q?prCmN73VNWrKGhVo/USu+Hn+GifS96i36VzXY1ikPT823FOFJsHR/TYBo471?=
 =?us-ascii?Q?3piVaSsmAxFSK3wkdGD2YQW8mbS9hBUaMCKgrAgk7oMYO7Vzg8/NdvguD3kn?=
 =?us-ascii?Q?D1lV5qIG7PCzQKBEn/g3ZQYHq1B6iAKaiKMNvTv8CglqcfBxqtP/3P5vzGdr?=
 =?us-ascii?Q?g6eb8D8KTDMn43GkzZHlbwwAGNG+GwdL606ZUQILtdm3pC0dJk1JbWy6yndJ?=
 =?us-ascii?Q?mHOna06k1KLKYBryd3CcVMgV7Ea63tUpuZpr/tEPXhhAaiu5aIbKpunNqtRB?=
 =?us-ascii?Q?irXr6Lh9c/6wZ/fGv5ARIwws9nkA3KLtTwP/c3lSaFWCkjWQUcTON2a7d6Jl?=
 =?us-ascii?Q?6WMvtesnCGBNzRy3bnjbz8R9BCn/b1YkBZRN0FQgxHwo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BZulpBhcF11GZ/7WSMh7ol3aaTvF4FMU4cPqP+6dUYkIUDAvC4nmwVKuXgUT?=
 =?us-ascii?Q?iRsBjulDUCy2VGZTCAcL4lwYRXeCy6AozwYhnCF+6NJkkmwJTR0+ANwcLqh0?=
 =?us-ascii?Q?P/wU6xM4Wc7jUUuWsD4ZIz8yudSAE5bWVa1QVFwhcpeQxDAQ05xRmU3ETQx1?=
 =?us-ascii?Q?B/6i2LxcV1F60kxs9emcy/PXtTByJKmHJUHxTZ4JsqryvtVyIk07CucHYXOC?=
 =?us-ascii?Q?asJl3Yt9DKEDrtSWP49au6RyFKW9Rd/ZKM40Y4oqNUU6QX2Mo/VmEYWqKS8B?=
 =?us-ascii?Q?SUvUuOPbujVv/M79Ihz+Jx/Pqg4Y77TR3RrQaC6FDsCfd0AUsGi8bDTyjmCs?=
 =?us-ascii?Q?39bZY+FCTFtf9OX4Wawa9fBrFtiLMbTsAHW8efSGHZtL5RutLOFaZOuY0HNS?=
 =?us-ascii?Q?akZ90YWi+Iwox3J3+gh+yzwwWpqc5uvGw8W+b1T9p/JYm9tDCkgE4XvS0MGK?=
 =?us-ascii?Q?ZegVPHHl6WcGuRpcXJqilefH+XTPEYXCZityNCQMxve2EXKCe0QaDJJu7EyY?=
 =?us-ascii?Q?arcDI8lB23Tg20Zvp/eXRgUFm/ODVwBchBHY26A6gG70gvOW0+Mm/s9ZojsT?=
 =?us-ascii?Q?6mZ/sWwNVwBiji/cYex/J/4roqNAjku3RqV2FXf1QSweMMMaQmWhpA6lK08o?=
 =?us-ascii?Q?Y7/jFxxtPFvmRMEvEEhkaFwwd2HZib+TXCjXW0trTpVcONmRb7bPKKR1z6vI?=
 =?us-ascii?Q?2RxbsmLdPWxQFP1sV7zPht2Mty78SK2bBWQtYWQBRpLzh0Q8P9SKSSYyVJIu?=
 =?us-ascii?Q?5HzwdTU7xrHjac6EQBx2pwU2RmAJnv0fsX4qF5r4aCzEf7wPpTxzWK4dm9D6?=
 =?us-ascii?Q?wcE+wWhmzeRKm9KA7bRSJCpRRQHQZto4y+nE4UuahwSGdsBIb5pEQvQPJX5W?=
 =?us-ascii?Q?s/tu3bNK/4Wlh4mWZmznlP/XDtonwHNtc977C9kyD6iTOsD/inJ91m87FXfG?=
 =?us-ascii?Q?R6v6zhm/X3Pp2ctrrhjKHnT9K8lUEdT2/mDoeA6z5HwwvWo/FdPStfnydfn4?=
 =?us-ascii?Q?YrzTRyIbymaa1geVnXtQnODzn1/6A0KejDnWS1EageHw9aDIEynXLIPSDkXA?=
 =?us-ascii?Q?wbHZkpPu01g+g2NMN3qDST5N6wowhU/d4S+YT2TWkHw58SLYSYRusPTIvaq/?=
 =?us-ascii?Q?B8BRUsbYVr6/wvuGjXfwTRN6vfpG+YwGQBjQdFXl4QcQrjC510diBuvg2cMg?=
 =?us-ascii?Q?3uaBXqHpQ/cj+QseEwvRpUBW8TXd8u0fiZh9Nqo2f8Grk9Trf5CIFKfXHlZ9?=
 =?us-ascii?Q?d5Dn7hvUFU8z7zPEXiQSj/pzYTowlKyksot00UwyquwK9aqh4VjcNHFllIJP?=
 =?us-ascii?Q?6ZXSMOBhdf8DMKMdatAwiY0CfICQM8CEjqRXORzNAi6ZYvn/Sma7ioQ9T1by?=
 =?us-ascii?Q?sorvBP8Az9LoGyz22X9b6s2yR3BkovtHRPkQPc4ciYVMREgrjsXaxFstCTXa?=
 =?us-ascii?Q?FWkc5Jv/PdlT4EbkuSk64MBN6xxNtpX0vijqRch5UjRHy7xkTTvNEWAghYuk?=
 =?us-ascii?Q?Ry0xhsydBEoHbk5AAbU+ka46jW2nez7bG1RoOFFsjP5morY+5DkwWvFNpt3e?=
 =?us-ascii?Q?GgTKkmeQFpGE2qcdejPjayRA2slXdvs3P6mbtrjmI1gWxu2kGKWBIBD+iJhj?=
 =?us-ascii?Q?bSKVY3GthfjhXEJZ2+cYKYgZhbNTW5k6B5sZ9BYj07ENJ6isXxuywJ/j2cFl?=
 =?us-ascii?Q?3Y0RQZpXAFdvgVpsf5NIoHfAkna503SNAqEU53MtRym9gSnxtqFesrRDPYNa?=
 =?us-ascii?Q?jdmmhAltyA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f76c35-c563-4981-fd50-08de54066d36
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:19:31.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6tdjBn4HYnXEJWt0rDLcDJyfNhrMb1+Y0/VPxO2zjO9dL/yxNDQsyqg7FwCPfg5B6DqZohBGrHm7BNg0CC8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
deleted the "gpio_active_high" flag in pci-imx6 driver, so currently
the imx6 PCIe driver doesn't support "reset-gpio-active-high" property.
Let's remove this deprecated property in imx6q-apalis dts.

Fixes: 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index 2ffbe2df4776..fc2747c38e20 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -500,7 +500,6 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
 	reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
-	reset-gpio-active-high;
 	status = "okay";
 };
 
-- 
2.37.1

