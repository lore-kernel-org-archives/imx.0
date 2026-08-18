Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68939C00E
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022264; cv=fail; b=opDyo6WAJu4MfBhkkmZ2eewGn8TBHMaQKfcAhfei02e/DbzEyVBBdj7cLTbOtMr4pJO6mm+j0wtAxpWym5h+zwxz2mASOH6WbYvPkGasq3qYavL0FeucWIyugEGIrTnu5ArNmyq+RuMf0I9A8M3iN6+MT2Ut5tOHVN04+JQFFws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022264; c=relaxed/simple;
	bh=A27SkGrs0+dEaY3z7NQ5Z2mlU1/Py5My/eHuWtJlbzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JVGKsaXIUW3nnfNHC2HLrKZBhbeb4RI93syP2G+Q/bbTUDvvQj8xzrUdvGTOTLuZIjwdI71PG0iauPhE1jIktiv/vHm+WxGwNiihRxTamPcHWOnZ9d1CRSZtCbDM+F7SrAPJuwLhhjJG0XtJASY5WgQ+QaBM7e365vV/eyXy9cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VhgEQM4s; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VhgEQM4s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exeh1tmeaE5rovjdjyv29HJZdxOw3D1lEEvvwhzHfzF8zSv2zVywt5QCZvwtiOlvLz5ktzgcec+5qbZCpnquhfZNOdk+n7pmchzpBp8ho4Ta5M0gR2jNnUBpAve1jzNgVhF20p2TzWAGOKbrZh/hM4cYUXA9FeD/hfPhBx3N4l2Jm1fVSyWzrpj5T7RiszHTAhIAqVGhuCXOCm6CTTPm6LBsv++LBCBgE2SygpF0rywdG1XmVERGFoXkDYLEgYJIVgs8ZX+54I2pb2CYaT0kL8fCSid/8HjydFb53QrDEIl8hNTLZZ5bVlb11nAOk9tQaSkSfifZJ6vLPEPFhs3p7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=DW9CNSKsKSh+l85JqSB4BIO+z+2IR2K1vy+q2MKNHABa96PFdUvblEExJIK7dhEtc6E49GHT9mthwfpSiDxpEaqhTjP6QXAuHT+76k30CspTZwXSrgZ11z3tNjfZiuluqJhnibYlYRd6MQ9S+JMIvrcL1voDExK4vGuCCmvgPGfee+6i1B+yFSvNfTSDlMX46w4sgS35SruTkhO9RS1vITryIcHawG1wa7YnTFT5M5008M7PJsyqFrhgiryEyrX9RV/YJHY4KbT7ZYIbLdHtmzG6vyquJWHsqMVzyk9K8CX7rR7TLUx/EVBYRq2DnqiS4PBxDYhVArQATiuTolQMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfRWm9pySWV119cyJM4tetQffY2MEeMP3H4EVBEsc18=;
 b=VhgEQM4slQkcyxI3F2wLe1Feb2ECUV/Ciu5AU055Kd/VZ5LdHG39BBw2c7LZ0OKJNY5oO9OTgZSFeBGY+Dgn93ipTYmPN/09F3jdAU0WsL/Bf/wXWCBI39AzrFuAjQEfnMGW82ueU9dCAcPVWz7XTkIK+zNZwFMRV+VPKP4+IVSH3jxtglDoTrweUyZP0YVGWh0ELnL1YIbkiv3TxyT/w+JU1UEwj1iBhibFeh0a6BxUx1usCjdv/RxqAr3KNzJnjQfQE/eUPIqK6IcaW9E8ZyfC+Hp0mJETwy03SJ9u23QTgwBD7hvjiQ3IXY6PCBU0cbWwMfWnkRMVr/na+OTKaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6829.eurprd04.prod.outlook.com
 (2603:10a6:803:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:03:56 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:56 +0000
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
Subject: [PATCH v2 15/17] arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
Date: Tue, 18 Aug 2026 12:02:09 +0900
Message-ID: <20260818030211.3141710-16-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0198.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 840991dd-af57-4add-f167-08defcd557b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|19092799006|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0skXZZB2ebqzXsC8+J744w5EU9UYB1FzaAg6GLToLe+hAfxQkunc3/WMQdbcTZEqeVFFY3t8X8aJrZASWI07mDBev0mewv3jbkixkoUO8haHs66oZXxaHn0+4un/6ElF7sFMQr3JGSxRnB1hUEicazQGVVFk07qm2TIWans96UMLFMIoA9V+tFO2W1KIbE5obAwb3/0cJjPZY9hDf2AluJZk32qgHO5eTYL31FrdVucYhAqw7bAgk+l5OKiQY6NEJWYDkUec9IoNxD3n2iiRTf+oP8vd5gp82Dl/iBHiZ4zKPl1gqFV8Bduj/OC9YW3GuoCPzPFCJ3irMcRDPGSFDQEoTkmSUKduwwfNdoQbvk7OpbNaSMo5+gckPIBRTmpfocbSexVFzl8r6ISVcmvG0vhTARfDnfS/ckkh9vVNxibUATjoC34bLsDFlLt9H1PqehRGQAxtIhT9L5QmmcnpWoxV14PiuJ0WS75TqsGrLnFSpCu08JvIfqEBRMhgNoI+9H9tgtYaK/dq4YyClFzlYxyAPxT/WlLPT+uWgzxsN3GSmAGpYPhYRaAv+lzPMDFKv2naNXLmQ5QuXnUoAPtf1//tEjyEPT8pcGlpulvojuNIlL89mjYjM5XxqtB9goBNi3aoomZVAxvYHHQG3grEj14KzooQ4rgQsqnkdg3jj5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(19092799006)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SbTQ7NEETCFAVy1HtHvS7LP9E2RmJKAUDS58otEMX815W6KA/d8/A/Y+6fF?=
 =?us-ascii?Q?FNAmcAOsN19nHlZw42gUPPWPr/UWlviKPf8Zp1Fdg7OVV4qp3PHuucx3U029?=
 =?us-ascii?Q?C1D86BqrNplUlWWXTfbT9f+lXhmXtpG97rBSgTEn3mi1zzgGqxMbZMS75iNt?=
 =?us-ascii?Q?ilpJ+vKaBHKTB5ul0r1e1uE9slBCKiomq5DTSroZjdO2bPCQEfxLrd9kQ79N?=
 =?us-ascii?Q?6vGESR/mgpOU1UsFVxASZ+NE8RIjgWzFWpM0I2buFeGLS8K50w/qEffKyq3g?=
 =?us-ascii?Q?tPZZeA+m5hHHHfHP2W41c3eokkPfdwlYYiooGcvklcNXKiJdLv8bw1ZX1cK2?=
 =?us-ascii?Q?r1yybpooueBD+Wc/WRavJfmqiGgwIENxyLwJbzzXT/822xAttlvvJpfaRjIh?=
 =?us-ascii?Q?vgytQCHJ8zf2OuD3n4Co/6NFRYjuEEOxnb8bkpqpLLhrrxizu6f6RpzRVXx4?=
 =?us-ascii?Q?VEExMUa2EYtibNsVlRBl/zTP6e5TL7rDO7Ezs9Z9WUcbqWXPX7nvJ6K09wbz?=
 =?us-ascii?Q?9l2VeA8M+xzFiVd3rjvUjjcZ9EdGBozlhIELCRaqGsgQFNZD5n7q/aqJZK0A?=
 =?us-ascii?Q?xwlIPyOAoHF9EHVQVdouD7e4P1iVzAj5DhHmWuLn8KglcXw4uNFLSMWU9OLP?=
 =?us-ascii?Q?SfzBfak8FBhAhkDdb2CZYOqbud3J8BdYGrsMObWCn7Lyn3piBHAPqATYJRb7?=
 =?us-ascii?Q?CPNCi0BN7Zsk29FXe8OsK5XJPQuAi7IPazO3P5l4DjeuIkR1HZZQYr1BSMgv?=
 =?us-ascii?Q?ejfQxN58wi6L2NTGhydttabeVuV7HbDA/bUX64fl2eddBNCngLS/Ki6KTG62?=
 =?us-ascii?Q?hLLHUx3ZfY3VjYIWsVqcMcIZrrfOkV3M91tyQpdayacgdbymm7UlEEivZLJJ?=
 =?us-ascii?Q?NFLRoN2oxMfTJc8H6JVu6UnIYe5MCSdhW4EiK1XiwkoWQPt+lGlIwVifv8qt?=
 =?us-ascii?Q?ytwb5UZlSgmX4e3UK3vmbFj7na9jTx54Km259CDdpZSd39O8fjoFaHHFtyR3?=
 =?us-ascii?Q?R+HKMguX88v/BjGH9/HUnozmR+HBZkFe7JqRwIH0cLIwH4ETq0iPa36HKA7t?=
 =?us-ascii?Q?PBh/pZysb7EofEjZrm1GrxGPkwJcjvst60xJ82mMCv8j0Xxzyw5fPp5ASZcB?=
 =?us-ascii?Q?gcJke+GJC7QrYUsam4aKxQNjApGYUtpwsoVNBUC8s9/OVAwGGh+b8dZVQJhk?=
 =?us-ascii?Q?PbSeBRU+UZKqcXd4fHtItfuYqk75k4sC8jdXGviB97A7yx3DRmDSOFMKdmYA?=
 =?us-ascii?Q?8hh8y/r7NuY9r/ctpqodKZCHMlDp4UMEgQYrpRrwQ8JTie4F/8kULwpQBh8z?=
 =?us-ascii?Q?8P59s/y0wz1aGoDiQARoKqP9GX7CjlH8yCFAZvrYGUM8HNG7gcyolqjMT/ts?=
 =?us-ascii?Q?MHdQzlhzIDY5qZ0KnnG02j1SmgQrYDbRCvbyJ8Ho5/6LNJkiO8jpTuJdUojS?=
 =?us-ascii?Q?OcACImYduyI99ogGo7+T/4euD4M0tMZAIs7IYjkVSPl2gzEtzxq438GrGpMf?=
 =?us-ascii?Q?GNQFR4bQ8LfWE84kUvb8TnPJqckubawnN3Wak3z8vRDTUCNpCepfbZKUg8AY?=
 =?us-ascii?Q?eB1kLwkA97MKIlYBHYFLssa+Xjk/yeh3dDSlStdjGEX0dRJHFi4+4C2n2PvO?=
 =?us-ascii?Q?rMmnznPSgCmtWimQQ9dekJN2Le1MluECck/auVOXQXy+H86BhFbf5cYeysKD?=
 =?us-ascii?Q?3BSBtlb9uneuvZqp97ByzLZEjHz+0I/5Ac0/5PeZTcDp6OyY6ZAmE+EWpOBZ?=
 =?us-ascii?Q?7/5+kjEzXF8FuZ1YVhKBO8boUsVqIOkswon8n/B9hXzpJd6LCNdm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840991dd-af57-4add-f167-08defcd557b1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:56.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzPeAbs6JATBuJ7qcTAQCQLUJnbwE6zfxV6TqPB3xBDW40zXo7eTudY+mq91o8dTatKWGD/zRt6Jhcl21vM34aeoNYK0pcXJ2/yXgE3lpSRjC3aWKWHI+N+I7KbB4uWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829

From: Chancel Liu <chancel.liu@nxp.com>

CAN1 has pin conflict with PDM. MQS1 requires an enable signal via a
separate GPIO. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2224b90aafe9..e9d735dc2a51 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -52,6 +52,40 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_en_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mqs1_disable: mqs1-disable-grp {
+			mux-states = <&mqs1_en_mux 0>;
+		};
+
+		mqs1_enable: mqs1-enable-grp {
+			mux-states = <&mqs1_en_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -284,7 +318,7 @@ &asrc2 {
 /* pin conflict with PDM */
 &flexcan1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-0 = <&pinctrl_flexcan1>, <&mqs1_disable>, <&can1_fun>;
 	phys = <&flexcan1_phy>;
 	status = "disabled";
 };
@@ -387,18 +421,6 @@ pcal6416: gpio@21 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcal6416>;
 		vcc-supply = <&reg_3p3v>;
-
-		pdm-can-sel-hog {
-			gpio-hog;
-			gpios = <10 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
-
-		mqs-en-hog {
-			gpio-hog;
-			gpios = <15 GPIO_ACTIVE_HIGH>;
-			output-low;
-		};
 	};
 };
 
@@ -491,7 +513,7 @@ &micfil {
 				<&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mqs1_disable>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
-- 
2.50.1

