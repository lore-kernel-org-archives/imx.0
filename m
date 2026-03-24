Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48533AF640
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332888; cv=fail; b=S8TaATxJ7L6lYZnSbdduzhCw0r2VIj4iBq11FLDtV/JbE3V6rFRVwy5+MBfrQSoL7GLflak7GdYFcCHurFHFrBVIuWfX7oiEPL5CsQDdAJNtI+PrwNPn0WemcWVFggkXaOcROQsgfol5XFIIeEa9/W1aR2b/AgCxUGw9U/3llAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332888; c=relaxed/simple;
	bh=/uITnwr9Q+aCQyXkLyt000vDiYVHrKsJkgDGrvzeSNQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ct5JRpcQqEcxZzbn1kfflGNK4ou0SX6yMXKFd56+pOIDvJMRV6zQ935d3TaW13AtkTJJiaKKmFN2qtUoe84oXCu35ei8TlgGXpgj2oMJ+YoSK8rfFpNH3RkOysJ9qraXtYhlhza3NMQLRVdZ3udxhiorjvphWCk0d+Ns+6Sl/8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LAoHPjp6; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LAoHPjp6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzYXRVXc+2TsACR3KtBqmUC0HVDdEg2t44F1j8ajbJGkF2wlRAbc85Tz1du3kknDSFjZe8ng7pDbKIUsAW/UHhF4QoGK4nHBiex5yzWdcTE0/a3cgdI6Y2wO3wIzYaxzp6XCKk70xl8h7MsLIrXj5GPZPjTrfWjOFVPiza+YLAD7l8ckEYgZGdl8GNlgnp+vwVADW5pxGxFos5sW8FHWdYuy61HSu4U596uBHfTZv4EmECP7HxA5PoUjE0szRTWAYHhBJYnzIX1UGtkwMaZz+hx66A3fgsjQ31yxct4ZUTeYAD/L7rYJatNXgg2yTL0kZ8Hd3YPmfblyx9kX7G3m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtFurll/672bWwzx5h2fcD7G0XCbEsl7aR4A9SJXM8w=;
 b=Oiao44WcX9Z/C/lf3rYW+cqXtPM/AiBhcZO0mVGszLZbE9SSLRo2pV8TaqPKsGrj314wkbOsm5PWQ8wDQvzUckd6CpWYDDy28tojVNlNtyoCAI049fBVJJvRHUCiou4dvTParnDezDb/bLjaVmWgR2fghIEorj1PCQZViUBRUO/3ckx58fd9W3zhaan2X0KE8GjrzPC1tcTiQGwOf7snjBHTIunQ8FhNRsxmQWOYAAfPv8PtMKYFXbZ9n+JvFAq6C19Z5R19DfgvelFcNTry22z7jVq5C49KH7vDC3uWopKnRIyxkQFCT9BWcbqXnqNP6EBDgf2zrw5Pn4zJ8OoACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtFurll/672bWwzx5h2fcD7G0XCbEsl7aR4A9SJXM8w=;
 b=LAoHPjp65AKYwlnOW21XHqEHl1UcDQRAhflHjrcLAnikULSTVjR8hBzkZogKqgTmmtP8F5GtZ6vEvhGHSfntQZkMd8PaMb4OzE2oWYa+LGDBdR7AtRtg31+TqyORx368C3ThE/Jaw0tzVVCPNwNu0pL1h83Kk9bVWX485kU1uDu8iE36gdqBhdZxDCdmPfSNmaLbvneWRASZum/5Xm96jQi8zKxdASME3yqOgzPshOZnsryl9qxNKo+dtFEbN7r5KaeawvwyOav+tkpmIemQQfUjc6sbKDSdk8VR58RW6mn7ij4ReJhC2F22TMcOC2AbOe22uYSsrHvVNuDRxz9raQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8671.eurprd04.prod.outlook.com (2603:10a6:102:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:14:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 06:14:35 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	Frank.Li@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	maudspierings@gocontroll.com,
	josua@solid-run.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	primoz.fiser@norik.com,
	francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)
