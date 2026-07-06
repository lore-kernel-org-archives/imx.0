Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F07442119
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332966; cv=fail; b=lrnwNSLZlHuSuRpNeiTFct/REaY4zmANqtTxAxr0bd0MNBXV3toVmx1MOcbuN1YLqiwFFWMKXt+5BYl9s5Lkx1GDrYLYTKlbpM5CChja9ub/A7Pl2qYaerMpVHXYHLadP5lSGrjznwCcqZN43LUF04m2TeaI3jsfSEUyYiI5PjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332966; c=relaxed/simple;
	bh=6kcwJYjUTUmvEGNK61eNdYeZGGgTqX6LchAKKJ9ZsCQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ASx/XMySxlgD7CLLKV5jI/kCWpZgxYaWgTRTFgsGQf4zBkP6XZTsybVQf0FoMw5BYtOiT6hIq7zdmYsBv9tBgj8xumv4/LJhMPz1bcXAT87unIQvrsMuQPR3c5D/FXpXSlcT1gqWAB8SUK8QrVTb0uRNB5Pg3GLQAvdPR5RFRBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P9wEwjEu; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P9wEwjEu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHdaRpDvjDewFz4HijSOfZoapjGLM5pGYKs36U6FTc1XsuzEjYwb0qTRjK1m/7yHnDt+at9ICrM8BgQzhYZvpN7IcwyiD16seD/Du/IlAoarZrZc5oFltAz2Vp0cQHB3irZOmBfr9v6Qb2oPZz/k9I33Uytj9btOCXu/mDgoD21iX4cKqL6g53xS7rmX5LQM3LX2lCbRV/fu9vnJIDYiqSB7Pdzhe1HNTtcmO79uh37REkr+t4vlyCH7qfvTIbUtIagWU7+jmHif/VeGJKirW2S4Uv7jWtlUHzUrGuxc2SnuTNcIOwZARxHDsiBlvG+q83WeMldM7xO4pwx4/3943A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaKRbMQr1O0sp/2JB+AG4lauEvLx7xJV61hq0CP0bS8=;
 b=BR3ipurBoQPcIYHY7kqNdgv060ULJjLovKFZDU892IicJuPYGcBuUp51Y2/TVkoBePpOx65KaAqET+qN4wSHI0eVkf46QrK+uGbxGQZMjJYd+UGf35Itmjj+wN9m4FeTyy+zuh1xr6Lpx2wvlErb306BO59LxtRZTaYosvd3luJBOeS9T13QuEHsiGy+9/dTcygfw2wd4saHhkJQISbSOlE+7PAoRYd+wLsBeuDFASACKnCX1Rp8jq2EqYEvV4fVVozQEwtFiEQJy9ceIHX/fGrILVhEbLESFjVRaXykVMN4uvNvywcEU3NAT7gPhap4T/b/MpcdWO+XVSsXfsRCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaKRbMQr1O0sp/2JB+AG4lauEvLx7xJV61hq0CP0bS8=;
 b=P9wEwjEu4bZtD3qOLIm+hTXw+MEEFM5nncLEnayoTFP1AUGDD9RvTClOrddG5GOpvm4geUP55d2/8/VxBVV6C4ks6ps/U2BRodjdGKe5/5zT8fwzg04PfQWUBSWVmH0tV0+MKqSrptzC4SbVQg9CNyaFsIb/7gI0qI5rS46u/UykFXeDkMdt82zAfsWAq2EP1qcvrK7VS3xRea0rvIQmh8whmDRgOPSNktIDdGJnWsq/IwEM+cD/m1R9M1A4Y3QK//Jnt60ro19wWMpaifelFQpzvd7PGBvSQFPp6UbLoZHDhp+xZGDHOFTZTYw3LxgpI6IMo+GpkGTH2Po5MCgtfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19) by AS8PR04MB8947.eurprd04.prod.outlook.com
 (2603:10a6:20b:42e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 10:15:56 +0000
Received: from GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891]) by GV4PR04MB11308.eurprd04.prod.outlook.com
 ([fe80::b043:b2d1:9a94:1891%5]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 10:15:56 +0000
Message-ID: <d70e97d7-f802-4053-a50d-39a1efbbfe44@oss.nxp.com>
Date: Mon, 6 Jul 2026 13:15:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: s32g3: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706093430.273703-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-GB
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20260706093430.273703-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To GV4PR04MB11308.eurprd04.prod.outlook.com
 (2603:10a6:150:297::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV4PR04MB11308:EE_|AS8PR04MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: d5174ae2-db04-4bec-2635-08dedb47918d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|366016|1800799024|921020|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f8DlkWvwRUQPJwVS8yKuUwID+5EU1q1OQovOhsGdUQiZ7yUnNOU8v5I1NDmN5XNFo9/zCoK1iF2QUuuNYsU4rLiy6bNkGOydUikuNB4SPyyc6O03uvkcsjMX1o1ETKIIy8HYZpn3rjrRqQ4qsaUjDwhS6thWandQ2r51Be8pYEN7scJn9wMw44nqvexgpMy2BCcYs3ngQnyHUJHmjV14jZgDmuuj7yJb9beG3I/lFur54eaD85Y9wBeLRS6EATj/j/RBBdJnM6SsBgSVsDyaj4CM5lxIGSUeuHoPeTCv94CZP1OuEE3klZG+QB4/YcVE/TwcaDRHfX6Eaf5G6HqIh8RxUDg51tq6F5bsI3XetyURMCxwzlvEclWhM2/WeJwGnM0WpIPnRgkkR1ga97AZ6rS7/NW4swXi24IOvFaVWruQ1iyzzV8oX47OhkjcyTuPdcxJT0Rjekf/qa2Kifpr1cZ+9zsFWVBSfgA4QsbpfRA/DqcRQJ26L6ouHaPSaq2RVenXfCwIjC3OAqTP0Wpj2q9ru5SgiFkefQkH+7zWW28oHKpKlJDcPDud8VUx01Jbl75cuf9qVjY2sN3dyB3yk8Izip5JWZpw2nyQVns4Ca26BBVYh9USb8bCVz9YvyDwLxt9BzToRUdyG/OHjkjgz2NcAeMnDP24EjrX8zY8gr4KKoGEPWgTPlzbd5k4T4dirv6TpDnuoFkhiq4M+urNzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR04MB11308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(366016)(1800799024)(921020)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJTRnFvSEtCWVFJQVBmTDdrZWc4RXRNNUhESXowcjc2MnBQekJZY0x3UTN5?=
 =?utf-8?B?TGwrdXBsTEQwa2hDcTQ5WnAvMmhkbmlhRWtaZDMvTXhhakwwK1FDWVJPZU55?=
 =?utf-8?B?UEV2WmVOVkRUUGJRczdvblFEUkRyN2lUSUtyaDRNNlhtUzRYVW5jOS9LVDBZ?=
 =?utf-8?B?bWRNdEhKSWxIUWZlcmxhaE16WXVhc1R1WmlyOW5neFNLRnlYdkdZaXlVbzZL?=
 =?utf-8?B?cTQyVklBRUhsZXdQN294SC9MeWRVLzkvWTZ6UnVncStIRGV6YWtkYjAwUnRN?=
 =?utf-8?B?NVNmVW16M3JwRWJYeWU1VENLS2EwUTVESyt3aHovQU8vb3BwbjZ5RGJCWGZy?=
 =?utf-8?B?YjdkU1Vod1cwUVpacENuZzh3N0Z5QW83OEhXV2xaZVpDZS9pd2pUbFd1MklP?=
 =?utf-8?B?bkVJL2N5TncwVHFyN2dXdG5uN2pTZll2NkJWdDU4b21pUGlnc2pTYnEremZJ?=
 =?utf-8?B?MXdKZTR1WXJaOU9YNDJ3bGFRNlk1UHo5bXhnenRPQUhucGUzbEdNeHJoMEpp?=
 =?utf-8?B?ZjF6SDJWVHJ5bkdXUGJYM1hNTVVXcnljOXhiWmZxYjYxaXV6Wk1CRzVoNjlT?=
 =?utf-8?B?aWlQMC9LMUFMckczd0pCVEFFOXJoNWtUQnEvVDVNZ21CUitobnZrN2dQZHdz?=
 =?utf-8?B?bzZPZUU0VE9UcldCRHRVSTdYWDVnU2pQS3BPQVRZTVFnWkJ0SU5LUDljb1dn?=
 =?utf-8?B?aFppaFJFdW5ZeWNzankxNGdLRzdyaXM5R3J6ci8wMU9JUXVKVXQwOEhSSTBr?=
 =?utf-8?B?bE5UaXozeVdwLzJnM2c3amVJNmpVdU9lR2laN2l5WDk1cGRldXBCTXB4U1Q0?=
 =?utf-8?B?dUtmYXJYTUdEUVI1RVlreUF2TkxWQUVZVUQxWHV1ckpIUklkYW4zN3dKaG5O?=
 =?utf-8?B?UEtyb2NOc29hN2tmWGZQNGl5RlpLVVp4VDdkY01qN3MwbnlMWWt2S0RFbkZO?=
 =?utf-8?B?YXg1b3NBTDVxOHhEMVBOaW1xaGd0QnBxbi8ySXdUTGI2UG5mSFRLODMwd3ho?=
 =?utf-8?B?eUtFbkxiVGlDYVdpR3MyRVZsUmwzQ3FyQ1ErV1M1d25tc1d6NFArRFR5MDlr?=
 =?utf-8?B?SUJLVVFya2dNeVFWMUJoL29CY1JJTUpFaTBGNGVJdzk5Q3gvQitwUDZmWWE5?=
 =?utf-8?B?WWNSMXNzb0E1aEhMWUt6aVRka1Q4aVdGcHREUU1tYk5UVVhxYVRHSUNtNGo4?=
 =?utf-8?B?dGJydWwzQklEcWR4dklDdzZZNDZwWWhXa01kbjJZMnJtRWdOVFczWVJiVk1n?=
 =?utf-8?B?aC9iWE9WNjRxRHJQSGNVVXdHYkY1VmltWGZMaURZOGFDd3U2NUdOTjZ5ZWtP?=
 =?utf-8?B?OFRTRUlpWHQ2c2ZRYUx5cEJsKzV2UzN3Y0YxSFVMd2I5M09MNi9Sb0NIYTZt?=
 =?utf-8?B?RTJ3MWhMV0p2WFpLYnBiQkg3YndEd0FSM0lYdlhEREtSRXA0YXRFUldTcHdp?=
 =?utf-8?B?NHAxSFJRVDRjdVdvUXlXaEtFMUM5QytTRFA3bndoTG5nRmpCSlFmQWxZTkE3?=
 =?utf-8?B?Qys1N25nTWhqOXcrUTBnNkpWcm8wZ0I4TDdMbitSbkxkM3F3RTIzTCs5V0k4?=
 =?utf-8?B?ZVY1K0RPL1oyTURDanVlV2ZNNFpmT2lEWHJRWkxOeXp6LzFwN1BlRnhTaVlO?=
 =?utf-8?B?MTZsdTd5YjdTLzVXRHNsQkpwSEI5a3ppN2FGclpoSktubC8rcUkyYjR3Zkho?=
 =?utf-8?B?Rm5SdUdxTTc0Y3ZIaW5jOWZ0Mzk2TktXS0JOSWQ2MXFBL1pOL3NRdmF4b1k3?=
 =?utf-8?B?R1NJZHhnTGpBQnBPUHZGYitTOEpNSDE0djJIbFlOU0VHck5DUTRRSXJ5YXFh?=
 =?utf-8?B?MlZmeU1jbmJ3TlJPNTkxc2RsL2FGQmNDTEdzN0dQZm5DSzVMak1pOFFRUG9G?=
 =?utf-8?B?OW5TV0xwcDlydFE0d1p2dWRRQlViRjFzSHAzUStXdWhjVzBKOE5tZWtuT3lM?=
 =?utf-8?B?L21VQS9QWGdaRXIwYythSnZnNDBPTk5uMXBMcVgwZWx4NTYrczVIb0NlNjVG?=
 =?utf-8?B?bHNLUlQ1a3JkSVVuRnFBYnp5S3hNaVJ3VngrMGI0VHVZZzYzS1QvMjFaWTVT?=
 =?utf-8?B?T2w1WEUweG5oeFlKd09Vc1hKaHNQb0dLdVZEZS9FcWNtenh6SGNyaFQ2V3Y2?=
 =?utf-8?B?T2dJN2dZRXR1TVBPRythanRGQ0U5MmlxalJaRm5TbDQzeThQbjVGNGFsbHhu?=
 =?utf-8?B?WEVuSTJtRXV3alNRTk5mMldGLzFFTGxiWnZYMnJzRG96a2JmRzZ1Y09sT2kr?=
 =?utf-8?B?OFBTQkVWSllpZUJQNitXVGdmelpTUG1tb1JzUWRDRjc2N3lJTXZpVzJTdVVr?=
 =?utf-8?B?cFU2WHRYcFNBK1RtMFJVUnZVWmpac1h4OGN6OXNkUXdEb0JPeEVXUHpFU3NW?=
 =?utf-8?Q?MbvRZYdHz98itk8k=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5174ae2-db04-4bec-2635-08dedb47918d
X-MS-Exchange-CrossTenant-AuthSource: GV4PR04MB11308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:15:56.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /plrD9foxVTTL7UKTINTIrSzrFx1qKsH38/0atdpw/jHam+YsgwTwi88lfhYhg6vWyCG7tXU11v1ObvcKlQHD3O5mq2S8eCoJfg+iuS4Lz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8947

On 7/6/2026 12:34 PM, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 22e80fc03f9c..6eafa9139557 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -534,22 +534,22 @@ usbmisc: usbmisc@44064200 {
>                         reg = <0x44064200 0x200>;
>                 };
> 
> -                usbotg: usb@44064000 {
> -                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> -                        reg = <0x44064000 0x200>;
> -                        interrupt-parent = <&gic>;
> -                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> -                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> -                        clocks = <&clks 94>, <&clks 95>;
> -                        fsl,usbmisc = <&usbmisc 0>;
> -                        ahb-burst-config = <0x3>;
> -                        tx-burst-size-dword = <0x10>;
> -                        rx-burst-size-dword = <0x10>;
> -                        phy_type = "ulpi";
> -                        dr_mode = "host";
> -                        maximum-speed = "high-speed";
> -                        status = "disabled";
> -                };
> +               usbotg: usb@44064000 {
> +                       compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> +                       reg = <0x44064000 0x200>;
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> +                                    <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> +                       clocks = <&clks 94>, <&clks 95>;
> +                       fsl,usbmisc = <&usbmisc 0>;
> +                       ahb-burst-config = <0x3>;
> +                       tx-burst-size-dword = <0x10>;
> +                       rx-burst-size-dword = <0x10>;
> +                       phy_type = "ulpi";
> +                       dr_mode = "host";
> +                       maximum-speed = "high-speed";
> +                       status = "disabled";
> +               };
> 
>                 spi0: spi@401d4000 {
>                         compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> --
> 2.53.0
> 

Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

-- 
Regards,
Ghennadi
