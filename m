Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022120.outbound.protection.outlook.com [52.101.66.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F83E4C68
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743856; cv=fail; b=hgU/OxA2vAqOVY+4G9FKuqJUUsYmW/jYNZfnKfcIbP8ubmeAMm1a2Wmc8WeIpqTw1TWcyPlO8DdFCueWIEc/lPsJ2c3GQjWgJ0WpJdd0GAiCjhugRcRBomH0rclCGJgp4ovZ41C/DX9sqTc3+fEo1aH6Do1TGzIvBZx0JYvYEPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743856; c=relaxed/simple;
	bh=gMK/Kwp8CFtMZ/kjEyvHIx3PhhmBxNUmAyfMlyc6B0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kj2v7bUeQDAyabbCIPxmkkLGxbTYhib6VY5Z40OdRokFgNLgqi5WN4vT21YzHDQ/pZDpjJEyOAPbHbtcm2W2N7Iji1BqQ05jkP8m+WWEZbO76wR1LNB91W/swO8bLOiuelmQfDPQkL5oo1OcBpXGn21PMLXF6DuoTIpQ3VXdK40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=dAdvFFJs; arc=fail smtp.client-ip=52.101.66.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="dAdvFFJs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq0Fdwbp7G5qydBzB82BGyzaiS25eA5nNWTo5qjDedEyGp54GtGJ5xNy1le9RmITTfKs1YM1j7tnRbiXRzr5WepheA2dVZShe2AF/ejM3X6FhGIjdTFUuXd29bxbJRfeB0ztxjZ+Zi2TkK2kOQo0uuxqVcBjGnz4wPQFrKa/fOdeDZMjNDYeNQYoLwY3cXx3fuiEJjrUVafAaKc32I9Gbo6Ab0CwMOIXMU3GSFp6u+YFKAY/OoQQYXOEGIYUu3XlOKpK1u6xxIsL8gKaUH4bLsy8rZ/ng2vQFOjDKjZIc6d+gnwPbJFRj2L11LbqMzRISWJ9PsolM9p6WgnzxxyceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpVr4e7DHXu35c5lRXcZatWWjSE9CvlTgHwQOTrBoeQ=;
 b=QXrr/JEMiOi8Y1ax2wY3geZPvAqVCV0C2bDwON5ddJ5xVyd08o1nZkejgKK+QrLzSdvILqrrIRadPF1G9onfiNYifuwx65qL43E/fucrcr+9mGQXmzFIv1erp0Le1cMs304aijL8+FP918rXEv6mGmTCUPJmEP9np4u+zkoKwWy94XWmhlICBHGynZQsCSErvEI3rPhb+Yjf43Bi2oxwdZ+ZZbUSJRFBldyFgBUQBVmJIf5nnQNX/Uu0sNK6t7g6OIbib3x6GpD9szFktUHqjbAg2hmol0JuPjSNfC0ikbAN+pvfSAVe2irR/8NKSxl8XITAIsnOPCBdrX+Y4fb9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpVr4e7DHXu35c5lRXcZatWWjSE9CvlTgHwQOTrBoeQ=;
 b=dAdvFFJsPB86utHaxQtYClAr2TPVs5ET/NOLexrBv1FSA7SvTkksFmnR/AF+YpI5hL2/Z8ICPrwL9bSyk/gZoA3gXMj3P6l1eQByVM33/LsBRdAxigtkkWY+C8AmmgVkR7ghOxcAZnIlj+0ty55FKWXl0piWmmPXjf2XxDUibb3rS75eowCsOeeKqMqCKHEY/1LejSMEIEwpb+45c4Cmur86xpv2Gz9WIj8gQpVTo6QYvTIu2ZJxzHeiSP4qzOs8fEvWyY2ckHxcpi/z2bLs0j54D3FoOT5AV/HdTdbhC8c8QweiA7O27ooGOxl6GONUXALYO0XY9mP0+7pJhSRs7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AM7PR10MB3557.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 14:37:29 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:37:28 +0000
Message-ID: <62b2c912-abc7-41c6-8f23-c98516016431@kontron.de>
Date: Mon, 29 Jun 2026 16:37:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
To: Krzysztof Kozlowski <krzk@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
 <20260617-prodigious-private-inchworm-beae1e@quoll>
 <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
 <30e02780-52c7-4a71-9d4f-4b7a20494161@kernel.org>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <30e02780-52c7-4a71-9d4f-4b7a20494161@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AM7PR10MB3557:EE_
X-MS-Office365-Filtering-Correlation-Id: 35438267-a2c0-48bc-af71-08ded5ebf1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|3023799007|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	+FYOQZLUQtViS3g6vQSysI1lD4gzVhEM4D8QweTQNs0jorhdn0y1HAMa3zdXHlk7NsdIBE1Dj66hNI8hDF8MSuxzWJPIiO8DmDT9dXOuOrL4ZhL36Zq74cdzGgD1Zeh8zA2MC95oVLuqJaS6w1hMSLpwn0AgtLianJRLxAVXrUJS481X2tL0xzYM1fQ87x+QBiM3pfDsCTiv9lMDhq6JfZXig0gKk2ZFfP+YoQVcW5qtOWFvI7m16z4fuHKP0/4hT2Ow8kWV7CjTA1q9kNXJntsjLNiNq92sFweFG15jYeMOLLqmNodctXNnfVT+KfNF9fHDurLZ7/7e8Tvxid/5kAwaqgERULynN13pH3WGEPPNyxidkR4ubWieLpn0HA5gFTj93hz3RSX+LSR8OeDC7LtdGeLoRVeugvaIhFRsdg+QLQgQMvVre8n0JkHYCLlzGICmbdxQqJ+Y4mzjgiGaoYa8LoGsU3Xz/8GHLINtyv2vPAghUD4LvDS3lH9HrFidq1aKz7F+2UV4fJjXasm3RBZ1lgRHtB+BVdZ21zOv68Y4kdRJtr6xHqaWEQUS6UVzsY51zH6SWI4ug1GEhdzaKZq5f2PQ0rCtA6eTo3b2BxVCl+0st0hGop2Q65hHz8/q+G5LG9dhgUcndmOTh90lNT7zkYkeaGDS2QueI41HFsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2l1ZXZPOG9QeUNxV0t0bkI0Z0VUcE5pWlBmVmIwMDl1Mm4wUWo5Smx1V0o0?=
 =?utf-8?B?Nk5mSi9zQ3BpclRoWklQYUJOOG5YdWt4NnlDWlBBRXhTVXVYSFMvR3VRQVp6?=
 =?utf-8?B?dmlYanluMktZd0NlSHVYVll2MzlnUXhOSHJBT0xOTmFtY2RLdUIxSHFXTm8r?=
 =?utf-8?B?QkVrRWFkbFc5MTdHMUYzREhQRFVpWXdJVE5QTDZkT1l1TlRGOTlBbVBNUDRz?=
 =?utf-8?B?cG8zenRxOHZkRnkwR2hxRktXQU1jRHY5WVA2cE41ZXRKeFhTanpEN1hXMjNr?=
 =?utf-8?B?Y0FaVUNkVmFDWFM3TWRTWFJnZHFkNHlHR3M3YUt2bi9sSDAzZmVvMUJQZ1Z4?=
 =?utf-8?B?NCs2ME03V0hTSWdDRGRSeW8vT1JzaHNKLzJadGo2M2lzTGFDTEZvS1BVTVpK?=
 =?utf-8?B?RFNZZkZWOXhVRlN2RGZtb3JSMThsVDRhNU1mblFSR2JrdmF2clhiVGV0SEdS?=
 =?utf-8?B?cnVhVUwyS001TGtyWXBoOHZoeUp0aGVlSlpIcHMwWms5a1BvNy9IajBYQ0Vp?=
 =?utf-8?B?Z3pOT2RGWEpvMkFNQmt6SjRSOU9qRlRaWllmQjFLUHBOZ0RRNkg0bEFCMmln?=
 =?utf-8?B?Q0p4TUNoM2M2c3NvTjU4VEhXU2d1RStvNmdMSDYzZFBQWWh5OGRZZEpzSzFT?=
 =?utf-8?B?d3FCRzY5R1BBS0FsamNIRnhTcjNqWk1nY3hjRy9CN28wS1d6MkpROGZLRHEv?=
 =?utf-8?B?Qk53NzN3NUJiYmE1YmRxL1dsL2ExZGZUT3VNTzlrSGJhR1JsM2tSaXBjZlIz?=
 =?utf-8?B?MzRpT1N5SVU2YnV2dlBqL0JOR1BqOHVTY29tZWRGallQb2szNmNkNGhtTkRw?=
 =?utf-8?B?c2dLWGhBUGp1LzZBenQzNWNpNTVBRVdHNHVrdzdsaWhmdkMweUNCVituRS9C?=
 =?utf-8?B?ZEtNYm4rNnJFbXVMNWp3WUxuWnlCZnZ0QzdJTUNoUDl0TU9iVFNIOXZZSWQv?=
 =?utf-8?B?bUhzRWlWOE1BcnQyVVRKSTZLWDY4Q05JZFpHejN1c0pSSy9GRTlmUndKbkt6?=
 =?utf-8?B?dTdKSmYvQ2VpNk1ZeWJ4VDN5MGF3ZElmcVRlK2d5UmxTS092RFI4cXZKSmNL?=
 =?utf-8?B?N1lVak5OWndqN1VpWUlXTkF5YUNCcG0wK0twOStHd2ZDZ25CQVVlMEd0WmVT?=
 =?utf-8?B?SGk5WmdTUXdIZHdVdS94bVljT1ZnZ3dCRjR4cHIydW45NWE0WU5EaDhUaHJk?=
 =?utf-8?B?dHBOSlVVeHJYRjM5b0xCalg0T0Y5UU10Z0xHWTJsTTJGNHZ3MXZCdjUwWFRZ?=
 =?utf-8?B?TCtkNlExNFphVW9oYm5uYUtwQkJ1OGhzSjJLTXJ6M3NBSFpxd0gwazhJVGR4?=
 =?utf-8?B?Wjg1Tm5nVzI2czBaakNBUWZDK0xyRDBDYWFJSHZSZ2xDNWQ0REFjeFo3cXla?=
 =?utf-8?B?c0FxS0Z4WVRublFuUjdpVEg3a2VMa1hkNCt4WG1YS1RnQlM5U2p6YmFhREhL?=
 =?utf-8?B?MTlPY3l0RUtuVVhRc1BTajdkSy83Y09SaTZFVHAvMXNIUnNJdWZscVYvVU9l?=
 =?utf-8?B?V1FYdXdtbDN0dFJpcWErdExCUVVSdDAra25taklidkNhNzAwTXFRTG10b05B?=
 =?utf-8?B?RG80U1FHNVVHS3puWjRUQ045dGJtQ0xtNWNZLzI5VUlSN2pXN1FHOWNMdE5B?=
 =?utf-8?B?OGRwRDQvbVRBZ2hVTnphaW5rK211WVVmOFM2UDI1N1ZOYzBqVzZCaENDc1h6?=
 =?utf-8?B?MjQxNmRiN0prZ3gvUXVIWTVKMXIyRklkcGg2OElxTkx5RWxaMmpuTUVTUFBm?=
 =?utf-8?B?eXkvc00zYzVkUlYyWVZwblUzOE1vN0grNDFETVZncWE4TFhIVU9XWkFBazNE?=
 =?utf-8?B?N3hTSVIzeHBKTENvcml3YTVSWGtzSVN1b1grZWx2eVRwMEVXS3VCVTgzNzZx?=
 =?utf-8?B?L2MxdG8zbFVTQnZLdjdnVzhmV2xvSHpOT3YvbUFBQXhmdzFYRkVZSEtyWnht?=
 =?utf-8?B?UDJmeHU3SktuMHZsRmN3Mk5uRS9zOXJjaUJSSE5QTktBVGdUd3BNZ3YwK3Vy?=
 =?utf-8?B?Q1ZqMFJDN3BYR2t5MmhSN3lTdHgwMEVNU3J3YW5yRzI2WUNNRVpQTzMzSzFj?=
 =?utf-8?B?ZFB5YzMvbmJETDR2dHdqUExwRzlDYk4rNnpMeFpkcjBld3FhcmFsV2ZqU3hV?=
 =?utf-8?B?aUIwT1p4V29UWStuVGMzOG5VR0xlYXFVUGJJa3RnbVh5M2orS1NUQmZWcWor?=
 =?utf-8?B?N3NtMisxbThqRUc3YVRHMDdMWDAxajZBemxTVWVSazU1NU5PMjk4MnBXTHR2?=
 =?utf-8?B?cFpMNlR6azczL1A0azRjbTB5a1Rmdm9SSC9WOFJnMW5OMTFNRjB3MEExdDQ3?=
 =?utf-8?B?WTNpMTV2ZWtoY2d5UHYxTmZFUWdyeFZZYTZQdWdrTmZOLzVuZkNGREhJcXBD?=
 =?utf-8?Q?xt80abIq1Rl771LM=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 35438267-a2c0-48bc-af71-08ded5ebf1e8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:37:28.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9VDHzFrqxuXcR31CW569VEHDMOoc9nqkS3TlNMgIql4LKSvQtEomBcNEGqreGke+aJ/Le3g+e9Hogc/oO5Kp9mKqmEsJ9MCaVTJob2giLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3557

On 22.06.26 15:12, Krzysztof Kozlowski wrote:
> On 17/06/2026 13:36, Frieder Schrempf wrote:
>> On 17.06.26 12:49, Krzysztof Kozlowski wrote:
>>> On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>
>>>> Some SoCs like the i.MX9 family allow full access to the fuses only
>>>> through the secure enclave firmware API. Add a property to reference
>>>> the secure enclave node and let the driver use the API.
>>>>
>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>> ---
>>>>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>>>> index a8076d0e2737..14a6429f4a4c 100644
>>>> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>>>> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>>>> @@ -53,6 +53,10 @@ properties:
>>>>    reg:
>>>>      maxItems: 1
>>>>  
>>>> +  secure-enclave:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: A phandle to the secure enclave node
>>>
>>> Two things here:
>>> 1. Here you describe what for is that phandle, how it is used by the
>>> hardware. Currently the description repeats the property name and type,
>>> so not much useful.
>>
>> Ok, agree.
>>
>>>
>>> 2. If you access OTP via firmware, then this is completely different
>>> interface than MMIO, thus:
>>> A. reg is not appropriate
>>> B. Device is very different thus it has different compatible and I even
>>> claim should be in different binding. Devices having completely
>>> different SW interface should not be in the same binding, at least
>>> usually.
>>>
>>> If any of above is not accurate, then your commit msg should answer why
>>> and give some background.
>>
>> Thanks for the feedback!
>>
>> The driver currently uses the limited MMIO (FSB) interface to access the
>> OTPs. The intention is to support the firmware interface alongside the
>> MMIO interface so the driver can pick the interface that is available
>> (firmware might not be loaded) and fallback to MMIO.
>>
>> Following your argument would mean a driver deciding by itself which
>> interface to use at runtime is not something we want to have in general,
>> right?
> 
> No, the property fits DT, but above information should be in commit msg.
> If this SoC has indeed both interfaces - MMIO and firmware calls - then
> everything is in general fine. I assumed that is not the case and MMIO
> is not really working.
> 
> What was confusing is that it feels like you are changing existing
> interface, but why wasn't all this documented in the beginning? There is
> imx9 in this binding already, so was it working? Was it not working at
> all? Commit msg must clarify that.

Ok, thanks for clarifying. The MMIO interface for imx9 is working just
fine, but it's limited to access only a subset of the available OTP fuse
register space and only provides read access. Only the firmware
interface provides full access. I will extend the commit message
accordingly.

> 
>>
>> In turn this would mean we need two drivers, or at least two
>> compatibles/bindings for something that is effectively the same hardware.
> 
> Driver design is orthogonal choice here.
> 
> It can reside in separate binding, if MMIO is still valid, but till
> everything is not yet too complex can be also this binding file.
> 
> If it stays in this binding, then you need to restrict properties per
> variant, so add if:then: block which will disallow the phandle for other
> variants.

Of course! I totally forgot about this. I will restrict the property to
be only valid for variants that have the ELE firmware interface.
