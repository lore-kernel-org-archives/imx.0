Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF244C4E2
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318639; cv=fail; b=r5+6O5iepkVx6mRRFudY18WqhVqBusvu58yOV3Y9WevzdQc+8sffhZntBfMe0tEOXksGJkxR1lYWY+4T4m4oWWlL9JbdVF8RfOKvrWjU6xKXK2jw56s3nGsXa0/qcicd0m00eGNB3RxYQkAjkSmglPqmK5UTIpMH1APyema8N4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318639; c=relaxed/simple;
	bh=oWPiZEdW6CSzlq8bi2/3vBq497h1Ig8/+6hUr01v2cQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oXkSoyghEjNDF+6e03buFiLuTtKFhQN7hvIHVnMOkfbPQjjY4I933uIdoPaCCN1yLUAVai2T5LWqBLTQtiJL0LyQ/Tp9y2dFGbWrDyVf4SYiJQda2ko/PCHA5v0DFe0eF8FxNYyIamVyVVVHaudtitiBzl84DHjJN/n6F71mwbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mI7+T0vj; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mI7+T0vj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnnWoxO6MsR3rlwTtAVBf0WqWMLrTyq54xC2D9hohoNKsRd/BiCPagtvYyJ8Sl2dyYlWAv04AARMN9BwbK005Pu6b52scHcghREvmlmSratC8JZdApQMXE9DIqjOgEINg8j+cosyvn+mh++WITf+xMVv3vvMgTliBsg33N/AaeEN7StGJtgq7jP7cBxPdHLsT19eC+3NSSh9K3OQPqZoi5pnl/kCDUlUjO1i+qnPcmYNU2u4vJWnI0n9SOZf2kd+749AX7Zr0bicQp4SCtgY2RzRgB/Rfs2/wKILb8l9lMmjDLXSzOoqFY+wkHGlSn4VBhPzsCfOrm7N1VFbMrdIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQRqtediRWIZgrCVCcpUVq14f/N7tsBrmt9ITULskU0=;
 b=TRwWleTJ9qi/dEImaNXPv4iLye+fEyVGAn3VP2xS3SwJWe/YDq4NtrlBEYKKv5QmNgDfRKYRGLTlyMGJ5IgWdnka+IujImQCCjZrdVnKWDt8JzOMM6+TgEIBzFvvE/co4jn1QDmtFU6BGHzXaGBvTT2EyZ1B4kFrSQG8WSocxjbkbxlRuMGBLJgBZxB/fsW+ZbAkBHOoAvbldEJiIH+/ZhpHJjiI78HjyiXvvgNtVeX/dftjFFUrrDM324SsahUvCYbPUhx+X5y0jPXqSiBNzO7P7NBmF36wAAUlmZ8SBFPIKKHXJmrC5VoehkSFq9/0be0zKqx2Js1b4cxa5lkiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQRqtediRWIZgrCVCcpUVq14f/N7tsBrmt9ITULskU0=;
 b=mI7+T0vjb8IkJjBUdOP9tXr2EQg5EBxMO+yWwJmevqVga6MG8akWxwU19rDsNVh2+QyGCJKA2S0a7KFKq8+71azpHWXiF6DAHZQjdE3LNJIWFd/odbf+FHBrjbUR8g6fT3o3LUZWbk1/JF7oQciku3tiMEXmZk+jQOxVaadYBP5oF74qnLjsf9UM4D21Be8TpSc12wz3XxN17GpATE+rUBfOHTpzqGHPPqL2IjYOvvrfC/PJDg28x63Y9tkM9Ir5SoPnX5e2OuBjYuSoQWbFb9aClg1jkbwzYwtfoboKR4cCugkIAlpjvij6koSG8ftAtPFNxTbFn/OPFNd3/5wHJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:34 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:34 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 29 Jul 2026 16:10:51 +0530
