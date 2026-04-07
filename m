Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6B38AC93
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554669; cv=fail; b=Kf6aFwy1jc6ABRYtW1ZstMLeE9MEcIUvlqM+SA5pO45RI0OS6DEQBfitHHZVrujIHclaMYPbI7RosB9NHJ91usCo2mfrTeYCJGtZdi9aqCnrqbRLfI0bd/Mifu3FSLkoFd+0978NUALpWpEAIeQh9eKgOmynwKJjS20dBNeltvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554669; c=relaxed/simple;
	bh=zl31ltbujnTzDH3/MAi/D37v50GwQwANisA3VYtE0vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r+R8Pb1vxLmXx4s1TF0kxMeJMv9g0OEEiHmRY7AccMKlVJUSNOcGviDahQv+yTYpbe+Ny/n49WPIvW0qZ5XRDGjqKglo/ZbI+WTDO2S5mELQPHBM/OhRQvUR9IRM9eeSdvYIF5xLQ6kUJ4RU7faWED8fIp4CEIOmP6qsB5hdop0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MeUCD64T; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MeUCD64T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFv3P+CymzpKdl2jNFsK2+qaD+JZ+SNWvTRMePkwWjCjQkMWDVWWMIJoYFBQYYy4IVzBhMqo5wccJa4mZGhanHHJuL5/JCgvUmnSDsQEUGiKKt0QtwmU2iYAtGqnhIPdykYXMaWMgqzyiXQ7IRoyC51rhh5I8GfjObHufLYCVL+yEUsOPvi8jakuIskrO/g6z8wofMLlRdUF8dHYR18JYlTqIQ99MWx5e32XI608H6YFv8iw4zqy9KWkxa1FAF5mejxU5EP3fSzwMGg0eRZwq6prDG/xUj8tb79ZlBvOTcZLQIceYnFN8kWIQcsPYlm6ivX24HCBNQ3xHjPYXUifZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izqnojAereU6NoYHDvleyKbmjuUbI0+E9irMDd3aaHg=;
 b=NLMh6YNvogcNYu/eLRIN70KTMTlqXZgdwxD+Im4yTrlZX1yann0PP+I7zxBvZxoarQLk+yiubQtGvNWH5SYsYnzzAhUWoSG3H3EUH7ki+wpJHfuUQdEm/cKH/xgSNmPHU6yxLF4NGc5KQI0KjtESu6sdYMXNEmsOQE5uSlUPm/HY0wdxUKWnyqvcGFRAc32qhp8iLvBuRRCu/2C6mojQ1L6hlC2mW8elNigLACSmptimP60O/RPAOfZaM32vMPExM+sDqe7Vbke4g6YVqlRZ37lgWfXyWSmVf2K98ipQw4nVrf5NZNATs/PkheKjW9L/jbKopJebphEcp7k2yya8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izqnojAereU6NoYHDvleyKbmjuUbI0+E9irMDd3aaHg=;
 b=MeUCD64TGKrTZ1jtkQrXfzwN/iw5RxH8simsijFPHc5NDeyqX6zL3O9eS/GwLmgy01WG5fR8W3/PZl5ctG3LxntoO1n6Ndl7bbz7rI8zA1IvBIxLAVjC8HYbQMY4ZZRnMw96uMMyYHSzoIRxl7HDviPKdxAiTI/TX8e/YZj9mejJUSLXiBvz7WpULpU0bu09s2ec+ArowNBWcZPtxnY7XLOgtJtBTZWSxmGLaatwXVCulZyxeiySerT187WN6aBVxu9DrmSrvrPeuY6YC05VsW6BTjp3hjy5C0A5zIYYKCS41XDd+jO3HNkyz87HspyUXCMMzCO0BH8FAadmucreFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 7 Apr
 2026 09:37:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 09:37:42 +0000
Date: Tue, 7 Apr 2026 05:37:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Florijan Plohl <florijan.plohl@norik.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [Upstream] Re: [PATCH] arm64: dts: imx{91,93}-phyboard-segin:
 Add peb-av-18 overlay
Message-ID: <adTQXjXGgDMI7faE@lizhi-Precision-Tower-5810>
References: <20260402070826.970012-1-florijan.plohl@norik.com>
 <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
 <56b9e133-74b9-4e59-a40c-c7637c080fd8@norik.com>
 <adMg762HH4gcuWyq@lizhi-Precision-Tower-5810>
 <707e106b-f444-4c26-9816-c53c8eda8cbb@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <707e106b-f444-4c26-9816-c53c8eda8cbb@norik.com>
