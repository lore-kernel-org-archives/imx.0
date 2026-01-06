Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A631AA89
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694641; cv=fail; b=aoIK62flRiu0yELnPsfDUTRqUFrKBNr01h2Qd6GLLf+5HPBarDIjjHPNcXFcoPUAOKFaOn7hJy7pJNRZD+5y2lrscegIe6LsjBJmMNeDE4kn2QnPLxXC7hc7KOnvdHiPIKYkYivGWFGTiUB8wRoodIKP/mdPRqG/M9JLQwunyKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694641; c=relaxed/simple;
	bh=XH+asCWPe4Mqf4ssh0V4Brzco+0oNfHkE3qJ1t7kgJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nsp3xYnJkakakIzIoGWFd1STrnIkgM5qTeT1rjauO/uVlFLPdBQFf+hJ0C0PfISyCCYMxAmskBCsNaNYsPvea327fT7CvslTho1PghJn1IZ+4SPZYJ+ugZJ8Ug3N5lFDMH5YKYRWmF4QTXEJOptuNrBrnD7sm4n8+A1gBE2MHmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TPGSCQOY; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TPGSCQOY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ise01Y67pR+NlVZpcgRlReipk8poG62MOu3b2o6CyeK3Qanp9QzxUoRPPtvplrj0iMTxw23XWvbYrgulm1CVOC7LrupdJVynoarVd+WH4n06yKMLaylA5pjxhKa0xEYhfwbp7SBsRLqEAoFqxtKG6M/HLfXyKdz5HjPiZa1IztyMORZ9yvu4x+tmCMEmJuMsM479OXiFV88HPJocM1VIyvKla4MHWzYjXuBCq7jlYAGnqatWSoTyCbqfI1F8vn2smNa8Bq0apHz0h5v2DpzLqPSUQqHVi77Np66d3fkrcP1e18DnB10/KY0P3FPyD9vJjqAw59HWjT7yE6AYSkw6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3wM9H9bghjhaGJ3WIr5z7nwHDP/RbQ6iL57sgZRsmQ=;
 b=x1QvsKe4tYYuZqX+sGtLxisq3kS40VWnaS43VhqDqtCTfDSyjqrq38gCBXeU4qISf3Q4eGWRG7o1anU+6/kitAowl2EnN1GDjLljlMan0YqI1heoa/JIXjLopkVVQltZ3cuGXvbipRpeKHEJmV4n76of7oQ/f/hRI3RML8r9QYZZx08crpsW34+7AKgYwpdcElahimKboJmZDRTngzvPjZau6fu3hE/A32/T+7KhFM2uTTwGsM3tzSqd8dqQAE5EgXkBhNKMuHGCkRFg7WcZmKHx3iajq/6Veujkylje64ejvvr9LnbHr9OjFjvCKn6RXVI7IDxYLAlpUUphh2VPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3wM9H9bghjhaGJ3WIr5z7nwHDP/RbQ6iL57sgZRsmQ=;
 b=TPGSCQOYFkRvsLthCf7crn4XYNFpwCutz1AwSwFH9g41medtnSFFSV8rRwtzPCIoJLsk6e1MKYzXdFiH2d1sMd/8q9rzJmZVU9wa82NZlvzdfs7d+ULGPM+2NZyM2pBXbpxNQ6Lr0CSGFQTmNrGEODE55Beec0RSp2UoYFgautebZS1O2QQDImArOhI5CD63kSoRupMm0B27CZGvkq54//kzJhjZBPHGcTFaXMywucgTaWOTpYuMyMMAYX/13Q8Lqc3R11VWaoWTsTJnnrj3bWpmyiXrT4J7w2tyyS/Tr1BdkAMBCmatHHTCibolUNxG+bG848wZAwYRpjKczrQUsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DUZPR04MB9900.eurprd04.prod.outlook.com (2603:10a6:10:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 10:17:15 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 10:17:15 +0000
