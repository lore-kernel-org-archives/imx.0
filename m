Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121CF3446C6
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687434; cv=fail; b=tUckZ3eKkfM78L8KqIL13Yku3nCnWyxnSg9SVuY1zZplWgfv1F6uI3wRPFE3RfliP0wF/a/NxBp+bJj0o5GZ5rxpztORdwwFWKLhBJzs3o8q3oGZSXr6FEEa1moC3RAYGr3utaNoAMGbSqbO6dwEW2pkdGsyXvR2Jwh7jh5HVx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687434; c=relaxed/simple;
	bh=ent142q6V+ttyHkOYIXWN+tzjb5/2yLypZp18YcuS6Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZmpAVlvDST0WJ7EJ9AWlti4la/IRN96K+hamCGY8fU9QaYblH3duQHogqcZf+/r4sVcNA8mPe7o0HsJTvD0bv9YU5oIIp1sziL4ZN7gwMickJ545KB0hhL9cXVbByCIzS+41efBG6El3OplTZ7hgDUy5ZXecba1Jk8LDTYF3YFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e1bs4Ng9; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e1bs4Ng9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn760qSpNMpOEnnWYKA30z3f1Y/zZDnzguS1XftlUS+xD2AYPNSjuoo86h7E1gxdlsq1iczdK9QbB4ZrkjN0xdd8/XKFpMfwm7zp/dbUL42wnM0Tgg5m4JW4FPaIH66w13buAm3B1YK2UFsVXvNrXLnnrqQ0hxjRLfRVwoBLBvzsdqcb6JTBWWQ5ad21q2zcwSS4HeUcRwIEo+ZKcqgbCvPB1enagQm5tX4+R0BL5O1R4g1SuK5qAAMT9j9psvisrMZ2qlNGMlQoi71pD9MdkCMdorOmozFUh5kNs/Qq4ZjaEZQLYp5nZ2b+Yjo+x/y2fQWqPjBHA8t5IBma3yL37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbtYBEtzx4+EH3uEBaXaiNw3Td9QeYdBAWGA+3W9yYo=;
 b=MAOE2FTTNEt1ebTXZqG6ZeZvMt8U6L7NeX0U6Wa8iyelxghvmDF0NzwBcGIHCRQEUhvpBLezSj6dz1kawDm6ykWztqSe7FB4eKwgeaQcj1i1wJYYrjjWcXmHBfmdtIZFRVL4S+IIs4Etphp1XX4l4793f0jEaSE2FDr3qjfDcfvCn/JzKhIJy9h9P5EzPejrkFFwqA7Uz97qydWLfll+Qx+T7C9YE6kDqhBH2w98q27vVqy9GWnt8ttIQe7UDr20tE3oMx5MNqeCj/xzq8gk0k8rtAkQhNSFZH/Q0XOTGE47rymEusiZR9jKOppg5sVqdKURcHhBR1zDW8+kCgQyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbtYBEtzx4+EH3uEBaXaiNw3Td9QeYdBAWGA+3W9yYo=;
 b=e1bs4Ng9C0ouooQfE89KI4CCHdb/aW5zIEspTj/uvLJ3xBD0In7NiM/x58vRIi3rolbuDwtlIzfhyACNQDgGdRJ1xR+nCDYkEiQOxWP8g1r3W+WpnKrcrto9SarfEiO9H4twBaiFZHp2K6YTuIgO4gsP6ueL9aRPt9b6Ps3+wGxlKOC5900/njxrwSlmajSwO6WBQBICGxUL56fKiEVFPyCCZovS91emagfVD0DhJxUO1Ap8Iu5zkU51eabs8RlvZEceOQMnClqSoDJWTyrWw31480R1ox9hx6hPgTRp39GFICQqBjLj8Xd6IrZ4Ipbgz9tqifWZLzHrypHLzcSwAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 05:37:11 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:25 +0800
