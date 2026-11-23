Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471347;
	b=pEEzMcj/L9scCyEOIt9UJ/p6hTa8QbdCRqAumroaEAxlVs4b/kl7klJ8+nN4OEWkPkof
	 QqBjk9gxLT/bk9usxNNVrzHtBYmg7kovfLP4ZXQ0QjLHYgx2i1+luGbUnzwJNZwwsONNp
	 rAoSiR6b8Ei5SNqSwGI1xl8XBEDntQGfAumnJrayfwHPE2iahQBPkW4pn+YSePWP0fXrT
	 b8NyngH9nQMDu5mE1EBQYAmYs5OGfaF+bP8Qc3C+ldIsBIB8h5t/5xGLv1vcJlL7jJVV8
	 5RtDAcl+dGzgWjq2djnC60V3JQ6DVc2LzmOSrXO2ZYNlJHKGUlXru+kAvF0NQaz01eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471347;
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
	bh=hNZIXWoi4k0n/8hG2FGeSkkEuzcZSnVPeIURpmwAYas=;
	b=KEGUe5XW8sVQRFPuR9xXOC9wQfC75/yXWfeXYde0tUaCaPWHllQGvWQPHF9Zhr+/D7yt
	 t6mS9iBhP4UtnCZrFz8gjH6dj2ih6nrsybWs0yV4caPYw7CysJXhTDp+BRl1fRZQrh8k8
	 6/wef477Aio/rxQGxCJCP10Ck0AC2Yu7Gf8fF5kuVbCYR3Wmc9KWTVlJsRWHnzzXOxs0l
	 C5kv/nH2ODH5bodA9O9yiC9/w2LDCqy1rJp6y4wJ7LJO8zAgUuFPdDy57dRc+v5yCCGK9
	 YmAM8FWa3jN7EPB0sQFuFR2eH2YYgzVCgSHei90UxWwd9f/PSbSo6jEg6HlEFKaevMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N5gmbuFu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.38
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CC606A326
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 22:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N5gmbuFu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxENk/lYcwP/b7KHQLIlV8Vj+oyQLvy1W9ZAH4tM7u/rLGFsZ0KfAezdUEZw7pZO1cAPf9fTcYxm+XZeEzc78C7VnXuuEL7Ams+1xVkwnlJj/u5kijOiaGrBGDoJrmY5PTdfWAz4EVCR2IwFPeovgjm9UbsL5/Q2xcmtlUsQjdzatbLN0xVbAF7aCnS3qOI/phS8G7fxEWGJn4GLt9jVshXtkWTFiP6G6tOenHlJTxr2ZsvtEwaB+JQNyj/SZVsAeQg+pGNJRFtsj90n/oyPSvVyeF2XOCCmZZDGzYsA4MmB1mCw6KTz+LhG86axAXWqCoQL14zbZKQeGY0QjwO4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNZIXWoi4k0n/8hG2FGeSkkEuzcZSnVPeIURpmwAYas=;
 b=lg895E4JQ2I/vGdiJMkPRs95lo4yahrWBBeRuVugeCQZUpxnHDkfJeSYYrVCjpWIb9cLhm2DY5fI6RdBO3Jhcu5Q+S96VmZITa1FOqIWfhiHT4/n83PYjrC0B+OFb7+EUtjtvQI4plSmfxeRoZgnA5wOfq1Rvq10lbW/oSBApjVLLXY8Oh3kt8aHtG8odS+u22wq0EySg0JcDosJJumv7CEfLxj9qNM2EZMfo29jIEhw3Qsy/IvDLaktbEKB01IbIchIDGqxVSoauAZ15Iv6ba4LoHGNQqqSUwF/h/9CyWTySgPw3te8ZPwgDY0ED4PvWSKZq6+vQj4+t+Ff+3VeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNZIXWoi4k0n/8hG2FGeSkkEuzcZSnVPeIURpmwAYas=;
 b=N5gmbuFugWlWCfJujop07qHazNxO4bNtOw31yFguX8gYlTXYG2Pu9GuaBNZLbiQnsNwcCmt57K9cFi12TJUdA2NWrqbcdLRE959ySCpw42V0hmj0uQjAinUxFhUazHuSieWaGjTXl/ARTFw8bdOT+y4ArlM/vgwe80SlrXSkC6e6LYrM0nq9LKhNVtGUPrchrsjrW8Y0uj43hyWINiv4Tg0N9+DnM2qOd4PbDRUvFGWOghpL2NlY5aUXUcoErERmPYisbzl5AACD/NoK4Iy4F0S9PVkQEfUC2IBQHvs+/u1cAZqs6Yrn+e8kRtWQvR42R8GB+PPDrmjrHeGpt0kPTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 22:02:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 22:02:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roland Hieber <rhi@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-skov: fix input supply properties
