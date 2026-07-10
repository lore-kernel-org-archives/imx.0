Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0E31F9B1
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 02:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651352; cv=fail; b=bsXiZGM5CZEVRPSYq6QbKTZed2IN7kRHkiNUbmLsux43hpXbmA+oaIqY1GOPSMVQVYuJ80+tyq5Icsr336VMWkB/JYfUGCnsbB520kydEDpOMvzuaYY3ZO+EY45PZZjTMTtalpEXzwEMyLubeVGO9/f/t8JHyBXEFXJM2O1myF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651352; c=relaxed/simple;
	bh=fJwYbiKqXTxwRnoAPDsGqfCLlSTp0rovG7+brvEiCdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2pX40jN0RgHWatJNeAvhhE/RuZt/8ZmEwrEqWUoCtcuoRUxvCudbgR6vNeu67iEu4r0LpLBRIsJrBdbxksPlSM5TwJksthaGSNaGnZL9r+VBwNLZHIoL3x1cZ8nldhtCKZfSAAxu0QG6tdsYYuPSjjoUE1TNJZonnim0t4eYYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fOxbkDTi; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fOxbkDTi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl0zzX0tsdKtzxBOctPUnoSpsfkguYYjSM0ggiOFrLmxHLeZvxBdgzf9FwarFP4abbGzmcIUzuRnrUg+uppgczbJvZYpdZrZBCm8hUHz8eAbOANoMQgmqejDp+UUA5suNKJcLF4CM0V5jM2wcTDpNOJO2M/PZMVpeGV+lyHuNgznbb+PnojpO7gNfNWe4Be3LItrict387ZSETnyTcDI9N+A3v9/XrnByQiLDLgf754KeejLgl3KVyJ80n/umDNxkBUt3oUSoFTMWWeIrP7C3chF9wRe37mfoDf+OOZZHjt8IL8oMiJY8GAL8FDxNyE6rrQv8/gPLY14xHq7mnwX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uekkxaoe7SWqYS3XxYP+QjCNwsIusdlwW2FXMhdxKsU=;
 b=KXhvsK9EAZbL/ptuyeCJ0Hdz+cRW5l+n9MbCmb1ec1QKNamWUldu0gYIsazZfq/8HcQynriNpQedFDi3lVnFpx+oXjhCymeBDumHMP+6/yZXKxOmYB2ec+SK3a6nGLWFUO4qoC99h93VVgE5su+ZZgVVBPp1IQDJot/VzQ3IzYx2WCVoDYZIYvGOyXOZglsU3oaqQd/43OOMt4RzhgLa1Noy7cV5pmDu+6ba/uo5lMLUVP75lnQzQZIsSZd1Mk8kugHfQ/p5ivCKVybhRA1VW4zbHd5s761QEM9y2luAxTDvrNIXtWaV9pJhAbrpnJkglaWZexWadOPVC/9OwMmPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uekkxaoe7SWqYS3XxYP+QjCNwsIusdlwW2FXMhdxKsU=;
 b=fOxbkDTieExHjY6DGEInc4AGbqUIkb9LYmv/ngRvhEqh2+At1hP2Kpzm3vyvn4KlyoMjrF3A3UaxJGGJsYo2eB6GHplX+0j4wtyedGBV17HFLPjPiJ7qsJ1EYeKpzlKiS3baBWZW70E9KS2WX4qXzQ4Odwoxf2+XhV8k643RutQAXrkPDKW8YlkPMWsxwGEkHZnPn3Q8LAUGwVrF4vaCCQVZqRMsOdXC4dGCQEmsmJ2LxjP+A/ZPfY+z5K0Xb3vth+mIyZKlWNid9swRSUQL/xoskvg+XMxjiZLZS9dVxxy/URPhxojuVITJwprTj00UGDThVsh0dy0vSelrhiK+3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM8PR04MB7841.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 02:42:27 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 02:42:27 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
