Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B73B4EBC
	for <imx@lists.linux.dev>; Fri, 17 Apr 2026 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423628; cv=fail; b=Yq7YtxToqVJsw3gttZiJ3FJGjzBtJaV0WfMBNBXNz09wvSm7nSOcKYqsoB6hauPRQkM29ZkY0cddflqhZTEZdoea0wUkd8WX01KRE3sfUtfTQj4euzAmR3hmijphyEUXP8h02gM6YiDc2D+m1oRCDFMkq3RBP1+nTkhDKFVbx50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423628; c=relaxed/simple;
	bh=k4DIP+ZWCBuFi18xGouwwxLP7TnKfHbQICk2w1z9Z1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkaCBJer6F10wzADkW8bHc5xQhUD9G9AkVubVaMR0Y8/lwIfuP1sNl/nkq+/pV7dKAMPkUjA7Ul46QeZOO3sPVKlaAeQL+rfkd8yBuKg8oLhezxcxYjnXxcSeKYJ3ozd28lx1p2CKDl72JG4Fkaxn1eTFIMsqB8WBPcPA/PspM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RuommCOj; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RuommCOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JafGX1KfeFumpVBKrTwE6+KnhxJ2svoEepHW0dmrhWrUL3FKht4+4VucM73PmP0z6y3XmIi9dRukQJu+p7q6yyIkNxlOMUTNXlxMaY2pF1AgFrWpg11VCvIwc6z+qSaxxnUjzyWR3oNEWyg9yLGQZ8VlXyRhYa3zdtj5En6a/zQOl+izagk11shE2A8hBt5Jo5z6w6p4cZoQyAIDcuqfcuJ2OFWze5vMbijHhwry+td6luntj5UfhKgLSRWCjHub2LLRPtMAjYBirBo37zU+9CycLMFmP3/8kVkH3HVVOtNe3JiuRU1IH9t4nl0vevH5C2PGtEHR4oaaGC9Ovxehiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ81AlTbCGMHW7yz+oktZy3cy7e/sBoRpvj6SXtoVlU=;
 b=gm99JWJJwKiONdsoKOIWze1n3l6FgX6zqjAC3BuT85+iuM3chjQvQS4mtb3W8pDM7FxfSDWdZrh/lWbxKA1+2G65Hz7crEP3dCjCV3DqOkDo35g/v+QuGChyMIeHm3Qt/B/A1SRnDTcZRtdTk9R4jxmjozJS9Kd98uT6Kq474U8mCFa5IAYL4bO/H1AOzRtkQgxwnRm0YS0CllPw6mUJm1CpPQapLo2nkEy1HXSK7KN8XBrMniiNF+0T+ic7c0IXQ8Zcy5GPEnESpJWBpOoS8Ruz6XcoToXMOpilAHyGg20UGR+QsCYoNQr5jUi/TyNIvTkbhRy0afEIHdv1jSF4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ81AlTbCGMHW7yz+oktZy3cy7e/sBoRpvj6SXtoVlU=;
 b=RuommCOjSox+JdZz0n+GNWQnH/WmFQdc1ZUtd9oMClt0CaPVdwVdV0cQnejVvNOVLbqNlKyGIZGY2ZGUAw6ZTxcXwvrnfe6NFwov0OMi/JXsIgo03QndNKOp/fsl+Q44HkpDsbWR6zf50OFi1/4lDoHsBj0WH43UZB51r++tnfig4pgiHjW6UdD1E7AWhdyHhXFQU19xOT0PXrVhIRoP4UOv3xaAipSjL07NZamSVP7evVubC5zXrQBvdZcf5ZYirPi1u5BYBUgOaZLvQm09oyF4i1nnAb2WyI9+JAlPr7ZSh9oTixFMfcRXrD2eQDCV8zrs4x8lGmHdE8ZuTk7BGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by GV2PR04MB11683.eurprd04.prod.outlook.com (2603:10a6:150:2b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:00:22 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:00:21 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	martin.kepplinger@puri.sm
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
Date: Fri, 17 Apr 2026 19:02:00 +0800
Message-Id: <20260417110200.753678-3-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260417110200.753678-1-robby.cai@nxp.com>
References: <20260417110200.753678-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|GV2PR04MB11683:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ab6c4d-9335-4c00-6b0a-08de9c708513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|52116014|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	x/pHMmyva+mau3HyagdoIRmK7thd4PnkIS4aYy0dOqCNWN8Alz/di8EkRj4LQSAADIbL5lL8OpP+t4xpV931PnnilhDR6aRwSbQUX0H5InwnSfuG5jEWtQUBQLHrMjluWQ/MCaYIVWsK4sHZw4v8p4YUuD3IImmcXHgxX3F6LTgZJK7fSO2bagHYJw31LvU07OQd14RKZUrR+aKIECSkBQcK+w5g2nv9Kul8kPNQQd4TQEJyZYlieKyD/Eny8CS7dYbdFNaXf6iKXTIqDaRkImGbzlIZHZW1GHA1eSwHcJz4xawF+Z6EWj31N72NbdswLeteikhzPqWkCzh5Pg1k+UBBKECBe3mveomsVMTOC66fRZc94JjrTkxN6qeETwXmxq7fZfwx9LefovBIhhp769N/05NmadglWQZ/tXyoBH2P2bYpXb1WhDx+KzWSGKzcWwKBs+t9f0+8gUV3kUno0Pj2DRbMm38oZLICnnLpP8YDWnFb7haRivyO8z6kuc2GdQzGdqlaqdwwRpOtg/zOUOrHuvoRHk1a8Twgg5dB/tJjFkUdBu61GSRdMOgj4qcZqGkfEvO64iyc4ftort8PwxVWNo+6x0KAxPrSzdZaeE29CPJQ7sjIKtUDbRiZAlaE73I9W6hmgvfplOwoD4eM6bW3w1OoicXYAdm2wiq8bYEr1msE4Qx/MCcEPMmwMCM4HY3JcGRCoIpFU0hwYJtCvKY6tTo7iwEWHRXmg+4lrccxU30vNQ4kup9VHzaVXyrOESEqe7SXLsUu82IyxtMy8DxyNsQIr8eHbOMBZ/GcceU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(52116014)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GuoV1pil/aekmmg6/GdGmTOo/72cWXpniWBBYQX0+H5E/ELQAvsUZnxB29Es?=
 =?us-ascii?Q?zDBQ9Gx91rf3FduPkDkqsis2Zn9tPm3SdVldQaOQuDILpasVAEzEYa026xBi?=
 =?us-ascii?Q?WnKGQWZluPjOcx7Rmcsh9RK/3DlJUyOV0tSugMAIFrY/53EjtpNeLA9V8l1k?=
 =?us-ascii?Q?gKU0iXH5CX2969ZwD9BTMzxinLq9dwdfgUccP3ZBi0UF+YmZutXm9fzyUe5T?=
 =?us-ascii?Q?2KPu7Zg9vJ8uD+dK8ITmUcT+i6ICw0nveeuJ4zQ+UvRULdwT8Et34p4pmz8Q?=
 =?us-ascii?Q?XjvIl/kkDyZq3wFVEs+067i8nHtKdlPm4voANV+judeXEHUPJrSE4tmt2avn?=
 =?us-ascii?Q?/ZyEdY8jDqUZNTKLJhHeYvg7wqh9+66wxxMxd44wavyvgf0/cBCozIB2l2/t?=
 =?us-ascii?Q?QW4OOQuT4mAWOdVrqDwxnVTGtjS+0d7sfjibY8lNF8HyW1jshqI+RAZNQlTe?=
 =?us-ascii?Q?0jozCRJC9EiMN+8vCe/hrMPkwgYm0R28WNJsCp536JnZlsIoBJrQEFpLLMID?=
 =?us-ascii?Q?8KinxNVl4K10Xqlh/DUBE6+BmJ1AflG5/T6A1Nq9rbaXW0MAGUJCIzUvJp/S?=
 =?us-ascii?Q?NX/BFy3OiM7s3xIqzaotKZy3FM7RdyfxYTSneXNgm9HPe3e0BSzs3q2GKWi8?=
 =?us-ascii?Q?34pkmdn9gNagjL2lzy7jA+TcZ5kP2+6R9JaZnwevWTQNf9pQMb2ATBvzWlI8?=
 =?us-ascii?Q?j8Fm6399ogNr4NxR3cw2KsGc4jWNRsBam26l6VZeB9ozvCwB5YfyizsTTWia?=
 =?us-ascii?Q?31qr7Nbj/mVPC+yaZiyhOSOv85fr/GAFVG2w0Pgzv+roXu/8CpvEGvxUhckM?=
 =?us-ascii?Q?NeG3tKbCcSiu7jBKYmGmgPxzPmGCDAdrNNOUbRCS5yVN+eKXcdb8bgEGxI1Z?=
 =?us-ascii?Q?AsB/ZIyjIv1WIA81y4TYz6tZWFYkJzvQAvm/Id9MMU/vpCf95q0Mh6J7czpi?=
 =?us-ascii?Q?HvQUzeGegE8IlX8xbtr3Y8dDnA3kaH4OaHAzQV1j9VuuAZjvOPjcRGwPlnKA?=
 =?us-ascii?Q?Y9AAJ+QVNFXtrLdJChIiXGjBPZGAohGJ+QN2nyKaEx/r/DeaSN6vpBuQMQwS?=
 =?us-ascii?Q?TgrgErg4B/hMV4fGizsZKakCgaAnnIVXihbZ5+9g/QUO2AzAS3ld16+3O98C?=
 =?us-ascii?Q?sbU3QdmDxwQJBMaM35OJxCrh6ufBGvOtXQkGxni2FUAyIiB3CGZT5ePi/+pJ?=
 =?us-ascii?Q?AcDLriQgcrV1lPf8rANxTWePJD8Egcdaxx6tU3zgGYe4l1JOUSx56xgiTwsV?=
 =?us-ascii?Q?+04tyv237eoxxJ6LxAMOPberKZzBQGI88b+tswByh7kMYaZq+31rDsQa8r7e?=
 =?us-ascii?Q?BFzBYQ1r9y4eS2ew91YvNMnD0lzH8lt5Am/ybSxZWtQdsqFCbj3rRXfkAxNA?=
 =?us-ascii?Q?e0um8eoQAQ5essCpV16gSE5VGfS05dL1528q+AyVvBjvnQmCvswVQfrC0EbO?=
 =?us-ascii?Q?B5C78TwYYfxQZvK5iRuJ8aE09Zn3bjtTBumiS3wY33VKXZI8S5HqOgxArw1d?=
 =?us-ascii?Q?4I5Sr5MOJNLT5VrKIP8+VDky97K5owsCFIw+SbAAZYwEXq8ycs2cIPSR0QMN?=
 =?us-ascii?Q?/j6vpeRF0kiTFZrpKX66NsiCqnwVkjFAPclHE+ZrodH3UXMhmkiNa8SGBG8J?=
 =?us-ascii?Q?oQRIH/ZGDXYTAKWrqjAuAAMf5E0B7f20Ctvzl2ylQNZq7QpLI/mjl8JCzjLe?=
 =?us-ascii?Q?IVhlMiTR48RyG3e5KgU7A+K1/hwZBcVBTooRDbHPgIDEJY1TaN8h7BO3J/7s?=
 =?us-ascii?Q?PVM3ygkqLA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ab6c4d-9335-4c00-6b0a-08de9c708513
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:00:21.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcEZ9x64pvSS6wzdxa/8/dLttfh/vg1hoOA1SfjChqAB2/LjQ0T7+lVHaYEX8JCNGQ01gUcQr4Ea8jfSle/ngQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11683

Enable CSI1/CSI2 bridges and the MIPI-CSI host interfaces, and add
two OV5640 MIPI camera sensor nodes on I2C1 and I2C2.

The resulting camera pipelines are as follows:

  - OV5640 on I2C2 -> MIPI CSI1 -> CSI1
  - OV5640 on I2C1 -> MIPI CSI2 -> CSI2

Signed-off-by: Robby Cai <robby.cai@nxp.com>

---

Tested with following commands:

On CSI1:

media-ctl -d 0 -l "'ov5640 1-003c':0 -> 'imx8mq-mipi-csi2 30a70000.csi':0 [1]"
media-ctl -d 0 -V "'ov5640 1-003c':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 0 -V "'imx8mq-mipi-csi2 30a70000.csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 0 -V "'csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
v4l2-ctl -d 0 --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap

On CSI2:

media-ctl -d 1 -l "'ov5640 0-003c':0 -> 'imx8mq-mipi-csi2 30b60000.csi':0 [1]"
media-ctl -d 1 -V "'ov5640 0-003c':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 1 -V "'imx8mq-mipi-csi2 30b60000.csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 1 -V "'csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
v4l2-ctl -d 1 --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 149 +++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..8bdfbfebfcc9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #include "imx8mq.dtsi"
 
 / {
@@ -50,6 +52,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
 		enable-active-high;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_2V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	buck2_reg: regulator-buck2 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_buck2>;
@@ -172,6 +188,14 @@ &A53_3 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&csi1 {
+	status = "okay";
+};
+
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -330,12 +354,101 @@ vgen6_reg: vgen6 {
 			};
 		};
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera2_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		status = "okay";
+
+		port {
+			camera2_ep: endpoint {
+				remote-endpoint = <&mipi_csi2_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera1_pwdn>, <&pinctrl_camera_rst>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		status = "okay";
+
+		port {
+			camera1_ep: endpoint {
+				remote-endpoint = <&mipi_csi1_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &lcdif {
 	status = "okay";
 };
 
+&mipi_csi1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in_ep: endpoint {
+				remote-endpoint = <&camera1_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
+
+&mipi_csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+				bus-type = <4>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -532,12 +645,41 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			/* MCLK for cameras on both CSI1 and CSI2 */
+			MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2	0x59
+		>;
+	};
+
 	pinctrl_buck2: vddarmgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
 		>;
 	};
 
+	pinctrl_camera1_pwdn: camera1pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
+		>;
+	};
+
+	pinctrl_camera2_pwdn: camera2pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19
+		>;
+	};
+
+	pinctrl_camera_rst: camerarstgrp {
+		fsl,pins = <
+			/* Reset PIN for cameras on both CSI1 and CSI2 */
+			MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
+		>;
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -565,6 +707,13 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL			0x4000007f
+			MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA			0x4000007f
+		>;
+	};
+
 	pinctrl_ir: irgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x4f
-- 
2.37.1

