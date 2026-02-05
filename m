Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55534CFBE
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303434; cv=fail; b=afSiLMJSlWaOwRaLYZwegTJ0rjvIT+gEzZBXHOYZGr10c7ZPzw0weFc7sVXaYTvFdO0hiRIEVzwa8yjXmmzgZJEnUtlzf6A9gP4yrlAmUqSweWsXsdOsHoJcXZImfj94czcQyLO8LcHseavt5K7p/6oglr0+EQDehRiSfx10fvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303434; c=relaxed/simple;
	bh=IYVkDkLWcx/XZoN8TdQ7KbURGnjL/ni2HwB+MiMqwvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sjJlQ6lFPnLNXq22p6/cJOsuT5R+gE5H2QiJVolmFQF02Sy3y5ptCnPt7l3DnpIi8PF+1ORz2CYufMCYV9ZmVMFsC3nHU3IpWGf9WTTyQvJjpQyXl4AQWtFwBhfSNexpmGa17CVTqejnitVCW+0iikE/OReVO+ORaOhuRAmdY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i5u9YLbz; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i5u9YLbz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3cKIcNjTx3mTD75/JRHsC+NGE+CpzdzeJqgQUOR6Zlh6Uca6NelAhtFayFaDAKfB1g0xFhOwQB0g4xAyzNGDO5r8Fc7r+v2GKb8TgdA8pxRHVRVNRPdx2oVnzhuG1fhvN5lIUjX3E6bOAB0G7mRzmrwxS3/QIP75KSsI9AbvYg/U3+/2xJ/+gbEllT52nYc1opGsSW+T9HBxydXpcAg/YMCa38u2nv4tQRp4id9C72QGdalFdfX7BnKPSPSTLH23WPS77z+JTxf4raXVjoi3RLS055pu6O0xQ2VzGhB6iegh45XvjH4wEostld/87wRR4HVyu06XgAcL1RMBuUSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT+aexIEoXIR4N2fNF6ZTNyTGT9npTh21qvkyox5aXo=;
 b=L3AyC9UngjEncojORvXY8q0OehuqUGzwnRF+mv49xeAlwaGWYDuXsb+tIC6NIJUh3mh/MYz8WCgBjPqNgDogNhPBhienl9lbS9RhkSfOuyRWBm/31lP7WPODrWwlX2ffKWu07jk4QlQ3C6uZeK8moRn7ioiWH+S5iaI5oNsCd7qHYlpn7R9oTe9nI+fafwoNtjWh6e81wwZAuVkCdLzyX/DouHomlDt1iATaMw7cGKygMz9cXB4Y8y3Oi6WHLOcyRe1TYo6Dyrtu9OCeybmwQX8gvxZ8EU4xWP+v8jmGhO02WXkv/LNjhp7ODbXh0Xi5+SBObaNATSlYSeHs7V+Rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT+aexIEoXIR4N2fNF6ZTNyTGT9npTh21qvkyox5aXo=;
 b=i5u9YLbzbuQAbCScTD8b+UNb6O1NjkHcSAm8U3KyxexI0CNBmE/blpYcRGomuJLUNvBPbJLb0q0wjKRcSIsZJT0R3w27QhziurAOhqsn8vbl62C5OY90DPyiYuSNFcFZq0t7N5+f5iJ9Qyv2rfdqUml3tXmIkrI7wkltVLJ1izPERp3OnyxuJZClvHudvruLWxDDvmaSW2V6DiAi0d9a8nOzCbzTWpbcyfk+8ie9xW8HAlbIBQvxzvup0bJOXECc47LMiZyuKspVf9hEHc0GA7qmy+IW9jZC2f7XRrJ5cMwpPL3efHJ2jNfkB0czLMszZY+c4TUE1feKyE4ojjW7Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 14:57:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 14:57:10 +0000
Date: Thu, 5 Feb 2026 09:57:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 4/5] arm64: dts: freescale: Add the GOcontroll
 Moduline IV
