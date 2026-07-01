Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B8823370F
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874018; cv=fail; b=rxSTqO3JxIZ7vuAOu+TT89jcNXUs0lYuy+3iAbl51OYl6O3q9iPsz2LJz64PCKSfvV4v/e0xqey6REWRmSE00+lVC8uO5nXpWtmKXuuGQN53+CB5/9HMWDKIwBnJty/61YLTo7TlV1qfQVORx8ty2k3U7pyjXnq3djEsuaaoRco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874018; c=relaxed/simple;
	bh=wcnYbI9cwpA76po/O8KLLmDBojU6JHQweBk0LC1VgCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=deDA/no6vmEZdk1Zwec+HJ50znqQt/wslywzoSWxtXnRUKo5qAvfEY8eHb5fBTJObJHdk/Vw3kJFO55X5mbQQNjWJ1NKOzpeZ3EllbgTEXVA5EVlN4xAo09BFHReyEEy98w+h1djATL5d0ne+rjg2Gjz60w6dx7C44IzJeW8XKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ncmwZY9n; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ncmwZY9n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPHGK8q/Fg2rLC21jQQep0e5thz8YzgMS6Pvu43hpj1L0KbAHJq+iGD2idG16+Al73pC7vk7MC6B2LHM1+vUWk8Xvvk3KX+wJwPMHEBzKOaKUqS94+6yvUIJ+aICIn//tw0E9O8qFNOs/HsBWXGsQnqyTWvgw9Gm0CWWq8zzR1PI6ibmEhoPxN3rneg/AXCJXEdqM6VzGESjraoPDwZ9rYr5w5Xw2+KuzCzjb/D47i7VG69QhxZhQCuOtTVqHH1HOJ8fGv1DXOUxbULl9AyMo8EyHxi67SBerNepgR7fSpXflS3HjDXh3iODgAJlfijCjkayxDk7DdN5zdNszWl20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcnYbI9cwpA76po/O8KLLmDBojU6JHQweBk0LC1VgCc=;
 b=T3Dak6UdhZVXlEESLFuac0CEdonsqjR6UfgT0N4lo84UEk9ZDjVQRLEm7VeboW7GjnFJTruQtkfSCyiEGG7ZQoxGSN09rl8+hOSFa2X5vX7lOB53vQh/ETjKDira51lJmHzD9fhwric/GC8l/a7lXlhCTe46HBJZBWAyzSoOxT5YAujz2d761XnhVNz/V8SWk07amIir3iA/fojw5rXzydUjYB54QuiDuz25xuBy2SyuN+yxnOHgadXwuhgLNwZNP1kajVa9zTGeTC2WkEdlL4EwYTd+SMK1zoC8BKuUogoHE9+UTBoxmJtT7WjNxT+tGAJ+JbCFl4WBbAH3AejlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcnYbI9cwpA76po/O8KLLmDBojU6JHQweBk0LC1VgCc=;
 b=ncmwZY9n3QCtsvQxEztIWTm2fQ8Cf83ZzxFNqvLbK+dK2qT3hl5NxtrsDCO1LwS3QDyuOsp+2mrIz9cZae/HHKJED56tpOaYlPrXYQTX0s3/jcT69+l4mZ2pa86Cq3lkP/Nd1tFS+Kyb9qeg5amCrNfrjyh/78fsbZ0+GBaakGfMCXPUkPOp8O1gAaXDzqZH+Y2eCGNPiYAZ2qbodmCHimxfoJQ5F2cdKfsqhiNWX24AOXItJ9YM7vNixn7B1V7ZEENbfQ3cn26vHVgqlKE4TVdRp+gvL+lQm+P5V7WRSxID9ulycDdrWz0xdoA5rk0ItRjG2/o7jDj7wwtjF9G6jA==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:46:54 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 02:46:54 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>, Felix
 Gu <ustc.gu@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, Jorge Marques
	<jorge.marques@analog.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Adrian Hunter <adrian.hunter@intel.com>, Jarkko
 Nikula <jarkko.nikula@linux.intel.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Topic: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
Thread-Index: AQHdCJM6q1TT8Qkxikud8GTrgU5NsbZXU5QAgACjBIA=
Date: Wed, 1 Jul 2026 02:46:54 +0000
Message-ID: <dc82ea6c-77b0-42b0-83bc-928d8e05410c@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
 <akP23nXJN5sBNb8c@lizhi-Precision-Tower-5810>
