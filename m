Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E163201
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 06:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733986112; cv=fail; b=irGRQeGw3SatkSMySyiQgeRnrbBDdeLKZHShrXmwVB1zzTPZe7/eFSj4o2lqvZyxU2aRIQ9wwlq2qIJFwdsrCsCenERIZWoAMgjOsDl8wyv1k/ez6NVUOuYScL+x0rBvDNDd63T96jUxV/kgT/7gJXbRWqU3x5wFQNgt7wQw/kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733986112; c=relaxed/simple;
	bh=cu2G4zEwL+Tco9w3No29IwDxiYtJfkwmu16z1wGfHAE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lfBd6Xqf1sYdIMci1mKypbLiEmixFD2ijaquKB6AaeoPjKWnr1CD+aP+Q2aO9/KzsPU9n0TnnHPz7BiShjGo8Jj6hF4UHgDrh2Wajf6bGGxMglRwu0/06zkEpSSM0Xxh9xBVL5a5XFXmWYRwqYTe6sv/fWAmuRBzHigUNVvjjbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRSmXECj; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRSmXECj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u21dgLcyvJYCKCo4N3CXMQGFJ23XkABZXQBLNlBAVj6mCqQVzvdRMyIzlCQOxKvgQGrBsqR1ZYZGzIILuaNEUJ6wFZz8P5D7+eBCaMQRRo2fkBhdqP92i1+NNOuzMDl70XnNgBTJ+TpWdWs4oXSCAu27oevs1IZEEhqsNYnzZN1v/m0arBJIos8d/JjPCXN/90FCT2jb4kMRcRJC4LMb8rQMp9hNeNUkk4FurcvBNeLTERx9+mkfH7Ui1MssbNkQ5l5d8kThJoC5/APcgvarGc30N/WpNW4B4SqZKbpItEuzxu2FwIwYDToeimKih7R5etNsaPlB9pvgo3Xf9pemRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgw6i8sSMwo5znOURdllUPAZRLrqHnpQaX4nEz7uvS8=;
 b=Gc5NgB+EU4YOWhKXpRpPH2CCUs9OP0SY2yEQSwant6G+X309tsZpZEPvQt07UNJMa2XsAYMPDie/BXQEtmLYa7oYZ2X8hGq9WdB4/vgSXlBf3sp9UauD6B8+bBjA1CNQ65mWJzLnRavztgPSvhonRqI31r0jO2UpX2sFwRIhFH64j6KEJGmMXSQp7aDms+VOdFL55V7ApeN47TO+ibeS3u2eAGqkOQJPJiK+zNkPKMEZXZZDR8ybNw2cQthP/O785XTsLtQAYMzfGhqJXXcQ9nqQNQNE8HVH/Dq9pVMGAqiRVXkXIFJaAySDjQXpas6v65wRuVRBYjjMQXCjz019VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgw6i8sSMwo5znOURdllUPAZRLrqHnpQaX4nEz7uvS8=;
 b=HRSmXECjslBI59jqoc6ld0Z8ZUGrTYI/4McRKsA2JGKwx6Xn0AzNR3gOhHSZsI2rMfP2W19PLLlFF6LjUb6tkiIIcanqZKYoz/YSS/xfltGBpVvgBxIxwzPPUMY84rBLS6HDksnTgW1fXSNAbG2TJySGtmc74XUKIbiHOHT2qUBWMwHHO35wS6PfRnsMpIpO+gzZlFYBaBnerwfMFzSDIXIXW0XoTtfx5kmRZ6ngSGmCBgFP70uwTdhkHXeUvamo6WsqWF06BWg/fTHjn+FIDs88zpmx3HYdMWmEvY9rJm9YngxRC3oN1WtIu31QK7ZmFs8rcjpo6qV6jL2+MEhBsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10210.eurprd04.prod.outlook.com (2603:10a6:800:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 06:48:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 06:48:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v3] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
