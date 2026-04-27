Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F039BFEC
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278328; cv=fail; b=nfIFejAf+Ck+utTCTboyPA9nbIr1LV33NvI/npP0XW9vFMaSS5l9Ex5Lhs6KUBk9vqqRw2j0bUUuCyMaNPHRgod0xhdSaLKIJVy1399RxxFUUyAc/tVGZLa5g3dvsSBjzcMFrpwRcef+Czqy/XrPctK9JK/1Gl9YAvMm7QB+25w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278328; c=relaxed/simple;
	bh=bihiHeYheGDZYT6U2jIqZZ4V0W3/VPs7rFSmY5EYhlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3cGPmzXzca5DSI2hbe5xrH7nItm3/EiEbLJaB2++pjkqQIRxoqmGw8RhakeIaVKs37AelfWt8UqUw2172/77BrXRHGQvTu9qbF2xWlbl5pMyfAfhUDezJdvMdIcUn2pxzzlZlPIZdH+62BXmjlWME5BlMR71f3f68l3E/QWnyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DGWoBJ4j; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DGWoBJ4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPIN9VfUJnNzQ1VQ+wr7onM9n8cKMwIciZcMiAWLHR3qC4kw4dErMcfZZnkYP8l2gSDGAJwHgkdvH5QxBYWlnDZdGXToSdbQcFXcQ9INnfXYsEL8z8KgA9QjUfwRy6s+5CTdmRiZ6OJi81qpJKt7tV2qRxJmGvNrYdiy5kYq1FMXl3+bS2XKbEtS3faaxd2PzWrnSwt8foh0TqCZo5Mrkooxvm3nQIEAhuX6svonsdaQeelhEs2lkqyv+6wVpp9Ns/XxevpaaPVV/GJ05sqFr4reDCbyRATZ1W/1AuWaPITfpzETZaY8YehVj8jzqHsvt9GhqazJQHEjR80D6t/wfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVO/y8rumOtoUoI3hMPtEnlPUjac1MAmArajEp819zo=;
 b=ne1dirqUsrSG/vT/eL7ykWr08r6SPagIAH5rX1pLLFNgbt9zWvWwLIRVVHqCaHkgcVASpPsm9aiJskx0DfgpV62bwKCmcpTp7+o+3B63FQUayATkgEHOCgeFdeFfXEzcZY7HSeTrlZ1AnM6quTlUBGBmC7BbZ9t5299KKO69Jk4r/dbFa2rGE3BiO5DEG8ZTOD0ruEO6+u4Gr7K9dn112h0e1xyAbhO+e5BT23HZWPc51i7+zDYW+KBRF9LQAhR1Yc0MkljP8xsZkHujjdvSVhD/rkn5uBvUUlVeYk/nXBiRPZakWXOg6STcc/Ac859yGKnrphH0nhxlqFbqpAFtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVO/y8rumOtoUoI3hMPtEnlPUjac1MAmArajEp819zo=;
 b=DGWoBJ4jBt3WDAnlDGb4KwWAY75munm7+MhYWfZTNSUhia8Aq1GdGqjJh+eoCabR7CFYdJQKPSGjXz1kVs8PQDPbtB7lpAESv6Sq3J11F9aGP83mIh6DSKKmIkgvAUTd/v6oCBdRVE5NS9TKz8NkbMtUJMj/l7/Pwdfn4U4PlebqeQBe3hHOGnEZumwDwQtV2SPUXVBV5f5eFFbKxQb+eb4IpQ6V9ffvh2wokedDzPE3xjSiSmKQAyfHbNXVomDNJwGzYSOXXIF4ah+Kf5btw2Ngb1IS9MIjdg/lDVRI7UZAsu5MHhHgXEM2W5RVhwtFDoTqMM4OiULKHloTKkhTCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10806.eurprd04.prod.outlook.com (2603:10a6:800:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:25:23 +0000
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
Subject: [PATCH v2 5/6] arm64: dts: imx95: switch usb3 controller to flattened model
Date: Mon, 27 Apr 2026 16:27:27 +0800
Message-Id: <20260427082728.3641872-5-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c50fd0dc-856b-4742-853e-08dea4368725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jTFKH++L9jrQEbTm7fJiWggZYRlemldt8XX1hTaf2GpZfc5SaRDi6nBXHs8Nnuv5TeZpkH4GS65yEMxlVN6BZPy3pIhwFImf/4spDg5frBIHq1Tk0WKwvjPfrxTm5BZgx7A5mzFVVdqwyZKh7FkT7VXqoLQF17js41tQfOoCdVK/fh4G5Yg6j1DTv/G7sbyt9mldVW+Vjlzb5WTquv52OxhWyAijdUud76fNEhAXAqnNtRPZ2yMsUOdKkSn4CR3KOpcPp603EtThzC544AE6qHCx3pqLwslryP/8qeA+4qXH/7M3LZXp9CVn7DezWUHPevXsPnHhdyyZ4RUplnY3/1Noe4IbwWGs3If6aUB+1IBSDVfVPQ73pFfe7NmTxaXUhR8RvEFR81/sOYqtgaicOgkyS5oweffBgHEFDdUEmTPV+wdT4yOAfhW/aEmPhnqNLfzvuiY8sHqjcED5RrUCihFyFqICW08HZhlE/t5UbHYOH7peRs7AKdKKKQwL5eNri0yCIT9NOH0aqce/4ePnVV3KZzv7xOpLQNp+DJW9PFXJ1SyPK7xFVrtlnGRwJl3Ag8dTVkApmjfhsaRpG2vPv4D0f88mys+KCK5Rp417IzTYaSbyolWY41cOqhyxMUJ6XVaTtef0/sRDKGwOfS0mP65LOyHTQAR61zExv536EYeLlPnj2GlnAiuOOrnJ/dtZe27oqxSAtF3ELsLAG8ENwJllYLLRcj9f7x78xRCmjgxZt/Z2uqyb2z4IsWggwuU27clXVyNzk9SgyYvnM1pIrNscNMqhqqEw4fQaiqoX75k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A2yPC6zR+QgVZvP8ExFOVJ+mcKOy4BMM46UHaLOKMwLPg3+OSS7wMR0oZMD5?=
 =?us-ascii?Q?Qn0FexY1CTO9F8hU++RUSTffMcGTxYbCup+UeGAmU73Q0BclEx8eRr/CLTyM?=
 =?us-ascii?Q?CH5ulTgHvaitUe4Ek2p92gRrIopvVbq1Og2RjGC2Cq56iAjQhbAoJzLjzZWt?=
 =?us-ascii?Q?iE/ubx2MHXTOee1X6ZQfXgCrC0sW4rYYBCTLA7t6JNDfeTwb17R6zNyep2/q?=
 =?us-ascii?Q?lQmQh13VdOE8lfia9L9uu9G08p5elI/x3hbAdH8zxYREAdlp5oNGjWPxYtqu?=
 =?us-ascii?Q?RXkdEwPyqcNDhbKeOODj2qHYM3/t90p7TO33tGm+hAo0C8i2Y+Rci/aPd/2b?=
 =?us-ascii?Q?MXHT+x+jxdZc+1r359bRCj391oQ/vp7mZ3fHSHbDHN8hmxQ7ccJTy6yvKGLZ?=
 =?us-ascii?Q?0hsgPStOtjThYgG1nNHAv00pYJcEHeKyuXmeFhqndoaDkRcS6r86g6Y221KC?=
 =?us-ascii?Q?HRedHuDyzqLx7qt5taAV00DVtFtbhKxaAXFrf6frv/MMhnf4J542nAv35TKr?=
 =?us-ascii?Q?0JfpVpV/5lUR/kIAry+4ugkgybd13mUl2KWid3UsNrBtHL12vcE7D3DRHtYv?=
 =?us-ascii?Q?HoPczUxqznFB2WNNMkdVrsd1n1Cb18SLGAhlryFfKpD6YgYM6+AdTYjmckhB?=
 =?us-ascii?Q?qOihFagqddCz8vY+TIGDaDdfLkhn1Y2EtCo1sYK3i4P20Qv07OoynDtIzg2r?=
 =?us-ascii?Q?EcbsF8TZ3hN0Nvu5sUEZ3xkPaNJU3Kpqco7PHThoG8L+dTBxtC26s2exWTqr?=
 =?us-ascii?Q?cP5AlxZONlPaB3DbkJij5VnCQ3UmXjQh8ME6cqDm8O57MCoexR/74aJ1tKl6?=
 =?us-ascii?Q?lNk79zPetqI1BTM0RxNB6T4NOAf3AK22mBmXzyfWnNfzzJVSVCwU76zPLW+L?=
 =?us-ascii?Q?fQX4a3gtWGUU7YSju1Mf3krDQmVVFcHLCRkQTokcqogYUIoWZ/w+9BXEkFEH?=
 =?us-ascii?Q?xiHdZDycrHxM9208XmZl2N0xqaeM4ZD2OPbEh7kZxhb7pKQS1nFXDx25kFdj?=
 =?us-ascii?Q?TKfMBReKuFzhxFmeh/hsLI2cDOjr11f8mO4T2dGxAF3ZusbfnFrpIUjm8EiC?=
 =?us-ascii?Q?703VMMEYSkAMTd31NZXWtsgXxJlGxjb1fsW85C3+O/7xPmvMAP3WmAVe0V3u?=
 =?us-ascii?Q?nuINM++NovMlSoDYFTQ0G0jNgwyAyAZj2NCcUTOE3Ggcl66mX0iQfVafG1H0?=
 =?us-ascii?Q?PrZ+ArevZjbrq9SmVdUK29T1mwujU5mW4/MMDQPr+H9F5LMRqsHXvoXqDZve?=
 =?us-ascii?Q?/HPxGan3PzH+kzBQWeO5BHs/4bOuNPGNNPoMC6B2ncOyjaZ8aRJ85HZPHZi0?=
 =?us-ascii?Q?FjeNrXVuZ8RXh5rgKfJPkUCsSzhDT8gsPxnSjklRujL8O5igRzmofhAvqXRO?=
 =?us-ascii?Q?bAKFd/9K4vUiDLpoEuBoP3m0Dzq8jUaJwtNw2F641D0vaa5RGF52GrlDI+2p?=
 =?us-ascii?Q?SjzWA9d5a5tAtl+ZgbfwDfXzlSt4kY/re1HuYAeWzWSdjEBBRrwxfdNIxyIB?=
 =?us-ascii?Q?9Ph20BgdnNh9GaHGRANLsolsDClcV0zYyNhI2RUq0wED2qPCJG8e9+LQemFx?=
 =?us-ascii?Q?kBQtTkAK+uERyMy6uro2C7XGEdUCiCom8p3mPkAlqidQdfmnlWAJaZ/aVnBC?=
 =?us-ascii?Q?mVYYytwZqoRwwVFRyghAexzbOfxf7L9zM+cyEzGB9rlM6jRBytoYQneJTUBx?=
 =?us-ascii?Q?CLlOuK98nRzNGYgmcpzZZ6VxaDcd5pE4Mlje/XgD7TA1Vz4uVrW0dEwkoEuz?=
 =?us-ascii?Q?HnUED07Y0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50fd0dc-856b-4742-853e-08dea4368725
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:23.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx45LMO2UaEMjYG5CtOl5v93axgHYwFzE4ZujM6OEXPsIQ5pwznrKqWOSOD35dv34h+CdYSGXuUnk6scar6f5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10806

Switch to use flattened model for USB3 controller. To enable USB
controller with restricted DMA access range to work correctly, add a
simple-bus to constrain the dma address.

Note:
  This changes the USB controller compatible string from "fsl,imx95-dwc3"
  to "nxp,imx95-dwc3". This requires a kernel with CONFIG_USB_DWC3_IMX
  enabled; otherwise, the new DTB will not be compatible with older one.
  As i.MX95 is a new SoC and is still under development, it's acceptable
  at development early phase.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add note in the commit message
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 48 ++++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..80f935af5b49 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1772,45 +1772,45 @@ smmu: iommu@490d0000 {
 			};
 		};
 
