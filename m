Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91591A0BCF
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682878; cv=fail; b=aUxEs2rWqCuoVlk0eSCb0OjKdXd1qgVAZKx2GWmXCvy1hqMzxAJM64rzv/57KGcVQnNyuRL2USOcAo20fXTrz/p8aPEz2lrFPAf1sGZYVoJkyVjZcgXvd8kYyZGQAY2IF4bNSDNGnCjnh52NJjrNTNt0dEl9mMbNuGHRtGZHTDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682878; c=relaxed/simple;
	bh=PSzFQJzzMpx/B3fr2btAS19NMXn60mJC1tKTD0LhVdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ma5latYf65K303+Ju2ilrGb+oY+JnFUkPnkjlqT+3E+0F20/EgxO9UInNq9aszBe+4saBJtMTJYg7SiEO3T1ftHi51VDfPPP98vfQhGKy+n4ROEM4T1efQPQV9mKh1c37Y6nO3RLRxoPrwp/6OrorAkxQm3FPXiqX8cruny/qL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DWyOdzy5; arc=fail smtp.client-ip=40.107.20.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DWyOdzy5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETWVYfxZztbF9H5gQau9dOR+dZ1dKOGsjLZgMY5tygsXdIH2UVbJLHGmoZmUZnwegiBNEjJRGiGBIGuNJa7oyz+LsFTqyVJtRP2QrAyiqwnGMCWLpYS6RQWcSSeis/TcsZWPtK3cbYDGv2w/Ftyvz5lV6x80HI+nU3G+eCQkdMKdDVbHoZ9I6Pa8mm6XkuctBzTuVtFik0zeIAkZiMiNoc9p+4uulXQPrVP4+sVSJGva3eDh/dg6WFjWIznYYNi+n2nRuoD7civa789Vgf9KKx37ps2uTutSopcxYKr16PbXsAvCy6O7kbY0uUcIFr16PJfrNG/nD5cqrw+8oyBH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX3IzFO7zwuj3/pUcHLxWwn0WTNhqhqIreheFX2ah5I=;
 b=IvzZZuNVTNWxUmFqh09/axAXFEldlTLnUw9arTNZd/M4AxTZAb7XgIN6gJso8qfU6MzYbhdfhve4wQv9vUQeQ87V72NCs4nTK1CRmd2Nx+CUEAe/MNUvJ9zjAX+Y1AwEWieJ+IwkHjnXviWXosxHA2Sz93UVjNrERRBMFBTCHEidmLgxJsLtj/eWAeQ0rQgPAE/w62CE5YV4GDhOyCgktuEO3Mzujz5MplqfmGmfICHWlcLM9tqyoidxkTQE+rAvuqgSTUdujG++YCmZTzGWfE2GiahYf3VMJLc9aFfBHgN6fNmXx5zPIdDDmG6AjBuPU5ST7m3aQWnVhF5X+U6qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OX3IzFO7zwuj3/pUcHLxWwn0WTNhqhqIreheFX2ah5I=;
 b=DWyOdzy5bRJT33u3ALu6XvhgO1hIMw8WnYT5NhO48NN3RvRTYOReuI74dqMA63S9VfyzrxO9w6KRAdGb2EqFu9ASUtIzNCbu/S3YeuXzVvDi07/MrpV1aMoDn/Pu5Y8hOiTTNcqy9ZauFlvgD0HR9PNptWSPhLyDYy11ByNlfkLnyyycYj31QUFGMq/uy4bms5oUuQrWw0vtUdALW9JykkhCoBAX1ntU2hZ9tmnNi8IWBBaOkAovOOgS8D9hckS+kgETUnNcElfFX1akLiX6jNzvJFC/lL/NdBXEWcNKtrtMEycyYXhnmwmN8ry03W7t6OeBsQ0ZgkpkJwq73Ovvag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Fri, 20 Dec
 2024 08:21:12 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:21:12 +0000
