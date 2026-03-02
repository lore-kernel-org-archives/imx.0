Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DB39150D
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483831; cv=fail; b=kJSKYeUSFgAG5jvv3N6jpVRatsbTH2arv3ZfTB0DLjZjzOYWSnmXGCRJR6pHA0Oqnh58+ajQJTs9RISmTmRL7U7WcX6s2qEIH/JtzJ6+ZZSk4B9IrJ8dmgaE1ZHI8toNqT3HQMQikS6N6CY92fHOqyJwgkME85NoxKToHzOSHrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483831; c=relaxed/simple;
	bh=EuOpwFPev3uA+ZcJ6CcFPJco+cD0r/lp0Fzv6PicnU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qwnuc57isYho1I2qIDuLVmr5848o7edRZ8N3doGTCXS2oX5PqqeXMJmxIqOUpQwOvDt81TsXbl0o6ryGLtYu26tfVRVx77v8NoZzlT1pJF31/PNSn4dqH8GvAz41VXFHDiRQyxAy7vV0e+qmzPH29+DY7ikyTCeMJs2+85gs3sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AWyve1Gv; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AWyve1Gv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPktjBNUfmUWtjoFYYfcdff472zy6cqqjIDqsFif3pQJyPBUb1DTs+hpHlVaNgLkhNu471EU2JsbPv3uuv6p09akBjVP/nxtFs9jPzh83jJ552TdlXCx3Xk3/ykyzdhMl+DxdU2+Nl0wm1t1rrm8Sbxm9zgAC7+AHw26qUJo5v7xiCVr1iq4mZTWm4f3hCvH8yZT3MeRJ0yDwmJ2oinaQlxw7pkfXJ3sdjI1InNu17qs09zEfJqawANkDFMSX+Fjs3Sa/rhiBfUc89X076qSFg/ov+JGSdKLijiwDVyiLUm4oXYJWf8blsUmw2dfDbR0AQVOmWHdSE2Qh1yq36Np8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg2ZTu6aOX72dQDAWrZhwPo+4zsQYTvhwY6z2RLpA1E=;
 b=Gh3LSb68+U2Irwrh6H3p4XpDzSujhgMQvbP5CtyZ5h8dDRxrwvF4ONixIodw7t+RxnljllbTaQi/qSMG+IezISX0ZvObfsvIS/RbORLEoqMi0DBcLV4m5MvC6df2MKOjJiac9TtslyKHtk21zF2v8b80nDWWOPbDNpJUJrVtok/gAB+k+SK234zOMnWbda0DGA3nYAcm4QhzANwyYn/ffGWjKqaEZQhciCmcUb0MkQKhNkaGjrfNfojxl0Ldui9sdPQZ6TPz5Mu/OfP7gnmUnm+8PuP4L/OISKRyVheCplMfiJYiBwAvRDOcRUe255GmoO3JrAAknrDeW6hiTlc02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg2ZTu6aOX72dQDAWrZhwPo+4zsQYTvhwY6z2RLpA1E=;
 b=AWyve1GvdVIcyuwOIadhkHBV8b945yi7u8ZVQzhvgtBHMkhonIgEL/M5GfTWJFzJeTb3AL6ZH7ca6U/VcpjPT5nAmfAmr4gB1rDvW59Bt5FVTFrHkh1lCPlhYz/x3ETB0LjFAi5RVob36x0TyFjl9984Y5WUKbqQ4kY7gf1mXC6z/mMAxtz67eqQ5x4hqV0ydsTe4mPS66FAJ8UqnQv3EhbGyahks84eZEU420QfWZ7Z8bx1eOScBBZGvjzbAAsfO56RECaNMlWP9zCL+RJGyL4JaOlQXLbDr9a02tgZxV00yCWu509KfXVQ3CnwpXYxUJ8RLkeQCGEw7AWdGOIiEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA2PR04MB10445.eurprd04.prod.outlook.com (2603:10a6:102:41f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:37:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:37:05 +0000
Date: Mon, 2 Mar 2026 15:36:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: sherry.sun@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add i.MX943 PCIe supports
Message-ID: <aaX06NS_XpPYYHlc@lizhi-Precision-Tower-5810>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <177246919562.2086883.17926195087426226216.b4-ty@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177246919562.2086883.17926195087426226216.b4-ty@nxp.com>
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA2PR04MB10445:EE_
X-MS-Office365-Filtering-Correlation-Id: a96a9a86-a5b3-40d8-a9ad-08de789b77bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	qQD2aj8pLm3EkjmFJ342w4hXeZ+Re/zg/G9uXRiOx08BJpw/JkAROpVw2qBSxpqf4X/VlJ7QFg+buucSCoGb1vBbYvYODmUZVz79uzOiGHMbBkKLSivzgrmfG+m+AHIe8YMcSrvrp2+TtE9p1z5JKC1UxMs0bt60eBmroxvE+K9ZWN0/jbtO1xiR9zF0cuXBRAAr7a+Qkj6hWdc73UBYQK3eNXZ3xhSOlqaxaeprBH6+OwCe2odq3wsHZc8eYIs65FG4mcQhcTu9cfKNe9HMVbsKjKeaokfV5tgFPb4DBPn3iYjarxwUjnJdt6KjZVPs6GGnDY2FULj/7HoKEVKtw7gvP6MO4vuOH6Iz5l90P9D/RRSmDqAyxxC+sf0UgOzW8CXQ8X4R+vukxBTgrbyfg2ypMlQtuOivRhd5I963K+oi06EC5I4WliqAjPwPlVqXSo4BO18hLZuK6zcLNkDp6+5VuC7VK6JC1ZwAgC1M9d+ewB91nQ5C7c/FXKP9bEWkiR8VLQkPrZhHjX9vkIznYEvQry7ErxzQPzfH/D0db/9xBhexXaEhqPZKTt10iHbJ5kEVpPdTdHnGsbTtlakJMjtzpYi1ARRPIlOrAwyW2LvkLaV6oHOGTkWx04uYMa3VX0O3BnYpg/J/NfnPRKyiA3CTLMlbro3If6bF4BoEP7zy6d7lTGcXdiKFpPF1ObijX/kxCdBIbk4wlhLiLxSRC7KfbZYwJMj9B44JLbpK4A+pFS6uE1/1M//kNGdB7uMpBEMjxxbCvyNn+EeyikOjjryWibmVe7g0wMDWW6Daih8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qKQ8tK4YCCWA4Hq+1GM6wuJd1mqYsmF5opi025kwyTFceUe/W2LRgjisllge?=
 =?us-ascii?Q?TwML8SFOis7AY3UATgvZq6ieDKqWV/oBAtvtMIa+ElBl9B5rxPTzEJ9aE/hV?=
 =?us-ascii?Q?lwvsHrYilfrQ7zGKHIrSKq3jbyl3DM3hk0ijCqB35talOxy0r/9vCBKchldr?=
 =?us-ascii?Q?hFX4f+jpX0OWLsMeoo92OGp1sWsfiJO+I2KRCOf0Zo5MyCjVKiS4hMt3fUjT?=
 =?us-ascii?Q?lWAzU8+/NlA6gLp4LCA5k+aDT1HpyPEeiAoOLDVPiQWQPaFhsz2aGpPF4IWC?=
 =?us-ascii?Q?tfwN3UcmwTOJl/6V6NxH+pLSXEt4g0PBnWrxQDH4EEGVr/79ucdWbM+daykN?=
 =?us-ascii?Q?0vozeQeFGgzekHSwydxbQIaH75Of5OsQXYBeFyI0Dg9Tv0HOuRGoNroZ8oTq?=
 =?us-ascii?Q?JdydAoyRw1de0R+Ciwog6dYIwXh8wvKW9E7x7bGXQ9p7+VMR+mVwe+7m3zZh?=
 =?us-ascii?Q?UfY9ndcZRSFBYJK7Qizoo9v4WfR2wJSH9vp2uRN8ednBtAAw1bUdPD3vRBu/?=
 =?us-ascii?Q?hkXZG/tei9dd/rwAkhbW/egplBmo9v/m0QVDjRIvqL5ZzSnsLL5eFcbc0y/V?=
 =?us-ascii?Q?rcGbPvf+D0KgTfmJh8Vs+XdUefGA4IgnNSDfsMOU9viTv58Z6UYYML9YbCEd?=
 =?us-ascii?Q?8TD/usi5ggcYx9ic+NCelkXBjgTnjkWG5DPaF17jzERrHlvVxYr46ZZH2KE6?=
 =?us-ascii?Q?PSAQ3N81QKM0l0Iu0aTOVuMpDgWNSeuLJy8X37hFe0BKHduFkj8w0a6n3w/j?=
 =?us-ascii?Q?ibryQcIPqSpcliWd2z4C1b42lwZe8G5+xRjVYrip82/EIwbxioWV7jTcdjWB?=
 =?us-ascii?Q?mOIMNYUetwaajDgX0ftFncRjbopvlBe1kzbPvzdAbU9+loESrRLTQBO/e1dE?=
 =?us-ascii?Q?jZJ4JkYBDclKViUG+Dqi31DBGykQsYhSwPjOKFMBKXQPhYoZb8nWfji2B5Sq?=
 =?us-ascii?Q?AUWAPcQIVgas4DmPSuX6zsvfgW35kppQmjrnMGLlHPB8gvLgG6DgpaFXI56W?=
 =?us-ascii?Q?9g3FIcDCMoaM/xD7ChdYhYXBqeUso4h4V2vglXI9vskmFetxdNhEFjaqZKxq?=
 =?us-ascii?Q?KOPAIcIouEwOOiioEo1up8zp8DOmG7uBoCBPSOl3U3urkXR1hyEGfbdWBVtD?=
 =?us-ascii?Q?ftFW5n2kKlIBcOgJlFzD6xHCkWG+LtEwXC078NuJVRyQqzhhu/gem5tUESiF?=
 =?us-ascii?Q?EZeJJRhHGthim66X98EzhSbUj2u4/e+amlr1v8paodWXmv3hTxwg03JbOWVo?=
 =?us-ascii?Q?S5MW4MNf06RNyxCT0k7mwXD7y+zEa+ZiXtU339F55lnEMKZmiomIOn+tF9jn?=
 =?us-ascii?Q?Arg7TPW4wDmQBJ8oVfKlcmrJDBYcM3hgLR9oEsNMR23meaFO1BRBqgnv89DX?=
 =?us-ascii?Q?ntQpG3nSAOsoR7PnHJEERUiK0LMYfFHOuHewHe5jKS7UoRgiezPUNVM+xpTl?=
 =?us-ascii?Q?t7yf+7Jn/xPYO086DpFG+Ohu1mb1y84YGs9mFQHMGqqe1NRsf29t7yHybz9E?=
 =?us-ascii?Q?9UWDnfBDMUVXdTzOhdPua9epVkY/7S0TzkBVXmpUp3+Mxtk7FQyPA9PBgBpB?=
 =?us-ascii?Q?3AuHmbUvYP0k4FmqhbZvyHwrfdzkG6Ceogh+DLggI/ZjMGSH9Ei88Txr/2GW?=
 =?us-ascii?Q?7nhkTWty1eUd1+7irgbrB5xHcerMti1j0siw+zUUPu0GkvgVfYy8fU9KZWja?=
 =?us-ascii?Q?iOh6RXEYu27AJ8Kf4xf0txcD84PlbSWnG9oZKgu7Cgd/vJCh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96a9a86-a5b3-40d8-a9ad-08de789b77bb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:37:05.8777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaPPDFPLBUC63xoBGgug+nGrVsCNd4pRLb06AK7A2dKAL18Qvm3hasDqGZSqQ847863HugoZxOdE3omlqD1oPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10445

On Mon, Mar 02, 2026 at 11:33:15AM -0500, Frank Li wrote:
>
> On Mon, 09 Feb 2026 13:57:42 +0800, Richard Zhu wrote:
> > This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> > attention to that it relies on the patch-set[1], and the PCIe1 port on
> > the EVK board relies on the {2].
> >
> > Both of them are queuing up to be included in the coming 6.20 kernel.
> > [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> > [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> >
> > [...]
>
> Applied, thanks!
>
> [1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
>       (no commit info)
> [2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
>       (no commit info)
> [3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
>       (no commit info)

Sorry, I dropped these 3 patch because there are DTB_CHECK warnings. If
there are extra dt_binding dependence, let me know.

Frank

>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>
