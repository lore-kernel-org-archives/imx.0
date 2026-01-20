Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD16296BA5
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927038; cv=fail; b=Ftvz7Dv7/27AvV7XWGvgaBFojjnqJkPESWl2aZMv4utsvR0XtJPMtJOJ2gn9AM3bLv1GygDH0VKcIDuFsTb31MCfyTou9YVmle4xbgT+F53nFFfWb9+sg56Z/VXmjSia1a6A1gzDOe4LKJkQy1Hmit4mjydefZANUjY9pbrADcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927038; c=relaxed/simple;
	bh=n9ptmd4Du6zlT6WZa3mbdpzt+GKFJk2370cuuwBb2AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tlWNPNXjkSGDjhifVT9ivtXy3WDKbpFdo6MHGLcpCCq3bcXcpKGz3YQ1UsSvNWqIPdESolBjUd6TAnA6jTPxcTgdvAWc8HbqHXzbiMbNwwYU0XzxEP/sWqGTan3IiiAxFspM/L5IufJH/ORU7siLYSi0r6sn1hcs8phVQAd73kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ih49OXtv; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ih49OXtv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYGguVGOTP7xoPwgaHoZ8x8jlQ0J+ekoXqXJEqWLSf241PQru7oKl3peN/ZOzkz5c+BEccGTNB29eL7D3k0doXvnSR8Y5aOkI0VkooMAlqLxXYlv+ieMxN5GcjqZ+CMfKauoIojfuG1eHdGKKpHN+HRm8kYpi1hoAxqQw4boyWKDvl7Z5+SzyWQYoSVr087JMLL636Uf8whRrDeazQP4iE49VtR0uao0gviYhfv3ECIKYeCqgZLO8ghsjvojQxpxZ1rT2i7WlEaNJ6G6scdQuOQhkSCgk0t4Si3mi/sQ8fEOQYG/QT1i8nlkqpyq7yJcl/6/HyHw9xSGtC93LbBfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6BXIAvdwBQJGkypie1HHsT021bhcHxOwmiLP3YU70w=;
 b=VwOh9sfQHrz+SlO/FJfGnWbbthQ5Oe6NukJKfZqpngB1g6Mi+ZSzVdo1uTpbMWPvb0fdfV/aeDmTlnq1DN4NCD8A3al/KIQ4fabe6EOatS7AJdXc8RVLO6mgdqNryYhpRooM3nDoApAJKYtWy4NbIJgEtKjt7TEMDgZDTMChZZ2ua+XHM4lIayfBAPOtNk8HePM7dtzRV+VyD0Xz7kWJeogsWyF74OCnWWvHTarr6ALPeqku7M5gLJLrLiw4LMNxbnzg1rtPRL8LRqTK7CTwyUKwK9LBCdeCr4pYSSNQI8WWwdimNKTobzsQqTMj3Q32MkMPbX0B2waP9dIPGs/Rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6BXIAvdwBQJGkypie1HHsT021bhcHxOwmiLP3YU70w=;
 b=Ih49OXtv3rwk1G4k3dub/zO8gtBqdgm5V7eprse1+0KOni6YuR/6R67E4eNZZMOM7Gg4OAs6taj/oq1KQCmNUk2CKjHVXMrucDJ3nYKqyix5cAx0OPoCl8FTfqCHzzkBhnIvIA9/Echwx+lh5c0AB9fXL7hg8glvsVqt2x2Q21s+BH7tziOcMPqFkHghzb8qEXfFQMLUpcJmNiLVKaUNkAn+TM7df0sbO5aIGNxZdq6rPukDm/xz41UtSrbBU6siFpZBkf+tNTgo9jCmvF+aw9ldAbapDu1yhpPs+5Jet49zB3txO9vsrfFz7lX1mGArH7J9zedYaYcI3MUBKnaXFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by OSKPR04MB11344.eurprd04.prod.outlook.com (2603:10a6:e10:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 16:37:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:37:12 +0000
Date: Tue, 20 Jan 2026 11:37:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/2] arch: arm64: imx93-wevk: Add i.MX93W EVK board
 support
