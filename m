Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026353F1AC7
	for <imx@lists.linux.dev>; Wed, 20 May 2026 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289822; cv=fail; b=IeQjyYT/l8FkvbxlCWqSnZogoZp5ejtJn3QH4Xtm9J/B0rBDNwi993mYm1Pgy1jZ/vSkkMricitqgiW9LTMj5cRZVx0qEFd5/Y/8heZSyVWq4Dgh9t//n2Ug/hf91zWQE/qmysEa3IGv7gHJD896MTGqWSoK74mAKeiGQrXhL4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289822; c=relaxed/simple;
	bh=ymn1l5X2WsaLiuC5RmxQDjvD3+H3AwGaTlVpRz1HCTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVSfZctJdlYuH9acCt0dy+ejhC9rBVo2ZsYC49sYcM75chZ+cAL186SR+NxR90zcSJBoCexgBZn5jPSay+pGkbkpGiildYzEEOkKuOIPfVwF4x+yvM6CX3+IYN35b4Cd9QwADCgxhw/xf3+x8dC2f+bCkCA22jo01e94W66Tjgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FfUTngym; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FfUTngym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URIBi2hqJs05iKybHfbKSmF2b3KCFLE5tsz9JSNTgwZc1t/Q8pF1S1SHziX6Ua9Fhnz/JfswRG1glIhxSDdTe53mva6ukkKppYJlTFUKifxnpTFfrIlqdhF7NqTsiKooXnVsRBFeXxX/UDpkmWPHeB4DxHIjSuJLvYycOeEDug2deTHxl9B1qU5/zBPkrxQx/MvS4i93SnCA7INuNfJSsURk4gjmg58BG9APunNyAQyGo7koHtVRFGfiyQ0SBrdkctL5Fdb4kuKCY27IZijsUAaOWijCtLf3J2lwBgAs0uZwCL8ywBCpDVTKfCliuaAdf3/wdfMkHL8FkAxULzhwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaPeRsT4sLRVDk0rqKJm5PVWTpzUfAJoOnuH56Q2jFo=;
 b=Cdt3L133GGPT+sa6dv8raUrWajG0akHG2Tyuxe1FYi6Ijd/93GzI71e6K3ilkU6wc36ZulZHHenRpZ2pn42dxnSN2ct94Oi6+yMNYiqFLV1Cb422aDD4xpRz3N/wqIgBnziFUA/rimpscOjxhpRyL34Z/Td/40wkEi6ZH8ebFUKHxvOsHjcMLth8fsuP1UF3YsEftvF4NTFdIx0cf5V2u7W8P0RhT/mAsQgstS+m9OZqRlu9YXpespxP8gNFFnJGigx2VvKK/gbdwDx9kcYMlDdiU/cxvrI6/trKyVMYv0WYvHSptuwJ52hfpVf6GcHiKHggTCrjxjQpL79l/jGL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaPeRsT4sLRVDk0rqKJm5PVWTpzUfAJoOnuH56Q2jFo=;
 b=FfUTngymzn9zclPawcQ3gRd9oWkqqzbcB55RGqfmKbQnmHnjBuXkABKbGXGoWwGKxRScNNx7SfeSlThk5nGZXYSIn8IfPRoyRIMwgVGx2THXOEaAVvE3jnwEjLoWEAgDVEAgJ1D2OimSTKrp5lN7NhAkYspsrmXZxlj0qWC08yYYLfOWLFljSt9uZ7FrXnzRwPZ02MHo/kdnkPsfHCwkwQfcdqSysOBtqL+vLHwRgMvAkP+pvicARbxMoeV8qF0i7W2xQZIKKJUjKKBTy06j1zxz283ywdB1qLC3GJvYXXlo1bFL1lxujALaEsGoIZAjx5bUF4M6DJk9FxQW9PcyzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 15:10:13 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 15:10:13 +0000
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
Subject: [PATCH v2 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
Date: Wed, 20 May 2026 17:10:07 +0200
Message-Id: <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::6) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM0PR04MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 831852d8-dcdc-48a5-ea63-08deb681e3e0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|11063799006|3023799007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 aKUWT0CypJrf2FagmythtaZCa4qz7tURwdCtKcSMqf6RyTWZwHA0aJtJYtV0KUi5hToP5qT53QAuAIYnhdMfULuZxiLWaFZ8W5gO8cCGyh6AKCXlSRVviP0TpKV+BrZtUNO3owmwujaQj8KDOOj4RKZIk0Mr7k50cV9KDwQWb4oUXPIli3iRYfl05Sj4jsHTKGMQfUw6CCeW52RrpnuganzxtG7wC+yWfhxkfelqa9pV/iEB2VfRcDKaMgYBYhuizZulgFimVPp7R2yZnfZQ2dYV3vr9CTU4jhID/3Bok97AFBOZdDDGtIsIJAbCfEmvP3THiICkM/UOd2si7CphLUH1bd8kPKCetUTXJhxad+SQsOzii3iWjl85+KFupqhlQajnis+wMq7nv0uKYJWlVw5g89ab9jOIwGZPXBfnZEfHWANEZMp0VUnN3j21wGc+kE4kBDajlPLh0gaqHOsjuMOHO3/CjzttZfp5NVrR0QDpj6KMaMI7uWGQqfJPHyp6gz14QhZMLPYpKKhTADl3UegdcBZ+DNyRfrpU6eHRuiB0XyAuJdN+WSxMkh7kbCkvdIikAeN8tcMC2ND1m7k/ya7/OBoS7PgMW/F+zFNY/Rtv5RX2hlYSEADsD5eMhuki4yuTzDnjfeFbXMYgHSoaKoRsBIRT1QMBAzhgB7IRyrGbRa74ANwGlMCD3u6Vpj8U
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(11063799006)(3023799007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TTRFN2xTT3hnUW9BQTlocFQ2SlhBamphNEdRMEN0d2NSRFhEU0VGWUw0dGFy?=
 =?utf-8?B?RkhWcldvS1Q5UHFmQkMvWTBua3BXRE83SWZpTXZlZHE4L045bnBWWDBRTUdh?=
 =?utf-8?B?a0t0S2Y2MUlUNEdOWXFFcjJnQjM0TloxdVpHMWdJbXJuTDJRY2lyRHJOMWFp?=
 =?utf-8?B?Z29aVjZ5aUxpMytlUi9rZEszeFdINFl0ZVlleVk0Qmg4SitOZG5UZ3loQ2g0?=
 =?utf-8?B?MUtBWDRhMHhsakJhb2oyMUp4UDRUWEFtdGE2OHQyR3NYUzI5RFVIUEFUc3Mw?=
 =?utf-8?B?NWlrVFlpUGQ0YmxKK1l1cTllSmE0NHk3SXNrVkZiM2hDcWVqOHFoeGpRUW5n?=
 =?utf-8?B?RkVYUlpNQXRRbmYvRXZKZXkzWXpGRG1XRVFrQjAwYWlKZzBWZk1lcXpVRHJV?=
 =?utf-8?B?aFcwV1VQS3A4MFA0S0s0RWRaTUp1eHMwQmp2SWJsa2dvQ092cHQ5WHJTSnJM?=
 =?utf-8?B?WS9JV0RncGxpa1FDeTBKRjMvV0hteHVCNlJORGh6dnpqajZudC9tQ3RaN0Ru?=
 =?utf-8?B?YVZkeUFZRk9iNXpmMlpRL3BIN3RyYlBhK1ZlUEdZMVZ0ZkE5RVM5RXI3dWd1?=
 =?utf-8?B?dTlKeHBvMFF5ejhuVFM0YzF4MkMwSU1KMUNzSVJodXRMYWVOdGNhcWVqbUw5?=
 =?utf-8?B?aUxkUTNwMDlXaS9MRzhPUTNCK3NKaE5raGJTdzYxekVQbVQzdGUwZFFkd2FY?=
 =?utf-8?B?Q3lKVFUvL0tCcnFRV094MWh0Rk1Qd3ZJNGs2NnNZMU91bThXYjhIUDdncG5M?=
 =?utf-8?B?YnAvb0dFK1IxQVI0MFFjSGdKOGxyNGU4YU9jdmtVanVxY0lpcnVWSzIxSmpJ?=
 =?utf-8?B?MDAwaW5DSTlYdmRnaWJnZXlSRXJxcm9qMUtUd0hvcmg1Z2Vxanp5d2RjNEhS?=
 =?utf-8?B?MjEzb0pWUmsycnlXYm1OcGE2QlUwZWMrRGswdGtqVFAvOUxnMXM3TDBQMGxa?=
 =?utf-8?B?OGhPT0tvQmZPK3BqT0RMSU04b0pubDM3WkxNallaRXFoNzdMM0dyZjN3ZjQ5?=
 =?utf-8?B?bmZzbFZuZWcyOVdlSWpUS1dtVzRFWXM5UzZ0eVloVXBQSzkraWZyRzZqUlhG?=
 =?utf-8?B?aTlLelhjbjk0TFFaNnJPY0pkVUlFTkh3MzdxK08yYTQ2OUFnSFRzaVF0TkFn?=
 =?utf-8?B?azFvSC9mYW9mY1lDK1VxVDlYOWh2UG1ZSWFRb1VXcGN6QXg4SEdFWkNTdW9O?=
 =?utf-8?B?SFJNNGRVcjdIWGljV1lzcXZ6ZVFIWERxeGo1a0VoMGE2cHp0eVZxdUZKQTc2?=
 =?utf-8?B?U3Z3UDc2akF6eFZPcWpVbHVYcm9NT3JYWFRLd1QvRm1Cc01BV1oxL0lDYUwr?=
 =?utf-8?B?WFkvdTh1clNpelBBNEtRSkRrek5GZmVhZm5nWUtxZzhmcUtQVmc4Rnl1b2Qv?=
 =?utf-8?B?SFNhTnhRYlNtdG96c2hISFZvOEtYUGRId2JRSjYzZjZvU3JaVVNjeDdKMUly?=
 =?utf-8?B?MytWRWMveGRqYTR2NkV3N1g3bXA2SkxUNmF5RmRTYnRTMm1ITjByYWl2eGs1?=
 =?utf-8?B?SlFNMDBVZlRWZ1VMVWVXTTA1V1RLZEhSMGFwN1RWMHY3dGdJbklvcXFYc1ZU?=
 =?utf-8?B?QWcvS0IrbzNDU2ZJbWp1UzN3RURTWUU0MVVHc0RMWG5WT21UOGJ0YUxIMlUz?=
 =?utf-8?B?TXVhZG9CQTFmSGc3c2JoY0tzQ0dnU2JZbGs0RUlBcEsyRUNDTlFtTlo1aHVz?=
 =?utf-8?B?RkxhVWQ1ak1ma3FSSE5waS80bGdOam5iTkt1RkxOQnZzaDJYc2NzNWxYekRr?=
 =?utf-8?B?cGlSYnp2aUkzY0dsNm5taVJ5TTFwc1NldWp4TjVrRGJZNWFUc3pyTkF3c284?=
 =?utf-8?B?ZjhnNnRZMVIybVFzaUc2RE96Z1ZNY0tZVkpXTXlROTdiQ0QxbWpUTUtJQzZY?=
 =?utf-8?B?WnI3T2lDVzNQN1dMYWVkQkY4VjNQZjVjdWRtbXQ0TzZubndWejFjVG8vR1pj?=
 =?utf-8?B?MnVCdDE4LzBBL0d0N2ZhemREMVlvRlIxbmpYL2NwS1JueXJnY0R4TDU2SnV5?=
 =?utf-8?B?S1Y0K1h0UFFXdzhKcmtRUWxsaGZBc3JKYTlUenFQd0JKTTFJL0xOTXVVOVJv?=
 =?utf-8?B?YzVzNFgxUXE3ckJOa3JNLzdYeWxNeVNINnVtRzVnT0VZejczdnc3cFg0Z1F0?=
 =?utf-8?B?R3dqdGdsbFpKMVVFQVdVVXFqSE11WG43TDh4ZWpicTNVN1RZZTVpYUJ1Wm10?=
 =?utf-8?B?TXM2VHhaWlZwYUVTZlhVbFovaVl1V1Flc1l3aXBaTzVlU1RSWG5QamxoUmFk?=
 =?utf-8?B?eVRLMWh4YlNNdFdmVkZ6ZHlKV2laUlQrU2JtNkFja2ZDU0Vtb3ZWcWdJVzB0?=
 =?utf-8?B?d1FUbWxWS1dua1RpYWhHR2dsS1lVdXJXNms2OTdqRksyQTl6bDg0S2lBb2pr?=
 =?utf-8?Q?uWR2iiYsnSgtRr3DcryJmkGtkJj0f7yibZR2b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831852d8-dcdc-48a5-ea63-08deb681e3e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:10:13.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YlYs+ieAdE5kpCyRFKjggUomRKqHVSFk0CErM1gHdAZa91S3QeU7eD3DFB/AvBymLyiR6/3WYmVyI9xQhBd45G5QcBqIJXuyGsEPp+4fGYexRS5ngrYd6Eovojc5kM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044

Add the usbphynop node and the usbotg pinctrl
support for the S32G2 and S32G3 SoCs.

This enables the USB controller to reference the
generic PHY and use the required pinmux for USB OTG ops.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
 4 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..a35bb284270e 100644
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
@@ -108,6 +108,11 @@ psci {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..b980e5f2b059 100644
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
@@ -165,6 +165,11 @@ scmi_shmem: shm@d0000000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
index 803ff4531077..26009c1e90dc 100644
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
@@ -245,6 +245,39 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	usbotg_pins: usbotg-pins {
+		usbotg-grp0 {
+			pinmux = <0x3802>, <0x3812>,
+				<0x3822>, <0x3832>,
+				<0x3842>, <0x3852>,
+				<0x3862>, <0x3872>,
+				<0x37f2>, <0x3882>,
+				<0x3892>;
+		};
+
+		usbotg-grp1 {
+			pinmux = <0x3e1>, <0x3f1>,
+				<0x401>, <0x411>,
+				<0xbc1>, <0xbd1>,
+				<0xbe1>, <0x701>;
+			output-enable;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg-grp2 {
+			pinmux = <0xb80>, <0xb90>, <0xbb0>;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg-grp3 {
+			pinmux = <0xba1>;
+			output-enable;
+			slew-rate = <208>;
+		};
+	};
 };
 
 &can0 {
@@ -304,3 +337,14 @@ &spi5 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbmisc {
+	status = "okay";
+};
+
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbotg_pins>;
+	phys = <&usbphynop>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index 979868f6d2c5..a8abb10b0e7a 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2024 NXP
+ * Copyright 2024, 2026 NXP
  *
  * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
  *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
@@ -199,6 +199,39 @@ dspi5-grp4 {
 			bias-pull-up;
 		};
 	};
+
+	usbotg_pins: usbotg-pins {
+		usbotg-grp0 {
+			pinmux = <0x3802>, <0x3812>,
+				<0x3822>, <0x3832>,
+				<0x3842>, <0x3852>,
+				<0x3862>, <0x3872>,
+				<0x37f2>, <0x3882>,
+				<0x3892>;
+		};
+
+		usbotg-grp1 {
+			pinmux = <0x3e1>, <0x3f1>,
+				<0x401>, <0x411>,
+				<0xbc1>, <0xbd1>,
+				<0xbe1>, <0x701>;
+			output-enable;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg-grp2 {
+			pinmux = <0xb80>, <0xb90>, <0xbb0>;
+			input-enable;
+			slew-rate = <208>;
+		};
+
+		usbotg-grp3 {
+			pinmux = <0xba1>;
+			output-enable;
+			slew-rate = <208>;
+		};
+	};
 };
 
 &can0 {
@@ -257,3 +290,14 @@ &i2c4 {
 	pinctrl-1 = <&i2c4_gpio_pins>;
 	status = "okay";
 };
+
+&usbmisc {
+	status = "okay";
+};
+
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbotg_pins>;
+	phys = <&usbphynop>;
+	status = "okay";
+};
-- 
2.34.1

