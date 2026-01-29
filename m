Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF23446C8
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707490; cv=fail; b=P4gdu4VvyuBP8wBJqZeOWrpnaY751U7fEHH1E8WlxM+SBH2aISPv76J4fXBFmeBYzgjOAFFxyIAi4hw/mwdLKj6ooxecL91TKasFkaKtqyvfcXBSGrHu9MXm3V0w4umS37H3Crb8ysw+EIfVbZR5krCps/PjyqFCka3E/QXxKaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707490; c=relaxed/simple;
	bh=Zhx8fciamKERmKGLF77JVYqLYv/WBwCG8HUrIPeZ02Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GTThEgEtZiMN7Z9iRH6PFcObflCBKWk03bnhd5lyuUP17bA7YLmIhYgpSbAXE/6OkhwsNGn+UE98ZZEZjYLdGpCmr3D+g4gNH2JuEitX7t86gSnqcdbyKMxz/yRxlfk1B8CV7hD+6AAGGzBAXy5T6u3BPKmfqO5IMoRG2KdPliY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PUPYK0uc; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PUPYK0uc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0tKDF2r88/87BgOnr+f6ZMxTVKb9S01kHgtmXrFlW2Mx9XRKHvj9rXAxvxMkmnb3S8+ffKh/4wQyqYHNsK5Or1Z2obS8cTELEscfEem7fSZ4FxLDixNcv2gMS+PCjeU8sPn0xl2SWRbsz4EUPgv+WK1RpdA7m+g766jdzsbDRG5oTc9kYyiyLAvqq03aZweeMhzqlU1lAbXCDtczkbA9+cc7ZrP5wKuB3bSa2BxSCHGTruj3JZkYi38GN0Db/3oHRpvQUTXzGMxIazpCMjUjPgkbdHCIAlblpZ7WSiQ9cAmLr3EDeAg25iUWpnHp8wxRzLwSucQBuYFn2dRk+eVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H8fRB9Mbgk7zBiRSBlp605sJs7ucCkhEdQ+ffbFbRc=;
 b=HeD6kNCwcXRJRxZXtaBPUxGfhVLYqb4R/PHz1Yi5J7tz4S/eStmRrk7JE9xr1HFEX3+CBEUarPYfy4+vDUvj9ovDhkGCK7ucMPlk0VG4/D+U7lsM94zLFZYBC67FcDAgCGTLW0mLkNrnnfIk9MSkTBg1VjYYhRCatG4u8yhRB8yS0XewTEPqD+bMhewyYhemnrIT6nNPKoqytc2UHuhTFtRie2KPZyyCw865fx5ZwZzEvsCHVZcJNOafhzBOzD++3EuIlJvXCA4d1fG2NoteujfaUKJzepb3570HhGCIZoCnGqIu0fbr0PhopSDSoJ2nsSjxP/iFpm9WuuPb9BNHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H8fRB9Mbgk7zBiRSBlp605sJs7ucCkhEdQ+ffbFbRc=;
 b=PUPYK0ucnjHR/F4LCL7jum+OKfPiTes4P2h03Dz3uHTgbx8eIxMeZu7DpWhVqrm3/O1GCHU2vxi6ohrzMGw/Cjxp5+63zAjBBbHq20dxH5sWePJ7UWCQqhFBpa+fDPpKw2cRVI3TgYV5zwhAeX3NNg8ey6wltqe5hzGKVeVXal1rxTgq3k4zy7VSbNGj7eeAtl/r83TZEhbCTm4lAjnz7/4BbuBt5GPZMA3W3Zz05s/PxS6WQXlAcQCFI+23PGWc+uTRKQ02brQLyAvcm8ESaWZRQzZI5agL1kLKS/lmUL3XqG7FppxwrRY/0Hie7vs6ASa1xweW2EYx42jI221B7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8107.eurprd04.prod.outlook.com (2603:10a6:10:243::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 17:24:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:24:43 +0000
Date: Thu, 29 Jan 2026 12:24:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/4] arm64: dts: imx93: Extract common parts of 11x11
 EVK into imx93-evk-common.dtsi
Message-ID: <aXuX0r4RIGxWsWXK@lizhi-Precision-Tower-5810>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
 <20260129084249.3079432-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129084249.3079432-3-sherry.sun@nxp.com>
