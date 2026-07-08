Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B73ED5C3
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495125; cv=fail; b=YVhAADCiAVkAI1iKwV01M7B+hTlQDeAwQzi46bwk2Kl2jIBuEYZ7KkbK+GOtqXgmP/gKa2f6xKKwRUMwl0F2ZHAVj2Jz4PPsJNvsTIEMf92tzHIBwxOp4bx55Su2tGMixaPQHRSP8ruFZM4tGpqvWLbWQgmp615510BqWJ1RpTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495125; c=relaxed/simple;
	bh=3vgdIr9CWFtqTMW6iF5ddqW22hH0TzzMdDI+e6VBY8A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdSRGQAom/jX5OuDDxBywwH2kavhQFwa3yqgKayDrZnu9Fg6LYXXHZMtKh+gskivMKz+WmBQAq+tTAINt0+flOlG54/t+KvEegTNnyxhoyJT8VhurcAzI4LkhzDwoe4e7BWanYCnkDWdIQj+WrSTDCfM5NPHiXdZy4uwlcXmnPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ooIe582j; arc=fail smtp.client-ip=52.101.53.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ooIe582j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLFk6EobJ5nrggpwXVrTKQteUOjx0zaWd14hjGpIck4nxdr9S7jodp5q+7/4ltYmnAN6DeLqb8ah4zyqPTTb+Luc1HQZuHDzZH6RFvV7JH8ijxIpzxrkqn43m0HO3LGfHlqwgyIUL+GaoebnnMijhtufgwDf4bxF522toZneYv9MLJLioZ9/IOXqbc0PTE45IZr3Yd+So5Ww3XARWlVUls8dWkdKa4EDLv5ZciYgCENzAsCCpiIhuiuPQUNR2Eokk9yuSbwN8E8f+KQGL4TTEXHxUHJn2mHuAXXqQaaJa6g47h8xAq61bom6mMUlSY9FpVBNTBeWcDSobljgfMHiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jJiRaG2aIWKJpYfH7Y2iLmlKDY97gzbx/wJn9OgKd8=;
 b=JaDGF7PEgorrTISDJxD7+q1E66ax6ptoh9XXTS1EOtzAMfHQKndacr5d6bHV2wL54IwyaOq6MGQzaxSLEf7Blywa22BxQ8YbUOHAHQFM5T/JXXJOFAg+0ZUgkj5dIr+9KM+Gs3Wf9vAeqi2rA+y6tY3GOGt6FAzUaFyGIJR/uS2PuG7Wj8oqWld9y9MQYYu+h/VmipiFkDUu1sO6B3UQlIT9z9ywwNQ5imSv3/czF3vzXwqa6MHZZcnWhnhwkernlhgh+qsH0G9NnuxwRt6zBw24Ht9kGMhdkCQrCv1dbovQjs74U6zSlktpNhxtb3yEi+SmrVQdpsHSZMKwoiphTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jJiRaG2aIWKJpYfH7Y2iLmlKDY97gzbx/wJn9OgKd8=;
 b=ooIe582jH5ZOD51lqJLGtSjEkcJst1qeOuKMVSuIiPyC709JEn8ho4Q/C3ZIcv8kC5hT9i4zE8VhU5nnMsvPq8ngXTE7g/f7ojJhOmAyu5idd0JSpYtm7qgIL5I/pwDDulkkrDA2td2n7mEJd9TV4rytrJBd0f6T7FlhSBctFyUEYvvXZkZKEoOKhNACEvOWMtXK0MbUqw4I6/0exV8jq+y2EvgdaJ4M65duiWf1vEYyVQ5jqWGnCeVsv+8jz+XIooTjzFbnIsQZvOHMmiS0DB6T1sdf6JVYLgfKmdZmxRsc9x/yZVh3cNBJxa0pXfunJTkEa4jFZYtUM1MYzQy8aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:50 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:50 +0000
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
Subject: [PATCH v6 3/5] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
Date: Wed,  8 Jul 2026 00:17:39 -0700
Message-ID: <05994f0479041f3d8d199babe2a4535d6dcba3bf.1783493868.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 306d766e-4a25-43fc-29b4-08dedcc104ce
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lDMS0QMFK4cLe33ihJaYJrygUpMi1VtGMycdnc9o8KlW5Jjcb4VutNiY8m08RuFNGsNc3OXQ2hSe3n4AQtFnCiKWOZVVfADkjFMEmH3TgL/+8QrzxZRL7Uf0uy2KXT3zQDavoqH/PyOMQitpGsN6uegPZhzqbTr3nx14d7G8Smst7KjQy4VZjzaSI7CQio3AHj/NDV/YvRLYm14MVTrwndjuI/80K/FnW9DGxBamJkduyA6Ho4AMsZ2ynG0jMbodU/Jw/1Qp1RzPxom5VS/JVFFUHOI+kmQwqpWMB9WHTnvm7I/VhTQQHgG51iQTgKiE95unzZWv4waCtzTov7T8a/n5HgQ45ZUkEYVKOQEcC3sozZYqTwI/gX6dxlmvO67W6HKw856Od0jSCAMIwV0NNa0/TLcpAp8D4y5jOfUL55Lwa/RZxarAqcjNa2SE/0kLSVvPNSdk5NQ1oIlgdOcOzqtHVW/2IUakZxMjZZ6dOvzYpefFMv5S23lA97Rkzwb4K+QJmkeXKlqiyQBce9qpEL8cjp5NU2VJk54Df9DSdsMrCzogZJzngaDx8+LFAD6VqZZM7vPmzUDvJ2LCj86oRv2m20DBUdAGeT1EK7EQ6RP06UBKLukGmjUSynnmaEiJZjeWdWWIOtrZJ093siGQe9UlE8LrJs3Lzn0MXIXalkEvVN5HDIFFV6jLL6nRRhLAuiF2B6laCljUQNQm3DKeQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HAYN0YPDqSK4ciwZlbnEyvNMu+Ow8vDWvwcEC2XqyhlTUlEiTMSxcv2Qy0lL?=
 =?us-ascii?Q?9Ytrfqs1lTDr0+cBsz3BtlCJ7+7d77jB6X2xLjuSQXUt9ePqesieY7IGoSQQ?=
 =?us-ascii?Q?59Pm2FEBuIFXlF3uUmUfAGAXvfIEAg33OyDmogXsnpSTivWLrcJW7VxVhHFy?=
 =?us-ascii?Q?8H7XqJgrMZQqB3JakqFtPtbPrGYbB/PV9boTocNF+YzRtafnktln+a9iT7ic?=
 =?us-ascii?Q?inyafzwdVzBtnAjHogvEJl+ytIXxFFGK0dtsDjO0QIh7RR4GtxSptglV2fLZ?=
 =?us-ascii?Q?nX6499OoU9s7649zBXfNlpbkAVlT3IHmqiuOB/xsAbE/wWze6djhlPMEpOMU?=
 =?us-ascii?Q?nO5K8acRQGN4TrTHgQ4LjBBud1qfLGHisewNSB0X1DdN+QmHcagr7wdHWspj?=
 =?us-ascii?Q?7B6zXVHHijRRwFBoUOYsgO1o5IYEy1kXQsbltYhEmQ4JIJG1Aewwq8REU7tO?=
 =?us-ascii?Q?JhPB859ZmO6GzBYLAI4LkBfOaEh9u8+LnpKCkbBI3eBeGDIS2oj1B/aZL3O7?=
 =?us-ascii?Q?Qp6QOs4EgaKYh1RfylLHSEkhAMUsczoBa3as34DAEu/pdZ1++SlGEYdVgM0t?=
 =?us-ascii?Q?pxgz6oYlVToSuUniSoc1oHP05qW9PvmkPLipYYa60xjsAsTgC8F1+NyBf4ne?=
 =?us-ascii?Q?AzJSyWoCL23qlmzHBwoM8bqpxb2LszT0GBVvRtkyHIFE6Xq2g5a0lfFP90hk?=
 =?us-ascii?Q?RreedhLC09OB9zFTwsELQlVqPDycrX3rorHAcg8nHM7s73gCs8dCMbAMrG/u?=
 =?us-ascii?Q?8u2S4QEjL1VL49wzzTVNMWMVz2LPQBT2b5Y5crxymu1lF19QRFLsdS7lVKBQ?=
 =?us-ascii?Q?E5aFKMAdQ02G5Et9O902OHlJlQ8KZ/3i+n8MflcF2orJi1GH37+lRbOgfyFF?=
 =?us-ascii?Q?I8FO/RG7PnY3fY1/iS94VQBfBkH8iNHyzou4U9GTgHr8HyzNOleFZ5cCUtBf?=
 =?us-ascii?Q?AL0XszAok5zfv8nFZLa90NE6TUVC9bSS+aIrhAljsG2+pXFOYmxzQ162SkWQ?=
 =?us-ascii?Q?RQpvXzavrXxOkYAE6mJfqdfVR+nZ2mI2BWyl5D3n1DOhzIImxzsKzVDfP0np?=
 =?us-ascii?Q?f2h2tjxJeSzBaEPOS5LC+TfqIdJWUH7g9UW+yOLt0J07J2KYMyEFEwwO9cHz?=
 =?us-ascii?Q?fmVwAaXX9FDZuAglp6V2YbW4bPG9JcjmFf4vmBedug687h54YRsmwFS/m7PS?=
 =?us-ascii?Q?F6VxLR1ZJm37nmGxfi9h/YfVu9pfKPbZqWl73gvTp3P4TnmQ/ON6eTyTgsAF?=
 =?us-ascii?Q?keOZG0dzTJ1BJO3MNXRitVZ0G9te+mDXGDEYdK62zJEfNuF5XyoRhqO5JSBm?=
 =?us-ascii?Q?18oNofdYpIhrPlD4/1i9zpywSBbbWkF8nyHgnm0IrWBZt6KG2Uo+w4nzkEWo?=
 =?us-ascii?Q?38YRzmeBYV4NYu/Cfg9obgDfbcUybKA63CT+TMJw1QRBFTjn1JGuqHnvVVS3?=
 =?us-ascii?Q?3l4FxdYTgoS9NW1zLPASuUAFoqTnSXV7vo0qlKdEP63fiz7gelRCWYOYqkK5?=
 =?us-ascii?Q?kt7b8pg28DEkmxfW5J3VJoMJcN74Vu4swhhC7mtEwXI257ggH3CfXorjRM/X?=
 =?us-ascii?Q?sf1oVQHH+806scZCpwVMTmZOlh4WW+n96dJmvjrpwjN8A1e5ZFefM2WdRvON?=
 =?us-ascii?Q?KnVnWK750rn8KE7seDVQydprAYQanAZFi5rHXvpa2EsYm9tXs7gbuAcA3Re6?=
 =?us-ascii?Q?BSRTfaft2/2iNemIbgiyORvh4dutgDpdOB18vt1HYaWWZf3XpbuVTBvk1XVG?=
 =?us-ascii?Q?5nSsi8pdDQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306d766e-4a25-43fc-29b4-08dedcc104ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:50.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HHi1HVbF+x+TZbSrI5aSuHW/bkPaXEp3ROW1ezZoMqKYpvyfu0eTodG5SNThSfifsf8WRgkZUlLz/UvBGN3pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Map DesignWare I3C master CCC hardware errors to I3C M0/M2 error codes.
