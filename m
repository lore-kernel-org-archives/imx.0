Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47030B532
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223345; cv=fail; b=h0v7RKDHd05Ac8uDoAE6Ft0ERQ3OODU+te9dMGPHQdK/SpbZCAAr/unC53yCWJy1iQWeGXERBkFKMvdgK2h1ZKmvT6gpoWHnVgtsm7dinn1zeTNZYi0SJKT/Y483MthDUdZIMXLJB5lntmWcUWXf1KZyDMDVC/8Flf0BtMQevSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223345; c=relaxed/simple;
	bh=nVrm846pIWwu8ZPCG4QtnUTwFjvIdj1VkmJsmdjTGKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQivvA3pdveu7HI3huDUfi9CAAH4MIOCnZYOp5O7HapJGkyC2paDyZADg+whqn/nL9AOcuWfeXGNbEAjzqE34GBMvOBSUPbbCLbUCwhjMnfSFKAtoaZ1cm/EaoyqHh4H2xerVkd9a4aB2JFDGXErJQ79knD3t4ilv/mEPdX0rpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=H0YIwPNC; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="H0YIwPNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0c1izGEYgwMNj49ZiKvuGCOZ4sGWa1K60YLM342NCxAryHpnVF4paAM8aiqOqizq5sWKxnfsiJLiDucjgLPSzzORkThRgF3e3jgLIfVma+H+8KBmw8sbh5KpRlld5BrCvb165eUWbH4SksD56L0ZIHEYRs4AFX/9/opFunCR/2/z7MDqnYeJgemH3i5sjwBgVk40vyoTuJpolb6s1Raf2g4eU99ilyQtL5utWlyVxspKreSSYYkrEegGme06hAUDQ3EC3mXqUNKjyvLyS1Dpy15lbPEm3hESHV1fiMw8YIezClmqr+Q1u+u+zn2+zSdLR74B+174VBVZ2gawZbyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=A7v8N6VCfdta1U8yH87IYFvHWkVWWNjBLVhepIdaB2zin6L83iCLRj7mlH5GJOGKnL41Z9/IMdqIa1F72ln13FF4+C5QV8/Wfo+vLBJXxURsftsK9mQf78taCL6wqVT579upOZcB/KIJMlB9Jeib2FvimpyUbFOM1HlQbLeAOuPcvswOk7QbOcLitoQKbFpI9ItmFMymCNcMT4N8+wQdrU/qEj+6M/9iUN8oKtDj+3IA11IrYxl6hKZnHj/2DU7DFzC1ST0t/UP/ocNeq7pCSLYd++YEl7gYvEcfgUzvEgszxo3G2JrCigz37hPEh9qidcsxkMn7mdEBAsO/RcZQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=H0YIwPNCYbfIfBFJxNBOXqoq8rW6zdReA0a7Sdi+YA9BrHAm2Uk3GZ2xj6/iBn83iv8tNDkbt4ZlPw/pC5komv9lVUMHJDMfmxLkQmZDC9QX0Gt3/tZU7vMAjve32BPrem1B5pDzSSWhChvFQk+6RMemTaM26bsJtaLDkb6WYYVGyqWCIpgaHoN3RJn0JD2mizYMZYgbOR14tCN9AWG6vZ2/chdeLGh/bBNNy41lfTu7c8dbwp6LwyceY6XeibNuEfZ3EQyUl6l16eV/yMnoLf9IoLayn0ssdZ4BclQsk9tpjgYFm2Q8GTCVnpMDbLh8J60cvWsBrasDwo6gKCHoAQ==
