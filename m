Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC134EF08
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 04:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102840; cv=fail; b=HnkAfQS9RRUFQZ+iJH0nzziic614bSiI3aJr81QAgraYfl7nSR8pBRrevzIb4TBS2qrGR3TI4+5aO5clS47rV95J+nTThwvg4Ks9mh4b56rDAc2h6aH92gWvhnEm1iPbCRNmQHD/qMynKVUAF1qk9ztBzB2fx2aJUF4wj6irzuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102840; c=relaxed/simple;
	bh=o3DXe0W3De6JstX13kahvOzYLPgeCUYBJA5o55fpcLw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dpjHecRBSNogFnLJJmD4RXllFiFYBy6lCC0zWnkfAb0hj3BGLsBngtR+gN/JYXWeLsj+jKuPZLHKWaXMs11vUQcKHY7L/ym0fD0VPijXqUfPprPOPshUAAjSOLZUo6qx9vDBum30bvPF3jSW2Hcu42BBaEw1Rv4WpnDMNFby65k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K0BrxylS; arc=fail smtp.client-ip=40.107.162.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K0BrxylS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXVSU7V0DE6QVmLb6HTdA3sJxV8lHmYDWD/r2DMIgXIlx/8LcvuajE+2yiFrwFk9GaY6FHMTvtksr0QdZ3QY/DClMhQMpoftami558MTebKXPiDXUexmAl57h4hemQk5LQbgwabh9NYJWHe3FLSILvFKI535zHhZDrNfuvE66WKFCPvhX5Rigg/lHTc949lFNJrvvJcy4v5bexmLzYZSrkkiZaAeN/IehEyQ8acZWBo5Tb9k0ObW3r/ARBI9ftzorzsHTJbgtFmUBYd8jQizGNq1qT6pd7qRS50jh1ZeVaRJp22NEoZJ3K5aNFwSiCKlurP5Zz+IuKMV4D2V9OimRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itTTfABoqNt5Yq1uh4hxvafHLM9qMSfk+EjeZnAz+VU=;
 b=uBDdD7kM/JiNeNNW/9OOG/n7iEtdifOkGerjRDY2LLoIV0DsR8U6pJ1rzQylg7zt+dYKpkUbr7GwKlnQhNb1knr+qgNAvn/olEQ8PSa510n78ao5kZmHaVBsTmchyiFg73MjibSTCyOABXma0fcBG4ZTyL7vd3K1IZvjariPRns9HTD1jv9obnzzQ1huHcLyka1HPaurZ8X84cJlPgqrLrJwt/sQ8XXPyhFJ4ZGXcqSG9DQVhN1CesuqcaL9D0eEE1ZRHrU7T4V19yWE2qomx3cMxbxOFGNpRaI4qUgVrNbROwB74s15pc4jFhw/wpvVimcdvk3hybJ9oIfo8bsHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itTTfABoqNt5Yq1uh4hxvafHLM9qMSfk+EjeZnAz+VU=;
 b=K0BrxylS9qzlEj8TGGlBUsFSeyeqyS3G4UIc+C98JFoRfV7YIWy9Xd/PiCMiOo2Tco+R9Hr9Y2wKn28C3cVVMA2Gvs4lfxbCBnwTBQBEccFsdsuAnPHm5Ygq9V8OvVZw3At4YRWb+rxgJYYBvsWu5RIPqCK5hHvz02KRH9cEqsTWMd/K2pWC/M3i4m4BFoyaobx1LvjB8LmMqYI/CzmaMFS5cuH7gOLW/D/No5PxKGufmOdJO1onDF6EsmqTGYbQWTgxJGTF/EduFpq0HtXE5pVZNRAI2kRhZhoUtvu6PeIP4LJmxtZP0q3QMz8LHDni/ebAtWwaXT2ShZnKTqzQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 04:07:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 04:07:11 +0000
