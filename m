Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1333EB1A
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510097; cv=fail; b=a/Z+Lql3PvlZOg9Bbf8EdnaJ8O34DoxOXRwH8XpzK6/9Mv+B8QuxNlXyhftTbBmZE4aSbOoD+7RW107oNmnpbylIz4xMeYjhYt9IeIMh5Znz7MmRSdJlkz6f1jKJcsS+8gHBKhTKdwkI0vzTI/RbXz/hnxGsXtQQP6vqFMOqmEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510097; c=relaxed/simple;
	bh=U6owUpzLKmw7zHXmv4uWVJMlvrvSA2NO6u51cMaEiJI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WRjGRIjv+RjwgUBZELxdx1rF2kDbcDx18aIDci0vigSMWsUMGdHRlN2E0qqWZbCrbhxHUbsLY5Qbn3G4tyCQict++72/jvwY7oGBYlaCecWZv8wYX+gaZ2c70ZnMYcNsszPJ771EWYYYrDZFTdiN1ZOUep14jw/G2aSx4WKUxa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T3ERf7Rz; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T3ERf7Rz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhmB5Dnmpk9nIUzln+bwCUBMbb21KVl3DFibat3ae0AG22tPkkzaHaBmBMUyUFUhgsTbJS3U5flkwtfdk9bWQGFsCT9Kk8ze4IRlUN5aSvbwnfFByl5DTZFqy4YuNJMA6T9I+Wz0xl1UVr6Q/PjivwI5Y8Uhw2fWMc5ON4TyZNPexFgr4oc9QI3OFO42LnkiRPbuE910ckYrjncwPDnG3bkUwoO/LxWCVj/9u/VuB4GRjwiIGosbMjGW3eL/WdMvxrt5CPHdO0yPACt0jku1Q0dBlVnTK65MTBJnQM9SJpuJX18dUFW0BqBMgwNZO060v+cvaWhCHaJ6od8e8tJbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKeY6sntECZPzxYF5A1xhyhD+aEoXL2OeENmdWRjXRw=;
 b=ssfDQ99qHIrzYqvPyX1kI4rYF6w++OGaReQcWF4jKhj/K/iRXSVp1sWQVxGJV1IYB0W1TSoQ4kRoCSwmz8Pfz0ypcLZBvc62qXM3YPAwQ5SJIflA4SuIB4nD6b+9aFf20ZlOr4XawUlDR/sifpd/jIOrWFf6xVndR9PD2chnVwu6R0PEa1JzJ6n7xZ4FQJqUm4FH7jGQ3wNtLRpBwAMgU8iOS/hVz0SE97/wMtrWoXaswazmdqknNg6DAtrJU0EWiuCJRuO/U9dgX6sHVlLKAgrSAvOrbaywpVCsWQkBDZbuDh6m+iHTeqrx/Zjd2917XyT+eYbA0rOWBRxp8gnNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKeY6sntECZPzxYF5A1xhyhD+aEoXL2OeENmdWRjXRw=;
 b=T3ERf7RzXT2zcsKo22K5YuaYlbVMXCHAcy8oO1xGBQqC2/gwypFlK8LNeYbgB8YigZK0vohBOm59KkB2bnHKc4oih6Z00W1ohosMv9wsJMizG/mAWRn1PlOgmttce0TTLy36ej0R3Y9GoDgl2BHx0Kdkh6n+qI0/fQnb4md7KzFD3nKVnNvOhH3PR5myO9ej0MYiJKolkB4mKRkigUt6s8c67RMDe/Q1XGp8e/Zks+kwenBTrmAJhOFNrl2ZcBzA0ltQWnUJrpCrHLfXClm3Sn81Quh8V8pfNa3uXWT6QyyGuF3vDAv4lTXwgrgxeGaUQtYWCrFSkEu7z8XnsuSl0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:28:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:13 +0800
