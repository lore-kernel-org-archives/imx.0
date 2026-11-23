Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456530;
	b=vrEKk4fFRDnFyx4l1kIded3Wq7gg+4Tym8nlypXdj68eCSY2h5aIC9FIYfbQqicPmNaO
	 ZbEePp245ko0AWajQ8c4vZdOubUL9E3XZjiLNghzYYVCA5D0I2ON93Q1wp2CYGEOxwu5e
	 2+l2z4KLdo6w/PNH2L9V+r1MDMTgS2smeidxz0JElfTRXD4Mf2icpNfcgZD/H3U1WCKZq
	 Q7kJWhP2T4Qfj70TnewfBRrV+FcyFuOrDKYeONhHgp+QcRwBsu9/EL7Dn+7407Rxue0Eu
	 npzCKGYqeSIfliVTDbbuvrb1fEHJ1+T9AxrHcu8XtcadjMZLouQX9X/vswfHphh9yzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456530;
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
	bh=ghElwUpaaRqU+MvEOjecbTU+NW1sq6C0Yn8L5iL+TuI=;
	b=Lw3wJLlhcUDJeKz8xtLl/DPk9oRY3+WATertd4dSDvmncg3aEHxVJ+TDzA89iyrlxBtV
	 yRPP51TUvX9QVsXuoEL7fXiIPPmLwAZ7RF7GbLp6XHQoYtgEVuuXYBvKFqhUfUtzRWOeC
	 HyXz6xJhaHOOyOyVgdHwJ1HyTQ3PLRv4ZExONssyK2bbqALe+hwnn72ujhCvVo0darJ3A
	 oN7Qcd/GO1av+vEwEuWS3xlIDI5nhbBASnEw12qfIVsmrhdxcJxKe+maEqfpdy7Ox4+zb
	 kXtFiMxu53ZcwzTcVRHE2gPBAjuW5kl00rgAjYcCw51ipJyOxqRxyds7aLtyVWamq4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YQtEaezo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.4
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9760A261B
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB9760A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YQtEaezo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR54OaUc8rJnVZb+p3XpKR/OFuCdZxc7zTegyCju13y9Vqm/JDGsCcy8gPV5s0EE5fFPwdYdmMZ/9sIPDWwSTf8RHKkNc1RB+wQuiNlwdCY6XdJ4FMUMa3e3TAgN0x83tNC9/fKJ4qPHyw3KBlJAV+AgLliHLnI3O5c0GCZ7CaiP+BZp05H7WOocmoNgD+QXE2pFqtZiOOH5VgiexXvhEbA0KgWBBfq7SY8EqJDC4B1tEdH9pISvkd2qSaL98+WeRuWHi4lflQzZvINsKijRwOqP1YGWrJWZP07iiZ+HsJULS5wHYUmwwb9Gt9K6oGg9qOrY2DqZWtidbtm0WzlOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghElwUpaaRqU+MvEOjecbTU+NW1sq6C0Yn8L5iL+TuI=;
 b=hcRXaQMPKvLWSd1d1zkYdeBZuv63+X0QN8dxWz1GJ3v3IIvU907KmCJYvlUMG3U8jEn06o5PWj2gC2I9IH45L+rCM/P8ZV9Ycx/V7IlFlWjnLezCnmGn+S8XwXqwoqGDwaiAdfp73WXpugTzsXl4qJaqky9yaA+suqdy2+8AEHYCwOFgIXFeuFFowphvehOPAuv1fPB0ypUM1LadwVEJofTqoIupweteDxDOW3N59q7jpljLsRBUVsoCwa4LL08OnldohcuGeXaI/yB36CvsUUonxHnAjHzkWKzPhGIZuHFto0KgyI2Oxm0USjj/37oU8+PSEkv9M2NLdGdM1+0psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghElwUpaaRqU+MvEOjecbTU+NW1sq6C0Yn8L5iL+TuI=;
 b=YQtEaezo5Jki2pvqnolweyMzKEhNDcWIpm+1iMMape7NmR9WTeILjRp74j/8P23fDU5lDt96TI4jcDU1Qi7upk3Y6QGdc54mmjiBYdu0zFIO9CEbETQz8Q+D0TqX+0MNgKz75hoxH4EeP75vlyg40h6EjUq70nGF8L6TLSVDJWJoJI1gmUeGImn2baeXEpMpD6vTs064IVOu5VT0DsNrx8c1xEbQv+QIYzzdHGnb65B4ghpxE/D01ZaoeqVY/kq2B4LbEzwq3wo5rMty8QyPrbq/jm4plD8h52cpuWNR+pIKEk7hu5AWkIiVZaptZX81mFgUtj637H3fXHZmvZeX4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB9231.eurprd04.prod.outlook.com (2603:10a6:102:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:55:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:55:24 +0000
Date: Mon, 23 Nov 2026 11:55:14 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mm: Add Cloos CBASE support
Message-ID: <awR-Al7YQMSSqt5J@SMW015318>
References: <20261120094211.1742416-1-lukma@nabladev.com>
 <20261120094211.1742416-3-lukma@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120094211.1742416-3-lukma@nabladev.com>
X-ClientProxiedBy: PH8PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbf66f4-5bfd-4e7b-fc7b-08df498af309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261021123027099003|261022113327099003|261009223027099003|261022075727099003|261021121427099003|261026121527099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WWwvMZ+BovI66jAHgQ8JZM8EXdn3giGsRS4wRB0iEkjynYRu/zhAgXpRIwv3eMLRI8RjW3r0QfvmdT/WrNq0Sgqmf6QBKLlksuQaKY/l8TwJASsNu+QKu9smhEpbGjB/xyzhgZWINOet/i7eMCpCCElKHMVeKLgLh/96NBhhbqNRbw6T/aEhWzO2fBRJansG+GZpXwgdRZiGIyNrE3fPTn2Xbhp0eG0Oi9tmVGwljp0vgaK22fUwIAdhBp0GmqhHDGDnyDDarhUQnpYgdbEgXdUHPgiMiBxjoDZmKtkBnfWZY0tNWdiKXktfY+ZbiouHDtriUl76oUiBSPdXMis0AFm87Xu5po6cnP/Tk0CfltrEcgGxmgnX1X3nowHZpxlxJYWqePvqtefN9n4fP9GP7Tij5piGUarljdKtYIqtIkEn2Tm2nzboUvgRwd48ko1mUo/vn0Fx5BSNbdqjxvyuLSOyaNatrR5u8r+/aUSt0p6aIy9A8BvgQaGKckeudk3k1GdciV6QRI9TyPjQEwSVtV1IztbYvRdZvwBwegiZzL0fn0UjOftNCnxouQfgBOFG3Tzj/fQ1kJghHdn3urq81NF3WVUNbo/6F6rwRs/arCx3Q4NbSJ6rda8TtbWRzvq6t8Rir5drM5lpS3QxZrKsYbqvntEX0Stgnmo2qNB8JsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261022113327099003)(261009223027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pTCpYxIClDDRCtS4Inm1JVlxkmpk0smCjiy2rt/K1SuKIpvRBkmqH1MWvvW?=
 =?us-ascii?Q?8diSBbWpiBQ2yZbOig6mkG6TDPQdzyDpb5MSDClPRamqoVnMTVLY2cvdTFbf?=
 =?us-ascii?Q?WkYK3jm4Yc/eEWvtW73pu1ySpJ/T4UbIV70HcxSyN/6L/M0m4aWAh5wRSQsH?=
 =?us-ascii?Q?DAHvTkH9q+R8CJekgd+bAoZWS8fdHypODOsPtzrQ7UehT7cQqTxbOrDcl5fA?=
 =?us-ascii?Q?b3xMJcf8RMyq3EPf6TDYqPXdjEoR6xPxBAy0Ww5pXsIoxA2r2iIQ3Ffl6WAV?=
 =?us-ascii?Q?7vOYz/NhuDwxy7sHldL4hnjcZZnvPWuloTgGPtmtEBIqGAnr6ZlaiXUWwv9z?=
 =?us-ascii?Q?rcWbYYKV9zKRZ84gBPRb/slkZI2fXL9nrGh3zQ2GPJ/6u0wHkZ3mOBn8QTNN?=
 =?us-ascii?Q?AC6s3Sxg5y1ESh6FKi3UvOCaoY5ZadqR/5yxr04Ztc/eUpWNmLJ13Ycvbxn2?=
 =?us-ascii?Q?TC5b3TUbq/KjC+yH2UUPn0if180T5fydVQevhwdoUzYgU7g33gZt7VuoYWxA?=
 =?us-ascii?Q?7WsAqCW0suzek8YYIIwBqZS4Rv+GSQhyYr7vcIa5uvwDxh/XVrHsXl2jzjIw?=
 =?us-ascii?Q?rAGZ2eDt90WU8K4otLSihuaozW/oSQUqwzxLkmapIYMIHIv69TPkbSqFf0pR?=
 =?us-ascii?Q?GsT6Q4idoIfMT00mfeOjnAcdEt30Lx+zz43B6S0qyBCy7ACPr36Xw1VLkSKp?=
 =?us-ascii?Q?P6JoEQr71VAeXJQl2krxzoqanYKzqIOKzDm7DRIpntvgyIGsAMJzMAHwBDrr?=
 =?us-ascii?Q?T+0XhFxNm+eNTt8qIkXwYHJmojQzMjbj1ElRO81lJ3ACnvl/NTPSzan9ilI8?=
 =?us-ascii?Q?8FDcn+o//pKRDJtHfWecv/T0wXjp3XRkpXxqEKjgddiWZ736F+6AuQhe/I4e?=
 =?us-ascii?Q?rao0EVsMC+buYGg/wuuU7WKuzDA3Wp7re6mN1qRCPH2fpLAi/IGaHVFO5MjU?=
 =?us-ascii?Q?XYKmmVhGQnoUarMmRAAE1oIzu3BcqTpzEKJhe9A5kFFFxSsWZfNkWnPKGPk4?=
 =?us-ascii?Q?Q2q1C24bi98g3x9CRg4eUmt5mkiKCUHHs6oA8PG5TVBDOhNDhkOJpUxr8Yx9?=
 =?us-ascii?Q?/Qg5/1Qx3LfD7CJ0079mOiu2RryYZq1bi95J3LUo8ZT11Ha5iMCC5UWIQ0+v?=
 =?us-ascii?Q?hnNnT9xzaMv6SCAbb7+27dsMIvDPS0BicB4cwSwhYFYc3u0XM7iu92c87xh7?=
 =?us-ascii?Q?wdMxUQ75APWZnEDBPhSdgcmHaQceozW5M73afiAj8PJzRNfmAm4vj4SJAdAC?=
 =?us-ascii?Q?DTzR66hpJ0BXRA8cyyOLx0/2k2uiedsbPKDk/eDEWjG8M8ae/G+1ZBcNfV1Y?=
 =?us-ascii?Q?/hnvHLnpy4gPsEm1b9p3ZgksnMd3QDVy5SO2TS9GIKXoKhCWamsNqdKT52bf?=
 =?us-ascii?Q?aGGZtxaP2Yq47sblPd6UIEXC3xlB8dFqosm1OsSbkLQ3TnPK7YUDYJFnz/6U?=
 =?us-ascii?Q?aYmiPn8j4TlEg46XiDKL8TuBkAYs5upruEZRFpYEVfLgN48EhrRuUAcYM26o?=
 =?us-ascii?Q?wAlI75Ou+GNkjxEdEomQxX43mhARWg/g9NUiH7/7TdEo18nUhH27XceB/i0Z?=
 =?us-ascii?Q?2JIFknjnd7pw8eJlVPDxP2tpPitJzTX3nYqO0Lb/no/NVPMzDiYHOBNKvxbN?=
 =?us-ascii?Q?QkIjKRY3go6DT+kkUtsJ0s15gkBH7H+sL7dOO5oo+f/W49Dv4PHSvvgsZecK?=
 =?us-ascii?Q?x1fA83khKdJTTdYX3hm6teL9U2drVI+wNhklmRyEs4jv8Uc9gVJNvf+FrMpj?=
 =?us-ascii?Q?hpPZ1Sw26WyFp8ReSW7qy4FZz4qfjJp8DAevJYygJTPbCPpfOPmT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbf66f4-5bfd-4e7b-fc7b-08df498af309
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:55:24.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koVkMJUrLF6sH2CldVUSino9g/rCmIxzYMZTxt+OriPWChStwhkQIxuvzX6XdRZs9wRGPWJ0ZjDq0ddbj5J6gtXB95WkdRqHBSKhJYsGDHYUpkhQcr4rOg48A2YZbpMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9231

On Fri, Nov 20, 2026 at 10:42:11AM +0100, Lukasz Majewski wrote:
> Add support for CBASE board, which incorporates the TQMa8MQML module.
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Fix the DTS according to the sashiko bot review (gemini/gemini-4-argon)
> Changes for v3:
> - None
> Changes for v4:
> - Use hex values for switch reg property
> - Change subject and commit message according to community feedback
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 581 ++++++++++++++++++
>  2 files changed, 582 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb5..c14e5ae2e4a0 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -121,6 +121,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-cbase.dtb
>
>  imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
>  	imx8mm-data-modul-edm-sbc.dtb \
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> new file mode 100644
> index 000000000000..fdfa2ef9a065
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> @@ -0,0 +1,581 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Fabio Estevam <festevam@denx.de>
> + * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
> + */
> +
> +/dts-v1/;
> +
...
> +
> +/* SPI-NOR memory is not mounted on the used SoM */
> +/delete-node/ &flash0;

Use status = disabled.

Frank

> --
> 2.39.5
>
>
