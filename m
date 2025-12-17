Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD3224B01
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 01:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936760; cv=fail; b=ucJimXgGa1Dc5blNZBlhGQPgv9PcyLd+e0cae1B/4r1RQXg/XpDWuY7Gzf0J528nzmng/Zli3nMQcwP21SE96BiE+FAzBE1maOWBiRcRZX8Kd6QnvCzx9NTgD7ysamD6daCrnYtZKl8jHayGokja4J1R7u0y0l8Wmx+DeFaK9VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936760; c=relaxed/simple;
	bh=UDs8TydpZVmIRt82N1dZiRSR4tqb9Ic6rwwxrxBgcSg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=sUKaaL+8+YY0Dg+JsI9c9jD4+PHPK0xqf0OwFObELR9TqAOnKk6VgSL0f9ZC/nfftKy2os8fFvcHaUXa8nPrJsl3Sw3Y4CmvUK+ENhqnA4/Elw9mhKApSgsAtJz7BjLgN5PE01wuGCBx0zmaahBtnQ+3eVUiudZKiby3Z3jmU3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JTxhLjih; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JTxhLjih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r63IjHyiGQ2wtNMiFjk4x+o4EnBJH9HBJeeoJ8wjBox+IVpsicDPpSTFXUmTJp0wFm0rHbBovztG3wXEoCLkmUy0yQO35WzQ2Op7qDZfDASWiNY8yzxHU3lYvtyfkbGaxnZZLi69XeV+92u8H2qwDX++R25uV5YK9FyATI2dqbBBsNznbwCq+vaSnheCBmJ2I91/pXljdMx6xoFx7IuyupIMJvlVgsggl1q6Z557NP50PgkYQ+q8MX3PRGgThl8kzKULTOwWSBnWnTJx8R3kVnSkqblxrpYK0x4YXjDEOzvqzMgGx2SyfAKwNpVDUScLlQNhKwC6dyNKH3+j0GgcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvu4wiGJEuCZw5yPZZByPdYswQsk9AinYLvFYD3zbnI=;
 b=JhKpVWrG8QPvGfilq70UIj2Tb/WOYr/5dZv3s+sxdJjdp7U+ZnL25l00iRJc0OgvUrMqMNpohUiqBrsSmHTDDKHjks6eHSSLBG9pExaCwouQw+aSWvqLFZodutQRzS+4pFZPEOlwVj3BuixEodqPy+jd+Zf1NNsaI3Ioou14fukptTEdSdluyMqME05vKMgQqG7ZJuvo4PrwbpjnvcNX3k6sTznK0k0lOJRCA0FNg/jXhFLWsgt6Oc8xASP3EDUo1KaI8zJUVrGkeRTI+qDxLu4w1KknuSaFESVeYQhhZmcjSY7i3FX+Piv/W6eDbSNlSudCS7l9qKwX/c6PQZRxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvu4wiGJEuCZw5yPZZByPdYswQsk9AinYLvFYD3zbnI=;
 b=JTxhLjihLmXqZLCovgXJxx9LRyYLJuigJpkEBjgMnVSfbfyRYLbcoayEhOFD9m4IUfZOOWqeyHsQEM47zzv1NuXvUcea16pvhXNJl/40C5sAtqIE9bOSpqdkWy+uT5v82CfJ/4U7UlCNVZ4IiXRfLT+gp0+4/wvFVLjgfQJliHrELOsFH8C13LW2HJIVrCBeSfmMaFPCJ2dIuMUmpeFudx62SfSwUzCudMTNS6Oogik8rpzsnxi4Zn5FlAWMXAs9LIHpqHkar2Iwqb1Z+j0uFEHP8ZtOtOsrIkKbPMweGKux0TJaTqfPCTovvjIONftYU81wsGALJqnpDv9/mOOVLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:59:14 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:59:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] arm64: dts: Initial support for i.MX952
Date: Wed, 17 Dec 2025 09:58:25 +0800
Message-Id: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEOQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3czcCktTI90yQ91U02SjlNSkNCODZBMloPqCotS0zAqwWdGxtbU
 Avj1QqlsAAAA=
