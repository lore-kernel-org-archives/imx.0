Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611413939C8
	for <imx@lists.linux.dev>; Thu,  7 May 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160653; cv=fail; b=Zydk0y8MMAMEy0CmwK45WzTKdhAFtUxHgLA8rZ0pzEutlXdAWH9Yc2TjVvGqkzSHMT+C6/nxI6BgzG7+MZzZ7SvnwPDMxhK3qmKmQoEydYajclbkqUQnrJffrT6juAiXMTpqFH7TuakNMOr/K4TECOq9eKwcoWVW41OkPPGMISg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160653; c=relaxed/simple;
	bh=rIm0m4hURfIxUlOumgGlCer3QeEsKSCZ76OCK5qDdi8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y5syJFb1/RhvPp8gLh9EF+MSh0mNUhXYolFtGxmF2S14YEf29MJ7ZwziCdj7sup4qnJ7lXZvwG4iztWCR1NZQAeqk6s/FMps0jfk7/IGbQp4E2NHLQy0BFZPXmWbP7HnKkNmTR5yeRi3/CygVBDWWFmZGZbnWXh8V7GpJtNz1lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h1TnzkbW; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h1TnzkbW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4YO7uCfV85V/9o0YwScATyhQ+NcxPX2RCknqVKPveHieVdinrTS6VlFERieY2ECOFvWaF+sdEDfXDgYE/WRseaT4DuI6qDGx2YzLGeVACPXooXV7KXIEkqIp6FKDYZUygX+N9p7kR/tMc05Oh94fx9OODPEjlzZVmNc5QiFzgsATzWdeB4dHXtpMzGp5otSi3Jouh1geH1FT+vWFZfLL+LcaR3LvFoZXJm74JvtvOOMVa2VkhrYfNV1c+NgaAKoOANOF5g/nv03H4/Yf5SW82VNnCFP3HmlofAdwIE3PRv37ceX6kplNAGrv7+lwIvchMrzuIwHudQUDoDwasjbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs5ZidxCLxEl+5rS4IcsKiozJq2wF8aRyfbeq/XFkSE=;
 b=S1me6tFmxmbsp722MPFx+UqzFMe2+/SM2v8IEuyxH9dt1+jAb0PHLRjidA4OGYu3IhQ+62c7dx/HCiUhqenx6kt7e8PfeeYwRWl3Z1mQlYmKR7A9kxDiUCXDyBmZFHy2HpUB9OZyDyjZ9SwbC1H7FeVJ7rFnZp6dVxoE6Bff3/yBeuOQ7fCDcrcjBIEiXzaDPmGKA7zdwlpEAwttw/nSKI3CYZHCTr1UUoCFxOwYY4pOgm3fudFFihi5q3DYR+iW7UIahF1u1koZbU68OXSqo0hL4MfDHgxF0FSC8WdUPEpuXHIyWnxQnyHQoycjH3QYMFc5gb2I7mbTYY5qeRYBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs5ZidxCLxEl+5rS4IcsKiozJq2wF8aRyfbeq/XFkSE=;
 b=h1TnzkbW4AkfJC4BkpK8KqT1nwUy4Jh6c5QAyrMBdLFF4z1829U3SIRsL9Uyo+ISMoFYq3r3i8MP+1KxDM0TkDgbVazS+OXiptIo7OV4lOSKlBfQrYMhHyhfKXwNfUHktFgxgaUBsA48t7axZ8P5zhxgClZLI4pVP+XWEkJmeAKQbmx+GPmQuPAF0E7ZRoteVyJw+muKZZYgecmRyhCKc5pc6utw8nRYb47AEJqHMpjVZjeZmrKL1JDXrYbdzbl8Ei+6wBcUBpvhx4mYIcb6NRBbnZwIE2+SI2qy4FAV9VFhqyp5K3pe0HueCfB5AShHJfvjJLwCV3TCdg2dw51Jew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AS4PR04MB9314.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:30:46 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:30:46 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: fix overflow in iobuf size calculation
