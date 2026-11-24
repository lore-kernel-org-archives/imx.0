Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537010;
	b=jqGidJG9PuV/eNf54RV9xJoo1qL04BmERnawSefDV26jqKWGiQwDJW7qnkalop0SnSP8
	 m1JKx7Dztd60b6wT8AuxsoTrPkz66eDF33prukZ7ftqg2pl7RBuT8NMw/LXSFneIp4HIM
	 cAc2d8NFsHTjthn0Z7QrXJbk69C0IOHTf2m3l30RvwbEfQmCnDa0Xn34OTphPauLiJd6P
	 sznY+2qeO9Tqg6lB2qQSjaVDaimSVE/eRFIIzr/VhTpcUzOZoxL2+Ykyqfm1pq0sIGPxG
	 B+jaZG6+ntuZ+ILk3c6ZthT1URrCxO2GiUZp8Jt0sYg2P57R2tlUblAf9rHmYtx/gOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537010;
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
	bh=NA12plOgNF0dRdortBeeBQ3+AQqK0NAkzAT49GXK1LY=;
	b=kjo4joZ/3Y8gcXHeQuLaYaiPzt2pB9dEo7tA2fFgU8Ek2P/dcYI7AoT8hF0HhGYZlx0N
	 4GyAMS5zD3FXnf9XpgKJ4tmxf5uqVIea+uKGNWOdhJa1+E7R/nQW3l9k/ITUsUpLi0kQT
	 XeZwVFGPb1lTtadHS0cpfWw4v5jH6fOXPn5rbsvOaUBhRML8HJeo4m15kcZX6ng5qkXUC
	 H+PeZzbfF3Aqs4FCG8VSQ0fCDP7APudAKMrJxk55vefL+MoroWwv3yVZMY62BVMDdOdJ8
	 YVpEqmxwErlex1aagUv6346WVyoVLRjutl1JSq1eVczwbcg+FTvi4GEYQJCerBvQX6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LN33lgUI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.71
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7B606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 16:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LN33lgUI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P52y2DhqzDs2jKMrUv+7scsp5kx7WOsjJjAFyzMOp4SgboH9n5eGZ57Jkc62gfkXaikPWbCsZWBvq1rEjTIjaoSixkQ6S0RfvjgQLLygcg7+LKI6QiDqP2MrGEJCFdr9zwNPqH4lZ7gvn3dNfdBLBeXlmFLm9xttVGzYpR8Fcbk4FA0umPwxA779kRtyAvFIpc6mYRU6eLGtZ80QN9jk1kbRSXFbLLPc4hayzQjk4RORAWNQNeDpg5p7KXPeNjvx0IxHdAlpYofvetPuu4S5iDP9K6swRf5flcazGjEZ+5FM6/jjq22PfYL+FtUX/NOE5b5108c+KgYohjes6Vqorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA12plOgNF0dRdortBeeBQ3+AQqK0NAkzAT49GXK1LY=;
 b=mC3fk6+94rWpDRxzG++vIT9mQ3nYXNIlCxT6yIEsFxmjZLoEZHrI6YLWbjxJKFiODhUWqdBCwvPVsojR34wfmUVCK5nuclrrfZ/6rU1cdZDleC13TYlKb2wFOzfmbUow5PCwyCeRSC7Qz1WHYzNivoLPkX+j9rdqFj2go7VbkQkKjFNn+C0gpsq0rtAsYEZlLA3Uhk0yek6OHXyZQmFX7nKDKPBQpLTPx5MaL6OfavmbE+3l1ows31uKzcD0SyKSwDpHiNWwRMsvjUgFFjE7x7jvkeB3cIRbT3Q/Ycz3QTR/m9MdaDwvjRQoId/WZ4eIjQCSs3FepMSwBOc0PcKIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA12plOgNF0dRdortBeeBQ3+AQqK0NAkzAT49GXK1LY=;
 b=LN33lgUIcIw4oYtyi6eB/L3E6zETifgPkF/oJlleQvUmoutejQifQO6BDmCD8kpdkjslfC7XEwOUx9eZjP+8ekpbtwSpuXTBMeo7XUZyfIBEMtjex4a4A1yhQ3QWQdLHt/MvD1ZIsfuXx8KmaREZugaRqfxbvCCfSavvp8ry++h0fGz/gHakMpI+uo8exJUp01e43oE4f2hx6KzHbHtd44nHn5mSzsoPMVxTxtZd6v2hSHuki5cIRbPmrCuQ0w0RcD0fK536m8eq+i+KobSjL34wf/cHdi3X4wFEFqXTcfTToPC4032US6ov0t4oKPfIZAmQP/eV6DA+ITZPFP6kDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by VI0PR04MB262470.eurprd04.prod.outlook.com
 (2603:10a6:800:35f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:16:46 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:16:46 +0000
Date: Tue, 24 Nov 2026 10:16:37 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/bridge: imx93-mipi-dsi: Fix mode validation
Message-ID: <awW4ZcGL8EXb6FoZ@SMW015318>
References: <20261124115255.679017-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124115255.679017-1-stefan.ghetu@nxp.com>
X-ClientProxiedBy: CPAP307CA0005.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::13) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|VI0PR04MB262470:EE_
X-MS-Office365-Filtering-Correlation-Id: 0097142d-cd30-4a62-3b8b-08df4a4655ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|261009223027099003|10067099003|11063799006|56012099006|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	usBjCtOYXe2S3dykaVz2uaW4LR119G5ojRQD8hc1AaEAQBOwtLbDKjWhAr6VuzSdAgML2+4kxZmmW2p1/VfZ3FZ7GqPDmO0PArizxp+He8vOAa6gm5AHXTDA9uStYBAhJdFjrzvv20UTQjlaJ7LEwRjWASvkt29NJM6Kv0YstU8ONpTBTIQV4Xap6M3HuGq0X6CwjTiRncmfguO0BEf2VELPKBmKpSjLucrx5NA9svfiilWprkGD8VVTD6dCTy6h+3qZB0eednRhGXMTMaEzRy/NTF5Vp4ohbmGd+C0Pm3NDQRq2hJdi+ggDfCML+pgXhwbfbNXOjaiT4ObNUzCj4QMVHjxW3nozemYjACFRFaLw6V//jNFK/q/l3V8VqChMHZuk7SQ1ica//UYvkPJgvw45HoVxkqRfqZdPg87u+qGIBLUgBEnh28+R+cUD4xjj5hPaHtY/uo6caPbajTRLz05TN0/ow4wbSx/zXWFG68BwFbBfK1FIKEy/VEoYvR4v0Jv3jjYm4yVtjE18gkQbhuGRZK6Pzw7UngtuIGjPeQwckO91jUksmt1SPXqDnCOeFTjuIZx1+nS5O5nZBHH6lLXZWatACZYIZd722LRHVPeZeCUARoIHXYpC50BTsudVxU404AFs8kGzZiCE8l/WumJ8DZsn9I6HtetU7Iw+6Lo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(261009223027099003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/hxafxAM1wowNDMFaUTnhGJPY7J8I7tVPmLtgwAdGEzDV+LamIXq/DsXJwhV?=
 =?us-ascii?Q?Iagnn5uWLmyN/7R+EclWr/PVvKNIy1apSUpijsEI7LWoqvto1rqeUAedQ9KI?=
 =?us-ascii?Q?awxwjPDQrvlRpf2kuL+CrxgebgPXtmPBE7gR8xSj1R9W2Cl7/jAZ9MbK8d+O?=
 =?us-ascii?Q?F2TCunwJ18mzDSG8krfQ9f3TeJSHKkKCv/KV1hKE8WiZ8GPwCz4LlR6Aevg4?=
 =?us-ascii?Q?VSM29wNNxLnmVDMiRXyg/bd9kq9GgFQvy9HyG1/3nnAkfnukjLEG0AxvODqU?=
 =?us-ascii?Q?kjXycTERUxLWBgpfu/9KsrmgKLVK/idRwcr5Bsr+vBLkRqym8oEJSoMRwCaU?=
 =?us-ascii?Q?33ohfJFHlznXCQab/37q+rGlFBbtF/S9rD9Pl29orZIou00Olk5wqZpxll8S?=
 =?us-ascii?Q?D7CdUiOAec2jlSqFn+zb0/60LURw9x6fGQlcdKD+ESK1uOp0cLE84U8MZEY0?=
 =?us-ascii?Q?PK9AgFqmWRQsZ1AUem9Wx8zU614aHH/02DOVPsew1vaeoDfIIzWeKStY9w4U?=
 =?us-ascii?Q?U7PyVzKaXJ4aRk5WpgysqL9/XfzDa5yC4JBvAceSQ+3/G6rrowyIEGShn4gb?=
 =?us-ascii?Q?+4GRRqtTR7SAp6RqmgnFNprQ8oHzVA/jt5waR97fe4WmCeu0tvy/uUrkfo5V?=
 =?us-ascii?Q?NfRa9cV7p6KgGUKwpliQwkDcziXNSSCBKuEtzbScZxdq8g55I7at5mJ/YNgY?=
 =?us-ascii?Q?nhFuNIigOWfcl/miJnaOtjLxV6+Yrcc4LkcB79iaep9sGmJI0lOez+qeWmQd?=
 =?us-ascii?Q?9A3X84gUlrRdsXt78OkO190VZCaBUKprLEdJp/vxg/0qsNJPtxOlJVr9mcvL?=
 =?us-ascii?Q?mCeqlTpz7KOfUF42djWy/vmzae0RvXksFUnPaxoN9ASjPe8IVhmTN1xAI6n+?=
 =?us-ascii?Q?yAAV/QTqODPyzOsTRO4sV0E/7xlbeBgj7AUr0rCFwoN3ZD47Bp3nJQj4My4y?=
 =?us-ascii?Q?lt+MpvcjSLPIqTPZ5pOg9HXFmwfkTrIGI9lcAA9sjWzHV+mb/VBLJMEoczoD?=
 =?us-ascii?Q?TwFCXNryGd238elxIHuhJgKfR5APaq0KRtRAJ3dnETnjJubycOS66joCRQ/+?=
 =?us-ascii?Q?GO4FEs3PPRlMXer7Uc5bn8bnJq9JT1qO5o1C7TEk/Ma9us6jc8B2KpH0tnl8?=
 =?us-ascii?Q?6cpex8ma0CX1g6/SeIPOMReh46njZqAJv1S8LQM7o9h6caf4J6UNMTbtLeBf?=
 =?us-ascii?Q?rV9evmaVKWOmNpq4XtzLKPPuP3Yv9zY7ikfTeoarPw2dsb+hkg6ATPuZfpkZ?=
 =?us-ascii?Q?qaxKvrfiT1af5gBnglOUWq5OFY6LFGS5z+jFjVQgQ2rzU03TpkxMXLFR8c42?=
 =?us-ascii?Q?ISf6LwYJNMNqsJ/UQ/yGc2OnevZ0GHbInMs8SOi8SinnWk4xLpNsSeM5ZBNC?=
 =?us-ascii?Q?LvFHb8kvR2kVmx0c0TR6OL6G7mNS3D7BqzMPCtBnHfIvLXdPvVgwHRRYUViR?=
 =?us-ascii?Q?+XBCNUDof49SYrN5VmZ1jJ7wfRfaSQ2fbq1MDn0d1i4xs+vuODCZ60RM2MwZ?=
 =?us-ascii?Q?Emh5iBgK77kNQkK8/ShDVylGzI/Q26SbxlFzo/KayCe+PhiEiuttOanhOPMq?=
 =?us-ascii?Q?oZMOJK7ThcL2DEXxyRyamfxBPoWFT6EHuGRM95uj/vQ5v9JHLpVtK3GMy1uT?=
 =?us-ascii?Q?h4oWAkMU3CY4AAnzPdx5asyBUpqjBTTFlQzQ5zeWIRA5YUilK/3h2kIlBHWG?=
 =?us-ascii?Q?mFmsJxUO4dlPfd6Nf76OoXdms6COP7mrMMssmtOwprYwfEiKVfJEB7iEdyn0?=
 =?us-ascii?Q?e7ZYYIUUiPt3abwBEIsnXyy5N6OQYoh2ncVdmC4RcFTlNCg1plc3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0097142d-cd30-4a62-3b8b-08df4a4655ce
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:16:46.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOikmkmJ+xSIrDat7EvzZyR9CUDJKPOex297nYG5WjT+EO7JPRGVHaFTUjDMsNVMuCWHoxBbqrpI5+SCNvZXCTkTg6vhcYdA3FlRB8ktzfTOwNYeSNhn+Vfb25iEy1tX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB262470

