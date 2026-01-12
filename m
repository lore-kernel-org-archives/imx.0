Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5235B157
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226040; cv=fail; b=a5dZFb6Z/Yha7E4/h1QZ9mHKM/AfrHPARyuNkxLkvD8zPfVDtSDhW21w15Gs9kQtd39UjdIfkNSUXoP8lb39E4AaGmqnZGMjjXUsVWRxXS7u2M2JStPdVvZgbdVpXsm5HMvA666fSzJbuS9Y8DFdJghsdGyxanHg5Cl8lm+Bcj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226040; c=relaxed/simple;
	bh=/Fc469nj7M4BYqTN1wAVCNbn47TJKKv/AJdPCZe1jQE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ykf9vOo2hYVd0uwPk2zJU/53rrNOClzvCpWIKXvpfTXCFUGII+563ww4/ID9nezjE4iZlsWlOKVk6ZRM6O/1Z9aMpEiC1B97kSEFUbHvm3P45wCRzRe/t+vXYV6IQ0M4HPAlFKCqcyrz6t2/40ZVS7RiN2gPDfME+j6pt8Tc7uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bGKJCAMn; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bGKJCAMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ0x1kj1/fHkswLxJTTJqin9pZltH7PMlouHih4MLIGycig1fcMtBamy4OJdZ86+e9Phg3vmRDPxbSKYKpL4Ki9zqmEZc72hovSuWecEpXvrPvYCoU3g/NnJhMZKw+cIt57IJrUH4yQ3CooDB5BkT2ounun66vMst4PvzQoeVPq1z91viuLZzPTl47LeO6vAiRcyWL4Yvl92QFO05VfiMrLs+64zZOOcVV2p/YZxoab/tPnvQcr4ZoXeGSZtusMwEqAhIBwKnP8mb7jh2wWhPZN+Qwc9xU/yvUxhuhw/OA6uF47IyifZ8G+ahkwRGQlsknTG7fktMyggw3Pqb3L9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IOVlG6/tecoJ7tpwsky4fG5IyCKHPrh0e/mjlXAVnU=;
 b=C7R9ycAA0Ol9qMi7VXvJeL1Igs4qzM11Yqn+7mz/INFohhAr4j6l+hFewVVoCI9mcy/JiaPCrE+mgYgmuVGV34NY1ZwzCPL61Yx6IT7RToBex1TrsfMkdFe1aRsvOIRQ4ZlmGbN0ggN8IrJkLLsfvePMDEbZtwJY5bokCJo49FYVV+fJRFhIVn+hsaq9u3b2vceT6IQt9rONvaYuyeA8gTIn7MJtjxRQRppSk7Wbg5+wae+IKpob67mdu+Eg/qO+LUA9qYw0Y0DJk0afx1wEaW0KPrnVVzxpvBdW3GKVPjzruFYiYdPB9/u/Go8soz/54tLW8UxwYKEY5xLqd39fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IOVlG6/tecoJ7tpwsky4fG5IyCKHPrh0e/mjlXAVnU=;
 b=bGKJCAMnmCYuFdQEHQR2F3bLwSfI5bqLCYkzdEqC+l9+kSRngyOV4ysA7UpunnsyLQtoX9fSn5f0FR2KeFE9sWbilrvMhPkG7Qr7dBSqlcRRgAj6UDgRTA+2j7s9ItjUJxrjwpchiJwoOJFdLMFUPLh5I4DH+OwBF2yeU0fQJITeOqSk38mR7meiOOlE3diMMZSFtATZkhy6GsZFWCaLDnhuwEJSWubtk4EdtqmSFiLGdcENJAzPYkdClrWBtAc0kaJ9TfGrw7nJLPBBvtQKqEIdFUNKsuNglqbGcQeKXTzvnmGkZjcfChbH2mtRsEQCkcIONfJMDNmug+/HajJOng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 13:53:55 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:53:55 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	haidong.zheng@nxp.com,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Date: Mon, 12 Jan 2026 15:56:12 +0200
