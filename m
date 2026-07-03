Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3393BB69D
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075894; cv=fail; b=fGUjG6AUcZSggWvboGqxVQ7v1v083bud5LjNFCKOpWxzQLxO3tn1Ydo9Tu+m453Me/Z0tN4uSCkmhmtRP5QG+W+kbdunOalao25y+I0vlwXk60KPZS9SRkagtTOLSMYthnvQSVrhUlWvtIagl6KFuwyHRQJaodw5f3bSX49vyPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075894; c=relaxed/simple;
	bh=F50LaYxvqSS4TTLfP8wwi3e44NvQPDWbdCs8qWX6Ykw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5ca3ME7jxN/kxGqn2Fb41zNWxmqHVfC/tPY0Twq8K6wZ/l65pLNlrqokpJtyxIg2CuM7U9W4C946Q4+ciJohDt3wMUC3PnDp/s56LRZDUW5rU7tJBgh831Iv1dk2jmUClM3OAzXN7S+f/yF2M86AnxWF94p+eLaNqgdJREcdWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=QEi1Qcqs; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="QEi1Qcqs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4ot1/+36pvUWaqbEWKkVKzIVwiaXFGdxgYuZV9t+ViHW0UgdTOk2/cht2ie31BQXeL4u32At1Ts6Rv+0uj0pCVo5GO+8hZta97xzMNZITbT0ojP+//0gOy6u7JwNW/FFWm0+6OG+WVoDSJBBxZ6mAIrSniEFepYJ8JPxm1J+cXPinkM0wVehDLgfAOA3AVv0CxmHpvdLv1lxlsYFMSUm/WL0UHVtv4874eUMXgHnT9yOsJ42OHUcqE5qm7oP6Xkw6xyMW5+gyyVBUe9LqHqzdrRGq/SKJSSZK9GBH6mivImCXNKjkBtR0TMYWlY6HPLLfZNd6I3UE8SZw8VLQFpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mtxJ4QNp/pDdA8KtFpNu2l8w8Ds7Rz91XF1KAARPnA=;
 b=bGtBeOh50rYEpXkvA8zuB5K7jPvu8iRtyw7fFSmYR6phLHvgmw7tbGJDbXPaQ1jif2bcZ+PjkZcBm3GO6EaBInBwsuzKWOgxsu4FvTXtTWuu+j2KAFdndCrLyxfiqRmBzMCGXWXtPaD8S2fBEj+iXhHFzG1VnyJAuY6oTLdy8eJpwNAOOQM71XNc+AhN+oD28QPxCjNc9GC8ETVESpM5ptOVfbePq0GhqP6LOGJRERWmUrdmG59jgexNuwTb6ragZFh0OTOJm2XdonCeyBeiXTI9L/MF4e2BWiCJgYlgWgNMiPmRfyPLjJeB9igaQu2HGLTFQgPdRMIBY3UmAyhKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mtxJ4QNp/pDdA8KtFpNu2l8w8Ds7Rz91XF1KAARPnA=;
 b=QEi1QcqsjNFUBUfYee+OTdHVXoY9i6/zaRsiUEJBTbok6sLMzQVODx7UyONQHQ4AxN+1Ilz9+Kr4q9DBOAylAOx5+2NjeszycBwfaxOBtREpP7jQ8wk/lOaKTMZmVllcmw73WF2r1lwyFKs5VzvmNPT90CFfXrSQj57KRwbdFkDvWjGIg6S/fZ5kHtNmwrSftOCS3YozQKmZsaVcXjk2CVGKDi1MgkBvyNKoHZJO1Jasc8274oMsarxrJoZehNdbjTJYHTenQbptTg9Ha/F4zA9YbrgrkBYeCIcGPztIc2+XydIo9aTs34Z47WH1chZwpD5B/Xyclijlfnsx7sSNAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:28 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:28 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v5 2/5] i3c: master: Report actual GET CCC payload length on success
