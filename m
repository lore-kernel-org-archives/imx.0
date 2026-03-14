Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2473285CB3
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773493316; cv=fail; b=IBtAqbZQXWpE0b3sSeT5ar34gPfCp9QcMm1eB/o7Gz+nwIaWnSJKVFLed9xVyDlZ0Gx37weBiVRiKnyhAKVMTpng50LfPVF0T7252eDygmJliT2+JduK8wLUsmC8e4sd7Wao0ya4InKbA+A9QRq/k59hrnLd3r7Ddci/1OEVNFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773493316; c=relaxed/simple;
	bh=f+qCiOB9s2f4woXJhDOzc8DdbjPzNsUK8BlQLhr3qgQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H1af6cYb1algswZtv+5Adr9HY7lfUSf7pQBJe3kgWNYvAWFOCEFes6ROc3Fz3r7n6TA32MCkkNJvN5zNvUt5GwExSYUm2kkSFaxBTryTkg1p+479vYqPqb9s/0T4dibbEG5UdJOb48511pBUCGLoAGB4WRTuDYIkT+ngAVdDgOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kjaqq/4w; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kjaqq/4w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3uD4oF9H5dSooaCcveCNOCs0Eo9K3beDx102fVc9K3AzNAFpT4U1LM7M01Ku1ceMtvATbozDnS5Wjsu1x3o1hlGIsyAmsNFPE/mR5szjCMbFJdGztN6m01L11opvgIZfSphjio5MLOCq5mOyw14oDu0hfFWjKlS6hPVbMvkx7hVmjPz5ROHR6T8ZYBtC75+7uLF2rkk6EtQ+Ir5wxqpUzUsjQvGm2JURsapClaMv9motBRbDvLFLa87+05sRSleAmA380JJ2nIychkJW40ZAqDM83XD8OTuLENPRgonpGMSWiK1RdIbszWZsVfQX+bvDHyWa1Fh0YCt/f7i6R3Etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+qCiOB9s2f4woXJhDOzc8DdbjPzNsUK8BlQLhr3qgQ=;
 b=b+rhQYSz1LLLgXEFMtRA3EXtVitPeQmqt8+wi4x0g2KzrPpsXGnb5EvKSeADGQ5GjtZORDkSM15FS/WC3PLTkvvuzCjeg1MzLloI/WLPyxhY+lGshYNpIT9Eg8j2OdZjsrDJBQSxodKkUv5IfAfL7H9g0E8XTGzZTPvBkkcBd3sUXMVlIrNDNpSV5VFJvI4LXTQBbN6rnFI/J032yT8Fjv2A0km2j9umSmx0+D4QAI1kQvFvXhjSIyEswa2YA9PcbvOGnt9Yo42HVxRi0SApdfsSvxTRa8ZwYiE3cnrZ1crTQqIeUyCzIciFMqO2o0KFyWJ4x8CKncB/9VtT2BuaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+qCiOB9s2f4woXJhDOzc8DdbjPzNsUK8BlQLhr3qgQ=;
 b=kjaqq/4wIGklFHbw8cLu+O84vrUzhm7UqMtaQknjeNYTesVwPm+/NkU/92JN06vAPqSZVITKY9TqNk8NGPyLrR+UpEiXtHSyFnzDuj14AmST4vh0ZLYtNNzu8WdTvbTHDCldp44yXCxM54RZcKi64CwesB5nIXOgKjBxUsLJ9VS0uo1vbkZddWEbWwI9/5C0qBOsCS8momH1sldmxo8Mp45OAHiWq4fRBfQJ38IH2P/28aifwQdDhMyg4dg+WSEihlYQ5+IGp16eBzyDvxNR6u5Zd/lBAwan2WWoJlZd43q6UrTFvF1VGrY+wgyHbYzi6BmhcJNdzNo6cYSe2u/ECA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7945.eurprd04.prod.outlook.com (2603:10a6:10:1f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 13:01:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 13:01:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Joy Zou <joy.zou@nxp.com>
Subject: RE: [PATCH 4/7] arm64: dts: imx943: Add thermal support
Thread-Topic: [PATCH 4/7] arm64: dts: imx943: Add thermal support
Thread-Index: AQHcs7FCkbIvP+831UuDJdH9pLRLn7Wt/g1Q
Date: Sat, 14 Mar 2026 13:01:46 +0000
Message-ID:
 <PAXPR04MB8459A45CCE5379D28B39A22C8842A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
 <20260314-imx943-dts-v1-v1-4-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-4-3ba9b426863b@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBBPR04MB7945:EE_
x-ms-office365-filtering-correlation-id: 37db6e88-c615-457f-00d8-08de81c9d92e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 FD/WF2OgnPqb8+GoHXqNNTHPryU6F5XXJY/Ie+Gd6WZxp7I92SCwY45t7FN/gykT4++6G7a9lm6yLelTzp+iXzJ9amISXc9u1h3M2zpUQMqJcIVDjDHT9Uma1i4g4P2eXgRwQGupClyoFrhamdjjCz+AmDPYsO+SO2TFzZ5iNwC8b9G7ihgFdmLCT5cwNXE/OmHsroCRtFjtOfcCOBtxxYECo0ADMC9x4PTO8dvXe+OfHRc3I+bsRdrAcWEvi8rZModgrZGOpmtQo5eTos4d2cAdpvG3pZhNLAiZxMJ/7df2rOZHT3VNhXlDyx513yRC8CO8I1BUSsBQF5Cu0qZi98RMGBbMCmNInmZJjkJJeaem0PRgLqQJT70TflsNJdWqXlA7Omn0+8PNfR6um14CfEeHYFy42n7RcRaXF0LFv5VPTvTzxSG2gnCGtpfS2oWticwd/ow+KfHATT8mWQxiw3OkKPUoCo0Ik/PYj1bnIGmVFZFIUKykKt2GbBcT174K91eByaSYQMIL4BeiAbJu2RkH/Msgk31Bwhme0o0jf6tmLygOMvRoDqkwgJ+05lN0ohBP0RhHv7xVoMwK7GvoH1rL5OB0alX4+89r2zKp9lEW3D3F7kwX0BRQ2+eYK3YsivzywhSKGZM+p1VML5hqfxg/Ruxn+BFABeVKwifJR/vZ0EKXO+PkyEnHsHXYRumOhbOQOYoOE2fLHAk9mvTJHvLvpw4FdnVCHYCF6U3eZYCBfW4x+6t6+wpVp4fD5BuwOFizYppQP135+PRbX4yOJW1uMrgK17DHpU3xJn4aOEY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDltN1JRMmdCN1VPN0U5ZkZQK1ZLVUxTN1Q0anNuNkdQODBwUU1wZnFoSHlW?=
 =?utf-8?B?TWFTUkNLWS82S0NlZHd0REFBeEE4VEkwNWJDY0diMTJTOUczVFRwdkxsclhU?=
 =?utf-8?B?eklNSHBUYmY4T3E5ZWsyendRQ01nM0FpZnV4Q1h6eEcrYWt5bklPQjl6ZzJI?=
 =?utf-8?B?YmYyWTd4LzVFa0NFbk5paWw2OHR6dVgzN0ZWR1VoVjY0cTZPZnNtSWd1eDZr?=
 =?utf-8?B?R0t1L0tlcXJTR2xYaHNHMG8vdzlCVnh2eVI0V2RmS1ZqYmVRQ0xaVlRPbkxl?=
 =?utf-8?B?TGxPNkFwWE45TTZEbG9hb3MyZS90ZHVQdjZZSGYxSEJpRGRWSFZ2aE14bFc2?=
 =?utf-8?B?TXFWOFZpUHI0N01QVWdKNHh6ZkZIYWZaRjFjS2VNS25lZFc4VWNnOVJZNXlO?=
 =?utf-8?B?SURlWmNZZVBCRlNRd3BzNEJNb0d2N2FqTldJbll0cTFmQTg2NzJjejBlUTkv?=
 =?utf-8?B?WWRYUjcwNlB5UkpXd2JFQVozMFYzS0xJZFdJUHF3cWZRRzNDcEUzVHBSSXBF?=
 =?utf-8?B?UVpBeUs1b0NHZndsRFlDdk5tTXIvTExGWU42YWhNM0RvNGkrY1Iwa2JUT0JG?=
 =?utf-8?B?dVVLRjQzeHJRWElLbFFjaitnR1EvanNHNnZkVWtWSks0VDM4WjFWS3FGVWZy?=
 =?utf-8?B?eHVQNkVHcThxOXdEeE41M1R2WEhJRWlpbmpwQXhYU0pRaHBNUHpKWGN3cFVS?=
 =?utf-8?B?cEFpZHRUMGFKVGVnSW1oblFSV1ZMYlNYbXA5dHJ5ZzNhb0x5QTJWQWRHTzk0?=
 =?utf-8?B?MXM1ZnIwcmljY2crV1JubVorRE80VXZMT0lEL0svdE9wRUhzWnJGUkdVZzhN?=
 =?utf-8?B?NGw0UWxxT2lmMnZaV1F1dzkxRzNDc2l3WjNIaVNPRlBiM04zV3ZPOUUvTUh4?=
 =?utf-8?B?Q1huaXpzMk5mRC9vaURqYW9NNGN0d0dLanpVRHcvc1ZpSEJKYjBkL2FTanh4?=
 =?utf-8?B?TnpXMmkvU1haeFNKczdhTVN4MHZaQ1Zsamo2cS9PaFk4OGlhQ2FQdE9TamFK?=
 =?utf-8?B?U1ltRWFhL1lsVCtTN0NyQzFWWDljRVo3bHlIcUVEZkQ3WW5zUEVpc1VaYnNn?=
 =?utf-8?B?TERGaTJJUjFQK3VPQkg1U3J2Y0p3dVFteWV1Ny9oK3ZYVCtlaG5qTy93ZUNs?=
 =?utf-8?B?QlA0YUN5bmJ0L0xTbU85SnlLUVkrK0d0NmI2Wi9jZDBLV08zZVpHN2ZEUTJK?=
 =?utf-8?B?dDh1TE5VZmk3L2tSaFV5SVEzbkw2SVlUNmgrMUFjRklKeUtrNnpEQ2lhRWlj?=
 =?utf-8?B?b2pmdWtwajluL202RjBvbDlsN2lCdFdSc3NTNEFDZ2szeGJ2UC9WY25POUpx?=
 =?utf-8?B?NFQwRkxaWDloUlk1cStYTGRrQWg1M1hXM2g4T1FmOEg5SFd0YnQxMHFIRERu?=
 =?utf-8?B?a0gvekN2UXRtMnR2b1JQakcvOWJqSzJOVEtKWWgzUXBaQkdPSTlkTTZWWFh6?=
 =?utf-8?B?K0s5enhBZTVoWEliaTNPVlVwV0cxQkhvRXB3dHFTNStzVW9PWUJXYUVEdzk0?=
 =?utf-8?B?SmVEZG9MUDMxNFdiU2dwdllpMkhKblFSVHhQYi9ZWWR2VG1QTlE5c3VZK2gr?=
 =?utf-8?B?eHRkQW4xa3dVbGlqTUd4bWpxeDh2NzE5WURaek1NeENrNU1EZ3oyWlRrNWNK?=
 =?utf-8?B?UHU1M3IyeDN4eEExeTk5RFlaTVpFMG94UVNESm1tUnNLcXBJU3BYOFJkQ1Q0?=
 =?utf-8?B?eTVYb2ZYNllTQlZxclZ5MDVVQmdJUTVseGRubFQ3czZCd3VHYVJLTWNyYU4r?=
 =?utf-8?B?dDVqSzlNem5wMzY2ellsVTEwZ01QN1RpS1ViSzgwOWYwRDUzTTdHYS9JNUR6?=
 =?utf-8?B?RGNQb29Jcy91NGdsd3BOazFDQ2VXd0xKTklnRGtPN1JZeEs0TUx3cGxoeFhQ?=
 =?utf-8?B?NXZyYnNBUGtYc0loZzN5T1dCWWpjZUtJeTV2azhsVkNFMklBVjh6RERydTJ6?=
 =?utf-8?B?Wk9Zd0ZwZ0o5UWVZYmZESm5RbjFuWGViNmRkZTBPaHNHZVlLNFdyVzZLYnZW?=
 =?utf-8?B?UGt5dWhCNXdCT2pneWxVWlhxT0JFTnlqK0RuWjF2aXNlekNKQ3c0NXhRMHJk?=
 =?utf-8?B?OFlkT1R5U2hGMEI0b3dGRFdpZU4xQjlmTk5JV1hSMUFWc3ZhZDVmQ1EwN3d0?=
 =?utf-8?B?Q0pFdnlkRFBTRXc5czBZcjA0YUIyUDl3Uy9uTTUyUDlnbWFIallyT0FIa0Vh?=
 =?utf-8?B?T1JDUjM1N1U4NG9XMjNhK0pweWcrckFpaTZkb1praEhVZVltSEh4ZGFiWDNy?=
 =?utf-8?B?RE9DVkZYWHozQlRqRVVLaUpEZENVeXNDTXF5RkM4UEE5amE1NUlKUzZ3OUdJ?=
 =?utf-8?Q?EDEbV1VQEX8cPJR/YT?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37db6e88-c615-457f-00d8-08de81c9d92e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 13:01:46.4677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsqmifIROmuC25wMpcydw0SCHCYEeSf/CRfIjYaGW3vKOx+1zRL6WunOYFpTCFmfASWVGbHG5jOc9w3nJww0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7945

PiBTdWJqZWN0OiBbUEFUQ0ggNC83XSBhcm02NDogZHRzOiBpbXg5NDM6IEFkZCB0aGVybWFsIHN1
cHBvcnQNCj4gDQo+IEZyb206IEpveSBab3UgPGpveS56b3VAbnhwLmNvbT4NCj4gDQo+ICsNCj4g
KwkJYW5hIHsNCg0KT25lIGNoYW5nZSB3YXMgbWlzc2VkLiBJIHNob3VsZCB1c2UgYW5hLXRoZXJt
YWwuIFdpbGwgdXBkYXRlIGluIHYyIGxhdGVyLg0KDQpSZWdhcmRzDQpQZW5nDQoNCj4gKwkJCXBv
bGxpbmctZGVsYXktcGFzc2l2ZSA9IDwyNTA+Ow0KPiArCQkJcG9sbGluZy1kZWxheSA9IDwyMDAw
PjsNCj4gKwkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmc2NtaV9zZW5zb3IgMD47DQo+ICsJCQl0cmlw
cyB7DQo+ICsJCQkJYW5hX2FsZXJ0OiB0cmlwMCB7DQo+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEw
NTAwMD47DQo+ICsJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47DQo+ICsJCQkJCXR5cGUgPSAicGFz
c2l2ZSI7DQo+ICsJCQkJfTsNCj4gKw0KPiArCQkJCWFuYV9jcml0MDogdHJpcDEgew0KPiArCQkJ
CQl0ZW1wZXJhdHVyZSA9IDwxMjUwMDA+Ow0KPiArCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Ow0K
PiArCQkJCQl0eXBlID0gImNyaXRpY2FsIjsNCj4gKwkJCQl9Ow0KPiArCQkJfTsNCj4gKw0KPiAr
CQkJY29vbGluZy1tYXBzIHsNCj4gKwkJCQltYXAwIHsNCj4gKwkJCQkJdHJpcCA9IDwmYW5hX2Fs
ZXJ0PjsNCj4gKwkJCQkJY29vbGluZy1kZXZpY2UgPQ0KPiArCQkJCQkJPCZjcHUwDQo+IFRIRVJN
QUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sDQo+ICsJCQkJCQk8JmNwdTENCj4gVEhFUk1B
TF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwNCj4gKwkJCQkJCTwmY3B1Mg0KPiBUSEVSTUFM
X05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LA0KPiArCQkJCQkJPCZjcHUzDQo+IFRIRVJNQUxf
Tk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47DQo+ICsJCQkJfTsNCj4gKwkJCX07DQo+ICsJCX07
DQo+ICsJfTsNCj4gIH07DQo+IA0KPiAtLQ0KPiAyLjM3LjENCg0K
