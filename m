Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023129.outbound.protection.outlook.com [40.107.162.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999934389D
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631050; cv=fail; b=IBoB8cl/BU4Y+7f/WQzXCmhyl3ie6bEU7vVIYeeGQFb59Xb3WNmOJtdr7mcaDXa1Gl6pEitefcdXpQeErQL/ROdQL3rabm664+USVsSzbGxQsFk3GwFKoXlDRPruoo4N99dtihnC5Co/Sgq9CwRq0DEnN7yY71T7LoZ5EPEZnBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631050; c=relaxed/simple;
	bh=rTe/6UeQ/TuWXKJmVM2hykN9qLRIqrsyNallfQ09IeA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rjo9S8iC3HpK1EoJt2HNt2wHgPGsB6v5P+3A3cRt9eoHcoSOI8WxGhs8l8o+Euwwo5bc4E1ORerw8+3fslwTa6l2QQfcwWngBXgAdhYDyBVLUUd6HVFNflSsg0d0nViayjSjoLFlF6pd5MpSleF/iLQMQBdIo69CBbF0Gs6YexM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=h4ot+std; arc=fail smtp.client-ip=40.107.162.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="h4ot+std"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkey7eSPcSIL+zbq+lLOUtwnqZAQeNQnsxeVX9FNBXcneTsPhMkm6xnoV6TorYpILeQ/df13kCVwwh+6Hgq3NJ6Pr5X552gmCLFFcOQLd/KIMMDFptvSBQLoC4vtIMUZfu8ZY572BsXZUNXfxpQKJzLyVk/30H1hxc1pP6/KOjuGe3huZ1u4xt3ziKofF0UJzU8VCyLBYglB66gzdPWT8a4pf1nqSvU8NvIHdhMJcbbHTatrdefcFe/x4YxFYi8AEdNwMEm5llvUSQPPOLbOvxoPWpfMDXOg9KJZ+0oJbCw3Tvnp9/+s5Ayz8zU10Tg+s36Im9iGsDAvNp+xCoXD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeaeIii+jMVGhy5xnXeECxFPMOxLUTADYCcaXFjueFo=;
 b=VM5Y10D3simu5rNeUlMQk6oDEYDqbIx+17TNM7xxvACFBTOiibIBNMzV0rflEhGSQfjlbVg49XrqBltTvn2jazGcxJQ14xBLP3LkGl2RsOqTsmtilZcjHUnjTjYtfbrQJ5YHLWd9zSInAJG2yTMjAywSJdggozGrMAvobZBworjfup2iifM8F+TgspkXE3uTSJJpPoJ7p5UtaFbpM9AGSR9iwRI4cCHZ24YklM4/yKbT4411VNoyMYSKXY2BITwAPK/FSz965TOxP9XPNZRAkqgASlLvvjAmvI+sEoorUOBZJHeHIe2H34JYSZnVaRC9N4Zeb2f5jolYzHwF7dNBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeaeIii+jMVGhy5xnXeECxFPMOxLUTADYCcaXFjueFo=;
 b=h4ot+std8DQLUKoGrDgUonqwOFo97zEyPpiBTT6mzvYD7x9GECnbF/YWeO3icOEan0i/s3NdM43LWhBpZhQNS45AAvLQjkJd2rbO+C1TiG9s5xHMUo1kRj/yoNJFWaT5VJ4T9YZ6NmB4/ViMDnAyvbdUAGB/1RV9lkdyT3JCMvxNF6jTyN80oYBBYmOz4aioZzisNjE0m2KkLxfZ1rMVR9I/94Us25zm85U8lfUfPt64bqgG2DtJQyOe6FBSLzXKpjYAWB1SzFhcctkMZ6TASNGtIIMokNdnQa5pp1wodG9LpEXHge98lVlzGy8fxAM+bJqy0KzA8LgeimrR9knlww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::22)
 by AS2PR10MB7024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:598::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:50:42 +0000