Date: Tue, 6 Jan 2026 18:18:44 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to
 fix CHECK_DTB warning
Message-ID: <aVzhhH4BRFC7XlAL@shlinux89>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
 <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
X-ClientProxiedBy: SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DUZPR04MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ecc363-9e84-421f-4a6f-08de4d0cc395
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t1wnOjPXDQnFGBkTQXu8opmgHC6ca9k/jW8LKWkyO4T5n3BYAUiCYZWpZjjp?=
 =?us-ascii?Q?2M7E2Zh9odBzhkLb63LAO73ZXf6yLIDmYhuIDqyg8tA7L8QRe1faMjYJ1sbw?=
 =?us-ascii?Q?Om77AED4wIzqbkT/4MexYnxoCIt+nE1ruqeZm2kQTONDsi8IFiQdKMcey5Wu?=
 =?us-ascii?Q?qWByMy0LbvB8BR004cd8WLgsl9q2ZawUgkQtm9PjSMHVWxcZWEYuEtcmkIzf?=
 =?us-ascii?Q?wtgvTLWD2PZTLagnIrBCK87TkoBxCEytmTZFnlZXBjjq0n/5U3EtLhWRhZrD?=
 =?us-ascii?Q?8mIoOBzbiWc/ofUlVpnCAivoXxjC6ppmn6lYXN1amZ/CMSTPKWTjpzJrNUNv?=
 =?us-ascii?Q?Jg6xkuG2FDqqVQy9Bfu2Huf9UD3mCZPks+TigccmIYnr7MVRmqVT8quo7DgS?=
 =?us-ascii?Q?WzJ8aG8xIlh1tlzyhAo+Pzs7qnXXW8JcmR6ap/KF8v1h5RbrukS1uuqm2rBg?=
 =?us-ascii?Q?d2ee19210JqZQZh7fMwaRG4iR79IrBMmCpu9fuBsMmykEJjZXiT6tbdamwhL?=
 =?us-ascii?Q?48XcAF9vB5n4o9ptuzJvlxIWyH/ZziJ1FtV+gpgcH6KbXdS3WrtFcmJf8F7M?=
 =?us-ascii?Q?Bp2NEeV1+ycNmStiB5CQ53sZEJHZYfCM9i3G+R/zWBDUW5NKvbLVcw9UbKtl?=
 =?us-ascii?Q?IfXMCRZc4KMqUL4uKEWYCooa+5X4vFM0KKjRHalNQv3vItvxdNysienpBPVH?=
 =?us-ascii?Q?AHE46KYqgT7cK5zgfAS/PZQUh3KF5kKWhyo83sCMotwSY+C1zDZTqPCFx3tj?=
 =?us-ascii?Q?uUK+yDEYHftewMvFrP4Qpul7t6yESRjpUWMCpznwHi01pa+qkfpvK/HGTf9/?=
 =?us-ascii?Q?veaih3W7L/FwjKYq8K9yP4Wb0/P2wiBrqpIB09C+nfzvI2AwxGBucIPmLmtl?=
 =?us-ascii?Q?z0osidKMNsKxwLVc/+zEpysJVTzxHMdlj+rcg7Iqc7/H7Hahg7cQpGU+iJNr?=
 =?us-ascii?Q?b1N6wbFQ4Yksu611Kgu9fgdf1DWMAU2H5dBEciBD726+M4YRiPgwgiqXtHZY?=
 =?us-ascii?Q?uFF9IDjQzXqKWzzNVkRBYqtRaUs6EndDZSLITe0eQqBx5scO/zA98qYjOIt5?=
 =?us-ascii?Q?BGfoAEc2FqBichww2sLIrHdjgJZ+yKc8uhLijSNBB44FxXZKpwPazwgb8XWK?=
 =?us-ascii?Q?WL7efJ1gAqJo+BAqbPnexZx2tOSjj/xKyoetIYizYKy7XPMwVsPgSoRg6Tka?=
 =?us-ascii?Q?gkg17pgUBnucpLNZGAqP4ZNudfMNJIFKp8j6yIwkWeSIK8gFYTNGlMJV8wUT?=
 =?us-ascii?Q?XqFAC2UdwYmXObsWJZ6Zs+h6bfQR4ggdTJyxgtjVH01KXrF+3Yqz2M0mFuNH?=
 =?us-ascii?Q?qUqdsbW4ZyNn4QaXpj22WSzjaZPLrzTkNYyjjhlfJMQ46huIx4K2qF9bnfUq?=
 =?us-ascii?Q?Ns0VI814jN4Vr3qNz5gz7uEbbY0jiKmWFh4RdRsFebmNGRZNJiHs4RHMiEc9?=
 =?us-ascii?Q?egzBMKVHVuK9DYshubnxkRt4LmhAZMlp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aizF1kxOhg5h0dKy5WwS0XBzChT7LMBnbSOG+VSc0FIn9KtUhnxGe7GctgXy?=
 =?us-ascii?Q?xr5JJOewX7cRJacu1zBnJtw0/Xyvi46joEjJ6fZq/bv6sTze4k64wtvYKW+e?=
 =?us-ascii?Q?G87xqnxrEC/IyzUmhmiDX4EJdsGS/5fHuzUJPTWOCsF4rVzcz/G/TpNp1XI7?=
 =?us-ascii?Q?KQdNr/gn3tOQd9T2ECdWjYSiMQdCl5JdX1Gmbz6f6A3O9a6N5byq0cgWd1vy?=
 =?us-ascii?Q?ZmxjH/jUKbJbjQxfLNpx8m+VX+JQd613kfm+lGisiF6zL/hnyfx80mXAdt93?=
 =?us-ascii?Q?kXCE9Uyo7GwjCWpYw1zQv2eZuMI9nLAZNumKUbYOBS3ug8Z6lK2L2b9xEouJ?=
 =?us-ascii?Q?bvxgTYnLu56cBC1WL/ay4dunmk4hZKgo4QaffGVsU5YFMmCLtNsh3Qhws6M8?=
 =?us-ascii?Q?w+WvuVxlRIDDb3pXcuFukDRsA0xTaZY+J16/b/pKdpFENyngVlrJnfhT3QYn?=
 =?us-ascii?Q?R0iGgZkL9QCIwzbiy7IeyagpMwoCVyyRjjHDjnghvpGmj4xEelCaGdpEOPvL?=
 =?us-ascii?Q?QbZaZSyjnykpYIVt8RmtmlZVxro+FosGu864HuVtVgYn6twB4qPfRpvTi897?=
 =?us-ascii?Q?61pK2xN4bgE7UCkP4MXXcskOybCN9Q+nYbOlOLInKDiPB95qC9Ngg96rmtjd?=
 =?us-ascii?Q?SM7fvcvp4uXemmrf+uuOPZsqyO3i9iJ8UYvOhuxDSRJi3BgGf2INWYIMDWz8?=
 =?us-ascii?Q?so55ahMb345TTV2j0LWez9DVNVLMTFBdE67r93xx1jaIhuvLc7b6qH+9HtIA?=
 =?us-ascii?Q?eKOXXqCriFDYyfB5tE6FvjbTvTRya0uOP0Jl0mFkXsFgXn2rKvmQGNq13RrP?=
 =?us-ascii?Q?lD/bdO0/9O3dj3bJhluP3ezMpFYyLY7J3iHazdIqgltcA89mG5ZhEKzYd2ON?=
 =?us-ascii?Q?ECI03SGt4Dxs0VWQcQAt7RmZkN3+v5f0cN6HTaULr3JG6eJlrsOVvh9UCbcb?=
 =?us-ascii?Q?psUYYS4LnO5Rs1VqqzDXtpk7yifj0zJTrPUMlSp2BALugwHwY4oHbEovhrl5?=
 =?us-ascii?Q?1O0BeyDrif1lBVdR14Fsj+xC6rV3OoN94l7i/wGlTzUCbSqhIbxl4F0a2yRL?=
 =?us-ascii?Q?af/qh+yQpJ7JFswOn7rGoUJV08rP0+8jZqkWIIlRXBzGy7bzk3Qf9P424EqZ?=
 =?us-ascii?Q?6Qgm7OoXM981ZaMhOxzgfDjE/BvNznpI7eLYv0lzQmoAXamgE9luwd6GAzQr?=
 =?us-ascii?Q?mJ+gsuH2+gZs4bSZzWZk7AD1UORgoA6816a3NI6cBOUVtIEFZi6kYAbs+7El?=
 =?us-ascii?Q?+fh9OU3Q7nAytzlSNEtqqBWcIuM9WVok8WUcFus4OSjKV/69TC1508ZDJ//m?=
 =?us-ascii?Q?uAxvUhBqEqL5ymjnGPeEwsKIVtVJEJJroERjPQBkeWsnZ20Eg8qAKtDOMx3h?=
 =?us-ascii?Q?Y2C6gVipZh4rqDKcxMSjttcFtKCS124k5Eg6uGKDKrvhgfb/6ZF5jN5iNDRS?=
 =?us-ascii?Q?GdovzHUDq+faIePNxdWmh93yjcMcZXlEI8gzK+3GJr4rzifS+DhIs1a0YWML?=
 =?us-ascii?Q?guPpZnqfxM0yyFSUAWTOmi7IRKbqNRp65x8yt24eGwBfRL5N2fQleZsTDLa5?=
 =?us-ascii?Q?QZ4/y97RosFAJtVM/LPC/eDsf32XfDO8Is6PlZ2C6kmrI6z4JytERQTOMrcM?=
 =?us-ascii?Q?9h7k7dm+2KDDShLNqi8UjXY2yQRPB9hUhfDkK89HTsnO/HE+Cj91lKqSDsxa?=
 =?us-ascii?Q?UubABQgyYF5/gYtgC8vzpIFaTEMtDbcrMEjfPtBjN/wYnt8VOGv/uPLoQTZ+?=
 =?us-ascii?Q?7TtoQbIuSA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ecc363-9e84-421f-4a6f-08de4d0cc395
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:17:15.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJwwS49QOskOjMo7znKeMHcoLJlsGx0oSBjwKduo4S5LV6YUZZ0441LkBqT8qyk1Giw4NPJ8sftUaRCZ6eTdkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9900

Hi Marco,

On Mon, Jan 05, 2026 at 12:14:48PM +0100, Marco Felsch wrote:
>Hi Frank,
>
>On 25-12-29, Frank Li wrote:
>> Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
>>   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
>> 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> 
>> The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
>> description to set SPI mode" force use two pinctrl-name 'default' and
>> 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
>> setting for both.
>
>please see:
>- https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/
>
>I stumbled over the same warning, but came to the conclusion, that the
>dt-bindings should be fixed instead of workaround broken bindings within
>the dtb.

If reset is optional, the dt-bindings should include "minItems:1" per my
understanding.

But..

>
>> -		pinctrl-names = "default";
>> -		pinctrl-0 = <&pinctrl_switch>;
>> +		pinctrl-names = "default", "reset";
>> +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;

Per checking
https://elixir.bootlin.com/linux/v6.18.3/source/drivers/net/dsa/microchip/ksz_common.c#L5372

seems "reset" is required in driver.

Regards
Peng

>>  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
>>  		reg = <0x5f>;
>>  
>> -- 
>> 2.34.1
>> 
>> 
>> 
>
>-- 
>#gernperDu 
>#CallMeByMyFirstName
>
>Pengutronix e.K.                           |                             |
>Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
>31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
