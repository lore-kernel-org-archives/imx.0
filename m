Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471783;
	b=EdOshVj9GvAv/qDgTRc3cDWPoEwH75MiMZsfEL++4UtT4uKepImqqaP2z+PHtrPLZFcG
	 KOSRyQV9mF2Jk8HwObjBzigsMBKZzXNXZihU3n+vrh8OxX9nW4wuMzi+7Z8gYR3NbeXmj
	 uehqHuiXrWP+Ek69sxVSw1V8KM/cRCfUPm3AFq3lv+DetD0SyDuNwt/GTmO9p1drPY57Z
	 L74unm+TTgZNdYVg3GmK9rQxUQv6jWn1Q9OqKAA4SEBl37qy77ZwUQ+s00APWX/PZulkB
	 bNmESFirJ8mI2HwPgHr++gI96P1IzmBUK/wSdXUkOvMgOylMl6VYKIeXhVj36rInJZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471783;
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
	bh=vh1w4N0Qb3Afz5fQCBZhRfHdtD1VO/tePuelPGiRMfI=;
	b=Y0QD6UKPOS/ZLX/ocYQdkqs9+rOrOG4GMyaDB9PeoVU0RHAW9FFRThXl7yErmeoiVHqN
	 SN5znpDsek7oe1GhispiJ5sDVhysUJEvf+T/9VBRHTgAp2iHDEh+xETE9G1zdEmAWKi2n
	 ecRgWsKcOAvOMI/Ft7711kbXycYm1oxNHcY4b0Bb+g0HEdTRkkvoN2eMWKjdw8eN3X4me
	 XYdA3RfFjZkK02cM0URsIvF3ZEiTXk5ScV5KbEtlq4mh357vRNwIquTXYgdIDR1W0rSul
	 hEhUNVfdspH6XZoLVvt4GV74x5jHuQDdpokIVwTSicwMEks63/C1hLPYgUNVdKrs2hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=muhiW7wE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FC7606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 22:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FC7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=muhiW7wE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHUG4BLlvGTqkdWCGJU6sMWJpNfDKZUNsOw00Ec2y8jZd7FqCxHxiG2/FQP9hXvGnbFaW7LGCNIVTkWzuM7I+iwwbAkKkTes/tPlj9XYWzQR9pL1NpL75V7WctT2ZcSpsgNt/dkTgsDIk9EcOEDNEEHwWH8fJ2CsMtAzChtHamPtcUuj2GjhqDArxp+3v03RyRPLvvNZxeue5kOhr2vMfJr/JOFiClMSpyUcbDWPXLlatYFJp+wZMlK31G90lVX//JZpqqWczBHXd+cVY0AJNiuUGy4k/X8SCZG7xSsTRmjwWypwaduxk5CeTr/dNyM9bAofpacDaknzI0r8Npi1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh1w4N0Qb3Afz5fQCBZhRfHdtD1VO/tePuelPGiRMfI=;
 b=JjfhWDPpai+2mYap+2ySazgBULOwmfTzZNyP8ZFj/wAZSAyPjuuZI9fFw0KFYoGbp6ETT9fP7Bn9U2Yz+OnlT17Aq4XHnnHdn7k7rnmsewNoLaDn+d8hR6JjjUgVEcUXsqglZtWdmnMP8gK7EvsSze9gYq2reaHrhraq7XMQXSQHh1VBJqSGKxMqkoDMVGjx44Ldop9rS7HREO4va/es4pL++fWgQ5UuFaz+pY6H0r8bkI3F9UF3dRJzayqRVoPtUb34/PhEfLHIe1K6XWQGKTgpiygQh+pq6LDHHoNUqVmrnPc86OhYQkQV5pwdqiMADCCMItJvvGQUebd9rq3x+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh1w4N0Qb3Afz5fQCBZhRfHdtD1VO/tePuelPGiRMfI=;
 b=muhiW7wE8MIHM+c/qyvzInfzES5yt71Tc7WwU63cY3evNOx2quhZ7RyaVkO3uy/jq5IFack/munSt5UFODYnPsMXtEbQPfInPIcWvR36A4sDnuaD66XyWZGETsXUE9Bo6DJ8ArB3aKgtsL1dyIugxFfvDOjU1iG+yKRHvBHNNQ0RlnwSWn28drq8BjxVVqF/xQBxZJBGrrEK4LUgcijIR2GvlNdWZE0anl4VRXu9AE3f+/oFPthsH2VITlkraeD95phZTSdKa1RQpTB0hVYuPLwVJOW9v2zw/vqt5kffYeFHgFDW1rAgAUVg4T7nX1FUIBqWjGCsBnQSifTN8EzLlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 22:09:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 22:09:37 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ernest.vanhoecke@toradex.com,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: freescale: Add SMARC iMX8MP display overlays
