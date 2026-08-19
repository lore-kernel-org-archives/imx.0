Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047E345ED7
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151228; cv=fail; b=p3XyJUzIeam7+BBDEqmcrrEcSCn3R71wABknIDxb1SsyW+mOm5IfnFRMY21JYL8y7yYALsF2PNNW5M6TfSKjjb1REIsXtL3rT2Jw43FTlL41xe+25bja/R6VnhOiRxMkdBOtNzX0nLi3NetJ5mxLXMrK5p/oxRCae6G5rS4yXP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151228; c=relaxed/simple;
	bh=uY+uZW0ulod08M+v5iESyNAsydO9QvBWIaeg8u9N9DI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ccfwrwjyZyQsSCC2Qmx2soUlp/7IczFZ4jNhHVSz2cEUvMCOSpmUyCMVqUMvlBRYaxKxq+tUv608cvRdFbs/Fki3YXzCoEfl+IAOx4Ddyy8m2U8JFLnxmQzhX3mLSxJlPDJ4TQdlViRz9MlYhILCFx6Y6LHBFh1tVsGc7Dtchzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PIFUnHhe; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PIFUnHhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOhNe3P6afOOSX1XECGnGmI5JA/ZCJIxj+z31eF+O9vU/fMr5o/48aN4BRgQ8MrFcc7NhHuCWUHICrScU0Hjk7eb9p/7AtlmPSFH6cI0lrnwOW9xvxyChsSNokYvLQLK7TPxUqTJyfv9m6jPRIDzf3E3jYsGikJ7tSY4pjQ6xRkd4CF70mOdWL1KRimk9XTdMyTN1nvI7kJluK+VDnznxoREzYFGPaVTf/e0yviu/yxOiPZHCEe6lCb9UzIEh/Cjyq2gDarYpFd8/polrAvYCG8DDmw5K6cgJwWq/nxKECZJKSfqxa974Lpdxos3HeuP3+XQviVduGlkjq5oydlgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9RjkiOCeg55FZGIkDCBAU7Y1LFpE7tEqe2ZqYU1puA=;
 b=WzI0jvg1JqsuuXOVPDMREtwhw8Qhzdt6iYcbY8V/qHmLsqPiRDACcVmHNdOAJXsGfIYFO2kMScVJtC/A/5V4Pbkx1KPzsSNpBSn6ywQ/PpdaOobR9igI/Q+wQdb4ek41i8j8whJ2zbI0hudfjGpPMNR+7tUxZl/C1Z9bi6+1C+egAG3vHNh7guIEppZza8FjMDQ7Tfjho5VbTtud+pEYKSDH6i+AfQVAQLQde8VeBu8jN1FHGgUJ3U6/IJpupgNi78OZlgkAfANVdbXoO2XpGWKKZbNnlMIZPtOyjGfpTgrKCW7i66+MYsVP6ovgfWSSixjmW5U4pWzglhYeXAxV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9RjkiOCeg55FZGIkDCBAU7Y1LFpE7tEqe2ZqYU1puA=;
 b=PIFUnHhePTE46BA860gS8RYIQl/xmVW3ljWhZSyFfHDhviPro5W4LZzdlY47fMTqmsZTZlIjJSk/YfatHNe/4wlhc4Vd19qflU8qQl8IfbBgPMWx/Q62ovOT+LcJHI+3C101byl14NIQyMJQPnkOpoPSLPuyHVA4CBqVWaEfLzV2v1Z1WISPDmec/KPEs2rR0Wo84IZ05/j7VjgPwrsII6Fh301jYmJY4hzkBr0kOrbZUIglTm4WRBGvNqQHkLTHgrwj63Hj/SehBf8f5yfuFlKW7+f14HRpqELpU6ROrMpLvrD/3h1+ijZokSI68V6JLyfAIR4pFpeV59Cb8AkSVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:53:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:53:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Aug 2026 22:51:20 +0800
Subject: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB
 Type-C orientation switch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
