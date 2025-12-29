Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74655329C69
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019813; cv=fail; b=qczraucZbdPuldMJB5kYObAxmYI/7WpqhhdBUaauRZXanfp8YNpLzVTWdzwR17HcjyPowBmAJO/S237bp2BcFuKuV8Ch7B5X9ce/xk1p4KBkCL41VgXS6SsFThyyywaYKd2jFA+ABj+FliGUIfvFMc/2KgN4+h+j/63eMXFE7co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019813; c=relaxed/simple;
	bh=nVrm846pIWwu8ZPCG4QtnUTwFjvIdj1VkmJsmdjTGKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjkPAvfkhOL0ohT/ISEcvl+UvoRLOkOtrlnPYI1ya0HprGedatFAhje+qiuRgs9YuXNbQ8AVcS4cs06ERmH1E+UERDS/PrCSp6kCJGVzc02Rlt0S7CmQcPIob2ImLBraSUQVq6TfMPg2Qi4P5464V9OiIxlvzMNKwwy5QVRuuN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IGJ2pnmp; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IGJ2pnmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO9NUErWIeRmz0Y2UfUWSrWkB1oJYoyt4Z3Z8dct5uG0qA6bEnH3OK0rbUPqs6CHNKcaFkuk3s1jrIXqB8KwVRJ2zfXNES+8jboFjC+2uI5v2Yv9I4TqGBvOER/2wTzQE8J55vT2Wned/0acrhkqtMcdNW7Ky0eu4uk+d4WoAUa3b+bhVM/7TZ/dCAVL4YEIh37y/RJnL0emiVVNA4wiukWRZnEAVoynOW2JdQ687IxNED2ojcU0aNxDVGDPKf2K5ibnzhjk1eIRWh9ddA3nGD5eJjXZXmAgMq9ydEcw1Qk0u9qlCFSZrtjL5H7EJlaz1pSO/03CGc57i+qGVEpW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=K9JenpNqHrr2AorcsW4+Kt7I+g/P7cJFw8jeJxcIZc+fWCHuRte00EP3hcHm4tj12qvYuww3SbJV8P45xRL6wZxJahA4A/RNsUBBzKoP9XzqiVfXF9BsXRpjYqFQaKaLAYCcJYES6BV7sKspVnrHUOluvNx3O6ihsIpHEmeQWCDzNJUa1ZogrXbPqcc8EdYPdH7M7nJYNKSlE9i4/GMaoUgDF/XuCMyIfjhWf5i/DvmqoEeeB59ls8ls+vE/H4m7EpI3oLIlWapygu3PMvKcy4zJyP3FyMbaoUQ5DmFVo/3Yx/Q1qQLbiy37OWkUvo4sC9tC42YRPefrmlBWX3nr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=IGJ2pnmppP7NHoTcNmCZrcySHzlDYkOzGXmepVEGoOEnIlRFnGu7PAcSjef+ORc58BvY/1hF1IJa0OYPhcY0mdL/fuH/5HK3fKRHSe3KQ5TAu4gddo73mMvqKuzQRQo/GlKW6VhLhpqjn1vsM6WSwwCljfVnVA+YqN7JFTxppiqEYizDYrMhhyid6sRcs51atCgpF1F65JUQ9o6ZJHJvaPZM3EWjOIfSSeSAV8MQXpIAyJ9WZ70qxZuCJHUIKo468ftmuVAG9kdl6aDqq7QMpGGmObN1R9I+gASr1i+qG0LKnuXEoNOIrUv6DrOMjZCUNPaOVWHkj/i3Do0EWp5f2Q==
