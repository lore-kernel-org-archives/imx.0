Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495633451B0
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687444; cv=fail; b=GKwyI0sTwdb+3o01CgEYn5wMXte8nY21tFdLjyHlnH1q6227j5hcv7EkNHnKp5iGNHWybtL8TxtI+ni94TT4qEXbE1C7wZbiTCJfD8XJlUmII3aAGNa8ZcN4MACZZs9+US4jdgMDJRQukYHsET0jwWVHwLTV+kAx573FGOWlBeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687444; c=relaxed/simple;
	bh=dGBNbkyDuv9uluU/59Fv24IOEyyLCXddhTHfujydOss=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bThfT+diydnnyLbwPpgf9iObLXwU9tCKjMoLG0M4KB9NiJygGwBE7fILXoACMLyLDXMt06YbCyTBINkOO2Va9CBVsbFmwaHD3264hINcYUExU11+WZd0TSKEArRV2EkLgKl0b3nKn035u24SYy+3is9rVIaeWC/u95fuqxLMnVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vxkhUI3I; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vxkhUI3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjI8arYVoiZbIOaOkPmRgdm/37JTEkzpLqeJyvLGxBUoJHva+NXf0jIk/BwNhkPnAu1IHGf0aJRg6FoWn7+Y+jB+EFB9shngQh5fRTilQvulW/9R+QInkrfz2Mp6Z2qYQkO8MhFUNGclf7nTgqsh0drHrrp4u7efN7RhYvf8+19bLWoHJeZ7jWSWfOqtD3yehMuSO/6LlZfGfyKfBNfzdx4DFxQNlICt254T9awT7Fqw463jY7XedmqH2NZORjVSxzn6NDdYUYpE41N40d+4AyQSDCnKkLnqJuP9B7zub5ARZ71V5BiQiPXkY+yFkkUyvco0C6NiE/R+UbmLjILxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsWYIAO/DCcOy0LRTwZoY6JOFKjZKsMx7wrx00COkzc=;
 b=i5M8j2+mF+35TajPPagGESkXx20MCUeZzfCIhWs1R1kWAyTZwzu+OU8I9d5b6UD7g9d2jgRRsgRWHDoMRNSjpfsZPEOFb1lh7VY+0y01xcK4RsC+RAb/cekw1UOrM3QxO7bm2/GQG4yzeQHt5sxB/u+fdHmiTne0I3VTzfYIL5EE6WT0nV/zNtqioveReT2cQjCVnXDZwtMuZ0f+tjtlcCBgRmiJp8P0EkOe074FUXra31LW+Q2K92urO6XlCz1W559sOo5FggrGba5QLp0NDyjN9XnqggcPwyPNqXigft5bWmyyRj8SBEwOrBJr+ecbG4EVjeAENTkpybjeT4fy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsWYIAO/DCcOy0LRTwZoY6JOFKjZKsMx7wrx00COkzc=;
 b=vxkhUI3I59rrBAhkuJ/SfLkIHqIMDqQOPDen9bL86dUOeyB8JkrpCwHKJi1sUgapYvd+OnKpYBBwEGTu+FKSSccnfR20Jv+/jBCiIenn/QELJHvIFsSkFzY8rtu0bz90k8EjAh+w9K4hrbRklQDT6ZEuim4Wc6ePlc9fxNlsuinHCo+DkA5wYa6MwZ4bK2kQN7xtUmpIPSYjLZvMUgxbqmh1bGbTM8Gouv2mkHdY3A6BuottUVoLS7A2DocS9cSdOGM7Og36pUilovUo5JVtO6Zzc/50aqJwjKEA4a3A/Bbmm+pl3fnOcCtFgdcejSw5+wtwswAdaU2yv/fS7L53YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 05:37:19 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:27 +0800
