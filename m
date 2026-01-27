Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492512C028B
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503103; cv=fail; b=koi1cd8vHKkuTdMIwSP74v1V8HWXPPA/saR67XrRjOf+dQuFuakn4QDv0ZCMcZ+WctJghE+7MV40WVAmzEjNxoXSOp3mstIzorkjj+E5xzPxiyB1Rearnk6HQVD5APxBE27U+C1yX/GuoRsHu9nkhB1d44kQ7iLxf7D+Sjd92xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503103; c=relaxed/simple;
	bh=pgmrv+EV1iFsXUjSv3lGRDKjEXx/RKBC3eKgHW4rbQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M1XRluWYU0KZywTeeJFhVrun8/uy0Cm+6ilbXpYwyXIer9KST4/PecrfnEXOQXVSqoS5Au+cJ4rwqvn4hs/yLsVpRLg9CAaprh0GdPfWalPdPy9qEEsoVvulARyFPJHHevl7aJa0+PGmR7nsIGB3BbCVLRL8XYjHAdjjIztj/JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=heiKaHy/; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="heiKaHy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYvtDBxFm4242OFXs0LQaOhYFtHtbmxY+O7luQUtIUAoMI3kSzuk+cbtfRMEQbo6vi+mNm6wGYBpjH6ybDBzDvbuPpuXHpY9mD6Y5VPql2bDrUmEyhCo6vbzLq51KQmHNoOdvkq515HSr72vK28cgW6Fe3PNk7Rc8cTGcubLmuzPcwpI46X194OzILEYe8jVsehPK45HYCzCSmUxd2SeDEwB8YAQ3LIp0Hfg7UxKyUXxZ4WX9WboTAL0h9SQmvr2vg2mmXTvaZCfrC4H9ghxWOLfaHmR9YyIHBsPZ4ohayfF1kOvqcF2Op/Yw/jypiQK6iO11AXDVrGa0Ce2WKSn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW0WG0xvvb3NkqbRYkwEpuPKZLFePpdkbYop6OAQBdc=;
 b=jJdRAxtb+QeBhUU+v/4nnefcTjgdBfNh/0DhEpdWuNhMyzDY7F9hqZsbiap212kNcH7CmNI/MiENpJxn/hFbYSb0gZ0+T3gqsCUATbBZ/5dpkZ3JebghyyaDsyPwLr2oaav97D9BLkeTBhr1YBJar7+bcJ+dFQm2ywjfU9dpbnb9XkgGXCcE6Bu/j+3qIBSVFHC7EkiHgH+mVQdJHf0eoSX9XCXis+nm5QDOWpAhSR25X3j6aRYDNxMym9fNRzdzCi4RMKNwI0TIRvDzitVA9Y9WCi3klQdXnxH6P5c3SEWqZv7thS1QENsO0NwqKT/ETJbEgeG3XwOo5VlwPizehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW0WG0xvvb3NkqbRYkwEpuPKZLFePpdkbYop6OAQBdc=;
 b=heiKaHy/6ErMvX8ZFxIRJ1P6lTKySy7qEOb3qzISIhbo9FxgtON6gYT/BH6SC/3hPW+FifmGXe0Ro40UJ2iM5c5I4G8t6iEYwA8rIhJoLZoIMXZakfS8IgFbY0wRKDD02ap2ASTDegWEJdM+U/S6COrMezn3zC6gf6BKNluiAJ8wm+Njc45Ce2hMsNR0tN6PG6UaHcs1cH78nV5Wi/9aYXviyVFAAoxBZtVblnnCVTxz3AVzl/nh8fHi83/N//Y9/c/aenFMe5Ig2+Huve8zXAlaeOL0apLDHf/uTx0kV72fp6m2hoyDTVrM2C+e40ztBHUfqU8/hSB6OrrXXXji/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM0PR04MB6867.eurprd04.prod.outlook.com
 (2603:10a6:208:182::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 08:38:14 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:38:14 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/3] arm64: dts: imx93: Extract common parts of 11x11 EVK into imx93-evk-common.dtsi
