Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE33C0629
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518959; cv=fail; b=TNzhAOOnq4A4dg4WLwuUYtI1s5VyrImv67t6RIhwErZlBVTrODJlkbaHTIoWrhcjMW9EPTe1w+qH9fzuiSYzgxcoNKVzkCaPGLEPnn52oRnNAmtlVfuGuiJ6u8uCdPim45WIOerV/NOVP4LKfQIYWJig47jR4ejreQHBj9HgZJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518959; c=relaxed/simple;
	bh=mVLrxHpwu4HgsatHa1zImblZk5rpzJuYDRrnDt5e7rM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=amjYiOBvn+5wf/z+5SC4FcH35snx7oWmCsHA8i/Ch8b3S56MdW7yEAVaXfffBoDQSccP0pvAhyVNWHLbtx/2V5vhHjTCEaG7slVcIvKH+xQz1lT3ECToYefW49mPK9Oal3H32gfG5hzoH7VQfxWoxteCqmozpCbiPczqBAOpFBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Acef6Wzm; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Acef6Wzm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWfAGIMWxximHR+2ziKn4KCPLgab+MUPwPJds7uGyg2JIJTfk/W0YO7pSGmKukdTk2yK64dmc5jEK0Kwtar1klSElAlnVNrAY5l3lAyFaxLXh3Lx6Q+2UIs7KGsETRJRMCVBPURYRoqtcFJj+/bJlnPg2Z5gKM1JoAwr7I02QZH0VmqhC9kkGKDiyeuwzMELxF4MaSmXl9dcG1kslC9Q6fMj4USrmcCxLZhUolWRXznpXd8cin7DgSAIehBAV7flzy3oxuBmqdl8jtCA7ibRIeVwefML7O83B5n5W+Gj/lBiCszsbfTdwfc1wzI5ND9CMr37E2AwkQ3c3ctxhIkZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVLrxHpwu4HgsatHa1zImblZk5rpzJuYDRrnDt5e7rM=;
 b=kEprE+HHmm5Cw8bP8Cm9PbAg1/IatLeFMy7Zd6GRWvtvzvbogwVbp6SSFFlMCBNZELNFJxTLA5yyYFQ3r6MuVZLrl8e6/ZyE+e0HgPi7+GKn4OYcCwfGgSk6zVTHs7vHW92H+2ctPhIFOFNi8QyepTmH4I5Tx/7SnlzLe3hRYaYeVza5SIfz01AcTd0ePSPOsuOoz6wFInoZjWSZfc3nHzkoiiVsjH3j+YZB5vN5VgQsv1+AfJDMS/IQeQUZv2j2J4i5JMne96afSgHvb2AGz2cR+fYEhE3fO24YKxulXLE8v863oNFX7fo9QNO7nm6Wia7xC5OquTVcxcf6KWPgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVLrxHpwu4HgsatHa1zImblZk5rpzJuYDRrnDt5e7rM=;
 b=Acef6WzmM/C7tdDMi7W0VdZHiAbYoDQsvpG38EBYPI6EsOYxSgAVER4iEHSfKyvNsH1hocUSxJeIzTmL7IsagYNm51eY1A6uRfR8bkvROwx3zN8F9PES/nE5OzDngVWlUlAEmR0PTrAfBs96lqxMcGYtheV/bYzUig6AQqT632m5nzqYZDBYJJiKMQsktaF2EgHrX+2esk1vDXCGWPjaLHPPMzLlVbLzpTs9LNozQSozDFNkGORhP+60S3HYd1vZeIGvbT5dQMC3GT2HFAe/Igl+xgfnbOnjbpT+aB26C5a8WmQHH1OInfeZHxANchE+hc5Kt6j9pEUNW1EZpt6S9A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 09:55:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 09:55:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Daniel
 Scally <dan.scally@ideasonboard.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>,
	"S.J. Wang" <shengjiu.wang@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
	Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, matteo.lisi
	<matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, Richard Hu
	<richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, Martyn Welch
	<martyn.welch@collabora.com>, Josua Mayer <josua@solid-run.com>,
	=?utf-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
	=?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>, Christoph
 Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@dh-electronics.com"
	<kernel@dh-electronics.com>
