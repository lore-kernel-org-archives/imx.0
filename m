Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C323E358
	for <imx@lists.linux.dev>; Fri,  8 May 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778220101; cv=fail; b=YISG9H8rb58K0RY3cfIQeTW3acPl/pzDrK667H97jiqzruVpOUgnwi4/d0nl8vmT6BVmVnoJqwxItm2WY4ADP/9Ap+vLaXyuaV+cdI+ODTefa+FHEFcDZ1AuIjYspikWlMvoJa+6+VYT+9fleQ+x0ys3c08G9RYqhygKNKHzNQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778220101; c=relaxed/simple;
	bh=eqGI3DlmUmmJbc7VRq2lCFusWeyqyMNSqGpVIF1cDpw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FxJmvohiKfOUPA6J6Ge5mt3FBDULaHwgdxC284aE9J+aIHiuEfA+JHooPxyLEWI8tZsAAsokdlGgPK3wE60fpMhI+g5jor4/sum6+nvrOr2YqOGZgWj6E7N1eNnVIPBEln6qWw8r3ov0dFx3rLo68eOlKgouwCeUV5GPSrZalFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iRlvsQbX; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iRlvsQbX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku8QEMavUYYYhoHkQlTHh11eTtbxVMzYOKkAaEunzUI7RNvEHJbAW3Pkb4emL30eMhEh1Qe/DZVhf6L26GkW7nWYRkmegyZDzy41X35tBTN5lCgKJKCz3Ef0gjKjs10fMgwtmixXDRf8vj7fB9OtFEEkkzcDFd4fU3MKu95z3r/meUz6wXO+Zn50LRMqTHHbUj6wrh1fGx2QYLjDel26N0J9wicGaRLNLBsWLoLUe+EVRQWloq9+mxvpLDf6t+Ex0s0R7oOhX8b7C6Pxy5RvOcrbA93zrI6FS5PwlvxjwXDJUpvZPoX02KAq0FELzKyB4wtvpdJVjfFBJ732RHQ8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In+AbJhz4bVrB/FLpOAKfBRCEQ7lMEC1xXHnjcfnPWc=;
 b=r+rwSB/8aohpsEQ6vrqS0mbfDxkVEzX54zsHnEEwZv0KfnsbnUNqcNbnPx2J3aZPi0h/T3l5ocmNFnaxE1Yz8dcLJ192oJ2S8FSgV1FWsvlwopUQ+kGKLHxau/mSUg7seP4IOrL4YERUoyTC3KLQbj2oCsjsxYIGWcwMAoEdzCvl/6bH6phPZKiBkg0RcaLpvIO7/Lo4DYlCKxV87EhuksBlw1ZMmrHhtVxoIsZVpJvweWJJKFE0Vu0GQCKMkza33RxeZmTVrk7m5eU+gPM3JWGQ6DPwmJ00W3sA1KwDdiZjwKdD5IIDM8seNTkhZV+RdOriI1o13VzvGU/hpxN2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In+AbJhz4bVrB/FLpOAKfBRCEQ7lMEC1xXHnjcfnPWc=;
 b=iRlvsQbXR3ZXwPxZ+f2FdkN7phStBKJMTIT8MwfVssP4AjMu32E5m7FXaLLNutvynhFlnkbfREYh1/gpvTCf7Gh2lG87AU5Dzbndw33GWtVKbVjk1lSqw3oQkzdZRdLMNSoj6wak4l5sNZOPJ66FGB2pIGUZ1iVlZgGvzOV0FixHr/FWdIGXq+qqjM2Mbfz3jatFKK4q/xBqifN8v+9ZhuxP8MDTf+VO45nZStnMs48TqUmWjBUU4QQKnEdF7xOiaTP8cYOi6suJFAeQdnkDdkBYib+23bBZJ59o6ylYy+W2r6TetN1nsrNBnLj8mAC9qMdIztzGnuOyjM7Eve936g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 06:01:27 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 06:01:27 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: use kzalloc_obj() for allocations
