Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81918183CCA
	for <imx@lists.linux.dev>; Wed, 29 Jan 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167793; cv=fail; b=iB+tWd3P2kwmWLM94krjZgzA+CQFoxY7mDX7fiT9lUkadkhculP+Y6iMYBLWPksTC7GU+SxjNEdVwqNnpxdC1ltuqW6dHVR8Eu8YHDyewuNFLvXAWhacAvBRgYEIc7PlN9Hhsfb7rl1dEQjZTttYqR2+QBAv7SMVLH+C64hh6Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167793; c=relaxed/simple;
	bh=AUzfW/ADLThfEFWNSX3FUlfAzCVCBiXnHaxWT+HogEs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UAETzL2NeNZ7D4i1DDDskDfQfhTcrMe6Y6sW8ZW0qgtpwulGUkU2vGeIPP0DUmPPg1qR6ZpWG6BAdiOa+IGAUcwsKUfVqPQAbwb/5O8ZCTsHWe9lpUFRL6h9nhnitPLxjdtSqw5EBGDM1gPQmJ0hUYzExsMDbSCPocwC0O3Yuyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vog+gY2y; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vog+gY2y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbRg2XBIhm9guO4Sse6OMdD6Qs+6v0CfjgesKsf6jcCfumqaKWuzlpKVrkIiiti6S0SyzVr2zT6BNwWH23WAVrkCj9kYDq4qzqFYQOvKkwTBrvjrfZHzlX9ifOLQD4P/7xJMi3fB0x9F7rJwhr9xBlZyxnj33hCrLdSbvdVVN3FoBtCt98GuCE9aTKwpgonsd6bG7tIda3MoT7Yi1EV7MsWDxCaId/Oqh6Oy0jye4mw6mI3k7xAnEgO9CrbrZNAW9GGm8TOhK7debljEWIYPLGk51BZJx+OqNDm0rU7Gv2k3OleRPeHvwM4oL70AnDAymoB+Rn2e7c2iMmF7nzCTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNUDJABgwJEjaT/c8sT9SfpPRB7HaRZkD/U3KLFF/u0=;
 b=jeTkgEJQOaVR2YljOVCf2DtH3L425oRnO1+2KppJuCVo/fSIXfWhaO8Tlf7oGkSuzpCHi0+vyYgLDEuL4pj964F2gx+4kLwweqdQ8e8nGPva1tOxnSmxX9CM7Lj6eGKHPghwZF+PQeNT1MiJlc8UhWM41zwFSLrDv87fl0uTggce134dKBTgvzqOq2iJt1em2ZQeLzuNMmL2FwWKLrdMWnwyPIkUVcUEPZJQhRi6R0NEe37hZUG5EysGq+Y8qsABCKXO9R6HdSqUHBdg+3Y/ahl2rdExHbyL3LRYripSD1MNO1QEzLrrxqLW+KOO8E6Q8boqi14bH/56cxzgkh2tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNUDJABgwJEjaT/c8sT9SfpPRB7HaRZkD/U3KLFF/u0=;
 b=Vog+gY2yyf/DiqRpCuDrzfLSaN252uOyeP/sRNeuhf3in+P6IVVCuNXqz84EgqpyPHT37MgPiDrK/0uTio5jdmgICjJhevvpdxal1sn28v8q9cCxfMBdzPhe2z5IBLOrROHiOwYEOkCTVd9ZlYrTOvH8piqgntflD0+MxYofL54vhmep7Ilf7dXAGGgtptwCg1Cgey3pwRSPaN+ayXfjdrkxRPPGI5M4ZPtfvZi49A21BY5gV1YAuCEtplsxDC3yMCmckoxPOR4KeHlA7knLJxwNlY/wqxSA83us79yFtL/LuQryfF4Nd8KBLGnnY3vUW9ipfovN+3M9z5DErDlpQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8260.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 16:23:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 16:23:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
