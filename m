Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9F132ED46
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586416; cv=fail; b=mIzLXL4cR+0M15GOjSF8eNxh5gKZ7G/Qe1AIRnfAJGZk2nyx0rZ+8DJDuM42EVV59zr/heXKvbn6abHCI111oJgpG9Ub1b3T0EQuuIoxVzyqij4BKvafgXOjzubyzOo6jZkjAAY3Kb3Z9kSpHRmtYYwD6XHSVbKm1TQjdJJLrAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586416; c=relaxed/simple;
	bh=ZqgnzWIe86Q3Yl+ap8Jjgdf2++KDZgf1+K3pg/LOMas=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GbNs+XFmUeXENvKlW0ccmRCf54XfLHAX3Esxolw4uy+xJOlEUUN/uqVJ5pGREHxLVMIFayR6XRIJG+9CqwJAZq8RF3qbUdC/T4fRpV9gA1YDCgiJrKnOzk7SRmxYOz9QM8/4yniGYoHpGjrMYkYGy9BIdyl/9q8XEBAMg7I6n/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IUz3RbBZ; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IUz3RbBZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHdbkMsWhLcDy4hbCj9pEWXR5Mou/RgCH54Mo0H4UYrwhC1Mc4mAhm0+5HSXuSDNTUiKcY4oCKEH5sUTD5xYmPHA3x2ldpdpUssXHd+JztvHdr9e7H/fnbuyR82AwsRy4nGFYpQxibWx6Se0f0ghLxuSzo+La3inR24E8bHVO1S/fHADpvuniTqAIiK8DqatxiUbjN2rZpCXA7r7KsQu4coWfqPU1VzqgyZEBQqpC+bLRLC/uodzSbXhd8/pGaWU/Kz62h+QMtgJMAIYScU0kqJBBXzSbETrVSkw2Lom7Yq3kVERZCW0lMUpccmLleY1w175KsK+HJF1jB52Mkk3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqgnzWIe86Q3Yl+ap8Jjgdf2++KDZgf1+K3pg/LOMas=;
 b=LyFaAb5rDcADKLhMeneTEn4MdT+ns1uhFAnaRk/UXfjtuY6t7MFfxFVXJ1V+XP9pI2XrJ140Ixovoy6Fao6zaIh+n3oiQFeqWwuqUnL9W/3xpBgmfwPvmg5tZew2k5kcFr4l1fC58pLY0MC5Lwa++tzu90DljSt7DbAmFKLksiz9SHfOpMCUkxCKmVEU15JRKXys0maiZdhMbZ2uQTk9ydXKrh+9h71WzrS44x3UQslEDhtNGlV7Rcm1bVwl7jNVfFxROMtC3oM3tAJvXAkneosLbzqtJTfoS54UAaDY8Zcrwri3QIeLKYw+wLnrmZa/+dn0eqXdtc6fBe9XcBJcQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqgnzWIe86Q3Yl+ap8Jjgdf2++KDZgf1+K3pg/LOMas=;
 b=IUz3RbBZfZFp3tIZzK6+i1oTO6yz+gfOqo2L2khs4TSstJNHhhlWFLM09EGAQDtKvqXEDb9Z9sRCO3M+YfSZdwyLLkOGJB/6E0Uk3DcK/pWOMEPE4xgZ37kMxvUzt2yFQI5C2y0NqcTxbm7Hg1LNPpPB4Ba8MtUfeYZdUUhRpDq4JKBdleXjgSqjaja0FO6g7Finl3eY9RYNQc0KkeljyaUekOsVeddPJ5xk8zoeOxI1OkH/pYPmjoHZbNq1kC9YR8cRN/G6KXt5vJ/y2M7RdMgTVeDv90+6fitVc32WC4lC5EWmYgdagd7Zq+v9unQY0QtAelx0knRa6xaBx6Ysog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:20:07 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 11:20:07 +0000
Message-ID: <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
Date: Fri, 20 Feb 2026 13:23:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines
 in DL devicetree
