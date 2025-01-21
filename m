Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E281F2375
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737483278; cv=fail; b=eKigMcwySdWSdpZCNcPGNfebys3voQNWCgSc9GP3IobOnkIR0B0ww9+85R0UEde+A5QMcFyjr8Behkk3ECeMcin8eEVM4m589AEX5SzWOJ68kZ+clQ/RDtERyCWXqIRyvfr9KEy2g/W4Rienpg0/PlRO3UOerDK8oeJcExSlVqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737483278; c=relaxed/simple;
	bh=yjk0xtTPNm71ErwFfUeyRMcPTdZyY9x2N78xnD48AoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P3kuGXKmAKERmKU9VQ9aovFtFXDkm6l130ENSrwNmaKDiYKLK38AbmFfTPx2Pn88VVJAO3EYpfBUlYyS6qYF0gI6uivQ18afrPOspFCRAHEzKTbJO0YwbgoLyJ2bvXPwjn7ZkJuqzfMzEVC+yjhcXwZmKwcWpXwjfcPFDLSvod0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gl3mYDOe; arc=fail smtp.client-ip=40.107.21.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gl3mYDOe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emOhB3nqxAjyzmUrCHKgku0Ku3n/8kjFkEuDO4Lon4lAHIFwRW4mDgYqpH79XYF56A2ibESIzCx884KMk3IwuWOHYhDN6x4fLqD+0Fg8Q0mWpSE76TG5mcTG0JH5p7PnPtANxdHH01i2u7SwbRcXSTXIBf8gxW0LQFp+PUiVMZM4mKOSWmpUUIZ8mebEL8zlwk0i/2C8litHpgj8iwtS83NI+hrUfRdwS2venir172mwS4j84G+VI6xRbNl1YJqUKDMuHYE7tWKfUOzHHcnb8A+/WGDEHNTURtxSuCXTGND2PA+c+EJhSxOt/WpVRqYm52yed2KNTtoLYDeBWK1SaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+zcIYDu7nphDeX5tZ/o1IS/MSAm3C2Ii/cgmCTjZkQ=;
 b=sfWW/hXhe7G9xjISJJNNLVOlgCFIaxsAFETJX65cGovdsG/BT5B9NSGud8eFuIB+PRpaBFluALnLtWKnlb5IJLDk4MWtFpum5E+MmFtEwDruZgxhxkG6h3u2Bwn1sMWAsrM4ILRIHrdKFCHnX+l/tc7iLVhogZHLkC2gyys9n1kc2KK1orjloDw2J5iNDeMPvEWgW00KXZpm9MQslF3ko1Ww93acW9OcgPs2z/oFc9SlwJr7LZYy5m/90Ce6xwbEMKfMXvVuaJCwifIXFFdkn8nQR5q1Og5BZ5xbz1FdLoM4nxckCivgxPFvgs67T+7rV8SuwNtSlKmMrSQRBrPI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+zcIYDu7nphDeX5tZ/o1IS/MSAm3C2Ii/cgmCTjZkQ=;
 b=gl3mYDOebHIj1rvNLQiu1DrsXM1lWTUSJyR1mJFOkW0JhwKjXlH9+ov2tkf7C3+i7Th6+RxMrWHx+/YA2Vw/8+LChDauBqC99sl2kCcjZKgPyvNvQcRnF2JQ21Ip/G6TCWL/3fnnubmcKKZSsSH8y/LuUkjKrOpxIoDnsv99jI5IabRezTtunWvSHQBxuM3a5XYa/6MRxmjT4R87er898ccb1skLoLryOa/icmvjGKb+Tu94O7xRB6M7sT7eh/VIdY9LLZN9/sEjWwp/ATuobt389i4FkQrj5w42tQjFwWMS/9ztwIv71OI2MBsoiOEtnP7F6mr7yhqjcwyqD3Zw2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Tue, 21 Jan
 2025 18:14:32 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 18:14:32 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Cc: iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	lgirdwood@gmail.com,
	imx@lists.linux.dev,
	Alexander Boehm <aboehm@eurofunk.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH] ASoC: SOF: imx8m: add SAI2,5,6,7
