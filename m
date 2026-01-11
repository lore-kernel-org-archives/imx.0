Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345D3382E0
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135246; cv=fail; b=DAD5WT49IjKXPGNR/Vny3SK21IkahAN7keig2jli+d7bU5DT1WlcE0Vf/lFAK/QlqTwX7OdQ55hRxemBxMev9tbhG3nmBRmHsoAcQIPg7WN+r8pNz6FWbmjXMq7GXgxVnAgEd3j05Rq+vMZpq5dc9kvtv3NFwiVz/kuRM+2mpeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135246; c=relaxed/simple;
	bh=cRw0GLl0zCFvp5lFtNWKv4xuDQWWgK2A62WJmxzLGOc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fzhJYvZZMawZ3TxjHnWrKfoXSapx8OsUuQNBTNVfCu1V4qHhwzjFvpsXDXkcGs1Gg6OAnUTkiKvjhhX/TuQfFMe7Mr5aTuQYVG/QinnLSid4Zf3ZuKb7s1SdffmMl4dPk7TMQrT9t1mYqUx4yJ7CU3yQl/ymrTkdw9yViFo56r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fk31Yadn; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fk31Yadn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryljbvQxANK4VgE8mHJFEQSl/Dyvwg32JMAgxHw1vB27wXkcRuXghvkNu2gANJltVFWge2uizgrfYofvNktdlJU2Jx65pDViWDon9DqyonxduDvDUw+8SgGAiqdsdF+zl4FPpPZafdVAx3znYu0s+tFz4oeJr0EzUyiuSivLrviD5Z9e+H9dqZZ6gR/4bbiAd+WiaXjMPtSiTL0ve1p6eb9UVF+ddHSVONdZPvGyZLmRjbTRceWwqaeZnFlROZy2pf5OfFev7Sn7eUt56Wdnj8O0FxkEF/lHIGQXmJlLLT4pgqidyjHxIOrf5IKAmYAFceTwds+UREn021CjIhvMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD8Ge9lapTQi2y/01sVmPCxUyzJJ5+dCEvW86V8FWJ8=;
 b=Rm9iShhVLG7wRP4Mqr+Isv69ig23q5PfHCPFlzrf302NLfD/fC7npF+IjI88nNbah/HG1jOMxfEhUViO4ih9tsmUa5Emr01QkLy1FDvd0LNSR3K8wSKabn5rRK7MEwY9G8Invee7xLVy3Wf0VNF/JL3f5HeiEIlJLLFMSCi4a061icjI4qQEMKDBqo9EwRXqdT3Ni2ZpK0BM2qW6rDMwjrfTF0G+S5XiKntvdHccAtuFuaOTBOJsCAnpZYsqOp00Cyy3CqlBZ1r+pB5Z9hIKWExVZlKpwvho/6nyTp5xfCf0o3Gi2vnvQxE7MmByXGRFkMXYxDkM86eW/Z+oATfuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD8Ge9lapTQi2y/01sVmPCxUyzJJ5+dCEvW86V8FWJ8=;
 b=fk31YadnlsZK8LSjplFK3LVqUi6ASG+/LzjuPrKvgyFYNUBB4S0nTse+YPyF22C/27l7zT9Auy0rcsTLg2avHx2OLEpmsOSpNKWM7oqf01LFP/fg6n6ctn1WDqGbliMTL6HjJwTGY+n6P9ABPHFIjxpmOFW+CKNs58cJxTpKcnO9dBlu3CoCSOWJIdzVUdrIqWACfHT3cZ2678WYU8cbPUu0e6aF8nGQitabl+T8lya1fv0stZbIfzOeP9/dVkIAWJ0Mbyr6SgWKUO0QRsPT2KJEdC7oV0yxT5I+7WxnJIxMXufftBIMUa/BfGZ8MRT7EeYYCCjZtDZF2YwWM+51Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by OSKPR04MB11368.eurprd04.prod.outlook.com (2603:10a6:e10:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 00/10] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Date: Sun, 11 Jan 2026 20:40:06 +0800
Message-Id: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaaY2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3czcCktTI92UkmLdMiNdc1NzSwtTk+RkgxRzJaCegqLUtMwKsHn
 RsbW1APPb2FVfAAAA
