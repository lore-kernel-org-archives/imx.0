Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D13ACA59
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173348; cv=fail; b=HRAZyVzheAxeHlqC+V0rM9/BkEKPGaHvG3T9WHQLEEiQQZCUJvI6MJ7mVMfIGidTl6ahyz4pbNGJNXak0FxbQ6b5OPzfgbuAk1GmCMpM1NkosKQ8HGoLnDHPV3b4Yyc+p2hYS1fLTPqOZJIAjChgWzpdcrSeDXM8Ql5FU8aEoBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173348; c=relaxed/simple;
	bh=j0j5P+U9U0lN+xCyz2nH/R8XGH9Exm9XWyvqAWDnGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p5FAVMSufsP7x+HkYBJAVWzVueF+wCfOA2HMahh//eeTa005+K0EfEV/QtTFvvOs87pa69MOq761ISXk6wm7drg6MlVrG64EJ8uCahdeDsbI1S5UThd4jocQlEiYuNMkNhy2qao94gPtIJUW8TMD8jD1bmFSergKQ9Ji9S4Bww8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LHnE2ES/; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LHnE2ES/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+0YZFyB+52LWQ4FE+c4umGv6nN5zyaUHVuURDgPprku0TGhRLnsKJwxlrSiGwr48UK6gt+jByHcXsRNSEespkhayPPyA/DWKTd5LWyHFRzuhRk1NJtYf6XZjFREKQOvJnCC2TwVFTh0D4kE2/f9x2hXS1rnuhxzza/+8fJXyg4UjLNSd59CTqA58xsv/yeyACsFlPh+F7tgwur1t/Rq0hE6Y+h7/kU6WHfKIVh7RsnNIX3nGi6PXD6fseuULpUkLKVmPk4C7m/gPdabe7eUt7I6DEl8YGX8Lhi4rNVkvjcZ8OZfSsVfP3+7Ns3I+kd+ySinolpCK+4vtxf1bhmLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0x1TIE6aSWGBZNLCXxXigfsuTKalc0ip5D6bD7TmmA=;
 b=StUTgtlf3jnlQUq+HLQcQNXkJ+scEeLghEUNK4wybyIglr8IgtSTvStiYHkunfyLOAI7/O2yTVN6KcMnJL73WRk8tMHr36Pxxm37IQg2F81kzUOhRP5lK0+4Ds+o7JuqX1P6zL4We+5+bhCfkree/iEr4q+t2/9YfnNfub6eBhhcF++bx5aqmsnizTUwsZeMAVZl9gvPDnVerDNRUfwnQmS0qxfKh2Q3l1ccOkXlsDbgQHK3HwGqjXibWOnvs2M1Add6uRNqFlUmzmSqVmevLQL7WxOHIyzJpiadA0xNui573mnov3Iq8Jd6+RrYyAAvFk4VXHYAQYZESZbQEODEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0x1TIE6aSWGBZNLCXxXigfsuTKalc0ip5D6bD7TmmA=;
 b=LHnE2ES/DIlkAcehOd2TCUIiLVU1APA5udOJI3Ft4PRmKLKcUAnh0TjPVUUC3wGBhqCidWbAyt6RCl22E2hJbOb9O6npS4kdwCWMEXZNOKucOlN1N70uSSL5jDJUcoe6Atwfpn1uiOsMZzdBCDOee71nCohBS7XhUxK9TBGgk7VPTBLAgp8dJ9h3HuHam7V+AJ+ZEIe+avoHIfZXuPHNIKLiX0Hgh0P4/+LlWN1nLMdT2Tl4AVfu2OPDem4PPwY+b0PP1gNCyKn6X0e3Wj8glg5OvS6ctPfLDdoBWo5KsqoaewLuYxNYDpc6e4hjlA4UPGX2Grk9as/DBYJaH6/ShA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DB8PR04MB6937.eurprd04.prod.outlook.com (2603:10a6:10:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:22:24 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 10:22:23 +0000
From: pankaj.gupta@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH -next] firmware: imx: se_ctrl: roll back iobuf reservation on setup failure
Date: Thu, 11 Jun 2026 21:12:32 +0530
Message-ID: <20260611154232.3184266-1-pankaj.gupta@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::9) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DB8PR04MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aed1e95-c763-401d-1d6b-08dec7a353e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XNIPPrB0E0bks0t3m4khHJ1Xhs/qt9pMxmQRrlkS2RbrooL72B3ZvFVT0CV2mq77hJWVgOW7nFrKubbcsnf66IaUowP5NRmyjrak5PMbgOtA9DJwJdG5A8D6l9dNxZY8HBC6nuYKQFPGXxsjcf0o5dbs+dHlw3JxIPkkHH88vWMu5Zpv2omazrtkNBytF5A+T/Vhdf+0TatCNLvzG7Wi4qNM8nULxqeFOOy36i4Y2QJubhzdxQqcfgeSB8HkUkhRMggUhy3Nmn/rq0geduCVeAGHpjeyCaxaU60dEP3NXLY9qfGwjDtgcm4CINOj66MMlvjKXOBNoAr8cusNqVCaCZqm0f7SIk/3ZAqDapV7WOecAuV5d4ESe7buA0V31LAyOSHqFXQmZTNKlgdyEc7OYsd3uOtNTPSS8jaBPwIc7oB/V9Kw9VOPcfikYF4QSIjlnM1vYb5S0SdXKgtTBIAUWRJejKPZlJVXdQObGmOp1g3P9NlxZBZoiIsibPR0RmKPJIMtow+d8+oPjFt9oUXgIpLdPrG7+gYb+bzHNFWLsKyh1LrdC+gdJ/AHKeLAgG+i0sEpwVwSbNva6O0JZjXAKaB79McPNXnz34EcTkRozIPMJBU7KwzgtnQB6XqA3Ws0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wW82fG03W/tCAq3MWJ8k5MgwuV+uB0V3kU02/jrMDEyW+iANnVFiOba80Oqq?=
 =?us-ascii?Q?azZ/TYsqOQD7CBwZwYhsqHZt1HzawkOpbkJGrVwRckjzuRKyIqkjlcI8WvZW?=
 =?us-ascii?Q?9MFWwYnj/a/SKM3Gl+1Z20u3E2O4VJbcllntyOQ5FbsIdu7SjGaCujLwMUxc?=
 =?us-ascii?Q?6N9EyRL4Ti52qUczxusuh8ZtgYKz7+pT9ng8LCTpSwqUEYQs9pfskOs2CdSW?=
 =?us-ascii?Q?krlws2tGr232zrRuZRe3gHJ/ng3hcr4O2GVK1oQjAppvh1DWrK+5jQnpEaWx?=
 =?us-ascii?Q?NWJzFDbIVpRFShPQGomKmarEVRpouXuWlJyoVVjzyQHJGjrrpknauBiigr/5?=
 =?us-ascii?Q?TTTku3hmulbVCvHiMAXZEPUSzgrPHbH45VgnWTuMvs5SGFCkrYwqtUMzjBSE?=
 =?us-ascii?Q?wBE5jQ0aEwbxMVx5qMf2Sg84559ovRpIo0JtjXNg/SVhqkQ0UnFVeHscANJi?=
 =?us-ascii?Q?KhNqjCyo6iANqAKKTp5vBycU7G+nO3tx17csVXQlPI3nf97NyfGQGpb7xWot?=
 =?us-ascii?Q?UchJFOWGe78wP2YUP17pEx97UdruOAz1hggMkSWNcA/hcfbfvKs1yYmT0T+D?=
 =?us-ascii?Q?WHPjkKqSXvC4mIEdfjB6qmZCp3/uqPGLn5CQuXo9ssklVisP0DCcf2/AK8qa?=
 =?us-ascii?Q?uZjl9LJewXdSGdsXkfw1hHosyVnEOMr6mctaC/wgqcFXnXFAKCaGfYLy+6jc?=
 =?us-ascii?Q?0PHj2qAeSXpj6x+i16/kyWzHgz9SQuuGrJmet6Kbcn7ZvJcs9wEhfK/7AFEG?=
 =?us-ascii?Q?06uDs/sTDriRbZd0KsDlOUD9y8qHRBpFnaXwbKspt5hirKN2sJfMLQfyzC1C?=
 =?us-ascii?Q?0WAMluSU5IJAJsSWsHiUA8avo/LyTKdoqAxf5//cEmrRIqB9zMpRDIKLLrOc?=
 =?us-ascii?Q?PO79k9jyGfEnfzvR3/525t+vMRGH5Cod1X+E/PTol7BDDxzeADlr2N1BoK4s?=
 =?us-ascii?Q?eQUqmpYj4c5YGSBUWKcniylEI4M/TEcpSMZlXaCksHGcR4a4dX9dyzoZJFNg?=
 =?us-ascii?Q?MeakxuL++dGyQGtgdMsdwPhYrpVhkMT3hgHSbmqMowWYLbc0sQWlhNyrF8zS?=
 =?us-ascii?Q?9z6xTG1iGf8Ke1smgECPZsI0Akl0Z6+6HH5liT0XZe83e354J6E3pSgqpJuw?=
 =?us-ascii?Q?663BA5AYErv1ZxAQdeYebSxhj2ScQI2+Odu4s24HKqw8TxKC2GrfbiH5edDT?=
 =?us-ascii?Q?DgpoJgSwFBCUtxzHezjjLPdOp1MxUJfTutJSsADxiHuy2ZaQqtMUYhPfZQ9p?=
 =?us-ascii?Q?YQ8XR6Qpuh78dlUkzCKzybjFWeFW+FMCpQRoQu1W6LK+XgJ/P2s1+EyBNHfF?=
 =?us-ascii?Q?+2IcwVvI6D4GoMpk9R+hodGvZQlj+eH81/hciDx6/KlVDS0unCiAre9btr0B?=
 =?us-ascii?Q?RZTlhufxSsRpRLg2kSs4XJTeBQ54K3LH0Km39/JkZMtP/7RMcbko5o9V6dHf?=
 =?us-ascii?Q?82U01ZLgFEW0I9Khciuc6UuSRuKYLV6/AKQPa3XsSR6fLaFeDcdiX/nrmigl?=
 =?us-ascii?Q?BUvBYRxKVRp5n0LwOKqeOfVb2WU7pbGYdZDkmp/R05dIW7CtVpWrOPgcPEd6?=
 =?us-ascii?Q?PwZKxqEb7nRyTWkj8ihBR9BeCp0Lp/PXKolWfv9HmbnlkLIPh7nSwccbLEFq?=
 =?us-ascii?Q?dLHinXfTkBeV3542Stv2iJirvWH8rukR+cNiPbqbnbnPyN67CP2pnhU+KXFx?=
 =?us-ascii?Q?UJZQ+y3JM39otVo47kco3SAUeLhen4JFCNjEAUYDVPdnywRjrr3343FDR9ER?=
 =?us-ascii?Q?CxUdo5eGazL8T1ffoyjZBZo6CTxqvKtCmr38ZlUumvtidxXw6v/S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aed1e95-c763-401d-1d6b-08dec7a353e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:22:23.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sn4nH4YSfmuhwPPqRQ5MCtEfWEE45Ls15NNucgfVNQsMIfJ0JiAiZQjw2pei3LOEsvpzZJCKRWiRFdtPV7GQr+fb3rR9KP5l/zdhjeBcj6ykgUS9IpgpEKY4IsjlOfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6937

