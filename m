Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4673A6F07
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555743; cv=fail; b=K+KzzTi0nfN+S4YEB2/riSI7raUbSPLKFtdf1lHTt8NjTgV2PRW0KjjpoYLZ6dEdW6KqwgnAQ/Kh4AdKC+pSU7O5R6mcKV7o7CuJE5N4rVUewAV2IZD4h2YKpCVK9u1JS9RWn9/ndhLAVpV4Nz0s44STPbrAEmT82CewRAiOPic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555743; c=relaxed/simple;
	bh=y3gKNd/074k9SuXSsHhGPz3gG6NSpw1RdgWm0JDX2hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iDDE1OhAVoET4cmr8yovFMVEtSgk6CbzuUmfT0vVWoV1uBgZlf3i52jk/mLmopKt4PVbNLE3Ld+sx31pqxNHH4Sdkc6dVAPb0OOJs8mVvZ4RPP6vtXsOPFX2Tf9br5CIJJkhIOwvLZyoHdx/ZKCDQJzOOvHvN2d7R6GBThNAqPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KTHCxYyT; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KTHCxYyT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnSfshEv5+bFkb0cqNPIZbHZAgcCXT6ueIbgVT02cQVZzh2F2HqiRIM2xAkTUC3gGKOKagDuXg+4dsyCu7USoj9jIPp+IzwS8q+7ce/eLLs+BNo7fXok8fZjHJdDxh7ZDF5M0PTSxQU3OiwyawG7830e1iD1Ss99a5/SPLOQ80/9D4AE+s7wEdHeg694FziEs76Gl8bo8ocdwfIiwEqZrK54R/BZ8lccIvb9U0FvRFJyfezdyZWIi4uGVHVTGT2Zy0Lp3LOzQ76b9HN2af+tYWD/C4ofg/xcbttsEHZhObfU9Oi4mSr8C6FVFfU0C17DIzF5TJj3h0ARcmz3AXjvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJT+mls4v7dDNQU0UICdHK6/Tkatz8PmGmFnIU2ChEI=;
 b=bI+czcs/GetkAdet2Ffteh5egcOUicQa4ZpvzxnyZ0qO6ouiX2WXvlU8cLjMaXxcAvfZiFWzta7Pztte0R0sA2zBlmUtzHdS0B4ULO4Unz+lLzzTRLn9iUDP/F4/QXuXXkaTBLCBQPhJwcvedyi2Z/GjfUwhE+/HvmIpYSOmTgHGSstR1YF32vNTIosZ7riZkXblTAjFj8YXJ4Bm2TNUaHsidAhKd1J93zo/sgJnSpZWy9k+E99hb2lXbAzCbLvbvqYe7iEF95OXKVarLo7y+Zwl2bVRVZ9jb/fCsY5Xtg/LZftGE6+s3t0OlpDjqw+icPKy6z39wNuwMB6aifOZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJT+mls4v7dDNQU0UICdHK6/Tkatz8PmGmFnIU2ChEI=;
 b=KTHCxYyT3gH4BeV1GFepPZOIswUx5OcyCthT2SgQDUGkXklH3I+vqKrDfHuxQEU4ex3c0cUNhyRFgR9uR5v50SkB7Ypt0n+EmBXA8tiuASGC3OZ9kY5IWmOpxb2dE7z0KInba6aj/+KzyLikIrqA164P/VBoL9hAhdV78Fd5sBPKm2cK5eHmrSsCDtMBjzVT3UoPbe+7m+/mrBpsB+zcXRU54xDJlrHO6XtiVX9W4qi9mK1kiuz54Q7OVQOnlycLMMXcrwipNnsPZT6pnpgfemtNeaco/aojAEbuoIo/wL2/YPk4Os5Z3HqSZM5ZEgIT/zJzf+9Z6S0KNPzOIjVTxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11231.eurprd04.prod.outlook.com (2603:10a6:10:5c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 09:55:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 09:55:37 +0000
Date: Tue, 7 Apr 2026 05:55:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
Message-ID: <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
X-ClientProxiedBy: PH7P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11231:EE_
X-MS-Office365-Filtering-Correlation-Id: c06d6c36-2df7-4e53-e04a-08de948bd16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	iL+i1rqceJf4ckJCY9u2yR4+v3GMZ5/PtbG73mR4+h02xcSKXTgh6dAmlJn0/cJdvZYMRzuZfx0z+UjojOBwAjw3Fiwj7jevG4mBifiiLLf84vaHEYJEeT/9580Bt0DyS/ruKNF0s2PWNeooD2YdtXTLac7WkcrLfQuo8JSMh166Kfs2uWm54JziKufdphbGFyF1xJW8t5Q4/gZjofOT2DmadtETVm7xLoz4YyeTQK8fIYybJfNp/EKxCt2g7p9suGlrY6pGgiVsIp+hNn/QaR7J1mGmWLxT2qalWP3Ry/SOYhfQtXXidxljRwpIxULKBto62aCRv4j9JgUPUohYo/u2BdrlZ9t+Y2VUczBMtgOoYkho760t5ohUepvo7LbstmY5YaAUA7ZdPoJN43mBYhCSZMXSEz0y1Ke/bUdT9iIC8Q7NuLkiXGAl5WqCYbgVLOYUqkwZAxGSZ2mu41/L+PDcJ8NGmlMJo2roQpmZE4Uj4CN1QVyYBPPLvMzsJ0Mw5FxuzNSkIkMF2HHeLtPPhVUWTrE0vWT7NhISO/roQew6TLTT6HuaMTBo3FP1FeWfdSJQqiH+hb7L+sy1apeTsn+yeTJCsehL/i4D/6pPdxJ5/WygVi5ayfOp+QnvwCCM3wPvhOF2YhV5aF1E1pr+6b3BD8wbX5WbtX0CcQa7C1MhEUeP63qZA2nVt3bmkb1wssNF8sZu3R/7Ab9YYy8H1l2ocKQL87IFMGmV4YuuReL6+rjRHoGdyNZT/GYN0yIxpYHDWaF6JQx3C6OF1oB7ugBX1cItT2RhzO0WXeFRYq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xAvl2WtkUTrIi/0e8NgTVUQmaZxSJ0Ghy6n2NYHp26G42GjF63rP46Rsp0Dr?=
 =?us-ascii?Q?e83tT6C21kpUe8iBa/lygGzeAoDFvKCeTPxJNwmsFWeX8zZvn8FsEky4cQJm?=
 =?us-ascii?Q?rkBbhP1TRN16essViqXDRTBXmNUJYC7+YBKq0c1TwOUD2JGghG6FmAmadiJs?=
 =?us-ascii?Q?Xu/y479wih9mrsY+ooNugWHNaHJhdS+HdTxz2B6l7x17UIUJbCnefraVQ02d?=
 =?us-ascii?Q?4HBRMzFQJsvtBq2n5UaXFuw5HVMpTboG97mDCsnXM9/G++el2YiHOEtGBUNA?=
 =?us-ascii?Q?8NhQqa5hvH7KdKXYnAjlDs+QmlhZw9dO8wC9Lbjfn77g/hf7mSgNlAdvAfGr?=
 =?us-ascii?Q?wGWKakjq/zjgCOPWBSAdNSMOJaUTAJfPIg8uGZ5DngKo4Ph3a4m33OjOfbJk?=
 =?us-ascii?Q?hg++YU5YfRHer2m4SqLW1tM2HvuxPH4LK+ETi+UoyYbYgxBdL9TYFQdGQ7BV?=
 =?us-ascii?Q?OHZjTZ0L41o4X1ZX5QnhM12dUS9S+YTGegcomw+sN/x5mtMD6tF5PgL4oSCy?=
 =?us-ascii?Q?IZkpQCvK0Kvzd0duQwdlrudfKIFBCmBA3u2VJdSMvCKFVblz+992xcBR5yw/?=
 =?us-ascii?Q?jtyX2qblNws8mGYqb1bvbFasHNG5TtUGIC6llScA8KqGmv7U8tI/BMMyf4yy?=
 =?us-ascii?Q?EmnJJELPXjW0YR06VojnWqjBXpeiAu5BkAywb8NNdVdKCjAZ4vdY+mHlf0jr?=
 =?us-ascii?Q?NqKFGvqhCaNOY+6WFidU2H901JE4m33YYoMF7wLQNoZufNMIpq2iMqj2HvES?=
 =?us-ascii?Q?G7BBRzzguRqXTBoxC9oH3tWYriaiUXXq2Ya74ElWDNnvzm0tmkNVvWy4dG4R?=
 =?us-ascii?Q?pBjY6ppW5lulDrp8oKBn4Txy4d3iJJezuSO7ozL2pOIzZW6W6KBiHjoF42Lx?=
 =?us-ascii?Q?XOFmQtiPocgcpMzwCALvvwKQMrudbumCNL4kmA54Ja1n+ieicP7V+qLybRWn?=
 =?us-ascii?Q?PUBMnRH4zCNazjaRlyOp4ZhYB1Tr31bj+qno9IYcBWBuQBc21m6oFlqLEQNe?=
 =?us-ascii?Q?XcC6BTJrEizIZ+BsZrbhrW5dzTkcg2/mmkj175xYfKh9Jht75OaWQrJ+d7h6?=
 =?us-ascii?Q?O0K7wdnTMofs79whLKzacuaweU88lnxea5zuuSYAyKJbJtPxKpMgiAPxDfxx?=
 =?us-ascii?Q?4joRKbuOlHT+6QnJ16bgwkiAs3S9gnKQCj7uV80daPLE81RX6hWh3Ah3NJlN?=
 =?us-ascii?Q?WDfapW+r+hsZ7hQ9HtnDF/7FmqEeNIBQ5E2ykGLhq4yMzWbxvgSzgfG/kciv?=
 =?us-ascii?Q?Mz26Z5aB58//pbS/cuOUq4QQbxzCPFUlU3p0IA0EZ4U+lNkj4Z9vfwCLincC?=
 =?us-ascii?Q?vIHA/DoydGy5o61y9GqTYYNDsIL15D6MOxb5AOdgl2SZ61l41VmYr/QvDVQ3?=
 =?us-ascii?Q?lEuvTs5+1M7209TiP0lrniKQxx3rcPME9hn7NeG0l96OOdOGR1yE36K9BQCk?=
 =?us-ascii?Q?kNoXcyyXXdjvoAwA36oqS62azRaVdgJ7z6bTwCsQSVjQO9X1kOVf5AUBUFYZ?=
 =?us-ascii?Q?OXr4QwY+lgOXE1JoH9DCiyvagAVzK6JtS9QXm1Oq/uC77uKaHAXkn+yFVmCO?=
 =?us-ascii?Q?0viAM9JfUOpsFUa5sfXt3fVcv+gQtn2srckPjey6NwZTEzf2QyoqYPamWp2t?=
 =?us-ascii?Q?UecPnLq/3D4QJ4eWqxW8wYzw9PV4qyM7tZCNZF6AadvBfapdmdI8aOaTvA9E?=
 =?us-ascii?Q?AzHZvRXY+6E11N88P8AaT0l104UJ2+uN/FbszyprHjvjV70C+uJe0acsOW/S?=
 =?us-ascii?Q?F1FEoielyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06d6c36-2df7-4e53-e04a-08de948bd16b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 09:55:36.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAYdqI6OL2KzBxkeHfv5K0kvuO6vlFzO6bP4rfHE3mPfOeNRxHcDll3d8Z6DvILzTIPxdsJdG9gZTRJ4hLE6ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11231

On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
>
> The panel connects with the QSB board through an adapter board[1]
> designed by NXP.
>
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------

Can you add some description about raname in commit message?
Use -C option to create patch.

...
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> new file mode 100644
> index 000000000000..c233797ec28c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
> +
> +&{/} {
> +	panel {
> +		compatible = "tianma,tm050rdh03";
> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> +	};
> +};

Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file

to imx93-9x9-qsb.dtb, so needn't create dtsi.

Frank
>
> ---
> base-commit: 816f193dd0d95246f208590924dd962b192def78
> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
>
> Best regards,
> --
> Liu Ying <victor.liu@nxp.com>
>
