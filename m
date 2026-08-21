Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAB470128
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307086; cv=fail; b=IW9VzGf+KgvYwo5F4cUtzrLDqMg/ChMLElLKcAFKuEyeL/YdQWaoUC/k2YR8sc1hTpbx7riYb/qhWNjbLbCe/vIKuGZqGOr1XXaOoA1okvLJ1ukzSy5nLA3hmnEwiwCnUVukCmUOKtjgE8D/K//XCi5fTToWaEuzuUFtRC6vons=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307086; c=relaxed/simple;
	bh=Gn+Ky6iDshtRsamE64nQiD9o/6wxbNw1UL8Q3K7/gkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vAzciBBWeN0wPYlvbge4tjCQ7V+dj9MrMxL4B21eA8EoEl7adiGRtrRAzLoH61ZYOEG8frCBligxrKyNIQIFTtIJzkkxkvZslMU8GeQSimoHrNSeZLJ8/xw3dswIRXIcGKQY1xf2U02tz3+o7RS4lFwv1fn0exFYKw2yc4mAwHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WoVL5kvz; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WoVL5kvz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFEepraBjBVcrWHZS2yjAJahA4buoip9JUsf9QqkhSQ5fN2S9VbFI9XuoD5tO6MctF7RYXFfkzGaPEBEs7f9kr3qsSHc8fUxwpeW/tWh/Gs8T1qf33d/pKOP5QhLZaxw9POT2wQmruDIIfUqoJ5HgGULL+aCMvPXsPmmTv06C/NwbN/61I4JcF7ZUBXvlmWX9k3+42u91e9rfJ7Sf7dHqKdNGlTdEAvM3pFq8Q/0AN7bz3YjGSKEKW1bAph76IBuLdKNqnsAAYkEC++uAH8IVRRP9kesqiPyAfx0TPmTQo9QM6ssBsn3JZwTe4IpgA6XKDQmuxoFW8PrpKYlzy+EHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZi4dp5WqrGhca41rCIBHSjwdR0blWqPcFtqZZv+dlg=;
 b=amEZ+fiWHfYhiiAQhQJ2cl5crDlIzdMpi4qTHgBEZqwQ/qTb9Uvc7YKhm4mus2VaNXkpwBv62D5wBPMEqVl9/aR4blQXdcAY3tEwCvqlw9lfG6531KIPGtyaO0sqPP6tU8iJ0U5wQdgqhO77vLP1ReroNRdMYjylw+Tw/52Bo6CIwdZCNMo/rrvomjf7c+Yx2UTt+307WRzyKh5nCteweq3elh2sT/tffQQDzq3mw5Ab57bkYjMjMZ/50y+osGTkAPrkoVjJhHBikA9AORzi4ywr3PoH5B5HVOXiLzsdkHUZEODjCotfjlTDy1h2hVEFJ2QZtl39YuG/zilR66x65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZi4dp5WqrGhca41rCIBHSjwdR0blWqPcFtqZZv+dlg=;
 b=WoVL5kvzHaedhU20SpwpSMIXCjjsdG0P8XmI+BuMI5LuxaQUut4y3748c9pUIP4jh4fTwJLwzqZqzSK53E3+ZjGZbkpvxY17kuBwx2mydUDwhIvGgenB6pgrx1NVumcRTfxj8rsSC7QXJfHew7ukWKsS9yyPvYxPsLxNQPpBi/NtE0s8hQJT/1ItP32bQcfTZ2SVsQGMTYiO0AGgarTTw598TCnVd447fWRS8PmyIm5agEaDFMEyjw6Y/BJvf2/eacPlNopS4llwHs2ino1QZvT5wd8CQ2LRWGE5I7wHVryijc1c4hWaClfiMkg2A4GnqUA2nubaSKJzs2ElWfHboA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:17 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:17 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/9] irqchip/imx-irqsteer: Use devm to manage the IRQ domain
