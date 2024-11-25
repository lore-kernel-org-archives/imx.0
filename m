Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA221925A4
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531423; cv=fail; b=qovr7C5jph2q53Tij7azuMnrvm/oSyc2TIV9KOoPDeJ9L3n7HQ0wnttlwLdXw9DmFleyVe/7sTdBZJGLxihP87LeiFbPjerLKtUhSZu4j39sizrvMPLvZ0c/lR+GggZPNTUPpNEQG+O/A4wG3MAYVwgcpG0r5QIK2F6LGeCTRgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531423; c=relaxed/simple;
	bh=zor+o5U4hfTySBaTOKo18lUUWHtKXK5aeNclJdv0AdU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fKzzVterOAAvFt7SxuK8sGZ116PP3nGvO3XgniaI1E76+kxwMN9d0R5IDbizuUCtNdOb2mfZVpFRTG0qvPuISRU0CQxBkDEuelUvWM1UBE6W3DBiJf++79eeBe2CY7T3jxnKeQouPcAz7fIw8XBsugRP+AYkEP4G4hTzQjanqSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FJvsAF1w; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FJvsAF1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoVzud7wfsm/Ec40sxeFEmExlCWF7ev3mIlnuIKFCxB8r0zp6zVXtiEs++S/26QOF02f4Liu+4L+X3hvd4SGrLcZDOFHWGF+7j/IICtY9nel3SEGkbS5Vh+CoTV5QnkjgQqNVkg9tiZH6eBxjWFgB1h2IOIBtu4ZDsEr1M+QM7X1ZfIZSjvZi/dF7gBLOGrZqJxMMC6mkYy1EMo59LgyZv5CHWGX6rYDaZXdH678btB+TkxhrpKHUreoYj0VcURM0SfFDORchH4CSFdbXNabKCoeG6Ofs+aZzj51s9L+OoFI/e9G7a2kVG2tFGU7oTgSbs5ZzU/QYX+NCF2GQ+6CXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+PTzzcnP9siLZGzwp8bMcE8d7Ixq6pDTA7Zs0n5dJs=;
 b=blDWy6i/KDlAoty6Wrid+Pl9bJA5iN++Te114st6/iZmwPMyguTrv/0o7cslcZ4nxG6A6WYxETKwzIPBh0OfKVNsJR4B95CZHyA3hPMIhW8CEXgn/TgcgNhh33dLihzW1Z7kTn1hGMXmS2AWVmq6KZrwGm7dFKNXGKAVOwsRAatkDUe3lWJTKPFw9F91BbTNG1/+gGAwPmLQZRXS44vK8E4unkfE6MtODSJnc2VSg5Y0FO3kTreIovB4G5xlZ8oT90DD4unoGsAFHbWz8QNzENX7CjalH5j9QYeP5MwlChkXRo1x6hcEiaOPzja335VnMOTXGg0Eex4hgDtJY4CgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+PTzzcnP9siLZGzwp8bMcE8d7Ixq6pDTA7Zs0n5dJs=;
 b=FJvsAF1w2SVw19LiyjqjFye0+8m/uQc6izDhDcQLDsa/Ew7D7DGVRLtKn77x8iRxw6I0faJm8Z8fiobEJaoM+iMyJMrSC7dt+caxtVXBJSUYS/EYpsaZIkTvtG8CXmSwziDtisq9NewjC+YH9/xeJjsAjHkQg9Qc66jyQOdnNtMAVVcSpxPVPIKADxCCFqUJlKnqAnYG9bFDbL59/NjGXuRz1Fv3etfhy3wl1l9D/gNW8ly1fJ/rcgHSxx0fA+ul+zMxlrRwce+t4DyBE+no7xpEkhPskRCOoonAs71QYs0duSZ2o3BmG0Rj4Qf9d0NVkWuZpm/0txEcng8x6tZKyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9503.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 10:43:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 10:43:37 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
	will@kernel.org,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