Date: Mon, 23 Nov 2026 17:02:15 -0500
Message-ID: <179547132959.3016020.4386394609164719825.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116145823.3018840-1-rhi@pengutronix.de>
References: <20261116145823.3018840-1-rhi@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013301.namprd07.prod.outlook.com
 (2603:10b6:518:1::f) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 504bb062-3849-47cc-ca91-08df49ad7449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OKZtn41lqdeHwtnDAKp6o/lfR0uBPQ/65L0VnYk1YUOs2XkGnkeRrRfHfWEMTqrrmTTOSTHjA+W0w29EIavYUsLuL234hhRM9V8YCLwezN7f2Xd5w6A9clKk9EAeZ/V52nLJzYAeHpSmhNPt9kayhwCnUspYrvy9zmwlx3AiIoMgYHiOxqz6isSwaFWWceLKNv3mEtc8CYyCXXUWud1951Qw8dXDkjD6ES1cUkEe0VWCegscciQXv6hmEjs/hoPUW98V5lLP+D1b4TSAwmxzgc4IKm66Nx7sZVH6LhWazpSbsnaRubzRLKpUaesIJ8IEUl/eOiOncFgXS8rlrqEsRiNLhA/+FWNANkow2GQrieELJJr/8PBg6TSj7t//PUN3g9s1HAIKci4uL2jm7YEEeinGWU2haKUAWREAjMiLbrVjBVyJ8oJQEmkW5ev2dUUSZylnJoX8QfE0INls0YHX0po6bZNibqTHZfmPFUOdN2yTnTaSciI9nSPpMGfqbt9Q+NErwbG4fEmJxU/3kbJb8wUxRb3KXeJ5Tmv4fiHxc+PFzQNzMmIj1K6cVyODw+Yi3/fORwu/iYvHXwvMsvEvSjF0qzmi0QMkX6NjVWIjoMoiKGsmTDQdsQ0S9i/seu3iKnoF27yR55BFwAps4zQU+9biWLaH7txGXdkmtufhkGEXJaVH8WoldXZRRRh1cBlgZyWG/KMce7/oASMhb8ScEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmMvOHRjSzNBNDRaRkpxcHl6M3pER3cwcFU0WURJVmNUaGVmVUNNMkRkMWxo?=
 =?utf-8?B?TnF1bUxmcGZpTndhd2RSdm93MFd2Sm96UE5ydzRxWmhidStXZS9uVGtJeFZm?=
 =?utf-8?B?N2llZnh4dnVZemRha3VJdGM0NGNNL1ppUENzWGFROWNSa0lsOURZcWVHL25V?=
 =?utf-8?B?V0c4OEN2SlloMHoxK3VLYzN3SlNNRUNtZG54YlVEQjY4MVBEUjJYbnpldXhT?=
 =?utf-8?B?LzR5enFTQ3Z2MGJtc25Lb2V1OU8wTFh4YmU2eTIyaHVIeGFzK2cyeG9USjFo?=
 =?utf-8?B?K1lhS2pOMDdTSDZBSlZCVURWeS83eWN5ZVFUZ0QwdkdYSDFRdzNLazRGMVNa?=
 =?utf-8?B?eGU3UG8zY2RvSDZRQ1ZRSG0vUXowWlIwU2QzWStMUnhBUTdnZ2ZiWStpZFMy?=
 =?utf-8?B?Z0hNd0Rmc3NTWHR6bUVIb05wRXJ6RFJPeStOZ3R6L3FaNVVDZlNRcUVmMU01?=
 =?utf-8?B?elNPL1BESEpBczVlSTJndGJNM1VaL3FINk5kTUU3S2p3aktHVVIwZDZVQXl3?=
 =?utf-8?B?R0h1d1NDMHRRaWx1cDJRYUJ3RWtFUTJsSkhwUjZWbXo3OHAzdTN3VzRLN2M4?=
 =?utf-8?B?U1k3WFlpY01ERDQramptREE2UVFFcGJVV0tVMjZNdEVvbXloc3JMU0IrUmcy?=
 =?utf-8?B?bVNNTGo2N1R3QTNQR0RGUVNLTXFRU2ZNMnVoQklNYUJiZitTeGlkRytWY2Ew?=
 =?utf-8?B?S1J2RFRyY3djRm9uaDhrWE5LMWIvaHByZkpCWlhtbXpySGg1SjczY1E3MmVp?=
 =?utf-8?B?L0VuSGhUa1QxbzYySGRZVFlqV2x4QWlSMmFHdDF5UlhDa0FWVTA3dXBCTU1n?=
 =?utf-8?B?WU50bjNIanQzZVFvdUxLRFVRMnJCcFFhTENnOHRJZUlxYjVoVzhwRU9ZZHJ3?=
 =?utf-8?B?eTExSEFkNzlSUHVvc1dYYmljSklyM3YzTWFmWWRnZ1VGZk5relM5bkJqc2NV?=
 =?utf-8?B?YkgrcWo3aGFYRlVqOExPc2Z1bUFkT0FWTFdiUWNZUzd3K2d0aDV6dmtNM08y?=
 =?utf-8?B?U2pRYXhqUys5MnF0VENlblMxZCs5UTRHMjlCK1ZjZWRyRHRQNTdOZkdMS3pP?=
 =?utf-8?B?OEUyTHNRWDNHVkVXSGJkbEF0Nk9tdzFpaGJhZHlEQXEyanVud0M3SnM4N3ZO?=
 =?utf-8?B?b1l0QXlYOUhEM3NXQ0czcGtBZnc1RVQ2Rkt0aVFRS3ZLeEpyTi84blhBK0FF?=
 =?utf-8?B?Z0dMM1VDbWE1bVZHRDdhdkwwSzlRN3c2OGFMNXFjSUw0VWFseEJVKzRhZkhR?=
 =?utf-8?B?Ym1DcDRQRHNvalh4WitkQVV3RW9lSGxrak9ZV3N3aFREdFVzMm8xSkJwNHIz?=
 =?utf-8?B?Q1JlckVQTzUrTHVLMHp3UHZLZmJESmJoOW84YUZ3UmdDZEV6ZjVjVnJzVlBF?=
 =?utf-8?B?MGhMdDBVUGtwMnNCNDFOMmxBZ0t5UjZvcy9HS082YWZ6eEhiRmIzMW1wWTNN?=
 =?utf-8?B?WjVkbEN0eDdZVmY2SGxxNE9EY0NlTmFneHdvcFZkaE1Da1NjWS9LOHVZbUk0?=
 =?utf-8?B?ckxTZyt0MDNvVXQ1UmNsc1Q4OWtPOVBHWkhKRzF4OVh3MkxmVmFsT2cwZmp3?=
 =?utf-8?B?ZGRudmlRYm9IcG9NSm1tM21sckZqRTlSUlF1T3M0azExQWtFY0tqZmw0Wk0x?=
 =?utf-8?B?TDRoOHVhbGl2eHVjTjVwUDNFczZFek0xVk9XNXo2SStucHpjOXVnRDEvZGhq?=
 =?utf-8?B?aWlhSW5WbEo4UVhwT2ZMSmpzY0NkYkVnSkplQ0lJS1Q5SkZtOEpDMzFOZTBz?=
 =?utf-8?B?MVZKNDhzQUw4SEVqQmRGeEpQL29XbjA2eUlFREhCU2pUcmcvMmtnRjVhbDJ4?=
 =?utf-8?B?bXVldXBjL0toRVNIOXpjbUNlM1ZEeHcxcGlTSzc3WkdNUG5Qd3hPbCsyNElk?=
 =?utf-8?B?R0pVdU0vWURBL0s0YW1RRFluQ3lGR1NGdTYveHBBSTRURWpMQmtXbldLOWxy?=
 =?utf-8?B?NEdoOUhqM29HTVQ3NWR1NUNrZFFaYTVnRUtRZzBLZjhsRCtoa1hxZlZpdDNW?=
 =?utf-8?B?WUtkWURzWWR5QWpwWWFKb2hBTmorUzRjK29OcmZyeE82eVVxNFRaM1lDSGFq?=
 =?utf-8?B?L2N6Wi9zdCswN0JBb1MyMmlrUnIyRE5JaGFaVkZVQ2VxcTF4L0RNZFZwR00w?=
 =?utf-8?B?bElOQkloM0FOQmdMRCtZd29TM2FiR2hpRnBneHI1Y1V3ZUsyWUdEK2RRZGNa?=
 =?utf-8?B?M29vSHUvbmxyK05iN3F5TzRzR3MxdE5NazFsOEN2OGE5UmxudWxjbkFleTF3?=
 =?utf-8?B?dEVTdHliVVNRTDN6aGRyZUxXS2d0emdqaWk5czJpdG9PN25pR3NRK2w0Wit5?=
 =?utf-8?B?SWxHZmxMTGc3ZXBqS21QM2h6QTNwMWthR0dQOE1vcG1LSDVxUFpPMDFTa1pw?=
 =?utf-8?Q?HiQE+fO/Dc8VJ1A/JaCCbSUMuZ3lmFI+7GaV2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504bb062-3849-47cc-ca91-08df49ad7449
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 22:02:24.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IpCHLveNZxXYfcjoYcair14TB2cLDvkBQcDADfoYr3Rmq8iY3I5E1hM+xRQkpSXkSyoCPU/OLxOlEAkmHzdM/Zt2AtW44SBOertQzkDygbIWFnd/SHGrEJpuDczFjkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349

From: Frank Li <Frank.Li@nxp.com>


On Mon, 16 Nov 2026 15:42:30 +0100, Roland Hieber wrote:
> The nxp,pca9450c node used the non-standard 'vin-supply' binding until now.
> Upstream commit 4c33cef58965eb655a0a ("regulator: pca9450: link regulator
> inputs to supply groups") added support for 'in*-supply' bindings, so move
> to this standardized binding to fix errors on boot:
> 
>   nxp-pca9450 0-0025: Failed to create device link (0x180) with supplier
>     regulator-5v-p for
>     /soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators/LDO1
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-skov: fix input supply properties
      commit: def2adfbbddceb640549774c85e7b4748906df88

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
