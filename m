Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306A301460
	for <imx@lists.linux.dev>; Wed,  6 May 2026 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046682; cv=fail; b=VNuWrYNkrYX3p/uz3+FrXIo9ewDIbcTDw7Z/4XlPaOwi0WBtsbD8W3+QVH7Ua+U+1Z1r6Sz0hXLv2DExZABfFcututOaOSBWRXNpdNNQWsx0laaRB6hDD0EvuZcBauXfqDY6YySzt2p802cEk7ucxSXH8GwnQIJt8g5a1J7M5pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046682; c=relaxed/simple;
	bh=Gp+Al3iNVid/TIUQ+V1bNG/J5nYE2Hxgqs+TxrJaE1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/oMOPVk153055xRfLCYsONLQfUafHNOhXoVjLblj7h3YhIX0d3kXziBu/8o9i3tsZ+gRG9BdTPDdmy8q06W8Xz5OSkVx8ZExcrNudNCXM1aUdyFJ+FE0+kKAXlqw+5lqeri68qF0fsOx93fKKqbFc6JpEDcmZMk+iUvqlB+r/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fY4M0JGI; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fY4M0JGI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klSd0Fn11NsvonsdfICHxisPp+sMr6LHpM5ks/W+0HlsUICukGO4XrEn8VaU2i6LlX86oBcqCx6BvlAZOQhCEtoOABsRD7VnTx/4Iy4fz3PWPoRtSQFegL0SCXx5wQEmWnculBQO++rTrIdMVMk/C2Qmv28rk4Jbxc28rj8n0fziZphabF5iNlhgjUFdD2fHaZxKjHcyoHcRUGUrNs4rnPUeAbIEE9fL7zHDS8MGvtMGJY1cLZ9erOQ1R8SSFqpMZYk9jqdeTggc0BYYlDVPIjiNfOCuYl8xjOHVonXd7LKTFCylcGEUsCqO/bE+/mAH/dfY/9mV5mvcE4c2ycK+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFyoHATaOYOKbH8vCQwkfwUC0hrmVTJETszuFKEqV8M=;
 b=MoDuXqngX/M1FbeADzSMj2sOArUlybnb93XM1sYFy9GFEY7gkTAkNGBV5om/fSVvFE7NESoECP9ffRSStKgckDPSV20invnlJ2f/i6aRVOxOHJh9Sj3E7MJv+0dMwkgCF0dGoNkPH8yx/NL+nqh9s12ADWDLu9iBu4FhCHPM3FnxAWjonJxRygq+q2+dxbJ2Dd9l1lIxOawPlepuFDf5dJ/7JNDVm/9wth2iQnryy+HYv8MRuvn/tMbIbIY+P/ZzB7kxkwcxynuxm4li+guEsWDsJo+QSzUZR6NRRlTD23SwXk+KVQ+ac63PBOZnTe9saM9He2DDSfLGQKbGJ86PcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFyoHATaOYOKbH8vCQwkfwUC0hrmVTJETszuFKEqV8M=;
 b=fY4M0JGI6Wa0heCQ4wmeCtFHuZtdFDXGHC/8FqSfgAJqaCOB/6rkI9oh42Qo8Zvcz3CjXGzVTnQquZUZhVfNO07tDAiG2L3gZQ+wYeqqVkL4cVshPJOWQZq6wWeLMjsiWHCzlgderQCqE7pc+3pNuvNroRUu2N5hXmzJbNljyjET3uwT2CJ51F28lLlWF2/pUnagucOmZqbYwZ7J7T3hpBVyQsM8HlXcNXLN83V2AdLjBryLrljYmxF1tWv4fqfhtTSs4mlVs5M16skk/n8okunCe22X5bs+ypfUTp/ETFQrREnapV+SzVZZfqa8C9NEg1K5pO5CQouQBeRo5BB9JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DBBPR04MB7834.eurprd04.prod.outlook.com
 (2603:10a6:10:1ee::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 05:51:18 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 05:51:18 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
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
Subject: [PATCH v9 1/3] arm64: dts: imx94: Add pcie0 and pcie0-ep supports
Date: Wed,  6 May 2026 13:53:14 +0800
Message-Id: <20260506055316.2798693-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
References: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: a6eae3ca-fac6-41c5-db7a-08deab337deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7416014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Y4CDWYiozWu51ItXK5SS7kAUNbkpNwu/1SrZgBeZof3qMZcX0QqmjVp7foCJO3S/mdBsHswFNt6RPt0RpOaBsFbF7K31vso6nDwiePQOChJt2i/1ybgUCW94HBgLDB7lJT3T/4i+k0Wtmxz5fB7+WtOEwK4B1LtnRACvJLLZ36Yf1xRvBCe+vycEtl1FQhBY7R16wmUuYvm0N/UrY9HYqFqSBLrjzcxa5avuDBsalqzkKRDLWORp+NeNFF3QLLfVzeC0D3zqEH0RqMJVH3//D/9xhpfdRhQSTHKBxRb5ADDyMw4NqV+VdkzTdfzG58wWrtWPXgyu5bO+1vYkVAF1bWK5/uFIDnCa6GOy90cuPDXlJe1m1zdxSEIewh09VCM1hiL2BGkErbya8SwBXNInH7mkTJZVPou1GIGd0WeIRe6G3fQ8k86D+gPqAJLQVPBDnMkZat8cW4ETkktyBUT48LkIyLiegjUrpPzlVo//og5Z9Q4D2dt6ZbRUjK/5lxZ0mdoEKtLi4Z3S7ikuv3PDp30nOvLABbLC+hCzouYoJ05eAuIpdcfjh98+LqAuKX4uxo+W6TAAcFDxaux4rpWCHT9sYKepQAw01ZF9TCecTXegR4t/sRA/0ifmNBm2uAktYhD3HQUKwfEmw9KKtMPAeFWiK4pKUfsNitxKNpIeJ0u/aWRprkYyWGRbgVl12HHs/oxz19rZGtlpLkN+ob2SlmGY8YFU3ZDOWlQ65Grv4pDcC3a4Cec/H1rqUiB7pQPK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7416014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KASRs/85tiVRxLwnNhxHlCn46Hye3gOxto0eUZuvToD+MJW1nf0uUq+QbUyB?=
 =?us-ascii?Q?SL9RnncX9nR5B5ROPDDz77t42qOZef4yamJ09sM8NypoW0+D0f/tAHrY6KpB?=
 =?us-ascii?Q?AGqBh7Kp609cStafjA+lnLxhEZKKdxJNNadkTfMvcoPurZHLaeKBIWv/7ZZM?=
 =?us-ascii?Q?tuoT/kIFp6NrIttDdhpWVpgIXuZ7brKx9qm0fkKetyUx9fYj1W3t4my4KwXM?=
 =?us-ascii?Q?DCzENWlfwZuFGod4lnUIgoa8mrZXrOCfPpZWlgH1bYnv/JuthxD5D+uiFZ9u?=
 =?us-ascii?Q?LYQO/XTC+DzadBQ4+B53A4RR4MR4GArcEHPUu5G29vDxYzPcyVLUW4b1YCYW?=
 =?us-ascii?Q?RtW1huMbRvrrC1DlqamNWhYjcsR9nQ2p7tQbmKQy54hfZy33shWz9FBBIVZ3?=
 =?us-ascii?Q?OAHiPeIJG/yoVUgm0R4I6hRFOyLEWGHN3+eEEw7JRDcBpfUdYqCxuEEdsCuT?=
 =?us-ascii?Q?JvCqVrmn3z7TWyKecXLUuZjh7aiKtI+TOOFP7iYmdShsQdmB0m1JUtlUtgMa?=
 =?us-ascii?Q?P6Gxa/cXJf5nxy+vRWbnJpAgzRHpcLZnZ9lokii11XCcv7auGcu14KbM0Zgi?=
 =?us-ascii?Q?e/ZBLwjKMhLRU9lx99827b/6MU/XufAd1k3xd3SAgk54RTxMdjTX3ymR7Zm6?=
 =?us-ascii?Q?90o5wYIUinZqD8Cj2oUKNpTwu/m6BIH3Q1m/RWCUAaNP/eI16fzX6eRKza/8?=
 =?us-ascii?Q?VezO0aWYv5AuPmuBEpfifQxYw6aX1BGzmp7YnK3lAWLqLn+5AxAdLfZKy/nx?=
 =?us-ascii?Q?BZwd0VRxl3fK7ok5gBgCpB0TSuoydU1Pg3nMjwlS2hRtWf1oHd/z4L09u1aU?=
 =?us-ascii?Q?pUtkeCV1uv3hXpc1l4/FzlXpI7fxDq+EAvscQJC6/BfAliNCoSA4VYUYRE6M?=
 =?us-ascii?Q?yMtDZYalT+urvi5nDV2dFgutXZR2FOm+6vOCg8rKuElsDKbe/piO6TSW0ujC?=
 =?us-ascii?Q?52D7297f0LsyWiUnorRNiNRQWVBiZFrLKv1c3VZSGWGOadNF9ysXOkoEAww7?=
 =?us-ascii?Q?bm9QrhegOUT15DjiF13b7O1ILEitipM2uXi4vBtquFvAEdVnV1TSrk3F916G?=
 =?us-ascii?Q?sz7df3f8lvRDskfuDEzW4M1Cn03yhvaGwgGCu4SBbS35e+srHaWLvdiLonIx?=
 =?us-ascii?Q?4LvQ9B4YyqRb8Vle2rO3Bh7yWvdqWCduRx0R79qGx17qHagHTYp4cbqIqJfd?=
 =?us-ascii?Q?FuiZWeRcK1ydQqbrnyP+EvzieyVvoSNVdddgSZ2Ds9pTAn0cvW4UJLVim8MT?=
 =?us-ascii?Q?5DeQX6vKytwesBQIxE3K8U9UpkI6FKtCcWaFXHh3HoCGI8UsYdVgzNA/bjzj?=
 =?us-ascii?Q?mML/swvQuyTqgxa9794MSMQ6tAKoKMsgwVGOrQfM52FKz21xz77eDPg1EVao?=
 =?us-ascii?Q?jy0OCSv3uSU9xVJHObAG3DaNxwuycZ2MYoTLxXMdAgD9MOogh8w1kP01hKtc?=
 =?us-ascii?Q?AN9Aohw3z+YJ5np2EWiqVR/i/zr0RqVOTmc9thgZTO1eyeoW+IfEUvDFCxlM?=
 =?us-ascii?Q?c2oNQOZOFP+VXNJKZTjKJGGtif/dL7h1OvPJR4EX31WxNkYx/tV3P4DyMAhD?=
 =?us-ascii?Q?7meFOZtyJgHKn5VcauPP4eEVyjM/ca3FThZqCfgJW7fSn+44KD5dD+3TwLTZ?=
 =?us-ascii?Q?V/QATTY5ciafRLVZADDewslbx3r5WH3ZA1pa7gehahgHOQc8ZvlEGhFu9UfN?=
 =?us-ascii?Q?yEJgUcJsEOaBljE64emk3cknM8g603bpD4FWHqCptywBsJBIT3oIZZNBd9MA?=
 =?us-ascii?Q?ZxP7iRxP2A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6eae3ca-fac6-41c5-db7a-08deab337deb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:51:17.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGCI4mUnslY06qyIu+KLymIdRPzW+fyR1/XWRrmOPyTrbvi02IZ03AjBEEIGxU9ZN476gIYjFZ8ZiemF+7rbwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

Add pcie0 and pcie0-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index c460ece6070f8..589f4aadc742f 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -67,6 +67,13 @@ sai4_mclk: clock-sai4-mclk1 {
 		clock-output-names = "sai4_mclk";
 	};
 
+	clk_sys100m: clock-sys100m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "clk_sys100m";
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -1286,6 +1293,14 @@ wdog3: watchdog@49220000 {
 			};
 		};
 
