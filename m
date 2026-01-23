Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431326ADC
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158156; cv=fail; b=thGK3PSIO9GYgBWaSAzZ2dwFsJnzNKCQltxKgBsoJceV4hiRf76y+I4cxWUhmVRqJ8htIeEz0FJDKS/FJkalNMX+A4OHA/pMuBL78COTd48uA1OLUP0UOCkQJ6rOmL1iiJqnRU8McJdt6nM3YKiOxVd5SrAOtSI1qbKjL5RKrbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158156; c=relaxed/simple;
	bh=TXhBO0VHjWzsR2rrxwDR8CB5+HbmRzv4rPJKmkkvF9A=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MfukChvolNC3CQ3QG39z2DmZoYCHicxRVy6npFKvT9x/xq3zFavRBrx9bWywUcfA9DjZJSAxON75quTYRX4hunXcdq9D59YqAHGnycTcz5vx5XVzb6SSRK8BS+c0rgT2skoUUJFuPV5+B86o9CBWR/nMmpfYVvAxmigc7dC/yGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TJrOGLnc; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TJrOGLnc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiDiYKZirJpLmEu10jSb6ZoNtwX7/iEHKEMIFYcR59YO1rRbq/7SHymMh4ikC37Ip6CeE2Hhy5uHSk28eYTyl5ltq7WOJjWTe+TBioeJX1GURyn8vCksR4shfuoh0OjE521AbbMOtKSxxqlxl1SwRjFW/f8fr3ordiqhw3axKJBn+NkAeXfu6E6qel8i+dlV/HyqzSkteYh83G0OWhaSVdWS/M2sf0MCEKZazTA5Tsb52LtC8hUcUT/PgBuO+iLTLGKQ2+/VWpHdNrx8nQu1n3d7y5qNwiBL9OWzK+/Ntv9BglXelzrZ4qOVzQfa1pUlGLzNKtvpvqFhO2VeovhsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/bt7Zqx8z+iqUYj9IsM/tw9xXdw+OQPyCY/b3MKq08=;
 b=LkkMRBpw7yqfhH6Z9+bRayKnhe5ey9vPDjGy+QBKynhE39hGIFqLIfASwCG5miubxhFl/kR+4Y4Emu8QD+2wD60GiVdHyYhVGW52tAqA9a9ML/22xtxgfs9R+epW5x9HaV8J7veBDKxeDMMbU9X6o+EYNnK0ujBRxPOc0hAPT7ry34TafgGrbFyZvukY9ksahZVoLmEpZgWIujQy6BRxyZEEeUQEV8NbLeSyK4k3Ys9x8dUAhTk2oM14Yqu9h59awWzapJULLCBIT0cokXRkPOlZQ6tzEwKbE7vv+/mQKm3Ec0QGmJQDpT+bf7Qzs5BPVpRRjU4C2/YlK6MqBOut+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/bt7Zqx8z+iqUYj9IsM/tw9xXdw+OQPyCY/b3MKq08=;
 b=TJrOGLnckcYlyEok0yKHNAivwJVrHLyjMgLpOycS/dBfjwJ5CYClU3PjlTZ11WuAfuEBDT0PYcKjM2QX2/Z8F0ai5/fC1Gl5r9k/bb9ga+deLxqZOfPDk/sbI+WgssVM22a2XjR2Mba9SONffnppj3UUYnnBKldEW013P645WvCMWaAZ69iGL71e2P2uSXMcoEdZgnnHZXGh4WOT0/pu/M5DFJe9dvOqjKh+khs12PXoq/Q5vL4i84uU7XLlfakUvbEGVrTOsP88DDM09OoyU3SwOfCKM2SS2bSxtYyDI4Eg8S2KRRzqCz/032X0mfwTIDdgDqgpmf7PAgUdH1gSeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8480.eurprd04.prod.outlook.com (2603:10a6:10:2c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:49:11 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:49:10 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	laurentiu.mihalcea@nxp.com,
	daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH] bus: imx-aipstz: set default value for opacr registers
