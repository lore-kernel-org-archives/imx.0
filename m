Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568EC3AEF35
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022221; cv=fail; b=nmhWCl/Pv4Db+LLTb75N3WFi/Sjd93Li4zJR46+nNcB0WismZxLcLQS85SBD2HRICgKf3WSaE8PRZdadvTOIM6GdUHI//UrXMq4B6UvowzsIuBn0T/m9Na+xqXr/p7ggxKXD9HmHJRp61mUR490DxfAfG5xuGc/5HdF+zrhU4Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022221; c=relaxed/simple;
	bh=hgV7SRYAHVxnbMfzOujFJ1AidQ/wTA3K3PvUZsd/R8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H0UvOLZJc1fOH3IpgDzWiqP9n4uXFIavnfo6Hjtg45taTbDKq3Xz+0DqXWPF0OvdqHIe+oOxxTNXoMxG/eDJY2Q4F+bbwP09ayR7fQDaXhK9HmIOhiivAX8xClWxXKqN8ZrxgvT1ZgmqIH3NxQtfdIF7u91XuTnv+3KpooGn2l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xv1A2hjf; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xv1A2hjf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEIK3ZSXD4KCoWOF0TxQnXC151zCHEkLEKPMVzejyXB8TOPyn6jpNR7ux0w7RPsimFWHClcmOJoGwUOYd+tOsGYXxMt6Nu3uJPRFq9yHXsQYnI6fuHHOiC3yA8hu7Eu8CkNTCca8HVbeBBSMTH7SZUdg+EWQ29USDzTkY9RI4L5VnRFlUZ0RspOD7FUF0SvUvWgAcAqD6Dz5Zl1J3KczQe86u+JBcwbEdHDNMLxqPzmo+QZplcDHwAD0VrFoTfclK2oq+5Pyl5030bxZGSpvUjdENegO63clcBYtfjLTZDuhAOYHXfkRWeFSd/wSeUqDwBb8BEHYdeSIKflAFM6FOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=JpkfIR363B936B3/UMqOycFYBtH8uHaf/2s5fCgBnoZBmlO8DLt4B/fpj2b5tiR/NqdKKAoWFc3lTbGGGrzTnsvJn3OYqDsuWe1RfpngXwhCCUsA7HbnVvLdcTCus63kpQoE4lqe/T0IODPFaE8hLcmZZm9cJyspaYV90romRFsRnoIy6Y9ySP0ztKmzHoH4cOfFoSmipUAgEbpF7adH8Iqpzc7wuO8v1gSrPrrDGd/ZXrTZHyxvEh67GpcaKWtu6axuUDsBprjWVrJTaSk4d/xepf6xrgXchIh1iKVUpQ8byak9sNDiGA2JigowWsnx3nof9kuCOZ4LUHAqKDV6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=Xv1A2hjfTrTeEMLBT0TzHxB2CmmWaM7Mx/DQOl2b8qF8PzmzoRSYwh1NHJhpnIn5R1clyfaB1ZMUrVw6YdkQkSx+I/EMb2HaW0E9pJUg2vNNzog1dPwLAUQlvNafKo3bP6kpG+ttjG5ynIcTBdQkyrYQXcpVkAox8Hoa4KsvjPGurqpA/Jbpf3zN/HG/mm/Hhir0kEFXIJ7oFFJhCszXZOPWd8L5zr3eQt61t9GejUKONyMf00e8ayoRNVeqzOcoCKqFUKLlJolSGZwRAYvm8YxX9eYYlvronnHMndMOE8m/Ue3Z8FvjsuDigVI+ubZ2bjLQ8nYJEpOwxvdpY0Uflw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:15 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:15 +0000
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
Subject: [PATCH v2 09/17] arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1/MIC
Date: Tue, 18 Aug 2026 12:02:03 +0900
Message-ID: <20260818030211.3141710-10-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0167.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c4e6e4-2066-49e8-fdd2-08defcd53f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|6133799003|10067099003|18002099003|56012099006|11063799006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	EG9A1JiCepBYJewx+ea9V0zc51ciMtmMnpntvEUNO7kowlt4ocmqkQzjZ6mOBMikaOUNztjknwm0LHtuDlb2z6zNWoKwJBQ2MCh1HMpwkR31jnW/gWcTLyA2bzmckTroTM9OSIK7a6ymiKLW068r4UAOLEUU/Qg/T2iBd1P9Zwa9fnZugXn+/3fin/sv1JcDgrJXyW+k+Ddnyvde3ichpDMle+7FdyRGzFaXocP8d1Uctd95wk46k3YvAmZs0O1VK6a8fN4+VFrcFXj4Ahx8OI49VQp4WFmg1mwtqqRz21FDE1omDvk3cLhDxExO7IYFBVnABOclaLy2BRkGtwyLSkNM93imQTCw09xSJTWt7zz0xqXUSek+QmvA0NRlDAAb4PQPneo3cXn5z69yut5xJhXToWT1DplwOb67rGQ+evMsCDyvQLEisLJbXjBGTcZhtGY+SOa2IKDq9o+IhfUztb/xBQqBEMAuEmfdKRPyYxIaQzU9geIV4/TdtQbbJgRlw957N8WVHNp6kuGegxgca8DEZrSkCxtCHvAExyImW9w0sRk4JhFDvIKA7S1WMzfhWJCtAmamOIeEUnrO95LRGvnMZKU/4y9PsuVUPO2Ou3Hd+MnDQnnStqALZdxrfSojy39pR8XMsng6hip1pbqgZPzNl93fZvI4FIDm4LSS5fA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+7aenm/qxZ4rOMbPdcTNSERR66ei7P/jJeAZr2BE0T07cQCYjjnkWMTUuwfG?=
 =?us-ascii?Q?MmW1mJ/YNFZFnQkqhUVWJe/5Cs46WmywCYYfszk1judzak8t6pFja4MP2MEi?=
 =?us-ascii?Q?q9JJFqzc9J2jcMsUVtfVpB+5HL+5DC5wqQARBQtDZK8ET+5y5W2a11cWylQM?=
 =?us-ascii?Q?nSvnuwriLY3l9qxq587UWgjmchi7i462mx5mCEew61oV1e9ifcQzAPEIVuij?=
 =?us-ascii?Q?qkN7fKj+1s/OroQ2ZPiF+cD/Q2Jf0RQAsjZhK3i/M9DMiSuCkfNDOKQMIHMg?=
 =?us-ascii?Q?ZoJrzDZEtwTmjWfvVsiZWWZtsptYqkFch5nTsnHKaXN4EBQcEbAlj/k4iDEv?=
 =?us-ascii?Q?GTctYC3SeGUxdCl0jVINnI1cOI8u2/YMt9A6uen2M9/zSm42h0xHMeq7WV9p?=
 =?us-ascii?Q?05Si761Rm8snSxjCEwUBYTY5Q3CWbFEunv2WwrPvi/06DAJjj1YE/AXETD3q?=
 =?us-ascii?Q?QAzBvmBG/gQow+jHzSwtYPEM0+BVP4ymDzE/fu8crXVbsLC2qgEvlRO1Ha/M?=
 =?us-ascii?Q?tL6/2R6LJ6PnC/TsRNeBP8Vbo9yprVYB4eFqT7x5Ar73ZnePq9loKucSw+H1?=
 =?us-ascii?Q?T4C88V1dep7LWkRB2V7PJOqLRZMJcx//2dVQJ5/Eqgs9uc3tH73DdHkqgNOV?=
 =?us-ascii?Q?U5MF1N7hC8D8c2yew3vSa53MFNVYuBPryaWgSe5Dme+pVmijDSRvvRqWLs+X?=
 =?us-ascii?Q?yTNQg5dxRo6MTF7RLs6h80FKj8BmXYXtaECUEdZJVpMjkQu+79GDKeipKena?=
 =?us-ascii?Q?QmpwD4iK5Loi946EKbQxeLwPCD6RPWFf8tZXBFwJV9FsmbIctNT+ECB/tehy?=
 =?us-ascii?Q?XZBxBdS3TSuZxZeb6DQZVA+CggAAjRG+luncqG2ziaAcrrCAnbyXDRrIlvsA?=
 =?us-ascii?Q?KYujRt+TY1HZqc5Y8pa5TfWNvodVHXbqc4YSMSAilcvaGl1AVBrQWX0jlQM/?=
 =?us-ascii?Q?OZAUy73pUj84LmSLNwjpft7aSGSJjTO/DZXIyiKLlCSu4aCieo8TooQAd+lw?=
 =?us-ascii?Q?5qACOT7vvZjrsTD5YBiJvH7+HfDwh9TF5UC/eWLMxodk/x5vqWxRkCi/HY7m?=
 =?us-ascii?Q?wx3rq1utMH0scITFZoPFUH7BKXRNNr7xAAlzWGNJ3BI2sgUPB/Ne/cBbLQGF?=
 =?us-ascii?Q?GNVP8jonAKE91DMGMlgjVWFixLsYN09CFNahGX0/ub9T2gT97d1cn/ModSpV?=
 =?us-ascii?Q?BfbaXDqp1V/Y6hZ2xCDcbmS0SRqf7Ryr0Sm/yzWEojtme8qsYari1d1uXGnn?=
 =?us-ascii?Q?Jxvq5sHcUADDQtbHdDrrBQGwA18ZFiqT6pM1UCM4bZ/hcKjY5oq3412sab6K?=
 =?us-ascii?Q?oeWf5Up6hhdloe1uL0q5xvI5K+xV8B/eYARiGqYaDAc2BGL7Cb8hmMXMvfYC?=
 =?us-ascii?Q?v/bKZMAyh/7sdGLCyXpFbzR2fl+KFLcG1ln+SiL1JWQpEuz0zg+QVI1yabsv?=
 =?us-ascii?Q?mSpOoIaU3/9P9UGNBTQiN0MIaeFdA8M9tFr5cgCe++5OPb5B//z11IUAPifR?=
 =?us-ascii?Q?UKhCIlthpcWqUK+S7pSrVVXcIlKhciuq2uGBAkZXhkBD+GZd+aZAqrd75Mzc?=
 =?us-ascii?Q?5BZ2ypjmg3LbvaMy2uxvCK3ss6XfntC8swfAgFOktAXZT9W+Mpbt+n3qAMS0?=
 =?us-ascii?Q?qC+ihtTqFmgrfE2TRK11v9jVfN+pqitU2eZR9I0TN3IIX0v5nuOnkyw5q1Ya?=
 =?us-ascii?Q?mWV4UbthlqsFPP8mtrvmszD6CQxVU8NoPBU/R2Cw07LmnqGEAPbjMZOT1Zjv?=
 =?us-ascii?Q?xOvi83tpl4R/15XEWGwMN5L6oDLNmLtGQN5ZHz//z+EtS/aUijXe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c4e6e4-2066-49e8-fdd2-08defcd53f28
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:15.2283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jWxfzyb6JWidNIWH18hgPrt1RkTtjvApQLNd9vX/uUialgi9pR0FYz6dkU9Ney+R0NTsGEj+CDgVhQBv6Zi3GG2Id/+Ghkn8UWf2yqnXtDYwB5Tbi9b+74EOpafRrti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

CAN1 has pin conflict with PDM, and MQS1 has pin conflict with the
MICFIL function. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Update the MICFIL node to select MICFIL function via PINCTRL.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 49 ++++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 64660f94f4e9..07b782ef698a 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -38,6 +38,40 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c6_u44 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_mic_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c3_u171 11 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mic_fun: mic-grp {
+			mux-states = <&mqs1_mic_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&mqs1_mic_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	flexcan2_phy: can-phy0 {
 		compatible = "nxp,tjr1443";
 		#phy-cells = <0>;
@@ -535,12 +569,6 @@ audio-pwren-hog {
 					gpio-hog;
 					output-high;
 				};
-
-				mqs-mic-sel-hog {
-					gpios = <11 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
 			};
 		};
 
@@ -651,13 +679,6 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
-				/* pdm selection */
-				can-pdm-sel-hog {
-					gpios = <12 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
-
 				sai3-sel-hog {
 					gpios = <11 GPIO_ACTIVE_HIGH>;
 					gpio-hog;
@@ -710,7 +731,7 @@ &micfil {
 	assigned-clock-rates = <3932160000>,
 			       <3612672000>, <393216000>,
 			       <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mic_fun>, <&pdm_fun>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1

