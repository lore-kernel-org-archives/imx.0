Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B443636E
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082676; cv=fail; b=bbNgwWBrbjQ6quHsw8n8y5WmCSnin41HBzosjknY2zgEMb2ZX+YDpXiAFVabiLolHUMEBb7FdUFnw8VIJZzKsTdKJnTegZILaut+emQaI9d4TxpW0jyThtZyzZ8FN2CtCPAtPQR/gtcu0SYP5LrM/zGjlt96KlSbWpytcJgCMDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082676; c=relaxed/simple;
	bh=RPCYikHME8VRtzmsHjRWiKlgIhpCJgXIV8+Ru7JQ1dU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TyGXPOPAjQek8165j8zvm2Axi7g0LZEoxiG8l6CG0Xw9AJ68pzggzKMRC8QlcsAgtbb2GNWSwaQAhlAdqMIfgeh1IU00Fx87cCYn67g6+9Qqppg2RpJDUdw/L3FcNiTOjMgaxT8JYeaL65DJum4N8uLOsZ0q0DD66K+AhHblJGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pc/muUWj; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pc/muUWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAfcoeBEAL0Ou+gvu3KiVuPH++6/FRCEktqNm9sc+pKeIodSWrxn2JUrG4jT+2thNjnXDkBt03rsi41X3TUJbW78/Vu6v1saZqShN+Fc3ctW9Glmhd9fKbdxvaEuwNhOTllYMk9JvzX/HhMptD5GHIUvEra/whcjjIhdJXUrugYQxtl/DRUELeku+SloDkcY5ilcOiF9Ty9sSZ09jjZBYOvmzD7zHlkSdMRSQelfmiQcWkGlbHt1UmaTAa+KI4SJEnuOwMorttm5G8RRq6X+m3rBuRrkWhXB0+zvmI0qF26JggX9OPdqOvmWEJk7HGtgvSIK+8+4woAMjhSyqfDosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8UhfLIBqfRwMSveVHfWq+HxigN5L5lDl95UTE7JhIU=;
 b=MiGLOFUDaPJm5aWKp7SUGsHIGSFDkjyVLtddd+yywJXK2kF9hIBiyEuLYcdqSNmlnwidYSD7lQOWpx3TVRYZSuZgEDE/d6NSpIFlaTtrzIt6mjaaCD0UaqjUrBhYcpuADoE3t5kw6H9VOwpIr08esVyHhtkklbUf3f1M8TMYI29k9uVyT4xylDkaF1UuXlx2d/HrcMGzsXEyAscCZAf10eKgMR1Qc7uJwOoOafC5W19gpA2WVCtHzagnxLXf16cMdKWTrltsCffQHKyb/eZGGKgGZ8WhkxpJEgQMzU4JjWYb6HO55zgVgjLzGR/dK2IskXZh+fAxXB1ryiikRI81rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8UhfLIBqfRwMSveVHfWq+HxigN5L5lDl95UTE7JhIU=;
 b=Pc/muUWjahN/QXgmhbokAUEUhqtuB1Zqef9udYyik67OeHQZLcW6t7NxorwXkHjloi8rFWeQBmbc3mDGzObod1r7vJwxoJ+3ZfFkA/5N7VfFDI1XdFROhdQmHeETc/fpsuV4fUDbyRk/jHJIv7uRvCusqgwx5Z98CPykCL1LyJcU/t+8dXTRBYR7UAlOK4S9bHG3i20sREf1CozhrFS/O3C+ba9vMBLqIrhjCslJ4vhBdM8CrLOJAnSGrFe6iQDw/DdCtyOXvIjf8aHqkCAmyifJiM7vcXYGm16kwjwYGoHPS4htTm8WpTewX3P+g6d/xIyGqKO92CIUR6fjGUBUuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:51:10 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Thu, 22 Jan 2026
 11:51:10 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 22 Jan 2026 17:19:16 +0530