Message-ID: <aYSvvIJs1oJNNYWO@lizhi-Precision-Tower-5810>
References: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
 <20260205-mini_iv-v6-4-f7cdd8f88144@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-mini_iv-v6-4-f7cdd8f88144@gocontroll.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: f6dc57d8-9a1e-466f-cf4f-08de64c6d65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LxP4eNTVBO0ebIP+aNvB/JEwkqEpalcw/RVEq3Sws4Dy9fqGEKUHRV2YoDzJ?=
 =?us-ascii?Q?ELzzo/Z430JIvVJaeyUF0XWTP4Mtu+2+6dgCQS1+NsMtodwzIcF+KHa3kzYa?=
 =?us-ascii?Q?nCK3Xoo8B9qrLSLTWNhm7PZ1ZPV0MDQiibSdCX8gjU3kItli+1OqgOJLTeeW?=
 =?us-ascii?Q?S9hDpjlSn7p6qeIjYOYOpJJMMPHAhd8EEU++DqOvh3F6UTGroCO9Y6WF7awI?=
 =?us-ascii?Q?eF83aP4aXbB2ExjHc2BowAf7P7Ntt6M0a01XpFaXo2ALstoni/0BYQssR966?=
 =?us-ascii?Q?ujclmpssSafl4HcPx5Mprry+rcemi2CkZfjbms0u9/A1ClDc1P/FLCjbyL1S?=
 =?us-ascii?Q?C19nsXG/vl74jPb44olK2aSBDYnuyBK3DssLxV+im2tUHzWL5eFojoR2j2LK?=
 =?us-ascii?Q?xJgnA3pyrSw/Q7iye3hRVOahApFgSnQTQPJBCcy/8uoNdltqmc0v9wA/hIq+?=
 =?us-ascii?Q?WCR2pEgtvjaXC3isF44m6qXiY17eeyNkrCjoMGs31fzNC7qtYNrUaF9utgSo?=
 =?us-ascii?Q?0rQ6IwIKFmb5SXbNPu+Wo4lSnewMO3090gf2DXLVUETOR9IcuQB+Szsu4bl0?=
 =?us-ascii?Q?l9uRIw5Sie1oMyCurXih+QXjPyiKOYByubNwajOPIL/znJdthYTDiF5JNexu?=
 =?us-ascii?Q?DNZBX5l41RpLi5F9KNCSUgZfcJbW6OW8bOmqFWczq4aYh0OtkMGDJTr9y8UO?=
 =?us-ascii?Q?b8ji4KUQFg+13r64mJA9QfvXiLv7fK7+1p0pwWKyG3WIQrkFzTSo97+nYJu5?=
 =?us-ascii?Q?Ql0nl4rty2Sy1yhIKGKF7OUVzMEAN4KIK31XKsNx7ibiyS0EKa3k5l/OFPGX?=
 =?us-ascii?Q?NhSiuLpXvDWiYgVxG3x/befVE6MUaHMQuojrrEWB+F5AgzyAJ/A7IcvHI50K?=
 =?us-ascii?Q?Ns5D3qWaCR1ag1PlhgDuR8Xd72JFMf07wN0PN/Gx4ZbVAF7T6lgy5iKj0o5l?=
 =?us-ascii?Q?85wEw6K0wzAcz5R3Hpcj14utGUyax5C01aksWRJatXvLHrvulsBYIdy1Kif6?=
 =?us-ascii?Q?9Y4PNbN1FOew+C8bkZV/0vLJ+bMLqns/C1987An5fghGs9U/dBrIB3nPFqf8?=
 =?us-ascii?Q?yFmuCKHTy3PhoD4b06pVwX4wANcpIbqoMI5xs0BRtu4uYBY9oxSCd2Bz5Odw?=
 =?us-ascii?Q?x/Qy8Rm94nZHR4sTtPmpI07Tv0TcisOCgeU6HsSRnGI32hpZ9NSSBa5KYeq2?=
 =?us-ascii?Q?8eLn9jjab+mD92sII8oHEEdwfiWGtIynUe36pRiAQTBJnYoyZgzdzV/d//zT?=
 =?us-ascii?Q?bBzkWbf5acNMURHMkqAp3Busn+uiDCyJCpkXg76BpMTWXARXq9NRwSWNs4OX?=
 =?us-ascii?Q?oIgAbkLMINRTOyPcZ7oGYNNJ32cRXhgwNIq08aTvjHsSIvmNG7ovB3pS5P+J?=
 =?us-ascii?Q?Zc0J1atI8XpeKwVwZUKv0JFOnnbuIKOltxI+U0+zOvQYQfU8ehzIRF96Te4A?=
 =?us-ascii?Q?qwSknZAlNcN2nu8fI8I+DwEVHxMOOBBvLMdAqFSdvYVFNtpjRBYFgFzX7Tkd?=
 =?us-ascii?Q?BDzMpnsDwuk6D2yhLPjEBsLyc8Ahifz4t6YZgtkkqBLUIShILLPfGtp9/xNW?=
 =?us-ascii?Q?7OzRN+MpIENG7ZkIYa2ZBFJJye3Vc0NKdgQo7++NTOUclSouiaQXngrVK/VW?=
 =?us-ascii?Q?Spg7kKGlJWUY3I5CAjXS/1A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gBICjJfR2kedv72W4GVuCHgBNLxobLNamZAfDnzY+iVQhtTYFKntT6a6qbOI?=
 =?us-ascii?Q?qDn21NAQ/ZEn5VDdHnq+BHETGC2Ok4uWtaxCHhlxkdE9tH8zb93rxcD1BpnY?=
 =?us-ascii?Q?WdLlL41w4cHla/elOWHDOsuLfKrcW8wEwXy+vl6cX0zwYNmZmELivINM5VeV?=
 =?us-ascii?Q?uM40afpHQVAYKd2OEod2vhCeRDDb2xTS+NTZlqarznA3Ffl30m4tRo8iyqjJ?=
 =?us-ascii?Q?ykPGTrY1sxEEvuGHUSPlmpcU67o0lJthbioOCc4LfNnXHkLHNGJj+GyDNYq+?=
 =?us-ascii?Q?Jsgo4geAF40nEeXLJFrEoQkv0hwsiIByKMlUzS+qzAPM/xcR/tykivTSPjEC?=
 =?us-ascii?Q?Uy4HyrevVJELrQG8SHRTSpV4HAXyN8UlzEXoAkCNwizAOKJds0B4mVZph+DU?=
 =?us-ascii?Q?8YVi0jUYvlulKzGlw0ieRdc2dq68UYolQBgo+B2jyjRJI2gwYW+TaiX+cjPJ?=
 =?us-ascii?Q?9xB7jlxXy+48rZpQHHYdEGkGG+4xb7dzDuMH2Pd9CFnlrGllsHiPcBZ0dwRw?=
 =?us-ascii?Q?XKTisark6LcyWCZQSzwCUCWayaSrZyqj00uzxlYiL6Sj7Y5xNiisdSHp9otI?=
 =?us-ascii?Q?fa09TwZCIDaqwxkFHZzrq0224UlirXXhUYAGAjBH1m5tgK9cenc+sc67gj22?=
 =?us-ascii?Q?/PlL9RzteqF2vMWrM0hwVA5a+pMfT9cIiyH4nDLBY+8SXpWZCqHSnhrzFvnZ?=
 =?us-ascii?Q?8w5Mi/hAW9529am4m88K3c5zE/xNwOa7QrIhIAGVXZzfIWRbbqaGQ1JbyHc9?=
 =?us-ascii?Q?i/ALjapoGKumWx7JFglNUcvLCNnxpOsfep2DY8yuTLDJwpYQJE+FiAaa6BYh?=
 =?us-ascii?Q?ZzZuey1MrE6ny0wX3N1ToIUf+HtAvYw1KdZJTtWflkoKsfVTE/p15E5jd6Z+?=
 =?us-ascii?Q?0OZIgRRQOSqtyLtlEywR7HSvfkZL+eqTO8NIR8ap1XElbORq20EUOl3G6Gus?=
 =?us-ascii?Q?H8tYp+kUTx6qVB+sSrlsdM3SD8s5UtI9WbtjHMsXsWnSkXmEr9Gz1QBH3nEV?=
 =?us-ascii?Q?lrQVVt93oLvoVQ/Ark1WrxEwcLEJAFqossagKLkISiJpEVx3775P2/4+DU/E?=
 =?us-ascii?Q?mKf7w+10Xk62MTykCBzph7F9iHEAvFOFRA6bMeATwSudrS0QqOBR+w9Jic81?=
 =?us-ascii?Q?piRP7W3kj2P6r/Bas8MLHLucxDaO6VtllO3FmG4ijvL9pV3nttU+HSVBOl1A?=
 =?us-ascii?Q?v8OAtzrCv1iw8kukuk6ycTKEoVx7v1KpshdwkhJ9+B+LtSRNcqipLt5rJT4r?=
 =?us-ascii?Q?Q9lQvLHlkHUfnAXHY87P0PU+iMElsyMaRyVoTgpCTPlxXeNAdFHsSND2oJab?=
 =?us-ascii?Q?xeFm1rK4srN9gH8nayu/uHIDORne8wD8eLmnrD3takkGkak8LIqP8YcN6P84?=
 =?us-ascii?Q?7qKJa9giHnWHW3zFBO5cF1hqxlQx8fRTNG79Mh+nCy66zzdEljFw8GnU0V2Z?=
 =?us-ascii?Q?kt/SqU3isJdX7Jtviut+BEUcLnQ8nE7BbatmLT/wE+TEVCqXl+HmyXt4jzhr?=
 =?us-ascii?Q?ItsRBAyitoFNYoDUYDM/RIu8iosv1hKbyWMrH+78uj6rRxy8A4fZ05aGFofw?=
 =?us-ascii?Q?jofWT+bRU5KXOrbs0hkjOOa++Y0FavL3oT0uP7EFGb3J7fCKXAbXDeG54kBn?=
 =?us-ascii?Q?c7qwKNmbr9WjjQb2ELTJiH+DOPyg/l8fi0GQBrhsyc/jUv15olyc9ov27m/3?=
 =?us-ascii?Q?MhThsxBa+kra9sWk6xlb7/iJ++1NwiYwMlmEEti33U+GbR2F71RndD7E77IY?=
 =?us-ascii?Q?L4PJua7a9w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dc57d8-9a1e-466f-cf4f-08de64c6d65f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:57:09.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEiwcCcg29Km+pojxhBcKlCDG+aISOWsdSRdaocUdLSvGsxR44mhRATXEKujFttsQKT/7M772YG25JZ8m+ZHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560