From: Pankaj Gupta <pankaj.gupta@nxp.com>

se_ioctl_setup_iobuf_handler() reserves space from the per-file shared
memory pool before copying user data and linking a buffer descriptor.

If copy_from_user() or add_b_desc_to_pending_list() fails after the
reservation, the function returns without restoring shared_mem->pos,
which permanently consumes part of the shared memory pool for that file
descriptor.

Also, add_b_desc_to_pending_list() failure currently falls through to
the copy_to_user() path, which can return an ELE address to userspace
even though setup failed.

Fix this by rolling back the reserved shared-memory position on
pre-link failures and by unlinking the descriptor before rolling back
the pool reservation when copy_to_user() fails after descriptor
insertion.

Fixes: b87b30bbdfb2 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091532.3331051-1-pankaj.gupta@nxp.com?part=1
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 37 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 5b23485fe42c..e42e5e23f48a 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -365,16 +365,16 @@ static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
 	se_shared_mem_mgmt->non_secure_mem.pos = 0;
 }
 
-static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
-				      struct se_ioctl_setup_iobuf *io,
-				      struct se_if_device_ctx *dev_ctx)
+static struct se_buf_desc *add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+						      struct se_ioctl_setup_iobuf *io,
+						      struct se_if_device_ctx *dev_ctx)
 {
 	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
-	struct se_buf_desc *b_desc;
+	struct se_buf_desc *b_desc = NULL;
 
 	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
 	if (!b_desc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	b_desc->shared_buf_ptr = shared_ptr_with_pos;
 	b_desc->usr_buf_ptr = io->user_buf;
@@ -398,7 +398,7 @@ static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
 		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
 	}
 
-	return 0;
+	return b_desc;
 }
 
 /* interface for managed res to unregister a character device */