Date: Mon, 25 Nov 2024 18:43:38 +0800
Message-Id: <20241125104338.2433339-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a702f3f-f225-4fc5-7553-08dd0d3e04a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpRrOqy3jNZJnhoB8vtgcFkRANr7Vdj37BHvd8Pm6w/wvBRnRd7DL5BwuIEr?=
 =?us-ascii?Q?23YyEdTf7dvVPWRISyNE3+HrbDhBY+NuBzO6hn5ot46SmHPz4INxR3vecSfo?=
 =?us-ascii?Q?eBR5a/CNQM4HQRFwsapcgZU2cE5tW5zoUbFp2BuHZgDRYOth3oHgWUrptM0U?=
 =?us-ascii?Q?aEsJBTotywTdZiaK93naFiUUpMWdPW/WF0uUyRem1nA2mbm9vKwYW9Wjgow2?=
 =?us-ascii?Q?iLs1i5uA5Qf0cWEktg+YChnq1MSlErufBx/S4/W111sqGCx5DbWZJ+L4+G8l?=
 =?us-ascii?Q?iEnH2WVYgOxu+VkZXUl081heyPPduy1fy52qLzv9UNSSWRHkK0TY+VKJb6WF?=
 =?us-ascii?Q?7YLhHb9l4U9KwGAyLWxJLXFrg4WA7E1vc7PeuhOfIk3OhxcV28jIERhFcpsd?=
 =?us-ascii?Q?3012UGXy01P6Nn3IQp7iOBXyG7BdE+25522x4+x/aO6ZeaK8HSwr5Drr3FZ4?=
 =?us-ascii?Q?Z240jgmf/5ZXoTSJH5X7m6iXV5f65ZZnkprtmsDjjHAxnZEXGCkKgV9LJ4Dc?=
 =?us-ascii?Q?lGR3flbznWYnB28iONOzBy6con96mdwiy6VMcUW7PuptRJhbbS1WoXyUGyNO?=
 =?us-ascii?Q?HgZUiS3HEjnxa8fj5L0Apdw13fqrpGztoqVRa0XvExwUpnLbebirikALeGVC?=
 =?us-ascii?Q?4qGG13gWDpKl0Yfjyebo8h17U9bzMSABrarlIn3MPpVvppuL+Zk4nNS41DhV?=
 =?us-ascii?Q?ejzYpsaqBLR71c4F5xZ0XdQuA/Ej1FFqu0G+4HALCos94W1Vm3JT0AXujpwU?=
 =?us-ascii?Q?sEOgAdP97kJ38OkEElb6FBVFVWWzkX6CTohzR7F4DO4D1qq6sKnyjJ6zshHc?=
 =?us-ascii?Q?JqZJcquBQTb9QQQ42x+UQBJM1Vl++FRHKzNxtTGF1YQ+F2HN1rxWsYD9dH87?=
 =?us-ascii?Q?0s+7yj5XmYOyKw1BGw33cbadlFA8fkqW5Z1PaRS9K3m3liqbc+J0P/xp445c?=
 =?us-ascii?Q?wFWZ8iGHS/nG0WUosG4pJNQYIVfzWXA03Y5YKlL7h6WlrNCAK66ueHAZMczg?=
 =?us-ascii?Q?fgLna59u6VP4bIrnhA2ZasGOUht10QicbXwq2rPKkyJuE0Yd/etWVWB2YXhN?=
 =?us-ascii?Q?87CPTl//8k9d4E4QNwJai104ZM0fR4yybze6cUSxANOfgTz/v83z00y2f/EF?=
 =?us-ascii?Q?rCViUzzGJVjWVoy3iFzU79jnyZtuGLm+VUHi/kjHEFYQFymOHTLviNUcaWq5?=
 =?us-ascii?Q?f2snzv3zwG6cW4E0dGwwleLr9kwkAO0aqehRX9MIsNTmddwP78/IjgfItLa9?=
 =?us-ascii?Q?lEabwZXU6Tp+Xtk5KTayc+/yfp81+VXkMiiGOZ4qfjVTUyPEoDbEmYXnCgwF?=
 =?us-ascii?Q?HJCqqzThMn+0sPRMRMhBMWkXg16OYebzCwD+G1HL+vLtd6vTxQKA/8M+4O8c?=
 =?us-ascii?Q?bU7kv726l5AsVLTs7hJXWnRIOcEd57VxNxHUCrUFNiwxlj0tkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hyp19hOczF+TYV8EAZuq20HdFa/7KQqF2deCAyb5AvYUt6AMCyCOohVqwr5N?=
 =?us-ascii?Q?egessHxv+wMUYwPN+d3FNZxThpkzSm1TYQP6Rk0JGnfw+Zdcw6OBdYs3TrK5?=
 =?us-ascii?Q?EBMS1gsFMK3Y86LuByfIzr2dDvZZJ4cpi/KAZqPPHeHsvF1hMv0Vyo8hbc2J?=
 =?us-ascii?Q?Aqe0Dy6VZfgsCTJjpcajcQ5TM7jOVS4ikcVw9vbKPbNw1rOVKOIXUsifI+3R?=
 =?us-ascii?Q?3zLl7Q3ZoWIdtev3cuCjd6v/+Dswyd3vwKHs2Xf3kDuUjM3jFzhQ6NziLWKB?=
 =?us-ascii?Q?pNCNY/TLR6ztYdaG4tLhbfAbQSI+ipkKLSL2HtHc1D1OygriBlXq8UEkzKll?=
 =?us-ascii?Q?37cRyB5n92y4nQgjUKBV94v6tUuOYDeCtcLPMnkKqGZIkFS4wjojY1DIFox7?=
 =?us-ascii?Q?++iPrFcyi/MuwSoZDxVOcKOaeTujGbDfnNkX4++ly+D2FdPvjUHCksuql4iS?=
 =?us-ascii?Q?78sZ3OCg7ugKvkLNim6ml2lsUL9bGImHnCbfmIOx8LW4keAk2m3GY5HJyQ2f?=
 =?us-ascii?Q?EG+pAEXX/v9W1MQz84fTHvkgluWXUgN682gGvXpuNFhM1YzRe2I6GhjTIrEr?=
 =?us-ascii?Q?X18gyOV1Z2mH1dgzgGbFHSZuyqVgrpqFGrxtUhRLyvabMJKNEEksOPQt0Im2?=
 =?us-ascii?Q?17q1OchgaeFaL2q2dRqOjxPXhDI8YpNjmoFgIufQ/nLqHsM0+QZwT89hIeRO?=
 =?us-ascii?Q?9tb7yNu7rTnTnCnB4h41CoNMD+6lMIh/wvgc+QhWuk8/VNcFsdY8TduIO7Z5?=
 =?us-ascii?Q?gC6hGriVWN95ipPQPUrbGfUwDg7jsEeP3aKHk8Lj08wQjITTYW/1H0vQel7O?=
 =?us-ascii?Q?byQDw54p6tKID3+2ihfiqOtjSsmo5OSarScaifwP104uduEmXGbN9vd50dwf?=
 =?us-ascii?Q?N2wgORQCxxFaA5n+0qmrp7+i6nyuJ7hHHcGClh6MqGN+Brjfxss4bKExP3MS?=
 =?us-ascii?Q?5JdSpUJKJrtS3j6EpCYNYL3NKltQPzs3S0qOBJ2MrX2VCUvZ+Qzbd8nxZ65K?=
 =?us-ascii?Q?jUt6qW/kuKdFa0QnWyHOYFItzmkm8F8PRnlF6NX44yOOiS/p6J5UVm7s+Fj6?=
 =?us-ascii?Q?dfc8Py9Hq93Mp2ku2p2S6UAN6P0nXiOHe2DCgN7bdqi+CrpaBGXuREWi4/bk?=
 =?us-ascii?Q?+kqvNViuaB0qJBdLnHb5Atti2MJGgTmJhz7vdSf3iEiE9BcI/y5Nhk/H/jZg?=
 =?us-ascii?Q?ct6f8UJC93RacOBq1q5t35el30naIGu1FL0q4EhhifpECH3ClPnblVzDXIep?=
 =?us-ascii?Q?7mf808EFP8eK3wTXlitiqfQFT1u10Ija2001CMMxC+Yy+tD4SkZ0UMS81vIH?=
 =?us-ascii?Q?1ooskqo3d7g//ywO+5uQH/0QDkeIJWWx6oXxJgvwYe82rInlFhebBBMr5sCu?=
 =?us-ascii?Q?WVtbbIsENtLqBRZ0hcUN7gGeNi3WUtDAnMl+uUbTgycfgNbVPVrrAukSpQDz?=
 =?us-ascii?Q?OYccVSJrJgc18LJaD2WD+8bdBGGhsDQ94iggo5LySP4yCm1aykKaIIc8z6+x?=
 =?us-ascii?Q?7OARsKT4xcL5UDUtYuZ5x3TXfIJMemEwLwl7V9F5ErLXXg4ZXfnFs8YFBJAq?=
 =?us-ascii?Q?2SIuXp/ARsCXn1cambAK5IR4Dsc/Gb0d0XP8zQRo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a702f3f-f225-4fc5-7553-08dd0d3e04a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 10:43:37.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKChXnpJ74LT0RIE9nQ0BM4uv47QPy6bupKbPVX4Pf3MAfNs3UuFKjFFJLfNFeF8wUo7RKYRmfBjDb66mz9uPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9503

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
Changes in v2:
 - modify subject
 - add comments for AXI_FILTER version
 - type -> filter_ver
---
 drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 3c856d9a4e97..e2c2c674b6d2 100644
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
+	if ((eattr->devtype_data != ddr_pmu->devtype_data) &&
+		(eattr->devtype_data->filter_ver != ddr_pmu->devtype_data->filter_ver))
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

