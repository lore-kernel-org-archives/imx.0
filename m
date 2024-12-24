Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9A1B3954
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735043664; cv=fail; b=TQcvzOoBDhHUlSh74o/LKpaf0c8n1pbgwGAd9f8SiAhAXwu0PglDm7QC6M1xCOlTYZMyMXOVy5pT1O6KULIba8xMJ3OJKtyr8APc/eZLDYh5cUUSiXmUON//sIrDCX+Hgn8X1CrkQmJu3UA0gBb+SuMApvB/dNDIDdvjp/QD9NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735043664; c=relaxed/simple;
	bh=t4CMV8V0zeWyleNW1QaeQjghNuISZ/mWMkO3pJhXNdo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dI9FUoPAAoDC9RXm7ID+gdt6Y//v/o71wvui6tdv6JVf40l28I+/8YY9U6rR154J9HPkh8pEGpd2bUEPWkz5BolsL8+D9AH+Gc4ZjsIBXh0s6hHK1Fi15zlvK1vYl+c4s/+SA+xePczbbNSOmS/5qmoXec5RRGfglZLjSxIHa1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rck2sg6T; arc=fail smtp.client-ip=40.107.21.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rck2sg6T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suwiICloGkEpsCqTpXzhunjVSFNwZUOI4jen9L3QTjIO23wpzeFrgqFa2wL+nnUZAQWUBXY0UBtjVJ2zsMe/09C/O1AKmfc580aU4VYJb7EjA2hVPBmXBweVk9+8PBloPrPK7N9aN+aSOSw4PIdMMi79tkq/Hk2MNL04m16kvMOSRmLXWUOT6aeNc049a+de1vGZzeU+NTTmNg6ZPG9y2P9PLQoGQ3bkND5ex3wayiu5U61UXucgNSJJCvOhXUcqUH+cvvXvQBeOiH6IOivXVzQ8n+EUshFC/A4Tnu8fP8vg75kMJwjgApHm/1fTGoyZqXVv1LldpztzZsXTU/hG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDPUnJowUCSpg2Xpnq/sEOCmNgPXw4XcqphvDZOmM3U=;
 b=WePVAFIQAFIJFzD5dHmKTKGOZEp9bLKSgteJ8kGKi+0fEuOeLIriGh30GZ+rcf5NXY/xbx/DCsEm6ACbnvlyMIZTl++khZLtkkgHxDMd2gs5owCOC++HnFlP8vfiqCTLCrU6Rb+t3WTDidJEFU+3qthGVzIS/T4bWQeb1DSmuZ3b8EN2sZrgeHO/7A8Co5qxfAjKRygirt+Fogk0JG2R5wMCVA9sRAa43Ay/hFQy1EUz77zozTkq8m19O8ajYTyvwEOh+mscW+qB99m91GeIbjjNCowt1HrFBL3vLNVD9/51vgDVEJKHWPmObfFOEGWB/Aq5HtKf3auqunCU6C0kFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDPUnJowUCSpg2Xpnq/sEOCmNgPXw4XcqphvDZOmM3U=;
 b=Rck2sg6TB2W952BJGhU1ePwCuqX3qJ8TbeDCNX+uQqehqObebldcq4ctRzna1GXkWTck3oyOjJGA3V2tZxylejZ0YBOty8/0/XkiHvCIreHKR4yJLcoEThLPn7gPYgGkLN+pKTx7v11N9qQ1AKa+Wtm/gM0JzXu6OJ9EyCypjAUTmd5naogH1cNBEuiMb2CJhsJBd/9SwrGFbxDrc2nGSXtFIitVGRo0F+4Bbq3b2LWAcBIFOWEtqZ+wRIRo1jWTZDSO62Qel/NihnLhzoztcKNWfagLCqhEupyaWDHa3UZKVgFZIB1BjmM+lL1Bk3hwTdq9GA65uo+ypj/4Ff29ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 12:34:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 12:34:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Dec 2024 20:33:37 +0800
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx93-14x14-evk: enable
 fsl,ext-reset-output for wdog3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-imx93-wdog-v2-2-622709cb63f6@nxp.com>
