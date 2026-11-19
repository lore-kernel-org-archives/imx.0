Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123502;
	b=LSIY8m/T73rNG/w68aqP9MrUhORzYRXhn8A5j5ZuipydOxeiCAKgngziiA6Uyt0al1u/
	 pstyYAHaHf10JmYQmfItG8AwVkl7dsa7q5EHDPAHUk0oO2FrWfun5IDbcHTZCjPOnK44y
	 w7mO5O++6G37/kc3eO5aSvOzKAwYwtbYobDolsntv9eRMbIvtxPXHRrfYL/cMoOYi2PcD
	 ggnQdT9lrqS4h4zBOF0k8g5YrV8MHYGivS1wT42a+UGSbJzymgaaFbyR+0pttUItFvwur
	 TBNEin0KBOCChnl+aIoadfJYM7UfCPItRvNrENMt3cDemJq2yJYN8YNpv7iO+1LXKBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=umvP0cqyr1WpPkNvkJoTYA03BcBoVYFy3KutK/DXsfA=;
	b=iCA1mfEL7FXb0jvXiLWRJJz3v9YSz3NZSyPHYz8xzey/VBy34hMjnQ33LvnrLYwPeDk3
	 /MvxPco2qvOsEsITbK0Z1tYQiwTvHimfnCLkJlxzygMyAb9HBN8hs6pWOOXiM/rimMRQt
	 jbjr1R7QvfURy1FPaTmyk87/T0Zrh0lA3L+R+pQ0duQ4wiQoVQUuNjkOMqHDgi0Td3CWe
	 roVruopJpExccRD6XLYPOsT6kvekRiI+pvp8hU/g8rUU24yF+e6DM1QcG2c3Ji+rcFLv+
	 2X+A/J4qIq7yt/a1vP67Vr4svbFZ3kyjoHt+WCed8DAFK3X7liuzXBWdwAXOv4+X/IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pkqKohHM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.17
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94602606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94602606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pkqKohHM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMY2/bLR5Kdpoq+/aQ7Y3Jd43i+YGT+EfZRDPxMUaCBnddFjKqq6AP/8+acNNvfb5CSlifppViErs3zlN9gY/bnhc1W6INLmGKhzK6MDYUokbc2AtUBYvJE/ulrADo3zy39nzUQy4lRNZtKyOedJkiMdN2m0M5nNcC+qvYhn5s9bDUcbLj9WCEM1U3fbf5FZMyI2ashNfe+1zEY6wg/risUv9qHFkx3N8e9v71a+nm635tgJz9dDMBoYV4lEN1N4SGwtluwQyair5KgZZtxKOCsLojCKAIMxB1foKt/LodspnVn2Dht0dEbG6FY1ABWAyhU1j6gMbsaHFits+21zTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umvP0cqyr1WpPkNvkJoTYA03BcBoVYFy3KutK/DXsfA=;
 b=QSNYbWFKVVy9zoT+WFtAvU0s4sDVjYYf8QRdrywkqlzKLAxYE7WAR9iKRpJeO8wz2Q74COLD7eGX6fjIcj/aScgrECKU3djC3nL9y8+kl3ymjYEtj0U86KwpmP5apVCkY7hkYGxMo4yaEryHlacfk2yRlC7JCKWX4ZGDP96hosz52Nn0Bu8zSYKuBwcIcCcY3YVg99D25EdQ/MrHv6ljbAoE1Er+0zK3BOQontQr1DyWdOhyBYT96eCoR5b4luDeTG3WSZsRpuad1RWGCicl5IEKG3WjRvV+9dyArNK0q5sF7RA5ZoeDBHfV8rnBlxcUoqPjwkP6e5XWat2lkT09ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umvP0cqyr1WpPkNvkJoTYA03BcBoVYFy3KutK/DXsfA=;
 b=pkqKohHMwKbVD6EY3fRdVNOCGXCCjOa7r5rmkW9aM5iOzEhInp8JBGxB8JaDoNKhXZAYdwmrgtdvVOE5oOMs9GhTyC7aydnpAT7iyV17OW6CYaoSC1+I6IcOYJS0SosAGaj3nTr8i31Zpo/TNyB3rKbjPDsLVyq0AmrKycdVDpxpvBTHWOY+ihEeZGWeMy7dOQshqPQ0TrWuAuiL87p9dBGdCflD5qoL1M8um1mpdpwlcOG33J6pQaPoK4PGVavxEeNfW4xJqym5ZnmT3MZDYrosKyUc6QfaaBvseriW5jU2/gD8l8jCEQ3NdzS06IYHuHyaWMR9krcbmUmy7qagLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:24:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:24:56 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com,
	Joseph Linares <joseph.linares@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx94: Correct the lpuart9 clock
