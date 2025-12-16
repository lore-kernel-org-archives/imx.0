Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF9340A64
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873369; cv=fail; b=op445B9ItJnokBcVMGU2e8RuRWqCOfbvaar6SXqnA92vObAJfkGo+auyeRQsrteeivBRJBB5UMV9Svs/JnJkFZghUlSBzz9/qr8Inuk7oWu9NvgGb2AZPnEQgk7k2+F8Ex/K8FdlpGJcS6C5xZ6F87T37SN9tqIES+H3KeH8NBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873369; c=relaxed/simple;
	bh=R0aAh9hW2wvvkVTNa9cwa3VnZl0oqQezxjGZ3HsZ1tM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wx3hi3j/pCvyJLlU4RTQojMZYJqfKaggT1bTWiy8vriuzIlHhF6MUbwDjgtH6M4VjLyXcSpHTPqRTUZm7aHAqLqLMqW8gSdHK15KTOk0DEGOZWHR4zt/YQuj4/WMf6pOYtrEUTjgfrzYWNstnw17/L47vOBR+Khvax96ZT4dXvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=KKu2aSI+; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="KKu2aSI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVzPdImY52wAcvZej6c2k642Zwqc4DRoFudiI0bySiyPrfpxmpnINpTk4fRd/6Lrb7aj3AShqNRsrxn+UZiz5GE1VKHRepIe8DpndTwbiyJNvkvVvha8ptlcn070W0FfL2HDoaPxtEvXs+9NcKtxN2X2rTJ/8Pi2yAGqLKjzlSfMylHFz1GFRKm1+hA3XJXpYN4adtEOqtH7Zco55i8rBZo/+DHwKDKE/Z/x0LUhBfg04mlQkrEjenvYatZfY1H2kNAXPHKDCKJ45mEHTNT+KsyOup5Nf7tHNutJq33FoenXAPBLHp1Jga7WwehKgHixvH1gGsBvj4/YS1LpZ2e8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBPirJP9BMltC+GujqIsXQoaR1gomu0P7FrdVwd3oV8=;
 b=MRNGwCMEM+M8peuF0z4VtikdtZgAoiai6DmKo4L+QKmoblql6MqAlwePH5AnTl6sIqBezhp+W5ioA/y2WGZ86b6Q2O6kbQxia3hJO4fe9NGNrJQa/J70joPcRo38ZVHrf4BbkFuSAGc5C51s6932Q8iN7WbCy8pkovNTBko+KgnklKTnvB+o9cFcOFIVmqD+0l+X7lJemXd3Q5NfPMG97j5f62DuyJgvefsKMSWuUIOfX/8msdu0LpurWjLYZyXky+GETuZO+v4mn6KeSwKvz/2dH32KMOvFJ9ESkPA/0LkVKaRiPus5f6o7s+QH9eAORP1p1L+yxkCldRSHmcSedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBPirJP9BMltC+GujqIsXQoaR1gomu0P7FrdVwd3oV8=;
 b=KKu2aSI+CwvXMiwhrd+HtpBhDZM+we+rB1a6T7epSiyETp9QphgL5eKo6tRY9Xa+kZTdqtsVMwSrWm/WJeX5WEXpltt13UUWHer5dhMxYwHks5pZDt6txC0bMcBKE5IiiLbWoolSgc/5k5LHYEsQOXaDFwcEkopzauLAjdU5x8AzNINpKgmQTwxFKUtUfnGLFyyq65XHIP6vO14yCRfHbVeR58nsmNu0rlZ0JgCpKI8RvklBMYRZ0IKYwP+4B2fTU9xhXYlrcK4E54ALVu3vCiXKGtE5pmnXiH/z3mIhoEyXdbh3SgV8lrmCK6pBgqgCjFKP1475vlgQcCYzZ/zKDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from VI0PR04MB11748.eurprd04.prod.outlook.com (2603:10a6:800:2eb::6)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:22:41 +0000