X-ClientProxiedBy: PH8P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff48412-8233-4680-6f37-08de948950d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|52116014|4022899009|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Iejq+jOblpHNe8lNbXT7ysV35sCCgE6ifOO11nsbLrkGSRvAgNgd1v1wiIqgoN/9MibgjgmRCcvY5QL+IPG+UlLlRwGpNVRvh7ANCsCkn8ZX47PKgCLQlCAZ/tumhqs//fbT8LUHJA3fhhiD9941HiXjs2a7FkAW2NoGRgUWi4Ik3pvum6F1mOqu2qfI6d4DzA8/DNfoqhj3Shf8VRm8KlKSWYo0rWAS0t0ee94pp96ubkGzN8+ZqqkWhmNrv2mxvOtN15l7tinCLHNljPVZoF5qdJCkz4DBonqtWClKVoqznP1Vje4H4TcfkZhf8kUuaizLjRqs7UkEwvseOgUa8xLLu9+EoxI7Eo3PhGAnyoWpEvoNVXo4EPvYWbJfN+9xd4qAQ/s0NG7h5vHmBk2D6EpsQRCrFSpn7hgfQ/wnaOtC1yx2JPf3E2ubyCAxtLC7n0oKubcQHpnqWIs1aszPV+ffkU5Ps4w/KGY5C7PMe7LZU8A3cFIY4CoK+dVPc5nPh6OyEw73QgTW/Cd2JLzIObY7/Ip/XcMwM0wcyNZTAfzQ0lGWs//pBNpc3n6V0tOz30VeaL1RgMoKzs4z7R+c557erFkAbIMEOCdQyfZNwSjssSDK7gr4oQzZ9Cp9e0dEL+u/eunRo0IWVEiojIsS0ZiWMPxG77e3rIRGBkPMLQ16vAFOFUp8VE0PINaDZ2JFhlrcchZevNqm8lzM8iStvoMWTb9azThqjMxIeG69wsTrznXxrKMzk25N2f2j0ulvp7pJrOtRIlqeycpC2gMLMwUEB96DdI45sYbJjqZTJUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(52116014)(4022899009)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M9fQSw/1Si8rOtqD2coDnQku/BTUosjEOnW6AVNqULfZkUtceKIJtIZ6iiVH?=
 =?us-ascii?Q?2Z1LRyn9nI4lDj1tMlZ3G9RVTkyBt/+llwN01IUhB8M+A9qV91IZ6mTtclTv?=
 =?us-ascii?Q?WGZlQLzubD/MPxP0R5X9pi/gLZApH2PPU62207DkXS/YccGpjq+bqKQHi4+3?=
 =?us-ascii?Q?PN2FSgb3UqQC7zqhf16YGl4sme+no1o1o5sVoqA1aR7cErGmGgtwlI8ELOoo?=
 =?us-ascii?Q?IDBQPCBDeWIm6p77j1QBnG5Od0L5xsbjS+CZaEwBN7a6+Gnp1sM7A2MZlzFx?=
 =?us-ascii?Q?wbyhgj/n1hNSv7dBOZZbULr4VaMMfrjReDUfLbBriNLtW5ttF0k788QMUYgV?=
 =?us-ascii?Q?BU/Yp4/XP2GUjYFR+2T1Iz1DtHYy2anK0z7mtClfqWw2eg/AcUkV14S/umN/?=
 =?us-ascii?Q?sh+LzQ0lDD+CJekyS07KvHWhUjzcJ9sNChW91fqapgsF9eWPrMKfQgMgWlg3?=
 =?us-ascii?Q?Faef7qBRMTpUGUFVg9vS74KDdgmXTZuPj0P50vVn66FyJuBrZ5QnNzGxdu+Z?=
 =?us-ascii?Q?nOr41bpVrfvKnO2mXp0E05coz//w0E9+57qwElHjHmR8XZTsztLvgEHQXDna?=
 =?us-ascii?Q?tb0Mf+4azyrsSosIFxtbtctJXfxVNMRx/cNqvJn4gdH3toGHHtLim8UEh0qO?=
 =?us-ascii?Q?DNEtHRr/HSDcHdRJVn+F4MVaXwUmXv4vtegzUwcmHw749EROk+SLO1QLvKEy?=
 =?us-ascii?Q?iXlTWRUoyZvpCxwb/iT+plrSznnRQud2uNOsRPQPGCxS37L+8wL1jPO6OsCl?=
 =?us-ascii?Q?qWtubALBZTTLTz6tjg7462GflqGQINTrWCfh955fpJsgLQvKaUxizO9vJ0Ed?=
 =?us-ascii?Q?wkupZ3mS1O3qkUKq4xIi9gbFi2K14xpTo7kP+Fr9rFz0pecAc4+n4yHs+vAe?=
 =?us-ascii?Q?3/82JhG2edXj12oqe87tG4CJrh8djM3FOcMrhLjoBsOz4iY8rln07ZIjD9Tv?=
 =?us-ascii?Q?r2U4Jwv6bGCs6tcyctm+G/TP20FQeVzdv/ddpZZjsu6huqHAA3vGKVuhYm8C?=
 =?us-ascii?Q?ROKusok5607ClPpJ69PcFkYTPafRE3soFHdbZs5w8Q/cUZUA7u6mLeEz4NuP?=
 =?us-ascii?Q?xnHXf4DRBQORGGYqJ0G2nA/T75KSNToeyY3lgyoH83uW1792/kVvae/rO8is?=
 =?us-ascii?Q?h//z2FCy1aEGGV/8n6PTeqeYxUPZHyn6OnzfC20N5NL8V5gPuMZ+OVfb0b7i?=
 =?us-ascii?Q?mVuSLs7M+yEvRKVgkQJSNpUttXy72vrDtgGaRG0XQMVMVXiZWzWu3tFIN/qi?=
 =?us-ascii?Q?1NPpBtEdnSNQh8J/cL0H5Mch3VLDf4Mdw8/mOL0ATu5hppdWonazfSh7h90t?=
 =?us-ascii?Q?7/t+Q4wNLOZp2yuY2TKOx64GxK8hPhA+wTGlaszcNdKSNejAudAGqG/KQsVM?=
 =?us-ascii?Q?oSPniCiaHcBxCVCrnlD8GIYkEnpUg4bKEBj6K3uIu+B4vqfgfT9zVzVDcgz1?=
 =?us-ascii?Q?wsx2lwtN7aRycQ86tBFxOjX+utnbIS21zaxQxAHMoAun2+U4go7j40BIFjHS?=
 =?us-ascii?Q?pxSfT5/VBSwF//ZyZ5Wy//q7lEHflFAFIIVpzlQFfimZpztVFse+ea/KqfQ0?=
 =?us-ascii?Q?w4STRWBjaW6OJdLF0BVsgngqGk5PezZ6ni7N4TpXBLV3Feyy0fPlxgqxaqgL?=
 =?us-ascii?Q?Yhb28ctuumPSdjM/QU9PfKatd+AKEATS15m9NbwYKUWOUQAhvtBWAavFNyHh?=
 =?us-ascii?Q?AhUWQ4ykoy+sv+ZnK8rj+kZ4fd2oBUDdQve7LZdB8OK7l1ut?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff48412-8233-4680-6f37-08de948950d7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 09:37:42.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHfX5z/zqUHdaMw8wn6teRitBTmmVNsrzXWeGgajhuMK2cbau7dc75NAWPBmdYTsw/GzekP+k4hto/H/Gd/3pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On Tue, Apr 07, 2026 at 08:14:08AM +0200, Primoz Fiser wrote:
