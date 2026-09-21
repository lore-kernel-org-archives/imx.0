Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BE74BEE5A
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010261; cv=fail; b=gxEIGNh5q0fjh3imcgGDagtJ1Cdqhd97GjkegfwywCNwK/jQBaZAFZB8Iwdgcg39q1dWCdW5ctIGR2TMzQR6kwP/G8cYGJ3VQBUYgfq+KV7+3urdyHD77K1j7j6ObQpATgu1QzFtgm/fy9i0ACMG4/4blwemB8aThyVftRVdcag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010261; c=relaxed/simple;
	bh=nrA9Xj7XGXM3EPMXPKa/BBp6dPLYUHs2CesSGo9o128=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b/2Cfqq/vVsWGM5+WufV+XMg9EJH5v4ZZtG5LufnVg8Go7jZiTvUsCFLSQWFy8gb6bW3QXBWaH6P6aKpGUWsCSP8ulys91zUIAJ1bwnZ14hTNZpzzsF8clTTUygiopFrsHPYix/HXDBsuECpyteACk6dUhKfZUj4tjnMGNqn9Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CubPWkQB; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CubPWkQB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bajCJBiAfbULfjZX38S6sg7X8g5vtihJXbIziFbCfKZ8fJJF8Uv78mjviPHuZtcTcXuzQIAXhg/p1v2EeZalwa6FThR/8a9dBYhm2sgm10YHa+bitnci06z19rEuyVogQTD7YgsFkkql77DT6PrPtkKkxjmPYH5Ui4KffRQ25/S9d14K+yjJP5VgUcXr8Sv9a4Qo+kLFikJHfedv39ZKT0wyc9t4qOyPE4zGEGAdkSxaHSHfRkjuanbu1nGGKsYcnaiL57GYq8F245e93ZonpKJ5UlQDvfkwZndELu97iPKHFzuH0xRDyITt4nSIIHMhLO3ALoDj+vfa2L/vu6bqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEQKgq61LC9Fg8HDfwNkAAHRBJbra6zaQUkH+aaUiMY=;
 b=HGvJP+g1xqOm94scDA7dwjnw7onMESZgONHqLlo7pedDnt66hrcSC9kJjAYf2tNs+MNoQw8nfkf2ZBD3G87LIwsSOscZRS+ryoRcCvZj8372cioicubNfAAckUH+WcR6FlF9RU8p+avyckNsqu1iLZ8mHLyNO3e6YtV41H9Rud8dd+o+LADshjl9wcCvjP/myAd5fTdShUB9lU68fZSk3Pv7k3xjKiGzkZWXNh8F+n2IGcEE1tPDW+/hoSjHcXMNq+SsRCnG9qac1Bzmy+MC0pvwt05ocWvfQeGA7KGizhniRhe+BINL3ka8T44EQcUNjYVZYqOn3sYDjsiYMklmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEQKgq61LC9Fg8HDfwNkAAHRBJbra6zaQUkH+aaUiMY=;
 b=CubPWkQBYF3ZdyYZ9v80bkFVcTfNjS3dR+PvOxTxkv2ymvR8YHGL29IN2AkTt427rOCtJs0Uh4Lc8u1y58uCGXUuJ4Kip9JZVEj8PGBqbg5r0cdE0WFG35bLhfTap9QzfMMLoxiJAq1fZzTlRs8/LuSY86mh1WzhbXsa82Rgp8nDnMEYdKKvxo7syPEgUCrcldx5H7k8YuzNH8NvlX7Q0Qeq8mHePHGv1lMWX4ZYqCUmHFTULHCIbF50m/w5lGBuxi7giSmXGj5NQn+oVvUlVQMNgiCiuRNl9myT4/+eJsxkJIb8Z0f2wru+GnXOvdeLlNWydMNqKnLMbsWTaXBvFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:04:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:04:12 +0000
Date: Mon, 21 Sep 2026 12:04:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: soc@kernel.org
Cc: Frank.Li@nxp.com, kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stefano.r@variscite.com,
	vjardin@free.fr
