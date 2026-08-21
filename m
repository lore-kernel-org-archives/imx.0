Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62538BF70
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297545; cv=fail; b=t4LKccNEECqRtO+GqjA58HEzqMqL5LrtYYCvhvR8pfho0dquiETgGHwQX0G6BoZo+MKuY+tF/VUL5cyYbYyvZrBXOcvKdrt2ong9UV94Wtt1uaUwHmRto52uOlIwDFzW1fE8IJFlVYfDbGtWaZ6gLrQ/oGNPwB3CY8y2lbCgS60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297545; c=relaxed/simple;
	bh=sCOCOE3D3sNmRlJ6wkRabdd9VcKmTEZM273iWpEOiHc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bZWWyB34g/gtB6kvIHHu8mQXieb17HrlZxpF6ZNZdG1UVIIuEZiJsTJeAni/ZBHCMJIL238V824Bb5ZrL675PEnaVpdJmJY6YfGeZUnVqz1BtoFLQrWe7q2rMN/8gf6wPHhnjzPWYBjO22KOTiAXlbL8UiiZdUD5hslQvsryJ7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OWx1HNnK; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OWx1HNnK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij5f7G90gYf38ZCQ+QIoYR1avT/IGCy7+70UBMpqvFxIL/n1UEK5yWemLbm4h2QoZ96P3vcLBk99akoO6dQHIpqZmNO/htqv9xgSJq/qKXlOwYmREcG8VMDLxSnFuP0fCiK5mFelyv3n3Xq6PH2YWtBwVVPu2qSKpqWWyM6SgY6J5O+YsSC1ADDw37R1cZnHXzIqMNCruQ/P94rn7wrMNenGqk2vqbvwV4vYrF46AXc9P8KjbPMRzvbwSBEB2tOM/McFDsaZB3Byvsfw60WDNXHd8qZNigtAtrzgW7DOvDV6LAr3msmyZbSCDRNpgKHZLvaI+K/fti1dlZCwA6yxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyXLBr/NzooUBS0AG6J6qlKEkCaUmx5ngg8GhJ5ttUY=;
 b=CJsm7e+Z3cR3jCE7lQLEj5O2AxuRBgIsXz91goQLtD8v4+RfgCjQFKjeYUxnuDAXtk3DR0UKyiBKeKrTsaahWqLudvIMRVvfYYVX5VHJMGlS+xghQlzCD+aBlzBrTL0uuDqHod+E314CxQmskEE+kkEyjdM94QvlihsG0WMQR9N68EYLfeK0BwqJ47vOJt0IRYHYbWBDxJcYgjjDVBU6cQO+0b4SgbfFknyebI+zDG01Cs8vKo5in6pXUeEZEXYD+1P7QpoQEEAJogB1P2udz11DAUy0jeEpoRW2jDFxF+2195bgq/i9kspCnojdpy1OIajgWqT9ISR/CgmvQlJYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyXLBr/NzooUBS0AG6J6qlKEkCaUmx5ngg8GhJ5ttUY=;
 b=OWx1HNnKNmogYtgn/yrkCPh7ZVD47DN0v8dBnorOCbgFmq8fI4OeQQHw1Fr6NFEETkSVreZGeRkrjVZT69nWclYcgILoVd2Ns1c1LBQOLFSu1o9cp0IbqhXkSg6Z4jxRWzjtQ33YX4Y/LKgdkVTSpXacyFFf1sPpYyp6+U5GLNw5lgeLgWKGXxuWVqXWjxonMUnZtHPf/IkV1Pq2itAYQGzmCoydGOEqRrLhJwfbrfM8innWS37/Cc3JvHIgFgzrcQdsWP7oowVR4ACvIzPuca8E46wISepExoJLzrGu00eYf0IYZaQpTyX6rvAigpFXK1RfxSYzYKijc9B9cOTNSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 07:32:17 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 07:32:17 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 21 Aug 2026 18:32:21 +0530
