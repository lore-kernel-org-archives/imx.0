Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007425F7A9
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804983; cv=fail; b=Jp/L9lX4/qY35m3mWlFXXt+hsC2qtpQnWnMdevjaGeOexNGlROWI0AHYvE9LyJOHoGmIlQzamoBtq4A2YZ5iVPDV3zZ1G/m5S5bgy7e7C58WwxQDQITmdJ5DO5OyUa/bTbwjNzbBi7nW3wEezBcsBwnNqlt2RTb2bGnaAuVp17w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804983; c=relaxed/simple;
	bh=e8MhCichZA/Clb2HZc2oxH7Br11mreqHZm4LApq46jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPl5qxO2bfavUg9y9L9QCaBIU3mkDr0a6v8H2eq1kGmz0toG/lb4FJKmCipfBYpWIyABXzdHKn46p7zwwIxvLdtFHvzkcy5pgCn9itH3nq0AvcmKM7uHGHFXrUkonKTPIC1TmQZZtwuNcuC13hDvgjrOTp8A7ZBT8StSDq0i0J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUPpj0XH; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUPpj0XH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8SavSIGXqEyIg2aTtZXLk6Dk5WXc7YL1msgmx4gavGazXpht2joCh3+4iD391Q8hT7Wa8X1VV+RtWQFftPWUpKkn+aFxcZVUXYhouVyh+CmQPKfoRD37ZCc3P8y2u75Uc2ged40e3IP8cF7rHQvhw/V0u4/emBvD9yuZxUtCE/vFWpoV/tJxuvPkQnutHp+ARXy8c6UKtGtewKIGdb/jQr2NiBW8kcwDNXA39dZhxakzcnrPuTCulSFIH1wsD12t6TV0X9L0IIbmLgYHaYhxAnDvq9qAY6ubB/q6hSFXirHSE0ccf6M8c4wvgbwOcWHxW97QyK/0vUGP1D8E1Lmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q0d3BWrr5MxZR/PfavdKfnMRyKw8H/6NmOYcZnB70I=;
 b=o1AVOKxhd/Y4RInHDGbUJ2uTBPcZPswoGx5HLG0niZlgXsK0y+F/duTezBq52QpoOF4G4qs3I0Au31DDuc4rQ95ZZlZ2ZRF8Q4FrNxFzvlBesZj+YVspUy4PUHfFhEqSOj0HKaAZX2qR4bw8yzGnCKOWQwLwM0GjLOwRzOFzkxE3KDKsJLuASkXOzAl68jGTAUANcGVObEO0OhFROGqQJ4xfAhW27A+21BGHGL64+DHvGPUwXk2Gs3CNpECg52ZB+NZ6J9TSqPE9bPkGEbEQBx4HtcCUKP01gKvpgAb0L6hWgDSrDfRK/P+M9FhHP9UPd9DvxK383Gz+JPhl1ZUC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q0d3BWrr5MxZR/PfavdKfnMRyKw8H/6NmOYcZnB70I=;
 b=hUPpj0XHQRjM0ZGPyD4Bb/fFxC2nxzXR7pYwfxLFhOF5JJSYzDOvPXvRcvZiJAwyiZD1OCK+95fYIuRVrkHL+/PSbykZCdKQFkFkjBe5lYMOCh4xwl6EZC/oa9dKXJ0uKw+M/vtMR68HBuQc3zcvCtAj1kyk6w/kMyDZiZWkZiotvXGJrbyKoKv/jZ0CXKHUhtjmpbfqb4WtI/IEMU1n+8J/syh9kf/no4guGqzwJcnrCSDTP4Pg1/SnKhsvIITVhzO2i74W8kE94Jd7dogj09lI0QVdRgZ6TN3wTbhXLceCjInc6NuWW3E2trRgM/B4qEAp6xmxeIQbzdHoz7fczw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 19 Jan
 2026 06:42:56 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:42:56 +0000
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
Subject: [PATCH v1 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Mon, 19 Jan 2026 15:41:16 +0900
Message-Id: <20260119064118.2493736-3-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 91dd735d-6765-4075-e102-08de5725fa6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eu8spu0ld/TnEObx4RBLIpaI5SJ9jjrdTPcZw10lICCHBfngl5JVB0N23OQL?=
 =?us-ascii?Q?OCRY6AT2qc4BT0x1kqbgYyMR8PpvVojQSXOkuq4/O6QxJWPl/JO4F3LCtgDo?=
 =?us-ascii?Q?pNccmLSeqnMXRtwoyffqJJ7c6lMbqUsGRdrw7Y+qQcIDXpTs0vFQgSiFPwnH?=
 =?us-ascii?Q?qLbSZShf0/IxzQRnNeYWroCLxN46J8htMBpy/8d6x266swMYOeA3+pJHxI37?=
 =?us-ascii?Q?g4/21K1+zaIY649dxCd1ToJiYIOPgXorDZXNyRBvfg8Hl72CvGFb7VlgK19W?=
 =?us-ascii?Q?Oq6JR14HZ8dG+rq11g65V0YidpN6yHrI3Bd6BEygTjuPGYAeD8BjQ/Fuhc+h?=
 =?us-ascii?Q?kEE89MXUBmz33BUlZjIpzF5xCKu3lzTVbgf7Qa2kHPxvGNO1zoNYWxBviEGJ?=
 =?us-ascii?Q?TZGAhOFQ8C4o9Jws2b68iu/OJPl83swfCFN5QBweoEuPAB3y4Am7xBCEFhgT?=
 =?us-ascii?Q?uVcqEcVKTdZDwhi6aT9m1GupxSLUn2ppK5HjCjXwdbf2f0jGDCRc42eYINji?=
 =?us-ascii?Q?4wvK8LbvPRFngtXx9dzRUmdp/AF6UiQ7JcSOo7J6iePjpb30bsdAm2GY9E2f?=
 =?us-ascii?Q?lHt6+q/hI9TcpmHxrZ2dpAFyxK68CoGh0DDdGWvzZNZ3kXzkMtjfWeaEMPwe?=
 =?us-ascii?Q?lvfATc5n3UcJpgtP9K6KVyy3R535Tt6DBzlIj9bXOc9UclHYxasajRn5aYyB?=
 =?us-ascii?Q?G3T+gaI6AjSev7rpA+g68WG14wb0q1lJIrMpu5svR8nKLd80fY9blfUu+Hm6?=
 =?us-ascii?Q?OeoTNMzzUQ07533M3dN6irzpfJBxS/9o0aTlK/S3uUvxQgxHdX3HgXBO52B/?=
 =?us-ascii?Q?mo1qMcMzaBi1AINeKVCin1YNBasmbAMallk40bXLyZQyxHmeQHT+Klxn5kO2?=
 =?us-ascii?Q?0l77BOPw17xp7IA+yz+fbaTaIHHxtmgUVByYvqYXZG/WVGRZu0woMp+xWUg9?=
 =?us-ascii?Q?T8E7oWyo4y97kwTXE51NX3X0oOFsjIC1tmOKan+vnwLZuxPgSLDU92Oe+Ic6?=
 =?us-ascii?Q?R5mud0ah8IEYviOyaT/ZvnqB2KIleBkV+CB/nkHQsiDIbJiuKnIZl3gznq8L?=
 =?us-ascii?Q?X7J25gdE5oYVOTAkeeWx6BVZPgbtDMljrU/3W7YQJh+VelLz7Y3nvXhRqDht?=
 =?us-ascii?Q?2EF3e56EpsNPjS6FoY59MxCfx+XVCnzNToGgvMHMyJwtWOusiJNZ+1oKZ6CP?=
 =?us-ascii?Q?esbbohh0Bdb/YLiBqQLSx9KAfIieNPRRI4RYIwyoKLqEs6vnr7CpbZE67Yze?=
 =?us-ascii?Q?M41OinWz7DdAjiwTk/4krEpLaPxfykvv2dO112eq48PmVlk02vhHoiEV8GdE?=
 =?us-ascii?Q?AEvhUeORrCYfDrXc/dhVZ78IIW/jyZhzS/drTQOCq/woZyjbz+MW7OaEpGuK?=
 =?us-ascii?Q?5dkxpSyseQBuPLrDl4N08KV/XXgiXM5G0nmQIAvt53lrqvTKqzlWgrO9sp+l?=
 =?us-ascii?Q?PBvM6Oro8NDSHIcLwqboYOPvAfsxRXZiaEZ3U8OfHR83xTXbuoNmdPhS8Jm8?=
 =?us-ascii?Q?BHynJL3sRJaTwqxsxeYozW6oyFqWqGOPJIchcFfJhoEO02p2+jAdlHSEZ0hg?=
 =?us-ascii?Q?zmiWmW5bhwlmU05eC8uYpmX8939zrcKijiCb9AG9HVxydeTV3TO9Y1F8YpBw?=
 =?us-ascii?Q?T9uwLGLA36ymSEP4bBh/dvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DREBnDbCHsiOWZ3qcPQ+m6yW+xev26PcWzcwuHitC0Hb71GjR+v3gf2AsKm6?=
 =?us-ascii?Q?gutsfAmcaZk9E7H9dFzRLFM66Vo62oDiAywCh0qjxWFAgR0oohXnMC9FKs0p?=
 =?us-ascii?Q?y5NQuKsEddixpuLJsZYFOFhSAng6C8J8rg8yob1se9y+GFNI8x+kAF31Ulnh?=
 =?us-ascii?Q?qIO5ONBJELZB098tKfJyGqSuZ7+Tk0xz+PlxCaQUIYPH45p/89vbUxjSlk5u?=
 =?us-ascii?Q?3FITgt5b7sD1Y3UcfNU5nF5+cPKqGY4aSLcGNUHu66o3NE5Ety99Wqv2igqm?=
 =?us-ascii?Q?ngaH9Zm432ZrbYH5ssAxmPFHyvrn+kdgWJb1hnT5GODRqG8VKO/PZyCtFezy?=
 =?us-ascii?Q?36ob+JdnsKRtBFS8kfAjlZeZFg+uHRT3x8QtI0dxIIa8duA195HQC7GP+poq?=
 =?us-ascii?Q?tlY9YAbh9ehJbOWawEQ+5RFMDf+X81oMAgqGyXF8TP8Qc+y1rh3HJjoDOMji?=
 =?us-ascii?Q?z+tesCjwB8YnbWd17qtF/GCdZ+HyjIdWS/43Y9iIpWbeJkRI0teKfst2HuqE?=
 =?us-ascii?Q?TV28Owo8PowlyYGXaC+SIPTIUCEDSUa3cIAdSVMhi0qNFfM9KcxAItjiDlcX?=
 =?us-ascii?Q?fzlkmbeROpmKrAhghNa6Cz6bYmvNxCaQ/ce/ASOo17ib9QLbPT8Iv76xooux?=
 =?us-ascii?Q?wIYrST/O5RleQrj/JvfgeKomM1H+8wz8vSZ29iGkdKr2N50jz1qXbuTJ+AGr?=
 =?us-ascii?Q?N9Xgd1G6vsPD1OY2dcvgUvmllVJhkoZSo2RABXqHOgEyvK08iGQveIx8zgKO?=
 =?us-ascii?Q?SKczqcFg4nZkhypqW9g/ZXRahJVJOw9AJRoZyAVW26YjbXZxim6aB0vtkXoe?=
 =?us-ascii?Q?OTpK3fYURU74chMC5uhenEhOAsltwJYNKabSxj/HXYkHxlMok3i6+LgCVfOS?=
 =?us-ascii?Q?losvVk44ptyYzrc5OQBu6nIRCl/aPoFsw/bzQPPalDecfP6en7J8Y2aUmYs8?=
 =?us-ascii?Q?9HDtIjynrxep2dlwkLWdHotRIC7QUy1zkgQn4xQJ2QxcVoSdxsA/VJ42F3CE?=
 =?us-ascii?Q?zYSNmV95x1z0WaZ4ItmJCauo8blxx/0zfdfsRP0P/L8kvP7I1Vjxx6s9S7wj?=
 =?us-ascii?Q?O9Xh8PooSWUz0DyJt+N/Zlj5ZjD21KCzrQOC2l7q0GQwFDJVAdg81y8/kMim?=
 =?us-ascii?Q?UP1ZbMLpXMRMf8fuiXyrrSFH0aqexqfzgqpMg4/UfxVJUzwY/gy+nh/BrUC3?=
 =?us-ascii?Q?FAsB8A71gKecdSyPHpY612dlP4ImNHK4e5VqXa4FCfIg9ylT5932GrLFpXQY?=
 =?us-ascii?Q?HpbvU4cRSoI1HeUGBmDmBMD5ddf7P4Vy4+j6A7Ah7hO3CLpn2BTH4xTXG131?=
 =?us-ascii?Q?eYw8Z3ubdV9XnVS7vQ2gLwLSOI32iTeX7W5w/saENVBgkf6YOwKR/hDXwP1K?=
 =?us-ascii?Q?WES4l1by6jqqetoUPYnO9jWyUA+kDRhmoqD7qpjn2NFW59zaVv4EM2bMnZU/?=
 =?us-ascii?Q?BckrICwl1DdB9tOi0h4cyp5apHnVsTf2gHBvC143WRcK0J9ApL3gyGvSg2qZ?=
 =?us-ascii?Q?mn45/ABJ+tB02ZZsA8WhndTvpWZVpLxM7r82G18+1hcepFXcmiAvKiSW6Qig?=
 =?us-ascii?Q?jYCNXnPYYQJY5FEbyhpZhNg7zL3ykNRyBvT0P1bl459XgfVYkt9/g7R4TLQ7?=
 =?us-ascii?Q?3ud5DjFPfzpiDNfVuDf1A0WS4/sqWoCiBSw9/kzvGo7Aq2/Ufuf9Gw4awBGE?=
 =?us-ascii?Q?Py6BrBujqYtTTIPZQexSesRNLyuDwicpgmVSZBVtGt8XuiAXWAW9VoXZK7a+?=
 =?us-ascii?Q?iKtOai5aXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dd735d-6765-4075-e102-08de5725fa6d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:42:56.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiw0aSg/emvL6RMvqbravijzckRzIIj3tfNZXXN7Ysb1Rni3EVPllT1yH0ePVQgN9sR3cT16dmplUtiY5f5yLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Remove __init markings to allow timer drivers
can be compiled as modules.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
---
 drivers/clocksource/timer-of.c | 23 ++++++++++++-----------
 drivers/clocksource/timer-of.h |  6 +++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 420202bf76e4..b7c186dc83da 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -19,7 +19,7 @@
  *
  * Free the irq resource
  */
-static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
+static void timer_of_irq_exit(struct of_timer_irq *of_irq)
 {
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
 
@@ -41,8 +41,8 @@ static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_irq_init(struct device_node *np,
-				    struct of_timer_irq *of_irq)
+static int timer_of_irq_init(struct device_node *np,
+			     struct of_timer_irq *of_irq)
 {
 	int ret;
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
@@ -82,7 +82,7 @@ static __init int timer_of_irq_init(struct device_node *np,
  *
  * Disables and releases the refcount on the clk
  */
-static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
+static void timer_of_clk_exit(struct of_timer_clk *of_clk)
 {
 	of_clk->rate = 0;
 	clk_disable_unprepare(of_clk->clk);
@@ -98,8 +98,8 @@ static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_clk_init(struct device_node *np,
-				    struct of_timer_clk *of_clk)
+static int timer_of_clk_init(struct device_node *np,
+			     struct of_timer_clk *of_clk)
 {
 	int ret;
 
@@ -137,13 +137,13 @@ static __init int timer_of_clk_init(struct device_node *np,
 	goto out;
 }
 
-static __init void timer_of_base_exit(struct of_timer_base *of_base)
+static void timer_of_base_exit(struct of_timer_base *of_base)
 {
 	iounmap(of_base->base);
 }
 
-static __init int timer_of_base_init(struct device_node *np,
-				     struct of_timer_base *of_base)
+static int timer_of_base_init(struct device_node *np,
+			      struct of_timer_base *of_base)
 {
 	of_base->base = of_base->name ?
 		of_io_request_and_map(np, of_base->index, of_base->name) :
@@ -156,7 +156,7 @@ static __init int timer_of_base_init(struct device_node *np,
 	return 0;
 }
 
-int __init timer_of_init(struct device_node *np, struct timer_of *to)
+int timer_of_init(struct device_node *np, struct timer_of *to)
 {
 	int ret = -EINVAL;
 	int flags = 0;
@@ -200,6 +200,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 		timer_of_base_exit(&to->of_base);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(timer_of_init);
 
 /**
  * timer_of_cleanup - release timer_of resources
@@ -208,7 +209,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
  * Release the resources that has been used in timer_of_init().
  * This function should be called in init error cases
  */
-void __init timer_of_cleanup(struct timer_of *to)
+void timer_of_cleanup(struct timer_of *to)
 {
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 01a2c6b7db06..367d7023c623 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -65,9 +65,9 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 	return to->of_clk.period;
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int timer_of_init(struct device_node *np,
+			 struct timer_of *to);
 
-extern void __init timer_of_cleanup(struct timer_of *to);
+extern void timer_of_cleanup(struct timer_of *to);
 
 #endif
-- 
2.34.1