Date: Fri,  3 Jul 2026 03:51:14 -0700
Message-ID: <b5899827bdcf3f3097ef4cf5dae221cc5305337c.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 795377b0-d62d-4f50-94f6-08ded8f105a9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	eUgPSY0OGoxlGCp0fhSpKpm4Ax15SyCOK07b7Dj8qIUOoDpA/nIf7SccaardPnMgeGKny+vSLF2IhVcpbQttUDEHkRp9dzBnVBY2dhFzPi8WpMHtCWN98Q3OPVEw0mL81t36OQGdyJVX95sw3K4mJL30YslQbRvm7SiWGyfA0G9SrOufMBXbca3AnE+W+L9AS0m3OoYqz2lKNOzhCcoGR04XjiSNeAJR3/B6qVcQFWufctyPjn4u8n/aSiuKrwTm/ry4eda5UReiURH2jlRFn26UeC0tdWqZY3M0bCQVDbjqk/RiEIxKttJq7g/J3EY+mx/gruxTmP4kp6S/LFYQyGfMUkI8mR7k8Ytu1hGBCJAGpeMqur1VjvHjLKjCkj/xjQJ/LgeN3iCdUdBqMpNOeRuy1og9am/YNQIUcL2OZt7HJz4hDBsYqq/xe8tms3TqpznG822aiSIH6MHcjJBbxz41AA/66n2pVzJafjwbCo9pN65SMpJvuFriXZr3cVomrNlgPuWBHupUfD9CHhDJO5aW6bE24V0Ch1wFGRJiIcwUVO88xRi9aya5thOSyUMaDZ5/NNiNvaS61F8ReaV79mR1PigBzCSMw6WVv+EEcjU2dx/dgxUC5XzQ4sG7M3yrxEQEMA+RKc0laRm6P8SmK0X6GPa/Vti7F9OVbPydiTWALxp3Hz5R21xNl/V4wQA1g8ojn0g7A2AwANmmz0JbOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5AM+6iuARZi/6mnuyWODv9zB4qZAJTP1rnkA2q04LyM8hHtlxSxTrQPKzDX?=
 =?us-ascii?Q?GGSOd5OVHO3DQOR5LyNzhuuSWuPcDGahvg2H9xtPkNq5lDdLNmscFjgzNqce?=
 =?us-ascii?Q?AoSRECT5aUBSdYXVl9S135kGlH1ia68mWaKfguAbb87Q+Bc8f3rgkGaSwRnH?=
 =?us-ascii?Q?BdA315plIcxOCYs2CF/I/7oFxyzP2/PEP8FFhR2drge+m8HB1VgTTm+xqJNU?=
 =?us-ascii?Q?sCsOq6wh9UWNTJBFrWHAyE4k+zJiDmVcqdrytDjjqZ6g8CvPfm2iRlSnF+F+?=
 =?us-ascii?Q?3MI2DYGasTf8ipWDZqwe7SmACtGvHCOegFTp3vBVSmltMYe6iwOYKP7bdGub?=
 =?us-ascii?Q?iUy4g/I7w7Dbg1rzVHqqGGKqMz8GIvxomxj0DbodI6t/s7/G8hiCtVB1+J5o?=
 =?us-ascii?Q?ez+WjvputhBlyNLaSPmfUL+gWBvBHrv1mYHSsIg/JItPJ6NyJNcrJh3gzOvg?=
 =?us-ascii?Q?gsDH+PI9h8qeYthbyKOtX3lZsm+evWWblTUJZBl6ZJMl8fVpEyh+v2h06VfU?=
 =?us-ascii?Q?nMniQbZjKJzBGVZh7qfR59DJx67p5QXaoxGMUKo43GHIUH32/mp9Hbebqw77?=
 =?us-ascii?Q?JHvNDjvmeGNsDShjUJLDNAP7GgCb3gxaui+vPGAUYJ+tHb1AJdc3XhQh1Y/5?=
 =?us-ascii?Q?yWkL70z9HkUwrPnnC/yA/vr+WeVBejlKWGEGQlQM5KyA2XGmbsljDLAB9YLt?=
 =?us-ascii?Q?/MzKc1W8DY9jWdCOJE3GRHK0xd06ZUQXXUVN9Skf+nzw26isjWTaWIaPcFMG?=
 =?us-ascii?Q?kfb2jxvdlvWG0hHnqJGhvTYTB48TKHgk92dUBDPzsR8xhRMOSfcj7m7TVj+W?=
 =?us-ascii?Q?Q5OOMGxRd+Z+cquE2SCKHNOzh55ov9A/4SiMcpAUlsJmE7jqjNyu0D0XMj+T?=
 =?us-ascii?Q?egZBuL8c0P+GUduCG7j/c+vgk52xW3asKMiNfJ0KcXD2VzJ1BdhiHwawmSr6?=
 =?us-ascii?Q?gCsZnPYGmMgC5qjOZWh633qiFIFFRuw+8mVwkdDR57ZkGkXaeitgdePvaJr1?=
 =?us-ascii?Q?jS/W18XhtKQZHqE3aWWsixD45KkeEUF2XajTNae8iMDreCUPbni/3AOcvoAx?=
 =?us-ascii?Q?szS8f/+oOagh1/Z3TrYKfTXSOuy10rxqQJQ6HZXMqIWIP2d5RD/LEunKpIMK?=
 =?us-ascii?Q?Pgsyn5sNJfLHsb3luv2uXnNr8QtU0smNgIhH0gQFr465WHnDH0hMPfe2hXa/?=
 =?us-ascii?Q?uaGKqqsWUNNPFJZgtQS639BsfIsklpFtEdpeCk+pX44OGD45gdJ7cI0pNMxk?=
 =?us-ascii?Q?JbZHlnpl396ViZF9B7WuLMPCqzhJW/5nuTh5QmEn3BrmxaqrX3DfnsWEEWl3?=
 =?us-ascii?Q?orM9PsC4cBrToiXYmjGNkRpKo/dwYwQYGz5qBpE21Wx9IoTQaRKTSfasxbSW?=
 =?us-ascii?Q?GqBubMVR4NSC8eSSYv8gaQEBI+pMc+BnXbw3JKZh5BiVyo6ci1mMzFpngOd8?=
 =?us-ascii?Q?k6i+qHmTBc3729CRwaMF78wYSO+WlyG0+JCdLRMdoa+C95Lri0r4rI369VW9?=
 =?us-ascii?Q?Z+JjOE2zRrv6vGyHumibtA29wicelH7V4egNQXJL3KnssudDpP7z10p82XH2?=
 =?us-ascii?Q?fW7CXzedyf0fZArvw7MfOA3iVhh+psccNJDt/2g4iOZzEkQnTCFuo9hJBbna?=
 =?us-ascii?Q?rP6+pt7/Hez1l5MyMo57mWiYq7Yj/ioVfS5aI3MMfNlmDBeK8WAc/PW9zj22?=
 =?us-ascii?Q?2pjLU+jQbhxe8hptx6QsX6tEUuulVp2RZgERSCKfLMx83OTeJanokdFjHpvg?=
 =?us-ascii?Q?JSYzC+dOww=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795377b0-d62d-4f50-94f6-08ded8f105a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:23.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDJnbCwJvTDKJoA8SbX6dAcrYW743DjaLfTY9y3G9K23dAFX9vrWDMURmmf1BMedDs/xAij065n7HDkwG6Y9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Set dests[].payload.actual_len on successful GET CCC transfers in I3C
