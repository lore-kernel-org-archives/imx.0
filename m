Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCE366073
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701105; cv=fail; b=g23qcHUJZsX4aIJxZ8X8yV5NYEYCm6lJ2oqy5YIcIqAruOyJBX+q2nsPRWRiu+CwkL8C9fXvmJ2KJv2wgr6OSRmTqaqjzlmDQF7c4zRH2ZLk7wg4w6OQJeBnS/wH+7LMUOVmxOYZwEczomukfs8bnh4d4X2dXPEnQ+Hf7DtfOQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701105; c=relaxed/simple;
	bh=w0Kwa+1FZck4gPPUNhT0OHgcE9uqfv5keBb8QpmY7XE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sww4MNdAu8NWxrSwWJV6Firs0ykPud0zn8OY9WI3qzB12OmuQMmn+PeahjKNhbJd/xeaqd4br/v5xJ6whg9fyAGyIiuWUZfeBOc8ifg1bb6ZCcVzC5qGBh4X9HQilxSd6uV7rxHE6JUtGDvffXjn2TtI7uwxcX66xXCBXsOFEnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iebWO+Er; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iebWO+Er"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq/mcEPxcgKG7qWxigd8Z/G2zH7Il5OErZYlyKs66XmP2UdYoi9sSfG7msIyl+qcM0tmY7GnU9RIRbUZevBiib2K18U8TQzP9Lk/u5vCXV1vM1bVf5ntaJle4L0PnVBUIlg16Q4fGKo4V5qjDoRdFM6w3OUzky6zdpv6CrV5r6g2ijx3WAKEtu2nlMrPkAuY0UAorVaadoAut0g1VNqL0UkpQqunlhbnsXuRpfdvxABhNpBx/Bn2zp94zebAIKCh4T6sRYVMvIoOyQSHcNF0ZncL9F81z28Lt3gWUlb3GyHxdwDWmUStyBonhHjBtsfp6x52z84I3i1lGcLtDJmdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsuciZSmvaZ6QqR6Op1G+sJMUyo49B+ntVVQ860feP0=;
 b=irwUutq3ScaJ8deQlIE16HGmuZbmLnwUCNuo4R0cy7rcxi7xdceONFwwTun+x57w6Wibc8ZGU/ahVBJvIm6J3t8utm4np9ClLAu2m73WHp+Lk/s11VjxvSTzxyn2LV2myLT1dqYI8uBCtF/7Kht24JgQbAHHfRvWItdbnOgcPTW0K1D6DWxH2pdKqNagB8VTwG/40ftwFq9/JNFNpDAIsVEg8CvU7l+ApS+WCxzXeEyFxrak1Cn47OTZKFaQgbq0RKDsl0pvrTd0R+5MjGersrtZwvgwdwjOlu4pV4m1sVVOo7kTLAXXxUSlQ/s0vhUIOZdDumfKRpbe4YAtyrktZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsuciZSmvaZ6QqR6Op1G+sJMUyo49B+ntVVQ860feP0=;
 b=iebWO+ErVFwCFHUyV4xqqE5IjqKwagcI5x5A66RdgtfxgkaXFcfCCGbqRNT/QJM+nNCl+gFSK89YMyk+Vm04eLFsAd+ObraXt6aU23yszUCTLtf7VqRcntjMOyc2mm0lgk/o4N0Nnf+8lS3/lKuCIB4it5R5mDFgFM/ERfMxLqaHX5Jp00OZ3tqYkGfl9KjJ+yR+hNWlZQKpl/9Wur2W7PBnXN9/+u3WEMTS5AYMhbQHPWc7F7QOlmN84xvF/VQw/TeuJYKFnKvJFHJs8IoYGTf4WExuAv0Yt54/k7CQN6ehPrZptS+j7AZ/74pxouaSUv7fUh2fr7ZHmA+7gohngw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 02:18:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 02:18:20 +0000
