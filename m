Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392139A074
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278318; cv=fail; b=pt9PbmcQXXMi/LKY2ddrUtrTv19AMjgYES3PoeiLl6UkaYBhOqP3wdrgqhV8RN8RbNA0cKIad4ZWmT4JFS+o700BFhZzjSGzcEX9Qq0X6kh2M7gIztNlJU5tbW/fWfA+SKtMGLYLJWRXemrrH5cuIeSz4gghSDBgKAy6s9U2GLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278318; c=relaxed/simple;
	bh=ZjsL+dlZhnAPbZxRdWEHbqEjMIkmkgE2FY/NoG4yrxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHupZy7z84sC6yompGbf2hbZqtghqN5LfnhfigpJnWmXG4uny0fE3TzP52p4nEdC1QLcV8eFfvKsK5H0Sk97QpQ/6a+XzIZyMND5drVLqVqR7EurHdW3ntnn4RcIhOOdc9G64wapzZMg3aq8sGyMo7MO76hrH3YLsTHrD4Nw8I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I0CzAvbA; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I0CzAvbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npS5p/byU/zg3IHZGj83hZ/6RgP5jV+Y4F1NjIP5D6gSzEt8Uhwna0tfc5HAHkK9Cc5YLdR/HHHTznM9I8J6I5UVu76arWfOi/IWMiC2woUROBiAf62Mr71CQG1aTXaqk77NEPmWLRvPvMdUAO8DAZxaKC1bJN4l14NHYH7hbddHsf2pRYs0Yr4nUekv8HZ+u+PPn9TmKB1lJq2L6FgSeRUzZQWm9thRsS1wprihv5Yqq7C51vTcNF+r5wnpy5DeqM2bplnXgY6dhJYLmeSXQJgpp/INL6JiQoEdBSI96L2f4I1bCcdFqLVV+pB0wVhAuI9PEoiRy/bHGwyvGmvPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fcce/aoxyBUw6FryrdDcQzskbMa7I+DjnL++gV5qLY0=;
 b=H6YdkAq2Hkkd4HbMXT+S5g3rob6LPncNkMGxOFvaMvHq1ZD/Rf1dS0LtoiXHhVsqORhqQ42eAZ4XRZMUolVJNZS0VcnGrDwYry+VVslUHS1an6TtF+ldBfwVITri//eCR61lnhEj401hRNQKjamtqwTfXunxgPYUuDTm0/5tVd8uMbooMvfIHgGWp7AbMrd5k62p4eT7dYhao5fjRt26Lp52fm+dgVazcc80RUWeM0EWt1vymxWmowhIV8FTYwppHB/epxHPn+MCU181fU0MQIq2sM8saRqse72yRSD6rhZhiGn7bZe7FjkKBzfUpHNA3wbtFjbWvEjdVn1cT8Axbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fcce/aoxyBUw6FryrdDcQzskbMa7I+DjnL++gV5qLY0=;
 b=I0CzAvbA0cBecjMoKIo2h9cNxq6hifyvtagtInm1Zf15GklY98iECAkzoPW9RHhURE8U36NgDICIbCeCaUS0bv0DG0rjRA5ww/7DV40bPknT62MuJv36TLVntfqjORB91WMVyqOshCF8ZWckydkXpKm6IRrQC7cPw0p8OJGRR41TxKhdyLSsEaxxXhiMlMYlhy/Ffs6unSwihFFcWI1PRpVlI1EHCQNGxqHwAa+wLtV2Ay7um/SmQUowwJpHQXrvjadWGrUX/2BWDXRyhBUx9MA+UXzxS+LKjj9blk5LC5Wx3qSvrItLIknMK/wo+aZFFTCJUFUQVvLlsjDpexI2AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:13 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2 3/6] arm64: dts: imx8mp-evk: add typec node
