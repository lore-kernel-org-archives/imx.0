Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AA2E6CA8
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 02:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781748057; cv=fail; b=WFQMTJbg/6mjSKlf3HpVqUaNDuelHyhyYHZgB258CR+ciefx6/bQzdGUP0elW6y+oJEUHMwHzIA83PrAGSLV2Jq74QMOiQvT/JfbtDTVFnwf3hVTeqUhErYyScTWgZAXUzUguEvvDEihYwMuW6Do3PWZBeBPy4fAAnZIj+erB3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781748057; c=relaxed/simple;
	bh=5Zoa3VBQ02yexuAcPYuYcL7fKw39O2VXi0PIYcL0ZSs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aLBoqyA1ALtHENfKnrRd8COfgLkS0d0tyRwZO4PKXhoV+d68z1ZjPW5wgXJiLS0ukolidcZRVcEzAcjIp7w9Yi7RftaZ3zHJ/gc5Wh1DDmetw7nOf2Jf73a2bVtXcMJ03V4uixisePLhorJD/dpbTEXatuNdmj3w+NIuqw862lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=asUwQMKy; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="asUwQMKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhexKkEuX7CuEiE2uXcX5xE8+PtcJWRzCBVaW0ZnXEZ351XxCfKjqNAZXndPr7EoPYStgFQYyDBpKtrvGn7zKeDiyrSvt5k1AdK1fI9kpKpp0FQCnzxT2SSN+6qLY7paGSYi6COmOIbmspeB6waDwx3Qp5jIGDCygQlJnNm0uJaiEyTJlXgyowphjWZ7ICjdZkIne4g6qUufjoDgNxFAe3VHdNDPYeu4El9bolJbKeQDPkfpbaDtxuXgdD+wFe81zXuYxWns1hWZsc1NK+A5djRUd3h13f5pjU8V293F3Awe5Fb28cLrX/G8V1aNSrk29jyET8Wb8WKZlqY8Igtnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGuhEyuEr6o9PyiFTjkwhgfXdXte8/DvqsPfQuUuNKc=;
 b=KKwGpvUgtWw5G9svpO8bbecBYb2b0SF+ZBD6yWX1McDwF0tSXFCN3jLJBXhCbdZxqNmAGVjkxIOGKJXWuFgd1FI1da1yTeZv/xzTI6s2UwHorUu0IIQaGMezTQ47fIW8UqeqzgkQhVhRPALfJtR4i7LTZhPLlJW83fpbkwwGVqzos6oIib0Yu2k7wt/XIIbX+29RvOXThx0qX31YFL4e/1lK0yYVm8+bqL+dQKg4eT/dqkYTmFhIv/sV72rfShIITP6HBuVoIONNwhCd8nTvOj45gzzYOtk52NDb7TTVSqFFM04FAHSzPOOazzT1qqwgfv+G+8f/Ex7r+8M4xfvJRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGuhEyuEr6o9PyiFTjkwhgfXdXte8/DvqsPfQuUuNKc=;
 b=asUwQMKyxoOD3YNNDtU9R1NXuezJQVgM42ktOGYdMrhkoAhQx93kG3ictmYHoxKkE2trif7hLW2LYXiSAjzdmyEghbRxqdywmyb3vaXcu7vIbTCi+siEk67ayzAxu3lCUKbGt/hsDfevGhJcMWb63LvZGVCeBiOuIENA16loiSQXN4azp0Lt9lVPNeF3F/SGFIlDm8Md4DwIx9JA4EIV3BzONX6U6hFtuvg0Dmy7G5iZySL975iu1WvSSkL/LJd2BE1robnTEFRbAvYMeJyNf8PUmohN9DbbjRvt6zvQ/Pjtaevyti5hJGGR+1v/tHkc1ajrsj6w+4Z4fzdXyoVJZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 02:00:53 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 02:00:53 +0000
