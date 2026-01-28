Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8786302176
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769581686; cv=fail; b=JiSB1uvW6NTSbdqWfubqj4+FzlvvRF4L8YvRGahLCirZgaebOLEfnjvWkg6cjuowlviZ1zoHm6Pdl/ZbScu96nmrrDAPe8c0Io5pcymxwSPrtiEaoTWDso8tPNqg35WM3hSViRmcoLftCzGuPEYpvfXrmJlmYi4MxRrtynAOdAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769581686; c=relaxed/simple;
	bh=5AEalZlyd2sOYVyH4pEOU/gBdh4LLs47jMUSRdxg9Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t5Y7CWyEN+Khg+7Zugbqemk86GH3u6qkIcQL0ri7ZuhsBHPebK0idiWXdo8o3QYtIPUMeGjSxiOIoaX3UultnllFUN91NbX3wd+AmzVqgzdyYD4R6tmcB4DzNVGdWlrv9K7/nbvRptDIJZhpJwg8DnPHvl427ZL1MlJi42q+bcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uT/SNCc5; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uT/SNCc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BO5cdnMzVqbvtvJGZ9Uosf4rn5kvLox4uVO00Cqsf92WlmpFFoDVYyiqPCK2ARZ/pKUdVW2yK4ZdKWIisKlgJXyfqecseASGCEBoX5X0A7PCi6vWYyjn82U2v8LRKYfLaZU8CFBOTeC9PXjXqrz5UmUQ3rxXxaW893U8UnG5XOlu8H8cq4Wtu6kWSiMEwGMNs8vXSXzIMi1e/F375lZ2AuSfwlJfuyoIdSCetXuQ6hIk3F9r75R9B2fSPRynmEdwApxnONTqhxdHIQH1IVuopgaLubP/FUlzqQxMK8Wb+9B0a1Y+9wwgI6rSNdzp8comq+FybNx3Be1IdNR025CSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRC7kFruF68+GL55KGebS4rRnp2hL9GgyutB3jkPPoc=;
 b=Izf3kPajV2Crg3Cl/9kc0z0pXKaaDd20CDkPc3Ee4mbwOoYrPli/gGkE0iaDhwc5SltIOlNTTBfgMaCPn7W/KAxuMrFKQvu53WHcRsGiG5JgomyUrSOsjTozAi4jZSIX+qCF9e+dKqc2rYIZJP2ijdCQpY9B7dUFUrha9CwS65eQ9uvgmVtF1jEUOA9gFlHhJveqZylOjdlyON04cAejNVAk8etSzP9HxtGtsNhJ5H1PF2HUlXwjSV0qromX2B7XYEj0dMMHkuU67sexBvWnjrQvm3Y8WHIav99qWq3mCE4nDTLuORjczBAISmodOSnrLouaiWMgjSW9OehtMJQigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRC7kFruF68+GL55KGebS4rRnp2hL9GgyutB3jkPPoc=;
 b=uT/SNCc53UQinfqo9NCyGR63d1nPD24lhd3IIcwYJzU8ZS3iX6wfjQASA+ak461udrQF4f/KT8JSGhpm8iM1U3n2SbSSMOMGvtpN5u5NWOpoYMHWBzVILO7O/h661/TM25di0xGx1inv3JfHuylc7nhGPWV0S80xD9qYCJY344/4K5RVV6uL9cBIlLWXZxDeo9fEkE+LvU/tCyhi96NkiphIoXtqTTMYje4C9pp5gzM0pxabFVb0HIgwXd0uYiFTr7/0koAN7eGctq/hX0UTzbFe/+Eq0ONhgz8+byYh/WjE1aX0hD+dIkZu0UTrWs2E4P7WhmHnzvJuZU7Q9VsnTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 06:28:00 +0000
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd]) by AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 06:28:00 +0000
Date: Wed, 28 Jan 2026 14:27:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aXmsbbt9T5ZRGtES@shlinux89>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128050549.3337279-1-onlywig@gmail.com>
 <20260128050549.3337279-2-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128050549.3337279-2-onlywig@gmail.com>
