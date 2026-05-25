Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA243A6F0B
	for <imx@lists.linux.dev>; Mon, 25 May 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690987; cv=fail; b=R/TuqMeXdZlTdWG25BTBdwVg20A+GyAA7n5CyNyuD29nIkujljXfCg0mkZ8g3aYIi8LRYO/Kr25TyHLrzcWhP8jX9iP6wZoo5JPLYYebKrgSMJcXy75N7GFQASJtfapLcPGQIAAbnJyFrxJ7TZf3iqL97ia0E6I6h54F1ZFFRqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690987; c=relaxed/simple;
	bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m4I1bzWtPsEFBJyCw1ZtHOiHofETkd+eXTzowdXz/Kk7kEvTMCrFnqMll3yOWDmdmN8MtmYerE9RnmlviZo9wXg4RwPTrY8+z5staAPWb23dI9dcVdIpEUQboEm75J3V12VGuNJPiFVVoeo9aQxlZL0lMBi29OhFE0q/Hn7ba8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eFVhnlAs; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eFVhnlAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du02nio4LGD/YFNZujDdEbjqZFBJxS56BgIjEaOCbJQjXLLjS0LEkrFbACAw3K6Pk2VX/N3C48YW7KPNFq0XYBQvfOrGi98iDV1AFXrcIq6CqDuRBxYzA7mgulykwPS4KrNmd2QcNaYNIlbwsqCQ20ogtRtcnu1774OamHpMXJRsrdEMWfwgfhhvBDQZjkkXP2LoA+7N1vTkRkLLbwSYmZrMMR2E0TjLGOV08y9KSB9Rz3agwGt6v9PDRYLeJd4lCJ/XR1arASK7WVt4RCObf1ML5ZbTVCEISE656yzYbtPCnnoULprADUPVuBQiNuWebX6TuFoG3f0k2HUgSBKxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=;
 b=knwSaiAWdKl1go4vyvdtpDrN3O0x9Ye7JmnHSqxvRbk2+SEVqyKwS3TN3cVJeVzZPQRgrYs5xY+kQZ5CN0gai2DPZX/sVRo6x3PHTaguMb8A3tC7LDjUQluSwc5vvw0D4KmLAxjQAWYZuq2tJdksniUeHmwIS1MoABNSTNEUcC4XUrsMJ2ptpU/9y/SxTVWCWeYfgro4KXT6gWRKDxSW7OWe2R4wcPdwdTb7dd84rkFimwJYk9/7VVRGsuwickN/WyOAdnIi1mMh/Oro1S3TXxYE0k0k62cYnlAepD3slHCTpo2AsxOXg+S23697Eu1SECDqFGhj75yTfOY1ILmDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gpO/m5U6dhG1Fw6pNJX/0AuIuOPrHKn8DHFiNGEli4=;
 b=eFVhnlAsTdnUwyK5APAJ21R3tp+E8ATOO2EHyuM6/GeGWVRpVkpeswUMiOg2q8oWANAtZu63nqdmof6p+UjOD341WWmVKVIflGVc2+Ux8CPr+ALknFtnR/bBab8f26stXvvVsGerqclIq/g+H85rRItctIn8ksVjnrRM/27SOgTipPMqUZNVj+6cGPH6swzwNrwOaUM78BtYyGOE7go1pwCjLbmLDQmDKvTYfyttDHWmHepCyIGbuFztIuQq/QPYKOX/SP8JcLPQS1c5ZbYoveeETwu1GzgmhR8hINwVOHVFb/sAiFLsBd3QJUCs++XQUCQCLA8PS/AsZkyR3YzhuQ==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AMBPR04MB12336.eurprd04.prod.outlook.com (2603:10a6:20b:732::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 06:36:22 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 06:36:22 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frieder Schrempf
	<frieder.schrempf@kontron.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 4/7] firmware: imx: ele: simplify SoC device registration
Thread-Topic: [PATCH 4/7] firmware: imx: ele: simplify SoC device registration
Thread-Index: AQHc7AiOjcnZYatpx06yhN10/ipKP7YeRRFw
Date: Mon, 25 May 2026 06:36:22 +0000
Message-ID:
 <GV2PR04MB12271F6C4AE26BC37B19BE8DE950A2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
 <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-4-a9570c4bffc9@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|AMBPR04MB12336:EE_