Date: Tue, 21 Jan 2025 20:13:22 +0200
Message-ID: <20250121181322.1278407-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ca18e5-0185-4971-f2a9-08dd3a4773cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XF1XtnXO5BVOxMXNFm4ku33dkmCJ5lVl8XICwQwa80jcQt5j9eqRlTO0OlfC?=
 =?us-ascii?Q?197Q6mhCu7il+2rYSWMYF/P59s+ctFo3A6tU+PncCkPVY6DTQMsov49AZKYn?=
 =?us-ascii?Q?/58CWHKYVtm1qvQoPtBBc7AmznKAQaRmmDZGgColtfT+T0lMNb6VsZHMfYCY?=
 =?us-ascii?Q?xk5XxUaU75qOgMdFQD/D5n98jEOCewpQTfj+Ox/1wbpnM7V1Zhw863f6h1d0?=
 =?us-ascii?Q?XV9DoRktCT1mdoWzuapZ6sDYu3l+fZQre/08DZOhOghl7N4vgjMAgQ3fllpY?=
 =?us-ascii?Q?MNC0ghphi3ygiB5/EzFptuMlt/7K3Y04dq1XwAXPrJHC7KTiSlCOwWReDSZa?=
 =?us-ascii?Q?uY0cfEscXl4wCR49C5K6uR841O+YUoWzHYvWN9EOVcgpFoe1cyY70JM7nnG9?=
 =?us-ascii?Q?sQyMRTQtljwc8mFsYH5ufn0ujUOgEGEutWNgevJOC9Nt1iw+t/fxGfEQMDvC?=
 =?us-ascii?Q?4K+sCR0wfR3NfY41ZRoRMVF4N4x/ZQvbcguZ8w28qULlLU3ZCes9a0KZMB/f?=
 =?us-ascii?Q?CN+SkloNSaujvaWhnLYiTf+vGVwwcLqTxEsdhfI8SA5vJn9o0A5TgnkPOCg0?=
 =?us-ascii?Q?NqGpEPfaIlg9lqCJOix6z4UaIK1lSILqPJq5mL5v4uk6ZE5n5W6QwaEwSBBm?=
 =?us-ascii?Q?6rLEe0WbA7hj6ezeGO8WLBe69QYWI4Bw/E0Vs0LWEhicBLjhuUtKHE6uRV4r?=
 =?us-ascii?Q?/aglzNXZ1tyI8ebEsS+y3riou1bL5fZozJIOGcYdKcTP4eyX5K3sozKDVmnf?=
 =?us-ascii?Q?P8KaypvjexgKHIXLtT0QdXOddmpQoyUEvfM0iKjjHfab8rCTzOdN6U8fwaKJ?=
 =?us-ascii?Q?+8+Hr9SRHHFSJYnaKPW8VNtJmsPRE9eZ8PKNtAhsPn6H4J3JercssCCfbh6m?=
 =?us-ascii?Q?e+NrHb6TemPL9J59cDAmCFeyropN+EYRiEaUFwdQcEaKaBske2hHWQDeVXZP?=
 =?us-ascii?Q?l183cHx8ZsPwinJoJu1Tzr2jcp1vmuqw9f12uJRPG+kJ9xLkeepB6VyXlXbk?=
 =?us-ascii?Q?sOGXbQLwRKg6OM2PoJlqf9s1/WDSbtzPmmeSbGBUMZF1GXDa1dQHVG1Ro5IT?=
 =?us-ascii?Q?/HjuL6kq8bbKqKijs8jZWoIQaanwH5krR/kD/uCLaF6esmUsxQdWc5eGu+Cd?=
 =?us-ascii?Q?FCNzfljCsOQtZA34+0bb80dcIr4rOja8O92Nya6VuD74ZsI+4XqKmCqdhb+t?=
 =?us-ascii?Q?BaORB4Dr4vh2b48rbKyhJExyKf7/ytDH3Gz9LV5udloJQOfgVWr/YTMz1tu2?=
 =?us-ascii?Q?nMB0JDMPa66loHxMUTGR4/txPNmOLxOk0LCgYx1HOgj9rtmvGncs4+B6weIf?=
 =?us-ascii?Q?Ychc5hGeIJja4YWngw20KnrFn1ZQAarM26DoQDV+li5Abtc+efomNV1OgkX7?=
 =?us-ascii?Q?RnFa1pFjwsTyt6kVFz5ZZHs5lDBKF+9YELs768bZxyw5xmPEUeRT9EuEwiCT?=
 =?us-ascii?Q?N8M6bRe72WdZ/kD9o+2+4mQF8Wtf+KS5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vIvgw/hsqyd5KJmyMhvE5yaIXpiZTNuT3zkKeQmvqNsP0xHTOA/jlMJfCZNS?=
 =?us-ascii?Q?JpWIQ+18gKDgyhX3SDJml8ryak0RF/YQjgZn1OEbsgzmjiJ7qVbkVW37cTr8?=
 =?us-ascii?Q?URGZjM67g0womuE3CkWWPQ6ttGg9qraA9AVkZIDyoRMlKQXtenatAmaCanIy?=
 =?us-ascii?Q?s5j2CjmnEONAxbKNwwBmOtRQVH8FTYsH3ilp5ZS/2kjrXG9eBj4JHbw9tN0V?=
 =?us-ascii?Q?PVcQtknsLsvg8A9CGC4mABj45+eSdjWdKt3JJI04wKSA9uX4Hk+VRVg0odTx?=
 =?us-ascii?Q?bjnXQLwnCqrjqvrJOPNvsuk8xu/saK6+gOxO2rbz9V4Sgy4/jcBv8uT0ufkh?=
 =?us-ascii?Q?PE7EbLprMA/e2Z6YwXJk1PNPRT6b86lSW7kUSwOHzZoO+qP9s02ikR5xFXsz?=
 =?us-ascii?Q?UpQbwl1xuWhagsqr2PgaNytX3nNIftlSMeOKRnz/8RF4lGzYUFhDJZ925Mev?=
 =?us-ascii?Q?+MI/cfT86ajqBtU4iIY7fJDf/ljzgipa7aMydsh/yHDIcDlGBa6nDbNtBgmG?=
 =?us-ascii?Q?XopW4PTXJLyhZfoa1mC/OMebXEktwrw2PWv4PJfSIKaWwZO/4ZmoVKSna8i0?=
 =?us-ascii?Q?blbla8GSBwRswj9XroIEWvBmprgSNMg1iPOK0aBrbgLsAP1TqDIRlnIQnJCH?=
 =?us-ascii?Q?PfGDrsYRTkhwLsfQJDRi25Q3OxvUDWQiH1G2pn9yJ8W1vGGdxCZmBl2RTfcj?=
 =?us-ascii?Q?4vYUEA3NT2NUSIhZLwT1DkmLft5ebtfV6fRFbLe5H9NndOa5hLTeeATYbMwz?=
 =?us-ascii?Q?qQjBz/j7qk6i/K8DHWDqXm6VJkU4fF+N3qiCItGMpZFQFlti66mEfnf+w6Db?=
 =?us-ascii?Q?LAPCxfD1tD05kAyz3W7hdlPZZEBrdd2yYFTDp25YodfoqJCzHhozs78ruTNj?=
 =?us-ascii?Q?BZTdEShgh1gAKIULEw4P7E/ORZwpjfxcRsFcDp+wGRsEiXlIbFKqAv6X0C4F?=
 =?us-ascii?Q?M90xrivv5RUVrR3QF9oSS+UBK3bnNnhbc6FR13rmV/E4IM+tpt3Kqoe6/owD?=
 =?us-ascii?Q?xxkVA95ZbHN2fCKzsfQ+ZqH6DTl50KfG0zKxf76NIFmkNop4r+Nr4PYqvtkp?=
 =?us-ascii?Q?2LxaUmduxwz3WmAYiMgo6QeXVdsgwZjnrw292PZjChLXpr9/uoa1iYa7K5al?=
 =?us-ascii?Q?tzPiMVcI+nfFhbJSloLBxlFRnG+Ahh5E682HLxos3xvCEvboS0vFo2kV+y41?=
 =?us-ascii?Q?bhdHTrUU3cbPHTuHvYfdxUK2pDcAU7nK++Tr9p+nOwfeTuDLBWq6Os1zQNNU?=
 =?us-ascii?Q?IhWC15zov3w4Fsx6sTpRO5lPnAuFWfFMAo0IbH/hsajhnDh0zHwvfALH/+bD?=
 =?us-ascii?Q?YD2kRm2+z7yZMd03r/q0kaNyt8GKopGEDWHg5UYonopvbT+2Q7UFf3I11SGx?=
 =?us-ascii?Q?4ZTow2Mii9vgkmSjD8yV9nKdRJWY1mnIfiB3f59BNRcFJi21Zm59LLNNE6Me?=
 =?us-ascii?Q?m6nVTgote4bbDmjHvcKegablVVgmfUl97I5J1orwGjYu35y1ViSjPdSHqcFo?=
 =?us-ascii?Q?6vlftVKbbhy+9wQSP5/o13FBp+CUnthjnx1hCULGII5h37BPYQ9g2MlQaOzo?=
 =?us-ascii?Q?xzhIAdvi+jKSxMEkJtMp3mrZtKrMYFYnnmfY8dFv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ca18e5-0185-4971-f2a9-08dd3a4773cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 18:14:32.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrMO7CKj9/epPZWgXhQmcZDWkYWfTT+4uS0K9G0JzLLFo7zzrDYVfORvn1pwerjEkY9SvEV7+0wPh2BqUv1e5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

From: Alexander Boehm <aboehm@eurofunk.com>

Added the remaining SAIs in addition to SAI1 and SAI3. There is no SAI4.

Signed-off-by: Alexander Boehm <aboehm@eurofunk.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
This was sitting in the SOF tree since 2023. 

 sound/soc/sof/imx/imx8m.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index ff42743efa79..4ab5814e9117 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -294,6 +294,17 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 		.channels_max = 32,
 	},
 },
+{
+	.name = "sai2",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
 {
 	.name = "sai3",
 	.playback = {
@@ -305,6 +316,39 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 		.channels_max = 32,
 	},
 },
+{
+	.name = "sai5",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
+{
+	.name = "sai6",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
+{
+	.name = "sai7",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 32,
+	},
+},
 {
 	.name = "micfil",
 	.capture = {
-- 
2.43.0

