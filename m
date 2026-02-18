Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D4A2E8DEC
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432537; cv=fail; b=QhyBhM2kc1TAQQEgdwgYwCYZL4iOrQetBIyOcWRYF8elmiOHnwEi0WPnEayqGLWnSr/5cnbOY1Co9PWPAnmJecc7R5G4Isvjyg/9uW7GZK6iG0mz+tFpqgdD01bYfFNSIAtCHlcMByr3IK1Vadv6+JrKWgWdb622tnBPNp2W6eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432537; c=relaxed/simple;
	bh=vg0LKDyfQx/1DRFUtWuGcNAMMt0b9HeH5NpNUNNHYFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BuuOo3jhMGcJrhcEs5EJ+T9/m/qA9HB97htihRW9frj9ToWpt/faDxT1qDSpC59zK8VvoE3fPbqbk/0ov2r7Az18NbO3b91nmh0HLihP4sosb9PGPRM1V01yfi3ASEuhvGXF0DHmfvjUlfsQ7KLffQWwv9WrChaooHIlZZNTy7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GA53lqHF; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GA53lqHF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRDNgicsysSP0iEkpi3Ef6UvkmHKxJf/qqrEzMFDi8IDWOhZ9yN1g+CoLS5nJfXH0Vfg5TOrFyP/z2ciL7x7cRmS+LHxFQ6lMy5IUDQEYr2c3p81ljbPbC8iPu3BoQCWLYqUn42QCRV8JUj8HRiJScajobIzPL7CqYhmrBeXchS7pdm2PZMoOrQYPFYEG0Wt1OMcuh490vMJcGHppiyWocn54CvU8mhQI+P4uDl/BSAKVF/Kb/FxaGXDNJeT1YVlebOinJgyn96rYbCLZ0AtLuF9vt/5DZxvZUog65xJroJVRb+zRlXGaVg4c6SCg8CSmSLhxWUSijJ85B+52kBjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHImeNTV7Acy1yV6V2hzNMdQfpBOzgRGeXhjJYi1xEQ=;
 b=i5T36AhrOv8rqgUOgxuYJZqJ+D57fdIQp1pIuLr5Gu3eQj4R1+WPbJ5dNVeyfTt1W68TYpM79X7C+8yFlkYgPvj9fISTJQtt0QHp1xnlO4vQHMPoVVtVcCFQmR5lU6ZGVjZSzz6HYtLRlrT6DRQ75mj5OTElY/EQffb4DwG4fTJTzLlfxeB+p25TxA0rjejBz0f9pUynt/AfhbnSdbnYx4g+uA6p666rlYkcTcF5mdsYU/xGIdI1grc4dulI4XFhr46ay/6yEcZol8b6UcosnzsiiVORSRab6+KGlZZ2EmNl9tUxUSXXOVYLNHH+a4KRELcmLWzMR4KnFzVLATHE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHImeNTV7Acy1yV6V2hzNMdQfpBOzgRGeXhjJYi1xEQ=;
 b=GA53lqHFsFKH+NJLRW/2ktBApyUwdP5gBdstCciDbTSLiqJ66ZYYuYpnU8tOYnbswD+DNBkG2kHa6Wgijbd+C4nDvq5mKQcxlShPpnHV77fgrocGFJV3CPJbpMBp33aqL4nENwOCo4G8DbiVfGYjfjIUYaE9ILYIy7dtcm7E5yV7f1YuG6E3HoQ3D0hSzIjR+4yp35/RqvHyQBeaZLq/Zf2RRx8Nd2owVVq7j/Tx+mQ1YwZ9I1x658DvtG4/GLjjUV1M44IaiuVw5U+vlNRV2eJ3yC98yGBTdI8h8x+2VqzkuvNrOzoAukXee09G1fSNSMsWZNpig65r5RRW7cZeQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 16:35:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 16:35:30 +0000
