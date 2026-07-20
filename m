Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57816395ACE
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518286; cv=fail; b=TugLnPpszf0FBh3GQ5iyb/O5rrfYJAmBsnZnaoVEAJC9zvr2yl5k9blEZC0bQOe3nJNICtavsBC92cIjycOkLKI3QvY/2GJ332nJ3xWR9ykIy96Zd3QN4Ucw+E8kVVg2uRqfKGm8syXZL0sS6FkM8t10ePSnwrDWEjR9I5MYnMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518286; c=relaxed/simple;
	bh=gQ84FhidFxOrMQlGZqdpL26VQTTR7PRmXdT31fsLHkI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iTAv5GscjjbycTZ6e0hRcN1VZ0SqRCyCJU3387EXy3cyuGoSztwMU6xOuenMnapMZhqD94KVpg2Er1TYsVdBXHHrY6x/JILxRQh7Wf0bKqRjIRKdcmqFUiG2PBu0Cg0c9rTE6lz0Sk9Vwv1rPLLiPWZVnLjWTU9fLHUft/0pqDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xU2pYoHg; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xU2pYoHg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6BKyMpVYGTM8+hg5uw8FCNkStOdEzoRcrGKuIpv8EDZ0SeJL9Q2SUooWcYFVYWQfUECJsrTA3/1Zy4Va9Bu56qML3QHJBGv+sUWUEW6U3sZ7vn5aagpFRKZFxt/y0dgrv9Ib2SJm4rglWOQ1ul0pRCht2FYqzCLAJd01wrJuUyjjn9K0O0FyHZ7Y+nz0dRQ9zEr194tMe+hYZnjP2g8bnnkPaMo1YpOFFrVv0q9C3gjupVQYzmLpuHAteqOTk3XlB58obf7phCsKQ5ACX7/5eXXXhLupY1F0nEtm6cnRVCwxYXB+nuneaHZqrhIN+OJBc9L/5FQNyBaSbEwYL3jRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc4Nulb9p9hc+eMM5m5OIXTvCXPBrbT+CMETT720AFg=;
 b=BZp6TvNf3qJLpMOg5bVkkRDcjx/Ik7yAAqt15t5uLr73KjHtvCoFr+2FI1qUzLvpykpEGyWwhIHlFvbAXBdOOnK2m/8+/KVgPcQL24cIjufogaTOIaouT4ARq44p81nA9mMjNPAf3kPl66Zqad4m1jMzq53ZKDGY5vqVHq1lAmpuOHcRfccrjRXDXNUMY3jVjpTTVeHptw7i+c38o7GV7lUuwvU3gYiSwTJktC1o2zBOIhxAqTi/XFjxd6FJzpnX65LjY5bO771LcCMZVLEuTA46pPkMbXlch95vzmL2w6WGRUVSwgWZ79wLI4BrZGBhswPKQWcP+zO7wXO8QPjMcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc4Nulb9p9hc+eMM5m5OIXTvCXPBrbT+CMETT720AFg=;
 b=xU2pYoHgNbFijvsgLLK0nvr7M880zzA1h9HkuURLqQAdyAddSrpAYE5Mosn68Lsd+8wRwqrd4HS3UB6W/Rke0qGowJsrpaFkHI4llGVlaSzebW1JZtG/Hic+yfRevCS/qL10Ybc0hSwkta3cnvFrcPteC7JWPOxOg/JtTRa4K5d/HdeNCErVprRDCz5YsFptuLk1p6137mEIlhzOhwXmTZ4jqTcyKqkCeP+hcoLFHK1mNWbzCSVkjk5AjRptXAPcV/rUy6vZLLBuNb/LoGO405yX01O96nrSuPNI8jkd2cqStmz5Vu3P6gtbuhd9L9/J4RG8nT9v6GxA9zGde6WfnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB10534.eurprd04.prod.outlook.com (2603:10a6:150:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 03:31:21 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 03:31:21 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 20 Jul 2026 11:34:08 +0800
Subject: [PATCH v2 6/6] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-isi-v2-6-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
In-Reply-To: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784518456; l=3424;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=gQ84FhidFxOrMQlGZqdpL26VQTTR7PRmXdT31fsLHkI=;
 b=4TUsZBN5Zv3s5V0a9Rs+VZ9xKCxSc7vA5Q918WzLEN9SiuK4kPExLWbc3vRFl2C4Tw40ZVSl3
 wORoYvyceaMAeSJ4GYbApIrM53poQMtH8O5gIje0/klhnQ2l0Zwx75W
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: 53352083-fc69-47f3-543d-08dee60f5e52
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|921020|22082099003|18002099003|3023799007|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
 dpwhEi0F01+nDsTO3gytMMl5w6xEcg0a7SUmU44hCqxHfUy0io+niWgpArRzgwYw3tDctfKGRCPzQAEgZ5UFuXN8jH5tqtX+KZHfcIATnfRcudURcMPvoqRqef5TiwwL183jKH/sAuaEBMrV+24RoswV85okgObfGB6L0I7jwJK0YldoUD78257ETXy6ATyN5qJnVBYcwApyLzrk0UlEPpEG266kl5icz63ujWqhKV3S9N6Gn30qhmZb50s+Sw/f/NB9S7iFJYD4y/xcicL0W11P4Su6yCbb/4/WPAfLHAIcvDmnfIJ1SsnpiMXBYtLflQcpXnGI0vL82ziexSMNXodBoeshcnw8gLpwe91KJuV9PcVrXdSXEgA23dO5k9MrcBHmGJlUv6nWKYmH3iSdkb1JJlKEedSvm5yojDthJCdsJzJi9Ni40DzsHdqMsmNrJdxHpRmsOw1V/j8nl/18c2yba/FbHinCHcOgoyN5tCvPbqgW2yeIgp51rT/RUqrcjJVg0nZvcRePQYOsyVIXYW1NT2uRsDojN7Aq+HPu+o+5gFnO2uugC41uMNAPq2Vqe/fWicMVMPhc8t6eD6ui1KtizilFut6XapsfdT9LJl15TBD3gHpS3/A4+GQ2ORzatzQ0WTzWllP3ia6KF50lD8MRxvoT4dyoovkg584939RD08hyKcILq8XdRmBuDro9wHv6p+MmUmoOHJb0Z6hw0g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b1JxaGxhZ2FVbjN3OVc5V1lGaGtrMHhkcjBxdm9DZU1aNWRYTkw1bmJLaU5q?=
 =?utf-8?B?SnZCVnVNcVc5TkxucVRtRTlzcG5xTVRTdkFUNlFkS1dmZS9ZMDJVeEhLaGJD?=
 =?utf-8?B?SDN2emZMalFXK2tNbDNUdGJNWGlsb2hQN3Z6OTFDN2pKNTlSZlY0UUNFeGY4?=
 =?utf-8?B?Ync5MGZsVzFnT3FOdFVabFFiRUV3QzNwZnlYTFRteWdrZXBzR3g1cG0rMTd5?=
 =?utf-8?B?MGtKaEdua3ZocUpDWVc2S2lLQm1iWVNrMys2UXQwS0hTUnFGd0dkTXVBbUZ3?=
 =?utf-8?B?RW9CNEtYTFFwZHBsYlpVOXlJUjB2TE12MER5MWtzTUdtUlUxVC8vUE5wWGR4?=
 =?utf-8?B?Vk9rb2F3MDllaERJOFMrTE5nKzZ2SkhldUNubi8yblFiYVI3QWFOUTA0a3Uw?=
 =?utf-8?B?TWVST1kwRndFY2NYRTdVWkZTQjdtODROS0daeFpxemg4dkdQYVFSWnZzUmdW?=
 =?utf-8?B?Skx6TjBiU3l4L2NLTXNIMUhLT3lyOHdQKzhZajNzWXpnZXU2SUJNTm8yQ0Jk?=
 =?utf-8?B?QWV2UHdnMnI4a0VKVWdoaVFianc4V1Fxb2hJUlRXL3gzUys1TFNjNlYzN2dI?=
 =?utf-8?B?WGNpeFAvRWpPZlhSK2RDZHQwbEJHWHUzRVN2U0k3aHQxc0lpaWtUVVlVUWNz?=
 =?utf-8?B?bzRIbmRYQ0lhbWFGcG5XanRxam5DUWhQc3lWQk5hUWdQSVVVeGJEK3NYR1BI?=
 =?utf-8?B?Y0d2ZDdxYTRrT2ZWTDFPeDYyVmRKZEZnZnVWVHhHMU9hNXNGTmYxQjdUOG1u?=
 =?utf-8?B?ZXpDYlc2RmJTbUVxZng3WDVocUpRWk0raEZUWEcxaWtVcVZ5VmJjRkZpTzVk?=
 =?utf-8?B?UGp5UnQ0dzk5RlpvMHFWd2huYVFKZ29DczdCOW1iR0dsVnBqMDJBa3lnWnhs?=
 =?utf-8?B?ejRpMjk2bjk4VndPMHBhWC9PMTFZSFZlWHFWcUl3SlRaRVlzZHF5cW5vRlN1?=
 =?utf-8?B?ckFiTXZJRm1tNTN4UlJKR05neE8xUEM4NnB1S0pNKzROU2JOWm4zVHEvazdy?=
 =?utf-8?B?WUpGNmdmZmZtdW9maFVmWEFsTHNXbXg5TG9SUEZ5Um1pSU5FMnlua1crUjY0?=
 =?utf-8?B?UkdDekxWSHUrckI0TTV0RmFEYnppWjFlWUg2VHI4WW8yblA3a2tZZGpVYUZ3?=
 =?utf-8?B?N0FyUmdiRS80T2ZIT2FERmRVQ2Rla3gzRmFjRjd6WUxCZlgzaWFWSUFyUFFr?=
 =?utf-8?B?VUFZb3RPd1h1K2VYWlNFOEx6MDJveWNyWUh6RWRNUVZEMzM3L1JnamRhTHkr?=
 =?utf-8?B?ZHg4N1lVNTBNNi9hT1hhNWYycWpsSWUzcXBhNmtScHlLNE1RUGs1VEpHNWwr?=
 =?utf-8?B?d3M3bXE1cWk0bXVieGJsa0VNNDJvTVM5aUsxOHZjajFzbHc5K29DT0dZWmk5?=
 =?utf-8?B?aU9Zc01oMlZvR3dHYjYzR0NjamIvbDdkT1JVSWV3SUtYVjgzQzYvQmtESG5U?=
 =?utf-8?B?K0dqZkdCdzRzeVpnYXRPYTg0V1J3b21yNlVHZWFOYzVCMHFLeTJYYmFhbVNQ?=
 =?utf-8?B?RWI1aGV6VEFGemwzaUJ4R2w1dy9kRkxtT1BpNCs5NVgrdEduN1VpQ0JnWE93?=
 =?utf-8?B?TzB2cHdURmh2T2hKVFpGOUNiOG9CWElXU0w5NkljYlk5RC9xd0hVWTloYStI?=
 =?utf-8?B?R3d6RzlKZ2pXdTgrRm9kNDVrV3RtQWhyZk50MS9RbzgxVDhja0c5Sk5EQ3Ir?=
 =?utf-8?B?QXJsVkw3cW9qMVdwMm5JenpOdkZJYnBWYm9zSkhFTm9TM092UlB0TVoxQnZh?=
 =?utf-8?B?dWszNUdZNEpoeXhXakEzVGp2WVB4aGlyc1BiL3o5dWVXeDVkcUlubzdBVmsx?=
 =?utf-8?B?V1I3VVZOdncxR1lGblFlaml4bVJlNFJRS0wvUkZISTFRdkZLbzBDNFlhRWpk?=
 =?utf-8?B?K1lER3daSFV5QWs4NVRENCs3MGRTcDNTUVdTK21KMGlaTnhKaUZOYTZJYmts?=
 =?utf-8?B?KzhSdXlOTlRsS0lSUTFVbkk1eVF6L0gwR0hmUUpNanBsVjJ1VHVVZ0ZaeTdG?=
 =?utf-8?B?Z1M0Um1yQUpaSGFZNGhrdUxOTkZKSCtrd05FcHZzN3o1Wjl0WVBlelFBVEhL?=
 =?utf-8?B?aGhKNUdjWXVlZWgybk1hMnJXdW9hdmVzWG40WjB4Y2ZEb2c4UHBtbXVQMFgz?=
 =?utf-8?B?YXpMS0dHdGdHbnAyb1lNRU5MSklEeEFEOTAwcXplc21jRXQ5bE93eEd1UWZz?=
 =?utf-8?B?RWtEYTJybUZGS2tQOFMyeGljQkZkbEU4cDlrbU1TblI1SG5hMXhKYkVnRHZt?=
 =?utf-8?B?b2g1eFVOUW5IVHRFK3JUQ3dRaXpwN3hieE9WK0hwcnJMN01ETGdRckxOenBN?=
 =?utf-8?B?OFNEVkRndzZJZXlMWmx4UHFLOG1EVzFqelB5R2Y5VnNraE80K1JJanNUcmkx?=
 =?utf-8?Q?EWmQmCqQHO8zK0lrI6DtQGn4jRV9M6dYksKWd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53352083-fc69-47f3-543d-08dee60f5e52
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:31:21.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewmAO6TjVNqzjZj+Gwq2qbd3IJhXeFWFZlvshtGLiDaQWeLgveB6AOTIFuYKQRvanBr85kXTMDT5N/VFPHyHNcy5uQhBTGOYiwdTc42kHaO1YKQX82Wud11D+lxlyUIo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10534

Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
BGRX32, RGBX32, ARGB2101010) and extend existing ABGR32 format with
full memory-to-memory capabilities to meet Android requirements.

All formats support capture, M2M input, and M2M output operations,
enabling complete format conversion pipelines.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 59 +++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 05b51b98344b..ef638af350fe 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -160,12 +160,69 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
 		.fourcc		= V4L2_PIX_FMT_ABGR32,
-		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
 		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
 	},
 	/*
 	 * RAW formats

-- 
2.34.1

