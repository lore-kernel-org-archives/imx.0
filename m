Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F6495509
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630026; cv=fail; b=O/Zb46+Dc+1mfM2jV5BQwUmQaplSc1AX3cJHaKSD1rw43ACoqlGC3wmT+dlKxb0tVVNJ1TgqWAtXFqqAJxVnPHiKx01kp49q9sv05j+bz2ENk/hL80k1PHE52fN/XJcYz3L5qNuMwvYEtA8RoUxA3CxgrynE/mzD88UzjxA6MCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630026; c=relaxed/simple;
	bh=9q8iOWLZSK6ydvB3rBv1XNB8Aho0zYGjEd3qfz46Igk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lQWa8kpQcZHifO74f/syC571JHLITuo261BzihrpJLM4qE+toegffYLjXmAqRsnE79xvct3KyrUN6fqthlKzTGtE8H1dvgKcAKFQaX6BaHHC85Q+aX3BKdITOSobBoGWDq3ygvdRQIMVjKTvVm7OZgwPouhG5FdneRmkIWd7XEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N8siGBou; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N8siGBou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPNtNjc70NkpupUlmRkIZAsew/qe8wpkrHLO6k4gqGWT7cK87J8bdbxvr969P1PLdJHffGG84yhwFbnIm5HBjuM2wwyz4+YYzMuqMHLWYUQ5TU0tWsB6CUIJn4/qETqSEWmgWA4ZrrXaPv02HkGX0xBvGjLMOFknjWrUhS3O58zSp5s/5ILcZ+jhCbywam/vGPsJCp6/TtRNhAktQDGFPEg/4q050ZnHE1YTazSK9OAP8Np9c/envDtmcqEE5Y/9gKVWP4kDUAYFPeCSaIrLkW2H5mrQzsQ0YOnriLyf9qwtLLCRmRwO8p/vQDJn5Ev748VEJDmRX1touAqYe7JIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZDNzQnw+jrifRyShnPVx5W7GvWKpWmmlNkJ019oWf0=;
 b=GMWr2D02vPKsaATBdonzTpWBLR5ZPmVLnzMR1QXMTtMT1FSymO+SVWW/4pWbJ6gcfeW5g5wzd7+Nd7hHtiBvtJBFU7K6yYmAePxGVEceJ8jI8xG59OzxK8TLsG88gy96Gakpo0VwxH8xUWbYNg1I2kw38e4ch0hjS00QXrOpj/V6HQTNNF16KgwwCKa3eRuMzRXd/e3KId1MWNtg393YQNrm7aHzM1sZ2lDhMLbbGlf196nkASuyUCUyzd9DXXejrqdsyQOG0GQ00QTfLEgU3pOXcRc2TELJp7wXSEQdUD85jmub8zwEVBZkggfTR/fX/Vbgr1C0r4TqvT62EwFB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZDNzQnw+jrifRyShnPVx5W7GvWKpWmmlNkJ019oWf0=;
 b=N8siGBou+EXSr7AITvAu4pE71I+R4L2HfYXtABLLgCba+KD49pYYWr6xuro7U2Qwrsx6ADaXNGW/0oVYylPXq267AOAqIaeNoVWEBzRoiFi3luOLm/fy3DZJTFlLkJm68bKyMCZiLG2lHwI7NfPyD46cglxB/mje26a4g/U6n33jj+91N7A6TvNm8bRopISHwWYtiUiYqX6EVvjNeSkbua5qL+i8KRQ7vByPtJz1jgfVLrhPCQB12M4/Gwxu8iCschoQEnIh0wZDbVt/6KswUSOgjnj5euOGrJJIhra84Jm0ccnrSdJhgmA/G6d9p2dsJ5OHfKhHtt2N5H+b0a+VjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:38 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:38 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:35 +0530
