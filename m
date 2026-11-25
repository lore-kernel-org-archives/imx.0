Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630143;
	b=aF358CzBjn1/Wo8fZEpy9RFe+Yew0OgUtpImqHryfiA5YyoxEMupii4qFK+86/gA29U9
	 KnXeGSM9PbWKP+Plw+Np57S/6QjKchP8IMJkuw9QHcSMCdOilS+giYNpjBxleQT345j2I
	 qI5R00wToitZZTh660Ixeac/bA5N8tZclZ/nB65CjFI6tW0kn9atA77drW2njHqlsZTtR
	 FgusU/8J+EUvg6OsaZYjOe7REk1apw/QxmW1mtwbVBNBv3lMoNHsJVrBcmEWIZdjSr5fQ
	 dWc8e400sDpcIn7cJxwf6m+odPzabqLoAlPYTYjQhxs9F5B3xlQe1Ex6h+o+W7G6p1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630143;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HhpWEdgl3BMxnm18FinEoozmPHjDgZACM4r257gtneA=;
	b=jFcVKJB84ocV1xKHPGwym6sy1kB3M/58AeUEYMBTMgDqcQngVsaLQgdNes1DgL4tHSL7
	 TIbUW/RMJ6Tjjfx9cTAFH7apgCHWUjvvV2SC/tv9AZCYuxNBrYAHCtsyheSNhkhBxzW8L
	 riU6BTHXsfqLNoNXj6551oCgHLqbY5UFC7u3oH6Szjf0p6YF24xJA0RgsLTxmUpO8LGCT
	 JjuotFaRwJjbENoIDz3qHY7V9A+O9Zz9/X8dXTeY3knz2u1SLru338rkkf5T/uQepnIxv
	 hwIRvt4EePW4uq9w6QzXk14l6fb+a8uHUsk6xWkXKAWVgA49DpbxQk9vbZGhBLBeexw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uhQ6FRAN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.63
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD8C606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD8C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uhQ6FRAN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEuXiCwFoqHSKdC5VoXf6JHeQck0h2LeN8aV7xwKCge15o01AG3RYnXPVsUkZsym/7rvAfghaQ7hcWaSm8KOzWeC/O02Mnd31AIwMeGu4U7qtbx6737K+HFROZDZTcpcjWfNLrYNcxulRx5j9a+mNpx/MrY52HwaYTvvMMF3KEWCaYNc6VlIQ1nuc05L2Ar+bw/g/lu0Ym2da87ro33aEQ99cbiiDEnXWC96XY0GaeROHobRUt0QWkcFI7XVUdmiJQKXXDvJmWmcjpkkSP71qONFJ+iDioaA9Zos81M/bnLvcW73geA1l6sreO+20qCpyk3bkSlOnc5Yyl9XJ/pCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhpWEdgl3BMxnm18FinEoozmPHjDgZACM4r257gtneA=;
 b=s3UtZzXX+41iybJu2az9DWSulyH9oeom1F3IPlnEsxiOMLqjiZsDMF/Rb+JKHI+yHHUk2jhidt9DdTo4zUSKyiWeFZFdY5cgj/fXU7aXa6BAsd1W4QkWw5s2RJohMmc0hrmvFkc+Wyg0QJnbGnX4aSW0T+56TTPNY8qyweuoUL1D5YTb1OCL5AQ6S/p9/SY2OAjQ1bOVM8E02CayuTozh73jM8qwMWSaLbyOV2puaEkzaPwvUZ5bQoLIDDhTGezK5JPldH6Q1lcRT55I/1j8/foQaSs+D/plRQrI65l06hGK7N2I389cuQngcYi+glxYSl4SA1chH2oM5nk7XDkHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhpWEdgl3BMxnm18FinEoozmPHjDgZACM4r257gtneA=;
 b=uhQ6FRANg4T1jyET2ZvfahVKqU7G19dR2eYBEz8jis8IiFitTxgvXpFfjao/joNZgTMWs9nFvnu5Tbn8X7wMOkHm2oPyuRrVfXy+0dWOFtq4EruKZHKvjdZW5yBYP8vOQIxuV/LloOkKCuHyXUryHXyvLT+Ll1GSt1OQ0MyiFL+1mmtVuq+LYZE8+6XuV4FJ1fglyiSBQbXsqfO6SlRBDsmYN1bhuoN9rxW+aSaMx4PsWK9uJq51p6uCYvw9uMMsDHjqFVwctfpF6sbMZSwtbnN/albgMaI4DN7t4HSb0jh3uYIgaf6goBbh9AMgF6xssHAS8iywOKQNMo/+jdtEVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PPFCC444A769.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 18:09:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:09:00 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Wed, 25 Nov 2026 13:08:54 -0500