X-Change-ID: 20251216-imx952-v1-e5c2debf20c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 526a6f75-6571-44d2-b0b8-08de3d0fe0e1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXdJVFNHVDZkKzF2Y0VHdUZQb0k5UEZ5ZjdxTStwK2J2VzFDRmtkU2dQaVJ5?=
 =?utf-8?B?cmplVVZMOGlkWVQxS2E5TkJBWlQvQ0dSbFMvcTZlMC83WVNUTjV6R3UzSWs1?=
 =?utf-8?B?ZVcwTG5NbXNOV1VjMW9DVlo3NHFlcW5NNzNOUkFPTFY4SjhPKzE4WlhwQUNq?=
 =?utf-8?B?ejJOSGFCcEMycjNQek5rWWdpVE1xSVJZKytwaXo1RkdHcUYrM01iV3daYUJV?=
 =?utf-8?B?VlE4aHgrKzg1OEYrMk5BZldISG5FUnY1SjFVNE9JUVJhNXJtU2pzcEVoWnMx?=
 =?utf-8?B?UGNHakxzUHJUV3QyQUlmT29OajRwMUFKVXJOa20yMVNJL0tMRHQ2WDY2STFx?=
 =?utf-8?B?Vm92eEgzQlV3UzZiQTVQZVNBN3RnTmR3YTVyV1ZLK1JwZFRieVVlK1M5U0Nu?=
 =?utf-8?B?enUwMFV0SDlTaDNxQlBuRFVXWnFTQVVUV3ZHS3hlNnhqRTRjQ1o5R2pZL09K?=
 =?utf-8?B?a1o2R21WZmJkUmxYSXR0d2pNTVhrV3J5M0YzSm9IR3YrdEdIaDUxeDV1TEtS?=
 =?utf-8?B?ZjdNRC9qQ1NLdTIvUGpvY29pMFhmdTZLMlVkc1k1dUxwOXZpWnAvYis2SDdv?=
 =?utf-8?B?bDBCdHNKQzBVU2JjTlBkN2RBT0JSSFpscjlLRS9nd1E1SEtMMTR3TWx5d1Jj?=
 =?utf-8?B?NTlBLy9KTGxUOE5DTEtPWEV1VVFONkhXSVdIS25TVVpTU2JpVXNhN05pWU9j?=
 =?utf-8?B?OXZnWG5IRDd4Nms5ZzZyNzdKRFgwMkZxcjIrQ0hMNzRzTFY0T3lGNjhqUHU5?=
 =?utf-8?B?N0pBaGVlOFhkSG16Y2REa1dJelN5cURLVDZRQi8rL0RyeVpzYXErWE9weDQ2?=
 =?utf-8?B?aVMyVStNL3ozTDNLYVAxdUcrWXZnRS9rcUVZRlBCdWZzUGJZTW9qbXlxclh3?=
 =?utf-8?B?ZHpiNlRvUkJGOVlBNmZuc3RnN3R4aDVCMFNNdlpiWmxJUFVpYkEzTC9TcXRK?=
 =?utf-8?B?SkhFLzNxdVdlN3Q1bkt1ZXJ3ZSsxbzVCV0NPc2dPeDIzMDc4aS81aDZiNita?=
 =?utf-8?B?ZTBFbXcrbUtob1Q0a0IwU1BUbkREeloxbVhXVGFZRjBZMDdYNExRVHFIUG9x?=
 =?utf-8?B?TzY3RU1TQWhVRi9tRmw0T1hhM0FHU1QxbXhGMFlIendDdFRRSlROSVhRYklj?=
 =?utf-8?B?WjZ5RkxUcUoxS0UvZEJZbGxDbXd3ZVZxQ01uRThtNGx0OUNZNGtZUFN6dEFQ?=
 =?utf-8?B?VmhFOG8xWnpBalhmRWhLQTVGcHlKZmk1cFZRR0dnZGdORjdpSVduSVptQThS?=
 =?utf-8?B?Skt0QnlsSjdpRVRPWEFaVnpOMU11eDE1bGRpbWNWb0VRSDlMRDhtaFNWRDJa?=
 =?utf-8?B?TjBMc3Azc1VSSFhkTmZ0QTJsK3RGQ3d1Y2R0K09ZaXJxZEFuZzFQOWRzUUxI?=
 =?utf-8?B?VzVyS1dFNVBWV2R5elo3TFRxN29QazBKeFhZUXg3NllOTzF1NThuV2FKVUJv?=
 =?utf-8?B?dkFoVVk3THFTQlZ6S3JDeWJGdHBabFcvZno3T3luV1FSWE0vVmlJUWY1S1lx?=
 =?utf-8?B?ZTdJeHlWQXgwL1pSNW5tN2g3bnBkU3ZLYkhUbFFUV0I0bUVVcHgyaks5dW95?=
 =?utf-8?B?U01jWERKSW8zZmVGd2toTVUxM2xmOWhnNjdoMUxMaktXdXJUWFM3NFJwUFpa?=
 =?utf-8?B?YkdkYlYvQnZTM1h3Uk1mZmFLNXJielhRS1luaGJaZjdxeWNQKytydFlhbzlI?=
 =?utf-8?B?b3lQd09wUDBmbTBlSVBnUnFHYkwrbG4vVHFHakE5NXF0UXFiUklvM21nUUto?=
 =?utf-8?B?Y0hyYTloNWJHeUtqalNDalNuc0pJUWxzcDVTRzF5ZjZpMTRTM0pkWEYzNnM1?=
 =?utf-8?B?cU8xZDAwb0U0MWJiOU1ReGpwZ0xaZG1IMEUxK1pVdTd4Uk50VUVod1VTYVVM?=
 =?utf-8?B?V044ZjJLVGVYeHNpc3J5aEJ0TGNNTGY4b2tHbm1xYXZ1cHg3bFQwc3BqcWZa?=
 =?utf-8?B?K0pwaHBKZzhTRUZOZHJVaWMyZldCSERqVDI1aWhqWVFkYVJ3dkszYVRLR255?=
 =?utf-8?B?eFVOMVZJMHNRY2V4Tm84SVFadkRwNnI3T3ExMWQ1YVhiVC85NEpNKy83b2xR?=
 =?utf-8?Q?uWCspn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNqSjdBU1VLeTZmbklFNmxZanlnNndRWmlmSitoMjJmZDBTRjFsbGFFSWkv?=
 =?utf-8?B?NmRIbGxXS1NqVWo3YldyaVpHV2pLa0Zsa0hqK0VUVmFRLzZDSlVFSElIcVlj?=
 =?utf-8?B?c2pjYzcrS0E0UEN4aVpFN2RCUDU5Yk84eC9UYWowc0tJMWQ3cG9FVkFkdHVP?=
 =?utf-8?B?cTZEc0hPbjVkT3VBWGNoWjRTYVcwN3lWTWh3aUxaQllxZDY0YmowNEovUkZF?=
 =?utf-8?B?R05rc2JzQ0hWUE42bTdnWk1yZk0xQmtja1lUVDRBOUtsSnJOSEZvRkI1bHo3?=
 =?utf-8?B?ZTlDNGd2YTJiV0EzYnlUcHJOaXFoQU5MTk8vVXlodUNubVIvdjVCTy9EWHRr?=
 =?utf-8?B?eHU0OHFaazE0VDFpUWI0ajRuY2xjazJXeEFkVnFYNU1KcEF2VmJ3aElFZFRm?=
 =?utf-8?B?dzFmZ3ZxdXZHWUloWlBWaTB5WEwvK09mNUhzeUNKQ1RwMDE4VVBtUWppVk9m?=
 =?utf-8?B?emxVendjQmlZemtoNlZ1WjNkN0xJUzJSdGwxN3JvRG9uQ1EvREp6ZlVNK09w?=
 =?utf-8?B?U05oQjcvditmcnZpTjFJNzMwOGp4a0JMdzVSU0x2UWRuak56RDlIVWNkbEJZ?=
 =?utf-8?B?TlFWUWRzTDZZeTAyN3FDUVlIdG5VZlFtSmFOQmliS2w5YnVXK3JSdk9kUklh?=
 =?utf-8?B?Q0RZbVR6TVA1ZUZ6cnRoYmRQaGRMZlQ4cFoxeDQ4dFF5MXpBemRUMnZkME5U?=
 =?utf-8?B?YysweXBkL1pVKytxWE96UFpKZEFoa2ZXSGZnamwyRkNFWWZ4N0ZvYk5HUEpE?=
 =?utf-8?B?MDliclEzRGEybWJJemkwQ1hrZzZQK3FsSFhyblNHY2p4OEFaUnhsSDNwZHQ4?=
 =?utf-8?B?VCtjOGZFM1ZSRFpvOEo0dnZYMkQ1MFpSYWRtaGlMdXc5bXNyb1dYK2h1clow?=
 =?utf-8?B?Y3lQUm5jYzFuR2RUaUZ6SUlhYThLWE5ZdlhvRlNCNkVjRWFDT3MrdXlQOE1X?=
 =?utf-8?B?WVV5Rk5BYlpndEJibUtTTjVML211QmtmdW1nK29LUElLQ1ZrbkRHK3Q5T1dK?=
 =?utf-8?B?VnphRHVrTkVjZ2RrYy9BRmpEUVZFZUtVeThNbDRKTHZ5bTdGQTMvUkxrbnQy?=
 =?utf-8?B?QVpRcWo5c3loOGNWa2dTa1VUb0FOZmtZVEVwaFJKdVZ2U0JnNVB1bmJDeFRU?=
 =?utf-8?B?Vm5qR0VXK1ozWHdZeGg1c20vWHFYeFFweWdvYW1raUQxV1VPcnY2Y2QrZ3Vz?=
 =?utf-8?B?Qll4Z1l2ZWVhWGQ5cDNlZFFseTY3Z29kNWpLTTlSYmkyRnd3QWIxNzU2YWJV?=
 =?utf-8?B?OWd6YTZIT2xjcnpXS3p2QldPNHAzSlZiUlFEeGlBalJ4YVpNZzREbU5ieFl6?=
 =?utf-8?B?bzB6a2E0aVZzbjJ0cGFuUlF0a0wzLy9wb3pJZU1sSjcrVDRTcDZ6d1hSZ3p2?=
 =?utf-8?B?MUtSYjZnU05uTmM3OEEwWUVlbmV5TTV2RFRuVWlCcDNINTc2S2JZRWNmZUpF?=
 =?utf-8?B?aE81dEYzYkNxMUQyZ1ZoYjI5UFpvQ1N1aGlrckZnL2JUbGRSVnR0ekRYVTRH?=
 =?utf-8?B?YkI0UjMyakdSbjFMUnA5KzZ1dGIvUzl5VFNMVm1lM0wrOFZnYzdnKzFRY2Y5?=
 =?utf-8?B?bG5BZThCbUZkR2RlZU4zZGtWMlRML3dHbWNKblNpa3BFcFFDbnE4emR6NTdn?=
 =?utf-8?B?eEVBemVPWVNWSDZ0ZEI4Z0NlR1ZWeWVod0EybXpPSy90OWF1VXBva3ZVdndC?=
 =?utf-8?B?OHI3WjB6NUJoRldVTG43VllKK1ZuZlJNS0ZXMG40VEgxMW83YTA5TUp4RGk3?=
 =?utf-8?B?NUNmUjM1OUdVT1VXdHRBelVndldMQ2xjRVBTQnh5TEpIZ2JpWFF5SHNjb0w5?=
 =?utf-8?B?Y2MzV0o1YUVVbTN0UzRTbitYemtpeUhQSjNxUDBLV2NlYzhGUno4WllmVDRs?=
 =?utf-8?B?dVJXOHBJZlZGSmhLVkpQNXR4aDBPdmVqdXFpcWJDUUl6NFViYXZpZlB0dHJJ?=
 =?utf-8?B?eVlQWGdVeEdjSU82OEo3bVBCNnVLYnZOTkNJVnN1Qks5ZjVHWmxXU2NWSzl5?=
 =?utf-8?B?NnA4S1FweSs2ZTRvNk5EblRuWnV3YWFCdER1ZlhNdHU0aWY0SzJRRjZKTG5M?=
 =?utf-8?B?NGpHQitoOU91STNWTjhwdmxFUFl5dys3QlBwYW1lQnhsUHJTSHhaRmJxSkVL?=
 =?utf-8?Q?UID/8knH8WLOJ+kSOWytnT8+9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526a6f75-6571-44d2-b0b8-08de3d0fe0e1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:59:14.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLCeATbYttv9T0IsxwTivStdMaCEdZzNbMG87kz6lRDHg2Dtb+7PU8Cng6AdmQfkqyy/dmFzHVzvq7W67h/l3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