Subject: [PATCH 2/7] firmware: imx: ele: Correct ele_fw_authenticate API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-2-a9570c4bffc9@nxp.com>
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: d5df0190-ecba-4bfd-756c-08deba1fab60
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|18002099003|22082099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	asi3UrX/cCDwmPjQEnUPzuZfvJbpQEkwUsqZaC51ZnxvdxE2i15Eg7Ij0pcAc/I9UzuEfAJ+t8/mMkBPDI/CLDPomgNUVKpZtmX89mHThwr6wwV9x/wkrGkDl9xVkVlZNbjhuZjlZtO23u51SRjV+hrsyib5Evz/BFWRHiollzdvhvgbBhe3fbAkMjLvnxUdroduCb3iNHxJShbNmg5xXYgXwa905IC3Jla631YjFOrdWO50Km88cyR4m3YWXkCsRGOEYUpH+LJ+iOYVHOtciDtckGTFpUyC4YZJCw/5B8HdyTV9qYgoN8pNdhzxjO2op2wcw1xhW4zyBM1VsMXd1TWsJk8Ls0SZLL6bPf9aJ8PS1b5JX2FNDPLQDrIkOH8xIqzADNrTx6ZHDWh1GeKoxEFQHp0ZFrTb7/yeGv1uwFJFHCP6CvaOQI19s8Ox1gLxC9KaVMaUIGRtI3Q8Aqj9Ro7bp4TJvL02oBuRnwW94UruVCaDgvxL+NYBm4YeSkA+YLsblp1BpASrj8Z+lsaxQHFK8nKuVgslo0Li+SCLNmpSyiAm6UYAnXqOUa1AMbKfeo4rF2wNAWL0058tGxVlNxpKFaHcouqP/PF4L+4qHeGr1prTOw8+s6rOLeBnRx/8uk5I0XwqH7nR8ai0+l90C26ROq9fI7k5IVf/STLfcZ5i6FzZMv5S8tRk0qBO4ImmPVB2Nxg7FaSw1KaQpIP4P+3dWH71JaW40nAzQpa5PMiaf2fWPeyfL5K+eRAwQc1l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FaVnVxUVRmNStRdXNFb24wN0JRbk00c29vY2dVTVl2dGNGRlZXYnJnd2dW?=
 =?utf-8?B?aVRqdVlBWHlocGtxOFkxUzJjaGxKNmpCbDBpUmwrNXc2aU04UzlRclNRdjNw?=
 =?utf-8?B?Q2o3aGJCeERtS0lUK3NxS3Z0eWVMd3BaMEJtc0hjZWl5N3ppTW5LM3NwMmRF?=
 =?utf-8?B?TWJzcHBocDlzU0JhUTVYQkcrSGsrNGpseGRCWk9ySWNqYmc4N2JPdTM2YW9N?=
 =?utf-8?B?eWVxZU9iSEljejA5L1ZoUzZ1bkkyZDlCYTM3Zms2bnR4UnhrSHJ1OGdvb0JT?=
 =?utf-8?B?VUxudmFjS1hRdnQzcnhkT0ZRUXlRTWNxeDl1eWgvdVh1Vmx3aGZZZUFiRWdk?=
 =?utf-8?B?SWdIeCtybWdsRGVqai91REdvMGlqcjVjQXV6RUdHLzhtUExGaTVjSUVONE5M?=
 =?utf-8?B?SG5JUmlnS0JSd0dWYWlZdGZsWU1PVWZNVzZycTRuVkZIOWc3VVUrd0NLeFMw?=
 =?utf-8?B?eGJnR1lZOXh3ZEo4Z3BiejVxeUVHanNYVHZaU2JpNjREUUY3RHBvMWhkeDFQ?=
 =?utf-8?B?MHJSejRBMkpuUVRiWVFVZ1VHVUVtcE5iM29VVGk4bzdMNDEvMzZwZjliY01H?=
 =?utf-8?B?U291Tmd4Z2tyelZIdXdiS1g1T0k2d0phTjhUc0YxYUNQNGJjWXIzVDM3YXBO?=
 =?utf-8?B?bFIvN2JYRU9BVmJ6QVBZVHVZcmdQMzZlVlk5NSs2djRycnF0SWEzL2FhZmV4?=
 =?utf-8?B?NEVPYkVEWURvZSszTkt1QnRDUU9DTDZQYWhVZFNpSk1oQXdLWjVWcStXUGEy?=
 =?utf-8?B?Z3NhL2NLZWd6UmxlUzBhbnBwais2cWxCbGNHcWVQekxzdXd4NVFUZzZBK1Uw?=
 =?utf-8?B?c01HajZZd0tGbW5VeFV6WHArNDkvUzVJeWg4SWNDbUk1QjlsN21ZNS9QUjlh?=
 =?utf-8?B?QUdEVUI5Y0ZSc2R6QlVVWklmdlhpb2c2bE1JQ3VFTjlGdzhlRmszQVIweUpp?=
 =?utf-8?B?ek85US9RS3V2cHVibGtjdFJSUThDcENGWktNWHVwZnRxZE9HYWNYekNONjlh?=
 =?utf-8?B?T2dUelVvWmw1TGtHd3dEekhmdVU5bm9qZzlmQnhDQ0sreUwzS0FldU4vN3Ri?=
 =?utf-8?B?UVdwdkVNL0QzVDQzVHRMQjdKSXRLSm14ajdSVlA4ekM5WVcxRkQ1dEJVcElp?=
 =?utf-8?B?UUNFMkt6dUx3Q2w2d2NqZmxTUFkzOFJkZDB5cUFwQ2ZaSzVKU2ZpWW1mc010?=
 =?utf-8?B?U2svTnJ2Z0p3OTA4SE9ITi9IcDdVOGFUZXFHTzFOekJyQ2hkemg2OWxJZTVR?=
 =?utf-8?B?a1NYcis0UHA5ZnRZY2FsaDNIWmlUTnhVUFYzSUoxbWxWSGYvUXRBSG5kTlpF?=
 =?utf-8?B?ZlJXTDg1ZDdhL0ZmN1VnMVZWWm5MTzZ6OHFhN3BTRTFBbE1kVlU4SklXREZm?=
 =?utf-8?B?ckJBcmwvaHJqcFBTTTBNdndTbXF6WFhLVHVGTUdXVjZjaVFjY0NaWUJRbXl6?=
 =?utf-8?B?TUs3S3dkZ00rcG1hZGZNa3E1N1dlQ2hpNlJFNThSWTF0N1JiUnY0dTlmSHZF?=
 =?utf-8?B?LzQyWkwyWHlINFFrb3c2c28vMTZ0K2FjZWE1M1NtSnR4cVhOeUZXMGlKWThF?=
 =?utf-8?B?bkw4Q2JSSU5oelhmb3duUGVLZnNINjRwNEVlNjBVanFoU255TFpRL2VITVVU?=
 =?utf-8?B?TUFJN2F3TWlDMkE1VkE1STgwdGd0Q3MxWHkvTVNRV2lwbkVpYXErU3FUVXdw?=
 =?utf-8?B?VWZMZisxclVtMGhIM21MeCtEUDExOHQyd2loT1ZsVGMraEtONHNBWmtJekJM?=
 =?utf-8?B?SDFOVXhXb3U3L0ZwRVV5NjVvT0d4VzlPTHcvd2VWdVVtTmZTTVdaamtNdTE2?=
 =?utf-8?B?L25vVkZhZzZadzM2b3ViZ1J2VTRISG44c3g3bnFPRUFiZWJSOFk3L1ppK2Zv?=
 =?utf-8?B?T0p3QnpWaWpCNGFVUEw4TUxQZHdpUWJ0VUhLWXNWTEp2MDVGQ0V1VXN0K1d6?=
 =?utf-8?B?WEFIZ3phZFJQR2MyRlB5Z1FXOUVFSVhMVDY4WTRFdmFIZUxPMXpEdVcyQnFi?=
 =?utf-8?B?RitwMzRXUTZNbnVkMWlvekdLbEtBbTBOTWhsTnlUQkF4bFFYUWd5WVNHbk9G?=
 =?utf-8?B?WkRmdGM0Ti9HUkpibWk1bG9YTW8xRlcxZTcwamllV2ZiTHRZUzhTSFV1VlhF?=
 =?utf-8?B?NzJyL2hZL3NoL1N6Z2J0WFVUb1BBNzFtaUt3UDR0b1J4RGR6aDNmK1NaK3VT?=
 =?utf-8?B?ckFpY243MmFYUkx6QzF2SElNZXZzTVh6QW1qblY4Rlo2eU1JemNDN0l1RlFq?=
 =?utf-8?B?U1ozRit5eUMrRXExY3M2WVprcWcweFNRY05aWVlQVFBYWmxWb2dLRldBMFBQ?=
 =?utf-8?B?aU9Zd2kwekxGbUFzaDRTbmc1bFJUNmdZZXdRN0hUV0RRL0hncUdaQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5df0190-ecba-4bfd-756c-08deba1fab60
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:11.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0xkU1oRf4LfvSvVu4lMfiKMaGqgwmsJg2m2qhQwQKQ30LMgI2NlswjbEyTpx1Wwf0fH25brvRLiedG2bazgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

From: Peng Fan <peng.fan@nxp.com>

The command format is as:
0(32bits): Header
1(32bits): Address of the container header
2(32bits): Reserved for future
3(32bits): Actual address of the container header

Correct the data field to only use lower 32bits. If upper 32bits are
not zero, fail the command.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 23f68076b85ce3ac0293bb98e39310e20834f7db..f6346f15450963b9dd8d2df7d3e6b2ce6b4602ce 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -208,6 +208,11 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	if (!priv)
 		return -EINVAL;
 
+	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
+		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_addr);
+		return -EINVAL;
+	}
+
 	struct se_api_msg *tx_msg __free(kfree)	=
 		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
 	if (!tx_msg)
@@ -224,8 +229,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 		return ret;
 
 	tx_msg->data[0] = lower_32_bits(contnr_addr);
-	tx_msg->data[1] = upper_32_bits(contnr_addr);
-	tx_msg->data[2] = img_addr;
+	tx_msg->data[1] = 0;
+	tx_msg->data[2] = lower_32_bits(img_addr);
 
 	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);

-- 
2.37.1

