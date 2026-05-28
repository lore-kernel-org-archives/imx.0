Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51A3AB5C7
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959779; cv=fail; b=GM2H2N54zpH0XAt2EgPUDowpfMHfZ6KZ42Fu8AOMkCi9+coTGxDYTm+95KFagjLvR5Sjf4L9nbPC4GvtcAAXMgidt+HsLp/yMPoy2+il0+JK+C6+9mFoZIxL3WEKV6hUpJZksdTRn2DsURBDRNJyf8ns2eawHLWnLLyVFQ+1N8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959779; c=relaxed/simple;
	bh=rxqD3e1q1GNXMu+Vh7jbw/rrgbx3CdNH7o/DCo3ckpk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cTY2DsCfAMk9r/Q4UQb3DnXMCOydHAxSGVrY0XEG8FSBG0dOQXko5JQCY+TrZpFUOuzxlMgnmn1t7eFoojGbvaWyp44OFwh2DbYHfTqOahzV3t+4J2XfFFqch4qA2NqrTtMtLQuG45hHPw23XHr8M219OoPzfGgEmRAdjRhYN8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ObpKGNq5; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ObpKGNq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8VWTSs1ea49+3jlx3ANf53NtdsxmpdaFt3vCI2EhTU5eusM/JfEQuocoOaUI+ICNMaPH58dAovcIfhqlp7kz3CLdeY8dLpMwglZEuf1PUqh8V6petaZtGmD2P+DFqr3gwFG8NpkUIWVgySWUS6/GNUR0F7xfqQy3P8fZ6GdbT/UbQc0BMyKghH6emQduBhOvJwtGjBsOxG2L5cQ8rg0sRyKECHiUm95qhQpxzF1oomwjBVM80aGvqymrLMBabRjhpsxeDsv2oqWUtwNj4RwgIJx6dE2yvCn4vk5gTQrH6Ap8MSQZaj21MKUQsfElTdPFQP/aMxJSpF+4h3lWOn9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvWxUnKPc6y/4RXXBCY5M89gx0AKJplQatgQb3OAA+A=;
 b=NpF0AnTCgj9dZU3iauDemDFBSJVLdQCSZCB1+1/S2aNHit4M8AnhgUqWB6/pLY7tnW1qUg30IKYfYqxoJBmtS1X1KYrzPHhRRGiNuKGV9+8C0n+rJq7mBIULfvEEGMqYmBuuBGIiUfx6nQ+zMGYTn4R7msNwaf8GVk4y4b1xJkFy2dw0Y6YBVDDCjqiqC/eMsUEDANyyRtl3EoR46HYjLP6MghijHhRhcVfy2TzDeiZ5WuHzbs/Nt6RUQ8h3Bp6Q1qCm/hcx8cSvI6VQfJvO4KZ6Bjm3do/JxJkxD+OYwKQ00YgMwsHt+NfwA0gMxqFYEyRoGXW7rlnG2d+e1QtVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvWxUnKPc6y/4RXXBCY5M89gx0AKJplQatgQb3OAA+A=;
 b=ObpKGNq5cJQp8X8wBrcAy8xcbIH259WOEc9p7RdavLth8uoqlyCqqslME0JIZoufFc+rkSAnZnzcqBdZwBIQcG8ReS9uIfcjBi2kKSNKf2Z5mQYaBz2KSmUl23cWbDLldc/Bp25pb0rBldl/LZt06gFTgtssat6SOTP70sQlVOKmyksJN0XS5f5AaTbvA/erJSbLxvXcZpeFgvju8shIej0Bnv1PQyE50XVHnKnR61euMiZij2wW9VHPsizhXFE7HxF0pD1yYLYq7rnJuvM7OLSf3VlqcvY+6xiZ1ys9B5oWwrW2MDUWP+XsPTwfiowLRIvwIIXlWdYNbPXY+k+gyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI2PR04MB10860.eurprd04.prod.outlook.com (2603:10a6:800:27f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:16:11 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:16:11 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev,
	frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH -next] firmware: imx: Add missing return in error path to prevent use-after-free.
