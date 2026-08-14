Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14DA3CBE66
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716919; cv=fail; b=KmqVmi0S5SeXKN+8/DRJMw67uCfkT7ANI5rc/9jamtapaDxtPSTrIP6S1QrMiCF34OexKSZqU2AGaDocChf6ZRF/cfy6eXEYeg0NdmutA1SejhDjQ8zjNF7YVn6pGW1W64JcJ9QIm+C/IBwI9Yv09CcMJVJDywuu1qFvEdK6d94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716919; c=relaxed/simple;
	bh=nf7J6U4d9ZWheIo6MtP3+6/SWsP6iioCsI02Juez5lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SfYRL1Ya/Xm5BQ7xApND1WuAKgatcDElcuaiQ5GYtGETMacmOVNRh1Q8EVorvOG2E0F1lvLUdCbmKLLKt4aAwz7cflxR5bNA9TflJcAjD1Lx1yYOIayHUxsMbmx4lp2wlCxPTvhcyhPMmRXQQnpnmghfA+sL8haG0MOxgyKILKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vbhwf2ZL; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vbhwf2ZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJMmQE73muPu3eJLSIGhDmiajI2lw4hvyZ9REmnQ/IKcN+8gyIZpZU7YhmlTpg02RfZnuY6GchKgndEhNR7bH9QH9/Og+q7QBWtvs8ri+O2gq/YHhKU0DdlFUmKymhfnXzc3iTcR5jetFLX9PjISkCcvRkg19QDkrSrn1RYHiLTmUaYAU4A97d1sQKxHqDvFQWufINsN+tQ13Eavg5FGKS8bsDJrkhuuow/QJkiErhaM2A9FNCh1Khcjid8GXacnv0M6MtxilxhyU7vAtbRxk7vb0pJyOqjprmqPETn54ghzm7JwK3WDzUkqFfCzFxantx5a8WzsJ2qBuSmhRByv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w8LSO7QsQyflQLr12kcHNsvjgwMmvqWDdBDtHXGiRY=;
 b=prcEpIz5jt7Jmz1A/8LWIzznUzcvbpBFVkQ4eitVM5qk9kFHP5537jsg9dus62MBKEXGMbs89gvXbAxBGUDHhaNz5AGffYsRWrUM6WvKh7IRTrK49/thhlig4zpUAWsyS9jF8CpIpnw1ecTLanEiWVHbZkCJEan2FBdYHoiTfWJio578jPhKAsrYlfJ+fIbqR+Vw0+2AAmOvpKlJpT19nXIFsYsdvB6bCLK23zkb7h7tfDFlLdfErEVOh62TXfRuhF1RuVYAzh8NEAOyB/0FsPDlV3lrcg9PEjZ8oUXlErevl3xscotfILVAt4+2rEHoW5qx1qMYOI1vNG4MzKwcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w8LSO7QsQyflQLr12kcHNsvjgwMmvqWDdBDtHXGiRY=;
 b=Vbhwf2ZLrgSkR8kT9VtY/OOavAQbOIoqORp8Q6Nbzr1S4VyH+jIwNQHkR5G+ktYb5MOhzL3AtJkl97iww3aEZ6dse6ULfBG9aSbqzCWDIJ3JBQxKRwz7sSA252ZGPG0J+8UddzDlbXjhJFBDWX79GgeGhVXritch+CCGoKb91rZw0I7lTu2bmBsVW1o9I6lfsrKiVxHktHSLmJG3ZH5/aLL5mZ5ZqrvphyiQDU/gQMLMuv3any/lnq3MiSi/4uGOcdwvv54G5XD+yt1++dThd6QXVCkpCN4xXvj41bRF2GGJr+AYSzMMAkofTKUo9vqBVZXpotyBnPH3blaVEx3hNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:14:11 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 14:14:11 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 3/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Fri, 14 Aug 2026 17:17:24 +0300
