Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724683FADFC
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290028; cv=fail; b=ictqkJQCxjA4IxLx3vdqrxGrcowG3ydOPK59qORQIms/mQv53y3895E+L/TjyX2BhDhK0SY66q/rVlqJQ0GYPfxRu46i5r52V074jnIzYoMsN3ku0TttQz6dDbFfWJIPmVqRxx4DzJ8j0vaGuBgEZPsLQH2zO8Fn7wVOUJ9xPWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290028; c=relaxed/simple;
	bh=svI4/L3ABCr1jiAbX1WqX5sB0UFzIxxVZR3+KxXperw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BctSIG+Kkfb4FYHFSeTQiDgKp6UAb1zElzbr4+ue70TIX7bWZbdkjsofKSHr1BjVqvEw4qQ8fjbIbU4cA1ueEPmQiplhPJS9jgfwVj5buriJcebfAAgLYsWEVVnOHcQh9C5eF0CJc7lg/TOXWq3nCUtNdLG205TiU1wFodUSRDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V31wQjVO; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V31wQjVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmrlYljW/1zMq1qMxosRU/+foo+Gk4ty0Dw6jzzGsKkPjFav5eZFkYSaLKkU+X1vAnjkoh0XrUF2jrjDEtsYiXzixLe9BEkGp/Fkc6r/lCzf+FQf2CcUxAGVjf1QGojeKTv0Rt7I+IJjjS6LpsSMeJ9kjeD8LaS0pRBmzZ4k7xQ9tpwnLmkkHdMHGu3fUn9TF1JyVLYYQqn42hWt7tQ+vj2yvfh3GvnnHFzNt9iKQMzzYWMuG75fEhz/nJLjpH8oqDMxWdZUTqar7TQthg//OtXEOUDY81g6ziL2gkpfJJTvEhj5qDRKHiY20/I7yjQ0/rtnZ127R59o1FOkrEZkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WqfnNEOMvTHbwfPXOXI2Xz89C6zu/Hc6+JSsue8o8Q=;
 b=oESTQcIzUyjMTvXoLNT5LoCUAkwhyN0mLivgbkjsXkUhxpx9oM2bbEbNrcf0YYzT5/WevOCSD8zWHX+KrbCcjTdjzAwyi4WVmg+0M2SNr5r+blN6TFiyj7qWa6bYmtwuWN99WqEGGND3SAbuEn9FALl4pmE8s6cANXK6dLZyJRDMV3771am2Yz7lOvAMfs+KHeEL40TYjIXHLwuQpme/kmVoP1rPLIK0U6IL6L0kX+iNKep98B7ITzQABK/4mMdNW0jKlRgjdiMCZBiG52vQvIiN0MvXjRVDoGmw0l3LvAITZzBQc1hmU3Y9bFO2pfsuQEI703hef6hk9TeScu7feQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WqfnNEOMvTHbwfPXOXI2Xz89C6zu/Hc6+JSsue8o8Q=;
 b=V31wQjVOamseYHs+g6TQnjwxSgtyIU9+dl2SyIdhtjUVnrqp/q7iH5IQX9tDz91Em6Glk+tE32CL/HghnrIYTSs+NHLvojkxV/sFxDIHg0CYTjuLnQ13KtCuJ5491N2YyTYz4XcousHBrnD0oWDCQDM4resXNyDhOsE15hB/Np5udFacqF44jcexvXXV76hJ+SGmCrAUR5HmdPlJcS0Fd1I1IrFs87ofU3DtPQN9p/57/2u5QtjBzGj9Z+wvotMazm8Pg9E5Sgx1jxpYTJCbvhWPJgCuVq+LwLv3d5G0WkmfY0gjQ+tesZuPqKeRaEn0bKw1x4Wtr0BsMmXh5PW1Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:07:04 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:03 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 07/11] arm64: dts: lx2162a: transition to device-specific SerDes compatible strings
