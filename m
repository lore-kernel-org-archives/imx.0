Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCC3DB651
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719314; cv=fail; b=KaKxe6LhEpkg9360/95rLJHhI3NdsLzuLmaDMFq8jR2qsgsWVLnrd9J63qb9vJBP6c3aovGk3YQ40rw/zumDG6zc78FBfYxvdUycf38B24ooUywcDOoB+fFCRYuDaPYt2A8AZ/eZS+6nUqYVCmxz2mIX0v1DkUurHqXAC0XTtEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719314; c=relaxed/simple;
	bh=1usy4JHCj6fRo4ec+O/igmlRRhnHUt1xBKsjsOMdUAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kASOswMeDQ1yCKOgNaHNQUVausDzRVcyloT3LGJYqrKzEbLTC6JtldtJykXBF0wjQlzifcmTfS0zuSySMea4WmlJZNEwjah87B4WVIB+nvEw0vscR2ZGHELE2W3bLp5XBSN+OQ4mfh5BpbwFfHvQkmBwE9N8DXHH0hNNe+99OBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r+fYN8Wp; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r+fYN8Wp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9Ed5j8hNl4d8AvUnyGWvjAfrOYRLE/VMX0XHFwfO+VAEp+7CVby3Rsgh+O5UCAteu1B/MCzuI7odElb9gDt9UoJETewZ50Rm9g2kMeWLraPg2UKRXJcPdMMs9VMz3RFzkiHtJ1S3aNe6JTIEBflWdzhwi7JwvN1vtSqLS822MHZ9bT/pLdFfrzmk6QqxZONHjswpndQS22qxEZmlNUtMt6v7PyYoCbBCBCDZ57REUebjixcAD5Xa0PY4whcL48sEI1va1+e1rMgp1FhoSUfBMuWb4EDp1ihtpdmK4D1LYLa4tS9pAfIA0CXGcONGy3vRTG4/cK0nW/bSLeZ/fs7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEa8kPpUCj7rcCD7ijUMPoeV7puoVbelN4G7TkDPWQQ=;
 b=HpzR+8Rv3z3JbZ9OTDXokFBuRAAUZYZgJrom1yG9LzAcwjhxStuRyxVMK53IT7jZjZ55X26Brnco9UPKuAn24h1zxyepEd6lmbbLNxuMF0f4rQlNLE4FYhHtukpbMqi9VVe+5QZLqBdma4q0Cyt9cqjicZUJH/pQ9ADYt0OHA5Tuy6t+/fRByRSdd7AhWdMRuA5xEl28QMyptFn0Rnffiyv2AOD+l7OxIerD5sbKmQVIwvYN0724LiX6hGTgQXN6UWQkLiQafnfpjmQBzkB6E4gHtYUHIUb9G1M9VM7y5nF6GXTHRCh7zqvV10doXEOwKz0eVASG4xuMGzsYM0ItdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEa8kPpUCj7rcCD7ijUMPoeV7puoVbelN4G7TkDPWQQ=;
 b=r+fYN8WppNMo01v8P7sdokWVNvxjvEd9ldBpS+3iYgfPAf3iDP0iwINkSZPxfK77PL1uvOi4xV/tSG/3n1bcekOzV5HhmUA8Ax8bzoGFckguec6u31tdJ9C51ClCnmSohtBDltiujmUWwvUJnn5czJmMausqPd98gp/VdkZVp1iysU8gocyaP5pTsyOBcj3Cmwqf7PvOouSnlDhk2UOrBz0QR9nAnQRs6kyLppQbVaoKuK8t1Ci2aBRnqvfSeq8CODoL5lZ/9Tt1GJ9y6Jm3qH+AyV6AjOHLbpNERnZHRGQpJZ1r7Q5IhwsdlYfrIhY8EZbfx6aqS9G1APo6QdFKiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA1PR04MB10553.eurprd04.prod.outlook.com
 (2603:10a6:102:485::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:48:08 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:48:08 +0000
From: chancel.liu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
Date: Mon, 29 Jun 2026 16:47:34 +0900
Message-ID: <20260629074734.3643227-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0137.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::6) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: 735feabf-80b9-4657-5992-08ded5b2c2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	VaZSRlVojQLdRxRR3bX+vlfYwhM7QenKtHwUBS7s0GYWhFnROrnpzfBUWMCpG6/3AHTr5KagGKTYtfGurQQ/ZuNxcplN7z37VhPxRk0e/wEKI7lyY+jmn760AYiKNjqoYBUld7gx2FWNhGi3citSXjiMjh+0zXFlxBt7hx3Z/zuK1pY78i5yMfCXqJNXzt0KrvTXkzSrBJHD+OCQ40C/0feGAR5H3469aUSHPP3N9vV446JXGgcDzdwVCIrDlMdf9RWN+6vRefNMy3yTUjYYTt5e6MzMFlJbODREFOd9cNgNh0XRhPWeWVqPRoPk9GgMvQP1EFVbAb+LSDA2EjeoSFp8H76xpUN/tDcgciKIsoGkBgxsanNtfF3qV1xWia2aAHS21e1ovUdfWMBL7OKMjQVJYte8wWRlXSJ+U3x21ip09eqDg4ynHYnB866ffqSr4UChwen2xSEmJ1HlUMRzAhSGYA/Wc8zgv5H2eN9bxixuMuNMqQv5qapnOU9VOteKbykbu9lNkRtd9RhMZOrF60o3wba/8kxbN+heCuDgJxDY3T7kFVjejybN1hvCkCRWSz+6tojg9h7YMz9qB9NlJh6g9TeVMNHaGshoAs8Ts/i0K5SctNi3h6NbAXK5kiC8haGogza338Tz0UK9QUcmB9pvMCBE2rWgtSkRTttQFjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kkHKSFNehgEb4Gr0tXLklQoBZCJOvML7WNgfOtxh028IiyQqCXwd0R4hjcZ+?=
 =?us-ascii?Q?L1dTmVrGKXmJ6KWPn26aKLn8Zcz19BbLnwGZLC3zsHU2Y0W7BgAo0WWbNGcr?=
 =?us-ascii?Q?2ZoMbOw0VGwVVI+tevxZ8X25saT69PbiH2wyvQwiJ48cGaWEfI1jFxYZ/Vez?=
 =?us-ascii?Q?3s9xIkdiEAglqDSZHUTtRSneKomw7MnOFnUMIFk5/s9hWa4kI9IjQW2R4eNT?=
 =?us-ascii?Q?aXBQzTf3nHBITMut6UwD+gCT6TGMT0QBVF2JZ7DSuyn4Y8bSX9hDFX5sWEfb?=
 =?us-ascii?Q?qXW+t9Lx77xsXK0v47BzCf/w6XJxb5ej5aQov1fU39gE6VwVqUWO4CqIV6Wl?=
 =?us-ascii?Q?zZpj7z3pRRF9u9RTMKFQdMrxS5V+wd7KomUkyXy0WPDla4w04NqwTLmlbitC?=
 =?us-ascii?Q?HQKI1pBAGB4/sUeZGLh32t7MGq3t45HV65CqikuwRLy7zX+dr0JbMu2hniIW?=
 =?us-ascii?Q?Jqbo2X6nalbGBbDw+Jhs3N+ge+LvMNVFEZOozdAa011uvtzL9xdT1C4oiZsp?=
 =?us-ascii?Q?gG7tPwgNiAZKzMa4HU16TP3Ox8GGa1nG81YGBDZ/K9AY5tvZQrb8juptfj1C?=
 =?us-ascii?Q?Js9JpVZbjtBnAozFLAshkRhgIls0BvF48UQ55O7NI/gD5WpDuVOQg9k5QPgl?=
 =?us-ascii?Q?xjXCb6j0U/WbsSZVuPkpLL7MY+UbehHhDxOmwaoFShoBJrM2L2aqiqRD0CIx?=
 =?us-ascii?Q?eKnVSYc7lS9y7CY9PNuaDcF+xlnDHq7+3R9tiH7eScEfYpsQSPUa5Xhvcgir?=
 =?us-ascii?Q?dF2SfJF9Db78cYLC6o767KCgxSN5geVc7tZN/G4oVuT6y4WNeFRgSSdgGmcL?=
 =?us-ascii?Q?cfgVcCaJ0mUuhVah3GcjsA55iJ8ZXTj/BlOoYL61vMRF3D0+PXXuF51+befV?=
 =?us-ascii?Q?gB45mlHelpZLfkotEmXGAbo0nrNVt/JnzXhpeHM5HHC7mFdgrFSUTir6g2UJ?=
 =?us-ascii?Q?preXL6f2lj/FN1YZykQIWRoNLYsDKMgb1DDHiACnnufdo1X1CwubBMQxqqUH?=
 =?us-ascii?Q?Gk53ejKO3BJEGJ5B7nBPS+oQ3rCcwk7o4WX9ORyNiJRIIGSCOimgUb4IAwVC?=
 =?us-ascii?Q?KVySGs8KjIVC/KP6G1yGML8ECYIZ0q1RKtrBQllC4m5P+yW5Hfx8bAT0+nxm?=
 =?us-ascii?Q?eNUYPm9osm+YnO0nu/cKXa5PMWA9MfeH69Vhs/70x+Nr2F+SKQOgx2wujks5?=
 =?us-ascii?Q?9TraOYIjvCp53g7sk0LCulDK/b58iBgk46Bi+0xpuPOLpuwlqb//nHVTrjHI?=
 =?us-ascii?Q?xCzeh10gv1yq+u3b5W81q3Y1X6DT3eihq7M50RI1R8VEeppl140S/P3xrb0o?=
 =?us-ascii?Q?i5Mpgmxv4L80idabhqnvhrMVZswurhj23PbwBZDTtpcodIqXVvic5vfclsDz?=
 =?us-ascii?Q?T9kpqeLyvJjTsNGEuKsrztgRRO0Qk5P5gt1UNIcIpbMPWFHpFX/2Z0RK/Mt3?=
 =?us-ascii?Q?G2LMd3zHNY32SQOb2uemYtWhuQinvtwMeVM+H6eg3Ccdaj7i2QVVJIUytZs8?=
 =?us-ascii?Q?7hS6h3RYgrkXfHNvtKwRXIzVPSyQNQJKjv/dOfRcNrsOVJoJKrxlPGDs0KUg?=
 =?us-ascii?Q?Wow9N42bXUNphQzNXTUtXvpxnSBoXkBd/uWzVHa0WRdnvvy4AdK22XH97LXN?=
 =?us-ascii?Q?VwnV/XukRy0GBpCJ16P9VZHDUxj+dyYXLXnjt/wGnxTKeXDgd4mQEU/ZZNqw?=
 =?us-ascii?Q?mDOw2A4uHiiLUSVBNWaB4PSLMB7wv8W4Egbo0TnebLbxBvKBtq0EYY8JZ2kU?=
 =?us-ascii?Q?MrW5TGnIEFc/x0NgzxAwYO2pW1Y8d1ZP4Q4OpJJzsqAkN6b33viu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735feabf-80b9-4657-5992-08ded5b2c2cc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:48:08.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNwQMMUpnAkvbEZTs+ZWc+bwjy6E0iXvzTQ+hQ4yTRl5wYPLUCYy8WMutoklHzBNnb7U+zhPdsiGGpppWBcci0TMOtSYzUjXSakkP5aYeUjvHmuU2W53MRjCt6iMtp+X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

