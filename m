Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EFA3E7BBC
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495110; cv=fail; b=HzciafJWex8C3GIGfzeP7EolRzERwNLHLSMLMaUzn7ssJRKeUsS0QldNz3yI/oKQMp3jdz1fL8hh2B0BuhUer9kjmqm12EUrW1R+hAJFFnScOXoPov/8tXFCoVwo94OALQmXtTMrMPLXN5cWj5xILYzxu3jeLepC1P+W2Mf47EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495110; c=relaxed/simple;
	bh=zdfLV9FD+eQjSXybjDXjpSFlqY7W7UrHTxGBc4Ns2V0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VuDDR7aClyxbS4fIGGiOAWoa5aCrwfHcvnWWYrR5vAYPbQ7HFVfD0cDcYHZqBws2pf/+populOLj7bdY9sY68qGg5vblnT3HMlAtHCIUkRusEQb7aVzK+wTuOKjKKBpF17c7sdbHmhghnOwTBnK0n+AOVNJfqgceYnNQDQ22/tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=m7IXD75s; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="m7IXD75s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/KvGA7T8wgfMDEZUjHqLX+UrAzPuUhznPFQizyaj3fEa6OnVQnSswnKshuXX+NNLjBgXy4igzMeOsCPlkAp1sdqkzNlwzpoaAxPG20eje4swgGp3pTcNLadRe2M1a6DuI2ydV1NLohrLzOpwNMGoIFtysUQ45OaORMt4yte3mTOeWg+FeGWyWTPvPQ+39nceGnKEEz1TtKuES+RykpOmy0kyecvRtGO8/N9VAxGZErqZO54/5bBuFBRNscjOZSbTYxwuDG6pYOiMuKAeyPgvHfx4Bt+X4W8KiZoFBQ1ifaBXC856UUVUXomK9AyNMDoH45FRDm75dopiAT1y+zNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzE/Bx3G+O/qq2xg7TAO2PvVLnVMaCB6+y6I1Ki/gvY=;
 b=eWoOe29Gvccnppr2bC9GfmmBMFY35J2etu8OGD+eJ9zAj/9jI5AB2Rp41HCynZ60UChd9amR8HoNZyQHAFGJf1vwELw2ZS6GiWTTMlxpoKSMs1tRh1xv1+uyprXuT40pU4AAlerniGMV/GsGFFXBSuqnwDdsu8+ZFcmQw3fFptCrkIoxP63tkhUV1F0Yxuaq5GinOEhWdI2kwzPvIrMkCiI87Cllw9Stps1+Goxp4J5+CQPYMk0DrZjs5KamS8tr8R/kl40MIZI0PsLDWXFCEGfXwU/Ox0ZZlHIB7jrDTXGK6Nb38zAio9r2m8aYMLUxTVe7FKVn6BqRN1S2NlDzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzE/Bx3G+O/qq2xg7TAO2PvVLnVMaCB6+y6I1Ki/gvY=;
 b=m7IXD75sGnoyaKIEb9/T+WVjfJhXGJmBm2/42+WbwJyrXjE9+7OB20PaC72Xe2WInTyBRGCIKPnr+gqQyueZop93tsXWMUBQ2dVKGlbxEDmQHIbgRU8QwsQ6VFSsj9gOCX5hTTG/TonVcbUzdDZi9JIzBGcQ24WXYla2/kK7EUXwJvyP1/Ep0z85mTcQfEzgNlNgUknJFYFC8Qlaam3GCuZGYwoT3PwPqUc0/WDKzpbUKqMjCiIj91CMf4BYhMM1mpnveBNWXznUd1gI3OsdgmyhjabXo5Dj1P6W7J/H5ubYs02WGn7pD+YAQAr2mUz8nQCopDOd6GStcsH1Wx5H2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:49 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:49 +0000
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
Subject: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload length on success
Date: Wed,  8 Jul 2026 00:17:38 -0700
Message-ID: <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 0975c253-f434-43e5-31f1-08dedcc1040f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0kvDumGcQBO4k1SyQuJj7WoQqSISzzNXxwqvDtCN1ZfFt4hI5J2IzoZkFAVb/p+JlUOFWBH8eg+GCH1OEYKEqMr+gcn8wyvq3HAyHsKU3vwlBSfR3i/pR67SEj83Is9TrkxZA9k2IXlGY1Fap2EHqgHnhlGgwuDbKK1U1WPaqvIZ63tWd59xmZg2fHWOd+UJC4mKelusbEKCFWWLitsNrvUKJlY6Dli22Sredfke4ONZ/sXHRR2ChM5bmMW/XeCSJA9hS0Kmmimmr7tqZX6jii9ObWswHAWdZcZ499+6bbQ7NM/ZhEX8Y8D0CtP5jLBYP0zSaTaOW89yWv+lbtnQd4t/iJ8P3trHodC9xefkZ5ze1oMc3mPq+YKEfb2h7fuATZT48fjXdqIqgDQnk9ddunaP+8grqRW2oP6JaQcxx3LITHHEOPdFa8zP/ErIlCBp/CXNU3nIrqm386wFX14wdNGqt4w4Io4kY4AmhQCbpDd/eTSHHRJ7mgCujEt0g+PsnrZHVcLzA4xvGvLbcUL6KqEezaRZF3Q+RLRiRL799V2ZRd5VQMLkNo2HmhJIMHn/JiDKj65soaG8WzgUxeWXmGDnOw6o32vGe1GmQqRoG7l21ShJPKC5b/3X0IZab/ldvEGnFI2tB2gjSnAyCAgLm/RCsUenT011KOfNyMdXo5KrM7Is4ZAU+pDTu4+Ck8rkitxXs/1esBwJTXbfiE0XJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J4g5BRUtnT1hkB5WV7BZVANkQFxMYjyrLwTzxx1WDRXJgnpXTGTbQsbXTLlj?=
 =?us-ascii?Q?87bHpW8hbqNrN3uvvSLcPR8G84d8rPjH0U0dgxmZFuEULvjDjAaZn/Lm4UbP?=
 =?us-ascii?Q?e/+DG4yhfwvInJt00XXp7MMjmFe5r2cRHaemLaQNavpLbE8YVTjeg1zutpYH?=
 =?us-ascii?Q?v12DRvtp7BKK1Rlpp9RrbbAKTo1QjxIifC0PSB1b4gnzgCOAkbEvdfpmLEuh?=
 =?us-ascii?Q?RNdTauSpMuKt2zKQU8QOP8/JDpbfygxaMvpTFfqBnx1rgzpwuDHh/Dpmj7uY?=
 =?us-ascii?Q?h+PfVfsjxBD1Q+r0oUzsYs/tsIP5aUTOfTmfeCMIVjIVRd189i7gfxatkELw?=
 =?us-ascii?Q?0dWNzNEsvXU5fTpMSALRH7+b9A2kcBaBTjI5rFxfkmjEUG2ySLwZPX8imMZz?=
 =?us-ascii?Q?gr2Q+r6xtupRxUhgM4kz3BQGQy6x6uaFvahQ9kGNh82xckwsmOYjikz1r7nQ?=
 =?us-ascii?Q?zAKZyryh2dKmlXoITmDoxrdeF2s1nUJCvgiZhZ5GCI/sfgXYOYd7jW50kVVX?=
 =?us-ascii?Q?FYltP9ZwScwPEA1T4lZu0f3bKninKtQaCqriUhFhEvnecSQ7deAd8fzyr2C9?=
 =?us-ascii?Q?4R6ZVcwzgcay4jmupdfeX+2SIGZkrRgu9AnmaP+KKGvPlMvXEg/acey0VylI?=
 =?us-ascii?Q?+WVO6Pc5u+BEhI7OXX357VFh+VFo2QCVgEaYwDV2JI7fU6tDODZZQL1M/7V7?=
 =?us-ascii?Q?BQ29KGftt/mYeEQ7V8MqmIG9NfRsQzwKAaBc7d8ijJCryxVz3Im7oEePkFPc?=
 =?us-ascii?Q?RgEfU0+gHEgw4kbqzH70BzlsdO7Fg6u+SBPOa+lSP2LqlbgiwJFWAvWWOFqW?=
 =?us-ascii?Q?lIN7kch8Yqvw00zQFCGFfRjIGdVXHcKQs+RaM8lR4t6TOiOHoNpkROr1U4fM?=
 =?us-ascii?Q?TiIIxCV8q21DEb+rVkbCDbScehMNVXIA8nxTlYsb+HJ9P3Qluv9V4VE6JID/?=
 =?us-ascii?Q?g7J7CePa90AofRSeatecsSEgCKtZOK+ExF0n2GSqaYK8FIwS4fiWI7/65MKe?=
 =?us-ascii?Q?IdmUGKUj/sR3f/s3ZuPBYC7XSVEAiVv5g6XuKENm2m+l74bpUW3gjl7nYpZz?=
 =?us-ascii?Q?OZYrtwc3qOc4ORNyBwu2EtuHKmbxDp+VTnHQfBoFKgCiEGudRz978MZPx8Us?=
 =?us-ascii?Q?5lkSTh92tn32dq6YdUM9X2+C8hyy7sw3v+CsuYined5xEPkUzD3OFKeiJa7D?=
 =?us-ascii?Q?bGXTQ4+O48fUmeLOgi4Qc1TCG0WTrJx7xj/vL2On4+eOfuByIE98H+pD2VV+?=
 =?us-ascii?Q?H9GgpLkjy7fv5xu4fEu4J0Q2PAYcmKRsNLtTviLyMvkqHtUY4y66QfCU5XiI?=
 =?us-ascii?Q?NX+RVc4a/qEcGlWxQU5WV2vMgn5iAKiTPysgZbiRxAGh/Z7Y0ULr8ebSY9iS?=
 =?us-ascii?Q?wfMZRZVtyvSsa2JEU22nIPmqUhwq4/SRGPWYBkjC3V95bxv3nKwBY8fGrTTe?=
 =?us-ascii?Q?d1Cmj/UMVYVCfaJMbt2l/17JKjf/0yfSfOKkrogHk8FlbmrTPS8sPPJ62Wfz?=
 =?us-ascii?Q?y7ZLpA4yy/DOpiAqV6x+KP1vb0gpq0VOezbwmFJnPinAEpSllvTdOicj11/b?=
 =?us-ascii?Q?dlzAzpxwl0RMqSp2kLDPs4kGLPPsnjDufi1KGawM5aKYcAfC2Z5dqUQJyv4a?=
 =?us-ascii?Q?Fds5xonlj4ZFbvODtNzpcMgNoIVj2VcPbbMGsbBOyyWrERVYusgKmuEllgwT?=
 =?us-ascii?Q?7kEFpCRixpKGQpnciTapUhMGXHscsLZuJZjXRXVej6Kk52wG3gF9WB2ueDCM?=
 =?us-ascii?Q?6vM+erF/bA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0975c253-f434-43e5-31f1-08dedcc1040f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:48.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkQ+pcJn55ic37UVYoAr94814snGK1zq4kOubJvP5cdfCvEitK2gm5QvCg3HI/uT8/JBmoRg4zJl7o9GSmnObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Set dests[].payload.actual_len on successful GET CCC transfers in I3C
