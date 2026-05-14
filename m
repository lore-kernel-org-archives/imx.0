Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E352E3BF698
	for <imx@lists.linux.dev>; Thu, 14 May 2026 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742375; cv=fail; b=mTuYk4XTO6P2cgADmuyGhtSuukv9Of19qUqP7JeSLaXvFDVUOjaTCSmrGXXhx+JsZ0i5QH6SWeCZ0fvQ5Y9ZtT4tHTQaxcxE8rdNOxnMGYg3v5K64GcrLZh70x4ib4YzrGjZmzf959d1PZGmo9r6smpN+gLp6DoYRY83BfWb6bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742375; c=relaxed/simple;
	bh=3BUyKstRl7d6PU0oK9ScjYwO28lNhqQClpnLg3JsmVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfNH/JlUlei9v7kkLrSx3UWCDutng4EbIO0CEUN+2iqpWlwAe+oxmnyJrj3AqmJtm92ZavnzOMs5mwBZ+TugDn/C1YL0KEAFF669dhBdwKbHePg4CR44zIQktn6EzLW8ZPZdeVj/zGHIzZkMKP8LUdhkZspglXHNyBjFNh499Ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TB1A6fT5; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TB1A6fT5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIgoTMxS8tkCopl7ru87evr9b1Lb/k9SLbOdvZRdGzG/8lSldvInDiSutb+KD8pTTaVmE9fWzk0fEOYGefXnkRDWnh/5iblMf6F+4vAGFHhxEK7T9xB89cLfqwRHljPEbzF4zQshvGnkMBuIp+FpnJSPYz4nS3/ZgKf8nAKsJc7oq+RABD1/d3X2ZReGp4xrQ7rJS+8b6iAdwtCi17EIs/RnBYwwEZCWaRVmZd5qg1OZbDV4cZGjOgNRI0LYzZKts8PhLEgGOIOGPXF3Q19kmP1dPgPtmgSXhcFxXhMXUbIgkMMTPuJC4QnpmEL5XPrSKfZxZ6XnY0q/aCUjb0he9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKqSWk8EWuER51J41YRDR9pHXHGy9IU6tf6fJZ9baX0=;
 b=hE54ziaheUkySLOqK3X+WD8V6G85da63NInibzFG7D1ew8WDqZbT12YC0aZhB3A4ih059KZ4V+FKWHO2A86yrGHK9FuSc0NdAUEhAHUK/AMFXRNbKziyPAPoOtxuT9LnJ5deGsABsnZJnr1zOfs/DQOezZ5hOCZz+Uei92iol0IRMPos+OI00JYVs859aZPm2QPvJ4Q/GFTAyplyW6Cy9SR5ugmNe4Ec2Isr2CohQapZqBJ4UrpJkQZVrMNIOLC4vjlM2Tsdgb8dmBZwJ3g8xjSg+PjzCzucqV+pDwoCBpNNrcMObRYtlEeCYFWZBDsEHbCDx7IpEqBgNdwhKLKqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKqSWk8EWuER51J41YRDR9pHXHGy9IU6tf6fJZ9baX0=;
 b=TB1A6fT519ENG09ITfU4a76aLdjhmh+2t9580f/zWd8pejRawGoIyrEMHCzEyaS6bIe9R4xJ3a/9gEebLU2/XA+etLbgf0VGIN0nE3ZJX2eBRCBzcd+LTjLcL7nt2fBKJaUrZZfVzhQbjAzX9YPaH8pBp4d70WkzRTxkG8n/4x2Fuf2KH2/J8QPA3XqiljiUq72rbH7s0XwkVDC5szjvCkIkySYsruMUq7d+D3M+0Xiwsi1wilj41x3YPBBotGNdh+CqfF0KcppSfUydPmB0Tc9OGEePq+h2kMfuv6dlA4hRsYgeBsxz+gYOB6pTUr3aQOIVDGPWTXcV52eBoZQjvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 07:06:09 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 07:06:09 +0000
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
Subject: [PATCH 1/2] arm64: dts: s32g: add PIT support for s32g2 and s32g3
Date: Thu, 14 May 2026 09:06:04 +0200
Message-Id: <20260514070605.996462-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::14) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 03aad095-7e45-4b54-9776-08deb1874620
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 JF5UYk56x7N0n6Elho2So/Yk4VLbrVdse3YBqyBVbC8xJUWcoVmjIpPHYnVbCJZSu5Jo/afAzegA8Y9RcVR2t+4pJnYdYHRO/kb9DJlof9CS5gpUAUV6OSDnsKhD8q6aOZpAVjum5y8dH/9Fx1UVr11eF3A2cpHqv0ThCB55f3HxetUrZVEqIXra7jy95781aKj2fnTzmvZzrPBJq8zL9t0BHMdCk2Bzay1FsuZrWNx/uYoCSSqKAkWZAmwD9O6DSENaVmCjUsR/yG444JnNpzDXUIWef+TwH8TQnLxlMG5xUyaryophVyx51BbUje9C54VNgnYkPHGOjF6u+2lc9/RGNrzvP/T/b8T6yMFcVrWAHQctm/3m6bQfgG+0bwZY6l2lay0gxdwmYC4sW4EH4Yc7IyRs/CVZ7LjnG5mO7KW/zYLv9ll6mnBN5ea2xLpapOnT/4G/MqG51w4MI3CFFErBAFDwVO6Mxif+5fMhYTweGxbpBniJb8fumABXbXcB6FdxO24gVtZl+p8nOU+QT6zju60TWSobI4LtdH4/+KLxQzXIknjl/8C1wzncWw1ue1woQK/8bkhepDKSi8B4CzP07Tx/XFFC4z8Sw3C3DakF2NVQxzk6CooLSM6NPcceXWZbZ5QtsIRATPjZ08v6dDIYt73iVG8LSYm+V429RwDCZarS1Wm0In7GNFo6MxXI
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q3RZZFJYQnBTd3pWZ29JNzdXTEZnTHIydnJZRGJJbW5WOW1BRkxXeG9VU3Ns?=
 =?utf-8?B?VUNkNzVtaitCUmtOSmxKWk1VSWdLbmRmS3cyajJwMVo4bjNYYWlBUTJ4MkZs?=
 =?utf-8?B?M01jY04zUkdpc1JzU0I1cUcxMEdHTmRwSmI1WEhNN1RCZlkrNklkMVdZWHVI?=
 =?utf-8?B?aC9IdTAvVGdqNTF1Y1VsNk9vNzVmNDVKamJZWkErcEJYM2k5NVpMeGxxM3do?=
 =?utf-8?B?YjJRT3NGTmpuemU3dEUvRGw4TFN1VHpydlFMMTE5TzN1ZkIyQ0ZMb1dUcm1w?=
 =?utf-8?B?KzdKNjFWL1hLWE5RZXZPYkpYbEdEREZpTDBJM3A2Vk9QUmJVQTkvazVsZGlx?=
 =?utf-8?B?bTlqMzBKcWZTVlJjMU1GaWx3SzNMVE1PN0hMdWRqV3ozRThJZEJKRldmeEVC?=
 =?utf-8?B?MEdHWlBRMXFuVjhiQ1pjdjBlaG0xWk5EcmdPU05rNTZKcFpQdWFEQnR1VDNt?=
 =?utf-8?B?bzYxN2RXVnlZTXY2ZFRsTHZQT2dodnBhZ0JLU0pQSUlLSWkzTndPU0xRRi9n?=
 =?utf-8?B?TitwcVh6bElGNUFDMENvOUI5RlozWUJMeWVydDZ1eURGcXJma0pDVXhqMDJI?=
 =?utf-8?B?R3NKdDRQb2RYZTBqdkVZSk1XUUVJRk9qMWNic0pSa3ZDTTdNblJIM3dIZGdm?=
 =?utf-8?B?eklrNFNtQ2x6UWt2aE9kMnFIeTltY3gza0hTd09rMGpOaUFwUXpndFBBQTBF?=
 =?utf-8?B?NUY2aU92czBVTzFvN1dnTXpPSThwcXVPTnFjeXdhT3VETnM2WVFJbkdYdUMx?=
 =?utf-8?B?ekVXT2VGejhLRzIrMGcwVFBtd3N1T1d4SUwxOStPK3hOZmJEVU9hT3B1d3NV?=
 =?utf-8?B?cjRCbXhkcmczaEJBd3lJditCcFNkcDN1L3Q2cG0zLzV5aGJZdmhNUVNDYzBx?=
 =?utf-8?B?UnRobXhQZDRhR25RZmlnZUg3cExZaUwrM3hTaVhPOUVuV2xaUVRGdnJhWTll?=
 =?utf-8?B?MDdKR0lwTjNLbmlKMkNoZXRralNBczFZa0IvaXVYc1kvS2ZQbHNzdTBZTTdr?=
 =?utf-8?B?eGFVeTZBTnVPMkg5cWo0c0s4eFJqam52NW0rU0FscEg5TjhLTzN5aDMxVk5C?=
 =?utf-8?B?bXpJR3lRRmRVcFMra0FjbXRKZ0ErcUlSNU9uMDVjL1pIK1YxNTdsM2FoNzR3?=
 =?utf-8?B?UW45aEJ3eW4vUzY4bkdycXNaZ01ZSmtYYTVraFB0eDhGcWQxblhzOUZhVTNU?=
 =?utf-8?B?YWxPZXp1b3pzb2h5Tk5xem5UVWpKbWU4Wm9OM2o0TzM0UFNKNmM3VGVOU2E1?=
 =?utf-8?B?a3BPcVhsMXR0UFFhL04ydGJVd0xNV1pEaW9YazEwQWdOR1RxM09TdlRWZjky?=
 =?utf-8?B?aDB5akFyVHA2bmJ4blRCQktSZGlQME1DU2JRMU1rN0paMjFCanhtNFZhWkF6?=
 =?utf-8?B?cDgwYXRud2R4Rm9iWjFhY051Vithd0dwY29RRWNZQUdxZjFCcVMzOGpLYTIz?=
 =?utf-8?B?cm50RDRDc1BDd1JkdmhYYnBVR2R5K2RYOFJiYkVCYms4RGlMNkIzQUxmK2hZ?=
 =?utf-8?B?d04vZHlvUVF4MG1FY1RPVnpmZXBTcGRaVnBja3dpT0tYalhtSmFVam82TjU5?=
 =?utf-8?B?S0c0Q3hRQjRvcmo4eTVSYjhHdGVSUTBsQUVMSkMraG90a25zdXVGN1JLR2F4?=
 =?utf-8?B?dEt6aWozRWlJY2QyYXJ4ODJYekZBRWdpWWlFZWJkNTh0cjBrZjJlOTh0RHU0?=
 =?utf-8?B?ZWMwS1dqcEJJWGNESm5rVmxUSkYxK0pDSDUzY1RqMldZOS9WMEFBM3dRYXVE?=
 =?utf-8?B?c0o2WE5PWjFoMnFmKzd6elZ4MzBCL0U5RzFXRkwxaVl4QVN0V3hzaENXR0py?=
 =?utf-8?B?L2gvWm8wSUtnZ0ZTbmtUWHhOaWkxa2MyRTI5MVhiaW1DNGpGY1VTRzR6b0xW?=
 =?utf-8?B?THJjcklKWFZLYS9DTUNTNk1MNVpRb3pyQkh0NjF5Rk5ZTkFBSHo3UVpXcG43?=
 =?utf-8?B?RVRPbjcxY21Jc3NrVjdnakJvQkk2ZndzUVFUd3o2T3VKTzFsR1BvbVJ4cEY5?=
 =?utf-8?B?OVVHdWh2ajlFSDhTQy9ha3U4N0dNN1dJL2g1cEpsOEZualZmL1dYMklEV3Y2?=
 =?utf-8?B?MHRwM0tETEMvNHFSS2dSNnBSaUFJaHU0V3ZOM3RpbmxsWGtsQUswUk1ZVVcz?=
 =?utf-8?B?QTJ5emdaKzhXTmE4YjJGZDZobGZQQzhsQXVjOTNmNFhFRXU3Q2Y3R0VJUDI1?=
 =?utf-8?B?VUdBNlNaU3ZJampsRFFUVUM0RWl5VGdxbFhNOSs2N2xHdVB6eVVKVGYxbFZu?=
 =?utf-8?B?ZGNpaDQxb2hUTzZvQ2F4bWZzRHc3U1NTQnlsQXphMHRIUzhKaDZWTzNlS2JZ?=
 =?utf-8?B?eWV1eVFRRmU3UXQ4eUdlVVlqckxRNGVnSWw3VDVneFQ5ZzFlN1dnczFCbFBN?=
 =?utf-8?Q?mgw8Dfv7DhSe088Ei6tgLsSYjkL0LOunCPoKB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aad095-7e45-4b54-9776-08deb1874620
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 07:06:09.8361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLXGgbbyrlLxkjig5EGV3ieYp3O71sfJbpxlqr5ZkKIjHFGUdNiUqcQXboiVcfnZo0P1N/IHZfriEjjprqwUOHIgJ5b4K7yO7qY+PXQWzbkqfqztyyU3eu5YFBkoNObI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

