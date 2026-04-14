Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA137E2E5
	for <imx@lists.linux.dev>; Tue, 14 Apr 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160413; cv=fail; b=bahSy+ei56P69CGhyKpGw4yFN1adWqzRMMjQ6FU+7KWVxzQC13k3McBe/bglXO4qmyAY0nOycaLQ52jl37RJAZgPhovXMJmYi5Mb5PSiF0ZlDfIZ71suAiO3PoOZpKlw36t457hSe4bjbeQrIvUsbOrFSgKnbQSXYOy2AMUWYPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160413; c=relaxed/simple;
	bh=B78oYFZGDvvkFIUSibMCufo58jTOUpCY+axgQr+U2A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YFWyYBnQtaStiuB0sRz0bvziM9SjhmobXvh0IL5d3tGUnKJ82NdvmkIlZoembaw5UigGhJh5FwLfU5hpgi4kzQj/BduLgBXPOkLIT+RuTFNacTVd6HfNAEo/Ev9cU3CCXk025Af6tYDrsmm/obEYbSQ6ba53m1hY+nyEkbeHN1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m4inp6OF; arc=fail smtp.client-ip=52.101.69.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m4inp6OF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2+n02OVcSKlN1IxpXtIw4OtQZiD+a8hddvXuwHl4buI+ZP3BAdBp704S/57ftjrhOaxycbR6R/YMaP5jD3pTT09yJ1isIhGX1EpY1kgRFsSF7xIDd0UbkoOzgjg4RTDVJFBdlEw9Ni4IYyMLBfcW/ykmX8U+7fwUi4Xc9jG8qouAChTklmqITdPYx7pPuF6wZGrQzDmcH4EGSFZ8NwuPikLDaATV57QTTE6jveeFQjTuZvDP6GOGFo/cdIQrRuYDfIZ2qdtBZMtKx2eEc6ho8XIvlDMNdLdItZzhwryxe8jkY1tpDNrWBKk3PN1ZzI12kdyZFcjpgf2tAkTbmTDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOyWRcMel/n+SMy1G6Z0U/5T5FcsrWLYRf3gWV6LgIM=;
 b=ezsz0VoVMu+6ei6MFxDWD90dCrT4tOsShQtreW7QujDjP/rYHLVcHJs9n7W0pyIULDo7Q93Y223qCtCd0fgD1xWmQGawZUQwYxzXx40VfM+p8Z+hFlaQrHkUlu3PPbP1wtqjcCW7Zs7+BahYaMfzYoZw3VPRRTWDDFWW+GzbWiLWCtb0Q/RbhUjKwRLgZvkmMgZigXEb6XZFF9k62OxmuBnb0mIbxQrvl8EgZJL9sj/du8QSyQel5wOnHltSa0QdExGGlLIvE3lCkorIgdIReDtzoJ7v3/zIqEG9oGqtfiZ5JFapd4XidiSbMxGj8dnBOp4z+LxanHzNhn/YUiEfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOyWRcMel/n+SMy1G6Z0U/5T5FcsrWLYRf3gWV6LgIM=;
 b=m4inp6OFVJ995N9N1sPY6u5sMiuu6LPLw4EUUaz1i66pSzXwHWTz2MRLkn8nJdCCf14hBp68gic7qSu2eFSdNN+fgMQkcQoyk6uY7Pk/CtIgPYWgtUR19xSSjIpv1MNBXbqs6pMdhuGjF22aFTJCXrvncMwqYwPoBS+ESa380ft7eUwDqfd44et7+Rx6IOB6zPOTql7RAQoZRcYw1DbT5pmwnPDzyzaOxrsAx9t00MFvSthq7uM2kZjoK1We1hxRZZmijythfqMB/+qxCX6rq9jm9Oh/sCOoVOVLykoQC0EHPNaunj9GmCOSk+Fjj1VJIWBZbKRt+a3QImDFyGgLRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 09:53:28 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 09:53:28 +0000
