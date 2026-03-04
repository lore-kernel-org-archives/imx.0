Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED493451DA
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772594886; cv=fail; b=MMV8n68D3FH3bUpLnCKx9dYX/YrLOUDc78+6WLeyNelySVI8HIGyKvK2LpT6GzhVGvLsVPvOq2URv8StFXcusQ1dfdWiMO6ZeaUlBwSUDOwKcCXFNRrplMVdRndVFk8cjPGlraNkTr4GlrcW5yFHKSBoWhJQL2rGi1cJhINv+Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772594886; c=relaxed/simple;
	bh=VwjI7CRkopI/l8iYjsThUvU9XFwPFEX2CESxfpLsaHI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WhplYooV4wo3e2zBuQjls/HU7kdqth9hfg1J+Vsk9Rt9cbGokaL9lGPVuCC/rTgGTLtjfCiZkNLdFwiAcxGQ4l11HrqznV4M6KR/TfKWCUTY3nkDASEy1l9wA8DVL5hR6at2LlZ8GaOIyl2G/8IckOn+qzm3MIDZ8i+qhW6ORm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dAQroL8k; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dAQroL8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tjo9yYOfVeLTDgxpAEDQAWfM76A8eNla7dOrh2/uGaNRFaSKmcQqhRKtNiAu7rhhdvxNHWLFP0Q7FjG5YhNwr9jfMZyHfiyVCnQxfyn4CpoWBLf58KeK7zLLczF231lg8cfeYDrgs/8/kvB2RzZnY5NAp0iRuBkFVeO1FwynJXfKxB7mPrUk5bxQl8zIdod3YtHEEaE5zQV2Tjf0uuWQ3um0tB/Lf0TSX0z8Te5utwkDbMVxUCqeTQfbOf+HwBPseE1cbYFK+6nmZNJM98zFdeHhN/nyxKe7UhzMLZ5tg6TUx+AgB1+wIhc/L4uHaZmG50HDM4W5ytmnglph/pe/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Apb58zFRjqcRlq7pHs0A3lIsgG4cCF+SKBIaD7gjTg8=;
 b=w1fLRBdI//PDBfZTGXy1ZsyvgdXzX2VPkm06KlictSpxlLY3yJrmXa+Zyj0sXG073k2IX39VygFjibULJ8P+8k1L+2ET2Zws/QX2/C3gdvKvejVQXonkGe1yg7KYRvMJQOg0aKt2VFCE7+4zo3DTCL7mg7F/OgzUSkewK4nad14CCV5IAnO6pOxX/Gn/Gf6BZIrspTTCBn3IN8SMO51Dk+twyTNlHKeR0Etgxfbn81U20pXeSFNhUUSPRzHHcwg0L3cmfkVjBHCSZ0i6KXj6k9aXs2ilHW2L34rBpWfwu7G/v//Sabp6MXlqvPgvUUhWHsD4k8ZgRlqGEgapHNz4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apb58zFRjqcRlq7pHs0A3lIsgG4cCF+SKBIaD7gjTg8=;
 b=dAQroL8kc//BEficRTQpZr4+aMg2ne0oSg0XT5prJeKlo/2+TcCbOdG83QMPLnEyAIw+Fpgw0ki/j/ZFXX958aOhsUg1KAmdob36pQzyBlx9pygvl+JNEUvMF77F+9yRwNbOvDa9HFDdJ1VhG+KRXu4BaJon7/fl5Dxb6NZU1oSPBwJTaD7KRoNZ5iQsLNpq21T8EwleUFHotkcYMQIM1oHijsyzTCjt+HOEfD4XovrdZwNOZt34ztS1efkTkgRaw3BiPUepp/oCDiS1M4DVLSuswaO+h6OZ++1nhhNE0Bdz2YtTzMMzVW3DgeFKBEBMYgZJ5/51Sbc7L+/o91AbCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 03:28:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 03:28:01 +0000
