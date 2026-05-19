Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728BA3B27F4
	for <imx@lists.linux.dev>; Tue, 19 May 2026 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174021; cv=fail; b=fJKiWJxeVkIA4a3OCgJQiVAxbhB1eaQpNT99oLIL+M8HZb4v9A9U3N/aeJljz8d5mCBA2S/uHW4g+zfFHds/PjfH/WXcWV7Q12pAeiw8UyogGJNk4CnTBqMh5duDjqs1/6A+WUefpVPoJ1ccKSGwOShQ0Jk1Pf6Zq+w4PWmmjxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174021; c=relaxed/simple;
	bh=p0sn3X7C7SYtrh0BuxUP1Z0XjvsDmjk7IzD82E0sdfk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=REGfCBBYVjOPoyxNod+bfa+2nN38GHE63LB35hADCOOAJN+Vguy+4fljBe6irA7qhaDpDUOkmg7meoLp3u/yeOS62PcD1q2ftKn1UmCrS/yyYNh0wkck64okUMXO+gdx71itIvcUcGq3FJl6t8bQtNerWWBgiY5J8KrrXBRVNMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cjFrOguG; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cjFrOguG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4WTyzL2KyUf3G1f6p94x8lDH2PBNJxn641wBRGfgTr953pFjSaQJmjOy7JYeXX+w+nJfBtvu4J0aOziCVuDCcYBzBMh0vQpggi8nw5eSU5+k3hMuurPHtIl+Mo5s98o3nKr5IpySHVISWz4UWs3TFACv8/8dN3ogILwMsOpqrsJ2bso/npuPDRkohp+yIZT6se6Xa0694iVd2ruQume+3p2s9qJohVfI5Q+HfZCzp7JaE3uAaZppGivO7RrCD3hUyx2LxpORJaZloLQIOTSeN6xvk75rQvYGuU85Rmb3bTDRHZSXzgScsTDNPY9/ytH8A94OIcphyy8s3a/X8kz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va0iJQ3QkztTydIHP6G79UQcuYZ9DLCUZfSNk2pPJs0=;
 b=oSc3ntLG/9bwTF0b/RHFgn6J67w1ns2GGn/Xd20YKWZtRCdR2Y39Hau5zG7aRVeKtHyPl9Xif1/Q/8+BpFq+valfgaFMZ7M9UY+SJdm5IyE9d/3BkfyXLOp0z+WW8ZkcKdW07BHvgilgwZmFdyl9OAiH0Fp/A0zdrgktZ2PbiutZin1js3C+9vSfIMQIluk3MJcMo94tqYepprVMKx2pntM25DkzFYzGjO2xl8pUPRPc7o7h7gJkW3OKrUjQRzsza25IlDU6CW8paqLJEhZYqlme7xyWwggf7DAoLm/j5m/8AL0iFRUj6souaOl+HxT9RS3BS9+s6ehHDXDeNJ1P0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va0iJQ3QkztTydIHP6G79UQcuYZ9DLCUZfSNk2pPJs0=;
 b=cjFrOguG3uvVSs6VflfQeg1W5DEaUs66QPlAPeDuDovdWwfbJCMjaFTOdw0kVFP6QPteV3ukM5BUxt6z4G3kDUxlV2C+hRxSkAVa0zVd1xde2PLv2p/K7m6DRRsQ3Wm2XSB3rjqTAVvbJf5MtRjjxBPS8gfp+hWMBeQwGXNLzlztbP2CNmSkMEQ3y6asZQwev4evW8zsfMnWN4CWsvx8GZBauuFG+8UPCV8yFG/bv79aQVIJTc7aFpjoMzJUO5RE+wg7HLCc8wX1bgF4AUFphjTZdMr9cAKRucrngf4bqrnb97jtijUdSkIvG0tOU1e51bENtOjb9DRD8OeCbfew/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DU0PR04MB9273.eurprd04.prod.outlook.com
 (2603:10a6:10:354::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 07:00:15 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 07:00:15 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v6] arm64: dts: imx95: Correct PCIe outbound address space configuration
