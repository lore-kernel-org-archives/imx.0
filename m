Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCD37C106
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792815; cv=fail; b=bXmHQ7kTxqnFyeNr5/0ppUBXaIihSjxzy7K9cwiBrENQ6Frf/g5xK3IiaLP9/IfVyCzLJ3WIVJmq2ibNX2KScNa2nWNhkNqXRxaun2I7lsnTlSdVMZjvBTxdDbKSsvk6NdJOvKd7ZJsKkU5Jq9XblYMKSGSSNL3PxtcO/MgDHf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792815; c=relaxed/simple;
	bh=15Vb11iGQgJIm7tPdUid388CbI8vVMvPxa9dZr8QNX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R12BusiyJAQ3pOylTfgfb/Hl1rmgS+t44/r7NfKPdEaVZZHbfJA2OY/4M2ncbX8CpcEusply5bfIYsO1jHNkqjz4M4XlfOA7EFHreQoKRWbS/vFISh+Dgo4DvUem7HLt+Oso9n+O00dUcTU641mnIl197fe/fifzxLszlW7GZAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oMo8mFdp; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oMo8mFdp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlJP1pf6USpPeNh+fmWOs91tSS6V570eVm/m/eIC9+u8h2ukB/VZeZcusoU4DpVeB1k50I19nwGT8LEAUVyl+IJrrTiUuWVBFcgA7nfxYB8VL0d35WpR3J3lOACvtjLctw9V87OElxNby2fErUgFAX4e3xSzuF3lfs9c58NfnDlPq4SFTa36kiBDxGeb0HIzxZT79XHRjDI2yxOKns9IjPUQwUJ5OOAAF9ie6WT6BtucdlMDxyXSF0m6AqiayFQedVPSRW9kAtzvSsHhy8daC15OtJKyNhz6ImZcd9GNO6X1tmsqQy1tA4+NwJ8PlTPhp6OKP4ZnyUpMHW+jxZjaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlfI+U6yl+RpauswKmQRyhVhER5MblSivNb5eK5Cj3E=;
 b=XqzvX4j2FI0UqIPSre6Fe9xJ5l7i+BEDTsflAUpPMIklR+viNV9H9caAD+G0yuLHvmmTgzJrwIJK8nhXQ1KFiV4ucj00cOgiGgqpln4V2UCglQDtc5wb3GJGhP6ge5lzoqi+DyiwADP02ghdUYQV2y1bzvuG07YJ2aQxCOHSp/nDmbRPeP4gvdDzfTKp5SLA/XbKMSl5OaCVgt1ROhYDMBDOPDy8Bz0trbmnf58aiUO1xAuxrvFzfOCjDFH7Q4JI+HxditsugNZh6TfzwTgldzCIAItP2oERoHHCBDXHtK1/nwhY7Jr1lGeWOMIqK5fDsFrODhmp3Wogggxq+Nn5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlfI+U6yl+RpauswKmQRyhVhER5MblSivNb5eK5Cj3E=;
 b=oMo8mFdpe1jcasQ9wFrXdsQETa1etOutQYY7cQEsFto2gKAz42KfYHIQ56uj/Eusje5Eo/zhsGFjPo5KSgKP4nZ6D47n8alWSBW3iFCjpTXBo1Tom2c8aMj9ayXhZIt9PVDOkjMXWxgDuH7kztQcS5ahH2k1jNSd4lYc6oausbPJu5rw9EY1xKqm2iQO68beLFWB1EfBE1v0B/RQ0eok4zEAsATpvi2isiFe/kHaSHh1a7yT1fdYqg7OG2UN5RKa0+p3NTjfiv5mgjHVCEHshO9Iu9x89eC0m1k/gK+SculerMZI8DJ5/YW3LiCTJg2Bw2R6I+DsHgEYLvv9+IPOaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV4PR04MB11332.eurprd04.prod.outlook.com (2603:10a6:150:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Fri, 6 Mar
 2026 10:26:51 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:26:51 +0000
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
Subject: [PATCH v2 2/2] arm64: dts: imx943-evk: add Type-C and USB related nodes
Date: Fri,  6 Mar 2026 18:28:37 +0800
Message-Id: <20260306102837.2648955-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306102837.2648955-1-xu.yang_2@nxp.com>
References: <20260306102837.2648955-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV4PR04MB11332:EE_
X-MS-Office365-Filtering-Correlation-Id: b4789a3f-167a-43c6-5049-08de7b6ae112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	C3haMh7ccgTcqnTc845aZIVjpRjDiiK2xYQ0BxJFYn1ll0JosuTovaGafPvP+7HZdLaHLIZPXx1qikuO2mO4SytGrV8byF+tdb+WUNsiJvQZXato2F4mSgZhwJFr4Rx4qvVXGnLnC0BqXZn8F6TCcTMLcTpnMbdKPoO6V9KSBNErftfWulOV6Ts70Jy8LqNHOHBHABJOAJ6KEdhKEx3+qcSA+MpJwkYmXQcbOAnthcAz9SYs4IZYhHekwoC5oJjuVWfB7bYtylWuUTfLggbJOzF9HBX8eFAXj3WGH7/jhRwbMrgxkQn/3yWwv4su3/l0wkQszYTASyc4mS87hubrIE8p8bruqI8f0evGMxw8tpQKOUnyenFIUeZBewWFAiBwbtJBc1mgWOlaGopRSUw4tZFbqhfgWn1HC2vG/7p8+itZSHJQUPp4DKSmzhcO1eezsLTpoZ0SVG64XqQQG9YUEB3bguECfdo4wU0Z1mJ+Uw8MWvQON9B/XBabterxV+dAZtCTiXfz+fDjCBHTvJqsnA/T9ZMRss7MrKB1Y35h3cIc2W53S4mcW8qBapQho0jeAxbgzWuva85tn0yd92f4fntrX3lI2nHAFYyzdxjhtKPrw6MxHPKl4vYMSzTOkpWFl7B1fbK11Y5LJMvLdxuaFo7CFAFNk88VtSdHQYFbQUGN7QUhIm8h7O6UMiCvK1Ubw2jZ2Jq6tepA9rbnIGLF4MJV056iubey/WCz+Dsuy51e1MZZ6XD5tjOxgpujYTVOBjtcmezrSSDOfCKmF/4wsXZK2mEPKUpvONlDylTUE7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Brj63/uPMb/68uYIJPIinMUwG2MKZG7CZytztRMUFKcVTNITLv1AW7GwYBg?=
 =?us-ascii?Q?y+7/brnCpM1VVGqD0hvvcAmINI26k0N5CNGIzvQ4FKjj4yMhD9I8SBdwlaCD?=
 =?us-ascii?Q?ivyG2w28fJf53wFjmd5l7akHxtctVDOqqsrGb5OLiHeIQ65s3bvq9kP8FMgc?=
 =?us-ascii?Q?lcAmQGaeAShJ8wvFMnk862KTN369YpkCWFteHL29Hrsw3aUrqxqgvCJqUBGk?=
 =?us-ascii?Q?g9IaI4WExZgastN811LGt9TQDgsJOGuy17+8eTpBWCIozaaUa6YcSUjmXWR4?=
 =?us-ascii?Q?f3aV5N47Nve04LjuD7nwYolJ2B1Dgvr0g6gOCnPjy6/g4DKeQ/0y+MStRIlX?=
 =?us-ascii?Q?YvL2tN0ga3wCH+vweTRsq6MQbOynwvJIDjYV+vW/lTBzrdmkdtzC99wQjPWC?=
 =?us-ascii?Q?ozWCZVpj6TqY1tayzr+BhZvw4rX3Nyw0RP7CDgpnez2USKY0K93+zWew2R+L?=
 =?us-ascii?Q?zS7PWJSsG2xLAtM7y8hBajKDpjIJe+gae2+xh2AcldoCX/Eq0twH6FDeDbvS?=
 =?us-ascii?Q?Dh5oG70A6NbEdIHDN1iC70j33qSDnbzN8xX1A0/6UPJt7P5xV2u1a/llnTQg?=
 =?us-ascii?Q?78pXrV6z1vIbbSSO29sJ/283zI3DsQSi1DFEPSuXDieTXCsJdvXmwtaGQyky?=
 =?us-ascii?Q?dxPsvU/crnxn5O39BSqp7PD/lMboKyjatH+cy5Kidhmiul0ILgYi0xep6BvL?=
 =?us-ascii?Q?S9OVomPxXIBzsiVGZFsyjrXOPF6kz6OwKau+LQpG5aqHRSepXs3KVbkTKPLh?=
 =?us-ascii?Q?8kkvvN8hOfagJE++rN44Y19FlU7oLH7J3iVDsW35ps2krLe0/9kI8Xe1leOD?=
 =?us-ascii?Q?tMOs3FtyuvGW+eC7x8FKnXo6rHTsf6kNB9KNu+L8lf/5QU2ZaSuxFabAYTy6?=
 =?us-ascii?Q?A2AWkjPuKUOHEDCqZeMYxAJ7OUMK4Ncro5BxjFf2Vxn6py/kBQdPdwhxla8E?=
 =?us-ascii?Q?Nw+UqkPhhz8ZFkYAKe0wHSdnUf+kyrWrbw9YGTQLJmJfpnn7//QilgFzGZwO?=
 =?us-ascii?Q?8n54sud3GadNskOv0rPurXud9eRozk079eJ/TbisEAvV+ruzNIuCGVgd5b5n?=
 =?us-ascii?Q?P6vJVU1KhfxC/+1TO9bmcsDpqYo+x9sBKV6N0DWTMp2YE5tfWw7f4zIWEKbX?=
 =?us-ascii?Q?IjB0DHCp7A0sTW3YdVy5n6pS7rRBH3sCE6DBOrMvXQK7gEtfIAdlXWwOBpjT?=
 =?us-ascii?Q?jHOktWJGseOTdqTEO00PpZpTzixyUfhygJyeHRdi4+PAwa9UAnfVbHOr6Iq2?=
 =?us-ascii?Q?KyxjZHfmS3R3TQscmKD5cAHTSaThricMX0ChFum3PG/qIX7vZGOVPCRzWE+E?=
 =?us-ascii?Q?PlekdOLxImR3yizKbp/sbDYNs90o1q6tV1lpLeMXX3Joq7bptYWVITCh0k2R?=
 =?us-ascii?Q?3HUVfVirRl6VkIJg29rE7kZY7m+pcvQ1ETje9PT0tkLzHv4LpumjH3yRPgcF?=
 =?us-ascii?Q?M3rbi+Cf5TtSlM6TCAokPdffD+bDakf27+tg/phgZ57GGd12aSCEhBYCya7Y?=
 =?us-ascii?Q?Zt/KDduoYHu55QAUWahe4bJCCJaWHed1KUiFY/VR4o6kV+MlDgt/NggL7EYw?=
 =?us-ascii?Q?PexyaVCK7/dv8EWuCAxPdah8Bkpwm8J5rhCPhLu7x74xO97Dc/Eb5Fvz+xK1?=
 =?us-ascii?Q?ZKYLBxBwldhWriiTm1P6TfJnPfRB7fLmKC5ttDspJfhXgZHs7+6uH7Utp3lz?=
 =?us-ascii?Q?512aZS2pr0IKfdAh+NFSmxaEueUw0rVXT7kWOLh6YyKrq6YOUtBwnUh0B330?=
 =?us-ascii?Q?MpVn+KMAjg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4789a3f-167a-43c6-5049-08de7b6ae112
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:26:51.0224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAqRqVwIgIVLMeepugEv9kJNwfAoWWUGZKJ94iydoUziOEdJJRvboAiqcE/riOh2cVGBOrMSA93ue0QaS167tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11332

Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
only and another is USB3.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add missing ptn5150 node
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 100 +++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d923..0e2da43f9d62 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "imx943.dtsi"
+#include <dt-bindings/usb/pd.h>
 
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
@@ -230,6 +231,48 @@ pca9670_i2c3: gpio@23 {
 		gpio-controller;
 	};
 
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	pca9548_i2c3: i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		reg = <0x77>;
@@ -286,6 +329,14 @@ wm8962: codec@1a {
 				SPKVDD1-supply = <&reg_audio_pwr>;
 				SPKVDD2-supply = <&reg_audio_pwr>;
 			};
+
+			ptn5150: tcpc@3d {
+				compatible = "nxp,ptn5150";
+				reg = <0x3d>;
+				interrupt-parent = <&pcal6408_i2c3_u172>;
+				interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+				status = "disabled";
+			};
 		};
 
 		i2c@5 {
@@ -680,6 +731,12 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO44__GPIO3_IO12		0x30e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
@@ -821,6 +878,49 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&usb2 {
+	dr_mode = "otg";
+	disable-over-current;
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	samsung,picophy-dc-vol-level-adjust = <10>;
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "otg";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
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
+&usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.34.1

