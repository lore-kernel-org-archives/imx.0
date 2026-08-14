Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BF3CE4A3
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716898; cv=fail; b=erCwDnY94N7MAwdwvZilR9MGLsP3+SqyAvfyBahIoJ8QSCn6aFWpQNf2nMwm6xx53jZw31BySSNasbJr/94oqV/omArf1atYEr/M+fCXSSQkIqQNpfWOktmi1Ub+pJhJYd835gfogQtoaxnTlIaJA3Z06kp082yjdUx6tDg3ZoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716898; c=relaxed/simple;
	bh=Dlzl0G4tKB+O4leHv0JGRuUAFJ/Lv7jUl2VPDBfIbtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m4JiRF0yjzjUQ0fLN/GDCrrq3bWUCFC2IFhY/k0tn5SR2tsfOiLB/Kgk0f8iCR7l7qgiNGayhnfUrN5Sw4p5YO+Fff4gPdlRYgLWCtmLNu4F5110256VZso//nJsWO+kM5M9r4lpNmvkz1B/TyWweiOhJoj/BOg/W7KezCI3B9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=acbdZf40; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="acbdZf40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnmKloFSt0nhTbU/yi1rpn6C/EcQ3OdagI9V2A+ft7ldxbOd1jzyBmTiDp8Ez3o5FVJZ2QC2NnMmvaUz6z2Cx+GjfOPkqsUcocvb1vlrBgfajDVX3iNiL8xfFj+r16VHygk2gafrcFT5E2nK1PlOFWDzaSxVDRe4QGIKzaig90YsdZlOALBYNshitTgTaXqG6AzGV/1rvroYjjx1snCDW7czyXGSEn383vTQkhbjQZM6ZrNuhZo6gPR0vSlcXhgyYmouPljykuW783auBXOUdSpaHy+SbYgjMq2N8BBA7YNY60HAQA3lr04VZtMn7qpqKShRB6DiEPa5ze5yZDqSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJtcO8QDRGI+VduX/W5LJL4sEdcfGSf934vFAS0hVow=;
 b=QofQGx58ewcZ/M6qkenME8CsuviFCgGEmtNfnnxYRwjmbEoMHT78um8lRg31tYYRpWprnoe7e4pLJzc/aOf1BIPhONxnvpoqp1cYB6ZsETwgbMHux372Q1kWZy1/WwfxRxhgip5pJ/IEYHV6ZP7k5AfpXxR7o453bhBiY1bsdPF0F5a9Cj2Yo8ietMJeLHfxwIa0mTsAB5fvBtPgpPnBNJD6dycXZrjRvNg8iReoNNGHSZBeWrDxHAZc/ZEroC4EhLmd23S1S9+rl3JNWFDk2rYh4hLLE2pS8MxHq3s4GNmLtmuS8mucQpzoX6i/f71y4qJT48wmz61ERLqJAgHtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJtcO8QDRGI+VduX/W5LJL4sEdcfGSf934vFAS0hVow=;
 b=acbdZf40mthxa7EhObaJJF4Ndy3tg59PBi0JE2EeOuDumC+GrXZePPn5stbo9OJAenlVEsgoiwcVfAFNhPxB/aPUdvjZc33iLNd2IYQwheNuIz6TPkwsLJt/iYG9gRRnu5UjkkbNtziGVYwwYtXl8PaDxl4iudmD2IFq26/7LhVjmK9BUykoOpStg3g3A9DpA3VfcaYL7m0wuF2qqA8vWjy+LtBTSzCRImMBzNlVUPfroMvT033fHoB5DfgY6PlNaHvhbmoLJNGhrXvU0m2aZK1K+KVRrTa0ZxTtJ7O61Yrlz39XBhn2Pwy2UN4s4+NfONyAEQ7Z1tkeAr7UyzHZow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:14:09 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 14:14:09 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 2/3] media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
