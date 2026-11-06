Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966043;
	b=nxPyBEU7/9STLeBpedfaooD0jR/YvNdLx4V76Ew1UjJKGovsCu77MIWZ/cYIACtfevho
	 0IdeFybeGLW7d1pJ923qOpMsalht0xVREeV9xXOFLDjJinudswnh8kPECKlmKMK2Qm32o
	 d0AUs23kTHJRUFj3AoqW2MsptGd8wj/sTme+jZwQANoJIxkSF4YCpSzLwotFQrS/pdxle
	 iE6qzP4bM2Yw32njHvYgt/4QAr4k4AhzwPy7MPLgSvS9vAuJevkjXWKqpb9NsN0qbzMqq
	 nbSRDRz2HUpLILf+R3kdLUceJrn7HPLpDvkWTJpx2m8WGlAAqhRYt5HFWNK+Pxqa4gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8MQBSaI/8Ub41xpIizYD810WLTPdKnf6SzGRAn27BLQ=;
	b=2q3TeVuASu+cIFJa7pofRFjWVNhtTVcRjY9z9/rMSCcxmbK2+HJKGaDeCCg2R3ND7e7o
	 SX108iuNnbdYpca6/MykdpWrYfA7j0HswySDd7fmdoM/itTc3KBVb0zf9mCN1DFzpossk
	 lVo3M/u8oO2Rbd9zN79lQ0Fmuv/ttoOW4gbPGaQGNQRMH+U4SaKHqNnmjIM4frnOJQYSS
	 QfV8y0rGk/VEY9CK3f7bH5OoMf+BSVxyTT+TeiTsR8Ox0+cD3SU7SkYqAb2+V5JQlFo/Z
	 WWSefDDnBLpbcW4h2Bxc0BYvMsTq+WDylaEBGq8kjgcpVCXqH+0wF+QY6PmY/jzn7OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G2LglKpm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.36
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038F606A32D
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 11:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2038F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=G2LglKpm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6pGjnJrw1qETIsSfqtkOqVZ7u0JgR5Xq8wm2xbPYm9U9sheO+YsRDnbEW+VlcC54rGMRLM6NAqmVEf08h6xfR58QZBucRgOFSHE6u4LZv18cIrJAK1+54j/M7GvwDxembMfn67rmm6NZctt/EnoCIM2jx4RNFlffew9LX5uayoYqthPev9DNcBsrPKj9QoJo6pvJ0oAWfWkrgICd9I2ItKHU1MRJRbXlKdffgl+7gRPURfqI5QlwJbJb5toptal30I6aKgfHFYk5K6EQDZ3Xa7JE3HySHK2IQScSPGv3A037Cl82qOO7a4DI0AxphGpdvH8J9jg2M73Dyu5xkDakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MQBSaI/8Ub41xpIizYD810WLTPdKnf6SzGRAn27BLQ=;
 b=HhKor64GokUdsC82+z90hmIHp6AMk9AehctLBmfyfew7dgzKp+HHXfpXoBTuhEoAtN+sPwiCIgajzdkpi3JH3bq2sQfgMqX2rptxjXDO9z8Scaj6bErabaQMlIGe/sFabGjVFYkA8l3CRbKROLzmPTodSP2VgQwRyiJz6e8mITfAa7yMG02rX3egeO7bujI84Ekzf785LyWZvexCflUTNc0SqdWQ6+vOVxeHgXDeoukbWtxh26JOz12vlLqv+cWoeo13hFwVRN0zztHTCknpHKvw98X0jA5+g7+OxeOXV1Cc1Tcs5d070q8/zfqVQi0KH0kqxWq/oJUneE/N5ct1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MQBSaI/8Ub41xpIizYD810WLTPdKnf6SzGRAn27BLQ=;
 b=G2LglKpmgFlhOUhpeIeyCD1HyUo3FCl+wY62mC7KkRPt7CKQ4Roz32v46WEjOp7XlDokf+Hu5+JvZE00OpjvjrsLzieYJHRqizHDwpiLqFWxE3FC94Og9NRnqqBFXDsCQbJJQKQp9vzgVd5PWYByEcUo7AocY8uS+lxVAuBiJP2CBWvVOTwyFmOJAMDivErPZSyLVxVqVZVt6CA0bA5sTneUIIUFvSECcHWcIojnxn3Fg8NnycTJ3jdvBXbYJvNSUebpmXqb8n6h2NcNr+aBH/HhF3cfc3F/1vAZ4F7qx5vjlIMtnMjZ5zpY/oZ6aMM19PQwNvqgHUaTl6Y9e3PJnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS5PR04MB11441.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 11:54:00 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 11:53:59 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefan.ghetu@nxp.com,
	imx@lists.linux.dev,
	Li Jun <jun.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] usb: typec: tcpm: allow external charger detection to set USB_TYPE
