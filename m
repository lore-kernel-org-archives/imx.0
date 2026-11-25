Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795628846;
	b=1eFJJF53zcAYltXZpUVYXEAhbv77pt9qAYzxT9ooHOWKdOxUlnjqiydewrLuszVLcnsx
	 oQ89W2Y/7dfEihANCtmC5brI4SK91gwc1k9XmbkfAemODcJ+R42C0iu5Du9EGOuF6el2b
	 ZfPF3jjJiHur0mSURW2j7AsyeW6ZfNGmbX5BkMzP7VdtzVrD755iximlPmn+q4HMdtdru
	 RJlktRxzC0Q70sCxoq22OKcZD1eF7tWP7vgiMXwrg1zyFgRW51FQkrp8UtAp7fQr5/UEU
	 OYuHddAv1Mq3F6rzJjB9bkSufev/5XEVEZt3ahSZvG20ttQShOn9AVAcknEWf9Wj82A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628846;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IG1gUssvpoB2BbzIvmhGiYnNnJNzs/nB97WrEsyRkLI=;
	b=0oZ/CqM4XJd+Kn90dhem19hMoLl7jWIAkodIfPHr7xr0pIFPyRgborKb2sTMpe+WUfZH
	 /gQRU9QurDv/4iGCO0KXqcSsGAKuLGsJCh8esONzRmaUr3khhHSPv8/iTKnRmQkzbrR66
	 u0DJAMXBv/3HJiribtCP0BEXDchoQae1GFSWygRg/+OVE/NdXiYwX2fdKnsbXySUc3xHe
	 rvOskv6Sok00NHRP58PBMZ1y56LPUhmbAo4F6xhAXM+dDqk2to2yM512+RzYLgbrvdQ4i
	 f0hGJ983L9ZoEctNt5hAc1pvNqG7zMbGjyDKQ5JIjyUb/IemuvSYVXfMG15mKPTtpow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TWfRvmSA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.56
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF577606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF577606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TWfRvmSA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+0jBS2Lwkl2fVRVAKizhu9DIIwJyowM3bQ+5GLDSLK0+WNbJ3A0YdyKdXZ0EYyT4zLm6VRdxWpAJp+xl424swvxXAB2gpPKIBVbfDMWVUCjTGdCGFPZzvBi1XMrWFOvD5zRQisfk3k4eyDmtdbGmfGO3tB9x9SqxdmMtvpyC/fasw45KRkM+moIJ6yrL0sbc7uwJWe/pFL9lZXIfHGHr8H+r4AdBiHPWrP0wQb739xs+h9lSp76ywd3+OBmn2CKZeXIfnfrsicGRAHSDKxM/z/5u8W0q/HW1Mf84HIr33xDeLMz9+Usl9bDY8xuENTjbHIk/vjyLqvYMgnZh1kNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG1gUssvpoB2BbzIvmhGiYnNnJNzs/nB97WrEsyRkLI=;
 b=uSIDHx92+R4ybHdE5CbP+pCjStRZbmVCS5IfvttpZUI+P+u/tE7nFfeZHm9A1diFqIDoUS45g6fogMsvsj0SmS5XrwevDpHwGXfjMWutRKxywtTr8ZjrhIztjEmzVJbYSuHd09bgrOtPNRMBnV/JzWYOHtGxbkUfoELjJgJ1MkaUeRlHFlyLAGb6Bucc8SYAsY2HKS56LhSH2N8Q4xtY6kO5tvM0XJWWPsBtq6oZB5fEWU7GVGU1azK46g+v3SSKFNbbJnANEWRqRWD/BSC3KZOLDM+nG+Az0il5WMeA8bipTbd1oNtBAJTZ2/Vm+9APxqsonL+8b0Ecgzw+7Hw7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG1gUssvpoB2BbzIvmhGiYnNnJNzs/nB97WrEsyRkLI=;
 b=TWfRvmSA+R5COuBeBRT4qtTRMsXVTVnOrt7X2/q+D0gPGc6ewWtDtf4JStJH+QYRrggLvTyzRw84PaIbY5GWUodTxUh6bQ++sf19f9RCk6YC2IBb1zm7lCbM8suhppU8vSAP10fiwylJy09XAkHsz8UU43qBb9T5pgNdxgaHU/klna6icTjUfvMoHdJn9YNVqjME+oZmi1qvXehi7M0Ybekxc1HF7wuvjUXW03sx/FEqcYXKbZepcwUvGpYd8xlAmjGDzcZctM16w0EKVI89wd4g/W11L3VNWAYNFJPvC799t37Gng17md+KDjc3ztDS+WCIHOjK9Krc7b68oGz7pA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by ZR6PR04MB390898.eurprd04.prod.outlook.com (2603:10a6:910:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:47:21 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:47:21 +0000
Date: Wed, 25 Nov 2026 12:47:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mm: Add Cloos CBASE support
Message-ID: <awcfIGKYfhuyW_Mj@lizhi-Precision-Tower-5810>
References: <20261120094211.1742416-1-lukma@nabladev.com>
 <20261120094211.1742416-3-lukma@nabladev.com>
 <awR-Al7YQMSSqt5J@SMW015318>
 <20261124103047.5dc56f82@wsk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124103047.5dc56f82@wsk>
X-ClientProxiedBy: PH2PEPF0000384D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6e) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|ZR6PR04MB390898:EE_
X-MS-Office365-Filtering-Correlation-Id: 451712c1-1197-4386-11de-08df4b1c27d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|19092799006|366016|18002099003|22082099003|56012099006|4143699003|11063799006|261009223027099003|261102123227099003|261021121427099003|261021123027099003|261022113327099003|10067099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	uoIZ2pR4l9/iuwAtS5My7+QkxID1OyV0PUWPfRzAF8MreqEB2uc6jBogH1/UeuJ088KXoANeEhKL2d6vcddPv29ZCt5puaZYH0ow5iaJGPYxA3D+Cl7lYVMZlrt0fSEJ45GlYInanIcFZb5bwx1q5N7Z/3U2Y0MMDzu4FyvjArL3caZvVe8evz9X9GdX70d8yTgLqQdkY+s6rcHpMVTw9jRzooJnrOV/DP0DcNUHbroHdz6siU6jOrYiy/klxI1koj6kYYCPfF7cSWt0xzKgz1v0s483bd9xC5y08pUf69nZloFNv2beEcHqmxFA1twYMNbbQAdot72ypJlF2lJuTKyU886ZVtxyMmt/VjVbj9DfFlD8MeGeiSiz80r7kDqnwFJ7iXptiwS5jVmSjmi/GSnlYAL8HiVV/x/zg/cCOUWJAwufga+lZdewtxDKnw9HSX6ZNuqgOCN+1bmjF0qBTnWzNfrYV3k1y5oNOGb0QghEcLbzim5RNvYUyoPMxUqYD0M1Cw95BeNG86E8Du84a/baId6eEoztOrPv1UwJeuEQE+mmCL8FTI2F03pGB66C7t2fqHUNibeU5n33fqH4QegLbQDyFuwoxnmx4UpcDPRmXbXKidELi15SNSgV0FPrVa5BfLs/Dkdms5Jy4SmsjJjinf1cm4EpYgR8Lwl0dgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022113327099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVNTDlScXF0d3Fobmx4S2RCeWdzYjYrclNramdoZGt3d0VCa0l2OFoveGlq?=
 =?utf-8?B?R3VaZ3dHZ2FZcHRPalh5OUJxWDVGSm9kNThVOXVGN1c4RmFvcnRXUGJsVFRD?=
 =?utf-8?B?anV2OUh4MWEwMWxTd25TY01jZjlDaUI3MEJHTXlhZEwrREpFcGpoVkRITXpl?=
 =?utf-8?B?RXVVUVNKVk0yVXpEbkgyT3l1aWtYS2ZTT2Z6enZQc09nUEFzazMreE5lMnVV?=
 =?utf-8?B?d0NXaEx6dm9hbi9yL0JRYnVkcmhoSVJJS0IvL1ZyRWpkaFdMd1lkSHNSenM5?=
 =?utf-8?B?QXNBK2ZvelQzNmd3T2hmdG02STR4L094aGVUZnJYTkVldTdJR0RyVEhmaXRN?=
 =?utf-8?B?SjRWU25GSEJ0SnQ2QkVSZTZ4SFc1Y2hsejJHcjVBaG4yL0tUREdVMW1NRjVF?=
 =?utf-8?B?SFBuTjdoUXoyU1JLL1QxMW9tSHU3M3RCUzczekdUazN0U1k5U1hLSW1ReDdm?=
 =?utf-8?B?U25mUFU2cUtxNGp5TlZCaythbEYvdEo4RjUvNjVhbHFVME8wSkRlSnh2azh6?=
 =?utf-8?B?UDN6TjUrMGpVeUlxVXN2UXJhaDErcmEzcnpBelBzWXhod2U5U3NVeTNrK2FV?=
 =?utf-8?B?UjhtbHJaQzFQRkhWTGppTW1EWGdRTjZyYlBlSXJlbXRDa3pSai9vRVlGOG1S?=
 =?utf-8?B?MDZ6MXhqTDhqOGRkbS9aQmpMbGt1czFJZWU3WmNEdy8wZm1rT2s0RDNrZkFF?=
 =?utf-8?B?OURMYkVHSXhhVktMeDhUVm92V2IyRWVyblAzR1JXZm1uWVFUV252QktFajJ5?=
 =?utf-8?B?elRzWWsxTHYzbHdoYTlXci9DYWZibS83Ny9RbGZURHF2ZHFpS2ZjemJwYXF3?=
 =?utf-8?B?ZXZoYWVGOHltMUx4aXBIRWlQQ01KT2hEM3ZveUdoSlpxanBqOE1sMnRza0RR?=
 =?utf-8?B?ODUvdVhodTF4ZXZzeHNRL0NBNDVPNy9KaDZJK0FzUW1rS2ZrWkVZRE55SG8r?=
 =?utf-8?B?VHNOSzZqRU9odHc2UzA4UVFpaEtSdXlJQTBuR1U0K1ZnSFM5V2VBcUcrMEll?=
 =?utf-8?B?cHZiSjRJTVM0SFlIRmplbit3Snc4ZGFObXJBNXVsRTRMdm9Ha3RpR29Rek1m?=
 =?utf-8?B?Y25SV3BFT2xrdnVFZUczS2d4UTR5NkFDb2tpUnYrb1BFb3k2SnZ2aFgvNndo?=
 =?utf-8?B?VFN5Z0lBN1ltNXlGSjZqQUhKUHZJRkpFMDBaeVNSVzZRKzhENFFQK25ORnd0?=
 =?utf-8?B?R2o2T3pkekVmUC80TzhqcFh5NjlCZzVIWkxScmRBNERaS2xjdm1jczZDVmJP?=
 =?utf-8?B?UHZOV29BUjlVOTQvVHFDWmtLeVBxTWdHa2g2TU1tTCttMWF1MjlVQ3FWRjdo?=
 =?utf-8?B?NUFLQ0hac0lmeEtxQkR5QmVXS1dlV1pkQWs1bmp3VUZZOGN4QmlHQTl3bXRX?=
 =?utf-8?B?ZUYzRGZ6Q2JGa1pNTmdweWRSaU5GNXVpVVJ0czBKRUg3bjVIeFUvcjRjcVNV?=
 =?utf-8?B?bGpXSm9qa1hLYnliVTdhMHNyQy9ldll3c0V6UEs1RjVkSEplK2hxbm13Rnlq?=
 =?utf-8?B?R2svUmc5Y2dXd2RaOU51K3NJMkM3bFpTSHVEQS9oNkhDY0p4QVhyNWxGZEZG?=
 =?utf-8?B?eC9MK2ZtNWs2eFRTM1dzVWJEdkFOd3VMeFM2UkRtUFkySDZobmJOeXVDRlV4?=
 =?utf-8?B?L1hnL0xjWHppKzVVUndPZmVNVkhVU2ZTUjQ5VjUwNnJNNHcxWVhnY082RXFJ?=
 =?utf-8?B?L2ROMkF0cmc4WWpFM3FueDlMMEkrcXhoelkyb3NQZG43d3JxLytFOWZkQXRr?=
 =?utf-8?B?MFNwYVZkTUJUeTVNbDU2dFBacmNDTXREakp2L1BoU3ZmbXExVnBydnUyZkpq?=
 =?utf-8?B?ajFQWlJaMnpBaFBQLzVBQzJQTzlZZkNxNTRYb3lyalg4N2ZyeVJmenpoQmdY?=
 =?utf-8?B?MEVVMlNDbGhFL3Z3T1FJOUZEUlNGZlVFdHdLdDNjdW8yMDFMcTRQUjN0bHJG?=
 =?utf-8?B?RXdkczdOdHZWaHNIRUFCcmVHN0Q5Uit6VDhzU3RGUkt6N1hxV2tFbDd5STkz?=
 =?utf-8?B?K2V4N1p5eFpWaXhqYTFVbzJHUXAwK0FoM0loZzAydFErc0dZa2dkU1FTZGZC?=
 =?utf-8?B?SjlZUEhqUTZkL0lNZkF1SHBaeElnYWpPNGRsTUNLZ3A5RXIzNWpCaGU1VHdh?=
 =?utf-8?B?a2s2dTBzMy9lclUwS2QrQXFVU0gya1BubkhLcTVaNkhIb29ySzJaMHpzQkNm?=
 =?utf-8?B?N2VkSGdWQ00rQ2I5ZjI2Y0xoVDh3Q3ZobnN3TDlLNnRZeUE3ckpXeHNUekU3?=
 =?utf-8?B?czlZVjVHNGROa2htazhJQk94SEZZMmNCdTZwWGNjNHRRK0gvRXF6cTRac3FU?=
 =?utf-8?B?azBCa3pORjlURHIya3FkLytvZHh6MVJEQ2F6ZDlUNnUzbEt6VE9Pczg3cmJF?=
 =?utf-8?Q?mRr45y2RcMAq4yfMsXAJIVS7PoO3ejkRzmBE+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451712c1-1197-4386-11de-08df4b1c27d9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:47:21.0859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw/T/Yei4VbYBfRWPrpTunOBVvHlmdX5G84wQ284hDCWPstkaUJTExm3pGtmxFz4YZa10zMDc7aIWV8RBeZ/pt64vL1jZtG5R1RBfwRTL2vDAL9bVbWIVPb5z1bu3jyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB390898

