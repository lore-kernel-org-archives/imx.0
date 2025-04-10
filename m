Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9F202F80
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266454; cv=fail; b=CiWYlf7PZmKCAZlX+53jNGnYOZqrI5JcR1fp43LVtF0rHopgTnlNwTvilLDFChj7edSAKgiwCoEzHoetpm89wwJ6uGAtUkvd7Ra2KIwpCFEzqhjWvLWqrPqMAca56thIpoJgFBtnW0NJmpPkFvOiW3GhMgQHmMndN2NpXj8zPa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266454; c=relaxed/simple;
	bh=tVLwmsROZwbklbq4kBv55th3NQAJ4NKEVLi44PRH+1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uKupDiV2DoV155gt6UNhFrmOItoqc74zN7MTn4/pfR4zTGxD52NWJ1Gj0OlSudGjZT8+0tqxaZK+717lXk/BS6QZxw60iXgdjzxDdOtZaBICu7hutxHtUDFztLXcidFpQdoaxBUvaeftGtBwN39j0wzGMxPPloPtKkR8GaltuVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MDQ/7Go9; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MDQ/7Go9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFebZqFI8MbdJYbn80ESQoQ7hQa+xHep+i9q65/zHvsoHXCAHkosbw2dFVTViHvPuvmaGFx2GeAu6m/ZvEqr7NzFKqFRTdo920m/x16dAONkNCxAMWB4wQ1/L2ccU7FZgHFYBW68dnh043pI3VcxkxD9B3rPs05YPnLN1wKkZongv1iAA2MPQ5ngPWSYuoOEeKabEnu1yHQdVO2zVFyhM0aegWCLx/2FkRBeOKNYXt0iYqzzmJLLf989HB9vfsOSfiv/zai7nz75KQbW6S1RTzkiAkkCYIXB1TyXN/cdnl+yMjOkvDraeEuogpKyokMu+WlN/Zg2AuSagOr7yPywfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCmLfzLKoe1OGqaOQh1Z9yOZKq1SUPE8Bu40p47DLNQ=;
 b=F318EgSWHzsGYnfvoJ0c/fw9ADiXG1KN+UIGFrWC/csYVeKhcavOipu4btMnrA9//BwzZ6vWr8aJKuMk1usMdfaoMdEXhvUaXtyofRhL7nABi7GfHmRiTCtZAoaF6O2Vt4C8wf+uNJTkoUA2xruCyUx8p0oug7gQD6IFVDn1Cmg/T0UKl+GgvIKr7snJbDGb32BGQ7n+7feoDgrsUta6Q5mSpAzYWFYnGuWJGFdMFQ3z0raJfT09GdL+VCsl3br0iY+79iJ8Qt/A5qGmYFpOE/o5xI4O6TXMVDHRmYoTBSvdHlGlryVjRIDZ1MVEd/agS/NVPrSPMckSl+FZuxYgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCmLfzLKoe1OGqaOQh1Z9yOZKq1SUPE8Bu40p47DLNQ=;
 b=MDQ/7Go9RRJ0gW2XAo5ebEaNHKIZki2mjVB+DJPwZpx0cnP8con1V9y8VWlhYQDRTqi7ix0kUFJ6MsA2SK40SzczwNsZe8bJlQQoFBPYwk8NWxnV4wdXHp4noRxp+oJx7ioYF0dspUsRk++j+fweATyJ+nZgNFkCwgULhDD8cNhefyw9N7OKlnpROvSMT40df3DoULxGlylkXjm+eGk2lS074WG4H2IUhLGDG7rV4mP8GMR8RERFWR9OmnD5hCbwqV/ET4YUC8GO0/Dch+cqKWzJehp3ZOF9ES0UKUCFNm1rh8N4KqZamHwJKUCPofMKQxcMzH69IXl+ocNnQdVBXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:27:24 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 06:27:23 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 3/3] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Thu, 10 Apr 2025 14:28:26 +0800