Date: Tue, 14 Apr 2026 17:55:32 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to
 IMX8MQ_RESET_MIPI_CSI*_RESET
Message-ID: <20260414095532.GA2624044@shlinux88>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
 <20260331101331.1405588-2-robby.cai@nxp.com>
 <d6cdea5f1a4f2eb3f7b73e6136c77020f444d8f0.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6cdea5f1a4f2eb3f7b73e6136c77020f444d8f0.camel@pengutronix.de>
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdb00c4-5c3c-422f-f5c6-08de9a0bad69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y0hRJItjpbu3apSY/eH4I9ko1zb9xoBgKRfontBoy3qyYtoKyc+EtNGJWJ4hAZTZrQTTryIpFtsqiVwQ4xYbMbeiNQVY4ZI4U5qdnsbCXZy/lPqSmIlgBjfMkzJBHG3d7VAlp8YgjfAwqT8zvlFe1XiVEGE1uS8PwtDw/a0aADWRneH5zOGZ0is021ucbKhjPuKaOb2wx+/YUQMKlNObTrbk7F8ATsprKElA4Sgdea9hdOwTe5qd6dmLNwlH/sjfh/WPrdIiW7EO0yI935yW71tYZg6cgnWX90NADQdTSi8ainlVuCSsNn6roP4ohOhjZwG90CPElHkrL68rQgh6q3l5V0xCtCKjQQiYIdqy09CMi9gf5ponYAw4KGY3svEwBtHK6Rh/+9kGqOwVlD6C/rQXyXBbL3/RiDcmvcdPWbdegU6QaThORDYuen7Q4YeTaNMTk0mMkfUrnoCHPBcQTTp4R+Qz88OjPmseSfXOts+9+XJ5+DbEx4VJodmqJswdrORgz9HcdatXa/v6M0mG2dBo7jYUU67L7LYoUmzO3hK/fG8qWQp7PL8mpbXVOXY333eXIRCJgmRDT/4Vjot7uVFY/loqWZLmjpb/ATfItvh1fE/53n2cCh++OqV0ybvSmVKeED3CXijnHfMnnDUbBrYVx1F537kW2E9tor3ECUsGXVSiSWi8xVa9ggEluacL4tXsLuCVtK/5HoikEtX9bl72W51ouasE2XFQ6+jR1o0BwP59yiOfoupQCxM/ynfLlxTQxg0k5ew+jjIg1O6FXD79osU2bt2w02ReeoYKZb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9rTEU2dG8vc0REKzliNHFVSGVKWk81SXNrSTlnWEpraCsxRmI4cFd6Rm5N?=
 =?utf-8?B?TFBnU0ZWZmhtbCtxRk54TEFaZGQ5dmpndVAzUmlxTC9yc280WHdDcjYwcVpO?=
 =?utf-8?B?cVh5T1F6V1dEN3FBbjVyZEp0R0dXUXhNRy91WUMwVmZqSU9aMm93clVIK0hK?=
 =?utf-8?B?SkFWYXI3MUZFQ1E2ZGR2TXk1bTI4UlFZSmFYRmdNd1FBblBwazBGUlpFNnlH?=
 =?utf-8?B?LzMxOUFmUUFlWnZDaFpHaXF4UzZaQVNkdlZPZVk2dThMMm82bzI5Y3VaL092?=
 =?utf-8?B?aUhKbzhXSHhETG1EU2RjcU96ZHVOZGNSMDhHWEY4YUtyYmdnb3FPZnNqRU03?=
 =?utf-8?B?ODF2akgvQWdkVElKUi83TGJqbk1wdCsweExjZWk4a2NCWENiWjBJZ0RGWUZh?=
 =?utf-8?B?bjNRQzBpYlNLL3N5dTliamlUYVFhRVRsN0o4Tlhmb1p1dVVld3k2OE11R3Vy?=
 =?utf-8?B?cHN0REdiMmhGSnFhY0tmNFFyVUNMbTN4ZE9rRWNkWjRES0hDdWpNZWFEdFZR?=
 =?utf-8?B?Z1Z3VDBtcktnNU83YitBYXhQaTU3aitGbU5yT0hsTjA2TGZRNW5aWFJORE5Q?=
 =?utf-8?B?WERZcno5YUhEWWluL1BIWGdXTktWWmRBbTBQNmFRVzZNMWFkbytZb3h6Yjk1?=
 =?utf-8?B?MFF2K2tIcnlWN2I4Qi8yd29XMndQVTdrYVNpaEdOVmt4aHpsQUZlN0k0b3FY?=
 =?utf-8?B?a3ZvY0l3ZW1adFZicllLbDlLUlRRWC9nNGZCZERiVDMwSGZpeWJ3RzZGaktT?=
 =?utf-8?B?SmNNTjBOZ25lc0dtRk55MkdhS2JOY09Rbmo4eTZJdHlReHkzYzU0Y3E5T3VC?=
 =?utf-8?B?SHJROTBDYkMyVVMvQUxsQnYvYUYyNjRHdlRPOGVKZm5QL2xPTU1lU245UEpS?=
 =?utf-8?B?ZEZvTlNOVTVzT0FWaHd1OUp4N3BrdVg3MFhzdEFBSEJSWlJRbitNbXhxTlJw?=
 =?utf-8?B?bGNLOUVibktLU3l6ditkTWVNeEpCQ01DUlFLUTJkbDB1QU9UcmxsUnk2OFkz?=
 =?utf-8?B?UmJjOGlDbWUyNmlFK1JNZVhkZzU1cDdlMzh4RnFGK2srb01pTzVTVkdFRnVt?=
 =?utf-8?B?aHN2R0tUN1JFOTZtdkFCZFcvMWhzdDNXYlphbko2c0JvREVyVXNUWHJpem1V?=
 =?utf-8?B?ek5oTEt3UTUvWDB2UFRZNmdVM1NhdHNsbm5zSnpnQ1ZHTGF0YW8xK2lURVNx?=
 =?utf-8?B?c2JhZ2x0VzN6RTBRSnI5L3ZXdFRUMmNSWEZRSFRaR2l3ZlBTZG5WMnNhRnpq?=
 =?utf-8?B?UXdDM2xLdDlZTnA1YVZkTFBhbUhVUXFDT2d1OXRPQnlKVVdnT2pEbTNPS0VG?=
 =?utf-8?B?d0pHMHhDWEhZeHlLVElMQ25aN0xCNG54MnRBWkoweUZzaGVlK0RtSjJSTmlD?=
 =?utf-8?B?YlVJZkN2NE5yL3lvd2dTR0tZUHY0MENnZmNJZzFVNC8rVTRGV053VVgraUp5?=
 =?utf-8?B?d00zS2xoOHdOdEVkOFlIVElMZENUWmFWZVVDd1BXbElRM2FoQy9iLzMyeWFE?=
 =?utf-8?B?QUdzeldDZWpreXdWQjdEUFpRdEpteVgzRUorKyt5WVo3RkN3ZDZ3NzBSV084?=
 =?utf-8?B?VHRNL1Byc1BFTmJoVGtLNUw2TWhmSUtGdllVakJveFFjVURDMHRsSzZsb1pZ?=
 =?utf-8?B?SkwrdDJQN3dhUlI2SlVJV3dMRTZoNEFNelpnQXY3bWhIalJvaW9uVmFRdGUz?=
 =?utf-8?B?RXdyV2dZV0ZMZmwrd2VFMmUrQ2dKT0hmSHg5QnYzSVladGRQcnRwZGFQRHB2?=
 =?utf-8?B?eTBVM2dDbklhQXZhdy9zcDhya2dQRGhwQzl4djBaNE00Tnd0dlhldWNZRFY3?=
 =?utf-8?B?VkpiRUtNVDFzVW90MytHUWVJanRwTTlaK0hhdXdzQ1VGRVRrRUhOVmlRWGtU?=
 =?utf-8?B?bkRpT2ZFUng0YzhhK1N4OFFjRFBvcThXT3FuZ3B3emJqd2gwcm5QODB1aUhx?=
 =?utf-8?B?Yk9zMmd5Z3FsaUwwRSszVEdVbGFyUzg0UEdwV3Z0VVpQNHU3NGlvdHVGNm1F?=
 =?utf-8?B?dzFWSFl1NEhndVBnUGhFR2x5UXJyMWtQNENHWVN1RFBuUWphUGtoN2p0RWd2?=
 =?utf-8?B?TFdLeGZKckl4cnQwaUg0ZzYwck1FM0FtdFdLeU1oQSthMG0yZnJVSUMxcUZR?=
 =?utf-8?B?c0JncHk4eWZyQzBjd3VBNWZXOTMxS3YxcDdaSk44OEV2MnAzQS9KMmNyWGxl?=
 =?utf-8?B?dVVydWpKTnRjTzMyVCt0bSsxY1NuMlJVd25MTitaRUNsODJta0JuZ1RRY2pa?=
 =?utf-8?B?d0szdUYrRGEwTC8yOWdoYkhFNG1YWmZtS25vakQxdGhIRG4reW1IdEtOdzl3?=
 =?utf-8?B?TVZKci8zWGN2ckNkMzNQVlViNnJicndOSTNyZ0ZJQjRySVY1bko0UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdb00c4-5c3c-422f-f5c6-08de9a0bad69
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 09:53:28.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c0/OIc2LnlaBnh5eAZsa6BndWAQPIk5GDCZZgC1Z5vauPmvDWqxZXLO7iDYBQfsrh/a39Z/dZ3LlaiDgKN/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

