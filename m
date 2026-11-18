Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795017236;
	b=B6AXfw8EfpafSiUI71BDDXB4FAqKBj+wUYTH4uuJbUDdorZuQ8rZ69i3dPIri/SZdKcP
	 VMa+/TsyRtBSH9cZM7nmjljI0rNudGkYCdXV+24/yP02ZN472h2IFUxTvxDvJEZcW/1FO
	 JQpKntY0eThdV4z1Ps/AloiuGYjY0x3sarT8uFF0E56D85HctqS5/LogReywkiZ3MkOCY
	 AkloAroDO9b4ZNwAjKGvNFRbxV6Il9L6QqJA6MMSGVDr/6z2krvrOWKn4vaTlW0Gqhkkd
	 9uB/xo6+/TNogiMbD8Eu13Bucwlo+wcif5u3RqmWxyNrgA9ALmz+k4JPqLFUe9z/5tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017236;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=DhA6yzgN5A0/FBAJ/Yj8T3bHCtQqCLayO+WITfNdeHk=;
	b=CvJ/Oju/BmRJ9oH/TH/1oNFUKizhuu7sYu7Xuf0HeNB4kY74AUMYqNm1+tUM2JtE11Zn
	 /vmtQaVmDEkAbIskoBuG0AhyrvP/v7PzCW6fdGM8/THOQ6pi8zfkwpESqJQPpTk6chvl8
	 cQko9r4E1iX9QZ6VDNBLPb+GM79YBzLXV8KDN2HXCZXCs0F10venkb9KDLSJMjyvbfwX2
	 UEsrECQsUmiL1zX5Tw9HjzUu706TyqvN6KNpuw1AiD4tXVQ6ZXua2kedGes2jiMczZa2O
	 VCIDa9q/N6iQnm7Q/iK2n4wJcjDrmW5A9XNzCYNilQpVAycY30RVGJRBUjH3Q3oLWog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=d4btl8c7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA47606A332
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA47606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=d4btl8c7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkJ/vDGW5c0y1Vn9X8Rlk4BRlMIDyJI87flaNOXlO/BJ/sB0XsTGLvil6Wk4lHLnjJVVbukNj9tuomCxyq7NyLfWMZHC3KP2HKkh9AZCa0mnsLO6xPDY6jJbTb2ckn6nC2BZjPH/pEhGVaV6dnpzbJ0/4gjCnPnZ1voTIJHXVuUWjVEc15Gk1PANuWLJ6AW9cQwunK7vMSY7cGHmn4ccPzjG6GcMQohAITRyXq18sOt+vF21Vt9b15LkYE4GQnqCeCXOpOamkprOabvbYvuZVDutg5bnj4D3Bik6kKRYSwtJxlzOlQvDMt5Jt8bgU+4socpeV5AWq+Q3Zr39ziM0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhA6yzgN5A0/FBAJ/Yj8T3bHCtQqCLayO+WITfNdeHk=;
 b=o/WnlDjnFv7AdOV3O6ZDfBTmox4XilRfv+U8Sp09ImeHvXc5DT4f+8XmyJoMIHpL21bgv3HO2z/gAkh4o/IkuAEyXM8OFPUsYl+ku0OlmboE+uU7u/ZQVnx+QfynfJw5/3IETtSInDhSPlpvOiuuY8vrjhy1HBf4l3dCBR67bOukpLMxJevPJNTBtTHj2+Y+098mjPOddPh9kkM+lAQYrmV0cXYoM6XrtxTymJDo2J65Us+/3qPjJp9eu9nmPBm7b1+DRCmDhloQyEnL50aUgFa8rEb4nS9scYAiPO5LOashJtgmdDdMLRMA/y/YxRd9RZvDvfXE5ZP+lO6ly00+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhA6yzgN5A0/FBAJ/Yj8T3bHCtQqCLayO+WITfNdeHk=;
 b=d4btl8c7xjoGfd9bBjzneCWuMJuRbEiS8izXucMUPKR7LAH1sqZSB1D7arRh9njaJ2ym3AaoOKQEkcleh9EU36e7OTtUCskSnrb8+CKsQSrAayENmDltcS44X8t6rAd4FVdqOl0a9Hd+uU9cKDBvK/rLm/zIi25d89gCMEAqgNDNCr44N81TEsXXjL0bia8M2yOKZN8TN6ixsFybpaSpN3+ohk2/InwDaLA+/Ll3XkE39o5jQoTjX+G5mknl+cqU05qwJ2xsICLu7DjmGQr7tHJnxoxo+RWBIHf1aMJ+gVRqzuA9UmRA25d18SiUKYcyyCnZVJv7fJo8urzCxooQoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10695.eurprd04.prod.outlook.com (2603:10a6:10:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:53:50 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:53:50 +0000
Date: Wed, 18 Nov 2026 09:53:39 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Arnd Bergmann <arnd@arndb.de>, pankaj.gupta@oss.nxp.com,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Message-ID: <av3KA89WuUc5GdZj@SMW015318>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
 <180d2335-e328-48a4-b376-a90464279027@kontron.de>
 <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
X-ClientProxiedBy: PH7P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10695:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a73ca4c-f6a6-4a0d-0a86-08df458c238f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|19092799006|261009223027099003|261022075727099003|10067099003|261026140227099003|56012099006|4143699003|11063799006|261021135927099003|261026121527099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R+3F4m82xFgAFXnBVYRdn3Di3SVLWxroeMGkeiP5XDyswDJy0aea5c7pJYQF9s4GqpKCQ0sEzpgxDjF29G4FEZMlbktulTwS8ijnTNkfUYAzNBjdL2aoIYRuMctZECT6tDk1HJ0vimQvIoeONLn8LJqUnXVORK+HBLA6+8jza2O2Db4xuP+25IJwuxXD+OrIN7iKSNm4N3lmoPa6AXbat/+YRPo14RVM5FHuDo6rcbCY8pPTE77itbUlc//wOGmnIa0vnTdmtjux/SRoF106lRCbzSsCDMqcFKOva5gvjZDOdEu2nSAgrz9hAziyy+/w5cB8WHNnkSb3WtymhkzIV0TQpHyGBnD+8UyuHjy4mac2oL7Lpi3BBjpycx3R2G+okCxoUTDS9pYlaMa0TfD5XeJLHpyddwbRpWCqS6ngR/nqMXeW0KIJEGzzuQs7JHNX6tw/lXHs0QioeAXIV+UsTzt7uS0+GDRoMuwIY63lc73FTeejIcyCsKYBkMAPX2RE/IFVDc4RhIPv+7TEA9uosWKY7qd4QqW53zpPHmJlOwS9IxCK/LCVpvvrs59gibGiCqlU2j8Fb6IsXG9U8rMeaYbaS3uLEPHkVZlMASLhHTi6tlvqr0PUowlrSaTl5BXY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(19092799006)(261009223027099003)(261022075727099003)(10067099003)(261026140227099003)(56012099006)(4143699003)(11063799006)(261021135927099003)(261026121527099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jzBlHpTbZzeig0VX/tUPBCmuQV6Mw5tdGTc5XCMzzyeUTn8dfs6U02/Rjk7+?=
 =?us-ascii?Q?8uGQd++0l8p71sdk5xexkJTBXoYPuBHXy4w7Ol50U8OK+KN2htm8TKoEfj2W?=
 =?us-ascii?Q?l4jSTunX5DeurTbz2uT0rcR8IQ91SR0mEYazcNIWxgtdccZAfpJ+A5dT4+Lz?=
 =?us-ascii?Q?moEpUcXC8oguzJN6DAbe7KwKvwltvaeXYmjnv9Np1/Z+KBJLeDCD97LeyCkU?=
 =?us-ascii?Q?0kV75SxXLWTFr5G53gKNw5NF7iBljPCi0B+a5Js+qWs37mdJov9dx6ZFd9dd?=
 =?us-ascii?Q?cCGvVTVVTkVuro2exqNrdJiRlMZVd6dTuPBeybrjq/Imw3DTjK1w9l/dIcWS?=
 =?us-ascii?Q?w4hpJc/Hsc+/AZH0DR/qeHuD4iZBxzj1L+CQROlDzSMZ4vAfUClpUvnkH4Qx?=
 =?us-ascii?Q?hWl0hvURvpifJYvaFuAwiX4MJWVmSlRHW3CPuUAUjHHqM+gTZs9BjDCEMStA?=
 =?us-ascii?Q?5aV5283d77CYYRC+qY8ZucJg6/KvBpzFj6MlPAzB/h/rKmaoHsEBNbYH0IiI?=
 =?us-ascii?Q?NAHP6LavlCjcuN427dPRt2DGFWs2s2FXKkWFlpN542lbyOJ0//LhOsV/zBn/?=
 =?us-ascii?Q?PJ8h5aWXpV4qCk9s1uifdUnLiQER+kOaUfqW7/srDs/1rdRMwSvTo1swSaN3?=
 =?us-ascii?Q?0UvXXMRsrj/mIcltm2awDpHOlXI9mGG5GHd8Q6w0eHqBptYA+CwLV8bexItg?=
 =?us-ascii?Q?QlWtcKp5Onpe2JOfmsm89WUOyunZArsQOacH05R9KMg1ZhXcjLvB7h56FnOJ?=
 =?us-ascii?Q?T6iw/27iDWfD627a5VQm1yIkx+TmuCzGCwVRLxAYS3+diCrz7+h0rl237Dq8?=
 =?us-ascii?Q?k3ICWxgr+jkZlqk6DaKdEqib8LNEvKLIH06Q6dLQTKuTYrJYDFkqxem93iWa?=
 =?us-ascii?Q?XSEmBqim1cDOSVDuzndnH8h6th/20yxIsOd1iDLinyGSicperjcvZmc7LIXh?=
 =?us-ascii?Q?9icj8Lb3fyQhLahKUF7G3W+4qls3bCR8kWHaoZsX8xmzwtpr+RZ8/Bkv7FfM?=
 =?us-ascii?Q?+yVXeDjO+AK6nQhdwhvQWojeDcwjiqUrZBr5H9KWSwX1BE7h25V6CDV4/oA0?=
 =?us-ascii?Q?Kq0qdHzegji4bQWQJvbEncFuoVmbpW6s7lloyAT46b0PROYNylX5M/C0sZYY?=
 =?us-ascii?Q?EE6ax2OF5jQ7I3sHKMgLZSXEE0AYKsNMNlbF7poNeQ7V80IWVGdfyDW32IrU?=
 =?us-ascii?Q?4+khZtu/Z3KMCweBC51okFMP2HtNSDAx6wYaDPmxHCHCT+jsus7uVyvi5zO8?=
 =?us-ascii?Q?7regY3qXXD4NCOU8P3AkEwDyKnbVYgBXVlmCtOVHHkHgKA0y0fit5ZVkMTJv?=
 =?us-ascii?Q?0L+n9oxllEnMrDAE5/RIL0WhGtob+40Qp3XTWU6LEvThUHtF32mcXt8YkyR7?=
 =?us-ascii?Q?fSZOJj7kHhmN+JGPm3/dRRQYwjs+S+RZ8mvL4CZNg0horq+zEwZgdObme5FD?=
 =?us-ascii?Q?n962BBTAXFimnABwU366qnOyi9PEV5hx04mdHue3fnTiKEljeuuhybQs7u1Z?=
 =?us-ascii?Q?F/4g0hHGtVa2hzSUghEdSa1ppJqwEWIpD8ShXQOhEMoZ+LpzYxXa2xVBCRQr?=
 =?us-ascii?Q?VUG448oRtSz9SSXv6zdEtuNDWGzqjLqtOOSa1Tbg/iexYt92pWhTZq/aYKuR?=
 =?us-ascii?Q?Zpidpa6CcsT5edF5eM5Fj3CH2jTOf+24oj1q111IxaEEJsjh67d98yoTnmk1?=
 =?us-ascii?Q?YSFpbXkcHrcrbhnciFyk7eJ+kHoAULtzV5iZxYxqV/td9quQ9VM/X+Q8Bqm9?=
 =?us-ascii?Q?Ql9uWo7+AnGu/q9s7aMJ7Hxxj3E1LmTNE9XWEn5dADa293XOsCx3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a73ca4c-f6a6-4a0d-0a86-08df458c238f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:53:50.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wl+TVT9JYbTdtEWUGfd8asumkBNqTJL9ZQ1/lJzIBkMIzMEQ7gWPDck7S4XK70ZBr9XGZAOBGCw9Apk8DZ6tEvxE48sSqsOc3aym+M9AHHkT7Qwv4qbNfe5+XspbknZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10695

On Wed, Nov 18, 2026 at 03:43:28PM +0100, Frieder Schrempf wrote:
> On 18.11.26 13:46, Frieder Schrempf wrote:
> > +Cc: Peng
> >
> > Hi NXP developers,
> >
> > On 05.10.26 16:28, Frieder Schrempf wrote:
> >> On 16.09.26 16:39, Frank Li wrote:
> >>> On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
> >>>> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
> >>>>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
> >>>>>
> >>>>> Adds the driver for communication interface to secure-enclave, that
> >>>>> enables exchanging messages with NXP secure enclave HW IP(s)
> >>>>> like EdgeLock Enclave, from:
> >>>>> - User-Space Applications via character driver.
> >>>>>
> >>>>> ABI documentation for the NXP secure-enclave driver.
> >>>>
> >>>> I just saw this in linux-next, where it has caused a build failure
> >>>> for a missing include of linux/slab.h. I hadn't see the series
> >>>> before (even though it is a v51, which seems crazy), but I am
> >>>
> >>> It is in linux-next about v37, but build bot find many problems, I dropped
> >>> it and request to fix it. And sashiko is online recently and also find many
> >>> risk. I request to clean up it, and local AI environment have difference
> >>> with sashiko, so bump to v51.
> >>>
> >>> I put to linux-next again to make sure that pass all build test.
> >>>
> >>> Other two problems, need more time to check whole review history. reply
> >>> you later.
> >>
> >> So this is still in linux-next, but was not sent in the pull request for
> >> 7.4. It's rather confusing to me that maintainers add stuff to
> >> linux-next for build-testing and then leave it there, neither removing
> >> it, nor continuing the mainlining process.
> >>
> >> Frank, what is the plan?
> >>
> >> I'm currently rebasing my work for the NVMEM driver onto linux-next, but
> >> as there have been so many iterations and this whole thing took so long,
> >> I want to make sure that this is not another dead end where I'm wasting
> >> my time on.
> >
> > I need to ping here, again. What is the plan at NXP to move on with
> > this? This is blocking multiple features that depend on ELE firmware
> > support for i.MX9 and similar platforms from being upstreamed.
> To be more constructive, here is a proposal: let's get the
> kernel-internal part of this series merged first (patch 2-4, DT patches
> 6-7, doc patch 1 reduced to kernel side). I currently don't see any
> objections or issues with those.
>
> This would unblock drivers using the in-kernel API, such as the NVMEM
> driver and this is also the part I already tested when working on [1].
>
> The somewhat more controversial uAPI in patch 5 can then be further
> discussed until there is a consensus on it.
>
> Arnd, Frank, would that work for you?

It needs at least one user for the in-kernel API.

Frank

>
> Pankaj, can you prepare such a reduced series?
>
> [1]
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de/
