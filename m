Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F109E3A9D9A
	for <imx@lists.linux.dev>; Fri, 29 May 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038313; cv=fail; b=Je++9GwUGdtXQ6zvKH5BO6wvQ8j+V1QgnfQ+b0+4ZtSNq86RuYAxvehV8FfzP1lY8CimK9PTFrFZ9dI7dISEmLEBCOdXEGwNICZWJMGr9gwVQRUMu/HzNzlarAbQXXICom4b54UMuuIMwK+GYc6Ud5/GgA3n2fxkY5EJ76VFdys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038313; c=relaxed/simple;
	bh=lBieqFkVCMSAOFhzAeopUpiRDviUxvERii6ADP0SKFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YsvCa5lGFDHDN+rDaoO47zK/QoyQMBSlo9IBdt8S/jpyIGifdSirCcjL2+v0uIfE73v1t060MhZu/RLMsGNZ9t0vpHGj2SghefEsv9D8K81Jli5w9w7NmZJZdP+c9+dz0ghC4bquh6rpfmK5q6mXS4ExncpohYbUmi4ZdK/5jjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SLM8zTRH; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SLM8zTRH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUxgw2t6yPYGtgrpMStBo8+J9jxhussdlGdAEOwWg1er+hGrevnj7zVoBeDvZjHH/YGJT1EZNZKD//TiB/hhlETvKFP7C4j6VSUMeubmZYbNE2SXFtWAhj4gbX3ntbZMyd1JpEkaeQVUVQ/CqfcpSD7i6VC1NKSye8P1ENQb9jOke72u4OgFp66CNyRutCrwis6nuc3l1XS7LWROPf7NgKb3KPDNHKZ/7CEw4I2ZCLTtqfimmEzg0UUkqfh0/5Pui9BCaXAjqAZ4Op9jZ3sRXu1aoq8M9IKe7h/ePk9291dxGT6YQiNm6pFMVgQsV3UgZ4mZ8dL1TMmJzzYCaZiXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ53oHggRmUVPyZG2ja7/m7/NwLYrggp8r0ZNObz8Bo=;
 b=aAiXXxQQUDUcgaotmaF+wtkKYL0PO/u+3TV4vAto7FtWgqpzjZpK837m5voJ57NHn3QO8orAaDUJfiFXCDiB7/a3AyJ4YY1m1ub/CL2WND+DjMbrDWofUSkQwQmKsUaAGOUXdlSa5W+8D0aBQgWxFMK8azrKbQ0zArPLpFK2881jiwpzpgGG4mc5uOhJYREMtD0hbVHNvwsYxcheEVN/vwuB/NIGx9aynCG+FIC28/47tYrihT2TR2bob9PjIfkAWKD3GSWMDSdI3MrZsfj3sPsxtKQRCkVFlMqGe9H7KLnGt1tvjAxx4bOqrwlIXif0wKiizL0wV1uGy0PPQ2WAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ53oHggRmUVPyZG2ja7/m7/NwLYrggp8r0ZNObz8Bo=;
 b=SLM8zTRHRN+AZ3Mzjj+ait0QY2kAXlfqnrEolPh0Ptqd3gaTw3u8y5yFKy1EkJUWO/yPNuBZ6M/YZH6jOEmAe8w9uAUo9jCNadgkJuSwiX1CbbtHP+PW2fxN0CH/gPzPKryUrFjPFZpBrJJ7Qmt1bO4WWc3wSScMGjmUAyX14Q1QltNrslI9dFgHLEvLR5mbpdDPsz31FQUk3EOrSrip6Ep4y0WXynQX0oTmR5uYroa5yZyUGXZtrLd8HYQHAJqM2w7mmQ9XTXHrqP6j837OcbsdNABPzkGTFXsOXmDWjXU9tvL128+InHZ7PCRxurnfYfvqQXLcbuuSG0XSBSK4Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:05:07 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:05:07 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v3 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
