Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B72480DE9
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990658; cv=fail; b=Xtb0fr6pElhY/wkp9Q5mQffNIm77Wk5upv5CJi4wtcMhM9nd4mMp2SdOmXuQxJzzJzct38XKdD6XFSpzI2CY6VOC3pgcH0IfGvvzNUZFrHbfPY6rVWOJB+BabSfQgXzl5y4mVznT6jkyL62Z0Bwhiu3LJEA9OZHsK7AZG8Z8ibk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990658; c=relaxed/simple;
	bh=7Qj4qfwGqvCvsl/SWtFZ2o3LejzLMzAOJB8WUNDVAPY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cSpmMOOeRfn8LeYDYTekUQzcZFN5DRbhNS8CJS0+iWeJ/yNgz3YSJCBlj7LwkjqoHLwZ+SOt1Xbv0u9qqjHA1BNBzJbPkzHAntPXi4X4CT2xKuEsa9yKnp6liEPmKL1zoTBvvlMrJyhHLicSxCYi4zJvLEsr2vCaYlAdrk0ttY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ihRPpB33; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ihRPpB33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDR7OQ0SjFqYNeAj4v0MdOe3rel2AQAtjk3iZG7YKQAeYnsKIrjls/eNtr1QvJkQtXzeeng/EVg0jrJrdkw+iju/lbfoGRLmNqqu7fyvJx40lmUCRVwfSLP+au2KlnSoAPJiaHLyb/+uG4tvTiOhSFn6a5JcWqcDE4fgUmGCBiL5DEzSFmzgcqqwRh4eo8F4yVgzv6sYUXlAWOeIwztDkS6jPLsBB8lauLYFQkpj5Bbme/pm6RETun4wSBKpLJTVyfHPxV4t9UfxEuVdwQu12wnKa+t/PugBO+E90fmAmWShdK58i4vyK4ORuEYOdk0o4YDv4gE3pz/8/s5J0f4jDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qj4qfwGqvCvsl/SWtFZ2o3LejzLMzAOJB8WUNDVAPY=;
 b=p4yVSudzqCNQZL4Lzfb9RZpnp0YITaRR2qXDLrS7dB8nx88Gw1+4xWpg6oGOpC2iAK5JoUVNgxJ64J65EavDOIp1UBDlXTGYN0KrdRzunMLJ8iMzQwVdQunaUjCfKoNGG9LWKhWAqDdBgiXZiaeMDmMktcRJLgtZI6SZekyvyklc8RV+uvnCX/DEFaRkiV7pIKVOyFhRvBQ78IUea5hn/5+/74SWmx6bMXq9t1lufnCe7JsyKr9gxb3zTcWWUt+ITF0OrcUctTlh9hrdC/qPtA3PMviACzyiZf32lV1cZJef3mB0qX5gQX5IRdnBMwIlgey1oELkr3bNTEWbcvDAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qj4qfwGqvCvsl/SWtFZ2o3LejzLMzAOJB8WUNDVAPY=;
 b=ihRPpB33OuDhRm6jz5PWZYT2K++EHG2pkaeD82VTwlg9144UcRMIbBgW3B1oCQ1qY7Vm38iPat6tuewocpozuXp73R67DLYx6c+ilsX/jCBCcLR42aS4uwSYFeWd97zMy9xi2oM81TDUF1ql24m3tVCkg32HfiQu41Bhsd1MIzK5jperlzp/SerMTJnm8vmo8rIpCf4Y4F6rV2W3uuB4VwmXWEeIh6wncZGozWL6tl/jbf0aSypbzwdNRZB7CgxU0MuzjPjp0cnjyh80Vck7R0NtP4IqBvEwT7w7liIMpgXlrizA5Lw5D6GGd0C25eDUbnnHDz3dSiTgmWUPl1az8g==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB9663.eurprd04.prod.outlook.com
 (2603:10a6:102:261::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:17:32 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:17:32 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Josua Mayer <josua@solid-run.com>, Daniel Baluta <daniel.baluta@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta
	<daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index:
 AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRCAAEjGgIAACMaggAAek4CAAAQegIAAApAg
Date: Wed, 21 Jan 2026 10:17:32 +0000
Message-ID:
 <VI0PR04MB12114C9E6A4170AD957E92A609296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <CAEnQRZDCNXcAH7kBCPLJm2pPrJ9akXX+ZMW98H7MO8Hptjp3TA@mail.gmail.com>
 <b604d66e-d7c6-492d-9213-8d7e748dcc29@solid-run.com>
In-Reply-To: <b604d66e-d7c6-492d-9213-8d7e748dcc29@solid-run.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PA4PR04MB9663:EE_
x-ms-office365-filtering-correlation-id: b0cf183b-e856-4df6-306c-08de58d64a45
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTBmQjlmaEYwNklHT0tjZVZFN3pmRVFRQW5UenVKZTVRWlhvdGdDeWFIZnk3?=
 =?utf-8?B?d1ZsTjI1WWd3MXNIYStsMG9oM1ZoVjdacVhzVFRGUEhxT2tZUnlhS0pqaXox?=
 =?utf-8?B?UWUrWTJBZUNudVNyRndENEFtS1pJUFhCNTcvQ1dySWh3TmdzNVczV2lUM2o0?=
 =?utf-8?B?MC8vV0tjRG03bVZ6YjZDVU9aZmsweStwWXcxV0RHcnVFSHBVM2VidUkvT1Ra?=
 =?utf-8?B?MnRtVG00ajJhZ2VXVUIxaUovb092ZTMvVWVEMGdpVE1WMWU2ZXhLZGkrNTJW?=
 =?utf-8?B?SUc1YU5JTmc4cy96Wnp6bTdkdXB0bzU2TnpFZG5WSUlDRjRlUkJrNjhtMWpH?=
 =?utf-8?B?dDFVTGFCWUZoQmlIYytkNHRxWUVJRTdPQmlhYTNPb2s0WmlSTk9ZZmR5Tm5L?=
 =?utf-8?B?dmZvU3JORG8vSCt4WGJ3N2pSYks4L2Q0bEZqQ2R0bTByNGJ6b2V3K2dKeE42?=
 =?utf-8?B?andSVzUwUTRtVEJxbWhyNEpFb2o1czVWRkRiMnl5UTExTVRPRkVMYkk3bWN2?=
 =?utf-8?B?VWN3YTRyVHlMbnlEOHdja3N2WWVkRmI3bmVOWVhRY2hZakJGSG4ycTVrL0do?=
 =?utf-8?B?VjJTbkZsd1FFQldmeDFrMGRFK0xwT2NQWHgrcTRjeUVpdVBjSHZHUkN3SGwr?=
 =?utf-8?B?SXZZdU9pQ1JjZDVsRGYyZnVuZzZMay9yajgyVm1pam5ZZWJjYzNnRXZqck0y?=
 =?utf-8?B?VGxKZnBrTzRZZThBZW13bERtUEVpSDFXWVI5em1HWDNVekRxYVg2WGpyUGxl?=
 =?utf-8?B?dGJCcUppcWZMREszOThTTnpOZUt3aGo0QWw0SVRYVXo0ZzAzTUJVZXpZLzRU?=
 =?utf-8?B?V3gvcHpVdHZqcFpiNzR2Nm11U3VnMkhkUHpQbEZ4Nm9TQVltTXFaSURieXVY?=
 =?utf-8?B?T2dVQmozOUhUY2JMMFJTSDU5QjArR3FXRHpCQ0ZVejc3dHBDODhHQlkwKzNZ?=
 =?utf-8?B?T1ROcWVrbWMxaS9MR3hCMVNDL3UyNERiM2dDeXMydmxYbXU2TDJxbVpwaDJu?=
 =?utf-8?B?ODhFZjFsZjVzdUhVYS83ZWxxTWVuQVV5SnVIa294U0Jpd1gwVUNiV1ZaeGpH?=
 =?utf-8?B?SnpxR1FVbWpOdkpyWmJPRnYvakJlanliQVhad0V3aDhxTHM3U3VFQUN6TjNY?=
 =?utf-8?B?YW1wQ0FoYm1yOWxrOEk4cnJkeTVtejUyam5QMkxCdGxFcFVITXZzTmU1bXVa?=
 =?utf-8?B?Qm00MFJmamJrc081WWFKaFVNVjFUeU5xOTNEOVJQN095RzcxZWNubktjd0J1?=
 =?utf-8?B?WlQ3QXJMcHhmOW8rRGQ0clU1STc1S2d3TVkzaVJMNWI0blhrdldFN25QaUxR?=
 =?utf-8?B?RDBydjJ0L1FxMFpxcEZtVnFnOU01alNHRjBpc1A0NktodDZCcUd1Q2VFdzJE?=
 =?utf-8?B?YWpoeDkrbUpGYTJpeTVVN2JmMnczdjhneE5IUmRodTRaVXpQVG5MV1ptdFhu?=
 =?utf-8?B?ZHNPYmdSRnpKQ29lUmI3WlRRVkN1MUc0OHJSNjJzZVEwaStCdENvUVNJN2ZB?=
 =?utf-8?B?aTMrWG9MN3VHTGtrMFNqWURTalhXenhLa2dlRGx3R0l3ajdHUVB4N3k3eVJY?=
 =?utf-8?B?UmlQOTZqWEs2Nmc0c1hGcGtOUFJIcGhZSHN0SkRxZmpJc016d1ZkSUwyYzc4?=
 =?utf-8?B?MDQzSVI5VmhUNlV6amx4WDc5eGd2WjZEeFpsNkhFZFQzdEJ1ZHR4ak5ZaUM4?=
 =?utf-8?B?QUNqdUNJVUZtWVEvekFZbG8ySzRRVW90dEY2Tk55SEdwd0Q4NU52Y0tYYWow?=
 =?utf-8?B?bkd2OEZiZUNLRytVV2RMY2xXK3FjMHJJcTJTQVZMcFZkeEVrWjNZaGVsdkJK?=
 =?utf-8?B?SnM3ektDOExDZ0MvZGtlRnJqdVlRLzgyUHN4NGtGSjZzeXN0VEdqU0FXTlRa?=
 =?utf-8?B?OHhQR1FyYllYd1VSTGoxSGQ0MjYxenVoQWhRQk15UENZTUFmcFIranNRVVFI?=
 =?utf-8?B?ZFBTTTFXWnNRbTNKd0Uxa0VVNFczNG5KVWFGeFhseCtFNXhlMVZ6ZE1aVjk3?=
 =?utf-8?B?YUwwS2I1VUwwcXk5NmZVTllJQi9URlB2ZHVwOFgzVFdtaEhlQ04vVEZUU1E3?=
 =?utf-8?B?NDJOOGdxaHJmNnBzOUhXYjhYaW05elZnWjYrSTJyVDhkTFRSaFJXUTBxdFd3?=
 =?utf-8?B?OXJuV1dWU2hpTDJZa2lVeThtbkpKVWxjcUJ1WnUwd29reUxtY3ZYVTdvUDho?=
 =?utf-8?Q?wyNbl/pSZxfwSucQ1t+ou4c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm1Rd2pZaHlxbUd4WVFVRVIrM2NRbEJZemhKUTNpdFN1dWEraCtiQnpaUS9y?=
 =?utf-8?B?dGpQRlM1RHhybHdYWmJxR25zb0RWQmVGbHJjK0ZoQ3VtM0R5bS9ha0FWVno3?=
 =?utf-8?B?V2FvbU5vQnBaM1V3VU9kU0pGNlZsQ2JjNDJKbU41R3Y5cis3ek5TN0VEblVk?=
 =?utf-8?B?d3JsL1NPZVpsamlEV3I5ZndRVjIxRjdYd29GZC9xY0NWZllyL2hhTndHZ1ZH?=
 =?utf-8?B?bENvTFJ2bHZlbE93WVl2THB2U3lJbTVHVzczNWFaU1AvbTl2VWl1U2FjcXJC?=
 =?utf-8?B?UytEVGhsSG9JTncwaDUrd1VXOHNBRXNwZXYrYmlub1IvS29JREQ0K2lFZ3o5?=
 =?utf-8?B?SXBRVUpEOXNpeE8wN2RqT01NNlFnYysrdDlFK0dBY1ZhTytKaFNReDBFNkI5?=
 =?utf-8?B?R1o4S1NLbHI4RWdGTGhGUVdtWkhhUGpuQ3YxZmFlenZTWU1aZlZsRWxNa0dM?=
 =?utf-8?B?Tk05N3RmNTZtcVJyQzZDY2UxR25VU2wzV3NqUy85aWdJSWh1OXo1OGVDV2tr?=
 =?utf-8?B?bG1lNmpWNDJUQUpkcUJlRkVMdm8xdmk4ejB5VWRDL1c1N21mRnNaWFVkVk9B?=
 =?utf-8?B?S2VUalNuRy9lMFUyVUtXajhJZlBUSU1ScHVSSWdNSWhCajcxTHdtSlRoSERJ?=
 =?utf-8?B?ZnlQWXdoWExKeDQ1L3RlRnJUeDBlZ2xlbEk0a2xjVVZUVUQ4Rm9FaWY0VFdC?=
 =?utf-8?B?K1cvbXA1bWtNREdvVmhqUm1OQkVEQ1VZb3F6cnorUGJrcmtnMzMzMlFzSXVS?=
 =?utf-8?B?WkJwMlVYYUZTMzIrQWt5cVZ6bkk0Tm9Eb2Fjdy9qRS9HdWNJMGxHTzlpcVVL?=
 =?utf-8?B?UkJkY1BqNzBXUDRta3QzMmdQdjlzOTJ3aEVCbC9oaXI0ZGZsaTZubWJvNExR?=
 =?utf-8?B?R3hVWE9LL2ZiazRZL1loNmJBcUtRbWpYTGlFU0Vwc2hFZFdsZEVpOFF1dC93?=
 =?utf-8?B?ZDVKTzljV1Q4M05QUkVjWUtsczlwKytaVE12VjRHQ3FScjdsZDQyd2ZwdGJQ?=
 =?utf-8?B?S0habW9PVWtzR1d2YngzdytGZnIya1JjYXQ0VVNjUm9OTW1SNGNFSFJVTjgw?=
 =?utf-8?B?c1ZrSW9FL0xjSlNuQ29iTXN2blQ5RGdsVmhZbTRhcURNdVF6TzEyUDY1Nklt?=
 =?utf-8?B?d081U1ZwSzFhVThPVTV0ZVJ5SHFZQ3VldmdRRG00c0pPYkZyZnBFUjEyOUUv?=
 =?utf-8?B?dFRTdlI4TnJsQVYvREYxcWFBOEt5alJCYjhCcjJhTkpQN0p0YlZjTThhZmJI?=
 =?utf-8?B?ei9pM0NGWGE5SW41VjhZWXdPOGxIaElCM1J4SFRMSlhHMENZZ1Aya0NZRkRs?=
 =?utf-8?B?VHBuOVdqb2pOOFdRUk1XR1A1VnpDd2ZZWnhadUdBRHpXS2hIR05VWm9uVE90?=
 =?utf-8?B?OXB1UllKeHhiQ0JCdjFYZHdLTWZmRldTOEF1QVNVR2I4RklPMkJCUy9icFJy?=
 =?utf-8?B?R2VKT0ZWS2Z5a29tcVVoWWZOelEyS0VnWGJRZ2xEeVpoN0U1ZlhrZHVsSUFp?=
 =?utf-8?B?cWZoKzZ2MHJIUmMwajRWeGh0Tk1ZYXk3dVhuMG5FVStyWW5qSWo5Y2c5UlhH?=
 =?utf-8?B?ODQvVXNnVEs3dGdHWDJkWFpqRzZqaE9iY2hxaEVyRGR3YjlyNGNEdFNGYnB1?=
 =?utf-8?B?SFhUb1VwTWtldnB2eXZMcGxDb2lSSWw4allhcmxHYk5qUHJlcHkrb2k0QjdQ?=
 =?utf-8?B?K1I2THYvckthMVlMTXpsU2k1M1ZaVHkyVFBzdGZXbW0wUTAvanBPVE5MUzAy?=
 =?utf-8?B?ZHJoeUgwV2tEYksvdUJDbzZBTmtVSEp6MXBnQUwvQ05ndlVHenVZeXg5NjEv?=
 =?utf-8?B?cGdwcFYrNC9oMldDRlB5NjgzaUUwOWJPdldXc0hkRDVyYU0xL2k5QjcyNlNw?=
 =?utf-8?B?MEVvQzV5anFuWWp1cXJPa3hFMS9NNTY5NTlPWlhTcG5rYWdWSHJwZnp3dGpP?=
 =?utf-8?B?Qm9zMTR6bis5amJodFJibW42TEsyVDZSWGdLaStVOC9qaVVNcGxvMGZVcUU5?=
 =?utf-8?B?VzZQRGRqdDZ5S2FzUWl0dVFDTHJpTnM0WVN6VjQ1Tk1kU3hDampQdDNoQTFi?=
 =?utf-8?B?NEVWTUxVOUFBK1RXaHNrQkJLOWJQd08vN1YrdlNWNnVWTkNLdHpQSXRqOWRM?=
 =?utf-8?B?NFhkOHpUZmNOSE1xS21ua0VHSCtDWExLcWYvRXJvUFA1TnRxME5LUXp6NW01?=
 =?utf-8?B?WFJoWXlYT3JiOTIrUzJMMCtiWE83V2I0YzdQbzh2b3FkYUtnS215TzVrdy94?=
 =?utf-8?B?clVtRHJINHhhMjAvMDRPOGpVMWtQY2VkbTZlY0ljMzBDVStXa0svNFhjYjRl?=
 =?utf-8?Q?8KnbIxZTdzAXisITSr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cf183b-e856-4df6-306c-08de58d64a45
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 10:17:32.5059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLLzczFbLpreD5CLxL6/ihlVh9Zng00mzEVnvhpVudGw9BZSQl4Fn5k9dUYPvh/xF9IfE97MKTrzxY+kznPHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9663

DQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBhcm06IGZzbDogQWRk
IGkuTVg5M1cgRVZLIGJvYXJkDQo+IA0KPiBIaSBEYW5pZWwsDQo+IA0KPiBPbiAyMS8wMS8yMDI2
IDExOjUxLCBEYW5pZWwgQmFsdXRhIHdyb3RlOg0KPiA+IDxzbmlwPg0KPiA+DQo+ID4+Pj4+PiAr
ICAgICAgICAgICAgICAtIGZzbCxpbXg5M3ctZXZrICAgICAgICAgICAgIyBpLk1YOTNXIEVWSyBC
b2FyZA0KPiA+Pj4+PiBJcyA5M3cgMTF4MTEgb3IgMTR4MTQ/IGNhbiB5b3UgYWRkIHN1ZmZpeCB0
byBrZWVwIGFsaWduIGV4aXN0aW5nIG9uZS4NCj4gPj4+Pj4NCj4gPj4+PiBIaSBGcmFuaywNCj4g
Pj4+Pg0KPiA+Pj4+IElNWDkzVy1FVksgaXMgdGhlIG9mZmljaWFsIGJvYXJkIG5hbWUsIGl0IGJh
c2ljYWxseSByZXVzZSB0aGUNCj4gPj4+PiBpLk1YOTMNCj4gPj4+PiAxMXgxMSBFVksgYm9hcmQs
IGFzIGRlc2NyaWJlZCBpbiB0aGUgY292ZXIgbGV0dGVyIGFuZCBkdHMgcGF0Y2guIEkNCj4gPj4+
PiBwcmVmZXIgdG8gc3RpbGwgdXNlIHRoaXMgbmFtZSAoaW14OTN3LWV2aykgdG8ga2VlcCBhbGln
biB3aXRoIHRoZQ0KPiA+Pj4+IGJvYXJkDQo+ID4+PiBvZmZpY2lhbCBuYW1lLg0KPiA+Pj4gSXQn
cyBzZWNvbmQgY2FzZSwgcHJldmlvdXMgd2FzIGZyZG0sIHdpdGggdGhlIHNhbWUgYXJndW1lbnQu
IEkgZG9uJ3QNCj4gPj4+IGNhcmUgd2hhdCB5b3UgcHJlZmVyIGludGVybmFsbHkuIFlvdSBtdXN0
IGFsaWduIHRvIHVwc3RyZWFtIGFuZCBhbGwNCj4gPj4+IE5YUCBib2FyZHMgYXJlIGNhbGxlZCBz
b2MtZm9vLiBOb3Qgc29jZm9vLg0KPiA+PiBIaSBLcnp5c3p0b2YsDQo+ID4+DQo+ID4+IFRoZSBz
b2MgbmFtZSBpcyBpbXg5M3csIHRoZSBib2FyZCBpcyBiYXNpY2FsbHkgcmV1c2UgdGhlIGkuTVg5
MyAxMXgxMQ0KPiA+PiBFVkssIHNvIGRvIHlvdSBzdWdnZXN0IHdlIG5hbWUgaXQgZnNsLGlteDkz
dy0xMXgxMS1ldmsgb3IgZnNsLGlteDkzdy0NCj4gZXZrPw0KPiA+IEFzIHBlciBteSB1bmRlcnN0
YW5kaW5nIGZyb20gS3J6eXN6dG9mIGNvbW1lbnQgdGhpcyBzaG91bGQgYmUgIGZzbCxpbXg5My0N
Cj4gdy1ldmsuDQo+ID4gTGlrZSBzb2MtZm9vIG5vdCBzb2Nmb28uDQo+IElmIHRoZSBzb2MgaXMg
ImlteDkzdyIsIHRoZSBwaHlzaWNhbCBzaXplIC8gdmFyaWFudCBpcyAiMTF4MTEiIGFuZCB0aGUg
Ym9hcmQgaXMNCj4gImV2ayIsIHRoZW4gSSdkIGRlZmluZSBjb21wYXRpYmxlIGFzICJmc2wsaW14
OTN3LTExeDExLWV2ayIsICJmc2wsaW14OTN3IiwNCj4gImZzbCxpbXg5MyIuDQoNCkhpIEpvc3Vh
LA0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgImZzbCxpbXg5M3ctMTF4MTEtZXZrIiwgImZz
bCxpbXg5M3ciLCAiZnNsLGlteDkzIiANCmNvbXBhdGlibGUgc2VlbXMgbW9yZSByZWFzb25hYmxl
Lg0KDQpCZXN0IFJlZ2FyZHMNClNoZXJyeQ0K
