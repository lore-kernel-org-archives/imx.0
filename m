Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.69.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795571279;
	b=hwvj0mWuMxYZHEx8/OGf1LyLjhYtCcFEe5dLVyHFvty4yRqjM3/CLJ5tKcMU7InUIh1s
	 naAKWc4se5FBa88jsfyZEU7g9GtA4aNfldPJn+rRrMcF1qu5QoxeIsAfZmjRKaGo62VgT
	 7+0G3qRhwWfem/mvpVnDzuWsBHbMD5QnTBwdo5IHfnIrM0UEvzzL8FR21Wflneq88v4JB
	 QRT2oG1A3R8G1en81q7ClfRhLkwm8Jb0vaXsPma8lFyILu2XDztoSPOzP/9comsH5Hbc1
	 4X2xBpjQnOwJ3HEQ2cYh8PBCQMaPNDSGfF77pO6gN8+Bh7wKzQhLW+bNoztyTcii1GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571279;
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
	bh=A0hctLdXRXwZ8rYFX34Z1fEhXun3husbNxc09b+XdDk=;
	b=f0DFUYYXL0aeWvmOONaX0KNVgTm0URJG5WDEHUn+wFjyQvRc/HMHFUEuw7Gma1O4SJ9c
	 Pj6tmyo6i7lWL9aTQI/h+sTe9ZAdt95h7isnKf5+kDVHZl1DV6lN63fE5CRnH6wy/mNCr
	 nXA1QdrUjdEZnMpIYVj+fgIsMBk86SBZwlBrdqMHtLo2Myn8FY7tXeqgDUXVDQTvq0UNq
	 uEWm/x9ygk0RtyFSh/ZATb1I36WCM50gk7KNQShKdBsCHzrtA09LoZwbjYPAD04ylxSDE
	 qYKsVs6DlsIshn6MfjJY2sfrmOawfkqyX3bkdjZ9JIZjJF6L0lNEt14EhyD12YUeooA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=urrYWjVG;
	arc=fail smtp.remote-ip=52.101.69.38
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9882606A326
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 01:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9882606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=urrYWjVG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtV4s3uNsBe4obW9CvJ9QLktq5LTow6Y3ES69AGLctol2HFYL0hjFsWLZSvynMkI4GB7iBnMMaEzrWWNQ7+WrXkIp2sQDcFya27A0qgXrsEaeJehb8EXnY5cainEchUNv6YWIdFFqMnzG5h/6zK8gyOgZU+o0i+eZ8yXIh/8+VFAsdCieaH7Y24mj3xHo8HBSBYcxJsM6H2VNqSzw5tuLcdVXRBm/04VZJAYEC5whu/197b8zkkLow74nDREk3VfhVmBWTwlzEHGa7+imnKobEGvhgI7dgTkiLfxTficVmQgvb83glTr1I4aXUaQQGinXNWf94Wur6wRNJ6iOD0rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkoA3tPni6PifMLQbsbjCt8zGBYH14RFhQXJC1NOUTI=;
 b=sAOY0Dn5EM17Fr89ACem6ouOxTlpq7cFOOiHxDzwMfAPATTWMCK60ZaIk75CDqQ4CK4YUfZ/QVHbZmVbU+ERl1su5F2Tz0R+IVUhCVW7rytraHNJi50fNGaSoAYFc3cpMj8fBPUgoZOci8jXGIpiRy3+EFRtmxhhkX891pqBm3lw5MoAXUGVVPOnotZ2cuO47Fji6lw4i+Ek2SbXzcy/kWEPDCknLAuHq2hQKg37xVW/aMGg1e0witJw87GYv03dQvggagOsW7eJu/BAkNJOn/Ozr5n/jfRv2frNNmpnyVaLKHrs4iRdFz3SN0PIQfcqGf2jeZ7JAiyqqDzg+RHPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkoA3tPni6PifMLQbsbjCt8zGBYH14RFhQXJC1NOUTI=;
 b=urrYWjVGVTmsknLb4iWBhW1sve9z0DNGCUI/CTSTans6jADfZKvuSFkEroS8LD/br0gxwfSV48afROc1ypmTIKAghHYuMYiepf4KyfLltHqpvHtzLzNUOXN732YllBHUrtD91DCZE3Y4m5BDsoIb1rz9q40gq4LaD/CnQ/p7KQ5dP9Vx/Ggu7TpWKzX8Sct9AP4UwCM+LVBQQ5KhBMMUzdVi6wZ2zhjuVcisd+2b3oWHn0jYU7vTXNgcrdJs+14jfUBKaOuXv2Os6dpE54eKB0R99bi3uXQCslT4l+zY9z/Kd33960P8YeOXO1NRk6kkWcfVZ0Qi812StevSVY5zBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com (2603:10a6:10:1c::21)
 by PR3PR04MB7371.eurprd04.prod.outlook.com (2603:10a6:102:87::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 01:47:55 +0000
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c]) by DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 01:47:55 +0000
Date: Wed, 25 Nov 2026 10:47:46 +0900
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Zhou Peng <eagle.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, 
	imx@lists.linux.dev, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
