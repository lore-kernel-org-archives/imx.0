Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7153E639B
	for <imx@lists.linux.dev>; Thu, 21 May 2026 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395153; cv=fail; b=ULkEMcpWRQh+OG/ZzSqQJoOWDygdbBZ3ZjPZAgndh6Tniyo/sT5MtPZFfP4dhY280ycndSQ2uJOO04knDN55T254mHlJ+4LVYOCXm61wsDEspggNnKtW2MrS0f/+ytwqG/w9BGwS+ughLmVFmnW2pIlgoSKv6YZ6pzzHxHtIoto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395153; c=relaxed/simple;
	bh=VAEN8c9I72Zpdr61xMyF6xFq/eZX3o+JXoiWHMqkorE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jyl+AMV2Ii1es5d5Sfr46vvmzAmdOAH6n8SgN3KC5QPrpVJBABcQcotUNETHKggaho6oRs24WzkdQV8LEeK6FHqvPR9iU2AlCAjsN3rYaW3I+BfWspNzormmr0OxH8tEg/MTgjAB/nQAkxbGdjl7OcqlkmaZ+cmodI2Tuxi8Sq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zwni5ROK reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zwni5ROK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogBNCGEbP9azI1zHwSDpbpvMGd48nj4+w8ozbbX3KmyDQ2XzZN0rFCOC5/LllnzfBN33Tj7+4cbcuwquTJKn1U7F7SpaIGi7qxLG69j2a4n7J78WEaiTA4YqkbT6lUTifScxi0fwjO3lIegtmQLUTs3jWXJCnplazWGm8m4jt1xebViEgaq/gpNEeKjrZsbBMxVZ904bV8nebugbanavlod29WYdssmKqYNdfeXCxEwj9XNw85V0VLEIliR6uhdvPFaCJwcplYmSmR6JJZkS+bPkJxvnvxK4GEOCNui5S/X+k+bNPKuTVwzbXJgg58aBBfY2t7irO9EFKQle/KkZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//wVaT+BGpByvHc+EPJGb8M/FJ/fGIxxcUDwihdBtIU=;
 b=bj8mIqt5QY/h9npP21KY/GZ7YYKJuk508zaq/r9JIrDFajVn1hw3msuzjz/84aDDGyCE+R/EYik66TSHQp4y/f/KsJne6KwjLb8yQhq/xVq9kVuuD39169rOzm01oo9tg/1oj1E6j2e8a0YOcGi3/TxDI9m/8LeObVPiFHD4lz5n5GDuo0H/t9UUt939hWrMzjGlmxr0K7Np9En83EHKNXOn2uD7u5sNvmjPD9xl6xkulUhKNK1Qr+yM6zcfYYlHO4TIopPpJ6jKwEQGtH/+BApQnudNPkzCBTff2PnJTo/QC7fpH3EPNQfa2F50suL0Duk0OHql9oHWkiI6MuESyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//wVaT+BGpByvHc+EPJGb8M/FJ/fGIxxcUDwihdBtIU=;
 b=Zwni5ROKSFUJ9wGJAz6yWzTc9IihjznHPIV+za6ZktTkxwjsuar+HY3shZzWge80a1U+jjX7Figd8cSDMcSqMVwWWU/xvV1C74PKhJAO2iEinjNaNV2aV+PlEWshRCFeZqVklVZvzkqwdbQEUpUZXvOzhOIUNCs5x4sb0jj86i08PINUjNLOolKQ6Bs6eCWljV+8EH8rZ8RQC+3zhh2XRatni03p8aEPzOaxBHBMIKAQCrwMEslnaN1FE2iizvaT5c6MfrJwJe5VklkMY2Xp1mdxIDDeW1LXrsbITi5MFVRn2613HxaBRxfO/noLMR1rsm7Voq+e02pK6Jwy5auh5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB11993.eurprd04.prod.outlook.com (2603:10a6:20b:701::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 20:25:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 20:25:46 +0000
Date: Thu, 21 May 2026 16:25:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Eddie James <eajames@linux.ibm.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Message-ID: <ag9qQqNJiPdmbM0a@lizhi-Precision-Tower-5810>
References: <20260521195233.1532852-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521195233.1532852-1-Frank.Li@oss.nxp.com>
X-ClientProxiedBy: SN6PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:805:ca::29) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB11993:EE_
X-MS-Office365-Filtering-Correlation-Id: 6756ab2d-0263-4a57-c8e1-08deb77723a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|3023799007|18002099003|22082099003|11063799006|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	5bC4wQLqYE/kGVy/i5UaxxrgsgFA1kwAiDuJJggYK8W/cNzrR2WlPC+TZ99+tGOHqVHZ7srOoxwx/09V91JrIIjc2dQMI37vuKq95cnAeD2QpCMh7vjJjkYNo54HHXj2gVm+kXRQMefDP7ErvtA1UW3cgN3JLLTaE6QTMc4qAXv9SDZgG3plfgVH/25bEmDfQzuau1FUUxKQG7fOvIFvI5NoywnwzyuOotC4ryh2Fb+6AXsUqdQTdBAeqnxJY1tNywxBfrm0Lqut5qFyw3913aB1eKvmylhtl27PFw4eOF+dGHQIRTf4PCmxjsH2C4gvpdk7wlmkAifQ01J2g8sRcHedL9waeOiG0N5TRGf5G/7JGWTRzSJCDZLzFmP5MzqQpdCMjdXGbkyUF1TL7FjpgAihHPEwMdz6upkxOyTSeasyI3OHsCDDv1BCjzIIORRZzZrSi+H9xklzUScwKiEMxhaxuumwwujpsG0AyHX2ZUyej5qx488AzzOtR5uYqnz9Ysir1CrIiqYkzwCmPxU3I46Pc0AsjGFjjNDNucakiWHDnZOKqmEVrDDhq/uQffED5qHmxc8P+vlCQBg04/H07JD08gm4jiP76QrR5i/NcmTQg673nrKkKWWEKj7ZCJ2RZJgdDTyiYRoGXDe9UoN3Fjd/0CpF3lZjOmpvcPmiuf+zpStrjO/Kvipg1J5VZstXRfm61oDtbgdyPxMOU8lB/e8F9h+TlaztTH2BkztI9VbjcFj0buBTtykOOCAveC7G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(3023799007)(18002099003)(22082099003)(11063799006)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mk67bZiDn6pG22fjE7kq15gNbfhi747PoZ8aXXgi44GlK7UxBQGiklEQ10?=
 =?iso-8859-1?Q?B/r4iq0wCLU2CeocZIWAIrnNOorrqPlS/iSsmcLrfLIJ6coXNTXxQbIOwF?=
 =?iso-8859-1?Q?iiXw6BS6KgZTCKs8Oy96IueMI3lxVLC6sQsgK3FxWKMx/VY//P7QYz1hI+?=
 =?iso-8859-1?Q?CkYkzDLqqaj0l7HiXoWdlDvoq3amDHwE5S7qB/H3+v0Wo+JUKZYbJvUCUP?=
 =?iso-8859-1?Q?Y383izg+yYsgw0X9cogETK0qDBf810E/wrqW2ZfVyDIT0CW33n5w03iolV?=
 =?iso-8859-1?Q?akKlk6JKgzC8b9old3meOSqhVl6BJjbs1tsVyjr94DCV9b9bxWNhbFDsML?=
 =?iso-8859-1?Q?/c1DV8JLT/+g4tQ9nTKnJZ4X49el0Su++kff1iqEPjvpbb0FwgqQ5hthUs?=
 =?iso-8859-1?Q?fNxPX1kTdOurIgVEPv46FoGduHifi4/QbbnlRwoibQXj2lAUc4EoauCwIH?=
 =?iso-8859-1?Q?8fJWva5w3fMNM9GPcF4jdmR83ymmeMmRM8CZZphBG0rtVItwYKYhjMRNEV?=
 =?iso-8859-1?Q?3UJlbDzCYL68mUyqNY178Wa4JTcKDyeHbJVCKiRh6RVLG/dF5mdX1Uv+un?=
 =?iso-8859-1?Q?bQDfBSvqeMgaeJG6PB6QeIgLtU/5ciiIaFdjAf6ReN3Gzpl2CArY5kOJZC?=
 =?iso-8859-1?Q?1qqjTvha4he6zY54/VVThxHKzJxtc3KwNVtl44gBCTIhIaQcOxBFq0iGzo?=
 =?iso-8859-1?Q?c7ruufCXPysOSaAOysSerz/hDyQ/jLYuZSG0TqmB9wbWh0WKQROWjEjqVa?=
 =?iso-8859-1?Q?vkAOB5gTsqOy/t6gwnblxHG5uMnEJlLTLA9ncd7jv99GOXxixGuXwETPOE?=
 =?iso-8859-1?Q?JfWOIjP4NVvdlKcXY9+urHeSNT8Ad7haHf4aio0vPWQKHws+l3IzByrofp?=
 =?iso-8859-1?Q?cyvIq1E6HTcKAOUj6ruRU1wtxgLZQmcBX4LKfbiEfO8Tk9DWc3Q+2W9UQI?=
 =?iso-8859-1?Q?QHqlCSMAhPUvZ9/OdXiL+afKgN/hGR/3gxYxj5ZXnOeV9PYYg7G//rNFji?=
 =?iso-8859-1?Q?qzfdQW7meQoNTM8g+1tqbLK0S+qXcqfRnYTsbDkUcQv/04BjlLxkTmlzI5?=
 =?iso-8859-1?Q?9jccniw6mbyzIafMd8TpTX+Fn1QvW6V+omvqVe142bOdzaA8RNactTRKVn?=
 =?iso-8859-1?Q?s1efSLcplm8y//ljxoIFCngIibTHY9xdO3BMdZK4R+0MB6+AvPIPduIhGu?=
 =?iso-8859-1?Q?thRp96lzPPjo6kbMHXpUInj/YJsG4Rp9wMwTlAMqCk32SIU9MRAz5BvkGH?=
 =?iso-8859-1?Q?A7sM78WAYLomTo/npo6twRiIu2fciYW9JcK556wHIZ7s9BJaGLFtcpJd1C?=
 =?iso-8859-1?Q?2a06rHszNh/Ppy/vCtdLwzFHLi1EhpdpjZWgUQh9dMSYQC6aenbu5a80sj?=
 =?iso-8859-1?Q?oOAmhK5nLNfU2y0GXYsKAUIZmnuULryguzh6zO2/Azk/moruc9qbl+GERV?=
 =?iso-8859-1?Q?eSxWA0y416DjaK+vPtyNfmePuJy2hJ0wnYiBK1lodS1UBqScIK9+VrFmSb?=
 =?iso-8859-1?Q?iri1d1HurtehGHiOBVt441MtNQ6p+aMMePQyqzvvi0K3GThy841z1MlFr/?=
 =?iso-8859-1?Q?LmjcVCLNcMXpZ7wn40j0XhZYGME6mxeAvce+3mvatt/+AgXX4u1cuofj0w?=
 =?iso-8859-1?Q?/oifEuq5YmS4osdq4qUj/ghzoRzo7M9e1JzD7VTmp5FvGdjFZHpZ1GDUmO?=
 =?iso-8859-1?Q?7MDyCY0Xfl13nFBHGgMgP8lOBp6AkXHxVXC/OWZoUFp/eT2GAVW/CFKv8z?=
 =?iso-8859-1?Q?jCFGS/See5ixs5OrEPTbfba8iNXLLwrH6kPTO4OiJwrPsd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6756ab2d-0263-4a57-c8e1-08deb77723a7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 20:25:46.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDtNvT9bqPYfrWNggrHce/w7Ckp0HpvP0xoEUW4NsUbC4uz5WSWWT96fbJrFvZQjfJf/5srxgX8b4GEDuyiZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11993

On Thu, May 21, 2026 at 03:52:31PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Add freescale 2.4 GHz IEEE® 802.15.4/ZigBee mc1323 to fix the below
> CHECK_DTBS warnings.
>   arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

Sorry, paste wrong error log here, should be

arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: /soc/bus@50000000/spba-bus@50000000/spi@50010000/mc1323@0: failed to match any schema with compatible: ['fsl,mc1323']

Frank

>
> Since the i.MX53 platform is more than 20 years old, it is difficult to
> find detailed information about how the MC1323 was used on the i.MX53 SMD
> board, as the functionality depended on firmware.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add descript about reason in commit message
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 46a4dca50c485..6ff96e10d0785 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -127,6 +127,8 @@ properties:
>            - domintech,dmard09
>              # DMARD10: 3-axis Accelerometer
>            - domintech,dmard10
> +            # Freescale 2.4 GHz IEEE® 802.15.4/ZigBee
> +          - fsl,mc1323
>              # MMA7660FC: 3-Axis Orientation/Motion Detection Sensor
>            - fsl,mma7660
>              # MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
> --
> 2.43.0
>
