Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB13C3459
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075900; cv=fail; b=BFwzSXSuZmtwR1GX76vYd69C9konV9TCRG9k9V612JehIvDlmnLj/YVS8oTPxJ2n7btdK7xsWv+m9a+klutgbt9WEGH9b8VE25XlB5Yfy+bZukULX7bjVVFDTKLFNfDnq7swiVAz1nz1eFPbmkfwVi8CJGj++kXHHjWfkhuYVCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075900; c=relaxed/simple;
	bh=tdOsp2fiImJUFtr+Ms2yerJ//BShVjpc6L2wxV4TdX0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIhHpJcCe8ThAMAFdxzXc/O/uF8NptIJDxAckeUNalNd+nd0r0fVLeahOHLjZUwJoXr1Q0fr01n3cfsUj2bXvIt1DuBxri2B8sj8gO+/+PJlKbMyQQ/7Aq9hf9R6BjROqikaTSsqikjZhxOO/RlkF37ihxCztYtjKjCHfDvPoZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VKroglTw; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VKroglTw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL7HwDx4QA7v19RylxjENAX4pXpVj2nKU5iOVwSs8IYGXDITHgiFlP8/ZOAo+C/Ksvx/vo2hLhmD8SxaQ8t+G2sbQdcjVf+2cRo8XisQQXCVnDQa4iTLyonKNECpi5WCd1eIlNvDHb94qVPvCSHtCNqkOCO66nP94lh41CBhVT1twy1cS9kslk0QiJdtl5WWP70ahCrZAHVGtOcAxXOpjWqve5Z5RpLiWB3KVj1OQuoby7jUpZzOj3JDFL/ZUV1wf3wGvrXeq9SPGtVy0nGsd8vZLulCKNaRZUruTZTfkURuDh2+U+e4FZr8Q4Z+txXL/+HKA7/vN7QdG83R+1UFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v29QzvaliuZXfJVwAgQqkSX2B1Xc9FGXZNdhm8wX9L8=;
 b=T0tHw/Ihm8D0OtmLSlhQT318itZVH6EjHKORY5TjR41I8obbq8JphFx8T/MYT6o4rvqXM756dYJ8qiSrAbA4xB5eT3Hz9Lr3y5ykRyiiUNN+i3cjHsZE3YVwzqj2omDicDET+99HaCalqDbPPecCOg8tvB4pCZ7TVvvIZ+JGcVg1QFpvDz/bb1TLEQTOwAHzAYCf182DWs7lRA7mrdtTjuIvPX9Vb5jXMUIHYlO0G3T2pRtNS+I5IT3vypvdUnWwYslgu4eE+fcd8VD5vO417pDzvYJqteU/c+VbmiZSlTaS8zhXhrQ4ut1vmpC0gMIsCrF/bB9hze5Yqp2XBWrqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v29QzvaliuZXfJVwAgQqkSX2B1Xc9FGXZNdhm8wX9L8=;
 b=VKroglTwkqUdgSjgaVBWxAr1CeibPusrjDGZT2/kaGbtnbzQgsFzwmyjOqqZmjitn2GN6aZzuNI/XiXcSc8cPOr08umdWCehoU8pBwmt/57DB0rxdqzakOdsuu3pBHwW0QnKhLDKfkMMm37g0mmwt89TB9EyfZpr5IlXKTc73KJB8OubSKTuluK+GUVF0iPZY02YCNP3BvTdoMQ/FLJg0f2FmWfKEDb28i75V9RRwo2EqdsixvdAGAS3RovZHSPFkckth39z/VKbinIOiwyBpVp91tXf6qy+UGXRAr3tOENKAQnWgpR82UdnfwCj08dRtNL2C0rgWdVw99RUDlfALg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:29 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:29 +0000
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
Subject: [PATCH v5 5/5] i3c: master: Add optional_bytes for variable-length GET CCC validation
Date: Fri,  3 Jul 2026 03:51:17 -0700
Message-ID: <2b41e1435c339dcc67abb71f335fd611fe6d5fbf.1783074850.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 264d2bc2-751c-4efe-04d9-08ded8f10740
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	bfVLdwUQEvl+ha7wRF/cUKTCDbSdotqI8pd/4OHzR4s9WxJ5ESEtB4z2pev490Bo+m9nx1zEAfiBl31gQSJz7wLb3057ZEbPY5+5g2cKIvXZSxuWocrWB6bRCV/prmMlf2eYydcv8xW3PeDKg1YyC4og393gs6vlsX1vH4iiJpAshj/cIHy7bfsk76+gK8nRzth2K59+ptTXQgdap27PH1pBIZ8p5/UxtlJgqmfyJVnk19/uC61ykYDt+obKpuGTjTNL1ZcvFCjPSGjN4NsipxjhPGQ0maVcWjFVnQMfDzau+WTdfirfnEcGW9y8Qr3UAzc07PUTXE3ULLdgnDzR9/wpOivwW7qTZqUTeAwAiY9bB4FChCrRK8iJ8hV3+rAeWmjT9Pd+7zZAI5nIjxfDqW0kzb3fCGIkjVD1EscN/W+LK4AYb8iz2jnNalbaUVsgYdXEbvlVz2EFf8AhI6je9p2m77DMDlJCjXh772/Ywe0UubOyVMyLsk5vdxY0uhW3I3ky/jgpauKtlhTESmKAGEA2yqy9/x9F27ussMEKRHLEtZbnhSgyDgNwaJl/nNN16O/hl8gS/WRpZDBeCsl0xnXA3OFX6b0N+HjUm9sqyJ0Dm1AaevQWCsh0F5l9Ro0VsbbLxmqynK3fWkxtA2coBm34ff6EGiQmux4oHNAK2KzSkXeyTNYa5r4Q04DBL5rXlMnrg28G17VvoxFV5V7vQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r7k5InB/2Gv24dYFdBj9zdhU0NwhollD9bga9uQ6UeWtuoa3707vb8H05CEo?=
 =?us-ascii?Q?LeI608dUnLHKFa096zC5Ltk8hQFITDRU/4F4qBn+uVn3T0gvU/1mq1u6rzVT?=
 =?us-ascii?Q?eXR9qE2TWAOA93qPLcZDbHcdhypwF25lAmBeR/OQNFYLoQ+LuPhrm7lTQuBZ?=
 =?us-ascii?Q?dbSzItZI+M5Q4CwwYfhvrsk4z3RKzZ+hR0gFBAxA2zxDcMrJRtrT6N3wc20j?=
 =?us-ascii?Q?scCBUImKXeRbAeDjsvAHEdJb6nQmzMFeobI6YXjZT9Lo62V04kh6TwHtIJ4c?=
 =?us-ascii?Q?1nLT2yVf8NaLNoMy3f90KoNJ9GZGc5DqyaQZvh15a2wDFdy4fN/GTfI0YHuC?=
 =?us-ascii?Q?dPuer7Ejtve32s5gVa7PZcGTzuWeuP4Nj6pDR3tgxddnVJDra7HS9kS2bso7?=
 =?us-ascii?Q?GfnZuJIBMvg8eIeGCkjmkMaeTkiNHkSna38cKTv/0/gYR4rZgcjgB3E2BVpe?=
 =?us-ascii?Q?tVD6FTSut04NQUhLaz4YUYoK3ze+BYqu5hbwACNl33P0vIyvroloypUHRw+G?=
 =?us-ascii?Q?a7cGGzX9bqQNGqhmTzzs4qJEEUmngpvIuAL+50CiKHHE8ZtluNr8lk4WdN/p?=
 =?us-ascii?Q?QuTIVo+EulGfedlsU6hKCGCBw8XWAMb+36C/v7qCCgKBaEEOxN1zSDFmMotI?=
 =?us-ascii?Q?9CyiEEfsQmwWGwcYDyzLFUQD9bZPJ7Y1qd2Ytit5M1MVsLN4R/fDUAYBfkSN?=
 =?us-ascii?Q?xObBXDoscHowmT3b2yGTLiZOcolGsAVObcdZ5SVPMVv0T0lBka3FkphQfZEa?=
 =?us-ascii?Q?k/wtNcuaQdyJu1PXRLJNnrVYjkHMh4nFEQ4Z8fbuxg4I6CK/bBF/RtY276K9?=
 =?us-ascii?Q?UaVxDkQVC82bLHOJHH5M5fKfv1FtT/2nyquaMC9pAlnClb340wdLUDenJNp4?=
 =?us-ascii?Q?uNAjbeSwv7CaCMjJOaenQXZD4yvNwpGgtDrpGL564bbwTsapxd/7mWhEga4s?=
 =?us-ascii?Q?ALg73iEp5WoI3hOlHV+0E+Dta/11bs3Cn5BIgk7Wmmtkxwpp53kzBeZX6sNZ?=
 =?us-ascii?Q?5Cto1/uv8+N066Kqcuwp0QYxoS1eAlR2E5Q8sA2W58TfwTkAvwB30Q1h+ond?=
 =?us-ascii?Q?36M2KXhPMZPuY1hBA7KTFpY6xLHuyVzoLnIqNq4hOfGWD9Zg9iY04mEqkSZl?=
 =?us-ascii?Q?7xdxVDMkHUK94pKhbqKBZdn8djgaqbGkXikJt8HYF28PRybDnYfQcgeGPBl6?=
 =?us-ascii?Q?NFnHqqK1icQjlQDp/+JP6F/1e9eXmdblPTHv7Emf1ZUJICIWdUbbiVwwycpg?=
 =?us-ascii?Q?UwdqZGFYo8Gc4meMC7In0LmuAJG8g9RKCj/mrE1yWO48x2YZEuhFs7wtXiRp?=
 =?us-ascii?Q?8/Zoyd9JG3zYKqtp4uRRVhc725Y+ZXzLHwU6GHkqsILNArDlXIFzfbOQvNbF?=
 =?us-ascii?Q?PZ33kOZ4rDf9ycZ1ct5AwqJq0m0/8xPBxomWSmEbw1CDBkw29SHlQxE77gVq?=
 =?us-ascii?Q?RuD5ezLr2EJsziQ/sP+fUbGWufNEOTlM44S4riwxAxIsQxoITyo3Q9cx0vwu?=
 =?us-ascii?Q?WhlAtGm9NmB+nIt/gbsk3pE0WBm184EMZK8hkKqZztTQT3KEFryua5iYhnz7?=
 =?us-ascii?Q?8IslFbS7lVd/Gk5UTpXT2Nt9q7FvqF09SbuYzw/dpS0eBT5AMtZdW7ZVQcxI?=
 =?us-ascii?Q?M2HLJnaEik6EHId+8/RChH7J5S4PpYKQCLBaj2XvelSroCeNhwQAgROOFrJQ?=
 =?us-ascii?Q?Nf84QowW63dPCs5PsFeHGSoxS6s7D2cKzZL8MFjIzbkWQrqtSaSBqK5fWQ+b?=
 =?us-ascii?Q?UHFTqDIpiQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264d2bc2-751c-4efe-04d9-08ded8f10740
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:25.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQ54nWyW8vqgNn72GqoftGZuWvWOnhngLcpbQBYzgIe0JzUlMdACy2EIEp16uzQoz/6o3SLE+VtxzVYEqJUg+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
at the call site. Extend i3c_ccc_validate_payload_len() to honour it.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Split from v4 patch 3/3: optional_bytes and variable-length GET rules only.
- Simplify validation: drop redundant exact-length check when
  optional_bytes == 0 (per review).