Message-ID: <20260112135612.465325-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ed632c-e368-46e1-3483-08de51e206f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L5D1Ms+nPX5jqZXnItbm6o6mcGwtnALmqUXmKTWfGi9Ku8DRmUVF5YrpxI/I?=
 =?us-ascii?Q?ergcZc5k4OYkLJ8EyRK1nAJSiGZTAXqyg4RyT/yqKrlH5IipxbPkAlp4l2cY?=
 =?us-ascii?Q?eRr2VBPkL5ecVmTb5ZnKU3HM7Bw2YBFWEJCnwVILaYVFPMt2b5ubUum8Fslq?=
 =?us-ascii?Q?Plo8xktOvo/jD215aV7FZH+n8tQU01UaV4dmNqSdBq/ToDf32Qz2iBh0fEqP?=
 =?us-ascii?Q?bpv310F+2XwTG0ZQLHOgxP9pld55wH21hWgjSemX+hBJLB48J5Edozv+QhOI?=
 =?us-ascii?Q?rVDC+MJe4QB4Vss2plAGC7t7p+bIvELf5aJyXGMRNnb1toIo65o32/KfqbH4?=
 =?us-ascii?Q?a2R2yKm6TSOeCOEBEP/WqZP6WUb66N0D/BIdTInh0EIZVCB/GFZr2fTgu7PI?=
 =?us-ascii?Q?oydAzfPW/o/8IkvgK8TM+TCNMVzYLN5u+kYeZu1yHjDAJRqNiDm0kteIRpye?=
 =?us-ascii?Q?xuV5N3hWEH72wm96TDDDdNOQjJeyMb95/ngAhXd1gBaUYvkecYcmVVldZQmN?=
 =?us-ascii?Q?wfVscLaNRFJ9N4y8rN7We6Qnq/GjvkNTq2z2VxBefYUTLxQCxrRadjg7JaEr?=
 =?us-ascii?Q?tj9/nmPORqnI3T0l2Nl+9eY5sGo78gF8QDRCTf8Wvu7ntP5y1GcVh5Gi16IG?=
 =?us-ascii?Q?52/jqSCa5Xb6ddom47ZCnX+c3w9ZuY7X1YDVc1N05thV8i+wf72UEC64+eZ4?=
 =?us-ascii?Q?nVQ5QW2C1OdigBqOwyahesLszxvXLJEnwwRB6+U9BtiPPETaGYOLn1C1dJeO?=
 =?us-ascii?Q?XMdrxrhXmpxT0mrQzcOtcfPQtfVYGBa4Qed6IGJ2BWAgunfGFqUT/df75DHh?=
 =?us-ascii?Q?TO3rGm87Oczcnrgv7MmYxzqWFFeVwkLoNH2wp3SCGtQn6k33mKIm3+ThobSO?=
 =?us-ascii?Q?GzAcBxyY17XNnSo2dFuwivRqGoLC1OQzQZjHSvOaXFErKyA9poK8B3PtpF4q?=
 =?us-ascii?Q?aysP3T30bhDl0Wi4tcmH330QCQ29ep5XIK7rUyDdEpYnuRzkUW+p4OysoG7i?=
 =?us-ascii?Q?R7+7fpiQnh8tUMxEiZ5r3qyDFdtwASiEkeZwbj/HtnuH1IzDHjb/sh3UNg4d?=
 =?us-ascii?Q?SCQhK1sfwYO8dkLTt/UHCySHwjjuYOWv70EIH9oFI4nrfCjmfMFwzXVK2q/V?=
 =?us-ascii?Q?EIS4yMQkUi0B0alYlKg5EGEafuujL5O0+ef0pl8TUwU0HRc75Mw1ZcvpxIV/?=
 =?us-ascii?Q?AtsoSyslfSJH+aeGEftjk5QOJjqi+5yi555IWhoL2NbHrahDcmBasQeQGM0K?=
 =?us-ascii?Q?q08pki3PlD+REKsHMXfzKZs5LEekbqJnxARzvs3m+B30nLKrbT6sK7qvupim?=
 =?us-ascii?Q?6xh+m8sqdRD82ppk2FeBJ8iCrxBmRyeEa7ob1+c4tMlaazWQ+QeBvrXMrMoq?=
 =?us-ascii?Q?GaysQ8RM3sIXHgCuUiPsjr22scUegU8/rMUoRurDNP9tP+BhB6ECpNYsVQuA?=
 =?us-ascii?Q?dLkM6cbAq8AWrqQpP/5ZYZ34uTQAQKEj2JsrLjk1XwK5Q9Wq5qzJg6bYGk9y?=
 =?us-ascii?Q?TXAx2lf7gLec6p58vYxsCSTk4+nFI667wv0D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ES18nuXGVH22q5/tovJaV/PvJE9tYOO/CQRPdMQ5DCJ6dKrOpNF4MnArfB/G?=
 =?us-ascii?Q?X/P/cPkhTys1w82u1NU0F6fdS+LGrpYcvyi9pMDBYiw5xPi8Q7SnKwVBIl2T?=
 =?us-ascii?Q?ZuYrUFFgV/ZmPgdZHnBYEP6l4ATGn0f2ZeDdbDxJTuGAEzocxhoqFTIesSq8?=
 =?us-ascii?Q?Dt34oJuy0INVUAsw3iip553qbsvsyPYbLrT2BqmYOeR4fy9E1mtxGlGr5fz7?=
 =?us-ascii?Q?rTRj79ZGCq/DWKJFr6Y9KrMcMi4vH+I651h/0FNR2QTCqdw+MBbjy7d1aQq+?=
 =?us-ascii?Q?ym/CJ/sJaCOczPTstKDsnsmkWLWOy0CRfW/Z9Go7TkjxxBA96UqVJTPOme4a?=
 =?us-ascii?Q?7nxwcqtF/UyGIDO2YOQl9g9421LeqRjijIdnXcx6ZyGZlqe59dKw9rcdU0ui?=
 =?us-ascii?Q?h32LtvVWWV2cx8V3NwrICsMMh6GKf04iTI6oSb1w3xWyW7dTvTRhKMQdnaJs?=
 =?us-ascii?Q?kVKdoNvDNPS0D3p41VGWDwnGrLV8XyNxGux99zYA0wSNnVzVrycQIX99OTNi?=
 =?us-ascii?Q?CLJQF+4Pkr4WdRzYlMybpijG/XLmCjpg8nHs48wUduaBfO0k/n3R0DOMC2tg?=
 =?us-ascii?Q?Be3gHYe3wgkB1UJcWyNZBGS8a/tLku2mMdn2CbivYD5WDzIAjkrge80AkXUF?=
 =?us-ascii?Q?ht3r9MYb9vxWjrHTbMMfcXYnbS5wt7wqJwpwSszUyETRtSyqeMG3LE74N9Cl?=
 =?us-ascii?Q?2oH961EfiFw20Nk2Mul22uBIpLU4dm649yjAuGBC6p8ehchsRbVot4585RJg?=
 =?us-ascii?Q?j9knEAdrwYKaNw9ZaeH7z2y17VjpZT4NozQXrPnIF0lnLcVAxgR21wTNS+Yd?=
 =?us-ascii?Q?lslDHiU/rX7VvLqkRNzgeuT9BUKKibYuD4MxdMBrO9ivelxHO8CgmOg/fLfy?=
 =?us-ascii?Q?rObcCUlII2X8A88OPu5bfsHCnLbrjUlWKlnBpAsmO7f+XXKbjvgjN2R4jvya?=
 =?us-ascii?Q?ls5kK8yFMc/zQ+7G5Sn8lduWy4l4iJx99khMFupnvv/Qh53LH4Ob89bPhLYg?=
 =?us-ascii?Q?eY0I2pvZvjbFI1ajp7iGNgCbDrVaSH5LgC59YQiKkG1mUbUW8DahAINGxNOK?=
 =?us-ascii?Q?vgh/C7+LSr/S4ZkO2O1zUDQwOo1/q9VTIHWFopYIqXnfryEyhDvSh20TikX5?=
 =?us-ascii?Q?F61aX7E+aeN0TfQtkCPewr3JCf0OPLan/DYFm9iEWI6KICoD/js23deFc5yg?=
 =?us-ascii?Q?BtxJ9P8h47TW/rGfyb+3XCPXHtTC8Rsp6oMv2kCMgUSxWie8mMCLbUIpc9/f?=
 =?us-ascii?Q?ztwPFMPdvZyzcjRO45y9geF+Ai54pt8/0l91aSe/JRiPwKmVABsINq+cxJuA?=
 =?us-ascii?Q?nF9ksyGXaarZQWbLgaBSXtbUAV7Y/iY1+U6v1wWv9NONjfXmNQO+edPm+hfy?=
 =?us-ascii?Q?65qm0R7HN7T4t9POO4cNLToI9l9TjLin3CQxLlaavbRCarIcoQPPLt8I2woh?=
 =?us-ascii?Q?otsfKjllRCpd07qZoRee/B3bPMrXW9+RHD9xhyK1ZcYZhOh3xCTwhmlrJwqO?=
 =?us-ascii?Q?avyPknRyz9+uOn5t4zQIqwnMhpTD9UiYn5pjnwNVNneozdjSJrmDXLEnl2W3?=
 =?us-ascii?Q?Ai/CTLAn0q0mHYqC9Tl3SgfcVH42I/oJkj85hrxcO/si57CSX/XkodZY7owx?=
 =?us-ascii?Q?i2N8+ZkGHTXWS6/lxUxKCWNt3bFbYPrSyOglFXn4c+IdtK/Ko2o/bjtnL4ua?=
 =?us-ascii?Q?xYsSA+nrPs16GSO1v1t/A8g4UN+I1yWm3CQYaTlAq0aCvAlxF32CrcqzpZGK?=
 =?us-ascii?Q?CCyepm1ZLg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ed632c-e368-46e1-3483-08de51e206f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:53:55.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBGK/faVBw+QIYV3hr8C3/vKvT9iJNoFVNhkw/qAm/j9a1Vp5mS3vR61ipWcCDVfk/A+nhL5ErsbSKeFLjo8uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
by adding sound card description and enabling sai1 and mqs1 dts nodes,
together with necessary clocks and pinmux.

This supports audio playback via SAI1 DAI which is connected to the MQS1
block.

Co-developed-by: Tom Zheng <haidong.zheng@nxp.com>
Signed-off-by: Tom Zheng <haidong.zheng@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
 - small typos in the commit message
 - added Tom with C-d-B and S-o-B tags.

 .../boot/dts/freescale/imx93-11x11-frdm.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 066c5139842b..a4784c993aeb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -81,6 +81,14 @@ vdevbuffer: vdevbuffer@a4020000 {
 			no-map;
 		};
 	};
+
+	sound-mqs {
+		compatible = "fsl,imx6sx-sdb-mqs",
+			     "fsl,imx-audio-mqs";
+		model = "mqs-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&mqs1>;
+	};
 };
 
 &adc1 {
@@ -315,6 +323,27 @@ &lpuart1 { /* console */
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
@@ -479,6 +508,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
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

