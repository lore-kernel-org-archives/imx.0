Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A553264E8
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571747; cv=fail; b=E4EuVODGvu+f7kDTGpPiXKY/grr2gGLa//56pXvSySQiWdwluRhS108WCT+1zClM5cvoxWvRm5OFM8XfEDKLmnO8xiGtqefEy/I2oIKkG11ecMU2+svJednPP5dpmNm87buF2JPW+kX2oDDNDgygW2PeBfYgQlP1wNxS4MMzQlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571747; c=relaxed/simple;
	bh=0xKaXmqPFfm+b6pPBSdg0lNGSfIC6ga3sldr3gdmxsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s7J3MX07xYWWA04yTgAzNU5D/cx1O5sQSXafku0Ep6BjDDBanxyAFDMBTnH0wpOeNHONFBOnQBlLi+MZ1rtgFhL+vdrUYtUyOhhg8+lcZjDiW6v8Via1899ms8iabTgXtfkPDvWULlMHrbl9W26D4V04FQARNx+u7sALpRZ0rdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aQv4rVdG; arc=fail smtp.client-ip=40.107.159.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aQv4rVdG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzBwL8u1FSvvZXuarLeUJUiqfDcbCK1gI9e4xJ4+1O3zV7BVneqarHoj3ZpKmAy394krJA14Jr+qay3SqR+ZgVLRUbgQHFnZRZjCs99/OsTeHPBZkl/Z0ly38d1wo42u8B1HtHBDQFkepch/5/kbtCJHMe+0q6ch4JmdVeFoHJ7BjfH0MozfZ4zLhXJTyDVFZ4qUFXg1fRBobnNSq1f1P0bZRfO+/8fRyhGz+GZl0/8JUDmAmR1nmDSKw+yyZMutMGGwwsiYxKAFV3eqGpWGD26mrhqUV/rtgEyw0OXvxKvhCsbjh3ca28zTD18k2c8TeZ/3UVKRvlJK41eyGsYR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOASFgjvIywfg+TjjUNOsYB+6PR+yDV8wZqpgwUy1Rw=;
 b=ROyeEDg/koxBD9ZWNpj0sef0goV7yuwHPgaCG4e6jn8wxbeMQrHMc3Bee81+UjPYC3wp3Y8kQM2qEE5yTPXgEufVL9XGRSyPj9Sfw6afg8EdhUPKyM7W/iMpKv7K1f6rgjlA3FhbkjuqB7foNgzb32evSJq1yoOyi9BT9YAN8UzlJ0b4QHS+x4MvRu73M2KpHzW+CwWQ/baGsqSSRXagss8aYnMZvPFA1VOTYUNyMr7gdaaP7ntU6l0OGe6XjbNeo/qgMCfBpxNbGEhr5Hl+MSfhZFl0fKQIHMSq4EuaDNWbqD8mM8rwhQBUEmECFJIigCKUWQrkI6VktlhUQvC9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOASFgjvIywfg+TjjUNOsYB+6PR+yDV8wZqpgwUy1Rw=;
 b=aQv4rVdGmpaanbSccCgOMtg2UJ3zHDsqZPxow9uw9aSNdOyX08B1L8VFFqH6sno84GxuHVFXG3hcf37YyEYvWQoJQ7UJ9j2vlh8qKU0v6DX9/p+uxbXdaWNwcglwmbbjxzXNus6ER9jCxPsbv9qSYAZ0uL8Aw3giN1Vrfx6nUUEp4WKPzEdwwRf8MyDZMtwIf6MwU1aNZTxVVoORKWUaQXPwyvlrws5UyDJzlF0EwBtNsUgq223YZm1v7R5EOm1CNU9yyi+YJJJP0UA5+ZzrEvsbpRVacZbvF4/FBLYPdKCIabociaX9WsdRbL/puMCblyzPChUcOVpwV7dQtWfXiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Frank Li <frank.li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Tue,  3 Mar 2026 16:01:02 -0500
