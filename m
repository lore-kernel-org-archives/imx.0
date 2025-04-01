Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFB1E9B1B
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491782; cv=fail; b=KeYKADQpbPR51vUc50poPhnxn4eSVkpo5JsiBj4FSdaHxSarxHEabZUva8eJ385z4hQV90ScfVlOn47KRfFXvXLPfAsHzZY2tEaGNOPGS2fuhvPo/rn3GeDxu+fBmbaIyvtLTCUlpExBMsfGUWkNW6eKhS4SzSkUTMziyR1ui+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491782; c=relaxed/simple;
	bh=5CIqOAKKRIdZ3sfXYtH3xXTMM/SWGrPCcEjTLTsLA2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H0b/fyu+Fck3oVzl0Mrf+BYOSs4hLHArz5p28WH2exG9sodjWO1pNs8ng5Cz4ETEzuNBXdehpXHNNoPs1OTHBiAU7IVd44wINZhSA0AKZtwxblpvKEpLiCgKV9cnpEMeK84NYAQJkrxPvmS+w7QLl1+6Buk/3vahkr86OMytn3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SjQl6Jm/; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SjQl6Jm/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diMqCHY/jJXn0HvlBQ/NuIJd+25FIcPRUpKLsyPdLg/uXEuzGeP/whZNwe4ehEyGkRcehxp4rdhhj/KithCoeLIsOzjCamLzLd2zAata33k0zMeFPTcGW4w1Ce5p78CNjMhYfu1mHMtDzmfArsfXm/b3VEbFbtaY+e2SCc2NFQa3iajo91Vmwqx0wDf0tgeT7H7Prvbcs6oTSzlLRfpfJuzGXMKmOevBjI3HgZEGcx27CY/7Lo98tg5YcJZkQ9s/LAwxWSwn/YauZUpyTgIH48r/0em9apJ/kKeLJ6e/T8etP2DYV+DkUGNk2GOU6RVVmfx2FL0ispC4wsachii5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+37A9U4w28HJMNA3hN6T2w2i/R2y38mpqTlYWJC3Lo=;
 b=R1wEK1zRylRsu7dWSJyEkLr2jj//blHaJlKxaJ/vVUvzFH0pRTJoyHIHC07yXEOwjJVNPLdqH0gTPVYuNFdUuFbMd8AxfMQ1U7Z3t13mzn6XkEOGuhrMUHB0Du+BwFuC22QfOzAig5QO4gXzpV7CM61tDSY5TE/feKaXCxDU8x7nEc/5QuMWbLy+D+FMoz58f5xDAzHbXcs9z9/G7waH9mz+XlysYvUC6HvV4TNtBVJ4ESswiQbVWt4F4rlcrYKqWwNCxl9sCZIEA6yJrf9kIPn7oZVDiU2f00I7jBt8iww326Y0cJ1gAN5CJACLC6uqPh4XpfJZkz2yaiTU7G5xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+37A9U4w28HJMNA3hN6T2w2i/R2y38mpqTlYWJC3Lo=;
 b=SjQl6Jm/2b1MawRnqSbtg2z4WFCiJ8/RqTj04vqB/AOb/wwFGCqOz6VsV96rOcxYtNKO+W7j7rVnglkDqdtNNkj48ym3sZENF9abf2di75I/lx0dtkY4SAvBMXowOeb8lJpthxZHDgdhVNLKAVKigTkpgjBbDpqIIdF9r087Ws4Kmw9e7JTvbGZnDTU2iEY9ICyT5SMnRmLBZ2zeMh9i7UXAwygwR7+HIb7p5rfESeiP2pqoFpAfUPyP41H02Stg69wqZ3RmJBvv++6l9jnFO0R44BndfE7fmCpCtt6adSc2HlQQqXc6BBD/GMix4t7WSFZQDre3Jq1yCPPGSwTsOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:16:14 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 07:16:14 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH v4 3/3] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Tue,  1 Apr 2025 15:17:09 +0800
