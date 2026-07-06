Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963B424650
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341185; cv=fail; b=K+U5gkG5MkgjEnvK28tEQMWMesbzp4OOez3cJ1tNoEfDBOO104SkrmzD69Zykmcq/ltyU+9OrjepTUHui4U8I2prybpSq2Ke0FFdxssTY9bDcxuugL2Kzsba/Fz1Htq+TaBjCYepvJ0JK2L/ZRIQhfzBGkN6hbSCZNQvPhjZbew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341185; c=relaxed/simple;
	bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=La2x9C872sa04zq2GEjSIcFV5+4wzQCDleLWidv/CU9JE6NLA2FG5BsQA98nU89nLiMmBC6mM0mR824CvdyXM6PeCq7FAasgudhgtV4VRt2tWYb02cgmfnjTmHs7cdxJ1o4DH/NyZk9KaPm2Cfm9bZRoQ8FYHT7WAc0i/VYowOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uIF0lHCR; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uIF0lHCR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAWRrzXUBMwcHNAqq5IGHGt1A3vdPP+Wg8IyuK9Ua2Dk8xeflfnHPB0AVqgBSobq0V9tHsbW20XiXdpeccCJx7oBU5r1JQbg/6YIzHWakWPNN+JuF2iAIvvtd3zGpZjUVa7hFE9RxoQM+bGzJPHxdQwsDMV8XKRA1IpydkkkdWopEUv8W+6yWwhILbMoD8jbqhY6vnMjzgSb9gWp8Vuy+Fgi7uj/spLnTwxg4hDkBhAHxqJNDotgNOmBjOAvmGCNLVhIuyvDLeNhSclvLGKziQ25WXagkdFuzJgtsPZppcGdGrkbv2d37hMRjc+Xq22mhlGf7pRzr3AhUgVSWFOZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=;
 b=KlLJeNJisEtEVSKQN/zyL4IeOltca/9FEFuQzMvgH+9KGRRW8DLq6NovxymhwOQ7KX/DQwluxQ5d4e1FLUJKkRHpBhrPj8VPKP35KmOoHlK41ki7ANxvXwKFJpNmlcXXl0veiuspRynsWhi6usEjHGykupXGCBesERkRIEnpkqvkY/vjmgGXYFcJW2U1lhBDDOkYzehy67xOhMeT+SKfeGpp7UyqkAMNFgZ5lGk0TzwK2WNK9YDOfgitV/prfaKal/gdX8lUQ+uHK2yb9aLrzaG4jtvmPGlsRXmAhAeqhAiVfiZrpTavwt+4luB4oxV4eqLPLdNERCR5aF2Y8QJIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFsbn+4co8jlRdot741K0pOyIQJYK89aMxELhjs1mw=;
 b=uIF0lHCR9O0rrFFQvgR2CMY33rj+zcat6wAEU/q74Qz+jTeexgaottnL70kyUa4lTE3r460v4TAdhonMPAAbgfyx+w91urzlSLXsdEZfx6cbBRwa3Q4Rhmz4P84VhWpcK2kNstN7o6mswPJ3XW3ECBLzN4ekk2C32FlsVyaWZBTNBba9rl0pj7g/hCD7g6OR2YOeDFdBoXRgeaNta8RvUMXdYjEe6bvP5pfOrsEDoeTbn9LFhEs0KSK2OPg+Wvup3LruSsToxmyip7nrlAyMHPRe0kgeUjizkpHTimTn2fvlhb0WOGIKD6WU23krDcsRs4LAjXEd5CTRZOybvMBwdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:32:59 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:32:59 +0000
