Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA5B376BD7
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833771; cv=fail; b=TDZ+Aw4FoAwG79/D79/blc/NcrC9nksmjtXogfmhq4TlshiapK3AvoY4cHX6rJTmGr8XY+Bt8Rrcn4bWAXVhgmaf39bZHVS1QiSv7AlvcVxHgnMIpxjU8ZhgjzUPfPB7z7gJ6Xgyv2HZ/HjRJ7pQp9C3S0HJHi8iH6uA4R7xpLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833771; c=relaxed/simple;
	bh=u5Hr//5sKkbtx5os7a2OWYrOER0MIqwmLWef/UdC9Io=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nlGJuiM/8KfEXT3Gn0YZfGXMtag5B5BlrRM1lWtmy46y4QzSlHNpy26G+RMWI0ualb0TmlUJm+7MKKVVeFZTwgqFciyVTkSnVfPYl6TTHxIMTKzSdpX4PQHXZkySnOlCijeJ9JQghvmiX9AdtgL5/eFYyTnX6P94yHQPkI5l8aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z5oxFrWQ; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z5oxFrWQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T92qZYpGmmFPF/D5WDooXZY2A8stn9JF7eyiAFr9hhSCFgAl1PIQJ8YGIsY3nvlRHY4WWLfeafAB/7w6b7w6pdWxK2xWJ8pBJRhz+nDGuL/p7/lNspcptlIxYFjw4DzFvxqHfHKLHWMEIsdNVJ7KbvUpaVFDBt8zhIjoKCDfA5kfMHNSvmqWkXC3IpisGYV7DgOptMHt9uq4Hx6Warq5JcPI6hX92C+jkDknxhW4BhdKbs5B3FEsoRNf8fXH855tYMa/R733wywx/e2tyca5xTpAVhnNWgTIg30G7i86szhucz7tUBR0Ha3uEyyFoCV2zZvVn/un2DieQW1KsEODdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yARzjADAS2M4A2ZKZyEkUU0T+Y3FH7WW6uxv5iT1+KE=;
 b=HM9Nv45F9hQBLLgcVZb+noTEjTrhSlxE+90Jz9H0HzTeZdZwWv5brkauy6/49vuUHyyg4zQEvxBK65eLjx4GfiVonzID/lmeFOtVj59DZkPv/6H11CXinB2IeHT6kq8jckAKfQ9AGeVLL9ktot1kxFQ06DQJ4pC9ept9UCmpivXeTG4YBbTi/06JoWasUcjpwBjTSrJxQPFEWfgH/zjxpBuxFWGelEuUAYuNLCD3lnpBW4OhKOoIGNdmplXaUBXZ40hqOYpxHDtryka6Oy88k/ioIcn0cFTGzH0hwCGGuHlim5uvmcRGEcUWcVz40UISR+MXF62dLWblSv1myqIGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yARzjADAS2M4A2ZKZyEkUU0T+Y3FH7WW6uxv5iT1+KE=;
 b=Z5oxFrWQQ5LCcNuUZ48bw6d+F2ylMVq0fYDIVpLeXoHJ3ji05wokORgCjekmVS6e/+5syM97CA9pMf7HZKZBsi0N5hSk0ZmZyagYjThKsJ7Ji+vyS2VhCAgF1Nw2X71wsOLGs2LO5qRO/fRQ3eAwsPEqoD14IXUKTNFYsac9IEPBSLZwvIrCDL1KRDwLRduw0AgtE+9vMXSRuLEWcZmblHOkkoCqu8HcQu8kggM+fhXkpNPZd6cSAemaYWEutmP5p/yJmfPBTG/RChSYB7HVWzPlr0UQv1d2nHt1uYsCpFl260f9m1dibRruTzTC21wqAQD5QREx3UViGV97HxeSng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:36:06 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Wed, 18 Mar 2026
 11:36:06 +0000
