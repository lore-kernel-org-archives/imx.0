Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB766337BA6
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 05:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430335; cv=fail; b=DD6YfIKAdQSxKXLIOyXvwqqJpSTvllnRaz8moLD/uZ8J9Sj9HBD/RaSYBuvpThuiDFylDfBLVEEt1I8RCD+BGJopk9ttDuN1uFv9d0AhfqjZLFuPVEx4mtZpSlIdZNwPTHETaN865wUm51f++iYfgPfoZiu0+DlFxmyJN6duby0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430335; c=relaxed/simple;
	bh=Eq+OPse0MNvTXln7V/4a8i7vCx9WX6jsJFRZbEnKrH0=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kgRSSdFArZb27d1KgpAOEYrh3a7qoNxPyGQmdNpFQeqeZH5uXRXc16ywC+dRKir4JptfIaiqEVodbVpgLnH3bnTpmMS4ErFlNEplU/SpR+x6Fu8hDi+gFDsqkMAgLmvC0cI0x00zF9DczEN4yph/tb7O92Oh6XsIAtWPm9R1tDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z+GFTPYC; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z+GFTPYC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciu0onPjRMbHCAAhOh6J2mh/b9sEYVCuo2CiKY7xoxTcCHDE0hhwSVLeum85wzDvY1ezNi/Jto3uWFxsP4p6MfLL+0dx5uQgSBihZ8olRwIMvFS0shcp03uQVdSbVMs7eoQ8JgrAioB17jyd/tXHJ7mxKGyO/pgdu3G7pD66VPXtrPCAqUUKZ7YmZE4NVxKs1PD1nBt3CuVFGaT32iZRFSOQBk2OcaGJEBxZVpBTuis+yjXj7ApIE3P3S6csW+iwseBJ3nACL+AmuuqljADygyNgfi3qpQyU1Q+FCJT9lEpau6xjbQfFG17ujoJPIRLfDIue3RNH/ip0XiYubRxPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo6JPmiN/eLD0R3qH4dB+kDah1uJ5TYDegwWqKrRPfE=;
 b=S7EKE/qr4+aQUpFGtrX76l1f7Lj0qFW+8rWkQIqrrZ0epgJ8xkDTXbpbg1GKSixBTZdIlmUGo3g9RijkV0g12VRYDjmKQ5fEgyiT9cc3D+K7U/Bz87h8K7Y0eutO3/v8RNdMqsuFPKZzU9d67LViEYpVg2TZ+zpSo2GEyTXqRqC1zSMsr+pZsni/W+rZ4TzI2egj4BkQ3Y/J8kODCBJw+bv1Y1Dod//R/MttCJmqgdl9wi3SE44lkyg1+1BQ8189Q78ZXl3+p2i8THY0trBa5ga6Bq83/SNGl6UcF9uDFTr2zlgt74tdlp0FxP1V8e6oGHz46CQOTdjXKNCsRqANtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo6JPmiN/eLD0R3qH4dB+kDah1uJ5TYDegwWqKrRPfE=;
 b=Z+GFTPYCvb/nYbAx/4R9X+mh8w3D7OiQ6pWHXIi0wLiPLNDGoPuQ3LIm7df5XQf4YevERdTY2d9rrl2z9KJeui9D2o8zMbudIR8qRV3oOH5t/NGcLSRXW5aG5aP/g1u0afDHhOtcYErOTs4cI/ZJZ1Sr+FtnfCh9afw0RW3M2VqvN6PoArEbqtKKBzT1++hH0qrbP4n1aJyNTgpxPCcDbwjkasznhZRVyx/1aD12cY+Nfqzmc2o4XjmjWII6KFPDyruABT3PNU4DEcOokq5F2pPIg22CyidAvMbvalvgPkxi15rJql0QlypYhDVf3GEvZ0lQetUhaA4JMIO9Ac7RZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 05:45:29 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 05:45:29 +0000
