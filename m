Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88143E483
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565233; cv=fail; b=GVoqM9r7yqB764Ovisr96j6U2K946L1/9DKoIOnnyadpa4iqeGQBOggBBVmlmNoL5ObaNT7svBvLZqXeilY+Kt3vUphjg1yrus4xjA7FswgbjZOLoCB0RoXjn++vPPTVIlJxAvDIULtlDOrZe4XYNHS7l7rjRSjL3Th5qPLi+0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565233; c=relaxed/simple;
	bh=K/8jST5qXsm4fkkAbmleOsK1dJjp1g4Cq00ntht3Go8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eP1d7Zm9muI++5vQnKrOyPWB18yQ8xFH77cd7gxRJkuBLrp/pXIKfCaztuZZ3BbxrmkUC/fV8gM/lsdbIHAx93U/ZsVIu0mpnXTbr4MOLmMN9612hRmfFeRPszk4o1LduLIdScaJ76GIDpwODElUBGLEmBqG0gOdV/4/hCJ1YbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s4ShKAZH; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s4ShKAZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjFk3jLlfRoig7F5FBMZStKh543jD1CYIp1jm6XUyWOH7/pGTqlDqw6C1KcMnaE3iMF7DUhlEKgy/u1NVZCvqNktvhGzVD8YnXPCj+bHCrkzt3w7QxcBeVA/rxiTvrcF8Q81BxLdDei7l6uw5hQWcMOv5NFmzbb8QTwdbrFWubm95xXesAemcpuInkgaIpz8V76vm6g31KtQepJpaZiq/7YSOVlqmubDmzhIOZzmMS15OYl+CH0+BRmL0ph5M3v+ev+Jb4p/ig//krFtugShko6YooVaKW7Xtmn1gRkGB5NwAEB7kpJZF3Ohuik0TW5v1OY57f2laxAvrgMFzCn0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He4o9GvStyKJpTqkIuQPvm+bj+Yf7YFH/URdpRwz7nU=;
 b=ArFZcZmqNAZqwGqCDllwzlBVZ3gNouWTzgM2ORy5FhBFsjCg6NT+p1PtfqtcQT48KTOygkh7qol+AaHl4Xs0Odx4WLni5mL23bMqbA/KxCwmxFlw9xalfrxHqf91Io0DWw51yrfr/I/3B3lMNNGj0O18HB4SpLombthbMySqZl6okfrAjanTYjWHpuFECg8/BC6tZBBZtZdErEhpZLriwTETlDIm5izuCjKH0sLxBCxbBOu5M8hkGzybAakRjZkffziZuS2I65xBOk7hBn9GcAKTXsMfKUj6O0ACdkexKMmhucXlmOXeiBAqxBlz3UbSJoOCLwir9gL7Oxw9u/qw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=He4o9GvStyKJpTqkIuQPvm+bj+Yf7YFH/URdpRwz7nU=;
 b=s4ShKAZHxorutkA+CoRST/+uYUyoQWMgkZwwvRLuf4bKfw00G/ThA1/3zRqKDUnJdG1mdrPVkPLue9CiB2f3VIzL8CG3/IWpcWnaTSluouX8rU5LX6Zvfxv9mw41w8NkN9mmlv3RX7g/f9kNCXfz46vepZtsNrT5OkD9tp4VbP4AxzRaCC4o8lp5mUqtuw1DNoiT3e0cu99wNPutIMy3Tj4ph4BdwbtNV2ttqckKqT7DKkdrlQe5ENYv5x7lGqFDXYHrUwEA7PqzH7VT5zAg/pVG+nb8NtiSSetSmOf6gUdj7IU8QDw4XVX4vFw1tSxMyJglxsnCKs3DBMvWh3jRxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by MRWPR04MB11493.eurprd04.prod.outlook.com
 (2603:10a6:501:76::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:33:47 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:33:47 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ioana.ciornei@nxp.com,
	vladimir.oltean@nxp.com,
	SZ Lin <sz.lin@moxa.com>
Subject: Re: [PATCH 0/5] ARM: dts: ls1021a: dts CHECK_DTBS warning cleanup
Date: Mon, 20 Jul 2026 12:33:37 -0400
Message-ID: <178456521083.3771625.188306054586837123.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
References: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|MRWPR04MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3f3533-dc1b-4b55-17f4-08dee67cab63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FhU1M0PTkxLvwakTwA99wsv183ZRxQMQQ/zLKYeSBzZ9b1mGqv2opCAGM9M9Hv1Q62v7zSWUALi0RCsMCwghmWPsi8//eEH1mIftupFl05wCamGCehzGacWIAV/6Oli6b1i4xktZL6czCYH6IHiesaJhP4qVNlqsvDJiMfY9xmopIBjOJqzy89U8rECZTDHkUlsivBAITG7Nw7bfChhaRjvOO/e8BnPlvBuXRZy/3mRkIs+sYV9rcWP0hJuQ8l2aSuiV/qIYqnHVN34vj8unqvfA4oPaLsU/X3mTvaCoNHSHpmhIq8lCsrkjtNfqRvD1DREPJhH5CsBQe2/UnEUVrZDZxsMlmt5CHbUomRNXqFWNcd9aDit0eGbC0p2RGOGEI/gbntERvej9IzSY7Un2HriQkJ9PW+nDAkhizZYS9dfv18xNW+mgAN09EEXjdXP/Pc64t3sHH9Ew5sP6ETIn3+K7DEcHAT4IBJMSaXXT5PxkH1gvqRKqFxEqoZkM7BRsv3WMLjfL31DjQ/KKM7HZ+lz9Oh50tciENEgRQj/BJBO3TBnZnAot391hwBjyJplTHsw9aPTxuNrWCWEyw6hF+sTT7cbdFlZQCWDgS8MLxpDF6+GWFqiRj6gMsNVWUyWjiD2/3VZJAquFRPwhKj/nWn+Ku9sR4ANMhrf90xodgko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MklMdXNnZEorT3dKUk1xajgySUFSdS9JQU5JcW8rMis4eTFOSkl3NWJxZDRZ?=
 =?utf-8?B?TTVPTG80MDNHbWJzL053c2R3MnNoc2NZQ1htMFlVVXJwWHFvOTR3eWxDN2dl?=
 =?utf-8?B?TTZxeCtMdmhsZlNIYXBRY04vd2UwM2huRHZ1a2V6SXFJNkRKdjFxRjlaYjhZ?=
 =?utf-8?B?bDM5S3h5SWpyTFZyblE0WUkwS3A0RVV6dkRQdU9GM0gvM0x5L2M5QmFBZjQw?=
 =?utf-8?B?cytnQ0xJdE10TGQrdGgvYnNOa0JpSVZBcUVpRUp1MXdQbFYxcldjVEUreGpq?=
 =?utf-8?B?Q0F6RkVrRm5La1hWakh6ei9KMEtZRmhVOFZKQXhyK2pZZHVSejJuY2kyZmxt?=
 =?utf-8?B?RlJ2eW94L2dDdGRTSWF4NlBPNjlSWVNPVmZsL1hqV2wvdWR3Ukg2eElndmdo?=
 =?utf-8?B?K0V5OG04WnpJNmlROGsrVFZpRG1DajdFYm0zVldVUkl3dG1DQ210Mi8rRk4y?=
 =?utf-8?B?ajN6L3JtNmgxYURkVHBvbGpaNGpOYnovMkRKTm9BbU1ySVVxdGViT242VzR0?=
 =?utf-8?B?VitQNHpvZFk3N21oU2d5REx2dCtiZ01zSy95OU1UL3FHaXZmdk1tSHdsOVJO?=
 =?utf-8?B?NGpjT2tzYXFiMzBwNjg1VkZWcnU3aDZackZxcU1zcytqT0E3QVpSbUEwMC9B?=
 =?utf-8?B?TTZMUzZvVDFYTHhmdGNWWitiMGxPNGRwT2tKWU8zV284WVFpb0h4K1BTTXE2?=
 =?utf-8?B?NE9CMW54ekpvK3FoVVZXaGk4MXJDZWlOWXM0S3JKeWREcTEwNGZGNWpnRnBm?=
 =?utf-8?B?RmxVT3ZzV3RyMFlheXhoTjBORmdpQ1Y1a0FpOHpBUHVzT0o4TlZPWkc5Y3VS?=
 =?utf-8?B?OEkycnJWb3RIdmtjajVKSnhyRXFIREx3Tm5UeitDT0J2eFREamtHa25vQjhS?=
 =?utf-8?B?UStsZlg4a21Eb3p5U0lPSCs0M2RLa3NvK2xudU9zcUJGTFZsN1psRkpOdm9G?=
 =?utf-8?B?dFcwOUcyc1ltNHdYK1dtT3RQc1RSU0VKOUgzaERVWHFpTEp1bVFwa2owRTB6?=
 =?utf-8?B?UUtxWFJyMUgyeTdoQzVMZXdycnIxdVFXL3J5TXBQR2xDbS85RmtNTTRnblFi?=
 =?utf-8?B?UE5WbzZCYzlPbTQvNjMzOE1yQng0elJBWXA1SkFydlppcmcwNGtQdmdHdUZs?=
 =?utf-8?B?dStZSWhIWENHeWl2VkVtK0F3NDFaMDRpUGdXZWJxclNnZ3dtTUVhQ0RQRGd3?=
 =?utf-8?B?Y2xtelBuZW03MXErMHRFNHZUUXkwRWYyV0tmTWdhcFkvTE5lNEozbHh5dnlZ?=
 =?utf-8?B?ZzlZRTNxNng0T09JZWRwMWwyYnhWc21BcnlEbVIxSzhWOTlrNkRoeU9xLytz?=
 =?utf-8?B?MEFpTm04bk52emw4aGQvNm9Ga0l6SGUrU3YwcDlNZENicGlvcllpNFQvb1dv?=
 =?utf-8?B?QUpYWHY2RVNqRzBsNnhqR2xxWVdVY0RVRm96MjFSNVJCU2t6N2xiN0xiSVdG?=
 =?utf-8?B?aUFwUkUvVVd5QS95RlNVeWtsLzcyamYrQjNVSXJlUnQ0VFJ3SGNLTlRYQkRX?=
 =?utf-8?B?ZVcrMVU0d2hHeWpYNlRtV0U1ZHdZallRZVliT1RHZ0VrMDRFNEZZWG1LYkxT?=
 =?utf-8?B?bUF5d2FYeDVCUVRRVlhFaTZsenBKVCt4WmpLamh4RjlUQmhaZ2tweGZWZnAy?=
 =?utf-8?B?WEZMallUZEJ3YmxNNVBaTmJIQkF5emxFM0MvZUJGSngvVThHd2F6ckltam0r?=
 =?utf-8?B?Y25XMXlld1pRUzRVS0U0dVNoYjhxN3E0Wjc5WHpGaEpkZTFVS0pnZHlhd3No?=
 =?utf-8?B?bFpJVTNQTVVRa2Vzb1dXTCtyeUdsWVluVVozRzFRNXpjRGV3cVdsdXd4Y3R1?=
 =?utf-8?B?WTkyb25SSWZ0RGx4Vlk1VFdBQ0R5WmkwRFlVL0svVG5Tb3FuVW9TM1laTXdM?=
 =?utf-8?B?eHgxQm9LTUQ3TWlBWll6em9VV1lWdld4NWsrc3Z1VFpzNjFRdFg1YlFaQzcy?=
 =?utf-8?B?NnZRSDQyTUNQanZkR211YUFpVDRUYk5TRmhnN1psck1RTUsvbHh2a1JzUjFi?=
 =?utf-8?B?aWgydkdSUnI2Ynd6bWdJTkVqdmtvMUpnMHlZS3JaaFlQdm5YNmpldHhCZ0Ey?=
 =?utf-8?B?ZnpXMUpoTEZzWWo5WitjUXdpdUFZVGROVTczUHVoMTJSVldFZlh2aTBubW1v?=
 =?utf-8?B?MUE0a0JhZWRxSDk5cEJjK09SSVg2OGZoQzMxcmhnaEtBOXNHVG5xdHpiWkZ1?=
 =?utf-8?B?VXJORmhJdG5LRUdycG8ySW01KzJudWFqQUdPYjF0My9iWEhGVTJrYzlrU2Qy?=
 =?utf-8?B?eVVPeGVFcHVZYlByMFBUQ1c4YTd5b2VxNVBZL2dvbTcxMUFBT1BvMldRZ1VD?=
 =?utf-8?B?VEQzOTRIZExhSS9taHlWeGc5RDRraTNJOXRlaGdxZnpiNlFSVHEvUFJkRzI1?=
 =?utf-8?Q?JHZwCBCdsuSCpmlapx03V1rvg551FSMMoUoKO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3f3533-dc1b-4b55-17f4-08dee67cab63
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:33:46.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSS69P4Ex2Dk+67C5bMhfTKjfqhd1kLwkQdW8/7pA2TKqVBpiNACrjFsJ5ag9O8HztXnTA5hsKYXOXCfbFFRz7lqSqO/PB3DnQ5OX0DXetos7c1lB22RF3TPY03S/f8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11493

From: Frank Li <Frank.Li@nxp.com>


On Wed, 08 Jul 2026 15:26:08 -0400, Frank.Li@oss.nxp.com wrote:
> Collect dts changes to clean up CHECK_DTBS warning.

Applied, thanks!

[1/5] ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix CHECK_DTBS warnings
      commit: 8381098761d85ec09a838c02827df3b1dca8db6b
[2/5] ARM: dts: ls1021a-twr: add power-supply for lcd panel
      commit: 5bd40da5afd7a09a0dfe655b26189197935eb493
[3/5] ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22
      commit: 09ea402c1c2c5f6bf6ef7b0f00045f91b5e8e926
[4/5] ARM: dts: ls1021a-moxa-uc-8410a: replace spansion,s25fl164k with jedec,spi-nor
      commit: b5a62376f6f0a3dbf585c9007aa1b196022435f9
[5/5] ARM: dts: ls1021a-moxa-uc-8410a: remove undocument property default-state of gpio-keys
      commit: b022b074d615aa04abf3d73ec497c88d7ce09a9d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