Message-ID: <aW+vLiN30r6mZxp4@lizhi-Precision-Tower-5810>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120102604.1989725-3-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|OSKPR04MB11344:EE_
X-MS-Office365-Filtering-Correlation-Id: caa2c94f-eb16-4659-1659-08de58422993
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?IZp4ttltGUshqVdNAW/Ub1nS65/SFS+YMJIGc+Lb8NcZHt0zvCkR057i8yUe?=
 =?us-ascii?Q?MMXwyiXozvw5I+bptE8W4xcqMKmGHY6Bqohdb6c9o6TxuZLB8Qz7zGaV+3ql?=
 =?us-ascii?Q?clmqCesGTq43x7v5P1d/8F3E81B+gySADeTzlaCeTvSzBwgeTikDrF7UWgFj?=
 =?us-ascii?Q?Zm5earaK89fvwaQyPV+dlcXCQ0K5mS/ahLVE00USaoMXpqYS4Jy1SDUH8wpE?=
 =?us-ascii?Q?0lxoDmnLibaNYYJJ9s3WR8oFR/pUpQJ9GHYHK8uznYu8jSbCfAC6Txe/6ton?=
 =?us-ascii?Q?BdbuVGPgKjwTEpXspvIBkFoqB6+zC6f0I1zAiwkfkrtnUwjMOnlVrqH2eTpu?=
 =?us-ascii?Q?0/6CUzpV03sxVFahrAZKyiK6eRgDsDFUrylXNfJsBQT+eqGRGDa1kHKtgQLQ?=
 =?us-ascii?Q?N1jaPqQkT7wGLpUrQFtuczgcOHfFs89MhvL5rDpcO8A4ulgLU0kvUjPLsI9D?=
 =?us-ascii?Q?AnZbV0e5T5hAclhtOsOvUueKUyNlp9vZqnGD3wycdNsunFNuQO1GK34j0s7u?=
 =?us-ascii?Q?XduJTeqaD33OnqxZJF/oc9RE1SETxcjNzKMyODPKmdcnfdTT+jG1NWDdXWyx?=
 =?us-ascii?Q?ypylGE7JQoIRl3IhFs2cAlw630VN3ZFcjzkWUnAgy1IE8g3r+pcIoba9JN1W?=
 =?us-ascii?Q?L0rANHl37JLp+Yid2SIiqZ5I0LCXqP3uenmgN1Uf/YpTLc9JxXUNljqbJ1gw?=
 =?us-ascii?Q?5CNWBZ+U2vG4GS+CZ//DxtWERE3kFb0yrDruDF9xr2N8BxXuVSwoJAchsAKz?=
 =?us-ascii?Q?ZdHNapMfU6Ju5oew9hPE0lVOihMu38VZPAd3ygEvrUQIejqLmT3PtH3lqB6+?=
 =?us-ascii?Q?UU7NwPCE1GYlh9J8IQ2iADreWhk9UkSobWnKhYOv9YNn9LI0lGoq64F2NBvU?=
 =?us-ascii?Q?Wnj3ALWDwMW0GAcdx/+Vka5RwI+HhQ+f6/GCB1STsfl/FzYuBcmGJagb76Zs?=
 =?us-ascii?Q?y8+2PN6+Lf8wYaoar3//37fasqVvZqFJEDPs/Bijhm2cvJiQcwPY6TWpZoCs?=
 =?us-ascii?Q?yGbN5OWDWL79NmAILT5xs55Ys+JxQG2VQg2+q8AEY/efjJWfWLqmOL1lBAjx?=
 =?us-ascii?Q?+pf99b14W/yK3Akg69csFEUokhgWaHt8r5QK6ETD/L/zQbwoYhKVqSHurPZ0?=
 =?us-ascii?Q?tYhKRMCFYRqChQqmq+l7tzY4B6UoTZdLnD19+7cfLzk4fTN5E9uLNe1WPox6?=
 =?us-ascii?Q?0gPpZ/UNAapDuLFYhipRNpFzVDKoY0TZYMpCiNWXxt8BNLl6t/7MhuYOfP4o?=
 =?us-ascii?Q?poY5QhpdEwkh7NeRlhXYd7Q74/ui28NE1mfizCvnoHLAlLt9vl5faibohzZ8?=
 =?us-ascii?Q?rBwoycda1VZkbWqguMUTd4tkiOlmoCWk+IxaRgOwBHFg65OJTQPVDFCiuJ/h?=
 =?us-ascii?Q?xiNlXkaP4qmZbQeLFmTYNXeJ5QyXfnwW6ttSwRVnxdewjFQUTmlN2HR9RPO2?=
 =?us-ascii?Q?FfYyoUX1HawuJ03fBdf0q+HfFDWSx27SVghrULLTzGEKDApYX1TyqjLrVNr5?=
 =?us-ascii?Q?DN/km6SgtricZV2dojrqTR2acpA8tqo0ykAAe5kE3L/Po34OgQXuNpSJKiX1?=
 =?us-ascii?Q?KNWWhc8JqKVHB0+36Tw8NJvloLeLLWIK9BPlCztW/Zsuezsdw/V2nXGAfKXZ?=
 =?us-ascii?Q?h+tYG52OvO94UOatqElP6lM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?830pcmyIBXCWD2ZWnoL0FJ0ya3Sb8QzHrGUaAVGMsXsp9QA324svzJr4CfQ0?=
 =?us-ascii?Q?f86fLiQ6Mw5EzyFUgcwvQMTqFbr92Mx1lpad/Yb/q1MW+XSelQnHBECIhTE3?=
 =?us-ascii?Q?fXSAJLzJ6erazu/9c2yc12E2d+bcnYKvr4Q6HUiEUJzulZknEE5+j/EDki4/?=
 =?us-ascii?Q?NAZl/sMQQGxxphoDuUGBM8FjKrW9wyT/vaLkEd2w+eMDEhScbRAFdpLFJMtI?=
 =?us-ascii?Q?ACsHaEWmP5fGrxqwU7slerYIVKZwMStN7oPLgkHGyOxu7IG1UOuclQ+InP5q?=
 =?us-ascii?Q?PzmC8x+nAGFbBZBhyJ02ehQDTpdgr6bJqwzDgsEE1FJKFgKtc13nFOnDd/Zz?=
 =?us-ascii?Q?1/ohteRlCie7lGDCQovu1lGxB5N14iqDGk8QxzYKj8Rmq0gYCGtYCjHxpHAO?=
 =?us-ascii?Q?C+N2sHWRVwcH1S4NkC69ZYeFp0YfwnnB5wvLujUFLmPawAhaUpxaCDXGcXtZ?=
 =?us-ascii?Q?x8tCpJ3GKlGEMvm2wdK6sip/8CiJihKHCSSRVG/FrR+YwrJawLjtB0CyomhH?=
 =?us-ascii?Q?Np9VaMcWsUq7LdJxtIxH7SzKuHGMcjnPTxsq9RAuoxnedSQ8f6A/33Ip1h6T?=
 =?us-ascii?Q?T93oBMfQASzDtjllF1QfZc0PU+jyOcKNumgJs7gQwKtUi2v56C6pAtP4sci1?=
 =?us-ascii?Q?ODhQZhXZ3iN4p7//u9kEb+/KUESJoB0ngdTSCs6mWHTGOOgkPBUoBlNBVWQX?=
 =?us-ascii?Q?sxeINcboRmPIDcHvFzjIbw1JRXVMUMrOd9Bm0LkUH0SehE/wnha8byguTNpR?=
 =?us-ascii?Q?vpxuKg2byutg9lX0hLUV+dwfCMaswAgS8aDORy+rcRJmBugOcFDJIYcE9EGF?=
 =?us-ascii?Q?209CfASqZXtV4ojRP/0aCGWmZ7+a/D/OWQ1iZLYGKGFSRvn1eHGgMUD/n7cS?=
 =?us-ascii?Q?0LysVT2CwnNDz1OGiSVpwuMDQpeND2x+ebrkAydI2vfDCk9lsG+AMbqV694t?=
 =?us-ascii?Q?2rGohoSxoScwxP2/SxZqtkhhSdxsVy344IXNGqxlgPniSl2ExrLo7An2dESh?=
 =?us-ascii?Q?+68+195GKHR6jHyFJRGqItCb7yuWI+MPynB1kG/MRi+xFojHuhqC4OTWuDeU?=
 =?us-ascii?Q?zu0KejzRwIlw80cIvEhjuAiGzkZYvu4ElqwXVvrqyp7AIXaVJYOJT2/46ahm?=
 =?us-ascii?Q?LOMbELVKQpP2FsmWp/AmNpqzoLSPkj2VrqJrQs1zjM/58QkMXAk1QDsXx8Mw?=
 =?us-ascii?Q?jQNvXjSiE6Rdaie0CZGzWZjoRw8cg6CEkJ2F6QUHLWBEWJvyk5+tN+4GP8DJ?=
 =?us-ascii?Q?L0P4++GY7+1zBLJemqe9veakpbnxMMzYtxH6oL+lfNZdQzvnZ0TF4q2qnkTn?=
 =?us-ascii?Q?K3lt3ecUPbhOiMpMdJ/yN6R2JlsFEyuzSFfa7gnthhk20bPg86KQQwWCAT9g?=
 =?us-ascii?Q?8nPncuO3XEFUeALrUA4IonQMvaQhtOizmUQB8FpMYELaUJavSD+j6VlsCbHU?=
 =?us-ascii?Q?yuDnxbniLA3R8soIM4XO5co3gbH9XJf89eP5szyT3bj3BOFIMngDcYlM589Q?=
 =?us-ascii?Q?DTdTKWGq9CdeStdvv5iVuC46riYXlZusS/1S5eiy717l6EtBqb73E2ndkFHR?=
 =?us-ascii?Q?VDjamCNLgKXgs5gudAQNC6DnP3SDrYFg3xL11g7VlIXh0WZoYGLs7Sy/Z547?=
 =?us-ascii?Q?1LvIVCMS2xN6gUZa3GZ8Gp9YXLM8TXd/W2Xs8Vx37lu/1x5MprBJROX1oJWG?=
 =?us-ascii?Q?pRwg/cSfm8iCb39j8/e5pe02fELKXETRgEsbY+oleW5wbaRj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa2c94f-eb16-4659-1659-08de58422993
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:37:12.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXV7H+rrIV1fkP14L9oYjIkDWo9FL2Ep+zXUWpPPmj85N9B51EJB8BW/JcfXh3jhsMHfynMDiw8d3ZmDDkYDjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11344

