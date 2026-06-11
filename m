Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABB285CA2
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190080; cv=fail; b=X3R4odszWXNLP7SQgA4X9g1m/iXIlE6RMb8YukYW4Kfgc1QUwyRSFmJQr9SL6w/QpQNCHIYnjJRXgZI2zaK3wiT9YvoYl+va9Bs/9jj5SntaQcW+tIxg6Qkycv5ym5jf0tWNu1gi1+OV5fJjxfXW7mXeA0oVdChzzY94CR7ryD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190080; c=relaxed/simple;
	bh=LAfE2K5t4gCeUx9JJy5CQ78L8WK2e6DeSBlzzKGZlgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sl6mOYltJRQpC/1dUax7eTIZt4M7smrKutYrmzzS5TRAeuLmpKD+coOhlxa/zPxjlvWVlotnfUYLTH6rsgwL4pKbK9JkDOBuQtyLfjzG4OypsELUVTE5hB/THpTTyL5JtYITUZrdoGZIMT2eVBfc9oHDZ47mNkhQirAJzumvqKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a9kMdLAa; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a9kMdLAa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozoRv8C1cHrRzOEwHOkO38+7KoEUh+cukmLHlO8ek/trM7LW/gR5H6mYNXEPUeCOEXmpfDIkDXkmZeWd/FN5hCEBo14SjbQ76Uu3s+hbF3EHjQ2Zl9DtbNQJk1SNkxpXTYFDIdiGzaxTb62UBaCgcguxPSJEUEQBJ5pgdcf6zTs4neM41fSAGc3vAgzXol2ehr1Sjr/QjmROhwyP3rdyvoge4BQ6pSBMK+AetCAK/F3J72KzplylopHudofR2vZDBOY8kkfvZabJOut1NOjw89rQg0qeC50dNJbdAiZxhzErhjUaqFgkpO8XHWw8l968StOE/3jnCewQ1KmvwyP+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5Ei4L82qa2gdzcG0s53OaCG6M2rn5rAml1REFQf7z0=;
 b=Gb7CtgyjwmFtKaWGpph/4aNXoV5h8qcK5iclpeB0lxq6WyRdgAB6oVVmkvXncdyNbwhPy6zI0ig9dkevf/1FkzGjAdMRUFVNE3TECBYVAbaAHrHZWuSMqC1+6Chvv43e8Bt2d47sZVjmiED9MZo60ibiQzVkcLyEr6Xiwp7gQegmQkJBE8j2dXzWEs0/4+N6iyPoKaLBwnLn4Y0VMb4ff71DnMECfItdkr08h6zehZRZ2/XFMEImAtg5OzYj9di3tHesFNslN+uuBlNFRwAyEW8vO+0q3GhPhT2Jgty0PV2fUJNC3grOCfZif5zi7xkG+qW7NtrGjmq2a2EQdbdofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Ei4L82qa2gdzcG0s53OaCG6M2rn5rAml1REFQf7z0=;
 b=a9kMdLAaIxjx0ekuIh6bBV6lXt38HZ+ZNzPIGOjG/Cl7smBgq4ygzLEKqNt259y7CaEnNvveuj5uaiCqlbbn3ql48jBuDHaAW49ybL9yhorKfVFi6jAFJnFqZenj3dls+2vAQeY2CMQnT2omPtHWm3DivGr5Q84CQAzzYDnoEDVgvFA5C1JNeBsy830oB3vOgHB9SFrTtggzfw8zMmGbHEwLDXTEc0chOq2OuE7vBClfPSHwFyczbEq343gHhm5a4wF3YCoIy6TrcQjzGzh1OlZQwg2rZw4qwaVvRbsq4LXArgBUhN7MGnNJGj2z4ATUJrn/AUNqrP3HipbRBoPTGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 15:01:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 15:01:15 +0000
Date: Thu, 11 Jun 2026 11:01:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, Joy Zou <joy.zou@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: (subset) [PATCH v4 0/3] Reserve eDMA channels 0-1 for V2X
Message-ID: <airNsr7rUpdhiCHt@lizhi-Precision-Tower-5810>
References: <20260211-b4-imx95-v2x-v4-0-10852754b267@nxp.com>
 <178111844864.1088466.7414551932762014103.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178111844864.1088466.7414551932762014103.b4-ty@b4>