References: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
In-Reply-To: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735043627; l=1004;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=t8LVibV8PuOoL7ThUKIzQxhYms+aEq3TQSGAp2WKuqI=;
 b=2h+/5VOmyOYbqP07BUwJA+qvlSCU2jP60HEmrXaDq7sjVY3rFkLuzl/8JWvm8wlJZzBa+7QNU
 5jEoezOEDm/CxLNQoYdMotjxafQ/8lRVhk5UIERrMnrZDN7u8U71HJP
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: JH0PR01CA0093.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae2238c-a110-4090-d8a4-08dd241747b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWlxb1ozNlJZTXM4RFdmUStFZGNKaHJhOU5LeHdTRTFwYWdLZndRUGdzYWpR?=
 =?utf-8?B?clZ1aUw4ZW1RQUJQbk5zVkkyMkcxTjViWGkzUG5VZis2SmdEcDE4WkFyNlBS?=
 =?utf-8?B?MkdqWDV1WS9BZW5ZU1pkN3NCbzNNQ09acHRGWjZ5MDVZK0FRWVZ4Mk83UzJO?=
 =?utf-8?B?S1N6d1ZqTlp0L1FzNlZsb3FCOEJ5NXNiSFZuUndsL1BhVFJEejdpa0drRFRU?=
 =?utf-8?B?S3VaWXVlZnh2NVR3OW55RWZGZW9uQmJpcUNOQnN0NUFlYzVITUw2U0RuMzVN?=
 =?utf-8?B?UnErTk5SL2lUd2tYWTRaMlBObDg1dHZkRWdsY0tpcHhLdFdUZzNlbnZYYzN6?=
 =?utf-8?B?VjFxRDB4YlRMbEVNQ1Y2Y3IvUjFFNFNnZFdSTHMyWXRMaXcrM2JNNW9abW1s?=
 =?utf-8?B?aG9iOE1wRFhhZlN2RnROYXhGRldWTWNRUGxoWmI1SCs3b09jWXdEbmd4WVlp?=
 =?utf-8?B?ZFhSakNvQ3JySDVaN1dYUlVxYmVldFNmaERPbmN6dlZpZnhBdlRka1hnTDNp?=
 =?utf-8?B?Sm5rUUdNQzhkeWpJZ3pSaUxYYnZjRStmYy9sODBvYjdNODY5N1hmWG5FaG10?=
 =?utf-8?B?TlRRYVNXaVk0TTdLTFZqeGRZQXNKcmZKbnFtRWJFalY1ODY1azdpWUQvdmlj?=
 =?utf-8?B?MkJYUER2VDU0d0R2MVBPUTI3VnBtei9RSDdJVkFCNjF1RVJ6ZWp3N3M3QVU0?=
 =?utf-8?B?L1N2QSt4cHVGWnhySzhiWnpYMHYrRDFiSmZkT0FmU3YrVEtIdDFBb3RCUk9o?=
 =?utf-8?B?TTNGdzhvVWRkTURjNi9ybjBSUy9FYzRscHoyaUhPRWtzRG43aXhodm5teTlW?=
 =?utf-8?B?aThzbGQ5UGdtQS8rNUx0eXpEVGRCWXJtOTE5aHk3SDRmNlpkQmFMM3BraUNW?=
 =?utf-8?B?dmZnRUZTeXRLWnJFSm4zNHNhSkRPbDYxTlNERlF0M1h3Y2tNME1LSm1pOUcw?=
 =?utf-8?B?KzgwZlpTWUdpRXUzaHhJZ2NPUFZvNkQ5eW80N3ZFbUpBd1dFVFZ3aVBaRlg4?=
 =?utf-8?B?WjAyeXNUeU12dDFIaGVDVU1PZEtqeW8vQitHdzQxOW15dUpCb3o5T1NTQyt3?=
 =?utf-8?B?RDVuQWg1NTNCNjFqTEtLcnBwK0JHM1QzMktRSVNMb0Zwb3FGNWE5MURvSjh3?=
 =?utf-8?B?Rmd0dDZDR0x0aWU3emxYS0lHRHlEcDVPSnhFLzdpcDR6VmZFV0xkOUFwb2Zt?=
 =?utf-8?B?SkxQdUo2bWpjV2htUEFPeXVlRjMyWUN3Kzd6cW96NUV6SEVFeFlGazJRRm1j?=
 =?utf-8?B?MEVZT3cxT3l1UUd2eVk5WnZGVlB6MEFXYkRBeVgvbHRVZmN3Y2tGWkZDTUlK?=
 =?utf-8?B?eE9FaXI0NGptM3VHTGZ5Rnh3dGYyVGY3aDM1NjVpK3NJbkJ4ZU1FdkZtdzJI?=
 =?utf-8?B?dWFiZDgzMGQ1aFhITjlISTFMeHVoeVkzeFpRWTBRZFRiMnROaStWUUlzb0VI?=
 =?utf-8?B?MUZFVjJ2dUpqRjBHa0VoSWNaZjNJSjVPcG5EMzRLSXFqQVd2VUtwWlo3ZkIv?=
 =?utf-8?B?S2NOSHVUNE9QRy9TUnJNNVE5OENRV3VUR0xlWldRODJFeVRkMVJkelJMV0ZZ?=
 =?utf-8?B?dHAxUnMvVUhtYkN6N01LSjFBSHBhNHVYMUNsZUhyYkp6dDVoU1pvdXg4NDlk?=
 =?utf-8?B?KzYwODBuMWtORGRndlVHbXhCeUpCZTNXS1ZCTGpMOFFKcnJyOE13QkEwdjdu?=
 =?utf-8?B?UVJ0ZmhzQzU3SGV4WU1lNW9kUzdHdzRpNDV6OUlKZXRYVUZxeWtYTWJObGN0?=
 =?utf-8?B?cVc4WmhwclEyZVdnWXdtOEJEOFVNTjR2WVlNS1ZWeDBpMFVnb2ZsWEFuc3Jw?=
 =?utf-8?B?YUg1RXlpTkJSckVMZHdtNWRmRHVHVnpCTWtCL2VncWY3TlJEbEMydzQ3ZFhV?=
 =?utf-8?B?d0Q4Y1NZWHQ4TmliZWE1bU96VGUrV0l0N1FSUjJwTUQvZVVFcEN3THpjU0VY?=
 =?utf-8?Q?QFfBBz7RNfxGvPWGBg1P0L2YhpdelgYJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJ1ai9HL2pGd1BJY2VBS1pKOHJFdTlPZDExRHRub3lZMXVxdW5ZVWxCUDAy?=
 =?utf-8?B?eGl2Uk9zN1JDVmYxb09tQU8yMlhFclVITlFQT1ZrWGNmMjJMdkxpYkxXNXF0?=
 =?utf-8?B?M3M1NGRSeTdVQ1hONER2dXZ6NWxQQVhMN0Y2NXBPdWRjQWRkdXgrRzcyZEZx?=
 =?utf-8?B?a21UU1BYT0hnT3MxcFc4VWpjWUEvd0ZDU3I2dkhLWm5rY2VDWVJ0MU9BOUgw?=
 =?utf-8?B?S3VKMmxBS0dnVWg3VUI3eURFSHlRSjU2dk1DSmhYSWdxS1FKZjBPaEVyMC91?=
 =?utf-8?B?b014RStqYUJzSVdWSWZkU0FXdFl5L1dBTTVWQkxDUHFqanhJMmdnRFFQWUlV?=
 =?utf-8?B?bG5BbnZwU1g2Tk5wUGp0cUJraWdUZXhTQ0xmMWp2Q3NZZnNjUU9ESEwydUNi?=
 =?utf-8?B?YzJjYVU5STM1YVg3ZXNRZDZ6T3Vlb1Y5c29nRlZSdXJSdXF5eGltbSs5OXNp?=
 =?utf-8?B?RE5XTkpGUU5lWFJ3YlJyd1RyREZDVStkUnNLVG1iYWtCYWpPdHozc2hHWXZM?=
 =?utf-8?B?NUk1SVZRenlFWDdWZDhlUmpFaHZ4QUJjQXVzYTZqWWVXUDlPN2tPV0lLM0NL?=
 =?utf-8?B?c3oyeGxDTzAxNVVwZExGb3hmaUhtTnJnakxvU2g3UENqTURaemlOc2t5dFNo?=
 =?utf-8?B?TFp1emkwN1ZRZlFSSktUaGtqendYcGNvYWZOcEZkd2NHU3J5c0VycVhuNGhU?=
 =?utf-8?B?ZExkOVlYTWNhQ0RvUklhZGpiUmMwSzN6TldPYzduT3VMY1dUQkdmQ0tkUnZJ?=
 =?utf-8?B?aE8reUY1V1JvQmM5N0FXai9iTVMzZHE4Q2NDV2Y3aFdWWlZhWXBBVGdwRnJW?=
 =?utf-8?B?NUZrRjEzaU1UaGE4UlAwK0gwOGpMQlJyR0tObDZZU2ROeWUzYnVxcmhXTEJq?=
 =?utf-8?B?dllWWW9NOFRveGgwMzkzeDA0cVdlSGxobXJTbXpNdThHWFJPMkxwYlFaSlF2?=
 =?utf-8?B?S1FtN0ZDanJZM3dyRWhrZ1FLc3RTclJyci82K0hEK3FJMlpydTgvc2wzYWtS?=
 =?utf-8?B?SUZ0cnUvdklKQ1F5QVRIbTVwM3VuYVpKS3hQK0I2cUVLTVFUWmd0djlnSU94?=
 =?utf-8?B?ZTkwUkVWZmthU3V2WUE5eEkxMVVvendxdlN4WE1obGt0RnlmamxjVUxEM0dP?=
 =?utf-8?B?dzRGdVkvNGtuMjVFV2VBZHBPUnZxcUF3Yi9Wa2VxSVdjKzZQcGZOMjBVWmdE?=
 =?utf-8?B?Ym4xUEFFMzRDelF2K2lxdmthTy84WlBiSE5NSUVGWDFvcEVyRmlRQkVjN2o2?=
 =?utf-8?B?VFg1Z2lyQ0xSb0ZVbWZ4TWNJMWhYdkNra1ViZVR4dkFMWnFaZnlYWkxSdllk?=
 =?utf-8?B?OExoZjVTckZpV0tYRWhoN2N1RE1vaTFnQmlaTWJWa24vaDhYQ3QyUis4Tzda?=
 =?utf-8?B?Tlg2QlU2N0drTk4rMHRkenJjejBIQlN5SGwzcDNqNGd6SlkwOEZJdjE3TkN1?=
 =?utf-8?B?MDJLMWEydlJNUWJzWG9ST0FyR0o4UzhXQllBMERmRkZ3Yi9GL3RWRXRZTjN6?=
 =?utf-8?B?S24vMzJwZWJ1LzlJVFhjdThzbnpORUVyQ29vTS9adVNBZzhUanVKVkRZUWg3?=
 =?utf-8?B?S203c0ZSbkdkUWsxbmVIU1c2MDJ2VmlzQ05JNzdYTXpiK0l1aUhBdGNMUHc5?=
 =?utf-8?B?TDM5ZU43bzNrVlczS1FDRm5lN2UySmg5NzN5cDk5TWhGUFpDdUdhL1hlaDJx?=
 =?utf-8?B?aFRUbndBeU4yOU5HVVJYOUJqR0hKZUpUZWhyU1FxeURFeEZSMWZiK2dGUTFo?=
 =?utf-8?B?endNdmNjOEtLSTFrNlIvbmdDMU42blBlUTlvUUVLYlI1Y2pHZEZVb2lVMTRY?=
 =?utf-8?B?SkthRjJKVnpmbCtBZ2lGbHBiL3FOUmQzVFRTUmpBaGVDUXZHRGFUNjRwSFFW?=
 =?utf-8?B?Z1FxUVMxNGp1Q2g1bWJCZHlXK3pJUWR0UkpWcHlQYkcrWnA4Z016bHp1N2Zh?=
 =?utf-8?B?WTVvWUZqVUNSaTBzTXVPelh6dWNNYzdmdUZESkN4VVV1L2ZyeklQWkFuWS91?=
 =?utf-8?B?T3J2KzFvMVdmK1ZjYTRLSjZkemw1YWdUN2JyMmNhaGE5NXU0TThCTFpKanZh?=
 =?utf-8?B?NXJrRDhaVjFkVjhDc2tjbWpjdk1oR3lTYlFBWWRScnI5OUxPR1E4aVdWZzBU?=
 =?utf-8?Q?s9rexMVDeaYEaYbLjersh1sZQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae2238c-a110-4090-d8a4-08dd241747b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 12:34:16.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CPJ44RRRai6LynDri6dCVxxcO2fH54MB4qV0YWs2vZTdzV3WRNf6xUXzqGLcoGIeN61tw97Vj3zZYBSxGuugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

From: Peng Fan <peng.fan@nxp.com>

The WDOG_B is connected to external PMIC, so set "fsl,ext-reset-output"
to enable triggering PMIC reset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index 236a44c1782ae1dd39a104f7145c681e291c0e8b..800d398e7820f876890a492da70fd5370ee5f525 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -284,6 +284,9 @@ &usdhc2 {
 };
 
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
@@ -465,4 +468,10 @@ MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
 			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };

-- 
2.37.1

