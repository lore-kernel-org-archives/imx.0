Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A109369992
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863400; cv=fail; b=ejA3RsRUTa1LmnNyMbg+rPXuY4F8TvesQ6EKaUcQkrrwosZ3dRDO0NIfVwIE1PSb6N+bGmMVami5k3DubEzJJ4Ix7FKc6TUVeylI4R07Sp4wEbZObWPeXt5kLA6uZqf/t6x2rK9N5h41vRZwscmY7hrPRxGvAon+FLMEFg925Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863400; c=relaxed/simple;
	bh=NeIUtiFAi6rRm9klPyCcS4kVLGqtPayyFpyukYZZm1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qZQ3BUlM4xIqJ6ioGperxvLejcUAl8PMzUjI1Dwrut/v0q0ujER5nkAw0MKYmduWIMkIR/It/jyZNnT618n6BbXjvPsTAo0sOwhbcibha03zHQEVNrWu4ZSpA7CPkK9ch0LhL1gPNo38nqsMq30rrSL9jQXUYeJhsC4+a+93eBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jPXpu32t; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jPXpu32t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=masJ1fSbsKYtc+bbfRqrfSBhazFlq3WjZ2c3ONgRHrLNwA6ypRiVRckDolxEoaobr4g1x3d2jvCNyy6tNU9wt984NbpJLkREjJcvg+JC3xWJltZlO8SApMPZ4ltCx1FoF3iBDGU/mYfHlnKkaPGP18oXyY0HslaiB9v3ukN9leottQQhW4Hm4T7WIlj8nTmLi78OPZUJRuJ74+V68QAA/LUYwQugDknOq26vI0HEkOxFnWKcPRA8QzO/NjjzmkRBvH0VfOWgM82yH9cnSt6qzdHLKK7A3H8TZl9jEp4DY2jsicPxcZh9QRs50Ai/8EKZAXjywo7b4asMNWwmCvKH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbxriBP1YReAM35Af2Hbu2zwyDxWppCSRwO3OfE1tio=;
 b=LTgmhI6hvzoioGTMyjhZIq4SAK+SSzBKs8S55Gxj5bW8bVw4rst16nHeWoa7awmNTxMktvkQcb2e7+d/lw31m9CqYP6q89mFNBZ67+GsxPXESvhduZOI7iQ4+gPmhPwEkr66Zxach8jPJICpIWQyEF9N8URk3wyaz0DWMBEamdsii0m9MMErLuJPH6g/nfyOUuUGUWb4KbOnMKHXV+LKv8wL+VO1QXILQOwX4UlDnPWC4QMtJDYjoEMeX50eGzJtLl4LZTU8XSs9ildMSmMOYMVEBiYDknPwVF/gB1rT+oUB44WX5ByVh2M14H1OR3252Ms6tTfcmgk+uAeSHcpB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbxriBP1YReAM35Af2Hbu2zwyDxWppCSRwO3OfE1tio=;
 b=jPXpu32t2oyoqknE+lON+GlIswxSxBKbRXxwEDVNRzb8kxUXExNABij8TxpJgMda+w9NzP9T/pSQIldnBOS8XlJHSdWVXLTw9QoenQC+WemCnPaLWUs1lGT79hOT5AuRPPfNWOtYsLdqBgaXBKYCpVS4I1TwWrQXpY63db9ArBGZWDglD8guMuRGH0U2wvlTVH7Nz6tXraWccmcdo7Hy62cJ6UUn6BPzAeD/ZzUBuklHVbiGOCreN+/kyWOB2XNK2Sz5X973golOGcLqMlQov8dl0dYbzbunmuq9xgkLJIwLmWas/Vl03DT0b1NB0gfmqkaRieFIUZx0tqcP0aYAzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by GV4PR04MB11425.eurprd04.prod.outlook.com (2603:10a6:150:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:03:10 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:03:10 +0000
From: robby.cai@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	kieran.bingham@ideasonboard.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: imx8mq-evk: Add OV5640 camera support via overlays
Date: Fri, 19 Jun 2026 18:05:31 +0800
Message-Id: <20260619100532.3779934-2-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|GV4PR04MB11425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1d0a17-b95a-4e5b-2e77-08decde9f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|23010399003|1800799024|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	njXvsk1dpgU571cH/04Zx1sQik0HT2sCUhRwzCp39BT7F1F6r/l90SnSQwH3Rey2F9CVUPuc22hIvv1pdWiYQ0oLGU6hDQHKtkrLUR5A0FhqfPzzEO10Vf2qNuQ1ykm+dGneyN0+xEBFvvW95pNlNGBGh+D8TUjZ2Jpz2tUyKSk673Rloq4HqFOUB/QGSRgaHskDKJFXBlj8iAc9YYmIl51SO/gqnwMXWUmCrjlY9i2gvL2WxcodA/v9rvtiRjk1XwnrYBF4Pq+2gazu449Em85qPNbW3Zxmcz62l0czbsw5MM1B496EVfNGxd7b3/nJ0dJbOPeUBb5OzlKD7DLFYcIhbdMOKfGD0BjCprpDLn8J4xz+yXPr6HGK/XpTtJXbi4TPyN68u3hBSpvhsBnSCcft7mPUMvfDGhgkvoogzDtyjfZlERjCljEpw7xd1/oldVdDpGXvf4SeREFMD8xmN7kcnSAEKHo0kQLtzfbXYtJP6vpfOKT4yJkk1V4EbWyP7qxI9SNs18gpYdl6Y5EYQ4hxoEqmdYu21pOh0fU5x3wANG99Js9wbISI4dRytTovflUF8xMg/4ZcxY4N0y6WZzWqzQC7Yq+bofoHGXAAQ8WrGYdsS0euUIJHYqK1ylHw8tmYM6iGl6Z5ra2g0GvHGMI7SdnQyVQZVQSnTJcIB2T0T1OfkxQhuE2y5tNQECmMhzv+j8VyC7+KvXIZdWa3Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aO/Vl0rgZ7QCMHQDpJ9374FeFQywQfLhJS9dQJQoXRAgkaKoUURuyxIHs4PP?=
 =?us-ascii?Q?oOwRJZ3uTiGH5aWqAwNC2Cq2s80afjSeyr6OAYqoQu+fJKVzHvlpG/gVCv81?=
 =?us-ascii?Q?JqUGGBbMOBw8B6f24bqOr8/QCa+SFN9WikEToCNb8x/lXm5Ql0XTG0U0a5LC?=
 =?us-ascii?Q?IlhbuHVd8GHKQ+8O6swGyFT9JeFN95fqbGpZ5XEVyWp5i3VfToMcPF9LTSTb?=
 =?us-ascii?Q?vEsbJMuzHdfYNHizXiFR4x586Yd3MVjWb2jLKQ8WL/yqlGrGxkhHPAVWcqHR?=
 =?us-ascii?Q?HifMZ79RqA/gzmMJIoH+wkfE/9iJegjmRKY7KDHqpJLPQx5WoIym8D8bbmp+?=
 =?us-ascii?Q?dN8tXFpvNTA/ufUbKY8P0kyoSe5Mvc14jCGJ5FDFyQYje4NfMbNsq8wBI+qz?=
 =?us-ascii?Q?skh593VFqTLLr4+sAUKAmANWwdOHYQuTyB1Zgarf0kNt/9BYQjvThQvpyHq/?=
 =?us-ascii?Q?enFuNJ0OysXQL+U6RAA731/GbOdDioHUE2tWzT80EuYXD0KlJJUiTHRmSoKE?=
 =?us-ascii?Q?Lm6Ih4XjtPUwooqt/y1DXLzFVXaGhiKkSvwBEWWpXtUXzdQ+0L6Lly//W9Jg?=
 =?us-ascii?Q?cZFmLUftR1M9Ti3RNrUVZTFleXX07PVBTpSNwjo6ZFFV0+CMnau3qOCvGqq9?=
 =?us-ascii?Q?CxYUoZP3FP6UrnYko/N2LRQVqlc/RnmeCLRNxW/VvilYHMkczj9bvF8qG0u/?=
 =?us-ascii?Q?S3bcGJpDMdAE2cUal9GqMvTetNNZa6QmZ9FtuDO/XhpK/9ImVW8BmnfmvD61?=
 =?us-ascii?Q?KuEiSR8gdfemotkkmHt2F7dr4ZYluTFcIjFYEPvVSEEypfmFnTchT5Ra+dP8?=
 =?us-ascii?Q?DdzFMvayJQ19BRZfGa0OINHkEdn7iUnAu7jzuWIIbAW93wlB78nx+4qbx+t0?=
 =?us-ascii?Q?0gsg8gkiswWR/ZfGDI5X3PipatmyO2ZNU7GY76YzclVTZ8yb60FPgBJDZs7e?=
 =?us-ascii?Q?nv3wBaLQ8IHC5ehVO16nb7glrG0nhWAP27mz3z/1qizn1WGwkWabUftbXMvv?=
 =?us-ascii?Q?VmEQx/c6wuwwin2fuqIJH1adPe4JXhlltD/o08ZwACRDKd7cbi1sw7cPaluC?=
 =?us-ascii?Q?69dJImZaC17FjdRvPUpasN3G8TXBGc9DfcXLr5yXbjbUgXQDGUwWHAf3Gmo4?=
 =?us-ascii?Q?vQ1KbUJDewdLdQToH4RrPDQ4Y7wwDesP62uAcJsHJnRBMwcwBlta1Vt/0lzt?=
 =?us-ascii?Q?dYJ51fheJvhRrwrabSnr6n5BZZPMXLuvpvSVecaPW2LZytYcOFV4he3UPbsI?=
 =?us-ascii?Q?bTa2LOaq+BTPx5UORUm7E5XCrPaHLjlD6M848ASsCPg8nhHKZZ9NxN24BcxD?=
 =?us-ascii?Q?W5RAJhqu1phwJ6j4g75QP6hpqChGul0M598NeXc3MPWfotK8/BnZMVc+x79n?=
 =?us-ascii?Q?DQgefCsE4dgJ1sxlnEEQ7+rRux7o9BGNSKCjQnm46jfhH8vXcQsJhIzFX3zd?=
 =?us-ascii?Q?UKUjtk4+KJX1r8oSWp+kC+d8328bGRJphZxtSIGyf3hSh8IMdBXTrxvY+29X?=
 =?us-ascii?Q?Qj1uIXFP4WxYTlUPpvAZjcCJwBQwDNUQcxIdur1p3FlSpp3vHlhTqsa3+LRt?=
 =?us-ascii?Q?OKA4EvzI+3CTsoYG/FcIop7nWq/OtauSPYt58eLgpKV320P+SwKZpuLPYRkf?=
 =?us-ascii?Q?pvSZjNIrSNxf1XTfp9KddISyLfiPFtpe1FMV90lHUCTFnWONKXjoOGc6n3/k?=
 =?us-ascii?Q?pIcLcvSpq00MOVd0awty3cxGFwXwmB7COGFDHSCbjusNOduA3vUUcJIGIlv9?=
 =?us-ascii?Q?MSNBGekh1yoU3iWq4TJH864/oOD/rBVuVzocplbzwEUQfGLrAN33?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1d0a17-b95a-4e5b-2e77-08decde9f7d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:03:10.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKLKyNwztU0y8OZ9PyN1lXZuAefgBY/tVHHAaSBWOq2ESZYodkAn9j72dQJkWFjc2OAKfIWgXSgXeyuVkKq6FQ+zlSPPx+n+BnRGi2sSeqyd7G02m/wdglH5cFbGGzr0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11425

From: Robby Cai <robby.cai@nxp.com>

Add overlays for single and dual camera setups on CSI1 and CSI2, enabling
the following media pipelines:

  - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
  - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge

On the i.MX8MQ EVK, both sensors share a common reset GPIO, while each
sensor has an independent powerdown (PWDN) GPIO.

Both sensors also share the same MCLK source (CLKO2), configured
identically as required by the hardware design.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  7 ++
 .../dts/freescale/imx8mq-evk-ov5640-csi1.dtso | 69 +++++++++++++++++++
 .../dts/freescale/imx8mq-evk-ov5640-csi2.dtso | 65 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 50 ++++++++++++++
 4 files changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8ddaab127ab9..8507cbdb5556 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -501,6 +501,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-pcie1-ep.dtb
 
+imx8mq-evk-ov5640-csi1-dtbs := imx8mq-evk.dtb imx8mq-evk-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8mq-evk-ov5640-csi1.dtb
+imx8mq-evk-ov5640-csi2-dtbs := imx8mq-evk.dtb imx8mq-evk-ov5640-csi2.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8mq-evk-ov5640-csi2.dtb
+imx8mq-evk-ov5640-dual-dtbs := imx8mq-evk.dtb imx8mq-evk-ov5640-csi1.dtbo imx8mq-evk-ov5640-csi2.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8mq-evk-ov5640-dual.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-kontron-pitx-imx8m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso
new file mode 100644
index 000000000000..1e9931802cdc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mq-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&csi1 {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera1_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+
+		port {
+			camera1_ep: endpoint {
+				remote-endpoint = <&mipi_csi1_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&mipi_csi1 {
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in_ep: endpoint {
+				remote-endpoint = <&camera1_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso
new file mode 100644
index 000000000000..fd247b3b5982
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mq-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&csi2 {
+	status = "okay";
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera2_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+
+		port {
+			camera2_ep: endpoint {
+				remote-endpoint = <&mipi_csi2_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&mipi_csi2 {
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index e7d87ea81b69..d8c139c9128d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -50,6 +50,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
 		enable-active-high;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "DVDD_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	buck2_reg: regulator-buck2 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_buck2>;
@@ -542,12 +556,34 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mclk>, <&pinctrl_camera_reset>;
+
 	pinctrl_buck2: vddarmgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
 		>;
 	};
 
+	pinctrl_camera1_pwdn: camera1pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
+		>;
+	};
+
+	pinctrl_camera2_pwdn: camera2pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19
+		>;
+	};
+
+	/* Shared reset line for cameras on CSI1 and CSI2. */
+	pinctrl_camera_reset: cameraresetgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
+		>;
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -575,12 +611,26 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL			0x4000007f
+			MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA			0x4000007f
+		>;
+	};
+
 	pinctrl_ir: irgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x4f
 		>;
 	};
 
+	/* Shared MCLK for cameras on CSI1 and CSI2. */
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2	0x59
+		>;
+	};
+
 	pinctrl_mipi_dsi: mipidsigrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ECSPI1_SCLK_GPIO5_IO6		0x16
-- 
2.50.1

