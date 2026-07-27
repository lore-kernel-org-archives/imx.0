Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020083.outbound.protection.outlook.com [52.101.84.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB48412C12
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158803; cv=fail; b=Z8j9K4l3VABjYjjUKUdyKnrVVpZhkbVT8jxD8jOoJLsxHOvmkMxiH65P4HAkTkt0/yfb26X4ceBtU8akmfg9SSiOeOQFnqxQC16Rxwf6+3zCnzhsyeaNT6fXEFyMUdc8bogswvk5TqscKeaOY87J/+MCY/fQ1GUh2j0fkSS1kGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158803; c=relaxed/simple;
	bh=WqclmB3nAiMLFYP1CwMJTelTuyUB0+GQUJ3+h82u8eE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aE3wjr/FZQQdP2Wv9U9Rrgbj8dKiEskS+Gk2weNYG1/+lQ708j71XitWnIg6ywF+RRZX+HZO9Z9fS4yZ/IppHgxDXhwGcBYPeboE+qz/FO/7NcheHKTy7p1jXHFM0jV5SczpV8oWmet6bj+RszIr7NNLKgbzsGwaAR98SRjAr/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=qqe6fARZ; arc=fail smtp.client-ip=52.101.84.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="qqe6fARZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUkcuRAbwBjuVYLS7gx52OoPlzISLwCIPFDWQQ/bNoAIzgzgLWndS4RakKjR+y/ajj8ZlYhSQdRearu2Osm29CM6YUtgVpGyk0CioIiEdrnw4EIEe/RuSssBuy2l9WhkR2MR/iFTu8PeQxJjuDuJuOmO8EI+Ot00DcvBiECp6NwO6VZ5gZTjBBmYwdZbQt2UBTOJIMU3/KvkaErqSqHCm90m3O+9ErZx2HC4mW/Z/Xy9o21ggUw9AAcc28HnbAQvhEZI7jozDuiBf5/lf9uPHHtHnWPP463bSJZ6sF6I76KlFOdon/wDzR3wAg9llRMorS9+ZFJnkH5b0s8PeESe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yknk/87cst6CVy2RiTs7Ka/xhiAjbpw4Hbzw07BNm+g=;
 b=j0M7RApPk25CpTi+baVkPXsZWLGYhTKkYPrW01QkAC8mDccEMn4scz1oUKSes3plWw41YLWNsrU/lF4g2wDAGHE0w9aATf2ORLpLbrqMK7u9ihsT8qGJXeXx47CQ3i5ORNAIzoxXOzWJalO9wE32YKHKXxnnSAT6oGdikOYjgPZUqlnGOpdsll9dX82ssK5o2g1t5TeagXypUecy1ME0bPdBxQgYWsugmxSIm7Z1UyAFlaMVHQ6TDc1twyjlAtdl6+lEhiQ9kjUpGW8zQ9PbaUOVlTrXxED8RNqUEq0pEoyH0F2QBlww6u9YA1FsnlYCqegKt9sJn0PIvTboYWf6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yknk/87cst6CVy2RiTs7Ka/xhiAjbpw4Hbzw07BNm+g=;
 b=qqe6fARZzwl0hT1n5aey9sV/b0ss+MjcnrMHCUzvN/8klLocWxc1DFB8L6rQvpzKl2yS30GbQNOkRxBziHor/JtLjvkg5sO9kebRC2kRZ4Ee3W6+rBQRDzqHuMpcUbdKnGUc/UhitCnqwmAHWpMXCOAC3h80sDNW+FKMH5DnAq/ZzkptBKtEY+ZGzz9eoFays6/GJz0wMFyeL9P/kHbhDkFk6RB8m/WQ74eBhL4c1ATOu1vT4LGug4/7bfa6zrXVG6s5VV/41oe0Y8jFRuYB2EGN4aafyYg2HzfxRAy1pssKngioQpKqSnNKhBz7j1fiUMrr0TtHks+4UmqwerBY9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AM7PR10MB3254.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 13:26:38 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 13:26:38 +0000
Message-ID: <442783be-aa7b-4e3e-a2e5-4604b342956f@kontron.de>
Date: Mon, 27 Jul 2026 15:26:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-7-ce8ba256692c@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260724-imx-se-if-v30-7-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AM7PR10MB3254:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc180d4-8a86-4f82-efa1-08deebe2b038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kBatAMJkGIga01U2YjuzLzha+la+TVQ1BZ5jyDOnKV2oWu/eGTQbAn0220b0uEGXEQBJn4A2lP7TNJM/X5WJPwILFMbCBOO1ECO2UIM3+TWr6w2AIXSiSrlvKmgxVciuhMGhs1fRSELyIQ6p6RpLKG86iqvhQT5E3w2cwxlo6+DqYv9nXJGQrfy3AgIFU9WY+vfeBLV7ALI0EZpHpIqcNqhNaqU0UIadnZqk/AGrtW0oVj6oVGIY3JLAh0VG/e+8ysZNTaF+5IbaKjhxOebYk0eclxXYiQA6COlzkk0gLCHx7VvI4p5ULJkdFuXAPmtN5Vy89Ws0pyTDLJ+mvzK4qIxSaob7xeZN7mMt9irAl6en02xbTsSHJ7tQpEJ6oYf8iPP+0EXNfzIWV1gRAsBGvzmSyh+cQHWpfJQQxB2obxaGOVPrM9flMQL5OoZM3DfHl04izyLam/biSieTvSIFzpyFIHpTxjHWJUZBopwTPJ1esYttwiYk57oH+iICrzQnfo8jdO+fPGEJMoNNE3dcnIao/MVcxz0jjjowgJKFPExWlCSeiIOHq9qfEPfOSzm9BW+x8t1MjO+A2JExO9PTTMjuCtnsQ7ES4C5HoELSbapbGvZaEGacGbkWDH/rtpsaQQpdbwfQ5bjzdYrnKLzWPcp2Hdfasa0rckYiRaSyAZwNwgc7NdFX/2kccOWsxuxJfin2pHDK4O3ZDQ1K1e/ESw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3VNd3V4dktHWHdwQzRaTnFyZ0hkbk0wWUVxRVB4VHUrWC96VFlyamVkaEh0?=
 =?utf-8?B?dTgrK0xUWThGTkppb2I2YnhFZ0tuWVVFQUFuczNRMk1oQkVybEZ6Mld5QVdy?=
 =?utf-8?B?MzZuUW5EZXhBMEFuKytrTmFVN1YxYmZvNFJ4S3NnalRaMHFubVV3UTY4d1lD?=
 =?utf-8?B?U25oVW8rUUpwQ0ZXQS9hOEZuOUdWRjN5L20vd0JVSlgxS09OQ0J4WFRQVDlQ?=
 =?utf-8?B?UHR5Z0xDWFAzM2tiTGxDL2g4ZFZrb1psU0M4YUpGc0UzRWpFS1N0dXVjc2JV?=
 =?utf-8?B?dU1GOHBvUVg2MkxjZ0RWVkw5aHU3UU5heTVndVE2NWxuSU5rUUtaWFVHdk9V?=
 =?utf-8?B?VjYydU9tQzVMN0ZRWnNPMnFld0YwelJNUnN2MlZXUlBtc1RxallNVEQwUUMz?=
 =?utf-8?B?a0NRRm9vVGxUSkt6cmowMlV1ZzhMMEJGd0lvUnBoSlZpSFRTMTlqOUtlRGxn?=
 =?utf-8?B?SmtTdkZnRFlUU1JUejBhd2JVMGV5aDBIQmtkdHdueUc4aTA2OTBzR0xUcFhQ?=
 =?utf-8?B?bVNER3dGcHQ3ZmZTN3FZUlc2MXcvSTdISHBwb3dPeE1vNHprQm4yVjV3ajhE?=
 =?utf-8?B?WVdwakxpTnB1V21CQzFIV2dVMDRIQXZzNHpwWllXZmFMTmc4L3ZFbVRTbWh3?=
 =?utf-8?B?YzBhUWdocXp6OHZRVVFaeEt4Z3RxVHZpc29qOTBoTVB4c0xjRHBQZXcrWUYx?=
 =?utf-8?B?WHRhVHdKYXV4clFOTWpKTThjTmxYZFMzQkU1YWxQMWc4OGFKSDVURFMzUzNM?=
 =?utf-8?B?MmFzb2xxNnIwQW0rRlNkQjZQU0FrSzl2cmRFYWFiTWxKUXlqTXZmL0RMVzJL?=
 =?utf-8?B?dm9FK1NqK1IrdnFOekIralU5YmNXU0xPSFRFUytsN1dGVmFSQTNJOVFkVGY0?=
 =?utf-8?B?QXlsa1R6NUgycVkrbjhYSUtYeHhMR25RVW55MVlQWEZ6NVNEOGluK1A1L0hW?=
 =?utf-8?B?UXFhMGUvYlpjUWZaM09zbUUrSzBkanpIdzBzRldpY1hTM0w4amdZRmNBNUoz?=
 =?utf-8?B?YmtiS21XS0JCMXZMYzkxK29MWWRwSGs4YnRsZEZWdm1CVEcyazh4a1NvYWF1?=
 =?utf-8?B?dUNTdGZHdkRDSW1oN1hHVldvNDk4RHZUdjIxVEhIcExoQnFLRVNpemVDZjNr?=
 =?utf-8?B?K3lKWm14dTM2RmRGdjhQNTVOc2dRc0xwK0hLMitIS202eFltZ3lGR1pGNkFT?=
 =?utf-8?B?Y0RnelBLUkloQkI0aUV4Uy9DTUFBelRVSzV2Rnh4bS80ekkwTGtubGpXVU5B?=
 =?utf-8?B?bytyTmQwRk9wM1pXaXlzRnQyc01QQU1WTS9CMkJqVkJ5VkhZRFIzaDg4RGll?=
 =?utf-8?B?RzhiSFZZTVVpdTNCd3NaYWVxeUNzSVVCYzdOandVTVpzTm9Eb3pWbHdiTE11?=
 =?utf-8?B?UGRMQ3FKb1M2dVFNeU53VGdQUmtSQ21mOFUvWUkrMldLOWpSayt6YUVtamRG?=
 =?utf-8?B?OFFOYU5kS2d3SzFhQXBzNExVcGt1d1JrTEVUVXFpUW5xMkpOR0QwNDl6UTdO?=
 =?utf-8?B?bzA3ZkZ5aVl6NUs3VlRrWVVQRzNpeTZta1kxOEtaWE5oaHhwTUhHY1dqV00y?=
 =?utf-8?B?TDRTaG0ycXdDUkdLdVVTMEQ5MmsyUzdvMXJSaHNxRWZlbXJUV2pCeGcrdUU5?=
 =?utf-8?B?Y2hwdWE2clFkVTgvcmthZjl3TFBUNFpRSjgvSVFHTllyZzFxU0dTdlloNWN1?=
 =?utf-8?B?LzZsa3NFcXRGaVFpTXlJWXV5anFrSklWVHlwY3RENW1HRVR5YUtqdmNqd1Fx?=
 =?utf-8?B?bWdvbm8vOWIxSUMxREFZc2JFR0t4TUl3L1luTTdUYUF6L3JVQmF2QVhWQVRM?=
 =?utf-8?B?TlFpM2IrV1cwUzlhSXM1eFhJOERmcHlFMzZRdGRpeitDZEdiS3BlTEptSXZG?=
 =?utf-8?B?WEgzYmVmRWJoZU5wclIwNmdIV0F0V0NhbnJTTzV6VDc1M283Z3U2cXJHcVN1?=
 =?utf-8?B?WHRyTllkOElPVXprOEQ5QlFPUzFsOFZwd0s2TXFCbEE3cHhzT1kxYnc4L3Ro?=
 =?utf-8?B?NGt6aDBzNm54SGJuSlVkQUIrTGQ1Wjl2eU50dFJaYXgwL3I1Mk9YNm8zU25W?=
 =?utf-8?B?UHFOOXljUDFlSEozQ3A3ZWludTFNSDB6OGVsYUd0Q1JTdDVUbDJRYW5UZWRn?=
 =?utf-8?B?aWd4SGhLQXhmNXRsdWwrR3J6UFBsOHc0NEhsWmFveUdJVkxMbWs3TFlFS2hF?=
 =?utf-8?B?d1g4VWcxTXBwdHFmRUY3UVF4WS93am9VVnRPV0FhSmVYcW5tYlVsc05weUQv?=
 =?utf-8?B?Uy9ua1JBdVcvZXpBRjQ4QnI2YW5jbk0xL1hVbDFDM1ZYL0V1K08vdWgxdW5q?=
 =?utf-8?B?SWJEbnBIcUhzS3BwSERqSWd6SVQrV2NJOUg0UzdVM0V4alZnZTlKazRRbW1w?=
 =?utf-8?Q?6siVAD6B8VJGLiiE=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc180d4-8a86-4f82-efa1-08deebe2b038
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 13:26:38.5916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xXK1aFzmsIQLiAHBEbc8it3yHhePx7RgzYzmLwMVTSNsTzU/70oMhL85i+iUax/h/Au5PL/bNxMb8zUYk80t5sUV/9hC1r4wMWeQQOUimE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3254

On 24.07.26 11:05, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
> limitation restricting access to DDR addresses from 0x80000000
> to 0xafffffff.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 5dea66c1e7aa..16399d921e04 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  /dts-v1/;
> @@ -37,6 +37,12 @@ linux,cma {
>  			linux,cma-default;
>  		};
>  
> +		ele_reserved: memory@90000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x90000000 0 0x100000>;

Instead of using a fixed address here, why not use 'alloc-ranges' to
specify a valid range and let the kernel decide on where to reserve the
1MB area?

As mentioned for the other patch, I would prefer a universal default for
the memory node in a dtsi that can be used by all imx8ulp boards. See
[1] for the i.MX93 proposal.

[1]
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-10-1a515de33093@kontron.de/

> +			no-map;
> +		};
> +
>  		m33_reserved: noncacheable-section@a8600000 {
>  			reg = <0 0xa8600000 0 0x1000000>;
>  			no-map;
> @@ -259,6 +265,10 @@ &usdhc0 {
>  	status = "okay";
>  };
>  
> +&hsm0 {
> +	memory-region = <&ele_reserved>;
> +};
> +
>  &fec {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_enet>;
> 

