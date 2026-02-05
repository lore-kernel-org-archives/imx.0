Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CB421EEF
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304645; cv=fail; b=sS0tiB+hSsqvdX5/LYWSRe4dmUf2kT9usKqGwby1KSe48AImdOCADVEczk8jzlgqth2RceLLJupQgtN/VVDJwluyWKouT0TiKSFVLK7s6QuAWeau+W/lh7Z2titLo11Zz7+hWbDFxtsPtivFOmLmXTaYD5LdAJAj4lHGg12z+Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304645; c=relaxed/simple;
	bh=Fw4arOClqJJeuMN3z75Yy87k46ys6wSmE/zfgfstRS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UsWJRQZVC1qq3T013BHDBxkdxiNzBnurka68+AjxPSJqx0oXtqHVbeDJ+kL12C5bt5BIaqOLIwpjgLDlP7PRu43VRmEuc5p5M2P+vUf1ue/NM4+ZisoPW42xv3RCwvimK2RGwx7KsQ3QUWyDWE3y92q9wGh1RuuDnPxsc405r7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ioCn843G; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ioCn843G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0rtpwAVxgcKmlboVC1/+9TWcacpj7pvyxv6Z8NLxNKsMSosEhdEAcGP2d8xRlxkFQuQHfia+Hq0LQUI9968Vggn64vYpyZi6LYZSHduQcj7Sa9vw9WLVoIYu1tDgE8Z3HjeZOt4Jv+tdmlhV5VsH0r/TB37ySVx4z9X/XQrx0ctwRaE2rAK3Kq/p1iF3JpRiNf9FmAAxqC4Uwf+JSewtzHuEkC0JjD0BRFulBSjG3QlaCUYSC9q9a/XqnHbSvEybERz70l0kzpH1RvNAnSmpdCYEHfCRzhw1MG/GAY1ltZhd9QdUIyQjfNKzwgXYTqhVWjAInMBhL3aXxeF3aBk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w2ILq/n6SXlUWYwGzumNX5TQLSMqMb/d2bQ5/vk/oM=;
 b=BAx8y8W0FSsB7JZuVwf5cexZk9q0Uer/r0LW3wkCWLmYPS+RPLURfCAawi6a1BndIwaQMli8syyYxzIdbyJ4scaQ9/TGvb16ARAPOstU2+b7eXqXHsDuN1ZQqdEahHahhjhA47i3i7ln6UjhOAaRWlO77GMOo7VV43r/VobEG0DsrInrk9HHdgOA9QWweouhMad5k0i0E1ziC0QCAeNUfxh/5MpdLpS+KEHP9ZmwQtRpbPWuP2kZyozSv/xQd0EqxkXUUkIr9hAM1TRTBjDWC0J7YSADJrRg03JOsHYmxjCA6RhXqlsfg/RysBcypKR+OsApNaC+6ZqUse8RhzeaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w2ILq/n6SXlUWYwGzumNX5TQLSMqMb/d2bQ5/vk/oM=;
 b=ioCn843GQNLQ+l23XnBgomzpde2+CtmKruUNHWqKXwbNd57+hR3NB8Le0Fuw/Y3h4LgJpLRY2lw3UHyu53M8Wk3+geA62xOsMO5R9lRu/ZdG+5azjq/ctqFBYR3gNxQRLRhzM2jOMG/8AStYV/vjynwRoyQRTfJMH6fVsuqd2O5p/3FXc4wnk+JT7wQh29JT95uSMHQB/NA7gxNEG13MbwKOmNOSf9WybFYxCDf3Y3CforfHF1gunWXnEezdwEmauvib/aqoMIbBHskGBvMNp6aY57u/ZrtnlxkUQsr7i32Y7znBTKop/Tfxtbik/iWGsFbMBH2kHzq0RB7HUmX0Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:17:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:17:20 +0000
Date: Thu, 5 Feb 2026 10:17:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex()
 in probe