Date: Thu,  7 May 2026 18:59:16 +0530
Message-ID: <20260507132916.1737255-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|AS4PR04MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: c3aa3008-23e9-48f6-72ef-08deac3cd837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	krdfZX66rgX8iPM5rYF44Tpq8gdwWCgbzGm8S6ipIoehbsGKDAuvFzS9YUgLvOAHKFSzQCcmf5HudjnlRJQahuV/OymDnYH1CiUZsyjNtvEy47Ac+DRqUqC7AWnh0iivpa9zfHnQk5pRKV1J5aPlvsoHIYoBeVJzh3dnFRgkHcnR7OeLvcNAvSGWPfpvUzWkTR8c9N0KIFA7kUk1Gx12aKKEMsRRSx44WPJYC8nVIYEFUrZQg0zcBry9BZaEtYTwtnEpwqhq6I7an+3rDbpJAvBGdN/ITkbJC0krRvf7HxgJ7YYwSldvx+YOVG/xh5BnGsgUo+049JcIpwZETwsS4YZUVrsFZI2VKTkUKGBNSHJLEFZYuJkBvPxV6ZBYpfQke4W8a1mb9XrcIKYWb8wo/zYQIOuZqGiqaOn4pyyKEyXYx6nrrdHqlKuFLK/uhiKp6RPL2Mi0EGtFEHeqAZMogADc6woQ1yoT9YVDMVs4n4lJYy4hUtpS6VYGFDltlABBQAaMvw7ox0QlwP1cI/kTpe9L9RJ1P3vdQqoA3tbfOx9t1OPXI5U4IHFKk2wO+GhoFpdiSnKHBoJDONXF2ZeEJHc4lHF5I1SCBeIAqRnsxmUlpCHOr3L9dVe4Favhz0xaj60GATvY2QRb10pPKLW4UMYjBC7Ao5J+Vkk1cytTq9kQBic40EKz3hxIxjEZSFTJyjr2s4ojptaddwp/botUici2IGDhlMxd5eX3bnrD6/T6rya5dEyCzFgZ8HJgAZkk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FJyB+CMoSDbBx2/Fu1jt9UN9rCy581pCiAovc0XAa13JKc00rokBLoOdla3P?=
 =?us-ascii?Q?1iBzb3ukvRSFrRHhCnI9cLidG59SJxnzO1pIgEEnhMabCviqWYz35tIJk+k7?=
 =?us-ascii?Q?XU3vjKL2TMRpAjGbAJl26+Wi8wSZ8aGYDb925Clmt/Fw2kTBi8UW9bOEhRPT?=
 =?us-ascii?Q?QzehPD+HbZFNaV6YOtAZ50cCRogXVeCvq21YkWxapWPigouEqMTlr8kq0FbB?=
 =?us-ascii?Q?DOWfGYqtiRn1D4+hbhbLlyA5wGA3N5QsP+UDNrUzThMXVee4ZDLXeQnIEYMB?=
 =?us-ascii?Q?kL0H4EEsPzkrl0bcIeE0i/kR/waVCNojbkte97RXDf7l8bXE4HY5kpNW/2MZ?=
 =?us-ascii?Q?WlO4GQZD+yqBO93Em0WFszKlOlVeto4k37BwZc8HiMBBlHNitT2GJGJWxfPB?=
 =?us-ascii?Q?dvopbDX+Wv9rsQ8xlrs5wGCzOrd5d0GuRD3/3mL/W+3wPbaRHGjEPO9S/xhD?=
 =?us-ascii?Q?N7htqcs9jKpHU5kqCArEB+WR5iBreg0Qw780F94hyOjTalxLWp0k1HWfFBg4?=
 =?us-ascii?Q?5vOyQtaeAiuUjch6pdgPiKjqoCCpY7IT/U/I3Y2E5BdmVGoP/zNnjMgrjHBz?=
 =?us-ascii?Q?JWoXQBSOvOkJ+2Y7C7KUEHKN7kPrOGNf114o/DQhb+Rc7lW4G9BCxx4lQ37b?=
 =?us-ascii?Q?SIsIBxtdvq6rPGHki47r3jrVYC3y8oxTgWC8MEupRIQ2aRfJYlTbEPkg6qKZ?=
 =?us-ascii?Q?JG7r+rYkBqbiNbnxEj5y2CkjUTJmSyBDy8yT0vOi/ZIdv7A1xp3dbNBRAVts?=
 =?us-ascii?Q?N+/uf67YhZEGD4VECqFnty6M+mZ85iD9S0wtdd+Dw/1sJKVS6XBpoqmLmZH8?=
 =?us-ascii?Q?1x0/H6t42ZHxyJ73ZCpieZAcdXpNOxgMDoKw7o3dmgkLkAfSz3N0gH2vkXkN?=
 =?us-ascii?Q?FF8HW0BUsdO25zktf8U2rYgaUlI9nlITFkf5fJqPjaimlfzGfp1Y2bKpIBfS?=
 =?us-ascii?Q?TbD1jrncTDw2f3U+mfc+8uwKQAlKw80/azEPdjpINbm6lVaDY+linizPQuaa?=
 =?us-ascii?Q?oy7xd5J39mgkgA8SugeZx+oJ7AGyImn1FzJH1oJyCxLWon+V2harCqvLJEtv?=
 =?us-ascii?Q?ckQDc1VFIXnldKGUZ/mH3KUJ3fxQHyLAi3o+aBcBQK62tC1gs9AaZGVcVNYp?=
 =?us-ascii?Q?ltZOzvLn59+FXdfuYlCECCrSFzk6Nd4Hj4VTuFEUAYlWAcFcoQuIdeEE7PdQ?=
 =?us-ascii?Q?ZCr3aNANaiC6eFF2YVB84xU4xfSiMJpO07fDC8/fGZPD7B1FELoXa2FZnt94?=
 =?us-ascii?Q?dUrNlMwHz5xqd+lZqGIvPlPic2qsS+epOmFS4qFHiryCjDbwka/dBwDWlxNE?=
 =?us-ascii?Q?GR5J0I8hl2H74Ezmn0RIPhdkUq7NxOXbZqfty0TtzX9YO95Rna7sJLIQxZcm?=
 =?us-ascii?Q?hA5zsZGnkJljhcLuR2hbxYP8NAObHRzowHTMsM+E72g7gbQ2HrIt8zPg34I+?=
 =?us-ascii?Q?TC1kWA3rP6F/OS9/wIs3kAnGIQGW7Ij/uuYQQ3lu7uASxHlhmfkH/KCxEAuA?=
 =?us-ascii?Q?clCMeoxip9B2tmka5KFQXRl1usUlIzyBtU4zXlkk32GAmv6ENBEFIfbZGYVE?=
 =?us-ascii?Q?jIx0epdPbaL1hQH6yy+seO6rl2nZb570J20qKsjJ2TPbVOQ2LuT0J23QCIjX?=
 =?us-ascii?Q?H7O5O73RkYoJkBMp6s89c2osCJijbDwmFLNiAJb1wRBhEowWKJih5UCAy+CD?=
 =?us-ascii?Q?umv4nsVfIKkwyDSvSJ8+iu7RfX2Qj/AGxIiUfPaQrrbhDjw2yk7T6dyZP1jv?=
 =?us-ascii?Q?vwaIer/EXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aa3008-23e9-48f6-72ef-08deac3cd837
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:30:46.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bx94/MMtWJ71A27GzCcq4wbo4sYd4RtatVqxBEznQZ0ZQDoNlWdWZuoMFg93keRDkkO8ElCekgxy+N37XoAKLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9314

