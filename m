Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CF44684D
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317748; cv=fail; b=bOCmAOkDQnujcV3gWNW0EACmjNGuQ+1mp7szziPFvfSuDV5oA5eNXRE0i0fJjx2ralCniX9lC95MygAi/GUBNhF2wkWHtjS9I4MefvjPaFDTVF6xHAlAdjziQVpm3+iUCU8D5YvaUOm+njOP8EOh59XNN9rSOcdbKQo7R3AOcng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317748; c=relaxed/simple;
	bh=YY34KofgzW5mTyl5I1H4pJJUwsm0rttqm4wu4X+tb1s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZfLxr+y7vOgaK62kswX8dHSNWK7ks/s+INS9WBvCAYuskDugGtuwqS+F0EW2pObQeTAvcR9DdmuGUkdwQ+cktyKibmi66k+7qg6rqXnkl06Ypp7xPcskKpZfaGDoYTlQkS1r4UJDv6mZVkRPr7UBxgELjID9P7K3/tXTgChQJlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xa71Cngc; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xa71Cngc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cc3ziAXPmKg9CAmBg018iHiI0BcTO71gS+wWQ5ev8ggPqpwhRBYTr869/jVKIrru14ejHr53V2rYSXMbqEnb3TvkLfqTopgQ06N1XTz0cBLZplFC5WSTkdlhBvUNSuOm8uywWoftwc0MofAViNiyyOVhozk8ibu4CCcTcMOca699ckZx6sYFGngKHjnsDWOKKU9dvC5Qo4tYxdzp59cVHCgKuSVaE9X7BB9Lqu6/rzYtZM4nJiYRsCnw3D0FruMpZmcZLD6ZZEH6Vq0wRtT+bXrb+It6BD9XEfJMffZ+q65/CLo3br7N7SDHUxHuxTO2vyhkCtQIZsYDdFq8vT43Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD6nJ6nSTibk6JfQud23ZhegZ+9dpdtvONoLwo4eRNU=;
 b=KDa22VHpdL4bkuPDl9CPzmbgIOM4+JsVhW5p0SiXRSd/apvABdOnKDuDfg6eLHxeBzQHfW680GwX9lE4jVh5M6LncgjJX/319K6W7R2dP2M7s8+eKQNp7EzyKO7nYNzSgg0/vZVhtEZSIiwGygb6G9OpYNeNXq1LiePzYznGKZ9YJB39aJj2H2CGio02qPl8RBiAyuW/WDhcIrjBClMut2JQcROD4Y7Hi+/p2d+t+ViohSBwdxggSnXgyWotuxP21FYwfj5errsBQ+zsXSGjr9RqezirdlLCfm1bVxtnRcs317DqhPeXobU1SpGO+82zUPfqHxxnG7SHN2Ae4CNAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD6nJ6nSTibk6JfQud23ZhegZ+9dpdtvONoLwo4eRNU=;
 b=Xa71CngckKQh6skQ1DFu70TcL4ZEK1jvQXmHneiZaj5urB8/0UweUKShgE5LwOcklrO2dbIilOKBlC0XkQt4UebGnYCV19dtZhGTWR2eY3mBDPQ4MuntcSXnYl3y7Dm7cG1ajq0cF5tAstD+KabemeJC2y7r19w2qjGUGhkgFAiOkU6DxccGGHltRVr7L/cYg5fN9IDO3RItgKU0ovm44D7OQ9YxeFPpFQdweVPea/2932002/vHGiZOvYy/SgS2UMvJtSvT0/SIZ4xDiWzAQf7SjRpILNwmpU+guejp8KKa7LHVMEOceyitTKEDnSZBpV2G6+Fzn8Ehn4Z5c0K2hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:35:43 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:35:43 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 29 Jul 2026 17:36:29 +0800