Subject: [PATCH v39 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-imx-se-if-v39-4-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
In-Reply-To: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787317340; l=13976;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=1mW/OOYaqrs1NQjnxdWvVd9M+GzE/TcGWScmEeN848Q=;
 b=GCoHpfReLDGILPD263LOydfuyrQxpbOCxBWzcmApUeCkvaYsBUP508OXIowxtwitxdokKeSEO
 fRQhjVCo0g/Dj56n0+MK9ozBb6NnZ7NZDdMdQ4VJVZKfuZ5JlKchkne
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 32567242-b6d5-450b-4f59-08deff5653b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|19092799006|921020|56012099006|6133799003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AlckxqX/8lSuYtVxabROh8JlR34JshbdoAy8xLukiE0nQ7iylNO2vH6nbBZY8WO26tq+bdPJ11VXIyB4j5eM3VAehno3SLry/58VgI1Z/oWXKX/byxh5KVL2VDcwH8RjWcReFb30YxS97JcTXTiSnkfz+Zwb16kAmAcW7U+VCE9Cw6+bDuvALDuuE79dSAVJKvx7R/IZLqOQ/jq3mVY6J1YBVfkLc0g5/ukRjyg3GWXdrH7wRIPf0xcrmnUUNR1lhfTqDZ0lGw6mypIC6FhcQ+vfpEGbunw3k4qJ13Pttmfh3uQKq+mc+c5cA7cC+jnYw8zdnPTqvxNPFbZv+t3rlbRv64yhTcexe+nGbRFwvjrocKW06gPVLOYydMPclzGD1kfi4C9SFGyWgINubkI3qIqxBnkUncd5sgEqRdasb9Lwp0Fh3HMpV7/7R/yS6mvHWUK3maxDmbXaWdKXHxkcaF6xE5YcvroJf3KK6HdGHhQnQPQMvd/r8qZBCFKOum2A2l6lpdrCn8PrUdBrQLLUbLGZvWvmmUIK9DGd/Oy2tKr2BaMNs/lDPbMZ1T7CJ6fgaG7l8aXpSLZgWzI8e+eusyd4KzIgqWD1LN9rr+CeUH8j5yp8Y0Xy2aqqn2XZ5d22gcuWGClKKsU1WPtk7XdhUogZ3+HobPhKHVHdGifPWriJClBjdOOkHSaVL3Gbb/kwW0Netu4i+0wcsxmNHEnpIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(19092799006)(921020)(56012099006)(6133799003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1LanNaV1ZJanRZYk5kRGtQSmkvNGxFcXRHYkZjS1g5ZmkxSmR5VGZtQjJh?=
 =?utf-8?B?bWZCZUsvQ3NuMEExdTVwL1ZnWTFYSDkxanMvU0I4MmcyVE8vSmczQkoraUFT?=
 =?utf-8?B?NHAwZ2tuanRzSTB1NjVOdVZhYWNuZlFJUWp0bWdycFNqTlJXV3Y0QklhY01i?=
 =?utf-8?B?cHYzV2tlbjJDcm44OCtUZFFoTC8vU0NGZlN6NXE0ZGt3NElLamNpc0F2ZE0r?=
 =?utf-8?B?SkZHUXE1bjJtSGRYeWFpNUxibDBTRk9BcDdwZmtRNFlISlpXNWRSM1huU0hk?=
 =?utf-8?B?V2NlT0ZwUkhOUkRtdDVVTXJyVGt0RWxXK2VXQ3ZDUWJLSDMzZVgvRWVXSjNt?=
 =?utf-8?B?UEwwdXlVY1JJMlQ2anhXMzcvVkNsaUtybDJCNUM0NFE5WWFJZ0wrbTNITDhK?=
 =?utf-8?B?WitNZmVydUtZcUJyczJubXB4SGlOZVpVb2xVU0d0eGZ4QUc1UFNyaFh0TlNU?=
 =?utf-8?B?YlhpMDVYZS84ZE14WTY1MFZLOVNhdk1jTGVETThIVlM3N1QvZ2RMNllLOGpw?=
 =?utf-8?B?MmtTbDF1M1FjWEZUSW1lY25FNjEwSDZTR0ttemcrNlNNaFNrT2pZVEpaTkI3?=
 =?utf-8?B?Q2ZEL0EwQ0wxU1U4TC9jaytnc2Z2YVV2aVNxRDFLSnlrL3JsaFovbFdpWWxO?=
 =?utf-8?B?SXRLUUhwWmhCdncwblBwUjdLaXBMUUlXNmhFMGVySXJyeDJ6NW1LcXNWakpw?=
 =?utf-8?B?MXdwR3JzdXlpMVJIUWU3cU9BK2Y0SmF6RFk4Tk5Ga2YxV3J5VGNRSVZlRGRW?=
 =?utf-8?B?ekg1MHZETjdNek9LanhTNktIbjQyTXIybXBSVTJtWmcwWm1ENURRTnhXTEI5?=
 =?utf-8?B?Z2FQNE0yVFNvSG9NM05qVHdMeWhTYWh3aVFXdmpoWWhwUDRlYTFrTWFTRS9n?=
 =?utf-8?B?bnZsQkxwQnoyWFNDU2FhbjNxa1hOUU4ySjVLekpaRUs1b2ZIYXk3RkhXcGhv?=
 =?utf-8?B?Uk5iYmZzZnVnWWdLQnNyNEF6NEFzYlFaQW9mUTRKaytKNzFwU1ZaYmQxOW1W?=
 =?utf-8?B?VGhYNmkzeVRRTlhpU1VZb1hqeVZpQkJQUk5iQjBDckcxVFUrUHVWRitJS0Vh?=
 =?utf-8?B?TEd0aHRUMi9waEpGdUNzWEp6RGhPZkpKM3crdVZ3SUdxbm1XWTczV0U4djdl?=
 =?utf-8?B?ajd1MjZTWFJ0RlBXbjFITWMyOWhGY284MGgxQ214b205OW42QWVGeGFyMytQ?=
 =?utf-8?B?a2xoT0d4QlUwQ05YdGowaklqVGhxVUxhS0NVMWttUzMvblNOYm53OFZLNFgv?=
 =?utf-8?B?T1hPYlREck1MUUlWeU1UNloyQTdGZ2YyNFRmWlhleUxITE1RTVp4d3doUFg5?=
 =?utf-8?B?Q2FZZ2gzTnVlc014alR0SXk1U3FQQnUvWHBDMHhpZFBGRThYcFB4ZmZUUUFt?=
 =?utf-8?B?R08xdlJFL1VVTitkbUYxNEhJSTMrZjR2NUpXTENhNTNlZ1JOUFF5MEFDNDEx?=
 =?utf-8?B?eUpFL0dIQUtOZUtqQThJU3JmYUNDRGZhNUNvS09qYisweFFzUUgyaTd5Sm9S?=
 =?utf-8?B?NkNHcW5RUWNFQ2JjZ3o4aG5ndWliS3ZwaVMyUlpjTmZES2RMZUFjU1hoOUY1?=
 =?utf-8?B?Y2xQckdGN1pyN3JZdDUyYzRFeW4xNzhSS0NaTVJiVmxyTndaS0xIZktBWDZG?=
 =?utf-8?B?REJuTGU2eEgwTkxJRnpOaTkwWk50cnlrNWVhSUFia2llenQwc2NZQWJRZjNx?=
 =?utf-8?B?dnVxZHF5c0dEdTIyb0xuUU5YcVJ5RlRPK0wzb1F2QU41L3IybzFOU2JpYi9U?=
 =?utf-8?B?RmtaQ1ZOakdhV3VZOE5sWkxMeEc4aWdnRHRWNHVKb0xBNUlIUVNGOWdVQmZs?=
 =?utf-8?B?RmFUOEgzV2s2NzltWGRjZnRYL1BPTzRmcjJjVnIwMENRTWhpY0p4MDJqZmVt?=
 =?utf-8?B?QUNBaUY3T0dwUDA3ZVVtSmUvR2J0dGJkM2VRdlB1N09PZW9yQ1pzL0ZZVzFT?=
 =?utf-8?B?bUU5cGtaR1RlWTVkSjE3UkxLOVcvZWVaR1hOQjdsZXpvVUpxM2lVcmE5Tjhv?=
 =?utf-8?B?ZTFnTWdrRjhPTnNiWVZubEFKbW4ySUVyU3ZGS1J5RElhYXlXc0ZQaS9IMXRy?=
 =?utf-8?B?NGxDQjlXR09zV2Vxc2RMQTE1V2ZSOExkakx6NGdOaUYydXlMVnE5SHVRUHo1?=
 =?utf-8?B?Q3Fzc0NmOWgyMFhBWGFuU0cvR3hYSSt4Szd1QWhQTTdZcjJ4WkhiQTV3NW1n?=
 =?utf-8?B?cFE2VytmQUlGaVY1L3IzOEJGOHQ3eGxqRlo1N0hQMjdhTzliUERtVDAwQmVv?=
 =?utf-8?B?OGI5NGllbURGR0d2NVJ5NTFKTkRvaWFLR1FYZWFtOXFmVkltK0Vpcy9ORlow?=
 =?utf-8?B?Nk9iOE1weTByK3RSV2VSb25ZV1F2aG4yOXpjVVlXNDd3RWhOQXlMbDZudEtU?=
 =?utf-8?Q?ap3V3XGpYzwfqzEK7k+enAR/ENdgeIM7Lg8Vo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32567242-b6d5-450b-4f59-08deff5653b4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 07:32:17.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8dWFLVz+2cMUUeaRPfsBVUXHiJd5Q2sp8QymMZZLTSc7ofT3/Q9F6BHbz3Qr0UUqPeP5ds4minTEhbjjY1844aMeNHliLbVobTqhOTTZHP0IN5OGLI2cyTPofTRHa2c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

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
index 04ee5112d346..b662063c3b1c 100644
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
index df3d1da28a75..2ee0f70c38cd 100644
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