Message-ID: <awY97T2KaUWDkLeK@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
 <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
 <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
 <067d32d46788603e18f24040e2a8aabb1b749774.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <067d32d46788603e18f24040e2a8aabb1b749774.camel@collabora.com>
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To DB7PR04MB4698.eurprd04.prod.outlook.com
 (2603:10a6:10:1c::21)
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
X-MS-TrafficTypeDiagnostic: DB7PR04MB4698:EE_|PR3PR04MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: a7032b3f-c631-4de4-f2d8-08df4a961ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|10067099003|4143699003|11063799006|261022075727099003|261028144727099003|56012099006|261026140227099003|261021121427099003|261021135927099003|261102123227099003|261009223027099003|261026121527099003|261022105027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	n9Oe91mD8KKeIuxuLVMre4sQshN9AD7xMex3MpMp8tHNJQ3OBJBvCUIMOcWUcYaq979hzsLIjDrHARV01DTk/vs/rGNMKm23KAYnNTMIxTeWv7OgpoyBOens28NY+3iMXlrb8B++NUC3WYByYxHMOoJeDE7+OH47Yk8y7dwTryKh2qczJKhlISg5sFMzYCIouRLcjMoTcTZHY5sIdmh1brmYQ2YFkcd3nFy9eBK6m1bdlMdkssfVUmWZA0jEL0FHl/cLhZeRMlerox9f1qrqDbiyvbVJniUHe2cWPRLaTeP574knqJ4SB9Onf55BkBQsRyKGjgp7j6LkbvJqOTOs/a2mQo8avpTEjSLRyyv9XkUmmja9WUhPd2UFAkzZ70EerBH3OIpqDxBydXs35BMuz/9eIUUjG6//6IM6BwsDORgm2Zapf+G8wQlPk0cQa2On5ggxXcImcb2zWmobJsFo+0q5R4ID7ZycXtzD8CMuYg6NB4BmY+1Y4e6o61UyapFZDYJocdc5nXTDZt9SlFdkUFkDjz+rigO2AimjlhzuPQnp3JlCtXS6irB8TNIelblRRgz7iJ8eto7n6M3tHjFyzRIhOVJTmLuPDccQBa2+jgmdXm93h3OsLC4ZQAO/lEjQPY4VhaSPIuVxJEdD429ji2dqSyRHkIcQRqjq0zKEImI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4698.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(10067099003)(4143699003)(11063799006)(261022075727099003)(261028144727099003)(56012099006)(261026140227099003)(261021121427099003)(261021135927099003)(261102123227099003)(261009223027099003)(261026121527099003)(261022105027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?mnOtSE3Df8Wv0mHBmhLDbKbVCQEq9/NdSN2cTjsgvW0S4nvV3DkKvNj712?=
 =?iso-8859-1?Q?ciXDfs592I/Ok3Yr+WA6jsCWsxrIZg26JhF0hVUQEINBpYD6he3vfcn7Xe?=
 =?iso-8859-1?Q?iWvZlARAh9j38XsRI4sUTkPtNJcCPVEXrIgkUHhnHrISERub+pXPbV7S5A?=
 =?iso-8859-1?Q?nx9Zjjh8cpB11FcpYyuKovLyw7yNeCfqWJSi0hhwcb968aRVjkInNs/zQ4?=
 =?iso-8859-1?Q?htzKDza3rNky+IcaGDqqONWPsxiyp9xz/dpKoF15p7OZslRaNk35rvUpNm?=
 =?iso-8859-1?Q?ztzaQoQm3h0jZz/qISUWS667NEweNdoiTV5ySj29Wx2O4xO5Pelvc+7rZe?=
 =?iso-8859-1?Q?Rk8n9/kGEmm1WPJBtmLDKd8z8k1BxRdZXBVCCbY5vs+cEO1/u/YRP05ecb?=
 =?iso-8859-1?Q?B8jj6XkymRoFWzG1b/9I741wEQt/aNhwgV+AVolemUlaKpiGzAuXVrVO/n?=
 =?iso-8859-1?Q?f2e7HVAD3uVTwWkre4B7eMtlQPW2pGpg2uirilPNqbICAYCqnz8fgyRLXQ?=
 =?iso-8859-1?Q?vwE+LfUcWZBfi2A541ufjCaRUbfea3uzC6JjR68nExpmmQqdeswlp/z+aC?=
 =?iso-8859-1?Q?x6z0J/fG7RGa4WgSc1ssNTOzD5ZEj36DF5S5PjeD4ULTNCf7QfhpIRU6hi?=
 =?iso-8859-1?Q?apkTHVYQ1o9QyBNqU5x30XZ76HBZj1AXurQg/RC2dmBTP0hyHn579Pws1M?=
 =?iso-8859-1?Q?ScwvHE7aRtGnFf++4YspodM7Q/b7njxL8DYYY7AmhAR9dymsZO08MJJFC8?=
 =?iso-8859-1?Q?yeGgQmYP4VRbgU3mSR+QYXwrY9eLCrReCftwNf2dPfigcOHv/8dndvgRY3?=
 =?iso-8859-1?Q?kIB2h7Q30qsybA+ci6eRqbOdZcjddKbi8td4KxPM1D0pC0eAMV06xdNmt1?=
 =?iso-8859-1?Q?T4gYY9bbn7tAGWDwTN7jjkdB96qEDZsnKIsVNPC4MKKjlaYUuv9ROilgc5?=
 =?iso-8859-1?Q?/G1fCqUTHveuqT9CoE45qQyIrm+noGScwDXqsEq31moXwdDKsMP+1QRn1V?=
 =?iso-8859-1?Q?bO6U2pSv+94fU6fGgG45irsLbZy6q7h/bwcka6Wjx5+PQOotku9sMYQZnH?=
 =?iso-8859-1?Q?wj6wkerMKKIje7D5X83XAEdYg95mhtV9wLKf918AjdoWPcE56CplZYPU65?=
 =?iso-8859-1?Q?DegO4kdJuBUHHRQmR1yAUzoV8jT/KIYCDu2XkJqhft9Yef6iGwdQNWAcsU?=
 =?iso-8859-1?Q?C7Lz6q50eUYRffJWJSKIs1HYkwZ7eFN9CCz8k+Iui3cMZ5kAD7rjF4bIYG?=
 =?iso-8859-1?Q?Kec3RgnS6xf5D2omC4wsCJqzPcj4d9Qs30RckwVp3PDEcnyY5WzbETm3it?=
 =?iso-8859-1?Q?wuJe0bojn7EzizwaiDYrwA2AuinA7PjvVLShh+i5j6Rrf4YaWMy2ifji2N?=
 =?iso-8859-1?Q?bpckjHy8+FNTmEH/iqqlejRORf2SmLdguWgLilhtmRvIc22RC8n2HP/kEt?=
 =?iso-8859-1?Q?W/NjVgYHbPw07jGW/wm2gxmy9PPog8cxJcEpnnn1Susob4fviFL7N7njyF?=
 =?iso-8859-1?Q?c3SiSV8BMzECiGpmEUCW5awxHIgGlV0X1IdQV1QNSxehHa26mmidCf4H/x?=
 =?iso-8859-1?Q?RL0EifdGcQgMkPjeK1xfNCdvTLlUoFT1B/FRt3TOjgl1SACvi37G/7aJ1z?=
 =?iso-8859-1?Q?FMVBoUYBWYRoWCjGNoiv10+OMptTw8xFrPzTlgCQoN0pp5HZEqJ7pnqjGD?=
 =?iso-8859-1?Q?+xH7c4WFbuxnRWHJr6VKplWYDGWUjaaNe67ZZIoj3nTki6yOj5kW6b1H3t?=
 =?iso-8859-1?Q?wNe8HfOC8pZrTxTcfue0SAVdAac50xKJI/nA9hoYeCvTcEAyHCZN0PhTCd?=
 =?iso-8859-1?Q?G7um991ZEWDSybf7RPYC01p8G3WnR7PVeccLssQbBrRxfzd9A7t2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7032b3f-c631-4de4-f2d8-08df4a961ffc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4698.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:47:55.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGVYXOgwueqBJOSGeogHMgJx6TTTe9IHEbGbiGyjOqYerc1DapHsV3mdY3bfNs+QCzp70dAiodR3sdMVSImRkJYn5GlXfGza85gFioBu6ZYGc2noeBiPAftpsOCNpW+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7371