Subject: [PATCH 4/7] firmware: imx: ele: simplify SoC device registration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3722a2-8aa0-483f-633d-08deba1fafb9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XjNGxgsF2dJpzjgt7MqAlSofBM2o28xx/hCuiukSzdpGWxisAVzEmM49FV4p0iWiLsy7yq2MD6BVObhWEqqxwiXlCgr2HelkoB7AplGoqzEAfV3RFnvk1JWTQAbsxefOKTIRAzxWDpmWghKwWfDTjqycg3vYoZkQGiUj2//K5s8sC953SS+R9Ap6qyg49Y3cNdhjOzfk3qM3+z5s7+UYSvDMz6M3fBUgDWnh1FVAax7fT5fu8+cA5UQDGEww5wL2pxzJI6GZ+OwKiGLgLM3XQ6/5qRwURjlYhYYLTvioauLQBvETgQeYqkCn2HzeD6lG05fgHzQTUGpylkKDapeIsvH7z3NYtohK9g+9jZ/EClfhTFjjjB0bLPfrdyTyp5YhnV05JH4HiAb3tWtBWFeaIEdS7Q7HipRxQEfGTP68rKtIlVWWM3uJRuy30oS4v+Q2oErJBabHm1X5RO7BaBbPva9HxldcuVezbwyF8XzBGwLcqQcWe743Plw7NdO3h6EIKgUhoMNR7BDiFarA4KWkQD2xFFRH5axfzkafeWhctED90tgFE/C1dq55ZH92l/uNn/N7KXRNfwik3zjqiBUbnDeUe1KA1iCR+QP8Has5DjbMX3Nq3yBhrnMeDu51GODIqevTg3zf0W1xXytfjZL7YkJkFl9dv9XyQzje9n6WyNhBkkeIyMU18Sfy20G98yyIR4vBH8ySRCJs1haszBGUO70b5YootC6zmzPfd7NlDOi4G2AylYfFvf4SDum/eHZ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdNMTFWSzJxZ3V4M3UzNFVUMEQvQ2lYd0V3bEJkR1VTemwvbzdsMW5FM0pZ?=
 =?utf-8?B?VUh3L3VYMDdZdnNmUEptU0tZMzJTcFNyM3UvazZJQVFxRjdrbUFxZ1lDcDV3?=
 =?utf-8?B?MVRhOFNCK0VXMVVxSHE2cTBwemE3NkI0TzI1eUNVbXJzOUt5T1VJbDRMeFVX?=
 =?utf-8?B?aFh2eWg4NUtja3N6M244UUVYcUZlY0JnN25zVlp4UXpDYk5NaFlMdFczZWdx?=
 =?utf-8?B?bUVHVVRra3IzZWlVc3ZpVHUzR3VJT3NxZzRaQmF5KytDYTJhOUUwS3RaamJM?=
 =?utf-8?B?L2tZYUtBQnlORlBaZVJXRndlSmF2Ym03U2ZsZDZZRnI0RHhOZ0p3NUJXQVVR?=
 =?utf-8?B?ZEZSUjR4UjhIUm9Sb0pEdGdmTWtSc1kxZzE2ZzNDQytmTHdCLzlwNEdzVVk4?=
 =?utf-8?B?S2ZGS29NaU9QYzdEQTU2Y3JtTU5STG56QjBEVnZZeHlTNFJSMFJmTU8rQXNH?=
 =?utf-8?B?bEFUc1V5TElWZzRYaER1L05DRm5XRUk0TlZjTXBDYU5JMWNmTkFlR1pzVWRs?=
 =?utf-8?B?SCtQZU1CdDVuV3JlQVd5cE9Wa0wvWXhVTmdPVUdLOHdIY1g5TTIrdkZkT2h2?=
 =?utf-8?B?ZnkyTW95OGgzUGlGT0E5Y0ZnNWtYcHU3ak5PUmdYZmUrRzlQYnY5dk82cDEv?=
 =?utf-8?B?czh3aGZ2MTNuNUM1NWFScVQ1eFR2TEliZEUrUGlUUzE1ZGJUaUxrNUkxeGd5?=
 =?utf-8?B?WUFDdGFuTU1HS3pUaUVKUEdsUzVkMUJvOUFnQ3BDMlVzMHVNbUF5amRpdnJG?=
 =?utf-8?B?dElKVzlVQmc2NlRXWGVwb1p1V20yNkNZQUZyTDlWaEltNmhCS01iRnpnMUdL?=
 =?utf-8?B?L2ozSUZIRTdkcDBqeTk2K2NuSmVxTzJWcHZsblFHMGYreWpKTDByb0tVMGx6?=
 =?utf-8?B?NGtGdFJhcEZYeWFhZlhJV2xiL2V5akZnbW5lUzJnbnJ6UmtHZHk3cHg2Y2RH?=
 =?utf-8?B?QkFWQzhZY0JPMzI1bGk1cnhXaVcrNitmRk10RUJ0N0lDT21GOTJDaHdQME50?=
 =?utf-8?B?Ty9ROGxmN0VEUFhzbGJEZk5nemdFL1NxNlVZdEdBVkNKZ3JhRE5Ja3hQbHln?=
 =?utf-8?B?aGUzNEpGTnZmR0lIU0xVTVpRbkgySHJTbzI3blNnZDR5L0tPUDlpODR4Y1hx?=
 =?utf-8?B?Qkc2cHRjMVlRY3M5U2ZxRkFzcnIrbk5VRXByejREeHNuS3FndkxIWlQ1eGpz?=
 =?utf-8?B?SUlDRXFkNTZBRC9iS1BzZjkvVVBpL2dXL3FoMHVlT3JpenpsUnNFbUY1R0x2?=
 =?utf-8?B?UWQ2N1JWR3k0NnZwV01ibkc1WCswUzhqemN2NnJCWG80WHRSR2QwQlhPcGlx?=
 =?utf-8?B?UTlIbHBPTTRSczFIOG1HUVljblVQcUtnd1pDa3I2QlhkQWllUnhCSTVLaGRs?=
 =?utf-8?B?cEtCM2l6QlhvL1hHTFdvQ1VNT1l0NzNpUFVwUEk1dFcvZWxXMWlxRjZFa1k2?=
 =?utf-8?B?S0dYVXZVdDV4dTNqMlNGdjh4UWdsY1dxVmhTdzZQUG5VTGtLT1hLS05jNzdp?=
 =?utf-8?B?L3VnZnpQM1VvbXM5ckF0RmVEU0Vobm5VcGYvdDZrbUs1c3JHYkJpd3NRdkxr?=
 =?utf-8?B?N0lvdXVaam1aK1dnb2N6TEsxbEJKenVEUWZ2dHpwYUFjZTRubExjaTNNczhs?=
 =?utf-8?B?aU1aKzJ2Tng0ZVJ0cFpXdFNqQmNRZS9GTmVqN01Id0RnTDErbGFUam9hMGVn?=
 =?utf-8?B?NlBndk9aQXRSbkwxeFdLeDVBbjZJLzREWWZuTkRSQzhrdU8xa0NoT3VyQ1BG?=
 =?utf-8?B?L2NGM21ML1V6Mm5jdFh2VGRyR2wyeVVPVlBtdWFua3Rmby9TNjdIc3FMOWY5?=
 =?utf-8?B?elFFSGo2L2w2Mm85QmFsYnE0SXJpUTBrSHIrV1FYeThyUWhIV0Z1cklJRVdD?=
 =?utf-8?B?UWZqMisrVERBYTE1dnJycjB0UnJ5TDFIUFEvYlVkUjYvTVVvV1VpclNEejJZ?=
 =?utf-8?B?bzdveGxZTzhJT2FlYmZkcFMvbkdVZGNBYjEyQjdncjJWMXEvS2NEQ2xySGZs?=
 =?utf-8?B?MElCc1dmcXVKRVhmdFBRMUNwOVdqeW9GcWF3UnhuNVlNVnpkNVREUG9SdndL?=
 =?utf-8?B?RkxYMnVFQzBwMmsrd0FwVGtTZTdsTmovWSs2NVp6UWNZYjN1OVFUZVZJVTFq?=
 =?utf-8?B?b2tkTVZjZDU4U3lrRENpcXM0N2dLTkduOHc0UHI3Z2JqdjVicjM2UVZDcXh5?=
 =?utf-8?B?NGdUTWxyaEE2YXBsYVNDVVpFTWd0WDZZcy9uRVFtUGx4K3h2UGtoQS8yM1po?=
 =?utf-8?B?K2UyUUhCc05EamVSRHlyM2ZlNGxxUnJyRGlud3pBTnpuOWx2WXdYWU4xMWFO?=
 =?utf-8?B?WUVZbkIvSkJDb053M2pqVlN5T3JCYWE2OFBUeEFMYmZMNVNzV3M0UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3722a2-8aa0-483f-633d-08deba1fafb9
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:19.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gWGfOUU/SzlR6kDtkHeuhOz5xnngS6hw+eWaS5T0/kx9PR6Hi3Y+K0ZEIFm+HeFHwpZNmSET6nsl/CVvHA5hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996

