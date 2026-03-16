Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F3E282F27
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627005; cv=fail; b=QGsitTlSPfbqXECBkLHMrlU6uRhCdH6vZZHhVwu01kuagflT7zZR/an8u8JkIYUlnJZBrei/NIpRbGd+e+oqZyMSgWCauHhG6NLl+GLBti7RcsIC8n/Y6hyvAvlhaKMv3zxqUw4kx63xwjk50m+aoDnuZ7mVa4I6JeNEwVC5eA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627005; c=relaxed/simple;
	bh=tIM15A9/R5ADumwVSnW5ggD9uSwTmD4P6tX49y1n0Sw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fjBOfjkGRHf/D/ykGAM93YrYnJryG/ndTHO9V4NbsCKm2sFA/F7R8665p2TGxwgtAjVrTLcnr4Vg9MCzsHPm7wjOXYLRpafICqq8Eiqmx1CSVfYQw9yY9MiwvQw0wpCzZrKQRYKt5e6P95BJ5ROOSvUP4JS0j1gOLiPFQ6aBGG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JVONWzFR; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JVONWzFR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUSyXlQV3sxiqIsrxS0Wz3W3vZB21/riizYVcxL3NkCHrTLge8EzYO3UXhzYWD88NZ/Mzgxy+Ecupp3L06Uk5E5yBFv5l7OSUyzzTJ2yh2Iz5JjxiGo3oF+a+cRWO3kH+LayvwCB69ecEwFrWuWhG6kHSPYNl1lg6/NOyGJB+O0nU4XVR6j+Crv3WOPWvEcwoJc3FsXEo0opc7cxgeDPqH0CP4kqLV1q29rHKz0YEMenEx6zj/itK2hRN9gbHoJqXVWwBVTsprV4cZi5j+sc+S0WTvkizQOctagZt3XvDsynvMDqhHVoksnopI9AqormjOG4jg2rY+8la6tbbFgcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm7983Vx+I/rz1b0nuyZknBV0mAjim8Nbns0jUCasZw=;
 b=Un84/E/S2yBmwBAAgaeQRV5Zdjyq/wHBW0dFZVjfsWKkM8aw/DUVTkSHmHTsZBZDJGnj2BrutLbNQdQ13eOUZCqmfBaOoXEFOeBkcJoPChWoYzPYYOchyeWUZ9i+b8+ZC0uRR9GQsm6hwbx14nCTSo9LIbgjhq7BWFPKzHigJXGPN4Ryr6D5UPVanh0Ow9IiJETojSQMxRYZjMP5kZlwLtvkDgeK6s1xOH0LQBvn3v1ZOLULudjTLdcQJw3Gc2lnaDut5CIWO7FdFdBauQL2TRkE+eNpMPvzuuTt5ioArQbC+NWCTa6wK8wmIT+TQjZVxJFaMAnjSe2eUX+VdKHLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm7983Vx+I/rz1b0nuyZknBV0mAjim8Nbns0jUCasZw=;
 b=JVONWzFRCivOQvO6Y47AbPeW8T5lBAvcwBOhgvo2UztEuWLdcmDEFD3NkbpNDzBhX4PUFw0MqxRhXrxAzbLykgwX2MJkOwWRAeaXonN+0kbCJKzSNUrtNMqx3wytkUCMEYwtWPdVJbXq0qJ58yFFFlUrEQBLoGtiDfmp26srtUf99glXja7Gmbw/bfh2YQMJIhsZoulNsadAL9Ell/wMMosanwEHFX/22UPXwUWOgxMA+au5DO2RBNwn+6/qeyk5nZ3DCa0H9yDj2zZfEMzfRsZR1O5pzHo9qNcDC51TIkTACqCzkZRGawE0wDUxx/nriXQQBGua2He/5AyPg2YGpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:09:34 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 02:10:01 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