x-ms-office365-filtering-correlation-id: d85b1d2f-ee32-4eee-af04-08deba27eff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700021|22082099003|18002099003|56012099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 19Hgvo+zQkgANNUP6eEx3VjHaw1lgPG8OGABIY1PQ+ym5DNyIo8LvPqOC6LZfQgL8GvZ+cKbMp04u3EBYmILoq19ACW7Fn2Qh2ZvFb3djyuyFIy4mziM5KftKxi5hcLoJbxLIvM65bhnSB0Om272ieGvim9Wt0dsNzvm+omvv0CVz2Sq/ORUuF/kf81115gB2rZPvPS+ji/zeiUEOEr6TD3Jtkp/WQvydAS4LdcdIbcGWstL4lu82Hlm7R/jBT07+fqCX6ZAax1HUztRp3pYPfXXJ6KovIzXTBMxnSMx+jQOLIwTcjuBSihQf/pCo/ZHXHjgwMT8x5a7vfF8Q5eqoHHEwIM6kF6W87JHNrxp7yo11N28FK/jyMEr4cl4FC/tO3gm5br2hsM5CUWH0xPBMv5trI9Lo0NlDo0+AcIhHZL1poWubm58OrmWvOfQeDwbJXNcFjrgiOKltGzrti7NxmYhm3PhXFJds0bEnb8kqEz1Qo0D0LzPHxhaJ0HRos0S0VQXhjrzV5FEX/5PnM1P5c4pcS+KU0L0JX9h7MFsGTBWGA+GMuP1FAP2Yir9vZ6LTxcOu7apqkRVq0JL8kZPXgj06W0SMYbcOb67ioaaa3LhtiKsi/E598l9wyktD7X9tiFDazQ94WJnMD1GPzzWwzum8xbOD8+efpCTNVk/UAMRpGs0k0gWdLLYiUrOC7mwtdpbljtJfmvhRv7Gp92FrNCUgPJLlTnRGQCMqts4DphQ9NFzUbPSBY50O71TK2te
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3V5VFBQa21qWVQyYmhxYXZGcDVlbFR0YW5McVV0M3BCUDEydVZ5OFpwZFJK?=
 =?utf-8?B?VDluMW9YVzAvWmVsY0ZmYTRDdmRlZDBxaVJlUmhIbDVMVklmZ1pnSGtNNHBV?=
 =?utf-8?B?aDRtTSs5aHdody9xc3NEQ2xrZVdXcGxOazFCV2JRNGNDbGExVHdvZFdCMGxl?=
 =?utf-8?B?OWhtRmJSS3V6N1ZnaEhoY2ozSEw0OGwyaDFGbG1UbWdGb282ZVFqdzhUdUMw?=
 =?utf-8?B?UkprTlBEU1VFejB5Z2NHempVSEpjenhIOWdWN3BselRtejdlNzZaeGtyRFRr?=
 =?utf-8?B?TVREZlhhZVNwb1JKQlh3eFVPc2t2ODRPSytZUk1WdFB1ZUV2cXl2NHFoampo?=
 =?utf-8?B?TlVXdGZGcEZwMHJCVjh5RWZpeVhYZXJ6NEdBSUxaRmJFd2k3VXVtQ2RvQTdh?=
 =?utf-8?B?WTgvK0x0ME5obm52SlJjSStsVDRyWklwUm9xVXVnYWw2SmppTmhzQWZMdUo0?=
 =?utf-8?B?dE5OUm1ZcFZlQXBGY2h0Q3F0TFp3SW9tY1ZaSGxVTDZmaExqc2pzOUdwbGdE?=
 =?utf-8?B?dlg0aGxIVDhtbVpramxJbElZdkNHR1MxbmhEallYbldjSXF4UXo2SzZ5SWlu?=
 =?utf-8?B?a3VFRnhVR0V2ZS9BQ3hVZHU3TVRPSVNqczh4ZHBRUk1ablVvODVwUmUyYjla?=
 =?utf-8?B?MUErTGM5UTFSK2NtV0VuQk02R1NkVjR4MjJhaFNkM3NOUGJwaGlVaTZnem5B?=
 =?utf-8?B?bmtsZWNaTC9IaVBtVWR5MkFJUDJUcjh4UXozTUcyWnV0YXlJQ1A0QVhUN0tS?=
 =?utf-8?B?V3VzaEIxckw2bXJ0a2h5MytFTGZWd1I4NWdNOU5JN01RcWNZd2xwWHVzdW4w?=
 =?utf-8?B?UXhuZXJ5ck1IN2l0OHVxbWZpWHJXTEltYnkydFF5QU9TTUFOcUJZTzdmczVz?=
 =?utf-8?B?cWpjUUZITG53ZGdnSDNyYjdINjJjbzdxVXExS0xibTF1RjROemtsbmRwS1pH?=
 =?utf-8?B?b2tXT1h3S3Qwa0o4aFVoLzNvK0tyU2JWVWl0MWJxN0JaNVVGNzBoOFZyZE1E?=
 =?utf-8?B?MG1ISllyam5EdDJBUkdnejVORXprRzN6Tjdmc3ZXdEFqZkJMeDhCUHFNU1dz?=
 =?utf-8?B?SkRmMkU0QVQxT0t6VFFSQTRtSHVxeDhZdklGU2FkOG8rcVlFVWVvYWE0R2JR?=
 =?utf-8?B?VUJDclNpRG1tNW8vN1d5b2JuaGxGanVRRG8yTTZuMGprdmJZdlh3TmhOdGVI?=
 =?utf-8?B?U2w0RzFjNUNuWFp0QW5PSkt1cnQzMVg4c3lQTXlKR0pXNVJFUTRmbDIvb0c5?=
 =?utf-8?B?NjlYZ3lyV1lhVzJnLzEwNjZwbmdTakZLaWc4V1BQL1NTeUJCTU9vVm9PaUlC?=
 =?utf-8?B?L3llWVVQWUV5S1c1clUzOGVqa1FTZWs2Q2cybjM3eS9FUHgwQVh1RFp4MmtV?=
 =?utf-8?B?dmZEQzJKc1Rxa2ZnL0hwL2tKNS90NnJScWpSMW5ua0NhU3dlUzhYUmtET2VZ?=
 =?utf-8?B?V1dSZHh6b2IwZ3hZbEc4WTcxMmxlSzh5aE1mWDhQUVJSVnhIU3dCVHdvV1lE?=
 =?utf-8?B?b05aVks0a3dEaDYxeUE3UUltMWJUamxUcGZQZHFnZ1R5aDhUdUtvVWdIMnY1?=
 =?utf-8?B?Y0xleXdWcFkrdDNJM2duVThDdFVDQkNaQThSWHRIdDFRVmZTSWRqVnZtTFY3?=
 =?utf-8?B?V1dKNFEzcHpQaDVHWjhkdHdtcVpBcksvSEpFcWxLbHk2aUR6dHVwS3ZrWFJE?=
 =?utf-8?B?UlRFZ2hoRnZWU3poZURXQnlQbWxPdDNseFU5MXNtTWdUS1cvT0Rxbm5qZ1hZ?=
 =?utf-8?B?V2x4a0UyNFNWdG5Md3N2dTh6VjhwdWdhSUJiZXB3SUlXT2lUZjNLVWRpclJN?=
 =?utf-8?B?T3lSMHcxSmFwWWJYb1lqeldTTW5ROEdGY1EvVUVrekpRamhPbFVGTGRMTmxM?=
 =?utf-8?B?SnVXa1p1U1BqMEpTWGZpOUg1M3o0LzJSZjg3R25yS3lOdlR4cTJXdEFYVy94?=
 =?utf-8?B?ZEplOUdLTVlRVkZ1dDJ2ZXZTRWFzVENKWURQZGNKeGRNL1lUZWRPSmJsUnd2?=
 =?utf-8?B?dGo4WTNMTFRUNWt5RWFoblpGdU16SlVDSzBSWWx4VnI5Q2g4NU9SdUZmb3hn?=
 =?utf-8?B?NFYraVlxdGJ5bTFFa3NNc2M2d3F1M2VlMVppTFdNZlg5NDZIWUJZV2lqdDRs?=
 =?utf-8?B?amJDcjlpRElUeE5MRkdpbTBrL2R5WWU5QUVzQ2NVQWtHaExxK3RSUEZNd3dx?=
 =?utf-8?B?Q2tsOUFGSzEzdXhuaFIzYk1oeGUxYmhIRHR5TUpGSHZUVjJNRkVsMXU4dkZr?=
 =?utf-8?B?ZXRLZkYxN3BjbUF1eXYxSm1YQTFVdkh4UU9iVVFRNEtaYncrZTliNVBocWY3?=
 =?utf-8?Q?1LIIAHjWgmh04K9Jco?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85b1d2f-ee32-4eee-af04-08deba27eff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:36:22.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81FydnljCGJbBhnpNiXj4P6jfrbZoiBJmpCq+BOJthfuicc+OlfzlX81r5S+BMNVbNqJwTB1+V+r/0BpJolBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12336

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGVuZyBGYW4gKE9TUykg
PHBlbmcuZmFuQG9zcy5ueHAuY29tPg0KPiBTZW50OiAyNSBNYXkgMjAyNiAxMTowOQ0KPiBUbzog
RnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU+Ow0KPiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgRnJpZWRlciBTY2hy
ZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPjsNCj4gUGFua2FqIEd1cHRhIDxwYW5r
YWouZ3VwdGFAbnhwLmNvbT4NCj4gQ2M6IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNC83XSBm
aXJtd2FyZTogaW14OiBlbGU6IHNpbXBsaWZ5IFNvQyBkZXZpY2UgcmVnaXN0cmF0aW9uDQo+IA0K
PiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+ICdzb2NfcmVnaXN0ZXIn
IGlzIHVzZWQgYXMgYSBmbGFnIHRvIGNvbnRyb2wgd2hldGhlciBhIFNvQyBkZXZpY2Ugc2hvdWxk
IGJlDQo+IHJlZ2lzdGVyZWQuIEhvd2V2ZXIsIG9ubHkgaS5NWDhVTFAgcmVxdWlyZXMgdGhpcywg
d2hpbGUgaS5NWDkgaXMgaGFuZGxlZA0KPiBzZXBhcmF0ZWx5IGluIHNvYy1pbXg5LmMuDQo+IA0K
PiBSZXBsYWNlIHRoZSBib29sZWFuICdzb2NfcmVnaXN0ZXInIHdpdGggYSAnc29jX25hbWUnIHN0
cmluZyBhbmQgdXNlIGl0cw0KPiBwcmVzZW5jZSBhcyB0aGUgY29uZGl0aW9uIGZvciByZWdpc3Ry
YXRpb24gdG8gcmVtb3ZlIHRoZSBzd2l0Y2ggYW5kDQo+IGkuTVg5MyBjYXNlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9maXJtd2FyZS9pbXgvc2VfY3RybC5jIHwgMTUgKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Zpcm13YXJlL2lteC9zZV9jdHJsLmMgYi9kcml2ZXJzL2Zpcm13YXJlL2lt
eC9zZV9jdHJsLmMNCj4gaW5kZXgNCj4gOTMyN2Q0N2U0MzEyZTdmMzlhNWY0ZmMyNGRkNzM1NjZh
ZjI0MGE5Zi4uMzBlOTdhNjA0ZWNhMTM3ZjQ1ZGU2Yw0KPiAzMjkwODFmYmEyMzQ2NDI3MzIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvaW14L3NlX2N0cmwuYw0KPiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL2lteC9zZV9jdHJsLmMNCj4gQEAgLTU2LDcgKzU2LDcgQEAgc3RydWN0IHNl
X3Zhcl9pbmZvIHsNCj4gIC8qIGNvbnRhaW5zIGZpeGVkIGluZm9ybWF0aW9uICovDQo+ICBzdHJ1
Y3Qgc2Vfc29jX2luZm8gew0KPiAgCWNvbnN0IHUxNiBzb2NfaWQ7DQo+IC0JY29uc3QgYm9vbCBz
b2NfcmVnaXN0ZXI7DQo+ICsJY29uc3QgY2hhciAqc29jX25hbWU7DQo+ICAJY29uc3Qgc3RydWN0
IHNlX2Z3X2ltZ19uYW1lIHNlX2Z3X2ltZ19ubTsgIH07DQo+IA0KPiBAQCAtNzIsNyArNzIsNyBA
QCBzdGF0aWMgc3RydWN0IHNlX3Zhcl9pbmZvIHZhcl9zZV9pbmZvOw0KPiANCj4gIHN0YXRpYyBz
dHJ1Y3Qgc2Vfc29jX2luZm8gc2VfaW14OHVscF9pbmZvID0gew0KPiAgCS5zb2NfaWQgPSBTT0Nf
SURfT0ZfSU1YOFVMUCwNCj4gLQkuc29jX3JlZ2lzdGVyID0gdHJ1ZSwNCj4gKwkuc29jX25hbWUg
PSAiaS5NWDhVTFAiLA0KPiAgCS5zZV9md19pbWdfbm0gPSB7DQo+ICAJCS5wcmltX2Z3X25tX2lu
X3JmcyA9IElNWF9FTEVfRldfRElSDQo+ICAJCQkibXg4dWxwYTItYWhhYi1jb250YWluZXIuaW1n
IiwNCj4gQEAgLTE2Myw3ICsxNjMsNyBAQCBzdGF0aWMgaW50IGdldF9zZV9zb2NfaW5mbyhzdHJ1
Y3Qgc2VfaWZfcHJpdiAqcHJpdiwNCj4gY29uc3Qgc3RydWN0IHNlX3NvY19pbmZvICpzZQ0KPiAg
CXZhcl9zZV9pbmZvLnNvY19yZXYgPSBzX2luZm8tPmRfaW5mby5zb2NfcmV2Ow0KPiAgCWxvYWRf
ZnctPmltZW0uc3RhdGUgPSBzX2luZm8tPmRfYWRkbl9pbmZvLmltZW1fc3RhdGU7DQo+IA0KPiAt
CWlmICghc2VfaW5mby0+c29jX3JlZ2lzdGVyKQ0KPiArCWlmICghc2VfaW5mby0+c29jX25hbWUp
DQo+ICAJCXJldHVybiAwOw0KDQpSZW1vdmUgdGhlIHNvY19yZWdpc3RlciwgYWxsIHRvZ2V0aGVy
Lg0KUmVwbGFjZSB0aGUgY2hlY2sgd2l0aCAic2VfaW5mby0+c29jX2lkICE9IFNPQ19JRF9PRl9J
TVg4VUxQIg0KDQo+IA0KPiAgCWF0dHIgPSBkZXZtX2t6YWxsb2MocHJpdi0+ZGV2LCBzaXplb2Yo
KmF0dHIpLCBHRlBfS0VSTkVMKTsgQEAgLQ0KPiAxODEsMTQgKzE4MSw3IEBAIHN0YXRpYyBpbnQg
Z2V0X3NlX3NvY19pbmZvKHN0cnVjdCBzZV9pZl9wcml2ICpwcml2LCBjb25zdA0KPiBzdHJ1Y3Qg
c2Vfc29jX2luZm8gKnNlDQo+IA0KPiAJRklFTERfR0VUKERFVl9HRVRJTkZPX01BSl9WRVJfTUFT
SywNCj4gDQo+IHZhcl9zZV9pbmZvLnNvY19yZXYpKTsNCj4gDQo+IC0Jc3dpdGNoIChzZV9pbmZv
LT5zb2NfaWQpIHsNCj4gLQljYXNlIFNPQ19JRF9PRl9JTVg4VUxQOg0KPiAtCQlhdHRyLT5zb2Nf
aWQgPSAiaS5NWDhVTFAiOw0KPiAtCQlicmVhazsNCj4gLQljYXNlIFNPQ19JRF9PRl9JTVg5MzoN
Cj4gLQkJYXR0ci0+c29jX2lkID0gImkuTVg5MyI7DQo+IC0JCWJyZWFrOw0KPiAtCX0NCj4gKwlh
dHRyLT5zb2NfaWQgPSBzZV9pbmZvLT5zb2NfbmFtZTsNCj4gDQo+ICAJZXJyID0gb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmcob2Zfcm9vdCwgIm1vZGVsIiwgJmF0dHItPm1hY2hpbmUpOw0KPiAgCWlm
IChlcnIpDQo+IA0KPiAtLQ0KPiAyLjM3LjENCg0K
