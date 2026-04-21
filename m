Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAF3BE629
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768776; cv=fail; b=hJvCCZ6oAzu2KJqScdDljfoBurIWv9Xa2IpZQgYZzh4cMzR2CagtdvdyGJKmK8Vf9VIWQEA/xq53aYVNdLxV47ESSAzJg8TcIv1DrU2X64eg1Ds9DkamoPprj/i9XOA3MvV9O4t1BTr9rKonbWmi6aZYuSrC4moDU6XS/VTu9rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768776; c=relaxed/simple;
	bh=wDFlQ5mYYUi+Rb6dkFdqBID/P6aBJDWWom/jzqjhob4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RbsYMgv34l7LZppiLs7DvTPB3T7peWBslzX5srWj538ywWGEuW6ha9eP9B7QwD1mWxTs3a0sX5OurzHf/GocuGQAGHb5RaYWo828pao6wLP2ztL7Bg3wuYI7kU2a059WvltT7QcEPYsS0WioY6ohOYoDykSbejuGj++Xtinx7PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oMIhNApd; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oMIhNApd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzzJjRuFehIT/6QPTJ2Oe0jAUw8uW9m4XfFRvEAtPoLqbxBjFprHynudeS+tDitqkVz7iLeA01xRDlfgGaH/iqvs0g1vFo9SRKHn4l9MQN6vy8S4dVS2d0QDQetpl8fTjyVk8OVNwD6RUgByxbIxv8VD+6+/qsES1idp9cK7c3D6edFtkBoOw6VMlZZH8Da5z9i31LztjaW5QXxORbiJ7Qa9aa/2N6faJzm5xzKI2ahF0Zk2i83kKAZwQ5WsweoxYpKmJpeFQlSi9vG6/pm8OjIEFZtGDATF7PUjz8yAaTp/hfRcgr8MciOAOu/TmZ0mbzZ3qZG/bZwGLc5CTemsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/z/AbOrn2nuWcrqKBHtjx7WZXw9/cCCVqN+U+Pqw8U=;
 b=nJl+3RENbIqJmuaWbGu+i72d8HPUzQ4gjIRZieDkiq2gV9kSL69nDsTRhMvgNtgZkWoI2w4kVV2vn+u2+PlI+l1YSTNAZmiFphaFWgNIhUusFq2KBoZA9Mje4m7yKhP6kbUbVWWzyTyp05IFbJmFhY504tcm2i4IRnScDd15lO/ksV3Kz1dhQZIEZ6IbUcg4nldBX1GzksjS0RM1ZOTb5D0XnEgZHw1cbt4otnNFtb44e3CNj2Cf4K3Jir0cwrAOEVzdEyQiPEgmPDxu0wq+/POIMeVX6q+RSeew7yD2EY440B71FEpWViz4qEowbPNWdBKVG9w14PfrANPD/CxSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/z/AbOrn2nuWcrqKBHtjx7WZXw9/cCCVqN+U+Pqw8U=;
 b=oMIhNApd3CvTN3ficb8zSK4sPLcKm1dFnN1cX0cbmShtcXCIO6oTC6Fzz4Pi/wCX5tr8zt3H2q7/7Txshqb3d2OigJl+/QFBxZv3UXP0+A8uhA9zceiTh7OkJK/hORK7bDrnsnv17EtHz3dZ+bMt8LPYcJpN5/P2WneuZ9kBCB2nh8LyS+1Zkf6mGKSGiAdx3CqNP/aVsWNBVhVRSwOFCTMM0JalY+RA2nZHMkpadLmmRl0AaxUrLse+AV/lzDxvuXCOnLUnYCp94XDjrTJxlrf/bIB7c00Deue7HfprMnQ8v3D6QR/5CCtHt6G+g8q7AKeiiNsYsQ7BqqhDx5tM7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 10:52:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 10:52:52 +0000
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
Subject: [PATCH 4/4] arm64: dts: imx8mq-evk: add typec node
Date: Tue, 21 Apr 2026 18:55:03 +0800
Message-Id: <20260421105503.1416566-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421105503.1416566-1-xu.yang_2@nxp.com>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6211cc-796f-482a-552c-08de9f9422f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pGV5nilMJz1OA4mbbaKJK5jjI6Of8ounpoNBhIlVIKVl0MkqhuHPPC6KfdzEXn041C/cgKdnm0dczzGVSRmzuV1Lz5mn3HLOT4ssGzISBQakJVrwJmPqoiqSH2Bnbu2jaR226LLF2zzc1Br3AQrrVhFIB0+F/t3X1RX9DfkTLcvCAJXFNX1+pxFPpuGkVVCUQbvY4J9dtwFM8lUlI4hKxTqMRKTohQIYoEu7Fqg45xNW9ArRYaMpDKKpalC3URDUcICQJco902zMRNVehztnvXGx7nn05dI1R/bOfhDm5IM+UkPBgmMVTdA8vTIRDMhLlOP7r0y1FPMAYbriJWWjK6ehvc9zsov8+qyQuizgd/Ao+/hhvvZsgwPt8gaMl//yV1J1gc/SvfEtxXJYwgPiN4T69oRQa7lT0gWbExL8OcToTqjO8kI/t2MCHO92vF8fFDpfM3GR/pA2xIBhtS754lCMrY+3r1E7EUqoLxUvch3d7gyuPAQm6CulK22KOva6TUnGqw0GWpYdnP87xswmGZYwWWeaJmDD+B92Qn+L4MLj+XIw9w+MSToxSNeMFZKx7mUIQDGUVCFXTPnpY/enlSX+4RE7wacXY0pFqWqO34MLavctV7oDxGqfdQR+oSuURz7DV13Jw0+cffF/iVBp9KZYNRCd6a8pLFxIZaJnR9/wjakiKJ8TVdkfbx9CRcnXDX4ipjlt/CXUCFlbDqAfSqtpEp7BCsJDaSelrYj72RM1giKRO6PiPSKRsll0PEFxyskltIUCqZ604clxORXVlOCSwkMDcyDyPHHtjl2lt8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rgsdQV7MsfV87pPG4IqaQNBtyO71ESl46gaCDBO/tQd5avvV/m9/iL0qdjJB?=
 =?us-ascii?Q?6+hKkFn8oNNQCcRyyrqy1K4sE/A6FugWEnCqv5t8seiU0aGYvN6hz9G7a9ND?=
 =?us-ascii?Q?ELeZIBsy8HdJAYMILk3XEiuAX3KfRHoU9oFI7xqSfTSeMlUMH9BRXA4jzQOG?=
 =?us-ascii?Q?L5oOsnalsFQnmkgt+HyWRfbzHMWtKRXesH1TkSoTzPZSFlpfvVBs717O5ytC?=
 =?us-ascii?Q?c0xrzOd9rAlm+VENBq44ewAZb8iCHS+8pvI8BW1qa9ywdeUODr93DVi4N+Xt?=
 =?us-ascii?Q?+bLaurO8E/y2zvcMfU215HnnxQsje//2Yv1TuBmrWklt4g0HpH4e2SXDYhWd?=
 =?us-ascii?Q?zA8je8EEn6ZIvBbANShT18HIx5VukQbMu/WpLuAgRlsiz3pa7Ru5BATVsfaT?=
 =?us-ascii?Q?5BKF9JRW5Nt8KbM54qjw9Hie5pC4BHL3IKrNK7kNHyRIpwRA6gjYQ5a4lcjb?=
 =?us-ascii?Q?WdRtbJzvXGYU6n+YOlcfI9a5H479qD5kciW2jy7L85B9+9O7DudvvR/5o09n?=
 =?us-ascii?Q?RXK1mrNrfd0Yv1eokKCdRle/Qqn+xLnIgvgKFZsoE2JX2qfOpSh9Ps1JY2pn?=
 =?us-ascii?Q?p7x3nAa7XwqMD+6aDxEWKxOoPOdjLJeF/j64C640ZgpUx0HmOLd9A+Nghmqp?=
 =?us-ascii?Q?PTHHfM0b52YiIo4M9VCzu5XRvKXoaQvWhdcEYAlP09A/iJC8GCkRlJtmyKXZ?=
 =?us-ascii?Q?55IaQbir2vgRjC2RPsxjAK14kUFuhsas3YDTsbE/XvZ/7MvjgHjlZernwMsG?=
 =?us-ascii?Q?wG/GdekFeFXSlbRnC12OH/ecGBpl/OsGGyLGUzYFPjw/tXNUGNFR7yzbw5Aa?=
 =?us-ascii?Q?A/hH6sdEsn3SsHr51NsOwbM6iYcKVMx2mc7vaWM47OKEeb3VjtCdFFsb2s5p?=
 =?us-ascii?Q?zcCaLIrD4CzE5C667nNVkXsgQBqqXW767dq1dfO+XmxbqcisUdGv2FukhhYI?=
 =?us-ascii?Q?M7O61o3JREq3MTghAxY6FJnKSAgD6CTWvwkJG4Mtx/0iL+9VSDu+3SXMPk3e?=
 =?us-ascii?Q?S9RqkT6MhLol5oySVxY88kRm8Kk9WLbCHoiD+dMDsamQCHBb1/2hKvHAEjAI?=
 =?us-ascii?Q?+K2EbrWbotSujCCF8bin0qP+J9E3qHNi1np8FiYRed7qNoaV0uXfeRCs0q1/?=
 =?us-ascii?Q?gz1/PIlQc6GLJbUVk/xw60O+fpSkFW66XGvc6NdAVMV9VBK4ClCZtvTN0Af+?=
 =?us-ascii?Q?grqXnY8foBpoxa9Gax0EKC0h02A3qKPYyBCLbNY3jfJMyhKWlPuUJumTOYxd?=
 =?us-ascii?Q?Tu18nOYFhVPjecFLDW8/2VliaTERoeZXfgJztKKGKzfGaKtQNwbdgfWE2mMl?=
 =?us-ascii?Q?m60oboXLKIWjtffB5NC0LXmUo03YDG37uze6GqLMLOykI70B12E+dO1iFZWH?=
 =?us-ascii?Q?I4HpdBGSy074PJsMsR/qaM9RrnTrKGEhjEhWkhRCmLFvyn1EsjmY8XQmvARa?=
 =?us-ascii?Q?6yvlN/SA9RsFrPj4fa8IklCUWeBOVslRniPZQb+2Ayyey3yGwKzajWxA/AgI?=
 =?us-ascii?Q?uum8bIEOVzBhhO3mOg+JxJ0h4HPWK0DQp+FMe+xgwMb5CVvwGsuuOQifOkyl?=
 =?us-ascii?Q?ZLtL8Swuf4q8wlFZUs/F/BzWqDTZ6oPI+J898MLRAyJyn5AUiGDvhz5VQuso?=
 =?us-ascii?Q?4Yzi+OxRrVnZ5Q9YA1WJV8dJZ+rtvrqWhSZfKJha1UwLZWJo+XzrJ2enm9Sz?=
 =?us-ascii?Q?vx1Jl5ZZJ1H78aqI+YmmGmcvAV5lZBlh+3pfJTzVoCrAn0KlU3CJOGx4a1Z1?=
 =?us-ascii?Q?WeNiTfWoTA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6211cc-796f-482a-552c-08de9f9422f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:52:52.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlmn/iEh+WL74ESnpfGNMpStfVD0vCv/3oG+0etMd96hG+WKSaE4zmdA4LEEWaYW0msxdsA1CYOVCE+IAl3RiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..1b93d80744be 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx8mq.dtsi"
 
 / {
@@ -330,6 +331,35 @@ vgen6_reg: vgen6 {
 			};
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
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
 
 &lcdif {
@@ -488,6 +518,28 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3_phy0 {
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
@@ -640,6 +692,13 @@ MX8MQ_IOMUXC_SPDIF_RX_SPDIF1_IN		0xd6
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
+			MX8MQ_IOMUXC_NAND_RE_B_GPIO3_IO15		0x16
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
-- 
2.34.1