Subject: RE: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Thread-Topic: [PATCH v2 09/12] arm64: dts: imx8mp-sr-som: Correct PAD settings
 for PMIC_nINT
Thread-Index: AQHcvPIH8nchuWgqm0aFIWMomT1a3bXAg34AgAAPkLA=
Date: Thu, 26 Mar 2026 09:55:24 +0000
Message-ID:
 <PAXPR04MB845972866AB6A7E85D1570CB8856A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
 <20260326-imx8mp-dts-fix-v2-v2-9-62c4ce727448@nxp.com>
 <20260326085820.GA2770072@killaraus.ideasonboard.com>
In-Reply-To: <20260326085820.GA2770072@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10990:EE_
x-ms-office365-filtering-correlation-id: 2f3d7a5d-6097-4e98-2058-08de8b1dcd06
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 ztKZv5QABAr7QhBrQbrGSIXmuTQBFm86f9Y7tUvtuAS3VDb5wd+/u2j0yjifdYSZDxHO3rI5ls6PpSV3mX64cXKXjoK1fgxp2FkbqKpL30HnHbPHwv6N6porOZY7HoT7PJmNCGHmRx7INA44+G+Hkubrmlo8mfnd8p6IOJhZ8T7snAFKkm3wY1mme3xt0b9YeWR1dbAVt/LWlwx44N12OkxIJ90OQCRccKJ9JzHa7cX2pcoOcvpwrtXpQh2qY42hgWgVoEexRVqSwAR636z3ijnSVwlsA3J7cb7jpMxgkbatdsLEAynT2Gtkm9/J+6yzBcNKaByPl4JFeWqr2SEXEsAJ8wE6l33D1aEDQfhn4778LeSPt/e95Lhj3gCeQUXVKoc7blVSQoxo27h9E22SzZcb4qkOW+8/fxUsTmxgYx5yOgHhAN77KFtJTC8F+/uLy0fEmjQ9LSDQgr/swwQjZj9OKzYJa3cg+4/v2e72ytJ9rSIepNWbiDPVZAb+J/FO6cPFV2EI6lRegCX19uR13LKbNOSrGG35rGOskJKmrTo649G3WrNX0uKpg6x6Rrc8Jzmte2uOGJ6WR+Fonouu3ceoGBoBssf9/lkHiiowljns0mMBa7I94zfqwi6yk5TC+Lehdy8nuDCJogzz2e5jDMA/uiCnOvkMDCUu7ayUFv4YnZaxNd78Mp1NtYSHg4/khqyScSAGMulnQcOCF3jxV0B5Jzh9otnPEZTFYCRZvs96K2KIdMtgC83JQOrfkogY4/OHkd/354pFkTrRobtUtVSQzRRMaZM+4RXyqz75A/E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0VUZUZJUDQ5TnlxUW51c2tLV0M5b0dPY3ZsUVd2WTMyeXZMeFFFYUdEUHRB?=
 =?utf-8?B?aGFFb2RsanJGYmZxMFhteHgxampDWDQvbjl0dHhWWTFicVc5ZWNMUk5tYU0r?=
 =?utf-8?B?TGk4K3hEWFlHeFpvSG1WNkJsNHBONnZsQWVJbzhSTVo3eHU5SDZYVEcwZ2F6?=
 =?utf-8?B?MGVUb3c5aEdNVGsyNkRscHlVYXVUVHJxZmp3d01aZUU0S2pwdnVpaUZhNDFB?=
 =?utf-8?B?TDJadjNwbS9aRXFTOXpZZmswNzhHRUs5alBvWGQ4TE16ZnFCdEwyQk9JM3Qz?=
 =?utf-8?B?alN3L3h4U2ZSRFI4VDU2eGtDaU41N0lWNGE2SFdPYS9qZ3hKMEdtNUN5WGYx?=
 =?utf-8?B?eHVaMk9US2FFa2lIZmxBQXpWb245ZExrVm9aOHZTVnphZ1FDZnc3dmhReXdu?=
 =?utf-8?B?amE4TWt2Z21OZjNjRTQzT1RidURMeDdzS2JldVpuREVrV1JuckEvbkhjS29j?=
 =?utf-8?B?enVDMXFRKzRESEt4T2svU25DdDNhUWtsMVY4NkFTOTc5aTBuMDcvNGxBSmps?=
 =?utf-8?B?QmdRQnpIR2xZTDd2Sm9qZHAxWmR0bXNTVnlDNUFFaDMzUy9NcmpQMVprcW1T?=
 =?utf-8?B?Q1hIdmsvSjMvV0JxYkk5cWVxQlJlQldxeHlYcG1VL3BITEZZSUNnWHFVWGV3?=
 =?utf-8?B?TXJoOENpMGdFRkw3M0VFWWFDbzVLaCs0eDBqRE5OWWhhb1NBNWlVMjNpalg3?=
 =?utf-8?B?NU83SFB1TTgvMTd3M3R2cHh4QWR1cmVlUFpMaDVuallsa29xSTBRcHVWT0pC?=
 =?utf-8?B?VFBnS0hsdlNJZUlLNmtIN2FEU0hNUzhxbG5VdVdzQ3hiQnFpQ1BQYkxHRHVl?=
 =?utf-8?B?ZitITFpWZlNKSVdlazV5R1ZzVlJMZmFpY0JYM3dyRjI3UVpSaW9zQkRwZldw?=
 =?utf-8?B?S1B2TjBBV1FIM3Y0ZzhQcnBWK2NzbUdvb2JoUVBEakE5bWRtZGQ5MTFmek56?=
 =?utf-8?B?UVhKQzNmUlhDMEZlMVR6QUp5SnFUeVBXLy92UXNuK0p6Lyt3Z2JpMHl1SmVx?=
 =?utf-8?B?RDMrb0l3M2dTUlZ1eTZMMnlwZW1MUFNCMzlwWjF6NDIwNTVscFhiWVpBcmdT?=
 =?utf-8?B?cGk4cVpWUDBJc042dzB0djV1b3hXbktsM3BnMUNaNHRxSWNKYmRCOFhQQUlV?=
 =?utf-8?B?N1FNZitCTEZkZzlyUDBhcDdIWXJCVjZrZUV6djBlS29qaWYrMmVmYk9kRVYz?=
 =?utf-8?B?Nk5QOXlwdXRqajIvQmtRN1NsL3ZlVXBuL3lzczdtak5QRERmVktOY0c2Nmp0?=
 =?utf-8?B?SmJCUnpVdi8xWC91akx0UXY1RnBuT21wNnQ3S2lXN0lFVVQzbmM1OGVJK1d0?=
 =?utf-8?B?ZjVMbEdFMncxUGVvMXhpdGJ2UFpIN25KY213QW5SQkdKSWt3U2VFWHRubG5t?=
 =?utf-8?B?T1FWQnR4L0tWMzlpUG9OY3F0eDFPcmZJZVlOMDA4VFk0czdkYnVQUXo3Y0U2?=
 =?utf-8?B?R2xxZE1yOFNRM1Q5aG1jN2tjNDdoVUtDMGtlYmtINU9yckxqNlo2YU1PVkda?=
 =?utf-8?B?SnR2ck9tYk81RE5WQjM2dXlpK3g5Umh3T1hSZ1VBMTZ0SUtNSWFQUkUxcWQr?=
 =?utf-8?B?c1RBbkorT3pIQi81emJ6VDJtYjUrRHE0SVcxdmR3bm9YQmk4aUU1NXd5UWhr?=
 =?utf-8?B?aExUNkphTG5pMndGc1dES3dOY0ZUQncrRDRIdElsK1U3b1RMcC9jeTA5ZWJx?=
 =?utf-8?B?U0tCY3YxT2d5cmo3cFpQU3kvRXMzdTllL2F4MU5Qc04vbEozaHh6ckJQRXpJ?=
 =?utf-8?B?VWx0cERMVXZOQWFsWFlOTUE3S3VyZG5FOWdwQnJZWXpjTlBPMTdXYTBBK29x?=
 =?utf-8?B?aUFLVzAraFVPam9xRVNFSVk4dlJaQ0N1OURaVnpPd0E2cGM5a25CZVlFUS9T?=
 =?utf-8?B?RlZ6M0R1WnplOFZPaTYyMXBUdkZkYjV4b1JMNHk2NTdLd3hVZ1JWWUcvQ080?=
 =?utf-8?B?eGpCQUFmY0pnbklHSHRPZndaUUY2Z3JQVTBMRTFBbWxtR0UvbDVhRlRCdmdv?=
 =?utf-8?B?NmN2R1RVVmZCbVM2NE4wbEp5cXRNYjVCeDU2Y1VPK2txWjZDWERlUXh4NXph?=
 =?utf-8?B?MXUyelhTeEt0UWdCSDRsWDZhYWhpc2c1RlJYYUtrL1ptN1lRTjNNS1RVbEZo?=
 =?utf-8?B?ZnFsNSs5Z004Y2F0cmZULy83bHlRZU0xMDJKNHFPL3RXaS9QRUNVNFVIRC9O?=
 =?utf-8?B?bENrazlpT3RBbWhjZG5GSE1CNWZvczZZejNZTnZONGk3OGZRU2pqeTNtRjhm?=
 =?utf-8?B?MkVKVnNOWjVTZGY0U0FCWWVwSC8xRW9rK3JtN2lLekZOdHJJeURXU0N1Mzdz?=
 =?utf-8?Q?tjw6bQ8FXbOaEkP7oy?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3d7a5d-6097-4e98-2058-08de8b1dcd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 09:55:24.2996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QI5a1Z31U/sovPvjG7Ot3TJfD0U6BSIeiF/BJlDNeReYTECMuoPrBMRioAwXMfhydKPhw4w+ABZhvAGODnNsTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA5LzEyXSBhcm02NDogZHRzOiBpbXg4bXAtc3Itc29t
