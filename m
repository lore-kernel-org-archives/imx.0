Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DA369981
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396019; cv=fail; b=dSrN/7J0A+47d3DQTn0oNT2cjonbsuYjoGOWpDX8oiq+d3bZVoe2YCw2x2nsn98eLi8LNxH/duaF5mH/2CHQlODIbNfYkLzNrZ/tafjmH2zYdwNg8xS4Ode8lRFS5mnKDj4CagtBgJn55ltdm7GfhmyT/04yLBuhqQGOGKDnNi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396019; c=relaxed/simple;
	bh=MQb7UZgQW5Y0NmCsYN8XbTm6C1MEnK4t/C/zDMSMUwU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MZ+pOm3Vwix4dMgfxdXKcKnBATUMk+19By+UokFaeRqbpOfygpvgP4zf/3jIy90Q3O1tvNoQV7QxcYIADgo2Xswspy8R4djpZGP+5Lciwu/uz6AZu5f/XYlAKrH6TkLo5PYE88GUL6jdiauLMhJ3K7yusBzNS2bx8YIZjIDrOWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XProeC1E; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XProeC1E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5oqNuqDWgWMaGh3j22KXzLOWPWNx4MkNKgsEhqhtdISipsNj5I/ipzMdKGksEONNOIvwlQW8nKdRXADz1iNrO4BmKWxqcyzb3njMY7z+skrBPGEIDnnIqBUq5N7snkmCI75642Dt5Cc1tSI8wRa3BpiLMgdMIuBd3ci1+CXQQugHuHrt5pgNbEWCz9T8sZq6Cqpt/a7N7CcwVdZIRGqBqPvLa/PClt0ntPQYOElGNnYfTETl6XbFUCiOmshfU9xl36xeUz/eC1s3V2grVXRF1F5WHcLr6YxmGJm3tt9wLtL78THUx10J1vl1V6yT1eG17h4muUhRcrj207RxA+DrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWOEm9jujXxLO3DPVJtMG6zBv3J857P4krbVgEhw9dw=;
 b=iZQYzfxetMyYwMNikexig1WgzDxuQ74Nebe33OlzQn0brAFzsEvxu455urezB1oMYMGJ14AOVTEIuH36AOZ+GgIK/U+PTXsB9Bk7P+N7hsq1unCgZmAPNGlkE3tFRO4wFYu4wyBg8S2xzmdY4iI6Cfq64UGY/PbUCqdjpHiCFKO8S5E2GQzAUz57U4rLlgoysMXjB6Bhof74SGBU+EGUwiYE+qzxxbFc3mqqZS5yZ+ghT817+WwxmzIw4jiJ8rLppVS0zS8R3GU6oJR+xH/AZVIqRRLVryA8gqQt4VBKyaoA7aQ1P7AsqCBgQiWjbC9fyhYrRzVRVfBlqceqTkhgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWOEm9jujXxLO3DPVJtMG6zBv3J857P4krbVgEhw9dw=;
 b=XProeC1Eq/+G4OEVtudNU9bkfQs9IDgNMHSBParYCZRATUQeyFHRuhh9mKEkzgH0NVFfBQ45NBjOuNLbkMEV0wcT1K4THgO96a/jOie7hn4lL+fTJkc+e+rpGx74LuF/szpHif0LCQSpY68uWJgtx8/XerVEM0WRP4dehXIMPeA0L/0IdYcG5ee0MBsds016hAhGz1IeaMdh4ccYRyQuhdJ/BDxMnBP7IeGRJo1joGoTi5jFGKA0Ghzctkqvg5cQ8Kj1Rhkhwq5aOqb/E/Gwn9UF9isWMC+hq/nxxvF1Iswzdyi7t0P1QSTv8Ry7vsWmejP4T+m8x/vy1Az869ESyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GV4PR04MB11849.eurprd04.prod.outlook.com (2603:10a6:150:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 10:26:52 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 10:26:52 +0000
Message-ID: <ce71af0e-39dc-45e5-9c30-06a03a77c312@oss.nxp.com>
Date: Tue, 2 Jun 2026 13:26:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] arm64: dts: s32g: add PWM support for s32g2 and
 s32g3
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260529073436.1767786-2-khristineandreea.barbulescu@oss.nxp.com>
 <ah3xtqdaI89XOv7x@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <ah3xtqdaI89XOv7x@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0147.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::14) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GV4PR04MB11849:EE_
