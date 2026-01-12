Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B336A330339
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225502; cv=fail; b=GxwGRWx1JMJfqeL6mbFYsrBQm2eDQKWoplOqlnldUx+X0doqmVYife0Cp20cr1XsMdIOTvTnY8Va97c9w7LdsZ/Ofwr3U3ag9NY8Q7QNfPvYLUO6S5MaB3Iy/34cnVskKOQ6ZvylMrQHaPtnAfKetlUdgIjbCNvUo0wJq1SvdjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225502; c=relaxed/simple;
	bh=vyM1B9pjuN5cGJf0/PGB9KmiBLq7AWErL4gleLNuAuM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oFNmCO6lbTRP+Yy1ihsI9hFW4tdKij+htRPO9a0aD6D7n6p8iA1v7k0RFp1JBVol8qvr/6HPB2CRivzsdWFDiI+upikvygmkovciB4/R1LL1GVvWr4zKg1qDe6qGcWzspHlVJEnebtRQYU82yxN69tQgH18ZASc5RpNF17cybb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L811ku+x; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L811ku+x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEDXjlw7KipBLTA6C1yeHlYN+uj6ep8LHqWuJblEOPXuqssCZHklBvmLMg4BQer6GnblfihBDKPU+vNv47h4rLUssnb52S+S+hiey9ov6RevMaDxlt3G0b38CrhaR3VakTVVtUPUlP8eZU6BvZlXvVCwm02OgmQvqNi/EEBinBJGOZ175I2qVddM6Dyg+P7LEqJrSGhZtZdVyMGY/YgJ9BqIy4ZPccrTj2bX1bJo6UZ/WAMu/JkV11kfarMejO9ReYIiIVTSlch1odTuVr++gUYtSOOsTOGykhvwpoQoUhrKH7rftsoSVddFm89/AFt4UNFQ5F383NR3oOTGWjD6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr33wqQ4+Bh97ylFeVBMzEmMt5UsyZ8Vy5+L1RuLBpA=;
 b=VtUISGfoLuopAN/0q7P9BIFFaZv6lwdFvKJrPDuXqmsYvjVI7ihvFDRDHq5sRrGvDr06FRXsaCj52ES9oYCPuPl7KNUT3gHTVUjFmMzcJ+wE/sBerS6UzhnwEXMnmKtWXWN+BMwuQjrmsbO1gVILQU0E2fb5qXeGcH8X8Qt5h+5S1QhNEcdz13wUhYv8HJ3je5X7fcP0OG8bH+YTBk29AGJ1jr0Ro+ylgXFSzVg/T4E0cm/rvshOPwemsDQ2/8YZurqgnEqPNNec7fRrLs+laounvceo81UJyMv51vOM3iQF9Wret1/MhsqUUcu7lyJFR/Yg2HKVwuyW5U9+6PCebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr33wqQ4+Bh97ylFeVBMzEmMt5UsyZ8Vy5+L1RuLBpA=;
 b=L811ku+xRdGHZHbl25jTj4sNCNkWhM1/e220kJgaMz26F1H0Cek+z2pL7HX/0co6tjqigSH+2GnB8EeMtc7r+6iZ5i2xBbJb3NKH70Pc1z2/Zll/2jXV04r2J/GM15Dc5jJ+aKb78W5G82Zs0WFuJpDVakGMHGMCkXxos6JBDPdgw/zwxm/x1+bVGYepDVUmFXdePeoTp21DfCJQeiyG+nPnxTFG+2vcgc5cHwQSbmEjFyYOx4v9sx+ydTEstJYmv/ZeoC8XK0aVVEWJmP4y2s07ZdQRDfoYXa9jR5acjAp8wxJV6PSrP2LBa1/UgIZd1aKvzO8hZZ+lV6QWkDbH8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:44:55 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 13:44:55 +0000
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
Subject: [PATCH] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Date: Mon, 12 Jan 2026 15:47:12 +0200
Message-ID: <20260112134712.464063-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::17) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 282e9f97-d820-44ed-2a54-08de51e0c52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfiT0o5f6qPZMeLIPsU+BZlC20Y8KI82CLYY2BpfNkAGVWG/zUMqhl6DkmOU?=
 =?us-ascii?Q?PUAVh45xBUFbXA/8THF/Zhr3qIXA76bVYmuQCX99EjPA76PO+BSpz2TGGRVR?=
 =?us-ascii?Q?pzD2mjTqOP71YnL4e7qgaKrFmdt7fkLPMj7XeUzxF2HA6cuvZMHz53hFbLgx?=
 =?us-ascii?Q?Ro67nEfqvYlQFqxdQTk+GdikZ4KyqbPAjNcw6PLae0oCO9CEscwJb6SsR0CQ?=
 =?us-ascii?Q?nLi57xXAz8ovEp3hPZpgG8/CyQW+8p5HCJJXXQhB7Dzy9ZNO6u7gMSQQ6ciO?=
 =?us-ascii?Q?/NiewjVF+r9NzYZmyuInvU9ElklwLqA/naZMZG7g8+hXNJA5duqt4tjND9bf?=
 =?us-ascii?Q?pxLFWUEhHLzrvQtilxFynI6Ecsca8Fv+bi8YUQ/XSRVtJaEUDwZaZ8mN4mu2?=
 =?us-ascii?Q?SYRV0967ftiML1I/RB+pFVqZuSguOTdkvF4JE1+cDWujYXlzB+ZsExEIPbSV?=
 =?us-ascii?Q?gqdn45JNILV+urBfODcJcHGF8IglVDbD2A26gCqf4Nb/2V+MU0eATZmer5WG?=
 =?us-ascii?Q?e6LgJ1U2/sO6CT0/bmNvSwil+s+hXXu8q/vKPEC6gdWplQDT0cVeYdjfIgSA?=
 =?us-ascii?Q?ElE49X4e3lqqO7s6JsqRir+0190BjzNBcryywcORyOsqiyn09CkGWX5kOukW?=
 =?us-ascii?Q?ez0w4YvOn0W1U1WZngP5W4W1MMaRUE4GpBTyEl+odqA4dYieBMt4V1ev0Wxq?=
 =?us-ascii?Q?qrDo8kZIgumZK5Eo1fqRZs7Jxb1AoykQ0ZMgRPWSr3kLoEy7CfmvlPUh7Ytr?=
 =?us-ascii?Q?RUUCtOww0Mpvoy06QMCI+89dlYLtGUI6u6VzCwOEojgDmpDlzDl3z0A+8BaV?=
 =?us-ascii?Q?/OSaNEkdTQCeGgTNAN4He3nYZzAT8YmdvJOm2QLkQeX0rI2CQPY5HvUFMIuI?=
 =?us-ascii?Q?0DM3Tq3LwteefHf7CyYrPFqpUXTy5ToAaiulncySuaFOpCcZZLFqFq22X709?=
 =?us-ascii?Q?5iB0qNpRJdp04XYmcC/OqK85ikFkk2nKEY9bfqSYir5oiX69otiNsYAcopCO?=
 =?us-ascii?Q?o0eqOfLS6LXUNXnEWu+O7OKa3jBkVzDs8P6arcsewoLlAg5tN1oCR7tkOy5q?=
 =?us-ascii?Q?rXY69aHawLwGkHm6R5q9ImIcw0Ju58t3tGV/wSghhHZev1eAUOZFQGSOJ7Bz?=
 =?us-ascii?Q?UVaUCwxIdZSHU6cV4zysjo8UP2eK0e7n+oWLqCABSFm4BZM0Ilo82Kjo2729?=
 =?us-ascii?Q?UPisux4nSGd1mXs8Z/bUun89Boh1JgVcWiCwwVyjHo5rNWAY5Z3aVbaI9j1j?=
 =?us-ascii?Q?wwBqYgMbjo0C7Ox0UHiNHQyLe6xiADOryYwKUDNqT1XBNzCZfZIUz4dd5d3E?=
 =?us-ascii?Q?o4FlabnSCy9gj9/6XECaIxwLzxwPsA/XgcPersCO8o5XaoGud1LeBP1pcy/3?=
 =?us-ascii?Q?SqEqHCFpSbQbDnKJ4ZmCKb8yvYVpT+JvChA8M/Sa/lXcmpg1QAMiJENHPF6A?=
 =?us-ascii?Q?qKwUcBVtwmY4SoWCy5ZIRxvgfIYjdB+EGS+BlOHFtE1kpsY9l7uPjx293Og1?=
 =?us-ascii?Q?AuyOh7Ta81UmH+ECputDubwB6AF4sEtd+DgB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?58US5WRwRoemlgi8r8KM57EoBNedXxM61mToM4XDFaLcfahYpQXU8DYSdqfE?=
 =?us-ascii?Q?ohVU2rPgYv23XzFccqzivOQEDqkVs1wecRchg7ZPaa2txkyohUH48uZuukPL?=
 =?us-ascii?Q?FxpJ7JElx7V8oGZmmqlmudWAgiLdes11+XF+YrXNcW8x7w9HL/Wa0kSa4cEl?=
 =?us-ascii?Q?xeHe8I2BOqGBpX7U1O5XuQnWWl/a5AExJFyrHX5TegNjZ6f9VMkBnJwV6tI2?=
 =?us-ascii?Q?L/z7nthsrKnQXfWJOT8RHTkRLcRnUqvdVAekPSMaihWY1ns1Mx2RufPsmjbW?=
 =?us-ascii?Q?JuoU9D+soyeSCUjwOpDUZ+vfi72amj0B6OHyeKQBs8e2UxaQLh/BA1LJK4HY?=
 =?us-ascii?Q?uYM0W3omWhroRGJW250JISBNP7nd/0MwwORiqZDqyOFk8+bAUenVFLTlS/Ej?=
 =?us-ascii?Q?SOYYU721TXFNtKcNFUSDQhV8l6ODJc2B3Kmd//r3I7orCcT6894vRNh3U1FI?=
 =?us-ascii?Q?FSkVnaQd3PF3LixcOblnz6nEqeAHXSx1yOSlyrrdASsbeam3E5ys+9CK5K2U?=
 =?us-ascii?Q?7TgNLPU2XaPObJjyuUvyB4Eq/I+fKoHNL1tQL3HeIkl+nohecH9wdmY864Ge?=
 =?us-ascii?Q?JHvsTwEE0mS5CIU0dDLMs5RmTOkKaifPKW1Uv06OWqwMnLPorEUpUL2iFJNI?=
 =?us-ascii?Q?YtZRM/awRXDkUQ+gyu7uj8siSy8aPCpRK2mMfQMaWohmnt5bV+6zxEA9AkV2?=
 =?us-ascii?Q?OcJw+RECUWozeCYUFceMmT6cHNz06iaT/NmhdwtF9bbFDfixTACYkWlBDvDw?=
 =?us-ascii?Q?88MPnoc0oMyTui4UdmsutXR2kYXqbEGFjqioN/82LJr+13nJoEvBZ3LT7nZo?=
 =?us-ascii?Q?XS3K0oVGTZ1OLiOynxcSTtWALDOPSWEsDWWRGL1poxLFe5GVbnSuKGWq9XCs?=
 =?us-ascii?Q?n0JfqJ+qyve3qoGA8LoahYGDywF07/nWyjXYzbEPNofESDmgZcnTTFLf93Uq?=
 =?us-ascii?Q?UHv0ajS8nKRZ5LHzJ4zIRSDQM+0X/UaPt7viPO5p03UhDSKM+u2ZQ2ft4eDx?=
 =?us-ascii?Q?td2aCcprDlT6tBjwMhoR+n8Q3F5PxhcGoYDVlt1G5dpIvachrzELfVNrKqLR?=
 =?us-ascii?Q?9/Oogs60FNIZ9quR65roBpAB6WjuMFGO9+r1B1aT9rdZXC330Bwmp1qLdI3L?=
 =?us-ascii?Q?VkcA44bo2qKEkVcSz3iIoBA/HIVpOyNwejwA7Cy3+zaI5SEZJ3oaWCjTR3jx?=
 =?us-ascii?Q?/2Z8C1dUEl27+A7YKyVp2bAl0ChVYRxQYey42AERhVcO3vq1athz+OE6qSUk?=
 =?us-ascii?Q?qhyD5cNBkPkX4+byF+fepQK3X/SanrIjgv2sAhAp06DI4BLL5oAGIwXWHDQ3?=
 =?us-ascii?Q?G7qA8YI2K7P12hC6l0W46Gpx4Ul5geC5mHvLYwbJ+D5aEDXZJfVB1VA5YrtY?=
 =?us-ascii?Q?szyoHQ/buxO3rdPYTo87Ern9DJf1ZAJqFeRxY6Q+MjC0Q1k+ERED/SSIqkGr?=
 =?us-ascii?Q?j4F1nCTK73hCfv0xGdfK4cT5q6wzLJZVkTs1DROHw1LbqwNMLV2P+dakE6Gu?=
 =?us-ascii?Q?1DN8Jez9iyeP3R2yn7D0sa4IgCDgKBsoI8aLpS5uhjeTFUfVZOA3Fg7mcnYZ?=
 =?us-ascii?Q?/44ykL+WeTKSwsgebG67cS6x1NptahPW/sDm7PZyH1AeEHxuFS5MP9fhq0B3?=
 =?us-ascii?Q?1J4jPiI76dV/7Uw68vxdQuL1rjrYBI2HuupmmgXb34DUokA2/GdXNdwq7mL9?=
 =?us-ascii?Q?9wDmCM/NlggNxQnmEWk4FJRIHWN6nTQHbZqt1SRQxDIJagjTzq6j9Tg68GeL?=
 =?us-ascii?Q?/fIKL7N+ow=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282e9f97-d820-44ed-2a54-08de51e0c52d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:44:55.7463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Zr7vIJr29K+YdpxjSv5JMx571tkNNbKqUDx3n8AownVer1OPqiswnP8v+UAUHchPqTGvOyZrtt2X7dnQW+mtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
by adding sound card description and enabling SAI1 and MQS dts nodes,
together with necessary clocks and pinmux.

This supports audio playback via SAI1 DAI which is connected to the MQS1
block.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
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

