Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111396;
	b=3jbb5Roqw00LFV7TR6IzmG/Cb+ysF5PjEKQRlPJDTyvs9N3EcHcYBwV8uixp7uy0vFmq
	 dIZJp/kSvJcKh+2akEiomdRRfvmlLTPLX4CUsLKQ82lriLRaoDmGabBhJvoS+QL8mh4TD
	 /SjQjHO4cRDmZ7QZTTr0+D+pZmw8cZJwiIyeOr136hwTetBf5VHaGVckYUYSTw71tw5v+
	 3OHn2jC8VCmF8qou+14DEqaV6riJPjdF35EeBJL9D9x4hKSWou2ysFI5a/VXzYwrqNuTt
	 ZVj/IchphUBQb/QXBVKUpxx0Umkn7M37gjA86+qEV0ZHq74Ka5liZu17ck5Xw9YZNTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111396;
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
	bh=zezPWWJaFgNGBit8o31PEX16ChqH3n+DrgI9mvVVXvE=;
	b=4fO3WtICjUv/2X4Ot5MExMm2OyTRmjz6dRNEaF+Czx/Q9zc9MaYuMNfKkD81AyDsq2Zg
	 VzdebQVp3SK3SdNP3qF7scWUxfLP9rRthoaUjTUr4FACwPg3Qj2vbcVXEVBUvsFF6D3H4
	 9LdV/2gPvYKpefHP9JA4qZwBonl040SfqJQ+8w3vICu3ijMhWr7goJH45YwTyKN6Y0sfD
	 vjyiWfO/i3XtTe6LA1eb8KOSxWkNZIQ2bf+FmF+rw+CzIbZCmHqk83nvlNpLPR1eeBm7b
	 akoqHSXp9JVzdTgnubJpzzpmYMXzsCUz9VyvNdY4eDekz9Ws5wO3ZxZrUHNkEVoOqug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=to5urJUW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.32
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA960A261B
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 18:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FA960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=to5urJUW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhZJMzG2ism1mN59j5ciWee3ku5Xybl9vof0Ej+Yg5GDntg9Ix7YJY/twYKEaaey7dRJR1FseCTwsLPX2PAn/eL3jBuVXs1xkevs95NxosmNAN85yR7cYL4GUkJNf/zC+tXps2MXCo021z33wyZ54ea5fSCjTEaOkQgrBIe+SOSpKJjVy3LQmiOoZYhobeCsFIlNnOmsRB3R/I4qyyBPEE361HpgKBfIOn9N2+cuVJq5XBVyO9CJ2ghpsLIqoq+HZNQOd2vtv+ZqG8AIukewEJwMiKgAAxw72CtKjUeDhqhj8oerayQaUJ2zbLBI2g2GAhg/hN5gOVNQnMsjTTSO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zezPWWJaFgNGBit8o31PEX16ChqH3n+DrgI9mvVVXvE=;
 b=uTpivrXpXiUEVqpAGNK6lsSU8FZ/eHxymjt1hIslzdDUwXtP9HRVRmj8L85B9GRthZbYeyHY6HPaVKs8xS1v4l0YA5eeJ6N4978tX2fpm1KtcrxFyJ58z1LFKAxbqaysI9DoPQopU1SMcNYGCBhRm5gItT0bsdQuhainivl8Hx+Z8T8ilqG0GKkguvHiWqgk01h4XVydZkED7ckIZcuXBdj+kHJ6XAMZHTae788yPDCnHQEqY98nvwpEzheyYGUoIVikJcGsj6+1sKAlQgYiqnHdrGTXtU3Kf0wKedO2CYWQwgu+u3+Ha5RoCqnFHy9W2cGeekSnKEYXKryU+sHWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zezPWWJaFgNGBit8o31PEX16ChqH3n+DrgI9mvVVXvE=;
 b=to5urJUWeHrO4uJoilizzgEskUuOr+7xnTvjsKRsvoeeApTo6570rzHlC0ScedyC2422yveBTEx+DstbLDsC5wIeB4a8iUiAJ2OnzziIcHQE6WU+iqq9Ll92uDznwLITknfLfKiq/fQK1BAYRJPgHC8tb4q/ptllKVjY52BPJJR0idN++HnGrAOMduIKJHuUnlq8uRQ2GMZpMJU0SCT8uJ/QpyLWcWTQJPsm/M6ZIXFXY3V8kltsOCXVarTLstN3qL4TdTm0xbcqB7UEuRDtfOciYLLuiosoQj2v6A3R2NBJw+LlrzY7GPASHTXk9NRrIulhrn9bvuaS5ogvwYSJ8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:03:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:03:04 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