Date: Thu, 12 Dec 2024 14:48:34 +0800
Message-Id: <20241212064834.1353149-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10210:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e630ba-238c-4077-f0d8-08dd1a78fa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l8yG0qik0FKyDiQJux4g0/i7lq0H1mrbAaVmY0Yc5cq1+sgbzo8L0Z8/PuHY?=
 =?us-ascii?Q?w3sulu6dmkH4RklB0Dq0VMPTsE4QhEjdtXUu6WTmNZP/n/S4nDMQh0IPQp18?=
 =?us-ascii?Q?30d7Zf1FJcvOQWRE6SIyTUf/EwuKwEBjdVCxiFlDh7oCprAjkoFPcI7g2hvI?=
 =?us-ascii?Q?jT9lGluCCC/AltDPQis5A+E7XsPxIhvirGdSlUpwq7CTBoWIP4cKsZIvNvwd?=
 =?us-ascii?Q?3dfp9CENEdlXpRAiL+8Flx4jF5/rXZrtVCFaNK48q6ta2GB2d0qzKS6+mRx/?=
 =?us-ascii?Q?GgacD/vhPqN6g8LCELmrMIUsSeBzuFZIcs/QXESKqZDRdvVHNZSUNql4WdfF?=
 =?us-ascii?Q?CC5hU/PJhH6lB93UOIgIzH7Z2GeILhLKW5Pbb7cy6LIMSJqhqG0XGhGIMt9P?=
 =?us-ascii?Q?sw5iarjQQxKBaanEFdImxdMBjIFFkFkaygnRdSyfpr6+u43g/pno8wNk/shB?=
 =?us-ascii?Q?GOfVf9VkW+yb0rxyYwecQEJnTBo8T3i+jvte22NYMsR5opvXxIs7goVajWI1?=
 =?us-ascii?Q?9j5C6aIAo3CsLYeoSq2GWGyToKwGOdgkWtZ1YKcB5bilctjd5agxy+4GLywV?=
 =?us-ascii?Q?t36LV45L5TLrYdXNH1gMsiPeLYKRhDaIhsBELy7T4OmJRAPrgxhiBpAsdHrc?=
 =?us-ascii?Q?s5nfk1QqJ0AEp7bb9xcMdm8EmZTl71OandtzvQDZUn0AzPr3MuQB5RVuqQcV?=
 =?us-ascii?Q?G+RRIkcOHPSj9fjgKa/+bxEgM0kS6qvbEp+wUGX+xzQTmLI/HEJoF2jMfymM?=
 =?us-ascii?Q?b/XXBigHHrCjtK9TpU2V7D73tMZNAPiXHC0hGtNtiCknw/Td9+zqSQ7V2Q97?=
 =?us-ascii?Q?4HoBLN1wOGk/foAPzhBDubg7G92AXTozE7SL/QgoFuhzf3OO7qq6u99NeDNw?=
 =?us-ascii?Q?a3BxDHw0sgcL7GsS6e8nH3mdIIatofa4IkYi+oJ+EJce49ZMiJd+oaGYs5Dv?=
 =?us-ascii?Q?JBcMBXuN5KyD59+IPs5Lot5X4oiHOukjw0DKz+ysw8R8azCeR5MJMF0BmlH1?=
 =?us-ascii?Q?RAEfXYGVYUu2PbxaRIP138RgacHEUpJBXpuKlxMIyp/3ruT7KGCwPzs/S9mW?=
 =?us-ascii?Q?hHKs9Bv88axpgyyqdNC8MxvGR9rdHBavUpk+VyfjyCQFi1xBEx5muheiq0LO?=
 =?us-ascii?Q?Zmn/UOhDVYY9R3RK3RVBX2j2SUQtpBN3xOWHKHKxEFOHnMCuG5mClqkNWCcz?=
 =?us-ascii?Q?35p6cVr8b7bwfXeOqCaxsw4VuDws0UbpePmpmIrz7NKk8s9ZY8SaQPz//O2o?=
 =?us-ascii?Q?6XcEKDYyLuHfUSzGVgfbkHsiV3na58LKSxpX6CNY38lORo/qYZBJqBXYSM1p?=
 =?us-ascii?Q?VWNfIsVw/YWiPomjJuUpzwDvFwhaEBgQQjSeWobAjDpdspkpQkYWW5ktF9lt?=
 =?us-ascii?Q?l/p23iHQoWZ5Pw7+MbGT6pZTc++cG21ZSmVD+yU3zo7HEXPnDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tCoalMMMmDCLL4Yi9wU7nlE3hzhNE28ToIkekMq6GWBuYOCMn69yklLhNvNA?=
 =?us-ascii?Q?W9S8+L3BYFgzqHP/WO0UUVsUIq3hmGvtRjgR53LBceDl3lX7b2I9vFCyds90?=
 =?us-ascii?Q?c2N5AqGGhACSsolRYpX6U+b5jLzJj3wXGEoFuhu5DsIAL0MU+CaA6RZPCeOv?=
 =?us-ascii?Q?J0w8JLWYuizUDY/0KqGsrBitDm4EQgdoSTaLGnxRvdqwEJe2olzY06hXlTCc?=
 =?us-ascii?Q?8iMV318PJzUV07wkKUzwuikxtM/XgaFAZslXJR1TdP48x35o2VPsBXKp4WbP?=
 =?us-ascii?Q?WDl6/dtIItsMwcKDbQbogeUqE0rI3wo7Qhiji5p3P9tA57oFpQdUJ+Dsipqa?=
 =?us-ascii?Q?NXMhF/5iYk6Ak0lAPeSF+0SzoIyaNjlDQcpLtTlkOnCAfY+Al84TK5bd/P2D?=
 =?us-ascii?Q?M0b36WIldwiDvNknI4Ltyp6PaInO7xthGQjg64/v0uDjWw4k1z6QcRXOiKLW?=
 =?us-ascii?Q?jX3uSaW4XLYfy6RL2wrzoGRO99wOG4pSXmXcP7P7oV6q3El/WWAGi1I1yaHQ?=
 =?us-ascii?Q?0apeBNFafWOHJBx0F+OfDZQRUROrxdg0h0FFg1wTwJXdcGApcm2JI8Qr11Ej?=
 =?us-ascii?Q?LnyC+VN3bnWwXMIRa5Qzz7KMm3CXHbmDhdrNAzQk0w96j0s3HqlGvLO0oOWn?=
 =?us-ascii?Q?XPR1JyAkE1Unz7Z5+c52Yz03iwvzpbRMTs4fRggWDrr0f+4gxfcxO0zKwlZw?=
 =?us-ascii?Q?yhTo/xzAi/0EclcNBEacMRWVmePiDrh+e7TrfCGUwUrLl88lp53hvU5jVb1S?=
 =?us-ascii?Q?kHAFmRJ8yTkiofLEi455ECV0vYp+dnwg57g+0wKx3bvOpf9KK7GfhaVRLMTi?=
 =?us-ascii?Q?94A+GOOTNRavvFb1gol+8CiCNuY1gbKhcZM1NYsOzy9E1q/Q9uoIftMTMjtu?=
 =?us-ascii?Q?cu+I5GKrWD9hMku5IhXEaGWxJGoZvo4W93mIXuC4O4v9qVS8imdGzIhMsDMx?=
 =?us-ascii?Q?D29rD4yuHT+JooBDW3O7ffuAyoyxw9ZEchWenBKzqnOms71l2pEuYxQR7Lr1?=
 =?us-ascii?Q?uvvKX9fqmbcHKK0J4v8sHrAGykTqQurkRjbi56QKEE+IiMSxJ/OMVRIJ3DuQ?=
 =?us-ascii?Q?5ICH6uONoCC+1sXWSEk71lqa+EqLcmo8qQiieyNf7g229iB2bR+CzNYqSRqi?=
 =?us-ascii?Q?CXZSOYO2PjJi1BcHZiZ+2JLKJ+nwABGHA0hns1TAyNok1hr1S3oiruH8TnEm?=
 =?us-ascii?Q?XuhIfl0kEXhQ0klq5BpZhKHtAzPs78JXendkFGXqvQGN2+JvMqrl+JTshSuX?=
 =?us-ascii?Q?opNkRcnOz7sErA68xfCMS0fruwHd2WuzZiRT4NEUmLanX86E7L4p+3nQOwBy?=
 =?us-ascii?Q?XhiUwfJk+ZJgUPxNp9IIRUNjWPf0+WP68/qQ0IO7cC84TLBRBAgSKFyRzUbb?=
 =?us-ascii?Q?ntzJ+xgn0b6kctgW7qvCyzt51mvnphrnbkCuD60SqQKZN6WUwbOdltP4g4/H?=
 =?us-ascii?Q?VmhCXSVn6yZL2rsc7IUu0KlyiWFVd+J3WH/ceuuviWguGZ7xHVqJH3gPUm+v?=
 =?us-ascii?Q?JT12aHAynUMEku6lJFWq0q41vNMwtSCMEuCJinnF+1sQWmkKkfYO9soqS7Pv?=
 =?us-ascii?Q?aGMr5JE/6J/NWwCPxXecvaM2nyCynn5zc0cKnsX3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e630ba-238c-4077-f0d8-08dd1a78fa00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:48:25.1847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOmGhZG5d1NCLdllCRUcCCHRjy+bfAEED7+KrvchidDn3/vzx3kV/5Oaxm5kgPQlPniBkj4vJ3bK6tDGDI9Yxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10210