@@ -641,7 +641,8 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 {
 	struct se_shared_mem *shared_mem = NULL;
 	struct se_ioctl_setup_iobuf io = {0};
-	size_t aligned_len;
+	struct se_buf_desc *b_desc = NULL;
+	size_t aligned_len = 0;
 	int err = 0;
 	u32 pos;
 
@@ -703,14 +704,18 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 			dev_err(dev_ctx->priv->dev,
 				"%s: Failed copy data to shared memory.",
 				dev_ctx->devname);
-			return -EFAULT;
+			err = -EFAULT;
+			goto rollback;
 		}
 	}
 
-	err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
-	if (err < 0)
+	b_desc = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
+	if (IS_ERR(b_desc)) {
+		err = PTR_ERR(b_desc);
 		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
 			dev_ctx->devname);
+		goto rollback;
+	}
 
 copy:
 	/* Provide the EdgeLock Enclave address to user space only if success.*/
@@ -718,6 +723,18 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
 			dev_ctx->devname);
 		err = -EFAULT;
+		if (b_desc) {
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+		goto rollback;
+	}
+	return err;
+
+rollback:
+	if (aligned_len) {
+		memset(shared_mem->ptr + pos, 0, aligned_len);
+		shared_mem->pos = pos;
 	}
 
 	return err;
-- 
2.43.0