Subject: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cf48ef-e117-49c2-b50b-08de8b09298d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 MgRCw23e5Vv3/5CG5240OD9PQ0H5mJCSzg6fE/HFai92Ft56+RPLHE5JOmcUCYyfJqumg4nN9JzzxKlBSvvb9EDxUySuZ3xPN7JQtNlpQrfy0bBfIkVBSg/ZKqSWx9bY8/lXO8c9LJq85qZlC827WbEk1oJ2wx9ft1KoP/fH/oPl75UICpPSRTaJh0mZpvmlkg/R/m+br+ELLTmGJBJW2G9jUHGm72NfdGl05QFWl9md4XFLO6u4avgtVS9lsLWcznA251rwAhm82DK5qTbcsy2aS32QEDXlYh5F1K5RDLKsJyPR8U+QmF03CIu1cjPrxkYPl6EbKARhoDCYPGx4IDwW38TnBeRTDPt9bgaBTrQ6U5buBbrTmiot63P8LFBsRTsOeLf88zIszexlfx5mhFUi/OxQ/weFHEEmY3UoWrBNcTo2j3h374COzaeIKwf589u4bV+li/GNb22ve6FCxeeua4Vy3q1AW19+H73Zz4Krn7LPeaqCnFLL53UlFYy3uqAL/3OboxLP+UOhkUJxF4OVPtMW5RMsbsNkQkf6+0QXXwYw1at7k6LpHLOEcKpPk1PwctKH04FEx+vVTMMEBoovEP8XsaUyvnDKCrybuRTf1fyLBzdcF0EomcQARJtqDIwoRdtAhtMME0AbY1OVO1aUKw/Vqj6iI6tsbk/elSHht61AVSD/XJiX3BzAOOGbyCpdRAQ/h6dSJ8QGuNI9mJ4O2mneZZDqwMtTZA35HmSkKWJw7Ug3UCc1p71EuqDaD7dhE1JXR1Ut/JIretzzBbnV2dItfew596MU3sj9lae9oVyd6JlgCEBp6CHiIrTy
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RGZMRm5jYzRNQUtKQlRPd3dSM2RqaGZ0R2RCUG1ndVJ4K2UwUkxiL0FkY2F5?=
 =?utf-8?B?cFlONTc4OStwRERwUzhiWkF3ZzdzWE1FN2VxN2dWOE9rVmluZkpjOTZDa1kr?=
 =?utf-8?B?SHVmUFh1cFk4TmF6QytwMjhLNHpmQUhOdExYU2l3bTJ3V01RUjNPMlpTOEl1?=
 =?utf-8?B?T1ErckQ2Y3lBV3B4VEJLQ0VtL0RXMjFiT1M5SHM0dEdLUmxsYmFBRG5SWEZK?=
 =?utf-8?B?ckJWYnc3aEl0Tm1ETHFtS0hrRG1ZbEhlY3kwWENqRXJwZXJHYzFWTmg4SVVC?=
 =?utf-8?B?TFpnRElac3ljYU1HejRSbEo0ZWxpUzRwb21nRTVDNjAwd1hsNVF4T1AzMzlK?=
 =?utf-8?B?VTB3bkFkWWtJRkdBVFoxWkVpU3B5cy8rNW52QUxBRFVtL3YzeW9PR0d4RzR4?=
 =?utf-8?B?SVFLZlNyMU52NDJuQnMvY2s2OU1kQWprb0RaS2g5MFF4RDI5YTE2MlVmbHEv?=
 =?utf-8?B?ZkJKWVBYTG1oZ3hKRmRvK1BTZVRESWJiWXR0Z0sweENld0xURjV1TDN6dXFn?=
 =?utf-8?B?cU5GcUQ0TGltRCtEVFh6YXZZenFUNTA0OGhHYkFvSjdtN3Jzb0xlZVRGbm5j?=
 =?utf-8?B?Tm9WSnloR3BFeEMvVy9kLzUyY09WN2ZzbFQwRHI1L0dmNEl3MEhEM0VMZWV0?=
 =?utf-8?B?M1BUdzBhSXVjSVNSaG0wUVR4U3hhQUZ2Nis0b0ZwekFWZ0dEN2h3REpidGxj?=
 =?utf-8?B?S2d4MEt4UmFEam50U3V0NjFjeWxZdktKR2o4azJaOXorOHZtc3lCd1ZCT3B2?=
 =?utf-8?B?NTljQ1dtendGNU9rc1BKcjllZHlZZUEyT210dWUxQ2N0RXp2TEJTMFdzVkhp?=
 =?utf-8?B?UGlhbThKMUJpYm1tNHBwMlVDN2dDWml5UndMUGZBc2w2TllOU3Y3QVRuWmN0?=
 =?utf-8?B?Vzd2b2xneEh3Y2RkZ0NXcmhqaHkvZTNzMTdTajJ2UkN4enpEbXpMS1FOTktC?=
 =?utf-8?B?dlBPbHUwcVBJRmozTENXMitWdkpVallyOE9CQmptUVNtbTEyUS9PMCtyZ3Rj?=
 =?utf-8?B?TXhUc1RDeUpaVDNuZDNNdmNxVitOYmFseDRjMVRRRGdKc0JSNzFiVlVDM1ZF?=
 =?utf-8?B?RnJwaHZOc3d0NkhWaTdRWTVxTmxqbDh4RVU4V2dORkFaTmtEdkw0eDNsYmlz?=
 =?utf-8?B?WU43UmFLOFZTZ0FQNVlOVG1LOUlOMGxzWEFNZXo3eXQvaUY0MHVtazQzam02?=
 =?utf-8?B?VlIyZnVUbUZvbis2MDQrWFVBMW1KWXBEeHFCdWYvNFpzRVFZbzM1MitJVDc5?=
 =?utf-8?B?YjM0TC84K3dMaGhTUmJxM0JEQ01TWVZoTWVCcTJqNjIyVUQxc3dwcGVhV0NK?=
 =?utf-8?B?T1hWa3hqNzBRWDRqN0I1UUxYdCtFdVZKdFltQWVHcDZjZGdyOXpvMSs3SW42?=
 =?utf-8?B?YW5QTlVJcFlNbU9TSUVLVWVMYTRrN0pLMUVBOGFHR0F1ekZLeFpQWGliUEp6?=
 =?utf-8?B?NnNMLzA0Z2wrODdYRmpYRG9qU21ERTBWeTJkNnNZRnd3bnRIODZOQ3NEUkc1?=
 =?utf-8?B?dy96Qk1HVE1VTUhTS0JUSDlyak1jSy9BbCtuV2dxN3VCVEhPSkJlVGhRNWY0?=
 =?utf-8?B?Y2ZiVi9OVUJYNStOSzdJMVA5THI2eHB5b010OHhaNS8rVGxqbk1SbHRoVy9v?=
 =?utf-8?B?eDI4VldqOUJVa2l5dzh5eFdwRFd4OGhHSnArNDkrMENUOVBMNE5LMUx6U1dZ?=
 =?utf-8?B?Qzdad2ZYV0trTGNnRzhXMzlKdVNtVFlwN1haNStrVmJady8yRE9hbHlLdTRi?=
 =?utf-8?B?MnVMaDkrZTFHVDZFWEFnMVk0Y2dKTzRZUVd2L3ExeWJaTzhZU1NpSjVSNm5p?=
 =?utf-8?B?RmdEMG5EYkNiTDB4bkRoL0xoR3VPY2xaQzRaaGI2M1poakorOXUrQkFERFFG?=
 =?utf-8?B?cFVRNW1FcndydCtJVXdUVGdLd1UvZ21wWDdUaVI3RStFd1puN0YwNnpuTUVq?=
 =?utf-8?B?WVJod2JQQy9YRTlSRVNOajNDN2x5V2w3eURtMDBNbmtwdlI4U1hVMjZzYmY2?=
 =?utf-8?B?VXJlMWo5SjhXU2Vuak16czdZcjA5TXg5TnRHS0ZLZ2pBOFduR2tYYk8vVVh5?=
 =?utf-8?B?cUtOUDl4U2lXdElicUFmNzF5SWRsUE9oQm9rRUoyLzhZSGRraWZjM2hINXFQ?=
 =?utf-8?B?RGlGcFZ3ZG8zTXNRbVNIemdYcmZnZkRFRkZIZThzcXNoRTRuc2FMOS9pV0Fl?=
 =?utf-8?B?aDNuNUk1Q0ZnYktUN285TjF1OWdSTmtnZHdLNnBJNDNjYm03T0QxY0NqYWhU?=
 =?utf-8?B?WVZ3UTlrWVo2NFp6SDZqNXlVbUtTbEFZeTlIaytRd1ZKTVRSbHpLSXFBK3Jk?=
 =?utf-8?B?TGI5NnRjUzI4TkZIV0dieWdEYUxCRU5JZjBRcnAxRVdQQ3dEQ24vZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cf48ef-e117-49c2-b50b-08de8b09298d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:40.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnx/cjMi6t8JydgrXKmZM70vK3GD1ojlGKsVDBNbKBoHKMDjrdsOdyfhXIFPf1GVZAEKEnpKcymcD1MhEJQ7pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: a009c0c66ecb4 ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
index 3cdb0bc0ab721709fc892931ea00a538ec6216ff..c3f7daa773eaf335deb6cc976a5e120abdae5967 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -174,7 +174,7 @@ pmic: pmic@25 {
 		pinctrl-0 = <&pmic_pins>;
 		pinctrl-names = "default";
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		nxp,i2c-lt-enable;
 
 		regulators {
@@ -417,7 +417,7 @@ MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x160
 
 	pmic_pins: pinctrl-pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x1c0
 		>;
 	};
 

-- 
2.37.1

