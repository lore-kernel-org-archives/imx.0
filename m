Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661B40DFC9
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150619; cv=fail; b=XfMf6QqU5RXZfr0i8MUOSxoapVRKXOkHFXfLs4sg3Vxh7LpELgbD9n0UdHBLt28H9ZDkUmxrJmRZc0bY0QVC71X0TFrzBk33qsDEiK6eNOx+FZY1N8jw/6p3vz07J4bN8OVUEyKWqnFOB2Ts3lJipsw8z33DsYqRZUMZeA7hL8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150619; c=relaxed/simple;
	bh=lKwzcrzlWR+2MRlYbup37k8akMqmCk5JtDtV+O2aLtg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SR3981UxM7XMWX4GM908wSFylZ8tjgQZL4Srz8cevDSXsN9gBaCaVEO19lToXXs9zv458IsSzT3IcJ925pv8/oBT7L6t9jChQ9TMx79xdeqepR95MPZQ7otzm/gb7fpqrGqX41xhO4Qoq2DVWGuTqjShgfIdRLu9GIHPntLRP30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wMl3Q6pf; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wMl3Q6pf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piwTtPsfoKM94cxzJl5sj7yvR+ehews8F+dVA0kLU9IITFPKraC0ReeZqkvbqHqNo66F3KAipbDN6EYeIYh1C8vZ8DluUERz/3iVbkZk0RdlHjGKKV80iuctvyLc19dqefCnD42+zJE7bwacbKxLBFDvFOHuNmaVF1ysEoCof03QMqG9lwkJ+u7NfNQ1hbGoVT/YNVGBo5wc0ZkcYcQSEK2IXpuDIyJGjsRAT/wUkoo9VWzNiH1egxqCyWB+kl8qMzTH8Vas4cZT6GmgZKjXsdAnU+Nv5+pxf627cjl0SIPlCjJl5HlLtlg9kNXfjMyhNWB469KLHcMeucYzp13JPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNwIOPtDQ3K4e8H13UtOnAOXYZbBxfMy4251chivmuk=;
 b=VP3SDKEWf4R6+0D39lnmPY4ufTz6IJj/dFprvsi/8IVY5AE6UgP4GYJj1ec47aSb4y/gKHuviavYbHxLavxLWK7s8n+IE72syUJgUN4+C2BCh7LD48ISIKrjXZcFkW7BJOO+t8yluQ+oxxO6ntlR/LhV+mdQHk/2TbP2VC0/E8mO/9jIvItyH/84rj/VC6pEmZ2CGrcwGESDzlf0RB1XoJIlzA00P7MObIAh3XbGKPpnQppneCI9omsFPkIJUNBC14lJHkSMScNLrpVbtpltSm6Qoa0njVI5M/9eCrZ9eitumLUXUCBeXgDOo1e+onxnq13v99MWA7Ta+nftKZFWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNwIOPtDQ3K4e8H13UtOnAOXYZbBxfMy4251chivmuk=;
 b=wMl3Q6pfBTy95/hrINw02oSfROvjouNnwmheHmpqeql/BiDJ6SIXK5rWWw51PFr1aSv0S2bKKGLpLx3VWp0eMRrdlj7OiVI3FN5ER+ZDNPtNH4F0RDNCuh5ntRH/1Wf+VFQokPJNUd0xPVFB/JOqd95td/0oYvlgBCi54r8kcaR3R661iDA3o32WpJftGeAfM7h9Wznp93ISvi2stQoab3U5+bjvV9nALL1chwXDf/GiRGoJGEhrG8/yV110t6Jk591UGOLyJOqttdrfFJvDSgjbIA0x6a2bXAG+W5f2vLvmk17fxESw3xw8f1e1R+FkR/yHfMn2UUSGpmnXBHU49Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9)
 by AM7PR04MB6789.eurprd04.prod.outlook.com (2603:10a6:20b:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Tue, 10 Mar
 2026 13:50:12 +0000
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82]) by PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 13:50:12 +0000
Message-ID: <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
Date: Tue, 10 Mar 2026 15:49:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
 <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