Message-Id: <20250401071709.1138872-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401071709.1138872-1-ping.bai@nxp.com>
References: <20250401071709.1138872-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b970b4-4dba-4f2a-bc4c-08dd70ed1657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?leoohVWNWj9x/jC1xzrDBBOSdU4O0Ji6XvRXq/BxqGp35gxmpga0Sdl7WZPV?=
 =?us-ascii?Q?6Bv44nmGxMW6U3CCFe5QG974LD22cmBNf0pFjybIKMxIBHLKAGhaRf2yiBhb?=
 =?us-ascii?Q?+c8ALKLbNmbT7ASlq15QOiNWVwbgrZ61Hn2ZmC4BiSiOWIixoenSS9iLS8a7?=
 =?us-ascii?Q?vDMDoTE5n1w9gUfcgKWSs6X6gMsiB/bFjIXb11/dYvYB9dOkaokMYOLIoZjY?=
 =?us-ascii?Q?Y0MaquvEoy/cxWSN6iLjDPwKloQGEAw2Cl33Hiq2F7/k1CB3Onc7xREeDhWi?=
 =?us-ascii?Q?i4veuYhUZcqzduKW04rq9YiVTwt16mAXLQDKZ057PZzmVLyAydzyDXJhzX/P?=
 =?us-ascii?Q?EquOv2FC/eNlNvKCcSUP8CC2uTjU+onjAleKk67dPyThTAyyJ/i4LS2SLG9X?=
 =?us-ascii?Q?dAp5M7eTFKa3DxaJGT8upRPfz7m5PJwv71tXAzmCpalwFvH5UgqBKvoOYK6f?=
 =?us-ascii?Q?UiZewLNjMidPnKBnCIKEtwjlHLPYUVdFtDjZJcrP77zx0xArmUx1oMD2a/p+?=
 =?us-ascii?Q?qlhHyu1/i2SiPgOfgXDTC9bplLHRN92uiyD11MCuWnX1W8zdbplqtrPZhXS5?=
 =?us-ascii?Q?qdmw8SM/Zk3J9yU6rU2GE3vw2IQN4zCABlDPaHlNmPMmC/rdyDvAA+m66n2v?=
 =?us-ascii?Q?rfKtnyzsHfExfL2TtOVb4X5pZ4/LecLxKzcDycC/a8s1W3hwaSutK0Wq0+qK?=
 =?us-ascii?Q?4kT1X6Bz5TZyceTOBBUANjmtjGHd9izEzOsFkkT4v6q6Yj0niTrl58O5aH9E?=
 =?us-ascii?Q?5L1dBh6r1Tc6BMubawyuUgvfGQLHSJ5594cgbS2VQYDL57PEbMO4IlX6ZNdk?=
 =?us-ascii?Q?9/VkGTC1fbxO0ZTTsErTNUWUm+DvHmuTpj3VUSj86c6sD8RzdNzXn59DYTb8?=
 =?us-ascii?Q?/Nhgv7W1yr+uhIkkMim6z5yzm65skqa+ikpKTVLquPir6mPDVaJwZRUGh7Na?=
 =?us-ascii?Q?tdbOZCi7vvz2JF/q4NzBpJDJWW5SiZVpxlUYhEDHEJMryESiTtvUYi/H9sC2?=
 =?us-ascii?Q?HthjLRDNJhNO0OxKRr/uPW+zZxzb7j45MxoA1oEf1ipLVKkLYSs9osi17Qqd?=
 =?us-ascii?Q?KQPCDYGlZcYCLCAbSZPHK/kmrdrEr2pxHUykLOb5PW53qnayDcVJfVvOmyfG?=
 =?us-ascii?Q?BiOhLpjSxdFiJ+EPmhsLWgbtZQ+3zerT1hWDOgu6ewMj4uLA4u39jVWbFHW7?=
 =?us-ascii?Q?CV2XjK/BNJDeNV40oVx4ipbUSbhOFUZpxBI3RaFHgTY1doOubYaOvdV5FJqv?=
 =?us-ascii?Q?I2kch0HLPSGP8IuBC49w7Uk4eO9/4CaBaeSsMHOBpddwZctyCHS+3LlhXy9k?=
 =?us-ascii?Q?RWz2SvruW5rgnGAyYwobj+8tTTBxtmwcfyy49JOBUmM3C8RRbg7fgLqLrAjK?=
 =?us-ascii?Q?hQ9tRjbjMz1IZsXVysDjbOCyzmYrEUerXNWhtG3FQp4YNmA7bmyHzBpIFiOA?=
 =?us-ascii?Q?BEd7r3yTmV1TBx200TStkB1PF5wJQPQZQCNAQ8QBhQXredelVecYXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7K+Q1+kcsegBByYztHw6Sh+Zk+cjAP6rUnIjvlwW/+RGG6lOD0crfn9cSJkX?=
 =?us-ascii?Q?Mh9dvxDy+35jEeawQFP+9xpM90dsqneLMzWI3vI1GM01bTvETDKWvA+rJfo/?=
 =?us-ascii?Q?AwmooXcEX9cpTGfTo7R7gr9OFoDNN/xa1kPfC2JlCl2aqM+i6Snm7VGDGDF2?=
 =?us-ascii?Q?/WpHTwy4UgxyP5Y66FqKKLVDQ1dseoSiLtmlz/g7dL93azA3PFeY6FerNBO3?=
 =?us-ascii?Q?4Q+r9zvrzf86/zi1F+bT3Yk5AdT+Il6ZufcsWwYqJZUO+K8+ANJvTIzUa6MA?=
 =?us-ascii?Q?FuNHZSfoQXi8d9ED1L2c5QtQd4RjTdYnMptlBgmwAmbKUT56+aHRMhzL6tPq?=
 =?us-ascii?Q?lBL8Wi25lLplblRIU6oFAbScaANOMJ+Eoq0AUqTWx3hLwCA/7jhuLqkMYV7N?=
 =?us-ascii?Q?AZaV1FJ6tHLM3hP+wAiSfKK7TWqEG5WPpHsEPPDTOjKUu/XzPW5N4zWIDbBT?=
 =?us-ascii?Q?ooI+CiQPh+GzGeOL3qWLxHI8Z7KOjilUkKbUKhlqT36cAUxNp37wWkiq3jWM?=
 =?us-ascii?Q?KNuHUNz3Mdy6l6Bq7BcgnO6yCSWk7cz3MQISLbpvoM7sqm/ajaeyRh4Bc505?=
 =?us-ascii?Q?O+WgjS7owFRjwcrGzMATB7Vz4kTmQpW/JiNQdE4VrvV5WMLKQbbO1hoHj9Xu?=
 =?us-ascii?Q?TjN8Rmazd8NRhERjW3btAQ57dgUiobT4mxzzezhGLLf8NS/rpoKlYwTXkZjn?=
 =?us-ascii?Q?R1JsliGGtHMy2RdLeoOdKzX6UsyRFvQxubWWgQRDLvFNReK4/+2PMIh1ROsJ?=
 =?us-ascii?Q?u9MZ+DezwKWg+eYlOWuEPtcsBmvLRp6RjxoJ38eGccCYXgeG2YKtaspjysF8?=
 =?us-ascii?Q?TxZtb7XorHlxTUQL+6YGPC1xNGTRd+dwPBfmDEnXYYIw2ld5S8TKrV8ErMJu?=
 =?us-ascii?Q?p5pyWiQnqNM1p39eZ5sCYQ+eDAUYHdJne9l5flg9M2qgWBa/CMb9G54cmoBw?=
 =?us-ascii?Q?iAt/GwvfkCaZVLgTMflZ36sqCmf7+hpuy7jUirlXilhLYCtaRo94jXy3izth?=
 =?us-ascii?Q?kfL1RYaIxO7SgQgc19+VLWLY0w8a2Re1onPw9RGwxMdV6/m+0z3cXdv7GgQY?=
 =?us-ascii?Q?pAbWd4+IMDtpA9KbJ86sI/psbqDMEy9lPU+IT0YyBzQEd6svb4UPYilO9eqA?=
 =?us-ascii?Q?qh1CbDJoakeNM8EjOv/a+Keb96dtlES8oZpJmYtNEH/vsTIVk16Ir9rXIlc0?=
 =?us-ascii?Q?V/e0+babyCwVhfNIJuulHtlTg/jGLBVSatSDm/t8rCbiS6ENTliLeTWofKE+?=
 =?us-ascii?Q?jyZbS3KhfS8Al3euF5RAjVCdXqXkh+YXz7dDLwhtz6yvOIgFEjXnE/T1Zw7C?=
 =?us-ascii?Q?zEQiKkQKws/WpbDBxdybzuUfcWVJ5onTJ6G0ohnZs+q3/nn2UIxpVQNJp6we?=
 =?us-ascii?Q?CDcshrJTvDFE9gYFS1AMjvAMPjHPMvQ9KH6ezhmaVsa4snxa4zil30Oogj/m?=
 =?us-ascii?Q?JpM05WZKzCEwUfXSnRYseCROOnBQYggM+JDa2fKp2mhC1pTL5hSeDH1OkPW4?=
 =?us-ascii?Q?zt04KNZBQh3lAQTHqHMdV18im8NGsL9aXWLoMRdEQrlh8X6xsOXhOyy3lcLf?=
 =?us-ascii?Q?v7xi6LBrZ4ImuQH07S0Q/eFx9JGZ3DmzA299DZl4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b970b4-4dba-4f2a-bc4c-08dd70ed1657
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:16:14.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vD8ZAyhb2siqah7DkIHUJeWfsVXAF3kVM3r/O9EijXTHXZRtxUmnMm38DkSOWHaV/zoDt0zY4VjnHG7+rp7MSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611

Add the minimal board dts support for i.MX943 EVK. Only the
console uart, SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 - v4 changes:
  - no

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
index b6d3fe26d621..2fe86fc6d73a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
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