In-Reply-To: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: db5bbb76-2d74-4e2d-1eb2-08defe01a830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	08Q6Nu0yQdt++K9GQxnlAfRMkJ63ggunDz5x8xArnvyd4cJyBbEUJFN0UGLnebrGBpStOzCMonBVzBlcnK77F1+zL3sc974IveDjgyiMfO99YGYTz6OWTm2ErMcP5JO3Ku6Zc8hjhLsShO3r1AADOVqpIXJFO0bs7KDx6/C/a8M/IuXYdk90VoIYZnkUfgfiXDlAE+ND2K5/6Mw+WcBzer5786uT9B38B+6CidgaueXlyI7MKStK/yx/Yu/NhfYlMJlXOzJc8zrATbpoZvI9E1WqSZIGKl6A+GT888uNlgcdKwoXQyeQNiIh8i7sUEKycHNtAbLh4GEMbcE40S6Nyzikhuk2xagewhoy/0DSmNRk7SX5rE3/u07ngNRMPjXhjVemK8bSoFj+wzXqkjuq5ARnFupRoEOY4LNSton1yh6NTWyUOHYS1sqvwLZ1WtyC/WncnzbBUnuroZgx6kqUJYMHJNMupQO0vcgKXmuZrcnPnwCyODLxtfJNeOXttnHdNd3P4Z+kOmBa4bWnllQaF2JRaI4zw13rTszVnOw2hKyajnYdo7cBgexVJisg9teCQDGVGiV5hTav6zmgLou4A15rYq4dFWL+qAzNrMocraakoM/CvpeFeI8DaSh+80YYFP/ROjXoOsIg37CciTLEb+XThnbih0vEMPATtzzILeAKVlBklmE2auXIE2YSMlGWC+MnAI0ECfmioiUVknmajw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXdYbVp3U1VSU2FzM2hldlZYTkdHSHNvbEpxWUI0b2RISVRKaDVzR3U0NHhr?=
 =?utf-8?B?dDl2bmVJUGJtdzdlMGNoNGt2WFB4MFpORGtXNDdrRC9ZM1piMEp6R1U1SjFM?=
 =?utf-8?B?TExWeGVLbko2MC9JdkZ0YzhrZUpXMWNzeGk5cGhTNVBYWkdpZVRBZ0MweUsv?=
 =?utf-8?B?NzJqenY0WFpUWjZvVzVJN3gwZnJFelQwRXRYa0xaYVpsNE1YQTlobGppR3Js?=
 =?utf-8?B?Ykx4MWRCV05pdjg5UmVvNklISm13RVpQMEVabVBuT1FCMUZ5MFNHWExuNGo4?=
 =?utf-8?B?cmZRai9IM3JUZ1NtWHBOSkVWRGZTK21VcEpUb3YrRlNCODcwa2QxeVVNY2cr?=
 =?utf-8?B?bTkvcVJhL3NTbndDejdEVGQwbG5GSTROZ3FVbkRQcm9paEFWR3YvUmhOQzB2?=
 =?utf-8?B?VXpaYS91L3hzVGJzSWh6UFdTb3Y1R2xDQUM2dkNRTlhFSEoyYm8xUEg1bENZ?=
 =?utf-8?B?NWVnM1kzc0ZRRHVIZXdMRG1IRVVlL2RJWnFkQ1RLa3BqVndmbmIwZzhJNlYz?=
 =?utf-8?B?VG9ibGVDNHpiVkpyRm5rdUhJRjJic3dGRjRlck96SG1iMk9EYTdmRk05QUE4?=
 =?utf-8?B?RndRbFdFNXE0bWtFd3Q2Uk4vQnVVKzNHbjJsMGlBRDU0ZTJwKzgxeUtuaWlY?=
 =?utf-8?B?RG1ReVhCQ2xQUGpicWtxaDh2RGdKaEQ2OWlENk1UY3FyKy8ySlUrL3pHajBs?=
 =?utf-8?B?M0MxK3R3Q3dvTlpDZnYwSGhRa1ZJU0o3UEI0Z3VaWlBVM0hiWnNtNXRGV01B?=
 =?utf-8?B?YVQwK0xvbUwvZnoxcmhqSUtPbjg5OHdUTk9xM2RNQllPQkVJZkZITkVaMmpU?=
 =?utf-8?B?amlwU1IrZEUxT3N2WitZVzlHSTFpa3BJYUIxOG5OdlR2WkFvc04xUlZWeDUv?=
 =?utf-8?B?OVpjR3crRWxjNGNLU3BOdFQyc29UMTRsSEQ0TUVTemxWRzZxelVPaUpHWXJu?=
 =?utf-8?B?czZrcDVjODZaa09FczRMZzV1YS8rK3JZZGVIOWZCU1RuY1ZJTC9Vam82TUFi?=
 =?utf-8?B?Rk4vTG80OVdVdUhMUDA1OEVVSFlrck1INWErMHhhSTJ0NElVNENPK0tST0VW?=
 =?utf-8?B?R0o0bk5xZ1FGL2Jic2JFaFBaVTZrRmVPdHVOV2NNUkVUK0dKc0tiYTVGNnNJ?=
 =?utf-8?B?Q1ZMT1ZvK3ptTDJuOGFJQ3FnbkhtcURWcHBGUTZBRDFCak90ZFFJdEVNeVJx?=
 =?utf-8?B?U0hwandLMU1pc1hFREZ5L0c2ZGt3Y0tYN2NyTjkySndCZkJGSndBWEhIK0ZO?=
 =?utf-8?B?VjRFa0UxamZ2SXdUV3RhVVpaQnNOWkxUMTdZWU5zWGluc1NFMXNybFNxNW9Z?=
 =?utf-8?B?SU10eGgvR1BaeGtTdUxPWWVPTkU3SFFGMVAxRXZ4a0lvVEFmbnlGeTlXTlVN?=
 =?utf-8?B?R1NvOGhOZ3IreVB1SlNWcXlpa080ZDBTdWx5ME9xMG5xeVNjNUJRZHNzcEc2?=
 =?utf-8?B?UE1acjJZZDB1ZGZLSlc4dGxyVGNhcysvRFg5WjRIaW1tLzVaOFpaTkZGWUxt?=
 =?utf-8?B?MnA0emNGOUdKeUtEWXhTRzlBR0dqYjc5YmVmS095QUYzVHRQYUJPNGlGOExa?=
 =?utf-8?B?RktETXEyTHVrV09oSEpBT1lmRTVUUnROYzVNUzNXSU5seHFBYlVKQy90Lzg2?=
 =?utf-8?B?MGlnUndOMCtxUmh1QVF1K2JDb1BFM0FCcmJQN2RXbVNiS01qNHRSTC9NM0s2?=
 =?utf-8?B?RHpsR0ZVb0c5MGhnWXh1ODR0ZzAvSCtMY2tpKzRDWW12c2J1T3lRWXFtT0xm?=
 =?utf-8?B?ZTM5K05Lb0lzWGU3dzJWS2pEUjJzK3RTUVZtMUE0bE1XMXFDNFZuZThhSUhZ?=
 =?utf-8?B?VWpRNHpjNE51NFk2dW5PS0ZzRWdVOW14UzJ1OGdmVjc1T2d0aldEUWs0SnBa?=
 =?utf-8?B?dVUydWxqMXlYaGwyMVZUN0xzRWt6UnZseUlDalJYam9CZEpQc21ucFQ0dzlp?=
 =?utf-8?B?ZmRXdDNxcHBIZGdVSUtaQVVvaVZiMmVkYXQ0bUdpOCt0andZenBpbXpBUXJ6?=
 =?utf-8?B?R0I0bE5xUjRNSDBOUTBpcFJnQ1IrcGlEYWJkRXAranVkWXp6ZUthalVwdnVv?=
 =?utf-8?B?cVdMTkdKMTBmSndhK3pGbkZLQ1R0dDE1RGFhek02K014c0p6WE1pbHpaUXhk?=
 =?utf-8?B?RU1uZ3RqTFZkeGdBdTdEZEJ2MXVoTlFxa1RGMUh6NnM0eUZRaXdMOFVQRjdL?=
 =?utf-8?B?b3o0L3kzSmh4cXBGRDR0cWlldEV3VTJUd1VKT090M1BXL1FOTHhXaTcySThi?=
 =?utf-8?B?bGswbzd4YjZQTnJpUVR3YlNtL21ubEQxclBCeUYwSXUxM3RTUDM2K2tWMFdv?=
 =?utf-8?B?YUE2VFdsWWI5M2VKOGc5UDNYWHhOTEJPcXlaZnJnNEpVeVlDU2k5dmNHTS9F?=
 =?utf-8?Q?nDruwIQ1nyEh5Uyl8OXWfH5is1Q/eT7uTvjbr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5bbb76-2d74-4e2d-1eb2-08defe01a830
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:53:40.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jFT9cAZQyESO7Jj8mIWCrp0ND1HdX7deraTFmYWRW+udNo6O3a6jV0ebaCw6qWGB4dd/zBJ6G74kGZz0/CqCII92bApad/jE6h0TWZq3MgXOdOHySVRd2RY/Cu8V355
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885

