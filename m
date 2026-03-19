Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1627AC48
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773885301; cv=fail; b=JOR5lpiqy1kxfr76Vxz0asvvVnA/t7iHEYYYH7fBIm57Q3pnf+n7x7bxZWvnXIMrnEgjjVpZ9qeaAAMqd+/5G7nzWfN0U0eeq8VNzolkZ3ZuxYqcjwraTMXFxF4Tco9APimA9Ep0FcZRp+JrHpNVXvuNbYDLeICb9DHXBIDQ6qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773885301; c=relaxed/simple;
	bh=aers2bSfFF8vHGcIjFN1aHCLtTvZHkVrSRcEsoL17J0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M/KwiKeHIGuCAyJW8F2AV4zu903kYpWFZmXZAua3wHE9+b0vuJnG/zwx465iFiQuD04I0fUtb3voPW2qiGgP4fZ5lquWHklNqV0uEMKuJv3FptXgQr/T1mNSoas5sHgJkG8dvZUylrNLJGL+oZJ4kL+rkHmkSecdgJZvFOhlMMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HV4xLyef; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HV4xLyef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbPNDFsoVgiVea0vFy3RmIxA1Pvm68blhQDHDp4cQc6/lZurVQuxMXdOCP0wPqGcDf0pdP7Cbki3x35YzSs4pTqVE9U0ufbdufW4cTpAdvozwRi4NDgTer102+jwhktg233C+vi5L7VkVbKp9u609Q5LVUEfTXdqy+/LcQCtNO0WGr5C6CGydNBqPGlYJDgAaO6Dq2eFMOqtxyQIMtXH4MJOvdIXlFMs5XG4LyQc1D5NdT3TI5G5SBT6X7G/Gx6mOXNmOQAXdzRoQxJEZVt3Yalic//C+OiJiTNO5Nzl/ci4oOHtvJA3RyiqBKk3hmD4rBnZtwrj4aGZPGb5VyV+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aers2bSfFF8vHGcIjFN1aHCLtTvZHkVrSRcEsoL17J0=;
 b=P37gEEx8FwV+0Zyn+1q6PSFp4ySkGVI9gCKq8Fm0sCOk6Jb+ixDJxNk8Q/1HBxhoKpdp4hgmXufJTPeL0QdSMscWodrlvUQ+g1tFPvEiyBumG6oTBe9x661z54On0rEg+3xeEr6F74W2eSMgC80JHJc/WvjEKyjOsMkG2yHbHWi50fpniMGXE+OMUfzE6Uuc4/GP78e6Ffp74dS/AHwZuenSfYJ19dSCEaR9jTmUxiYCPebqNIIG0d0RriD8pDvuz2Nf493b30L+PwV58z4jfl03tx7y9QAp5ZtBeZrCrL9KgwTlUw0Kqh6fFEyO5PN7LDOBgFptrooG2P3cOxX8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aers2bSfFF8vHGcIjFN1aHCLtTvZHkVrSRcEsoL17J0=;
 b=HV4xLyef5loopBuvQDSKPMWt17etqqpXXo7jq37H6TK4dI2s8eWZOAIFYOv4My29Dwxo8P7NCvg5R9nwiuHPefL3RIb7uRBlJu9WN/1TR0ClRh+aJEAjSj5L/6HK0bdrJQdtB1jDO5VewtDa3Hy9N9jWDJkGPIaFbEI6fWnt4+RcJOqdgD7g+mY8X3O7PSfrx9uh8L2GcyMT/8xG5GbVDAGqIjsgdVXt21n+/I+JINVO/7yVkbsKF6fIwUg3Hzxg5TYERnrbBRFqAZu2xkjWbbFBeemNctg3JK7WAXD8GSQXm8QAMpXSf6IUUcjyzmcVeKlsC9rZMCwCG3Fg75PITQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB10035.eurprd04.prod.outlook.com
 (2603:10a6:10:4ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 01:54:53 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 01:54:54 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Hongxing
 Zhu <hongxing.zhu@nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
Thread-Topic: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
Thread-Index: AQHctbtlKkhQU/V59EiKwdkjRBejFLW0LMOAgAA2A1A=
Date: Thu, 19 Mar 2026 01:54:54 +0000
Message-ID:
 <VI0PR04MB121147409F4203C7F156BC25F924FA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260317031024.444157-1-sherry.sun@nxp.com>
 <6b5f1a67-b6ab-48b9-9cd0-1c154177d841@oss.nxp.com>
In-Reply-To: <6b5f1a67-b6ab-48b9-9cd0-1c154177d841@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DB9PR04MB10035:EE_
x-ms-office365-filtering-correlation-id: 46f5d09f-0195-4e5f-0146-08de855a8421
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 qgvR2/Gegu08TlMZpltBNySepekGnwz7chuhVpWWIS3fjzYseE/YCd6eWnLQ30W7HcBII78X4tTQgBruSESm40/1lNa8ozRjh+KExvXYzgEdZoY8QmD/fmkdEVNIgQ4xTR8jRflpFlIB3sdcO41D+XvvCrxemYhQXPnys8sU9uzM/qMSrvMtMWvZXp9ex4Yn74RVBG30oKZq99MenOm3VPrJPETk5yEqbgThL552/WpQlu7jO8u6XhGuuEqsPLqYBd13/O105KO+SI8tNxbMOCECcJGLpSggYy29DotYf2hK8qlryYDFOsf53BzNbhNIe7UOMcEKzmDM60sOxbrosqqkLEhEIFQLLtDyVvJsbqTPu0ZziLx5+pC/iWwL580WKuZaVtUt/W6SSHgvmOIXGcWgoBz/5gzH4inwGne1TcZO4ND9LAfdfpeCSeUGAE31HW/EqHr2GVaasPTBmQ9vcRebTvOmFC5v7zKRTEFxDXMLoAzsxhlkq8W7c31b4CTzvXl74svu4JK/16amlWWYtYC6LOFOOPnhla3dSu/QpXQrOPP8uUVeVfMJg0OyxS/g94CqDESfJQ9XiaRQzDBXKoA+RAMI1MkR9k1no9YEhAq21dje/SRvXeGUCbpywSlwbXev7iQqcB2XPU9/wRVnF3g0HAanPh+JWSTrf0F2dsbRuXTKC79ZrleIsmlgQXp3/xsvYQfnoZdGqKQG0l7D9Nzj3H8KlyxTPmAHQX2+3exYLfonKd+lz08tE4QaxJvcM2QYTSHILKDANTb7/NT45yqDwqvJECrN/i+FR0qIG04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWlmVDVZQ3JVZC9RdnpnWk1vSVc3NGUrdVhEYzVLRUdyMXV0ZFM2aHE0MGNm?=
 =?utf-8?B?RTJpZkh5bDljb09wdk9iT3h6ZDlmbXR6ajkvRng4cjhncDFVY3ZEcVBqbURD?=
 =?utf-8?B?RytZb3JGRnBMdkFnS1J5SytFcUlXVEtrZkRma0dKWW03RTYwc3Z1T3RZS0ti?=
 =?utf-8?B?cGVYdEVlczU5WnRWL3hpTjJ0VGhYaVdvYUVsNHdCZ2hCUTN1QTdCTkt2ckRn?=
 =?utf-8?B?ODdmby9wUjNXOUIxRWlrYlR2b0hncFBJS2p4Rmlha29GanN3cUpnZEpwbHJO?=
 =?utf-8?B?Ym0zT2lsZVozYW9FQzJ3b2Qyb1ZMNTlSa0JVVmhCeXNqQzNFN29HMWx3MFVF?=
 =?utf-8?B?cEZjY2NCZXM1OFJ6YjdpMmNpamFSOVhWQVpEWU5taGxkaGQrU3RnVE5oY0dY?=
 =?utf-8?B?WW9aQnVVeVlyVGhDWC91YS9Zdml5ZUdUU1dyY0hBUUtTc0RuOWJJdEU5TmZW?=
 =?utf-8?B?eU53Uy9EUStSdjZoRzY5YTRMUDFBcnNRV1pqbFRKbmJRZFNZamdHajlIa3Rm?=
 =?utf-8?B?UDhzak9rQlhRcW4vdjRPcE9oMms0WkZzc1UvTFZxUjg3OUx3VCtQVFBkcE1N?=
 =?utf-8?B?S2I3d2YzbVdFVzhxeG1QYXBDeVVyY25LbkRVSDBIN0xMdHFuak5NRWtFUXNV?=
 =?utf-8?B?T0M5c25McXpvZDh0RGdnQ3VwWVQzWTVMYnpZK3M1NkprcDE0UEpxWnI4dURV?=
 =?utf-8?B?c3VVRlgxdi9jV1E4TlZ6dzRaVWc1aFdTV1FOT0dwSDNUYXZ0ZGJTQTdzWmMy?=
 =?utf-8?B?RTVIempDZG9NNTZsSFZPVFRLVllNdWI0UzhKTzJhUE1xZ1haM0Urbk1Ea3Ju?=
 =?utf-8?B?VGMwTm5tNkc0dEEyK01LSmZRNWVKS3JHdmhYaElnaFhlSHN6ZE9Hb1ZjMHdX?=
 =?utf-8?B?NllJaGV6K3dicGFTZ1Jsd09ySTFUOUZPb0FZZkEvSi9SQWZkK0lUY2FpejAx?=
 =?utf-8?B?dFQvcnlKc2JzRGRob0NORVQwc0tORms2QVZpOHhNRXJkamQ2UklwM0RjQTg5?=
 =?utf-8?B?M1hTWVJZYXpJTFNqYi9PVmhNUitEV2dBU0UrTDl6ZjhVMUZOU1FqbXorQ09M?=
 =?utf-8?B?cEFqNFRLQmhsSE1KZkVBUjRaeFRVM2poSnRiTWVCZWV3bXMrWDFrNmNhVDNQ?=
 =?utf-8?B?M2wrYzRHdWdIcG13T0NNRENETGZnc0dMTVkxb1dMSUZvUzVUUFZUdU5oOVdZ?=
 =?utf-8?B?blJ4amNHUTAzc2h3TWxJRkdBVng5em9OQ3Znc3hlSGlJbndXL1c3NHBhRVlh?=
 =?utf-8?B?WS9ONUZWNGxXYmFIek9wcDVSMklyRlA1R2J5T0hFdlVTQzFGQjRVbC92OHBD?=
 =?utf-8?B?azJmSm9tUWhxWHAzNWhpNDVPaFhkTjZ2bjA4cjdtWEhlM0FXb2xDdXVBWUlL?=
 =?utf-8?B?MHp4Zzc5QnZOSXhJZVdxWExyZjMyUkdMMFRvT0dhNW9Md09LVFBYWkllZVQ1?=
 =?utf-8?B?ZzM4dmduRlowTmp1cjJ5MldWbFkyV3J5d1d2cmZxTUJvOXJQRkwxQ25LQ1VS?=
 =?utf-8?B?T0RBeVhpSjFGUDBUa1RXa1MxWDBxeFI5dk9FVGNvYzdiNTV3Ukg2a3NFUEtw?=
 =?utf-8?B?WE9aSVR5WTZhNnlkcENjTS9yV0EvcmtYUG8xT0J4SFRrb1ZWVDlMcEYxVUd3?=
 =?utf-8?B?UldOamM0bis5b2dDTndib3lBQkMvOXBJUHdPQjREMzc5RTV1cE9obVdyeEoy?=
 =?utf-8?B?S0JiRzQ2d01nRGkzVTFkZmUwNHAvZlRKQk10MzlZZUZxaGV1YWNyYzdjbis4?=
 =?utf-8?B?dEpIZFdoYmFCcXRuUEZ2TU9IRFZTVmwzVjlQUmpxTklTVUNMRWkySldnREw2?=
 =?utf-8?B?c0grUkpLMFBBdWFWRFVtZ0ExcDMxLytlVzJUbG05ckVidWdwdVptOFJTVWdy?=
 =?utf-8?B?UWpzOGhBbzFHZlN2eW5aUnhPTEpXR21aWDBLRGZVOW51MU9ja1laMDlrRVVN?=
 =?utf-8?B?MTB4eVJiZ3VQd1d2WmZOSThudTVWWmZFbDAwbWYvSGJjbitlRHZPTWtxNkh1?=
 =?utf-8?B?bEhpM3RmQnV6TXpaTVl4eklRWWJ0dTFJMnR2Vk92Q1pTK0ZRSDVtMDdKNE81?=
 =?utf-8?B?YkdFTmQ5dkFxY2g4c1FhNHAzeFYzeWZsdVVSclEvT1ZyZGVGclowZEY0RC9w?=
 =?utf-8?B?L25KT0RvWG5ocXpONnhkVEE1ZHZRcDZ2N2EyKzI5ajVlaXFvTmdlTGNJcXAv?=
 =?utf-8?B?bGx3QU1QVGhtdzZGenJUNXdsb1FIYTFpRisxSGtEMUZraGR2OWV6eGZTTU54?=
 =?utf-8?B?QjJLT1dtNVgwOGZiSGZpNWc1M3JRUFBQZUhaTzhJc3lQcDZ3K1l3bVBGZWFW?=
 =?utf-8?Q?fRxuq0bHF2nR3fjDDy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f5d09f-0195-4e5f-0146-08de855a8421
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 01:54:54.3318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzUUJAlYielSfqcNABx3CACwBus2ckorPsKHPChgkaMiAkOWwA6pgfPQXbKqJtyCrOpkJeY0hp0yCjK1B0U+1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10035

PiA+IC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQ0KPiA+ICsv
Kg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAyNiBOWFANCj4gPiArICovDQo+ID4gKw0KPiA+ICsvZHRz
LXYxLzsNCj4gPiArL3BsdWdpbi87DQo+ID4gKw0KPiA+ICsmcGNpZTAgew0KPiA+ICsJc3RhdHVz
ID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnVzZGhjMyB7DQo+ID4gKwlzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiA+ICt9Ow0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg5NS0xNXgxNS1ldmsuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OTUtMTV4MTUtZXZrLmR0cw0KPiA+IGluZGV4IDdlYjEyZTdkNTAxNC4u
YWZkODljZTNjYzViIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDk1LTE1eDE1LWV2ay5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg5NS0xNXgxNS1ldmsuZHRzDQo+ID4gQEAgLTU1Nyw3ICs1NTcsNyBAQCAmcGNp
ZTAgew0KPiA+ICAJdnBjaWUtc3VwcGx5ID0gPCZyZWdfbTJfcHdyPjsNCj4gPiAgCXZwY2llM3Yz
YXV4LXN1cHBseSA9IDwmcmVnX20yX3B3cj47DQo+ID4gIAlzdXBwb3J0cy1jbGtyZXE7DQo+ID4g
LQlzdGF0dXMgPSAib2theSI7DQo+ID4gKwlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICB9Ow0K
PiANCj4gU2luY2UgdGhpcyBub2RlIGl0IGlzIG5vdCB1c2VkIGhlcmUgd291bGQgaXQgbWFrZSBt
b3JlIHNlbnNlIHRvIG1vdmUgaXQNCj4gZGlyZWN0bHkgaW50byB0aGUgb3ZlcmxheSBmaWxlPw0K
PiANCg0KSGkgRGFuaWVsLA0KRm9yIGlteDk1LTE1eDE1LWV2ayBib2FyZCwgdGhlIE0uMiBjb25u
ZWN0b3IgaXMgcGh5c2ljYWxseSB3aXJlZCB0byBib3RoDQpVU0RIQzMgYW5kIFBDSWUwLCBhbmQg
b25seSBvbmUgb2YgdGhlbSBjYW4gYmUgdXNlZCBhdCBhIHRpbWUuIEJlY2F1c2UNCnRoZSBIVyBy
b3V0aW5nIGZvciBQQ0llMCBkb2VzIGV4aXN0IG9uIHRoZSBFVkssIEkgdGhpbmsgaXQgaXMgbW9y
ZSBhcHByb3ByaWF0ZQ0KdG8ga2VlcCB0aGUgZnVsbCBQQ0llIG5vZGUgaW4gdGhlIGJhc2UgaW14
OG1wLWV2ay5kdHMgYW5kIHVzZSBzdGF0dXMgPSAiZGlzYWJsZWQiDQp0byByZWZsZWN0IHRoZSBk
ZWZhdWx0IGNvbmZpZ3VyYXRpb24gKFNESU8gV2lGaSB2aWEgVVNESEMzIG9uIE0uMikuIFRoZSBv
dmVybGF5DQpmaWxlIGlzIG9ubHkgdXNlZCB0byBzd2l0Y2ggdGhlIGJvYXJkIGludG8g4oCcUENJ
ZSBtb2Rl4oCdLiBLZWVwaW5nIHRoZSBIVw0KZGVzY3JpcHRpb24gaW4gdGhlIGJhc2UgRFRTIGF2
b2lkcyBkdXBsaWNhdGlvbiBhbmQga2VlcHMgYSBzaW5nbGUgc291cmNlIG9mDQp0cnV0aCBmb3Ig
dGhlIFBDSWUgbm9kZS4NCg0KQmVzdCBSZWdhcmRzDQpTaGVycnkNCg==
