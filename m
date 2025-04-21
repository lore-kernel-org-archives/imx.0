Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013060.outbound.protection.outlook.com [52.101.67.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000F3255E2F
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218220; cv=fail; b=IC4zohVNuZSYG/8s79VWHeUtWGgGJZqmFhcGn7nnMhWX77RIm7HzLoJyK5bSbckvZ7qt657IDc7q9Gpc0VRHDkwJDrqJCIp9j2gw8/QbY2aA32WIgae4NYGDx6gqSlJ/OnD2rb6QAMgRFEfJL00htQXBYrdB5N1LJyuBYPa1Ccw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218220; c=relaxed/simple;
	bh=b9lGazT8fZ6rONN150pPdOWKAnVFyChz8t+oWHwv6eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bsqNaY/NddMlSXCdLnMCRhr6/Vgnp4XRWVdrmLi7ThMZe49im+yejVTaqWsR273ZNTpE3TH7ZpjTkpMwV3xPO9qclEsCjlkH37AcB4Rcp7M9BgCFxVFMCAW6nPRwJLWw9B+Kdvtml5dN9oiVgBIwxfXAgkrjmryUiJRf4B9GpSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TjjdMzl8; arc=fail smtp.client-ip=52.101.67.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TjjdMzl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAgDqTQEZSq7mnv+fJdddqYDfDzwaM1tVg1lpNW9xoevzSm/CTp3BJldAUNUEXl/E3Ly0Iwa7+cXy3iHZ/5AbiIem9RF7lT1OoH9sAnxazgRwJ/X2fHArb6rFQIzjv0LAJlckCiUiLp6puadgt8GFAxlmz17mHsDck+KBuNjDVy0Wxvd0XFX6PUxG3DZ+ateVPjO3K0RhAZFYEBiF8Lk7AXvx5haqy7nnyITsws+qr28GlWNz/ws8Uzshg990Dpn+cLAugzyAcizgWGbyhqBnkkte5BSN4b4ffJlr1l4pwuXh2fIx1y1qZuqx0IprZSSZ1daS8BjQBDhC9b3QuZ9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eleTM6IOsmvioAElaGtXNfhLnDaol+NpsmkGyAlzTe0=;
 b=YjnfXGCO0/ZpOBSa9nApMwy6ZPVf/0zo3UqlFrniqgEOAOAVcW9AA4B48cvW68z7GLuO6NK5nwpzuyyCJYxHaeK2X2CcjeEZRN1j47ejUtp/zWK/XO8Hf6OMdjKlTGUEDwF8BwBhfSZU3mS+dA5KJVy+KWqD3HTwqP9kSE1wC6yj48/TV2WF0WdDRPE9Q8ZFOa9Bav98mhN7XdEk5Dh2ZdMvJy511NBGNFNoxxCy97ImCfAvBxYrGtPfRtfnyz6YwPDwy3yTMZURwezbldAq13O1FqzkS2b9bAF6BtdwNVYwrhk8OM45nC9MhPxQ11Nhn/569rOO6D5SqH/J+WcvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eleTM6IOsmvioAElaGtXNfhLnDaol+NpsmkGyAlzTe0=;
 b=TjjdMzl8rjPeIrmVVbYpXEkHO4GwIQc4z2iM6ZxkFGVhEWNa1xh4UfrNDIXQNbe7txzOTFbYQsVVgz2+1jTA9lmLVG+vUXjGywPMP7xgaWyLjU3csV9HYjG8eeZ5RQBoPN7NNBbBNe5uGO5bKf86fL7CUdHmdl6pW5F7dzsh0yJDjAOceYyxesh1EoRiEaACQAMfc5fdmgybGDSRIY/NBbn246WO6yTmOgYkQBqdQr+WJUR/HuvleZNiVU247SmT7mllth/Ky9iOaROBxnuNua2koe8OCUWFk8iOn0Bg8FMVu21vBOhfaCuj4rUsjAJrfTM7F6RFlwPlkmOFcZXT6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:50:13 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:50:12 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linus.walleij@linaro.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v6 3/3] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Mon, 21 Apr 2025 14:51:39 +0800
