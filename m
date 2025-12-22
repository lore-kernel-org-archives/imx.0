Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F378B4C92
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766369214; cv=fail; b=ZxGxtQoyMtk4nbBXQC2JANclhxN6y2icitCuu63K5U8i/OWl4f1CxuEUpfme4u31i/QF24Be6p+6QhBJ2IJxgpIcQHy4E0djCRAq7w233vdtfhFff4dXvB3tOYy1ynwkmqCdluPJY1oXP3tScQqtwuRnF8EjMlPLVwgN6ElEozY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766369214; c=relaxed/simple;
	bh=RRUpmvqkFWZ0X+pg/cMEx+4oR8xiNmGfMt2hCDPKe3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OZU0fi/tJKPj8t8aGhhKErQWTCwtkgtpXoI/L3WnbimvFT2wcqUxW7JElRHvj1KiOs1sIMHpG7ptIQtrbo/0cJjzJJC9iYyIToM7PS9enGWAgQVKpbL8mSQwEO4d8JpzzJ4m99jd4A8vOs5k9+bvlVJgA0xNkjoQcTh6KcUWTxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=emDVHT/j; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="emDVHT/j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdqrqMkEbhpRa/KePIjbuaHZ2pwTuIpuxMutmY5YqmlyS9UflEnMzzbo8ZMZXe6iFiDLlaRk4jT2Nca3iJJ9ZsYeEjcjWdC2EY/uP+m7Lhm43FQgDAa960MOZPZ1JMv/kpLjEJ7ZEz9Tn1PJyEinsKcfhNM0oA4SUvzJX0SLSPVt4+3EY1tKxWHaIbR343KrdXUHmi5B+reW+645vEUSCpXDYbwgKHPAtKU3eqcSfUekc3Fjf527WRwv087pji+EvezYiBYJt+E7AtZVpwtZQYliUJr2LPXRvu6PsrR380TKi1h4bn+VkY2rIMrh6o2cLC6cjprbthtJtHAVdq4V9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFWqxMWqijEyANpTG/Dze+PIH48mfYfp/YR6eZtBL6I=;
 b=fvUwL6fy6bVaFHpDKPnZlA9vvz1enadYcJO32OoWIJeSLWSxw+lhTifWcnlhe5Pogl4a5bOPyuBfBCmLjpbkpl//5LOi2a7UuqLcXiERdVw3g7spJXxW9kSJSCb1KkufSt1UgqpjYjGkv3QqpKsd23YlsfzG1ayW+ypZB+qZyoeCMcw/cDlkSnazjdzFGlQc6Xii2iQOYYDUkFUq3AD6pkKKmoC2LfZILIT+wVtB1xB+XAy5bSpUNrGzxJdpABINopqhw2ZYQ7Vv0x/iYRZfHmC4I8IxXRwDjmG03l+VOCJ3+OOsm3Niy/JDFZQR62EwlVQYmEno8YbcvkI7OYXAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFWqxMWqijEyANpTG/Dze+PIH48mfYfp/YR6eZtBL6I=;
 b=emDVHT/jV6Ryia4+ZqAtpBOdOoJm0F8lzicrPa3UL9nEeIOIamRrAlzKEAWBpdP9twRDwVIXLDKg0PykrXpn5506h/Z9g/hg+pxcmD0mxIkmvf1a0uMeRRBKtHqfY/wy2bGmvPq35PYpa3XRqXVYKdg9AVBJQaperngfqz0U+lXXhTOmEei15zl9LDaqNaN4xP71Dk4VyTiUgjB4RLCb+KpNo9zukEJo1/y8La3eHkZTsAfbAHQcYuGxXMyZp40vOMs1uLjiYAZnl1v/jih/BQD7/yzk+GZyDnDR9EojdkOAqZYai35r2SlaKG1byCY/4KMMIqtfbpKKkd8eI8cyYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 02:06:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 02:06:48 +0000
Date: Mon, 22 Dec 2025 09:59:43 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <6aj4j6sh2rystvtup7wmte557nhknwqs6n5qsa5lbd44sn3km7@ktkxzugnv777>
References: <20251219075447.3672833-1-xu.yang_2@nxp.com>
 <CAEnQRZCZJnkXCM2ACf3dXQ-ZynRB1q2zcarWLAZO_1TsL-1GcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZCZJnkXCM2ACf3dXQ-ZynRB1q2zcarWLAZO_1TsL-1GcA@mail.gmail.com>