X-MS-Office365-Filtering-Correlation-Id: 24af5504-41ac-47ac-73df-08dec0917683
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|22082099003|18002099003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
 RFuw/J7Dfy/J6eZY3imykRQQnVA11U75pBpJLrrANbtZwUR7Qat67Al/TbzNnlXyjVO3P3i8XnjdaOHEz286qY4kbDrJ6fImfqvHk/I7zLAr8EfOpW0x4Xhy09f3B5M/eC01IBarLH0FU0pwKVBcIkYWr4c7UHsxfuk7T8AOv2ikkvgF0BAPG9qkznA8nOdhEk86Y8hhsgKiajL+cyzSk9RP/IhmbVnILMePZqTBoOrc/FuUhxfq50gMoaYOlWZhsLZ0XuiVAHk7m/5Wv5F5zEECz0ltmCrlO58MnYSf/Y9fLa5eeTmKwnU+aCmPuTwJhcy21pt4KwIJrYESIazKGSUaNGiD13UhvxAehbpfDJGTy1hPfcSxJVhErIGmFcep7XzJf4ytq1GvhGZE1iCxz5DYdiRfFhdrA+o6FtZpfRQnP9zhGeO+egZb6pLGHbkz4LHZmE6KCXw/wz8weL7uF2KikAPlC2g3m0dg3ZnxCs3xLEsG9orJrevkiDh5grfxyYOiV8kYcIp3cjkgx4rxKS/kvwXj25ihJaCkx70nCZ5HrDtiI6bhigiuUGzkKphsZam+aDTgC6eE44UlxzPP6uhWra/1nHG3EAnGcGHuplCIYwgLSK6e03vP4GGGNzfWyPlrJpqcq/6uQZvaWiFs8kBCjpi56ei+uWKoNc6tN/ikfOgX1eXOIXEhtIdPlT7GbAjde6mTYIPunKX1f+xQkA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QkRicWFOTnJnc2dUTlVpWWk2YUNyRGI0WGxmd2lYdFJsbHpLaGpBamFvZURj?=
 =?utf-8?B?bDZIMFFJM282ZGNyWDlTdkU1d1ZDWDRxQVpKaGRPUFpTRjVFSmRtU0pxSThV?=
 =?utf-8?B?ZFE3Z2dsSEZwTjB6NWhoa0tHK2h3eHR0SXprUTh2Rm40WVlIVU9VSjB0cnZD?=
 =?utf-8?B?M1JTNXEwQ0JHYm14M2c4WU9VU1RBcnlLSkZQQkZSMWJhMmR1NGhDZ2FYYkE0?=
 =?utf-8?B?Y1RsdFBGbmRWcjRQcXV4SHFZUGw2VHhIQktuY08zcTA5UVpLejY1am9IZjI0?=
 =?utf-8?B?T1lIemZBRVJ1SDJub3FTUkp2MnVZeUtNYzVVV0dWZ1pDTlpEWDdoZ3lWWW1E?=
 =?utf-8?B?V3hsSHU1Z2RENkIwYjc5eUtYVUtlRkZwaWd4clRPSWxvZlFWeXRLM2h4RkJv?=
 =?utf-8?B?RWJLM2hBRXl1QWYyVFFvQU1QVXpQdTVmT3pBOVRneUtUQU43Rno1RGxNaEht?=
 =?utf-8?B?d0RqWTZOd2J4cjhseWxVQ1RmTWhQYmZnR0tkVjlzS1NEd1Z3SmFxSlFZYjlh?=
 =?utf-8?B?TjdJTjlQSVRzZ3NsTUZvUmlWS2k3NmhlVjAzRTBHSDRoRml4TlFTM01aNlNK?=
 =?utf-8?B?SFpOV25pQS84UFY5WFQ5RS9CVHlZSWdQMzNmQUdobG9USkppKzIzV0ltdDRX?=
 =?utf-8?B?SjgrNFRqVk9aRGZZZXMvcTA0STlNMCtGR1JZNUkwNytxc0ppMmZFTVROZzBB?=
 =?utf-8?B?UTNnd2lVMUh4aFlPQXJoRU1sQTB6dWtGZnl5NU45YnoyY1FMRmdBM09FS0t2?=
 =?utf-8?B?cm5sVU1aOWV5NkFTR3lqZHVMNUVmVWYvZVNxSFBOVzVBengxdXpWMlkvelpQ?=
 =?utf-8?B?QjFwMDR5eENEYWhvQXd1dHJFczBTMHZuK2JiQTlxOU91TzhIQ2JqYkFFVFU1?=
 =?utf-8?B?aDlrRjQ1aTNVSldpV0pxYUVWbEx6cWVGbVNNcEZvRG41OTN5OTdCaDQweUZL?=
 =?utf-8?B?bjNmUmlNM0dzMnZvUHU4ZXZNSGV4bzVxSVo3czNKK2twdTJHL1o2angwd2xL?=
 =?utf-8?B?Zk1ySUp0d3F4NXlTem5tZGRlUmk1NEFYakNaZUlSYXhYT3l5bklyNERrYWtQ?=
 =?utf-8?B?VDBUaWhCTDI1M243ekhad1dEQkp6VW5ZNnpvcWNiY1RmYlFUdVhEQUR6Zjk1?=
 =?utf-8?B?SFltTFlqT1lmQVZVcjNLS0swZ3JUL3VFNlhqazNYSmZtSGs3QzBnaWtweE5w?=
 =?utf-8?B?YkltY05yTDM1cngzWktOSVpCWldFckU1c1Y2TDlwcU5DNE45OFgxdDZPREpS?=
 =?utf-8?B?SWlwNVhkcWNLUXBuV3FhN3pyTnZSYVdJWWdjd0s0OEVoK3RwcHliNVo2R0ZX?=
 =?utf-8?B?QUdzanNSd2xJUEl6VG9KZjFPMEc3ZE9WcTQ5WVBwYS85ZThsLzFsa2xXZVhP?=
 =?utf-8?B?RFZwZU5nZHhsSWlNL0JtYUJvMEh4Z3hoY0dTcEdZODNzUDk5STBrbFFSRnFS?=
 =?utf-8?B?YVlqREZOaEtOQWd4NTMvWFBVRzRJTnVSbDRYTk44MXhvdVRJejR6Wnp4dnFC?=
 =?utf-8?B?RmtDMXRqYmRGR3R2cldtL2J3dC9McTZwait3dHRuMEE2dUZuMUV5a2ZPMnl0?=
 =?utf-8?B?dGM3L3ZQTDhhZm9hODlEb01CbkFzMmxTbC9idE9uMjJ1ZUp2MVdhY3JuM3BT?=
 =?utf-8?B?TGRpcTVkTlZDM3VzVXUvSHhNbE9lWUg3aWFMc0ZwUTVZTTRhcHloRTlOWXBT?=
 =?utf-8?B?REt0YmFkQ1dvR3Bva1ZMY21odDhKb0J6ZzVsUUhIQno0Q1NKVnhXYVZMa0dD?=
 =?utf-8?B?NytIa3M2UGRSNUMyc2VoR0NKOGxyVXI3Z05Ec3pUeWZ2L0NQUHEySEJldVNU?=
 =?utf-8?B?UThHSzJCTGlEaVlDUEp2QXEwTFFDc0JDWHFneFRHNFJZL24xQlJwSDFlOXBz?=
 =?utf-8?B?LzZlaE93anpTWHBtbzBBOTVXWVVoZENqdzZhWVY3NTdNU3JVblBsTEVkTkJ1?=
 =?utf-8?B?bGdnbzhDTkwvbjhqbzB6YmlDRno1YlcrS2ZhdS80dEtMSW0zZmM1c2NybHdX?=
 =?utf-8?B?MDhZTnp5alRMSnFEUlA4S3Rxd1NrSEVRVWxBTkxPSWVwVFBKN1JYQk5BbC9T?=
 =?utf-8?B?WmxQS1VCYmRYVWs0dm1oTXF4WXgzM09mLytSbk0zMVFJWFdNZ1VRVE1GMWpZ?=
 =?utf-8?B?VDBQVmRLN0d2Wk8wUUpVaHA1T01xS0ZDTGZ5d2hCRW13dm1QOFJ6dHI1QjNm?=
 =?utf-8?B?UVNZem9zSlhIMXY3Si9jMEZRbVdhcFBPblJWVjdwaFZ3eVJ0WkkrdUE2OGla?=
 =?utf-8?B?N1kyVUVvNDVxYWZ1dnloT1YwTXZONkZJcHBCUVVQUmdhSEtpTEplR0U0Qmpn?=
 =?utf-8?B?eXdBYjJkZzhxMitxanV2MG9idmRCUWJRMTdKTGVIMmJXcVpBanZYQ3RMNkVn?=
 =?utf-8?Q?IOtOyJxiSvan9SYT33OfYiS4ZksIn3PqkdBEV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24af5504-41ac-47ac-73df-08dec0917683
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:26:52.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsO44rRHc2QO5mbK9lxHPjzBRHZ4Fhj9zNrxEzshx/c6Kvyu28V7U5FSou2dwB2Ksj6TS9fOtYqp9Mn9XwpSuRJe1zvIFrMo8aU8IHR+rKM41k5w6p0kCqS3hIGHuadB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11849

