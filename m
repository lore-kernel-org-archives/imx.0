Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4136DA1C
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571727; cv=fail; b=nfGeqhmcW4h2ykkKfL9xABPDRJtDAVYwDT5igQrwqR6R6xQFKWJKtYY2gubj+/aHB9eOjquEU8oWDQ4xIJeX4RY6sgfGJLW6FzmLx4v7+WF5kWqkWUQCx3+jfxakOOsloyZfb3+xnSW73CHb1+ZE5sNQ3wFIjZdMNwzQId8vOL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571727; c=relaxed/simple;
	bh=ZuOx1SPHKi3yGBhUyjKDS39Ag1SKB60lSC0MFV3GGVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbOtx+pR/0F3o3Jo29wp6e6cGkrl+m5xDl35DSa0IZHLTrtJYKUy90TT3KQ9+QBMW4RQaKuLVRqhbngE9K7txgHmAdiwQg6roaDNtANTAsXnRBp+fPyc68+MO876q79yPhXnJs24pJbjBFfRM00pqgjiVhKm2Rti6ahgaO8pFGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HmHLYoSI; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HmHLYoSI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0ImbhmxbRgPSZSFbxNiCZHkxOvDU9R3uSajjVeNBO2zBw4PGZadssG8JXglfHJYxS6jwS0RvKONuH8ywZwHw70KDYRkIyyzaVCVdOOAAeLBSO5N2RvHFYQpaW31QLSdRVHDAwbzn8j0Oeo1uZhXYaLKr+Bvb6IbCNxFIecmZFWsct7EPNBqlNA5b+nMwpdeGjQnte8xX5G496lPTGzVgGpvcsxIEPfVFIp/XVCqyXQAY9JJlBftUINNelxtCSZY8IumLL9yrCyh+b3UPfTwex7V7hQODwRLjoJNMuTG0PGe9GDSjVWkKSFX1SSDiS3NEpYgzjWthvvGDwIg6ZAEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7ozfocZIA5Yk31tkjXAemxIiG2GspovxW6EBEAx800=;
 b=URob/gRPYzNjC7GtmFPCIWmC+2SyNSBeSTya2CBZYf1tQ9G2Uv9P/jN0rHqTcMqdPc7RqzTiDXSuG+RQ/86hNMwk044gEgSOfUFA6WJIOarYNvWLbd2/lcxOkZviGyaPQOlZKqPPrKcfcF6Ja3q8O7w76QkWJPq5z47cCkvNQKO/ruXV1eTZ9yeT3aTgRgaj9godyt4c1zSVU2dcdPZOT50rz5XVv/QKgx4DIWgPN1eIp2LXS/kO4lurIKCnwSgQV094uD5Hg3nUiHWFhwnKjwESxOPMCt+WndSvIxySVnMS2DImNG+V7PgM0rCDcJEcbw+QpvWGR3/dPPSZCKZIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7ozfocZIA5Yk31tkjXAemxIiG2GspovxW6EBEAx800=;
 b=HmHLYoSIGOei0D81EcHUTUSibh9V1BMuNlufpAKIaioipzmxJC4OhUEAHxfkC2D/BNuHOqrTjoaMEW5bzlQiA9jya+pUaYKscyrhemlrE5gq2Uu1455FXUOjRy5Js9zH1DzFgNYeHAIlP5bkOEOoHArP7NgzI5KuPTZBptf2wVAN+zLrBgBPKBgP8C1kF/v4Q2aRDxLCzibZZ/4yMHn0PCzQPeLeo5AWiO6x5dOXTtWbjCjvKdJvOkn/5f1Fm5gHAdEJkMO2R1XIg1lz0E4vn7ZvyhdleZ32r18NHg/MmjwcE7Oa8jX4Qb+o8nSqf3ytgdkoLyUFmW4Xs6XG1ekEZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	luca.ceresoli@bootlin.com,
	Frank Li <Frank.Li@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v11 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