Date: Mon, 2 Mar 2026 13:37:48 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	a.fatoum@pengutronix.de, franz.schnyder@toradex.com, stefano.radaelli21@gmail.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: set usb phy to be wakeup capable
Message-ID: <qtxqj6uqwba7rwbine3i4baaumiaz5mhtc6blzwwt3fy6q7sai@f6svguvbgfvk>
References: <20260202080228.779040-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202080228.779040-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: efef409d-83f6-4e4d-42fb-08de781ee911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6IGY5Fp3kfivK2d2G7L51g3w/oD9wwdnfXAKwqduTkvGeOCGcn6tYVgNIN8MV1t28Abe40t0IhD2tNOTS30K9TL3pbpCpS90OaIupW1lbckH3A3rTZZpJvFWHz7249eEaG4JeTGglDD2U4QdbsErrGnhgcXAkPIH6FsFFYqVJq90N2uvGZ9rpyoXZihqOBJAUQ6G3WQ0hCdxxtl8x+2vW8E9rZHxPEcJsuDnYcw7u5aKmoUBixgSohaL6wyl4a1YkhlD43zP04bPKlN2WxWgPhimDTMR4IfPshtPB3J/BIdywx0Jk8DXmYO+Bw/cS4XgT7wKyB2gr47EWd0bu8nIe9AtYhT2AFQbQshnwAxxo5t5VqCyvpTFftdug/kRLoFepPmbKSLyD/I9rGajejx7dyoRa6WX91k41GIR57v/z89xuwBOJHczr64jV2NENDjkvpI6IAUJy4HRu3VyOKL62eloqXDold3SUM3uYD+WTX2xkBvPrWhODIpVAF9XaIyI7Kh27M2s15zTKF3HvoeDJRwnK1g2d3Y9OJbpVWWBxtklrtXtN7YXHCJkeJjDg+7bBPKs9yKDK5Fv6+2mneA7M9NwmRuybn69K9+kAXl0WcQf12PHdglKeA0y20uO7I/AdhoK+HRvxOJ5EyH1dXMXeaFCKqQrK11vcvFYJ2effDDXqCGHWthl0Y/2geG/LY1+4mCtWRJI77t2wgnU3ZCRof3Xh+1I2gou925xIayp3CmcF9alicv9FMohTdCLxWU7y2TKbgW7sxV9tCAmi/uOVlVzR3rwipNuVRhwY2eg/bKOQfyE7s1ZBihmoj6sIaKZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JGZbxkYbDRkMssRYRsmfzvtubDr5wvWnflPOzYLMq1t+ZOOFDmozYKchcwtY?=
 =?us-ascii?Q?R+nL+QE6MJ4y4H9AG2gjcF4m2IlUEIs3B81YZV/fuT1yHfuOGpxwXF1X1tZ5?=
 =?us-ascii?Q?LWL+67kLtqx+jtxW/fB6BTYmAw+74QwZQ+S851834b4QqmLDFO8K0bEdI4li?=
 =?us-ascii?Q?g0Pti8UD46Q809BGoeLn4F+stz0pNQMXUhhrznjwz5I3Jt9IL+XRPs2cBm16?=
 =?us-ascii?Q?kEkj2CUN9PNgkYVfvsbHtaCZcyXOJqasKQ4vLBS8hyIMEKvBCww/HGUsxIvM?=
 =?us-ascii?Q?xgrB1++y0MWfE9nhJJfK2lswzBXmuiXnhb9TNgoIFK4C4QLwgRajS3Dkwxab?=
 =?us-ascii?Q?dzplnpFlOp60RRev8N0gjREtt8tl1Zq/DGWGKojMod7X6gv6UTOp1Xp9KKDx?=
 =?us-ascii?Q?KrD26VnPZdaSzClltQiDWFzdLBQrl9d7RFkYCJ25whhqfmx08kT2Rj6qHQCc?=
 =?us-ascii?Q?dIzwu6fD7Y/mDBq4R18S6QO91lKyJOS/hU4VpQpX3SaSXr0sfRepTzV0MjVP?=
 =?us-ascii?Q?G3uKQIFCyr7kDCGamMA7hkLIGcNeS1Bv9b/PvSl90rk2xJJOOK1noDX+uwRZ?=
 =?us-ascii?Q?Gko+suIWrhknIKEmi4xEfz1enVFDaXYQIqSWmvp4Y1XygrkRB/mEP0qL13WD?=
 =?us-ascii?Q?9fKY7q/Zi2VqScVuGeLklDgh67luUerzQ0YedorBOevK4iWuWOnhKR7I/PG9?=
 =?us-ascii?Q?deifUyrtOn4UO28wDrsGVFomDaJvgiQzuwDgmvlqZh5ft7fV4fImgll+W76l?=
 =?us-ascii?Q?AdTeRByYSBvpmZ14oL8z6PFh4sRJumbSfjEUjzxcwVSFpCaPhCuQs8WstDR2?=
 =?us-ascii?Q?o7WZ5+WaFuEbglMMHsMOKMU/1YRgHwnTNTFGtI7Ks7dJFw/stVpCg/QiHvff?=
 =?us-ascii?Q?3KqG8jJ1F2AYi7rl3wPoTLfirQCxueeVNjn7EDCbsue5obAVvqZxCNRWYtsl?=
 =?us-ascii?Q?c9xAUzvJ2HGLdGjJ52igHpiqyDHAuUa37E2vi4ACPHkqxkWU2AIEpVe/X9cu?=
 =?us-ascii?Q?71uF7KdAlKoW/7QnXDkCtTQJf/oeKyMn/Myk0F481wdHDR8UKM8lV9iXSExW?=
 =?us-ascii?Q?5zyMzXa/+VL3UrsKy0yWsa5dvGMnNm+qS2fS7dfV+5OOvN9QvRJS4BEmNKMl?=
 =?us-ascii?Q?X0cJVF9oxPdUZXF3tudbLjlD50nlXjKFc8U2yZiQnfOdDaO1g1G1F21d7O2g?=
 =?us-ascii?Q?DoKkq5ZaVUIn403bsJfaKjDAIFYoaLlIyyP69yWq4D3XUHbmEnQxv6hTEw8D?=
 =?us-ascii?Q?A7k4+apVOenBGQydxqGV2bbFJwRCEr+LciXlUQi0Mtps6kLefALozleiQ6EG?=
 =?us-ascii?Q?pNFs6U9gJ7eJEh5pgOXsUKZZH0SJCH4Vl7B8bEnfVG5uGNbK2S+5iOq9+LGU?=
 =?us-ascii?Q?QTRkEUPC3biHRKkxomWAg9OxNQmeHZvyumIiRyc4bC1QVtlEeUW50sbS6zcx?=
 =?us-ascii?Q?QspTxPkYu4z4MtJkwybb7hZmmo4909Rbklpmi9N84PZHRAKqANyX1sUPgCcK?=
 =?us-ascii?Q?c1M20U/pCaDOUSX2SbrXUFbh8nsvJnPLAUH0+mixrUFdpjgqDLLzU/J1jAwh?=
 =?us-ascii?Q?asKZNxEyqwikg5A1VzBt30RGeHUQvP/DMJ+G8OwRrw2Y5Qu6KNP0tukVQSSh?=
 =?us-ascii?Q?emOw6IpC1u1kXbxL3pb/ji/Yc5G+fuZE7NJsvFMuLVAFMAUzxdb+VRJm782e?=
 =?us-ascii?Q?qw+HEfDWBSL4ikON3p6A90g1W3UprLt2PqpUwy2tm0ulQiV18hfzkjcAx7Tw?=
 =?us-ascii?Q?y8GTqOiOrw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efef409d-83f6-4e4d-42fb-08de781ee911
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 05:45:29.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQHAmpgjHnBN569Ipr1fkOIz6OxgU+7Od3RElWFvihs5vEZ9WXq4Nh7LdPtgHjOekWcUFuDPBlEMvYBW4/8ZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

On Mon, Feb 02, 2026 at 04:02:28PM +0800, Xu Yang wrote:
> USB remote wakeup need its PHY power domain to be active,
> so set PHY to be wakeup capable.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 958d114b0c83..50b67f1e6a90 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -750,6 +750,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  					"failed to get tca\n");
>  
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	device_set_wakeup_capable(dev, true);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>  

Ping.