Date: Tue, 27 Jan 2026 16:37:26 +0800
Message-Id: <20260127083727.1839605-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260127083727.1839605-1-sherry.sun@nxp.com>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM0PR04MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0cc533-b42f-45cd-711d-08de5d7f6971
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/o3cNllnovHJcqxUOZkL8ibK9kXm7uNRXRi6JBCmMxQtJLisu1HE56cz7d+q?=
 =?us-ascii?Q?vV40jIWUEwwTXIjE+cuvNimLaTgOevB/2yragJLqugfeng1TwM4PgQM1mOD9?=
 =?us-ascii?Q?E6TY/UNZEkVEC7lc6rl23iOh273WMqtNzdUbosWvoYnVy9EU6SF8czSAcZ02?=
 =?us-ascii?Q?4c/Rza0tfw7G1HQvyx/wMj8qOH+WwoawmiK31OvC41u23Ihm9rYppt42eWa3?=
 =?us-ascii?Q?G5Dr2XKBle/hNXwxdsVULiOjeMec+l5da1R0AHeKSjHzO+3tPeWzJX+DmBwv?=
 =?us-ascii?Q?bc+fs6F55MVXJLPp6F+Y3iaW0Hg4balGU82dt3z80+tb9bHuE/OnqPquqWco?=
 =?us-ascii?Q?NK4CAQS4NfQpvwtW5+k/q5IPkwx7mNuPNHqT0a4akhJ2TRBEAmlUyrqy3zVS?=
 =?us-ascii?Q?nFSiC4D2BAmvYlABpcc0tQvC5o0GfJ5vHP4RRIhxhelbEJWtNirthWCC7Byb?=
 =?us-ascii?Q?LhEQ/FdIl6PDqh0zBjPAFwwbDI8PuR3A/TOcqbPcrDAY5eH/RLyhJXUD7Q+6?=
 =?us-ascii?Q?HQo22PJcswciTYWoW9JHlx+OQOQd8xApou+9qtJzXR0uaGj5fr6Oy4e0hKIa?=
 =?us-ascii?Q?fH57C4iXAxzmXzl1c7qwCEQnddK8JWYqAqwR6T7d1Mc+AwCQOJu7lG6uVJ8a?=
 =?us-ascii?Q?bIPV3zeMLV1uV9+qUIoiRlSmw3ASDZ5Bw0H2SIzWIqoT6sleILwJS/7YmOrn?=
 =?us-ascii?Q?oNxq9OAhzzDiD1NGQwjRCFsCYdx4bY7lgPOZEts1TqvkNUgykQWmrUCEBWq4?=
 =?us-ascii?Q?tlg75LVhotLYVmOI8MgOw3QsTIdDcVWLaRfNKak3aM7mCS46rTXWFNXLlu62?=
 =?us-ascii?Q?tKmvLX51PL+KCsENEjM0dLbAwEFgUsud43stwo+rNI1M15nU4G3XuWOOY2yH?=
 =?us-ascii?Q?Xq9jf11Fc/89hAeUGgeCmvhjQKhtj4/2faDQGRnS69AhWkw4Np4tHUgLA9Gw?=
 =?us-ascii?Q?MTI56Y6WgXnTI3Rl/j2Akxi0mKyJCnozwFa7uotlzbdJbe1XNDSvkTJm4cH5?=
 =?us-ascii?Q?K4ZBrteQDR21LBiaTnjbUWxKU9amnR//Ow8Xt4WpjBRawdBG/cvboKwdw5FM?=
 =?us-ascii?Q?GaEkfRHWrUQ8XTFRWIp5CRqy/z5DinUjuFZyaJRqQEr57d1rnQuc5gdeM8sA?=
 =?us-ascii?Q?/VRWPiaHGXLgs/NrJD1P3zKC75/qYApGdZtTL/AL5MU5fhypOIvwbhZse86r?=
 =?us-ascii?Q?UN6567KYH2iAv5Akq5CCEOsIYXVw9ZAzv0G+apSVDiQnZd6SJ7gcVHt+FJnu?=
 =?us-ascii?Q?v2Jt84gmvyOyp0QlW1Xlu865vorBOrMalqomKrluBiSSnwHsQ4XryOSOkx/0?=
 =?us-ascii?Q?+j6fewktaGSboqVCNpYUvIbtylybK88fecpEWS3CR/cvBcXsdYYumG8COopV?=
 =?us-ascii?Q?1Ku0aygREb/KS+YVuVEQg6yC11NiOYIXNeSx71RUt7HF1eBJX4rGzCUVLBYz?=
 =?us-ascii?Q?tkptrn1t8uSnAk3rxHoQYpaTRrh+7aVlmMnPiYVRlYdK0lyoOFK3Ef4gdoxi?=
 =?us-ascii?Q?lC0zJP/GYMAsnr1Wy/YlMH3qCgrYrbKLDoDSZLx8eF2V1Ry7j+o0lV9EvhhN?=
 =?us-ascii?Q?i8jgl1gDJZ/0sjgV8QdtjHk6NSPH+23bnRAPUzJmyOh8vSzABzEUJ/7OKfDf?=
 =?us-ascii?Q?n1k5Z6pK+BWZ3DAwd0NOrE9U0aK00rbEbGU1rtd5DCoL?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1r4n2VZOKRdORB2edmnuzPDSTKTJ6O0dXm/kohWAxqdQG2U6+TugPt8umDIQ?=
 =?us-ascii?Q?rVJACwebpvGeb9Ye7nrEth+KppMExlKs7cGtK4nSyipMg/w9NESsh1kCXprl?=
 =?us-ascii?Q?YdVc/X5jJ7YIdBEFK3R2vcO17fe75xcgs+wkyRkWaRipwqJSF8JQI9Yqo1X4?=
 =?us-ascii?Q?wjBaAsdre1EZImZN3VvhjRPyfq4h26EqzIWW/CJrg41D7WZpuZThNKx+RSNL?=
 =?us-ascii?Q?YrbkC0/lF3q5VMSKUwFKKayaqwJWJc1/vdh8gg/DictGoWiPFq1DI9n+QBrk?=
 =?us-ascii?Q?0Mt5FuQAJ6T1SeYWgKjYcaoYmDcL/zYeaeE+MLYpg48ImrLp7n6ckvtx9Xji?=
 =?us-ascii?Q?egrZYUbRbX4A/CQmkEOPlb6AzI9UQZw9MAVuQSGuHYuy7as6ny4LaKgwy4gn?=
 =?us-ascii?Q?idfMGFVrZFgLlI1BfLUQExASWKyNjzyrdIqwJDrK8qZe+EibmKQiCztjp7Dr?=
 =?us-ascii?Q?7AGNduzzITX6DnEAEX9nKM9dMhTCPI2GPoD2F7BqCjRgT93Zr8EWe5aaIJ/y?=
 =?us-ascii?Q?vh47bd2C7b1e33hbeGe5/1CWZKU9qyY24M/luZUc7L7yuIaJZ6FB3zsn+zpB?=
 =?us-ascii?Q?I0z6KeEaU6e5JMcCuL0yuzdqthYPVJCnCe3KhguFn0hZrm4KnvWKGfhkZYET?=
 =?us-ascii?Q?ithl+qGDzMXYh39CI49Y66wfAlvenkkP4hyzEWg63SdGJW6m1PppvJ3g4RfF?=
 =?us-ascii?Q?0kFi3rxF88Olzsow9iKidJaf48Rqads/qHGZ+1aCpTTq1qg8V25Xer+7x6U/?=
 =?us-ascii?Q?tT53T1ZaOnmZuc35mbIZcU2IVZTK8UFepf9jxAi6dbuUpX8pCD94sX1C8UNu?=
 =?us-ascii?Q?b2ED8YoIUNMmxq7ghb4twnHqVt+vZUWoBl5N9VoRs6+VceYQwGMs6hVJGkm0?=
 =?us-ascii?Q?I5nbUnDmDsgM09HVyeA+xQpnNY/ciIRTwbQPk+LJs/Bsux+xQ8yWSSW5ZUUM?=
 =?us-ascii?Q?qH1g3EihCsdor+5pMs+SA//a+CQMFgludmtUc7X0yZDbJ1hW1vIakU7/RwgQ?=
 =?us-ascii?Q?+BKfEe/S7C6pbmgKmiZ6ffvouf2jIVBCJss5k3QDlxfsQ8VNd41Pn7OXfVkf?=
 =?us-ascii?Q?B2YUr15wXZTE2VpOgSAoYK77a6ut46dPbeyILs4Dz4R/ItLXUC7uxSEDwLvu?=
 =?us-ascii?Q?8j0nkyfaMgbSJS8HvzQlaZhOUztDiFV7W7QkhEd+FReoDtvx7VZuNDNOh4hw?=
 =?us-ascii?Q?6NgpSZwWuYYtvPi21gHYPNslN906SDAykZYgJOJsYvuOtRpNW5HEjRx8Q22H?=
 =?us-ascii?Q?9CLkMma7uWE5EQM94Krq0HKi9vEKTeswZAucKwKjngWSAvaKigHDYKTySwq5?=
 =?us-ascii?Q?IZuQQWkEJjSXh/19hI0z4o1ygaTaZxHPBZF2Q+cDAAemfjOFpVgOt61yKgNy?=
 =?us-ascii?Q?RObnuYJ3DBMB2wT68d1Kjnzt/5xSj//ShVb/LoPlCMhoxCfVC0PKzQP7tM8t?=
 =?us-ascii?Q?k3irwKCxJCifCwgENHiInTqScY/muiqoD1p2Mh/oSs0IFQgjTwuqIndeInqK?=
 =?us-ascii?Q?ZA5wLljYpw1DSn88iNRUbaI63GvZIIj/7Ex6ZMSZAfzXZ8yqfQ/9utWOSKNc?=
 =?us-ascii?Q?1cMpIP6g38rxG7IQirUHXc4qdnNL+JEB0Kt7pMinomrv76pX2t8Db4Z+jN9o?=
 =?us-ascii?Q?j+4L9lpLUtF2kvVly+KgDoGbaIthSH0mjiJIYeFDrSnpmBHCiA5pPRIrnZrU?=
 =?us-ascii?Q?fu45bK0xl9NaWR6OMyM/wUpjCXiNLhKcwKK6FAKoOb42mDQAE/pxGfd3bJgy?=
 =?us-ascii?Q?Pyvt34I9LQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0cc533-b42f-45cd-711d-08de5d7f6971
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:38:14.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66gdw9SmRYta3HcZPF0kk/4ruam+lmG3DHZdC+HQ/WxDieseJ8vhn18dQWYIT47/yfUouCWqmeGX1/u+mFSq7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6867

