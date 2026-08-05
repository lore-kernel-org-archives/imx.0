Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C19048165C
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945561; cv=fail; b=P/kdkHf3DNc4OzHThJ+WipnUxNZkuOMKVYEcFg2pQfLXKFikYY7ETIKyNDalDoN4IsrywX7sQRxCU5kIZgFt6Tu5/43OOzbhIgATGeOY/130Izwrq8yc1APGE8G0Oacl8vVvqI07/vZEWFCfXAijkugeIStDCPO+OwkjTlMDMJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945561; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G0s2rhBW6usDsESReiZqInDhq5/2Q9JF1JYDGVFiMOC4oCgGnOZ9nqqnh1Q+hUSAVrkFT21HdEpsKwnkwVeYivz64e3uR7VUgZot8f0YEGUBGZhdhdQB/oTPhG1LGRf9Sj8xhM5p/0T+eEBsGnMOPNsbyE7UAqh+dy19XQYjIC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PPRQKL5Q; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PPRQKL5Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXQX69AXVtHcwFZQzFw77o+w2G6SyLW7NymXZQD+/6aOxpat2/MmB+bBAv0B4cfk1VugsHPXfAqgeGdJTLEgqTABsK830wGJ0ifU9s4WTC3TF5I6+mjdkuZW2zsJR/wNSZa5JjiSJtg5zf8hsmmNiveT+VdVklRc8aQ77VTUjd/YscLWzB0rn/H1qFwVg6WdVBeG6303wkn+lj+k9wsUse027SgASDA98k/6yPxeX4MI3i99eub0PgSunBwyDIqWwVsMPpyBwDItjLbPeuB2Y4xx0XLx5FCNDzyRKDog+usTCPhORGEf1AFLqtz9s27PZHWjFnpW87+CnaH2P0Fmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=Al3Ec9lttXO64sP/WxYncR6guQ1lRyitIuRqjwQ4hR2sLjRe2o4nG1IZ77v6SzE1qDrW+5qHJW+3fozL33UqsOhvAA/WBMiVDDtfKkz3ntxJN/TBZBzxnS6lqqrfdFPPwcsQ33ji8PuQcIapJXoIofjefSe0xMlPZ+rzFG6XPStAvioPnDb3m4+wq/1FpZkUxcGFBMI2TMNrygl9I/p8RW/YaNm4G+AkcN8lZhh9xh9cB5AucDPQwbcr147/HTPhBrwfCoknH4N4mFC8F6/xq2LDGH7WvMCjyfoclgohquZdKXiZyIL5UM+bUzGgFs5WckpD5mpTFenDvMzTH7ItvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=PPRQKL5QuWpckXHCAAAzjR8baL5kUQ6NqsdL8QE81iok9VvsbMXK/Ns/OlyWeRmtf18m7twQ0BelFM6XrvKs6/hQA/PlM3Cfkn82Zi/KWzb87QU8sFisBvcufXVhDqpbKfHi2L8mq4+vMXFRi9EzzB89+4ejhYu8/+B8oR6BkQm3gXKoqlAen4vH+VPJ8aLUNIJg5BZqF2wxaCz1rqwED4GrI1RL/JirsHDwATrQpPAV+uUpUY4K8VGIrFIz6/CXDCGaCBcy8H1thJ3SsC0fJY0Yf4/aaHYGCBokrD4DRSCWWtbkMD6RyOIrMxvIVsNPK77Hfb0JKBuYPCwC74G4Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 15:58:51 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:58:51 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 22:18:36 +0530
Subject: [PATCH v34 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v34-6-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
In-Reply-To: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785948512; l=1532;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=NC4K2falxBdE1MrFfeX+Hj6yu/44UbrliDVZZAPkEW3LxLkDJ/KYm9l/PDJD26PEe5l5ABvdt
 yD8OyfePEUQBl+m8ogTdHLIuikeJLk0BAeYHWZKHV4zHtQtkzuja8vA
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcfb885-4da8-445c-2030-08def30a7190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6ylxvOSQ3X5oZG4ggvjnb+NSSEDVikyP/ZPIOH5Lots6VPACt7kltqROitHK4puwbKly3/h7WkIfBKl+2kOCGTaB5joOQ24N6zkUE7phpun7b0mx1a/g51vUoMfBUqjNcoh5ulXvTsEblSmxNS1LVscapVHxEXNSKf6eZWVw4GG+9917zwzdh9NdctsfOav5dJzwl1MLcZu+ayFe8Dk7teIV8jwaaiYu5X4Tb38rWm3NEHbzaLsEPPuRV+8E8ZwOhZAFA0KsE3t7ST0M0yUdOuEI+G8zS1LoG6K/HZYNAxCz+bn3zWmBrNUz2CtGNGxIgjGsRGsJtZY4IVkoyxWyzV1xuiEHjvEOpi84M/6ClEI0COgcAmt1xYyd/Fq2dXCog3VVZbilGD1/haBy3dYlPQ8RTmTop1zFXG4Hv/7pCvJmLjgf4h2sTOoz4YzMXtM8CTbg1OxBbarELCum3ocgI2j3xQvdc32Icikd1pr4ePpmAe/AA8Q7vZsjyfKDjlaner/wsjdAS7/Llxnlv4WqCoEiARW3/pJD8CGc8CqGSTHr4wYVGnQwAbUmTFgEDM2cGMDAjtaj1NzTImXEVEXTMkmVvqTZdaDB308aHaYjXYHZfdoV/tB4SPFsghkaBnAG/jrZtJWO1PH29iy68oSf9ATyTCDxXBc6ptTcREFEb0OHzdCqvOd5JF/zIEHyWi7r9oPfTNpfJ/BuPEF2XtmPkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW9sVWlmc05oY1lOMDUrRUx2ZmtzTmxPRG9FNGZ3SUt4a1dLbzRYVzZRVWty?=
 =?utf-8?B?NWMrUklOUi9QNWw2WFpxeXBMOUh6aUQ2TUtsRnJqb3VDOG9WL1o2TlhxbHBi?=
 =?utf-8?B?OTByamNPRm01UWRGenpYTStTd3J4OGwrMXBYdHV2eDhmNFdib2p5KzVnU2xu?=
 =?utf-8?B?bG9wMXYwN3h6WGlmOU9GbzJXMzU2enNwWVk3UkR2VTkzc3BpcDVlQ0NDeDBm?=
 =?utf-8?B?SEd0MVk1NUI3OGFybGJCSnJucWJhdUtjajdXVThCVEJOWFNra0Nvd2NmZGg1?=
 =?utf-8?B?aUxma2JGenNMRzZJdzlNakZwemM3ZmhxczhCL2dIbkQwYitiS0UvQmlMcjRR?=
 =?utf-8?B?L2lqOVI4WUtaRVo2WXhTYVVyUFhwdHRDUE91Z2pIcWN2NzVGYkFsamhuTWJS?=
 =?utf-8?B?Y0hCODBTT2ZOMmlsU0dwQm9pZXNYUDN4RTZkTFVNeGNiL1BQVVhGMXJGQnRS?=
 =?utf-8?B?eVdjY2RyVlRuajNpL2tNRis5ZFdsR1UvQ0hRQjU0Z3pXdXdYLzJHQU9HQUtv?=
 =?utf-8?B?NnVweHdwQTFvRWRma0p1aC9tVXFhRWMrWTJObnR3WVp2KzM5ckFqRGg5SEFu?=
 =?utf-8?B?c1hNdzRDR3J5REJIa2dWYk9GbFJZMjlVU2pUN0gyNStzQ2ZlQTVCUXBDQ09M?=
 =?utf-8?B?SitEYUhxZ0NuM2VOcVRVYWsvckFoamdXQys4TnVTSzNJSzNhcElsZWw5SFc0?=
 =?utf-8?B?TjdyMzdIY3NlTWJUTXd4ZDEwMWxhdFhLNDZyTjVMbkt2MSt1TVlybnV6Vm8v?=
 =?utf-8?B?RFZaVm5vdWFMRFFaTklWK0EvUDJUbGpIeWZxT0NFUm1pK0Q1QnNOeTdwdEtV?=
 =?utf-8?B?Vlp4Wk9YbmNjTFArWnJrK1FYQzhaRjBybWs0ZFA3dlFGUDV0SDJwc0tDdCtF?=
 =?utf-8?B?OVJwbjMwV0JqUWZSRTg0RVlrMGIwaE1NSEJ0SEVwdGV4RjRVQ2FTSDE2eXZr?=
 =?utf-8?B?NzdIb21IS3A0MU9LZktPL1k3SHo4WW1IS0E4Y3dRbCs3eDJYd2wzNGk0ekRW?=
 =?utf-8?B?S0tybDUvUkU3VDRhbk1nb1BzU2xRU0dIQ2hWSG9BNUU1U1lydW9XTDVSMkhU?=
 =?utf-8?B?S0w2NmdpdGhqSkNJdWdhbjNBYTY1My94S3ZNaW1sZURwZ0l0dFQ2QWxqOEt1?=
 =?utf-8?B?VU1IMjV3Y0I3MVB0SXliaHpKNGJwOUtzQWpMcm5KQ3Bvb3JqSE4zaGZ4bHcv?=
 =?utf-8?B?ZWdBWDdxbXgxTmV1Zjd3ay91c2Z1dzBJdE82SUdxc2crN1llNFFqK0x6d3JJ?=
 =?utf-8?B?R25CU0xpNzZJWkx4cE11WGY3NVB3MHN1SGdsN2FybG5yZ0VOVUsyM0x0cGt4?=
 =?utf-8?B?RFRqMHNacmR5elJ5Y1p2cCs3dEpCbnZoM2IwVzZ1eE5YUEFTc1FLWnlweGtB?=
 =?utf-8?B?YUxCTlM0cVI3S1V6b0ZHRUMxOUJoREdvSU1KcEl5TXczNGcwdnlleHh3WE45?=
 =?utf-8?B?VFlnRVYzREEvcjlwcTdyMS9yc3F4VFhMditaUk1ua0pMN25yZ3FsenVKakdi?=
 =?utf-8?B?WDhuc0VZWFJGRGZpanhCY2FON3YrYmM5SnJtajR4UnN4WHpGMittSk16c3Rp?=
 =?utf-8?B?R2QzajJFbTdqb2pYT28rOFBRajlRL2V3dUd4bG1oM0Q2RkF0OHR3R3lVVElR?=
 =?utf-8?B?Y1E3QVNTK3paUUVqMVFlK3lyM01aVGZGWkZBWlpOMEVoT0w0bUlpQVNlaVlt?=
 =?utf-8?B?Z0VSWnpVU2JXV3VUQmhVRTFZSFR2bENTL1htNHVKVGh6QkZpcDdnVS9FVm9Q?=
 =?utf-8?B?Ty9jeFB5MFpZc2pxYk1WRFJwZHBHODRqcnllT1ZLSnRFMWRBWVUyQlIvMWd0?=
 =?utf-8?B?ZG1YUGlXekJ6eW1pWXhTTFZnZW4zSUtMOThLQmNsQWd4cXdRV2tPRG51TlJl?=
 =?utf-8?B?elo0TFRQdFo0OVhJL2dmRnp5Ny9iUndOb2lmRCtiVnRQcUhjWWJob3EwbTNQ?=
 =?utf-8?B?RVBkdUpnQ0FScjVFK2RXMm93endSSEFqZlI2MHlKa01HSU9taGxpT3RJOXBy?=
 =?utf-8?B?VWxmcDhmbHZHVFdhRU5OU1hkaVk5RzZtU0grMUpvTVRkcEtxeVhjTHVYV3hp?=
 =?utf-8?B?VUp6RXMvei85bEFtdGlxODNZdWdNT3ZFM2VyVi9qRWdFbzVqb1BhV1ZFN1JT?=
 =?utf-8?B?VDZZa0oyb052K2xwSkNCY1FBVlB6TVNSQjVzU3EySEhNR1VWN3Zqdkpqa3Vm?=
 =?utf-8?B?M25BTVBWNHp1eG00R1dRazRWOStmWjlVWHNZZ3VWcURsQlI5akoxRmlveGlY?=
 =?utf-8?B?V0ZxVlJQV2wrb2gwci9sWXlCUFZCcy8rNDZBTnBRVTM2Vk9VM25ndVRUOE43?=
 =?utf-8?B?N2VTRFZtMGFhSWdVdHliZytnWWVxelhrUEYzVS9DSGx0RktoemJMZjlNcWN5?=
 =?utf-8?Q?uMYPm2ler/fU7R7LEJjsKfR3yb7ooFXrFA1P1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcfb885-4da8-445c-2030-08def30a7190
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:58:51.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrSSztoUUfGM9D9z/qGnkZnQCMhzGyPjgQ5bMOSorUPUsFCAkcQ5I9UfhuuYiA+1U2oI6b71Kr/FzUZQqLfIm0btAcdkVJeqygcQG2tiVlIRzQ7GWnbVXHpQgDUfdFaV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