Message-ID: <17dc43ce-5e18-41d7-8d4a-88b5c746d610@nxp.com>
Date: Thu, 9 Apr 2026 10:19:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
 <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
 <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
 <f5cd5da8-566d-4dff-b712-3d48927f97eb@nxp.com>
 <adYRuAU5ueEKHK5l@lizhi-Precision-Tower-5810>
 <5ce48659-2c6c-4c60-a8e8-9031bdbaa2a3@nxp.com>
 <adYy9xesCKsYWNBg@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <adYy9xesCKsYWNBg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0165.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cedb84-8a2d-4312-b9ae-08de95de44f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4U5dWm62JbZnh5QoFjycGjPk3Gxa7WvqPubdAKSB7IeyP7LbISWVPbwpilV2ruLAkfv1rS5RfdxRAxVF1n0zCFQ0I73+5lkx4QS4dxkA6TS8o9pmADzoqRoGh42DUVyf3nwaPxyg26v/aCuzoNLW3oufpx/iIFoBxpqkjOrlJivPzlZ7Ozit+hqK6me76HHJsPhLYHs8rrdUCxJ3QXUsUZdFHuY2MSbd54XQ7e2vB16kQexMQDI5zbphFo+a+gK6AlLVRpQImLajLG1pM59Nubq2ZAa58I8b4SRafEt2BNH0VD45K/mEGDHFgP5wgFlQwNmuCf9PseC81xP5KPEa8QKL1iZBXU8CU49XdAIXAvISgBZrg/v+aBzJI4E/h8hNxyuItJFoG7FbRSKVN1raMib1aXftLUOSDhwbZIF40SHqq9a0aE/NQMFbCVb38EXSpU2tJw9jsif0wVZoIj4lSspTLnyb7OFTGMx2OIoFyt0W/Ib83wv2v7+b4L2L0bB2FCkFS0G+g1/uqf0JOOVFFDE1wy+wNZhk4J+BzNP24hULKzv2zmCiUEApf0/B3f5rF/CrgxCRg2ziJPZZcghKIfyVIgh97imyNLyqmoV0IsBHrf05X5/knucMI340s41LG9d1V3gj0G60y1BJnr9ktNNH4ri+wB7xinjyBVNCzoQU50StpNIkTaNxU3nHfEAElaHq0VQa58Ty/p1Y00Xk77j/JXoVO1FdTpWpzSXjY30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzZkenBNQTJQK3ZMYWtDOFFpL2RQZ0d6MzBNSlFNL2tTNXZiVzcrYkRjUENq?=
 =?utf-8?B?Sm5KM3hHSG14QWF3Zlk5WjNsN2VZZXFSVTNxRWpyZFBRVzNwVHZnSEp0TmI3?=
 =?utf-8?B?MU1KR1RBQzg2NE1sSnBKcm92Rnd6OEx2VlNpclNGRTF5U2s3clBON0FTSnVP?=
 =?utf-8?B?UWJLbWd6N1BUUFZwYzhNOFpEQXh0ZTc4a2FpMWw2emgwenRjOFE3RUxkYTh2?=
 =?utf-8?B?RWp1S1RSOERYWUZReUowQ1pGdkJzcnpVMHdyTC9EOHNaY09FYnZBR3RwTkVn?=
 =?utf-8?B?VmxSZ0pSNExiQ2I0eng2VzZ5ajFOR0pNU2djdWkxUlF4NitTcVlJaG1KRTVG?=
 =?utf-8?B?MGl1bVN0RTd0WWhhMVk5RGo5WTFvRHlXQ1BobEprN2FpTjdhVXVzakEreldz?=
 =?utf-8?B?MmcvRVltU0JyTGdJRFJTNmpwMUR4bnJvaXkrNWNtaDdHVEpwNDRoMnF5T1E4?=
 =?utf-8?B?WVhTVm1QN0Q1a3Uvd3UvZ1g4U1YyYkRDbFo5VkNCaHIxMG1QZExrSytuckls?=
 =?utf-8?B?bWFPMHNUZ3lpcCtwY0ZmZXJPZGE4VUVqcmwzWERJWjc2bkNDWFR5OHVuUU85?=
 =?utf-8?B?OGo3Z3piWkYwNE8wd0YwSWt2S1dTNnhES29PTlB1aVZpTHcrSkxDTzkzRS90?=
 =?utf-8?B?RVp2WlIyQjN1VjFSVTBnN092R3pGUkJaM01KVW4rdU9CeGZpOE1XbEo2TU4v?=
 =?utf-8?B?dWJ0cjdYRWp1OFowRzE5OVZ6ZG12cUM3c0d4ZmtzdWk4cEYyUUZlZU5zc3dM?=
 =?utf-8?B?eTlNTkZqOEdvdDcveFY0REsvbmtEZWtWOHc4b3F1T1BpSFhiOTQyVVlzUStR?=
 =?utf-8?B?VW5aV1dXWEJGeHVOUkgxWmU2Nm55VjI2WlJ5L1hON1k0UTRuUm4xVDhHTlJs?=
 =?utf-8?B?aWZDUUpsZEZjS1Q5YWZ6RVJpUHd2VnB5d3VSK00rSFUwd0xRaFZBZnVlYzVC?=
 =?utf-8?B?ZW0yN3gyVWdSTDdhS0VMMENZR1lyZkhZRk1UV0wwY2h1NzVFVXg1VzJxbWJW?=
 =?utf-8?B?VUVhSmEyUC9aOS91RUwrempQdjhuSUZrWTRocHcxeVNkTyswOG04Zmc4REU1?=
 =?utf-8?B?WWxtVStBUDFERy84dWw3YStlcnZNNmorR2Jsd1RaUEdMZkxWeXlIalhpVzVp?=
 =?utf-8?B?TVdRdlgvUDRwMDBjRUgzL2xaWktWV21EYkkybThPZ0NnRktjNW9lMUtWZ2g3?=
 =?utf-8?B?UDhNYjcvMnd3Tnlqc2lqVGYvRkJrcW5PRkVzc0lsanNkaTV1b0JCWHlsSmVl?=
 =?utf-8?B?bU1oQUpWSnFuZWlBWnFkbWE0OVhUa2k5K0dRTUYveFBaNUZKZnhDM3JaVzJY?=
 =?utf-8?B?bmxEbEJ1OFZnaWd0TnNtamNlZFZ4eGdPZkxKcHhBQ0xLbG1KSTZHRkNza2NM?=
 =?utf-8?B?Y1dlTytZOEhXcllNenU3VU1ldUJOK3lFQVFKV1Uvam81YW4xSS9DbmpOYUdB?=
 =?utf-8?B?RityNnYrVmRFWWM2Sk13VTQ3bzZoQ0phQlFYL1pITzZ4Q1AzQ25DZkZ6YkpE?=
 =?utf-8?B?VVFEbFpCTFA5U0VhdjI2Qk14UUhNbFZneXFvdk9hRHZyVnBZTXF1QXBmb2dt?=
 =?utf-8?B?KysxRndkallOWmVlUndQUjRmbk5zSEM3ZWpZMkRsMXN1SGg2R1NjbG14RnNN?=
 =?utf-8?B?SUNEZVNvRzJWME93b0NVR1ByRkNmZjNHeUtJL2laeW9GYzhVVzhET2RPZVc0?=
 =?utf-8?B?bHVvek1rU2VxU0RxUkwvMi9DcmR2bTR0K2dDWkJoRU5NcHVoQ3JBNmE3UDYr?=
 =?utf-8?B?VWdYQjFmY2MwK3IxY3J3a09ZeDZFaStqWmJDcUVRenA2SnZSbFdmNDUvaFBk?=
 =?utf-8?B?SnlEWkxkYjN2bDVoNWR0QXVkY2VUWE55L3dsV1JMVzBubnE2N2RLMGdBcWtT?=
 =?utf-8?B?L1UvaFJPVUhTcDB1c09UbXdzbHZTQkw2V29MaTNndDFCM2c0UWJtY2lyU2Rs?=
 =?utf-8?B?UVhjVmJ1cWlOaGZCYUlIVmJxQzNzMFlIeW5Ca1pJd3JWM3BGRHIvVVEwMmhh?=
 =?utf-8?B?VXdQakxXUEkxbUppaGFLV0J4clpCa1IzZ0dlNkoyT0FFQ090Ui9OdHhZUnJo?=
 =?utf-8?B?enJyZWdiTWpjOWkrN2UreVczOHorbFJuUWRYQ1ROMUdDMUY2M2ZBNnkzWVBt?=
 =?utf-8?B?bEpHUkFXOStxa1Y4aW5BL3lhcnh4di83dFpBVHhmOE5uQ1oyUWdQdDFzeXFE?=
 =?utf-8?B?Y3djSlU5a1pWcU1ORmpCc3BoTWs2aFpmYzU5OXJwUlp5MHpaenR6djRGUmdG?=
 =?utf-8?B?Tmw4MDlhbU9mNTVGR2xQK3FEZ0dsLzE3ZnBLeXRFMFhjdE1xSWFSVHh1OHQw?=
 =?utf-8?B?VXFjMUVjNVI5all2MHRybFBVb1hRbG9nRFVCQ2NIQkdZTUNZS091UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cedb84-8a2d-4312-b9ae-08de95de44f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 02:18:20.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv7OBSibfbR7a7+Bs+2gPJ1wyTXDC9/bDuynRdPBHkSCWx9FpIzCfDHVOU/stz7VB/3s5HtAcgQddEcMbq6YBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

