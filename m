Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB137227EA8
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804996; cv=fail; b=hs7HHMI2+rdMyLRvHl0zC1ClmT0KzPSbVCLeFdPvyrwz6+lRiXRJ/EY/upjCaTCfmxctbQaAbXLQoeLF8m8ocE+lftIZbX+2fActS62JOMn8N8+mA5XWO3+P4V9Vy/uAWC7pY0cbN2KwaqPBGmoywDyceMTHNF51Dzx8Dvfw41o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804996; c=relaxed/simple;
	bh=ak5oF8lptxnvoiFBVsTd2rvng9RdoaZOMI4RKWEJEn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjyKQYoZHZ5cZTVVJalC64RdXhuMwQvVQnYuFqpQ9qzxgi3HiVU5hzTIw/396ZoqD8h4t8F6AFbklD5kdtPHfZGRVSd6X61WhUJ+ABMIeWyOpvBmNAH5bZn/qbBIWPmMaaTjU1UaUmN/NG+5YdMjKl4zBRwZcaiRovOWhQcDRkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lri1bDGA; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lri1bDGA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agTEHzPBW1aoHEmuG8wekZyOwEXyAjR9yOa2abxP1XgbUZSfy15ZFO8fAidh75U7ZJkKtZYKtge1GqEKtNKlkW1CRTmeCIseMONxEPv7WI75bbSmgACFK7m+xGXk2F10LSjf1/3cHmXrefQjhS6CS3DQd4zPMfyjQgFdYxgMMb6HVmeERLWxb32cgwKpCja3N7LJO0RBKSKDX12rNwb/n51QXP7fmVgEMOyx4rNV9GkK9bvN4doUQAygaIQ8n1Q+DwveefV55pS+xN8LE96EtyjU3OYVoPd0hDp1EnzrrNhFt44fpUahyh1eLa4qJwp5tPiyg5AVzbFSR9gFlyCTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mChEdScPK4P6p2Aemi/0p4MThc03DxUwyC63GFtzg34=;
 b=AASNxws329AfYEMuBaMrU/blD+nBpLp7S4P/qMhk0nDPhx2wcUkbt2UhyWsOYdltiRdj/XWjD5FgM9u3AwcUp2ON1D4BhMLEcNE2SX2bO8hLZ0ijUJi84KcRsN12GEIjuprd2EXecymrKnkMJfUGznn8aIbEtDiE5ddSntcmSOPJS5UiLTpuow3CFht2oZbPco7LYcIsshDRKbeCOhIftqbNohuvWtE/qO/NyCIueQOM9NwSMjlB0RBbWyWq9HgLlqLr3UTyNxP85ltwMaN6HS7zmEEhFMxh7GEo0NLE+HzxTvsn2jhRhgLHLBnGQuqFOLhqzfqfqkXIq81EsYbVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mChEdScPK4P6p2Aemi/0p4MThc03DxUwyC63GFtzg34=;
 b=lri1bDGAI+WbPnw0xhLvSx1yHIkVJzAex3cHczySV8e9drsd8An8vQyxbjppw8wgmTGlZL8gHLgMgZ6IuzfJYDmlXyZxOkycTZj6x9D+T31s9iG4NpC7x72jR4lLH0R+sz+U6SMSSFCdgV6BoHYK9cF8FhuuXNz+bQNiFZEIUhBnbQPP5Nshz9hEpkQntxr7YMTqoD1J0642PfY/n0osB8llcSdjHA5uVQHGYhCU1SiZK/Mp9jSNkO3OdhOhLs9LJIWnWnl/8DtuGO8hwi+tFnzoOVw0lXC00vaoWLPDvcJBaz8O5k3cJsQ7hTj3MTCAYXPlWVyuNqDzk9FgqKhyAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 19 Jan
 2026 06:43:12 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:43:12 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v1 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
