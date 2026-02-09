Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1B25CC40
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 05:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616643; cv=fail; b=r7y3hlbPNq0OGRJqIGe2C/5n567b6+lAiGwQrl68zk802fdZ/jTtwhi+4FCu36dqOgG98JXH4KQcbd6UpLkPSEWnS3V3cuQ7j917ruMnR338mg6HUXV7DePfM39cHg/gIgCJk0tEsocsB9VhKKiZOLOrJ2ruI7b1LrQ/7feo61Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616643; c=relaxed/simple;
	bh=y6x4RswetNjGhgUdHpd2HygJz5FPLcO5ju8DWPGOX+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5ZmPZDSRiQFrcw94u+4Rwb0kpEaWjhW7aShAlGZR79+ATP/ghmfS9zXFgL2mLWo6McTH6pCsDfeoQwQnVkywyLUdFW5jiJO99JJ1kudV7eDz+Ck5QY29/lfeSz4sCnElVKX0rcQM2c9xPQLFLNWfGCHlTl0Sy4/NbSBBQFDxgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sg+o4bx0; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sg+o4bx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNLrinn9cXjZt8K4upX3Oay3gtregPBGCukikMllAkU3aQZo5s1CZRT7RTtfnO0V3bOCfIMr3pPkJ7e4IXrLm6G/CLTCif/B1DwOlCKwZiFLtCTobtg4j8GPNOEFiMW/JDhsbusCO8p02nH01lUXkAVHqZPQKKwKQv15FPcfK3T5kWRBFr/eUYED3bAb3CebDYmhyE8IKmmxnSvw1EO0WCNL0FDJmZJm40f3uE2RNnEbfKUBsTUGl2iDoOEDoFZ8wZ+TmiNbEkRUqe+0Zf7Pvkm1n11c+XavNfZ52eW5YWZsaOGvtSqMSIW4G18wWQoiyiO6lp/L6v+zWaL2pti1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRGAUrUTVLzw9e6TEEU4mkYe/JQiEZYxAldZSisdKsE=;
 b=r5xvvokXpkF37IZNFwOXmvoOJp3Nm14yzuOn8a2eE0Q/mR5HP2VFGtA45mjsQbd+7EK7SeIVNJIGWriurD1lvg1/DJhC6pm2vuYRWirT3aKGTGlwbQ2o5rIl78p20hPPT9edPXi4c0C0d+zFdMOiON0kEJdOk0D9MsX5V+aPdA0Qoo9HUEBXAiZABwUxtMhQCUUA0CL0R6l2Tl1Xgi7FoJtUrkdGqMT5Gg9fzbiUc+pr2KltpRlceNHYK5KfqpifeGLj8Kvu7vVI/PUmrMcsI2D79JBrDtl0gAGwa5YTjXk+T7pLXprSqo0DaaK6adl7a5Wew5Zv8OvNprTaPCPisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRGAUrUTVLzw9e6TEEU4mkYe/JQiEZYxAldZSisdKsE=;
 b=Sg+o4bx0GpMePvWW1JkZKpdDBFfWz3bXQ5WKyJlE9Lkd71/LLvaUpLmIIK+HqqZNzDPl0GY4vZZXBEQ7C933lD8beXNcu1NlNtGjLnHecinJF7CPfg/CO+UPBfwOfo2apCh3qL1xv355UMcvtpIOfhptetvOcx5amrQl7fxZLrAorPoux8WsuoCmYKY/uJ/Sv9wmz6IHpCuguKSMBpPaWZAnjz/b/zpf5gL482mbp9AcTCCMOWhyb8T29bljOUwo9VK7iRY7Bx8psvJmWweBeOfwVpYgOjLW5V/R9YPZ22V3OZOTrrmJVicZ27tfZtqg0qbXtjR97y38RTJe1vBj3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 05:57:20 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:57:20 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
