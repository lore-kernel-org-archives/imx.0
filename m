Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF522E6CA8
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781748062; cv=fail; b=AxAt0pHv5yjdtQQHXShulZDFPFsFGrm9w8BmMd+e+OYWHE72ftpbvbpBSy8uGH8ceCRl/7Ao/QzFLqFNI/WLQ3yMLEkd5cIRMgpiiXZtEgty0TMHVDrtEQrUUu92Ez8StLGbXYlmxg9GAxtDESLjBTCqvYBzFXb2g68JlvTRDLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781748062; c=relaxed/simple;
	bh=gUJxFK2QmaH9pO69qpy2ahrgkdj+TftJb/2dxjT7Jtk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cBKLIiD9TisAwfPpHAEWJE93Wu+uccWsWmjYZWAm61OaovXDWZLpmaMu4xXN4TgpBaXOFNy2QJen9VAK8rN1hZeKiMAx9aQ+86xUvx6z41DpY6SHCTQ+nD2vQN24pdkdrcDsYHX0aoueXys4NiyCZPuyJShGIRUgAiGyCRkNgsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BFks74P1; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BFks74P1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAdNzBuaQwBQq7T5VtkPumEmj8mbZZ/NGjn1ljbKdIY0R+kuu45t6eYXau/54BlE8afc13LMQx1OCkwbbmUNqmFhbn2t7Aja0yZkTc78mlQqVOin0jPZCThThbg0VbnLsw/GEQ/dXiyGhCgfraLirfHy1Y3whcvZA7z9ukhaG21Nc4bWA0f0VRDWugRN673bLpAWpjLrlzCqsK1I8AMnEMjnoowvsj+fpS33yiWb7BU6n3ZjAjVQy8aAEQaxsj5gLjINRejX12hTXi6CSCaWeazIYm1EVNYjSr4o/GqESuc11uymTGmz09B0Big2IKIpfdCJCX8IdzhVx67G2fVSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXKArMB51hhvDeEjXZKVu61vzsdKqM2wz418g30MKb8=;
 b=sGsFAcst63mW1+62BwvDt5sBOxLT2RqYavd3vCsVYAjwb8Xrd2CEz/aScdHb+etv4oGP0pEDP3Z8wvuvMF2XRxceq8jfgETNPTPdX2DbR3x5kYsAT2P2hEZLGSHpJADo2jiuEAbbHuAqw9Gfl60P97EveXuXcJjP5graTh8oiCvDJjIiQg3ICaoyXtTzimp1xH+ajrS/rjoNWckl8Uiyzg4imC8Gg4bmJ/rJ9KW0u6Y2aa5W6ydeIjlg9IGIiCrRN27B7alCTzEqF6KUW3uAaPoeBzixDsMlDuC55QY784F2nN/95+az2/TQP6ELZwRICdqKCBWlM/qMBcS1VJl4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXKArMB51hhvDeEjXZKVu61vzsdKqM2wz418g30MKb8=;
 b=BFks74P1FIU+FbWttYAA+TneGlntXkihctu7LBHHz5j64AHHB/eLYhgxRn40fLYgduzww7SO9yMblvh8I2gcSvVllJ9Z1dAnS6rsu9d6slPdqeJQP2xibF25G8qzKyzDatCkcCEtOfOKWrj5gk241TVnA1dMX5thZJcFj2Ebiv7pKQ5kx9v3FafgMpdzQ6bg9f6EEdEszEWVsYYClxXvDenDuk83lRkzsR4wHbwhAtOZynUdROnBpKMrKHBS2nWQCvyVxkkqvSg1miHQgD6hiZ0UTGoWjO4/fVCVP9pn4N+aqupnYEuh4LjEb0mw3OkvVePOyhcgX1Nl3WyQaraSHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 02:00:59 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 02:00:59 +0000
From: joy.zou@oss.nxp.com
Date: Thu, 18 Jun 2026 10:03:06 +0800
Subject: [PATCH 2/2] regulator: pf0900: Modify volatile register range
 definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
