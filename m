Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F828314E
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 02:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877557; cv=fail; b=NJ3Dd7f0XcuxI+uFZzPhV15ni5b6AaPkFE2WrURCxOU4B8/LM4lqL8F9HWwDWBs/1IUte9FcoBcp0NggmL1PGzkuGkMRTOiX+ZCUB1ESMdEur/JDx8Xjhxd6lrscQwoAR1KSVAPx9VvygVmaee6U6rTO1GCtFTG2hLAZv2fZ9DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877557; c=relaxed/simple;
	bh=gyBccrcS5RR5MM9nLihPWODkPiyoeT6x6nbm/FC7NjI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W8usf08kdCZ4ohf/0ZkL9XDi64IA8oxnzOsrxaqoqySC27H9IkB/rgyvxdo2NmzVFzGGLEM71MlFmMI1k2F8z+ZvB02GeUn2+HnKX8dfiCSxk+6bUGZyFLnIF8yhJLqSJJ471FiBJgPuE+WI46P9lkooNKTrIPe9TzueW17ydy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nXa/c2GR; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nXa/c2GR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLtzMakpGmKnzpp3j3l0mjix3YRfJlQ4z5na2oAbEIJROQ2IvHChb0bjUagru7vEQWsEQVcZNMsRcy7V4nLUBbn23KIKee2DG1HFIK7qrkSGQqt0gaWyMIbbO2tZma2XvOc5+diSSqvWhexEbRLMJJZZRA5ignMKAqi+QAJS3n6QPwvdIyMwo7DOx0nYAw1Zgm3pYoQVWW99TbUf7Kxwenv4NVv1eipqet8XRxL2y90Y5PxOGBkPmSxEUcIuzwTuyIo4xXVzNfD/NvF87TYkhfRJESxpfA5/HVeEqtl4JPa2l5yJzlmr6QzHfzrr4fxLkThAJafwXMMJ6Vh3JxbMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6BM6EMISnblMbmUTPUOmtPuynSx6gQ//A/LkixN/zw=;
 b=vW34iVTFN3vOhxVS2+JES9CvvGSKISXiFZj7ZxdTaXlSdwvbVKIjb0T1hwlf3o43mLstn0SF8/x+AJVBT4IOApW6qiTHb1QvhHQic6DVxYnnUZo995QPH7XBZ+sMIeKAzmD+V8M3hUmJH+t2U45j7fYzhm2gUXbvJjPwZXjw11e+MaJNziTUZfttaI9k19XGKLcTdqj7K434+JuWHcgjvA9ykak7+8zfrLc+BdQvZ7UcGI14pSsADQvvxtpI9F677dqKDbgT4wXytyGFDks2XwVz0jU1mDfKdDtUQm8ndW7xUuNQyi3k6GqZGKH0+cTFRJ2t8v9U9s5nMCc3u3KT9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6BM6EMISnblMbmUTPUOmtPuynSx6gQ//A/LkixN/zw=;
 b=nXa/c2GRPknefAF7pFNLOw8oUTd5FvKYKKWY0kw5trLMTp6xOdZ00IFG5AVKmh3NMBjPG8tviVP0DEPgqnVDzc/Si+LBW654ed1O2pHnvRMx15zZ8fZG8Bj2Q/CdgCmy3cURxDjleAVdW3emfXxkFJLgfAOvYlylqzh8ejCI/wq0ARanHyB2AhHAWu8yJ4EPrQKZKHrOkRu79JbCz+iTZhx4KXVR60flQMxRouNrvjwf7yan/4HV996qz9/x2INAmcx0TIgvPIdifKX4lozbLzNLpKhaPE2cmSJ1qgu5HFo6hvyohBboTl26m5CrS09U0gp6vfSGRuPlPXMlwOE3AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6839.eurprd04.prod.outlook.com
 (2603:10a6:20b:103::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 02:52:32 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 02:52:32 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth
Date: Tue, 20 Jan 2026 10:52:05 +0800
Message-Id: <20260120025205.1485551-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM7PR04MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cba68dc-2d8e-41c8-a363-08de57cef548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzu5CcvaOGk2SAqOz2rvFJW3pKTybQ5sySMdmuUvT216yeChmhJ978ubvYjB?=
 =?us-ascii?Q?LzhL91DvDOQjA83jhXjuPvu1uSRoARb3xk3r1HhyB3HfFXbfkZrI/YJGElLt?=
 =?us-ascii?Q?dFW1Rft7880gxQAIK0t0vb6X5g94MS/sqaZEjLypvAEq1/FwrgefOFetAVje?=
 =?us-ascii?Q?Y2OwUhE/DQcDHF39eIp/TbIwhGML6TL5e/QjN92GLCLekN4pinY3NHEUde58?=
 =?us-ascii?Q?mJ+QYZesZraCFIhNJ4DrR50VRSfcafS9D5MYUKeVtcncb9OOJgvqoxKUJNVJ?=
 =?us-ascii?Q?g2KP5ASMOZ234Q0EmVcNHIWKr9Hgh9igD9jkqvqhoI9L9vpAfstlrBCIY4+j?=
 =?us-ascii?Q?a7VbRmInHu6dVJNEUf9aMJEBi2DxtfQN0WUxF8IZuRS0EC8pfc9XaJsJYOjI?=
 =?us-ascii?Q?K8Z2VtQXVn8Ruro4ffcfWBqOJEEhcFOw9MOP4pWKKqwzsKQGGPx4ELnoGYvU?=
 =?us-ascii?Q?VyiKymyII++qQUL/GMxFzURyoL1WxxHqvfcBvqQltM6BrhgnDA9941mOEGYb?=
 =?us-ascii?Q?+JAri/I3prv+89+5KPKu8qTrm7PiL5cSeBjS+c+NhgJoeKW9y7hLUYQDXdve?=
 =?us-ascii?Q?A4HHpw6FvXX1uaci6L0bE7+7xhtLWnLO86SBe/LvqgGfCwJ22a8TbPGXqLAT?=
 =?us-ascii?Q?/IemIAjN6G3LjQwLbe1LitvYLgoNkQjNxLQPAOhwwuvq7mOIUwypaG+PorFt?=
 =?us-ascii?Q?FpBUU37lDF57Zw1TzoXYjXMrKmL/xcs2OlaCxMY1o+YmU/1ap3KOO+0AYTlo?=
 =?us-ascii?Q?AtYhYeULTAyjt+ykAR7ZFvhRiMmmsXL4eNveXzDi+DrgH1Kf6FQY3LNJ7scF?=
 =?us-ascii?Q?9Eh/Dy5KxGeFze0zXd9kjb/vA1uvKWERAB6Z28TCPpLhptqHgdFx0R9VOMcA?=
 =?us-ascii?Q?IsvkrJ6gsyfkgIbTw3NOC0NIneo9gz9iIRWpPfhU4WPwzv5vVK7TrLUU6uFA?=
 =?us-ascii?Q?Zbjl8G5diLfS3P3dOtTWwYDuXIqKOpzYnLHsq2dJXxZe3kadanou1IVtnv4k?=
 =?us-ascii?Q?AmLhOBKtJf3YjpOInnc8R5lOjwPY5jUhTQLzcg0TVKCt6IhYjoD54MSpY/Bc?=
 =?us-ascii?Q?u+j83TxAFcIFJTIzE5dUYVpNxFWSQ1mC7/UtBfgo+AFAIhmU2s8MEZ+N3Zlh?=
 =?us-ascii?Q?rUOki5xoLxWyQM5Y7/7jsRAgIcjW8TJxEe5tM5/u4BvNzTcQTHHryHErskQr?=
 =?us-ascii?Q?G6p/2Zulp8I/SBuhIda2daqm9/9un8FNBo4kcH5sjl8LGMyMS6j/hN3Yg29S?=
 =?us-ascii?Q?hNQ36ufIsHcz2a0flxl4sKLXxLgQNj/h4t6yRDEThBC9cxU/OhEtWCP+Rsuv?=
 =?us-ascii?Q?ti7jmcayUH6wMUevwXXN5qvNEDLOrhTA+4lWuRlCEFhksRNRheAVTqinarFu?=
 =?us-ascii?Q?N5noDp749awmSc6m2syq+v2pDhUwo6NVfKDDfGG4lRloe6Mqiq9x8cI4XtuJ?=
 =?us-ascii?Q?VIXDSW8c8q6presHTLP3AxvTt4P28SuBHJvm20Pd3QiUTN3FSnEL75uN3X/e?=
 =?us-ascii?Q?OJ66yyyoBHk5q9VRDoRf69VZxps9OZHViPf6pUDrmx2ou9v7WVnffAbeRjNh?=
 =?us-ascii?Q?3pAE83sv9VigVPSlvlg94TkQK4jssbesbKz5HBTQlYBTvz5dwwbaKsBQCyjs?=
 =?us-ascii?Q?1cwRtVtKD7zee9EQ+yEFjrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T8Xn/C6Flia4fHVafdp13zpQygE2vG6yk1mPuy/yz8F/PWXqbgc8dEvrVH5S?=
 =?us-ascii?Q?nNvk/ymGzqwg/T+I9Jhoz5o7TYXGwSXyGEv7NMIg5LeCu6HIu+GQAQjoo5I1?=
 =?us-ascii?Q?iNgjxzooRhidCGm17Sn7OIQbqkQd02oRXVbVuufJlW4tNT3o0xx8WsLYGNYf?=
 =?us-ascii?Q?b/u6nngKF+sw+973d+iXVATBin9Gmmw+d13rHAsIioOGgdTpByADJZakq9NC?=
 =?us-ascii?Q?Tv3jpbhvkj+ZTgos9inXEMx9jJs6Grib2RpniR4euLaIg3QvLlDjZ5i2NVw7?=
 =?us-ascii?Q?STSInEHPGzjRdm/NwfcuNLMG12hLALUvLjc5Pvw7dky8cOSNKttSp7WLL+Ys?=
 =?us-ascii?Q?XYVcx+XhzAaBf++ZFGdEM39pDops44OZ4I1KZ5nMHXwboj3GlyVJWrFokbEQ?=
 =?us-ascii?Q?f0wq2lCifaBk9ILMAXQApYwX1LyJFWo98bBuMBUutbpaVWZfWT+K43iSYnSo?=
 =?us-ascii?Q?EfBeM9/xdIdXu/gty41tEUXrHRFbq7iwUXv4rjn/Mp7cCbSzaZDBZyZIdCLW?=
 =?us-ascii?Q?ok6BFx12CMFBB/85fyFXFMz/CoSDw5dRzVzyXpW31OdplLNOYaLf9w+9SoWh?=
 =?us-ascii?Q?2PHNp59rJlgmokYFntfqm0dYUZxnOR5gkZPthGmVAYEOYtziBAJ3NVPDgn88?=
 =?us-ascii?Q?FC44hRODRL2ZPOZYMmwvIjqi36EXjheH9r4dV2uzs2Zi57UVNNlMEP/1dUhg?=
 =?us-ascii?Q?t3SNUg3Ez+cD0kIsookC8bw7vaCOMmO3Nyi+it92wz6b4He/DdJ10L99ApKE?=
 =?us-ascii?Q?TnmbW/zgGPzAkp+wPijGBrtPyAZJVjHcxqPQgYcgFL0PsUqhoKs283Ro8Qvv?=
 =?us-ascii?Q?k1cAgGJzaGg7w8vGlVc6BBD2+YFLnW1OrGnouO/vwVPCjwfTpZQMThVeWTxg?=
 =?us-ascii?Q?N7jpLboal4f1m/NKLXYT/QurH+5me3hJWK0+itd5JoCurXKlV/XGEVTQMsfC?=
 =?us-ascii?Q?czRWXtVYzgtIJSiUBimIivuuxIP2CmHvm2xH0GNXpzhR3tqM1WfPg2ol71zb?=
 =?us-ascii?Q?ynX56RUX4wHx6Jx77wO0j+BQRUqv2BrK2vOub4Uxp4sI5PyAxcL4ORfz2rgE?=
 =?us-ascii?Q?EmhmY98jGUxWKhbpMR4Vpz2KkmlGccUhIejWWSZ3YcEz9wWJRa31VvSvTHFc?=
 =?us-ascii?Q?qbmVTGpNKitePZ+lvO1VZDq3W5kqOz1BpcHyrMaWchlNU4+Fs83vXH+5EN6m?=
 =?us-ascii?Q?oAGO6+qaBq/ATfJIuyovlMTZee988vbYetEvzfnbDDe+EHRgH6A2Z71lNAU0?=
 =?us-ascii?Q?ilCzjEZ/ixH4z9uYUpNu26h5soniEuxro72z4ylCe4dSozcIFcR/r2TXOx2O?=
 =?us-ascii?Q?yNv3/lJGKlFHBW9MOauJIlafdhFsNzclEHJnNAbKfCIZX9mgdsp/wpV1oZuv?=
 =?us-ascii?Q?e/8MuHp6MsYjY74QD71fVmat9xZqcwaQC+qJqt6frJirv+0BR6zyqwp/R3gg?=
 =?us-ascii?Q?w9m7Xuot5FwkUpbwKmTfGUmXP7VJCoKLKMhTu00eAWD/xZ/enuk9FgKHpUhV?=
 =?us-ascii?Q?0/ctYuKcEbvbyordTLiomRoo10KYAKlNdz30+sBt2TWYmc8RmC+pg6HJ9bKN?=
 =?us-ascii?Q?K/y+ZvGFHHCuS+oXCiHvMkKRKVrP0tHo2JNGydFWBbP8vV+KhaKQnoquDtH8?=
 =?us-ascii?Q?CWVoiis9VFiFz6nRrUibNP4RnMLwi8vyvMcybX9u3eOtW89XYqREb1TpCcnY?=
 =?us-ascii?Q?TjCViQjnuVt9FHduhEAdDYL/r0nNW1SnwC8dPba78QkwK4Sc/UiSszxUFYcw?=
 =?us-ascii?Q?aPSUg5QD8Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cba68dc-2d8e-41c8-a363-08de57cef548
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 02:52:32.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDqZ59mqQEtCuiwp3qPkxcANlBfesHnna6PU/rLSwfChfzaWeoC06PUcIdMpP34xFT9ByZqwvjAokuJ2JDPTKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6839

Enable lpuart5 for Bluetooth support.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index 61843b2c1b1b..ec78c03f4788 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -25,6 +25,7 @@ aliases {
 		mmc1 = &usdhc2;
 		rtc0 = &bbnsm_rtc;
 		serial0 = &lpuart1;
+		serial4 = &lpuart5;
 	};
 
 	bt_sco_codec: bt-sco-codec {
@@ -400,6 +401,17 @@ &lpuart1 { /* console */
 	status = "okay";
 };
 
+&lpuart5 {
+	/* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &mu1 {
 	status = "okay";
 };
-- 
2.37.1

