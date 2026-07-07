Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FCE3DDB18
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407494; cv=fail; b=XGzNaenPTeaEqbMLqsqtAUnd+jz6w/jit3b07CuUYn43ILXqAlPEVwqPkPgdkeRXZAdAl4uD6FnsRa8718c++zy2dEpxQiTsh23I3MNJoDamfFIPvKJwZ6buFhW8F5Hh1hdUWkzwhhhAh5I1rTF3m9xqLwhxYf2N1KjBgGLwIjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407494; c=relaxed/simple;
	bh=H+AQ7ElTqMW6H58eqlRpAi54wjIwZCXET7+AslIjHMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HhITrwXmpc3N6Scdage3uwsvPRkkppiwSWEZ5BoGtgmg2ny/ay00jNZb34lh20ECOK5y9kmt3/vuc/WqSSY2Pt7iY9QCC2d8Ki0cDYzFBKmZ8pVziC7+HEEc631/WehKs2/tr6dImKVQuF242wt0YP2PRhdib5FMaAI71ty338w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IeNaBf1N; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IeNaBf1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bab5vgtXAJUkTV8k2inJrlZ66k9bEp14soDzxWeL0DLccsBFiGLuAl24SG8Eywr2ar8SH6HeMxNgYSi2UnLZj9tymX1jlxKHV+YpJhLuSOlcB3X26CBBxySsuaTW9XIK+Dopsii9iu6SBmvJWXV2dWhVMdDq250UZ1K3T0+8LGc61CXKj0ktTQN4ASKRmc+P6NXCwwP/BhaQflx3GaTOavtAtgQ4UStcuJwVdPXLavdUl3XGN08PRUvC5H6atT654+2Ae3o1WP+CTzWjlnhMylHlnGUikPHgSkqk5R8RgCTHmEhd9+P+8xPvMdYhuYeuzVSMqY+yG8Aic78tGh7Y3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dSlxu1gl9kNt187GA8BFab5FfSnSY2/Hgm0z4havLA=;
 b=Uh/KP8MBH/vb69KYP8Vhosi84ofGun/Wu/U5HauNff3c6/Zz2F44rvsX33tcOCoxRs0LRUjjC0qDLrgKT48MlLffILeE4+zOEv6yxCc0v0Wg/G5RzNuAC0mI03cUZ+up8B3iaHCoOTsj7OAdhQ+bI9OimfSk9qFLzvCtxt1/V7zslmjbT3h3GT4tba3KoZXwbEcPutjfA5zTZ0W2l7AMipoTMpGdURixnmX9veqAH0p0l5mwqv+KjxfMMK7JJC+FitiYhSkm9qGSbxdX1kkbhEHSqAL9VyO3DAMmGUWd/rBCyiiafZ6TMhMCtO3RdBVL5e3+8YXVaQY95hCUMi9AHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dSlxu1gl9kNt187GA8BFab5FfSnSY2/Hgm0z4havLA=;
 b=IeNaBf1NQLgstFy1+BuXwa8ptBuMepCbvOlq65syJ52zK0hrW3ALWrzQ2MhLiCfjPkEPtKvP0snJakRPgNwkRsRHjP2gQT6Cte4ayB7AcVUmKa4OLZayUX1S0ZQrEx1Q3nrGLVQXcha6QTztJK/KAlkFF5A74wH7WUYLxVYqtoiQSoWay+Hl/78H41bwe+Qje6np74IW8JBy444iH7TH2sz9JahaB1iO7Jlxg7wvLeDhsGSjhMYyk8jCGPCH8/E7cv6nR7lx9f2QPbu7+Z3R7czV//A/UhNU1nP3V3bRehM7f2TdYL7nyjpt9xUrVrxFshVNZmItfxF+BApIAb1ylQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI0PR04MB10830.eurprd04.prod.outlook.com
 (2603:10a6:800:260::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:58:07 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:58:07 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
Date: Tue,  7 Jul 2026 15:57:24 +0900
Message-ID: <20260707065725.312450-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0142.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::21) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI0PR04MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9210342a-d860-4303-effa-08dedbf5195e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|18002099003|11063799006|3023799007|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	3SwUvbGf4nTlKzy+XDGL3XWTAdfFX16T8wV1oxNrZ86GsVo41tR8imq7xvPGWfhN2fws2SVDoM8Qd6pm5VHsyBT9k/tMNRsAdDrqTK1ZTDD8M8BBrE3c8wYkl2IEeaY+lJz7CEulSmGhgYFBledJ17l/mj1mvvY2KXJsyf9qHqskKFMJ4+PPXVWwCv7+1Lu9Vl6nXd9eTOjK/fF+3P6cFklwxvC7YkyD/ry0MuU2h5xbi4occXJLt0rn2mNiA/ADI/dRcG0rsKBpW+C8sHJb6AmwlfoK4vgxMUEZY9R42dnzCRpJDrSK2j6Wqh3hHKVUA3vvjRdxMtw9TUkkDOhI2g4Z6yan4ajeZTKE7U99fsArCJzsVY/2msp5WaedldE6okT/hW6fiPwnBzrAo7BcTCRYjNKUsOqCEqgI2SLToB+/nGQaJEIvw9uoPj1zQld2/Ag15dsssWtdpSpyHwFj6yAdLSMc4Vsg0NwVXxpKjcb/kxNs/cw/nhnQoa160lx9viqIWPPIJmFM9SOq+qiidkgFGFDP1V+jbRNQ6g24cC+lusmANJxhKRiTIaoLsiRRfEuQ0jvFsykCvfJZYyXtoPRCxKC/2XldMnBTiiJSTOf1rdOBsdhv3X5vGDRVGjS1/n+BkHklRmuvfA427lsmTKtRwQM2pXNbFwdICo31Yq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(11063799006)(3023799007)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2gXedtMvznEqUKig9B4Z368hZj4pwm7+qtF7ixYHjNZEAljcHr3+jUbAjt4h?=
 =?us-ascii?Q?N0QRadbuqOoCUUJpyDtxZAU9+ETS2Qswqrk4gncJxun9AR6mUqM61bvq0xce?=
 =?us-ascii?Q?OKgj8YpHkdLgh1hVPftdbpdHTkt/JCXXgW32g5kyVmoi1NXXOjP8yzCNFUu8?=
 =?us-ascii?Q?0fnYXw2EEYWlSj5VxZQqKvaKaPkn8Fycjr5UBb26gNmrffiy2Tm5M4lzRaMR?=
 =?us-ascii?Q?OCh9osNEYk6kHUSOTKv5PLQPS5fd5so8boYzs8tCHZgfSEJKXi2sztQepd/T?=
 =?us-ascii?Q?3x1kAliUrnjNRPy9cfHj9QI0aBLV4I2YmCdIWBap0CtMIvFkxl+skJg8PwUW?=
 =?us-ascii?Q?b/HiBbBz/Bv6/f7JEpyJvMK6eOtHouSsfEr901bw8PXop5SFki4I7IYrNrK1?=
 =?us-ascii?Q?qIWEdOSPJNiS03+rBA7H8IXcktE2eKmp7YTPK9Dhvbsop6FkTpjmN6/7hGIY?=
 =?us-ascii?Q?0bSDAV+incAS43WXyboxvsxyznzIWk+rrBKE8OMJseH5NdPWT6fgQRXCn++X?=
 =?us-ascii?Q?l8t82BaVShTRXjdDkef3YRf54ACpfRKEsY3AoOBX+pbpAUeiLqujS8gge+JS?=
 =?us-ascii?Q?nfcu3hf5bgKkrRc3EbhPF3oGHmBWlgV4gcZdi7qEoA7sqMmkLBjW/Ti0w23+?=
 =?us-ascii?Q?X6MqMYqfieoR3ODmkazArvVaJx20BvyD/buqFdw3SOXkyPSLV6OOBeHAngBs?=
 =?us-ascii?Q?fCHW8MInwdz47pfejFIxVGfQm+A9pJAwv147hXy0zTW2SOcMIBmJRVnd2biI?=
 =?us-ascii?Q?rjsRC5l2oMCrT98LNlElo22b0WOnJcaZ9kVmZSBla8GAGnumJKb5NCz4z2wB?=
 =?us-ascii?Q?FTzFaIVd8wpn3slWMLW9hP/N+7NA1XOSART3YkDsscpqDkHMaPwzGNUEvtF9?=
 =?us-ascii?Q?DqVtcqU3ZYkaFYOPV2HQNFt9cLwfHL2yBrCqBFzqYIth7Cn2wMFwR6WFufpV?=
 =?us-ascii?Q?j6+YEIFujj2aLCVdDgpyopDI1ATvog8gzQlx7q6dz2o0F8UeNAVYUtmIBum4?=
 =?us-ascii?Q?5fbmW4B8F7bmsl+xhI97bLGgJRGEFw0WGteuD2ACF6ZzbQtJb4rOKI5IjdFr?=
 =?us-ascii?Q?7ZnNzk5VqS1g5Uc3RvLx96Bvq/IEvoDCin1NzbQ0bkgqmzY4NOeD/HDDdfOj?=
 =?us-ascii?Q?fnn8Ys1tvLsIBVImYvS2w4oOtaoJFYfRCDrLWEwusBQY7gBm8xwA31l0h6zz?=
 =?us-ascii?Q?kIBt33TgESzd1nEkiX+M8jdq7yxioH2fhwrHAKBX1uO1xaV5mn2LbAXajYV2?=
 =?us-ascii?Q?S7a+DwC3QncroqsXilCJ2SQcA+jYnQVUD5OLAYCt104q4plcfpJ3UN3fgSlT?=
 =?us-ascii?Q?u/Ruk1B29VHwXDIPrAy05ovDsdUYTEIFKd0OdBXu2rYkCRX5DmcYfoq9p92k?=
 =?us-ascii?Q?36170m6oWYG5UmGFSer6h51gk2OQuqWlofpLg1E+BeWoOcILzwALhBd5tDcL?=
 =?us-ascii?Q?Qcf0vVESSThgXBj7jfKcNBZj6yhe/bc4oTct+YHeA557brUoPQnkgNcY5GNB?=
 =?us-ascii?Q?52FF5RPczKOrI+B5xL6CgntD7YrJt6sctXY9UjsJp9phZUz/q5kYxrLtCGpM?=
 =?us-ascii?Q?V49UoBxiXoOEqqYIOwl+f+iat8rwmki66ZTen5ruMRv7AF0FBS7TGFANHc5U?=
 =?us-ascii?Q?+8K6ASfM5trIke7uK4Cu4CIGBzNec7Wn3bj9mEkz1geFjVW6H5WPHGGzfCFC?=
 =?us-ascii?Q?WMNny7aUnCc6rhoGoKpkLYSq4uzIbxCK0NzoZxDN35UFdM74d8XIDDBR2fzl?=
 =?us-ascii?Q?k6DD/6bvOKVI2FnzWWjcvAenZx1OBhfqBBaMp+/gUG9rgfmpyQWF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9210342a-d860-4303-effa-08dedbf5195e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:58:07.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD9gdFVp4zqq6UJXOMiREqtbn29uck5TAEpRhr158/h3ot+/95gmCdbvlFILfxZl+eimry2nzLjuQ+hHxVhq+Q2WFZPh/lfKuAlmvOHi8I1wTe2A4tLca7kclxoESyCZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10830

From: Chancel Liu <chancel.liu@nxp.com>

Add WM8524 sound card support which connects to SAI1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 1f2d8082d255..c5b9dfee95eb 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -110,6 +110,28 @@ linux,cma {
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
+
+	wm8524: audio-codec {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8524";
+		wlf,mute-gpios = <&pcal6524 2 GPIO_ACTIVE_LOW>;
+
+		port {
+			codec_ep: endpoint {
+				remote-endpoint = <&sai1_ep1>;
+			};
+		};
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
+	fsl,sai-mclk-direction-output;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
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

