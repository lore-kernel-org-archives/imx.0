Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2083.outbound.protection.outlook.com [40.107.241.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA315853A
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503625; cv=fail; b=NXbmp3ZUeOmQq9NnDfd5GvQ/1mYJw+HFFODVzeHG6ZrspD2yzTgVfwZNUiVWf7rfZ3zax1AKTNS37dn9vgu4N3wEnKPvBMUK7URKyfE/32A8GpO/CIeQFRG9Rw9KqAo3T1g1VtR7DD7exijKGm7xlp/H1Smguie/y07x80TSTXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503625; c=relaxed/simple;
	bh=fNnQALeBpKF5kHswSRauASzqPa8GhRcsH5AFSZutf08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+o33fdW1SOvh34yCzUxr6eqoHleTbAK/bxe/6dXUheshVTxR7xg6SwAXN7hVeaH8Xubnq0pfSAxDH0AYNvqP0KCzWXPhkS6JrxYZaeITOuKunqzvdDMB9DAX6aPrH4QOuf8jf8K6/ZGrSplG3+RBbN4hYPNwnSFAlZjUMufr98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CeZjehNn; arc=fail smtp.client-ip=40.107.241.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CeZjehNn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rklJfMLQktlVl0pLaN3jNLeyuOh4cTco37xoBYiKCmsvl0H9SFJAGpgsVuub/QYqsZP0N5AXxUN6OYVu0qO4QGzC5t8lcKcsFTudRzlx1C6CkCZGh19wZ/DcBEnG6p/iNVBw/FKggw+yOpTlxxXQg00DGhneUL2buXq7Dge0tuPXeFW3R0Qs6Oqf19k6qhcKpSFwL4F16FeWa/mzbOmU2TSjmhw1eFD3kCXT4Ue38iLtpU57N7rppGsNbEVm5yIcj0IlSk6ZcRYu6tTFUIuYPRGFTTiPOnkEom5zsXz8l7zSlQEIiLWZQPN9IfFOR1mTT0HBMy/v+v2/TeXnsxI4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg6RsNj47F9ldSala7Vn8qF/dDp/5Z6TQWPz1iCRSUQ=;
 b=ESE3ws/vNQBJSLpSoRl2TOD2bdUKjrc8osBD0A/mo4qf2Z5U9dLLiMSBUU/lEH3enwXppcavreXi0DfA2UZ5iHTvyqE9Wc3FZAUr5sc1vN3wG9gids05RQCAUfsSb6v6ogSBAldYJD3g8Ol+MfBptLC2EtqXG1USazKjOg75pQC30qWfEZiFpoj+TR771CmB/fsDHqKyOkF7MXKqMm0hygJnLws3NGOe4OgYaOnWQhe6M5iKJ/VFcJ0K3ZHTbwjseXgOHLMXGEV+XFbnlA8CyxypwO/V0mQO7kBBm1Rd0aeXH6ijR+dUS6SN+oAvnKntc/amXt4NJQXevpSG+z9P5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg6RsNj47F9ldSala7Vn8qF/dDp/5Z6TQWPz1iCRSUQ=;
 b=CeZjehNntSgift12+twxBCENqvEzr9BWROg8W+qV3wdVtrFOQLTJkF9SgyAbiM2lExkvT3muHa43BACvXawHh/Jc36s8p0dgAT6mFGobsU12lUTuuXkt1rGS7MkngugYJseuzRKG6gWHyuynODrh8ahmLLmpMexpbQHrVEtBYvoCL6r7+7h16a4si3FPeXU2DNN0xC3R8P0wvtW0nqZ4KHAfnU/NZAlJndlUg8ZtCChSFZCLo29g4IlxvJzpSt6BT90GhKIZQtu1ZO0Z4tLDnXMxvr+xQ8z0wi/mGTmBoJuwpcODoP+t3ScRmVElLRCzdve/NUyqS+DivQAOyWJuQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 06:33:41 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 06:33:41 +0000
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
Subject: [PATCH 2/2] arm64: dts: imx95: add ENETC 0 support
Date: Wed, 18 Dec 2024 14:17:25 +0800
Message-Id: <20241218061725.1608466-3-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc0fb76e-d82a-40e6-4eb7-08dd1f2de9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L6kgzPeSf4e27OhXjvyRnzItMGJ1UkuZpXcK2Gs7ANMJMyI9G72K892MWm9h?=
 =?us-ascii?Q?OpzfLrPGia+F4INUpaW2KvGyGb/PX7Lk9yTChkq8jElcJpyHa+DZNEb1g1r/?=
 =?us-ascii?Q?aiHMorCYG5Lrb6YvZbCmw3bfLcSD1DDbPqZvpHxJ/JqwZPGWxE7BadtYG7+t?=
 =?us-ascii?Q?eVb8uoq7xqgOgkayQwtwsOvPHMuJk6kLYoui4gZ9IcWZVhety+ROoUxZCfi+?=
 =?us-ascii?Q?WHbftTGRlsC5qDlhq3MNDK+4nBUF/I0dk53t5H01Tcw8QFhXUTTKhzFXSyKD?=
 =?us-ascii?Q?iuXH/8JWFAmNmptgq4Swl20Z0fE8aqaZPLPac18BRDLL2M41jF/OZC0CtS6N?=
 =?us-ascii?Q?N5wj1hj3MhuHOdFk9F4uQRNgPbxaXNObv65EUC1je6hCRIlkNlsY/pyOx4St?=
 =?us-ascii?Q?URS4jE0rv8df7/gCOFHjaNVbIsOqjErGKRd+K7sys/tuQFYco5yyl9jABc+G?=
 =?us-ascii?Q?WELglo8fCpDszC6caWh3aTn5EP/8vQrGYKTWjsco9Fjq9w2KvJdpxqDbFrQD?=
 =?us-ascii?Q?fPUQDLwfMvOJwXFc5nH/yz6sT9SWb4Kn0RzWtCHU0tkJOcmDEBELbLMeCKUc?=
 =?us-ascii?Q?9I3tMtNjYgekts4PlAyEEEEoEdGSLImkCDSBs4/tqgUSJXiViXX/GqyrZKZ3?=
 =?us-ascii?Q?WsRxen25kvIhod8qBOmCE1aT++3qyMUnoCKmJxPMAltPc6JktDf4WoScAyKs?=
 =?us-ascii?Q?X9gc92d6p9zkJp3AcpV70Q0spfwHzFKOyyMLSE89VsB3oOo6OSosECOR1HY8?=
 =?us-ascii?Q?NkxPuSCKNnYmH654N+QktwlJNzKFdkvzC2rNQnZt+sW/CSEQQLrH+eQLc66A?=
 =?us-ascii?Q?FTAjBfPA+zaMmgam6ECAMSitFU7IRbkZ9PADX2liuNBYLsZuEbhiOVnd3cbs?=
 =?us-ascii?Q?vkQvvp7LtMma7h/st9R2zZIv5/S9w94ILHeqTt8VWEbVPtDEZKExsJhWfiJG?=
 =?us-ascii?Q?UvTyXECmBR1IW1VmhDisRVMb51dBQEsJMPqO7yhYaXUCBbxx71WMHbnhCRyH?=
 =?us-ascii?Q?6SyBM3OIdF9QfA++paDkg1L7Hu8v05kESeGqZUwL/fN88WmVWl5MR+z3Rs7H?=
 =?us-ascii?Q?M6Qz9z2td9cz558Evksi8BowSnd7eQ17FYHHq6orgyFD65ZZQHXBJ2RiWcOZ?=
 =?us-ascii?Q?7faFaL55mPm/TUhRL8FZPlsghySLDFVbJKWR8r5x1sHdCVIhgkjiCv5CMl+4?=
 =?us-ascii?Q?4eiOrJ/arc9wmOZpA5nbA2WVDayHMAStDyJwWd060yyABtlFTiZWJJJ8G5Pe?=
 =?us-ascii?Q?uqRQGHpDwcB27fntEypGl1Vp7i6E2P39ZQGw9X1jRjzrMk2u0dBui4H6pbfK?=
 =?us-ascii?Q?+jBkIdygppKdTP+UEahFW5Ky2jaCB14u3oP9D8+N9Hoo67s6j/zwBCAYHJjQ?=
 =?us-ascii?Q?qzOicDw8RxOwwPd2AfpyECQgQ3sf+KNuNa3VuPFvOIBTaXgWgrUe/6NKqmV0?=
 =?us-ascii?Q?4QvlftB9ak9jJx/f1RWUT69D19qnqT/O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aRsmFnoqTLZieXnbAx0Zhz7o1j7a2cDQ+2SmnoWtyehSF2Jj2JSSV1plwp7V?=
 =?us-ascii?Q?HVkurS34WyEU9D9BZ6a+VWKSd3xEcCF2bo9Q+Sp5+a2pPc7h+tgO6hvwu+Zm?=
 =?us-ascii?Q?t4GgN7NrICngLiLoyC5ZGz7PQ70n3Y7/9+dlju3WRvP83eQuNpuQqDGKsvIt?=
 =?us-ascii?Q?IAiUCTwavJzw5D6hCiXgS6k0OkBRCopKrcUawD2O7gUhDbsZoslubceRq4QR?=
 =?us-ascii?Q?FXOrS9RWYBM+riEUdYwhbRHQ3pFiqTn+VxaYUSiwrT4rngWJHbmJbowWN1W8?=
 =?us-ascii?Q?kZOgGj2oNydZfQGK/qsgTqV5q453FZGS7OQeE1poNox0EGm5NwJYJzjRVdJO?=
 =?us-ascii?Q?MbRkORCWIAcnCi3PivlnyAo+samx40Lf0w4ehp1gZXPEsOaZ4N6SfG/B7NhB?=
 =?us-ascii?Q?152LoHZ2gh7Vv0UgsN4gYkc/Es4/WStoZs30vBlb+YXiOYHp092o78a/L33j?=
 =?us-ascii?Q?ta1IUb+GhsB9u+BUjxgT7dgcgmX06BfZ4pZS/R4Jx5mMTsS14bTlxZQaaPpx?=
 =?us-ascii?Q?FDBULbwSNacU7movClxucrKwqgKKgCZVRD32VTek1gaI5SoyDfYtSzK6IfUb?=
 =?us-ascii?Q?G2z2ypPeeD8P5oLxIX1ntTTGEEz77a9m5c6Pr+6WaB7ZxNjn9y/wEeE772fJ?=
 =?us-ascii?Q?VK8W4XUnM6brb/RbcOWXkFUbwcSlxwDhxoUTWcmQvzyPSC7Ynp7LNu+l5bHh?=
 =?us-ascii?Q?YNqGa3Cf8BwTI9NVepAetn8RlFXxPly0ZCTGXcRDLMtHVnInvz2zTqZzce4v?=
 =?us-ascii?Q?9mX2w9wfUuKWtRWMUpi8cWdDWuwbDMA+frJ3GARl/UvUU2I0tN4l1yrkiovY?=
 =?us-ascii?Q?KbkPTfpzUy5APk8XIOeuXsYOPdDZpucgYTz3XJu1IzqKI+s7e/vy4w8shI/j?=
 =?us-ascii?Q?z+UJy9D7QfMvJepzfiaN5L4PzTD/8PihvxoF26wIJD4c65lQmE1R8HDUXUuT?=
 =?us-ascii?Q?/h6R5/aJ7yxbh7afbicZ3Y+ytZWMcq8MguXSW3PYt6iHxl/6ICykjF1HFs+R?=
 =?us-ascii?Q?qV3F3yzRI9Fbt2y5xpqBW+3jnNNShuqsWuBg6zY8tszJNWK4maAOfpxDRljd?=
 =?us-ascii?Q?pXHgi6rvDnraafganb5/0jrnNvi6Ha298ECOZy9hNhwUCJ/XUTTnUnrq3X8v?=
 =?us-ascii?Q?DnE0IO4M6AfTPYu+xS1DD8NokUj8Wp4ycF+Jg9XnXRHcYTYtXP5GX1mQhmMf?=
 =?us-ascii?Q?87PkPTswRutbU3yUOhNGUBiVgJNlNVoaC8karJQBE6QzH8J8tOQgzFywAYAk?=
 =?us-ascii?Q?dtBYTafJez7xYqaID8uIrkRbP2t505WOarvdfIQturMm0FrRlUni77dyBj7u?=
 =?us-ascii?Q?X8AnJSpXWEx4gD4fAxUMX5Sv+gYjTtpn9BZzisLJZjdNgiqmK+fNN6TqEv83?=
 =?us-ascii?Q?tvhQP1sVrNVXh1iequaiW5acS3tHfpSh5VoOjm22uAJAKTaPv/BmBZ/2B8T3?=
 =?us-ascii?Q?acRj2YZ0uzzQ2lrB/Mkewjfq37VvBSziUlpXcyzoxwRilK5UqT8iuWVL8zeX?=
 =?us-ascii?Q?UgODTp0jGUzWj9h36VbhsinzhIT+RBckZN5irrgfMlVThd1MaAsMJi1W2K7W?=
 =?us-ascii?Q?IYB4ITla/f1I2OSdamTTkq5vmi/VJ8t1zuUIWvUn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0fb76e-d82a-40e6-4eb7-08dd1f2de9c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:33:41.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/gyAjyj8vbSG7c5RPiiPAvg57ViJqOc8i4QhsYcVgdDGm7efU8CZ27GjXXGZCnAjIgurAdtiE8YIcHi8nRfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192

Add ENETC 0 (1G ethernet port) support for i.MX95-19x19-EVK board. In
addition, because all ENETC instances share MDIO bus, so enable EMDIO
at the same time.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6086cb7fa5a0..e838234c8317 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -38,6 +38,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
+		ethernet0 = &enetc_port0;
 	};
 
 	bt_sco_codec: audio-codec-bt-sco {
@@ -428,6 +429,33 @@ &wdog3 {
 	status = "okay";
 };
 
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		reg = <1>;
+		realtek,clkout-disable;
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_flexspi1: flexspi1grp {
 		fsl,pins = <
@@ -665,6 +693,30 @@ IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
 		>;
 	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_emdio: emdiogrp{
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+		>;
+	};
 };
 
 &thermal_zones {
-- 
2.34.1