Message-ID: <04275f85-c993-4e38-8964-ac79e10bb0b2@oss.nxp.com>
Date: Wed, 18 Mar 2026 13:39:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini:
 Add WLAN/BT overlay
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
 <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
 <5087680.31r3eYUQgx@steina-w>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <5087680.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f860186-4585-4fd6-1d4a-08de84e28acf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|7416014|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CuW5Rp0kxafFd83wcQRksTVd7Tx60e+aWG5dRMe7sFTpgTxgG9TX1hciA319yOJeewZHV9u7HxUpI/8mD36KEycW5wbpCiMEoOkxcpPEkdRx00s06zrQWsIWYA6FBR71GVqNC5AfZkO6kTPWItXjDpUKYtDXP9pce/aiQfWjZDGnMifHyRiZ5LQjbm//6/yeqVNOKiytQ5N0XRiJegd0KOhKyjdVSDXzpH4w5VRDNxf0xiGkP6FMwQNhTSSq+drAUOHV8sVRHL1sKZN20QVW5kySPXsMRHQvy04uKgZns6yW1K8rv5b+a7Edsm/Pyioi0Mo90wd17/f/BQQDgaKKCn+80xjK80Clml3xdz4zNfQJveyAZvPwmnbYx0O3+fmA46lFiMny7Kt8VBel2TavFqUjBKTa89xRVaSkh2oS9lBjfrpXMZ7Kb6Z1O+jQU1CBUMPFaSvcqT+UqxJhZmXKyp3OY1qj2JshZl0Y4tXEf2094439jLGRvdHq3GuRb8QIw9cb1KCnRUvMN1V4ejE/b1m2+ofqq+rAdahCZuvTkuf39liYiLkFrdsYsmyYQQOdYAnIRK1JtGpT18VzPRfZiWwAiGms7k8Kezp8t3upfNK+NsyTaCECzsU50F5xDpdskbUoLzmkLgDPg5dZnSBnFKbMjDGX3HI4kZS55MhG+T/iChbWW6uE+B4+GuiiSeVIdu6mgbadyLyvWqVibP3xwUt/kBNCbwOZkU6EpoyXDUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2pWbUxGN3BsaHFJdmxvU2pjVTI5UVYvbmRJb2EwSjdSdzlhUTlkcUNQcjdu?=
 =?utf-8?B?eWxoQUw0RzlIOGo2QUM5UWtnZlUydWhqeXpXajc4V1ZxcmlRbW5udkR6eFAw?=
 =?utf-8?B?MU1NbEV4OGxxUExja3lpVFVBVmwyQnRidGZVY1lHc2VFcG9MWld1aURpOWhO?=
 =?utf-8?B?RElQVE5LL1dwd09raFBCOHR4UlJMeWJtN1BIOUR3YmdtVDZibm5wMXptWldz?=
 =?utf-8?B?d3lVdU45VzRobDlMUmN1ZTFIekljcVRSdjFpd3NHdHdBM0tVb3VkZ2dURGh4?=
 =?utf-8?B?SVZOc2ZCNldtQ3NlRHdLWFl2R2ZqQVM4TGRwUk9Mc0JzSE5JbisrejNmbWov?=
 =?utf-8?B?MkxzYVZ3TGRyWU5EOUNQTlRDeFA5bFRpenpUQ0YwTEJwaUlHcHBQMnp1L3l1?=
 =?utf-8?B?NURtemFZOUpQVnVVaktFajM4Y0VhYkd0dmQ4aVdEbHZXUWh0WERYdjBiTVZw?=
 =?utf-8?B?b2VnTXFVeVpuRys5SnRRMkNGU3h1cTR4U1hhb0VvS3I2UlNKQVZwTGd5RjRq?=
 =?utf-8?B?QldFeDl5MUpCVHhmck54YXVJcDJuODlEN1pxZXhXSUhJV25CTmpVL1pXb3cy?=
 =?utf-8?B?N2JSdi81djV6Zm84RmUyaG9jUkVxVE85T0xWbDNtMGNld0NUTDYzcU9NdWdw?=
 =?utf-8?B?V2w5TWRkMU9EZ1JSaDl3b0dkdWlyU3IzekZ1YXVFQ2JFSXJzNGdvUDdZVjJs?=
 =?utf-8?B?ZkNtZm1zYmZxYmRiZy9vTVh2VDdMbnNYVUhqWFhTS3JEYUt2cnh5dVRLelE4?=
 =?utf-8?B?Vzg0TEJ5clBoWCs5ckx5cFVIUjdLZG9ieHdSR01oOEFEazg3TU5WNFp4RUYr?=
 =?utf-8?B?T2pRTzl3V1VrUkhLSEt2V29iRy81a01La0xLUmw3M3BMMGllYzJITzZKYjhl?=
 =?utf-8?B?NmhUTDdOZkVnWHJ6VVhaNlFaZkRtZXdvTy85c2JMWVI5dTR1WGE2SjZSbkVu?=
 =?utf-8?B?LzlpWG8yaC9XNkp0R3BaMHdOQTZidVQ4SmtvSytobTBDcFppaDF3RE0rVUdF?=
 =?utf-8?B?UVlIa1YzaHZUeHlic2QvNExiNzIxODNwU2hSdXk1TktoT29LLzhPNm0xdDY4?=
 =?utf-8?B?dlZEMlVqT2JtTHkvdWFQUWVMUTQzYnduWENDUENRblQwV3FxR2ZQUTZVclJx?=
 =?utf-8?B?V1poZkJ5RUJDL0tRU29XZ1VDczFOa1BmaFBPWk9yTWxqQjVjWVpkT0orK1d5?=
 =?utf-8?B?YlM5VWg0OGFPUGdUSG1IejF3QXV6R1hRMnYwTVUrSzlQNFU3L0syTGJENzh4?=
 =?utf-8?B?MlJGeWUyZUU3TVEra0Z0OW1zdjRJdFpEVGpvbWpHQ2hTRnNJcVo5ZkFqVHFK?=
 =?utf-8?B?NWNGdDlySVFhNkRUZjR3SHVVQk14Smo0MmsybVJiWHZOcW1iQ09sTDdkaVdt?=
 =?utf-8?B?cFN3TlMrOWxoVlFSK0l5MjFpcG5jZklmbkFtUjVpaDhRVXhZSWxZcW9aMGg0?=
 =?utf-8?B?SXJaRi9NYk5vK3YwN2pWOUJCYlcvOU10c2hWOGhRTlM3em9rYzNvRm4xWk1E?=
 =?utf-8?B?OUZTLzVIaGcyaFVLdzZmK1VoTktBMW8yU0VBNFNhTkhMS09nUWJ2c0paRnhs?=
 =?utf-8?B?T1c3WlcrdXlnb2g5clF4TmFOT28rVDB1MElHRVRTdDNRUDVIZ2liS1JyOWJN?=
 =?utf-8?B?QXFKcDR0eDZ6WTJxWFRJZ1dpTllpK1pjdklQSlJITFdpT0U3alNnWjlxQXF6?=
 =?utf-8?B?WksxbE50eXRHZUdsUzY1UGlndVBWVUJ4aElhbHNwVVdoT3FMS2daZ2daVTNW?=
 =?utf-8?B?R28wVHd0a3lKNWx5VW8vWUxZcnJab3FoN1JhS2lzSGdxa0pRUDhPbDZ1WHJ6?=
 =?utf-8?B?Slp1RExRdHM1T1pxamU1ZW5lcDVCb0R6Q1M5elVReXZTREdLRkc5aEwvckZ1?=
 =?utf-8?B?TDJBVW1sUVU3c0p5M29GaC9SV3Y5NldLcHRLbnpzZ3BqY2JTMm10S1pHa3JX?=
 =?utf-8?B?M0RjQlE1TnFmQmlNTzFhc21XejlCUkdDcGpNV3B6aXpWUGVtQWFMbTFXbWgz?=
 =?utf-8?B?dDlNWXFqNkhrejdBUUp4dWtscGlkWW1vRllWZnUrVWxJNy9vZ3BWeWpjQXpD?=
 =?utf-8?B?SEpiR2xOQTEyU3FscGRmWU90cmVFNEJMSkJ5Y1ZvZVNQblJUYXl3aWdRNGs1?=
 =?utf-8?B?emorRjJUajJvaHdnZG1LSEVZVE5ZeTArWTJjeCtwcnZJMyt0TDFtQ01qSWE3?=
 =?utf-8?B?ZnNIb2RmQ3FTOUpLU0JwY25aSmN3Y0RENzI1anlVMUsrUk1zalhxSlFxL2lY?=
 =?utf-8?B?ejRQMHJvRzdXa0xBc0xpVGNJTVQwMnZBTmgyL2dXL282OFJLMHdzdG0zZDU2?=
 =?utf-8?B?UjM4dFZlZS9LWkpxRHpkS1hXbmtrNUVtazMvY0p5NmlxTDc2WkdjZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f860186-4585-4fd6-1d4a-08de84e28acf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:36:06.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdmzL8r+WfYpkbDfYj2CSMDK9BrOOKqyEFPCkwW6EKQjjou/zbabj5fB9XwU8zxCxvZ5fe0DlT9uP0jbfNZY/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343

On 3/17/26 17:50, Alexander Stein wrote:
> Am Dienstag, 17. März 2026, 14:09:42 CET schrieb Daniel Baluta:
>> On 3/17/26 13:17, Alexander Stein wrote:
>>> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
>>>
>>> This overlay enables the LWB5+ M.2 wlan module from ezurio.
>>>
>>> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> I was expecting this patch to be in line with this comment:
>>
>> /*
>>  * Display is not fixed, so compatible has to be added from
>>  * DT overlay
>>  */
> Well, the DT overlay from this patch is only about the WiFi and
> Bluetooth module. Display overlay is a different one, yet to be
> included as this depends on [1]. I need to respin this after
> imx91/imx93 pdfc patch is included.
>
> But if it is preferred to not include backlight/display until the
> display overlay is available, I'm fine with that as well.

To avoid confusion until there is a user for this you should keep it out.