Date: Mon, 27 Apr 2026 16:27:25 +0800
Message-Id: <20260427082728.3641872-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427082728.3641872-1-xu.yang_2@nxp.com>
References: <20260427082728.3641872-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff120de-55ca-4875-0348-08dea43680e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8ewqqHJreSg4b74s0OZV3Jl2nvEoTsJ3P/qfAf3kRIzQXV//O5GWI1NsucPwSNvU+y5EBWkinQ2pJZ0P4erw+TyF43ufmByK2oiKBGFzM2iBDF6nx8J69nak4Yahh1isEPnUo0g5mOzqO38BI2UKrJuF5mIp9S+0eY1fJAqg0bn/DJHoZYege/cAeqnjfTsN69Y0I2874bg+l2qiOg9ZGRJblBdMMsr7rBJoo7bOk+PnPjZcMKIAIccbYBZ+tYZosUCkK7IjoaOmm3ZIJ6GD1Vgy9r9aWcB4Z3Ct+dTc9WavAlZOHgLDbYv9JixtOuUP7KoG4dHbjqs87Z3Hnrwp3WqEhBWR4FPhJGzROgFitXaT+iq2qPTTQ253Q2HFSai/W4HRx2YsiEgieFfAWXVzMtRalgHgedqCTeEtqheM9ffhXlW0mA8lfV2gnqh4hueZxY8+QjA7Ar5m9+KZE05y7xKNaBgVbd2xlhbvWuO9tBKKnUTmVoQT0YCAYnbOndNovB63rU57lENAgTKH2FsGVi858Vtw/7DMgiZ0ieY+iCRqpfnUaM7eHnMsPVXZAyTSCrcWvfLQ1O5vcBGWsAndP9Fhuda7DlsxEqZBTgZ3daeacpnEbQPCpg4eK1EmgBjlLdvkX4hyh0RxUHIaJjtS3v65LsKBXKy3kxKtmY9BrugVQjXElSWt0zOnDnXaQfDKBmL+IebqZs/LvfBWveDJl6ya6nwxrCx9dcseQUnZajiUcd6cf0vEWZj8z54lDBaB4Y/e6biuRBrkSQhVRK/23PAvLOCf/GSguNYj5W6ERgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a6shXho0bcd61PS8CW7wCtqKDZpjdS20ovfOKw5fIghcSBUHBJ2CXJK3TiPX?=
 =?us-ascii?Q?zQkg0z3n2FiVYflQOsbKLEjeHA5tFTHarXbce98+nEh/zF2fLsdpCZnuCeSx?=
 =?us-ascii?Q?5DiuE6o1gQeQKyMi/Y2pkpqVhKxXJdm6Ue3iNatdeDzxtbOE6tQ3SJUhgTDq?=
 =?us-ascii?Q?0ZkSGBq/Lw2mrHjObaidAPRetpOo1oq6uOzoyb0JXLHBN3HmnyJuSRUyHY+h?=
 =?us-ascii?Q?gf26CaFeRS3z4z70n30i7ZPPZu4IAq3WDBwwZlfwayjskK9kBSVSDBRWFMQ7?=
 =?us-ascii?Q?fcaaKCqi8qPIreBgs82pUFZ9KuLQ74YyU0R6tzGeylsiOBTFI3YxPV4e99xB?=
 =?us-ascii?Q?4M6nBHYqFwDUoQbDc7w6VAJnlzpGQNShQAmZNRPQ9ZrqglLb4fzPMyGi+jnU?=
 =?us-ascii?Q?7yld3GkKmlJ1i6rIGeoZCSbA2bkEqO+1UA+Xg3pRb9tbEIvycUEczV8Dpv/U?=
 =?us-ascii?Q?4JLCMWt5u6y/38/4EMLWsfMYUA0siV1lcl7JURBVfpTxhwOnWn01K2z846KV?=
 =?us-ascii?Q?6QKcADcTy8RIfcd6C5T+JDuYwIcTIc8SA6eHbDR+jG41CabHrAocQ0yFskCQ?=
 =?us-ascii?Q?XxkO6UXKAgsht60i601iFlh02Xsri/eSEhAG/swUsKupara8InJPSMASK6KD?=
 =?us-ascii?Q?PpJBF+3B9fwepZWMWPV+01/LzYQ0gOtOF7NeekpW/ZVK35rf1oFoYT03Ke6n?=
 =?us-ascii?Q?3xX+AK3ZPbccW44G6ENNJ+vsyh9RHjoxlfRMMtHfsOjHNo/xIhplys8K4sZ2?=
 =?us-ascii?Q?iw3wmqOcN0/o15WkmOmNJJkJ6sGNlYnsq/kUeXbnqZaoY8xv4iaT8s5WT8tx?=
 =?us-ascii?Q?K8nzadN1TKfSRn4/XJ/RKP0/d+2B7Q9nc7fGVRcxUkkSt9+aGBRMijTw3HiC?=
 =?us-ascii?Q?ArwZO8MSvLwJkTxiAMgMZpku6lXyAhIDGgvmj3wcnitZhzXVsfUaLNIGR5Vi?=
 =?us-ascii?Q?JYZ4LHewIblSOn7DPZgWuUDA3lTvSW6DAa7uGq4PEmvg12O5+upso6dPgcuj?=
 =?us-ascii?Q?gkGVJ1mR9/65nTZjzmXCclBsidPG2KqHl70r9SXifXHZUrlJreTNUD7ESRyo?=
 =?us-ascii?Q?G2OHxB2jPA7qo//3IU8WehxFuBJ5oWKXF4p36FovRR0mn3aO1dq9uoL5DDkg?=
 =?us-ascii?Q?eufrkYNFtFsQSHURyC8E9I5QK4r6NqV5WjyLy7CNrSsF/U29wyAvuxSJbAuV?=
 =?us-ascii?Q?mMrP7giljfYRybDLzSM6lRmr4FkCtUp5sk4YWziSIKxg7PAMTJB7crTwjAjV?=
 =?us-ascii?Q?pMkW92wyqH4fegp6mgyw2dN186e91qQX5aONSN/8Bv25I4dMpm58Cu2T9M4g?=
 =?us-ascii?Q?joRVch2qUFKv/FxO1FhQR6APpMD1xTejKDOSw1RTAdr8sArnghb/FZpfXoYJ?=
 =?us-ascii?Q?+UJSM1diWzmJ3SMiVQH28D8Rl54ltgtV6SBLuEFJ0yLzrR+baLbU4jqJMb6t?=
 =?us-ascii?Q?RZ/0m3J0/G/xKshD+NSxePiNS3VaVC17ge7RjF1LWWeZKmp8OdBJGuY7F89f?=
 =?us-ascii?Q?ljHC4YZywGqoHkbP+G7D8iHTnyl8abWtBUdLJPl9FQFcyYPKHW4eaLycEIoN?=
 =?us-ascii?Q?mVmiVv5Y67/8jwnMMjI5EAHBn1FD0+uD5PfSKyVeJiSy7k5wZO0cGNsnNJgh?=
 =?us-ascii?Q?+PY7NoBnU7Jh10NdVSL69ks+KsQnefs90lHkjhdYbgpegA+LjnrleUbxx7PE?=
 =?us-ascii?Q?32YeHfrvJZBh0+oJrp5dcMKOGpi1NGeOKitrkfBCXDe53iEQoXbS4wD4hIGG?=
 =?us-ascii?Q?SYswo0QfKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff120de-55ca-4875-0348-08dea43680e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:13.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zo+oePl9gK/CmEZvfG4kIwTSStSd5R81m69SaOWGLi8WG8uXbjqIMmPErG6KRtvI8wY2JsOAJE6POFWnrZhbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller and phy node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - remove usb3_phy1 tuning property added by mistake
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 69 ++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d0a2bd975a18..9ffbb5c04f69 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -636,6 +637,35 @@ adv7535_out: endpoint {
 
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -846,6 +876,38 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
 &usb3_phy1 {
 	status = "okay";
 };
@@ -1174,6 +1236,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1