Date: Mon, 6 Jul 2026 20:36:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Message-ID: <akuhStAKJHcZ37ag@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b975a2f-8b79-41df-880d-08dedb5ab67d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 ykXAEc+Cutn/SniwPFg+AbuprdZR2l0Ip2N3h46rigTXH5wObaMKMT8zrDLsk+IiwSgVo1Hob1Kuhg56HHTOZB5YNmDkUIYdT4TsMU9otlu/91fYQQJuI06cCS9uOb3tMLUHLe95Y0yW9zzfgMrG1aMC6tYe1aIviNL6rUJdIxkP+o4UzBdMvSL1dH8LjyJ1fifpQHXRzWDTA/N4uNIUlcxjtQmsOfmAReBocvEM5BgO1BLJI7vmjikHTgcQYS45MkYrE1+/7tZZ4z/xTsCL9hvLwzdyWZkyWA4ySYOE2P4X1E2h7mda53LZbYUbemIpXarVMMgp1h0OhpdeYQppXJquRyUlO65tGVxj1syD3boLYh98B9GgVKlpB+0ZItRGcrvCN82z5so9DgNEB0IKG6bb6MjNQjJV4FlwbHYzDILkvfi6kYbS36Dvn5loxZ91ih/g4sjsO3Xvmf87S/21KfYikZPu+WEAxuZoqoB4FpKvMsRgQhFUJDNWqXR98h36ETXfcEjtWUaWOCptOM1Mv2iLS2aMMNorAtbag0ylx9u7OHlPHqHqnUGTmp+1RomCA3pfFxVNvYSptMV7xfAIbg55ZtvUKCM4cFUzzjacA2akcXs4HfXj7ZfI/6xOtd3MUmZzIGn6E2fSAuRu+dRWN1im08G0FH7W6pNH/Zn9YyA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4e3mc0CAnZz4hg8hqo5tBYXr34V9ePQAQ5rfrpNQ7fDyPzfhr8LBEST0Otyu?=
 =?us-ascii?Q?k9fRUT8EZAi5wUSx1MNMM2X1laHvlBwpWSOy3Z1SvJne5fKC11oTKv9xtJ+f?=
 =?us-ascii?Q?wFS1YzmEo2YTUH1G6lr972SDZUdZ5hGtHkqj2Y9scEbdcP1yhAD2VbD16D2x?=
 =?us-ascii?Q?mZ6jTBCkfh3OrtH5TgQEOks9liVWZin+MkyXN7QU6me+KbdxP+jmf1uGcKu7?=
 =?us-ascii?Q?bLb+UEczV7IVr1jPADSQkes7pW32hAguLSvM+DtYG5H+294wE5UbYbtZ8nEk?=
 =?us-ascii?Q?3Mco1Aw2U8LBuM/ZWAJNgSR2zin+zy7kdafzOE8ONrtK99B415PYNYr338DY?=
 =?us-ascii?Q?VXwAE02WGgSO1dK2zaIoiicLLffWXmmII/XsdaAy88gvU6auB85UY94pSzh7?=
 =?us-ascii?Q?gdas5LjXeOtrKJIwPHOZJ/emHUeqVL3xwGl8KoI0POJBLiCagSzaib1gJftH?=
 =?us-ascii?Q?ro5rlYhVH1YPAKj7f2kkjJI6Gc8PKQdUCfW/BeOfhJ8Me4J9tCU3bsl/LZR+?=
 =?us-ascii?Q?0BlUln+WzDKLJ78gOQquMTM7riKToRXbFHKk+qlOiSNRGswLQ7OKx4fbP64T?=
 =?us-ascii?Q?jXa1MD4abUZDLZdUk6tMrlTQNRmZaIjyD9U++Y8iUtLNVA5dGcdRdZ/4WGO3?=
 =?us-ascii?Q?99D++gIDZR09lwVp3qo4ypClXI8p3HqXWZAHfY+63pibpbTOjOyya5upgwUb?=
 =?us-ascii?Q?YMf24vAvKfS4ubtADpMXFEbmH8l+qPM2MklPfYibWAKgU7Jh2RyVrROyI+4/?=
 =?us-ascii?Q?b0Af7EjtlNIqI+zzeYkP9Fa+ZuewlGssqESi8/772O6MN0mPQjRoVEyBOYRF?=
 =?us-ascii?Q?BtnxX3N8Ua1ap3cRJVOib7UKBIn5m6Ka5fhLzLsAZXk/XtlX0up09zBuqU8R?=
 =?us-ascii?Q?IBh+GnxoNfjpcTYsYnGuqj+RXs46SLq1g0jhK1eD0NYH9mHorkQS7Pv7Pgcs?=
 =?us-ascii?Q?uqEYZAD/M0h87CvXix1hkwFui5Tms0geqqmEfM3x6/J5zZbn7dYGF2NHElRL?=
 =?us-ascii?Q?RwITv9U4jghsgQ/0dDNsvrmzYL3WqHIOHnF3KpnBGlRnRYAlMfZIRhZtnZhW?=
 =?us-ascii?Q?kZWH/1xP7rRJ0iXo4ldh1L7YHufdxYfmRJBwsPFuObHiI5+5StNF+ib/DVQM?=
 =?us-ascii?Q?+b5/L3pPsDO70kmFMSpdb4c6/4t8PWRLM8bvG/tYjljA4LdNEnVRl4zSdGCc?=
 =?us-ascii?Q?HzOLydbBZZfEh/PWnxOifa5h01b1/j++EA4d8Lmqcf2wQ2Rcwza03tz5veF0?=
 =?us-ascii?Q?EdOvFTKKNmKY3z5kFOcc9L8xvcRgvbvK7iMfkLTVwbENkEwozJJ/uETuCpm0?=
 =?us-ascii?Q?qLE7Q7eXiI5sczV2Hh5lz+A8s7efFjy8zR5foCtzn7nSU91NEcCB78KK3iOJ?=
 =?us-ascii?Q?V5fQI4MSkHHJVqrMdpYgtUVnmQuuxIDmixGB/gnw02QkAOj+f/Vl2xEohQZT?=
 =?us-ascii?Q?A2Rk97bT48w1MR4ohjhm/5g1S7XZa2eKHD+VzOvYngK3gOM/FOiRm7JtB5WQ?=
 =?us-ascii?Q?Xo/8x9sj3EhJ1dK331v1nR/AgkOWM4+zK4pz66+eu1IvrKnhX8jAhOP3FPkD?=
 =?us-ascii?Q?hHrHmdpLw5xwW77JLuWtHfbOUwbbX8z1RR+7Lzmmz3dkhPIRdcimEQDXYVvM?=
 =?us-ascii?Q?F+nF/nUz5PMf2U1LomQJqs5fdJH+su5Hrjm/5o5YAHIdhWk7eVTMSQD3A1bA?=
 =?us-ascii?Q?iS7tb8/MNDXNlvW4gE3o3rwNhKt2L7WxpW6nQLtKjGbfKtOIiB3sOllJ/zOn?=
 =?us-ascii?Q?twO9esvb4D6GKwTH6XchNXuj3lOfKAib4IlPfoiqo+q5+exeUBJg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b975a2f-8b79-41df-880d-08dedb5ab67d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:32:58.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAXhWM6MOwDeLW9KX+vYwN+XjByUF9oJxX3HWWJKS13D4QgIOGRraJqCrUJaC4Q3aEHtk3UAod5KT7vZKeMotUiKZ2JIwYwdrFcgl1j2QEMfB7zbJLsz5jmGTsvsb9Dw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700

On Mon, Jul 06, 2026 at 11:34:41AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Enable I2C4 on the Symphony carrier and add pinctrl configuration,
>including GPIO-based bus recovery support.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
