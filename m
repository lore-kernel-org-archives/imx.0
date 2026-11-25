Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795635445;
	b=33m8Ra82Cj01JgoHWCndkymDb6PR9t4mgIvvWG2Lm5BOaezlR7zOtmgWhjySRY9RcAkB
	 XeL0/xPfI2vxY2fGsf8kZCcaroj/jWU4Mf0DHIpp4fJMIzQ7Q8u0e+rvZuwel2lTxtoM/
	 p5tfEL+NwuVaH/FK3N2iFezN4tMrW0c1rW1bAnL/Q/uSAbhNTyWg2XFpYyYSDI2/IKo4J
	 5CsKMNIk2/T7S/1xYIv4oCgk0H3EyVEDzovZrYjuGCQjTRGOsEgn7kGnpKlkZEQMnWAjk
	 w1i0FnTWqUYID8KcNrF5dtv5ZcJgvYWGkfdudJJVv4BXST9CVBOuZAjr9yeOB7Udy0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635445;
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
	bh=0ZGk6pHsDzYNq6XXNAeCO9uqaleGWSllomdqlMyf7IM=;
	b=P+mKF5Dhtc6mh9jN/6KbDev+9XQRqqmXJuJUz5DPF4p7VfEk6LLQ7GisY8Yd/35B9sM7
	 ekSDisv18RMu3OqwiR1S/bL1B8I0bgv8C+kLVE9pT5WY/tb3PKIuYGSTXkx0Uyp0Rdw8e
	 yKy2HGDEVKKrZ1wPkMMOVs3XlntGIP6mMpdNVeXuOK2o0HUtbrMfVHxum832ZiqMJk1S2
	 LXme6C62GrcRNcDVWpQouRjtW4ulsFpI0l8/myUZ3Ag1IYsBU3r7oIEph7pspa4SJ5G7I
	 27w/TgsPPyHLIoS/8kC+Ox0IjNDf+VHX3jKVV1DevGSeRuF4jidfihVcm9Bp+iMi+5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RLSPiJm3;
	arc=fail smtp.remote-ip=52.101.65.9
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87DB606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 19:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RLSPiJm3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycY0lCxzDa7uhuinD8ncOBqfNz87x92caxxt7ay79Tbhi9tFbuzl79K2Dn9B9YTIhDY36dI4AwixjLsDMrMgRUdZtii6cHYp1YbLa+NrT6jzZtbUMrPDBo+cl1MK0CSGGAJHVo9sFEgW2Am/LqJ4AWDTpcvVJmeYiIXMZM5qpJ4kTjjaCXjm8htcWvWYPlH6fbbhIGl5binJROIyqvkQSIy2QIkxpOT20TBm4PjyqhvfSUXdCNbXWFObQjmDofsg06giMhuEXUSn71rjTrc6bhzTa3WLshlE9dqptY0arJHmaEVwADKzf+dSHw4m9+2+Ct6RkenVTNDsoXw5guRkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGyqogHU300/drFrM4sNEmFXB6oM/jL3gCEqeCH2DC0=;
 b=ChAwhXAIbgAiiVfJnMcO3vLNtj5HrGNNSu379IR5+NS6Tuy1cYCpO1ldk8j01PIDYdwLJlUdE5RSn0RJovadaTcuSlEtsJsH1TIphFnKPmbRQXQ+vdfwnJswa2/Y2Ih76zD5JPDJB5SZy4Xi+Di+2H8HfYL6yvCgjlSmYOuxu+XNtrsFbLPO9mHKZ5ALoyFbH7IzHq3EmJeQzryjG/7UODhiIC+kddkPIgkw8T5YlTpAV+EIXQ5C5oDuhwgCXK3Lqz69sWJRf8znvMb9bpebz6ZMvoyODJu7MXY3BJPGat3xK6LyGuqrPfvDqLoyJYdMY39h+NXy2sUaV+pCQ3RDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGyqogHU300/drFrM4sNEmFXB6oM/jL3gCEqeCH2DC0=;
 b=RLSPiJm3JUmulxBKTm4yvGRQV8fU08zspa6tEdY7rmwj37HpoGfjSqW6zRkcDrdgqsYTeFGXcBvVSyohKsnCnVHmj9bxeWtRsgin6qsb4ubQyBttiTcKZyWTEpDb2DyNjj3auOPdxI7Wrct5Cmgbs2s38E7UGazIOFwKl5mraXJ71OX9f7R8CAEbGSsCNtKbwxTOQ8SqAZN/Iqy+B/KvJMqR9O5zJwGTrCwcJSZ04xCfaLWxswbYwXLNsRCe1Bqm6iC9sH2o2HLjJoLwAeNNju+NNKijmcXE0txi9UTi2rL2J9od08hyuRgOXhmcsXTOeqr/4GshOwovnCKQiV0UWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:37:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:37:19 +0000