Date: Mon,  9 Feb 2026 13:57:44 +0800
Message-Id: <20260209055745.1545129-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AS8PR04MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fe0ae3-27b0-4d0a-7ca1-08de67a0162f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v94IR0Uylr79+7HW35zEuVdpoIR7FeN2hIKEQcxsZMz2m6Ph1F5Hc6Uh+GN/?=
 =?us-ascii?Q?qMk+WSKATyUf+/TJ30JJsndrC0ghDKTtoh/XMOp/+hsP8+h772MEL9ip9C2O?=
 =?us-ascii?Q?s718Ra2JuiPgw0qoqRqqmghALOqmRBqkaGN/9doRxlgrJDsfpe3yaU5GrOv7?=
 =?us-ascii?Q?XluISvjbMzS96JN0HtpFtkfICumuff+A6Qs9Y2bpeoscD8qns321CiFgBgoj?=
 =?us-ascii?Q?8VML8Gqth6y/Uxh7soPuP6qRaN9BmdZOR7BwIk45nY1I14bZYY+46o86IIO4?=
 =?us-ascii?Q?dqmHqdRr7lG/IpBSI56joeKrsifGKW6I1GF5kgkSAp+T1A9d0IpwsqemaNaW?=
 =?us-ascii?Q?yivhfiPSWOXxcqL9TxsRsQYJFf5l8Zr6se1T/siTB38z+TJn6bjTNxt3aBJH?=
 =?us-ascii?Q?EBKAXH7BjrQXa3g5miSohOPc9t2JQMNzMW/i3W9HXFurG1BsUke1Zwc5ATAy?=
 =?us-ascii?Q?9Sz/3tsDAOQtHspuae3/f96SBn4rsVcWnM0WQl3m0twwywtv2cK6kAR+nLNa?=
 =?us-ascii?Q?v6H70gp1I+OuQ7z3Zu2h2VXHsn9nI7RFiR7TgsB6qT6bMzx8VNW/kwGGemJc?=
 =?us-ascii?Q?uRn4v8hInERYOZue5AUVWOS6R/3bTBJoPEYkGjaM2s1Yl7jA8akFQxlF1yEg?=
 =?us-ascii?Q?J3c0Xv2iN/McEDzvGu1eXFDYyOgdqC5KPsC5j5q4GptbdGIQj6Pe87HMo1/v?=
 =?us-ascii?Q?V2/K3aDHnmpV2S9iiiAAkkyFb3uNNjahHKMmhU8rt7xtGCazJhRu01UhtqUK?=
 =?us-ascii?Q?4TiCDftNETk9+JN3iMg+PmE6SmKieb5znSCvGiiFS7XoTkdK9bHemdDPexHS?=
 =?us-ascii?Q?nx2iUey5Glj/mne7sQtjDY3oDAgnY4Wcjd9RvCI5371ptLL0m/1jl7AWiPbq?=
 =?us-ascii?Q?1F8DgnKRvs101sKAmD1TqXwgfnFElGk8VDiOfG2ZZx602pLBxi5zis1AlNty?=
 =?us-ascii?Q?mSEImbPFXvI1TgPtj9geYhRUjgJYHO/GlTT/Cx6Norz7U2oFzpCeEXvOCsnu?=
 =?us-ascii?Q?n9xSOppK0Iqs5MU1tDrI2mUgr2CyAcBiWrexc4PxLrNpaoCXpgeQCpaGrYUU?=
 =?us-ascii?Q?HweInRKWuVFqChvh9e/IXVExzBKK9u4EYhwyjSm4CAqKbQbyao4VV+hSVVfz?=
 =?us-ascii?Q?HIGaBsqz0gA1KwbIwBavzhmflh9LlT6aSOBcSwD1wlG8CLZJM9XrVl/JrAVC?=
 =?us-ascii?Q?NAxn1NZO9ZMblBCIzJQq2drri9rIWPUORs9IRzzwRW7q8nPymiLzJ4z669Tu?=
 =?us-ascii?Q?+rUQa4WHOyqoyo9HwZwrdX71Ul8s8BetYcbPQQ5UkO3ZB/uTB9AA9XlOEMg8?=
 =?us-ascii?Q?Y5jDmQp6hd89s2Smw5aLtDJGMP0mD8rFtwyDeDxkAkWp9qSuPhWY9zsnAxtR?=
 =?us-ascii?Q?Asb7HjklBxdlzJmnEQiXhTsFsNTF/cAbwqu42V3d9/JXra4+f56LBXXoXbr5?=
 =?us-ascii?Q?AlyX1km1oOlNoKDhEpj3VlBaqHfj+DMFYk8gMd/PjEZrFLG1pPpz2WOSZUXt?=
 =?us-ascii?Q?lR4TyF+4eefswMKm3RHAQqZcNFqnEo6Bv+Cb/8p5LEaDt/qF/iRtg+iiiEfc?=
 =?us-ascii?Q?eY70md5mCiaDXnBZmfDyMxS0JNA+kERu2WLQ/Z1iA/nYNCiwquK+9LvKJTJE?=
 =?us-ascii?Q?ZSG6HgxMosay3Oua9+OISxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jld+eBIoMGpdq1Wt9ofkMtJ2ZsJoFgfdAwp+3vAB9DLHwNFiFSu+/62F11cv?=
 =?us-ascii?Q?IliWrX6WrsSNS7mTB5Vi/FWsuIv3V7g9a2DPIipMoSu1vqpD7+c3wJP5rvFz?=
 =?us-ascii?Q?wouOYWR1C2vqbckqE+7QepEGav2c1mIsVnsCz0o6GUUOD7O/F/hsh6SczarM?=
 =?us-ascii?Q?rV8xmwhmwXHUlKLtTWPGuG3uJm5NNGSTYhXUBx49Z4OP76QfqM0+/TZONgXz?=
 =?us-ascii?Q?8j5VtQcOwWLnjfTpgg/z6ab6vn3UyPfs63YAojX5EcNw6wiWCg7OHTqRbS00?=
 =?us-ascii?Q?u1JtfeKU9/F0oOS1bLkOTJOo6qJqfxhh3d188KHLvWxqq+aBodZoHERLRuqK?=
 =?us-ascii?Q?0L3Pb8nI3hjK4bXPLEbMIpbjsWto7NKpbE+gTsSr9oaQmbnboCe10bYtAXhv?=
 =?us-ascii?Q?XqMAWsA5nfzGqrhWWgczwQUQx+FDD6k76rkDvO0VUmM2Y2KFPC0CTl0zVLSr?=
 =?us-ascii?Q?Rr0NiPTfE78Jd68bhn0TV3b7fctEb2pMI2qLJlDARduOPvn29GN3jQptyqYZ?=
 =?us-ascii?Q?zOCo6Wro1CTQUKeoAZcTxFCurw7fbA0u46w+glPCIYuRjxXpSzIlU5gOHiE+?=
 =?us-ascii?Q?2QGNs21YlxjgiFHrsHwkY1f2rsnh6BHz3HT2WfpXkwevMe4bCKtgb3JDCOv1?=
 =?us-ascii?Q?hNrHLKikRy7yp7ypaKtS9eRsk6sAtQeofxhTFMgSpS4MrjbiLf+x61AnYsg+?=
 =?us-ascii?Q?U2FRq06BqfZvoSDQRiM6PCBEZghjLoVhUX/aa05lP17KQIJJujqkqBG9qxv0?=
 =?us-ascii?Q?VKrFCYT+WTlKqs4OZmtqxg5SVKWFdL4qFV5KEVtmA1jqyxsjCe4lquDfX70b?=
 =?us-ascii?Q?/Zfzi9QqyPE4GD6gJlTa3iKRnAv7QbUsmkYNxUNeH5fMLnluanZlFZ9160E+?=
 =?us-ascii?Q?ng5HehiirI9s0T+594rVYbrXcduFjyhhYRW9ibyY8nQLwt1rxK0REAz9n4P1?=
 =?us-ascii?Q?X2hJZPb0DaFgqezGyET12RPIQZrB2u6kmJKFeyMlEKHHTGExDLKJ+ESlP9d1?=
 =?us-ascii?Q?h3zmtbi5nYSb14KVfekdY3sqOHLdaflQc712LmhGdyoUyc9YDS4ebfe7dBDw?=
 =?us-ascii?Q?81JDtdP/BdW2iTGej4MMHcqX0aEMmK/Hy8U1GAqvgrqeXwURoVHrGcgRQUvL?=
 =?us-ascii?Q?+7rBApzVq75++xgzcTcGS7BcpnQZac2YJ25ShgWl4HIo+ClRFx1a+zlN6I7Q?=
 =?us-ascii?Q?aGo4JxDAjy6L5BLnJbUoMMS3gm1NydCkm13r/+ztU/k5Ae2elyodYmPuS+M0?=
 =?us-ascii?Q?ZXUC582SP9fBcw2V2XvehN1j9KxMPgCUcW0OkPOip4Q0/ZdyFZcGIQuBNpyo?=
 =?us-ascii?Q?Qrc11nP7jPH598/J+rCd+nPgXO1YJQms5GMFiq7dtu4SRiynZJf9JwQ8AM2e?=
 =?us-ascii?Q?vfpvCRO8SZt7O2UgdQ44VQhbIHJNn7kVTqH24l5I//guuZoBeABnFpBYf+aJ?=
 =?us-ascii?Q?U9pgyHj1vG2Sxr0PSJfutsCGO9UFCHHLECA/9GstDACkFI6C0Yc4xpKVtHEu?=
 =?us-ascii?Q?IZsjghpb582VKvIAX0ee734AbK+Hv0PLK7FsaHgZOgbeiF3i7E34F//BSzv2?=
 =?us-ascii?Q?iANwaTXBWGg1YWoBcBTNa+syRTtozlWXcDl6U5dvQP/dcdIkV5iHDQuC8v/m?=
 =?us-ascii?Q?XUCys1g0CLk7cRt8aD/evw/YVFaw2i77Z7F52YT0q3UigWX12mhmgTzL+XTB?=
 =?us-ascii?Q?8UVU1iYYnjzeS0CG/4ZnhSaXCRrDLqPCEhFPkjx+38bexxlUoVtvqMJuf64v?=
 =?us-ascii?Q?gCyiVVsqwg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fe0ae3-27b0-4d0a-7ca1-08de67a0162f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:57:20.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAj+R3uMS7ztgQS8NfjzdLWObgkpI934Cw0zKYCftulaUq77Pm2bvnJp8NDVfAzfiagcPvRnSFYDgIbZmJwc9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

Add pcie1 and pcie1-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 76 +++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e877..0df9d24cf985d 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,80 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	soc {
+		pcie1: pcie@4c380000 {
+			compatible = "fsl,imx95-pcie";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <8 0x80100000 0 0xfe00000>,
+			      <0 0x4c3e0000 0 0x10000>,
+			      <0 0x4c3c0000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "pme", "intr";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie1_ep: pcie-ep@4c380000 {
+			compatible = "fsl,imx95-pcie-ep";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <0 0x4c3e0000 0 0x1000>,
+			      <0 0x4c3a0000 0 0x1000>,
+			      <0 0x4c3c0000 0 0x4000>,
+			      <0 0x4c3f0000 0 0x10000>,
+			      <0xa 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					 <&scmi_clk IMX94_CLK_HSIOPLL>,
+					 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.37.1