Date: Fri, 23 Jan 2026 16:48:44 +0800
Message-Id: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d4a4c8-8f57-4e60-41e7-08de5a5c46e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iaiSbGgr3YOOBialCrpTzlPTrmhvEM7VJnc70KuVuhsw81mDQFYCQOXOmJEg?=
 =?us-ascii?Q?A2AIkCMv6UMTo20TqPdCw7bgjvYNdkKesvgpRWHOYLN02kO2SdPHKkoNLFpf?=
 =?us-ascii?Q?4TLIdR1wLLKxs/29YasGOrZn8nBtpKTElRSDO+tLJSNx1aUW4QuitlZjrAo5?=
 =?us-ascii?Q?/Fw1BkMEeADIywm0+Ce0z4uObZazf2iYBKynNGujnWLZ3+X9OENP73R8Ixqi?=
 =?us-ascii?Q?ZP5w+IbQFoz8ntzcKFc643ojpb2gw61S7tu5c03VLMI30FDzykucjbw665GK?=
 =?us-ascii?Q?QWvH9JvwC9pA+oJ0AHCbKCK90vyZFGbHq58Bsx7EHYckmRN0ng0vyXFumEH5?=
 =?us-ascii?Q?EEsFXJ6JhDq9C/zVInxSpDWoaonQRgubnFU+yWwa8TvFUFZifp92HrJ54Nuy?=
 =?us-ascii?Q?7irTlVNQnZ6RNqfzJLMdzmTTAfM/HO7Y851xcBTfbLP3KbVGj6GlvtJHwwy5?=
 =?us-ascii?Q?g1WYMe2UI6cBL7Snhv8ZUUHfDNdqs1qUmRlN0jmHW6ar63903H6aIuR1M9HY?=
 =?us-ascii?Q?fYM5F157bS1QYTILxlOuAY6Q1MYd8hYFhk3xj9C9HhlLavett6yAFuIw7mVV?=
 =?us-ascii?Q?n7JhfPFwlYkB1g63JvXKQ1MhRNbiGUY7R7SiAGg+mdEwDxNi4Pnvh1edbH0p?=
 =?us-ascii?Q?DtOWufs9CobQzA78MiAHOY8LktRwQ3Q4FXBWVZPfPsjtvIkf07ytjhwHDfXB?=
 =?us-ascii?Q?F+sXI2wFbyLiGqaf+U+C1E2p+Sgdm/e5Lv5uxU8+DggKVU4G9PSjiPk9l5xF?=
 =?us-ascii?Q?e2CJ8lH3yY+czc8wAXZSHqn5O+VGGW2HWum3gVo2z2oVvckLcK6Z90Fokj1V?=
 =?us-ascii?Q?XU8PU6p7lE3/jXmG5uxXd7kyJl5LIcTkLiq3yaBDitaExlWOIMcccZTopi4T?=
 =?us-ascii?Q?o2iXv8RPFDuOEpwROLduDfkbVm2WFkVHUrdcu6wDoiuxeNKtyAcsC4vqWuXu?=
 =?us-ascii?Q?eiy6bt+CmrihFTyF18+CnaB0B5TzdMLMr3gofm/uQOGIrT4+17pMmz9PwyVw?=
 =?us-ascii?Q?mBzcaaTUaNWPRQAhYUkZ3YT+g2cHd2u0eyizD9HPmmhwU0HqDN+Vg8XNNDKp?=
 =?us-ascii?Q?riWOnmuvSeHfvl/sgp+CiP9KiRP3sUFk6gbJh4/2aB4T0HE8T+y3CBkRJU2T?=
 =?us-ascii?Q?fYILmh3MBQ4T+6IXmxTZtmYI7Ty6WKVxjZpCYxGbKHH7g4Mq9LlhPCfOxJxn?=
 =?us-ascii?Q?mwdHERkZAEhF6c0znIM1T8QGemYdR9xiH2GLNaZMfnQkmLk0hKYD9Xnlo6Bs?=
 =?us-ascii?Q?GpUXEJSEwt0FzT/GYeNCV7qzicSyNkt/ObUAM1Hg9M/JFjQrJa8Xr3kCM4Ux?=
 =?us-ascii?Q?lkrsm5S10cuTlbKk69vOA707eMBhJMJamIW68aelRbTHVf3yMsr14zb7iouz?=
 =?us-ascii?Q?soVxWBf8dsJ56GZVXF1LBKlPU7H7JudAY8xSXWvvQ3vNSCychbo6QomDzHXG?=
 =?us-ascii?Q?ofn0EEHj5pYBP33fShg/gSWe4lcT9nRamAg1xVXNz6F12aF1oHkfVVVKzmgu?=
 =?us-ascii?Q?mI1yO3zYlmr5+ex5rvGWZFE9dbdRanwfIJpl/+oe3mReypPWEOdXAUa0jK1D?=
 =?us-ascii?Q?WjjklaHVHp7iFgGPx5iEgG7ZK7XY87VQJC8Ed1MJcaJ7wlfAMe8hY4CxnwE/?=
 =?us-ascii?Q?0eA6pegdy46ru3hBJlUZXtX1mI1dgpTkf2chydwePBAe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTNvu/7OPZUNS1h9WYyAXkPAF6oMP651XI2SakuzlGcJkoQ2p6nzgetc8ZMi?=
 =?us-ascii?Q?wScVXca4yo8bprR9xlFSL/Fds33umll1q2kQNFVXxxTD5XMs/0YjMOG5kYhF?=
 =?us-ascii?Q?KQI9/efMkx5zK8wP82s7dHpey0UjuT8Ljqp4SNflMLO7c27QpjfOwcLUUpQD?=
 =?us-ascii?Q?+MHiLxNiB8CFYnvzWXc6UfyLnqlah5LvvC+IVvTVtRAILry4iaLfvsuDc2bS?=
 =?us-ascii?Q?YwphO2Vvbut8aauOfo9uW1uKo5v32NgGhDcEve7KrOF3KrTtpUeDKNeylL7p?=
 =?us-ascii?Q?MIptFx1czH6GdtK3cWAvsBSltPt+2ko6t8/R08xlsoFCX/k20wo4K9HtX5u6?=
 =?us-ascii?Q?8oEhtPKDuq7FJVON7g/e14WUuf6TEFwAQMborDzLDgx310pSSsRDvlW6JxAA?=
 =?us-ascii?Q?jMmoXXIyReNxJI9HEHsMtXgYeOyBuh7WjdPY1VBN0ztJzpTkDkaRwkDg0wRg?=
 =?us-ascii?Q?mh6ZFsHXVgx4+r2npgPs3UP5H1KXFpWH7nvTEUjHG2OPtTJfuW6Vu9GGK3S3?=
 =?us-ascii?Q?c3c6D8+Y5CCmdSN5JloS3/R+1nZanhuzLBz88zFAAwPM+JEB1YqMBB6ye9D/?=
 =?us-ascii?Q?eBNSqPl9EoU6M/ZebRGjFvaNCKZIxCzArerope91U2TmN60acYuXAxlQ+Lde?=
 =?us-ascii?Q?PpkemtBRX98REpDPXEWjkA0YMwIZNb2QZGuIixvXba1EcaZCsnOn9XoHHFU8?=
 =?us-ascii?Q?aINfpQfHRXvx1AbiEFbSEuwHPc9qn0xDyx8IoKfRu52qlXi6Z7/l3OS9CfAD?=
 =?us-ascii?Q?PRnmc/y/3u36+4lOzK7HUoY3y6I43xcut3LSCJxOnTl36Pz11fKvsAwiacmH?=
 =?us-ascii?Q?GftNqer/qgSP/QyZFxeV67k8+FwBOmNb3zLVKRlNbdeSwpJNTtphdLkT04Ou?=
 =?us-ascii?Q?8pbrZlOFnip2Y+icz0SCzuB03D/VAAehIGan3ljZ5z3tx9wGk32kv/rrvWtx?=
 =?us-ascii?Q?OjC20VbW7iZo8XlSK6LYHRR3fHlxZQfMPtAr+6YJiGOXlkz5WR7ml/SkFK6d?=
 =?us-ascii?Q?IYwp5jid5CTwAc8VSzbqbbXiNz2RqYXhuLeRR/U2KoGykJvNYW5UkgtQ3w3S?=
 =?us-ascii?Q?xSQUcCABXRKkz9XnvRZ+yrqeIYRNa+zIF1bKt58wlQjpR12JGeGBZyCfdvGy?=
 =?us-ascii?Q?DS1PMileZny9MgjeETODZdWrvq+6laWgAAQ+rhD5uEL63BYngQJULRJ0HC7J?=
 =?us-ascii?Q?m2qIUEDpno6K7z00z/uNFv6uwWok3hLFkLDaydsOq4ZqsepT3KBvrhdeRAjq?=
 =?us-ascii?Q?0s1uLSGdE2ffHJzHVyBqIAPXDo3nPm5JWyNfClzGHCXeBw4DaIqG+I2awXJz?=
 =?us-ascii?Q?NoHv+zLgBhxCoaJJI9JQGTnsEJuNZM/p4lZYz5pI21pQJmITiQdkMyzd4LJp?=
 =?us-ascii?Q?/5Iqy3j0XI8jrg0aiqiOPMZiYB0492QITaM90Wtkjy8t+zqAlwau9+S8EoSM?=
 =?us-ascii?Q?W5S8ZCGGmWSIn2GKVb0gf+fS7WNgHJyAD0YFTskJa8xZg4my+9L5G8XqGL3+?=
 =?us-ascii?Q?oHVKghW7+g6bRs4qbwhPSRbS/5+RBM4yqLSS7RTrgNRlobZgsjhIXLfgkeF9?=
 =?us-ascii?Q?n3M3MpGHWs7ORILOmoC75dp2QEbH8eWZzzXghQWtGaFUHUKKckc9C+AuE7Xk?=
 =?us-ascii?Q?zJg+kJprYd7nNQ8bvxSw1GFzuJ/I7ECPApVq+AzcPA0gc5FiO7QhXUo78CJf?=
 =?us-ascii?Q?jRgXm/FI31GtwLNJfLFoKt0QG0JTdcwWDgtDEVQRu0BRu4i+2f0ZOaWTth3j?=
 =?us-ascii?Q?gqFZEArzqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d4a4c8-8f57-4e60-41e7-08de5a5c46e7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:49:10.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KsRM1BmI7bEVAuDrax6giqAVNEkwnpTX7xFrAbWcYJM96V+TuxsPYWxHiDBfqL7TA4NWN8RFwglCqx7x91aqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8480