On Tue, Nov 24, 2026 at 10:30:47AM +0100, Łukasz Majewski wrote:
> Hi Frank,
>
> > On Fri, Nov 20, 2026 at 10:42:11AM +0100, Lukasz Majewski wrote:
> > > Add support for CBASE board, which incorporates the TQMa8MQML
> > > module.
> > >
> > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > > ---
> > > Changes for v2:
> > > - Fix the DTS according to the sashiko bot review
> > > (gemini/gemini-4-argon) Changes for v3:
> > > - None
> > > Changes for v4:
> > > - Use hex values for switch reg property
> > > - Change subject and commit message according to community feedback
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> > >  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 581
> > > ++++++++++++++++++ 2 files changed, 582 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > b/arch/arm64/boot/dts/freescale/Makefile index
> > > a80cccf34eb5..c14e5ae2e4a0 100644 ---
> > > a/arch/arm64/boot/dts/freescale/Makefile +++
> > > b/arch/arm64/boot/dts/freescale/Makefile @@ -121,6 +121,7 @@
> > > dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
> > > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
> > > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
> > > dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-cbase.dtb
> > >
> > >  imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
> > >  	imx8mm-data-modul-edm-sbc.dtb \
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts new file mode
> > > 100644 index 000000000000..fdfa2ef9a065
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > > @@ -0,0 +1,581 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2022 Fabio Estevam <festevam@denx.de>
> > > + * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > ...
> > > +
> > > +/* SPI-NOR memory is not mounted on the used SoM */
> > > +/delete-node/ &flash0;
> >
> > Use status = disabled.
>
> As pointed out earlier - the
>
> +&flexspi {
> +	status = "disabled";
> +};
>
> is disabled.
>
> So we do not enable the FLEXSPI subsystem and also clearly indicate
> that the flash0 is NOT mounted (and will not be as we don't use it at
> this project).
>
> Is this OK? Or shall I do something more?

Just remove "/delete-node/ &flash0" if flexspi is not enabled.

and ./scripts/dtc/dt-check-style report
pinctrl-name should be after pinctrl-0,

please update it also

Frank
>
> >
> > Frank
> >
> > > --
> > > 2.39.5
> > >
> > >
>
>
>
> --
> Best regards,
>
> Lukasz Majewski
>
> --
> Nabla Software Engineering GmbH
> HRB 40522 Augsburg
> Phone: +49 821 45592596
> E-Mail: office@nabladev.com
> Managing Director : Stefano Babic
