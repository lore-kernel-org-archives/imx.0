Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02531E825
	for <imx@lists.linux.dev>; Tue, 19 May 2026 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169063; cv=fail; b=cnPKaptoJzQDdHWtvsyFg2foW+ME6wVgp7ZfBD7OqLIaETRnL6Hm1ui2yjBeGnxFPYp6OCE0hjeB1OThiRP6o8LsaYDzGi9FsfWGDi0Mog8oepCNFYifvlcP8os+4r8TOvTUaQuKcuNzEJ8SM9B5ySqoUOrNkcJEa0vTaQFY1fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169063; c=relaxed/simple;
	bh=D2UU95IgYEnQXfvEpzq5iddBm3Mdk1jn5gnY3b5vR7A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qpnYUIp7zrAsX6mbr36rwGSAjylEJKBgX/G7+0IFTSp6Y6BphnEIWD4cOkSSb6ntUf7Xdn8X/U5R+jQQk7sxwPc7CzgR+VHb24M8teOi/nTsOJEgRcfxlLtiHIcSi0LrXyFZQBZB7LjC8aBuE0qV052AtUjDvb4pGQVKEsNVjHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PywDpHdt; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PywDpHdt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8fpBF/Ob9oyXhQfG08aDqjv/ipVcP7L2LjOKethnxX/+jGgcR5F80HJ2LYTteGbNKozSucZNYNBd12tdkBUJCIo0rZvkTS0yTUiYHwRIIX6UhJUBOfIOH5XLjFdGQWLrqWT1cL7a3Co+pbAFnld9Jk3DueyljXI+OSFahbZcER2QGmEccICGiDzYthVl61Lgb035oxJeF/gdPHAmSvSf6YonwhVXI2LZ2l6py3baAKGSX2P3Na/mp4ey4nadL03nvDvqPFsJJEwpNpJURD9YcpQ6ixx1P8VfSyaB4ZDUZc9EVYxE27Mle+mgwL98ujks+2p3dVL3CUcEplKQf3LDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naZwd1JZSyBYhgd7minIyu1AvCdnzPklhz+cjyeWltU=;
 b=MNbDVxDQaZjQNG4voqA+PGLIFKtX8DgCwc1fzKgpuk14QtXQczFhH+fK6t1YLmDBtjvJUgL5mVlDNfr+mDzlCl0QVQ3xM30YlpxnlFQBxMswti89ItRtVA1bepKBfO7//APWFG8Zre7SjZ31M/fypIse81z0ZwyRUXW5rnQwDW78J2B6bIOlLbMsw3OWQayHUvDDoOaXU3zNeaIJY2b5bLLozI68DXuqCS+tcap4PbXwzzPYncgXnt8JMpxvW+I5NghE4SAcZ3esrjxEkL8QVhJO747vpv9Pyo3bTrhvWXiYHUG0Hi0UssWnz53UH9+VWs1pdqoWt5wB+vXlIoTf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naZwd1JZSyBYhgd7minIyu1AvCdnzPklhz+cjyeWltU=;
 b=PywDpHdtnNmEnGOpLxfxbIwWtMIAQFEuHOeM/bujr3SyYesQBXQglp3w+PbncHI8hhcVlFTVhjixNprpq0gbDGzPYsywEy+PUu0upzix9TVVJ/WTGNVr9IhHMfp8xJS0Y/J1cHhOUgeDDcXnYStulZnT+zEmoEJDuW6CZooaoVEvwNLKTyGmuv8QxG9sUALM5qiz3oK2E05wK39p9KKktV1k3qNygmMk+6an5OQLsFGokkGELY81Vqm1k+eZcb/TKJWhySGipS3MROH8ZsolMEuEszYpDOkK29bZbbokdHCKCwyKlHUF53I9B4xCA27GnYENI4t/Rcu/1Di4Z+lIsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB9325.eurprd04.prod.outlook.com
 (2603:10a6:102:2b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 05:37:35 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 05:37:35 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx943-evk-sdwifi: add a new dtso to support SDIW612 WiFi
Date: Tue, 19 May 2026 13:39:42 +0800
Message-Id: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0350.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::18) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: ed79bd60-b264-45c3-1efd-08deb568bb26
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|7416014|366016|38350700014|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R1rHGNeYP+E8DxXOX6DUFqeEH8UY2jgVaLECUAjb8zauu3yecutHdbghLuEOMuA/nrPMVGyg14vHVg6dMcsb6c4i08J3w/wnDv+2nIGkwV+PGLtjg7yiR3f1sLGxFId5ZHnhoTFJjcsRzv68zUDUy+yFnSUsT6imvcESr2i3lpIIzcafR+7EBQ/ogxs8taLHQK7bP7m83gMeZVm7iCZGBG5rSPILwISOFDiuTrXLQWNjRNUhOzO1vlxKLr11OvWK1YH0/1l6OrALoSFBV8XPj17zGP5cAJlty4zEuX1pHcGJnYCNMPCOpXd6yqT3FvkVIokx8pQnQg63uRPlulR6pgaATYyE36E92SyM62qgwU9MAi1XHsfgDI1J+xBV2UMfdQhlUSZHOYv7Q4Z8B/VwqRaodT+Md6Yvc4vQxgezxBIoXOVurV6evyvV4B+kFZpXHGQzSYRVDz+srwyCosd/oFn5r/o43/Wrfr+BLMVcvbNrM5ex/WtAv06+qJqBg2uvAHBV5trXyTIg1dOYC/nhNAHDxCGeNEoVlwnV0Q4zamDnQzSUQ2FdP6mn+pNsKI6smSTxphVtBp7NtZ0df315HXYLpJnsKywXr9oIoRTlFds2TGMIeTS2DxH6E0uEW3axqSECkfBejlYCE/EJsa2nvDnlmqxFkCo9hXcFqjb/gRighXpB9RSVP13nvNVyIaZnIwQR3JZk91glmDxMny6UKWFlhVkTPG3iBiMe2X5VXttV/xjXvxKtfP8iHiFyPIsS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(7416014)(366016)(38350700014)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWhetETBKXp93FmFMMNJbBTkyxwxgxOyebTLrFoakG57dDLx2dV7ROQG1lKy?=
 =?us-ascii?Q?uuU7S4gn6Mcoi50GdOF74cBBecRPlPSE8I+TJN4b4r6iCQBANUOAepEfuT4g?=
 =?us-ascii?Q?d6PC6RbMph6hFT4w5NnLx0wvzijSCipKVWifWkrrQQ5PlWV2Q8ugmvMoy4zo?=
 =?us-ascii?Q?tD5zjrdJW5GKW3mmLn9XqLGR2p1VtbRcU98Hc0vHtQ6e51CK9R+Fh2xIPROw?=
 =?us-ascii?Q?9t2jBwiGZq8nKf1tl5+n6UB4w5QNP3cU3ygpy9vLLnyte7KubO9nZGaefXby?=
 =?us-ascii?Q?MoyOaXeC5mBYhgP6uzg8EQAl+8EyAbsczB3/OvggUzWjonlqITfIW/yPkE6X?=
 =?us-ascii?Q?wpQhHaFaHhJx8lo3x2WkjNVwJeKYusb39bMWawW+/pRpPuxLTaXjoDAUcbfd?=
 =?us-ascii?Q?/YZJtYckjb0ZQoJQrdAI6Ygfk1A78GvOBNVe0tfdq/E97TJAj0xC7S/dMvtV?=
 =?us-ascii?Q?JrBwQkC0EmI7jHsV54l7FevAnGq7B217F3WZeVaxqaZu5vs+E65BwTzOF6Um?=
 =?us-ascii?Q?g0NV/HQNqZUbposV0cPxpUx4ke4yF0Kfv+z7TioZB79rmleAzsPTpEiXA1bC?=
 =?us-ascii?Q?USE01QH/M4pSggan6JzMONayN9UAbzmO3uXppde7WRaKDz6Vi9Mm7pp5e8pm?=
 =?us-ascii?Q?4SocbbtNigYwbjzky0ClC10uWN01L7ziv4ecS7oWxH4/6QNLZXwtaQYmv6wi?=
 =?us-ascii?Q?LOcL++kGrATEGkbLF26TyiFwvBoMKsu4mEBWMLi3Q9xVMZ8ijQdn3TPOaJ2m?=
 =?us-ascii?Q?jjHoMalpg7NIuNcjYNTfmreTA60hJHYg9juozuzFBrwtQ/kcLa7l9sBO6YOV?=
 =?us-ascii?Q?ck5IssYQFa9pj0GodhXh2GbduNgdJpcVtm0oT3YO/3MEQUvXPdrC47jQpWgJ?=
 =?us-ascii?Q?TzosbUUThkVt62gGgsbRAHAcqecycFrSC7ZcrZGBQRXrwtinms9dE20ZYcev?=
 =?us-ascii?Q?22BnSJYWkFcnKcNlmNrnA+n79ddchK7VBbDihPvWNyf22WiUGkDP+l56afwn?=
 =?us-ascii?Q?/w5APzavrAMy4sQ8jWJSnNfj11ZZ/euEPrxchoEvNBuyzBvRgl3AomZCF1rZ?=
 =?us-ascii?Q?mSHkDNLZoF+2kzLxEw8Zr3m0tmEIh2Vpe+3sA40Luxr6KN2UNUfaPMSZ5fF2?=
 =?us-ascii?Q?Ep5ptORDUhpRaRwgEE+x2pDLthfF1e65lsKxr6ytySBMrnrExNtB98pWK3ZY?=
 =?us-ascii?Q?fMWj59mKpP5wnMQ0zzHvxidO1qKC+BHYfiEAIiEEFpRtFS/XdOgRG3Knrabk?=
 =?us-ascii?Q?GNTO2TbAxjSkh0LwiNrMqDezaMy9Vb8B89KdmJnhRYeqQZNbnu4utNDgXMCZ?=
 =?us-ascii?Q?r6ZbT7KMwThVJgrGv3UlZjGGUr1Pr35CH4QxPZd6Ji0i447oy796+M9Vf2k2?=
 =?us-ascii?Q?nOrJcnQt3JU7hqS/wgLKAOzRKyewXYfSDABB2yu0PQbBB+WlH8LZZwNnAIWl?=
 =?us-ascii?Q?tpHk3VNVbrK8+Ned04rSPk1Kjqj2qwaMf/YQloRsw/BGxlISMVyC6XOmfwgP?=
 =?us-ascii?Q?DQBRd1n3ujYzlYF1077MB+9udVAqzA+SMCjqDL0Bw6HkXmUDDYiTkJxpKEUd?=
 =?us-ascii?Q?magfoHD8c55wom+Rka5eeSoIsyJJaF2nlVwLbelnzY36udJ6qsKy8j/2vcuW?=
 =?us-ascii?Q?HKDv4cfZ1iDbrcpUG899iqwJj8gfVmQw2PEOPRIWJXfNhdANfk42W/Yf+aPv?=
 =?us-ascii?Q?PJH5kEViCPJFf/5BRF84hMPykFUjTseUA4YL7FRU23CCIoeqv6mAogm79yyn?=
 =?us-ascii?Q?6wn+aPw2xQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed79bd60-b264-45c3-1efd-08deb568bb26
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:37:35.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdUnYMuBXiqmaqUGLdb8nzgqvm8NPdxU8uTReCeGmwsmng10G8R5SHIp5NFr/t6B5y6Kt0LkC310/JILjuMvxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325

From: Sherry Sun <sherry.sun@nxp.com>

Add a new imx943-evk-sdwifi.dtso to support SDIW612 WiFi chip on
imx943-evk board, the default imx943-evk.dtb is used to support PCIE
AW693 WiFi.

Use separate dts for SDIW612 and PCIe AW693 WiFi to avoid the shared
regulator between SDIO and PCIe buses, the random probe order between
the two buses may break the PCIe initialization sequence which cause
AW693 has probability of failing to detect.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |  3 +++
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso     | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts      |  2 +-
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0a4dabac5de4..657e0915ca69 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -516,6 +516,9 @@ imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
 imx943-evk-pcie1-ep-dtbs += imx943-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 
+imx943-evk-sdwifi-dtbs := imx943-evk.dtb imx943-evk-sdwifi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
new file mode 100644
index 000000000000..59cc1c27b9b9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie0 {
+	status = "disabled";
+};
+
+&usdhc3 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index fe4fc512d95d..1346a6a56883 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1153,7 +1153,7 @@ &usdhc3 {
 	keep-power-in-suspend;
 	non-removable;
 	wakeup-source;
-	status = "okay";
+	status = "disabled";
 };
 
 &wdog3 {

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

