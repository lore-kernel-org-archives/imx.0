Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A429421CA0D
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769706587; cv=fail; b=qB+excSPgA5HM/gs0zRBjfbvGt2WBMdsSQPd1qKDefJeXwpk4tymEisqWLiQfvOCjBw1s9JqA7WEjaKru6pwdyVYUA/rWqETV4blW5cxFmBtCcrinyggYFFfNLdPW7yQ3oasOF8C32fsvmfV2zJp+o6H7XWuQQLPw07Pr0nX8cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769706587; c=relaxed/simple;
	bh=htUlVz5iMlH/rF9BZFZCjIyJi3n2nWjVUTjENpyZ/+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DTAxZS8+dDb056PCs3bcZC3mAmO68Vmb+7wiDKaDC5SRDxlMIAQr33XjGvw6vHsKbtUMvOgFJDQXdkcZGiqO0WyAEwjXg18pUZr6M7NCA7Prciv4mrE01vtELf5UyDa+ubPf/X2cXtsOwKPIpRsGaUhpe/oko6Zjnj/isEfP/KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WR050G9z; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WR050G9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2vKqB+5QlR0if2cxB9kTgxGs35XmKKxbdY3ExVEJNkeoRZmrRs1J8qAWjx0QBiJO++uWCJJq7VTJEsgRiqlgJaMKY7Tw4sojLvEiO5xvCoEWen2RujaDEJq+e6k96K7Fj/9foeXamLJ+vb/91zxfy2+qN+GcrEPGogQ2UPhpeZ8h5kXkzY/idDoA2eaaCePAdQrE9YMZWPYjy4DaGcuSBgF/ax6R093AUQmTtei8XO2ooTQWx4xHKQjtSGH9Sh128lPH4BavWpAZz+pteLAU2s6aFfWY7aJaCty+ZhxaO6sm+rakpNhlSYCOAsuoSY/1gL6l850RZC/tvhTJL2IwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JvMIdPRcDojvFkxL5ETLXwHnt/nwzxruRvXsCzbMcY=;
 b=Vp1gkL6FG9KM5vxPcKJXZp8nB/Yc+Ju7GpHmxWUAD/SqVc/mwrCjoeL8G+Q6YNxPQTFzZeo+uhkorbS99DKLKoo4ufJEOP6UjV0yMIQVbUGny0cIA7VyrBqe8/PR65z6QeZ/Mv1TIoyK8ILS0TxSv00rCbv5X5qhN3g78ExZS6THlV/Z301pYEHzsKky0hv31bamYzXZrla6rDPNOYtugdhuGobIwEioxUXsRTJMH4A3qVdoSui69nLSz0HI2ClQLgBcluL5IxktLxnBAHBWoHfU1M4xlTT8vNWIlGkvaxvSGt9EJBJso3+LN6YCHuGrGKG4P63E1bk2m0nMJoHp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JvMIdPRcDojvFkxL5ETLXwHnt/nwzxruRvXsCzbMcY=;
 b=WR050G9zsD0mBfZ+j8qo/VCnC+pqJSWunwDTzn2xAXpTYYRahXWAJ9ZcIrilDoKZqE3Qi9AG5sgFisQlwCcZJqBG+dXrxqEj7aqYYvSzu+HG/6+VRDx0khCHEqYvSwPjxwS0ss1pzqiGCHMCMb85DlfsdLw6BGPeGw6cqsynczWXGg4qo+kPv1yeuOp3m80lb+otHgUav6u3CQeqARsl740URGTMiGnhmAo9G0DGSzvED8GwAtUGEXhPnqJVhRzbihEZx24j+q5H7mhVf+8gQzgrVbUrkhfEJOrh/8nFdRzG/Pptu5MarBEWxgd2DCcPeJNu1gmy6cXhJg6ejVJ4Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:09:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:09:42 +0000
