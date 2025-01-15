Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2048.outbound.protection.outlook.com [40.107.249.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FFD142903
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955068; cv=fail; b=GKm+nuDHx4eSlN++OU6DDw8f9j+0mFM3130Uqu/M3U80Yd37VrT3ohCN4JBWJ/FGUa5yB3LdRYBO0FtQl5MZXStpKFSocImiArjWWNokpx7ps8n1htsi2NOIP6aZr0JAsZ1J4YKT7ImW9MACZQ7f/de6iIkLd+zWhiCqmbvthWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955068; c=relaxed/simple;
	bh=BgmeDOvbqRgT2es/v5pfiknOL3JcYtdyQRACV7gILI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m6Qn/gVHJydJb1+XDIF5RavIHjiHKg+zcMgRNDPFuensaCuyEIaVQZjq9eFiDAM5vSYrWWsz3wV62uWo2w50Ew4ShBck4ukvjUreRwCx/zCiZ91bl6lKAzHM4rLoSdIzgYiPrih/vZIqo+fUr687V5mKphkqj9Esi5O+dp15jUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NnlCvtog; arc=fail smtp.client-ip=40.107.249.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NnlCvtog"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3KVlvHrnBXMmGuwnJWRFyVHZhemmNDJh5GfXcSpMBBcIcSCFG6MSotrFOadUivAIFRmzNT7z9VafzYFHvNbRYCmrtCEUcDwLo4HoplcG3x3Cv3DvayDsAOxUnfq3Uw2G48uzAOZ93qQMc9pHFfndecE9or6CWgheQ5kUOzpPZW/usqxC7b6m4pET9dFTMWsYspT4srapCL/sly7GDAJ5ZikA7CAFihYB8LA2+Bp3fO748Voyzycbldzp9hnBmveRtw4wYBwqxwmB4WYEyWWPPyIwuSEPEEaJLPbosrAr4pe+NsaAtsDHArHjQu3bd3YCOTg6AJzHCYL27mm81Tw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfQphhKDEDAYVefUfzHIzLvO254sawuBw+Pt0V0VvyU=;
 b=yK1fND9bQEkZZccOeWD+bYFa5ydgMvX6Xvt/MaifARz659pniQgSgx7r3rEvtawcUgi5zAseGnL3y2ZmxkUCfyGal7UbDtHificTjAMH10oyhubRWA6czXveIHSs/B67vinzhUoZrQU0aWBk3ixH0j0CydwHR5VlUssmZTWnXLDHMC7vu2lvuagehx2JeT2sk4EhcpYMxL/lr0csvEkeYsiNRop53e5f+Dqb0V0yIJtPaR8cDkJpf1vLrKYe+vWyCZiPMld0W5O8OkYExfvv2QESqH2JPnGz+42C1F6qzQqhp3L5gmd9cj9RQw439h0J7tEoB4L+e9x2/CMf6k1xgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfQphhKDEDAYVefUfzHIzLvO254sawuBw+Pt0V0VvyU=;
 b=NnlCvtogc1jZNRWjXwYlmxypgguFWyIwzaQdXhG+mtmh1gb7JkaOu1NB/qOgwEt+WF5BPQ5JuAWdLUFvdMgt0e2fuvcp26N0MCFZF+3OWaz/D54Ww8nmjhmy9tOGmwUrf6SWxE91G4ueAUYk6kBXZPHR9ptU59PABKWrMK4PFNBqskUDKtS1TNVlxuZx0k8Jtu2xWM10DzDzDuWZNMOg/kUOqNpcbf8OfaLDx7b26ty/3j35PBFpVyN/aLIYr6S4hINYFE2/fvo9zuPsyk8xEQuji+UQyNU7KpOW6SZtTBUISmp3wGJVUQpkgcJLIodoP+okYR84r3GCYRGV1z8Z2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10412.eurprd04.prod.outlook.com (2603:10a6:102:41d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 15:31:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 15:31:03 +0000
Date: Wed, 15 Jan 2025 10:30:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: s32g399a-rdb3: Add INA231 sensor
 entry over I2C4
Message-ID: <Z4fUrkNW0rnWZvIh@lizhi-Precision-Tower-5810>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10412:EE_
X-MS-Office365-Filtering-Correlation-Id: acabded1-e341-4f3b-cea8-08dd35799ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q08S26WEyH65mNSPiqP2uT8u0sApd3ewydbUbG3xooj5voU5e1b79nkgmiUb?=
 =?us-ascii?Q?8aFYHiV9I8yNRQvFJZgdV26vfNkLF3vOjO0IMhOFzSgUzSTwXxTykhZ2RCUK?=
 =?us-ascii?Q?3H+ok2KB3gXiKAwkRwQar28PofbXJZhVtI+EIDStftJwf3/VIUzS8DC3fOa8?=
 =?us-ascii?Q?iE/+pweoI9j7KtEvP/daTepa1IRMFovscSZNHv1cQyAiUgS+uOQsLDevoYVM?=
 =?us-ascii?Q?zSayPd2k+reuw2w8mLSwYZN8VSjY6KGY/Lvj+NxA81KKLMt1sIwDDSEVWcWn?=
 =?us-ascii?Q?IqYUIELTZWNnxbWShuaWl85E6HxGga5aTl+bX8haTmgaW+dZfwG5Kcfm2tP6?=
 =?us-ascii?Q?ZRgzQ82D3K0NGagbZMJ9l6yf73Ll/A9OlLJjtyMwfydv8UDUofYqOGOvMTUy?=
 =?us-ascii?Q?eyAuepsHkRh3hd9Y54hrhy0YvNm6pUd6QucCn9ulzzr5pKfxlqGeimI3+of/?=
 =?us-ascii?Q?QthVwDXb0DFvZDfii+sNiUNIiMFiwY08N1ET0LqfdA2weOIFsR3aD5anra9x?=
 =?us-ascii?Q?NMkJ8QrJsLrp5El4IqrcaR68yr9Edj3byY7Z3At9VPo6l/qmi9XQEGuLNum7?=
 =?us-ascii?Q?21CMrEDPp7qHHlaiXZclADEkEwudgRizALkQWxL7BL8ppopsYbBb8o+al/u0?=
 =?us-ascii?Q?LuqO7svJGn+x+kAutmHjPOe7yQkIKU2cwgZp/4fBWN6Po+TYFQ9bmAXkMDr0?=
 =?us-ascii?Q?89Li7COxApv/74n4OgSuTRzfXA/jctCUTZDBXkfDdmjF4KGZNmCK/sntfsaj?=
 =?us-ascii?Q?eOv6Kl9OUYVwNPKI2keKU9dpiooZWIILk5k3vLF3GSUtj3UESRAURiAwj27T?=
 =?us-ascii?Q?dpmrC+T/vnbXPqL98o8z9DmW3mEhART4Sv13WOVt2wNl+QBVCx/5Y4ycAi6H?=
 =?us-ascii?Q?NmL7R4temjxf4Hhv8N5wqd/wAJP/PSwMH6lwCPQYG6RzTJ+MRqDXugYLRHrP?=
 =?us-ascii?Q?ImU0laSDaExhQy459du0zdAQpSFBepP6DvvydBrEwo6lx+ey4AkecWuQY9wz?=
 =?us-ascii?Q?Fz2H0KQvOMNnTIVFm9rsII8USJTmbq7dsgtIy/8Wmq3tgUZ2PhlfKJ0o5NfR?=
 =?us-ascii?Q?BhV1bMnGi5e4HBCmg1dXgK4F5DAzO+Zr0b7W7AH/5djC5MaR/qbA+iZoNrA5?=
 =?us-ascii?Q?XXaONaaHurZiXPe1aoMqed4g7QBnB0SRhWUQXFqBWvOeYL0hvcYBNvLA5Bz5?=
 =?us-ascii?Q?ywch+iLPiN4DxFzFHRHoWc20vKCCiKWJpSN2bauk3A3BRpGEZgptddEfJNMz?=
 =?us-ascii?Q?OeGH4PTLXZRToSu5vX26qsppy++RvQV2mm4qgA0Ogf/18wys2wb6g9dHWyxV?=
 =?us-ascii?Q?G2ODNMtKWg6lAxS7eKp7kVUfA2oUb4XxnVMFxlF7NxkK/Nio8DJTk1VWmLxx?=
 =?us-ascii?Q?+zcGZFXvyGPgEm17D8TkFMmQhMZfVptfOr2h486SIz2yLAK5q08S7w1ct9Ip?=
 =?us-ascii?Q?iDZBLPdHoQLyOFurUGy7vqj0ACwWpLdA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nio3tuZWQjhCQbKN+KeZ77Q1UQEUB6EGgWhSdGIVYqiNL80GdU+j3UcWbh5r?=
 =?us-ascii?Q?hGLuugRWPKBwYy4CdHOeE3m3Bi+jKUdhqaSeoxrVW/RtookwSS8hNsDyO23Y?=
 =?us-ascii?Q?nG+rx7SN83GAkxaHcGV9R/ZBzIGk53anguF1+EjjKf+5AXk8jpLxNX1po4wR?=
 =?us-ascii?Q?8BHdE/a3VxLzK/OOQsRi75nCMhnuhzaS0EsNvnV8I5lWNP7tQnWMtSNMs/mT?=
 =?us-ascii?Q?aymUw7d7rjuH+3pIwJTE2DJn0dBZ+S+VbXTacyqpc0p97tfx+XQdZrrV4j7N?=
 =?us-ascii?Q?PgF5Rnrmed6FNMt/Vr0J2+vedg7tsNnqSpELuEC+g+gr0F9Cetb9gmvSLEO4?=
 =?us-ascii?Q?u7BMSiTO2cfz6RZNeZvhQOatB0bEbQEOxaYXjhHmmmtRQvKxi5kL6ODJkZIz?=
 =?us-ascii?Q?uExODR5cWnMrLkcqPXhnWg79eG7OSN/SlrWmCpiHCFzbNKroT7NIMfZ8vJTN?=
 =?us-ascii?Q?plGNippqvW3oCVso24lbsPGJrRIVpm0J7Fn8u+FhzO0lPu+Rp97T1XOOyygr?=
 =?us-ascii?Q?RrSP3oJBkvzri+26i4M+ortxCvfGUEBBOARXpMvWqMU8r6Xhsn+3Go2n7ytE?=
 =?us-ascii?Q?WH3stxCM3UpvCoDrLFKD6M9gJF4PtZYI8nRu7+jZlCRUQN80UleTKQC94Yiu?=
 =?us-ascii?Q?ikxmmATMLIkmNjBTGAN41YmOHcsbPW81QOh9x6skOVT1zXlOqbLsSdiOhWi1?=
 =?us-ascii?Q?e+BIZ5d9u1Ebs26X7RWIOzhXCa/6v3yLnKYD+MJVwEoxp1iPKhKaGX3CKlPF?=
 =?us-ascii?Q?07AOAiG0p5Qv7XeTmO8F7NuEtan4M/yyGNYXi2bYyZwQoFQI2Imyi8sbDpkQ?=
 =?us-ascii?Q?YzbsHJ0M2k7QPIhvm34FF3tl6J4SWTRKNd2RPfC7eMZdMwf8lIfCtaQA88vo?=
 =?us-ascii?Q?Xtqkj65caX4MgL/HRlYKWhfrDiAe+kAwNgvPeZtAcch+34z+PnQ5zp6KnqsV?=
 =?us-ascii?Q?B6GWxLWA7El+HUXAxa2yQBRBQfzXpzKzPwVWQq387ZMHPtURYsugiCiMtZiP?=
 =?us-ascii?Q?q2u6jCudmOzvF04opGeMbqTXJROz803VwGVOHwmpr4ZOVupFRhl+wYrwcOYE?=
 =?us-ascii?Q?RGek+bUSzgqrtQQZaP0Y4YK8v8/ZXU3mn7LWY/QburVSLio/6ndLc4gt1XuP?=
 =?us-ascii?Q?Wr/DminM++S0g/5m4aIqLiXun1Gqg1P6JOBlBU7w4DFDgQ5pTHtUED5DlpdP?=
 =?us-ascii?Q?Rt6n63M2ZcD5TY+JvwqRrnSR012x3OlNkMD5y45MfOMdksFgoM52zpEgOI27?=
 =?us-ascii?Q?ExGTw20pJZQCzLULPAXQ67Zko1QqsyC2Tv0t4MTBmoEeQumu3pubyAYbcnqf?=
 =?us-ascii?Q?Ll5ZRMDBYDu7GpT9HPILP9dM8q8mc14uy2bsXHLxYLxjp3Zg195eONyRRzB9?=
 =?us-ascii?Q?NFjF3mmRJfQaDJhnYoyg011fmJ57jys/VIKoFh9dpmXQIl3G6T9I2QmMWR11?=
 =?us-ascii?Q?QsmU/GdBzjGBCd0SSjBB5gI2fMzaV8pRoAnv29nEfRX4nIqgamx/I6V/B6Ex?=
 =?us-ascii?Q?+EDMBftnVtv3n2NWNLt9euxD9wGHnWZYCQ8uL/ofiGd8tuHF/ux5tK4WTJdt?=
 =?us-ascii?Q?bEswTXMmAAvfy8DzuS4O8u5ja3PbBghOR4ii7rNA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acabded1-e341-4f3b-cea8-08dd35799ef0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:31:03.1595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRfAIU0OePaHOTCwxXXcUBsno5qDUZHml6q3El7/652Wr35BXKMVvZZ7YqAHB+WNZImQHa0LQSlCUgx4FrB8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10412

On Mon, Jan 13, 2025 at 01:05:12PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add INA231 current sensor for S32G399A-RDB3 boards.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 94f531be4017..802f543cae4a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -40,6 +40,14 @@ &uart1 {
>  	status = "okay";
>  };
>
> +&i2c4 {
> +	current-sensor@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>  &usdhc0 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>  	pinctrl-0 = <&pinctrl_usdhc0>;
> --
> 2.45.2
>