master drivers so the core can distinguish requested and received
buffer lengths. Switch core GET helpers to use actual_len instead of
len when interpreting GET CCC results.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v6:
- Fix ADI and Cadence GET actual_len: store hardware-reported xfer bytes
  in cmd->rx_len and set actual_len from that, not from payload.len.
- Fix Renesas GET actual_len: drain the response FIFO at rx_buf + rx_count
  in resp_isr, clamp rx_count to data_len before subtracting (avoids
  unsigned underflow when rx_isr reads round up to 32-bit words), and
  report actual_len from cmd->rx_count.

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
 drivers/i3c/master/adi-i3c-master.c    |  3 +++
 drivers/i3c/master/dw-i3c-master.c     |  5 ++++-
 drivers/i3c/master/i3c-master-cdns.c   |  3 +++
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +++--
 drivers/i3c/master/renesas-i3c.c       | 16 ++++++++++++----
 drivers/i3c/master/svc-i3c-master.c    |  4 ++--
 7 files changed, 33 insertions(+), 14 deletions(-)

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
index 047081c9f064..b5ab2e4e5d57 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -246,6 +246,7 @@ static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
 		if (cmd->cmd0 & REG_CMD_FIFO_0_RNW) {
 			rx_len = min_t(u32, REG_CMDR_FIFO_XFER_BYTES(cmdr), cmd->rx_len);
 			adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
+			cmd->rx_len = rx_len;
 		}
 		cmd->error = REG_CMDR_FIFO_ERROR(cmdr);
 	}
