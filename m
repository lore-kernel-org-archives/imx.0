Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607A482EB
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 02:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769392992; cv=fail; b=JTVhLl9fJfY3MIauBVLjcPB9+rs3E2JXBghi/1/l9VXsZTYY64bgSIJ3+PdqIDdOlC/FWEQ1dp8F/ZcOV/B6b3YjB84CN+/ZnLJ/r+VYNyxEpiCcvV3/Hs2P4/qnxQbcdFSsGEK+nt2RikS9hI3xJkBGC1fxhSsDXzf6WPDqdxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769392992; c=relaxed/simple;
	bh=g01EuVu3gp+WYGfJm9ogWx5m2aAQiPAL9BXJGNa3kT0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QdYSKLdbwFc23cIbsRrujj8a5r53byjyFexmOvLrN7RGMKbXLCq55ZYopYNcbIF4Q/xWOFg0uNrXHbvidZJqtWLPpM24ofussKFAaPKyWA08qjH2kvP0wZbw1kYs1Pzdi2mh7tIsvjkMx89LvkJcLmBHvfXADfSWFmWwub8mcdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cbcXrbOf; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cbcXrbOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WitrUNPyITGP1CDyq0idhbpq4sWedDvE3TLgCTaB+6Omws+kc4S7LF/cUVfzCPjfIy0sjgSeykJQK4rDNNS9l33037R6QrzHO8EJrCRwey/mxhiDpI6UkUFfSzDtEtTduXWQyF+W4a4xYzdt6RBBlJNdniAKDvSJbs2sF+AlFs2ftv4pQsF7BUN4U8S0yb06BLOjuyeSs5KuuclnKCrsoyQWshLMdVCIy4E3WoIL25raGlzqTUWQ3rtxl/IrIWRIUQfeL6q89Rouy+N9Gq1xJ+bDGeXCTc8LwKsy7XNg8n15a7YSW41+mF0QvDhu6Gk7wkh8MQrexTPUZAQcThK4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g01EuVu3gp+WYGfJm9ogWx5m2aAQiPAL9BXJGNa3kT0=;
 b=cWSnlGH9Rw3M6ChLYYzkC0mLBGQcWQNTEUj9beQrdWbqyrn5fbCVPlf7wTOERtE2UVRNOINYfKhW3IclYqQKQFuD8DN1nshRIA855+gU7/Ib8sC1GRi4uM8DGxjUHkmsZQbvKNS60CP1XBmL9qcEIIJvhXN2f5Aym4Ih7ljsP5dc9oxhYyRlZD8pQ3oPjaO/a1kxREhMs3qSn2KOGWZ6zi1UJ9BWhVI/ulwwl6qXBM0BXMdKHXgJE8iKUUJ+b5WNISTdhjLn3tKVJIcc8uo9DnhJA82TK9oKW6IqIWVWnG8Bc3guNBgWmb0F3cnMjTkocPkp0bZuoHFZKPA1GWFyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g01EuVu3gp+WYGfJm9ogWx5m2aAQiPAL9BXJGNa3kT0=;
 b=cbcXrbOfyXaz9AELkoGCpXeo6WEAongzcbN5ypqzNfRg/pFH4Vzhu5+VHn0ZHOS/5ITtgvJVtSHI1Qfg2vPNlv91D1Ah0yQ3DDxQBsXHrfiO4Fy9zyXqgwi99R1bQ1rzLzFElxZMLl11hZUW8u/8RRa3DEyO/BUrmnERtC8mMRkW0ofqrxBeWJ6krbGdsl31YG9AXFrSs5X3WC8+E/PmBvwTkEBb/oV7eOE9enJi73vj0DFqd6QuMLmqKqr09Ky5QRJ1fAT+GxaY7WsCTA4IRIrQ1uyLZlSE0xHMQ2hNnYRGG8NVZXGAjj82iPniRXeN0yNZYfKVgKepyIX8UIouZw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8560.eurprd04.prod.outlook.com
 (2603:10a6:102:217::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 02:03:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 02:03:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>,
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>,
	"y.moog@phytec.de" <y.moog@phytec.de>, "josua@solid-run.com"
	<josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>,
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 1/2] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK
 board
Thread-Topic: [PATCH V2 1/2] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK
 board