Date: Thu, 19 Nov 2026 16:24:49 -0500
Message-ID: <179512348524.1872336.11498379447174127223.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111-94-lpuart9-v1-1-2deb072bb1b8@nxp.com>
References: <20261111-94-lpuart9-v1-1-2deb072bb1b8@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c6316c-983d-432f-9dc3-08df46838f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AEPwY4wQbGq4/LfiNKurN0PrbXv3iylau5oftu8eXmZqK8bRx+GRGEUnfSet5E6mZSBSeMzxGZBOhsGMZl+vaXn742IhomcTWaYt+UmSsg9eX1V/GpDUqTxjgSubpWjbCYfDx/N8wuJ/iIMjHN09xpd/VQ2NZQ10YZY4Y7UFz8REY20nmcxKZ3UM5PeB6Jzx+XhWXOdn/irPcF4Uh47cI9ypkNrVROF6t/otCS8laAOUyjiq9aXQ0QYBKygccm5ssjQWJA1YqWWiXR8bwCnaKncsukzx0p5JZWhzD7LLOlfaPynPjxMTHboheKFKV36Y0NhRHTuI76j46oFhI5MRIWIADak/SwEDXgh3UVZEYoTQlMAhAaVy5mQSRNR23nDRZIW0TVmOuCamzdcEfl25bwTkQujL0xDreCV1jAp7j4U5x0GTbsmJuRc4HUf7flKb+bPTZpXR/2UhEWHcWbqhqm+uJz1hSV6ezE5k/o+1uTyr2mH3h7CXsWaNWeXSFTdQ/krU9Hc5/fKWbEUJFvfR528IOcsa3ktI1+GGIqvsHWZ3C/y0x2jKiiGuZQBSQEQxgbnLqAO5Ba5jyUlmcksluFzMuLBh5BO0b0QI/szvkcWdOkoDhhBN2EDkzs+SvUJjGjV3fFR+uzgKCOc+dfzLoDJCZ7jmVcsM6ecZ6p8Ld4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTAxblAyVStGOWVOR3pKaHFDd1lxZE92c0Y1UFN3MlQzMUl3cnlXbDF4cWpC?=
 =?utf-8?B?bzQ1YmIyTStteHhKTUJPZmRTQ2NZRndhd1UzQk1VR1NnakhqZXlOeHcwSkhL?=
 =?utf-8?B?eVNOK0FNejNzOG9PUU9PRmRNcWNGbk10MEFTMWVxaGhPRjk2YWtOY0JodWFr?=
 =?utf-8?B?UnRtWU42bzhYQTN4VWIvdjRZQVdTTlNncUI1UW54ZnhYcFkzdVJIdlhiK00z?=
 =?utf-8?B?Q0pIL3o1R050dE9LMlNFRzczWWg5ZzFPc05MSlYzSXRmcm1qSklGT3RONnYr?=
 =?utf-8?B?QmFqU1FlUkRxb0d3SlFXWTRHZ0Q0THlONXgvbkZ6T0lIT2pWRG96OWZjV09W?=
 =?utf-8?B?UHFHYkVaUjM5WGZnT0k3MzlOdWEwcUlxN3pjV2pyNWRKVmRhV0xSQ2lVb3lt?=
 =?utf-8?B?TnowYXhUOE5Qdll4M2tteDg5ZDExVUlOdG04TkNFTldROFk4cXd2NjI2Zy9H?=
 =?utf-8?B?M1lqVlVsVnJScElLUHpRL2NnMDZraktGaDdueU9QcTVyMzdDNFJ6bjcvRG5O?=
 =?utf-8?B?WlNJS01tM1VoRXdvL1hxTHpkSnhNU3d5c1JZdXkxTnpseCtINHF1QThZcFMy?=
 =?utf-8?B?NkkxZzFLcUoyeTlBb0VaT2FlcUIzM2RIY0V2ZzhhRmwwRk11UlRHUW90VzdZ?=
 =?utf-8?B?L09uS3hoWFdIcVdNVXhqeDE1czNuMUhYd0FUbHJNM2pwS1pFNVNoNmgwQXYr?=
 =?utf-8?B?dkx0alpzcDcvTWJVdlVvR3F6QlJSUVg1VmY5VjVIbXdCQlh6bmwyZUczbXVs?=
 =?utf-8?B?aUk4OG8xODNVR0FZN085ZVlJZFNKQ29JRE5FMkkrSEkvNjVUdzduQWs4bE40?=
 =?utf-8?B?cnY5bUxMUDhKR1VOV0xKVk11U08wV3haNEdOQzluM1R4V0dXSkl1WVhvcmN3?=
 =?utf-8?B?a0cwWXhTTnp2UkZNMFdYblRFSWJWSVdTbzBRdW5sdTJkOCt5WWtiaE16dEpi?=
 =?utf-8?B?V1ZmaTlOL2UrQ1czeklDM3phc0RvOUhKNFFaV0QrSzJjQ1RZUlV3Um1IWjY2?=
 =?utf-8?B?clhzdFBMUlpRL3VNbTZtUE9BMnhRQWJ0U2hjdVA5aWZqREliQjYwKzlHNXp2?=
 =?utf-8?B?UDVPRnc5TFZSQjlzdXNXaE5rbmY3US80QjZsODhRZVBGV1Y2ZmkrTmNvNE9P?=
 =?utf-8?B?QU8vNXBzdlFKb0hreHhVUFpPMGE2TC9rVmp6MTRqdC9kbXhCUlhpOHAwREdQ?=
 =?utf-8?B?NXdpbjFwOTRJRk4yK2JrYjlSVzBadmo4TGpENjdBSU5oaGdzejNtaDdtdDEz?=
 =?utf-8?B?dXFmM0RzTXE4WVJveEViVk15OFdJdzNNQzZla0JYL2M2ZFZiLzNrSHFjNm8z?=
 =?utf-8?B?RUhyZTlUd0hCUElhdFZ0amNEVkNOQlJFbUttY3lqdWJHNTdQNGFiR1lnTHZS?=
 =?utf-8?B?Z1RoVkE5M2s1ZDlxUDR4TkZFU3lnN2VlS2ZGUkd4cC9xZkxHcUZETHdOUzV6?=
 =?utf-8?B?YXBsVlpDWE0rdXd1S0FCZ3AvdzlPdzFBVTJnRzY0L3d2T29kYmhjKzY0WFNm?=
 =?utf-8?B?OHhrUGpMS2ltd2FsSFJjcjQxemx6UXZ4YVpXVmdPa241cWM1ZGZ3cHNDS1Bz?=
 =?utf-8?B?bmk2QkE1YVljTnZaMFVCcFhnUEEzdWNLaDVrWWxPYmhPRXZ6ZXI4UUdmQWt4?=
 =?utf-8?B?SldoMVJMVjNRRHNXUk9MSi9KR3ZyNHowNDZKQzZSb2wyTmc5bzZaQ1dJY0Ex?=
 =?utf-8?B?VWgvdXNNUGlaR0FKMC91aSt2UnQ4OGF4ZnV0TFRDSzZvSWVLMDErS0pLWXV6?=
 =?utf-8?B?c2xkdFNoNnI3MVZJb2ZFdWlieHZxOUZCM3Rrc1BDaDVybm5jcUFlRUQ0WUVV?=
 =?utf-8?B?UVZLbEg4Rk93L252Q2gxT0lHeEpXRFZKWlgwTmVhNG0xM0R2TTdWclNvclIw?=
 =?utf-8?B?STdjWGFDUUU2SGVXLy9VbVYxOTZlZy9jMWlqVys4enEvQndBUUNoZU9LYTNt?=
 =?utf-8?B?ZTI1cFNqMVpuZnpGZ05sWGpRK0FDNCtwM3FBWUpUdlc1M0VsN2JUU1FvRENT?=
 =?utf-8?B?eGlYN0haMkVaZ2Q2SFp2aHJ0S3NSYzFPMy9sOHpxSHg2RTFJU2VsZWxRREtP?=
 =?utf-8?B?cW12ZjE2bURWclQ2L0ppODNiWEE5VXFUY0Rpc0ZuRVZnSUhGU3BtS3hQYmYv?=
 =?utf-8?B?eEZ1enJOQ0hkMTBjMGkzQzRodCtLRE5BVHFlZzlGV1c1OVJGWHZFaVpGWTJt?=
 =?utf-8?B?UWFIRzdYWUJQNmtnTCtPaXF6d2pGdUdrb09PZmxBaDdZaFFkbEJ0UWhmY29W?=
 =?utf-8?B?SzNONFM1R2loUzd0cThFTHVjNjBUZmFad1ZzZ1R5UW5FMGppUktPMWxJTG43?=
 =?utf-8?B?MnFDRjBlQjdaak9DTWh4WUdINXBTTmdvenVwemZaYkZHYndvcHlNbnhrM1ND?=
 =?utf-8?Q?ssim2ShBBQNYZmTu/JpipjRcrtQERW9JoUQKW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c6316c-983d-432f-9dc3-08df46838f26
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:24:56.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJLDUWTghsXecMa9dm8KoAvc4yAfMSms8raBF2EELf14+7yVN7i8e0SovuEYoq07i3jlnp1qp+qG5Tyzk46s/c6vrI5NjGndTNPcu2aaWH2TP7dP2+tQdPmSbU6e7jEA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Nov 2026 15:00:17 +0800, Sherry Sun (OSS) wrote:
> The lpuart9 clock of i.MX94 was incorrectly set to the lpuart10 clock.
> Corrected to IMX94_CLK_LPUART9.

Applied, thanks!

[1/1] arm64: dts: imx94: Correct the lpuart9 clock
      commit: 60acd5333688e707f7a322dd14003f2251c91a77

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