X-ClientProxiedBy: PH7P221CA0038.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7d9a40-d6ea-4284-dc66-08dec7ca48d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|22082099003|18002099003|921020|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+TH7saxZpckki1uHgw6V6iKSOswyFTzclZuREfTZLeEuXDxBu/8jdqFptBFuVAo/pGvM66j4KAgqcQDJ7Z7GlG54mk9B5pzcYuGavqU/kfilsNOHk62Sdxb5qzHTWwmjF7OzI5H1spwSSe8kbMuuY71ZgoYTmJg5GJsivb/PlHr6D7OsEDUjjcsJEFQGqPkgfWvMf1DUXdwsm8LIEAvN9ZyJ1VoDJbyssEUI6jvA2DvaYAhJk19+flzJ8eupET1kor/HyECLw/FFdn8S9gH8bIw8jnwL7ft3MTboTV4Cv4+EvQgGSvbyNh+496V+bu4jpK7LNFkZRbkiA51MwUJBg+St4zcNqum1t8jI0TaH8JEaPmaXGq92Y63Cvj5Gni6xmlHXmostXOtlD8vo5iWmTadaQ8Wl0ATxSwuN/8jvJC6he58Pe34EEX3qiEq4r/BBH1pCfbBES5xew+JtiD+l5o+o+tWnvgwUcknTSOBtWyHMQBr8UXbY6bH9j1NDuT71d/ag+SSQf1TQoIkANzyMaWp+Xpm1HAYj9fDjttSuFxoNvq3ZtQtUcpDp4vx93iZCR/1QZn1tO86mSkfu3QLj0fV76x0E3kqPNZtq0mZWV5EHfFHASzzE5lMMeVz1jBbNbRkogGb1IwEg+x4y8NTk8RY6G7QJE9ieeKmRrIYvnY5g9is4d5q9WQ5haWAAeo3rLT3xtoAdeYRJ1rJL0JIN7QXmsYL/l19DfL8AWbX/eR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(921020)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QHtD3ifLL2RtLr1a2YOhO+lB3rW4nLhy4HNzGq0RKRWk7DfrgqU0h8GyxJgb?=
 =?us-ascii?Q?BIkGDrLkNCHxCWN+F6FstF9N3TZ5dYVW5NZBaK0vp8Pe5Sr+A5AJH51sCV2B?=
 =?us-ascii?Q?Ebmcmd5Z+NnIx/MYUxOi92WORjB+DhSQVUHcRqQKDM3twKc/i4xFKKbcK/LW?=
 =?us-ascii?Q?rTke/3wwNAjXQObxzirKh2PziXC/MkbNQeonJf63ivdyo0AIyGi5BnU/UI9w?=
 =?us-ascii?Q?l+7tcOPdJephbcc0z3O/MqgVCHNmSy5icXs5t7Z8USAeKpcur0QymsqbzFSI?=
 =?us-ascii?Q?pJihWEg9sE4VCPsIBnS8qXQrKQHD4Gcd78GA9UVOaUTOD5gWvblPdBGm2NLX?=
 =?us-ascii?Q?9FGHO2tnSkqSwJoqO8KJZLSaGXhZ/FcvdC+6vVv4yVRGOPEUlGxdMYgZeYKn?=
 =?us-ascii?Q?I/xzATm7WTdhtpASBAa1lKuxKgx0LEQTl+rj0ZSRzXrOTx6wWDt+cFlwawVJ?=
 =?us-ascii?Q?N7gu1ThcQzmJfHrZ7ZJJrm2BC3B6PeczIhHiLv/CohHRH0dZGygjy0LLoZzu?=
 =?us-ascii?Q?yM7chm/wlIqrvsUx1aIRYMjguyO53HjnUUByS1rU/0We7DkfTUANsjA/X2fK?=
 =?us-ascii?Q?B5lc1oapK2GlteYGhXl8TXMlAOnImjJO32Vbz5YXpYvo1H9pEB5VQLVVxxXQ?=
 =?us-ascii?Q?Pp1+CbXGCKxaKBuQ2/ZR+aPo8ZtRsQ6Jh/bbh8rwjAzv9TtUTKuo3DlJhK4P?=
 =?us-ascii?Q?dTh5FOPp7UY+sSoG+ED/P2JuUjMOZNZzhv5Ebgt+J+cIkK5awJfTP+lLF1qM?=
 =?us-ascii?Q?AAU3weaOuJDI9F/zTrFCEexTqqMJbk045H+suJoOj2Ojuaxh6C2EfvvCR0Sd?=
 =?us-ascii?Q?utZX1O3lBXgReOaaWEWEBrzwLAfX7lpLAkg8W6MrT6QqMYJR7xe0r+Ssz+ci?=
 =?us-ascii?Q?HkqAnjAXgSiXDIDKbI3kZQB62+FUYCkNaYGIwWBe7TtbkOWMuh3rUh7B9nu2?=
 =?us-ascii?Q?PqgSDx9wmrTmPI9NcqxpEp0e+TXFUHMIjxnuN9o4T9cUP1ei6J9uTFeziQ/f?=
 =?us-ascii?Q?HU829pKckusGMPuAp+CbyrYEjQKEjfLtbW2CnZQvKq6PLvNCjEyS6Pjs+HHv?=
 =?us-ascii?Q?4Q//QQa5r7fr30vBgPTzneEjpgFPDblE3l31Xc417KPXce0Z5naR1K+YaTqb?=
 =?us-ascii?Q?UVh3aJoy+M79gHbKnh0BBgG0iOZg5SBKDg+Bt4bdrfiKxtLGIivDAxVh6tJA?=
 =?us-ascii?Q?60AThd7Iqg+EY1p6Zl+9hrbBBbhunZa4wqKSTW6loUeptDowk6Z+NT77/Ie5?=
 =?us-ascii?Q?VyI98F8jdlYLKMioBmXtzA0XWgxhCjwspA64pka5ASL5zsF7OgQvlTJnV1B+?=
 =?us-ascii?Q?2ah/LzPRNXFRBcncxfB884/VCJgqPItYK3n5jFyZJpyDlyj+ehiZU1dL5Mlp?=
 =?us-ascii?Q?WAw4D8LIxVarAYuCyeWzk6RE1ikINuedFUW5qFsJiZe3DCH4or+hgROYYBJp?=
 =?us-ascii?Q?GWxUCjMeDqvfr4ZWbBxkLfZ5XhQJ5hmXvzJSfy90+hpR/Re5u+T9pOG93dMl?=
 =?us-ascii?Q?lFIMZ0hc6SA2zJUqMKIzceUMw+/4rfzTvJgop1U5BKjEkp5wsgPbj/L5VTBo?=
 =?us-ascii?Q?CaX9ROSp1DLIVd/hRx/g8waYZQc8o5pU3MiFKurBS9FFbhFPUklyzrh1se6A?=
 =?us-ascii?Q?AQlt7vxpeqWQIxR9M/NGtK4PqKLi5hfR951N1uaFwt0lo/9NdJCj9VG5wZyn?=
 =?us-ascii?Q?S/S+F5Gnmf4CAZC22cuDWfPf4/KvPxLoSnEcVwOALNtW3K8z+4GK0nwGg95k?=
 =?us-ascii?Q?Dx2VEwjs9jr2jpLB4jtQHak0ml6kL67sk/P32Hx91hzKBmHFz1wB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7d9a40-d6ea-4284-dc66-08dec7ca48d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:01:15.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8s1SeRjVoFbj2SwaPKkdk7GeOQZfNqdMCpNdF089PVhjItHBWInzJZ2GeEli7BbF+1X6BuhkEqrfahcBx417tdJas/T+XM4nKYstop/mKaNaa+vOSnU2t6mA+xQeUWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

On Wed, Jun 10, 2026 at 03:08:29PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
>
> On Wed, 11 Feb 2026 17:28:23 +0800, Joy Zou wrote:
>
>
> Applied, thanks!
>
> [1/3] dt-bindings: dma: fsl-edma: add dma-channel-mask property description
>       commit: edc448e785891cca747e21c6595e050d3d3fa434
>
> Vnod have not picked it for the long time. I picked it to make reflect the
> correct settings for i.mx

I saw vnod pick it, drop it from my side.

Frank

>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
