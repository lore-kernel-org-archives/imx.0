Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ACE3859EA
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050782; cv=fail; b=RcIf6aEkNoULeOT3FbG1Atu0Aa05Z77z0M2wFKi9ym3GM8vf9D38xuamBrGyIbM+UOWokiAtw6llFB9Q77DyyKtbIas6aQutqzHAJWTAqst10fNe3g9PYEBA9Ic9BArb0MH/Owlxt8e/feXpOIqKJT5dK4MAaZ0T4S3k4tM6ZYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050782; c=relaxed/simple;
	bh=hrhQf3yte7BwalS9wE9TmOdBvXwsLwP0yfP5Ggkzkwk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LMU8htRu5jWB7Ex+4WUTm7OJQZiqDXbRGpeBslXo6qzU3QKEZur+3F/VAM0vMTHcHYTF7A8P44xwZ8GJWMecTvzatkZA1t6qgCKQ7CCYr9gPSmpBqcGrHYpoNu9XeHMrQuSOK8Nfet2+wP018qTRD7TxC3WEHIpyO7w59NW5JYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dajMwEgo; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dajMwEgo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLZwqfFK3mDINWW9a9WW5Rrm673EMUX/MFjxJxlCOOCsYXk0GBvv6mZRsMX5YHzIeU0Raq3kfVCQlwvCtpTzoiPWjIY+y2vol9yEMkhtmAJm2NDP8+C/U0G0BKGAInbmiwOEuJ/xvizgacNdroPHignek1krr3vkH9Yx98HANAsZncIEdbdIX8NhiVLCQ7ej65p7zMbZX0hUliKP3LdCDgA2LwtXRnalJXCersiPT2Vi56lRHF4U9mSjRFvBuDgqFLGNNQA63TYBShpITiGzeL1FaqdK8YyymAeBvgsbyo0pDYeoet1Ef1n0vmaisUf+GkLAqIXyzIT5VDODMMBAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/4zKHWkBZrGdSJcmQqAtpxrbcjYGFb9bwBD4bKU6do=;
 b=KYol5fMU1YVBr6kQ020H/OuXd0i++gHZMh4NqxlCoeSPt90SjDTWdmNht3UyquV2AcesSAE7i7vBS1UFm8NXyC1nuh3JMla+yNtIiOfViIBrjq4a0avNRFcV8olTdLtqh2aWkx2a0Yda0cUcAW+3gWLS/zrBDzeJRAMM3eZDPmyXoiX5xjs1ErcTIcVIMmSX/jwusb9/gEfUW9CwAyTeqoxmdlmnQAEp83hYT5KHlDAWeDL/SzXgBCfBvy/htnK+NQi8VknnltBcGBxNbXv5yvOzpGG+25h66xv+7/K64P822McoeLwlZKovV8mo5nDdrznymCUYgp2R//VF5IR2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/4zKHWkBZrGdSJcmQqAtpxrbcjYGFb9bwBD4bKU6do=;
 b=dajMwEgo3kd7OOvtrKQFcv99uVb4aRgmAWzINnq83fehTpi9ndlfC95Rplg9QtlivAiPsrqg8xyng5kaulMbFoG6uII0LbD1460+mPl8Jvld0ght2v0taP1R8psCC6gLrM+55azWWCUs2/HiUfeJ8lyo2pUpvRg1Dkg11CAqqChHfBmXqN+l5THf8Cg9J+J9t2EJYuk3pHyWGme1dO4Pmt/Deri/E5oDYKPcBolJQZK3wgnTVzIjAavRArazEpVOV9DKSxvTxHkCksxK4QmVScoTGaH7dZKUncTKNbjreKEtd8oaKBWykkrZvlE2MPGGRKyee6zXsG5c+f9NjJHIZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10970.eurprd04.prod.outlook.com (2603:10a6:150:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 10:06:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 10:06:15 +0000
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
Subject: [PATCH v3 1/2] arm64: dts: imx94: add USB nodes
Date: Mon,  9 Mar 2026 18:08:06 +0800
Message-Id: <20260309100807.2844925-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10970:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1657e5-761f-4595-91ec-08de7dc37fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	p8uReNwbd7X0Bkrw6fqzn/YD7EeJ0s6O4/aNjK6MqZHyBRffvu6rWB20CYruuadVD3EmTMRQbwydGY8kiMoAaIHp1Peq0HdKkcV0fwwzjytKfr3awhxwcxOcdC4W3pZmX17Jcoeop7VklW2zbFtHG9yasSkQE83a2TyJFr+R24FczCGrFv4YhMWR5OPtu4d5I9GTxkSwl6NMxJnmSsoBKeUMV6dGTyj6r4sRYib1YNcUjsnuOnhQvf+pBdMa0ggR6zmqdT2AQjOsPux2scCiDzgOC+fVDfyliX6cDIwaxhR6s7GnuXmO0blaWDPK9a9kI4DSuUg0xprd7AeY4AMuFsorkHON4EJ4OBbxR+FBJ8dCgjmzUqdeJ9X59MpunoKJvQsFXSBzAljBdHV/FpS7vrwG6YH43MG8USMZ/GeWiMHnnATJpV7aqo0y8TKzqwQitby+YwpKMTBj0ZzUAGC+z8ndhCMNHvy+ollSzwYuWwuLsQlYu6+rEL8Rji0J+KG8oZfbzbyPLK85XDybvBR21UGBAaCfCtOCr+q2LO4j5VBkf5xGeKbOq6Tw8uC46IdDehsXPhJWq3cYfyKa/Cy5vWCaDGeg6cGkxOdn5iPkBAbdVg8V2fX/hCpfnMDvP0XtgekgR6HnksOQDoxFm5nKTHEbsD5Q0NwCBlvEx7FPVuIvJxcF0jYnvMcWKytjTQxXrIjq+QyhsIuepazZOybTzGOrl9s0OVzmnSRZikww4D3FGkM1jnCdJ98w40STzFmYr+milblc9dwI6oJzMu86m77IocnmHfNyj6C61MPy+lU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bDJ0qtzfb+yN/AnGqyEuLIKmkIP+xJXvc6HXW6YbGxC6YQ7ayjsi0G+cVU6F?=
 =?us-ascii?Q?OPUw9nNScWbKp1xtERvodU09SsFkTy5AylQUvqlv5OkvduO/Q1Iw3r5iHFNY?=
 =?us-ascii?Q?nkGT5pLOgv2wbgKNox0TXpAmLFQW95JE6102SoIyuzN4P1oGxARmSLWX8Dl5?=
 =?us-ascii?Q?QLyrdMEqnTPDOJOzihNtdU2yiMjLKm32wXY6d8lgHE5oSrET6rENeDtwA19m?=
 =?us-ascii?Q?sauMJPutJj6sWrdiLoUoBT0wfrRY/urn7y7W/5p6x06/khv7lfgFuyEoGkvd?=
 =?us-ascii?Q?BDs7cbSFZgioxXQmNQPPRdp+X7PIAXDyzqy32on7pxOrzLEyoH7L3j/kamLN?=
 =?us-ascii?Q?/5f+/r14YK63Umb8z9kNkTBKvocp8rSXt+1G7D/f1IT1VFFWVvJX8MDVJFbI?=
 =?us-ascii?Q?hawwXFumSO9eN+BbFM4bSS3K/SlP1N/4I6dTjwcE4ptIaFTN7ozsTIaNM/yI?=
 =?us-ascii?Q?+H7MbwmOguIBLSfHwmDLx8I9flOc8TQrHGzKd3RilXKahh2RUjJGw0gwEm/+?=
 =?us-ascii?Q?xcUJfXyGu0R45p+sq4RDaQ+t7IPQKdZ5NWtcx2d+7OLaoOMaZyB7cux/Hdp+?=
 =?us-ascii?Q?H6POu9xiZ2iXzkVWM5qGn9yymmis7MzLBr40IYJWU+0tqwpOfRcqHG5KzLgq?=
 =?us-ascii?Q?uuvo74pzVijAM+QILd3iDDf5PpunUpUKjFBrjW4RRumQC+lY3UAfbGgbQ/C3?=
 =?us-ascii?Q?9RQHQeUX1oyDMLxfK5kf3vGy05fiGluaCWhj0DBk3FqI+peu/ovS5+EuUURR?=
 =?us-ascii?Q?Lr3ZsWvQH2dK6/wIzBz2m3q+8ZwZzRlqyJFPwzRZGwchrUVoTrfobO7mblT/?=
 =?us-ascii?Q?OWwDTniaiRDeTRfiRnalrrvCakAeZoNumlOnOFMQbDrcbHz6zfm1H14fwutp?=
 =?us-ascii?Q?by7R4Y9+7LP5BJ3NT8RqHeeAAgybPCQn7J3PqPmPlmnNNcreaCryZ4BiMLVP?=
 =?us-ascii?Q?1osMK2RaW2ZTcgnhu5OlTbNf1oYrkRgj528YBXyyTq8vs6xDL1kgY4Q8NKU0?=
 =?us-ascii?Q?sGI1kry8Stider9m8MzAnO6HAsJd3Xy4sfNBe2KLTVSAF+nxSZFpAAm03g3I?=
 =?us-ascii?Q?x814aqGfcui4KUW09tcmqixs8UhNUoKIDWQNPlM/wYTwzWhjS0+EU/IG/1L3?=
 =?us-ascii?Q?hWL9Rvd0A8e8JOb2aJn7MrhT7WK03ArDRpdM9U733ZHkFiR/AVlswoqqNipX?=
 =?us-ascii?Q?MgYaP0g2/02F+db1nhc5UZVNOWj+kbd1DFjZ5EJ21pG2ISEsUhXJZwDytIsH?=
 =?us-ascii?Q?KVoBseNTYl5OyiGfuyGG3HY8jvaYZs/cmUtg6SlMByVBBXiTKZjx4TigVD6F?=
 =?us-ascii?Q?4olzQeOfmOsEw3jVd45mrPxy8GgU1Lg02E7VOVC0Ys9t4OK4OOvpcHKJrt61?=
 =?us-ascii?Q?/ARabjtVto03sVbbAyy9rE/KpeFbeCig7q8Ox2SQk/V++CqvyfMdvc5wZecw?=
 =?us-ascii?Q?ZvTHmw3k9KX9rRa+G4uqp06X5QwU709vYDUEiGeMArBrlKfHfBFTlpu7LIf0?=
 =?us-ascii?Q?DOimVfgZCIEk4wW1liEFcagEO4wCOClvpj9IYz3fVqLwVgtq23dhxVQ3QUfb?=
 =?us-ascii?Q?443ZIP2vsbCX4iT5cb8BSCjrlYQSC+dV0IfgS8b0NoPMaP0LcUBh17rql8Lc?=
 =?us-ascii?Q?SMNzSetT1P3ERMj2NJqvAlbZAJs1QpI7+AU1WUCHPOKRSp8fJN5v6dJ7MY0c?=
 =?us-ascii?Q?2sIGu3kgIWRL1P0Xb3XnRKqAIlrcvRwHET31xxp4m3WSaQaDdBSeUNcXOWPJ?=
 =?us-ascii?Q?FVBdHKYBtg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1657e5-761f-4595-91ec-08de7dc37fb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:06:15.0580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgxWq5VTmHEtNY2UGNdZVhzgpDL96Sh0h/S1HFXPeuQyt7RqWLjKJqvz2EBtiSBdXtKU1L9l2r9kb2+xIwHSzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10970

add USB2.0, USB3.0 controller and USB phy nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - move usbphynop behind of clock-sai4-mclk1
Changes in v3:
 - move usbphynop ahead of interrupt-controller
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6e..38488147a3ef 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -139,6 +139,13 @@ timer {
 		arm,no-tick-in-suspend;
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX94_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	gic: interrupt-controller@48000000 {
 		compatible = "arm,gic-v3";
 		reg = <0 0x48000000 0 0x10000>,
@@ -1223,6 +1230,60 @@ wdog3: watchdog@49220000 {
 			};
 		};
 
+		usb3: usb@4c100000 {
+			compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
+			reg = <0x0 0x4c100000 0x0 0x10000>,
+			      <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			reg-names = "core", "blkctl", "glue";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_24M>,
+				 <&scmi_clk IMX94_CLK_32K>;
+			clock-names = "hsio", "bus_early", "ref", "suspend";
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3", "wakeup";
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			phys = <&usb3_phy>, <&usb3_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,gfladj-refclk-lpm-sel-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			phys = <&usbphynop>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		netc_blk_ctrl: system-controller@4ceb0000 {
 			compatible = "nxp,imx94-netc-blk-ctrl";
 			reg = <0x0 0x4ceb0000 0x0 0x10000>,
-- 
2.34.1

