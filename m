Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCE413D69
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825643; cv=fail; b=Wguk7DrOKG9MrN88nIiN4VU5XLaPY+rfY4cDsEmF4FLNE1lY7KyNPyotO/HRLDTPCpH+LavUNmr6I+tuS/ndt5AI6nPj102hQv9xDCvr8uz/7SPrlSrvl843gXYDaAWjyYhCZdAqQ1yaZ60y+/K8c1SIQHOpTLzs63lRVSCxoYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825643; c=relaxed/simple;
	bh=t6lSuE53LqGvZHeAbNkD00QviKNz24by4l2OyDxz5Zk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=geVivW6jIFOeH9N/1yQpy/rDG3mSRQdHvWh6d54BxDgMYiwkClUpQze39IqZY2jJq7c1mWcYSrNl3dnVgTI4WEj5hT/EsYPMBtuV51Bemsngs7mAp1BlrMMzc50RLioXd67lqUX+BXnc+vTxyqwTY6UDKiKlDw+Quizh1mYcFKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=CDp6oF7a; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="CDp6oF7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg9zsDu3xUmwsa8CARwg99lzZ6vzXTN+k4bvVV5F9AS6xCTZ5KyHHZe5/A5CL6/RBeR4C2nmxPU9yvTBcIXFD8fhlS8uBicpMJE9BzqcJLcWcdCNfHFMnMdsmCGlXz5G/cld9Z675CGGYQGhwNe/Zu3TCebl4Gep74IZL5dnZV9TKXaSQFt8OV+BA2INtsBGou5FrGISgclH/4KgVbtVJmCY4v61Vj+gLxkB6UIZjAapR1obNqrX7HuNkK9RbB0VB5uhNt18csjs3/xLRXZQTEotQtCD701zu7rOiI4q9MkL9piN4fCEZ+HuzqwbZ0ehrLeHuvqp1WU4SD8iCBeCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZu/dlukLwr04WR0ku1NKHbGxrRoeiFkYxo2nrN9hqw=;
 b=HCDnzRQiOdERA1J3iqbU0WEES9WW0EY9rU7e29e5flFaS9GmPqcpJZSFvMTtyq3MZQQJzto4av+MBqW5fH4PpDI8PiIrxTuSu9TJ8+gbVhGmnjk6KTmC3mkg+sA9zan4eBMmKoRZUMMhZBdXcf+ImpKq14rct6RtBtbhcMK75xdg/xoiivX8CvST+WL9kJEM6AwlyVIwvOu73loV583VcAiuT5eReXGPWbqIDj8Ml+haYmm7Ou5KMz+ZDXmHyr1BnxLu40VexGMjyW3r82YntXqpNrg8uHBrCmM3H9+5/cph+601NYpTQfBbfE0SLCqBalJEM6yuX0F9HgqeeqqCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZu/dlukLwr04WR0ku1NKHbGxrRoeiFkYxo2nrN9hqw=;
 b=CDp6oF7aBwxq3BgHzSfPLwZRXvo0ZFsoSBFMrsEGeYaCCWHA7BENrlth5E43oMxTQR+tRWzLTRH2yI/U8IR2wG90kOOgTdln5Hsrs0/9kX6V+Txu4SzTWXNT0sVQ4FgeL8MFdCbBOiVvBqV+tM7wWeteRtu9vkBQH/t0pLIDVOw5Vhn88SpudMeq+Y+CptAmBfJ7DSS6hMPzPgbsxX1upeSt2HNkPw5tlarV+5PxL2aMYb8e0YrEgtbFrrCP4DJDQe1TgUzQXMNoz73TzALH6gC2+mf9jZESP0SeL51du4CH+njlHpZnWEMCpjZcKgZHB8MVDk9avZV3c8yzHszAYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by MW4PR03MB6394.namprd03.prod.outlook.com (2603:10b6:303:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:20:34 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:20:34 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length and retry Direct GET once
Date: Tue, 30 Jun 2026 06:20:27 -0700
Message-ID: <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|MW4PR03MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: a18eb7c8-ba1a-47ab-cd82-08ded6aa5de4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|11063799006|56012099006|3023799007|18002099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info:
	asihC0zprGmnN5UPbxpcir15PlrS7KAzGgz6UrExnRm0rNS/0HDpI79QdzeVu0H+M/pskua1MhRO1dnGhUFzEjES2PzuMMVWDKcv7Bilv/JD3sJlRgWkiuNWsxzL2IQ6C49iun4claxxrBDWhPDtflsWmha7QXbxOpX8zM+hwJqOI4BV/hY8gg9IvBREMiD+cUkYHeiguKGVHTC/rplbypIroDT/71x0PdJCmpLQzF0ZQ+oGHU4Y6LAgDltf8Gz9GM20NuEFdaATldktGL1oGMKoIBiICiqQR/Fkl9Op0HDESoQrpfODylRLC2meR0Pk9NShWmlt7g2hyL/JE/cy8IwbseXqCAbb4W6FiFAoMForSoWGsq+xFz6k+D2y/iGheof88TVedQD1ikVu5q6BZUy5ACiwh9iWbwCliWD7hBWeMp9C7tGMkBSShp4n5NivqROyk7oqz528U9H2X8qgMmu13fe6hD5ilTPaKEUph8NOPMHeJ1TKNM+NSKf1TZDSYSB4kFiBX/RLWlW7cO1TRfwRWHHhMRRpmVoIHEm1QuONa7Xdi01/bz1oJH+ed0KyVVIsJO4G90GuZhzT61bZm7BDeRDGpGIyPh/rtT5bylRFUjA7xIUz+XyKwsda/gobwxRT4orlQODZRfSYNdALBK/ML0yObOT5jaduECCOHl6Kpc9nbN+Jo0vZH0szqLIlc2rkPUWFPH5P6janZdLOUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4HfPuM0SNc7NQIm5RhCnc9cS0vVWKnqNQACLLh8UfYV1HCBmlph+BGByKxu?=
 =?us-ascii?Q?9gmjOZXQUHY8zA8lPcZQF3w6hYnSpFoj6qlcDvyH0RCwlmgg19CwZ83WbQRv?=
 =?us-ascii?Q?IvPJIwEkPL/ZPK1ek4Wp+SUmCvwgqK1lEcc7/r6JZ9gOXgiFpCE5LI9On5iO?=
 =?us-ascii?Q?8drcId16e96aHVcf16Cn73iRp8omJ8Wqg6oPw+ydb9EF17mpMZooJmZQipAX?=
 =?us-ascii?Q?z/MsY1kSpLDMci/P83rjtCN9FtyGRBcX+FwNn/Avjuh8CZreP7oyuGil6tw8?=
 =?us-ascii?Q?0XLWgoPAZCNBfS35UU+ffcN+GZigqob/b5gH8cHO+iGf36clBFg/W3DAAVas?=
 =?us-ascii?Q?+3nxcM18lF8w0B2z3WJlDVtog8ljeAJrciqgXLWS7Vdbn2uNIwazTINDuhpQ?=
 =?us-ascii?Q?N2Lvvp+F3JHVNOj2ril2MwM40igObwe6tNJOSzOQLXSGUS9ohwpjopvAFt59?=
 =?us-ascii?Q?s0u8K66VD3OjsxFTSxPGzGu4ZjcUuHMuCryUcEBFyhZvK/TrKg8rmdLSYp/q?=
 =?us-ascii?Q?mWtENilMMVVfc5y2zKz0I3Bgm4+CVajK6/JK2qA73lVbsuN+pgta8VKbK60e?=
 =?us-ascii?Q?cTxtjAGUoPwk5I3zwSSKhN6AYIVN4EFvhU6nUlmKuHUYtIzzgAX7tAYKTAxe?=
 =?us-ascii?Q?x5OnXPUkmb+lwQIhh4hEsSJcXM3n+GLWy1doNLyOmF4neJcjhh3ZmBLtX0KU?=
 =?us-ascii?Q?RzY7L4G6Y1cCfIzt4b+1E/H/3tRPqotqVmnDcoAiEK7Hi0mW8otYBQlOGxQe?=
 =?us-ascii?Q?9u1SiOXvuGnCS1E4P4Q3TKS09oMiV2eUxi+AsZ0zvDmA/S5eyWAO64Mdb2D9?=
 =?us-ascii?Q?mC4P1O2eDX9cfGVhd3xp24oopM1xaEMyWFmBwdqA/0ypuEUnsZbWz604xSbr?=
 =?us-ascii?Q?b4yk7EngJr02KR72dySeseaT2xRfwvws/wSUOcRJcLe5cNvn5bygzNVj1OZc?=
 =?us-ascii?Q?9e0k2ox1WbCqh+twoFvOalfDUPOVSSuWnGY4I4DqnL0E8PNooCzlw0d6aqtS?=
 =?us-ascii?Q?lW7OAA6OOW3wXOb7nzorjRkiw6ImPUw/spmCEuScrjUsKGHfinnw0czfogAU?=
 =?us-ascii?Q?trJocanNxC+jY84U9fW7IzWytOO8TccVHxQayeu5GceLUONPA8s0DhdZWovM?=
 =?us-ascii?Q?Nr3nA55BHL1Hf0Vlu4RcDlX3MitgTvj1X0qIcGU6DU9J9Mh8i9Hppd8T0VFA?=
 =?us-ascii?Q?8wp9VgVGzNjzxptbk5ORzZ+5y6FF+l1W7CftalLXcaHJJ6bJqX6LMFhulfDP?=
 =?us-ascii?Q?uIu8NZtclnkf0SDNAQT4bRwDL01g85oFCgEQrZtvdoo87USDmKbkwnR2C9xC?=
 =?us-ascii?Q?AVoaVb1hgNxdA3lOgIOtzDE/D2W7GGywdx3edBdUvmdYuRB0X48wi8l9D8Jo?=
 =?us-ascii?Q?WlW3tcA7VqZqa9ox5X+YUnKoqj7B+dEtKIM1FD3yRyBGCkzZQryGMPrBt5ek?=
 =?us-ascii?Q?jQhvylk/Xnpp2WmnfPNOvrEnt9+zKtJXdTqZUQC+sObyVq3dK6j9GdQsadHZ?=
 =?us-ascii?Q?ZhEo6AiylId94mbVd/YFDFvj/1upX79VY26BWf5NYnvzVJbW6nV4y68CAn+4?=
 =?us-ascii?Q?4a3SnN1VdPZ/ktPptHP421EOB6zL67vSCh1zWmtV1XcLAniGJhXzXXzeE0ko?=
 =?us-ascii?Q?XUuxmYcWH4IjGKjEgPsMDKP2/Fd91C4Dj+ZCu+x9eKiPRbCUfQ0zkFggWYK1?=
 =?us-ascii?Q?hgfaFbcP/LC0Zi4mz4vuv7uT8sx050abwg0e6SOAkmO+QrASCHd++3zT5ugl?=
 =?us-ascii?Q?wZzrBHxq4Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18eb7c8-ba1a-47ab-cd82-08ded6aa5de4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:20:34.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgFPpwASV1aGP39BviwurDemPt2fh8sk42FD8x3cHA8MsCEe79kFLPTU6FUfi4tJmWmzbZMrbCVdJyfXVr39ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6394

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
at the call site.

Validate GET payload length in i3c_master_send_ccc_cmd_locked() using
actual_len and optional_bytes. Retry failed Direct GET CCCs up to
cmd->retries times (default I3C_CCC_RETRIES) on any error; SET CCCs are
not retried by default.

Add i3c_ccc_cmd_init_retries() and set actual_len in I3C master drivers
on successful GET transfers.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master.c                   | 92 ++++++++++++++++++++++----
 drivers/i3c/master/adi-i3c-master.c    |  2 +
 drivers/i3c/master/i3c-master-cdns.c   |  2 +
 drivers/i3c/master/mipi-i3c-hci/core.c |  5 +-
 drivers/i3c/master/renesas-i3c.c       |  2 +
 drivers/i3c/master/svc-i3c-master.c    |  4 +-
 include/linux/i3c/ccc.h                |  7 ++
 7 files changed, 98 insertions(+), 16 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5cd4e5da2233..29dc0793a5a4 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -901,6 +901,8 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
 {
 	dest->addr = addr;
 	dest->payload.len = payloadlen;
+	dest->payload.actual_len = 0;
+	dest->payload.optional_bytes = 0;
 	if (payloadlen)
 		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
 	else
@@ -914,17 +916,55 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
 	kfree(dest->payload.data);
 }
 
-static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
-			     struct i3c_ccc_cmd_dest *dests,
-			     unsigned int ndests)
+static void i3c_ccc_cmd_init_retries(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
+				     struct i3c_ccc_cmd_dest *dests,
+				     unsigned int ndests, unsigned int retries)
 {
 	cmd->rnw = rnw ? 1 : 0;
 	cmd->id = id;
 	cmd->dests = dests;
 	cmd->ndests = ndests;
+	cmd->retries = retries;
 	cmd->err = I3C_ERROR_UNKNOWN;
 }
 