On Wed, Apr 08, 2026 at 06:50:31AM -0400, Frank Li wrote:
> On Wed, Apr 08, 2026 at 04:40:37PM +0800, Liu Ying wrote:
>> On Wed, Apr 08, 2026 at 04:28:40AM -0400, Frank Li wrote:
> ...
>>>>>>>
>>>>>>> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
>>>>>>>
>>>>>>> to imx93-9x9-qsb.dtb, so needn't create dtsi.
>>>>>>
>>>>>> I'm sorry, I don't get your question here.
>>>>>> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
>>>>>> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
>>>>>> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
>>>>>> file just aims to avoid duplicated code.
>>>>>
>>>>> My means apply two overlay files to dtb
>>>>>
>>>>> imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo
>>
>> This ...
>>
>>>>>
>>>>> In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
>>>>> &{/} {
>>>>> 	panel {
>>>>> 		compatible = "tianma,tm050rdh03";
>>>>> 		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
>>>>> 	};
>>>>> };
>>>>
>>>> If an user wants to use imx93-9x9-qsb.dtb and the DT overlay blob
>>>> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to enable the tianma,tm050rdh03
>>>> DPI panel, then it won't work unless the user also apply
>>>> imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo, right?
>>>>
>>>>>
>>>
>>> Yes, imx93-9x9-qsb-tianma-tm050rdh03.dtb already created, which already
>>> applied both overlay file.
>>
>> .... indicates that imx93-9x9-qsb-tianma-tm050rdh03.dtb is generated by
>> applying both imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo and
>> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to imx93-9x9-qsb.dtb.
>> While, imx93-9x9-qsb-tianma-tm050rdh03.dtbo(a DT overlay blob) just contains
>> the panel node, which means that an user __cannot_ enable the tianma,tm050rdh03
>> DPI panel by only applying it to imx93-9x9-qsb.dtb, unless the user also
>> applies imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo.  That's why the .dtsi
>> file is needed.
> 
> what's problem if we require user do that? Makefile already create finial
> imx93-9x9-qsb-tianma-tm050rdh03.dtb.

