Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B493A48A2D3
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911510; cv=fail; b=RH0xa+31b7FUeXvGLWX2QcAtnRcje72F+sSgsEOYPq2aayuUk760QiLmnOztu/jG6a3LEV8WlS3Ie3rkUy/O8GGH5lWZH1eMou/Mpxp2eZwriyhGkk0cM0hZnxnGp0P/mDpcYuVVDrOrpGBlj/NsgT5bUG9nni13scXMnu72z1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911510; c=relaxed/simple;
	bh=6wNqV2nJ/QVaB9U10h/knTb6xArKeaUxg0E1TBcb6nE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdNdJg5GBpqkfJa1Xw8qiGHKi2f3IbN7gJ1dwSHH6tPXfC1a4sSHyUcA1UROT/U8hIBAfAYp9gU5KXWyrJ0+ABYG73ZfODz3ieU8D27wcscZm/uE5swiM7yitOr02spoDV+0l0O1g+eG4Tpf3GRP1VrIr+MlWqvKavHzPdGCUug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NVlMGt1r; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NVlMGt1r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM9FSUdjWsiXvoY0GNOcpcutCuswdlakhOeeSgBsjWdjX5SyFgYHYRCSsd64/IMIFsnWfAaRtWrWxzzzzrQGWBs4ZCZaLux2iMSG2PiF4gxccQtaargh3lZrK9TVz5/LsBHogisThzfrCmeGfIemV13c0q19yK6Vc+Iianmiugl9jS7BiE3xhC4kpx0qPzuQcofI26Kzj3qOBTloO3r3d87557XM7jw+0iIPuLHhl81Mh0jOKvqEBObZnWnDVXXlI/twWPkcxd1eKklHcPrr7xm8VJWig8D4v6qD6/BIkustbBv0RerPNsihiiUQ/otaB0Y6q1ypSJ/Tb4kAmvyg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxzSYbLAWa7sB511wDR+H6NbYgI3+8P3XKKXHSC7v4Q=;
 b=VCr2dJLbYicESXEc2/+cnwvbHph35o4PAO4c4bNMDur6RsVjPiRnJZ9B+2z2zHr+zcB/axx4FbjiiPBIp41LYsaY9gKHBMTxcP/4g+YU0gh1PwIna/0GA6Z5zeOF+DzNUz04yduMI+tQTBkX7HYLbFYblIObp/dF91C9qy93fRlcznypPn4fMbl82uVCWlkjMU9zcgS85ecsSz27Vqpf/Q46L/Eb4a7hnnsa1caYkTnXHwQ24P1ttwlX1ylRRLaW0CHFyKK4lY85nca97pBG+cjHYBkRHxuWcddoag0yFXrQndtct0wf2reFWGdqabPxBUzo22RrVcpADgpaW/zf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxzSYbLAWa7sB511wDR+H6NbYgI3+8P3XKKXHSC7v4Q=;
 b=NVlMGt1r7ReuCaJvXFCIp0iUQvetyn6x/qcL9H7ivtV92f1J2e32YUgY2uAGzUi9HVn3nweJ+Lkmi3pPB2JUXk2i00Sh4PLsC3rmjLVvAfNFnxJS2d/PdN1EKAPlBuP+/li+AEUW+lpltGGmIIWgNg0c3KO5UO1bh6BAnt4IhyWBdt3onRySj8gdvs31SrPBtMHrOhPl9YQHc9VuIOYz4dawJY7JZ0K5umfZ+k8oURadlowFUfXiv2kgYOr4UsgTPMqlw3A1lxA538m62tKl9IPLEMKeXFLGWJhKmQTf1Aw1OaFpyJKb4hNDdBhp+Aqyjk3jy9XmMQD1EkVpR0N1Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AS5PR04MB10059.eurprd04.prod.outlook.com
 (2603:10a6:20b:680::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:46 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:46 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/5] arm64: dts: lx2160a: transition to device-specific SerDes compatible strings
