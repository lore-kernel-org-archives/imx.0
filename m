Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B83D301A
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987570; cv=fail; b=JJG8FMWBPaycNNVcAUzkuDpE8S//kSKE7WD+/gkVoKlNgi1FcKK3sV4/Krc7LpPqhe1ATlXW+uYGSz5Tn4gx913boeTQ9vuBJacdMRfHJfesLrLWDCRVIaOAQjY6LJyYHJ3RwHy9v1hH0AJDLnpWlx+bK5qUSGW2jbYiuyiigo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987570; c=relaxed/simple;
	bh=1H4PERF9nziTr7G3tYK3b/XxmoSHsU352LO/EHgnly8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UtcKh6yt9FjG531qg7sy2x2H4OXr1GC58vTfR/3Z6uuhkwNgXhFC7zsBLWbnDvp9Qot9TWIom4F1fLoy/aiFrjtCsYGhxbgf2+T8QAsu5E8KPnNWmFhFMxUrGGYhgDpx7/KfzOGCReGvuCF4ONXgscYkNkfcWSbq8Yd/dG4bwxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QIrjg2Tl; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QIrjg2Tl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYUBvUNAUJnzQIoVqMcSsEGJKMRxEVM3g8oesogEiAywnhmwm5x48+pai5dz5F4Uv2ho7cz0b/J7D4hJEjBJPCXbowKbU7zZ1N8vIee3jAzx/zCmLK4ZmK/DQ5WRy1w+u9GwcjMBB5oij6KoXjXncMOVJy/q8fjgQ6QBnXHWN3248eb3HZbI2zKr3qam227MvA/Gd7GfZO9vcfXIW6/k3BVS3paaHYu/xLSIeJFXMvWIpyLpa1Chek108JoBgHIEzyr8JyKmCezR0Sdw+25chw42c4H0mHNMHP1Yk/BVkT54A0biPIEv5DdqgyBDQP8dLF7UFmhl2BeLLRjJaSWcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOlAbkyGZy5H1W5CsSkzgaYbGRCbK+twuTuWzz0D7LI=;
 b=g3Nd3BsrWo4vT5JI297ss6Rq681kf5EeID9aA4B9xvD5V/a8Zu5vBaeQjp6k4tCR1YvivHRnWWJpY90Oo/ucQh3B9/1pV5Ae4fqyyBtJwpcQ3cn1+mj+9rKtHJ1Gh8j4hDrNnVpoOtV2cnaD+pHxVKS3mShxXFHgMH7kvnefnyPKYLJpm7b+T7whxInkEt+SGN8ZwZBrC8hsVsadSMOPzyggSyxmaD2oaCebBFOMTWMVLwc3H4LBAv1LeqLtDLRVjs7J41i0r4QdtzywRSn0JoVDvMzLFoPWa+j9HbcPaA8R8p+TxglS5Bhuhv9lC0NLIaYCQv4JzthYH0RhaRYBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOlAbkyGZy5H1W5CsSkzgaYbGRCbK+twuTuWzz0D7LI=;
 b=QIrjg2TlGefKWIO9V2WUniXcvH5uFKF9gb0CJPxXii1GqvKx5XmjBxOPj+3fDQJ7gWmAohEv//Ge9syZyKleqCHWeaQKHLiv2pOUvtHsHG+h/+VNRBJ0Og10uCZNEq02r5kYOHXc9pCkf+TucqNe+wTYTCOYErNF4BLFEm+TMB8+w+MnJxljDQGBkAdga0k5RYSF6G/sui+Ln+VL+0hxDM+YIkOgFXYpwCYtQDyxFOo22yd1QAR2bXimyO67xCPId2MukC8Ujo0vPBwMpmIbBANMKvCGtryRNfD6boUTy4a5VohyZkxBGS1IgJHCmfpvUdG2MuyOq3rtqLQkW0Dylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by GV1PR04MB10773.eurprd04.prod.outlook.com (2603:10a6:150:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:46:01 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:46:01 +0000