Message-ID: <e8870675-f764-4d69-805a-cb2aeee84011@nxp.com>
Date: Thu, 2 Apr 2026 12:08:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] drm/bridge: imx8mp-hdmi-tx: switch to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
 <20260330-drm-lcdif-dbanc-v2-9-c7f2af536a24@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-9-c7f2af536a24@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 7245ded8-045a-4193-7c2f-08de906d50a5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 tiASy5KPbwf9mah+VruOm6ylXGa+5amvqN5R6Kyk0FJSxmE3Pta4kKL2CDXwapOxaiu+PBqMZf7Bn1ss98pEj5oGeq5MkqzMR286W+4kt/bGPnehr3WpDcYAgr+JLyVveZccn79NQ3ViexLE9lyaKL1N1P4Sz3GSSq6X02jN01DU9cTmJEG3Zva8ysHY6acnCGBYVa34rX/EO87IJ7hPfT1m0DpZ7LP1x82pTeM6tp3QjhV8377eD30ZYWiXws3EBzg9rVv1guztIc1S7jOmtQQZe+lt0W1npm1g7VEyo51S9L0esoBk7983jWVDhpBlp3QurKMQRq9NsfKkOV9i1CxY8ssTxlmL8E81t+F3VWKhDfaPwLA6bY0GCSmc9TATV0novNimsKbR2EFmrPRIq8eBDJev3BjQN6hKvAi4qcHau/Ed6ajZfKdQN4wvOSqzyW+67kHoYfgiV1S4FoVrvp6XCLwHtWdDRYHX8Y4d2TLOhxXK0AitDRQcvfkk5HzS17j7eeJqif5qTVSdjMvYO3ge3rQhABKvb8vGH4jPTCZxKCwpnV22shlcrVdCCXD3mRDvLmIGSqz7HJC/6DT85+QWxNewKBQ/YhiGl7/X7uINbfUbHwinovegv2QzDMqpT1FjKApocNldXFokegZj9aVEsyvUSgYLViNrN+WpEnyPE5tj7azdNLbzMALi24zxoFUirWOfW+sMCkIayoP9Isshp0uSKlnQguSE1pK1Oa8xo0ONu+aFYlJiTGCPv6jY8Uvik/w+sfwCFKuDmAYUkA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TmJkZU9QV3NZMXVZa3ZXNzBFYk54TVRxM09VMnpsNTY5bEcwTFhYOFcreklq?=
 =?utf-8?B?QTh1YmtLcFBXamQzSWsyeVVKOGdEQzhuV2FCYXlSOEpLdzVtUlc4V0RIY1hH?=
 =?utf-8?B?cEdCL21jWXlsbngwalhQZENlU2crN1FKSkpndUF2NGlxcTU5QmhRUjUrU1p1?=
 =?utf-8?B?YWpSbDhmVFNxcDhrTFFlNDFSZlQrbFFwQTNwSUE1S2tWaGxVVFBVZnZzZ3dt?=
 =?utf-8?B?c3YydGlrYWRvLzhQTGdWdmQ4aFlYcnFpYW5XMFJkZ0svcFhRdXp0dEdveHRQ?=
 =?utf-8?B?TTcrYnFGc1hXL3hUa1gzVmhNZ0ltbGF6eUFrakR0UktucWVTOVk5NE94QWRZ?=
 =?utf-8?B?WmNjMWdBN01OeGdtbUJINmpYWklBcnk2cVBKVmwweWd0c2ZpTDRoWW9pVGl3?=
 =?utf-8?B?dzFYOXJKNkc5bkdOUWtpdVFlaUNiam44TjJIVldIUWxFZ29kaDRDb3pUalhE?=
 =?utf-8?B?YW1LZkx0M1lYSnlhWnNvdXdYMmJ0ZVZrb2ZIVFlBakJ5WG80NkZyTUVNeCtQ?=
 =?utf-8?B?dGlWV1hLSHYyN0tGbXhXQk5GMzBMUFVCMWE2MklFdTBpRjFPYzgwK3B2N2xj?=
 =?utf-8?B?WWhSMjZHV0VMVExqbXVRVllsMUF3eWI1djc2L04zVnZTYWpIQndqaTQxL3do?=
 =?utf-8?B?Ri9iT1pGb0xIZGl0djBoakV4eDZ1RXVCVFJ1T3ExakxZdGRtMWFRZ2Y5SSts?=
 =?utf-8?B?OXFTYjBjWXljTkdON3g4bzFWU051MFUzQkhuejQ5aFdNWklSMHE3dCs2bEFj?=
 =?utf-8?B?ZVJvWElTeFByZkR6cmpYcU9jbW4wQzIwcEd2TXFacjEybDlXRC9yV0VqN0V1?=
 =?utf-8?B?Mnc5cUlyczNYalB1WTlGLzR0VFA3VWJSb3dzWTh2V29zMW9sbTIyR3NoWTJQ?=
 =?utf-8?B?Ym5uR04zSDJKZ0RmSG1ZcDhOK2Z0VVBzbzhCWnRIMEM5UDNvV2duaHlvMXFn?=
 =?utf-8?B?cDluOXVyTFgvRnF2MTRuR0FyLzk0YnNZblE4V1MyRGNqUCthazl6WUhQZVN1?=
 =?utf-8?B?R2dwT05xYXVaOHBIanF2TUY0K1MvNFRYd2lmcmg3cnVYeUxTU05nei9OSG1H?=
 =?utf-8?B?Q3B6ZFUvQ1ZqSGxrVHFIQVY1STRqZGdranZrMGFCZytPUU5sazhMazZESDgz?=
 =?utf-8?B?d0UwS2FOcXZWNFpGUUo0dnJkVXR3cCtGYlRzTk81cDM2ZEdJdkhxakNIc1ZI?=
 =?utf-8?B?L01SNXhwcUZEcHJhUHFxclJCL1V6emtIbEJQSkJlK2U2TWxibE0yaUxJNCtD?=
 =?utf-8?B?Z2xSZWQ0aktuRU1Mb0Z0dW54VDF0ZE9aeG5aYzQ1SVRHckJRQzNMUFRJa2pr?=
 =?utf-8?B?bzlTRWtNciswNUJFMEVBY3NkNWQyZmd1Q2NxMXFMQzY1Z0huNlc5S2pnQlFC?=
 =?utf-8?B?TzJVaXJDQWRFcS9aZWZXT2pRTzBqaG1sTmQ1Sitjb1g3YmtqSUk1UExidTls?=
 =?utf-8?B?REpHTHJjaW5ZTXowaFdWeDB0SWl6eDZ4TGVWbTVUbVVWOU1iMkY5b3NwSW5p?=
 =?utf-8?B?RmIzK1FBRmVsL290MVZrQlBxcFA3bmV2eWpZc21MQmU2Tm53bHdtRE44czhC?=
 =?utf-8?B?Mlk5dXFUOG5Vd2tLRTZXK0tiMjB2NmFBVG1VQ0RYZVJsT0trWmFyR3oxS1NT?=
 =?utf-8?B?cWtXSGJFRXhiUk5tbFh5ZFduVlVTeFk3b3ErVERncVZjd3lMaWgzNEgrRzBN?=
 =?utf-8?B?NnVybzh6dkh1OXdxcnJXaXorRTJVa2p2cGU3UWM1R0dDSUoydlZ5dVNCRjZr?=
 =?utf-8?B?eWJvUkU4eXhiTTZpMHV0cm41VHZKYUVjcTR4SHpaRVJRRHltN0xRWUY2TEQ1?=
 =?utf-8?B?a0p1dmRVYnFRb1BhM0RlWmVFemhvUEFzeUswZlVadEh0L0JnUm5Teld1N2Rv?=
 =?utf-8?B?UE9PRTY3Uk5taTdNM3FzUVRCUkdvalFVN1lBYWMwRi9NVUlpdFhSVkQ1ZjhR?=
 =?utf-8?B?T0RvZEFLa0VsZTNmNTNTMzFGcDJYS1Fjb09EaCtHSEZaUWV0cjRGWElhZUYy?=
 =?utf-8?B?RnV4T1JPOU1GcldrTnA4M04xN3hTaHBNOXl0QXA0NjlnRlBvN3hub0VIY2oy?=
 =?utf-8?B?SDVVUWRJZ2ZIRHV2MVVBNkk1ZVlXV04xTmkyVEpxM0RBOElNMTJYY0wvaTFz?=
 =?utf-8?B?c0pCZmNabGxGcDRZWmVLR1NSS0VJWit0bkV6WDhzOFcyZWcweXlrU2tNc21D?=
 =?utf-8?B?aWNVeWZXK2VRODU1NWZERFU2Tm9XT2s0Y3hRdUtLYnNqSC9IcWtSdFMzVXNk?=
 =?utf-8?B?TkVCU0FjTTgrMWl2YmZIZFFPcUFaRWtGZ1E4Q05LMy9CWmZKY0lZUy9nVU9i?=
 =?utf-8?B?TEtJVm4xNXV2NjkyQzc4bXhIREJkbllYQWhMcUxxam5sOHA1cU1WUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7245ded8-045a-4193-7c2f-08de906d50a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 04:07:11.5061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEVdQHXcNiG/x6RLEyLTMlZczDRzTY4wDy6htvL7/IPQTg7bTBMrHAqcvmXuwfnrPQimiJ6uvZxA+nNZroli0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

On Mon, Mar 30, 2026 at 09:25:50PM +0200, Luca Ceresoli wrote:
> The imx8mp-hdmi-tx one of many drivers based on dw-hdmi. dw-hdmi in turn
> can operate in two different modes, depending on the platform data as set
> by the driver:
> 
>  A. hdmi->plat_data->output_port = 0:
>     the HDMI output (port@1) in device tree is not used [0]
> 
>  B. hdmi->plat_data->output_port = 1:
>     the HDMI output (port@1) is parsed to find the next bridge
> 
> The imx8mp-hdmi-tx driver falls in case A. Switching to case B, which is
> the current best practice, requires that the HDMI connector is always
> described in the live device tree, and a previous commit ensured this is
> always the case by adding an overlay in case the device tree does not
> comply.
> 
> So now we can simply switch to the new mode and support
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - new patch, split out of the previous patch
> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
