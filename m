Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC1E408032
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692108; cv=fail; b=LiCnvGV57VV6DAVMW1EWhvMoux3FL381xklrwZq+wtFRkaC++dc9Gxj0Y19/hVXCz6LsCfmANvl+zu2TqAMJXwOHzmuwExdg+4n1LTlNjSAWPDYBMeUYeq4aX7ImohIUgFNLkbAOAWGh9DGjSDre8GmA7LIiTaNKKD8O9ZC4Njw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692108; c=relaxed/simple;
	bh=Bx5AUoWnKveKScCYDj8PJFq9IhmUKP3Op/PN5yB/9Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JzFeuponZcZxMolE70xFOzFvU1jXTKHjls/hSkd9uXC7ZDvo2LjSKgg9zYPz3Y6ebV08NcN6OioanVWN5AqHZR/XbYd5Fjxqj67gCmBywf+D5JtfKiFmrQa993pYxj5kzctjlCVQpFUEjhLMR0aQfgigH+4eGBSJN5483e4i54E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ed/JUHxF; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ed/JUHxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLsmVnqr0xhdlet7osyaSgFntKC72pJZhf4SN175bfaUjxG7tBcfBp412LM/15JLBihRcQSRW3QSzUT6bFxb4QFZ9yUqQOV3DXQRTAFJy8M/58EMszjthNZ2/MuEesQ2u5XlQ5BEuLP2dMm+xSmqZb9FzQbwVPWgZXQGgcPvgODC7nNkV2GTrqni+AIB4Korv0w26p2PKdgo3H+LLDky4BzlQ0Sjia4suRT/3nppDXt8TrQy1l0skWgEYjEiI0DnM0d4TwFZNjiNXVvjuJQyEmqzI7U6Zb+mBOX8OLmoTCjysqrx2B7ckv8WCDKVO70I+H/vyzQxSHHCQbtiQm8XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kudPXqFCVM5+kF19taJasye0WYenp1cj4oV7CcspcG8=;
 b=B8F0I+MiUtKgD1QscX9C17okvzNzYZg9g40HeIV/Bjmqty6UuCKE8ujfiaLsnVf/tT1lomi0bC5Bq2VexxisolO/xtwWXheRWTybBCk2NfAKp/FwXXqoy7H06Ilg0k1n/DtyhAFK02XwwKP/8YVG0v+Euyupi/QuNNA7aLShzF+iSvz6BUceE3UsJGsFz+l7w+xOI2iShVMgrZa6ga21YbCRgn7dzoC5lWdwBNRzGc497GbBJmKlApH9tcMuIn7mYVHm6yvTqmW4k8lOwdcwHe5K+Th98mt1VVIuEj5MMrMgnd2x5P1dsgEaTjnSboD7zKOLempD61YbUWIoGtuizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kudPXqFCVM5+kF19taJasye0WYenp1cj4oV7CcspcG8=;
 b=Ed/JUHxFaotVTb9mfBOjdHnjhCKR5JtVKNultPA+PGOhu8v5IEaSrzu5m8ciNYPME9nnRlkP43rNJB/FOJssgJV1drW5P0iKA8mpUQObzMaOqdlXo9GQ9a5gevXTmAg3cHYjGD5yhp1/5ZjbOAl08aQsTZyieOyktuXcibW5pUoM4U7HsEvCEKb7hPFNveApJr0tYkP3j7mOtPxfD8SRsva9UXBLGQl9bwlt//2mVKtPzqPldoih+sf5wtbMLta8GjnNtaOoOsuDYfBJPwl2CtHg8gTU8x96OBgKMgP0GMED3XlkzoNo3inlWPe7g92Ie2ZWMLREK5bvxdy9X9f27Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:43 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:43 +0000
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
Subject: [PATCH 10/17] arm64: dts: imx943-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:14 +0900
Message-ID: <20260814072022.4064009-11-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::13) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afc6eb6-865a-4427-c9fa-08def9d4b159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4fhBXBbH6IwQL7ne82pqLeM20j6Yr9IJ96Tof/RBEGbYy7kM1GfvKqqlPQDoHHcsaRMSahoygoTblbbbBfBddOWJZib7f5eCDM74jCAw8Wj+Uq3/zsLJSU63Blf7O1eGlBA27IIBwqNCai530oi+CLk9fFQkpW/ZNWj9t6zAQ7vaPnxcqpUPz3hEUtIcDYua3eBeW+lXbNAZ5AhU5AElbFZipr7esRbgwifoOTERhVEMJph4yEGnOHsCqxVulOEw/6OUeI4XMsVgkkI4r6RiuHHcIMrlh02iQMg84HGNY/V7AkCj4aWOsTbfMRN9ScdETAS6DTQV4YoXljX0TZe4cew/+KhqLQJLMh6CR8zr2lkTl6TZWCo8uAw7oailgutrKYJrb0RZFLQF5r6cVA0b/EfkMO25suZJOKQvnKUwj3QFdL5UbUnb/Ha0FQVxJg+3plrvZsduqbp2Xp1U4A7loPhHTQYJZhLqVmePGHUhfiw2AGBiFgxK3hK2eGRqC2R0uvBjjQUT415JcB5ogcT4bpp4WbH7dchayk2CZC5AHN9PS2BA5lZ7iW6CYrFiE/AEblzRV/+BmUzw/e/jPfODZdmf1zwhbEjyWO0Xt83mggOiJYcoL9QRGSFpevI2s7/ucNaFgSy19/ua+66g0nVgtHCEuJPi8EPekCPe5c9jn+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8xNt3DxrNCPoyQ15K4wt8tKWjosdumwMjvO2UWQPtv8EQ9qiwR92G8MhYUOY?=
 =?us-ascii?Q?Bp4uuRKHv16jRgU4efKk1V9ABnaSyJmft72GnVuPmhpX+nPBYonlTQ3sIROv?=
 =?us-ascii?Q?tSSPGI1YznpjLGGZwTASldVx3YZTaXBe2ISD/Nn5XeMPWMMjyWFHns00/KMY?=
 =?us-ascii?Q?8HAXE82IV4EAHrlRy8gV/CZ6dfcZ0be9zc5sXUkSUXbHXO9d1YQwPq6Eo0uC?=
 =?us-ascii?Q?K0MKiR/NCmfmx91GnZxJeDfek2APPTRd/DN0Ou7uO2E1cugSw1ZL1ygRBCCr?=
 =?us-ascii?Q?3nAH/SeZBbevp8I0Vv1/wGu4wBjtGvnEMZLm71tH7tUp4NJJyT8SlMv7wgbY?=
 =?us-ascii?Q?Ag9MRWKdUoNvVDOIPh/Bzim6PntOBI+oWqdqXCA53GqDFWYvgtHkIutXtl4u?=
 =?us-ascii?Q?bXGC5YgMmyXGR0zEm7BAz3q6BN3tzRLwgOIsBfOPIkk83TZVZAFSCgd9K0qH?=
 =?us-ascii?Q?yL8LM39dkU3T9Ikjh/BqTPEVjkEIhyO80XBoZ6m1Q6KE6KekhueNsBlkEvOv?=
 =?us-ascii?Q?o14qt2bfaMhdJTXcJYFoQTgIWcekH7pdiPn3bTZ4anJDcw6X/DJijNeIyBbZ?=
 =?us-ascii?Q?j5h2C9PWcK/W/nQ5tOsF2pljEYEsHXea7brEDmu0a/vDinfGcSZ1SyyNg5nC?=
 =?us-ascii?Q?P53PoiOaK5ZU23t7JudKbnBq+EN6RJZnIsDGHDf6ulK3/GRSihXQWPTh5/Ej?=
 =?us-ascii?Q?I3R/wNFXpWnRAFK9Jqr1RWB+A3v/8Xl4uh2L+k0IemVt/xZaU4BBscoIjdR8?=
 =?us-ascii?Q?6jT3VAF87F2oNQwEZiwgVQP39T86sUNmBz1Lek/tNfHWGQYj00LgffKoR876?=
 =?us-ascii?Q?k7MFGH/z5/eEJiLS1F31SXtD/t3CYa2/OXLjM6qLYvA6GFwv+ZgsluW3pwXq?=
 =?us-ascii?Q?Pv2jh5+yws0G0NeHQOaBE5jX15YNmuL/8VprON/VM77PnPz7xgfJeTReHBDE?=
 =?us-ascii?Q?CECMDWaFaQRRZrJeatlPqW76euBeUyb8g84nEUS1HiCmAi0mcCmuRNtVcQm+?=
 =?us-ascii?Q?CxEQ2WAQkasXYB7XprfRwpd50gcAK4kvrofV893NCkqKVPn4JZ/PPQYNgbkO?=
 =?us-ascii?Q?iPoXBUOjIaEKOd8ZAsaHYg7W1rGlE+z8iXN492j2C7XrYEqhkDeVatFhS+23?=
 =?us-ascii?Q?qdP2z5QPZYEAFPixeEkfM4WUOFm7WOQZAAXB2/RrpB3wBJyeEEyx9TR/k3lR?=
 =?us-ascii?Q?Lu5miedEyPLm2I2VZ2oZwNm6YTNbsy8xb/+0X3XDb7qres9LQ6LwNENQevpd?=
 =?us-ascii?Q?K4IecSL6QKngtjsi3lfSEvJ6fA4HglCG4d1CaDUk7I2Dicc4qxYJuyTLWqxS?=
 =?us-ascii?Q?QlQMBdJJLOCC0IYO3Q1I1WjM5O9CBHpvsiYxTeEgPN8IZcQRtcm7lky6Dm8v?=
 =?us-ascii?Q?f9LqLUSYD3RlRMH4ZxzHAZlu7mA/ITFxlr7GjTfgnKdgfo49RDg8vacJu9Zx?=
 =?us-ascii?Q?phCxF/1qLkyFS/JqT/e2Y8kMaoBvqI6s3Djyfru+Eu6TtKqiAELk4Tge1Vuc?=
 =?us-ascii?Q?fokT03O22kAbNjqS49/R8moB2wwf/Qp9ArUhifwjifdD9vCOkKZ7reDDlBtH?=
 =?us-ascii?Q?lG35lJ1buO+IINf6L3OOgZPfXN03rb+LaOif7PcsxpzM66MZI1nQ8cAfR7rP?=
 =?us-ascii?Q?yh6DWSyoUUDyxCuR5A6BvmHUL8yGB4aoYvr1fcQ0GhadYh6XdZY80/MeoNwH?=
 =?us-ascii?Q?3CrM6Kr/soXz4tI4IR1OhZaJL2IOkYjwfOuWEt9GGmqxj6NwREaBRGT093AZ?=
 =?us-ascii?Q?m48hwyfqkzjakyjGfJ7OYG/Ezt+bTkDsgtt8dHKKbf+Y3IcG4QCj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afc6eb6-865a-4427-c9fa-08def9d4b159
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:43.8513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0KCbK+XzaMYg70V7RupY2c7N0q+IZUzQXJ0wgTxkylJVD27BRCPcdXS2h/lL4k8xY/H02dMvMMOJQ6ngUK/tQfh9Lo/QsSreX7DbroQc8H2ORG1OPLDmRaSG/PatDym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the WM8962
sound card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 07b782ef698a..389def180b6d 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -341,7 +341,7 @@ cpu {
 		};
 	};
 
-	sound-wm8962 {
+	mqs1_conflict_card: sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
 		audio-cpu = <&sai1>;
@@ -720,7 +720,7 @@ bluetooth {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -736,6 +736,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>, <&pdm_fun>;
+	pinctrl-names = "default";
+};
+
 &mu11 {
 	status = "okay";
 };
@@ -782,6 +787,11 @@ &netc_timer1 {
 };
 
 &sai1 {
+	clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX94_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
@@ -904,6 +914,13 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX94_PAD_PDM_CLK__MQS1_LEFT		0x31e
+			IMX94_PAD_PDM_BIT_STREAM0__MQS1_RIGHT	0x31e
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
-- 
2.50.1

