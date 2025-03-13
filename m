Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1913AA3E
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 07:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850135; cv=fail; b=hv5zLpX5ROYdoROzen05S1UAoetbqu4It8SR4Zwga5H+IQ9drEEe2rSSKHmWsBiKQT+JvYKnj32q5fHGS4DQiTUTBCeBbwAe1BbsYMqGhwd4oBwZGAJcWfaJtKF+23D+c3g2hHymsBlso1+jTZp5JFgd9KCNQbOUtJIpju16vhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850135; c=relaxed/simple;
	bh=NOx0MMGcDm+sHJ5YSPzKZNJVpzFhtK+/pZ4mCNvW/ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XvmF6qpmdhL6Z4tAXNn+Eul0/WfuQOMA3APEpZeBoMJgAXg6H4MiUViF+TqYc79MvOB0LjQ+b90WHwNW6TlAnwJORUmMQEZibcFoKiDAD6RUhc1FNf59y0MJeqGAHj4mmuCFfkdZ2qrNsjr+0PZpoBWWa9q6I52OgxLj7THTHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AaROu+Oa; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AaROu+Oa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv7WGVQd074rgAKqdrnM1hQf6byBTXpyILmbHSlD/2bPvS2UltzZYmJazHo+iNLmGmoPC78SFKRmCjGtUNiigefTzizTvfcoKtkDh0kmiQmXj6/Ztri1Z+AW71Pi0xshGfP+65nDRK33PWtzGWnYEAmEVBEB36xFotMErWa9sfC/OlNUE8jlYG3A5043rd4QKlfWVXwU/7oqY/dp1ILWAiwB3LMtZb6Jjvzp/CB6bT8AZdAC3k9Vv4chzzRxXqWYuDBoO2kkm5ws8+dtETxu2tTAkL8ErVk0OmNy6W17oGvh2zlRVISr7g+QxLWAIzyQMyBPlbWv42D7URGcNRzxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0T4HbRy5vbjnwIu/aWTy5P/UeLh0IqA5alhmQCpFdQ=;
 b=H9umdx+QnUtbZ0TubShqLmOvxfiSLegCRRN/1Bec5JCSgOQ6LB0WhyNwbww2mIFm68ETGc8U2NDKoAbJn0WHSn9rQvbt6kiJNYDIYTw4xR63jYawZq2c3ZFrMdIg1ZANtdOMI6OQzEdxEXyf3aadFukUdwxJDgsVYDWW7QqW65cIt1GPSWZcuBSBAgoGCoB0BsxWXB/VTFdQESTLJDQ1pszn1aZBPsLhOiVb6UIiqbXaAhj1R8AYckOvdSAsyqzo0X+gggKP3OOY05Y9WrtIIUzWnb6gHMlVsZLrDA5/cFZW2rsxV9fzbD1/tH9XkFUBCUB0YR6YmrOS4qXV1dG1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0T4HbRy5vbjnwIu/aWTy5P/UeLh0IqA5alhmQCpFdQ=;
 b=AaROu+OaYQ1mD/A50u3M6IeX5pQ5QbixLnM/gpIHZaktBs0o2ebM++wB1RQsVMQxU+d/mV/QlakGd/13gcYrcHshcqHEeBAeScKvuGQ1fTSyGmOMA++h3sHkhQwN2s0BXDQdCZiKc+imVUsjcCwXkvR5S57h+RSZt7g+ykH+9FOC8jsCp3M/Hpzf4qRVZQH3YmM/4ugH58unhEl97pKDLxWGMbh0YaaZQNCPttojMAJvesal6WGCWBh3eOETImv6vEaqcREg8GHjrR6286/AYaSZqDyfP3VbKs/+Vrd8rwkf7amGlcvkK1maQaE6qR23n5CiHVa5DYQ886yXhYCfbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 07:15:27 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 07:15:27 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCh v3 3/3] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Thu, 13 Mar 2025 15:16:28 +0800
