Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CDD2949E0
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538038; cv=fail; b=spMeqlv3N0h7eTWhJ7ARJ12ScZIcM0yHZUpJ86wAIcvHs5Fg9I7geMq1EauqAxUUVW1+osouBf7rkvEPkpl37PFik3p31jAWTVUvfypN2diG3YsjbpK0VLgCPl7UwW6urnRppPF8aiocSvMDn1TVcQS2DAELiJ7SGmpyrwwt3Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538038; c=relaxed/simple;
	bh=d520ByD3Xh0M/d4rUNXBmFI/CHjulum4cqHM1qIQxPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fp8iYDnvp+n/95tMp3bEtWtb63YRgCz5OB1aAkHlUvlPv0/ZDDvqcZkteUcPLIOjkE6MFTf2g+cDlPrk9a40noWYeRhTexLX3IYmN5zbwwchTm6OIwEhdVrfmEMXjdFCXSNAuNejuASI78AB1PqPKZ5ZpiuNiwSEB5Njb7E/RLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h8UIT4Zd; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h8UIT4Zd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IV3YLCXx4GMyn2QNZBq+/mCHzFD7e5X5cXUvhbCYyRGkIw2kSHRdbz78mcWzPibB5lNkOiQqQ7BBEYhycCBosF8gxcve6NliMR0/Eh3hErWj2mMI88TjGRuf1EMkdaMcgO5nbEUTavz4X6sk27lkOKfvLCKuQWZ9Kj7qgw13f8h0F/14CyxNVglqk6p25SjuXGwKBrvMZbVmKrfr/5SMq0DygjzibL1O2lAIQJVHs1TzTh5Ijn3d8YI5By+TA2xGbBuSc+e5/DMRTHTF8L9EC64FN4Gfb2GEl14/B7leFN2LdEp9ENwn0Tp8C2ySw7lVA9UwswdW8XkY01qdR5rT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtwS3Bz1RPsLgJwOLtHA+Vnz3bbAlPszH69dAtybazI=;
 b=f6lzize5j01fG+MIWYcM8qZqgGC4eN2Jv2yNyJk5Ubvy6b8FcP1a/r+0VUzPFfAO/G+Isqq7AVqPESuH3ME3OQaUwBPIwwTRJY9eC0/tWfjXRMyQwlbRl41MdGAjF/1Y/+ZMIuz8yFn6ourm+tkfNeGXQjZxPBZO3AerhkQExiXYLqWLLfFUrWDOLPADH1TasSsR3FTsMGOoE2g0JPhEfjrKbrS7Ie2iYuvbGD7UHl3zrQbQZ8mA6znR4XItpt/x+x5ZH8XB8f/MaCkpGLM7y60DI0KBJyiGenv5XbRfo+zCOKUCwDFyq2GC4qBphVBo1Qx1jrSkAv8BwaOG1rsvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtwS3Bz1RPsLgJwOLtHA+Vnz3bbAlPszH69dAtybazI=;
 b=h8UIT4ZdKIedhhFPIvXf5V6kZAkwg2QgQgBJGj0GgmUh4FODUiZGfAcxOmmFlRQv/3Xjh8Fl+GntTA1NevMby0lECsve2bWcJ5vTVZK8ehgANhrI1ayMSnDQEJ2T0KYJJ01VLH3ViFBUQ/UBn3P2xkd96E96jmfktd9y9ufSOD4jP/6GB6+4MjKhfCXU9wLUdiS9026xDw0tJhk0xJC0PAr8TqrbANtjyCUn8HejJuTFZbUnGD2SqL8RRo5wMp4Ftyrz6DwHlEZ/NR+Ko1bxCatIz8ubQgisY+62y89g2NfmsLGhW5FCm/ppz78oy+TFkM7t/yVEjI3Hrv6PMWpcfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:20:33 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:20:33 +0000
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
Subject: [PATCH v3 01/17] arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
Date: Mon, 24 Aug 2026 11:20:04 +0900
Message-ID: <20260824022020.2812810-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d80f16-d094-4239-40ee-08df01864680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K7bG9HIGQ1v6sT9L739RpVRrGBOwvHSPV7FHsrjUSVFwgWdgRzUWXeY+sicX2OVkcFeNEC/AXV0Nj5v2BjCCXBXLD3qAX96hlLiDJ6RU/8+k3zTHEqzx92BtHjvOunJ3V0uMMPda4D7j/f5X8f5adsD2nErtEKC2GW1ZWmQ6gcgt3ITEgUGc3Vp1NgLEvvFS/OaS+SGyl05gZ2mrQorwBIeqhx/j5H5ihb0fSXpDpwmVfh8iclojaI+tUw+5uMkg8KeFAhna/NBKHPpIgZiMP/8S1dqsPblSFpMHWu9++C5kRTZDbiHukc7zYjpRg1s+SxLwWrowHkZqId4JsHdMucS62KLTlUqcR0cN2gz8bBRdQHbuS7Wz3qIaAP4+abIdfAYZQoEkJiKAT1oQ7cmhq/acrm4pPK6aCqcA3SMwD4jwebdGjzYvaZ4kcT0O8PKNjXr0yKXSoo+i0T1DNj8HChW3iA93mOInDNYqlA1zo7za0Sruo88NNuVZ9wwZ+raFIMYw+B2hgIcSdQp+259IRaCXYe0lojpCsAyuoQUVCENN9VF9Lw+fxQ7H9jekD4wfNtDU2wca1c72V1y0qMha35t+Ibk7eu2D3L/Cr/SX/6UcS1TVdoNIcG8h9sJIttu+fv7GI/5ST2eLSa8vPXtgjNiDg4yKBTi6HZMnlso1PmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?teyK9MbKBrxiM2oiE5IDC3rjc/jAPBbY1JnNZzghMKHWkhxU9FP2osUnPEiH?=
 =?us-ascii?Q?1g2zWYpAMKOPwrPNgHmY1rggLHwhqJs5LrigmO93SfvCqcpxEOdarvFZSw2h?=
 =?us-ascii?Q?+G0ji7WnTj7s65SV3pAxp2jRXmPWp5vadzwdBPc5D9JJJKm9dxBYrfHWUT0k?=
 =?us-ascii?Q?xZZrSVQo3r1O3aoHn0tZuMfZu6mqpnNPPqheTkAyjmfYhCex1tJSieN3r7xR?=
 =?us-ascii?Q?0FxKVr6swYztXxqzlbsCL1zY+2SwtovdvxgLRjivL5YSmWjglgrZiiaIOkRz?=
 =?us-ascii?Q?HSLST9iKiLG24lQrylDwdNNv5uq5r27d2MDVhDi4jIjIIZT8Y4gdekKlZ9Zm?=
 =?us-ascii?Q?reQRkHuv3aa1xhdhNTjbmAV5LiFKly51Rrdc6kI2R1P/VXyPG/axzJ0BihGC?=
 =?us-ascii?Q?a0C3weue+Rq52BSzNCEnCRepAgzF+pxNYKC7sTR+6BEec6gFb95EFg0NTCIB?=
 =?us-ascii?Q?YMmU+QNvxHXONcZschJsnrvdRheYDpWfWgpLoRU7KbtfDXHJnZ08/xM+iZO2?=
 =?us-ascii?Q?rNQBBlcoCvhjFCDsCBj41oswBKH7MWO/GFemStTxkY4g7JO1rnKWfnOEcuC3?=
 =?us-ascii?Q?7qDrhYv4vcIbz8GHt8HFYAEHRJBgKYP8xwH9J8C7tSqqiGAvLZz7EDo7jz7m?=
 =?us-ascii?Q?nLh+oRE5LkiJFpPoJ0+FASfsg5HkkjGU2I8YzajcCM+RxL0Ex76Ktb5ruQO8?=
 =?us-ascii?Q?WyyZ/ZDvZpO2a/yBI5maZ74hu1L3MK3TTKLquekaYNuFjuoq8Avfr4WNl30m?=
 =?us-ascii?Q?OcT4X4s4GrX1bvbTkplTos+lw6EfnAvH7+qHQ6fCgwvByJUoQNEAVzCf0zcP?=
 =?us-ascii?Q?/8whLDsekd+slWXaP3O3mD5mBUELlf169AAUqglimLMKt/z2+RGK059yTotY?=
 =?us-ascii?Q?qKIC07Pq3yVNWJP+3mxhlWFI+7RWMAj+k8BepCy8+PPFkg6tGhyPbzYcgidd?=
 =?us-ascii?Q?IcAaBr0t/EbS0DacAcsDANv3BRyQw96nrYoa4G7eFrTH5u+iQR158c6u5BYp?=
 =?us-ascii?Q?BC9xYoyR99trFqOCtbz+TALWsNHPPZ3JagGjuEOZ9kKWrHa3EQVH4QutR3r3?=
 =?us-ascii?Q?NU98TnrWxWZzznyCRzgXSOb3UZTz64VFCbmlbYkaQh+DTmvkWfTkOM6asTNF?=
 =?us-ascii?Q?iclHJFYQbPn++8jDS2+qIuRvrLQ8R5soTKKP6NIpgXreF7I0HKirZ/s+Sfk/?=
 =?us-ascii?Q?l7UmtDbr3NVhGYTb6waKyLmb/vcdotT7Gp4NNygCzmo5KOJPNC5U+4VlRIgn?=
 =?us-ascii?Q?gQFmj/x68zGh5VyI3Nr7Qh9iJuMy/osctqpH6YuLBA+iLNDrgjdtzfeQ4Cwq?=
 =?us-ascii?Q?CwUJ3SWUpAVq9argLd+3H6thd7c+UxoSIcjUkWtJsLJ75IrP/8DP5TPfkuyY?=
 =?us-ascii?Q?wV432We2i8eU+2puSjr29BR651NHPqfQCkzg+mkxHxBXcrXgpfCU9DsH7Xvc?=
 =?us-ascii?Q?nIYgK3mBLvQ1N4wLFrxbZ1WRNUl0WWQWD2sATk0eEVdaRUyRPPNkIuHikt8e?=
 =?us-ascii?Q?6baPbzmK1Ci1OkjD7RBqe+yHd8BzmQ5IqvHUklwMBYURoWe1wfQIff1CZ8xf?=
 =?us-ascii?Q?PmzbxxVZSqrI34QIj/aVmVLNg/o4+cvr0Ce1zXef/IpYJFnNiC0xdCbOXuGk?=
 =?us-ascii?Q?lc/Q7C5fqtZQmsalAp4K0TOr9Q7sD/OznkisohtwKBipmjd6oSkwEAFE5Ly/?=
 =?us-ascii?Q?U5QNSjcfMykrY5CYe3RjJA56uUCWxrsAPy2ZIJhfDd03XpNOsYrUCeNt5Q4O?=
 =?us-ascii?Q?01H4lP4tTJIi7rbr3QC8z+ImZ8+MhiUq4zS4RcAq0OYtXdRjZNkt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d80f16-d094-4239-40ee-08df01864680
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:20:33.1591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja/9va6moGkaqNeBx7+PoTJfupEXpseDSJRAInIM2ygCvhs1yyM4ASArxdMO3rgHysSL6g16B0vhzDLPRiSEQ4aiM+25pVocS9zQdfIc0LYLafkEujd65GzOVXqBGTed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

The "mclk" clock provides the MQS oversampling clock, and #sound-dai-cells
describes the node as an ASoC DAI provider. Both are fixed SoC integration
properties rather than board specific, so add them here in the common dtsi
instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts | 2 --
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts   | 2 --
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi   | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts   | 2 --
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
index 62dc1dedfb0e..c6019d76b998 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
@@ -672,8 +672,6 @@ &media_blk_ctrl {
 };
 
 &mqs1 {
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index c25561574d3f..6144fa6f3706 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -468,8 +468,6 @@ bluetooth {
 };
 
 &mqs1 {
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..a68ffd04ee08 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -100,13 +100,19 @@ gic: interrupt-controller@48000000 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS1_GATE>;
+		clock-names = "mclk";
 		gpr = <&aonmix_ns_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
 	mqs2: mqs2 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS2_GATE>;
+		clock-names = "mclk";
 		gpr = <&wakeupmix_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c..038e5ed23e5f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -400,8 +400,6 @@ bluetooth {
 &mqs1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mqs1>;
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	status = "okay";
 };
 
-- 
2.50.1

