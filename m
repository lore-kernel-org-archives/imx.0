Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060.outbound.protection.outlook.com [40.107.247.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154211553BC
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503621; cv=fail; b=r/3vYZXe3Heg32AOzOqgFGY9sE/1iJusVALRQ6iYVLwKdQMEYz6pniIkQbxKE3j7SNcEPg1ccWYf35hYUriPZ4ydIlFS7pRa0cZ31StHj1iM+DMYiv3WVSyr9hFs1QC96kaLexKQgcS5lAL0LIKtD/54GrmMzB7SJJlV+r/a7y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503621; c=relaxed/simple;
	bh=FPg3J9uWC2k+GxeFjuSIrqlmCI288JsivQxEJBiFAos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bd4xTnJ2siNsTUmvTB+jbGo8IrD8ifUoft3P52CBTLHp1UJDiG3bkUTZZr/ivDb25ZvKfSYFzujdBPvgZgkppZez2RYGkYQYpHixZzbeKOQrw1/JOeWwodbHyb/Drl3nbDR4mxI596IJyD1CqnB6Asgasi/wG+XRmZcpEkk9vOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kt6rQlms; arc=fail smtp.client-ip=40.107.247.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kt6rQlms"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3yvIIzUbrgJd8FKL7PI0N4OxAEcIQlDw8Qs2GsbOK3kq6d7vzTHrSD35tECISgSYjOxk4+c/5mwUvg2PUNdOkDYBBGVPf7pa66U/s/KhyOCV7LrU67Q+U/34rHo3FmlX0ENa4mRxJXzySyDKLcsiHoetsqlkJs6Rw9ARvg8XvdBYH+ux33rAWpxd8WXV+PGbfF4/dCiagybAz+uQJOU+DlP2mbjRfz/fkZVTAy/9R+2mAU3feGm2YIZfkSHU64RS+jv9VuAXs574sr+2oRdkf3OwZ1sz1kaU3c8Wc4ja5WP3OecfbGrz9IKNfgIPqYrd8TZN5zxvCcemRa2mw4jzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7IIQpVA9hxjfFGL0J7CYadslNC7l5HKzt9RDPdRYkA=;
 b=O1jOulHtKXPiKrXnW9FtQx0w6wm+5h3NMZUANY3L8f37AIMRIqDLQdOZ6W4WHY41dJ7VtnVqRDuUMZG1/tOncBflWUxBqQd8J63ssBF2KPGH5QWFua/n9CIFZayYwXjeLD2R9xXYFaY0vvRKwa/cQP+uLKzm7z5J3itSh9BMIGxoxfhB5j/hFUu1lrb6IxkduXWjV9yzxiMiGN74nnlGzygKnYfDccKrMIfyMwsdPfSfEkYvds20QIN779xzhhST3nMe5yQ1HMha+LGMw2h4/llVx2h6u7Lyx7ZJD5XpMux+Vv91AY8HbmIHOeOoZyoR5XFYnsoFMnjZ6dV2PFVWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7IIQpVA9hxjfFGL0J7CYadslNC7l5HKzt9RDPdRYkA=;
 b=kt6rQlmsYouASia+6Eeo/xFVYK2R0gzJC1CdFvMoy8TkzvJcGmog0FmiAQN6UMq/ZF9/mlWYYCrtKy+RufsbtoycnWWX4VS6xJeXDfcLyra9tCzPrhM3nTwoMDzSkiMrCbu5vC7tJKV1mPGiRx67zuWBxx9/8MVHIXc01c/TYi4Oun23QV35bqBjCF8KNrfA0krQC8C322zyLAgE/2kZ2KWUh7PiQGu+5Tq57+fxLPTkF4IhDtC6eTxf2eTigoVzW6qtZSJV8ARn5r9LGh+wOEtc43af0m8zEmwNcQkoQgacKRT+CZRholenqr2IhZiLEnkP6zkqXCIB1/Gl+F4GWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 06:33:37 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 06:33:37 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx95: add NETC related nodes
Date: Wed, 18 Dec 2024 14:17:24 +0800
Message-Id: <20241218061725.1608466-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218061725.1608466-1-wei.fang@nxp.com>
References: <20241218061725.1608466-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad69c94-de05-4636-633e-08dd1f2de755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Mzp8F83yRpzF3KC3kGrnbMRXvKpTzbBPTWieW757oeUjEEswlS49lYrdEUT?=
 =?us-ascii?Q?a4pKi0xxbaDE5G+zqvu6K0bx22J25PNSi8zVDo21QGboRd3w9xdosdfOKHnB?=
 =?us-ascii?Q?Keccqv6X3+prk/i7cc4pg0lPTVfwCkbB0ox70kobXqeqXXngn74W8xQXpU5k?=
 =?us-ascii?Q?xYDHfrmR7EwpIIK/p2xOTXTWty8azkkNRBFGjpgfDEdKwW6+lsb7eMCvqANq?=
 =?us-ascii?Q?lbcwGHuSTYk0T/sg3BVIjr0hDvycVINexOc7MsgxxWSOa/RDa/xWsfFnUNf7?=
 =?us-ascii?Q?jWso3IqL7HbwNST8VxQxZg62knaXVkHjExrqX9hZwpf5vZlUrWSvS0NWMfm7?=
 =?us-ascii?Q?g5gP48+HAqnP2vNQsY9MrtoEBUEHz/VX4R6+ILGwgmJbYtU0f7lEL7bPtY6Y?=
 =?us-ascii?Q?AbFy4EiS0SfB7svGOXifePV70JxFgHPd2fMEZsdm8nWPYY93vf25z4nkrU2f?=
 =?us-ascii?Q?jfWR4e99SlNmVOkyjsdZu5TebLPlkUdIODqq/twPM27g1g4tLXTXfmCUaMsZ?=
 =?us-ascii?Q?fG7tb3h/U2O85yM1RBO1p+sJZXLTycUNzqC24voQwPAzbS8rvJrX9NjvkQu0?=
 =?us-ascii?Q?h5rRLYMOy5z0A3ZP7407UTh2Con/lZrFi7uAlgku/cqwyrj+91HLc3SJr7MQ?=
 =?us-ascii?Q?ol+X0iA17zOP5JW+Dh1SO9tyIs42fE/kqHK13fHs22NZRXb5j3l6RgMA4SSi?=
 =?us-ascii?Q?FxGOa2wQZ3Ls6Krj6hyYuSIlvaswzAiEX/x4GgxtnaUGo3EO9ZJ9AilPmJ//?=
 =?us-ascii?Q?ez47GyYbgOPm2QLKB0oti58QcvE80CqupwwlJh908rjuLyr6YBbTRjEotdZR?=
 =?us-ascii?Q?3wMclMAEzZBscIWr8izrY3noxsRHUK2hIGXdYNNvlHzl8eb15mrg9deib6xF?=
 =?us-ascii?Q?pVxzCIS5u7oPNTg0Kwbqoz0CVIFSjzVxf//KDRqUgTgPkQDwTxxjlPWcERiE?=
 =?us-ascii?Q?2g7BoOLrr+1KUNh2pZeQw7avOsAtnbQOk5U3SbIF0YdyyEY+vQBjbrPfp9XT?=
 =?us-ascii?Q?0M2BpV7GTBWjecOJF4AGinjYAy4E6j5MWGrfAh0SYSlpRW22NerY3rmzFfM1?=
 =?us-ascii?Q?Z5RvA93WBO5pfTyUgGMKLX+Qm7gAWG3lpWUW7TWq8wzsfR22sQvD0L47ToZ/?=
 =?us-ascii?Q?bgRvigtFY3gEdyKDYWso4/CmMc7KSGsnd+N48ZpcT623BY6uuDi8oyAbSjKE?=
 =?us-ascii?Q?aQrUDK01ZeUbBI+qdm1FnWT1rXJRz0roNIUAqBVSi0CiTL4NKQU5TxL9ePy9?=
 =?us-ascii?Q?I0h7jQP48uzCWEa4yC6ZT5fbN3Egwh4nHVOUyWj8hVxKrqNMVgXZlqR0M8lz?=
 =?us-ascii?Q?g6R+q2pbvbHw6nbPRoEhqXT2IhYabxfQhT7F3EAlj6qSXbRwteZ89CtMceXh?=
 =?us-ascii?Q?f3ePsDwTbdaCxkRk10xd1zWWdhQe5hYLlTYwyq/8jhP9gGZfwPE2Z1owb6At?=
 =?us-ascii?Q?+ToRAIujblkjS4m7VNVlHL+utnYjUVAn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rdeSVVZXSBTqcR+eb7z86Y0wk85NHrdahHqHipMxBui1Gh/3I2Kx+2X65N3q?=
 =?us-ascii?Q?08O197XxRNHxI6HxTvYa/i9wAAwdPAe85IF1JXhdxFNptD9ugDk3octp5g8S?=
 =?us-ascii?Q?0sF8as/hbW4mMPymrn5gRswcyo9Gj8LT0VTo383UlxZA9lsGRoHbMvcMwy7u?=
 =?us-ascii?Q?YW+fZcL6rOgkNcny/tdqnx3BRiLLxRLGfXkKQat2e+GPDhT+9ODi1Pcbwfgp?=
 =?us-ascii?Q?wmonWsTykYN/kyxT3MaOs5OXKCV6RiNBdVeQQYDpFR0TR8bfu5rcHnrZYUV1?=
 =?us-ascii?Q?w2Gq7VOnrP6HLjVdSb8VlMJH5SRKjBUKQtemKn1YPwl6/QYPOegrFCTYKOAc?=
 =?us-ascii?Q?aI7J+tGBLiCAZzmoTadk7LXZqrY5lgGuy95EmFA9JtIJe9+eUQ4Xaxk+GSWE?=
 =?us-ascii?Q?/QvXI/kwjyb4LaeXKCAxkEi/boV9ytoi9ZC6+BiG0Pffpno1/elofUjt28dT?=
 =?us-ascii?Q?ztMuq/y+YmjbZas0BMVYpolqQpiUu9QO+DjIhsZjx0GYhO8PgfRknnFEDE8x?=
 =?us-ascii?Q?EuFNpyjvzfqkjTjZm4LzHJtKc7xnLfbl8qLRIwXpsGgQsSTdebWxxHV2T5Yl?=
 =?us-ascii?Q?bE8+KEr52zB440i7bOrxPZqfJWsMxtlkW+i29hoglifB9W9MpS7AVIN65cUs?=
 =?us-ascii?Q?JZoBJbiiQm0CUkvIFP1axh6HqKv6moZV0KnkMWtj4hT37Mx+2hNqDUgyALXd?=
 =?us-ascii?Q?az5lHJOnlZ5xcwgUHaH8zjrAJyDFqeEsjXZ85CXwOH+C2Aicl+l3QztFH03f?=
 =?us-ascii?Q?rvOZvA9O3DesLpTJLyd9z1nd5iat5M5TemDzzpy4JFwyS7+OaoON/Yim6afY?=
 =?us-ascii?Q?pCmhvqFvYRYsYmClULnlQl7xd1kcuEnN4y8fWTI3TaYS2vnMImH+K9KyrXxs?=
 =?us-ascii?Q?/LxOduwIH/Mhcffr0XpId7vO2cS9ZZAkh5k29EsKRYMlByOKp32DdRQh0/xy?=
 =?us-ascii?Q?gzFOxXYdYc23OwNDqCMvx9NNyQupjwRsKQZLe0qUtAh71MmqGLpHwV7FxRnv?=
 =?us-ascii?Q?j8XdPRXBi8f/ma2DngwE5rotlOd4wluv69SUQ803RQwpw4sRTdAfFcuK0CSn?=
 =?us-ascii?Q?/xxFt4Vi1NSRUnL/AQYfrcTrMyzLazylbE9Qm7VwCg4NxRVqYQr1YOH8dmX1?=
 =?us-ascii?Q?ZFpE9muke58n5Ua0BE/6duLz+A2lJWVZFigxMZ3FMqfJLurbcX11qmpScrQS?=
 =?us-ascii?Q?3cN+SOZ7DrpNj8PoeF0MQH9++dqPsBUDL6/z1ix+Z9QlzFZ3A0QBjmDivYRG?=
 =?us-ascii?Q?JWe6eFI7m2WsWUuwKl08RBaGq79B2d/q/SnR0DuYBXzS/MTwCA13V8eni4pg?=
 =?us-ascii?Q?oV6jK5kSx2vNr32o+TKL268s3GDe2TMbKp55yH++Fs52l4r2qTHamUrpfQ7E?=
 =?us-ascii?Q?GbrjeE+PbVcQmM3N9yU6dQyxcbmroSxR4K+8h5xC4CZzVswjb754rE55lFEv?=
 =?us-ascii?Q?euY5GHpea/gs8NhYMJnFMVTrwYvjgShDfvxGhYvWe4+gkcmDULVysQDQP5oK?=
 =?us-ascii?Q?zoLK33+WSfagalDs4CkA4Djzs/TBCUtskuGRqrgowEnGI87ZqfhRBV+stCsM?=
 =?us-ascii?Q?7V1PZ2S1DDnOtsC97DX8ZUrt3cXrDd5VESD14cR/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad69c94-de05-4636-633e-08dd1f2de755
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:33:37.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmAwqSPj8l+qLHoUKgTkqjlFQlvsSi70Va3kyYcrB0aWiy919n1PWSVrdeDIfcYVmqwQTEly0vYHGjQXJvYq/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192

Add NETC related nodes for i.MX95.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index e9c7a8265d71..86f9fed9998c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1702,5 +1702,98 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		netc_blk_ctrl: system-controller@4cde0000 {
+			compatible = "nxp,imx95-netc-blk-ctrl";
+			reg = <0x0 0x4cde0000 0x0 0x10000>,
+			      <0x0 0x4cdf0000 0x0 0x10000>,
+			      <0x0 0x4c81000c 0x0 0x18>;
+			reg-names = "ierb", "prb", "netcmix";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_NETC>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_ENET>,
+					  <&scmi_clk IMX95_CLK_ENETREF>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
+			assigned-clock-rates = <666666666>, <250000000>;
+			clocks = <&scmi_clk IMX95_CLK_ENET>;
+			clock-names = "ipg";
+			status = "disabled";
+
+			netc_bus0: pcie@4ca00000 {
+				compatible = "pci-host-ecam-generic";
+				reg = <0x0 0x4ca00000 0x0 0x100000>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				bus-range = <0x0 0x0>;
+				msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
+					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
+					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
+					  <0x40 &its 0x63 0x1>, //ENETC1 PF
+					  <0x80 &its 0x64 0x1>, //ENETC2 PF
+					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
+					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
+					  <0xc0 &its 0x67 0x1>; //NETC Timer
+					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
+				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
+					 /* Timer BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
+					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
+					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
+					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
+
+				enetc_port0: ethernet@0,0 {
+					compatible = "pci1131,e101";
+					reg = <0x000000 0 0 0 0>;
+					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
+					clock-names = "ref";
+					status = "disabled";
+				};
+
+				enetc_port1: ethernet@8,0 {
+					compatible = "pci1131,e101";
+					reg = <0x004000 0 0 0 0>;
+					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
+					clock-names = "ref";
+					status = "disabled";
+				};
+
+				enetc_port2: ethernet@10,0 {
+					compatible = "pci1131,e101";
+					reg = <0x008000 0 0 0 0>;
+					status = "disabled";
+				};
+
+				netc_timer: ethernet@18,0 {
+					reg = <0x00c000 0 0 0 0>;
+					status = "disabled";
+				};
+			};
+
+			netc_bus1: pcie@4cb00000 {
+				compatible = "pci-host-ecam-generic";
+				reg = <0x0 0x4cb00000 0x0 0x100000>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				bus-range = <0x1 0x1>;
+					 /* EMDIO BAR0 - non-prefetchable memory */
+				ranges = <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
+					 /* EMDIO BAR2 - prefetchable memory */
+					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
+
+				netc_emdio: mdio@0,0 {
+					compatible = "pci1131,ee00";
+					reg = <0x010000 0 0 0 0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+				};
+			};
+		};
 	};
 };
-- 
2.34.1