Subject: [PATCH 3/3] arm64: dts: imx91-9x9-qsb: Add tianma,tm050rdh03 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx91-9x9-qsb-panel-v1-3-4d22fac95e24@nxp.com>
References: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
In-Reply-To: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|MMZPR04MB400504:EE_
X-MS-Office365-Filtering-Correlation-Id: 20811aa5-6b99-41ac-a992-08deed54c2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	adgDbqsLVHgvESdApCTquFyT9LvXcBWJZw3RSCI0fEP2KSamTRz6e6A9eUBb2Z8LLQNYRVTagTVISThIokdAR3XpSlF0uRUwbqKNI70w8dRLibc+3zxSoFa2PSn6LiT4j/o6eOvMJcYbxzJo0WQpxmZ/+V+16pyidHYuz8AmteMnpb6KHjDn8haqwvXo3PFkKfT7KWR+g1EIgUEdfXE6yemdY1eAW9ktbdph8bi7zjAPmF8hCG5g5jeFhsDSeliy6WF8GccKokoZn2qCaoPgaw655EGfyVQ115dDiwL7y6b2RwN1auiR8AL2mOf/gzi1jfV9yI2awhNXp4UV48w4UIwH85SYrt6B32NrAVdo0Tm02skk70F+4H67KJMWPvCtJzBWahtNz796KWt2+CEMX4tyNRsjCpsRTupSS/SR3t1Sqfm3ft0WeipFvQ4FzbOh31d3YLSky7EdwsvlKcGwwk7p6CuKP33DLH3JgyJ395C5saek/aoJ0h3oAgaoh69r1phRXlR/kQgS0BXSB+9V19zL4H+lFaaRmVXTdEMJ1ALYsDuCqYNoH0WCd4GRf7ukhjHi5dQHCuFkE7W48FVJmzxshl1NoCJybfvZL9XyeKhghOnFoVrx7Sdrsh7SEbVZZ0NEubEVWP8OUSgz3HKnnDoA/qHedsQYGSZD3AJHq+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVaeHNtU2ZHaW1jVXdqenU3MDlpbGZvTklHY2xHOG9UajNUY2J3Nm53NXhD?=
 =?utf-8?B?SkpycGVFQmpldXN6UWNmclBJaUM1eVNIam1yL2dacFhiV1N5cE8zWndVVjVX?=
 =?utf-8?B?UVNubGlyS0VZWkJvQ1dIWGdwZlNJWkY2aWRIUWoxZGtSL212bzZmakF5K2xM?=
 =?utf-8?B?d3ZqZjcrTjZYQzl5eS9nVVltemhreXpnTXNENFY2V2xTa012OW5uSXdzN3d4?=
 =?utf-8?B?RlA4QUZVdHBLOFJndDJnZVZrL3NHZndzSThwMmpUSkQ5Y203ZUVkL0JqVVgw?=
 =?utf-8?B?TVFNOWtkUDc5V2hzNWM0Q2c3RU9reWU2eGVYcWFxY2ZHR1BnUTdRTjFXMnJv?=
 =?utf-8?B?S0h6cDFOU2YzcnY3N2R6VWJPQVJmTTVTVk9rSUlwMDZXVExRUlNweFIxbUcw?=
 =?utf-8?B?ZjFqS3paMmNVeUlKNWJOcVF5bWw1VlRxbHhid1JoNm1jYkd1eXFKdXg5cUFM?=
 =?utf-8?B?cS9JS2V1UWV1QlBEZ2FNdjhyWDY1Nm5YSXRsWjcySFFoNWNqaUYxMmhNUnFH?=
 =?utf-8?B?MmxoNGJkbDRMYzN0UUswMWUyM3dUckZjcWZZTWd1SEg3SkJvTkVvRThFZm4y?=
 =?utf-8?B?TkdpcC9QVldtSHRNb1RGbVYyUlhaY2J1cFhmRTBPOTVVVnlzeFdOUFhsQzZr?=
 =?utf-8?B?SHlpcjZjQkhjeTFHOUh0d0t2b3d0aUR6STAxWG45Nm95Qk9SOWdSWlpZcjhT?=
 =?utf-8?B?QlZlelcveWE2NEtxMG9lQWJnRXM1M3pCdGZLdHlacnpHYnVONXdKQklobVZK?=
 =?utf-8?B?bmt5Ry9Ia2VBdkZVcWVDY1JoNCtXL0dDV2FKU0dKemhuTDczR3JPMi9USU52?=
 =?utf-8?B?c25uaUpzMC81ek42TDhZbG9LZ1kzUC9oTXlFYjdhU3M4RDVJaXFldmd3R3BL?=
 =?utf-8?B?VHNDbFByNFNIdFhmUVNTS3BIaTJqSFJrVW5wOW5XMVNPelg1dFJBSENqeGhV?=
 =?utf-8?B?NHZVNHhVQ3ptWUVrTW9VajVLYXJKeDVRVG1EemNnZTNxcWU4WFhIWGlnV2Nr?=
 =?utf-8?B?OFpvTVNSbFNjNWxCcHlsRGsrWFlkbHhJV3lTSEg3bnRDK0ZjNEkrdjh6ZExy?=
 =?utf-8?B?bUVOdFp5bnVCdEFGOXlzYnUydU04dUkxYXBRZGtWMFBYam52Nm1wVlBQK01P?=
 =?utf-8?B?VUVpczE0Rkx2ZDhvc1hxQ1VpeDZuRVhWWmQvTHpnSmlENXk5M0gvdDljZGEr?=
 =?utf-8?B?RHIrNHUrenVyYXFxQzZRNDFHQzVmaEZBUjdaRVIra1JjeGpmVjdyS2tZVVpz?=
 =?utf-8?B?eHNFdmhBT1lNQTZ4UHBrbzIxc09vWHpjZFVoZmJqaUJEVEFaek1hSi9GT2d6?=
 =?utf-8?B?Nk05OEpmSGJzUGM0UnVDY2lxRVVLMWhZS0prRlNvZFAxaTJubW5YN254dWhF?=
 =?utf-8?B?Mms2bkpkYUdhTVpLa0h5OGxaOFo2Nk5TT0d4S1ZwTnplcW5HMWx1b0lVZllv?=
 =?utf-8?B?N0hoQnBnQ0RXTmNxZjFwbHJQaU5KMU42dE55ZHlvT3NoVHRnWVdEc0ZNUUZV?=
 =?utf-8?B?aFJxZExXZ2dDSW9tTW8weGdqN2YyWCtnaTRwQUx3amUyY2IvYnNNZEdhOW9v?=
 =?utf-8?B?TkxFTFIvTi9pR2xITnAzZ1NvQ25nUkRZaGVUOThiSmhtSzltL01WT2ZVenFv?=
 =?utf-8?B?M2xwNEdhTytrSXhJYTErRjU4cUlUZStSOVlGWEtXd0RpMjFCck5Ya3dWeXZR?=
 =?utf-8?B?MFVPbmxEMTJPSzBpc1p2Q2pCd29kTGFYMEtnN2toL2ZuQjZWZ0ZnUzBaZXBx?=
 =?utf-8?B?aHU0TnEwU0RZMEROT2hIckIvMTI5aVFhSWJJeituKzVHWmZWNUNKUlVTWmY3?=
 =?utf-8?B?Y1FROW9iM3lqNElmRUhHUzV5Nnk1eDh6YnB1c3Jvc0NJUHptUzR2ZU5vTlFZ?=
 =?utf-8?B?WGkxUUtvWWdWRU82S3c2YzlLQStNMnJVc3Jla1RIYkdoN3J6VnVUc2tjVks2?=
 =?utf-8?B?ZUYvKzR2a0FoRXhUNGtzTWJZbUE1ZG83cE4rNmY5Umh5aW0yQkI5WUhsa29m?=
 =?utf-8?B?OW81c3ZXZXRPZUZ4MlQ0cWRCOHZ2dFVla2lrOVMzQThoamFWYytDbTFRM3NZ?=
 =?utf-8?B?WmdqdFVaS2J3TFVPTUlwODR5U0VnNmdKMlRXUzVHTmFRZFEydjU4RWNQUnQ2?=
 =?utf-8?B?ZzZocHFGRTZzRFJtSytIbzRBMmI5MHZJREUwbGpRRS9VdDg4TUVjRXdrVHJq?=
 =?utf-8?B?YmxNRllSYk1uUlR3R3dFSkV2NXF0MURSOElJMDRlSVRuTWNvQXlvekpoeFdL?=
 =?utf-8?B?WFViSk5YVS8xNm0zcmdHM1c5TlpSVy9pWm9JMUF4Q0RUbE93emJTenJRVDhY?=
 =?utf-8?B?KzJoWVEyVWNxbkhpNVp1L05MNkNIK0ZROWpmY1BZZ2E2eFZYZVdhUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20811aa5-6b99-41ac-a992-08deed54c2aa
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:35:43.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEhqDMsS2YhnGJCBXkrFGhEgFMwm0EJXThTyGvgYpOVlZClXLntp4eRFxbYmAYNkkXIdZ9KIvqshOh4HwtyuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

