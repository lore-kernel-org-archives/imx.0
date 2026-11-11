Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794388536;
	b=NdGGGgb/gHLPZ05T5cN8BAfJ/jmsEnksmZwO/NHOHo8AKdeH0jI/KbK0rMhYFlWAN4Xp
	 1ujatb125VhR6MySoU8qMk1DyXl9aGUbVgqrpYn5C09FQT5NA5mKy0gXXIzvXBGbABp4q
	 NZlJHgr2V9gTvIhAEvPfz1oEMO6pKKx8xo4mf5ItQOC2d7dv/8a01f2WssspNKCPDX/Yg
	 inp4ZwPbo6pl9w+5UyuI8EQNtn43UCujJl6iFuv/jqWzi1umk/91I3eUQLFIk+k5E29wg
	 YMYHLylnx5DwWdQ8+1c2XWnhzGx48wmR0gLw6FFrns3AZDReFxNEhS4WDmxiHwQLn/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388536;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bwJ+WHbGVCFH28elcZRbIAm2mMSgt9nIdGaeA4H/AbU=;
	b=Vbs8fnucxHy4iC6svQuNC+LlHwWGGfQwkz3VCqnt4/4lt5EpWXoQwD5O2V4SmOT+Xg5f
	 dVnIqvJ9cRPvhJ/5sbfcXGaBIvtmCb88ccPGo4ciCX3FuNAYZ5deMTVm57LxJSdLEUdqv
	 KPvhsJ2JWGFG9rQPQrE1qO9JPD+SbfCIGx1n3gEGWraojeIdgOlUGvwmyqveqy8UWwITk
	 UjugNQzmzjAw/z3BTyTBgpwktn0mgBiTQO9E8L5gbxmttc5ckZeNFG7eueg1VnBLJtDvb
	 imqIZmmK+JkFhWXqRjqCntcptyhlDFEfpSiOMpNmNgJJNRjXRPimQoM+BHaOfP0lc7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GleODMzD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.5
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C9606A332
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39C9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GleODMzD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPeEN9fxkkT7Pw6EcTGuELcqbq4Efl6nU53OvpMlEOJvmIlzuHm4axNYglGjyu5VOCZ5AIUn3OJ9ddq5Bjyp3jhVeC639WU0TDc4q6xrhLJgI3do2SFHtM45TXSxM1CF0YsY0/6DJ7Trl1LmVVxE+9MiaHeI4bVHu0R/ai9XWaAUWQV7/h9J+RE8ydHJjRaiFLO2HJMsz3DYXjOHQm3y4JevP68V2moMEatWsm2gsb16/hBHcymZZ69NjYGMB1NoifSO6yyYRm5kTbsrwcVP3TbiW4VobN/exriUh0POPBL20DrGuZcsiARauISCkMT7Oytg9Sq2uLt9sFfw0AQ9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwJ+WHbGVCFH28elcZRbIAm2mMSgt9nIdGaeA4H/AbU=;
 b=hXf2Q4Obj6sAa2qWJN2ypZzPWyD5mtHiNcaRtyQr/J1gt776ogPLdfmgE5OQBy3zmSN3zu6KMLvwEpCLYDi8fjA670fK41AlTX9NNDL947Dci3TQIfkm8gf7d/Mf18ad1Zl4/cHlESOC+9LGVsdzz7vFqhwhth+yivy64D4kblOi4NET5C8CcG5pLxOY101beAx1CAAGZnbyaFHF1qPE5bPTqnRMpNeYtxHCfeHt4y2nJZcO8yO42WfJOiyU4pg+UVmfTaSfUyVHqGS5SDpZpdVC1psMIwf88j9iJf6cqHNcqokQB8J9D7sj7pXBjw7RhlB3I/1tOea8haJOHsFupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwJ+WHbGVCFH28elcZRbIAm2mMSgt9nIdGaeA4H/AbU=;
 b=GleODMzDnegiALjG+iNUng5nfk8MguEML3vori0NbDLYt3OnHfixBDVpPtAfFQurAzJaWbVTsgBFNg2K2PtnEN+LU45eBUbsIb605fgqZfHbAeZGWSTKibY5RQdZsMT3gg/72ac2ssYvIJeDQX7YM6UwoR+mSOE71o7S4QcQCfmd8BKwL/ZLaTMM5dUdllDg2VJhczId745Q0UPpnWgVQKIboQ02Hr5uZoLKFKUCynbXTZmckMLMMc/qs9V6xeq0WskRida/+zWk7N9nMr88XfafTCRhlKXvvU+niqvBgMvBGYoAfWIY5YHQHdFJMdiacd73YLL2zkNnuvT3jCeslQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV4PR04MB070381.eurprd04.prod.outlook.com (2603:10a6:150:3b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:15:28 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 09:15:28 +0000
Message-ID: <17476cf1-91ba-4530-8c02-90c171932fc8@oss.nxp.com>
Date: Wed, 11 Nov 2026 11:19:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: Add support for bytesatwork
 i.MX93
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
 <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
 <23bdf173-93ba-428d-8415-107f64e163ba@oss.nxp.com>
 <34d9b9a8-7f46-4ddc-96c4-131606a01112@bytesatwork.ch>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <34d9b9a8-7f46-4ddc-96c4-131606a01112@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV4PR04MB070381:EE_
X-MS-Office365-Filtering-Correlation-Id: f8eef8eb-d52e-48ff-78d6-08df3fd4538d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9Xz/HAKkI44xuOokteD6kEaG+V79KU/h6aP02/IYhoHIP32ehwIIpn05cAZbIQ7hCoaH5qp6Y3aJskICgPrGS8mSeSgiGds1Ir2b59gLzEkrUlA5HIvmdohG8zgqw9kmlIJzdksgNlGqZTF4bkgOX9Yy930akiDivvlC6FL4DNckpKM/EFpBi6vWYKqppGkJsP04LgQctD5B1YF22RqH7abIibhJ0zER2BmW2qW6UMHiGVEawYSqWivrHSUeTAcmE3hujof97/TnjYH9teo1beGIZhzw5VSoBhRtwFNbBGiC3nJxjjVBKAzpuZTkHoibLcANDmWMCah8ehRGEvGiQDjopmXR4GJrTAbHwhkjzdHgdNixjNLQdLPCqmWPqNb8kjgn67JIbiqwmF7L9Udm2qA+HkWsi2ymRhvoKyamjv82gTbj6D41yC2Zd4k5fT6XosFTcUwCKTh9YGR4TPU801X9jpj6L7yOy9RY2Zqav88G/qpoLSfrp7HKWQOR28QM3Woht6mu43djwIrTiW7CpLWMwsUMYUlScwJDPBrrfLxZkULIT3CskLqrMtKCh9lRUGTNp228xoj/49OOEoKccDd812WGgEy35f26cMJ4sHabidPy15G4HJ9D8MdAJ2EK6HmoHjV1bX4L/UYXiLOQ3ENZV34SMBwIBgEqnGlABuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldiQTRwK3hhNXNEV1N0VlQ5WjZvTWlONzhLWUJwa2V1NHp2VjhiMndKZWtZ?=
 =?utf-8?B?elB5WVRseGhDRVo2ZlUya2lKamF1NjBwT0ttNld4Y1IvYVNxTVhrblRZL0c1?=
 =?utf-8?B?a3l2ZTZCb3FYSFFnNjBZR2tSMVMxc2FlN3ZGNk1yZXpLWWprYjlPVncxbm1p?=
 =?utf-8?B?MlNLV0cwa09GYXQ0Tzh6QnRwa0NLVXg4MVV4Z0pOeXZTYzV6aUdBWUtvdUYw?=
 =?utf-8?B?K2YzYys5R0I4QnhFc1liNFl1V2dHNWJLUXJJMmZmZ0R2d3FpZ0JWb1FJSGtz?=
 =?utf-8?B?N2FVQzVRaUdzR2NYNGxyYUh2ZWp2VTBUV3BLOUhGQUJ0Wk82YmViLzR3ZStr?=
 =?utf-8?B?eG9pZ2ZGbmNCbUpCallTS09ZMkVSQXhaMUFCZWRLL21oRkxvdkQwQUxQR3Br?=
 =?utf-8?B?UklqNjE1b05aRUV1NXRMRzV2ZFgrd1lsdGttU2Y0dHIxQTRBRnZlRVdaZENi?=
 =?utf-8?B?WHRiR0hCZUVzUVhzMUg4WW1SN2x1ZjZuNGtXM1ZoVUxJbnR6RlBvclVVRUdU?=
 =?utf-8?B?TEx4R29vbG54TTZGWEhScmp1bEhYeVErWXNTQnVIVTNYYU16TDhGOTFTNHp4?=
 =?utf-8?B?K0tHREh4cEREYWtPY1BqQWRNTS9ldzVDbXc5N0lmRng4dlRNRS94VjlFekpI?=
 =?utf-8?B?d0lSRmVXWXNmM0lGYjVDOTVxenJzUlkwMUpiQzRzQmdQUUxwOVdDRko5ajhw?=
 =?utf-8?B?Y0tRSE50WnVSOWR3UFFodWRjUDZXUHFMMHNkcFFYRGxoTzJtelBTOUU3TVRQ?=
 =?utf-8?B?NjMyc1N3Zy9EUDNwcUMxUWdnM3drR3ZTUEVlU004eTBYVkE2clRJVW8rMXAx?=
 =?utf-8?B?MHdSVlRjSHBiN2g0Z2lKVEsvZVZrQnUraDFxYWE2UGJIOEwraytwM0xnbWF3?=
 =?utf-8?B?V2tFVk1BNngycEJwd3dCVDB5QkNWYURxV0dpN3ZVS0dBTG1yRVhBcUNwOVhU?=
 =?utf-8?B?VDNUOHVBTTJRenlJMWVlaXNTcWVlTG5HWmZXZzZnaWRxMTdqZUkrSFZxV3Fa?=
 =?utf-8?B?ZDlrMUkreXQ2VS9NeFdEK01BKzhzQTNiOHg2OVVGYUMrdkRNWng1RXorTFh6?=
 =?utf-8?B?SEZSL2g4MXlhbm4xWjVLQ1lHc3NQOWk4ZmlGMDcvenZSV0xpVnIwakNYT2xp?=
 =?utf-8?B?UEU3MjNUa3g1MXpYZGQ0TG4zTlFoY3Q0ZnNRd29JM1ErSGVJSFk1TDBHaDJw?=
 =?utf-8?B?cE90dFJiNDlpV2Z3VGtlRFh1bjgwdTlleG1JWlZtS3BQd085dEJ0Sk54SEVu?=
 =?utf-8?B?NisyNXhPSzN3RUxoY1VCYXErUHhzWmkrUHdPM2MwbzZidS9ReVFSLzhMVjJY?=
 =?utf-8?B?aENlRjZhdVdEWnlRTzN6WDZSN3czbFowTTNscWVWL1E5WmdIR3lIMWt5OElF?=
 =?utf-8?B?YTZYTW5XL2FkSVpFZ0VFSy9sV2htczE5S3N2QVVVeElkSmNDcXJ5Y0NzdXNX?=
 =?utf-8?B?emoxeEowYVFRK2RJZUJnN2t4M1hUMVNqM1d2YTNLZ1FiMlAycXh4RWFPQ282?=
 =?utf-8?B?aFYrU3BzcUZOOUs0ck5abnMxWHRLaVFjMGREUngzdzBzdEdkMCtJcEpMMnBt?=
 =?utf-8?B?ZVJpVGcreUFsdEFheE54aUVqb3d0ZlFLTjZNYkNOUTdRL2p3bXlPcFl4UFZ1?=
 =?utf-8?B?VDVPUWxwVVJEY2FmTndDUi9Wa1ArSFZ4anJ2N0NjSXNuOXZmT09YdUVISHFq?=
 =?utf-8?B?b1l1UVBDOHVzdld0QUVTdkVYRjRCdWFLMmowa3BzSFRQV1RZamNGY0tFckNQ?=
 =?utf-8?B?Z2s2NGlUZG12SFZJY3ZmWlZXVE5TU0lqVFNYSjV4Q1RQY1Yzc3VmdmJKLzdj?=
 =?utf-8?B?QUw0R0YzanlCYUt3eXVRNFIyOStqTTM2QkdtbHpDZkNaWHI1a0t3dDZ5a2ZY?=
 =?utf-8?B?WnVML2E4UkZVQjlaUFRvdGZyMUFpYm9BZll0eFMwUU5tMmZrdDUxKzZjMXZk?=
 =?utf-8?B?M3lTZTBaeU82Qmk0TUhEdUtoMUNpUVNWRFBlcVVMcFp2cUhCNXE2QVhhRFpp?=
 =?utf-8?B?dmE3RlN5c0lCRTFFMzVzaUxWOXlwMEsxMzgzTHpzdC9UREl4UHpJV2E0Wi84?=
 =?utf-8?B?RzBUN0JqTmJZcENZU29XWE12VThrY0JFUTJXMHEvQmZabEg0MXJ6eXo5TzZz?=
 =?utf-8?B?cjFEbkowOUE2YStCYi9LYmVJYUhtZ0pVT1Vra1RaK2ZUZEpqWksyRzVUVUVT?=
 =?utf-8?B?NS8rRVRXR1MyR3Z6bklZQUQrZTJUaU1IWmpVQk1iVXh2L3BSZVZBeEhQSzRE?=
 =?utf-8?B?RU1sc29ocTJCYktwYzhDQnlheEVBQzF5RGE2c2wrSGNLTTc3blVsRzBlMGRW?=
 =?utf-8?B?cTMyekZSRURXck80RUZYWmNDM2tMbEVNVGNqVGl6QVp4T21UNUowUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8eef8eb-d52e-48ff-78d6-08df3fd4538d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:15:27.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzHgbgG8fKSx8gAQNfz8ZUW5epR7uesjRNrc+VbldtK9vqAH1HUCkW85gAxWM3ZEJ0Qtr4wqopgfeUiQfJGKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB070381

On 11/11/26 11:06, Frank Obergfell wrote:
> Hi Daniel,
> 
> Thanks for the review!
> 
>> Care to add imx list here?
>> L: imx@lists.linux.dev
> 
> Will add this in v3.
> 
>> Should we enable the nodes in imx93-bytedevkit.dts ? Nodes
>> are rarely enabled in dtsi files.
>>
>> Think if you add another revision of the board with just one MU unit.
> 
> Agreed. I will move &mu1 and &mu2 activation from imx93-byteengine.dtsi
> into imx93-bytedevkit.dts.

Keep in mind that not only mu1 and mu2 activation should be done in the .dts file.
I used them just as an example. There lots of other instances in the same situation
in the imx93-byteengine.dtsi file.

Also, please use reply-all when answering. 
