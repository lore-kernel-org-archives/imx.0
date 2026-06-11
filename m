Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6370536E494
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164124; cv=fail; b=QW5FabA80ONHJJEjPJpMpPU7KPKeIkMsXQ5SecjpRVBtLN7teOdYsvunodDCTICx78sMA/fjhZMZiM9J2UFs0n14sCg+OYtuYnL0e3N0lIN5zmQTxNCoSHLmwBjHi0VvvrOhxsPLuJvo4cMdsHZXRuS86IZcr3NbN4gTB0Fdv30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164124; c=relaxed/simple;
	bh=ZO+tTl+rpaCzOk3fvb3daG+IWaTuMb/i4nH2wm0NnS4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TgEi1FJ+INAwqwoYNhLzrjUZ6LQF3kCWcvhNvGd3QS+mPLnEgrylntGMpi2CQQMc1ISMNc6EXCkfib+J+rvPY6UTkObVUV8QSdmQM/gyp2L0EQNCmbFWIj/NmXr/IQAkA+yYJZ1WPfXq8GhTeclM+zA3fTvNQrMoZfZGLeuvavE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=auUrMdNq; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="auUrMdNq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+L5Mp8Wr7tzo8Vn63BJ2xJXONGdZ7XKNumvP3ifyQlqAjOB6rb8GMnGiuW8cr4L26g0GJo5YEpWSO1sjJJP6K4jTUfYlJh5c4NJKbTPfuSQAibtheX9Jhxd7I9CEOyEBS1irlh7Jblo2H7wY78IgV9zrVDQqMamyPnKty3uGpVMOCEMTyAeiFSZ/Iym2APPsL3dDaaF3bOV4cAvS6iOyGslGI1HFHYs4WNyl6KVtP7rK5ATinIeW2NlzCdoEyNSusTNkaicaMLtVyBFB4sebac8AOe0ww8/y0ehqo06K/F/IG6qQ7+rpkF1f9OA1BWC5Sxg0nUmin8uBhG0v+cJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QFveXB2tUrDn9Y9qK3hMgMQQFy6a50kHWQD34ylhOs=;
 b=JmEKsXZK47q58RM7JPN68oa1/CxDzBJB5reu94wFEtEtvvK2+ZEu4yp+UWT2ieoZjtMQz2Os7CzXxtJDG1r51xjx4e9TECmG7O+ftAuadnjslaqT0bFrbhkwn51yaNIWsX+30e9+F55n0QfbaIYDz76WR5bbQDrbA7ZCS9lQHcuKcicLYMR3ve0bn2bfHgJ7hiSqnU21FUiE9vNNYNzzatSvNnIv9oGdaup6VqFkfq9jOhvBgE9Enc5GOACPuxyWyF+8WfFpR8ny/wx5U+cUkx5s/cMoW5pfIKpjTxGz9aSKeNa8hbYflHq1iL/2jB+1HS2JT9v4PL1zPWlJ+Dsk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QFveXB2tUrDn9Y9qK3hMgMQQFy6a50kHWQD34ylhOs=;
 b=auUrMdNqfnZCHf58degFxvWzr9AeJsZCnvTBtKPKmkgwyt8e2xPIv3ulR2ff5NaUcIylyyHzz8c0OaJrt2xV+PuUbPH5n2MxzFuWX01zXs5INAn8LgbmR5C2qbV+33gNINhAN2/KMghK1snTaNpA323NFkfo9k4G1c8sBl06V8zTtFFj6xrOqE4eXDm84lU/uTnXUFfU/A71opEFlcyk+PmYMxMJgZaerWD17wfTl6b39BeuyMiexlz5oFNwpneFzbIitvoyMRRcZQ4U+VBZ/eKDH9vyb9AXYxreLycStadsH6BOtnz8ihBNtQx4S0/vjYLZSldnPfmALy8nKazHqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by GVXPR04MB10659.eurprd04.prod.outlook.com (2603:10a6:150:214::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 07:48:39 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 07:48:39 +0000
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
Subject: [PATCH v3] arm64: dts: imx94: Add Root Port node and PERST property
Date: Thu, 11 Jun 2026 15:50:57 +0800
Message-Id: <20260611075057.2892593-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|GVXPR04MB10659:EE_
X-MS-Office365-Filtering-Correlation-Id: 5588aa7e-69bd-443d-0efa-08dec78dd9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|7416014|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nBDKcok2NKl3ey1cO/M0J6XobqlIvbePgsTAd8nzx72hb83qxOJX4YBUccTFdHMpbnlBmpGyF56y49PsC9CqI1bFJhw1AbXZtKOPrNK7wBrMSoo98vWG4EvH3tKW3D94OgNfWPzYPqXyx9UkDTF0SEZlvZmsHLGYeUbHh9A/55cTAkm6eh2jE+vthoIj+CmkseAXuJkCpM+4Lkz0d+q5szPc8SA9/ctqW7PXYFmqRhYbCiqks7K73LAXbFbOVSEK8PURa9P01gzSbsYyUBWxFZQs+e+/vc+9ZXTGO7Q9ESEdn/4JPzmloVf4vZlElOSpkQbfMQCFsfGdJYr2zXOyprnNwPq5boULC7W5GM+T8nwHd+I1UA8Vi8V1quqBEiwYyJ6ElcJrguxSGCXJb1ZwaYHjMKuEC6MXLLp+/u7qPfCsp0QKpN0mIle34sssGRIWojulPNxw1j+17qi8kNhUossOEaK3edvzkneU5j7pN8M5opJkHU6L2iuXi7pQAuYySMvPNorC3/dKd3fxU4VPa8iR18J0oo6xks493BMIgl47CdGEeNUCPXkkdrS5SkzJmziSIwE7lgiLCAglklcZlBrp0cCJG0cRivDVXoyucQnt5dLbYSgiPZuwjGl/JmkXbaDR4m8+3nZ13ZHT9bqdbXe1+rdLmlELXBhgv955d81RDOECwtEhDGm4eQZk39Q7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(7416014)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/gCAK/SqSW+FiyRRKmEwhUaaaT1FL6PYDIhk2cG6dpUTuMX7c+oeFQ3XgA1n?=
 =?us-ascii?Q?FoWqLgs4AGtJLMiufcuoEMUcMj78q/dVBv6XzijhWBbhgzwdM6uf/gDM5Wg+?=
 =?us-ascii?Q?n11IcSA0D/xR9Klotd3g41cFSoRlXQ/wR1uh0CWuoDTGJiqSRMGOwL7rWibv?=
 =?us-ascii?Q?VEDrMBdvKKbi+BqHoLSUB5rXXkafVA+s6MSNNqcQku8zwF5IGthhO+QDEOem?=
 =?us-ascii?Q?jB2pqkCpJkGPDYZsWX+qqdhiEMhaW90tgBaKQIxWnFBLM4pjCHiTBIkgpcYM?=
 =?us-ascii?Q?OW94rmh93gALaTYYoEJQEjYww0TNaBYlzzWpnvlvdfesQ4ZbpL6uNIQgNb+b?=
 =?us-ascii?Q?UKWoypZPSBWDVwp+/O3ln28X3TJWLx9eab5sHC19W4bDIUWPwbRQ7u9Q2y8W?=
 =?us-ascii?Q?iPP0NzMV5oyc4tkE9xTubsHjTTvmJdvXosxXD4lNQR0iTizzlqs8vCMQQb9y?=
 =?us-ascii?Q?VoI0k4IwftHaLEN1Vc/sxpPNL4vAPoWrtKvrMqRy3eyn5kvsdDk3KNV4n/tN?=
 =?us-ascii?Q?RhdBGu649K7/6GF7jOnl+IyMUFXg3uRhAh5Pf3l/7LIXrsWRwqQATH9WVnah?=
 =?us-ascii?Q?D1OCPd2IHGa/EknZjPz/fKUD2ds4PdovEWAHMOM9xPyw2Tw+8xKgV7QeFL3v?=
 =?us-ascii?Q?N0K3zvz+GNARVkdCBGYqwJ05pg4f7CIs0vN4iPnRXstAx2UFvBPcBbQ+RRwx?=
 =?us-ascii?Q?DSk3/60lGZEORUI5Kdo/DxjvNj1ocjoMdcPLG4PKad28Tq2xBj/lMj4vdPn8?=
 =?us-ascii?Q?LQuUeuoq1icfXqOWd3ntu/Ng1hp3QAXtYMdJ4UzoQN3oWuVtp3Dp6QOJYqNK?=
 =?us-ascii?Q?RPJzE4RzZzh2FYi5HlaVJVRvcXUaqzEOenmOz2uroKHv7sVrr2AVjcfVuLyb?=
 =?us-ascii?Q?jOQ9mhe6QkI8WrOPdqw4mqxikO8gVwnVwGGWBX6MvH3SQOBMue3b6LXEl16I?=
 =?us-ascii?Q?BwnmyCqsmpSO2HE9E/AH665+Y9eCQ5JS9NK4/2AZEv9/OQ1CjYPMQymgevlG?=
 =?us-ascii?Q?zrcfNGspOalycj+yvpL/rlt4Gt878C+G8gou2DKIUFfQ0ejS87QinzplG+Zb?=
 =?us-ascii?Q?gvqQ7Ez4JbH6Fjl+9v25eSpIQASDarxsJT9prK+f8WnWVrM8vSu+pAhOsaNC?=
 =?us-ascii?Q?O56qBCnlOYxdm1EHYAhmJa6bYhA9yhCcSdWfdGOmeipq0W4DEL1ndFpnQZ3P?=
 =?us-ascii?Q?iBpV1TzvlnDUjPNASE7yB9tj6g999WfE6wD7TNwt/LdZ3CdDbY3rW7XlVjnb?=
 =?us-ascii?Q?V8QmNHDcstzbJqVJQrWngNyolEUvTgw2NMthu2hZ/+5/HvJLe1TfGuP3wEgp?=
 =?us-ascii?Q?fPFghkIj5woTjTsEaYnqHdB57vAoMF0JrVQhvf7621dgNmPTsiCOLnmi7X8/?=
 =?us-ascii?Q?YZeB+GFrcYbAaE/wRvuRhj7cbFypRMwbVwa3nTZbqxWZE3K8FHPmTUoo9JM0?=
 =?us-ascii?Q?i5I7p69pWTXTeeEDvjOPGiAe1EGNBWiY0g1yFeAIDJGC1Dyxiz29dkdquuyq?=
 =?us-ascii?Q?M3eH1sHPdGHjLflcm27WiKQxupxv1zFRzhmw9YnOhoKcSloEdQvtpJhhSp+E?=
 =?us-ascii?Q?Lu2xZghfWRSwQ0/tWOXufNkCE0UigpLmvXygS0Y16u4g2mA0U1rjeOd2vz6D?=
 =?us-ascii?Q?pOPi1F4/NWTtJAFA0tzM0ArNAAohRFM93aThxP6TPgc20/A+VOycc6UdTZPx?=
 =?us-ascii?Q?VysXLCEN5MM5zzIeeV9+FaPlHsJkAiUYxAw+lfGSnSNWqfZgejydT7Yck+oA?=
 =?us-ascii?Q?34cd6SPf4r8g+qKSovxnA+9/daPUMTwo/zwwxegGHTnbvVWSIKID?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5588aa7e-69bd-443d-0efa-08dec78dd9be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:48:39.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRhhjQ5pjrlcGBJvFD44u+8cNbDSv2aJ1Gdn6xpPJY+qkFzIXeA8AT+0uvSMvRBG3s7xSjb/mArDIXTL8aGiCxEH1eLKYHbdkZpvHt2IjlIHoneRL4EXc3sGqON2Zk4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10659

From: Richard Zhu <hongxing.zhu@nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++----
 arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)
---
Changes in v3:
- Move the regulator to Root Port node as well, since [2] had been
  settled.
- Collect Reviewed-by tag issued by Sherry.

Changes in v2:
- Delete reset-gpio properties in PCIe bridge node.
- Correct the "reset-gpio" property to "reset-gpios".

Since the patch-set [1] issued by Sherry had been landed. Add according changes on i.MX943 board too.
[1] https://lkml.org/lkml/2026/6/1/1461
[2] https://lore.kernel.org/imx/20260520084904.2424253-1-sherry.sun@oss.nxp.com/


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
index 7cfd424689507..674410e541cba 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1034,12 +1034,15 @@ &pcie0 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
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
-	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
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