On Tue, Nov 24, 2026 at 12:46:06PM -0500, Nicolas Dufresne wrote:
> Le mardi 24 novembre 2026 à 14:42 +0900, Ming Qian(OSS) a écrit :
> > Hi Frank,
> > 
> > On Mon, Nov 23, 2026 at 03:54:12PM -0500, Frank Li wrote:
> > > On Thu, Nov 19, 2026 at 04:27:14PM +0900, Ming Qian wrote:
> > > > Allow applications to allocate raw frame buffers with
> > > > V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
> > > > cache synchronization is handled by videobuf2 in its prepare() and
> > > > finish() methods.
> > > > 
> > > > Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
> > > > queues. Leave it disabled for compressed bitstream queues, as the
> > > > driver may access their payloads through the CPU.
> > > 
> > > "V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access", but here
> > > "Leave it disabled for compressed bitstream queues, as the
> > >  driver may access their payloads through the CPU"
> > > 
> > > Look like description is contradiction
> > > 
> > > Frank
> > > 
> > 
> > Sorry for the confusion. By "efficient CPU access", I meant userspace
> > access to linear frame buffers.
> > 
> > For linear frame buffers, V4L2_MEMORY_FLAG_NON_COHERENT enables cached
> > mmap access from userspace, while videobuf2 maintains coherency through
> > prepare()/finish() during QBUF/DQBUF processing.
> > 
> > For compressed buffers, the amphion driver copies data into the
> > internal ring stream buffer when decoding, and out of it when encoding.
> > Enabling non-coherent allocation for these buffers would require
> > additional synchronization around those CPU copies.
> > 
> > This patch therefore enables the option only for linear frame buffers
> > and leaves compressed bitstream queues unchanged.
> 
> Maybe just state that other queues are using vmalloc which is already cachable
> memory. What this feature does is allow not getting write combined mapping for
> CPU access, which is terribly slow by letting application manage their own
> coherency (or by using DMABuf sync I believe, can't remember if that was fixed,
> there was a lot of issue in this API btw, so check its states and make sure it
> working for you).
> 
> Nicolas
> 

