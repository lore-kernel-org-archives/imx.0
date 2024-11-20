Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D63A8D0
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072888; cv=fail; b=Gv1+WAK3LZbKVZ9LB2PZDQtm1xpCwF9AMy6zvnVbYwxpQK928E20IzUm8sPnLi7mBHfkONqRzA6hXOSTrdaBZmnUslABzDlh2yIlHa3mbkZLK+i9SEsbHp2M8QFwrU8q7aA3eSEtvlBHO3xNZGMF3GutSDYyyeI+/xEi5E+iLCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072888; c=relaxed/simple;
	bh=1zBWwyuVHH0GbUyrRyFaSP9Fwqae309ZwwWpvPT5eyg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jWNi5tSPMkXLBPcQ0iort98cmx/DBGPVM+1tRBSCrnn88v9LX9OXGT2y1tNFJ5pDHA3K+oghEPT7O5+z0w6U28ngbFq0bMQmPEPnKD+ag0TVK3gM75fogXfQ/Q0ZtiLhsw+lcayuvCNQHyPGsgxAFsG3wCgC4V8ISDzNBYmleWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FAxdRoSO; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FAxdRoSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV0RI+0v8lkXOAYtcd2rw0bQuFozjWmFzMQaYaYbKKQKWjnrruFPZ7h8Jdv49BpWT9gZta3BrA1OiCiAQKeH/BDyeQoFSXXvXgRHRO2WswO0j8yZSJS5/fI6j++31kbPaFQWATohqx1P+beULEBPy3w69S2hrB59rvY9bfP9fuRvD2zc1k5zSzheCr5OeRVsw1TSnEKdhaPv/oqewTu0rHP1bLnM0SPUMD0G36+eNlByeyuWJUWuZBj9whLvkOCy4+RrOq9iQMsckjZzcVIlZybj1G+VB2Z8g/QZxGyaWsJ396qaBUBkjRaN2KAV/FwvJCBEuCmfErvZ6WJ7TSOxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGPmNe7c3/3/mfKwQHXXJtQb3HyCvcAMQP7Jcac/ctE=;
 b=Qx31ODM6XLmRgESl2yC52+14bBSvICss+eZDngNvldU/1aCQe1iahZmPdKxjkEsH9g0MhUgT1jcLtfOmD4RMp7f6ghcmJJyqhNNKjfj3w2zEpTwBnEaWn+Xni/H9EdO/8VNKvGWYi3WIHH0+nBK1mQzB2H5qYtT/Q6e2pX37bkEd3D2PeExNHb6u3xfw3VucoWrJhIAQlS5LTdxqeLRRAmUgag0b1ygISZwt8q9rGX86VTCgsLsWJpsmSvs5TcCl1Va96fDCEZ5RL7v8xhq+BfDlxqeBESkMb54rG6H6sXzy00xttSSr4LSkSoxpa0wvOpbJVrLr7xyI2M1b0TD3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGPmNe7c3/3/mfKwQHXXJtQb3HyCvcAMQP7Jcac/ctE=;
 b=FAxdRoSO3+LMlSJAJky+Lntb75fmPe4qKIDPUsE5W+lOu6OTfXBSnjz6BIJ12qi5rh0RSyEnOOuQJef4sznbcRa5YYZh7YqEe9rqZtLhQrRlGuLlKLTzUkY9gU+aq/bVRI5T3EPIstjPFhlb+JDDP+E6D3MjIps/GTJWH4p3XVAgA9FV+5LqPDi4GtFay2DbL58g+ol99rNIJbLdCLweW8mtGvUpSARoK77ILhQ18U+sfA0KEWCg2siNsxLc+SBqPExzvhUbmfq5A8c6leRd6by1DwKxg26eGWIMbiyMbUr71+lX6mpqWHg6puqhRtyL1CbTwl6HN2LqD11XW4z7ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9361.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Wed, 20 Nov
 2024 03:21:22 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 03:21:21 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] perf: imx9_perf: introduce axi filter version