+static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
+			     struct i3c_ccc_cmd_dest *dests,
+			     unsigned int ndests)
+{
+	i3c_ccc_cmd_init_retries(cmd, rnw, id, dests, ndests,
+				 rnw ? I3C_CCC_RETRIES : 0);
+}
+
+static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
+{
+	unsigned int i;
+
+	if (!cmd->rnw)
+		return 0;
+
+	for (i = 0; i < cmd->ndests; i++) {
+		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
+		u16 min_len;
+
+		if (p->optional_bytes > p->len)
+			return -EINVAL;
+
+		if (p->actual_len > p->len)
+			return -EIO;
+
+		if (!p->len)
+			continue;
+
+		min_len = p->len - p->optional_bytes;
+		if (p->actual_len < min_len ||
+		    (!p->optional_bytes && p->actual_len != p->len))
+			return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
  * @master: master used to send frames on the bus
@@ -936,6 +976,9 @@ static void i3c_ccc_cmd_init(struct i3c_ccc_cmd *cmd, bool rnw, u8 id,
 static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 					  struct i3c_ccc_cmd *cmd)
 {
+	unsigned int attempt, max_attempts;
+	int ret;
+
 	if (!cmd || !master)
 		return -EINVAL;
 
@@ -953,7 +996,24 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	    !master->ops->supports_ccc_cmd(master, cmd))
 		return -EOPNOTSUPP;
 
-	return master->ops->send_ccc_cmd(master, cmd);
+	max_attempts = cmd->retries + 1;
+	ret = -EIO;
+	for (attempt = 0; attempt < max_attempts; attempt++) {
+		unsigned int i;
+
+		if (cmd->rnw)
+			for (i = 0; i < cmd->ndests; i++)
+				cmd->dests[i].payload.actual_len = 0;
+
+		cmd->err = I3C_ERROR_UNKNOWN;
+		ret = master->ops->send_ccc_cmd(master, cmd);
+		if (!ret && cmd->rnw)
+			ret = i3c_ccc_validate_payload_len(cmd);
+		if (!ret && cmd->err == I3C_ERROR_UNKNOWN)
+			break;
+	}
+
+	return ret;
 }
 
 static struct i2c_dev_desc *
@@ -1291,10 +1351,14 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 		return -ENOMEM;
 
 	/*
-	 * When the device does not have IBI payload GETMRL only returns 2
-	 * bytes of data.
+	 * GETMRL returns 2 bytes (max read length) when the device does not
+	 * advertise IBI payload, or 2 or 3 bytes when it does (the optional
+	 * third byte is max IBI length). Use optional_bytes to allow either
+	 * length when IBI payload is supported.
 	 */
-	if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
+	if (info->bcr & I3C_BCR_IBI_PAYLOAD)
+		dest.payload.optional_bytes = 1;
+	else
 		dest.payload.len -= 1;
 
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMRL, &dest, 1);
@@ -1302,7 +1366,7 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	switch (dest.payload.len) {
+	switch (dest.payload.actual_len) {
 	case 3:
 		info->max_ibi_len = mrl->ibi_len;
 		fallthrough;
@@ -1337,7 +1401,7 @@ static int i3c_master_getmwl_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != sizeof(*mwl)) {
+	if (dest.payload.actual_len != sizeof(*mwl)) {
 		ret = -EIO;
 		goto out;
 	}
@@ -1363,6 +1427,8 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 	if (!getmaxds)
 		return -ENOMEM;
 
+	dest.payload.optional_bytes = 3;
+
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	if (ret) {
@@ -1371,19 +1437,21 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 		 * while expecting shorter length from this CCC command.
 		 */
 		dest.payload.len -= 3;
+		dest.payload.optional_bytes = 0;
+		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 		if (ret)
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
@@ -1412,7 +1480,7 @@ static int i3c_master_gethdrcap_locked(struct i3c_master_controller *master,
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
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index d8052949e57e..c8af5db63f7b 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -340,16 +340,20 @@ struct i3c_ccc_getxtime {
 	u8 inaccuracy;
 } __packed;
 
+#define I3C_CCC_RETRIES	1
+
 /**
  * struct i3c_ccc_cmd_payload - CCC payload
  *
  * @len: requested payload length
  * @actual_len: number of bytes received on a GET CCC (filled by the driver)
+ * @optional_bytes: GET CCCs may return up to this many fewer bytes than @len
  * @data: payload data. This buffer must be DMA-able
  */
 struct i3c_ccc_cmd_payload {
 	u16 len;
 	u16 actual_len;
+	u16 optional_bytes;
 	void *data;
 };
 
@@ -374,12 +378,15 @@ struct i3c_ccc_cmd_dest {
  * @ndests: number of destinations. Should always be one for broadcast commands
  * @dests: array of destinations and associated payload for this CCC. Most of
  *	   the time, only one destination is provided
+ * @retries: number of times to retry a failed Direct GET CCC (see
+ *	     &I3C_CCC_RETRIES)
  * @err: I3C error code
  */
 struct i3c_ccc_cmd {
 	u8 rnw;
 	u8 id;
 	unsigned int ndests;
+	unsigned int retries;
 	struct i3c_ccc_cmd_dest *dests;
 	enum i3c_error_code err;
 };
-- 
2.43.7