Received: from BY3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:a03:254::26)
 by LV8PR22MB5316.namprd22.prod.outlook.com (2603:10b6:408:1c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:59 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::de) by BY3PR05CA0021.outlook.office365.com
 (2603:10b6:a03:254::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 13:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:58 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D4AC9F2E71;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 12 Jan 2026 15:08:49 +0200
Message-Id: <20260112130849.3748465-3-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|LV8PR22MB5316:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 29880615-9837-4045-5448-08de51dbbf74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HUN/ZqrWG04aks7B5+c2+RaIaWZSlB9z/9r9DAo6UwgtcVn0EjHHYFqA+MXE?=
 =?us-ascii?Q?AzLL/EpFxsElftrQqHGrBtGvsmdeGvhVFi0ZLRVGeRd8ufe8RaGqqeRWAQZ2?=
 =?us-ascii?Q?mAI+pU8k0WAFllzETuHJ230H91bq2XO0qt5/j93fNSMoRIm1490b3VuNzzEz?=
 =?us-ascii?Q?jAuaexpD/BjGkhiKrO5uhWCiJnZ++iCoYgRH3rI55DGAJPkLMjXD9LjtL2Nj?=
 =?us-ascii?Q?5ByoQq2qbmqIm7wtbuaSjhOr3sF3ImuVVwKNzlJrnP9ChDlfucZfAjboRQXE?=
 =?us-ascii?Q?c6b0QM/GsIwiicuDvfG6j2ceXAyD6J5kgZRFhdNK7N6rnNEogvxjJUvXUWTy?=
 =?us-ascii?Q?3/1hoXkongZKJpNGUUD4RiXNAAx9/PLERzF40KlUkB2sfrdPpcSsGVdhZki7?=
 =?us-ascii?Q?sVAZUMkSqSVOLLYBFen/fErg32kOajymb26o6LqomG+SUlzN+wQ0Ml2QmXUb?=
 =?us-ascii?Q?q3FurWLu9vpH/TaEEQk36U7pgoWlk7zjqPXenfXviApLuQys7VsO1eYKf/4y?=
 =?us-ascii?Q?YqoqTkjkq2yttmniT4XDmsum/knQB8tVd+YNQrByr38DipaYmoHx0F8+38lH?=
 =?us-ascii?Q?ajzbnM+uUipMmpOl2OJ+13GgW4urFVuroPS7rcK9kuGBzCpQxOaMrxJbAuPE?=
 =?us-ascii?Q?hLBjz/P6vZOBW0cXxqX5h2lhkgSTKf3lap7xD9QQL06JcyDfVm4IOungaQf7?=
 =?us-ascii?Q?eu++YMtNQn8gg5QJQITf5FF+ZGDiBTjtRd2o0a+GKyAdXXycUr9vqaznaqxa?=
 =?us-ascii?Q?JerBC7jCdhcvrBgbD3NMVMyYddD+AH/zWNTiUhDr0s645urSntplxf+3l7bD?=
 =?us-ascii?Q?VdvUFjBndCUU6WFO2fIUVkua/KWa9o0EueOxZZPOZ0CQc7zNppK2ZP1BY2T0?=
 =?us-ascii?Q?bcAwxzqnwglihsIK8goxVH/V09K7W/fZpxWD8GYQ0caopb+WLhXLz6a4+n6q?=
 =?us-ascii?Q?FhRZmgIIC/WSt8LpbLqovoApgMG6+PkbdZqh0eVsJPwbPx9Bott3kJPjhk9Y?=
 =?us-ascii?Q?pefASV9SDchCclXK/YSbIgg3dTYGWHirt4cg8WfjekmcLhEcp8Bd+s63eIEC?=
 =?us-ascii?Q?iBCn0XMmeNulXNJcXJRLMOd2ARyihalTYSChnJdddmdBDJD1dUJHxyaz98W7?=
 =?us-ascii?Q?Dzp7ujjV0w4of+qJmdSAdem9ukEDBpxKO1276wTc2hM8+VMJ4HdFoqX3SGiy?=
 =?us-ascii?Q?3d7DHoW9n9eZdBjdyGU2mFQQl6dTnDc9jCkcq0YzFHT5I7Ca17IWZp1JPTmB?=
 =?us-ascii?Q?gr6wVVOptDXvwaxnVM/PPTrmL0npcIZFORL+73XyQKCeZRG4XK2wGAvheTm2?=
 =?us-ascii?Q?tKrXiijWJZtzwYH5srGGBtJiIj8oZ8vnkgG8Xct7ocaTVCO8q/LkXRubqvoN?=
 =?us-ascii?Q?9BpqWUuEyK/0FlPX5ty4msq5nkvdUo2/RD6VOvirittx4X6r0FmDsxYd4hd+?=
 =?us-ascii?Q?59922FndWX7qhcu5BBB2Rt3Mg/VeflWbxrbpKVnh4QHGv0kePqEp9BuCsnXz?=
 =?us-ascii?Q?W7GwxK3QEcUmvMDqf9LZzMyBg/y4QosAlV6r1kbTHGTC4gXgVjps0gvGsF2i?=
 =?us-ascii?Q?JwwV5iNBVItU+VdfK5c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:58.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29880615-9837-4045-5448-08de51dbbf74
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5316

By default, the driver suspends the watchdog in low power modes (STOP
and DOZE). In some situations this is not desired.

Add the possibility to configure the continuation of the watchdog timer
in the above mentioned low power modes.

Note:
Please be advised that the difference between the variable name and the
device tree option has been intentionally selected to uphold the
prevailing driver functionality. This ensures that the watchdog remains
suspended by default in low power mode, while also facilitating a clear
and intelligible device tree option name.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 drivers/watchdog/imx2_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 4b3a192ee3e8..6e837cfc3c5a 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -71,6 +71,7 @@ struct imx2_wdt_device {
 	struct watchdog_device wdog;
 	const struct imx2_wdt_data *data;
 	bool ext_reset;
+	bool wdt_suspend_in_low_power;
 	bool clk_is_on;
 	bool no_ping;
 	bool sleep_wait;
@@ -135,7 +136,8 @@ static inline void imx2_wdt_setup(struct watchdog_device *wdog)
 	regmap_read(wdev->regmap, IMX2_WDT_WCR, &val);
 
 	/* Suspend timer in low power mode, write once-only */
-	val |= IMX2_WDT_WCR_WDZST;
+	if (wdev->wdt_suspend_in_low_power)
+		val |= IMX2_WDT_WCR_WDZST;
 	/* Suspend timer in low power WAIT mode, write once-only */
 	if (wdev->sleep_wait)
 		val |= IMX2_WDT_WCR_WDW;
@@ -326,6 +328,9 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdev->ext_reset = of_property_read_bool(dev->of_node,
 						"fsl,ext-reset-output");
 
+	wdev->wdt_suspend_in_low_power = !of_property_read_bool(dev->of_node,
+						"fsl,wdt-continue-in-low-power");
+
 	if (of_property_read_bool(dev->of_node, "fsl,suspend-in-wait")) {
 		if (!wdev->data->wdw_supported) {
 			dev_err(dev, "suspend-in-wait not supported\n");
-- 
2.39.5

