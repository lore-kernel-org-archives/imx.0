Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2090.outbound.protection.outlook.com [40.107.22.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37381C68BE
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050278; cv=fail; b=cs/KI74ZwYejKj6Pu5kt1B2hc0s5RZ3Gx7Xi+Rho3QC94MhOylOlTXpT99sYza2HUCbKIQl8NWnap2bABXBI7Qmsf0CCcf93Z3/tZlVudidyExQ1epzbpQLoAobcZFrSHSNCogrHVMCNhzQDJV3oMSOZPlFJ0ebGMfBfk3oisGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050278; c=relaxed/simple;
	bh=U3vPhIOVkbfGWD5AoUQ079XqrqP5fRJnWnG6AfaavzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t3p6pJSFPJZlXa0xeYp+CJU2K7Yz8NAnV1TANUA1v9+x2XhZ9bSyzdysAipwxJV33uLyt6SWyPXO2Nglxd6xJoPtpLRhILvaMGc8WLRLOCnunE5SxIhtr2A+p8j0u0YGi2gFAqjA7+OXcDXEnrvNKAoBreCeTqAMFzH9qGkcZ80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=jwAOLhTt; arc=fail smtp.client-ip=40.107.22.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="jwAOLhTt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqIcBbliAJmIZVz7z8hUIRaLHu9Okl/rLWAp7y3ec4j0ZnB00flfAMvSfyvEVwAAZAd7ado7CWfB8jxBzgq/B3VMCTvS35MKWGf3I4id9U03YQkrHeoc4QWDI9Md7c1euk2hvU5+sMuSUHwsBnSBKhl371ZxioSSkQNgHPykXkbehd78dKeJuwwz7aetGK+UKHZs0ssryRjgJdXniNx+VdiEXkPfXXU9pIPSSzRGayx9cJMs5VGLbsnQlaol7tOVhkbm9xuX890jkkZwMPHd+zifl3m3gicE71vYwzXh0W++3XGmacZBiy7e5ht5Y6ECDXcZxX+qjm4DueWSkmIB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+97jkE5/z2gA1RHkJdByi7wnhRY7DRBb9MAzG4lzkc=;
 b=uilPlyOdDvUh/0ZQgSsHPGRta2Y7CC3GNaqj+rxsC4ZdwVI+7osi464Mqh+hIhtrxLH5ppqwUQSuMFNSKhr0WahgGSI7uRNvUOSEfg1ZvJdL8QiVh+k/aZsMX0oIm05LldUyREo2NYHIY3BvI76DF8y21GI7aysC3MPGJjRGBWo9CJUKm08r45z7SCviJz9X4RflAWZIHXIJBjAHsGNa+XYsGyF8ba9JXvtnV2I3k/y3GcnsBQsxI1dptGsxB66fZ9mjdNXMmtGZxr/wH5EFy5kX2khbDgTpvn43s9Afbf+MvHbzIer4H0ouAklOXK8krVlz8HUZo8OSc8WpvywTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+97jkE5/z2gA1RHkJdByi7wnhRY7DRBb9MAzG4lzkc=;
 b=jwAOLhTt+vk8Rs647gpeboao9r04Z4AyFchVGXqff8f0Xby8wVkXi/TLSF9TsUpBvbNCBO8rK5nC5fzTMT3geHuO0+aPCU5UuYEuCoxISByLvpYwea8NGieJKoasQDdrxELF0Isp0BWVjDhAL6jChxmPHwC/qGa25ZgJ5uQ51wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM7PR10MB3272.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:105::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.15; Tue, 28 Jan
 2025 07:44:31 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8398.013; Tue, 28 Jan 2025
 07:44:30 +0000
Message-ID: <15348147-8806-47b7-85c0-2850c7296ed0@kontron.de>
Date: Tue, 28 Jan 2025 08:44:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Use correct LDO5 control registers for PCA9450
To: Frieder Schrempf <frieder@fris.de>, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marex@denx.de>, Conor Dooley <conor@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Robin Gong <yibin.gong@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Cc: Bo Liu <liubo03@inspur.com>, Conor Dooley <conor.dooley@microchip.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Joy Zou <joy.zou@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241218152842.97483-1-frieder@fris.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM7PR10MB3272:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d0037f-39df-4175-1504-08dd3f6f997c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9renFaUjV5UHVnZ3huWU9IcUh0SVlSbzlLOTI2R0Z5WWZVUVlKNzIrY1ZW?=
 =?utf-8?B?K0djYlhQMnBFUDQraUtIU29XNE9NVjdoRThNeXVjZ0N2Z2ZPWWNkSlRLQnZU?=
 =?utf-8?B?SjZTdGVreVZoTHpLUEcrNXhhZUdvRTVtSGdvWklXM09DMmtjOXBGcDBtVUZX?=
 =?utf-8?B?VVdnSzJ0QmNuakdxbWphd3JJZ1BjaGt6WU1IcE5zMWlKbHVremRha1dsUERz?=
 =?utf-8?B?dEtGam9hL0VSZ3h5bm1Fc2N4aUJQZ2ZYTmNOa2NkR2RSVnV6T0lpdWlJSVlj?=
 =?utf-8?B?cFJiL0x3cVRXb25pQWhQekJraGVha0x0Y01kOW5LUlR4cGhxZUk3RzFJa1Jr?=
 =?utf-8?B?YUNxbHFjM3V5eUFWR09uWCtMQTFZWU1mNTJ1SDhhYURYdjVDdUNSMXFoTlAr?=
 =?utf-8?B?MkloSGY5bWQzYVhER2JJNUFPK0pmNkI3ZXZ1ZmpiNGdPSTRyQmhwTzBHNXFT?=
 =?utf-8?B?T1dSak9MeVZDcUM4TmRFa05kTU9WTEtwdU5qL2lDQWh3NDliRzlqb3VWUXZQ?=
 =?utf-8?B?Tk1SemdJRW1Fd0Q3Y2R1VzJvdnB0NFZjaGtRTGFWR09uSXlmMGkrdVlnUUgx?=
 =?utf-8?B?UkRSYlQ2NHoycXRESjBpSVRmSkdNd2VNNW8ydFlWN01sc1lOcDd5djIzWnNI?=
 =?utf-8?B?U2JCWG5JazJ6cjljRzdRZjFtb2NKMm9CY2JQOElIWUZDdUVWNjhMWjVqT05B?=
 =?utf-8?B?SHc5WE1nYjF0WUxlTTFreDlIaG9Ec0E2SkFPeXlqdk9tUXhJNzlob2p2Zjhl?=
 =?utf-8?B?WjJ3UEh3d2RLQW5kMU5hZXQvOE5SSWJ4Z3ZkSTNsVzM5aC8rZFFpdGUvNUVO?=
 =?utf-8?B?SkZURFJ5OGRGS1ljSy9rTkRzOWVFVEdpbTBaQ1BRVGF5SmRRaGNmVVo2T0Jn?=
 =?utf-8?B?TWFpdWRadWRFL3g4VDdqMXdoREZKa1QvUnoveEl1L1o4RktmVmFpSGNiVU1i?=
 =?utf-8?B?WGhWYjFLN1NnbDN4OUJKc0x1eHA3Y2hkcEE5N0dvcDNuL2lzRHp4WWdXWUt0?=
 =?utf-8?B?d05KQlJIc1M4Z2l6TklTNEc3L1I4ZHN5cVFyQmhRTWNQMlFDN2xlTjluUExw?=
 =?utf-8?B?a2VTWVlRU3NBR1IzL1RsN244TDUvWU1GczMyWHBDOTF6MkZHM0Q2ZlBnWXo4?=
 =?utf-8?B?VEE5WFgzVjRTWnRUOURaZVhQbWlUVlRxR2dlME5oNHFkQjhNMmVzSlViRTRX?=
 =?utf-8?B?alZUdXRTZGZObVdtUUFKWUxhYU00c1BjZEVFaDFVSHBCbWFCTVNNR2ZHMUIx?=
 =?utf-8?B?VHVuQi83aDNsam9ETVducERETG9hRCtWWXpzSzdXelVRVFoxWnVHT1JoN0dQ?=
 =?utf-8?B?Q2hnTXpqLzk1ZTdXU0NFOXJSbkFzVkVoSTRnTHF1cGEwakxMdHZyYUlKUGNK?=
 =?utf-8?B?SHBtL2gzSWxaS2QvVkdQdG9IZ0pUQVhFZ2JRSzdScjFjRVhoQmNuMXB0cmZl?=
 =?utf-8?B?WU1aanpLcUFsWGNzTzlsZjhQdllpTDJuZ1FlREZxZEs5WFJSN3NyZS9IV1Bi?=
 =?utf-8?B?c3ExQnh5Zit0N3JteGt6VTZFSEhUZEtlWHJ4ajRsYnd4bjBvblI2NlB3eW9O?=
 =?utf-8?B?OFlCZHpjY2RGaTVuWW5CeVV2MzFEQUxPbVF6MzZwSzF0aWx1dmxRVlptcldB?=
 =?utf-8?B?dlBHbWZqelhOVTFFOTNVL25vck54RHBhWG1MelpKeHNrZkhiQ0QxV3lUYlln?=
 =?utf-8?B?K1NIQS8xc0hHbVVwdFRsV0l3bmMxQ0Z5VTZHUWtYdExWMzVGNXJXbGNCRmZ0?=
 =?utf-8?B?dDQxV3ZXdHNmSTM5STBSUlVXT1pFYkQvb0tXMjlnS1FRK2hSa2RoazJpU05H?=
 =?utf-8?B?T2J0N2pOb0d1b0NaOFVkcHlVcldnd0tLRmdiRXNWbmZmUVRldEptdjJYdXBv?=
 =?utf-8?Q?0r4fNLIFEOK/N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkdPcit4SnFpMUsraENqWTJ3OHZKcGo5cFpKSkZYRitWT0s0Y1hWSXQ0ZE5q?=
 =?utf-8?B?ZXpldURMMmV6OWFvVDRtWVNiQWE5K2dHL2w0MUwzMUxDRGNybXJjTjdmekNr?=
 =?utf-8?B?T0FrSG56OVNEekNSa1Y1emcvUzc2UVVZWTVHbmlacFluUW1CUmo2dlZQVllr?=
 =?utf-8?B?b0Fac1RUVWxxOGd3djVpRGhTckY3SnlPckN3bWk0MzZmUitnamRvQStmbzkv?=
 =?utf-8?B?MXN0WTRjNjkxLzc2RkNqeVhJaGpPemJnbEtsU2RLYlFrVmRWV1l1dkoxdXFM?=
 =?utf-8?B?VFYrdlFaTTZCZUo5aSs2UG5pTTZycXdpeHNuNno5Yjk1WFVqSjRxUmpvODlF?=
 =?utf-8?B?bGhNVHNkRjV0TE00eFcveVd0U0lSTm1mSm5GQmhaRlJtNEI5Tm1COGZNM0h0?=
 =?utf-8?B?SlQ1NmI2OXF0REllUUpyd0J1QWZJRlFnRkhRT3g4RHllOXJ5YXlzSjVSNVg3?=
 =?utf-8?B?RFQweExSUWNkNncvMThyTk5XZEJHeWttRDVKWlYwclVWdXcyYUEyc25TN0ZC?=
 =?utf-8?B?ZFlzd3plU0k4bWNBYm5zdUlnM25kS0JrclkwalBCd09MMkEwa25MOXduVkRi?=
 =?utf-8?B?WlhxM2JrUW8xUm1kRC9heGJXMnJjcFhlditkQlZjR0I3eWo5M1BsRHlxTzJB?=
 =?utf-8?B?Q1JkN05NUXpJdEp1TDZVRW1NMFMzcVJ3Y0V6TmJ3QSs5bC93OHNBdHNoVm9L?=
 =?utf-8?B?dnV3WUdpL24vS1hrVXRkVjhrQitKK2RuMk1ObUc1cERzL0RFNEtVSmZlaWxK?=
 =?utf-8?B?N2V1VjQvY2FDbHo4cXFseXVacXFHUVJCK1ZMWWsyckM4aTJYa1dRYWdlSVpZ?=
 =?utf-8?B?ZnR6c1plQytHdlgxNzNkVTFJQlNZMFNTL1Bsd0RXYy8xRWVIdjR3TzFNSUkz?=
 =?utf-8?B?MzN5cVA3VDNFeGsydlFyYzNTcE5BQ0JRaUZyUVpJcSsrT1pVd2owOVRiZFBk?=
 =?utf-8?B?N0FIaWtNZFJrZE9LdDdDN1BPZmRQb0EwRG4xcFFSTG9Ed3krcFJIM1IyU0Z3?=
 =?utf-8?B?VEU0V3V2ZVF6OWJYek1mZFFJNVpXa0VxUVBiOWVIK1duQnlIOXprOWkrbWRD?=
 =?utf-8?B?S0MyMFo2NFBZTVFGbXR6cy9tYVluOGhTZjRTYU5vRHhoTEZtU2E1THFycG12?=
 =?utf-8?B?THRRa3prNk5TOVB3cXdXWUoxOXlOclMyZmM4bHYydHZ0ZWJlSkYzQ251MXpP?=
 =?utf-8?B?Y0VkeDdpOHNoQllRS0pla0VkNFZKRE0xdmwvR3Z5RFBzOGQwSklsNjdEckUx?=
 =?utf-8?B?bkRFeWlrbEppMithajlYUkI0NjRaVWxObVl1Z2xDMERZMmpDQWVGWVB1a2I2?=
 =?utf-8?B?SWVEWEhGMEdjRmhYK2YxN2EraWhKVCsyenpRcFBoN1daN2tjZVBzOElpMXVs?=
 =?utf-8?B?aWF5YWZKdHYrblhMRndmUkdUTGdqRDZlNXRFamllSkEybDlhSTJEc01LeC9O?=
 =?utf-8?B?RE5OWDlRWm51aTkva2F4Z0ZUbDhwK1FYY2pnUWU4cDF0R2gvN1hseVBSWm0v?=
 =?utf-8?B?MjhFWWVTTGlKc01nVkxORkFVRzNld2ZWWSs3ZHl5ai82SC9GcmpLUUlyK0Y3?=
 =?utf-8?B?bm1nUFpIWGxVK084NHovUlBkcCt2cjNpRm5RQnoyeUUvaUhBTnMyUWVRTTg4?=
 =?utf-8?B?MnBhbnR6VktZZWJFR1pOSEt3V1AwVW40N0dVZHNldWFXaThHL3M1SnVKZnM2?=
 =?utf-8?B?bUo4VjFSRG9sTWRCVW9sR2dVRGNMY0JxVGh4STlwc1E5NEkrNG1paE5YQVpT?=
 =?utf-8?B?NVpmN1FqbEJBSG1rMUpObWp4QkhGUHFVV2tRZExENGZqYTY4bW53TEloR2R5?=
 =?utf-8?B?Q0VFK0c4aGlwbzNVRFhHSUNIZVFBbzlWQjhsTjFEdVNncWdlSFppaW40cHRN?=
 =?utf-8?B?RS9iOWFTczlBaG5ZdDU4azhTSnRuaThwQXNRam9TUWlqd2R5bWo4ci8xZC83?=
 =?utf-8?B?N2ZVM3NHUklUdmxwei9oQ2FCd2w1clh4YytxQzQ1b0FuSE9TWUQ5UDVtdkJZ?=
 =?utf-8?B?Ukp5bVE3Y0JHS3pnTjhaYjZLaUZQeW9IME9vMEw0RWhtVGJkSUJBT0hBeVRt?=
 =?utf-8?B?czAwWktxSEJHdFZDWWRiQzNSSEc2T2VxcHdya2RueGRBMXU3M3UvWG00cUU2?=
 =?utf-8?B?ZldyUkxxbGFRaTdjM0FES29mNjFyTXJCa0g1MUV1NGkwaUpINWxISGM5WU9p?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d0037f-39df-4175-1504-08dd3f6f997c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 07:44:30.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y6Od3zcffpKm6T2c3g1Oz/cpebzJa3AYei59EJG5VJ4CWVUm5sxz5aLPZFNLfUKoW8uwgzQ4oQhL56/ktV6pHfu6CP+qd1aC8nVNvRbK60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3272

Hi,

On 18.12.24 4:27 PM, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This is a follow-up of [1].
> 
> The main objective of this is to fix the PCA9450 driver to
> use the correct control register for the LDO5 regulator.
> 
> Currently the control register to use for LDO5 is hardcoded to
> LDO5CTRL_H. This is wrong for two reasons:
> 
> 1. LDO5CTRL_H doesn't contain the bits for enabling/disabling
>    the regulator. Only LDO5CTRL_L does.
> 
> 2. The actual output voltage of the regulator is determined by
>    the LDO5CTRL_H only if the SD_VSEL input is HIGH. If it is
>    low, then LDO5CTRL_L is used. The driver does not take this
>    into account.
> 
> This can cause several problems:
> 
> 1. LDO5 can not be turned on/off and we rely on the bootloader
>    to leave it turned on. On the other hand we can't save
>    power if LDO5 is unused.
> 
> 2. There is a potential for corner-cases where switching
>    SD_VSEL via USDHC_VSELECT and writing to the (wrong)
>    control register can cause wrong output voltage and therfore
>    SD card failures (not observed yet).
> 
> 3. Reading the current voltage of the LDO5 regulator (e. g. via
>    sysfs can yield the wrong value as the voltage is read from
>    the wrong control register.
> 
> At the same time there is now hardware that hardwires SD_VSEL
> to a fixed LOW level and therefore relies on switching the
> voltage only via a single control register. We add support for
> this through an additional property "nxp,sd-vsel-fixed-low" in
> the LDO5 node.
> 
> Summary of binding changes (patch 1):
> 
> 1. Adjust the bindings to remove the old and abandoned use of
>    sd-vsel-gpios property.
> 
> 2. Adjust the bindings to use sd-vsel-gpios in the LDO5 node to
>    retrieve an input that can be used to sample the SD_VSEL
>    status.
> 
> 3. Adjust bindings to allow "nxp,sd-vsel-fixed-low" to be used
>    for boards that have SD_VSEL hardwired to low level.
> 
> Summary of driver changes (patch 2-6):
> 
> 1. Remove the old sd-vsel-gpios handling.
> 
> 2. Use the new sd-vsel-gpios property to determine the correct
>    control register for LDO5.
> 
> 3. Fix the enable register for LDO5.
> 
> 4. Support hardware with fixed low level of SD_VSEL.
> 
> Summary of devicetree changes (patch 7-9):
> 
> Implement the changes in the devicetrees for Kontron hardware
> (i.MX8MM, i.MX8MP and i.MX93).
> 
> Changelog:
> 
> v2 -> v3:
> 
> * Merge binding patches into one and extend commit message
> * Rebase to next-20241218
> 
> v1 -> v2:
> 
> * Split binding patch
> * Add solution for hardwired SD_VSEL
> * Leave regulator core untouched as requested by Mark
> * Add devicetree changes for i.MX8MP and i.MX93
> 
> [1] https://lore.kernel.org/lkml/20230213155833.1644366-1-frieder@fris.de/
> 
> Frieder Schrempf (9):
>   dt-bindings: regulator: pca9450: Add properties for handling LDO5
>   arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
>   Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
>   regulator: pca9450: Fix control register for LDO5
>   regulator: pca9450: Fix enable register for LDO5
>   regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
>   arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
>   arm64: dts: imx93-kontron: Fix SD card IO voltage control
>   arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal
> 
>  .../regulator/nxp,pca9450-regulator.yaml      |  29 ++++-
>  .../boot/dts/freescale/imx8mm-kontron-bl.dts  |  10 +-
>  .../dts/freescale/imx8mm-kontron-osm-s.dtsi   |   7 +-
>  .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |   7 +-
>  .../boot/dts/freescale/imx8mp-skov-reva.dtsi  |   5 +-
>  .../dts/freescale/imx93-kontron-osm-s.dtsi    |   5 +-
>  drivers/regulator/pca9450-regulator.c         | 103 +++++++++++++++---
>  7 files changed, 133 insertions(+), 33 deletions(-)
> 

I just want to ask kindly if there is any feedback for the driver and
devicetree changes in this set?

Thanks
Frieder