Subject: Re: [GIT PULL] iMX fixes for 7.2
Message-ID: <arFjhMrpfJ0OBjUp@SMW015318>
References: <20260921160016.1139490-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921160016.1139490-1-Frank.Li@oss.nxp.com>
X-ClientProxiedBy: CY8PR12CA0050.namprd12.prod.outlook.com
 (2603:10b6:930:4c::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 9148b6e5-33b4-421b-3627-08df18025bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info:
	/vroqT9GOqUpOYrIXWy0XBrK3Q6car606tWKE8S6QesiNXOpNeiyi2U1r8JH3dTbgGd6iqDS+Xuah1wbSeilbUmAhKxlMb+geMQZyzHHZqz2k57yO05BO4JdarXxhX0jJ6m1b9JMrIwAqHlcIgBiN2LCXJEMxDRXqfiH5WIH4qcZUH29nQOmaMdfu5IjvCWxesvosQxY5ssAvM7a33GoB+izRmq0OzmKztW0kZty0woZjFZr6SglqLH1gOQsp4VlPFrxmIA3TcCYmIfznTq5CTozXxcnfFovVBhT8j/zcwNjepabEGpkEewKkXmUbEyRQC2tjEcLYl8dF239QsVcGNUcHpxFFAnrj/lhilJVo9/IhB9uvMJEHSJp4pjL+Ep2CjiHu0e4/JYoqPZxxmb92rRP+heSm1G0h3KIH9e3dJHIv+VpnT+i+QNHt2GziWEmtvRZEefIYfhEQPE9KPcy3LVnqfVFqwmnytK3WlAPNGg6k3NuqqZJXBWOki6XiYgph5Oj/6IGTR+GiUOSpMBg38O6T/sxYqyRFP+0Y5FNZaqwInq5WW9uuETzrZiGoJ+84+r8X8Bv94+ttLXY9Rrw50ZN1JVI01ea4RFiUbCZR2dPTE2Mp+xRxoU4rdUUfyM+UDMH05MmRfCiztvrTCV8xUhP1TD3wmFZhFd31lg760I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CDtW/0jN4LDKtn1YWeJw+TVAgGPsu3UQoKp5R+fznFcLsgbmF/Nks5GHWIxU?=
 =?us-ascii?Q?J2y7x0+Mw+c4rziUTysIPntUrOTxG9Fkqe8a7dMz2R+iajj1tffcCmpz3+N1?=
 =?us-ascii?Q?SJjDPBaaHUcVZgs0rFX1pOfwhIIFs59bsmaxzZRHc3goozknZBqQJ771xjkb?=
 =?us-ascii?Q?/kBUSeKpx565KxT+Ou9DJeBQ4rTjLcNr032ydw5IUwTbquvUCY7YLbEu+ztv?=
 =?us-ascii?Q?pDMmLyR9PJPrPXjQVy9JfcWecQGPBcfbDYV7de66dyz7XgjNPiwx93d8LZNx?=
 =?us-ascii?Q?57BPPYLNxQgmQ8Qbnt4VL0lX3LVvWkal/IO3Wo3BVLA4DS1Sf07Daj05AJDB?=
 =?us-ascii?Q?g1dPR9pqstevpyfLu1vjPTHGBVFBGl4RZP51O7mUaYQCA2ndUAD5sOElWLVs?=
 =?us-ascii?Q?w0XVpiEutGPZpycNkyt0gag8De+wlbUdKhZsPO9xe2nZ089YITDSBq56akk5?=
 =?us-ascii?Q?PtEpFkSw1gg0rc6Mc4lmVxO4JjjzXpvAnBu9HN3mHs4+3I6WZCTnS/BmmNbl?=
 =?us-ascii?Q?x9n0zcXFzWX7h+5FOzKIbYZ8Ul52r7vZi0Gu8Mhseyl2LwpUnE4j0NMbfzRh?=
 =?us-ascii?Q?3ewCvm65iCNL33U7EGmbtrOb48DCkCJx92OylnzVOXnowdOHCMDRYWo6XbTA?=
 =?us-ascii?Q?6azk4HP+edBYJmbU1cXcKBDqC5qUC3kC+Hk7brL+nC5duSP8PSMCHdWxMa98?=
 =?us-ascii?Q?Yx3IrnzuDu/1nmOY0IP0+UNOOxhMFhVzQuPV7XQQ1mJA+OOB+K+CC+MISHga?=
 =?us-ascii?Q?auLrW0iQkh5/Y2u3RCUJvEAUYKsoXdWvLfWKn70ci8o/nanyjrOrXT2A5IsU?=
 =?us-ascii?Q?MetaH5kKQCtywcN4pxTQxnfg8+qMi1GlVksDbkmT8LFWFhTQ5Y4sv+90JjU+?=
 =?us-ascii?Q?zQWRqPYuoV6f+VflJnW64ixRyQ6Bd+9Z+dGrabSIWE4thY139aRQW/DyD9ve?=
 =?us-ascii?Q?xfU3q5D12HGjqPrJv95NzDc4Vt/XnUn8uodjrugt3Sk0T7cgN64Ef2Q5Xtk7?=
 =?us-ascii?Q?gp56lGwIS0/EPw3UqWXG0dZaread/wnu1QBrfs0Gl2Qhaks/lWr/h7M2irQ8?=
 =?us-ascii?Q?phCn75vUKdFerLVup7II4lfP+03QMbLaP1AiEJmTlj488ydCpQRVR7YFyOb+?=
 =?us-ascii?Q?K3nN2YjNr5N3tjb3IdAkrXXgoq9GcrqGULQAnDCiMpqCM7zMXEKZ9g2FHlK3?=
 =?us-ascii?Q?rlVpxCPWk7uS5KjbbXe/sF9WZzLfHwbhqVYn/Lf1WbTHFDCPo/4/Xb4firov?=
 =?us-ascii?Q?JPa0s4dNNbxEOksGWDsj7KkuvkBWExUDK3aXxoqjJSUFY+2eiiwpkG7dbCI1?=
 =?us-ascii?Q?Fe2gXnSOE7qBEXjGxUxaeK7J2FckhHxO3pT7bbSq+aUFPxq7WxuwBYN7R9Ti?=
 =?us-ascii?Q?QbO7FfoFNG4A79X5Is2Vu6JUegAslh6JoltqUElBzyHo7WoqD3mRKkuMkk9x?=
 =?us-ascii?Q?FD16oK1iK7/woBN7sSW9rfy32aGCwZ5FhFle7aEhIX9r/vsIOaZs/aHpZ/N6?=
 =?us-ascii?Q?b3eibEQ2gSJ6ZO3y5QSoCB9BKqMILNAlyRNCfCP3OPO4xOLeo+KG5BPC8y9F?=
 =?us-ascii?Q?PcAhQFHelGL0chOUFzlUxEa+eJj0OBIze0AkBoAJqVyQyAgwGwRVViyDT+IA?=
 =?us-ascii?Q?dEvDe4HXimPLCcVM2sb0Kft85efR+xm8wZnZ40NrRgnTpM1yCJ1UZuSm6Fxa?=
 =?us-ascii?Q?IKStn5ms6KTdIZV+SIvbXVquYSMksgpY0OyHumx0DKjKdUZnVuo3CYpLYsS2?=
 =?us-ascii?Q?wOWC+cfC4kJ47og/l0hkyb6YL5Evqz/tHJj9p31ABVcJZSd+8fyy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9148b6e5-33b4-421b-3627-08df18025bbf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:04:12.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TysiNdDEtY5N1MDzLNtqSu5YS9lbbhmoFEEQ6Vzkegf3YPRoIfJVQixqKqJ+HhlAmeu5okD6XqP44qZ/HehHtbD3Ob0GpQipvsIjT178LXabv0ih9RsuO2UZzIlW2HOp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

On Mon, Sep 21, 2026 at 12:00:14PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank.Li@nxp.com
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.2

Sorry, I mess up version number, it should be 7.3, I will resend pull
request.

Frank

>
> for you to fetch changes up to 7ba5290db6bf365e46fb70bf13dc2a47048165ea:
>
>   arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply (2026-09-11 14:50:09 -0400)
>
> ----------------------------------------------------------------
> iMX fixes for 7.2
>
> - Fix incorrect pinmux values for LX2160A.
> - Fix Sonata SD I/O supply to avoid filesystem I/O errors because the kernel
>   was disabling LDO5 during late init.
>
> ----------------------------------------------------------------
> Stefano Radaelli (1):
>       arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
>
> Vincent Jardin (3):
>       arm64: dts: lx2160a: fix incorrect pinmux
>       arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
>       arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value
>
>  arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi         | 19 +++++++++++++------
>  .../boot/dts/freescale/imx8mp-var-dart-sonata.dts     |  1 +
>  2 files changed, 14 insertions(+), 6 deletions(-)
>