Subject: [PATCH v29 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-4-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=14020;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=BqGkZh3vnz2GBT+PHx31Kk6iG/tU2VxDzevHt0tYlwo=;
 b=pQ6kjofI4pthFFCuoBT1/IMwmjs05gDfeF97HQAuGt4g4aaa1d73r1SgASOqc+cZGw8AVBjKJ
 20LnjXAmLz3BVKi3ypGXvOQLqiNSZIdeb8cKcZt+sj9XgKXfUAUt0AB
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: KU0P306CA0050.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:28::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 457f82c5-c074-4d2c-b96f-08dee7138676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|6133799003|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lNFQSkRIev3MSkc501mz3GihJUuInHTDng9sgKgrFx/lmtaHm3M9Dkmc4WiiDQmk91pINsIUzai0Ja4rw4eIhoJmfyZ1EVitt0oa0xoYVC0TUHIczFDrrDFMo1K9WQDrdu74g1fwzPXQrHbW5xDpKvpT/tpuRVvBsZJJflVz4fTeLRqHuoTrr5ApUdBhBihEFrBqq6crIaVmf4RSOz1WuxX+2K1czRch2MRol5mnbJyDlSO302SoW97FdUKsuHkE3wAc1vlFtCRxKKcfVRhuIBCDQddg3GEFNLDooOsu8weGDM/S3fNkfLs5+buehjoOcMY8MXRC8z90DWXyUn3CflunfSsDTWEgVBHXrl8tgqjb476Q2v4lxsZBeAIRvHjAgZ/A3//BbRyhioF4BvE+57Gv1Vw+BPgf7ib2yjiauw5mcUA8fIfuWkFmQsYHROI35PCz46yXR9zaDfZcS3fQlT/dmk9gIKYSijzHocxdPYzC9E6S3RUWl/tAowX9FHrP//rleOEjRO8tA78lkcwPsDFG1EDAhoQpvXcBaj/+6RKKTPAHPrkPBSd+89C9+zGNcMgHjDZuqzkXzVohIH2dcgmUKhtMiepXVvjEYImJcXHMLd+3NeVfKW3lr2Mr+Ivt4gZB7vu7DqayE+LMq2iCJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3VXa1N1bHlITld3WGhObXJZUldPbmdHQ1J1RWlDeUpnNk1XTC96NjNRVGxH?=
 =?utf-8?B?UCtleGVnSzR4cUVES2pQd0xYd0t3YWJaelhVUC95NDVkdnZXdkV1SEdLRkJD?=
 =?utf-8?B?ODl0UkZNa0tsV2lIVWZJTldIc1JiMWJLTFVwZHVnbG9QaEdhVDArUFlSVmpr?=
 =?utf-8?B?S1JOT3RXeDdRZXR1SFBxTFZJd3RhUVB5V0FJeHRUL1hWcm5TVy82WVUxRGxa?=
 =?utf-8?B?eFppT1hsbmNWZFFzUzkxZVFERHRlaVpSYi9xNnFxTnFXaEhoN1JueFNleHAz?=
 =?utf-8?B?Yjl4Ym1OMTR6a0dVcjF6OVZ6cGxoSW9ZN1QvVGdKWjl2VGJLSXZ1ei85NXFC?=
 =?utf-8?B?bmNuVnFFL1grY3YrbHB4VUUwc0hBaWYxK1BSRDIyOWJHUVBhTVlxKzFuaU9D?=
 =?utf-8?B?ZW8xK1BaNU9pMVEwUnkzaDlCQ2tpZ3BtSFcxK1Nlc3BNdnFCK00zNVQ5OHFG?=
 =?utf-8?B?UDJZd2h5RjVkdnZYNjM1ekxkUVhiT1JBUy9qS1RCNzM4NUdLRUE1TFBWNFZH?=
 =?utf-8?B?b1o4eGNaUExqOVMwTkM1ODRrNG80eGtGTzM2aFdYMFN1SnZQekR0RVRUMlh2?=
 =?utf-8?B?N2d6V3BsUTluN253NkhaQlZsK21GM09qQ0NwZWJpQ2t3Q0h6M0ZlZzBTYlR4?=
 =?utf-8?B?YmNoV1RLS2dpZHVuMXN6eElHanNhMWR6YTJOblRwZWhUR1NMdjFieEZNZzJG?=
 =?utf-8?B?TFVQcWdGUzVob0RPbVFGNFhrRjJTVWhBOEc3N3pSUm1NVy9kRWkxbGxPWC9S?=
 =?utf-8?B?Z09mQVRyeEtESGJZOHAzYklibnd0NmhWaHNkNm9yWXZNZTFpWDR0TzVuYnVL?=
 =?utf-8?B?S2JMcU5Kd256NWxDQzd1VHNIbE1ha0NCWVYyTTl3QmQzY3pKcWp5ZXhCdHlu?=
 =?utf-8?B?NHlOdzNDSzAzVll6cGtFOEd0ZmRKR2lBcHhOWTE3TzJqeVR4eFE1bFFFa3Rr?=
 =?utf-8?B?NVJSY3R4bEYvOG9DZmFyb1RUMDZZdnN1YTZ2alNlQUQxaU5iYWJqandCdmlj?=
 =?utf-8?B?cUJxVFdlVFRvbHVEMUNnejFid0JGbWdIWjJxNFh0ZDNFelVYZTd6VnA2bDV6?=
 =?utf-8?B?NmlpWjBQMXRybGVnN2VKSGV6eEJ3QWZGclJCcnhBczhQZTBhS3Y2VEtPNitx?=
 =?utf-8?B?ZUtFL09KMXhldXJxTXZ6UGFmTlpGZlFpOEp6RVd3bncyaDMyYUh3QlRSWUZw?=
 =?utf-8?B?eWlsWWNnK05TZ0lTbTdIRHgvajhIVnVRZmIrY21kLzZtN2ttaGtvdXhiMDlN?=
 =?utf-8?B?OWo3NEJNa25YRHQ0QUNqNDlxY0lNNVVFZVZSTEdNeVdVR2FjSUszcmx6Zisx?=
 =?utf-8?B?bkdpZnVHWEd0NHB6ekhabFE2ckxyZ01tLzhZVFdvSDB3TndCZ0F4d3FyOXUv?=
 =?utf-8?B?bURZYU1FdWVVQlVGai8xdW83T2xzc1NGWFpOdUpKZlF2ZUV3OVYzQWpwQi9Y?=
 =?utf-8?B?RndtSW5oTGZGRGpSYk5rdGgwSWRYdlI4OWVIUXhyb2VoaHN6ZS84QzJya1dj?=
 =?utf-8?B?RWpjOGo5aytFVjhzck52eVF6a3lYa3ZVemxZKzhQbEM1U2NkVHdDSE11TDBj?=
 =?utf-8?B?UjZQN3lGRXZDTnZJYXk5MW1udFZuL1pjNEFaQnpoMUxDU0xCcEZXSGN6aXBH?=
 =?utf-8?B?ZXFJaERFVVdrU3BqbmNpNVZuKzBSWm13cHpVMjVOclVoTEV0bW92RUh0dTAr?=
 =?utf-8?B?RzlLVWFMVEtKbnpvLzllVVFhR24valRybldQNFFjc2YwRDZOeDdiU1NwK29o?=
 =?utf-8?B?S0hrdHlzcWtkMW5JbDFwUU51Y1NoSGRMb3pmbkZod3hhaTFRd2dZbzZRVlhK?=
 =?utf-8?B?UGg0cVl4OXgyQmtBR1ZpeEJxSW9IbDZHRmhpYWZYeTcyWFRVcm9XaW5OcGRK?=
 =?utf-8?B?NGR6UzZlOUZRdVc1QU1BMEl2QUo5ckJwMklXM2x2MHRxc25rQlFpV1F6SDZI?=
 =?utf-8?B?dmFXYVZ5cXFDZWo0ZXdSWnd6WDBwTnFPaHZDL0h2QWNlTHJkTUx1NmQvNmZV?=
 =?utf-8?B?NjFjcS9EWVJrWTVGZ2JJYUJoZkxnRm9RY1hlUWVUVktIV053VGdWTXJVYVRF?=
 =?utf-8?B?UkVQWlJlaUtFWVdjaC8ybnFFckhxRXA5VGN0UG5qUURYelZzeVJKWXVMcy92?=
 =?utf-8?B?Z09QWkRTUk9GQTNmZ3FxVVdVdkp2aG41ODVneUZYVzNPbk1pdU1QZkQ3bEZZ?=
 =?utf-8?B?ZjRuQUd1U3o0RVo2aDRHSVY3WjlWRnZVOGlpYy84eTh3WFQwMTR1R09ZS2Ux?=
 =?utf-8?B?S0tKZVhjazZtbWl4NHBtQjdLTCsxOC9JTk1MeGpSWlZ4Rk02SlpjMXgyWEt4?=
 =?utf-8?B?SkhIRGpXd1F3L2pFYXRQSWJIT05YMG9yTnl4N3Z5Nk5Bd3Jac0RyRWFMcXZu?=
 =?utf-8?Q?51oN64yofQci6lVnTq5gN2p6EuwJbVv0z+rV0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457f82c5-c074-4d2c-b96f-08dee7138676
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:38.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVNEGTp1noRCZ+jusQlY3yj6oYEUcmDCWdL5eEfmtPOvjMSkHc4zkp1KEtzw2o67LiEpFEJsS2NeB12EkKkMAPZK/3bIEJML7PMqFPblaNz5hquxxlqv9C5gX0EqVGkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v28 to v29:
- priv->waiting_rsp_clbk_hdl.dev_ctx, priv->waiting_rsp_clbk_hdl.rx_msg,
  priv->waiting_rsp_clbk_hdl.rx_msg_sz will be updated after
  acquiring the clbk_rx_lock.
- Create a local variable "const char *devname" and assigned its value
  under the clbk_rx_lock in se_if_rx_callback().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=4
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
 drivers/firmware/imx/ele_common.c   | 57 ++++++++++++++++++++++---------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 42 +++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 97 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a2ede9c01691..524ebc0f697e 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -66,8 +66,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
 		return ret;
@@ -112,8 +113,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -160,7 +161,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -208,7 +209,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -246,7 +247,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index e9405a82c54d..a350e83a274a 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
 	unsigned long flags;
@@ -111,7 +112,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -123,9 +124,9 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -135,9 +136,10 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -149,34 +151,40 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
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
+	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
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
@@ -189,7 +197,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -239,7 +248,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -253,8 +262,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -274,12 +283,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
 		u32 exp_rx_msg_sz = 0;
+		const char *devname = NULL;
 
 		/*
 		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
@@ -301,8 +311,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -316,14 +326,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
 		}
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
index 06068c4db8c1..cd4d27dd98ce 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -243,6 +243,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
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
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -299,6 +329,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
+
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
 	kfree(priv);
 }
 
@@ -382,6 +418,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->is_fw_tobe_loaded = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	/* By default, there is no pending FW to be loaded.*/
 	if (se_info->imem_state_mgmt) {
 		load_fw = get_load_fw_instance(priv);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 18706b01d81c..e02dbd90eeb9 100644
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
@@ -105,6 +112,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

