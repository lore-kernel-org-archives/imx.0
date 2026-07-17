Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74D3D9544
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290016; cv=fail; b=Glg0ynIGedJwl0qVDVqXRHY6JeSog+0sGs/CmqGYfqg+BAB1iNbFv8H8jNZemHjFLVoyRBKJIVzFEUU6f4EAK24xtpTCnS5UFFTzyLRnleHnLq7nYDV8toaWMlnD8iNII4MAFB1l+6M/geeBve1Vl1yszv/nJem2z3zAlvuDfyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290016; c=relaxed/simple;
	bh=rEwIz4V7Kbim2V+A7yb1sRiUGVtC0ajYed145pPqyXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ObgQr/fEr1UTirxEfq7HTk2WWG8P0onqJPb/sq8O1EwB3Kh9ONZVf2ptvzWACnESWpDLAtlg9y/Q0dTx8uGETzQfU841BgFLGsh+PKUtoTD/tRzd9LL3RL1dSL0rj85o1cXV4keu2yQARt4IbisvBG/go58D4OUNwMmxTRZB7Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UogNj0zr; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UogNj0zr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsXFPZXqjd9d9o4PwFv5lRKR9k/mJ3A6Va8j3SdzXU+2d8itf3SKfF0T9Oo1BSVe4tUPUUoD5aPm09+NzLg32vfyqayH5YsLGdvk+GymBtb4vozqYC76hNCau/WTSciLB2U4D0gKWBqEdm+tEAvX5Lkp+7d+B7dUwJFvxLNY8+EBKeS3WSWWxfQYtxDC7A3W98mJKte7JlJZrK4LNjBS/aAkHHEinZjkEH0y4bEhmWawk+4jIy6zOMIgFWrK8u+PBHpSSZdQgv+BSPfdTRFZJEQ7uWJhSjR2Y+TSjEQVTPQT7LzJ72POet/BXilESn9zR4/F3EhYTtwRp9NIrAB8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esadwtDRqjPvzbK6oeJ7VNhxcfXPaLoA0qMrKXOsIn4=;
 b=f9WQdDA0UC8mXXMTsyeLlTniYN5wwX/gwMepCg7Y0pYACgbPl2H6GZJXv6HqG4erS7yebyoUSOZsqs0mBVTwjmFJKlGiMuVpNXMqtSClTHp0WtbDeXzLUSFPe7AbnvWnWFqxGajxOyR049agFANB6dOLXMfEeaRf6ghtDlN0Un4x1+uRFdF9ivNvT5ao78OAUdmI2Q8YtY/sPt3t8bPtXO6uFZuN9aUUHi8C+NU3Os9wOe4t897Rpk3TuUodkWixHKIEKKWuRQOcpglojRvpZHBf4I+niYRUJHuYzMGWiJH/mB6qOJz52JjRMUCJVrt2L/tHzuCKWHRuC+Gkfgd0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esadwtDRqjPvzbK6oeJ7VNhxcfXPaLoA0qMrKXOsIn4=;
 b=UogNj0zrq3uv+2dfW/vFEPbxW91PkyC8G/FVuDJD1y/0eYbOffA6TwtqNoH6IkIiIiFnQyXvIV69C4QWFcgF+5h51cKLguIX7muvbZO+HaoRXuLNwyTKvUWSaAieulw6Ew/AzAk7QaOh2P3RTXeSHL3h3OuTJWdVC08fRtamEHndwvRa++L3tFfB8ZSqmtTZuD3K3GgnZHykw1M/BRpTM+vxdLTaAjxoqQGAsNsqPcn/RDO+hkEnrgQlt/YV7OZEwglKP11lvmd7d7TPxEeOLnPZRCF7i/tpFBTBVKot+Pv1b850UO7tuT0Poov/D7e4OKeEGl8PpDGxB+i7ySbzng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:51 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:51 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 02/11] arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