X-Change-ID: 20260111-imx952-dts-v2-7579854cc0d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|OSKPR04MB11368:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d25e494-475a-4aaa-c949-08de510ea183
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjloejBCY2swaDBwcFAyR0JqOE1zUjFpK1NraFliNDU4THQvd215d3d2MklW?=
 =?utf-8?B?Mlp3SWwxNTkrb1Q1VzlmY1grTm9NcXh2NEhnZi9CQXhEQWMxMmlieWx2empL?=
 =?utf-8?B?Zy9ZV1ZobjZtTzlEc1dpTVFkYWdCeDJuN0lGWTdtRllNNW5YOTJNY3ptR1Jv?=
 =?utf-8?B?bWlKQ2pMTFQ3ZEd0M2JGNGxxTW14Mk5rWU01RHA3T2NUNzVidmQwZGNHN2pj?=
 =?utf-8?B?c1hSNFIxdlpHV1dlUEsxRktpd1BPS0I4Wk5aWmhBbG13MVlTQUtRcFpZRW5m?=
 =?utf-8?B?YjlyeG1EWWJSeHZFdjBnSDhMR0NMU3BIL3lCMUF4cjNaZkJpRnZOK3BiYlkr?=
 =?utf-8?B?Uy91bVJuZTJuSm5FR3d2UnBGVnZLRGovMERFb0RueVRnSnNKbVFhRStnSXF4?=
 =?utf-8?B?akNlb2JUMzdqT2dJd0VWWlBCR3c3TDRoVDIyMEUyL28waG03anlKaVE1b0Zu?=
 =?utf-8?B?ZU9hZTFWT28zaEw3UHFkQzk0aFhvSTQwblRIVVBxMERXUEg4bmo5eTRsNHo0?=
 =?utf-8?B?T2JDK2hOZXBEQ2FTdE9STHpmSnJCNGxCZTVUVGRYYUdQekJWZUFqNGFHZTJj?=
 =?utf-8?B?eW45WExvaE1UM28yWjhmY2haRjFpT3FXK2o1a0ZLckIweEtLOFZsaHFST1lL?=
 =?utf-8?B?YmdlVkFZTW5oT3pmbVprdG16WHpJNmptTFQvdkFZdHRTNnpWdnRKbUQ0amhl?=
 =?utf-8?B?ejVTTXpuQ1BwNlhYMXJUcHdSWHNiMUZUckYyUGdIby9sWjhQVWFieWp4cDNG?=
 =?utf-8?B?c2RVSFp0N1BER09ZQ2JwUDVVRmdCM2piTU1Sa21yTjlmL1plcTBIQ0xTOWZZ?=
 =?utf-8?B?NjI1UWNONC9vQlE1VGVva2Fwd1JSMG5DcEJUNVJEYVFHRDRRRnYyTjJtK0Vp?=
 =?utf-8?B?R3UwajNqaDhyZy9US3RpMnBLKzg2N1VXaXYyYmR6LzgxTEQ3L0ZyMzc5UTFI?=
 =?utf-8?B?OVFRMWtRM3VxTWtmek9iVXoyS0IxVVdZYk4xVGdZUFZrbVZVNk9hNklEQW55?=
 =?utf-8?B?TFhNVnZTUTVrZG5SWmlYWkF6SVpUTkR2SzlBYXpUNGRPRit1dTJEdXR3Z0s4?=
 =?utf-8?B?bGw3V1puU1NNS3p3MEdEWjlFaEVEd0MwTjBOVXJBMFFvS2lNRGJZZlpHNlJ5?=
 =?utf-8?B?czlUeDlFOHNIdVVTanVmcGZxZHl1UlhDaWZWYzBQTDlkNjYvNS81SFBtbHJQ?=
 =?utf-8?B?ek9VN0pFaHVzZ3BFVW03aHV1NGpKY2d6eWJ4eittckdVWXM1QlREaE8yZnJy?=
 =?utf-8?B?LzVIQXpoZ3dQbFVPd1YrUnB2dngxTVU5UkRoRHJGN2p0bnNoZ0dqUjdQOHZo?=
 =?utf-8?B?TDBMWjVNNXc4UXJiRlpKL0x0VUljYndQRExMeHNGak54SkhOQTgwMFd6Mmlv?=
 =?utf-8?B?bUJyY2VqV0oyMHRaemZLNURoOVdzaEx0UjEvMlcvdWI5eURaYW5XdmVYcVdz?=
 =?utf-8?B?aStHZGVMS29JL3VZa0dKTURlQVJIZWtmTjJSa1RQR1ArS3BYRWxCRDliazgw?=
 =?utf-8?B?UUpvblRNWWJaYmo2eHR4WlhnZ3NOb0xEQUNPZ2xjQ3h2QTA4OXVHbzF1R1dv?=
 =?utf-8?B?dEhJMHdCRzk5dHpxcW9VODlMZ0lSaVNxb0JwV2REUEVHbGFWeFVuT2FOclJ5?=
 =?utf-8?B?TWM2V3ZSSCtDdGV3MVp3UDJPREY5bWdFd1Z0VkJrVlN2eUprL0VtOGpoMjBj?=
 =?utf-8?B?KzAxb3FHNFcyUkhmandUVVozMzljRmRyWlIwUXN1VzdiY0lBSGZEUU90OExW?=
 =?utf-8?B?WmVJSmxtT2x5M3EvZ1NMaVhtNzJSU2pOeHo3V1k1U1E3LzU1MzloczlPenNk?=
 =?utf-8?B?WGE3aDBjQlFsZ3IxVkExbVlURXhMc3JURzhCWEE4bE1ORTdZQnYwU2xVUnNY?=
 =?utf-8?B?amw5cEVTODZHSHFZYzFlMHpRd3UxSGNhQkJEcFpoUjZqNkFuQnBOS3M2cXVn?=
 =?utf-8?B?M3QybjZqLzBQUFJtTzk0ajluWkducmVZa2VabWdXcGMwaXozZmZuYlFncGlJ?=
 =?utf-8?B?bVBkVktnREljMzZDVEVqeXJ4dXNWOHVYR0o4VFY3MGh2SXBad0hTWEEza0xZ?=
 =?utf-8?B?T25WOU10d3ZpdWE3VzlCTjlrWDN1R2VsR055QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Slo3cnRTQUJmVUhieWcvVFgvR3hvVS9MWm9vL05hVE5WY21kbklJdmRqUDhx?=
 =?utf-8?B?VTRmdHErb2g2bG9jcGRDVTRnZWJJVFozUWU1dmNmMVFqNkxDcWxrVVd1a3Rr?=
 =?utf-8?B?Vlp1Yk0yQXZKUjVsUVNGVVpuUkkzS1YyQmc3ZndROGliNlg2c2tSd01uenVh?=
 =?utf-8?B?WmZHaW1SUzdNdHg1RE9HTEU2OUJYWGN6Z3RuWksvaVRwTEFETGl4RnR3bzZa?=
 =?utf-8?B?NkVuWXUwUEMzd1gxWStlZGZLK1gxVk9zOW94NFRJKzhTT1pHTTNlN2IrOGkz?=
 =?utf-8?B?anRrSDBVUFA3K2JoeFVrRC9xSWRwdVRPREJneGlJZmJuNWhtaUpEeTVOeDgx?=
 =?utf-8?B?dUh6SXpzeW9relNIWGIyM2U5RGlwdXRNazUrMVRKdVBVQnZDOUp5c3ZwOG5L?=
 =?utf-8?B?Wkp0dGZGTEZaS24zdXMwWGN6emE0WEs0TG9XS2dUUlNYbGs1czU5VFRPaDAv?=
 =?utf-8?B?WTg1cUd4cHU0L295ZGJKTjBJS2ZNTC8wY3RzQ3QvUnBCeTBPbG02WkZ5b0NY?=
 =?utf-8?B?bW5mT3AxeFMycytRU3Y1dkhIcU1kU3ZseW5VQjdLKzFWdDV5ZUp4NWdONXIz?=
 =?utf-8?B?d3VITnF6QlZiY1VSdFROdkZ1SHZ1bXc0anpwVzFCdU8ra1U2dGhtQzIzSUxN?=
 =?utf-8?B?Zkt2NnlPL2JRekxsT0ltUm9Lc2JwWTN2dEpScHRJbTVUNGNBRjdQRmZwN1pL?=
 =?utf-8?B?eU9WM2tTNGVWUURIdk5kblhpTXc4dmhPZUk2dHhEQmRaeHpCejBqeCtqVlI4?=
 =?utf-8?B?QXNlUHhKREhHOVVqZzd3c0t0WjVWMHNVeFRUT0huU212RE05NVNZczBkQVlv?=
 =?utf-8?B?L3hsQU1jUE90MFVjUkUxNFlGa0Rmc2VreXhndHM3QjYwNUcwdmdWQ05ndVEx?=
 =?utf-8?B?SFhYZHlXY084MjRjdll1cTdBaDNxVmFESFljcWxvSTR6TGlRdTJscUd5QXRR?=
 =?utf-8?B?eUZ3TUZ6SCtrZlArOVQ3OWI0TmlZZHBPLzhEdEJnbkpnU3lUTCtIRXM0K1M1?=
 =?utf-8?B?OVBJNlVhVUVoOTFyWHo5THJXWGVuSG1lNjB6ODdoViszNjFDdHJiYmV2UkFp?=
 =?utf-8?B?bUlNY25TQnE1QUEwaGtNc0dicE9rWTZDZU1GWnRIQkZuSWpwY2ZpTXFMSExa?=
 =?utf-8?B?dVlCZjJEUW5NY2h3NURRbDIreEJub0t4T1pWZEZQUG5PVG9xZnpBaDUyL1lL?=
 =?utf-8?B?RE5rcFZaVVplM1A2TVppeFBxWWg4azIrd2E0aXNEUnhDTDYwQ1pyWnNmK3Va?=
 =?utf-8?B?ZGFzazdRMFdNcVBYK0QrZFJ3bGhoYXlwYUowQmQ5MmpQdHpydVpGR1dnSnRy?=
 =?utf-8?B?d0Uzc3pQUE54SGNsaGpPdVRjaWV2TXRHZGhiMnc5MnFrQTI2bG1CSHBWMDdi?=
 =?utf-8?B?NUdEbmtGdHE3bDdEQ2cra3hGOS9TRnNkTFFUYlRtUG5BWHZKcFhqTWJBRWYz?=
 =?utf-8?B?d2xDMWZzM2RXdHAzQTQxWC90aGxBYXY3bHFNazkvd25EenZZRnlCVlpNTmo5?=
 =?utf-8?B?VFpSMUN5aU0wbFErZk82c3JRb09zVGI0a2p4YjlubDhzaGRLUmtVdDVVeVFz?=
 =?utf-8?B?TTZLd2dtbG4zQzhnY2hEZnUzVzloV3NqMFREUkdrN1BOY090K01PVFNnY0tz?=
 =?utf-8?B?djhRbHlKL2dDVEtPZ0p6S3N4b2xXdjYxSkhOWlhpS3piZ3hvQ1Npa3ZDcnRT?=
 =?utf-8?B?a2JCRmNkd3hnOEd4N2FFdzA0VEZDR1FheWtFdHFMNWJTSWFUMVZ0d0Z2UWlW?=
 =?utf-8?B?WmpCcEpzN0xwVUJRVDRwWFAzdUordkN0cW5vV2h0enNaNndmN0JNYS83SStu?=
 =?utf-8?B?TkxvYXI2Q0M0RVAvWHZ5Y0NFNUNkMlp4RlFzWVowbVdSampvN2V4Q1VBQnNn?=
 =?utf-8?B?N2xQNGcwck5RclMvVzQvdDlPcTJlK1V5WjMxWmpGL3Y5ZDZMc1FQb1BQS0w4?=
 =?utf-8?B?QmI0b2Juam84V0dDZ3NXUGJQeXF4NWYxMTRBVVhNbzMxamZPL25yd2NPVUgv?=
 =?utf-8?B?RC82dWJCR3AzaDZEM0FqRFU0Mm1uWEoxc0dmNGdTc2w1SFRWbGI0OTk1c1hN?=
 =?utf-8?B?WjNRdE9VRVhTcnNFNlhTY0NZWmxYR2U1UjVZSWVoUCtjKy9IYVRvWTJEbEk0?=
 =?utf-8?B?MzdBMStYOXZpQ3BzaGhsRnJqZXh1RXAwREN4YktYd25DU3VzZUhNWjduWklP?=
 =?utf-8?B?M1A1d0FlL04wcDA2NHlLbHhjeUt1RkhHcks1emU4QnpNSWVSTEFxcEMxMm52?=
 =?utf-8?B?OWFZTjB1dEorY3hFTkQrRmJKRWtzSUZ3Njcvb21xR0ZtU2s4bWlHZG4zeHI3?=
 =?utf-8?B?QnRyMGVWZGhRazEwd1FySDREeGtIN2xuQjVka1UyMEtlcndSZEZidz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d25e494-475a-4aaa-c949-08de510ea183
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:41.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YVjB0lAvQvzt/8Vzs24UUZqcW8fZdIJfNMiTo15DDUZ915JkZEdA7NoqSVyjnnIzP0zNl15KnuqqMrhaFeQCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11368