From: joy.zou@oss.nxp.com
Date: Thu, 18 Jun 2026 10:03:05 +0800
Subject: [PATCH 1/2] regulator: pca9450: Correct default t_off_deb for
 PCA9451A/PCA9452
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-b4-regulator-opt-v1-1-c43b1f62aaf6@oss.nxp.com>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
In-Reply-To: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a15dbb-ba37-48db-eb37-08deccdd6d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BSfdTdQwvOv5Jw4lOESzme8Uk6uI7UuZTJ9I6AMK4Z24s34fis0EwfGK1zKnGG0gaIeOdjc0tgfoIJmfat1b9dOAV3qF64SYzNnkxB85dxZhAlBuZEMmQRQO52iUhyv1ps7wnzSRLIptTd5jb+gtOGNH2uRrmuTFSBtjs/wpvNYUzydsdagFzD/lU+3UjIqYY5l2uY+bI78auLItB3IlElNfdDdURysAHwKcyJzRCXMhg5amigfCNAtrf1HbgY3gA2l4IQboto01kcXzrP5b6J3O7395H+FWCbHW14UbNvdXatmQMB2s3Ca0RVYZZmUsj3uE3X15NTfMgsgQgyBG6Wz95rfX8KVTg/FBw0tziqmvTPKmssbQgxEKTkNROEeyJ9PdTvIF7HbMMoift4GHfjSufjUdgA93KTiHNL4/rojGCmQ67Pd1vrKDLoPGO1tHiEx7K3BAzqH5p5Ej1jcG/H+OpcFv6on2JGfx9Zf0uGWjnGmyzp/fwLlhQGGoSseETkkiyWbXrZ2WZoXm8X0Nhk32QC+RwgAGcYcNdyKTssWsQN5vxWpVNSszNbmBtTSDoDvOHgpqDJAswHsFHXxa29LP9LNHuanHJjJ6d4VMZ/yEcG9bv7wlA8p1PxU1uiCDUDF0ngwZ+MXzWmifvCvhBC+ZXk5prayfUGTqF+EIfWBIE+JVw5Oh4FqJ9xKOuu4/S4GgEFEpzstScp4p9Vy88w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjU5NTdZQytNcjR4cDdjUkgrVVd3UytKaEJmanNuL3lxbHBZeWRBbEtXbWpL?=
 =?utf-8?B?bjBmRG10Y0ZlbjEwVHBqM29zVXN0VW5CZkc4dzl0My93RTdtbitMRnpqVUR6?=
 =?utf-8?B?d3FTcEg3YTMraVdWY3MwNWpHQVMrK2t1SjBtNlppUEczQUplREp4TEFybmU3?=
 =?utf-8?B?a3hRUS9teW9hRmdGQVRSb2NHMGQ4MXlVNUlVUEU5MnFXVm1DYm11Nkx2eW1h?=
 =?utf-8?B?OE8vcThNZmdBak53MUNpOW1lTExLOVRIQmhpUUw0dFBtRUNQdzJ5cWo0TDJL?=
 =?utf-8?B?ZkF1aDdjemQySUQzWkpQcGV2UUpobWFqT2ZhYThYbEpYSWdzYkZHSEJrOUhs?=
 =?utf-8?B?OHJMWlI4aUdncVVEdkVhWFVCZHBrZWpzWmQ0Z1lTZzl2TzNIR0hYOERmSmNZ?=
 =?utf-8?B?MkVLSTNCQ0xOM240SkxzcXZZQ1RPL1l6cEFteFpjTkhsTHo5SjkyMWVFN0tR?=
 =?utf-8?B?ZnRweHNqL092Rlp6SmZQU0JVeGZva1R3OFkwUldMcDJHK3l4Q2NycnNUY2JT?=
 =?utf-8?B?QTNjVm5TQ2Nod0U1VldubXIzSjNEQlJOK0R0YUlFUHpqN0U5cE5SVml6cjRU?=
 =?utf-8?B?cENGVE1nYkI1Mjc2NUxkdzh6dElhVjRMdHc2bGZOdHdTRUVYcitLSG83NEpP?=
 =?utf-8?B?bnRsWWV0RXFEU254NjhWZlgvbnZKSGxVWXY1aVB5REpNalBVSzErckp0YW8y?=
 =?utf-8?B?dmJQdk9iMlZFa1F1NXNVcmp0TDBMVGYxaFppekd4b3EySkRIMmxjRkx3OEFF?=
 =?utf-8?B?bU54SFF2Mnk1VE9YL2J6UlMvbWRSaXFMRTNWMlZPc3FCS01OZVlLYllzZXJl?=
 =?utf-8?B?ODlPU1BFTTYwTVM2R2hzc1lHb2pYWTdsUUNSd0VBTml5Z1VyQXlFZ0ROalc1?=
 =?utf-8?B?djdNODZJYTJsT0ZEaFNEZm4wSjM0eVFGMU1qTzlSOWNJR2F2NnZpWkMzYnhB?=
 =?utf-8?B?ei9ZUnZwbEJUL1IvK0kxRk01Z0FOdVQ5azlvaWJrR3YvKzA2YW5nWlhSR3RL?=
 =?utf-8?B?WkxsVlh6Qy9mMlFpVFhiblVlUk1kUEJRTVRUM1dza2k4Z2NVbEZJNW1QOHVD?=
 =?utf-8?B?cG0wWnU4SmRXOTM4ZllKbFV2c1Nhc1FDcmFITGV6SThJS09seTY4cTNsWnNh?=
 =?utf-8?B?MlgvV2JjUjcrSkhOQVhxNTZPcnRJWS9zZnRmdUN4bUxmc0xiVDVoVmpLeTFY?=
 =?utf-8?B?c1lyQTEwNStHUEVabGZhZ3VtQlNxRDBvamlWaGRCRFlLVnc2aFNHaVB5aU9R?=
 =?utf-8?B?bkNBN0ErRFE4L0RPZVZmeExjTERtUi9DR1oxTnBnazlQVDBlR3Q0aUJEWXNu?=
 =?utf-8?B?MFYrRWZTM24rUXduWmlZa285d3BIN01ZcEcybkpXWTR5ZUFYb3M4bGhVeWxC?=
 =?utf-8?B?ZlFldW5wVTJFS1BaRVhLczJ4RzBmYThLVEUrUTQwbkIwQjBxMmxhOFdQMk1R?=
 =?utf-8?B?bnRpNWFadWRwK1cxd0RnZmlVMWdaUzZ3aWVTUGlJdzZzdGh5Q3BmTitnRmgz?=
 =?utf-8?B?SHgrUjEybjdiZ3d0d05oWHVZb3pjSTlZRHU2ZHBscjNVczMzZVArSTl5VXRu?=
 =?utf-8?B?MzFrU1BOaE4vbDNnZTRoeE1GWHc2MmloQmlOV0Y5SHpFTk9VbEcraE4vNnVZ?=
 =?utf-8?B?Vk5CMkVyQ3REM1lUSXltYVI4RUZJaG85TUwvazlqUjltOTF6ekVFTE5Hckc2?=
 =?utf-8?B?L2ZaVzhsaUlWMERrK242MFY4dFlLUXVqQ01IL25tVCtESXJ6djVURjNWVjBx?=
 =?utf-8?B?NWt4MHQ0b3J2SWdWT2N5cktkaGVvOXVQalFyMjB3Q1R4OGsvdkVYR28wMytZ?=
 =?utf-8?B?ZURrcGpMZFdPcU01WWVmMHZ5Rjk3MUJDbG10UHBiS3hmNWVqY2pOcnR0M3p2?=
 =?utf-8?B?aFYwYkI4a3FHUDhDV0pIUXNDSmU5TkZlTkp2bXBGVjZLQUl5YmVuL1d4KzV4?=
 =?utf-8?B?QlBkMWtDUVBnSHZjRldYRnhKUkhSMy9FZDdTRTRxMGlZMGlLSWZ1UzRHQkFk?=
 =?utf-8?B?WUNqTkRXT0JIN0VWcG5xdFdpbi82eFNTL2ZvcUdOa3hyUVVBbHlqb2QrcEIr?=
 =?utf-8?B?YWg2aW9INWg5QXVnblFVeGVNc1VEVXc2Y1FFNVhjTmxGbGFXbmdEQjRYa2R3?=
 =?utf-8?B?bmRuVXRHSDVzWDhPNWhySlFMS3pCeDJhTGZVWFR3bmxNaXZ5dVhSemRDSkpx?=
 =?utf-8?B?V3BLRzRmOVZRaUZsN2tOVTArTWFVZE1wd012aXVwVU96NEhXRHhHeCtRbmk0?=
 =?utf-8?B?YU5RNUxDczVHM24yTkFKbm03RmVVL2JUTm5uNW9QTXJOWlM4d0U0eEpoVW1S?=
 =?utf-8?B?R2pRSXc3NnNNMEpoQlVxT1dFREV6Tkx1eTRTRllQc2Y4MkdqT3d1YmdiL3dS?=
 =?utf-8?Q?ZsHzQDPmux7uT4OxaoKzAnpgxFHc72Yqvrgb8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a15dbb-ba37-48db-eb37-08deccdd6d56
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 02:00:53.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8qTcnPEKY7wDarm67VsOk9uXjpSOV2e6PlTiX3y/9fYz0HlW+kVtk7IPVhlzQZ3wYtYQSd83Xx30n95RXbV1TeKmRLMXFsJiKqUHcK7QZmeYhfDlYRvg0RfudjJ5MWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

