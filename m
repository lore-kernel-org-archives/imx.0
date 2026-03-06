Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B003EFD37
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818434; cv=fail; b=Qh8f/WehdPTQBw8SymBiXIxvtYt2B+HVQTovUJ+anqa10KlS+8BlUnjCCh7Vic3dRSUw/FXMhocO182C38OtETmMD+2tMw66aWHLmYV6hzYBnMD7WnPdrwTHO5lVofCf9i/OP6UGbUJUk1ybxTsKa6elmY5J81E7r88LYzKZKvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818434; c=relaxed/simple;
	bh=JoxUailnxqD4N5w8qXVcbIyyjDZ8Yddmk4m7LSP/xvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pfZKIErOYwkt7x4oTOj3Vft7CAotO8/SCuLvtX4kFc16MLQUPe+UTFaYjgIlJDG8NWoy97V8I5NcLTl3h3JmudIN6xgTT8S989IXBfcfPvIRqlHazC6tQDESRSPtGI15P79hFUZ635+DfbDE45mn8CjAtbV2beAHhG9BNUGkhrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KH+kKFVa; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KH+kKFVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhrCapx4B1EyEWUFJbYzysiINsJn5xKk6u4y146FdfbPq3AkiK32P1Wpk+yuBGhY35n4pahQXn+zecD1ANB1OXVEDB934VxRtDWWjpw6Z6KvyLuAQx7Ak4bQkrbvVmydBk+A+l1/u6HTJBqBharMBaXN3iaALcAcas/3GzQBLrHRBUicSfbfgreyW4K1YoNWITe+gMPO/XzjwzUHNoQigveq/f5jcWljCZyE5lEWvSRqJpUt/yAb/JV2Irl+yXMQ9WV1eKWuO5scJv00I9Mtb6gteleo/3O7GbgSUVpqVkmV5TFhGqAyOMLDiayb2hGx8zKMJKGmTkV8tnMs7lF9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoxUailnxqD4N5w8qXVcbIyyjDZ8Yddmk4m7LSP/xvQ=;
 b=B5Ageh7W4QxN2TElK0xHNWwIuxUhsUqzTc/r581S1LBY5k3IZ5AC8kK7JyIgzwDnn0Ux6TpIYOMsk+6BMNQ1EJbgSw1VlJSRCcLLCWElieCElNRs9+/qDeux4MQbOOPUCR1VdA9+c4Cmlmjr4gPxGvvtT8DQ1RvDPa65FPZzFY8lotWDhcffwehy9jmD6+pKCP/Dz3b6V5XNnsvu/s8vXLGb9WZiYgOg/vubrRGb/uZZKYUIWY4gicQUAxgTEki23wNwpLzDXhRZIvrAEhwpgl+S6/VTitrb49knLJEkG/icRK+P7L3vHOl2Ga2i9tBhWcvDsCAWmJQ1bbt74GrrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoxUailnxqD4N5w8qXVcbIyyjDZ8Yddmk4m7LSP/xvQ=;
 b=KH+kKFVagQe2Q/0Rb1RbTdDwpdoKs1OGAZMo4C/DS+FcapCfON6pTXj3b/gsWOMB7MQQVXZnMY4Beo9+FbAeeWxkx0mqoQy9l06LcGLQLc3L6oXW0bhSQ8HBDOyMguDEhpDHKJjl3HD+4cjpT8OwRq2mO8n9hLA2Dyr+1RamAhqcGSAr4+DsK59j1RSt52/+huMobE2C1kKBbacc8TV695TD+pKnsHZRzGmNsf+8XMtB50rs6MaNBUHyCCfcizUM6FQEDUlmRdX2hhc2azr+U9u1F/GgK98zsKCDWK/rdu5dZx6paL+GCG4Pi0H2XaWDBXCQEu3WLpFO5h82k44bRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 17:33:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 17:33:44 +0000