- Clarify GETMXDS fallback: with optional_bytes = 3, a 2-byte success on
  the first attempt no longer needs the fallback; it remains for when the
  5-byte request fails rather than short-reading.
---
 drivers/i3c/master.c    | 29 +++++++++++++++++++++++------
 include/linux/i3c/ccc.h |  2 ++
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3b6d3ecd9d12..12ca7c929ee5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -902,6 +902,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
 	dest->addr = addr;
 	dest->payload.len = payloadlen;
 	dest->payload.actual_len = 0;
+	dest->payload.optional_bytes = 0;
 	if (payloadlen)
 		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
 	else
@@ -944,11 +945,19 @@ static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
 
 	for (i = 0; i < cmd->ndests; i++) {
 		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
+		u16 min_len;
+
+		if (p->optional_bytes > p->len)
+			return -EINVAL;
 
 		if (p->actual_len > p->len)
 			return -EIO;
 
-		if (p->len && p->actual_len != p->len)
+		if (!p->len)
+			continue;
+
+		min_len = p->len - p->optional_bytes;
+		if (p->actual_len < min_len)
 			return -EIO;
 	}
 
@@ -1342,10 +1351,14 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
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
@@ -1414,14 +1427,18 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
 	if (!getmaxds)
 		return -ENOMEM;
 
+	dest.payload.optional_bytes = 3;
+
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	if (ret) {
 		/*
-		 * Retry when the device does not support max read turnaround
-		 * while expecting shorter length from this CCC command.
+		 * optional_bytes = 3 accepts a 2-byte response on the first
+		 * attempt, so this fallback runs only when the 5-byte request
+		 * fails rather than returning a short read.
 		 */
 		dest.payload.len -= 3;
+		dest.payload.optional_bytes = 0;
 		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
 		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 		if (ret)
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index 2506d83b8255..7ad677baf761 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -347,11 +347,13 @@ struct i3c_ccc_getxtime {
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
 
-- 
2.43.7

