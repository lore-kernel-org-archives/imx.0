Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF433E6DC8
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916473; cv=fail; b=W7Jsm3YWSB5Qmp+zsirSeFacYJFYN2DoWfB7aZLIjv9HZoUc8yg/UGbgN+2VYjCSyiq983n+RvEBoNkidXNFZz304zQgX0T1g2ZxGej9M2/JbgEq0+fi6Q8fMGTQZOp1ZCoLDOUJ2jvjHMLNxEgpRmT93Ox1gR9tkIK1hW0zN34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916473; c=relaxed/simple;
	bh=5MzuD8hrl7ivtBZHQ5Odv3jItIW6iQ8gZgtAoT2CJOw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=co9X3DDMynr8tCTOaH0tEuQYdRDiiqfU5Z1MnubuhUpKRBYVld/4//delSzdhKJnB+cW4lm5K5zz47VtEDvT/VqVm7d5mo36/RM8UEIADUJT2CHiCQxMy6pTGZcpO/0efam99CFgUp+UzNF5s8FL+TJw5d6oMUHuoTKVY2TePX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IBbYQAMW; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IBbYQAMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sryACTwHh/ouAzOyuFUqcamo/q/WDhdOPTSDf+AgnPsiqt529MdUssLar4uegBqkQUOYiAzHzqpPu5yWR6+ZZZd2BO2kBndgH7m4naIW1E7t0yOr27XSAh6fNnJaVY5u7B47ysEP5msntrthHoK4x65RiT+H4CsuvSg87RvugzZLUKbxT2ST8XBYB7BkkvsxQj38gzWHjz6vokIY2HVXr+y7d0PdZ9KOc2DB3fKjmgks4CvqxvvRopedLl5F95i909B+fpV4Zdk3cZk46WZGJ5B+FyKrgLruf3GDFvTtpn/efgPQgBwPN7tT2p4OIuvSQSGrTMnOgUuOisVDCXNXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=RQPxk23p444ozHcaIU3tRXkvoKShhU67JtpE8RzI8N12bEXxR0I/irn9Sk3IujBjiMqXPLePCW0BSYulrqkFMRMqUkGIDDQAfkVEWusSFQ0Ml1aJSEM2HaD3j1I06RkzjnF7jIOrOBp1x5wT6DDW6p3nZ0qY2pAnVd21EW95GhV9QIf+Sm3PlR3CUQ7lepjB7AOlR0XiIVe5wOob92t7Qlai8OlcU93bycm8uwl4L5WDRXn+Ag6A5a+EGi4CfElstlxW14Ja+sF8oYXvIm3bsVt0Gx44dwjFS6F3x4EUjT3ehN5P9mDUkeT2FAaeVTYasEUB2JrEhullgUYYtDcoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=IBbYQAMWBoGqQsDqvpXCxoUM8f70CDdBOr/uOqmBgTxlJqVp2anuztBgifoYbYVfF7wRxFrDOVgZx8B6R1IKy/Hh5dsej4Hu62iMj3Nitg94KHn4Lfm+uh5J58PtIaJgbJUf+7jkFB56nr+e2YzZXXFhXZqW/qbQGIHkxJXFUUpfrsHcL0hrPt+I10ize4rGtHp0yXvlBvO2wCkm1xF5CuPSdNjVdqlOEQLEdxbHy3da5PkIqmQ6b8sbi8TqtefNTdDge5d9xYol+BxOxsM9Om4iQhgxeH244E2Zz1hA++37Ow549Ks+yI3FViOPA5h5OWcTIQoBX+sjzNg0B+LCYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:23 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:23 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:50 +0530