X-ClientProxiedBy: PH8P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a27462-62f0-4c82-f171-08de5f5b4ab2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?uR7uotgiPCx4jpfWpsDNFsIUwjg5YkqKcNHtAxNhUPlTl9yCBB0dFZ0YVf/P?=
 =?us-ascii?Q?nhbd9AC80rMq9M2mImCexgWYoTD1MjYnOBewTk/OkQuY49mMaxWQQxp9KEk1?=
 =?us-ascii?Q?lq6R4utElgAV95Zimi655m0z+BszuUgTrfsc8Hp5bA7xohvCE6WbuJmTHhgI?=
 =?us-ascii?Q?OAVUINdsO3Pm8irY8zWy7l5zRkbgsGlh6iePz/CxuUoSiqZ732aR/YxegYHY?=
 =?us-ascii?Q?TCRvscC085QVp9ZsEE5ePhPSY9LlgmgPzIIJzYp13hYu9i3QSWOqLZYuQ23Q?=
 =?us-ascii?Q?8cfDABjx0M8a4WRx6YYsr77AiNtO0jp6alM/i0J+idF4IlQviNsUg1g99IRs?=
 =?us-ascii?Q?DlPYwEgtiPKNcyFuA2V/HQjVmtKe7l/V4qG0+dWnNQpFkfWgQICoZzi3MW8Q?=
 =?us-ascii?Q?9rQVWp98zSitSoIv7F3cS+tB8lV/pt+yBJN5ZoBF3GR+winW8USJSpCW8CVn?=
 =?us-ascii?Q?FwYqBaRm+v+IXrXGbrxyHlFBoMb3iPkHmm97Bk80+KBHE3DsB3ubquXAa4kc?=
 =?us-ascii?Q?74ezf09qp+Kmy9JzIvHMpkQ+5si5USCnJnYt93s/IwCAv6321myrP7ZpqMUK?=
 =?us-ascii?Q?pSEPcZAbTM89W4PltT+YAIBKcteI9ojc6Yvku+nhpu1dKVLdLQVJ47FwJBAs?=
 =?us-ascii?Q?SXVJOlSxLhqqRS8OjUyXbNpgt1ECq0ooU3AAwAa5nTaKeAGA6KxugyNgBXGf?=
 =?us-ascii?Q?RTDwjWDkpNIf8lYK/4edrITLv6adyMRVeU8kPeiEXk5z8npJq+IC9bD1cO+c?=
 =?us-ascii?Q?UK3nLQkOTi477BSl+XDfkumW5WCB0mBTXYLMOspsieGDEMFyLJWO+NC2G8F/?=
 =?us-ascii?Q?Mv24IF73ABBmKb6GlPLC203C2ti13c33lJOa4AHTqVKnn7iB6TRIyW3ZvIAd?=
 =?us-ascii?Q?9MWKO4MGpePuy9rL2hdy7Y95E9Xg0vYJrVEa7yq6ydm0cyeYvmRbCHStX9gr?=
 =?us-ascii?Q?p2nv0H93sGVeXtqNoHBh/URVlgv1bu/IAeHq68Cl6esliPZo+F1HjmsDCjh9?=
 =?us-ascii?Q?xM8FdcnPi7sHPGxTvzhXrFlByFxazSwbfmA7mB2GAAkCXTpCKcbUQ7NDMx1S?=
 =?us-ascii?Q?Mni3ZcKGTyVQS0ie/HNGGxX6iebfM/D3zs81c/tVLkY25c2n01ykxZ1wNIaN?=
 =?us-ascii?Q?zRpOAn+5poC5nZlGTvluDy0ZglAJHvqZqOQDLQuNP29YZe0MmPcZTU1jzHkY?=
 =?us-ascii?Q?RfCGR3N18mwJI5o6Z0IGmHs+KfIPyYsVKR6+cS24jhtUP0fgGO9FrGNlZ1/J?=
 =?us-ascii?Q?bmW/6Jj3yw0M2BWwhAXv8ODJutoI9O7pR6AmrMYuz9vfJNr0rsm7qx9CteDc?=
 =?us-ascii?Q?znzE949VkI6TqAA2MNEBl/CEwc2u7ekLmQlV4kbINCcvELlfK+Z4XF5gyLxK?=
 =?us-ascii?Q?wlolrO2pCZ4995dPGC/5yI86PvUOz74TmvAdjbi1MpXw0dht2KTT86viXj9J?=
 =?us-ascii?Q?/Zi7j7o7rcw26a5R5hsfi3DxBLujWBduFrsKU0umK9i0J9BJu5mnVgUTyzNg?=
 =?us-ascii?Q?Nnr86WEAmZQ863HPo+Ve9OsXL4qh0VKC0+rQ1BwlnCfNnaWF/fyyhhb1hj7s?=
 =?us-ascii?Q?RdYYwKW2MQ9/VC480k4Qe6JVlx/ozOP02VwrQJlis4bY/CU2i3AcruAKnWsI?=
 =?us-ascii?Q?h4RGpy23mCH0OttAI8dftYA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9iY1OD96cBYPNUft6z8TbD9/Jumzz/Uztme0xBjkE+noWv4PQgo3JB7IxYsN?=
 =?us-ascii?Q?NTUtczq3rxALC9cQ5+W1avEUUAl/E5uQWol3JYNq/8OZRLcBSGkiE6wo1ptr?=
 =?us-ascii?Q?ip5SYdJncEwhH1pvHIrg3Gp669YkA58aMXsk5dODaY6URtOLSafjVYZn+E+0?=
 =?us-ascii?Q?BoCHJzFWKfgJWf14Fwzb2Iypg/14ujC+xo+BWqPBL7cVpjKDMQlC+BwtqI0/?=
 =?us-ascii?Q?hETvRTQ25dpvPQRVrIdHjgl7Ie+z3tH3lCZegHoecIf80VLTShxJZMCkAjIU?=
 =?us-ascii?Q?qfRU5LeeXpdVBO4vkxgIGrFX6qb6aFOeoizsAmv8vd7P+2WJixZXs9spOr6x?=
 =?us-ascii?Q?wxBgGt8rs9Ylj9jR/F90c/se29olNoetgKNZ7EzykdK6jTbqmX06hGaALWne?=
 =?us-ascii?Q?1SR7GwxAdXhU0UY24K9VEoKLr+0OJ+6rpcqlDRTtPNtzuYOacGgkqrlbRklk?=
 =?us-ascii?Q?v2SzHN4XxAQ/9xkZlMp7+eimARYa7PLF/advWHYvrvKbV/FZ5okF6D0y1ngk?=
 =?us-ascii?Q?QNyg8mQAVHw53ZrmUIHhubyxisNFoztoPIkK+8wjtTw0FO5zjEff+piKKePt?=
 =?us-ascii?Q?Sas+mtSmU7H7nCYVBkUjo9PoH7K47rJduvHpzPxcA6DOTB9dq5i4ss5tj5Mm?=
 =?us-ascii?Q?KoWKkgqqUTx5SJvfWtiSXqfKm9czZkoO0SxDhTD2LzVbgTG6IdJzg0yoI875?=
 =?us-ascii?Q?sPEdOIIBHUYYSvfU1FZ3LqFFXVDy0kk14POkj/5BV3uZ/g+7yYtVTxAaRS+2?=
 =?us-ascii?Q?xKtVLVs44NXxN/Ch/YQiK4YjOkknjMJkvyqru8Oi6TPEzzw5F2ZZf05lVRl5?=
 =?us-ascii?Q?mHjyl0XXYEUrY44KO/6WyGcrWdJBEO/H2NKT+lXmmyRJu32G6t2+GaMxMjv6?=
 =?us-ascii?Q?EiJHflwYeoApK/DtzQVwbjt1SJWpAs2r5iqeYwloqJdqslUvdLJyz3R6PXuv?=
 =?us-ascii?Q?R3owPJlTuoSWAznKwOiR9m+5p+4G2heEFQwt2CtnOJ37pB6/iIx9qCzATRLY?=
 =?us-ascii?Q?FFkQoULEfHd6+RxOiwtuyAAAHO2ltptUfdAB5ukvWVW4v0NLQSXgtr+J7oct?=
 =?us-ascii?Q?o2BlsJ+K4a30Ren/9ihcitmYWPP70cf6LWc6mwf0KgxvIL408OUpo1Wj75j9?=
 =?us-ascii?Q?bodIgXvgRABUtO480vSRvAaANxsg2Dt/6eXcJNhoFus/0NILHgK3i21mtKe1?=
 =?us-ascii?Q?v2ju+DYcbaZi+Ltges7cNDznZxH9MNq4TKnhNQF+tygTAtLk4LXehF79taRj?=
 =?us-ascii?Q?IKySxuhwOl76rbxio9Z/d1qZ7sABItHTed7nV2tArbDDzkH9heJqr1NBnUYY?=
 =?us-ascii?Q?UxwtvbhCJhPe2o54H8BJ8wCY08H5NhPbzT1s+Vy6tOmVSqCXQqtluF1NYTkz?=
 =?us-ascii?Q?UWpY3kahJnmOIyXAFGKvr/AbcmwJbEcJ7v+35pcR5S1CofkxEKNxCJXelbXg?=
 =?us-ascii?Q?iri5tijvHGn4mQg0ZCtpzAoXV+NTDQaUDeD6JDRUTGLVWXIDk7k/PVdUzooC?=
 =?us-ascii?Q?dTsibMyVlrmxQev7/wFgccEmjIFTHVKzcizxxUISHqCb56tLE3bx5kXYhJYd?=
 =?us-ascii?Q?oQlSYZRyHddkLiD6RzR+TlZxKiSTgESADfEEtF5/bcX0HnOorTQmR/xBtf9U?=
 =?us-ascii?Q?xR0G7KDfgcS8fp5ztnYchonAFQKn5IykdtNiCBkr5/pWov0s2nrUVhCwLwJ6?=
 =?us-ascii?Q?6AgckWEOjwryiudP0rkDqQPxUwfo9qQJLCz1jepv9YvSdnyL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a27462-62f0-4c82-f171-08de5f5b4ab2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:24:43.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z9un0dIkdKjJLXZliS198Ps2rew19NHEFbApIDLgqs06xuQ0BY5P54mks5lqjvWHjTGA3z2cmGUL9NarvcveQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8107

