Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0E21FF2A
	for <imx@lists.linux.dev>; Mon, 18 May 2026 01:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779067611; cv=fail; b=ECGVy8jC3wFPK1AIDciZdfgKjTUm7WMhL79cQdnMnetAozbVZEjoN/n1/Yf7VkkWH0iKOGlaxgSloGlGXKmlktfwMNfkgDhEBmsSyctcJmRVLAwq8Mi4Sr8S7xaOD7qsOrqyEVfcppU8GYZiKnwhjmNPJDnBoZpIIJBOI1Uj/iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779067611; c=relaxed/simple;
	bh=IBHpmeGMn7rOH3O7Dk18LpAlCG0Hr03yzSj5P58eu8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mJ2w/+iyYJ4s3eZnsTDYounj8rZytFP8CEzy8KJMuyHDttX7UVUutVxyKKqfdEvDDMeJKpSFOPgk3fXT/xpNpORhQU9jGRvBAvN+70ZrkMFFT14zAD5gVrAhiYjjczXShhQf8JgurhOSfiB5ivcpNUIjTatFp3hvQTLG7wp26qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Sqjd3p6f; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Sqjd3p6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwL1qHErVSmH5OdgBx6gDMFr/XhUE+Y9gqmf+7hwgHRqd7AFboy3Eymj1G5kxP3eyCmTTACfbMSBWhr2a9MqGxCbxZKo+KlGku0k2GY5pam5aqdg6/cEPYRaQSX+HwBTm+3XftDji9esNW3phRPxF90nF5lbAPZYJ3GstmFW70TALHkf+oBk5FKrVrB9I40i8FVZPMuMjfLbTE8LLCcBmccJi3P10mNEOcQclKFjbvUgRu/Vf2SUfFpa2QsESbGPO/kO6SLspVkRp/VdDzw6GIiqXimmL7cnNrZSa7NT2AfC20w2Sg9C95g8gZC14dGARYGALnauLeOQsflB33HQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I56UPKM+8gYnKMGMPWBdeYasr/JiNk0eXsENrsDC1Q=;
 b=HzN7gvWkHGi/9FLZ7ZhCK55fLUCmRzew6BiUhdWnGQcDcb2NiWLCitIiK+8ebVQTw5gC9PiLVniLs8dJ25C15TE2UuU8W301fiKuAw1pfukw9A4H10a2M3LWza8kNNAGGOoLNiEnjddmbejLxtbGYiUoCt9BJDdP5qzFLWlhcP2C5nbk35+Onw0CVeLQg/iwys68QprykKeoJSsv2qoPgt2s1OQxBGYZRcav5FGlVDmc3rgVL9FpeCd56SU1fLhMy9EpTU23uLeGcVVhNxIhX9qVvOEIL6GDLZzNuBXFBRUGlPDJXGXXR3RtGOo7/1uzcpLQHZBeLputSX6nG6Hejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I56UPKM+8gYnKMGMPWBdeYasr/JiNk0eXsENrsDC1Q=;
 b=Sqjd3p6f4RsEoLj911hqOCw3SRamkXVnVBk+nVSC4xy52l+fmUcFm/CKe2JvdrsZiH+gSDnpDwJ+6OXnsnzXhcBQAuoNkKhN6RN2UTTgWzCo/OP6Dau/ffe9CytHSEi1MBH5UQVcw3YFJ9XhbZRH6TS7RIir6hoxD9PqUEmHU8dFNNBhEaBX0ETUxqvoT/IF3aEJqrDwQN0YjG+bMUUdptB8PqobuRXstEPqZmnUryYm3272XHi1N1wY60Jr0N6BZvnPFuYUk2nN+K9+IjZFCaWfVIim0ncvJFQvFxeiHK1u7GVKo99lAHl4LsSwvTLssaNQsQGg0DwPzgkRoWreEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 01:26:46 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 01:26:46 +0000