Date: Mon, 23 Nov 2026 17:09:28 -0500
Message-ID: <179547174705.3027693.644288130301082105.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb5cdcc-c21a-4030-3e49-08df49ae7684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|7416014|261026121527099003|10067099003|11063799006|56012099006|261028144727099003|261026140227099003|261022105027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y+GTEqOkEuq67U+ME9OyFY77J0kdZ9C0aWZRErREZHZOBm2RmQ8CmnutMl58HFwTfIn4P0TKGE8jqkGcJx06VeIWelaGQJYsEClv7gN4uWWz9cEESG/96RUIo/QkSULVgBVbH+GOuZ1nJEcb6P5Ml6DK4C65YogDi4d4P1uKk4IsbGqL9hjivSKRGTpl4r/NBlndz1OiJ24HV5TbK4sVFVlwRpx3c3g3ZAt443Pb7B9oFZcAvHs3AxsynaDFajqLRWD6DkgN8dApbvPMsLHKHmqvhDnyMpyATg0wrB/zPQSq2naeIQqmowUgcT1zfb4Bho34Hn6NyjCiM824T9p1gOAy9FJiKyAb/MNqhnvsWe0a1skwcPp5kv6NRHPH/V0eHOaYjvP1u9IZ+bTflCmF+ItSLvRIDD47C4DFu0eb0V6Tv2sY/SLShZrL+9LvoUfsCy89RrpjsIYp34xL3omnO0gPpBLHLCS3nP8HVJmlnd0DqQpRGMopLNWiI/TChfI2TfCFY11TvKostSlV9RNp5GTnMFEvsskF7dhdicve841/oZCc+4qJEkZ4sYmGVhRJg/NDv5EvqM9KwHLGbH3WgV7gIEqLE9/q1X7ioYOsB20XXwSbA6ZGWXqq1UuXx0vGpW5Qz6GwuOZ0zSMiHrtyBCO4gdSv5/x9Dcy8BrNhXqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(7416014)(261026121527099003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHpEM3grbnV0dzM2Y2RaalM5clBUOHk2OXUxRWFqcG43Q1ZEdmxWOXphRDhp?=
 =?utf-8?B?SUpOM0dHZ2dPM1FtZGcrTG96VHBweUlMZmR6bzFFcE1kaWNkSDh6b05lMHN0?=
 =?utf-8?B?UjhNY0JaL00zU0Y1V0pteW9YSkg4TTAvc3ljWFhCQVpYZjhZK2hmME5ucW9j?=
 =?utf-8?B?eEI3cDYzWWcyaXlGclJPL3E4bE4yTklRUzQ0UDN0dGhzOGNyZXlDSFpvbHJX?=
 =?utf-8?B?bXFFZGlnZjE0M1FCNVdVd25CZ0FOeFlBQW9XbDUzSW5CYW1ScTFJc0FkbFU0?=
 =?utf-8?B?UTNFV1RNbFc3VUE4VkJ5Y2lkdmVJSUJ2OU83R0pyeDhBbWxtSHUvcXp2a3Q1?=
 =?utf-8?B?NjVybC85K0l2WnVvaGlQVjVkRmZHUHZEU0N2OWtyNG1lMWQ0Mlgzc3dER3dw?=
 =?utf-8?B?VWhNOXVEVDQ0bTNkSUp3d3V2em1LQWNBUzlRQitHbXkxeFNTUUp3bnNEc2Vr?=
 =?utf-8?B?VHQwcy9OTktYcE5DQ0tRMDRpSTQ2MktrS1p6aGs2Z1JQbm51V3BnS0drQ205?=
 =?utf-8?B?Z2VXeXoxaDBqSWxXa0ZkS0d4VHdudzRub0JoRDF6NTh2bmttVWZmR2V0Q1No?=
 =?utf-8?B?aTh6UnkvaDZlMG5PcGJwYmErZFF2bngwelc5Q21wSmpIMmt5RkFoU01QOWtu?=
 =?utf-8?B?eU5XQUZQa2M2RFdLdTF2Umc4SkRzZjc0MkxEZUpReTRvSUFOSjlYTExkUlkv?=
 =?utf-8?B?cDJEUHd2MGplak9hV0YzR0EzeW5QV2VET0hmM2VNQjhidHFmWmpZZ3YyZm0v?=
 =?utf-8?B?MWhFcjZtbWtSWXEvaGYveEh2c09kT3RWcDdsNURBRXJuZW5DSXNMV0N3Nk5S?=
 =?utf-8?B?ZDNQUXl2SzNXWTFCeGkwalhQV3R5cSt0QldZcVhxZklEbVJjekFVejl3d1ln?=
 =?utf-8?B?dUVCQVlsc2dTV3pxbGF4OU44VTIyRWEzMzFQVjQ5SGMzblFlZmR5MTNWV2lT?=
 =?utf-8?B?LzhvVVZUcENheG8yZ3BRb0ZNYlk1Skd0S2FrZ0xkUXI3YUxTQkZueVJUVGFN?=
 =?utf-8?B?NURoekRpdjQwem1WVzhXWjExWllVcXlyVXhaN1dvQ1hUTTk0SEk1UXF6U1o4?=
 =?utf-8?B?QmV2eS9xL3FNUHVmNHpLa1hnSC9VRkdBS2dZU1NLM0FaRDJidmw1UVJ4akxn?=
 =?utf-8?B?SnNrWkpKdEZWcUFVR0RlY1NFVGRSZHgvcnI4MXFuQVNLSWNHc0s2T29TMENX?=
 =?utf-8?B?VjhiUW1pZCtiQzlGemFCOFgrWUp6QjdEMUFTVFhidGNDcEJ2THlGU1RURzEv?=
 =?utf-8?B?KzcvMEtYSlJXWUlwUDRmNFc4WUxva3IyL0JsbmtXTWo4SE92U0QyM3E1T3dn?=
 =?utf-8?B?QkQyYW1jQnpBelFwWWwzd2pET3B6R3JzWXlQUEc5NU0rTG1TTEtvOVRBMHZU?=
 =?utf-8?B?aXE3dlNqWGJuSEZTZWxuNXYrOEJYeTB0QjBsaUY3UUcrM1pkNFo1NklTSlZK?=
 =?utf-8?B?SzAxVk9sNXZaNVpSbGZmYVVpQ21zY3RDRlNLeTRhUW5VckozalF1bGZHWUZ2?=
 =?utf-8?B?amVkTG1rVjk2U28raG5iSDJHaUdsZWRJdEQ3OXIrdno0eEUxQUdZVkIrYnk3?=
 =?utf-8?B?SFBCaWtmbFk4SFlObkdRTFM0N3RiWmpWTUlnRVBsYUVKMDl5c2Z5ZUZpRGVr?=
 =?utf-8?B?L3VFeS9Tb1hIaVU0cWd3ZkFFbHNFNFpmcUlrLzB5R2VBMEhHUFlJTS9CU0Rn?=
 =?utf-8?B?ZzVkeVhBM2ZFMzJlQVFBeHp3YkpmclE2VXJCRWxLbHNhQWthZTk0cHFSSkY5?=
 =?utf-8?B?d3ZVc045K2pyaUVDTHV2cHB4ajRwK3Fub0lZdUJMUlkzREtqNktHMzlwTjBX?=
 =?utf-8?B?WjFZMnAwUHkxc3QrRXhSVVpRSFhIenlCVVFKT01XQlpqNk1uZVNIUmh1SXE1?=
 =?utf-8?B?N2loSG53NldOaURmano0VnRieFErbTJQVmFTb1QwRU1iU3lIZS9XQzZ5dTh5?=
 =?utf-8?B?aEQxMTNFRWhDaWhZZWkyZG5kU0xhWjhoVXFzNS8ySXhjcVA5d2Yvc3VwMWZ1?=
 =?utf-8?B?RTc3SkFMWG40bis4OG1RZXN1STZ1YzF6c05rb2dRV3RJVXZVR1RRL3l4QVp4?=
 =?utf-8?B?d2V1NlJRekFqUmxDT2tuK3l3bVpUODBLM1JmMys4V3lmQ1RobEttNGlpb1JV?=
 =?utf-8?B?WGlvTXdKMnV0elNROTYxdWNtZkZLcngyVmw0elZyTmdlOWNwdlBlL0FqdDVL?=
 =?utf-8?B?ZGhkOFR0eExBN2JMUEwzRnlrV25FZklEeU8xQmRaQXJReUNPVmljcDEyOWVQ?=
 =?utf-8?B?Ny91ZW1HZHloOTF1Zk9sRHkvMEYxS205THV0US9qa3czMUwzLzhhT0FqM2o3?=
 =?utf-8?B?eCsxaHBISVhROHo0NHlaeGNnRXQ3RzF4ZnRGangwNVU0aGZvRlNrNmFDbS9X?=
 =?utf-8?Q?dlD2UNRbi3G2kgF2jYxk2LP67/LdjJ65YXeAu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb5cdcc-c21a-4030-3e49-08df49ae7684
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:09:37.3267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8YbqswbXaXmmA9WZYTQlSprYIZoggcqnZXkwF3WjmwW3N68aMh5PuH4iTWO5hpYSXAGrDNTZOOGJ3+ctEltIPXv+vRmY9Im6NkFaGBf5/9ziLp4ycvj1KDqWfljPk5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088

From: Frank Li <Frank.Li@nxp.com>


On Fri, 13 Nov 2026 12:51:11 -0300, Leonardo Costa wrote:
> This series adds device tree overlays for display accessories on the
> Toradex SMARC iMX8MP with the Toradex SMARC Development Board.
> 
> This brings SMARC iMX8MP display support in line with the corresponding
> Verdin overlays and makes the same Toradex accessories available with
> the mainline kernel.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      commit: 9dc3c1dec32227bd32ef337a9b24c754721c998c
[2/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      commit: f94a4e8bff4f08f4d68f398513609ffedde79a29
[3/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      commit: d76d232ecd5c6dfb62344d755ade43fbab0fc5a3
[4/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      commit: c8db1344d9b05927ca1932fefa924746c3b4307f
[5/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      commit: 0870621c22baccc9742a621654b9dafef6b9eef9
[6/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI
      commit: 0a9861c53b820fcb444e3b0922b22bb62942da02

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
