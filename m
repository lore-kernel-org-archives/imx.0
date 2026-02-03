Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584A3A9606
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128557; cv=fail; b=XNl8QkFba9wPpgaknzZMCspRm/3FnS4Vl25ecsiWYOV+7cRLMgLyqYdJO2GEHYc2jcQjFPttPfx1Hv+aozshhUO5Rz6SXXQ9Qt16DODt6ul0M15QcFzPinUqWBU5C6U8IQwrYkQxOcGBewXfpntnRLc+RT8XyJvXrYl/fJMm3jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128557; c=relaxed/simple;
	bh=N1v2GBSt8BLzpJR8faLcIKqXg3jOc9pHxqIFJoEvNoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KuLmfxqr5fl3MyVTbyoIclRQ9BkFqlFNo9I2p0NM1UEnSvSkROfNZbnxzYryx3fZjbJm7Cctq0riNfhKsJ+vJo0eI+v0sTtEjJY/nKIvcyso+2/iPY6fC624B9kYXmgporHA0SRRymX/30y4gzxlG68u3tdLXEic8USs/PLO6wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=G7/tU0hZ; arc=fail smtp.client-ip=52.101.83.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="G7/tU0hZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtjCeY3d82el4iQLfbbvtBs1qhVYxZLFRpZXe/RGnltMS6ZK9rdlZsBIk4U4SLaXFaU/S+DpLljUvEdz5DnwClerYJ+m1xJOBpPX++K+vdZ/MsdZhNgOAsuFlTOoeO3HjT7wRJp8AhWb5W4ei+Q5GUF3ttVjXfqapG9vvvK8yMCvLmLlbeXQbC+n/t7aeglYe8V8N/n4LTTf21Qklj7cMwpCfxLBstxlGpqRfeyqIunXaZNAGidJSqXqsT5f2YVLccMPVAyvMcOrxBVPHuHiL0hHsVxCJhYZlWR916gSZs4LUJWQDQa1qxmhyLWKzrnnTlXzTDp0sq7zJ4WJqUtSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LAyPmO+VzQkVLEDy1YMMHHGNzE7ifB/R8XYQ60wPvQ=;
 b=NNQ4lEH14aGfk6SUtsTQbxiGZdbPrywwXU2BYtEiyuol4LNj0v+w/ICJd+3L9uxfY+ZdyqbXkA0zd8GJYlHN2jDCSpuevSm8o8Hy5yrcCOIYm2MqEiFday27Ti8teTFW4yTOVSMQg4vq2F4FGym3mms0EazLT8kwBcSw5aPEKsc5pyBsrJXQC/2PDBKTbEMrHH+9Yn5efmCWkpjwmHQj+HFZh0E9sEbcFU3ZtFbcco66uFdg5mxwhljqEE1sT7kYqDYm+4DFx6AhuL/D8fStpaSn4fhzBI4bOeC67aLfwoeEJWYbMb79jzlFUVJKEc5iXjOQeQ4JdDeq7ZzS7NVLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LAyPmO+VzQkVLEDy1YMMHHGNzE7ifB/R8XYQ60wPvQ=;
 b=G7/tU0hZIbZdsdHKlp9uLUS0vuaHY3ElTYZTquiHR71VFPZqbuorzqiaAPUswNzSuoKzMJTqzJ3sBSa1uqkaB/Bz1pcPwZHxAJTWuZjRGicfCXIBdtr7o/FKlzVkIhatiZI90MwF6wVD6XlkH23G51SV1XR0CwGDU9FN+9IFwAY=