Date: Wed, 29 Jan 2025 11:22:50 -0500
Message-Id: <20250129162250.3629189-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 394c4aa6-efc6-47cd-ed34-08dd408135ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mU/oAglj5zixSEniPUG60dKB95Kt8pRdEwPXuv1Btam2ZX7IL07dvDhOVAWo?=
 =?us-ascii?Q?v7Q860+xMj5ni+QStTQsYfjjODbHzptl/S7b0VJY9OD91ClS7nEiMgXlI0oO?=
 =?us-ascii?Q?NYXrGUnmLg8QwPinjczPDyBuUsrzXeLgOCeEmOeEk5btUShlu3ku49FqTHjX?=
 =?us-ascii?Q?UIVOusRnxv3Ppfg/S3xsAfURHJDNRBuYh875hVEJoun/DstYUC3WyCzHIykX?=
 =?us-ascii?Q?fZd2RWp/hNiAWCsKIijvJAqKomffwLy7+IF9D6tnlelUuIN6XqSIqdtN9t7P?=
 =?us-ascii?Q?ku6GNaBwqWecNBNI09r8mFRYe+tXELgruFGxJm9g1BI8Rc/iZIBhwvjqX08q?=
 =?us-ascii?Q?jBVdeh3nq8XyMBd5t2AeAg4dgxnJHv1Ju9sYz5ia8MFudGsAa7p/iYLi8CGH?=
 =?us-ascii?Q?RcH2IdkcW5dHEbIshPd9cT6xjDC1r/1Aoke8uymmq+MwWlkuiygEm5baK9rA?=
 =?us-ascii?Q?FxATjn0TAutTlykVrJ7b5b2PLmo0zdC+egSQPT9NoidvlYzeo8gaDWeHIhdd?=
 =?us-ascii?Q?E4KHI9JnMCuwda47sX2GAJpdkY8Qc7nabfUlodnBWDyPCQsL8hWk588K4XSJ?=
 =?us-ascii?Q?1H+QyppiXH5orCCvPhuejeE+stV0+Q/AeNHfAaeUR0T5ID7/zOk/KbNG/J11?=
 =?us-ascii?Q?A4Pa0RAyxIOXPsu2QG513fbEqcedYfvrgAZooHBMPpciRF/oXhOvyD4b+aV/?=
 =?us-ascii?Q?icrkcoNIutcCCP9cUvxnvBKYpfg01kuTZuhfduuzLz1sYXzBs2tKaQIEuCGF?=
 =?us-ascii?Q?zim7AL6hjXFxMjs5LLrZaYThbUB5X2cxO0Sxyh0R6JM6voTU3dxzAST9bw3R?=
 =?us-ascii?Q?ajJn8zpU6BQqByB925q0XvxSOevtx08BMzL+eOqltchZhmLqUY6nC2L2czdH?=
 =?us-ascii?Q?EhhN3f5oqMLmw7x20eXiMcchArelD9QKHo0OnsyHnhNAjzRPcSdhmI6INUI0?=
 =?us-ascii?Q?B3eB3o6518iTud4Ldj9LFtlFqSVTh3YFB9BhUUZXz8mYk76XwRTrGLRRJImR?=
 =?us-ascii?Q?dzNDEhcd7sHD4s3Us6DRS7Nyz9YbOFuiLbXGxfYvFUQS+psCC2iF/aru9Kyk?=
 =?us-ascii?Q?6XmdS6SVqnNwkS1E4lW7rog2py7Wbgml/7/C+IeOIzLLiSKH5mGAxsr1UMDp?=
 =?us-ascii?Q?kWEDdMod9nn8FOCgy6DwJ0BrDUIsJv3hIx8QCC0diq346Dfgqv4eF8qCOU7Q?=
 =?us-ascii?Q?qWv6BhEZFslzJEQGsbotLKUE746i7fz1sB4fNf5SGZ8JFcDLJ9bCfflD7M8H?=
 =?us-ascii?Q?9iIuNcm85mWIhCtAaNy9NPjV8aHXXnYVpKW40h2cSsG9zJYGr/n3X9UVpkc9?=
 =?us-ascii?Q?mGB0mmpGJMNXE3ducgeaM8MWThcp5f3aHBm37eX42BaHX+SFhZ590FdOxtf9?=
 =?us-ascii?Q?ARMnvYyj9KnRBC8gOoqFoo3wvJBB5l+xM//jq1ZLb/R3Yr/ePBDButDbrKAf?=
 =?us-ascii?Q?2DsjOTaeqcL+IKSEB3MdqemaUXd/2ClS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ehEhsuKSglcNfQP18nhn5sJVBYlgug4IXL3bBWOf7kP4izhGuYKhFthacy7P?=
 =?us-ascii?Q?wGCDjonBa809ziKBnlWpDAzOQFU11mfuhtZF6cHAUiOsb1hgeV6JA3PPPDgh?=
 =?us-ascii?Q?ikmOwmtAWygLUD6qtQCpzLV7tr57D8S3YtD3trc9fbPMF12TZCjGqcvNUhgM?=
 =?us-ascii?Q?RBusiBXAb6dHzdsHGhPEOf4GqDntI8BhoO9ttm4UTAtvFIWGcWrOID78P3nX?=
 =?us-ascii?Q?H08hCzEcijVou4X983Yr50t4NtDUzlqMouk8jr4HROdfGW7ZsjKwz9awSrox?=
 =?us-ascii?Q?f+OPndSWoLxSXh/aKn3pjE7+lAxiYnqDomCuCXWez2IYTN6M8nWjVX5FBLOr?=
 =?us-ascii?Q?n4o+YrhzBh9cdLRKAYZMGSGe4m3Z7G9Mc6Hk+U4PgmDdHEz0BxFQJ6GCG08D?=
 =?us-ascii?Q?2xIqnYVn2srGLjgnnUzSXev357Av5V136oOKDYyCRet7ghQK2lTcEODhc81g?=
 =?us-ascii?Q?uvUA21t50PPY2QOAi0sSXFoU6PgeRid/T/ZIzx9hIPgiukISo/K+jEqhQ5xK?=
 =?us-ascii?Q?upRi0gC48T8rokefWzPQDn/lAU5zqdcFgXFOsil+qZaHWNsQNRZALQtw7eer?=
 =?us-ascii?Q?gnHJWfA18i2H77/CNTTC5JQcWo8KNqXkCtBAxE7YQy7lwLts9Te+lvRij/kr?=
 =?us-ascii?Q?zx0spiu3eoAkTvALzKLvx8mxEOUUWW7Q4XUjcR7Khv+OA6B7q8IOPMDp75Pv?=
 =?us-ascii?Q?YeY0dOvky4FTdF1O6lvhYHRmZ1SIVo43TPIEPsuuZOIup2epF/zXul1KR6ON?=
 =?us-ascii?Q?Rf/7AvcD5zfcuNi0FOIgagve7cYSm7zWyYk20JDcJRXEjukbDErrR/xF9Yf+?=
 =?us-ascii?Q?eGVGONoRP13dNnFM88J28plvRXkW5FXKKxqBMlrhkYOajDgLMaSkazi+4mA3?=
 =?us-ascii?Q?LGXAsj1ANNALalPW/a908/88MdVmbXKlnhOpVrEgJWyC8vY9BkpLHs9FdQg0?=
 =?us-ascii?Q?7958eM5+/I4UbPUsZCS8pdPQWETptfGqypV4BQv5mNRbr0yshE35mEkAFbsx?=
 =?us-ascii?Q?nE5+WoQPCe4RwOYtzmkDd4g8U1QKBQSTOgX6FEjHqb2yuQqyxDkpUqVt+rmv?=
 =?us-ascii?Q?tCLD6iZiSG201fjxJltKGAK2E+iO6ftgWwEpM7hqBniFyB8HEM89yR28dXO2?=
 =?us-ascii?Q?bER/n19vhP24W9GpuDiYFT8aib81B/tSQR1toVMnKXAn3vjwypgLygxO3Nl7?=
 =?us-ascii?Q?m2do/yl8IrcPFVzXYeQsLxDIvZQoIxUXEMP0pzT35uAz8HWXNBGtoONRHwP5?=
 =?us-ascii?Q?IGIfc8tuaNJO4NJzVmlOSYkL+JonKSJ8q7AKnNDtwGSjzVrN6Xu9Nu4XQRG0?=
 =?us-ascii?Q?Tqe5YkoVmbu+sPp/509pd7lrn6xgZD1FI8SuJsd4oE5YFcW61ENgRLUWvr40?=
 =?us-ascii?Q?nNZV+VQZhO3u/+CLxzQ7dru8pa/FcKJXI/qby3xkJnmbc1I2NtCIX9gNYbU7?=
 =?us-ascii?Q?6gYrW2PeTZ79qa/rVrR4GBrJjTcTzIhzsLUFjYyIUDfi41KvwmiyRLYF9eg5?=
 =?us-ascii?Q?yEoY5yOLSsGEbwGZwK/fsc4V06m0K0UAEQMSSSU6EwK9awZDrCwZrFO2F/8B?=
 =?us-ascii?Q?sAWma28GmENtMEvmTiCxmkwYLxPTyzLSh0yJXYGd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394c4aa6-efc6-47cd-ed34-08dd408135ec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 16:23:05.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZsyXIeWdxNA6Y7I1dByfwSWQ+MGQP5+JZk5WU18tKZofpk6yX5cHziv/XZnRCNvfWJPNfGj6PpbBrmPMppX9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8260

Ensure the FIFO is empty before issuing the DAA command to prevent
incorrect command data from being sent. Align with other data transfers,
such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
sending a command.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Hotplug stress test find a wrong byte send out, this patch can resolve
this issue although have not identify which operation cause a byte left in
FIFO.
---
 drivers/i3c/master/svc-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c1ee3828e7eec..bb660c4dcce56 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -892,6 +892,8 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 	u32 reg;
 	int ret, i;
 
+	svc_i3c_master_flush_fifo(master);
+
 	while (true) {
 		/* clean SVC_I3C_MINT_IBIWON w1c bits */
 		writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
-- 
2.34.1

