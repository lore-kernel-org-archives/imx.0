Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D643AE187
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461356; cv=fail; b=jOkrUuNGnQOIygu4uwcbXrTcq2zJdq/yauIEv04BLfFPzDqpRIezBLV9SXNFyWo1oCFZWYOOI8KV7E05+gKm7APLvU9qjNIorjedq/Nn3VX9LliGlMBHJAZK4yWYzS7D3KEt07Ub7rpSVb/UKsx7s5/XKGa6zDWke+ymPZ+bZTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461356; c=relaxed/simple;
	bh=nC8lZGMCbrbi4t5KQ38gPksRzfB5FXTu78c60oGSPQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hV0C9HA/S2GbxPRsY9QKSFU5b7jX2/YgTH3JSyL3LiPWQPVmDm9r8RvwYeKMWNFmd2OsM89a6QG+Ib1mdJ2YpTLOCTkPgoLFpm5eM8TPaAq47aM2jRSFnB1aDQgFKZ87RDe9R0u6bEkOmmTqMmbEQlA9ya1HY++AIfXdQ8UQOhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kt7o3WKE; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kt7o3WKE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulIb0o3kdO3fNlCDAjozpq4L5bZaC7TV3mWhxnicZMdlMc7BP8GJKf+JxM6EhSxMLFX5Iy3nrelrN3mPSBpenOzvl4EhjkoGgk7fSQCLkh5JAMPkSdw0llejT92wswc2WKBf2Q+1Z5+jpDW3eKoEWdaZBGlf+h5Mvzxt6gQfPYNWzGKB6Brk+UKiTvis0KsqBNXipqjFx3lSpXINvngcN+cmwxzDYvlUiqM7Pk7IGGlOHdQMQFbRUEK5Eol8BPAvsLJKjDKFr7VdhV2JYZd4hn6abvuW8WDC/NMplvo1VNa5Agi7V4cAsnlpyL6nqt/JAPCGYAF7dARAtcrARJoapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5yLz1AXRWcgyhDTgRFltIScPqp9xeH9hM6atlfaKEA=;
 b=AaWBT+lRxncuaUHawD3QCjg8GyOJFNVj5qArlf5xpOKZ82BO5+kLW+HFGutmbzdt8qNcbypgG91xEqVxiiXI3SH5p6ykkf21ypMCbBKsQXhfbyK4sLiHH8X90/gxCQl504yN6I7e8XIwKIpNfk3qdyiU0bVdflPSNG6kLrjSJg1lYfLR8blPalde54sDtDPye4wIJuqz4AJvl70N5oOCbOjbIFXvxkcMev9Vguefm9+N354yKCh2ULDt3Q1zPZIrXv600wd45GI19GwAYjaEJy7giu/FWkZOfuZWAtiIZbd+5HxYB78VSl0thumC3cRCTzklkPw536jxy6V3yiVdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5yLz1AXRWcgyhDTgRFltIScPqp9xeH9hM6atlfaKEA=;
 b=Kt7o3WKEJTRhRkPyHa/grCiCa2uf5newGiyPhEcFvHXRCEt+Z6WKONTpPWGOqx+ZixJqfyMzkmVKX9V9kk/0ATgkGXrDL2YJpAoJHmZNs5o5sa0tZin2DWSzgtkzozyfiWo6ROA0TTKHIAmO0mhhKn023bkKqIDF4NUEzwGnKKa16R4FKim8i2lRT+lrsjKV7OfLSeoywlb8Xb22yByncgig1lEEz5rBRksg1xQhLdJNiYX0aLBTh9YGKsCAxNQg5rWPp/zWg0DMe6t5O0ccJGHTwRUnffn2dcMlHqXDWXmg0YuJ8Ec5tcqb0nQroZqZqSgFDBnrr3KuSYFsHjRMIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10777.eurprd04.prod.outlook.com (2603:10a6:150:227::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:15:47 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 15:15:47 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Tue, 11 Aug 2026 18:19:05 +0300
Message-ID: <20260811151905.311267-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0415.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10777:EE_
X-MS-Office365-Filtering-Correlation-Id: 02240182-83ec-4476-a6a9-08def7bb6bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|18002099003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZyhJnL8GQQLwbSYvKNxdK7yIH2O+vgKbPEFfkDIHrlaeMb9ilkJT09zVwnsLJo6XJFQYN3A17l6BkpAq2/VTjIR1AyesjLWNoSnhK8Pm5/W9yaCSIIXF6vuBXhD/jSXghRGG/cAFo+EmTPdzgQz43tCnMdb3JHM86rfdDre2BOxsUsrRkVcsRNr/Tw7O8pO5ZU4yx8REHOn+h0JDhhGUMcVkYybrtu6xZ422yQycgI5MqUgaEMNQ3wsFvkMpjf1bQj+okScVVYeM3YRLeS+zB6JFXXdVnvDqqiR3R1+5Rgy1qOcSGgUAxhcKlLuij0KvOGv34lJDJXMNdKPKGCLB/Zkp1RQZtvUp3d+PPcDEtP1NkI25UOfPsfoFUDe7Ic0HTvj7iLYZs0R/gQXYL8DxFz69Up3DsLcvC1aBznbu/81Xa3B77R703Cz+JWul8BtnqRkEvfN4hLcqfdc0ZO0HWLuMbZSBHq0K2ZYaSmAO9sGSpwJjfPvxhWoOUPZgSXmTEy9Ae0J8p5vJVtqgMeNfgQ+VIwzOl2aJpiuGlBJbU+fGCafkQ0Z3Mqhl7ApHm+314Ks5HbSgKrhqManEvAh3KkA6pSi+7AdleA4ifgcNj5wGePuEQm+mDtUwS3JYTZS6AO5b9R8SiWAsuKWmPkiHjha2mESmqg2nRNLxYlE8fY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n5KBRMQn97mOza0+MCDPWD7hx/KJPnY+1Jn8pDS+OfP/IWe/MQON6Bdk24H1?=
 =?us-ascii?Q?dgEX4nneBMTETI/AkyuZzsnlDxxPyiXamNb91x299rz0rwjbYtFL8CjgBj4a?=
 =?us-ascii?Q?ckt4VnjL70KinHipEurojmuzZmxYS2itfZWTE4YUXqapmkWP2vHZkRsjPtlA?=
 =?us-ascii?Q?hg+ORw+68yGmRtU1OqRD6/+wLm34rgMzxyU79UhGn2gPQf6BanbJIlrGs0Qp?=
 =?us-ascii?Q?8B565+Me3Hny3L21F/6TBoKo2LbJMuLwCXETlfH5jDNSUSNmOz/6ZqFhxquW?=
 =?us-ascii?Q?iy7EYb66n6nTuKV0px0NejlKbBwquIItCrEcKWRMnUKmxp5tF+LifzpINjln?=
 =?us-ascii?Q?yZugN/vW2XOyr+J41ah7F3ttI+JBRBi1iH9FDZd1DLU5vSVr1R2lMYJ7Ugzk?=
 =?us-ascii?Q?Y6CmG05wkpaUkaXa3DV8GV7GlJdufdE1m1MVVSz7n1WhEVPQTr7kBNWl6z2f?=
 =?us-ascii?Q?btz3JgT6lgl85ZtT3Js3jwQkvDMnVBCIJPBd1YShUufh9ffAdE/PhgtKnucz?=
 =?us-ascii?Q?0Og+qcEVZuvyQ2dHmpKAfoJZe9MbpLN5hdLLKzttUR4nwGfYU4J8XYaSbtSM?=
 =?us-ascii?Q?lCiZSSbj8cBnruuM4kMoOqfDKr5c0Gmsu6NmxroVqIHm1HgqggKiOKUS2if9?=
 =?us-ascii?Q?j5vIWMsdoaw/PWjHm9IsQGyvsG6kCHklDnpt90a7bJyU7OqMyUxsVSgHNuQO?=
 =?us-ascii?Q?Jam0yFCSCksQGrq4AY57tc4tEfrteUJwm3NLWEI7pcyVx86c/kVtGanvXKDv?=
 =?us-ascii?Q?YBqM2sZNF2EX6UtFHeXukeLf8oP7mZuAaEzS6PDEwnZIEbWujGkoTcLctlH/?=
 =?us-ascii?Q?GYDJg3LtBWD72qsSy78Bjv5p42efYeq2Me/d9bOyYXlsGPcYjPjHBxP8zNO0?=
 =?us-ascii?Q?xpWbQ+p8ymS+WYdOQPIvcaflz2cH4EqYesn7he6jChAVL4EqxIuRMe1PCU39?=
 =?us-ascii?Q?TRuZNExQG1VJYMlgURDboPU4xxwcjDPpigCep8GoMnFVKMHEp127uCeQuRA0?=
 =?us-ascii?Q?EfHQSFe4TH1JSTZ56EMKFNRy1B37VzmMkELiHGLHVUtvNFLGhS72qfpUcHcq?=
 =?us-ascii?Q?4pq9LT+3dqYkcAskdsgMSy02Fo3aQHIOEZ83XlpRl2ebFg7QxyRnGZcd6WJq?=
 =?us-ascii?Q?MARckPHMa5sB5UVfiSJsm3YwUgl+1Wj+WJmzGkezxKrs8jgDIPV1MeE2oEH5?=
 =?us-ascii?Q?B2gRrmoGoazP4B/q91cIvKSoiun6ZUkXfq+6/TV97O0ByA8FZ8wiSdTJDKqX?=
 =?us-ascii?Q?jQ6Ytu0yvJep5tBRO/AD/UFUeFfVyD+Y+Nu8zB4TQtiL/1Ket2E0nO6vWByw?=
 =?us-ascii?Q?I7A5ZkpDPDbL26SX64c2nH6rqQvGpwbjijwEP4JzodrptzCDctitq3PRKLbs?=
 =?us-ascii?Q?le4yK30ZEA3zjcfPMv3/0Enu+KWESfzdLgfAk9LFel335cgYpEU8pyLtikey?=
 =?us-ascii?Q?tQ89y1bqpsIrLNCK8XBtA72euPcm/+60i90FQvZdI92I6hCspW2H2Uff5EYl?=
 =?us-ascii?Q?Cxjl7DPnBhAUMv66UVHB5eevcgIf8b36aUIec0g8HuYMCXrQW+7i0xMmcQhJ?=
 =?us-ascii?Q?4rk4N6isFSTommEuaPMjngEvXqTAng9XYUIKpa1JDD9whSxstV0NWCxWkn98?=
 =?us-ascii?Q?5N0lMjRv4WXKPe8bunTWZuZymBaZXIHhDmJIry+fOlQNKmFZjxwLGeuinVFy?=
 =?us-ascii?Q?uUtb0xZdhiTPaLCu55TOyHAnyING0phhhqSC+RhbLMqqmpCakKHoRO358l8b?=
 =?us-ascii?Q?9A472WwMgQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02240182-83ec-4476-a6a9-08def7bb6bb9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:15:47.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NK1fWM2Pu2XGyQ/5LgGH5IBlNStF2sytj6ga7YgnRhHN/X+3SKNppVXkEh6Vq4Ao5LR0XtGsIJJNPi7R7JTmjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10777

DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
causing a link error on non-Qcom platforms (e.g. SOC_IMX5):

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'
  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
      reference to 'qcom_smem_dram_get_hbb'

Relax the selection of QCOM_UBWC_CONFIG to ARCH_QCOM only and make QCOM_UBWC_CONFIG
depend on QCOM_SMEM make the requirement explicit.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
- (addressed feedback from Dmitry) replace adding static inline stubs with preparing a better config
  dependecies so that we use the qcom_smem symbols only on QCOM platforms.
- Link to v1: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj/T/#t

 drivers/gpu/drm/msm/Kconfig | 2 +-
 drivers/soc/qcom/Kconfig    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 09469d56513b0..ab3844521255e 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -22,7 +22,7 @@ config DRM_MSM
 	select TMPFS
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0f..e0629e9328c87 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -321,6 +321,7 @@ config QCOM_QMI_HELPERS
 
 config QCOM_UBWC_CONFIG
 	tristate
+	depends on QCOM_SMEM
 	help
 	  Most Qualcomm SoCs feature a number of Universal Bandwidth Compression
 	  (UBWC) engines across various IP blocks, which need to be initialized
-- 
2.45.2