The imx93 is the first supported DDR PMU that supports read transaction,
write transaction and read beats events which corresponding respecitively
to counter 2, 3 and 4.

However, transaction-based AXI match has low accuracy when get total bits
compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
So axi filter is not used widely on imx93. This could be regards as AXI
filter version 1.

To improve the AXI filter capability, imx95 supports 1 read beats and 3
write beats event which corresponding respecitively to counter 2-5. imx95
also detailed AXI_ID allocation so that most of the master could be count
individually. This could be regards as AXI filter version 2.

This will introduce AXI filter version to refactor the driver and support
better extension, such as coming imx943. This is also a potential fix on
imx91 when configure axi filter.

Fixes: 44798fe136dc ("perf: imx_perf: add support for i.MX91 platform")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - fix checkpatch warning
 - add fix tag
Changes in v2:
 - modify subject
 - add comments for AXI_FILTER version
 - type -> filter_ver
---
 drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 3c856d9a4e97..843f163e6c33 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -63,8 +63,21 @@
 
 static DEFINE_IDA(ddr_ida);
 
+/*
+ * V1 support 1 read transaction, 1 write transaction and 1 read beats
+ * event which corresponding respecitively to counter 2, 3 and 4.
+ */
+#define DDR_PERF_AXI_FILTER_V1		0x1
+
+/*
+ * V2 support 1 read beats and 3 write beats events which corresponding
+ * respecitively to counter 2-5.
+ */
+#define DDR_PERF_AXI_FILTER_V2		0x2
+
 struct imx_ddr_devtype_data {
 	const char *identifier;		/* system PMU identifier for userspace */
+	unsigned int filter_ver;	/* AXI filter version */
 };
 
 struct ddr_pmu {
@@ -83,24 +96,27 @@ struct ddr_pmu {
 
 static const struct imx_ddr_devtype_data imx91_devtype_data = {
 	.identifier = "imx91",
+	.filter_ver = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx93_devtype_data = {
 	.identifier = "imx93",
+	.filter_ver = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx95_devtype_data = {
 	.identifier = "imx95",
+	.filter_ver = DDR_PERF_AXI_FILTER_V2
 };
 
-static inline bool is_imx93(struct ddr_pmu *pmu)
+static inline bool axi_filter_v1(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx93_devtype_data;
+	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V1;
 }
 
-static inline bool is_imx95(struct ddr_pmu *pmu)
+static inline bool axi_filter_v2(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx95_devtype_data;
+	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V2;
 }
 
 static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
@@ -155,7 +171,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
 struct imx9_pmu_events_attr {
 	struct device_attribute attr;
 	u64 id;
-	const void *devtype_data;
+	const struct imx_ddr_devtype_data *devtype_data;
 };
 
 static ssize_t ddr_pmu_event_show(struct device *dev,
@@ -307,7 +323,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
 	if (!eattr->devtype_data)
 		return attr->mode;
 
-	if (eattr->devtype_data != ddr_pmu->devtype_data)
+	if (eattr->devtype_data != ddr_pmu->devtype_data &&
+	    eattr->devtype_data->filter_ver != ddr_pmu->devtype_data->filter_ver)
 		return 0;
 
 	return attr->mode;
@@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
 	hwc->idx = counter;
 	hwc->state |= PERF_HES_STOPPED;
 
-	if (is_imx93(pmu))
+	if (axi_filter_v1(pmu))
 		/* read trans, write trans, read beat */
 		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
 
-	if (is_imx95(pmu))
+	if (axi_filter_v2(pmu))
 		/* write beat, read beat2, read beat1, read beat */
 		imx95_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
 
-- 
2.34.1

