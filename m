Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3896E43FD22
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039902; cv=fail; b=n+LRThKtjwJtNxRSfP2SpBxy6i1KttlpXMaiWB1XkRhO2YP+/45fepMRtJ1f3qt7EZ+OKzFtyTtC9jh+DQbmrs+OR6Vv++bBD+bfLw5DDRWxmiIWLn8lEZbD+vyG4V4RDyZxq9jE+dWDwv12kRF/wvKoSkVkWNM8okMbwui2aII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039902; c=relaxed/simple;
	bh=3ZyT5oFsfXcsrzjCXJBhorrhyPuSQQdN9Y04fosAuqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cfCBZ2oeAhA11M8PYqsTu0EhHEuTfuJIfxtBTahQ65J5Yu0WD0spqVsEcB2xfxCxzWrubjBrOhjVve0vosiDsxU9TyfD0gprCT8yjk/dwFb53sexyGfKdpiEB8sPSohihKFukH3rIWb/Kwhy7XwOCMidOMVlNqLzti5TE62B4Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f+6NLFB5; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f+6NLFB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWsGxbdI0mNNcBnrjo0mbi4DU1x2xxq0VUuHI79AgnGS/SiEMuYNBoog7GPJMfI0V4M75i1wdmX85RssEc753W0MMJzAoqNAJ9nVPdbPN6jVuh+wvVhSvFvk5d/zajFYSZh3Oz2spqxLTTxMPHu+MiINCRviz2K0Mu+x6QuhZ1dZY2saD9VOpajurwOHptfrWqqzCpCBIiMCicHplfgIitcRyuSfM9ETHNQ+uTap/GNU52UDEb5c5CWqB9Ci9b55jgdipoAyuNcIMW7APC2Esko0EfDa8VUWuxCy/Se+elC+NBiNqntHX9xn+gBaYXoeyPEPo5JbKMU6b9Gi+yZvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tTmEev5SELNaeKdzfBV8MycBIf60rUFPq+eXzQqTdc=;
 b=gNz8xI0UhL8dzo937R16DuEDwQPsYSUlLRwGTm9d9kAfTsxDcDYsgzrosXiNZhDz3y41QCOw6yX1zDJ5SiUgraXqCf/hO4eDc5C0Ma2vTNrXVKT4WpZM+3f3MFIyOe8P9P8n1Lt0DR1JsRwHcPCUYCiqQ55bFe6nQx+mMAuykPi2Y43KtaJbrFShdGxErDbCZKfM8IB8IRbnBX4sLrJXKCqEGMvw2EZCpU7q43BLQNUcaekqmP1lkO5rBhcJ9icMFWX0bb7DMfEAAc08LemreN3CZrCT1dCPKeU/rDedkh8jsTgJUfPwAlRBdiHsVUuHtJmLllWKh8sbU4fERoYZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tTmEev5SELNaeKdzfBV8MycBIf60rUFPq+eXzQqTdc=;
 b=f+6NLFB55rSBlClUK+JeTRL5Ax+1yRRKgzdMg/Dx5zj06LwK3OeWIm0AJYbhdBUh38y1vG1dgYhzWHbaZvPTWmowukndRj3yZyGtUHwKWOQIrB7pMgIOxpAnahD+f7IowDrg7I8SusXSc6WbRYzwg4mInv2bUGc1wbBEIZEprdaIzUIOOcZOzK0A/iyAqRtViwGjkePABr+RgMNNHJSN01TtjkoItvpNNJNvHTI7q/2/iQgLFi3ZDagA40jIdCchP0qyHVskZi3hAtw5YyOp/X/aUY0niR5uPtBorRfSt/jOINw8vWFlWB4hDRCTH1zepNWQIglvW8HkBL9C7iy7nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 14:38:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 14:38:17 +0000
Date: Tue, 14 Jul 2026 09:38:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v25 0/7] firmware: imx: driver for NXP
 secure-enclave
Message-ID: <alZJzKHs8w0UAw_z@SMW015318>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <177799642393.1381528.2137639571938103661.b4-ty@nxp.com>
 <73a5b9fd-aff4-4ae2-ab2b-d860bbc7325d@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a5b9fd-aff4-4ae2-ab2b-d860bbc7325d@kontron.de>