Date: Tue,  3 Mar 2026 16:00:56 -0500
Message-ID: <20260303210131.2966214-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-1-1b03733c8461@pengutronix.de>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-1-1b03733c8461@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: f492d66c-f408-4d8e-bf69-08de79681ded
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 HX6qix07t03wwCw0HGU7XZHltDHmxgULbk3lkG8u6msnIR+P3i6w1r7CTRwC52O7xG0vgTODhW2Nn+qnM4xTQQZP2slWwmJLCOap593O193iPO6Li0SaLLjyMeOdHOuQFa6UTHsFBKRwFX8/+x3prstQim55fLWd+4itEHniP587iOERWuUwoF+nK3oVV0mKQ4YGWt+HRCehZly9X54/sQrJps7hJpMA4S6yfhuwhwz8tzqYbK8FSFUzZcADtlQf4TsOPpv0YFS2tUoENy3EJsFyGdLMghe6pXVVbUH5jrLAsnOrE7swl5eGJpk4U1t01sODto7a23UUQ+U/hdAwUZ38arp/U7TQudFue+zYhGGlCJLyiDpe/HYCwaKQ9fXsiVMX+bbVPtOC+0FwCq/uZckMDkcybEGkR8JMS731ryGoB6hWT87dnmET8C4Ow0S+V/bHUmj50EQDGiAYNFNl23xUc83xKBkY5IHIw1dSN18BhLTwiRruXugjWpznoXKQ2YvP/o6j1SKWfD75EjiiC4P4AhGbCzWTW75HSJNZyR5TGodJZlLS0SRT9waGhN78ZXDeYHma+pGpadWCzhxXF6IkCCyKl7OyxGdjG587NWnKj0049GEgwHjYmPicmtB2NS2WWMhQSzR6aA2SdK5xVCbEGLqCsNORSMD/QDoph7tgDeNGU+Nrj34stM5PcV61RnjpuHne1ZT6epQ/jBqIsouwEYmvRWJXvBvkoo5LqNCYc9T8Jz05zyGLy4/cqX/ccf/O9lgX/5XbmqCRCwNtfF18g1ynhemHe6hwI7uhuabtwcRClzMItF3OU/Wbz5Hd
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?RYDfPxSUhvusrrH/2Amz2g8sBEYOfpayFrv0S36MWLAEkSufGLfH0/V2RzNM?=
 =?us-ascii?Q?lO43zuMirTXyFOXxAK9B70ZH+EXdiebeljWXHuqJIVwh9a6ekLWfQCLIEGkc?=
 =?us-ascii?Q?9JbePwKsBxXQepcXPSOiPoZBSJOfAZYG4SAlZCaZznbGKngd0DB7U2mSpx4E?=
 =?us-ascii?Q?rSolEV0h2RKeitW5dpd6pBqzWMQCsZsR1wabzuKd6BEhbvaaQbcPqr/BXKs7?=
 =?us-ascii?Q?poQcEsiSqi7dviqA2yqTB8UOm3xfY8q9Dt/s5MblBvOImsiMHSsKFX4IxHn2?=
 =?us-ascii?Q?XpIb11xxZ9enBEjis+MgEMxtRwTFaL67szb1nx5vPs9xSqySonNdJxH3O65p?=
 =?us-ascii?Q?9KDSQ+3oeUQPSv19fed/KKCVPgLUU9OgU9gcFs3bLHIXj6F87znEYrNFBYhC?=
 =?us-ascii?Q?OxCk5KnCZhFBkgoILPixyEAeURhgQTxR/kznCJDAj2wDUoakfWi0QOFR+PeL?=
 =?us-ascii?Q?EgwI/fCxAhkQBIghyQyaLN5kXRF7p7RKrVG8V63RTujCl+gF8A2uxkcerIkA?=
 =?us-ascii?Q?3gDXOZVHH356lUEEykwfbk3wqiV4s2LzumkLf8Em7A0ITXIX/lLIhixZvZGe?=
 =?us-ascii?Q?CywrBPKJbgl7qDCJ65BvT8Nmuix4IQmK+a/T11Teeb9hnicm7Lio12gQhJXT?=
 =?us-ascii?Q?d7/MkjcxqFxTe/IpHxtcwafxC6abeHdJiy+7prs39E79Fyiaaz3DRECjJLh3?=
 =?us-ascii?Q?kbTYSxGfbepUhftfYLRy9lFHn2b1G+P/RDvEGZG2hm8alEimVgTcKQvt5CDb?=
 =?us-ascii?Q?cp9Ne6U8MntpRDcqYktN2ceUlR1dj6/ZsQgBd5Ifx37nC9bCq5qSUGn6HBxH?=
 =?us-ascii?Q?9ZRcHq72aWsLsD4L3UFMNnJiOf3uARbeV9a5+gj3yy4Fv+1YfBNDd4j57FKh?=
 =?us-ascii?Q?Hrn2cYWlL80WWjcB7SKtk/rc6xw9VA6dS19Q2BeygHM0ipDV31bliKFni3+Q?=
 =?us-ascii?Q?wdx1fx2CBIrjaGcODiwBtgxkwoJmnXOldDC4AzY9X1kxIe7aaUXxrVrCXEd1?=
 =?us-ascii?Q?c9L2yOrReUtRZwIcd7mN3UxFvUrrhBVfo0J/kjQVC/6WTYHwK01/YMlo83Gs?=
 =?us-ascii?Q?DxMhg36hAJsS1pEhQPRnq6fgvfsGhnKyQZXVwK2O6UJKD478nsJJfNUuMNrI?=
 =?us-ascii?Q?h1gi4zGbe2PvAPfpZ+uIPiXKybnk2gHpSK/NgvTpY1vVKJyUm7kBQtcKplmq?=
 =?us-ascii?Q?S4obYeWXp6+B1T35uWJJcPbU/rKCrBmKqK0H8m6KkXn3JcpsARgAhWQ1hQjz?=
 =?us-ascii?Q?U5eR1pPMVxXC+rb31fE9lA2s1dm9rfxfq1yTMPiG/0lhtbAehAhYtaWoDXqO?=
 =?us-ascii?Q?M2XkoRPWssbvMM+j+76j3fKC3RmkwZt5Vq77hdWFdyd0/MVNpkFppe0k6zZa?=
 =?us-ascii?Q?KvBzIo8r2pxibesUVy6An8am5o7DWarHodC9HgGfIv3S+Ntutl8YrlszlRa1?=
 =?us-ascii?Q?rKAC1lhdmFyKPhCYghEbo05BAqpqTcgl5BEjAY7jW1a3czO1+AcKLIdH6Qsq?=
 =?us-ascii?Q?6MxBT4eY+CB9CxV2mk2TKVeI2NGllD8LpCH4GO6QJULvoLnqhAaM6tm5hsVP?=
 =?us-ascii?Q?dFJJxMSqHB9X3HPWPUdiAS91peuKk7txDmDnQ7wkIvHorIokOoF83MwNMADw?=
 =?us-ascii?Q?Rrz8Gslr7mxD2e0MXAhGgzxMQIc+epEaBqjuvO1XVmjkh7XXHJvvUtBBAoIy?=
 =?us-ascii?Q?YB3gfTkvEuJEy5uxmIItNiNKA4UhTXAGZHqCfjd2Qk80Tj5Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f492d66c-f408-4d8e-bf69-08de79681ded
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:02.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLYkUlVSLrQmEuInxKCJ7Sj5c7fdArElp/LFctjT9mV00HC4S6xqJIwELyh1swd5QEjHWVM6VAX1oO1eQj6pUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

This is a device tree bindings patch, not kernel C code. The YAML
schema additions look structurally sound. A few observations:

> +  dpi-bridge:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx91-pdfc
> +          - nxp,imx93-pdfc

The compatible strings should be documented in a separate vendor
prefix file (nxp.yaml) if not already present. Verify they exist
in Documentation/devicetree/bindings/vendor-prefixes.yaml.

> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false

The port@0 and port@1 both reference graph.yaml but use slightly
different schemas ($defs/port-base vs #/properties/port). Ensure
this inconsistency is intentional; typically both would use the
same reference unless port@1 has special constraints.

> +                properties:
> +                  bus-width:
> +                    enum: [ 16, 18, 24 ]

Line length is acceptable. The bus-width enum values are clear.

> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.

Documentation is thorough and explains the non-obvious behavior
(LSB vs MSB truncation). Good.

Overall: schema is well-structured, example is complete, and
documentation is clear. No blocking issues detected.