Patch 1: Enable cpuidle for A55
Patch 2: Update sdhc pinctrl
Patch [3-10]: Enable wdog/usb/spi/uart/i2c/tpm/flexcan for i.MX952-EVK

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Sync to next-20260109
- Update Copyright year to cover 2026.
- Update spi7 pinctrl.
- Add new patch to update sdhc pinctrl to DSE4, add flexcan and tpm support
- Link to v1: https://lore.kernel.org/imx/20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com/T/#t

---
Haibo Chen (2):
      arm64: dts: imx952-evk: Change the usdhc1_200mhz drive strength to DSE4
      arm64: dts: imx952-evk: Add flexcan support

Peng Fan (8):
      arm64: dts: imx952: Add idle-states node
      arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
      arm64: dts: imx952-evk: Enable UART5
      arm64: dts: imx952-evk: Enable SPI7
      arm64: dts: imx952-evk: Enable USB[1,2]
      arm64: dts: imx952-evk: Enable wdog3
      arm64: dts: imx952-evk: Enable TPM[3,6]
      arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

 arch/arm64/boot/dts/freescale/imx952-evk.dts | 403 ++++++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx952.dtsi    |  20 +-
 2 files changed, 410 insertions(+), 13 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260111-imx952-dts-v2-7579854cc0d7

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

