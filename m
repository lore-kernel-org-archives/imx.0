Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793907651;
	b=2TWSQh14hnwd8PCYZs7+wFSkst5zjU2Y3CgNY2hdJF9ERm0amDitsUEEJbPgV4JehsVP
	 MWDcT0CYzBIJa3L/LJbCUli1CbG3oxAyIRmT+4ZdJ8PD92YwsTNgHP7jo32SEThWzAtWm
	 ni8c6S4xLIwu88WDwphrRfXta/dGZK5i5TKBPIn4Qvr0IHBpb3F35zL3IICvAmckWlpN0
	 IFSdCq8XmCN+9l2wYSPqqNkLMcHm3NZf8Ab/DyiDKEGCjPmJe0353ma7rSDw1Sx75Xrz0
	 HMI5W8AA2Db9Xt0MdtI2hxwAbQKpGPTGEE2nh5uM1K0ckt5Vmli46ty1tZD9fyRIhkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907651;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=0EA9BHdJuW8pg/+h7yRBu2+i10XBfZULPE9VkRP+yz0=;
	b=J6nfFaUMKcSgbxIvIIVZKCp1UMYrX+2jjtNzF5XhG/1G6L4WYMfIcFB7QH+51UMtVUXs
	 rUst8gOdHGsHJp5Bxl9D6sPRif0NQYPYOPy7+MkGo/uVpwVovJlm8vZa6WpH50KO+PamK
	 wPIaDQc5HdPuhND6gqWepuddIqjZQWZFH+FbQMnxkc5Kkou2iZlXijSt7BM312KFau+JO
	 fD3KvS3/RnB97Jz6EHLD/6x916q5e+bBlPHLVe8nUdt98q6p6woB71KhcxU73kGyQYzJj
	 UYP0Mnx+Lwt6QE4tlU7o8mfv0MwOG70msAj8rfoRTa5GKWGQpvFwMb4/b9RtkVCvKZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cJQGHr50;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.12
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F596075327
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 19:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F596075327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cJQGHr50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzZ5nTh6agUgwTKTC3/3b14mJhMLZy0aDrfanOw3/JLmKpVOb9afEzjEM9YCVPl7YvJPCpHsUhuArHCp7zA1hksZiF0i8YfLekGB0CwgicauQHFvAXT9VTai3LSL5Q3eMe3xTKSzM/MdBlqlElAxzKuNbzA7gf9Ct0zhkT3j9cXLCMI5DH94Lahoo0++yqMgn+W/OmONMn+G4/M/cbqHnfuaZXYQq1e5UIlXhd7RzRrohn1QIiP8vcTpK6F0T7ZNrCCXBIeeeQ3CnoAk7Vp2pgCmz/3ea+z8QpFmjEBpQdAVrlnVHbn6bBvK5eALn4pp41PUmUAJVZM77Vj4sZJOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EA9BHdJuW8pg/+h7yRBu2+i10XBfZULPE9VkRP+yz0=;
 b=YcVouosyk0DZIPFAYJLdUaReCrp4DpXNHGKkhEv9gtfldKiENkHBWVjxhIODpQCMl1FLVAQwfAF3GxY4Vey72Tl/JqcESkOSwL5lyYvNogLsSqVLK7RcZLfsHAGR0BKmBN5Be5+UbQhH/Xik0NsbVF53q3GrBLTa9TOm2MYJNAb8+1RtjDSwl5NxUJD7my9grVLWow6dQYvt1eSfjyV3YcP8Ms18+/EoVcDGheNIw3sgYV3legJOoiHfR7GKM6Dx4NdXQokOYI/nUJogdh84wbXK2Z4zWmruxuJ7gZqaIHHChwZzcAHxkeLaQBFkgZLKrBJF7hsU+lkyIQpnvWlx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EA9BHdJuW8pg/+h7yRBu2+i10XBfZULPE9VkRP+yz0=;
 b=cJQGHr50QbGnCfQ/EyhnlprXn+YpVVsGXmfUVGshXZNK4deX1Uxwtih+RTfjVpvrq652hkz6NmFVUSUQHB2jT6w8h8WHkRtDWeW3OlQY+l1RLtGPXFD7vvzFKvY613TJls83vTU4yZBOdXCSre6lSVoxcIvvvgZlA6C7Y8WSpSAw8R4vEJctLO7aDAdZR2ng2HsWqhmlgAr87v6v4doy5/uedTC6/d1xEpWuwBXbsRuDxmJ3MsyBbTtCklheY/JNn/EMAAaP8dADQIYr6s5x9oibMq2DRI7/LGYtj4O11/qWFJBtXtm+PgdMngoIif8XPx5Pb9kuIBbubgRTnjOXbA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU7PR04MB11090.eurprd04.prod.outlook.com (2603:10a6:10:5b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:40:47 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 19:40:47 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Thu,  5 Nov 2026 14:40:39 -0500
Message-ID: <179390763565.1625156.7690806798973870431.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
References: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0041.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU7PR04MB11090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c424c62-53e8-4399-4025-08df3b74b09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|11063799006|56012099006|261009223027099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UEQsWUHaBFixl8sikr4mCNx73udi64kXoPuE3NRlNZqQUur8nJLXzEOWHGfcEeeO1XHB9W7K4V7vI1qRHAHuUZ27InHFFOuVCB+acg58wmmH3gmY6WXqUiomlRbIcdr9cWazb+nJTdMYKa8JBd1wma0mWseNr77wiZIbGNShCdABFEWQKRAu/BEykFsFKtGeQ82BoDTvWOyRT+1rQg5xQoGlsp9XrdG7Zl6GRkzaPJQSliEujazxkf8OyxFJlte/3y4KotJHOug2hIAUkPHMTCWUzC4JDgzMcn1t2KOsWg6FU8Z6CBhpV3vaxbKGlbwxu7P4Uk92IctQarjy/pvapzAUuKaXm2WULURr4Mezc3YaGvXfa3IPSFITEHIo4pmMpZphFt8lIRWNM0RMttwjelPuGX/mIbeex6r/ScbefKwSdzmVi9o8x1bP+G+XlPdvu76436qMQfGo4GP4/+VC3hotCHP6eB0O8Zf7SZSm2GTCuRrLhZemLd8S9grGh6tUPNG1YWP+Jfxwwe+XheM/l/WkrVeAQ7MG4/Q7t0+A8ojcgeYHvjaUfO5Kwg7q9YG4DwJ8o80wTp6fmHLIXq59+0PO2unuhGIV9Agc1ORjkYtcREzSwhAMzzjc+WhO65AD1R7XmDadE0spzGxEVeYX19cvQKZ3DS9Qq3+7L77OkAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(261009223027099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDlQNUw2SUtOajdLMGVlRG10bkIvRVVVUENQajFvS3hCcDV0LzVwS2tQY01r?=
 =?utf-8?B?Ujd0cTVQeWwrYzNaVjZmMDM5aEl6RjlTajZYTDAweXVjL3JzZ1BZcmwrdTJ4?=
 =?utf-8?B?ZGMzSGpmOE5KOFBUWjhFTlg2c0ZjMFdOQWlNVGpqSTRWNWRBWlR6WHl2cmxi?=
 =?utf-8?B?VHE1MjV0TkFQL3d5VTRHZHpWdEE5cFpRYkhPZkNHWitubjdYUldhajdNZm1F?=
 =?utf-8?B?TzZqbmdqWkFxZzhWRFhyb05ibjErSkx6Q3UrL21nRFJuNTE0OEUycy8zbU1z?=
 =?utf-8?B?UHh6amxYT3AvTTRMUCtyMGY3dTRGbjBtb20waTdQaHMxejg2ZGhib2dodEVL?=
 =?utf-8?B?QUtOYk13czZsV3U5N1BaOEdab2U3aTJBY3g2bk1zMHk0Mm1TdHZWREk3WDRE?=
 =?utf-8?B?eXJQSFlwSzVLZktHZThCS2JzcXhvSHozMFJYNnFRL0tFOUh0WjJoNzdXc3ZV?=
 =?utf-8?B?ZTBITDM0SkFHeG1rKzlhMmpFVklZQ09XWS9IZ2hZQjBGVEtHRlZqVVdNdGlV?=
 =?utf-8?B?RFRrYkQ0MFB2b2lXWTZGajR0QmV3bElrQlBrb2ljb3JPMzl0ZHFpNy9Jbk9q?=
 =?utf-8?B?VjRsdzRBaTBQWHNCSkczVTR3Z1NlYk00T2EwVVJKdE5vWTNYNmNlQXVHT2t0?=
 =?utf-8?B?YVFyUFBBSXV4Tkl3UlEycGdEeHhVQVhhSC8yOGxWaitnRDgwRWJ2WEs0KzNa?=
 =?utf-8?B?TGZ5SW13dlNNRE5BRmVUMjZTaDNKVE5UM05sYXREbnhsYmQ3ZjNaWlVoWUwz?=
 =?utf-8?B?ME1VWEZFeG9DbjFKeXIrUlNRNUlwK1BJeTJaL2QvUytnQjdVeUFYcnVpWkZ5?=
 =?utf-8?B?c3M4ZGRyemNEUUpFZjZwMWpkZVNGVmhPVEE0a1Jjd05wa011a2NxVEtCc0Rn?=
 =?utf-8?B?R2hYLzZTdE5QNmdkVitUQ3c5S3l3eFNRU1VwNXI4bjJHMENOOSt4a3VqUVRS?=
 =?utf-8?B?bngzN2NJZHpIQ1dCZXROOVdTOG9VSjFHZGdRb0IzejVjbzYvVXprMGpxOWdC?=
 =?utf-8?B?UlZXRkxLYWtOQ3RNcE5UUzQxaHRMdGl3ZzdSUjV3Q29tS2RUMXh4OCtFZHU1?=
 =?utf-8?B?TnJxazY4WUQ0UE1zOC9aeUhzb1hqQytlS2ZlNkVvL1hPQUcxL1JHRWFCZVAx?=
 =?utf-8?B?WmNyZEUxTkQ1MUtJbVk3TzZwRnhTcDhueEpGTzBDRTZSMU9mWndadk1ST3VQ?=
 =?utf-8?B?NlpsVHJRMUJSNDNQOVZ3MmtLVWhTWWswcVVCeFd4R3BzOGhZWHZTcnlsZjMr?=
 =?utf-8?B?S2ZVVmNhVDZZdkVUZ25YRExKeGFpTk1WZnBDUDExWW1NazlwVnlrdFJLbWRY?=
 =?utf-8?B?bVkxZnlQbVRCelhnWjFROVBQYkVpQ1FUcks5MWNjSDlhemprZUt6N1k2SVdy?=
 =?utf-8?B?SExHeVBndG1VZzFjcFlzc1ZCQVllRjlsTTlrWklra1hZR3luY2tka2xHSWhE?=
 =?utf-8?B?Yk8wcDAwSDV4V2dNdG5IWk16MUgyQU5yQWhQUktGOE9uaUpmemEwT3VGUDdZ?=
 =?utf-8?B?VGVWMUMwWk84RXhneVk0UzhjUzJWVWNPYW80TWhlZjI0Nk4ra2FiWVJLZ25F?=
 =?utf-8?B?QW10eVpZSy93Y2pFcUZ1QUU1RHJmeXdTMWZnVlREdGlHLzRjcWFFZFdXaVRp?=
 =?utf-8?B?V2laOEJ4cUF1bkpOSlM3N2kxSlVtWDUzZS9NZTdPU0lDZ1V6TnpRdFlsS2Fx?=
 =?utf-8?B?a1FkUXQ5b3JreGRPNUw1eEZqYU9PNGI3TjZ3Q0lRNEZRcHZ1VE5FdHcvam1z?=
 =?utf-8?B?bFhCS2R6Nlhjd05QSWlGQnRBcnF0d01HaFJzTHg3d2xDUGZoTXhrREd5MVNn?=
 =?utf-8?B?RmhDa2g4QU5FeVB0aWlKSG5SWWdhTjhKOGVQblJmVW1qT0FUOC9CN01XM1VQ?=
 =?utf-8?B?UHFCT1EzemUzb2tiakhQdFdjMkxHdWhGQkhxSkhFNmNNWCtUOUlNY000R1hk?=
 =?utf-8?B?WGx3dHdlbW5ubk0rZ3puSVFNVDlMbXUyL25kbDhKV2tEcUFrL1gwYlNrdnNa?=
 =?utf-8?B?dmpVTkVDa1hkVkpOTnRUb29za203dmpFY3FpcFVES3FscjF0VXVtM1N0dHlN?=
 =?utf-8?B?eXpoVkovZXQxNFB5RXFzZG1jYXY3YXhnZHI2N2xwaXhRMFdRaGlzeVRGNk5B?=
 =?utf-8?B?RUJUTWlNeU5jcVlvSzFqM3RHM3FDdzV3ZjlUVkJDNDFVVEI0MWZEa0hQMWJW?=
 =?utf-8?B?bk15c0I2cUtqOXFmOHRzam92QU0yWTVRWm5JRVNHc3JYcE12aVNQRDZkVUVm?=
 =?utf-8?B?dDBHV1dXU05wRm1kMUxqUjFqUk5vRjlGckswT2t0Tk9sR2VXSnBlMndBckRt?=
 =?utf-8?B?dzlCN3d2dGdrZmpBcnRZb3VlVWJqbmN1aUM4WVhlSklxTFpGVDNCYWUzWVUv?=
 =?utf-8?Q?wTuVXlXbsyfYR85hj+Ovkor7BPci0j6jG12SE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c424c62-53e8-4399-4025-08df3b74b09f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:40:47.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuZiGDW3gKL3hnfF73m+AazIp+IGJujRB0jMYbRSPGELrbLjJbgyDj9WmwnmHsGC/YtrlCwY36n++lzmbZ2fZtNgbUTAHWV58YSqT/5cfMeBbTmGyZ4WQSlk1G2tHt3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11090

From: Frank Li <Frank.Li@nxp.com>


On Tue, 27 Oct 2026 15:16:30 +0200, Laurentiu Mihalcea wrote:
> Add and enable the DT nodes for USB1 and USB2.

Applied, thanks!

[1/1] arm64: dts: imx95-navq: add USB1/USB2 nodes
      commit: df96ee165d0bcf3f50526e4583e849ee01cfbe7f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