@@ -360,6 +361,8 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 		adi_i3c_master_unqueue_xfer(master, xfer);
 
 	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
+	if (!xfer->ret && cmd->rnw)
+		cmd->dests[0].payload.actual_len = ccmd->rx_len;
 
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
index 5cfec6761494..cd6adbcecc26 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -574,6 +574,7 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
 		cmd = &xfer->cmds[CMDR_CMDID(cmdr)];
 		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
 		cdns_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
+		cmd->rx_len = rx_len;
 		cmd->error = CMDR_ERROR(cmdr);
 	}
 
@@ -715,6 +716,8 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 
 	ret = xfer->ret;
 	cmd->err = cdns_i3c_cmd_get_err(&xfer->cmds[0]);
+	if (!ret && cmd->rnw)
+		cmd->dests[0].payload.actual_len = ccmd->rx_len;
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
index f39c449922ca..25a2b2ed618e 100644
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
@@ -1072,10 +1074,16 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, void *data)
 			break;
 		case I3C_INTERNAL_STATE_CONTROLLER_READ:
 		case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ:
-			if (NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) && !cmd->err)
-				bytes_remaining = data_len - cmd->rx_count;
-
-			i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
+			if (!cmd->err) {
+				u32 rx_count = min(cmd->rx_count, data_len);
+
+				bytes_remaining = data_len - rx_count;
+				if (bytes_remaining)
+					i3c_readl_fifo(i3c->regs + NTDTBP0,
+						       cmd->rx_buf + rx_count,
+						       bytes_remaining);
+				cmd->rx_count = data_len;
+			}
 			renesas_clear_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
 			break;
 		default:
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