Subject: [PATCH v33 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-4-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=13976;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=rboH4Kq8cEx8ii9v1dt0V9U4MBQ7gMQYcVOHTD++Nzc=;
 b=lgl+bwA75CC1S//a2gwjkHtSOv1hR8c8J38hASMsUfFTKGkRP3Iric7k4J+Lj4RYo+u/A4RLb
 rSOyMQiO0ZICa31wqxcRRi5VNXgplUfqnNzE00NMYlyXiyR3yevr2DB
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d45834-7936-422c-b33a-08def2c6c3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hFR6fZNe8E5Awm7cH0G5v+lElOZK6sp8fC+toBSRYap4l2AoNujKDdKjgEPp9N5wwtyt/caWETfJIFs8MsIejZqvO5F+0GO/CazLIuea3vKEBPJpCOM0DNAs3B8e4Gs7pVPyOtJX7Sh2nX0twwUHL/J2atn4DXtXqqjprSHVMy9yB4qyJglweMAh/toDg90uM6WGfwW8Pm2Jj3tMHsW8qtZ6Vpbrwc02IMso2y9A93gDYNpn6dLAddxlvrVoHgjRvTpmQY90sHRVDFIJxCRCJMJnOOPaHLndT38QnMhbgXpAtDRk1z6ftEq/lRNE8hSMKKTxjKHZ9QQ0OG8ZawmiYI66FwIaWgDv95Qjv2G9DIEDTMOc23fxKr/MFJxVhAzkTTSK0l9eIUN9C3P0bGbnUC2DDsyh7DPIjqxAG1N81iLOVo+3Fj5Gcqqv+ja3NqA+KJG8zIbEIwXMM/TnJOmtpnh9m7eLZGKxvyW8xtnWX7CFK6zMSQGkB0pfzSa+4EQplp/zqo8gKYz+3Uyf9yaxQzzNJQkrT+3apbNupik0rVH8ssRa96uVhcf2yp2OIlZHvZgQpuwYlZMS1sNR5gck7zhN13iGVy3EyVo7qcDlmOIC3/2nDqvL6+rNkw6iHdHxZ8NcfxTigrFubPyCeTFh1kWvLRZ7wpV0qf6ZPagFuRoIe1idKJKQ0gsFfEOHvSFP6RLUKOVBHKLsK1iTZSI83g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlBYSnAwYzhMRDJsc3IyQXN5bmVkcEFVNmdkSFM5MGQ0U1NOMG01eEw0L05U?=
 =?utf-8?B?RHkvNFlNekxtRXdjMGdoMFU3YUxuMnBZQkgwbmhjNGlmZ09JZnNwNlBIdmpK?=
 =?utf-8?B?VS8wSHVoWkw5TGlvQUtGQnk3MjhRazBtVzl4bk5YRm82NVlYUTB2SXNaY1hM?=
 =?utf-8?B?eGdBanFqNHc0RFVPMTBKeURBSS9LTWl4bDVlUVhSRVJjQVg5TlR4MjdMSjJI?=
 =?utf-8?B?RGhCK0IzYjRrWjF4bmowRGoxdDhGeFZ4L1FPb1FyMTAzeEh0K0VsbFFPOEVT?=
 =?utf-8?B?d0hMaXdUNUc1a3dSQ2pkMHkrcVk4Z3BYYkVrZnZ3ZzhsMUMrTFkyM3hyaFg3?=
 =?utf-8?B?QURRQktrZVFZQmxmUzczWmROaC9ORlQzcWZTeUNLWjhWbGlubzE1YlZxbHFq?=
 =?utf-8?B?b2ZJTWxsMUYybUNCNTUrMmdmOSsxNGl3YnEySi9nZ2lmMlFtYVh1emZWUmdX?=
 =?utf-8?B?RkJTVU9laHFidGVIdEJoQUtaYUtueXhlUGJMMEczWVkwMllxejB5VDh1bE14?=
 =?utf-8?B?cFFFajZTM2wrUWlPR2hJV0xsZ09jN2VFQVVsRk41Zzc2Rjc0SE13V25iQm5m?=
 =?utf-8?B?WmZGejliV3d5V2lZeDdXSjcxWnVNUGhMVFFobmFVVFU3MnlqaUw5SWJXSUxi?=
 =?utf-8?B?cnU2dEVzQWU4ekN5ZlFUaWNYK0g1em9VQ2RJUHhJTnUyV0dFWXpjTGZkbGti?=
 =?utf-8?B?WDBqZmlFK21mYS9heXA2aS95R1NXeHRVVnYydkpYN1JuNzRhZXBIR2xiakpl?=
 =?utf-8?B?MkIxSFl5clh4YjBSV0J6NDdRZlVmVHlUaFB5bTNneTlhYTlZSGhQZ0FuU3lW?=
 =?utf-8?B?LzRqNWsvaUFRQVNmV1Jvc2EvZ0JEV1JtamlXZDNjNEIwdkViRkZ4enBkNkgw?=
 =?utf-8?B?YzNiMXl3WHF0c2x2WkR1Znp5RER2aUFoMTlGajB0bFloSlVYUDBLU2k5TnFo?=
 =?utf-8?B?ZWloc1JobUNRZFF5akNuUGhuV0JUMVEzWTd3RjVsbkhEOER3R1pZSTg3cmZI?=
 =?utf-8?B?WkY1TGl5VmNnTzlKaFRxQmlDWnhoSWVTRmhQVm50b2t4WDl4NVo3ejd5YUYr?=
 =?utf-8?B?dkhZMjJuWTlPWmZ4Zy8wdjI4YWVOdlBEeDFNTFJMU1dGUWxCUDhYU2xhWDYx?=
 =?utf-8?B?ajlVbnBvSlJ1SG9Oay9NL1VXRHQyZEY2cXFRemt6VXlaY3ZGbTU0RVczZFZN?=
 =?utf-8?B?cW9IRVV0SjhNMlRKYXZHNmVtN2xud09ORDA1bFpqa0tPUEsydWlnRW1WdHds?=
 =?utf-8?B?Sm4xZ0RKckJxWG4ybVN3RUJraXhtOUNCbGM1dkdvU3NSTmJ0Zjl0NWZra2tH?=
 =?utf-8?B?dU9iQTNZeEhuVzJoMXFIeW5PZUd6TXlibndzVWIyTGpXcjVTL2trSmI4ME8r?=
 =?utf-8?B?RW1qOFRqdjRlcU53YXU3N3FyblN2djVZeFVlZDFqQ1Y3Y0ttTjZwV05CSTVW?=
 =?utf-8?B?YUEvV2R3aXdjWFVLVU9EeGxodTVRbnp4RFFudXpPT01Bd3Y3dkVPOUhkSzJ0?=
 =?utf-8?B?SVJ4enFCZ2RWbjFIRSs1bTQ0OVRmdE4yZTZ5ZHpYaE8vUVVDbXNNTGRiNkEy?=
 =?utf-8?B?M1pFMWoyME0zdmZxRWVTWUNhU0tqL3o1RDd6cFdFbURtQjB1b1FVeHIwNVJp?=
 =?utf-8?B?eDFWNmxqMjRkLzEvKzkyaldCT1I4amx2ZjFzU1dtK085R1JFM2RMV0tGYjYr?=
 =?utf-8?B?ZlFQTEZyR1NyVTFvRWdKdmluZisvZmJkNGlaM3hOMS9jRXpqWi9jdWFlVW9s?=
 =?utf-8?B?ZnkzV1Y0VnRIQlNEVEdiaFZMclpYdXd1RkN5V3h0YXg4ZGt5a2lHWE4xZlRN?=
 =?utf-8?B?RkJ6dkNqSGhIQXNydVJncTRFY2FlekdFVys1eFNmSlZVOXpnQUV3OHdvLzVk?=
 =?utf-8?B?YnJIdWwzcXdxTDRqait0OXFKNTN3Q0ZqNmlaM24yNGFwUDRhdUhhRmNvVlRO?=
 =?utf-8?B?NjdCcTFpNHcvZEhYcEI3TEVhSDVuZGFydWY1bVZhUElQZmsxUkQ3K3pxQjdE?=
 =?utf-8?B?dVkrMkJCYTdJdXdxcUNYWDJWalBFcjcvcGpBS0NId0xSSVNBdHgzb2pDYzUv?=
 =?utf-8?B?U3RkclRZaWx2UkdkSVE2K1hpY1JWQStNa29PUVhNejJWNWN0anVudHNrdUZy?=
 =?utf-8?B?VGRLbUpIdTh6TU1CTVF2cVhTbHREdkg5b0NVRW5YOUxTRjNEL3RjVXUzQ3A3?=
 =?utf-8?B?dFkzN3JPZHJaUzZpNzAwcTN4S00xMlhaY3FwNW1nZy9PSmVwd3RCNVZjNlJP?=
 =?utf-8?B?RGxCTk9aRlJsU29jREVOV2hSckJjWGQ0djNQUWxwaWlNV3ZuS3p3UmdNeWJm?=
 =?utf-8?B?aTVWanlMbDlwY0wvdzJmUXNwNHVackp2dGNWbTE0bk53YzNtNStBV1V3aDY0?=
 =?utf-8?Q?My+G2wnUFg5mJr3ZSkbHkdzRnKuTvk1aOkadl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d45834-7936-422c-b33a-08def2c6c3c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:23.7228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ybj9KAnO8yP5plLV0ChCQLwpd4+1tmdVs6/ZZ1SUa/PnW4cZJ7vRqrUSTKm3ixT5P2AA1foGsvN2m/x1kzeODy38KZOmsplp+7urc/tXjgzRwBalS34s0ky/ZtZLqhiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
 drivers/firmware/imx/ele_common.c   | 55 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 41 +++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 94 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 724f6e913ce7..b70e3ef88a16 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -71,8 +71,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -117,8 +118,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -165,7 +166,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -213,7 +214,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -251,7 +252,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index bc08ea2dcd87..707fb69431ba 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -134,7 +135,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -146,9 +147,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -158,9 +159,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -172,38 +174,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 }
 
-/* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+/* API used for send/receive blocking calls. */
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -214,7 +219,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -243,6 +249,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -266,7 +273,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -280,8 +287,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -296,13 +303,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -324,8 +332,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -337,14 +345,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 7bf2febefc45..07e6b6a1bafa 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 53091cc37e7e..a8974eef190b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -284,6 +284,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	const char *err_str = "Failed to allocate memory";
+	struct se_if_device_ctx *dev_ctx;
+	int ret = -ENOMEM;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return ret;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname)
+		goto exit;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+exit:
+	*new_dev_ctx = NULL;
+
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+	return dev_err_probe(priv->dev, ret, "%s", err_str);
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -328,6 +358,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -425,6 +460,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