Subject: [PATCH v25 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx-se-if-v25-4-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
In-Reply-To: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769082570; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=RPCYikHME8VRtzmsHjRWiKlgIhpCJgXIV8+Ru7JQ1dU=;
 b=UML39Nr0DpknJRu2WLOshZOcPAUuWdrF2rKVPx2I9OegmqkhgEcGDws3Uommu+z1WXbTSaSos
 v4WBEafeh2UCNV1RAUsMVbMWWCpuzYJozSKnJHea/KjhG4Ag9MWefC3
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GVXPR04MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: d6efd2db-0b6b-49d7-c619-08de59ac8933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REMvNWRaTGIxRHpqcWZDWUUwc3dHMSt2azBhd2lkNnliZlVaTDZTTUR1dzlh?=
 =?utf-8?B?WDAwYUQ3QVR6RDQzdEJuNkdaZ2ZqekZMY0VFd2lDTU1IMEZTRkczd04xbzZv?=
 =?utf-8?B?RDlWRzJkMi93T1lMakR6UlVzS1ZLd01Zc25PTVpheGM4dmkzYnEyMlMyUzJy?=
 =?utf-8?B?djRkbnoySVVPa250WXRTQ0d0dzlmMU9SbTV0bWgyK2lMUUJ4cHovM3d0bUdi?=
 =?utf-8?B?bDBKUHJRTVg4eEcwYW5KanFxWnplMzh2My9PODMweTFVNmMyMjlMUTFkeDhs?=
 =?utf-8?B?TTUxbG5hSVRpdHpENGZRN2Y1RG1SWFpKL0ptSXhycDZUbWN3UFA0WXlqWU9y?=
 =?utf-8?B?b2Fia1pLc05nREgxRVlCcTR3VHpMUDd4TkR5d3FwRjhveHBmRlFFM2JVTC9O?=
 =?utf-8?B?d050enlKdnJyR25sSjBENnJrZDJmaDM2eFc0RXpWd1NwZndHUUdEVFV5S2hs?=
 =?utf-8?B?NThYZkE5Mi9BVUo0eVV5d0lla1VyYXlWSFE2b1hwQStib21VT3ZCNWU0TGlJ?=
 =?utf-8?B?aGN0Y1VEU0JYY1RkVDdHRmRyNmh5U1hnbU5EcWsxN1htZFJlY2FmWUZxZXJv?=
 =?utf-8?B?SEo3UGZoV3RQempUYjhsdnZmQUR3YklQVHZraXIwaHIzeGFDN1VjYUlQWC9i?=
 =?utf-8?B?dHkxUUZqTVVURVBTV1pKT3N2eFhJNSsvaFpQRlBMb2NvUE5CVUp3MnYvUWh6?=
 =?utf-8?B?MFA3UzBqNzV3UWxoV3o2TEVOUGNzOFJpaFZjanBSanh4ZERqbDVmOVlwSVYy?=
 =?utf-8?B?TlNYK2VXQnV0V1JPVll6RWtwVmIzVXQ4aVp1bjdSQ0dCNjFtUzBCK3VzdUFz?=
 =?utf-8?B?cU9GWDR2SzVGWVBkSkNlS3J3VHVuMHhMdElpNmM1N0VQRmsxUlh3Q09tdEFZ?=
 =?utf-8?B?VmlWaDBmZ1lDU1NnbytJQ3BHbmpQVkE2aCtxdlRNWjA1MWI1a0lldExwUjQv?=
 =?utf-8?B?aGIyS3F1M2tWbEd0djIyOVNwT0ZMREkzZitoNjN2WjBaTExMMndHU3JtRW1h?=
 =?utf-8?B?cm0vWG4zVW92VkJQU1FWS0U5L3BCa1BmYS8rMk1HbWhKOGcxNisxV2dFWXhl?=
 =?utf-8?B?OFdCbm4rVVloUmlydFBRM2lHWEc2L0pvcDBtcW50WW13TUFoMk41VXoxS05m?=
 =?utf-8?B?OXlDSHUvUlEzK0tIY2hxWXdZa04yeGNRTkc2aHhkR0hoanpPelEzdGt6MG9H?=
 =?utf-8?B?Z1hSSFIveWFOb0Nrb1lFVVJhZFlUUDlQYi9HSk93S29VanJ0YVVHdzZ3RzRp?=
 =?utf-8?B?UTJ4M3BHY1U2cGRsaGV0cnFmTzk1aXUxV1VCbnBrSzNqQWkxcDlsckZ1N3lJ?=
 =?utf-8?B?aVJKM3BSVTR0UGFVcGl6dVltRUgxQUsraElpQWJrdll6NzM1S1lGTkgwazdZ?=
 =?utf-8?B?ZkFWNXdRSHRKbE0xdVRMWkIzdnUwOGZWS09Vek5XK0UyajNzM1JkZzZ6NmE3?=
 =?utf-8?B?djlHUlByMjVZWC8vU3ZJWjhUaGtCbjdhNkZTK00rK25WR3NIVkJEK2RMdDVI?=
 =?utf-8?B?aXJMRVVweE5Qc2RsRUNDelMxK2xoTEgySzNMS0VnbndrNnIyRGxHczVUMXhh?=
 =?utf-8?B?S3pmcHIzRlJmaHFHMCtnUUd2ZUljTmVDMGtZM0ZMTHd3WXNwWjBLTkk1d2o2?=
 =?utf-8?B?TUxHS3FPYWw1VHFCcmE3b3Q4aHpoVE9pU0VFRGJGK1BZTzczdVpoS3dhZkhS?=
 =?utf-8?B?dWYydEl1aklvNVRRdWNSVXFtWnlJcDY2ZEJaZGZRMXU1Mk9hTXdvMmk0NGov?=
 =?utf-8?B?MGFyZndxZG1Jclh4ajcrZVFldXYxOHhLODlrZjRmU2RRdlNrcGdlUWlCWCtT?=
 =?utf-8?B?aHljVC9PVmRBd3BIM2VlVEhhczVMYXVKbk9ncHpsUFRRZ1pSYTBkd1FvUFRX?=
 =?utf-8?B?bTB3TDlLNVI3QVkzSUJybzVDMDdnOW55WlRtWkxDOVlVQkRTNElIcXNkZDJF?=
 =?utf-8?B?aHhIbVBhemJ1bXRGRHBCV3dYNHhJMytkSXJqcjFQQ2NVZHFxcWVNaXl4bWt6?=
 =?utf-8?B?dWxLZ3RmVXBJSW8wMlRmMldCOC9nZ0lpR1RuUXRJcWpVbXNVcE0xM1Yza2tp?=
 =?utf-8?B?NUFhQUxzWGp5YVVzODNjSjNHNHFQNnF6eC8xdmVibGJ0MkV6bUxuWEwxelFo?=
 =?utf-8?B?UEVla2pCRFhPbitXYmowdkw4MklJdUVWdEJ0VGt2VHhxOWlBV2xjQXlyOTZC?=
 =?utf-8?Q?HYqjzHCXxHnKoA/876woZPU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDR0OFRTWnBWbjE2bC90ZmFyUUlnNXRkSCtyRVVUUmRtWjBOZVNvZk5sdGpG?=
 =?utf-8?B?NkkrRTJhODlaSmtJSXZZMzNncW9ocGs4WCtKSy9vdHNiUFVJcmFPZzJocGcw?=
 =?utf-8?B?ZCs2K0M0ZmdYb2JyUEEzaCtRd0NrVGE0cXl1dE5qR040VUpiTmhyb01vaUhK?=
 =?utf-8?B?MUNZWThaaC9yd0hqd0ZEZDlQc1JGdlk4R212Z2tkN09DTkNDYnJ5QWZvZ0Jk?=
 =?utf-8?B?ME5iQnBVV0tpSDI3LzJxSTQ1WnZyKzZ2MmIrN3JpSitZR2VsL0JqaWlGVG5a?=
 =?utf-8?B?aDNqVk01OXpxMDB4aDY0bkFyOFRFcFlCRWhZeDRDWDdrUmhvWnBnQ1JxdFNy?=
 =?utf-8?B?L2t5VFdmZUd2SEZ4dFhCM1hON2FCM1o1TGNPanJnNVA5bTRJbTlXUVFCRUdx?=
 =?utf-8?B?MStqS3ZaT3ZGdDBHUE9uOUZqcW1IeFZoSUpiaGRyM0Zpbk91RE1uaGg1aHVz?=
 =?utf-8?B?TFJBaTdVNmdid25JQ3ZwVnFWbi9nT2kxcTUyc1ZhbGdhdnQ5SitucUJwMzFM?=
 =?utf-8?B?ZVpRaWVuZVZYdnpWRUplMXVrbXZ5ZUtETjBBV2xaci82c3pWeENLaERBbVBa?=
 =?utf-8?B?dm1WY0xIN2FlaGJsL0ExUm1INGhoQS9OVTRJeVBlMDJxN0REUkNhZExnRG5I?=
 =?utf-8?B?Sks4YTBEZlhtaUhoclpwTkhHbU5Ka1M5U25ubG1pdzRLVllCaEtiRG5heUxR?=
 =?utf-8?B?UkdTUytMYzBUTjBvQ0dhbllhZ0lvVzRXbzVyeW50ODZMV1AwT21iVEZGUEFC?=
 =?utf-8?B?alluTTVsT291Z1NWdGJzZzZHSjRxY0FCbE9sRjVhY25HV0tUa0puNlpTMC8w?=
 =?utf-8?B?dGI1V2NRblNDMXJTekI3NnpJWjl1NFk0TmprWXJKUUJyenQwVXRtTUQ1RU45?=
 =?utf-8?B?VXFXdEZhcVI3OFZtZ0IvQjlMVGJ5d1NpbVdTaXd5NUsrbU9TOXB4L3dpcHYw?=
 =?utf-8?B?T3k3K1NtbXdLalZvNEJnUzRGaGkzZXdzbnZSOUlqWm55VjloVk9aRXYxcUFC?=
 =?utf-8?B?MjRNMVdnNTVOaWtFc1ZSNUFhemJkckJDU29ubFNLMW4rMFRxTFh1MlhEQ2I0?=
 =?utf-8?B?VWVKL0I2Wit3OTNiL2s4cXlrY2FPV282SkQvWGtGWWVLbitsT20zOTJza2hu?=
 =?utf-8?B?TXg1MWg2QnlDSm1pcy9SaXI3U3VzWTdhdzlEWGRVaCsyVFpManFxUTNsRTBC?=
 =?utf-8?B?ZlNOdUhYOUpObGE2S25WbmZYR2x4Y09rVEczTkVrSjh3YXNkclRIcjRiRHM3?=
 =?utf-8?B?QmJoVkd0bVdJVVh4K1NnYkFXZ0ttUm9jd3dxSXdkOVFDejVEV2RrQTlQRWxM?=
 =?utf-8?B?SDFEc2ZuMVRKckNxZTlWdUgvQ1M4Um8vNjJmMmJxMmZNejZOZ3VzdThEOFM1?=
 =?utf-8?B?bjV6VjViRVFncXd1V2Yrb3B4MEc3bFZBalQzaGdCOUhYVzIxL2JFREtHUlZJ?=
 =?utf-8?B?NnI5bUR6b29EM1NNNDZhTUdtMHBFTFJNb0p5K1AydDhYUXpoZzNBZFVid3ZB?=
 =?utf-8?B?OTE3UWpna2hlQ3Q3cjd4bnRJZW5iMDJFRkEvLzBtblB4ZXMvZytDTmd3bDZR?=
 =?utf-8?B?Y3IyL2xlNXRvc0Y5UW9iVFJxWjFRMlRRTFNHMklMOThSeSs2UnBzRWhKSEJk?=
 =?utf-8?B?NmVDamhacHI4MXMwVlJrcHcrNFd6b1Q1L2x4UGY2R0ZDZjN1MVFIc2hiY1Rp?=
 =?utf-8?B?OWc4M29aTGlBaDVZTkVHUnRCWmdUek45QWwrOWRoNUtHTUZMZ1hYT2VGMUZD?=
 =?utf-8?B?V2lDZDlMZWs3UjNOR0JwZWNhRlZmcWVkYnU5MG4zNFc3Zk4zSGoxMU9FZHZ3?=
 =?utf-8?B?YTZBd21JV3p1UUNKWmR5ZW9HSG15STRxaUZicTFvOERUeUpsV2hZb2ZXbWlv?=
 =?utf-8?B?L1JRU2xwYkRZaHh4cXR6TVh6RmFIN1dmWEtzb3BkNitDR3daZzhGSWhrMTRm?=
 =?utf-8?B?QjlGVlkrU3NwTlQ4QUltWmJVRCtVSVlsaXNSdTdwb3dxTDlySFVUUHZUQ1dw?=
 =?utf-8?B?b3hXeXZiZ3NCUFBZalpHekV3OGJHeEFHOWZxUWR1cTdXYlpJTTdzUk93NXdI?=
 =?utf-8?B?WjJoZTZvbldaQ2VyY05nYlpOUGRETnY3YkZYcHE0Vjd0Y2ErNG9HREJpbEYw?=
 =?utf-8?B?djduRXVwb1BvTGxtaDA3MTJoYkQ3Nmluc0p0WWJ0a3NsWmIxUFhrcmlQb0ZR?=
 =?utf-8?B?b3BzRzBmdVlFNU5UUFpQUFBCSnBFSVA5c2dkeVdCV0NFYVA3N3E2dFFsNXg0?=
 =?utf-8?B?Q0JyVC9WeC9OeC9ZVFRwL2MzRGo1b2Y0dG40aVBUUmd3WDlzZkl4bEl2T0N6?=
 =?utf-8?B?YXU3Slgrb2ZWaWYrd1BXdjZBV3ZZVkdySTdJQUg0cWxYdUtMem9LZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6efd2db-0b6b-49d7-c619-08de59ac8933
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:51:10.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca5mSrgAHhKGSEdpBYKWCpgMWqJjCs7Cyq2GZqIsynM6TASKfmOsz5icOw3OFb8M/3PCW2QQKYZK08TTbZi0ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index da50686786f2..475ba98be199 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -60,8 +60,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -239,7 +239,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index a7150ff8e3b9..fcd0f561d72d 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 499a8d17368b..b7f3c8b87c2a 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -205,6 +205,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -328,6 +351,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 62ed450d3e21..fdb820458f85 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -37,6 +38,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -81,6 +88,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