Date: Fri,  8 May 2026 11:30:20 +0530
Message-ID: <20260508060020.1840838-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0225.apcprd06.prod.outlook.com
 (2603:1096:4:68::33) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c71e625-a795-415d-266a-08deacc73df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6lkEU2eYYGGTpaojL0nwjd4r9zxpmoSK4GRY8UhMKILfl7aK1C6nePK+4iLOHBfgIbCu65TCp+Dv+tXFd4W2jrI9Rn/gCW0WckENY/74Lwj/q78WQ5vicyjB05crqUZeaQz4fr/f1AOIdWOIDXpCKuXXOADVraAQCBcJcPpwKk7EbYKvZd0EY5I/GwlSUJ9tmpuxhhu/PKie+8MC9B94JHwTIPMF/WvpNCv2kue+dYVGSSXV7yR9GTcYhlT+6lgpMxXFjKF0ozjilyLay3ZJ2s5Udmky574G6MZy+pq1xCtUc083CtrciAhbES0ERm9zggfBMbdn9L4Wn2ddlHirWrmCBxvbjH2g1Jfh8AzwCTYbgRFmYv3RgxoM90fXdcq9W5PKY2J+n+KzlGKHzQQUIShAcozhp/ng2n3ug4qjK9tKX6KOlhm67a8A0ktqWUDkDtx9NRy5BZTxt3d+in3eZ0frWJevRDkRSA18Y1RA7IixppYV+zYRAR2XqeFipinyz1fDmUBZPZyX5+Sxjf+0Ou2Y6IOBNmOUOypSeW/+2mgW27H8My5W0PeTd22LuyzWaYrb49O5p1lvZcY+C4+beJwF9zU2YJ4+d+aWV+ojBksAtDqC6goXoWqxpK8Ibe0TiZ2ffntkmN9Y3k6iI+gYHsC+xwW9qnamtz/V4aieSaeLw8AWSLZKWfLiYYkKR4boP7B+vmyeAObQxq6DpoReCRUkOKzSDqssFptyqYtClKy3lhb+S2y0a+ahVbTpON7o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5udC5r319XO2GZ+bP5oCGcfDHxDvFI1lnMFV7UekV+geg87Kg7P9X5L+oLif?=
 =?us-ascii?Q?nwEZ2NcNDiz6uobACkk6EXJeZYhXW5oHs35MmbT3aV227JtZZsCu1Kgf3GGs?=
 =?us-ascii?Q?rRGBeKFCuM9zvUMXg63cRjUHtxYP1Fs61jwOWxOUzySS0NSKtQE2hN0Y2W2k?=
 =?us-ascii?Q?mBD0Bz0WqCXVZQ55Sdy1xJ8P5/+m9GP/eNOw7WQORYX4D4z/qjC58ERMOeT+?=
 =?us-ascii?Q?Zbi/1IbRU1SBIbO/zi4E6R+M00xf72Uuy7T2dh6EAFVp71ewd9WsCRZsH5Aa?=
 =?us-ascii?Q?UXs9TIOUztoLX/OqRvmamO67SPABjW5xcay+lI+ZYUjEQy3QdDF/LPMewRmG?=
 =?us-ascii?Q?d62EGU/hJV577F8nAmcKQptXlWX8G/g6aAU+zogxREaMiyGRxbsO0zMzx4u6?=
 =?us-ascii?Q?uX6CXRcKo5+XK05hdGsJ4npte477q8F365Arfna9lvkrVrl3pMbVxsLTDRC3?=
 =?us-ascii?Q?QED8rkPCWxyAKM3IN6MGthka2AmOH7BH9m/c82TjGpiaOyKSWMtX0xkhpe8E?=
 =?us-ascii?Q?9CuvjUAyLoIquYZfRFIBx506+WpbHmVXCOXYqMzzy3uymBMGbZZQkA26lBfD?=
 =?us-ascii?Q?ILULhkYj+KUMt7tSC7rtKwXTn6d8WdtltFvRWaKfoQQm8Ujj785egWDY8Qoh?=
 =?us-ascii?Q?YFOeRciw0EkshqW6YgBLy1jj4Q27SOfsvs7BwtAl+m7jurRZS29A5hCcU4mj?=
 =?us-ascii?Q?WDmkGbCqxgDw66daH3S56bbRAeKqNwSwwstS9C4gcnG/j7ZvhJ9Ws67brarV?=
 =?us-ascii?Q?nP7/22oRRFshNAtsZ3w6q/EFqATLpC3zSHNvo1A78TkdbBqCSX4/U5yKgiVA?=
 =?us-ascii?Q?wecEJnXODMDic10bE8EvUPrv0Mn9xKr/kNOpBkULOYMsa9ybN5EQhHLBay6J?=
 =?us-ascii?Q?zS9jULAqvWLEil/qG8uKvIQQNgYimOXKaWFrkLp8ujxSKipDQS+7VLjcepjU?=
 =?us-ascii?Q?99/hRDJiRZneVvHEkpZ083xqIO6nbgO5SB8n6VAe4adWT/FnYEi3CnONY2p2?=
 =?us-ascii?Q?U8eJPrgD/3+V3nsF7VYILE6q5d88Pps2KURA1Y97wmXxAu54x7fg/UN5OZ4t?=
 =?us-ascii?Q?ebCAnnc0Uij6E0Y1g3ZztCedHIyMrInYzctKap7y/ZNXpu+WyLDSYYKXZi36?=
 =?us-ascii?Q?pIgtflOI9mUUrxtIeo5qY5uwK2Kmlc2wjfei/nzdgs7l6t0p9XbFs4KB50uI?=
 =?us-ascii?Q?r6USommBhPjbN9cFPwiMXRsm2/24TdCZIuX/wEKPII7q7cQruyWGkb9J52cG?=
 =?us-ascii?Q?EPsPu1uUunHYiv3omnMAYNm2WEXrSXnljhUsPKV/PJG4arqybA/rqK+5LP4n?=
 =?us-ascii?Q?jwFt5psb3sjF1jVkQ7peiEkF2iZCZEQaRuL5MC2S/puC2Wil6yAMBYIHjp9F?=
 =?us-ascii?Q?SqoIUZndNm9vjUxBQOWEH+O0KxWI0N7k718udv/acEEPImJvKeJoHEBmEsIu?=
 =?us-ascii?Q?un+7cUWtc6xV0su3wUXhnC4EUTcFRRT0+iuuNDSbjoF0mByZNCWMwlILUvMO?=
 =?us-ascii?Q?PiEEfUzZMi9+y7jotwnxVzl2HCwUgbU0OVXq2VqmvgvwIqkPJYANY6doqyIl?=
 =?us-ascii?Q?wcack2kn57ey8WRFHCo0yRco4joSA2qaqDhytPbXCe9DnqRHmFFVvHu1qrHE?=
 =?us-ascii?Q?/o1qKbz5gvQ0RG3F4tHOPR1/rWKUj8l6ra4D7LAT2+4Iuaja6AqIVAeJ9Am1?=
 =?us-ascii?Q?3L6OHNG2tJeiu+UIpddUMAqUM3352SCIfwu4l+OdhGBV+Tq6LgL/koZ58cA/?=
 =?us-ascii?Q?iXR4NHYJDA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c71e625-a795-415d-266a-08deacc73df4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:01:27.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+kaiWQrgGsdBojhB34KSj6kdpp6eJXHaI0QmZk8cp+b+jdNNuvcN6jTCJV2w+IzqbLGJ69/WGyHlOTnsR/yqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599

Replace kzalloc(sizeof(*ptr), ...) with kzalloc_obj() for object
allocations to follow current kernel allocation style and reduce
boilerplate.

No functional change intended.

This is a cleanup reported after initial merge and is intended to be
squashed into the original commit.

Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 814a1946d1c2..ef85a0336693 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -379,7 +379,7 @@ static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
 	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
 	struct se_buf_desc *b_desc;
 
-	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
 	if (!b_desc)
 		return -ENOMEM;
 
@@ -464,7 +464,7 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 	struct se_if_device_ctx *dev_ctx;
 	int ret = 0;
 
-	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
 
 	if (!dev_ctx)
 		return -ENOMEM;
-- 
2.43.0

