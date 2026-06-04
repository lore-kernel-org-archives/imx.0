Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B63CF660
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 06:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780554372; cv=fail; b=hjskqB1w38FBH0ebSbjvinhQQ34n4tLUTQKfywcHYp5p4Ef9NqttKkYbrFQwm3rYvMmJe6L5U0FYiLO37f8JaEtOoXY+7e9v0tHjY6bo98BNbudu/S3l/KhnJNYF9xYzzmGYSYCEiW5csiSA3dsF9oOlJpiksZmzYAqXi4rZuxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780554372; c=relaxed/simple;
	bh=bo+atKkXCSIbHhQzsDF6Rkze0GgNeC9p4w1XIbBrh/I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ONVYKMkxEfWkY0aQF/E8nCefEfXpQf4TNqwHqEQ6qgDY2Fb8FY0LW5DbNfgkPXjqbkeMG8bvXgr4EyRf8ukfLFq5bGS3HjRyyjC4l+JuDBPravjhTELv2J3BFKulwWrZvSvPPgAx30fQmTy4cPh4Y4bs/egMqXi7zHE8HRE6VPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LSpOkGVp; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LSpOkGVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2WxLNmPm+cUBqEiFd6xwzJHF7BOzlg4Vi+a7Z0e/pIWyNfYwwT5CoZmdz4XOood4bhHdYmd0KjybcFJrh2ZDaJwVouGXFDSbVap+TLSiKHwxE4QSqcVrZugp4Bh3sX4I1RlXcGD6d6myq/t1qXy0rLArRII9r22kfrNtnADZspKqfz9q3hviBp1079lfSKnbDliDtrDwhhiqDKEIWe8VfXCCkNTJIYKU66by3a6HNLYgzPCgFTpeW4Ktlm3U6Xhrl2vQP/AB5VIhQNCiddwnmTtnlcllFdwdRI08CpGxZfvx+qyGFzz082sqouQFnypF6Gla+7NgeAt/5nkS+NdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57aSWLvm/X06Nigw3y+jZYzjQt5fpgXXw8HRLd9PuZQ=;
 b=hXAyDCLxxNO5m3a/Cn7Q5i3nnTw5Yl6X/6ZuaNafQ7T4CCjZFA0HALG6hag1NGa0pYtjfwyiZtvey2n9inhjm0RMHgy1trhMrgArtZ7IghFjO5QIKdxV3U8oGc2mfeC/qusYu3cVmqUeaqAPpFSKJqo5Sp2aLzPT0FS5tA0CqJbfrBL+k7Bcci+k9nOzbdaB84od6D6IqfD5cToHx4fiRkne8d9dxjEMJXrpc8w+hKGN/+BJPFhgaOGfBXwVR79+csq5Xv4lvrz+5WdYVBjLsYq9ZLMWEtVT5uKLKy4OrpaQjrjn7PmZqJDC6gJk0EXdB7LBCIfY0pi1tz26ipyfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57aSWLvm/X06Nigw3y+jZYzjQt5fpgXXw8HRLd9PuZQ=;
 b=LSpOkGVpIWX1lrzVrdaf2zegzm3fzQmwbKr3kHG1FtaSuSIwrXCT8Bud/U7CA/boues0N0UWg/5XFgVj5+YPCuqiuCdEdm4WGkTXPOo1v1sGmaBO033gQczQB3BPRM4O9YNczx9Rxa8HhvYO2V9ngmGwzM2X9uXGlsMoSXv1/7r5yDl3V87UnAktLu8kH6P4ss5wYNt50hl/W+wZN9ZG5XLgh+OJ7HmYKQZkjDs2TQ93SB5/oMoyO4/gzqaGmVY5vH0lLfpNEopGgeOrNJ+8hdBKYQFr7pSe9hPsU29su/CQd/6qzc79y4xUrk+VmiMU+4+Shi+G1HUJcPewYu9tNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:26:07 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:26:07 +0000
