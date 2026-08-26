Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6625B09E
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719924; cv=fail; b=M/3vSXfzufNGgDkIJxlNm8Ki7PNMxwQdYmXJoH5UdyZsfWh521rP724AL4SBnEWcKyOJXQbtjLnNO5cXWLuSvXyfeWe/UP4Jg1zSQqLHuyoFFlICN9CoQbLn3OAFH+CfPXgbVJPJiFOtU3zCe0DVdzzltBtUyE4uNuKf5unaW+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719924; c=relaxed/simple;
	bh=CZHcA+G8Zi5cjyZeZB7xgJAE7Ac1skbVfZn3GwxTYqs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dI4B4SacTe1Yvf/Fdu9QaoyUwHFhuMLKITjThWhPgdvZavR8xKmhJ8BM+37/EjSfIs/8HdRuu2XKomzUePb8Zbve2Pgc43DEvw8t987dYMvBU7q2wI49NWGhl9ukzDTS1W/lyOa5FSLzT29zoeB5GROEl9ZA3dRFaMNbmBYT8nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vNe1MMm8; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vNe1MMm8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOWwiim5TR7NTh97XI5SzmtRvFmrpHXZilj2Bxy1PkAW/odeEPVwRC/fR2VA4M6J3aeWcRYOAZlYAAgwp7Bty3aEa7zeXGjWQ14TUkxuc6rkzNfH8NGsjPuv63VS/4eV0AW1HYkMAt9tafwvv1s+JFkzZF7uGNIbv1xmhDc5HrQj3NDPote4IpHLe/33M7HMbiurPJKQKoi60tW1HASip6gUKsTJzI7L9fCR8s6ynxDEmvUeUdS9KIFs9WDZ4nt1HovtQjENLbCnKaPJOHvddJNwgw2tu4UWqk8dCvCuU1grNehXR554o7bwYQBzbrDMbmVwUIC6OGpiHL3HQjTZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9UeT+CM4CZqq12XtLi+fHvm7EzrlDbjnPaROPNsxgQ=;
 b=q2xm3qDieZFdg2TvFUXCHZbo0+GqC+XF4HHnK5r+JP2UJllW5xmFWfL6ykYp2OzsXUyVPs2THc1oJJD8BfSI7S5Rk5xJrPZTzUuFyP+SsFS/0+J0PnRzKbu/psDQDSXiCVpQikCejlUFl1uGy9bsgWqX0RvWHq162vfxb21yfpt0M4gPaH8iusISzxuPRcDjGsAtcfQpEuvsSGdqM0sOeXw2ddtNGoeVoCVp+/+ILcjnLBMts6efOZIKBcIRVBkpshb+7JarvLstPNzHOn1mPSqSS4QZI1XMtZ2VC2XFzuqVslzt4cNNzCVVbVisxCKZ75SHrxKn0+frCvCPp+QP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9UeT+CM4CZqq12XtLi+fHvm7EzrlDbjnPaROPNsxgQ=;
 b=vNe1MMm8TmuiVEw5LNCXRWCYT4GyhlCSeuRHeirUnjASyGbu5vAPMh+68WH3BMTWAFOA0aR+EfhVCM6EDn6aqi/zRnC2Lm/8K1JRRSHOsBFiRS0IgodBIrz3AGh7tITEYDD3qDD5HVvF4m7qJhgY2k5VuyUDdSLzBHqaz5Sx4q5fzSROFvEdI3a2ijlMLoz4Iz4RkiyCdTk4c3TTbsRS1GX1BC8RsPmPNtgrJ66wlAc6xtgANOt9uGUeJN6QvBlMWNN0E9skODXX2rqStjFx3vA1nxvAKU1bUIepEl7LK6JK9LsQbqB6m6GzJ0rBs1eK++axY6JEtsv9t6hvoh7pfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:51:59 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:51:59 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 26 Aug 2026 12:55:42 +0800
