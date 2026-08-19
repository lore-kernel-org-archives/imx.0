Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7479D344DAE
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151230; cv=fail; b=XagdU08QDzsx5kd9k6Cqni4kmjmdkOL6u2SXWtTxa1MjbHxRU04f/ohL9Jx+sQwl6VTO0zRLkofLaVPoE1g9MsyVq0ZED23scioTy4+PBH8n583ZgruLKd/gzMR49PhCoUKQ2fp08f2FOh+juRxf2c2G5RERN267u50ru3UbAZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151230; c=relaxed/simple;
	bh=AtAbXZ8b3BSEK1jtt0F7km++T4C1FcDbDj+2i2OSjic=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=if9xGLPKI6oGGgR2aqHwQNbHfpYmH2zR9jrIvAof59m4cXQDuZP5fwquN0+g917ldAff77OE9FcKwbERrD41MRWXx1PfU0YiyLiSgUxEjJzUjRiX+pp30X5Y0z2dEylkoAN2aGZq7jcmiVj8s2LOGymLH3GitBqwWb0kKGD3CnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hdL1lyP/; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hdL1lyP/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKuWmG0sT0Gzhoqv1U5g2Jnah2wzt5FkwZB75Xsxt7kzrn8iVFVBD0jogzLLo/Rhy8JA+Chf9j/Sx3/xeV+vX1EdBk5q2q4g8uNuZ4rtEmQJLSIRUV/+YA+AMwcq8gJEc13rYRvCCuXnOh9MSoyL5lZSe20ylLXXer+yMkwk8aF2qlUQW3jnMm4HqIePMdNuPIyhBOk62T+gTMWHaP6vK8aPNZpNXCNUxCrxI5OjKRikHqNui+IaVZb7XRzNLXIQgA8ZQFh4y/B0ieRX7n/Ew2wh/7OzTbBpJaOjq5CTLRUZ2/3hhn6cks0sS4n06uMNEtF2y2hJHhF40Q7RCVHaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5G7yvNvVU8ThE4y/I//SBf/9ONEpgGkMvAYTwRbdng=;
 b=SRfjMaMFD8r4cmJryJbNZRJ+LW5boYhmh4ysyFAG4JMXoqvENw+5+dGVz6baP58zgEM+zTTdrRpdEN3jGpsaZYA3MODhKNyDoxWaNSpNK3pQ5BxT6DEhoBBtCN0Cd90lwfdzHf53tkUp+mojXpjkvxKRZXjTs0qt9MriAWBJvERwgKI8MJeewLjeC42ZUOgFHr3l1mdI1hK5R4f7R6XsBVWaAgtkCdmmZn6OolXMq7Fcalm9AyyBqXyL384QJUb1YD0VB6VFC0OhMUU8qRH/wKS57/6sAu9bWE7IRdC7Nt+0BvyRZ6zDUEEcJNzHRtt4I+BIQXyIbR6yJzQhQdXp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5G7yvNvVU8ThE4y/I//SBf/9ONEpgGkMvAYTwRbdng=;
 b=hdL1lyP/JNwFOFxB/azyyYfOhd2AaBb+8VgxgSW94aJgjR2zTlcPMRN2VEpd2bm4kZAak7TBw6+0BPaaY1sqkEzQ0NlnYxmb6nG1cFlANdBGQ37I4vu5aNxDPC71nnMhqo/oX6NqYkzjPhc3nUleCFvB8I9trApLre3v3AnvJUcA7zbtNhqWRQB8FwZOZCXHeUt3H+MVrQ50KLSETX3tqZNVcZyM8O/6/UimmTNye/81/bif7lTsuLJ+4JUAgMSUpcu9B+YLCV4a9sPIXq/d8ByT9U3/Y2HkUYUKyMxIQia8wXwhQLU5ESqHzIH+0Pre+Zlr7y3xfsiZfJPfTkhC+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:53:46 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:53:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Aug 2026 22:51:21 +0800