Date: Fri, 21 Aug 2026 19:10:32 +0900
Message-Id: <20260821101039.4037925-3-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 363fbe92-8b8a-4617-9fcc-08deff6c8a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	QbsIYUgpzZGelfHfwZo4K9bsA3ohZI6C5QCKBDMlXhJuxXVgFvCEPuTbuTCSYNGxL1WftOX1gQ9NJ85BcBXeWQrrnMJVuwq11Ypde04XfmQyMR2dG4Ss1TmjOCaXxIStogccaluyjfwaK0l3cTacWeCG0PhzmPxXQZnXAOvfyM23nlqceK+rn02sBWEADusw3Em10R0/ixYhoYWs78x2GWbdoUW0+KPZi0IhnsWo3s9IQZ7M2zb7ZIqnF73bumkEcBR4FvJ5dX1PPmRm3bt6/0a+TlC4PcrZdppStnMUjUbhlUsoawdijLkfkGy/IVGm7ctJGnAUdPYq0driBt2IvouWk21IrCDa0udzcZM+FymYyAQ5Kg+g7QuWxxdRAm0BFFin4iGt283pDUgA3FFxfpYy7a9Y1mMaNuZjIrDgUIeFMi/5nv2qlUrcLdHupZZ5qP2ZQDi8v+TjzAPG2Atyzkwqm5/3A8zJtaevd0bRQNMbeYI+kcBXkQJsWlMYyoF2gHVu5k0eweSYC6Cax+VLw8ujQqiTU5wfuzgQiJi/8moHQ7D6yNvttGcp9uVADplA8U/LIk1BlPwywFXFL5nV0rycuall0SZn5kq2cDkFGBIcZTxQc13AE0sP6sXezXDBlRemmD52+G0Pq9D9obs+Lg80gVzZSY+nYTaEhMiSKy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1+sD+ZeUojNlQgG8xZE8C/b0B59AdfF+0mqyMphLmbaaeY30wmz07Pn/db2?=
 =?us-ascii?Q?bLzW5leI/FY/sJZUOdfzDizkAJUAX95usfYb77fOqXI/B7lGV8+T3fjF4dJJ?=
 =?us-ascii?Q?/7ffBflzjjnnP8yisBw2M/pT/lE/DIHJvmVynTe5yaF/YJ9vkZjW+0ZmkBVs?=
 =?us-ascii?Q?GrJHOW1jNYPVDHk1H2uTHaUumweA/2v6ntx3XkhN0GNvTyUYt2EGw8myQ9aa?=
 =?us-ascii?Q?sDpvW50d+xjOFmt0uw9Jw55TW0hAF2Hq1cSKGSAyxhoFd3ybK4TWEKPRfCQq?=
 =?us-ascii?Q?Qh71mYjDi1mThs76EJ9D1XmV6byJ2ie312+er/cALuQjxOVoVpxibQ+EX30l?=
 =?us-ascii?Q?oUSUf05mCkk4RP7NFc1rvFNYne/l0FKq7ppJdU8gS7rzPkd7E1mn09Y9d78R?=
 =?us-ascii?Q?fI+B5Hi71d3dP/UiMBpwHdgVX5qKfyW0EbFLZNqC0L9FogB8BURlGCH3w4lN?=
 =?us-ascii?Q?3SNP25afcBfVOw865iYFvAcyhHyONkaW3OIe1RxGEK7vsweOnAkjIzdBaQSH?=
 =?us-ascii?Q?vOj4K1wuk+UwiYB37byZgpXJgvwktqoRGQJG8TdVtBgsv7WTWRKeVGrnkgrC?=
 =?us-ascii?Q?zdUeie3CyCB9OCQdBes/Sgm3QBuK/Pp4PI28cWcOgQh9Ts7/a3xDOTi3att6?=
 =?us-ascii?Q?sn95tW6RaOHz3RRqsHheWqjlAefcebB+uyeyN+82teW38ZNhZzgxEP39PNyU?=
 =?us-ascii?Q?d4qVZasKQ6SK2TpE5C/t6uV1KxKDbRiCD/B/OHQZFFYOh6waMvc6XB5gkGzn?=
 =?us-ascii?Q?Lq2dPOJHMDH5UCAx1vSoRuyoBajM7CEaUx+zI3hHoQoyvCQ/C2MqQLJlcH2m?=
 =?us-ascii?Q?Pc4SJ/QydcOaxY5s71xAH+Fi9MFb1ds1XkhNdN59dkYzhRwMPhc6xZpm4FGU?=
 =?us-ascii?Q?Tzm/sojk2ATFY8Y74flJuIlFNgpVim9MgcpwvxAEKX+HxXpHLZaxuZXLKKv7?=
 =?us-ascii?Q?jxAq8Ju9WuOSS97Y9u4RXwN+zdE5KlnN3WaW8s1ycVmAp3//WxEfJS3zDRkt?=
 =?us-ascii?Q?lLB7Cw/Y8qIQidRzC/vc9x6bM78m3mB0JV5OJ7KN6ALulwdu3fy/5PcvZy/r?=
 =?us-ascii?Q?iNym3/cMpGUneoQGyHJEG5qqB9ACw6aI3hd47ZgQ7MRvkqsn2pED52QzWigz?=
 =?us-ascii?Q?UgKuw2Dv6q0dVarwbkGI0zHPsDGo/uh6OtGX5MJuLAMd9OpppXfGNtamCXgM?=
 =?us-ascii?Q?4M3Rho0m2l4L9bV4CxcxNYfptze8IlVWHv+vaNazP53cHNQ4Mx9r6zhZT7jH?=
 =?us-ascii?Q?HfhbfSg1c1CJLUXSMdy2mTj9EM2ueoZpe3zTSF7aTQHxKS4e4mzVKyjr+xuA?=
 =?us-ascii?Q?m6dsn5NiiZiodPVZnftNYdkQLofz5b4JQfTD7AZLC9SsQVTID3/I9y6AHpYj?=
 =?us-ascii?Q?jXz7CbdN/2B3LY/+ACtlB+coZR+adC9bI/IHQ3drNi3hbs/kpq+HwAjExhQb?=
 =?us-ascii?Q?xgeYIviKo1yTp0hS1aKaA8lbRSRBsGn999SURJms+7ikB5nD2mIbc2ukPWoF?=
 =?us-ascii?Q?Aq8OgpUHuhFxWmLQSE4WBv+brdnxF81JH0K4dPt+YcGvgRf/gjNH+deBF7UZ?=
 =?us-ascii?Q?5H2xQzZHvS64zvPAacMZC+AdwiNVLpx8Zq8idHUutXWFMzQDKjIi8W04Bj76?=
 =?us-ascii?Q?ZYQcGJJO5EHCS4we2RgJTcF6jcnCX8cU2Sw7Y5TLAU+KTcSoK292l4xNE2e7?=
 =?us-ascii?Q?XgandG+QX6pmsKWOa8xMKjdx1FduDdGJEfTgjlguJQu2t/9cpmZKGe/mKvX6?=
 =?us-ascii?Q?ekMW/evxzT0s7KYgXv2e+Mn8JQcXuQoLLboqh+Kd9N7gJ1zAPmG8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363fbe92-8b8a-4617-9fcc-08deff6c8a04
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:17.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfs1VER3tJraY9P6AunICeMm74EXGa6NZz653euonGzAX0iTBMB9Mdgj0/Vu8bEz4WFbGVo119aLObaYU/oSLnrjBcLKbJBwpCFF2bXrToFc6akIx62Qt1fdrKpjXRgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() creates the IRQ domain with irq_domain_create_linear() and only
tears it down on the remove() path. On the probe() error path after the
domain has been created (the fsl,num-irqs sanity check), the single
error label just calls clk_disable_unprepare() and returns, leaking the
freshly created domain. The domain-creation failure path happens to
share the same label correctly only because the domain is NULL there.

Create the domain with devm_irq_domain_instantiate() so it is removed
automatically on unbind and on any probe() failure after it has been
created. This fixes the leak on the sanity-check error path and lets
remove() drop its explicit irq_domain_remove().

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 1b8d0c8eedb9..c1df84551efa 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -237,11 +237,18 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
-	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
-						&imx_irqsteer_domain_ops, data);
-	if (!data->domain) {
+	struct irq_domain_info info = {
+		.fwnode		= dev_fwnode(&pdev->dev),
+		.size		= data->reg_num * 32,
+		.hwirq_max	= data->reg_num * 32,
+		.ops		= &imx_irqsteer_domain_ops,
+		.host_data	= data,
+	};
+
+	data->domain = devm_irq_domain_instantiate(&pdev->dev, &info);
+	if (IS_ERR(data->domain)) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(data->domain);
 		goto out;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
@@ -285,8 +292,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 						 NULL, NULL);
 	}
 
-	irq_domain_remove(irqsteer_data->domain);
-
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
-- 
2.34.1