Received: from MW4PR03CA0288.namprd03.prod.outlook.com (2603:10b6:303:b5::23)
 by IA2PR22MB5531.namprd22.prod.outlook.com (2603:10b6:208:4b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:08 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::37) by MW4PR03CA0288.outlook.office365.com
 (2603:10b6:303:b5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:07 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id E5540E8F49;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
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
Subject: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 29 Dec 2025 16:49:59 +0200
Message-Id: <20251229145000.421426-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|IA2PR22MB5531:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59097546-131b-4866-ad15-08de46e98f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hSzaiOl2z5QvvIKv46i3WVEJo1zsQeKNQIoVlf5frBbvbgT7NHtOEIeENsw6?=
 =?us-ascii?Q?XDYYbYH4FJbtBRSMerZETtZApv7YSqJwE4hZ2li390sQ4A1RSHnRnykTXl90?=
 =?us-ascii?Q?ujrRnHR79R0ukPNwpRZQfdKG/NqTZWm8Ei2uuzO1w0Kv6//pBN4y8X1pSwvw?=
 =?us-ascii?Q?Evm8U2YqCJsS5OvhntAeTR9zzHhNLxz45FxxZLbg3WMJyy0MPz1Px0ECai2Z?=
 =?us-ascii?Q?L5Pg8uM7Hicbcp03X6HKNO3pzcJ1Vk11ioMEtRLWTGUF1vV0iSdqpHVwHUSX?=
 =?us-ascii?Q?aGdB9tJYA5ElqofUSrq0Jx+uXCbgNeCh+0/Dq0Grq4HgqOmzfV2PgPbyxoCh?=
 =?us-ascii?Q?JZx+vYWJSngj2A8ra4ZxoHAGrq7SftWQEWiqiBcvDZAgiqV6Zb3hY9vDjn5R?=
 =?us-ascii?Q?xMXkd0auiRe0nayWwyTHmax/iK+LGItxJHFGt1jtZwRYZho0kSs69tt/PDgV?=
 =?us-ascii?Q?oJzGmfbU/vYFe1qDvIwiItCZf0Ije6SWYgD7D8efUJrQTtMQ7iiNVIZsccwi?=
 =?us-ascii?Q?4sV2LrISGkXpzlYrWlgE7V9d0bTEZDDXTl3BxLIx8l7TiOJ9dLodnsopQTAR?=
 =?us-ascii?Q?c4BU85aQmLmRdlsu/fphUJDAS4KvERk1frbOI8KQpQv2MZ31k4XxLNgMZfnS?=
 =?us-ascii?Q?xYsb5dxtqEqS0HzA8N22Z7S51MXnUTbl5h36/0W6gqUAuNi73JFn/gfpwS9r?=
 =?us-ascii?Q?ccPJIg0t0tN+IB5+GhLgkRt+D708PtaZ+8BxjD9u6BayZ5t2f/O2cLApjJN1?=
 =?us-ascii?Q?FteXEvAuviFE7W0ijTuFSFOlHjotfTtm9cXLyG0sc6nVBYKqX5HE51FYxi24?=
 =?us-ascii?Q?R7o/y0I5mz/Ggg1/mlM6hJdqxXmhwFQMYGevEOncTrAFYuC+fCzPguewqXW/?=
 =?us-ascii?Q?kwju3OiZQOUyzcvn0+uL4EMXgpCwSdgnhEGxV7IqR516CNpI6+Mery2tHyPU?=
 =?us-ascii?Q?Tptkbja26nkyRu2oL/BBpQqIO9tfzq5w5FL/fKTp92zYchmlxW9GUKyL91xg?=
 =?us-ascii?Q?TnbJHAjYmPaTeZMtmA2XRhmGCgRDhmiGMCpd+0XT1ZtcDSjb7CYo8Rn6VwzC?=
 =?us-ascii?Q?8zNJ5wuvoLp+VPlbTrl6xEuQYrmCDrxZ1pPB1e/8fbpqA9VMaxWDaE8dg+Mh?=
 =?us-ascii?Q?KxODndYwcpbsKgLtzmTAIxml3RD0528SsZFxDGIxt4HFvo6hBWM2yP/untMU?=
 =?us-ascii?Q?8zlt052JTUMXneAOQXKxIYYU55IlF7SrxpfBp4o24boC93OYSfD1sU95YTiz?=
 =?us-ascii?Q?htGTjaqLAKNL+1sg0jXhLSBQj0RoGLoqmX4a4n+pvF50uppJWSfDCijC2M0t?=
 =?us-ascii?Q?qdPHpv7aSSBLuHAL+nEhw0Bl3ysN9Ew4azAv7fJSiB/MvVOlV2uTvcTedbUf?=
 =?us-ascii?Q?ws4y/k7HznC/aB2bYO5IKqt9UH3FaV+CR8DyuFQzy6gyMCwHz8TRIeYsuzzM?=
 =?us-ascii?Q?TiDeC8fdp99dVE/eHN3A6nimJ6QxVIzQabKJ1/tdgdMpV/Fgkj1ttPiO3UQ0?=
 =?us-ascii?Q?A4z9lxaWRr3LNzvB7/7DvcLwPiDw+EHKJWtNbsCZXuv7frQRNv2NmBQcRl+V?=
 =?us-ascii?Q?8WNfRzkPaV5+Yc2y+IY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:07.6728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59097546-131b-4866-ad15-08de46e98f5e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR22MB5531

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

