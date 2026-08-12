Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09964449B1B
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539666; cv=fail; b=DFEq8HgrVe2ZYgHebuAh/EL6BdOUO58H5Qas1alZpd2zBYXMK/EH1XuY10jbUxw4WSbZr/eUo7yuuYcgqXsoVrYbTfycMjrAY0Khr9PeJN+pEvLRm4CxrbkSIAi12zQN60F5NnT3LnQ+VheTn79GHP0abuOvU7sJFSOiX30b/9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539666; c=relaxed/simple;
	bh=3tE/D4PTJfRQMbhpsGurjjIVQgTM8ZyVzmd/3kh1Sog=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mlNeBa4yL35rjCZTbQZ/fcPix/Y7qLtLAD1jwRbbRZlfIDQHfROPv9aDHVEisHYTAXQmxKLL3BobfCXsahPchZiPTFf9fcT0tfVwolgryBmubmDmHVh7zz5Vx7wt+cZY1MDvOdv2UpXvXFFeBQiWwew/tzpcNSsdrEOxGpc+c8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TOp5sTRb; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TOp5sTRb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMnRGSJP4e9097ehWQCC78eGraTcZPXa91JpUnjfrKDHNO8rN1lHenJUAjaggOUcaTz37IHDjr2VlmhSqT9WzwFB7e61hKQ/qnkQGMyHzz2/IgkBqpjNqMouFtOpYEB0emy+sz+azkIgBpbbH0i5vqbP/71Z8jDL/QUilhZNrcdsm3VpOo2aLlHLX1PLfrJ8GLZVlW8mLNJFJxHAb79F1qoHM359F+QdyEEu1Xraqel3BhCDoR67+5bPOyYt8QHiUoJoQ1xLOifJSd0y+TIbY7+EmfVymnIs+3uwJZVYoFMNtv/oWyL7WDmMaS2RZ5osF5Y2xHN+dS+KW+K3L41NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGYL1sfoy6vKkqPl6eBgNu/2sMjSGE/K1ftX+coq74E=;
 b=SNtGqjQr+HPPC91QkqQQADxKC0866W1kpBSbW6zn0xrnRtCdlcpblDEeJiRFV7GIT/Yqt2yDkqtdNBghQB4wOsbdH7zN/2uRj40qag8+SoY1mw1Q9Rsop8ojeeys89svNzTseQj96LfBDEqNnCzEcDpK3jrSyxSX40eowGg7rrXAk/iXrRkYY4QJLU8R74wvuWQ+otjto7GsOvyTNxnv3xUFTx+aeysNPmHOtNaJvLIzDwLqc8vfYbc6PU9SjJ7j35FPXCbNuR+TR7ToXy+JmoSnxrddSzia3fANs1Omh+XbSoOlb99Bu98skRVCYnCqB8igN80dXvD4q2M6kFOl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGYL1sfoy6vKkqPl6eBgNu/2sMjSGE/K1ftX+coq74E=;
 b=TOp5sTRb0GB8SROEHYpHOrS2EogQw9R5w5UCJWIgWgR6mrW7XVtiBnmbyj0bN8UfdH/ylGcPkk1qiKV99b6bpiATg1PISi6UirB6iAlDuTNWxt8Av5bIdte/3y00fXQvDEFKjSMQ68XuvbIwtpgZ2ZWg4ZgDcohvYq9beWPJ2KWc8smR0U8KkEEeUk9C3RbfCINzALktxYu0okDHMfDXo63qALCNCLDBtRvngNLmSeYxBTN6UcBPIwJqNdbBpWViBswe5nE3teEuFDoX84WtA84507ytMNrbBqGz+JolLd4yDln/28VqTQKBYQXIDTFezhKBvRdyktu+dWz/k8m/0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB11756.eurprd04.prod.outlook.com (2603:10a6:10:627::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 13:00:53 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 13:00:53 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	dmitry.baryshkov@oss.qualcomm.com,
	nathan@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Wed, 12 Aug 2026 16:04:21 +0300
Message-ID: <20260812130421.670527-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0406.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB11756:EE_
X-MS-Office365-Filtering-Correlation-Id: f37f58ef-3cf9-4f41-43ba-08def871bdb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mbERusQqBXkGWT+j+hM5Eo2lRyGzaTI+IW3xozWVsZjf0aHEf6yPuUz+ZCibHExwEyz+A+89JGqYRusP7D5fYcp71DuacOnCjEKYYRJC5RmYcau1Q9fi5Eiq38MAJi/fIcx35Z/XS7fcDs084eHiQ7QdYrnrGH9BB3Gc0ryv4lHTKVKwlGR/A7HCGfOmjp+UYj5p1Bt6fcz+hzkQenEJtmz3jfIGTcpYPMgR++krFFDdvDrjQj0aC1WXbS1aB/005BTswCTu7N5ITjtEV9r9PAGTR/SfQbpveZeUyd0wSYP+it66qWM/M+/NYtL1UQXgpfwuPw5mSjIi24KSe9u7xvwLSML6ky8wkajYIPf8FNJRKkhA1CE5BBnBZELkde9dQfagSQZzzrDL53BM8BS1m7uHmzdMLvgQ9DuggfqiqrVP96/26fJ/0gu3PJ53NXbQWBmYI0JyFccjR8o4+SXfcRBmE6qSueUiYOjGnd3uS/4thyibRYGs6Qc0JnibB/Bdj58rt4niYwUMQr1sCBqV2car4KmvVWVQCpcweMCYC+NxpJOclyLXnYaJVNshQ/2Ao96yyQ4oiJJ1q07kiFAdqVjknsvQ2N2Z21IGBMzCDzmiGFfaZ0hSp60Uklw4u7L/O6GMXieiaLTb02Qt1MvP3VGLmVscfh8vsQnHGMvtcNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0tsv1w6bYIhAOEPTvxqsyBKxQmNEFUKT7lS+ugddng/ytQ1wrGiBceelG6bo?=
 =?us-ascii?Q?INzfUVpye4p51R6m8dojBintP7hGN2RbufSS9dDeirLipxYB2kaOdejsrIAY?=
 =?us-ascii?Q?BsnZNGwAMk/EZLVBXL09M5aRqrc2iXXZCw7PICKkMy6e9qHbH2aTWwM3gZ0l?=
 =?us-ascii?Q?frwU8FG+Wb1r62MptayluWdy8DrjUw+L0AXbyNXErc5WjdN9C/xIFqMfYXqp?=
 =?us-ascii?Q?VmnTy8sxtccKSLScwkEYqu1wPY5ttDLFCIOK++MzqpvkWPZT3+6gkCyI2fnm?=
 =?us-ascii?Q?zJw1JPWD2u3NrLA4PcWbXERscdBNB2IwYOy4Q1Kffrv+X4Cyh5aIf1n7Gwfs?=
 =?us-ascii?Q?Wcjy1TwWFos+Bh7dIQoOqX4S/GW900mxb6CyMFpayE1DJHcOBdUlZ++UT0FX?=
 =?us-ascii?Q?L2Rhcv26q1kjuGpVmG04htlSkb0xGJrNfC9rDz7eoaSHVka3TVfc7FPc+QC7?=
 =?us-ascii?Q?wJmpoPK7YuXhh7fRKf40yZaAP7XPP7h0gaDEm3EsG0BTbZNtVxzKO2WmEiZk?=
 =?us-ascii?Q?SR+gk7Zw/fd9h/Vlx2OqZFEwUyLv8pUJ12M6JCLTAHXZvN6WTPwAd7r020hQ?=
 =?us-ascii?Q?RC0lu6BDUSxib68zunpBPqNM1ZC50MwsFtZmvSlo2JyO+1Mb1Q51QRf9WDvx?=
 =?us-ascii?Q?AA0uykAnM4zX1BfQrjTuKAITd22B5M/6MjsXaEFILZPssk1u/H17FbYIVJeT?=
 =?us-ascii?Q?5s6FcEX1OaqBR+cfuAiRu04d1vWau3vOdr2V4POGIW0318iTr1A2WU9bznto?=
 =?us-ascii?Q?IZri1jcJ1ZbF2WcT2w5Q1p7DT5sAjfAB0wqKJ6p1OuYkF6OxHy8bKcQhWxfL?=
 =?us-ascii?Q?z7zkeA1FH+Dk5x8FXkXCiUkmV/+PKL/TupaEsqalpwGNqdvxJ/a1YMC/JdZw?=
 =?us-ascii?Q?Mp3rMyJjcin6JaBcObG4EU4gshZTHT09e1F/0DjJ2epTHXlCF4FhHsu1oib1?=
 =?us-ascii?Q?hrWAzOJIeh2ec4CUP7YCqoHoToIH/GjHDEsONq1KyzH0qiIdppHQSNLd+aUX?=
 =?us-ascii?Q?DdzI4Sj6Rbf5VZLd0Rm6Zwj5y+hg4Av77cYjkWtgfjcEXN0QuRvGzFnOXqAX?=
 =?us-ascii?Q?EPywHDYjmcq8DkWoV9LLPNo6QdDMIVephm5hmi8wW8omG50N6WM3LmOC9siG?=
 =?us-ascii?Q?lSVVkbE7Vr6SxWatXGPYM9TMa2zeMYiJ9lkRCCD4p1hXlJ5c4oSzVo1PBhLB?=
 =?us-ascii?Q?0WNr9Ph+aoVlrslyPQKOkCdfQCV3FB3ZEnKG83JGB2Sp4BBoDoZKayaNkA4j?=
 =?us-ascii?Q?CpjCFNCnkEMVheC55MjUmScby74tgrk075p2E81gGI91YsfHCVANcRA90PKI?=
 =?us-ascii?Q?FzwtZGSZZ0ucNt0DG6jxdIUMd3tko5KJ4sVAjbmxN37vCLZMjbnS+TxT7MXa?=
 =?us-ascii?Q?2vGa/xV1KIUhOOsabLmF4HYNUQSwK8DJLQVCbfnMQ8XuIC99AZZmq9lXQm/A?=
 =?us-ascii?Q?O2DoEf3GSTcsTD7ivEQGqAraVBiusxyFWNQbSXtiwdCCxXXlei8Gxs3GFj7B?=
 =?us-ascii?Q?0xld+rwb+D3BPfaF0jASyg2N3kpmxoRwef76Fmc+f1JsSzYsY9973uSc+vxp?=
 =?us-ascii?Q?dMXcg/CER/Wb0TcMqIeV9FdRUwrjZCu0U6PxYiuiqkWiAoE+fsnV/2TzA0tx?=
 =?us-ascii?Q?V/XMh1qHOsdDuL89W5swbWIC+3if/dI1zXZf132CDn9NuPreHxJz+Q6hVCJl?=
 =?us-ascii?Q?F1IYVBkXxVh7PVfmU1aohZWvJ0a9+Kd6TTnaxsjgOXXHmTScERcfPh0TjIMf?=
 =?us-ascii?Q?QTVTF3pXUg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37f58ef-3cf9-4f41-43ba-08def871bdb0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:00:53.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55ZPXhPnYaU/TKXddG9GrhoBGKLNYqQkGrrWfpFUQ5ANdyJqFqNoZBDP3K6EhEKd0PjJxd8HJ0F5rGi6/w6Yng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11756

DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
causing a link error on non-Qcom platforms (e.g. SOC_IMX5):

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'
  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
      reference to 'qcom_smem_dram_get_hbb'

Make QCOM_UBWC_CONFIG depend on QCOM_SMEM to make the requirement
explicit, and guard the select in DRM_MSM with ARCH_QCOM && QCOM_SMEM so
it is only selected when its dependency is met.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v2:
 - guard QCOM_UBWC_CONFIG both with ARCH_QCOM and QCOM_SMEM otherwise
we could force QCOM_SMEM=n and still have QCOM_UBWC_CONFIG=m as reported
by Nathan Chancellor
 - Link to v2: https://lore.kernel.org/imx/20260811223622.GA934543@ax162/T/#t

Changes since v1:
- (addressed feedback from Dmitry) replace adding static inline stubs with preparing a better config
  dependecies so that we use the qcom_smem symbols only on QCOM platforms.
- Link to v1: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj/T/#t

 drivers/gpu/drm/msm/Kconfig | 2 +-
 drivers/soc/qcom/Kconfig    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 09469d56513b0..1670dbc9464c6 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -22,7 +22,7 @@ config DRM_MSM
 	select TMPFS
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
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