On Tue, Nov 24, 2026 at 01:52:55PM +0200, Stefan Ghetu wrote:
> From: Liu Ying <victor.liu@nxp.com>
>
> i.MX93 MIPI DPHY PLL has limitation for matching with some pixel clock
> rates, e.g., the best DPHY PLL frequency is 445.333333MHz for a typical
> 1920x1080p@60Hz CEA/DMT display mode with a pixel clock rate running
> at 148.5MHz with 4 data lanes + RGB888 pixel in MIPI DSI sync pulse mode,
> while the expected PLL frequency is (148.5 * 24) / 4 / 2 MHz = 445.5MHz.
> Fortunately, VESA Display Monitor Timing Standard allows +/-0.5% pixel
> clock rate deviation for timings.  So, for those display modes read
> from EDID through a bridge with DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID
> operation bit masks set, pixel clock rate could be adjusted to match
> with the PLL frequency(for the above example, the pixel clock rate is
> adjusted to be 148.444444MHz with about -0.03% deviation from the 148.5MHz
> nominal rate so that the adjusted rate matches with the 445.333333MHz PLL
> frequency).
>
> Instead of checking the last bridge's operation bit masks against
> DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID to determine if allowing
> +/-0.5% pixel clock rate deviation, check any bridge after this bridge,
> because the last bridge is usually a display connector bridge without
> any operation bit mask when the clock rate deviation is allowed.
>
> Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
> Fixes: 5849eff7f067 ("drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

It is v1. Need drop review tags before post at next time. Reviewed tag
need explicitly sent out to mail list.

I reviewed in internal pre-post version.

Frank