On Tue, Jan 20, 2026 at 06:26:04PM +0800, Sherry Sun wrote:
> i.MX93W SiP is created by integrating i.MX93 and IW610 WLCSP (Wi-Fi +
> BLE + 802.15.4). And i.MX93W EVK board with the i.MX93W SiP basically
> reuse the i.MX93 11x11 EVK board, with some minor functional and pin
> connection differences.
>
> Here are the detailed differences between i.MX93W EVK and i.MX93 11x11
> EVK board.
>
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
>
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ce8f937c2315..5cb1b1d8499f 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -399,6 +399,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..c2c758b7f9a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts

Is it possible to use overlay file?

Frank

> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx93-11x11-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93w-evk", "fsl,imx93";
> +
> +	/delete-node/ regulator-m2-pwr;
> +
> +	sound-bt-sco {
> +		status = "disabled";
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&pcal6524 {
> +	/delete-node/ m2-pcm-level-shifter-hog;
> +};
> +
> +&reg_usdhc3_vmmc {
> +	/delete-property/ vin-supply;
> +	pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
> +	pinctrl-names = "default";
> +	gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&usdhc3_pwrseq {
> +	pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +};
> +
> +&micfil {
> +	status = "disabled";
> +};
> +
> +&sai1 {
> +	status = "disabled";
> +};
> +
> +&iomuxc {
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO15__GPIO2_IO15			0x31e
> +		>;
> +	};
> +};
> --
> 2.37.1
>
