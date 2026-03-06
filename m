Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05936C0B2
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812974; cv=fail; b=lPq5xqj6wN5Zyy0zmoZGzOCPk1+pmMkYPIw6klWzW1b+k/5KNMF9JbYPWuKsoXSPQMrgSRFEOmlEB0fIyM0sdQrarPlQjowFzaebg1wCftDdIU0VZuFeRvhQGeR4JssGNu/YmCfiveHcr3ESOLeZMAG3pSWviNKXBomts9Ez2GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812974; c=relaxed/simple;
	bh=+7oKznU3GFo4N19uHe7ch0yDCrK2F5rV+2igjox4oQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G12KYszCb/lGtxLAs5ZlraPWxHlgi0VpXWNxBotw9G/f36I7o6pKtrVv271WCHeHZ74T/qDAWL4MHaN6BKzxx4M2cpLVQb/KRRkmo6xOJdLIFWjDTYsYAlmVF5JdGGJYG/vW2ZBVtSdMAmRkhd4SSVrFt4Kv/ze1MjGRRgTkhck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XqS2W7n8; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XqS2W7n8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrgqZiZIHMjOozJkJ5j1aOmBcR2IvQIxLPYbxWyJpHzHImY4w+jh7c0t9AlCuq29sE4NpLMZjKUFZeGGqGa+Y6+O5XRcoWrAI/nph5KQKgTSgDaMmGLwBVLPaIXhDjsw1EJZRbO0dVpz79BYXBtcnIHjfb6pHf0drciUrW+y6BWcrjG6Lm9VTKVuTxieE+7ma+K04eKM6oOUWRONoiT9pRTPd6Fi3P7JqqC91xyZbILP6oNUOpwBl7JtpPpmyNG5h/Ue8BT6xt9u1fbbPSzkWvHLCGEnLIsjU35Pl7/SXzkUgAiTB/73o/+kyOL0pVLXsPfsTqJ4+YqrYUq8oGfQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2LzxIp2q424U9poxyTaIojWjRzefZQfJ+XF7mvx+pY=;
 b=edzXOt3y7tSvuZcm+V8DiY2Xy5cxlYatEHCtLxBSzOVk08oHViHsKeomedmZ4tgAIO9r0cr5bM7qKRxs+iE0qe08mao2P+6IARi/jLjvmlKZ0PhJRFN36TByYM65Vjn0hjygpqZLs3AGK1GYn9rfxZbqq29r9ohWpCiiW+aHg8WFrpxicjMEsvyO/0Jps5B+2Ms/Un9x222mcttRipU1eEUMEfp7ihmHPkst9uvVQxrG662oPA17NpFySi2+YEUJRz5DsmGJyypk6B03ge4qJHVr3Lf0ewrYv+QAkD/cRFgtsFzQ7QyojZay3xP/H3L2MaR2k7X1VEvjcm/R/DdLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2LzxIp2q424U9poxyTaIojWjRzefZQfJ+XF7mvx+pY=;
 b=XqS2W7n8I5uCJJzBYYrH3A6jyg21AjDSDCsPXGl/VUq/s5hXaQwoChas9tzcRvGgUyftyJTJR0Z6mG0O2hGUP2bKDeGb5G69/r9RTBmtTLHgOxo6JMcTQ6Rts2kZ1/eARRhjdreBtpP4LWZuDWaUmQhnfNu6mBhxftWiPwxrA/a9TB4Kw5C+A7B4QD+brfFHGIgFtoanpndPWF0lsF32Izac2nDjHhq7W1MEUAr57oq1LqrMA0guX8+NNjm5aHzFAYo/19beroZOkHscA0nkwQJOemd4cqRsmBeQHcBuPWWUeW3oRbuB00FR/iq0MARvMDi9od7X2zfdg1ZdRK5bQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7678.eurprd04.prod.outlook.com (2603:10a6:102:ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:02:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:02:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Fri,  6 Mar 2026 11:02:30 -0500
Message-ID: <177281293090.267666.2279739168174022521.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bf4b38-8a86-4782-624c-08de7b99d0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	E887sVfowvccK62vh8YIZs1F0LAWMHJNM8mJT1zW1Ebqy9v18tgJKYylqIY7vj6w/VnBNc+BQeQDwcrYUIMh6C3oihQ/HumykCkQ3tBS5bed4+NrRyd9BnnH9fVCxH7Wfh0axpWgLjMP9nNsl2wFVAUUSabKODgH28YruFfZbKxDwrb6M034JxX1rrVufZU/kz0bZWSYwu0jti6e4ypwBLZMdrGiZWJTpOqQNYBqmgG2S9nC9Zy7G+/WQ1Wan8VKb574DRfNcEVNBs4NqZEJW9CxTkXTzYjo1sLCZe9d2wAG+QBQee2i5KPDU9feJWBlcoAz8nV1yMqaioqVpCn1HraRgbFLHFAw67YLEoWA6uFjo/Bwn0F1/wo2vOKrmKLieHNbPAyc8elWbjz8Omyj4PJb/Z+0DQWJgW646OUtBOqLObjrR6PGJDyqFe9hB3sUaJ5xwtlBBBRraJhWPbu7VQRBWNjd+OYQPutobUTvRY4/ID+f3U2kWHS/XxieZZuBh+QkVVyV00FPNtHWOnZUstS0BPxYSkqIEqYDqh5HbYm/mTBvGXZNfw9vLFjQQQ9gcTiTuFdLYheP7gg7ZC1Ghk0vdCbE7UYV2FpqcBLVhEME4V+1sevRAgIwFJCUOES1Ni76Z9hoOViv9frXsdUXAJ+O4ZPjSUy5wjA3krFw+56Ffcw2u4Nc5CMy2qOZARxxM3LUPx1Tb3DL7tJjciB/Zez9DfuQDEtW7iI1hdsvj56I4b6FAd+brIBsrCPrTjwzcLGiDcG5be8VS67934mUcBPLbk8LAfN72m/rEBrOBjmqGtq5JUmCdzb15IUQmGFz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0x0NWFTcEs5YkdKOWMwWmlwQTRqbm53M1krbXU3dDE4Z0RNQ29HcVNOZ2Er?=
 =?utf-8?B?S0wxZXhzOG52Zys1RmVSVVZQdnptdE9zQm5lNVJ4cDVxVVdLNjVkM3pIeVZh?=
 =?utf-8?B?UFBqS3NaWDVpd2trR01hcW1BRjNGSTFiODRNamtFMGJ3Mk9pRVRnVWxSSVJw?=
 =?utf-8?B?MjdyY1RmWmFHaGo0ZUNmeHVqaUFaUFg3UEM2bUxsRGNYMWx5OWpNWW4zQzE1?=
 =?utf-8?B?S0xQTERHc2tsNGR4MXVBbFVrQnRZcVlhdzdnUzRKQXFwQ0gycEZ1VU4vem1m?=
 =?utf-8?B?MWdXekVlUU1jeXJucUpTUmZXd1RrWDVHMnQ3dSszRU5PVFFSVWJFcjhCTmZh?=
 =?utf-8?B?ZGhOU2R4K1lIOWNUak1TUk9oR2VUcGRUdGRLWjJPVGhOWE93M2RVQnZpWTNG?=
 =?utf-8?B?UEVvN0t0clgvaHpMNkpQMzVHaVVyYUdESWJpOExJL3hKRGczVHBRQTd6RHE0?=
 =?utf-8?B?bGtMOFIrbjNoYU13Tzd2SFgyNXdhaThFM2l0b1pyWWdTRWFBNmhHOW53bS9V?=
 =?utf-8?B?dVVFZmFaV24xTWR2MWFGNVIxQlJPNlk0Nk1tamc3WDdIV0NjSlE2VFVRUThR?=
 =?utf-8?B?UTB1R3BhTDh0WU1acjV0cHRMYkZsTm1uanoyMDJ3RkZUL21tbERrK1d5UWFV?=
 =?utf-8?B?YVZkQy9nK0tRUGhUL25IczlVUkpOZ1htWTdqdE9kWHFhZk9SR3JIdmtQdng2?=
 =?utf-8?B?ZkFQLzBlYnlYZCtyZng0T1EvT1krZE9UcHNvUUxBTmZ6SDI4KytHQWowNEVN?=
 =?utf-8?B?VjM0T3AvQ1EzR0MrT1hPNGRzaVRNbFlmckJSRXBlV0VsWndFb2NCOWN1TnNZ?=
 =?utf-8?B?eVF5cVBUdi9wZXp3MENmV1F6VWlvWFIvVEQ0ZFRLWG9ZckswaFp2a05XZnVw?=
 =?utf-8?B?NjVVU1I3UUxSK0I4ellhbkM2STY1SzVYRTBXanZ0OEVLNENCRjBqellEdXMr?=
 =?utf-8?B?N1RvdVdMQ080bUtQQkNtMytqcGZ1R0tEUGEzaEdBWFN3eitnUXFSdnRTU0k2?=
 =?utf-8?B?cE03bDF5STZUZ1JUSFpqZTJTVEtKTWZ3RGRIcVR5MXBtOGVxZDBOTEZlbzRD?=
 =?utf-8?B?U244NE1OZlp1aDlNUCt2WHpwSjVmMXE0bGc2dkZFZnc1YW82eTNTc1Z6allz?=
 =?utf-8?B?b2hMMVp0N2VOenVrSVBPdXNjVFlqeWlLekN4QldheW1Td3IydUx2bjlyQ0dh?=
 =?utf-8?B?OTBjd0RkYkVPUmNWQm9uOWl6VzJsTjd1ZkNnd2dhTUN4Y0FHeGxRVkZSbS9k?=
 =?utf-8?B?RUNESmNRS2Y3Tm90eDAvT1cxeHRRd0tVVXNWdE5lVzR2YXBaQmtmM09UY1BU?=
 =?utf-8?B?Q0hzVVdUL0RScGU1VzlNc1RBeXhpcDQ3eHVNeDA3ZXk4SGEvWk95NnppSlUr?=
 =?utf-8?B?ZVJ4aThXdmlWQmI3OS9YOGlaZCs0U0N1ZkhmSmVMRmtHbkJtaWt0VC9hWVZU?=
 =?utf-8?B?ems1MnRjTXVZcld0L2Zyd1M2OXJlcTZxT2dxcEQvaEhKRk1MMjFlYjhjVy9E?=
 =?utf-8?B?L0xnaUZKRjg2TlR0aWM2V0tIQ09Ka1dPaVFFTDkzOWIxTi9CWTB3Vk43eVNz?=
 =?utf-8?B?OWtSelR3WU9pSW5rVVZKZWFGK2xmU3VsYyt4dUFDd3hVTFE4TEh4KzlhL2JP?=
 =?utf-8?B?ZVlSWXpBSzJXNURFWnZtNmxhcnZYTG1ycVBSQTR3dE1qcHhaNkdIVkNCaVc3?=
 =?utf-8?B?c2NHZDFYZzJmVVFoNjl6OHA2K05kRE9uazZJcVVKejM5R2xESEJjQUpaSklB?=
 =?utf-8?B?UE9zdTBtQ3BpYWFkVlZ6Yk5yd0F5QXhiR3MvVDdCekNQK2tuZk11dnUyemFi?=
 =?utf-8?B?QThocEpNNDd2MXJTV3BuTWw4TkVpaTlmM2tPdlVNOXJmbW8xbWZXblFhUk9Z?=
 =?utf-8?B?QXJUYmFFMkRjSTBlQyt6V2c2b0JHZjBLM0o3V1RXem1KVFVQVlNwWXZseXJ1?=
 =?utf-8?B?KzBMaTJrQThOaVFFTzNGc3l3L3BwaWRFdWNPMWxFcWRqNVpvQ2tsSXUvOTdi?=
 =?utf-8?B?eDJWT24yT05KVVVKa3VabnFSZXRjcUVLYWhFOE94TWFrSjBQRkg5SXRuL2hJ?=
 =?utf-8?B?Yi9BS1R0WVFjN2NJT0dEbHRHVXZtVU9pUjN3Y2wyNzlocUJVNTZFNVhYVERP?=
 =?utf-8?B?WlpyTWpXOUN1c0dUNHpXcFMyWTViQ1ZXbGxPN2swVTFMZVQwY2NUS0wvQ1VI?=
 =?utf-8?B?cUFoUGw0dDkyclVrT0FqdlBSQndSLzl2ZG8ySnpXRlhHU2psdTJaamw1SUdk?=
 =?utf-8?B?eFR2dnpMSEhxaTJXVURIKzVYWUZyR3lGOHRZYWtJRGpydGVQQ1EzNU5abzZj?=
 =?utf-8?B?T2tTakFHUDM3L1QrV1JJeW0vazJtdUVnVXFld2FBMlZGT2lUVGlvZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bf4b38-8a86-4782-624c-08de7b99d0b0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:02:49.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caVIPxhCclDy0f4ERduQn2Yjg9bLmh7CA7OVhnl31c14ULMMnKjCt67tScwGIAp77GT+AgM2ehEzkuyaYFkWow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7678


On Fri, 20 Feb 2026 11:36:15 +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This contains three fixes and one cosmetic change for
> the Kontron i.MX8MP OSM devices.
> 
> Changes for v2:
> * Add Frank's R-b tags (thanks)
> * Enhance commit message of patch 2
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
      commit: ed35f6162eb43e5dc232b91e903e6a76ee5f5601
[2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
      commit: 02ef82e09f96a0f5c996cdd4d62e66cb80df9f0f
[3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
      commit: 0ab1f5f3652424de16b464488c3d3db3d88b1bd5
[4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
      commit: f7bbf27af999ed3f6568f0266e112eded96f225b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
