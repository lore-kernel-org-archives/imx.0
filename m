Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021134.outbound.protection.outlook.com [40.107.130.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C01236AB50
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045197; cv=fail; b=kxXqP+AemqKQUBDc5kP2fQu3MkyDSi/oGwUobcBSxGwaMp6orDd5WtBLqY+a9riA0bS4Iq2iFPRZwrcMsV4bsr6KaFTlfFZzahXdfwYbI4ofq1FCZDxUSLH0bcif061A9nQ5wJI9vPdOB2Ucd71vVKIp33GdgrjFGhluKz49Ahk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045197; c=relaxed/simple;
	bh=ZGYjupyRw1XvVLoTqpWpKMuttQOc321AZGuoF5gHCMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lvKZCjI/37SPIfzZ6Z7wRcUcwqsq/sQQw9G5lYInkVdRObrGzKMtLOJ8bBK0N7IWj0yezJzwoEyfQMGTuNA+CQHAiil5lFJjdQdCPfgmZn2ruqRjK7MFqCuX8cW+48PXGxUcrFhi6snNQ6fMHrypV584OuigGU1mW/1lWFYjelo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=ScAI4O0A; arc=fail smtp.client-ip=40.107.130.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="ScAI4O0A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+kBov7KZ7p811A1UHehluQ6Z+7XfjmIr3x5eJH9c0LcKB8MHio4FyfUG2bsUdzkSiuixZFG7iqQu0qvVSMo+uHlUvbZJbQPQRdzbKgkFsW3ksPs5K9WPAFLTRuJXqRieXTj8ty0xtbj87AynC7fsQ/Vk9hlyq/AQm69cMxvpjNoiwZ5QJ5rohzGYzxYCFOmUGkT0oDpNxjgpDQ3mWa6C6Vav3oazJatYInbhLtC8eIqA1L8DKScRgf8F2t0T4XmOiQfI48/PN0g7d53s8RaSyWX/LIypThw+3Ug47lxzrjJOB+ziL4D6tJGlL9H/zntfzn+PyjDgE78oHxuAcygbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGYjupyRw1XvVLoTqpWpKMuttQOc321AZGuoF5gHCMc=;
 b=rLrKMEuAuB0xCIVtRzCbo3e6gblfP7XJ/OIaxnoSJ17tp9w6gF2etADopCyn5hOd0UAFd0o/UGnjZgVsKJxPhr2ELGKUbPNRIg9A94AVhFbBiifX4tDdYeBrmjzOZWIjswjBe4yoM3RyqU4TOLTuOEXbfYOzyd9xfvnX2ARRbNPYkEYNUdXfQfb6Ht0J5fzFFJo5OdZNe/JN6x2rQnTm2AK5A/hDjZbDsYPNFp5PNnsGhFV4J9rQi9IKWvot/o7yiuxrvf43oLuzJeC9TfIpV4Gq202AQecfU7cJsi/SWSonYQ/fssrqnyip3lsaH9QU3wDSMi1Dv609S9uJFlAOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGYjupyRw1XvVLoTqpWpKMuttQOc321AZGuoF5gHCMc=;
 b=ScAI4O0ARhJwhshVlT6Auq7vQJsZdFAjdhixhVhtpSoax8eLWyr6Dm5hRkcUQYMzrZ0TQNRqyYK+PFEL+jRoMCEqMPDnckCxQWECwbiFmm7gf2c4u781v+DlGngOleaOriMFaMSCQLhN9wCbJ4optSoy+TSVw9kTFmw9JBn5KaA54cRsUabAT205czotHWteHkgAu32l5IVVOZiICtLi4l/vrrkNAr7/H4CtfjBK/9o6mqZKBVdhQ/pIs6m2cKwpitP5FJYAj561bjca/WVD6RgeCbSjg+QqE7JuKrG0qHOUAGTJnYugTEnImA/abCTGRqh5+O9y0Zm2sg/6IBFlPA==
Received: from GV1P195MB2476.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1a0::7)
 by PA1P195MB2536.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:467::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 12:06:29 +0000
