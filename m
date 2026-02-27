Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1971E570D
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157459; cv=fail; b=tEALGII8wXgMcWjgQGYQ+O4ckRAqjBiKUsDh5m9I7NcWFmGgrqevvluRv26VYaofK+3pz7ScQEbg+YuA/i2fbS2o/gB2gdFLLw0+FwizDTG3qn5Ozu+fQWwQBE8Q3+3sSGI/Ic10IeuXXXlgQkWxbh4mWGfW0NQZBfVbaP0GHOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157459; c=relaxed/simple;
	bh=xqQhwwZ5/0m0vO6egC5VZoYw0EfnL8ZhoJ4dWP4Cuc8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qX4N254JA4SIZ1wvQKj4suO7TbH12Fn+j11diaxxMBh6w+fs5CX91VQEjB5VCE/FPgZLmkMNFvw2NTZYXNXqTT70zbFnBm3KrrySdZxgOiZljRLoGV/ArIQNhGxIsWnnu6jjAliVeQTKSdyFxW8aMt0XKRGm9XxsGXqDGH0Xk9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WF8FZj8O; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WF8FZj8O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcHhXz6fHrneV1RT4unPHKA2EtnNGX4UcP0KfnQbn7Lc7EPWLz2HP2VtBWbgP6i53DrvatHnW5EdxpC8I+vXFYu8l06Yf9EmLro6hre1dMa506dmKRmSlEr0NdTPfhcAokZBsyjSQmm84a5XNmVsHf64z0QLla85zJYi0DCp+LXTlDiuUYeyu+lth1Mq/ixyIlHMUQmsRs72vFPKZ99Jqzh+TfgnDHTr+XU3nfPC6HqvZ0vjUObEAYPZjueQH1s2cfTC3Ynog3KiT00UkHzdA5TLb+Zb08jbpngXjiHXCtdkuFoKUpnD2+P/iek15FobCIeN4qUJpZrMjBQxAjg/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjT5o9Di8LfP0uDZiBRu938p9hqFnQ+BiwIhNcye0tE=;
 b=UGY6VNG4sGiD2Gd1PFnJrRFMbvX+uqssFWrh3hg1xTwASxFlHRwVFKfG5D90THFAoIJIIqod9MHAS9fvCNcteSL7UXHH2MoI2cVSOIsHveOqF+0OX4VDSJhOAOEwrfXAxQDZ07RfhcMwMoWHOqbm/txDojis3sWSOtNffPP0/yGD4tImmP+VVpO/pui/rqdvxo2hQRbz4RyDzj3pLAQa4jNCnwo9NIf2KCpz1wI4aiQvoFZeg2Qoqae18jY152fbnw2Dfr9Eox9mKgcy93aKEOkyZFrlCr7YbbnY4pEtXwPXstCOgCgl7zzIxLvZOoQL7XsAuvTSoOhPkEfX9z7HBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjT5o9Di8LfP0uDZiBRu938p9hqFnQ+BiwIhNcye0tE=;
 b=WF8FZj8O6c+Y3newx017hvvJPn9lXa1bGKrgL2ObsUcbHcYIRMKrbGMYuZIcACza/eY7rztsANopU7eqxW9zxLwmSME+6oUvsCEGYZ98IGN9Nm2ksd8S8gGp3WSZOkt+UFoNoDGmJgrOBnNg2gNz1fL8DhivioGJ7BThahU82liBCowzTbtlR9tNNTe3K++3zUhkW6P33SDPsK54rMxHzEktgodm8mUwZ8nOYdWDALd26exeXL4Wsw2ilAF2BoGcG+8oy1oNF6VaKavuigAom8PMpp/eigzc1U4WUKK8P4o+rQaiD9gz7DtmMJabOQikoXupOeA/arFP/sU5YwQYPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11512.eurprd04.prod.outlook.com (2603:10a6:10:5e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 01:57:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 01:57:32 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 2/2] arm64: dts: add support for NXP i.MX8MP audio board (version 2)
