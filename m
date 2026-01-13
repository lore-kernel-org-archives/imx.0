Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70715325700
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290468; cv=fail; b=L4qQ5mdSzd7VNnI3rwk0gWvibaoucG4K2b8G2syHFSQkymIMbqAFgRWmpnZa3xi8uKdwCSIlbm6Mekxu5l1qr8b/LN23spGipjj2x/V/9BAq4IJ4nveV6rEV5EmwXzxlBIw1UmvxIqw7Lajt+uvr7Xz+KszfxCQT5tIJYL6/OlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290468; c=relaxed/simple;
	bh=RX/JESKGOvRb3W6iphJqXHUDa7QCsR9Rr1hBxnUq/AU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZGrEzogWJt0q+PWhNubNN0MpgaTNr08s2v5M9eEV1atU+/1fmDuRsGMMIq5jvZCKKZoxEKrZCwAg9BmvMkyjfVCXw4+CcVNnmqpBbuWPQk5GDRknaDqwqe1ug8GZp61AAnlJSyJRdSg84jz7N9+KfE+IT4wKVwXZBJ5W4krcMjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TUnQPoTs; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TUnQPoTs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+VAvhCIjD8K2gQMzcTr9EnrI/wAhMa+O3OmaAN/5XO3JAdwZG1gcYSsnMgxeJvRCX5Euz8Z0/AWasGIyBs4DVudQy4wgjiKAeRVz0N1Iu7pQB2vCpSvhBrkgfw/3F6GvZn/CjAbYIe3J/V7W5/8UZDIngmomm0pV9Mif3V7htfHBOrN1+SpKDNo3RSI7irusjjHtSjHxZEMGFVwXMP3kBdM6DupD5TWopuvzE0eBekcSQ20W6eHsaSPSagBMdCDxWEIyurMwclS/3v3Cz/DRYObl2heCi45dQo/39x1AwAlJnPxqUOXfe+0Xwef2keaMVdwQ8Tk7h+RRmaQrURUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpMgA1oPCvXKfjYGhc5IUtUBcUK19OeEBmkfwJkFi/A=;
 b=ePdgACSv+06yO+tOBNz8WVCE7aGFtXyX0cGa5nJitC4syJqvMFp+EJ1TBtzJyeUXlOrKblsigvMFYSrAT4rBeTPFP9CEeXZwo1Q9RWTziVzlu44VYzKnqXjhba21F2Zhg1JqkxRAAWOG+9aI3RrBUhw5Vy92oHD4CgKh0ozvvdn113KA3h3R6lS2IBLSUcQvmgculQa8abQx/kL17WOyd+VMyusnZkq5tm6nZF5CnDkIfyKdqETHyQmP4mf3Qv2DtT4a8N9moZFHUtE5+j+gSS/w19Z1iRQacsYXOPk1zbaDGyk0RN0JfU7Q9hpwwQFenvHzkqaOsqtEgp8GVMh45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpMgA1oPCvXKfjYGhc5IUtUBcUK19OeEBmkfwJkFi/A=;
 b=TUnQPoTsZYaRvc21I9OvymuiCtLRugTLVq5o70QYNifCxeniIga1Im8j/C8h6VpQpz6k8FxTIKQhyv1N8KYmMXN7n/ONY6pUmhqADiP6as/twz3MXjRsN6QwjTQVL94J6TD3zXT3mfKINN948ZRS2Rjw8yQR74XmOkPIRqDb7Zpi/DqTTW6G614aky328EWkEp5oczSt4VE5mAmkZuXYj5pTfgoOTaeBJFyrW4ryd97bldgTbaG6KrAhReRdxuB5UOWlp11S7UIN5n/IEiJChykCA4Xwa0voHNs6b8J7TO1CQ61uA3Xt2NTtsARR/BvDScCVqq9uP1UByyEbwtOD7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 07:47:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 07:47:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tom Zheng <haidong.zheng@nxp.com>
