Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3253F86F9
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290020; cv=fail; b=Ynsme42JtdKKY1r8RUcPBIgfP2NN2AT9zKACMJL9ZXInodSLLUYI1XXNCayvVlGI6VP022DYQ4Ad2U8JEuX3vdfFGBn3EM4BfdBJHYJxauwVX5u4wOe4Vfp/uA9P04iBH/YUDVlQQmpS8KSEq22/66zHrI0C+fa6Cgj5p1zlMgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290020; c=relaxed/simple;
	bh=MrYGBp5hKbqXlu5ikN8/lFzs5YsC0X01l8eUbfXVXcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLOzEGHs+6n9wkBK8A4jMlHY6atxM/lxnmyfzNzMZZ59hq4VpTWTXQ1K88vr7kFW5r3UjsPmr8xA0TDfLYdWoVREEyjLKBRfpY6Gkz/znQjcy1YFOGiU8kOFqT++ooNvVX0QfdmQA4XASUUSvCOZ4gavl9VUScjBE7Q2l2wilwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWAIh4B5; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWAIh4B5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq80TpqLSW7Rkv77bWxILN/xO8yr6F2uPw4jYcbs4ahrHKl/I7MMWmCRAMklpLSMhJQfHVAAVgSVDfG7bU+Bd7T5I0QzWeKOhpQC4QwbdXV3+4tqsGIa/GnQN4a2y6Rn/7cKOGKKcfLgaulzo0Sz+ndPl3vfMt/Uz0zkUylTE8Gt8uMjCa0GAuqipKA+Iq0VjA1PgBQ2br455jHU0GDm2kt+8xq+Gc8OXr+vTSeIxoR6yCLKyQNywoNIL/7SC0y36vmgyX2ZgkbiXwi10VROmNEiff1FIGPdEIxt6AmK8ewg80MOrD/Nn4G0VT+EyaoyY8eKwXpw0IYlIaH4oKCUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUGqMG9czuqogv1+upYU7R2MPfafLnSc/jbv29rPoKA=;
 b=guD1XFkQPYE97lBOpdQ/Pf0D/0vzeF23VLwJVXCaOQdrAHDJ7DbeRzbGq50+TuaOAMo6gUfxN4PlH3ts/fZJBpP0jaQ+clR4acL/6x1tJtstLlCwPVXqzxGNT2YJIJ+JFV5PMYr+KdfkLq7W2OGeARmAKvXS5zXbZM7jACLX3rqq9kAsooZxjgd0+r+8v09T2vPM0eVazLdlJvkFSMC7AfGQQcOVxNpYBzKNarc9FdYm2WFCGOuS6ykNWszaHwJGVlWKigVLbljdFNEeF/IqXVDxsBP73q/i8wgXyZOtNIJtiegcYw3FqVXtI6zVHeI2xfbDX4E1ILfnXLTHcrNclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUGqMG9czuqogv1+upYU7R2MPfafLnSc/jbv29rPoKA=;
 b=GWAIh4B5MIxzjBicgwqwTAA6YFwvDOiq8kZLOugDghx0Vqf3IyMmRTAt8dJJHf5v91o9eY9ezh47ceQIWpgGi9qQSLaZZmLERLCa26992wF6KsiyG8R1r8qDuAm59k5clbsfq1ztPi4u0qUifduKzLy4sItycg2IfnCZbgqaM8xg71Y7aCe/xiBRtghPzyBoIROOxRzX+hvM93e7bFcbdk7wdDyF3hyz0I1fjBS2HrHItvPbLyIEA9ggJzZ6np95Sw15SKJXew00K0d8YSp6lqjbLUCwJUwJgU+S8xfMwm78pLFapr6ywa2pIZHatS80YDopFCCjKMGYjlP/vNt00g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:56 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:56 +0000
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
Subject: [PATCH v3 04/11] arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a separate file
Date: Fri, 17 Jul 2026 15:06:28 +0300
Message-Id: <20260717120635.2118610-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be96159-857f-47b4-3c8a-08dee3fbe590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zPD0OrdAAJT2pC2rHnnEGT4cqQXBc4jVfcyHRJ3mreskYko34NO83n++fB8WgVezniLfxxeg6Ize/+zM9W3K8N7ycOTU6I2i0t5vU/cX+i9l7cLMXcjL/P72lp0Xo0LyAlKiXLlKV9q4DK+LynWHObpr0V1mfdEceFSInpHazSZc0dLLNFLkJbb910uW69dFuuxEXhR7jzWNId1/m7CNWFkfvWqq4v1BtACdOHKCrlyKQThBmj9sNLP2AIUGo8uCgyAiBIC+TbDKQw/pJz8iuN0qVNynDtJGQlNQoHg0OeYjCgN0S5eXPAbPINZzBd5qPqh/DB8yJNajQMQ1eX2n+1vAksjWUxoycgS1XK3RG3JhsI7/EL6aGU8+79JX3qJbcRTCK7Ua8/1KCnPODCcifwirNvYsJLYupqS+/WOisiphrbi/3wDF0GPLzq0ABAbrNtMmII+ObMENglAYeJKU1fRinEs7mW1oWPj8QydeGd7H+EH1GzJECNX4DjlN8MSlBvfswKHTPBV23ER3fdxQXfnnvLXGfeGCG/PkUGAoQyZ1rnLwjxwGnL2EdagQC8LLlelGZnUY3haTdP0dBpl7fgFZoYT36q4XnUvZCmt751WwLAdAikHoTzRsJ+ackkrjq7xGz33b0D4X0vyWtVRxt8nLMRZu98D6xJ/Sk6ypvxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xj8x2yPBSq2iGZsYKdn3/eg8x6++OAEOEw3Nhs2cMXkc6jXLFTLeV8haEEF0?=
 =?us-ascii?Q?/y+/pdg51+1HQbbreZVg0svFTu5FlGpeX9Dcl6gc++b8n4LoFiDDiuACPwzO?=
 =?us-ascii?Q?xyFK96j2G5sctVUCsNcbw8zC5gFygluQ61tqFp3DNn8lozNAPK324mpofULm?=
 =?us-ascii?Q?7r7oDMco6wzLmi4U+VR1yvY3gkdHB5GgwYUroQuXN8s8DzRm7StTLtVRI/qC?=
 =?us-ascii?Q?7dWXBoDhyVU3eL//ifSp9OYlDpJYupPOFliOjwUNQsLxYcW7BonjS2BTPWpv?=
 =?us-ascii?Q?YpBLjvcVQ3/dlJR5s0tIv6qNEyLl6zYw9VmjewnATV9kfXPhy3royRSZ1W2p?=
 =?us-ascii?Q?p4cOo2MkYpr10QC4gN+KH2NoguKfyK8m0mRdNU38egRXiC5VFKDirDl3WQZ0?=
 =?us-ascii?Q?nidTlDlUq2RQCRdm8CD7LAWwe9grfR++88Rmc25q1gZFvmSwxKzhZlsery97?=
 =?us-ascii?Q?A6+WJUMB/xW8BpLuT2qjKtKCKw9whB6d12KdZiVpt9HhgdqAfXBmnAyTL2F1?=
 =?us-ascii?Q?XAZ+XE0dDmK+FC7ENH+AOjbq7bxVz9yYsH+S7h3RimsPOxgd76JNURBz3Jgc?=
 =?us-ascii?Q?9F78CRNGn47VLdHm1oWFICGR+DqBbuQvaJiGVXbEMRIl/sD5/gFFvZAJ8Tq/?=
 =?us-ascii?Q?bNQVJ+PYLmdKDnebbR5n44uyuIg5A3EggLnaY2TWRvcUBTUNecUAeHUWPChY?=
 =?us-ascii?Q?3PTIkrauHLo/geC8+jYaKAb7ZyZrBGgN9YaGJoo3hwZIAe8jnQBbRjzFErjE?=
 =?us-ascii?Q?PqtojqnXNhzYfAGYY/fbu9DxSaA7J8fQgIZBRkq1IWKBUP5+bAMM5kywClzT?=
 =?us-ascii?Q?WJ8DPIqWu9AZJJq2Tu/vBhzCI7UMg0LnKA2032kwLgyvTjmDdnLfjadfRq8o?=
 =?us-ascii?Q?/DopPgj/xgm7i4MpFyN+hVP8gLsoPiH29yzlRr9CK33naSP4oh7t6tpQzg95?=
 =?us-ascii?Q?7JvK82NKTbcKaGT4NdcnmTR02e5MorUCQDv12SOCt8XYsx7wdXFcHyfghBC+?=
 =?us-ascii?Q?YyGin986WJIOJ4q+bUPMFUP9+LxdxjroFaCg/F0ApRBrbWf3NgsuYOcZI6wE?=
 =?us-ascii?Q?3btG0eQfeYVRStaUvt+lFU85AHuZCYKojHyAKJ0gdvKo+47n4bvYDRNUVowN?=
 =?us-ascii?Q?HwnY9HHkVN7kbBETm7NuJVQjBDuR+Y4zFkHDQCVIvSXMc9630rksUGEgt3mW?=
 =?us-ascii?Q?QUEBU3MA73/OvEgorFWo9rUC5nF9QEEew2GzS1k5rge8/BUNV2gtyGatnlhL?=
 =?us-ascii?Q?EpKUWYxPdT+ZH8PUoD8vU1OrKrU0jka5kQ8qei2rtIrZdJSIchjfGG4dfuKy?=
 =?us-ascii?Q?UWgM5+FYaJt9BD1GtTzCmLtj0OcrAPuPrfQ9GP5ubg37HplqW6JV9jITLlYZ?=
 =?us-ascii?Q?bA6tOw0qvKEEshGY6zO6287j0bycZz3jFON1rFvrVxXmuBWwljdxW6YrylPQ?=
 =?us-ascii?Q?jWxKDlXMyYVKZcwUUdQix7FsJ0+aUtRjj76Mbvcdq0/tT5rntMYfILAtmA6k?=
 =?us-ascii?Q?v9n4zIPmMlmWUZC240e66bobX2qJ/ePVrUcPnk7rZYAf2ESvMNfyMXKvhFgB?=
 =?us-ascii?Q?5rNdCNP/xHxmeukNCmA7sQ+bUsybRbXRJRtZnsinaotyJQpsPkKaKUs9LLvC?=
 =?us-ascii?Q?wdWnT4cwFX3gq4umxjEo5/hpQ4M5pEe40t4x+OdpoKSKQdgMGWgneaULejPw?=
 =?us-ascii?Q?l8LvoOmNg8HiQ1PSwBGZCNqvCSlRfHklt8o78TEa9PK2sckd0Ccz+NEZ3yXc?=
 =?us-ascii?Q?Ls+sz4Lu4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be96159-857f-47b4-3c8a-08dee3fbe590
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:56.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXpplHAxMaJMV+dQoySHYdtwY4mHGwL6HqzT2eFbPjra3fC9vRVdhJIe/707pAadR+i0SMk4JeCCLOCnCXNYpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

