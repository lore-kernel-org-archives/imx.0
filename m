Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FEE2D7DCC
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639702; cv=fail; b=PhHWgo/Fr/1onbMQ6BPVokrpt1k4PduAKO5U/A3GWOVmpuCn1U1PGjLEQ5O6XcX/CO1wrsLBAzNnqXtvXDjlZJ29PSZHltvV50RPPDxOidZ1x/IEkEWHLkZskrAcV1DRpZgMPa9OTZ0niAv1x/lThEJuHeuHYnd+5xXIcWuWSIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639702; c=relaxed/simple;
	bh=6eV4QykEEA97art0giPiXDEpsjkpapYjoBqAsJiBj0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ot0H8gujMva9wvRdp0pbKCkDsPs4Baw06neMqfFXjdPc4opnnTq8AG14hgyK06vxSkAqBUzQtyS6HRw+DpB8NkFGaUO17QJksyRwrIFNx+uRa66iCUauMMIcSe3OHpBE8Zp2P4/ZQcv3qerIYarexwV28l9FLWu0ZRJwNFE47zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vXlSjOon; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vXlSjOon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hayd4tHTXn6ZuL9+10SsrmUoUWnloOEoQmrAfoW/QtBA4OfEWaCwVEwnOK4mxyUbS6+MNb33IG1YSQM+StaTf/tH+fPSZzXfag6yHBlh3TTbmRBw0ztlJR8wsVi/Hl7SO9fhuy0Urmlwv188DJiKQhA3XVx5x3lTfcL9gnYZujf8O2Cjf+yB0Fdb80WRkkCGzmNJXvtidkhpzkUM0+aK0km90BbPiB+xJb0tGCJz7zZBJ3WNRaHQ8wMRJA13zBRX3UmJ1ugsoXq58q2CvW9I26CCP3hqJir6nsn8XTtzkkicvS+ivQXnAkGBV6BtLYt8lKNfU4VWCptBCWJCoF9tUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJF+UTFTd6db97Upi6DL5ZKC4yu8GVcLrC99mELOb0w=;
 b=GsVT444BlsV4Oxi6jEpH1Jm6FphKt9jKkSS/G9g71PltFeSTTyTXEdVzfZa/5Gf2jdEfYmM9GiTQYAWiFVQf67TS9Tg35eWyw6CmOu3ia3hK976GUyajGMcqWVKEtsJNz9fGlqR6Mxg3OxoOQGHn5IQ2xdAjMf+Xp6b0KZgMpkJwoOvvVjrk2/ZN8GIaj6blS76al5HcG6Fg/ypGAoM5cLHn6NMii1P3p1amsM21W2Esf8/QLaICEoN/ojysgO5AETBjLVRQRZESz0bkFRPFCqUgrgv9YY6IGdMOOAcI0XFJSz1/x1I315a085N+kE46CyIUZrsgr/KCL7q7CzFtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJF+UTFTd6db97Upi6DL5ZKC4yu8GVcLrC99mELOb0w=;
 b=vXlSjOonDKnBtTJo4rNyCR/DcKQo7qi+5xNAuf7bLmytPziI9KMpQSBT7792ZwDPaOO0IFBApN1RDOYKtG2ESxV6dcmthwUzrVvJNB8zx5IbNCfaqLTmdy54AHzINH9vboN5pDYOVzPerBJc4AZWRS7BsvF/lYonJmw2HQ8AZQs+BqAu3joGo7vnqQnJ7k+uwe95aGc7anUM6qOSe2HWyan4bTpmSXgb6UuLjVJ6/uOerxjiUJO4OFTuMDejqgGKYCKZMH49q2MV82vTx5QbklN0nMfNnLy27hzTLY65fuhruyFPWez7dGV86MnuAtxtVrQ+neZdg008SjDI6hG1aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 08:21:35 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9253.013; Tue, 28 Oct 2025
 08:21:35 +0000