The problem is that the user would apply imx93-9x9-qsb-tianma-tm050rdh03.dtbo
to imx93-9x9-qsb.dtb to enable the tianma,tm050rdh03 DPI panel, say in the
U-boot stage with the 'fdt' command, which is fairly a typical usecase, just
like the user would apply imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo to
imx93-9x9-qsb.dtb to enable the ontat,kd50g21-40nt-a1 DPI panel.  We cannot
ask the user to additionally apply imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo
to enable the tianma,tm050rdh03 DPI panel, because that's very confusing.

Note that imx93-9x9-qsb-tianma-tm050rdh03.dtb certainly can be used to
enable the tianma,tm050rdh03 DPI panel, but in addition to that,
imx93-9x9-qsb.dtb + imx93-9x9-qsb-tianma-tm050rdh03.dtbo can also be
used to enable the panel.

> 
> Any user really apply dtso manaully without use kernel's Makefile?

That's not relevant.
The point is that imx93-9x9-qsb-tianma-tm050rdh03.dtbo would be generated
and applied by the user to imx93-9x9-qsb.dtb to enable the tianma,tm050rdh03
DPI panel.

> 
>>
>>>
>>> can the same board be use for imx91 or other evk boards?
>>
>> Yes, both tianma,tm050rdh03 and ontat,kd50g21-40nt-a1 DPI panels can be
>> connected to i.MX91/93 11x11 EVK and 9x9 QSB boards.
> 
> Is it possible to use one overlay files for all imx91/imx93 boards?

No, that's impossible, because they use GPIO backlight or PWM backlight,
different GPIOs to enable DPI panels and different GPIO hogs.

> 
> Frank
>>
>>>
>>> Frank
>>>
>>>>> Frank
>>>>>>
>>>>>> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
>>>>>>
>>>>>>>
>>>>>>> Frank
>>>>>>>>
>>>>>>>> ---
>>>>>>>> base-commit: 816f193dd0d95246f208590924dd962b192def78
>>>>>>>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> --
>>>>>>>> Liu Ying <victor.liu@nxp.com>
>>>>>>>>
>>>>>>
>>>>>> --
>>>>>> Regards,
>>>>>> Liu Ying
>>>>
>>>> --
>>>> Regards,
>>>> Liu Ying
>>
>> --
>> Regards,
>> Liu Ying

-- 
Regards,
Liu Ying
