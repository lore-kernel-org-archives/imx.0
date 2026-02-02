Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582130DED1
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061422; cv=fail; b=KJzlyoOXhmay64MnXPIavf3+6OCusT1Q2ZAD/wqGpShXH3MTPoIXRyqnQvHOf8m6DEYQ+LbxD/v6TBikKQeBusKCD03ZNeBV3Z9SPJ+8YxfEkNoBxegiWOD4Sooksa//FBd81F7YsSWlvmRUeIHswXZytWK4i0dMG/0hrfpjrOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061422; c=relaxed/simple;
	bh=J+jdQGG5lvdwea4vU2VCwIhYT1m46LigxrwiLa2r1tY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EKYdtXXeyCfZAO45K2xmIQYL9qblaxGtTGhXzSzQQuYKWBU513/yicr+zJICpf/hmNEhyYoMCDBydxR8rHkqNzVusvEazPO7vmMunlrwwJIiIn+c5f0xIdYe1ukWuVvWFvh8xmtIjBJ9TChrs4i6LeVGNumhLNGhLs7Yk7UBV10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jwyOAvuC; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jwyOAvuC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRYrum9TBO0TtHBVqE3Z/GEx68RJAFF7gsbbpnnYe5q6gKSzYuuZp7EEq/vi+RljBvF1uuQrh8NLFsAZuTNQDLrGu4AvoCtjy+rwX2TOQPjHjkZ5O1eP+nKRcD8P9GABWHvsSYdaUkPMQrMbcEzAPbE39juHXV6i3DIOq2RX348SH9BjIdGgRyUvc8TZ+o1G17CjUnbwCpxWhzYnqcvPSCKSvtwM5+u77wcS18hB26Ro/fe3Xs+0huPA/+aJymycEMl/fBb/3431UF05h6OLAjo5tfHTrwl72MPhm/EA6l8fbeRhmhru5CJ7dL+XwvrOHtZUd0alDgMrR6T3M68Ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGgLsvhcPe/wF9V+oz2CwWMHOdZKAoPPpl6buxOhxpI=;
 b=I89tHjUj36Vr/lWdTwnQubsyV29J6EKjFTuha0/SL+ngccF0IAkBHMjMTsiKCqhk7vAvY3LlHtHe56fke3aqU+iyDVrdL+jtvyyaa1FCpMYrdZL4cKhH7Sq9jTxOolwDbpySto4DOtNzW4RfE5moGftBNVewirgQJhKI5uH5cbS/wdd3fO0i/ynALLrONX4ixZHt5cLEk9UEgcO4mZDW+yr+WEs3z0qo33s7tT7xbOz+N1cxEvggD0JOl5nBXc6uzOSvgtQ0cxruhfhpJFVvh0rv04AOVdY4zrzk7S0/YcUeCG1jqQNSZca10xnB4eFHhPO5nolSH7DzySTG9J/b8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGgLsvhcPe/wF9V+oz2CwWMHOdZKAoPPpl6buxOhxpI=;
 b=jwyOAvuCnuvx3BmxdoMWYxdfKz+JbxqMB9+a94t1kwaAZqthGXQ+auz9aqGB8UAlFLKtJRgdxtCKMIAw04KX2pqbKdJoyMUN4TCln82bQZ+A+36uZuT542oJY2eN5VzKnOugmdqQVT6byepB8itC0rWUcWiRl76VmFYeAgj1vEdZH7irRBI0g9MaYhRD3wlQcAfLpw3oiX6PW85fxat7m1LrW2BhufKWQGBQEPUwTbOn3/P3ZYb4HKVTC748nI0o+z+ulF75+fr7T/+PDEjhjr7XcnQ7fVpa+e+yNiKmFYEDufXGs1TDiAWSWPknBCLiDlIlQFVat3AwAcnY64t8xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:20 -0500