Date: Fri, 29 May 2026 09:05:02 +0200
Message-Id: <20260529070502.1749632-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529070502.1749632-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260529070502.1749632-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0128.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::25) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 507b66ca-b8d2-4429-646e-08debd509d8a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|22082099003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 MLiv94J03n1vw1oUa7uGGtz91TNoewD99spHYHuOLGKBj54vbLQHbr18o5UzXUiTLsZ6gcIU6n9usM4AlN2lX4S1x7/eWQWCXvB8OV0Wa8IgnZ4WFsXYph/3Yh11cTXbzWp61SGi9sAWEbCdRigf87UOubbzf5XKpoJXyxzYKUuyTje3vXyne9PmjG7jAQAgTPsEnqrxb4gArIvYdRfyxNeo7fm8FocGIz9Rj+xJTAW5PVBnLUjWinp+h4hpqhkY4qapjFoWckYTlAnjq9JSC6rCjMD2JovpyDw+wnrrxbs7BKnkjnSsfvir3scIfC8mM3DB5kdPDGUUqF10kPC20NkfODbLf0mSmFZUwZBakqSIA31auS5YvvBTPSwx56prJ9F3DTVfeVxDtwmOpDVNGXgIpKQ41rL5EylMh8rHKezCDmfN570ODnqNsS3s/EtHhy5+vsA0Paf7MSrBqBS6xffklnZh2M3KQgSxJx3xbAtrA+D3pO9aJCOEGI7EeQiPIGSO1vGSBucLGcga2vrm/N52EFgOMGPa8oMrVI//kKR3diTk9p9qKCh5d4iv7uw6KRWUgpoN6A1Q3X6u5Y0h9vVSEaWzZQq0M6HtaNcYQaKFJjQ7HD14oTz8KdUXH8gE32gdLQjLfJF6ACmadoGN4IghTycXu1mJLI9Rgvryd4XlRe/Yiq7dtIksoImZYENZ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGVMdENWU3l4WWdtM3pRZlF0d0hOK0RYNGoyS2NUbUl0OUZZb2pnQWlSRStn?=
 =?utf-8?B?b0EvVFVJL0NUdzljakIxdk5TT1YwOGJzeHRuSUFHYU54UzJ0cnhHNHpDdm9L?=
 =?utf-8?B?VGV1QnVoWWRQV0tYcjJFU0VuWkZKMDRZdUd2aldxM3EzVzNNcXVjQmFqVWpX?=
 =?utf-8?B?SzZLdjI0bUxVcDgyTHA0eDlMYUtkNXI0a3U3NG5LUDg2b0FLMTgyd21RVTlu?=
 =?utf-8?B?TU1pS25xanpXclV6K3NzUUFJOXJqZ1YxVHZxbVFLbGNCcTBVK05DU2d2VDhB?=
 =?utf-8?B?a1JWS0FqUmVQMDRDNGVXUUpIMHVqVjQ3QUJSRGpyQ3ErRmRRRG92MVNSandz?=
 =?utf-8?B?SXJ5aSsydlJaT0w5MW40NU5MaXpMeStNa2wzRVdnVGloMEFKdFpIbHpaNE9C?=
 =?utf-8?B?NXUxOWh2WkwvbmQrVis5SmdzL1pUaDJva3lrSXJIOXpLVzhlZkRMeC9BbG4x?=
 =?utf-8?B?UFJoVWV1MU9WaW1sVDFMVnp3NURjZ2pvbk12dkI4dThSQnBZbnFaOWhuTHZa?=
 =?utf-8?B?OGdDM3d5Z3BRVTFPMGY3TE1NT3VPNW5QUGNjVUJaSzhpMFR4WGRJVStsOHdO?=
 =?utf-8?B?K3hweU56Smg5aFp0aThzdFA0QklPb2YvNFRRZlY3Wmp5dlUyRkxwWWw3MHBi?=
 =?utf-8?B?OS9TMUdSQ1h5MTIwcmVFZjMrekNoUjdRcVRGL2hjbFM3V3lkSkI1K1dxQkEv?=
 =?utf-8?B?Q092SUpVNUdaWlV5R3VaL1BhUjlqY3VjRUJzd0pkQjBUYURPM1VWblhsQ0wr?=
 =?utf-8?B?eFRsSzJrQjlPWjlKc3I4N1ZOQzhzZGk5aUcyZXVidGJ1dkJpc056OVRMMitI?=
 =?utf-8?B?aWt2djUvdUhEcStaNU5EZjI5alJQaXo1KzhEUENPSmRXVmNBQ084TjFOQ21j?=
 =?utf-8?B?d29mUS9XT3lZZ2pjaXJETDNPRExnc3J3YUZqUldWL2FJVmkzdFhYaUc0OXE4?=
 =?utf-8?B?S1BHa1dhRTVVeC80SEduM091WExxVHlhYWdNeGNoVVIvRGI2ZWd5UDNGT252?=
 =?utf-8?B?amlHdjUxZTVKTDZpbmZuTWR4OUVKR3pFTEgveDZhWEQrQlVnR2FhSnhSN0oz?=
 =?utf-8?B?NDJMY0FxUG1jVzI5ZGxINDYzMERrampuVlFOTkZ3dHkzY2wwWDV2aGVEb1pv?=
 =?utf-8?B?SUN4TEg0WFR5Y0M2ZWd2VG00TEVIY2xNM2N0c2d5c2o0clVISGpDM0RvaFdz?=
 =?utf-8?B?c2FFMkFWcEE1MlJyNmdHSkR2VHRpTUlsWTFFQmt5OSs2NmFva1FlNXZ5U2Fa?=
 =?utf-8?B?OVpaYlpCSld3SVFTL1hUTk16YjJuL0QrZ0ExeEJBZHpkSmFFSjJhZnhmdVQ4?=
 =?utf-8?B?bW9JeU5CRU5VVFVSMXYwWjQ0cWl1T1NkSGo5QncvWE1JS29CN21lK0JGYVll?=
 =?utf-8?B?RWlpdVlEaVA3VzEwaEd1aFROelpISkM2QU9VWC9lQ3FZdlgzdGxsd2laMlZ0?=
 =?utf-8?B?YTg1bkI3eldsRllLQStIYStTMmZ5SEc0bUFid1N0am9CV1ZWVjl1UWhEd0li?=
 =?utf-8?B?UlZESG5TcTVnMHhTU0h6eVVvYllhUytQQWtTeG85cTc3VCttbjlHTlZUWDhJ?=
 =?utf-8?B?QTV5NURod1NPVFdxRktHeWl3MFBkcVdsOHNqMnZROWloaGU3TXNiY2Q0QTZu?=
 =?utf-8?B?N3dITkwvWTVDUnRUUW5OTFhkWTNIQVZxWU5ycG13K3U0Nk1HUXEvSE83L3o1?=
 =?utf-8?B?aEp3QkNxNVJaYktyVlNHUndnQXNaenFCRTV4OVRsSVNaZWNNRGJLZzEwUysr?=
 =?utf-8?B?enZKQ1NqZDlWdmlxQmcxcG5KaUNMN1hZclY0amN3ZFNxM1RaTXpWR0psQXZC?=
 =?utf-8?B?eEpEekZzKzFabC92Y2NtcVp5ajhUeHFqby9QYU81UkJ2SExBUWptVVRnMTZT?=
 =?utf-8?B?RTdZdCtYbXJoQ1FtZ0xvRXV5Vi83MUp1eEo2R3IwWEd6U3ZoelBOS09Fa2pC?=
 =?utf-8?B?c0VSYzRPeGdMRytpdlB2SlRab0dEUjBZU1p0WFczeXZGQVFYczRWVk5vY1Zq?=
 =?utf-8?B?OFlmd1ozOEwyWWNac3ZzNzV4NkorelJBVWZ3MFJOdkdZTThnZ0FzMDk5SE5M?=
 =?utf-8?B?cWRlY29Hc3hNdW1qRnBLVmJGYnJQNDljYmZCZjNHZW1EWTlONjFHMXI2R2lK?=
 =?utf-8?B?Z01OMm1LRlpUb052ZFUzckg4Z2tnalJGYnpMeUkvSWFMS2c2d0RrUmtmVm96?=
 =?utf-8?B?TStXU24vbjRIL2ZnUHprYlhqSkRrQjVrd25JOFoxSU02MWEwOGw2a3JSQkh2?=
 =?utf-8?B?N0Zscm1CVnp1c1QxWTlMb0FJZmtkd25UWmZRbXJxYVRyWjBibzBnSkhmZzR0?=
 =?utf-8?B?QTkrVjRxbmloZjQzY3g3ZEFjT2gzazBab1NObzBhUHZDTUZiZ1NSNnFwdmtE?=
 =?utf-8?Q?osRXT8ZdJ87LhqIFxylh2LsD5c8ayoaumR5Gh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507b66ca-b8d2-4429-646e-08debd509d8a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:05:07.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE0vw0l8LnogHf1wpsx/8v3TI8Vxyx0bYfZVHIN6y3KWYQ+Cm5nZPKBUxetj5YWnWLu3TRpR2L320VtC2PgkA0F54JWTJmCGBIt+abJNfiyiJ//CYFCnvyXrmmFz6i+Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