Date: Mon, 16 Mar 2026 10:14:37 +0800
Message-Id: <20260316021439.2971610-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
References: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d451ed-4e58-4b9d-be64-08de83012168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	pxs7Gvr8KiY5uUPM7Sj8913Qk55NmaWJnTAmUr2JYwdX61VzklvapDGWZ4tUOgLEnjuibTmTKbmkCWHjFgRycEyUhAfmzWQ8fk5vy0aa0Mdwpl1cnlXNfOdPBAnaRvA5Dx0S4+LMCdSFJnvqTgH4+MY2rK7YDy9Pal6J8/Kg7YZR5wy6s64/65lfIYwB4XdOyFiZEw9wY6AkXR6COhVwWwj3XYa4dDeOY0uwuVm2ejoaXiZsz+GgoDaUGAuUNjUbxU5mXewUcHPxPBhoNxHYl3ljz/zfasJcm47y1sqybavqKrumxx88PIHiduf+RJhsJXXo5sfVq2/wgcZCVKwFobULbBbze4x6oMbofJvyvapEFBaEOhP5CyfDi7HVcCj4Cv/41ftsgv/2LGnn81XH2z/l/mu3NAAicD2HsddPfLZ7W1fINA+WerL8rq1mDUfuOCV+j3lXWooDUq6fAcqymALakBlwyjR2T5lG16TV5PaP3zfo7/tJdjACQxqjqjIVk2afGzPDWfjMpZW0zd90jKqgqv4CH2QHoZ5bAcTP58AZyN1Uo5VSqsYZE6tj3gyE9ROM0zihIXBgBqzYNG+8Gu+iZVLgoGK7JoDCO5IrXlqsCmzB1IfeEchRUfuDSezhU8lX1MFTgvJaE86XdgJhSQrbE8i3jONTofupEty9RCaM37DyL+wK2pHhIMFk1OFoNDzNr+Ux6OMb0pYgkaqtJoQmXY0vZnHlyxj09gFVKzPdVP+TqYoZTA9jcEto6fXMe8jRlRjMm6JllIKghDPUNGmBrcDa/MT4tVlPcbaUzK52Cg0OxeEj0GMRJwcaowhs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9brkxtv+yRBBzxUDVoGyh1l7StLWSRAWeiG3VRKoK7mW9sOrxPNQgd4CzZlp?=
 =?us-ascii?Q?QGBlY9TBzJoSN5ovbqdp7aczrhMUo7GvXpLBuHq6+pKJ7o9x0BFPurz6a3Yf?=
 =?us-ascii?Q?g+i7LMgnfnjr5y1SB7+IsOJSgwjDfB/mIu8FtOCRIdT+9fdBXtp6OjD3fBeA?=
 =?us-ascii?Q?XakCfvtmF1S5VmVxzf3Vbiq6jy9yFI4Z5BeFf927Q9b6DCIrEXHbqRhMoygA?=
 =?us-ascii?Q?0NTstWP+wm1mf4Tijs/6UkXfjtNPHHw9qHUYbbbGGC8qg6yEIF+K/qaIINF3?=
 =?us-ascii?Q?+oVxTh96BbUJ59p2x719KC2ZocGE9VERDhJvT3HzTKAYtr3AmEXhst+Pbih6?=
 =?us-ascii?Q?AC9hhRV+Tg4lRCjIuhpNGCtYw3I+nC3qZwVwBk5rMUdV3hsVAP5vrE5htlQ8?=
 =?us-ascii?Q?Aqa86LcrCjhUNlhPg4gCOQoZt9Y1aKx5ztG3mMQmV3Nr5qlIMh21ixPHSJFP?=
 =?us-ascii?Q?0AUlDnb+dupvTuavzAQ5Yf40jtTmxSJ4Oc8YmEL5RzpeqYUjPL5kFv/9tOsG?=
 =?us-ascii?Q?Fbt8VsoXFTVtAxRmMZBsJRduyF/hfY8yGSx8Mj/5GDm8RJb4H3gh0j5XQIVo?=
 =?us-ascii?Q?NLF+e9R0GvzAIsvWLjNuKxIUPpzTPmPEJySlsQdZLawLRYF3BFHToVX0KjdN?=
 =?us-ascii?Q?L80gib9gQvfN5cmEGISaZoK9egSGV3nfS4f6u3GyiGobVQBkNU/6NyV1z4XH?=
 =?us-ascii?Q?YI4YamvOLNyqNaATsouPYJDr1eVTM1ZpnLXLvmk5jLvZLB2wJcU+3pnGgDzD?=
 =?us-ascii?Q?QGvBPnBsmjPBizJ1tJEPbI0l/hemfEHl1VpbJtD1XZ29bCA1eHIDFiTdvL/o?=
 =?us-ascii?Q?f+TEv1mJXleYDaHBpocScom/32pi82zWMkpNYSJNALpTHKf2bzKeD79kQdZv?=
 =?us-ascii?Q?TZ7bBsmlP0Y+v2pJfz/Yi+IiEG28cuGAP5DuINX1rKE+yQpxl9xNMDeeXziz?=
 =?us-ascii?Q?vJ9gKd7FaxtnFYFKPkgmnvRUQ3NnhOiW+NnNyhsv+Shup1lpgQHJeSvyRGN8?=
 =?us-ascii?Q?8KNtSIB60osmt72+fWOoTLjd1E9PvztQYSWpqBlTXFAW1rOhCuEgMFBi5xEg?=
 =?us-ascii?Q?/2Nv/Mvk/hleJzQb8eUkKyfbRjM3DfUeiU9whb71B5hhJBRt02Gu7Ghaa3vg?=
 =?us-ascii?Q?+qtX4GGhri2aQARJhBVi52W4RlnSjN+7WZah5Pb+0n5XasHDhQRsMmIpHaMB?=
 =?us-ascii?Q?X63kTh2Ru/ys01epALe6Rv3wUCWgO/Pfjpe6+gUhozrxsv3BVdYN4IU+fS7C?=
 =?us-ascii?Q?ZikgrLg8NRwWvCa7JavJRLRnnnk0qGwuQBwOFHAMNC1FRW0Mld71Qe3uTpxc?=
 =?us-ascii?Q?0/xa0TVKbZOsO/AmYqnPVgItJz3MShAmoAN/PCDsbI7JniXmLQ2tvjd4IoaJ?=
 =?us-ascii?Q?Yh74gFImXEv4PnvZGq0FOaVmWAg96BrcHleqHV3RdbjFCsPznsHBLrvam2mW?=
 =?us-ascii?Q?d18zXxrR/cmjgoeC0oLw+otxNJ3wusRrrIjX4XGgLGdkSN7i5HzAeH5sKm6H?=
 =?us-ascii?Q?kC6k7DoM5OyO66V6Y2DcrXSAA4lbnmFJeMaxdOgAOj5We7HSmYyGQ5we+8ic?=
 =?us-ascii?Q?bNl2rQkzGD2NhSPyJmtWVZvrCVCHvYES1kJUn7i1fUp1PY3wIFJiN6UUMWki?=
 =?us-ascii?Q?X4fKHakQAPB7Sw8LaBSM34uxxmwzpuB/outCsDnhKVQtAFeaz0GKjGDCClwx?=
 =?us-ascii?Q?E7FVylZ/3r1rvHrqBUjlQMziGyJazceo0dod9mX/yS5fj55kmQYLcI0aw7I1?=
 =?us-ascii?Q?BbBeq3FiHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d451ed-4e58-4b9d-be64-08de83012168
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:10:01.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzEvShapE0H2sfXQDU4qRsDs0S2Fwi/jXruicejv31DpYnW7kLtYEimCkHax5/+fnRX9TH1pzYIPNs6+I/Pvcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047