X-ClientProxiedBy: PH7PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:510:323::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: ad32899c-9cd8-43dc-9fb3-08dee1b58b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|23010399003|366016|3023799007|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qdvIFlQvhKvVA17Dijym1yr1AgfUmSuiB3JG658Zmyq/GybT6ANMaHDbmrYhVqP4U0iF2sc1DDc4/cWp1m2uS8qu1OXbrT6Fp2NPte2qq8W+ZW1ood6LPQwwMF0jYDHsbFYXWMxkkGSpogiZqOhB3UJZUZYz+poNsbex4nUs3e+tEntKIsfuLldOEg/VDCA3LFKDwAJ21IvyDP7Zq01t6L99REDFUOI3kfsLke+xZxzz32KVRkRZj9FfLz/kNCIJdVQTcLYF0iPtcWtjqzR1lPkGDdb65CganQ89TE0woc9K6wximJFrEkh22CoHbW7ra+X/43x6HJMeQW5LjhitramLIVffW+MKEUZsO+86axm7b0MQZt0IaymFO7v1VszmmV6PBeUTTqbfUkSMvVNgWxnj+09it6AvKKAF0xvfqQ8P9HrnbLtzCXrJHNU0K7CiZ19TnQypUQHGMGIgawFgzt4+9mGpJS1ud3xBf5+InJpza4XmsnvlUntMLC8gI035F7/J1avk+xc3ZkYws0MFQxrpttNLU22DTExHKhV89XWQRyU/1KGc7HtC+9GENCD6XKzCHO5qBrQxoypqwTZLF10IZsAu9NipINGzurCRVTKDiHaz3pvsk2++Hb/ThyDEKXF1Z+qGg1/1/6e40TEQLtt6ORrY7UCuJvWnO/J+MFE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(23010399003)(366016)(3023799007)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sgn8dul2RNeCE8JuJb4Uh2JbQ87ZOWlcnn295P+qpPElgWJslIN5qW88b1I+?=
 =?us-ascii?Q?oYidqOq3WUMbJ22klmtTzSk//FZFzeHfRFxZ4e+VhqzcJdhzcZYEvTjwiY4K?=
 =?us-ascii?Q?YgbNcD/QS433HFIYZfLbKZ7lGHSOLkkDsHwpSY/71Rjl3iAKvlQdsBYL0YYd?=
 =?us-ascii?Q?4oiCsJ5DIQK8uu+gflHnku5X5ZTsspTRKOsh+qfxZDVH+VHVBSDaulxoEsBR?=
 =?us-ascii?Q?LOnU2o+FjymboG3PKfx8FZsf5+Pb3LrADttw2Tfdq3KOPbDb6loubgzoJrTm?=
 =?us-ascii?Q?gHg2M+aLDGPgpn1WIkhEc1KwITJnhgQJsialJ/8+PNrFt3gv42n41AwnERsZ?=
 =?us-ascii?Q?IdpuETMrrivXdq0vclyiCcgNyva8KykwS8lRelZTMqchh5QNqGbEtpcwBXMd?=
 =?us-ascii?Q?c8BGeVLuly+LlpnuBMNLljWEMRz3/3+qI1SEhD/E9sJKb7tXqzU7ZrRRgOER?=
 =?us-ascii?Q?UyWpkM6sCIRNZ8EjTSagnCPOVCiWPVhoqdSrfNwFikyYnNXDkuOFC6s2TeTn?=
 =?us-ascii?Q?xzjRCBTHVIaiOKyEPT6FgpUqFaWes4buE3H10I3DV3CAXd/0YAjKTYgfrCtH?=
 =?us-ascii?Q?adIKrytwcKXe5t8rW2Y5FFDOulNyOrhcdJbOknPpkpWUQc5QCc3504+J4SwQ?=
 =?us-ascii?Q?4Xlmh/lZULWHkR9x3353tMEdNzSZaNAaczPzZwdBKh6fmfQH7FttsEIiMk7X?=
 =?us-ascii?Q?bYQzTX7DVVMCquiQZu7FDD75VFBUhib/aM2UGMt15z0qz7QIEMocJZDTG9Bu?=
 =?us-ascii?Q?Lo4UufPvpZMDndgkf4Hjbmb9YygtLsJkl190oEW5KKCiwGbLlrB4U5BkGYFq?=
 =?us-ascii?Q?hA/3PFAKzHEv8pcyQDNIqpuhF3yEhuWj801dq2qUjUf06Jk4To+E9NERGSmY?=
 =?us-ascii?Q?ZJFk+tohPM8o6pHDk224w0q6OveO6Nm5fwa+slPSfoNc9ym2IRFgeECASCEX?=
 =?us-ascii?Q?NfxxSdaCnmL8z0cLdBNUlq+bTPFpPQXSFImpGaM+EVrnWhc2ufJtm4fCgtBx?=
 =?us-ascii?Q?9yEDmViJ8psnKoitUG8NET7QGG608uGDuLVC3BrgrSL3Kgl/FH72RjkbfuZd?=
 =?us-ascii?Q?ksah5XYS5rdecqPodven4Ak3pGl/k5jfMuT6bdMGY+VINjlyz8ypmFRogZah?=
 =?us-ascii?Q?miG4d9Tbtd/m5PA7jndbo1kvz5+GAoNX0WDgnGUVwBXFArzCCB3QwEmD65Ss?=
 =?us-ascii?Q?eeslOZyahkDhImf5M0TP/y8rxD+aG1xjGpYexbuU+hT4VApf7X72WF0Ax66W?=
 =?us-ascii?Q?oU0/vQCaGQc0t5K8ztwhS+QdSLZZMljEr4G6j6tk4i3PWQMZZjCqWrEm0JZs?=
 =?us-ascii?Q?JKemCwGksudvUmyllRUky918YY8Yw8R7jz7itjkNjh63/4e7CKc/FNJXYn4q?=
 =?us-ascii?Q?+ytC/ciI9FvsS/raexNzAUFS8LvsYkXsF+C+7gUyHr0qZksatFmQRViSMWnN?=
 =?us-ascii?Q?I9VFUxCZPNjJHyFlu7g6AmF1KmM1gsp/8rHBWHSB8mRiAE63EONgeZSfV7Q8?=
 =?us-ascii?Q?BJC6HSPByhcd3MBHCpq6hKv4IArMCztBSKyHrc3Fl0GvY2tE8TSjx6GW/7sM?=
 =?us-ascii?Q?SVPF1wYjyBnmqyXe7AHdl1Og6q1ZRw7GUfefFa9131yyE9/jAyzdnXHNFaE5?=
 =?us-ascii?Q?ywka0HdgSevMwxHSKDTkCB5MTrFqey6lS+ssUgUSa57rfj2aR7IhDOid9q23?=
 =?us-ascii?Q?2BHZ7s9qDJKcMHP85znGGNwpTbzlaLfkP8LsqBvt9g7oyDDaHYCOIBmd6IMc?=
 =?us-ascii?Q?7BjEcn83uk9RmYI+o9MJe+IR3xQpQmrjXzVz98WulGhKAvCPha58?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad32899c-9cd8-43dc-9fb3-08dee1b58b16
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:38:17.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmKHYb4ZEdpynYGHNbgatMnA8VL+RKHqjLx2mo7QDl9bZxaoNXYrwGhT+naM6bsDlgApG3Pe0PMg3t9Fjd5AJ+S9rYNbaqTpSQpGU4rzJosSinX0P9untki1hft80Z50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340