Date: Tue, 19 May 2026 15:02:23 +0800
Message-Id: <20260519070223.361106-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::6) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DU0PR04MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: da4e66d9-c899-42e4-bca7-08deb5744721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	UUXkEpjClb4QqQruMKk2sF0r7wai0P5I/r6U1AmD9q5AC5cWn83EXD97qBSYnpG/kWUt3MWaZoHRJkrydX16zi6ArsE0K6wQ5DGDcd9rgPjCAZW74h02umU2PQ9gfhoJTs+/m3f2ktV64U9D5fU5AlalBENvqQUFRIFvdfu2+DmQ5JxGoDg8kqQLCnxudPg024jdRKzhSQg3IOnU03/sTkAnIGbztXS6i5Y2wheLydII/Bzd25BwLJ0ro+w5rqD0aErz4MYt9R+jSMiLSP/fTPj75ev9fiOY2/kONo+d46Vj3QvND3GAV3jyRf0O3KdIThupAZ1M5z+mr9oPfpkNDMCMbi415o0ARvYWzXBn8DnoQqBzXyvb/ojXI+UrUPZuZr4tm0kKojqEcTdGENBdSG/9z1xHN39xirtlbhhgI6KAbgcsVHtwHE5q89yvKrmMYTyt2V7IUgn8Paenjp2jCmJtoEgsCzvO93nYgDjSJMBF30AIVv9QuVb6QJmriSQCip8/Lg5Z50J5GpYJOcYs4g/5X/U2Tlq81FS0Wf0nws+y2wx0gdMdJDy8xLVZk4AszEOpCbdDY+8gPExFN+JtNuxMZR9nBlm7wuAenRS5xlQD8Tb7x3waizP/eEmrfmlPPsoeuSlMRtDdQOPKwtWIOfGqM18hM5FeZJmPnfTIFdtZDAgSQiwZwbDjycwKNmCh+GMfdUYGVBjCsFOTnbQFA165hRahAvNmqCHbfy+WMPpP1OoFbCiaSsKQoOXxZ52j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?urZmM+ly6yO84sBZdvVuPKJVPdAafTp5QsWB8pSUrbLZaK3tRcUIcqx7CZd+?=
 =?us-ascii?Q?5G5ACZsEeMOeA5AwOSs97OcO9NNdPslKS1DTsnsDkAdfjxL/YCowj9/zOSql?=
 =?us-ascii?Q?D5xyrkVCP2eggE62iLPDbNR/4J9fPI+ethukSbPIoRcBmb5czTFYx8BBLO5L?=
 =?us-ascii?Q?gr29PsBZtuTrK4gqubS6TckiD0h5lZzIDmON+s/osAPe7w0HkPK9kj9tmx8j?=
 =?us-ascii?Q?dSYVqnkkXIwGY2kc1D12OgNMrvSbwxdUuJxlqK73E8A/50oM0UFJumK+qvhM?=
 =?us-ascii?Q?dtB+5MegtWP2l890KXbbHK+Yzazbe/tXCLVuOYF7/aORmHOTQ8bDV/9U9woG?=
 =?us-ascii?Q?9G9I8lIOHTb8MgnUwK9BPYb1RzKiHU8lR84+/MsQSLUJJDyH5mwsD9vKyJuJ?=
 =?us-ascii?Q?KMSnAbx56lPDIwU+XrbBIoeW+IvGd6h/cu7X46QCwH3bT2rNj6w8jGxGAdrK?=
 =?us-ascii?Q?OlLsNN07xo7cCbi2kp1UohuDMq6BjYuY97AUX5u6XaAF1g7Gf2imFALhXKQF?=
 =?us-ascii?Q?SR+U8Op8G89cDwH9U3hGMilr+IPtz1YvqXUVZktFFPtdOz4wmQ+ebxiI/LbT?=
 =?us-ascii?Q?I31OCAJNehOEbZR7F1f6CmblYJmUGXno1yPaKQjTciJBMQA80Ra0mumL3Sm7?=
 =?us-ascii?Q?ZZ++BNqSVdfbQHJeugUDVksVsg8dXTEFpIXOL1IF4Micc0Uuiml2KtGkYF/t?=
 =?us-ascii?Q?tTwqA13UGlMn0ox+LMuHHVF046w2+cWBU3tPZQdxkdn4qjEum/COe7gDaelp?=
 =?us-ascii?Q?t+cNzNlWUqpE1EHQwko70QyzXrB+LZOlw8SqXikc3UjOsC8xWilIupVdw/zf?=
 =?us-ascii?Q?zn5wf6u7Wjyr6pUt2ZpGZ1gVZKbx56AlAiZTgYY3kSZxAQHDALuGaAsNoCDy?=
 =?us-ascii?Q?lfegKJGkon6mekYXWftfzD2ESHaMNyqcsvHu3uPv3xJq1/lZ0xSkJVYxz2zK?=
 =?us-ascii?Q?HyNtIWftoHo3cPxk0RAXt0zsVTAb3wZv/sj62jauSxanpnoqTGI1gsIvNEnC?=
 =?us-ascii?Q?Zm/h/cBt0lwTuivB+MnvTFKDr8xOWTHsF5RI3gTexRf2WRf1nmCfcCO5EAM/?=
 =?us-ascii?Q?wynPEkfxEx9YqacrjIQ2uUmy3aGU4SiA+rwrfFbHrPcyjM/tnEKvcT4ZDrdy?=
 =?us-ascii?Q?S4ZIZ+xvvAkPa1/TR0YG90LbxAHf3MxSjQXwHycD7T+0OIxnN/FyAVP0cYRZ?=
 =?us-ascii?Q?RwBH01Cv6i2kVulucyFFGALVJG6DoFNjVRrQDPiAfrExM5cuhce2aXGIvgdf?=
 =?us-ascii?Q?n57hcZjuBmSONutpT7OARak7as+/XdqEW/EweysCxXv1txxL3624buFBxxAN?=
 =?us-ascii?Q?zrcFkBk3guqEsqS2Ivw6Yxo/enCXmuzqBDfOrQDehn5R4F+Qq6Kzek4oQe2r?=
 =?us-ascii?Q?KFXrxlby9ludFQ7B7PWklTywOzAeBoyZpS30u6v95R32qZM5KuWBqO8RGDDJ?=
 =?us-ascii?Q?oluSyy4ueN5X3P9FotpeMCpcyMqyjLIRyegQ3plXtT20znHyzA7O5+IK324e?=
 =?us-ascii?Q?A8BKjRoBN8EsXBoglaSoeLFwwBMD0M6I6ifL/o3tReYPcIiYIoumuaugbAUV?=
 =?us-ascii?Q?fJI3OfXJAZ2vLbVh4HUk4tiQzd0V/q+rhiF0ONm1zJ41BXOWwgKfD4rVkTAl?=
 =?us-ascii?Q?XGnCIC07AbeNi4sEgcioSYi1NAEHLg+oMs1FMCgUl8yIH42As3hqscs/A+Ax?=
 =?us-ascii?Q?QO4hRkNVuuBxEtgGTLJSag56s4413wkqdJmeBZAkZYf6Vmeibzd9WZ07oY7g?=
 =?us-ascii?Q?VzvrPERHoQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4e66d9-c899-42e4-bca7-08deb5744721
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:00:15.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9m9zQgwGK45PUgK04hcUtOrJuU0BvgofpHim0eoCoiLGmhaayAy1RGSp6/Jhcgv6LJrwQ4qsgqz0LRb8j/q4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9273

