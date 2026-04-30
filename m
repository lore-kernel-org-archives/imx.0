Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D220C27A107
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777530154; cv=fail; b=PlHadm8Ruaz3EhQ0MroYfy5Ku0r6esNBMDIV67W+Bk4tWEi/VE9N8Jh9a2j6gEIXaYH3FIWgpezZKnOv740KKdqBedRswWnE+FCKjW7MhIJFusr4yKBreWsRrtmpsVuaGr6Ym8MLOolAj75ao9SBvMslf5aj9VVDNsJVrG98jsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777530154; c=relaxed/simple;
	bh=Eh5Y5LvoKScz367f3sOgni5f0y9xZ8K0SqVRpaE9EHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s8mmGnoIB4VNDv23ByylDND3YbigbkzfuJqii4nrNdVPeIc1drYa22d/O/NEdiW49ozIqDUleyhGEgvRVhXnE2V9/78c3IYeIH2FiLMd8tW9YCBQnEI9ZH9uiTf+9Ho0cJLQv/7AF2PDtZqh1ZEACAUm/mRMmuQVtWlVmWAjw/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IupuyBip; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IupuyBip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5c6msNeLy3+dwBILUKtyGKQtxHlQ+avm+cbxmxhQ3RxLbY88RQwV3VvdtfPE6H1cScnWutGhm6QrKEgWY3f1GkyqosIpvsDIQ/YdhuY5/LfzIT+Eo1ZLbKZNL1eBlEeu8pLN1yvjZoawON/wPUzE5n/Z6rzxQVncob6LitSOAONHvRnmZvTgRZyUf0uWoV8Rr0AKu3PzoximK8rdKncja0HJV4qldTvBI7+WWlt2fRQyBzmWDjTE9fengrsCWDU2IHwZ26YiU6qCK0sseqhZHuEFWuH+/4RCT8URXslDhVOP5Hua5xgJSm1XVgTjKkkXY/6LcJPxdjHK1je59WQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh5Y5LvoKScz367f3sOgni5f0y9xZ8K0SqVRpaE9EHE=;
 b=R8S4rRJEGkVj9GXg+4+TJj1X58Nw8dTjy63ruMA6IqZVPvPQSWjxFcU4fB9yc1JjyTbXVSxEmhRM79MnPkzFstAJ5cIDhbVYe5d1+58zwTiOO8t2wnlr6upAMhv+bWUw4plWA/FD+HxYejE/RtQFuIKATuiAIraYZ+JAB8TywLMdJAW8raCpbG8c7uzlFUeM/v/2yarGqal41564tLahshL/mNbRWjEBq35BVn+17LnStpctm9816+cBEWDNgRh92xki+Hae3pF2gWCdGwAbx0JzYwLzOzQkPVRmdppqWRq7/i+dEkzPktU401jhS6bVDiNXqIBhWyrlWYcUIqOnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh5Y5LvoKScz367f3sOgni5f0y9xZ8K0SqVRpaE9EHE=;
 b=IupuyBipKg+Z26LqgsvTLBkL2P/5WHVHc4FnZweOS2G1XJJmZJgQoXrpaBVxMEPy+pXwyCWDdC+7Qfe3ZfTKo6jj+TA5oiiF/FOAU8YUwoSOjoPli07S/hAAYcK/5WTj8R84yLqe2GRcsmy5hy32PviHas06nej+XADOJ6/h955BpqPavUBiPuMawog5BvMTFfkTJ3aG4uObl9kgkoT+CppkJhwlR9SJ37BFiH9AtBppOuMYTJnCDCmFo6P0xkeEkS5FlNy5/YYsUdncfvX59vxFtIzZZJDk87HrvaCRM+QZDqzGRuENOoU0u8wNkLDukHkojYQ7kQYySYBl2WeotA==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:22:29 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:22:29 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, "andersson@kernel.org"
	<andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, Peng Fan <peng.fan@nxp.com>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Jiafei
 Pan <jiafei.pan@nxp.com>
Subject: RE: [PATCH 3/5] drivers: remoteproc: imx: add autoboot support for
 A-core remoteproc
Thread-Topic: [PATCH 3/5] drivers: remoteproc: imx: add autoboot support for
 A-core remoteproc
Thread-Index: AQHc1xVcOYXJm26ByEmGiN5ILzdmwLX3JR2A
Date: Thu, 30 Apr 2026 06:22:29 +0000
Message-ID:
 <AM9PR04MB8196BA556427F7B92AD9F5428A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-4-Jiafei.Pan@nxp.com>
 <dfc04c5d-253f-470c-b32c-2da080e91139@oss.nxp.com>