Received: from GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b46:2d4d:cf51:47d8]) by GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b46:2d4d:cf51:47d8%6]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 12:06:29 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Paul Kocialkowski <paulk@sys-base.io>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Thread-Topic: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Thread-Index: AQHcwJXfsp4GMeiLfkGFaPSnas1AJrXKHsQA
Date: Wed, 1 Apr 2026 12:06:29 +0000
Message-ID: <573e4ebd9679517086a6b4acb162d72463429f35.camel@phytec.de>
References: <20260330223712.2615273-1-paulk@sys-base.io>
In-Reply-To: <20260330223712.2615273-1-paulk@sys-base.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P195MB2476:EE_|PA1P195MB2536:EE_
x-ms-office365-filtering-correlation-id: 348d571f-6e65-4208-c6a3-08de8fe71b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 +NfxZLU4L4vcz40VhQ8STHKMl7NdyDi6t397Tqr8Q82kTEnO81vNIKMm3DVXu6JJhQdMu4slM2bqdYvnFkRFroGxCY8q5pAbpqFXjzec3mcJzM06o7d37fbLdTbOzcAh0VD54XgnQZnEUSLLDF50Nc9Qsv3RzIGeqPLEGhjMXO2pwNmbO7oUnnIXQ0H6uu4HwaOGjaaS0J3JDJ9gl1Ys2pL6skqXw+M63kWjH1Iu/EBeQlSrlbayM5YBLwuEpSVbxv2AEv0VnpZv6x5JLce/QTAfx8JOMY3fFATAVcQyq7eLC0uvso2Hb9cPBqgRNJyUKYSiY2ZReBVqHJwkhQubi9og4Jhh0hXwVGfh8MH1FjJm3wxtC3DW73ueiMhOD6ZmFn75diidsLWs5MezkIJHUO2xEvfJB076p2VJ4lobIw2oMbhAAtIChid713gVxWFEqqjexRkeH18VWCPH98QPB9DY9zeg6gS7EbhMVpe/6OQOozKFU5vbTQoNLAHeCOF9FWyBHZrOVSYXfbihVAsS1ch09gxKr8NtOM3PovXNZtJrky1/U1Ss2+oHsxW5YVxhw7wh1ScPXwXQJWNugLGbQKtq8jUUobKNxtwNAyzj9OkjnBhy3Q1KjCWHH5mzLF/UNCwNxigODnr0t5DPGfEITryzeXT9Qcvc5dRmbMOb1sDvqeUbdgOsGO4AqX7qmE9v+oJ1IrBMSCsEWEiPhXF9oXP19jIbfZBPnD9pguX7H3SaAH9sXuYuUmkg5W7d8WCuJcsoAHvk3NnxV8oRHfRQ5y1FmqQE5Btoc4BLnqIEA4U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P195MB2476.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXF6RlBuRDNMUWRzbHhQVzM5OVJrUUpvTk9aUUNhZWRTTENvQ2hMK1RjeWFB?=
 =?utf-8?B?bllPdGUvTVNIaW52LzBEMzNWRkZPYzZZRlFiVWJDZUdxbFBhZk9jVm9hb1FW?=
 =?utf-8?B?U2FZMnEvUUdabWlDK1kxNE5tOEFhbFd4Y3c3UVBEbUxaSnhLT04rZm4xTEJM?=
 =?utf-8?B?UURHaFNTa012TEMzemZoYjY5RXBPNjZvbGhCVFREYklZTEx0dXgyL08xT1U2?=
 =?utf-8?B?Y0ZZTWV2S0MyVUNLV1FPVVZMVzBIMlNMQmpZNmc1RW9YSTc4VUx6bFBZdGk4?=
 =?utf-8?B?bDRNME1pNzVuVjVmS0h2Y29rZW5GZUwxRUxiUXVXWjhjelJScGUwd1VNSFIy?=
 =?utf-8?B?QkhGOW8wam1GbU16NTZFRDFhNXpkcEpjcGxkc2dtTTUxbkdXQ0VJb29Idytt?=
 =?utf-8?B?ZXlLMEFyMFJIckMwYy8zMnM3QS85STZqMHcvQ1pmVnF6Vm94MDU4VjgxTUhQ?=
 =?utf-8?B?cWo5NjVXay81a2hvdVBlNEpiY2d0aXVGQkdxdGhLOUl1SHFPYTA0VnZpYkdN?=
 =?utf-8?B?T1IvNWpzZXJlL3Y3VHgzZVh5TGZrcWFRcjhJNmQwenV4NHE3RHdKZ09QK0lk?=
 =?utf-8?B?UnRrU0M5bVREbStwVEJjOTJGcHNIN2NEQ1EzejFYcUMrb09KU0pQZVhwZjFz?=
 =?utf-8?B?OTROMVdjTkg3ODBYR245QzBKa2F3aTFsem8wV0haSktleXVtbDF4Q1l2MzBh?=
 =?utf-8?B?M3h6ZkZwSVMvbU5jS1dvcThMTzd5bWlFdW5mbTB1OW5KUUdOT093MG5abEpa?=
 =?utf-8?B?ZnRZTFduYUsxSHFTMk9NQ3JMU3B4clRuY3ZPaHl1VStHcDI5YmdqbHA4VG44?=
 =?utf-8?B?YUJZL2V3QS92ZUV2WitoZTRJakxodTM2M2dRS1FkRmE2QkkrN3NuQklNVkpt?=
 =?utf-8?B?V1VHbDNvdlQyR2J0d3pVRWJkdEp4ck56UXdLWWdZR1dWd1NqQmpIakM5OFNa?=
 =?utf-8?B?Ujc0bkd4ZDY0aCs0bUxyWUdzVTFTYnNXOGhKcWpCL3hPZjZhOFVsRTNrMndx?=
 =?utf-8?B?WDhyb3Z3OGF2UXBmSjlOVW93QkcvNXhmamxyRjJBWG13Y1BKNmpJWDQ4K05I?=
 =?utf-8?B?bk96dVUvR2M3cEU0em1XeVVuYisxV2QrZVVvVWZIOVdRU0I5bWx3eXZsdmpT?=
 =?utf-8?B?emhBbE03TUp4OFg1THhXZDJSUG10cnpIZnFBOEtFbHFIM1ZMMDVYaUVtTEFS?=
 =?utf-8?B?dTU0aGxEb3RIQmxiZENNcnQ3OWlSazlpM05MTFVOaUcxdHhJeWt5TWU0d05P?=
 =?utf-8?B?TjN4Vy9EUitqWFhZNitkVEltZVI5UkhzUEpYVC9jT3BzdUdueGNmNnF6REU2?=
 =?utf-8?B?U0gzdGpHR29KMk5PV0c2ZXB0TXJQdUhLS05UQWdMckR6YkFRODhpaklxRUlY?=
 =?utf-8?B?VDU4Y2VVM1lUeks3VzZ0ak45eWo4WFVSWFl4dUN1eTM3S0w1c1J0dlgxNnUr?=
 =?utf-8?B?ZTh1Vk1RNEZXK2ZoTW1hYkRJa1BpTVZXNUhLUHpKcWR2UnYxZzNkVy9Gell6?=
 =?utf-8?B?SVZQS01RQ3ZuTkJPNUlzQkdPYXJoS0NPWkVNcHdUZFJCRUd5UVFIdDlVSTNr?=
 =?utf-8?B?OFd4L0p5VW5oRGg5M1dpeG80d1d5V0NOaEozUC9SOTY1R0xiblZQTmQ0ODI4?=
 =?utf-8?B?b0tzWTlmelVmVlRTaWxuSFI0SmZoeWJjUmxEbEZYOVRSMFp5VUFDSGxtMHVj?=
 =?utf-8?B?cjBmMHV0ajI2eFk0dkxSN3dxcm9ieU1IM2M5SUdUbnhHWDQ4V21YNEhiQ1FR?=
 =?utf-8?B?MERDblZUcWZDd3pqRE0yeW5sVEZEczZvcDd0UzF6dmxieVZ2YmRCOVlMa2VN?=
 =?utf-8?B?S1BYQzdMOTdvcmJoczVtZTdHcE5TUHdZaURXVWltYTQrc1VHNzZMUVZKSFZX?=
 =?utf-8?B?V0VYd2JOVEhTczIxQ0E3TGdHODB0ODNaejJlSUdPbzJSOC9kZm1icXVaaDRs?=
 =?utf-8?B?OTA1ZlU4TjZGSWVpUVM2c0NFSnA1YWcrMTZFdjhkSGNPcXduWmNjWnhJclI5?=
 =?utf-8?B?NmJmT3B1Q1ZxV1R5Z2QzbzgzVHNjTXAxZHVVVkY5MnVuRU8rcHVYY3hPMzZT?=
 =?utf-8?B?cmMvVENLQUF1c0x1Sk1CYWsrbms1L3owNk1YcXRTRU1RcXNnL1BFZkdtdmJ5?=
 =?utf-8?B?aHdzdktrMjdXa2tYVXMzQUVtRThRc1lFdkdWc3Q4VStwVXM4RFlOMk9JNjJJ?=
 =?utf-8?B?VFRuTGM0ZGoyRUhtRHV2L0puM3NndVZXRzZhMGJucGs2UWo0b1l1WUxWeDhm?=
 =?utf-8?B?RHZyVGZUamtqbC9YRmZ1QUFhT3FXUlNqRTFLVTJNdHhSWGhHRmIzRWd3OWJv?=
 =?utf-8?Q?eCwo8QKd2FXESk3V2i?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AD5501E15D8114FA49B61761F1F660D@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d571f-6e65-4208-c6a3-08de8fe71b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 12:06:29.1443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIxhdniMwkm9uB7TrMdZNNcEX+sz3FywmQi6TSV0vjNywpiD6fqCLxXDhrFkJGLN+hwVlZREVdV3Ys8fxkNVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2536