Date: Thu, 28 May 2026 14:44:46 +0530
Message-ID: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|VI2PR04MB10860:EE_
X-MS-Office365-Filtering-Correlation-Id: 389cb5e4-f1d9-4851-c421-08debc99c267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|366016|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8hwpAFWBMIzCQnT8L96rnU64BBb739tLgfvH5E8qK0OuLpdG/2u6jJz4dfgKk751PSUKygY+VMk4SoS40rA9ehkwh5uj1wNmExiRErmAU82OQOgpauVgKYEQBr1BcmJxuuv2iAqIfApeEYND6I7Bhb7q3RyAZb/IB/MLeh8iZYZa3BRoMCA4+QeXGY2yuMHiAgRsoaJEBVf6/VJWGTvyk+pRHYMElv2mRZiUcQTP1pGo/09Ns5umpPnAf+jBfC3ygaMAnSN3wGVciD6psh+IoYH+r7LlBrIorYmAFjyAmoakh1/ccmLRWVZOj05n+xxvw5rf2sMQ4d1HDvy+BAOq0Ici8skKM3dBz3MeniNdwf8JwbFQl69cL/5mkHv87HLT54MA6L37+IAAqClnhujREsmCHZtJw8h5UwN9VT8oxNabq4ObbMgXVJ1frt1fUAvmGaBVzUrnsg/LgHVJ6DTw536b0gcOk1LNOv3agYJl70lgyaan6CiM3vVfrWJPvgxoYhH6pR+8HhS6x97nyvTie6d5vBYxXqDxmSz+KKQdMGL/5cRnYkH+uwSyRHO5CpXyGC7F71OjScUmOyzrreWyLQcy1BsvoihJcvXfIgEDid+RO3MmgLmmGAgSvV73MVwB79vB5J5l0LfRqP5Ruq30y5maa/r2Th4WKHkfyKW6w360ha6e3AyHQ0nCsLyYzoowQgSjV1kpZJrh173L7sJv6RiQ4t7TC1D0bVE4KT+CYH+80hVxNkumwjr/mfjOW79T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(366016)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dFeSJPVjW851guT4HptE7eEIanx1d/3Dxwwstm/VM0VD3vA1Q+rCH7qMdOls?=
 =?us-ascii?Q?zsUuvgMWJ7hIfLSX9agmj+vIr9yJuPwUOUjTiNA/hM4Lpu7Vp3ArmVogZWYJ?=
 =?us-ascii?Q?H7Z7MRJPAKiwnXCzQVylIZrmBEP97dVzNtWRtlWVxquy1E5VRnaMkX+ZPMLB?=
 =?us-ascii?Q?YVP9HDTpbxgzQ5DCZdVHI4tXVaDvU2LTIoB7VP3RlylkrNI7HUZyoAlt92cA?=
 =?us-ascii?Q?8Dte9insumBpmfNIptTF/ba+6dv0rpwfXaR4cjoazorJdm1SPsm9ZNTtnc1X?=
 =?us-ascii?Q?YTuu0alVkd+3pVaXvaTa+iONP9RHpfZEjIaDNXiUpOw+BF5zyIM3TwoajRkv?=
 =?us-ascii?Q?SMkSTPfMi44hoXPLhoavhh5GhcZlbsopop07i0qqAz9SwrFG7Vs6ilDBkUBn?=
 =?us-ascii?Q?th0OSIHw3PrZg10RP7PneYCJZeHALYd2rvvG+Z+VZx24jBiRTdhs0g5w44X0?=
 =?us-ascii?Q?UyHoLpN7i69+wdqCEneoTVDiUrABUGGd0h0F9W6i4EkhjX2gnBDB/7APmNhm?=
 =?us-ascii?Q?cA9Ifi0+2JeF9xwDMlJefu4MC+bTdWYp0k7oWcP751LpBEZgtKk8FKB0AUZu?=
 =?us-ascii?Q?NSjxlhqH/EklQnKvC2yqNbGE6q4TAI7P9AHmDDjqFRFmBENy0kN21RBYEu5W?=
 =?us-ascii?Q?HCJzyASStX27CifPMlVj4x2fa9fxFA6ynbUg88vGKilenfm7iP+bnyqd4Eo+?=
 =?us-ascii?Q?H27v8wpt0peE+2FhfTsYkZIiZWMSKmj6JOtKGalKInXbJi+H6S2a0koWGX0B?=
 =?us-ascii?Q?EQtoIJdnkoUwsll4+hg9mZYamQfGspskE4qx4GJ/Zf1RtFrE/M7poBf9O90G?=
 =?us-ascii?Q?Nc4F0bC3nP6xucbR6v1PJYqwu21snO1V1ILggdYOrBcsoO1+q2c7vETF+oXM?=
 =?us-ascii?Q?0d8HYqyAtYT6tLdVQ+1PyvI8FMOG22jXlHEqJ+OkBuhCYLTaGsAfLieRfya8?=
 =?us-ascii?Q?iqqoqgBCgWSSVLrSzbQR2P0tXVsYuj5zbb89QHnobZLT1A1FQQ8XYPHS3wZ4?=
 =?us-ascii?Q?z0uID3tiNh78Qfdq9RY0v+IAn3G9WpLcWytk+rBPtqkpzEGrmh11iybAk7gC?=
 =?us-ascii?Q?UjLcyQtNkZdGCXe0JBMk2nxRllv0609CQMQaSzrdaB2ewKTWtE/RNP43YpHU?=
 =?us-ascii?Q?schtyoGTyHOf42tYOBms1XW04oz4WzV8zRhkXKzHQI5TE8zJQyAFqjmWHub9?=
 =?us-ascii?Q?XLvkJFE3m/XUAZuA8x4ErED0VI8tbc5jToWD0VhCA8jAEhVB/eXmWqYBH4Fg?=
 =?us-ascii?Q?EJY2bJnjQOYNlqqqjk8oPxcNsx1yfJp2xlL7vCBKr/I79n9zQMkTnZ/dxSLM?=
 =?us-ascii?Q?GI8JInUVGv6XmKLI8gsqCk9+vq4MXhmhhCqG3dnPbcdMKr8A0QeGNxqvAhAx?=
 =?us-ascii?Q?W9R1GqjFdwHOvtUVx8Qh+YvAuMtXbF6WaVYXPgdfKDIeFrXfrtnHLl7PWBB7?=
 =?us-ascii?Q?6YcfVZ7wk5pVQ5/DWOAxdB9eCA6J3CIbKTBZDlhNxZVcojO9reORyr8h9sHQ?=
 =?us-ascii?Q?pRZokZdNPx0O65rSMNT9kzEyOPHLPg4abNZkS5+93vm06dXSOtZZ2237nrd1?=
 =?us-ascii?Q?0u38Am20NTl7RluIW7bXd4CBf3+r47PdL1+GJBL226Bx+nfw5BK7TE1y66Z1?=
 =?us-ascii?Q?3h6E6j0n/O+BkcuELS5tMsEQWY9vUce8sXg2SE4QbwyV6zX8C6r6ek8RpbBB?=
 =?us-ascii?Q?TrvebjuwCL01kCWMCT23iSA54ROFtq3eAr64UXTmWeIIwcO9zv56ouiYt1XM?=
 =?us-ascii?Q?DgJylkg7eg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389cb5e4-f1d9-4851-c421-08debc99c267
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:16:11.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3vVN96Z1IXIMqfq4qGu/4oAYxCkvuzyUFMBFH/fDEO/tGEJ/2b2kdAHICcbsky6zFqEv5gJLx+CX8/QsOuN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10860

After freeing dev_ctx and setting *new_dev_ctx to NULL, the function
continues execution and dereferences dev_ctx, leading to a potential
use-after-free. Return immediately to avoid accessing freed memory.

This appears to have been lost during merge of the original fix.

Fixes: 3ae9dcce8400 ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9327d47e4312..4914d3b6bf0b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -486,6 +486,8 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 		kfree(dev_ctx->devname);
 		kfree(dev_ctx);
 		*new_dev_ctx = NULL;
+
+		return ret;
 	}
 
 	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-- 
2.43.0

