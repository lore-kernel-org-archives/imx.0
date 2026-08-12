Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5F470E84
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547782; cv=fail; b=HW84H+XYq/TN8+eTswY51YuGP/e8PJVXmHg70RMSrkTDlynCKyLRDTYF1S5TXAieSGbOO+6ruLMtjNWdBtjvWIN5xIYGbx+CK6aV378pcrlayorO8GyjZwjqa0/HWmSXQX8OmvQEACmHrInwbgths10ttYGXRqS0og2PJIMF0DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547782; c=relaxed/simple;
	bh=cdFVeTcp94/qdMJAsxoTsEnXW7NX7cL7bYoILxVTER8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m45lWphN8Sl6CQ3fS09XJzKsFiCakh2qORuK0A6GVGAI5iAl3eWB+atx/f74TM2dGoKq0vws62TUPqdUkh/nzqrE5kg2tFxATtGTDK62KJMCU/pV5pmGAEuJQqA0XgSOm/XR5DzPzTisakUa52U7MwK313gz1ucQDaXsCG9yB60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDR6Vgap; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDR6Vgap"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKP8KuypPtsfKuOGhcIUpA/QiTcBgL0m26tFtT21M1D1qFQicPCaf3xSBrTPTkK+aM4+Kuly2WCEW3Nnj6WtwaXFEpGxPqgvnNMbx8aQ1cjCgiO2Kij4dqmQ5RyyccENZVzUsT9k/KWwp3O9+I6VyXNqmaiFj6v46N9igCJ6BK/yfn2IMDLdMD487o5DX/EgMi4P2ig904lSRp3P8TYPMOcGnXdrERCndCF45Joril4PmU0aM6dmzIeKQ9b2/n4UPFmDwedepLBQFLCafY7Ml1Ia/P7DW5aUKdNqpINq2SNJ+EmbP28KYysWWATBk/YenvlEGhSST3z/D1N7H9gpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY76gLwnk/TUzuTeVQpXhbV00553u73mKwiuvGq5TZk=;
 b=syAtky9wNG3IVk+3cu0e1R9pEoloxjAuc7+7cJpK5XmluuawlpCHjDxyRD8KQd1051+j/cTJ4wAHroJVPyADqalc0TSgkVI0a51mY7wHfidBhrXlayM46K7YEWCQkzKqGzAH9H0fSuQZCb19s730Asnco+4nzso1TtQLtJ4M+t6a0/kX7lj/YjKUcWziwPfkGvLBIXZcs9hXUj43c8Xn15ogVucGIHTPDSE0qMRh/HnVJwUuxgRdYka0ENJQCsZXYPIulkuMiPY3hTYSpkDAs26sBrrErLsp1DB1CcEvtVSvTKzzW46AV3ka1afLKyG5Pq9y7N7w6wKFa8hF3E3BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY76gLwnk/TUzuTeVQpXhbV00553u73mKwiuvGq5TZk=;
 b=cDR6Vgapc+zBagmXPGf4eHcP3xfCVGZ2Bt4R4DGkjLzYbO34dKD4zdMtjAkzIzsvUB04xhUj5/OVuT7HbTBj6krRA6amvpOADDe3TCI9INwbWZkMpPSs9iNwjsJYGLFNzgdatx57pB6Ds+I4LIQ7MH0arGNSb5V9EMKqHJX1DainzLqAzwnr46KXSUFU9Xb8nQnT2z2ZKrgM2D0BG4rTG35zfRxGb5a1gZhB2xXkxMFnWl1auyao0iCGzAIXQ/R8fjQ6AGV1CWaKjvRME7Zd9VA/CWotuFECGmiHhlwQp/M4QRPFurwYiP4bO4bSLGofmkuFnUYxp5TGNQ0AOnBxuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:16:17 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:16:17 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v4 2/3] media: iris: Fix unmet dependency when QCOM_SMEM=n