X-ClientProxiedBy: AM0PR02CA0185.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: b449b8af-bf94-4a4b-6884-08de40fec378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0pIZStBRmhnd0JRdmVYVjlhYVA3VUsrZUFYdlp1NjlNdlBiU3hFR0VJUWZt?=
 =?utf-8?B?SDBmWnhqanhuRU5DN2VTWDZSYk1Dcmx0dFQzVVhwVFdDNUxBdW4zTmVhbmhO?=
 =?utf-8?B?M2xUU3lhSWliNXUwTlJoR1VIS0tIUGdPNk1QcXZjdlZlVXdhdmliVkF0ZTlF?=
 =?utf-8?B?LzkxS0M3Mi9IK0M3YmFKWGZhZzhQRDcwWmFad2pzSW1jUWs1QWt1NlFFQTMr?=
 =?utf-8?B?QXFCb2tJQWRSSklHUFk1NlRDNUprQXVCcFkvWTVrTkw3blBkQnhrbzFQdCtH?=
 =?utf-8?B?TlNnNWxlcjFWN3kxangzNHZpTGJOTWwyamxCTStNdzFhMWsxaE9oREludzg5?=
 =?utf-8?B?Z29HUkNyYmlJUkFzUVBDWi92OE9RT1ZKdTBEKzlOazY1THdqVEw2NlpVK3FN?=
 =?utf-8?B?ODVQK0ZLME50Zi9tc3RxWENGRCs3WEhvanRaUEV1SG9zelg4UldXamhZTjdF?=
 =?utf-8?B?Tll4czMramFoMTVoOUIwY3JkS1YyS09Fakp6SUFDbk81U28vWkoxNjVYRjRx?=
 =?utf-8?B?QmI3cEoydTg2T0pEckpJTkd5TURoSmdZWUpOcU40cWdZcU93amdKYWJMcndB?=
 =?utf-8?B?THRqZWx2YmdyNlpMVGVkcy8veE9JWmMrajZkUXd1TXJVRlhCK0pSSjZzbFB1?=
 =?utf-8?B?cVdFUXM2UUFiOGpGOUtxTzNZem9RWDd2ZVZ0NXZtWFRUcENYNEZWM2xhQTFs?=
 =?utf-8?B?RFAyVkdrQk5iSFhDUXpONzA4RWJDTFNoTkNUOWJZckw1cjhiaENsR09FVG14?=
 =?utf-8?B?Z3RuaVdLUjdvN1FHVkJ1cko3MWNvRmFwbFlWdFVjMGp3MEY0RXJIRjMya0hW?=
 =?utf-8?B?WEVGMWJLdnV5bExCVG1CVExYRFlDTkVqWFNDb1NUOWRQcjFHdHVqbklrN2kz?=
 =?utf-8?B?TE9MMW5BVzdQWC9vYVJCTjVsU0svMktsMGREbEhxMWRCWXhLcDlEbGtRdkZy?=
 =?utf-8?B?a3VuYXpPYXlJWGJSd1c3R2hncWgyWWpUay9vOWxCYWNDcm1JVjNpK211WGVC?=
 =?utf-8?B?aGJSNzhabVpZT01kZEVMMDlXUWRXSGNDSkc0MTNCUFFvUmV2RFNGNjFKWkFX?=
 =?utf-8?B?dGVFcEYxMVpGZGZUWmhMM2QwVmEyZldoeTBJaVNjQm5BMzNoeVBvVU0zZElG?=
 =?utf-8?B?ekUvdnAzVG9YRytmTXhrd0U3N1ZEMGs4cUxueFdFc3h1V29Ud0F2N21VbHh2?=
 =?utf-8?B?ZWpFcFpyY0pWblVoaHIwM0dZMUhOY3BFNGlDV1oza3VYZkV3YUg2WnI2cDhx?=
 =?utf-8?B?Z3QwTzVsOG1xZndPdlhOL3psVUo5VGVkanA1NHorbkt0YU5DVXltMld1bnJt?=
 =?utf-8?B?UUtuWDBzWHJYd1RNQXAxanp1ZUZlc1N0L3VscG4wK3dlakRrRFFlUE9xSmVl?=
 =?utf-8?B?MHNFT1daeVdQcWhXb0dhMUdNWDBNYjA0SDZodEg4V0xtRDFLT1NvVjluekM5?=
 =?utf-8?B?eVM3OEUvV0JuRC9KSmwrZDY3WXdCRi9jWHhrQUlaeUxCbUJHUE5TMEJHdHla?=
 =?utf-8?B?UjYyMXoxSWN1OEtFa2pRaFRqL1VMdTdNcW9xVCt4ZVBOelNPSnJaVGZ3OGFU?=
 =?utf-8?B?YWR1NHlFVmxPSE9HWlZkUlhxVWJ3cjNqSEZZNlJrTklHNzhORThqTWE5bWhV?=
 =?utf-8?B?VnpFSnJwdCtMOVpDMGxHOGZtYzZ2MDZ6eWZGL210TDJwVk1adXYwNUNLaHNV?=
 =?utf-8?B?WnNQdWsySytCWFJaOXcwVjZuQTg0UnlaTVZIeC9sUE9lUWVaUkdiOS9MS08r?=
 =?utf-8?B?YThtU3lyVDZpV3pvSEpJYStQWFpYUmhlbkNLUm1GQ0hJZUFWN3UzUXZxZFhE?=
 =?utf-8?B?WjBrTVphcFpyT1ZtQnU3aVJXOS9IdHc4b3dMV3c2WVVlZ2JtakV1bmhXNFpS?=
 =?utf-8?B?M2RUcnBCRTU2bEhZWWNLQS9jeTRtQW5HcWZLUHBtc1U0NmFWTnAySUVORlkw?=
 =?utf-8?B?T2prNFlzZmYvMUpIN2huL2JWRlpxMWJqb2JWanB3QkFzNzZDZXhKd3d6VG0y?=
 =?utf-8?B?UFJwQ0x3QzV1WmpGd1I0aG8ySTBRSFBPT0lRKzRvaDBiakhtWUVDOVFKV2VO?=
 =?utf-8?Q?wWh14f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhWYjlmNENnQkFyUy9OQk50Zy9pMnVvZkY5SksraU9lQjJSTzBhMU9SN2Fn?=
 =?utf-8?B?ejRLZTFZa05VSmVodFV4aEthWUlBKyt4R0lUcDNYbnhMbWprbW1TbGtQcEZH?=
 =?utf-8?B?c3lmN3ZUMUV0amNvMVdWRW9zQ0xhb2k1U0xDYiswTTJCRXh0bUE1SjhIRzd3?=
 =?utf-8?B?SzNVaDB6OE5oRHNFTlNVY085UXhyUVNEa0JmRUhqaUlJUUFna1ROV09pK21L?=
 =?utf-8?B?TE1iYzVCeFc2eGwvOS9GZmtiY0NlcU84dlRTWU83cGtEa1BXWnhvZWwyenA4?=
 =?utf-8?B?Z0ROUEFSTVBFK3U0U2xTZ2pyTVlWRElJb1NKNUpBWWJYTzZiSXZqNTVSMnlJ?=
 =?utf-8?B?R3JNbmVGVXVxbkgwMWl3WmswalNzOUovVWMvN2duOTNqbmZCMEI2K0ZGWEhU?=
 =?utf-8?B?d291dlY1dEN0MGJuTHFCOTkyT0FLSitQaUVsemZqOHpEVXdsZjlOTVVQR2Q4?=
 =?utf-8?B?RFdNdGxIeU0xVWhCSTFrVnV0VVV4aTJaazlpZmJ2MmY2bGQ1NXk4L2hncFFW?=
 =?utf-8?B?YlA4NkZ6QUpoWkdWMUdudUFKbURFZHRQSlduN2hhK3BFNUJCUHBxTzRtOWZU?=
 =?utf-8?B?SUVTOERsUmtDdGNYNWZSSEZVL0ErYkR0LzBUNWlnMjIrbzMwSFRZYnJ5R0Jp?=
 =?utf-8?B?b0VyVUc2ajYrZjBDeU13S3BtbDZUSVY0cHNrbHhGc2NsQVlvVzc3LzVsNWxE?=
 =?utf-8?B?dFJNMWZzUTZUZFVRQXFKUExIM0tsOGtXWHc4SW1MdFA0M3ZBa3hucG0veExj?=
 =?utf-8?B?S0ladTlpWFdNTEw2Q3BoaERKM3c1ZVcwYTFjZG9GZlNlUUxHd3FMWHU2UjV0?=
 =?utf-8?B?WXpJUGJiQTFKT0ZEMjdGNFRkOFJPQkkwejhCSnRiTXhZanJ3Mm9YVjZrK2lk?=
 =?utf-8?B?ZUUxNFI4NFFuNm84L3hRZkRsR2RZSVNLMWJlTXM5aml0ZXRyeDA2VFpJWElI?=
 =?utf-8?B?cW5FSUtuZjdHMjJMbXpXaU9obnhYVEU4OGFpT25oRGFxemd4MEVPZ1EvVUor?=
 =?utf-8?B?RGFzRHJ0dXVOWVdWMUM0NzlGQ1YxRERaanVmdS9QSnppcHRWc2t0L1duVkZF?=
 =?utf-8?B?WENuZjBTQ250QTZBQjcxSHJ6WTJPdUhHckhxZVA0ZUt4U2tsdW02WXArd290?=
 =?utf-8?B?OHNPaGMxMExSS1BPNGs4VnZ0aWQvM0hWS0xXcXpueE5VV0pmV0VabTMxT2Mr?=
 =?utf-8?B?NHBIR0NBRHE2ZE4zY05UenlvdEpGcEFDdnRITCtTQ0YrN2h0NEF6QXV1S3E5?=
 =?utf-8?B?TTh3NHZQemRCd1NXN0ZrRTNEazVzTXhPV2NERkVZdHF4UEdVYzZsZkZ3Sklo?=
 =?utf-8?B?b0dmMlZjeXVpejNBUGlPZ2ZzSVNzZjlyZXZXODJMbnlnak1GMGlZRTRBLzQ5?=
 =?utf-8?B?ekFXZEVCcExnYVRZNEtFMDg4S1dNY3NscXcwK0c2cGNPZTd2U1VWVTZKcGdU?=
 =?utf-8?B?V2I1ZGFqOGp5VmxaMlZ2MTZLek1kMGdJTkdWUTYvSVZwRm84RmhFQ3Azellm?=
 =?utf-8?B?a1M4RmRYZWdFZXp2a3ZJTnVzUmF2TWRIYWRTMGV6L09mYkliUlFORDFUU1Vx?=
 =?utf-8?B?V2FDVU95ejNsYVBHVDFPVFpsN2xlQlh1ME82NFhtUDBsMmpRc0g0dGUrLzlI?=
 =?utf-8?B?Mm9YSUNkbG9SV1dwcWxYTVFGT1V5c3NEVk9aMVl2UjF4YWkwaU5YYWswN3BR?=
 =?utf-8?B?ditERGk2d1hkWStHOHVEd1RpWEdUZjJGSU84clg3Wi9aM2d4RW15ZVExWjFJ?=
 =?utf-8?B?dUw1TkVLTWtVcWVJUE5DL2diajREMmFNWnRNT2VjMzlKRzdLcHlWQUswRGtI?=
 =?utf-8?B?MzRmTVNsZ2ZzSnZWS1FrMW1mSzZNSXZoKy85ZlJTYjNXL1hIUVV3MkM4ZGVr?=
 =?utf-8?B?RFdUTDFQdG12QiszQWhETkdzc2V3c1BzalFPaGR4TEZWUkhpVzlodVhoT3FH?=
 =?utf-8?B?d3BzNFVzb29IM2hxUi9INTVSSzZWUFFIRlp1UExMZDYwUXFnZkoyd2RtaHp2?=
 =?utf-8?B?Y3JiT1JBbEhyYTNZclFoSG9KYTVsYU16ZmVrbkVJU1FmcWJXV2lwY1hXblNT?=
 =?utf-8?B?U2xINXNZQzlzMjNDR0ppYmowNFBROFR2dk5mSGN0Y0V5SGtZVDhKWitTdHp5?=
 =?utf-8?B?azNzVm9qN1FzNzJDR3ZaaFRmYVNLV29DZTNpOEx5YzBZMFBXeEhsYTBXMlRP?=
 =?utf-8?B?TE8rL21VY3B0TE1xRXZKSjVvR3J0UmpQZVBPWGFUWmxsUVZTREs3akwvOGsw?=
 =?utf-8?B?cUMwR1MwT2xIaVovTG8xZEpkVE1ZTFRBSHpjRXd1N0FwSjJoN3VMZFg4SG1n?=
 =?utf-8?B?Mm56RzBPczczRE53ejQ3WGhCaGxDb0k0OHpvYWhqbzNZY2xQSFhXUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b449b8af-bf94-4a4b-6884-08de40fec378
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 02:06:48.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAE6xKG+D9mcaJsozOEGQve8YRQUBY7ajy70Z6dfrQbvwouAmOiWQXGqpyhIu93Y66dK/7FtbgN2T6hSZsYScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583

On Fri, Dec 19, 2025 at 11:34:56AM +0200, Daniel Baluta wrote:
> On Fri, Dec 19, 2025 at 9:56 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> >
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
> >  1 file changed, 220 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index ad8a55012e42..cb2392008ad2 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -1,8 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -/* Copyright (c) 2017 NXP. */
> > +/* Copyright (c) 2017-2025 NXP. */
> 
> While you are at it can you remove the (c). New policy
> from NXP is to use directly:
> 
> Copyright 2017-2025 NXP.


Sure. Will do.

Thanks,
Xu Yang