Date: Fri, 17 Jul 2026 15:06:26 +0300
Message-Id: <20260717120635.2118610-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::8) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdf7b5d-3102-4bf0-99f3-08dee3fbe2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6d1auUTvtCyyxnscsG5cG/ebMBKvhr3yls+Vv4BpCIkyHBg+iimznAQSVSRgvc+YFiw4mIEdlQqCRLEvkvcK02Z1nANt2kYq8wYkz9azvhBbD0SNoPMbnjegfemaEMr7fFJfotcjG1619hPWtS4QLn/eY+K3tf5es9vD7kXvqXVfR4tml9OUsJG4+iltPs0NXec0rpz1oromQ4QxbXkVz5XRIMGOtwjdTTwNxQn0+xjFiQxNPk4X6QTAnnkHPzmnyrcEY4T1FLKY5RXaCR4ZkJLq+molky7rBV8ySIxG1CLM+2c0HoFVv2vjKplw8FYaSMYvgRMB5J7ulPuAPdGR5bwQ2dzqOh5Or8Q58n1AC9+K22jH6AIvMfjGrfyjPtBKcDl1Z3fmtfF2725l7GXcyFmQDCmZWbxroK5E9WxlGZfz8g05WjS02WigP2BX/7KPzrmZwjuthsaoMspv9dgGwo1gRiGAppssXgJPgxqX8JSyvUrxVtt/f8pMWWFpkbD5pkmjZi/5jt57J3BU1PrUzn8tXwYHzRPpknBnU69FSH5ElRLDx422Da0q8hn5FqK9SfHIomwCHFp3Q2f2dbBgdCmB0sdsdXIMjpxXPyQSHflZhEcxgQsr/X/PoQ1OeC72InQAI2CEdTdtlW9NY8Sy8wL1aPSfoKa0aXMBIrf/MRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9jog7Gj+638aYJ+fSBERt7JHJGpXtDcIdE7NTYZcmY+MNjvDFiCIhl5Ywiep?=
 =?us-ascii?Q?Sei+M+Hhcz6SskKTB6RbtIGj03kWUeHEfYWPWzarTybDNXySYUIEKw+90tz7?=
 =?us-ascii?Q?XtKqMNz6zB3zhJDmXuM3lZ2P7FOuyiX1gYhhPZ4OxpYOwfxrd0SpCYR7dBE0?=
 =?us-ascii?Q?ihPaNUWA8kuKvZj3OlD5joRuXRuf8ttqffECu0XN76/pO3xnXTlVQ3OCallW?=
 =?us-ascii?Q?xkVkd+o7vhWW6cFN+ZWwu/hQ7n2P/QVkT/u2OA4IAUZTy0PHhvfEkmg0cbE8?=
 =?us-ascii?Q?2cTn39MACHDi7fDg9AzpKjbUlM46HJVdbOC7+2vPwnRch3Y53Xu6qZa9pEjE?=
 =?us-ascii?Q?DjBaA2wZdwrymyKP8JdgmsUaoGzri9K2ox7Yu2564xMxgDVZQus384tpsWgU?=
 =?us-ascii?Q?G0fo3qz98rkZFLSrIhFDaEgrp1j4maFgPlgbLsB/0Dk9YT/YhzPIAqC4lsND?=
 =?us-ascii?Q?HLQqVbHt+aEe7ljnJ7n6c8oIoGzJWZnu5A2iVyiih+GE3goHxSba52av9WKG?=
 =?us-ascii?Q?dzdKsMBupXov4NWCWHtoW02TdNMsWTK4Q4df6Ih6uFav6033Zjhifnd/GeSz?=
 =?us-ascii?Q?W7j1hHXFHdnwB/hblj59hPr2yo9WdebtbJCX5DkThD7FcZJkOwfO2eQ+RBqW?=
 =?us-ascii?Q?64lcm/C+ffrfy3gaQ1ED0lSonn2+ctsytORhcq360WNC5i1DHolWJmezD8Rl?=
 =?us-ascii?Q?LEDR7uZTymDT5C1e8q2CCxxzWsIwPC3g7vRBghLmBI5aRU36EyuFF4CLsSU8?=
 =?us-ascii?Q?FniB02g4VsnT0NcbR/FKg97rgxJJ6x92NthoUMpkodIv6C8F5fmRpGrj5Mlq?=
 =?us-ascii?Q?H0srNzNQaLTKoJep13eRH5tmPRIrI1Bcq8fEwrQUkHXjmX+CeyNdQC2sErD9?=
 =?us-ascii?Q?GeGHLFbleLHOAi1H8YhTIC+xArojZQjPEN/mp0H0APR2C/+MT1zu7xDvLzj9?=
 =?us-ascii?Q?OAijwMeipW860OkXvgn+c9zfS/4etU4f2UmgFEvL5LBMD49UAIfihZ8nQXm8?=
 =?us-ascii?Q?OhyVrQGLE1Iv4WaUnOC1+XoYhIeIw7gV2rPSa0Rb1M/BRuLJEFScNBE8nlC/?=
 =?us-ascii?Q?GManh//D2npZqAvjtt01zwJWdOJ8mzqn4UgKG70REEJkvioLP4/ndHRlQoaC?=
 =?us-ascii?Q?/ja7IwxH3WdGVvaYPEghuFnGzsclJhnIH08VVtB8/k8XCRqcxoZ549tibNlY?=
 =?us-ascii?Q?OFIQFXy53ySVw3fJTXWuMqKrK+mFoJNt6GvNNFzBTR+19y4jCDFAIZSwu1xG?=
 =?us-ascii?Q?gIw8lTdMDJpT3oheRIMhT43nBPX1G9E0QsrvB/37cdaKNkNJATaAJz0Ibzkc?=
 =?us-ascii?Q?nM3S1iic1slmGtuG0wV36s/Dk6dSvDOZ6rx1IOazLDIvVlBjjIteV+VRS0CG?=
 =?us-ascii?Q?xxIxmawpn0cGlIkfDFc2eS9IFt7X7y3bhPAH/3RVCcSIpAkpwQOR3Dxwvsls?=
 =?us-ascii?Q?2zzxJz6hZFaTH0nwyfBcXvUWey/WR28F0OX6EmdELSmcN89wS3bFZB9yNvJE?=
 =?us-ascii?Q?aZ5ZGOzvVuNZdqQc7uXQh2lsE5xRg3kMtZAQTa/xVCIJA8G65qvsdONZDNO9?=
 =?us-ascii?Q?vb2mMHqnM9EyoRbgRfhex8FZKS9xdyn4+T/2HRz7HiNe0u21rLPrqW//HINB?=
 =?us-ascii?Q?cneiEfwpogkoojOvCNyVFrOJt+9Ei4sqjkF89ixdrO+Usqsp/CFnjVTHqOQo?=
 =?us-ascii?Q?wULCm/x64crUTWWdOTuLPCbXOjpD4DXwsegYTcxp82MgdduTFvHO6ct6vhVd?=
 =?us-ascii?Q?T0hVev8bow=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdf7b5d-3102-4bf0-99f3-08dee3fbe2b8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:51.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MtyVDo7vNXrC99V9i4zwdd39nSujUXmgueNxwi368SZEcy5e/v9LBm1uwjnDWJhLxPiJNDaTGRGt7STScmgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