From: Joy Zou <joy.zou@nxp.com>

The PMIC PCA9451A and PCA9452 have a default power-off debounce time of
2ms according to their datasheet, while PCA9450A and PCA9450BC use 120us.

Add default_t_off_deb field to struct pca9450 to support per-variant
default configuration when the device tree property is not specified.

Datasheet reference links:
- PCA9451A Rev.2.1: https://www.nxp.com/docs/en/data-sheet/PCA9451A.pdf
- PCA9452 Rev.1.0: https://www.nxp.com/docs/en/data-sheet/PCA9452.pdf

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes in v2:
1. remove original switch case changes, and add default_t_off_deb field to
struct pca9450 to support per-variant default configuration.
2. modify commit message.
---
 drivers/regulator/pca9450-regulator.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 45d7dc44c2cd..c41db70fa052 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -44,6 +44,7 @@ struct pca9450 {
 	unsigned int rcnt;
 	int irq;
 	bool sd_vsel_fixed_low;
+	int default_t_off_deb;
 };
 
 static const struct regmap_range pca9450_status_range = {
@@ -1209,7 +1210,7 @@ static int pca9450_of_init(struct pca9450 *pca9450)
 
 	ret = of_property_read_u32(i2c->dev.of_node, "nxp,pmic-on-req-off-debounce-us", &val);
 	if (ret == -EINVAL)
-		t_off_deb = T_OFF_DEB_120US;
+		t_off_deb = pca9450->default_t_off_deb;
 	else if (ret)
 		return ret;
 	else {
@@ -1304,21 +1305,25 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 	case PCA9450_TYPE_PCA9450A:
 		regulator_desc = pca9450a_regulators;
 		pca9450->rcnt = ARRAY_SIZE(pca9450a_regulators);
+		pca9450->default_t_off_deb = T_OFF_DEB_120US;
 		type_name = "pca9450a";
 		break;
 	case PCA9450_TYPE_PCA9450BC:
 		regulator_desc = pca9450bc_regulators;
 		pca9450->rcnt = ARRAY_SIZE(pca9450bc_regulators);
+		pca9450->default_t_off_deb = T_OFF_DEB_120US;
 		type_name = "pca9450bc";
 		break;
 	case PCA9450_TYPE_PCA9451A:
 		regulator_desc = pca9451a_regulators;
 		pca9450->rcnt = ARRAY_SIZE(pca9451a_regulators);
+		pca9450->default_t_off_deb = T_OFF_DEB_2MS;
 		type_name = "pca9451a";
 		break;
 	case PCA9450_TYPE_PCA9452:
 		regulator_desc = pca9451a_regulators;
 		pca9450->rcnt = ARRAY_SIZE(pca9451a_regulators);
+		pca9450->default_t_off_deb = T_OFF_DEB_2MS;
 		type_name = "pca9452";
 		break;
 	default:

-- 
2.34.1

