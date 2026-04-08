Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C61397E8D
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637565; cv=fail; b=kurbHxf3SMNrFtGwx+K9NpLBo1JrYKdArAAdaspmWt59oR0Kf0iAAZnLlKmcMTvGpuOKfizv0isO7MDZhw3nQ7GfDxhgEsGnyoTld+dVp1sX0qNcZj5PyUsYuanFssZfZmUxwCb4KDPa8I88g4l+763jAaGpapvGwLbpJmpMlxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637565; c=relaxed/simple;
	bh=rsZs8AtWG57GBOxZGtjuBmCyXaLf1qlWfYXpYHIQ3qQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JkRF1ao9iPFxwqquNIqRHa4j0vGhmNf6aFL1s6qfFI+LdxaeJ1800HVW+4Nmb1Hlz0OQDtfOcWYKLRjy66ipXNFBASQq2xic0YgL1U3L1aWkW8Tt6Oxmm9eyauoCN4GHXCmS6UrPuN+STX9+IGz94DJc5QnAuDnKsGgvRdvCr88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cTgNJUQm; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cTgNJUQm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4qpYDll0xIEdDadVQIk+Ak5MFAd8RRh1ykQkrkIG5TUqad65qIKLcIibSW7/fc/QFJ3tEWgkiRp1Mt2ESTI82/eGGRRFmpRSiUFH7M1YejOhRcoe+h8ivf2s18l/+r1muN/SB6zruucAsIpsDaMKlDPRAL41CySICVX43HMS6soG63wyTRVIMU8P3uBCFMSWjnnQT/hlH0lKpqRHCZqKiR0KELyXCjGi2QPD+jgKJavSYoK2eLY0g4Rv+gIdxBetsGZ/olxqycd0KxBrYmTnwae5++zoYi6aDHUzuOKKIDtuE2/1RmeuettSq4UHKFUsa7JQp2e4xTHe9bYP6TABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+b+vJqAa0rOHhuf6lMAativM30MZs8le5wdam8HCbE=;
 b=oD4rRruAkuNeSLXgrFKnrj+rKuRcexvrz5F6/1mjUICUFC99Dhe9qv/uICtXUE52FhET7oacEB23CpLUVGnay0FD308gpiLwgJf1DZy6OV1dl6AHpY0eH/5qGQeDSHKzXGQdVZNsQyiZTq+luXhjDKSa6CjyNoIvUrxrO6F3xOS7PUDsNsahsiGvp/fap/wHTedrB5cq6kpQdeo1hYt5T/K6D+1AhTc4wIflFmloIu/ho4gs2ZNzxENd4LnkmMT5pZORDkaoMecCRWtgR8VT5I33If1ZddkMB5SerofesrhT/Ffh4DBp3BL6U50vtUPvBJ0JH2zIH2/WBmmXlMHl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+b+vJqAa0rOHhuf6lMAativM30MZs8le5wdam8HCbE=;
 b=cTgNJUQmtdwroGA+Vae4hCVGhNXmepwKviJ+uDeAs+LCTVMUdCS+OyfztFqoN9Yl70UhU91+unfnYyNpoWgViieQQEVvkf1KvueKGFC/W7Q8MDT57FhUqqzmkhCCkr0EU8itcWhcEhgbrDFJeTF/h+/mUwN5Y2oXIu+M+y7j+NZaJZSj8lK9MYzA8G7wsDHuNkSwrIuvrSR/toqinMfkV6yWC2CuTli/zMdIlACCohmzG/zhdZaZoNGxeeAI+9xYCjoEEZgzwebjni58InShfPWh7R8ltoENJ/x57rdry8TGEAtkfEYfawc4irg4pSD9sh0V6JV292279Nodj1HCLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7381.eurprd04.prod.outlook.com (2603:10a6:10:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 8 Apr
 2026 08:39:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 08:39:18 +0000
Message-ID: <5ce48659-2c6c-4c60-a8e8-9031bdbaa2a3@nxp.com>
Date: Wed, 8 Apr 2026 16:40:37 +0800
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <adYRuAU5ueEKHK5l@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a33104-c9ac-4d63-a299-08de954a52d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|19092799006|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jvkpQwh1xQ5tYPrSF5qz07CP6OtyEJxhoUfCKKBrYm6LhQyc1JWsWHYZtHJEn7HuzIVjx5llf5zPU2fzhW2EmeoeLZYGfeSS6f1V9/vRxM1wYAoUZ3AdCZnFWdHx5Z/C8s7qgcCl3pGkFnP7I1PfyghKZmyk5m+ZLgGZ3ZjBcW/dYLkUtpn2nclW0nfsX/QyX5nUaChLqQgaLINMKRDEWmmPwDheIrPfsoLVAUEN36dL46KRl/MEk481HdVmbZPHefDjNDf6ceM+fNGgJ+JVmVsyTh4bQrqpQxA0zK3XKmUf6EAlKWQXBXi9YRbFF+5zWf366wnhDi5/hU25Rbzz8Sl/lp8LbF5MH4IEAPs2SBfbU94uxnTwL0/gOY5jaQ3AB4aFhyXHmSuY7WEoVKJ2GBAY2qjZuyN/QbZP8Ac8bd1NMBcn1qxQRmezdYdtwePDNzNNTSsXbd/ElzVGcCwM5AsD5/Gc1szuoCaSBAWt0T4KbaJ7qWLXJ9DiHMEkcjK1yolvHbOa+jrEcRQrsNQO7hAvF8pVNwDBV5ksn2Q5qmgi7r26MughvlDjdseflLcQtoDfHBLk7JiuqfOSqgTGPmKkhABwojdLzOe1zBKiNKW46Fih7HpGiHHx1Q2gF6QG7wBeRFZ/3oQjFTtge/J6ed3DPgcYSSV4TGA5LfDMDJdnq4AF/JR6siuIZ7A5QpGEZZOsvr0zw0rM8w7c7AaZsFUyGyBBkX74VD0pi3OIr+xlYpwRxhzhd4nSJ5tVR+qc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cndGQXI4YXBQL1NEYi9ubjlTTVFwRVdOYllsYk1qSDJsdnB6WEQvdG9ydEJC?=
 =?utf-8?B?OUw0dEEwbW5JQm81OFlyS3djSlovQVBzYTd2Q0t4Rk52U0E4U2RLd1JFcDVh?=
 =?utf-8?B?UmJyNXhWQ2tYMHZMQ29WOXJBSEkzQzg5Q2ZCY1N1UTVRbDlPaXU4Z3M2TlJP?=
 =?utf-8?B?b3REajRycmM5eFI4NXU1U0tGTUN4eWJSRTBuVzFjQkNkVENHRTUwV3VLTk5H?=
 =?utf-8?B?UjJ6SnlJOVlsY2hjZUNSekxUN29LMGtWTSt6YWNjZ1g0SHVzekJxbHhsWXly?=
 =?utf-8?B?bS95ZWZMTEhiWG1ySmRiRUF0RzM5aWxxTGU0WXEwWEE5RjI3K211ZlFheE5z?=
 =?utf-8?B?WlEwVE5ZcEZlbEk2b2FMS29KWitVeXIvNytUVXJEMXZlVVZ6NG43aE9lZHJF?=
 =?utf-8?B?cGd2K0RWRThUZWQ5czlnSjlJVjRwdjdmVzZjeXpIaUFXc1JCaXN4L2JmT1RD?=
 =?utf-8?B?RGQwblpIRWJ4aFVrbFNYakZwb1k3dEdyK3lJNFRickJ2NUY5aURxUXhZUHNt?=
 =?utf-8?B?Kzc1aW05d29TOFVGSlVjQ0IwRWhLN0FpTUFxTWNQRURBWHZwSnpqQy9KME1J?=
 =?utf-8?B?RmYxa1N0U1ZnditiYitmZEUvMDU4Q0QyUDBvK2lLd2hTVHo4eTkyTVNJc09F?=
 =?utf-8?B?VHcwSkNuekpaeHltZmt1MlM2NSsrcVNQNDg5d1FTVDlWNkxJVFQxYXAxN0lt?=
 =?utf-8?B?SUo3VGxQczgxcTd1aStma295eFZOMEMxSkJpZW0xempMKys3VjNRUWY2clpS?=
 =?utf-8?B?blJwZEhqYlVnSWY1dkdZTFJ0c0NDMCt0NDNNZnpESThyaG1GOGtwVnRjT2Fp?=
 =?utf-8?B?ZFMxZWZORjV6V2dNYnZUQ0ZEaVZqcmwvMzg4Nk1EZVV3aVMvVEoxa0NpMFhY?=
 =?utf-8?B?bzdmWDZYVVJwTUkxUU5TWktpcWtOdFpKb0dWNHVOZkVhWklDeSt0VnNYeWNq?=
 =?utf-8?B?SUdHWmpGWFljVU04Zk5yRVNzVElQSWFWSDRzQlFQMmxIcFN0UCt5UWVKZm56?=
 =?utf-8?B?Smc0QWRvU0lzOEd5TWxGVzBRZFVQNU5wa2hiL1BVTGpCWEdjNnUyL1g5R2tE?=
 =?utf-8?B?d0NuYmNzckpIdlpkQ1FRYWN3bmpHL1plR3ZRcit1OXRDYWNtNTVhTmloSEVP?=
 =?utf-8?B?c1VnTmNrVkFGWXMvRDNyQ3lVLy9ob0kzZVRrNFEwVDlYK05teUs0eUtzVkFx?=
 =?utf-8?B?RFp3REJVWmxsMExVRDZWVk14ZEU5NXA1WnVyaVpzUDhiMEpYSTZjVmc1d2x5?=
 =?utf-8?B?c2VjSFBaRjZWcVI2TERZbUo3YUJkVlpEMzZwNnZVcExIaXFQNzhwYkppdWdV?=
 =?utf-8?B?ZUl6R1U5RnJFL0hDNy9uTUxYRFdyZ0N4R1Y5bERveHBvQXFiMi9qcnhiL2hK?=
 =?utf-8?B?TWp3Smw5MUFRU09lTEFxcXZLRWppWmlYOFNwMlRNS0lPT0xLYWE2VW1acTJt?=
 =?utf-8?B?bFFtb2doa3FxenhUMlhvdFRGcUkvbkhrVFZLQmdqemdBbnJLdTdXV1BucDEx?=
 =?utf-8?B?Q0hKcldsZ3ZzYTl4UVpvcEJUZU5naDFuWkNlRUFTM1NGQWFQZVE3M1BxV0Nu?=
 =?utf-8?B?VllZV2x0WjY4aGJNa2Q1MjV4MndrNVFvRUNYNDNwUnFtdS9NQzZWeG9DMjVK?=
 =?utf-8?B?d0VJZVo0YTBGM3V2VHBucGVyU0VTQmZQQnp2eEhkRzVySTZ0TGhSZ2w3NkxC?=
 =?utf-8?B?M3hJeU45WGRkSjdkT1UwMzJsZXRkbEdpVDZWd1ZGVFBrN3d2K0dPakxzZm16?=
 =?utf-8?B?MVc4dzk0NkgwQnNYVHM3SVUxM0ZJTVNZdmFmWm1hWVFFVjVJZytUK3dBb0l6?=
 =?utf-8?B?NWs1KzJ4TG91ekNMNVU2SDNEMHlJaCtyZHR2MUxzK3lxT0Z5eHZTYTd6bGFI?=
 =?utf-8?B?WGVJSUZMTjgwSUtxVUQxcnRKelZCaStUb0I5UWZmUmtyL2VMcGEvNGRWamo5?=
 =?utf-8?B?N2R3Y0ZmQ1d5dFRFSjRNV0JjWUNKR3VSRThiMHY4TFNrZjZwUk1jcWxBNjNE?=
 =?utf-8?B?d3RwYzZ4NkNFS3UxaUZuNTJyL2FUd2F1eWNwNm9aWDMrdTlIM1dGalVvQnhX?=
 =?utf-8?B?SWUydkRrV0pUdURMa2dtVFI5L2dGUURnNytUeEZHb2RaRDBjREFwTEFJQ2du?=
 =?utf-8?B?WmE3TldvcEZHTlNXdnI5M1JDUENIT0N6SmxEc1RGYUVRdVZNR3kreUlLZ1Nn?=
 =?utf-8?B?UG50ekg1RlJKYjB3bUZmaTVCK2VxR2JxNy9EZjE4Rk04dlY1amdMMVBYbzJR?=
 =?utf-8?B?RENDbnowaXl5U25LZTRaQ1pObTRwQkIwamgycVdSSHV4aWVjVFFsb1doQVNY?=
 =?utf-8?B?M1Rnb0JYVEt1dThsY1M0aHQrb1JXeXB5clNLSXVFQnhjSWluM1VIQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a33104-c9ac-4d63-a299-08de954a52d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:39:18.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wh9Lf7A5Wmp3rKtBEn3l6gNdWiNhRbj+6YOkQaLxmV8QGRXygVl1iRkheyS16xZ7DaGbMze96TR7eFhSscFhZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7381

On Wed, Apr 08, 2026 at 04:28:40AM -0400, Frank Li wrote:
> On Wed, Apr 08, 2026 at 04:08:24PM +0800, Liu Ying wrote:
>> On Wed, Apr 08, 2026 at 03:58:59AM -0400, Frank Li wrote:
>>> On Wed, Apr 08, 2026 at 02:02:54PM +0800, Liu Ying wrote:
>>>> Hi Frank,
>>>>
>>>> On Tue, Apr 07, 2026 at 05:55:29AM -0400, Frank Li wrote:
>>>>> On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
>>>>>> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
>>>>>>
>>>>>> The panel connects with the QSB board through an adapter board[1]
>>>>>> designed by NXP.
>>>>>>
>>>>>> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>>>>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
>>>>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
>>>>>
>>>>> Can you add some description about raname in commit message?
>>>>
>>>> I'll add some description about the file copy in commit message.
>>>>
>>>>> Use -C option to create patch.
>>>>
>>>> Will do.
>>>>
>>>>>
>>>>> ...
>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>>>>>> new file mode 100644
>>>>>> index 000000000000..c233797ec28c
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>>>>>> @@ -0,0 +1,14 @@
>>>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>>>> +/*
>>>>>> + * Copyright 2026 NXP
>>>>>> + */
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
>>>>>> +
>>>>>> +&{/} {
>>>>>> +	panel {
>>>>>> +		compatible = "tianma,tm050rdh03";
>>>>>> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
>>>>>> +	};
>>>>>> +};
>>>>>
>>>>> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
>>>>>
>>>>> to imx93-9x9-qsb.dtb, so needn't create dtsi.
>>>>
>>>> I'm sorry, I don't get your question here.
>>>> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
>>>> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
>>>> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
>>>> file just aims to avoid duplicated code.
>>>
>>> My means apply two overlay files to dtb
>>>
>>> imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo

This ...

>>>
>>> In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
>>> &{/} {
>>> 	panel {
>>> 		compatible = "tianma,tm050rdh03";
>>> 		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
>>> 	};
>>> };
>>
>> If an user wants to use imx93-9x9-qsb.dtb and the DT overlay blob
>> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to enable the tianma,tm050rdh03
>> DPI panel, then it won't work unless the user also apply
>> imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo, right?
>>
>>>
> 
> Yes, imx93-9x9-qsb-tianma-tm050rdh03.dtb already created, which already
> applied both overlay file.

.... indicates that imx93-9x9-qsb-tianma-tm050rdh03.dtb is generated by
applying both imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo and
imx93-9x9-qsb-tianma-tm050rdh03.dtbo to imx93-9x9-qsb.dtb.
While, imx93-9x9-qsb-tianma-tm050rdh03.dtbo(a DT overlay blob) just contains
the panel node, which means that an user __cannot_ enable the tianma,tm050rdh03
DPI panel by only applying it to imx93-9x9-qsb.dtb, unless the user also
applies imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo.  That's why the .dtsi
file is needed.

> 
> can the same board be use for imx91 or other evk boards?

Yes, both tianma,tm050rdh03 and ontat,kd50g21-40nt-a1 DPI panels can be
connected to i.MX91/93 11x11 EVK and 9x9 QSB boards.

> 
> Frank
> 
>>> Frank
>>>>
>>>> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
>>>>
>>>>>
>>>>> Frank
>>>>>>
>>>>>> ---
>>>>>> base-commit: 816f193dd0d95246f208590924dd962b192def78
>>>>>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Liu Ying <victor.liu@nxp.com>
>>>>>>
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
