Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCF3AD520
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022167; cv=fail; b=SlCVryqS14XGmqMh1d73vlENSDKz0BvK+rL4jrMguHzA+KYKj5ouKEHe6cdI6Oe9Z/QlohKdeXIr4pPMKiVktnIwQFbiNHgc46EYLzLLYTpS6mMZJOAt6DaOBlhlo9ZGYt5z56sgz/DyfOdp0+L0utl5VGGi7K8sm53jb+aj9FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022167; c=relaxed/simple;
	bh=CEgGXUcN20NFQ8x0YVi7difZIdnfdW1PzdqxHYr/V6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OpjXxkelQF5DygCaeIoBjqN25C2nZNfYQjSV2bbw368wuMSPBuFTk+qq+Uaw9MNiNlCtYjI3/4LLO9oIZ+RV1+Owxzr11RsqEhSxmhaQ3+4AEWxHkAYChIMe4b9i0pCQ71YE067cttjZyEM+u4ftdKuVKXDE+HUCiOsrycZkBVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uDgkiY66; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uDgkiY66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDMqWBU2jPPllknyo/gZjJqwPyIpk1kd3Wy7JuX+Ei1ipUF1A9yVf6EdqJrdiLVFRUXNOpMkZkxSJ76C9T2fUPs7e9gMWaVn9grhxGVkJ3LHQEmguTmbXHqQA4zzBOQgKPfmfoqM4x2GC8XsuhVp8NhVTwD1rLiPnJbKqD1otZ/xKaIeYiGJNYkX6BTqftWWb4u1QcS6n8qVpZ5ZcObmPYu4eD2Pa0lakSzP6cZsj+/Uywk9eznHXcFCH3BB5S6zbFAjRqPavYvfhfzTunTYMLVoZFoGnwqatFEX8jP95yVX36qryhGdZng1423bw46t1fLZGm3mCLwccTmXjbHhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB7HRViOn6tj6aVPKm0l2/6dtMaQoQtI3yWBCbpooCA=;
 b=TkR8rUHBPSN4zIY0hCr+3L+/EcSaOpAjPAPmX0lmplJBJ35kblGQbIqUzyyRadOoM2xYy5D6+CF0BoGaOIiGexE+xmw3mKuYoU7AuJ5C89CSbab+p/il3bmXGk2KjtDYi++DSjTATw77bspwaxugEsNWLlZ3BNMTqi3LVMbiainHEtc+s3sRbmyjlI96cxHDwRFudqGIPKQ+PquDSCPRaOuwLpgJ/RaKrT8V639bq8eWICqBvLBxbna6YgEuTeta4/llHFFtfSFzBU5b4mzREHOT8eocscraCa8fMCBwYoTy3gdq7gzKGjpwUMb9+s5kefFZavH4YgN4n1EVri0g/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB7HRViOn6tj6aVPKm0l2/6dtMaQoQtI3yWBCbpooCA=;
 b=uDgkiY66wCZ/Go8Rq0x5jr0WG03reTFWOPXMtHgLaCcCCEOG6XWvcEi+3w+SkOfU5M7EDYJcraB83Ocyx7nX15hkMokDnxAM4/aYVfSczsdCnW7B32zJyYvHOn4hJIDJI/jCTr92At4n9zl7w2/eJEQNU/Dns3Xqh71bM7hv9xgOt2d/65AjwUS7QUuDHA7bxaDZLXYxMZWBhphl7Ln4D33P5mHSDszpft8n72nDHJYhC1x2++PiE+dhAxX/ep3Zwu794CV0E69IAUoDTxlqzGxEIZOPXBS7jGFGWtfjgQ8kTvYoK/dp2C/ZMW64zWm7AE/fQRDfZt6/6eDjHuahnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:38 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:38 +0000
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
Subject: [PATCH v2 03/17] arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:01:57 +0900
Message-ID: <20260818030211.3141710-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0050.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 749e8ffa-5e2f-4e3b-7774-08defcd52905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	zxK1OXZzoC0Qa4xAhiGBAzm40aRdgEaKVR5mgyYFdjPiQP0ierV5WvfQJoFYPaHU3FvbhaPnF06nn2eoEL5ZKHBbgFHMYJ1ZoZz7GL1kYHTSLrGPVMM4gQFHS61hGDSK+WEZ40JBU65Epck4LXH4oUSjhJ/NORRtVMeRUHbpxyakoVqmrxE+WFLJcPp/erDHOYACwmwj0gMyLNu6lXydmhVfHWUDchVT5IA1/MNK4/+jmrwb4mjqpyuGx6LxDw22HdJBM3px+KQTAXc1HLA+TgdPtU6HhQWPiVTs5PqsPbUujI0Adm2SZm6LuMA6ySWFYoJjWTXG3CtsHTpXEB0C4FFOEUqQumiSasypBF9qimqCs9ZntbDVJWjtewwANd5vx2QcCnjCc8L9AfFZAylw94DCbkSdFam3R1V86EuLP/y3RNGFqJ4tq4fXjxHoho4naGsWVSmZ5svE/6on87RAmQzrAZIudiCvwzkUgApd3T22HQq739S+YB6ZbxlMhW0Y0wYXKByPIx68nWUKJJsBhcFvVPo+Wk+QpJbrNXn0EkXuIw4muCGHaXO0tvOQ/4+ofABtEUREWtIpOg1t6BUOE629962RDPHwDQ/2PaO+kgzCEB3SBkSRdajQvvhZlE3DueWJtayLnqtSvx89OBCpje/B/ehZcGTMv52xYUpn4/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tr3kxPinFRTXqPp0oF6uYvyfxLpJuqP83PW4/WrbObDUUHj7kvwh1eGP3EpY?=
 =?us-ascii?Q?PrnYKW0b6O0Gx53Wm+OrGy1x59YY082SMBDlZo97u0YxkGfyXhz2VnV7uMxQ?=
 =?us-ascii?Q?L3yv3JYDRDgFrHc+qIct3SEfzmZFdOMdwv/nvCy0pEcbya76x9HZsSkb+Eum?=
 =?us-ascii?Q?mOVr1CcauwJhyhUUYByIAPVKZEJtn44KjiJGaseo4IhraVSofqcesS/vTB/e?=
 =?us-ascii?Q?rI2e+eGsXCy/S27jz8Yt9UNj/sRjnueUGFaxLf1nLDKauczglyBAnS/8YQGM?=
 =?us-ascii?Q?2oXpDxjy0xgq7U+PHU2IUcNwoink1Y1ExK6oM+sCR98zSaagqdfGtwpYdmzf?=
 =?us-ascii?Q?1A0/bCKzxmP4jWBv0XBiyijkrTSYBtHS3GDpWR3GH3pM4F3VxCdCxQsXmlcn?=
 =?us-ascii?Q?PQYdtNEmrQFL4qKNOcD2/+CKJOSHBrq+DgqRSr4kZeizbbNo7Wvmt1pxc2hc?=
 =?us-ascii?Q?9J+NLxZDziHnWJN7sNOyHCSSvIV4nEisPUKJmQD7YJ3K+YYJ5L7iHZDvpS33?=
 =?us-ascii?Q?fRD0dNFjBWrUAE7tQYr1ALJFcdg7KPylwS4U3GOxkGWyZHaq/o8pWsNpOorX?=
 =?us-ascii?Q?WtydVGlkbBogwPLcu/SrZkfow3Gonh+TauBubpKgVOjmTJr5joAI/nNy5RHP?=
 =?us-ascii?Q?YliUL/eZqgFfsKNNfg7hmgDecXjz5joTStTiF8FZsKaiaBNx73w4xs2oAUdG?=
 =?us-ascii?Q?nTRFWOwUUPAvxqhara1meYkDZhiXwH9TqhcpcAjBL/3x4c79O6NSGv81x9dz?=
 =?us-ascii?Q?fmmfCUpoUUQjjQG+BxthQ3KZ5Ecf4t/ObS1jMPvwQ/WEDQZgOJ+sJAQJx6J4?=
 =?us-ascii?Q?lpEQuTD0e0TUn1HRZfCvMn/XN6fYFbbDtAc5+HpuhMel3pNdp5LEE5MZLKB1?=
 =?us-ascii?Q?f/PlIUDttU0kZONrkl/7FCEoZSyxYL3+o0E+Q3AdsxTZ4Nk6MX+2cLtU8PUG?=
 =?us-ascii?Q?aBkfwD4WiLacX5A6L81CyQyMSUsjGSoDp2rmsUJ57xwgdEXdb/YhB2HdIxiW?=
 =?us-ascii?Q?yjU41SKx8cSeRDIcRyAewDsGH0vsh8nxilbcjrS9/y24jbwzeMxe0mUR8yBA?=
 =?us-ascii?Q?Z2/N4AacXpOI13tk7hm0fm25XIvVmS0JHDC4wNFEMWMfw0I0BJ7grWkr1SX9?=
 =?us-ascii?Q?YuqA5h9bLlMHS87Q3+g6D0lzTfanGpLxhLorKKDEmnhq76Q6t0dpVg+b/5ft?=
 =?us-ascii?Q?1mKOq+bhYKdZCP0Zc/r9muKa/df7+jUkDYAUmBXJaGc1RlSXQQPoVlb1kBYe?=
 =?us-ascii?Q?fkHlMdpDQU7XMM9wMDj5qXMYGbpcqmbkXHvUtlr4wgM6Uo3UcI5TQM8L/J6J?=
 =?us-ascii?Q?T5FGcjRy6Lh0U0sXZQ5u0X3dFlnp7XnW3jUveJrOkJODRdAV1KCNh3GbwwAm?=
 =?us-ascii?Q?Xy/Fjr/ScgJtcaWDzqtTaA2z8uM8iOS/38LNDy/RP1KVvFNpTa3/4kZKzCAi?=
 =?us-ascii?Q?oDRNFTdCzCYiZdQKBnC5/gPofie4lVFRGCCNGYFy25R41bEu/fU1UlU0kAOY?=
 =?us-ascii?Q?Xrhmh+gUAVvZNcWYJ5NGeRQA+7zT6Of3e9WMAec1VQnAn/q1rY5DORBil73+?=
 =?us-ascii?Q?IvjCGevCyTTVPn/cSeom6GGMeANNGSLd/YMgMoiidb428+cLrSt6E7R3+aB4?=
 =?us-ascii?Q?aQmYe481HV7n+mVI51CR68gbws7hqewPxd1ouXeeLBYFb9aDyCpMwpohgeCK?=
 =?us-ascii?Q?f3UX8zSEn3gJB7rCoda2wszbEkPGlfUULRGidyP5XBXVdZGhChLwVjsr7WSE?=
 =?us-ascii?Q?8iZDqqUhWIBcsxwMKYG/PFOP5Iup0MXnTMuinKZ2VONm+9xvOlH8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749e8ffa-5e2f-4e3b-7774-08defcd52905
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:38.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nscT2OqwimCNmG46LzLUAaGeodBD53rZl6dSfgmxr5o+9OobDA5B74Bi2AXDmc0d3HhQ5OrpUfJcKecP5wwiOBpCMjpXIHiNjMFU7j1gVVrmeSWnTELGWve9XlW3pw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 4d1ada6a3942..4a3dfafae377 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -145,7 +145,7 @@ sound-wm8962 {
 			"IN1R", "AMIC";
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -501,7 +501,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -511,10 +511,19 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
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
@@ -720,6 +729,13 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
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