On Tue, Jul 14, 2026 at 09:27:06AM +0200, Frieder Schrempf wrote:
> On 05.05.26 17:53, Frank Li wrote:
> >
> > On Thu, 22 Jan 2026 17:19:12 +0530, Pankaj Gupta wrote:
> >> The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
> >> enclave within the SoC boundary to enable features like
> >> - HSM
> >> - SHE
> >> - V2X
> >>
> >> Communicates via message unit with linux kernel. This driver is
> >> enables communication ensuring well defined message sequence protocol
> >> between Application Core and enclave's firmware.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/7] Documentation/firmware: add imx/se to other_interfaces
> >       commit: 3b4531c6e0f4c8874f0266853a410438eda1fc24
> > [2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
> >       commit: 4d7bcf0869686d7d7fbf16244453b987e5ca6d14
> > [3/7] firmware: imx: add driver for NXP EdgeLock Enclave
> >       commit: 338529a73c2bf2c277013b745cfe6f19b84b70af
> > [4/7] firmware: imx: device context dedicated to priv
> >       commit: 2d733ed67f608ee85abb854157011f88d7f280a8
> > [5/7] firmware: drivers: imx: adds miscdev
> >       commit: 4de71839142b5f43846e3593f4eb236e1d733885
> What happened to these patches?
>
> They were part of linux-next for quite some time (up to next-20260630)
> and then they disappeared (missing in next-20260701).
>
> I didn't find any hint where or why they were dropped.

Sashiko and linux-next build found some issues, which need be fixed before
send pull request.

Pankaj is working on the new version.

Frank

>