Subject: [PATCH 1/5] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-isi_imx952-v1-1-cbfaaa3f0000@oss.nxp.com>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
In-Reply-To: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=1677;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=CZHcA+G8Zi5cjyZeZB7xgJAE7Ac1skbVfZn3GwxTYqs=;
 b=Tq8dr3FCbd8GrAo2mH0gJKA6fPY4OuXDfEAWKcNUq9NZqeO49hKUMafLj9AOUxZCzYeq64cK4
 tFlnVL02bu+BKoZAG5lQ/ekAcZk3Cv4xPKo69Mx3zarxHfvXfJmjsUA
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2938e3e3-f133-4896-fb8c-08df032dc358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	O33bXLx+n6R2Olo/P+MbJCNTAagxD+lBeG+ySbw/4mKpVnNiCSQxhGV9TEahdcdNk8oIW62UNpeJANZjJmRSSyOiSVlSPyR8mIOWzQaZ9H69DgxKWKBuWkn8GTmf4Z5YcY5dFlgn5GBtJ1m5pcj2L9em5xi+xiSatHhCgLkYHwyWQ7V1eXb3hJgkmSQCNfn1LucSq0VZjb0XByW2aP0cukKAbh/vy8BLzYsxuyXXEf1JlDmsNZGHfThgmgOD1XqqK8KkuXrrwIRkdsuZM9srHwufN/HBCJ6QTot+troa/fm8JjhTeu/W//g/PchpBo/L0UDxm1U8Gzz96PMPZDWKchvWSP0OLzS6l9F90NZEFQEu08aj16TTtP3Kx8XccWYUSt3x2v6a3PfvRivHaDXdwzI9w5OdJhlnckOSdaepzPNgDCSvXu04wtZ7YCzyhjkUsv6Xrj77a6+K6GyzaOpD2TtL7dZQypW6CAQSk7JacK+D5hWMdQ+v1W1aRetldW1xNEjywC99PrimVhjoJuKqohVNM9jz3doP7nEZOgciRaBuQJPbFT0kHakxZeh7m7ktHrYQoStunumyuzeJddEJ9zC2XOP95OhIna8JhCuMmEdnpPDReWDaGOrGTKNMaXQR59gDkvKwcBomBJ8lnAsUcCVRNSTILOzdCNcxEfmxBRqCVKqnLEUv1TILgcagxICTcAILplcQjIIZ5pW77blmew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlhWVUQ0NXZycVhXZll6bHVoZzhKMWloN2cvd0U5Q2NKdTdTQ2xKczlPeGlN?=
 =?utf-8?B?R2tid25uUnE3WGFMdDB5ektDMStFMFEzYVd0M1ZyRTVJWFlMMDlKeVd0WGZZ?=
 =?utf-8?B?WFFPWXBCaUhzSjVPNllPYzV2V01Lc3JjWEdYeHo2MTZjTTFZT2FGQXNqQXpI?=
 =?utf-8?B?R0lZZWg1aFJiSFhpaTRINGZ4MXVLMmxCTHVrOXlNeEV4YU1SNnQ5dXZIYnRG?=
 =?utf-8?B?QktWcjhnMEhaaWVjL2V6Ni9CTDZDWjFGVUN3RVJuc1phNXZGdlY3YUV0THVK?=
 =?utf-8?B?RTBCTXJnU0VOM3Q2MURjVzB2UGhRSm9BYmcrNjBhWDJBMXRWcFhBMGJNaWNY?=
 =?utf-8?B?V2FiZks4bGdqN2pGUXVIb01EUEtGMEtmU1VMM1RUQUNSeUtCUEhXUERvaWtL?=
 =?utf-8?B?ZmYxTExrQVFyLzluZnp5T0xzalk3dSswZjJITWpRVSt1SHpESTIxTmVvaGF4?=
 =?utf-8?B?K09KeXBZajlCRFhhbG5YRHJRd2ZxenBCT3RKdDhxb2tlbWhDSUd0VW5SYnJX?=
 =?utf-8?B?cituVkZ2cko2WWJaN2k2Y0tUQ2kzcEhsU0dObXVsRjFFbzFLTW5zYW9KQTJy?=
 =?utf-8?B?RXFRbmxLengxSlRSNFdZbUtYejlNZHhKRmYycmFVN2F0RUxJeU1oeFRGUlhH?=
 =?utf-8?B?TjNpWk92NlYzU2VCQkxrTnpzRkJQdHlHOWJncDgvR0pnbnJ2WGtqMHZXMytl?=
 =?utf-8?B?NFVJNVYrbHVIY0pKOXk4a0VjZCtPZ0xoMm9XdElVVk8rblZhd2J1T01KQ3pQ?=
 =?utf-8?B?VlFoZmRaSUZTOFdhUGRWSEI5RjFzekY0dHA5RDZ6TWNsVzRlYU1CZTRLcHdD?=
 =?utf-8?B?K0UvMGkzOXJ3NEZLb0ZaazI0YkpCUUNKdVRZeWhDM3B6TVNHR0tRZTNMR0lX?=
 =?utf-8?B?Q3NkS1pDQzFoWWVIaTBFb2V1NWRya3FaWStla0JOZXd2S0pXUmphelk3MXNx?=
 =?utf-8?B?Z3NTNkdURWZ2V2FRcmR2d2Rxcmk0dHdVZ2RIT2U3QkNMM0N5TWhoSC9YY3RO?=
 =?utf-8?B?MTg1a0NaampJblluYk4wSndDSGNWM0hUL29mdmIwdXBzUVY4bGcwSVNTVSt5?=
 =?utf-8?B?MFNOb292ajJCUTQ1T3BhSGRUbEh1dWpQOUJsbGNVZEh4NnF2M3E1UzRiQS9W?=
 =?utf-8?B?ZFNFVWFhVHZpV0FSclhsVk54bUlsZUFPSkpmZnJmVnZyeE9IQkdHM2V3ZEVn?=
 =?utf-8?B?WmdjZ3NlelkzcW8zOGMxTzVpSFBvWmk1TVVVVEVyOTJYZ2QvSHhGN0l5VUR1?=
 =?utf-8?B?UHQ4NnFXdUZLZmxpdWk4ZElkUkt5ejFyaVJjNDhUUmVsa1RXc2phNnRNWTJr?=
 =?utf-8?B?Y0pETlNLWlBMdVBNaTJKUGNpck91K1B0MzlZUXNwOXpnYkxJbzUzZzRoNzVF?=
 =?utf-8?B?QnVRN1BYS2dMYWd3dzdmMFRuWEJBVTQrQ1RyRzk5NjRsYlZrTk9xaVFzSDhz?=
 =?utf-8?B?Q0w4OE93OTg1dFRYOHNqMEFjRTdZK2VVQjRQcUI2WFBXNmxKU0dTSU9qbnJk?=
 =?utf-8?B?Zk9TVHJhdDVzOUZ6VTJQKzNBYnU5c2VEQ3RKOUFENVQ0Q0dXb2hUMm4vVDNU?=
 =?utf-8?B?MUNwalBJQ2UzMzgwb0VMUnBZWkE4ODZlejZSQ1ZMSFFtYWdXbm53MkptM25S?=
 =?utf-8?B?emZHRXdzdWRmejg3UUVEQ1k4VEZ0Q28zRTFLUmJnTW1OM2YyWk5sQVhtMmMr?=
 =?utf-8?B?K3pLcUc4emZpNWNZM3c3L29JQmdmWFV0Q0hqNjNBZXZhWmVNbmhvZ1JYaVV4?=
 =?utf-8?B?Qk1ncU9wU2RGS3ZMa3hIZkVSc1FiOG5IMDQ3TGtwakxJSDJlVnlCUHpxWmZm?=
 =?utf-8?B?SVJIdGNrcXFVcjRJUUplN21GemozaitBdyswb09wcGRzZUdseVM1UE1ScklW?=
 =?utf-8?B?OHc1M3lWV1NVUGVydkVXdzZBdkQyUFhPV2lzTlUzd3BrcUNiV3hWMUFXSlhI?=
 =?utf-8?B?LzhtbThTQUI1WHVzOVczblltNk1JNVd5bUg1V0FZd21BTXZESElNR0JMQXNl?=
 =?utf-8?B?MUo0VTFLUWJDcGw4UTBjRlVYdTVia093TnpFWXY5TnNORWFJMThQWjNGNTVC?=
 =?utf-8?B?OE9hblMrT1UyQ2gvRnFOVjB6L1JkRU9iQXkrd3BmUnlIRUUwR1pZZG16UXVI?=
 =?utf-8?B?SkhIbjVPcnhPQkJJa1V3Qk44bjdVMVpyNEJPcUUzb3VCYmFWY3pybHhkNGs3?=
 =?utf-8?B?Z09RTUlnT2cvSzFCZms0cEtaREFTT3NFSktNSDk2My9vTkZRQnlnOW1NOUNh?=
 =?utf-8?B?UnNPcWpsNFdmdVZzb2ZNMnllMHBCdDVSUHl2c0hRSVlWVGZrN3RYcFFjWkNZ?=
 =?utf-8?B?SGlOMkhmdnR4ekxlVS92MmowQnRSVjVma0oyQ3pmTU5KVXhza3J3YVVpSFFu?=
 =?utf-8?Q?8Y8rqQ/WEqhSriMv1s4NNIyYtZpBWA6FNFOuK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2938e3e3-f133-4896-fb8c-08df032dc358
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:51:59.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u98hrSaFmPPee9xc1Zhbr57FoL1LAZIHHJIK39rODNTaPU6Kj2ptg7rwclIRSzMjMWAYt51xUb7zT5D03dd6rpWqz+Sh5Vb9m+Jya0B04nKNjZlI94Q9l36JCGh2CaTL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

Move mxc_imx95_data definition after mxc_imx93_data to match the
order defined in the of_match array.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..f2a8eb82fbfd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
-	.num_ports		= 4,
-	.num_channels		= 8,
-	.num_vc			= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= true,
-};
-
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1