The sdma script app_2_mcu needs the permission to access the peripheral
devices, so need to clear the Supervisor Protect bit of SPBA2, otherwise
the sdma script can't work.

As the imx-aipstz is a common driver for all apis bus, so set default
value for all opacr registers, that the peripheral does not require
supervisor privilege level for accesses.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 5fdf377f5d06..b6cb47c06900 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -11,9 +11,19 @@
 #include <linux/regmap.h>
 
 #define IMX_AIPSTZ_MPR0 0x0
+#define IMX_AIPSTZ_OPACR0 0x40
+#define IMX_AIPSTZ_OPACR1 0x44
+#define IMX_AIPSTZ_OPACR2 0x48
+#define IMX_AIPSTZ_OPACR3 0x4c
+#define IMX_AIPSTZ_OPACR4 0x50
 
 struct imx_aipstz_config {
 	u32 mpr0;
+	u32 opacr0;
+	u32 opacr1;
+	u32 opacr2;
+	u32 opacr3;
+	u32 opacr4;
 };
 
 struct imx_aipstz_data {
@@ -24,6 +34,11 @@ struct imx_aipstz_data {
 static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
 {
 	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
+	writel(data->default_cfg->opacr0, data->base + IMX_AIPSTZ_OPACR0);
+	writel(data->default_cfg->opacr1, data->base + IMX_AIPSTZ_OPACR1);
+	writel(data->default_cfg->opacr2, data->base + IMX_AIPSTZ_OPACR2);
+	writel(data->default_cfg->opacr3, data->base + IMX_AIPSTZ_OPACR3);
+	writel(data->default_cfg->opacr4, data->base + IMX_AIPSTZ_OPACR4);
 }
 
 static const struct of_device_id imx_aipstz_match_table[] = {
@@ -84,6 +99,11 @@ static const struct dev_pm_ops imx_aipstz_pm_ops = {
  */
 static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
 	.mpr0 = 0x77777777,
+	.opacr0 = 0x0,
+	.opacr1 = 0x0,
+	.opacr2 = 0x0,
+	.opacr3 = 0x0,
+	.opacr4 = 0x0,
 };
 
 static const struct of_device_id imx_aipstz_of_ids[] = {
-- 
2.34.1

