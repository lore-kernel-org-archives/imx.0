Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C65334C11
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613773; cv=fail; b=JnFqoOBXOzWSTeJwlkIYt70IEEGDPIEtU5Asr78td3NyP3x5pXO2stOkuFJ9qtVBjCCAqLaT44I+5rjOYOVtaqW4KV+qmieGiixI8jjj+KFwh8Zyj9m/5MddpxEAtV08enO5ROz7SGSAxHw0Y/7yFDTfs1H1rHwdOK3uiKtDaC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613773; c=relaxed/simple;
	bh=Ar606uQlfvMQluAQXxJ7UwDIHYKO5cEpGtAb3i31mEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fbSmcp2a87GqKSFD3CvK0B8/etSpu+HyJKJKJeyf0rsccVB5vnc/5ztDC/cZ0pudUfdXqhNWP5o9eKO7DbxuG58dCM2oAtQhYXwn2hQJVDift/EmIhqYG5BoKGzo8aI7mglBiFx+AouORrRH9Ri8Y+eEQTTj4B96JDY5lxC/YeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SKQ/QGyg; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SKQ/QGyg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fecl/Ajpxgo9vyh+2vpxvf2uQjHrZOrU9DV7oWVwulXuPdg6/EOkbqrhtELxmxbftpsInfQ/tOcXIDcoOhAROZ+8S10u/JB61gpKy0QtzxaCTqwATTEwozYSxy8Winhcu5mpbvb9h5+EW+KmagHnTDeJyWMAddAB01IBRwftbaC6b3DVBv+/RQh+dUf9mLmJTQRxdYEz3y1B6USdPrGzR2oBpYg/IEiXdYsaPvsuWNuDgOiYWF96A2iIXTRY9pgESu8xBVUIX/gwPGGtB47mOzwJtSO5zlkScNORckV0BEX+eGisO6kZDUz8TtPflKablasS4RVtThz/fhEa76Lr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLAQx/uxy4gkqwvbrW75mqB1G1oXSJM/VkiHFCPTyGw=;
 b=l1TyVgyVIbpDoX9bmB4dpuWXneDZUIWto+rfYYpCgUkPDfmOI/QNdU0GSluD5R0JW0qpCFq0ir0x5U8MlP+IH9xBcP9y4PApjV9KJEOkK/7L79thPtytnTYZ11keh/E2uOAYT30gaKFF+zESzi2JMLKb9ETi1lCgO/1TFvSy6uS05A2UZBGCSGvbhCN8LdzaibNvFyaf6XD4ToHo/D+oEacqQ/kUTWk7DldCbbzyace0InepHDvIMujuS9N6XT5SnmJFgbRDOcHxxjGxYO2vYasuaYVP2jRFJqZaCSI4qgRphkV9qulyT3IO+p1TTrdEGIJyVLxC/IQJ9l72w8PkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLAQx/uxy4gkqwvbrW75mqB1G1oXSJM/VkiHFCPTyGw=;
 b=SKQ/QGygdLubdzk3kszl6YdOhLqX89MtX0tQiCbwszgDis1jXAF3ivbfjbwkhUCWc3MFjY49UYg5Q8wjBYh5cR0yoAF8006vDnbZIFVWfaqv9s1nD6OcIpbtPbP2PWIIHCXNIOMUJD4A+vlw02+CnMTqarHxdPfq9PPLAEKIt2XZIh7kPjV24vecQEAJogV4e5kjJ6ouS80oK+6Q6Yddt6vgyVZy/l9lLoWsnBWCiIOOincm/GU+uhwM7V5gm8eSgSpTiph59Zv0NCpVdvJI4o8arMFwqGuxRedIpLGlUUDRhBpYCTzQ8oKg101EHiQ7WGpx2Pv/vizstMpvJLC1gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10299.eurprd04.prod.outlook.com (2603:10a6:800:238::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:46 +0800
Subject: [PATCH 7/7] arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-7-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10299:EE_
X-MS-Office365-Filtering-Correlation-Id: 1742178d-e95d-4494-6f65-08de4c507b70
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1FJZXV6WTBic29NcTVUeUw3Y3RqUnpUUjI2ZUhBaHZ2b0hteHRVZEpMdVdQ?=
 =?utf-8?B?NjVId1NaMmNtVmgxdmxySnNPRUJ4czRWWWVNNHdXUHdXR3QramtVZFF0cUlX?=
 =?utf-8?B?cWlyMmxXaEUwUkxRbEd4aFJmS0dpNjdFbW5YS2NZc3lTMVo0SGlpcVliaHhU?=
 =?utf-8?B?S21GTjM2WlRVTysvei9NQjFWc3pkclBLa1hQRlFyZURhUXhidCtNeW0vNEM2?=
 =?utf-8?B?T3l6SnNISUlYWEhRNWRrSEtBNE12aUhrSXlBQTdyYjlqd0VlT3dxUXJFNkZM?=
 =?utf-8?B?eFNSS0R0YUdscVBXSXRacnlNcEcxSUtyT0JNMXc1b0RQUmFzTWs2ZmZyTXpx?=
 =?utf-8?B?VnpuNTBTTzA5TDdhZTY5bVpMenluVnRTRXlMNFJnakFxMnpSRFZKcitNVlQr?=
 =?utf-8?B?K0ZFOW4wcWRZT3ZuTk9OOGRHN3FMWURnSzVsVVlnajNNNWhOMzV0NTU5anFF?=
 =?utf-8?B?c0c2YWRRQ2JyUTJYc1h0WmJWdUtpdFNFbEVFV0R6bWtZMmM5ZG1vejc1MXZa?=
 =?utf-8?B?R2EvQ2FZUWtsVXUxSnJ0RnFBZENsN2VCVVFsb3I5QW0yS0h1eU5ZSUI1L2Y2?=
 =?utf-8?B?N0NkMVlCM1F4NWJBeURSelpUUG1ibVQ5WnNJWWJ6MTZ0aFhSd0pjL2V4emZu?=
 =?utf-8?B?amVSTFc2VVhWZXQvbnZLM2dLb0wwQXZObEgyZmo5NSs1ZFVaYzkxRml3Yzkx?=
 =?utf-8?B?QVdqdDZNazZ3TmpJYVRNOEFLSEVxUUF5bFJZcXFpbksreEZLeVR5MHpBRjJZ?=
 =?utf-8?B?dXJRSlpXTUE1ZDdPN1pXOU9INXRac2Rzd0dWdnFKWDdseUF5QkM5di9aM1FE?=
 =?utf-8?B?TlRWYzEwKzlXRlJnMXE1U3ZYNHR1UlpSUk1xN3lJMjB5WGNYTnRBUlBuTG9n?=
 =?utf-8?B?ZlRYekE5bkNOSjBTOEJvT3lqbGFoU0N0MXYweHIyQXFVYUtVdHRhREMvNTNw?=
 =?utf-8?B?K2dFNGhGcVB5em1hakhJTWs1b253UThFVDZLc2NXZC9PRkJ4STM1VjdFeHpk?=
 =?utf-8?B?RW9NRUE4MTl1MGgwbzh4QkEvZ0UzQk9BRUZPUkg0MVVsd1o4OG9vYm5OeGRO?=
 =?utf-8?B?eGZQQmRDdm1pQTlpTHlyNUxjNzJqT3pnZVhlTkFtb2llTndKWGpsVXFtOXN3?=
 =?utf-8?B?QlpGVUExMTNJREtkOU4vaXBxYzJoYTR4MGhSYWt6TytIV1RrUlBPajdkTEY1?=
 =?utf-8?B?cmJ3R3o0dE4zZ3V3dUFpRllIb3lzY3lQUnY1NXpqTWtSSjNTQ2c3UG04VCs1?=
 =?utf-8?B?Rk5Rdytkd1l3WGFGMGNKYTRKeTBZdnlqRHBtTnZqY0hHb3RjSTN0RFJyTmZS?=
 =?utf-8?B?Z2ZVdlE4Rm1xd094eHE3RGtnbmVCR0VVZUFqZ01adzNmTGlIRW1QT2FhUCs4?=
 =?utf-8?B?NG5KMjdIOFdGenRCWlpMUGhBQ05heUNoVWN4NFA0dGhKbzZLMGZwVEdiczZK?=
 =?utf-8?B?RmRkMEg0VkhvZDNKU2F6bzFTZGlNMEpoUFFzOXA4U0YxRGpiY05yVHVLYzdo?=
 =?utf-8?B?c2o5NVQ2UStYYlpEb0tELzR2NmJQK3EvUExXVGRESGY4aHorMjc5N0lBTGJh?=
 =?utf-8?B?ay9jVXNGWEk2VDAyU3FLWm56VzNlWUZuZjg3aDY4UEZhS2V6RU4rQjdnOWJn?=
 =?utf-8?B?em94dHNjMXMyT3Jwc0F5eWRXRDErSDg2V044NU1EajlENEdxNGFxRWJVajVJ?=
 =?utf-8?B?bUdVUEdNZ3hJNkZ2aFprNENnNWRVSkhTNndzRHZ0ZjlUU21iUGxuSTE1YTlJ?=
 =?utf-8?B?ZVFqVS9XS29LRUZNU0tvUll0VDZCbENOZTduUFpBeFNaZzlUKzBIOWZHMWhL?=
 =?utf-8?B?WW56ekJrOUNZS3lxejFvQ1ZaUUkyZzVCS2xEUDl4RlpZb0hKWElkZDlKbFdr?=
 =?utf-8?B?emE2NUNCNHJPMzZheHhEbDNOdTUzdHdPN2RwZ3NhaEhmZWRtNFcxa1QyV0x6?=
 =?utf-8?B?Y1hycjM4cElrV2NDOFpLZk1hVWFPUkZaV1RqRlBBVEpXc3J2NEtxOEJKc0Fv?=
 =?utf-8?B?WDJvS2dLMzdZOS9qcE1GU0Z4SDVyZVJReXIzbFFvbjliSDhuY2JWbjlFb3Ft?=
 =?utf-8?Q?fUF9x2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UENuRDBuQVU0WjlBWmhzWkZ0YlBuclUrRlRTUlgvN3gyRmlFUlVxUmhZZWk4?=
 =?utf-8?B?RlRlMHhNRkhyOXBsWFFNWDc0cjJnWnlJTlBUeE4yZ2I0Y2kxaisvUzQ1TUwz?=
 =?utf-8?B?ZlV1VFJ3dS9Zcyt6MDZOMThiMTk0T2RyUUdLY3N0RXArbXQrY0pvMEhvWFFu?=
 =?utf-8?B?YkZuNmdna05XeVlKYmtpUXI0c0tjMU1iQ25rdDBYQ1VzUWcvbi9Xd2FXVDFW?=
 =?utf-8?B?L1YrSW5hQU9yU3RYWHF3UnljNE40SlZEOUk5SUdHN0dZSzFZd0hjMDVWeDh2?=
 =?utf-8?B?WEIrRjdEQTFnaWF6dkplSmMrMG1BZFdPUlBsS3JhS09TNDIraEtrOGwxRUdp?=
 =?utf-8?B?b1k2RWZLVFNhMzRBUzljcHRyaHlsUmFHKytaRTVQbkwxckhuNjhWcWdHYVdl?=
 =?utf-8?B?UEVkcVh6SGlVWC9ua1lpWEJXTks1WWFvZTRWNXYxbEZRK3F3blAyTG1hQXdC?=
 =?utf-8?B?QkdOZHBZN0U5ekFuZlJ3NTFycDJVWkhGeDdsR251cFF1b1RRMHdaOVJSWU9a?=
 =?utf-8?B?RHhUb3htbUc2VkdnTjNMNmhLT1NGR2NEbWY1SFA1WUQxaXZocVRPcHVjWVl5?=
 =?utf-8?B?Qzc2Z1RkYXpCU2RXVWNtR25vUUJhbm9uN1E1RlVmbm1mMGlndE1tVUFsbFBr?=
 =?utf-8?B?QlBYSGVYWlRSYXh2L1JjcTZ4VHI0VVZsekhVTWYwbEZrNTV6RzFrQU05TFFJ?=
 =?utf-8?B?Zk9icjVsZjhyVXVMVXptVlJVQ0tWaEtUaUkxY2FSdEVsNTZrbG9FUGZHT295?=
 =?utf-8?B?SjNEdkIzUTJxaG1pNmR6eDRoS2lXZ3hrYVphZklWZFV4dWFKM25QbHZ3Tkgx?=
 =?utf-8?B?SjNmQnNJNTNkaUVYNWZJbkorRmRUOWRKNGtjOVpwMkQzaStESFVsUjY5TW90?=
 =?utf-8?B?TlBEWkQ0Y2ZXVlcwSVMvU2VFQmpLV25vZm00TEhXRHNtZXpwNGFKUzBRdUk1?=
 =?utf-8?B?bThPK1J5VkpCWmNlbU8xeVBCTDB4OVlsVCsyaks2TTRwUVhiYmJmNzlYY3JL?=
 =?utf-8?B?RjVKdExzU0E4TUk0S1ZJa3B5bU9jeEdPWTAxMXNXTWo3MExMc1MyTjVxcXZt?=
 =?utf-8?B?QXl5QS9FQzRxY1FpYUpYVDJrRlh4eG9SRWt0am5zMUQ0czhnWlJZUXhVZnlv?=
 =?utf-8?B?TEdXUlI5Z2hFNHNabFhsdnpzL01yaVQyMWlDQ1I4QVZJS01xdGRrcEwrRFUz?=
 =?utf-8?B?R1FlZDRQQ1QvUkxsVlQ0T3lreWJXSWxYVzkzQUpvVWJwTEtRdW9YdlR2V3lU?=
 =?utf-8?B?bUpCRTY0TkNHYmgrRkxzV0VXWWp1RG9kSTFHaDBEaWxPY3FIWFpxeTlGOTNC?=
 =?utf-8?B?U2kweTVXeEFhYmtHSERzM1VLbFN0aTZJa1N2SVQxSTJLbUJ1UnN2eGhBeW9r?=
 =?utf-8?B?Z25NZm0vSjVHMnVkTHVOZUtmUUtrWGpLN1pDenBhbFU2N2IxbjlxSnAzdXk2?=
 =?utf-8?B?bGt4VEZqZk9OUEZXM1A2eWJpMEMrSHBMTjFtYmUyU290VHRUUnhMVnc4T3JS?=
 =?utf-8?B?RmJVWUlpcGJLREVXRy9LUjcyQlh6UG0yT3FhbHlLVHRUV1hXVVhsa0xvSXZp?=
 =?utf-8?B?NnVVZkl1RGxBOTNEbitqWFBYQW9UVXo1OGNZcndtUWphVDRnR29xSENQQmZr?=
 =?utf-8?B?eW9wT0FjYm5QalBCWnhpVUVORlNaNEp3UFY2d0Z0ODhhc24xN2Y1WDlLdjZj?=
 =?utf-8?B?WE03YlltcWl5YjBJNDRkUzlEVUhVK2lycERwTnVPK3RySldjVEc4WFRGSXJk?=
 =?utf-8?B?eWxPRG5WRFN2ZVdSTzhWNnU1QnFVa25rTkdwaytaeUR0R2xFQUdpZFUyb2pv?=
 =?utf-8?B?NkYzcm05S0ZZZC9CWUhQb0V1N1FpZ0xOM0FGcE0yRkdRUkRlTFh2TXJyb2J0?=
 =?utf-8?B?TjAwV2VrWTBMVElSdXBNVVp0Ri80azZGN1E5Tkl6M28vNHE4MHJlMTdBYVJV?=
 =?utf-8?B?VEFmY25TNkJiWm5vbElacWNCL1c1TVdvb1luWThNdXhra1A1Y085bnlNdE9B?=
 =?utf-8?B?RitQT1JxbE1KTllPeitKQWxxZWlVK2F3bndmL05SQXpkL3dZSkovS1RJUVpi?=
 =?utf-8?B?cjhwUWlUc2lQWW9zMXNGMVlCZTVwSlo2bElndVBZeFRPMjM1UitkMERzNjlv?=
 =?utf-8?B?U2hTbmxrRGRtUUlTTVVXeUFteTVxd0piNkJrbGYwMWpCYnlIb24vOEFKc3Za?=
 =?utf-8?B?OVVUNjhWc1pRUUdkK1VGOHdIaW1od09NaU1CWFhJcXJ3dHVJZFlhSlBRc245?=
 =?utf-8?B?YU5TSWlEdTVJUVNDbFcwYmVwOGh6dzcwN0FFR2kvMnRDQ0UzTmVlMHZiUzBT?=
 =?utf-8?B?S04wd3A4RW9tRS8yTXB6ODBLM0w3bVVVdzFFOTZBVkhYdHlYUWZMQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1742178d-e95d-4494-6f65-08de4c507b70
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:28.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6d9eMqHFqII/oZv1g2OeS6OE7KsV6QX/xsUbJJb9D5ogGOLcTgj8hl+XSZJc1PpdrudVPJiKnF8bW+zI7V/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10299

From: Peng Fan <peng.fan@nxp.com>

Add nxp,ctrl-ids in scmi_misc node for wakeup notification.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 04de63e63faa35eeb8dba57a8adddde471b0b7e1..d6cd6f279f5ac935b3603b5a4f6fb13b14816f65 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -8,6 +8,15 @@
 #include <dt-bindings/usb/pd.h>
 #include "imx952.dtsi"
 
+#define FALLING_EDGE		BIT(0)
+#define RISING_EDGE		BIT(1)
+
+#define BRD_SM_CTRL_SD3_WAKE		0x8000U /*!< PCAL6408A-0 */
+#define BRD_SM_CTRL_M2E_WAKE		0x8001U /*!< PCAL6408A-4 */
+#define BRD_SM_CTRL_BT_WAKE		0x8002U /*!< PCAL6408A-5 */
+#define BRD_SM_CTRL_M2M_WAKE		0x8003U /*!< PCAL6408A-6 */
+#define BRD_SM_CTRL_BUTTON		0x8004U /*!< PCAL6408A-7 */
+
 / {
 	model = "NXP i.MX952 EVK board";
 	compatible = "fsl,imx952-evk", "fsl,imx952";
@@ -264,6 +273,14 @@ &lpspi7 {
 	status = "okay";
 };
 
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
+			BRD_SM_CTRL_M2E_WAKE		1
+			BRD_SM_CTRL_BT_WAKE		1
+			BRD_SM_CTRL_M2M_WAKE		1
+			BRD_SM_CTRL_BUTTON		1>;
+};
+
 &usb1 {
 	dr_mode = "otg";
 	hnp-disable;

-- 
2.37.1