On Thu, Jan 29, 2026 at 04:42:47PM +0800, Sherry Sun wrote:
> The i.MX93 Wireless EVK board reuses most of the design of the 11x11
> EVK. To avoid duplication and DTS-to-DTS include, extract the common
> parts into a new imx93-evk-common.dtsi, which will be included by both
> the 11x11 EVK and the Wireless EVK DTS files.
>
> No functional change intended.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 861 +-----------------
>  ...93-11x11-evk.dts => imx93-evk-common.dtsi} | 207 +----

Change still big. Maybe below step help
1. rename imx93-evk-11x11.dtsi to imx93-evk-common.dtsi
   create new file imx93-11x11-evk.dts, which include imx93-evk-common.dtsi.
   (supposed file name should be imx93-evk-11x11-common.dtsi)

2. Move different part from imx93-evk-common.dtsi to imx93-11x11-evk

Frank
>  2 files changed, 9 insertions(+), 1059 deletions(-)
>  copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-evk-common.dtsi} (79%)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index acb160d3186c..2588f39f0239 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -5,114 +5,13 @@
>
>  /dts-v1/;
>
> -#include <dt-bindings/usb/pd.h>
>  #include "imx93.dtsi"
> +#include "imx93-evk-common.dtsi"
>
>  / {
>  	model = "NXP i.MX93 11X11 EVK board";
>  	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
>
> -	aliases {
> -		ethernet0 = &fec;
> -		ethernet1 = &eqos;
> -		gpio0 = &gpio1;
> -		gpio1 = &gpio2;
> -		gpio2 = &gpio3;
> -		i2c0 = &lpi2c1;
> -		i2c1 = &lpi2c2;
> -		i2c2 = &lpi2c3;
> -		mmc0 = &usdhc1;
> -		mmc1 = &usdhc2;
> -		rtc0 = &bbnsm_rtc;
> -		serial0 = &lpuart1;
> -		serial1 = &lpuart2;
> -		serial2 = &lpuart3;
> -		serial3 = &lpuart4;
> -		serial4 = &lpuart5;
> -	};
> -
> -	chosen {
> -		stdout-path = &lpuart1;
> -	};
> -
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		linux,cma {
> -			compatible = "shared-dma-pool";
> -			reusable;
> -			alloc-ranges = <0 0x80000000 0 0x40000000>;
> -			size = <0 0x10000000>;
> -			linux,cma-default;
> -		};
> -
> -		vdev0vring0: vdev0vring0@a4000000 {
> -			reg = <0 0xa4000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@a4008000 {
> -			reg = <0 0xa4008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@a4010000 {
> -			reg = <0 0xa4010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@a4018000 {
> -			reg = <0 0xa4018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@2021e000 {
> -			reg = <0 0x2021e000 0 0x1000>;
> -			no-map;
> -		};
> -
> -		vdevbuffer: vdevbuffer@a4020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0xa4020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -	};
> -
> -	flexcan_phy: can-phy {
> -		compatible = "nxp,tja1057";
> -		#phy-cells = <0>;
> -		max-bitrate = <5000000>;
> -		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	reg_vdd_12v: regulator-vdd-12v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDD_12V";
> -		regulator-min-microvolt = <12000000>;
> -		regulator-max-microvolt = <12000000>;
> -		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_vref_1v8: regulator-adc-vref {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vref_1v8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -	};
> -
> -	reg_audio_pwr: regulator-audio-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "audio-pwr";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_m2_pwr: regulator-m2-pwr {
>  		compatible = "regulator-fixed";
>  		regulator-name = "M.2-power";
> @@ -122,18 +21,6 @@ reg_m2_pwr: regulator-m2-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_usdhc2_vmmc: regulator-usdhc2 {
> -		compatible = "regulator-fixed";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> -		regulator-name = "VSD_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> -		off-on-delay-us = <12000>;
> -		enable-active-high;
> -	};
> -
>  	reg_usdhc3_vmmc: regulator-usdhc3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "WLAN_EN";
> @@ -156,17 +43,6 @@ usdhc3_pwrseq: usdhc3_pwrseq {
>  		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
>  	};
>
> -	backlight_lvds: backlight-lvds {
> -		compatible = "pwm-backlight";
> -		pwms = <&adp5585 0 100000 0>;
> -		brightness-levels = <0 100>;
> -		num-interpolated-steps = <100>;
> -		default-brightness-level = <100>;
> -		power-supply = <&reg_vdd_12v>;
> -		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
> -		status = "disabled";
> -	};
> -
>  	bt_sco_codec: bt-sco-codec {
>  		compatible = "linux,bt-sco";
>  		#sound-dai-cells = <1>;
> @@ -204,354 +80,6 @@ cpu {
>  			};
>  		};
>  	};
> -
> -	sound-wm8962 {
> -		compatible = "fsl,imx-audio-wm8962";
> -		model = "wm8962-audio";
> -		audio-cpu = <&sai3>;
> -		audio-codec = <&wm8962>;
> -		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> -		audio-routing =
> -			"Headphone Jack", "HPOUTL",
> -			"Headphone Jack", "HPOUTR",
> -			"Ext Spk", "SPKOUTL",
> -			"Ext Spk", "SPKOUTR",
> -			"AMIC", "MICBIAS",
> -			"IN3R", "AMIC",
> -			"IN1R", "AMIC";
> -	};
> -
> -	sound-xcvr {
> -		compatible = "fsl,imx-audio-card";
> -		model = "imx-audio-xcvr";
> -
> -		pri-dai-link {
> -			link-name = "XCVR PCM";
> -
> -			cpu {
> -				sound-dai = <&xcvr>;
> -			};
> -		};
> -	};
> -};
> -
> -&adc1 {
> -	vref-supply = <&reg_vref_1v8>;
> -	status = "okay";
> -};
> -
> -&cm33 {
> -	mbox-names = "tx", "rx", "rxdb";
> -	mboxes = <&mu1 0 1>,
> -		 <&mu1 1 1>,
> -		 <&mu1 3 1>;
> -	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> -	status = "okay";
> -};
> -
> -&eqos {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_eqos>;
> -	pinctrl-1 = <&pinctrl_eqos_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy1>;
> -	status = "okay";
> -
> -	mdio {
> -		compatible = "snps,dwmac-mdio";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy1: ethernet-phy@1 {
> -			reg = <1>;
> -			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&fec {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_fec>;
> -	pinctrl-1 = <&pinctrl_fec_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy2>;
> -	fsl,magic-packet;
> -	status = "okay";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy2: ethernet-phy@2 {
> -			reg = <2>;
> -			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&flexcan2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> -	phys = <&flexcan_phy>;
> -	status = "okay";
> -};
> -
> -&lpi2c1 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c1>;
> -	status = "okay";
> -
> -	wm8962: codec@1a {
> -		compatible = "wlf,wm8962";
> -		reg = <0x1a>;
> -		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> -		DCVDD-supply = <&reg_audio_pwr>;
> -		DBVDD-supply = <&reg_audio_pwr>;
> -		AVDD-supply = <&reg_audio_pwr>;
> -		CPVDD-supply = <&reg_audio_pwr>;
> -		MICVDD-supply = <&reg_audio_pwr>;
> -		PLLVDD-supply = <&reg_audio_pwr>;
> -		SPKVDD1-supply = <&reg_audio_pwr>;
> -		SPKVDD2-supply = <&reg_audio_pwr>;
> -		gpio-cfg = <
> -			0x0000 /* 0:Default */
> -			0x0000 /* 1:Default */
> -			0x0000 /* 2:FN_DMICCLK */
> -			0x0000 /* 3:Default */
> -			0x0000 /* 4:FN_DMICCDAT */
> -			0x0000 /* 5:Default */
> -		>;
> -	};
> -
> -	inertial-meter@6a {
> -		compatible = "st,lsm6dso";
> -		reg = <0x6a>;
> -	};
> -};
> -
> -&lpi2c2 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c2>;
> -	status = "okay";
> -
> -	pcal6524: gpio@22 {
> -		compatible = "nxp,pcal6524";
> -		reg = <0x22>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_pcal6524>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
> -	};
> -
> -	pmic@25 {
> -		compatible = "nxp,pca9451a";
> -		reg = <0x25>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> -
> -		regulators {
> -			buck1: BUCK1 {
> -				regulator-name = "BUCK1";
> -				regulator-min-microvolt = <610000>;
> -				regulator-max-microvolt = <950000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck2: BUCK2 {
> -				regulator-name = "BUCK2";
> -				regulator-min-microvolt = <600000>;
> -				regulator-max-microvolt = <670000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck4: BUCK4 {
> -				regulator-name = "BUCK4";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck5: BUCK5 {
> -				regulator-name = "BUCK5";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck6: BUCK6 {
> -				regulator-name = "BUCK6";
> -				regulator-min-microvolt = <1060000>;
> -				regulator-max-microvolt = <1140000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo1: LDO1 {
> -				regulator-name = "LDO1";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <1980000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo4: LDO4 {
> -				regulator-name = "LDO4";
> -				regulator-min-microvolt = <800000>;
> -				regulator-max-microvolt = <840000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo5: LDO5 {
> -				regulator-name = "LDO5";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -		};
> -	};
> -
> -	adp5585: io-expander@34 {
> -		compatible = "adi,adp5585-00", "adi,adp5585";
> -		reg = <0x34>;
> -		vdd-supply = <&buck4>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		gpio-reserved-ranges = <5 1>;
> -		#pwm-cells = <3>;
> -	};
> -};
> -
> -&lpi2c3 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c3>;
> -	status = "okay";
> -
> -	adp5585_isp: io-expander@34 {
> -		compatible = "adi,adp5585-01", "adi,adp5585";
> -		reg = <0x34>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#pwm-cells = <3>;
> -	};
> -
> -	ptn5110: tcpc@50 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x50>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec1_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec1_dr_sw: endpoint {
> -						remote-endpoint = <&usb1_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	ptn5110_2: tcpc@51 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x51>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec2_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec2_dr_sw: endpoint {
> -						remote-endpoint = <&usb2_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	pcf2131: rtc@53 {
> -		compatible = "nxp,pcf2131";
> -		reg = <0x53>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> -	};
> -};
> -
> -&lpuart1 { /* console */
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart1>;
> -	status = "okay";
> -};
> -
> -&lpuart5 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart5>;
> -	status = "okay";
> -
> -	bluetooth {
> -		compatible = "nxp,88w8987-bt";
> -	};
>  };
>
>  &micfil {
> @@ -564,12 +92,12 @@ &micfil {
>  	status = "okay";
>  };
>
> -&mu1 {
> -	status = "okay";
> -};
> -
> -&mu2 {
> -	status = "okay";
> +&pcal6524 {
> +	m2-pcm-level-shifter-hog {
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
>  };
>
>  &sai1 {
> @@ -583,76 +111,6 @@ &sai1 {
>  	status = "okay";
>  };
>
> -&sai3 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai3>;
> -	pinctrl-1 = <&pinctrl_sai3_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI3>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
> -&usbotg1 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb1_drd_sw: endpoint {
> -			remote-endpoint = <&typec1_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usbotg2 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb2_drd_sw: endpoint {
> -			remote-endpoint = <&typec2_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usdhc1 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc1>;
> -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
> -&usdhc2 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> -	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&reg_usdhc2_vmmc>;
> -	bus-width = <4>;
> -	status = "okay";
> -	no-mmc;
> -};
> -
>  &usdhc3 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>  	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> @@ -668,152 +126,7 @@ &usdhc3 {
>  	status = "okay";
>  };
>
> -&wdog3 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_wdog>;
> -	fsl,ext-reset-output;
> -	status = "okay";
> -};
> -
> -&xcvr {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_spdif>;
> -	pinctrl-1 = <&pinctrl_spdif_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
> -			 <&clk IMX93_CLK_AUDIO_XCVR>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
> -			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> -	assigned-clock-rates = <12288000>, <200000000>;
> -	status = "okay";
> -};
> -
>  &iomuxc {
> -	pinctrl_eqos: eqosgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
> -			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> -			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> -			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> -			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> -			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> -			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
> -			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> -			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> -			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
> -			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> -			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> -			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
> -			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> -		>;
> -	};
> -
> -	pinctrl_eqos_sleep: eqossleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
> -			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
> -			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> -			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> -			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> -			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> -			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
> -			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
> -			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
> -			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
> -			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
> -			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
> -			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
> -			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
> -		>;
> -	};
> -
> -	pinctrl_fec: fecgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
> -			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
> -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> -			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
> -			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
> -			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
> -			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
> -			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
> -			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
> -			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
> -			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
> -			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
> -			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
> -		>;
> -	};
> -
> -	pinctrl_fec_sleep: fecsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> -			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> -			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> -			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> -			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> -			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> -			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> -			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> -			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> -			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> -			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> -			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> -			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> -			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> -		>;
> -	};
> -
> -	pinctrl_flexcan2: flexcan2grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> -			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> -		>;
> -	};
> -
> -	pinctrl_uart1: uart1grp {
> -		fsl,pins = <
> -			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
> -			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
> -		>;
> -	};
> -
> -	pinctrl_uart5: uart5grp {
> -		fsl,pins = <
> -			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> -			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> -			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> -			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c1: lpi2c1grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> -			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c2: lpi2c2grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> -			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c3: lpi2c3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> -			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_pcal6524: pcal6524grp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> -		>;
> -	};
> -
>  	pinctrl_pdm: pdmgrp {
>  		fsl,pins = <
>  			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> @@ -848,160 +161,6 @@ MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
>  		>;
>  	};
>
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1: usdhc1grp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> -		>;
> -	};
> -
> -	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3: sai3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
> -			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
> -			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
> -			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
> -			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3_sleep: sai3sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
> -			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
> -			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
> -			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
> -			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
> -		>;
> -	};
> -
> -	pinctrl_spdif: spdifgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> -			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> -		>;
> -	};
> -
> -	pinctrl_spdif_sleep: spdifsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> -			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2: usdhc2grp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> -			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> -			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> -			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> -			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> -			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> -			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> -		>;
> -	};
> -
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc3: usdhc3grp {
>  		fsl,pins = <
> @@ -1054,10 +213,4 @@ pinctrl_usdhc3_wlan: usdhc3wlangrp {
>  			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
>  		>;
>  	};
> -
> -	pinctrl_wdog: wdoggrp {
> -		fsl,pins = <
> -			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> -		>;
> -	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> similarity index 79%
> copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> copy to arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> index acb160d3186c..ddde72e22fcb 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> @@ -1,17 +1,11 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2022,2026 NXP
>   */
>
> -/dts-v1/;
> -
>  #include <dt-bindings/usb/pd.h>
> -#include "imx93.dtsi"
>
>  / {
> -	model = "NXP i.MX93 11X11 EVK board";
> -	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> -
>  	aliases {
>  		ethernet0 = &fec;
>  		ethernet1 = &eqos;
> @@ -23,6 +17,7 @@ aliases {
>  		i2c2 = &lpi2c3;
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
>  		rtc0 = &bbnsm_rtc;
>  		serial0 = &lpuart1;
>  		serial1 = &lpuart2;
> @@ -113,15 +108,6 @@ reg_audio_pwr: regulator-audio-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_m2_pwr: regulator-m2-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "M.2-power";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -134,28 +120,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>
> -	reg_usdhc3_vmmc: regulator-usdhc3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "WLAN_EN";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_m2_pwr>;
> -		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> -		/*
> -		 * IW612 wifi chip needs more delay than other wifi chips to complete
> -		 * the host interface initialization after power up, otherwise the
> -		 * internal state of IW612 may be unstable, resulting in the failure of
> -		 * the SDIO3.0 switch voltage.
> -		 */
> -		startup-delay-us = <20000>;
> -		enable-active-high;
> -	};
> -
> -	usdhc3_pwrseq: usdhc3_pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> -	};
> -
>  	backlight_lvds: backlight-lvds {
>  		compatible = "pwm-backlight";
>  		pwms = <&adp5585 0 100000 0>;
> @@ -167,44 +131,6 @@ backlight_lvds: backlight-lvds {
>  		status = "disabled";
>  	};
>
> -	bt_sco_codec: bt-sco-codec {
> -		compatible = "linux,bt-sco";
> -		#sound-dai-cells = <1>;
> -	};
> -
> -	sound-bt-sco {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "bt-sco-audio";
> -		simple-audio-card,format = "dsp_a";
> -		simple-audio-card,bitclock-inversion;
> -		simple-audio-card,frame-master = <&btcpu>;
> -		simple-audio-card,bitclock-master = <&btcpu>;
> -
> -		btcpu: simple-audio-card,cpu {
> -			sound-dai = <&sai1>;
> -			dai-tdm-slot-num = <2>;
> -			dai-tdm-slot-width = <16>;
> -		};
> -
> -		simple-audio-card,codec {
> -			sound-dai = <&bt_sco_codec 1>;
> -		};
> -	};
> -
> -	sound-micfil {
> -		compatible = "fsl,imx-audio-card";
> -		model = "micfil-audio";
> -
> -		pri-dai-link {
> -			link-name = "micfil hifi";
> -			format = "i2s";
> -
> -			cpu {
> -				sound-dai = <&micfil>;
> -			};
> -		};
> -	};
> -
>  	sound-wm8962 {
>  		compatible = "fsl,imx-audio-wm8962";
>  		model = "wm8962-audio";
> @@ -356,12 +282,6 @@ pcal6524: gpio@22 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
>  	};
>
>  	pmic@25 {
> @@ -554,16 +474,6 @@ bluetooth {
>  	};
>  };
>
> -&micfil {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_pdm>;
> -	pinctrl-1 = <&pinctrl_pdm_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_PDM>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <49152000>;
> -	status = "okay";
> -};
> -
>  &mu1 {
>  	status = "okay";
>  };
> @@ -572,17 +482,6 @@ &mu2 {
>  	status = "okay";
>  };
>
> -&sai1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai1>;
> -	pinctrl-1 = <&pinctrl_sai1_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
>  &sai3 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_sai3>;
> @@ -653,21 +552,6 @@ &usdhc2 {
>  	no-mmc;
>  };
>
> -&usdhc3 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> -	mmc-pwrseq = <&usdhc3_pwrseq>;
> -	vmmc-supply = <&reg_usdhc3_vmmc>;
> -	bus-width = <4>;
> -	keep-power-in-suspend;
> -	non-removable;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
>  &wdog3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -814,40 +698,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
>  		>;
>  	};
>
> -	pinctrl_pdm: pdmgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm_sleep: pdmsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1: sai1grp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1_sleep: sai1sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> -			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> -			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> -			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> -		>;
> -	};
> -
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> @@ -1002,59 +852,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
>  		>;
>  	};
>
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> -		>;
> -	};
> -
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> --
> 2.37.1
>