Date: Wed, 20 Nov 2024 11:21:09 +0800
Message-Id: <20241120032109.1163146-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9361:EE_
X-MS-Office365-Filtering-Correlation-Id: 58af18d5-0431-4ebb-bfae-08dd091267e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?knafvlDVf5UxIs1kq+8XVMYnzShdw/PM7fSLqzab2ySemeP0ckJytdXDZzCv?=
 =?us-ascii?Q?37Zgdn41t9dKwoxbJ3GmUH7c/k4OXusL53xG7MxK5f6dXopymFMxPYBDPu1Q?=
 =?us-ascii?Q?skT1Hk0kv7nEHeoJlTZQ2nsRKSP8SB5rUd9ss/71+QSaukVWYdB5BGU+HU4s?=
 =?us-ascii?Q?6IvzNVK+Iss1HcNacTHqpvM5VRzXaFGLL9DwJGNlE/NKu0fWjZPCK14Tu6p6?=
 =?us-ascii?Q?fVAWhfqzbXladbnUsNWnZJJOw8rNL+nj+IfMyI7R+pE8COrJDLbkJwChjtVc?=
 =?us-ascii?Q?9jsOop3jb1SvjnjVSypYuDeEhFkwXSRguOICd7CYQhxK1QrPr5bK8Csz+pjT?=
 =?us-ascii?Q?S/Oj/3adfzBfQ+UyNxqC5FyQTG1pvdGjHAzbBDgf3n6nES73HySVr5KUjuvf?=
 =?us-ascii?Q?S2egGYrRCfd7pXmhRCKLUA1koHhlMWJm6LeL6Wu0CoWkFl4m1CXEWbhBCtjH?=
 =?us-ascii?Q?Cjk8xYKG2+hT8JGa5KNWhD1bGqbCsyYrNd/BVdB9q2ZE88WRVLqlYZH0GJPy?=
 =?us-ascii?Q?m8P4zHMmpgVBusT3S/qvQzV9HVAoMT/2dGnXCY/LJGv6TFRBT7ClAZmv4BjW?=
 =?us-ascii?Q?sZeF1MFDa91bMOm0YESGuQB+88UyU+tzQyi1gM02POBJLHvY6gU8x6hUhd8S?=
 =?us-ascii?Q?UdHz8+uY8zXfnlKfE6NfwLioWszhWe5zdGpi72DsheUT9+Lf17S0tK83Kvlo?=
 =?us-ascii?Q?4/644VbcUe3U+Nrxu872Om7inv/V8qhTANqTUR2Q7s9i1jS5hshTfQnDGCfP?=
 =?us-ascii?Q?cw+zuAn9I0wIeNevm32X8LZxnioSjx7mZJp7dIUY5M17ZwZqdXEKqqGYVSH2?=
 =?us-ascii?Q?6+V5/nMNVrU6PUpPoQyKOujwB281CkoAqx4sEBWP1u9N01VdAx9BKtjHexID?=
 =?us-ascii?Q?zk8qSRPCdK3nympBJnTuKShA49OjCtpyBTiWtVXKLbWoaQF2nOLNH4uIueD/?=
 =?us-ascii?Q?16XG7VAznINyvpq1ZC5yjYFOaNLKuHf4/8XnEwSsYoSPxffQenYqT+K9KQ+Z?=
 =?us-ascii?Q?pSOG/dGZJfQnaogzgxWWSWQUXSYonh08B71iKbVRd6m5rLICm3hCxNOCcFSH?=
 =?us-ascii?Q?JJqd2jHzsfV+Mlg9CiumjpVPj8Q8/1ATF1isgdkZftn8VzZjzKXf9t3s2530?=
 =?us-ascii?Q?3kYNXqcNaHtmSOTrrlgMDSzPEEIhkK0/msiP1CehaqGcPHN0VbIlUEwfWUWs?=
 =?us-ascii?Q?ofMKKR2K6/sALsGwSkSe4LnseKEcqzCp539/4CisloJ4lDFmmVH2Zfvd89Vo?=
 =?us-ascii?Q?PLLDEKmnn3TIVGfvXq8x0rep8N4mnu/WSoM0pDkOW/udysI4C9d7wo+t9YHc?=
 =?us-ascii?Q?kWUehiyRQmIlmTlBxOF6QlCxL3rtk/sbQS8nwcXYxT/EByj4X1RRIUXyb3dL?=
 =?us-ascii?Q?/rFZqIU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1kdB4AcKpTQTLYjqweP9zqXdzyROxXP3VdEfS0WoCdfbJzLbYRbLyl9go5R?=
 =?us-ascii?Q?RA2FMIqLWlnZI2SlLfepBg0I/5GdHARbo0zTUiSYh0CJ2IUCu1rN77kznn2H?=
 =?us-ascii?Q?l5kXGqnzQKE4G9dTJ4fpjgMOED26mjpe4zAYzEwd0EPRB5NsvQk6IMLfQgMo?=
 =?us-ascii?Q?I/vXs2lHYxte1TqFEmNeebIRNUa99PtWTT5W6P/SN8de2WmpKgZBJDp8/TMU?=
 =?us-ascii?Q?OrKcQIvoiLkwPcrZBUqp1mBlKzIrX02gsiiVkXKpzkQa3Wfjxw1fJ2pi/9Hh?=
 =?us-ascii?Q?eoyyz8c1TvsMfxlQ4W4TGQBcJA/F8Fg40CyfY8P3SQxF49TcER9gvibHJawR?=
 =?us-ascii?Q?lmuXHCEEI5uK9g0nMgljKT5prCyNnUGtCOJNNvi0inJkeSruWeOKTKOBe2qv?=
 =?us-ascii?Q?acuyBBSNNXugiuTGwTqO+PI/IqRFoKcIeedPOIL9a5yAo4Al+fs3yMND6RKb?=
 =?us-ascii?Q?YikyzaDXMWQcfwFLu71gGLOVibzh8NyOncO9Sa8Rzdkh0mif06fCwzT2KQZu?=
 =?us-ascii?Q?g2kzWLbeo6y9PtZdRzxWx2yNU906XHPgJtN4bFbd36WqPqYzwi3xg4B1ItEo?=
 =?us-ascii?Q?ytgOjHZoXVBH0rphocvX4l4Lbivf+dop0f8QuZFcAEMQ4P+km36HiOyOfy0W?=
 =?us-ascii?Q?hofEcFj++GTGfPOcUtRb0Vg4X7DYjIHETmnXKYPXYvH826bFQZ2qEkqytWm1?=
 =?us-ascii?Q?2o4TBMjkbwXeDz4TO+P0wBrufXCZydmdGL8GSZvyb8o6gBn+E8EBKXQgTSEc?=
 =?us-ascii?Q?HAqxyhfliQaF6gNCKHh0iO34jL5XB3DIUhhENU7QNFBNldzSXz/msn9WlfZe?=
 =?us-ascii?Q?nXTPgjIzRp+AHBUzTrQL6NMLcpfHcr7y+1cAxNYrp/WWh6xVpkEIXf3drtUH?=
 =?us-ascii?Q?jpDBBdKwVAoDUCiN7yCdNoKGKBnx0V7cNxwcCaB6UYtO1DwTvaCBtGjUnFfU?=
 =?us-ascii?Q?gp6fNhwPmnA5n+YZH0dPdVD3nlsJGqaQZrTRhNaTlXC1AVGWQnO0WYQvU3i6?=
 =?us-ascii?Q?vc2SxmU58X1FOtQWExKLHG/0o+KuRHN6r1HkyRzrmjFXDSp0H5Y7lZpUbPS9?=
 =?us-ascii?Q?UX+Sv0Iotkr9kdFdiMiF4hHyNjmLBT+YvEDqNc7wtJ/GLcWDgrIB2lSIpEeO?=
 =?us-ascii?Q?STktpUNvTbogt8OYal3iJxRRQ+H4JckNWUQCuF00xLqZBtV7yzmGu9+23/Ol?=
 =?us-ascii?Q?8YdmMo5tMiBVDVUuiBHBd3NGJdgeDzBJMxL9pOz6eHPZyAy3BeAYgWDBsZdT?=
 =?us-ascii?Q?U9KJGW1XhPpFkBP/ZhPisSrl9Kx5xjLTN2EUkIUfpDFHOdG1JI4sg+6tA5AE?=
 =?us-ascii?Q?36l9yLia+XwgDjrr86RZUSFc9jKxf6BlBsVGKbH6Ycdaca+pk2/MZu1BfdRX?=
 =?us-ascii?Q?t4z4stYjgH8oW7VcUbocLdHifAl7qebSudXF+FBFDaB7kKicj3Ke6Weco8gr?=
 =?us-ascii?Q?9v0e8QFt8tbW762udfWnnTi+Y3a9uXNdDZCZyV8kOyXeSIHcADujZrACPX/w?=
 =?us-ascii?Q?zpy+Y1obFfKRd4J5eF5D6qzdorgXZTryBl71zcdI1orZNW7aUV76Zti+dLlh?=
 =?us-ascii?Q?tlyP61xTsrxfA73R4ZPeETmgwXTwTaXKI7JvGI+y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58af18d5-0431-4ebb-bfae-08dd091267e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 03:21:21.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peHTNTlh3lKNrVK5c0P4qlvca8Z6X8QdJYSk6JAcj04tf2Hn7gNWYQAdfVRkh/6b9uD9nEzHrKv/z6CE1Islvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9361

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
better extension, such as coming imx943.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/perf/fsl_imx9_ddr_perf.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 3c856d9a4e97..965345d78f7a 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -63,8 +63,12 @@
 
 static DEFINE_IDA(ddr_ida);
 