T24gVHVlLCAyMDI2LTAzLTMxIGF0IDAwOjM3ICswMjAwLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90
ZToKPiBUaGUgUEhZVEVDIHBoeUJPQVJEIFBvbGx1eCBjb21lcyB3aXRoIGEgSERNSSBwb3J0IG9u
IHRoZSBiYXNlIGJvYXJkLgo+IEFkZCB0aGUgcmVxdWlyZWQgZGV2aWNlLXRyZWUgbm9kZXMgdG8g
ZW5hYmxlIHN1cHBvcnQgZm9yIGl0LgoKIk9ubHkiIHZpZGVvIGlzIHN1cHBvcnRlZCwgYnV0IGl0
IGRvZXMgd29yay4gWW91IGNvdWxkIGFkZCB0aGF0IHRvIHRoZSBkZXNjcmlwdGlvbiBzaW5jZSBh
dWRpbyBpcwphbHNvIHN1cHBvcnRlZCB1cHN0cmVhbSBhbmQgcGFydCBvZiBIRE1JLgoKWWFubmlj
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsa0BzeXMtYmFzZS5p
bz4KClJldmlld2VkLWJ5OiBZYW5uaWMgTW9vZyA8eS5tb29nQHBoeXRlYy5kZT4KVGVzdGVkLWJ5
OiBZYW5uaWMgTW9vZyA8eS5tb29nQHBoeXRlYy5kZT4KCj4gLS0tCj4gwqAuLi4vZnJlZXNjYWxl
L2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0c8KgIHwgNDcgKysrKysrKysrKysrKysrKysr
Kwo+IMKgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWJvYXJkLXBvbGx1eC1yZGsu
ZHRzCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGh5Ym9hcmQtcG9s
bHV4LXJkay5kdHMKPiBpbmRleCAwZmU1MmM3M2ZjOGYuLjBkNTJmMjk4MTNmMSAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGh5Ym9hcmQtcG9sbHV4
LXJkay5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGh5
Ym9hcmQtcG9sbHV4LXJkay5kdHMKPiBAQCAtMzgsNiArMzgsMTggQEAgZmFuMDogZmFuIHsKPiDC
oAkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4gwqAJfTsKPiDCoAo+ICsJaGRtaS1jb25uZWN0b3Ig
ewo+ICsJCWNvbXBhdGlibGUgPSAiaGRtaS1jb25uZWN0b3IiOwo+ICsJCWxhYmVsID0gImhkbWki
Owo+ICsJCXR5cGUgPSAiYSI7Cj4gKwo+ICsJCXBvcnQgewo+ICsJCQloZG1pX2Nvbm5lY3Rvcl9p
bjogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX3R4X291dD47Cj4g
KwkJCX07Cj4gKwkJfTsKPiArCX07Cj4gKwo+IMKgCXBhbmVsX2x2ZHMxOiBwYW5lbC1sdmRzMSB7
Cj4gwqAJCS8qIGNvbXBhdGlibGUgcGFuZWwgaW4gb3ZlcmxheSAqLwo+IMKgCQliYWNrbGlnaHQg
PSA8JmJhY2tsaWdodF9sdmRzMT47Cj4gQEAgLTIwMSw2ICsyMTMsMjggQEAgJmZsZXhjYW4yIHsK
PiDCoAlzdGF0dXMgPSAib2theSI7Cj4gwqB9Owo+IMKgCj4gKyZoZG1pX3B2aSB7Cj4gKwlzdGF0
dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmaGRtaV90eCB7Cj4gKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2hkbWk+Owo+ICsJc3RhdHVzID0g
Im9rYXkiOwo+ICsKPiArCXBvcnRzIHsKPiArCQlwb3J0QDEgewo+ICsJCQloZG1pX3R4X291dDog
ZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbm5lY3Rvcl9pbj47
Cj4gKwkJCX07Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4gKwo+ICsmaGRtaV90eF9waHkgewo+ICsJ
c3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsKPiDCoCZpMmMyIHsKPiDCoAljbG9jay1mcmVxdWVu
Y3kgPSA8NDAwMDAwPjsKPiDCoAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAiZ3BpbyI7Cj4g
QEAgLTI0NCw2ICsyNzgsMTAgQEAgJmkyYzMgewo+IMKgCXNjbC1ncGlvcyA9IDwmZ3BpbzUgMTkg
KEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsKPiDCoH07Cj4gwqAKPiArJmxj
ZGlmMyB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+IMKgJmxkYl9sdmRzX2NoMSB7
Cj4gwqAJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbDFfaW4+Owo+IMKgfTsKPiBAQCAtNDQ0LDYg
KzQ4MiwxNSBAQCBNWDhNUF9JT01VWENfU0FJNV9SWEQwX19HUElPM19JTzIxCTB4MTU0Cj4gwqAJ
CT47Cj4gwqAJfTsKPiDCoAo+ICsJcGluY3RybF9oZG1pOiBoZG1pZ3JwIHsKPiArCQlmc2wscGlu
cyA9IDwKPiArCQkJTVg4TVBfSU9NVVhDX0hETUlfRERDX1NDTF9fSERNSU1JWF9IRE1JX1NDTAkJ
CTB4MWMzCj4gKwkJCU1YOE1QX0lPTVVYQ19IRE1JX0REQ19TREFfX0hETUlNSVhfSERNSV9TREEJ
CQkweDFjMwo+ICsJCQlNWDhNUF9JT01VWENfSERNSV9IUERfX0hETUlNSVhfSERNSV9IUEQJCQkJ
MAo+IHgxOQo+ICsJCQlNWDhNUF9JT01VWENfSERNSV9DRUNfX0hETUlNSVhfSERNSV9DRUMJCQkJ
MAo+IHgxOQo+ICsJCT47Cj4gKwl9Owo+ICsKPiDCoAlwaW5jdHJsX2kyYzI6IGkyYzJncnAgewo+
IMKgCQlmc2wscGlucyA9IDwKPiDCoAkJCU1YOE1QX0lPTVVYQ19JMkMyX1NDTF9fSTJDMl9TQ0wJ
CTB4NDAwMDAxYzIK
