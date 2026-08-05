Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3775481FB7
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945540; cv=fail; b=ahMQm1k9uI3BjNBVlU6TvVP4/Xg/FzXN5+7sIBKwUPFfpxHEqX88TMtCCUYVqY5A/Y1dveLoUzg670gqDDriwUrKhxJf+f7ZRQQDJcZf/8BxNcj89jd1EbB1ncmlr3tAlMYD2gL6GvrVQaVOLDh9RyrZ6mRwsOXJkqa9cayPn8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945540; c=relaxed/simple;
	bh=5MzuD8hrl7ivtBZHQ5Odv3jItIW6iQ8gZgtAoT2CJOw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uQCpGxc81TbSucyQmn7lkLXgb4SCzfA4E6M4mkN0sBE2DqZHK/eHYRh7bws7fpKIT2w40iNMmhKHcTrodHUTcdM9q9E7iSi3ZrkGNqlgHXJRRYPoExjV6QD2daTeYVRzalqeG38L+ZBlF6SP5O9BQbwkY2TtyW4qAOTlSpCu8ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OfSVY5MZ; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OfSVY5MZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwjSQPgktg1YoW4Poq8EBVSTy04rou3uTzmyy6Npzdk5OYRJCPHeZiRjhZgTdha5cC29GxQNAde/fcmc5elRqWIxuzCGlGruV1h+mszYVrGKlnaY5wy2wx4tiXslpFabzlotzMt2Q/DVpt3WP62BX8Dt0HEAOekZ/9CHYJjcQh98EDKcrbqSjcnF9E5EjIautHWe2R4pf0UmGyDfFAgHq4oF39MWmPiIOBO6q0JCgZHjb8yxvALJynIUfJw94x389m1mJE+4x8hgp5phbekqRtznQNfoBGrR0P+BJBP3T/NqxfWgBXwWDdRabWMn0LBlbdmZ5O6C2SfPlPxFBVMoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=wFyIP4bnqNdt9D6N/O/C6/xSQsV+9LDWOWRO+9QBPliHoa6hAO5h3ijBm+KeDZ4CFHJLA+SAcAkPVVOZdcyQ3GpN+I0v8gSz89CbqBnOyQ+FoCQH66d8WXUz9IgV5PRcKVfLU8h2BFpu+aDJ4vt3SVzKKMg8EboWWrCRkZlzK596U51WuWKU6rFkt4tYfxVwRUkuY41D+UKuq3cjYbn7n5fKFWh3RZTck5zLOwG3fjyQq09AexiE9oWWNd6+Q8nI553dUohOUEvm2RoOpKM85PudkoiBH6MY2z4v5FNTNwe8yzDTSs8ewgCykD9odKw81tylIO6kJiRzQPmRGGfOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=OfSVY5MZk6IQN24Ska7zkoSp7H1p2KNyh6mU8nUX0QISosihggxrlSXZomAOxLUZYX8GW+PTi7EgVpTPv0a/z0PBEV5Y0kQm/I5zVCsKEyKz3rbRDowJ1VAVCEluJpJDks5dm8G6vCPv2dV+gv0Hm5AxZHS9w9v0rbICMp6xPM+zPXhqiXBhR41UdkK1DcoFn8ytTGEUmU2IeCLRmdNHG8dTO5XEPysK5mnGiZFLmD+GCZUsnyAbj/mAWHlEKwXNmM/msZd7Gi4M5gaLgXqniD8dBAEkyO+OHteHpaAV/wb94x+TrW2i42zDa58TxB2hb/QnI1lzy3jt3vO1UEVrhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 15:58:41 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:58:41 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 22:18:34 +0530
