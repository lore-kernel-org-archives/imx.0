Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1537BE69
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792811; cv=fail; b=fNva4rGEByV4/UR0GsfiZh60Mvttxry58DP/SyGskVpMz17ww4g6++wTdS0+UUvKFL82pKMbJsmASgtJy7WXkKn0g6v8HjbhoIL5ZE9my3ud9KHj72JWxEhR511GrQKA6j7KzP1sBL4kngWZ3/do7s90mpvqKfFbmdBJyBHxNOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792811; c=relaxed/simple;
	bh=rqfVMb8IASuCmpIzC963MMP30FuFYaiLw9o5Qfg8Jxw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DHKSEoSduOppwUoqPQifDYdiJlTE+QIIPxA8SJD5D6JgfFjCudow8wWSIezfNgf6jZctjs0FxcPE7dOp9ocAp/MjegQpVaeEF1LfwgrahIAS/G0qqcl7T+uursFpy6gHIOC+M9hZ1ThfSEAPN1Om5wbumkyr+cdHKZXO1lJ/3kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i/mkJvB2; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i/mkJvB2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiAGA+9YnvrPKREuAxuJH444EHQwJyTW3jXRcsgkaMA0irPBWBJ53qhNJVIzlpubZjYn6KrGS+AwZfOtx4spM7N43Yw4+TGg1tquNBybKBdJFYoXINDFUwWbg4WK6f39vYI9mENbxqnBMB44cxAf+x/DsP/pGc/gkvixbFPX2OK4jHEfwbz/6fSIyh3lZBV6wV6cTgoFHTMF3UEbwWzymH+VI8ifuf6yVW3BZqz+MvBvrmiXI55VWE+6ZhX4pMU6W0OZsOXgLWvFg24DXj+ZNYLlu6xXU57H+w69AEXP92TQnn+iPW0dKG8Cf26oUBal0iU2IcvHs3AsOh7ucXKfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWV1AqjPp4lGHeFI0/nxusrExkM8eRSvddenWn8eEzM=;
 b=mOnXU00T2QoBjGmrTw17FmZ2s6XeFV+3pxyeKkVr8H+hokm86LcVqIuLnyD7a6Rsb81zrlSUd3wVDHlY5Ta7qFL7uIBLczLn6FPf7Q4m0gMAzhePwDegWbc3I6MKi/CRpb5w02jSg5rbfGSCJGfWCQ+mQr7HugDKaufilCPjYY9HtUFmguvtsZCBKqrhZT4cjrct9i/uON7hRG3ao8poZQVpmzUftj5Qe4mi9FzfQeE1VZKL59XHPE7pfXexOviP74jdI/S8mZFsc2aJ9u3UPHLgWo4z9N8hgnTmFl91bWrexfTtQmhsqcN/er+KoR7wm6xPaHn6aO2CiVj3zZEBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWV1AqjPp4lGHeFI0/nxusrExkM8eRSvddenWn8eEzM=;
 b=i/mkJvB21NNIOKEiQ0bULas4UI4E+r7KRMkEhW99StE04ZydVvkjfHk4PLRfxy1kW2UXpJSaRYw0c/7dyBOKrZtJDGiZx0B9MP3IODTrNgRx+R2bA6P+g23V5a+eXuxm29RaJGMyOmry8f+IoioYWXxLTJVCL0pENNxkfM0jmbG3KTgmV1RG3nMebYP+B7dUs52YStyB4dp4aVIz6ilzRhJOwjYEG9arCc5vW7uAxpuGYqTB7QeJ0Tv5pnbepVlayUbkzAl68TSAhhLTvq7QxFZtBkzKou9WXegk/ESkjy+QWBJ5I0A6I8dgAV7YwwwhDNXMAMFCzMXgQLQ1VfaOYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV4PR04MB11332.eurprd04.prod.outlook.com (2603:10a6:150:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Fri, 6 Mar
 2026 10:26:47 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:26:47 +0000
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
Subject: [PATCH v2 1/2] arm64: dts: imx94: add USB nodes
Date: Fri,  6 Mar 2026 18:28:36 +0800
Message-Id: <20260306102837.2648955-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV4PR04MB11332:EE_
X-MS-Office365-Filtering-Correlation-Id: b57d22bc-7682-401e-03b0-08de7b6adeca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	0ocCeFRAaUCqp3PExIVqnsWjP6Dx0HFundXCFJgpRGZhU0RiIeolMiqeAaG7Wk+RsKn2fXrpF8heVlY8trEezZHCmI3hkRl27zQOi92Z1tIfzOOsPerPiJyonHe0Sgioetcc0DX2+pbAg4bvkgRNPoVB3eDc+HIuPc4tgO/hWoKxd2NV8jqUafy4iRtf1Ev+ISwDX/gTuJRtDV4xu0/PlJZTl7xrHZVuZQ2qfSW6QlNbIEYM2GR2PK4B6N+1M/hPevQHe9ectUTpXP2oLw96q1d8/EdWBaATvuYSeA3aOnwohI1i+SvE5dOjvbgRRjYm7xHQSfgyBad43JeqMNz0zm4ut5evLs6aEl8KIqMjP9jPQ10hbcfHJgglzikc4pya3eIzf1YbfwLB+tBpAP6LCh3bLe+UyKaJHaAt4D0iZYkUMZW5ysB56KufLP3EEcVIQ9drnVnbK8MOIi7Tl/fzyc/zYSvSZwPVBPlZYLvsq7jTMOdw2Juc4ok095xwgw2ADDAzcEPnXLb9Qe9gLQW0tR4zybAUhk+mShZJMisycM2k7KMAnuDPU5fZZ2dxlcByf2LIl9Jfo3bB6oKyT4pxodIuG0ZLwT5XppOHGdzKSrWo0Uc8HLVDBVG0mKxGRgIgxTre5cT5Ad1E7r+6KxDe1aXT/j06xKkG16JhLRk+qp053IEWvwkc4zLm7kHtzuMC1ye3vME5gORQFJ37N1h9PE33Ir+hSCUb0q2xrnlw6ruwO7Bt0Ef2zK8Dk+O+u+pA3tCvqRVgC9vX82eS3x5nXZFzMRnkkPhDJh2XRA55sTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vKnuz6MtcMnq7VBP9GxNgOP81jyhgG1vGXaRFic/K32Flf6GxgMv5vpQbkxG?=
 =?us-ascii?Q?28nMznwcZMUUOU4DoFLm/Vt9Sm1w963njxAhVqJHoF/A/ZC/FyZTy5ZEme07?=
 =?us-ascii?Q?DMM9pDLei/h/Wkmdt6+FLFwu8qtroKB/4rbl1eAMCopfebP/kmqmIDA+02WT?=
 =?us-ascii?Q?t4w/cCRjCrUcbcF4vWtAQk/AUv6NlWAO0Rz8tHKeQlTMxFlNAgwhkvtwtw9L?=
 =?us-ascii?Q?YGr6azXaTYAnzT+VmU8Qdaf4tLfFH8m3jpEM8GEgWDnxJfoa2dJ4AU45YBzJ?=
 =?us-ascii?Q?PtTDLa2cAOw8pkLsIV7WUo0pHMqGzpg3XQ/TLHWGBa6CogVek84S9KFjD/hq?=
 =?us-ascii?Q?vZf+C5p49UIZwFAIktkLH42ngOOm+2s/bIufOWQisiHljSL3hL13xCuuiGzP?=
 =?us-ascii?Q?2MFRU4Hj4iQj1uSugFPnOpJ+RKFTHy4he7ESmmqBdG7KF3Aac73vXgkmko4t?=
 =?us-ascii?Q?rUR9mWtmDXC9TeBvgSOMSrzNIk3en3vlb6GnmbXFR7A3max0/0aPrxVN6CtS?=
 =?us-ascii?Q?QKUzq9Qub73C2CjxNqGZU1tEE85FOEhZtPPc31AIxd++SA8bYICpHIeRj2iL?=
 =?us-ascii?Q?iA55uVqUV/9oHk3EUG2pF/sisGsJEyf2SR268yp/sZDk3llDNtkPGU1xZUeg?=
 =?us-ascii?Q?Mmye01fVWBcHTlwFv89HXGW9YpqgYMKiz5/5t3QXM1/aCCMCqf5B1Fr5J/sI?=
 =?us-ascii?Q?JQ5dG0xXVFQvikOuR4qwSw9M7n0+0HKnCuxU5to7wXc4cwDiFI65HZ+Z+Gw7?=
 =?us-ascii?Q?7sLI8lSu08hOJZXdFtVyBy8C8+jA0OyR0yOIeucs/xuy+wo8Y5J1XVWcmlmZ?=
 =?us-ascii?Q?cmWPU+Tzg9CwBhmezwAknp3ehOmjFR7MLkThGEjN1VqMVxok5+meQ71axwCn?=
 =?us-ascii?Q?6QugyssmWo/6wXrCNGwwIZ6BmBiG62HzQun18ONErCBwwxTxMu0/fe9YD61u?=
 =?us-ascii?Q?kf2/g1WIGRM1QUB69zeux1vVpnvc6nvTuMnYZFC1TnJ64YedqteCfcKaqWDj?=
 =?us-ascii?Q?FQsSdFXQKg7urNFsT/1E73pCTxYnEGf7We5H9wBQ6TxcehI2KV5ijhjs5qmT?=
 =?us-ascii?Q?m6JJkLpxpVCfMc8rFIqgsrNIEJWYb54tn5OxXq0U8WNv7sQAXXVYMNnyQ+g6?=
 =?us-ascii?Q?USLU48W0TXnJEy0fH7d7Q31SQIYrIiux+MIEcT/yNV7Qws/QCJokuGskziKD?=
 =?us-ascii?Q?YmqvNCdf0JRRaPZ8gx2q8KXvTQA8NRfRDEsEhFKX+t3E1TudH/iUv5ZWteo2?=
 =?us-ascii?Q?4lShZEt/9Q2eaJLvYCEhUwBLlCsBzHIfzJR2HrzgRXIckaoyZhqyIxlL6dSS?=
 =?us-ascii?Q?+8VOM9oYDzFHIZH3FS1aHMBlUj3r2REXcsbXORKBacZclx40NwH9LWwexXYU?=
 =?us-ascii?Q?wqy9064jSaokAiAF8DlkqXR0TzBS8PJ3KsivqknNl35O00rtdg2fTj1rK5hZ?=
 =?us-ascii?Q?OobnAdc7F4fjS7MtspAFDWoa/T1WkVMsMIJR1IvPnyB1Cjya9MpZkt/oMFvV?=
 =?us-ascii?Q?KPvgJkTPA5ml6Xp9qEeTc1/2YBUkzFe1Zsxs6ftHjGeegTt7j5zBtR/48EJE?=
 =?us-ascii?Q?esXJYZ2sKcHCKYkJmxzH4rAFt+5JQ/jrxDA2gQ1oA8d+lCzsjHk6Nmkkz52e?=
 =?us-ascii?Q?NRpmoakbjswUhBYN+jtaIG2Lhy6ZdOUqgiEjUpW/GGak/HOzUu6f0LiyoPB/?=
 =?us-ascii?Q?AIlth1cpRDOmjSgiS6zKIu0HvcTaq4ciGQVmxvnKQ/QAL7Sk0mznDqiCGhT2?=
 =?us-ascii?Q?gfweGW4r2w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57d22bc-7682-401e-03b0-08de7b6adeca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:26:47.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey1jCkQf/M0NH/DrjIoMc5RLdviJb3zko4JGxRID0e57sURuWvoTQ/3d+HKALvvFE38mFUT8en0TzLWiKAMAjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11332

add USB2.0, USB3.0 controller and USB phy nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - move usbphynop behind of clock-sai4-mclk1
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6e..2a367764f7fe 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -66,6 +66,13 @@ sai4_mclk: clock-sai4-mclk1 {
 		clock-output-names = "sai4_mclk";
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX94_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
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

