Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAB45BD7F
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137234; cv=fail; b=kpu/TJhYR2217dw0KiyD1gPOuJupm/XwRTiIQ1xR3ATlkrggpU1ZDu+PtpHFlUVWRtpFC5c0OqCDQgeTmiZauui5Kbvdz7lLhYK116pyBZAvCNZog+GpD8ewcX3ax/7fM2ng1zMz76WD+H5DEf0PV3h9wcXWeJ7VjHPM/QY52m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137234; c=relaxed/simple;
	bh=62oQsAU6aaVmEfnBnEOl7Fdeo77oLTTn/Sf8jK9sgx8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bJTlCXh0GHOt3w9Zy3sU9a+u2BysPmeF9/SD0DXJTlyOQLfR1A0KDN4QgD2NluwE4DJs8OpiURlJqRyuJGQucRfv4spbL/zcvkr3NkW1bzEoQvlu4wxX2TvupOzq4g0rVH0kryIDK+OAv9plrnA1jJVr6+y/bA+jSEto6pJDfMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KaRvTKgv; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KaRvTKgv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqP445Yso+eBLea95WhuH8iEIz9Chwr1kERHmkXBJZHwK7G3x/zWufhCdhHXCiowSsUL/OZKp1OdTbFDmO2DHhz+NuV3WSrEzFOZvDUSqSDmpa7yvl4UjRMuPrAzknIA5QP40W1WmaXK2bJlCV0YyWOJRB3u01yAZEYn/2/TXsOce1c7kGWrfmWK5WBBeeP0YsIJF6TjHHHk+W8mnqkDqizF0g7vd0QGwCIfItsG7i2FRx06L8G00zsDNd10oTZ08lMrZYrk3R/Th4O/UPz0ksRIj6O9yiERd0CFzAZZBCTvmO/WZOkHYO0Lfjp8hcGw/LY8zEtcjAl48OFGnof7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=722zAuTdHpu77YXNJKNLQCMhznoHEvehEvu3sMun/io=;
 b=TrROKApotX8Rm0F3+YzQ4iFuycYra/ZVdJdWqtCP4TCDB/DRNfn2Nvx22KWfv/rijIZ7cvIrDG+RzdKNf0+dTmRsorXUcQnbe0pZfdfIKeEUgAl9a0sScOZ3OEGLNWAfzjylC/ev4rA4xHPAWlhfBy61b3o6n9FtPLswPnf9rBTUzQ205Ma8STjl4NZlydXvZOXlWfc1REFOanyqGe3FqanyXykGiWsDlX2+5fvK0x7E5kZIIn4WMxIim6KVqkTTWoRWQCweN+4qiuXUex0GlHuM+6EqJLfV0kAXPYyczsidpzIqwD3faHkzLEIL5kXf6nr7uN9kyxj2xZLrANgmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=722zAuTdHpu77YXNJKNLQCMhznoHEvehEvu3sMun/io=;
 b=KaRvTKgvgBxllf8OdrX6h33NfTPr7dJWEavMvSYx5ufWXGHIyyRSvBXveOJiHNdd5aO3VuOxMDasU3EyHewSMNyqSfhhCXRRrur17HkbA56KlToSbez9EIAadfIDwxUkgc9xnlRXPNNV2ney6UI0xqKtbM1/d+oK2zB4Orz7z0Uetq7MkA/0UeE6Bc/hMwF/VD3fpmEZ96IiXb28aCYuEZfhZwcIxLv9vZJrADDaaUt3f/IBkeQq19bveqvsdWg/Q95r9gLBWejPt/OdL6VDtJs4Fo2d2tY0o1C0QwBQ1R1lrzeDmtLp7rJCebyW+aJs5fo3GJICGo9U90d5P5a3sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11383.eurprd04.prod.outlook.com (2603:10a6:102:4f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 20:20:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 20:20:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] arm64: dts: imx8mp-beacon: remove fallback ethernet-phy-ieee802.3-c22
