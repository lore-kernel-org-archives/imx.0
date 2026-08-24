Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1E34D4CE
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538051; cv=fail; b=lA2Bl7dFSNGrK0WbTsT0lkQtg8u+yNOeg9LlFbuvR8iQsL56L2tI0InxzrHMsRsbPAafPARM9Wb5ZPpGcExpvrsmVkohC3gqz8yJ8c/42Zv1D8py3zCIalbvrvg2KiM2Ib6uZDqQD//kPg27S1orQFDz9HwSEyOkOOrw+88qGpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538051; c=relaxed/simple;
	bh=UDvGEYJTH2rEr7v1+5I0Gc/RSBDWKU+iI9IE544DMns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pl2pJ2BupoW1t+Wt0DbQYhf2Kd6Qi6qOyui7zYevKXdPHU+THJVCsE1UO+80CDL+ZF5rA97smvWALY7ebJzp9V0KyTeIXZdH2omTFADmge2ebdJfLaqwxcBGmp7TnYdkjY4mdXIuB2FHhMyiY5tssSpZpawx+T+2MeYTuBhrmrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YpsCVBbD; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YpsCVBbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwvRQqoKHhdISZ6NILx7msLUzAiyz11CgfUXdJMaNs30pYkRhHc9T0eqGBRbecvJBpGT/3kKanbtkGMPplZhoSn2G6wQKKoOecQd3de/0kt9PPQykHaSTDhrkpPCDhsC3c38MfocBueJW2WllrWZj7V+ezMB/PzX662DQhe2kQa3vrGQHsoG8qizLungKnWtuzliwqB15g4cvoKLrZgBBMKPOmd+XFRmCB/WxcnIAbVZf3wrlyiClGpjyZ7zsHxVxoNlkmhrbEUsEvXmFgg+6hxw4p3EosmvIcjODQMM1pHvCzUm4z7Zf9uSsU2bMlk/QaP0xquNpeaUgRJQlf7s8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYTSqBOTGqma+/XHIJ+VGDk/jGdiRJ6N3+dKPiwMQZk=;
 b=NlxwmsxtAX3FOvM3R59/rBD2Ay1EQKpkyIjBushVbAPM36j0HnuoD652oS6BTHnA37BzKvOdH3o9gJYNCendfDPH9PaPwOfxVyWoYsS3S+POcUa4/c4MVbNcQytYwqitB8hTqG6EN60+Yjc+3i0O+f8S5YkFajYruAn/KsB4AyJvog9bHzLUrOEI9GF5iSYkzsh92XATVdV1ADhH7mZRjqdFPnp67PaX/ipoqIYSa8XTiFEUiPtEzazMt1M84Getg/5eLyDnVdunZL4S4dAYV9odTkBtlQEkv3qP1Gt3HmU/CmlOGr0smg30yehbQKSFgkKBnSmuJPmOBMArw4JFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYTSqBOTGqma+/XHIJ+VGDk/jGdiRJ6N3+dKPiwMQZk=;
 b=YpsCVBbDLxC6nsCxUkW5v6idIpCyOeHhDCrbJsX4kvDoSTUsz92mOyVZ3kvGuswqFrCet6tt3pFYBmw7mOoPlFnFd6iCgyle7qvHJ+0y+AsmCnk9Tpqo3GlUeRDwJO7pZAlzfwGawwa5BG/eVYah2knhgjDwIW6n8aKySGrO7DUnPgToTgOhZ5BHTuuVSA+WJK6JLJlU06mSlv5dQ2llpVlN+Ts5Di1UnlMDMFARkPUo2BrWbIe+OIQRuy/Xp6urDQoGs0NtgHkDcYe3De7o54tTrBM48BmOvXLN9ld/U11goySPIUMOoc8EvG4hTT3a+3WED2zk2+W06+E8p1DOVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:20:46 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:20:46 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/17] arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:06 +0900