Date: Tue, 24 Mar 2026 14:15:56 +0800
Message-Id: <20260324061556.980621-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260324061556.980621-1-shengjiu.wang@nxp.com>
References: <20260324061556.980621-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fe3720-fdca-4e78-e050-08de896c9f31
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Qs3hl6RT1YGA7hKSQVeNUe3UCpgWfJDCPiivC8Qlk8qK8wlMsZZbIoro7riKF/6UJzFhy+lMiizjBTT84XzvL+HSQmUAX2KzsdeeXfKwUNrQd9j0VzqI3Faz2tbMYKUO5pdcZS8FNly99k4zWFpJl7g0PwLNsXe0R1i/YSifojN389Mrg33DuvU91J6tZIiO7jLazGekSoLCax6nsmL3mjTBdQEDy/QuyG6H4wBYL9uaKIiysQBHvJXZGQT0KWoJPrmR3X5jqyV6yDa83T3RTZU2/pnEypksRi/FsGzuy/e2NDy/BE0i0ZjMeGZVQYGNDVSe0dxrTNv97Pctp+RINuG7057yg/K9RBR6drTfVtSxgwHEbe9DuXgjpVJzOgRnFYsPSPJTyaBR46A9Dv8hue7p8GJb/7RVDu8pc3uM6Kxd4ElGNWLCdNkOafIVfNN6NAvkuzsZ1SLm6Kw9zPr4i0H2E9lnZcEp1zlv+V8eA3Mbv8uhiNOOQAew7GtiSHQWWzS6sNQGYyxnJMMjgb8T5Xwz4bNgMla+9q8LhKy/BVxDo7BUB3pdv/aOROr8ECOsA1p5pREfxWfO1Zsc3zmyTuOi0NBS+pU52wQ8AlHDGW67Q4uzeisQTIYT5a8XCCfQy6H9wYGLV3+KQnoKWccnH2h/pRDYO6r0bK3sbqb1r9sq1AHzOGJD7+TFSlYWwR4RCZwhcO5IJiRileYSUWueMDo7bem6bN/T5Z0hZ6IkVXBVITIs2axaqCkO+jy6GrsRLVKG1wV9I6YGoR1i3BNJuL5/e8Ebr5IVIB8F19+vVRCCbGnfXNj/LUumxPjHdvdP
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?UOHsxSY5fIySYV1iRcodGiKZU9i9KtOzbejI7Doruo3juing/8emPSaizUIf?=
 =?us-ascii?Q?lcY0SM06xwH0jup1agPwzSHPvFfQeI0MebcxYrEXUlpbd/ipsJOQv5V8wtAd?=
 =?us-ascii?Q?8rULD7kPen3cw4Faz4/HugkHiIlw+1QCvoypsrYb4adoynkCWb+4hEAN9UXK?=
 =?us-ascii?Q?c4hp30+fq2ReKT+cCqL210b2XmA798CRUNRs7OhMHz4ddLIHmgRAORLpAiEk?=
 =?us-ascii?Q?OZzpFW4dc5ohv2VN3l28x67rdULbJ/VxSwC1EU6K8aZDlu+VmR2owIcgMPZE?=
 =?us-ascii?Q?cRQyaj4338OmjHN1RPV29XBe2mmcm36Xpjw4WttumWvhJcfqjWcPhEhJY5bI?=
 =?us-ascii?Q?onMDvFSu60guwRC7UDBN/00umZACkCw+dKWZZzTfeOO+KhknKv21Rzx00P30?=
 =?us-ascii?Q?Ru9TZKOitsCfFoF2pqexF4ThEt/d0PTMkcJt6n3SVKS2Y99uquqFs59RVI+2?=
 =?us-ascii?Q?SA2FuB4f3MVMOP/PwBEWK425N1rcugOo9K3sAhdgmw6/g/gvATGioGr27CSu?=
 =?us-ascii?Q?AaEZyyLMVLKHwKxRgulOhpakmo6oc4o3xLK5swpDBxoKrdqGVyeNTZhtpRam?=
 =?us-ascii?Q?yDOUyntxSOHNxvupROU+uTDjbyHE//xO4pekhPXmOh8TYC5HWT3vT669l1q4?=
 =?us-ascii?Q?w7F5jEnaSPmniVuAn/jyp3mv4K985hZh+kbdc+5XxfPUZYnnMbPReJrTyTqn?=
 =?us-ascii?Q?zda1wVb3ww5yIogFL9Ud40T7mId5hO3kD+kdCZTHsYk6DsjsVqo0v4ryLnDK?=
 =?us-ascii?Q?EZbImgKXkZPdplNGuKWDQ0obzmPojhdC/S5+9d1JZF5xcF9Lq6XwvWLWWv18?=
 =?us-ascii?Q?8Z8dCMWbMVNfKMiZDQ8Nf8RauN5sxoKj8XoDy2tn4sc0VCzr3SSg/L7/9DyX?=
 =?us-ascii?Q?2jqsOxBa8tE/rePi90Jw9haw/XzGLRcOfYQa0Q5YTpZnmTdLBcCRdaCSOufi?=
 =?us-ascii?Q?teVEcut07oEYWWZWw5cLhT8qS555l4XeY3zvBjTBX+xgilHE62aYJ1xwQi+a?=
 =?us-ascii?Q?H5KdaCbQydD2irsaRFKNEIZjoELMx00FaJD3HHqR8cXO66nMEeItgMDa2CyU?=
 =?us-ascii?Q?ZCBjv8HfipzL8pV8sSrIo1QBHXyU6ckoa2xVjtjVJkWU+Fb5NE3a+OmdaW/E?=
 =?us-ascii?Q?7eaFMEYQOG1OYTlM4fvUBikCvmaLNsxu2pQsEw2/8sA6saiQtVAJmLElXrsp?=
 =?us-ascii?Q?/obqagdRfSwq/nv7klqPgYCTU6zr5NOATs+qPkPk2MSG+BoDz/B4+aG7pzGC?=
 =?us-ascii?Q?7/FpgrG4aMqwjTWuOBeYF8VIYzhpBGFg6RtocW55NKTh1PNc3oyqzo73QdSz?=
 =?us-ascii?Q?YdjJHoO9atbDIciV0qjD+e4eWLOVi7r4iDLCpluiQL0SEtm1SH05ltHjTf+G?=
 =?us-ascii?Q?uRvIZrBUVLVvFItPMXqf0e9XBlKNWzWb7izhT7inqGRpnhn52XqE8OVlwx4R?=
 =?us-ascii?Q?tyYKajFFKpfKRvwitU1OOiWIvAcJZdykBH+tFCJujWBOsJGd3VkaFHtcjPSJ?=
 =?us-ascii?Q?iu/MXQX4bw4Lo2j2aafVM2FBIJ/sqYZVkxcEpJFQZI1GdPq4QoBlvgFxGVXX?=
 =?us-ascii?Q?1YTxDUCjosIPv0ZobKpqB6sbktDDD9Ud/LZ8OApx4S6z/wzW38jTXh0FHHxd?=
 =?us-ascii?Q?2vClyu0N/t1Ue0+RjhwcHCphxvX8nbHxabN1nlMoQxjScN8sPi0vi/bGYC7s?=
 =?us-ascii?Q?TDRXDNL0V+dr/VXoprweDVtoCa5k2I05fakZNTOILd4Wydsp1KYlUMp0P4S7?=
 =?us-ascii?Q?CWuhVkDVlg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fe3720-fdca-4e78-e050-08de896c9f31
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:14:35.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHRdGJZFHKlEi/n4anDnx30ZBzHPwXq/O4/zUIttVeiT9yrw7TTGTdtTeWWFi6HiuR6m+Zhx76L1jzOOlYzHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8671