To: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260220103636.9697-1-frieder@fris.de>
 <20260220103636.9697-5-frieder@fris.de>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260220103636.9697-5-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::16) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b3e181-1655-41e4-6da7-08de7072007e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUVyc0dBNVRncGU4cjhNOS9YY01pNmlDK2gyTEtjRjF3N0phaFI4UnJIelNT?=
 =?utf-8?B?TFJGTkxKZTNDalMrSmtJWko3enBwUXBGemJVK1BhS3VsMmxHZ01XaUJ3NTBN?=
 =?utf-8?B?Wm1pOTM1R3BYKzkwVDdrM1RqYUZodTdkNXVZTWRrTGw1dnJ5TUFnWFNVK3Ev?=
 =?utf-8?B?VDJNMmgzckswRVVaaE9LNms1WG4vNVFtay95ZUZhSTRHaTJmSG9kMWhkZGpy?=
 =?utf-8?B?R1crMjBTYzk1STRDdHBGbHVrQ2JBOG5wbWhnSzBmL0RNd1hwMzkzcnM1RnN5?=
 =?utf-8?B?RHl5ajAxZTREZll6Z21QSGZDSHl5VEZtejVMQisvTGpBandtOS9hMkkyMHI4?=
 =?utf-8?B?T0YwRFlYTG94ZXRjaVF2aG9ldHRPdU1GbG1uWEN5M1JlN0hUUUdsZTRMOXAv?=
 =?utf-8?B?YnVxWGNuL0tvREM2bzhIeStvY1JvQk01dzIrYzdjVWlJK2ZMRDFUOGtVUjhz?=
 =?utf-8?B?STRsMFQzUnRobmora3Era2s1ZVkyS2ZENEVVM0dzR0k1U0NoV2o1NTZwak94?=
 =?utf-8?B?cVpBblU5dzBvYWxPSEdvdE4xVUx2TjFZeTFPYmVZd2lpQll0UTRnaWZNVXhX?=
 =?utf-8?B?OXEvdlFlL2xHeUxDRXc5Q2IxR21jeHZuS0xBb2lVaEdDMFBWVVpyR1BuRytL?=
 =?utf-8?B?a3l2cDMvUi9ZRVV3ZzJYc3loZkZvVHp2cnRZOU5BN2hWWDZXS1JiTW1VNjJU?=
 =?utf-8?B?V1g4c2NqQ1NQQXlodU5KNjFhUDU3b2Nkbms0RDlGRTk1Z25uNk9vbmY5Q3d6?=
 =?utf-8?B?LzcvZ3lvQXRtak9ZY2N2Y3BuOUE0MFZVMTh3ck4rdUhXYUt4Umd2SldZNHN0?=
 =?utf-8?B?eVYyQXhuMnRMUHYxRVRiZVltQTIrUjc0YnN4dWlCdWY3T1dDcmJyWjl2RGpZ?=
 =?utf-8?B?Mko5QVNGTVVpUHY5Y05MeVB2a29yRlhuRHpQMUlIY0N4Zks0b0hKbWJZSzI5?=
 =?utf-8?B?dVBSQlhMWE5VOE5raUZ5T2lHK1ZTYnJGd0dMdTkrc01la3pQWEU3SVNLQk9O?=
 =?utf-8?B?Uzl3Z21RN0ttR1pzUEZ0ZldiYTdyc25tejhxaHVFSWFKTkhpc0R4dXFwdm9W?=
 =?utf-8?B?OS81UFRoTWZJM0tXRURMZzZJQ2NHR2hBK0U5d2tBUHBCTG5jS3NJVk5yK0hN?=
 =?utf-8?B?QSs2Zkt3VW9xdW54cjRoTlR5Qk1LVmFxenJmcitJbkFtckV0ZnpEYkxxTWlw?=
 =?utf-8?B?cGhIRGtaVzhmSkV0M0U0aitDK080L2llN3NKUTVENDJSZURaV0dEc1VmOGdl?=
 =?utf-8?B?Z2s0akcySHJOb1VieFd2bW9CUlVrUlpZdU9ocHJpT0h1UDRpRjJZbHBoNUZX?=
 =?utf-8?B?UHlpQnYvMVpWbjd1RHRsVUt6ZUxJQVNOSVdJZFNZNE00YTlFTVQ1Lzg0bTNC?=
 =?utf-8?B?b1FtRGVqcWh3a3lwYVEvMzFNQUh3WmVTY3VHajNxSzNDL0FpdnpTZzhqOWlo?=
 =?utf-8?B?MzFkbDA2VFdlTEVLdmpFMkZoVEFiYXZQZGcyb3VOdFRIVEo2V0xNSlRGRUQ2?=
 =?utf-8?B?aitKUFV4SkVDTm1UVkRCbUpmeUpDck9lV1NFNFdEc3JmRXRtN2dtZnBnUDVC?=
 =?utf-8?B?bkUvRFplaDByb0NQZWx5VVV6VmlwRHA3SVdOYjM4ekRleGtSU2dGVGo5Zm5n?=
 =?utf-8?B?cU0xOWtRV0lSSnhsWmsxNzhTWTZSNFg3ZXU5bTNsZko5Z0JCTFYzaU1FMXht?=
 =?utf-8?B?MWlscmJod0xFVWFvSmkzMFJGWHN5LzJpQkNUWWtvSjFmZ0ltTkNNUUxJU3lH?=
 =?utf-8?B?Yy80Y1Zmcnh6bnZyVmd3VHRPLzVieXB0WXVkd2Z0a1V3eGtrV3ZsdStTdUkv?=
 =?utf-8?B?RUJUdGZlZC92TU1zZ01CZEpiVS9YUkwrRzRPMnJqa1UzTXU4cDBINVNYM2d0?=
 =?utf-8?B?Y05GaXBxY3VheFVVVlZmVmpGbHNaemF5QmZ4Mmw0cUprZStoZ2pSc21VKzlB?=
 =?utf-8?B?RU5ESTRMMGhoMmQxeXN3NW12dzNoSFJiWG5scFA1SjNDQkl6Zm5nQk80d2pM?=
 =?utf-8?B?VjNrandMaWdERUVzQjNjdHJibk44Z2lEazErUU05bkkxSW5tNmRrNUMvbDU3?=
 =?utf-8?B?ZUx4RTI2UnBDVWRJZW5MN0V3Wk85SG9ZcFhzd2xJaDAvU2dnV2hqQXV4WTcz?=
 =?utf-8?B?enI0TmJCejIyMHptTWdGVmFYNHc4ZE5WTmlOV0RFWENEdFMyWTF3U0pyTFdP?=
 =?utf-8?B?RGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0M2UVZtMmZzeWQ5N3FDdzVwaUZXQ0t3WTdydDlwaHRSTUpiRWtaZkdqM1dx?=
 =?utf-8?B?aVdsVTduZDVsRXpRNjNJdmZ6M0MxY0IxS0t3amJUeG91a3o3aHhGc1RxOVpX?=
 =?utf-8?B?SG5jZTl1cFAveHBMVnJYU2J1QjUzSnJNcW9HL0NRNTI4ZjdwY2ZpeGJRZ0Na?=
 =?utf-8?B?ZUtoVjcreHRTRmlGeHR4R2YwQm5MTmlLOU5MaUM4QkNqUHpVeTNyb2pTWXl5?=
 =?utf-8?B?WGVyQVV6UWJxNGI5QjhtSThyUDBzeDZVQkZrZXVvU1ZsRU9jb1VuS1BmS1o5?=
 =?utf-8?B?V3J1d2Z4S0Z5VXlEVGpvSFFwSkwwbVZneHNFMDc3ZXo0RlVSNEVmdHpUeWF3?=
 =?utf-8?B?OTRndkJXZTNodnppS1cycGlxNXBhQTlLNjY1c2pKTURkNlA0SVdOYmZVeXZ5?=
 =?utf-8?B?NnBtbEh1NkkrQUhpZUd6RURIRzRQR0Jyc2tnR05CdTd6QTl2d0k3NXRFMEJw?=
 =?utf-8?B?RWRZUXk2NHMycFMrWmpsUHpBS0FQQmZlTkJmZFZIU0MrZHhXckcxZm1TaGZs?=
 =?utf-8?B?bEw3RHo1bG5mdEZxeFNsSkdhZk1Pa2FNOUtjVkoxK3VZb1o3RU1JUEpTd3VC?=
 =?utf-8?B?YkhSWGNaZ1FRUjh4RVNZMSs2QWd4eS9GYjEzY1F3OENzUEgrZ3pVK0s0ZUp1?=
 =?utf-8?B?bEM2RkNhaE1lQi95K08xbDVZQlhSQ3pVZEhjcFdlcURVK1lTRXJ3ZEQ2eDNz?=
 =?utf-8?B?bjc1VDcxdFhjdzViRGcvWXBXNEtQMHlDdG92dFhPSTFKaFVja0dyeXZaWUtl?=
 =?utf-8?B?UEdYWEhKM2drc3AvU2NyRGh2WmJyM2NYTVVHdmp4RkNiZGxDa29HSXBRcFZl?=
 =?utf-8?B?THFuUFRQR1l2THN3QmI2cEdROFgxdENOWFN2RklnOFJvMEVqMVFwVUNwZUVs?=
 =?utf-8?B?M1hZc0hwSWw5elUzQ29rYWxhMXJHY1ZSYWtPRWM2Q0NjWGtPVjFjTzRtYU5H?=
 =?utf-8?B?SGYyMHdiQ1pkOVRVTmdPcmp1cGhpL3hLaE5xVFdHV1BEamhBSDVFNEQwRjRo?=
 =?utf-8?B?UU5zVnY5bWpQUDhCR00zc0V4RnZnMVF1dXBteTA0cW13WTRscTduMnd2NHRx?=
 =?utf-8?B?aWV0cjl6cVBmVW8xdFA1Rm12TXRFTDQwRGlFcFVseHBCZXlsTnozUVIranZt?=
 =?utf-8?B?SEs0djhad3NLb3pZbDk2dXBGOGRtSEFnOHJ1ejhyb2NncEFjRU40RFRPRXpp?=
 =?utf-8?B?RkdJQm1MbUp2aS9USkc1b1BkdlNsbE1yb2ovaldUNWsvY3BWNVUrb0ZmVVlM?=
 =?utf-8?B?dzZicUl6VTRrVFhJbkZYNm1lajcwU3BYRE9OSm9QZHZUL3c0N3Fmc29TVzd3?=
 =?utf-8?B?alh5MlQxUUhNZDByWi9kL2h0bGY1dXArV1YrSnF4TnUvQWhUTDk2dmJKNXRy?=
 =?utf-8?B?N3FBUnlDQWxTbDlJMnhoempUS2hjM01pRHB2MjhmSW5NNTRrRzZYRUpNY1JD?=
 =?utf-8?B?TGNra3lIL2FpZDNNMWs2RWVuRXFtNE4veDVXNDVHR1I5Q29qS2JiQXduMTNt?=
 =?utf-8?B?SmR3OWVCUHpmN2c2VGZFNGVveGNubjFaWTdBWVJIcHg3Z0RjMDkxbWxRMUN3?=
 =?utf-8?B?WklZb2FYQ0FWNlYxd2hrU2VLMTNHaDlTeUNNL3AxdnZPMW5jS2ltMVhwN1lM?=
 =?utf-8?B?c0R4UVVXaUVXeTNWV3U4L2UvTHBQRm4reG5oK252U0dTTFdqQ3FtQXpqU0h2?=
 =?utf-8?B?U21ldktsNFlNQnp0ZUZDUVJ0b2JCSE1BcythUEJZdVE3aEVFREhydk11Y2xX?=
 =?utf-8?B?UmpkSEZWUDBKeVhTUEl2WGl0dmhMWHdPMmJMVUdpRzRsdmQ4L0wrd3pjR2JC?=
 =?utf-8?B?SHZ4aCtpNmJyRTBrK2FOdGRpa1piRmJGRVJqUy9TYnRiWFp5cUxMeENWYlZC?=
 =?utf-8?B?bFRJeFlDRTVRbVNMV0pvTTd1Qnc1S2F1K1p2TURrbWRUdFRZVUNsakNsTWRj?=
 =?utf-8?B?dkkxbmFOK1NuU2pWeE4xb0hJSk0xQUh2YUErZnRNZ0REZG12RW15RFNZUnVi?=
 =?utf-8?B?em1nRXVBRU9ZQXdDL0FMOTBvNk04UHRUQmtzc2E4d29HSGJqbmszRWpOY3Jx?=
 =?utf-8?B?UEJCRFdhRnlmdHdlZ2FaL0x1UnBHYlR5dkFJVEhHNVZKQVJqQWlETW9xa3lH?=
 =?utf-8?B?MmtwenNQaDVpQ3JlckdiT2pXTWZVRnl3VElHMHRxd2VBLzVKMUpDMzY4a1Rz?=
 =?utf-8?B?UHl6dy9jb1NINGR5dXJFM3VudUV5T1QwQ0YwRk1YcTkvbnZhV3BWZFc4QUwy?=
 =?utf-8?B?dm15cXlQMHVrRTNRUENpb2QrSEdVVnZpMlhXSVBBVlZOWXNhVGxGdWpJSTFS?=
 =?utf-8?B?Tm9TSjAvK2FxVjhuRDNPYVlyL1MzcnlUZHZ5SFd4M2tzTUtFWnYxdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b3e181-1655-41e4-6da7-08de7072007e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:20:07.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVpteax3RtV3pRqB+AYuXQiRWpFaX4KCgLrPEPwHP1DkK/iut1PuOeLLMDRqbgT4MJFhnLyP39/CeyHZvjPNlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105

On 2/20/26 12:36, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> To make the code more readable, use the macros for the GPIO and IRQ
> settings.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>


Typically your Signed-off-by tag should come last so you need to swap S-o-b with R-b tags

in the commit message above.

With that you can add my:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