Message-ID: <aYS0drbxSEsr72vp@lizhi-Precision-Tower-5810>
References: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: e205d244-c788-47fe-af5f-08de64c9a78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UoHbbwlN2RbHIK6GhCN/qgW/IgfgEOp/2TSXe6FmucLHv0Dj915V60ytVl0J?=
 =?us-ascii?Q?Y68K0PEAFZOvo6Tae1H3ugVNT1aFm20W4G8BxF5B/TqPGw0bhIb/DMeWQAq+?=
 =?us-ascii?Q?A6mFJUxE6LgylLjGAmGZf5vbZkV6JR0BtKnblaVZDDWvibZHLDqXzzuWA3RS?=
 =?us-ascii?Q?piQWmsUwv20tBsZQ9uiYJtWyKByqZuH6cONH23F+0QUJ0tjYYCvIUmdnTj0L?=
 =?us-ascii?Q?1KhFJxZe/h+25rFktw6TcJBQVjfFjhlwqhRmTlj30Xs+VRD3uAV7RVLGL4e5?=
 =?us-ascii?Q?Q7qeFcTMGIhNV9fQIsv+oZvvzSaRZDlxxFYBDaoOZGywCJjZWTg6OSV5fFEX?=
 =?us-ascii?Q?+eJqcFrxzDbeT7dNKHK9kSNsop/RI542wbOR306Dex/IU8TR2gfjxnv0IVXN?=
 =?us-ascii?Q?6eGcpIybtpJklqvbJAzz1jAWGCKAFmHHCIVdphUSUGEUsi/Vy5oe7WvMALPK?=
 =?us-ascii?Q?Nz9vB7m1RBHyVL/M+sUOq/kHWwQaximnhjdJEheZoPlXGfH6Y/1ex7GKoy1Z?=
 =?us-ascii?Q?RO2h0JPpR74ewp/j7rLKHsAHxpk9LTHBp6Sc+bu4jKQsdwD50kDCBrq9cfDh?=
 =?us-ascii?Q?9qVPeeqmSRoN1ssWmasi2JxjPMccqfYYy8F/Q1K/gq80f2FaEblc4iJX8vBJ?=
 =?us-ascii?Q?XRpcSSmCt8QB67ZWvAp55VXcI9grd3RVEM3RzjkuKkJFs0mkkLkD/ZnwZ1Mx?=
 =?us-ascii?Q?Y1bCUX/hCpimPLyVCi2D4docKllzZ73JuNb7dS1jzRhzxgWI5jTheOFPrVa1?=
 =?us-ascii?Q?knUahv58VRUofijMhdmuOUio7V8mkjlQFk52UKqO/Owaa4t8ZhYJqGV++xuv?=
 =?us-ascii?Q?9+a/HHyHANq1JRoU27hCGQRwhchbC/tYpCQ9FA89O1ky9svieNWQ0NWAtcCz?=
 =?us-ascii?Q?Pf+ZXTUEWUJC5W/6S0zRnmMySakNc+TE/cUMoWjcIDYPXXGqxns2pkmp9xIS?=
 =?us-ascii?Q?5QTYPqXiwzbkkTPwVg5fxAatTOUExSTpvTM0RclQy8c0X1FgaZ5dBGCS2g0S?=
 =?us-ascii?Q?GLvZAGlBz0un1o3V8EpS28sjGxTxlUkANatw+SuEjorV5QWvb2ounNAVn+xU?=
 =?us-ascii?Q?oDOdRqmO5AGzAKxIla91CiMtqhZeV7E8sPxsj7kwsbGp5+/lzL7M87N7cLWp?=
 =?us-ascii?Q?XX5vOl/1o5qhxejvqjbczpbVgxdinQY5s0t+MZsa9Xwly5du94GNUKndlOzY?=
 =?us-ascii?Q?u4aZpPs2aj05kbT/ncGvUCwj189P96Ss+6YmK4N9vqHDwRqTSJIvXGInFILb?=
 =?us-ascii?Q?rg4rmiTsQy212yQNvZZ+qtBH5NrZRb6KOAbGFNI6ymbggbpiMGfq3YjKRp+Z?=
 =?us-ascii?Q?x4gVVzthB+N0h1xLTuLXVevf9ivfq4isUUwiTjJXawXOX+3i1xHM9Wj1GUvF?=
 =?us-ascii?Q?39OSrtGSpWGfP1kRBG8MtyjXrpbDKJkzl3vG9I1MGEEpZg50pVW+3HuiE34j?=
 =?us-ascii?Q?EmCLac0AkLUGb0Usl2vcke5J2O4mw4zp718uDux8p/aHjZFMSKrIpzWIN+/U?=
 =?us-ascii?Q?L23Eep+wXNvm0kEHsqdUhauQ/aXV2Tn/g55IoLU7knbgn8NLJ8xSjMqr5VxT?=
 =?us-ascii?Q?PuFYFOu/T1Kj13Hp2oyk+96oCtRDZDoNAsqFooolQVYtN1N+wpyBe5/lPgzS?=
 =?us-ascii?Q?/7cj3SuCzZHfWF8j8KwBkTE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QqQo5Nb3p8QRZ86BwxPqhRTxaRPdsS8QJVqKor3+I9Ed55gKLiyELVLxlU3C?=
 =?us-ascii?Q?laQiri7KeV4ukSzZU7yM9CMPzVPx5ixr+HTa/rVC87x9HR/aQMIXGm7KsoxE?=
 =?us-ascii?Q?fYMa1Eee4Tactyy/YGiLoXxVx9A0zVD+E58xpJLPvxuypMwTBSoIjdT8MLSe?=
 =?us-ascii?Q?P/bhqO583G51bjEBUHswIvGMwdiLwfFYfDxWvN2TCYBsFcZs5O+OBpbV1e72?=
 =?us-ascii?Q?pW8mixSG0yydJDZbdY59agCENV97hQCG3QRURmbqYb8lblaLssk1PqEY3XuK?=
 =?us-ascii?Q?kTcC0FF3gZxRheNGKpxm5yAsNMzxOx+aBgt4i8iczarFKcIhyLkmclZTeT44?=
 =?us-ascii?Q?iT0NF3ug2Tqf9egx48kcRJ4CnDavQm7v890SDCjVvN/4X8KhEL+DfQlCFdGn?=
 =?us-ascii?Q?P7i7iVHdrubyCfnJFDFChAaN/zCPZvwVZiMBnrcUFNOHTmkjurLF+HIKkNhI?=
 =?us-ascii?Q?ekENN4BIBEH1Ndoena+ZZYmH+0AKGeBozJET6IbeZ2bsZXXNZQ415/Sxs6cO?=
 =?us-ascii?Q?2m2LPMRV0Au7Dr1xCKchd6s/qDs9l+MAb7NvAWYpTWQhvCgoPHpUqyMfLY1G?=
 =?us-ascii?Q?fvVF2xYWtH12dCvBqZWxKl/gJ3AZXFSzSOY56wvW4HHKwKZ/0efzca93e2HZ?=
 =?us-ascii?Q?pfEi90GgQdng3Wvj+kJsFO4ezmqhAXf7oA4l7zE7J2uMfVFxfwq/CFfZqrql?=
 =?us-ascii?Q?hxJO5dKj5WlD1CF6vgj/rLrD5UO2a4QkXq51PAQsuVU8/hCDZRekx7XYcMBV?=
 =?us-ascii?Q?jj9BVeCXh/Mv8XPxTnxeGKtPIpvtOK5sD4IydzTbYTw8L2tFtcTiR6GloFW/?=
 =?us-ascii?Q?Yfd6nMJDgnyuBq8kZ9cLqUOXH7E4+dGuUPe05HQQNe7cxy+3PM2nNphyYJ+1?=
 =?us-ascii?Q?MVxAeykM4BqyQPV1ueU+uLuVBFqsBuzbwRBFJ+UAfCvKbgXR4OJfzBeuV62V?=
 =?us-ascii?Q?DH1Z7Qw3KPtc4PeYcOULyadNL/vpIu1ZvCgt9gzFCH+F8ByYvBzC7lKdkFPR?=
 =?us-ascii?Q?03rLm3wU3hG4yneclHnNAbUMWLQeW8dn5FOxBdw/85R9kfGat5j0yCgqCwcA?=
 =?us-ascii?Q?YCbbIfjoOBHYrAn616qg+cHWvv1lIdAIQsUv5A77beq+dQxsd5ksKPezgJzp?=
 =?us-ascii?Q?qD6/8Kydb4VurSS/phU6lsQf173MRffm4NRJcMr+jYMOFNG3KXxClyRUbro/?=
 =?us-ascii?Q?u6CDPt1S4EzNc7/poeWKv6TKY3mEB89x5WIX7AVAa5SHr14Nw6Ys42JiQVu+?=
 =?us-ascii?Q?J+xqNa1NgCdx7cPeJ2z9MmkSCRF2+/LEubEuL61rWth+t99W/KodmEbCnSkH?=
 =?us-ascii?Q?ThusOa7q0p9GGOuo2SzIfpO3R+RFarBLi7STFFujftMLLxgXKW7pbCkoog0b?=
 =?us-ascii?Q?4dzETbDpTRRy1CzKWeqR/rn0pni/SmHyPTHidl2G5ensydPjf+4N3nUZRVvS?=
 =?us-ascii?Q?9YWhY0QgAJpvYbXlySB14ErDy1tTDnDgLNuCzSwHfBZ6U9SxttxPMjSUdsjK?=
 =?us-ascii?Q?2B4AZo1og+zTkFEbIJpcoRl0Goi6ievBMkdXAuJW1t0T3lhEAUD8oqBxD1Ue?=
 =?us-ascii?Q?ci/N6w7Ub9uAypLBrtwI8SxjZdkeo7YB0x42BXCr6Ma5k3E88CmfpX6FFDoZ?=
 =?us-ascii?Q?Swpd6qkaxzgjVv14mWIypel2zs5Ml+k+8+7WK9oFthQZ/28zLYWFqzZFq1zc?=
 =?us-ascii?Q?qoHvPiDKoXwUqegjdNvsTSGs918j6FxwhMSeR9afCh/S4mQF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e205d244-c788-47fe-af5f-08de64c9a78d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:17:20.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXTL7ktwGBoUoE1rB5/TFunrqD/N6OTn0mduae0OhqaLSa1N6QcoElVLXnEIX9zfJsjs5MGFjyfkMHEtXBSeog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On Thu, Feb 05, 2026 at 05:24:29AM +0000, Ziyi Guo wrote:
> imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
> However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
> indicating callers must hold this lock, as the function iterates over the
> global component list.
>
> All other callers of snd_soc_find_dai() either hold client_mutex via the
> snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.
>
> Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
> protection.
>
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  sound/soc/fsl/imx-rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 53f04d1f3280..76a8e68c1b62 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
>  	data->dai.ignore_pmdown_time = 1;
>
>  	data->dai.cpus->dai_name = pdev->dev.platform_data;
> -	cpu_dai = snd_soc_find_dai(data->dai.cpus);
> +	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
>  	if (!cpu_dai) {
>  		ret = -EPROBE_DEFER;
>  		goto fail;
> --
> 2.34.1
>
