Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A44963A5
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639268; cv=fail; b=bOW23f5eYt6VGToIvvWM61RJFYAQSJuekBFWWiy2b/nMBOY705QuC8XIsvVYplbyxGVp3/13TsrBEy5b9Soml+c59OaIK1GB9LgmDhuivmNXLZN8EADjYF0CyytNObXaUlYw14nJ8zOnrDAOe73FIV/gJ/FThLWv+AerlU4xvdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639268; c=relaxed/simple;
	bh=w8gfMcA5N7dAxN/T1nBIkOoi4o3/ijnZZks5Cf3ZGfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nn4ZqYlLAQqvxFYv5YSrOrXM33K1gnKForGd9C3USLZSOfZS85ClCWFVbp/NVbxDY5FF6IM2N0ECBw+p5ebu5QtcVPaDdr0q22YpNhml6ok8Ym2WzzSyv8jPcfhTIf76W6G8dwg8WevG4fnJppD8TO70qoULOv7jD4D4hot7ojI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FYeM5d5A; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FYeM5d5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1S1SDtRSgI4HXoFyhDFXuYaLH2etcId9YqLxdCgfdes4X5GT9jyxvaqvb2xCOwlmc7PN365C+5Nivwsv0z8XwzR0KncXKp9l+imfQP2ay6KVZqvdv9QhAzgFgjADn+T4GYjqNSJj7dKhE4vYdN9vMRdO7xlDfmWIEgxRUVwCuSk3UM3dVGZ5dcCOaMg0d1Pt34wCGrdll7keB+O3bGp+/X6nwriHIXDcEWZtw8T/0enGyO609LJtwoX8y22h4c0UtK/5NI5NU+vvvNfYWO+441pd35dMOz1VC7fiBsheul8iL5OEMmU4qFnxYgbWgZJ2oEiu4oHMqHlzvzz4WbWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wetiKKRPwZIQ9CgcD7hZzm3kXBrGLzLEkKMIaO7axU=;
 b=ukHHCS3X9DiGZ8fQDkUU5dHtAoLtOKkp13LstSF+hiQH6djU0i1gt0b97iy6kOxwuyOYpJ483q5NhK6wGzRDj1jQORx2SYld7fEQU44+LS+28s+wCnN9GzEJ6dSfTzG8PQ7f4fAw7BQfWmUm7uGlrJxpcVybfIzqtw8uog8cV1h7wCfeoqlsk7zacGkRoGcCqYf739Mn1EWBvK5mIy0fFQ+biO8rCxDQi7MhaBQj2x3qipXy212/HGV3U0JqeiQz/pvD4x9CqIUVgBZeRE239ePk6mTVp+Oyf7jKuse4OHnI5EeEDA40QXy9NbdS5AQjZSXsjXe27btQ0Ft8ANlXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wetiKKRPwZIQ9CgcD7hZzm3kXBrGLzLEkKMIaO7axU=;
 b=FYeM5d5AIQhU1pvaSJdYxcaQGPvUBVP+xEn0SKTaOsXR4290vjQ3CJg7s6jXPVaZZ++ztGjG5RCYpD0S7xdP6h3dBoxZJp2IEPSqiehf8hjWqqgmtpIyFReyHkGD90KaxLE+AT4TIItrqUeknOn1z3DXd6u93X9RPXaH6j+DamYrkuuHqCYKO3mPr1PVpS0XrDLkRMGNE+dGsLk/LtnuhfTeQNx5kFSH25+vK7MQCaa0pObjOPFCzZqX2XEX56+YXaF++su+7tRXaK/qIRottmsOCA12gpJXeuas/9Oe6UTZUGvgdcOP6vL/XKl1rstLkKaObKxa/IwDmH9KrNpU9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 16:40:59 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:40:59 +0000
Date: Thu, 13 Aug 2026 11:40:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: dsp: fix mailbox channel leak on
 kasprintf failure
