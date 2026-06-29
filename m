Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB093A257E
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719305; cv=fail; b=MxDn/MdNa7sBi7CTEU5QOVJCXVDfJrK0Oi6z9puyUy7vBLVCTh+e3jn2+4pkqbPD3hZMQkVh5dvnY9Z0f0P/gx0wN5apDmhx9GU2Tyq5tKQld2nRd0fA1eTVX/kPhwp4jSAeDjwG+vi13rlyApihy9ApCIFb2U0QKN3Q0rzlRZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719305; c=relaxed/simple;
	bh=a/Jrgji3vzsuWI+PLcTpBODe2lzu4BqQs6YckeNOe5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgeCja+TjP6TU484/m+Trqgvx0SNHcUeMym7eguZ2McD2e+Q7FJMmJHAtOR4/HoKx3n25Y6UgDq5YlU0aJYzSqUKM5cpNyACcsEPdjKshELXR7G4f0YYAJo3rv2pKBc2lWHOZQtiUcAbmwhhVai03lwit5ut8Y0qfrM5QrxK3KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bWzyhTf5; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bWzyhTf5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N02KbTsSDK73VFYfOiiIJoaVm/E8s/vqQZSywfFD+iIpKpktgfA7z588Av7gVVD8oyE6mUFzlLAy6De7ARGMaz/kz5AGRJCFH8aLd4hTHyEewxETma2hzjMlM0XWf+X6wS7xyIc83AyPNGdBakosuU0ZaRLGoy8+Nnt5koUEgEo9CYlL6hEyhJmP9MpeoLjg41cPx86GUrCjyxX4VKI08AQWYM3LPm+62GBHfIsqfG7HzjxJ5xQ33FkzjFVt79aFs/hgpQ02vO6X9eEaejv/F3ADoAsksTl6g9PIoR2IgWm8BjV78CNy3xcm6YHZBNn+O1BHrFQAN33dhqxzDARWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJZZ9Wint6r8DK7Na8dIMojcDCM/kEJ5eNJwYGKCZjI=;
 b=oIaRA06hzElFUAnyByIXEhZAKiR97qWu9XOOysLFCepqdcP9Qrl00iQcqR/815UteD51eD0Zizf+I8guh1nfgxBd+wQ4qLTZbf/2hyzy7hTnNFxcXdUgGw5T4if/6fNyt4tFMbLfFzVci1hq3qQU7Rtp7m0mdJ5JJBBAF1pBZ+BNET+3fUCOcNp84+9v8/cmpZMkpPjaZ1HF7QqZmeBogmGWeHc+PA/J3RUMvM+CrHHO2HFWCiTY5rs0jqRQDbreYHR2WHR/gJbRF4XGzN4U1WCdlOb9pOkasn4HZuHH1LYXg/kGcL3566O3JWc952ufT8iHswXGV1+CKUsBghJOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJZZ9Wint6r8DK7Na8dIMojcDCM/kEJ5eNJwYGKCZjI=;
 b=bWzyhTf5nfRy8FmX4PoMj4Hvtow4x356z4QHFkwPFuVsAdrLRBFdfNeaiR5ha36NufimGZZMIpsTuckeqtMbwyvrQYF+yE0M/rL+wLv0vuCyP8sSUL80xpQ9ITfEWIhpcEie187rURDwwFYA0RrvdiIJ3SGyR/t9i1AoBEBweSE9FEyy4tqIkCGwAH++F9H+UNK2JQF+K6SuNHSF+Xkbk5dKkaj5iigynlpaRtbhcXFVLpZLc2f6RO2v33/deOgh8CYlXMQK6QLfFV15KPGKY0KCbupR0RqzWvijIn/UtjHGW8OpBgTnXCFeReuVQyAehcWIUH40inaSXp5Qm/3kOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA1PR04MB10553.eurprd04.prod.outlook.com
 (2603:10a6:102:485::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:48:01 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:48:01 +0000
From: chancel.liu@oss.nxp.com
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
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
Date: Mon, 29 Jun 2026 16:47:33 +0900
Message-ID: <20260629074734.3643227-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: f13c8154-c93f-46f1-d97a-08ded5b2be61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|6133799003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CqwQVYFPauLwCXlJnEh/MHlrUHYFJxl6yCxrl23+8IsLZakZDNjhCh5F4Wryu84CnavuFRZpUe/JmPJqrXdGOrLUiVExuvr1sdrkbNqrG4Rtmyr72DC64Sn5YeJ2lFutMG5DnEd/VGiQckkp/I45iIin03Q7hzUlsCfJgstX5YtthYESOAo3gMnktb6ha0lTxBCCQffBeUcGh/E/LDg2hcYiF+TnRuhb60ApuS//yWojVI8hm+DMc4gS1kHMshZWGYakPKgOWW3CV/yoBiB3gC9HDnKXW87PwBcYRrvumUNxJb6szQn5cSmFR26XLw//8xcdg9uy8kCxh7BDhKwhrR6AIkKnS/D/FhPzYdTd9jmXnv71vCiqCzTPLRvfrhm6VMJChdi4Lz7MoZ/UQSiBFx00XXt3NAgNq6/yxpGweuj7cyvmDHC8v1Xrf8lXr4aHQRfq9agywkkODkptpMvXNbxLIIJIjTvBl8552tzWsCPcE6EyM/8JFJ6ra0pl2i1v4Ixpp776deVtcblyloadX5LiAOTpAykHAPteUirksZ02UwPUvzoZ9OCS+OmAy97QWdMAkM8ZXguBBD2Jypp69l/8whCNr59j47VFhoKfnI4fYm/3Ld4R0oQ8bazBgJnmylJTWdab6tlv1bMBuZADwnv3Rnhmj7gtFl0OYbr9GsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(6133799003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A45To9fkw41FZfQ2C2+hv6LFcu3A1M/XgB2UQwGxAbe2C9oKL/Qnz21b4QbB?=
 =?us-ascii?Q?y+d8/yf/dW53eduLNUHr6pl4JvE2GG4w1bG+5pxeBXdn/ihA4M9w+Aq8yLTT?=
 =?us-ascii?Q?fziaNN3nRI+6V+74V9FkkrdUCsMDsUvmGCiUxiZM4bXhd5GMCnTIH1CeEkJE?=
 =?us-ascii?Q?fJbwuis4T7LMuxnl165SjDM2B/xJsLU/Zomc1al6LMRJLoZJz4LnnHFuyyRK?=
 =?us-ascii?Q?ZCP0tBCnjuNiXL4MyYZXCRb5BsDf469fTMob5tsWS0qLbL+cPw9SkWrr1ZCM?=
 =?us-ascii?Q?vnRpYmPbxiQbM1i4g6ueghV467+mK6I4FsO1u9Hwrib+AG9VbrkckXXkaYVC?=
 =?us-ascii?Q?KF+Z6TvnHp8ffu744b/nPyP8a0mZn/vMofh99AzEC1t5ujs4O3flrgcwRbPc?=
 =?us-ascii?Q?mLNyLEeR7fO1YHsalJ18yDqTIpNwPrUh6snLAgd0BXcsFnTlqkwEqCjz3urj?=
 =?us-ascii?Q?Gj7UvCfjmsrJkkzOX0J0nT1TJqL+GfDLHL3iEKK+JgeMXcv912y+rjx8w8Vm?=
 =?us-ascii?Q?RkYz2A+aV7oBTc+y8rKF36Cp1X8SkJG85mzQdlxXnDqbl9Aoe17PbiA6tcc6?=
 =?us-ascii?Q?oHdh3ZRu28D6rHD6CUl8HNiBJDflc3ZRp0cwEg0a+t08LcwDpLqcTdrQJ1xe?=
 =?us-ascii?Q?nx2kCpiiY0UNse4bPHRMvIQ6SR5QJNGrWDziEAlRT1LjlULMoj0Z7/mBRaBv?=
 =?us-ascii?Q?sj2+PeWZKlmdZ+X64YkUvNFByNHOIg8SxOhZ04pS8ohlUDT4zXaYN+Uz3D9W?=
 =?us-ascii?Q?WXjpF7q65XUL2jXKqsidc9CvowmTIzvfao944TgTf9UpBIzATs18CBEC337r?=
 =?us-ascii?Q?gJEk7+b2ezoUuUv4nhLTuhSZDNAqDu8eQW/rNRRD0OI2rtd5R8lgbMRWyydQ?=
 =?us-ascii?Q?w4TCLqpD1GEBE8W39YsO4ZdXatyCbCPOweojFwvqNYj/r9gGuKiwQrPXygfC?=
 =?us-ascii?Q?hqKA3UWpDbcp4Y0twdwfYzELYOOvq4ss07lpqVhgA7403xQvjcaHnj6tzA2F?=
 =?us-ascii?Q?v1xBlR80iwlZHNcgRYJJXJmcCKVa8F5XzTs2Xcv405XJGuoGKsJs7oT3aLne?=
 =?us-ascii?Q?zh9vI/oEoWc4xcXtlE4f6LjUAIzlMnml3QpPZe+bHsTKh+N1Ck1wzdiDnWXc?=
 =?us-ascii?Q?WmCVZg+f5tMF/maiHICElHJ4mQdS+esebP3CmSPWWZLfY8+sDbXHJunyhyDk?=
 =?us-ascii?Q?uXelp1YUgREy9+gltoOidMNoPUZBLyOWRO7eLjFBg4nubm6o/LnE3+Z+pgyu?=
 =?us-ascii?Q?j/BRp/G4QDnsrjQ8qr9A6kBpJtIGuRq24ZFVSRqMRg8W+f2bCDw4a37K87VC?=
 =?us-ascii?Q?ln7NGqYis1xFmS6klUKSAtXJub4As8Lwsbpad78UylY5BYm68qyPDe49ZXUB?=
 =?us-ascii?Q?H2Ezi+HYufkepbr3Sw4MhJTTYq3sPa7VeFNvSQXrX0xA32eF3LaRl997JTe8?=
 =?us-ascii?Q?np05M/2YpSOYl7hU9wbtJC8x4sUdD7sQM69qZuIr+eCgZQssSvEkdAZuyF4I?=
 =?us-ascii?Q?2Ua5qoXkAcorOP4CJE2td7Yp05XZrK7e3zQFuzBna01JODxzrZa5xzrkF+CN?=
 =?us-ascii?Q?rOVMdakt6bNf3ZgZ6RzMoUyeOKLt6TJhfPkbuuKxr31h2uQ57M5+nyHaW60X?=
 =?us-ascii?Q?p2tMghBl7Rb5IdB83PbL9I5TaCzEqkQAObimc05RZcZnpFizeTwABep/NVjs?=
 =?us-ascii?Q?dE3Huwx1pOtkv2vy/t+HqqXZ+Kb24c2wmCZoJ2Wihyyn9Q7WWmWWs8Fvvz06?=
 =?us-ascii?Q?k0p/sM96nQLUm6Gfh1FNMFUSDxfhn/ySG7KSGi9b8r/wPZoDfcC7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13c8154-c93f-46f1-d97a-08ded5b2be61
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:48:00.9659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxjVqKI3x+X2BdIe5/5Ax03959T5j/Ml22Fj4tOLkkCIuOQdsDpg9K/kjX11IfZ5TiuqMZC4msQI6IRQ1V+zTkwuZD7UW1WBUMgucc/6HjXa9xm5icxyb6Mxa1yXynGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX952 EVK
through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 70 +++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 62d1c1c7c501..80480c802f19 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -43,6 +43,19 @@ aliases {
 		spi6 = &lpspi7;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx952-evk-aud-io", "fsl,imx95-19x19-evk-aud-io";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &pcal6416 8 1>;
+		gpio-map-mask = <0xffff 0x0>;
+		/* Only pass through GPIO polarity flag bit 0. */
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX952_CLK_SAI2>;
+		clock-map-mask = <0xff>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -114,13 +127,29 @@ reg_1p8v: regulator-1p8v {
 		regulator-name = "+V1.8_SW";
 	};
 
-	reg_vref_1v8: regulator-adc-vref {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -323,7 +352,7 @@ i2c4_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -468,6 +497,27 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX952_CLK_BUSNETCMIX>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI2>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -688,6 +738,22 @@ IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX952_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e
+			IMX952_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e
+			IMX952_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_0	0x31e
+			IMX952_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_1	0x31e
+			IMX952_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e
+			IMX952_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e
+			IMX952_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_0	0x31e
+			IMX952_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_1	0x31e
+			IMX952_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_2	0x31e
+			IMX952_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_3	0x31e
+			IMX952_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.50.1