Date: Wed, 25 Nov 2026 13:37:05 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
	"jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Message-ID: <awc44XyssnfAyyjs@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
 <av9iadpXveXGb0R0@SMW015318>
 <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <8624fb6a39e5e13466882f01ea54842252f154af.camel@collabora.com>
 <SL2P216MB244180F5C6B16CEA1CA94589FB432@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SL2P216MB244180F5C6B16CEA1CA94589FB432@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
X-ClientProxiedBy: PH7P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3660842f-c80f-404f-480d-08df4b2b849c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|6133799003|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006|261022075727099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021121427099003|261009223027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	oq92TcXIyk8wlgc0csoKjvYt5wJgGeACcXLArltwzHiLWgvKTTueYwQjoP/0QJqMXRLaB8aXNkC5A9v85nsA1VoWZWlmFGo+/T8Hrj8Gbcwn7OSU7i/NGuqD2f5/Omj+wkycMnGUux9xF/jblBw3xy2rnTMmhHatI2gw0ex/rB3F1HqV2DWu80TTk9Z5L6a0ysocsf6N64ZVS0TnMnHdRWfz1WNj6gM/oyeVmWnqv5zdOguXx8cdT11hVOLkatiIJbCtmjdAljuK1s+ZWCAq3NbUCqBgl1/JbaD/e5oYOfuv7XiDYb7i4zn1I14LeH5LHKgKnqcV4qI+lVp3LJeyz8JgiM0I4L7CbwbDatZ59h2ln+nqTcE1ZHXQkZqJ7ERH/5Ef8w39OgYIubEuucfHxkaR2E2w+vwrYMyJ7zIt9USWTDiQQn8J0n0LKBGFFxbRN/+wk8uZGK9D6KB3jXS1lBmJPeYVW1R0PsQOFo1YdfPgNXVbDqwRAE0yelmfvdCpzYGWX2G628AfspfqKb+DNzFM+qXBSLSjO616D4JpSXGGCp1ka2K7bwWePMTAJZXCK21q8pqds+c66nJnMZWwhVNPf0mm4jUZr7oZ+Gw7sKqJH0erSoMKVcw4XdJpumBL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021121427099003)(261009223027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?iMVVzTVY7sjTH+dziKS6tq/d+M9cGAcPJES0u/cLB7Vb71Z3URAZ3YsiLq?=
 =?iso-8859-1?Q?lWfSTArTEPoGxuMAUljZeDHgMYZmBj1DOLGi8zE92AY/z6VWF1FyUtxdF8?=
 =?iso-8859-1?Q?dt11iE5+giYeN+PrEK2rUoZQ75wUYKrF5mUHRtmV9YNPklZqOpwQqUQ6Rh?=
 =?iso-8859-1?Q?l+sv1jnpo+WDuQQXiKGboOjuYJPiO5PyTGf+6FXeaFrQ4IVNq9BbH8uciB?=
 =?iso-8859-1?Q?8OxFYcBRZ1z/JneUdvT/nyti/CAC+WkrBWmfVFPtQwek5Tu8m6nzt48yZb?=
 =?iso-8859-1?Q?Cz0/hFIzo+/ZBrNLRiCaOZXQtSqmbJY3B6uRUqpQoHSRIAQNUAsM3w5c0C?=
 =?iso-8859-1?Q?mx8y/ykzZon1XgG4M4UlXWiGZfDCSprQ4q4DZIBOJkM4PKsNC9FSdBBmew?=
 =?iso-8859-1?Q?8C/7f5WmBhMbUY6kpZqUZkTWWFb7523e6fpLFaZJDwA3eLv3oGPkNke9CB?=
 =?iso-8859-1?Q?AR3B//DI8Z+syVE2TMR9vIWqFne6P2UJJLZNYJw1t6VTBZtSwjPvCcH/bz?=
 =?iso-8859-1?Q?a3pDweJcu8u3ISgFCXIHuW5K46OgXJu422+CH+yEYJcCjc+giX2BwD6q3h?=
 =?iso-8859-1?Q?0QBIieBnJZZcJ9D9G8YHVQgsPxdNoAh5Uz3N+o9B5PgYCOO71hQ3wn2L0V?=
 =?iso-8859-1?Q?vA31LQD7aYrb/mBP/U+OjDyncF5TePocwW365QxlkEQKc8/oXdQTilj6Cv?=
 =?iso-8859-1?Q?B76V3DlyD0zjHt+Fa0gZXHBTP09XWoo2GtVFh1PCuk2t/3g0nkxUXU+EpA?=
 =?iso-8859-1?Q?49jSVky02rAoFy7WjrIBE7TYHDBaaW273+/lQn0+V+a12j18maj63EfWaZ?=
 =?iso-8859-1?Q?YZ+lHl+e8BE2mgEykj7uLfZyIHetdtzvw1AlapTA6BPgUpoVm7x7+J1q+I?=
 =?iso-8859-1?Q?buz1b4AvgMd+K7J4+IeJnAfT1joUggnftvuc4IfrmtfDtZe2JIOBD9vpX5?=
 =?iso-8859-1?Q?Cp24hTvt37xS5rA7lBc5InQLzVSs2hn0yQDBpUDJ3utYNqw/QnkSeSWNLy?=
 =?iso-8859-1?Q?+PJ8xeV89tbn0vFoxyUT+gyRyCgrEoXKzpeW7yr9MM0dyI9cNaKpx3kx2V?=
 =?iso-8859-1?Q?mb5YAjDGHnAFF9C8A0IeZjYywgePzheYhidBCfO+e8CbnRrDjHO5OeLPmf?=
 =?iso-8859-1?Q?BH6PM0Rq34w7szxNy9+okvtnSIktgXRmcjlMpLZ73fcXO5fNZgInJTA2h4?=
 =?iso-8859-1?Q?OI9ZQ8rMT50HkDqJimLVK3coFh/08IELHZ/xrOF+HMSRzo6MWAsqWXbi8D?=
 =?iso-8859-1?Q?jmM5jztKa48qU2TAllBCZP10q/C/tB8UOU6WLewnuSz7kolHSv3La+Wmqi?=
 =?iso-8859-1?Q?RTiwpPsrlAJ221Ae4QIfHnjtD1rRH621Pm3/Yv+rA0feusYrzx4rRWHl6k?=
 =?iso-8859-1?Q?Wgq4Qi/z3UHXJfxQ88In7gg4ygRc2Dr/bnxcbx0DwKwzfzWXNjCx7WAn+H?=
 =?iso-8859-1?Q?LO+hNMdmC4EUdwNbJd2cFy/+1ifVXnefGpMWiXFQvADteKETvigGlJIk4z?=
 =?iso-8859-1?Q?SoeDSc1xGwfcPeN5vSSAVgxcNYkI9nZZpgtQ86LJN7iRhD7+OuUIy/8FIR?=
 =?iso-8859-1?Q?lIT8mPRVzVCL280sT8AfI/VpCZE80sVz0NEvi3lOt3P1+odzVIPH/+FG9D?=
 =?iso-8859-1?Q?5h5d1yxiGjRjHyDOZUzanWWKb0aaRGLtSKTx+K3qDhlP96TRZ1RBcHVw6U?=
 =?iso-8859-1?Q?kPWwxIt5duEj3Cuu5eHIumbpOc4bc7e6brt3ski7cpAoiZxh66GF2SAVZd?=
 =?iso-8859-1?Q?3g//8a0KT3obQNqm76kO4v5SvDOKCTwMHDpwfr7+KH8Dn5+hjrqWvLgF4T?=
 =?iso-8859-1?Q?YjM82OdJnhgCrVwJ1/L8LGTYBA5988zjVLwlg6txLfcC3H3Pmhet?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3660842f-c80f-404f-480d-08df4b2b849c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:37:19.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN9810hmuMyu9IguhCr5TEiD00VFr4X3y2UF5HzObkl0YIwlmrXl/BDah/TNPT6NhQ1lkNUMF2sqFqYaAnZpK981ZTD8JEmLV39SIJ9l9oDPcU+uF3uN+JtEzravCaGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

On Wed, Nov 25, 2026 at 06:06:05AM +0000, Nas Chung wrote:
> Hi, Nicolas.
>
> >-----Original Message-----
> >From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >Sent: Tuesday, November 24, 2026 5:26 AM
> >To: Nas Chung <nas.chung@chipsnmedia.com>; Frank Li <Frank.li@oss.nxp.com>;
> >Detlev Casanova <detlev.casanova@collabora.com>
> >Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
> >krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> >imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> >festevam@gmail.com; kernel@pengutronix.de; ming.qian@oss.nxp.com;
> >marek.vasut@mailbox.org; jackson.lee <jackson.lee@chipsnmedia.com>;
> >lafley.kim <lafley.kim@chipsnmedia.com>
> >Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
> >profiling
> >
> >Hi,
> >
> >Le lundi 23 novembre 2026 à 09:18 +0000, Nas Chung a écrit :
> >> Hi, Frank.
> >>
> >> > -----Original Message-----
> >> > From: Frank Li <Frank.li@oss.nxp.com>
> >> > Sent: Friday, November 20, 2026 5:56 AM
> >> > To: Nas Chung <nas.chung@chipsnmedia.com>
> >> > Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
> >> > krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
> >> > s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> >> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> >> > festevam@gmail.com; kernel@pengutronix.de;
> >nicolas.dufresne@collabora.com;
> >> > ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
> >> > <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
> >> > Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add
> >performance
> >> > profiling
> >> >
> >> > On Thu, Nov 19, 2026 at 06:00:03PM +0900, Nas Chung wrote:
> >> > > Add per-instance performance profiling to help identify whether a
> >> > > throughput problem comes from the firmware or from the host side.
> >> >
> >> > why not register as perf interface?
> >>
> >> The numbers are kept per instance (per open file). Each instance has
> >> its own fps, latency and min/max frame time, and they are updated each
> >> time one of its frames is done.
> >>
> >> As far as I know, perf can only count per CPU or per task, and a device
> >> PMU usually counts for the whole system. So perf would only show the
> >> total of all instances, and we could not get the min/max frame time
> >> from it.
> >
> >My preference would then go toward .fdinfo() then instead of custom debug
> >fs. It
> >gives the FD owner the right to see the statistics and not just root.
> >Here's an
> >example of in progress attempt. The idea is that some key would be
> >generalized
> >and documented and some other key would be driver specific (e.g. wave6-
> >prefix).
>
> Agreed, fdinfo fits better since the owner of the file handle can
> read the statistics, not only root. Common keys would also let tools
> like v4l2top read the same statistics across V4L2 drivers.
>
> >
> >https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-
> >d556568cf38e@collabora.com/
> >
> >Then once we've upstream v4l2top, one can track the performance live, and
> >you
> >can even add driver specific metrics.
>
> As V4L2 fdinfo is not merged yet, I'd like to keep the debugfs file
> in the series for now. I'll follow the fdinfo series, and once it is
> merged, I'll switch the statistics to fdinfo and drop the debugfs
> output.

statistics is not credital part for function. It'd better skip statistics
information patch in series, and add it later after fdinfo merged.

Frank

>
> Thanks.
> Nas.
>
> >
> >Nicolas
> >
> >>
> >> Thanks.
> >> Nas.
> >>
> >> >
> >> > Frank
> >> >
