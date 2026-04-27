Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889239C003
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278333; cv=fail; b=FNnp1LRj33IK4WWtqRJ4wW9sm/JZCbvPN7E0GHgZzy5g7Fge+aWEUvJJwXfWorQSiCGQht3bTFXdfIN1ZgJtu4o+1zFgVtr0M/2I3xqooaNz11uj6s+hgIClZuaOsnN0vsAdkOc0CQjbnSeX5Y+M+oYM3Onoh0D2MoQyO761fEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278333; c=relaxed/simple;
	bh=OmTbw6L2J0/422qUr14v+S2JtwTuU4Q6DNi1D1w3EW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d2PGHP6UbgDyQ6Zll7BYeJsMSPU2Qb59Sy0DyZ4AUiCtKvvoeEoUPJ8mopqFf30SVz7qo2ejSqaIMLXIM3ifbT/P7lcM0Qrllrs7TmOUOFXKViVte5lH58BbrVTqioLN5HKGv8iRIcnfLtqmypeRSxw/uOXSfojsbPpXTOlxG00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WMTt4JSX; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WMTt4JSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad6Y6ncMa2Lip6JgNBkO+8xxwu7mcg14W5//lRVfjaRVx9bIaB0jsOswe7FX6Xbt/1J3uWA76uBpgeMGubVakYMp1PRPgI6/HloaVo9lm2k+5Mmbi84WCG7YFr7RM74qPTZQ57wVaszWimaKGeLsc9TRhrrjLqCDwIqE8EcLWpy9WCWCvdeYNSdG5o/BjbXzcK8hk2LI5TDMjK7E4niGlQEZt8/LTRwpHpGAXKtjcE6DDPHW6rN003faWmyxhhVFYhuHR/zH0zRGqSGUiVzOt6COYvjG7Nux30386kxcGgZQp4A8CAiSNy23KFIic8VXNB/XqE3KZGpBtC9z8Q8QIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8hA1XJI+tcg1ndL0cLATeysR4Rkt9sfvGka3arDDeQ=;
 b=KhF5Q9xqln/XwwykB3EKy2CgtRLSI3yaLfnZ00D3cdxims7htULjumXiEiohOT73oEMZtqf0HTVhL9CFYVbgTx9tll12L4F8C+dvW+47S+QXeqcXe0uE+I/XySj77Ai7wPienjq+Z4dxXnJ3dmVTBAYTEPuxjUs9Kdu7C+iRDAxJiU+UW6hwzlMBBb2q3FaQmPci2qo1PxQkKIshbTf5zfDAyw0ARezk8OWsYKa2RnqUUSaruw6CjdI3o5kuLWx8odB44QMovyZRHAndKJ37dSVEs8WHeFcjnipIZIT40tZk51xy8c+cTEIDLetjKsEqnQww9GLY27CIFMfty5dL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8hA1XJI+tcg1ndL0cLATeysR4Rkt9sfvGka3arDDeQ=;
 b=WMTt4JSXXwz1zn0fWIK+sgW5d+Ca4fRoc1r+dNbi1KJF/r5u4/52ykPl6ea9DkrT2cLtMtWxXsN/lQuE5IJAJNcMFohrKrwf2X2fcU5w8236W87Tqo5fjKcYMFn03Z1rKMxKLTI1pwkrEIxQwnNa1zyzMvi4BbRfLJM+W9+5h9L2/jwFvRIUZxyDCi6If3GRw9sJGosh7fggVevZWcTqpjSCBhh9uYZr5Dc2ZZmhLYGKs1M1PfLgO7/gKwlFDSFtUWn3f1AJQvrcL87Mml/AzvVjWcQ+0Xkjq+cB/myvMA+SOmHGP/6NC5ZBFgKJPr1hmjU5K+XU3IFlGVoPJC348A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:28 +0000
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
Subject: [PATCH v2 6/6] arm64: dts: imx8mq-evk: add typec node
Date: Mon, 27 Apr 2026 16:27:28 +0800
Message-Id: <20260427082728.3641872-6-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d2a69a7b-3e9f-4837-b88c-08dea4368a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XWKY07fFJo40np3OT2sdPzHhSIiDK6CZOCxZeSzmaEnB7n9hHb952+oNCtDBlvwnRJutZVxHAaRXWu7Cs7jpWmBYIPQrxzdAi8xrkZXSGfFw1sTMMSa4AxCQpX/6jlORA7tt4SN8Dxen2G0rJ2mj4zriezJYilgqdYMddt056V7sNyOb2Vyl27WpCs/POWHcPWVVrl5MsUscflnwhfXu5OC394OGLdOhTChZYPTailOGaAbGXofL5lFI5I2fJJ76/xgdKCxV78Tbe83nnrEYUZUZpIV8H3j92mTzZaOfAwTXKHzZMJsjhUaKgBnTcxNUQQpSOQ0xX4ouq/AqKDxsAzrWgTiL0d653ivjZR1ut0Xvpr3lz5zzO8x92bdcFMe88QykEfp7EzsYkk8n77Et72Ya29ImaMtpX1TB4qGMofScu5qTb7l3uFFIdHO0rjR6HPyo1pRjEd9yJgIN1r18iYmlGGuijco+XCcPCy25E2vjyM2d7pNmk15gj86rTDHpYhieaB1xYp18Ov51+7WshaFmlrNlTYtyE6SKTVXNln3+6tN+P4XXjL4ADqT751MtrAP5lKKIG/7KQ482ujqSwb/hfx4l4AwFHTOOoYD9FeChkDeYsUakSeZ1/mJO6/YmqDmdFR1+AWgt6yDDct9Hha2rVlOT+2LtZlmJqaKHqIt+4hPv+DSqpB6/ssSH7ltiB70jTfMn3OCLhvOpbzaYURh26DYQfW2nlfAqAeiejMphXg2ODDcXsaUHnV50IoBS6x0uZ0FUtNfo6pdLHDT3DM6YNd2YNf5CuxFjwUPRoYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kUNmaa4T4KLWzssrkYOG1Y0mQLZ7b4p4dZSXdR35b6CFGHKnjva0b/p18cQs?=
 =?us-ascii?Q?gAW72TNNLenTHxOUEGCxH+qxN8K/TQWy6e7sM8xRrob3OeG2zyM2/O1xYM/7?=
 =?us-ascii?Q?IYTiV3KfaVYwO75LQkeS+nqyR6SE3XIPiRtHXYuIiW3vvbmCJSmuYdjEb8ex?=
 =?us-ascii?Q?7IlL2kS3K3RbUEve9C7EQPt2W+ETGBLSv266dtOnWsNvOqnYeb8CoBx9h6vn?=
 =?us-ascii?Q?0fYILLxCxy2W5F2EFn6afIrTMx3G17zkXiKFW0gQZUzaX1z9kDeLh/NLYLgx?=
 =?us-ascii?Q?u4lqu5SGvVJJhWcDKZNNMpzlxjLRlkNySi6TkBugBAFsvt1ZVMwzWh8eEfe6?=
 =?us-ascii?Q?JoiGccRqA4JqdjCvlYJwwPc6RCgieE67EXQSiXAkt04Pt4aQY5GMc19kaWRf?=
 =?us-ascii?Q?Y6DB+zKXlcL72BX4HY3QX/b0LKKuW+jBXbYF3H5Kwq/uVGw6LNsWrbK4dqO6?=
 =?us-ascii?Q?9hAUG0GDu1gpc6K4WhtUMTdq16aU271GrMHCocCb1puH44mrA7X5rdr/Cw18?=
 =?us-ascii?Q?k13Sgx9rIZ8igAJgjJLVzGIZ/U1r5xeuDwQOOeXURmvLRSraRLpB8hzpgOuh?=
 =?us-ascii?Q?1F/d5gOmtGPxMispeoSO4g4mROcMJTSnsQa2zCtlvl8AR0dhGxRifjYEo+e8?=
 =?us-ascii?Q?lIPx2FYe8Uq6gOCa217GF4I9odkktVr3JDXYZUccvuQiSEoSHYakJugHJNa4?=
 =?us-ascii?Q?FwDJwZpvz6fWfMDBrf3NeXThEF9a3nvT2uIRqGs2Fx53khlsXDNf9+zlZ76F?=
 =?us-ascii?Q?Haaka+77Ba4MUr1bq1u5Al3f+H6++JfGbdoKng/57hoF31XIILFMyPWFTkwJ?=
 =?us-ascii?Q?eFAznAiVB9Zb295Al0lhlfm2qJS8uucpBn0D4XszuSQop2K4P8Y7yni3Ehab?=
 =?us-ascii?Q?+7Qyfw81iS+tGpZAY+0Zrsc6BIzUXM872WAcQey0RmQB9rPG7a6LAJWf2P+u?=
 =?us-ascii?Q?8bN7slUhFbVixEYu9r2xnzEkZKAQmdw83dnkIlQr74byfSbCK5nxyBFpgyJ+?=
 =?us-ascii?Q?P7etuoeV7pzWGMY+rNGEVPrNZU45uaSKwisDlhHbgQRQKRj+WuPMRAnaMZHA?=
 =?us-ascii?Q?VT8JAiW/bM1zEXvKVNR+MvG9n1exOm1wxmrJaTi4dP8acLBZGfujFtF5LROp?=
 =?us-ascii?Q?0vbgUNCg2VP01pJyRFjRyGDtzAz9+kqxu4E3Gpatv4UGeCxLF2kZU7zARRuN?=
 =?us-ascii?Q?PH+yTb53N8YCarlGv6ytDTyqF3taDN/nmH2lg3Awk0q/7qy9nvBJKxT4j/cb?=
 =?us-ascii?Q?HJqwVAvR64k+tbzWzH24PNSuO5jwm02CVOaF7mUXNkrz8XQF/8eG3tYVvviU?=
 =?us-ascii?Q?zeoSpN8rbIRizS+NCivbi3AqcrQDxhulUOsiE7c55ldSxLgRzvCFp89ChTeZ?=
 =?us-ascii?Q?w33DFvB/pBNOtVxx8h1BBDJzER+Z29L1yyFPaQ2xGSEIN/ZAUDPbDoa+7yeT?=
 =?us-ascii?Q?ymC0osO/W64f+wIPm13o88Tjwir2aBloGryTRGT9ZilKSTymqKNYO83i0rw3?=
 =?us-ascii?Q?VGCpZFUyN/xQbksoCYEWjpkoKWptBwNYBQLUMi61H1tgwXwO6LNyQgtY4+dj?=
 =?us-ascii?Q?HkH/gy324SUYWfq1oCYVT9AK/XVBHfzDRcnLHSZ212/+Rmrm7tsZ5XYBpx16?=
 =?us-ascii?Q?qdGiVe8yq65T1TAUorlz+PLedDyPOYgG3DAjQV7HchhrUfi1dxjbRQqmj/W1?=
 =?us-ascii?Q?n97keYv6pxN6Dl7yOLSwaDK9mYV3auKz/6xOyP+PAji/Y7pbeUb2FXI3Lpvl?=
 =?us-ascii?Q?bTJEvPJZ0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a69a7b-3e9f-4837-b88c-08dea4368a19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:28.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3sII4VSkU/iS3pX0J3VzEUiNknDqoQlY7zyOhkN0Y6O625k2ykx8GC6UXHeXUigKn8CMWPfLzKdplM0bDolcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller and phy node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
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