Add PIT0 and PIT1 for S32G2 and S32G3 SoCs

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..57ff97e44507 100644
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
@@ -417,6 +417,15 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit0: pit@40188000 {
+			compatible = "nxp,s32g2-pit";
+			reg = <0x40188000 0x3000>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can0: can@401b4000 {
 			compatible = "nxp,s32g2-flexcan";
 			reg = <0x401b4000 0xa000>;
@@ -622,6 +631,15 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit1: pit@40288000 {
+			compatible = "nxp,s32g2-pit";
+			reg = <0x40288000 0x3000>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can2: can@402a8000 {
 			compatible = "nxp,s32g2-flexcan";
 			reg = <0x402a8000 0xa000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..efe5398e1240 100644
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
@@ -475,6 +475,15 @@ edma0: dma-controller@40144000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit0: pit@40188000 {
+			compatible = "nxp,s32g3-pit", "nxp,s32g2-pit";
+			reg = <0x40188000 0x3000>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can0: can@401b4000 {
 			compatible = "nxp,s32g3-flexcan",
 					   "nxp,s32g2-flexcan";
@@ -693,6 +702,15 @@ edma1: dma-controller@40244000 {
 			clock-names = "dmamux0", "dmamux1";
 		};
 
+		pit1: pit@40288000 {
+			compatible = "nxp,s32g3-pit", "nxp,s32g2-pit";
+			reg = <0x40288000 0x3000>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 61>;
+			clock-names = "pit";
+			status = "disabled";
+		};
+
 		can2: can@402a8000 {
 			compatible = "nxp,s32g3-flexcan",
 					   "nxp,s32g2-flexcan";
-- 
2.34.1