Date: Mon, 19 Jan 2026 15:41:18 +0900
Message-Id: <20260119064118.2493736-5-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|PAXPR04MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: be909b66-3078-4cd8-b5c1-08de572603e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LEo2Ed5q2ElK59BStWK8e/1uZImtVBHvaxaS6fPVQ2lnxughzFP/ftvFR1B2?=
 =?us-ascii?Q?2UgkP4ZptWtdD5+Y2jKS0fOcrcgI/1l/ADidSWvojZ+hllYcLvRfsBEEl7uX?=
 =?us-ascii?Q?ptKO3oFXFL+HKtMjQHlYu1a2RqxZEYD44s8r7WYZrobPZO7de4Fj5HeEiEM1?=
 =?us-ascii?Q?0iBC9DTswPbbf2U1e9/IMZgIJ1u9efeY4AkPGzN/GlOCxJtwB1M4tWoGDR2W?=
 =?us-ascii?Q?vXC44D3bEzCjGKLcSIn4FoPQZA96bSfzbFieiUBaeGySPNrv1+/zwywDBSx8?=
 =?us-ascii?Q?f5YQqXLQTVdQ5r/pD+HjykO8/4zqdTh0wlzGInugNAZHSufx5l6HY3kXp+is?=
 =?us-ascii?Q?JB1uS3ffCTnP1FDOwA8XaCVgw84EcTilwLGxkvn5cNg96x9kURfw2fbvUI1K?=
 =?us-ascii?Q?ckyFEYZty90JGbSXmTBZW1X3m+yeZllw8EYx9S9uzOMnrjbndkAVH8fvG7+B?=
 =?us-ascii?Q?93IJoPuWkJEWvedGE59bED37C+CKtUxKSf+6D9nQsU4IsAWxrb2eCEosZExZ?=
 =?us-ascii?Q?hZx9H078IKrjHmucTcTQ4idrDfQjTibdf4ZsloSmnwuvsnyPIK1W2HmWnzvv?=
 =?us-ascii?Q?+ZYrHg0AkzEwDTiyhqgL9hR0t5HSiceY8w53uV9TtW9Hr1hu/xLb+6c6cH5f?=
 =?us-ascii?Q?6QTOWUBpqC4tKVxUZCVfrmiw0vh3XI/YApfh04bGO8/6mX8ROFzpZdF4Xy7y?=
 =?us-ascii?Q?jUw4QnZbKxEDxbT/lvKni+AFH+zgF7gL8PUJmanMVEsZZYeU8fuU6VvloW6G?=
 =?us-ascii?Q?WAxqtZFdK0GfzVTSStLP493if0vYG3gawGn8iqPfUQb8K3qJEuTO7GLZJ4O+?=
 =?us-ascii?Q?kR+81oc4iM456ALDrYYzzpIGLAZdwCCHCB7aI9xiVYAv6oOvIZKqdnDZTiF5?=
 =?us-ascii?Q?4SqO0DKAeOB3iQzRLlszXfyWIoea9jBd6IJkx6KNyySwyQU5VZzjEUPyPSds?=
 =?us-ascii?Q?2jej7grNPY3agVvyJbhW0LM58zghuFnAVh6589aRTJXZfriKPd9QK9pNhgSW?=
 =?us-ascii?Q?sK9zqZNVwTzqvYtgNY/eabId3jgnMW0u3u2RnChLH4ioojF+VSjguBi3m2a+?=
 =?us-ascii?Q?GqvClb+MJ8TXcGtF47bl8OEuXqkuELMxw0lU4t11EbVHsMsT4dCGvw7A9Zzt?=
 =?us-ascii?Q?AgvBC7w8UGJZC6BK6EZ8zB1Fvb0wS0+MeXwYzBETcN9UuukX4SOhFTetix6f?=
 =?us-ascii?Q?+QbtTgs+hHq11apSty3H0hNoF8w50s3ZYdSXK6h2o+a9r7uFQgi2wWIKnxMe?=
 =?us-ascii?Q?O4toQoK5KdaqIwxd8K3WnIK6DFm2Fb/3j1YPuB0bf2uZDC++1KRfbjRN3v8S?=
 =?us-ascii?Q?kUp74fdsjcUb9RT2Vdt0wyHl/Vc2NolD6TB0aEelUXXITuC1Usu+hyIzBEf6?=
 =?us-ascii?Q?6FVgW4mrCI9LUl2YfePpfqJaQgETSpn9509FDBFmtEVEoRSv4KGaNWoSSd90?=
 =?us-ascii?Q?nHRiZFCGMdrkpFwGWpqFUrRV2+8nbxqAyXRcu9ZVcdJMvr8Y0z585dKXuGl0?=
 =?us-ascii?Q?BX5FkLtekpOq4v2BbnkeoRuVj953McafKxgiT8+s0nQcV2/nzp6/ekWFE7bC?=
 =?us-ascii?Q?x+nKDRF9qn+R7bqWmv8HRG3to1Fcpeb6KeyaGi4Cm1mlDoh8cOIj7ViFfERB?=
 =?us-ascii?Q?YReOQYcV/TSkqzMkRKLBXPk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OCM+XcGdVyWh7sLT2ZnPH3ZNab3w0cSwIZD5wKdqJKUFcomGtDiidEsAOrm6?=
 =?us-ascii?Q?kPB1Rv3maTSeLhQdMWHyKeb4L+3VabqqDXcDLd2HZa4I2c1Nl1SXktigX/Wx?=
 =?us-ascii?Q?YfoJT/VZnGE1z4AnlogekaiOuHWtJ+TIKtQuT5aGfF6uJSq7WiD8Dl7KPU3n?=
 =?us-ascii?Q?eEQJvLYogTlfkY3onuG1+LqMui1QMLBXdzUkIJM+StzgBnd7n60Aln+7ptco?=
 =?us-ascii?Q?pkDC1FuocglwuBLpvLZ+2nomK4GtMFBA+hjmk3NoXSSDStfLWKmZmPHL9P7T?=
 =?us-ascii?Q?3XkC4zMQr12XwqUlMpawovTf/nIdTuecXH0q2WDRc1XyoXgRwWj6Lq46t+eN?=
 =?us-ascii?Q?01o/+alkrdTP0O/48OC7ZsYenFgDy5PKVemR2N03VYU2h0OmYiE4nURp2v4W?=
 =?us-ascii?Q?mad4pcSGAe4do6j9id7/NH6xqpZ8MbrWSlAUVOsFeoKAmLJEdDx4WdFvkSyB?=
 =?us-ascii?Q?x/ntobSLpGxwA/fedpuQwebs7dFSBrim2b/50LX8cmKzDmL8ORp3m8155lRU?=
 =?us-ascii?Q?HPo5EM80N4o7ZtHXRWcvgnYmbOTy4bhOX6+STeNUaVaRVexQMBnKEN9DB69X?=
 =?us-ascii?Q?hXKkISjr14DRCDUTcL/DIYOdhAWwCtCLNyKBrXXJJdT/vGUqdsFIdkX2I9BU?=
 =?us-ascii?Q?kXWNhTHx0tMbEjMjRp2lMEUBG84/EeXnmnPek81BuPmhUgFZNaAxM8Ihns8T?=
 =?us-ascii?Q?bp7Qs4Ra+yWNMBKUs2Iu8qL9y8imFkKze/gNxjk9K/Vy2z2pWp6nnxkJACbi?=
 =?us-ascii?Q?bOEHX5Il6BRSicXRLuQqyNuNyDP14UFMh2g29FJ+danQIPUCheGJ9KA4wSjq?=
 =?us-ascii?Q?NhT9V+ou23IoSsAacKTGej53jmQ3gJUGTcfKBtr2y8bUmgHLxNMmvG3LrCVf?=
 =?us-ascii?Q?WU2BG8Xyeeyd91UukucKD2JlTi6RwT67/X5BMJXh2CXbJ7+KCMP2q9APi6XG?=
 =?us-ascii?Q?M3adqs3ySpUnyjvVrgkDx2qrv+cUKNdiRj2Y7yNQvlBGOEp6tH/hydD5H3Uv?=
 =?us-ascii?Q?IsU6keWuxRQ8JoVyokeXEDBK8g1bd6YlPbknLvzIPFVclU11ZSX8iwp6pdpP?=
 =?us-ascii?Q?BSXSxapXp/Wfev8c5U8Q7OjOp2+7CTP6Yew+QsyBgixKWRDXAA5plsSwj0yu?=
 =?us-ascii?Q?Fq4KkFiKbhhuU4dIeQzrxeyhdvXKbgHDXiP1/EwkDjaxj63fXB1CUKDTTVLd?=
 =?us-ascii?Q?hGi6NiCYb782jZng/eNzzI7+Bh89yZC1Id5+SMlsz+65JwP3C2fe2wrNZy/2?=
 =?us-ascii?Q?0zUOGyAknrg9zh2nKFqZOO2+N2AeSjuu++GIKrwVFRjLnkqz/WEC3ruHAfYn?=
 =?us-ascii?Q?EVQAquHT2kjX5hH/TX0qAP0YI4duw/ZUKVZFR+1IYlTgRYRCRv2R7lMZkQfF?=
 =?us-ascii?Q?jOridxFkbTa+PXpj4t/HVIMcFW7mvxCtvwdQgM8auGSkpuGoogZx9CB4uXvu?=
 =?us-ascii?Q?9WsZC3EZJOO2xroOO1Nt1pNUrieNx0TNegV72rgHjdL6n4tDbkJXCSRGvitE?=
 =?us-ascii?Q?b7W5RC/lHmuxz2OC+z5bMB8YmrBygcLQvyGgmW8O+ahmQY3vYxM5yVc+fYmR?=
 =?us-ascii?Q?P2Fp/FgTZjoqnLWXPG8uLE5wm3S5ww+0NwmemEv/uSHvwhZF8SJAC0oA1/qO?=
 =?us-ascii?Q?h6qYUtSVFY+NCNZmkZkQJ16stz6kCgdRznB9axca2UWGbvdoKaI5blwKi3/2?=
 =?us-ascii?Q?seix7P5xJUPx/SjK/F+KHPzxdiEfoJOQEB5ZGF/SyQ+9lPrNXQrkebkWH4OZ?=
 =?us-ascii?Q?o7snwd+bQg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be909b66-3078-4cd8-b5c1-08de572603e5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:43:12.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WScb4FbaXeSjoZJO0ciaDBcNjWCxMLOMCH9XLHoQtbK8WKYngs2jC2B7omBhlq+OQ7ATPFNch/dsc7OwbWSzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

