Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A92E7BB6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783909395; cv=fail; b=XmIokP2tadyM1tidNhgc0McBtoqwGzrec/sL66KUa6B80kXAivtKPGHnIgssq5ZXfxlwOwj8gbqynyGLF7DEgw0gOVldVkg03iEiQky4qH7AKkuYckk6LI2WNvKIx6pbUXgs1b6mMbWtCGFQATvHRpd52KicbO0EX+QpLEcXdbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783909395; c=relaxed/simple;
	bh=mFNrJ47QgXjSJPJ+hssarF3lFAdu1HITljb8AjJD2M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AvvaMDpyxGjBHvYTZT0w/LqdqRqnh10tgtNj1NAEgoz5NylO0lrZIdpLvg8IPtVWvBBvJUEc+IHAHPJrmOIq7NSASmy3pnF1FEc/xZsQRwPFx1VTT2TLwsUfxwWqnghJP68APKS/SIKB/e394/wZSs7e3MUMXN1Ztac6MViFtgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YI7UIIPL; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YI7UIIPL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPUNpZmda1oBNF1WlK5WXT0UVAqbOHqg4y4EXkEmNaziaOoaf86iz6aItxNwJtagk5o4QtnvZVbfG390OduNW/RNNHbORQYqxJlO6QRcKt40l8ko6ONl1UCrKtSb55HpOSPzYxJB74//FpnI0GKKPOnr9GdN+HuOQUGPshT/1JoVG9NLTB5G3Zi9sxQPndM9v/tWiTmoAHk2OYXZ+oG9aNbmGaEV4fzkqwybRw+dwaA44/fkw+cYaxNCNhoFyX9d41+BLnQFc2gB5/1QvWb1yXlpCxC9K8+P9d4nOsBNIGV+ISo+uCyDQkNV0JSCpLA6l3rYfATWANklgaVN6zsiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCp4+PAGmwLN9eajta5wtIb6BS+Pu5Rcqr1Kov1YJYQ=;
 b=tDeDXKZ8avlI0iLMeZ8tmXT6mrdlCFJJDqLE8/v1gWRH8VqFG88TULdjRbK2N2jq8GD5ORhlTJa6inWD5nlVsrorXuw0EQ96Ps6L9eWXxAz2O3/KhF/2EQJpnJFn0nBha4tBzMAQBKQIBD81zsIt+EN5ytGNrp/IgyrxIFXeRmlAI4qpD7IE82sCKj3ta118Gvs76IaZ7/WXamKUaWzUFALmHJYFENkBT3KpQoV+iJ/tayO1tRvxMWqFDJZVodtV/lZ8kLzxJoUhsiX8GwckJRdsB7wvK0dj9J+d9a/GNU43s+e6yh9IhO4BC6ztYzrntioUH9sHfHmK+xDKWMXenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCp4+PAGmwLN9eajta5wtIb6BS+Pu5Rcqr1Kov1YJYQ=;
 b=YI7UIIPLxvLP7DZfwzSHG9BgxEgLmxlx+8ffr9UhcFkW+/MVRsX8dWwF73g+rQuJAyDZvLhkqfidiyGl+KIrMHNa17Y03u4ZBvlcvRZM+QwYEfNsuLBV8gDM1k08jDJHksL0ncn3BoS7dLY+ztJocxHHtloOyPdyiry/pMm4/gkTFFZJk0FjK2jgMdSDX3wKTZ086ZVi5043Y5XdhNXn+l9Vvq1a9ctFjxuzBtIj3P0puTv5wFooQwXe04OwMsyndM+HRoND6qxS18mrUQKirKrf8RuhP3j5YIx0fybXwb72MysfoJ6QQ/jZFaB9PG7sEPEhrlVhu/lsZX1huUtFEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB7659.eurprd04.prod.outlook.com
 (2603:10a6:10:209::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 02:23:10 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 02:23:10 +0000
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
Subject: [PATCH v3 2/3] arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
Date: Mon, 13 Jul 2026 11:22:47 +0900
Message-ID: <20260713022248.1262123-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
References: <20260713022248.1262123-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0207.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 732beef0-5b3b-440c-3e5b-08dee085aeaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6XYaFpg4+St5q9fC65uokbK5llnIXZ5UviRsIES7MG5UVexyGwNGFOZGddi1oLN9wY+rAYpVgmUfIHuG12eA9pONjCC9ZfGDCZQpdgf8D+z91cmQR9P7nW9ezpiJHZck/QReFgRtMmNoIdVJjWheQSddIXBjthNpz9JGcU8DKz4XA4jUyBTXpBK5odyBza1EUpHG7QTre+iG7DRHFymznkoOef1pTLgxgsTfXe8deQjuJqDCbxgcVGbTTcBkHYb5VtJNqCAz/0mr14dO0XWh8YdbtJ2ygRof65mNY6ivsXzatJ0DuQDJ1CIzNavMtRwhKm+JSC1uJW2WAwyg+EezqD5PXErkFAS4H27JgVXsb5O3feVM7Qfjdk3qlrz1aWZYZUFm4+oTSCzS+w0Oe4AjIoc2U7LCDOevcsUvNk/0CdJMcpQU927U6UR5EOLVDDnWih8XfD7/m4NSRspDOWMgFW/EY+JMvd92/knb5uAka7lff6+ksNU/R1MLGP5mAyu6Wt+kIXXKNbLUR3c8GrHqCH0gBsyFZEUdKyYJ3eQPx0UR0GOHG4J0FgcAwcXMhe0WKQ8i6XcxGpmZQyMa3bljsaq3JRGNcCrczIhddNd2zL5O4MiB8VOGbKsw2vj8bf3XhbJMaRqY3Sksz+UFyQVtkQ6606e7gTXQu2G9ciC3pFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7flNxUgMkqgKG4+UdQEYJYsOFTuNvPMjGociF9MlsxkBp3Xwjp/RvQD/Qlkc?=
 =?us-ascii?Q?XNGgpVbwQbZfxbrMT3H6grxG/7dzoKF1jjHtJipSVvjaUg4OOKvZKtYFvOVd?=
 =?us-ascii?Q?NGYfIqn4NP8aohoC4o/3ot/caMqJbjLMCNRMT0VvnZVIDRjk3OuMZIEhYxbQ?=
 =?us-ascii?Q?Qovqg0xBpTaNedIZqQu66xNgsQLJpwPBmLID6tDJbpcosroSVf68M7nhbHCs?=
 =?us-ascii?Q?anRfm1RE3Tuj2hf9YnHbEa/XAHtQIvO+GGvzBPupNDUJjughilvjIjwyfWni?=
 =?us-ascii?Q?ciFz58D3vKCcSe/H++N0XVtnLOyUh+FuFB1+HTHVh3JXprXoOdO92fU9IYnp?=
 =?us-ascii?Q?8jjxl5zWKN2S3gz+Fxk4C6POvebcCuEDuFpeMsiMImMUW6ui4WGy0Sr+Xk6p?=
 =?us-ascii?Q?qPw69NZx0VBSTJGzeYYZos46ZGbJDSX0nYN5F7FtvJKE771YooI/kZk8n4SU?=
 =?us-ascii?Q?UIv7JGw/Ub5SAcKV00PAJkm0DVyhNc5uCOz+vMMSAEk0O5GXqS7vryLmAk4r?=
 =?us-ascii?Q?PZXNcO45KhLAbkYAa+yisSkH8a4sr5EWoccK3Vod0qi2CfSXhMICQthhpu6X?=
 =?us-ascii?Q?zIfkvkMg7PZLcPkISMG9eiaG1NuiXoL6jW7nmMQ5I6rwNcFG0AHQK2xB3HOX?=
 =?us-ascii?Q?7//ibDvKKCowg7u7JSp7bA7IFwqQhkpzb0OSRr4Ztz8OySuZKwO6S2BhJmwy?=
 =?us-ascii?Q?xZQKnCIs68Ve5f8ER2zJwhT0KmhHR+S9RfQJwM0MAfgmIepoqGD2tiwMNPf5?=
 =?us-ascii?Q?+lcpg/3ISCNANqKsiHPpKd2tsT5a7xPogTCPkrhuKFlErYe4IRFEoOfD0r63?=
 =?us-ascii?Q?8OMaEm5bBuD9juXXp4kpcN5o9g2M0l8RMTwe1SCPBPFgk/s9OfGQoH3rE5l5?=
 =?us-ascii?Q?13WSlNS/kxE8uf2gRo/46N4yXEjE1gTPBuZgqjEnGFTHnIR2E3JxhgkPDMBM?=
 =?us-ascii?Q?IlC/lT1Vzi+uysm7r7cFZj21LhW43dSrm8YV0K3dWrxz7wnkE498G0vFM5Hp?=
 =?us-ascii?Q?ZsnEi6oE0ebYDnEzf/LZBqfee2Sd1zEzELyjD5w5iFPt2LmBWteO+1vFHjHw?=
 =?us-ascii?Q?GMsN/eWcSpqFp8vQ+EFrZj1eeQQRVUq2HHo8Sftjhqc8pluQzk5M1OwHbKN+?=
 =?us-ascii?Q?cF5Enf6YJfZj30OpRf9Eh1X7CenWDvIGyRcDFnLxkgEBcuS5Dc8w7og8QGMp?=
 =?us-ascii?Q?abXx6UrAiWTp6gp7ykOFSQbbvv44wkZlXuIlK9teY6hN482wHMcH7XWhkvQM?=
 =?us-ascii?Q?Y5XniDTz2ncqvuPLtbAfIJd5eCQbsdAceAbtKnYLjqxSDcYGHBcfTJyUzwuI?=
 =?us-ascii?Q?+pRGmnMOnB4nvrxlME9qXAgJqelZOkK1K8iyE/O60RRhmYYc+EH6s+s9BnGZ?=
 =?us-ascii?Q?K2Bemi7VOMUO2gIw9wkZtNIX04hJxbsStosETu+JZ91jhOlcOdXz4zBDPGaj?=
 =?us-ascii?Q?ePRiTKM6Dq0xKUwXT0kJPW74c6LMzTDQ0gQDxzN/u5Ao4sgUcyOrM1Cv9SjT?=
 =?us-ascii?Q?LVxWfyLp0YJH/DL+KdI7e4b7mwDuQ7HCDMKNYPqf5Nm+QZIBKxfi42rIemM4?=
 =?us-ascii?Q?YUgKIMcJOdRfmI44QSWJsTXUCqu/f0kj4UsYB3orYCwPFiI9vxOTha5xU7NB?=
 =?us-ascii?Q?ofNPCubtV8e4xQ7rqvDRgwa0DHfumBJnE0JRoPl6bG6dX+7MxJTgeMZplR/0?=
 =?us-ascii?Q?k+Bjeybj3D1aEZedy95qbLdTzMGpih4uXmzDmakhVmB2lsZ1qckvmS3FniWK?=
 =?us-ascii?Q?1x5Ep00B76syPw2VuCYXvXlLElNwYxxBwf7ISj8CBHkY4OZSwBFz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732beef0-5b3b-440c-3e5b-08dee085aeaa
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 02:23:10.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5+Ohq9QdS/7hVG9YkC6f5nHWC47+N0HsCg6d/TycrnQFyV0ECHR+DTvYadN6U7V6sgL0jQ29WvnIlvsCFLEnDruSqVGCHlU8ABp4cc+pXjglm5GN2cLhwRzBrt8KjBX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7659

From: Chancel Liu <chancel.liu@nxp.com>

Add WM8524 sound card support which connects to SAI1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 4821ac312ab2..089d999196d6 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -30,6 +30,18 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
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
+
 	can_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -110,6 +122,16 @@ linux,cma {
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