Message-ID: <20260824022020.2812810-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0087.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 86597e41-0d03-4317-2595-08df01864e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ADKbjfJd0Kta9FQtpjgJwTqiDgTJAXOzcSCTNdHFK2Y7uKPS8R/3rkKHF4ltb5+vYir+X7s8eqzSxIjIa1GcMgUruNsgUhePMVYK4okW0tubeV6ujaa+DW15/5o5yv/VuenkTJNfBraquXZKrmXf5/6SSNq8GlgeBb7ubVLdbQKNWadkLc2mol/Cps1w8nry0fZFbyXgFggPxEUY6uSNezmS+NYtB1TfvxV0dkphlX3szNiry/LNR6mceY4hjAo50svJWEU3qNKvBjrNCpNWJnGG+qsHQywTvcL1ef0iwtQPnGsiDxfDSq2wEoFbWRxc8OzVGf/OvFLxFzwmBpFyDbsVFZ062M/0LEtGyby174tWMjS5W3psTSeNXg52P9GiLJDJluNdxBub4FGfzKMZiSC+fI2snQu+KZa3ZAgDBbDYWdNWh2YZPrqWS6qPmuqkLclTBU+oE9P7a16VQp162voTqVecn38LuY89vvzTa01QuUU63PI9Nwz858nx2C6fyuyI0+OxB0Q/o+HQHcek5FsXmXUurOKQGXmJ7OAw6tcwDmt86c8zSoktat3pnyQN/T87a3HVDbiOAFuAOts6NiKByb5VyKKsIZIX7TvFgsEtG63KtJSHzxF0ZnUFU/94ELw6Kjjr+h0sC3S5h8wF2bsG9VUDLdMq3oWDtGeUOKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?31rUoNtPHb0emPXUFmAbC3FeuhlP1IfwBMACZ8c0L3VChJLsoZMAzDZGYU2a?=
 =?us-ascii?Q?YTpzuzNxcOfEBfWMTzwJThaMnpM4aAqxItXylmqawhMl4i70j4aMbA+qBfbQ?=
 =?us-ascii?Q?vRWmh1TF5ZX8yEZT5v7pG95+fyOc+cFJl9z8TqGO+X/aJLEpjrcYGCCqGyvD?=
 =?us-ascii?Q?QUykitJiS5OrAKRi34M30TpTFqzJqYSRnzoUXB1+6+ySmuv8XU57lrM/9Pvw?=
 =?us-ascii?Q?orLQwdd6viNMXXYXzna9ZKrdyYIj05a/+gt2bO30p/m7yyrTuiU4FHmtFlmU?=
 =?us-ascii?Q?F5yqfXVcF6xwlqpiFQH/0OpldPjRV1Tso6tfI3IPXKN7KifkUEOkjBrq+wqV?=
 =?us-ascii?Q?xWdncfS+Pn1e3EjnH/RAtw9jxXONuF5EnomJ3sHu+nUTJTtdsQt8M1DXopuA?=
 =?us-ascii?Q?wEy8iQ9e5FzHtJSkvBz9AvtLZDjWmzCyvhS0DwytGEMoYJZi5OmQms+0hhot?=
 =?us-ascii?Q?eoS4z21XBnWh2m6ej41w6GgKVSNXjiZ5KYR1auxc9Jz+5tXJxMxG6w6SGDzX?=
 =?us-ascii?Q?BbWpGLZ6aSPPIsBK2Kv/bBhaYzI+/Z6Nq2Y+zJLVaVcaRWLFHHUb8EJ81n9i?=
 =?us-ascii?Q?PQw2pAA03hSiVZ4g2a0Y8PaMGzKacA4JqJQbcvf0rnHXvYWgUHcmmhpq/0z2?=
 =?us-ascii?Q?E+GWwk+TUgk05TIbwlFMHz+xKyn2e4ITIXZQY3h718lX+lgMBYDCYVMsuIzK?=
 =?us-ascii?Q?owq0idIUSCyHXgL8SrK4c00qSzzQk7Q9xladlZpehR0tke0aYVQWb23c5on3?=
 =?us-ascii?Q?imIM9l03zzVcbx1AaV0qg4+c8qzbeMchl7MEAWoLKetb/I4LtvNzjak5hOdm?=
 =?us-ascii?Q?oDlGh1/Vw9MgnBMlrHoya3aFyXt+CZvrUzOMMNOWOO/dGxjFah/tFWLoY2xj?=
 =?us-ascii?Q?Xs4wTEdFJsaTDLlyX1PTz0rz/Msb62/3TdB86O4KFdDgCW7ihQhGRFw3rPWJ?=
 =?us-ascii?Q?GJILyztDquZcb1QL9t66/qFv3W7xWIUcFet4Wul8vyd+2AO7LLuRiXFpD6Rp?=
 =?us-ascii?Q?GmxH9jbVExW9rIHtAtS5FKzCM4BVMojAuav9tnKruSjwVXrJgR+35g2z6NOK?=
 =?us-ascii?Q?m8jvdNJntXuOLZ4wWyw5z7Af9Lio8nQCRZdvrQ+1HDgE8MbG6qRTeU18Oi9F?=
 =?us-ascii?Q?+QjAspQ9ARKA6BJpsJr5EaAbS6Fo9N9VlpBOsP2DuRc9wU/kmWFf9p6sAg41?=
 =?us-ascii?Q?ku2ioD+GwLjupqH72urht7ZBy5pHuh1HVNlZhf/2pokiQ/cwscmxaSjJVsb/?=
 =?us-ascii?Q?DOuuW73W2ysLx73KNF9jNlThsdfPa3Fs87t2M2+wSj0qEmvAIOZ1OpajyS1J?=
 =?us-ascii?Q?j77tssowhXG8nsPWV2EJEbJBUfIrwSKRT1OC/axqRVpmtB0mtqMQK3gPuWWJ?=
 =?us-ascii?Q?hRkCYaCROApx4qJ3b7h7z99nZpNwc+NpB0TTFPtkUGh5FUQFp3bROm1DafXW?=
 =?us-ascii?Q?Tu84nx5jLjpo5Q1KkkiM1HJboFfZvnURQsxv145rE6WlqtpMazl9Ywhw8zUX?=
 =?us-ascii?Q?qO1Kw4RWfRPhhKMfeyUEohn9X3a9zzRIdmQRaVnPepX2jmkZGqhuOP37FTQV?=
 =?us-ascii?Q?Er/QPejRCHO2MLQ4bSLo7dNY6+gtCAvSkHViuJ/ITbxc7nbmmN8dtBSkm1OT?=
 =?us-ascii?Q?WWbitbNjfCVBjFNp5rwppSMQP5o29VKvTJb5OvYhhaUDZttyC03fxlIVbEkP?=
 =?us-ascii?Q?xSiHkL012IMYPdIFtJtCjjootqA04KwnpsicGjHd5hu/f72CFW4+ft1YNyu1?=
 =?us-ascii?Q?EQ1fw79FKG4qHpSxhzon9Z0gxRDz2Px9Cp2YVBhVwtXT9+8hyIE3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86597e41-0d03-4317-2595-08df01864e78
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:20:46.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJnBP5sHFG9QSCK51iG4N70Jtf90MnmIv3iBn7lllFTvIj9aO+i+k83pSjOljlWpO3MPnFHWA819mQCusUm0eeV1nhGYqYuDmj4wbSR+ZQ64zFfeeR1xRUH/Rz1Rc5q1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 4d1ada6a3942..6ccb942786c3 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -32,6 +32,12 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	amp_mqs1: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "MQS AMP";
+		VCC-supply = <&reg_3p3v>;
+	};
+
 	bt_sco_codec: bt-sco-codec {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -60,6 +66,13 @@ pdm_fun: pdm-grp {
 		};
 	};
 
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
@@ -145,7 +158,7 @@ sound-wm8962 {
 			"IN1R", "AMIC";
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -501,7 +514,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -511,10 +524,19 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+	pinctrl-names = "default";
+};
+
 &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
 	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -720,6 +742,13 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX91_PAD_PDM_CLK__PDM_CLK			0x31e
-- 
2.50.1