Message-ID: <fdcf60da-bc0b-4b99-803d-e2d1948d5633@nxp.com>
Date: Wed, 4 Mar 2026 11:29:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
 <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
 <aademaK0PpTMZ0Xk@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aademaK0PpTMZ0Xk@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cc1a82-22ea-4c66-6fb5-08de799e09cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
 N2f06+L0+u3MSr++wWhacs9BHum0ELhSs9Sil3jFp2xrdyA9cQA8aaZa3kNu5HL5IRwlb3LY3gWnCbivshy836q+9+HjZ+EN7uqL7lq5pFkVo2fr9l6u34qW2CMR091CtYHOfYZLBMqK45uj0ys93viTCvS7Ga2Mily9p0YRBB4ZXScvjVCYOwts9guK0MscAWHhb5XT9hgoxIG+SQgjcbHllmk3N+/DIgvv8pwhLT6Z9FhVpfmKeKpTq3rwKwG5DQTn0XK6nQheVz9eujEua6PbsJGPc1GgGf1aTiyHVL4I6R/Zz4+d/n9oBWY2E1GWyUZBzIPZGczFYLWLy9XlLSRCtVWzaDSgmZ8/dFHqNsyf5Gys7/u0ugL8BvU0TQ1nJGScjIv8X/DVLqTfA3BoSm5clgH81RndQZ2cm4qA0HWnNh2AZjLlEP1GSWtsrCHQMSmLbafuuRPYe/+ku3/4fL6GGCE9JQGn5dktAzXyXXMlZN2QHysMoYmqu/8a+4irCsI/O3pkf3C6QRk8fi5WLgmn0vu7w6gWoSv3701RyH16HHKmGipO/aVvlRONqHplsJiDZX6mOPr0US2xANYNPWymTgHQqOIXwm2gH2wt+yCwMod9SpwYurTKbW6JVGmHm/nWaDkVFalcE9t46RQK9dZvmGTI6fa9t/gezznMBXZeBVAruqAi0Y3uHADg1Px8
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dFpLR3M3RDJ6eElTak4xTEk2L055elRKcUhDdzJucWVXdE1QOEtvRTNhT0JM?=
 =?utf-8?B?M0lRaDlKMXBZWHE1MHVDKy8xeXJseVdtTktMMGNsdERVTlhZcnpDR0JVR1Fh?=
 =?utf-8?B?Sm1lb0F3K2VPY1RGcVZNL2xWd0s1Q2ZHQW5YTTUyYUo4K0hCNUJ2Snd1blJ2?=
 =?utf-8?B?T2tUdjR1b0UvQlpYRHFESGxOMDVUOTlvMTgyeW4zOTV5Sk5CNHYrQzUrUG1x?=
 =?utf-8?B?em9rVnluNGExZjdMN2RsRXUvUkxvaWVmaDNWS3IzNkJFenhoVm13MDdaZFRx?=
 =?utf-8?B?SWpTN2R3dWVIejFiRXJocnM2NHFlSDlYaENNRjRIQUpoakVQQ2gyM2JqOXgz?=
 =?utf-8?B?Ujl0TEVaSHlvOGdtZmRMZ3NmVlBnTVcweGZvV0ovdmh5YnpGcXlFbmRNa3F6?=
 =?utf-8?B?bnZGR2QzZTBvYzYrOWI4U1VJcXNKdTlUeG96cHEwZWs5dUU3WnNFcys0ejZy?=
 =?utf-8?B?ajI3ZERscWFqaC9oSDV6VUNNam1HdG1PbHhKdDB1NlR4Uk9qc09GQklBbG5h?=
 =?utf-8?B?ZHlLaWlPMEpNQXVNYlhtMlAvM1R0T1ZqSjJWNCtkakVyMGtaMWJxSHpJZXlv?=
 =?utf-8?B?dE9pRUprMzVIbHRVNnpCZVZrYVJabXl3SjRYZGMrckJaejFrenBiVkRDRE5l?=
 =?utf-8?B?NTJ1dkRJcC9YYjM2TUxES2NKancxTFZnWU1MU0dmbU9lSVowVFR5WEpyUjVl?=
 =?utf-8?B?ZC9kbWVtQUhDem9HOTI0T1UvRk5nS0J5bDI0U3EwclF3Tm80Y2ZzcXp2a2xq?=
 =?utf-8?B?R25VVDZZSUhlV1RVMklvYzJTTXk0VGdWTVplV0NrV0krQUgrTDBQT2hQMklm?=
 =?utf-8?B?cTA4eUFHU0p3aGh6MGtIQ3IrSmRrQms2WDAySThhemJwanU2TmNoV3d3Yk84?=
 =?utf-8?B?MDdNK1dyVlpJN3dOeWtVNHh0TG9CbzFqVzMvbEQxY2ZtQ1lGYjBVZDVTdzB2?=
 =?utf-8?B?ZlpNSDFHUlVBVlIrcDd4Kzd5TWh0dWdVdnlUczcya2YyL3pNVlBpM093c0lo?=
 =?utf-8?B?WjZhcVJNTGdqUU9yQTFGdE4vMVBBV0h4SEFBU0p5UysvTWt1UEdTMVZscVlJ?=
 =?utf-8?B?RWlsV2Vhemd2UTNUN1pkaXZjNUFCMWlUQ3NHUlBQWG15Z3kvM1JCYmcxbTEy?=
 =?utf-8?B?azZOYWdabXloelZoOFRacUlBZW5KcmJ6NmhOMmxsa3lLWG81NW9EbHJ0N0Nq?=
 =?utf-8?B?djN4R0RSNkMyajhsaDhWTWhXRkhtNnFIbVB5WGNxUFRpNWlvNmU0S2xhYm5R?=
 =?utf-8?B?K3JlNGFqdjdTOUdqcEhFak50U1BJb3Y0WTNYUGV0a2YvSU5IQ3pNZU04VDVj?=
 =?utf-8?B?MlI3MzBRM1Z2dEFFVUxOOHhnT1hJQ2NpaGw1aDVGMUpRUjg4UjFyNnJvVXpZ?=
 =?utf-8?B?ci9YbXdMUkl4ZDV5NWN5bmlxZGxEY21LNENTbmg1SkNMdmx2cmNJOEJqMTRI?=
 =?utf-8?B?elZwM3pHclBFbitmeER2ZXJHSUhVT2RVNnd5SnhBK1pVa25XWVQ5Z2dMTUp5?=
 =?utf-8?B?aUU2QnZHT0VnVnpNTy8rb3NkYk04K04rTGNFRGM3WXJ4NEwwVnNMNkRQdUhm?=
 =?utf-8?B?c3ArbnV1WE42T2NtUmJaUTZNUEQxLzZPVlRoZHBJTGJiWStPUDZUQ2JnV01B?=
 =?utf-8?B?YzFlSW9Ra25LZ1RoL1lYVHRVcFB4RCtHNGxhdnh3a05nN21lbUduUzIrSzFJ?=
 =?utf-8?B?VWtlOFZZQkJxdVVvSkh4SElSSDNiR1VORm9taGRmVklxSW1HMUZNbXdEajd3?=
 =?utf-8?B?UlpnVmtpdFpqTUhyWmNPakhTNEVjS3ZlVm84T0ZmK0VIemd4b1pUUGNYUGFt?=
 =?utf-8?B?Rjc4cDY2dE1NSWJNZ05pWXIvbHpvZi8wZHBIMEYvTVVaS0MrL0NXMTNONzdS?=
 =?utf-8?B?Q28ybkJZKzRGOTRiZXBtck5wOGpaYU0rRzdpazNGbWN4a2d5TGwyNjU5d0p3?=
 =?utf-8?B?d1YzL3N2Y1RRMkczMEY5bVRwRUN2VTVBTHErV0RuTTNTSW9Xck1KTVdkTE5F?=
 =?utf-8?B?eWd4K2xUbldPNGhTZFlFYnB5OFZjVmx5cHpHTCtsWmp1R05wR01GcDVUbXlE?=
 =?utf-8?B?dURRWU1RanVZYkVHaTNpV1c2blNVU1NXUFgxZ0JjYms0TktMemlCa2M0aUxm?=
 =?utf-8?B?ZGFmaDZ1bm5nckFiOVNndDVLYk9DR1JEQ1g2UHo1SlVja0U0aHR6QTVDUGx4?=
 =?utf-8?B?V3JScTRPUnNmZW45MnVYVVZKS2E4dUZrM0VhSU5iYmZxb1dqMU9pT0hIZnd2?=
 =?utf-8?B?Mi91bWR0ZU1iNVcvSDNsWGNNSjdPV0lvQ2gyYnN1N2N6TlFJVFVsUkt1UTlC?=
 =?utf-8?B?ak5TL203Sy9QRXhVK1pXN09qank1NTlMVTBYYm45MFhoelFBb2Zhdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cc1a82-22ea-4c66-6fb5-08de799e09cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:28:01.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd5S6qF5/P4563l5584R85ngmi0Y//Ox0tVxHu5KUKPQYSXVpNkxA4hCJRqcEAHwL5kHpHUbcEm8uSJby31SVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641

