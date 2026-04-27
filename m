Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3939B4A1
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278314; cv=fail; b=E1QG61/EXy27h6oiXe+JnawrAILiqx2ehHSCoDqJTYP3ALFLKeDyX0iiIKY+/jqQfOF3HqDkmfODuR9Nm9mkwhMBHBSH4VavgujmSf4uOkYrbZUw8BNVb04UFRznPhXEMrqD7BIxfZ35+Tksb/OfodAURSSBvbjcZGR/cJVAU94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278314; c=relaxed/simple;
	bh=18e8RT716IG/vCEH9wgk/FO+JY2kpO87BAqLOZbDVvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2r+fhPvNsGHdCGhLuWUPNz0Qi96MA9AR8yZ9qXWIuBGCkQEf2TfQzdyv/Ra3aLAyVGdBSBwa5+IwC6eY5VgY1xJPC1J8I2I3tff9qP+y5O3rVi+FQ8SKqGuI/8snn0czh7vqqTKWVA366px7Uh/C828frZhYXh/qklzLo/MUPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UjejhNIs; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UjejhNIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqpsnxIgOxJ9D274p1PNyr9b9ZFQMsiBeDd8Gj0zihaZMuM5CKLjEi5+vgxxSwkwPhhpbs80Vo/KDabzTCqglBK06bS1uqvADhIC4sxkzRsQW8tr8aGIAA81J4kYWdmG3duxqjkQ3bJ0+PPkpSycz2FOIhfp57lTut7Vy+dPlk96TPufrwF9LGEVDw/iAyORQ6se3x6PwOGUzgx2aANMcwqjsWhi7j5W/+iM1Ejc7wqmfUIZjGYB9UoVJM//jaJT5OP3oTNfZjBApI+/4EXHeuMlEeKX60KWxXtSkIsob5aku5DJ6Z8vP8Ayc7APTS02JrCouZMx3tRBYgC6MCCOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVpCYZtdIzK8a150FMAUG/RAikDaE31UtW6Y0pnQGWo=;
 b=BZ/5psMspRJ/vKn/k8kLwg3iLYbLWHNSNgZ9oRpY9YGBgvS7bFsIBNWGVzWmjnhx9JTluxAcsYkDkzMjIFr/guev/kt68iIP8TcY2eSgMIN1O2HZfZE8YldsLbHzzn1vWcYOfO1eM0kGlDyPtDWy3EpDOEMbDgGr40V4NjDwMNxSs+487iLj+ENnRAZ4bWkgqqrFgmAxr1o24o7E4oEgCPCyT18NiXCATJnsPsTFV2Y5q4zjkrR/OZZBFQ1HAng6Zs8EQzkLdxRiGoLBbU6EDNr1dSZXRV3xdBnih0lbB7zBsw6x9gIavodc30eQdIxgfcP5FhQl/I3GzRVWLSIzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVpCYZtdIzK8a150FMAUG/RAikDaE31UtW6Y0pnQGWo=;
 b=UjejhNIspykk53pbwR22VdaZpWfvvyNEKN2+VV5QZj+jClVT4a+AJ/fW2dZog7rx/d9gyIrkoOnMVPADvDPHZ0AkeDn1iLWeJNGPnG6HTO1DTW33VF5jaqeziKELEvYHBLL3JlOxdIBtx4f0dOHjWyObHuZIkOx+OTiZkjr8anZJkd7ftIOq/Jci2cuzag740Bk1eXW7zvs/ya4bymyI5zMMKUXMVBepu3XSmCAjmwpIEWxOGk2TeQ8hloSYqpc44WXG2cgV65fAm5492au9nF1Nh4xFH2X2ez0w9fNFqEJ2xwlS8rqs+yB9d4RRoUXBQR0pRfGVG/tW6jvpKafrYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:07 +0000
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
Subject: [PATCH v2 2/6] arm64: dts: imx8mp: switch usb controller to flattened model
Date: Mon, 27 Apr 2026 16:27:24 +0800
Message-Id: <20260427082728.3641872-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ea64f0f9-3a20-48b6-8e12-08dea4367db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7BFM+KafUWLdehXHFoQ0HHlk6SfinVKL/iRt+JGS9tzKf/qpQbnA9w0MDhcGb9Sv6RNxrrOHnAXUV2AW7I7SfwJdt1b0ZCUdoMRxpCVQE1BS0evuOxba2E+tIlxl/MhqrUlEdeponZf4sFbs4mNBFbWSXmrRDal2okrYDHJd619uk78MewEp2p6KtWRk6NzxUvsSnUbNAp+84aSWjtnJ2V1Yqj1AQymtbmL6LMv6iobfKRAbGt0SGgEDZRlAAinQ4QWUQ17TptHDkEwI/KVeA3ainnl1gYewngcUzpDR0QintrUogo06p/Ia7h7ecHwHDku6/tY4PNkd9NzYbbor52cB/0ii1lsdxftJqKZEC8JdcTMGW+MTK7YaMdk9IFje0BVVPFs1rSJuACAFq5X88gAr6xik8cr6WgQuyvdZ6D+5TKivXb/PCYIzOAX0PKBBpJ9LdHRkIEC/jpH8O1QCIQHvyDg7xUhw+Xeu7j7QmKJRUC/p9uwtsBsYoi3qj/z9Fs0Q8RpIvNEVU/NF+5VM2w39nSjaJQeC5DHjPcaH9X3t9wVixw2ZGVnDMcPBIHiNWfzvwGkiDhiNpXkNnnUS2WJ5L4G1q4i252Ys4/QSZiyLQTbNj+UE0/NUiQo3QUO/1LJ+X3RTXUkyraq89Mhg8mmjI87kGCEzSUyXLmW6DCYcrmfnBSOSkMoGFcDwdOo7Vqotz/nTltrWtukEfpSPedCH1p6LHvDqpw3mxL8fStDz1k43WLLd0MA7lWZlWDOmqt+qH6J1rnGsAW7r6S3hgm0VuH9/OORMejWPTDc31tw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tIVufLjtnzkZ0obfhyaYA3PWNZXW65B9PsualiE+xYsyYPkNCFAyHnrMaBS?=
 =?us-ascii?Q?TCVNGOW/7/uSMkod13feNNHE4aK0Azx4qAV1Nm4eV/fse8Kzo1pcVy97sOE7?=
 =?us-ascii?Q?aO94Rl68IuXN7Go6m2dyiD02Ixi+FdrkkVzjpnkInGcyWcgP3AlTbfiahd4t?=
 =?us-ascii?Q?dbLxEBJN5iWcpgTczZU6bsDq8t5Sm1MTeQ2fdhCJUFRXwp8Sdj19CZKoxXy4?=
 =?us-ascii?Q?Y4uiTNMXH9GFrZLuDg9oR9l5WHSg1TS1hXdx0k8MXYTUWNkP5cQF4HQt9nwO?=
 =?us-ascii?Q?qCVbi4DVFUfKe9rcnTIPPfqdwHMuF54EIZzIGpg9g44YoK32Ny8aE6/KV6sl?=
 =?us-ascii?Q?Va4BeDxrgKupI+X6eyCQU+1BxlQQyg8Wsx0MCvHDZi0W1EwFJ5gQLDnLjf/i?=
 =?us-ascii?Q?SxL+ZDXDuqKetgODUnSyuWD3A5R4mYO6pY/eqUWrW4/SNzJBWBOnQY8ZMX4r?=
 =?us-ascii?Q?at1sTC/0qq89UQGFSygOI4sqGDEBG1eBHruJ5FfoKGcdxKPtURDZ6ojczIjT?=
 =?us-ascii?Q?jiF89OKbQ9u7yXTTsgYm1RuAqVV1Y4tJTQecw4dZ7rIk57dppwttGLnIe+uY?=
 =?us-ascii?Q?3WyJv3ZTK02PDIjpkjUw1BdmRkVpuiT9Rg78ibULYcfekL5KoXIQbZpVPv5D?=
 =?us-ascii?Q?e+Wcp1vpHBBAKL4QIX3yCd3Ln+4sj3FY06HxPNeO68p9AkIGBojdca/81ul/?=
 =?us-ascii?Q?4a271eNklEhXusDO/aXRp6KLViFitDFX0jpKv81D9CQ3gAGgfzYvM438zKiT?=
 =?us-ascii?Q?gYESufDZfv9VbppCEUTG//m4TGgvl3HEw9faAH3wO1GbcfP4aOcDvUJeAI/o?=
 =?us-ascii?Q?C4qGst1enJFluskLajYp/9Jpx4b8mpRb7AxJPelK9OGfgl0EIL+dYfcM7S5B?=
 =?us-ascii?Q?HXPMUrkSauswiVWPgPVSeBV97kxs8F884nM1/T+VhfpeIkW8MWHmRYuD2Pkk?=
 =?us-ascii?Q?uT2G7ZAm3FgFVMQxv8kjcinK5Ax4efjcKwsEkGHCNTgqPD3MfeyYoR+TyLU6?=
 =?us-ascii?Q?yk1i2d8+vzlDs7lptWr/poRC8Ik6Uw4BNK/CXSZsz8JU1IRqQHmqEgcVv+71?=
 =?us-ascii?Q?R1YVtjLRBkMFxm55+BN5gXLitKX7MNIqCClS7gZNpBO7j802A0J+ebilbpKt?=
 =?us-ascii?Q?FOFLe1wKhfvEfPDY1UmhtGFuGzVOlE+gOMd01E6YoM1XDJI1g7uxits9QghI?=
 =?us-ascii?Q?6ON6oGFMjwWCDlKmevLA+6oDnXocEqjUc/iZm0LSmW4xep2mWYMwq22dTVGC?=
 =?us-ascii?Q?YEn4kYiOM+Je0WK4/zjN7drTaDS4RpQxnKAAaCHgW7Z3Ccs0HKLrGwKfevG/?=
 =?us-ascii?Q?wtg8aLleZHQXvHy32sS0S27GiVbBrQ1sCzU91264v0AdO7FIGGi0ABGJpf2/?=
 =?us-ascii?Q?ftfRVykJpiXMXyBxtnzaUaaey/WRvMhOToJ1etm8T6M84lWXNbBWibvdreMQ?=
 =?us-ascii?Q?mXlWSYb2kVL1JdJ+ig5IiBPFk3JsQ0V/fiPIojsjDAvrd5Oo2Yh2piIJ36re?=
 =?us-ascii?Q?Zy7K+LIgI7x1/oiFAewGXr3h6ed/IWrIrViXaUVRRqZhraFYLUqE6h0oLUpm?=
 =?us-ascii?Q?lVT+/1uYZtB8C7oVyqvo2VNHHZNz2QtlW+WoIoxZtCY1eiOh1oZgjSPJ4Ppx?=
 =?us-ascii?Q?vjbtJtbYlAFIn9sdu293LTJ0SNLKLk3S5JmRt8ON0GEZBMCcj6UbkDQCzBVI?=
 =?us-ascii?Q?ytjMci0Nysd5SCs+TXpFIX/HMiD4CfsZ+q7btZD44DR44w6IzoylHnvx/6kN?=
 =?us-ascii?Q?txSAYcaROQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea64f0f9-3a20-48b6-8e12-08dea4367db4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:07.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuwXz4GQ+kQnwqI1E/WRhGBaKCar2azo9muur2H3iHWR+9qa8ktYRgfBK218JahT1rf78JJIzIKb5w1HJ3SbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

