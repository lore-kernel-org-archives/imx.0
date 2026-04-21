Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA43BD226
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768765; cv=fail; b=MsmIOLaOOutCd+cejGuRYjTqlWZt1LrZuYXKbhxqkgXL5eaUfFwqdRGpHEKYb1Faj+G0gZ4pMp27WhNqcUJ5VPNn4+hLA8YmTpqM9fmHadgJTY839Zg+DsSwXyu/P2DAvG4Sd3xGZ2hrk0sZmlVzu6dYXJ3A8mF2GWXQwgk1Mr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768765; c=relaxed/simple;
	bh=lon3HcAQZntdlNLYVEcftR3gNv4WWnNw0RQC9TrDGkY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sgAGEE7W7n6DNdggvOcgNlWDgqOzr87pZRVXOCzNb/E5KAzdG/vRARfVUSwnHOY6PfMeCSViQTVtKILMTXaE79ADMsVeswhhGJdwB9PlZUyfxK81j6sJGqi4gPOfsFpmDdRMNtGnNw0g0scjSmKMTT505FvT65b4yI1avDEMaMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GwQPg8co; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GwQPg8co"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LspC6xyiG0+/gxWoBhhgBdhmXFCzO3fYVryXugWElWm9mfvOimJlQM+cVEaxBWd3hNj7WkRUE/SNFwi2vCLjw74HNtYyxaCuGMIMD3MEojmto+orOzAWnNNRdsFlsZzBBUpr3PAWkLl4QyKcix015yCEDCoVqm48BKlvbwHa943GyFc0BfhxyDTcbk585pfNg2i2VikYNfRqGoFsy4jdTfbvF0WPwv+auxPQvVIJH8D6BJohJmamRl01tpzBv1iUf9tOskuvUxM22xXy6EySg+Zmncqjzb9I/ZzbUHv0sphuYbwFMNxD7s4X4mlpH/PoRXZPOf9wsScPyz/3/VDHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whwl9dWxqkLU5NwxhbBzfKZ6ZQGC9jxrfF4pXCobsm4=;
 b=uQSlbUPU81yU9p5J8xS9bT0OWMTH9xu51crRjSN1FDUCW8Vo787SgX/zEICDgP/D4j9cNp/XutMAXQQAweNMWqD/LNuSaR0sMMLBg13yKz3EANdYS5PnrLglPNUoOThQsUhrqtE2N14J0Za1BksXO6KcgwtEWdNTH1q17+85/eneBBGHXNUldLpY9C7nUA1TCJjg0/dR9vI0nBGBLz8CizDwIldX8id4576T0sla4aoUyWskMoNWbeCa4NYFLza6fCrNlmC8WFFKYW5HJN6LDVZJjQbFh7sE3G4f1nWbXh+70t/ppMR37Lf+Qu2zUmBscocHY5xjWWwEPXkJ2dxhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whwl9dWxqkLU5NwxhbBzfKZ6ZQGC9jxrfF4pXCobsm4=;
 b=GwQPg8coJN/LarldWi2rzLOo5FTV9FrnRL1ZDGsbKhwjg/Efjm1INBIwrTjZbpLqdO/rqSH1GmLDrrfRrx7Btd1Sa6fGJjlNsIrTiECJ3MwsGQHeOcFsAPZvv+hbgXyFeuRZH5AOJdE58qsj/aD9iSqHecg9KVjsQAAJ9MNPqvliAPGqh0CPON87aZqFEsxhhzEdk5AFlmIRG4tbRgm/EFcLsD901oQVWLJYjXsmH32vqIklj3zNbUsR23hhTLsVfiYP0yj4aLDdtLjQo3gG7HY1JjSNEOs34nUZCtozsCv+laBQz5sLtd5aFs/RZs/wIt9JXZ8VBlGPSJzm3Z81Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12270.eurprd04.prod.outlook.com (2603:10a6:150:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 10:52:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 10:52:39 +0000
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
Subject: [PATCH 1/4] arm64: dts: imx8mp: switch usb controller to flattened model
Date: Tue, 21 Apr 2026 18:55:00 +0800
Message-Id: <20260421105503.1416566-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: b979e904-f145-4aad-baf5-08de9f941af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	a71IXMqDs+4HXJ8vaNSpTIbNY5pReknpxRz3eBmCoAAwB7EjRtyDYbXtXgCaj8v6kFApvDZ1N3ao5+F2C41XNwlRSFDpWr0Kv/ldTAgpn/UWrIP5M0eQF8mUHUT5t5SjjPEKan8B+qUQkUcKwPDJjsd+Ig9e3F6lWOdzLm6GT3Crpmbm+hXcXzZQy6seKO3qhMT7VMaL2U/LSBaZ4gWZdzsz+KJOGEqrxfWxXd8vtcYwn7ukhQ+dCT7QaIhYT1FOIyVPegWsi/Cg8NBE8LmfkQ/tOEvSGEnlRAwlS035vOn/HpSMLzuVBoipu5NKLxls/iZ+ZqtWRAT/9kdjDBg1jRTGY2txFsXPTaIP0OtapO4P9C7k5o6GA2UAJdVzqkuDZz8zxQJJqoYhRq/sgFb1K174OLqdUBblwjyB52LB5SboSzgfGeNNMC+nrQdfPr9iuTCiiIh83Jkzszwdu6ZgT/fSNYl/+URmgVs/cLst481UfbfN/sfUYG+ZoxfH4ITL29280DnvwUi14QNZtIv6Bv6UTehycj1h3+71YoG5nhPcq5y16w/kPTMA6pLeW8uAK9L+q7q4LqRYj4PBdF+Ht8T444npsS9TWLxvarDGkSyrZDMcTvz/vebDMjc1pU3lk0sMnSi5wkvcPZfo8SWogmKjI6Aaj6x6N3m6y8PxuY/n3iCzvRY0w+JBFIFHP2MDiNwxBxZVdMJyL0d6tiXZpYal+y7zZf4mYGXaIV12sOkG+hCfMiug/fz06xUEXk6wp8WrQkMfLfNB1YqIHE0IXNswj1jkRDp9/kL6KdnSMcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kw/rTlMzF7jUN+D+mtPN/ikDo+zH/oY76G9dErqZfsbC1akMQNMWuZU43yzp?=
 =?us-ascii?Q?PHL1q/Dk2CUf/lihuWgOFkPWbiZFGJpd4fg1+AVf7ZUhHisCTGPINbjKpQvv?=
 =?us-ascii?Q?QO9pY2BfG4QNXOtMcf9LmuJBCoBKGlpq5s4j4UJWPe5UC2wn0bWRjBdthzrw?=
 =?us-ascii?Q?5qLZJoOfqvDm8XpM0v4LY0J6RXTx2PGsZ1svGUxkBB0ww6106WaNI0r+q7SE?=
 =?us-ascii?Q?ONM+Pq6aRGXZ7j23010t8h1GvRXNZ+2YWTMZdjXv0apbaLz10cWokdMnSnP8?=
 =?us-ascii?Q?FoX5T8wFeShOYQSeTpqguBR79yjC8I4UriTwlHRFZgnJPG1bG71oXRD103ns?=
 =?us-ascii?Q?Z73N26nGdvmKuyk1daCUf2Gk1soTxvXXTrQEQ+woyJhfWouPkgXsWx+Th1k4?=
 =?us-ascii?Q?CjGkYsXdWf2XQRvGlrjyharBm0tZezuCCwoyYO9WU2rgCJVu6G3Rwd3zvaCQ?=
 =?us-ascii?Q?gvSeR5sxNaxYUjznqU5XTLKm53s+BtVjpxiAj/N4z48EDHRPg1mBRBhDLoct?=
 =?us-ascii?Q?WrF2l2cMuZpcSrFHYMdwDIUlupvRpOglppJd7bmWbBy50i3jlN90XXW25ztr?=
 =?us-ascii?Q?mxvyPddYNFaWbYJpHPYC6PYlY/4ta6R27LFP2uT663gJfzw+WWUQ76ah7qJH?=
 =?us-ascii?Q?rwJ/Z6OWW8ecL+DTvzfSZ3l/bimKmzesJgd6I6mS6wdljp6CNCR0SRXElSBx?=
 =?us-ascii?Q?DEw1isQyPJjc7d9DXQ1Su6ztQw5oQ6a1JrQYedjCGJGC/5ZlyqilHOs5rTb/?=
 =?us-ascii?Q?h4X/+asl6TflP9Q7rk6cvtGeAnY4KCVh8djJw8vbPcQ71ZYuiLmpgn+B/BQ0?=
 =?us-ascii?Q?5Urm/sgCRlp121sUvScgJakBVOC6zQ3R80qU+fXcfvN5wea6NHx0NHztw/j5?=
 =?us-ascii?Q?xUwus252OC+QKK+BMl58KwdMzaj0BT2dUdWk3+lsluWD0q2TcHJCUi1n07Sa?=
 =?us-ascii?Q?Si6iyQ4UmHWbMYH6+RbfbvS2/9QZo3SVSvF6ux8PmDD/U5la52rY6wkBVDig?=
 =?us-ascii?Q?a/5ZifQj/vNMjEjz/oZz7oaOhGGkNQZbMmZQLURLlrGueFotwE1K1lTj4Jl5?=
 =?us-ascii?Q?aK0hsScBZ0A1JBv0w2dX6E9fveiT3tna/MCrXs6MxgEYBf01yAb9gKH6J8/e?=
 =?us-ascii?Q?FIN4SFnKLRjerbfU2Jgz3hV2XRqFZFmoaPd2eXBmg/DnbtYKpJWQlSCiu8SB?=
 =?us-ascii?Q?Oh+MWSVEkLyO/CT4cmbFIwNQG7YYE6pqr6KXgxgVaFUYdavw5rwplK4kfFgj?=
 =?us-ascii?Q?6nL/y2qd4zEELhLUOkWti4Rxk2fnvipaNnbb0iXadcsMJGWYBOXe+o6gWsvV?=
 =?us-ascii?Q?BrCO00szkr7BETC86IWWDZL6tJ0TN9Tz3oR+fi6AZokgfNnVj/fQZV6xKOpP?=
 =?us-ascii?Q?5cHgfUAp6XooqLgUuyHZ/epWcWKrHguj0yGVXYZ/5rmdxhAm+1pXhKpNu319?=
 =?us-ascii?Q?VtfziYBXmt0kY4yR/Y57cmNZ9wUjZqlcQOxK4llT5ELlfs1ei50UgH+QM6qr?=
 =?us-ascii?Q?mo6Qf4RVfUReurhnSdxXPQPrB9eO8VXdDPIqlQwcBHyMnLEIe1EoGmtoVVhD?=
 =?us-ascii?Q?RD3K4T+iVqKXatiG5SQ6TBoYawwX19LdwkXpazBY15tzKhccApYJLjm2KG+2?=
 =?us-ascii?Q?T3XDTric64uxvGoTkqtVPQohxur/0LKQ0QBnGRM6N/j2dGI17MOzldGby0+2?=
 =?us-ascii?Q?HaJFyjSGRg3+P+IILUnlcwY7Qfu7bHd+P7D4P3uu7CWXsTnJz2jxHz/eNW7S?=
 =?us-ascii?Q?yoFe2Du1RQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b979e904-f145-4aad-baf5-08de9f941af2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:52:39.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IdWQ8Uxp++P8PqSFjjjeKIwY+Z4jXWJyiRU+W213oSaUpq3YcfO4feV8j6xr3PCZB660ZBOLAkkywIhn4zpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12270

Switch to use flattened model for all USB controllers. To enable USB
controllers with restricted DMA access range to work correctly, add a
pseudo simple-bus to constrain the dma address.

Also reorder USB-related nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 161 ++++++++++------------
 1 file changed, 76 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619..8b3aab14ccf1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2329,6 +2329,82 @@ gpu2d: gpu@38008000 {
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
@@ -2407,91 +2483,6 @@ ddr-pmu@3d800000 {
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