Fix the PCIe outbound memory ranges for both pcie0 and pcie1
controllers on i.MX95.

The memory window size was incorrectly set to 256MB during initial
bring-up, but the hardware supports up to 4GB of outbound address space
per controller. Expand the memory region from 256MB (0x10000000) to
~3840MB (0xf0000000), starting at the base of each controller's
assigned CPU address range (0x9_00000000 for pcie0, 0xa_00000000 for
pcie1).

Additionally, ECAM cannot be mapped as I/O space. Use a memory region
to map the I/O space instead, and relocate the 1MB I/O region to
immediately follow the memory region at offset 0xf0000000 within each
window.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
Changes in v6:
- Set the PCI I/O bus address starting at 0x0000_0000, while keeping the
CPU-side mapping at 0x9_f000_0000.

Changes in v5:
- Expand the outbound address space from 256MB to 3840MB, starting at the
base of each controller's assigned CPU address range.
- Use a memory region to map the I/O space.

Changes in v4:
Update the flag from 0x82000000 to 0x83000000 to declare a 64-bit PCI space.

Changes in v3:
Update the commit message, and set the region size to the max hardware-supported memory space 4G.

Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696..18eeb6286db7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1939,8 +1939,8 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c360000 0 0x10000>,
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+			ranges = <0x82000000 0x0 0x00000000 0x9 0x00000000 0x0 0xf0000000>,
+				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2014,8 +2014,8 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3e0000 0 0x10000>,
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+			ranges = <0x82000000 0x0 0x00000000 0xa 0x00000000 0x0 0xf0000000>,
+				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-- 
2.37.1