Date: Fri, 17 Jul 2026 15:06:31 +0300
Message-Id: <20260717120635.2118610-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b8a5c4-6767-43a7-3968-08dee3fbe9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7plDJDKE5bz/OIxGjEQ/A8MYiVTP0it7Z4eAGRPEtzGLIuW37yYZnhsHxbN7aUhefQSpQUeHgmmPD4+pHHtuIgy5C3wRwRn0Sej444wHK5d6uifKcvJVym4q4oExqWttkUN+eMbPHe5HKLG7w6N3Mh/jdupnOzR2hRolb3+tCTIuTN7/coEHUQAcOK1wpGhjsaLW1ivrwOxv7izXhTNdPt1qRi/7jwSAqC9oX2v2lxXwNts0vLGrAPzTO+3ICkWyEzR5fdlpO6sTzby5RVSTp6EYkShlaZf5iKUr6Ui7wMflvv69jHhh7yixd+mamSCJQVMz/gnq7H7KJqdZJI+Ov732UEIMwn1Utp7/XTHJkyVl2fGKyM1W9fz1RarxHaZ9uwUA3co5NwYdWbM9pfDemnURoKo4YuRonG3Kq58efw0m2DMEYE6yIQ090NY4vYq4ErHMhAmThKtCAaxN51QGZ2FWwi0NsZsvpF3J2fsi4wSS8dOfVcwfjfw2FpK1o28faIphRXgfsoGihSnAT5xOl8r3RGDOE+kllSgknbSl0QPwZyaTBCfvUI+hU/ebJRZHDz2DYnhEsMRpVpDvGy3C1JNAwfIO5VDfN3prl1tX9ZbnPhwCAKb6Zf3snqmLSEi+bKISCZ8H6OZXXoDg+pWIUjwf1BGCCiKYENq5L5lpSqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zewgepFotpwChI37fWcGSPLgJio+CQHBz+72vZibjEmBdnDSw7D6I7amhrME?=
 =?us-ascii?Q?gEjQihdol6fZV/Fe1g5Kh4/a90LyZoXEhUujZgdfonxAftwzxCV81Mvx5t+g?=
 =?us-ascii?Q?QID+/cKltrFgC2k5NaYdpv7RZQ6H3XgpBt3+m03fJFzGg3uq2jwWq5Oh6wQG?=
 =?us-ascii?Q?tms+CrtDMRqnAQ/+ELjZp7dY4DrqIZLDsCf/T0OVS+Nhqf9ypQ0lLqUuaDU/?=
 =?us-ascii?Q?sCARHGvnnPLgUe8JeChFtOjvquPUJArxMdy2HQhweqf0JnAH5ehdrczgYdgS?=
 =?us-ascii?Q?a7GlDFY5OWIlZ0BXOWIyWx9SUaoRgW16uJ173E/SGz4c4aSOSw9eu0i+yU66?=
 =?us-ascii?Q?0GhUe+K/ExW1JQo75M3uOLWst18+N8DiEZAYZtLAiVekwSH9Qyw+73/uELeS?=
 =?us-ascii?Q?1XcNS53r+R/QenyNlcffOkurvEg3g1Taa0GT073OrQP3JyyPLROeXWYw+NM8?=
 =?us-ascii?Q?jZzWsyvVScAkwJsFy1qNBnNDFB5G4IgvMX0xHGNiZwiLPKYjuuFwlXWUo1t0?=
 =?us-ascii?Q?ivgXxd+p9hI2Ni7r1acBWKmIymVj+Z9+TchOgZSAnNKTuWt4jDy48s1ZmXH6?=
 =?us-ascii?Q?kBofsliXWVYcQcdVcM4iHlmpIoFoZ+4ivz3HnrNuq0I6nUkjz0QJgQAgnPKr?=
 =?us-ascii?Q?bsfJtlKbRdBcVVdcjvAf0oNU43Ki4Ako4O0qQ0iJts9azzJbaOSDdjnvWOzP?=
 =?us-ascii?Q?Bxz73AG/Qx5jAWqK0KZ07X4vJudhdYvnM7/vJ8Yhv3ZEQcUDF+IuCGWoUSrG?=
 =?us-ascii?Q?BF+C0S8WEM8zu1YNQU9f7wWl0lm2bFAvZY+l3d/sTmbFdJ7tfT4ev19wZ7/s?=
 =?us-ascii?Q?64I40wPGaRqUvRhZSnU52EFJhrd0JmzvGY6mQL7qmH/XIPbTydxGgI+o+GvA?=
 =?us-ascii?Q?XV+FXnYMQb4KXXMR8eWepSyX2fnrNt/5YccHf3o5Ec6k0O+6vtYaDUcULNur?=
 =?us-ascii?Q?5PfLsDB2YEno5JFBrn1sGa0bMzzDQQm/CxoVexIds473wcFHoU04eVqM1W8D?=
 =?us-ascii?Q?ioSYMoy1SDGZ1z13+FoW2EMcHkR4XcSaYk02saBtjZQrdN4s6Yfo50NH6MX0?=
 =?us-ascii?Q?CILGFQW9F7aoiHOTbOcbKMP3IN+8g8GVbJBi5AelQBViMeF4WKqz+tbp3AqJ?=
 =?us-ascii?Q?COXvG/aIv2GChmNSHEBzQ1YZz7o8OJDm0KcDPlJB3Cw1jIwHBshaW54foAFZ?=
 =?us-ascii?Q?UaPOl/38ycU8E83d3Jlff1j+Ag1IyROLjLaVuPgqEbtKaRM84fKMesZnwlnq?=
 =?us-ascii?Q?Dj3SfRA5PcW9nMgPvKsuuANXv1Rz6OaOmyn/naCkPQVUC+z3bHGG0bHGDobm?=
 =?us-ascii?Q?Z59iswJyJv3BEryffW0vfl7PEVj2wA6+KpQdAQBU7VjN5Msd/Wgu9bBgd21c?=
 =?us-ascii?Q?J/U8vS6nXF8O1E99K5lQQE/xrlrbCK+oZLCsw+91ZQsp5rB8/ChyAm/2voT3?=
 =?us-ascii?Q?vgv5TqOwc7V7mKVO7V7i3kwssBtChIyNS9WZ5v15NJDoTBE4Q+yj9awJIkoA?=
 =?us-ascii?Q?BcdyPJmRVXCKdSxZb2ucfWc8gFI9n5qKsCz8OTUgDW9EYjwVbN3hIZiiTSA9?=
 =?us-ascii?Q?wmhbka+UTLx/YOf07o5nXIxg8cdcjXq/kAhAOvF75amafMKwWPTmiUyrt+6G?=
 =?us-ascii?Q?IseKn722TvWMZI4Qlmfi2DBqDCWuKz+ktej+B/E7hsfi4NvhfOTotp4SCKgh?=
 =?us-ascii?Q?2mik6fohCWrNUbMe7Tb9cj6qzDGWqrwUCH1m9wGQVjPmHxSDdDpmNIEDmJOT?=
 =?us-ascii?Q?JGTKkrWCHg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b8a5c4-6767-43a7-3968-08dee3fbe9d8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:03.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzJHZKvUPg3QBwXprwHmYfY2uEW2rIApSGfiBIsarctiyHI6+qw5BwBn0AgQdBH1aRU31NW8mlRa4078IrpKSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