+		hsio_blk_ctl: syscon@4c0100c0 {
+			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
+			reg = <0x0 0x4c0100c0 0x0 0x1>;
+			#clock-cells = <1>;
+			clocks = <&clk_sys100m>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+		};
+
 		usb3: usb@4c100000 {
 			compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
 			reg = <0x0 0x4c100000 0x0 0x10000>,
@@ -1340,6 +1355,79 @@ usbmisc: usbmisc@4c200200 {
 			#index-cells = <1>;
 		};
 
+		pcie0: pcie@4c300000 {
+			compatible = "fsl,imx94-pcie", "fsl,imx95-pcie";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x60100000 0 0xfe00000>,
+			      <0 0x4c360000 0 0x10000>,
+			      <0 0x4c340000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
+				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			msi-map = <0x0 &its 0x10 0x1>,
+				  <0x100 &its 0x11 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie0_ep: pcie-ep@4c300000 {
+			compatible = "fsl,imx94-pcie-ep", "fsl,imx95-pcie-ep";
+			reg = <0 0x4c300000 0 0x10000>,
+			      <0 0x4c360000 0 0x1000>,
+			      <0 0x4c320000 0 0x1000>,
+			      <0 0x4c340000 0 0x4000>,
+			      <0 0x4c370000 0 0x10000>,
+			      <0x9 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x10 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
 		netc_blk_ctrl: system-controller@4ceb0000 {
 			compatible = "nxp,imx94-netc-blk-ctrl";
 			reg = <0x0 0x4ceb0000 0x0 0x10000>,
-- 
2.37.1