i.MX Audio Board is a configurable and functional audio processing
platform. Integrating a variety of audio input and output interfaces into
the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
features, rich audio application cases can be realized.

This is a basic device tree supporting with i.MX95 15x15 SoC and Audio
board (version 2).

- Six Cortex-A55
- NXP PCAL6416 GPIO expanders
- RGB LEDs via GPIO expander
- LPI2C1, LPI2C2, LPI2C3 controllers
- LPUART1 (console)
- USDHC1 (eMMC), USDHC2 (SD)
- Three DAC (AK4458)
- One ADC (AK5552)

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx95-15x15-ab2.dts    | 669 ++++++++++++++++++
 2 files changed, 670 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6..5b0fa6c24877 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -458,6 +458,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts
new file mode 100644
index 000000000000..f6829145f396
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts
@@ -0,0 +1,669 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx95.dtsi"
+
+#define BRD_SM_CTRL_SD3_WAKE		0x8000
+#define BRD_SM_CTRL_PCIE1_WAKE		0x8001
+#define BRD_SM_CTRL_BT_WAKE		0x8002
+#define BRD_SM_CTRL_PCIE2_WAKE		0x8003
+#define BRD_SM_CTRL_BUTTON		0x8004
+
+/ {
+	compatible = "fsl,imx95-15x15-ab2", "fsl,imx95";
+	model = "NXP i.MX95 CPU on AB2";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		stdout-path = &lpuart1;
+	};
+
+	reg_ab2_ana_pwr: regulator-ab2-ana-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_ana_pwr";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6524 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ab2_vdd_pwr_5v0: regulator-ab2-vdd-pwr-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_vdd_pwr_5v0";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_SD2_3V3";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			reusable;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+		};
+
+		vpu_boot: vpu-boot@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-ak4458 {
+		compatible = "fsl,imx-audio-card";
+		model = "ak4458-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "akcodec";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&ak4458_1>, <&ak4458_2>;
+			};
+
+			cpu {
+				sound-dai = <&sai2>;
+			};
+		};
+	};
+
+	sound-ak5552 {
+		compatible = "fsl,imx-audio-card";
+		model = "ak5552-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "akcodec";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&ak5552>;
+			};
+
+			cpu {
+				sound-dai = <&sai3>;
+			};
+		};
+	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "micfil hifi";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ak4458_1: audio-codec@10 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x10>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "0";
+	};
+
+	ak4458_3: audio-codec@11 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		status = "disabled";
+	};
+
+	ak4458_2: audio-codec@12 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x12>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "1";
+	};
+
+	ak5552: audio-codec@13 {
+		compatible = "asahi-kasei,ak5552";
+		reg = <0x13>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 3 GPIO_ACTIVE_LOW>;
+	};
+
+	pca6416: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpuart1 {
+	/* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&micfil {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_PDM>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <49152000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&pcal6524 4 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&sai2 {
+	clocks = <&scmi_clk IMX95_CLK_BUSNETCMIX>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI2>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai2>;
+	pinctrl-names = "default";
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai3 {
+	clocks = <&scmi_clk IMX95_CLK_BUSNETCMIX>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI3>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai5 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI5>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL	0x40000b9e
+			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA	0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO30__LPI2C4_SDA			0x40000b9e
+			IMX95_PAD_GPIO_IO31__LPI2C4_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x31e
+		>;
+	};
+
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_PDM_CLK				0x31e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_PDM_BIT_STREAM_BIT0	0x31e
+			IMX95_PAD_GPIO_IO06__AONMIX_TOP_PDM_BIT_STREAM_BIT1		0x31e
+			IMX95_PAD_GPIO_IO12__AONMIX_TOP_PDM_BIT_STREAM_BIT2		0x31e
+			IMX95_PAD_GPIO_IO13__AONMIX_TOP_PDM_BIT_STREAM_BIT3		0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK			0x31e
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK			0x31e
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC			0x31e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_BIT0		0x31e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_BIT1		0x31e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_SAI2_RX_DATA_BIT2		0x31e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_SAI2_RX_DATA_BIT3		0x31e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK			0x31e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC		0x31e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0		0x31e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_BIT1		0x31e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_BIT2		0x31e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_BIT3		0x31e
+			IMX95_PAD_XSPI1_DATA0__NETCMIX_TOP_SAI2_TX_DATA_BIT4		0x31e
+			IMX95_PAD_XSPI1_DATA1__NETCMIX_TOP_SAI2_TX_DATA_BIT5		0x31e
+			IMX95_PAD_XSPI1_DATA2__NETCMIX_TOP_SAI2_TX_DATA_BIT6		0x31e
+			IMX95_PAD_XSPI1_DATA3__NETCMIX_TOP_SAI2_TX_DATA_BIT7		0x31e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO17__SAI3_MCLK				0x31e
+			IMX95_PAD_GPIO_IO18__SAI3_RX_BCLK			0x31e
+			IMX95_PAD_GPIO_IO19__SAI3_RX_SYNC			0x31e
+			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0			0x31e
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0		0x31e
+			IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0		0x31e
+			IMX95_PAD_XSPI1_SS1_B__SAI5_RX_BCLK			0x31e
+			IMX95_PAD_XSPI1_DQS__SAI5_RX_SYNC			0x31e
+
+		>;
+	};
+
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO22__SPDIF_IN				0x31e
+			IMX95_PAD_GPIO_IO23__SPDIF_OUT				0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX      0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX      0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+	};
+};
+
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1>,
+		       <BRD_SM_CTRL_PCIE1_WAKE		1>,
+		       <BRD_SM_CTRL_BT_WAKE		1>,
+		       <BRD_SM_CTRL_PCIE2_WAKE		1>,
+		       <BRD_SM_CTRL_BUTTON		1>;
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "host";
+	hnp-disable;
+	srp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&xcvr {
+	clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
+		 <&scmi_clk IMX95_CLK_SPDIF>,
+		 <&dummy>,
+		 <&scmi_clk IMX95_CLK_AUDIOXCVR>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "ipg", "phy", "spba", "pll_ipg", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SPDIF>,
+			  <&scmi_clk IMX95_CLK_AUDIOXCVR>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+				 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>, <0>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_spdif>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.34.1