Message-ID: <an3zlEsHUnFbjQsD@SMW015318>
References: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
X-ClientProxiedBy: PH7PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:510:323::13) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f18994-5565-4a3c-c4fb-08def959a734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IKaT0cFWS/mFzl3st+PP/l3uhuZ8G73yV1dSW/sN6AmwndAiSCSquHqM7572ejGRJ7+zUiGbldmgWpugZ7n4CME6aVN+mfvxl6KqV+KISHOzTEa7hefxsvTJ4CD3A4XsHXaWsiAtbTUuetOSJ4inUoqC6lPBEJoW4o4Z7KpsMgdOgIJ+MkOfKVizVQ7ytQc0Yr0CfKopL/vl8SCDJZrK8g1ZIoIOiVZPmzzlLl0e1Q1mV3ehT0leyYsexqgv8AR3SdPqg+2g4v1zRBQa5FSzHHkMOh2l04JCl4sicHOMbQFTauaBacfQAjS47Y1ldkunL24RfdurfY8rmYTYoOVT7RJ9IOcqTMJjcrTtQ0qBfM6tjgXpQZiyc4A61ty0LuHRy1j1FwGRHioP4/3ygiO4euxwp2EsjH4jdiuPaEcpnxEd2DeJ7+5QmMd8SgBDw1C2vbEnfp1v3S9MQMiQXEmY8kFHGDUqoMYHAHdqhWZSam0XWkFvAkuqNP8a79VfzCnHepUCGAPgHS5Osr0H5V53vK9i/qzazrQc0cL0vpK6PlQVbf2At8Ef0+Q89GxqXBTqKXOUvRPcmTXG2MlKSeyfdqLTdD1sqoVVt1wkZknj7c/kE9I0zWn1B59WDtL9e6HHmD3eeBkv7a++8ijxr7aSRoeflIMQT2RjoG2a60jfkN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zgbbfycx0FzLoJuurzsOvgixDFtLWb1FhFPyPGcORoGpU4f24REM0RiaG3R5?=
 =?us-ascii?Q?FSqB4vJd4c8JrDTYIvZPNcYhTd8Yb4fkmbeI9x59Dm6ZiD6C6h/kvKqFz4rW?=
 =?us-ascii?Q?IWwfSypU6OR4rBnyHpTA033yRRb118/UDjtz4tpi2TLARaXnHsEoQ5IKc49L?=
 =?us-ascii?Q?Odn8YEvQ704+4MnvVKUeKm41Us0PAEsCZpd5IEl+8Hpz2pun/E8qIZMLoN0u?=
 =?us-ascii?Q?qvSQc5PDdDz+5iI46/OufU9fAIXI8uZxpoKBeqSoJjHFTh9HU7+WXg/gHzV3?=
 =?us-ascii?Q?2nRdUlGhAsdDj/rId/ksb3UnwyhyLjsEfgl2ZCQKbU3CyPAAIu86sa7vQcAL?=
 =?us-ascii?Q?GjJy2e7GB171FP+Xn6763uYbQyk5bI9UKSNIkvAdCtLhtmNkXdcHFw5rYYx1?=
 =?us-ascii?Q?l6e3uATuzCzBKAR0j5oHnVyftv9AC3Y9MzYEIno0pruAxv9sd/WBVkuog2pi?=
 =?us-ascii?Q?w+d/EKeDEdOb7YOZ9RafmEjjU0GthEwFyl1HRlWSxDBwofgVwBcTsAK6aKSm?=
 =?us-ascii?Q?LQGJWtMKQlpwWkE2z9o2Fda697jc18vdjflo88heTHhx3ZWb6AvPH91Hysy5?=
 =?us-ascii?Q?RaN9Ywgd+OE8V4vxY4ntm/B3k2oympHAxCTg9qNALNAXgTpdeyxmfh2fVlCV?=
 =?us-ascii?Q?RlwpiJCjJfdhOeH+vQXBno0T526J1vyDtn+lQKHONq1PDmKrg41/keURzFVg?=
 =?us-ascii?Q?2vB73Px2gVHTFF+aGqDDV6pdifk21c0VB9h5FN/eReuzi5TiV5/KWEdN8K6H?=
 =?us-ascii?Q?8nKWlscOwR+8PmNElEOCG9PZq09u8jjoQieTptiK05Ircoc7VoyhJvfRtvLm?=
 =?us-ascii?Q?qTCzzvbFhxm5Vmmw4dGCyESL2eemR6G5VVY9Jj7rBCR2B5aWl0NKFOV4Znki?=
 =?us-ascii?Q?spd1Tz2Dx73SXnlPUNrKlaWd/GpEWrfSHqJC1V/dmNZUY5seRiN9yezCZiUb?=
 =?us-ascii?Q?/Hp71KZbvblt9Fflv1+1PPv6LYrlozNYoYj9l7eUQCJ03nC3HN+QTbk3myvX?=
 =?us-ascii?Q?audTCl00NO+nupc7tGNU0ZXd5QF6xFpTiurO52vJyR+GJFcj3JYTKqGMS6QH?=
 =?us-ascii?Q?X0mtRgPqJQXLjRnlPbA5AqjedP4kwRkB7MuR16eanQ5EDQZMguh0nI0NEK3q?=
 =?us-ascii?Q?wopfsa1mYgUP88xcsQAvBYcQ6mq1tYViJHgYCnhWx8wgnPoiWQJvh/Hs596i?=
 =?us-ascii?Q?/qygLc7OThmHTd9AxGdaHvSjF1F5NoYZggpattdjNU1CwDV6iAL9zMLD8ccL?=
 =?us-ascii?Q?7hnUuc3jv0Owo354K/RCPdTYmLavleFJGBMPKsS7jA5CSaGb3lbJJ7nQ+ulg?=
 =?us-ascii?Q?ztjLxEuTw08fIlnU818oSmzduEiz96aNbtQEIRHCm/01wYuyH9PkBLIEH910?=
 =?us-ascii?Q?UsQAIovoQ2rzpM9Ppx3dxdb54uJVDOf8bMUHloV/G/F7NXMKf18MamxjIcJO?=
 =?us-ascii?Q?YREV/98dYq3Nn5ruVUZbIWiPvO2+Z0nHjJVabRigsKW46FQNk5rX/wMHDmEB?=
 =?us-ascii?Q?vButBAYT/1ZAbYeC5Ctz3uZRJI18GlkYxcYel+SlUvRPu2IZADxI4u5CvPM9?=
 =?us-ascii?Q?m7snrp0I2a9HotElkbgPzw6wzIov2l++a6EOU06yTI1/qUj25xB3EKebztiz?=
 =?us-ascii?Q?UuO6HjIyIM5ZsWJYyBGLGwR82xRpbYNhYpRQJc2suBpPkWuV7OlOhSRQjtTn?=
 =?us-ascii?Q?3QAqC+FKj8zD9ICjKeA2uDwtX3amgVyJhGrZFREfpk6NbM2nm+O73PXb1W1C?=
 =?us-ascii?Q?UZ8u82NoN2+PQWODiEssULXVPGp3jTg1jKYFnn6IJcMqPJ0MKsNs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f18994-5565-4a3c-c4fb-08def959a734
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:40:58.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/mFbFp45ZrVxATejO70nl/9yQzvRMXzn7syyOCEd5wxnbCpXldgMxxJChiBATXZsQIRxFZoyRl+DoyWOMPwSoDo3ZysHd6bWH1JLqNLTyFjeHscoF7ye7S04oKAaTdn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

On Thu, Aug 13, 2026 at 05:58:18PM +0800, Linkai Gong wrote:
> [You don't often get email from gonglinkai@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> If kasprintf() fails while setting up mailbox channels, already
> requested channels from earlier iterations were never freed. Route
> the failure through the existing cleanup path.
>
> Fixes: ffbf23d50353 ("firmware: imx: Add DSP IPC protocol interface")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/firmware/imx/imx-dsp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
> index ed79e823157a..7e3f45ddf0c1 100644
> --- a/drivers/firmware/imx/imx-dsp.c
> +++ b/drivers/firmware/imx/imx-dsp.c
> @@ -99,8 +99,10 @@ static int imx_dsp_setup_channels(struct imx_dsp_ipc *dsp_ipc)
>                 else
>                         chan_name = kasprintf(GFP_KERNEL, "rxdb%d", i - 2);
>
> -               if (!chan_name)
> -                       return -ENOMEM;
> +               if (!chan_name) {
> +                       ret = -ENOMEM;
> +                       goto out;
> +               }
>
>                 dsp_chan = &dsp_ipc->chans[i];
>                 dsp_chan->name = chan_name;
> --
> 2.25.1
>
