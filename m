Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD253328F9
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767025885; cv=fail; b=DBUHY3VHgc0iOGWMiymC9chsZl3v+e+x4+0d9i8LZWif1N0kjhMy8ElAtoNeNUClx5SQspqpGlwuAQSbys4i59Ht04etzglnj4NeTzZ6VtnhBQtlPlvFzF3itheSodFeWRqmjwhSlDW3NjIHMYiFkEuax+NbEmErPC6zo/kPuUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767025885; c=relaxed/simple;
	bh=13ni3oonmFu+KlsgcSW2nADVH19cuFNX8fmumEp6dRo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=l+NxhSOeplttnRBmZenxoYDghlxfGdUhVShP7fYWg6UpCEaqgYHsdU8xhTv9o4i8PHQ4WanJj/l6Z4trUYBtWeJlotVaxTqFGnTsw1/wBVD7lM+gkKJzoZ5c5CmQZ7ecM72n/qJmVsEghOxIaqYHFCwCz3/YUqcS92yhHnJuaoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LB1+isnC; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LB1+isnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGmgAhfEsp7cZYYXanpUIHUTgAt0/yZZbEAv+3P64GTNA8hbyflOWDERytgAshTdCULejfYjSzYuJDQH/ZARI193Zxogn9VTgZRkjdvpRinnqcKfAsoY9HRDAXI2/8oJvZW4aHUKJqosD041VrJxXpjOgru9J+Ahzzr9uBzg24nAA9HgKAVsFI+U3nDL+CGMHpE4n6gdvhI24bbot0aq5zbnJMZnfRv3IJKsiEtf9CDIApCXZbMVXi1zrjmnBvsk++Nbhl1V2FfaBmQmL6jZgoWkYmmcPq3tq7dnGHYHwuaGljpYVmqu227whgqI8XqkIhMjve65Lkf8vjv/wc9DbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrtIJBhRh+s4XdvZ29X+ASUBY/cdNeER63E9jwtRx04=;
 b=g2qBBb6IqNwbP6mHOSLk76yt5IgwRRE8xWTljIVE395B6TDYr/SaO9ohuVS9CJR2vHbuqgFFkGHdDfmVS8P8i4c8CkyU1zLz8NjDkXK6b0/w6dWFpNId/Znjdd2Ia7emQ2nN5RG7WAqgf0Znv081avfo7Kzxhg1EgTf6AYkMHnBAri1gWyhear/1pTNTRA8XguUKCJjAh/6ZxeZ/ijtJglTw1l45FkiJYt/cvWHjf8eFHv1FIiBO3u+N50eGCztuQdaqFU1sZ9BAjiDxzLlw604l3doPmqxTGUZYpVpxd/KIfYZn2Q5Bjt4Pq+1e0HzfdVil48iwePRLAbVsPPtC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrtIJBhRh+s4XdvZ29X+ASUBY/cdNeER63E9jwtRx04=;
 b=LB1+isnCGZ2sQjMWtE2OVUJsxN/UwKaRbBq1rn7I0q88lJ3qwJofUqW44UHdoOKUyRH3lV4Pu0bicEoDPWnH4ooPoBe81UXEt/EVv55RJT0OU/t86O1vdyT9FDHOsWer8XzKajBbQ6nytISH1x28DBTU2mKadPXuKLJ1op6w5gw1k3R3wz7e3TraEGgLKIc62z9EiMFJOh43rIKIHr3j/LVgutueO+anIVosL+YOhqb0+aJIQZDhF0VJ63eeK+Zzc/TTSNXWRgsg+TI44KN6UfMylP0uZwmE30zKn8R0rU03Ydh5fIPA2LYSEOyz4v+heZSr4NodiTta8GTQLcZLzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 16:31:17 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 16:31:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: shawnguo@kernel.org
