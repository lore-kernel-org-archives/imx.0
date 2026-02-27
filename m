Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A59284B26
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197219; cv=fail; b=dcMMXUMC3I2OXf3r8vlKqFCeJ0WsKzsFpNbluATWERPaprdNc9tUdtpru69RAdDkFA0E6GYFDrvk2n3O8dCZ3IoGbUXVANVVUuBPFxfKiKocRp7ZJzsnh6bRhIr7Im7WZACaKOYDMjpZNJIZtwRiuANhaBYMqeqLTqCTEFjG11I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197219; c=relaxed/simple;
	bh=IqQ5rnnV54zJlPPAPc43DiBnJNxMozWE7lcdblGvFp0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W+njb5BpdfZP4/aQ3or/RFczpD37go9uoO2KV9gsfTzzZhbUUZvN+2ecFyUwLfwf7ToTfjBHSWuibjpiqe8gLIuTUem20LHXBGrOnWLsXBNxZ3AHbKV0/ecZl0qFronIXQ2R8AAktJWtrTN2gwDu7pobADNKKKkzeffpiCzQaHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TIBUyxpB; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TIBUyxpB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRVKoz6tkiry7TRUDYQiVaWrDr861+bg9ZrLq/i0lVz+Thn5BB+G+bbAkXLAFIBRbVGnQNy1kLp5BYMVZS1agKmPSw1hW78JTmgdKZXh6iChmo+7bV8lSYV/t+1Yg5tsyody7eKGdwDaODZATSWNADsVfXPRRrPjwzEK5dm+gKD2SYwKgY54y43SqnnznZrIJtZvLl1zRhz1H2GsQEEA84ULkmnBmm3cy7qrSa0J7hEztu2D1WFxlshepZxKNDuJjv+2eQwOJYGToscIFTeOklcwJeFZeRMjbgBk7nLlrlHHwh3izSSfsnZqMfyjmy5/jwcE8CIGWWGKsEpJGBN64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fljHW1BSgAvRO0W8Ct7w+roHNsKsNLPp/15d0soEgk=;
 b=udtf0JiYIZ4KgTRAdkd1heScGIMP2e7V4CPrvBVRRp/y8Whhsw2t30f4zRvFFe2mR6CffJ9swOZlpz/U7+CN3Fh1WPqHTMtDe04OkK5F9a43+yqemBNMTS97uKOo3Sf4O5BDGdK71H9dg+fqRfh+Vl9yQ2YQv8nxgcgUg0hKVxVQLgJVTKWW1lKtSe4tw7KXaA6mHaBB4hId+cwLJEfjzyQfk6lyxiDLZEglMWRcFH6URBqVvUmFX37eyvih3ZX/ecMi0VL9SkkAlO7Tstr+3FE16Qe4h/JS0nYc18r//hDFPWLY0+5sufnlEzPbpwGWdTklz/o2inO4EnrjINb7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fljHW1BSgAvRO0W8Ct7w+roHNsKsNLPp/15d0soEgk=;
 b=TIBUyxpBtV9iLR1waU0pNw+ZTMPb0SCohxOrt7xHGGPuTLTi87OvcGXk9gktDkINQxp09nw/oUVkFHG/GGZRFR34IWKfcvK/vMmwh6DNeGabZiq7hv7y9a1BRvyrti/8kNtszGZI61LU3fp8OkuUK1BBHcY1theTwPS57yGhgKgnF/ED4LCpEyFVd8RuXYDpIAfQqYYkcDcv3UEvT5FSJ7SPtF1PArKl6Ig1kQCqDq/8bunIKgtD9mzMWwYtNsHJoiwHvxyT5+xMBxE90oYPr+AxFKn1w4KenJBhCTp/+IUSoJzIabPfbkqNr/ee9yB8LJfWixECUyvpb2mXFkKCow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7231.eurprd04.prod.outlook.com (2603:10a6:800:1a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 27 Feb
 2026 13:00:14 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 13:00:14 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RFC PATCH 0/2] imx8mp-frdm: Enhance code readability