+#define DDR_PERF_AXI_FILTER_V1          0x1
+#define DDR_PERF_AXI_FILTER_V2          0x2
+
 struct imx_ddr_devtype_data {
 	const char *identifier;		/* system PMU identifier for userspace */
+	unsigned int type;		/* AXI filter version */
 };
 
 struct ddr_pmu {
@@ -83,24 +87,27 @@ struct ddr_pmu {
 
 static const struct imx_ddr_devtype_data imx91_devtype_data = {
 	.identifier = "imx91",
+	.type = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx93_devtype_data = {
 	.identifier = "imx93",
+	.type = DDR_PERF_AXI_FILTER_V1
 };
 
 static const struct imx_ddr_devtype_data imx95_devtype_data = {
 	.identifier = "imx95",
+	.type = DDR_PERF_AXI_FILTER_V2
 };
 
-static inline bool is_imx93(struct ddr_pmu *pmu)
+static inline bool axi_filter_v1(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx93_devtype_data;
+	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V1;
 }
 
-static inline bool is_imx95(struct ddr_pmu *pmu)
+static inline bool axi_filter_v2(struct ddr_pmu *pmu)
 {
-	return pmu->devtype_data == &imx95_devtype_data;
+	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V2;
 }
 
 static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
@@ -155,7 +162,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
 struct imx9_pmu_events_attr {
 	struct device_attribute attr;
 	u64 id;
-	const void *devtype_data;
+	const struct imx_ddr_devtype_data *devtype_data;
 };
 
 static ssize_t ddr_pmu_event_show(struct device *dev,
@@ -307,7 +314,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
 	if (!eattr->devtype_data)
 		return attr->mode;
 
-	if (eattr->devtype_data != ddr_pmu->devtype_data)
+	if ((eattr->devtype_data != ddr_pmu->devtype_data) &&
+		(eattr->devtype_data->type != ddr_pmu->devtype_data->type))
 		return 0;
 
 	return attr->mode;
@@ -624,11 +632,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
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

