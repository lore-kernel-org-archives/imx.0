Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3503C278A
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087484; cv=fail; b=VGnNLWcztwE4xINIIy6pjSj7XHgv5pqHg5eVQ9EznsFpMisb4l4Ti0Ra9yp61R/4OWuYhxShkrGigSpOD4yjYI2kbPg/ywJTpW3E5gWoLlCoL9DhNeUXkr9kS37qPuGfVSh//55vrqtgmT2lczfEwaOyhxCJUkYmr5eX9Na/EZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087484; c=relaxed/simple;
	bh=MsPTaL1fQuI6GbdLlqqGd9wSxq/HuduL7wwWn8/IJ3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrL1KP7a0oDSbupjK9LcUJ0q7fvnmFYnkxBGYynZ07aSgKNuy9izLu8JC/Ne1y3eRfNLj9qLri1gETPMG68zdy5R2W/yCU96cl7C2LJ7o1pCVJSv2Y8hvoM8BNB8S4ynADuQFmEB1Xo+FOl8vaQtjIuMXTkHhnbiYRie+tYUcQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u2DQ+VUj; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u2DQ+VUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4Vu1Gs4txm26FrPwqnkD43AVyXGm/5+DMZ9tlTf9KKPREGx3135XP1na6wF8qjdUmrvV8BjHIYKM8nNKv6h6SHH+aIOHUmqWHY1YkYr2IRcqQRPY4RJQ9FfXZqzafTz6gmkOECdpsUba6Glx+BzFnBIVcUXu4hAADwkMACh/a8AffX0v8MPodyTjjSlPC5xXc6Rup5ziH5gKv5OCyT/DESujX6TIVowekE1XvE8rnZkNwGBhVDaSGdRxoiUjrCNl+GE1FV0KjVme7re1Ptp44HocFyNP8ovq0LHtVwue8/vHcpWt1fm0+VWhVvJMaFCPuebTu1W6q+xC/DJoxMi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm6KVbYKDu9zsL1gDblsx3YGOaGbkuLBo0C+D2+dGrg=;
 b=kEpbxIKyNVlAe79xTOejCckFZ+qFeKeNyLbcR+JfsFmBR0/XJZ4xIc7Q3mjoRP5tuHNCEU4rBzkBN7ikwlXle4UAmytj1MpRQWZcYDToPDnRiUr1gFAhIoxubi7d4XwhIJf240amXRWfv768q6aU+E0JvA6WoZy4sjMF0w4On2LprD6vx5VvmMplch8c6PJ1gQC4I+h3zPbn7dBTcBcPOOhNZr7pIa/ew0V7597WVzFIhsqkk25BiYs9d1FlLNNikkc99GrEYCOrKiqA9lqrODdblzz4ckLp5j4vyuOw4b01vKmSEq2Ge5wC7yGqZD+/7yKRTdxZjSU++VZPkvFQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm6KVbYKDu9zsL1gDblsx3YGOaGbkuLBo0C+D2+dGrg=;
 b=u2DQ+VUjEA07CtrbFpwls4QnX700Irfg7ZvHDcRffcR+AizU9YgROgIJGtcQmHMx54j0RE3rGJttyRhY2+lz2WeK7hSPZOVD2wWZ3ZKyrPnXPII0/CMf3tmKYTSYEASZYTNI/etf7sUjxOgWUgD143TJIF6XjoT+PLKyaXyf+BlieiOy+Lh9t5CnXE5JL11KNGgfD0MRXOCtqC6u3Ya3WnaokLM7ClaKao0zLPyxS8bjvbsrmo1Kyr9yXcQXms15o1DIKy4GeM9ewyX15jHqGIzNLaaHgV5TBsBMtzmG400BFEhJR7m3tCvsS5ir49JCZbfv1ycD3FBWg72uBOPP0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:24:35 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:24:35 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] irqchip/imx-irqsteer: Dispose of IRQ mappings in remove()