Message-ID: <20260814141724.1006382-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260814141724.1006382-1-daniel.baluta@nxp.com>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::22) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d2ff6b-1442-4103-7ab0-08defa0e505a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bq5EQwDQ1fFDJUW0+lwIPNk/rgxbWFly0GMAi0tOjX/GgcQBn9joCXUwFcZ6VRgjlIt3d4h7q4sfv2Pej6KFqmYucZ1kslr1zM46lKmJp2XRutYNdWIt0XlEx0NhIGqi/UfWH3Qjrm10LrdPPrRd0FjhSGi9G6ljhYOXeHFm4uyoOkOF2+ldhFNM8Zjb7Z1hU+AqYoNwlacC2KFkN8fCVuof2MSD9FLOJzSBhcg8s48Nzx2TAjyrg+e+wMhq6THae9D0IOIxM45owW9o+8cRk5mwc7ZqEsGLrW6OcVCryhYmd9Ecl/6ZPauzuRW80v13IwTlm8WeoxaOSHWrTjFgUIMpg+YMV0PolZbO4+ZxavuOJmarFAkKvO6gAa5g8yPmD4HkDRWwJNODtHZGKmSmiH8DFzbSYaKG4mlkGWtV8DtwgJ+JCk50PsHwMrGn9AYI1pymtVjQu3Pd2+vbhVxqw4n270RreMV99O+4ULEbAJQxQfmN7C/if8pec84/Sp0t++KOsJd4aFlEOrlDoqHf5Mjcq1iiNO7/9tZJYwFwxFN97dcS+PXurKYc/UQPWBmKkZbO/5SjLN3G3MHLvfcxV7kbGoAKNmVHNa0zlAwZ9D1mkAhVbeALJdL5ZUAaPLKJ5vqF+p+/V7bltmcQe4/1KnmVS6fsWunwMMuY9unn+zw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LwZOoDxgFNKEelGW4Ll2FUNpelQg1jKqI7VpZkJ1qKoyFFAztin8LNwBWJUq?=
 =?us-ascii?Q?5xOKAKw6bLExq7yGv3qBFkvESmw9xyU9YOLw8aSOeQA8BzrcuTZ3CIZ1JUq8?=
 =?us-ascii?Q?HqjWCvdBINu7jv7zgNH7i4VbsbaxlhVUfGRgrW4bfsGfpOmlZTEnd9ioEUrn?=
 =?us-ascii?Q?GFpA7b54Lt1BctGXyrntz/J0cD4ApSr4q2ZBpjUiJ01C/KW13DN8eP2cJ2a2?=
 =?us-ascii?Q?ewiFq+k91OuCCT/mwvvjaQGkAM1GxeRX7rYEZGjtFKz382B09cjSiTv7FklV?=
 =?us-ascii?Q?aqBztnFxrTfOG1W4cZUuw8qL8Ual/K3PDuLr5A3pMSLklnt0Y0OsSuoizxIl?=
 =?us-ascii?Q?CsLBVSMWW5X2DlG6A0LlllixPJ5e6PCif3tNFSYkpvdzdREHV9X+gGXMU0iS?=
 =?us-ascii?Q?gdN8DRes9+Rmea/9jHfdJzD1Z/BE5pTJxEonEdS3mPQ2yHAAZt+MEI8FZZGx?=
 =?us-ascii?Q?ueR/I/gNqngU6IijO2oqEZ3PxBG3acN+estWDjTJ0fi28MzDNRRp/H/x18SS?=
 =?us-ascii?Q?e+Oqh24wC4x2wSERmMH/fP3ojd0oRJzTsNpkqPqS+xG1ii3q0oBPzUVrxhIk?=
 =?us-ascii?Q?k7L0CP3ARNKAvzHsX/7ZG/SBOHtGOBt80jUNGwCelOId4UI8LdUNSZjDCLDH?=
 =?us-ascii?Q?8I9b3sj5dredjdGz9PObecvEjVssNRVNfZtCt6dxab/9yVq0faD2EookYCUy?=
 =?us-ascii?Q?6TB/+Ywd3p5SiIpS+SmUU9mR1NxMgo6CheZW6j1h/bE1uagWSZhq8YkUbuAM?=
 =?us-ascii?Q?jwg5U1Hpz3x0zuZTeu/4E5Ed795PWWe4dHRGqgmg3GOdPQnLsuPejZPcB/Rs?=
 =?us-ascii?Q?tBaMG03qohizbkgWloz55mNSX2rUsOBIvkKUFZpAxGcJ3GTR5gi7PKXu/iWg?=
 =?us-ascii?Q?Z39WstvyVCTJDSCO9btf5PRgDGcZZTKVRVNfwzpmeOotV8P7DpAVl8QdOcXm?=
 =?us-ascii?Q?Si+qJFw+AQCBr1vIdWOcKnWq+Py//ew36uXX575y8RFt3idmXboxhlh/FUgY?=
 =?us-ascii?Q?wmV+WmlvXPYSdrJAGZSfaeUQzPMWg5b5zLcTYsfaBC64Ao7e7u6EyjppfnPF?=
 =?us-ascii?Q?xK3VX8A6Bn8ZZnPMNA4PC0IyIC8T6GiO3ur8cOItyw4qya9zwOYkQ/XJOliZ?=
 =?us-ascii?Q?lr1FMXB3XOVVQbXqt2+tBFrbv0Iw1x1Pwt32i83WZN6zYpKoY9Kg9+9mJRy6?=
 =?us-ascii?Q?W8MBB7IHBBZUVc1Q9poFroqn8J5tc0SSStUqmp/BTp529s1HLXwNV6zuWATQ?=
 =?us-ascii?Q?07ani3HbLPsR9KMUjRnArnGsHPPdF/8+k7Q2UDtvkuyEp/PlnTaay2iftbnP?=
 =?us-ascii?Q?YTNgQ0OAf8JF2sukXhYS3ozA6x2CScFYi+WW+OjoBf4xIdpP0nsmNMFxnNz3?=
 =?us-ascii?Q?G7IkKjIO1/Pfx7tGl4BefgeXm2eUMblXggLFvMZu525N5VIoRKnOhbyRD6kH?=
 =?us-ascii?Q?0r/kroorY36T/OTdkhf5kWhNmSAkd1NHJFip2yE1tDJk1vEWwZnTIwcXaIEW?=
 =?us-ascii?Q?i/V+YJB3RasdureQdGOvwPfyk26VrX/hBiCJsCkCBbjKLfKeXw0SDItLvv7P?=
 =?us-ascii?Q?aRXywhMOHhZoIqcVeeKEBPh6L6x1fTvPcYSXbd/6XNKu9Artzrj+9GSoDP4f?=
 =?us-ascii?Q?44A2v6EXAhfvkmOxSRSkN6LjfaDKalC03CQETsyLlesXY6Evjiz9t6Ne2eXC?=
 =?us-ascii?Q?NrGb4v8iNSUOB+LZxlZ9ojj5WsN8n5EgMR9fTxSjVKL5x3FBl8FxvokrjQkX?=
 =?us-ascii?Q?qhE4423rRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d2ff6b-1442-4103-7ab0-08defa0e505a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:14:11.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoVPva2+y2mjmoXChfuI94xufFEtL1bRL4wAym3EsJziuwM+bau8og12suUTWBfNT48t7l2gdYxr0+gFVe0Eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531

ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'

Add the missing 'depends on QCOM_SMEM'.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

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

