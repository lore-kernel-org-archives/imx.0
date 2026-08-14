Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18F408623
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692086; cv=fail; b=gG12G2oBAPhd6uK1aFXq5r53c+GHHEig70XHjXpaPlesY0vZ/RSr+aksuiN4Dveta41GarUC5Z8/Sa2khsy3Eng3UKEb1Nt4kSEquiRhZyiWOARgK5P8lLlmd7ORl7WDJws92JMApF/n7PV+wjE8Vko9IsUwA8SD5ZJyhFZ5GNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692086; c=relaxed/simple;
	bh=nVQU50HjfGxF5HEahcPRwhULhSy5RSqr3JrH5j1pxeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKdfagCFwpLwr2GjSjHinHZzwnBtvc2BZoEa2WN0Vw6zXCherW2UoE84eqPWnPPtkCxBnn2QM25B2YPuSMsa/xH6EPRKAUZcATQtrgIFPQVf7Hs320dv8D8cILGEHyov7H7FchqKhnW4zSemFYogND1ms/mzFvPaFN4KTQSR1vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J0b9D1of; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J0b9D1of"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWlT0f7K90YLnxsPZMSgx7f4Are4y49Ak5podt9B6owzZIUn41hLGSqFhsX8C7BUciDg7gdqZ3Dk1vRDSAECrOBOyvZufztiE2S8k1+OHos1NIOQS7T1rYEe7sbLr/DK/uXS5otD7rteXPO8sUuZ5LexI3zKg0laOchqB4FOKiyl6+NMY2KE03ronEDN0dt8dhKmPLS4OQELcnKHZ8K4iUmcTFoentuw4tWMy9dNz0sizYqGMHOcWyVvRPn1rTs3KuxtyF0qnp1/DqjF0fAOLZm7Zc31pXl5pobNT6f+kgQsZeucPwqbtTB1vvnwAEh9SK/JSO8wh8OoP/v3m6VNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbczlAcEwZO0Yc4uszYIKjyOeW4za5zTty0E3tzXHhI=;
 b=m6zUEBB6jh/64ih6wbenJY8puwyJ6WPP9SRCh0EIa9vjSZOzI5/0HbYstwOPbSisiNMv8niKpuAsjWRWuz4UVnTwSmhPX9Y6Xuaeg15xi9IBUfiSauS69LwjN1rOJcxnfeh+5r2mzI6HVDUm7+HqbBw2M7q8iHm46pNlS1ukW93O987QphWMuKQIUXf3Tb16gtu+wIe4Y0q2LyJFjCfAsGyjYO/D3T4kk6n8VhlIl4Qm//UvUKtG4vZlBhw4KAtuuGp4qKTVV2r5lJ0E+Ju6tfxSLyZpCeifhd9O9WyO4IMpd/yl2AsdgGEDmMpgAscyODZmVb3+Zt5ImqJ2xpmyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbczlAcEwZO0Yc4uszYIKjyOeW4za5zTty0E3tzXHhI=;
 b=J0b9D1ofx1Msx8h/HEujJ9qn3WYc2cajnrlm7XMWyK3m8AQm0yiadqoVfFE+pRjNgemWIX1UV8SGMkK3GwKjqnkiRRmWMGRzI/uv8v2Ybj/K1tj5IG1chJjY8sF10yuhmq3jsrdJGrPYE84/HrzLqY3xd3aYHylDshxZ2rFBG3QJuxOGNsaakXWb/14ut1dblTvhLQ1YctbXrVEFgQDjE+RBwirsMIEzMWgrCiqDCNQAT7U1ta+FQR6YdTA6gPmmESq2O7zHAWzsTUrQI4UKsPCTLYolvI6bjk6yUZQRqYJTL2w8kwZr+dz7MPVU3Kj1Fo52EhWRe6KZmh/Y7areWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:21 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:21 +0000
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
Subject: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices for MQS1
Date: Fri, 14 Aug 2026 16:20:11 +0900
Message-ID: <20260814072022.4064009-8-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0147.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3e8332-9297-4ae9-0e4e-08def9d4a43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Dwi5xRxBP6QVVeqpMdYDSz34z09VhE4+vGh+H9Wq7gYVHQ08oaicoyBif+7vorCD8Yd9d/Ewos2yyAUnuQCVUSIZ6oyI7JCmBTeRpM7iqJqMSW8zTrnOTUVcDTG47P7W3nkwJ2LGmDkRXYlzfBBJVJyZBdR1wXQlvIxJ+KNTvd0DrasQknlg8t4tOPQeC/8Wtz9zCH4NMfQbn+vQ34E9cCLAIitk02pnMcrLirbZZ4dsYqBjmoU2MUc/PljlSNz7RsfCyb9/pf5dFcYYQKcBKP05JppsJpGaAubTNTQdvKBFOxq5smPGskX0gpe8dhR5YoCdMWmQWn6qpwmMQECdQdMsLckTiYfLYFu0H6wk3UjPQdzeg+yYpQKQKxMtTpGAY8EmltlDOg8NB/Ge9v7QuXE0tPsUfYFmmV/D3gNHnnu7B2f89boeJP3pDnQfK8lyUvK2qHjuXQyytP0ehV04YHbNufzuNERDjaYXYfJPQh/gXMFu/Yf8wYH8zuz4xWnNlb/jcxzBuRfSvahLdhpx+Vvldu91O/I9O0GvyYFfciwi0rpRKxW/MOyJWCAXEeHz7u25YBivV8YX15MDIcbuZreHXpwqxNUvO5uiHM2mKtkU6IXR+mECHwIzQNwWIAJMjsNQBOIr5aYvZyC7xeeP93XCfxVL1FEpKSRnJjGQ3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fo+6WaBDWlUrAC/dfWIp4eO/93CFyeht4ur+9igRxoPce6zmOT40PAAetmuD?=
 =?us-ascii?Q?uoZ7ZV4cAj06gJxiDGE1VAW1SE35DyTc1WVEbM2UfMOrDuZ3omKtI/ahhG0x?=
 =?us-ascii?Q?EXM8h0V1Np+hG0Ulr4KEzWh3RAaxbfcBOMkjiQ7oacrh0jLINW0gc5A3DUCG?=
 =?us-ascii?Q?hhoZ+K2yX5HGfZ40zwlG7eSyBDZ2UNkyevrmdUbCLh3aOGo/EvhRhYpU+Jbb?=
 =?us-ascii?Q?SdmrHKgC8YgzABhx1LV4Pgw3tM602c9K06TKqhFUs+v1d5Qo6XzcOeyg/Jbt?=
 =?us-ascii?Q?2GxnoEva0rQDH1DbJD8d5luAPBSX1TfzskFYUSGev8s+7ETD5M1ZdDe53wZm?=
 =?us-ascii?Q?Hdj70Z4CTFCY1BYKCuMrHZC/Uvcw+NMKQeU7f4dcDrPaB14vd5uDL05W8jrn?=
 =?us-ascii?Q?aZx1dDNxViQ1IGu2dCtZqvJGqfYaw5p6hzFWW2oaVgmSMTlHXYnWQQAd5T60?=
 =?us-ascii?Q?EIVi+EPxW8JASh4IG2sN7wPhMF603+Tjqg4VDtABAD/9b8XJtsH6iSJD8ZVH?=
 =?us-ascii?Q?bhBV89ZMOJaS8cEXhjccONAAaImILFCpXo+FOMLplPVUuYB/V3E3tJnGjx1m?=
 =?us-ascii?Q?kmV2Pk/n+S4+TrDRsOq/tBqyyc83DSuAuGjCsgTjmyUyGTEWmeuBcqYbnabO?=
 =?us-ascii?Q?ir8kSD/fqM7y0E1MmRxhDgTHy8fFOLKfZHX7knrGLFYuXJCQS172CDMxVLik?=
 =?us-ascii?Q?S8tyjot9JD4A0Orp/VaEMwzHMzQxp0tr/Rp68MCKJhtMe93xWhnNgFgJ/Bb0?=
 =?us-ascii?Q?nfp0Tvxdtw+qH2wWBBDgYCOgNjnHDzuehSCZAIAqlEQvgd9mIGeMrAuXt/qK?=
 =?us-ascii?Q?9ovUe5nbo93Syi+hTEUyB1eeEf4rNm8XBMWp3t3wQvM/Sx0W1MZgVPpk/ZGq?=
 =?us-ascii?Q?MPnYPAlQGNkQOWPtLeq6Aap4ua6ze5lsSVdsa2gsK5U2xsYlWTO+9K1ipAUy?=
 =?us-ascii?Q?gUMKhRQveEueo3cF8bmL0yQGJnJBg7Ub5DiHpawE6sUJzNvdgl5o0hnPJ7+4?=
 =?us-ascii?Q?n0Lrue5mIeJBQ8uGgZegpLES8ryjVmcq3ZYCIMyswkhr0I1H1QgROSdISLJa?=
 =?us-ascii?Q?PmV4qCEDSrB1fYz0pTy9ES4Ue4dVyzXRFNPCjFohDDWToYncFVmn91T7N6rW?=
 =?us-ascii?Q?5sS1cE6EO9Msh2jwCrm7hv8Y3YPGbbAOjnHh0WCi67CvFurvuDOAXGt8x2rv?=
 =?us-ascii?Q?VeVZ7fm8oFlN8BpOmwAIAboJkt1RkKNE7gxWa50pJCbmYPL5t7xui30SWg5D?=
 =?us-ascii?Q?3ZrsUbm2Nov2z0dRAeQob9H7nl7T+Q7lRTrQMxItHLNGCJUTZwbw+plImMeR?=
 =?us-ascii?Q?nq1fEkrBsyI+NUdiHkNyZmofkCXMfUcLHZS3T+P/oYx87pYDenPqF1FiGFMf?=
 =?us-ascii?Q?UgP+hpHCzqhVAo1ChONdn59SUBdmAqICSAIn9a+HHrbzzhgb/SFsZgGgpC3o?=
 =?us-ascii?Q?95t/udq3oZYK+p0Vi9D/CN/8pQbQhV7ISJOTwQHVUaPLjSChoRJ7M3FzKURh?=
 =?us-ascii?Q?i6T854PPdl0CYv6eiQZnxXRkQXRYxtFux9FouaG6xqGtEgNI/N8GP2VeR/sy?=
 =?us-ascii?Q?tXZahjIOzDVkeXWvlqTo1IQccn4ubgEpGjSMwTVWnhPX/0P0ZVo+ep4+mknF?=
 =?us-ascii?Q?fVlKfBYc8urkbhWDhr5A22EVOXg656hGslC8CJ+42Qda6LKWYAElL8SI5yIe?=
 =?us-ascii?Q?HcDlakF/D8shk7ArBYy07jvKNp9CpQpZW5t9KeiyXfwHgGa+isM/9HF+D4qP?=
 =?us-ascii?Q?KS/wEeBxKO5XtN9rd99rZ0DuVlJCzX5snzL0mrFTMKq0zH8JxNd5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3e8332-9297-4ae9-0e4e-08def9d4a43c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:21.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QWov3oWIQKEhunwp6APMQSJZYaW4uG2tNRobd4aEg3UaFQMgLjpzsR5O7Sk0AvIblFnWBfrAm1S0eAEmWukKZ1KPxzRvcIZiQkHc8T3XxP+8fhIGBo4gRD/a9JTVcRR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with FlexCAN1 and its sound card conflicts with the BT
SCO card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index 502237fab332..11bb7e52fbb1 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -204,7 +204,7 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -282,7 +282,7 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
-&flexcan1 {
+mqs1_conflict_dev: &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
 	xceiver-supply = <&reg_can1_stby>;
@@ -450,9 +450,18 @@ &mu2 {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>, <&mqs1_amp_en>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -570,6 +579,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-- 
2.50.1