Subject: [PATCH 03/10] ARM: dts: imx35: remove simple-bus 'usbphy'
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-3-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1341;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=J+jdQGG5lvdwea4vU2VCwIhYT1m46LigxrwiLa2r1tY=;
 b=6SxWF7/DdT7FGnppJYpt1AUlLEmIp54yO1rIORRRD+ucLvZ3MW3+Xj1JlkrFd7FJqchM3TH9/
 KiPGL6XHzlhDlw13l6tMTJfLNPQpxQfkNzgEQ6rs1HlaEPCOg15MQjL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: f8381e1e-5f58-4e77-3945-08de62935ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VllDbmpYSUIwc09JZERscStZUThkSTFrb0c1d280MW1RTlNTQVhRZFZMMUtR?=
 =?utf-8?B?UUFPQ1NvUm8zcUxlWXBtdHdrV0RBanVRMVVxOTE5L1VXWXV5OU5CMzRNMUtM?=
 =?utf-8?B?SFdDbmZwUGhqczJZcUE3UFFUc25hUTlQV2RQanNMb0xKdGYzaGdlUFZncU13?=
 =?utf-8?B?ZzlEaVlWM0MwRXFGdTYwcjdzQ05Ha1JSZFJ4VmkwdE5XM1Bwa0IzWEVlNzV6?=
 =?utf-8?B?YUVrVmhsbTZnTmdmZjBTOENNaklDQU1DS3k4Vmc3Z3RNZloyL05WeHorblRM?=
 =?utf-8?B?eEgzdjJnVFpVeFZubjdqSUUvbyt4YkkxR05aQUxZOUFkcmdjSFVSRXdzVXZT?=
 =?utf-8?B?OFVJdXp6eGJCbkdtQ1hkVGZNYXFiRFZQdm5XZVY2MmxDakFucEkvUE1hWUhN?=
 =?utf-8?B?VGNqT1BuMWxlcklBSWtVdDNGbXl4bFkrTm11dmZodERxc3pHcVJRSk1vczB3?=
 =?utf-8?B?Sld1clR4YnJ4L0tqNXB0SHBGZE53T2ZGcVVKMEVsTk94Y1lLcnhEbHFuU2E3?=
 =?utf-8?B?cjZBV2FJOE9meEtmcTVUeXozVXhtUGVidU92MFNMUm9KU3ppTGRPbDdKaXQ1?=
 =?utf-8?B?aFFCVEtuR1lmdHF1Y1Y2OU50eUNMenJpMnRRc254V0RNQjdCT0syR2RvK3dQ?=
 =?utf-8?B?cFlndnB5a0tNenFKRlZnaWg1Wm5hUkp0azc0aCtrT1hMQ1FucHZ6RXRhRFBX?=
 =?utf-8?B?U0pGcHhaVUo2WGZYTGI2VE1hVDRxMDJVN0NJL3RtZmZCcEJRWDdWSnY2ZkNU?=
 =?utf-8?B?dXJ2VVFRTjhDbThyNGtrQmZod1F2aUhVeGRvaEUxN1hoWDB0RWtrRDM1SUNp?=
 =?utf-8?B?V29YUWtQZHp5RmpoUVhtT2ZzZTc5RlZpaUdMdHJuOURCYkFscDJjOHU2Wmpk?=
 =?utf-8?B?dWw3QWlyTmZuUkxmNHlOdTJ6U3dPNkQ3TENHMHRXUXNhemRsa2VSa05LRlRw?=
 =?utf-8?B?QitFT3R4MDF6elpyY2dDM2tYaHJEMCtWdXdoTkQrejBwd3NxdDQyckt3dm1K?=
 =?utf-8?B?OEhOQVAxamFjeDRBczQwcHFRUGRGY1FBUWZQUitTQmNDeDR5N1ZPV0p6dkJC?=
 =?utf-8?B?aERCb3BtK0paQ3ZkdXlxL3h6ZWtlMkkvVWtwcm5lc2J1UTBvUjNKZitxQURC?=
 =?utf-8?B?WS84UXhkZGhCRi9TZzJHa2ZlbTZhVUI2VnZEZTIzdjFYeUxneHhSbTA0N3pF?=
 =?utf-8?B?RFZ6MWRGdVVLT2pnK1VjR0JvQ3BQZGg5R0dPTzNxZzJRVGlxU3cvZVpwOTNJ?=
 =?utf-8?B?ZzA5dWp3aFM4bEEzQ1BEZUV3QXFLaW44VWczSmpPRVJiTThvZDNCM3EyWkU1?=
 =?utf-8?B?TnJ2SDVpeXNHTFVBUTdUSGtvRDd4KzVGZ2xwZUZlTWZXemFDUDVBZnNPbDFO?=
 =?utf-8?B?YUs2d2RwOTJraEU4RllWUlNwUEtRL1hqU05HamQvN3ovWHgxcXpGTEU1Umh5?=
 =?utf-8?B?YnA4VlJxQk9wMEk4VWJJbXZDUmVSeGk0Q1VCMzZKQU5xMG9GTCtSd01WMUFr?=
 =?utf-8?B?alhjb0pIZkFsRm1iL0dMV2g3WjNsZEkxcEVFUDhKWkdGWjZjUmlzMEhnekhN?=
 =?utf-8?B?MGthMUNnZjI4YmJrdnljQjkvamc5eHdscDBLaHFLZWJIbVpPTXNQcGxRSzJt?=
 =?utf-8?B?Sy9yTXNmYkw0aGhjZWJOR3FSL1YrSVZkN2N4L3d2Z3gvMCtwTDFFZUFQdmNt?=
 =?utf-8?B?TEN4WjJoZHptZzYwK0wzanpTdmFEbkdBUzVWZ2hnRTBTeHhzamF2R3pGRE5r?=
 =?utf-8?B?M0I2MlVjZFYyVUxMcTlsNHFjMDh0R1pLRHZReTByRDUvYVBDTzJyL3R3TWxE?=
 =?utf-8?B?dTJneXlQV3B1OUtjYzc0VmJYOEh0WGQ1d1VUZjI5SVBlQ0o3eU5Hc0c5NWN5?=
 =?utf-8?B?YmEvbnV4NkZFNEgyY05xMUJyTkEzdVFqTmI3VTFsL2sxVncwMmNreSt3UFpF?=
 =?utf-8?B?cmFvL1ZWdE9hb1RZeVZjVkwwUm8zSTNzZVhVM3BQTmZ2RGllMTY3eXhpRSs1?=
 =?utf-8?B?dmFvYXlxK1RQdUhpVHp3VlprbTBnQ0Exdmx5OUxKazE0aHlob2c4aEhVVENH?=
 =?utf-8?B?cldMS0FUNC9TRkx3ci9kN0hlbXVaRGJZT1JseG96NmFXZHh5RGpxcFFRMjJT?=
 =?utf-8?B?UUVWSW5kY0hneEVxUDJza1d2UWE5T2pPVk9qUzJlUXQxdnoyWC9UdW5Oampx?=
 =?utf-8?Q?MefjXJAWu7kMMnrDyQWeaJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG9yTGxETE9tazkzb01PV0E4ZnpBUURZczc0VXNiT3Z0K1lBMmRUbGEzeExX?=
 =?utf-8?B?dFRLYVZoaVZuaEpjWFlJTXJ5WVNRa3ZGVWtCRndxeTQyWm9td3cxcFppSG1L?=
 =?utf-8?B?VVN0UE5xYThIODBrL2lNVlNPMHVvdHlMemt1RW9Mc09qeDcvYytoNENHQ2x5?=
 =?utf-8?B?eGhXUmorYmtYaDdGVCttamFPZFVGVXB4NUZ1SEZzS0ZXMWtyZXZ6RGFtZE82?=
 =?utf-8?B?cjlaQ1BiWUtKS05vSVpXRmRxRWQ1TGh2M2Q1RmM1aFZUQWpKcHRvVTAwVlBB?=
 =?utf-8?B?aXIrZlFxaHd5dkVsaEtPeXV6cEdCVFFGUnVEeHdnbVRXV0YyQXZtYVVzRmFp?=
 =?utf-8?B?SWNKUWNDMzU4QXB3aG9zekpsSVlxRjMxZEhxalZNT3E2WFJNbStnMFF6QmMy?=
 =?utf-8?B?QzQ1N3B2SU84YmZibDdjZUVQa2ZGNlJYMTJvMXBFTlY0UkRrM0loZXIvNFU4?=
 =?utf-8?B?WTA3ZEc1TExJVWlZNWVOb0tPa3BVSGswanlwYjlnR0pwd1g2UUUyZVd3T28w?=
 =?utf-8?B?dFdpcStyVEZlN3VoWENwS2o4azhtaXpRZ05KRVBKTDl1dUhxSGdPYmZkc2Z0?=
 =?utf-8?B?QlBOTUVrTmNKSzJidTBVRVdQQ3dtdmFOQlJpOVE1TCs4cjRWK2lyUHF0WGV6?=
 =?utf-8?B?cVh2bXoycFhRV2xkUTRIZnNkcXM3Q0o3Zkhzb0VHMk1oeHdaNG9NYTVlQThD?=
 =?utf-8?B?YmwrMU9BaDZINkRjeThvYkFLUTkwUW8rb0R1YmE2QVliODdGb1RlM1J5SWw3?=
 =?utf-8?B?bG15VFhHWFV4Z2F1S3RFdG4rY2MwOGJDWDV5NC9xZjVyU0p3Z25MRnEyTENG?=
 =?utf-8?B?ckd5VnQ2QjFMaUxVY1RwbVBzUE8rdGFQbmVENGg3NmhGY1I5NFZ5ejJoak1p?=
 =?utf-8?B?aCtkYk1xN1h2NnVNdEdESFZDR0R1WmllTDBhd05obXdsN2QyQ3MyK0pwS1pn?=
 =?utf-8?B?c09hWmdPZTFrbFUwQ29ueU1zMmNjZzRHWTlrTkJCWGhLcU9Db0JrcXVkcHJj?=
 =?utf-8?B?am9aL0ZTdndBb1dtSzJ3OVBOaDZzbVZzaEpnTWc4bXduUkdlQ3pDc2lQMGlx?=
 =?utf-8?B?alplZGdza3QyTkdKYW5DVWxEQnNFVkR1V1RPaUlINlNCOGxOb281UHA5RUpE?=
 =?utf-8?B?WUtLS2FuVjJPcjRwMmZySHN5WHdqZ2czM1lIeG5aOUhNWE1kTFBuNnI1T1k4?=
 =?utf-8?B?NUl1MXpQRTh5SUlIWTFDa0tyU2pEVy9QR3o5MDFLWXVtRGdZUFlFR1cvWFRl?=
 =?utf-8?B?dFZYTytuMlFCTG5hQ2tvSGRXK1NlYTlRRlp0akgyUlJkMEVmZ3o0YXVPT2xj?=
 =?utf-8?B?NlF6U2NQWWZGV01IYTcvVWFkR2ErZklFSzNnUFZBbDVFeis2RmR1MkowVDNn?=
 =?utf-8?B?R1NyVHZoQUxSRHcrVFlIejhnclF6c1d5bjhBQTBPNFFIS2dQdUVCanFaWDJo?=
 =?utf-8?B?SFRGNlhzYUlaYTk3K29ucGpRM3d2aXBnM3U2cHp2M2dLSHU1UTJHS0M3VGZT?=
 =?utf-8?B?cmVUaWljMFBBUHkrV1JwT2lXOXJqVjR3bjhDengyZGRzNE14eW1HdWREWFZD?=
 =?utf-8?B?aFdpTHFQamVmeGlrTHY4VTZLazg1Si9qQkY4YnpzY3JxN1pUNkZZNTAyQkUr?=
 =?utf-8?B?REVYVGhMSS8rWVlIR0tYcWY4cng3bGRxV2daRlUvZm9KNGVmTWhlbDVkSFlm?=
 =?utf-8?B?TE5xNDAvRGFxVkcvMk1sNHhtUEEva2lDUklubFFoRTgrREs5OXc1bXN0cFZm?=
 =?utf-8?B?OTduMExEbXdjMEVTWXBUWURxemZNMGQva0RVeUJZSGd6Ykx0N09uOXcwaUxk?=
 =?utf-8?B?S0FIb0lmcEhSR0ZzZmtuUm1CZXJEdXdCL09sOXN6NnBUOWsxQXE5VjA2RHZr?=
 =?utf-8?B?dVZjbFREWFpDblZENzV2WEhicXR3bGU4V3VxU2RvUmIwTk1ycUVhM1ppSWQz?=
 =?utf-8?B?djFmWWlkV3F1a0REVGhiRDJBRWxuczBwcEdaekJMWTAwa3pnY0EvN1JzaVpN?=
 =?utf-8?B?Q0pOUExUOXJyTForSjhuTk0vKzNPNnZxSjN1RFdUd053MWN5eGdYdXcveTIw?=
 =?utf-8?B?TmlRbnA3YlMvb3RFVEV3QThEeGxHSzNHM0JQeVFSTytNRHAydUxsdWlGemQw?=
 =?utf-8?B?UU13VDY5Tm10RGQ0QXNBMmRieFRoV0hjZGJWR003MFU0aXBFRW1MREV2Ym0r?=
 =?utf-8?B?VzVnMTV6THNwQk5LU2xXVmFJeDI2VG5iU0FlRkllVjdvbWphTE5OQXdaNWtC?=
 =?utf-8?B?elNOOVVvN3pFd09kVy81MEtHNDBrUE1qUWhwa2FWMjBBdDF2Q3NUa3RhTk92?=
 =?utf-8?Q?b/x6r1KbHwkM5Ms4nf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8381e1e-5f58-4e77-3945-08de62935ce0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:39.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVlLqw/bPdi+xbqNCcDihMrT+EHaLHAyrnOAFkrbwnN5V9oloAhbTg914ixNmYVG2JQNEuOGtXaR0mtqU8jThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

Remove simple bus 'usbphy' and move chip nodes to up layers to fix below
CHECK_DTBS warnings.
arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   from schema $id: http://devicetree.org/schemas/simple-bus.yaml

Remove property 'reg' because it is never used at driver.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index aed7fe2fd6b93fe70a0abc7213fe0b874afe579a..ab7b6463998944899a5c49b566e3beca5c039a94 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -393,21 +393,13 @@ weim: memory-controller@b8002000 {
 		};
 	};
 
-	usbphy {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usbphy0: usb-phy@0 {
-			reg = <0>;
-			compatible = "usb-nop-xceiv";
-			#phy-cells = <0>;
-		};
+	usbphy0: usb-phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
 
-		usbphy1: usb-phy@1 {
-			reg = <1>;
-			compatible = "usb-nop-xceiv";
-			#phy-cells = <0>;
-		};
+	usbphy1: usb-phy1 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 };

-- 
2.34.1