In-Reply-To: <akP23nXJN5sBNb8c@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|DM6PR03MB5306:EE_
x-ms-office365-filtering-correlation-id: d2feed4a-e8c3-4933-3fb1-08ded71b02dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|55112099003|18002099003|22082099003|56012099006|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info:
 cSfoI/iYTHRl2cOIrS5gFCnRgFUsNVdFQF22ZU/Wlo8Qm6LKAhWbrUgC37ZvyIkiPeK7Z7taAgzwh5msInWyq4NAIIY+2F6LbPV7e52h/b7oANd4GdPrbvQQpOArM1J/CLa3Fdy3GqdDOdudgzNdv5GfB+t3wEl233ivAv+5bZ3hlzMGfe1y9N+ELADbc1jtZyl7TrHpOgGA8kAkUKwaruELHhcVP4Skr1y7vrzpdFlUTmdogmXK0lzvszlUrQC7ak467Tk6sPnD6q3Bn+Wcs59gArQQYgeN15uhGrkhQXXNhhExetdbthuE8YtO8pEGfI/7MLfhKBQ3JWaGVlcyUk43vGgP5vKiTMwjwuSlSGAaLeYBlym6tRMeccUDKnn5uAZ+FOLGcLdWxIUacnojCYOIkRAun+1UxgFLqKDDOS4jzazdc3zNQwzCeYu+llpQtIgGj9V4ahkexf/TRWEn9wsJCArkfcaS0y32MgmYbEjOojssP6S7/WXsKln9//9nAEql3+wnCxcTV/KIBg2Yc4WTEMrBA9U/2GMku9VVuoeyasqMN0zNWH5kzBYb3uZDiBkHAAdaq3iWtv4MknrwDZM318iAZ9E3f2UhkNRxK3FnghpTbLvZFGiF4HxjX2MMrATHdWcShsMwk1HultUt3mwi2KR3CbdOwFo5DwUpfFnZVK7Muv+1CoZywdTuK7xRovTtgnttDGb8CvQePwgbhD7vMNbqMDujFaDr/TrNMBc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(55112099003)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sm4yK01paWJJM09vaFpYTGdBSklrMUhMUUJYUXJDbENma3RQQ3o5RXhhNFBx?=
 =?utf-8?B?SXU2eDNBUVRnUWJvREZPcDczMkVnS3JpUGlZa2ppZFk0cEVnODZLblNoRG0r?=
 =?utf-8?B?ekI3cTZCWm5Dc0tDMTFUWlQrQmRnOXJha054K2QzREd3RXJ1RzA1WWFtZHFx?=
 =?utf-8?B?R2dXb0lqUmhYbGoxL2VRY1NmWHNjMEFxQmoza00zNStoK2xKbVBFeHU5bVBX?=
 =?utf-8?B?Y21DUWpYL0lWL3NrcC9yd3NYNVU4Rm8rbkxESFpGYmVKZGRFVnlraEkyc3ZF?=
 =?utf-8?B?SW82eDBBQjRxYkNCalhCYTI5OW14akpkM1JoTG4zVGpsWkhMN2dsQXhNSFBJ?=
 =?utf-8?B?OURxOFhuWm03a0YvbVJFQW85QlJQNHZ3VDg4VVdZMFR4KzRHdDRvYzJWNUwr?=
 =?utf-8?B?L3d0Mm0rY3N2bFZOS2VOeVo3NzhCbThoTFdmWFA1QkE4aEJqWHFqeWpsaFJl?=
 =?utf-8?B?eks0bVJ3Z2JIYXZ3by9VN3RoeCtZenpqVnd4c0h6NkJFK05YTCtwZk5LeTlQ?=
 =?utf-8?B?YnM3bS8xUnptck53SE5XTk9jdUMrcnJZaXg0VllRbEtnUnZTbkoza2liTEo1?=
 =?utf-8?B?YWVabmJrOHZGRmhIZFhKamNGRHhUS01zTVdUWDJ3aU94bWJIV2lvQUx5d2c4?=
 =?utf-8?B?T3hJendNZ3UxK2VtUHBTZEg3TjRJdUpRYTJaUTl6TW13aFBPTk95eTZ2VFkz?=
 =?utf-8?B?TUNJQlZtWDBVSS9TL0Z6UEVVQVNybjI0cUlsVmFBSFFYMHJsdnc5NVRYK1dL?=
 =?utf-8?B?c0N2R2oyVFNlVi9DNU1oUnJNdFVjdUM3enNZK1JjL2Rud0UwSzRiUEVIMWE1?=
 =?utf-8?B?bkpjRks2NDdQNWZac1h4SVVCcTRhTmcwbEkzN1puMTZsZ0dsS01adVZBWGU0?=
 =?utf-8?B?RlFSeXFHSWZUdU9VQlo2d2l0d21nTmx5MFgzdWprV3Ztc2JNZ1B0Y1BUcTRm?=
 =?utf-8?B?UVh5UFZwWmdyWE9WL24zaW9BQmpOUDc4VmIyeVp3amtoemVTVEFlNVh5YzBa?=
 =?utf-8?B?NlZZdmpoVHhTOVg2bTFSVjVjMnd6QWoxbi9HZGpmY0NVZ2hEc3N6YjlOSVBK?=
 =?utf-8?B?dEVob1RrQjl6bVJ3bU9ZellBcjRxOE0rWDFkc1M1akVKdjJnVlMraHlhcEFj?=
 =?utf-8?B?eDRjNVErVWtSN2h2eUp2T2JGWWJHbXY5blNMY3ViTWRuTFl5VG11UHQvMWty?=
 =?utf-8?B?UTd4cmhieEpnUkdtR2RaNzk0TnlQRUN4M0wycVdnSmJZNkluUGtsN29NeXU5?=
 =?utf-8?B?RUZWenRxdEFORUt0OWkrb0EvOTl2bnlMbVVjZEwvSTNpNEJ6YmFtY0xRSVh6?=
 =?utf-8?B?UHRaaDhiTUs3bG1oaWpXZHFYMVJ1WElLUEtVSUtkMi9SV0dXdURTVHk3SjJw?=
 =?utf-8?B?NWRzSlBTN0loNzdjQ0V1b0ZKcStSVktpU0NqSXZxZkx2cndnV3Y0dkhqdzdG?=
 =?utf-8?B?bXhWT21BQmJmc2FvQTF4MXNxOTZOYUM5aStBRnZPdHVmeWVPak10VXhDRFdH?=
 =?utf-8?B?YmZKVW1nRmRIMVRUcXk5dUUzalR2MGQ3ZU1EWjgyS2paQS85MUhObjRZYUFk?=
 =?utf-8?B?aksyT3piSWlTa2FjM2ZMQzVtTVgyamZBRGlSYzlpc2srMTFJRDVML1hOQ0Fu?=
 =?utf-8?B?M29kZVM4MmVtYmR0QW1BdDF4VHM2cXdqZW5GQnd1Y2lkTTRaSGdSamlTc2dh?=
 =?utf-8?B?emRZRjBxa3l2dFYyYysrcllpeEZhUEVwYkFXa2NveXozaERHRjhLV3F2TUNO?=
 =?utf-8?B?MjN1dG9JMWhBS3lNMnl3TVgxeFZyKzFXQjJSVDcreUxSWmMrY2dMMmdnS0JY?=
 =?utf-8?B?OWtPNm0xRUhZQkV1d3N3bGltUkpnRDFtMTI1bENBbHA2QTVZSm9aeElCeWgy?=
 =?utf-8?B?a0xzMk9Ka2hDWGNJOVdsOWt6WmRDNUdCdDE2S0YxbGtRb1h4bk91eHA1aU82?=
 =?utf-8?B?b3hYMVpwSE1hVk5QLzFsc1pTMXdsVmwxQzRFZkh2VTRHZm9yYmVTdHJQWHdk?=
 =?utf-8?B?eHVOd1VFY2lsV3N4T0l5TnF0UTE5ZXBERk94R0wxcXZ5aUVpYkNaUG1WalVN?=
 =?utf-8?B?UkRFQko5SklTa2RwVTlPZXVIeDU0QXJIT043MlJha1lxdWdIdGVRRmJXdmtq?=
 =?utf-8?B?RExVNkt2YUNwQy9yWEM5YUJwbktuWDNuWk9jK0ZMV21MYktQYlpDREdjUEpy?=
 =?utf-8?B?aXJaclJlWHJWSVJiWXd1K2R2VFAraTEydlY3T2l1QVZzTURyOWJ0Q1NvZ0Uy?=
 =?utf-8?B?eW5sMEdpeGdFQVFRUUxUL1o3UGdhMHV1ZjdpUWQ5MkY1a1dkdU45YzRqYkI1?=
 =?utf-8?B?NFg3dkN5TUtPeG8yNVVnV0poVFdIZUp2Wk1VeFJNVzVpcGIwTUZsdVJTODls?=
 =?utf-8?Q?uUAruKajZZRZCMoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50DF2039DE0E8743BFE6F21B8E30896A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2feed4a-e8c3-4933-3fb1-08ded71b02dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 02:46:54.4730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTwJ5LykyvVSnJt+mxhaI3CCDVAflsjiddFLOKtMjmR9Gy9Ity4W6C0g71Zk/caY0vRSHYYgSUzd8PQBfmqyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306