X-ClientProxiedBy: SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32)
 To AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8450:EE_|VI1PR04MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a1f14d-7154-4bc2-f099-08de5e3661d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|366016|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8x0bps2Q4002Nhpzg1hb0hFPcaWzxykECN8WeaDLJmX07j004SECjwHtKL4M?=
 =?us-ascii?Q?YO+41h/PeK4ALAs/orNwEMzgY7DXQJa74jzTbKMCFF5tMvTurFxEOjFtBAX7?=
 =?us-ascii?Q?Bnf/yU/jHt1KUqFMhsXN6gJxGoQytXt+iNHnZ58nNrKLnwtnw0g/Aw/w70UV?=
 =?us-ascii?Q?sXuenS8C7fziyhUnR5f2hpCDagAppzHtWu1reCw+c8kLn1YJya92lS58EeOC?=
 =?us-ascii?Q?cxIeD+CRBhioo/kMEUPD5XtRFwcG66T1d5yRdoa7Ks+rczO5TfLi2gqeiqaJ?=
 =?us-ascii?Q?fMoOouypfZAvGbYSIBRUoWKuEKMn9ZSeLxiy7xbf5s8o+0gfFlViOK1EkiFQ?=
 =?us-ascii?Q?FcGAplbPLs0ZtPXlw4PaCF41kNa8Jz+5T7w9QkyvVkPOrqgSHjSKEIFSOYlT?=
 =?us-ascii?Q?P/BXWyT+rYS/jJsoXYlNaWBpCNsNxh1MXSJnXB2T1a2D1uRqsJRjXPnidNjj?=
 =?us-ascii?Q?A48yysvjA9BxW2Ene5FhFDMDvmEPIJZERkN6YDQgAjL/rvZcSjroeEIkQPVf?=
 =?us-ascii?Q?OXMjaIE1vyrPQGXIIMI6z/WfivcfiAMTXspgtncQ2oomn//ALXy56D876SnN?=
 =?us-ascii?Q?mV4GCAHxZSGOb+N8tdQDu17v3o84UGgpx8Ml6+XvEZDZw3XRCvqfuizOel0p?=
 =?us-ascii?Q?DLFt3JhxEjX+gOEkX7AShBzNg0r/HbI5wkfbELoad79jCancN0Gp5bnUO7gX?=
 =?us-ascii?Q?4x432cACU9cNrk0KS2LGLQnZVQzc2rEm01p8+Yo5Dc9tVqrYa22GD+pzxJI6?=
 =?us-ascii?Q?hxkEmaCd4PMAGBYjrqqFyJBNGPhhEhLqgb9IdXoO02UfbxIFNMiKHutKqdze?=
 =?us-ascii?Q?XQ3bGdrBfuZBtTpK6+vEh/grruTQ6OURsQds8+3xN6Y8XoabQDze3j3P4H/5?=
 =?us-ascii?Q?CXNCp06utb5rS2SX33751KI9L5YDiniZqQF+pLmL+rEPlnjnRf2FNctJtVhj?=
 =?us-ascii?Q?C4+XE1OTLgFCyUG1WUwW5JKP779hfil2+b1LBvB+fzaDO2+G4v3V08CFscip?=
 =?us-ascii?Q?qpeTG+CSE0RPLL3c19upiFykj9HLfXSiPlhrdTQEsbTQwiFGUjKowAdEoAqQ?=
 =?us-ascii?Q?1bk8wqZCeOaZ+L4RIQQ0svlhjlZHMACInDh6jVfogtk9M8YRy4PTNMSy7s8G?=
 =?us-ascii?Q?qzqLvmovpQaExkue9j3FCJDVYaOEdusjYtbk/67umYDoSZ405wusg7q/CJuA?=
 =?us-ascii?Q?MaeqHPq4dkOZH5iMBhpSOSeejad8UhsMna9W85L5bNiBtgnPLS9sQbr73dHC?=
 =?us-ascii?Q?RQmb51dujXkGyNyIyaYfdJejeqk3o5rTkrSIQtST0OTwAnoK/7Q0jBoa3EeD?=
 =?us-ascii?Q?04faR8FCjFv+UzBssUQ1j+JtEzSF3e/l+T3GowoJ2smzR0M/XdmZv9xw/klz?=
 =?us-ascii?Q?Hp7QlBU9roW6KnhNH0GP3+r1AAjc3TNJv5JBdGSJnUhSKF3oi+bKTWHYkwLK?=
 =?us-ascii?Q?oSJAsxB8bm6ZydxQR6JK9Sep8puWR60zWIqpoa6fwkUhtJC15/bfmxI2SDl/?=
 =?us-ascii?Q?K9l+idfK0YyvvzBFbmTaOXvPfZahvMiw7BhTJQ902iZ7zSnURzfVx2iTvnya?=
 =?us-ascii?Q?q9FKtK3Wk5clgrVMMMex+N9qf18eiU60c++cG/v2in/vwnWMrzupO+in90oi?=
 =?us-ascii?Q?X2zz3Jniltn1vqRpRT5tbDk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8450.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(366016)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2MdT6vtiZ5SJN9A7gnyCoAd6RM0wRL3pwNMEpNdl92loewV423LaJn4r9NN?=
 =?us-ascii?Q?ddKiQqjPDaR84VQbDLq+Jc3SVn0bri8/NHmDHQGHwJUd8dfD0YmhIarRJZ1Z?=
 =?us-ascii?Q?0tZs3HlEyNSOc9220aVa4yXMJ6GGfK+GuNZK4oyfi2NCV7i97DfC/pJCfxCF?=
 =?us-ascii?Q?CD+W0Y+xcybGm9G3H8Fzvlf2D/R+jQN+f2BVLOR+R6wkspdk34rTpNqE9l/V?=
 =?us-ascii?Q?dhl2f7flkbN36oLdipk8HeL8U8w9X8XKIcKLGLGj/vDrCwDA5rclwgpZpwWp?=
 =?us-ascii?Q?0ToxD9Co6Cx9pc6nq/GXpyNLMl3Hy6urlqi1NpAqmZRFQ1A/LvJ1YXfu+zEw?=
 =?us-ascii?Q?DpQV7HYdhQq1Z6A8IFh81lmF7BYFyl01e3lzjdVIlZ/i554vxqZECoLmCAQW?=
 =?us-ascii?Q?cYs+2lIOYGA5QAp5Tvhl1f3WSIJoDv7f/TvGRZ3DfNCGCecW+w8QTNlstsaq?=
 =?us-ascii?Q?GhHxyCHfqrd1eDgUeeu0X3lXuFUhyqU4AqSjpZ/r1b2t+8KKGqUONRaB/EDL?=
 =?us-ascii?Q?pUN38Uf2S8cMfab6Z9pWlERQjKAj7ZdteFgxFYFI2z7LmcoqhhHsYUjonUbL?=
 =?us-ascii?Q?Ujw/8kf4PxpfdQzaqquVw+cLcJqi2azBg9vet2PG3yqMAM8lDzXSLULJ8I8I?=
 =?us-ascii?Q?HmXgVEmUomGP+1oc1WjZPFk4J3WtxYv5rESIlgfmrU33afZ7FE+Sm+nd2w+h?=
 =?us-ascii?Q?fZQ5DutG/JrSUukk84w991qaj0SL6HGK4a1ar7Fjo0kD/Amw9WPyLGYAVzy/?=
 =?us-ascii?Q?/wDq7v+yL3tK0W89jMz2La40DjCFHNOcz4XWoQOnMzpfJDNJ3y35VuRAO8/Z?=
 =?us-ascii?Q?gbfsfaBUkpqPmLRRUsdUuR6uAmUL0zXcoECmZaKI+dIeIgmcXp/M3206sVat?=
 =?us-ascii?Q?voOCyX6G8azeJ0kdFsC/T/Ki0diHW/lwsjUEEGlY75lhgABkvbgRxJkAsPiw?=
 =?us-ascii?Q?d2DVsmmrVoIsuyTZvb8GUpiITz13rwGElFVNFKTnlydjoUe0zEPK5WuVyo0y?=
 =?us-ascii?Q?hclkQxiKUtaOSZ1WM83ZShpB2on9sm5HMUU+fh0WaEQYBqCxB0QV1L67mVYz?=
 =?us-ascii?Q?9vLq4gsOU7ubsljseanuvI8cSv4KO6JL9N4CTWtSfR9vToEHGQ0ZzyGW9o4E?=
 =?us-ascii?Q?zUeWeyk0V3mc4fo52JBTAKA7NGIJWGItRGxINnMUM9Mctf+S9F9qVeLutd+5?=
 =?us-ascii?Q?4dMB5HrhTxJW0vFtqKE2r49mVe7dAuh27qGlwX4sYOtGCd+ZVbbWP2Zfy0Xf?=
 =?us-ascii?Q?XRB1TWCblX6w1wNYYkqHtoXfqugvoQ/qyvobMpuJRVKuQvgXq6dphB8jEPph?=
 =?us-ascii?Q?r/HJKfko+be07A0N6zd1FNCrIcJBuqIYAc7/RO+hk/yq5EkGv5iMSk0QQLym?=
 =?us-ascii?Q?HpXWII5ekDteQLzoEAKrBc3BUPG3COaKi0QxYE7QLPjrL2VMNzJFrgwG72oM?=
 =?us-ascii?Q?U3X7bs4kYTintObZIpr9e0nVeaKqYuMH5Qhz1V0NKAMd04ZJAFH18F3j7Qxa?=
 =?us-ascii?Q?q0q0Mr0EWKVF1Is2ORBYmVv3nsPVCPcxU1di9aqE40o6myHH8T2TCXVmQzHj?=
 =?us-ascii?Q?yVfB9A4deedrdFug7zQlE4RdIBEXnZxdAqD8eMf00dEe1lFzY/f0r0q1dItA?=
 =?us-ascii?Q?DqsotdYsH1J8alZKHLVvA5ihliWMB6pVZmt7UjRmgzQ0LJrdfKBxzo8dhvwv?=
 =?us-ascii?Q?LpvXNOxMJ8hJZgwWMxIrBUVToWlWrdB9QR3kk4xbTogLj2xnGGaD3DWJ7N7p?=
 =?us-ascii?Q?neUtWx5nKQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a1f14d-7154-4bc2-f099-08de5e3661d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 06:28:00.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADiNARiFfbUsNEprb52NKG/bH3PCHyZLMZRPD5Okx6M333BOEDypXchD1jSg2SadzfA53dCPS/PrnYRGQGSlBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On Wed, Jan 28, 2026 at 01:05:49PM +0800, Wig Cheng wrote:
>Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
>
>Signed-off-by: Wig Cheng <onlywig@gmail.com>
>---
> arch/arm64/boot/dts/freescale/Makefile        |  4 ++
> .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
> 2 files changed, 55 insertions(+)
> create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>
>diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>index ce8f937c2315..c2727f8061e2 100644
>--- a/arch/arm64/boot/dts/freescale/Makefile
>+++ b/arch/arm64/boot/dts/freescale/Makefile
>@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
> 
> dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>+
>+imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
>+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
>+
> dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>new file mode 100644
>index 000000000000..1111503b08af
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>@@ -0,0 +1,51 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
>+ * support on NXP FRDM i.MX 93 Development Board
>+ *
>+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
>+ */
>+
>+#include <dt-bindings/gpio/gpio.h>
>+#include "imx93-pinfunc.h"
>+
>+/dts-v1/;
>+/plugin/;
>+
>+&iomuxc {
>+	pinctrl_lpspi3: lpspi3grp {
>+		fsl,pins = <
>+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
>+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
>+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
>+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
>+		>;
>+	};
>+
>+	pinctrl_epd_ctrl: epdctrlgrp {
>+		fsl,pins = <
>+			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
>+			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
>+			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
>+		>;
>+	};
>+};
>+
>+&lpspi3 {
>+	#address-cells = <1>;
>+	#size-cells = <0>;

The above two properties are in imx93_91_common.dtsi lpspi3 node, no need to
duplicate them.

Regards
Peng

>+	pinctrl-names = "default";
>+	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
>+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
>+	fsl,spi-num-chipselects = <1>;
>+	status = "okay";
>+
>+	display@0 {
>+		compatible = "mayqueen,pixpaper";
>+		reg = <0>;
>+		spi-max-frequency = <5000000>;
>+		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
>+		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>+		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
>+	};
>+};
>-- 
>2.43.0
>