Thread-Index: AQHcjBJrwUjFAOHux06EGz4wb3kJbLVfdVGAgARB4OA=
Date: Mon, 26 Jan 2026 02:03:07 +0000
Message-ID:
 <VI0PR04MB121145AA0344E05C1A58924729293A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-2-sherry.sun@nxp.com>
 <20260123-hallowed-authentic-scallop-b388c0@quoll>
In-Reply-To: <20260123-hallowed-authentic-scallop-b388c0@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PAXPR04MB8560:EE_
x-ms-office365-filtering-correlation-id: ce3cd4c4-cebc-4c1c-deb0-08de5c7f0ce3
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?b2xwZ1RwRWo4TGRnYmQyMVdEYW1rTzhpU1J6S29XYVZsY01yb2RDWWR1Y1hT?=
 =?utf-8?B?ZHovQTl4ZFBRZEo0YjBWVkIweDRBeXlrSDRlajhGdjFXTDRLUWl4akVGTWN6?=
 =?utf-8?B?bG1WL0FoWHJZcHY2OHozVHhTS1ZTWXFvQkNtZ3daZ2Z6c3dMSEE0VDNBdFh5?=
 =?utf-8?B?MEJudVRwUFhoaW1MWmtHY0srU0d1d0FNL25yK1hPbldBZ1Vqbnc5RnhlaHlo?=
 =?utf-8?B?TFJiU252NVpnTCtwdUlEMlh5S1N0WXdid25NdE9PQ2xvNjJBRlRCQWx3RlZJ?=
 =?utf-8?B?N2R2cDhoajhSQlJ2NFpvK1J4YUhNUHRjQVpQMzVjMG40eTRGL1dFMURSU0hu?=
 =?utf-8?B?QU5GVFRPL2ZBUGdTV3hOWVNjcnlVUmdnRFVLMzhJbHNxVEJsM3hMR1htSjZJ?=
 =?utf-8?B?OFJoMi9RODdqVUJNREhZZUhVVWlVbk5IR0I0c0VpOThqYVVVVzFWcGNYR1U4?=
 =?utf-8?B?aG5qNXdTaitOb2R1VFdicHNiRUwxSC9qdFpKQ1Z3YTJXVW9DK2JTelVUQUpJ?=
 =?utf-8?B?Nmk2c2pHUVZyOCtrK09GUXdPa0pvWFYrclhud2FHSEVpVG4vVk44dS9KTlli?=
 =?utf-8?B?RVh2dkdxR2JHN1psNzRORlA5ZzhkMEVFemxKUjRQOUZLeThsMEdsS0RTcXo2?=
 =?utf-8?B?MnFmMjlPT3p6VkwxbE1aL0E3M0hYbXJhY1l4NS9KbitSQjdWSkV0d3VNQlRi?=
 =?utf-8?B?dVlobWwrVzJjY3VjQWlFblg5QlZUNjBoM3VZbU1xUDA0c0V6V0I5aVJhOTUw?=
 =?utf-8?B?VEdyQzQ3VjEyQTlia1VsbUVuZkFUUW0xYkFHMUpJWVNKbmpUeHJ6YndOQXd2?=
 =?utf-8?B?WGI4NCtrWnhXY2NxRW81ZDhzaWdBamdWekNuWENOY0N0TjR5QUloc1FTWTJl?=
 =?utf-8?B?T1BEUFcybGwxS2MrYWhVT091NXprMEt2V1FKTDVZTHV5eGgyQmdXelJoYUpV?=
 =?utf-8?B?YlJ3ZUhSclNIS2hRNk5zREJISWZnc1BUejBYL1BlUFVTWW9JSkgwNGRXZmI1?=
 =?utf-8?B?SC9oeVJhS3dlK1UvRjZyTjc5cTQvZUJxcEttb3JReVlBUHhhZjBpKzA1WFNu?=
 =?utf-8?B?ZXoyWmowanAwZmM4c3U5RSsxaDJyZnk5Z2pnU1RkUjgwYktKYjgzRDZiRkQy?=
 =?utf-8?B?OVMzeXlVRjFidks3STVNWUNML1g3NUhGMjFiTW52M041RlJrdTJrRTc3RVlY?=
 =?utf-8?B?N0c3bkN3cCtxV1gxdEdtcXhzRWs3MFhnSG9tT21xL21Tb3ViOWVVZEFWSlVU?=
 =?utf-8?B?aVB5ZXFqdE8rZStOL1RjMjBaQ0VFRHdKV3A4cVQrdEdVa3lsazVCRVp5SDdp?=
 =?utf-8?B?OTZDVENaWXkxa1d6bFBnSXhsa2U0OVZNRG1tL2lOOHdwbmQ5UzlVd0Y4QWdE?=
 =?utf-8?B?dGtubmlzenBLOGFwd0JGMzZWeS9COWhzQlFZNmVpbTJSRVhKTkczdDBFaUpB?=
 =?utf-8?B?Y1UzSU9BSUN4Skl2LytGNnFmTk9sNDRiNk1tdzg3MUdaNSttRkgwd2VQV0VT?=
 =?utf-8?B?eEVPNU5DN280cEdldXNmR0ErcS9KcGZkdU1UNloyUjJYTDhyV3JPbUI5OXNV?=
 =?utf-8?B?RC9keTR3VXRzb2tmWkF5SFNPV2M3anppNE15eU5aaXYwT1hQSFI5Uisrb3dI?=
 =?utf-8?B?Mmp1dHRyemFyUjhsRzVrdVNlTHNmS3ErV1NheDN3TzlyVmFiNmt5UjdQM1Fh?=
 =?utf-8?B?elBVcU5nclFKZVBlbVFvQ0U5VW44TktwK05zSG1za2xJRFpQVUpUU1p6ZUU5?=
 =?utf-8?B?MnVlamFiOHRrZkdZWWlJRStZT3p0QWpUc3NWNFB1RzE1RTlJQkl3M2N1NE50?=
 =?utf-8?B?Sk9XNTBQeXVENjNyZGR2TklReWJvbFh2dE1qQWtUZllNbWxxVTR4ZFlIckpT?=
 =?utf-8?B?TFcrK2xlcXFibnFUazQ0V3dEdTlXeWR3L1R6aW14NytqWkV3d3Y4THR5ZHJK?=
 =?utf-8?B?c1JLdk13Y1BxSjRTc0owcXJYK0YvUzFwSTMwOXdkOVoyMFBreWg2dUdOS0dN?=
 =?utf-8?B?NXVpcDR1Y0FaeVJFa1lOcC8rS3hLOHdxRXRjWHhiME5IaDVWMThMc2Z4dTZJ?=
 =?utf-8?B?NXVjSFJiQzdRZjArWU80STUzTjZMdHJsZGFVQW9rZkRuM2tKYWVMbWhDeThR?=
 =?utf-8?B?QjNkZHRlbldUZWZ0NnlyWk4vbVphZXZqQkZaVU8zYWVGTzVFVG1oSmNCSkU1?=
 =?utf-8?Q?BUjSftgrPYpAf48ZvMR3gkc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1BQUEx5aStZWVVHK21nMXhUbUp4Mm1OTTJIaU5HWlZMZHZUbWQ0MWNxS3lu?=
 =?utf-8?B?amRqL0I4ekpIVU1tMWE3QVQ4Wk8rb1k1UmRubnBvbytNK2MrZ08zeURhZ0k1?=
 =?utf-8?B?ZnlMdGVvSWxlT2hNWUtBYW96Yk9pbXljRGZQdzArVUJCSWhaeTRNVnVuNlhy?=
 =?utf-8?B?R00vd05KbEZIbUxJOWVWLzdVa083VHgyOFZURkdFT3Z3aWF4dGNyUGNSNkZV?=
 =?utf-8?B?ZFlscXFOMlJMNmRWSjhVWUNIM1V1K3IxMXZGV2REbXlsamRNSlZYUzlMYVph?=
 =?utf-8?B?N1VmRjJaR1I0MklMTFEwbEh4RXhIWXc1UWxlR1pNTWNLS0dONkZPTEJaTFMz?=
 =?utf-8?B?ZmJPWTd1WUw4YWpSV3dReFltYkt3bHRzYUtLTVZubWFhTThVb2lES2VPUWhp?=
 =?utf-8?B?WFFOWWdMdTdvL3hRWCtwVU9Gam1GcVJmWFgrNi9vNW44K2tMdDRkZmZ1VVdT?=
 =?utf-8?B?dGhOR3puOHBoV3lyYUdTaG5PVGFuZWNsVG0rY1JMWnkrSTNtTnllL3c0bzBn?=
 =?utf-8?B?ZGNhclI4bXlvOXg1QU02LzZNNTNyaXJsM09KdjdEL205L2dwTnpsdlVRQUd6?=
 =?utf-8?B?aTFXS0R0UTVCazVDMGw3a1U4NERWL1RWME1vSjJ3YldxNkt4VlRLTVh4TWwr?=
 =?utf-8?B?d1Y3akVmaXlONFpJbDExVXUyQmZYdlNaYkp1bXpwemlJaWE5V0VOZ2dLcFNO?=
 =?utf-8?B?N1JhVlRtbGNpSmxNb2g2WVNvVkRrS3FVMitIS3B3TVhGZ1dteGU3L3dER0FV?=
 =?utf-8?B?TVVBSVUyR2xsem9OaXFybzZvWkFua0ZMaXVFZEh4VmpUVHlhQUJqTlE0VVlE?=
 =?utf-8?B?SlBiaFNGUUYvRk4wenAraUVnblQrUGg4VjVSaFNib3JxTFVzODMxa05yUDJ4?=
 =?utf-8?B?NVFEMXd0S2t5THlMV1krM1Uzd1p1K3NtdVVSQzdjSTE3MVFoWmdqTVpqNTlU?=
 =?utf-8?B?Nno3MW1GN3lwRTg3aTFUSzc2VDRjSGgrSGV1UjBHTUl3QytOcGZJb1J3bTBm?=
 =?utf-8?B?VkFGY2trOFhKT3lCNFVScE52b3RMOU1LbXlka1NERlk0M1pEcGd3Vi9EMFVF?=
 =?utf-8?B?WVBaN0UxVERudE9FZEVBcW1Gb1luMlh6WFBJM2xpNE1PbXA3R3lpWmErZjVO?=
 =?utf-8?B?OHJhRXdIVit3VTBJbHNTUVJHeW5SdkRQWndFMi8xMFRWZTBOeVRoOU5lS2hS?=
 =?utf-8?B?TWZlQ1lacEdmc3ZsT1h4UWFCWXdidjdHTG1TRkVzQ2ZMeGpOcHcyWWozNElt?=
 =?utf-8?B?VG5kU3VOSXF4Q2ZQMkFRTGFkS3ZGSWVuY2lNa3ZBZlh1UTRPSWxVVEZZV1lL?=
 =?utf-8?B?ZEoyTkc2ZEhReE1hQVJTemxTd3JvTjNYQ2wwYThtRkJoTUxYUFBnNExiaGpq?=
 =?utf-8?B?cXZqb3JsSHIvcEs5SU9PelFDY2RuZEl6WnFCclFNVWJVcXVTSFZra1dzcUlw?=
 =?utf-8?B?c0R1R2dHMFNrNG8xa2t1WWcweVIzV3ZyemY5RFFvN012ck9ONS9sNmtlbVZI?=
 =?utf-8?B?c2x4aEJVMnNPOWVtcStUMjhHeEF6MTk0WW1GbEVNWmxGWUZkVjIzRHNzaCtV?=
 =?utf-8?B?ckMvWFhZMjBmU2FhOWJzS3dBN214bUVTRU1FcEloR0FQVitqVE1VUUFKMkxD?=
 =?utf-8?B?VkJsUmxaaWUrWjI3TXVsTWRiNTRKK2Ruak1EaXFQVnp0RlhrSVVaaWwxeGY1?=
 =?utf-8?B?aHpmTmt4RjFqVWNZWGdaOWlqZ0tRVDhJQTI0bUpHNHdjOU9OaWxSM1RiMnM0?=
 =?utf-8?B?NWZpWCtJeXhabVNzNUJuUHVCR1JzckpKa005WjcwSXVhUlROaUF6NlF1bkJ4?=
 =?utf-8?B?dXJVOFE3VUExbWloTE1YbURYQjlCdzlMV3hYL09DMjMvcmEyUG1lSjc0MzAx?=
 =?utf-8?B?YVYzYW5IdXZLUmIzUC9vU0JZNy85RVJpa09qZmwwdExFdXM2UXZ6Mjc3K3ZB?=
 =?utf-8?B?VXBMdEhSd2t6c1ViMFVObEU0cVErVy9WWk1PdHNCbWdsTWN5a3dleUFoUjhE?=
 =?utf-8?B?TEx6YlB2cHNsNUpNK3U1N0dLcExjSkFMamMrWTJHazBuYkJXSkJKK1pNL2FG?=
 =?utf-8?B?T0MvQVlHVEwyZjcyOWdFRVAzWnBKOXZ3ME9hQUQycy9RWTJVWGd3cGE0R3Rt?=
 =?utf-8?B?L2tETTRQWVFGMTZ4eGlHMVQyeUo3RzE3Zlpoam8zUEFSL012OUdBTGJEU0VF?=
 =?utf-8?B?U3pHSFMwZEUvZVI5QktGMnEyVFFOWEdHSWkxOStyQThqNmh4UUJRWWI4cFlJ?=
 =?utf-8?B?WEZsT2hSWlNGVXZJeWdOWU91bzVuUzhQa1MxUll2bnZCb1lQN1AvVm9lNnZp?=
 =?utf-8?Q?ipyBq8BjsOlC6hzo42?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3cd4c4-cebc-4c1c-deb0-08de5c7f0ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 02:03:07.9612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FY0BFeMVVRvQ71bw/X9Md7e14SSLjTRUazUq6X/2UsigqLCXs/ovR2fNuwO/aWNzkgs+FtXD6heHjwcY1k85tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvMl0gZHQtYmluZGluZ3M6IGFybTogZnNsOiBBZGQg
