Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF920B7ED
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765519405; cv=fail; b=mu2qMJgw2OQmcgHqJ5JoPArBDqNaXYYDYZ0KHCbaANUYYgGijrD6yU/a+3bVIejUDZ5SV/1cg9pagcTPUw4JqmNHeu3nv2Vwp+1R5hmOkjFJTARyBgYuUYz9GKTEga9WdqeaRfTwCFlx2x5f9RRLn0eEIAeZuZZ5utLYhO30kTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765519405; c=relaxed/simple;
	bh=P+cQIePjV8PVoxJegg9llOFbVG9X9f8rynJScNDyXmA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZcyaBGfvfGa92ORJfUXXx1s2KoJwU+3AxsJqpjtz1twYQIOdSOl41z5om73n2fopVSNw0+XELsmSjqtMuxPIWxc+UvBgUoFRgCtKcgIfbW25rarlk21ZHuTX84bfCZmd0ztScxFGW/YZmfmJ7uSta5kP2NJdK4m2yN1NLexK1cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T/18sP/U; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T/18sP/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktvBjBnQK6+N+Mn9XUAUmKEu+1XAdOSDEdTQxj6W2i2H3cQmHege+1fo2q51Iw6W45I+xw4eztRko6pyn/5yhN+8Pz+nu0udk8FIgJMfrIdyQ+VhZGJvA6uAcP1u9SKtTfq4r/xzYFh54Qw/u6PG1TS4n4h+B5x1DnXtzP+YHmnt/7PJWTsNxnx2ACoHG7wu6A0vvpYXdwABtFZBXVHQBSeQPXZw3MiM1RM2f8QZE2R5nZj0VDyINzxCd8edeFjI3Noe/0WOu8dXJWifcDsRancUsnxMuUf9EWENas5PRa1yVQ3lqRmWsm1FdEWSbFegEhYzREk0dU7ZuPEqApnFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WFuhxLerurlslVE7Q7CDbd43C53FGHTP0/eUN+oQic=;
 b=u3uKt/BJDXm8iAzbAV7BSUeMxoHHH4ZuE6ifUr5tSSsPSVFrSB3JDY8peWeMTa+ktSzZ+/C+uLWS7D/BEKOg0KQXF5fq0Bk6tK3LZ33tFQVSlUYPD+gZqxCGL5ELPH9Y5XHiQGv3hY4qoSqgKK+XGAZP5Dwr2j6NHoOagPC/Am5PiKuAnIKssdv/Z2xIIj/AAMT/1Lyd4L1+mBzIRZi0LTY/3joI814Qo28CUVZ3CUZUzpAoCGVkgmN8ADCkHZVDTTRsmenc6mXPNeV5HntwtxOM7tdUx/FX6Nr+vPnCZUhgT61W3METQf2pZ4OZdIsNvC3poGyed9PTFqTdHB+YrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WFuhxLerurlslVE7Q7CDbd43C53FGHTP0/eUN+oQic=;
 b=T/18sP/UkTQtlMXgQSkbapbvFn0LIlM561EEQQdTRp6mds0uoSWnJfUfSe5TYA+4/IhWRjcK1fGk+p9CJTdhcIGqHxfsgwtKER3Ije1Io+/svDoQs0T2yM4hoJMVCqkF8Cs0kAFWPrdCmYlWwQXK/5/Mr0ljq/ehzDC7sGGdJkAfCT8VZebZx4fhubTDuoBEPHDY2NTSNH1BqTR+c3ffp2vJFEJspp9aswv3tv6Dty+0Z266X8gqYU3NOfLwvSHyIK36mUqebudYb3hApFZMFSkP/ljxi6XkwJazBvWx1cJ/+V7kEc1KQxjEn2F9iAHZfBLAOxOblYqLGejIAWLWzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by PA2PR04MB10240.eurprd04.prod.outlook.com (2603:10a6:102:410::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 06:03:18 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 06:03:18 +0000
Message-ID: <15608952-e974-4b9f-9832-e6a23860fc62@oss.nxp.com>
Date: Fri, 12 Dec 2025 14:03:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add FRDM-IMX91 basic
 support
To: Andrew Lunn <andrew@lunn.ch>, Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Justin Jiang <justin.jiang@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Tom Zheng <haidong.zheng@nxp.com>, Steven Yang <steven.yang@nxp.com>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
 <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|PA2PR04MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f86094-07d4-43b3-7b9a-08de39442577
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGthTXVrTy9NVHZWMnRPbnd2TWdYWVRQbUxPQUJ6MCszbHE5WjhhN1AvcXJv?=
 =?utf-8?B?U28xZHdZVlRVNzJmN1NpcUxsckdGdFlPZnAvK3Y5b1VpVFZaYm1SNU8rSkdD?=
 =?utf-8?B?RkI3NHE3WUpZek50WmQzc080R0pCdmhZdUN0bWF2QUdkd3dCN1kyUGtkR1RR?=
 =?utf-8?B?QncwWTUrajdlSGdzMUJTTWttYjRGSmdqSkc1NGxxdWRweS9wSDBFWEJ3djha?=
 =?utf-8?B?bVYzWlpvUFR6YjUyTmVnRHA4VEV6RUE3cjZWb2pxYnBGa2pPaVloTkNkNUZF?=
 =?utf-8?B?bnJOR3lRNlRVUmtaVEtqMXhidVFlNENBTlU2bkVRTFYzWFRqaUF0QjVWbnlI?=
 =?utf-8?B?VW0zYlVUMk9hcVhiUVN0d2QvcXVwRVgyV0c3YzZqYVMrWVlVRS91aStKMWh4?=
 =?utf-8?B?cmV5aW0xRmpYMWN5MUFMV3hFRi8rdnBwYWNsMUFjV0VqakxKcFFwR0h4QzFj?=
 =?utf-8?B?M0JmWE5SVExYRnFzNFg0WU1EUkVhaGdUMTh6aXQyZkpnZldDYXhESkpiZ3I4?=
 =?utf-8?B?VjhONUhtY0VFWTU2WUU1dnVjcEwwZ01VWmZ4N1c0a2FlUTU2eW1HeTMvVFY3?=
 =?utf-8?B?YXNVb0w3ZnlHeWRuT29SdWJaN0lsajE4dXh0L1R0MFRaOHpJN2lBZlRUN2tq?=
 =?utf-8?B?QjRoSnBtVVVtR3dTY0NQakUyOVVtdGMxN3dpejNlRmpMQy9lS1ZXU1FxWlo4?=
 =?utf-8?B?bjJ3ak9QUG00SUR1eU5ORTFCc1hWOE44NUdYa3c2RCtDUUJ5T1FhZy9ZTzZw?=
 =?utf-8?B?MUlSblhxVEZjY1FkbFVEdzlpN2pmKzJLSUZCRHhIcU1MeXAzZVZHb0piZzdh?=
 =?utf-8?B?TlQ3dUlBcDhVeFhrMTkwMXdJWVZZRUdmOW9LQkgvVnloWmQrRzY4UHFLd2l6?=
 =?utf-8?B?N3ZKQStkQUJ0T3R6ZUJ2UE52WXhNV0I2cWd6bzRwWXZ0UlFkK2lZeVE1Ui8y?=
 =?utf-8?B?SFVPVGtpaUNBUHc5Y3RKQ01tMWUya1ZVb1Nka1QrRXkwVjhZaUJEcDF2RENP?=
 =?utf-8?B?My9HaXNLYWZuWnp4WTVFYWJMc2QrRHg2UzE1aHBSbHhNWWp1M3RNYmxyM215?=
 =?utf-8?B?b0lYNGFSR3BLa1F6MGU3U09MQzVCdnhkMzZlOVlIYW1JaWZDeDRMSUlTK0Jl?=
 =?utf-8?B?cy9KRzFXWXRxQ0t4TWVvMW9kL2ZsRk8vbCtIdWtRUDRLeWtmc0labGFhQ2NK?=
 =?utf-8?B?azlMdkErTXhxU0xHdnpRV1hXd0liUFNFVGxnbXQyYnI0c3N3T3lRWnhIdmQ1?=
 =?utf-8?B?RnAzU1B2bzBabUQzdC9FMEtMN29kRWFJVXYzSmw1UHVvZ3Y3NUNDdDJhVVdp?=
 =?utf-8?B?Q2Z1NjhlNzZFYVZ6aXM0bDVva0F2bjZBZzRrZW1sMGRrMVJXeHoyczYxUml2?=
 =?utf-8?B?T2FoazJOUUIyKzZvY00rbFVpRkQycmxhM1ZmVTFEalM5UEYrQTNDbmtnMUJB?=
 =?utf-8?B?Qmx2czE2YXhLNitscGV3b1F1TmFyVlZlSHgzeFRhc2hqSEZpdVBRQko1SFlT?=
 =?utf-8?B?QjZENnA4Si9IU3l2N20ycVFrd2ZhZjAxc3RHVmxIZEl5Yjc0ZmI4VEI0bElK?=
 =?utf-8?B?Sy91SWhiVEJnZndJWHVPSVowaTZraGo4cGpScmRXdmJhV09XazJQRkpKNEVN?=
 =?utf-8?B?STlSNHlDWlgxUHVOdXBuYmQzUkJidnRKMC9KTFFrRW9kL0hHV1lJK3plSXZm?=
 =?utf-8?B?QmFlM04rM2ZWdkJzVlY0YzEwb2tMeTVUZWJjWHl1cGRyaW5DWHNpbEQyRjZr?=
 =?utf-8?B?ejdzUDhHUDlIQ3QvMnN3WlVlM3VwdGZUVmRyZ1R6TlZxMmJFOVl5TzUzRlJs?=
 =?utf-8?B?NnNFWWJpVmpGS3lGcXNydnk1ajV5cncxb0xIcDh1ZS8rNVA0bkk3NmhNWFdr?=
 =?utf-8?B?MzcvNVJ5SUg3OGlqZlhxdG95Tzl3U1Q2RUM1eUpaUzBUZXU5VXk2a2tLSWVn?=
 =?utf-8?Q?1jokhX1c9WFiEX6it+jNGpCgD4j0vLdB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RhL0R0V08wcDVEeVBTSFBxV2ljMXRHTXNzSWFHSVpISC85RWc4ak93ZWpM?=
 =?utf-8?B?Um9UNE5vRXA0bzBaS0ltZUpYcjh3SnEzRm8wV3JOMFI0Vm1YRjIxUnRTUUJm?=
 =?utf-8?B?RDgvTUxYN204UzZBTGJzOUZUVE1GeGo1aW8zalRlQjVoY0h2dEpnU0RZMWFj?=
 =?utf-8?B?aGh3emp0UzNRcm5VbXZWL3M0MEk5ZkpUZ016eHV3VFlINVJFa1ZKa0toWGZa?=
 =?utf-8?B?bDQ3WThaa29KeUdMVE9CbU5kTkJkQUwyNFFKRk5IeW5MVm1vUmJGbVNVZVd5?=
 =?utf-8?B?d2h0Z04ybTJyWmdjWkd3aUxsUWl2WkZiQ1R5Z3FXWlhoRnpobDNmSHlYMFBM?=
 =?utf-8?B?U25WMyt1UHlPZWl1dENPQXlxV3ZyUEVuOXVGZzAzdmsrNlhRR3BwQ0Ewcml1?=
 =?utf-8?B?dlMwa0pEeGx3dGNieWlNWWJJTjI4NTdqR1J2QlFPL0FHMndobXJ2eEFPZWNY?=
 =?utf-8?B?Q3ovd0xaRCtodGtnUzVKZ2J3QWZ6R2JkOW5tVFVNU0N6VjRuamhmckNiMXZi?=
 =?utf-8?B?RTlLcVRTTGIrTlRJOEgvRXFQbUpaNkpUOW9nbjlUM3VyeStOL1VHWWlHL3Zm?=
 =?utf-8?B?QU9yT3RuK1A2ZDJkeW1TYk1hUG1UVko4T3JTaHBTL2dxL1pjOTMxU2pYaERN?=
 =?utf-8?B?eHhZN0pndWVhZldQUVR0YmZpdU5qTzRGcGE3N1VFVTczRzc2NWV0aU00amdy?=
 =?utf-8?B?MDZYOUlvLytIYklLVndLVENQMjFkcGNwTDlBa2o0ZjFwSFk4V2RCRXluSUFZ?=
 =?utf-8?B?TlIrQTFFZ1AwRVYydFVmdkplQU1NbVpTRjdUOUJJS1ZkT0tJc0Zxa3hhZHZJ?=
 =?utf-8?B?dmIydDZlYjlOSm8wQzhSc01QVFU1VFdOanBYeXNmY3FHZUtMdVdvT1N4dE5F?=
 =?utf-8?B?eVBDYytzVHNwa1o2eTAySjhOZ0E1MHRCbHhKQjBmM04wM0pyaGxCVWVQZlE0?=
 =?utf-8?B?UnV0VlFwVnpSUnQ0dkNyYjdpWDdpaTV6QUNzcUdFTnk1ZzM0dE1HQmU1dERB?=
 =?utf-8?B?OFUvRWUyNjRLdDNGTTY5SzcrNnlYdldxak0vTzROU2hMUDYweTVrUm5saVJF?=
 =?utf-8?B?cWQvdjdEalJWeTBCM2E2UUh2UUJFdXhobmx2SzlyZi8yL2I3YXlTYkdlWGVJ?=
 =?utf-8?B?V3ZXcmFJVGxSQ0RjOEN4VFV5b3JBY1d0RWxGNmdpcTNYUCtzc01EcWs5SUNS?=
 =?utf-8?B?SC9PZDhTeFMwUCtrVGJ6V1dtSXJrQkxCV2dheVkweFREUWZQaXc1WDYzRVUz?=
 =?utf-8?B?LzlTNGY4WVM1enNtUDNTbEdrR290bXZtWVNZYlYxeGZzRkhneFMwQVdQTzFa?=
 =?utf-8?B?WGsrYWpsVUtlSHh6T3NEc1czZ2hMblVrOTVMaGJNM0Q3UXh2WC9icUs5Wi9n?=
 =?utf-8?B?S21VNVBpSzRRb2dyUEN3eWY0UHFrZ2EzZDFHZnB1eWlJN29RV05lME5zcm0y?=
 =?utf-8?B?WXFCQWVMemM1djBPWkhRT09CcXJYdnpNK284UVRJTUxuSDlsN1M4WURkQ20w?=
 =?utf-8?B?aWl3NlhxazlpWlBhTTlFNXA3U0xjTUFwTHJSeStzTG5WbXNQdTJ1cFE0Unhs?=
 =?utf-8?B?VWFSbklVUTRHODY4QXo3MVFBbXZiSnpRYm9jOUtKZklKQnNNbzJkUXZYYy9s?=
 =?utf-8?B?WjFxVmJQU0FuT2MxRDJGdE1RRU4rdkV4VlJXM1FnY0xqUzFnVUR0ZHNUYXQx?=
 =?utf-8?B?MTZKdW5sZ1pDWUhZK0sydUkxY0xkdzYwU0dTckFNVGJIYmlNS2NhUENEL2Vh?=
 =?utf-8?B?Um0xdnNra1Z0WDArb2h6eGFRbEpjQzRyZE5zRmlIcGxZUWM5YUl2NUsvRUIv?=
 =?utf-8?B?R3ZhVEJZK2R3Tm44L0ZNVTAwYnI5VTBTaXRRc2tmM2hmUFhvNWJPcHZSS3Rs?=
 =?utf-8?B?TmNneDlkd1VkZUk5ZThaZWgxYjFJN0lOQTNUeUp3Tnp3U0VMY0s4NDN3SHJX?=
 =?utf-8?B?Ym40OFRhRjJQaUNFT3dNQ0lvSTJtVURYc1dqbDREK2dtbVFaSndsZjEyejhi?=
 =?utf-8?B?VjVza1hiclBGUXZXUGtQbi83Yk9scGxwSnN3YXBMYUxQM3AvLzRNaUhFY0xz?=
 =?utf-8?B?L1dpUVQyL1o5Nm52aFRtWnEwT0ozTjQrYTRZc2xmMGlIb08rMVkrTFhaaTRa?=
 =?utf-8?Q?LFurV0R6+frz+nQ4kMJ3ff9AL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f86094-07d4-43b3-7b9a-08de39442577
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 06:03:18.5209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+6OekdoUdFgextrNalVbzoStEsJ3ARjtWH2PEWp2Q2TkP11oa3s75ClGPRCGGR4ZR5ZjmAvJ+Z84uQ1sFBE5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10240



On 12/12/2025 11:39 AM, Andrew Lunn wrote:
> [You don't often get email from andrew@lunn.ch. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
>> +&fec {
>> +     phy-handle = <&ethphy2>;
>> +     phy-mode = "rgmii-id";
>> +     pinctrl-0 = <&pinctrl_fec>;
>> +     pinctrl-1 = <&pinctrl_fec_sleep>;
>> +     pinctrl-names = "default", "sleep";
>> +     fsl,magic-packet;
> 
> Have you tested WoL?
> 
>          Andrew

Hi Andrew,

Yes, already tested.

Regards,
Joseph

