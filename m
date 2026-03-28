Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35591BC2A
	for <imx@lists.linux.dev>; Sat, 28 Mar 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774690676; cv=fail; b=uLoEoUrhZpoVHZv1MZTn4TtiPDN4ZVOFlyO/88qt7ZAIsjys/IFd/4YMUCpNqYlZpW3mS8HiVGQ0g0Bkhtv3R7clvh2JPPwCU3zS2O1FXTVDciHLRR2ZF/BhNhKNE8qtyl9M0ZPzPyBgRGKnSVJ21SlzVobWhQ2EYxZv26N6tTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774690676; c=relaxed/simple;
	bh=JH0Lwio2aeAzZqTU1qH3nBw2ciYClnCR2931pOA2iE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PFbWoa38vcS0TFcJBy5qGFdlQqY5bWL+CDo0rg4dLAFux6sIBNxnTJC3xhatDjTBO4j5oPfGRpALecZFKaecjghc2qdaaB7PkAwoZKgYTl090SceRS0xbh4sBheRrAXO75bn2k1+chrE5s6yMA/i7ofVj5RMzCSH7W7Jh8H3qOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O+ERz3Bd; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O+ERz3Bd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRONKnQsjOjI5gCIC/SI2PKNxHkmdoz78Snzi9Wz2e3ZTfPRsGDyKuV8UtpyavBEH9FRA/cfl5TBHb1DpdAPp8TajOJC6cd3amOrBFzAC0aHYNxBlZ+FJ4tNh4x1glxiR5nyjaoyz7TLVvnjErDAuS899LrWZR/U9+JhJ405Tl5NSbmqIxKYLGLlghA7508lf8HgJJogyxpeIPnouPWBTmr8XH814kpT4yMSKzbiwZU5DXo+s1eTZGKCiXgKzffR/OqslzIo2Llaq3/+l60mO2ctlqJIDLfv7udYUQxSc6pXSZcUR3TkbKu/EOXlkwJFNagsJ1yQrtTn7CGkncDrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH0Lwio2aeAzZqTU1qH3nBw2ciYClnCR2931pOA2iE4=;
 b=bUX1L23jOLqAMJaxzW0ZMI8oLxrXbpq8GI7BplsrNhjhDcBp7dVk8gJBfPzem+5poEflG2oV6OpdLEvINmw0bsJMK4zbk5RwJeCwImBYqncd2aA+78PRRXX8jA01VY+7vzYDBqMpend3/acFvt57zPNNUgM2sVBIhjdaVt5OCSIP7Mvv+PUHONRSjjeRI58rbT9beaYCsMVYNTLG659t+xtB6YQY3vaXG/SkAKgutWbno4MlQ28xLW5cmDow19GtVjGsEYekLJEdvXnAYVJHjxXmHTAit1WoidW//jCJCHk9iSoW1+ckJwCRIosDbt+EsREOB4iPUsy+bfOMaInlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH0Lwio2aeAzZqTU1qH3nBw2ciYClnCR2931pOA2iE4=;
 b=O+ERz3BdDmcJmxqWkQ3je6vVTGPnMyq3xWYme286/J0jEdasxmneZtMsa9ClrX7ZmHjADxRzq5uqvQ1qiFnoKiabzlw3/PqCliubRBpcbUbFuy5Tp7rmC/uKNrvcYhVjbn6CxLGwM6V2diDJiwut6KUNsYtvg51aMhKkZZ2RcUK2BdPvW/HQegD/VvBp1aIsLHPrDc0ESmA5HLBndX+Rc2MuTrgI7wb33J6pLrVl2Z3ZVlmg91Rbdcnz6LkAhX848wdcJ92d1fcZwPleSrQOF6FO8NLVl4twIctNADvjiwx6Jc/zlKOBRjZeioc+unzEMNnaN/S2cGqSwXqbEjWXpA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV1PR04MB9182.eurprd04.prod.outlook.com (2603:10a6:150:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sat, 28 Mar
 2026 09:37:50 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 09:37:49 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Topic: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Index: AQHcvpaJs5DfYW0xvE2o42zRoEirTA==
Date: Sat, 28 Mar 2026 09:37:48 +0000
Message-ID:
 <AM9PR04MB8353BC528DDBF158FEB50AF0E354A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260327031504.497650-1-chancel.liu@nxp.com>
 <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
In-Reply-To:
 <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV1PR04MB9182:EE_
x-ms-office365-filtering-correlation-id: 691c6bd5-0f73-46e1-be52-08de8cadac81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Ga4vbStKWdV6vn48yIDLPG0cLkNgpkfa44VGWTK4RFVH52OhLhDW10KL7B2okq7/w2ZJDh1V6oAJhkjVq0QT7LjM/PWFzuqjnZL212QqqNIs28nDxSHYxbhOcVMLcOmVbcmAkS562iLtjsh2QXO7niLCWNwIU05C/42xTfrLzRGM29jfmpyemY6KEZ8W2ze8htp4fPcSyHHvZOwrHFfjUeWI99iXMTjy9BtrN7ynCCX++WuO9bm+aUAwuTVPDoadb40ueH0W95/qeUEfZKVYPBCNJSBBHl6/OtVmQNfcIfFK5dcKaZIA267Zg8xqzefj8oaaw1bjPGA5d+hSr2xGrQzCm0Agj42NQZodTYIb0dMFBludO3R+Omg+RMCi1rCesJq46MJztRPuF5Gswp8e1yrOvgnrq5OtMSubaYMA6BOiOoqgTFoKyPg5b7MDk8EyIFmpWQ/Nr0UsZ4tmS1rLgWAi0w+P9luv5HwM26bASg9PbvLEiFmQ/3uEvr6iuUZ8UXNnwYwK4X23mUSxTTLCcJp3IMe/wfueIy07j/dPI6ciNSMrQ2pcSr1KOT3xrGbHYa2tFWYib+EWt8NS3Y2Jr52hOBHJ/KFdr1ONwWfq0io8TiJt6BLLCGFDBreXo54Ujx/8kRBx65cTK6ezxj2KtPTnWmRK6Z17AQWvHkZzwwR64GTuMVtKDnlsRki0MQvNi/izvdCx5BXcegyPiSILFkHvVlsF/hTuYq8l0LPWw7oB8GDcq7oCBsoTsp8h+0FJ1PiQUjCQYEVhZkWuDjsK4yGwb5BLgsXUI46U5jyLw0s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWVPbnUvaVJyQmRRK1ZWSUdna2NDZkdHUVJYUnREaDFOTW1Dd1JSK1dDRmdj?=
 =?utf-8?B?UnF6REVoSzVvamZxYW9hNU1jdkQybE92VVRlT2c1dFV4ZkVjNm9xd2NaNW5w?=
 =?utf-8?B?ZjhxMjVha05IZWJtZ0pPd3hieEluNE1kYXdDYWhscUMwQk8vME5taXJZOEQ5?=
 =?utf-8?B?Tjh3WVBYTWpnVGZlVm5YcloweXBpeUdFd3VMbzJMMWg2WTErU2E5aEpScmtP?=
 =?utf-8?B?TXlZRzJBeENRU01jUXJ0NjE3elVDa1puTk8veVZQUFJqc0kvaUtzdDdVQ2NY?=
 =?utf-8?B?NlYvdzJLb3lGMTgxNEdjNXZSWEtRVDYwNXRiOVgyMy9hSW9aQWE0QWtEMDM1?=
 =?utf-8?B?SS9JQ001a29UbEN2R0k2NG41SWRwQVZKeVB2aTZKeE44M3RnTWt0ZG5MN3hX?=
 =?utf-8?B?elNNSm04NVZ4SGlMcVFWNVdTV3gwWnNMNjBiZ1RkNTFDVEwrWGdhaGpyOXZQ?=
 =?utf-8?B?RmlWeElaQnIzNUlJVVJZZ2s5YlR6aHJPQ283VDNTSGZRTE9FQ3FEbVJGMWlj?=
 =?utf-8?B?TnB6bWt1c0NhNTc4V1FKWWNjV1BLeXpMZEEzblNMQmNzUUt5aXNQSW9zWGJ2?=
 =?utf-8?B?RnpYNjNmREpPUDMyQjREU2c2dDc4TThzRTN2b0RBdGpnTXc5MXQxeFE0bjIv?=
 =?utf-8?B?ckJFNjY0Uk5wQjlBd1Vpc3FQM0hBQXlybmJSTEJsWmRlWW5TYjlHdVdPNitE?=
 =?utf-8?B?a2xFQUViWUt5cnFzVDVkSEEyMG15aEh5L05TZnIwaWZ4VlNUMmg2RlJNckhQ?=
 =?utf-8?B?dE5MLzBjTjRpN1d5QkFZMjl2dFlIMTBNdW9VVDRobzlpdmdZSm9VU211YmxS?=
 =?utf-8?B?eE13eDdtMHZsTkFQR3JDYnNTYmRLVHNPallqbHo0bTBvT0xRa2NxcllsWnNT?=
 =?utf-8?B?T2JUVUdjMm94QXRhUlhiRytlU01lVGNTeGZHN0hsNjRPNkhRK2w0U2swL3pQ?=
 =?utf-8?B?QUlqSGNaVGZkd1o1c0xqaEZ3dmdVR0JJVUdLa3BXOVo0RURYZkNUVktoaVZz?=
 =?utf-8?B?MUo5NXZoa2hWbGlXSU9ET216QTgwMm1VSUhnYXR6OW9yVzl2Q3BVNVhpY09x?=
 =?utf-8?B?YURuUHMrWEh4WU9ERHMzSUo3b3MrVGZLMFpyMFpRTGliUWdFUC8vYjkvUE42?=
 =?utf-8?B?czFkcnRHQnlDWURuanM4NGZHZUhTUjRoY2hVeXUycEp2NFcwcEFuS1VpMmlx?=
 =?utf-8?B?SmNOSjJDOGVnRGE5NVR5aUhwbUtxUi8yQVdhZUJpR2o4MHFmMERualIxV09u?=
 =?utf-8?B?N3lrWit0VGlXUlY2eE5hR3VNZ3REbm1IQXViQ2UvQStPKzBud0s3VUlsM1JE?=
 =?utf-8?B?enlpd0pGRVd4S3VhT2lLVVZZeHRpdkZUMzRHTXdPckhqdzZ1VmprODNQN210?=
 =?utf-8?B?Y1o1N1d2SGhBVncralZZWmdMV1JGTzlJdzFTN3UxR0p6OUZ2TXRPZnlGWGx2?=
 =?utf-8?B?M0x3NjJScmV5ZjZhTnZFSGVkaFAzQWFoS3NaenFuc0FWdGlCQjNCbkxOUC9Z?=
 =?utf-8?B?RlI0dHJ4ZURDT091clp3NW5CMDVQYUtxU0FCZTFuU2RPdldEVUFkOS9nVkM3?=
 =?utf-8?B?Tlgrc0h4WkRaOHhlcWdBcjgvZkFXNFN3RUdoVlpaekJiV0hiQk55TkxWVkxj?=
 =?utf-8?B?OHl4RWpHRU5UTGtkcUpZWWJXY2VVNi8xcUw1dG8yRng5a3d5ZHk1dzBiaDI4?=
 =?utf-8?B?dnI3ODhSREppM0pSRlRMN01VMmpXSXRCMDNIdjdWeHdRTExRbG5PRytKS2xU?=
 =?utf-8?B?OS9Ud29xV2hWcXZ0V1VxYWVtRkY0NjdONXNFWUhVbXhJWm9xR3c0MnB3eDFo?=
 =?utf-8?B?VlpQMUMwUUplR2NoQ21mTGMxcEk3Ui8xei92aVpyS1VJeVRmL3Vzdm5GU1RP?=
 =?utf-8?B?YVdJOEo3c2haZ0RNekN6dWh5a0R1Zmg2Wll0SG0xK0Fqb2wyZG1Bclp1ZkJZ?=
 =?utf-8?B?cGhTKzNmV2dUVGF5RUFmeXlmMHJBUTlZTXF2Uis3cmhNamhNZFBQTVNDSmRz?=
 =?utf-8?B?L0VEZXhVWWpTUXVLUmNQZjNlbFNoR1FHNkZLVGhSbldhSEdCTm1IU20zSG43?=
 =?utf-8?B?Q1RQc1ZZSGFOa0J6Tysrbld2ZW95QU5uNVJlaSs3ZjgyYkdlZjdoWEF2VWpi?=
 =?utf-8?B?a0RoenBXNjZMdkRqUmZINFJxd0w3dzN2Wkkvc2pjR2hTcnJ4S3JocTRmNTNl?=
 =?utf-8?B?VU4rMG94UThXa2FFdTE1cmtML3JuK2VjS0svWit3a21XMzdBa05BcklQbnNO?=
 =?utf-8?B?L3JsMVg1eXB0V2U2MllOS0VwL2wwa2NNc2lWZk1LcnZTWW5raHRoOWc5NDl3?=
 =?utf-8?Q?OC+nRYKKd3gNThOLyQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691c6bd5-0f73-46e1-be52-08de8cadac81
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2026 09:37:48.4087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oG/ctuhMHjhxLl2gfqQhCzoFqeATMI94PeHoZxZ5EP30HytnJbYZ1DKnWzDNOo2fL9PDiGsZU44vZAkzqUUwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9182

PiA+IEV4aXN0aW5nIGkuTVggYXVkaW8gc291bmQgY2FyZCBkZXNjcmliZWQgYnkgdGhpcyBiaW5k
aW5nIHVzZSBjb2RlY3MNCj4gPiB0aGF0IG9wZXJhdGUgaW4gaTJzIG9yIGRzcF9iIGZvcm1hdHMu
IFRoZSBuZXdseSBhZGRlZCBDUzQyNDQ4IGNvZGVjDQo+ID4gcmVxdWlyZXMgZHNwX2EgZm9yIGl0
cyBURE0gaW50ZXJmYWNlLiBUbyBwcm9wZXJseSBkZXNjcmliZSBzdWNoDQo+ID4gaGFyZHdhcmUg
aW4gRFQsIHRoZSBiaW5kaW5nIG5lZWRzIHRvIGFsbG93IGRzcF9hIERBSSBmb3JtYXQuDQo+ID4N
Cj4gPiBPbmx5IGkycywgZHNwX2IgYW5kIGRzcF9hIGFyZSBpbmNsdWRlZCBiZWNhdXNlIHRoZXNl
IGFyZSB0aGUgZm9ybWF0cw0KPiA+IGFjdHVhbGx5IHVzZWQgYnkgdGhlIGhhcmR3YXJlIHN1cHBv
cnRlZCBieSB0aGlzIGJpbmRpbmcuIE90aGVyIGZvcm1hdHMNCj4gPiBzdWNoIGFzIGxlZnRfaiwg
cmlnaHRfaiwgYWM5NyBhcmUgbm90IHVzZWQgb3IgcmVxdWlyZWQgYnkgdGhlIGhhcmR3YXJlDQo+
IA0KPiAicGRtIiwgImxlZnRfaiIsICJyaWdodF9qIiBhcmUgc3VwcG9ydGVkIGJ5IFNBSSwgc28g
SSB0aGluayB0aGV5IHNob3VsZCBiZQ0KPiBhZGRlZCBmcm9tIHRoZSBoYXJkd2FyZSBwb2ludCBv
ZiB2aWV3Lg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFNoZW5naml1IFdhbmcNCg0KWW91J3JlIHJp
Z2h0LiBUaGUgYmluZGluZyBzaG91bGQgZGVzY3JpYmUgdGhlIGZ1bGwgaGFyZHdhcmUgY2FwYWJp
bGl0eQ0KcmF0aGVyIHRoYW4gb25seSB0aGUgZm9ybWF0cyBjdXJyZW50bHkgdXNlZCBvbiBhIHNw
ZWNpZmljIGJvYXJkIG9yIGJ5DQp0aGUgY3VycmVudCBkcml2ZXIuDQoNClNBSSBpcyB0aGUgY29u
dHJvbGxlciBvZiBpLk1YIGF1ZGlvIHNvdW5kIGNhcmQuIFRoZXJlZm9yZSwgdGhlIGJpbmRpbmcN
Cm11c3QgZW51bWVyYXRlIGFsbCBmb3JtYXRzIHRoYXQgdGhlIFNBSSBoYXJkd2FyZSBpcyBjYXBh
YmxlIG9mLCANCnJlZ2FyZGxlc3Mgb2YgY3VycmVudCB1c2FnZS4gQWNjb3JkaW5nIHRvIHRoZSBT
QUkgc3BlY2lmaWNhdGlvbiwgdGhlDQpmb2xsb3dpbmcgREFJIGZvcm1hdHMgYXJlIHN1cHBvcnRl
ZDoNCi0gaTJzDQotIHJpZ2h0X2oNCi0gbGVmdF9qDQotIGRzcF9hDQotIGRzcF9iDQotIHBkbQ0K
LSBtc2INCi0gbHNiDQoNCkkgd2lsbCB1cGRhdGUgdGhlIGJpbmRpbmcgaW4gdjQgdG8gaW5jbHVk
ZSBhbGwgb2YgdGhlc2UgZm9ybWF0cy4NCg0KUmVnYXJkcywgDQpDaGFuY2VsIExpdQ0KDQo+ID4g
Y3VycmVudGx5IGNvdmVyZWQgYnkgdGhpcyBiaW5kaW5nLCBzbyB0aGV5IGFyZSBpbnRlbnRpb25h
bGx5IG5vdCBhZGRlZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5jZWwgTGl1IDxjaGFu
Y2VsLmxpdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBSZXdy
b3RlIGNvbW1pdCBtZXNzYWdlIGNvbXBsZXRlbHkgdG8gZGVzY3JpYmUgaGFyZHdhcmUgcmVxdWly
ZW1lbnRzLg0KPiA+IEV4cGxpY2l0bHkgZG9jdW1lbnRlZCB3aHkgb25seSBkc3BfYSBpcyBhZGRl
ZCBhbmQgd2h5IG90aGVyIGZvcm1hdHMNCj4gPiBhcmUgbm90IGluY2x1ZGVkLg0KPiA+IC0gUmVi
YXNlZCBvbiBsYXRlc3QgY29kZSBiYXNlLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+ID4NCj4g
PiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZSB0byBleHBsYWlu
IGN1cnJlbnQgc3VwcG9ydCBmb3IgaTJzIGFuZCBkc3BfYg0KPiA+IGZvcm1hdHMgYW5kIG5ldyBz
dXBwb3J0IGZvciBkc3BfYS4gTm8gY29kZSBjaGFuZ2VzLg0KPiA+DQo+ID4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pbXgtYXVkaW8tY2FyZC55YW1sIHwgMSArDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2lteC1hdWRpby1j
YXJkLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9p
bXgtYXVkaW8tY2FyZC55YW1sDQo+ID4gaW5kZXggNTQyNGQ0ZjE2ZjUyLi43NTc1N2ZiY2NkODkg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L2lteC1hdWRpby1jYXJkLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvaW14LWF1ZGlvLWNhcmQueWFtbA0KPiA+IEBAIC0zNyw2ICszNyw3IEBA
IHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAgICAg
ZW51bToNCj4gPiAgICAgICAgICAgICAgLSBpMnMNCj4gPiArICAgICAgICAgICAgLSBkc3BfYQ0K
PiA+ICAgICAgICAgICAgICAtIGRzcF9iDQo+ID4NCj4gPiAgICAgICAgZGFpLXRkbS1zbG90LW51
bTogdHJ1ZQ0KPiA+IC0tDQo+ID4gMi41MC4xDQo+ID4NCg==