Date: Mon, 18 May 2026 09:29:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: gregkh@linuxfoundation.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	hcazarim@yahoo.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <agprgizn9lF7utJ5@shlinux89>
References: <2026051633-doorstep-sequence-6782@gregkh>
 <20260516090726.38362-1-sozdayvek@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090726.38362-1-sozdayvek@gmail.com>
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a59ddf-0949-48e1-29b3-08deb47c86b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|22082099003|18002099003|56012099003|38350700014|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	f7DHamWTMYTUOKBq0Hxuo3W7d0ECL9rYpFwBZH2Vaj00E118qrB8QB+XwZfb95Xc4e2oKEJkrqLthah5uxiIUJAc0/GuzGcrej42rd5DVZR8YH4lTv6/dxAwVK2JklOthGLl8kUXGQsds0iQiLz0Mjpt6Y9VOG9MrjE9Fj4A+U7+0uNTQi/jCW6Q+F565OolMCarOjl4We+DJzDwxzO2PNVfE9SugdtpEJ9KJ0R1JFS4+GfepHD46pWZtiE687Tr7ArcuJcjNsXI6d1pL690jiYNedBxS83glBpBGOnT5JT+ASX3Rp1tHnP8YZc8rxrfQGLiyovB7SyG6Xb5gkhAdE13rkJO45vkF2X8UjHBr00hoAmNZ9d9WlrbFH7ID/0UhAcukFEVehZNkWsHwSVrsko6dLzROtXa03lcvR/Lw7UhnraGECu6E2WB6/thqjhY/LfvSTSrRE5xhPuxgxwziqKHT56DEGA7zkwn4t/RBXwzwrLTBAmot6dX5lPAg6xphTBjViznHh7euEfgPFOZf7dqqOvuBrB1/vTO58pCbYDR49vKX5rqs37xx+pi+xYtExxRIZowyUCNgGmFfxvsjEYPBYd5MDZjHFfaqjBGUXB4E2mkdyzppT/HdKyhAFeTaLs2RaOK/Dl9Zd+F/NahDRfiBmSItkTnUULM77OTRPEx46XPauy89VoxrCJ+WiVNAKH6p0wEoZBmX8pM5yaQxMF6uPeQkhmUhDmjSCKzttCEwrwv+MiCqr31SA4UO/lG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(22082099003)(18002099003)(56012099003)(38350700014)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?La7ZrRP/aKOSjNs83a6WfxbBjmzUAQq0+mLHV9X6hJqaswkYlEQfVl25S+zb?=
 =?us-ascii?Q?vBKa6XZ5gFQRAfA7kfIg8D8kT/efnCT4LrE4kDMBbCo+ilHgEV4X3vhwSjNu?=
 =?us-ascii?Q?27vJYhBzkA0m46VUs9C7qAP6gaFl+EM0/nFjSHEFTq2DlaVkz8mvKJIW65yx?=
 =?us-ascii?Q?Cn92ZWRFI1hQ+VpkHFL0k0ItqMMDJrTZZxU4l8/fFj4aVPWpNrRLqv6/YQBL?=
 =?us-ascii?Q?YNbti3mR22ytB46kpbNFwxK9ORD3+s91vYw+ABcPEJcH1tjmAj/q6v3K4ZBR?=
 =?us-ascii?Q?GzhQLOrIfeySnXDdyjsvQ0yShc1F2CYdv8RybRzbVNBNf/13riLLNdbfaD89?=
 =?us-ascii?Q?oQSkQVmWSIiQXTqBX/GfYvI99NSq2033fEVGfgQhocYuB7YTd1Br675RQU1/?=
 =?us-ascii?Q?K/BDYDj/OgzU/Qw8YiRneRrQy6JQVebZEsOy6BogjAIXVu8I4r+btwnItDYN?=
 =?us-ascii?Q?Ku7bJFCKPzJu2tq0ZLbNhV/Oe4+CgM+O3zxHWxL5M3TLj0VQZT5uw0v0BUFZ?=
 =?us-ascii?Q?QRscOdAd/9gHIezeaZCQ4gMT+ElZMABLNiCsvNKRmb8wFc24eVT79+w9K+yX?=
 =?us-ascii?Q?X9GGwiaAklwYPjULZgaZJVmQ8nOk+kltMWcU/GzRaTDTCProkEf7mnI9pmna?=
 =?us-ascii?Q?L+3kqZ8fq5Cv6mtqgRAfWoC8T7BdQ4pkk5AIop+kzS8HSuzEg+mUNYXf+aR/?=
 =?us-ascii?Q?njzYIUBaWaVHOr3cUuN+6hF3tGLn9ku5nzSlcswBdDOnuWWd1962bnU1HDtL?=
 =?us-ascii?Q?BcHkXTNYe8NL8u+MPYUwK+L56wJ8OWlUmUc6SqdELWLmlT44UTfmwwvO+jQy?=
 =?us-ascii?Q?H23bi3HcQERHziLKwvhocHWltaLR2b1qEwSm/szZOjvFs8zGQNyG6piHpGqq?=
 =?us-ascii?Q?isSghXfA3BS5HHzTh1rRXfhjBnlc81uG3d1V+ozkYnlaOF9xbw0+qawMtRM7?=
 =?us-ascii?Q?KhgFHqEhXS+ksRO06aI+25bDfsnx95uCI42qRWHP2waOtwSCqf5+OYuFck8u?=
 =?us-ascii?Q?DSYfjors4IGZZa/2XgxtjdxhFq2IhkaeeUzLsoD/3xV+UYboIwEx4dEFG7ce?=
 =?us-ascii?Q?kNfiElIGJ0NkjXBFGLZPzgsqrkO3/4+bXQGc0Bik6h6sRbQJayO5HLv5ExPe?=
 =?us-ascii?Q?M2e9ctjcG4uCkGkKgPgbaWBfvQ0DpnTTlREEpgT5IEXoTiLn2IwkixH/rGH2?=
 =?us-ascii?Q?6vB75cvJAPYIfq8y2uf3psi0HTGoKFPZ4/FfWg2xVucBlk3cg+ZOpxEuxyGx?=
 =?us-ascii?Q?5t7+/zMM+DwIsxFbrf7v/+XDoGTDipoAJ/yrO2TADbQ5e/j6VQVyuTMP7kxf?=
 =?us-ascii?Q?MYLuDGFIM3LA4C6oAZbZ481DjoSOK2Bde99S7DoDaUbSS35M5emfzhlI+B0Q?=
 =?us-ascii?Q?miKQwG1BoBRGX/eyT/sLFkmBjXHKDC7fWPrwRajGAoGdjtXtsryYgJGtX1jt?=
 =?us-ascii?Q?bFj27tOjUcKMREbOSoJ+h+eGRX0pBV2YZnaw1Cg/A8a9J/1856ibRl/MEIuo?=
 =?us-ascii?Q?W05/sQwTsLOJo57B6cua6cefPk51iJZC9aMAMpMTd94Jh0ANXJLelbAP+akb?=
 =?us-ascii?Q?X6407fq0ejqIYlIV2V7QVa2AKjM6kmDlfsuAv1hOr8D/dZveZI0P9qe9sXc8?=
 =?us-ascii?Q?2D/FIa6tTk2IOoFlnIGZjPO+DR0qhbbE9hnLzsnB1t9itHh36wY5YqaDR9hP?=
 =?us-ascii?Q?1mRCc9AzITTROiwVcpf6kRyuQ70tSYCB1MGajjXrbcE2I9I4NTgSfydbaJq0?=
 =?us-ascii?Q?diQm2wAdNg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a59ddf-0949-48e1-29b3-08deb47c86b4
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 01:26:46.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +71SzpZLBiadNVIT6JMbvJnP47z8AS9bQRerYGI/7rlPo2CxtwyZAFYkcE30S0bcPwr+aaIPcg2CLlXjqAnaBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597

Hi Stepan,

On Sat, May 16, 2026 at 02:07:26PM +0500, Stepan Ionichev wrote:
>On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
>> This is a horrible sysfs file, and breaks all the rules.  Why not just
>> delete it and use the proper api for it instead?
>
>Yeah, fair. The sprintf change just papers over the real issue, which
>is the interface itself.
>
>Quick check: no Documentation/ABI/ entry, github code search returns
>nothing outside the kernel tree itself
>(https://github.com/search?q=scu_wakeup_irqs&type=code), and
>codesearch.debian.net also shows zero hits. So removing the attribute
>looks doable.
>
>Frank, Sascha -- any out-of-tree readers of
>/sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
>not, I'll send v2 that drops the attribute and logs the wakeup source

I think it is safe to drop, thanks for working on this.

Thanks
Peng

>via dev_info() instead.


>
>Stepan