From: Peng Fan <peng.fan@nxp.com>

The imx8mp-evk board has a NXP CBTU02043 crossbar switch between the
USB Type-C connector and the ptn5110 TCPC. The CBTU02043 SEL pin
(GPIO4_IO20) is used by the ptn5110 orientation-gpios to detect the
CC orientation, but the switch must first be enabled by driving its
XSD (shutdown) pin low.

Add a gpio-hog on GPIO2_IO20 (MX8MP_IOMUXC_SD2_WP__GPIO2_IO20) to
hold the XSD pin low, keeping the CBTU02043 always enabled. Per the
datasheet, XSD is active-low: LOW for normal operation, HIGH for
shutdown (high impedance). Without this, the orientation switch does
not function as all paths through the crossbar are in high-Z state.

Also add a separate pinctrl_cbtu02043_xsd group for the XSD pin.

Fixes: 6e62bc736674 ("arm64: dts: imx8mp-evk: add typec node")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 7bdd641292fb..dc3baeac5e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -935,6 +935,17 @@ usb3_data_hs: endpoint {
 	};
 };
 
+&gpio2 {
+	cbtu02043-xsd-hog {
+		gpio-hog;
+		gpios = <20 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "CBTU02043_XSD";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cbtu02043_xsd>;
+	};
+};
+
 &usb3_phy1 {
 	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
 	fsl,phy-tx-vref-tune-percent = <116>;
@@ -1021,6 +1032,12 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
 		>;
 	};
 
+	pinctrl_cbtu02043_xsd: cbtu02043xsdgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20	0x16
+		>;
+	};
+
 	pinctrl_csi_mclk: csi_mclk_grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50

-- 
2.51.0