The i.MX93 Wireless EVK board reuses most of the design of the 11x11
EVK. To avoid duplication and DTS-to-DTS include, extract the common
parts into a new imx93-evk-common.dtsi, which will be included by both
the 11x11 EVK and the Wireless EVK DTS files.

No functional change intended.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 954 +-----------------
 .../boot/dts/freescale/imx93-evk-common.dtsi  | 950 +++++++++++++++++
 2 files changed, 960 insertions(+), 944 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index acb160d3186c..b63e46ead5d2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -1,118 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2022 NXP
+ * Copyright 2022-2026 NXP
  */
 
 /dts-v1/;
 
-#include <dt-bindings/usb/pd.h>
-#include "imx93.dtsi"
+#include "imx93-evk-common.dtsi"
 
 / {
 	model = "NXP i.MX93 11X11 EVK board";
 	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
 
-	aliases {
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
-		gpio0 = &gpio1;
-		gpio1 = &gpio2;
-		gpio2 = &gpio3;
-		i2c0 = &lpi2c1;
-		i2c1 = &lpi2c2;
-		i2c2 = &lpi2c3;
-		mmc0 = &usdhc1;
-		mmc1 = &usdhc2;
-		rtc0 = &bbnsm_rtc;
-		serial0 = &lpuart1;
-		serial1 = &lpuart2;
-		serial2 = &lpuart3;
-		serial3 = &lpuart4;
-		serial4 = &lpuart5;
-	};
-
-	chosen {
-		stdout-path = &lpuart1;
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			reusable;
-			alloc-ranges = <0 0x80000000 0 0x40000000>;
-			size = <0 0x10000000>;
-			linux,cma-default;
-		};
-
-		vdev0vring0: vdev0vring0@a4000000 {
-			reg = <0 0xa4000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@a4008000 {
-			reg = <0 0xa4008000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@a4010000 {
-			reg = <0 0xa4010000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@a4018000 {
-			reg = <0 0xa4018000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@a4020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa4020000 0 0x100000>;
-			no-map;
-		};
-
-	};
-
-	flexcan_phy: can-phy {
-		compatible = "nxp,tja1057";
-		#phy-cells = <0>;
-		max-bitrate = <5000000>;
-		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
-	};
-
-	reg_vdd_12v: regulator-vdd-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_vref_1v8: regulator-adc-vref {
-		compatible = "regulator-fixed";
-		regulator-name = "vref_1v8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	reg_audio_pwr: regulator-audio-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "audio-pwr";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -122,51 +20,6 @@ reg_m2_pwr: regulator-m2-pwr {
 		enable-active-high;
 	};
 
-	reg_usdhc2_vmmc: regulator-usdhc2 {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
-		regulator-name = "VSD_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
-		off-on-delay-us = <12000>;
-		enable-active-high;
-	};
-
-	reg_usdhc3_vmmc: regulator-usdhc3 {
-		compatible = "regulator-fixed";
-		regulator-name = "WLAN_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_m2_pwr>;
-		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
-		/*
-		 * IW612 wifi chip needs more delay than other wifi chips to complete
-		 * the host interface initialization after power up, otherwise the
-		 * internal state of IW612 may be unstable, resulting in the failure of
-		 * the SDIO3.0 switch voltage.
-		 */
-		startup-delay-us = <20000>;
-		enable-active-high;
-	};
-
-	usdhc3_pwrseq: usdhc3_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
-	};
-
-	backlight_lvds: backlight-lvds {
-		compatible = "pwm-backlight";
-		pwms = <&adp5585 0 100000 0>;
-		brightness-levels = <0 100>;
-		num-interpolated-steps = <100>;
-		default-brightness-level = <100>;
-		power-supply = <&reg_vdd_12v>;
-		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
-		status = "disabled";
-	};
-
 	bt_sco_codec: bt-sco-codec {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
@@ -204,354 +57,10 @@ cpu {
 			};
 		};
 	};
-
-	sound-wm8962 {
-		compatible = "fsl,imx-audio-wm8962";
-		model = "wm8962-audio";
-		audio-cpu = <&sai3>;
-		audio-codec = <&wm8962>;
-		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
-		audio-routing =
-			"Headphone Jack", "HPOUTL",
-			"Headphone Jack", "HPOUTR",
-			"Ext Spk", "SPKOUTL",
-			"Ext Spk", "SPKOUTR",
-			"AMIC", "MICBIAS",
-			"IN3R", "AMIC",
-			"IN1R", "AMIC";
-	};
-
-	sound-xcvr {
-		compatible = "fsl,imx-audio-card";
-		model = "imx-audio-xcvr";
-
-		pri-dai-link {
-			link-name = "XCVR PCM";
-
-			cpu {
-				sound-dai = <&xcvr>;
-			};
-		};
-	};
-};
-
-&adc1 {
-	vref-supply = <&reg_vref_1v8>;
-	status = "okay";
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
-&eqos {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_eqos>;
-	pinctrl-1 = <&pinctrl_eqos_sleep>;
-	phy-mode = "rgmii-id";
-	phy-handle = <&ethphy1>;
-	status = "okay";
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clock-frequency = <5000000>;
-
-		ethphy1: ethernet-phy@1 {
-			reg = <1>;
-			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <10000>;
-			reset-deassert-us = <80000>;
-			realtek,clkout-disable;
-		};
-	};
-};
-
-&fec {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_fec>;
-	pinctrl-1 = <&pinctrl_fec_sleep>;
-	phy-mode = "rgmii-id";
-	phy-handle = <&ethphy2>;
-	fsl,magic-packet;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clock-frequency = <5000000>;
-
-		ethphy2: ethernet-phy@2 {
-			reg = <2>;
-			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <10000>;
-			reset-deassert-us = <80000>;
-			realtek,clkout-disable;
-		};
-	};
-};
-
-&flexcan2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
-	phys = <&flexcan_phy>;
-	status = "okay";
-};
-
-&lpi2c1 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c1>;
-	status = "okay";
-
-	wm8962: codec@1a {
-		compatible = "wlf,wm8962";
-		reg = <0x1a>;
-		clocks = <&clk IMX93_CLK_SAI3_GATE>;
-		DCVDD-supply = <&reg_audio_pwr>;
-		DBVDD-supply = <&reg_audio_pwr>;
-		AVDD-supply = <&reg_audio_pwr>;
-		CPVDD-supply = <&reg_audio_pwr>;
-		MICVDD-supply = <&reg_audio_pwr>;
-		PLLVDD-supply = <&reg_audio_pwr>;
-		SPKVDD1-supply = <&reg_audio_pwr>;
-		SPKVDD2-supply = <&reg_audio_pwr>;
-		gpio-cfg = <
-			0x0000 /* 0:Default */
-			0x0000 /* 1:Default */
-			0x0000 /* 2:FN_DMICCLK */
-			0x0000 /* 3:Default */
-			0x0000 /* 4:FN_DMICCDAT */
-			0x0000 /* 5:Default */
-		>;
-	};
-
-	inertial-meter@6a {
-		compatible = "st,lsm6dso";
-		reg = <0x6a>;
-	};
-};
-
-&lpi2c2 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c2>;
-	status = "okay";
-
-	pcal6524: gpio@22 {
-		compatible = "nxp,pcal6524";
-		reg = <0x22>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcal6524>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		m2-pcm-level-shifter-hog {
-			gpio-hog;
-			gpios = <19 GPIO_ACTIVE_HIGH>;
-			output-high;
-		};
-	};
-
-	pmic@25 {
-		compatible = "nxp,pca9451a";
-		reg = <0x25>;
-		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-
-		regulators {
-			buck1: BUCK1 {
-				regulator-name = "BUCK1";
-				regulator-min-microvolt = <610000>;
-				regulator-max-microvolt = <950000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <3125>;
-			};
-
-			buck2: BUCK2 {
-				regulator-name = "BUCK2";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <670000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <3125>;
-			};
-
-			buck4: BUCK4 {
-				regulator-name = "BUCK4";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck5: BUCK5 {
-				regulator-name = "BUCK5";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck6: BUCK6 {
-				regulator-name = "BUCK6";
-				regulator-min-microvolt = <1060000>;
-				regulator-max-microvolt = <1140000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo1: LDO1 {
-				regulator-name = "LDO1";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <1980000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo4: LDO4 {
-				regulator-name = "LDO4";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <840000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo5: LDO5 {
-				regulator-name = "LDO5";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-
-	adp5585: io-expander@34 {
-		compatible = "adi,adp5585-00", "adi,adp5585";
-		reg = <0x34>;
-		vdd-supply = <&buck4>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-reserved-ranges = <5 1>;
-		#pwm-cells = <3>;
-	};
-};
-
-&lpi2c3 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c3>;
-	status = "okay";
-
-	adp5585_isp: io-expander@34 {
-		compatible = "adi,adp5585-01", "adi,adp5585";
-		reg = <0x34>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#pwm-cells = <3>;
-	};
-
-	ptn5110: tcpc@50 {
-		compatible = "nxp,ptn5110", "tcpci";
-		reg = <0x50>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		typec1_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "dual";
-			data-role = "dual";
-			try-power-role = "sink";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-				     PDO_VAR(5000, 20000, 3000)>;
-			op-sink-microwatt = <15000000>;
-			self-powered;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					typec1_dr_sw: endpoint {
-						remote-endpoint = <&usb1_drd_sw>;
-					};
-				};
-			};
-		};
-	};
-
-	ptn5110_2: tcpc@51 {
-		compatible = "nxp,ptn5110", "tcpci";
-		reg = <0x51>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		typec2_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "dual";
-			data-role = "dual";
-			try-power-role = "sink";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-				     PDO_VAR(5000, 20000, 3000)>;
-			op-sink-microwatt = <15000000>;
-			self-powered;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					typec2_dr_sw: endpoint {
-						remote-endpoint = <&usb2_drd_sw>;
-					};
-				};
-			};
-		};
-	};
-
-	pcf2131: rtc@53 {
-		compatible = "nxp,pcf2131";
-		reg = <0x53>;
-		interrupt-parent = <&pcal6524>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-	};
-};
-
-&lpuart1 { /* console */
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart1>;
-	status = "okay";
-};
-
-&lpuart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart5>;
-	status = "okay";
-
-	bluetooth {
-		compatible = "nxp,88w8987-bt";
-	};
+&reg_usdhc3_vmmc {
+	vin-supply = <&reg_m2_pwr>;
 };
 
 &micfil {
@@ -564,12 +73,12 @@ &micfil {
 	status = "okay";
 };
 
-&mu1 {
-	status = "okay";
-};
-
-&mu2 {
-	status = "okay";
+&pcal6524 {
+	m2-pcm-level-shifter-hog {
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
 };
 
 &sai1 {
@@ -583,237 +92,7 @@ &sai1 {
 	status = "okay";
 };
 
-&sai3 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_sai3>;
-	pinctrl-1 = <&pinctrl_sai3_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SAI3>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
-&usbotg1 {
-	dr_mode = "otg";
-	hnp-disable;
-	srp-disable;
-	adp-disable;
-	usb-role-switch;
-	disable-over-current;
-	samsung,picophy-pre-emp-curr-control = <3>;
-	samsung,picophy-dc-vol-level-adjust = <7>;
-	status = "okay";
-
-	port {
-		usb1_drd_sw: endpoint {
-			remote-endpoint = <&typec1_dr_sw>;
-		};
-	};
-};
-
-&usbotg2 {
-	dr_mode = "otg";
-	hnp-disable;
-	srp-disable;
-	adp-disable;
-	usb-role-switch;
-	disable-over-current;
-	samsung,picophy-pre-emp-curr-control = <3>;
-	samsung,picophy-dc-vol-level-adjust = <7>;
-	status = "okay";
-
-	port {
-		usb2_drd_sw: endpoint {
-			remote-endpoint = <&typec2_dr_sw>;
-		};
-	};
-};
-
-&usdhc1 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
-&usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
-	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	bus-width = <4>;
-	status = "okay";
-	no-mmc;
-};
-
-&usdhc3 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
-	mmc-pwrseq = <&usdhc3_pwrseq>;
-	vmmc-supply = <&reg_usdhc3_vmmc>;
-	bus-width = <4>;
-	keep-power-in-suspend;
-	non-removable;
-	wakeup-source;
-	status = "okay";
-};
-
-&wdog3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdog>;
-	fsl,ext-reset-output;
-	status = "okay";
-};
-
-&xcvr {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_spdif>;
-	pinctrl-1 = <&pinctrl_spdif_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
-			 <&clk IMX93_CLK_AUDIO_XCVR>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
-			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-	assigned-clock-rates = <12288000>, <200000000>;
-	status = "okay";
-};
-
 &iomuxc {
-	pinctrl_eqos: eqosgrp {
-		fsl,pins = <
-			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
-			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
-			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
-			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
-			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
-			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
-			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
-			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
-			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
-			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
-			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
-		>;
-	};
-
-	pinctrl_eqos_sleep: eqossleepgrp {
-		fsl,pins = <
-			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
-			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
-			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
-			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
-			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
-			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
-			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
-			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
-			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
-			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
-			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
-			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
-			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
-			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
-		>;
-	};
-
-	pinctrl_fec: fecgrp {
-		fsl,pins = <
-			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
-			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
-			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
-			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
-			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
-			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
-			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
-			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
-			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
-			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
-			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
-			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
-		>;
-	};
-
-	pinctrl_fec_sleep: fecsleepgrp {
-		fsl,pins = <
-			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
-			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
-			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
-			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
-			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
-			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
-			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
-			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
-			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
-			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
-			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
-			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
-			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
-			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
-		>;
-	};
-
-	pinctrl_flexcan2: flexcan2grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
-			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
-		>;
-	};
-
-	pinctrl_uart1: uart1grp {
-		fsl,pins = <
-			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
-		>;
-	};
-
-	pinctrl_uart5: uart5grp {
-		fsl,pins = <
-			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
-			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
-			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
-			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
-		>;
-	};
-
-	pinctrl_lpi2c1: lpi2c1grp {
-		fsl,pins = <
-			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
-			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
-		>;
-	};
-
-	pinctrl_lpi2c2: lpi2c2grp {
-		fsl,pins = <
-			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
-			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
-		>;
-	};
-
-	pinctrl_lpi2c3: lpi2c3grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
-			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
-		>;
-	};
-
-	pinctrl_pcal6524: pcal6524grp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-		>;
-	};
-
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
@@ -847,217 +126,4 @@ MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
 			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
 		>;
 	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