On Tue, Mar 03, 2026 at 05:20:09PM -0500, Frank Li wrote:
> On Tue, Mar 03, 2026 at 10:22:02PM +0100, Marco Felsch wrote:
>> On 26-03-03, Frank Li wrote:
>>> From: Frank Li (AI-BOT) <frank.li@nxp.com>
>>>
>>> AI bot review and may be useless.
>>
>> Hi Frank,
>>
>> albeit I'm very open to new technology, I would appreciate it if your
>> AI-BOT is used internally first till you're convinced that it reports
>> real issues instead of false-positives.
>>
>> Regards,
>>   Marco
>>
>>>> +static u32 *
>>>> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>> +					    struct drm_bridge_state *bridge_state,
>>>> +					    struct drm_crtc_state *crtc_state,
>>>> +					    struct drm_connector_state *conn_state,
>>>> +					    u32 output_fmt,
>>>> +					    unsigned int *num_input_fmts)
>>>> +{
>>>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
>>>> +	u32 *input_fmts;
>>>> +
>>>> +	*num_input_fmts = 0;
>>>> +
>>>> +	input_fmts = kmalloc_obj(*input_fmts);
>>>> +	if (!input_fmts)
>>>> +		return NULL;
>>>
> 
>> +     input_fmts = kmalloc_obj(*input_fmts);
> 
> AI:
> 
> Actually, this looks incorrect. kmalloc_obj() allocates based on the type
> of the pointer argument. Here you're passing *input_fmts (a u32), not
> input_fmts (a u32 *).

This comment is false.  Per kmalloc_obj()'s kerneldoc, it's first argument
is "Variable or type to allocate".  In this particular case, the argument
should be "*input_fmts (a u32)".

/**
 * kmalloc_obj - Allocate a single instance of the given type
 * @VAR_OR_TYPE: Variable or type to allocate.
 * @GFP: GFP flags for the allocation.
 *
 * Returns: newly allocated pointer to a @VAR_OR_TYPE on success, or NULL
 * on failure.
 */
#define kmalloc_obj(VAR_OR_TYPE, ...) \
        __alloc_objs(kmalloc, default_gfp(__VA_ARGS__), typeof(VAR_OR_TYPE), 1)

> Should be:
> 
> +       input_fmts = kmalloc_array(*num_input_fmts, sizeof(*input_fmts),
> +                                  GFP_KERNEL);

No.  "input_fmts = kmalloc_obj(*input_fmts);" is just fine.

> 
> suppose you use kmalloc_objs()

No. We should use kmalloc_obj(), not kmalloc_objs().

> 
> Frank
> 
>>> Missing kfree(input_fmts) in error path if the switch statement
>>> or subsequent logic fails. Consider allocating a fixed-size array
>>> or using devm_kzalloc() instead.
>>>
>>>> +	*num_input_fmts = 1;
>>>> +
>>>> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
>>>> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
>>>
>>> Line exceeds 80 characters (97 chars). Break into two lines.
>>>
>>>> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>> +		return input_fmts;
>>>> +	}
>>>> +
>>>> +	switch (output_fmt) {
>>>> +	case MEDIA_BUS_FMT_RGB888_1X24:
>>>> +	case MEDIA_BUS_FMT_RGB565_1X16:
>>>> +		input_fmts[0] = output_fmt;
>>>> +		break;
>>>> +	case MEDIA_BUS_FMT_RGB666_1X18:
>>>> +	case MEDIA_BUS_FMT_FIXED:
>>>> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>>>> +		break;
>>>> +	}
>>>
>>> Switch statement lacks default case. Add default case to handle
>>> unexpected format values explicitly.
>>>
>>>> +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
>>>> +					    struct drm_atomic_state *state)
>>>> +{
>>>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
>>>> +	const struct drm_bridge_state *bridge_state;
>>>> +	unsigned int mask = PARALLEL_DISP_FORMAT;
>>>> +	unsigned int val;
>>>> +
>>>> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
>>>> +
>>>> +	switch (bridge_state->output_bus_cfg.format) {
>>>> +	case MEDIA_BUS_FMT_RGB888_1X24:
>>>> +	case MEDIA_BUS_FMT_FIXED:
>>>> +		val = FORMAT_RGB888_TO_RGB888;
>>>> +		if (pdfc->phy_bus_width == 18) {
>>>> +			/*
>>>> +			 * Can be valid if physical bus limitation exists,
>>>> +			 * therefore use dev_dbg().
>>>> +			 */
>>>> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
>>>> +			val = FORMAT_RGB888_TO_RGB666;
>>>> +		}
>>>> +		break;
>>>> +	case MEDIA_BUS_FMT_RGB666_1X18:
>>>> +		val = FORMAT_RGB888_TO_RGB666;
>>>> +
>>>
>>
>> --
>> #gernperDu
>> #CallMeByMyFirstName
>>
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

-- 
Regards,
Liu Ying
