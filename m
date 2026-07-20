Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046942BEA0
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556566; cv=fail; b=lHDG5BJerFZ8G5E1FGJYBbXb8YEm9P33CVh53c0taZ2SeKdBrjow+Kg1dKhtdGE91ouC2eSFOlHy+Mqd+FXSw5R2ApvRsb2pg23aF8dgjvAUZGjxtsCr1UYFgqvVqIgyX/u/sMATLfemp3uJytHFbOaEm3tZwo6bOox/WIsGeXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556566; c=relaxed/simple;
	bh=tth5j7fEgOB3S83M/HmbBWCgCMCgcv4FrsWRaOf3euo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t07Z2YqUSSFObIT6btqzxdaPICsWtcVvV7Rkp86SgFFHOA4LnKfS4Fv4i1SeY0/eTGyFHdIgx4JfLuZo639M8Gn2Wb4OhGIl8cWqhfyq3ikjUugb3QgoJPzmGQnzGjCOxRWNqcIsUdt6a9T87MRq9h/R+puBwzAssNLfx3NddkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q3QC07d+; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q3QC07d+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSukTh9c4udbcQFCY1rXRPf1dyveXTw9rqdD3virQay36azFY7bU6oW3TteGIdv6W9r1AooRq0BbCy5TUCDpKTR7q1YW1+kfcy0aUwOAe01RR/kh54Y889i3DUGazgyRHgBrRr5Pwsd0Q4GuQRBFt/I96mjEB3ZxI3/ZhNOI5QwSs5LP0brsxz7P/4kugOcYOaL/YfcQ+gJ8B/YFKYsPJ9G0xr41NKiLPv6QUTgcSxvhQkVisMDj0z3cT2Z6hIU7ybCE+m4XCXL9uVgxALIiY+NM5f2TU5PWygrlY+7PSoHEI//CpzWcDcWM6F1qRC7FOctVtMQXs8c826RW/uFZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4M5CiMeHtaMkugpjtLMVO6aUgV2RQg5sBHHbIYiTNY=;
 b=aLFdKt+alsIcAkWLUQ+2M5htZBdt2XfAS81TK1BTz/KP6/gKKgCfUA2VW9Gv8QBb2c69RRqGt1oM/doxOdaObl6lksosLWiXKijr2PZwJDdFxNNamLNxfQf3J2pVau2qkPtvcHGz5GoiJSM6NjSImglyF8qtboJ74PUEcBtF6tl/Z67D+gcAEuWSRysIeOmb7TulfrlYzp+7UxKk8tyZUQ9P6cu5WtNjQ/ERl97ldFQEAMJQ1AiUf0ULy/q7yiwDcdG3Pkli4V20wfdHFQEqu0botlFRte1kesKRR8AllGuVg+N9+ecfRnnTgDXOGF0D6VHLexHizd0d+AgtXagF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4M5CiMeHtaMkugpjtLMVO6aUgV2RQg5sBHHbIYiTNY=;
 b=Q3QC07d+bw5GqAg4SIYgzklD6yAsvPVEbIHKhTdtWhLtJRfMO6o5rFNKvu3ysMUYyJrHoFE8ZV+Ev76VmufBBBZlkdOQB9C9AQWdRRFWaXegIOmMkzvwF+YDwdpIhwO0FL0B7qTHbVqse7xpIM2TwjQBAO3eBcrVwRDY726IoKTpmQ6b+lJfEPTWw4QTsCkRMiVWcWMX8VJKzQeUIHFzF5rVZ0DxPV/0DRaF6ntzczBuPpMiCD2DcXXwIgYKuPnw6cM0Jq8gzHzgg72W3DEqAKBhpHQ/W95qTsARA8yYmTCTF9dhRrj8rRDkJSMD8IiQLEaSKm5hBAjii2N0VLMtkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMCPR04MB12647.eurprd04.prod.outlook.com (2603:10a6:20b:76d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:15 +0800
Subject: [PATCH v2 7/9] arm64: dts: imx8ulp-evk: Enable LPUART7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-7-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:4:297::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMCPR04MB12647:EE_
X-MS-Office365-Filtering-Correlation-Id: 736731d1-1984-4448-318f-08dee6687ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JGt+sFfKB6Ax1t4b44coSMaOCcSL6TR/kdbZjvsqkOWjl7XVAw6hyxlW7R/fzmOiqAfk3Q219Vq/qldTfKEpBiClYPZgyQparDKzaEXYVCcdyIgHKQrh49iJGihyODII9gcV9Pd1MGbf5DZX0NHYNl9vbjEd5eCXbSRaezyiuAaLSaMQqHu5x70EEO+TWSHAoSQlV7D3fS0EZQpkML/iPAalam8S+lyL599VHT+aMSV9pa5DUIgN1a8i1PkNHyEedcu3YrsjsI7Rky0kuPyFTQcsspU0TpTx6MKwVmvaF1u3OGLc9u0brwGEYJu1IA7qhbEYlWgMtenqzI0ZY5hKHLe0t30J0VT7G9zo0XvmbCk2nS0Zu5nQI2xDYmpBD2ZMbfZT++VSB4zrgfkLgVBT3GIywTh1W9CDH0PXuOCZ+xdOzvHZ7W8GmFsYvDq/7FHrwAlufc1k22RgNBap0kYNTKU8eb7CQITpq/kB6I/XuraX6trMiAk8onucdTfO6ORh4mtIXS22ViVIPxrNROVnn3jS7U3jdzUghea5JPzhp9RIPYeLXWQM06Ewf3hroUg+lyMY7PLRWVJ5YtJrICpjY/0hW0qa246fwUTknR/7d64kmu2iJ7podznTV/0IHAs5XhVl8TtB1O+ziPleQ8YHazaYZwwP7RkzclVqY6h+k48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czdvVHYrVmxHSmZzdVBVdW1yc1B4KzN3MXY0VDlOV1dzSHJzNlpYRi9GR0RO?=
 =?utf-8?B?aTF1N3dYRmRCbXYzSFVud2xobnVrU2gzNFVyQ3NQOTMrRUx1azlhdnJnTkRW?=
 =?utf-8?B?SlBkRW5RNDFTV2J4RTQwRkU4UW52WFlqTEg3TzBtUS9NWlRJUlZhcXRDTWVC?=
 =?utf-8?B?TG9sNVJoUlRpYWlUMkR0QWk4UFNWMHpUd0FLanF6MXJjOWU4TXZCZlNRTEJu?=
 =?utf-8?B?UThXV2M3S3hYTEtqR09TRklab3JkM1paVEhrZUZwc2ZYQzRhbit3OUpHNnRV?=
 =?utf-8?B?Q1dncWw4K2RFSGJTRENGWjQ0MVBGZTN4OTMzNFk4Z0FrdGJaZTRHU1NqNVhG?=
 =?utf-8?B?bEM2QlJlamI0QkZQam84V2V1ZkxjSXRFdTdUWFNZQVdiSUNxUnordVhJVUFj?=
 =?utf-8?B?M0R5SUowZjlUWE5YeXVMWWtOc01FSmJkRThtRXlOT3g3VkVxWHRFVERvRU10?=
 =?utf-8?B?Mkd0ZGRlc2hwUE5GY1c4aUlaYnNpZWZHemplcnJLL2NBWjA2M2N0dXJCSkxC?=
 =?utf-8?B?bjJoUHR4WXpGRHRuT0NoTU9nTkZkZEhWbHVXd1dhbmNIM0xQeVpoMk9sRVBU?=
 =?utf-8?B?MFk2MkVFVUxxYkwrYVJoM2F0TGM5ZFFIbWc5QjhEV0daRldzYVpTT3VONUoz?=
 =?utf-8?B?aEYwUTFFT3F4bHlWYWxHYzBPMURlblNkTFV0NkdJZDNEaU9oTFVBUVJIbWRP?=
 =?utf-8?B?dG1vVHBBUzdROElHTWhmK0RMMllUUCtzbFJ2WktVOFJKc1MwN0duRFpRWFVu?=
 =?utf-8?B?WkRHUjArU3pCcGlvcVFQNkxzbno4Uy90YlJoeDVkT3RHMUNUNDJxU01QV1hR?=
 =?utf-8?B?bUtLQVNGT3E1b0VLb2pJNDdRcmYvY0hxdS9ndXBqS3FlcHF1WElwTm5pMVlz?=
 =?utf-8?B?d3lGQWtJYnZncUJ3RDZqcTFFNktjdktVNnZ3a0I2akNJbGNGS25vVWU5OHYx?=
 =?utf-8?B?K09ZQTBjeXUxQ2FHdk40MHBWUHdkWkxheitoYnlMUXZBeUREVXpPZEoxK2ZY?=
 =?utf-8?B?TTRURTNINTRzcmFRWnZEWXpIenA3VThOM2dVSFNRYXBOSmlmQ2pidXBLY1Ey?=
 =?utf-8?B?RVQvclVFeDYrdGtKSnZqY0xtRlZnWmRhRWE2TzVkYTJSUFUzdHNuNy9MK0Ja?=
 =?utf-8?B?bE50djc1aE1qb01pRytPM2kwR0I3WnlIeDVHZXdXNG55OU9TSjZMeHBVa01U?=
 =?utf-8?B?RnFib1JIcFQwS3ZLcXArY2hwNTIvVm1rMFVuZHhEUkhmbWVKYmVXRlYyM3ZW?=
 =?utf-8?B?TjNsMzZoYmNqVVl1NVF3b0JJSVBBYkFwSW9Rb0xjUE8yS0MrRngyU2hnOW5m?=
 =?utf-8?B?d1VaVDJuTXZWUFQxcUVabmRReitNTlp3SndRSW9uMmk2N0M5ZzdjejFpbWJ2?=
 =?utf-8?B?bGQrbHpTTVNMVkdrK1Y4UmJmWnY2eXdZSUhvaWZMZEgrYVR6ZXIzTFdXb3l2?=
 =?utf-8?B?elJwRGFTNWV0TU8yMEVTNDJwZjhLUzNYakJmOGJITExiclNtUHZhSnV4b0xn?=
 =?utf-8?B?VW5LeW03RjdTWUFCRis3cVhJTk5vTmRjQkZXYUh3b2dIRU90dzNHWU1pS2l0?=
 =?utf-8?B?akhNN3ZMTTNoWnBKOWVEU3VQU3pMRXY4NWdNRlhPdHFld1RDUGNSR056Wk1n?=
 =?utf-8?B?a1dJa1RJUHlTckVscmp6TFdobDJROTdKQnd0OE5kaEVuNnljM29zN2NkdjZa?=
 =?utf-8?B?a0t3MWNGZkEvYWp6bnVvZlV1a2tXNjVHRUdFYmZ4ZGtiY1pJcHpZeVB2Q3hu?=
 =?utf-8?B?K3I0OFoyc25lS0ZVYXZvSk0rdEJGOXlHOGR6d3NzK0JWYzFya0Y1dWEzSG5T?=
 =?utf-8?B?QU1oTmRmSDRGUUdjMU1LSDJuVDFHa3pDNWpVZGd2ayt3dVlUUEdvTjdhQWFM?=
 =?utf-8?B?M0NaZFVGWlVkM1VGSGdtNlAzVStDTnR0NFZ5MkpMbEowSVQxZlh3U0c2YU90?=
 =?utf-8?B?MjJpV3lXblZVd2FMQlltR3BvZDh2RG0xZDRXaUdIcHF3TlBHakR1Y3dGK2FE?=
 =?utf-8?B?KzhBWnVTRTR5QWtVN01id0NLRmdpT2F4VWQ4aGtMakdSbjlpWnNHczFLa2hk?=
 =?utf-8?B?aFJ3T2hLSThOSFFwUUVhR0pGaTJXVS9xY3NaMUJibzZ2Y2Q4WUg5aDE3YTFY?=
 =?utf-8?B?RUdzVW1MRi9UMDJOem53ZnZCa2JmU3J4a1A1NFhnVklROXB3Z2tNckZEOG9C?=
 =?utf-8?B?WlRuaXlwS29Wa0s5N29MNWxwSXF3ZkJMU2JiSXIvWmFxcHpUdEswcnlGM0pp?=
 =?utf-8?B?cGt4RTRLNXBJSnNiL3JZYjA2RndvdW0vdDJ6T1RqN2theEN3Qk1HbHBmVERh?=
 =?utf-8?B?K3k0ZmhockZrTlpSUDJQR2VhMEVjQ252YmUralRQeGRudTExZ1lENFlOVGI4?=
 =?utf-8?Q?kJoweqKCP9kxsqoOGGwXK+tn2w6cXRCHbmHFT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736731d1-1984-4448-318f-08dee6687ed6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:21.3431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jcDVht//lASgAJ83fbbAqsYeHmut2h9dFLn+bfrqUf98LvEpmK6/zt1AFS0gf9LAHv2zot+TqM0aG602rQjNTLe1UGs2DQ8YrxKRjRdKsa2tIQuauY89g39JkNv0ewJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12647

From: Sherry Sun <sherry.sun@nxp.com>

The i.MX 8ULP EVK proto1B revision routes LPUART7 TX/RX to the FT4232
PortD connector (J25/J26 pins 2-3). Enable the port by default so the
additional serial console is available out of the box.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 84c61656f3f2b..9da54291c7534 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -178,6 +178,13 @@ bluetooth {
 	};
 };
 
+&lpuart7 {
+	/* FT4232 PortD: need to connect J25/J26 2-3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart7>;
+	status = "okay";
+};
+
 &lpi2c7 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -369,6 +376,13 @@ MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
 		>;
 	};
 
+	pinctrl_lpuart7: lpuart7grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF22__LPUART7_TX	0x3
+			MX8ULP_PAD_PTF23__LPUART7_RX	0x3
+		>;
+	};
+
 	pinctrl_lpi2c7: lpi2c7grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTE12__LPI2C7_SCL	0x20

-- 
2.34.1

