Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0B394471
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194110; cv=fail; b=PHM0pDgmDbMbQda2cMlKmr9OAZsIWBr9Vvyk1SKXPvtpiyCCKYNOQ9bRQ9JlnArbhAep4hTOfNrBD7ihkDY+c4GZDI6Jt3U4cbns5cqHXSnRM8rK04birOOjBL+cnWJ8L1SFTC1/MgSDGpfmusJPvtcv1+p3Nh1+A7eWo6oiR5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194110; c=relaxed/simple;
	bh=7OGo+PTv/sgYNkemWYaZXIO/rPQYdS/8actH/Yncqh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l+EeBjjmNPseo2/3lVTWltBGTBn/YqG1wqR17BRZPo+p/xW/qY7cQaj2grHxsrCVTmz3SBLs7yT0VTLfeJUdW6qLxt//FDr/4dr9IodmBZjdCwPMZwlvZTCqq+dce1bkYNVBe2WlqjTetd8mPR6Ep7IhhwRVHRlvZOZ7YIAgoP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TlOkhgUJ; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TlOkhgUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yno7GCDY3zcXcTrK++02iYE3ulRyyPX//cQhlNun/Jl1YOWiSWchSd6H+YmXFx01TjlMCjql789NxQVnAsCggr6d7NYxbU4YWB4XBFU3MpjFcVK/KTo1I2fKDE/rUaYVsF8AeXMTZLJWY980O7qTKPInPA8tvHB7YgaNagB4P7S7x2jqtEr4yZO1Si0nR7BzXrQXREcToagf7RRWruOH3bQaDixwTZy1SeTVx48aQccFW5Qgd7jKhIXE9B0KjMUEhmk9jPCnYw+8mIjt4rjWv/4mQl1LhWQrwA3jzX4PK6cymq0OfxKiDVgx2F7lx2hAiDStXsEq4D1vTWLhXZzTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH8y3tmZ2wdmw49raajqrh8GzjQBQAm6mlObUGyGNl4=;
 b=TUnx3fIVQUIEs0SJoyPB0keYKX+Du5IlpSByT/lJ3+TfaEtmHT5b1iEKTlZJ2E+mPyrjj5EDUGr6SGDAfhgjDcrQOsgcC8yXio2i0JQewN+S8XiYPuEPVJbPQWW9kWUgde04/nx+lDSTQ6igQ3HQczr7FZzbe1ViUO2Cz5QAevlTL1KtWoZcl2Gf2FNTjX4gr1pfA2EcgqT0X6ehpk27AVZkOLqp1MKue9YR+OIORTtgJQu610wItNrLdCivkbHgogM6UkGacCsaiQ/A+hxaR8IldZvyqqNerEgmo7sOxcGgRx+VqJDcxJ1GHlzd2iLE474lIgwxWcew3heqA+x8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH8y3tmZ2wdmw49raajqrh8GzjQBQAm6mlObUGyGNl4=;
 b=TlOkhgUJMr4ZAxquWAQP+24ji/geJJ0sJr8YUU2I/0HlszabLNmztYLGpA1exY/+wJuav7tJQj3JqIt35dm2pXbXtx0waf0YbkNxKnN4ZHDNlM9cZ783K4ZTOvWHZz1N6ZVpFZRFt5GDL/GamV7Wc1BwRzcsi2VjUlStnhZ+mG2fvM102TEP6M4LWNNx0yiz1gFgsuzktH3N1Mb4SGNKKCM+ABdpVILTR5TvWBF7O61IAwXO/gNE8JI0XNS4/o2Ps9YMViO/2X78aRPK0GjTcV7uTFmZPkEsJh4jCJHHGkiBugTO1h94E4IVF8FKo0n5+SV4gYPStYwITxwdanVobw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAWPR04MB10005.eurprd04.prod.outlook.com
 (2603:10a6:102:385::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 08:35:05 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 08:35:05 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V6 2/5] arm64: dts: imx93: Extract common EVK description into shared dtsi