Message-ID: <179563013059.3155955.17399604598154970811.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120181816.33455-1-stefano.r@variscite.com>
References: <20261120181816.33455-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PPFCC444A769:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd2089b-6d30-485f-c6a8-08df4b1f2e6d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|10067099003|56012099006|11063799006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 kZ1v21qR0xaz+fyl6OfJOjHhepM6EGjTX2ToOHrBP79mBukugTbhsuxq2AxDdGRol1OxQMzrmClDTMFenTG1rZ9rpSUzMRZJbWBioq0STdGuwtJFfSuYUHukL8PE0BWOaeFbniNlvdPL4wJOvlDgJC/SIV6OMibNt+0L6fhLSutIX/MVn/UVevnW7Fz4L6xrEfG+BBPGdqc7uk7nR50Ke+zsnDEhAsrNdV8cgSgzzz5uQqQY/yEmOGUxo1quGjAFRBoRiNS9ZZmIGtwSQ/MJIK5umSIMSjqkrcjqo9xn1jURfqDhY8BjnJ5WCxnuwyrQuzDowJAdCuhcKGJSlXe5LWz+16+UHQyHO3J8b0XrremeimMIpWMgGad2wqz5oHrpMwDh6ukp0JMCtv6leauwRKOswxKGMGUjWPxFQuHkU3CFcubwpi3sUARDiUIv7u9hFQF8dVAduc0LFfj9RzrdrcEuUiouG18fUxi++jSBgwmMxQgVXWZiqGa+sJG75MqG6Lbf7SUiHXIDLKh7wRAH4Bblz4zyLEgTjuaDhgZngfSytnhv8YRjtxG8dFBg8NothdYX5C5LRmEP+Pgdq1NFed9PXfeRECZzX8gdYncN1zweEeU7dQbM54ozXWJcAXgsvbHpCtPeoqyZcKGkh6087wTZG5gPnmyduvU3Y4ixg78=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dG0rbDRLNi9aaGFJNXhvQkZ4andQNC94V0tKazZXTlRST21ZViswOUZEWDFT?=
 =?utf-8?B?dVZjU2RqSUgwUG1IUnU2dEpDSkpCWFd1L1VWcGNRa3VheE9Tc2R3dnNrTTlZ?=
 =?utf-8?B?TmVPQ0d1UndDYk5nRGVrUUgwa0laK1I3RTRNREdjZHVvZlY0QzgzRmZRTXBP?=
 =?utf-8?B?RTZZejJMQ01hU3lFK21ZNm1yaUFVdmZLdGZNc2VWc0N4Z0I2bXFrWXc5R0Rt?=
 =?utf-8?B?cGdmak02WUdWalhKUkordzFEY0Z0K0tXNlovNk1YMmhoYWw4NFY3UExtTkRp?=
 =?utf-8?B?UUhOREIwTE84N3RwbjdjUTdpbnFaZ1YxMHNkRjF5RXNjMDY5SUI1am0xZHZT?=
 =?utf-8?B?U3h6TTBKSFd5Nm15bU1mcXUyand0eHVEUFRaWEFEUWJycVdHbE1ISHgyZlBX?=
 =?utf-8?B?Y2JWMGlDc3FuVUh6YVh2OWFaTzNsWDV5dVJEL0pJajNLYVVOcmo5OGZlU1JR?=
 =?utf-8?B?K1lDS3RxRmgvbEQyT3ZBRnYvdnFsbGthOXBUblNjQWdhTVYvemo1ME5nVkpC?=
 =?utf-8?B?Ym9VVFNSVWpNR2ozMzE4ajZkTVZHYVFYVzdMdWVVZ3lJaU92Tzd5UnJBcFQx?=
 =?utf-8?B?bkRsOW9oVnlVeGdvMVZ2by9Ld1ZsSzFlT1N5WGF6YUR0SHBNTHZPbWV3Kysy?=
 =?utf-8?B?V2t0TEN6NEx6ODJHOS96VUpGYzQ0YlhJNGVMbW8wOFRTc3htbEYvcFVzZGFK?=
 =?utf-8?B?VEtnSndBUlNCZng4alRiYm5PWEdvUlZSY0QycU9aM25wM3NmRmR0enp4VFBI?=
 =?utf-8?B?M3ptNDhIam9jNEhtVlVkMmx3cThBS3UxVjVOdzBUaWxWTEpCRlBqbk9BNHN6?=
 =?utf-8?B?WUZia0JxcFNRS0QrZU5WQzJsbGhnM01EZ2kvQXl4WFNkZ1ZQY0tkeGV5SExT?=
 =?utf-8?B?L2tXMERFbmQrUU9iUDI5YVV2c2Vhb1JyeFQ1UjhXYTBKaUJVcUh6TGpod2pR?=
 =?utf-8?B?RXpNZll3UE01dEN0UUU5Tlc0eTVqbm5uYUxSTVlrZ0FDSGdkSXQ5dktCc2hU?=
 =?utf-8?B?eERKTENvNjQwT2lreS85RFdKMkJyTDkvS0NsWUlCNnNtZTNJN3ppdFozcUhX?=
 =?utf-8?B?WThlV0tRUURUbFZUMnllMFFlVU5DaXkvM1J6eVY2UVlWejZWMGtNMHVKS1Fm?=
 =?utf-8?B?S1ptbkx4dlY3WUVKTmZWMk9vWlZ0a3RIc3g5OU1HRUNyUXZhUG96VmZ0Sndw?=
 =?utf-8?B?cTNodlBhWUhjeHgrTm12eWNLTU9PWGc1TUtDMUJBR1ZqRDI2SG1yZmlXbFV0?=
 =?utf-8?B?WEZueFVKU3JDbUlQclFrNlZ1OThLUm9NQW0wdXIzMG5hSEtWTTVnU3l1WlBC?=
 =?utf-8?B?U3dTK2RzSWI1YkZlVVhmcWFQeXZoODUwUVZaUys3SEJnRlIraUUraTNOMi9o?=
 =?utf-8?B?QS91NUlaN0N6MGcrVktFLzJrUEM5dzZqOWtpbnU2UzYxYWpCQ0dEUVBoU3lP?=
 =?utf-8?B?VzVLUmNpUlZEb1VPTmhXemRlRWliRDFvbjVjOTZsMmVLS0UwVEp3V3pLZXAr?=
 =?utf-8?B?cUYwTWtIakE2NVcvL3NELzlFK21PQnF3YUJaalpWMndkYnlnSjAzOEI1aVB2?=
 =?utf-8?B?WTZnS2RuYUtXSUg5RzVsdGpTeGVXUkRUSmgrenAzajhFSmpIL0pMVTVuU2tY?=
 =?utf-8?B?Vm5PTWJTQkRqWVlzUm1EdlhDTHpLRGtnYmFjN2JPSE1qenRud2YwNXhmbHUr?=
 =?utf-8?B?ZjdBb0hNVWdJQTltQXpGZGhIQkllamJvcmU4RjBDc0ErdDJVcGVmWXdMakti?=
 =?utf-8?B?OWlvYjQzbVJWeDNxcjBBejUxSk0wakIvd3dLQ2phWkIzbmQwWHpXcFhFYUIv?=
 =?utf-8?B?WnJBTkRJYjNrMWJ4Y2FpcFh3UHdlY3p1VlBNZnJLSlBzQnJUU2gycnNBZkNW?=
 =?utf-8?B?RnBMOFBoazBxMDVmY1pRMFFRYTZPdlQ2U0FQVGR6Mkc1bVJ0c0FpeTFxcGZ6?=
 =?utf-8?B?eW15VmV0UHlFU2tkUm41N2FyU2dsUVRtQzhjNjBLem1qeU90QVNEbzJLUDZa?=
 =?utf-8?B?Zlg1V3cwM3RLa3JYd0g2TjVFUzY5UytRTWlYZ3Bnditnemw1N05RN3RmczNQ?=
 =?utf-8?B?N28vQUhTeE9CZnZ5N3JrekNPUXBnNUdqa1ZRWHJybVU1R3Q1NFdiYUpvS2dO?=
 =?utf-8?B?aDk0KzVTOEYzajIxTWFJd3Z1WkZOaTIrKzdweEdpaFFGWXlsV3FhYTR4UzEv?=
 =?utf-8?B?dkovZHJYb0ZjdTZGK09YQk5EM09LUDNDMW9vQVZPK0ovOTczTG1hOXZZc2gw?=
 =?utf-8?B?MzBnMnk1a0lEU0pHRkViSlFXTmdJODNYTWVPVis0dDhLYnNIYXl2ajZEME00?=
 =?utf-8?B?WlFUSlpZajVFTnBqNCtHK0krV2o5c0o3dzRlMFVzWkJma3J0MVJBMXd4Wmhp?=
 =?utf-8?Q?Zk+ecDn1mD05g9fSj06p4+zB64GM62MHKDpcg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd2089b-6d30-485f-c6a8-08df4b1f2e6d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:09:00.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNOHBuDnPdc0mic4i5+6Bxa79gpHYvyD9d3xc9Q2bEOt8EN9Ln7u+aR98D7UYcqTEXqMuBpousyrkYduVheIcCOe+NTkB2k0aXAlTp9BqbFHo6jeYG8sF6sUxJbgziNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PPFCC444A769

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 19:18:16 +0100, Stefano Radaelli wrote:
> Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
> VAR-SOM-MX8M-MINI on Symphony.
> 
> Share the reserved memory and remoteproc configuration through a common
> include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
> support.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
      commit: 7bb3b777a60ae1ce6fc5db83bad77aabd24c1038

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