Received: from PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6aec:a389:7814:860f]) by PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6aec:a389:7814:860f%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:50:42 +0000
Message-ID: <7a799385-fcc4-49a5-bef1-700e3bfb7c5d@kontron.de>
Date: Tue, 21 Jul 2026 12:50:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:97::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR10MB4288:EE_|AS2PR10MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: eaed3766-503b-47b8-1555-08dee715e91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|11063799006|4143699003|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dklNlYHB5tjTqIuUu4fzS8F5F4lWR16u7bEc1xBWf4aziYIG2R37WGhWHfQ0iqhyNQzDZ80ofUAR7fN23YoIHefUFCNqYQQIkRKp+OTcoVn3Azpgmh+CPB4fsS6lnpMmaiED6UJYikpvB40N0UvTNu0Fmra0j5yrRSRlRBKSk2XtAyS87BfosKxZUyEwG4pskZexWqyz+gqC7RGvEtDWa4EGIkuMz9AMIcBZ+6Z3ipuanUTRCj9EX8ndxiBIXjpHr2P9//O7h2wOyP6HCIt8SrIEroiVl60u56kOWAB9VF6TjfqfLcQAv0lU4Vj+A3ep+Y9igzv8F/8iBBzYS3Jjt/uCYPzQc5I8LjKyi/pMc01iFbQmOuyeFGxXQaL+gFuawM+9PRmmVHE6stfFOvD76XOCkguZ3sj3QVcaca8Hi48GPKKxywcvBdV+AyT/hbwrWJ+4w4nviTOYfAD+9meTjY1OPv7DeqKYHMinbawgN664Te6VyWWD8l9CanJvdEK/Nh2yYcga64mPsBmmJhUB2GLKy35DLnKxjYER+XzCOniyJTGFJQM9BrfiIUKs6uvoQnpvOgu8aMQkqaebrxegiDrymrzwyCGb90zFzcIHG3YdM3EQ7uejh0ND8NIUaQjWGeHxZMGl+09lqY8b31QOyVBJm44/JHOkdPbPOp+8ShRlq2Ap7+wK6dg0TPtEo3YEOnFWwfSrfVVIMdBsF9ZKOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FMSTdEM3diZGFnNXoxOFVYVTRiUXlQSjB4a0R6QVlBZzF3TTE0MmVYS3d0?=
 =?utf-8?B?bmluSWFKMkVNMmlWUUxMNU9NR2dDRjMrNTFiMERWSHlDMEpqc3JOTVo1OUhp?=
 =?utf-8?B?TFA3WmluenRpRlpMRm5CVUg1WEwxM3RTcmVEMmJjY0ZVM3FPZ3c4Ukhnclo3?=
 =?utf-8?B?eU9vVmk3M0Z4YXpPZmFjVTZHWHlCalF2VkNxK2NURGc5S0RzRllUbDlZMURS?=
 =?utf-8?B?cmZKMy9JT0xDL3lpK3E1cEhSYXExcE16R1FiT0N2V2YzVVNiOU4rRlVSWE9q?=
 =?utf-8?B?bEpVQUV1NkdyVW1XcDZvMzdxWlhhUlF1UU9PbHJVOXN4SC93SzJCdDcxYVBW?=
 =?utf-8?B?d2NSbi9zVDVzWm85M09SN2dKOEttdjBsWGVSNkhVN1VMNWtnTDBIcXQ2S3J2?=
 =?utf-8?B?djNhRVo2TVp1dEtuVU0xcjZaQ0h4czd4bnUvbFdHdGUvOS9EMnd4aXRtTnEr?=
 =?utf-8?B?MldINmM5NHl3S1ZPOGE3eGpENUZzbGJWNDlFWjJLakFIM0c4OGdGd2Y3WEhn?=
 =?utf-8?B?WDd0WExjd3Mra2o4Z1VoZDlyMGpJSmFuTDFTNGRNLzlGQ2tJQXo4VGZ4b3Bz?=
 =?utf-8?B?bWZCQk5GWHpzWWlGWGpHOElsT1B6aThSVGlWYlplY2VvSnU3a0pkeFBWeU4v?=
 =?utf-8?B?TjVBUWlFQ2hRTUloem9PQ2dyVzJyUWNTeE5WSFpPamJ6KzlzVFdHY1lyZ2N0?=
 =?utf-8?B?ekRQT0tqdlpZaVFVZU1waDIvY1lzTUpjdjhKM0lPU2cvR0FER2MyVGVhcDdK?=
 =?utf-8?B?aVkwSUM3RTZKTGU3R3ZvejI1cmxQbmJ5Q3kxMEVmbCt6Q1BvVzFqRG1zNzMz?=
 =?utf-8?B?eUJlTkd0S0hnQ09salhnTjFiWlRPbUNqN29GRUNpQjRaUjdjb1pmaDhkZkVk?=
 =?utf-8?B?aG95bXppMkFsUGMxYStjY2pMb0FCblBiems2bXQyNFNOdnJmdHVCUjVLb2V3?=
 =?utf-8?B?cnhCR0VGQjRsdHdzb1poZE12SUN6a1ZuYVRmMkxwYUtUTzQ0aksyVnYwcVVO?=
 =?utf-8?B?WkE2YkRESXQxMDZsc2o1Z2NEcldMSFJLaW9XVDNLTWhMcGZFcTJzWjNtcUlZ?=
 =?utf-8?B?TXE4bHoyOWZTQ3Z0d0gzaWVyMmxyMElMdEY3S1RYWUhhNGJWMmtnQzlKU3RD?=
 =?utf-8?B?a05iRFpERE9ocmVFRFpOdGUwTnFlUUpQMWMvbDBUZURwVHMxZXk5NVorckNF?=
 =?utf-8?B?NnN2SmlHZFRHczB1bUs4clIzOXVVQVJTQVh2QTJmZEVJNkxMZEl6KzZaenU1?=
 =?utf-8?B?a1BPOXlOQkVLSklic3hBNW9nRGN6dXJtdVl5d0lRNzkrUjAzblQvdzM5VWNo?=
 =?utf-8?B?a3hCVDVyOGY2eCtiaG1Tb1NwR2dVbEVKdnN5MjR0dStOckNHUm81YTByc3Jz?=
 =?utf-8?B?aUZPZHVUVGt0L2RFTDAyeDVzc2RhR3RzZU96NGF1RTdKUnQwZXA3c1lETS82?=
 =?utf-8?B?bzlVVHh6Z1RtZnB3RllHcXh4NW9qYUxvc0FPNHhGL3QrcDdhWVRMWXVrSTdj?=
 =?utf-8?B?WU54L0gyNzFBUmVlWDdTR2FuN202VWVCK2hLT2YwSHpEUXgzUEJpNTdocjN4?=
 =?utf-8?B?MmE4RGMyRkIwTGdVQnBxS1lCRHpOcVpRa3gvaS9kNHRmRUF1cDV5Z2JJR2h6?=
 =?utf-8?B?Y25STTcyZHlhQkpzb0RsTGkzSVVJY1lwZ21NTnZud2dHNFF6NnlkRHdaaEV0?=
 =?utf-8?B?WDZ6UXBpZ21zWFBtVGRWUi9RbGg4dWlBcmVIbWptb1pKQ091NitFVzdHbCsx?=
 =?utf-8?B?bVNWR0dvWWxhYUpxRjk0TXhMcWpMTnpxTTFsbkdkRFlyY0RpZTlFZzdrQldl?=
 =?utf-8?B?L0d0TTZ5aVhOdTJnZ2hnMHFkT2hieGRjN25sd25xSWl0bGMycEx1NlBUd2VS?=
 =?utf-8?B?ZExqRldpVTlmekxHSDQ4Q2c1aGNBUnNJb2RPOSt6MkNuZ29wR1Q0SWZKSWxI?=
 =?utf-8?B?VEwrb2xLbU9ON05UU1I2ODZQZzBBNkhCWndvTzJWMHUrNml5c0NMWmZ2cERU?=
 =?utf-8?B?bUxsYWdJRGtOTHZiK201R3ZlL25DSC9XSE4vTWZWczFDd2N4TERFR284Qy9X?=
 =?utf-8?B?RUNWSzVmdXNkZmFySzJVeUMvbEhDTWVoMUV4Qk1XTGRUMmRaWG9KbjhYUXI1?=
 =?utf-8?B?OG96aDY1M3BzcXptc3QxcEJSVmRkMHN4R2RRQnJZaUdpTlowc1h6ZlM3bVFV?=
 =?utf-8?B?ZGplYndnUVZlUUNOMC84T050ZStTNC9yYVNJRktYQzVIMFBxeWFJSWIrUFBW?=
 =?utf-8?B?MW1FVXc3UjRwZ25qamU3RnZYdTNSQWs4VXVPL1hBak1vcTFNTEVCaXI5NSt4?=
 =?utf-8?B?ditWSHliMjBXQU5sS1BHejJhdWt2QU5ZV1ZmTDRUZDNxK1BxUDlyc1F4VXZ1?=
 =?utf-8?Q?5oM2OXaVL1BbseaE=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eaed3766-503b-47b8-1555-08dee715e91a
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:50:42.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxnpPoaO9xyf8au8pcVOWFrmnGSbVln8VoB4rIYlkmObngzehUc2ar6KEwfHgFOlwDUgwuSPcyPLzbv/0EXx8qcslxopIrRA2vlhpo7LZDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7024

On 21.07.26 13:23, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> Add MU-based communication interface for secure enclave.
> 
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
> 
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
> 
> Other dependent kernel drivers will be:
> - NVMEM: that supports non-volatile devices like EFUSES,
>   managed by NXP's secure-enclave.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
My test and review tags were sent for v25 of this patchset. Meanwhile it
looks like you have added tons of fixes for Sashiko reports and it is
quite obvious that I haven't reviewed and tested those. So my tags
definitely don't apply anymore and should be dropped. Thanks!