-		usb3: usb@4c010010 {
-			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
-			reg = <0x0 0x4c010010 0x0 0x04>,
-			      <0x0 0x4c1f0000 0x0 0x20>;
-			clocks = <&scmi_clk IMX95_CLK_HSIO>,
-				 <&scmi_clk IMX95_CLK_32K>;
-			clock-names = "hsio", "suspend";
-			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			clocks = <&clk_sys100m>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+		};
+
+		bus@4c100000 {
+			compatible = "simple-bus";
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
-			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
-			status = "disabled";
+			ranges;
 
-			usb3_dwc3: usb@4c100000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x4c100000 0x0 0x10000>;
+			usb3: usb3_dwc3: usb@4c100000 {
+				compatible = "nxp,imx95-dwc3", "nxp,imx8mp-dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>,
+				      <0x0 0x4c010010 0x0 0x04>,
+				      <0x0 0x4c1f0000 0x0 0x20>;
+				reg-names = "core", "blkctl", "glue";
 				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_HSIO>,
 					 <&scmi_clk IMX95_CLK_24M>,
 					 <&scmi_clk IMX95_CLK_32K>;
-				clock-names = "bus_early", "ref", "suspend";
-				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "hsio", "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "dwc_usb3", "wakeup";
+				power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 				phys = <&usb3_phy>, <&usb3_phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,gfladj-refclk-lpm-sel-quirk;
 				snps,parkmode-disable-ss-quirk;
 				iommus = <&smmu 0xe>;
+				status = "disabled";
 			};
 		};
 
-		hsio_blk_ctl: syscon@4c0100c0 {
-			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
-			reg = <0x0 0x4c0100c0 0x0 0x1>;
-			#clock-cells = <1>;
-			clocks = <&clk_sys100m>;
-			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
-		};
-
 		usb3_phy: phy@4c1f0040 {
 			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
 			reg = <0x0 0x4c1f0040 0x0 0x40>,
-- 
2.34.1

