Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AE3D5253
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987828; cv=fail; b=muTyM70xFdYmaAgtZR1wiiz/FjVLC/DoQsPUCN4zB9w1sX8D0WrS0S+RHgyggpiZFjSSqTDZeeuc8kIS59O3TV1dMpDLo+chXZTf3mBEvSJwT2fwGKQMyfVR30/2vH3UlKVI2qZEB0K3+Uks1LZWdPJ4JwvQVVVxCRh5wkzvXqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987828; c=relaxed/simple;
	bh=0JqBdITRVU04xljr8S0trneACWgwvnAATSklR3NSzdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePWSBBOC9erSo3ZfLyBuYvvBu9322VDRd6ZpBNhW4X62znIvpVab6tFazJcA652m+GMlvp7bJHZ+qf1e9GlDBrXsA+FjNq4pjvwpUTN8DxJiWp4aCuVt2EMabJb7gRbsowcVxUoojLdWV4FguF+009+BWT7M4zStkyYVFaxF254=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WleGMW+Y; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WleGMW+Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPXfhXhaIlimZUIFj9Tj7in/n4EoSBta/O90iS1pEEzhXQRjZDlKa+AEsNGuN43st8XkSLOJ34VtwxtCUmkFISsRL5Y76C/Hofjfg+ZY9yD+dx8cDfgHS0+O2YcOFFWC5/uWVzvTypovlILJIIgK4d8dbpWa1H/NOpCWnGAsi5RgFvPw0illUVJPwddHfm6Y1izyX2CTLwGduc2i8Lcp6ip2h0yqeFK7JqWHMwP3dMqZtc5YMA/hKFU7p6EqiBBzzMVx4ngjgXQqLAu/p65MNskxavrcZ6ztIqlBCa+5FKoLZWDb2H8zgFSbznj+ude5uSiipAU5qO8KlTjlP5jfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxv+5+aQ442BlmztdNj6NBZvjCyRjKh+nhMQi1ItEoc=;
 b=TiyfBX93bZuQbt6J2mywJT/pcWBONloqY50KKSIrQQIT/y3jhr49lgJeTHIvvm1oUPdCMhRMOt19GNyFm+IBT+uyb9XIw3AaaUdhASxs9bRemDNMG6wWalPzFoO8LEhLKlTC3G5FEVbMZco7b20wzTAh9Mwcn99dRpsYX3x2hFZ5WKgnuq+NeZwJTw00JrTj+Wvd0TH7JH1rnDKNy6DLHuT9asWz1sON03omt3YcuBEzUpbxA/eJiOpqO/b6xSVZRRKICjf8oMFaLgC+X9SL2qgGa2wvxwrZ2ki4g170yjbE9HR1AJgVX2ynh8pr67fV0gRfF8c4mxoNG5uQ0w2IoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxv+5+aQ442BlmztdNj6NBZvjCyRjKh+nhMQi1ItEoc=;
 b=WleGMW+YuRLmFSB0Lm5ZjDaNShpHc4HbFvSGIF73Nh1eyFH0QmtQb3tbOUaD4yCYPhClWh0fcxZxQ0QfsG47lSchlwQ1j/Wh8CNzMkPGrvXlx//R/LExwkYW91vgZFx2f1diwNHNZaaIWSAu2DPcfMZPMQemxeZY4L3ifWFCIkYgOgMJYsBjd/0IAOPywvoRpaS36as1om6hUFjSBF5KLFDBtwveoyU8Agh+KCaNRNhDfWbfxDjXdWS5FeCWmh0y+E9LCHTvaaCOmcga7PJpfCQNODakzjqO0GNWVKG0lcXqQY9RyuqqD72HYQJhl8gx3UGBUxWyjRr2EKuK4Rt1vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by GVXPR04MB9952.eurprd04.prod.outlook.com (2603:10a6:150:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:50:22 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:50:22 +0000
