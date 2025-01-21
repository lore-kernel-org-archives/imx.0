Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7161F37D2
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471986; cv=fail; b=XnPVy9+W4vBW+mnVgrlGtISTIWUg6ZUWofI/mTEY/SNAOfQKXaTPl04jdwXMtLX86DNVZXxdLDttm5JgooGtIIWPyEnuUnDm0RZeO9Vh0Yva1QY8N2uGiFkBPH4fOdD2YmL1gmGdafMN6v5VzYaAnQRDLNATAUP+r7KzKsroFXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471986; c=relaxed/simple;
	bh=ILRsm1TCToQDqVHiNju6x7gHUMy0pIE0RDFmJ/s/Nso=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AvO6F96nGd6Zq0b8P6BuSIc65+W8Uar5pr+j6xCOjwnGbL6EN7dTjNdr5/z9wy9jIv9BAWzhFheBO5Tp2VtMa75oSXF61i6qLwooM/HdjHjNm80eI0ZmBKku189I1RdYNHttxwKku9gd45tmFLNWbwGtw/nSEHbxDF+62eXMm+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vk/qxk+y; arc=fail smtp.client-ip=40.107.105.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vk/qxk+y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDpZuGZBbFK3OTnYZ+ooK/dHeIGRXJ/9Kd8AVErXX/rkkR5nDACOcuYfSANOoovsD2YtcSF1WHUJwDrYkvcAct1j1vfVBIOKjU0R2YFV4evCrNNXHB1K3S444Z4yMzpmj5quSP+OggWpZqqZzCjbml+4eCqiKowxfw19YBTA4foTWQu5ZJi3FpNQbTjjiSw+ymYWh1SZFt2JpH8j2PeDJ3KaECSaQ0yCjnFi/vT+4sjgfjOIlj7UEJcf4anuCbSa/zpxbxzosGGPx1V61oeH9NUZlxq/TWsxFV0kLWYjisy9aWwWCDvP+vdG5vEQnjdJq3GaObux1hOFBSyvw+56ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBHULHP/CvhrPKTc1FyVZQPlVgRDiwLh83NJLrWxGGI=;
 b=wXoumn6j5exLC0RKAd6vjx71853KIn1zsJFW72Qn3gdtB+yHvmwqcI3AkX6KGpKmR9lT4rEFAp54a1l4yKtlhHVlyHkvPOqBd/V2MxGMLuDARWO7D0Diw/nA0oYJjGG28U8nQg6SVP1VEP6/euo+zFhhKgajfhNuwy/WHvmAcHqRhVsY/oiwcIYBTieaSAkwJU7LrPEiHaPECOkjVqvz8p9qCqKUWqNc4qssuLNVIehv9av3G7PC68Myw2kVqqoO9BVxjkYMMCvCs+O9SP1T/cX56gAjM0BFSx3L050JWWVBPTJaimudc8GmHEQNpnrgeMJdgSQNUy/rqB8X5hlKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBHULHP/CvhrPKTc1FyVZQPlVgRDiwLh83NJLrWxGGI=;
 b=Vk/qxk+yfEBbk3bzCS8ZsW6as5UrGEvEU2SFkZ8DyAOhZLw6nXchEb/3hcTA8gwb9gKb9rlahxFG6ypsQOFnZKWhAVYPWFRKrukpLrI9HK4VT8w5+wcMANdu6sU+krlBpt4tKOhLDySSbgxDAIrPkzF669RdvIy+/Pi0GeIq1L01w+RCJu0S1Me9wgMvpR8KkJai9NIBffC134G4qf9V7AlomRGiQWQ/FE21yQIb80Oj6+M298zX4DPzUvBH2Ev4b6FjAV+jfDxwKWKKPXTv2ID0L8VAUC04cIRB33X6JoU1rWd33m6sb/uM5Ucf9Zv7hMTXmI/AxcliqwpMrTlVmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:06:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:06:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Tue, 21 Jan 2025 23:05:30 +0800