Subject: [PATCH 2/2] arm64: dts: imx8mp-ultra-mach-sbc: fix CBTU02043 USB
 Type-C orientation switch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-imx8m-typec-v1-2-befc92ecb70a@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 691a40f9-079e-4ed1-2dcd-08defe01ab95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+RRXMF9YW7/K7X6DSYLJcY4fh9GREbcbYFknIFOPSm3n3J9IOMkCMmCw8U9mE+a0Y6MvugUyi95w0B5LuI0Ea14TKzACzZWvow5Nt2eSDxGS6OHEQPPu7EMKriZlo3fu5XC5q/wRNDvzu5xIXAKcX0nKrqIfj+asKSHWhKY6N6R0aUrmVFio7hMvTMgMg5btLfHhg3FtCdn9n6bwnoA8Q9MYwtKHepUKyi7foQ1PVjy/NZzxRXcojUKGUFIzgcSifHLgb/p+hRQ1yXk6O7TxgWz9WczsOtxCpVch3NjUE4Z+VymL8wsGDzalI4WvqPwWhIgM8bS2M4etYYTkL0frUj5ABgMzqt3uGw9e0gPlfCFoDezVj6ig6yQFWOYDWNAFtCh5k0b2OVJIUl9hbi+4zNL6qo6wWUJGVvmtsuwEtpSFMEtSCki6KqOLt88oYm2LnalIjfy3Lulymc0xaBEmRPJFJnldsR0PZHPnNOHdcyeCpYjhvukJGLlfs64Nxicy9e5l2zzawCd6V7ApEqi+PnUsdgqCXWB4+Qq1LvegkGJp+UenQqNtVv3thdZxQ+gemH6MxzFQKzlj31fXMdGHGi2gadU/Wlw4N1a7wMr7aj5Bs13GnfZmwyXesVSly6MB/XPjBcd0JpGr3PNQBBtkiJjsCNDiWrM8i2FiKe9Y/CKqb4IvEZKyZw2HWJD/zJ60Y5V5KzuqqLA6jPHuvPG2WQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZVZXp0RytNbWdGWXNtQXJiWWwrY3dHL3U4MnAzWkdrN2RpVXU4ZHpDKzV1?=
 =?utf-8?B?MGplcWNPYlVoc2hQRHo0Q290Ym84WXpHNHgwRWltV0pMU0x3YUVlZVJ2WlE2?=
 =?utf-8?B?Ky84VmRMRlQrMGh1NWJPZGtVT2lEczk3TnBlOGsycnN4bEJXSmhiR1V2RGpi?=
 =?utf-8?B?WmNnK2FGbHYxR2gwcEVqdFh4Q3R6RVZremNKSUxOUmYzWElrdG1wTkc1ZGxo?=
 =?utf-8?B?WEMvMUFLQjZIZkZ2bmdFZm5PMm11YnNVV1lMMm9TMFlJZGFoWkxscEZldDMv?=
 =?utf-8?B?MHBMZlE0NVMyZ2dSUjZqNm1MRVp4UDgyR0lHWkxCN0JVTjJUaDNuL0UzbDRx?=
 =?utf-8?B?aEM3NkYzK2ZhSTQ5SVBYRFMyUTVxVmNlM0tlb2Nob292Q1VvaGNOa2RIUCtz?=
 =?utf-8?B?UFNJVThEeFV6dGZKY0JoMXEvdjFxWUF6Vm41UFBnN1FtZGdDek5EWVRkc0Yy?=
 =?utf-8?B?Z2FmNWFsT1VuaUdKd2RaLzRmOTFRRE5IdU1TdDVxd3dNL2xGaXN2SDcrdHZt?=
 =?utf-8?B?OHNualI3NTBaRUs3cXBkTGF4VnBDNTBwNHY4cm1KckV0S0pOMUtaeWtDd3Rw?=
 =?utf-8?B?V0srU0RNZEorWWVNRDZqOFo3M3plSnlITlZoaERSdmx3UDFxcWJBWlVFY1BS?=
 =?utf-8?B?YW5hK0xtZVp3NWlMdTlsU0JUejV1VGxGcDdENWtmUkdRbUhWbjJGcnpLRmp5?=
 =?utf-8?B?S08xRUl5alRpNjZsMlc1SjJ3Z1NkYkZibW11VWhGQkl0VjhQVDhCN3Z3UXo3?=
 =?utf-8?B?TXJ2dDA5U2s1NmNLTzJNNTFZRVVZZTZnSEhMY3BCb1pGQjZudGkwTTFmbmg2?=
 =?utf-8?B?WHR3WnBjcEtUTlVUcVFTZTRvRGJQSk5xaS9lQlhUVXFRTVdKdmdLYitzTnl2?=
 =?utf-8?B?Rk9VUmdrb3F2Nm5qb1kwamdZczZHTzNKbVA0a2xUcG43YjkvYVVnTTBUNGJk?=
 =?utf-8?B?OHhFWE0xUnluNVFVRUQ2ZHdzZVpya2Y2REtRcGxlaEhWM3hyOXhTRFB2RWlu?=
 =?utf-8?B?V3djNHIzQmVyTTJaNlRiSnZ3cnYxNzU4UlFNVzBOR2JxdUxzc2cwdEdsSzZu?=
 =?utf-8?B?VWxEK1NYYmNSa2JIM0hlOVcyeVdQWGNjV1RpbFJGMStyZElIdmFRUnNvclNl?=
 =?utf-8?B?L0N4NWNveFI4K2NXOUdiWFdrYmdBWGJoT3hKVVdZM0N0dkZGOURWTmUwaE5E?=
 =?utf-8?B?bkg5Ukxzb3BQMUZtbkVia2c5amwyZDFhKzZINERuWThiVWpUVE53OFlaaVhy?=
 =?utf-8?B?aFZPQW9kRXcxT0wvM3RJc1VGS0NjZDJhMi93RmNoaVRrUzFVWGY1dWthemc4?=
 =?utf-8?B?RzJESnkyTlo5UktkQTJKeGwzTzRrNVhNNmhNTUJDakhWYVd3blZ4TFpFZ3R1?=
 =?utf-8?B?bHJJL1M3VG1tTDFUY0t5RFRjWWQxVlphT2xzVmMvcmZoN3hRTzZOeDcwNXFF?=
 =?utf-8?B?TlNwMDlUMkFlejNteTBubmZwQmwyUG5VNGJ1NEJwSWw5K0o3bEl1Q0w1Zm9H?=
 =?utf-8?B?L2YxK3RzTit3Yk1Pcnp2TGZqeFlzbFNLRWFIUG9aVjBCd1I0V2ZQbHYrNTNT?=
 =?utf-8?B?RTRjMElnWGtIa3NiQU1QTm1kK0RYaStxY1FOYjVPUGpRcHJBVTd6UE40Uk9T?=
 =?utf-8?B?WGJJOXpjaVJYbExpb2R4NEVlVys5WlBMYmpJNWxZdWRuZVZ2TzZaU3BWeVdN?=
 =?utf-8?B?eVVoYVZNcEswMHdRT3ZkdUNSOWZWMDc4SldVY3phYmxPY3VqSTFlSGJJdDli?=
 =?utf-8?B?bEQ2OGQyaVBlL2J4aS9HTnh4NTJaNFUyRXVpaGt6M0hnMCtXeTFDU3ozejR3?=
 =?utf-8?B?cFpObk1OYmREU25qT1N6K3FMcUllWjk2dzZyYjYvMUxLQkdBOGtZeDJWSlhI?=
 =?utf-8?B?MGlyV2ZXQU1iK0J5bE1zR3BFWU1qRDVYRmNodTl5akFJQTQ1NytqWTJ3dTRK?=
 =?utf-8?B?emFQUVJiNmlYK0hreE05a3pIR0d2NWh5UGZJa0wzS1h1M3VpK0VpWGRoeVk2?=
 =?utf-8?B?aGFDQis2VW4vMGFDWndYMEJTaHFSTUsyb3B5R2ZNcXAwT3Q1WTROWUJFVlpO?=
 =?utf-8?B?SEpvTFpBSU9Pb0FzTUs4MldCTG9xZ0JiQkt5cEVGWld6UmsydTl4cFdEekJw?=
 =?utf-8?B?MHFmYTZvODVIYXdaU09yWkQzRi9rRERwTHdZVHdHemxhbXB3bXZ3WjlBWHZo?=
 =?utf-8?B?cENzbklnMzZqUEo4VjBsMzM1a1lvVWk2aEVHVWhJYS9jSHZLcFJRTnp3SytC?=
 =?utf-8?B?U0lzMSt3R1o3dlNrWGMzNFZnczFoOXNsdFpWM1liekVjNFBiTElKc3lsNG9h?=
 =?utf-8?B?YlVaTmlJZVZGUkQrZytYTDdWUG0xaXpNNDAzK2RLdmMyeXhMNWE1VUVORGlk?=
 =?utf-8?Q?X2oXZH7p3yUkmujnCDJrO3V2XJbsxI6DY+vGc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691a40f9-079e-4ed1-2dcd-08defe01ab95
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:53:46.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8AqUGVtMasm6CSGLIPRRaHdqN7PNelBRkP4jD/mJ868aeoRu0syPPzM8+zNwulzSt8BraS0HIa4hq28vc5woqItrey6cAAk7GTdKCBnmP9eyHULuDXWq13Wxmuc1eTe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885

