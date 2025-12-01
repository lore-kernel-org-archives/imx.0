Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D039028A3F8
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764572430; cv=fail; b=cbNXTDYQJgDGe//4QRBs0n5Qjeq1fbJnRgKLIer+HUyPlPk4xdemAF9jMY0SDY4ZP+au5iLgkR/olgZy6CK7VFBW0fpbk12Z7N9QiHSPNsgWwqyxX5gDzvXkHwmJr9pPYXcNkyMStsZNrHp8GV9uopkHKJMTHkZX1+9JvLKStRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764572430; c=relaxed/simple;
	bh=tXkG7/0mz9ZqkYrx5ZAK9AtY+KhaX4cSWOvi2y/gi9I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z7MRYZiMyg4DDWsOKZfjzpymaipWcE1blpLE3jV9mdB8OriUIHgjwvsS727kn2UGMdDQgTD95zANGAsG/by7rjZLXS1P07cUie7GxGnoFhIDKRNgEpy+/5jhoSYXAVBSQx/ok9APqn0JnRjcjCQtY3sjeIHE5323IfZQFT05VCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CjWyzfza; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CjWyzfza"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EifPBNtFG1RfVLG2ResE/D6eAtHn2CBJgyARgA1vfduJpAEG1TQsSc3rI7tJ6legU2sSQnCThEOfaWwesLdKgBcqgMht0j+XUVlzU5t7uoNNLaFvs3ZbJ1kL34RD7pQROt0LYVyIRSSTWx+Odqhdwg3bKUjRo0rWl2o4I1w/TF+d+8Ai3hPmjEwEDnUcdcBJ3CnQTJWbW2r/A3PBunREz7M6D9pMgMljx43kK8vDUrtQsPciwQ81ytVfKBYGNqFmnZ02O4HXZxbjTZJiqznFrEgS2L44HwiM2ZXmEnUFv7P/GP00M+07Y4PCh0C9E6iSY771fRbqvD+eyKx3DFjUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pFhxMwGFtRb52kykiooM95QaP9tvDxe0pq6YjC4G5g=;
 b=qv3OHYBP6mnX1dTXSIPi1gj3d6uSaXqV/v4sv6Ou8IvXp1CHV/qTozuD6DWPzXtOXyidLm1hDhWhydnZuu9a49v3u2MaAgAYiNyxPSsz8KoPDKKHF432M939/ySdRC2XEbXoC4CgTCq568FXLbVvb6+xntJHzzoKs2ErBevkot2JakM+NKzGMF67zt/HUF6GlnGbm6QqwilyUQFUNC207vqYDIVXMmWjNLM4GgpUGan1TA0h0u1EvYPbMmidgmb2lakFqXKl14IsZ1QN9ngQ5HcNp6cLKTozTLvLiqDmCwGro993xDKZdPS1lJgMrTPFvA2iDvNaP8Jb6ojz5G1NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pFhxMwGFtRb52kykiooM95QaP9tvDxe0pq6YjC4G5g=;
 b=CjWyzfzaan/ecSiLjWhgBqWb3K6pPMVrxZimqzI1x2GhtvTEULVEkIMYoXMSClVENMQvr1FFo2XpSaL0SseJcqX54DP0g3Y1z7238RnVFIY6gDA6JqQ4N5dqvq7W/JKbIKDtI3mcUNU1R3+xmiRUo02YSdrIS+hzkFLa+MtsViC/JMVZ/SlubPiylUdAXwmTdS553nb3+FLpZL3WzjkcqeFb2ZCKRKXMNDo1dCLJxDk8QEItLdqRZ0JqLp+D8BEuZ7a/VsTYd07+cwe2o6EWfnhfAFMmw1t4niDuHAkcV47W3f3ew4JWNTriVVlB1/2Px4ZkX9ialleZPsBErrviBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 07:00:27 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 07:00:27 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx93-14x14-evk: Add audio XCVR sound card
