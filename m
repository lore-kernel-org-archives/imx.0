Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3663CE0B7
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174008; cv=fail; b=tZuUEpbgDo7gGPTnRPCWmiVDTAK9qYQjdIAP+/QOY0XLo1T5A0zVpLGz63X+eq5LT9oVrB1vFGh6Ujug9u93tXb0mCZCLl0HL/RLoLQ5W+XZzaOiAGwSdkZLf6UCdPKtAFwqyT73gRGl8bOXTJ/pcK6faxbQHzi5U+CBpWvcDhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174008; c=relaxed/simple;
	bh=MoRdI2Sux7I6KJPtO+JpJoxJlYZP7rlBqjD53Oc6+yY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P7wSf9L7QfaeGHnxCnINvY+EbA/GOdHoHaGyiHZsDmDs/ABYVV+jCw1ACpLOsi2wws1daiF8DsLsEDjhqmThZy+BDaz7stnARJ1uydUFI9uH/bJ2zPlkEvqdwgdw8ICcIgEHb391PmlVGyhEE0mkAUtpBlb1mBsZFa/KLELvtG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KJzeh2Ww; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KJzeh2Ww"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIbwbAe8ZxFRQJ2IwN8H1vr7+qqNJUQMY3NMaCAqavGrZfivJy3Qhm9OqU2LzZBwQ+Qpkyr/i/IRHAS78zwe4kAHiC09I7OPZAFDS83FkLqLgnIdgM2gFsP+sb17atORTu1vB2LDbzPTsA0I4DZ9Gqgg2Lc/rFt3cqns+5BV5lwrQC9v5WD1G9WQDy5m74uNuq8/1C3F7MjspUPPNKlfU9QJcOeKnfPLxQTht44hVvMtD/lYz4lUuUaanyazTKUpfQSK42sP8fn7k5NJy8j6UMs3G28VKbfYBMa5G9TPrKlqvyMedXZJdj0m0nFtkWeAfFow7BENHTWE2FUDyS5hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVFGLJ5fkJJ9yFgnOxfyGGLXdO8UBH7yalhs5We6Nfo=;
 b=xTkUCysVxisT5zMvV51kYu0zhlOyFVxPvjPB0/SO6hcGLwv4yWilDUJQC+6Nqypnv8HzQ5R1NWFQZJkOP8gGJlsMBDFltwoRcredjAq+MKHzD0u4mK18CV7k1CN7mKYHOr9DxDtXT9iOG8eeBjwT/JsDL36QgAoeppmqw7vWF6IA/CqpKJTWxPd/awmIpztcZDKUOXtuuG1+097OR99DG/vHGmIg4Ya9ZJk7iwoqR3c5MkONajlVQlIsEu+QcVgBDGug9ugSKqgwLs8nZe6MMPCaLvikcDUdCQttS+hY1nYtb2lprIAMpxq/ukkp6eIFG7yEHgiIF8JMuXSMXj2fpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVFGLJ5fkJJ9yFgnOxfyGGLXdO8UBH7yalhs5We6Nfo=;
 b=KJzeh2WwYvmhjuoUs4/6jqvVuvBlZmJWeCq44Ma5ogPUBNHSmRrW0lYRgA3MoPgd9S115iVrVxg3e534rLo48pnY5Jn2tM4upWY8dQB63BY148V9bdLA5nmOw1F/Jan7VC000LOKE6bUlmijFs7Cj87BPkbgVnZJpQsnB5XltBOfJ42kCWCG5sCHBN33LZTk/vvvPDiEvuFDw9rvHFFCosk1N5zcewFh6XbzglGW1T89p8EposjOoQlnxBlWwuUN/043flTWwiVWH5PtOV1NN3kiNVjJhDyBqekc9V6ei+0Fsohs2HR2TdG+Zz/hUQK/WuLWzER79n/QIpcxycH6FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV2PR04MB12558.eurprd04.prod.outlook.com (2603:10a6:150:368::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:33:20 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 10:33:20 +0000
From: pankaj.gupta@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH -next] firmware: imx: se_ctrl: preserve ioctl error across cleanup
Date: Thu, 11 Jun 2026 21:23:17 +0530
Message-ID: <20260611155317.3205994-1-pankaj.gupta@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV2PR04MB12558:EE_
X-MS-Office365-Filtering-Correlation-Id: 146deb47-a1a8-41b6-e666-08dec7a4db2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SYlL9k004jR1KPqB+qTkhDv2Lbl6c3K4Y2NPZ6zRYYoQfm8vsgVESKDwPu5uhDon2IacMNpEL8MrwnIQi/ES+6HNRrt8CJdOhrgL5HJeWjHJf7x+Xdn2W3Y2PvfZhT2p5gV07hmnfD6Z6yurFqZVt03snrd4G2yVp5lEXUdHytdC/bRSririENCQwjdz5jJX9BXQlb/VzbVASrV33rJlhKuBOaY57BdqSTNxOMMTqPlSsP4weGcsIBYw3/8MoDwxWLao+pBnDZ2g/CrjPz/8RPnYn40pJrf7dZRyGL2eeGTPT/zmWOq7ZvKO8tSPFTN0rynjMVN+Dqa/zr9VuRVAMLLnTJCdZp19usuJyc6+bxsXgiZW3ZGQ1z5OfDW+Zbj2kQF570dX/Fygygvd4sBSqiKkH3jUUGa6Cu4CpUOWaonwF8FHuso7YCOxvm9VQa5H1NYnOd2wqybMfCyoGTHKL7+YBCVZUjmUpDWx0WwJHWuAah9D/3wKcbJkjaEdqWbJ2NCanZaJoc7dlgmXDdY84WBf7WsrLqoeNCAil+Pw8HpP062uM1ffZyCwD+HrmuevAOAlF9gp3Eg8cIZZjqSOdP4pwdyA/8+oztcr+vJQ3LLLTy2zpzOfSKi3DopSYWfMO2zDl1+gDq2EWg0uYOef6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q5UWC70KQ7VXH3lmRpKZfqG+5At+PxnHVoPO0gGvoTwCE6Q5Qr6asXGcQ0NP?=
 =?us-ascii?Q?nE9Xxe8MNUtL0pZCnLbThqHGo97xjBlyFSxtQC/F2Q7VsOY+6mkOrEpngqCq?=
 =?us-ascii?Q?0G8sDg2qk0DE3g2IzPNgJ8wedFIcEF6GmLLA+ReME422w94e7hb7FO0HPEwJ?=
 =?us-ascii?Q?EG3D8/6Cu9kBacCNGtUIt2gxdHRHklHogXjiGLQ8T64B+VqhN3hDjySRW3VM?=
 =?us-ascii?Q?gzXUbC/BxMUY5gmePrSq0cQWukzFP7mSOwR8DHF8Zw4UJGH0Of846f/KV6kD?=
 =?us-ascii?Q?VU5E/wbKAxNF4vQSYD42EkcLcmvQbc5sS2KaX5TGymALTV94mbh6P+GCZXvX?=
 =?us-ascii?Q?35w1g1ZiykmVCUeCx+39zvM8n0vzif8m8eIMfL5TpisGpguukTDWcsWSLHtl?=
 =?us-ascii?Q?t7YOMD8SGWW5JAB80/RCfNusBONsm76flYl4EmUbdLN+oHarIe2/CGdKNXb9?=
 =?us-ascii?Q?rsN4C6k/t2EQFZztqNO0ZK3HXvRqnosSF6zwK62ksgXq18au8YZlAWDQ+n73?=
 =?us-ascii?Q?2yztRjkU1XoAR4r0EjoiU/liOdr8ZD6uxPsIRv+aOeGAWyZrZRyFk4Q15KkP?=
 =?us-ascii?Q?mXcacOga8VLCM3pK5GZoOGWPAlI2vEZKJNuLOJPnHxA+bs3fcIEq9ky6WeGw?=
 =?us-ascii?Q?ROxBU7GfAChJz5RXIKCPlisVvi/TQEh0Qhk2HDXFkZzvYiOVTiWPN+Y3p7AI?=
 =?us-ascii?Q?7SeKZDnav+eeIxjhO941BHUvjrUYBjpU3x24HyoMGCKlB9NcqqQR42ek65D7?=
 =?us-ascii?Q?zX//zvXCd/ysasYomIVE+7/+D/u7QobTsdPi+Vwsue9GkR2AtnJniwP3iFDd?=
 =?us-ascii?Q?qngh0oPsMI1y5y79sAiqqSyU3aowWwdgn4tQ6vhEmPvYDxEuc0CRJR3yeVZ8?=
 =?us-ascii?Q?Sc1DmC4YrP1Rm9p4xqtERfZvBcJdfc4iGvzgJ/qQ77MjqgtfB0bCjc8CEzE+?=
 =?us-ascii?Q?P13dtWSzlmgaQcODjENPyN2shbu5eNl0lHeBWknVQEAa0SCHWhkirA4jT20u?=
 =?us-ascii?Q?MRoExl7LY7wqgoA0XCfXZKshN8A43K3dea6g/bgNNM8qWANv44NyJMawEVo7?=
 =?us-ascii?Q?nTCq71DGCqZI5OGVlLZN3bobJa0W8XOEEZlKretpOPYkJqVV8af5HkM/IR68?=
 =?us-ascii?Q?zrVmJbJ0s0TAZAqpybWIcHPcmWxRbtl+dFXhkts8qViLzvxTswxsvSdTZN20?=
 =?us-ascii?Q?u94W2hkgjXDtM3pPFykj/9CWTSaoHEgjmr5sOM15stHxffnTepQMz0hPcEBq?=
 =?us-ascii?Q?HlhZQUz3Wf99reY1csI6dW0nZj13w1Os4E+MpgvlFm/zHd0U9jxhsQxUjt80?=
 =?us-ascii?Q?IemY3luAiQuy8rnEuRNpo2j2G+jXcjd1vSOifP0cysfLw1VTovXsxWRSBD9W?=
 =?us-ascii?Q?fhmFO6O7DsfzDTSOy3599p7tfcAxGCi84VJ7LarFBdNbxvtmm5qFREp7VpE0?=
 =?us-ascii?Q?Q+sA1FwU0TvQUkfoEQFWtzsNaOT/YAKErJyFpOvz9SdS1fL+fivXlzLWiOwS?=
 =?us-ascii?Q?VJA+F9yc9OERKFQ5CsJ+qhlDqAVMNPGykESO1WPfVIsdH6ZWD3U+f3Hablid?=
 =?us-ascii?Q?A5PR/ADx62bOUeMmK+RBHyTJOKTuVGkOaBw6zlXLX0u8dv5+R9VWiH3MGr0X?=
 =?us-ascii?Q?nlkgSy13aLxhsX7+rWKr5aWBU7aMMl3lK86watUb0a5toxeWIRVTbgDkBKFj?=
 =?us-ascii?Q?2S4aHDo36rR84S1JAx4ZV1mFhYO33l9n0qKhr8OQ3qLajB/X64lJu92melcU?=
 =?us-ascii?Q?wY1R1qi6lBn8Ju4kPu4jWAHqGIFHKmK7uf9+lFc1QkLtYUQ2oMi4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146deb47-a1a8-41b6-e666-08dec7a4db2e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:33:20.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlwHCddqewzpmM6WGBWHsi1db2MHMzAhOaRcu90qaKh4zTDXlFULr3pUBFGulFGB5ANIrRwRG9wQj6uDgCoEjN1L3/fwqkH5iB9TZfYVKb7a6MgPxD0WMxK6+1zHMssS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12558

From: Pankaj Gupta <pankaj.gupta@nxp.com>

se_ioctl_cmd_snd_rcv_rsp_handler() can set err to -EFAULT when copying
the response payload to userspace fails, but then immediately overwrites
that error with the return value of se_ioctl_cmd_snd_rcv_cleanup().

If cleanup succeeds, the function returns 0 and falsely reports success
to userspace even though the response copy failed.

Preserve the original operation error and only use the cleanup return
value when no earlier error was set.

Fixes: b87b30bbdfb2 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091446.3331006-1-pankaj.gupta@nxp.com?part=1
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index c9e270288c3b..f44bffd58ef0 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -513,6 +513,7 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
 	struct se_if_priv *priv = dev_ctx->priv;
 	int err = 0;
+	int cleanup_err = 0;
 
 	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
 			   sizeof(cmd_snd_rcv_rsp_info))) {
@@ -603,7 +604,10 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		err = -EFAULT;
 	}
 
-	err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+	if (!err)
+		err = cleanup_err;
 
 	return err;
 }
-- 
2.43.0