In-Reply-To: <dfc04c5d-253f-470c-b32c-2da080e91139@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|GV2PR04MB12102:EE_
x-ms-office365-filtering-correlation-id: a4a61953-010b-4240-5f19-08dea680db39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|19092799006|366016|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 cM7a6cz6jGNX+/MJQr7HDKwfNd6qwFZNsxV5Mq5eR818jAdoGBYDoKz/3ytAXMlINLnF9v/ftMWwOprQV37+jj6KibA7PLpGJFib9FmIwXRa6eBjPIRDCMIf21KUywowYO2dchQkSSSocr92k5tyMJMaZR2RpT9tbzX1Os8QqdYJVxTvdjU2ucNK1+CjL5/OY7b0hDyzHs7ImWjaYw4wjV3YixKplu4ucmnK5hEd+BOpDdlRolTZG9KdvPHFsMjwnW6f3GpwRZ4aq7LWldfSGozg8DQI97fhAK9R4C3z2+8X4LMz1pHy0q0SQYaTHrZXcK4mSYNpnYw29czy1oleuU8w4CSJRTmoteHoxORuK30z3xAA/M8UFsVOquy/sI3mTiV3yP3RRF6Evi0YCq7log+K5LSLkMVRZ0YgNztya67CL1HyCC8oiAi+6DGZFril0jxsxelSMVRTocEeF5rsIe+S/Eoh3+8Ldl/IwA8mcmvzp+TbNQJn6s/dr9ivbgst4SdcWVijIu0rDB6XSt9gUWkDRAdvM9JgmccC7jxjsMM+7dvzP8etOvWnX/sXcrsmvEj2NhvVyBIxc1TMeMtl9itRgJj3OlcR3AVopjC+lXLu4gOnUDu45Ym+Ha4ozDQfI2zQ8n3Erv/4o6QweR988/yEIzczx/30vr301QWlexV80Hz6lvGYHHbDSfvEG6y4/8PQy5MsgEN9tPJBZ7zlos0B3LHuSWi81LXAsrX5yYmObjVRlOHSgYnRn8M7tEFt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(19092799006)(366016)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWh3ZFZQYWhCR3F5QUk1aDJxY3oxc1g4UlhmeTNNUFdZRjA5dTVhTzRCajJH?=
 =?utf-8?B?dEtpNW9uYzBRM2JtcDR1bmxrNjYxQVJWYmZvODY5bHFGelc5RHNrZlJhNlVT?=
 =?utf-8?B?QUtUMTBEanlNZ3pGZTNOY3dub05WaGxsRnl6RDdUT1R6RXlHWlcxNDFlb3R1?=
 =?utf-8?B?dVdTVmFyQXdIc09Kb0c3TGd4RFN4dlRmMFQ1L3Zpc2s5UW1UYVd4MjRCQXBh?=
 =?utf-8?B?NWhZQmJENGVTRTYweVRjK1FLZWtSa2cvdXVkeWlvS0c2T2xkTEYvTUg1THBs?=
 =?utf-8?B?VW4rRlhUWi9GVHFBNXE2U053WTY4cmFvcHEzZ2dZQ2wxSWpyMUJJajA5Y2dE?=
 =?utf-8?B?Z0srU3llY3VIczdodFY4R1JJUGZzY3RmUWY5N2JnWWpKQ3RlWDk4SFlaSkRB?=
 =?utf-8?B?Z1NhOTZEVXUrRmFYTHBwdHB6WXUyOVNDZEFNbkwyd1JqbkJXSEh4cVdUdFA5?=
 =?utf-8?B?S2RhNWVsaXlXdWcyNjRBbUl2Nml6aUdGR05zdC9MYjdXNHVib01ObDk3ME9p?=
 =?utf-8?B?TFQ1Wjd3ZTlvRlZEZmR5Y2pzc1EraVZ0WGthbnJSRVI4U2syMENQa3p1d1dJ?=
 =?utf-8?B?RmNDZDFXaU5ocUtBbFRQVU1oQ0NTd2dHaXhMUzFyNERRbCtJMGhtTFhUQ0po?=
 =?utf-8?B?RzF5dVh1SjhOK3hRcFNVaFhOd0I3eEtwUEZlZFdkbUQ2Q1dEakRpcEN3TmZG?=
 =?utf-8?B?LzFJYUFwOVFkRjVKRk1McXo5R1UvdHlxUldzdnRRdG40VHRYTXpna1ZBc0JP?=
 =?utf-8?B?MHNHczVLeWEyMGYyTzFCVFFjVStXNkc4dm0xWUg2UDZPSy9reHlFMWtNQm1Y?=
 =?utf-8?B?ZENVa2ZBRitMN2JrTmJmbnZKVkZvUG9EWHN2UE1nNzgvVExTcE9HQ3BLVWE3?=
 =?utf-8?B?d1RPdHhsVzhjWHJ3MG9jZ2Z1N0pmbEpmSkdyTkNDRnAzYzJIaHN6M0NtNGJI?=
 =?utf-8?B?WGQvRHRQUkJKU25nSlkrRk1HTkU5NDU5dmx0SzB4Mjh6aXhISnZDSlhMVTR6?=
 =?utf-8?B?Q3lrSkVqUFdyNHF3bDFhSXpwS012aFdjTkdvWktvUHRZNGpyR1pMRXd1bDBT?=
 =?utf-8?B?dGE2OGdhZDFSRkpCMWFFeWs3UjVSQjVINEo4YzlKN0tzcUlYVnBKQm0wMit4?=
 =?utf-8?B?elIyTVJqSnc2Vkc5Y0o1N21ULzkrMUJoQmdqNy9TbEV6ZmZpYjhQY3luTDNK?=
 =?utf-8?B?SytzeE1teStQMFlTUis3ZUpBaWkrUlJ4S3VWcm1KeitIdldUZHNqQlZ1MkxD?=
 =?utf-8?B?YzRaSVFpZ1VUSmFXa0IvZEFGNWFMVjJ5bWRhZG5COFNVZUdvYk12UDhOYlhP?=
 =?utf-8?B?ZU9iYWM1Z0taZC90Q0ZNTk9VcHhEbVNXWWt3L0RDRGtyN3pJU0YyY3NuVGh5?=
 =?utf-8?B?dFpNM28zcmVZK1dTSDE1UStmQ29HeUxwU0JOSVNBMVUzUDhaZ3pWU3V6aEVK?=
 =?utf-8?B?Y2hvRWI1U1dMbTNnV1U1Z2Q2T1YrbjgvQkc1MklxaDRIeFFYemlNNnU2aDRM?=
 =?utf-8?B?UnkreUQ1enFlRnZnV252akcwQzUxekhrTEg4M0R3VWMvZ2dGUzFwWno3TTVX?=
 =?utf-8?B?a1NrZTJKS0J3Zzk3cWUvd29kbTA2dG43akx5NHRnZWZYb2tFYWw1MWpLY0Zp?=
 =?utf-8?B?Rm5sa3RGWHRXWG5RaHZqaTZnYmZYcGhyc25tWExZY1R6d05LV1FEWWdYMCtN?=
 =?utf-8?B?bzZPOUs3YmdVWVdJZ2N0QjhwaVJxTU1NRDBsNnJ4MDJrTHBjbkxZdUdlREhF?=
 =?utf-8?B?NUdxK1p4UU95cXM3UjRpM0UzbmFkYlhjSTBtSnN2SGkvMXFIaVdqak45VkRR?=
 =?utf-8?B?Q1BRMmNnRGlwajVWVTlNTnZoWTlzNENNdTRtNkQ2UkpLV0cwUHAxclJHNjRV?=
 =?utf-8?B?SEV5WGFucDdwZGtlNWxQWFJoWVovM0RKMWVYZHpWSkJBZ0c3aEYyMGd6YkZP?=
 =?utf-8?B?eG52TmVaOVpGdk13Z1FlWlRzb3NaZStpa2R4YjR1cHZqR1EwV3BxdkRqbklS?=
 =?utf-8?B?amc3RVZ4R044di9TRllpb1JNSWRuOFJOTGF3M3RmTkJ4UjhxQ24vbEVOaThX?=
 =?utf-8?B?akQ4ZklBOFp4VnY0OUM0RENDdU81aHNGUmFEUzM3Z0J4SzZiZi9Nd1NLaTFZ?=
 =?utf-8?B?M2QzRlovV1ZEOURIbGdUN2tPNlJJT3QrZkJvSDdyRHhQZ2dmekFuaGdmM2Rx?=
 =?utf-8?B?aGVjRGtnNlB1UFNGaDhOb0gxbE84V3k1MHoyRUhLQlpFandSb1BHd0dOYnlV?=
 =?utf-8?B?SkZtU1J2ZVZxRXdWOXVUU3U0ZzhwY3FFR0F1YnZRd3lLYTE5UHd2djgzZmdY?=
 =?utf-8?B?SEtMMURkSWFjQmpwRUwwUWxLNFJld3BMam1WMXB4MlpmVHJ5Q29XZjlGaVR1?=
 =?utf-8?Q?KlWBDlwoCP9fFQQTQJabxsRaXhlOBJMAGHLlz?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8196.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a61953-010b-4240-5f19-08dea680db39
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:22:29.6750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VV+BmJlxG2IY5BwfrJpASDPK6pm9Mo4/7eLJJYK2Bt7bYvMNENH7LFBNM4AJFf4iS18fOK/yunvcHfmN6oZUnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102

T24gNC8yOC8yNiAxMjowOCwgSmlhZmVpIFBhbiB3cm90ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBqaWFmZWkucGFuQG54cC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9y
dGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0K
PiANCj4gRnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCj4gDQo+IEFk
ZCBhdXRvYm9vdCBzdXBwb3J0IGZvciBDb3J0ZXgtQSBDb3JlIHJlbW90ZXByb2MuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KDQo+IFBs
ZWFzZSBhbHNvIGFkZCB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnIGhlcmUuDQoNCldpbGwgdXBkYXRl
IGl0LCB0aGFua3MuDQoNCkppYWZlaS4NCg0KU2VlOiBodHRwczovL2RldmVsb3BlcmNlcnRpZmlj
YXRlLm9yZy8NCg==