aS5NWDkzIFdpcmVsZXNzIEVWSw0KPiBib2FyZA0KPiANCj4gT24gRnJpLCBKYW4gMjMsIDIwMjYg
YXQgMTA6NDQ6NDdBTSArMDgwMCwgU2hlcnJ5IFN1biB3cm90ZToNCj4gPiBBZGQgRFQgY29tcGF0
aWJsZSBzdHJpbmcgZm9yIE5YUCBpLk1YOTMgV2lyZWxlc3MgRVZLIGJvYXJkLg0KPiA+DQo+ID4g
aS5NWDkzIFdpcmVsZXNzIFNpUCBpcyBjcmVhdGVkIGJ5IGludGVncmF0aW5nIGkuTVg5MyBhbmQg
SVc2MTAgV0xDU1ANCj4gPiAoV2ktRmkgKyBCTEUgKyA4MDIuMTUuNCkuIEFuZCBpLk1YOTMgV2ly
ZWxlc3MgRVZLIGJvYXJkIHdpdGggdGhlDQo+ID4gaS5NWDkzIFdpcmVsZXNzIFNpUCBiYXNpY2Fs
bHkgcmV1c2UgdGhlIGkuTVg5MyAxMXgxMSBFVksgYm9hcmQsIHdpdGgNCj4gPiBzb21lIG1pbm9y
IGZ1bmN0aW9uYWwgYW5kIHBpbiBjb25uZWN0aW9uIGRpZmZlcmVuY2VzLg0KPiA+DQo+IA0KPiBJ
IHdpbGwgbGVhdmUgaXQgdG8gdGhlIHBsYXRmb3JtIG1haW50YWluZXIgd2hldGhlciBTaVAgZGVz
ZXJ2ZXMgaXRzIG93bg0KPiBjb21wYXRpYmxlLiBJIGltYWdpbmUgdGhhdCB5ZXMsIGJ1dCBkb24n
dCBpbnNpc3Qgc286DQo+IA0KPiANCj4gPiBUaGUgZGV0YWlsZWQgZGlmZmVyZW5jZXMgYmV0d2Vl
biBpLk1YOTMgV2lyZWxlc3MgRVZLIGFuZCBpLk1YOTMgMTF4MTENCj4gPiBFVksgYm9hcmQgY2Fu
IGJlIGZvdW5kIGluIGkuTVg5MyBXaXJlbGVzcyBFVksgRFRTIHBhdGNoIGNvbW1pdCBtZXNzYWdl
Lg0KPiANCj4gRHJvcC4gRG8gbm90IHJlZmVyZW5jZSBvdGhlciBwYXRjaGVzIGluIHRlcm1zIHdo
YXQgZG8gdGhleSBwcm92aWRlIC0gaXQNCj4gc2VydmVzIGxpdHRsZSBwdXJwb3NlIGluIGdpdCBo
aXN0b3J5Lg0KDQpPaywgd2lsbCBkcm9wIGl0IGluIFYzLCB0aGFua3MhDQoNCkJlc3QgUmVnYXJk
cw0KU2hlcnJ5DQo+IA0KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg0K