In-Reply-To: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: JH0PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:990:77::14) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e7b65e-5b4b-4c71-0218-08deccdd70f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DITa2kTPxbgOmKKFu47inDCZE2kVNIfN/g/3KjoemVg+dAvz5NxJ8/Vo1Yeha+pxUi8OoGa7PUUAYOmizelKFuzWc/KTtu3LBz++agpWfuIpXAk5lZdQe8wviW7Un1UOebFHpl3xRutjVBIueT/p+ipFgOzp6gHsXE9zS7Hi30rvj+UIL4rvNMe2F7rfAebDxVrlGQU7ecINdpKxWvBWKjwQ0EuVJFBMuiFwbcXCe56gd1McwOkE3VOFEFjqyLb4AtRCYRByG3KvU3TgVeXswy/HMjPxh3AsQP2EaNqUWjZul6neAiHv6P3mSI0pXqebX4OO4CkaXiFO5En3K8puuApPzzAWndKbb4NOuqzPFeW3RoUZb7E89CLAGNnBYplPs27vaNKwAwXdrFUaZxTC1ECxCuyC8ZZmue1SIe5U4b1MtSoMsYk5aHiIbj+CySyUGaNFErMvh0sjtmwmX4fHaARnePKiPfamZlS7IeXMF2FHsZsCedGnuiEMjnaJxE1RMFvl3FqWqv/JaUQenHhIQWNhAQEA/yaTpjzOLCY1UbIW1XVeuVepUhh62yDgi4xs3PT5JQDIbGorD/Vz9E0wPkPM1djnccKiIDW+wbILt2dVXsKNTa3jfpA12A1/akJ4UsdFCawUilsnaF8J80T2xq+vKgiDl6fHvkpIJu0g048oWfuW4nhzQIT5xCamfPw2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZJS0wxdlNQeS9xVDM5ZHhWcmxzd1BaaHFpbzJVRDh0a01mb0FOU2w1N0hw?=
 =?utf-8?B?QkFZUkludFNtcEh4Y2NNeFZXc3h4Z0E1TWhPNmRYTzE0L2g5eFdPaWF0NERV?=
 =?utf-8?B?dXRuaDhGamFnS2V1YVBLUk9KRU1ZaTJOSDdhWTl0Vkw0SG10NHhqSjNXOTQv?=
 =?utf-8?B?MGVLQnpvYU43bEhBT0xaejlKZ1NEYTZTUDdhY2lXQ1FSR21rRUxXc1JiajM4?=
 =?utf-8?B?Y3B0ZGNPK0RPbUFwaU1GSUJoMFVleGtHL3ArbldwTlZQRXNaSUJ0MEVTKzIr?=
 =?utf-8?B?bkRlVmhSUWlGRGN6YStxMXRrY3ZaeGpQdU5laUhSby9zQVh5S2IyUDRRRlBm?=
 =?utf-8?B?OUxSdHZzUHQvR1NlMnd4NTc5ajB5bXo2UmFGRzNlWkNscW55WVB6dUNHZ2M0?=
 =?utf-8?B?ck9vZyt6ZG9JRDU2TnFhT2twQzJUVXJnaWM1QjFHUFZhcU1JTVN5OVBMZHFt?=
 =?utf-8?B?SS9TVUk2cWFLQW5Lc283aUJrdlcwS2Jja21ZdE14SjJUbG9Yb2ZEV0l1Vkt6?=
 =?utf-8?B?SW4yRjVGcEx6cEEzQjRiVjJteDdJUXVZUW0vallueXFZUjVZRTBUbDgrSlFO?=
 =?utf-8?B?KzZqMUhOVWcrWjVMSkp1NGJXZXYrakNNTWVRWnVHR3dsdzl0bzlPQkNiM2ZT?=
 =?utf-8?B?b21zZ2xSTFhuY2dGS0tqNndoQlloRENzazUwVXRWekNBRGxXaWxZQ21HaHFh?=
 =?utf-8?B?dFZhWDl0ZGk1VU5GTWY1dzJXN1gxUjEzR2FzdTVMNElIQnh2VkJwd3dmZmRU?=
 =?utf-8?B?UlFMR2NGRzBxVkF5cjBvQW5UbDNVOWxuUnhUTTd2VWVFcmVCMC9FVGFyeWdG?=
 =?utf-8?B?bzMwclBYSytsbjVldTl3bWRhYm5sVUdKWHZELzlSVUkyYnVVWjBmUUZGd0VL?=
 =?utf-8?B?QzlvQWdtTS9ZcDM4dCsvcHcyUU1RMEU0VDQwSVJtMnY3RnVQUDdWQWFiTHRw?=
 =?utf-8?B?T00vYXNnU1JjWDdGTFhkL01BdmlFQVRNT3JWQWtpdWFJVHozMVl5RHJRbUIx?=
 =?utf-8?B?SVA0NnlxUHdOdDZ3VVcyU0ZPaHRsTEFvNkFGSmN1bEdGZ3QrWG42MlRnM3ZD?=
 =?utf-8?B?dkpYOVBmaWNjcGVYNWJ3bTJ3RXVFUHRQVlYrU3ArdFpJSDUyTEswV0lZTUxD?=
 =?utf-8?B?UlVUZkRrRTJ6ZjhNenM1akNLdjJYOWxoOFQ4eGY3RDNtY21wTm1XM0ZZaTZu?=
 =?utf-8?B?cGowSVJpMVg2LzgycFMzTW5EWXExSmcrTVU5cXhUS2k0ZE12N0Q1aXhvSis2?=
 =?utf-8?B?Z1Y5VHBsTm1yM3NmT296V1ZiaFFuZWZ5a0tkTU8yb2VFMFFVWDg0RWpPZ0Jz?=
 =?utf-8?B?RUpsRHdWaDNqSXZELzM0WVFncXVZMit1SVNjTVVJdEl1TmJXYVRMTzBUakc3?=
 =?utf-8?B?ZitZTTRZaUdRWjB1QUR2NDY5TVZmMmtPNzFDL1RCMDVONVJUSHhpNnZ4Q2hj?=
 =?utf-8?B?Ty9FTXhiaE14Z1BzMkg0UURpME5JYU1zZ2lSWGtNTE5LY3NSV1pJQVdCZ3Y5?=
 =?utf-8?B?Wk5ZTVE4U3lQdmQ0L3dDU2c0VC9xc0JaWXFpek4yL21KeGFCTW41NDVKUDVD?=
 =?utf-8?B?UDBCL1pCY2U3bjBPdEdORitrYUIxeUYxaFppaEhVMGRCNEU5NFVYaTRKd1hs?=
 =?utf-8?B?MzE2QTVNRkYvYmJ0UVJSeS83TUs2MzdWL3lhNzY3bWN4cGpERmdvams3Rmps?=
 =?utf-8?B?WUZaR2h0c20rekd3eHZpOXBXU0piWkVrT2xGdllNbFR6U1R3VDFPMlJIUDBO?=
 =?utf-8?B?b0ZtK0VJWmF6MmVpVHRpUk9vTWZaZ0lTZzROQ1EwcWo2SkEyNDZlMWdMNWRp?=
 =?utf-8?B?MFR1Y1l0bUVESU1iR2xMQ3dCUlRLWVVTNVNWemFCdWNkb2NXZjBlSEt6cnZQ?=
 =?utf-8?B?bjh4UVlPV3RyZDBNK3liWWlVdjZEZ2hBQm1hK2RKOWhyYVJLOXcyd3pQc0xp?=
 =?utf-8?B?ZEltZWRGKy8wVHBFL1A4R0F2QVlHckMwKzQwU3ExRGVGTHBtSzBYK3lsZkwv?=
 =?utf-8?B?TFRZbkpSaEVLVXVqQS91VnEvOFlMRnVKY29RcUJwcmxMMVNzQXkvc09lMG1L?=
 =?utf-8?B?Ty9RSFZxNDUzUEFuWHVkR0h0SUtTVkZvMFNxMUNzL1dBd3BQdStmREdqNWZ6?=
 =?utf-8?B?SDZDRWQ3aU9WYUJOUjJMMVNRZkRsSkZaTXIzQmQ1RmhTMGFDbW5LRWdRTEty?=
 =?utf-8?B?ZWRtZmVGRitNOTc4alg1QURiTWdRRmdqWmZZUEMwQzBBbzZlT3dzSGVjakpS?=
 =?utf-8?B?UGZSTmVhbXMzei9uU3dtUXhJZWdDVG9JWFpmdGJ3ZS9McVhvNUJiRHp1b08w?=
 =?utf-8?B?c3AyT1NCek0vd3NLck1NYXNmenR3WjRmSlZMZmlGc2lnRnN2czNxL3FDOVhH?=
 =?utf-8?Q?awRSsUykmiwTnqZk4u39GpEkoQkcVgZGQp5xA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e7b65e-5b4b-4c71-0218-08deccdd70f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 02:00:59.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAHS/Di32wsivcKx5pu8MSMB8XvPAozDJ10nKyTwtqlsLBnPa9aV03tl2Pp/p/FwpndzjtP0O6LVLTPeGUzaVoz21faLQyXa6BmksIZRSdI6E4gchxZRnmi7hZF4/Umf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