Align to the modern fsl,lynx-28g.yaml binding for the LX2162A SoC, where
the SoC and SerDes instance is present in the compatible string, to
allow reliable per-lane capability detection and per-lane customization
of electrical properties.

Since one of the major differences between LX2162A and LX2160A is the
SerDes, add the necessary nodes to its own fsl-lx2162a-serdes.dtsi file.

Also mark the serdes_1 node as disabled by default since any dts using
it enables it explicitly now.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- New patch
---
 .../dts/freescale/fsl-lx2162a-serdes.dtsi     | 69 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
index 23f05a138eac..1ab18f0c67c2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
@@ -7,15 +7,80 @@
 
 &soc {
 	serdes_1: phy@1ea0000 {
-		compatible = "fsl,lynx-28g";
+		compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
 		reg = <0x0 0x1ea0000 0x0 0x1e30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#phy-cells = <1>;
+		status = "disabled";
+
+		serdes_1_lane_e: phy@4 {
+			reg = <4>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_f: phy@5 {
+			reg = <5>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_g: phy@6 {
+			reg = <6>;
+			#phy-cells = <0>;
+		};
+
+		serdes_1_lane_h: phy@7 {
+			reg = <7>;
+			#phy-cells = <0>;
+		};
 	};
 
 	serdes_2: phy@1eb0000 {
-		compatible = "fsl,lynx-28g";
+		compatible = "fsl,lx2162a-serdes2", "fsl,lynx-28g";
 		reg = <0x0 0x1eb0000 0x0 0x1e30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#phy-cells = <1>;
 		status = "disabled";
+
+		serdes_2_lane_a: phy@0 {
+			reg = <0>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_b: phy@1 {
+			reg = <1>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_c: phy@2 {
+			reg = <2>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_d: phy@3 {
+			reg = <3>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_e: phy@4 {
+			reg = <4>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_f: phy@5 {
+			reg = <5>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_g: phy@6 {
+			reg = <6>;
+			#phy-cells = <0>;
+		};
+
+		serdes_2_lane_h: phy@7 {
+			reg = <7>;
+			#phy-cells = <0>;
+		};
 	};
 };
-- 
2.25.1

