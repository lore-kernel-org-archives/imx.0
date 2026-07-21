Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192564499BB
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627800; cv=fail; b=PpdDmcMHVPMrmSEtZoJUL8fnLL8UfseF3/BJHlXebs8hiz8k5PUtWxGD98Mm/QO6cPKKr7V3cRy78Y6HXBEk2QJ1gUZ/EdoWxfpdeSlS1VpuBCIYutDR3MJvC1aXn6yfRqdiiD/CtINaVfbAEQoixeEKZkp16yDLRNsNzkwGzAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627800; c=relaxed/simple;
	bh=Im8N01U9r1mg+E83y2EfbPMp9Xoc77a28Uh6EgoYjC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l3vKoyx/hUzQ/PFnEpRfI8WExgSF0kuTD425TArlM2cHbYy/IvD5/dabyGSmIpgZpjg9KJsvFxWrQCL8YCTkss6Z1XiLLxW2IlNQEA27jiTizB+leO27w2BVSJiw+z+r6OLsdT9YXhwfviDBhevC3eNOYx6uXWWyJ4WHiZ9cLpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oPTaQexg; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oPTaQexg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnwqCDS8t6vc7wmJIALKBfQveu8KUG1nYj9EVJUYVsRbmCOW+uLYcXOHDdCORLC0iD7tPraPs/xVXb82yqCJrYA1Qo1hmAlkwXmdRIadmiatWnYl20sI6aSoi3jT6UuaX7/hK/5qmJd2/KMhjRQOhfC3aeTXIpXd9fQSUKtwslncXOJydvh/cuSKKSoTA1+kETMiX2DepSlG9j7YubGnfJKOM836dRyWbHypjy/b+GGA4cOjZn0zyOaOXZhoqn90Kznjy9MsXWF4mc5pligw3uPSe8akEofNWRUaozBUm4KsZ7VE/zmbq6sVVWGMw5fML4Czd+08IhSWINRL11pAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEXQ1bWxrYNBN3Q+HyzyS9+SvHvQC2veSRCOTGZrk5E=;
 b=a8QPdi7JZ/7SqIv8YLzRHxTyUuWcO+fZdFXmlxuL/NltKpwzj2s+Zb7MPQBE5bwSMsSQE5gC6zOO5X3NQhj5pBk+4K0Ty8TBVfyHEBpCPEtg4PYGwR6poUiR+BOXnvWTtGi6FIcaHtL7LxzlB+I9DF+N0amt48Qfza6Bcm9sZ7iL8ZXRIHsFQlcaY4yrtCuGCMBTtfu348j69CbixHO5zbl0qcAWxdMiELRD1cPy+LxQoneTOLxn6l8at7ksu0A3ppef5qayipBGGnpsOCpoor1OloT2ohEDNvHKNMXZ4ZzHgf7SvwZCYwGRqI914PQDU369u9LF+SZDg/2608kRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEXQ1bWxrYNBN3Q+HyzyS9+SvHvQC2veSRCOTGZrk5E=;
 b=oPTaQexgwnEmUnyiKEtNDgcfAU+dtdYDT2eCCxUz7UMGIVUybWN2AJwwoqBTfEOyCWGvXU2w05GZiPrKzLm7y3wdn5hQa2ofKBVp9CzKQe/TJe9LmZNKztOUhpGPZKNS8DD5APqDyYiCQZv82LHlVBhcFVL9ks9fHXr4NEBr6rHsPiXnj1S3FfgnO/nlPGvkMFnPdNynLYJvnp/3CvQ8s0UJS4kUOhJP0s0LFmsP4GaS4imDDmOp4O/p9PoNqwabTeTJF4R5C1AEaDr/rb2Y3VTI3fDvRkK3og1Al3oSK0n9gXP6JzY9LR7ImXjhIn0FMIALcR7ReFeiJ/1h+IhWrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by PAWPR04MB11611.eurprd04.prod.outlook.com (2603:10a6:102:50a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 09:56:36 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:56:36 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector table
Date: Tue, 21 Jul 2026 17:59:58 +0800
Message-Id: <20260721095959.1855436-2-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|PAWPR04MB11611:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd72338-368b-4eee-f802-08dee70e5a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oC4P+YzlTK58zQgnRjTzh+0KIFPnlFeZZdVVpzaS6CS2jm37hq1PizO4NrTbFqen+zf+8CwmlgkmKDMJfpE80z0K8Nd3Q8kDE13wN26lCwBO2mh5HOeFyaNoc8+rt2t8bIAN4n5rjmnX13GxF4u46uTtnK/oqYOogPWI0pVyQN2Ef7Fo2p/iKfFWa/0vUQBD8gmja2LLT4pvisgxjWoDTgE8WZ5xy0Xt9Gq/uv28IH4AnkwRW+vkRCVQHedY12BTQcbbk3fXW9CMpJHX85ibutw/JBSw8BJl69ZeT83is2VKCT4XuFluZFVtCNgjRDkKSBPIAhkO0CilXonQTacFdvwd/GiLP3gceGu7gHPo1K8yXpP7M6tHhg/vJwzfFhEhhT8JGB9zVr0Ls6p7KRRxRcpj0xSK42EdJFX1suj6HCsyucLPSW1fdnVnxe3z3fbGeHFCJ432IBMAHoSL1Z5P7DajECzWlDBi+1lb5mL5xoQa5/n7tPMzQTRrD/btSE66la3NA/5u610Ty5wUJWh4la7tCzzBbKif3m1qAs36f4yXPhZnOiruFkLRQfrqQP/WtJ/Hxz/E9avBqjj+cut1AxmyCggewlFiMRjvhfFtJqxl/NznWZNQm9rvqARQ0FD7XuAnYDRiIKOfTo690pZng0yV/Mo8ddfiZ6sIOToZ8Ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gyfw1B8UN/DvwTZhleTI/t6rTa/y+fImBVza9Ktwc9UufCet22ewPWSGMj2e?=
 =?us-ascii?Q?2GRayY0yPnD5u8cBUzzvEiciWzy3J2ac8sJbdeEmB7VO9+KCpsoI6Ugiy+iS?=
 =?us-ascii?Q?LzzZMZk9aIrGLK35hJcgLnOrIYdVqhb1f2PP09QwnNjnXokJ216L57tGC0W3?=
 =?us-ascii?Q?uxAXRZ0r4opfTamcaRSvkJE3hthknLzhGDi2M7eiIU0Mfosq6a9Wq/D8HvuZ?=
 =?us-ascii?Q?sxu+4hIEk90eAEi8IpGU2GkOVMb3c/DbJcKH8P12xuums7vpJfBwm6o08gdL?=
 =?us-ascii?Q?BPwAyBpJ+Sjk66+uXaU/joEVxrG1gGce4hsNZSnJz6WMGTjvNUzQVdK47sBO?=
 =?us-ascii?Q?LEDHoNkf3TDzpl92clyn6PVBdW0yZcMiGMyl/4WImW3CHIOU6A3v9cKwG+Bc?=
 =?us-ascii?Q?/JOt68WMXj35PCdDdVG1lkNoVhNYGuBJV8/4B4q2EPxIf3F0cqGBoAvVIPYL?=
 =?us-ascii?Q?f9PQwSRdY2AMlzeD7l01+DxHsSWxP+jcsp/3/IZnGu5WLL48HblZZCm05pNJ?=
 =?us-ascii?Q?lUmNGPIpVfRvI1APlbsOQKViaNdpEa6v1J68PReruiNTmfVy1/Gx/+XQBYlT?=
 =?us-ascii?Q?hnipwGMm7MYjVtIF3H4F6gwes1HXAe7bOqf1UyU2bqAqtm68dgtC0fpzhDm5?=
 =?us-ascii?Q?jgJgGq8ClqIdYHqMGTplp9yHD8zgDTSihPB5dsgYNjWGaAp6NP+fhMmpa+A2?=
 =?us-ascii?Q?GYSh4BRv8mgkKhB4wjsSpdjpG14LtzdCkzsBAwcAPZAbGCVBQJmjHKTJhGo4?=
 =?us-ascii?Q?6JZTKXnrHVRogpMKDCVRnBKQHlapC7eGp4SRg0zpXBoOG+vc23kgTe9ibsKQ?=
 =?us-ascii?Q?92H83Um53vvbde+eeYeyhjB+hYNXXMAWtCOg2wlyeZgcxp/mNkNJ1DyIbZBk?=
 =?us-ascii?Q?Oxqasy5nLN8JL3xWA8cxGTTbxzuIyE9U9Hv/zQhm8xkrHAbwfD0INJOL08VG?=
 =?us-ascii?Q?W8dZ91OfdLZRz2FPzGpAkaxYEqcZfJ/GIxsYP0guX7iWsJpusKICf2rrBD9n?=
 =?us-ascii?Q?cRIP0sp4ENbI0NK7H22bzEZxCrgiK929RPpEWCIOLsUDER3qIulQ2JDeotke?=
 =?us-ascii?Q?+XfBFJDd0vmMutibGRDa6RA1T2DBEiRMG/rPupvPd70vTHGvqPlQNnwgkFCD?=
 =?us-ascii?Q?js2Qgjmq/UoMMtTBrOYFfe1OPK1/+5ZkuAS4erNGH1DanJxRjpkCyvFohlvL?=
 =?us-ascii?Q?9ZvE//lIlR9/4uu4wxfSws0H77jNquUcIzuFpxjbElpUN5SuvosfRs7Ww4Hi?=
 =?us-ascii?Q?vj/qIL+pXxyCjzIoyjgSz/uTBYl9CidkNIIbTwTMwbt8POP6gBT9UnLkAn6q?=
 =?us-ascii?Q?nTA7o7Z4GXo4gTTGO2zfQ1UR1Cb4d93IjXjqaJ3z/h+DC5oBQifhNBPnk1pq?=
 =?us-ascii?Q?4TZJTAaq1uF8wV/+q1CksvyzmgtahqdlmPfvvQN+z6J/dSDopJv+PCb99HO3?=
 =?us-ascii?Q?eWOT1jQ2BL7haihAPlVNSCb0yNsXTeUmTDvUoiehQb0QTSI7jPZiwWsWLU/j?=
 =?us-ascii?Q?77SoHrJ98lqcRw68II3ZFe4OsrmcvuHZYCSxLAVMKCwyhg9y6tu/JjyVjZ3T?=
 =?us-ascii?Q?56qox7saX8pnJxQJ5k8xztWW+u5zELgrlJH2YjTN16OUJVuB6rLIApaTd6xb?=
 =?us-ascii?Q?zzr77i0xHxscLlh1qdk8zvbAI685cJW3Hw/Vxt33s4r7qlLViZmKz2tt7ek8?=
 =?us-ascii?Q?xTA7ktXEUuobyitEAmnkV4fZv+mQ5MVs2rmRQbHgT/QQWuXe9JCiNX/Idtka?=
 =?us-ascii?Q?K699KswU5mJY4ofK02Xz9y/S7ugJvNdwrx5Ube+gDWPFCnf4OqMw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd72338-368b-4eee-f802-08dee70e5a52
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:56:36.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0NfsNqf1HlSscXnKS/Dci87a6bLTy8QfiY2DZv2apfNCDgqv93cF04u2w2311UOfiuWFcZQFcfPUBl4UPmpthjNS9sFLU5or4dw7AyReUH4YKbe8XVt4+TJKKMhuqq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11611

From: Robby Cai <robby.cai@nxp.com>

The VPOSNEG_table[] mapping does not match the FP9931/JD9930 datasheet.

The datasheet defines the VPOS/VNEG voltage mapping as:

  00h-04h ->  7.04V (-7.04V)
  05h     ->  7.26V (-7.26V)
  06h     ->  7.49V (-7.49V)
  ...
  28h-3Fh -> 15.06V (-15.06V)

However, the current table maps selector 0x05 to 7.04V instead of
7.26V, causing all subsequent entries to be shifted by one position.

Update VPOSNEG_table[] to match the documented register encoding.

Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 002b41f53eff..5eee21034f6b 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -42,7 +42,6 @@ static const unsigned int VPOSNEG_table[] = {
 	7040000,
 	7040000,
 	7040000,
-	7040000,
 	7260000,
 	7490000,
 	7710000,
-- 
2.50.1