Cc: Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de
Subject: [PATCH v2 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and related nodes
Date: Mon, 29 Dec 2025 11:31:01 -0500
Message-Id: <20251229163101.4004478-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0153.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 64558109-b6b2-46ce-ec8d-08de46f7b0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SYhX63PsbWrhWyRSnoDJl3u/LRhI30PGt4hfasJT8kK0dlu4XoFOSgdUNYa3?=
 =?us-ascii?Q?zyiUKBtpzIgmYULnVO79SUpQtlGhQgvCLauxj9WFoId5yZRwsaCrB3Mdd13i?=
 =?us-ascii?Q?WtcR5Go905dfpMR2T7ONTOXZgNhNWjjYA4oMD1dPlxDjHrXy5Tcm1f471OdT?=
 =?us-ascii?Q?dNpbPaDxSBFlA0yfWwe3+ISxD+mLguxFDv5zMtxfhGZhHYCSOo6xtXjdiVwv?=
 =?us-ascii?Q?CaznYt1zUqCzA4tOgQaj3OfgyLF6OnbIQPy1nu7FO8Yf9OR+c4to6NDcZd72?=
 =?us-ascii?Q?GjCGUQg5uxWBOqCEIjCOZXlF/P7TFMIkc/k3MhUHP3/oYN7x6sGl6CD2fcvG?=
 =?us-ascii?Q?riNCtlPtTgEjNrAG2ffVIQb4BbzqVIq3TeHGHpbTwRaF5zw+yIf6+uVerMnH?=
 =?us-ascii?Q?9P9OeLSUNfoOSkhG2rsXBSgX9FEYnn5OZdNFRqhKiMHY78MDwvweSNCop5Eb?=
 =?us-ascii?Q?oq0z4zT1RBUUQ19BJ2dhLpOWDOVtbfW7OPfZwqB2Vw4ta890MpKI01xahijo?=
 =?us-ascii?Q?L78PqKY+zavsxLvAKOszVahtExKp92IklPsw5YQ9+XjrgrTXlDYM1Z8fHCT2?=
 =?us-ascii?Q?ahZyspv4wrsOXR637fTaU3pZVR605ySMxx0HbJWCzLeSZh0CBmQLe59xaUBp?=
 =?us-ascii?Q?OcXp+f9wnwFYodxWlXaDqoPHh0XFa72Cb4oQAkDDi+c0DvKpD6a6JicGrszL?=
 =?us-ascii?Q?FhXyOD1U+g1MmR20yMNC/kJyP+HOLNbSfMlsM692HlcnC2aAg0vzYrDreKIG?=
 =?us-ascii?Q?/IqZPXel2Y33/7YwYCEIGjxHCvq1GNuA+YvZrOD6QmWP8bEDj2zbssoCWcRs?=
 =?us-ascii?Q?l5r4PkhJoyjQRuHge6bkw+42Q+AO+T8xXg4PBZlnwhEn0Oe74uklx4+//9NV?=
 =?us-ascii?Q?99Y9bA51kRTUblAVNSCPhQaX+Rtb9a3Wcr2XEvb79dgrFbSTzg2LoGl7JxoE?=
 =?us-ascii?Q?IrYriE1X8TdwnB7sObn7llIqhD7/xMDpUcQhzSJ0J39Yo8k2/VDC3vMoz5r6?=
 =?us-ascii?Q?urqTa5vtarDe7UBObT447I3iFsy1ZhJleIM99Z6WYekSiBCwOi9pNPMZ1CRC?=
 =?us-ascii?Q?fDX41wdG+9JNujuBspUWIC1GeaTwTMb6+jj7HH/Mns4Emt6ARCbXLTcATprb?=
 =?us-ascii?Q?YayQ8DA0EBTLqWqQ1xb+0TjtNECN5prhriEQCFi0PQp/rdNnglKToB0TAr8r?=
 =?us-ascii?Q?IlCp4/64RjPXF2UnLq5/3F+Ut/XX1IiXxMi7X2Cp6O/QiGq2KVp12/O81ZTt?=
 =?us-ascii?Q?hUeegIPY2xUlAbqylKkHFk+b1HzIZA1ajGdBmeHroQ/jhxtcO7xeqtSF5KKO?=
 =?us-ascii?Q?1kNgklJKTWdDbOw+kJcV2jFZn9OL8ROu+XiCktn9CEyO/pR8sktzKZBzR4S/?=
 =?us-ascii?Q?5Bk8oEuFmTmpp3XP6o2OGmyc0jeySPsFvNj3NX2lhfUW9UiiHP+AXygIKo17?=
 =?us-ascii?Q?SVbUGOc1ZXUvGMYdENNRhsKM7Qb7is8Xav6rXUxFNXB4Vg1emazByXP1G7JW?=
 =?us-ascii?Q?+FGTLjkTi/ODmEBmxi7bPTdtqY1RUzUeC5bC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QUaQ0peR79iHpQoB1ZH5XaitXug/UIaDLDTIffHGyMDSv9FJXtJ+MlhqqruR?=
 =?us-ascii?Q?kDdUm/u2qNpyVSXJ6HqpaZyxXPsdZgRW7Y427LQ/WJL2xgDn3KADi7zijaQQ?=
 =?us-ascii?Q?eCXRCDyOdM6fc7Zcs3JLfkpF4/jPslbdaNR1vQVptK3O8A9Kx10NC1oTiQ4g?=
 =?us-ascii?Q?7H3l7YvGXQhzQ3q1HU0pwKx7yOQfUM79TgorVN7ctssOs9bYqEt60fTseqb2?=
 =?us-ascii?Q?z8ENq6dYuLpyU4vnzU/5OKxQIEhJOxtie9ZQNYzceEw0d/3JM8AXsWMSvXPj?=
 =?us-ascii?Q?3CcPQjf2MDbcjq/+qiAxkUnGNl/R8tF5JYYUrpAq++bq0GNnm+/i6L1US+DK?=
 =?us-ascii?Q?5THYUjtf9vufSBsdSjOjRdha/YNix88ME0a9W4vnpg7VJFAXY77N9ZDW5pf3?=
 =?us-ascii?Q?0Uoa1PlYNUtVsgum4djUHichChSMfiY+oxxm6pFutlB1AiIR7o3SHPs5mOJN?=
 =?us-ascii?Q?rAvlqBhkX5LUC2sl489H9NlNDDV7VKV2fEuS1kPb3xoXYlou7DbWkXrMi7qC?=
 =?us-ascii?Q?TcGd1jjOxVs1jzMpwF6P/OrHFEDNH/FX899UPJ21Chg0aBwgG+r8cmNuSBAF?=
 =?us-ascii?Q?ZxLK8965wZIKQmwGj/J8nuXS7zUfqbXbukL0D983MbOK6ZDWF8SXW0elXYan?=
 =?us-ascii?Q?GrsWiQK6UrV73n2buaS6kCqokopSBipsjYG72bvhkZYAn4Qy3/a1qws618A1?=
 =?us-ascii?Q?Jlw/4PQdi7FMd7/GT1Tgq/dS4KI7y6EQeo1+P+HFoI/c0KD+7TTB2DUoJUOW?=
 =?us-ascii?Q?n7wFT6pAc02qeqcusBtM3aQP0YfptKoaS95aXk5T1tcc0fy8pUiAKEesFQJu?=
 =?us-ascii?Q?ew4nwNRvsQh5guvqBnEoH64/qSvE/Coov42yeO/1bskGToSfWGtnfIS4BPAN?=
 =?us-ascii?Q?OOoPWK1llkprr91mJ8TP8CDxEx+kl1004XKx6L3iErMqQERABlHlYNKMwp+H?=
 =?us-ascii?Q?aYH9ajqumBuX3tbKbWM2HU5TlrijHC4fUw6gUAXEQu5a4tWTvps41eurjdVa?=
 =?us-ascii?Q?zO/Sqjw5w3YWdU39YKcFC8PbUw1qboZ7ewOhGm0ojQu4ckot+DCHGJw6R8v0?=
 =?us-ascii?Q?usZ00SBA7biHZk+i+BnN3Arbdnd52UZMx37nYWwXj/VYXtSsIshVCRIV1Ovl?=
 =?us-ascii?Q?zmxmYtkoS2TtxrpmIDD+7SQ1v6vbadUfvGzgrrqLQDGPpb4zI0PM8kINZhF6?=
 =?us-ascii?Q?EQNnyc74qys93l2AsWKZjl3sJdjMBMI0jzF5POzN+CoImsgS4+QmKlUN7I1a?=
 =?us-ascii?Q?yXkXXvdqeTweImPXKFzErW5YfAx12G2k1QiuMUavHAAyTzhpy7Cv54EkKP0B?=
 =?us-ascii?Q?4CV5AORnQ+8QblDmI0ihkwohwsXMK4nSUJjtpRQJ5AAB9X2uJwLDM7Ic3J0y?=
 =?us-ascii?Q?3KC4kZ2dMod+JhYM8uQkgJ/9Pc5EtAzEULKTQDDvtBD+T8C8FR6Ve3HFvo4u?=
 =?us-ascii?Q?yOhvWuRjXfPOEGAqdBuCDC08DkyCO5eDvHPqXcD8zx4WL2XuHqY9FiW1Wh5L?=
 =?us-ascii?Q?ek3VrYrESTuITfuzzJy/yuAhBxL6/1v0odU+YrA154JG+pnyBVLaNqG1j/y2?=
 =?us-ascii?Q?++hk+813zBQaQu5v89hQlb0ReirpV7MQGL7oREz99ehg/MhTOXJCYoGOsWjA?=
 =?us-ascii?Q?rzGpITtjiXHnZXTyLOH0pFCIFlYu06ZPhAF9TLtZR8EcicUR9lgHPpu+fv3Q?=
 =?us-ascii?Q?fbipB92Uz9pFbdpk8pKnXrk/uzrVysRkU0HZUApDJ6BAAWCL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64558109-b6b2-46ce-ec8d-08de46f7b0bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 16:31:17.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCMWlQC3sI+vcrtwVqro/+xDr7b29qZn+KsEUHA+PmTANtykXkmDJxNvpygIgbTZfCDFyDZU/s3u8b1P+8N/Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

Add camera ov5640 and related nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- correct regulator voltage.
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c6facb2ad9aaa..e7fe90ae59353 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -74,6 +74,27 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_audio_3v3: regulator-audio-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-3v3";
@@ -560,6 +581,30 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
+	camera@3c {
+	       compatible = "ovti,ov5640";
+	       reg = <0x3c>;
+	       pinctrl-names = "default";
+	       pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
+	       clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
+	       clock-names = "xclk";
+	       assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
+	       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+	       assigned-clock-rates = <24000000>;
+	       powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+	       AVDD-supply = <&reg_2v8>;
+	       DVDD-supply = <&reg_1v5>;
+	       DOVDD-supply = <&reg_1v8>;
+	       status = "okay";
+
+	       port {
+		       ov5640_mipi_0_ep: endpoint {
+			       remote-endpoint = <&mipi_csi0_ep>;
+			       data-lanes = <1 2>;
+		       };
+	       };
+	};
+
 	hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>;
@@ -664,6 +709,10 @@ &i2c5 {
 	 */
 };
 
+&isi_0 {
+	status = "okay";
+};
+
 &lcdif1 {
 	status = "okay";
 };
@@ -682,6 +731,19 @@ &micfil {
 	status = "okay";
 };
 
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+	       port@0 {
+		       mipi_csi0_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi_0_ep>;
+				data-lanes = <1 2>;
+		       };
+	       };
+	};
+};
+
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
@@ -855,6 +917,24 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
 		>;
 	};
 
+	pinctrl_csi_mclk: csi_mclk_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50
+		>;
+	};
+
+	pinctrl_csi0_pwn: csi0_pwn_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x10
+		>;
+	};
+
+	pinctrl_csi0_rst: csi0_rst_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06	0x10
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
-- 
2.34.1