Date: Fri,  7 Aug 2026 16:23:44 +0900
Message-Id: <20260807072346.1222389-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 48846a1d-ff3b-47c7-365b-08def454ee7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xuteOrg7RBRass6J8kE2TrcvRFFUokMmjmwydc1zuuqERwfNI+a+/mV3q3dZCQyRan3YROxaZfX4n2LQPehtd4KZsxTZ50ggLmwyOoQpzrNqcS9XoV1eixUoQS8v8ULoXhbd1S8frYy8PkoOj72pZ0gvl7YeasBQ4xc342I6QuGvRY4kSl0AHn3/R1tQCCahTcbAif7NJOH+L+cJOdhoYuO2fxJAndmyLi3U/I3om9aNUd+QixhY2UZM9mc4Tbn03/9+wcHGUKQtg0+wIn1KUgkCUhgdet/mDka3nPgBj7SIT2dgce2ZNgfj0JO8YEGWZ3GrYta9dYlND6eC0+d+5R0Ym+Fuum3CrqN0LUIO0R8nRWFmyvrHQkYdkRIrfgAESJSskcs7zSrm+4LZpMcjyHOpl2GQtIouKY0vl2tt3AdW0r0tVGyaR0VwLAWuMPOSInTAOmsyCsuoSNKhm7eHjXiFCo/Eyvps7aUEHEpoV4Ym3iFORMYJQW/ytQyn5S4+DN4Vt9YIhciQbnIVs3kloK7XiwD5aGEtntxu+PcGu5j9aM1tzI3+aqwmdVcd3ppwPpchg08cGi7Qnlv7AV0favJL29BEh2k9HhR60eaPmzC6qnhVHk4Yyqt3dHLRIT3I8rE93u91yp58wRpulL44hrjZf/k0IcVpZAZhdzQaHvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fVAYuDUkfoK17pc3Haxl3Tvex/KLZmzyPXSwDYrj2bcwDY6k40RRkVmC4vtg?=
 =?us-ascii?Q?xJSjcrE1oqs1iy2FQM6RiDRu022+SxsKV9+5rfyedM5vPQwV8KF7r9as3W/u?=
 =?us-ascii?Q?/zdz94vJPw+9JinGUVZYt3HzAd/nEec2JRFe4QziXDSlqgZKxBg/9pk7Nqf9?=
 =?us-ascii?Q?acc+uR4vX8T9IUddDzVL5A5NmDtxwtRc6KlCFmZvgQtlnikyGSeqMyzdYEx6?=
 =?us-ascii?Q?gvuXYj7tAXgQIv8LFtbfuM37/8Gg5B7fywSsF4/HFPL9fF6zXf8TERy++c2z?=
 =?us-ascii?Q?krO3ChQzF4uUiphzvNCvVjEX5T7VESrJ+pS0P6omfNJpBS4Armz0lbnQ+B02?=
 =?us-ascii?Q?U54M5D8lGIr8+slK9fU1qpfw17zigoA1mzIjAUJBQYltt4jBMLLD7LZCw9I7?=
 =?us-ascii?Q?1mFNtQ3QkJrN+wY0nKPFfG7h7Yar0CmWYZTS0BYN1mxXTOo3Z+gkfXKdFC98?=
 =?us-ascii?Q?EAWaLhe3y8DXKKp6sJa0ASZ5jCuJYQJ4qIhYuWIMPYfUtbKqIvVzZ54lmRYC?=
 =?us-ascii?Q?cvkU8MIb2Wh652QQN34l0LZYKdObK3pElncR9WPFtIUIy5kdAVJLGiVpJEdN?=
 =?us-ascii?Q?R3jM4cxvi2fbJJCHRiDce2/bx8/LR+edgSKV+94az3bf7LZMqhg8dF+0LkCa?=
 =?us-ascii?Q?0MVBVRyU3amUfPUyb0wy6zpVNzwE9e7p++5NwOL0g+ZnXSML7Y/KQFbvVoBq?=
 =?us-ascii?Q?O3KFuKzLAWwAsAiwmC5pZrCfhu95cGfimGIylLNPEn+B6RdD9CjKztWnbUKd?=
 =?us-ascii?Q?ErgLDen6uQdYHWBh0W0hTA+Yz7pfNZtV8lXrdkOV4NHr0xYE2G7KcwotQXim?=
 =?us-ascii?Q?Rce32k/MgsL0bS50Ucu5pzcxU7CQbtJ/6t5bhsZ11UkJYRcZiQKaLMc/eybf?=
 =?us-ascii?Q?4iFXm4ocxCX8OpXpdVqnpWiNbiS9xWVy71faKU7RS18mn5dzsi8P3nShAJwG?=
 =?us-ascii?Q?9VadXqaydD1tvVUzrUbOogIMtgmwy/aLCdN8vSE9h9Pj+JNjdr/Nf4d0/Jc0?=
 =?us-ascii?Q?5o2t13UGQVGPaKNIxpkm4bB+MFShvuJi1TzK9F08xaF73MO96x+FucZQsamI?=
 =?us-ascii?Q?5LqlEMpqYJtrWs7AWL7fuGkwvrnyNRPte4CM5V0aXI5E5Aw+w2/TIFw0wXrw?=
 =?us-ascii?Q?rwMGda9IrtLXUkm3xstjFe61SrF40rAwD6CDNbPS+0861xFCW4Nel0xc3ey/?=
 =?us-ascii?Q?94N8H06pdXoezEcqe00Q1mwDmAutkZmnEIKoPngfmEc7nEUOEQZdGtsrC/d+?=
 =?us-ascii?Q?NpGaFKu/SdQL8Nt8mA5UUOddvVHmMbbTe4bnxDqhFkODdOBKuqw3orXXZSow?=
 =?us-ascii?Q?7mxs+0eY5QcoPwiUB5DJd5TzugdYaX4tChxJR3cnRJ0yDF+C/1tfZ8BXwS6C?=
 =?us-ascii?Q?J6i047ykltkMqxGwvRvgq2u2u2ZPTUiLOKuHsfs84sPSugH8cjf9gwTK2UI6?=
 =?us-ascii?Q?j+L/1xN0hWzPENcFgad5QKpxpNQMwKUNv17pfX89/rNVfG49FIBjTAgiB/3a?=
 =?us-ascii?Q?kCR4dU51aSLeOjxtBklVN6na3YKX8OOSqsnUdVdLBhsyH3qiwUvPbzNNMWMY?=
 =?us-ascii?Q?Z6J7mipCtA6XlYgIc7HmxPX9fU4BE+LeuVGnnbEH9ROTBDji9PmNdm7w3wjX?=
 =?us-ascii?Q?PjV3FrbFIeGCLtJilYIc/IIr1sDGUtn/AQfftYn3z8sYItWKDBkFsWcNBFZJ?=
 =?us-ascii?Q?44YtdxIuznq5c2Bn//Ut6x2Z/Ttcmkcq8OKLeHSSJza59SsZll5Un9qrL+iY?=
 =?us-ascii?Q?UmfUDwvw01PA/KjSxZsV3SLZDqKXaCveL8PTQIP/iwqlB1C5gdhL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48846a1d-ff3b-47c7-365b-08def454ee7a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:24:34.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Mqs8HvwLR2w3LEcY5RdSgBJ5lxRQFRMSV1gvAV/KkTwcQxYjPryQmFVR/N/kwA3QUSn9bkR9mmb6lpik4JU3yQOQurbGyuA+EBt8WdXTcnO6IxEg7KtvmkI9ZhwbQCq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

remove() tears down the chained handlers and the IRQ domain but never
disposes of the IRQ mappings it created. The parent mappings from
irq_of_parse_and_map() and the child mappings handed out by the domain
are leaked, and the child irq_descs are left pointing at the driver's
irq_chip past irq_domain_remove().

Dispose of the parent mappings alongside the chained handler teardown,
and dispose of the child mappings before removing the domain.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
Changes in v3:
 - Split out of the single v2 patch. In v2 this was folded into the
   module-conversion patch; no functional change.

 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index a2f0629b22a3..4a2fe8ba97f5 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -277,7 +277,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
-	int i;
+	int hwirq, i;
 
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
@@ -285,8 +285,13 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
+	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain,
+						     hwirq));
+
 	irq_domain_remove(irqsteer_data->domain);
 
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
-- 
2.34.1