Date: Wed,  4 Feb 2026 16:35:48 +0800
Message-Id: <20260204083551.2867263-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204083551.2867263-1-sherry.sun@nxp.com>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAWPR04MB10005:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd7e793-2b64-49df-d487-08de63c84c03
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hpL8dvLJK2q9HIYnZKO5fsj90F5poRzM5Egn7COHilNS8pcgD6FgsC+oEo0J?=
 =?us-ascii?Q?5ZW/oqESULi67yzbZsLHGbDK+GULXD/Wh3F29qc6C4kIDIZwAeFQwC7DIXf+?=
 =?us-ascii?Q?0thUUkgLLuTABjbboaiu+xq+WAmqKBhZbw87PtMhY38gVgW2kqD860t/qIQ7?=
 =?us-ascii?Q?yy6rviMmd9sX5DY4GEHR6Z4/DnY+IxyeLNzYM2IoJAbOED5WVDJKThfdiy4S?=
 =?us-ascii?Q?T6q61teT6CkYq5nsKLP4M0Pj19RzEuo3l1Xr/QNV2aNSS6++BZ2Unj67ZXbe?=
 =?us-ascii?Q?ziYG9qwDCMGz+qxiXqOPUImPTU5SIq5lhipZxevvgOCE9GRQmpVq2Gb32SZA?=
 =?us-ascii?Q?CzPLaEOaW11itybGiLAEn19YLQ6EL+tEMWaQHsPXXoI3zgIkGDyqQpxuVFHk?=
 =?us-ascii?Q?9bIMhZueLgHHbf4FjK6J0jfNja9y5wUjMq2lPrt7EoZmjDUIg2u76PLHPPdp?=
 =?us-ascii?Q?AvZtSR6VmRhyB0qLoX+ifM/yWiRfxQTTzQJmvca46j1FYv8YJNPT+VmBgDhS?=
 =?us-ascii?Q?yYjkwrlA1bHhNyN2qpk4dwyn5pZ2w3Me3epjX3ItWhT0pep0ABKAg5SDGXOD?=
 =?us-ascii?Q?bPn+n0pC5L4ApTyzRThJKTHOORN5E4N9flfrPJQvi3YCXQKlG1+x/6mVYM65?=
 =?us-ascii?Q?nUSCF5TRcD4/W7RuyjEEk7fL1ABcsBsn2qCA/cjugmBqYO89Ej2Ng3qW+N96?=
 =?us-ascii?Q?0SvlCf4tg7nqGNJaw2moH73z8ytLlYjwp2JbxxbsAhDYFc3kDNTHlGFUOEa+?=
 =?us-ascii?Q?Ja4i7fZJazZcukU3WKtTwTjeVBFSeykAJSLkyq1ZciuTfQhVPjV9AwJ3YJU8?=
 =?us-ascii?Q?8Iwu2XIhKpaOADCaga9Dpo8QHKA+Xh4+YSHCJRaXIlU22HIUmIX2KHVspQXR?=
 =?us-ascii?Q?3JQtdr1RUk7RFOx/VD+JCu+SS5DbvUGfFTBIfdYz6F2eXCJ9F8cBzWzHAWOp?=
 =?us-ascii?Q?qhoByZdQaQtpmMzk3IWREDFmspZzfwg0Z7KqYJIPZ5exc3e5L7i8raqEE4Kr?=
 =?us-ascii?Q?lQOy9Q+Kdtdvmtqz2azOcCYaSiPdVDGxccS9hp/ppvyXlhCExWhs26Vp148p?=
 =?us-ascii?Q?7lJzUzr442Is/Vgd3LcXjqDlh9dndvQjU5ZjY0U/16iK8vUakrPod51VFkUd?=
 =?us-ascii?Q?dLDjUKuSBt+VZquGvGHrcNu14lraZfizDevJOYaheRIa+QoBhCiSSUXptLAl?=
 =?us-ascii?Q?1IxdSdi91afBLw4RppuCKe29sgesGXJ2ueeLuFZoczLNhN/oDKy2QAk8d8F0?=
 =?us-ascii?Q?Pm9MoqS9FWG8CnzPXerjIH74c9TV/8r/s3k1yUzaGFjTZzn+WMSpLpSytp7x?=
 =?us-ascii?Q?qzhvFhrxORVn3ZdedAM6nmSomDyiL5n92RYToAuwZapQ4WDKo4t5CWD/x+eS?=
 =?us-ascii?Q?ChFK8i9ICJF0IKsT3m91pdZtOdihEztK03Wmkyz+U9y+jz1rf3gPBH9cAofD?=
 =?us-ascii?Q?D1bO4TSvdOOGohpI9oj/RrjOBKY89+l3FY+4Y+OZCiu98F03dOCcNXy6IzX0?=
 =?us-ascii?Q?QcSJ8bSz8AvPboUXnUXFdGaOlAO3pOVeaiKPSI4rZQC9foC/nsFOh/AdjZFF?=
 =?us-ascii?Q?UAyfOlLLS9mlFth2VVVcIrvtboZzfk5LyaRGnXkr6RDWq/lq/wwUl6uXuwNt?=
 =?us-ascii?Q?bEGPGkDj9n0R4/SwPkw9HOCaaAVdSZbsDE1vhMWYnRzX?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?I+0/oEjvFlmEgaIZKymFCgGKEWT8ldtYAqzZrfq/ovoPw+eKJSUbjU+UJ5Gr?=
 =?us-ascii?Q?uVNJFTMZzAnPWQ7UINkaICHNkZKV9X5GywlNJTEF51zEFGgdT15vPZs00nKY?=
 =?us-ascii?Q?eSg3MkkFpSErI05IjUxovfe6O7p8QUqcMxgt88mTIUH9PbL2OC1ADqm65WJB?=
 =?us-ascii?Q?PiQkxyYXC9XI73u/bYIziXP/HUeKui/dplj1xhO048l29MbuObtqCAlSp+Ul?=
 =?us-ascii?Q?WfvNzzihWZ0MSUNFcZNm+tYeAPdsaAWFoJpuI85ekbD70JWP5XJGwujIdpQr?=
 =?us-ascii?Q?EmMFFCiz+C4MGsSxVi20MDCs51w75xgCE4+2ioyZvpJIiahIU+Hm6SiCk9Be?=
 =?us-ascii?Q?IjEM7p4Ky05tSP1NeyN+57M3jxRyFmtRcFSFUl6i3WWpBHZawdG+d/zE9dBJ?=
 =?us-ascii?Q?iLuaF5L6FWenKEHw0TGeRfGrlneLg4Ui5eRVvFlt7XBgURZ4BmYwu578YJfq?=
 =?us-ascii?Q?blZvt+GLcdj2SVQdgGaLnwKI8exydsb+HQJSVnLNcyrZaFDdmANb6WkQl+dT?=
 =?us-ascii?Q?+9K5QEWJDmPcAY215dfRarF8KoXjm8csgZZg1ftfp85W/9iZ6qhrZSzP+ULh?=
 =?us-ascii?Q?vqGGR8ZhVQQ0Le8n5SA/mGDl3Eln9unmM/uUxwleqC6t2aZ052JLCNGBgSLk?=
 =?us-ascii?Q?DIUokkSFRNWCQO0V5x5f+VmyyKEZ2LW+1/DGwNloJ4w8taKukjYXcB76ngta?=
 =?us-ascii?Q?zLbireSxP8Z6qC40/sSpB1fTLG9IGfDvke7sowX10tPEob0DNfBwfzCw74f+?=
 =?us-ascii?Q?RObVPfB+RMytiCj85hFHgqJBSxx28bm+qkjV9IfE7YPvfdw3lYa005rjLoVa?=
 =?us-ascii?Q?5EWyfpq4gjmAG4VcrOe7VNEu8Ad73733L0RrlUCjzqQRjGfeS9adzXAq/9Ia?=
 =?us-ascii?Q?PTqxVvwub/YdJUmJgXMWZqHx+rZMJa1faa3LlgCuFjJFbAonNcIdoxf34g5q?=
 =?us-ascii?Q?+B1mXl4yknuwFQIMPd5HfznQxNCGnu2u/7+XMALCclcPuhPMmxR6LAEoQLSD?=
 =?us-ascii?Q?UDO/QlwgDm5VHllpWBHDxkpqYkl1zfYFtw81DHltIsTOMKgK8fKP+2lj6/Bl?=
 =?us-ascii?Q?w86i3T0TzSr1/aBglOoq5kTdkN6w5GmfIE99IX+B89MUe8aQID2+MZMxXyhw?=
 =?us-ascii?Q?mWJz2/c6ODvjJmEHj5/SaVKk2nlrhbwrJyFGU4Z0/ptWSSyp0ENye85ZhjfS?=
 =?us-ascii?Q?VjzbEZZG7MsPMS7VDE3VyIBWCW1vbzyystEqJfvXXi38PFGAB6mAg0rhMRER?=
 =?us-ascii?Q?XL6nT6rETFRZRi+NHt6g5Okj07u/YozpKgfuzRRLv8eFjN3vZo0CgA/o8nnd?=
 =?us-ascii?Q?SvfNKEsvnirrPV3iZAnSzbo49vuXfAff0fjrF/uqcJ6rjQMB0V6dexeU7i1K?=
 =?us-ascii?Q?ZmsbvNBSDjFCeiZlmc9zb17L8TA8Mfq15ieyYe+QvzwJr94qFBNdqp22okFH?=
 =?us-ascii?Q?XAuuxFiIf+h2zGP41+ioNeFAcSv77zts7eKPlzDjslDgz2cTKvXVA2+RTk9R?=
 =?us-ascii?Q?rjBtLc+J+mVlyiyfa/RIFVAtFwVQU7UdkfoDqIFDeatYNPZ6JjYAV6Vr6S7T?=
 =?us-ascii?Q?7HYoLV0qBSGNJJtEwri/LbyLDTP+53PUwAuk7AaaXhiuoiWghelDs5w19Rqe?=
 =?us-ascii?Q?OgeJwwXW0sL3x8LSsbvK4jZ5cxbd+vKdNY4/BoB/rSEjHVrakXR4nsKEViMn?=
 =?us-ascii?Q?3G7/wpumCpUiHvw64NUIBcELbaM8zcYu5QdYNEfQuZjAOkpLCowXb8U1bqR0?=
 =?us-ascii?Q?aandqt+LZw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd7e793-2b64-49df-d487-08de63c84c03
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:35:05.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ44/jpxqiYEqZ/fO/OE/LHfsz+ChKJny4QeM7TKu2IMa7o7HJtlyYIsJRVVlaGaok1iu9frX26Tky+kMnuwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10005

