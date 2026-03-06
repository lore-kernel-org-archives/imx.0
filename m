Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B4299931
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787058; cv=fail; b=rarI8hBmOooI0s3ZaucLONAlQvuICISjAq5PU8Mf/nyV/d5KpY3qIJ5Ug4Ehgq79SrHhynb7FB2sSy4mdftJtcKP8KYcCho6dkgo7/w/yTDR6nAonHTomGLm3UVYJsAiKiZrbwcJ+X457zr0B4csFMRR/pQEgkqB6/k+cMs+5L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787058; c=relaxed/simple;
	bh=j0Hx5dgfGvJ/qpoigWoQVOwOhkGf6TXc8K97Ub+48Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FRjZ9LhM/DywcQhKKUk3p1TbBhv2MCRNUkzX+3naUC2KzEfpvN37jQa7h58zMoIxFl1Vy7hjkc5bBVZrWdOwFIAnSgaCYslGJyMQlqEvQezcnReGAii5ZNDnPqzOF9+Fs7EHBPXUAqKJMPBHIj1ifmgWyRZh5DV1//5kwV3HN3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mexaKjEr; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mexaKjEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU2dXa8xlK/HODuqqJvoFu2aJUdb62wHozxvGkKkl2M71u44+9k49h+nj13WEXTW4R76sP1Cu0EAfcGVtKCJtFGJVTPyLQ0V4BxRsnBC4naTqfuhzbr4X2r34/bOMtUFl2vABwQGZaK4CHBVXZR4gcnRzp7eI+K+7XpKfj2D6NEixbroXWf9OuuqwBe5jWvKEmMkOkXEtQMOoNPxTfom6y8PaVZabdbP+PN+Ch4XHhVoq1SXfjhhq3+/NaaYsulw+AK5IzoRF5YjfD5kt4LyZXOMqiB6uiGUI6S26imIFln0R1RAv7LWeXS9/oSiB9WMrcPGl5aCT1X0QypuY3uurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=Au9cxUQavut9d/rKq1HsNgS5fQk3rmaE9/s2XeB6m6KaD6pjft0o/AyH6j5ZFvyzPEmb281c7X/FdFtUza4qkX3KeNDCELsNh++rPh+lqc82W54XRdg5eE2mQ9rJLNm1VN1RjCX7oi4x6ABkVSJ88p6qNqd/7m4ZQQ7dVpNDEzZcLSuPNkabkDZgTzUMQmHGvCgaNAGgtLxjNGUgLNXLNxhCryXLncnici6Y7BrWmIcQfHhQGJFV/vwPSwHLX6Sd+LjhgHbcWl8fvrBtaVBf7JC937neo8VnIM12FME8qPz7c3cjWwpNYy56RMNXfocXeUiwAuauyAPzA2TIIYMsFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=mexaKjErb7IT+nf2J2gkebkPu7GLTfgc1LL/PbvPjKV9XVIZZ7knmcXP0LMUG1aEw+Av3ZllNViTV3MFE/x6MV2kiSncOrAQgXguybZKfJq3VbblSaHNei7T9RNZLO3CFSkQ/XAr8M9b6hkdIJPTaKUyqX55mcyjGBU3z6n0+xk9wO2YIkIwJmEcc8r84L3/8KnFLLtuXjpDjwnCZ4BnU1iiN9klFJOChcbzl+bIxX3vWxmMu6SAAkg1Id+ueCSNo+Lpd6lwngCLGUo0lAe6+RJ/7Hsk3za8UMreJK3a2kOHKYPlYZzJ3GTKBf1R1Iol9ObXNS8NdEoLi8BHxIZJ5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:50:52 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:50:52 +0000
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
Subject: [PATCH v5 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Fri,  6 Mar 2026 17:50:18 +0900
Message-Id: <20260306085021.1231032-2-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
References: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b69580f-9cad-491b-5fb3-08de7b5d78a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	2Dgq9TECH/De2F2JBs2RZNTXZk3nyt7lfVVdzs049gFVQ+1wwDbVVJDnlSGzX8xg0fxMPf+QDg4UOVMbgUSfihHZSYI1hW7MXynrukDkTjKleLSow0Ak97IzLg5mSKyF5wru0bRlNW+jSegC+XgzIeuVNx/T8hGauzeqdJ6Y4LuAs0+0V+Rqq6hQP8DGi+2m23bNRxc8vRg7ik3utcDqN8xRv8rM7YnvB5nhWU6WtUkl7MG/wqO/FIBJcAp434CV3HDd/vp5WcLpWn/PXSxGKf29kqKoYHanicb67+j5grEc+rs0xaki3gwZTHYQ3AFPQhe/TcsE0ozXihRmpONlxqWysdwIOyM7DqS2LHtOnjpYiTiRPY2nChs2ca10qNy76zA3Rg39saTptm2pQG/hrLiKo+qEL6wCViEvF3oJZcYCXP/krAhL8yYw3etR1Gw01T7T22Pn1JcZh/keHv+RGJw149bXhUhcxE4VstglBRxUTPriGWBvRKxnIXlzmgcPh2h5AwQlxMNQAvVIXzRntV4mP00EjyKDrSxNWTLeIwKubBbbf/Rq/I5IpkJM44nvMeR7z+2MSIyh4kWd9rpqI0r+n2wPjH6hsbP6a/tvAu3ieH2Lfo6czmMzUPtmzmhpdP/1MQ2x6/1z4pYO/fu+gtO1NTBVTqhL9ihfL/8DARiYBsHhkf3DT/Do3F4WUiZNvUJu3EeHhENJDHM3ycEQ76Z/YymmCmRtyfXKCRJaoTSrIcIH/OFkJgPTeQh7iSZZZlpm4/k0Kx2EiUDxBAjkY3YC/DcwmjJWXkAVgdlqbKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4RZR2ol2+E2hc0j4C2SYNpXy0w2RAXBBB/lyPWXXXMRQNEvrwZ4J3QlE2T/?=
 =?us-ascii?Q?OvBQzwjd/1YVmXnAvtbHHScrCrPUnxEhuGPJyghjI8wkiAbxgZcpOn1tcVXW?=
 =?us-ascii?Q?KZrE7QNqU6NPplvB+jXE6a+CbdpiG3K5GsAQfqMGiKdtVgmFLoDi4nOsjA4L?=
 =?us-ascii?Q?F/n/yoBYOdbM0Ag6zn7I1sGZjd8LFyXztac0iO8y9/12URLoz4Q1NMvLaIwZ?=
 =?us-ascii?Q?BABy/t+i9V61SqhGDBb60kTVMWEVM5Nr2sBB+GyMyE6Q/sgyT8uDNnA9p9VK?=
 =?us-ascii?Q?725zmxjUepg56hvhgB+oYpXDBgwEKi60tOJGEn4GqgFcL95MMxiB0XRiFMks?=
 =?us-ascii?Q?tn6xWJ/HCV+omKxxVr1CEJZWKBGeU7DcmDpgTRYYaS3pZOcOcGbQbRZN3Tqp?=
 =?us-ascii?Q?1t4JskAaSLF3VH0JwO2tL0iAS0IFy3JD/byj0VsndzsXuI335x58Zuj4fBcw?=
 =?us-ascii?Q?PCO2Mq0toIUL4rtsjU6TERTqsHXzGjJWx5ViiovxGV7J4guj18HVX490i2ZC?=
 =?us-ascii?Q?SoY/uIoaO7NccwyQfTUe7WXdMU30cOH6hKJpGLsc48bjMzbEHStcf7p2J2KI?=
 =?us-ascii?Q?eX9f6SMBunE+dCcqcis73ROCy8HVVo2BaJW3CBQvhwmR/WeH5CX9Rkl5tVvO?=
 =?us-ascii?Q?El5ZCr1nLaiUgZlzKuRSBsSchzPsX25btu4o4l6tba74mAjSNjDQIrSA4wzD?=
 =?us-ascii?Q?jGS35nVj1c0FEObS0STIV0IFvyyogXTfb6XzqjpLh4gAGQjC2VGlA4qMvZuo?=
 =?us-ascii?Q?H2tM+5NhEsgU6Eaw3/8DHxIYmUGm91Ik47TX/rTj2foxipCMc7QXEOeATQYD?=
 =?us-ascii?Q?Jsfef8P+kq69AvFHmjc5AZs6OxhOOq8BZXy38lPwIgRhL/86TDAL56M5Z9UR?=
 =?us-ascii?Q?/VGAunF7iFqXhSOP2H4QCOHghc+GkbKmicVuHT3ovkA8d7AIa5WXwvoMY9k9?=
 =?us-ascii?Q?1XCcG+Jh5ht0Mk+XPO/8+qyeZwhDrCISFdzEs3+OliBqv3KIBHDlckJaPCZe?=
 =?us-ascii?Q?lisyvy4x5aD8+bBrJHzNdiw6JK3r8KEN2QgqXpyg1WZtef2dxwOJNGbYBub8?=
 =?us-ascii?Q?n0A1kO3mzd0WpYbCq5oRCFITZX2czeb7NOkCePf+zn7FTxlE9xVRrOqB60nd?=
 =?us-ascii?Q?RAdVHg96eEGLGtedmIDk3ITuY6SirclQxC66H6K3Z3V+6eK3nkGLYcjcvDxH?=
 =?us-ascii?Q?QS+oKILBhMAlwZaJ+NCslx3Hugx0ybAakFQSd3BIPaSj6KfbYzjiJpa11x34?=
 =?us-ascii?Q?YvPAhy78Xkqkw4DGUASrJjgO3YVP8fZ0/qcdjC4HZrDJcisdWTYzaL85xLhP?=
 =?us-ascii?Q?C8tmr4WFFLe0JIsVtvfpupuYFKHhZ+C+UFvNhmY6i8RMAAMvoIe6Qn8LAhvh?=
 =?us-ascii?Q?GMB6WJYk4qdtL32JJoI6lUVEekeCFDRY9MPMTf7Z1Awqsc7Jp70nqdJps6RT?=
 =?us-ascii?Q?zHMAYjDaM+Q5Y95xAglNn7q/bRiB3O4U1T8mY4oeUTaNbSre2n00VBWCwzhf?=
 =?us-ascii?Q?YSxPal7XJR2JeT7AW8GtorgLSx/tGvrIvECV8bOD5Zp6HABpEyvT5miHZon2?=
 =?us-ascii?Q?Zh4fIkpS8OQ8tpKESczRRX94YVmb7lEXCdlCzrfw4XnyqoQoQB3sA8ceLceS?=
 =?us-ascii?Q?0nNU5a7LHwFrs96o38dkTdzR0QZhx5o2pIUHuIyWUmNfWCu7ybrV8Q17qK1e?=
 =?us-ascii?Q?raYk6fvtC3tWQboQXM1mnS6VwgeJuJPiWHH6tbInWvCnFdmRxViv04rN6tje?=
 =?us-ascii?Q?Kb7T4UXt+A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69580f-9cad-491b-5fb3-08de7b5d78a4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:50:52.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGGWEENj86jRxDDIbXZhM0DJcZKLLrPcIv8KbSJAGc53xpwuQwEDFd27grwaP+ipglKyXKpip7h/LIOypPGZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index cd5fbf49ac29..238bf29db6f7 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned int bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.34.1