Message-Id: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALq3j2cC/23OTW7DIBCG4atErEs1M/wYsuo9qi6ADA2LGMuOL
 FeR714SqSqpuvxGPK+4iYXnwos4Hm5i5rUspY5t2JeDSOcwfrIsp7YFAWkkJFkum6ypXieZImc
 FGjVkI9r7aeZctkfr/aPtc1mudf56pFe8X/+rrChBoncxQsjOBngbt+k11Yu4N1bq3dA7ak7lE
 GyKOWuMz071zvdONReJ1IDgHQz47HTnSPVON5cN6ISawOo//zQ/zgCC651pLtiTB0bHkf2v2/f
 9GzbKUY2AAQAA
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737471947; l=3242;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ILRsm1TCToQDqVHiNju6x7gHUMy0pIE0RDFmJ/s/Nso=;
 b=txvw6WTPyxwGjvRXAh5OYQw6U8GAF3C0qjJbj2KRXe0FeC/xCUgnL8/tEJon9c8dlyXsXLC1H
 Zmj0ha8lRw2AlopfPZyrZjC0NpqUoFitoncTJHaiXQdfkj9oCquNm3X
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 266e5ead-88c7-4ba0-415e-08dd3a2d2992
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnNMSytGalh0eEJ1ejY0KzFnaGg2ODlCZE1WbzBXR1FGNzdFdlNEeUFWaXdW?=
 =?utf-8?B?RUVET0NRcHN6M0NRb0ViYTFGZEdIR0xVa08xK2lXMkF5V3F1ZCtrTVpKTnhp?=
 =?utf-8?B?Q1Y5bGlnZDMrUjR5SXVRSE55emEyRHRlWlcvL3VCZExzYkhQRk5KdnBPNlpH?=
 =?utf-8?B?UjBUZnlZcGRtYjI4QytJa0psVXBhQitOZ2EvcnVvWXhPK1pkbXJ6NkNuaU1V?=
 =?utf-8?B?QnBqYklCUkNDRllEM295WnVCNDF2MlhFNVlqWGZURDU3M1NPekYvU0xWR2lm?=
 =?utf-8?B?Q2NOWUYwN00yaTk1dkk1YWo4emZtOFQzUnJqMDVnbGRCOHhRWG5FQmxhRUNN?=
 =?utf-8?B?RXhyQWNFaUpWMkVRREwyZTVCMC9zaGNFM2lGeFg1TGJBM1NZZU02Wm4wU1ZJ?=
 =?utf-8?B?WWxOcmxNN3ZLUXBEckprWFd2aUU0MVhoNlhWQ0I3VnFqd01SbUlHREVzTExN?=
 =?utf-8?B?czdoQWdrZk1GellZWk0xYmlBK0xhSlJxSHBBcFlLT2xjYXBEUU1ZK1Y4K1U3?=
 =?utf-8?B?RFdHSEFrK3l0MTdJQzhpdCt3bDVmN1p2cnBSSmFqYWpDcTBSRUNmQmJyU3F6?=
 =?utf-8?B?YkxRVEZqdk5nSkQzU3prS21QVEl2K2dsb0hHQXlOU281Y29GQUQ5K21mbzZD?=
 =?utf-8?B?NmJ6NnRaendUSTQ5OUtIWWM1ekpuNGx1NUFxSStWZmJKRnVTKzI2R2ZndGxq?=
 =?utf-8?B?R3JKYkZROW1tbjhLaDZhZDdZRkswN2JNbVVKenZJeHZjRVpTL2crcVYvSGN2?=
 =?utf-8?B?eHJ4WU8yVy9pbWEwSW4vV0RoVUZSVzkwMU9Za0V5RzZ4Q2dVR1EvNGdLVnl0?=
 =?utf-8?B?K1U1cW1ZaWJQTXBiNGVYOXJUQVY1MjIrYkh2LzFVc1A5bHRTT0NndGwzTzRz?=
 =?utf-8?B?TjFHVjZnT21wbjRYMm9JWWduUWdpREZ4UytTSERqZGhDd1p1QXhPMWJKUmdD?=
 =?utf-8?B?WXRPMG53NksxTkg2MG9kaE5PcHpTR0IybEs2aTViUFdiRXAxUUs4L1liMVF6?=
 =?utf-8?B?Wnd0WGhMb2FPNjJpcHZ3M1ZjcFR3eVhGZnlrZ29OOXlacDQvcXZpeExxcUVw?=
 =?utf-8?B?T3hDWmdtRTRiL0RFSHZaUElDWVdrVUIyWVQyME5EaitzN2VybW94TVRZUVNS?=
 =?utf-8?B?Z1hTcDNPSkYxRlVWVXRXcTBvS3Z6UjZ2WnRzSmJMYjRzdWswVFlLRWFsenZP?=
 =?utf-8?B?YUlqQVZDZUlKLzVYNVhaOG8wWFVYSm9NRU13S0JCTVdLa2l4MWJpQ3pMb0hR?=
 =?utf-8?B?aFlMemh0eTlNUklwVHE4QW5ZM2N6NFBPM0M1ZllwZjFkS0o0SEl5M1BwRnQ5?=
 =?utf-8?B?V3NDMnNQVGxHcnVoK2tZZXBVTXpBaUJuRDY4aVhlN0gxazFJQk9CSnU1VUto?=
 =?utf-8?B?SW95OC8rQU95aVB5YjUydFN6aXRCSkZtcVRQK1lWNElUL3dxVU5tL2thcFpa?=
 =?utf-8?B?bzJDdFJXRXhjK2F3ZmlpcTZLME9DOXJFOEpoYlRQMFdLbVhEc0dpek5HN3J4?=
 =?utf-8?B?d2J3N0wzTDB4VmFxZWplWTNlZ0Z3SUE1eHk0ZHNKZFBPeGNlNEd6eTZoZEFk?=
 =?utf-8?B?MXBhN0crK055NzAveTcva2F1TEF3RUhNZUxLUnA0UnpxaithbjF3bVRydkoz?=
 =?utf-8?B?YWYyTFdNazZybU40RTEyOEhPZEoxT3BEbUlQQ1E0UWJiVStkL1RjaCsvQytL?=
 =?utf-8?B?SS84bStxU0NHbDJ2cUEzYkdJNUR6SlBxYkFMRk9UY0dTNFF4ZUxNVDh5aU1R?=
 =?utf-8?B?VUt2NjVGMXFuN012S2swcHBPcCttSFVrazg4dUp1ajcrbTk4QXVyK3RXZmEw?=
 =?utf-8?B?TEwwaUVxL2NlTkEzZWpWTTdXcjAxT0dpY3ZQTkoxMXpVVmxocUtnVGdNRGli?=
 =?utf-8?B?Z1ltSHVrSm5wb1RQaTdveDR3R2M3K3V0UGRJcWp0K3RXR2pNL2o4MmMvRnBG?=
 =?utf-8?B?aVZPeVlUVVI4bDBORGNUWjRjbEloVXpSVHp0clZkRlA4clZSWm8wTUx0TldV?=
 =?utf-8?B?ZzRQcFRBNnJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUlTZkdRSEsybUFOZWY5VjVKK1BKcU82dWlyWjdLNlFUWlRWRmtTdnRDeHN5?=
 =?utf-8?B?WjM4WWVTNytTT0N3WnZpNmdPN3ZFek16T2c0Ym5LaW0xM0ZDbEw3SENRSUYz?=
 =?utf-8?B?alpEOW5BS2xSTmJOazNQZnIyRlhBUTRJNjlPMmhYNitXNm9CaUwyOVpDVVpP?=
 =?utf-8?B?WlB0ekthb1lKYnVhSTlLa0piUzZQR0FZeWNOWFZWV1pFU2prQ25pbWxoK0xF?=
 =?utf-8?B?V3M5QkM3MVpuN0JkTnU0UE8rQzFVWFE3S3k1VVZwTC8yK1JrMlpEcFVhamgv?=
 =?utf-8?B?d2xsUDU3L2pZNTR2cU00bW5DbGpnZE5vdU1Jb2tGdjFWMXl3SDkxcXBKRFpJ?=
 =?utf-8?B?NFR4K2UyWGxMeFJVZGhqRnEzZmpvaWE1dU1XTU8xUUEzL1NBdlZ5aVhVMDZV?=
 =?utf-8?B?T1JvM0cwQ0tndEJ1YkxuRHZXYjg1T2x4VEJQTE1LSkU3aFZtc29TL01DZzEy?=
 =?utf-8?B?NlA1bFlwaHBuRjZEUHFxVmlrdlp2Rkc5TitQcFhoVkU3Ry94enplaUw0Qkxq?=
 =?utf-8?B?THNIUmF2T1VCeTBKUXltRUJxa1V6QXRNWk9KVnVSOGFDOUp3RmdSeU1WV2Zr?=
 =?utf-8?B?Y2piblhhQndZUUVqS0pubXZuUXlwUjNFbnl2ejRBbWRTZS95SVBzdzN3UHBw?=
 =?utf-8?B?WUxzZ04zZkw4OWFVQ2Z6ZUpuaFNaRWJSbEozUkJ2c3c2ZnNhRjkwY1hLN3FO?=
 =?utf-8?B?VUFPL3NZMWZNTStWK0RrMVR5b0JpMTI5MmpyT0o2anROMHRDbnJnZ0NEbWVr?=
 =?utf-8?B?T1M2R0ZlZVRERFh5NmhQcHFveStGSUdtOHpsK1lWZzFzOXF2dFF1dGI2d2gw?=
 =?utf-8?B?SVE2Vy9DU1E0NWpuREJCc1RyOXZPY3RGbStLOG90Yk1BK1VCSUNDb2gxcHc5?=
 =?utf-8?B?dXZxSUZsNHZ6V2JvZjJacVJSQitab09PVXU4eExXa2cxeVZVQ2V2MG00c1Rw?=
 =?utf-8?B?MnJUaWZma2tvUm14dWk5OW4yQU9lZ21SbWNWUU11OVduYW56a1J2UnU1TTBJ?=
 =?utf-8?B?bm5LOXEzSDY5UGx2Qmp0TXZCZFRLUnRCWlBnVFMyeWF1ZGZBZUp4QlExRVdy?=
 =?utf-8?B?a3hzMWpQV0ExdXpVM3VaaldGMmJtRzY1Wm41Zm9MR0o2bjBaNGVZMi85U1A2?=
 =?utf-8?B?K2F3dWxla2FpMTFqQ1BXRlpDdkhlTFpUYVlXT2RWR3BUMzR5UlBrdHFicTBO?=
 =?utf-8?B?c1Q3Sm4zcEVITjVGN29ZWkdVM01XM2h6VVhzNWVUd3BNY2FyeTF3eGxtM0JP?=
 =?utf-8?B?dmVWK25lVUNOVjFQVG9BOVlIT0l1d1N6ZDl3ZFhpbm1SMDhTWWlGMmNxVzAv?=
 =?utf-8?B?M0g2UEZpQ3B6TEdaK01VaW16eXNkNWdQUWNxdGk4YmZZL0svNXo4bEgrMkJS?=
 =?utf-8?B?SDIwanZEVldQNWFWRjNsR1pWelB1cVVDWjVRallMQnhMVjN0aWltb1NyR2Er?=
 =?utf-8?B?NHJNWHozL0FnU1l6OHJiWERmUWh5VUU0RHRZbFpxZnAzVEhLTFZFMWZvZ1Vl?=
 =?utf-8?B?TEo5T2g1T3RPblk1aDlrU2gvRnVMVmpES3V0QlRUci9hTTNVcGtUR1R5Wito?=
 =?utf-8?B?QTVhMUF4Rjg5akFkaHMrUnV5aTRhVlZLRExSTmc2YnRnZzRwd0hDM0ZoL2VE?=
 =?utf-8?B?VGsvWXltTDBxRnJpVUQwN1ZCWmpOU2h1RHVMQ0Qvb3MzV3RBcE9lODBzeTdM?=
 =?utf-8?B?M09lYUdhc3Q4dVJTOEdqVmdVZzRuaTJFT084VXZkbjg5YWh6Z1FEbTlJb3J0?=
 =?utf-8?B?dXJWNEt6c0gyb0NKb0xqOFBGNGFsZ1ZQUWg5bGprd3JLU3dDQm5rY083eHVX?=
 =?utf-8?B?QzBrQmNiclRNVTRucDZMM0ZMSzE2Z2tGUHN5aTBwNE1udjhNMHFGNVpxZjMw?=
 =?utf-8?B?a2NFSVA4REljN21jajNxaGZQNElWZ05iNm1BRFh1aENrcm4wTEd6T2xuMUF3?=
 =?utf-8?B?NlFEUk45UEFCeDU3NW4yQlJiYmVxZWFHZVBtOXUrN01ScUhFMVA5dG95SllD?=
 =?utf-8?B?WFZLc2xjbFd6T2NZWmVKRGJmVU5kQU9Lc3lpQU1mTmRaVTRtdU9nV3MxZit2?=
 =?utf-8?B?eW9TNHBJc0I3QXV6d0xwNmpVa3F2ZVllQnJSM1o0b1k3a2Q1c1ZkUFZWTGlo?=
 =?utf-8?Q?tcAFihVKShJIFf27+79HK7EFw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266e5ead-88c7-4ba0-415e-08dd3a2d2992
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:06:20.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoTsrmUZXB1iJV8+I0DwL+hrwwjDCKt+41BqV8MBqoNK43QC6CPr9d2rkBYl/stSr7s4w2RI9jqjHkoJzG7xUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v6:
- Rebased to next-2025-1-20
- Update Kconfig per Alexander
- Link to v5: https://lore.kernel.org/r/20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com

Changes in v5:
- Rebased to next-20250107, but seems Srinivas's for-fixes patches not
included, so I picked the for-fixes patches and rebase the patchset.
- make gates pointer and using ARRAY_SIZE
- Use of_parse_phandle_by_args
- Read fuse when needed, not cache them in the very beginning
- Use %pOF for node name
- Check controller node name in imx_ele_ocotp_grant_access
- Use dev_info when detach node
- Use priv as function parameter to replace pdev.
- Link to v4: https://lore.kernel.org/r/20241223-imx-ocotp-v4-0-f504c1420640@nxp.com

Changes in v4:
- Add missing of_node_put(provider)
- Typo fix in commit log
- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com

Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/Kconfig                              |   3 +
 drivers/nvmem/imx-ocotp-ele.c                      | 172 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 ++++++
 5 files changed, 246 insertions(+), 1 deletion(-)
---
base-commit: 8c50c358a94b6f6d7e6185966830b5bc3afa5524
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