Date: Fri, 6 Mar 2026 12:33:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: daniel.lezcano@linaro.org, tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com, jstultz@google.com,
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
Message-ID: <aasP7rlglXyghfYY@lizhi-Precision-Tower-5810>
References: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
 <20260306165140.293012-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306165140.293012-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5a00f8-e1da-4dd0-ef9a-08de7ba68387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	b8Cre9D2i0VS1oAPwmbD1yvuql/2i5B9lNEaJHuhFSkb4BU6xF92n8MFTWsrC3SVzB/emHaRx4jKdnp29LREhv3DxZy4sn493818aexcFEA0dnpWPhu/ijfKkM9E4b5Ieh5imBX7HPagZws3XAeMFl5jF9yUsRlS+gcMc9z3T46nBwl55NVHuOJRwIt4m1B8Xzv8LAcq7x3lWqKc+076hmce4BZ4V3AJrt1oOsVylSDaUKqmaoKZpVSM2UCoETdcQlry1CD+rPflRYEnuiA3arcKqmz3dNCbnhW/LrfMA7BgXzYJrSoR/bEI32wid60jeXGrBc07Smo0+dt/fWoSXyg9K23ScCiP9+n34kcacIohusb/Zx7G00FlDz8c+QPgQmIpxaIKDrolvi2I/ALRQruWh2iwXpjVWPUcOhWy79mgbm8WIT7ec6CKHoMlhhmfqpNjrm9DQoRmDUuth4/eAFYlEm4/y3c0S4fwlZxmswIbeztggISldwZT5CQwS6gyjUjFMXg41hbYYYvLpJzvDz657ZmL00ZRAlkKMu2dZI7c0HORHo7c9HFMqrLvjHxwMUKRyJ0LyzuJgqYPNEVl3CPYdqyCpydKalGAvQSTGoDDlqWBaHmsbyaJGcMfZ8bqY/ONQbV8UDzJpezToZYdCknJ+FUnHVzsOZi9QfHT/QOuET8xG+a3j/LM1c812whGHrOj37e9hOiETbPkR4gloofvKNqp3zE50RxdmYK9rPoC4UHGBxbVIKwqlZWmEgYqare3XPY0LUFuV+HlmjtyCV95AScAoEEAlwF7cvH46yw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9xpw3gOicZOHYTbk+KC5jHK7innEvouk5j12hI22iwt8jv/1Tow4lswKd4N?=
 =?us-ascii?Q?izuDT7z+5jBl8cPluPMWtGRi2ApxMCWk/7cYercl+dM6apZBewbA30HPjknZ?=
 =?us-ascii?Q?TSXzFEMQNMTtvCjZGfehdJ1pgaQmyN9hBCP4R7yDNkefzPUO1C9OxwFS4b8B?=
 =?us-ascii?Q?TOt/sRuxll4wL7o/qmCJWPCRnOYwsEtV9yGo4/gisfzTy/NGewTSlE/m9HhE?=
 =?us-ascii?Q?To8x/xbOzj76ms4PIo6em5+EUl1da8R7Jc+08m9BbfrDwkJCBAppJUR2Jsoh?=
 =?us-ascii?Q?/mC1MUK5xSVuU7zY6l9DkPvyBc7tl2Qa4tF3ty2K74cx5jIYAu2KuYq/Al0o?=
 =?us-ascii?Q?RPaJlDLkpYqzAWjdzy6yT9USHw/oknufg6eyhAFEZKTJ039IIxCrbrlbVwf4?=
 =?us-ascii?Q?w1tJgcJwQeH564aZUHGyYfqkQeNRFslWOkHYn+nJoRe0ITrrodEZDxJVebJA?=
 =?us-ascii?Q?RmPWJR7bP1xHQYwsSfhFIIkMYDU8AjfiD7bVAy2jVl+ADPIwiUrQG8kCtXsg?=
 =?us-ascii?Q?hqOPPVtyQcvdvRaVtJ3nl8MBXf0ZHWBza+OnELxE77lHBWqAB8jXFTgJoAHu?=
 =?us-ascii?Q?BvAvdFANV4sUWhetx8F7edRQabOjZU6OX+z6dwEy5dPvWjVgdUfGxRdWKJOf?=
 =?us-ascii?Q?ZV9cEndudsg9Z2Nh2hBXjKGEOSzhJvS1k3wYWPLtH8P9WzogpZTVmgNcbdEL?=
 =?us-ascii?Q?VGIeq7vfVUSwRUN8Scxe3ENM/dtpZ/9oTyaRTnRjAscSs0Y/J7UiHeCU23H7?=
 =?us-ascii?Q?9TmWY3rsbYnmex5L1cklb65J5aLXIvmhMK62Iw/t9Jj3QkRMy3GkrT3jSQAx?=
 =?us-ascii?Q?WPEh5dnpW0XuVQ9VW4F7uBYR/kkv9EYvjvIJCFTVZkZ108BfRTSnux/7is/I?=
 =?us-ascii?Q?b/50mUlVLmhRsSLK5/HWy+1RWPHfehu2nLhVEmAtFwuHFgyswIDX+j8blnfO?=
 =?us-ascii?Q?+ig95NaqRZ2pwWq0iCE0awigPrji4YP18yFzoy+V6EbqnPq2oO1fAyuxjLnA?=
 =?us-ascii?Q?0W1UIsnYFozi9L5AHZfRzVEPcnVXkXvHyqRyDP0HJNVdYwEDJKJsjmGC17aV?=
 =?us-ascii?Q?7Tqk+tdkZ2pROvZnmDVqyOoMXG31+wetFXiW/JfzGvD3z4EcrSMAKMreP3Ba?=
 =?us-ascii?Q?FZuBCklay7qzarj/BIPez9Mm9h81jDkEj7b/wSPAKtXF2keNtoYHzq0MB4NS?=
 =?us-ascii?Q?sKL95MQsq6D1FZMIjxEArgH6zwqQdik/Z7EDWsHiiTry2GHA45N+spx3kv1y?=
 =?us-ascii?Q?FgTTGdmAB+q8nRyE2u8aHES0OHGTNd5C0Qn6ZvLsonD8Tx9NGIVHl99ZmKTq?=
 =?us-ascii?Q?N2C9+Q5RJ0Tso273Wv9Ayg7fJtZuGeGY8isN6L0McUjhG/B5DE1AwXOHFfot?=
 =?us-ascii?Q?KAh0BQrvmme6Igfl5corcTCVs+n98HCLGkOmWsCPfd6kPQudTsJMQzXgag73?=
 =?us-ascii?Q?32K+Bdlno3S+rl4BZwMdsl8W45EhgR3J5rXPceUoiM4n3sySypndKETOhBWF?=
 =?us-ascii?Q?MlAYobJ8+OvmcN2pt0nCwTndsioxmxLtDHIqqP0DI8F8bE7dKan/a7it+lEJ?=
 =?us-ascii?Q?q/LU/AkgbmtyBev6Sz7jUofeuBzyG4Dlz4WbW6Kn/gFaxdc/K9+X7YhfhYuk?=
 =?us-ascii?Q?9I1lSgAWj6cyCz7skpGOJoCYdImNFj0hB16J2lulwqoEP2AN8yBsjsTJWNJs?=
 =?us-ascii?Q?/A5iA110RwGXwplTMaeZV+meJLeNUNlbgZrZKnOz3DGIhnTN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5a00f8-e1da-4dd0-ef9a-08de7ba68387
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:33:43.5617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT/EVs+SP1WT3PrDxrEAlWT67FqDfmI3AATAk2S+J6oGH2COJ7hxKTf9P0rU6osvJjJr7MnqcGynbWhqPhaS7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

On Fri, Mar 06, 2026 at 11:51:39AM -0500, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
>
> AI: Include headers should be sorted alphabetically. "of_device.h" should come
> before "platform_device.h".

Please forget it. Sorry for annoise.

Frank
>
> Frank