Subject: [PATCH v3] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Date: Tue, 13 Jan 2026 09:50:02 +0200
Message-ID: <20260113075002.561453-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::24) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e0f5f8-b912-4c3f-5915-08de527802e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K+ouiuCjxJkcognVWzf2sUgUQ53i5OcxX3vO+NkhbrxZlHf6HOlvanBN3BeV?=
 =?us-ascii?Q?cXNniEXD/Vt9OG2gqnga6O3PRKZOG+HYqm3xTQ9vX8LTnr4KF8kz00sCBk0d?=
 =?us-ascii?Q?Eu10MGl8U6sA6Qxs2Kg4HvdeKwRKbn0ZKYcWVbqqZfXRdM1buMXCzw25GcOE?=
 =?us-ascii?Q?DNY1cd9uiBihGkAgarp6U8BQULK0xdGfVCVuC0eF49RWaedfE4mUdvNGXJql?=
 =?us-ascii?Q?BnwN5ggfAkcm8M09cJsfj7zdo/3TcV11mfq4bYIdBbV/8zvnypsMzLiDM7gN?=
 =?us-ascii?Q?R8HvzHhZG+toEP9zMC/BVoyrx/adAUlfLEJWY59kVVgnz+QlgD+moSQNck0z?=
 =?us-ascii?Q?19nqt+uQxTIzUzpAyPZuYqi75IJk0k6SK6pPrfriNjARCRgAn5tUJYHollog?=
 =?us-ascii?Q?FELJRcQVA7uTjcByQj8K7/0DjsXid3BjytYdqeUJc3SZnRs0yfl3o0sL/L3S?=
 =?us-ascii?Q?+ctIRbp1HP7r8ouWssYmaB0w0/1ofQrf4+MvvXV7VFbCVFdZYrXiWvhMfDXE?=
 =?us-ascii?Q?XNHSqo+RxsFKvqGX/+qbDNzDLprA52lRzf0oLlxl1Mpe/IXCGXBbH9fG671k?=
 =?us-ascii?Q?EiZljJTJmYGiMmqguCd4KyyOBPx6AP6TnVXfsShgQ9ElbmzVXkh/0ZWgdLJd?=
 =?us-ascii?Q?6vk6960XQHb+ZCTM3AI00ad99ETjtQwapExy+dn4/MRGa6rTec3dJCWw09kd?=
 =?us-ascii?Q?zuzg6xG/MKxn+hIcbRHg0Fl3nmKr78O+XFF6YA7PM5ehlYfJ14nmgtgC809a?=
 =?us-ascii?Q?5hHMsLbHAb0HFXBEJyn6oXvgYNuvybX5ti1v201up82qLHPhaYJWUcxUQwZI?=
 =?us-ascii?Q?joHAonQTBC+G+FdsbEja6WqsbgINWbpvUY/qMuTSnbe3RE3VWb+uyhL2Mwfw?=
 =?us-ascii?Q?fNGG+8aJQRWm5IUQEk6V5I+3vVloUM2Ktv3L4j7r6he1ikHvBy8b9g8LLv/y?=
 =?us-ascii?Q?q23hq1WjJBj8X8w9QVd7zuiz47WvmdLeFJxAy/npt2N/SzgaH6V4k970X7dT?=
 =?us-ascii?Q?JJ2kTVq8DpZI1Ab2npUb2ZTOb7Q6PfiwJjMZDD5lWYsRZrb1vBlg8pHEfLpv?=
 =?us-ascii?Q?US7AdHuJ9wbEFknn9YkUsfxH58FlSeUcofLrWmkz38td8J6yq7oAtoK8Zm14?=
 =?us-ascii?Q?DtyHgvyFQGPrso8005ALd8ZpJRIr/r3FB8unQXHi3mLbEeWwTwzif1k3DRL7?=
 =?us-ascii?Q?oIK+ac0VGn9jW1hgOvPOAjUZCfNHEDQNjdaX0MeaRW0blho537A8snm7eDUd?=
 =?us-ascii?Q?V2Dj6OoVZNf/+NK4sYBxugcW0L6ws+NU+bESSit1/GZvDsQm2yWSeOdljCs5?=
 =?us-ascii?Q?lgDzJJZDTjMCzGpcI8gExuVSxKdZHQBdU+1g7ULr6DFA1K7BEQtMoGwTwbrb?=
 =?us-ascii?Q?hjk6ebnZubem3s+0PFpdqbMR63c08G1L2Xi9gLpS5d2hSELB+dqzDsyMa4wz?=
 =?us-ascii?Q?pUgXmunqucG/QtbEGlwLy6CoVquLLUA3uc+dVb0ytuFd+TU2tfrr5LyjpaSL?=
 =?us-ascii?Q?zFL8aHPOuPaEfF2Gii9jGc4iPVrOcOdSEnlp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tcIRrdONvK6kcyVh/ltggadDYCMoIzFlvG37tCrzpLiSlWGZL0d1eQYu+zq4?=
 =?us-ascii?Q?pTM3KEji3XpuVjMmSZc6ARx/LoCB1yR0UidCK+rkRaNE2Lprgp9owQTrx6uj?=
 =?us-ascii?Q?4etBT9DBnXSSkyoDA3iCNrGbc0aoLupM5e5CjvNmxZ4fwfbybCFB4tI87ROl?=
 =?us-ascii?Q?HXj6H6cgwGSSQfURQqDqrE+iZkgAMK8peYNNYMQHOe0SzL+WcD0Go5EaFYqK?=
 =?us-ascii?Q?IlrslnwBjRu/I0OLX6dQJ+xpKs1cpakplx68AumynfK3LN5Jbs4qCHbFJpfN?=
 =?us-ascii?Q?lyzyvojfJ6v00Mx05fo1XeTfL4Bbcl06JcG0ygJpfHkxgzf8MZJtOb5cZPJU?=
 =?us-ascii?Q?5NZk1z33G8Si/X01W1c2JpurCj4KoKY93uScO0vqYzNBtIwbJfCxtKJ9kDlx?=
 =?us-ascii?Q?nQtNa7AJF5HmwFzwDQrpf7PCWtpePP7V3JyCnSsREDdYZNiwNX2eUuuwoeu/?=
 =?us-ascii?Q?vXZyqny+yPHoxZEjEQMbKSxYUio2O0txkuf1FvU3wt56fd9Y+iRUdUM8bwB9?=
 =?us-ascii?Q?XlNzbY9yX0XwFFq03dP5SR13CeRz3knRYjXDMgqDZk8OU/TmNLuvbpRPxHRe?=
 =?us-ascii?Q?pRNvbbSj2V9DVHl6OeT4oFurNTfL/f8NxDZyJKQsKg4ROOpmivOyaVNjWH5+?=
 =?us-ascii?Q?QxJxNelt6TmrB8MNLIDY06CDs2QB9Q75Q3jxe7CCkiIKwV2fJPDXGf7yNcCA?=
 =?us-ascii?Q?ucyde+JpMds4vipz084rnvMq7J7qcYw4mCIUzH+iWfjia1WFYFhwr3iLQ9H1?=
 =?us-ascii?Q?2PTXWRprpWsy9b7YdkEtiQpqM9q40HN9PkoreS3ufnAGXbxWm1HxeCCu7osi?=
 =?us-ascii?Q?jBUDozWhGgWuF0FVtXOgiYA81R+aXXjXhM9fxyCPbQt0w9UVakQrhHVjJ+BV?=
 =?us-ascii?Q?V2Md0UqfvK9omcBu0CSxLeAFgLaBWUVXhqcit10pRWKq923ITJzhWXmZ4P0Q?=
 =?us-ascii?Q?IlpfT3JNsRPzFwd9mAXMC7M32Tuyu6QL9AsS6TAjf61dBMa+cz9XwmMnhFZ2?=
 =?us-ascii?Q?f1fXXw2hsG4dnxwugIdSoIoHmjd9nKgfnddtRaavn1UYy5y0SbH0TnYZ8z3K?=
 =?us-ascii?Q?/t6UW23osBTYAD0zs0BhhWYF//MizEUjgz3beS64S8jXm3CkgVzS1bjbRmqP?=
 =?us-ascii?Q?sn+P4FmJlSsQlnOxj8o0iuWywsHZiRAqAMQRPpOxT1PNSRtZ2rTT+ITktzqx?=
 =?us-ascii?Q?1tgNi0L4H/GZ7/+tL0yu7PfKYTxijYDuS62+ePpOR2+ue002q0pYhDAS5RxD?=
 =?us-ascii?Q?kp+hXNqigT+l8NrglB1Fdr9gZRLjxHin7dFK6lMFtW4xcIqDQ62o6AXVbEU9?=
 =?us-ascii?Q?/F8anx+vYvC7mjY4jddm8vLzZl93ObVoRa0QJrHOoxOtFcsfOjJdBqxIsZrP?=
 =?us-ascii?Q?kIhdseEGcidMMQ2gGbcNeAihHwg/gtu4/+s6vl8dDN5PIbxWNK00z6TU57O6?=
 =?us-ascii?Q?bZ23Hk4Lah+t+wV/K3JVW/YXl9HeFII5oI+wpIdn6VcGOuIg25uk4nBhvDJb?=
 =?us-ascii?Q?CpJo3/rXOcfOY0QhxoXxZMaeBsjBCYrW0M03nIGRythMokQ4nwTlusDlA7jx?=
 =?us-ascii?Q?MEbVroUBlJPUqEoDV8d+uE+OO+lLO9KKIqxSPlf6HgmXSMVORe+aRQSGn6VX?=
 =?us-ascii?Q?J4OW5+DtmOnHnUZUB3Uvhkqj7fmjU/Wq+PnHnFumaLOkqdq3f/cLfdi8M9kh?=
 =?us-ascii?Q?/UYYx+WoySnACVy7jB3DG7qCpQ92kcRC6J/N8gVE7W5P+/kpm1i4IJCOk8Or?=
 =?us-ascii?Q?xLnSZtxHlw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e0f5f8-b912-4c3f-5915-08de527802e0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 07:47:33.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O55Isn0x7lc7VfKs6GddqrKhr6aBWLpsJLXpOFYVrsXIoi41pEgCEbYJ+KLs/l1oDSTcEbhghDWrjZZF0jFo9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
by adding sound card description and enabling sai1 and mqs1 dts nodes,
together with necessary clocks and pinmux.

This supports audio playback via SAI1 DAI which is connected to the MQS1
block.

Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v2:
* Remove  "fsl,imx6sx-sdb-mqs" compatible from sound-mqs as it doesn't
  make much sense to use it as per Fabio suggestion
* Link to v2: https://lore.kernel.org/imx/20260112135612.465325-1-daniel.baluta@nxp.com/

 .../boot/dts/freescale/imx93-11x11-frdm.dts   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 066c5139842b..5bb6ae0d154a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -81,6 +81,13 @@ vdevbuffer: vdevbuffer@a4020000 {
 			no-map;
 		};
 	};
+
+	sound-mqs {
+		compatible = "fsl,imx-audio-mqs";
+		model = "mqs-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&mqs1>;
+	};
 };
 
 &adc1 {
@@ -315,6 +322,27 @@ &lpuart1 { /* console */
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	clocks = <&clk IMX93_CLK_MQS1_GATE>;
+	clock-names = "mclk";
+	status = "okay";
+};
+
+&sai1 {
+	#sound-dai-cells = <0>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
@@ -479,6 +507,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT		0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-- 
2.45.2