Subject: [PATCH v34 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v34-4-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
In-Reply-To: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785948512; l=13976;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=rboH4Kq8cEx8ii9v1dt0V9U4MBQ7gMQYcVOHTD++Nzc=;
 b=m7+LMwR7DIy6Z7uJ7AeBp2BVheeXnh/GmQRdXN7pJuJm/Q4w0P3+j0EPkbumoaIihjSV2W5Vg
 SIjqwmJENOjDK+Wq2iWriXVRTcE3/nu8lZf9H1OvxUsfJu9aLnjS6s+
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f02eabb-2589-42ec-a520-08def30a6ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q55m86/U4oMEPA4ZDam3NlCeU0CO3iwROWgXmc/W7SC95nTSShna0Suf0VbHaCFb11lRf6JXw5WfLUQdXBAgBc/0Z6ndvVU56YN18RdYvHmDWtjgQtoukvSNQpn+qd+IVxp3oPKRi1TmnW0soVGUbYV/eKhLbaaP7yH2ZbzpdF8pCsDSD7+XwYhP5epDZt6eJRCe/kR2UN6bvDFkJTXPHuoq5I3+tUDsDuqZ+9QhCHAepsNdeK1+jqel5QhDtPNRa2U9/2pyzECza41a7RhGbHDXoa+v/F2s5knolxbLmhK0VjIPYOCtGfTXnTUjcAoYJbQJ+dxUMPmgQpw2Zu4D5MH41MalgDcwiw42We8B+rznfCVMiNKJLbh45+iTl0w4ZfzUAHFX4cRJa7qNzPzaekFoYjvEQHN5qkWsn63wIuhIOeLul8S4O5PsagWaltEOF3wrF3FFKz7iwq8kYXHxoqqW2ODUn3QDdza0eUInC9dFGQP/8LtViUE+pDf9Cw1aVryF8/La1/jLoa2u0MUGtHUxWuU+dVRR6wbOpwFRWgT1kKYGe2WRWYgFfuhGqk4gNaeXQVZxGU3UxuszmUylGxWy0BzHstCQGRYA1hlllXI81RgF3WmcTTjCy3rDALO4XgeVWRFubOh5v9Scn19wgYnwYowed10t1JSKcJXGY7qeUDlFl40b5RStL/4IAmXrJoji8YRulO2fnbhFd2d7iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmdOZXRoeXJYOTFpVmxJQVRVak5QWThGZjZNeko2YUFGT0xTRFhaWXRuQ3pN?=
 =?utf-8?B?c0NJN3lCRForWWdnMk9BVUJKQmV0TGt1TU9zK2JqdkQ3VGhjZ0FJbnV4aHZW?=
 =?utf-8?B?S25ZZTRmRDVoaXBuY3ZCM0gyUFg0cTkyclpWUnRVSVY0OTR6Q0hUanl2WFlu?=
 =?utf-8?B?VGlTOWs3NGUyQThKYTNnaTg2eENHcGVMckNydnd4UFJNd0lOM3l4dCtIY05s?=
 =?utf-8?B?NDZ1cjhrbzR4azJBNmlJLzBCbC9tTDNWdWtDUGFtZHYxQUR1QUd0ZkxIREJM?=
 =?utf-8?B?a3V0SytRbTl1cHZ4ZEY0cVgvRWtCeUpQbFV4YU85bzFkZEdIZTFwTGswcHJC?=
 =?utf-8?B?dm1KUDhheTFtN3BZWmFzcjNWekJFQ2todzBjb0FHLzdYWVYzOUZob0sraW85?=
 =?utf-8?B?YTR6NWlHN2pXNVlEbGtXblBrZ21oemVwayt0cStqUXMrS01QYkI2aFE0emJq?=
 =?utf-8?B?NHBKZEVuYkY1Y1VqeC9KMEk3Zm83RmkrZzJ0di9yUFZKVk9BTDdnZ3dFcStG?=
 =?utf-8?B?dmxDWFE0U3ZjU2xTa1Y2TG1MSnBUcEtSSnQ2QWJYaHZmUWdBTE9UNkpsVjdO?=
 =?utf-8?B?NFhjalJ3REFjUzNnU0p2RUpQazlGa0xxYlBoanhKUWU2WXFzVjhDR21kS2Q4?=
 =?utf-8?B?WUJFUFBHR2ptQVVJelNISDNJY3VGckhTWWRSbDlpRkQ2bWVWYXhLU3FSMEJ5?=
 =?utf-8?B?dS9Db1B2QlBzQU9mSnVvdjZuUEZjSFdLWW1OeFdwblZiN2wvOFpoTU1OVHBC?=
 =?utf-8?B?WmhNQzJlTVFvZ3pkSlFldXFwT3ZKWUFLd0l0WHJvRmRzWDU4b2U3aE9hVnlG?=
 =?utf-8?B?M2dSd3grTXFOcndnOUlabURMb215UXI3cFl1cjlhVVlNTGJYOVByMmJyNHRQ?=
 =?utf-8?B?YXZxUUJ3ZXVROVpmY2hEK3Fhc3ROeGhLRm5jZnBjYzFmNTFsZXBJZGdUK0Fn?=
 =?utf-8?B?cm5iUlYvMStiS0FwUjUzQ3l3ekRmRncxa0ZKZ2pmbDBjdk92VFVoRDZOWUhu?=
 =?utf-8?B?VG9BQ09PdFdjZmRibHdqWXFyaG1aU05CNEJiWUtMMzA3U2FnaHNxbmVYYTh0?=
 =?utf-8?B?Z24zMEZUT3BhTjVWOGVlK2YxbkVLbmlpQmREZzNHQ0RiNVRzOXhpVCt5WWlS?=
 =?utf-8?B?TzdMMXpDL25mWDlFbk5icXA1cXpwbS8wK0NhME9VWHBRUDdzcUIzT0JpUGhz?=
 =?utf-8?B?Ti9LSldqaXZLcTZJeGtJN0Z2SWdhR2Y2bzRvR2pkR1ZDNk1PRUpTTUhodGlo?=
 =?utf-8?B?K2ZObW5ocnpDZ2VGNGFsblJHQVVIaEhkUzVBWTVQTWt2Y21FT3JjZWFLZnlr?=
 =?utf-8?B?cUlidmM1eVpqQXZIRkFqOEVvOXcrVXVIYjNUd1F2ZXRvMWl0b1pXLzd2bEVP?=
 =?utf-8?B?YkR6RmptQm9vbURnMjh4eFRoV3NtaHR0ektOdWJOaDVVVXlkYTB6bFhiVWlR?=
 =?utf-8?B?aklYZWV2c1FGMHpBdE52KzVFSHVWbkQyb3VrWjJXWFJORkE4aS9PdkU1VVdB?=
 =?utf-8?B?L0VmM2gySFhpM1hKS1krOEIrQnNiWkpreFdMVWNzUEFRLzdKZXk1QS91Zkti?=
 =?utf-8?B?S1VGM0JmM1FRNzlqR25KZStMSlZGUTBhZzUybDg4c09GS09aQVFJZjdGMnNK?=
 =?utf-8?B?RndQOHVzRDQrMzRud1gwbEI4a1hkdFVLOFVxZGhLUFV4WmxTaTE5SXlmTlFw?=
 =?utf-8?B?a3RibXV2TzE5d09WQjE1SjFyWjBNRFBRa3VPTFdYRW9MZWhFYjhUL3dBVG1n?=
 =?utf-8?B?ejZrTTB5SzhnU1JsVHl2d1liN042dG5DeGdrUkRVS2VsdCtSSjRLYi80TWE2?=
 =?utf-8?B?L01hTSsyQkJ5cVk5OXQvai9jLytUd3J6eEVTU2k5UmRMa095UG5mN21jakw3?=
 =?utf-8?B?MVVzVkZBS2FGdkxjV0RZMWVpMUpkZHhnOGJncjQyU1lRMUV0S3hZQWpCc1RX?=
 =?utf-8?B?WUFGQ2J4ck5oenl4WW5YNkpOQ21LMkdzMWVjWGdMK284UG5MS2JHV2JaT2lj?=
 =?utf-8?B?ZFJ0Q0JqTkViVk1tQWpyVU1IOXFlc1kvUHZuOWRDd3U0M3czbkVrc2UxdS9X?=
 =?utf-8?B?M1JHS0hNMndMMG9aWC9odFZESENrc2ZnZmdrNWxpZWNYVVpmMFJabGVmQzd4?=
 =?utf-8?B?Nk9PNGkvKzVwMTZNdlhFSGpDcHV2N0dEQkFac0RpSTh0Z1RjazJjOWVCbzVu?=
 =?utf-8?B?UE1OVWFKaXVrV3BWUVRKSWVTYW5sQjg3bXF3b2dGcTFrQlFWWlA2NkE5VlRC?=
 =?utf-8?B?MVAzUUhpZ25HUFV5bUFmdjg1VGcrU1lzMDlhVHZsUXJPdm8wRk1ydVpCd0FD?=
 =?utf-8?B?T1BhZlJvQUp2T1YyaldqUXJjWmxoM2d3TzhJd05PdVJOKzA4RFhrTzhwK1Uw?=
 =?utf-8?Q?8tBqWtl1Y+UUP5CC5s91pdQBVOyOVvWojrjC9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f02eabb-2589-42ec-a520-08def30a6ad5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:58:41.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58j8uDLXIlJwQfIeKYdHPwWTe+pGs5OaKgT1NVF8OUBFKseM97PvEpo0BNb/16Q04kCBb3T+obG9+OnPvvYzmFOdYwHFB74i7pto614aLP3e/ClwfmP6Ck+LFZsd75M/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

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