On Thu, Feb 05, 2026 at 02:48:28PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Moduline IV is a part of the wider GOcontroll Moduline ecosystem. These
> are embedded controllers that focus on modularity with their swappable IO
> modules.
>
> Features:
> - up to 8 Moduline IO modules
> - 4 CAN busses
> - 1 LIN bus
> - 1 Ethernet
> - 4 RGB leds
> - optional Wi-Fi/Bluetooth
> - optional 4G/GPS
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 799 +++++++++++++++++++++
>  2 files changed, 801 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..0b4c7cc6d062 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -126,6 +126,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
>  imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
>
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
> +

Keep alphabet order

Frank
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> new file mode 100644
> index 000000000000..c454cd8dea5b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> @@ -0,0 +1,799 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +
> +#include "imx8mm-tx8m-1610.dtsi"
> +
> +/ {
> +	chassis-type = "embedded";
> +	compatible = "gocontroll,moduline-iv-306-d", "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
> +	hardware = "Moduline IV V3.06-D";
> +	model = "GOcontroll Moduline IV";
> +
> +	aliases {
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi3; /* spidev number compatibility */
> +		spi2 = &ecspi1; /* spidev number compatibility */
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	mcp_clock: mcp-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +	};
> +
> +	reg_3v3_m2: regulator-3v3-m2 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_reg_m2>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_6v4>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3v3-m.2";
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "5v0";
> +	};
> +
> +	reg_6v4: regulator-6v4 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <6400000>;
> +		regulator-min-microvolt = <6400000>;
> +		regulator-name = "6v4";
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can1_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can1-stby";
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio3 17 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can2_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can2-stby";
> +	};
> +
> +	reg_can3_stby: regulator-can3-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can3_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can3-stby";
> +	};
> +
> +	reg_can4_stby: regulator-can4-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio3 8 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can4_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can4-stby";
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-0 = <&pinctrl_wl_reg>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <100>;
> +		power-off-delay-us = <500000>;
> +		reset-gpios = <&gpio3 3 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +/* SPI 2 */
> +&ecspi1 {
> +	cs-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 0 GPIO_ACTIVE_LOW>,
> +		   <&gpio5 2 GPIO_ACTIVE_LOW>,
> +		   <&gpio4 27 GPIO_ACTIVE_LOW>,
> +		   <&gpio3 1 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
> +		slot-number = <3>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
> +		slot-number = <4>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@2 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <2>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 25 GPIO_ACTIVE_LOW>;
> +		slot-number = <5>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@3 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <3>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
> +		slot-number = <6>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	adc@4 {
> +		compatible = "microchip,mcp3004";
> +		reg = <4>;
> +		spi-max-frequency = <2300000>;
> +		vref-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&ecspi2 {
> +	cs-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>,
> +		   <&gpio5 9 GPIO_ACTIVE_LOW>,
> +		   <&gpio3 2 GPIO_ACTIVE_LOW>,
> +		   <&gpio5 25 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi2>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> +		slot-number = <7>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <22 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +		slot-number = <8>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	can@2 {
> +		compatible = "microchip,mcp25625";
> +		reg = <2>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can1>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can1_stby>;
> +	};
> +
> +	can@3 {
> +		compatible = "microchip,mcp25625";
> +		reg = <3>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can2>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can2_stby>;
> +	};
> +};
> +
> +&ecspi3 {
> +	cs-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 10 GPIO_ACTIVE_LOW>,
> +		   <&gpio5 5 GPIO_ACTIVE_LOW>,
> +		   <&gpio5 4 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		slot-number = <1>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;
> +		slot-number = <2>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	can@2 {
> +		compatible = "microchip,mcp25625";
> +		reg = <2>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can3>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can3_stby>;
> +	};
> +
> +	can@3 {
> +		compatible = "microchip,mcp25625";
> +		reg = <3>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can4>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can4_stby>;
> +	};
> +};
> +
> +&gpu_2d {
> +	status = "disabled";
> +};
> +
> +&gpu_3d {
> +	status = "disabled";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	lp5012@14 {
> +		compatible = "ti,lp5012";
> +		reg = <0x14>;
> +		vled-supply = <&reg_6v4>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		multi-led@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led1";
> +
> +			led@0 {
> +				color = <LED_COLOR_ID_RED>;
> +				reg = <0>;
> +			};
> +
> +			led@1 {
> +				color = <LED_COLOR_ID_GREEN>;
> +				reg = <1>;
> +			};
> +
> +			led@2 {
> +				color = <LED_COLOR_ID_BLUE>;
> +				reg = <2>;
> +			};
> +		};
> +
> +		multi-led@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led2";
> +
> +			led@0 {
> +				color = <LED_COLOR_ID_RED>;
> +				reg = <0>;
> +			};
> +
> +			led@1 {
> +				color = <LED_COLOR_ID_GREEN>;
> +				reg = <1>;
> +			};
> +
> +			led@2 {
> +				color = <LED_COLOR_ID_BLUE>;
> +				reg = <2>;
> +			};
> +		};
> +
> +		multi-led@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led3";
> +
> +			led@0 {
> +				color = <LED_COLOR_ID_RED>;
> +				reg = <0>;
> +			};
> +
> +			led@1 {
> +				color = <LED_COLOR_ID_GREEN>;
> +				reg = <1>;
> +			};
> +
> +			led@2 {
> +				color = <LED_COLOR_ID_BLUE>;
> +				reg = <2>;
> +			};
> +		};
> +
> +		multi-led@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led4";
> +
> +			led@0 {
> +				color = <LED_COLOR_ID_RED>;
> +				reg = <0>;
> +			};
> +
> +			led@1 {
> +				color = <LED_COLOR_ID_GREEN>;
> +				reg = <1>;
> +			};
> +
> +			led@2 {
> +				color = <LED_COLOR_ID_BLUE>;
> +				reg = <2>;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI5_MCLK_GPIO3_IO25
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI2_SS0_GPIO5_IO13
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_can1: can1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_ALE_GPIO3_IO0
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_NAND_CE3_B_GPIO3_IO4
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can1_reg: can1reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_can2: can2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_NAND_DATA07_GPIO3_IO13
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can2_reg: can2reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_GPIO3_IO17
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_can3: can3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_NAND_DATA06_GPIO3_IO12
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can3_reg: can3reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_can4: can4grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_DQS_GPIO3_IO14
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_NAND_WP_B_GPIO3_IO18
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can4_reg: can4reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_NAND_CE0_B_GPIO3_IO1
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_ECSPI2_MISO_ECSPI2_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_NAND_CE1_B_GPIO3_IO2
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_UART2_TXD_GPIO5_IO25
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi3: ecspi3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART1_TXD_ECSPI3_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_UART2_RXD_ECSPI3_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_UART1_RXD_ECSPI3_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_reg_m2: reg-m2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI1_RXD6_GPIO4_IO8
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_RXFS_UART1_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: pinctrlusdhc2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +		>;
> +	};
> +
> +	pinctrl_wl_int: wlintgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20
> +				(MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wl_reg: wlreggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_CE2_B_GPIO3_IO3
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		device-wakeup-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
> +		interrupt-names = "host-wakeup";
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		max-speed = <921600>;
> +		pinctrl-0 = <&pinctrl_bt>;
> +		pinctrl-names = "default";
> +		shutdown-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +		vbat-supply = <&reg_3v3_m2>;
> +		vddio-supply = <&reg_3v3_m2>;
> +	};
> +};
> +
> +&uart2 {
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	vbus-supply = <&reg_5v0>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	max-frequency = <50000000>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-names = "default";
> +	sd-uhs-sdr25;
> +	vmmc-supply = <&reg_3v3_m2>;
> +	status = "okay";
> +
> +	wifi@1 {
> +		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		pinctrl-0 = <&pinctrl_wl_int>;
> +		pinctrl-names = "default";
> +		interrupt-names = "host-wake";
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		brcm,board-type = "GOcontroll,moduline";
> +	};
> +};
> +
> +&vpu_blk_ctrl {
> +	status = "disabled";
> +};
> +
> +&vpu_g1 {
> +	status = "disabled";
> +};
> +
> +&vpu_g2 {
> +	status = "disabled";
> +};
> +
> +&wdog1 {
> +	status = "okay";
> +};
>
> --
> 2.53.0
>
>