Date: Wed,  1 Jul 2026 16:11:33 +0300
Message-Id: <20260701131137.940145-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::26) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: a48db14b-6ad7-4dfd-69ef-08ded7724dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LZDDgS2Ysd+Wj+qC49R06QeMhsTyLIXykf7cf2dQ7eqjOICBCERzLr+L/nly+lEjDhJ0j2wgJ2iFIBAIF8tNJ/5tfBHvFp+/7pvH8HFHdIa+bcvYyASMNTL6038Q2QBWXkq9lB12/BBLpMNpYsG7UywQtTCIY3i9CZdBG4w5qM+B04wEbhP1HsA7UcKPDeXy79g4NkxUz5F3jhjUbcG70tfDDnT62IbQ4/uIken1K0s6uD6W6DQy1tvGxcB0EZL0JjaozF0S74KhEnSMg/LanrTrw1re84oGcNxLqHQ7dTrAizD02wf7XR/zqha2hC1Qo5rCXOPMxHHLP8gLQNGmqU1Qp6Qbr7A4GWqDv+o/sPuMZV5/aNa2gVNyeNBO5xKu80E5ecfn1nIT6A6n2SUVc3vtkzWzbDGQmHK3P7srzUc4+WJnZHAgVhcenR5eYPAklvcCsCW4SbHFDuSarqY0XcmEqW2r6rLpBuaeNUypmkwC+RaeqjSpwW5MhnovN8bzLvvDeTdZlzMovQU3xwAXC5/CnBzmyoJ2QPpY4hYTsHqTFwniOJzHMbCZ43PTdGFq81D/27aTV24TbdDRxtYvxcHAeIgWjeUn8zsR4/LK6k5WDTuHdBDvIhGwOtUzFp6jPQs+jlQkOQRQASBBVHf0w7Co9fOhqHdOSXgkLN1dtko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?puyzKozCeo4kSWXH5ceLdRK8qnKsBIJwmUPyVACzh4MFOvThaAh5Ir5X2PvY?=
 =?us-ascii?Q?zOpQ3TLs7V19Ez8OjoSFo5r5E6hfuIw1VXCEcsuwxDsXPA8+V5B6VqLXBjqZ?=
 =?us-ascii?Q?HIahvk2+3wUjdyVLScsHzuWrQGg+GW84H8CD81X4HQ/NJTEAmrMn42tETVjw?=
 =?us-ascii?Q?bNzIQaedQPG/pam4/GzS33cMKICLwQLZipI2+rXfcjkZ1678+7/9jugmd032?=
 =?us-ascii?Q?zqTo7nU+LaVGQcpa4Ns7I7zpnAtBqDel8+A2Lrnlhzo+EUDbtAUvexANcqSH?=
 =?us-ascii?Q?OkAbf0tKv/BBAxEunizKcfZRD/201zrB/SGmxG8gD5p6vrVfbZkMyyi2TQ3D?=
 =?us-ascii?Q?+ZesaMU4euzGW6mroTxB4tNSGcu0oVvAYF/A4oXhCzOAW6BcetkowZ2NNiI0?=
 =?us-ascii?Q?3pX8Gh7F6X0ftJfCTB/HC284ItUUj3kyGSxLeBNkLSA7qLGJJg1gYjmu3L+C?=
 =?us-ascii?Q?CNkmt5+Z0i+6iy2wNKudKY/cB2fetKbmEU095vXrYEZLl7nEtbNIzQJ7cBgn?=
 =?us-ascii?Q?xrq7Pab7UKvF5uFywNDij/RpSYfvFpNlOE8GCZ5Xi2LV+xnRkbfv1V8kJDKf?=
 =?us-ascii?Q?wLNe9qPw9p21F4JZfwQPWo/gEopoLvH0aiKSeJpHrZ+R3lWVa6wP6dMu1joa?=
 =?us-ascii?Q?dlX2kXpjMjjAI90SODkQNIYVJI9Umy+Qcx65obh69p7V0hyjzPWfua7LX4Z1?=
 =?us-ascii?Q?H3cdU4oLOf8UTvBMLIqjs4sIu+4pcZo+qv8Dn4PAR+i4O09WQbdhBpCU8BWa?=
 =?us-ascii?Q?WSGRHtW4bZHAA4OT1pKTJMMkCZs0WAKsHN6vCWxjKDfWxkBBE/7tW6A/6Ovi?=
 =?us-ascii?Q?UMwQY0goGd7/T/2y8vN02D6idQG9//PSg2W4yhiOhOIFGg9wl4Qyasb8No1j?=
 =?us-ascii?Q?8NrBRwamxDsh2z5FpxGMaFUjw4HNSyR8ZLUpCIcF8tFZ8NcG6D2QFRk3ksuA?=
 =?us-ascii?Q?3fL+2NGNTiF8nfb/uwSQ4h1HmEZwIOUy1dHgSvP73tOeI2rSogNR0Tc+kL9D?=
 =?us-ascii?Q?j3q6yr22FZhNgIf7RkoExjUEbZKKvf+uqtjsdaaa/0DxFAtMcELMEkjxiSqr?=
 =?us-ascii?Q?gfYEXoDZDOU0vnTpsbwq+JFKxtFDytWC+04s/RMrCVjF5CFqlP339C8k+wv8?=
 =?us-ascii?Q?qojlUTINNhH0P+5gJJZ3YlzV58FliNBFsdsHhCtiW0+UuKKkgvAfBVFXB3r5?=
 =?us-ascii?Q?HLgR2U8czQx0ZhukJqz70ypEFLym3tN6INVWuFBCsvPnI2G3h4Y6fbxJG64Z?=
 =?us-ascii?Q?0npetCw/y6lwC8VOZ+7ctHX3ErJ9359HeVxEL1txP1eU+p2YQ/7qvBn6gjTs?=
 =?us-ascii?Q?J3XfOVsjxt3NVZMzdzBRIzSOmxVdtYsvTqCQNxjTk3f5spImd8XLaT4+iQkB?=
 =?us-ascii?Q?01hxeMY3zN/KFpAigUDHCdhk7sbjj5yVdgaiR5oFaHVjZH6qkm0fHHNci+q/?=
 =?us-ascii?Q?r9GM5H4gf/gocAcI6EHFG0+N7QmxOlVNifThcu91ZY+M7smCe2pfE7F/OtF8?=
 =?us-ascii?Q?EZH/5SaIGwcLkccZ7J71R4Eg+fwPn3dAEBs6E6oSIDSY92ibo9TU/3UECb2K?=
 =?us-ascii?Q?UHm0r9AegYCvvNHDz2CMH3SAcCozFVYie3jLN4BMWF5LoNQamcz1eMDjYYDJ?=
 =?us-ascii?Q?/3q2z7zm61088pPIA9ApAPIGJ+corZY+kYrMol73fzSh4XVuRmfq7b5l4ESs?=
 =?us-ascii?Q?s+afidxB+exC2AW/y3fz+C0+mQohKpxT3jnaQQlkPjVDbeTNE+X+3hvPN/6n?=
 =?us-ascii?Q?37jMttzloQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48db14b-6ad7-4dfd-69ef-08ded7724dd7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:46.7007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEVcjtSdFM6XayQ1hDcRvmuYbYimSGuhNQj146d4C7ZbPG0ytaA7JQmm/eFYUmj0uaZxF+Sw7CzoipGNvB5s4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Align to the modern fsl,lynx-28g.yaml binding, where the SoC and SerDes
