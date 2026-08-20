Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2E23D812D
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214756; cv=fail; b=Zs8gy/m/QUtfO7QTu8nm59R92za+QXIYtJ3eLb4ZDXvF2Hf8aUljHtD9h6w034XZEfZtkAuPTcqX+dudqmeGW/5npBdepXPzDuEal3lFMS2rN9jlyNdeuR9d8WzR3aEGcvukyRoZ+UFrCH0g6TiPDOTW7MA+L+70pi+E/yL2MZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214756; c=relaxed/simple;
	bh=ykdBHBZmtvHsZCI3iQU9Z/UG3fKtyVdokuq0BOqDIU0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S7qmNlbSU/0jFTqYyR0+JCgsE2mEpu+ylUt+ibhlhx0OWq+dfKo7jp9hBNd3pEk4qyql4nZyzApikP9cPSwWsygigrLIeIRf489bBLV7+ufGqVY3zceTkO4Na0LLq81VA7Fz4CtAUs74JbLKnNNtHx4vLRtDtwy78yeOnzKaNAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eFY40zEp; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eFY40zEp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBkU2/E8RDbbgSQBUr47/dv9CwsS5beFuI12Sa5ACuPfcULW831PXGdhapPagEWt2nBNtLRBLfAJ2ibT8tq6ab7xMraVnJId1PzYRs00azT9m6c5L0vRcVF0y61qepu1OwjlNJoyhYP3eK8hYR0qf9pbb8TerkdbTSU+LJeFTlWqIJ6KWGuQSV6TTuGE2JRZb1hlnQaqKRO01Nmnz0DSmvHInpoRfh63iZVDiYK/U6JsF0yw+of2p4Pyhowr307dQuorMToetIYk/cBlbrGKeDslU+gLJZAAEI3bQjimZxXl5TqRgOxMbvcBPHfP+/gbJYSiBd1Tbr5I56XPVNDgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpHVDB9fbtIckSBk6jF6MZ9V27KSlqMA2QMS/qmj60w=;
 b=DBSDe0xts1dhrnbURBGCytGOPDg7bojFNpoTCgaiJfOapDdfM6qOkEqgKkeczOMVQN6rJlmJlOxWlcNF/WiSxuuKxJT2rmkGH6qKfcUtvjfRWNOQoaJJ93/Iie9NB1ou4l/vNuUnCdH46wLyuzAWb9yQ4IbO4B6bgBSYGhwH7uVcEYgyWkvfm8orK1WzIEkgVMxe+eHsImQXvt4NmUu0wittTI0aTKZmec6yoOkDQj4ognMMPTQJ3QDJZX14hXx+QCS2jbdtcA/iPeA/Qd4tAnnDkOrMjFdxXL4HzkKwIYvV0DLZi7JFCOaOUNYM5wM8Kb646+gdZsV0eQi5MIzTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpHVDB9fbtIckSBk6jF6MZ9V27KSlqMA2QMS/qmj60w=;
 b=eFY40zEpkLUlXSyFcoQVeCNyLaYW8YrLRi/oQdotmIpItOUyuRq4MJo367qEIb27xXZGGjdcLbU6iJjOoJN1E0Lxub30qwclCSVyGquCi+Yj9Z4F03+2xH2iywTYp0OHsfjYXFXaoc4/eRmKjFseES6YJWT2CeYVUuwx3i3KZBxjtwQQA4i2StUoE7+90YardAzlRDZs/fY1JDVIuntsZXaRQ8F0RdPki1aFXOzzq1QPsPGbgI5d7VlB9cmATlVXBfZF8e+YGSTMBpC99fHCw2Nt/OzG7YDtygTwJvR+y+gFHP9OqpDslUa3nRNF1/q8kju7KHW4dSn3hDLZKabNAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DU4PR04MB11727.eurprd04.prod.outlook.com (2603:10a6:10:623::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:32:30 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:32:30 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v1 0/3] arm64: dts: imx9x: Fix PCIe memory window overlap with System RAM
