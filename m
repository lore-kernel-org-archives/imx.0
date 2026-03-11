Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835435DA5A
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245995; cv=fail; b=cot0lTHFMzTfwe2EJ3cMahaVYL1y2/cgJ5kIbCK24Jv+jdrDN0ApqDBgf+YLgkn9Da1E7IffYLWwUNYhtQx4gy59cRaoCwMcdj2n+Q//iWBRzOul67SqCE/iiacNqgDogRtJ+SpSVYcY8cDViFdSk4gkcGe9vBCw7zlqqP0tNUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245995; c=relaxed/simple;
	bh=CmOBYFs4a0pqX6M+c7RAUAPKMS1A89Ql/UavzPergeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=snWNMux5SYBSC7H69q8Mf5bRUDOBCAjetZZUy2wJCjzcZQeVu9srpZscNW/Ts1CKJZYKbisr9CCAW2Wfgw1agOJmJpIkATpwY3nQvIAGLMdTAWVeBz31qLhDBK6krDOI5QfmDPZJjoJnZUE6iIosrxRJBR/4Inl6WicxJMgwSqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QISyah/a; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QISyah/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glmVxyew62hcMoQfJPq70ASsPCURnkki2oflIdqv0qTuToUHK0k6voFmZOo98Pus7nxs5QrPUGllsj2CUEgD7RqUoecgy3cXMjWNV1panBnWnmdV/XXoqamwrmQhtmThtM12Oc33Q6AThqh/4MYkZqekhJXF2cIUiz3afi11B8ul8EUWR0VoZVsXFtgFL2ZPXDgKdL9MkYtPt62p5tV+HY3lYGy2e1gaXtEGVEhfNU1J5j4JAqiK9gDzdvyUy/DFxsV45W8s9XRiSImA76ebjNm3lUk4Scc+POm6IG4YdXPQr8zGUnol+bCidu4RHGc0AZchc8lGPgaBSJqK1Wm0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHGNwbB6jklM5qwCmmzqnVQp1zPdvBoq5wsyJcjulc0=;
 b=gAlgptqsMsORoD2knYJTkqK2Rwt/VsMlqLbB45PYH+xVU3oQPC21x1EjX+n4RPsF2LL5UR0VAD+oIAuQf1pMBXMvRHpNpHnozxPZlNx+EoARhZp35SFhFV328mSZT4uNhqejLvDP+zAUp3qRw3Yx56TiIR5nt+cbIW6YYCmJu2dzj8OTmfoaE8Ug/h5WrQEriW97CrJlnUQFHcNpLuW+XuQSwQEPHtsksiktYIUpZ/7Va9DWUZy744HniO8ZsawSVSgSQ0Csx+F9M/XeGlWF/4yc/XXVS1eNL63flUkju7WSAyeEy6Sxsc1M+DZSft6Nv3i7aSP9vHoVfjz2cL3/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHGNwbB6jklM5qwCmmzqnVQp1zPdvBoq5wsyJcjulc0=;
 b=QISyah/aS3XfQTYZfkWu84rDKZK+ZIDQIt92VE8RIf6Ma59dTfNoZ+YXAkq7z0XlXu/6QHKjc2/KoCFPlu6hRM6zDGMPOA7QWWb89LOzMvWY8TW0Ujx2WWUhK6gA0AtIT8OjX85rumG6YVvTiDWYwx1bwTsfZyiSB9qCsJmEizRtpqPn6Cr8OZ6Mqy3kKtP/e9oo5UMhW/kCiiHCbvkVZm4D1J0V9Cbdvikcv88JgBEIgdl4aR+h0ua1Pdr8e+13eswpz1kGZ9I/89Tb+ysXotVvp5nBx/pM4OrkHqaCETUp+Bx9X86CR5aSBtHHHGFtXtvby8smDEdY8iTat7bmTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10126.eurprd04.prod.outlook.com (2603:10a6:150:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 16:19:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 16:19:43 +0000
Date: Wed, 11 Mar 2026 12:19:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01:
 Remove compatible from overlay
Message-ID: <abGWGel76qoy20cI@lizhi-Precision-Tower-5810>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1P222CA0131.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10126:EE_
X-MS-Office365-Filtering-Correlation-Id: 03412ef7-2a73-4ad8-7046-08de7f8a00ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n4gPoRCtlLpo4I43UVpN+IL7M2yB5h8GWvPD6/UNlK92p95Uc6EcDGjoxH86WUH0u2BZN0m4Wevn41Vn4Uw097xWJL5+eXZBl9jxX9+kZITIzA8alOu4h/bTT7CzRvScQ7qRAZQDg5dSGPuQKqCOXJUWZBUUKLUUUI5Up23PpEYrUf06ZC+hON2x4nGTn7P42VT0ChgndveqB+2Q3Gf2Gyw4HUxbYQxb+ZCIib5B1i8vUpVKoB/XmTnqnyaBMDQQXjfvIzt8y4YicM9NX9fZxQoqoqQxmVGW2Ac8bS149/g/j0I7TS3wl5l0mmXFDUYOEuRCUZKGBu++2ywFIFcSdIvsNpj+Yih94Oy+N7ZlJV5WtTxSOjaHTfBY/hs/C7axVQKlwQ8vkri7e8WVZyh6uDH8LDVG4YNWD4rNFeGBhWO52Ch8mDN50g+QrTVpqIu+gix9fzbEgl0INRoBzzkbotiC6xNPt59W94ZI4ZxavYrLvPKsLh0Wkpw5rEWPhcg6JpgCWh66eLzA+ISztiCS7RfxM/6rawirg5GzezoSiQh4phnMkoJ13XgQq1TzjtdbMuhYO6+7HzS26cmI+HVnQNCK6D3OjutTL0+joHi3kEW9ab3OYu4oPsVh7MYtlMrQ6MR8I48xrkCpFWNH5k323iYnLb8a90MVqZU5jnTICv3pbS7MNOgCQ9OumSF8NlomtxTyISHz3aHJCNomSDrf6YlsDtTgJCe81m+UHwEqizk1bZw/pmwT8/rhOGoGFpv9wGpGePG6g2FAP1sGJo44xJfpfQayqwkhbDRPHn/5GWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?24UqND4xnNc5+ZUtkaNkU7SIJRRqmj8magsswdNlgyTz4bGHd6EFFCUZHab4?=
 =?us-ascii?Q?r2EUMihfNyTfttcxKL9OURTjqt2GACO5+op8ChUnQWN/9SUjwn64I00nYFzl?=
 =?us-ascii?Q?TjHvzb5TPzGZKfOmXF7xuXrOPJSoSXsTZLQIbx7GNxV85otV+2Fq0sU1LNwq?=
 =?us-ascii?Q?pgG5xAEIl1kF9ZIUlbhEUynuNPI4XGvnCxgZN+s+pIgt02aerwj2jscpRywQ?=
 =?us-ascii?Q?NkHkWvFkYMUnGU+K3eLwc2YI0S2Jn7yCFPPEuVbvjDBw36o32aDsSLAtJpj1?=
 =?us-ascii?Q?SHyLX61523FtkgigYLFi/Q4ANS3DbWmvs4kaJYea2OwKz0wY7pt1C2Z5uxl8?=
 =?us-ascii?Q?43SR0KsylGleORQC+niheOp2sVzZyXiSETOUd8rdZ4mtyh6iXfapOMIqobpO?=
 =?us-ascii?Q?z6h0MO8JT08Fn5yb3iuyio8Uipm52W1tiGsF9fK2tbaody9plmU9kbeWnCYD?=
 =?us-ascii?Q?lXyuaPEZqEgnPNHD0sfNp9VFY4rq5AUw7rxb1IRtENSEWueTLMupjK3kPuQ6?=
 =?us-ascii?Q?B671QKFffddOmcjPB/ho9ZtkVA90xbr25yTLLXKpYMaeGnxTNokkE2cWTpnd?=
 =?us-ascii?Q?f+xWAI/L+iIKyc+o95xT4rfMiA6TaxUposxuISCK1tikmhZxSwQjodfgnPsA?=
 =?us-ascii?Q?KtJdlWLg0+oiN2YNBjHPSD4l8H7flg3XPE9r7gD5VyYglQoyMGxw2vvtYcpi?=
 =?us-ascii?Q?vMa6kza7E2rrz7+x0v79Aq5tpxa8yg95qfLCTERGr45fX8+GULxP/ky7kyos?=
 =?us-ascii?Q?z1JRXazXQdqIiJTYJlSaoMwTiFN8LLlTkU9SUEabe4DNwLAFBvOCr3L42mdR?=
 =?us-ascii?Q?o8HeDfJ1JgwXtg/d7EAO3aXdsc/2aDq/N7pBg/AO8ddMaSbwyUMtAIy+jqgR?=
 =?us-ascii?Q?G1fM4KCKMyiKZ9U3yO4aRCe4HNMc3HGGNWCUWL0gycRR0qaOjLJGbriQcmbs?=
 =?us-ascii?Q?8Z9MLYtDME51ZBEHHFUvspPHTbrLlKT2dqvZZF69yUpVru3AOmp0K13Ni8bV?=
 =?us-ascii?Q?fNG/PDBxdDGaXQsf2idgOThCluXxF6NMmMw36Nk9ymFHr7uJEmt7DMRabtfc?=
 =?us-ascii?Q?YIMqbLdDHqpX46Udov7zG3lzZRaLJLb0XqdeanDkwZwY7MmVC11E3e57ePIq?=
 =?us-ascii?Q?yThvp5W9k1ANl/xwL1QcvHAex1dcKSkJYingxvpkfV0wQN3BSA8rjv4scp2J?=
 =?us-ascii?Q?eCK0kdEXlktZ6Ny7tuWU3qp4O68Umsf5SI0GNTWZ3AGEtKpvhxlxQ80n7W4p?=
 =?us-ascii?Q?bAK1YgfuZO6AHb54MhzjJvfzmNAguf12RI+Ck0UVATyTqzgKSJZM4YTZ0DFJ?=
 =?us-ascii?Q?1L53NB1wTIf/l7R2qK4kDB8oDao4jy7+lJXGPr2XjZTa1f1H2/w8TMb6VVdu?=
 =?us-ascii?Q?MZWbPu8b+g5BUxNTdmVvcO3vS1fPRxDDw5/tQEZisGHq1lpzqFrNxm8WtFiZ?=
 =?us-ascii?Q?WGohnCk+R/dyPRSvn3e0pp85JBkeVvht261bOS/lfIiPbNvcGKOCo+ZNplz1?=
 =?us-ascii?Q?FHOizYwDHkI2VekzSYuEd0awod2ZOG1jf3wuiAv9k+9Vl7wZ5SvX0iA5J2cd?=
 =?us-ascii?Q?fNQirOVcX+5FYcjvM9afCoW4vV6mjmWLxe16YL9E4bGokClh7zqT8cZ9Fb2g?=
 =?us-ascii?Q?zhYMsme/sVnorsLdA+AK2I1qllss91WdqRhlWysZqsaV3WWKV8DRITsvZ81B?=
 =?us-ascii?Q?uoly0/8g+bQYfKOwk56GPNA68qIkK1IuTfQFpVNLH25tIkE8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03412ef7-2a73-4ad8-7046-08de7f8a00ee
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 16:19:43.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk2JQ7/CFzwTLWJ/gcRWZmtZMw+dbZHYw7DouSqwUj4Xdn983b7EdHtuza/mtvxz+fa7qq6qnG+XdiIHLvSuIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10126

On Wed, Mar 11, 2026 at 03:52:15PM +0100, Alexander Stein wrote:
> There is no reason to override the board compatible in a an overlay,
> remove it. While at it, update the copyright year.

Any bad things happen if overwrite in overlay file?

Frank

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> index 5058cd9409c75..129b02a69ccf0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>  /*
> - * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
>   * D-82229 Seefeld, Germany.
>   * Author: Alexander Stein
>   */
> @@ -10,10 +10,6 @@
>
>  #include <dt-bindings/clock/imx8mp-clock.h>
>
> -&{/} {
> -	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
> -};
> -
>  &backlight_lvds {
>  	status = "okay";
>  };
> --
> 2.43.0
>