Add wm8962 sound card. By connecting with ASRC1, the sound card support
sample rate conversion. ASRC2 is also enabled, which can provide memory
to memory user interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 119 +++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 509704c23e89..ef0058b98573 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -110,6 +110,15 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-pwr";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&i2c4_pcal6408 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -131,6 +140,51 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		audio-asrc = <&asrc1>;
+		audio-codec = <&wm8962>;
+		audio-cpu = <&sai3>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN3R", "AMIC",
+				"IN1R", "AMIC";
+		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		model = "wm8962-audio";
+		pinctrl-0 = <&pinctrl_hp>;
+		pinctrl-names = "default";
+	};
+};
+
+&asrc1 {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_ASRC1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <49152000>;
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
+&asrc2 {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_ASRC2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <49152000>;
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
 };
 
 /* pin conflict with PDM */
@@ -185,6 +239,27 @@ &lpi2c4 {
 	pinctrl-0 = <&pinctrl_lpi2c4>;
 	status = "okay";
 
+	wm8962: audio-codec@1a {
+		compatible = "wlf,wm8962";
+		reg = <0x1a>;
+		clocks = <&scmi_clk IMX952_CLK_SAI3>;
+		AVDD-supply = <&reg_audio_pwr>;
+		CPVDD-supply = <&reg_audio_pwr>;
+		DBVDD-supply = <&reg_audio_pwr>;
+		DCVDD-supply = <&reg_audio_pwr>;
+		gpio-cfg = < 0x0000 /* 0:Default */
+			0x0000 /* 1:Default */
+			0x0000 /* 2:FN_DMICCLK */
+			0x0000 /* 3:Default */
+			0x0000 /* 4:FN_DMICCDAT */
+			0x0000 /* 5:Default */
+			>;
+		MICVDD-supply = <&reg_audio_pwr>;
+		PLLVDD-supply = <&reg_audio_pwr>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+		SPKVDD2-supply = <&reg_audio_pwr>;
+	};
+
 	i2c4_pcal6408: gpio@21 {
 		compatible = "nxp,pcal6408";
 		reg = <0x21>;
@@ -312,6 +387,24 @@ &lpspi7 {
 	status = "okay";
 };
 
+&sai3 {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-1 = <&pinctrl_sai3_sleep>;
+	pinctrl-names = "default", "sleep";
+	fsl,sai-amix-mode = "bypass";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &scmi_misc {
 	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
 			BRD_SM_CTRL_M2E_WAKE		1
@@ -402,6 +495,12 @@ IMX952_PAD_GPIO_IO27__WAKEUPMIX_TOP_CAN2_RX		0x39e
 		>;
 	};
 
+	pinctrl_hp: hpgrp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_GPIO2_IO_11		0x31e
+		>;
+	};
+
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <
 			IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
@@ -476,6 +575,26 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
+			IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXBCLK	0x31e
+			IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXSYNC	0x31e
+			IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_SAI3_RX_DATA_0		0x31e
+			IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_AUDMIX_TDM_OUT_TXDATA	0x31e
+		>;
+	};
+
+	pinctrl_sai3_sleep: sai3sleepgrp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_GPIO2_IO_17		0x31e
+			IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_GPIO2_IO_16		0x31e
+			IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_GPIO2_IO_26		0x31e
+			IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_GPIO2_IO_20		0x31e
+			IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_GPIO2_IO_21		0x31e
+		>;
+	};
+
 	pinctrl_tpm3: tpm3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO12__WAKEUPMIX_TOP_TPM3_CH2		0x51e
-- 
2.34.1