instance is present in the compatible string, to allow reliable per-lane
capability detection and per-lane customization of electrical properties.

The modern bindings are backward-incompatible with old kernels, due
to the consumer phandles being either in one form or in another, as
explained here:
https://lore.kernel.org/lkml/20250930140735.mvo3jii7wgmzh2bs@skbuf/

One of the major differences between the LX2160A and LX2162A is the
SerDes. So far, LX2162A has used fsl-lx2160a-rev2.dtsi, but we need to
split that up even further, and derive a fsl-lx2162a.dtsi which
overrides the SerDes properties.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Enable serdes_1 on all board DTs that has consumers for it.
- Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
- Remove paragraph from commit message which mentioned some consumer
changes that are no longer needed nor part of the commit.
---
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
 .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
 7 files changed, 190 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 4bc151d721dd..1f946d3a4ec0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -135,6 +135,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
index d16e27307275..954b9955b1b3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -805,6 +805,10 @@ &rgmii_phy1 {
 	status = "disabled";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 935f421475ac..a40a968b9533 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -329,6 +329,10 @@ &uart0 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d73abffa6b7..a687eb3e3190 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -621,17 +621,163 @@ soc: soc {
 		ranges;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
 
+		/* Note on the interpretation of SerDes lane numbering from
+		 * LX2160ARM lane mappings for RCW[SRDS_PRTCL_S1]:
+		 * The letters (A-H) correspond to logical lane numbers in the
+		 * SerDes register map (lane A's registers start with LNAGCR0),
+		 * while the numbers (0-7) correspond to physical lanes as
+		 * routed to pins.  SerDes block #1 is flipped in the LX2160A
+		 * floorplan (logical lane A goes to physical lane 7's pins),
+		 * while SerDes blocks #2 and #3 are not.  The lanes below are
+		 * listed right to left when looking at that table.
+		 * Both the numbers and the letters are according to the logical
+		 * numbering scheme, and do not account for the flipping.
+		 */
 		serdes_1: phy@1ea0000 {
-			compatible = "fsl,lynx-28g";
+			compatible = "fsl,lx2160a-serdes1", "fsl,lynx-28g";
 			reg = <0x0 0x1ea0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
 		};
 
 		serdes_2: phy@1eb0000 {
-			compatible = "fsl,lynx-28g";
+			compatible = "fsl,lx2160a-serdes2", "fsl,lynx-28g";
 			reg = <0x0 0x1eb0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			#phy-cells = <1>;
 			status = "disabled";
+
+			serdes_2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes_3: phy@1ec0000 {
+			compatible = "fsl,lx2160a-serdes3";
+			reg = <0x0 0x1ec0000 0x0 0x1e30>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+			#phy-cells = <1>;
+
+			serdes_3_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes_3_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
 		};
 
 		crypto: crypto@8000000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 99ee2b1c0f13..63f161610caa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -8,7 +8,7 @@
 
 #include <dt-bindings/leds/common.h>
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {
@@ -367,6 +367,10 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 7a595fddc027..0ba56b9819ac 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2162a.dtsi"
 
 / {
 	model = "NXP Layerscape LX2162AQDS";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
new file mode 100644
index 000000000000..0e92ac6acd92
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree Include file for Layerscape-LX2162A family SoC.
+//
+// Copyright 2025 NXP
+
+#include "fsl-lx2160a-rev2.dtsi"
+
+&serdes_1 {
+	compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
+
+	/delete-node/ phy@0;
+	/delete-node/ phy@1;
+	/delete-node/ phy@2;
+	/delete-node/ phy@3;
+};
+
+&serdes_2 {
+	compatible = "fsl,lx2162a-serdes2", "fsl,lynx-28g";
+};
+
+&soc {
+	/delete-node/ phy@1ec0000;
+};
-- 
2.25.1