Date: Thu, 19 Nov 2026 13:02:57 -0500
Message-ID: <179511133537.1546694.3592040633584814473.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105101739.10614-1-stefano.r@variscite.com>
References: <20261105101739.10614-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0041.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0f405b-fef3-4883-b904-08df46675bbc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|10067099003|56012099006|11063799006|261022075727099003|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 t61ZdQflr3puDpNBGU4LQ3q6zCVIYM7J9nsPnjsYtsa8LSg1U6gPL9aWsysGOTUXh28SizQODgZB5iy5h8B2PX78eIpj/er0iLa6KldQHdmjVbe0yB3twQC0cOJcSaKC2F/PzTaGE32kpzlijLlNXmnrrcfQY2snjElCnuXD+vgui/CQJnmnAJ53/SV2oFQMjb3MPHdgXsZQN/suXSYQn2Ia2wZxt4U1rOOkImFALAnevHkBlE4ldHMpFjWtw+PcS5qpdVmS+gZAr8V7KnSRTnCSs0j/atQyf8mmgLKhD+hNWHdpfrfPaxERNnGMagZYwZp8eV40UmGxq45B4QGCYY4piTNu4m5prNoiW08t42uH58GKbGefwlzVr2874lUPLqVH+aJhiRqGonbWyvfh7LzlHau+i51g6/dg8S4RsEsxSTW6WN5LzgD3VNrprvF6gIoS4oilTi0MfsVTgwMck6VH28ObgX9alf7c7mgLYsig+u558lTP9aCxq8fxcLs268LKoA5HhbWQ+uB9cBGTC3BOkEWdp0Cgb3VoayJjb+HL1v3/xZ0r24BDc6BVY7if0ysL4rAXvGrSie0HcJsVKLuW/7mdvFSweM2W5GVROnPa5B8tJHBBpYDWHwRNl4FsY7TLldO3nkoFJm0oxRhImUH0VCMD5qyIhTGkWtrKa6k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261022075727099003)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SWc0Nmt5bDVpemNZbjJRTTQ0M0kvT3BIbnlJNmdUNlFPQnphNytIbi9XQUZT?=
 =?utf-8?B?c2hrTHV3UUQ0RlVoL0g0SU9nbXVmNzlDZG5ML3pDUXZhUVNFOXlJZVZKcm9w?=
 =?utf-8?B?anNLeTIybGgxdXgrdStzVDYvVXh3N2FUVWRkSzdnTmpwSFhRblZ0dmNTenlk?=
 =?utf-8?B?TTU1WHVmMDZvQkZMVCt2RUxDZzNPbkdMYmEzNnBFN0dGLzRBY1ZqcWtMYktU?=
 =?utf-8?B?OGpmU1NaMGwxcVhDN214S3dma2hBcWMxa2FCckp0RGJUSzhNaE5GMklnYTA4?=
 =?utf-8?B?NWhtdVNYdXJTOEV4WC9FbEZ0R1FaeWc4TitZSUJkZlVzWFdneUFUQlhudTRD?=
 =?utf-8?B?SnNrcmpVd3hHZWZ4cGxlcVAzdWdwaDdkWFJrQTJGMzE2QVhHMHVxSVArbllZ?=
 =?utf-8?B?OC8vanpnWEx0bUhVUVk0amtPRUtKbFJWSEg3NzVvNTc1ZlAwcUZUdmdzbGwy?=
 =?utf-8?B?cW5CbEtGcDk3elI1TVB5TXkzREk2UUw1d0VaVWVRUnE4S2lsbjFYeWlzTEVC?=
 =?utf-8?B?cUJiZkVNRGVVKzJ5ZDBMd3dteDBpQUZkc1MvMnRqS2JMbUtleWx4Mk9lUVR6?=
 =?utf-8?B?c1dQSGZFS1BLMzUyYWppWVZkZHAvWkVWRW1SbHJiZ0RadGxhQlJlN2NadDYy?=
 =?utf-8?B?RFVLcVR5dE5sZFlsb3liZ0xxQThxL2toTW9XWkpBczZ1V2FjekozRUJIa0Z4?=
 =?utf-8?B?NXdHZmVoNWlMWkd0RCszTnY4NGxXemkxS1BoejZtYkJsNldvc3cyeGREYVdB?=
 =?utf-8?B?amFZakRhWFFOU3JtbTVTZGlTL2F5Mmk4VStJUzJEQWQweVgvYjE4NEJuVC9m?=
 =?utf-8?B?c2JnMVhOaUZSbExlbUcydVJ4OUFubzlEM3dSRjBoU1lxa0dSaGpnYytxL3RR?=
 =?utf-8?B?cjhIY1hJTGRwQStpOGtJdjduM29jWnRBVE5ic2pCNnAwU1FVVDZMTXF1cUYy?=
 =?utf-8?B?M0dHREF2SU9vRUxYTDdqcDlMTnNVUEYwQ3Ywc3VGTW0wME1lUzNLcm4xbUdT?=
 =?utf-8?B?Y1c1VjRBQ2k3Vy9ELzlJcEhHL0k4NTBJTDNsM1FUcVFqK0JNQ1RsSFBrRUFq?=
 =?utf-8?B?ZmtZV3EvcTRtZzdFYXlQNUxjdFJGSXdFOUFycHcrcHpMUkpZdUxtN0Q2ZmJt?=
 =?utf-8?B?MU9FNFpEQitDL2F3Q3pHTkw5Y3YwZGU1SHFLcVljWVdaaDJ3TXlsd0h0Vkk5?=
 =?utf-8?B?QTc4T1RmWlhJZlBmMUJZbzJjam50dmdJWmx4OHVxd0ZMbFgwNFNhUXpTWk1H?=
 =?utf-8?B?Wmp3VDhtSlRlRmlOdnpaOWx5Ymt5SDcyQ3EwL3dBTTVLYmtyT1VFNHJqd0Z1?=
 =?utf-8?B?WHRobHBETjlRcDNTRlBhbjBDSmQxbStLOEptZVQ0Qjk3U1NhNTJBODBRK2Zy?=
 =?utf-8?B?ZWEvUG91Y3pKanlLVWx4OUU5YThtOUNQbkxLVXlSckg1eHZuUUNkZDg2VHVj?=
 =?utf-8?B?bUVUMkVYeVYrbHBzZXNvM3VmelVJOTFibnF0dlJUc2JzK2lETElJME1vRTdF?=
 =?utf-8?B?MmJuMEUwakhuQUVrR1Z5b1pLNUNMeElxS08vc096N0JiVTRxS0pHcVlGOCt0?=
 =?utf-8?B?RUdQVyt3UVZCMnVMdWZ4TEI0bmNna1dLNkdrNVBtdUtxSitBWG5kR3YyaFpR?=
 =?utf-8?B?VE5EQVdjZGtDNkl5M3VKbjZYb3VnMXVTNk42aGVQY2RCTWlCL29sc1ZnVkZO?=
 =?utf-8?B?blZvYUM5cHdqMTkvWU1nMkFVVkIzZWVubzVFQzB3TDZ5RGM2TlBkRHF2RVdG?=
 =?utf-8?B?eWJDbUZIanBQdFZ0Wlk4Q3VjbXhrN2hoK2RlMndsejh2NThjZUR0RXA2UEVL?=
 =?utf-8?B?dE5GUXR0ZUNpTEo1YWhmV3lIbXlNSEFlYUt1N3hSNEs0N3l1R3k3aWlkc3pw?=
 =?utf-8?B?MUFYTVVPTmwxU3ZyQVIrekluczFLY0lyeGJqM0czU3QwdEZoQ25Xd1ZtS3ZL?=
 =?utf-8?B?NlpQY2o2aDFPTTd0TWlvY2FMTWZPU0tXeXRKZDRPNnlxTFc4YmtMaGI0U1Vk?=
 =?utf-8?B?QUFid2FnSStrQ00xWHdqdXlYR0d5cnFvV0d0L0dnYXg3Ymo3ZkFkL29pNEFV?=
 =?utf-8?B?NzJvb1BTWS9hSTc1b3VnZHlzMXdNeElqa05rc21ocjA1ejNDTDI4MXJSWE50?=
 =?utf-8?B?THZxdDNLbDl3VzhEYno1MVlVS1lrUk1ybGtYZmdqTEdrYmlSOFpFeXpQYTJQ?=
 =?utf-8?B?Y3hPZ09wVDhzWERONGorY3FiY1lNN09mSkZ2V2V5dDZxa2JhS3JBOWJaWDQz?=
 =?utf-8?B?enhqZWZjeVZBV0oxUHcyRldkVEpIa0tOaVlGL2RsVVczcVV0N1l6eUp1Sk5k?=
 =?utf-8?B?N2pGcnRsTC9GSlBMbjBQb1ZjRnRub2RoSUp5K3dUYi9oN0xyK25wV2VhZHZW?=
 =?utf-8?Q?KQSQgrGLEeBPiPrY615uzrTTCRiR/LKG2qF33?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0f405b-fef3-4883-b904-08df46675bbc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:03:04.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NBUlB1Z/Q6d8o1+W38ZfgL4ZIoSR2EefXiaN/IuCvEv9+NT01UXHkiMynbfJyv3sypj7p5hjVGpVtqd5aGUYVMpdKuaJnc9/+Nj6rJFAbluGmPKMrDIebEh7GcNTlpW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954

From: Frank Li <Frank.Li@nxp.com>


On Thu, 05 Nov 2026 11:17:39 +0100, Stefano Radaelli wrote:
> The Ethernet LEDs are physically on the carrier boards, but the
> VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> include their LED nodes. Other carriers therefore inherit LED definitions
> that may not match their wiring.
>
> Move the LED nodes to the Symphony and Sonata board descriptions through
> ethphy0 references, along with the LED binding includes where needed.
> Keep the existing LED properties unchanged.
>
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
      commit: 5ba903416f38e9fae58bc64c8701848c464354f8

drop fixes tag because it is not user visualable issue.


Best regards,
--
Frank Li <Frank.Li@nxp.com>