Content-Language: en-US
From: Andrei Botila <andrei.botila@oss.nxp.com>
In-Reply-To: <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0300.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::11) To PAXPR04MB9154.eurprd04.prod.outlook.com
 (2603:10a6:102:22d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9154:EE_|AM7PR04MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcaacd8-8b74-4fc6-c738-08de7eabf39a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|22082099002;
X-Microsoft-Antispam-Message-Info:
	1PRk97QUxOCM8HQjid2t9CY6oZa9BGziG0yEakXZAzfrfd1QfMsRbkwELig22/H+2ft1gLyk751PhFu8qq2zlztySMnwusA1EDTzRtEqGh0JaTp0wiLpZgw9q75V9biyS14yVMiFuamOoagOYEsmQsExLN1i2Fm6wanE6CGLaDBlbEbTD8m0faD3wvXp2UiDHr9QP7ChRxdPflcrbAUR/XK/e2w7VsDuitVzY/3IDDe1NJF1uF69vs8mKknBhBJi6OV2KSabkqPinS8emxRfdMqphlEzgLXLqT4EfYf1J4W5xpUiH+J0a9dkEmN+bVC8xBwUsXKY+wUGWLBobhjNwA6PtRJguLaFUZqvAZitCCFN9rEVRAKNDpdfzzgCy2M/NSaZ7bJAoOeDLYI4tGj8VpA6wwg3iqeD9+O92Rwv6XW0No5sg0gZhpD44C8rZ46ZQ6fcqf178GyosQBqT9j8p55Vvwnl++E5Xi/nnZ0gzcpNDvKbw0eRwmDdLOhUz03rZ4M0d1IeFxoJaB/sT7NWkrGneUo1v6xE4GNwABPXSzHMFSY5iwskz2A1b7vgJ88iWr+1TqE9wELU2XxMAZ//RJM4wa29izE4LYzI7A3O4J59RXBk6mhmFILbqy5Ar/TWtoGyGgFgx+VQOs8PM7migI2UuPAnGJq8/C10NFcbkd6wdr0/K57ZDuRxhV3f5tLleiYshIl4oSyXpXZ+2032fGXpSX1BHOeHGomvznZYaTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9154.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm54ZERVOUp3NklNVlI1U2l0eURBMlAvenZNTUs3dnZFNXY0SHl2cGlzZExh?=
 =?utf-8?B?NGVvNldJUUlBWHM2L2NJTVpjb3pIZnNLZWM4WGppNWxXR2ZBakVsd0cyWElC?=
 =?utf-8?B?SXhicEI0MnFITnAwVEF6cE9jVjZXUkZjcHJiNW1rNUxlTG9iVXRiT05TMXhI?=
 =?utf-8?B?Tnh6Z0F5ZElJWXpCVjRTY1lSR0tRbTc4eERucDNQZ20xa0RTMzVlZ2FVc1pI?=
 =?utf-8?B?bUY3TlhSNHVUbTMyeUxhSXIvL0dETXFrbUFGWlRqOTlWa0tiWWQxdmd3MW9Y?=
 =?utf-8?B?VC85RjNIRlFXdW10WlFUcXNKdTJGSThZUGs3OGYwOGdQUi9hRnFXRTFKOU10?=
 =?utf-8?B?OHVKejI2dmJxdjFHMXpUblJUdTVTQzgybDJoNHEzTE9tZXhWNVlZMjFxTlYw?=
 =?utf-8?B?ZDF5WjJ4L2N3NDhnRExYREFMK0I0RTM4V0t2WG1oV1RpUGJ2OWxqNjJSdEwv?=
 =?utf-8?B?dldPSnV2TEFFSHhacGQ2K3ZLQWpveG5oRTJ0Ujlnb2txR1o0bXlDS1hCNTY4?=
 =?utf-8?B?K2NacU1kc2hYazRnR3phRkFtZXBmS2lDRXBQRlhORzRpTnQwUWsxb1llM1Ez?=
 =?utf-8?B?WTJkQ3EyU2VaRHg0QjRBSmNJVHNIS2w2amo3TE5Kc0dzWXkzNm9IeXI3Q3VH?=
 =?utf-8?B?Y3lraTVzKytJUFRmcENocWM1cnFXSnBBOU80YmF5eHkrc1RsNDFXMWRMZ0tR?=
 =?utf-8?B?OGFvekRsRHJoQkZVMzdxOEVta2N6WjRxTS9qM1p4Mjd6VE1LME1XQ1dJbU14?=
 =?utf-8?B?OGQrODROaG5wWUNya3dNRVdBaldHdlRWWmdtdjc0ZGl4VWw3TzR6VThiamtZ?=
 =?utf-8?B?Nkc2eVRvdmdDb1dDYldEYlF5azk4TzZwTlhjS0l5eStYd25iMjVYYU1GTGc2?=
 =?utf-8?B?aWFUMFFoNE1jVUZpdGxLUWxzK3k1TGp0RmpPQ1phQVBHSndYc2RRejQ5MmtE?=
 =?utf-8?B?U0dxcVJGOE4rWk5BWmNNb0piZGFPYTRyWVNpU3g2ZG9odDlwVkZTZ21aNGI0?=
 =?utf-8?B?ZGg5TEJaR1dsd2tDVVRGTVVYWEl5ZDhPRFZvenh0dzdYMEhFR0VkcDIxY3Rn?=
 =?utf-8?B?dGd3YUREWGRuUitzUk1QRkdxTlQzOEYzNzBCWlFZY2RXd01rOHBWZUxCZHRu?=
 =?utf-8?B?Wkt4SVRxTWJhTDM0UlUxL0QyWXRWYmFmNzBEdHpkaXgrcHRndDN5YVExMmNM?=
 =?utf-8?B?RFp1d3E4QndQT1crQS9wVUtKbmErU2YyOUc5a2NmT2pydTRKcExFU08rYUpT?=
 =?utf-8?B?MC9GRk5uTFZIUkdydjlnYzJFUjcxemdXN29BeG8zSGJ6SHZsSEdOeEhnTmF1?=
 =?utf-8?B?VTdON00xZUYvOXNkc1NibTMzaFlOSytoUTVRZnVEV0dnVWVCWXRCVW1UdDVK?=
 =?utf-8?B?ZUQwZjRlTE9EOWRjYUltTkRDdjNHMGE2eTdFaDBmZFBuRkM5YnU4Y25VUG9B?=
 =?utf-8?B?Wm1QeDdJVGU5WTR1NEVudGFoRjZyWXpTSmZubTd5M0paaDRlZ1RORE9VSHlQ?=
 =?utf-8?B?VFN0VWpUOGRYbWRTdkgrWnRUbGFiYzRxMG1CN0JVZ2N1bEdNWGZGVWsyQ1Fy?=
 =?utf-8?B?VEJZN1FOd05GQ3p0bStQSjE4UDg4NUxRWkI2L1IxT0YvRHozTW44a2QwQ0tm?=
 =?utf-8?B?UC8zeUh2U2s0RFlvLzRzVW5zcUUyc1NoQnMyY1R5ZWtEUlI4L2tkcVlQMi9Y?=
 =?utf-8?B?b29kZTUzRC9TL2tjalV3ckFLQjZsZnBvOS92T0VTU0tOWmxjKzlrZG9SbkJI?=
 =?utf-8?B?bTNDVDd4UFpEc0JTS09YUFVvdG9xV3dsemo4VXgrdUJkRFlmMGRmRzVFZWJE?=
 =?utf-8?B?SGUwZVpUemhPMm5XSW5HTWZBaVNmL3JML3FhV2E5cUpDZDR1aWRTSFJaNkR3?=
 =?utf-8?B?RkJFcmFMendKQllQd01BY1htZTQ5bXpsNzNra1BPekJ1RFRoYWh5K1g5UytO?=
 =?utf-8?B?T0t6dnRhYVNzNlhwTFhsZCtSV1JZb0RXN2ZXbjZLUFdkdkhtUHBLcTFoQlVY?=
 =?utf-8?B?WGVJZ3NBT2xHRjFxb05JNkVRQXNUL0hpbElIREpFeHk4UGkzWFo0OGVhMHJw?=
 =?utf-8?B?Y1VkZUJJZ3Z4eU0vOWRsVDVSOURaajI5UDhzTi9PbzB1WlhTakR3TDJzcHBU?=
 =?utf-8?B?Rkg4aVpJUUE3bE0yRmRYRDNTNllPaitGRmxKUmFCbEpydUxkZzlmT2wrUi91?=
 =?utf-8?B?VFE3SExwS0FhQ1NoMUREc2RKUVpIS0UvbmVvVjlzWDMycHBhWGx5OG1WMjRH?=
 =?utf-8?B?Q3NHclpHZEtYYUVaNmZmM2pObFAzNjhHdzA2ZXhxV2NURW5IVWRudEh0VFBy?=
 =?utf-8?B?ekd4aTM1VVBrdVo3VXB3SDFVZDVuYUMwd3cyR3RnQ3BtUEJOcnFkVVlHVG9S?=
 =?utf-8?Q?IwBFw/aYl5r5yA18=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcaacd8-8b74-4fc6-c738-08de7eabf39a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9154.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:50:12.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYGQ+eaVNXr7/BqHZ46lG8syk/1HN68LClVmlsI4RkJpT0SJ7/kPOcKGA99ZAMJTn4qWG1aSGA72sX9+H0iJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789

On 3/10/2026 3:14 PM, Fabio Estevam wrote:
> On Tue, Mar 10, 2026 at 9:50 AM Andrei Botila <andrei.botila@oss.nxp.com> wrote:
>>
>> S32G RTC is probed after the RTC on RDB (PCA85073A) so the S32G RTC
>> ends up on /dev/rtc1. This causes the suspend/resume or hwclock to use
>> the wrong RTC since it takes by default rtc0.
>> Force the S32G RTC to be assigned rtc0.
> 
> We usually prefer to use the I2C RTC as rtc0 because it is battery-backed.
> 
> What's the exact problem with using the I2C RTC as rtc0?
> 
> Is the S32G RTC battery-backed?

Hello,

S32G RTC is not battery-backed.

Regarding the I2C RTC(PCA85073A) commands like hwclock or rtcwake use by
default /dev/rtc, /dev/rtc0 so they will try to use PCA and fail.

Also from what I could find online PCA85073A is also not battery-backed.

Thank you,
Andrei