Date: Thu, 20 Aug 2026 16:36:17 +0800
Message-Id: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DU4PR04MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: 5578719e-2853-4cb0-c2b9-08defe9592ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	8OLesj2ywupHyvrovtfmF2e5bUKbhU8YvN2pe+lq983mLov9F+ToRIg4SjBItmfuIuLYSfjgkp1zH4zpEIlvnAQld0EieR6KO7APOP5ZuPn62Za95cBGLDxNzS0HTaUuuHNh/DAHVB+IqmTJ/0/SqpLmzI2aDWCrttv7jATzDQloK1YvJrBKe+Wf/uNar6tRdamI1pjlRoSB+GQGYPWyPJdg3S03Zx57zzFs9KAgY+scNUGUHb4fJs1ZICGsRrN0OlwaZXGAv3RtmHtvBqFjZ+jGWObI3GDU1X7PiXM/pjyiJT7M81V5dWEmeeEK2IrmDxd5aURkr6APz6V7tJQMZ8rBitmjWhp/XEHh9yTRroqrLMMXAqFiEA8eB4dAbFyVeR/G1ulGfjgCR8Xp90dsfEn+VJBAdPn0LfmLdRDDGHGnvYiivmEAmKiJe7PjKiFMPd1Rezx5SxrM4En3lUSqd+wZ2P/lrE0RtLZYX+r4MTdYpdFPLkmnW7z/K1mlJwaLl8AgB0Q1aryR6G502zUVVfXMQGSWzeQhrowm7r3IFpZIPOQnOaZNGH8pG5ms5bmJMTKgq6A79ddAkIkORCz7ZPiCqIp9OabeLG0sHRQ7QMDwJ4UEBgucOoxjUynRpt4vTQ5umJOgzYeQ8Z1oVCNv04KjNrejPOMT09K3lMP9reM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcd6qdMbDqKFaIwbIEfuqj9CfLIJDL5NhESq9q/b6yarVUFdvKBU+PhHwF1Y?=
 =?us-ascii?Q?Q+/4rzHVFKAqxwDvZJ3kVcHbbC4fVGkm1f30uzT+pE1ezWRWG1QR3fFH2wDi?=
 =?us-ascii?Q?pTYg5hP78i4CD8/VOB6Md9AHcrZ7skjIHoWNp/cUCHNl00VkKaWYfND+NQOk?=
 =?us-ascii?Q?eQpFzDPzneYXPKDgxMWy7Kb+VKI/N3liXi8oH3bfJHYYRHHxE3E4FVPwwxdE?=
 =?us-ascii?Q?a8Mr36Mp7VCr5T5CkEFg1ow3pErIMnY1Ibc518OHUZsqqIPYUK01+aSrxl32?=
 =?us-ascii?Q?eyyTryH0ZcrfgHP4s9s3XZUC58THiVxBkv7t7TzhwT3MpnGBmSGW8calXmkg?=
 =?us-ascii?Q?Y9QYHornCA+GQYgnOUIFaoxmfDtgtysNyj6VxgoPJojlnAM/v5UVZ67dMVLy?=
 =?us-ascii?Q?xYyDwxIopC5JrhK4OrbtdDXvYQVDrxJHkWcc+6lsr5gkXwTU4sVPKDnbHxvM?=
 =?us-ascii?Q?QVniYq8jn/No+CTxKindIMRlHCsBSaT1d+lzyS+z6PBIeEtHzNO7/23bpQo/?=
 =?us-ascii?Q?EcwRtlUMOkuuZXhOKbl7QifsgCaXhPkhXMmHWXPrVbOOHAm0Jb1LgKn2Ckcw?=
 =?us-ascii?Q?vKu5ntlpgyKomYQ37SfYyeJh3d77PNQqPnYnMduUkEAkL5MYBewJdU+8mtKF?=
 =?us-ascii?Q?OnmUppBnMKoGHtJdCbN90wHt207w1G2HJUqJ2qlzthEUsipWxHV+i8ReIfPm?=
 =?us-ascii?Q?+yOyVSJTk98FdOng0z7KanRYdVGjgf9Bu0QtxvR8HVEn5kC/R3sdjF+h7X+Z?=
 =?us-ascii?Q?54mo1XTx1yMgAAQKWWmZwQiaAy+9LL4hB+cHyiDf7w2iIwkA9ihgjmPBjFPT?=
 =?us-ascii?Q?x76Eak7B1dI+xcXLYn0DSB8U7RVdWOxa7f980LzDEhGZ4N9pdMLrDzlLfrbw?=
 =?us-ascii?Q?JUlX9/FQkqUZ096E8NU/XDMA+9DBfmp3ixDJbZjrJSRxCdCGvrfzixxAHD7l?=
 =?us-ascii?Q?/2AXDqc8OWFbdL7kdmGwhgl0qxscrLe91JJ8P0bnb+TgMfSXvdpL1AIsy6Bx?=
 =?us-ascii?Q?yzIiuwV/TLhsPXNNjnsQlNfGb6rxX3KeV2ttFv79JQfaq5EDvuOZ7Z4Wtzzk?=
 =?us-ascii?Q?sYMWl9m4QDIrVzQbMQbGeBQqwcZBk0I7eIma67AisN0H7beR06N5bkh/LNtX?=
 =?us-ascii?Q?3/kEpHiB0ouBlCaOX00UdTmqxOnqd/xnedNSuDkYH3e4wrom4XZTE4oF12Yt?=
 =?us-ascii?Q?zYoQ5BeXI4zuZqNEuQ8Wg2uQRjmbEib4b5HETThKWfad1GXMXL4JEX+d1Qsj?=
 =?us-ascii?Q?9uGuOVHf5rElcc7iI3c+g3klVZcTf9IyQl0A3v/U2klqCzy6xomlX9y4r1Wo?=
 =?us-ascii?Q?E53Spdr4VTv2Cw+UUnpCf3H8t8CkQkEX1YOZyYZSQLWN39HrsUm5nEf1cFEt?=
 =?us-ascii?Q?soxFLIoY8m6dcmMmG5MS4uK95jFfoVUmj2bAGufHJRTFdzzV7wB0zbR+zQwA?=
 =?us-ascii?Q?X7v8SkCqElnQw6keUZb2naG2wGxV5q+kSF4di8f+i1vO8XnlQCHCmALyPcdP?=
 =?us-ascii?Q?cbu6xq93vOnjiJmhCIJEXK0Rjm9KvuESpGe/JlLWY36i2HdjDlowzWQ3fxNK?=
 =?us-ascii?Q?T30NT32xfetRxrbdtKmYLxj5bWX2vwhE/yGCO2OIzykv0Te4+XqUTWqubqjY?=
 =?us-ascii?Q?YSMGQAmZNPhi0axCSsZDfhL01pfy9EttcMKc23LefydWlVYECUfRbqMBHel9?=
 =?us-ascii?Q?51GWFhevK980UqSWT0XTDhuiCTEZr/lIgCdjcmZ/wC0d8MvR1f3TqzJrGwcl?=
 =?us-ascii?Q?52a77HRs1Gooat5WpLNCDXV1L+IVWYfMHpjjQJACmJxxc2qrn6BO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5578719e-2853-4cb0-c2b9-08defe9592ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:32:30.1049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVz33M9eikFqqZevV/rhNcjM2+0Yt+Uv38z8rrrTashOfs3P9+asxqPxPJba1XBIxbpVjajw5G/S8Nvw6QDomXCuHXiNDB82m4o8ZPIZtVmPX2ZSmieavlayrSPPe3N0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11727

This patch series fixes PCIe non-prefetchable memory window overlap with
system DRAM on i.MX9 series SoCs (imx95, imx94, and imx943).

The current CPU address 0xe0000000 conflicts with DRAM regions. Sashiko
reports the similar potential issue in below review:
https://lore.kernel.org/imx/20260524151347.BD92A1F000E9@smtp.kernel.org/

The fix relocates the CPU address to 0x10000000, a reserved and safe range.
The PCI bus address and window size remain unchanged.

Richard Zhu (3):
  arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
  arm64: dts: imx94: Avoid 32-bit pcie window system ram overlap
  arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap

[PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM
[PATCH v1 2/3] arm64: dts: imx94: Avoid 32-bit pcie window system ram
[PATCH v1 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window System

arch/arm64/boot/dts/freescale/imx94.dtsi  | 2 +-
arch/arm64/boot/dts/freescale/imx943.dtsi | 2 +-
arch/arm64/boot/dts/freescale/imx95.dtsi  | 4 ++--
3 files changed, 4 insertions(+), 4 deletions(-)