The i.MX93 Wireless EVK reuses most of the 11x11 EVK design. To avoid
duplication and DTS-to-DTS includes, extract the common parts into a new
imx93-11x11-evk-common.dtsi shared by both boards.

Rename imx93-11x11-evk.dts to imx93-11x11-evk-common.dtsi and include it
from imx93-11x11-evk.dts.

Only structural changes are introduced, with no intended functional
impact.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 ...11-evk.dts => imx93-11x11-evk-common.dtsi} |    8 +-
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 1053 +----------------
 2 files changed, 3 insertions(+), 1058 deletions(-)
 copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-11x11-evk-common.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
copy to arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index acb160d3186c..6279b8eb4ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -1,17 +1,11 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2022 NXP
+ * Copyright 2022,2026 NXP
  */
 
-/dts-v1/;
-
 #include <dt-bindings/usb/pd.h>
-#include "imx93.dtsi"
 
 / {
-	model = "NXP i.MX93 11X11 EVK board";
-	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
-
 	aliases {
 		ethernet0 = &fec;
 		ethernet1 = &eqos;
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index acb160d3186c..b88876bb7128 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -1,1063 +1,14 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2022 NXP
+ * Copyright 2022,2026 NXP
  */
 
 /dts-v1/;
 
-#include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-11x11-evk-common.dtsi"
 
 / {
 	model = "NXP i.MX93 11X11 EVK board";
 	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
-
-	aliases {
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
-		gpio0 = &gpio1;
-		gpio1 = &gpio2;
-		gpio2 = &gpio3;
-		i2c0 = &lpi2c1;
-		i2c1 = &lpi2c2;
-		i2c2 = &lpi2c3;
-		mmc0 = &usdhc1;
-		mmc1 = &usdhc2;
-		rtc0 = &bbnsm_rtc;
-		serial0 = &lpuart1;
-		serial1 = &lpuart2;
-		serial2 = &lpuart3;
-		serial3 = &lpuart4;
-		serial4 = &lpuart5;
-	};
-
-	chosen {
-		stdout-path = &lpuart1;
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			reusable;
-			alloc-ranges = <0 0x80000000 0 0x40000000>;
-			size = <0 0x10000000>;
-			linux,cma-default;
-		};
-
-		vdev0vring0: vdev0vring0@a4000000 {
-			reg = <0 0xa4000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@a4008000 {
-			reg = <0 0xa4008000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@a4010000 {
-			reg = <0 0xa4010000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@a4018000 {
-			reg = <0 0xa4018000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@a4020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa4020000 0 0x100000>;
-			no-map;
-		};
-
-	};
-
-	flexcan_phy: can-phy {
-		compatible = "nxp,tja1057";
-		#phy-cells = <0>;
-		max-bitrate = <5000000>;
-		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
-	};
-
-	reg_vdd_12v: regulator-vdd-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_vref_1v8: regulator-adc-vref {
-		compatible = "regulator-fixed";
-		regulator-name = "vref_1v8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	reg_audio_pwr: regulator-audio-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "audio-pwr";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_m2_pwr: regulator-m2-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "M.2-power";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	reg_usdhc2_vmmc: regulator-usdhc2 {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
-		regulator-name = "VSD_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
-		off-on-delay-us = <12000>;
-		enable-active-high;
-	};
-
-	reg_usdhc3_vmmc: regulator-usdhc3 {
-		compatible = "regulator-fixed";
-		regulator-name = "WLAN_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_m2_pwr>;
-		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
-		/*
-		 * IW612 wifi chip needs more delay than other wifi chips to complete
-		 * the host interface initialization after power up, otherwise the
-		 * internal state of IW612 may be unstable, resulting in the failure of
-		 * the SDIO3.0 switch voltage.
-		 */
-		startup-delay-us = <20000>;
-		enable-active-high;
-	};
-
-	usdhc3_pwrseq: usdhc3_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
-	};
-
-	backlight_lvds: backlight-lvds {
-		compatible = "pwm-backlight";
-		pwms = <&adp5585 0 100000 0>;
-		brightness-levels = <0 100>;
-		num-interpolated-steps = <100>;
-		default-brightness-level = <100>;
-		power-supply = <&reg_vdd_12v>;
-		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
-		status = "disabled";
-	};
-
-	bt_sco_codec: bt-sco-codec {
-		compatible = "linux,bt-sco";
-		#sound-dai-cells = <1>;
-	};
-
-	sound-bt-sco {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "bt-sco-audio";
-		simple-audio-card,format = "dsp_a";
-		simple-audio-card,bitclock-inversion;
-		simple-audio-card,frame-master = <&btcpu>;
-		simple-audio-card,bitclock-master = <&btcpu>;
-
-		btcpu: simple-audio-card,cpu {
-			sound-dai = <&sai1>;
-			dai-tdm-slot-num = <2>;
-			dai-tdm-slot-width = <16>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&bt_sco_codec 1>;
-		};
-	};
-
-	sound-micfil {
-		compatible = "fsl,imx-audio-card";
-		model = "micfil-audio";
-
-		pri-dai-link {
-			link-name = "micfil hifi";
-			format = "i2s";
-
-			cpu {
-				sound-dai = <&micfil>;
-			};
-		};
-	};
-
-	sound-wm8962 {
-		compatible = "fsl,imx-audio-wm8962";
-		model = "wm8962-audio";
-		audio-cpu = <&sai3>;
-		audio-codec = <&wm8962>;
-		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
-		audio-routing =
-			"Headphone Jack", "HPOUTL",
-			"Headphone Jack", "HPOUTR",
-			"Ext Spk", "SPKOUTL",
-			"Ext Spk", "SPKOUTR",
-			"AMIC", "MICBIAS",
-			"IN3R", "AMIC",
-			"IN1R", "AMIC";
-	};
-
-	sound-xcvr {
-		compatible = "fsl,imx-audio-card";
-		model = "imx-audio-xcvr";
-
-		pri-dai-link {
-			link-name = "XCVR PCM";
-
-			cpu {
-				sound-dai = <&xcvr>;
-			};
-		};
-	};
-};
-
-&adc1 {
-	vref-supply = <&reg_vref_1v8>;
-	status = "okay";
-};
-
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
-&eqos {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_eqos>;
-	pinctrl-1 = <&pinctrl_eqos_sleep>;
-	phy-mode = "rgmii-id";
-	phy-handle = <&ethphy1>;
-	status = "okay";
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clock-frequency = <5000000>;
-
-		ethphy1: ethernet-phy@1 {
-			reg = <1>;
-			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <10000>;
-			reset-deassert-us = <80000>;
-			realtek,clkout-disable;
-		};
-	};
-};
-
-&fec {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_fec>;
-	pinctrl-1 = <&pinctrl_fec_sleep>;
-	phy-mode = "rgmii-id";
-	phy-handle = <&ethphy2>;
-	fsl,magic-packet;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clock-frequency = <5000000>;
-
-		ethphy2: ethernet-phy@2 {
-			reg = <2>;
-			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <10000>;
-			reset-deassert-us = <80000>;
-			realtek,clkout-disable;
-		};
-	};
-};
-
-&flexcan2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
-	phys = <&flexcan_phy>;
-	status = "okay";
-};
-
-&lpi2c1 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c1>;
-	status = "okay";
-
-	wm8962: codec@1a {
-		compatible = "wlf,wm8962";
-		reg = <0x1a>;
-		clocks = <&clk IMX93_CLK_SAI3_GATE>;
-		DCVDD-supply = <&reg_audio_pwr>;
-		DBVDD-supply = <&reg_audio_pwr>;
-		AVDD-supply = <&reg_audio_pwr>;
-		CPVDD-supply = <&reg_audio_pwr>;
-		MICVDD-supply = <&reg_audio_pwr>;
-		PLLVDD-supply = <&reg_audio_pwr>;
-		SPKVDD1-supply = <&reg_audio_pwr>;
-		SPKVDD2-supply = <&reg_audio_pwr>;
-		gpio-cfg = <
-			0x0000 /* 0:Default */
-			0x0000 /* 1:Default */
-			0x0000 /* 2:FN_DMICCLK */
-			0x0000 /* 3:Default */
-			0x0000 /* 4:FN_DMICCDAT */
-			0x0000 /* 5:Default */
-		>;
-	};
-
-	inertial-meter@6a {
-		compatible = "st,lsm6dso";
-		reg = <0x6a>;
-	};
-};
-
-&lpi2c2 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c2>;
-	status = "okay";
-
-	pcal6524: gpio@22 {
-		compatible = "nxp,pcal6524";
-		reg = <0x22>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcal6524>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		m2-pcm-level-shifter-hog {
-			gpio-hog;
-			gpios = <19 GPIO_ACTIVE_HIGH>;
-			output-high;
-		};
-	};
-
-	pmic@25 {
-		compatible = "nxp,pca9451a";
-		reg = <0x25>;
-		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-
-		regulators {
-			buck1: BUCK1 {
-				regulator-name = "BUCK1";
-				regulator-min-microvolt = <610000>;
-				regulator-max-microvolt = <950000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <3125>;
-			};
-
-			buck2: BUCK2 {
-				regulator-name = "BUCK2";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <670000>;
-				regulator-boot-on;
-				regulator-always-on;
-				regulator-ramp-delay = <3125>;
-			};
-
-			buck4: BUCK4 {
-				regulator-name = "BUCK4";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck5: BUCK5 {
-				regulator-name = "BUCK5";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <3400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			buck6: BUCK6 {
-				regulator-name = "BUCK6";
-				regulator-min-microvolt = <1060000>;
-				regulator-max-microvolt = <1140000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo1: LDO1 {
-				regulator-name = "LDO1";
-				regulator-min-microvolt = <1620000>;
-				regulator-max-microvolt = <1980000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo4: LDO4 {
-				regulator-name = "LDO4";
-				regulator-min-microvolt = <800000>;
-				regulator-max-microvolt = <840000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo5: LDO5 {
-				regulator-name = "LDO5";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-
-	adp5585: io-expander@34 {
-		compatible = "adi,adp5585-00", "adi,adp5585";
-		reg = <0x34>;
-		vdd-supply = <&buck4>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-reserved-ranges = <5 1>;
-		#pwm-cells = <3>;
-	};
-};
-
-&lpi2c3 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpi2c3>;
-	status = "okay";
-
-	adp5585_isp: io-expander@34 {
-		compatible = "adi,adp5585-01", "adi,adp5585";
-		reg = <0x34>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#pwm-cells = <3>;
-	};
-
-	ptn5110: tcpc@50 {
-		compatible = "nxp,ptn5110", "tcpci";
-		reg = <0x50>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		typec1_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "dual";
-			data-role = "dual";
-			try-power-role = "sink";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-				     PDO_VAR(5000, 20000, 3000)>;
-			op-sink-microwatt = <15000000>;
-			self-powered;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					typec1_dr_sw: endpoint {
-						remote-endpoint = <&usb1_drd_sw>;
-					};
-				};
-			};
-		};
-	};
-
-	ptn5110_2: tcpc@51 {
-		compatible = "nxp,ptn5110", "tcpci";
-		reg = <0x51>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		typec2_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "dual";
-			data-role = "dual";
-			try-power-role = "sink";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-				     PDO_VAR(5000, 20000, 3000)>;
-			op-sink-microwatt = <15000000>;
-			self-powered;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					typec2_dr_sw: endpoint {
-						remote-endpoint = <&usb2_drd_sw>;
-					};
-				};
-			};
-		};
-	};
-
-	pcf2131: rtc@53 {
-		compatible = "nxp,pcf2131";
-		reg = <0x53>;
-		interrupt-parent = <&pcal6524>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-	};
-};
-
-&lpuart1 { /* console */
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart1>;
-	status = "okay";
-};
-
-&lpuart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart5>;
-	status = "okay";
-
-	bluetooth {
-		compatible = "nxp,88w8987-bt";
-	};
-};
-
-&micfil {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
-	pinctrl-1 = <&pinctrl_pdm_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_PDM>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <49152000>;
-	status = "okay";
-};
-
-&mu1 {
-	status = "okay";
-};
-
-&mu2 {
-	status = "okay";
-};
-
-&sai1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_sai1>;
-	pinctrl-1 = <&pinctrl_sai1_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SAI1>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
-&sai3 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_sai3>;
-	pinctrl-1 = <&pinctrl_sai3_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SAI3>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
-&usbotg1 {
-	dr_mode = "otg";
-	hnp-disable;
-	srp-disable;
-	adp-disable;
-	usb-role-switch;
-	disable-over-current;
-	samsung,picophy-pre-emp-curr-control = <3>;
-	samsung,picophy-dc-vol-level-adjust = <7>;
-	status = "okay";
-
-	port {
-		usb1_drd_sw: endpoint {
-			remote-endpoint = <&typec1_dr_sw>;
-		};
-	};
-};
-
-&usbotg2 {
-	dr_mode = "otg";
-	hnp-disable;
-	srp-disable;
-	adp-disable;
-	usb-role-switch;
-	disable-over-current;
-	samsung,picophy-pre-emp-curr-control = <3>;
-	samsung,picophy-dc-vol-level-adjust = <7>;
-	status = "okay";
-
-	port {
-		usb2_drd_sw: endpoint {
-			remote-endpoint = <&typec2_dr_sw>;
-		};
-	};
-};
-
-&usdhc1 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc1>;
-	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
-&usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
-	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	bus-width = <4>;
-	status = "okay";
-	no-mmc;
-};
-
-&usdhc3 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
-	mmc-pwrseq = <&usdhc3_pwrseq>;
-	vmmc-supply = <&reg_usdhc3_vmmc>;
-	bus-width = <4>;
-	keep-power-in-suspend;
-	non-removable;
-	wakeup-source;
-	status = "okay";
-};
-
-&wdog3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdog>;
-	fsl,ext-reset-output;
-	status = "okay";
-};
-
-&xcvr {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_spdif>;
-	pinctrl-1 = <&pinctrl_spdif_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
-			 <&clk IMX93_CLK_AUDIO_XCVR>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
-			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-	assigned-clock-rates = <12288000>, <200000000>;
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_eqos: eqosgrp {
-		fsl,pins = <
-			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
-			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
-			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
-			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
-			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
-			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
-			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
-			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
-			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
-			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
-			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
-		>;
-	};
-
-	pinctrl_eqos_sleep: eqossleepgrp {
-		fsl,pins = <
-			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
-			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
-			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
-			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
-			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
-			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
-			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
-			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
-			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
-			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
-			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
-			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
-			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
-			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
-		>;
-	};
-
-	pinctrl_fec: fecgrp {
-		fsl,pins = <
-			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
-			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
-			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
-			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
-			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
-			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
-			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
-			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
-			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
-			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
-			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
-			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
-		>;
-	};
-
-	pinctrl_fec_sleep: fecsleepgrp {
-		fsl,pins = <
-			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
-			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
-			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
-			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
-			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
-			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
-			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
-			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
-			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
-			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
-			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
-			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
-			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
-			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
-		>;
-	};
-
-	pinctrl_flexcan2: flexcan2grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
-			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
-		>;
-	};
-
-	pinctrl_uart1: uart1grp {
-		fsl,pins = <
-			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
-		>;
-	};
-
-	pinctrl_uart5: uart5grp {
-		fsl,pins = <
-			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
-			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
-			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
-			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
-		>;
-	};
-
-	pinctrl_lpi2c1: lpi2c1grp {
-		fsl,pins = <
-			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
-			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
-		>;
-	};
-
-	pinctrl_lpi2c2: lpi2c2grp {
-		fsl,pins = <
-			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
-			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
-		>;
-	};
-
-	pinctrl_lpi2c3: lpi2c3grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
-			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
-		>;
-	};
-
-	pinctrl_pcal6524: pcal6524grp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-		>;
-	};
-
-	pinctrl_pdm: pdmgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
-			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
-		>;
-	};
-
-	pinctrl_pdm_sleep: pdmsleepgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
-			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
-		>;
-	};
-
-	pinctrl_sai1: sai1grp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
-			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
-			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
-			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
-		>;
-	};
-
-	pinctrl_sai1_sleep: sai1sleepgrp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
-			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
-			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
-			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1: usdhc1grp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
-		>;
-	};
-
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
-		>;
-	};
-
-	pinctrl_sai3: sai3grp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
-			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
-			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
-			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
-			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
-		>;
-	};
-
-	pinctrl_sai3_sleep: sai3sleepgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
-			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
-			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
-			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
-			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
-		>;
-	};
-
-	pinctrl_spdif: spdifgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
-			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
-		>;
-	};
-
-	pinctrl_spdif_sleep: spdifsleepgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
-			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
-		>;
-	};
-
-	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-		>;
-	};
-
-	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
-		>;
-	};
-
-	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
-			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
-			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
-			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
-			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
-			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
-			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
-		>;
-	};
-
-	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
-			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
-			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
-			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
-			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
-			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
-		>;
-	};
-
-	pinctrl_usdhc3_wlan: usdhc3wlangrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
-		>;
-	};
-
-	pinctrl_wdog: wdoggrp {
-		fsl,pins = <
-			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
-		>;
-	};
 };
-- 
2.37.1