T24gMS83LzIwMjYgMTowMyBhbSwgRnJhbmsgTGkgd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDMwLCAy
MDI2IGF0IDA2OjIwOjI1QU0gLTA3MDAsIHR6ZS55ZWUubmdAYWx0ZXJhLmNvbSB3cm90ZToNCj4+
IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4+
DQo+PiBPbiBzdWNjZXNzZnVsIEdFVCBDQ0MgdHJhbnNmZXJzLCBzZXQgZGVzdHNbMF0ucGF5bG9h
ZC5hY3R1YWxfbGVuIGZyb20NCj4+IFJFU1BPTlNFX1BPUlRfREFUQV9MRU4gc28gdGhlIEkzQyBj
b3JlIHJlY2VpdmVzIHRoZSBudW1iZXIgb2YgYnl0ZXMNCj4+IGFjdHVhbGx5IHJlYWQuIEFkZCBh
Y3R1YWxfbGVuIHRvIHN0cnVjdCBpM2NfY2NjX2NtZF9wYXlsb2FkIHRvIGtlZXANCj4+IHRoZSBy
ZXF1ZXN0ZWQgYnVmZmVyIHNpemUgaW4gbGVuLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFkcmlh
biBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFR6ZSBZZWUgTmcgPHR6ZS55ZWUubmdAYWx0ZXJhLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgNSArKysrLQ0KPj4gICBpbmNsdWRlL2xp
bnV4L2kzYy9jY2MuaCAgICAgICAgICAgIHwgNCArKystDQo+IA0KPiBDYW4geW91IHNwbGl0IGlu
dG8gdHdvIHBhdGNoZXMsIGZpcnN0IHBhdGNoIGp1c3QgYWRkIGFjdHVhbF9sZW4gaW4gY2NjLmgN
Cj4gDQo+IEZyYW5rDQo+IA0KDQpTdXJlLCBJIHdpbGwgZml4IGl0IGluIHY1Lg0KDQpUaGFua3Ms
DQpUemUgWWVlDQoNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2Mt
bWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+PiBpbmRleCA2
NTU2OTNhMjE4N2UuLjg1Njk2MWRhMTgyNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9kdy1pM2MtbWFzdGVyLmMNCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2Mt
bWFzdGVyLmMNCj4+IEBAIC03NDIsNyArNzQyLDEwIEBAIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19z
ZXQoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlciwNCj4+ICAgCQlkd19pM2NfbWFzdGVyX2Rl
cXVldWVfeGZlcihtYXN0ZXIsIHhmZXIpOw0KPj4NCj4+ICAgCXJldCA9IHhmZXItPnJldDsNCj4+
IC0JaWYgKHhmZXItPmNtZHNbMF0uZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spDQo+
PiArCWNtZCA9ICZ4ZmVyLT5jbWRzWzBdOw0KPj4gKwlpZiAoIXJldCkNCj4+ICsJCWNjYy0+ZGVz
dHNbMF0ucGF5bG9hZC5hY3R1YWxfbGVuID0gY21kLT5yeF9sZW47DQo+PiArCWlmIChjbWQtPmVy
cm9yID09IFJFU1BPTlNFX0VSUk9SX0lCQV9OQUNLKQ0KPj4gICAJCWNjYy0+ZXJyID0gSTNDX0VS
Uk9SX00yOw0KPj4NCj4+ICAgCXJldHVybiByZXQ7DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9pM2MvY2NjLmggYi9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaA0KPj4gaW5kZXggYWQ1OWE0
YWU2MGQxLi5kODA1Mjk0OWU1N2UgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9j
Y2MuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9pM2MvY2NjLmgNCj4+IEBAIC0zNDMsMTEgKzM0
MywxMyBAQCBzdHJ1Y3QgaTNjX2NjY19nZXR4dGltZSB7DQo+PiAgIC8qKg0KPj4gICAgKiBzdHJ1
Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCAtIENDQyBwYXlsb2FkDQo+PiAgICAqDQo+PiAtICogQGxl
bjogcGF5bG9hZCBsZW5ndGgNCj4+ICsgKiBAbGVuOiByZXF1ZXN0ZWQgcGF5bG9hZCBsZW5ndGgN
Cj4+ICsgKiBAYWN0dWFsX2xlbjogbnVtYmVyIG9mIGJ5dGVzIHJlY2VpdmVkIG9uIGEgR0VUIEND
QyAoZmlsbGVkIGJ5IHRoZSBkcml2ZXIpDQo+PiAgICAqIEBkYXRhOiBwYXlsb2FkIGRhdGEuIFRo
aXMgYnVmZmVyIG11c3QgYmUgRE1BLWFibGUNCj4+ICAgICovDQo+PiAgIHN0cnVjdCBpM2NfY2Nj
X2NtZF9wYXlsb2FkIHsNCj4+ICAgCXUxNiBsZW47DQo+PiArCXUxNiBhY3R1YWxfbGVuOw0KPj4g
ICAJdm9pZCAqZGF0YTsNCj4+ICAgfTsNCj4+DQo+PiAtLQ0KPj4gMi40My43DQo+Pg0KDQo=