Switch to use flattened model for all USB controllers. To enable USB
controllers with restricted DMA access range to work correctly, add a
simple-bus to constrain the DMA address.

Note:
  This changes the USB controller compatible string from "fsl,imx8mp-dwc3"
  to "nxp,imx8mp-dwc3". This requires a kernel with CONFIG_USB_DWC3_IMX
  enabled; otherwise, the new DTB will not be compatible with older one.
  See commit 76fc9452a6bf ("usb: dwc3: introduce flatten model driver of
  i.MX Soc")

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add note in the commit message
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 113 ++++++++++------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index cc0246a9c003..8b3aab14ccf1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2229,67 +2229,6 @@ hdmi_tx_phy: phy@32fdff00 {
 			};
 		};
 
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
 		pcie0: pcie: pcie@33800000 {
 			compatible = "fsl,imx8mp-pcie";
 			reg = <0x33800000 0x400000>, <0x1ff00000 0x80000>;
@@ -2390,6 +2329,58 @@ gpu2d: gpu@38008000 {
 			power-domains = <&pgc_gpu2d>;
 		};
 
+		bus@38100000 {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
+			ranges;
+
+			usb3_0: usb_dwc3_0: usb@38100000 {
+				compatible = "nxp,imx8mp-dwc3";
+				reg = <0x38100000 0x10000>,
+				      <0x32f10100 0x8>,
+				      <0x381f0000 0x20>;
+				reg-names = "core", "blkctl", "glue";
+				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+					 <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				status = "disabled";
+			};
+
+			usb3_1: usb_dwc3_1: usb@38200000 {
+				compatible = "nxp,imx8mp-dwc3";
+				reg = <0x38200000 0x10000>,
+				      <0x32f10108 0x8>,
+				      <0x382f0000 0x20>;
+				reg-names = "core", "blkctl", "glue";
+				clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+					 <&clk IMX8MP_CLK_USB_ROOT>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_SUSP>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				status = "disabled";
+			};
+		};
+
 		usb3_phy0: usb-phy@381f0040 {
 			compatible = "fsl,imx8mp-usb-phy";
 			reg = <0x381f0040 0x40>;
-- 
2.34.1