Date: Fri,  6 Nov 2026 13:57:41 +0200
Message-ID: <20261106115742.730704-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS5PR04MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f44f30e-2c7e-4422-ecb0-08df3bfca507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|18002099003|10067099003|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	lbp6nInf42DwVT6tnVin2jnqc7eL55RileLh09LV1DdUwBM03e82/3fi8Co9mdEacgo/K8cjRBNNvOyaGdZykDUGi6CQr8E60ngy667uIH+H0t/OfomMk9pEsAYfzoln27ItTGBOjpNNdUQz9f4m4jkgze0wDmyWVOvVrsh9BSIAZrHGBq+KVjzCDqP0ke5qXnjgaTJhiboU5jH0+4X/UyOVgdotpkV+KVUGYkfixogoB4fHKztaqsQ9WA4BC/FCSBd35/rSezA2letRwnslESyPEnBcQ6aGGwnoZYhfT1f0xDSZKwfdCzritRzadh5wcncPkQ3u0zkP70xhwRuaB7RWwgVuKwHOYOzHkTf+wPDE+CU08sPyUsRVWXQEj+PFQluvff3tHSr2pP8xOzCw2GUNlNrpL/bZG+QfUAFebL3IFZwQXbf4CBZRWUs7XCAdmeuV3LcMU4T3rKWOufAdhLEWfON4C3f+0ITWfFWcerSSNORcLnmvoF5fcSR8QSJO2DPuBYoWfOxHoITArqHjfQDWw9vzky/mEDNgiA1V2ZDymmlfawaeox09IWiIwos7geoz6UBCtBtURomqeDDTMpq7M6YbDt8Pd+NpndbfJ5CGS2MCBZi1s+WyvutwBdE6iIPnxpFyLnuIyVe9L0RB5amwWOWZ1YscPC9y8dGp7fA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m4vytlcSlWEWSMguYDGgUs0+Kd90ccY8zpBwBLFjTHZ7Vjq9HibLwCHzyXBb?=
 =?us-ascii?Q?GrfXoExF3mDpm3dJnqddmshuvPDaiL13VqfDe4pYY9p9QffGjVocqkDjOejl?=
 =?us-ascii?Q?pL//EjSMADYwW0tNo1rKCJvh6tZtxyx5AODwlYF99buH8A6WB14opSQJUP/C?=
 =?us-ascii?Q?WsLxPBNwUqmqyRGxA3Wj1jeoKhRnXOBBMNccqB/bYciXSThRa53w81P42YbM?=
 =?us-ascii?Q?mWHhuWqUwFmtWJ5GLDat/RuaJCTEm2guB36V4bfZD9fO5zJQEZOfzLwWvN6k?=
 =?us-ascii?Q?LoFsx3kEWyi/nphRP3siz10JYryI6sZFr99HSDg1umL3Z/emFpizBoWwW7hz?=
 =?us-ascii?Q?RFL527TZKfDerJBSX75i9AdSNJOWxdnhSXjtYc+oWVHEIY8Q1XNenSa8esIH?=
 =?us-ascii?Q?hVTQZhZ6R7JgiXTMJOqT1nu3vTBYGCWIxfQJ9ha4xH3bQ6BjdJRkU8gg189X?=
 =?us-ascii?Q?lOcwSY6+OPFHKhJYkGesbZ9DBhgvAZ+x0hIOor40oa2YgoEVGJ+JP865XVKS?=
 =?us-ascii?Q?sQH/370obDvBpA+74ZEss2raK0Y4zGtnIsdq+UzKIViKQrIVOKX2QZXSG6rQ?=
 =?us-ascii?Q?W3RbrjhMB/aBas1b/5pmCn4i6o/bZl5JiUMonSwVKIK4GQNQ3jqAgyDsc/4w?=
 =?us-ascii?Q?L5F8lbng6hqSHFvMOoDNsEVUrQ1kVle+QodX0oZ4er6pk98gJfNc75V1Bt0U?=
 =?us-ascii?Q?8CGukLseiJltaNkiu4xLyaTjPi+wtFIRixO0gWSjzfM/0wHQMyhnlAhrgmWY?=
 =?us-ascii?Q?pRx+n8MvQOVFXhrVvzf1JgDUY4Po14FxYtggUXoerHOnrBO2mP5LgJQ69/Hj?=
 =?us-ascii?Q?PiT7z+o1ETwjGub8/yjWrMrWQwR3LOU5V2Z8WMpPvrPj/Ih9kBQ+0yE5RsGg?=
 =?us-ascii?Q?kzPdcgBn3O41Bci9PzXRzUgDEBDOyyUDBoPlL5zosgmaIOjgROpR6i/RVnp5?=
 =?us-ascii?Q?JotL+8/aQsKpLoTPbFX9Qkr4KwJLNfcMy86YY21/phD/+zwLOTnMC/+W/sz/?=
 =?us-ascii?Q?zoiNpkMhWmXBdpggJvBiikOQOdbGbolHL8Ec5shxhr7+TcY+UDO8w3zjeb+o?=
 =?us-ascii?Q?8EeHQiUsHz3qjkvecy0ry2dK/uYSi/96ATitsubmhNUaj6CEwIMeuhjJneUk?=
 =?us-ascii?Q?S2DsDsSkEJEx0+afCKrlcWj1ghI7rycMxq2fb/6dD20brK3QpqgdmLDdO3Yz?=
 =?us-ascii?Q?JktespnAzgq31azlq7SkA5LVT8hN4u2NAY0ONLRku3rZW785li0sXNPgrWCD?=
 =?us-ascii?Q?E3Hx1/78TB6szMqFYwHQEFARi54inlkcTi6nk8xN6Qgjz0aIduQ+OzBxuTb0?=
 =?us-ascii?Q?3rgsLPOgpA6QBwza79Jxqw9nTBBvzywAiWLRSCmM9LDY86RgXo9VRsCPm3ws?=
 =?us-ascii?Q?4Qx+0DzsA+vm38m4LA+Wy6RN4nfyvW0TSzYWWvJ4ZF/jZE7LAmJZqEsTqLmY?=
 =?us-ascii?Q?2lpLGLbgfiwTcfeJ5fNzVn9SGmwo5DWjFepapkxkQc4DdeTrJUgLNqXPZbI+?=
 =?us-ascii?Q?QA3Os5iP2CS4OAnodptZM8JNbs6QMyPX9A1xZSI0SHNGLVCVl4G6n7IGlmW0?=
 =?us-ascii?Q?DYWrRETYFQ//eAbHZbY5c8SrOM9+Tu9dKJvg50BQUbbbClVneYqMZ4hIGGOy?=
 =?us-ascii?Q?FLpU6Xbiif9UM/yGammc/wRdNI2OJufYsaN5Ds4ddEurK0U/CuBMA1JlXn2y?=
 =?us-ascii?Q?5W4Lh1lqQbQ7OVVD/WIqxgEFLWiJp796KWWbTv7+2bvgV9WAmZ1oKzmVrk2i?=
 =?us-ascii?Q?v2YD2t4/Lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f44f30e-2c7e-4422-ecb0-08df3bfca507
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:53:59.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fLnDPZaneX3oAgwfBF1BwrgM8qXZQVlMMVqC6fvUIEFI+YkTi4KszEhIWTsxzcn3ZXR/RTzMgDicSBhROPsMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11441