Message-ID: <4f7a25de-f1b5-44e8-b858-be4fac122c58@oss.nxp.com>
Date: Fri, 20 Dec 2024 10:21:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: s32g: add 'I2C' common board support
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
 <20241219131029.1139720-2-ciprianmarian.costea@oss.nxp.com>
 <Z2RVJLKqimn+jDYY@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z2RVJLKqimn+jDYY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::34) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cdeb55-0ffc-49d8-5499-08dd20cf43b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmljclJvYlBmY0hwY2dXU1grVzVoTUVkWTJnT1RWeXRHVENRY0lqNkR2bTAr?=
 =?utf-8?B?V2t6WUFtK3h0ai9mZ1dvMkoybWJ6SnB1L1NjZk4wQlhOdUk0YzhFbm9kdllP?=
 =?utf-8?B?Nzh2TmlGWS9HY0VvaUI2WXNOQjNLRWpTTjY1aXNtRHYzY2I5UVMrVE0yQzlj?=
 =?utf-8?B?cmhqRGxpTXVOR0ZaZjlVNDZyM1lPQlhkalFCZHloS2tRekJmcDVlQ2V4Qlpo?=
 =?utf-8?B?T2JhcmtsNysvR2ZxOXFVY3RCN3BrV2Fma29yOG1qb2tqYjlXYitvbVVHZys1?=
 =?utf-8?B?MWtxQWdkME1vUjQ3YVhOaFIvZTY0NFV4WG0rVUMrYkRiUzBQRmFNRkM3OUgw?=
 =?utf-8?B?bTdrT1lKOTdaeVpEakhRQzBsNHZtbElSWEk1d0JjZWltbWNMVzdaM20zQ2RN?=
 =?utf-8?B?NERNaGN6ZU52VWk2TkxGZ3gveWJXSVJDaUQwVlNtL1IrVVRpN3dZTnUxUVRi?=
 =?utf-8?B?bmdJTGdrcWUxbGQzOUVMUTljRUlwNzBGRmxpQW5tL3hHQ2c5eXR4Yjk0TSts?=
 =?utf-8?B?L3RYclZrTVYxY3ZCV1ZBYmpTRU1QZTNZSWFpM01HanVzb1VKS3R5dGt1bXRY?=
 =?utf-8?B?T09mMjdVQlVPRzdGYWt6Q000RnBBbHBNSys2OFlBMzF1MUJkc2dOdXpKejl2?=
 =?utf-8?B?bkU5NVdLQ2dhYXNiL1hUOUZtR2dtYm1GWG41NGtQSHhsTE9YbXpGM2RDNlJl?=
 =?utf-8?B?TEd5V1RZdEtabEZIK2VraFlKNDRZR2diejVmMFBTcXdMWjlQWmUyUjJyWm5u?=
 =?utf-8?B?V0lnZ25CcEtFWXhLKzY0Z0I3emtwdk5tMEJaSGhYQ2x4L2VmeDhnaHI5dmZs?=
 =?utf-8?B?OGltSDRIbFdpeDg4dnRGUUxZMWlJMUFESW1QUUF4SVNkdFRxTTdST0xMcTEy?=
 =?utf-8?B?azQ1VmxvcWpzMDRPZjlRam1GY3RRYTJOcWQrNW9kaDlEamg4dEJ2NGY5T1M0?=
 =?utf-8?B?RDBwMkVkUFhiK05VOENscklRait0S2dlZ1FobTNia1JYelUxVkF2S1czRnRx?=
 =?utf-8?B?T1ovVFZ2a3lIYjFLQ3BpWWpLQnFZZGlMTXEwMERhSng1bEpIWk9ZeEw4UWVl?=
 =?utf-8?B?eEZKT3J1cWg0K1h1b3VVUDIvNDdxY3lxcytMcTdpRWJ3OFNlbkpqdlhhcVNx?=
 =?utf-8?B?blFpMzhPV1NmZmxmQU9SRmpFTEhaUEdJWURnbFg0ZmVzTlFKVUREWk1xaDh3?=
 =?utf-8?B?eHhXQjlhelAveFR1VVk0ZHk0ZmsvSzBhUGVHMHZoOHVuUHJFYmF5aHJOdTVS?=
 =?utf-8?B?T1dqZ1J2VUZaUTV6YnRsNVM5Q3dFOHRMWlpBc29CWlVaOEQ4Sk4xTjBMNzNC?=
 =?utf-8?B?TWhkR0hiTEhUU1dpWUxJQXd5YkNPbWxVOXlpcUhRajBLVlJuTU1SV1lUa3Ra?=
 =?utf-8?B?Uks5amdZWmlubWNqajdKaTFaRGYvdVo0Z2V3QllqQ3dPMTFEUC9PYUZKb2pC?=
 =?utf-8?B?YWJRd0FOY0N6RjQ2OGZhdVl6U1ozZERBZ2RSa0wrYUJBczJjK05hcmpEYlcx?=
 =?utf-8?B?V2dhN0ErYkdiMmJkcDV2NkU1c3dYcVU3QUxwQ0dNWmxlNmdoeE93ZHZQNHEw?=
 =?utf-8?B?MjhCdjFuS1Y5aytCTGljdWorVnRrQ2swVDBwMUIzaW1kM1A4TWhjbWFNOHc5?=
 =?utf-8?B?OFBDcEt1RHhXN1VkbCtLS01GNTJLSHdzZkM4dEVJSmhNdXpRZng1UHZuc3NG?=
 =?utf-8?B?VXNDcDRHQTFUMGRmaVRMWCtVYzdXMktQYk1KSFB6UzFERjVBOTdERXpLQUs1?=
 =?utf-8?B?Sng4Mk96MDFsRGh1WThvcitkRGtGTTVxenNWNHA3NGlNUGE3aUNjSlR4WDhW?=
 =?utf-8?B?S3VPQ0N4UTVMSFBVaGcwekEzWTNhaWFsUmtlUElqV2ZsQWVNc1hZSEY2bXNs?=
 =?utf-8?Q?FamkViHkincJB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFhd1A0RHNicXVMSVRmMmg0SHdLai8ydkZmLzRBbUxJSE55Q0FIY1FSRFN2?=
 =?utf-8?B?TUhvWjFPQ0lYeHJkR0VxUlNnL3QvNjhXSXowMzhQYVVZd200a0dqc0l0QUpX?=
 =?utf-8?B?cWx3SjMrSUdySkhmeWkyODNmUWZ0c01SMjA5cFE2a1RZa2kvUCt1eitzSGZ1?=
 =?utf-8?B?dXhNclY3bmh1WjVzVHo4YjNReEFTUExCdGxpYzJ2OXFLYU5tTTVTeWhWRFFy?=
 =?utf-8?B?WnBqRGlSZFBxMnVkMHJIQmVsWlJEL2Q1eDNwV3ZOMGFmZzFBU1FiV0hPelBa?=
 =?utf-8?B?V3gvRG4wRC95QlhUbUJod0lSeCtKdUkvQW41S0w0ZlZkZWNaTkpBSElhRnhJ?=
 =?utf-8?B?b0p1Yk5EUlgyM1hOL04ramwyK1N2Zi9BVnhjUXpNNURxL2VSbDlVUzEvQjZh?=
 =?utf-8?B?UUlCdFArdUF3RDVHMWtLMWF4TU96MWJiQVBEN0tYYnpqUnYwN3dNcUVhbFZC?=
 =?utf-8?B?NWwyTGtoeHF5dnBTbnV5SVF6S2Z5djVZVFBkSXBjd1Nla0NvMVhNRWxuS0lZ?=
 =?utf-8?B?d2kwb0JxVFhvTEMzRlJUZ3ZPQXZvQlhUZjdOQVB6Z2lQWVVSdlVwa1FjRHA3?=
 =?utf-8?B?MXpjZnV6RnBxTFhJZERxSGlZSlZuY1RtbFNGa0dIdDhJQ3pSVmhSUnh6c2hM?=
 =?utf-8?B?eFFNSlY3S2JMOXVWdTVMMFBUOVVlMlE3Tkp4c0lOM01DcEx4OTB5LzFlU1Bi?=
 =?utf-8?B?OE92b1NkVTN0L3NBOHh0SWhBVEI0bmpobXVQVDFHWmF2YThvcEczUDd2Y0F5?=
 =?utf-8?B?MzVJRDlMdUlwS0hlS292c3R6d2ExMVp6R0J6NTR0OHp0RWk2ZGNMQTlaVmFu?=
 =?utf-8?B?bVNzNCthSGR1MTVOU1NmejVMV1h4a3ZQN21SbU4zUE94LytXblg1VmFpUzFH?=
 =?utf-8?B?dGhPdHE4VnBrNEtyNDJJWXJya3FFWnozekxuUTRvcm95NTNYL2VFQzQ5LzNo?=
 =?utf-8?B?SUNrZUpyT3hKLzZ2UUFCY21vNmlEckJPNDF6TFJrYnlTWWJkc2E3UzJGVHVp?=
 =?utf-8?B?SlBEY29BbUFFeW1BNk1ESkFHT2NqOEI2eUZ1akxRTExIVDYyRFM5TWRMK2V4?=
 =?utf-8?B?Wll4SHZVenVyVGFFNkgvakhDS0dsdmdKZjBTZUtKaXprV0J5andEd1Z4M3hM?=
 =?utf-8?B?SjBRVTA1OUVrRHV1Ky9nSXh2VXlQVTNQT25KZDBiMkxtbVlOSEloWGVNVFov?=
 =?utf-8?B?NzBWVlNORGFCNndqZW1oaWhZRnNwc3FiWm9kWWowOWwveG5OUWt3TzdIRUJB?=
 =?utf-8?B?V3hSSU9PdDJqRTh5b2tTbWpkczByY2g4Z3p3RDRtRGxmTEZ2RUR4QUl5NlFG?=
 =?utf-8?B?dVo1UzdDZjZCN2RHWExDY3ZGMThoa01oaEY0b2Y4cXkvQlY5eTVSei8vQkxi?=
 =?utf-8?B?VURrWkRIM2liRkdxRnRsbTNVaDdkeU9XRmtyWnFMcFFGckpoNjYzZ1Bqb2Yx?=
 =?utf-8?B?cHJDbXJSZUJZOTNocnYySytoSzQ3K1lydFNUeFhYRk9tL1lGTHRZNXlxcWRw?=
 =?utf-8?B?c3VxL25VOG1KYzJzeThBM292L2dlUllwZjRrdVNHMkhJVlJXajc2QmkraDdV?=
 =?utf-8?B?ZzRnUjI3V3FZSDFIVjBIZEgrakRGeVJhWjM0NXREbmdtRGt3aGVzR2ZKS3Vl?=
 =?utf-8?B?STFGczhDVmVTS2xHSjUzTzNMc3ZISjdPZDl5SWprM3kwS0pYUlFWZ285RnM1?=
 =?utf-8?B?Y2g5NmNDY1JLd1JtOHRUZjZnS2J5U3V6NmdkU01TTzNCV0tqUC9YYXoxcGlW?=
 =?utf-8?B?RlozMEpEbUpUelFNQU9FSDN3dXMyZ1BHUlVFY3pJTkpsako4WGh3Y21wdlVD?=
 =?utf-8?B?VmVxV0x0alpJRzlUZi83NkE4L3J0ekNuNndzRCtjSFExU1FiNnEwK3NWaG12?=
 =?utf-8?B?K3hOYmRvRW1mRTNTeFRIT3hER1FjUGJRVXMyZ2VjSitOSlZKMmxHeklZaDl2?=
 =?utf-8?B?dVZRZHFqbXhrcXU3dWZqcjdHOFJva3FkYzFibWRMZjEzbXVmbkRFek11bWkx?=
 =?utf-8?B?YjFLcldwWlVTTlRYMHNjTW9RRElqY2VtZUgrQXFLclprUUg3M0ltL1lLZ1E1?=
 =?utf-8?B?Uis1SWRhWkFrOCs3SnJCaElYNFFQaEJiT2xrYXRUank4Rkp3ZTJOMkJBS0Uz?=
 =?utf-8?B?WTY0azljazBxVnc5amtxRXhjdFRVUTBJUWJyZ0FoYjVod1pqK1dWbnltclF5?=
 =?utf-8?Q?s6i4OKFHMQkP724L137YBcA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cdeb55-0ffc-49d8-5499-08dd20cf43b1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:21:12.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZwq3jWEqhvjo4HN+0qL9n/zQNyobG/cnFDL6SwN9AzJO738lhAeWQxWan+SSdEEyTFJeNXgJQ1vswYok5K1c2/snjcbymwqudwMqWPNBc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On 12/19/2024 7:17 PM, Frank Li wrote:
> On Thu, Dec 19, 2024 at 03:10:26PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
>> (i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
>> will be added in further commits.
>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 45 +++++++++++++++++++++
>>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 50 ++++++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index 7be430b78c83..0e6c847ab0c3 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -333,6 +333,33 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401e4000 0x1000>;
> 
> Need add common part #address-cell and #size-cell, which all are the same
> for all I2C.
> 
> Frank
> 

Hello Frank,

Ok, I will update accordingly in V4.

Best Regards,
Ciprian

>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g2-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -341,6 +368,24 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g2-usdhc";
>>   			reg = <0x402f0000 0x1000>;
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> index 6c572ffe37ca..666e4029e588 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -390,6 +390,36 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401e4000 0x1000>;
>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g3-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -398,6 +428,26 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g3-usdhc",
>>   				     "nxp,s32g2-usdhc";
>> --
>> 2.45.2
>>