Message-Id: <20250421065139.3073232-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421065139.3073232-1-ping.bai@nxp.com>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: d703efe8-e9b3-4a5d-d301-08dd80a0c3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HxtFidUEhWVju0fcN+tVWSN7Y3c4r0NW9HXkcMW8Ns++rv2Zx+tZ4JPktFFL?=
 =?us-ascii?Q?mbiIna22UV97WFvoPsYTkU3OT0TCQ7XGY4ahXtM5URPZvA5NMbFfYVS88t2l?=
 =?us-ascii?Q?ccGidmqfwjoP18s7DRVIeRlPzPSA9cPUu3DiSTlKvKtvsMw/xCrzop2QIumq?=
 =?us-ascii?Q?LJm4LAjkIBkXUSQ3Mp86zM5H7V4u/5D5BAwVEGP4S6vQ9bl6OC3YtxOKyu14?=
 =?us-ascii?Q?oVZ7p4dThHf/hgqnC9edgcLJxGo3DRgOC5pSj3EEN6WopJFomzULJ+IsEbBZ?=
 =?us-ascii?Q?D9vCdh8KGis4OA30dsAZlD1J88CtHJ0zDVIL9VXJF6LhO8ccsaekTuF2HLlE?=
 =?us-ascii?Q?XW/US6LVDX7bdnjm+pshkM384/FIg9aPyHY1hnbAcob4l6S1ZR8ItYM79hAQ?=
 =?us-ascii?Q?am3zAcznLdQ979yUQQEn4BmFHWoXoEW/jJmm5+kR4N0K/1sGfxIwetZQTWi2?=
 =?us-ascii?Q?+11Na39bomBR4zLjNUvcLzQdANlW9ccpssnNk8io8nn7iQ5hp/KqR+NtkBen?=
 =?us-ascii?Q?djcK7bWYUnSdgrzfGdnpVZNOwDQGirKonQj8Mj2O+bXYfwZtWPbv0zW+fJNF?=
 =?us-ascii?Q?i9xT2xip5029KSo6/f1JM+MOsRJeZGkh9ZvkTe+/TBThu8IktgymWTCX15n4?=
 =?us-ascii?Q?Q+xN8dFrxQJrAUOx1NyZs8oNx1s9LIxRb1/cXSlKdCXrSMr+aUWcpuXc4Ppm?=
 =?us-ascii?Q?PChea3njgFfKUWMDwut3UFC+VcpyAjky8lWnQxyM8xwpS+0DgDHSkpaEXfcl?=
 =?us-ascii?Q?msTta3iHdcg2DKnzH/aIBF+m4aX2sDdinEdx2OxGkhTivYKwxeIBl5er8Qhk?=
 =?us-ascii?Q?vYXQGw0+h/cUxO4T+HZ4dJzdrbpcN+TYp9IOEjthskjdVrcgnwQwwJlcxKSI?=
 =?us-ascii?Q?x4OHNen/9PCBmOnj5Xmtjp6SINTCgpuz1n2lX6maimuVu5b0+IRV9B0ADMyP?=
 =?us-ascii?Q?f1NQRMgBbwpzGIHjQGuqgUj0ISZNlemrUCpmQMCXaMa6QT1458LB0A9QuABl?=
 =?us-ascii?Q?wQOKlT8GI3Xr3SBOsIHlisoISEImM8tp2YqOlqcOF3CfX0NANfRXwEqrQ4LU?=
 =?us-ascii?Q?4bj3rGAjf5mlRKo/FTxCDL+5PS6CrAedmurSrqUUqwNQjN2QCYBwIeaXzy2Z?=
 =?us-ascii?Q?D7DmQqsLvZe8cNf3rvpSmaUGes/qujH4MAYk7tKuDHzWFOY1qihIomzZiHJu?=
 =?us-ascii?Q?f0NSUqMnFm7e0uoIJsTXjFsZegCoYZybrXmKd18ohDfKklsfDMnfYxRYTe+6?=
 =?us-ascii?Q?IFvCVzWRkRq7m9DnJVybMglshmXhwj0o5JyRjU0EM9lpwnQzq3ZLzpqWUAbT?=
 =?us-ascii?Q?3gp51tkVHFwlAyB1OX3uZs21Zpleq7qzrMvXoty7+IrAU4+J8PKE22UCuYdY?=
 =?us-ascii?Q?eOM3haBDVuM0sKTAPWqF5C3qnRjn2kp3SI/QC+jg5jNKXQF/2itXdgr/OInn?=
 =?us-ascii?Q?m6f+PQaEtvmsWkS8HyRl+jolFKdGnNFyFjnt2XRspw2t/S7NCO+E6FxxWqO5?=
 =?us-ascii?Q?7e0416DT/S9GSzs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VfmA1Bq9CKEzBD69AiplNYFs7xF0fsr75mG1zgMojF+YW7hzWiiYbH0WcPsV?=
 =?us-ascii?Q?jlXLykvfW/M7eedYgZ1tTv5CwltHJcSi4Ci6yZda7wzQL25o6f/oWgh+qv0w?=
 =?us-ascii?Q?oFeyI4YzSYtQvM+1WuBhEMsv9Q5FaO0/mafBfVmgJpvemGoH0TUARBXyklj/?=
 =?us-ascii?Q?7FQSgACaF3e/2JsvnjsCrzqNHPNNuGpJkQuFyI3cPSS5gGvdQ/kCvk6pDbfV?=
 =?us-ascii?Q?d3uh7kwYMTYMosZkGTfn03LYtgBwA6DPJYgQoJc73XZYlCxEJ6bKTNYBePgN?=
 =?us-ascii?Q?ynndFfwfLjPyB6jhvUech8Untwvy5abUxco7qgGyn1yHemxPCsRTY8Fgp2vc?=
 =?us-ascii?Q?RzCkGxpgTvw4bVF75XMa50Qv7DdS2J4TQhrweJs3XbdMIccGfkL6Ht7lDT+E?=
 =?us-ascii?Q?G7i8OkF8rcSnMTrGgElsw8SFJ9s8RmPmOQG+5xJMbaBdQ6FIVGx3fqINTOeo?=
 =?us-ascii?Q?1qyjEPzJaT917k2Lea6bYicR5JEj+XsIxuD8Q+c61wBsywcPzmZEiV8wwx0/?=
 =?us-ascii?Q?udnuRDk5LT68Czv30+MkrswIeW39GDZ8QUCt0dF+gLSpIeR5L2JmRcWAmpt7?=
 =?us-ascii?Q?NB8SjcZy9jArCWgJYgp6Grf737krhaEqTEmWwizMfioTielKPFyHpgug/vFp?=
 =?us-ascii?Q?SNzsQXgizR0CzEZD7isNQikfskjNyFrqxagffj95OnKZgoT7syTZgPnAxZKP?=
 =?us-ascii?Q?6dpf2FIr2U9sjYDg2hB3+bFrIWwFVw1i3JRmqMW1rwYjEkv/RQF/8tRLYPlw?=
 =?us-ascii?Q?r3whWYi1tMl6Tneqf8Xt3KrCA67tcMEkZsqNH5N8L8TkFA4WtIlCmM2SGO98?=
 =?us-ascii?Q?nsD1pvwwM9lxT1ImKaq24Q0ry0GR5/LfXPHFS2y/yDFaE3hQ/yFgX4mpSWv4?=
 =?us-ascii?Q?W+nJ+BdoTUMc1qCtIvHmdirxTRugenkRNWWsTyOOz8gGHvqoCJHQLbDmPBRg?=
 =?us-ascii?Q?7hp4ZeSu2m0YS2BoBLE8/VALrEsUruL/iVSE8gHNpiwJ9OUF8DLjV8/rdfmI?=
 =?us-ascii?Q?SNkSZZto+lOPhkh03g82LSVIORnJjyLuHpIGkCJO2nrhdDOQ/H25/Y+mbTB0?=
 =?us-ascii?Q?sE2h18ycncLD3tSs0lGlL9aiOzboIolsjibugxzy0i6TuOIRjXNew8kXsnz2?=
 =?us-ascii?Q?UrbiYyxWyVcT9Y+1jqUIt3B6ubzHNJjnu5yaf3gbtmowoiWbFkW72J0TuIvS?=
 =?us-ascii?Q?wvO+NhaAU2BdY0aH4ezbwxfDOJDFVF2NUWlOMtxdEqQZdxRgtzJ2luUt+cMS?=
 =?us-ascii?Q?/56o0uSnyO4zsMfx9slk9GGr7OmlVNhPUTBpJlr1iRzSCmIBKOHQm19kTZKK?=
 =?us-ascii?Q?qI3PWPj7KBYtAXwwPIjsbXC2F/F9oKq9AzsjKook3WNR503I+pKM83882OJt?=
 =?us-ascii?Q?B8BmpDNLRCIKPe6HeAr1syQwQ8kO3JopNWZHBRRPy+khKR9QfitVr7Ntm5Rh?=
 =?us-ascii?Q?gm53yk6uDxsFrrpa5E+U/zFQkyUt0fskdu39k6RndJ9G1fTEWNKXEGDSiXpU?=
 =?us-ascii?Q?1GvdtkcOCOE0jaMrx4nNH+SuqIcssZK3V+zYtbpXFckxmxIAOVYVW9Vli+I1?=
 =?us-ascii?Q?rWAWE/nG21LcttSizL68gUfqwShiTDE3iKfXC3HQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d703efe8-e9b3-4a5d-d301-08dd80a0c3f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:50:12.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ottPkF0vTELSdAFOtsMCx5nN+OAhT7r5lAJ25gGZS0Akdd8tCitN1jgjQopEUwfuPjJUgyZgCB2gtJ8y4FDFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698

Add the minimal board dts support for i.MX943 EVK. Only the console uart,
SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 - v6 changes:
  - reorder the build entry in Makefile alphabetically
  - remove unused sleep pinctrl for usdhc node
  - add no-mmc, no-sdio properties for usdhc2 as it is used for SD card

 - v5 changes:
  - remove the unused and not documented 'fsl,cd-gpio-wakeup-disable'
    property from usdhc node.

 - v4 changes:
  - no

 - v3 changes:
  - no

 - v2 changes:
  - newly added for board dts
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 195 +++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..48da25620db9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -301,6 +301,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
new file mode 100644
index 000000000000..cc8f3e6a1789
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx943.dtsi"
+
+/ {
+	compatible = "fsl,imx943-evk", "fsl,imx94";
+	model = "NXP i.MX943 EVK board";
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
+			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <4>;
+	no-mmc;
+	no-sdio;
+	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
-- 
2.34.1