Date: Fri, 27 Feb 2026 09:58:37 +0800
Message-Id: <20260227015837.1915384-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
References: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b0ab9c-a672-4d8e-881d-08de75a391fd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 iG1CmaIW0rE9+5QsT3DQoQ8buKDnkNbo9Fsq6+IPitoEnILJi0ivNb/C8MVX+rkN7Gt1ZHamaNV62/GWeq8Rls9aKZ0CmpfFE2CFU6AmHGG9ja7kLxCgm1vYkVeL6KeXdju+X25c5lQhrLmeCgp1EOCOB53qAAJrtn+6ks9F7QqJSA77F6udYgMqqJhWODHUCB4Sx4wHj2CWwtwNoPxWZA8fFpRGM7MNqtou8grI3AvFk0t7eIvSFriwgWeCix5+L3J05fGQM46JkfQ4QJaol2S6dxClBHlNyU4CasruCY5PnBg0mW6xY6J79OCqzCPrYqEgmY6jPsnKdmznT31E7HJ4eqn0R0M3Xe0v4CsFbBhHvWS/zcS0jmKyDCYCw4sxCrLFqUUaWjNd3tiddfCxj0m/uQAR74f/8B/tpW+gRV2I1zYsTRJJOePIhgVy1Gf/+covmZwq5ljTEYEzn2l1YHZZ1vhDWrXyhyy6SFijPYE8wZSrzmnfpeGYjWQBWosRi2L2BwqNfp47oaavy+ZNrhHSUmm3dNkOMCdn4FHEqjZGT4fn2NLQxgXp64/oL93sI62xLqoP6HdznxypychISl811hKApOKp6dMWFFbUVH+mSVk67nRwEF6JjZeLpGweLavWlj5PZvxi5nbQYBqyuudpHH7E7fvf1+n2snjf+YASN7cdt6kjUMdJppcwiEbD1DqhR3eha9mmCZtC36/Ya3zmXnUUVY3R6yQAFfY4D81VJiDNOm0G0Z2CcLlMN1w/0rbn2rgl++9ijs93wyNCe5MHBV4bWf1m1+pRzn8DO3uIqQsk7ODtI1B2oxdGOE+W
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?P2xTp6IylmalvYjWAo/Wt9+Ev8zCiqYSn9iKM0jC+sbEKwSp63UjG1RZl3RK?=
 =?us-ascii?Q?6hNZ1tmXUlIaMC/a4NmA+VDBnp53+M0KuJFWcCyD+DDGBFZ8EK0YwsVhW9AE?=
 =?us-ascii?Q?7Mu4I9PrI3kD4UDq6g3uQvGYWhB3fLLPx3ed/o+Bbq/QnCUw5nRKzY18hwi/?=
 =?us-ascii?Q?kWsUroQi8kvfoOlIfV7TUTvUtCF10v/HOjbvWaR98v/LIdOBGfG3oD6jJert?=
 =?us-ascii?Q?wRWJNN7Bo5GJ57/NBYGW+/a6WEHwNMvsgD/gXfNj0PT7KhL9q93rV+dv5WaO?=
 =?us-ascii?Q?lC7jU7uwNRl0TwBz7vfB9K1Y+CfAwQK0Q0z7oV9yz5tMeL3dWftgD1S5RHIo?=
 =?us-ascii?Q?xPEJm1ve3mqRP1jgewZyL/siTZy7FQw4tiJhrmTgoBxRfjaIrqP/IoTeCr6X?=
 =?us-ascii?Q?lDOiQd9VASYL16UhGJWrNfbaKosicNr74XJvgek1T2UMKPSvLiDYvT6+wGQZ?=
 =?us-ascii?Q?NrBhV/GqkoceF3RI1Mr8H32PBE7Ni1YJemY5+PFz0qzZ5VTv+YjEDcgYTjzw?=
 =?us-ascii?Q?pnl0Sq3jrLOeOCgLqMVqzWpwFQdJiQ/cfDplr+tNO5TKAG6hlI3KtGSoTqj6?=
 =?us-ascii?Q?0bmIZ/pwf+TmONtWEhGl/K0BtOzWc2+oJAiOAZEim4vENZ+3JYG5Tx6DRNCo?=
 =?us-ascii?Q?2bLewPHR/NZwhS/N5KghE8PAXJPmvNrWr/aaboblgqgwYyVKTetTG1wUX7cn?=
 =?us-ascii?Q?ivo8deim879om1WHCpUpu8G8c8S936LPK0zZ9DzWCJCbAntJxnQxZQQytceR?=
 =?us-ascii?Q?LwgDhdC1fkxYOB70Ui/3YrNX7gz7AwSBQBOnx5oZYC37wWDfiK45AEVNmlNc?=
 =?us-ascii?Q?407lnVC+jF+BkieZnVqOm7qDDH8kJIYLr/ZfG3PYFUaS47tVCB9ewyPVG4f8?=
 =?us-ascii?Q?LfpDklDZtgfjrSqg0D7QmAAxf6myxQHNbjRXC8VLKYTW1JZcl+1a+Z9YebJ9?=
 =?us-ascii?Q?vF0wDBqSqqkejOAp5KH/NZH3kFiBIbgLfp9pAlMFJXcvUT94VzQurKUbpkYA?=
 =?us-ascii?Q?1DzdrBcdvolgJ60cewF7qH7oQqnla4lXbKDtZMsBZjoDVb59eHrzHZNHJ8z9?=
 =?us-ascii?Q?6GoADoP4dlJ20KfCz/XM7o8YRpCHOGkj/eKHIdujdr6eRrKENGIr1W2Y+UWo?=
 =?us-ascii?Q?+SlgJM5FQoxY5jX8hhzcC+WlMeZi9mRLbey3yCqGiI0tHt6PM4ESr81ITjoN?=
 =?us-ascii?Q?fiAwwfrB2pLOHTbwU1GkONPViJmw13Z5rYCgNEcLwViZI16+DFiUOPZ/ywuP?=
 =?us-ascii?Q?CumkXiElh6xfRzPz//XETGkGxwrt7M6kKcH45LW1OzK4nd0vAmgK+JET+/NN?=
 =?us-ascii?Q?L9hNw9oIkNYvqM5+jSebXOCH8AsC02KQaSmTHK5FLWRFIbTyNAJUbWLNU1+K?=
 =?us-ascii?Q?ok1SCvCep6NzSwBS4sk+20Z/XeVcWPf4CgLWwa2nPmfgg9/O48AAC1Vnr1eu?=
 =?us-ascii?Q?G4haL6MXE3uIZrULYOTct1Azb5xL2q9HqYcMiCb34i35WGfWkowdX8gq1VWo?=
 =?us-ascii?Q?I+KCHjSd8EKeFmTcRn7BiquQxqvoSEkev3X695bnrsQuTEjPNvfMG6ORwPiC?=
 =?us-ascii?Q?nUl/PKaiOccRyTQ2bwqUahAOXWYR6BKrNmIScOfNzzbu+XHlYiHZHu3MWbYK?=
 =?us-ascii?Q?EZOBAG54M4FltjchSL+tFGJ99f1YJv0O5MLtScRJsfUjBdAs4H7a5zMzWx8W?=
 =?us-ascii?Q?FKNWs6CjtecCgflFU9L2xszjCQAFZ7tgVwlficCxndWgTLo9hPGFXhLDKCi0?=
 =?us-ascii?Q?DQ7s4za+Gw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b0ab9c-a672-4d8e-881d-08de75a391fd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 01:57:32.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqhCjplgjJ+YZD9eggU9+CTozgMG2Lxbxl1AzAzTvrpFWePjVnq2YW7oF43meCNtelxnH54yT822VzNdPShaMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11512