> Hi Frank, Florijan,
>
> On 4/6/26 04:56, Frank Li wrote:
> > On Fri, Apr 03, 2026 at 10:29:00AM +0200, Florijan Plohl wrote:
> >> Hello,
> >>
> >> On 4/2/26 15:50, Frank Li wrote:
> >>> On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
> >>>> Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
> >>> what's means PEB-AV-18? Is it random board name?
> >> The PEB-AV-18 is PHYTEC designation for Audio/Video adapter modules that can
> >> be used to connect displays on their boards.
> >>
> >> I will improve commit message to add more such information in v2.
> >>
> >>>
> >>>
> >>>> The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
> >>>>
> >>>> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> >>>> ---
> >>>>   arch/arm64/boot/dts/freescale/Makefile        |   4 +
> >>>>   .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
> >>>>   .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
> >>> Any difference between 91 and 93, can use one overlay file?
> >>>
> >>> Frank
> >>
> >> Can you suggest how to do so?
> >>
> >> There are imx93-pinfunc.h and imx91-pinfunc.h which are not unified
> >> between imx91 and imx93.
> >
> > I suggest move pinmux setting to mainboard's dts files, which provide
> > plug adaptor header, signal should be descripted in mainboard's dts file,
> > which provide an unified label to overlay file.
>
> Yeah, that would be one way of doing it.
>
> However, the phycore dtsi and phyboard dts are kept simple by design
> choice. This way, all optional pinctrls and peripherals are kept
> separate from the board device-tree to maintain clutter low.
>
> For v2 I would prefer to keep as is (current downstream implementation)
> or at least use this approach:
>
> imx91-93-phyboard-segin-peb-av-18.dtsi
> |
>  -> imx91-phyboard-segin-peb-av-18.dtso
> |
>  -> imx93-phyboard-segin-peb-av-18.dtso

It is better than v1's method.

Frank
>
> BR,
> Primoz
>
> >
> > Frank
> >
> >>
> >> So we can only create common dtsi like so:
> >>
> >> imx91-93-phyboard-segin-peb-av-18.dtsi
> >>
> >> and still use separate dtsos:
> >>
> >> imx91-phyboard-segin-peb-av-18.dtso
> >> imx93-phyboard-segin-peb-av-18.dtso
> >>
> >> Is that your idea?
> >>
> >> BR,
> >>
> >> Florijan Plohl
> >>
> >>>> --
> >>>> 2.43.0
> >>>>
> > _______________________________________________
> > upstream mailing list -- upstream@lists.phytec.de
> > To unsubscribe send an email to upstream-leave@lists.phytec.de
>
> --
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
>