One of the major differences between LX2160A Rev1 and Rev2 is the PCIe
controller used. With the final goal of removing any usage of
delete-node or delete-property from the current LX2160A related dts
files, move the PCIe nodes found on the LX2160A Rev1 into a separate
dtsi file. This will make it easier to include the appropriate dtsi
file describing the PCIe controller depending on the SoC revision in a
follow-up patch.

No actual change in the DT nodes found in the final DTBs is intended.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- New patch
---
 .../dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi  | 176 ++++++++++++++++++
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 170 +----------------
 2 files changed, 178 insertions(+), 168 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi
new file mode 100644
index 000000000000..871f5d5d8f75
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file describing the PCIe Mobiveil's GPEX 4.0 IP
+// found on LX2160A Rev1
+//
+// Copyright 2026 NXP
+
+&soc {
+	pcie1: pcie@3400000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03400000 0x0 0x00100000>, /* controller registers */
+		      <0x80 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <8>;
+		ppio-wins = <8>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
+	pcie2: pcie@3500000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03500000 0x0 0x00100000>, /* controller registers */
+		      <0x88 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <8>;
+		ppio-wins = <8>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
+	pcie3: pcie@3600000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03600000 0x0 0x00100000>, /* controller registers */
+		      <0x90 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <256>;
+		ppio-wins = <24>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
+	pcie4: pcie@3700000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03700000 0x0 0x00100000>, /* controller registers */
+		      <0x98 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <8>;
+		ppio-wins = <8>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
+	pcie5: pcie@3800000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03800000 0x0 0x00100000>, /* controller registers */
+		      <0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <256>;
+		ppio-wins = <24>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+
+	pcie6: pcie@3900000 {
+		compatible = "fsl,lx2160a-pcie";
+		reg = <0x00 0x03900000 0x0 0x00100000>, /* controller registers */
+		      <0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
+		reg-names = "csr_axi_slave", "config_axi_slave";
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
+			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+		interrupt-names = "aer", "pme", "intr";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		dma-coherent;
+		apio-wins = <8>;
+		ppio-wins = <8>;
+		bus-range = <0x0 0xff>;
+		ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+		msi-parent = <&its 0>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 2 &gic 0 0 GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 3 &gic 0 0 GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0000 0 0 4 &gic 0 0 GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+		iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d73abffa6b7..387cd677cdc7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1177,174 +1177,6 @@ sata3: sata@3230000 {
 			status = "disabled";
 		};
 
-		pcie1: pcie@3400000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03400000 0x0 0x00100000>, /* controller registers */
-			      <0x80 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <8>;
-			ppio-wins = <8>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
-		pcie2: pcie@3500000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03500000 0x0 0x00100000>, /* controller registers */
-			      <0x88 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <8>;
-			ppio-wins = <8>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
-		pcie3: pcie@3600000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03600000 0x0 0x00100000>, /* controller registers */
-			      <0x90 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <256>;
-			ppio-wins = <24>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
-		pcie4: pcie@3700000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03700000 0x0 0x00100000>, /* controller registers */
-			      <0x98 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <8>;
-			ppio-wins = <8>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
-		pcie5: pcie@3800000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03800000 0x0 0x00100000>, /* controller registers */
-			      <0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <256>;
-			ppio-wins = <24>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
-		pcie6: pcie@3900000 {
-			compatible = "fsl,lx2160a-pcie";
-			reg = <0x00 0x03900000 0x0 0x00100000>, /* controller registers */
-			      <0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
-			reg-names = "csr_axi_slave", "config_axi_slave";
-			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
-				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
-				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
-			interrupt-names = "aer", "pme", "intr";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			device_type = "pci";
-			dma-coherent;
-			apio-wins = <8>;
-			ppio-wins = <8>;
-			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&its 0>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 2 &gic 0 0 GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 3 &gic 0 0 GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-					<0000 0 0 4 &gic 0 0 GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			iommu-map = <0 &smmu 0 1>; /* Fixed-up by bootloader */
-			status = "disabled";
-		};
-
 		smmu: iommu@5000000 {
 			compatible = "arm,mmu-500";
 			reg = <0 0x5000000 0 0x800000>;
@@ -2021,3 +1853,5 @@ optee: optee {
 		};
 	};
 };
+
+#include "fsl-lx2160a-pcie-mbvl.dtsi"
-- 
2.25.1