Date: Tue, 9 Jun 2026 14:51:52 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/78] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
Message-ID: <aie4CP_KWM0okpDL@raspi>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260608-drm-no-more-bridge-reset-v2-15-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-15-0a91018bf886@kernel.org>
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|GVXPR04MB9952:EE_
X-MS-Office365-Filtering-Correlation-Id: e865279c-2c82-477d-6a9c-08dec5f360b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 b855uAOlibG0598ay5AoUIpvcT3T33Jr1pIHEBLNWgoqNVd0K76yxIVdRl/QmulWHDfHCaBWD1lq0e39nV1GLdePEww23O6dDnlj3oRifduhCucdknhwVpDd5dBwnuAbpRTA69iF6Ze9F6x+KoKpoC1lVf755ua12gGVRlWljp82NgEReHRMfnZqRgwgZ/s2SJv+PXtggKzUibHfykPmxa9mlZiOWuJBNrkp7RwdfaCeUJXBjVHUbCRb4/N1jyQac9kc3bkgUWiTeMISpQA64VOsalAI6MC+vSdGa90YsZO8/ozz2XowsheRnKi5yBEeR7rF4TetL7rLEFU437peGznmxFkLjJsVEAjdQNVOvRhJ5lB6E6UvjmojHH0mYLwEM8bYzJ8o/wR2xWoufTaCNe0ZmQkxml47E5tmTRaMyniG7OJk2kZ2tIgtA+nda1EayucDPnAvRtE5GEzWAue7y00SWV0J32P9fflHb1zUxG3PLnxeVlzaCuCLUPVU6LS01IawyHpSMETQS3LBbAJFce6TsoVzvL07NwESMl7lG7Awlhl6ByxclTiL52EOUwYh2MldrBm8TfQy94slxF4aSd39qo9wPn9hj07t/BqTgTcmoZ44G8ZIBYgVzeh0vAFGwUFimSpQiCrHWbDAbDu0tE4K303zanO3G74SVJARuvXY64+sbojQKOepwEqrkqRW
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BTHb957A3WlId9PIbcbQXPyjDnLwutm8imoTSPvrGDImBzfZmDTcZ6RNzW2K?=
 =?us-ascii?Q?uB5ty0YKFyUp7K75zutoNSaHgFbxBZPgIF7gN/SJm2yI5dR2Fp1uc63QHqZw?=
 =?us-ascii?Q?jRmExSkyqFnZZNHM8iOnCwfsRnl6OeXVt9qdB3tMxtru53WiD1DIYiQ/+uPU?=
 =?us-ascii?Q?yPIcy1s3oENv57PIK0NEgoRsmkjoC46Jn1oU3q6wSNn/sUUwYfCtAMr14/47?=
 =?us-ascii?Q?qj2TsTKDxOB61aEZ4OWwx4uhQ0+XWfu9KDo6K4Qc5HzSLYxeSXVeDrjM8UW0?=
 =?us-ascii?Q?qmHh4m99IEL4G/8dFC0+jAaUckxqxVsD4aY8hIs/yKksyDEqd8wdyH7lQP+I?=
 =?us-ascii?Q?4x+lkh1qfdYaMGgvxSPiUvsj2L4aEGFRzyJ8WpOQ9vNVuTkMVMRwsNaeQ1+f?=
 =?us-ascii?Q?Yd5aoDYbEdD+pmjPhopOIvsDd+v7wdrM0P2nMqbU+Jm7vODwUH/CEf51u1/U?=
 =?us-ascii?Q?W7oWIhCpUjr0ck0cE3TjIfPPszK+y6pCrWcpkOAiTsA99iimOsKVAqSTBU/3?=
 =?us-ascii?Q?WExeCTsxiV1RfZyeFX8wnVJO5rorrQhrDmY2MJMwFaNjT1+OqLdjZjMY2fBw?=
 =?us-ascii?Q?+lQepsk5f1kCCNBq/MQ+213YUCrS7AAHFW2AXs2GZOqicr6TS7Zlzp+iThsf?=
 =?us-ascii?Q?uDn2P9hb3wTv8gzQjB1IAnCnf7NpT/pjj415EBHfIrX98Hn8zpD6DIQYe2Mh?=
 =?us-ascii?Q?1Rapu7wdM12W2vpsqSNbb9u3h0QhOZBwxm+dSWbE8Af34Ca8FVOXAFhn72W8?=
 =?us-ascii?Q?GfazZoIhRN9UKLECL+IFL9C3yGqnJQHbogS06SBCVBpzcQG6xahmLhcm4niM?=
 =?us-ascii?Q?n3sN+qHC+alXH2pLFpQ/rH5zYcLfiHZoMnDI8FQ3GEvvo3q5Eaqadr9hHrx7?=
 =?us-ascii?Q?77U14ckwHiQs7849Wpjjdfu2txaqtqpOnvDfcKYb6NY0FDhKPOkA1mgm/bmB?=
 =?us-ascii?Q?qe4oY7esSNe+qxzzf4gHVKysG3I3TGUyYsy47zbk3gtPr4E1o29lRARuE2bW?=
 =?us-ascii?Q?XTL+LCU5mu1ZL+eK1pWznUqqYfC+Umn+vcWFeSp9adyJQeOV8uLMOoEx+v6z?=
 =?us-ascii?Q?/7LX/ZrAwOnYodV+muwDBPcauEW9wUuaCNqnjrycBCsQ+iG5ExUSojaKq/ea?=
 =?us-ascii?Q?he/8lGnqbA3kwoV1Jd8hI+4PmuWQBxZDk4f1tx7m5AwnlxVvGBODvOmEpssz?=
 =?us-ascii?Q?QjCyjJV337eDPiFzvRpreIfhz95lnc5Yj7gTs5JCGkYA/pVwKA74kYZf/p+p?=
 =?us-ascii?Q?tySQAr3of2gTo9Sm8MVB43N67y7U4WBwKUsUP3eEwLly9Ys9ovE5CAMwTFRv?=
 =?us-ascii?Q?qj6knmDycY5iZv8WTyRZdZyBmSQIw345y8yZQoFhCD6eWVaDWeXK2vwg2rce?=
 =?us-ascii?Q?iS7mztvt6Z7r0nisK2wnJJ2jFAn5viQ/jBB2QW24Qu5d9YR/yjIw0xywCj8K?=
 =?us-ascii?Q?JBgPfL3eFazi5ylE/S69uX7d0KgKBWg4/Je5ibli+MFgfcusIcb8PSZqAqB8?=
 =?us-ascii?Q?Aw7WC6HTfK0SuDOiLfIIAfHCkD+UJx84yb6jsfDO/gp4cfHAFthYXPBsgU9j?=
 =?us-ascii?Q?5hvkKnZzUEtwZUFRtriYchh77ckCcVhREX9ruMB8t9Gh9o54ila1oGVjz7cs?=
 =?us-ascii?Q?TOyLOcw2H3pjtwtSKZPLHAQBbhmo3iKYqoB2JniM59/r7HW3srTIZibW+7xU?=
 =?us-ascii?Q?foodj8UO7NoKL2NgM7C+abeX3JB3D6UlZASg7ANeQOntZDrdp6h/0/wypbEG?=
 =?us-ascii?Q?fsdGkipV2Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e865279c-2c82-477d-6a9c-08dec5f360b8
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:50:22.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YDTciqPiwhG8gc9RmLTcxpBFCfvJOxpWMXDRojFJZKCEilpwzznmQe4+lyFCQuOk1o+MS1CMnrUVB06GIdNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9952

On Mon, Jun 08, 2026 at 04:35:57PM +0200, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> To: Liu Ying <victor.liu@nxp.com>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> index a6ca4f5c6cc6..a654c27356a7 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> @@ -387,11 +387,11 @@ imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
>  }
>  
>  static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
>  	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.atomic_create_state		= drm_atomic_helper_bridge_create_state,

Nit: drop a tab after .atomic_create_state to align '=' characters vertically.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

>  	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
>  	.attach			= ldb_bridge_attach_helper,
>  	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
>  	.mode_set		= imx8qm_ldb_bridge_mode_set,
>  	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,
> 
> -- 
> 2.54.0
> 

-- 
Regards,
Liu Ying
