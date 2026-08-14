Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C561140E8FB
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692156; cv=fail; b=L7Sd11vFUBAa3ke6wREvQ+yX1CiymGnlzEnMp0gshaGvBl/hhiYM7aKR8OxJekuGbTt8IHlihOhNdBDL+x+60PGA2um1TqSO3vH7+Hf1BqynDM6oDZ3pKpMmV8Ud/c6UPaQm50dW6hb7WNQ+jXuvvfWgPot0X0qF31dgyHCpiE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692156; c=relaxed/simple;
	bh=2NF7dVALFfkdpXYVuPhcvzEPiKmmbFvlEw00g0Z5G1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RUEigXsIjiGISAnENVxA/qdY1PbVHGV9z6ufNMyY6XTJu6QLbIYOiC8W+3czdnzKV+RxfIcmW0J8xn0HJ8bRACuPg9moHd+t/raQcnnHRwy/uWXj98IRZhl1VS3KP9vvDIemC9kb3bH0Nci1KGjkYTqLThg5GSiF0cEzdu8iJ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H37wrkLA; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H37wrkLA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrDBOy/01qyupBxJt8HGxJPHzBJQhzGKXfGTqQFykSGPyarVbPC+suCdfPgHmMZBWXXfUV5W/EPEpS660EeISkCoM10Jvc6WrETr2XmfEatWWJ2Ki4e5py4RRfxwdigyfpoLz3v1nQ3+TEVdacICHamDoDVnG1bw2/w+YKyPcbvpPJwSglkLwxOcwhEbTP7ame89LC12AsxcuLJj6vq3J1vFWVMxwzOwLZ8Hr8+zj58Tj1g8GYbsjyXmFt7Re83mbSsCbmYZrOvAK4lJLXSDfxv5ziVqI+JENQgNeBK+8+phMzB15+l6bkReStc9ouzeepg3OQSQPP37nbLzvxhi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV1w6JgoT7yhJICwHza5ck3sO8BNWUeJrkeOfXwOHSw=;
 b=ZT8iUfatJ7I3zgRiF4aimJPxkki6H+myf9Li6GnN3uMUy3QgNISVZiVQ5feDd3YXL98pLjnffdcQA4VC7HhDMbFuQwj1z7oNJG/yPTB8iqWcygh5cfh7CfwuZegF/n3eMMM7SPEARoiCPzRUESGts0lofq66hpctT0ZzY8EQxPo6YGYSXnO6HMge4Ap1Uid77ztM9OIgW9NjSeQIxwZk0/orJgB496wxzNa32w6jznxIMPjZPa2agBFt3aOyp+ubMTcjzAU2eYhtQczXt33N+LNJAtqByLJvVSUYCjXrtXp6NaVdUPekj8WEBmAyQcCLwb0UYtpBJatRpm5QzV7dCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV1w6JgoT7yhJICwHza5ck3sO8BNWUeJrkeOfXwOHSw=;
 b=H37wrkLA35dTU8z5F7CIMMnGsBtgquIIJkrt6dRjqe+4420mWOTRWX5SF9Y6mhTn7vHfxwMuMN6wjyXNDXLrqaTQ2l56c0F8aZntS2D5lp1IaTN5+LeQ+v/ytSm7p4VfS6aV8QZZ5KMbrtiZmiRu6X0/sR3xWSPmCxUxBCPID7kkeevAbvSi5bYXYzUWLsSXMbIEVAQ3RAxEvrgShiGtTeaPd7oqrNVMI8nA4F4lE1Zo5909yXG4CgKZHvMSeq333sDecBmCtCD6J0YV8zslOGgWrUFZbpOxGxfmXkE3ebbN68snLuc8rymaeP8nyfkn2IOWs08SMh1pj66XVzSgKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DB9PR04MB8361.eurprd04.prod.outlook.com
 (2603:10a6:10:24d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:22:30 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:22:29 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
Date: Fri, 14 Aug 2026 16:20:21 +0900
Message-ID: <20260814072022.4064009-18-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0120.KORP216.PROD.OUTLOOK.COM (2603:1096:101::17)
 To GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: bd175719-bfbc-49c1-57af-08def9d4ccc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|19092799006|366016|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Xy/l/X30vgkG37kRRc7z54bEY9wlzsxpOMOgDW5leAfyqa4TiIAuVJyWvARg3tbh7NplQJ/A1+gEFWZRvEjJVOoFwDWl0A9yAg4Zldvftjxo5LPmCJcu7tCfQhkYa6ffIkbEdnYMt8kAUVc1zpp53eb/fj/3+nFsGhoEVWBSFskNe7COrzfoU+/7tKptBC8VCGToKJwE7SgHE0QOtc0lDDAy2UvGvDzyzVMu8eVT5KKSfsvrEn5PjAyxSKtGSyyhBFvyzQlBjTnvNnpCUEUvWo4PAszOINdjjV3PF8TLw8uWLQC+iZKO6y/gy3e0YkPOsjxIND9uxkdn9Ugfu3suafIjRqGhHdbrzRRRGGhB1HR1tY+VmGYoW7rekHwbx+OeFyZZKR9F1jQZPgTGtXhcfxoYohZwqctnBlCgJss1m90ucouY7f0j1qzgmJzSN+7rPQ9bdY2VI77wTowz8AUoje6uYt2VzHBduC3egaxEVKbn9+9H6tjipWTWErzaINQmIhOHWI+5tBGC3lOOEVL8PpwNXjK70KddFlmgpGELAC4z+jsPfLa6R4nIgPEPDS/X0xHZxiLOrnJ2TSkWl68x9CvZ1ioOpASMXo6RNGYwD7YdsjCPpyjXWearu6BYbNkwMzgehBQRsKSLfh9Vb7KNe9m6Sv6QmgszrZJiaaKxpaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(19092799006)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjchCY0a4xYAxRW3Qlxuk5VM51yYQdtRwlfxq78TX3WIo/zG9EV+XcINFvah?=
 =?us-ascii?Q?9IP+zLK03f4jOhN0kLVPu809aGJO9EFru+vpYUk5aUd+3mkY6Vfp4vx2wTFF?=
 =?us-ascii?Q?MkqJsGzmlSnkgCMxUmmOCWzWX1nRjbItz/LTPBXgvcMt918WiBZFHW9EfnP8?=
 =?us-ascii?Q?yLZbYsOcK7mmCH357cD/jVj3j+0hS3+KEH8O3s5Bir6Dvft0Y3BCmurZjhQV?=
 =?us-ascii?Q?TiPEpyBCcNUJXHLPAfjZPJS3bqFnrNWGcAxPbHK2TY+KGfgEHcY3BH87WpeQ?=
 =?us-ascii?Q?zhYF2cdCtgDkK5tFoaYY4pIbfOwQN9vAazFQdHM0AqdsIlL6XwVqQn8Mw4GS?=
 =?us-ascii?Q?8IpEiIM8Bdl3GQc4La2lPwqXcUEcByS0sFSspsz35zWkvtQXkWcMHpvQRzN8?=
 =?us-ascii?Q?ygrg6BhXMVXp2QWJawO0k71KO8liU2Z56GCYr6GR8PkOeN7wOsksQZoqRbMM?=
 =?us-ascii?Q?dy96Xy6JJI9AoSuyqq94uygv35r8h6Fo+VCha0d0P+4h97HL/PRzNsm67zSN?=
 =?us-ascii?Q?bQnupVF4z1ZzzdhdV7qmiEN0UtUm/7M3ppEtYJS2OLOMK2+doznFMhDo9oI+?=
 =?us-ascii?Q?+v22pwRwQxtR/gP9bQX2zzdMcxTXVxN/RWpd2PPJiQoTgzM2Yw/JlfxN+SOo?=
 =?us-ascii?Q?6E4qBPx0iw4/este8aYnBI7RF0AgszEvE79iu6hVVcWaLhxjfnCs8D8e+q4p?=
 =?us-ascii?Q?aPZP2apZ5wXXhVLmdxNkgk5XobjQIEd3X/islVqIHdejGITFLQD4v3vxImhw?=
 =?us-ascii?Q?y6pyoMHA4GIsT4d5T7LXWk1T4Wr1miBsUvgR4cCM84eEaDdjvAunPNaYO1y+?=
 =?us-ascii?Q?G+wY59S6XcGmpPPcXLhG4PQjdwg13fKvPIUZ0R0qChAssPiA4SJu4qImoHbg?=
 =?us-ascii?Q?shInMs6ro/nq6cDX2SpFblcQ+UBBMhjxCuyKWWaeCngZ6TvKC1UQJYTgkXAS?=
 =?us-ascii?Q?TGKlB5OeMeNPqnwoOatbyeWYJKvHT1RXZ+rDDPqNMm+PLcRHYbMQYLYKS5fU?=
 =?us-ascii?Q?IJ/uqFiwJIjcitkM/Mb2EsRz720413znTi9ntSKo8iIQDZxGhb6lb7O0tIHZ?=
 =?us-ascii?Q?UArbngn37WnyZGPrtUR9o7k+na7Qq/2iEFaFAdc6Zrwc8EUMrzLd4GI5JuIe?=
 =?us-ascii?Q?8AkZuXz85gF2xjVJ+YPKqrWApKma3TzDrSK34Hr8YK5FPdUViuESPJv55lHo?=
 =?us-ascii?Q?K5kcJ51bcobboheumJ2dHLw90WzQhcNNwdDRVTFs/aoCeVn9tv09akIU1Ufx?=
 =?us-ascii?Q?YE5UqFA/QP7vFxDY9i835tqEctIfrzHBxcwINKQg0Mj2x7DwhcvEC3KYZvrL?=
 =?us-ascii?Q?us2U9TX5K/pUArp5N5W7rnQPw03xTS5x37ozm/Xedv5fSyyDqnzWGcbNKoH/?=
 =?us-ascii?Q?blT+27fXm1T4ZL1SRyfPCha9dAu//fJN5Jb9BGq1ccQNyqyjGsDG/z9fGxha?=
 =?us-ascii?Q?OlFVU5Ubs7qoeZB39LgJbHiQFN3BOhTOG9S/KiyHjD7z1uH51wntwYlNSu5K?=
 =?us-ascii?Q?NT1wbQOGkzPOGx80TNzx5bIl7ELHcpFfSyLz5sMTEAqM3v+WrIg9Hv5eXaZn?=
 =?us-ascii?Q?DUuBsiJrblZnrINS1sXbmoCAg9AlrAPrbMhazylNb640gw4LMz9RyLySHPLt?=
 =?us-ascii?Q?F7cNCrEWLos7e7y2qxTY20uYPCiujDIu5JnsuPXGv+SNabasy37xlQHvnhnt?=
 =?us-ascii?Q?pSHa85zqatAGbD6mrGSfAR7k7pSuIEykg3YSr7C4mIbYBPDgDwt0sq3tJ8et?=
 =?us-ascii?Q?sGrbDdRz0NvXrW6m7UkIb4w9vQA0tZm/G84A9mFip2xSQTSfgDJh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd175719-bfbc-49c1-57af-08def9d4ccc6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:22:29.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxKpYAZiI9jI+XtxUZElQIq2UKBQS+ddNWLwRoOxuqc83onFZzREv1sDXJBUhlaAV+18YpmcAm8rzsDjSVD5m0N8YEF0nPC5KZA8AcNp1t4KT+jM2n3ZKKI4NYByvHnA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361

From: Chancel Liu <chancel.liu@nxp.com>

Add a common DT overlay to support MQS sound cards on i.MX9 platforms.
MQS output pins are often shared with other devices, so the overlay
routes SAI1 to MQS1 and disables the conflicting device and sound card.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile      | 12 +++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso | 54 +++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..6e9e3226a693 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -613,6 +613,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
+imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
@@ -645,6 +647,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 
 imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+imx93-11x11-evk-mqs-dtbs += imx93-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
@@ -652,6 +656,8 @@ imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
@@ -703,6 +709,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 
 imx943-evk-sdwifi-dtbs := imx943-evk.dtb imx943-evk-sdwifi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
+imx943-evk-mqs-dtbs += imx943-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
@@ -734,6 +742,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
+imx95-15x15-evk-mqs-dtbs += imx95-15x15-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
@@ -742,6 +752,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
new file mode 100644
index 000000000000..9ac6d58eacbb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+};
+
+&mqs1_conflict_card {
+	status = "disabled";
+};
+
+&mqs1_conflict_dev {
+	status = "disabled";
+};
+
+&mqs1 {
+	status = "okay";
+
+	port {
+		mqs1_endpoint: endpoint {
+			remote-endpoint = <&sai1_endpoint1>;
+		};
+	};
+};
+
+&sai1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			playback-only;
+
+			sai1_endpoint1: endpoint {
+				dai-format = "left_j";
+				bitclock-master;
+				frame-master;
+				mclk-fs = <512>;
+				system-clock-direction-out;
+				remote-endpoint = <&mqs1_endpoint>;
+			};
+		};
+	};
+};
-- 
2.50.1