Date: Fri, 10 Jul 2026 11:42:03 +0900
Message-ID: <20260710024204.3462444-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
References: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0028.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6060a351-ec23-42ea-6965-08dede2ce10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	cWaGyPQFUujDJ0NzaK3xwiEQbjEZRMXiTxT8pNlpi4sZT+TQlnFIbrt2YLCHs15EZKXASK+DBbejWozf8fMNO8MdwAde5bL9kPNR14a5iXLnoBuWBaVfhkArYX2JECYp8Ia9vFXq4xrdO5wcojwzosO0R5dcuC+AYBoSF9ykGXY1T6t5HO3P0+HOn4FAJiji3iGEG+9R8dpYNstzH07D7J+Wi9b08n3lQ7Q4R/LeHR8ZEQfBoK7g+85VrDo5N1JljTFLyaFPBf8eflyZrc/8YyusJ2jGMy+q9zTO4mp2/4e/jPlKaWZ9b1eYrD/u/8cz/aYuEM2bYZoH4zDmX0ebIODOpR63PcyqSej2kawxqIWabBoEyQ6BG1WZ8UDeZvYNK+eDnEZJYW08el+WP8Pps6Oy9Z0h+FzdDx1ct8lbAeLQTFt3dUOflkJfi5PY1ULeQGKrVYZZfRH9UsLtmJPlgUHTqkAL155t8JcQA9oQ3u0QCWim5nHcvlwPRdbEbn16js891t2ZQbgO9GIqBbIX8s8qnRYkU23diIgE6rZy2dhAsV4rn9AJLNeFASzKyNHiEvG4POYJnwvyysf5zcZxFtvfcs8cWnLIjVPIrwwOc8fHR6fUtNb387fhR/P+lhdRdiJjrKnuMsNk/Y+96It48Wfjsmu5bHsgeuUAWpLyAcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgT3YXEurV+nO/1aEw0Q9V7TFaNQ5SQ8Q3mcV1yrgd6JDFIRlZ8Im3PmbQ+Z?=
 =?us-ascii?Q?/ZDchFxAAJBNLwuAJ7K3KgncmmkXuO0aQUoOVI+/sQVZ/c+N0V+2N+EyvVKk?=
 =?us-ascii?Q?rfRkXHC4T7kZJU6v/lkpqpH5RPDrbSkz9+G79FzBmtG4egey8eAUHitASqQV?=
 =?us-ascii?Q?FAk+y/L7MHd+U5NRMtk2Jx+ulzRxSpbB/Ze/N11gN1i8t0D2miy+s8lCRKh7?=
 =?us-ascii?Q?N4nUPGhgM4eqPkxJWWrQoxQGrpm7R9/ytrMrCU2yiAMC532YQwg8O4t9hdvf?=
 =?us-ascii?Q?10xitgskP0cL+yf3GGpAtD2Mbjf5rHZiEudvmgyBvWX/UGsvODA3X5JavipI?=
 =?us-ascii?Q?oK91tlHqadGmgWF1mAD87aW9ejCpkjoel0eNKlIRckyzOabQlmzhsQWFpndz?=
 =?us-ascii?Q?xR+ahkFmNK8sHqJhn0MW34mXbDSe+wxkIcE5Ksjil4NVq9mXlSCrBfQmmZsr?=
 =?us-ascii?Q?U2LQTLPF8+NgTiqUYCApkNEvN/jnLGP4x2+qORUwp5eKi24+8u3yevrQrB7Z?=
 =?us-ascii?Q?NbE5CYGptCbnTJ/fjjqy3ukIluY624YeOMJvg+Pkfn/K0aTr5f/I8A++nl8v?=
 =?us-ascii?Q?KPZvSW1jwSC/Iau7LcSS7zAPH2LWOd9Z2xqz/oe479B9gOeEpBuFDFbZKsHr?=
 =?us-ascii?Q?N5FwbWnalYsYXgVS0vCJha0QexEcVITdBnPcyhWbkkQriwbWWg0k4LxQNpfZ?=
 =?us-ascii?Q?56eO/DgAczbxFXSiSAI8eUnBJ4M8Ig9xhiLdKrfII3ln5I+akryGsGFqEdCi?=
 =?us-ascii?Q?AgWmjuYRbWi/722aUT3LgKCbuDDjcuYWTVID/EIA/eoGQM9uM4ockOww5IZ3?=
 =?us-ascii?Q?uj6LewgHVD9KLyb9VAbIFmwYSgYFI3J104bsbbed99sffSeaj0Yv0e45YPyl?=
 =?us-ascii?Q?vheF4m5n7V1RHEjhUKOvAYvF3EE5/Ow8XypfegydoaBDw9uqjvX7bgzS6ZKB?=
 =?us-ascii?Q?+ndkL3axAXgUaik1UvNEaoku/hTsKdFeNdNHWB/cN67iV4TiYe7IX6K9cHxZ?=
 =?us-ascii?Q?C4sVvURBqZYyWMcOfTXcxYx4TWz9jvZbrlVqHP0rtqW+Pw/YtGZqLo9fVCSQ?=
 =?us-ascii?Q?83MtSeoGjEBLQ0bVRErtxaVXBd99FRQAoCAJBekgiq42Ip8TtY6R4fzCXHpF?=
 =?us-ascii?Q?uEDRjoNcBr6wAcn+BO8/XIAHCwBdkDilYRMf8CnzTjnh6i+FP58baYNV8S1a?=
 =?us-ascii?Q?usq6yIN8PuBLtKtmwTwHwD9fT0j9oxJpjUc0nx5Qv8SV0KcMVPTNoV5pEbCu?=
 =?us-ascii?Q?c8l71LFPOw7n9X2aKbA/W+fLvBaUhj6l9thAJZLpGafwzIhvb9LKfdSe2Cv7?=
 =?us-ascii?Q?FOVk2ZcjrjpolGzo3zAoZKC/7x+k9EqjxrzXRZSQ+4VKtieK6G5oDbtrBqVU?=
 =?us-ascii?Q?rHRRmtTxwF0112ZK1OqgjNWrzASLQf14rlWIXtZTHaSkhFlnJUi1hQi0zGE0?=
 =?us-ascii?Q?b/siKy0QTuqYBkFTv5rl4bKNheIMXA8IrR/eX338r4rGuhqyVVTb15fQ3qN7?=
 =?us-ascii?Q?oo7gFj3k0BZyrujfE4s2aZnEH1QhLsOedHUitmXEnZ20v9yIHnxuOudj9osn?=
 =?us-ascii?Q?XHXBk20syZtzvBmjrjfRWV3lOT7geLkfcHe3DR/nYZnX7BJnqnzIQsPJFRqR?=
 =?us-ascii?Q?NTbU/VrXzElHkf+JVaTCh7JzOICg3P4mLqjAsgv6SIY2iHJ3yeRhgqm36+dT?=
 =?us-ascii?Q?/H3dkCt5bsWBPOJP2hkiXwVlDjCPqZKXgiqit+iSp3GVxwDA10jF1xFENT/0?=
 =?us-ascii?Q?KdQXH0A4jB9jS8ozGoiT8a6feH37P08ViYmqxd1gGNsisMPPmNy+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6060a351-ec23-42ea-6965-08dede2ce10e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 02:42:27.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgDkCWU75AExe2m3EkUuz3IBuVOqCzDtmp6mz+lMUvcpBVe/XXKy9jFt1zO11n1LqzMi6yrvNA2p9+7EfbsrYk/cIy3sGgtALBXRr44SetMZTcHRHtVKNb0VUwLOzTT7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

