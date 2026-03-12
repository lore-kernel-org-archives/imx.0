Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518A302165
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 03:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287278; cv=fail; b=VGZMYuZMs6bLv+3Lnq5Q2uPYSGHaAMk5bCmwmubHrPxJCnO+dNoqJUONfN7sa5s0795YU7IvP7NTN8wj8ISC73EOnbe5EeG89yIOgaXAShhWAWqtw4hqa/3643zl7Io2R4mBijsjn0kNM6zE8TspDxmqI0pBkJK6173+0ykJK3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287278; c=relaxed/simple;
	bh=WLPpY9oH/k4wGxdwIy8zG9eKN9frYTq2Ll/gmhG/0xc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e49xQUGDl+6Lj0ECdivSaDwGYlCEuSOCFSrQXpxwt0K7rwhDrOrRJ3sCd1+Oedyk/4NEELuzV9jfkwFjm7zsSgkuTuCC9nttO7Wsbp5DBmlZqxFXWOrZWLjMkDrFtVr9yN/MLhYfc3p+T4Wg5o4GEYu9uLZTgnft6mLwZo+rT0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IRugIl/0; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IRugIl/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLyN90FQE99Zs7SifsP2keqNF7qtltSjvJZmPCG95ou5Bay2L6ZAd9IqpP8l0WJG2/M+aOdPqRwVYGJeA+X/K4CoXVTw8kaoXlcf5fhISgaQhYUKv/tnUXbGJEu0NLTDLsZcL7o1tNUR04QBPju35sYNM9fpccYT6xoR5lGbB3qKGvNXjeV65gF6ecQySwWK4WxvIdbA2oASj973z9s+L4idvclQMm5CkGd6Rdlm+dFKoY+MoiR9ETTRjNtRXW0EEJKPojkIWG3WMlV8gD+RzEmclvLJzKtVqxlHfa0XFtrQNMClAk7OkaNtZa3PSybDKNv76xvSJeXWebpJxQzvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqhrT3ftur3iydXwwnz3SxvHWaCya73AIfoHLeatulo=;
 b=CNMcjk1SdvrHlYHsPPsbxFiuXrVuXquRpeMQ1re8l1nyyiMiDEyQTTAXDma0niYGRx79oyyJcig42pnMhgmhWhV2akVkYNXvXIvdk68SgN29sPSp+Ex6RfcXP2QQ/xll36ZoMNooUbomKDCZspA+hmgAXASM+pLY6F6loyVBiovQQMyvG+c2Ln7tIzbGXZ7erby57ZODDq0eSbYaPDgaRuXJhqRIGRD5nX3EZ5ahTEGx8eAymwwP0e/SckM08UaxksFqlwcVh5um1N4s3puXRp4G/ErdlBONucS4r4h6MU7e1FLyY4Da6duKl5lasFjdqIgHmazGRYAigIKOVFtp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqhrT3ftur3iydXwwnz3SxvHWaCya73AIfoHLeatulo=;
 b=IRugIl/0FnUf/1hRJJZ/4R/NPUJeL3IzADxHlfARD1RgggOcwLFTkMV/1ib0mCmsZpUPu+atGdCNBu8s2mhbBP2865QDIVdlYkFg2Kzmn9czY2inAEMT8whvYLsqfSkzyH9ZJtfsFAwsVvKl++vXbDb4ZTAkcmMHZ348h8p/FdpnTF+k+j/6vIEErZ/wJY6vxKc9qRYHsayLuK+GPhxIHHVARE7h4ra0jCiLH9n3wcdqfKuc7xHI6FpM5/JnXC3wi9FgyqS7ni//agpUKrEMyFJUcGV9FL9u2JPwfObDYO77qdDXgKpHyaV81HilcdAIw7OWuSHMiNa7ALmfChMWQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:47:50 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 03:47:52 +0000
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
Subject: [PATCH 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
Date: Thu, 12 Mar 2026 11:49:10 +0800
Message-Id: <20260312034912.4007057-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 05614270-f156-4c35-630a-08de7fea236a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KZa3Yg3ZQ2PCwFjEf4P4D6yEuN3J3q1IIvZZQ7GNaXuBpRa5dMg7ecE1qo77Sy/9KIkp5JAtv/DaBb8pEkwPjR+db3jyYmSFsoDHrLduPI1ny4jg7OzCA1SWMYtKd/2C++TIU6sM6WjTZsxhx8MVE9Oyt8lS3cjP4hI+wYxA/CC7EPUIdbO3nIVvk+OXFyZFEIZdK0EE1JLJExPjcaeLIKU08+UwU/unwTrmSDqkqK5pYTpRudI0Hp8yhw03fy2VUjLAB+/0tw5ixnSIQkistoVE6z1u24mIcwnYDUMlUtIAPfrWHK9/N2uU2RFhCQO2eGnkonG0UhKllmNoNrMIHJWhz129wm7qZhdIuZT8WEAdLgECThRdNkh+e/QBtismeXqnAvh6o7O7rdx4ELOVn2WqOrGIVqwvaX45qxh5fvi5O5N55tkCnDSwhjKyVcAXLC2UEUiCGo4b+IL7nWPQmctNvF6+9bZaLHUETQCObCx4cimY8u8weJw4naWbByEB6JAkEBwqMODWNCFAtz8PUwB7Qjt/nvR44dLhPFBs58HH3IF8qVjxrQiUfBAzTWsdQamBiRBZIp4kQpQw/RQQaBjBGSQpT3T4EjefdVOhXwr2s/U343OOVpIh6YaOQ5JcBQXfF2JfH1yROq/WegZ//QF4K2ZvoND5AkYEF1FvNDsR6oNd0DuKMcyXmmhGCb3OqDEWEACknSG1dJfVMRULTHi/rqj/ZgZ4ujOjfRhMxW2JoCbjW7ahw1MTKRyGGy4eE7zT7zDh82JxTL4yKjC4I0NYTH1rIN47p2R/nZ/mbbwaCU+rEqtW+muy2Rj/rZN8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o927kDArGZArjoQeZ4hNfiTJf8ScObSlsYX0TyDFWtqvFPARw26m0q69fDH+?=
 =?us-ascii?Q?ZeZ14M69rDfHaMLO5tB1kZuBsj1pe3nWvmKHGENtIWTKtb0opjzdQeNV1MOu?=
 =?us-ascii?Q?6/2i58pujgRbPzn8XXeTXV/t2ce/JXQs87EDeZMmlLaLdjClKapUXA+5qmtw?=
 =?us-ascii?Q?7e+CZiUmm9Z8UU9o52ezcZZ1YrMKft5wkpj23gj8OD0ygDdzM6b9TQu4snVS?=
 =?us-ascii?Q?10n3ZtEuD0HWm1Dqt37hNSW1V325h5Odv8WDI1m780S03E6ovJH/FUTZJXV5?=
 =?us-ascii?Q?O+whtjQa87AZPxEvACt+dJCoMdD4R33jVXfA1Ex487RaRiupHTyRJlud3xGl?=
 =?us-ascii?Q?kQCFKORDy30aEqlBZa2+wju5TtsswpDNvs9jn8RHpoPjnq1Io9VB4xw+VnxX?=
 =?us-ascii?Q?jLooivmIhqpNWUaFhsrQZoWSPFQy+EXgbJL1mIVih8oKmFZozb4Pggw+fjPC?=
 =?us-ascii?Q?QEUBvB4GEl4tMmoTK3oFJ4ALXcxt2za3gw7Z6TF/wva978+nd1p6FLMXFkZu?=
 =?us-ascii?Q?mMrB5OaO4WWpBTDR0p1q082Wpb611fIO6oeSR66a4zdgDPthy427VN2fg50L?=
 =?us-ascii?Q?7HQHlSUNooJdDLmo0nRQpQCkXrOoDy47hNAxZSdW0hP5hAlOH9TK6EWZS904?=
 =?us-ascii?Q?FlgE3bIYDPltDkgLUIFUYaxKztBqYRGRV6oP/7rTY+UoAs5uFxpPLKbQIOCj?=
 =?us-ascii?Q?MP6KCnSB54Ne5u+3pFyGs6u3PH31uibDN5aGHxFMtZrezYeuxbIPWOzxsBmP?=
 =?us-ascii?Q?PGIMUCv39c2GmknF8wfd69gx+eddEuO5Maqd5Ex9gdiR9Pw63IvelzjNUQdM?=
 =?us-ascii?Q?A21s5xgF+jXoFlh6TX1ZhjBr7noczw/dDPis0JEu6kiuDKt/Ot4rMxL5Nz3i?=
 =?us-ascii?Q?dvpa2Mmvvbol8vc0Xa2A7loKJoJ/wTTevoQA6jmtaZ6qWQd2Q3zMKnbN2MJS?=
 =?us-ascii?Q?m8PXU6tmLAFjc/pa6jHEeq5pzTQ/Res4qqToJGdLR5+I0ji9L1cUbBal0Fxs?=
 =?us-ascii?Q?1/EdsJoopvu1sMAoepe4kxXCmbk8Ce11Rq7bVEK/fQeOZFdLb68KsRhWuqT3?=
 =?us-ascii?Q?QbCdbzF/WDhfTot6xVdiEZKxd/zYclhC+bvAAwrzfV3gHkTgmpM1/vW47je5?=
 =?us-ascii?Q?cQI7jwD6csEkgR1Z5JnIu6JzeczB6USDKBdv35xFiuHYycGmsnryK4P8AKVB?=
 =?us-ascii?Q?JKuvethqAftlLTZTcZYovCB6LuvoLNZ/KLAphLKAh194XG3eyIKDPV9uSAmL?=
 =?us-ascii?Q?kkIx6mlYq+fx4tcEY2n0nSn5JJVUrkajIgFEXbATdN7jl+v01g/A6Lw57J4O?=
 =?us-ascii?Q?faNTVXZ18H7aqhMSSZGb8kG63J8X8bat/vVh9MffzBdiWxuZbVyrgbDC6+cZ?=
 =?us-ascii?Q?jA9RplVCUqIksi4KpkxQUCF4VlPRjrrWZpH1+xV6t4viNMBSJj0LKCCGbDUl?=
 =?us-ascii?Q?MqLEDPLPIOMVMiUa5lXmPU5jFkYkc6dmW4JexQwhyRS3QeDRU/mbC+lP7Pnd?=
 =?us-ascii?Q?AHmNJb2JBAJqi+hsvKNRSPpqXRtQhqC/k8Cjx9lcqv81RDCW4jJYML+/FmMI?=
 =?us-ascii?Q?XeEF08h8Jie9w15ZWRWbujh0Azab5dIyimSKNXpu/1UxdfRFw+DjArdhmCgS?=
 =?us-ascii?Q?IWJGCusuikQ9SMhx+0eVWIcN3CduAO89OrIC4VMSrwcavuL+CGpesGwi1qe2?=
 =?us-ascii?Q?xQq8flmxaSvPeufi7blG2chmv1xXI5tK//JPT7WcaOalKdhlZU0TOZUfuNWB?=
 =?us-ascii?Q?/AL9Thmeog=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05614270-f156-4c35-630a-08de7fea236a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:47:52.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7DJ4UqolnJkmgCD/qoj5QS5FQN+Q6enY8Bwb4r0OiYCOhapRT2xYxJ9u8pnjs2KRIP9RPE67nCVzT8vMqKrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

Add wm8962 sound card. By connecting with ASRC1, the sound card support
sample rate conversion.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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