Date: Wed, 12 Aug 2026 18:19:33 +0300
Message-ID: <20260812151934.709198-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260812151934.709198-1-daniel.baluta@nxp.com>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: deababc4-1e96-4169-b9d6-08def884a7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fEmrsz4isHthpNsTeEZWwS+e21J99jU3aMZcOv5oc0o9K3QmAlpOyakzLZLSEZLY2NFIT8uEUeEovtD3I9HgpsiFnDisWvkXEKuLK8y1UpwyZzkaVNmOsQU32duCu+r4SpPW9DFvV6u7C7Pu0xsPVlLD+pRpTwkTdkOXJ4Pzs9W0oiMay11dJ/twGrUgG2UD44+X5lmoqbtMqjYBJxoSL8PiuvqtOvm0b3t4MgRUv0ayaKjkIjzOY6UcbacueJn+SCzs067H1WnlTcLVlsbAJPaQH6W78m3l/Qc+MmsQvBgpv6bixpuhIOT1xEtqC0BW7Q2JS5QancqShrjfphHS/zXTYt79b02Y4ZxcKMuYC/JmBUS5nY2mKa8BnuYTAxSqV6xTQz4MUZlcejmJnNZ7Rq4108Ku1xmORoyRHbYzhvW3PGiJFCmwrMGYJdsCJB8z8cExLEEdIBZOCpJ5s+u/vUkHwQ7YklWtPyvjtYHeeSwKU5ywsGKxUzZbJyCxSTXZ4Om+O1JZaVR2+Af3dsrbqwH636nFucJ4nfPqLBxRyuk8d6Rj725VuSOS5kRc0inm/khHRBJMNU6gA6W3n0i+zzUforP2SCqNfCh7yS4RmOJGV55JCaZUBq2rUX4xEMheB4sh+Ao5SgwD5UUf/yWMughaqnjNl1CSvYKpX/xucKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bUBGuvizhmpPO+8JQBqpPhXHHx0CYi8qMpb1X4NGOiaFFWkBLZYG+i6wzWzr?=
 =?us-ascii?Q?rvZT/b+R/suZjNgCJ3ei2wxP14sUWN4gseLGTItkKqfRIgiy1Ik7KEY6LeY2?=
 =?us-ascii?Q?5hI6ee3lHH/xcrUAWWsSFXDRvLAz1S6CrFD0fS2GuaJNYDe/Ok/HtFX4ckKj?=
 =?us-ascii?Q?6GgL+xPKzMv/3I5UDLFZZyH1ykg/jNgDz04KYl2Vu7mUX7iw3/WiENjkp4Lm?=
 =?us-ascii?Q?OYfF8dH6x1tGP/MzVOw1qFMrtrIOiBM34uXWNiirCK4XxQVFyOBA0vvaNKzI?=
 =?us-ascii?Q?GZAyXNi0zEM1QSNQvVPEhEfS71XdrMy6x8kfLkAu7RIxk/F1wiIfsK7zH9iu?=
 =?us-ascii?Q?Z6PVBTQ87uHiZb8SczAp2+ldchbvNnLIYjP6fMGiK4bisAr1LcSfZgsJr5uE?=
 =?us-ascii?Q?14Frglf/+kKt7ddW9FbZGWp8CDthVLisutj1gC/gofjoUMbFI3PZ0radUT2j?=
 =?us-ascii?Q?yfXkI9/+bC2ak/ci5yFRTOdJIxm0tJtKLRaFhfzNdOZyg3QqJfxEWOK226q2?=
 =?us-ascii?Q?OBKpx/Rojkrig76v1MPV2FMIsfjxaMQTc4meoJl16m6vgJyPpyfYdR9gYxWL?=
 =?us-ascii?Q?BZq3z6lOXh05s95BjxmDvq82tHTfwAGaLRGpXu5RvCICd3aEVgkjSfFo641T?=
 =?us-ascii?Q?nisAEwkArQcfKNrpKeCLuuZYtrbplBPeC6i3dM4QeeDer31AFFRtmj7jee7b?=
 =?us-ascii?Q?rvLrRw33pSN6EcJ1dsHoq+i9fBjmqQXI3ohSqTOWN8fMTIfL9Zu1bG3GkpeJ?=
 =?us-ascii?Q?rYaia/kS1InQ6lcI1O+oc6XYbGnAz5idaN2p7TjvoBwr7r2apvLufWSOpaLr?=
 =?us-ascii?Q?HI7YwVMcEiI0IgIRuHJgRW99TQo9MioaWetTFzyzzEtiymN7TDksDznuAhrH?=
 =?us-ascii?Q?UYKWgiaDtCP+fMl4Ho13KhAE+ezBrBhbN46YxRY0lOTeh76BE5GLAoJ04XDy?=
 =?us-ascii?Q?9crNO4aKvyiZ5Ac3iGtAVaacyvTSNuUb5MZ2OU389JnoRvQR77TrozdmXE80?=
 =?us-ascii?Q?ngoVWqOpZDoGXa+uJz+XrxcHzpyfKHN+9QH5Jyt4g/d2kZH6/HVO/I6gA4Ma?=
 =?us-ascii?Q?KT29DgIX1/dgInRD3HfoiN0ohqihV519FMoCvgA/qM30qYOIu7FTs76tCC9n?=
 =?us-ascii?Q?inlQCEWtCfKH7Osu6GxOVWPGupH03bmxTk0b1HrGcma9NbH0LHKiwN8VKBfJ?=
 =?us-ascii?Q?ImkyWH6PIqQo7+U9UlvjjARMifAbAU3rPGLECoXso+Rfa5V3n59soogZWfnd?=
 =?us-ascii?Q?Sus4U0d2p9reGm71MQyC2Ce8Dq6dkYk/mMwgsuM4o0oQNpXDccDbBAyvYysY?=
 =?us-ascii?Q?5r7JrB7MmcxCThXRsK+Zx+hsLnNdtM3BZuGxIp0oaXvtBe5WyosYfAU/7mP7?=
 =?us-ascii?Q?ZoDCLLFh8wge45XrO7TRp3Snj3grYBkKTkjq5BYrCP3qHbn8eTWXP6OkBr+4?=
 =?us-ascii?Q?08uX3nC78U67alFf1RGFRPbDjb7izVTR6MwpGU6dyRgAVIuCnYaFrbMhCRbD?=
 =?us-ascii?Q?38pk0s3zc3jRks3MEcJpCyHHYNIBOaLhT3BYqBYDgv8LpuBzRE3TbNKSRjz6?=
 =?us-ascii?Q?3MTBF/I5aHnkP+S02Fm7xA8BxRd/jUFfYLmKPUW5r+mpNyYo15eD4X638QtO?=
 =?us-ascii?Q?SHu5/tmULeShJ+5I90CKU1J8OMAoXzeKwgHqoshDTvx9dfZ5LzPposY8l1zn?=
 =?us-ascii?Q?nmS1KrxAKsQ+hxVKPx6UZXyR+8u1kax7ADG3LdF87Ch0b+eoihFRS35Fxuat?=
 =?us-ascii?Q?Hcw4xnh08w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deababc4-1e96-4169-b9d6-08def884a7d9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:16:16.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9pv6dXlsfOcSVApWzrIqku6phhtN4Zq23pRj7ZCdQAyzpjfmeXPVVxYqzVj302kA7mOhRiRaFjrRt8sB5j1Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019

VIDEO_QCOM_IRIS unconditionally selects QCOM_UBWC_CONFIG, violating the
Kconfig rule that a selecting symbol must carry all dependencies of the
selected one.  QCOM_UBWC_CONFIG now depends on QCOM_SMEM, so with
COMPILE_TEST and QCOM_SMEM=n Kconfig forces QCOM_UBWC_CONFIG=y and the
build fails with an undefined reference to qcom_smem_is_available.

Guard the select the same way DRM_MSM already does.

Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 388c9bbc81365..04a4440a2dd51 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_QCOM_IRIS
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

