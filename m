Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787F33DEC8
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309495; cv=fail; b=qo6jA00KQafHIbchvy4FldHOtfYFZ7N+I9/v+b8jWp5t5UutegcNSvFADskqPuVWqDMftp4prBnNcPpqB6ozWHqHE7IBeDzfB/3wwp0TY1Nu/+JkJ11qTkIQKu0hQFe1aDb4OdvLkP/1Gb21X3YOmOr8OX5UCvm5QpqM3UbRcrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309495; c=relaxed/simple;
	bh=hPe7c7/XCFH05tzho5BwNjNRAeaTjSXOL8f0wRE1ccw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EPvej6rkku3y2gCcElcgS5HAJG7n4sIobgZGoS1ewHMdPf3F1G+HZWU2KYSo4ZImdk8hhv8DOAwfCnCZRASKnA+A1urc1dfHbEgdH+MSlbfcl1bdnbmCoQ35zasiSqDKfHwae9fl8GttKVDIvU1BYI5z65SJhN26LYkZ7EFgI7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SPWrw7Oz; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SPWrw7Oz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONKmXnESKILjZKu2jiFke8z80Il+Fv6PtPnsui0ExlK4JPGBVvNR7faCcms9kMle9DwBqNS7ghD8iuHlnhPVJRF/wjWvVXdSLMHbAgSASUPfrsfEMeYIRSjB0kbrlgqmuNB0upDwrD535dcfi+ansNHay6pXZwrR+7ROP6hTuOnKZOeo+VZxcIjbX0VxnI8TcXA/EqqJSgXDzyvjwILk50W2q5tX68xcXnJEN2qRckDRq5Bh5wUBgFeE+oofrPcVGUX1YlVoMWYhltPRftXz949wnNz92QYGynm2RVkzgFMmrHf6f0CiJHOIdeXW8PGIcMBwvXuuKvof66ETt3O0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPe7c7/XCFH05tzho5BwNjNRAeaTjSXOL8f0wRE1ccw=;
 b=K47Nb4bDftAHuT1ETiiLvq0Szt0H+maSwNk8ORafj6xhLpkSFGxR24ocqBWVuKf5SXh4L88lWcU7yUa+9R4/eILoxexi+go0W5gjLNYFk/Rxq9DhyqpEPyeVjuEf9vS+bEMqYpZce+etRuJclFxADuFdLfZfINMFRne3+o0aPNpmamsD8BMVFESGZI5yXlhJ3S0IefEpWeY3aGNZwF2KPTrfWbgsBvnDkEDnyNbZQpefiRcuO7aMZIIrtaadnDENp3MqwSkhRNkXQavhO4uiqJE8QIy61kIx6eDZ+qT4vPFkIPQvU/aaWn0/OOkPGvHXRE/LBEic1dOQZj6kmWJddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPe7c7/XCFH05tzho5BwNjNRAeaTjSXOL8f0wRE1ccw=;
 b=SPWrw7OzvmHcXEcuLMeAANSRdel8+IzsufY0G3uPHVxJOkG5EFSGUbD7I/65Me9NTAPdJBfskW2DhJfUpGBvcvemOrTi/xRZOGEMzFVIztkHC4KVh6wON1aLDviMJOZS/ohksjoG0kLxZlS8ag//d8KlMtNeRDcWF44vud19Up6tbXP8JO7VrtzuQP3fMBSIwg4Mm/qL7XV1X5ev1GN0Nm4bsFAcqyU+EfdvP0OmEavHDDlzjAUCH1Ul3skhiVU5ig7OSxOI1B3JO8GDN1ZLXohGrDSFIRDdYea97h/Lz+qQk5hLDI5Y/xQKubKpdkuQiJM1jr/oeVA7NJnGEA3f2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12188.eurprd04.prod.outlook.com (2603:10a6:800:332::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:38:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 16:38:11 +0000
Date: Thu, 5 Feb 2026 11:38:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <aYTHan8dmq8GUzYg@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>
 <aYS0r9jxzyh1567Z@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYS0r9jxzyh1567Z@Lord-Beerus.station>