I3C_ERROR_M2 is reported only for broadcast address-header NACK
(RESPONSE_ERROR_IBA_NACK). Target address NACK remains -EIO.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v6:
- Fix dw_i3c_ccc_set() to use dw_i3c_ccc_map_err() so SET CCCs get the
  same M0/M2 mapping as GET.

Changes in v5:
- Unchanged from v4 patch 2/3.
- Add Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>.
---
 drivers/i3c/master/dw-i3c-master.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 6998ffd15f5f..c70f6876bd38 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			break;
 		case RESPONSE_ERROR_PARITY:
 		case RESPONSE_ERROR_IBA_NACK:
+		case RESPONSE_ERROR_ADDRESS_NACK:
 		case RESPONSE_ERROR_TRANSF_ABORT:
 		case RESPONSE_ERROR_CRC:
 		case RESPONSE_ERROR_FRAME:
@@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			ret = -ENOSPC;
 			break;
 		case RESPONSE_ERROR_I2C_W_NACK_ERR:
-		case RESPONSE_ERROR_ADDRESS_NACK:
 		default:
 			ret = -EINVAL;
 			break;
@@ -708,12 +708,29 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	dw_i3c_master_disable(master);
 }
 
+static enum i3c_error_code dw_i3c_ccc_map_err(u8 dw_err)
+{
+	switch (dw_err) {
+	case RESPONSE_ERROR_IBA_NACK:
+		return I3C_ERROR_M2;
+	case RESPONSE_ERROR_CRC:
+	case RESPONSE_ERROR_PARITY:
+	case RESPONSE_ERROR_FRAME:
+	case RESPONSE_ERROR_TRANSF_ABORT:
+		return I3C_ERROR_M0;
+	default:
+		return I3C_ERROR_UNKNOWN;
+	}
+}
+
 static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			  struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
 	int ret, pos = 0;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	if (ccc->id & I3C_CCC_DIRECT) {
 		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 		if (pos < 0)
@@ -742,8 +759,8 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
+	cmd = &xfer->cmds[0];
+	ccc->err = dw_i3c_ccc_map_err(cmd->error);
 
 	return ret;
 }
@@ -753,6 +770,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	struct dw_i3c_cmd *cmd;
 	int ret, pos;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
@@ -781,10 +800,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 
 	ret = xfer->ret;
 	cmd = &xfer->cmds[0];
+	ccc->err = dw_i3c_ccc_map_err(cmd->error);
 	if (!ret)
 		ccc->dests[0].payload.actual_len = cmd->rx_len;
-	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
 
 	return ret;
 }
-- 
2.43.7

