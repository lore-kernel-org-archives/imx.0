Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D2539A802
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278308; cv=fail; b=qdAgbwh+KWSziaBmNWu5qufJcqXJQU4gcUVz2o2HgKu/PfcPJ5vjBatBKn8cuGhj5cK6t5OMunX7FIkp/rwNV0XBnL9xyP5SXC0gG7vv9TQsafM5Gvj3usTmQAy6dZ6NDMpcJmwjCaVgaqYAEiX/8WJI6arr7S1MIAVmI9qSViY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278308; c=relaxed/simple;
	bh=2+W7xVzPDUCcLfJro5WRJj/c1nuZhhaoqynEh1ys3/E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S20SzUZDw2d5S76nzzjiYG0gwWywjEc9aQCxJRBRI+2J79nsaNe/xvcBOe5Vqpj8PnXXLxYjUHVrA3AJvH7dZ8FVKovX4WYYJhL8MyZooExfuFVkKSU/uOrpllNnzVAqxwPAp1sN/D7EkOkPzSuPC2u7G5oBwewOxrVElO5ubfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AcMVsyzL; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AcMVsyzL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfQnmZUoIj29NrXcRGFOTcyO3L747ISVY400WmZI2P8KF/As1MICD+mRLWlSNG9q2uDB7fS/nahq19j6+1QIvhnHzd/HwP6SrrB4Ye8GqzNCWkTIVZmbDHx11DrbizeBLcIEI/dr/8CauppQEG4akxIEZB4tbMO9biATMY8V2Vgbd+wuDkYwJtJIUclh6ENC8ExuRoPZ/HOUBuidot/dutcBQsVbgkVvgtN4UYzx7Dy5nwHZbYz0/8ic2CMN8H+WZBuW2Gs6dNx3n9xVRqBatZ0wfH5bXPkz6CCZYeELJG6KMSy45FxRz/hRps1S2Gi630DaBIjpLpcaZVR1vfXNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqVngJOYeyfF9+vM670/T5F2x45BQwNeVtXg0rRZEkY=;
 b=IoSuwYCAM8k+kDBXwIa+n7kx6xcXQHmI6RhQ1qoBrhUod9cFdNI8rgBOWvCm7B8SHtIXNGN7fn1GMGstgagd/kW31A8j1Xr905uEo+AXhhAPVCKo1uG8JKIw/qRMt+kOuPp6iAf49jRKQNrOegvqYxkCWgqLLOAIAnkow7+196oyp56cHN/XHzFTzN/dnkXTRSPUAJUW3kKh1oz6BGtwkioUvRwSaMQtP1Jyj1clZL3P6Je9B8iXEJMjbLnoXKn8Wnx8Bh7NoevMmSH8ysbreKUmJQX7xBaBA8In61Y1yorDuV7zBzDROUPXzGPdYh1grfly5bCTh5mQ7tZOG1HqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqVngJOYeyfF9+vM670/T5F2x45BQwNeVtXg0rRZEkY=;
 b=AcMVsyzLLGjjzXNadlK5DLYbAUgWrEiF/tOshUl9DDPpJljW8tdSnOFGWKWtBIuCLfn01ViTt4zt/ovmwbHrW4PctCtJguoV/rzBrV/FxHLNudkSIkTv3hDs5CifY5bmx/Lfb+2ilLcZ2CYsuRENfo9N6D6FJ57Qd28N4erveF5QRo8YZmNYmJnEAl5S0nJSs5plEjnPfTsaLwdvKNiX8EJpqLc+7HpOMbCp4AbwXHlLkMO2xldGQRA6qK4J22sbcI+mBV5Ztqe4igAZr5SE97l3ko/fPxsJUOfxtDPlFcGEWuvlUrHGME/E9pNX+l6KA5WXWVBF8OgQ1HokNFASdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:02 +0000
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
Subject: [PATCH v2 1/6] arm64: dts: imx8mp: reorder usb related nodes
Date: Mon, 27 Apr 2026 16:27:23 +0800
Message-Id: <20260427082728.3641872-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: e87bbcc4-4f8c-4669-7b13-08dea4367a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	btGIejoMlT4ymIVgZe+muxGqsBd/wO3njE8kR2ZUTTCOeNV3ZfXybZwCTeBUi+gEpwb+B4AiQ3GzZqhjugLW5qI2vRsanldkzP0c3ZURLvMJOqHZ2WU6wufTt/XyhlkVyKWxVuXyAPggMv5duvOO16GhlTwL/EmfKEbXtJg88nPB2HNj3HOp/NnGcN34OV66+IK6GxORvY9siYzIUr+qfN3Zltc8l2LFVx/nWp0uNmrdQ2WGDSFTqEq7nmfJQmOyk3WgCusMnhpcPe+lItM5kF5S8vmHxj/NgbUXVKRxOWgacZLBgd2JXfm5NWKHyIhKQ1LSdol2d9eCfA5k49ltpTemBeR2yaAWtevXyh3HEk+LyqcF63GvvYzHIY+fg+wkf2N3BNy1IMtJvu+8+IzUWTlnY3Ylk8UkrjoUNTrgTHDgJE5Hc0WTt8CGJCiu02cBLyFkO8csJFSKebXlY+AUl5bEXur9XTypAoFzso3n5qjGPStsLuxCaQ6veG5oZ9Wrp6Xk+0Oieuci4QbaBzjyXANjo1ZJnPGOD31qNYNPikmpfgh9hPTsKWqrr7FPqhLE9/drmMQHAatfBYgXubgZ8NEh22V+Wyr6DrcZpNNHuB430wn1yFQRtXTRjDCQD3XhN+GKD+vJVuuHALAF7RlgdsWXicD1BptxyYhAbbR4BhwTunFFO4s4DYSDBDW76TBv+cor2qaOKjNobELMRwQJTEmaCHaHWmKMuT/wS5CiS5gpeuJjCRxoSkf1JrMCjvC1HwxXPyBiVsSCAPoEQM6oIQA23YT1MP5FNYPX1w6M1oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rhn8kniND8Ny9JdcJkUqh15PpFKRhRv6eUgXQxbTE309ICVDA85fnbqEpUOx?=
 =?us-ascii?Q?BBTd2/wRN+sE7NllcSgpAxIM5JOj/NW25vxWMS4deoWJcs3bUFdmHEtixh74?=
 =?us-ascii?Q?E607rmYjn2XNwZnjvmb8KdAelclRaNkSTV5DYJzLKab2w9dd67g2/4PGi9a3?=
 =?us-ascii?Q?40vBMPmir9ux4j8RV5KUXKlGUxUEAJ7ilFIGlsLoJLO7ur+dnh3ZKBDaSWUM?=
 =?us-ascii?Q?ge72NOQXES+MXCFHQTNlIoptaYcNZeQIzF8QzjoO1pByfeqS6y+5cR8SObc5?=
 =?us-ascii?Q?ZzoaV7qVai4oyjiuofbr1ps8sjuAvTm02j6D7FIHNgxtSCvf0/MugnPN/85b?=
 =?us-ascii?Q?pl+jR5jAnB3BZ4kTPczub6LQE8TCaBfVVud2J3Dg2BPwCMGV8474z+Sm5DB2?=
 =?us-ascii?Q?iNEUm5m2nYgnWpLvbygPa1gzz9yLS0q155Bo8ivyiBjlhOyE89rQW6Vpmy/b?=
 =?us-ascii?Q?oCxImXY1ZyQOJF2aXWTZ1whHaazauKAUVipN4K3z+o866qPbNmxFu2s7QYYu?=
 =?us-ascii?Q?LYH2ZRBGXaYf7IMCYQFzR3dDX20VEuFBuqC1hRZWgtdLIV+kjcM5QYq4Iwnz?=
 =?us-ascii?Q?pjT9meV7CA0ck1PCHn8UMODvNdZ9U6L7clrSVlR3H5+2hJSfqanYTHl1LtkA?=
 =?us-ascii?Q?LhZ5/GXZlwDsTOSB7fJ2db5V2nPinyfO24GY4MX2vf38ZcEzkG8J3oqrBA48?=
 =?us-ascii?Q?wrDYJOWjqKtAWHSsn0JmJcYe1ShX4aUPjJxxXJRn9aANNyINXe0YsOe1wBxv?=
 =?us-ascii?Q?MqP3a0JJdP7hx3B/MhyNA8rRMXHO9tpOYb83PtMGwbTB6YSE2yXgUuwVKgp4?=
 =?us-ascii?Q?dmJcNt5Es0q6CjUUFUcRX4cG0o5Le4SC3avqe6gwAkx2isJm5JyNTlORCigO?=
 =?us-ascii?Q?8+5OCGXlHKE6CRkM+HzYJRvopPvNT8VBJRWDfsC8eGn+7HMakHyUVYAKMv6Q?=
 =?us-ascii?Q?qk0V/vXfIYmduqWCnbxXVtZ1zpjxvuc2FEzVIQ3XsLwJk7FbAbLIpp1fK5AY?=
 =?us-ascii?Q?i89THWjXGfCHEy7UjlSj7vGOVFk9r/yL4lv6FWLfbsJrcQP+1k42T5oChGKS?=
 =?us-ascii?Q?nViAmCPNVZfMDOZC2nqN1HeiUPUmekcriu9cjMBUrPWlgiMaslAoL3xaX+tL?=
 =?us-ascii?Q?rtMrcMPyz+t5gLRg6KUbZcpeOxpM+JaTDLU0a6L2P2e6emid7baP43KzoOKl?=
 =?us-ascii?Q?Sg0uIExr/gLqKib7ptLR4U1cJepDuEbcuzNV5mNBdwN7Z/ZMGvUEk370qN1C?=
 =?us-ascii?Q?pkwMEfpeU1BdhOnWQTdCXwMr0BNirD/gfkD2EtBD31NBf0higufdtPoG1xDl?=
 =?us-ascii?Q?b+kM7RLWVwW1GX8szy/YvKBYbT3IY2dF36TPjtr95S3ZbwuC4anFU32tBPJp?=
 =?us-ascii?Q?L+TpqGzbqgie0c3ME5V162IxIQ/GtCDmcQVSLp6y3eg/NwwlAMHc6qr81cCz?=
 =?us-ascii?Q?5VXcHNyEnj3tYc6PHKXL40i9oRrU+9JDFiLOhhZ3eWQlpXtJkbfD6/x09UWc?=
 =?us-ascii?Q?TCs1zrJbPbUhDmzFWj3dkXqIFhorI7eQuU0r9RELmqkfv6gvsQVmJXVLZ8vg?=
 =?us-ascii?Q?Vx00TZs5GSbHHYQ0zWKkoMLKb1kbblkCUDbELRzl8Ka3cHakORzTpUcnYBcz?=
 =?us-ascii?Q?fcq4J4zWA5NvCBjhmYJUi91OgoOBt+dPZVBsGXd9lcvHjKDx5srCWgzOWPQd?=
 =?us-ascii?Q?gxCIpDPJV0+LtOcVQPiO3owZSmvh6f+SnxPVMWtyE6WZq4W+RWgHtryQCcoQ?=
 =?us-ascii?Q?KG0rIdI4hw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87bbcc4-4f8c-4669-7b13-08dea4367a93
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:02.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MopYOAEu6vDm4b9TWp78Y9j+PuLGoGtROkWGCtpbw2tAnw/xgGsZlcnH+EmhToTVEG8VFOq/2PmEm4yRri01Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

