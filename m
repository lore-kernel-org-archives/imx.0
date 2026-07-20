Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEF42A79D
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556572; cv=fail; b=Wn8S/gsnVfbXDwFeEOOzMdbEdykhdEO8qLRs6jIfsnvlPQfk2HyZdofPngXk5drYt5wznyNsTfUF6KbBuul3o+0rYjrb4d7gZ3BEO8F5GKCG9pHB+Pcf/4YEHa4ih/rHNuLan8bq0NlguJzLVYX2zjh98OadU1iQy09qnNBgYno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556572; c=relaxed/simple;
	bh=d/oUTTOxzAND+ZeC8twBe3yTuqskyYa+TiczYaKqlOY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UREpoUtMVZP7QArnB39Qy1BUPsFl2rrJjx6fNajqC1x7W00MQZmVzbE+u2Rp24xj2HgQrzb9LFz6DAbe1VRc2ODbGSCFJloXbwFaO/qh2rwgNYOYE+S62eYRiwRiZpdwqFoDno0033QXy7OG//jiO2DkJ68BrrckH1mIDAWhgqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dq2a2vaU; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dq2a2vaU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/9jHZZeRIMESfNpfB5kO8po+8Hl/o1RawBPcGmEKMAUNBRZQawxYv4WVJ3vJ3+AlXB33rrw976fQGMFzWOsLbN540hrcLvbNcEq1Jaxmffi9J+T2jSJPesbJzMTGggrpGjGjjzsPLkwhPqXuXbpWZRm7maqHU6UdfGOcUMQL7Ya6KJEZes5h7Z1IvjCs7IuUk4ygvMrYRw2bDw63HnKlBb6stxgDq+jYHX49BYqTm98U6sFS5YfAZBHIMH8tO0YhgnQXFzVucCSz/Ng3rBDTfPvnyLldEqLyv8O2LtMMGgv0YGy3NJ+ZIVWOuZKcUO3dnRA13lzSdDXJAhtNUTJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUSDevOwxtBKOlvhu8qmT3riwdaDoU04toK6STnvqQo=;
 b=LnZlSwKuwT+zfbomKe7rJaFtPE/+N7mkxK//mHaI1PlccfImikrr/tN8Xsy3scMjEBloC+/+oza/BNpb6oa88IEg587VQOrEZXUH5HSjm8u65/nqREXK9G2lEufWMzV2Y7z5pFdqrga+p6QgvDatLddBynTPJb8yCniwq/S54mNmslO2MGjIu7SKPlwINkSPKDib4K2c52Nm08X0JC6v7dYqCJkFCm34ukQb16zJEc/6Ux4LV4KS5urMmMSOybSw4h6W0cPKf5u4dEIGN4xmuOsbpN+HPJrp4kkz3x1002MMU/l6u6lSKD+GobbOJ9a82lmRa4e4WchM/IYM3NaTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUSDevOwxtBKOlvhu8qmT3riwdaDoU04toK6STnvqQo=;
 b=dq2a2vaUkF27p3RzvCVimoaD/frXlkiJT66NmFmPrDhMSCQ2JDMj0lKulYombtv5KPdieIYAX8sX9dER4i/dmiq6yIGOYhh1X2wLsm+VSZzxqghnHy09k2UrYAxjP83UsErL0du8+y3SjStItXE9i2yFItczczRBIzZ2SMDgXiTkUjwM3QiZetU+zu2X8F5k7ZK9GLJw+vVylZQdT134095Oy+g2VMMqTARiHhmqj4JVWkz2PSN7cBgv0YjBgWqnFd/Rm3TDPTv1yTBrKUeTUmzi5FuWHdSMbdzVUpGNKnu7AR0Ai4UuH31VvBXh6qV2qe5oOtojHjzg9s2qDJE6YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMCPR04MB12647.eurprd04.prod.outlook.com (2603:10a6:20b:76d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:09:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:09:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:16 +0800
Subject: [PATCH v2 8/9] arm64: dts: imx8ulp-evk: Change the values of some
 PCRs of ENET
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-8-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Wei Fang <wei.fang@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMCPR04MB12647:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ae196d-fb93-4bc8-f8d8-08dee66882be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8mAAoWU3rmaeZOD2VwhqPmwz1aJRjfS5B0DiyQJXC5ODurUxeaIMJSgBcNz+HufyFsbgQuGP+8Iu1h+G70tlYs9saP+Zhoh3F6w+L4tTQR/EgnIdQa8DcfoK9kJ5DBNrBZqCVhKd9k2wW5xJTIO0Ex13V4QG88x4Way9QWNgS8O9huG3K+I4PD0CXr/AWqTTvqYaAeKpaU9fjc9svhXGhwhL4IjW0WnKfhYu+slGMFPn5SVX4BaDyF/vlRo3LMQHqUu93TVEEKMF9SFHyT9+phmfV7533H1NGK73p0ZbTA6s/TYsX5cHv7KkpDixGA/h+XvWCjpNZfEctySzHEVA3d5o3lv5JRY0rjO4ukvJKki7PlLJgp5K1rWm4onAquJDj66CTY2MYibrf7uwS+GGzQYDUPeGhVSKjm+OkOnZtNv5xn1ADPdba0wO9Csb2B4J/zrcBBFCW4h/IdjCQjgzaS/nG6s1mZzuVPjU0x10t057ToWqKGvH/lxM91UphQdAHwpztzGZr4svmOeIdGCAMZSn2H4Lz8zhb1+Qp/TwPEDTVeVGWBrTMKkx3+9d8SRNncjxZqlsE3jCpvC/UVQGjbj0r+phLjTH+LVmZTc1o6oOHW9AyBL61BUHPHKhOLS6sOViXpQ4BnYC59TAlgHvUCLjAivdg1PiLrzTCxiIPag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wkdic2pRd3duVzdieEdPL0U1NEtwZU5HeE1tbGk2ZjFLYUU1dDlRaEZKL0sz?=
 =?utf-8?B?U1JVZkhPTmJRK3k5U2hiMFEzM2QxQlRES0hFY2h4NXh3TFRtWmwrWWxscXN6?=
 =?utf-8?B?MFJXeUhuSkpzSnNEbUVGVXdxNmJRTlk2RU5sdllCUVpwaEZQZGNhNDFRZDgr?=
 =?utf-8?B?ZHNxTmFLL05YMFR3WFVtN2VDRFZGQUxGTXhYVk8wV3BjUklTREJYM3FIVW5w?=
 =?utf-8?B?YVVkZ21LY2NQd05COEF6VU52Q3duVjcvNnY4dWRxTmhlY3FXZ1BTai94TUtn?=
 =?utf-8?B?QmtoSExzbXdTTTRzaVp0aUZvZGVvbkVjUmhGcEFEelRESitHY0YxT0F0WVRS?=
 =?utf-8?B?WndLOHExNlQ5ZjBaeUkrelQxdVVjUnorT1cvRkpIK0ltZjN4SDFMWk82Wi9Y?=
 =?utf-8?B?dkFNTUtaeDg3dTFaU3BCWlhQZm1tY1pjYTJwMDA3UDQwVko1V1YvYTErWlpt?=
 =?utf-8?B?eDhPNFIvaUxRazh0em9Ib2lrcjlzQ1ZiMTRwYmVoQTh0NXRPU2NLYjlTUXF0?=
 =?utf-8?B?eGxaQTBRZ0VVODg5SlV6WEo2UFV4VTRjbjFaVlV0RDdPRzU2UUIwUHR5ZDlT?=
 =?utf-8?B?QU95WitHOC81RnpBWEhpbmxKT2gvUEVDa1QvaFZ3OVhua0dBL0VodzBSQS9m?=
 =?utf-8?B?amlybFIwNC82cVFVTjU1blVJQmxMTnRtOFRtdEFjUUo4UkdBVFAwZWlCVGRm?=
 =?utf-8?B?dkZ3YjBJTXZxZ0FaN283V1F0bzgrZXg0K2xueVRnNTVXV3ptWG9JVVNoaHZB?=
 =?utf-8?B?Q0hFc3JpV3UxK3dwT1VuNHhVZVZuUU5nYUpwUkR1SG9MMFhMeEptSXh5bXpT?=
 =?utf-8?B?dmtVYkN1VCtBSHVQZ1B6UGRjUlpMU09HNHc1UWR0b3EvcUxkc0RyUTQ5L2d4?=
 =?utf-8?B?USsweFVRKzByeFA1eFU2RjVWK1V2UWdzMWxXYWZ2YkZ3Z0Z2NlQ4Mm93cDYz?=
 =?utf-8?B?TjRURVdFM2VXM2NGSzhJd2pUbE5GMG1BcUJoUnJpaWVTcUZIOFJ1TFBNdG9m?=
 =?utf-8?B?YjRjaC9MR1YyTjhnVHNjU2VpeFhWcjl5NTNGcHdQRU9RcmR0OFYzT0JYUGVn?=
 =?utf-8?B?M21XdWgyT1NSbzR2SG5HWW5IL09QNUVtak9DeG96SG5HMkxtdGg3QUx3UkFR?=
 =?utf-8?B?WFNZWkd2eXViaXc3Wnp6ZnNta3kxeVM5K1ZuVHd6OG9DK0xsb3JQZGR6ck1M?=
 =?utf-8?B?TnB4VmNYend4cldveEVwT25jZysrTGJlQXZLellSa1o5SDBLYzhHcHIvOFlo?=
 =?utf-8?B?OVBDVksvWS82eExBV0dZbzd3WUF6bnUyZXd5N1RkUlQxMXpvbnltUzNIcElF?=
 =?utf-8?B?SXVxUisxR01kTVJtNzdJWGRDVHAxbmZMbVJYcWFBcUNWU0ZwVGozU1Z4UEc5?=
 =?utf-8?B?QWhBWUgyYzVHSlhlb0pvQTBWekczTG8rZ3pDNXcvM2Jnd0Y0bVlOMDk4Mkhi?=
 =?utf-8?B?RTVrRjhiZUZsVk1QdmdobmJQcEhQSzgybENYMkIzNFFSa2RVaEdOck1Fb1dL?=
 =?utf-8?B?SlBzbktJNmpUM1NqQ2U5SkF1aWhhOGk1WGk4UmkyYnl0Zk8yQUJIYWh3SmY5?=
 =?utf-8?B?eUs3T05Fd2FtUzlGTlN6Zk5salIwK0F3OWF1akxack5BRmlmSGRBWmpKcDZp?=
 =?utf-8?B?NHpNWXZsOWJkQVV4S2tjSkYwSTU5ejR3enhMWnNoc2RITEFmNEk3VXRwWkFa?=
 =?utf-8?B?V01oYjZqUXd0N1RaSUtFeHVwYm04eDJFWHpYMzFsVk5ETEVHTlNTMk4weVlO?=
 =?utf-8?B?S0RSM2l5WDBuREd0bS9QdlIyN0ovQ3pIMFFVRUliNXRkY2dVMHRrWFA1WGlk?=
 =?utf-8?B?VjMwSFRhQ3R3d0FqMzFTd3p6S3ZTREtBZ2t3cnVnSmtQdGJiQXBMa3RMQ1pX?=
 =?utf-8?B?dk5nZndUVHdZV2Njc08zK3prcVFSNkVEbmlhbFFZVjdOVUxqOFlNU25md1dD?=
 =?utf-8?B?eVNLd1UvWG4yZjBDdnhQMUFEeVNOeTdDNmM3bnlsTTQyYlVHVEJ1UklQeElK?=
 =?utf-8?B?SDVzdFFYdmxVUUNUb2hyejIzUjlrWmVXcFg0UHQreEF6UVYyTFpucTZER3RU?=
 =?utf-8?B?U0ZYeUMwSEpjL0dmV2V5NldHd3d3bFhHYVJ5WEtBbzYwQTV3VFBhWjNHaDd4?=
 =?utf-8?B?bU1oMzU5cS8vVnJZc3ZIVEV5NG1laEpXdXZqUVRlaVhDeCtZT3E3dER3WXFi?=
 =?utf-8?B?dDFnT2FoS3NmckdIcWZBZDBVZC8vem5qOGEvMVhUcjlGS0ZDWUNyWHl4M3J1?=
 =?utf-8?B?aDF5Z0hkTTA1VVhRMERjUWpCNk1QV0VlWHcwWFNHVlNOY2wzaWJSNE9PNjdV?=
 =?utf-8?B?eUpnaHFYKzVSYWh6Yy90bGkvNVpscHE3YWV3TmNEMnBGL3VoaVZaa1M0Mldh?=
 =?utf-8?Q?oivmRocaEv9+LGBt7JH6K4clEfQBbuXKY4aJZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ae196d-fb93-4bc8-f8d8-08dee66882be
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:09:28.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGjjf/U5fEQ/O357Z/wvIHFL7MBMKbgBa+FSFRVCKs14DSkA4X3V8fPch9U4NAdlqPh58fZ/V0W+1LF3fFE0++AH/8o4oawjMIT0fguPNRbG0dI3o8hLOyrrS/A4pa6e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12647

From: Wei Fang <wei.fang@nxp.com>

Change to use standard drive strength and slow slew rate on
PTE14-17, 22, 23, otherwise the overshoot of ENET is too high.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 9da54291c7534..22c1d542798d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -323,15 +323,15 @@ &mu {
 &iomuxc1 {
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
-			MX8ULP_PAD_PTE15__ENET0_MDC     0x43
-			MX8ULP_PAD_PTE14__ENET0_MDIO    0x43
-			MX8ULP_PAD_PTE17__ENET0_RXER    0x43
+			MX8ULP_PAD_PTE15__ENET0_MDC     0x7
+			MX8ULP_PAD_PTE14__ENET0_MDIO    0x7
+			MX8ULP_PAD_PTE17__ENET0_RXER    0x7
 			MX8ULP_PAD_PTE18__ENET0_CRS_DV  0x43
 			MX8ULP_PAD_PTF1__ENET0_RXD0     0x43
 			MX8ULP_PAD_PTE20__ENET0_RXD1    0x43
-			MX8ULP_PAD_PTE16__ENET0_TXEN    0x43
-			MX8ULP_PAD_PTE23__ENET0_TXD0    0x43
-			MX8ULP_PAD_PTE22__ENET0_TXD1    0x43
+			MX8ULP_PAD_PTE16__ENET0_TXEN    0x7
+			MX8ULP_PAD_PTE23__ENET0_TXD0    0x7
+			MX8ULP_PAD_PTE22__ENET0_TXD1    0x7
 			MX8ULP_PAD_PTE19__ENET0_REFCLK  0x43
 			MX8ULP_PAD_PTF10__ENET0_1588_CLKIN 0x43
 		>;

-- 
2.34.1

