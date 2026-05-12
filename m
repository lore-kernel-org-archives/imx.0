Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7DD3AB49A
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596009; cv=fail; b=lVhWB/7D9a1aPXd6xwpXejj7Ap8yC1n/3633uiUf1PUFAXnCgYd0FAjdV8++2LjZnLHLg3WyBwzi4O9yjClM23pvBjwY5JqTS1u6s74TSFJvk86dgR9HrlSFJfrEN9ztW7uSIH5iTpVTpFLWAFTvOAYk/W1Fl2W0cc1D0YnG3IY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596009; c=relaxed/simple;
	bh=+fINE6vdTyrhtMUr/qHtnc2R52VBq49xSG9sZbX3Hcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gv8goQ7RiBQiNrBNtNnaMdVtvgPOgoupFErgq9EbcgZbdWhkvN0eehLG7d58jX9swG/43sv0j0FuXMROuuqK1z7vo7s12oWaAE+nYuciI2OPeNOdUSRNA+0jYfYEIYT3J4MNAuzkT8Js3dkT0a3kbyskVtaDRNVPkTxiGURNXMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mruDCd7u; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mruDCd7u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/taH7X3zyLdxzX6LyH9SfVIJWudWKC7IpIWtm4ebXq2WfXuIHQ4buYDuYYcWkTmc9TcM6KTNGbn6kDnx+zn26mNj3uBIT58jQ2D1QNbs/BRko79STngw7EhkmC50hHv1ttv+qH1+oZBDnQndunh+wctVBdcqiyN6S4EZOS5Hpl+awtHKMLKzH5BZhfp7KVm0tD5UVccUYQXhZK/k0Yzsm9SfhTVvokuphmA6qmRNid2Q9OfJkMVECGHPAHVCBHybfb9Hjf/On5OVtyWYG+r8kpd/C2y5Ar9aMwXG50WmnJnxjMj8cVgmnCH2G1s/81Vw2uVdc/2wg5LMiJ7bHVR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McIFaECqN57klW8s66rML7KV0/osepmjXuv2doHcvEw=;
 b=Lddnyo2c69Cin4q4nmxprsWxE9K65PXu1zuqy3TBU2xFf09ruEOuH20iHEo+XO4iulYa+D8JFqBpfuON/D5+c/qrUdbOfAXSgxXjPMFbu85zufHvM4R2wfF0dWRAnSw6UMHaOssyvEBZ6b5AWigF6KsqIIRlrQqQPPM0i5hirAzisRMPRDaiqQJLSjpcGmK+OoCeR1ty7w0KEWhsDHg3NqEsIMf8SrjFVvpPVAf3q1ARkWCkLHj9ZUOTNjZ764ZblrpjdlmWX/xBtmRLct1gMfv12IztCpeoyhhdUBI+lzFllVl9RJ7ETvYrahqrqFsvNBooq3aBSFYoL4gWelRTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McIFaECqN57klW8s66rML7KV0/osepmjXuv2doHcvEw=;
 b=mruDCd7uIjv6BI/rmnBSBSahSELcRcn6Y6cVuU8b/HcsiYgtumoGVNGQ/FXT1CAY3JI58mwQYW06NLWpDhOhWJBCeqYq8fu0xnyKKoilKV/CyqB7aLIHMK0nZXZxq8S9g8M3LwNPTFCqLNWhBXxmUy88ZjOBbNaK1DlU1X8o9u9enhun8Vc4MlzjTlx9FO6OQIorTziumrGBiMYhb7XqLeFG2Eb2sJz3hQZYdxJ9VF2otPesAhddADbF/ZQO/khasYeOqMiTc3ptIgJyTgu5SHWGEFLzj0DZ/CFKzR8JU18xAa1hSCJ/JEuPs4UwzeKOIyrAk/JdF46plkvP236/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6772.eurprd04.prod.outlook.com (2603:10a6:208:188::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:26:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:26:44 +0000
Date: Tue, 12 May 2026 10:26:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <agM4nIJePil5N43D@lizhi-Precision-Tower-5810>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
X-ClientProxiedBy: BY5PR16CA0008.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7054d6-3e9e-4db1-77fd-08deb0327e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	bl5BxWJsggpi47Gt0bRboRKJmmlZcNd18FmyLE9F+p8SXzjKbK4uZrhCTiQL26MQMLbxxXpxZ+kQD/KExGXKPjzYc8TGl1VQs72JhuHkWc9WhqWZDW/Ha+RVKGNJaeLySuYsiuZ7kPKkcuEEcJe/rsHQBL3jB4vDrKi1Vz+xEXyalHlZSBHgGenIxdColldLqGLKTNSo5OT/XUK/B5h4DrjXivLHAT56EUAvXWaJswK8LrfBdaC65DoD+WBVHpYgcQ7Lr8tuVmSAZkZOwrZF9Z3auM6e2sk6DQaQ5GSRbYkloX0ebiQLipAVIOez0WLEfoLPb7xml/SdClIdbGbSNiweSXccGqZ1C+EzMWAmuLbVr4WblSvtfUrdJJYIPNBl3JDKqoFokd4e0+3IlpJdNudAwolp9lFTNL0YVgWJVkBEaxPIjCLzv0FbvX1Q1YvwHaP7JCbdR/RzFnnv4VExtwVUuot3S3n87UJ3kMRDe9C+lxcFRRxMWxpJlJjfeCoRhCUIrkPn6Y6+8cYhNu3katjr8Sys5FSRvC0KfKUbo2J/g6+ySFX7F8GtTR3AndKTtpvaVJJT796KnfrqeSKmFehie5zFk4tqwesXSzivimQWBjmJFrTP+7yGfJlJi2SEACdCIzmuULfKpmRAvFUG6tos3LOGXliueHBCQAkVWbsCsLXEDCDkjhwu65/lRHJqN9paj83O0tr6pG/2SdFx2zemp1yI9oBnIdRKrGrk5dlVKVEKdAMNOUrwEhzaxM8M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PCB2j98Bvu2btofvOEicU+XLmqetL5DFgSpu54oCsvQKOqhFT4yL6QG/4V1H?=
 =?us-ascii?Q?AXQeNdSXqA3b57tyrmSls82qHyc42iwvSp1Zp3zyFbARl8v6cqKfZ+pW1+b3?=
 =?us-ascii?Q?eKs1Sk6AnD+vVAgrx9F9XUI0mxRQrVB8cMpyNeqkaFwrUuCcxuWWc3P3d2VG?=
 =?us-ascii?Q?s3q3SC2aFmwBv3OddibmHpEliacsWJIAJ0WN5ax/bcsgsYlIJwoTxiKzrbGZ?=
 =?us-ascii?Q?MzGRXz+IejCAS25ajLn8xfzPxsLGMM4YE1VSBnQZNvyrfJYRdwB9Zfj66h9d?=
 =?us-ascii?Q?2UXliKNgxH5sW/ZiFomxyrrCNO9TxyC6W8FTMOXZPLQiS6Gtqv6QMjpr9yuE?=
 =?us-ascii?Q?iYnNNUUEpwUXGep+FKTLiPEB0oLbbDbG+vyLVuqlZsxG9Sf5WJx5lP6JTqx2?=
 =?us-ascii?Q?0C6AmTKh657H6xhSw+9JQzzesMCWiP0ZFQnePf3RGQRHHzgQspO34eP7r9HG?=
 =?us-ascii?Q?Anf7siC2Oz53dx8+Z9W6Q+m0Pe9G+tivlHK+/gRDgpWV5sPYpWcbHsX5vljy?=
 =?us-ascii?Q?igyLLX7du0IBdj1Hoo8GcQd8pATslGOuAuYQ5UnK29UjU09hpE5Yj2CkuSPq?=
 =?us-ascii?Q?vg5Yt7TnIxIi5P1R8w4aq39XNv5qTZd+Oc6wbGJv5f2E6jRuuibMIvLSnyWQ?=
 =?us-ascii?Q?l8c60sTXoVQcUB0PUVcMZMUMstG0OjuDLNavlfSB5qWIhCyK9a8gSae1xMcc?=
 =?us-ascii?Q?UP+h3cAajrhNm/KD5NVlci/C2Nkwl5DPlR93z/BAq7mKM9NpZ3xAyad6ppL6?=
 =?us-ascii?Q?pst/gpw0kzsHz6XJopHzF8UgvD/U5akVKLd98eiHDgajdP1L04vW12OzANDG?=
 =?us-ascii?Q?Srxa32ahMxaQUKK6lLSq02FK2jiLQtmVX6tbb86GL0T2zJBAvgVl53D/C2qh?=
 =?us-ascii?Q?QSM6M67o5fUe+yheUmPT5eJQ+Jp+7kC+BMjaN87JO9v0vojMO1kxPt0i0uhK?=
 =?us-ascii?Q?ThWmEban/NMaEnYrZVrlyDOy6xMfBNAGIVmJryzqdDNwVutFucC5CK3g9UQI?=
 =?us-ascii?Q?Ze5prT1+gsrNf0Mg1KgTL5sjCNsIdXrcMexce0fxhpgc35J9sRfZEHzV3qsj?=
 =?us-ascii?Q?AoXyiKIqxMILS0R3ZE+vIo36vJ4RN9+b+2zS4gkyBIjUVb+p5cZ6KCyEKESh?=
 =?us-ascii?Q?j9YJsE3V8UzeHGT+DZwaPINF93ayVEVih5evvjIBcqXRLHhrg5i++gXXzGG6?=
 =?us-ascii?Q?pP/T+O+Htuqvcuzot+pyBIbS6qY3oVsNAGc+mLMcv/wcBwsKPgwb4nrdLRAi?=
 =?us-ascii?Q?8ZSBuAn8OWIY9r0fDOAKSG1jJ9CtkZpxbtYFiCy72tuZN8vfsyaGvllb7kbO?=
 =?us-ascii?Q?EuNE9T4eqFAQnOmkGIUui2/VBuyL94ESapZaQtpbls90CWJhhQ1m389bbb42?=
 =?us-ascii?Q?UrtbL1quTKFaVD4O+UtWn/1TbAJVMIqeLQk6k4Xxfu/BGh0inF00SQ9+3GgV?=
 =?us-ascii?Q?4Scov21bq7n+Lemcpg3zBhoejNLQSLUbmD8joI/LPwx1FYWAt5XcVLHVUfWy?=
 =?us-ascii?Q?1NIq28ssedSf03bDK+BXwkHZhtWs/+lEBv92+ODdBvhD7Pzqqnn+goPklh7s?=
 =?us-ascii?Q?6HfbCs6ndbOtfJJnv5uyMKNNWyOj0Qp1txuxz5MAo22Drqa5OfT2D14UUNzM?=
 =?us-ascii?Q?9YPJnr5xAiEWe3ZwnmrEhT+4RlxLmluOd/CyNi2i+G69TO0Y29qdcHBFPrhF?=
 =?us-ascii?Q?s1hK7TgP5440OcmU1fFBRBflvBJ/HcgE2mP54RG2kCB1mwF9TaIqBlNsGhbT?=
 =?us-ascii?Q?1CBbaR6RAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7054d6-3e9e-4db1-77fd-08deb0327e1f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:26:44.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ON5VV0MhAkJNE7xehmhdsFnjflYGn5Or/MJb7eL3T8c8yzZIL0qDG1g2oRldZv3gxBRlnlkvq2JQ3ivtbpq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6772

On Tue, May 12, 2026 at 12:15:08AM +0200, Andrew Lunn wrote:
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> > is connected to the station management entity via the mechanical interface
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
>
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
>
> That cause does not apply in this context.

Thanks, I missed understand it. This board is still alive, let me double
check it.

Frank

>
> > -		ethphy: ethernet-phy {
> > +		ethphy: ethernet-phy@0 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
>
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.
>
> 	Andrew
