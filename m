Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F813EBF1F
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952005; cv=fail; b=NwMXK3W2pVgDKBWFxJVd2J7QohdCNXPWaVuXL590tdbct1dOXbB5rsan6ycjg7BY9lmEbRwTPGPtmaase4ykAtzgL2rv8U6eKkLWR0PkpyslocRDBDpdZeRgM7Vw59e5ofDUSfwb+RarkkG/ETUY0DL9bJFS7ej6J2GslLm9Qy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952005; c=relaxed/simple;
	bh=BxDbqFxoeqkOXuc+nEdTSgZ2WP4LornZo+uV6509gTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PGhwE295TM30rIskNHq7bHKF0U3vdWaNMneJMfHknEj1S0FwWlvkzYyLb9ZutAvqBvBuUeZ8rjj+AdckNTURgjCaEbPN8sKEkLhv7oXQU5SnuSp9yt4Z4cwGjCpgXwEThi8mSYiq1AkNfxmT6nfnaOppi9A8oVI6VqI7inyi6Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kCMe3mVH; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kCMe3mVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAYDPB4wEL9uJrsyJ7wYt2QX6aHvgwRXBCI4scygqbAiGBo4egn+lQYimRQv9Aqh/vPA5lyy1uhkBveurE/M1wgvb6o4IpybezXj/oRPCqtM6BmGzZM2MVopLDy5Gqddvcach9EwmRjNwiFOv3qEsOepdAJ38FzjSHE/is6BC8/uMuT5Hqm90W/ZTc/cRxvSmwEzThxGTb8/K082uxgvIqzTEvix0BTr/3WsbGHXNa4NufDYBfXO/9TlYogquwFELzUMcZ6hNCbOwlbOtu6MFsd6bw3/2lfNmYWCaqopMlO6EghFnQyRWhf6OdEFuws37uZ/hPjF1dAEbARlUxvpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr+Ofu8Co8KzkrOQjJMn1zwjCHebHpjifLhJNJnfGWY=;
 b=FXCsGAq4c2z9vjbooa6Jd5Vl4SymBeAmHqM+V6/enVtPdhmn9AUsqV8PwcURIbAUxL7I33TkPYtesM62dRoBH3JddjfKVBtzd42iEVa9VwPVjBqtPgey6xMjHeR9qrl+MGJyj8n17eoONlS8uMnJXt7VvHc10tRckx3TFfQXNHpT0/vdAhW4a9I9dMUnhi0Dm4D7Myh5zpqjD3kKhWIWwG8drvVou0LMg7Exn3j1lTltDtCBiJlmCPvIPwlx3i5WrMfcbsUuGx98p90Kohf6EH/ixhN7OxNFZsyVvIniulOyENDrZJcyPYXxpDaqpAhWgzj/fWr8KgxKeXevd+PR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr+Ofu8Co8KzkrOQjJMn1zwjCHebHpjifLhJNJnfGWY=;
 b=kCMe3mVH5VbPRux6w8LVCG0GlVwGp57U63Hszy33f8yMdtP7fQTI1kQ6yylyXTsJqsWRniOtvvCiGZGwNoWGAMBeP6D7g6B7MGEPFjbK/cRHNKRcwQckLFpYazxVYW1z0Wj5A4vuTZut+DrytXuldr6xx5jR0pF2RjOQFeZcKyOw857tdzUFHJz7rCLh3uQ6LqQr1IyMe5rY4CK+sUrVW8LYwvOxc7rnJzbi7y9+cOaihr47rq2nrsi+vs31IRabBGYWoOY6CXJHfsW2IG1t8OUPkQiyMRoETULlWwNyDt/6s9y5AHyzKqFnE21O8ICWimwp/OBP3jLMB6H0EfbutA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by MRWPR04MB12354.eurprd04.prod.outlook.com (2603:10a6:501:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 10:13:21 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 10:13:21 +0000
From: Robby Cai <robby.cai@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com
Subject: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to IMX8MQ_RESET_MIPI_CSI*_RESET
Date: Tue, 31 Mar 2026 18:13:30 +0800
Message-Id: <20260331101331.1405588-2-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260331101331.1405588-1-robby.cai@nxp.com>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d84a10-7844-467a-ef29-08de8f0e22c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hecb/c3gcsza1t1+/h63x1MSl27aU0itO+bASmP7Sdtlzi10LaAcFSyWOs8B66u575/TwPavGP2Hp6w/CjDzqczeJ2k6+csMJJGxV9jNKsKGtLFMSHl5ImmSO60/44Dba9p1OAouDJ1P6j/x8YKx8zkc7KCzbPQofdpN6hn6AmS4MY2mBbrcYWQEw7zDo/Rc4FafTU5Tw5f0lna9EmfB7H0pbNkEMAmCRHeMMszTg037WidYHGQN3WskDYD83F2n+knOiDZGFYXYJ7ptBApapXXrHUOtdaAko1YXOSbKBy6UZZwzhEBFFx7JQ8O2hFd3kT3UfQRvrLJqI+PwEPSoBGC7uDwJQZ7KQbgbUle9kHApUV5Xw63LzOUsmvUhyDHi+BzbXOkwhzerPUnV0C4qaCSFq4VEX327j6hZ7cN5pT0I+zNgFW0w7F+RJqyGrCmMPAp+JhvHMwTn/KfEOm7mGqhq1eUU7T4WnR4BaVSTcItdYqHFJxTKNxSmdL2YTKUfcZXY6OVpOhmWzYjHiKD/5uE7erDKaMtj7d0nUaV2d4KiTBRD5+Cx+dMvDRpRcpUw/QR4vkLz7ECZFFLmwAYRcpIuVGpGCKj68wogfo1yAsaOuEQ9dPqi96DOjyqqSTo1e5cWNgzXS+m8f5cnPEgcf57woWf03zGzCopsw+hfDH1Myw018l0jx8exocDRN2DaudHYMQhWmzBbhv6+FcaA47r3XLqNpen1FIYjQcGhLdEMM5fzH8kAJKHat5C4hz8BY8HpPWcRoHHAHRXolrHPTnobzVWqTGvvL+N5mIhwtWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wbIZGJ+xdqe5lRPilLgqMsvO0qMJLjxRhhQULNypot9ld1mB2rBYAVLU/sn0?=
 =?us-ascii?Q?n72nk4c0TK8jAIAhWkfBMdX720vn64xpfHNsgIFxwJK+FzELB2bOgr3L5vHq?=
 =?us-ascii?Q?Z3X7kpcRFcJvbmsNC3AtLYNiM2Dr2p84X6Ca0Sli6dFi5caBYepHHeEzIhpE?=
 =?us-ascii?Q?31pdr3bA7Od2oLtRGb+3Ek7yFTMxAwymLd+Uk47dyXnnFoNHEgMZGPPYxaSZ?=
 =?us-ascii?Q?FCcGeautG6PXEZRCcYUnotXTEytw9ei3Xzxk4r+qObhZEC/SoiXsMnHE1nIe?=
 =?us-ascii?Q?GqDsyULTNU5PZvZKjct540s/XAkDpVNkY35fOAKBBJxOe8S1BgTC9Ust0ai+?=
 =?us-ascii?Q?/5Lo3nHbhPL2gAvqAEYEkFUly5uCaH5EgbC/uyHsexsrQpmNxaAFr6RQyKZJ?=
 =?us-ascii?Q?FVGqfRu8dOyI7GrLHN4/Y+jPt5eYQSs8wLNfJr6tmFjcgiByf4nYfnOsEeXq?=
 =?us-ascii?Q?Fh4mCZbvTWEWpQxZZJu2mYEqewMfeVmAx7afm4mdnZghC9yzV07Rusm3FrDs?=
 =?us-ascii?Q?nfvPEgGdr1veSBjUoBs6xep5REjG4C542hICDu14G8YQVIPLqowISprxu7Lj?=
 =?us-ascii?Q?/ByMH6nBK614Ng8o34BZDQk/8ctwLsLKCsK0Hjabfuly8h9dJqsT6suIxhvi?=
 =?us-ascii?Q?2tEaoDHb3bKEvAGI8RVVSgWQUEJN0PNiZuYA+6bqU5nz9BbHU2GF8BHtxywt?=
 =?us-ascii?Q?aK6EoX0F+E/Pd6qgn3eJ4BTJAiuques+wCxvVSEe+gkGRKBRgvhMKqXIn7GE?=
 =?us-ascii?Q?Y3hrnyGdoQHAsCE5eOiux2nOlXSVfHdTW3oEZo301L9iodnCu4DZuS4NbLTr?=
 =?us-ascii?Q?plbvI1mH4/X2CP1S/Lm7fsdE843pW0REU4hl4z/MoFqXULD+47GHyYv/zyo1?=
 =?us-ascii?Q?IPKp/853f0hSj2WiC6VqnnMBrOX7LlekCaKXVs2brJp4KfkGQq6vfFObFh/5?=
 =?us-ascii?Q?kkQRCCGnBShty4pjoE//03o5RkZXviYXI4xTydxhvO9ydCThDtPO10gI/aGH?=
 =?us-ascii?Q?Lb0myf3QDroYHPkRxrBTl9Pbl+QeVPv3UraghYK0knfmXKKzlXSIPkVl61Iv?=
 =?us-ascii?Q?AWfIlcu+Mb2DlIeyDiiy/vFfYTSY/xtSGeqfEp5mCnMfXssD3P1fEpYcW3TR?=
 =?us-ascii?Q?NFHQfcQh44Bm3nCn53BH0ftp2n4FdO5euLqc7EJyX7vbAE5Ys7bBv5OvIIMY?=
 =?us-ascii?Q?Gdf3xmiTPFiHmUj+szVvrO/khNyCIy0Hrj/P6FOuAYB7P5LFnVI5yf/pSrIa?=
 =?us-ascii?Q?x3156eZy5G0ALcTNNDz3yRPd5MkvH/7QAVPrlEWN+72Mp6DYbZnKIPrfNjKp?=
 =?us-ascii?Q?FajO3b8jKEtVq8vhjD74G7x902R9lKZqU7iRoE63xslaBF7sQ/IZDWSFbvey?=
 =?us-ascii?Q?qcTcnDLpe9VMRpgelm5l3fOKARqZLQeVnQ3whRHXMMLgaQ9FKTf1zFOp3p/e?=
 =?us-ascii?Q?K8J/I92xSviFauXuaUKyrAcJmOCiA+CNtn3q5mhiYFDXBAi8Xv9BuK0yK8Df?=
 =?us-ascii?Q?NQ1m8nNfQMMSKjIXctU4BCauZMNeyX9lVjtIedHFQMV4UWGmMhRjyc415Jt+?=
 =?us-ascii?Q?c2wDHPGp6FNN8mq+csuLttiFy8DuGmzAyKHkP/Bem213bBfAOX19QT2rcgQi?=
 =?us-ascii?Q?3yzEqu/jF0lCd5cjib1I0t+XPHP7Rr5HNBKdFeEUHBn5na2YX6EGDnteqtbu?=
 =?us-ascii?Q?yR2s3enryleqg/F5vCcjO/XEf6VzbLsY33P9wxf7Ng/agBiMujlhVxlzqoIy?=
 =?us-ascii?Q?sWkNl0p5EQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d84a10-7844-467a-ef29-08de8f0e22c2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:13:21.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mr37ia+LyYnR7edjT7SCL0RfB3tUkYyJofKQumP5nZBoLhi6N/C3CUec9BXUQd5x0CeHlWwtY9XfLsg/4BJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354

The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
but the existing names do not indicate this explicitly. To improve
consistency and clarity, append the _N suffix to all
IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
compatibility and will be removed at an appropriate time in the future.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 include/dt-bindings/reset/imx8mq-reset.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/dt-bindings/reset/imx8mq-reset.h b/include/dt-bindings/reset/imx8mq-reset.h
index 705870693ec2..83a155dbbd4a 100644
--- a/include/dt-bindings/reset/imx8mq-reset.h
+++ b/include/dt-bindings/reset/imx8mq-reset.h
@@ -46,12 +46,18 @@
 #define IMX8MQ_RESET_PCIEPHY2_PERST		35	/* i.MX8MM/i.MX8MN does NOT support */
 #define IMX8MQ_RESET_PCIE2_CTRL_APPS_EN		36	/* i.MX8MM/i.MX8MN does NOT support */
 #define IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF	37	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET	39	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET	40	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET	41	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET	42	/* i.MX8MM/i.MX8MN does NOT support */
-#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET	43	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET_N	38	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET	39	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET_N	39	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET	40	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET_N	40	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET	41	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET_N	41	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET	42	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET_N	42	/* i.MX8MM/i.MX8MN does NOT support */
+#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET	43	/* Deprecated. Use *_RESET_N instead */
+#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET_N	43	/* i.MX8MM/i.MX8MN does NOT support */
 #define IMX8MQ_RESET_DDRC1_PRST			44	/* i.MX8MN does NOT support */
 #define IMX8MQ_RESET_DDRC1_CORE_RESET		45	/* i.MX8MN does NOT support */
 #define IMX8MQ_RESET_DDRC1_PHY_RESET		46	/* i.MX8MN does NOT support */
-- 
2.37.1

