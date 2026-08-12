Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530633F5BF
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547780; cv=fail; b=DmRxN+wTBqXHohUwd/5mD1ODSrPpV2uDMvmenyvbrsdA5Eijmf//tUV5qb740G8J1yJ4Ayx5I2eDYyDh6MdXTanAKSAEpoYWyjFQKbDlfLXIoPi1hQ238Rn/pBEb9qpLe+dAkWe3ujfcx2qdV+arnPtzo8utW64pyOqilLLQqlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547780; c=relaxed/simple;
	bh=FLJS44pFpa+8Mftmd+e7F8do+a8nDJd56TqvnkoOOZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jmuFKLp57u+jIm+iyngSVmuOKxuHuCAHBav4UYvBkxzPVMvSQ6swuIU3/cYaypOMMUKsbvEl/9QG/7eVaKuTbRS9U41jQjYopBOQStE6Q4nz98Smq9Aht3/30xio3p4xV1sfivXlq6/RkleqvMs2R8mdG1H4ExC0dVM51bcRhq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b8fnN2ez; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b8fnN2ez"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJY3fdz9mMfkfmklWDytdtd1j9Y8n7ygu0UxCRqiPdpr32juiesiD26TTau5QAYui7CaHA+jlbzbVP7fAkEFwSnfZkXuNl04SNoaXAvz87xSwZXq7rI5SBFErHOWD8IOJW51feh1PUZIaCO3woqo7K7+ONp4a0IhV8wPQ2PmQbXJB/yQ17ZATL5lpCo07d6kRUPm1D8wHt/w0ADOighIlRXEBk/hmmyTvzcoXxt8eI6kQbDbF/8efzOGPrvThxsFbqMb/DMEFtnJWyqP34YoFpdMigcC7XAnSVG6JpByJpjWcAgsFSN0oUbinnEWRMqDeSoLesqHO3FNwc759pblBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6iy6LwLVGTCWORsqv31ZJR3QKVr1N73vtZpgt3S2PM=;
 b=qCycT8de8DlHMLHkmUI1p0fdqYCU7ZdeEqwlxCaQ7tFIGhjQCwO/LKFXkr29QYAljC4QdM+n64Sr+228//KZ1mMbwCdWXkbY4ivYNeb+93EKrhZbuZEbrlhQ1DE6fKrEc78U1ndiW2UUBCmTR6Vus9rzDv3jEgij+7dDP2Pm+2YKp9wgBl6LmT6pmxx1OnEXi3dqIFEz2rPx5Fw14o2FkX0W8o2hnWh8LBU63UyyK9k/FKcchmDGrMgYDzRzxqsjRB4Nl7i3eicWyk8dTofSAGzPPi5ZqAB2TRTN97KSJCqa50lJ7XT7pOoyfPrMsoC97sxtvaQDgcAuKGkd2WtfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6iy6LwLVGTCWORsqv31ZJR3QKVr1N73vtZpgt3S2PM=;
 b=b8fnN2ezwhe4L7z1HP05vicXSdboX/5hK+vuRnv7w5/vJKqoYdW49zHxNFy+qJpfk3j4Bq7pa8rMSbWVEon/9J2CU939qvI0capL59EokmyabKWFKJ/ZjBenvVFP81GGS1vDVjNYOvji40iiOWVdjsLYjlSxNrCr1BFlsp6pdOD1SBA8P1gfwCBakWo0/+vI6MRLevVInN71OWr2/8jygLoVeErjAo/2HvETZX1BHp5GlJyYNQGr4YJfwfK259JEAVujbFsCi6GfBTHclTNnmIhs/tn4vh2WnXCx+jSO8JWn/5mRlzr4UahrYzVlZt/c1lpK5K8tJnKSQUrFrPWe9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:16:14 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:16:14 +0000
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
Subject: [PATCH v4 1/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Wed, 12 Aug 2026 18:19:32 +0300
Message-ID: <20260812151934.709198-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260812151934.709198-1-daniel.baluta@nxp.com>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d69270-35df-4665-8d6b-08def884a66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	eWGlGQVVk9wjY8FA9UJpacnyFMry9M/dDlQhJ55r1K3KwtSRUvKSRrRVSfUBVO+9tLVGKie2LzXGpZl3kEQA1OJO7ccWDMXxjOhvFRrNraEupuQChR3TRdULv8yis+Nod3tF5cH22zovfW2StPWbt9aRjWQUsqVlZRFUXP1d4YfnufH3sKGDv4SaarrdoabPYFLzGvQIX2bGGUH5t1IlHYesTqLuovogCgaYEDuRxBmFeNM3GrsbcUvFoPplsqry7YX59yN5LEN52aRMkzjTg0HNbA9Y6mexk+lxrNs8mcA+kLcAkZAJPESHBaxzMu49MRgRAlqZuXFxAmTzzZDWf/QOAuNp+0RWm0DDWOARp+cT2IT7qE9PWReKc6eVxTPCLrtmko8OTj/8IWLZJBCXSrq7g7D8RA+PbXg3g4PvlWHQc2mMTWWlokKw6RbzwP9j66X2OmyMIbj7hqIKWdBdWhCum4nB2AwXqG4D5ymq7g4MS51sppGFmyN7nanl0bMmq8tsxelvuaUMSpWYrfynScfNrIUPee3IiudeJBzDoPQGedOmtatP/3SnoKgKKrfHsCbZ5eQh2hSBuwgIgmOqqEXBWtyA1m4oKLe5uqMT1ddRmb5+0HLs97yFGvb561BKXXyFEOVxzRbJPbjtrmlfDUextc8hG0FDjjsYXfSlaVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?psBKrvCFx6ta3Lfizrx4BQOae55o/kgN37UxRO6U/btX1kkJqgMWK2bW5Ee7?=
 =?us-ascii?Q?yDgPyMVdo3KZ0YRY2lJ5mJOkKu9HiyBCck6v0meu1OqU4eJPKzJ+KEzBX5I3?=
 =?us-ascii?Q?xdAFMAGqtgiKo0flTa+YMnCM7u5kDiAV8M2XXnORZf/cNqm2dfEYWFUBsGvS?=
 =?us-ascii?Q?z1UfR9Fh8paUzNCvxeMnB3wwPhIRCMW/cSWavbg/rtF0TOms2fOuPUIpoQNb?=
 =?us-ascii?Q?BWUwjV9Uxz7TnFxalXU1BtjFTh+Ece6HSEiUyocunavKcwVGszQTH6CeWOgg?=
 =?us-ascii?Q?EzTetZfRtDSIx9gEzM6Ef6GQEfzJM2H+jb5fffoPJSa4Wy0WbbibyS6Hgi81?=
 =?us-ascii?Q?ZlhXLyJqHMdD8Rjoz42nvLRndjnM/h2j+HvJ6RZ5D88sZJ+cBFiwXnHmhXQZ?=
 =?us-ascii?Q?EAwQDeUQbx5HgEPYm7D089eroOFle/bJyhoarD80HLVEMPYS/dm+fPHh07O9?=
 =?us-ascii?Q?eAUZC5k9ey2v7whhGahR1keY+6LrqQ+6BzoiXUc5pMZ/lmTf5Il0I1eWCm1k?=
 =?us-ascii?Q?5cBVakHluxAnkOY5bXyhD/cWv//zOWpSfYkGVvlKj/8JGEUzwtFmdQjGply/?=
 =?us-ascii?Q?8Aj5/tYL84TTcJhwh+MgO3BVoKoIutukGOh1VMIgXCmcPaliKVOheFnAjJpx?=
 =?us-ascii?Q?N5OEDbyUsL51P8+2Iyl/UTRZ0iPr0T9PEhKvtwFimQcxNgOPQWKybHpfp7bd?=
 =?us-ascii?Q?Uo2ALiRJjK5xjfK6iGDOHmyRF/wosC8ma0F4iQrKv9OTBEdKaDDCHB9TIrKd?=
 =?us-ascii?Q?EQfA2cd8yAWIF10OrRrRePYHk10MGrkrI00awz+/4ttxB+EmQqGIobU4HvKB?=
 =?us-ascii?Q?TxV2fBJNXO5BCcG+HrZHEFjTSmuvnc8geIRhC2BwoY6ZISSKgzhm8G0c4pkG?=
 =?us-ascii?Q?9za003hxd6vYbSp5131cBbbA7HNr6wR/FqSuW2EXCJCg8Os60aS2KLz0gVlv?=
 =?us-ascii?Q?lVk5IQb23nf7n1JusmUhmZkBo3lY6MI9XYNTkYI0vCSfiHdqcv8PD8EoKjPK?=
 =?us-ascii?Q?wJTxU4VaGMd2CAzWU2+lTXagwjoh0fMiBq2oe7fgm4uYUe1aICmHZuSrgduA?=
 =?us-ascii?Q?k97bS3vWVr3gTRh+k4eRbLff7sD4DtWxoCW+UfWtUfZtyr3jQBG2x95tCd8Q?=
 =?us-ascii?Q?wWMZv0emtsg2FxsvkJ29LMyp9fXw43wHQjJrQJoVGpdnIS72wybXU0Ugw0CN?=
 =?us-ascii?Q?EwIxEGSYZiH9jDsn5FZCgx5x6xYlYqTgWnRjPsnd+t+YHH3nqumR3ApZSRsE?=
 =?us-ascii?Q?kbEY8M4zJ6tMUm5vi40nkVHnOG2ybyGJeuweUBP2Fq5+x+6Jrb8CUyeLWo4u?=
 =?us-ascii?Q?KiX2eISKF3cAduKicH/cfRvmHxgJsrgalMK0qvXJl4uHu5+kIwmdTEPJM/BL?=
 =?us-ascii?Q?WTobpQJIVJ6l6y1YUzbCSRb5IEYBupKpN3iaRzotzFrQS1zudBPxYSgc6tAA?=
 =?us-ascii?Q?C6eJmJb/e16KeiljF2MLKlUoMYoQRbNNFCBeuSjiierImrckSOh5Jq15XC6Y?=
 =?us-ascii?Q?4wLq5BhReWjlG4WTx9P9xarYXtEVJZNG55pBqOYskOfMR25MIi0i4bfMAat4?=
 =?us-ascii?Q?aHawzV26QrtsBXRUthb7LJzKyvUdsglYAhGDCxVgA2JHXKSIBFcSBWXq0zaJ?=
 =?us-ascii?Q?dVLlovO8gJVkPao9usX/1w4f5vUu/6lP6G968ZHVP4GVQUBCL8Vz5xQFlpu1?=
 =?us-ascii?Q?ane7/j/BEJQot0So5nuvo2MeGfh9zelx/YDX6hB3SsGTQ8mgYLex331zlCp0?=
 =?us-ascii?Q?PrzPSCoKvQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d69270-35df-4665-8d6b-08def884a66c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:16:14.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBDNPwJczFb2P1ZBZmsST0dO+LVY3kSPa1EH7OQWW9dTEtdcnpgGq3DcgChDFK5R3TmidqBHErl8gPGdaivfTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019

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