Date: Tue, 9 Jun 2026 14:47:28 +0800
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
Subject: Re: [PATCH v2 14/78] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
Message-ID: <aie3AL_fInD58Tkw@raspi>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260608-drm-no-more-bridge-reset-v2-14-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-14-0a91018bf886@kernel.org>
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|GV1PR04MB10773:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c577642-815c-424a-97d8-08dec5f2c4ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 XJLq2r06uW4Mdo71qSiEaloecWCtqgnKRNLd0XB+TvWO4JTecAaChJobkSiXPA5GNEeoIjbs+Ze3V54P/+lbVJzfOWJrtCKNBLNZxophMv8WArDtSx7smNK9MOHl+k78t1NiR9UfD3dJUiJ/iHiBVry3a4Zy3L9VUrAgss3NXB5Nrw62whDs8ZsguuEJhDNpJoXwjuJFmKpnvJFEqRShH7uWQ6EKqdIqbXLPHMLJXUEJTtog3H6LcE4EPmY9mBCtH5S31vvKHIPp8SKb0nOCWvYjgAU/uASnqxSbhgPTCGXY42tRQIARZLaP0JEZSX26GeHmuJvTedI1nRIewm14LAeLQO8K/uhw6nWJ5yN7B90kKR8Wyt+mZzN/ax9vdV+cfqkD67K2dTrRczCqQlQlWw1rbiVPRKrWzvC4WZnkN9wDWU1QYXBsyEbi+Ihha3l/MAkwYRoLSuAUaaCLW4eud+i8feFJwaa5mCFLTvocQOTUz49Mk6NPpz0VbS+1OOxPGuqx1Pvwd7iXFPcvgkq8d29C/RD33gfi0A/0df+EEPB25y9F98oAtBU0lD8nUdEUySaNmqftBhaTQOfSY+5X6xagf6uhmLedtDmFjR+v9pgkdxJfXJ7dCsgOnwHVQm4DUda1Yb1zDkVTZ0bJap9bQ3NBk6JixgI4RJYi0M9Bjp1vjnbXqPlMyyyK4ubZYY6h
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jKucw9ywFg1zdre/dOExpjT7y27GD5sA3vIXort/PtC5zTioADjfqii7Diu8?=
 =?us-ascii?Q?QD8SZsZEzu784AgmPAAaNzxyQqBd+EAj13OFg7CBHq24J4wBrR01pe/BDmD/?=
 =?us-ascii?Q?oRfatz9G0AjoevMer5a7e0/9bROw4jKL73LFvOTIDwD2fLuej5FzF0IZx/S6?=
 =?us-ascii?Q?+4zPfiKDMv6zCLMcwKnDchYkwduGHGyCY5ZXE67iM9t81Puii+7t0jxyZpMK?=
 =?us-ascii?Q?tUw4okRZ7RVem3v7jG/GsEYWgwp9hzZYk10e7xadZvfGm5L5M/ENFxiguFbj?=
 =?us-ascii?Q?ohZp+HhIxIILyaO88RuMWI4bWxPm8fCe/H6oJJmQ+B3BAn4ex+f3bBwCjFbg?=
 =?us-ascii?Q?3cQw9hiwvtexjfjmRzEmFAmK0FvcD1jJagIYlK38PoXOU2Gcoq3yCWE+M0QM?=
 =?us-ascii?Q?lUIegvzwNRgEudKkvSWx6OeJh44FZcadexVgGevMtBaREhbOiNjP1CoZdhWE?=
 =?us-ascii?Q?afy1x1DvtkEEto3XzV+cJiRcFgFSWS8dlqU474jKSI33ter9AiDAjcI3HzXm?=
 =?us-ascii?Q?alCox1JZqZ6nmjv7NODXS9aJwR+mcEx/d+lq5NU/VYv06vnA0MY2QSGByjb+?=
 =?us-ascii?Q?nDTf0MxQVefXDD7s1UmYnBpYPeoWQQ2s3o5cAYx9b2uxP7NLNfRC1vqMM7br?=
 =?us-ascii?Q?fZz+5q8cPd85gxxyRpjrNcKtVVog0NjpfTp+EhmBj2FqmAEZ7Y32DE4oRQ00?=
 =?us-ascii?Q?cUTVvQivoBDW+WGwqbCfMa9OvuiTVBjCm5YFF27NiNayAO++XhTP6nDihCgh?=
 =?us-ascii?Q?8enH1JH0LHiPG0LdVskDTTyWHno1pjsgcjCcspItVmzKjQboIlzBFtqQsCds?=
 =?us-ascii?Q?7SpRkpTDo2KtXVUGfqT7yJpc5dEZF3Pjy2LLhVf1tz/nUE33UG3iHK2lc/Wk?=
 =?us-ascii?Q?DPyVAk9cguKz8qcjcn7u9AvApuylpUZKIxqoPZU2hfmWdriubsC/kqU6yhU0?=
 =?us-ascii?Q?aDslulyPvZ4mTY4gYKwG3Q+ZsyXXtXMc32I89fKsQJhSal2qMlh0cT9rgjb0?=
 =?us-ascii?Q?njM5kNefJ+fKQAumuK65Jv6kVlq0RNwWk1QQDxLhwVL3H7Op7Jv04FQyo+OQ?=
 =?us-ascii?Q?T5G8kL21om4LxAqqoGNi6yUgaHWCLmH5r458ePFE3a1tqY55lhoFlLuX3LUy?=
 =?us-ascii?Q?gPbriyEpvIfdc6g0iEYqOSsAOceArZDc0qZSoukqpAFD6pfPoc8ngNPDdgGy?=
 =?us-ascii?Q?EqEYShGQvniLJ2siMtGXPFPKERY5X5Ihp9fPVh9/s3tfVM4NUDjLI3ToKqrS?=
 =?us-ascii?Q?226kFOev2lScI+V16yAmGx6y0WDU6gppHnjuSYUbAU+fXrHY1KMpObGhfvld?=
 =?us-ascii?Q?aYeUYmSnVcjooZEEpQyyEoZLMRor7pIxjE1QtEi7pZ8HRhzHSVgfQCY2Ngu5?=
 =?us-ascii?Q?iE9m+IwWLTtG84Q9g2Hd9AUleQYwtDlLa93kErmDCNIAp2pV22hiz68U3SHt?=
 =?us-ascii?Q?M05AkVklyESM31q0zHWmFNRMIzZnXl1q49RjRZW0eTh833Z6WlxXs2powQOx?=
 =?us-ascii?Q?TZm+urx4IoONMiTS1NX8dRsJnEeDOwJm5U+6iknIHVfJvBxnEK4+NF5FLuIi?=
 =?us-ascii?Q?Iuz50Iiuc99O34uk0CrqJv8iQaRE74SfeRIcmaVpIauk94BIN9dYzEXe0SRn?=
 =?us-ascii?Q?WZNkCl3rhJlY3c+LI6VOtCprRHbQk+dmN7QE/DcP3NdOvN24+MTkrYIXG9zL?=
 =?us-ascii?Q?Wfh8a7Yc4+W3NkLfrZW5/SbPiFUG2VsN30+rEMr2IRYkQ4XhZx/N+itPtIsr?=
 =?us-ascii?Q?Ld0f0NT6/A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c577642-815c-424a-97d8-08dec5f2c4ba
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:46:00.9858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8g1P7J/txGgc12bxMFWoMGpht7fQZrFaBoN4J7ZO8xSDA+8zmmbKR4yu5HS3bje6JJZ8G1z26vSxGYFNq7SRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10773

On Mon, Jun 08, 2026 at 04:35:56PM +0200, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying
