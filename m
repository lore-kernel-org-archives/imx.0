Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2D21CC5C
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651358; cv=fail; b=maSmtdFaAz0Jsu5fLORDA8/RJ80W4uRUQbcHRXj0LaiMk9KtHAMEo0mNWx8cVqbwbLlvshKfE1ffFeiA/g2xjAUedL0r4OMJErtquf6K6nrckIAIoB5b/my4TmMQVpN+Pyh1e8erc0oVopuobvYOkSKQw2V50+UGGrGAX5rQp78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651358; c=relaxed/simple;
	bh=2o+LY6bIVHlvqy7xKSZfNkTKSW4KysHlrPJm8W6bSfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JK7jpwRI9ekk45VH7dyqhMUsNmxyUgnNXLQNUqO1PFAxgIRuaE+RT14XASxzQsKsgx4533ob9OYMtU/q2lp+c+ud0/wMZDh7xqKKEjWz6vlhS6xXQahOh20IE/XneSldhtORr5tlYbebXUuwlYcg2Kjf5dU3axDVZmO6EZBe8g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mxOc6WnP; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mxOc6WnP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsQAWtV1igjiYFV0fxe1UAqT30aCR6w1J6XqXHRQbWVU9l217nkqz9lT28kEIoTPkZQ6ecpNJmYgj7Ieifk0ePnHLM/cwBe1rcAyb6l4JrmyFapi6bXaJJ02NmhXwokujqCMNqLdtrf8f90Jg3THJm/udJf7mVVj9PKvZfEnuZ4qPrGMHUvnwk9w2+Rghuon6wYGu+OM2jM4OrmazJnqB+awRhAJbyqR3rSQjz+LFhIyhGs8LM1XB2DQ3vgkm30rJl4JUF7DXGpcqfLxuneDYBB+sZ2aJafZjAysrPFHNpXbISE4KKRvk6OlatbNpcbnEgOG3rSiWmCkJU+EgWbbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9f9mmVtIRRm+RaaO32jyd55rZOqj71C2s+hwfya5iI=;
 b=NkOZAwrp8nX8kh8VPjULyEm8EdHhho/E0kFXKamxIvSNnVpoKDlzhOmwGF6QZCA1P3UquqAM8jWSBYH9VECYAjQXXdUQLO4TOE1D9owKunyZNhh1WGXUiCekVNtnGmPunVSLfcp0lC0cCD+UBt8eLYga5dRoIlsJW04Uc1XC02IKjfIEvsACb8iSCwz9BF/6BlbpuDwLRziy84sdt5RIJI4k8TG3/5aCpkFO7RxA1wkFv2pykDCpvPH+NHOwqKwJduqJfXyRserz2ZC9fLL3UtIG5Sh9MTd5RhaVJs3YExCkfSahToV58ERdZTvkix+aHwViMQqpfS5tK3WlEwJk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9f9mmVtIRRm+RaaO32jyd55rZOqj71C2s+hwfya5iI=;
 b=mxOc6WnPvya97Gjo+ADypanbkGiEUeXNRHORQhuDUymbkYmUxA9hY7cCCcFIbNc45it2QSq+nwJJ/O3T8zJOgblPoRjdnfqDfQfI7cXLaxeUEVuDXkx6xK+QavKz2cIAkWoKv0X9H/O74Qwq8RPATfTDE3+TP6G9PPX+9qcR2gvT1IIyZ92wwC97xy7sEHOy6GPhK+vKXtA8KqpZC5v3HRKjt2NGRgR1alJ49ADa957oizpjFlE1bj3K9k/8dEbgBehaEQnLRJDythw4q2QaqbL7ReLh2wkxoe9wqgS3FLRjODMvDrxeThOoOv2bTT9J7EE8/8k9PBvMCZD1xPfIqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM8PR04MB7841.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 02:42:34 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 02:42:34 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
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
Subject: [PATCH v2 3/3] arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support
Date: Fri, 10 Jul 2026 11:42:04 +0900
Message-ID: <20260710024204.3462444-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
References: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::18) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5f0700-f88d-46b4-d54a-08dede2ce565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fed1mMRa9vhOnQRk1F2YtLNbxGS4Q7RKzYgu7ltSKDMNmhAy7Xjde7QrLD2071QvrB/qUzw3OBMMbFBsv1cB0lGT+ZrHJQ3o4dMTbeFeTPRaUp0EE5ddPhge4oZxLQmpdRFn0kJDYDPl7wqj0mViEotG68C7IAe3xobzT4b56Iqs5JM7HyIqLqISYvE/4OW0HspiO/puMBq8l2MqiqPhtZXrwCAPm5ITF+FVRo/5e0MUoXZShRLI7Rzp6fo25T0ovsiGhszi+7HtxbZfRO9hkNlgNaHhGzFbvU9wAbaH0X+aEvntvtLN8ievXsQKqms4esw+lS37KhRMWGvuZQngJpHfa9B+nt9ho2wiVAlR+wU5iE9xivhy4OCAtQg1dmpulQRfkTHZwrVT/J6jN86egNcfbiK3PQVu9d64vxIOIgtYOsaT8kYTEsvbcdIG2uk3rooENFRiSLq6EQNNCWFCRZa1nurI5WS5t6PpKoDrMMTkfSDP7y66Lum0ZX5tngMyq4NEe88rCLkui2+BW3mfcDefafYZpppBAzUBMTQ9H1Lsn63YZ6boAu4eyRkLDoJsAPHrg/M04dowtgEzv46ngkfUv4PhpQ/LMXvimk0BJPob3WWJClv2UxkTgn8RQLOw3E4HlQsmpEa44RZDNOPbRL4hhSL80QokIEaFrWTUO1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ry7BtsNclSd8n5tnepuxbkI9+zEgOmnNTiTcHpeSkJDiy6m0ADuOcCfs4ByN?=
 =?us-ascii?Q?rVbxx6UTnRAaA9SBI36h9BnzDsvrZuhkxxz4AY561zMfjnPHhojfMqbudKNd?=
 =?us-ascii?Q?tUOmxdLdyrjJYebDYYSicWyAunhOUsB1kuAXHDUFS3+J/6+yyJykwE8vPxBX?=
 =?us-ascii?Q?Njhd8YY/ZvFO61G11BC7fUUNZuTIuPbZ+T7TWguArZiqmpNt6n7SuH++8/B4?=
 =?us-ascii?Q?tHtozlJfVd5/11U82dmuyOizHchyGXD6LoekQK7nFwFiesm4u49pY/zGG02D?=
 =?us-ascii?Q?DvydSgfOYS4vYgYPDTZz2QqCTcBtOQ+UmdPYIb1qeQ9ZllhrsfT5rg/Y6IFA?=
 =?us-ascii?Q?J6pKNlJ0sUDj+LkSiVanzp3qmK7T3B3S+ohMtoRjtgtXVI3tBKH/WgYzarPY?=
 =?us-ascii?Q?k9pc3xC79WV+pOdbOhd2Cyr5ru95E9dnPscjs+3BxPorFK/SRr8HOP/eST+q?=
 =?us-ascii?Q?ACsKnHztw+xONqJr4ZPvC3CMRdIxH13btokm+kkj8oVeVzGB+IIDzljD+Kue?=
 =?us-ascii?Q?CyyNl5PGXRLzu8MYNZ8WyLeMNgpH3a7nGMxNW2iIf/hqsLmRA/1p38b3WkWw?=
 =?us-ascii?Q?23zKer9AmzEDsPf4NvanH8SKwRpAeYrQF52MP7VJXS6o1EeyBAEWoVfZxFtp?=
 =?us-ascii?Q?BddPeYx3uuI2lysKSktTKX3q9e6uUnO7cOvaNm0aJ6K9cqdx5k5cqOKBi3pN?=
 =?us-ascii?Q?fTi/QGdLi3L/tz47P59rDN2qlESg9X/ljxO32y24NYpzOgoxHWVDExiFu+UQ?=
 =?us-ascii?Q?Lbo6Hhadk64hbNIMcAnY66v6po3bib5rZ/LAhhF/TVR+rvpbd65lEO6MgEOk?=
 =?us-ascii?Q?ECFWJvUVUdjuBF42ReEGc6yvBqC4x5vOsMUd3OVkOC50L5ueQ7EHLZjprAiv?=
 =?us-ascii?Q?EjfdOf9lrnY8Z9FPsvbU2wj++0VfHMBOT/v99GHytV18DRQGV0Ct4Pe0YiiM?=
 =?us-ascii?Q?2xzfZMeL6sRmkZ4ISvAi6Lw1xyzPjmVm2b3yA4oB1JUz3yS0EaUjEe+MiXrV?=
 =?us-ascii?Q?4CzdneSmu2aFFNurabGVYKV79awgjJrFvFZ2HZofGL1/6qsJB730nV8kSM9s?=
 =?us-ascii?Q?htA+IX/cd1v/9GgNdWy4Ix8/yv+8dbxru7l1eYUqPdv4w4mqdGACR4CmZFfX?=
 =?us-ascii?Q?at0sz7FUgZ5F1MQNYRQJ2va6ZPdqTuHiVvRLWDqffhmmHPnDl2OvF+yad13D?=
 =?us-ascii?Q?TFt/vk2zj4osYlyYD2voPZPoN+cL1vJwtfUHFnizLOMXcn6b+slX4J/QmMjD?=
 =?us-ascii?Q?h8uB71uB1a3XGrXVHAACvAeYK44+sTXwWKzHWOzZ5J68E6Pm0FF+4GHl3had?=
 =?us-ascii?Q?muT5OfrVih1RaKGsVjeX65GFgAYiDLM6eTKfPrru3oh+54fTGNyDA4Q+RrqZ?=
 =?us-ascii?Q?8/sV4THC1eFxYCqnxcYsmnWSCXFl8lhXXU3k2o/SFSa8Ga59/OKY8z0vBd6T?=
 =?us-ascii?Q?RvEDBO5avXupkuXi7hthXFLQ3xevEF6G2sbGe2/M46bK7fUk6uHckj86W+tj?=
 =?us-ascii?Q?UZkKlVti3td2CvneeufLhhhhULl5FQUu/ZaF4Pj7HRQ+/2NO3WBp+pDcsqzj?=
 =?us-ascii?Q?7tN9etbnn5P+HX9tAsRyu3fRLskmp+6TO55SHJxa+5/WN6VN6hTmedxygPo5?=
 =?us-ascii?Q?v3pu3/g8q5s/QSzZ8dB2xDF4T3zM3qZOfS7FvY6HV7Rv5ON4lpevJ/EwHc28?=
 =?us-ascii?Q?9rPaZKE0GkZHDJe6Z+Q5cLBKE0I+3LkKsr/PimWOK8JzZClfhSdgqX7Vqekm?=
 =?us-ascii?Q?PQ9R5q5yXWC4tXcBm8hIE9xKFLfuHH3VKCYJ+hRRTTPQ2MucoYWI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5f0700-f88d-46b4-d54a-08dede2ce565
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 02:42:34.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFzjRxf86d8wzMxrovPMLvUEEiq7/Sg4bPm+dRXg40c1Y0EwXBzsEOdV41jg3JyQ3XJIJ4MLYCQ7Cxw8XFSUNkKs8aKuktMVn0i6T4UufqDiCblQ0EF7HRFcpB+5ndT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

From: Chancel Liu <chancel.liu@nxp.com>

Add PDM microphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone and
convert the PDM format data to PCM data.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index e5983bb083ea..2f663b1f7c56 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -79,6 +79,18 @@ sai1_fun: sai1-grp {
 		};
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+
+		port {
+			dmic_ep: endpoint {
+				remote-endpoint = <&micfil_ep>;
+			};
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
@@ -111,6 +123,12 @@ linux,cma {
 		};
 	};
 
+	sound-micfil {
+		compatible = "audio-graph-card2";
+		label = "micfil-audio";
+		links = <&micfil_port>;
+	};
+
 	sound-wm8524 {
 		compatible = "audio-graph-card2";
 		label = "wm8524-audio";
@@ -202,6 +220,14 @@ MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__PDM_CLK				0x31e
+			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0		0x31e
+			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
@@ -464,6 +490,24 @@ &lpuart1 {
 	status = "okay";
 };
 
+&micfil {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+
+	micfil_port: port {
+		capture-only;
+
+		micfil_ep: endpoint {
+			remote-endpoint = <&dmic_ep>;
+		};
+	};
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1

