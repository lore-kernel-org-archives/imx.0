Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E602BEC3A
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395972; cv=fail; b=n2COrNCJSWb1ViKaGcakO1IgzQfk/RlyDWRv5Ly69ozhkbUCFzbfmHJIdQhSbkIgAgN6Goy2Jab0zWPUeTOO7z76KH5/QiV0C/upYgffDhOM99YNofDDnjoT6OHuXsk+R4CbUsLw5XaTGvWvjMlvxQ12s+AgjNo4343JHtjylyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395972; c=relaxed/simple;
	bh=0LS+qPgat8/7AosxFof1pR4TkBNimwCcUbHkeZeSaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IAXDrJNlS1TDma16mKnRKpurcSaQzR34YQ4f8Fh0PLU2qcHHgkt9ffnXDBEe9Fg3MZqVXHwIyOCcSugix/qmgWcJ3+6Z/slPIFaPIarcoIRy91LMI5QzziJgesSplkm6bIexq/mOwoSVO+Za1QdFSHzIBv2lentdxSnCap2LXtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M+haOUt3; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M+haOUt3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXd9OIx7HeX5Con+wQm9xZRCug6CfxfZ8/T8EVJ7nWC9Km2cfylACO+7Fgv7FOQXQTnbGaL5X+PkWKklOK6RUKnHLjlGRdVt5vbCoU3K3vUfBa68CQ+f0pI3BFsJkCzgkEurPfudpVc7lek0m8rcAT08hl3cYfqXW4TEdmXrDoMr1VgNXUaC2SNfH1Wy5mo/h/h2LEoY0tuE5YdqEJKho7DvCcl5n+BPEWCew6FEqOUnKuFUoO8I2cpo8dEggIWeyNWJMx6ETz03+6/TUGNptDvlvhdu6/lX/Vjlw+Hd0lBTA1+F0TGL9Z3M6KwbHewZ+p5EdcajTt7bxJgYCy4lgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMQM6LBpVQQC8+RtDd4VsIjqshBW83gDoI+P5c4/3WY=;
 b=kwuZ0XJ90oOfGd9oIb+WszWtSuG06Zj3zR/Aj93kL2+oEdy82tdycKWXIv1yV0NmeWqY/mrCsq/SsatYK32sWn5T2UWkacyAOnKgBheMu3OCArD58MQoUEs3F8QhuXHxH166sRRXCazPs8TKwBzTpylXGC4XVWWY2CM9ETu82VJlrb5hvkrByKHfJ1nsVMPpdLH9t13394TJItoAEOb4NaiMxESp7Kji3g+pBnuD6QpE3Ls6mqXklj3+yHpBxWmPpjloy2xtr80GLTv7ZOLeRNJ6qtB6zyl3Xniz+iprcPYv9qT72Pb/PKEYCcLkgaUCYN19jREQf5bkGlAG0DhDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMQM6LBpVQQC8+RtDd4VsIjqshBW83gDoI+P5c4/3WY=;
 b=M+haOUt3lG79Ya4XBH4wicbbGL+3IvJOHOqWdkVaoXnv1DZBo3pdq0UbOEIlrBq9Wi3Fqtz0DwJY9DV/xkVMxBT8u3s4Mcf6Wv85UzW4a2NSe30bqLA9zoF8KbT0citjpu/ClNgZkR64mRwd89/NH8V5dkrQik3dI4xmSktHXa1PqgWHrBc6gAr4Ds9sP/vYohVWjzjjYtfKlfgzaIMYv9DgDXHN1M1MV/ztIshPzE7Os3zfMNnPBLKGwpk8ZwSA8zI5mR/FAduWGWpU8dHTuZ7txr+sluzQTySLoL9rKjJ93kc9vEH/XgLuUfjbaldYGPMdMY3oQXR7YEjExmoKnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 16:12:46 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 16:12:46 +0000
Date: Mon, 17 Nov 2025 11:12:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 5/5] ARM: dts: lpc3250-phy3250: remove deprecated
 at25* property