Date: Thu, 29 Jan 2026 12:09:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
Message-ID: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 9941babe-8e75-4896-e5fd-08de5f59318b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vaAdbh+KY2QYvqpOjTN4Bamg7dB1otZAQf87KR5kicTh2K9W0hbFGmcibUnf?=
 =?us-ascii?Q?zK4IQ224MMnAjjxLI6/rMBNAW3GUwzQ6Co27fOnPbDQBUOtQayZIcw1TUdxZ?=
 =?us-ascii?Q?XjwLXLXv/3l2cIZ922BgpjBZKo7dB7+NlpqKurTrEXWIIxgYY72ksEEb9+u7?=
 =?us-ascii?Q?cSIslpEZRYFOc31N+nOK1oGvdKg048wBG4o/5bVSRPXKiFdixEzomupRRzen?=
 =?us-ascii?Q?08JwUKsRUDKQjaoWsIi0r5S7rQGOZSxl1QKtk1P74FSVpbQvesCAENg8S3D5?=
 =?us-ascii?Q?TO7GnVvZnzFW9VYgmUr8zz9YWktYZQyOTf8L0nTDz3CwX1VI5Lxme6ylTtXl?=
 =?us-ascii?Q?97i1qByX4Yv7I1p3j7mr+k+yOAlpk2FXafW6wCDEQeM6t/erdi3GlnRFMsP9?=
 =?us-ascii?Q?R50C4w3mCy2EU+H/jRwqPwFf9LjePtydXYyVe8C2Qp7vN1iZy/kktDQB2PcJ?=
 =?us-ascii?Q?saTsPnsRUvzolWrEJVhY5Gvo0If8ZYAMB91O8i5KLTKLT+bQVlcHFqe6RTM9?=
 =?us-ascii?Q?k7Ons4CoC7bpCwgy750F/elCxZnRUYLz9Jq5zEQS/yMpF0njRA/bIqrMrxlg?=
 =?us-ascii?Q?DHSYQyMn6kZN0v7CasWvrWXdW+Gw7Vst7VlYgycGLzN1KvdKqjjFTGbNQuVf?=
 =?us-ascii?Q?YApv8ZNDWwpbpk81Rjsev209JODJpTTJaaO8dngu+pIN5KBCZHpK8EEkqVCZ?=
 =?us-ascii?Q?G7qncKNKRrq/lVSdtLnfFdie41LuYztfglBWKgSe4driXri8V+wlM7keiBS7?=
 =?us-ascii?Q?OgB9L1fHH8YlRVVA4Vp3T2Y3X4+3VXuJUAqolVyjktdqo0AddslhjDa4GKfi?=
 =?us-ascii?Q?R7EwYVWLk53GZWgtnadEdc0uG/d45f+2qNhiJ4XxgWCntXdwl1JtYokCELWn?=
 =?us-ascii?Q?JlTJMn46XBI9wYQVzAF2jDd23aTNGGrsKUcTrdz9JczAUwwdG9TTc4Ijikbn?=
 =?us-ascii?Q?53MBABWEMcmOTmMuUtSisNgj1yR3w0RQ9Th8bQOzd63E1GjFJxe7W94lNMFt?=
 =?us-ascii?Q?NFk14hAbA0DLE16bPsAi3P9U1Q6Ytu3hvZe4DYIElV6hrtE3nT3vvlmxZnQT?=
 =?us-ascii?Q?RhmWNtvaSNXKmhq+KtBolJABu04BwO/y+8mhTO4WeVdC5T9Sp9FHQbEuxWW+?=
 =?us-ascii?Q?DCf/1uuxv/S4DHpT9yp0+mqESj4XwqLSt2Ln+t99zeS9Itp4DhYFbW3XFxt8?=
 =?us-ascii?Q?gWXvQ4FFlWlq94hywx8OH2N/RKpGcYSmGKqiv6xQ5E4+kDjG83rRIhNpBuyb?=
 =?us-ascii?Q?kZYtgewoRS6S/s/ZASPATK2k3vwTaYlph1JwFJO2o1LaZIeSlbfkyB6Ibg26?=
 =?us-ascii?Q?kfKxPkl7p9bdoPUTPf1fFqPpXA/kV55i3YonUDYB3CCOZCNcc+tY2OvRk2nR?=
 =?us-ascii?Q?0slAtYDkqoDhlINMgmYVfQkcr3EodcgiV+0Dug1/xhNIdkh4m2ckyu6N/7QM?=
 =?us-ascii?Q?cDvX23W6+HsTuMjM8uyYXX7bu6rWxsoWC4bhcSMQOv5nCFx7TwtbPyR0XGsA?=
 =?us-ascii?Q?jWMjNFEw/VOML2enJFed5kKlM94h5WrVaLwpafpp0LIpfVDa1xIi/IsNhfON?=
 =?us-ascii?Q?VlMF4tb56TtuOUnQTnLUECWHpPUA7D8kGidAwmWNNO1MpbfzwX4FdmiPwXRP?=
 =?us-ascii?Q?P3vrF5VTmNRP6LzG0yASdNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2PvkbZHE+tJZiljFqGX9HumvfaK9RavVbZDOleVtKVqhGYlLjY32/MxZSWqH?=
 =?us-ascii?Q?CQGfiWypz84xntNuEAwWfqIelrXybnBoYMFcF1TYn0bxyq+0V5zA9nEGvROJ?=
 =?us-ascii?Q?N/AdmhhSnUMj9ZNPWM74ejnQlxR3EqJtMkSxnIPS7VNSil1Qnt+cobF0qaez?=
 =?us-ascii?Q?kCKc2I5m+acLis9FZf/kTGTCBZhao+w9k6f6i6stF9I3S0OLEgvBO7bvhK4f?=
 =?us-ascii?Q?bzm3AOH701zFl/U4DefPws+9bR880uQElPFxx6saN6Aq5HnwSwztk8UlEJp1?=
 =?us-ascii?Q?SqpUgZvH3FoNK+oECbTnaJvLECDOVXE6uxfL6iZlWtclvad0u/qMIWIrpInc?=
 =?us-ascii?Q?Zx80Bzt6lRhPjU6T9J3aCKjFjZKTXPnpszzbsO14RAPnKvP8JT3il5SlZL+N?=
 =?us-ascii?Q?CDRZfKrEkQaYKXFnbACHUsJW6hCuyoXp180jC85WOcWuuM+IfkVdRU5UaFwL?=
 =?us-ascii?Q?bUz6fpEZRCNHJw/RXQsJXjOIG/9QlHWFg70BVP54Zmm2L4pTe7kC60DLBFFc?=
 =?us-ascii?Q?dowxzsvKSgF3CFIWeUXJVlGXuK+5OGQQ3GFVfet5WwOmtbNZJVpHl4nneSmd?=
 =?us-ascii?Q?NBBMX480gmQ0hdTbeW6oNajKG5JvHC6PS/pNHvGkF4o9slG+WA0TnktVeVvJ?=
 =?us-ascii?Q?cCLypsCbQHGBFPOf79vmICcYKpX7icU6TiSx8WxfskhmqWYaVv/uIV0lqArX?=
 =?us-ascii?Q?BclbkMqnkmuMU8k/mThgpsM0ZnfnvGiWeer8g5spOxgKxjuCBW9Kg4QblY49?=
 =?us-ascii?Q?iqT6kJh9gNr1PKmMh7bDN1jrRPJPKTpezIGSz7KiI3ePTaUUL28imFPQNyny?=
 =?us-ascii?Q?0EBCyxTGRo150Q+4TdGl6ABTNr5X+4cCM7skhct6t/Yy+BxnX5OPw8cztbJL?=
 =?us-ascii?Q?QYP0UnsnT0I1+krsDi0OCFe8MXIRqVz0DLn2KdR8YPb6cCOFsh9o3knjJV9x?=
 =?us-ascii?Q?PiubMhBev2uUpWtJdttoxUv9dLhccf7z3W/TGFzHzhB0H1bzcMwqXGbb9JsE?=
 =?us-ascii?Q?45xKeLwXlWymRuxexmuDMqglDiK+Yxey2LpJg5+wLwCr0/rGVoxYVzCsWN7j?=
 =?us-ascii?Q?mxJy+H+lAsdSBoqn/voviUS/QCdNQfu7EgxdmviXcaMIDweOGRn6IyqhAn8e?=
 =?us-ascii?Q?4TijQSn359VEEnwLj3PTnMBO3QtP6hNTJ7igCsDuFh6ZXXt8Lf3Tk4SBXcnx?=
 =?us-ascii?Q?emmyui8vUwTJSQq0YX35c0VDFPXfkgRxM97nKtrUalKqSHwP4/NJNOGE1OQF?=
 =?us-ascii?Q?NlB4GEoA2qh073/0vj4F0ygjTNjwgaixjLu8lwl+K5OEdhfWnUWuIXIRF/+2?=
 =?us-ascii?Q?S2o85f5rxH5YT+dpfkvuoTkN12CVe9y3a8MzG16RFwcCyzcGN5YT7UNcFTJt?=
 =?us-ascii?Q?jXcm4Rd/gEhriC7rVjNW/HTt8D2Lr4X33wJu3VtS60mHFGpMLsJ29jHTjRXV?=
 =?us-ascii?Q?eemM1k1OycEqbPAYDapyW8cyLDd6bOQPddrUhYAfwSprtZeEQfQjPSTGMUV+?=
 =?us-ascii?Q?OmYjcVRriP62zkJ7jxysjtlnRDj+bX9dKArs0jHoe6TJ+HtHt+e9xZFeu8Wr?=
 =?us-ascii?Q?HwUgNfe1s69tm936sbdDLQdJZ+KsSZRqYtL/rUlontovh62Hsxl6rhkHzmqI?=
 =?us-ascii?Q?T/1mDnXwP3pDuI9y/98FoHRcAjOhucfP3k5nAeD8KcDL8/gD6gNfDFQbatvR?=
 =?us-ascii?Q?lFAxasqm4Shz36WHX5QS4/A2meDUJ6eZRjHQ/3p+3zADeT+HoDZM6dDYMHDN?=
 =?us-ascii?Q?uznJckVCgA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9941babe-8e75-4896-e5fd-08de5f59318b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:09:42.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQZQ9nwvLSFoDhnDaDouB/GKI7fCeQNJXCCWnawxuyTeXTxQ7ea7Jru5dZiYlKZBFPoiSH5XYxTLfJtTuP7F9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003