i.MX Audio Board is a configurable and functional audio processing
platform. Integrating a variety of audio input and output interfaces into
the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
features, rich audio application cases can be realized.

This is a basic device tree supporting with i.MX8M Plus SoC and Audio
board (version 2).

- Quad Cortex-A53
- 6GB LPDDR4 DRAM
- PCA9450C PMIC with regulators
- NXP PCAL6416 GPIO expanders
- RGB LEDs via GPIO expander
- I2C1, I2C2, I2C3 controllers
- UART2 (console) and UART3 (with RTS/CTS)
- USDHC3 (8-bit eMMC)
- SNVS power key (onboard power button)
- Three DAC (AK4458)
- One ADC (AK5552)

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 912 +++++++++++++++++++
 2 files changed, 913 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a3f3a2389cc4..1fff9c37fcf3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -217,6 +217,7 @@ imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8m
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-adpismarc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios.dtb
 imx8mp-aristainetos3-helios-lvds-dtbs += imx8mp-aristainetos3-helios.dtb imx8mp-aristainetos3-helios-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
new file mode 100644
index 000000000000..7031a33d85c8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -0,0 +1,912 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020-2026 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx8mp.dtsi"
+
+/ {
+	compatible = "fsl,imx8mp-ab2", "fsl,imx8mp";
+	model = "NXP i.MX8MP SOM on AB2";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+		pinctrl-names = "default";
+
+		status {
+			default-state = "on";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			label = "yellow:status";
+		};
+	};
+
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	reg_ab2_ana_pwr: regulator-ab2-ana-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_ana_pwr";
+		pinctrl-0 = <&pinctrl_ab2_ana_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ab2_vdd_pwr_5v0: regulator-ab2-vdd-pwr-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_vdd_pwr_5v0";
+		pinctrl-0 = <&pinctrl_ab2_vdd_pwr_5v0>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
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
+				sound-dai = <&sai1>;
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
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		model = "audio-hdmi";
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
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+		device_type = "memory";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
+&dsp_reserved {
+	status = "okay";
+};
+
+&easrc {
+	#sound-dai-cells = <0>;
+	fsl,asrc-rate = <48000>;
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&flexspi {
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mt25qu256aba: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-0 = <&pinctrl_hdmi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9450: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "LDO3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca6408: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	pca6416_2: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c3>;
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
+	ak4458_2: audio-codec@11 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "1";
+	};
+
+	ak4458_3: audio-codec@12 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x12>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+	};
+
+	ak5552: audio-codec@13 {
+		compatible = "asahi-kasei,ak5552";
+		reg = <0x13>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 2 GPIO_ACTIVE_LOW>;
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
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_ab2_ana_pwr: ab2anapwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0xd6
+		>;
+	};
+
+	pinctrl_ab2_vdd_pwr_5v0: ab2vddpwr5v0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07	0xd6
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x10
+		>;
+	};
+
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK           0x1c2
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B        0x82
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00      0x82
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01      0x82
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02      0x82
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
+		>;
+	};
+
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x10
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_PDM_CLK		0xd6
+			MX8MP_IOMUXC_SAI5_RXD0__AUDIOMIX_PDM_BIT_STREAM00	0xd6
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_PDM_BIT_STREAM01	0xd6
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_PDM_BIT_STREAM02	0xd6
+			MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_PDM_BIT_STREAM03	0xd6
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT	0x116
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__AUDIOMIX_SAI1_MCLK	0xd6
+			MX8MP_IOMUXC_SAI1_TXFS__AUDIOMIX_SAI1_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI1_TXC__AUDIOMIX_SAI1_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI1_TXD0__AUDIOMIX_SAI1_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI1_TXD1__AUDIOMIX_SAI1_TX_DATA01	0xd6
+			MX8MP_IOMUXC_SAI1_TXD2__AUDIOMIX_SAI1_TX_DATA02	0xd6
+			MX8MP_IOMUXC_SAI1_TXD3__AUDIOMIX_SAI1_TX_DATA03	0xd6
+			MX8MP_IOMUXC_SAI1_TXD4__AUDIOMIX_SAI1_TX_DATA04	0xd6
+			MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI1_TX_DATA05	0xd6
+			MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI1_TX_DATA06	0xd6
+			MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI1_TX_DATA07	0xd6
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
+
+	pinctrl_xcvr: xcvrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__AUDIOMIX_SPDIF1_EXT_CLK	0xd6
+			MX8MP_IOMUXC_SPDIF_RX__AUDIOMIX_SPDIF1_IN	0xd6
+			MX8MP_IOMUXC_SPDIF_TX__AUDIOMIX_SPDIF1_OUT	0xd6
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&micfil {
+	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <196608000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sai1 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>, <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		<&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <49152000>;
+	dmas = <&sdma2 0 25 0>, <&sdma2 1 25 0>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-names = "default";
+	fsl,dataline = <2 0xff 0xff>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai3 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>, <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		<&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <49152000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sdma2 {
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart1 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usdhc1 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <4>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&xcvr {
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_xcvr>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.34.1