Message-Id: <20250313071628.729168-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313071628.729168-1-ping.bai@nxp.com>
References: <20250313071628.729168-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dfd1dc-0141-4ead-b581-08dd61fed4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+wMYwzO22TyTwT1pyt0PvqPh6aPFjobLZSE8oeU0PwW9B/7Fa9tIqoCMOQgx?=
 =?us-ascii?Q?HpvH0w7UzSOLbFiAW4jCs0ee09b+7wmjzexLlIPX6eslmGcubix1+Bycrjkw?=
 =?us-ascii?Q?HS2I3NQGdYq23bIN/vmFkt25mju0anmwbb2dFL5FghhOC+siH2gj9UH8zDAg?=
 =?us-ascii?Q?A9TT1tHhfFR7U7QY+jc32m07q+jW9KJp9UjzTIgAp5APBwBFXHaDMIl+QjnY?=
 =?us-ascii?Q?GsC2dv7agkYKpdTosjEsYXTW/34zZRJORVUeKnHClkdi+uwZ8AzSuPuz63e7?=
 =?us-ascii?Q?35/H/CRxh6+dseJi1b4o8rl1aEj0GlF/3QPVZJpmkSdaznl80bVC4Ap7tqjL?=
 =?us-ascii?Q?MxXOa8F9acQgnrREKoJIhQC8Wx5aUaZquGUD+lrgFXZf6M/ZPZL+p3RBEbNc?=
 =?us-ascii?Q?W4bAo1KwXGSYLpYoIpfZtD++MhvMSSqNEtqzaaEXA12UVC6xdUjk1DDTsgjq?=
 =?us-ascii?Q?2USGXGdJoBtUcCtbDZ4IlPACycz63dvV6kU8txtSLzV13PD4k3O0TpBYUgX3?=
 =?us-ascii?Q?bAvlLocfytUyj9ON8hjYTdfL/342PdmgfdvEo+tKCCxzaRQS1vozT8HRa6pC?=
 =?us-ascii?Q?Bch5P8G1cabZVeDkd1Plh9AtkGQU2nK9Dhh/1skkOgB083Ut+oGvWXbQb5+g?=
 =?us-ascii?Q?eajv/IIezF8df1R5sch9VlTtkU4RJCReNYi4S97gTxR8hEzGBFQuh8NtXXbM?=
 =?us-ascii?Q?CBAxNqnZoUGiA1e7WtnGogDsY85JcAiBjGfPREXZe/hiePJNNtqaknkDeer1?=
 =?us-ascii?Q?LHN8hZCuC6rlNwUUoYKL8Npjp+lk4NFTWnXuUCwrAm0Y/mjf3SyOa+6rjrxq?=
 =?us-ascii?Q?LjcvX6e2cRQmuhIrsU+Ipl3dKCmIu4kusKMRj9Wv1eAtzgCWbW4Zrw1M0hOC?=
 =?us-ascii?Q?HNCVafdleqxThlbGzmoYeaTp1lMadntOEF5N15fvxbrRWY43inTiPNoI9vef?=
 =?us-ascii?Q?SpT38JkwWj2CF9ERstA0lyshL9Nq1n1RDuoyj6dxHVK9LZco2DTQIAu/MPCO?=
 =?us-ascii?Q?FHA80ww2OdaSexQzno1vzaZSD0y0ttZ5KVX/tMRtIxF7mUQuiIe0+t5lmzNk?=
 =?us-ascii?Q?eidhQcUrf6/7jJySSPbWbZvhfGI/cpDoXX6KS+SK8VeQGggDClDJQPjDcsMT?=
 =?us-ascii?Q?neseBd1BBBekAboL/WdM6xzyyUtc0X2YuSGm7eUbfauMV5IMd3rJYMBl4rKB?=
 =?us-ascii?Q?tmUwqDWe8ELmGmy1NvwrYW5jn493H24Mrw8RdFOrghLjVCNrVHopHMB+ewWq?=
 =?us-ascii?Q?GF6Ty8nKYffAjX6LYgaM84alfqVg9vQ66FjoD0WfrJSUK7pB5R26Hk2VUECJ?=
 =?us-ascii?Q?GNMLQ6pUB9Df7cGL0F6OW4ddAxZRhr+HlHRAuWIcXCL2SurUVoA8OPHIgLWl?=
 =?us-ascii?Q?0ipXaFh8FmiXfzZB2oeyHZvIJDZLzgWiHpMjS+3sCBDVtVABdXfcDSWK3+UF?=
 =?us-ascii?Q?0TQTqVGr7Jc38DPK9z+Q1ayx8hyeWHbP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YbTBrmFnJcFWAJJXSEMoI2BAnI5L77wHfjdWLKIRQ0Q3hJn2IBnk+p3VjZlj?=
 =?us-ascii?Q?1hY/NSSGsqvGg0Xpu/kKlv7SVQHzJ7dx3Iw0Je2l22V/ve6hnDNp09niOyAQ?=
 =?us-ascii?Q?mxM26/cbRqCxfXBygtSLkkGEp7LwnfQwiAcpVbiY6hg/YTFbVHCNpi068lzw?=
 =?us-ascii?Q?QI85EOAFHOlyJxCH94014+o8h4IekXdy2CWroDhGR8AU8Hk/tsA1+X+NpzKD?=
 =?us-ascii?Q?TeyeAo36L5iZlrFZNyrU882/W/QqRC+eRCGeaw5+PxsEw096EMPIoE/TSraZ?=
 =?us-ascii?Q?lDCD4xbGUzQSdNUYPhQAGBEhzerWGr6ZhSglkkBY7Y1zBvfGV3HecxxHNZVw?=
 =?us-ascii?Q?5WRpd4WItGVAf+XgfPJo1RqRcfKTB4DG31wFmlfTM+tB95QOApLybAPMpoFr?=
 =?us-ascii?Q?H/+EXy/EGLwG3//EmUycIbns7iWaPE19haxnwngU3BdykjiSQWobinziYM7Z?=
 =?us-ascii?Q?i8BJQQcnyv0TW3ZSpq8+OruvS5VxlqG5bLU5msv9aOF49rV5qZgGOTKfOWxJ?=
 =?us-ascii?Q?KW2jKEGKZ8/w/n2t7TX7u1pPJ+/HGeGWMDIGJkafSN3NUWY2DEiuu/az9nWX?=
 =?us-ascii?Q?gh2+X8wNaQS0lPN3TA0KgI5ZL5zlkS6CGvuteFGWTb6mXT9V0PMtAcE0topv?=
 =?us-ascii?Q?6JO1WYSLCDtWpFMDFT8sxBX/pA9OXtH7eVDoZbNBJ7sV2lJr4JXg8t5bAH3C?=
 =?us-ascii?Q?vECUfCJQFu+Ro5bmvlNX5ltO6kWNTwy2eHlFW+F2/t3slQsNCKUb5uwKpVUz?=
 =?us-ascii?Q?Rg0P3wH4leOaBQICNuumkv+Wzh/A4/xWzQ12pa0nQ7hnW3MsOKAk+Gp/bUM/?=
 =?us-ascii?Q?WMozlvyu0iM85yjSnkWOVmuhAQfinaCk1KQ+Z6wcvusqTP0E0it6t5iWAzum?=
 =?us-ascii?Q?JvFJYXqgvx4VeQoU/0NJ9EOeb3iHQBwNPlNm5rk48aSQ/Owf151UY1hWdltl?=
 =?us-ascii?Q?PRCkTOU/cSRJMOs6m7WnywV+SYXiwDPEAuJivSnSIb6ddAn52ICiBJEHeCEq?=
 =?us-ascii?Q?rVP1LxswBeQrkYrasPAmmTdth9QOmZXLCMEZyTikoC2yurSptfVihngIaOWw?=
 =?us-ascii?Q?vITA1JDmpvyCwdGMWPa66snQ2kKAPRX04Yf5LWKjblKs8RFzbbWIloIhGezB?=
 =?us-ascii?Q?G7eb2aQimohppa+ai0BwB8AN1h4a85CZxq2PfxN8fI3NGI5+8qu4VXjpnYYI?=
 =?us-ascii?Q?62A/X3XFhnIMkQXiumORUZkmCkuC163WjdGCEV9DGv9cGQP8JbKuWYSQLLm/?=
 =?us-ascii?Q?e4hmyEcadWaePa9nXLWgAySXUE1g56Jx7/KbqYCorJrbPSncSpRRC+S29VA9?=
 =?us-ascii?Q?LDaFLoxeUT7EnF9R1yBCROghDA570d77KnaZ9bESmk8ThF7V9Z+zppfwJkbj?=
 =?us-ascii?Q?ASNuAmmbaxBpXbH4xX+Lquqv1IFBWEdcXZbMeyRSgA97poQyH5uwJ7syBHtb?=
 =?us-ascii?Q?S7IjvNnLYaE+INEeylLwWYWoRnyUFED9AuKr6O7qb4wpTiDwlk1KMDjR4gCh?=
 =?us-ascii?Q?UokblnMfZz3EvNJ2E+UtL6CRJ+rDvwXTlIoRvYexyai/RGHf9Kprxb1BV837?=
 =?us-ascii?Q?1MNLP/SIgENcJ5l/riWQTOXXqmmAKVi8M/XziKGX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dfd1dc-0141-4ead-b581-08dd61fed4c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 07:15:27.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNmOA4FfMUS5uobjJmzR82O8f7/yqq5qyNqzTmVv/26TWQh7JBarJ95GLNDMh+JliqrEuE1iuFXJ6LIdzot3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228

Add the minimal board dts support for i.MX943 EVK. Only the
console uart, SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 - v3 changes:
  - no

 - v2 changes:
  - newly added for board dts
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 196 +++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be6ef4c56fbf..b68067c97994 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -299,6 +299,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
new file mode 100644
index 000000000000..d4a204eaf5e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx943.dtsi"
+
+/ {
+	compatible = "fsl,imx943-evk", "fsl,imx94";
+	model = "NXP i.MX943 EVK board";
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
+			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <4>;
+	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,cd-gpio-wakeup-disable;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
-- 
2.34.1