Date: Thu, 26 Feb 2026 15:19:47 -0500
Message-ID: <20260226201949.690681-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11383:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3a582a-a059-4b08-18b0-08de75747c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	WkUcaXlc0Bagi8sjrGzqRjKQAggXeuG4EQZWMd3HmNKnx9CpFRg9a6qPqenSkb66Hjin0lrAm8PIqCqmaMBFGEQS/xOrMZ3+nSgGbTCzFKHLqelfYs5jabELAgwN4e7j+KxaN88B5+aPIrK72qRGvXjzRi1KxnMeLMV4meDbj/VAAEfXjcuSQjjrEG4XVDl/aowaO8q6gJd6kFcQ46e++DXzrix2LSZPFvjfzsjjbcS4nuqtkXh5D/NeKAINz4m8FNvmztqocQUIj4PAkQqHlFYGWdR09bl00nylZt9r+Ub1bk2RPhKIbXiBl2tfEEOLroNsOTQfsFlYXxbwNvRSUoyPgPeWbH34Fxv8FSryTAlaEvNx5/WzA394CLqsY9yJshzHhJ3rZymq4ZQ0d6uxGXs/I2SrA2b4IV1Jhc4/3Ki8Msj4kQWC63j0EKyRnQ9FrjPFHHslvh014Tcjz/644bzZ3LWdawQS1vdokBQSa20qgRM0wf/+UaULf6dz4GyW3YW1Sr4MnX7+QeEZU/zHFxC6a6aWSPpbyembz4UtIjZfgV42BVN8Zrzp0V5SLq+Z/5s4MkkGw8BOMw5hJ8wOgvthbwZxIIXDytPMP+pVnOZ9AeVU5MdRUjlx1mWIJBD8uv+PSxjNfk3NUCQ0ud/TKlD5AaLqOUM1GX7oKM/7QWzjixQyErHIGZUfPYTdYoRsQMrMIQVNQ9lKCgFeDxkWbaDjsqekYBbPlBKEWV9bNT3Gug0ba963OBq+ApWTd4Z3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VgqIBJXffGPjJaDkJsEOdpi/e1vz5uiC2iy6LA63sWP7d44zUFrmxMInwYr?=
 =?us-ascii?Q?1IUk3Yuv/qOGcmd71o9b0V/6QOq3FpskP2h2YzBeOqBrF4/oHP07wc4aVnGY?=
 =?us-ascii?Q?548NrB3TvPlKcptEER6+R7CQbjbakgB2Wdw5spfj1LY3f8s6FV/JSc1r8qEV?=
 =?us-ascii?Q?cZu8brUPhFxAEtW28g3sE+9F4155yuU5Ilg6q768n8K7U7wu9a1pRC3oz8s8?=
 =?us-ascii?Q?6v47eWMGdJLZGSx+UiPEPtcglUDjW6ipE/MhctaUdBM2LYaCzThYUOTEg0oB?=
 =?us-ascii?Q?aBxuDiI9TeTbYke6vNZo3m2yjZEVYMe+sL4a6CyK2NCMJiSnTpCcjmPqONlw?=
 =?us-ascii?Q?tvI7EqGGifRx3n0WDee/4Omqlr4Ig1Z9BAD398bzK6JvaSIdhMBI3e5YAzLx?=
 =?us-ascii?Q?WiKy6ignoaBuhCit1ezBfy0D1CiDUg8AUVrA3EpKBzaKOa+Hu3YFAnx23C2o?=
 =?us-ascii?Q?DIsU/gEkv/KZaQlIa/LNB166VtQHwozGXRmX8kRLKRdukuvi0/E54fsmFtSm?=
 =?us-ascii?Q?Kwu8PPsisLryj6HasXizKZHqKuU2/ANnly3yYDAChQneNO/mEiwPMajHR7h9?=
 =?us-ascii?Q?D+2+ozqAnmBtBHj/gKm4TCEPJ5Mv+L/0xYp169XA5lKKHC5QkbE4ScCxwtQa?=
 =?us-ascii?Q?5QZDjDg798QXxrb1yc1QjWceRf9rRuFErCBPSF0Ru5BlalBTscAIOBLNvn88?=
 =?us-ascii?Q?22bn6pFqVjjebrNZVvPacCP3p2BudcTacIjt+wytnJpEnZZYYEs+6icLMqDZ?=
 =?us-ascii?Q?vklQeyn4B4TQ79fQSbUP9Ert+FOExqNXMOR6fssnrsRuk4quKsyepldNpBux?=
 =?us-ascii?Q?BK1/he0kbZhliHiRMqltEbwjzNmeccC9YVRu5r8mrZ2uXJeNZjPMkdPQ3lsf?=
 =?us-ascii?Q?3fUDjmwAzESEeA82lvITYIkOhEGiOnabxQzH7cR+90WZ5xjc115ELuVDfqGK?=
 =?us-ascii?Q?eXZr3YIxTJ/VRXiAikKD9xBSNTj5VvHTxZnCzaSYECAcEhMs7TxxuoSAQELf?=
 =?us-ascii?Q?VAe4VIhUfyXz+wCzW8ENGMuYHhQ9aabWcBbmRpSV9fTONsNUsh7VyPkBZLJR?=
 =?us-ascii?Q?AWk41KKZCkPiwPIr/b/7cYQGH4EVCvtf8jhgOO9HdvD5TtqZQlg69n4ahAKz?=
 =?us-ascii?Q?yhZGSNF9TnYUdowjGmoiFTAfyeL8YQawjpXTFBKdTKipMtcdGIBe44twLF0p?=
 =?us-ascii?Q?r6RnmqXKMniEXfKAsmFwXJS4qfYMS1tw7DUoQrbFaLUUQWE4EGxPDv+4jBsT?=
 =?us-ascii?Q?bBsCLIDRgLmezKmVWw1eL5FdD+dfqldEsrpnZPae4zFbKjAHCPb62pcUmxKr?=
 =?us-ascii?Q?pitPnvzXyhlkmi3mMDAr+SQppldts/e31SQA3hNtGy9Jp4sgSIOWbu1kctUf?=
 =?us-ascii?Q?Te974tk9PvicVhA/lPZp606S4HUM/ZgKG6L0DSCfFMmYcHNBmzi4Tzr6pekD?=
 =?us-ascii?Q?T18aB1iv5SVnYyDx6AMUe7QCS6A8kLzI3/ItaLFuXt7GXMdrcrRxXh9r0SBn?=
 =?us-ascii?Q?huHgdjqtuifgOYO35H6aKWXg4PYotOGVbtJCPgtHOoITodsKTy5UvLmvyoRw?=
 =?us-ascii?Q?twVkfm0TrLmuQKZWnZAta+PKSAgD9deZjueZO7hcdo4plPkz7Qi08R+H+XSj?=
 =?us-ascii?Q?owtu3ssYMKHNHiIil1rM6YArXyqApxiiGutecTLR5v0i/TjoHyzTy8vccDAc?=
 =?us-ascii?Q?OqjS9lkiVUdXqI3VSpR3+Szgp4s2mR52ThQJGZYwQCdunsCcS3wUbt7pLv8c?=
 =?us-ascii?Q?rdCPbtZaKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3a582a-a059-4b08-18b0-08de75747c4f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 20:20:29.7894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9XkarINX7COigllF8xLCw7+aT9agXIPOLPvyFYQGRzXhgJ+6JTYIw6avC//t4ry9bpEJr8bVSvPF0vx2sBOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11383

Remove the fallback compatible string "ethernet-phy-ieee802.3-c22" from the
Ethernet PHY node to fix below CHECK_DTB warning:

arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet-phy@3 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
        from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts  | 3 +--
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 31c33acb560c6..385aa6bae5202 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -266,8 +266,7 @@ mdio {
 		#size-cells = <0>;
 
 		ethphy1: ethernet-phy@3 {
-			compatible = "ethernet-phy-id0022.1640",
-				     "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id0022.1640";
 			reg = <3>;
 			reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 6a62cb32e22ec..1007f7db85e93 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -60,8 +60,7 @@ mdio {
 		#size-cells = <0>;
 
 		ethphy0: ethernet-phy@3 {
-			compatible = "ethernet-phy-id0022.1640",
-				     "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id0022.1640";
 			reg = <3>;
 			reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio1>;
-- 
2.43.0