X-ClientProxiedBy: PH8P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12188:EE_
X-MS-Office365-Filtering-Correlation-Id: f03645db-673b-4830-e2b5-08de64d4f33e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?n8le4Xg6m3eR2K1yFGIxfk+vmg97ObwL99CeAf2OUzh+/ikh6b4L+abvvU1S?=
 =?us-ascii?Q?9btjmZcaAWUrcn6e78FNnR7CL/01EVTv9oGkvcZa7T39xdlVB+6nZmargey9?=
 =?us-ascii?Q?E5mHxqbmF/kqZgSsp5Nl/LQ13A282E5G9BkzCzy+J32eUD8rNJi95iML00Oq?=
 =?us-ascii?Q?XF3RzCq07AuFSXwq4HBa4HoM8Xv9+ip6RTYHfvTsOJqDWV/rt3Iyaak+P2sh?=
 =?us-ascii?Q?dKYVVUQsWwXrSk5UBjeo9LCRiznJqAQsMHiv/RHONb8D8yYEvw9k1LsAUitm?=
 =?us-ascii?Q?wrw4EHSDIuE92ohACwoTvIHc8Y9MlpgH0sUrzSAZzpWh4D9iBje9iqMn+ak5?=
 =?us-ascii?Q?rDwn1eMPoVdHXr/G177SV+g6oXkVnciXeqEXHb4QH5By2IrLZhXjqK6SnG5r?=
 =?us-ascii?Q?ngdPtbVlL3n3jx7amQ78ndIpkjbG3oPk9THL8/TWZXlOlRQWZ/u4byQjH+Up?=
 =?us-ascii?Q?yKKbKCrGlAPZwaUHHVzKgP3ipNLxpmHTvMGMFI73dkij/URxgjt9F9QsK5Dq?=
 =?us-ascii?Q?C5s2FQJX/r5ArfA3ZtS12zLOg5K2vLuL8KBFsctiuFKE3PYVD6ZW7KjGz3OG?=
 =?us-ascii?Q?jMdP1/RvKtvGJRbdeQTKYcNsU93FeLw6BW/jkr7eL1tE60AaqL3qJOdBKYqh?=
 =?us-ascii?Q?2kLxyvjoiDMM/8vm5Z1fqAKm1QjjNuNw9OKJHrvm6WIH/gZi1RJ/GZJmiQ5y?=
 =?us-ascii?Q?BnJ//4AgOzFJVL/AWflQBpHTkqpRgc0HYxiUFFsKVLIWr5UqY0psHEL31q1y?=
 =?us-ascii?Q?XK/+4j0en7goatb5yi3UyPA8IkLI7pz4IxaJoeTEumAaTaMdFJQeX20sk/qS?=
 =?us-ascii?Q?TtcP3+71OjSy23K28R9uf8lulWPSJKPIce3hJQLJVK07RM0nJnQdoKYAiJcw?=
 =?us-ascii?Q?eMOzbQdY03q9MaeVTMMaV150z6CMX+ERHusLUCOyd22zEYNM7TPtucs3zB7D?=
 =?us-ascii?Q?4yjaV4mON1dM7OpOJJIwlSX4tXdFmCTt7AjzIjW5oq6SnOZy4JZBVXPL5H1Q?=
 =?us-ascii?Q?I4VziwMTvVvTLf5FlzFO8ZbeQP+LlPzJBMwx8BFF2WeK5FlgpB8V6JeoZCwb?=
 =?us-ascii?Q?C8mdkmiEcLXYkjQb1P3ifihY7AMwXXLyfJ9ZPhCN9Epvx73KevmYNC8waPiX?=
 =?us-ascii?Q?zxDNqUS6Abr/wMLYuHsziVrPgZqO9v4KGoVymjgntOrMzsOpk4iG8fnq/rGy?=
 =?us-ascii?Q?BqIhL12S4gmNjmr212sfmw7faF4ddFrYolwQt5kG2geDidBBz7Mu3dkRapUK?=
 =?us-ascii?Q?DgswrJtxfrF5/6SEaFJLYM/po/Ec67thejmt67+QtetZk1dYtjczXp4kH9Nd?=
 =?us-ascii?Q?AjBnhkuiRx8RjYOKnejnnwOKidccxQonpRNL+ozLRZp6Lbpafgs7ZLyly5/c?=
 =?us-ascii?Q?qMgWiBRE7sAqgTUJZyl1POMStlZZsXm0gVGrrtkjH+8nUH3rN3YTOVmoSbro?=
 =?us-ascii?Q?XSgULiLpnRLmAR4EYmOkFSSHj0zxQaTNqB0XY1H0r+9loimMLHJQhxkdhcFv?=
 =?us-ascii?Q?Gr1d9Hje2zCOkfHJXXGkJFWYelTmDLwO+5fVzOkDRX5ty5mXQwOOVMVjpGRa?=
 =?us-ascii?Q?nfQxBzwwM/N7T6I6bigw4Gsx8Rg5RyWulqv+AhKz+9bb7c58CbNvGbduNc+2?=
 =?us-ascii?Q?jP0ScRJsW/ctNiPwKlI/I+I=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yimmXDl08HoXtcHUbHxQmiVGZcGoYEuc54ZQf+FLP/LxR9HiOgiQ1Pr47Jfu?=
 =?us-ascii?Q?q/1nAz1yAv4Z5jVcCcq06aUfyvGO1j0vSaS+eoN8sh5swdMwMMAFuae7werf?=
 =?us-ascii?Q?oevw+KblsoZKDbhs0pLhjtXt/lCXllsqmP3K7Nfa0yaGRNCysfFQHp55o5x3?=
 =?us-ascii?Q?w1ZW0o3FhO/j3/cEdvPFTWWxcynAgDU4uTX5W//S7M93snXZsmkhRGJ7suOl?=
 =?us-ascii?Q?VTfzDnVzzGJdA+jKzeBYNA+vjMhmcEL0zi9zg6mWOhaG306eMVaHCx1I5t0N?=
 =?us-ascii?Q?gr54t1PO2/b0pHHjhn8QsX4ge6EinDAC8qqg9DFP/vqVpAxITh+WD/iZizYx?=
 =?us-ascii?Q?ImR+GkubcG28K2AvUUQPi25Zn1LrUDtEbgI/VzGETblaWYVV/l9683BOGxA4?=
 =?us-ascii?Q?GcvNDfcQrv2NexrCW/cpO5Gao+C13Did54qSqZzFJHVO6CYEDrN9CHl8fucS?=
 =?us-ascii?Q?T6TzNCr7rxnM7ur12Pe0zy4UBzIf0FvGPReoHpO294DqHbHAfknlZTKrU+Cv?=
 =?us-ascii?Q?2T98ncMLY9Y3PzH6cOiaCQEC+WKRPwClZHkPcSjtuDq1WZ2bCtaQ58XZzo5d?=
 =?us-ascii?Q?9o6CMigyDMJy8e1jLyBwGudspNGNcGA610klTHgS4w08BylW/5OUp9UdhFf+?=
 =?us-ascii?Q?z/rN/WsMhGOUSp40w/+pr/5o5hqrCH5mSMFOX6hDM/saQwJH/Gx2INYYLusd?=
 =?us-ascii?Q?zS8G95H798G029wLHgjt8dssG0wB75Hg4Vik1EpFA8XeL3YHcyRoeBt1gti7?=
 =?us-ascii?Q?mjspT7y9wrDhCc6f6C9OIDMZkNh8jxaSgqRpjo74OL4yYJC6qJtqQcWd1F+W?=
 =?us-ascii?Q?AgVTD2jgkuvcwAS4W4N9E8Lf5rMmyyqDBL0+dqJFse6ShwwsIlzKZjpHZ/4d?=
 =?us-ascii?Q?DMb3LAxW794ulb+898P88Dr53hk7bOzXQ82t2bbB33TCWLi5enMIgRE02oET?=
 =?us-ascii?Q?ck9+m3MoxLMEF0pvEWe4rj2PNxsTbUFnnKUmnAOba5bxXKiAYwI2ADroKeSU?=
 =?us-ascii?Q?juEVV598U1t0A+64aWBO9+MysctEGKkmwkggi4lrBCupAcR6prk8PiBLgMX2?=
 =?us-ascii?Q?nCFNcM34JZrXz+tAn/aT0wsP2IwwGDWk6jZUhjy6lext6AW/3BqKapd7vLD7?=
 =?us-ascii?Q?LOU33teLLhWI3JnCg01izRCkXE2djCjPsw4Hjsg1fKyVP/ekUF1PEH4Tk4yI?=
 =?us-ascii?Q?ZxirhILUTGF20ppjWv86RjAACFqCFQ0m5DcPw4aess1oDAASs6A6j2tkqIKo?=
 =?us-ascii?Q?B5qxd9/vK1Uq37t4AV1iZqmguERGxu2z0HQdhmtPG2nWtsqDNvvgBYGFOKk7?=
 =?us-ascii?Q?E2NhxYWxw+dwCosaHd5Dh1i9Gq+z/68/QSV27TlRaj7T38TUqyx38p8yLT1F?=
 =?us-ascii?Q?X2LnKa57epHNUCXTIF/6jDvSqdLKmFlHkmeX1KRxP1yin2fDHseXAMDGq8NB?=
 =?us-ascii?Q?TY6gcpVMwe5t9rRNpXDWAXWhGniGJ1GzB0HxThvaiMV+mnQjy/9le1pUy1iO?=
 =?us-ascii?Q?d6Yrk3w01U4rJwt56sSx1p90xmji8AD0Aj4xuVnigbcv7ZGE0ssYEVELazeD?=
 =?us-ascii?Q?RjgK6wystVjd1bmK38nEXzsMDP2jWNNWjJCQA2V0FWALgIaGPELhAcrrf7x9?=
 =?us-ascii?Q?xBqx9YcAFizilUfGAOa48WPvHbGIhYagH5ZhZQLg94eN5YicBLGevI9/GTFS?=
 =?us-ascii?Q?RayRwFHTj6Gah9qLeuPVzpx/jNJE8DgCrRz/gQNlgDA21vGu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03645db-673b-4830-e2b5-08de64d4f33e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:38:11.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYezpywyJiNWXt7DaKo4GasV44NpmorOGHCJ1OIRcLZW3S/gU7+SdaYWWXnRVKZ7Zfx9W1lxyP4ZwFRWcgFqhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12188

On Thu, Feb 05, 2026 at 04:18:07PM +0100, Stefano Radaelli wrote:
> On Thu, Feb 05, 2026 at 10:09:06AM -0500, Frank Li wrote:
> >
> > where your v2 change log?
> >
> > Frank
> > >
>
> Hi,
>
> thanks for pointing that out, my mistake.
>
> Would you prefer me to resend the same v2 series with an updated
> v2 changelog in the cover letter, or handle it differently?

Needn't resend if no update of patch, Just reminder you to add change log
next time.

Frank
>
> Best regards,
> Stefano