Date: Tue, 28 Oct 2025 16:21:05 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: shawnguo2@yeah.net, airlied@gmail.com, boris.brezillon@collabora.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, festevam@gmail.com,
	imx@lists.linux.dev, jiyu.yang@oss.nxp.com, kernel@pengutronix.de,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
	marek.vasut@mailbox.org, mripard@kernel.org, p.zabel@pengutronix.de,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
	simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
	tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aQB88c_AEC1RAZtH@oss.nxp.com>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
 <aP7DZCMk1pQ7wsFo@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP7DZCMk1pQ7wsFo@dragon>
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|DBAPR04MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc9a7b3-88ef-42bb-859c-08de15fb01cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pJBspf+/tqp/HYLlnNIFcRiRmL+Y3ngR1DytuCaxQl73rDAnHmYAnDU7ZRci?=
 =?us-ascii?Q?VSATUeM4i/r7ddx75JrGCgdTgjkvmvnJ7s6n1xbP4XhVrnyTR8LLl2QBOH2O?=
 =?us-ascii?Q?5gbI2MINEcJdjYC5e586x4aMYTMUIGHqv/q1NMfPByvHgnj4c6mbC102Xh0c?=
 =?us-ascii?Q?+7a/izVD71ZU1fKVlMbpnDOoyqhBAqFIjU/vKsBj3wHgGFLXfM+cOh2nEqv1?=
 =?us-ascii?Q?ZA+u5XzHp1YYII+jbog6uOyqeA9y92+61970suU3XvcmFHeipVJnFE820L6u?=
 =?us-ascii?Q?WbRqa3Q12WK4ESfiOUNcp6k2xXvW7SRF+J+hZ8W/2ZGYq4zBpL6vCU8C9OgW?=
 =?us-ascii?Q?+fj+1vRnn7llwbzTuWSLQgpP/71/4YVrOfPVgZ7IlIc4gb3mz4ISls0+QDAW?=
 =?us-ascii?Q?WVW0CEbfg9JlDqqyFoKj+azV5MNIvsYRiQXGmx578dGPyMIZRjlDecnXOL+A?=
 =?us-ascii?Q?cvMaShDiOODpizpwuRJfdoP/Cx/yjmRxhm3Dv2fLRnJT2TQwa4PfzPOsgNZ1?=
 =?us-ascii?Q?C5E1t6FsrgqSj6Y2k+H6gWlHAD6qF/4BuSubbz+7q8qzO4Hx6GHNpiXTaMhP?=
 =?us-ascii?Q?YICZ8FspxD+4xK97657OLVZJ9qQLgh8i+ArkP+mwVBUcFerrJbKPZ/jq66Az?=
 =?us-ascii?Q?ZiLvpDNGQvaeOjo0x6BPdgQWcVdJY/HiQ7UGms5XO/rU/PJc3tGobJQ3HDrY?=
 =?us-ascii?Q?YeNmFss5kcS+a0E3CaRx48WjbILoum2LugiZw2Y5yKULcSMwZRUQHCtX0KZ0?=
 =?us-ascii?Q?W0MPtnwXjIa0xmS3LcJNG5mkgBRmGx1t9L9b/3qrrQ1fL3Nj2V1nwYpLidBK?=
 =?us-ascii?Q?CfB55N6ovxPGN6cD4NfMOi6WJdLc7BxXEZiiicVFLvLjqeV+OTdFscb3LZod?=
 =?us-ascii?Q?6+AujJZGKm4dDVAZNj2BVd/J5bZsn5PmFRRoK5U2CqlCdNXZe+TDC9sOWuK0?=
 =?us-ascii?Q?MP8w2CKQenVZz3AgbdGCrPeXwJiIDfB3i4USOT+ugs2mZzZN9WfoIdnXK486?=
 =?us-ascii?Q?rx5EHHmNhRuMRFw3lCR/XtCgwxPngM1i4mwwGXhslcfkfZs8BzmazUzxrpVG?=
 =?us-ascii?Q?RXsbYhijHlgsHjiJhxosOymQ/C3c9FaQ6TAaB374xiT893frjp+AvisJ34AW?=
 =?us-ascii?Q?VRHwTTmN3t30oThL+YavYwFf+2QNyKa/yk0dI7/Ngg/+oMZGDzjyD55c94wr?=
 =?us-ascii?Q?bkCfFlSAHb6eeiS9ZZk7CdczRfplHODsed2SmvtwwjY3PE7kLlu0O+uk+sbv?=
 =?us-ascii?Q?4CFlTR2VVO/YKtzm60jilQm3suZUqTfv01dQZjgNtytSs1zb/hK/egHz+q4K?=
 =?us-ascii?Q?tz8TnmlR26xSguHc0Th1Z9GRcSt9uaOERM9ixnPcwlnQTRG+Yv1a8kbhdfQN?=
 =?us-ascii?Q?UZrZXeq0nptdagzoUNyw4JjkjWvo/ac9dVGdcpxYCv7z4/vvLZI8uBJY81Vm?=
 =?us-ascii?Q?giKLAwzrbrrZyos+OV6RDCQwH9cy9R7BHuYNZ7uctryWeXr/zC2IjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9627.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ICK8Gmw7/6UHRVTosJO6mBMONPPKl8dtBUgAq29lOwmKGgw3NxLz0Vi+uSau?=
 =?us-ascii?Q?dmIWEQrCDv04ygE52mSPHp1QxDCxWTqJgmH1x3mHwDWPfgOuhPdVlydLOUbE?=
 =?us-ascii?Q?c8q4OGkNtxarD9FtuGa6ris39Q/5jnPRuW7taoaATHTZOTk49aF24mXJl1U5?=
 =?us-ascii?Q?O59nmZW3GGHA/glXPafqcekpR/jvmBA/qcDlvg/C8q/y6IRtWbA5Ht9OAA5c?=
 =?us-ascii?Q?gr0HMwwRBWgiKz90kmEO7PslScCqPjKm47RZrizZiZYrZZJATJ6N2/2ExaFV?=
 =?us-ascii?Q?zVlPO8yY3quA3xd75fBUuC43lUiWxrA5NMASltYGUEYdgkudl3FR2ADbeVv3?=
 =?us-ascii?Q?6DgyomOxOYBXVi5KarG353CGi0Eh4TiVwkjuOmRcSOniVhF52eGwB5j7gQAZ?=
 =?us-ascii?Q?zFiV0a25mFUGZuj/RNvpDZ3haRi1/paq7Yp28KTjUaGwhaNa9kX9f4Pfw7MK?=
 =?us-ascii?Q?Q7xU2ezlglO3wdIAUC6BYr6KgwxFXGueIcpsEZi60TZsbMjF6+NLCCgUOHQK?=
 =?us-ascii?Q?I3eOzJnrX1x5787TqDNUT9lQHvSf1hhucVUPyIn+pdNwHHU2vw5itqIKHdTj?=
 =?us-ascii?Q?Xrtz8R5J/DQutOMonBKjn6M9cbTwDh+kiL+G8kdIjuo/lCLslDNe3Sd/dB1U?=
 =?us-ascii?Q?eL0RKj24hj+tiMCP56cFa9OMlMEG/maRhjXFMcUEN5Pv/CIMZb3+qQuk3e5w?=
 =?us-ascii?Q?6OcG8lj8PRL8KlmN3i/2nt7jU5ERgbRhbiEW+5P9NYpbX+SfuNDyF4izjaHZ?=
 =?us-ascii?Q?3Bu9Bxdkh7av1DXERq956XUWgjqmkoTlxhmyf4cZdtgsPyaQVG58d6nX/erI?=
 =?us-ascii?Q?E0GAUyUnfWn8CWFLvrgXWue7E/K+mHz2Kf64LMdCI9XQYKp71J4rMBFvqaNH?=
 =?us-ascii?Q?7sNvk5JjWm153TJWMY0vVod887xDLi1qmuFNK8oeL2sF17uxLeSIM6BFoIPL?=
 =?us-ascii?Q?VzTIOOvVmpVoEnbcEzmqrL5TOPMqFBFx0YJcDkifwEZhum5EPJnpJnU9aw3h?=
 =?us-ascii?Q?0p3GVQ5KsjtoIJbh+9e27cglOLLnXjx6hT8ojUs7hdmvMLMJd8RzipK1qwYD?=
 =?us-ascii?Q?cY8UetmE2DsEyflwiD2FxgtldjMFGH9lfaIw49SW0jhc+SySwYFzqnWEg8XX?=
 =?us-ascii?Q?Gl2iIZp6U8S/qK+5o48HXNaaJa4kRP5c44xNc5sPtrDTONHKgp98buIOCsHp?=
 =?us-ascii?Q?0Ayrr81YJ4DBC4niNfJM1zcTRCIabm0MmOJpWLBIIk+qSbE1BsCdDEFI0l65?=
 =?us-ascii?Q?GGsDeEM2rxOwVOD4tU6+d/0+IdiJFrJqTeuGw/SJ7tR8d+9Iifv70Gud2cIs?=
 =?us-ascii?Q?LsILliM3AAdRr/26lm9M9uFIBSaSrj4i8LHxQ7s5oSdzs0YY7bB76xfvEoJc?=
 =?us-ascii?Q?a+yG9juyeQEzvZThAc6nk1GdUK3n7zt4vRmaUlrt0z5yABmsvkkm2AazEDsu?=
 =?us-ascii?Q?IwJ2gB9IzaEvathqaeBJdk2s86jQ7h3EfQzrSwOLgd1ViPOuDdnBrVawiROQ?=
 =?us-ascii?Q?39n3uIO3jgtaNyGqn/e+A9htAVYQNDnEKl/vzBsRbhDk9kkUlIGZjdciDFio?=
 =?us-ascii?Q?tQXJwEBScE8CcYg7QjZB23hnEd3K68bk4VGRgJIU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc9a7b3-88ef-42bb-859c-08de15fb01cc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:21:34.9862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c01E1eV7v1f1DFW9Tbp3C9P+nQ69nM64moLcUm7yIJLe23or+ypmTGsTSeBXLeE6VryQgaw6aBVA+zxRr6zaDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301

On Mon, Oct 27, 2025 at 08:57:08AM +0800, Shawn Guo wrote:
>On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
>> On 9/25/25 10:38 PM, Marek Vasut wrote:
>> > The instance of the GPU populated in i.MX95 is the G310, describe this
>> > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>> Is there still anything that should be changed with this patchset, or can it
>> be applied ?
>
>I'm waiting binding change to be applied first.  Or is it already done?
>
>Shawn
>
Hi Shawn,
It might be better for Marek to remove the always-on GPUAPB clock from the DTS, given that
it's an SCMI protocol clock and the kernel expects it to be available during operations.

Also, the gpu_fix_reg appears unnecessary for the driver and could be removed[1].

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a8cb5ca53690aa809f4f65e14192753073e61a71,
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=02df3543f3e0ea572e2c739605ebd6c20e1149c4