Date: Wed, 18 Feb 2026 11:35:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
X-ClientProxiedBy: PH7P221CA0087.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 982e7450-a1b9-48cc-c96c-08de6f0bbafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J7O0fFDJpEHOj1p95mUYVvmWh5owSk8HzFD9lFXsip6RobiCOFH/nbHou/pj?=
 =?us-ascii?Q?M1t7rYvsWoJkPHaZ43t5xhpTLP6JVjjQZ0DoNmcCRGE5QPt/GFQrLcHrSV1V?=
 =?us-ascii?Q?WQLdPY7NDYbKVbPldW8RAwddV4zHf5HRnuySgYkLAS8ogiPTTf4j0QaDQ+pn?=
 =?us-ascii?Q?lhKWXjrv+c7I6kAXCvjCVH+Fg3DR0LTQjvE+AFBD+jxzp63Y0ZSAY9rsF+TJ?=
 =?us-ascii?Q?wjUIKXVxQmqJZ75jZBvgGfiTqS+J4yp3EdliRsCiNwRML6Bqnl1MmKKgY+kX?=
 =?us-ascii?Q?+GRJ1yr2Rw+2p0LuIQjUgqQipTSzqs5lsUDYF8TVI4KUN2pkk5OGmOQfy6rg?=
 =?us-ascii?Q?5ZqSU/N1Y0sT8qYoKlcWrnd9E4Vhq6W5MNxhUaqYMFTuNPBr+LHM8KkVUK7E?=
 =?us-ascii?Q?tBFdUyj3XjTTpNCVxUULk2sgPSeiekjdreTRoCZsomNowoXgLYNL1w8FSfY8?=
 =?us-ascii?Q?afPoDIYvdNe1RvqzqSyB/5oAsJ0oqW1A8OL+2BAh1x28FSYncMjL+5JG9QU8?=
 =?us-ascii?Q?PusbwMZ8p3q9v4jl3Spgf+Rwo4uutbOy8Y2gtMPmbxlG8+KlLHwZpz2GIsVA?=
 =?us-ascii?Q?hVh73b5FW23xAXrYej+w82z8MWdm/1rFBAJGY6KF7Mo3AslF98UP00FYKbG/?=
 =?us-ascii?Q?GDPBAxqIlWhoYHZ319PF25MJAcs357lxtgT6vQ+NMGh4GvReSY7zlMO1+N61?=
 =?us-ascii?Q?JwYSgJwrst+0Sy/gnIwpDjeTHC+wJZf8+AkLo1xoRtaKRaTeFL/bSce1SN+z?=
 =?us-ascii?Q?fTFN3oNUbmWLMm+7Bk3+AZYiv6lfpjretUINPb+zjTPNu7VlbrbPa+b+iXVJ?=
 =?us-ascii?Q?qNElhIxdIBF9DQ4uEnlCj93hTDEhGOsH3YIAHVa2+7qMK5atii0Ltj1/DLK3?=
 =?us-ascii?Q?TL44dbCEwj1jMHMLoCuVmXP3hsIaRm7H1qTXxqczayt8WitahC0q+SaQR5ai?=
 =?us-ascii?Q?Se+CyhMZVlQX7Wyp4Q2maUlo6qUXJ8u4wx3maocgUaOOjGlIYTdJ8zYjUHgD?=
 =?us-ascii?Q?CYLbrlhvfxMeofi/oDZPSUEpW+cLK8xQnXn43VY+Lui+KZhO2k+m+0dG6+bc?=
 =?us-ascii?Q?VO6oTVQ9cNpoCS/QAWi9DSeZmLo+4qal07mJQJoNX5UL49/HKAN5qXtkGmIW?=
 =?us-ascii?Q?NJukAI/XfUeGRxn20WkY+WXRuHQK1ZMWZm5y3+svoVVSQKnNgba5TeuqrdFI?=
 =?us-ascii?Q?iQgT8BLYV9t9+PUEaxW/j2Bqinr/LVsdThbUbxuH8SMoZ9lmQsTLle96HGUg?=
 =?us-ascii?Q?VbxbRlmyv7VKrPt0ZefB5dZ1ZinaoGIE4lmxzuuljkSBpJLt9v56kaygYx8j?=
 =?us-ascii?Q?dUXJxbacMseYu8w5nXVMYx36iD2MZOTK2UQfo0buaCi9CvJXyWDMZ6G507H2?=
 =?us-ascii?Q?rJkgj9vbeANs9nGVZwrt0Veof45IQYqqKsaZHuVH93RHSOViRvE7tIt9GTqy?=
 =?us-ascii?Q?eEg/XwHhGORPDa8rTNRWqrUeKiTZs8VFhvTByUPga1zpfB45EUARtRKXmkch?=
 =?us-ascii?Q?ER6bdKmEhdeXFBv2oLTKZAvPHv4hEg7WmpGDDCccS863phCHoRSJqzldx8Ej?=
 =?us-ascii?Q?srTHtqw1YRslhRC5F4RQ3QHFhipXCujlf6btoLg9IcNvNBITGuVZ+BmlnGe1?=
 =?us-ascii?Q?SXitWWVLxP8ZbOPn96dl/To=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4KhwTlQGZApMhlUMx1ThroX+xL2BmeYXwLW0luOR/r/mCWN0ZDVFMYEMAg0w?=
 =?us-ascii?Q?zn/lXb+/JbauPnVG887e2hM76+6V3ns9vJLoZeQyOBSJOOQ8MsWzNilu8XZ6?=
 =?us-ascii?Q?zFg9Jo/NofYlBrXOdroILsq1f49zKho/7v1z3apidUAWvTFxM+tgZizofl4G?=
 =?us-ascii?Q?zxYQrvBwLzzcm+ErU4hsCyvEqdoSm2eMqAAOhn7Cf9PapCYYkUkBVDCyPNu1?=
 =?us-ascii?Q?KwK8UzZUcXQDj/RUksPh7+S+7PfAw0DcL7jHlc0N84U05FKr4YdzRGJjwun2?=
 =?us-ascii?Q?G1ZKAAEkGq9u+WKwAPLZSX8uZwQ7XulLy5WmJuitlcRvtqwubsCVILMon/DI?=
 =?us-ascii?Q?wEDQGxZHp9hzpYYwUT7BU6ZtQP4yTu+pwqCgiOSLWuo02yytFTvo2ebtiprI?=
 =?us-ascii?Q?xYBFFeKaGkScngt61VePTpVlXjeNQF4soL8VDYOXdJCbfgizxhnEH/1aL+Cr?=
 =?us-ascii?Q?oz2GYTgBhOeog5vaV3yXe9yVXOjI5jbTwvYjKguaxoigKLnuMSmqnIbwCZQ+?=
 =?us-ascii?Q?X6s5OEO4qpBCPjb3lmtZt9qRJpZCYYpjHkl3TcDGmdB+XKpxkwTAspgyseUU?=
 =?us-ascii?Q?OJc2bk1vEx4SM14EuTw40bEHB1s72rErYJdXFfyr44+JtF6CBD6AU0KcTa0H?=
 =?us-ascii?Q?b3zck1fWOdv+SOnP72nRPd5SfMHl7uKoKCPTBP/8JzK79qbYAS6nFH3zqzYX?=
 =?us-ascii?Q?joaVztL4RxcER3ezktF964hw0/yol0Vkn6wYpUAaa/8lz/LV1ZzfSJihFGAo?=
 =?us-ascii?Q?ZMvwPD6k8FnnnY5x5D7BdkpAdslaC7u6mXuv2sD5LyLb7jPvuv3CplfwsNnb?=
 =?us-ascii?Q?xIKDWscROMg5W+swBCMytx9p923GHLgpTITiASEu4plXypU0Y9Kqf5a9bKrb?=
 =?us-ascii?Q?YP2QDnrHggiq5xW+49lpgfKLtNNBnJ1aPaT86w40w6Zrr3BALjtxyrYz1+US?=
 =?us-ascii?Q?CudtSiA3PoJFKUSX83iaO+tRYzzrkltdFkus2koO/FFpngky87U46X9eM54U?=
 =?us-ascii?Q?RqfDY8r9OQFQ44vJ/OAaxNX/Bg9BOCYmSHNjVRCA/rQDZknaU50z4gMqkOsT?=
 =?us-ascii?Q?F0AxChu/MT8/kC/ZH78mE/99o/o7FiB/BTLs6wkl4GtG+fh2CeDv4l70ZmYS?=
 =?us-ascii?Q?blaFLTIhAIeQwPF2W3njWDkrOJWlCNJ26PuuSer1XbniX1h/slN/2c5ZNT25?=
 =?us-ascii?Q?iXT3A+xhmtgyBR8TRXKTyQOHcyE0eA5qoi7SsFCLnkdbutYikjyIkNwQLZVi?=
 =?us-ascii?Q?gcnU+Bk0Q1qQQuQYAgM5gNqQw+sNxIo2knLFvXxio+ngE3WthhZYsBnlS8fP?=
 =?us-ascii?Q?TINsgviwSXLJUBsoL0M98Ecxb6W/tsy57VBt0XK7i8WOWr4yQ6treZx+hJSG?=
 =?us-ascii?Q?d3YC6kfPL6N99Wi6Qu4sQLLWB6AspMwb4cJRmO5S8FkO2IRtxr0wBpNPJX+I?=
 =?us-ascii?Q?MlbJzRMKJ939JG4Sm7NFFpEnO42Yj6u7dx2oVX46psEiG4MyvkLYIdmFRbYO?=
 =?us-ascii?Q?MQqMumkCuZqgMPvZoN/6ubTTDmdYSJBX9JGLUJM+xw8dxCMnWCZ4IBFhqOsd?=
 =?us-ascii?Q?MBk6rvZ3DYeoB7eZTEp96aC6E0Vbr3n5C3Tg2c2ytmC3uX2ddkJ5XrfibWiE?=
 =?us-ascii?Q?BOUbonHkao1FK/Np5O/L9dIx5DoSG7LRXELDfoULMaY+cbKGPzcq2+uGKkuX?=
 =?us-ascii?Q?FK35jyCOy5tMUC5DTJHPtATq/awVkCv8mKJ3Q0bA0iLi3OpDrrXoITEs2ABA?=
 =?us-ascii?Q?7t7CH7pEtg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982e7450-a1b9-48cc-c96c-08de6f0bbafe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:35:30.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7QBa9c4qVVadrTPC7S192Uz9E35Pj9GRswLxyOcYMkaQ1XkKmYtraQWly4exZIpT+xtImUw0FMeUp/J+Ebw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> Hi Fabio!
>
> On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> >
> > What about users who still have boards with the Broadcom Wi-Fi chip?
> >
> > Will Wifi on the old boards stop working?
>
> The Broadcom-based WiFi module was used on earlier revisions of the
> VAR-SOM-MX8MM. That hardware revision is no longer in production and
> is not available for new orders. All currently manufactured and shipped
> VAR-SOM-MX8MM modules integrate the NXP IW61x instead.

This common problem, we met similar case. After replace new compenent, it
should be new boards, or new revision.

I don't suggest directly replace it to broken old one. You can create dt
overlay files for new boards.

Krzysztof Kozlowski:
	how about other vendor handle similar case? Any guide line for
that?

Frank

>
> Since the wireless module is soldered on the SOM and not selectable via
> the carrier board, the device tree must reflect the hardware that is
> actually present on the module. This series aligns mainline with the
> current production revision of the SOM.
>
> Customers using older hardware revisions still have access to the
> corresponding device tree descriptions in earlier kernel versions.
> Upstream support is being aligned with the actively produced hardware.
>
> The same applies to the Ethernet PHY update included in this series,
> which reflects the PHY used on the current (and future) SOM revision.
>
> Best regards,
> Stefano
