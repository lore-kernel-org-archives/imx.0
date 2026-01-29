Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF633F8DA
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 02:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652437; cv=fail; b=TXdQwjXhzqRi1xxB9ry8HhUIeCgs8f7egyAeVaGbuERM/hLv5QSRFrNGmn3N8MFcj6LYqU5vlovWLF+3eqkGprGJWKf1YjoAM0sbp6JATY0Z/rhA6bNWVm+u9m+bgxO+oF6PJJbG/Q4juavMisHe9/mzmTSuJA1nLmUgi4/y+wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652437; c=relaxed/simple;
	bh=mFo+5fFievwOwKDFIJrSdao0Zkowp8stsWrNJcfu7uM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t2phvrdpnFQmZqfOFri9f/YKXkRiTvmZLq/cIQfqjioA9YCRkTM/ykvA4Rr75mDgg7aupJgXBQcH1gLJZ1r2/0+YqKUJxBTXzKfddGpFCdv0Z1ciSnbwcjm/7mgPAR+AvZbsynlWGxL33fj5/Ig3ZYgK0/MMWEYNMP2jzp2NdJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=amYv/qpS; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="amYv/qpS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB1BsUV1BMdKbty68/FuO56hN+TVH0C9dE0I8eZgUDNK9u7KwKpuySXeZbwV86tGXFxoyv1Arbg0g9o+zrfsuyS3TxTySN2zMN/STL2IfQiy+BrgnZiKtPTTIff1whYtiqVZEjq3s34eBE71LntQivriRgSGcM6GL6X9qki6DoTcwPPc0T/cRcYzGhomy3SgIiuTyoPodtMlz6eTlS/dGhSiPllb9Q36UDm9rF9dqexS0T4TtLInnj/in4UTb5poDYIHTp6qM0Bc2gpKJ5t3/cIh3ffZJdZ4vyAXaUcc1wqzfTT7/0rXK2MnedK9+Gkf/YQFn2spe/mhem6cD0nn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFo+5fFievwOwKDFIJrSdao0Zkowp8stsWrNJcfu7uM=;
 b=Jo0IO2sgtlQ3oGit3J8Sst7ltFCh61UKNVPnDuwSXeCUAjztmmyTQd+1HM6ha+q+B0thQUWAhSpLisCuLcy51mmY+PTuAdPjHCAQAe+YSgPQttJkUfcU8mYa8btwnkSH2dpxEDOtSv1BNny/OpSU12JD3SXtl0Bq2w4FrQ9NM8ALtRKJ7huNxPvsbYagWyo8QLFYkWD8fzTPmhNisNGzuVLCd7IfkylIKm3NuQoPG1zORTnCQjSd23t+uGQzAnLHzcFap+e3G+f2cnWMi8W5YnCASqLzXAIxY12NoZOLGFHHvO9ZxmMNnPK5Zp9PKCakAausj6lqfqks1L8VI76Obw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFo+5fFievwOwKDFIJrSdao0Zkowp8stsWrNJcfu7uM=;
 b=amYv/qpSyJwszjKI+HQPRU3u5SujpQlMsqMqmCa6o+gB47HezVysJCQh9ER5YakUf8pibVW14dJpIwmtZmATKWOPMEKlzJfrHOWO9uEncTIgUaKLaTKcTnKsXcNkpW8pl9qR6OpZ+Tk1BefVTrVDqE6VFyDS84Wv+6iFsKi5TFG2W2+O0h9cMeokNgt5oh0yJWitmrilSiK+v9R3qxP+JR0N96PXcRu+2Zk6nShH7TFgePrXTDT8Skw50Aj443BZy48Va4uCDCxSw+/9bUxFVguzxc7hKb9W5SaR3stXzjQ/QOUMBVMcv4LrSy/KSVLkiN4+Yc7gfHLLwSZ8q6+ayg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU4PR04MB11962.eurprd04.prod.outlook.com
 (2603:10a6:10:617::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:07:06 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 02:07:06 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3 2/3] arm64: dts: imx93: Extract common parts of 11x11
 EVK into imx93-evk-common.dtsi
Thread-Topic: [PATCH V3 2/3] arm64: dts: imx93: Extract common parts of 11x11
 EVK into imx93-evk-common.dtsi
