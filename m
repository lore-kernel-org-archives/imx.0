Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75533859A
	for <imx@lists.linux.dev>; Fri, 29 May 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060913; cv=fail; b=Qpf7y5nSXlgSG13AsGGymnzPiln5usorHpzv2ODr2BJLBmOtYMabdn/rwTe42wiADOVRdzwzh0j/+orcDfdVTzBm0ljGPjB/URmBvOzRH8XJb2UUwIRzhFdrA77Ay8GsJcTn5FzmHpTyrxvYOolm5oQ8H2OQ8HKm4nIRH4zotAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060913; c=relaxed/simple;
	bh=uTd2UbU4fVNRT++LzilBJMXC8/uwSN+4hVk+nV/4vXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jOwkJbPPamq8uyP721/HbT99SJjgbdZsKDPX+29+aPHY3Y65zRRd+IOsaQ1WJTTnHCugHvcfAfCaOT4O+V/1H/rETnmlCdkTycLOAVY7eMLxxW64Km+lB5XhXS7ptzUhTre0dDcxnXx13DHlW2HheU9BJ1yFknio3Igsw8nLcmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JqNR/pqM; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JqNR/pqM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My/udu+Eu44VVX+r2bUwsD0LefJCipMUi7gwG7aB+vDIU2F/HE37LCW83dOLTYpplcbq1sm518aZ1Ple5lGH9uykREiUaDvx1rpe3e4KUI/LYx7MJ5Fx/iGZ9kHJ6U5nq/UeQhjwKFdNUcRIFMRge5/vDosnuN7jhc7tisXtX9ZBqqxHgE4eu6QwKOFSI4vPiDRs/o1V4s/aSdZY9XvSNiK07aBfQUCqAPUrFJ4zL7xzZL66g9IXeQnx+jjWSqLH0iRD5rkt8qV3spa+zcYald5HhHYnZSaNL2/OBkneca9QT9I9VCs68xrON6apQuXA9jqg1bDC9d2FdcsRtIH46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgBxxnh4l05MuIXhRzKSLxxnP3rHPzQW78Rj2oCqrgg=;
 b=xXwNpPglJ/q9lvwDU9W07qZwfWcg/vV2Ep8GlcEtkfGp38a4r2c/3alU9ahktVpzZliwwrpVBDJHnvEdJR5FEcJA0czpqzjClCFCt4HdkZOIHhfaQDuQAUfwovZ+0IX60wgSGHZg6MNepofzrP6T7RbLOLvkWkpBRhNrLlrXJVFVX9dAGgcy1xGWfFnDVPqYQL6KeyLM+1WXo5eyYO9NRLk6Hc7kbYKEjLYQYgPeZLgcXoq7cjTjPSoH0wxJs2BSZKHv//ju1i7ddXmRali0Tjxl6BjjPonLf9tIgb7zDogac4suV29E6YtbPgfWC7XHyVqUknnYi77gYxysIgLtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgBxxnh4l05MuIXhRzKSLxxnP3rHPzQW78Rj2oCqrgg=;
 b=JqNR/pqMuON0ZHSBu3+j8UzSisD3oOX19sRRa6sdN9pCs9JwUi80w5c+xP0NrVm/QGzMnHRftOtx0H2O+uzjVwWQCg7uRb3fKd/FBzkSY7K2JN7Svo2tVH3P42hDlu5SeRcvLp0JUff0r+oB19PNRgxae3R1OUDNuB6UB60eEdaAZivZ4ZjnrbQQRSeBSrEZSzI+7w314SwSNnk1vwGB3pQdeY8lh435zVg5D3COcVzoXTF3wFrcGUdiddpcuHYTbPnImCi+v49l9+S1F3jHyXe9KPmCzA9qmSvhinW118vcugJ5LJCHquraxv9ZY+ZyZ2yhENngG+d73dM9tW4UsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PAWPR04MB11552.eurprd04.prod.outlook.com (2603:10a6:102:50f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:21:48 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:21:48 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
Date: Fri, 29 May 2026 21:23:33 +0800
Message-ID: <20260529132334.3333294-2-robby.cai@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260529132334.3333294-1-robby.cai@nxp.com>
References: <20260529132334.3333294-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PAWPR04MB11552:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5c80cc-a05c-4177-bd03-08debd853d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|18002099003|22082099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	CjNybds5AR3ZcEjPjAEEAlMJgtbvARNJxIE4VtX49GCpyZthqoDksKvdJ6MRoBG7yAw8WzZCXO4AzSnDginvKW7PWBinGnfPjQH2SOd0LV+rNchIma5JgyjyxBGjrjEkfXLSnCZXBNMRB1BAHHgMEhVf8USDKnmlMfMyAnEBoyJvY+/pWiobhzwEyyfVYahL+BmGInlsUGFGWHXSXeuKl4RJ+fCcSzLiz0e3o6Zk7O6r2oIYQVbLanl5ubVj3wvKpIPSh+dLYtKo6qi+iX/X/pVH72PtYgv5NiWTNENMeiu3RG7w4bYHc5wLBxpjcDHbJdpfzXVxBZm6/Ep+MPx3x43I1ukQ62cbhDH+jNx7pSpWsBFTZMulr0qadGjUmpQ7FSYKKyBNE2vCZPvhmyyPqBPp2uEnf4DPjM8SW8mJcOI7tkYmCLTTEP5vM6kmpSyJvXdJW2st8UOzVondb9V1H9n/+uIniDj0blWU2DVmyO4aj70SzoCx8GfO/r4b52JGI6WbfwFZqdGMQH1kUVIaXsOH+jcJbqEr+Kl26J9JMH6dlmfFD+t0ByCWq6ifAFfzaqYag0pRqXLgkt2BuucaZxWe8xoUtO22gwxm4CqRvMkGZCCFK6BOvz9oTEKYAU8wyNLKWHDqZ0GzZM36KT/IZ6Kc+gjLBl75hY6jAFfhjq9ddfLC0c24idGvM+Sfbppz1/MrcAhEFlSdctN4LibcP8pPRVeJfM6IIiwqojsJtL1P4DkJ9gX6A6igoyLZ3W4YuiAQmNfLizm3hfnSJ8gniA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o4JsY4r4DBIZ2t7hbPw1FTy9qyb5V6m81b3VVwOrNCWtxvSDTY1U/KpmFp48?=
 =?us-ascii?Q?ctiG6NW9RZLumQt0uDSnJgl0S7KDhdNXceeykhWmSyw8dNTLLLAN7dxXr3vT?=
 =?us-ascii?Q?JXZKXy24D4Y1gmA5KPgN1IrRzxsAD3jLNPAbIh1yzEU5iPxClaNq+Yv1jnHj?=
 =?us-ascii?Q?7zZwJTyUUx6AR2JGr9BIepjHD2qCaI7CW8LLak4bnqayLJxPQEqdH/fOB7i4?=
 =?us-ascii?Q?roSsMHCgp/KuP56paeaSxJHoxt/w8bWSQyCa68XYvC9O/TsbG7hEy/E1STQ7?=
 =?us-ascii?Q?mLOYuuRIH6qFJuAROuaMDRF5woZzZg7e5ISFXHAlK4f377loYDDLvdHg6ZlP?=
 =?us-ascii?Q?NPa/DotHsFINMPwr7qoj9yC7Kf54eJpRAKuy2+BvIZVIxbXs8XmBEAdokzVr?=
 =?us-ascii?Q?kjn6VOaPiXFaJtvkG64IQhhjUXZLFDLQWZJjm9Cfh3ot/nyJui9HXDlS9ugV?=
 =?us-ascii?Q?RvPQ72ECWRGrbyO6c/BjE2nGvppRxPBLXoMy36oh8ThQiqGxx1XP0wx6FNf6?=
 =?us-ascii?Q?QvMvOmlQEd0mCOvOzIzr+Azx554ZU9NJCogfmHSCZARefnx+SuulffOWExXQ?=
 =?us-ascii?Q?mIqAF8a18gdqut40Z9nSFoQAZahnhbp/jGifOuinIS7fS41U4dpsNPojiVSt?=
 =?us-ascii?Q?vdfielWXTI3ROEXs8W6prQ4lSlItC1kC0te55ocT3sqn+gXYmM8RbLEe2K5y?=
 =?us-ascii?Q?Z19Yce2Z/82IXGVbOaPc1ZwuUQFNuSggFJum2Bu5+EBQYf76RkfCu3xnYFfq?=
 =?us-ascii?Q?BFA4zIkb815fAsfXZd8PBtbQDoaWKK2m5XARgvu0UHqrXWmvt6Tvyc3bxPbx?=
 =?us-ascii?Q?p39HQOlQp2C4bqx+9kujYeiqtT1+InMT7K33kLE+PVlMbpZdmVVAVgSDcCPm?=
 =?us-ascii?Q?TUO53Rmzj8D3ZU2D24iz9iTHJlkySFvZHjgOpZEpBttcsVNB92231HdVYwsd?=
 =?us-ascii?Q?G75zHJK+eLOk9aMsg2B4TK/LRaXYNI6jh123zYWYSa8+mR4O8d7QcBbya+ku?=
 =?us-ascii?Q?2kmoPqnSMAS+wxUAWa1Uhq7v+EMKTyG1csqww/95WWnmFqM7mzYxKbyi9B9R?=
 =?us-ascii?Q?l7eAtphHln+PzigVALT/fk+JRIU96G2Mun3qbXYsH52PsDf2E67DNXKBcLpR?=
 =?us-ascii?Q?nTzOaI/BEuz1TuXDAQ8Cbwc7wTssqHG7pS2gqRGjUTmlY6k9Z0wS95spLR24?=
 =?us-ascii?Q?NBYr+njSfYDaRjRPkNUR0/jAwqpzb2wN4sMXtyv7sz02a5MSqxAPY7Q0DqJH?=
 =?us-ascii?Q?hK6YgR1+4VW4/3piyOb5MQYxhcMqogQ43Dbq1vJ28yP2ni3gaBj7RmZKNHRW?=
 =?us-ascii?Q?17os2Zjkq5krqo7Az/ZlsUfHT6C1rseku96rCuw2isfevcg3FY2FTriOeAS6?=
 =?us-ascii?Q?uYst+SvDcOsB9iCACAqyQSKSMfcn7eau9FWBxzGbszdNLdiWFPI3cYlm2RPb?=
 =?us-ascii?Q?iIUW3YbppXSuzAxnvmHRVSSzn/bbvff/Mi1NEhSUFWhzraLlTQXkjmSLAXDU?=
 =?us-ascii?Q?piSAly6Hk6PW1HuhAJ+Hto7TioYD8leVCvmb3hfE91x2E65YpxS4Z883oPCG?=
 =?us-ascii?Q?J3CopcgpNEl6zviU+1vWm+CQDdDpSyLq1G1uQPW1zPTFBHKwA3uiAQ9v5FnG?=
 =?us-ascii?Q?QzdsVt8ckcBQQKU/1thZiorO2v3D2gCiaz9nsCnSFvU+JQ04ppMCJ93cnajr?=
 =?us-ascii?Q?mzj3Vdc+H3hnleqtLB1kMOn7DBhib+wF5nJ+iGVM+KlD4iVCAhm4NDFSkRRd?=
 =?us-ascii?Q?/50G+ZGcRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5c80cc-a05c-4177-bd03-08debd853d19
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:21:48.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml6bS7Dw4DS6HYr+xxpnep5lNIW8cLvh2k/wJLbL0LE/2CT5wLlHeWaHzGmopKHMp/uOngaubjVrChSJ1Za/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11552

Enable the MIPI CSI-2 host controllers and CSI bridges, and add two
OV5640 sensors on I2C1 and I2C2, forming two media pipelines:

  - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
  - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge

On the i.MX8MQ EVK, both sensors share a single reset GPIO line,
while each sensor has an independent powerdown (PWDN) GPIO.

Both sensors also share the same MCLK source (CLKO2), configured
identically as required by the hardware design.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 150 +++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..7ff1a763890a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/media/video-interfaces.h>
 #include "imx8mq.dtsi"
 
 / {
@@ -50,6 +51,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
 		enable-active-high;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "DVDD_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	buck2_reg: regulator-buck2 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_buck2>;
@@ -172,6 +187,14 @@ &A53_3 {
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
@@ -330,12 +353,103 @@ vgen6_reg: vgen6 {
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
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
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
+		pinctrl-0 = <&pinctrl_camera1_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
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
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
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
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -532,12 +646,34 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mclk>, <&pinctrl_camera_reset>;
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
+	/* Shared reset line for cameras on CSI1 and CSI2. */
+	pinctrl_camera_reset: cameraresetgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
+		>;
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -565,12 +701,26 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
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
 		>;
 	};
 
+	/* Shared MCLK for cameras on CSI1 and CSI2. */
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2	0x59
+		>;
+	};
+
 	pinctrl_mipi_dsi: mipidsigrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ECSPI1_SCLK_GPIO5_IO6		0x16
-- 
2.50.1