From: hongxing.zhu@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2] arm64: dts: imx94: Add Root Port node and PERST property
Date: Thu,  4 Jun 2026 14:28:46 +0800
Message-Id: <20260604062846.310810-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0084.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::8) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 4feefd1e-f5bb-45df-9169-08dec20228da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7416014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	44zmXE03ViAEO/wv9FZjryB2NHxa1+ENDNCpkfUB/I+Zy6JQQZa5dFPfB9qATE+0REJEGt/A/LEFV5at8+pJfWoYEgJZ4o3xIYldX4sS7HB+Ys0pWeqg5aM4/+hJNhVdj5KpAtP5xxN363R1QLBA4RvsSWISEKwVEeO/YaNHLVO8NDn2L7xL0YTVKmdqZAAGjcpCrwq/e9YDt5PlrFrWl/dbMs9RBESjnb1ODMkP2SktLk4oJBv3qKWIaj7kbrXmgnUjMRGCwFE7cHTDZMtQBZqCaF8BdoCyuw26TmKOOOIfk0io9ZyBxNdXP6mv1DscgZzCBQEreliW2sr0s3QCGDR1ZkXgoygAsYEoz8Q8Wox+qSmzHTBC7ptLip7WYlibDFCXl3CuMXiGtMD9nl5YC4lC939yYocIsjju+pfqalSagN9o9404PkUpUxplUuj3F5+TvtLx6zkyFaemJnIKPdg7dyOHY1TTiWm9nrnd+Wn8kFmF5V8K5w7Dig0pWQPWs0qLyuvUq+0bMlQHcksIs1vyGjNoB9oy64EL1Itsbw9wg03SGcv4MhvuRxlbBwAGAvU8Bw6rqAjV5DsFNIZa30TZPSZFL7Z1A1BwFYy8sWBT471/EQzXxH/mSXTeluKGeTIYmfwOREIRmg49y+YCajLR6KgJinkbutBFFr/YcyZhZ/544h/6Rhq5rFJopPlQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7416014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hBd4rLxTkChUU2kUaKxdQ9TkbOzQb39airtu9lays1Q3sCSNbpO+1cWh0r0O?=
 =?us-ascii?Q?zyOr4x1SiDN2wXdmG4oSTDfHXu8D9Up4GlA4bZMCWrAnmlgfr+RwDGQcWFGH?=
 =?us-ascii?Q?Cn5+c52MuckEJsSg2bITnoLQ61x/E1SYJ7mnTapkEvygSFe0sCKIWHKRKJ4t?=
 =?us-ascii?Q?iH0GvaWx22BJ78cXAhBrRxGXCwGHQg4iJP4IOJX9iVGyycV8U89TaNgDnA91?=
 =?us-ascii?Q?apq5x7RANMabbTxgg+BjKcdm9PzAmjwt93LK8BM5h+KsLr9NHt11St98Uq0H?=
 =?us-ascii?Q?VxT2zyQ8Or66R+OBLLO8VVPi+UMZEJvdMlUbqs0SR94Wv9QZPGQA4C25qqwi?=
 =?us-ascii?Q?YnzMPf3rTq88PWVN4xLXdiIurAgbxzzpx7uzD6Dh42N5Lw+fONRaGUaVxJJd?=
 =?us-ascii?Q?Nv/sv48F5IpBVgJVreSOcCve4ZtOX7SmT36Z03sd99ijB79vqxpqpDNSSMAV?=
 =?us-ascii?Q?oKaDAMrLPpcJMLEzRFu6+Ma8MZqU6PIqprh9LBoMQV8fZTHcoi/rOm4I0KDK?=
 =?us-ascii?Q?xKu6Kxw99YvhGfSafumJZYFxmdBrDAD7rrtjmOC2wQHaHamV9cKpAR1FGpl3?=
 =?us-ascii?Q?fPr/is4KE4u7pkMpQK/M3vsndcmw2o3aU0duPddZo/WFOW6NwXBoBMm++qJ/?=
 =?us-ascii?Q?iaP7a4MfEHk7UG72bIFuueg0YJ+Ba7lZhlQplA8Vp6kQK5HR5Cs3z0QcJMgI?=
 =?us-ascii?Q?v6zjw2VUhk0ahYGs+/QdWIeAr4bk40CvtcxHCgkdd8MlnFFfnLWJbpk8I2Ps?=
 =?us-ascii?Q?VKr/jTDmnP4ZSsFR3akIZZzrdMGkfmHSRWqoba/djmkkc7OcGXwSOT4crBBP?=
 =?us-ascii?Q?YnN3nO0/9OJFYyFr+HG3gHSKia8xGzYp2VWvsIB7z50RhOEABO0Aw35yi9sH?=
 =?us-ascii?Q?+dH6bxRXKy8g4LeMDYyK+3zEYSDecN58AL6UIM4Jigc7UvCbfd6lR46SaS9y?=
 =?us-ascii?Q?AaHuc+1jy85BlBLpEjgu1jt8LLPA77wsun8W0U2uhQgi8luCIr5pnEHcYoYO?=
 =?us-ascii?Q?2vopklsNxTLSGrXCCUD0IK7WpPKzKtY6Ajy8lTOzTDfs4dg13+1/+cp3bBLe?=
 =?us-ascii?Q?EnCgwjUCPxwxkAJFLe6KwFrZUbBYFE9EqXYmnrz/R89bz8cX0U8nQjoEaM8r?=
 =?us-ascii?Q?mIxAv0uWLiMpBIdyHQc6aiHDP0AoKJDibeuZPB3566oB9k8gs1MMx/G5F00H?=
 =?us-ascii?Q?bSO4sHV1i2WLHMTHkoLfETCiwUXvfofYKffo/xP5bCCMqiaXfd2Fw/end3zq?=
 =?us-ascii?Q?3dBllaoKFUWbZ6f1VB0F1LWSkGQ3WXpq5c2ZtbeP7GPNrJc5Jdz8Oir6yYwI?=
 =?us-ascii?Q?Z5dN3pxMj7ezhA5TIUfic1XmL0QLH09knLQzG4t+skBTB3BNtqfkylxKwm4b?=
 =?us-ascii?Q?+q8Uzv4i6AhQqBIZ/ji+LZq8aW521kfqPw0I+tZUU3pbG/oZG7RH9hEQt5ri?=
 =?us-ascii?Q?HDzuULnY9dGohkXA42v8BBF3/oO9hoU/WSw5d036vWiZ2WBJ8WVGnIwOLaWM?=
 =?us-ascii?Q?5Mhpj4GkbKdok4PJQsr4Idy/NB7MB+I5t5L2zddyefE5UOu/eEkPR92ZOVum?=
 =?us-ascii?Q?7XeG7Y2BTa1earLhJDi/CN81ZtgdgtxAsissQ5fvZxoY1kiKH75cT9/TuCNT?=
 =?us-ascii?Q?G9jYXVf0GHtDBxksAYEBqEvxOiwFsi2QMgpZHZPCB8fIFw7epxjh1En7eSLV?=
 =?us-ascii?Q?uNH6PnrhfBJxOJQtPsL86jyNbMj9GZkn0qa1lsV08JO0SH4+lA4ooc4S3O6w?=
 =?us-ascii?Q?K6bT8ZfNsKTaIMlAQ7ZZvyxtXCYjJSFY2jf089jT8MvT+8WYmAPG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4feefd1e-f5bb-45df-9169-08dec20228da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:26:07.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WmxmYiZvQsadQ9vBhCcQaKvA2eIlLm91TUHS7MofHbzVZXCJtX4NlDyAs5ncvSY1N57N++AYR5yWuKmyjqdHARhLvrf0D0xbU5WKR0Ud8JcZ15Q+Zd7okuzU9zK4bPc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

From: Richard Zhu <hongxing.zhu@nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 10 ++++++++--
 arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)
---
Changes in v2:
- Delete reset-gpio properties in PCIe bridge node. 
- Correct the "reset-gpio" property to "reset-gpios".

Since the patch-set [1] issued by Sherry had been landed. Add according
changes on i.MX943 board too.
[1] https://lkml.org/lkml/2026/6/1/1461

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 1f9035e6cf159..dfbb73603cb24 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@4c300000 {
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7cfd424689507..99d66484ded04 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1034,12 +1034,15 @@ &pcie0 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
 	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -1058,12 +1061,15 @@ &pcie1 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_ep {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index cf5b3dbb47ff7..01152fd0efa5e 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@4c380000 {
-- 
2.34.1