From: Chancel Liu <chancel.liu@nxp.com>

Add common DTS overlay for the IMX-AUD-IO add-on board[1] which
connects to the base board through a fsl,aud-io-slot connector.

This board features a CS42888 codec providing 2 microphone inputs, 2
line inputs and 6 channels audio output capability.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 57 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..f2417c20300c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -672,11 +672,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+imx95-19x19-evk-aud-io-dtbs += imx95-19x19-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-aud-io.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+imx952-evk-aud-io-dtbs += imx952-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-aud-io.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-aud-io.dtso b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
new file mode 100644
index 000000000000..311b7f984576
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Device Tree for the IMX-AUD-IO add-on board[1].
+ * It connects to the base board through an AUD-IO slot.
+ *
+ * [1]https://www.nxp.com/part/IMX-AUD-IO
+ *
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	aud-io-sound-cs42888 {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-cs42888";
+
+		pri-dai-link {
+			link-name = "cs42888";
+			format = "i2s";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&audio_io_codec>;
+			};
+
+			cpu {
+				sound-dai = <&aud_io_cpu>;
+			};
+		};
+	};
+};
+
+&aud_io_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_io_codec: codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&aud_io_slot 0>;
+		clock-names = "mclk";
+		VA-supply = <&aud_io_reg_5v>;
+		VD-supply = <&aud_io_reg_3v3>;
+		VLS-supply = <&aud_io_reg_1v8>;
+		VLC-supply = <&aud_io_reg_1v8>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&aud_io_slot 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud_io_cpu {
+	status = "okay";
+};
-- 
2.50.1