Support tianma,tm050rdh03 DPI panel on i.MX91 9x9 QSB.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  51 ++++++++++
 3 files changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..ff8cbe1c20a6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -610,6 +610,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
+
+imx91-9x9-qsb-tianma-tm050rdh03-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-tianma-tm050rdh03.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-tianma-tm050rdh03.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso
new file mode 100644
index 000000000000..01c22f92e0d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "imx91-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpm1 3 40000 PWM_POLARITY_INVERTED>;	/* 25KHz PWM */
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <80>;
+		power-supply = <&reg_exp_5v>;
+	};
+
+	panel {
+		compatible = "tianma,tm050rdh03";
+		backlight = <&backlight>;
+		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_exp_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>, <&gpio_fun>, <&sai3_tx_fun>, <&sai3_enable>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dpi_to_panel: endpoint {
+				remote-endpoint = <&panel_in>;
+				bus-width = <18>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
+			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
+			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
+			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
+			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0		0x31e
+			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x31e
+			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x31e
+			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x31e
+			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x31e
+			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x31e
+			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x31e
+			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x31e
+			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x31e
+			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x31e
+			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
+			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
+			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
+			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
+			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
+			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
+			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
+			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
+		>;
+	};
+
+	pinctrl_tpm1_ch3: tpm1ch3grp {
+		fsl,pins = <
+			MX91_PAD_UART2_TXD__TPM1_CH3			0x31e
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&tpm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm1_ch3>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 044b37fcc0ba..f1ed7983226b 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -75,6 +75,27 @@ sai1_en_mux: mux-controller-2 {
 		mux-gpios = <&pcal6524 9 GPIO_ACTIVE_HIGH>;
 	};
 
+	exp_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 22 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai3_tx_rx_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai3_en_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
+	};
+
 	pinctrl-gpiomux {
 		compatible = "pinctrl-multiplexer";
 
@@ -82,6 +103,10 @@ can_fun: can-grp {
 			mux-states = <&can_mux 1>;
 		};
 
+		gpio_fun: exp-grp {
+			mux-states = <&exp_mux 0>;
+		};
+
 		m2_fun: m2-grp {
 			mux-states = <&sai1_mux 1>;
 		};
@@ -101,6 +126,32 @@ sai1_enable: sai1-enable-grp {
 		sai1_fun: sai1-grp {
 			mux-states = <&sai1_mux 0>;
 		};
+
+		sai3_enable: sai3-enable-grp {
+			mux-states = <&sai3_en_mux 0>;
+		};
+
+		sai3_tx_fun: sai3-tx-grp {
+			mux-states = <&sai3_tx_rx_mux 0>;
+		};
+	};
+
+	reg_exp_3v3: regulator-exp-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "EXP_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_exp_5v: regulator-exp-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "EXP_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	reg_vref_1v8: regulator-adc-vref {

-- 
2.43.0