On 6/1/2026 11:55 PM, Frank Li wrote:
> On Fri, May 29, 2026 at 09:34:36AM +0200, Khristine Andreea Barbulescu wrote:
>> Add PWM0 and PWM1 for S32G2 and S32G3 SoCs
>>
>> Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
> 
> Please rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64
> 
> Frank
> 
>>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
>>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
>>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>>  3 files changed, 133 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index 51d00dac12de..907cf74e61f3 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -3,7 +3,7 @@
>>   * NXP S32G2 SoC family
>>   *
>>   * Copyright (c) 2021 SUSE LLC
>> - * Copyright 2017-2021, 2024-2025 NXP
>> + * Copyright 2017-2021, 2024-2026 NXP
>>   */
>>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>>  			status = "disabled";
>>  		};
>>
>> +		pwm0: pwm@401f4000 {
>> +			compatible = "nxp,s32g2-ftm-pwm";
>> +			reg = <0x401f4000 0x1000>;
>> +			#pwm-cells = <3>;
>> +			clocks = <&clks 5>,
>> +				 <&clks 6>,
>> +				 <&clks 5>,
>> +				 <&clks 5>;
>> +			clock-names = "ftm_sys", "ftm_ext",
>> +				      "ftm_fix", "ftm_cnt_clk_en";
>> +			status = "disabled";
>> +		};
>> +
>>  		swt4: watchdog@40200000 {
>>  			compatible = "nxp,s32g2-swt";
>>  			reg = <0x40200000 0x1000>;
>> @@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
>>  			status = "disabled";
>>  		};
>>
>> +		pwm1: pwm@402e4000 {
>> +			compatible = "nxp,s32g2-ftm-pwm";
>> +			reg = <0x402e4000 0x1000>;
>> +			#pwm-cells = <3>;
>> +			clocks = <&clks 7>,
>> +				 <&clks 8>,
>> +				 <&clks 7>,
>> +				 <&clks 7>;
>> +			clock-names = "ftm_sys", "ftm_ext",
>> +				      "ftm_fix", "ftm_cnt_clk_en";
>> +			status = "disabled";
>> +		};
>> +
>>  		usdhc0: mmc@402f0000 {
>>  			compatible = "nxp,s32g2-usdhc";
>>  			reg = <0x402f0000 0x1000>;
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> index e314f3c7d61d..a4a9e21d1361 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>>  /*
>> - * Copyright 2021-2025 NXP
>> + * Copyright 2021-2026 NXP
>>   *
>>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
>> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>>  			status = "disabled";
>>  		};
>>
>> +		pwm0: pwm@401f4000 {
>> +			compatible = "nxp,s32g3-ftm-pwm",
>> +				     "nxp,s32g2-ftm-pwm";
>> +			reg = <0x401f4000 0x1000>;
>> +			#pwm-cells = <3>;
>> +			clocks = <&clks 5>,
>> +				 <&clks 6>,
>> +				 <&clks 5>,
>> +				 <&clks 5>;
>> +			clock-names = "ftm_sys", "ftm_ext",
>> +				      "ftm_fix", "ftm_cnt_clk_en";
>> +			status = "disabled";
>> +		};
>> +
>>  		swt4: watchdog@40200000 {
>>  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
>>  			reg = <0x40200000 0x1000>;
>> @@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
>>  			status = "disabled";
>>  		};
>>
>> +		pwm1: pwm@402e4000 {
>> +			compatible = "nxp,s32g3-ftm-pwm",
>> +				     "nxp,s32g2-ftm-pwm";
>> +			reg = <0x402e4000 0x1000>;
>> +			#pwm-cells = <3>;
>> +			clocks = <&clks 7>,
>> +				 <&clks 8>,
>> +				 <&clks 7>,
>> +				 <&clks 7>;
>> +			clock-names = "ftm_sys", "ftm_ext",
>> +				      "ftm_fix", "ftm_cnt_clk_en";
>> +			status = "disabled";
>> +		};
>> +
>>  		usdhc0: mmc@402f0000 {
>>  			compatible = "nxp,s32g3-usdhc",
>>  				     "nxp,s32g2-usdhc";
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> index 803ff4531077..be7b645afa2d 100644
>> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>>  /*
>> - * Copyright 2024 NXP
>> + * Copyright 2024, 2026 NXP
>>   *
>>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> @@ -245,6 +245,70 @@ dspi5-grp4 {
>>  			bias-pull-up;
>>  		};
>>  	};
>> +
>> +	ftm0_pins: ftm0-pins {
>> +		ftm0-grp0 {
>> +			pinmux = <0x2912>;
>> +		};
>> +
>> +		ftm0-grp1 {
>> +			pinmux = <0x122>,
>> +				 <0xb42>;
>> +			output-enable;
>> +			input-enable;
>> +		};
>> +
>> +		ftm0-grp2 {
>> +			pinmux = <0xb13>,
>> +				 <0xb53>;
>> +			output-enable;
>> +			input-enable;
>> +		};
>> +
>> +		ftm0-grp3 {
>> +			pinmux = <0x2904>;
>> +		};
>> +
>> +		ftm0-grp4 {
>> +			pinmux = <0x2925>;
>> +		};
>> +
>> +		ftm0-grp5 {
>> +			pinmux = <0x2936>;
>> +		};
>> +	};
>> +
>> +	ftm1_pins: ftm1-pins {
>> +		ftm1-grp0 {
>> +			pinmux = <0x1d3>;
>> +			output-enable;
>> +			input-enable;
>> +		};
>> +
>> +		ftm1-grp1 {
>> +			pinmux = <0x29b4>;
>> +		};
>> +
>> +		ftm1-grp2 {
>> +			pinmux = <0x29c3>;
>> +		};
>> +
>> +		ftm1-grp3 {
>> +			pinmux = <0x1f4>;
>> +			output-enable;
>> +			input-enable;
>> +		};
>> +
>> +		ftm1-grp4 {
>> +			pinmux = <0x202>;
>> +			output-enable;
>> +			input-enable;
>> +		};
>> +
>> +		ftm1-grp5 {
>> +			pinmux = <0x29d2>;
>> +		};
>> +	};
>>  };
>>
>>  &can0 {
>> @@ -293,6 +357,18 @@ &i2c4 {
>>  	status = "okay";
>>  };
>>
>> +&pwm0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&ftm0_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&pwm1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&ftm1_pins>;
>> +	status = "okay";
>> +};
>> +
>>  &spi1 {
>>  	pinctrl-0 = <&dspi1_pins>;
>>  	pinctrl-names = "default";
>> --
>> 2.34.1
>>

Hello Frank,

Rebased the patch and sent it again.
Thanks!

Best regards,
Khristine