From: Chancel Liu <chancel.liu@nxp.com>

Add WM8524 sound card support which connects to SAI1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 4821ac312ab2..e5983bb083ea 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -110,6 +110,28 @@ linux,cma {
 			linux,cma-default;
 		};
 	};
+
+	sound-wm8524 {
+		compatible = "audio-graph-card2";
+		label = "wm8524-audio";
+		links = <&sai1_port1>;
+		widgets = "Line", "Line Out Jack";
+		routing =
+			"Line Out Jack", "LINEVOUTL",
+			"Line Out Jack", "LINEVOUTR";
+	};
+
+	wm8524: audio-codec {
+		compatible = "wlf,wm8524";
+		#sound-dai-cells = <0>;
+		wlf,mute-gpios = <&pcal6524 2 GPIO_ACTIVE_LOW>;
+
+		port {
+			codec_ep: endpoint {
+				remote-endpoint = <&sai1_ep1>;
+			};
+		};
+	};
 };
 
 &adc1 {
@@ -186,6 +208,15 @@ MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_MCLK				0x31e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
@@ -433,6 +464,42 @@ &lpuart1 {
 	status = "okay";
 };
 
+&sai1 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>, <&sai1_fun>, <&sai1_enable>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <24576000>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			playback-only;
+
+			sai1_ep1: endpoint {
+				dai-format = "i2s";
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				bitclock-master;
+				frame-master;
+				mclk-fs = <256>;
+				system-clock-direction-out;
+				remote-endpoint = <&codec_ep>;
+			};
+		};
+	};
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
-- 
2.50.1