From: Peng Fan <peng.fan@nxp.com>

'soc_register' is used as a flag to control whether a SoC device should
be registered. However, only i.MX8ULP requires this, while i.MX9 is
handled separately in soc-imx9.c.

Replace the boolean 'soc_register' with a 'soc_name' string and use its
presence as the condition for registration to remove the switch and
i.MX93 case.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9327d47e4312e7f39a5f4fc24dd73566af240a9f..30e97a604eca137f45de6c329081fba234642732 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -56,7 +56,7 @@ struct se_var_info {
 /* contains fixed information */
 struct se_soc_info {
 	const u16 soc_id;
-	const bool soc_register;
+	const char *soc_name;
 	const struct se_fw_img_name se_fw_img_nm;
 };
 
@@ -72,7 +72,7 @@ static struct se_var_info var_se_info;
 
 static struct se_soc_info se_imx8ulp_info = {
 	.soc_id = SOC_ID_OF_IMX8ULP,
-	.soc_register = true,
+	.soc_name = "i.MX8ULP",
 	.se_fw_img_nm = {
 		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
 			"mx8ulpa2-ahab-container.img",
@@ -163,7 +163,7 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	var_se_info.soc_rev = s_info->d_info.soc_rev;
 	load_fw->imem.state = s_info->d_addn_info.imem_state;
 
-	if (!se_info->soc_register)
+	if (!se_info->soc_name)
 		return 0;
 
 	attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
@@ -181,14 +181,7 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
 							  var_se_info.soc_rev));
 
-	switch (se_info->soc_id) {
-	case SOC_ID_OF_IMX8ULP:
-		attr->soc_id = "i.MX8ULP";
-		break;
-	case SOC_ID_OF_IMX93:
-		attr->soc_id = "i.MX93";
-		break;
-	}
+	attr->soc_id = se_info->soc_name;
 
 	err = of_property_read_string(of_root, "model", &attr->machine);
 	if (err)

-- 
2.37.1