Message-ID: <20260303210131.2966214-7-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
References: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
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
X-MS-Office365-Filtering-Correlation-Id: 17625107-1ac1-4622-3b20-08de79682949
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 Ij6l5mOFvDEy8kmLrXeKKgQHjn8BqQBSl7yiiUDnv2rbQags4vJaKVqQyDQO7UNBLBz29kZDx5LF9DdYGtoI/yL7/QGKI2RvyAE0JW1cxr5GabFeYOoUKkoGlURZoPQl6Xtz5QRovD0bgeoEfkcIfEiOJtdk1piCmkC8ypat+ohWm79jNTOkt77A4pnkXpuEFGkU8xSwy9+/sVSDc3Kz/RNR+6vZh5uEnj4ZJMdFZx37xvOK8+whWowyF2Wx27YR5hZPQGdUUKDokXanMf0kTsh98Ju3QIQMPX//YFRKZOSeELcA3Pupa8coB+ioQO8DC4cnkmX7o/jgW0J2tcvD+ESFhcTokagOT5UZwlJ7Nj0agkIuVOmQrx504uuB2TerTrpg0cgpu60qJZ/U+HPCFx0abNJn/rop/RzrrnjAs14NJTvciRCIQaPA4xXYxvtwWU7erEXj7ltvtUrLDAkyFiLMR5VKTZQ2iHMzuTXpPxcH9LOFaiCH4zZluR3N0LMkXsx/8rD/QsnKQALQdWTcaJDTrsHK1m/heQ0k6kZIJqXNd/bz74aDzqhh4k+5z5ovq8c+orCVEong1p3e4dHJzUAoGE7uE7SvRHBOjiHff+rR0KH+1j4q9yTg5Hb6eQIip8r8tSF2RBI6HeqRvcYPMqbmLOGcelBOa34eGaDM6GfZrdvqWrw/brRhG84NLqktNWeqfhBNrxha2fQajQjhvVbYKxpOEHKk7EpcQyMxa9Tyv6cFp5ylz5DVrslWrF//r7Pz1yNWQNH1GQMYAEiOqdNkDPepXeND8Q9c5yrEKSM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?M/HoP1LPWZ9MhL16s/R5D6xgtWhhXs+S6941hW/Qfc+3JKCzBrdMCBcueOD5?=
 =?us-ascii?Q?okgJqj+RzwA2Y8B2puO0I1iJwTTQEz8leegHOPPnLLH4LwDKZlqz4nl9yA5z?=
 =?us-ascii?Q?moK/hYMunhcA9U4WeUguyJeDAcJ04RyUuQkrnIfMMlPSEu0sH2WPXHJ13zkc?=
 =?us-ascii?Q?IJEpEq07aj67qoL+kqseIb9ItPFBw6UDwzGd+eocU9isc396CgE+M4ZRKIMo?=
 =?us-ascii?Q?sapWO2rhNjZLiMO7+Np1GE9+FBqTyCmxSyhGGw+lA5CvM6USIjB+mxpjf3n0?=
 =?us-ascii?Q?Icv9ep2H2ycCc3uRlvMWAz0SD3Mw6hVnTO2ojgMjv6zeuXFTVaiHZNhlAMoj?=
 =?us-ascii?Q?aAgJvhRNOdgoSAFeYFXZtx/kKHUEbzszoBV9p8TzXF2k1Ws7vtGBnVBiFuO5?=
 =?us-ascii?Q?lkCRMuBB3YPbZ2hakJgnJI1ZPsdUpR77d7RNNAGP5OSFWNBrnKnv0/HZklUc?=
 =?us-ascii?Q?R2YQH6kyC9htiwcTKKAjPZlaFtJFW/xcWzTE8iOp3UV/xLSAiOyaZrDt+29K?=
 =?us-ascii?Q?1MUt7Uk6GZfy5APcBBneO5IS88Gm9cNJqh1HIJy1oR875k5KLctg0RpmRurk?=
 =?us-ascii?Q?fOtxpda0YJNiY8OG4yebUK2Z+l7vkpFa407VvSgHWnhkRA4G+oHjm8sbBufd?=
 =?us-ascii?Q?UcqWf1GkuV4dRNeR/DwXWNhdotOoQvT4kQ3VhZ26ZNCZSoxzSUVDasxTFfXx?=
 =?us-ascii?Q?4nhBAu3EOXlZyEwk0ODFN8Qg+8lVY0CmK7xJYwXsaJCfWsdDSV3HQLKyYpzo?=
 =?us-ascii?Q?Kqec2t2fjB2TQtV4T/eABsd7+aNJjg1ydjMLhcGRYzXZaqdwF1SyP76ggJqF?=
 =?us-ascii?Q?qUxWRuxx9TitOTG7IcKFycaLwDDfhDttaxt2VkeXpq22GWjdmbzMZQSaAJpB?=
 =?us-ascii?Q?JcLwz4Jv9WtUIWe2cy1C0ni05vBB5jGWSTFOSduqto92NQ6wmnmIhGEqUp8Q?=
 =?us-ascii?Q?z0Cmr6JNM54okVkmVpVYMhdEelmaAyTBlkfd6rJGIL+N3hVK0lpmpP5MXBYg?=
 =?us-ascii?Q?yBMzjfghrR5kRlJIMSt8uYZOSqC5WtrYZa+u2zogV29v2bhtrhOeAeUyUF3N?=
 =?us-ascii?Q?lLdC9D3f9Gq4idPxBOaK+2s+06C6oR1lhw0Ji7TLvDYOSoSziGRXo4zPSJqf?=
 =?us-ascii?Q?UAABbojlX7b1lB5bj7+imoBelyWS6anzzzcgyRbR0PsnMoCX1akgUsf70cpg?=
 =?us-ascii?Q?+/UeqdAKmkWAt2i/muYT4TttcfeHTWV9qhALQliTQZrWSCrgS0yt7vZKPMTl?=
 =?us-ascii?Q?/kQ17hRnFFR/eJFkrNVDWz8I0tvHMf8cpYOf0bTHmMk1vYo0pz7rehjC2xIo?=
 =?us-ascii?Q?UteSalg7udORC67IQm1Vj8hKCcLw6mH1KbdAKB83AOKq0FEma35ME8OWz20g?=
 =?us-ascii?Q?yQnqwiusrTm82GUeefxMMiNXi0w2uHfAYT+9/HrCO8gRxmB6PmQJN/Ib6D9q?=
 =?us-ascii?Q?wbbLSn55I7DlFNtqKGVQ3BYA6Xj8d+SVph07YXr+Q+BDzpyJNrTHWu9mcrP9?=
 =?us-ascii?Q?UFp6hnorFvyUKy16Qp8EoMUNHLl7MXHkhF6SQWk9tGkEJcSfOcvTw5P8eyfV?=
 =?us-ascii?Q?cO+29/xN2nutzrX3uPNRJLiiWmZSSJDYsFsSqL5vBFadT0pE2FTPAsStQ+lT?=
 =?us-ascii?Q?Y8rRF7cBaz88w2rekHskuIRwiMLHhj/aOmZihRJNgSxuSqBHuWGs9O2QXQp6?=
 =?us-ascii?Q?to1iNKV3fKB/0hmV5Hs0KK1uUyutohclJ6n0iZ51nr8P1YILdbElv4KDKncQ?=
 =?us-ascii?Q?uzCudGvwWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17625107-1ac1-4622-3b20-08de79682949
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:21.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3mGTdF9fAUtk2YkwiVjno/XnuqzA29GPoOle2sF9tN5G0naI+/6Uq2HfWUpq3qed1qf9BZYW1GhALxBp7gaGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217

From: Frank Li (AI-BOT) <frank.li@nxp.com>

This is a device tree bindings patch adding compatible strings for
Variscite DART-MX91 boards. Review follows:

> +      - description: Variscite DART-MX91 based boards
> +        items:
> +          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
Line exceeds 80 characters; wrap the inline comment or move to description.

> +          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
Line exceeds 80 characters; same issue.

The patch itself is minimal and correct in structure. The YAML ordering
(hex then node name) is consistent with the changelog note. The compatible
strings follow the established pattern: board-specific variant, then SoM,
then fallback to fsl,imx91.

Suggestion: Move the inline comments to the description field or shorten
them to fit within 80 columns per coding-style.rst.

AI bot review and may be useless.