From: Li Jun <jun.li@nxp.com>

Teach tcpm_psy_set_prop() to accept writes of
POWER_SUPPLY_PROP_USB_TYPE and store the value in port->usb_type, and
advertise the BC1.2 USB types (SDP/DCP/CDP/ACA) in
psy_desc.usb_types so power_supply_set_property() callers are not
rejected by power_supply_has_property().

This is a prerequisite for a follow-up PHY charger-detection driver
that calls power_supply_set_property() on the tcpm-backed power
supply once it determines the attached BC1.2 charger type.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef52104..24f4e8854f37f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -8766,6 +8766,10 @@ static int tcpm_psy_set_prop(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_CURRENT_NOW:
 		ret = tcpm_aug_set_op_curr(port, val->intval / 1000);
 		break;
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		port->usb_type = val->intval;
+		ret = 0;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -8807,7 +8811,11 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
 		 port_dev_name);
 	port->psy_desc.name = psy_name;
 	port->psy_desc.type = POWER_SUPPLY_TYPE_USB;
-	port->psy_desc.usb_types = BIT(POWER_SUPPLY_USB_TYPE_C)  |
+	port->psy_desc.usb_types = BIT(POWER_SUPPLY_USB_TYPE_SDP) |
+				   BIT(POWER_SUPPLY_USB_TYPE_DCP) |
+				   BIT(POWER_SUPPLY_USB_TYPE_CDP) |
+				   BIT(POWER_SUPPLY_USB_TYPE_ACA) |
+				   BIT(POWER_SUPPLY_USB_TYPE_C)  |
 				   BIT(POWER_SUPPLY_USB_TYPE_PD) |
 				   BIT(POWER_SUPPLY_USB_TYPE_PD_PPS) |
 				   BIT(POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS) |
-- 
2.45.2