Subject: [PATCH v31 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx-se-if-v31-4-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
In-Reply-To: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=14345;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Kae3Uqfue/eMKOT1ad6OfET1Ri7jfYomovwdDihe/p4=;
 b=5/HNpjUrke5Za5Ln9gIoOpNWejEVTuL0Be6c9NHmFXxCOMbdFvUxKS0kH28BuuDV82Scks+6P
 vgjfdeUB8FvD5zX1T0h2sixHCo2DJVG3RP4XvWadriSgwJaBedAtypj
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be2f8a5-2899-46f4-4b69-08deed56d5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	PsbdZbQXylUzA7c2w9LaYh9CioXkCzS0rlnOGD47ixn3FkopVvd0deqJH9tWKSjjzdJ8Wsi3B6IGq97YCrqk183Fa7hYIquonvQUipRWmLoJkDiakpioCP/fn8QoBW8bcXPvOCO9ltNKFNm1KJwqCJi2hn6HK1bTd8/pdoAiyEtBOj/yAhk4gWtnb+aoUFazPLJDpWo4mAIqfubcR8nIp6FWn6XA5f2BN+HdbNM6mBsfYaUzVCvrzsjIwu5Qziuzs3cpj78DLYZEX6PX8zZVKKgK8kDDbmhAft2Q9hBd3hPRsfbvb9bIPr2OCateTkN1PI+XHJGlT5VqLafKYRN182q++1wiD2nZtnbX2MGpFa/ZkPW1JYVq2AV0Fb2Glz5SpQ3JT/kocaVEYT8SUUuI+TK8ve6hTwMhlkTeurlVXXfK2ExueZyEIpo6DPNfWq0vMHGKarR9QOgxYNBDIlVnpQ9iA6PWdsZZMgj1OGLbSSOe0+cig2UYIYQHdVthNxzFKB4/nPRrBoZvSp6jt/6lh9oA4gg0Pk3rorQ340CtZxnqPLPdNcCjuR1pQYFUYHyaLSpbWrzpy4igxQnKBhwhbwbh3+vVUEyiwgfdm8qgdOdm5Gmo4EJcTIxEKF3usJxPvygCQVGTlO6yUXyu+s65rQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0ZZSVNQdGlqMUlwT1gxUkRDKzRPd0hQelc1Y3hHVEZBeVVaU3ZuVW5nTVRM?=
 =?utf-8?B?ZHBjQ2lCRDFRVE1BWm9wcGlOUDFJVWE3OHR0MUg4T2N5aUR0bnZhdldQSDBE?=
 =?utf-8?B?WnVrajk2TnZXeHNScjE4QlFJdHFGMEhYMTNHdUNMQlpJY0FyZ1IxeGhIMFJ4?=
 =?utf-8?B?Rk9ab0RqbWxZUHhyczFtL3QzZWdDbXg0eDF1eWJ2S1UxU3VhTk1xVVI4T0lB?=
 =?utf-8?B?RXdSVEVqUnJubDBlQ3BsbDlsdUJTdkRmaFdlQW9lUm1hVHp4V2pIWWw0Uno4?=
 =?utf-8?B?NzQ4UktEN0NHMXlMMjU4ejlET2N5bTZlWjJ3aGtTUkFvRkp5MFVmMnpKN2k5?=
 =?utf-8?B?bWIzVFBJcldJeDNKWUtYUVk3T3NkMUJIWExzQ05mUzlRT01aaU1JVGhEQmQw?=
 =?utf-8?B?bUVkVXlpVVYyWHA0L2wyUjRmS2VpZUhwRjJRS1ZZVTVtUWZZZERKMGt4SWky?=
 =?utf-8?B?Rjc0NEVJM05MNENIT2lrV0tIajBscytXaEo3eUlJcnNXMkZTODhkYzgzcDlk?=
 =?utf-8?B?SFpsQnBxQjMybHMrcHlBZlVBdXRrblpOSWVvdThtTUFEYjRGL2s2V0ZaNDBF?=
 =?utf-8?B?eThpcWtLOE51WDlTelVWWG41R3ZkK2ovVGg4WWVkYWRjL3h0QW5OYWdYUUJS?=
 =?utf-8?B?bWg0Mk9IMlA0TkxVSitld0NtQkU3bW9CK1kzYlBRaHhEdUZ2cWh2eWthVXdE?=
 =?utf-8?B?RWUyYWMvL1l0NEdBTjFDWXlVT2lYd2FlemtUdGp1U2FqZUFTQUdKdFluTXBM?=
 =?utf-8?B?dnQ0d2VkQjYrOFdsUFNiUWs5ZGVERlpscDNUK3VnclE0TmZCajRwMXdLb0xv?=
 =?utf-8?B?UUN0UFpuQXcycFNZbEhqTDU2SGtocnp5eFN1akxnWUh2U2RId3BpVDNLZ0Nj?=
 =?utf-8?B?UGJ1d2QwTGVBSnZYY0J6WW11N1EvdzlJTHN4bzNIMW14YUFwb0tOOFN2M3JO?=
 =?utf-8?B?ZHA2eFExRERDZVdqSm15ejNjTkhhMlJkejlDbGdqeWl0REg1aGgwRUFhQVZS?=
 =?utf-8?B?NTlvVTdYVnJCM0tVcTFxNVozVFl5akh3VDBwdldhWjcxVkd4RjRZWEZObzZh?=
 =?utf-8?B?NERyVFhLb096bWJ6UmJReFhZSkhCKysrYUZYRE1ncFRTakFCVXBiRlBUcm14?=
 =?utf-8?B?ZjJ0ZlBoNlBVdkFNa2wxVmViUVdTVmFybWFSOGZ4UlFBS0oxNmRwS3kzNGpG?=
 =?utf-8?B?cC94QXFWelRHK1ZlcUtCR1VGZmlydnR0Z1NSOTFTSWppK1F2WG01WW1BaG45?=
 =?utf-8?B?d0lMQWJxbHRzVzBHMFJONHUvQUg0RjJ5VHNQRkVqcHUwMWV5Vmlvdk1YNTRL?=
 =?utf-8?B?ckJNNC9KVmhqNlhLeDc0MmlSN1JVZXlUYTM2Mm9OdTh0T1FoUVFMOVpnbDdE?=
 =?utf-8?B?NElqNE9pd0tyRm9QdWFaUVdwaVhTMkJlQ2thMnQwVGNyNmQxQTdlcHZzUFh1?=
 =?utf-8?B?VXoxOThUWnBBQllnQU5JRlZpM0Uvc3QvQml5MWZEUU5xS3pSREkxMVozajVT?=
 =?utf-8?B?eXVyd1I5YjVWZWJSSWR0MldTTzFSWFhPQ29XYTQrT3hwZnFMWUd0bXNlUERE?=
 =?utf-8?B?dCtmQlhXOE5mUXoyTk1tdXBrc2lkYjcyV2gySEJSQmlldEIvcUpCbVZ6VHNT?=
 =?utf-8?B?eGhTcGR2Q2JRRndJcytWLzJvN3hCQ3AyZ21LZTFyQi9CYmEzZVVlS3VHcGtm?=
 =?utf-8?B?NGxFaThEZkJPSnBzN3VnSFU3Z2lpanl1clkvMjNMa0tXWE1YY0J0QVNpNUtK?=
 =?utf-8?B?ZU03dXZtVXcvR2dFM2xTSEh4bThxV0dhT2M4NytXaUNmMXVISzNLZitGQUhr?=
 =?utf-8?B?NjZMQ1JLelBneWszcERtUG40dUlwUnRYbEhqd0c3RWxPd3NOQ1lzRHJ5MHpw?=
 =?utf-8?B?NGdteVlVbXFRZUYyNUVSQThiaW5Iai9YazlDa2lSSG9RYmk3MTVseG1jWUd0?=
 =?utf-8?B?cWE3WEFJcUYya2duYXNHQXJHdVlHZWRuTXZlRi9YTlNSQ2d3bkNZS1pWdWJ1?=
 =?utf-8?B?WGxnWXJ4T2JDVWFxbDZTVFdUcXlsTHEzMjl3Y2dlcjdYVjZUajdTT3BmTWdR?=
 =?utf-8?B?ZkJ0OEFxeTg4cUVJMU1jQzc5L2xHY3VCa2FwS1gvR2xPdVp4cWxxM1hWcmdK?=
 =?utf-8?B?UURzWFNDazZPTWI4eUNxbVpRczhxdDhaUC93UjBzZkIzYW1PWEMwcmJ4ZHVj?=
 =?utf-8?B?cjFFbGpKcDVvTHFwZTZIME5QT1ZmakR6ZmNFZVo2RUJKVTJUMXVJQ2NjajVq?=
 =?utf-8?B?RUVBQ0hWamNrTllWTXkyRlN3MVFjVkxRaForQlc1cjFhZVNOMHFjSkE4QVdx?=
 =?utf-8?B?SGQzQ1FxZHIwYmlNdGdtdGV1eXBkb09ycVd5OWR4ZkxyN1V5VXZteWR6UWNK?=
 =?utf-8?Q?/M8CeKoOB+qb39cggKlwsmyzpp56l0gmj5yYL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be2f8a5-2899-46f4-4b69-08deed56d5cb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:34.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQ1r42lA/B0uzIuytR0AzbnYWFAmsZ08HKDeSkTgVyc+adNzW6fyb+NWkiFxOZZMvPXZUN/m+08mjAiamFKyycdH2pM1AukcI/aZz7DzmnNAoPBFClV1MLFEm2w+GAzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v30 to v31:
- add the cleanup of priv_dev_ctx->dev_name & priv_dev_ctx, as part of
  se_if_probe_cleanup(). Though it gets replaced in the next patch.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com?part=4
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
index f40eb4a07982..7254fc717e91 100644
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
@@ -132,7 +133,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -144,9 +145,9 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -156,9 +157,10 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -170,38 +172,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
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
@@ -212,7 +217,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -241,6 +247,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -264,7 +271,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -278,8 +285,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -294,13 +301,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
@@ -322,8 +330,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -335,14 +343,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
index 53091cc37e7e..f898c2f9a43a 100644
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
@@ -309,6 +339,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 	if (!priv)
 		return;
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	if (priv->rx_chan)
 		mbox_free_channel(priv->rx_chan);
 	if (priv->tx_chan)
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