Initial device tree for i.MX952 and i.MX952-EVK.
i.MX952 is designed for AI-powered sensor fusion and vision sensing
applications, it features 4 Corte-A55, 1 Cortex-M33, 1 Cortex-M7 and
NXP eIQ NPU and advanced graphics, video and advanced security with
edgelock.

Product info could be found at[1].

Note:
There is checkpatch error for the pin headers:
ERROR: Macros with complex values should be enclosed in parentheses
checkpatch.pl maintainer said "Just ignore the message instead", see[2]

[1]https://www.nxp.com/products/i.MX-952
[2]https://lore.kernel.org/all/fce65a7761fb0e880beb469e2521598f@perches.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dt-bindings: arm: fsl: add i.MX952 EVK board
      arm64: dts: freescale: Add initial device tree for i.MX952
      arm64: dts: freescale: Add i.MX952 EVK basic device tree

 Documentation/devicetree/bindings/arm/fsl.yaml |    6 +
 arch/arm64/boot/dts/freescale/Makefile         |    2 +
 arch/arm64/boot/dts/freescale/imx952-clock.h   |  215 ++++
 arch/arm64/boot/dts/freescale/imx952-evk.dts   |  217 ++++
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h |  867 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952-power.h   |   44 +
 arch/arm64/boot/dts/freescale/imx952.dtsi      | 1248 ++++++++++++++++++++++++
 7 files changed, 2599 insertions(+)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-imx952-v1-e5c2debf20c4

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