-		>;
-	};
-
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
-		>;
-	};
-
-	pinctrl_sai3: sai3grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
-			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
-			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
-			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
-			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
-		>;
-	};
-
-	pinctrl_sai3_sleep: sai3sleepgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
-			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
-			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
-			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
-			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
-		>;
-	};
-
-	pinctrl_spdif: spdifgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
-			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
-		>;
-	};
-
-	pinctrl_spdif_sleep: spdifsleepgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
-			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
-		>;
-	};
-
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-		>;
-	};
-
-	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
-			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
-			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
-			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
-			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
-			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
-			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
-		>;
-	};
-
-	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
-			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
-			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
-			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
-			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
-			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
-		>;
-	};
-
-	pinctrl_usdhc3_wlan: usdhc3wlangrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
-		>;
-	};
-
-	pinctrl_wdog: wdoggrp {
-		fsl,pins = <
-			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
-		>;
-	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
new file mode 100644
index 000000000000..c73071ac639f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
@@ -0,0 +1,950 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <dt-bindings/usb/pd.h>
+#include "imx93.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+
+		vdev0vring0: vdev0vring0@a4000000 {
+			reg = <0 0xa4000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@a4008000 {
+			reg = <0 0xa4008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@a4010000 {
+			reg = <0 0xa4010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@a4018000 {
+			reg = <0 0xa4018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@a4020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xa4020000 0 0x100000>;
+			no-map;
+		};
+
+	};
+
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1057";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_vdd_12v: regulator-vdd-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
+
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&adp5585 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		power-supply = <&reg_vdd_12v>;
+		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai3>;
+		audio-codec = <&wm8962>;
+		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
+		audio-routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"Ext Spk", "SPKOUTL",
+			"Ext Spk", "SPKOUTR",
+			"AMIC", "MICBIAS",
+			"IN3R", "AMIC",
+			"IN1R", "AMIC";
+	};
+
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1>,
+		 <&mu1 1 1>,
+		 <&mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy1>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy1: ethernet-phy@1 {
+			reg = <1>;
+			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy2: ethernet-phy@2 {
+			reg = <2>;
+			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan_phy>;
+	status = "okay";
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	status = "okay";
+
+	wm8962: codec@1a {
+		compatible = "wlf,wm8962";
+		reg = <0x1a>;
+		clocks = <&clk IMX93_CLK_SAI3_GATE>;
+		DCVDD-supply = <&reg_audio_pwr>;
+		DBVDD-supply = <&reg_audio_pwr>;
+		AVDD-supply = <&reg_audio_pwr>;
+		CPVDD-supply = <&reg_audio_pwr>;
+		MICVDD-supply = <&reg_audio_pwr>;
+		PLLVDD-supply = <&reg_audio_pwr>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+		SPKVDD2-supply = <&reg_audio_pwr>;
+		gpio-cfg = <
+			0x0000 /* 0:Default */
+			0x0000 /* 1:Default */
+			0x0000 /* 2:FN_DMICCLK */
+			0x0000 /* 3:Default */
+			0x0000 /* 4:FN_DMICCDAT */
+			0x0000 /* 5:Default */
+		>;
+	};
+
+	inertial-meter@6a {
+		compatible = "st,lsm6dso";
+		reg = <0x6a>;
+	};
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <610000>;
+				regulator-max-microvolt = <950000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <670000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <1060000>;
+				regulator-max-microvolt = <1140000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1620000>;
+				regulator-max-microvolt = <1980000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <840000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		vdd-supply = <&buck4>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-reserved-ranges = <5 1>;
+		#pwm-cells = <3>;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	adp5585_isp: io-expander@34 {
+		compatible = "adi,adp5585-01", "adi,adp5585";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		typec2_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec2_dr_sw: endpoint {
+						remote-endpoint = <&usb2_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	pcf2131: rtc@53 {
+		compatible = "nxp,pcf2131";
+		reg = <0x53>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&lpuart1 { /* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mu1 {
+	status = "okay";
+};
+
+&mu2 {
+	status = "okay";
+};
+
+&sai3 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-1 = <&pinctrl_sai3_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb2_drd_sw: endpoint {
+			remote-endpoint = <&typec2_dr_sw>;
+		};
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+	no-mmc;
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&xcvr {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_spdif>;
+	pinctrl-1 = <&pinctrl_spdif_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
+			 <&clk IMX93_CLK_AUDIO_XCVR>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
+			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <12288000>, <200000000>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqossleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
+			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
+			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
+			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
+			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
+			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
+			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
+			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
+			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
+			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
+			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
+			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
+			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
+			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
+			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
+			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
+			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
+			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
+			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
+		>;
+	};
+
+	pinctrl_sai3_sleep: sai3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
+			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
+			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
+			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
+			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
+		>;
+	};
+
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
+			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
+		>;
+	};
+
+	pinctrl_spdif_sleep: spdifsleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
+			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
+			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
+			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
+			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
+			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
+			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
+			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
+};
-- 
2.37.1