OiBDb3JyZWN0DQo+IFBBRCBzZXR0aW5ncyBmb3IgUE1JQ19uSU5UDQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXNyLXNvbS5kdHNpDQo+ID4gQEAgLTE3
NCw3ICsxNzQsNyBAQCBwbWljOiBwbWljQDI1IHsNCj4gPiAgCQlwaW5jdHJsLTAgPSA8JnBtaWNf
cGlucz47DQo+ID4gIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiAgCQlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZncGlvMT47DQo+ID4gLQkJaW50ZXJydXB0cyA9IDwzIEdQSU9fQUNUSVZF
X0xPVz47DQo+ID4gKwkJaW50ZXJydXB0cyA9IDwzIElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0K
PiBUaGlzIGlzIGEgZ29vZCBjaGFuZ2UsIGJ1dCBpdCBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRo
ZSBjb21taXQNCj4gbWVzc2FnZSwgb3Igc3BsaXQgdG8gYSBzZXBhcmF0ZSBwYXRjaC4gU2FtZSBm
b3Igb3RoZXIgcGF0Y2hlcyBpbiB0aGlzDQo+IHNlcmllcyB3aGVyZSB5b3UgbWFrZSB0aGUgc2Ft
ZSBjaGFuZ2UuDQoNClRoYW5rcywgd2FpdGluZyB0byBzZWUgaWYgYW55IGJvYXJkIG93bmVycyB3
b3VsZCBnaXZlIGEgdGVzdC4NClRoZW4gSSB3aWxsIHVwZGF0ZSBpbiBWMy4NCg0KVGhhbmtzLA0K
UGVuZy4NCg==
