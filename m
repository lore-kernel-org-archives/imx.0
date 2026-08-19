Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4935C1AE
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145358; cv=fail; b=Ad8K3KjjAqiAbEAQpXnu+KLb72StV+AiaG1pSoY4bXH6w7sYZlWenMO2ssxSRWNR43bYdORH+TAyfYLK7QR/5Rwwk/YMdbcMJKm9tflDTV2z5Zk6ym23ngJtrdznn5xkv7hQanWK7bLqQVFuP+m+3IYjS0xC5Q7YYMEBR0gsH6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145358; c=relaxed/simple;
	bh=MJYBHtfS4eHxM04NB35N1mTAvXvdlK4AtlIrwERV+3Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RwJ/5j7twNNXeC1ynDvecMfQmDz2gwP8vVn3k/Hp6R6FitiFSpCg1oYf/MEn8PXoESBrjvq49/KoW0U/aLiSRrIxzFp3da9vApli6P1g/ZWKBHZS+I3WD1vkWYA6n8N7+bkDWX335y+aCX5QJPMwxbrxsNzvtdpRQPSz3upcUIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KnLYYEZI; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KnLYYEZI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIZwONjNWgnOBd0UAadK43AXipgPzfv7jbRENAgHkgAIHrEdP5KBbDATjAXiNw+soBf/fOJeACdCtsjFXdEljkn2fjR6MqLAKLJkz9j6BE3xJkqXpN3qbuYyy+51pOxJsLMPyZHtenLn9mNKOsLYMPkj+useBqbPSGcXqAv55Cgg+RjsA1fOezxvmubz8DfGJxtBhNVbwFLMelIiYbPUpui4XIUmsGuKGUWp4S3pGF0RI7Gb6mX3oxUR2cVIJjIj/O3LIqJKrNlwf3lhpsnpVlJ0iWPRh/KnVdz1buDTlVZFWHf2I7d6Mn7uqexxbA/Vc0n0EPjgBjAZ1qeDdv6AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN7Fh3KXu/CaU8OBldvL2COAT/goR2IgYq44MTB2F2g=;
 b=eusKhmEIvGIOxXYL3KZdo+96h62lOckiRnm2WxZgnfpsXKPgg5UYbqN8SHcK91wTmsHjzaCahUJsQrqAT4kQed54r2HtMe7Cjy/5ChYdbz6X9h+SfEhJi/8AYzaXB3Gqe/xjFD5zs9KW0/mHQHKQxov2hvgxVYZWN5vhZjUEi6xLyF0lC5yX/hwd4QEAtmhMuWAvaZmXM1/sJ1lNeO4mT8oqLP2my/GwOTDpkuFom2JEfn+0Xe52uKh8JcFk885JD5Mb4Kj98T2fZ+mY1/xGRpy2IVGx4ffbDR/TApBMdBzUwrIza6Da0Kt0n9qp6KzcswzqCDMgKA2TmfJ77epAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN7Fh3KXu/CaU8OBldvL2COAT/goR2IgYq44MTB2F2g=;
 b=KnLYYEZIZ8wxfj9ANiASv8cO7fUAmV5MOhNUKdhKpjAzwX+h/4cqvLZNyLhgR+NnGd70xlJWkN/NyV78O4In1iyFEgtc7L/X114wVE9RXlVJBrbMfPmBBt0H26HujCEGTarvr3bLwqzyCquIgABKfRAr5iDEOwm6E914HJltL1XP78ls5/x9CwrncwlHrgkcV4ZpaX4dis3e8r84yCHi1Ph4Xz4xsH2e0YujH12aqkYmYNkPZMyJkY4/3vuhozbSdjvJT1SBSAauntItjgtt3sK1VC5I9kLvm20K30CXRmr0sl5ENMo8nvA8j9sU3jsSS86FrbHB7iX6AAqKpRj1ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV2PR04MB12086.eurprd04.prod.outlook.com (2603:10a6:150:301::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 13:15:51 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 13:15:51 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 20 Aug 2026 00:15:59 +0530
Subject: [PATCH v38 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-imx-se-if-v38-4-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
In-Reply-To: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787165160; l=13976;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=eNxQe9XjZuhYJPvRWyz8H3LkdQXLV5Z2mQrWUACRH44=;
 b=89aW4dKZC4l+ty/oQc/Lc9OHTxO7FOwhioEiRtXvqmm7Wbs9CnLNSQ1XXYQ9NGoWcXrqTo6uk
 /ncqzoR5A0iBrytNzuFLj7u1gZlLnmt/h749odQ4lDIZiyvc/PuJ/gu
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV2PR04MB12086:EE_
X-MS-Office365-Filtering-Correlation-Id: f86c7e75-e114-44d7-ee46-08defdf3fdb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|921020|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2/dqbQOqEYbN00Gq2YfudG2veDpgLUB0YqG81xx9FkspMffuG9kTK+3APz9sUFOL6Vo8+SafMTp2NSbbAM4fw5VHWLkSkOfI5GbSL1hGIxyXkN/DZQc0ze3Ik2X4k/bD56Msv7+kFCLKdjKrngO63dJDMpkCHn4Mxn5M+HieVkpWN41h3Kmp5DyzIXOeBIBdbUDmgRUvtVTYytETiDBBoYHdozyakB8AFKpCRi4XoqXLHafbxG5dclFZBm8V+A+ejO+pfJmMWY8S2ObjJL617zc72twP6TLOLEygkF2hphvM4jGIDVU5hR2wZFGxneWP7Yf6FThAncJd65l8D1l2W+g9nLjaIwFsJSbWNLSEz5yODq9DiPEQzSsoSgih2oLT1VdKprL6tX3XgUa0ZY2PBbwbCCjkqbZW+/68X0oFrtTsWzon5NDhd7ojOkPtc6F3EQRopPniglVbFWpRoqpdnP9S2SlEe5r/GsxxAWZ4qCK+2LygxoJ12swtn4BEklTW+y/gXsr/0GwMdftmA5hynRdKWB3bVgXnLmSA/46dUzfIGXF0mJYhv3hhzhcTSSgM3BDFDR2kNjfkergPK3vLCwSY/hxkcDTBwu+puamb0JO2ga/lr9VjjeLxC2aMjSTU/39w3EnC/pgGLczjYmE5Z/GoQjLGp/twfGOLs+4CjpNZKDB1VCoQMXWit5JGPp/hQObycg4zkp5IH6hTwse2tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUNkWnJ5MTZpMzFLWCtPemRRc3IxK0szZEtkWUl5Um4xMTZNVDFteURqN0M4?=
 =?utf-8?B?TnNWQ0lhMlB2VFgvaEdNUmNjbnEraDRud0FuSTJ4WklWRzBXd1FFbUFqRkcx?=
 =?utf-8?B?cVNuSFdzUmNJbFpBRVVmMVFkOGYvWnJBUXRHU0hsenB1aHE2TkdTQnpUNGp2?=
 =?utf-8?B?b2V5M3dzUHNNT0JOMU40cjI2YUNHYTRJS2piTExJNkhGNVNWeDNhT042SDlC?=
 =?utf-8?B?blprVWRibmtzeXhnS3VtYittUWxPWGJvcU12dTlLa3I4K25ORkVLemRuTWFs?=
 =?utf-8?B?a1ZORDFFdkNXSEgzcGRWSE9PN3Q2RXp5T2JvaG9qTkw4M3Awd2thc2EvRWZk?=
 =?utf-8?B?S1VSMExwZjVReVFGbG5rMnhmS0ZJZDlTcjU4U1hLcmFiU2tyRWJtaU12aFEv?=
 =?utf-8?B?WDU1TTdQOVd2ckRXVXhoQ0RkY0NLdmZHMlhtVHRKbU5ZT09odXhlUE1GN2tH?=
 =?utf-8?B?cnNqTWZ4N0RpeUJ6VVU0emlEbEljTXdjVk44SmpRV0cwNzNyMC9jaGhJK0M4?=
 =?utf-8?B?a1YrTFAxSGN3YjNJUzd3RkhFUi9UaFF4WHh6UGRaREUrdGZ3cklwSlZIYlh0?=
 =?utf-8?B?eW9FajNqT3RjaXJ5cWR4eERSV3JxaUJCMnZ4ajBxZzRkd3dabVNOcEdUU3p0?=
 =?utf-8?B?Y1BKQjJZYVRNSVgyZE5qci9GUG5jMlBiN0Q5SkQzWFFIZE9STWVManZlakE0?=
 =?utf-8?B?L2FYMGo0UDhoeTVkY2RzU3hGQUZCZlhOaTBWK1hLTEw4a2tjT3dRazdsTlVz?=
 =?utf-8?B?UXdXQ05ORmVyU2xIWWV5N0hqaHFlZVkwMWpraHA3WUQ3cSs1ejRBa0NUTEw2?=
 =?utf-8?B?Nkd0aGxhOS9zcjdvR1JJcUl3eXZCRXFVamp2OXB6YWwzR3g0ZWl4M1h2T2Zn?=
 =?utf-8?B?M2gxZFI0OC82NHJXU1RlRTJxMkJhQzA2SlIzdngvdUd6NS8xNE91OWhKTHdQ?=
 =?utf-8?B?N3VtVXZUNWZRRDVGcG03TTlUU1NIRmppalJzMERTdG5lQWFNakxkWDdMQ3BK?=
 =?utf-8?B?NDZCc1NYUUN3YUZhVkJHUGlCa25HOUNwclhuUFpOODFOMGRRKzVmUlpxcVY0?=
 =?utf-8?B?TjZscjdTUVRCZXpudmY0L2FqQVBaZjBHQWEwcHNtVjJ6YTUxZFY0UllGWW44?=
 =?utf-8?B?WFBkVEpKT2JOR2RLMmNxbmRQNGdGTm9KdUxxOTI3ZUFvZ1Y5V1lqV1RuRTBO?=
 =?utf-8?B?MFlsYTgzRGNCbGU3dFZPOWkyY0FmTWx4QitrVGFGMWF0VGpuUGw4Mm50Q2ZL?=
 =?utf-8?B?TzVTd1U1ZC82VjZuSXhPSVM2R1NLRHJJU250dmRlU2Q5anJnZmhwNktGKzhJ?=
 =?utf-8?B?QUpmaXFJdDJIV3FXN00wT1Nrc05MSWpuOG9kaThTZEpLayszeXY1bmx5T0R1?=
 =?utf-8?B?dXFUc0NHNnZMQkljdWJTVE45OW5BTi95eHhrNWZvVEJyajFVOWJaenlWSlE1?=
 =?utf-8?B?d1NTNjZWRG9CcWxkRUtjOWxEY29leXhXUVVOMVlEOThadkpBNTVjakZUcHpl?=
 =?utf-8?B?NXV3ekdhakRKU3V3MXFQaVVDZkQ3SU5wS1F6STBDaDVDOGxzVmZGRzNkckgr?=
 =?utf-8?B?eXNFR2JyVnEvMmlydU1qanVMOCtnTTUyYW1FUnJBY0cwcFlRVEVuU21tbU1O?=
 =?utf-8?B?dUxxSVVKZUtOK05UMUF5ZGVXdXlzTzZqeGYxS3lYZFJVc1pwSTZKYXNqNkp2?=
 =?utf-8?B?KzNRUTRiVzhvWUhHeTJETEVaVXZDaHRCTVFFZWV5d256TVdMTUlDMU1aUTgw?=
 =?utf-8?B?dG4yY21wZEtOVUpzWVhDc2VtdjdvWWs1cFVzd212YUFTV0hEbEV0ZjVHcDFz?=
 =?utf-8?B?a3R3UERnWDlTYVNudjdSdGxGSjR3Slk1VENNanh4YTI2MDZFQWYySWJyaWN5?=
 =?utf-8?B?cHJPb0xFY1U4WlYxWVplajlUbzBFVGxITzNpQVRLZlFpZnVPWmNYSFp5TGpO?=
 =?utf-8?B?ZzIzMUt2OGFwU2RUcTJ1U3pZN1FteTQ5KzdiSkhBUFhxZmV6Q2FLR2J5bFp0?=
 =?utf-8?B?VFZVVGVWUUV2dzJWZitacXRHeHdNbWNYZXRvZEM5VHB1aU5hbUU0S0VxZ0h4?=
 =?utf-8?B?Mk5Jc0hRaHVDeDJYNTMzdStvWmR3T1ZSOURpNVVMRFk3T2VKMUpJaTNUYWND?=
 =?utf-8?B?K3I2QWszUHJLZkhvNS9IRlh0c0g0QnJLZ1NDaVVrbXlrOWJ6TXg1NkpkR082?=
 =?utf-8?B?YlR2YnRFYmVrRDlwRTZDNC9KQXFSRnZnK1BHODZOWXY3dlE3NStoRmhIajVP?=
 =?utf-8?B?Y3Aya1FFYzFtM3B4ZDNueDZHTWI1TzZHZmxEYTZLSEtZZUdxazRhRzRqdDd0?=
 =?utf-8?B?TS9YQlYrMTQrZnlaWTBtQWhmbEp1YndNZzZKaUVadklMNExlTHN3WXVxdzYw?=
 =?utf-8?Q?A8TN9XkITqOJuGijQqk/aji+diOKbCZXAyXPq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86c7e75-e114-44d7-ee46-08defdf3fdb5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 13:15:51.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTGH4q4kh7JrZHRX273sRPRKKNCHGBCQgm0rBrd811+W8h3rxNVHXEFlTAaE0WYevfbCaJnAyEzrvj1vqBYIllqDHXv5zZtxb4I8992lBd6XONGHqcv5WqswyWbNPQf/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12086

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