Date: Fri, 14 Aug 2026 17:17:23 +0300
Message-ID: <20260814141724.1006382-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260814141724.1006382-1-daniel.baluta@nxp.com>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: 64df2f41-805b-495a-e6d1-08defa0e4f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VJmnGsXNYBEbW1yE/J9xE8B99JF86J2EPTmv7L/L2cms77GaCmXt3NuwoTgeyTRs867SxIbIMxhWidpi24h8i8DiOSDfaKncmlQQUpxfqi1OyYEp9QbbKGA/qwPOmmc5UhstXX3g77ezkYpx7RIi0Qy/PG6k5VJp6hCzfWVrscJwvCQYHlYWC02vujCB+C2QaHdDsLhrN5F68Ri6C0TB3juyI1DbjEHovznL87n0VWQKuZDG9k/rCzrmbwyecaos/2rj1YGpNhqWCNwg1+PkE2u8p/7SsNAErB/cZ6hjhGr9fPPKSfIXvkCgbv5hJAVpIQAkekiSBNxmO8Am8qgi7msO8zkn1cvpN2FmzbmsljO2VUfv70qQTLzOHOBKHrSEJVASVcixoZbh5tFj855+KLhe45xUd/QhmuyNyyhXT2iDL3GxP/0O6yUQnu4KBjAcY2aRhLxZlU6CbDPKOL/pwU2QCnJChE23riDOxOQOmLCnmftMS85fvthfDOtMcf85aB5Ag9qDx5vlYjMplgulI3BRNGsgwlBYmoxo20MpJ9DyzkuRUJbWRAGUKiMY+T2/DX4LHmynvnoqV7ZJGnWQsiXojFluhkmt4Q5n1OqdEqY2qDr608bsqAuD2JosUdDEpF1PJRPxQm07iVcgRjaj1v2yIH6lKuk7Tz0OGNOvep0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V1dk6g3bjyYCniE+NnEewX1NP4nmQATfO7R9d51fxS+1pPt5b1sEf+wgSHHw?=
 =?us-ascii?Q?gjyH2H2mxV7zr6zhPSGloAMg8mb7HIN/AL2GcHbEwYhi0y4LXV/kUz/byI04?=
 =?us-ascii?Q?l/gr9q+FlkY4ms1WZXvIX6YMWBqEZKM7m3TF6oPTDGpP1vY7aI34stemTklI?=
 =?us-ascii?Q?YnsMzHGLmDIc5Edj64e7p3NsrWpvHJc8bJOozTVKD+1XFbfQLRQtUAmjeSVD?=
 =?us-ascii?Q?85loue78hbMtid/l1v19VIlilsGnEScbLaf8W4J2E9frLhTcFX0LFAEtaHQu?=
 =?us-ascii?Q?Hl/mbwFC3nBYCdozKUpHNZqReNc6lBX4p4hP6qakrQRbl+dfQUMt9RWB6UN3?=
 =?us-ascii?Q?GjZeQqWQ75Jh8+z7rP5D0VanZbgqLzRTKFWy3DJjx1DohljiIlRk3zXp2Et1?=
 =?us-ascii?Q?6lLgLr9+v32AOmTHUrxcBfVBq8Kzgv/BrLiTT6v3n6upq0LzLeMVNP/A2Ipr?=
 =?us-ascii?Q?hc4dxodJCsst5HnnfPS7X/pGvvO7Msa1cF0qY4rf8jTARznChCAF44d7jp+l?=
 =?us-ascii?Q?yrpPC8juhPArkrSTQGO1Ozq+RiAqU9Ex+U8Rlyfo4xvWkqEVxaGqz1aEi8Xs?=
 =?us-ascii?Q?a7U6HoZFfRWz3RNfwJTl/vBJWcQjjaGKmQR/USDlAdffJVkR2Pz5YVz2pC6a?=
 =?us-ascii?Q?o5NN/+XFXXxIAUyfbeXYA5MaxPIEjmyyuF/rZbp/djALUZQjtOYAvLYX4FaH?=
 =?us-ascii?Q?2d1TBE2VLMadN/rQ1MJyEPk33tUkG1YPOlXlAdivhnBk/TdD1tHLgNqxdQXC?=
 =?us-ascii?Q?TKrQIgENxr8w86zNycv/eg29usILUJalZXsmhmdjBOSo/ajKfKoA2pzHW+IY?=
 =?us-ascii?Q?NmmlV7Sb1S+Op0P24IpOMzStFisJVXhux7NII6K6U3yC5LTTGDIyLrtYCHnW?=
 =?us-ascii?Q?ESXibVrSk+85zJE3BOSOxhb1uPXl/6ocCTEegld67N8zpqH14FuVjEsq58Yo?=
 =?us-ascii?Q?nqUELtdCfhrupt/qye1KUwf8DEeUl1NfnpLPqQQrXTULHMFiYF4Jgz0LkQRo?=
 =?us-ascii?Q?Cdq+0e2uZC7rlvRrB+vED6MT8xpnBLar7KKbOz2pWv6W7Sp7qz0vFi6vMf2k?=
 =?us-ascii?Q?N/0L8j8W51TmGjyT/sgto10POg5i/UWQpFAIqVcleWkojuJwB1oldTfylUpt?=
 =?us-ascii?Q?Cl6NjPkqSGyPC86hR4ZfLnlAKw2vU8VOp/g3P0o4aN9MsM+WJblSk9SzG0Ei?=
 =?us-ascii?Q?MAZQ37GTyTm9weooc7EZeDEv20UlKEUIFJhH3hoGyJHWqNfuu8zFndM5C93B?=
 =?us-ascii?Q?wYkTjnkg2uBLIFwPsfkkwrnBNkNJrekZp6E2cONyyNFPPi8Qdzt/kMzAnaZq?=
 =?us-ascii?Q?IxrTI+qLEioTrK3P8oBFDbVWFSR8p7uiF43QWW2xvIOLk/c0VhtrioYxAgml?=
 =?us-ascii?Q?pNQwNyYhZkZNPx/NK8+JZtVGf9vMnfnX6QqvzTdVuo2bzmbItNMhIqxCBU+m?=
 =?us-ascii?Q?95Lghlp9+vWrpbUn+C7T5WctCZPnrUlXvQVbhVkC1FQ1iy3pzL3uryZL/wua?=
 =?us-ascii?Q?VjyZFpOz81BdNBhvHXeWoi/zxVYB7WCYnp14+UBudgBcEegngcPtB8kxww9o?=
 =?us-ascii?Q?88y3tR8w1WLSZH1qMP75hwRZftq9F74xxEGg5eLsRvKvHrz2+qWtmkj8kcvT?=
 =?us-ascii?Q?rX9KuuMd4n5shdD2geRI160M05ry27SRENfXpcdbzxDTNQtOEqO8F4EzaQRQ?=
 =?us-ascii?Q?6eTWHWlkBUt6g/CRvhp2By7BAVmwls7th7cOjajGrJTbX7o7LOQN0Kv0Ju1f?=
 =?us-ascii?Q?sTZdE7Nhhw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64df2f41-805b-495a-e6d1-08defa0e4f25
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:14:09.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDHCiRppkyGczylz61ub2G9Em6Oo6+oNbqp83lmbcJlJWxOfQ6Fd+jb3kz7aOH/ksAiFw03XXp1xgYsOBStMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531

QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
selected against a missing or modular SMEM.

Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 388c9bbc81365..0996213e71e7a 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -2,11 +2,12 @@ config VIDEO_QCOM_IRIS
 	tristate "Qualcomm iris V4L2 decoder driver"
 	depends on VIDEO_DEV
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM || QCOM_SMEM=n
 	select V4L2_MEM2MEM_DEV
 	select QCOM_MDT_LOADER
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  This is a V4L2 driver for Qualcomm iris video accelerator
-- 
2.45.2

