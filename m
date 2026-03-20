Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A87280CFC
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997356; cv=fail; b=ePF24LTsr2qgJsHrnQmev/jVnhRW8eC7fBqCcM1F1aOKxnT9qlMgcov52+/ElIYY4xppLAVqJ8DtYqzgW9Y6+IZ5hFkstjRbGjLW85Tor4YxCtAciO5aq5Ge+jTVA8fZzZrhju8Wo1ElElHQ8+a3rZ2TuGe933be1oE1NGk9g4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997356; c=relaxed/simple;
	bh=lVmJxQ3JpofmwQdM7rWZSltdmSwclylpLpxG5a2br7E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CLHOuYn7p1YikK9EoFv9FbSjOknR8B4YIwZJhNEIjCGv2WzBepodtA0LObSsAHh6duGp3NhL5XMd4JSwrNrSJOx5gIgmza5/++BRz5nYggbVndo5PMkeq60p+KpbEzBJLQHxJiqV+VgRrPRUxGvGhPMcPrDYWI5rOZJuzQAmlsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cG6/tsnZ; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cG6/tsnZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHDF1aYlqMjd6Kyw0WRJCQDRwrndoE91sl27k5Rfo5pzZEkBj74X70xi+2f8s2aVKLRlcBrEStfs9Kx79RRSVPsPdqABP97e2hgzINOkbUaLtpxHoE8sb7qx8FndMo0xWQTQ061/GmdefVCwdSWnqz5NujwSW+B8U8DHis5s/Zi1cH3Www2A+ZbTUdLu1s+VSwBpE3FaFaUm2YfaK1B+b+KPD32tRdJirjkCvD6gldTyCXEN/q8HXZ7JEbGpePKfrT7gHpM5Y3M50MQZ7zuM6bluqxekGdiIluFxz9m8w/9VNNkGaO5vGNxaWpr5Sf8GmT9AHxZwpATf4W4DfNBnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDyoDZPgupWuqSHPZkR65QkAEOI/30zeYbV1NGkuWFQ=;
 b=DuWxJ8lTISZPXiXgL1FoWse2q3X9LOOVf44WyFeTKW2GWnfdiH80zAdrj0K467fCe36tFED9GfcjNqK//xH3ofvOQbPdcKDpWVvOvCmowF2x2pCB0Rd6kmYdxe7hnGsth3RMAr8DrvW2mioVE7W6kB+lM76kMf+A9vRpbxe1iSGb0T9wf2v6D8IVVd+LNv1F2mhIhCPhgKdRiOYBB3tb1d1AfZqRnplUTT2ycV80PVPu1UeXgQQPlA9aG0l3fPN7sQHIvpseSeSTx73joxFKV118edzNK+LTu43793WoXYL1WYGQO9ejvpPAy3gxXYy/zwK9BklVxFQjd8yXTRiDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDyoDZPgupWuqSHPZkR65QkAEOI/30zeYbV1NGkuWFQ=;
 b=cG6/tsnZrA6CEW3eNJzQgeeraUAhbLrhnf4ahtv13Fy7Ez6FwHoc9SoRiRGIZT9rG0oDx7NDDWsdR8XgW4S09m1dSmL18yRTot4nuDRxUKes6GKPYNRVnMbULbUZhSCR2lhmI1B7uqnYglIBwy9IfjEBvTHScE/xP0AmLrKezONc42VsEaY7nD7yt79oVPMEPTU0iEXoBdwAL2dxmSle3UVrng9FFx7SvU/yvPP4LmFCMm9mNERV1Q2nABeoNyHmcjWMxNsBS2tSeoVlVvI9m3qIZ1K2Vlj8UF/GYr/ZfrqMSG9gttAIg2JLo5B5JW0gCTbkXSpBsrCvS8QOOcUSbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8964.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 09:02:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 09:02:31 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