Received: from VI0PR04MB11748.eurprd04.prod.outlook.com
 ([fe80::5a4c:391:3df:9ffd]) by VI0PR04MB11748.eurprd04.prod.outlook.com
 ([fe80::5a4c:391:3df:9ffd%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:22:41 +0000
Message-ID: <f1e63d1a-e111-46e0-b615-3780391661d6@gocontroll.com>
Date: Tue, 16 Dec 2025 09:22:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::11) To VI0PR04MB11748.eurprd04.prod.outlook.com
 (2603:10a6:800:2eb::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11748:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: da7f035a-80ce-4b8c-3062-08de3c7c47d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU1YdURnME5rMDJCRmdINGFkM2tJVE9VMTQ1YUVycjMwU2NjaUxIdTcrU2dl?=
 =?utf-8?B?Yi81cUpmMHNJYUdsSzZnS1o2RWhXRThObkJYQTFsMTJZSDNEOVlKK1BPbmNo?=
 =?utf-8?B?RGtLeDdmSU5lZ1dPMUdUNVBiTS9kdFVWL1MvOTE0RGFJWExMR1N4M2lqRUlR?=
 =?utf-8?B?YStZUXdMbVU4WDA0aHRHSURXN3ZMVzllbXE2d0xVUmd1dFl6Yk4zOUo0WG5H?=
 =?utf-8?B?NVJpOG15YUxlakhVeWVtaG96aUpiR3ZIUGZidi95VjNnam5BTW5LYXhVSG1J?=
 =?utf-8?B?S2o1UnJ6VUM5blMyWWx5TC9RSlZWNHhjdWVxVG5QWDBJVCtONU4wd1FBS2dZ?=
 =?utf-8?B?ZXdhUUZjbUVTNWRJazZMZ0gzbWVvbEpOeCs0VGlSWWFxOXRzU0tuUWJNQU8r?=
 =?utf-8?B?b1NGcEJYOUVxSHltdFBLVkJjQkE4WGUrdmdFWldvWENTN1RRV3lwdGNwblFy?=
 =?utf-8?B?ZFA3Y0ZCWnpkcjNNc2NOalIzVEFtcitkeU0yRjV5T0RrbG9UWi8xc21RbWlP?=
 =?utf-8?B?UC9TeUx0cERuRUkyUGF0TldDTHVGdXAyVHNYd05JNDcyaGVSMjlyMFRuQU1q?=
 =?utf-8?B?aHRFVWtkUEZleWJCczcreitWb21CbU5kdk0za0YvNXpkNll5NW1QcENNV1p6?=
 =?utf-8?B?d3A0SVgxTkVoTTZnYjlVNzdEOTRscFlLL3crNEszbXQvU3dwVlVMaHNxNkZT?=
 =?utf-8?B?SitoRmJDODk3SHhGSmNDYTJOajVqSzRucDExY3hCRlNyT0tnaVluWTByeXFT?=
 =?utf-8?B?dzMrUnJLZXA1Z2N6QXBnNU96U2dxQ1M3b0czVlJrWjdObzlGTVRpRDBjY0dm?=
 =?utf-8?B?OEVsSzBVSGhpTi9nWnNoRjN0bFlzZEhtVUt1alJwbStzUUhXZEN4L0xhSWJ0?=
 =?utf-8?B?RmgrNGdiamxVUTlBZ0tQVTRVS1FIZko0UFhPU3NLbmNmd0tFKzA0R3hrS1VU?=
 =?utf-8?B?YUl0MVRya2NmdUluU1dnbGd6VHNiMG53UFNKQjV4SUxwMXIxTG5yUkh5TG5q?=
 =?utf-8?B?UTVBK2ZmYzdhRSsyNHpoM1FoaEMwcFA1djBNcmhiUXFJdDZmR3d2OEUrOGZh?=
 =?utf-8?B?SUQ5UHU3eTJlckRVMGRiSTFETFJVcGFTU1ZZQmpkZ2EwNXdiQjU3NlliaXVr?=
 =?utf-8?B?eFBmT2xCbWRiYUVzUVhFaHBGMTl0MmE0QUlYYmk1U0F5Z25URGNrZ3NaSFBh?=
 =?utf-8?B?TVN2MjRzb2RjMGNWQnVDbDZrLzc5TFJ1blFqeWZqMjBGb1VRUXVBMTJ3TS9l?=
 =?utf-8?B?SnNKemx0anVjSmFDcFpacUJ1eFNGajc2b1JMaFdVSTBiV041NlcrUWtpNFU0?=
 =?utf-8?B?RFB0YWhxVjM1WkhzSWsxSEYvc3pSMzZXdGhLQ3JZTVFUdlBUTFlOV3l4YVlZ?=
 =?utf-8?B?ejZ2bmE5b0NSWVZmYXZFYnpRUUVRSGt0T0xnRGUyeHhhMUVvZWNIVitLTTg1?=
 =?utf-8?B?bnFCb1ovQVNzaElsU2dLdU1hejRZZCtXRkF2dHlKd1NudEFCZW9Dd1BqeUJ4?=
 =?utf-8?B?YUkvSDRDbWFjSVdCemovK1ZDYllJRlQyTnd1UTRyd2lUVllJSmNvNTFubnEv?=
 =?utf-8?B?cFBQR2RvSStYK3JHZGVwWHZCRW5TTitmSVdSclMyTUxYTjRsM3NLMjM4WFlO?=
 =?utf-8?B?dDBTb0g3ZzM5bkczdldYZFF5QjZIZ3J1THYrWFArQ1R6aTBDVEJGNE85empX?=
 =?utf-8?B?TmhkRG5EWVJNaUR1dzNTYUVKcHA2R0E2cldMR3RkV2RXRTNBVjNnWXB0UWQz?=
 =?utf-8?B?V2pnT1BVaEFlcXRQVlZNQkJNK1R1bFNxSm15cjBzMXJJdlJQY1prZXAvUHNS?=
 =?utf-8?B?eUdsNTJ4TzkrRjdUd240bHFwZTVzZDc4N1ZqQWtjeEI0MXRwcWdacmN6MTdO?=
 =?utf-8?B?Q1h5QjRuWDZHQjdaL1lFdXJ3djVLaWNEdDJGQnI5WTNrU1ZBYU4ySXZ0VXlE?=
 =?utf-8?B?UWxPSHh4MXdZOWxaeTc0RnpvSkpqZlpzQkRQMU9sZnJSNTNZcGNmMTYvZUw3?=
 =?utf-8?B?aWM0VERMWFptYkhLZlZkZjU1WWhZcEhwbWk1OE16em9lbTh4c3pibFc4blMw?=
 =?utf-8?Q?g4nEo4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11748.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE8wemgzMkw1WmRVMzBEWnliTlRoRUNpYmU2dURKMEU4Y1V6K3lxTUtWTmlP?=
 =?utf-8?B?QjlVdHJNOGpnOXBCck9wODFiaHdjbGg5a1hhdHQ4d2FoNDNDZHByZGJXR0tq?=
 =?utf-8?B?YTBpb0pHL0NtVUJLMmczbm41VFBlNDcvTkxKV3VlVHJrNWNpeTlrY2xkM1Yx?=
 =?utf-8?B?RlFxNC9vMFJELzcvQ0RiUGpwV3BDKzdMMXc0dDE4cG04cUhmcGZ2d0ZqYlRN?=
 =?utf-8?B?aGNpeXZyUzNLOWxwZ1I3WFVDRHNoU1oyVHpQNzE3QVM0ZWNxM3FzbGlFbzB0?=
 =?utf-8?B?TXNXeWNPYzl1OHhrRmR1cW90MVpHbTJldDlOVE9COXJ3U3Z2cWZHUkp4b1ht?=
 =?utf-8?B?SEZPVUVDZlRhRDVhTlZtQ1ZHeEtoa0lwYW1GYkk5MU5HUFh1TVZ4UmhqRVdh?=
 =?utf-8?B?R3JreWdxOFdIbEZXUFY2dElUcyt6am83UDF0L201OEs3ZGNuK3g4NXZ5akpi?=
 =?utf-8?B?YVZ1eGt2TGpqNG9Ia1hFNXdMb25MMm9HYjJCb3RmYjc1NUVNNUlHTXBqTFN0?=
 =?utf-8?B?RTJibmdkeStLL1ZTTWZWWTlQL3VVRGgwaEFFcWhRb1laK09zQXd3bU9QSTZa?=
 =?utf-8?B?cG9JL3M4UWtNK3R1SCs2NzZpT1NTMFh6SU1aYWJwY1RZRG1OdE1lR1VINExV?=
 =?utf-8?B?azIvUlBkd3dBcXhhVjgxUnVVcDNSa2JaaUpiZWNEMFg1bThaSUsvQTQzNjRJ?=
 =?utf-8?B?SkdwY0xDdGZGdTZ0ZjhFeVRWN29yVlRDVEdDUjgyc1E5WS9scUxtTHRFS3RU?=
 =?utf-8?B?bUpRTWRPa2pCT3hKRFZxZ202elVJZy9kQjdYUWZIbUZ5aFZmcDlzV0hORE8y?=
 =?utf-8?B?czhFYmpJRWgrbU9ZSS9PazFZU0gwNkpJRFhlVWdsODl0NTg2djg5cmdhTkk3?=
 =?utf-8?B?Mk5DR3BHMnI3V1pHc1ZMN0lrOTlqR1JpY1BKZmhLWTJJS1FsM05TOWF4bm9x?=
 =?utf-8?B?bU5Jemd6Q1ZtWnd4QUttNE9YSE1kYlNOeUtJTzhjelFZRWZUWnFKTE8rc0V6?=
 =?utf-8?B?VW5iVE13M1ROd2tuL3RQaFIzbnJzbjEwSG1DNnc0TDczdlpaT0J6RkVDY0Y5?=
 =?utf-8?B?WHhQNkFzdTcvNnRXQlUvZTJ6aExyRWo5c29uMzRVTXBoMnM5QzFQRVFVWjMx?=
 =?utf-8?B?a3ZKUTYrSTR0dzNQVEs3MU1KU2ZUUHk4a3NFLzYvTittLzUrdVB3TzVWbjdi?=
 =?utf-8?B?Q1ZoZS8vM292bWh6SVd2TFV3Ris3L1Z1dUpQWW0wZ09KS3hHY09NV29DUmll?=
 =?utf-8?B?NHpzWGRlbVZRZHEwWmZ6UnRzMzlUKzc4RVZwOEt6aUVESFJqdytaOVpNeEpx?=
 =?utf-8?B?OFh1NlB2ZnEyQUozbUh5TlpwVEpCYUc5NWlmRklXQ1FyQ2ZTYnUraS95emtF?=
 =?utf-8?B?T3NhMHFacER1QXloOWtyWkpKMW1ucU5EZTRBdkd4SnEvbHhkREZRVXdDVjMx?=
 =?utf-8?B?QjJNZzNNSC81dTQyQkhZazhlWkZaTkV0WmxPODgzQUVwU2lyREllTWRpVXRx?=
 =?utf-8?B?aDJlRjN1d05uTlFLRnlQVkFzdnNQNGgrNDJiZitKWUUyT0UrZERsaVhlM201?=
 =?utf-8?B?ajBEVjBSZVkwNWFIUDNydERYSkJMaEhXYzJSeks0RzdSWjIyYitaQ1VXak1q?=
 =?utf-8?B?bmhKT0dsc3JFd09LOTJLL3daeXRoUjk3N0tXc0Vnak0zYUQwaXRaeW03bjhO?=
 =?utf-8?B?ak1RRGpDUGd4ODdmWUVYZmo5cytqTkVLb2IzTFJKVVVnbllwbmVSS1h0SWxu?=
 =?utf-8?B?UXoyMlJFRjlOWFlmMUFPRWkzT3FvSzNjMkYyb1I0RFNXQm0zSjVuaVJXMnN3?=
 =?utf-8?B?UTVpSGVIZStxMWhLS2RzVTVPcmZOWFhOb2hza3BHZFFKR21SY1FxTk9JWXVC?=
 =?utf-8?B?NTBpRnpxeCs4Y1VrTVlDbk9CSUhKVWppRHhtUi9XcGhJQmFEdjRaZGlqakht?=
 =?utf-8?B?aEtFQWdTcWF3aS84UkltUTJGMDJXN3EybkhoeDhCSFlHYXRUN3RsdmZXSmJQ?=
 =?utf-8?B?SGFRK0VSVEZTQldaT2hOcWFLN2RpU05oUUs2TG5XSmNHOERFSGR0ZVplWFhv?=
 =?utf-8?B?U1lwQWYySGIvcVRGWG01ZUdWelpmelpnTWdaUzNyVWtjdWZsUTFBNmNiYTJC?=
 =?utf-8?B?NmtZcWVjcVVTRXFIYzZ1M2hUWWRYNU9MUHMrYXErM3E4eG5icDYzekFrSGls?=
 =?utf-8?B?OFpFR2hVWGVaUzIwaGxXdG1MeFRNS2E0dkNaMERQSE0vcUNPNnRiM2kyaDBV?=
 =?utf-8?B?eXZSWGlTMExyV2RHVE9NRnI0OU5BPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7f035a-80ce-4b8c-3062-08de3c7c47d3
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11748.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:22:41.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wUN8I8mevCji4NJA7tYWrOwNG4c+kFR0NxdAcCyrAzmrOuNbZDbdQ2ib0TD7oD0HpmBVJmAkoziioXfUgkxh6+7fSnjC91E4waZSx43fdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

Gentle ping after a month of inactivity.

Kind regards,
Maud

On 11/17/25 16:01, Maud Spierings via B4 Relay wrote:
> Add initial support for the Moduline IV and Moduline Mini embedded
> controllers.
> 
> These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
> features an imx8mm SoC.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Changes in v4:
> - Fix BUCK6 property order
> - Change the BUCK6 min/max voltage to match the dram specs (Lothar)
> - Make it clear that the two systems are based on a SoM in commit
>    message of the dt-bindings (Conor)
> - Drop merged PMIC fix (Matti, Mark)
> - Link to v3: https://lore.kernel.org/r/20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com
> 
> Changes in v3:
> - Add patch fixing the pmic driver
> - Use the proper feedback properties for BUCK6
> - Slightly rework the compatibles, acked by conor dropped
> - Add missing CAN interface supplies, remove the leftover comment
> - Add missing vled-supply
> - Add missing ethernet phy interrupt (doesn't work)
> - Fix the cs-gpios properties in all spi interfaces
> - Fix the order of properties in all spi interfaces
> - Remove unused labels for regulators of the PMIC
> - Link to v2: https://lore.kernel.org/r/20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com
> 
> Changes in v2:
> - Fix allignment issue in imx8mm-tx8m-1610.dtsi (fec1)
> - Move phy-reset into fec (works better in barebox)
> - Make the gpio-line-names groups of four on every line
> - Link to v1: https://lore.kernel.org/r/20251009-mini_iv-v1-0-f3889c492457@gocontroll.com
> 
> ---
> Maud Spierings (5):
>        dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
>        arm64: dts: imx8mm: Add pinctrl config definitions
>        arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
>        arm64: dts: freescale: Add the GOcontroll Moduline IV
>        arm64: dts: freescale: Add the GOcontroll Moduline Mini
> 
>   Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
>   arch/arm64/boot/dts/freescale/Makefile             |   3 +
>   arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
>   .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 800 +++++++++++++++++++++
>   .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 688 ++++++++++++++++++
>   .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
>   6 files changed, 1976 insertions(+)
> ---
> base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
> change-id: 20251009-mini_iv-a05e5c2c1223
> 
> Best regards,

