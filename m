Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0012C0281
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739549; cv=fail; b=ouU9QYG7XbCy638mO7Xf7dquxhAfdFdA6ZBHkFHMklHCuJ19Rw4KYhka4l9UM/hOzdmWtLIzvrKcLI5ZV+iEiwNfb9EQVaw7A/gqvkfisyeSMXczezcD/Y7RYEGWr1lWiAYfCSYRMnlC/BHmnQsEH1twp8jVqlXUPV2x074vDrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739549; c=relaxed/simple;
	bh=CIeTmqerQmCbFDt4SvCYigN927rCNwqcS8HWBorW/+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iz4lm3bXmEmo6PGHAEI27WzpO8ht2OXe2oxYfHmS6ZrnGY6TyGCP19qeTyTIJm7MKVRMpI3oVPHmCLzr1r6eZmPShxHp3EFY4JyJEKprNGXaLynZYjI5JvSj4nFkZjj+BUBcXMLNcPYC/jOx7r8IfjCc53Sq5JfmxEpSxLz/okI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XCiNEyAx; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XCiNEyAx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+JzLerVPI1XrcFZI07G3+wL0bDwNQpft0pMmK+kpZADiURZv6kpHj44o39GM+oadGq1SOKZyTRcyKdXQF4Bi4/5Ir//qlkzYP8NwWhLoUwocBVuwmPuP2ctUWjLnjAHea53nVPu5cLPkJkCgVJK7/2duB43l7gkrtULii+Sox0YrMrFS3U4Nf94ZwbRTwfhD4NvpN4xqIn1KBILnlBLvazCwEQIng7lxIjs8xqvGFV07gYycoF7GtwmHFp+TrmniRg3MhGufZCY11NM35/CeyywWfvxU/RpnH4Ewq4m5Cg9LRO/GdlN/rbr1C8CAmHvl2+q+fhYM/AAG/TJPWEQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jujZf960hjE8V7mTv+3ptx8+OGcL0shH4k+ZMPIGEPI=;
 b=aKMsiXQbHt3pYOhzEkOTqoMjfPh1NaqQZP+K/WUmSxJ+X9Uzi+8EwdJY13qLAFzAl9mlD4itAmRI+D0e45mm7RPjEgEAyvMIbPnbMi1Sh//UWOOSUXZCxxeSz/Z6oKDLVT0iitUWsN3tcC/PSxHpxHU98YdorkaGeEwA0EMR9fTAaMK58UELi4P7jm6KmWVX/Sa+k8lJna3ieLgzfP0tYiwGahe4r9SX5aCkSluZ6P/3L2m5WDhy8Zzia97tjV2HJ688RFd1sESrKjk9Fw9AStgTr1gjpk+Ob/3cc1eviEFvCdOvxIdbTF6t8HwooaM+xX+eDQo7dHG3z2m2kh2fMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jujZf960hjE8V7mTv+3ptx8+OGcL0shH4k+ZMPIGEPI=;
 b=XCiNEyAxaEO/5yzEztq9kmyZP4BDzaHW1xGoH4GwFkPYqz07sSpCQ7SjFVmBEljt9xAqj5pHZGcvAFax9NWu1KVqwnhK0OKmwLsese2KGnUBUtgTsDHjMHBe9epD/VnOZSH+kYpv1oUaa7gOVF8Rw2EAVrNs1TF2T8qsJReLVdWsYP6Z/ummRePscATN4UgQdkMQOkrV6MWQ2kr7T4p+EEx0MU0yn3jP1qbTUPUmYFJ6qpKIUPPBAEKPsfhfAsaHc77bo6KIdNck+oc1MgcdUDrpOpvOki8vzPMBo8eYfYpJx5fTx3oWYGlHW7dL39KKgfNv+dACAARD/JDbqfvIMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by FRWPR04MB11151.eurprd04.prod.outlook.com (2603:10a6:d10:170::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:39:01 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:39:01 +0000
Date: Fri, 21 Nov 2025 10:38:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
Message-ID: <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|FRWPR04MB11151:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c7cd38-760e-4c5d-db34-08de29141818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pMvEQwS+zw0iUDaIcdu+wRrJXCtmnW5WM5Nov+1OXick0eI9wq1SToQbPcCa?=
 =?us-ascii?Q?Kl2x543vPzuKsAd+AmFT4AtmuHuOEkYuVrtPVBAAM0w2vriokmwH4LWfrv3+?=
 =?us-ascii?Q?SoFDGd/AsK7NlUS33u0eBnubc32JRVf8V7UdaVXbz3dK+YBE7L4aZcGmMEwN?=
 =?us-ascii?Q?ro4rQtgCviAflpWTmmZV77T7c2Gtlz0nrtGMcEPcKp4QWnykB7vCkmmq44ot?=
 =?us-ascii?Q?lwFh+wy0t2Mj8jWToJakg3mrJkpf1VtcK5w9+1uRLX2lh+vNaXWpHr4xFDYs?=
 =?us-ascii?Q?5mM5PX/Gxza3CYSB0gsCnIqi7AtC4W+ZtnePFOGv7dJpSdCs7Wr86FK8nYoq?=
 =?us-ascii?Q?JMgI/Try3leXb38vaodGDB8MOkO4vUgWqI4dSNbA6eoYN/azQES18SN6Vv8w?=
 =?us-ascii?Q?WwjNGGxftXbaLqKUfPHvqEf/jvHh2D9YSUBvHsPTJfvc/uPkrhr6aHQKiL0v?=
 =?us-ascii?Q?+zrr2ce4rcY92UyB+aNrcmVaRvwZTZJAquPgWT/fXumUD5lYBYX/A1apEqwf?=
 =?us-ascii?Q?1lJOLDB5bVteJv3iKK0IpaVy8ZwfWkcA8QqIsKjaKVXjXdy4oPumus1jakRW?=
 =?us-ascii?Q?vxzfmWE4XYx+c2TJ1ZRaDStOlIOJqMCyM+NpwKQVHcAiVSQNXGOYCq/Rc8x5?=
 =?us-ascii?Q?29wWEHdQfTzKsN+nmoTQNMBP3coYtnA825aVAnCqkBuSYcC5ZrRIf9QHQzZk?=
 =?us-ascii?Q?r4hu2tZ8j5DRgjvN8ZCpQdrp92/QHLg62VTBz7d7AImbsP9moBn+e68Osydl?=
 =?us-ascii?Q?qzVZ08NQ4loI755hh9qhpceDU2jcGwrEYS4Fnb3Qoijs1crzkFE75sGJsJRC?=
 =?us-ascii?Q?h80m6l+0qMU6g5zV1X6Cza+jU1QdypKwGrM8SOe4O7BoR4ZxvlQ2+loh6wCi?=
 =?us-ascii?Q?NoDuNoPePyhvLTB9Kq8RVGqcHn2HyJ2hkEsj/l6vTTXbOTb24gKyTi3i00kZ?=
 =?us-ascii?Q?5NizH6LikqrX3WDMJQGmmH62CNYaj9q7dE/rBz6Z8sbabtb6jxXEbERxHwnh?=
 =?us-ascii?Q?I/Av0P2B0W+vaoLqXLnnaPO1J7R00MjwWwVysk62AY1P4pTghEmYGN/JjhSf?=
 =?us-ascii?Q?wR5WhljxLJKwcwUFYz/tKGUjTq3+gE4TG3Uh6IkwPYAxgPVgY01UkrIj6aFx?=
 =?us-ascii?Q?967EJ7QpcJCxeyWJObQEpITCK0g0wrLxvOLyFpaZsZ0CKNSYhXFS6BUy82PK?=
 =?us-ascii?Q?JdYiH4+4xU5ogg1NKzsQ+T1YkfOhDTnzkMtu71KHLwS8Hw+mPyZUqhi0R5nL?=
 =?us-ascii?Q?Mw8UgqIZDmoGkgPEM4iww/B8O/fclOsGfTJOKRia5qxqeTHepVdluCAz6bu4?=
 =?us-ascii?Q?DIoNLI0P1AAqwMGtA0RYoIMCAkm1n6zMD2Qb+qfQY82dxLO6Pa46nA5gPf+p?=
 =?us-ascii?Q?AmonEtCrbVmyKKzTJN6qdrobANa1xmfVpRIKSYrN78Rl+NvKnuoXx75Q12MH?=
 =?us-ascii?Q?YssS2jyuQX/6MXQHtHYlfJy4yZOIRCSFbJsy1NX73/kMi58t+5eqGOVWg9On?=
 =?us-ascii?Q?gc4G7gc31izOs6zc/JR3f+ejty6/XM4JO03V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WbuPzN/OpzqR22NgL2u1NBqvSZ96QO5upcHcEjlW6IVpMdN12BgB2L6ji3GS?=
 =?us-ascii?Q?94/S402hrgWJDnsWf1YO4t2RCK+AaCRudWouL71Juk9Dv1JKJ+8TSPcttUK6?=
 =?us-ascii?Q?4uYwCKKmq72pehp7qELPyGHkVBEx+dx/GL6byAxsFKYvx3F6jUJxx8gcfhxo?=
 =?us-ascii?Q?zcI7yyFbDPr+r5v6ChPrxn2fvmLxlgVZxC6Ke/7/2DBmfHRjeWVwAULAHLKw?=
 =?us-ascii?Q?/r1qI028H5/8E4V5l05mZx6Jhq6Dd1G+uR1DBlUwQj4rFA6BSu2XJ5FM8WnI?=
 =?us-ascii?Q?usbUwVIhVvR+SY2DNBPv1vCYR7BhYCEaTz6h7zfmeecu/gM/+SGeTnDmC29e?=
 =?us-ascii?Q?g2hCLyQtFK9T3f4VLUpTPMGyvPXwRaD5yvCoQTM1VxutgpzKvxdw/C3hETTp?=
 =?us-ascii?Q?yxCq5dKDg+4bmbfvmZq1sqH0jxPgeuqaA0kh1NQfC7AGPmPafrUkNLGISIfi?=
 =?us-ascii?Q?uUTLK3XQvoLIlIbkPuK3nBu0IPdibelNVSHnpgA8rSVKAsaM0VEfzf+WlnSN?=
 =?us-ascii?Q?T70YyA62j+LbR65sx9yiY3ON7NHUWrw4NCd9QczkVpUF4JKWjL02PwEonyEa?=
 =?us-ascii?Q?qKESF8VPz13LFyIB+06PldZbJt4nY5gJE0J3NdwCFzeIQKR5mvcg906a7q53?=
 =?us-ascii?Q?J3hhjb9M9Os5UByt9GOJ0l/mK15IEUNNCiy7o3qjNl4oVyBsmLjYrwWdQETc?=
 =?us-ascii?Q?2wNKcRjKczUqSMAhu9DJDlu7tDh7Ro1J0CN0E9SemGJkSW9TK1c09JmfjPOJ?=
 =?us-ascii?Q?YJA4/UoAhBTSLj9iRCa0Kv1o5rkkzsPM8VHVnx62rnzEK4H80XU1hZCN9Oey?=
 =?us-ascii?Q?NfURyFjZ7oCMLmxkF8cpi9Z7GIVTNCgmkTjSK72J54gy6rO/TwFH2C0J+A/q?=
 =?us-ascii?Q?V148QzTsWNPzcA7bH9ogaVXyPo9OKunYeRNn1qNuNSTPdh10V974kpl8HLA+?=
 =?us-ascii?Q?P/lSq2U78ccHJcjdYpr6LK+dkOQtINXRmHbfuE1uQUI7hJi7BJ6nHANYuCS2?=
 =?us-ascii?Q?o6gA0zEhk5+NouYvhU11QL5mjtm3zx++wbzBkudNFovY5Kqmh8FdWbNP0UbF?=
 =?us-ascii?Q?eFxnLOhkSHOTPZA26jCegeL1eCl8wshBTDC2XNTEWlj5yQeaQwyfwBMM8wSB?=
 =?us-ascii?Q?SlT8ieNC/RhAL4bg1EkJfGN7H6216UXR9zx4wRmffzdJt98XeEftP8IqKDVX?=
 =?us-ascii?Q?QTRx0EUkANMpsmys3LfPUn9rv+gxxRR1zhKOQBrTrf1jhH3lJak5p7CbI/yX?=
 =?us-ascii?Q?P5wlaohGGDig2LUpfnXJf5tqGkPw0FfuI8+FR2frwhdzdodo9G6nMaHlqH1r?=
 =?us-ascii?Q?8/enLtbtV9yZD9u9RBJm8WY712Klf87pOTsgBcHOiT/+3RDNs46sDHQBlXiR?=
 =?us-ascii?Q?0lEaowuX8CXUOKMC3u93het4it+KJhIf6ySoP3sLGj9yq7yaY2Az+hvL/Kzw?=
 =?us-ascii?Q?+UxlOLnzrrmLXlzWYVgLmy0GhmEfAqpsJPGIeDIvQ1bpI6FR3Yhy+CP8xBgr?=
 =?us-ascii?Q?PTLhN+CWoG/Ig/o/YyWfKZQbCWgrWFw1cETMynHXh8aDdcWDGIMiAOtwgm2t?=
 =?us-ascii?Q?f9FEU2ihNyCbo0k+P8OQ/AebyxKegrmApkd7BuWc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c7cd38-760e-4c5d-db34-08de29141818
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:39:01.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ8cjoRT7OgjH8sxRvsG2Pqn9dPhiixh7aRzN+bNYjFSm8IIPPFeoP7088Bslck0zLFBYlmPemjDbfZeypbpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11151

On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Replace the reset map mask with the bit index to make it clear that all
> reset lines are managed by exactly 1 bit.

I don't think there are benefit because I met some periphal need a magic
number to reset.

>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index acfa92b15329..d993c294c548 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -19,24 +19,24 @@
>
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> -	unsigned int mask;
> +	unsigned int bit;
>  	bool active_low;
>  };
>
>  static const struct imx8mp_reset_map reset_map[] = {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
> -		.mask = BIT(0),
> +		.bit = 0,
>  		.active_low = true,
>  	},
>  	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
> -		.mask = BIT(1),
> +		.bit = 1,
>  		.active_low = true,
>  	},
>  	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
>  		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
> -		.mask = BIT(5),
> +		.bit = 5,
>  		.active_low = false,
>  	},
>  };
> @@ -60,7 +60,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>  	unsigned int mask, offset, active_low;
>  	unsigned long reg, flags;
>
> -	mask = reset_map[id].mask;
> +	mask = BIT(reset_map[id].bit);
>  	offset = reset_map[id].offset;
>  	active_low = reset_map[id].active_low;
>
> --
> 2.43.0
>