Message-ID: <aRtJdTMxFaXdVnvs@lizhi-Precision-Tower-5810>
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-5-Frank.Li@nxp.com>
 <face044b-01ed-4077-b497-3caaccf57c98@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <face044b-01ed-4077-b497-3caaccf57c98@mleia.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 536d9bdd-240e-4605-3b04-08de25f42565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d+1EkSyDg0/Y0Pc7WRPYCh9k9kmXPkwNhgN4lTu0yKnHLMZogR3tLUVO33Kh?=
 =?us-ascii?Q?s8eq/5GwhSznzmwTbqqM3Oqaf/jscFmGHM1w04ermEHNemN/VNdgFJ6ab+zF?=
 =?us-ascii?Q?q/sQy0vLSAPHFkixe2d4L05u6FPiWgSKMuhcrG/y0HprQ05Gj3pNsTH8arMt?=
 =?us-ascii?Q?/7ZCc088fTK9vn3q+EoMXl9ega1g9HYwuLG+DZtTUIREE2AUUt0AbZO4Z6XW?=
 =?us-ascii?Q?TDGLFrJa0W8LkOXtO6WxPNHx9MCRJlaCaumh6NwAJReEHwKv4Jd/oxNSeudB?=
 =?us-ascii?Q?YTBAbC+KYeHRb3dkYNZLYOBnjIjYpno5bhy7CPb9YHrQzJhZXLZAAR5QBpmp?=
 =?us-ascii?Q?gArbbScKqkbsF1lKJ5LXGgTsFjvyYWctYoCOc0R6KIcan62iXdgaEtjgEjPz?=
 =?us-ascii?Q?vW9H0B/QSonIS8h0sbsapJizpGtdBsdf5w9kJDn+jdQ5z1vveaUYBGBv1U4I?=
 =?us-ascii?Q?wOxETwXL1r/E0Bn6w8drXX/HcjKcDlFuomzOyyImXBGnBgnslnn0/mfjtSVM?=
 =?us-ascii?Q?E5wUMtSHMw1g9dSauu/CnnF7mRxN9GgwCBIirV0cwz86LB4z2d/r9f64HHrc?=
 =?us-ascii?Q?wWvfy8AnAn4flSvat7q8y8JxhfjG/XnclIZe5I6GJSGyJepIF815Bzr6DVZq?=
 =?us-ascii?Q?79SVdMIFuH4PTSg04ip40NXCdaSBFRsbvKgm1VQDL1QaNSs7R3hLdTkbDyrN?=
 =?us-ascii?Q?lZnqr4l2L2qvvaRxzgmNkPfDbDz0wSVX+02vXBmbFyi/Hy0jGhWRESx8WudW?=
 =?us-ascii?Q?BYHx34p9DnoC49ZHqJH1mjWJN93Wq4vXFX4xuEtjZP2INe4otZjCwsposXLm?=
 =?us-ascii?Q?f7b9zrYF24bDpV4622Q1D5fVc7Y4uOLMz0Ae//dSJhL0JJ1wiCD0mkmWiggK?=
 =?us-ascii?Q?7B/okO3ClVeG8Ud0YlidgBJtnTCGKsAr/t5y8TSESHdUmc6P4LongZNep4wv?=
 =?us-ascii?Q?dOOgcjRMKzdWIsfoPeZe5fPUqkWKFE3Xr5pPBfn4PdgJHm+a+5+wg3bXFm6p?=
 =?us-ascii?Q?RRmDxVYYsz7R8n8jneRk8we9Gi2KcYC5UZmzVHZFF74yA1cNaJn+E5v+o6r7?=
 =?us-ascii?Q?3PR1me+Bjc8fV1DI1V4P810m48n1RPiiC3A+c7VjKcbOjFhUsG+eQjHSMxoG?=
 =?us-ascii?Q?cIngoEmnX3YkFZZRMTi8K4F82TTs6YTCAbf8B0YCh7UZFlX0xnyWTaWfnRjC?=
 =?us-ascii?Q?Dfh9xVtnpexbmbJffY2S8dC5A+TzPSzT2DmA8jJuAt98xjNGpdRxyYFOHck4?=
 =?us-ascii?Q?IpzFDGjNBXDGvGnkt8YCyc5o9TBTN+jAZwmzqxsZCkRRYAu/KUzgetJAGLLp?=
 =?us-ascii?Q?FP/rifKs4MXmHjxvaOTCRlkUWa97CuRp2j4iqFz77p4DyeIy4koKuCh4mnOq?=
 =?us-ascii?Q?EVKCX1ajKkU4NaQGtwL1QnytyjPsYKKP38l28njV4YoFv9FTwnAzhBpc9ci6?=
 =?us-ascii?Q?dIqzNHnv7vPyMBSRvc/5/L+r375sSma04oLMoSecakNYoUMYjbL0/4mSaky7?=
 =?us-ascii?Q?H5OkSlxcf4uHy4cc59WrAJzu0t2GCrF4AZDN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJNIxtpY7sWWTsjJ2l/LrGXzA8ERQKSR1hk6QFneWn9BX6AbhEE5yI7iZ1ET?=
 =?us-ascii?Q?K38wEJQ/Z5etIIsnUi+Dd2i+yYU/v4xwmScWwkETRnqgxNurXro2O33CTyu4?=
 =?us-ascii?Q?r0pHt/jCHj9BySPoDCZFFP+b9gMiBq/1Igk54YbQBiyY7l0FJwGBzbkVA6uz?=
 =?us-ascii?Q?1kl24LHFaEE3pJ/UiKdWqDq6J55+bgB7blp/ep7AgxQLunFoc5Q3UZwb0FVz?=
 =?us-ascii?Q?otDKnCrzL12AlcdjfoQFM4G2WHMQBSkmpvDIebon2rRzGdpbZw4ZzvK+lWZD?=
 =?us-ascii?Q?e+/+MPZFu4H2ZKo7yo3LGKpMVeyl2VO+DH9arHVHgLwHdh2dVzrhmL26oizl?=
 =?us-ascii?Q?dhqHIFqU+soKcC1Sjh30vKQqW2Wh/xTDjsvQUj4h0/J9ZcNT5gASDF5I67w/?=
 =?us-ascii?Q?ujbz9b77OMJXcoNbk0p0VtJaPeg17f4qqVRGfbVOk6QtfhM5QZSKRL0PkwaH?=
 =?us-ascii?Q?bzwPU72vbE9JXyU3oYvQgNnMKqIQXvrE+wZ0cMv1DDUgZBTsaozKN1dhv8Bf?=
 =?us-ascii?Q?eqWGJ4/1buhI8rnAqL0JZXTRS+Yj3UdINlf4bV/PvZnhp5PguPvuekAnwCoy?=
 =?us-ascii?Q?G2M9vj7eQ8vDkjsQPNp2IcqeuYOyofchjU5n3VpeTK16E/li5Q6bt4Y7E0rk?=
 =?us-ascii?Q?crq8vHuLOebmeGvQPXDugEOkowYm0y/nvfwa+00RD4Jop1u3QzteNXjGdI5y?=
 =?us-ascii?Q?gLAXQDw2Z46F0z5hVCiwMCmBmVy9WKhyVuIxMMYRvLrSfwHIPlZsKL9qxCxp?=
 =?us-ascii?Q?Jizq9YCAXqP28t7tMVgR2TK27l/vTZ/dcKsuoLNg/WbDkjeqJke9dEdi1KGu?=
 =?us-ascii?Q?Y4ouU8rB8H2ENykgqkURcSWHeEdELihiNlVMdwvHHx99Zng2uHzY7ZEIYf1b?=
 =?us-ascii?Q?iGlz0Ow9a1IMLKJfdrCznn6Ub91YryIB06TmtIr76Wil9qcq23E3Mq/jesMT?=
 =?us-ascii?Q?h0kWqzWiSJ9bYWGU2OaUq15lwIjBbPsZjQ2qDbD2pD8zjsoEqPUAfi1sQ2DD?=
 =?us-ascii?Q?FiBzM0TePtAkyqvoQcjCJCnDEuys76MxnMKNcedWHqLJMgCJwa0dXFPiGU8b?=
 =?us-ascii?Q?FFeIPSWFmWGgwG3LyqSlhO62fJ0HFoSHSsPW4W7gBEzg+/U+X8fa94szUYYD?=
 =?us-ascii?Q?DGkA35H2/jaiJR2ZPmq7ikJjDw4k9+44tmMfZJW/+OBf1w3XaV2w1/LzIKP+?=
 =?us-ascii?Q?hctHxcFl2euCBvTpI3fNTWvPeRwwPOv6gUAk6xPv61mi+SKzoKjyyl94WD1B?=
 =?us-ascii?Q?UGBIkC/hEFBa7ICA71rZBard5fcJrwQWoPGWY5bEjSNi93dMb9PjX9MdtnvE?=
 =?us-ascii?Q?mAbEor5Zbep3AoLMncF5jqnwXBdJEENREJSTEc/u93QYk+saOD6ChV54mPR4?=
 =?us-ascii?Q?CkyE//wIz950D3FZawPsWZU+dqBhfcc3usA+qAhZmdXaEq01mFWiSsoMLCMk?=
 =?us-ascii?Q?O7IaSjfCbp8zj8CA7OsLA7g6dAXmk2aLgk56HYF0Yl5zdy56bsq/OD1XAoxN?=
 =?us-ascii?Q?/E5sPlZCuSFLF5pCcvONSdUeL2bdMTRfQxQhhbZs1zT/29raLVMN2RuYQTHS?=
 =?us-ascii?Q?AyhfSd+x4+9CqH62jkN+A+rS2p1atQTt9gPlhmZE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536d9bdd-240e-4605-3b04-08de25f42565
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 16:12:46.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M5sUzm5v6hWQOQPhBvFWCcuwcpZANYAXZXeh3k90WgzozntyOiH5g2mBrdCKl0/NVgaRvQS3c2QSVAURmtzKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On Sat, Nov 15, 2025 at 02:23:50AM +0200, Vladimir Zapolskiy wrote:
> On 11/14/25 19:47, Frank Li wrote:
> > Remove duplicated deprecated at25* property because the same common
> > property already were added.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > changes in v2
> > - new patch
> > ---
> >   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ----
> >   1 file changed, 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > index 15463a96938cc..0f96ea0337a1f 100644
> > --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> > @@ -213,10 +213,6 @@ eeprom: eeprom@0 {
> >   		pl022,wait-state = <0>;
> >   		pl022,duplex = <0>;
> > -		at25,byte-len = <0x8000>;
> > -		at25,addr-mode = <2>;
> > -		at25,page-size = <64>;
> > -
> >   		size = <0x8000>;
> >   		address-width = <16>;
> >   		pagesize = <64>;
>
> Just squash this change with the 3/5 from the series, or I can do it on
> patch application.

Yes, you can squash when apply.

Frank
>
> My ask about splitting the changes was about a separation of the 4/5 change,
> and it was done as expected, thank you.
>
> --
> Best wishes,
> Vladimir
