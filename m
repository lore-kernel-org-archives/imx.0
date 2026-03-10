Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE53314D0D
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156086; cv=fail; b=haveaF2AOK91UBNo+6F8eWFrAyUN3TQKv1T2KYe9DhEnepiJnzlChrK8P2BFkQ7HMxjlTRUdrfMSNKVJ+APYmxgDinlBfjeg5YBXV/ZYVadNthAerz17b/GIn4KjDGD4p2GMjDHbKqqRax52+ROowyeouGked2/zLtO3MKMTpsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156086; c=relaxed/simple;
	bh=4SRiPeji3TT/2nNnGQhnNXMjSnzOB+edxa2Y0pb4ZMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uRl/rLqYhS1atkjHGiNDUZVqbnM3O3zur/zGp7nzDmtQiaqW8SPqAXBjRj+MKFEedBujPJq/xyRE0hADmp8vbcBSlmfKpkL0wQi8tpwITX9XUv1ZqNddRIZ2F3IZ9rJ/zdCWUGdzVIrF4Uff72SPj+quBf6b4N1TCxbkauQYFug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kX2YoASG; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kX2YoASG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDOzNie4Xmr/lBFOXX8Gw0WA8airqU0iN5kWypdbbzOIEuiNx4mD20GrxdWlIMDg7sO+rhVeA1vE22uuUPeoGCjeB/Vz0p4gaq4ENESlwEO0ur+Chjxn+X/w5kO+/Tb9aJIFRYSVnUZNtfKZbAfZQPJFSqITXIdc+aTGFYLSk5w722T82mPjZUvHZHl/BZoh76ukEpuNKS6TOtrsf9ouD3wyVRbppZp5M9O8cN9gVRbbtSSOlunMznSsaPcvGBCF3KTtkL4nFOr5mHCHPkYTHk7yukErZr6igGO9oocU/NSepbqFnKpD5c+b1djW0aFPfYNoV0x9qwbORtqjq13TIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXL9+mH/ViMfQZhSlcUyVhb6ncpym02ChZcp0oI6mbA=;
 b=KWnBIw83ZGdQifWbMw+a0P+DpxhHluLOZ3rclfu0FgVaS9eJPaiuSwhY9F2q6/ZqEaHwo8Pi5ktTASWI3vKleERkAXWI0p0L+qC8OTIvfOIbLxPc15owMuONf5H2kd974jq/gvRQCKnMVPGH+HEPm36MZqpkhQK9EOb9LdZ7R5hlltojwNnJopMxGNTBcqBr1a/WjJdta3nz59eOT2Hmk+LFOGC94OOX6o3jvMnMVFvAxOxWF8Ue0uWMxUlLCIYS+Olhb9v8+xlWGNcRfRPBKcxzu12h4+I3dyH5hgnrOg/j9ffA6+7+xz02pL6a9VLXgaoqlPIOS5+M3j3Vx8RvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXL9+mH/ViMfQZhSlcUyVhb6ncpym02ChZcp0oI6mbA=;
 b=kX2YoASGbJiZDI3aeiQxeGpMwAj/V9ZchV04eJH1gN7iN7spHCcA8XcmtbDGRfEZtaG1Hzxd6OJoNTM/wKbeh2PEa/V/fRE7ayABJE9iBLIrrDsK4Up6UeHwqLTUUaAN3eBNsbDE0VcGBkOQHtOXnhGydEPCPwBZBiqXJZgRl2WTjgC9RQ4h2QNge68/5KAF7X4OIqzE+rqmFmRXJc/OHyO1727i/rjGbFdreRfkX0NXlxfTD85jlq+3aBwYBNOLiSjNuevPuhn54A72rjp6yYDtGA3dtiaupcENgJ73KTpAIcvQWeB75OfCUmyewyhTMnx1Fkx6hlCiaiIZvXa1cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9)
 by VI0PR04MB10162.eurprd04.prod.outlook.com (2603:10a6:800:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 15:21:20 +0000
Received: from PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82]) by PAXPR04MB9154.eurprd04.prod.outlook.com
 ([fe80::b0a5:fb7f:4353:6a82%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 15:21:20 +0000
Message-ID: <d5bb01c1-17c9-4d76-8a49-00ffd85c7580@oss.nxp.com>
Date: Tue, 10 Mar 2026 17:21:15 +0200
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
 <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
 <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
Content-Language: en-US
From: Andrei Botila <andrei.botila@oss.nxp.com>
In-Reply-To: <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::25) To PAXPR04MB9154.eurprd04.prod.outlook.com
 (2603:10a6:102:22d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9154:EE_|VI0PR04MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e6b3ae-0c1f-4f07-ee3d-08de7eb8ae6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bZqRJWDiCiUnpH4Z7qIQE3o/FkzM0hiLat1HSQU81ktGEvKhV4wMKfQbCK8Cl1pczIZGHic1UiT9xTs6lpaY01S+cbCKQPAzo1pmtMd/dPiGXjoJzfaHD5b02mTqQYmDtbC19esQcalz7q9PoR5uWiWxsgB0rbswWEoElHUJ6mWTjS/X9uiVKI/RTElYcU/HtJX73RuBk+485L79SnxZVW9tErBG76TlCfvYZkBTGYYW232z1kobNPHUN9nSXsxIYAXsVHJgXq7wKCRrdBUBao5VuUHp4rdfOiOhwrMS0RhaLY8f+2SgSUjeAvKB2/34ICIJ7vUo9tKJsBSuMXaukuw1+zXJRxLsmYbI5BpWgy6v4/C6ouFd5GWHXYNTehE2ZvRDM6fTA3cD7Vs4GlTB3bSPwUvjIUKajyAX/liC0mx2nmLfMjqwBLg+KjCuZSD1xzVd4dWGbzYoWx2XRZITcusCUmpI1Eik1rmBDy8qvf5JZ1wFsg8Ic0/DQRnhQWFJcOxHQrNHoWWyhc1w0TXCaRIlNXpROfDxPiSmWozNd9MSCJ1pgRLoTK8i4il1rSwK06YK1s6tP0OYf1IGmTbJrHQlmpKRPcJKzFRBxaTdV44TNYtSJnnP9dwx4ZKftdanlakBzcKc/7Mi4+kcfBgKrpIRKtyoglXehfe8IJd4my4FcvBM4WhtNI/3rzLKtf1gxeLp+fyrqXINCS4SvZzFemTIsel8xEz/I4J7eIpzmGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9154.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXRhWnpxYTcxVExkaUNTQVNQT3lWbDF2dnVEVnFQNldtTWV3UUY2YURoekpN?=
 =?utf-8?B?ekxnUGp1d2pZb2ZjRnZFY3hCelFTdUYrMWRBcU5NZnNhQkdkTFRVdDN1UVZp?=
 =?utf-8?B?SlkxRDJNSmZhQ2NmU3ozN0o1NFJVYjZGZFpRNDFKbFhxeExBUG04TVpJbm1V?=
 =?utf-8?B?NllxZDZ0WEN1NHJJZUtQd0VIZ2p4bEs2eWJVaGp0ckxub3MrM0VWZFJXSzdr?=
 =?utf-8?B?b2hTOEw3U3prMFBWYTlSTVFHdDN1ZDRkZk81SnVDOWFvcExuMWVZZ2xRNjZP?=
 =?utf-8?B?UVk3bG1NNDlGWjY5d0hLUHdhaGk3SXdnVFhwQytiOVpETm5BRnhJcnNYY3hv?=
 =?utf-8?B?VXhKc1hpSDNSOWUwMDlySU5NZ3Z4eE1BMFQwejRzYTdjam1LdVFRZ0lxb2V6?=
 =?utf-8?B?c2plaUtTajl3THVyWkVSZzVJamQ3VGJDUXNDYWUwMTZveVR2ejErV0IxaFFi?=
 =?utf-8?B?TkN4V2Rya096dG4yeEFlemFsSHQyL3pId3Nya3ZIQXhqTmpFT3c3S2ErbEpl?=
 =?utf-8?B?NStmdTZhL3FNZ0lDYXprTHY0djFQUlFHVWpCUDlsUEZlekZkQkU5UzN6ZGtt?=
 =?utf-8?B?WmpHdnJaRm1pKytNTGFnSDgrdnNsZy9yNzQyM0ZJcFdKVTZUUDFRTytQY25N?=
 =?utf-8?B?bTNrdXhLUlNTRW9OQzZYekhDT1Y4R2dMQjdiejA3VzY0R0dsWktxVnVDRjVm?=
 =?utf-8?B?c2VIaWhiZXV1SGlTWGRsREZhV2tVNU8xRkVOdW4zbHA3QVVSNnZqTm9rZndY?=
 =?utf-8?B?eGo4dE5WZ2xlRENpVE5IUzQ4VVQxMHBxRlQrR29GeklFaFRNMlZDWERGUmlE?=
 =?utf-8?B?a29BUDhOd3BLc01UUFFCMEJ2R2hDQ1hYWC94dlZ0aEhremhmUnFIU2RkaEJp?=
 =?utf-8?B?RmRrNS9kV0ZyUVlya0ZRbXpiV2lmK2ErU09oRmpZWlZybU50MDZpRC94Tmlx?=
 =?utf-8?B?T0IzK3k2VmRxOFJjZG1CdUZxcitBVmloTnVVTjZyTkRjS3F3d1ExQ3h1dXZp?=
 =?utf-8?B?SmE4K0tSdDNyYWlocDJUWUJ2cDVHUGRYRDVWNkdpemd4akxlL2M3OEJtVUND?=
 =?utf-8?B?aldEaDVwZndBV1c0c011NlVwNUMxd0R3Rkgxb3NaMkFNdVlQSFBwR1BQa3dU?=
 =?utf-8?B?TS82T1loODJzOFk1U042NkhZL1I3ZFNRUWVETlJlc3ZGNGZlT1lUTmRSZHUx?=
 =?utf-8?B?VkdlQnZEMjVUY00wdS9VZDVFWW02L1lDSTU4QTlnSWF4dEVKeTkvR2FmdzhZ?=
 =?utf-8?B?UUF0cU9UMDBmbkQzeVJRWHpQaWthcFpqVFhza1FYdkhBVFZxRXQzNGsxU2da?=
 =?utf-8?B?QlM2eEgrejFUbzdPWko1eWFkTGVCZGpBdDRYQVJpdkVhSEE1Z3NsSkx5cFBS?=
 =?utf-8?B?V0NFZG5xclBoM1JEVDFJckQza0VPcUx2dncwWWJKNityTlZ6OElmSnpyT01l?=
 =?utf-8?B?OEgvazdFS2JydEYwTXRNSzdVOTNPUWVha1hVSzViUDg1Mnk5anJOQ1lSYkxE?=
 =?utf-8?B?YnJHVmpCNHNqb2VySDRiSTZXZFZUNE9zMnVaNGo2NUxUdmh4NWhVbmhUVGZ0?=
 =?utf-8?B?TzdKRmF5Z2hYaWZBSjltY1lpd0JTb2VibXJmN1BFZkpiSVd4aFVsUFAwWXVB?=
 =?utf-8?B?UDAyT3VXelc2aHBOTVNoUTlTRmIxRFBTRmhIQWxoMGowWlJDbjBwSWlNNmJ2?=
 =?utf-8?B?c2ZpamRvQ1lCSHN0eERzZVZDUkNteFFPVW9HSlJvK2l4UXVRanhkTmVzYmtX?=
 =?utf-8?B?eitndjVrck96eTlqSzJpOGRnQnZTdEthZmpQTUI1TUVxOEdCaUt0T21YeTFE?=
 =?utf-8?B?M0RjT1FyMUFWdldSeUJpUDVETnE3dUU3WDZRcGpOTlZyd3VJcEhxSnNUUE10?=
 =?utf-8?B?UHJLWWRkSVBlVmo5L1BzbFlacjJoSVppaHhYZWFJdEZLeUhDUFZTaXE1UXh5?=
 =?utf-8?B?dWdBVGJGc3BibWdkSUFsaUZ5NElpV2hIQlh6S3EyWUtqUlJKd3VTbVlmdkFl?=
 =?utf-8?B?MC9xcFg3VG0zZ0NaS3R0a2pxWEExaUczaTh0akdtd1BhUHcyQXJqckhNZDZ6?=
 =?utf-8?B?TUNnRGM1NDBERU11M1ZXVG9GeFhmYW1iSjRYNWFqMkt4TUF5VVgrRXl5RUVu?=
 =?utf-8?B?bXJQVDJMVVhyN2U4K3VGNzZsdno5VzFQODdPUW5GeFJjYUNDeDFrSFk1U1ZW?=
 =?utf-8?B?UUc5OE11a1BiVi9nd1JySFhwUHUvTFBwMi9LSGtCUDlkRjVQb2lKN3pjUFpT?=
 =?utf-8?B?czJZbXNpcUlLRXgrTDlmSEorNzZGVE1xUHg5Y1BzQUh4cEtCN3FTOS9tV1BO?=
 =?utf-8?B?OUFxMGs0ai83enhWUmVseEVsM0V1Y3RsY25JOXFMVnJoMTlpeFRxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e6b3ae-0c1f-4f07-ee3d-08de7eb8ae6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9154.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:21:20.1742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLxABtb7lHxHHsYI07yW1zuqYShac0LaUGrQW1oKDHc+cbQ2V0D2Zyar0AFUmMPs/r/ZEOaAhSmDoa4nXafoFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10162

On 3/10/2026 4:02 PM, Fabio Estevam wrote:
> On Tue, Mar 10, 2026 at 10:50 AM Andrei Botila
> <andrei.botila@oss.nxp.com> wrote:
> 
>> Regarding the I2C RTC(PCA85073A) commands like hwclock or rtcwake use by
>> default /dev/rtc, /dev/rtc0 so they will try to use PCA and fail.
> 
> These commands should not fail.

rtcwake -s 10 -m mem

rtcwake: cannot open /sys/class/rtc/rtc0/device/power/wakeup: No such file or directory
rtcwake: /dev/rtc0 not enabled for wakeup events

Through this patch what I am trying to do is to get rid of the need of specifying
the rtc (-d rtcX).

> 
> date -s "2026-03-10 11:00:00"
> hwclock -w
> 
> Power-cycle the board. Does the "date" command retain the correct time?

date -> Tue Mar 10 11:12:43 UTC 2026

date -s "2026-03-10 11:00:00" -> Tue Mar 10 11:00:00 UTC 2026

hwclock -w

date -> Tue Mar 10 11:00:06 UTC 2026

<Power cycle>

hwclock -r -> 2026-03-10 11:00:31.104653+00:00

So looks like it does retain the date between power cycles.
> 
>> Also from what I could find online PCA85073A is also not battery-backed.
> 
> I haven't checked, but this looks strange. How will the board retain
> the time then, after a power cycle?