Message-Id: <20250410062826.3344545-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410062826.3344545-1-ping.bai@nxp.com>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bbdd03-b4af-4830-f78b-08dd77f8c14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gv4jd5suH6Hyt1rXgQrBuGfLVP5Smhkq2S3drhayhySBkv0koQ0JEin4MTjV?=
 =?us-ascii?Q?Bg2FBXFjvHBThxS0Gc/3OoWngSK3ZiZOnUqyQn8Q1rUyv+FHKPM5ftZSNFUA?=
 =?us-ascii?Q?hig1s3cfIQHnLo0ctkg6yDLvhddcWOPdjdivWRaVTEqz3ozZEP4uUXh/fS5a?=
 =?us-ascii?Q?JTd2II4H7SeCYoElbCiSNDFIn3GA/HXs/+mX939x9SHpC5zUU0TLob16tUp8?=
 =?us-ascii?Q?E4PuLTJt61AHJQAhDCpf4RVck0bgUA8KsKxMHf6+lWuGF/JU4g1G7xyAZDp8?=
 =?us-ascii?Q?IbwlI3ypclor4FFfdtHrZNric/UAl+u5PM2ZPu7sh6nMuEQupHv1JZ/44Ize?=
 =?us-ascii?Q?zz11EGyKznEL+Z5gE5VDE8PIn5tx3oPHSbcH6E/wOQwKcUwMmTwQREk0JH7Y?=
 =?us-ascii?Q?APF3EiEhSXgXQZJarLYCAcn2vkv7Zc0MNdnyeOAHaTYnLYYyQ/vyXAl+FzoK?=
 =?us-ascii?Q?dQglfnPrR3ABDSuES6PsQzr1TSpO/SxReXEo7UAm0ppsAQBaYYxKEtHp573w?=
 =?us-ascii?Q?XrCsEfSIrR42SFW7Suq9OFwJ1R2AEOq5hMJtEIcSgCuWxe5QHXxEbqiwe0oD?=
 =?us-ascii?Q?7tuzkn+hSKkGHcPUvs7W6EO1nZoqc0sU6YBzpsJxjGh+vG80sSoRkQRQH3hA?=
 =?us-ascii?Q?XbpkunCX1snQn7chfyDkWxwerWBLPpCwuUKadS7hXGRAxx40S6kSW9D8u2Nc?=
 =?us-ascii?Q?C7i1jzm65LyJ1EdEWiIC3Oo8FONRIeg99QzDMSqKnXSM5GYq3MISiKoLBRuI?=
 =?us-ascii?Q?2vgKaub+afVjsJodYlydQ1s6KAKBsYqZvJSM085eV1v1EQxLp0PsnbcU3+cJ?=
 =?us-ascii?Q?OV6tfz4K+n8D50EhD3a/GrDa/cY080TEeY3cyyRFFG+STHxfUdP6I9B6rDUF?=
 =?us-ascii?Q?HcGhqiKRC/C1DSqJsSlBeNap/IKq/3WnwWGQrjyz/6vQjjdqNLXF+lh5RDSb?=
 =?us-ascii?Q?0UQ0QhCxnsrs9junZxYEGoPqDBbMrk4A7+YNAQIvqF72YOcsptr7Y9wQka9z?=
 =?us-ascii?Q?n2nE8b8LypUrmabPtRERXUZN0LmOcotJsoZcTrk8xw8mxBycspTdJcIQrGpr?=
 =?us-ascii?Q?pK+3nf0q8z6COi0MQLwlpceISw2352DU6paUfoOr43YisWK1PdKEL8d+YYLW?=
 =?us-ascii?Q?ykiKrzh2QmFpHIi9+VXft36N0VmG9VTSvC/r1bCWFy3cIGr4RToLvzrElF6Q?=
 =?us-ascii?Q?4u77TjL7Wm6uTqiL0Mxrw1y9fl/Dp6up7KCLZFLeM9K9RA4JQ26OJF8D2utU?=
 =?us-ascii?Q?hiGEmkz2NfUbkACwM7edOMm85EESl4O88XO4glalWpyqx3nRJtiJjKrgY5sB?=
 =?us-ascii?Q?YjNIYIANY9Rqja+xEJhGtNIY6ZY2ozmbU0AatcwnJllBM3kypjeZrNh2J8hz?=
 =?us-ascii?Q?KnWjdIUp98vYKIj8ZGor8YnchkH17O9l39AzKoLVVOB2YuKsR8LtwfOpRk+n?=
 =?us-ascii?Q?Jm+al7z6rW9+dKjY2gXVc7JG/KzmqxEJYSCCoGAjRHBLSTIff3cEyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TH+SCOOI3qYdDVne2GXrhFIjrK+Kf5qHpyAgQTJMAkW3dwJU4RiwarKxS2F0?=
 =?us-ascii?Q?/lD0QDdaJRZoDbZUQ63kKAH6erJ8x96ldJ0Jl1iWZxvNJRc7mO7pQFjJFQuE?=
 =?us-ascii?Q?akvsIAcCfxNUTwSGDSQh8nBPK8G5naggAF/fEoBrYy2317Bd1uuvBEBXXzHa?=
 =?us-ascii?Q?twctfof5k7QG99YEEpYE9iQS2MrcsBga8XO14xmJhdslzgijsA2/S/2TwhgZ?=
 =?us-ascii?Q?wbWgfynSR/liFKpGQO1t8PwoI/K/ECR0bC8qKBqbaI3h6GpuKhQNX0Vqmyj3?=
 =?us-ascii?Q?GwPOyNPKmAS7wGWiEeSz65NTCBdzZS56RddfrlfRHa79jqLvryaf5f5b1Wib?=
 =?us-ascii?Q?F0LnEHvvb8YOPQrMhXMBvkULH9inX+mGSWuu4QXZfOiiubW65wm5En1q2tdT?=
 =?us-ascii?Q?3ZfM7MLEhuoNJ1T1hczEAwBvHq+qPeYtM+3qCq8RODpEqROF3dg9pkGeB1To?=
 =?us-ascii?Q?NVXqbhb0XmlLk/c16kcMELv4pfZ4kQ7vp2fT3ECnDi9gXtyJRIhjACCUA7R+?=
 =?us-ascii?Q?PpXs+CTo5UdzBONVFMyUSiFfBzqOfgw9kxMWcgeDV8yRLTzLTwCbtW3qlCca?=
 =?us-ascii?Q?svIboH9jFx02shHQLb5Ac/UhGjzYIvozAwoevdrZO4jYWKoPGHeXPk+8qYwC?=
 =?us-ascii?Q?xV0nYO41LyRXm3XhtlQUiYIHXqoB4Vzyfai0keCQRuU94bfGkU/ygQW66/2b?=
 =?us-ascii?Q?e/X9lkUmPgrBxNe3w/R2y4YhvnMxdzdURAZkflIHarc649OXpOILRLt2RihL?=
 =?us-ascii?Q?YF2vsreKeNyXRJ/4RFqfEcAsAPGlSajKoAzE9bzPceW+Uv3KxxGZVOgrYpqQ?=
 =?us-ascii?Q?XhBoe5vuSL9P/TL99WGSo3Xq6PKlVkVKIzbhOdmfZHPoLUHkolCm8nP6rON8?=
 =?us-ascii?Q?+BTAAEL95xb9sPTIvE6bMFBPkDmlYBcOLbdQFfzFR5CwySBYFVeP4nEz3jmw?=
 =?us-ascii?Q?c+UVDWMCQKVBrwEDj3J8/nL5c6LHxq0tYYgtfXFUydR6Imr+H4g8cBaYOCbc?=
 =?us-ascii?Q?+ZEQKBQ68NBKEaYFAy2LVU7kyUxJrW/BN9jiC/mwQdKWMc1ko0hY3Tg34JG9?=
 =?us-ascii?Q?wKBKe9YXCdQITi+rvNUierCv5q5gZ51qFvk+QCyqyi9mVrnspFiT3MaKZds8?=
 =?us-ascii?Q?BP1/J1qy2itkGpLFQ+y4oFh3ZGohdAnPkTjblOVpqs4Y+S8WNGrjTEqaVGPh?=
 =?us-ascii?Q?ovDIDkdvxH+wqXqfbipUeeSvShTGYOQH2xDJeJW41zWA7HQ7Yd3WMTvQDXcx?=
 =?us-ascii?Q?Z8fyicDnAnRtTFLGQrdAThnq/+QwvkZviPwL+QzIPWCXp++dlFg3wFP05lqH?=
 =?us-ascii?Q?EtcEQ1gBhzEEl8+bsUIwOAnzcKUo9T3A4EhGeTxzTpcNVlbvQjZubjLO5Rj0?=
 =?us-ascii?Q?wJnrl7/M72/OMnh0RAJR9QYaHrIu9VNfV74qeqJ/chLJli6GyuCH38e6h+tI?=
 =?us-ascii?Q?6pNYZdBpmxrah59fBZri8OYw+2wPspk57yKluFayQCqAMFJLlAkHxc2Ed97v?=
 =?us-ascii?Q?ohaHqYDTwdhHglRrMaTSIBhBBZBnst/XYqGtKlBXplZakFuWGhgOgHBNUxD3?=
 =?us-ascii?Q?baP48x3mildgzE2ss2J9Vmt60/1mU0cA+J+c3RJ6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bbdd03-b4af-4830-f78b-08dd77f8c14d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:27:23.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4L6t4g1OPaySbPk+dg2nxjMyJ674U1lwNfAgAFiAVxocnQIMwSnZMwyyfacux1wCM4SJZXulu7zRN6IkFNb1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801

Add the minimal board dts support for i.MX943 EVK. Only the
console uart, SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
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
index b6d3fe26d621..2fe86fc6d73a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
new file mode 100644
index 000000000000..b0bb08bb67d5
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
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
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
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <4>;
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