Add PWM0 and PWM1 for S32G2 and S32G3 SoCs

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..9f5f18d54118 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+					  "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..408bf0b40734 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@401f4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+					 "nxp,s32g2-ftm-pwm";
+			reg = <0x401f4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 5>,
+				 <&clks 6>,
+				 <&clks 5>,
+				 <&clks 5>;
+			clock-names = "ftm_sys", "ftm_ext",
+					  "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		pwm1: pwm@402e4000 {
+			compatible = "nxp,s32g3-ftm-pwm",
+					 "nxp,s32g2-ftm-pwm";
+			reg = <0x402e4000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clks 7>,
+				 <&clks 8>,
+				 <&clks 7>,
+				 <&clks 7>;
+			clock-names = "ftm_sys", "ftm_ext",
+				      "ftm_fix", "ftm_cnt_clk_en";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..844d2c4fabf7 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -245,6 +245,70 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	ftm0_pins: ftm0_pins {
+		ftm0_grp0 {
+			pinmux = <0x2912>;
+		};
+
+		ftm0_grp1 {
+			pinmux = <0x122>,
+				 <0xb42>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0_grp2 {
+			pinmux = <0xb13>,
+				 <0xb53>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm0_grp3 {
+			pinmux = <0x2904>;
+		};
+
+		ftm0_grp4 {
+			pinmux = <0x2925>;
+		};
+
+		ftm0_grp5 {
+			pinmux = <0x2936>;
+		};
+	};
+
+	ftm1_pins: ftm1_pins {
+		ftm1_grp0 {
+			pinmux = <0x1d3>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp1 {
+			pinmux = <0x29b4>;
+		};
+
+		ftm1_grp2 {
+			pinmux = <0x29c3>;
+		};
+
+		ftm1_grp3 {
+			pinmux = <0x1f4>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp4 {
+			pinmux = <0x202>;
+			output-enable;
+			input-enable;
+		};
+
+		ftm1_grp5 {
+			pinmux = <0x29d2>;
+		};
+	};
 };
 
 &can0 {
@@ -304,3 +368,15 @@ &spi5 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm0_pins>;
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ftm1_pins>;
+	status = "okay";
+};
-- 
2.34.1