On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> As the dma device may support dma-coherent property on the i.MX952,
> allocate memory from dma device to make asrc driver to be compatible with
> such a case.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 7dacc06b2f02..b8fe242d53db 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
>  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
>  				struct snd_soc_pcm_runtime *rtd)
>  {
> -	struct snd_card *card = rtd->card->snd_card;
> +	struct device *dev = component->dev;
> +	struct fsl_asrc *asrc = dev_get_drvdata(dev);
> +	struct fsl_asrc_pair *pair;
>  	struct snd_pcm *pcm = rtd->pcm;
> +	struct dma_chan *chan;
>  	int ret;
>
> -	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
> -	if (ret) {
> -		dev_err(card->dev, "failed to set DMA mask\n");
> -		return ret;
> +	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);

prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
overflow check.

> +	if (!pair)
> +		return -ENOMEM;
> +
> +	pair->asrc = asrc;
> +	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
> +
> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporarily.
> +	 */
> +	ret = asrc->request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		goto req_pair_err;
>  	}
>
> -	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -					    card->dev, FSL_ASRC_DMABUF_SIZE);
> +	/* Request a dummy dma channel, which will be released later. */
> +	chan = asrc->get_dma_channel(pair, IN);

Is it possible get real dma chan from fsl_asrc?

> +	if (!chan) {
> +		dev_err(dev, "failed to get dma channel\n");
> +		ret = -EINVAL;
> +		goto dma_chan_err;
> +	}
> +
> +	ret = snd_pcm_set_fixed_buffer_all(pcm,
> +					   SNDRV_DMA_TYPE_DEV,
> +					   chan->device->dev,
> +					   FSL_ASRC_DMABUF_SIZE);

Here you assume chan->device->dev never change when it did DMA transfer.

Frank
> +
> +	dma_release_channel(chan);
> +
> +dma_chan_err:
> +	asrc->release_pair(pair);
> +
> +req_pair_err:
> +	kfree(pair);
> +
> +	return ret;
>  }
>
>  struct snd_soc_component_driver fsl_asrc_component = {
> --
> 2.34.1
>