Reorder USB related nodes to improve nodes organization.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 170 +++++++++++-----------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619..cc0246a9c003 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2229,6 +2229,67 @@ hdmi_tx_phy: phy@32fdff00 {
 			};
 		};
 
+		usb3_0: usb@32f10100 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10100 0x8>,
+			      <0x381f0000 0x20>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_USB_SUSP>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_0: usb@38100000 {
+				compatible = "snps,dwc3";
+				reg = <0x38100000 0x10000>;
+				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+			};
+
+		};
+
+		usb3_1: usb@32f10108 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10108 0x8>,
+			      <0x382f0000 0x20>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_USB_SUSP>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_1: usb@38200000 {
+				compatible = "snps,dwc3";
+				reg = <0x38200000 0x10000>;
+				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+			};
+		};
+
 		pcie0: pcie: pcie@33800000 {
 			compatible = "fsl,imx8mp-pcie";
 			reg = <0x33800000 0x400000>, <0x1ff00000 0x80000>;
@@ -2329,6 +2390,30 @@ gpu2d: gpu@38008000 {
 			power-domains = <&pgc_gpu2d>;
 		};
 
+		usb3_phy0: usb-phy@381f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x381f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_phy1: usb-phy@382f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x382f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY2>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		vpu_g1: video-codec@38300000 {
 			compatible = "nxp,imx8mm-vpu-g1";
 			reg = <0x38300000 0x10000>;
@@ -2407,91 +2492,6 @@ ddr-pmu@3d800000 {
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		usb3_phy0: usb-phy@381f0040 {
-			compatible = "fsl,imx8mp-usb-phy";
-			reg = <0x381f0040 0x40>;
-			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
-			clock-names = "phy";
-			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
-			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY1>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		usb3_0: usb@32f10100 {
-			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10100 0x8>,
-			      <0x381f0000 0x20>;
-			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_SUSP>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
-			ranges;
-			status = "disabled";
-
-			usb_dwc3_0: usb@38100000 {
-				compatible = "snps,dwc3";
-				reg = <0x38100000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
-					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_SUSP>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb3_phy0>, <&usb3_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,gfladj-refclk-lpm-sel-quirk;
-				snps,parkmode-disable-ss-quirk;
-			};
-
-		};
-
-		usb3_phy1: usb-phy@382f0040 {
-			compatible = "fsl,imx8mp-usb-phy";
-			reg = <0x382f0040 0x40>;
-			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
-			clock-names = "phy";
-			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
-			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB_PHY2>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		usb3_1: usb@32f10108 {
-			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10108 0x8>,
-			      <0x382f0000 0x20>;
-			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_SUSP>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
-			ranges;
-			status = "disabled";
-
-			usb_dwc3_1: usb@38200000 {
-				compatible = "snps,dwc3";
-				reg = <0x38200000 0x10000>;
-				clocks = <&clk IMX8MP_CLK_USB_ROOT>,
-					 <&clk IMX8MP_CLK_USB_CORE_REF>,
-					 <&clk IMX8MP_CLK_USB_SUSP>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb3_phy1>, <&usb3_phy1>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,gfladj-refclk-lpm-sel-quirk;
-				snps,parkmode-disable-ss-quirk;
-			};
-		};
-
 		dsp: dsp@3b6e8000 {
 			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
-- 
2.34.1

