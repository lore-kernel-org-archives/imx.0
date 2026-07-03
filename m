Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0423AFB14
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070189; cv=fail; b=VXjhk9CxhxE2bfkmZcwyjyQsK1JmVC3VtlrxZgsa6vsEnkyQLVH9N8xptbqQGa7/LkOvhuqkc/1j7jGYu4/gmNmdKfw+2Q0HgrbCTRCkotmdkGVeIg1YzS9cgapcy2A6FNLbZ3DV0fCCXIjc4pRtmBX4Fl/ilanI6WABkNLx3kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070189; c=relaxed/simple;
	bh=zqJMezIi+V2ZbPksn65WdJ1if/jkDdQaXdgnbj/Ph2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tSmSgXHbSXCIOwSR1QC18IFmOnNoJDFQ0zDUfDDdmuUoNKliRvqsoxE9BuOMmmFPL1DpzNKJtmO1NYBroAmeZ9N7/Bl7PAuW95lvpJVjFWH3DNVVlZyNp76Z6eCPnfQqqezyGR89lP/9MIaEt73FMopi5Ze531HyGCMtnOJFvEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=KxukVH7Q; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="KxukVH7Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3QNLtyp8YFajHMhrnzHCOvNFX/UsYvRChUYULlXtlNRpLccRImXHlsNqUoKmk+XTK/jTejqOrOddomVg2sdhWWBxR5PlW3TtE+eO6lnZ7X5jgFo5aZuKH1XIDLnHKu6nL+TFknp2FtBXHusmxnhrkAIiXhWlPUNcjNeZZsbP6uhn2KQide8+TO9kihL6B9RO+LuXbJE5ZSVn1Z8YqS06/AI4wjKSmrjvexzxzVOmCMNko4Jw20JwF/jhYEUhascaai3NyArSZxADZqnX4w5UuGRqRHmGVxTAkNQNTlaUuxPlXX5IbVpE0Qdead7GJ+muS1grrdoWv/qwy45DH0n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqJMezIi+V2ZbPksn65WdJ1if/jkDdQaXdgnbj/Ph2Q=;
 b=YkYHGSnh/2KAmSH1HwOJiu/ZTlWZY0uLl3MBq5zQfJce7IL/KqqWuMK4bl+D80BMByolpo3Z6VF8sSkGi1+mYwQAZNeN4HmxO513il3Ry+1q99atEofiKyG3RIPg+Mai7hoXHVx6VUlfx6YbSI1DPvCtZLFu+4rsgk3GB49gCdNb3t4V45C5RFLAe4dhx36sIPIm3kdLAcIgl0TlBt3aatkqd99b4v2GHAYXRKUHblzblyG17nE2G/y3L+re4+WU0vYBycuXutkdrggKPxNHhXGqIW71ziaOTO/peV+SnD6sghdeRV2k321ZihthKYaHKijEJmXiBtS/fItKm7Mi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqJMezIi+V2ZbPksn65WdJ1if/jkDdQaXdgnbj/Ph2Q=;
 b=KxukVH7QRHpoKbCmWpBFrG0zn0PEHDMTKlz9VYRD7cDIjNYu9Iwx0RGS/5wtjYsY2ueTivSzANsxJTUlsLx6GBGRjbEbnPQRGjpKLTbLQOSYI/iaKYHUkj4f4Bn1Tpai7icq6c01qqiQYiWWgu+Q0YyX9CtY1BPE066Zr4QxEmwih2Rr57PWTFKWFm/eu226+1ImWtoCEOuy55WsPpRqoRBNwRU7GZee30sdp5kPx8bHVPrtXMlp67ziuFDYPQa+PPcCPlOlI7iYuTHFO2VPEGugbIzFcD+d7QK55rwdb9aIx05chBPgPcbfOnftHyiSu/k9nHLYmL1gmgb1KYNJPg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SJ0PR03MB5837.namprd03.prod.outlook.com (2603:10b6:a03:2df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 09:16:23 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 09:16:23 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
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
Subject: Re: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Thread-Topic: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length and
 retry Direct GET once
Thread-Index: AQHdCJM7/9SRJ+dDNU28PTykBACmuLZYefkAgAMOGwA=
Date: Fri, 3 Jul 2026 09:16:23 +0000
Message-ID: <03b1d496-6cc9-4f37-9c87-7374b7a81164@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
 <178290222676.176638.8647414585139967730.b4-review@b4>
In-Reply-To: <178290222676.176638.8647414585139967730.b4-review@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|SJ0PR03MB5837:EE_
x-ms-office365-filtering-correlation-id: 1afbe0f0-bd08-4d7b-feeb-08ded8e3c0a5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|55112099003|22082099003|18002099003|38070700021|6133799003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 jTtUGOd+OkqKuTJM2OhPBv92gEEEmYu6zlFTa43vhTK0iV8BS6MxiA8PCxvKktKbSn6jPL1bL5DJstbjwbWA5bJawRK1MlIJCx09Q94ONWLy9BSztZERs3uvx6euKBQFEr0Hq9WIzA60qdKgxWrbgm6ZVai8Eaohu8DbP12DbbmWkQ9GlCGZu670Xqo6sLGX1FFV+dIUd6l/ZxoBld3MtJHOFzAiG64KVN/IbYraeFBIghw6RiGnbKmbdLttmPin31Tt6EYNVPorH7q9MoV2tFe6tWkyOPVysjQYu+8sC8kC1BAOnTEbdIk6CZgGqm9kViprV+hO0iqhtcG1AwPOF41nl/YHb9p38FfpR7ZRAmPmavTYQ3SxzQWRX3CHH15wv9PZCHpP4nzMWO5zB6D95AkeYVoeMyn46XB/uSNl90MgF0WZPmPFdUYtgbAxPTpLOjj6ura2f3M3XnZyKQDA2eG36oCjn+V0XzrU13L77yaITQGa/OC+Qcy3h/p3BDMDeTdoLdKfJwyIG72TGrDeRCtopvNdabOcdfSlfOVA4MgUil5dyQsDMDRzhn+3xTun+wife06EhjiJFb5avysHs2R/vzCfARVouMRZCY7eYutc1zK7l2F1x8xrz7ogq7+icK1913ghtzbl70kVQrYJtCx+TZH0wWpD8UWJdCOul2qHkcHVnCBCnCEHVz2mYiY3lejv3GRLfzteLih2xQHdgBR/cESAkc/4aDTu7YjPdWI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(55112099003)(22082099003)(18002099003)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajNTQXBCN1VPaWtNcXBTNDRJZ2FoZEs1MDZvOFNucytDczBZQVVHR0tuVGFD?=
 =?utf-8?B?Um9LRjBKK0dLYnVNbDVaZWRRc1Q2b3pSTmJCNng3WEs3L2VKUnBrM0ZZcFg4?=
 =?utf-8?B?WHdPdTdxelFZVmVGSW1SYW02YmpodVZNWVB2S0JybHZ0dVpkUE1FdEc4M3lP?=
 =?utf-8?B?NlRCWFh1cFcrbW1IRkg4VFcvQ2pYVk5NQmlrM3FueE8zV1FqbWVHNUdlUjVZ?=
 =?utf-8?B?ZVhEZ2tkeFVHeUhJT1FWak1URE9xUmZmTzEvZ1lyUktPQ3BzZjZJMkNOVE1o?=
 =?utf-8?B?b2dPdHJkN05IU1p4VFlvWHVPdENGSm43YXFRd0M4WEVxYTB0Rkk0eHpaVXhP?=
 =?utf-8?B?OE85NDVXaVZnenhUb0hKS1JDeXRtZDROK1V5YkhNQml6d05ZZ05wcStCdTFG?=
 =?utf-8?B?eTJkUURSdW8zOWdqa2hEdzRyTEdGa2pYUjNtZDV4YXNMN0ZvT055UW5JeGRC?=
 =?utf-8?B?blVjbFRnL25oSFZuVDN2TDNDcW5uVjEwU3hMdEVFR0psZ3FhREtBbXlyMGpk?=
 =?utf-8?B?WEVLb2JqVnNXcmtQbmM4azFVaWxaYlVKbTFUVnBrZ1pZMEx6VWZUZnpLUENU?=
 =?utf-8?B?WGtidUU3MTlBNGJXeStuWFZHaFFuSnJoUjE2N0RLcEg3V3hTYWVxRkpkSHJ3?=
 =?utf-8?B?b2hRM2I2UDZtb3lwNitEeE9JVk5QdjIwcGNmc0tvNmdGUnhNOVNDVTVmUnpz?=
 =?utf-8?B?UGVxV2h0cVMrWnNZMWdmMkhEOTJiU09nU1BlUWtVbGhsM2dKR0R5UjlsSU5U?=
 =?utf-8?B?T09EMERjUGh0bWhUQi95cXQyeVJSYXdjNVhKSG56TUVFcDVhSEExQVI4b3Iw?=
 =?utf-8?B?cmZHd2NrTnBCZDg3WUNyR2xFNXZ4QXVNclhPVzFhNUpaZmxvRjlzaEpoMHNE?=
 =?utf-8?B?RTdZQXh6YWZjT2s0b1MyYnUyR0RqVHFhakROZEx6d3h6c2dZYWxGK2RoeGtz?=
 =?utf-8?B?SmgwTjA3MjRIaEg4VFFsekxKem9TNVlNeHBERVd5U1dialhKQStEdU5URnNY?=
 =?utf-8?B?ZEZnclBIM2NCNFBFK2FLOU1yVnlXaGo1dkxqRVdhS3cwS1djOTZjTWswb0dH?=
 =?utf-8?B?cmludG5LQ3IvOENaOEgvbEhBd05odzF1ODdjWTZuYWFsdmo0RkZ1OVdMSHFh?=
 =?utf-8?B?QmtNMDVTcnlCcFJHRVZXNURXVXNmOXBVVFRSeHhNK0REaTJva01Ncll0NlFs?=
 =?utf-8?B?OXpxQW9Qc2doK2NySmpYNitXYXB0Yk54K2FMREpPN0RiT0t5SG9Odk5veWJD?=
 =?utf-8?B?K1lUVU55K1k1MjlXVnVyQThwNTFZdHRlZGhsWnoyTEtnMUl0ZnA1WUZkVUlo?=
 =?utf-8?B?L0ZVblQyQXRFNStNRFhyTjY1Wk5UcXdNSGVsNlRuNUZGaXJjK0VCZUFCYlJh?=
 =?utf-8?B?Ti9YUkxUcWFqUTBlNzY5bHdJa1R3Y0t3Nko0Z0dNWE1wV21iL203Y2g1VTE1?=
 =?utf-8?B?b2c4MnZEblhpOUhRTDRyejI4Q3kyUElzT1ovY0FzNzBLSHRWRXFzbzlaVVNy?=
 =?utf-8?B?bE1PUXROeWd2bmt4d0Y2eWs5WnJ3aVErNlRiZTFnYmxSTURLRUJCd0w2dHRW?=
 =?utf-8?B?ajJuZWsyMWljci81Y0lwaVRBWmVwRUF3c0VaTnFDR2kxUjBlNHV2WjFOK1o1?=
 =?utf-8?B?Mm5FQy9tL2U1Sk1KK252NHNFNFJ4QVJtaVhlZHFzWFljYnBNYjBOODZVbXhH?=
 =?utf-8?B?YzlHNFJFQ0xqakhaVjQzRVhPOWxiT0hmU2dENC96ajFvUmNYci9pcHU1Wkln?=
 =?utf-8?B?VjA4c3VuejRBWlBKcTA1NG9Ub05YTXdXNUpQN3dlSm1ySGJNMm92dlB5SHVi?=
 =?utf-8?B?Q01WU1BtUnNBVHBDTUxncGZPNXgyZFlweVFpVlRTMU1TU3FWRzdBcTI5UHN6?=
 =?utf-8?B?cWpNUW9mMmR4ck0rUE5oN0FRaXBjYXFyNEZLRWMxcDRFZWVhM1JGeGVuZkpO?=
 =?utf-8?B?NDFQRS9QSEpTcmRXOVBaWTVkakJ5WkNyeGtuSnA0c1pHdlVhNkxlRmJOY2dh?=
 =?utf-8?B?L29TTldKNFVMcjZrS2gvOWxGOWEvNGhKNmNjb05DWTNKWVJiQXVBMXNuc3pN?=
 =?utf-8?B?ejlZb0VheUJLTEZCMUFwTEwxa0k0endzaERzZlgvdXVGMVpPWTRmWlZiaWFO?=
 =?utf-8?B?MzA5UU5nalhhdTJhRjBLWXZ3VjIvdXEwa0loQ04rb282Sk9nOWNvUmJaZHFr?=
 =?utf-8?B?RWpBS1hNZWdGZWI4ZVB3elNBVEt2RkJXa2FSUlh2NUlITDJSS1NmcnkyOUEv?=
 =?utf-8?B?UkFGeFp6Tm9CTzJCWmRJYXVKMHVZVGlrcmNBOGdNT05YTmJYeVd2ZDBpTEVk?=
 =?utf-8?B?Wm11TnF1cUI3bjB3YzBERnJTK21rak1MN00xNkgyOHdNSWI2Tm1aZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <004E739264E1724781629AFE127D868F@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afbe0f0-bd08-4d7b-feeb-08ded8e3c0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 09:16:23.3905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9PxkFR9TY7x7j8AbtFIMgZxKJShIwrikzD1mmOKJfAQ7VUlQjngfMQSi6qvr4uqdhXnHLw6yi5P4YZYF7Z8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837

T24gMS83LzIwMjYgNjozNyBwbSwgQWxleGFuZHJlIE1lcmduYXQgd3JvdGU6DQo+IFtZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYW1lcmduYXRAYmF5bGlicmUuY29tLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFR1ZSwgMzAgSnVuIDIwMjYgMDY6MjA6MjcgLTA3MDAsIHR6
ZS55ZWUubmdAYWx0ZXJhLmNvbSA8dHplLnllZS5uZ0BhbHRlcmEuY29tPiB3cm90ZToNCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+
PiBpbmRleCA2YjhkZjgwODlhMzUuLjNhZDhhMjMyMzQwZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jDQo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYw0KPj4gQEAgLTkx
NCwxNyArOTE2LDU1IEBAIHN0YXRpYyB2b2lkIGkzY19jY2NfY21kX2Rlc3RfY2xlYW51cChzdHJ1
Y3QgaTNjX2NjY19jbWRfZGVzdCAqZGVzdCkNCj4+IFsgLi4uIHNraXAgNDQgbGluZXMgLi4uIF0N
Cj4+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsNCj4+ICsgICAgICAgICAg
ICAgbWluX2xlbiA9IHAtPmxlbiAtIHAtPm9wdGlvbmFsX2J5dGVzOw0KPj4gKyAgICAgICAgICAg
ICBpZiAocC0+YWN0dWFsX2xlbiA8IG1pbl9sZW4gfHwNCj4+ICsgICAgICAgICAgICAgICAgICgh
cC0+b3B0aW9uYWxfYnl0ZXMgJiYgcC0+YWN0dWFsX2xlbiAhPSBwLT5sZW4pKQ0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlPOw0KPiANCj4gVW5sZXNzIEknbSBtaXNyZWFkaW5n
LCB0aGUgc2Vjb25kIGNvbmRpdGlvbiBsb29rcyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlDQo+IGNo
ZWNrcyBhYm92ZTogd2hlbiBvcHRpb25hbF9ieXRlcyA9PSAwLCBtaW5fbGVuID09IGxlbiwgc28N
Cj4gYGFjdHVhbF9sZW4gPCBtaW5fbGVuYCByZWplY3RzIGFueXRoaW5nIGJlbG93IGxlbiB3aGls
ZSB0aGUgZWFybGllcg0KPiBgYWN0dWFsX2xlbiA+IGxlbmAgY2hlY2sgcmVqZWN0cyBhbnl0aGlu
ZyBhYm92ZSwgbGVhdmluZyBvbmx5DQo+IGFjdHVhbF9sZW4gPT0gbGVuLiBDb3VsZCBgKCFwLT5v
cHRpb25hbF9ieXRlcyAmJiBwLT5hY3R1YWxfbGVuICE9IHAtPmxlbilgDQo+IGJlIGRyb3BwZWQg
dG8gc2ltcGxpZnk/IE5vdCBhIGNvcnJlY3RuZXNzIGNvbmNlcm4uDQo+IA0KDQpIaSBBbGV4YW5k
cmUsDQoNCkFncmVlZCDigJQgeW91IHJlYWQgaXQgY29ycmVjdGx5LiBXaGVuIG9wdGlvbmFsX2J5
dGVzID09IDAsIG1pbl9sZW4gPT0gbGVuIA0KYW5kIHRoZSBzdXJyb3VuZGluZyBjaGVja3MgYWxy
ZWFkeSBsZWF2ZSBvbmx5IGFjdHVhbF9sZW4gPT0gbGVuLiBJIHdpbGwgDQpkcm9wIHRoZSByZWR1
bmRhbnQgY29uZGl0aW9uIGluIHY1Lg0KDQo+PiBAQCAtMTM3MSwxOSArMTQzNywyMSBAQCBzdGF0
aWMgaW50IGkzY19tYXN0ZXJfZ2V0bXhkc19sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJv
bGxlciAqbWFzdGVyLA0KPj4gICAgICAgICAgICAgICAgICogd2hpbGUgZXhwZWN0aW5nIHNob3J0
ZXIgbGVuZ3RoIGZyb20gdGhpcyBDQ0MgY29tbWFuZC4NCj4+ICAgICAgICAgICAgICAgICAqLw0K
Pj4gICAgICAgICAgICAgICAgZGVzdC5wYXlsb2FkLmxlbiAtPSAzOw0KPiANCj4gTm93IHRoYXQg
b3B0aW9uYWxfYnl0ZXMgPSAzIGxldHMgYSAyLWJ5dGUgR0VUTVhEUyByZXNwb25zZSBwYXNzDQo+
IGkzY19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4oKSBkaXJlY3RseSwgdGhpcyBmYWxsYmFjayBv
bmx5IHRyaWdnZXJzDQo+IHdoZW4gdGhlIGNvbnRyb2xsZXIvZGV2aWNlIHJldHVybnMgYW4gZXJy
b3Igb24gdGhlIGxvbmdlciAoNS1ieXRlKQ0KPiByZXF1ZXN0IHJhdGhlciB0aGFuIGEgc2hvcnQg
cmVhZC4gSXMgdGhhdCB0aGUgaW50ZW5kZWQgcmVtYWluaW5nIGNhc2U/IEENCj4gb25lLWxpbmUg
bm90ZSBoZXJlIHdvdWxkIGhlbHA7IG90aGVyd2lzZSB0aGUgZmFsbGJhY2sgbWF5IG5vdyBiZQ0K
PiByZWR1bmRhbnQuDQo+IA0KPiAtLQ0KPiBBbGV4YW5kcmUgTWVyZ25hdCA8YW1lcmduYXRAYmF5
bGlicmUuY29tPg0KDQpZZXMg4oCUIHdpdGggb3B0aW9uYWxfYnl0ZXMgPSAzLCBhIDItYnl0ZSBz
dWNjZXNzIG9uIHRoZSBmaXJzdCBhdHRlbXB0IG5vIA0KbG9uZ2VyIG5lZWRzIHRoZSBmYWxsYmFj
ay4gSXQgcmVtYWlucyBmb3Igd2hlbiB0aGUgNS1ieXRlIHJlcXVlc3QgZmFpbHMgDQpyYXRoZXIg
dGhhbiByZXR1cm5pbmcgYSBzaG9ydCByZWFkLiBJIHdpbGwgYWRkIGEgY2xhcmlmeWluZyBjb21t
ZW50IGluIHY1Lg0KDQpUaGFua3MsDQpUemUgWWVlDQoNCg==
