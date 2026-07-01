Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39684A33FD
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911517; cv=fail; b=N+MiYPxN0aQpXvQQ2vwbRs45jA7DWjHkgd1lpC8Pxe2Br0feK2SszlYr5NO+jGDo498y2HeAP5r9ET+XiCc0l914j7alUTmV1uqfCnTMSaOdn0P3UxdLytVmAYeqyEqEWU9Po5Ihh6Y1NyXJY6m1cpO32okU8i3c8pLVwulzesc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911517; c=relaxed/simple;
	bh=hfV3McFMWQ4hCJFMHxm7/H9vODk+lVDA5awcEXREMjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vbos0cuP/mqMnrQZUsap3wg5a9WN5FolBs8/bi3usQsy25YdUukYyPjQewWVxc9HxRgzQUjXKjVTjhGVGCvG+1caREPaLHXp82YMzgAoEIOVRbSSpJDM1drZ1LNxtyX2PrGMg61GPzqGZ6J8EhKf6EOxKTJBZWnEJuqvcYg00gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oXD2px0c; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oXD2px0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP+JlZZ0ex75/98qgMZFwYOImAM+afT/Gfa32hu5Z7JnzznHCkkCsNkgRUL8bL5qKE6OeWuaN6js2fJfYreD06HgAxCrknqiYVl1TmBwBqtB4R1srthjhHcvMRcFvs/BnChHR8/swHSrS+9ooVYLSJv5ZJOTT/sAdUPxp+EI3GCLnoVeTuJ/tZ+ub9YGtpFwbXW+qYtVU9mWvw/w30PW9A6YAEVSYOt5Zff6Sm6nsLY8PGp5NE5Hc1OZGwIly33tznLzPu9UuYjqtr44QJixCwZNZmH+VVS4Sun2A7kETveodw5BZ2rcNqqmRDZVsjRNEl/pxa8rKj5sjuVa/USgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=;
 b=m6fbE+DhI9InLxvdWdBh21ufoMumvjzlh6IbFZGtOeOr5IlN7hDaO7vlW/G5a7pR6W2Tt3b7i7Gvl/zi5EzVLUYBE2X3rnHWLyC2fe4LTlb4X9TWkI+2VGiBYgqTu9Y828j/0ZvxcwLbE/n02/MsoGY643UOPYjzMqIVux+39WxVWZg03+pmRRvnwwoCp9wnXrKgSDatVZzpWWPpBCCKoG2G0dUZ07PrkSaENmVQ83TJB1N6j4XwyxMrS/gkdG/E0DQRsbTUqDcE8f1WN+BKGyuseRML11Ni0t7d+MjqOsS7YXSPwCj5QxB7SLLU288QTivmqXIO8udqW1ghkbUssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1G9x9vQQO4D7QGoPShDKDC25afGHQdBotJibwPYvjM=;
 b=oXD2px0c4p2qQm4YxVA1BfRAGPXcp3jEXleX8r2OBglG6eiX26LY6Xp2+RaIvPcN8M6RbyNHCapNtBJHq+0fg/OhFsBTioFSbfYTwECamdrCqIspr6mBrspk6YEJUoGbhxIGp5pd2tpifheus3EB3JDLSWM9iYiqCtXUTLa9c8FnNQvuYv/jFB/RAkdZsn0u9o8X1W256tN2aK4j5geHeA57VXuRAajCQXzCSSQ8QbHa5r7bIQj8YBx+YAOUcDstR7qCV83a9aigeLLnVTzsf28P3UQGOYm00GWlkj/KUiKVVEswRcI+sAtStSEokAOsiCAAf2uv4aJjnWdaUERbMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM9PR04MB7569.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:52 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:52 +0000
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
Subject: [PATCH v2 3/5] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Wed,  1 Jul 2026 16:11:35 +0300
Message-Id: <20260701131137.940145-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::9) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edb3c34-1eee-489d-a05a-08ded7725116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	KI8viLT6JKV1mWWJ5+3SjaDvZRXsA5AV/NZfqT4C5OAYQftYiigQJBKNmXsBTD0GKW1myyd51E4q1tneHdWOM+fbOLquau2ED92TMndWTMeh5oVO9Kx/Cl29M1uK2wJW4OhCeLAjCuKEhwFsRxPhxhNINP9vpZAP8hWC10e2TAbHViQ6b1O2QQw2n211Ut0g+Ltou+B46FhaKN+MKeC630eRpWFh+qGLGWIpEKIXfvXYCDUhHq7pzp0aRO84aEN193NWuSjSspz+UL2hzKe1JunSV01MSvK/cgICPOCJAerV7+tbEiQ/0FfSqnBAK2euVbtbSyd2r8f7xHFKBim91+beJ4p9hSCrIDABLyUt07+eZlSUfpW3VizOc3Mz7jURSbh2G1RM2NLRY8usOFQy7Oy98qU+DN4WOKHneHG/z4XUygoiSDpGH574fyykUwMVvztRN5dzy7g8tmSEktC7eoj8EO2v9xIdCNeDaa773taTfKKtxgCCdb3mHMbvz//ZhxtY7bnWKRbEJlKuHpXwbcEa+CxlrxWe98pIW9WL6iw+AWdOuyhytDiRkOGV9PS588TPaIV5HLzfPCJ4DzgLojt/DK6idrDJuV0Opd70/ouvqFsFZFCI/3NvcB5V4sPGXNkup0wAUIpnGE6T8CbrH/j9KvaiB/nFvDDxPTLnrhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6wqXjtWPy8NSbaAiBiBFwwUP1XjshvgMUCbJvICH6I3qpOtuNGAK0S4q6KIo?=
 =?us-ascii?Q?yNcNQkZyUEfKrZLZ+zAgMF/qkV6cdmN+r/QzZ7/u5GrylY1g5qcIFXTjhGup?=
 =?us-ascii?Q?/SG7UO/mJ/EDF+deMHRSIhcPzT4ah7tmIi55tr+FRMugZ/ffM2Fjn5o3dvsp?=
 =?us-ascii?Q?aAIWd2b1hjqOKSiqUv1a70iQ3K5/gze6Kd+N9VGEwZHdmHM034ccp7959wc1?=
 =?us-ascii?Q?cGSSeo0cG1TEUu9+8nCHgYkGnFG7qJUzJClbXAs3FzgmAySUd0xN8CT38h94?=
 =?us-ascii?Q?CV+Fj0mTBfAn9lLIBe+mygSNdr2oIZUzdAkqjTderp3iJ/jPVov5fVCkb2TR?=
 =?us-ascii?Q?VAmSPVkvB7qQlCofcnwW9JkaQX1DbvB4eOhyHmS/C+Vx4fhlceWgc1t2t8+C?=
 =?us-ascii?Q?gTSfwwo9mOSnjEaQTuzPFaCabfWtJ4yuSL0FpoSVIPxwztHF0bYBavqVhkYF?=
 =?us-ascii?Q?KALv6GgtMITdDpeo2grlDLez5mROpreQGhxl+8ivOfPp+WAYlosL2UFtdYl0?=
 =?us-ascii?Q?jSjZvdCposWMWkPw+9UdNYa+IUwmgob7fidOqdynIKk1GGHzJdIF/PP0zrBZ?=
 =?us-ascii?Q?jT3g9wsOqXzGsTK1nYatU/tvJ713MJZpFGxotMcAVsir4Us82lVsD1jClOKg?=
 =?us-ascii?Q?Xqz7DOm69MuYllQMyfUbC8T5CLDJ7isXH6ncxllcREmAuqbmkrmTnEk43B3S?=
 =?us-ascii?Q?fQka6vPwk+b1n02a20bCnG+x8BY4XZZzLwN75AJ0wvVQnqpzFmgB54n2d+/A?=
 =?us-ascii?Q?+vLMT4Yvm5wtyLYTfVsLKnghQji455QYdPZUdUMTeI45ERCFvk9rmqxZlTaE?=
 =?us-ascii?Q?hnoxsDCXSJnWZKmtzQvSSAodN7lkWoIV5CoPVziM13qVIjfRpMYxJcUYu3jG?=
 =?us-ascii?Q?6shYVzy7M+3HT4RMz71QY6qsQViwC5H6gNqVTNSuPKTc+Yx978EPCHIfeleH?=
 =?us-ascii?Q?vYK6Wfe6p9DlHNpouvexiHw6OhUEOcETrqVWgNNat2V0dM2ds/37zsCow8CF?=
 =?us-ascii?Q?A6s52Dsf3Vuk1fc6QrheZcbsulrfTM4CPy9Qda1jcYIVUtQVTtoo4oT96HtQ?=
 =?us-ascii?Q?F9NLYv1psrxauKD+i00FLvm2XMy3mSnnSwCCqgmkQMRywi/cGEupUdOkNLsQ?=
 =?us-ascii?Q?zDBfnHBCPtgDkdQpArgHununQPncn4n/jlm/A8LFpQZiEwvm22EllM9827MQ?=
 =?us-ascii?Q?DWcvLbyGn+oRqfmhZLor9EUygHd+YiuP/uIQhNDBRaBcp4qhacfsCkZph0Fh?=
 =?us-ascii?Q?7eyRduufcJIKvtXHKXCzD7ez9wT2cEb7P3xyACUbhaTlElxGkmlXPB5tB7mz?=
 =?us-ascii?Q?BLWBXRb26lmYG983L04K5vkpF6N0Rn2mud4NYXGXH9LW02VF7ykqU7QaXIbs?=
 =?us-ascii?Q?7T3YJdBJiTsLzJIcfN3DGMlMNX73C55OmL8NpY9AHLOKqrqvyS7hCWM2LTTK?=
 =?us-ascii?Q?xTBWtawnuVUKSzcZeemHOcX2xEVXc+g9ImzQ5R151q3bXxgl2DB9rz4Uxtlj?=
 =?us-ascii?Q?8ICIUSEKqvruV87b8QgS/DKnvVnnTjGwOEfvxXf2TJ/2BW8mpNhucfBG1WEF?=
 =?us-ascii?Q?ZVfDlxT3Kvz0M3Z1KKIc3cx8zak63Ym5N4K0RQr31My54e2XaDVlH90pU6Tj?=
 =?us-ascii?Q?KKzDn2/ut05TxuFNbAqRa6NEpWzbb7WnPwrNnf8WUgCO7qFK/qLgY05nlSll?=
 =?us-ascii?Q?bvjyp8lugk+w2SzE+j6aErlTvhQ3yY7nYPAp7g2+hY1S/xRosQKa8w/lkep0?=
 =?us-ascii?Q?FwzKPZsTIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edb3c34-1eee-489d-a05a-08ded7725116
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:52.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jwmsosr3ki2mUMwaKA9s8EnmvhEL0fMhD/4orMnx8i24jWNwg1ZX6RQ+WhL6ntd6hGtuCVwpPv72boniFBoA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..270a97711a69 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1

