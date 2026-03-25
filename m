Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860203368A8
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463867; cv=fail; b=VBKIh/wyFGb7QGppwmvI0F96nUJ5gK2mNgeHH8ZtZXb6QaJ8R6EDh8+xDACbFUOBRjOyGCr+NZSWfzcJAsGEqTSYGJFAhEvM18KaTO1666zgaHhoZCuU5o6PQMkNbwHuQKH6jmOlNPH6GFMh8gPkELEB7glvuK7eVxSnyyLYNV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463867; c=relaxed/simple;
	bh=jfGoc06Sgk0R06P2mpE2TUVnmo+SLMDLXAX20g4/y8Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=PEEOh2bRrwMGcz36asuzNxXRK/G/0OnqLTZqA8xf5MpsohTHeHVSHqZLdU5n7QcG9o5SL5vpcBqxwb7HVxcOxJUeXoJshj0hy02X+En1yAhOnlSfszRDX4VqneKTjhNxhOqaimTNsSc1xGopHeMEvDnuUxeKGarnI7x2QL4pAFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FUv40vx2; arc=fail smtp.client-ip=52.101.83.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FUv40vx2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj+SMB/vy9+Vy5QmMNbLAmsuS9kuShvx+LJhc64bgWlajqdj+kcF0bRfPeLMFUD7fJk6W0hgxLi/E73sM73sB4OD7u/fTjW9Awi8CKIBd8Y1fIBIITGNTttZOMgqaoujwk1OG+LjIxtNWN1h0YGdaR99EHpih4Ffa5P1tAn8+AeuXpoldIchvECXcieTG7emk+Mz1NA5RFfwpADqNWUHqdPBBETQtnou1LXl1T2u4310H8TCnrRtAfV8FMDIg6JGmSfxzzUZm5+twSWerbcmci8IYfIawznab7ZA7kWM7ZAQAKYK2fqyo7k4l2sczmIrHnUu3D1DWiDo9uEV3sVEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJtlumO/m0suW8il0K3iw9z7pNsQSJteUq8nP2PxgiQ=;
 b=T2LNGyCXRNM33BIOmaNnRLLblEekdxTi/OuqSfc4+Kya1FSLK8WuCSu1eyWo+F/oEGg2p++7V398dF71+XqvzdtBZj9Vde7Inf+zhA0Qlz6bpzGKTlJEWqvg10Yktizw/ouoVpfFSbt6ytUKx8Zur941yUxnso5zWelymxUGoy57JduOiFMsV/gRmJlMsuNpQDxkcPI+lnrnyTX+kOKUPTvqZRa/iJZoVsN5VtHYhAxJ0J0sj3UUftv7ATahKYJuENHt5vVHyS4HCR2aF1/G8+ZUJM/bdimyjAo984FD1ji0hRJxr8df0r+kEngGxBYuTIKqHbHJITH7wXpRRKF6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJtlumO/m0suW8il0K3iw9z7pNsQSJteUq8nP2PxgiQ=;
 b=FUv40vx2wmRcPhqb8Eg1N1+WTjRwPK6EEDyasN1apQdlZJ2u5oABopwNCAzC/gKBR5EWLakKfRuthOqDBWZyxU6mFgde/HG4mGtwc/7d4GRv7JXx1o1qkeDfToLCMPX1t8ungSenDQReEZZaZqAlweRdc8NWd8xy+KwBnTxvW73AmvkQu+50Qs/KBm2rcEqnGcZmd14olwoKrLqFbPqpFC/w08eMe4XSjUneu2mmXzcCdQGBG883mfUDXF7U/uPDNK4E3UrRBx1DIQ7OCaYQ8voJj/mezDss8YXJdOFWKdmpleQnVbsRvaQxPdm/FLWh5E/9arop3uN3ENXas85dgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB10323.eurprd04.prod.outlook.com (2603:10a6:102:44e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 18:37:13 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:37:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260317053738.578187-1-shengjiu.wang@nxp.com>
References: <20260317053738.578187-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8dxl-evk: Use audio-graph-card2 for
 wm8960-2 and wm8960-3
Message-Id: <177446386030.3228168.15858408118553055154.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 14:37:40 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P220CA0055.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::8) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB10323:EE_
X-MS-Office365-Filtering-Correlation-Id: 0531304b-4eb2-44a9-e17d-08de8a9d99b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|52116014|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	wJnd9XH1xZJi9aKZLdVZJI+7ZhSltvPBIk3UD5ZAbltohjdgmt3pjnQmzHt/IEJ7Iuj7aPR/obCtTfmyxXlFiXMCO8PKg2d76AY8PD0/ECP7goPdz3UemhlDj757I5K82lqdZYmigXKz7qQfxpA6HqnkkinI4YkGio7h5vS+KxMUHKI0zI47/G4Kxjo2UR56I7t8hGsV4lvzZN+/AqbXIu2JypnAYXCcEPnSYdW40+VNCsUvnmFDllYQ9Ejaj6BSY4SlY4HDThhOALAjpXpjVoT5JIv/R9VlJaryQYkd4VCooDKMdzXkSKxwQUaPzrZIWXGcU5skGH6srl0hEManCp/N5krYInH2/7wYwgv0yKDihvsT5WWTbuNE1neG/gRS1Pm6rxcRBqvfG1UGvbFXULij8TnLCP/qGrpS905d9dPLfROlUYTZMYs27JjSZszZrzk7YpCVvaqTP2fL3YIWd2d79iuygOh7XxxbxSXv04chrXCZM9PpiFHFHn2zqzbq5SQQrPHfIqQcHGeRBHWmbxDJIod9M5ICNIqDlzj3hTBu0GlZksGD/WMXtosobLpqp1CUi/IcbAxRvI9iOfJ84b38eE0qZ8dIU14H0vt3Uc5Qq3e2gPLoXcwMbOKYW+nAqHbCZmY9v+DKbye+GEf1dhlg8YVcd8Emjc4UGK3gyVrfoNUVhmzV8Vlg6bwN/6ygVtVVhYhUw6JDUf5lT0vamltf+If2rodLFaUFhR4l0m7FxYFuzFqgEsdQiivFaWHEhN6ti8lkS5tERsIiEukZpZpWBDlCq+u7EAYiym3kkWch3LTWbVgt77xdaE68nsDy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(52116014)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmt6eTlmdDY0bDRnUEpuVmR2TzhPZnFhQWdOQTByeWgwM2wyajViQzEyclRC?=
 =?utf-8?B?QWVYbjNOdk9IdjdsQzRKVExuUFBmcyswWWVsMU5tUXhaR1ladWJidnRsZ3d3?=
 =?utf-8?B?enhFMko4SGRDMkEyMzNKR1dIWFgwTzBtR0R2UTl6WmJ2MkZyUThxRHFIWEtC?=
 =?utf-8?B?M2xWcHgzb0JwRmhJbnNaeFVyTTNQMEw1alVqY0hOM0kvejRMazIwazRSQkpH?=
 =?utf-8?B?aW1VRzM0VEhHb0E0QnVUUG5RV0djWXhJYlprV0FFYzlXZTl5YUxGbDBTaEFn?=
 =?utf-8?B?TEZxclB4MEZvbnFOZm1zOE5IOVZQZmVJTTkyNFkzU0RJYmxLbDF1aU51Mjli?=
 =?utf-8?B?T3VBN1BEdlk1OW5XejFkWmI0ZEFUdzU2K3BkdjlRRnZ2ZHJwV013S0FoeS9S?=
 =?utf-8?B?em1oQTRpUzZzb0NEWU9BSTNaNVBTaDFleWFpNnB2ajIzZ3FnSkEwekFXaWhC?=
 =?utf-8?B?UjZwc1hsTW91R2hNdllLUEhUSmxPQWZ2MkpwbVFaMVIwcHJSc0d2MWNWdXlP?=
 =?utf-8?B?eW9OYjlQZWgwbzdvWFhVdWFNMVVUZUFTdVBwZXV0SHlMdGU5dm9hcldLTmtP?=
 =?utf-8?B?NVhZd3pWUnc1WWNZZlBPR3FQWHE5TjFMS2wvcS9RbCtSblJmUUs0WkdYNWll?=
 =?utf-8?B?SXNtd0JKUzJ5RW1UemM0QlpEdFlYMVBITlJUdjRLRWUzTElTbloyelp0T0tS?=
 =?utf-8?B?TWhOVDlIa1JVU0RwYlZwK3NzU25oaEFrWFFJeGpOKzVpQXJaQjM4R2I2cXgy?=
 =?utf-8?B?cXpqVnFnTTExb3gzRlExbGt6YTQzamhad3RPS1pYSXRKc1BsWUlzNjJ2R0l0?=
 =?utf-8?B?V3Nja21nTWRPNHZrTXh0ZXJ1VUpRTWNEaDRFL1JaWjJ4a0RxL1dTQzd6Q1Rr?=
 =?utf-8?B?MXFuUDdJaFNpcExWNHdHNmdhMVNlSUdzQWxDTGFlajdvVzJ2TXlvaloyc2Z6?=
 =?utf-8?B?Rng1aGpubUVkaFJqQnJOSHUrMzFPMjF2aU5XSFc3VUpucHFFNFVONFJoMlg5?=
 =?utf-8?B?ZzRJQWtvS1FaWmpLejQxUGEzaGladkNLT0dUTm9weE16NHltOTgraVJKMG4v?=
 =?utf-8?B?SjE4UGwvOGJzSDRhOWMxdWNnT04wRmJmcS9oKzBnWTBjZS9MU2todm9oNUVG?=
 =?utf-8?B?WkxudjlPdzNySWlPZGt3L0paT2RhTWsrWkpxSXN4OCtZaC8wR0lhMGRGaHZW?=
 =?utf-8?B?TklwZTFLaGlIU0M5QStrR29sQ2E2ZmZKVytlU21sL0tBbk1RUkkzeFdKbmRs?=
 =?utf-8?B?ak83aDRhYi95aHJwZHAxUGNHalFETWtMVFlaaUtBTkcrU21JTmN2VjhoRmlH?=
 =?utf-8?B?YldNSlJGTXduL3hCbHVKbk5yNnB1NDk0ekFyRnFPNW5Ca21KczlMUTQzcGlT?=
 =?utf-8?B?Q21pVzZvK0VhQzRTaEZOQTdvMWtpRFFFRUh5dWFOcUs5NFpJTFJZU0l0RnRW?=
 =?utf-8?B?eUxRaThWdjlzc3pucmRtMk5KcXphSFJVOC91RDJBMmdEYmtjaVFOQlBuS1Zs?=
 =?utf-8?B?Vy9rblpxVWZmRDdZYjgvaXk4QWdSUm5QZEFFNGMybWdBOGdJdWdvZ09UYmNh?=
 =?utf-8?B?VllFR0hEUWIwUDFyaXVEMjZ3bFhscUhoUEtZSTMwOWZIVk5kM1d5VStEZy9l?=
 =?utf-8?B?TFgzWnc5R3RBbDhESDUwRkp0MXovV0g3YjBoMEMyQWVpQVRjR09vNHVpV3E3?=
 =?utf-8?B?aGp1L2NjZ1JyeWtOWVA3V2hWbEh5MW5PbjJQUGxtdlk5Vk1wM29SdGNZeThl?=
 =?utf-8?B?MmZtcVYvYUdpUnkzSnd5RmhKMmRRUW1zcUVQVUd6dlkxSGxocVBSWjEvVlNG?=
 =?utf-8?B?d0svZ3VuV21lUW95Wm9QRXM0d1hYKzVBRWdDTnB5c1Y3TEV5ZWlWWUdMb2Jt?=
 =?utf-8?B?MUV3ZGlxVUNuWFJvaEhieUZoNmxHckRqUVFxNmo2L3dNb0FKREdFRWFmd0RW?=
 =?utf-8?B?SnhjNERDL0l1cWxwS0lNTk5iVmVwZkRmNGlmSzY3QzNuenBQTUljQmV2ZG5I?=
 =?utf-8?B?dmQ0VWROM3d5bUR5Mm1lbDFKMzJreGtkM2M0ZmxMT2gybFRUMUF0a0Q4TGFj?=
 =?utf-8?B?UkhKSnRKNnptMmRtNTNWV3RZOGlNc0tONnBOd1ZWT2N1OWpsT0ovU29sbTUx?=
 =?utf-8?B?L1JXanJ2UXNJYkExVjhmZTVFWnkvYmFORWFMOFNneXY0QjQycE5IZnZzYTA5?=
 =?utf-8?B?UTc0dEM0dnZpK01NeVZ2ODBrQnN0TVhzS3hVeGEwcWV3U3hEZUlRT2lzTERi?=
 =?utf-8?B?c2hrOGUyYnIxcW03ZWgwK2ljbEtWcHIvdkRZY0lzT01ack5qTW1weGo1eEJr?=
 =?utf-8?B?d2VFU3NXa1NmR1YyOVl2cDBIYkxpb2pGbldBa0VhRGlXUFNEUFh3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0531304b-4eb2-44a9-e17d-08de8a9d99b5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:37:42.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMcF5kJ3v61JLMeGq8RxWRPb4AZY3M5yKZMjYjJOyCKmonzfLaINKpAEAqkI25qY60EyBO1L2gi/jI3k06eI2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10323


On Tue, 17 Mar 2026 13:37:38 +0800, Shengjiu Wang wrote:
> The sound card wm8960-2 and wm8960-3 only support capture mode for the
> reason of connection on the EVK board. But fsl-asoc-card don't support
> capture_only setting, the sound card creation will fail.
> 
> fsl-sai 59060000.sai: Missing dma channel for stream: 0
> fsl-sai 59060000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59060000.sai
> fsl-sai 59070000.sai: Missing dma channel for stream: 0
> fsl-sai 59070000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59070000.sai
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8dxl-evk: Use audio-graph-card2 for wm8960-2 and wm8960-3
      commit: 9055b1100a7758efc817edf80d19724c619f9073

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