Date: Fri, 27 Feb 2026 15:02:40 +0200
Message-ID: <20260227130242.1702329-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VE1PR04MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 20615439-4309-4883-15e2-08de7600260c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	aZBg5WXmgfqoZ4N2TK8RadM4XLl4xD6Iskb8EQ2NDSXidIHwxxlg2Qk569Rwp0SZAjBTDcMza8fPtWjeIOMlDwubCFEAOIBVJAjUvbDdw9BuDW2Lov0G254YKYW3TB7WGr7ZF5Nqy8Yl2SgsOuxtzJAlAIgF0c0DLRAUZb3Q9BRSJ74649N1qEad38D5HhQtCNm5qLfmfJklmjQ63fKrGkpGy06UrAkOJMnW80TwtwW/pS/8mF1e8ai/VthWuhZYnG4269XyFfBECwc1p+BQaD/BNBPrtXEGIxz2HVMi/FuS6YukWnpknYTRwYDKzRpEWFJWLBngW1k6Uz7LbQMYGcUMG4qKo0MD4gEpd9wsaBHQvQ5GMTF5ZWPEROyTIJuRKmPjzxbfM2h3i1Cxm1p4paKPm01XTIuRHDp4phbwFNwDCFUY9BJ2qY2Zj1JevjpVci9waGD9vKE8IylNgYAZ1KkyArhhzGezfXHSnBQDN4H+NmeGR5Z6Ao/yDrVtDk0eGPSV37cVlFqZBS+v/8Bht7Qk1/HyrXNFfq8RFEcXtLIcF7+3i0W87L3ZKJkxX26UqsMkGpxM1CpjsBg/GE4SOOvbXLZX1qcGxtBKfxGa2nPQcr/z1mJ/3HK6uOkHH3iBCCjhX00tjgJB6AvDP/osA8VxuINpALOZc3UXX0Xqq374bstomYi+SgQMGj5smjrCRPhuc8uiuFLkmYCbLLxVFkUysjLGKsn+DEDGFRI1sGJOOlqp6nzixfywVMwDvGbp9Kzb7xJyFV+ApvSSLpsYnUdVn8kNoJ5pvlgpR/tfcuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SWtOa53TSwd9WTuOz44uRkmUXSOvrMMfZF86/KVOyJ4f4glNgURJZylt5Jpe?=
 =?us-ascii?Q?qI/dBTPKDWvdoCNZVstzp8iDCeL1gEZZPAuFBZjDbWHKEpDCSqPbvHvxqICg?=
 =?us-ascii?Q?wbVzhvHxTi51yfvAToE2FGMDl9y58f2eJjp0VYNEmn/al2khkl33uXAfLENb?=
 =?us-ascii?Q?9/TKt2fERnSP8R+isrhTv/LnLngzfi0Leq+SwcRsRp/9iSlbhOPBGBHnTX/J?=
 =?us-ascii?Q?DLnOF6vx0HZO0n2Z6QDMIqCY/44WFnBGqEnIZV5oda3g4fcK/P7gQvQGQAzU?=
 =?us-ascii?Q?VS4C2yMGxQVvX9FRgDdhuNHpvp2cXe0s5kHvSmVVtvqNK3Z+uhyeeedqqinJ?=
 =?us-ascii?Q?a6x590LVctSpQ5LLRnwdhn1k0R4U0HBDNrzB5+5sbhcTSsw2HBvzZ0Wa5lbe?=
 =?us-ascii?Q?IoPT5ZvhQmNBbD1nBpdYz9xtyn3yFMjMknP9B9SatUUqkLzfJjbt77OJrPSG?=
 =?us-ascii?Q?+VsOFXL7SeUbDfcIdpztjEpsHLaqTH/l+js8/rgGiXvx3AJOfvNnjb0POuKE?=
 =?us-ascii?Q?uPKw522CVL9VBZ8252uWl8Jm5KnN3mKvFUwSwEKMRMVgRiuRXCEc0SXXUU3M?=
 =?us-ascii?Q?KVgmskhz2hei0I4ZkPVA24gCqulnF+ljyXFYCPd+WXxQlB49T6y7VGB2tH5Z?=
 =?us-ascii?Q?tOKt6QP+9uGjVbrnwKwXFZIpw1RlohSDOCfI/r86wXHdt12Pwchq3uaAg9O7?=
 =?us-ascii?Q?Q2/I0mrqd48YiWt2JyLMR423WY1jtvDBZ5x88+DDGoFMlG4KB4vDkTMCbfmd?=
 =?us-ascii?Q?7MxAcMwSo4080rc2wfAIPrCnK9U2aGYS8sQ1KtPQ4vRfFq1AwIsKKLz0giZw?=
 =?us-ascii?Q?xlNdPSDQ7i5xj+e2MHDqp0VMqylzzXoEOxwPtCvcjBx4vx/ubJzFiHD+Bg3i?=
 =?us-ascii?Q?3ezT8VkBD5PS+OWDl9WNzNMQ5TvKc99O+58NgjJyE99jANTlExNapt2WDU5L?=
 =?us-ascii?Q?tj23h5Z1Xkf52tO3xIdSzhLrDsUQAyn+tE6BfKodBDX5Xc+9xYzLY8jzF/ge?=
 =?us-ascii?Q?avoDOxYxY655Eh6eKb/SHu+6cyLx6nZ3H0n/L2mm/4YHjhBEeUqtBMqqIItT?=
 =?us-ascii?Q?sHeE/4oPq8LFHZRTzXA95YsS7W65BJ46veJFPMPGOoPDtT6cYkK7ayV8Vwx3?=
 =?us-ascii?Q?TZZ2AKnTcNF5kE/wUFN/Tk/YdSj3AlUNfh8oEwyJ9/+i1zgH4zXFV79qg49k?=
 =?us-ascii?Q?muoEt3yHvH7xkfadUQnsQcdNm31DEBWZQ/KF20TkUTpRE9GoCxNrLwSRRw4I?=
 =?us-ascii?Q?R0ydWrZYSyImhTGVHSjDV+uCunidQ4D7U7dk6lnA8AScU+ggOWqmkVomRbk+?=
 =?us-ascii?Q?Ywk5zSuksoNUmaod47hrLTyrVZHMCdx6ERwxvvrFHf6TuoYwoDv59sRtbfiA?=
 =?us-ascii?Q?JLqvf9GEknQJWptmseH5fFDiyzOyv8iAe8SsyZP40WvsI4K2vkyBZAdIQyVY?=
 =?us-ascii?Q?9jXKe53x1gF40c8QICWAKn1hvFKuTe+kiw39rOS5AgrXDVD25YxvIaQ4p7ac?=
 =?us-ascii?Q?l34pnD/WQkeVkwFla6QjR8n0RRCH3srjVjqdfCpSKMH8PDSLuwT7xCq/Bkwj?=
 =?us-ascii?Q?zCqIBeS36VuwBz5u+zEzb+jf2Gw66unb9D0O6VPFu/plOSbDYpAjVGwH5Pid?=
 =?us-ascii?Q?bU55yKP3AXJCKOtIy67fdgrQMqKa2uyTnW5Cavfhzg2KgTdQ5x/lMnizCvrY?=
 =?us-ascii?Q?UKbISThBwCoUkyjmFfbACZmpFgsCBvRr4ao1i8PTy9TC3pDdp/dqvLsUxu8K?=
 =?us-ascii?Q?75V4O0yqyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20615439-4309-4883-15e2-08de7600260c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:00:14.5281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwu1Occ8ZrQa15p4Rp8BLbxrOF1c7IFvPVaJ0N+AhfYejfHB4b7RCC4AoZJNAqjhtty8zVgWlX4npBW33bTSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7231

Enhance the readability of IOMUXC_SW_PAD_CTL_PAD configuration by using
symbolic macros instead of magic values.

First patch makes MX8MP_I2C_DEFAULT independent of DS so it can be
re-used in multiple places.

Second patch makes uses on the macros introduce with:
31ff1060175c458 ("arm64: dts: imx8mp: Add pinctrl config definitions")
in order to make code easier to read and understand.

This is just an RFC to get your opinin on the idea. If this gets
positive feedback will continue to update the rest of the dts files.

Daniel Baluta (2):
  arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive
    strength
  arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD

 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
 .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   4 +-
 .../imx8mp-tx8p-ml81-moduline-display-106.dts |  16 +--
 .../boot/dts/freescale/imx8mp-tx8p-ml81.dtsi  |   8 +-
 4 files changed, 99 insertions(+), 61 deletions(-)

-- 
2.45.2