master drivers so the core can distinguish requested and received
buffer lengths. Switch core GET helpers to use actual_len instead of
len when interpreting GET CCC results.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- New patch scope: all I3C master drivers (adi, dw, cdns, renesas, svc,
  mipi-hci) set actual_len on successful GET transfers.
- dw_i3c_ccc_get() sets actual_len from cmd->rx_len; dw_i3c_ccc_set()
  does not touch actual_len (fixes v4 regression).
- Initialise actual_len to 0 in i3c_ccc_cmd_dest_init().
- Switch core GET helpers (getmrl, getmwl, getmxds, gethdrcap) to use
  actual_len instead of len when interpreting GET results.

Changes in v4:
- Refactor dw_i3c_ccc_map_err() to return enum i3c_error_code; callers
  assign ccc->err.
- Map I3C_ERROR_M2 only for RESPONSE_ERROR_IBA_NACK (broadcast address
  7'h7E not ACKed). Do not report target-address NACK as M2.
- Keep RESPONSE_ERROR_ADDRESS_NACK returning -EIO in
  dw_i3c_master_end_xfer_locked().
---
 drivers/i3c/master.c                   | 11 ++++++-----
 drivers/i3c/master/adi-i3c-master.c    |  2 ++
 drivers/i3c/master/dw-i3c-master.c     |  5 ++++-
 drivers/i3c/master/i3c-master-cdns.c   |  2 ++
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +++--
 drivers/i3c/master/renesas-i3c.c       |  2 ++
 drivers/i3c/master/svc-i3c-master.c    |  4 ++--
 7 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..037b3b980717 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -901,6 +901,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
 {
 	dest->addr = addr;
 	dest->payload.len = payloadlen;
+	dest->payload.actual_len = 0;
 	if (payloadlen)
 		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
 	else
@@ -1302,7 +1303,7 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	switch (dest.payload.len) {
+	switch (dest.payload.actual_len) {
 	case 3:
 		info->max_ibi_len = mrl->ibi_len;
 		fallthrough;
@@ -1337,7 +1338,7 @@ static int i3c_master_getmwl_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*mwl)) {
+	if (dest.payload.actual_len != sizeof(*mwl)) {
 		ret = -EIO;
 		goto out;
 	}
@@ -1376,14 +1377,14 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 			goto out;
 	}
 
-	if (dest.payload.len != 2 && dest.payload.len != 5) {
+	if (dest.payload.actual_len != 2 && dest.payload.actual_len != 5) {
 		ret = -EIO;
 		goto out;
 	}
 
 	info->max_read_ds = getmaxds->maxrd;
 	info->max_write_ds = getmaxds->maxwr;
-	if (dest.payload.len == 5)
+	if (dest.payload.actual_len == 5)
 		info->max_read_turnaround = getmaxds->maxrdturn[0] |
 					    ((u32)getmaxds->maxrdturn[1] << 8) |
 					    ((u32)getmaxds->maxrdturn[2] << 16);
@@ -1412,7 +1413,7 @@ static int i3c_master_gethdrcap_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != 1) {
+	if (dest.payload.actual_len != 1) {
 		ret = -EIO;
 		goto out;
 	}
diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 047081c9f064..64735b488726 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -360,6 +360,8 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 		adi_i3c_master_unqueue_xfer(master, xfer);
 
 	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
+	if (!xfer->ret && cmd->rnw)
+		cmd->dests[0].payload.actual_len = cmd->dests[0].payload.len;
 
 	return xfer->ret;
 }
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..6998ffd15f5f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -780,7 +780,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
+	cmd = &xfer->cmds[0];
+	if (!ret)
+		ccc->dests[0].payload.actual_len = cmd->rx_len;
+	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
 
 	return ret;
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 5cfec6761494..803c27983852 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -715,6 +715,8 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 
 	ret = xfer->ret;
 	cmd->err = cdns_i3c_cmd_get_err(&xfer->cmds[0]);
+	if (!ret && cmd->rnw)
+		cmd->dests[0].payload.actual_len = cmd->dests[0].payload.len;
 	cdns_i3c_master_free_xfer(xfer);
 
 	return ret;
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..2b215658e093 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -326,7 +326,7 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 		goto out;
 	for (i = prefixed; i < nxfers; i++) {
 		if (ccc->rnw)
-			ccc->dests[i - prefixed].payload.len =
+			ccc->dests[i - prefixed].payload.actual_len =
 				RESP_DATA_LENGTH(xfer[i].response);
 		switch (RESP_STATUS(xfer[i].response)) {
 		case RESP_SUCCESS:
@@ -343,7 +343,8 @@ static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
 
 	if (ccc->rnw)
 		dev_dbg(&hci->master.dev, "got: %*ph",
-			ccc->dests[0].payload.len, ccc->dests[0].payload.data);
+			ccc->dests[0].payload.actual_len,
+			ccc->dests[0].payload.data);
 
 out:
 	hci_free_xfer(xfer, nxfers);
diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index f39c449922ca..fec614700843 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -805,6 +805,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	ret = xfer->ret;
 	if (ret)
 		ccc->err = I3C_ERROR_M2;
+	else if (ccc->rnw)
+		ccc->dests[0].payload.actual_len = cmd->rx_count;
 
 	return ret;
 }
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e2d99a3ac07d..c92d96e6b4d8 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1706,8 +1706,8 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 		svc_i3c_master_dequeue_xfer(master, xfer);
 	mutex_unlock(&master->lock);
 
-	if (cmd->actual_len != xfer_len)
-		ccc->dests[0].payload.len = cmd->actual_len;
+	if (ccc->rnw)
+		ccc->dests[0].payload.actual_len = cmd->actual_len;
 
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
-- 
2.43.7