From: Joy Zou <joy.zou@nxp.com>

The pf0900_range was incorrectly defined as a single continuous range
from PF0900_REG_DEV_ID to PF0900_REG_SYS_DIAG, which includes many
non-volatile registers. This could lead to unnecessary I2C/SPI reads
and potential performance issues.

Ensures only volatile registers are read from the device
on each access, while other registers can be cached by regmap.

Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 drivers/regulator/pf0900-regulator.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pf0900-regulator.c b/drivers/regulator/pf0900-regulator.c
index 5c44d2dbcab4..bca76c58ed3b 100644
--- a/drivers/regulator/pf0900-regulator.c
+++ b/drivers/regulator/pf0900-regulator.c
@@ -284,13 +284,24 @@ struct pf0900_regulator_irq {
 	unsigned int  event;
 };
 
-static const struct regmap_range pf0900_range = {
-	.range_min = PF0900_REG_DEV_ID,
-	.range_max = PF0900_REG_SYS_DIAG,
+static const struct regmap_range pf0900_range[] = {
+	regmap_reg_range(PF0900_REG_SYSTEM_INT, PF0900_REG_SYSTEM_INT),
+	regmap_reg_range(PF0900_REG_STATUS1_SNS, PF0900_REG_STATUS1_SNS),
+	regmap_reg_range(PF0900_REG_STATUS2_SNS, PF0900_REG_STATUS2_SNS),
+	regmap_reg_range(PF0900_REG_SW_ILIM_SNS, PF0900_REG_SW_ILIM_SNS),
+	regmap_reg_range(PF0900_REG_LDO_ILIM_SNS, PF0900_REG_LDO_ILIM_SNS),
+	regmap_reg_range(PF0900_REG_SW_UV_SNS, PF0900_REG_SW_UV_SNS),
+	regmap_reg_range(PF0900_REG_SW_OV_SNS, PF0900_REG_SW_OV_SNS),
+	regmap_reg_range(PF0900_REG_LDO_UV_SNS, PF0900_REG_LDO_UV_SNS),
+	regmap_reg_range(PF0900_REG_LDO_OV_SNS, PF0900_REG_LDO_OV_SNS),
+	regmap_reg_range(PF0900_REG_IO_SNS, PF0900_REG_ABIST_IO),
+	regmap_reg_range(PF0900_REG_SECURE_WR1, PF0900_REG_SECURE_WR1),
+	regmap_reg_range(PF0900_REG_WD_CNT1, PF0900_REG_WD_CNT2),
+	regmap_reg_range(PF0900_REG_SYS_DIAG, PF0900_REG_SYS_DIAG),
 };
 
 static const struct regmap_access_table pf0900_volatile_regs = {
-	.yes_ranges = &pf0900_range,
+	.yes_ranges = pf0900_range,
 	.n_yes_ranges = 1,
 };
 

-- 
2.34.1