Date: Mon,  1 Dec 2025 15:58:44 +0900
Message-ID: <20251201065844.3823323-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201065844.3823323-1-chancel.liu@nxp.com>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8f7fb8-709c-4b93-d57e-08de30a74ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gSiIZwOLnCKlV7nyBWjXfXlriRNPtgkNyOZTnA3cUEzVbnq3B7qHWxvw5WVJ?=
 =?us-ascii?Q?Ij063zG/I5olcqoO9kEWOWAjnIFTegPyj5PPiBEI97wjRbv3s2YXsO58vUAg?=
 =?us-ascii?Q?/AUif4NP80kZPmOiFJswLSL1YGEwgA/qZdddJkOVfLbw9CCLbZ2yBzWyrFUo?=
 =?us-ascii?Q?xCLVVJ/peo3h+A/D8+AyXfAOrW7Ygd/A24i9sH8J67Q7SSWu2JTV3XyuC4V3?=
 =?us-ascii?Q?rVzOKQq0Y8KNT54OHRE7+0Pkwy86H6VHy1Y/PworWI7dKzUkJ841jhthy1s1?=
 =?us-ascii?Q?x5dBrDZgVUxhNclxGJp56k7NCkqE5/qCI2qOUkL0MbxXbZWhhA/50+sXZF7G?=
 =?us-ascii?Q?X8EHJBON/4fPavi8ZYMZgJSD4v1g0VbORQ+yPaFGQDkyVfzADvEhHmBd49lz?=
 =?us-ascii?Q?8km0SVKDIZSgkHypEEVyJ00OFU0kXSIUzdbIivOdYst6ibImBeWuC/YdTKxM?=
 =?us-ascii?Q?Ew1+sLhXN1j5ppQ7/Wd/qusfc0Nc/CrRfcIP3auwhlnhuysAwefwpaRwI1MM?=
 =?us-ascii?Q?cyMVTUB25cQ/XwMLZveHD5m4AkOkkCBFBIXKTQ6qf/s+lHQhmmYvD+a4CeOw?=
 =?us-ascii?Q?aPT5nzlcefcoJcAsiSP1QeHEJGSyOFlqitLAvsPgV1ckBeAmYKAPZUsTQBAq?=
 =?us-ascii?Q?wu82gjMGz+QeHMTr00JFcO9tKYS+AYaeXR9XcTRxZdjAm7w+/KTynGGHUDS0?=
 =?us-ascii?Q?fQ6iGZfszVLg4oTKyu900deLAzIoLRqUZeW6ZM4ht7dcspfetep5fqbSmIyC?=
 =?us-ascii?Q?lg4zxHe3AQu3HJSwck2SmZ1YmDn/7hcEDyjJLQmrrA17WmHC+M3zSHG2KpRO?=
 =?us-ascii?Q?rJ6ePqS2Au3VZtLbKFky5vktdnvOwlkmsMjXu0bkt3dOmUTY6I8XiOzZxj7F?=
 =?us-ascii?Q?NmUiNxjD7UfzDXaaFYImFDLjoTf/o6GeIE6h1iku5ADvzehS6qIvGBt5aSQt?=
 =?us-ascii?Q?KfojbQnGjpdIhufSPvh0X2NBFfLXlKQY08TFqhvQAPxh2MzdSVv/dj/FOnzV?=
 =?us-ascii?Q?y8DHCtuphompnVR0OqqQKDX1q8pJfaBYTd5bwFP92l4tglcaYpvlLAgY1VEA?=
 =?us-ascii?Q?8Hzd1Cz+repdVfTQvyyrjUi76Xxj3SMEZ4N1T38I+yEP54q2LSUkx5DNEbDO?=
 =?us-ascii?Q?m5l+57FiFRdSGX3/45DFzPJpgmb23te8qiIpEMFZu2pt4c6yKiMl5AWNrkLO?=
 =?us-ascii?Q?nfBAxyKQZl/mmsWuBjQ02wDFjhnuk1OO3b68f8jduZAVVuFp/IiISfeATZsn?=
 =?us-ascii?Q?MzeWOd4oTA19mXgGoA8tH955E2mbEs6Txshk3mVwe7EJELNV5m3R7Ed4YvzU?=
 =?us-ascii?Q?r2kJEHzTz7wnBSQWiEW16OusgJA+VSNfF4Z+x4dAHpLWHNkXBK8Rc6C93FVi?=
 =?us-ascii?Q?QjIiXvRn1HuBdtO31t1BG9VMTIIQqpLiK5TDhR2ge3fHkO9z5stw5rJq5LxM?=
 =?us-ascii?Q?fj0QHV4bPqxyJPxEXEH0poSfdzZ+WYZmfdKRJuz/jhUoevxTZEegCvUfzYcf?=
 =?us-ascii?Q?sDH3pizXXzV0ITbPVyDniIFAwOH4LSiGr+DdF/rtA53+aqPJC7wFi3V8Bw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mf4lh9ITROB9+G5vK2q4uHyAvvpwbI6eugIElo0Z654L0fksnWdFIYcCpr32?=
 =?us-ascii?Q?UMHtVY135W2fFO7jISSANMxsQspeN62tshWyrr9CPcbhbI4u4o4TrYbRlKdB?=
 =?us-ascii?Q?eh5/pwvg5cB7VXWVcDGb9uURJ9MhDHqDNY+VpDI3gPNBXvKAr5kljrkfweob?=
 =?us-ascii?Q?CXp0AkDzcFzVhIxjGTTbt0EF14ssIAfWmz0vdItt+VVrIPMRgxkCLBmWuz1f?=
 =?us-ascii?Q?jHvtEjsZjUtr9Zk1EOeV93rPXbXoar/SUbG6mNSqvWaf5dh4EqagqOuory3J?=
 =?us-ascii?Q?hox3Rijsb5hd21W+3dbLbThjJ7cEfhIC6R0KKVmT/9B4Ts+uu+inrYlvgRcB?=
 =?us-ascii?Q?f81HnZsdVZ5bIhhrTcvl5rryGwSnVq5dCRN86hkpG75++OIFs1B0Q4iFy1a6?=
 =?us-ascii?Q?pyzFVZ3kARehHrQqR89COdp9sTHnYbjFqan2CyuC3U6PSmulLrM1VWI1cRvk?=
 =?us-ascii?Q?0XgAiCmEH2vzVZwNBM5O/303mpieC42tSXNi2L3MBIYps2upNxkHBZuhCdtQ?=
 =?us-ascii?Q?4DrMPY9x/jSMBk1aOBgtSprrb8SmMHT3DV0Ajxjj/7JttPY1iHE84uKCJpMS?=
 =?us-ascii?Q?m3ITsEM8ro27+LP+p8VQoqlrC3zpvg5wUpcLEk+dUa4ENbGGvO5I+TAcgDBw?=
 =?us-ascii?Q?oAAUQLnpwGQFS2kXL/HALtjfvQ1C1fH0CxrPZpCb2+VBWSUHedIMZjtV6OqU?=
 =?us-ascii?Q?qh1PcLF5rX9JTMOpjS6ZCJL0mXYCzw4jJgCNjMITWdE/hhrNDWxJ29bxRpWs?=
 =?us-ascii?Q?CR3bX/ZdzcNpsQmqM9+YmoYGIKH03GYpQNFD3/j2UuBodD1psT657u3UI8WW?=
 =?us-ascii?Q?O3T9pp8ShSirMxIGWx7W6a/vRdbwDWXwk+pMe1+X5I3Fbgkvg2P5Qf9dxV5Z?=
 =?us-ascii?Q?huYtJT8k0p2FZGjbAZiFU4zgZ2HQzpeV3oLoOtXA0/aREP+tMBZJeWiJo0hv?=
 =?us-ascii?Q?ponSIDn5wjxIjecO3g0Fwmsw0swa7z2aMfMF69HK0EHqQbgf+09EyfTwFCv0?=
 =?us-ascii?Q?L45ZS7B9roDleNxs83Qx/nShhYOXv9829e4uMtHrW4/ZRBt+/pMhRpBXNAkv?=
 =?us-ascii?Q?UxpJgcimuPScFVVShhJq9PflDojJ9aR48vxAitud1eOAxGPoMH78EbjaB+L0?=
 =?us-ascii?Q?2Y4vWiN8JNlmt54nynfaxAjbj4WEOldLGwjpMwA7+A9qIp3968T3FApN5Jy/?=
 =?us-ascii?Q?jHGPCYUNKfIp+jilIwZX72v57AcDXi35Zi0ThJM4ztyBTp9Ciu8JLexGidcn?=
 =?us-ascii?Q?LeHqN6N+TH6tII09MgneBTCpIxuJNBAyazJFoU0BkinmvFxoyqnSMgW3YAMi?=
 =?us-ascii?Q?Cz20FfWn35tR7HRxr+OocLk0k4NnDZNpYdhCBSkq6kebbJdYS6qv0icucUA4?=
 =?us-ascii?Q?7K22HIgn/RXzvCWeFM5ZB3PYJD2PjLWflwiCdpTO3GG6CS4g9DF0EB8YLekP?=
 =?us-ascii?Q?qo5ZKjVgRp0U6OJJG7OHJol0Juqm5SKBnFznFUEQmyru4lquu85LkK/2rc8j?=
 =?us-ascii?Q?9H4hXfVdgCK3mhrBhOyTAQ57ftIbFwHRSkx8hB7+jdnNV8a9L+yInQk+JWfj?=
 =?us-ascii?Q?/XfvCtMiGmC9VnVCwPMj9Ra0mBaIWJjA9MZz9BLV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8f7fb8-709c-4b93-d57e-08de30a74ec1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 07:00:27.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR2stBCAtX/dIN+sLiAoBXyi9y9j/2U63oYAam21EcYMU+iEjH2fYWGpgSYMImAGY9l6Gphv/yKz1xzxYdPyxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416

Add audio XCVR sound card, which supports SPDIF TX & RX only,
eARC RX, ARC RX are not supported.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index e47fee24471a..61843b2c1b1b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -192,6 +192,19 @@ btcpu: simple-audio-card,cpu {
 		};
 	};
 
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
+
 	usdhc3_pwrseq: usdhc3_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
@@ -468,6 +481,17 @@ &wdog3 {
 	status = "okay";
 };
 
+&xcvr {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spdif>;
+	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
+			  <&clk IMX93_CLK_AUDIO_XCVR>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <12288000>, <200000000>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
@@ -611,6 +635,13 @@ MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x31e
 		>;
 	};
 
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
+			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.50.1