Date: Fri, 20 Mar 2026 17:03:53 +0800
Message-Id: <20260320090353.1483418-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS8PR04MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: e2123427-6c33-45af-54e6-08de865f6b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4S5l+WcBlXvXLY8dO4UbVA3d+jvu0sYYQ/vqYmfcXOWJkmH6Nu5gBq4Rpdbt/AhVZfyjSVj+EeokpCKRnNb5vzPmm+cou1HMmQZ/Fwe1AFa/nht+2K9o3WIexXBMXR9hDJKX81iTHg+Dihaqg79e967gp6N60GNW+XDI2bIt8gsOV8X2kUhXAoYR3S/DEEGAmkA70wlEugvJj368B2PoTD7eZK7pwak+A83rgUFW4uFPLOpY0p45RA2htmprX4QEKQcGj09G3v1PmmaHLa3Qyq7E5i8/LAQvaFpnO8Q5Lxfk051ij4o6bYL/mnyzHX5Sq9ZbugCcPG/HvOk8KLR1cVy9JNzCZBUG2R5SkmcGdfT/RaJOtwQFhGjb5HFAko1hlOK2bGPBHHptWwLwEWssvMv0GVqkXu007NywbrrucHdApUgaI8nWEiJtrtMpNM7HdIhManw0GenP+lDJKFrSiikeuiiPjqThOa6oSWoGvXPjqc7wkeZtRSiFnFLocTD2U/PGk6jbLgIr8/VAs8PdBiq0y/PQf0JbGlAYD8ddJMA2EnWJsV8C2UlingJKrLgc+LcGR8dyIZCOHZ/NQR5kAwYiS3hI/3YF7zKjvXquHSepLCTKrGbPsQF26fsmne8G/bmtNEQcns52snxfkqXtvcJXFCQCqRG/bJv9ufWG8wLAotubYi4Ct0B1awQ5IdXoPk/OJSnPf/gDLHJdfBkEPCX8uv0QgGrXyoE0QKlQBb8p2F6m00D4RrxHUmAoXB+qXld9yCzJFq78uuxZXl1BhT+haSUQOxo3iwGfrFyXPYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?beDQG4jiLCfdPWB8oOte5qwz5LLrR+eKzDLrBw9L/YpuAOmmo4ljvPIi4Rdx?=
 =?us-ascii?Q?wM3E9L+Y2xkf1rXeWtAyN388LX7ln3TqubIota/pa/vX7L1EMLQ5IosinfVW?=
 =?us-ascii?Q?mkQbcglnQaA3tBmGd45KESGwKAzFa4z/2ZoVJ8vLoVxhJ5Ps6cOVJD3CAoXf?=
 =?us-ascii?Q?mg6csDYTwwOear9xBeHkCvSznpfiHuj0GKEjoAoHb8jN1OTMRjf5lMBc4h0A?=
 =?us-ascii?Q?SbmjeBP75n7LOl3A4O1eha/BIVRuCdLmBZQJ/iFTGKxhiHLQjMcfniBRd3HX?=
 =?us-ascii?Q?7jTFrn+3/phc7Fkah/92Toi5MkkqUvRs40/kyaKjECWqKs2DmOZxgjA5YGKU?=
 =?us-ascii?Q?VCP3bz6ZQCk7Zrq9bwq40mkKiHHtCv6nAmBQJb7rPAd4Er9tqMcxiYgl9Jw6?=
 =?us-ascii?Q?gl0eVu/tWo0aybddyesmWAEXtx8wei/Rk46TR0WofnYuBI6TLWJz05hJp4YG?=
 =?us-ascii?Q?0Qx1dBmhbH1LqQtCZr0bfa97fp6ZM81DQZf80ECDHBza7Z/bnen3LbD27V92?=
 =?us-ascii?Q?ZTL2iUKSSy6iL4FbiZcd8+vvDwaOWnu2HWbHNBQog0ntv50+htFmPWK/UCrB?=
 =?us-ascii?Q?Dp4gIHO5gEwtQHfuyd5HY52o2Hbs6LwX9NvlSmRmyKvtX1a7KvUACtBV1vtS?=
 =?us-ascii?Q?gqrZ/pE1Gt581Q/alMgsO1xe59e+fIaPGzG8DrapElMOOO9O7hwYoCnjNf1G?=
 =?us-ascii?Q?uIC/BbQ8Zt8FIZSS4LfXhwkD3m0bqxFTMyk6moKMyNaz1nT4pMWLMAvFDaud?=
 =?us-ascii?Q?D+bz5GyGKjLfIyAqsCchr6uZ0sTdsHBEPRgbg7gHE31XKenIWEqvKp6PwKC9?=
 =?us-ascii?Q?CeUTB7VA25KnZfHBAz6Bu/HMjtBdeo8d+EkwggGrz8eYG04uazsLROc1wvY2?=
 =?us-ascii?Q?OdrWfft6ubqYgWla2bNFwl4rR9Rx2AUIX+lzH4pHXXDRpLeEBx1UX1KtJOsM?=
 =?us-ascii?Q?kL+ubJAfNocAa8azkNyT5dGrwcVd9jpJ5BMpdM4DlE3HqGMMX1bLjLvGgIAd?=
 =?us-ascii?Q?7XVedPl9lUFBG4ovDM/wXdzdEOXWl869MTisUlgTTxioBWlVqzefKpU4c148?=
 =?us-ascii?Q?xufH1BWhznXU6KNMO8JXhszdXl4r266AllV5Akw4/sgSw/oViaSYVpmrd3oJ?=
 =?us-ascii?Q?11l1EL23AqC3hS3taUj47OtNVeq876omOQmc6I+N2+nCRxzQiPNrt7xArZl/?=
 =?us-ascii?Q?PjPD52G/IwrsoC2ChSIKXxZP/zpyu7MHmScAmZlNrWwUoCcqhBBvahW6/5WR?=
 =?us-ascii?Q?MlAmhRG4hBPdv1bRanl4XLzAmy4iPqRr8A7ztWB2JU1GNJUO8iclPQmlWUvU?=
 =?us-ascii?Q?uql0P1ec8M9JlpPrUFf/ZeUlE0XR1nlHlolQnSu1CFbtvGgX4clBzKiCmezm?=
 =?us-ascii?Q?d3zbL//J4Ip7cEZYH9Snr1fNC3tXdA4/+oFym6IePCFDPqplr+bkXST3HmQn?=
 =?us-ascii?Q?wzLaGpmtVRLRCPsnrxq9NFARSrq1DtmACIFSGfTWumHGBPwxQmvmMs+L45EZ?=
 =?us-ascii?Q?i0BpOh0P/e9S//HoHhu9RNjQDHxK6QXMH5+pXHwJU38cHkWEirqTatnFCjmt?=
 =?us-ascii?Q?YDRqFnh+H4Z5EVf1jSou1glQSeZQjhVf5dQLmhlc0kGyMjw9izQkFWShA4DU?=
 =?us-ascii?Q?lbyDxM6mqs3QXxw5Tm4SBQs8a06AfbrqsgMthaj7bzQam6iB58FpyLArb1Rw?=
 =?us-ascii?Q?Qf1rLYZ5m+2dImpBQg4/2grXQlWG5td4dwNVD+msNKcV3NHqekEYrfJ88M4p?=
 =?us-ascii?Q?CJtg2Zrz3w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2123427-6c33-45af-54e6-08de865f6b75
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:02:31.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qhjuef7VkUI/eEqUCm36FXQMCmeq7dKYtxue0o8BJPD0W/d+ACOkCmK4WN+wrxLHuSBTfMaN8tOottUzh2Qslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964

Disable the PCIe bus in the default device tree to avoid shared
regulator conflicts between SDIO and PCIe buses. The non-deterministic
probe order between these two buses can break the PCIe initialization
sequence, causing PCIe devices to fail detection intermittently.

On i.MX8MP EVK board, the M.2 connector is physically wired to both
USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
enable the SDIO WiFi in the default imx8mp-evk.dts, and provide a
separate device tree overlay (imx8mp-evk-pcie.dtso) to enable the PCIe
bus when needed.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Chanegs in V2:
1. Improve the commit message to clarify SDIO WiFi is the out-of-box module on
   i.MX8MP EVK board.
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
 .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
 3 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 780682258e71..107ca270ef32 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
+imx8mp-evk-pcie-dtbs := imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
new file mode 100644
index 000000000000..4f6546d442bf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..f09335e6388d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -763,7 +763,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	clocks = <&pcie0_refclk>;
 	clock-names = "ref";
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0 {
@@ -773,7 +773,7 @@ &pcie0 {
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
-- 
2.37.1