Thread-Index: AQHcj2hHr38GrI9ImkenfP+b8beEl7VnX9qAgAEJC8A=
Date: Thu, 29 Jan 2026 02:07:06 +0000
Message-ID:
 <VI0PR04MB12114C8A643E2C2B0C4E14405929EA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
 <20260127083727.1839605-3-sherry.sun@nxp.com>
 <acc1a587-0f12-4356-99eb-f8d49ade80bc@kernel.org>
In-Reply-To: <acc1a587-0f12-4356-99eb-f8d49ade80bc@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DU4PR04MB11962:EE_
x-ms-office365-filtering-correlation-id: 11985bb5-b3c7-4a9f-4f20-08de5edb1a2a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|19092799006|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OUt1Si82V2IzeUlubDE4ZCt0R2FNWFVhcjJmMUlJRFNleHZIYU5XSEorb2Ry?=
 =?utf-8?B?Vk5LNGs5eDlmajdYT1I5WlRDR2RxNzdpWEZza3RqMXE5akZyQTlGRytVamw0?=
 =?utf-8?B?VGpIMGh5VzJkKzRobGovUWRQOEZXRGJjNHZKUjU3S2c4aDdWbE1PeXhrOWE2?=
 =?utf-8?B?ZDJBYjZWdW84NlliTEN0WWdrTnVPQ1NtK3BrUElQVWJHRm1BUUFwdFV3QTVr?=
 =?utf-8?B?OUQ0T0tlQ2FKeXIyYTBFNVFtVjJHSFpPTmhJbmhWei95TGF5QytLN2xyd3NB?=
 =?utf-8?B?dVZGQ1BnSXNmWVN5aXY5YU1NM2psM1lxOGdaZ3lGZjk0dHBSNFhtSTIxSnkv?=
 =?utf-8?B?ZTBHZWRCU3dFYXl6T09MaW9Tc21PcUxzNGh3NkFDZ1ZaVHhGMlN4YzQ5a1Bp?=
 =?utf-8?B?N29DMDMyd1Q5ZzRPRGp6Z0RGTGVTZ3ZtaHdkaUZ3YVUxSzQzZDRyVFBLQ0Ur?=
 =?utf-8?B?VHpqaFJ2d1g3WWJiaU80MGlUMkRUTCt0K2trYXZlM2VHZWxsRUw3OUROeW9u?=
 =?utf-8?B?NUxKOURCcXMyNmNjcFA0N01OL0szM2xDSmMxSExpK2ZjTWpxNm01NUdrbXRL?=
 =?utf-8?B?UjM4Q0JGUTl2SGc0K3RvcXluUUJEc2pIOGhseWNOS0JrOFdjeDRxcE5VMk5u?=
 =?utf-8?B?alc5YXUvMmdxQlc5cy9Bb2ZZWS84S0RUbmUvVDVMeEUzMEhFLzVEVUNsVExx?=
 =?utf-8?B?dWZySXBzQTBXNkl4M29XSmJKR3JYb05vamdNQ0cwRlpIcFRCTDB1Z0tGTWpZ?=
 =?utf-8?B?bEord29MN2o0d3lNdU9vem8rc1N1SE1FaExoTmNBZ1phekk1eVY1bEMrRUtn?=
 =?utf-8?B?QjF4YjhJcFZOdEpabm1CbWVpQlIyM29HQjByYTlJR3NoN3N3VmxuVFNvaE9S?=
 =?utf-8?B?eFBTTjE0NEtRTUErQ25odXhGenZsZjZFWG9kMjFrNWJtL3ZNZ0dxd292V256?=
 =?utf-8?B?UmR2UlFWYUVwYkpDNHlVVTJPNmZqSzRxdnhjeEdjNks4WHJYNGdJd3puQnZl?=
 =?utf-8?B?MTQvMG03SGdncWQ3Ly9IQ3Z4K1EvKzhERnZlbDZVR0xic1VtNy8zWTVWVTdV?=
 =?utf-8?B?dHdrYnZjbU1MekhSb2tkMlFXenJtYXlhd3VhU2ZHQ0o0N0E1bi8xcTIyY3VY?=
 =?utf-8?B?WW1vTmZLTnNLWXhLQjRkVndYYnVFZEdXaVdkMGhKN2wzNnRUa1ZqbGRtMnJX?=
 =?utf-8?B?TVlBNFJGMW12TTBlbU9sUzhvU2ZKUnlzNERsejNwMGdqS05xbU1iam1BeW93?=
 =?utf-8?B?cjZ3QmZqRlZiOFdKUHk0b3hoaGpxVFd5RWVlQ3AzQzFrOU1qYlVUSkIzaXNt?=
 =?utf-8?B?aHJZcU1NVFdYTHJRdDRkUXozL1NrS295bXZCNnBrbUtqbkdxNU5DM245dXJP?=
 =?utf-8?B?ajl5WnYxMmJneVRaamxpTUEzOFFmMTltMmQ4RUh3Q2hoSXF2Y1Z5OFVDc3hs?=
 =?utf-8?B?QytWT1ZiOUtOcmVieTlHNWdlZnBTQXE0bnFRNmh3TkZjQXJlQ2QwaGNXckdh?=
 =?utf-8?B?N3hmUEtsMkU2R2NxanRDaVRtRG83YlhWT05lTE1QRDI3UGhGZWVuU0xHWEVD?=
 =?utf-8?B?dFJuSGFnaENWVG5WSmQxVS9EUzJlK1B2SDU3b1VkLzU4SytGclVpOENVc2J6?=
 =?utf-8?B?YnkvZWtIaUJsc0JmcFc4ZDlKQTRobXpYNnJiL29LYmorVWhHRWJ1d0hUaEZK?=
 =?utf-8?B?aWRHSnhsVG9vOXpZQU5QWFEySFRkdVRwT1U4ZXFCRm9TQzFUMnFncUVOM29p?=
 =?utf-8?B?RnJQY3RDbHljVmJOdGU4Mk0veC96OWJmOG8yR1VBSi92S1lOVHlSVHVOeEZC?=
 =?utf-8?B?MlJjQkNWbDJrMmQyc01BMVJTdzIrSE9pSGtmVXhlOWtNaWlqVGZhc2M2a2kr?=
 =?utf-8?B?Wmo4U1VxNFFIRXFHOTF4OXZGUmllVEd0Mmgva1pkZ3JiWTFtaEYydkNOZVEz?=
 =?utf-8?B?cW96Y2VTU3FTUC9sRGk2cHJKZHNaYkpQWW4zd0dsZzYzQjEwK0dFWTQ0d1ZZ?=
 =?utf-8?B?VmtmZzI2aGRhb0hKenBKSmVCdVJqMENpNlBSaFJPdlZtejZOcEJKdS94SDJs?=
 =?utf-8?B?SGYwdXV2cStyM0ZUMjBQRGFxYW9sODVuM2thejlZRy82RmNJQUlUVEFPek0r?=
 =?utf-8?B?ZDVWeGltMkFSM2dqai9sQ2RTREpOaWx0NENqSVRhK2gwNXlNV0s3YTA0L01i?=
 =?utf-8?Q?CT69r6zEbURC3ITUo6i+bz1IPBO96Sb3EqM5caoxRTdV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWpSRDNuU0JuRXEzQjdpS0p2RnByK0d1N2FxWG5Za1RmMFp0OGYwYTZTc1ZP?=
 =?utf-8?B?QitKb3U2UEVSRFNiMlpwQ3czZEVFNkFrWFlXMVhyRzNFMTlkNER0MUxJN3Rj?=
 =?utf-8?B?Tlk0czYyZnhkTjlvYVNXaFRidFhOVUpzam9aVy9YTnR2WEpmdFZrbTBsbVhN?=
 =?utf-8?B?bUNLM0lCUFlqMGgzUEdxQUNDUHBvRmxMeW95RS9tVk1QcTBUdytUcXVMamhs?=
 =?utf-8?B?QnNJVHpaa2d1bGhsK2l2ZDNKaEtPTmRwVVN5RGlUeE5LUkNvbTlwajdLREda?=
 =?utf-8?B?MEV0M2RlNkxtTW1zMG5aZHRPS1hhNmNEdy93MGZyN3g1clZ5NTQvWjV3SE8y?=
 =?utf-8?B?VXRsMlEyVE9NRkhHdDNhamNONE9EZU1PYmsreUFYdmZORnVoK1lZcmJuQVZX?=
 =?utf-8?B?cURjUFpZYjhqWTUxbWk0ZXB5bnJXTXVBK3hlZ1lZUnhmeDZLOGNJQzlYUis4?=
 =?utf-8?B?RllkNWI3TUp6NDd0a2ZqTUxkN1BlMmhpeTBMRnpwbktpZEtoT2JLeTV4UUZP?=
 =?utf-8?B?cGkybHh6eUFhNk1qazEvNENhOTVkK0lDc0U3YVlMNGZWQmlKV3lVNzZJb3Q3?=
 =?utf-8?B?c0l5UG9UU2RPU1ZjTjJMR0o4L2ZmdThMcFBlRm1TMlNDVGIrUUFsY3UwVVFP?=
 =?utf-8?B?WXpMZVBvU2RmRzdROG56OEx2Tld0TjRKOXdsUHY0Ym5xY1VjdkJ3OFI2b2lO?=
 =?utf-8?B?bjJYaVdBazhOSzdCb0ZxcXlxbWNSNW52TlF2NGNLbHZ2UGRGSWxIOEQ3dkd0?=
 =?utf-8?B?K3BLRFh0MEYwWjh6V1FjRldDTWZxVCtqRi9CK2pmZlA3L1Q1QmQ2ZTEwYnNB?=
 =?utf-8?B?ZWZXUVhJZVFPSzlUMXBVU2FBajdBdHNiMnozbDNpY24vaHdZUU10TjdpMjFv?=
 =?utf-8?B?bm9QaUI5UVNQcW91cXh1M2NpNEhHZEp2T2lwTmJPY3ZNVmNzNXNCeVFsbnRH?=
 =?utf-8?B?d3lMdGx1Zlh2VVhWdWdtZjd4b29kQ29DNnJzYjNRcFhpZTdTYjZHQWU1bzNZ?=
 =?utf-8?B?TmJrZXA1NVR4bHUzTzZ0LzVvb3N4eTFpQmFXczVmMFhOUGd5WEhBbDFmMDJw?=
 =?utf-8?B?VWZyTHdrOVVwSFV3cTdaYkNYNlRYR01YdDRYaDV0NTYwSStOYUUyTnhBbE9D?=
 =?utf-8?B?eXFLV25PNzB4VHVEMHVnRk5MOGlod25mQTFpYVhCYU1lbEtyUHI5YkpaVHFt?=
 =?utf-8?B?aVdEK3pTcnZVc2drZEgrWURqaUFvRXFRalJMWk5VQWtHRnErbGp4TG1oZzlC?=
 =?utf-8?B?eDYzZmhLcDd1UEVpcUc0Ly9uYytYYSswbE9INEoxdHBTSVpKclZ1SmNRWXFJ?=
 =?utf-8?B?UncrN1l3VEREejZRejRXNXpyaTY4dWhvdGNyZm5Zb1NXa0pDVmVkWjJaeU16?=
 =?utf-8?B?Z0ZKL3M0WENTVzlnZS9VTFVvTnRkU1dpaVZ3UnNQNm5MSndHQ01PdjEvZG1q?=
 =?utf-8?B?cmRDMzRoN0w4RDJHaE9WZGh6KzVVdGxQMUZXdHAzd29vR2dzMXBremt0UnV3?=
 =?utf-8?B?aUFGLytBZm5RNkZYTmRaTmQvVGVSNFVvanNHMzNjVGhOTFV3WjdNbkl2Q0pF?=
 =?utf-8?B?SHNKWVk5NmxHM1VwZDNoTEQ0UEFCWFVzOTlPSlNmNW1rRi9XT2VxS3pPNVpx?=
 =?utf-8?B?MStvNWlOZUg3ZHZDZEFsWXAzenlHZzFvV1U4K0MvUjkrSllQNis0VkdFREJY?=
 =?utf-8?B?UktMb1ZkdDRKbG1tVnQzNWhjYUE1clRvNnBhMmRmQ0lwRTYwckdabkYwa3Fq?=
 =?utf-8?B?R0lRQnZZOHEwNTZlQmZuQzJTMzNyUVRKZWlBekZZMEVWTDd2TVdaTzBuMzdD?=
 =?utf-8?B?bEVDT3BnNHp2TFQ1TXZ5anIwTFg2aGhxT0NwWitMMkxtL3NvL0RDN2FsY0xi?=
 =?utf-8?B?SFlqUVMzK1QrQ2FWeEo1a3JDano2MVg0czhJMUNnbVdkdFg0M0xvbzdtVkZZ?=
 =?utf-8?B?TEhFUWxkOGFlc042Vld5QTg5K2p4UThtVmZMTnc3OGZCK1Jlb0lxWmtWK3c1?=
 =?utf-8?B?R0dpREVyZHVkUklWWEZQVGREQXRMMzFJL2dnZm54ZnY3QlNOYzVOOURPcEg4?=
 =?utf-8?B?WGpsNGF3b2N2R0tLU1pLLzNpUlV2OWxmU0huMnhWUDREV1pFQk9DLzVKN002?=
 =?utf-8?B?VnU3ZFl1MmlWMEoyMTljRVExN3hYMGYyQmJIbTZneS9yQ0MvTDhWWGhuNmZZ?=
 =?utf-8?B?bFF6bXhHa3lGYm1FWXpHMThVYzFkMVREUnJFYjBrQ0t0QUVpRXJRUmh4b0gz?=
 =?utf-8?B?MWJ4UXNvWWJnVGZnVFBEUWJCdkFYQTdmS0pIUGxhelBOZTgzVVB2MDRzU3p0?=
 =?utf-8?Q?1OJCYqyIVfeyeXFAeS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 11985bb5-b3c7-4a9f-4f20-08de5edb1a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 02:07:06.2816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWnxwnFe2P3dz480YYLsB3R7CyPES6F9cVshXLUPzR65ItGOY7jXCozMiTopHHyHAmz/mvIyaDq2IN8aawdeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11962

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYzIDIvM10gYXJtNjQ6IGR0czogaW14OTM6IEV4dHJhY3Qg
Y29tbW9uIHBhcnRzIG9mDQo+IDExeDExIEVWSyBpbnRvIGlteDkzLWV2ay1jb21tb24uZHRzaQ0K
PiANCj4gT24gMjcvMDEvMjAyNiAwOTozNywgU2hlcnJ5IFN1biB3cm90ZToNCj4gPiBUaGUgaS5N
WDkzIFdpcmVsZXNzIEVWSyBib2FyZCByZXVzZXMgbW9zdCBvZiB0aGUgZGVzaWduIG9mIHRoZSAx
MXgxMQ0KPiA+IEVWSy4gVG8gYXZvaWQgZHVwbGljYXRpb24gYW5kIERUUy10by1EVFMgaW5jbHVk
ZSwgZXh0cmFjdCB0aGUgY29tbW9uDQo+ID4gcGFydHMgaW50byBhIG5ldyBpbXg5My1ldmstY29t
bW9uLmR0c2ksIHdoaWNoIHdpbGwgYmUgaW5jbHVkZWQgYnkgYm90aA0KPiA+IHRoZSAxMXgxMSBF
VksgYW5kIHRoZSBXaXJlbGVzcyBFVksgRFRTIGZpbGVzLg0KPiA+DQo+ID4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaW50ZW5kZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVycnkgU3VuIDxz
aGVycnkuc3VuQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUv
aW14OTMtMTF4MTEtZXZrLmR0cyAgICB8IDk1NCArLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgLi4u
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5My1ldmstY29tbW9uLmR0c2kgIHwgOTUwICsrKysrKysr
KysrKysrKysrDQo+IA0KPiANCj4gRm9yIG1lIHRoaXMgaXMgcHJldHR5IHVucmVhZGFibGUvdW5y
ZXZpZXdhYmxlLiBVc2UgcHJvcGVyIGZvcm1hdC1wYXRjaA0KPiBvcHRpb25zIHRvIGRldGVjdCBh
IGNvcHkuDQo+IA0KT2ssIEkgd2lsbCB0cnksIHRoYW5rcy4NCg0KQmVzdCBSZWdhcmRzDQpTaGVy
cnkNCg==