From: Peng Fan <peng.fan@nxp.com>

The CBTU02043 on this board is a crossbar switch used solely for USB
Type-C orientation switching, not for SBU signal muxing. Using the
gpio-sbu-mux driver is therefore incorrect.

Replace the gpio-sbu-mux node with:
- orientation-gpios on the ptn5110 TCPC node for CC orientation
  detection using GPIO4_IO20 (CBTU02043 SEL pin).
- A gpio-hog to hold the XSD (shutdown) pin (GPIO2_IO20) low, keeping
  the CBTU02043 always enabled.

This also fixes the enable-gpios polarity which was GPIO_ACTIVE_HIGH,
but the CBTU02043 XSD pin is active-low per the datasheet: LOW for
normal operation, HIGH for shutdown (high impedance).

Fixes: d1c1400bd3b8 ("arm64: dts: imx8mp: Add initial support for Ultratronik imx8mp-ultra-mach-sbc board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../boot/dts/freescale/imx8mp-ultra-mach-sbc.dts   | 47 ++++++++--------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
index 3e6f9c88cc20..7e0550647751 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
@@ -23,21 +23,6 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	gpio-sbu-mux {
-		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sbu_mux>;
-		select-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
-		enable-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
-		orientation-switch;
-
-		port {
-			usb3_data_ss: endpoint {
-				remote-endpoint = <&typec_con_ss>;
-			};
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -217,6 +202,15 @@ &gpio2 {
 		"", "", "", "", "#SD2_CD", "", "", "",
 		"", "", "", "", "#USB-C_EN", "", "", "",
 		"", "", "", "", "", "", "", "";
+
+	cbtu02043-xsd-hog {
+		gpio-hog;
+		gpios = <20 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "CBTU02043_XSD";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cbtu02043_xsd>;
+	};
 };
 
 &gpio3 {
@@ -387,6 +381,7 @@ tcpc@52 {
 		pinctrl-0 = <&pinctrl_ptn5110>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
 
 		usb_con: connector {
 			compatible = "usb-c-connector";
@@ -411,14 +406,6 @@ typec_dr_sw: endpoint {
 						remote-endpoint = <&usb3_drd_sw>;
 					};
 				};
-
-				port@1 {
-					reg = <1>;
-
-					typec_con_ss: endpoint {
-						remote-endpoint = <&usb3_data_ss>;
-					};
-				};
 			};
 		};
 	};
@@ -563,6 +550,12 @@ &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
 
+	pinctrl_cbtu02043_xsd: cbtu02043-xsd-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x16	/* #USB-C_EN */
+		>;
+	};
+
 	pinctrl_ecspi1_cs: ecspi1-cs-grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x40	/* #SPI1_CS */
@@ -746,6 +739,7 @@ MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0	/* #PMIC_INT */
 	pinctrl_ptn5110: ptn5110-grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4	/* #USB-C_ALERT */
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16	/* #USB-C_SEL */
 		>;
 	};
 
@@ -767,13 +761,6 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
 		>;
 	};
 
-	pinctrl_sbu_mux: sbu-mux-grp {
-		fsl,pins = <
-			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16	/* #USB-C_SEL */
-			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x16	/* #USB-C_EN */
-		>;
-	};
-
 	pinctrl_slb9670: slb9670-grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x40	/* #TPM_IRQ */

-- 
2.51.0