Received: from AS9PR05CA0123.eurprd05.prod.outlook.com (2603:10a6:20b:497::13)
 by PAWPR06MB8742.eurprd06.prod.outlook.com (2603:10a6:102:37f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:22:30 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:497:cafe::22) by AS9PR05CA0123.outlook.office365.com
 (2603:10a6:20b:497::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:22:27 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 3 Feb 2026 15:22:27 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-evk: share usdhc3 setup
Date: Tue,  3 Feb 2026 14:21:58 +0000
Message-ID: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Feb 2026 14:22:27.0767 (UTC) FILETIME=[86355C70:01DC9518]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|PAWPR06MB8742:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3d827433-6c7e-42a7-cb42-08de632fa8cf
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rsO8hVrrqpPSA0tfjLKk4fNDULnY+IptU6R/ZVOhFMb8bpBRBdFhUcHz7exS?=
 =?us-ascii?Q?vGVTIA/XT8XD+VoY46BmMs9cQBREvjYFmos8+0bjY9la/ZTNEKXCotoDQddC?=
 =?us-ascii?Q?E3tMvXGVm53Q3sMy/fpTebP7fdkAIGDaZsC8O009mx9sk1+AYcMVPlzlBOa9?=
 =?us-ascii?Q?5axgZttIDzUezGAc505Ht2ZGa/jUHKroyeabcQOZq7gINzEqHKU3xzZCX6w2?=
 =?us-ascii?Q?GYzfyNTRSbR2R+LvFMD3P2Wyg6V7LK771l9RvbCd63L6dUgqj8zI95mLMiSe?=
 =?us-ascii?Q?26+tesFcANSpawFrFuufHd8DTefMCQlQeAoTGx4w0NO8gqVkLdEySBGqHSxU?=
 =?us-ascii?Q?tJqrUIbaFXpKELSBkh60xYAlnl4zKpacU55uXUgvlMxK5IEKYQnGyhhjSRrB?=
 =?us-ascii?Q?7GHW1aAw7zlTO6+naxpKxKBwU+pTVKS/xizT6hmvD4v9aYlRRsz3pnBalIER?=
 =?us-ascii?Q?khEK9CzLmODcwhIf4MW3UvHb+FhxOWhAHhZjVteWKL/TGeLr8AU+mmDmZpd0?=
 =?us-ascii?Q?xMSVrNTWJc4O7zYreYwoyavhLIZi5x/YO6+epgzMLzyt0y7xjadkUEBZs3F6?=
 =?us-ascii?Q?poHmnn5QoxyGlt1dH4MWaUUHMNqoSeD8VX9M2kiBHmlaaBoEJgJdBuIS50Kz?=
 =?us-ascii?Q?mfxUdqdQ+f2xhKPDzmZa4e77njOP9nq5hIsXGjOc6nK/iezBKiMvPj/cXVCh?=
 =?us-ascii?Q?WttvRO7bip2AG4vxkKvKVvS3NckU5cRUu9u1iATsOnfzkx3oNJJKGET4WaxR?=
 =?us-ascii?Q?41JN+RbnQ3niICAs6TB9UvFLchsPSx9PaXE0Cx0r5Tu4Tkh4FoYv9dIc/4Fc?=
 =?us-ascii?Q?HTfPctrzK8UxVefMTFWvZJFPtd2m4a4+HwOjByK6xp+61Eqd6q+h9kvZoMJg?=
 =?us-ascii?Q?hKoOWsYzG4UCoq+zoURzmK/L9an+pwGhQHs+cLBQz69nVZjyCB4r0DizwlRv?=
 =?us-ascii?Q?VDXw+wyXgqHdavpV+c6l8X+bgwoMYnTjF0Ho3DqR+pIwobwQYtYcOUI5aUDl?=
 =?us-ascii?Q?n6A9A70o1BsS6xSJXISshAmgpvWYdLXmdTxn05L4qXUN1vBgw9aLV1wzdyKe?=
 =?us-ascii?Q?xSoBSNqkilR8BIlQyMxKHPvkwsMQdPrZ9anhnsiVed8eQ3GBbRTn4hi8Olho?=
 =?us-ascii?Q?F/pcc7mpw8kMpfCM7tzuwXBkASMMkFIFzqy4tyWSTLOUz983///1IDKbVGvW?=
 =?us-ascii?Q?7ITZo3PlLGRa9qPs3f0629jhd1qzXlTtYKxtrmgnkr/vv2GX+5MaQr8Iu5Vm?=
 =?us-ascii?Q?QhtBs2EVrwmhQQ13fOAmdHq67TveWjzyCRdQXI/xGu6z1DqoKIS9cxCRSKE+?=
 =?us-ascii?Q?q61pXdSXc8UAdXYoQ63YY1eh++7nSZfvpiBY13/fxUuX0OvELPR2KJ5Ha6kJ?=
 =?us-ascii?Q?yk0QDNy2mrhwUq1eAgHDTebc/2pQ0Dqtvw0GKkX3eu2E7MJV2PX3jMa5ayF3?=
 =?us-ascii?Q?VR1rb3ttSGxEZZKU8HfuFD2ya/R0LZLvOX7qsBTMtxz94YWmOMq9wuDsltkB?=
 =?us-ascii?Q?VLMJtAx39db8lIuZwqdBweww04a/5Je/OHaRT+qjYrG8zr3PJYyqC/DpprMB?=
 =?us-ascii?Q?RdCR5IBanJP1X778KxZdRYQ4QTxrVs4tB2xJSbAxbHJGmjWIaPEg4l5Y5FqX?=
 =?us-ascii?Q?SJwldWl/D9Gvu7bVP10DWe1B0DaOSj1UHvbOTZmSnHQv8ZEQnrxvF/9m2TOQ?=
 =?us-ascii?Q?WEagKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PYMGFwBRnRPHixZ7RehaIQSCHjliBSrU3iyUW+K57FECTNSgYIYiQcZUNBwThf5o3yDNTkEs6krtMFTQ0uWWiUNMej+FfYuM2bYopSRbeT05NJetQW9zN3xDfssQviqZoCt31p7URhLMySOLmXK/nydhEauWiKPqDWVOdH3/jx0U4/zkVTsUlvpwH0Wmr+F0u5wtBNLBH05eZ04g9TKidKEb1DpSWkBoja54hHqg0vdbYryJlEUonHhzY1MprX2UF9rLPzXw1N9VKcNzPrUrLGJIlClDS5BbgiOJQNU51XJK1MXqK4JNyOIb+7VS7VM69Jha86Ludu5VEm1Qt7Xg90Pi00OBq0MSiaebl+Nz5QEk+GpkrKy0sFq+4Qw2vo4uERpRVGvKh3KLebZie3oF0RF3zc202/7Utdjj3rYWGzufKdPOvh9yFCfSQ4NgeXw0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:22:27.9509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d827433-6c7e-42a7-cb42-08de632fa8cf
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8742

The eMMC controller on EVK and EVKB uses the same usdhc3
configuration and pinmux. Move the common node and pinctrl groups
into imx8mm-evk.dtsi so both boards inherit the shared setup and
avoid duplication in the board DTS files.

Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---
v1: submitted

 arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 61 -------------------
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index b68954bcc383..002ebdeeb2d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -53,18 +53,6 @@ flash@0 {
 	};
 };
 
-&usdhc3 {
-	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
-	assigned-clock-rates = <400000000>;
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc3>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
 &iomuxc {
 	pinctrl_flexspi: flexspigrp {
 		fsl,pins = <
@@ -76,53 +64,4 @@ MX8MM_IOMUXC_NAND_DATA02_QSPI_A_DATA2           0x82
 			MX8MM_IOMUXC_NAND_DATA03_QSPI_A_DATA3           0x82
 		>;
 	};
-
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
-		>;
-	};
-
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
-		>;
-	};
-
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
-		>;
-	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001db..6e53828b5d30 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -649,6 +649,18 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &wdog1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -839,6 +851,55 @@ MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
-- 
2.43.0