The LX2160A Rev2 SoC changed the PCIe controllers used. This difference
is reflected in the fsl-lx2160a-rev2.dtsi file which modifies the
relevant dt nodes so that they match the actual HW.

Extract these modifications into a separate dtsi file as a first step
into a complete overhaul of the LX216xA related dts files with the
intent to not use delete-node or delete-property. No final dtb changes
are expected with this patch.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- New patch
---
 .../boot/dts/freescale/fsl-lx2160a-rev2.dtsi  | 185 +----------------
 .../dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+), 184 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index 3d2637fee2d3..c2a18cfd8efc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -7,187 +7,4 @@
 /dts-v1/;
 
 #include "fsl-lx2160a.dtsi"
-
-&pcie1 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
-	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie2 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
-	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie3 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
-	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-
-&pcie4 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
-	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie5 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
-	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&pcie6 {
-	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
-	reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
-	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
-	reg-names = "regs", "config";
-
-	ranges = /* 16-Bit IO Window */
-		 <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>,
-		 /* 32-Bit - non-prefetchable */
-		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0x40000000>,
-		 /* 64-Bit - prefetchable - 16GB */
-		 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>;
-
-	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "intr";
-
-	/delete-property/ apio-wins;
-	/delete-property/ ppio-wins;
-};
-
-&soc {
-	pcie_ep1: pcie-ep@3400000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03400000 0x0 0x00100000
-		       0x80 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <8>;
-		num-ib-windows = <8>;
-		status = "disabled";
-	};
-
-	pcie_ep2: pcie-ep@3500000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03500000 0x0 0x00100000
-		       0x88 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <8>;
-		num-ib-windows = <8>;
-		status = "disabled";
-	};
-
-	pcie_ep3: pcie-ep@3600000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03600000 0x0 0x00100000
-		       0x90 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <256>;
-		num-ib-windows = <24>;
-		status = "disabled";
-	};
-
-	pcie_ep4: pcie-ep@3700000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03700000 0x0 0x00100000
-		       0x98 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <8>;
-		num-ib-windows = <8>;
-		status = "disabled";
-	};
-
-
-	pcie_ep5: pcie-ep@3800000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03800000 0x0 0x00100000
-		       0xa0 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <256>;
-		num-ib-windows = <24>;
-		status = "disabled";
-	};
-
-	pcie_ep6: pcie-ep@3900000 {
-		compatible = "fsl,lx2160ar2-pcie-ep";
-		reg = <0x00 0x03900000 0x0 0x00100000
-		       0xa8 0x00000000 0x8 0x00000000>;
-		reg-names = "regs", "addr_space";
-		num-ob-windows = <8>;
-		num-ib-windows = <8>;
-		status = "disabled";
-	};
-};
+#include "fsl-lx216xa-pcie-gen3.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
new file mode 100644
index 000000000000..f405b21e68fc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file describing the PCIe IPs found on the LX2160A Rev2 and LX2162A SoCs
+//
+// Copyright 2026 NXP
+
+&pcie1 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
+	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&pcie2 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
+	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0x88 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&pcie3 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
+	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0x90 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&pcie4 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
+	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0x98 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&pcie5 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
+	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0xa0 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&pcie6 {
+	compatible = "fsl,lx2160ar2-pcie", "fsl,ls2088a-pcie";
+	reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
+	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
+	reg-names = "regs", "config";
+
+	ranges = /* 16-Bit IO Window */
+		 <0x81000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>,
+		 /* 32-Bit - non-prefetchable */
+		 <0x82000000 0x00 0x40000000 0xa8 0x40000000 0x00 0x40000000>,
+		 /* 64-Bit - prefetchable - 16GB */
+		 <0xC3000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>;
+
+	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "intr";
+
+	/delete-property/ apio-wins;
+	/delete-property/ ppio-wins;
+};
+
+&soc {
+	pcie_ep1: pcie-ep@3400000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03400000 0x0 0x00100000
+		       0x80 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <8>;
+		num-ib-windows = <8>;
+		status = "disabled";
+	};
+
+	pcie_ep2: pcie-ep@3500000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03500000 0x0 0x00100000
+		       0x88 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <8>;
+		num-ib-windows = <8>;
+		status = "disabled";
+	};
+
+	pcie_ep3: pcie-ep@3600000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03600000 0x0 0x00100000
+		       0x90 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <256>;
+		num-ib-windows = <24>;
+		status = "disabled";
+	};
+
+	pcie_ep4: pcie-ep@3700000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03700000 0x0 0x00100000
+		       0x98 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <8>;
+		num-ib-windows = <8>;
+		status = "disabled";
+	};
+
+	pcie_ep5: pcie-ep@3800000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03800000 0x0 0x00100000
+		       0xa0 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <256>;
+		num-ib-windows = <24>;
+		status = "disabled";
+	};
+
+	pcie_ep6: pcie-ep@3900000 {
+		compatible = "fsl,lx2160ar2-pcie-ep";
+		reg = <0x00 0x03900000 0x0 0x00100000
+		       0xa8 0x00000000 0x8 0x00000000>;
+		reg-names = "regs", "addr_space";
+		num-ob-windows = <8>;
+		num-ib-windows = <8>;
+		status = "disabled";
+	};
+};
-- 
2.25.1

