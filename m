Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D9334692
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115053; cv=fail; b=j+gOoRnluV7TO/6sbIJoEtzIQ4OM7ktEmYjaCEP3mc1omu4nwsZ2FnzGPfoRfI7hz104x6u00URKnTu0TMLje22zI3kZQ06U3rlLdRCLCODDInNXWWz7tXursj3JBpqfyNbBBIqVnzvCcTwyzt/pF/N+SJeIKLFepq8xTiZQ0eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115053; c=relaxed/simple;
	bh=V0Qkpki5C8ZbEMmApUmjEeJbgBXGfAy0CbIMOyoi2mo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GhftEtLmilHxjY2lVJ5TdBzhSjaowWzH+A3TGcWiUdsfSEk6+uceEHZADl0unXtzMY18P0drDPAlzw3MnZrWG82uU77wm1ByDq/Cm9twG5tgzWvah7rVmLFLpHis1QCKITa7R3Xr/D0/uHrVLtb0/KpuF+AhgcHxfkBZeL0BlQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=woOsWdcY; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="woOsWdcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOEm+4pWiqx1lEbnpKmqoOhQdqew4OBf/Q8z5CktjFRvB1Jl5+YOSZS2JJ6doZDe5fLPuMZhnzGLWgxyThZYi25U0v7P+9Ru5FL7aHWJGdGmurZ7Lc6yGDCNErJKuRtfYCgbILjUH/1bY6LPWD+VSVPhPF47ox2YaB9sU3fAqcZN0d4CotcffAiaw+bt0iNQaOGH4PtIW197sSQiIOjdMGR41roOvlbcjJfXLG8sPQaWfXGQ99uATpoBtIPm7nEYQHGYktmlg71GMUDypZQPePJTJnCjbag+n/z/2fMZrVfiFbDLydnP55VPynUuVEjKX6XbUrGABXK13HZPwE5brA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXskIeuBN0Mw4wP7doqNnVgFJFZpnqoFvt9aoNiZ7Jo=;
 b=nQZydRYLZYXYPW0P1aGS/nxw03YTD7hdavx++/yMAcYrTWQlyqjN6u8EQBGwnodLJKELd+qdAR2BUeHaiDfWwOHn6uVIiWuNyp3etijngPayYGK4yHPW3eHlPRT4Nii2p/8ZpfetnAhQnONkk+JXH3UK9P2Mrj3sPF05Jldl13X6gp9+WUUhJcrS83ktGfdbOzPDBNfldPFqIxTfDD2S5QEULlTgUWazCLLrNoOWlqG/b8xuad9tuUfCG0DFQrPkXfDQQaoNB5I61zFiN5UaaRUZlGvyO+kmAMHSojoOsP2xCCz5LL+fjuFuj+YgmPR8eJXIvSD+tEvfshQLzAwrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXskIeuBN0Mw4wP7doqNnVgFJFZpnqoFvt9aoNiZ7Jo=;
 b=woOsWdcYdT9r5ht8bcPCW+8kaPp0r4nTbls0AfyNMmYfmSuCCd2Zhja5T4ceKO0AJMi7fiRqXavYPkoFK1jS1eWZugh+Xs7yL7B5Csqq2kQfssfC5tbR6NxKFaoSQ6UGi0PFGPF/IJB3sEo9fS6MrOe4AkQ4Xq1CvbHo3Hlnm5C3gPKLrZhfJsqhhOdwwOkBCKtxIQ3ckTDRAcLzGq0CZzNGNp0bn6sS4WoPup706nHNOEnfCMK4HEwhCswaajn3BJReyg+5WSlh/VSdxuJ8erY/+xpcJQr/l7ibwd0Mm9ui/pt3vQnmZR6gDKl0QIVhSc7a2/uXFWkS5fGsTUPIcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 11:30:47 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:30:47 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 15 Jul 2026 19:33:59 +0800
