Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B923EF0A8
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815618; cv=fail; b=M4tnMn4fu5DI/AJhBF/iMMw3RGX6xG+gs95FoqbWu6UHmyCsCE753b5r6EBnXqZ5YPDuCT57g1CA7AQLV8louG8AJB629p24u4OuX3J73J//nruyHrXU8mP5C8ma1cDd2r38L4+O6glKFZ0gpuQTVgVyNrMB5S3Lz9nRO7Rtw5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815618; c=relaxed/simple;
	bh=+jwfGyzSqpslJVdIu1bPDj5wW1uvLrL+6VN5lFoRhWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqXNKpvc1Kx/I47HMsuLww4OiCFbdi/wmXse9wfRxM5S468FyVMC8hulXkhUx+uhDP/VHiETImf+1OpcBk3b/fGTcwV154F4bo3NfXG2IJKLVQ7m7iqWNRUGgknzzOrq0WCbj1VkxRQPnixSSYmbjyo5pddTgZq0IQjc5Vel3Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C/FQ7trf; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C/FQ7trf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsdzC2KcGRCtJWWutfjFh43zpXUNn8n6Gvtw5eJrx+e+SZtIsM51NmxS4h31mrMuKt4kIkhXG+j4+THqPmnpfVfUKgz3ver+PZutChTcbJyGw/sKB2PBaEYulrX1vKZneoLTZ36yKoAvNAYKz9wq6l7w1oTIHL1yo5Pp05WtO6KrKPpOUxIMnAIA2cwIl0vku5tg/sh7yMx3HpjlTtujf0SYrbrBbKkM1M6DXEplUv2saR4B7O27Jn+mflSsyNgQElaeW/8FsIpFCvVg+U9Aq4cP6ZntfJPOVTOegmPSw4lj+HscnIZF+eUU83QVcryyetV01FDAjGuO/9wET89p/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHq7T5IZToqavMFtzxr1vJFtDenMykhSzoyZl3788/Q=;
 b=hikQrOt2welwHnPUBYUK++s6Usw+N7DalbPddtIbD5rD0YPSNmtZuiLfr2xm7dE/TCopCIWIV6Zr8T6UEvR32NQTOmYL+n2hgO3nJkDgyRV0adliSil4gLoWyQ5X/HgecR8miqyIP+zczZiaDUYgc36gjBD8Z2rMc/Tg3EKpjoY0HeWht1/Rlx3yJ65Ll8IlwtweuwGh5JVORvH8gLkFx6p2zT4KHWMb9hZNoGaPR7wjWjKF0BAjdkYf1bZ5eSvvMbYUiV7SPWWGIZlpMQGDncbwkIKU2i5c4Q6WJnBhEtNdcd/36I/vIIeJFrrvw5TdTsZ/R/+OSQR8+e1XJ1J11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHq7T5IZToqavMFtzxr1vJFtDenMykhSzoyZl3788/Q=;
 b=C/FQ7trf033fjnaiOleH72L+t5mDmsHfZXmMqF6UuqLCm0Z1suIqSQSan0WCcFl0QtG1VkfORzNgsT18B+VnzaedcpOOTyIG3yP0XPbW2KbGcx1Y6X5F+h8Mb8u0KYw8avM8zGtc9uM53VXCPUPnrjEvwL+imWliiSKEOMB9qyWS1J+B6OdCXLz0qnfkt40w6idAAkUidd0L1SuECQsAJz882+TlJUNeyBveyb+7wY1Dnuhps88apGDuchQeGltrLdFBu6RKNjCM+gIrIQZkPn4y0/iTybDyjJOr3gI3nD6vL4MDeTIXImJlc3XkPzQEh7umwMp2d6CyiPPG9kRo3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 10:33:34 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:33:33 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
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
Subject: [PATCH v3 3/4] arm64: dts: imx95: switch usb3 controller to flattened model
Date: Tue, 30 Jun 2026 18:36:28 +0800
Message-Id: <20260630103629.76604-3-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
References: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 880e4881-9f98-44bd-c810-08ded69308c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7ToBkPPH/w4vaMLqol2HL5FqJe1HJeb8v52zwZdm6bIlG4f1GhFENZiQJ0iRKpEYz0q2xcZYF4E2fpCzuNBJgn7yvKK95XLYHL8O8HVV869deNWmbU/tsBakrhKULTvQdNZOQOtQNqaSzyGEJdDT3iqMOek7N8obANoUfVHSVcA0Gp1wJrOkwIkGPgWQmmisszplQlo7dwBsnZ8H2av93YN2zSAruCPU/FqLtVx/EjsJCIpsRW5FhwcoAVOif/0yz5XNkgY1W4qxF+gyPWQF9YWhzKdOVMWVrV0zscn827OezcaqYfRSRL4YoxlnGxfcXOcjtGwGGNbqB+i12mrd40wYm48/MawIqHIBaxlxaBHXjRTUSSEDH93PZAuG5UZbIn8brcxD7srb4CpJpUDPhVU89rX08ME36vrEURa4fHacgrP6NWPIMjNmC5x/HUzm4u6R4MYjxXva0Hc2I+NeMGeNrM2wWtIzv54pKDwZL0sy+63JHbVT8KVsMWBbowh9LAyNqTr2nymMv0G7Lu7SvaBzQY3J7twOuxyVYLscJbxgfCvja9dwOYg5Ip5iSm6g4IqypCApLDhqSLCoIc2wf3PzAPVKmLR8OFQAwmWiuyvuuLDH2qBa16JSa0hGqoSNfuWdZDn4P7GhB0nWROGgEddIUjhgGeRKmA4nkVYd6Dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?suXxiQfXTZ6pEhZpXtZt+yhXD4rDgRPjcUntFHft3/QXPlLzMhJdn8hs9a1g?=
 =?us-ascii?Q?5S4axo3ToSUV3PAA6OWfAYuGNwUhxVLua8RDwDvMOlCcOhbaSN8rJnk+dLz0?=
 =?us-ascii?Q?haelL3tm/dqUc21Qah1g+rv27aTXOHP2D442k+OXLZWNuTv349m87/tkzeyJ?=
 =?us-ascii?Q?SNTQYdEQWWgYPzqg6pItv0slTwbzdFx2MtQ9tN2yrJN5oxO9dc6K5LNQbDdL?=
 =?us-ascii?Q?RwZbhuLklVW8GfrrPP7FhWjypOt3ylpwCA7tcvalvNFThSMvjCey6zRBc6o3?=
 =?us-ascii?Q?l1O0fTPqU0EzDejKoURlBQJ4vneWtevxvwHlv/YTN3LIHBSvTOG+LgoywVbK?=
 =?us-ascii?Q?CO9dKy1cZWlAQI5vXa2t7lMnuid+5FnN7GhpgUCMs6nbdM3Jspw5VKnCICHB?=
 =?us-ascii?Q?TV8lawG56hPRSx175uvNSf96O5+SplWcDo5+cxC+j2OpMSdXdbyaaLKsybMg?=
 =?us-ascii?Q?kKA+aIjLzl7L207qE8gymp4xLkY4qTv6vTvqSJ7FUWRXxC83/2eqOfJ1roXx?=
 =?us-ascii?Q?tWWqwm8nXzUutpAKeRTPs7Nae238SJ1nUyZA7uWQm0K7p+xDxNi68vMroCfr?=
 =?us-ascii?Q?XPpGW8BCtRu7/OojP8JmZbDL2bstA983r3XA4eldEfGKqR8cyKmq45tHm1QS?=
 =?us-ascii?Q?/5r8cEwz3KwvG/KMYJi2k6jExpStuYNaLg6UNgoOE1qdxynXwx3D/91vMeJt?=
 =?us-ascii?Q?mW5TXGu0f48QstTUv3y3olrwuL9btA6GojikMRJ0VnSXGuLWbXMIFMyZ+398?=
 =?us-ascii?Q?J805cPIPqvqWLWsZaZvMC+8p5LaIR4g0eqC6kNiTCp9FbCUI6amxaWwMPYIj?=
 =?us-ascii?Q?nfsxCDnACbycOckxVV4mw2vaK6KKXFayaMEpxWWadDawdGItbSQUYI6bcQO4?=
 =?us-ascii?Q?LVvS50RH7JbXoeU+OWfowuGtwUnS4mB5HRzT307Whb3OoL1qaT79zGqqkyoH?=
 =?us-ascii?Q?E7AtQDRvcdX/W9VpB6Rb/Jz1CecrHGOII9/P5dDj9jiqyrYfPBD496ROzsX5?=
 =?us-ascii?Q?6FLJV3nfFuBZQSKjQAX/YqfjTHACURKIt5uEIEGcovmmMPBByV1ku+na1jhv?=
 =?us-ascii?Q?tYE25pniFvAgXdsE/JPmLHetF0lhPGO6utwt1LH6+u7/omRlGhPJKOMUoXDO?=
 =?us-ascii?Q?ZZZf+liTL/5RGfGToeoO/gr3lO1HZ9qZiPsrBvk4KmuBq4ItJ451jd0UZQvd?=
 =?us-ascii?Q?S5/eq/LUdbqG78q1s/ur2e6Nl0FPfmKWQgBd8nRSSpylDpRwJhMFr+guTfA8?=
 =?us-ascii?Q?5a8MxdkNJUe6EsmjZWcZokYAlKtm6IwzQupSl9RXuy4MPob6nbaRfrBm7EDG?=
 =?us-ascii?Q?bpFqTgIA6H3UYIx2sZ/MaHRvPkNCVSmj38Q6kxNMkPehYG1CSS+1hCDFLTiW?=
 =?us-ascii?Q?14UmwS75gu1tot/htNzq4f981qzUB8pzI8wabuh9Q+Y9ZLaY8ungklSH9bTd?=
 =?us-ascii?Q?+/CPBrlZ1L5YOm/vQNJ3bKFf6lytOVF7w2cT0gv83aLs7R6AV50EjDV4YNMP?=
 =?us-ascii?Q?85YiMkbinjYTvEDOOOL7NSc+SFGNHVM6mCfE8aXi9rP07oTdCw4LMGnDp6WL?=
 =?us-ascii?Q?cIccxaqptCMONd1zy03I52CKmg+Jq8D20OJqQBKk/MHv+QVPTqnWS/PvCsRf?=
 =?us-ascii?Q?KxkuWGFR7SEUHpMorhHO+pCzrOaF5c9OpKKscXIJZqaEzFM9IgLnc5z40aX7?=
 =?us-ascii?Q?4CxBkKO8M/Wnzs6P2LejG4Wt/BuuKUNPuFZ+HyItPH1FDvzhfx7mc/bmwVLi?=
 =?us-ascii?Q?V2Rbemi1JJx1dKFuLpv52MPcEA0kOMzu0A/fYxdtW64drkkZjH6x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e4881-9f98-44bd-c810-08ded69308c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:33:33.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKwxn+q1uBj5OkiSM6SYz7TnL9w3rystwx3kKKzXxrbS/AQ3y5pSGw/hJjRzZf4TmoMd0SOBWJGkOOesGRb8bIEFyXpS6PYoNB4SKuhxsoipXQDbPrua4xVJQWqpnlvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089

From: Xu Yang <xu.yang_2@nxp.com>

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
Changes in v3:
 - no changes
Changes in v2:
 - add note in the commit message
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 48 ++++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d6c549c16047..305751046d66 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1867,45 +1867,45 @@ pmu@49252000 {
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

