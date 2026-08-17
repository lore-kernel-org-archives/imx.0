Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510A40F741
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969940; cv=fail; b=dXMUsxc0C2sxQmgMRsejnqgkrDtYfEYbi3o5LDkwa3oyu3aTv7/PfX79sZRc1QZO/swjK1m1VC23zu1Ak+VTumNls+RXaIQheLRlrGQuz7bhxxfYZuYLhXS0lPMFQnV+bq8JrJ4/tKSj8Tret3EL5wndN9D9Du4wnW4pdhLdAFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969940; c=relaxed/simple;
	bh=rhIBa1agE0DWSBpURVu0l+4ivnedsguI6JCQ3nXvmiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NHnKX/hERjh7HVHshRywOCkqOqIB/96yMyp4HIQfuw2QUdePlRYPQWoZU4hFXRXjjO9AJwr0NtGNyauetzO3YMh6gM3yYpGXothcsjX1tUO9+YHa9/6s+v7niicNrcGPaX1f0cmN/f7gBT5W93vrSxPFoNnBnVJTvOTQfeD046I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vsfmcsmt; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vsfmcsmt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3iwZF3PaTKkj11oo7h40LqRb8XuTk/eiuTpq8ay4JoEaEjdWFoMwBbnWSUVmCocCPHBq6qRnQD6yNJVvmTijSYPtAs5YcA6bYupQNeEIaMePMXkODRhuJXt0GmxH8knAVOZ5cXbckTF0v8HK6inXqiJAAnD5LdmvaIYtEb7FC9unk2IBjF7Ri00TLO7YGHIubAXU+qJmsm/Xth71QTWXpzn+RCIRDE/JxnNeczp1sFp+Zm57UrYPHxGyj4lnh4tsUaLuboGN+TJv4QNkTuiLS47gSSvWz8g3ORRK3SpAdDkEOEUBNOhrODek8T8pVtZa6xGqw7apMx9LUOaBBbyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRiGO+fpBLweac5SUF0p20HuoP1+VabdcXZsDRXgfhY=;
 b=IjdCYWOQKNRLP11Dufbfv8QasI4irqtQlTDsM29sbvnky1KRMSBM9JF5U5LxqOI+2sODH6Uf9io7KzrrUjmip1DkltdK8IDQcs/d+8zcoRbyqHlB+60opxnrExAbwh/docTKuinDUjxDxQfx6YPfxZH86PSC/VAEGmTATE6WlR7Mx1mU02TCYNAtZ0unXkoaQ1oifseUAPL6D//Uws769UwnYbAup/8BC84lSB9NEgclItTVGrRRjr0BqbrWridiu5NWMvK8MORGMVWWd3WCZe+MI+g+hUFvURCk/5MHCPZJS+XCz+YIYxVcceXKkXpogty1sYMhHEAuxp8Spgbe5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRiGO+fpBLweac5SUF0p20HuoP1+VabdcXZsDRXgfhY=;
 b=VsfmcsmtNA4ls9c/euWNqQuzoR9IGTWB6So/qdjT9KyFzC6abvbkfPZLH5jjaUbIim3cWTx20sdexIw91WfJXmypHX4Rm0F/Bx/j+Uo9tntlQNyPwTanK0l1pGUmJF5oDlLll8d8QkKirWWMb870IzXZWQtSvlzHj5Vj6U6jhh+g8uGZamJo027ENdCy9D4infnQjOGka2NHgPAwbjrk1xUbXozC9SxcpSHnbGR9duBYfBiZkwxcLw+C6Ksxe4cXchTrMPTfuE60sA57EeyVY2ejijJYBNBfmK/gW0aMA+pNG5Uuh89ZrRHbP4JJi1mITBOYhTxezCfZyCfVZFdbcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com (2603:10a6:501:83::21)
 by AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:32:15 +0000
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e]) by MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:32:15 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	nathan@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 1/4] drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
Date: Mon, 17 Aug 2026 15:35:38 +0300
Message-ID: <20260817123542.48475-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To MRWPR04MB12331.eurprd04.prod.outlook.com
 (2603:10a6:501:83::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12331:EE_|AM9PR04MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 396cfac2-c411-49bd-e347-08defc5b91b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	frOoP/eoSxXXtonOoOdCLhhUPPzD7PEha9PZV0QKvPD8E3HVFoQBAnNiPf7+2WrDOTu7K0+ncOQUqJ18u1EH+KBr35vsCXsXj2MQoKJwnhpLxpn2mzjee2Aco+sETfNz0OchvN869usGxwKaoZiItG2+wlI6baDEMNX/98gZkBDOgwzuuzj5pUXh+1pLpdbZEuBB0u7KdKykUIUfmjCBEkdRHOzqtKgv6Vjzx/qkBADZXsfzbmSpQ0lpxTvPnHP5tVGN0qjFYIKJw4WYKcUfUt5DyISgtoIZSB9vNK79JvlLt+8xZreon0UwsFUdu/LRwURvBLrwHh+s1Bg7sKMmM55fRNrqfyukAIXNB05CuSk5izUfGckbhZ8NivV/CspOZ7DQp1TJWACoW8jmsNW8esOm+pU1/q0MHoDsysODjY/CFdiFEgnJicSPeIJRTdf3DuxOlMi8icF5SQG7ce5M+IBLG+W0ENfSLTVzVpQF/+hjsTrq7nI0MzJzfrGeR1i7HzYCiRUL3QfP46GILTkqagr8QjjMoLF1EBL+swzvdH+D9Ovs7TwMnCU+tHdp0SEDGGj+4cNQ3Uu8b6tbkR/xIs+txr7EBaF3rpchopmGuD28q74ZEHnd2EBsccTYHJXp072ARxaWVMe2rLNWUAgLBF67tLbo8Mh6JzN5xwpin64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FuEMZc7cSiP3c1f/i/PkMqVvCQDo8FawH01cuGXYD5IRj2nCe8vrDhkbMum?=
 =?us-ascii?Q?/q05PQkuNhp4tkGnogpQubPpo8HiRU3HUN7p3LuhJbFScvvSPtWaACFB2NB2?=
 =?us-ascii?Q?AX4/3Cq5DKcGnEWUHI7ogdV5T2f8QLgjagUQLIYJQVf5kIO5slNYA9vSLtab?=
 =?us-ascii?Q?Mi4Kyob76s4+1CczgpPH6kyvipiwzJhJ2caCZW/uHvCqr6mlAnWCoNW/eGmm?=
 =?us-ascii?Q?DYVfCvabJtG1lpdPbu8pMJjRMwbl0pMGRRemgtknQEeg7RA/SZcxN02SbaL3?=
 =?us-ascii?Q?nHpLA6VJBHQX5z3BIfqAXyvmLc7KJmuhAesP1EyRwGYYvwA5E+Wc4RH5nZsR?=
 =?us-ascii?Q?ZOAndtjzy2PZfwk+c17C4By38QLL9P5mgcHvxDHbb+ktlzJdittOMz/4sqpR?=
 =?us-ascii?Q?UoOTQDDLLBjPQmonUvMIASPsHxqOrFquT5Jmhc1ruRImk+lwJym3yTn0/s4T?=
 =?us-ascii?Q?egTUs4C8xthMTPHK69B0CBSsN0B/B9VPT02m3tLcGnMjSHImA0CNI5dGFagr?=
 =?us-ascii?Q?8FHr5rRSuRDHXjVFt6uHY/gd7EJMV6HSNACzcvxGWxX/2atsrmi9iLWmsrA7?=
 =?us-ascii?Q?bqwFd5El42HQ4w5p+0gDuNTe2Ys6UA4hKLjR6WKSKu7chxdYQSrNbeQu0f5y?=
 =?us-ascii?Q?gggXWHuVj+mC2MS5LO+5TnI1st7P414jgU2t3DK7ZER35p1qbuyUCPSxjRGv?=
 =?us-ascii?Q?y2L6BKoofQYto7n6leaJnu8IoOD2UrZz5tGyXBJQfIch8VBjszuZ/HoyRE2u?=
 =?us-ascii?Q?BiJZHjLRbO0ZEGjLqLg8a19lMLUyBw+tqd5X5bgmvgW34LamAiL9vUC9jgVa?=
 =?us-ascii?Q?JGydigu8VY4R1dhuEV4MjSSJrl4/GpojLCjOHzf+RPBKXQXf6B0Vgr8+U+un?=
 =?us-ascii?Q?CJWIcHVts5JPl++Ha0szm0HSAH0yUcCUDRRhez20L/WhZYGBh6TLCNDm94jV?=
 =?us-ascii?Q?h/UztFfB0DklDzGAfEyz7PFU3+glazv+laHzICG6/8xf3tTigAj4xYuHKTVR?=
 =?us-ascii?Q?kpyfsh3EpwBjXjB4ljgF6fbTwCPa0EQS69BvlF4qxFEDE+H4sa/UpRmZP8/V?=
 =?us-ascii?Q?0Tucd3uLKMTUNYhXwgFz7CZmZenvfb/+FvMNijViwVA2jeenOASybUCWA5Q5?=
 =?us-ascii?Q?ra9LvCWOXkkNWzdWVD6igjwFQYI3eW3q08URPCt34acBdpyTjwfjOFWbGlsh?=
 =?us-ascii?Q?tlNA8/b8FVlftfD+xZt/txO5zmab7vXTy9Dv0VVL4D1+fv6CqxojNSM4SpS1?=
 =?us-ascii?Q?FahiRbQgUMQ5UM4eemGPH/mthLFUnq7wGOBdkTH2FPXlGJra3AXwm25k1x2t?=
 =?us-ascii?Q?VsMw8qyj0BeG/6cT0XFRc780qAJIwltWg7gzWn8NQbwvu3ewH8cnsP7rNTZC?=
 =?us-ascii?Q?NTNm21fvUgjRUGfXMV04E3k+/ywWG9GSQfw2kdZ3e/9UVvkMUqDDMjDFEwWH?=
 =?us-ascii?Q?H2kRUZFCak/GybCDmaemUVAzVt3R1gDTx3x0eP0kX5KChsLyCYnKxrbmHCTV?=
 =?us-ascii?Q?06ONZwR4mbHpww7JiEKwV9EMCxxJNQGlRYqcwSWwAxgtst79f8QnaYMPHvfC?=
 =?us-ascii?Q?p2O/qNQKyYz5ef44bCfOlD4F9TN/2emp1aK5k6U7LwE6AiGCsls0K5XOGpHW?=
 =?us-ascii?Q?bI4MaxU9K9hy+ojwKICCQZUmUk3dQhuukvGqT81yZWUXtB/0WdwSmgPbb0ON?=
 =?us-ascii?Q?2RCASE3U5TWdSQBN0apJ+EYZTGVFA/Q/iMrbCEWzukmZ8bWLxiXWZh9t9ywj?=
 =?us-ascii?Q?6O/Eoo8HHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396cfac2-c411-49bd-e347-08defc5b91b9
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:32:15.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaaeBciUxrOzN5A9rgcS/5gNuZISFx/EmCuQ87J4IjvwjdyFKjhJWuMc8MWlZGOG0SPnPpentZx0mNurxeKClg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8650

QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
select with 'if ARCH_QCOM && QCOM_SMEM', and add
'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
selected against a missing or modular SMEM.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 09469d56513b0..ed1c4775d1e92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on QCOM_SMEM || QCOM_SMEM=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
@@ -22,7 +23,7 @@ config DRM_MSM
 	select TMPFS
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.45.2