On Tue, Mar 31, 2026 at 02:45:07PM +0200, Philipp Zabel wrote:
> On Di, 2026-03-31 at 18:13 +0800, Robby Cai wrote:
> > The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
> > but the existing names do not indicate this explicitly. To improve
> > consistency and clarity, append the _N suffix to all
> > IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
> > IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
> > compatibility and will be removed at an appropriate time in the future.
> 
> The register description in the latest reference manual I can download,
> IMX8MDQLQRM Rev. 3.1 (06/2021), still call these bits
> MIPI_CSI1_CORE_RESET and so on (without _N). There is no mention of
> polarity in the bitfield description. Is a documentation update
> planned?

Yes. A documentation update is already planned to clarify the reset polarity
(active-low) and naming. The current RM description is incomplete and will be
corrected in a future revision.

> 
> Right now I'd say this improves clarity, but reduces consistency with
> existing documentation.
> 
> Are these bits self-clearing, or can the reset be asserted by writing
> 0? As it stands, the CSI driver using these resets, imx8mq-mipi-csi2.c,
> only calls reset_control_assert() in imx8mq_mipi_csi_sw_reset():
> 
>           /*                                                          
>            * these are most likely self-clearing reset bits. to make it
>            * more clear, the reset-imx7 driver should implement the   
>            * .reset() operation.                                      
>            */                     
>           ret = reset_control_assert(state->rst);
> 
> This will probably have to be turned into a deassert together with the
> reset driver change.

No, these reset bits are not self-clearing.

According to the design team, the MIPI CSI reset logic on i.MX8MQ is identical
to MIPI DSI: the reset is active-low and must be explicitly deasserted.
Writing ��0�� asserts reset and it will remain asserted until cleared by software.

The current assumption in the CSI driver that these bits are self-clearing is
therefore incorrect. This was exposed by the landing patch [1].

To fix this properly, the reset-imx7 driver needs to reflect the correct polarity,
and the CSI driver should use deassert instead of only calling
reset_control_assert(). The RM will also be updated to clarify this behavior.

[1] https://git.linuxtv.org/media.git/commit/?id=6d79bb8fd2aa25afccbd6aeec2821722fa0b5db5


Regards,
Robby