Thanks, I agree with your explanation.
This was requested for Android, and we've verified that it works there.

Regards,
Ming

> > 
> > Regards,
> > Ming
> > 
> > > > 
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > ---
> > > >  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> > > > index 7cccc994fc50..c8d52f0af879 100644
> > > > --- a/drivers/media/platform/amphion/vpu_v4l2.c
> > > > +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> > > > @@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> > > >  	src_vq->mem_ops = &vb2_dma_contig_memops;
> > > >  	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
> > > >  		src_vq->mem_ops = &vb2_vmalloc_memops;
> > > > +	if (inst->type == VPU_CORE_TYPE_ENC)
> > > > +		src_vq->allow_cache_hints = 1;
> > > >  	src_vq->drv_priv = inst;
> > > >  	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> > > >  	src_vq->dev = inst->vpu->dev;
> > > > @@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> > > >  	dst_vq->mem_ops = &vb2_dma_contig_memops;
> > > >  	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
> > > >  		dst_vq->mem_ops = &vb2_vmalloc_memops;
> > > > +	if (inst->type == VPU_CORE_TYPE_DEC)
> > > > +		dst_vq->allow_cache_hints = 1;
> > > >  	dst_vq->drv_priv = inst;
> > > >  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> > > >  	dst_vq->dev = inst->vpu->dev;
> > > > 
> > > > ---
> > > > base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
> > > > change-id: 20261119-amphion-non-coherent-f61009334dff
> > > > 


