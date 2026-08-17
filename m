Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A8C3F44DB
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969945; cv=fail; b=btsDed/Qadtc41tpIqtLDtn6soLCowg5ls3Yp50JgrfqSZvp+P0zqBGVZGb3L1roguzUsoYhKOtDenw03c27mUYw3bZlg84n0V/XUOxioJWvMQvho3osnTaMZWjJrF5mSo2lmwTFdZVOkuzsiX1Lr7jFZ+mNnmpmgbpb+5TtRio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969945; c=relaxed/simple;
	bh=ZTHdz+2wIz4CkxoizZhB7a0n4/vorORbCJQrEQrRH5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JUry+Z9nD2Z8eoIRyRX942KP4+9OeqAe7Gl8AglfSozZAeGIEzu3QV4odARJtI9mhKWemcY4MYBsonZsw9hMjYBnYIXsjcq+AOyDDjzRnbNSkCFt7ZO3fLChlownE4G9/PHIcxNR4WurQOQe6TcA5Bs0W1ce+W1eg/JB3ekAXN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ngU3XFsA; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ngU3XFsA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMONBcxN91Md+z2ANiAVpepTJ+pz0yVGYo6v+8oU5M3zunsDtv+ZJF/wwBWUoBTlFrWWxUFsQz3BxlN6bjuj8buJGEeGn+2y7uZdGi92sjANwKdHXpQotysNtJ4CTUZF1f7hOreOvp2niOY0jgu62hD9f9nLlaD6Iuw4kPg4AqzFO9udW754y1CUj/gXSBewXEvMTW4nL11BnqM5WB4UO45ZXq1I/WaWImV2Kkva75zNrngVZLJLhRIyy9R4dpOymEP7r+jJK86rAXhvUzDq5c6XDD5QXgr+vyPiVY8AoItLmo31/8neWlZzEQ8U4AUL1pV/yR1RCDJmizssuf0zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5uD8xU+EOfRF09JIVv7RaiGcntybv+U4/I3EH2nnLQ=;
 b=Z7C1W6CH0cw7fyj396w+7sHNE9qhLt4+pHNYY8co7t7uVTlPYzuhXUzXHldtFXdp7QzV2g59XJ8rCgvAcv4nQ9H7lwtimTH6suKTn3aI2adMX63+9dcDMK10j4RPuK4fG3EhFw8Pih7mF6NmXwCum4CJgYObKUjKKlTJSwkjweaL5V5hVAlPYmsoUo+U9hslNOVYVq3RU0wPIBQO/FEGx3d0UMHH2Z80wG6tCLu/UtdL2BwQRL2wNxOrrNCYY+c6y4CxdgzAXDAw+P6wX7be0F2+9Oyp05SyNc0AUNbpd2X5JHKCFV6r8Mmf7RgRCrt2KmWmHr90aswOrE0Ji6ubgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5uD8xU+EOfRF09JIVv7RaiGcntybv+U4/I3EH2nnLQ=;
 b=ngU3XFsAktl5OaeC3vvsPGpBW91LJeJHHfjVBOwPRgl6qPxErJ1tq80QpM+xY6Q5KYHHIE8Vgqo6BTtdeplXGmOG/3619y2YEhW96SIV1nKZMxv7qWgzoyH7f6cZ7InD8JNwGAijPvB/cVjMpdNygRxO7BM663ftS7JfcUg2h0FEceUspSJEFMQxs/OWWZlxSEiLFX6ssO24r/WQGsSGhhU2JM/mieAByLUvVFbzyvG2CSGjRcZ7bxTyFErr5amH25Dwjh6G4YD+ESNlTuhv48bOA6cAPzp8cB/fgrD2H3IPktc6IxBeGwWKEzyocmrM11RJ8bu0q2ILE91iGPEehA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com (2603:10a6:501:83::21)
 by AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:32:19 +0000
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e]) by MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:32:19 +0000
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
Subject: [PATCH v6 3/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Mon, 17 Aug 2026 15:35:40 +0300
Message-ID: <20260817123542.48475-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::15) To MRWPR04MB12331.eurprd04.prod.outlook.com
 (2603:10a6:501:83::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12331:EE_|AM9PR04MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 387d24ba-3a58-47c0-dd60-08defc5b9435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ESY1dJIfknwl9aFE467NWFcaIJNC3X7GYmEpFrbir26YA5V8ky54KyVJz6Hh9yHr7D1Csz+J7PeMFZD+2R4+iLGGfWxqR6toTHE6+9ZbE4xz1hfPcIcEaQKnS6zwK5Tm0Pg5cSWTj+OaVUJTEeo31kokVCAEGF/66Mu8bDQZFRnTxp+LNNwy8+eYaMzoUUmVp/bpr+xBbxrI3pyb3DFfIgKQvQNyNrzaxYaB+JD/GyZ9WIwEReXD1NxM6VjR55tSRhC7vRmgxX7FGMn/gj7/WXmqTRqWkN2wwFLhMKM+vJyMug7/+Fm0IdSAdfMCUG3YcXbf58CEnB0CRPO9a0M7mbKf5iCQOkcGbud8+mHxM88bGnnNz6bzsFTzvVPe+7uBZt6JCrphlZa9ZV11R76XtT/vgbls4vWW9BDBbVqKhEi+RcdTvgbfoAlxZfeKd7ImwcjEw7j+fVI9HjJTMWKysdrgmWq19pIAmn9uSGHTtFQUufXKIGlXwUcLp3RcqJHQ5I3FeAR2khuknvNVyKjONNdHjbDKe/xzrAAhOEiyWlrHl4pUzzmSdhz7nhR3YoR9hDvgEspgTwgiL9g7YPNNhWdDeHtOEJIHbWa0Jpcrs7ig0SI9XSi65Dw2Y1ZJEfwPUNCL44fazHP+KOo3hUJ2NSqKFXR3/PECvHK4nCMRF5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qxSN2ALMQBCoUpOQfDipF5YbWp8NJjLo9Hf8xHQuF5OcW1AdxitYC6KHDz1L?=
 =?us-ascii?Q?tPoCjD3wQ3sfOVjScpVaLuo98rg+CNqon393fKMAJj2Z2fc/t9NrtDMxBkSH?=
 =?us-ascii?Q?HyxUuXgh3pbPlHvqbOjBeDRLAFuIakX1MZN5gEPv6dmHFcOlf8im2cpZkR06?=
 =?us-ascii?Q?1gBf/DuPiSpV5WGVwBApAs2N0c5rc0DRg4zkmjeOxXnpptGyE9zCaayjBC/H?=
 =?us-ascii?Q?kLbQ3jX66uwl4QQaub7n/ctkQYhf7YKe5+ca8z1MKhX2fspA+uvQWLVok4tm?=
 =?us-ascii?Q?6e80/w+FlwHzK9MarGlw0eUASmerJHpBeVsBKw4EyD6yPciM/GE7Tmc5eimu?=
 =?us-ascii?Q?ZkLecsrffNbgH0YMaQjSVxRblv1yi9g3ai3rHBhb2D4IYwUtNDA0/w2G1D1q?=
 =?us-ascii?Q?Cg7s/oEmxtshiVYppaYunI3D9Reqpdw2+cKqs17MBujHfCu5umKf66sEoVrm?=
 =?us-ascii?Q?SQ064vWzMtF7S9qKBQOIlimJoe4BCXthI5njoWzXUufFCifSNADGmDOnsw3e?=
 =?us-ascii?Q?Dh2hNj0VLgJvQXFwvuShjVwt02Yj2FbgJHhYatX/2/2m7Bgj72TMtJYcWfYJ?=
 =?us-ascii?Q?vhwWZ6hscJ6YUarLILA9UbtThpgyegfXe64txmrfivRobv8tgdMRu+3YoxOd?=
 =?us-ascii?Q?VAHS4NcRR7DKHpiUVpF6eZa8XzXVHL6KzhwTP7K7+W/4B/dfmcBi13ZeC8xx?=
 =?us-ascii?Q?M+yeTIPtWelycTutpZx4s2b6AhFwvHej9nexCX8rezxl8T4KkmsUVOBJMH7k?=
 =?us-ascii?Q?tlN7HEkBhlHfspROONkLIAwdbmIUnM+KGRiYKdZvCU1aDtBqOY8BXE2EV9uv?=
 =?us-ascii?Q?wJirqtciZopmMz48YGkxrVNlUju75KVFA1RdC7lu3vvsA1adJ+FoUr2YbCbB?=
 =?us-ascii?Q?nbYo28tVs7XuJqev82txko2yyMucJzZJzJT1umBx98L0GIOaXnwnx1Ag2Dry?=
 =?us-ascii?Q?PvdQtYGjADmXuTF6cJ66bYvyK1BIRyee0FncAjpjVtsgct0HOeMI7pIsxkiu?=
 =?us-ascii?Q?K5idzBgGKlNmaL6CZb+Zo3tfQBj++Co8gYun/hJUwcrKZjem9++gpbQgO+gq?=
 =?us-ascii?Q?qCfUQO1PSCSnhu7ocTiRqUV0dgEiw4nTASsgCl1S8TiWfUR3iVfV/U43N+Xi?=
 =?us-ascii?Q?il3mmeFpnTHdYpO0icLZ9leWHzVZtea3BtKjJSBiDk2f/dPDKjFy1LDxyp2F?=
 =?us-ascii?Q?7onRT1cHi10HFTt2Yt04H0jBiYKLie+qSDJUCMm0BnAl6AsizqNjsL52b/ev?=
 =?us-ascii?Q?Yy1pVe4mHPVL7tcemFh4bHEYAboWnNeOV/nqidKRp8hyufPtg+kfJ2QWR73l?=
 =?us-ascii?Q?i/R8A9wem6kkVsuhwUBr+B2JXsY4WlYGvedIqEXnQ81dQ2JkWkmoYeftRSrG?=
 =?us-ascii?Q?B5ZExUztsNyy8NwFHN6hiH4y8G5itT10Vl6yE4OIjnZXnzspYtMLQOlIRRCp?=
 =?us-ascii?Q?3rg6b4rULiMXMoSvqc+r8ahFv2tVNA9yfaW7XRPpxcVTHmHmUjIR2c4u8/+9?=
 =?us-ascii?Q?6H24/X9xD58yownDMlStnOWrfpElO3ZyaCxlajA/doENk6dGFXoj9oFbD2fc?=
 =?us-ascii?Q?atWaFHD5YxHt4Pud0sa0D42jLjwBXFGQxxvaQQidpKThMDsRZuMYWHtSiJ73?=
 =?us-ascii?Q?wpIpH+pp4M18hBLj8XID3MfQ0XpCmSiD6GbSOfwABfaCEfVB7WPhgysp2J6p?=
 =?us-ascii?Q?6ia2C108zgw9iIvEIBS/wQxbZ1ULXTa89tQEgpXpX2NOkWj7jKW968UUwe/E?=
 =?us-ascii?Q?rwPxinIuIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387d24ba-3a58-47c0-dd60-08defc5b9435
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:32:19.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sKJKpiZ1fFLI0/vel0Zb0W9344F5ADtOUJMQ9ZRGkj6Fjs17GQhrbXwgrDLF9TprtgS8erdn7y4JQmULxeyRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8650

ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'

Add the missing 'depends on QCOM_SMEM'.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