Validate user-provided buffer length before alignment to avoid integer
overflow in round_up(). An overflow could result in allocating zero
bytes and subsequently accessing memory out of bounds.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://lore.kernel.org/linux-next/20260507.smatch.iobuf/
Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index d2f7780054a3..d5cc37273d8e 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -646,6 +646,7 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 {
 	struct se_shared_mem *shared_mem = NULL;
 	struct se_ioctl_setup_iobuf io = {0};
+	size_t aligned_len;
 	int err = 0;
 	u32 pos;
 
@@ -669,16 +670,23 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		goto copy;
 	}
 
+	if (io.length > SIZE_MAX - 7) {
+		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
+			dev_ctx->devname);
+		return -EINVAL;
+	}
+	aligned_len = round_up((size_t)io.length, 8);
+
 	/* No specific requirement for this buffer. */
 	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
 
 	/* Check there is enough space in the shared memory. */
-	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
-		dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, aligned_len, shared_mem->size,
 		shared_mem->pos);
 
 	if (shared_mem->size < shared_mem->pos ||
-	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+	    aligned_len > (shared_mem->size - shared_mem->pos)) {
 		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
 			dev_ctx->devname);
 		return -ENOMEM;
@@ -686,7 +694,7 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 
 	/* Allocate space in shared memory. 8 bytes aligned. */
 	pos = shared_mem->pos;
-	shared_mem->pos += round_up(io.length, 8u);
+	shared_mem->pos += aligned_len;
 	io.ele_addr = (u64)shared_mem->dma_addr + pos;
 
 	memset(shared_mem->ptr + pos, 0, io.length);
-- 
2.43.0

