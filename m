Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EFE390999
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425258; cv=fail; b=kkLLtF/w2X9zFEbLMHXJ0Kyu4MolUKlocaoDLDw16U3jVQLfqXdJjV8AYLEBGBrX7PifemseZsg4HiwZrB4D80lzfzvdZOquNCSKG9A01k12J2ZrkPfs6lKoeOu7wTyBXT9vya+//x3WTbpQqvgbAMizdXcSPxrycGFMsoldxK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425258; c=relaxed/simple;
	bh=CcyacaPiO10mLnwNJ++Lu8NAmdBLKNb1YTYUVEehYnw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gO8Ee3B9+H+hqFHkM73wLHifJ7OIxQqjZRXxPxLNtHNtQAFnnAQ1BHBRlCuJFS+m73atF5n39mBnJlc/7bgw+4kmvyk3vgCvM0WTTbTz038eit0X25opc9qMNh0ccNwaVBA26YEfzpcWsFeSKy6GjByJ8SbHH9VugBELAiOPqdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZV7Z5N1F; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZV7Z5N1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9jVKS9uCY6HXEuB3DjyIs0Il6oOD1qHrK9/RXuA7PZdwC3W06VCtkb+nu/LvmsBmeZ3BPPnbLpnCY3NVFvb6/CdJvWPE1k5SqdC6g8MJ0RmyfsMp2SQJSUAhf/6rytPlbIcxNn+cPMqkQ1EBa8R6fasGoQMrqcbw4G1E+yBcC8SPFsAHLE/932kGsN3Pg+1v3w7y9Qf71Gl/7WSDu7WLcwOa5LVlN8SdwVSdgnhFPPnVcMEtnwflpfZtm2rcWC8477VHNs4xEcSPJbtfThj7YU2yL/nDd0groMhrN18C0fpjx/L2MnQvMWhON7zCP4yf+ym5hypfsKsHDc+Jfkh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcyacaPiO10mLnwNJ++Lu8NAmdBLKNb1YTYUVEehYnw=;
 b=Fae+vd14yCBYI9hRwB1+Zo6utDUOY4Jg6NMjeH+ELI946kyOxfZrUbBO46g+LQCo44IoW7OSF/86NNTYbPWsYxGNr2s49CR/j4vpliAgW1sqcFl8ldBAMSUNMVMNJWOsvTZlgzAQA8cz6z1Ro2udO9NkREVyyD/7H1P1QsMFp3Q7siPtKXI+/ijWEKvJlfRozkhxiQx4tvLQjVHHuSh9Emk3wrFY1hFebjGBhLotMCd4+dAomCH/3PQ4d8xslfXSlSrICnwMPrm32HNvFswAd/mfQWAqs9JFirrOVUcjRhz9JCi+AcfaNbm78D88Z64hbHgFursyDGzaG0zDfESuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcyacaPiO10mLnwNJ++Lu8NAmdBLKNb1YTYUVEehYnw=;
 b=ZV7Z5N1FDWx/h6BiOHvaPHTovpVPRZhHx8GtWHC+k35CwQdlKsYAMo1zEigEYyg5rp1bAbeJIaNCA/EKMZikdwhD62uA9s7cW7I5ezo99dXbQz97IFU1qcUXB6/0YieHWf8j8wNyV08+6mkRZYSpLocVssWAwD8VrIfxNgrACb15S/Y3q9rRjPI0jCUNag+YuHALn8+AqrkiBpgpt4O9elJsVtmUnYkYV+fFlbdRjXGVS74kd6ErqphVXQtoHINTdxwX7r9JTY1g4I95DKTUbn/1WCvlBlDjk5bBVHWU6pk66Yqkz+NkG3AbslwSt3gpF1xJdfmlov6M3O+xLgYOqg==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11745.eurprd04.prod.outlook.com (2603:10a6:800:2e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 07:54:07 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 07:54:07 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Topic: Re: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Thread-Index: AQHcvCyOQhsHmUAvBkacXOXPducp+A==
Date: Wed, 25 Mar 2026 07:54:07 +0000
Message-ID:
 <AM9PR04MB83531E00C21A5A2314A38F9AE349A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260310063522.362545-1-chancel.liu@nxp.com>
 <20260311-brave-acoustic-mongrel-b3978d@quoll>
In-Reply-To: <20260311-brave-acoustic-mongrel-b3978d@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|VI0PR04MB11745:EE_
x-ms-office365-filtering-correlation-id: b8a34053-f6cc-4a41-63fc-08de8a43b14d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Zkz7Bi5yJMH2MH3jsVKS+/uHlJ/V0DagFqr0mz7U/10TBc4hBsD+62BLJUIAKheAOuSQhpw/1aploZFlOuDNoqA8hshsCC9N4udii4Aa7PcSF2Qt1+xAPjajMeKHNVQKEl04kiZMrihrNGaGk/ZR4qxdQMiSRK1ox0zU+gUgOgrksSTugDNj7Kid2gNiZKhkMR5+yCC3jJ4nz44hVp3rqYtRjdENVglAmG/y4tP7Vy6QznllwGB+7r31vzzs2vHAwG6228fFnWt7KURInPu0wm9VMU0R5CsjtdMl1DP01S1zDeRUC1zXizLl41AAIBcm61wKOzrn+9Q0vHsUdyUp6zewDMiQ9FcGf7s2q8cjJ+fEjxhBA5fp1PfByiF2UM560lgLcjYOvnBbvRD9y2sytNrlgCetdZgiwGmXXN0lBY8ocjynWvwUE43gJGjbVXiAdjFa7dJCH7zq3AepuSo13OM4G8ZQTwDGswBWqno0f7K6UtNDuQqdwsEx+1WhypQQuhf7yJErLhxioCkCAu5G87AWVbIuXVDfRpncAxR8CnVuL4Q/AxxoX2eC9+vptPF6dy7DVE0zCalh29KuKGTN1j5L/MA+rf+Ljnau/BFnGbuOsWU7WlLEtZxpa5nDcoD8EIVdTd+WTHxrnl3pAKNgFmNB7YMsbc69Wso2oBWcYlBP36h3Lym3L0qpdVsNwDi8xHl280rfdid2dkW9BIsmfwn3K4+V61RhbLI9vBzu9sPUmFgsSYx/p4Wqt1uVdlB6Bgm+wgbLsJSqrOqoclOSchTYO5hp3RT7hxRX+M5K7kI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2U2MkluM0NpanRMN2diRi9nd1FHWFFFVVAwKzZJSzZPaE53SnUxbWRTNS9U?=
 =?utf-8?B?ZGU4clRydDZ3N2poOXQ1QWgwRXNSbWFqWCtOaWQzcXRzeUpQbkFKOEUxR2Fm?=
 =?utf-8?B?NnVqcVpTZVRKTmZ4azQ5T3QrR3BnZ3c0Yzk2VnQrek5iN1FHeGhnUmRPS1M0?=
 =?utf-8?B?YnRyWWE1Uk1rNHBGaVRMOHR6ZURKVWRDWTg1TVIyN3poOThVOE9IUVdDbDdJ?=
 =?utf-8?B?ekFyMXpFQ2V4dFMwbzFiNmJmR3A0WExkbjlwWWFZVW5XT1pvZ1hNeUtvZ0t3?=
 =?utf-8?B?Q0JVMGVqMHB0bmtLeDBjL2poZDMzRHVhb1AzdXNKU2N6Rm81c1N5eWVQTWFm?=
 =?utf-8?B?MlJTVVJJLy8zMEU4elRHS3NvV1pYT3hTQVdraDdMS0JueDJXbWZWcTBpVmJi?=
 =?utf-8?B?Q05kU1U3bVZlTml0dUlHUjFySUU5Y1U5dXZFNUlFalYvcElmSlJPZ1lyY09l?=
 =?utf-8?B?Vy9TQWlNZVNkakN5eWc4TVhxL3Arc214b3dDTElFUE14THIvSjdlTk9sVWVP?=
 =?utf-8?B?NEM3SXgvRFJjZzJGdjN6cVIxRjViRUx4ajJuaHFoQjk1bzVjcU9RRzVoaU5o?=
 =?utf-8?B?ZkFuRXNLKzFCSUJyNU80QmMvY3dNUjZ0ajNJcVBSMDNWc1N3NkIvdkU1TDg5?=
 =?utf-8?B?Zk9SV1BUNXFweElMZi9KRVpZR1l2cW9OcEtPbEkxUEJOOFNTTW1WSkhqY1Qw?=
 =?utf-8?B?K21xNkJUSmVweHBLUjlOK2JyLzBxendSTUJocDJpQXBqQUkzZkJvcjh1a05r?=
 =?utf-8?B?Qkgrb0JEMFpJWkZKNWF5SDhPckVZci9yaEVKWlEzL0dINm52RGo5VE94ZGd6?=
 =?utf-8?B?L21UMDJmeUs0RWUvTWdvRHNuSCs3U3RyUWpSZUEybkY2VmtBNVF3dVV0QjFG?=
 =?utf-8?B?QmNLYllPK2JQS25pUjdpOEFSL0JCNGpjcllLYVZmaUJuSkVxalhQM2p0OXBH?=
 =?utf-8?B?Q0QyZ1MvOG1vdVBmUXlZeVptTkhxL2pTZm8xa3p0YXBlUUNLY2Zab01QSnkv?=
 =?utf-8?B?VU02NG1vZGppdGJhdU56TkJTaWdVZEZ5ZEU0dGMvN202Q0dUeDlyTW1PTzBq?=
 =?utf-8?B?OFlPbllBRXJncWpKY0VzSm9NZnIyTGdRbG92Qm9jK3BuZ2hML0t1emlIV3k0?=
 =?utf-8?B?d1JUSmo2YWh6ZDRheFArSUFkWEhUSlN5cWlPRE95cHdqejlKNSs2Zm10K2pI?=
 =?utf-8?B?Uk1PQWM0bWpFMmwyaWk5UU9od05ta1E1NVhXdTkzVGkvcVA1emxUVzFrRXRi?=
 =?utf-8?B?NFZMTmZEaFN1N0MvMG93ampHUXM2ZEs3NTArVWp0U2pRSVAyVFpUb0JNK0RX?=
 =?utf-8?B?WHQ0V09XQUlFdyt4TklOVFJKQlMzSW5MM2ViaHlHc2ZMOFRpWDhUZm40VHhY?=
 =?utf-8?B?My9HcjhoWEpjNFFqR2REc3FGeElsTkhTRkJOZXVnaW9zbTNNM1IzMEcyZ0dO?=
 =?utf-8?B?WU15ZkpBL25LbUhTaC8vc1VqZGhmVDNxQzFHckgraEdPaE54eVZvQkx2bHdY?=
 =?utf-8?B?U2JvUE9WQTdQNXJOaEpFdUFHU1NVaTNNSFArV3M5N0xLQ0JFSDJpMHdIV1B6?=
 =?utf-8?B?cUhKQXF0c0hCd1lnWFc4RjNJWEtya1lqcUVxYkZVWTRjdDVpZzAxREo5djlB?=
 =?utf-8?B?MGNqKzlydWh3eTNQQ0lJUXN6YlZzVXhMNDFjTW5vYWNzZzIxbDJqcC9NTDlD?=
 =?utf-8?B?empNZzlsYXhJeCt2cytucGk1Tit4OUdJVFZKWE5jd3lhL3NsV1RuNkJhTTJ6?=
 =?utf-8?B?SDAraXB2OXQ0SEdJVXo2YzlYQVBtZWFHN1krM3JjdCtvbjZwcXZFTWlyRUE3?=
 =?utf-8?B?Wit5WWpwbkNnamhRSGkzcXg3ZjlKVldBYjFSZzJiT1pqQlp5Ty83U0huY2tI?=
 =?utf-8?B?R2ZnaVFrZldGL29PRkRKUmxjak9TSUI0K05PMkVCb01BblJnanZkQkx3WGp5?=
 =?utf-8?B?ekF3N3VLamlnSWZ6M0pKZTlFbE85OEU3Zm1Ba01RdzJncW5KM3N0ZXNXdHl0?=
 =?utf-8?B?bHhuc1RQTXBzYXR1Zjd0aU8wRTNTdmZXZ3AzVUtsd2I4SWFuR3VlcnZ6WFZX?=
 =?utf-8?B?UlgwQTdsak15VHlYZ1NZcVBSaENmZHNNRmZOKzVRZGkzc1IycHlseFIyQ05S?=
 =?utf-8?B?WHI5MFc1UHhwRDk1dWc4cmV2ZVprcTFKUWlJZWRBUE9PVU1UQWF5YWRmaG9U?=
 =?utf-8?B?aDJGZmxBdFpLM2ZBbXZVN0VTRzVZd0dDcFk2K1VRdGdPV3dIQ1lQdXd0c1I1?=
 =?utf-8?B?QUs3emZLbjQ5bDAwMjV6Tm9XMWpDTTBPYnRXWXduYzlnSHNhN2tOVzFqZGxL?=
 =?utf-8?Q?pN7XQtZFofEu2TJhdn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a34053-f6cc-4a41-63fc-08de8a43b14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 07:54:07.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1en3g/xTeV1BHNzthh4tVNkrtSggGKlubHvP03Pj0o8AbiM9QslT1R+0KV0PXvg6BkkSBXSZS9w32z1LPleDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11745

PiA+IFRoZSBpbXgtY2FyZCBtYWNoaW5lIGRyaXZlciBvcmlnaW5hbGx5IHN1cHBvcnRlZCBvbmx5
IGNvZGVjcyBvcGVyYXRpbmcNCj4gPiBpbiBpMnMgb3IgZHNwX2IgZm9ybWF0cy4gVGhpcyBtYWNo
aW5lIGRyaXZlciBjYW4gc3VwcG9ydCBDUzQyNDQ4IGNvZGVjDQo+ID4gYW5kIHRoaXMgY29kZWMg
dHlwaWNhbGx5IHVzZXMgZHNwX2EgZm9yIGl0cyBURE0gaW50ZXJmYWNlLiBUaGVyZWZvcmUsDQo+
IA0KPiBBbmQgd2hhdCBhYm91dCBvdGhlciBmb3JtYXRzLCB3aGljaCB3YXMgYXNrZWQgbGFzdCB0
aW1lPw0KPiANCg0KVGhlIGlteC1jYXJkIG1hY2hpbmUgZHJpdmVyIGN1cnJlbnRseSBpbXBsZW1l
bnRzIHN1cHBvcnQgb25seSBmb3INCmNvZGVjcyB3aXRoIGkycyBhbmQgZHNwX2IgZm9ybWF0LiBU
aGUgbmV3bHkgYWRkZWQgQ1M0MjQ0OCBjb2RlYw0KcmVxdWlyZXMgZHNwX2EgYW5kIHRoYXQgaXMg
d2h5IHRoaXMgcGF0Y2ggYWRkcyBkc3BfYSBvbmx5LiBObyBvdGhlcg0KZm9ybWF0cyBhcmUgdXNl
ZCBvciBzdXBwb3J0ZWQgYnkgdGhlIGV4aXN0aW5nIGhhcmR3YXJlIGNvdmVyZWQgYnkgdGhpcw0K
YmluZGluZywgc28gdGhleSBhcmUgbm90IGluY2x1ZGVkLg0KDQo+ID4gZHNwX2EgZm9ybWF0IHN1
cHBvcnQgaXMgcmVxdWlyZWQgZm9yIGRlc2NyaWJpbmcgc3VjaCBzb3VuZCBjYXJkcyBpbiBEVC4N
Cj4gPg0KPiA+IFVwZGF0ZSBEVCBiaW5kaW5ncyB0byBpbmNsdWRlICJkc3BfYSIgaW4gdGhlIGxp
c3Qgb2Ygc3VwcG9ydGVkIERBSQ0KPiA+IGZvcm1hdHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGFuY2VsIExpdSA8Y2hhbmNlbC5saXVAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2lteC1hdWRpby1jYXJkLnlhbWwgfCAx
ICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBXaGVyZSBpcyBj
aGFuZ2Vsb2c/DQo+IA0KDQpTb3JyeSBmb3IgdGhpcyBvdmVyc2lnaHQuDQpJIHdpbGwgYWRkIHYy
IGNoYW5nZSBsb2coYXMgd2VsbCBhcyBmb3IgdjMgYW5kIGZ1dHVyZSB2ZXJzaW9ucykNCmZvciBl
eGFtcGxlOg0KY2hhbmdlcyBpbiB2MjoNCi0gVXBkYXRlZCBjb21taXQgbWVzc2FnZSB0byBleHBs
YWluIGN1cnJlbnQgc3VwcG9ydCBmb3IgaTJzIGFuZCBkc3BfYg0KZm9ybWF0cyBhbmQgbmV3IHN1
cHBvcnQgZm9yIGRzcF9hLiBObyBjb2RlIGNoYW5nZXMuDQoNCj4gV2hlcmUgaXMgYW55IGV4cGxh
bmF0aW9uIGhvdyB5b3UgaGFuZGxlZCBvciBub3QgaGFuZGxlZCBwcmV2aW91cyByZXZpZXc/DQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpNeSBpbnRlbnRpb24gaW4gdjIgd2Fz
IHRvIGRpcmVjdGx5IGZpeCB0aGUgaXNzdWVzIHJhaXNlZCBieSB5b3UgYW5kDQpvdGhlciByZXZp
ZXdlcnMgYW5kIG1haW50YWluZXJzLCBidXQgSSBtaXN0YWtlbmx5IGFzc3VtZWQgdGhhdCBhcHBs
eWluZw0KdGhlIGNoYW5nZXMgaW4gdGhlIG5ldyB2ZXJzaW9uIHdhcyBzdWZmaWNpZW50LiBJIHVu
ZGVyc3RhbmQgbm93IHRoYXQgaXQNCmlzIHJlcXVpcmVkIHRvIGV4cGxpY2l0bHkgZGVzY3JpYmUg
aG93IGVhY2ggcmV2aWV3IGNvbW1lbnQgd2FzIGhhbmRsZWQsDQpldmVuIGlmIHRoZSBjaGFuZ2Vz
IGFyZSBhbHJlYWR5IGluY2x1ZGVkIGluIHRoZSB1cGRhdGVkIHBhdGNoLiBJIHdpbGwNCmFkZCBh
IGNsZWFyIGNoYW5nZWxvZyBhbmQgZGV0YWlsZWQgZXhwbGFuYXRpb24gaW4gdjMuDQoNClJlZ2Fy
ZHMsIA0KQ2hhbmNlbCBMaXUNCg0K
