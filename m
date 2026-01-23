Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241A2D7DE3
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159475; cv=fail; b=k3o5xKWat51FyglcX0usfPnuLNIyv3V7ASu4KK/2U23sODd/Ki+THIYkKp9cAF5Tkta0x04h6C72KgkjYWzirLhvohaRhrSohaKGzyC75I3L148zOO28E/Ny20M0e8ygW70Z3Y+lTSdf+TEhhYLB4ZJeU9j5TPkRix02WZBPvT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159475; c=relaxed/simple;
	bh=MX4BYnfl+9ypbsH3Pr64vXoJMJ6atzVS7FhZNnPOKwU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k2L6GotTb+A/LK6ZXfZ/edRIpGqv+HY5H6OpgAeiBZOBX908CgNlu8cMllJSa67tOeXF4yTtyq8QS6sDbVNFdhBXfm4xiVG3kx/MNP0DJbC0Ah2U7DFM0EZfw1e1i1or1fFECI/hcao5/n2ZzkfJW4b0zYshFi8q1RwKDtmaALM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IP41QN28; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IP41QN28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cluvspa8L3ZUVNh6S4syN8gCUHKo3S6hHfl34A6WSbfBZMDF8K/fSmRI41PwfanNIzH7cHSSthOhQ7sfSd1oJiMyYOdKelG/BMVVdgpeJqhYSlj7BYkAoAhmEdnHlGmvzi4V/oj/47uRO5IWSklIwEU8ILVN0Qly+GHWcebKcyf98WalPxapSASWB6VmFY5f8zplsdV2w69Ky0g4gQDpqB4DfYkxwBchuIcB3n1ii1A545gAdA+sj+sqm9Vvj5kNRhxnW6tXzFj42Xs6cn72EhMnJMDFWZApHtO0KliuwqtIsHXvySS3+WQYzgTA4OUcXYOUmw5+Ne3ortVR2N3j0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCmpvAEYXWl9qsmx0+iIHZX5n+iHGQX9+VRN8nkKPN0=;
 b=YNkf4k8pzANuPHmHINfdSr6coYERoowjwCtahIjrg2Kb4c904wCsmOVD+dmc//9ABRGa0HMj4sLvDuN0O/YsO1WsnL55ySrhEsWSrdZEX2xT5KTKWio5R9UybbDGo9DxAHepjFsdl8RP4jx7924LEzttr73RpvtBSDI03CGHt94i1OmZInkJNEo9tQLMQkexVNYdlPd4jSp/Qv9nUJ5Aw89zRYCNxJIc/MwnXtgHPbu/zVWSTn/nS7GppfUqp0urL6N9qt1KyCwQ0BkPXBs9JZHvK/FilGRQaSYKSTUO5/I2zTSXi50q6i5IS1v3i3nSGJeMtXGadcRhgSnGdeqgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCmpvAEYXWl9qsmx0+iIHZX5n+iHGQX9+VRN8nkKPN0=;
 b=IP41QN28ytXZG+vJXJxYYpF9gIxPSdyIZi/PIr9O+MhquKRX9Iicc68nTPUEcgPKxOwAtG7V1BXxzDN3Lpm2nWIGIRjGkgd+Dfq8g2nPEQzffpgcHfdQSq6jjDOpPHHCY+9aT8a+oVQDG1RJgymDgS+7bmkEn34a7hFtw3D5qzx5lGTYjtTDG3WYcqVjh/aC+i1bGBDELKMw1kjz0rQuvQw0zJ+E33qEGS2emksjcwIZsLykSG74t1trIzVj4l2KIVF8PRJQKVVMLBJbVIlNrHAxzzyY3AyEIYQhi0776kzX6Ic8cmYYqY8yNLRPTELnHe78+x9tttM9YMRze8DDMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22)
 by VI0PR04MB11048.eurprd04.prod.outlook.com (2603:10a6:800:25d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:11:11 +0000
Received: from DB9PR04MB8250.eurprd04.prod.outlook.com
 ([fe80::30da:db99:155a:92a5]) by DB9PR04MB8250.eurprd04.prod.outlook.com
 ([fe80::30da:db99:155a:92a5%3]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 09:11:11 +0000
Message-ID: <59773aa2-5949-490c-bced-b8d110152505@oss.nxp.com>
Date: Fri, 23 Jan 2026 11:14:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260123084844.4051570-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::14) To DB9PR04MB8250.eurprd04.prod.outlook.com
 (2603:10a6:10:245::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8250:EE_|VI0PR04MB11048:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4f0a61-2bce-4478-6245-08de5a5f599d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDl2bzRjY1pVUWJNalRwOUc5Y0UyWnVHNjVFT1J2MWlYT0tVZlAzUm5XSEIr?=
 =?utf-8?B?OXpldTJaTEZTSDdpNTZDRjVqN3BZbTdKZ3JSYUNyUGdONjVPNDcvNUlFV2VG?=
 =?utf-8?B?ZWhERHYzb1pMRlR4OVhFWWNPNXhkdEtYbWk0M0xWOVBKUzl4cFh4MlFiTWJr?=
 =?utf-8?B?OEtldEdFWlEramlhYmpRSEt6WnJiZDZNZ3dialgrajd6K3JmOHRCM0J2SnN5?=
 =?utf-8?B?dVFwYUxkMEVYQ01YMktjdU9la0doOEJ1UC9xK1BYbEw2L0w3N2tTZkFjM1p3?=
 =?utf-8?B?Q0ZWZmR1QlM2UG0vNHV5bHBCOVI3SVFNQ0d1c3ovQi9GSllZNUloWmNNS3BQ?=
 =?utf-8?B?UFpJS3Q1QzExdk91ZFFqOFZyWUQ3eGs0S2x1UUJWdTFQZ0VhWk9kMWk2OFBD?=
 =?utf-8?B?SXcxTmhyOURmRkR4Z1VhcGtWMEhkNThSbm9wSDBEZGdsU1ZTNys4UUtrOW93?=
 =?utf-8?B?NGxDK1dsQW1LWjFoSU56bElxb3o4L0p6U3ZHeVlqdUprTVErK1Uzd1paK0lB?=
 =?utf-8?B?SnJlcU1ENXBoWURFMDVjSzVwYkpsNTVKZm0yL245dVBWZWU1V3BRUTY0VGdZ?=
 =?utf-8?B?bmd3bUl6a3h1ZEJOYmFTRmlFRVBXWFEwRkdZOE5tV3pRbElGWFgvNUhPWk9Y?=
 =?utf-8?B?RE1CcjZQZWpnUDZsa21KcWhpekNuOW1TUzkyOUZqcCtMbDcxQmRGQy9sZ3N3?=
 =?utf-8?B?M0NyZ0NIWm02Vzg1em4wd3JVVEdmblltR1QzMXBITW9sMDZhV242SGl3TXlN?=
 =?utf-8?B?andxZmV0KzNvQXJ3TlV6OHdWSTBzQ3lzV1JiTE9xZzIvdEJYQzdSMEx4NWZI?=
 =?utf-8?B?VDY5ZitjWXVUMld2ZXVnUmRQVGhxVEQwRXY2dXduL1BEMDJBTzZGMit0dlI4?=
 =?utf-8?B?ZkY3RUVCUS9tM3FadmY2VmowTzMyOFlzS0h5Ym92OEFDeTdOa2tCUlVBQmsw?=
 =?utf-8?B?bnJPcGw5d29xMEQ5VUVHdHljOG5sTWFvcXZrWGQ4bjhZdmVEeXR6OGpBQ1px?=
 =?utf-8?B?REh2bVBwaktmUVRVazJJZWh6RmRGRWc4cERvc2hsZmRtQVdtYUhTbzhZZkJq?=
 =?utf-8?B?SnVPZWpUTGU5RWhETGg3WkpsZXRiMm9jMFYrUXkzN1crbUZHUHhJNm44VTBs?=
 =?utf-8?B?bDEzV0xJRUVUYzRDbmRHUlE0cndpTzFjUHQ4Z0wxbDdMallzREUzV3U3WnB4?=
 =?utf-8?B?cWw1RElTSUhTNFhvWXNldmttUjdqalhrdEVrL2NzeTJGd2c2QWpCUmUrcVpa?=
 =?utf-8?B?cm5MaEpob3hJdjY2SHVRYXdPTHhScEdaMmtFZTJVcEZud2VLdzZqTlV1WlF5?=
 =?utf-8?B?bDVPRDlRVW00aElmTWVkbjFtZWlhdEVHODRrREhKMmpoV1pxWDN3MktGRnZk?=
 =?utf-8?B?djRaRzVBcDN0UXNOanJTVUhSS2traWZ5aXUwb3NHdGkvWk9KYStnY1lUWXRU?=
 =?utf-8?B?VzBRWm42bkRrRjg3QTF6STFtYnhEMmI0ajQ3b3dua0hlbkczcUtmZ0gwYmRa?=
 =?utf-8?B?VWdCZS9DTzIxNVhZUFA1bkg5REtEMUJiWmY1aFdJNC9od01NaU1jNUxZTEJr?=
 =?utf-8?B?bytPSzJuSUdaaGVnNGt3TDN2ZWpMWEhvYmV0Y2doYU5FY1JDaDJ3bTlWUTVI?=
 =?utf-8?B?dWJtVDliOWkraW40bzFVRmhIUEVOeU5pMnRLRGExMC93WHVSQ0xqRW5hSUVk?=
 =?utf-8?B?eEF1ejJWSUxQOEJpdnZVNGlxVEtEaWYzRndoQjFia1pkcHNxcWtoNEp0eDhp?=
 =?utf-8?B?cjJyMUMyWG1xUnBhOXROSy80cTYrWHVrSE42Mzh3SWNrV2lhcU5mUzg1WGF6?=
 =?utf-8?B?aEVweFZSSzBvNVEyZGVTNGNPYjduQ2Y3Y0JCQmM2TTVYSnpqaVdZM1I0WCtu?=
 =?utf-8?B?emxjOGZ0aXpQWUxqN1EwTHg3cHE4djFNcEczWjNpZVJJcHlCMk80Y0M2Yjhz?=
 =?utf-8?B?Y0V4VFpWckdsT09IKzRJTzFyWHU0WERTUmVvZWFGMmZPZHJSdFcwdTZYVWl5?=
 =?utf-8?B?TTRpdDNBeGw0eGk0OEllYmpNbGZEMTZaWEw5TGVPWUVMWWJmTzlORXgyM1Rz?=
 =?utf-8?B?MDNmb282L0t5dDRyNlZkRTJhZmM4TEhZL2p4T3pVMm9xZUYxaEd5MU5aQWs4?=
 =?utf-8?B?M1FHR1Q2d0h2WUprTWpFTXh6Y0x4Vk91dmRvL2o3T0VIazlnZWs1ZUV6cXVo?=
 =?utf-8?B?dWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8250.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3gvdkwwbUYyTVZpR0FDd3N6cHQ4UGZVTWFGRzU3Vm1KYzhBcjh5WFNWYlo5?=
 =?utf-8?B?eGErSUhSeUtTUlVvVitMaU03SjYxdVpwYXorWTNCUEEzbnlpMDkxQno2WGRw?=
 =?utf-8?B?TGUyS3cyNFlEbkEvdnhQeDQ2R3N6NEx3NmtpbHdVTVdoRXpXK2dCY0N3aVJD?=
 =?utf-8?B?NFdIN1Y1Sy9yRVpWV3JyT0J1VkxPblVYd0Z2OEs3S0dLOXFDOW5UZm5NcFhw?=
 =?utf-8?B?M3FCam0xTFp0RTRHMGl4TjhOMlpONi93QUhPV24rUzh1MWdrb1czUDZHanZr?=
 =?utf-8?B?Q1NENytBdlFMK2VzbzgxUk9JU0kxcGx2ZVF0RGtlYWQvYmFFRk51YUlQWHVL?=
 =?utf-8?B?akp5bVNzcy83SVZ0anVycmsrTXBlY2VMSi9aNFZGc3lrbENnL2lVcTd5VDln?=
 =?utf-8?B?S3hmZUh4QU9NOGtQVlgwalFzcjZZdk9Xb3BpT2MwYTZ2bnNOTWQ3bDhzaE9y?=
 =?utf-8?B?aGppSTZ3V0hsOWhZZHdzLzZyQTVxZzA4ZU1KTzg2S2Zub1Q0YWV3NGx5Zmor?=
 =?utf-8?B?M3RYbEREQXVCYWQydkFaOTJaOGRwdWdUU1JsbTN6dDdqQzNUZW5jUzNwSkJG?=
 =?utf-8?B?R25USkVpM3BMNCtZVm45KzJ1VmFGc1JFSnMxQ1hHS1VqMURrakRQbDFVWm9R?=
 =?utf-8?B?NlJLdjYwUkhwZ3dBYk5QRExreWJYUDBsM2NNZHA0L1FzK2Z0L2dmcmJKQ1ZB?=
 =?utf-8?B?MEVUeHU3WU5JMW4ycGtrRzhJTXV1SWRRTVVpZWJUalAzVHFlSnIvYWQ4aXI1?=
 =?utf-8?B?TExFNkJPOXZaZjhtNlB4d21YV0J0bnozcmE0ek9kaE9jZFl4RElPU1hCQWw3?=
 =?utf-8?B?R1BjQlp2WS9vOWhTajBGWWR2bEtVQ1paOHUvYXhtVHp6eVdmOE9vMWNzRmJP?=
 =?utf-8?B?cC8xZllTamZSa1J0OW8rTW44Q3FIVUdyRFdVUFJpOEk0QmhvSjVyeUo3dWtW?=
 =?utf-8?B?alBhaU9LelBQSzdWcG5vQmhFUXZiaUNFTnZZTlVoazZ0Z0tOYVdkdHlZL1ZY?=
 =?utf-8?B?ZFQwaGVxWDdLZ0tCRlpYMzBkTnFmbHE0K0Ftam1FWFJ1VTVzd1N5ejNEbElC?=
 =?utf-8?B?TW11VWt6TWl6WTFka2RFK0x4VVZmQVk0YXN1NkJuZVpSdWlKS3NlU3RwYmNI?=
 =?utf-8?B?c2xxK3hvcHpJOGtZelMyaVArL0pOQ1pubkRYK0VKSWpQdTJJSzA4RVB6WnZM?=
 =?utf-8?B?YTVtOExyQzZiUUQrbVJiQjdVVU9uTkx3dkprVFRVYXpmZHpZdm53Tmo5Qmln?=
 =?utf-8?B?YlBaQ1lxSkJxUnZFTno0aXFZM0c0TE1QWVlrVUZ4bGxIR0dobEREWk9WaDJE?=
 =?utf-8?B?cUFpSFFSSDRpdUtRcFEzaGVjbFBrNGVacWluTERMc0pqdFh3QmhObU9KSlRo?=
 =?utf-8?B?b3owU2F2RXdaN2t3bkdOMm4yZFhnenM4SDRrU3V2OWt4VFF2cU5LdjlaTkdw?=
 =?utf-8?B?V01UOXptZTJadmp1SWk5QmthYmV3UnE5QzViejJzSFFZTHJuNzB4UDlRVnpU?=
 =?utf-8?B?Um0rRG1wclpTVGhqYlV5QWxiL1pxM1hpU1prM2ZTTUtKSFVIdFBmZC8vaCtX?=
 =?utf-8?B?WDlZWGtSb2VpanJ0ZVd1bW1jajlwdHNRUjFxL3htTWc3YmpNOThwVVJMMTUy?=
 =?utf-8?B?R1Ruc211RGg1bU5HRGljMkppSjVycHl3WnZQTVErcU1FTDlqU1dLRTYzVGV6?=
 =?utf-8?B?SlJnaExZNlpRYXhPMmlGcTRCbWFwQ3QxYW82S0d3SW9FSllyYjA4T0U5SEF0?=
 =?utf-8?B?SFpRN1B2ZXBMY2NvWG1kZ0Q5dEhVUHFmVTBmWVBCcWlwckc5VUw4RXNUTkpX?=
 =?utf-8?B?Q2JvWWxzOFNGU1hqNzR6RmJpa3FGQU95bjFYTXdEVU9EdHdxeXZyNTMxRjJn?=
 =?utf-8?B?SnJSaVNTOWcvN3l1dWd0ZWVodGM4aTU4ZGtpT1hpbzBad0ZXenk0N0dScjBC?=
 =?utf-8?B?OVpjR3lxTk9jMjBWUExNejg4eEJtczlHcjVrcWhBLzZjMXdhbVBaOElxakVN?=
 =?utf-8?B?eWVsd1BsY25WRnBjajBKSmRmQ2kvSk8zN1FBRnhGdXNQdk9iSGlUdlg5Zjdq?=
 =?utf-8?B?S2ZOZ00xRjMwcUZLcGJtWU41T3dUbVg4Nkd2djZEV3ZsbW91UkFBNTFnVlhO?=
 =?utf-8?B?MWpNUjVUZUg5YlNqLzN6d0xaVXdIYWtpbmF5azRUREt6a3lzazQ5Q1RQSzdM?=
 =?utf-8?B?bytTNzUzOU9HanlQUjB0TTdBa2gyc29WK0xEQ2RidUc2cGpTZWR1WUxlV3dh?=
 =?utf-8?B?UzFCUG1BMWl3aS9IR1NNWndzSXI0dU1nb3JTNG1rOTFYNjlDVDJFWmtNVHVS?=
 =?utf-8?B?QjhHTGZQeGF4Z3VwbUdMai9XRXJwUUJoSVZHbjZ5dkQ5V2ZDWTNIZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4f0a61-2bce-4478-6245-08de5a5f599d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8250.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:11:11.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y+idAjorBJM/3uJr92W014ox9sEvnGCbFAIUkNyZrm3kURmKsRfVCXv/pwmIB74vtfbC3goTDlSxECZSoOqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11048

On 1/23/26 10:48, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices, so need to clear the Supervisor Protect bit of SPBA2, otherwise
> the sdma script can't work.
>
> As the imx-aipstz is a common driver for all apis bus, so set default
> value for all opacr registers, that the peripheral does not require
> supervisor privilege level for accesses.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
<snip>
>  static const struct of_device_id imx_aipstz_match_table[] = {
> @@ -84,6 +99,11 @@ static const struct dev_pm_ops imx_aipstz_pm_ops = {
>   */
>  static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
>  	.mpr0 = 0x77777777,
> +	.opacr0 = 0x0,
> +	.opacr1 = 0x0,
> +	.opacr2 = 0x0,
> +	.opacr3 = 0x0,
> +	.opacr4 = 0x0,
>  };
>  
No need to zero these fields as they are zero by default being part of a global var.