Subject: [PATCH v6 4/6] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8mp-usb-phy-improvement-v6-4-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784115243; l=3222;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=P5Exx9+4r1UsPRUwYQCsYCLak1Kw4gSSv/scgAMm1pg=;
 b=39y2iECjGpRHcDhas3caiUjXfWYVoxvBu8ypK7OUzUDXgFn4jR1iN1Zrgv2M5/YAdWGjrsbNH
 jU9qdXrwjXzCgHvx5Ra8aSEt25vWq+FYxwH2stTd+PaIjRdbw3sceBj
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: b037604f-ddfa-46be-b0be-08dee26483f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zg05fUA9hzyQuaE//1C2pjQGAp8sVNL9sRdIzSYsl+cl/B/Co1zN32j5T1an1Wa/HGCGqAcj6hP2Y2lAvu84DbvKfuayOBpP4Z+rtjXg2mnW323mPb+u0RaTj/72NLAotx1avi4PtOF+Iths/YAOJ0BIHtySfoGt4ZeRboOPzYBrE7M4DPVmK4WjhC11myi6A/fYZ2/JXnv7FncC7h1/gMvl/Jca/7J4EqjmyVogGK1+N5CklEgW5BkpAqDPc5rPE9qvQou6P3Xjc76sWaB003ZPkfSiMgQdPjzXvFLAq5Y1+50MxIVs6rgOYv/DiTm4ztl5jqo91SqQfEJqDB/77FGc3jKOYva+dKVyNjB/LW7VUoXGf4SenJdFtbOG9LTKBrz9o6TULKAiipxhO3dYSE7C+sto+osVZZfYJFfGKv4QXjRR7h+DdIesLrEJ8BNnbg9nywrMx6Lg7I00L7w+TDHRsOmooObRQJ5TLMvmsrriel7HMk23IlbQ5iakCz4IFlrnhpGvq2S+HPpYL+P/UnX7ItfaN3uc54QeGfrdn/zcjMWOmcXtUuCSzfgdnaHOwmTZxH/SSvJrOJjkpdaIPx647s3LNBRTiSQMQj/zdQ9wNHs8O07YrJdcTMBZk4SLKKDlQiv+qVMscOD86i6O1ACe80xiBUD+f2qoabmSdD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2NWN0tYK0N0NHhoTk1tYVRXc0d3dHNZM3VUeWplcjJ5OVBPdVBMdUNCam1v?=
 =?utf-8?B?dkpFRlA4RlFST0FRd2ExR1pyMCtHZmZockJEN3o0K0xxNFpZTUxUTTdFOFlR?=
 =?utf-8?B?Wk9IWk92U1NrclIwN0dTOWYrQ0t0V29qMTNlaUQvYVM4WjU3b3FUUWFuQks1?=
 =?utf-8?B?MHBudjBpUTkxUUE1Wk5lK0dMcXJibldUUndWd2hTcUl0RTJkdFJkUjY5L1cv?=
 =?utf-8?B?OGZHRUtPR0pObHkyeVhzK1Y0ZE92RDg4d2dqcUZ2VFFhVDRjZkpzMkhSWk5m?=
 =?utf-8?B?VVJCUWlCT2ZpeGdxZUVLbEhycGN4SnNOQzVGbFFmZ1hJZjc5cGs1TC9GcmVU?=
 =?utf-8?B?bzJ2d3l0NVRNVngxYXd6R3dDbjlXYzlJc3ZhRWY3UDBNbG1tbW9XM3Z3RmNZ?=
 =?utf-8?B?aDludElSUmxIRDl0M29vd2FjYUkya3NyY0l2SW9XdDkzZHpjdUJ1Vlg4eVNB?=
 =?utf-8?B?cDZ6dVNIVzRGeDQzMUcwVmFTU3Y5b0I0L3krNFJXbTRUVHl2WDhMSk9FM1lo?=
 =?utf-8?B?cFZjZ0lHQnZQQ3JEQmpEaWQ2YlkyNjdEbzQ3ZGdRY2wySndEZHJyWCtSMmxq?=
 =?utf-8?B?Vm5XTlNuMjVCaXhLTzdGU1NPT2NRL3N4bnJ2cmRnaW1McVFIZmFCcmNscXFS?=
 =?utf-8?B?TC84TkMxUGpOQnVHdlFyWnQ3Z3BRUklSSGR3TzF5ZHYrbUZqZytyVUZPeFNk?=
 =?utf-8?B?TDVsTUFFRW1WemE1ejM1MWdrZGJDMk5uejRzWHpWZllGUGk3bnMvWFlzRjlr?=
 =?utf-8?B?NmJ3QUVUVUZHQk1WTFhxNkdrWHgxeE1DYWNUM1NJaXRoWk84SkVtVDhkUWdB?=
 =?utf-8?B?cGhEaHg1VEsvclhYK2R6cnF5NWFSTnZWdFFrQnUvQUkrRjBZS05wRGtSdVpU?=
 =?utf-8?B?aEZxRlJ3d2JieUlUcWE1NFRFY21XalcwTXpIMng2RjZxdHJnL3lZbExIam9u?=
 =?utf-8?B?VEsyZ2ZWVjZOMXQwVitmM1hGOEt5Q2N3dkUvNlRCWS9jUldTU3EzUTd6TXFZ?=
 =?utf-8?B?ZzVRWjQyOXFVRFdLbzlQNVkyUXhEM2YxYmh2YXdFZVF1RlZibTVhZlJJc2Nv?=
 =?utf-8?B?ejRDVWRoTmJMdHFUS29kcVgrOU9GUkNJWW9BT0JnWTR4SlkyYTVHOTBYWUN6?=
 =?utf-8?B?d0IxRmlBYm9NOERzOFVCV3lHZ01ualdseXZxY3JLcXE3Y01xM0s4N2ZiczFR?=
 =?utf-8?B?cmtKYjF0RllnOVkrTWtNNWZHVXBZeUtYZGVUYSthTG9xNkVoWDBuQXRCWS93?=
 =?utf-8?B?WWFiU0VJZmhrTjJyYkFTNEtUVEZXSmt3b2RLVWlOSnFEaG1rODJaY3J3bjA0?=
 =?utf-8?B?UDNwMitzdmdmMEl0RDlCdDdSYmdUQWtTejZJTTBjaWdOTThRNys1eHg1bVFH?=
 =?utf-8?B?OUhVYkh5SmVGTFkyaXVSbG1BS0p1aFhpaEViOGZ0NkE5SFlnYjJvV0ZpM1U5?=
 =?utf-8?B?eW5ER0Rzbm4zbWpwaVB6b3Jta0lwUytJdXFVdlJoaXpvWG9BWVpsYjBTZWFO?=
 =?utf-8?B?djZEYnFrbXBKelo4Z3hsc3ord2RNM3BoNzJ5M3NsZXZ0Ni9wdU9aZVZZMGpx?=
 =?utf-8?B?bENuaUNTY2I2V0Z5M052YW1VOWx2SlNRV3dxbUFZUXNaUFcxaW9MRnFmbVk3?=
 =?utf-8?B?dzZXK0dQUDN6cFV2UytmL2pTTWdrU0FrYnJsQWY3L2RiaHZnMU9KTEFIcXl0?=
 =?utf-8?B?NGI3QjF1L0ZFdnlOWkdEVnNnVENYemlWYlFKbDVmdmtPOGI3SUxBSnJtQ0Vi?=
 =?utf-8?B?RVFQQThwSFkxdEIxS2ZQUkNmbjlWNjhPazJMdU5Vbm9EN3hyWXErdlRaNEpV?=
 =?utf-8?B?eU8rT1lzWU8yNE9PZk1KcTl2dHU5ZENjbW96WUpNSnNsUFlhekxEa29JbUM3?=
 =?utf-8?B?elRUOHcvOUNZWlc3SnVyNzBYUTZDZnlaUVFOMTM0UEtsRFpaSnVhcEFyZzU0?=
 =?utf-8?B?SWJLT0xpVVhMTmlTOTQ1dnhrZW9IckwyNTkzMnBIUDhZeHFLZlg1cUxVWGlG?=
 =?utf-8?B?bWhZV1E2VWE0VFJQYmtCTWpqc3RIMTBJQXUzM2hCMWVPUm85aUlOR2hWWFp1?=
 =?utf-8?B?L1NpZGFEdkUvcHZCM200RVhtT0dDdFhrT0V3UGxCakZTR3BnM3VDNTJnbEF2?=
 =?utf-8?B?eDdtOEFFbmJLMmJoVmlrcHFwY1c4cjEzU0M0R05udUtoWGZIY1ZtNy82L1RP?=
 =?utf-8?B?VklOM04rK1JjMDFkR2VPYnJPTFhNVlZsVmdnNjd0VjNraExWS1VDWC95YW5R?=
 =?utf-8?B?WWx0U1c0Mjltb1V2SlNPa21GRHBTdTZGL055bk5HdnhIWjRZdGVIdm9OM01m?=
 =?utf-8?B?QStKaVV5cGo1TDdQeGI4QThSUzRLeHk3NlMvUXBDekVjL3owdkJTVEo5UHQ0?=
 =?utf-8?Q?FjLwwSUz6w8cM4rwuyOQiofUWcw+SJgZcyDSU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b037604f-ddfa-46be-b0be-08dee26483f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:30:47.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/pnk89jqzKqYL7iwEdQ2BBbeugb+yLUKYAk8j1ghvsaMQuCYJULrzcW3c6pOmrEg2sLl783BW0DJF41Ze+IGu8F0vwWAJIi8Tj32uAv+ppX9IKYSfKkm3zWE5hW4aLF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - add Rb tag
Changes in v4:
 - improve commit message as Haibo's suggestion
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index bc804d2b5aee..79b3958ead2f 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
 #include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
@@ -56,6 +57,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
 
+static const struct regmap_config imx_cr_regmap_config = {
+	.name = "cr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7,
+};
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -741,6 +760,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -762,6 +784,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1