From: Jindong Yue <jindong.yue@nxp.com>

Change defconfig as tristate type and add platform driver
to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
---
 drivers/clocksource/Kconfig         |  2 +-
 drivers/clocksource/timer-imx-tpm.c | 36 ++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 7d0d55c91c3f..511aedf52a32 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -612,7 +612,7 @@ config CLKSRC_IMX_GPT
 	select CLKSRC_MMIO
 
 config CLKSRC_IMX_TPM
-	bool "Clocksource using i.MX TPM" if COMPILE_TEST
+	tristate "Clocksource using i.MX TPM"
 	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 92c025b70eb6..419d094459b2 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -8,6 +8,8 @@
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 
 #include "timer-of.h"
@@ -152,7 +154,7 @@ static struct timer_of to_tpm = {
 	},
 };
 
-static int __init tpm_clocksource_init(void)
+static int tpm_clocksource_init(void)
 {
 #if defined(CONFIG_ARM)
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
@@ -171,7 +173,7 @@ static int __init tpm_clocksource_init(void)
 				     clocksource_mmio_readl_up);
 }
 
-static void __init tpm_clockevent_init(void)
+static void tpm_clockevent_init(void)
 {
 	clockevents_config_and_register(&to_tpm.clkevt,
 					timer_of_rate(&to_tpm) >> 3,
@@ -180,7 +182,7 @@ static void __init tpm_clockevent_init(void)
 					1));
 }
 
-static int __init tpm_timer_init(struct device_node *np)
+static int tpm_timer_init(struct device_node *np)
 {
 	struct clk *ipg;
 	int ret;
@@ -241,4 +243,32 @@ static int __init tpm_timer_init(struct device_node *np)
 
 	return tpm_clocksource_init();
 }
+#ifdef MODULE
+static int tpm_timer_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return tpm_timer_init(np);
+}
+
+static const struct of_device_id tpm_timer_match_table[] = {
+	{ .compatible = "fsl,imx7ulp-tpm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tpm_timer_match_table);
+
+static struct platform_driver tpm_timer_driver = {
+	.probe		= tpm_timer_probe,
+	.driver		= {
+		.name	= "tpm-timer",
+		.of_match_table = tpm_timer_match_table,
+	},
+};
+module_platform_driver(tpm_timer_driver);
+
+#else
 TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init);
+#endif
+
+MODULE_DESCRIPTION("i.MX TPM Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

