Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4044606D
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014093; cv=fail; b=drChGbxWSIXguy7QWMMRbKWnzEdEB9dlHP35cUchGHX7Adfzmj4dLA+8MCZ8ez75MUsVrD5pgQr/DY24ABlFF4HX2vL2xdOORnTEM7vVHWaPMiZGUHih+EHtsj7kjry/9vCzkCEUVTNP45ma5uXFw3F4ads2ggg51zZ63GX44j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014093; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VgcKxJzxIj7OnRNF4pc74g4MQ7u0mqUgccDBVjOj9TGVfp/T63c4tSwEKoVG5QP2ZHLPV3w6S+I/HFsRYBlgb9ASuChESeBRE1sVfu8tszG9SjhIbX/SeeGmg4EBquKhQu3QO2ZJMUBJcKwzUO63T0U0oI4KTaj0dBZ2sQiP06U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SBKe44l9; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SBKe44l9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNgisNUUT07LtlVBETYMehbM5MgBUskXmmfWJt64lkci3vYmpnqDRcBv6MWuTdEohPU16yqJ2bTBrRDlGkJatcCH5DqVDFxaeusn4NPO75i82V75xnQfOW+34fs5i/a9Q7htQwy87cqvZBAj5J09Bi8DzHtZRXMXmK3lGiKU7o3NsNPe7V9Z/eIs/xW8ekw7wCIYQrui5BGBti/oYabJihpyKHcowJP0xN+cmLVHCCltenO+Al+HIasatpWmZUqEOBzISp8dd9UuwEXuKhTy4SjyUTk3pmIlGx+fU+puxFyX4yGxw++wEevjJe54ZQSGgS70XvmnBTF3AZbc0MXAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=g/+YdNMf06FWhcRDzitJuL+pkeca+jE19sH0axLe19Uig/2Ai7eMeeqrLZvnVLbJU5pmdWHRuhN/z6UuFznvEC/PBYVsejV3D48Kjak/mAu/1Cac7hyJgEkmMZfTjkYEZekAuI0d2J6bhVebDc+/O7kre9/f43dD9VXRKz2yrFboZrIkzsdPSrM0QH7NdnuGSxxKKKP7vQssECEPjHaoUFcsaNP1xQWWiskG5wayCMcwztq6pOE3EsxdfDSx5FEiiQCGxNWYRS6JJVssBZcU9IiAE+Feuti3f/Hx4CVAePhXjlSJ3HGE2zP9Crfyro6ex13nm2DF6ej6siby/sZk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=SBKe44l9ecxitHBsq2/xyCyO2UY+HQjisLmnEOgIqLtFYGqh6dhUYb8hu2ETKBqkr83lTGvIcGLk5sx6OjNfJNQcC/Gu51SxpPv8m29NfJfVfqPrIKNPJ8XE2q5bg3TYWAXGPKWVTDjE2PmvB85b3Y5MP+RbDh1vcSGjyjPKAFYPTnDD/AOMWb3Z0vhp7TB11JQPYgeV8tdAq4RVg8rLMKuJ3wl01FxkvZMWManWM4j2dtjDDFMBPhqJ7C3N31rDxIPEm1+GPXYw7mxGMA+hdYX2dne9SYVcJuNTMQDk/Aqh24swsVDR3xI59agmyohOs2+adOzcXg+kKQcox5d0gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 11:01:25 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:01:25 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 06 Aug 2026 17:21:39 +0530
Subject: [PATCH v35 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-imx-se-if-v35-6-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
In-Reply-To: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786017100; l=1532;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=RS4aAMk+JEnMKPYR0jXHippDylS1PJ8J/Zx+XjCUgjMtfTuRqvWH/pDeXsr4X6sALVq+TI2JC
 leSyQHoOKQeDGyXSOvC7C/5wu8/7F5XNMCHddi2zYfhL3rdbIgj1Wbv
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 025be87a-8ca2-4c48-5903-08def3aa0ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|11063799006|56012099006|10067099003|18002099003|3023799007|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	mcn2Q3BccwZjhttydUEhotfWvCNo1PDgiYG417lwp0Se+3fMuEzZwhPiExKyMqaHXwdGFKnUKtzA2UqAiRfGhX5gGO/71PgrbEcR7few1/QQHokOz3aqSckCm8eEdlGAq6DZFl45l/qXkX1CGUJWuqnrt2B94/9nQbecg1PVqnkqliQChDZtey3Lk/cN3UXcUdW1fQ7XIQCnQ9Ka7gD2JBWRccvOp3XPsoRj3U8817LOJgCkgS8dEkK0VlaSSdfH2uvuD5F2ZWFmcCLk8z6VKqhxzKSHYTvfgWiC5xBU/fOpKEEwIHwH7H6crdgbEgXxbloBw2HPeijgfdFl5nsRSDuKINB1Xo3OHp1z8Ey0AMa64oDK9ERU2xV8du7RZEBKDiDMLlVZYyvBMZW4USpJ8YNWjgduYEY2GuRDiRhxPNt8JX+lI9qj24VH8PjqGNb3ukyiRUBnOpbAB1YFniGSgNp2bY4cU7sCwYdsskseZNMOOm2+0Tvp1itBnICMk2sMPUSQAA5M+5OBr+0qRjmbDQWZb9hl0FPfruDqJifKP1mgDIUIWpSMqJevuhcpLkjL3pQIazYB+9gfbpaqAcI3zh64G6hLR6NJlyZNVeB7AuK6nC/Icp/jUJhvH8KcxpNIdO2iZvCJui+3KXLsDfCbO7o2gOBz+k0EUnILDOXU3qBMN03t3Jxkgd31dXnUpWz9j37D7gQAzWox8ZsKc2dyyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0lCVGQ0RjdxK2c5RXZVTm9EZ1drcXlMMXJDbnUyVk1RWTVuZzJZcTNvOEtZ?=
 =?utf-8?B?a1ZjbVNwZkxOckx5WnlKNnliMFdScmNaUUlvR0cvbDJxRTJ5MDlEbDJIL0di?=
 =?utf-8?B?eWtPNzNKbGlKQU9RL3lNeTNHbVV0MlA4K25zajJJdW9PVWZIM080dExRWGR1?=
 =?utf-8?B?TldBeUUxeGZmbGZjUGszbDc4Q1ZMbExBSGI2MWx3SVdPdURTeGFnVzNlVTdO?=
 =?utf-8?B?SXF4R0l1MHNTVHhoTkpVcHVwNVFLSnJMWkF2WTlaQmFWQTJMMWVmK1czbnVz?=
 =?utf-8?B?Z0d2dkxSMUNZT3NubnNSOGdrcm44NVUrQnRkcmxLWERReWdVaWd2c1BXdDBk?=
 =?utf-8?B?VW4vL0ZETm16bTZ3Qk5jU0JGTkxEeHNydVVTaUFFTE0vTEp6bThXVzVDclFC?=
 =?utf-8?B?YURmTFFuQkpRY0xZQlVvREdjY0hBZnpOWDQyaHgyTDZTdXBidURWdTRQTFFH?=
 =?utf-8?B?UDBqSjlaeUVacmZ4M1ErRHlsWlNnd0VOcWVlMU1uT1BVSHFFNzlVYlZSLzlB?=
 =?utf-8?B?NHRpelFWWWcxdTgwNGVPZHBCc0NpZFc3a1ZTY05iS2tRY3prOVB6OHRET2pB?=
 =?utf-8?B?UkREMWJVZUorc2phM3NHRDlPTGM3ck9qOUt3cUpoRHllZGx6K1Bta1A4d3Iw?=
 =?utf-8?B?eDJ1bDU2SmpmS2RKdXEzYzVwalA2ejRWSE5uZThjTEJzcHBYS3Iycis4VHdP?=
 =?utf-8?B?UHlYOXFkeGZ0ckdGOVprMk9LOGQxT2NRS1lwS3BPT0xpY2tKbnVMQk1UMHRY?=
 =?utf-8?B?WVg4S2Rubit6NThOdWUvbW5KNmZsdENCSEdzS083Z2J4d3JzSG91WWNOYi9Q?=
 =?utf-8?B?ZnNRU2RGVHNiSzNYSE13MlN1NGZNT1BibjRBT2pjMWdNZXpsaFhLVGNqZi9O?=
 =?utf-8?B?RGpWMEw0aTM3VExReE5mb3lEYy82SXJBZngxRkkwYTdjWkNiS09wK3lLbmla?=
 =?utf-8?B?NVRhbE9pb2pHNi9FczhBL2tOZ3hiNFoxc2NxOU0yazE0WGJoM2xOS3JuY3h0?=
 =?utf-8?B?ZVplQklhajFuV25GNStQRHNvWWc1WjhKeVp3OXg3UTRNTVcrWWtieU5xSTNY?=
 =?utf-8?B?L1o4ZzFPQzlWc2pOZ0RRVGEyai9TNmZzVFFuVW9IcHhrdmZyb3NTZEJnQXd6?=
 =?utf-8?B?SmJKOFIwem1PMlR0Yk13K29RSGpMckVvdnIzK1VZR0d0dkhyd0NLTEJBNXZW?=
 =?utf-8?B?L1VXbnU1MEpaMFFmVVREb05kZTdxYVdMWEw4L2hWS1Y4SXcrUWZ2MXVwSWk0?=
 =?utf-8?B?dVU4YlErMi9iOUdXNkttUlppYnBSSnZyVjk4NExYUVlkUERtNWl3a1l6Ynor?=
 =?utf-8?B?SlZodlB4Vy82Q05KbWFsWW1XVlpxYWU5bDNMUDIrWFYvWjNReXBvM2ozcmxE?=
 =?utf-8?B?aWVjOFRYeWhWYVFwZ2hpYzlBczA5Tk81UmIrS3BUVzJLTG1VTDRWdkpiM1ZE?=
 =?utf-8?B?bURvVmcxTlZmSWZmdDhKQ01nZnBmYno4dGV2RmRHcEcwQ1FEUzdlVmpJT3Q3?=
 =?utf-8?B?dlpJNnRVcmtrZHZaUjhHczJpc3NzdC8vYmVxYWxQZ1VPL3M2elY3ZEdKSmdM?=
 =?utf-8?B?TkM0RSt2MGJiY1V1MXF5M1hOTzlvN1ZEUUQ0MS81NVVBcndDaVIxc1BQd0Iw?=
 =?utf-8?B?RDVic3FyTHcrWE5oSzMwNkxXcWVmUm5sOGNXRm05WVI3Y01yeWRhaXhmaVJo?=
 =?utf-8?B?WXNzM0RweTJsdjBKYldJL2dXVm1TaHBUTXhjalZ3eXhsV05tWXEwVUFjbzNX?=
 =?utf-8?B?eXpsWEtTSit5OXZNQ1VwdmZ4VmRuRGpkU2NRRDFrbGFXU20wOVpjb2V4S3pp?=
 =?utf-8?B?K1VrY0M3bUhtVnNuZm9oSmZjcVBXNkZKbC9WSTZvL1FicWk5ajJVWFhJYzFs?=
 =?utf-8?B?eTZDck5jYkJKeGJTeUtCSGlYZko0UHpwNm9pd2hWbUpFQ0R0ZW5KcXh6c3Fs?=
 =?utf-8?B?VzhmdXU1QW11NG92dDZ1Z2RBVVdjbDVOSyttM3libTZmbUdMMXlUZ2t0N0N6?=
 =?utf-8?B?N3RhN1RFQjNRZHZLSlpOeVhQV245SUUweUxLdXkwTm1MbWJXTytrdXo0MWJT?=
 =?utf-8?B?N0tEUnE0eVAwRGN1cTlPTFNFZnZjaG5ZRkVFdEcyUmU0dXFqSkw0Y3pseXZq?=
 =?utf-8?B?UitUdExYbitoSFUrS3ZmMUNpZGhWc2p0WnQ1Y3R5QWYrU2dCRytLL0lLcUVX?=
 =?utf-8?B?bWhYYVJPMXJpTmNtSXdWNnZIT3NoWHdLOTcrdjhDODVJRmI3WnpxQ2pPNFN6?=
 =?utf-8?B?UCtZTGI3ZHVhK3hhRXlxLzRyYzNwejcrT2xveEhwS2hWSWpWODI4YThSVi9R?=
 =?utf-8?B?Mjd4Ykl5ekRnYlNBN0t0Q2JGQ3RMTGRXaXBQSkQyOE9OamFwZW04SG8vVkRN?=
 =?utf-8?Q?gmpRmJjf0OzZhfgsLnb22EvGlH3Fv1T8f85uO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025be87a-8ca2-4c48-5903-08def3aa0ec4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:01:25.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q79SO6KJXK8SLkFZRgk3r/qbXCWsDwQafH6ezP29FwqA6UUt15Rjt/c578ssdz1u++jWRa2u99kKYTifUTShUoRGl9GK0yPkeZcjeb9Kt2EljQAncempTVrUAdgLYpUZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

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

