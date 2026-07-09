Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B54371CEE
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565803; cv=fail; b=tCWox3e9QHJVXTFJDrrT2j1z4NQf31YlgDsj7cIkh/ab/CQkBzcxIMHwJa/iTO6HD9aoPoS6XnP/MOuat3BsMc/PR+3pu2NBTglagBc9nXikrueppwk9E8g9iU9Kz53IBkxx49WqPk6beZI4xGJGJMmNjg3QN0Q5rtG7LdaM3hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565803; c=relaxed/simple;
	bh=EuedzerudJaPSoDYsdz9DbtCtYYHPuKwklikq1KiFc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NFz2LPkFpcDp5CQKdrLGfmA3O3IriMWVxpaaaWgNVi9DphMkpV+a22b51wQjCARcI3McUC/PX8LiHhdQCPBX0bFr14lrWG0/RDMgpRJNqAoAlI6yCka0Pgq4l7mcFO6KXLFWHHFxwXr0HLalUJ8WTsg3hDNpWXt3rS59cnb8N1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YNiKAuJV; arc=fail smtp.client-ip=40.107.208.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YNiKAuJV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFx21XPm9NaBCkbYuRPq9azGeVf19Gn/QuK+nZaN0McPaNCIyYIHJx/PZpXTQrQpLQ9tT20wzNFny8jDgmTIHO2VOELxU5DCRizEC/k+zyHSIiyjQtZ+WNvxOsme8KVF6CeYJNAAQUwliKJaL9g0Rv8jxBcOxPaeD3dsbYNavqHT2/7RXFijmJtJFIoVUKbCb/SsG+BvONS3FEhKLL9FeR0nysz4+laa9+lBJGGRM7WqpAKfTwBzTNHzZVwNg3ztdV9A/bIdduF7tV4fB3F9qCaMvsutgoRm6xFDGYZUMNO1a9gO1Z/9dV54Jq3IVz/taQiTtf1iLKGMnMkpUGzocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuedzerudJaPSoDYsdz9DbtCtYYHPuKwklikq1KiFc4=;
 b=U4f9uZCLtq7VAGfT6rhgIOqf5eegKXq4/w0KfzpxBcZ1adYOYsQqs+73pQ1LGJBhd0xOjelGKE0kZlh8+9QxyFSbImLxNXlF6GjzAub0PFp0aj3NqClHP1UQu8AkCUBToW+vnX7AGwVZubbP1FBiM+tcIfb1X3PsySgVpPulso2dRlTRNKP2HW9ENM1vCRbeKnP5o63MWbL0b+6Zx0jWbu2HIq1WVG4nyAMGeDAK2eb3WgLGYjRCfNPZssK59jEYAILHwrjPJQY5/OkFXCgXHxhCQykRfxv/ghQnjZgb5ZlPb3ESvBk14coOu8cPXk7S2zP8r/xDiOrkSmTsix3L2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuedzerudJaPSoDYsdz9DbtCtYYHPuKwklikq1KiFc4=;
 b=YNiKAuJVNfzHOlSKuG9cDxntGdgfU/zYDnAAIbzHgDIuGlU3Tc2H4Iu7YeXYXjRlusxPXUYsU9A7Y0dXhnLDZH4pVgZmrt6TrLZ94n4swUi7RCOpHvRmQF05H2zxdSGYmOEe05hrU0hqqjcXNA7bJGdX0HgwBHpjjKFGfbL5sv1SWq7xicC5lxC4kR5ojCmjZ5/RKUUv+FcJXfBOw+gU2Cnz9cmo1LVgjgeNdcMgbzu8LgfONoWglFKPO6JX76PmZd3dWu/q72rSHmhekD7HXg7+Ot5CyWvjGRtlJfSAJUPvZz0r1b4G/j+e12hEUDaWonLuuh9M8hSAgjSl2mj0yA==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by CH2PR03MB5240.namprd03.prod.outlook.com (2603:10b6:610:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 9 Jul
 2026 02:56:38 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:56:37 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?B?UHJ6ZW15c8WCYXcgR2Fq?= <pgaj@cadence.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, "NG, ADRIAN HO YIN"
	<adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>, Manikanta
 Guntupalli <manikanta.guntupalli@amd.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
Thread-Topic: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
Thread-Index: AQHdDqnjaVDlLfUcgEyPBgRRyiDt3LZjt9+AgADH6oA=
Date: Thu, 9 Jul 2026 02:56:37 +0000
Message-ID: <7ffb03e1-0f06-48af-ac9f-57058641429e@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
 <ak5mMbPlO8dCxH8R@SMW015318>
In-Reply-To: <ak5mMbPlO8dCxH8R@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|CH2PR03MB5240:EE_
x-ms-office365-filtering-correlation-id: be72bd39-f2f4-4150-84c9-08dedd65b1dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|38070700021|18002099003|22082099003|55112099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 KIN+DqCQymWu5eMQUiQvFBWNUD5d2knNpCFi/WfPeh+gyPJGc/E2ggIIKUCv/XNArU2MtuvAF5sjUNva+Ijuzd6XEkQgGrzDfgSD1171YOc3zg/j8Tn5prlXo4aazPiHYJDZRpbeREKTc4XlpOx2c+23CSJqNrqZdvtAFG3465X73Pz7AeXtlz8kVLgnkcdtcujjmQzB4kRv12WWqxhCLS5ahMX/gq+EDvCKQqNl2u4Jq9K96Ib2eiV1sAS2buIfk8ie+2f3o89pGhL+/E7G/JEybTG7dZC7jbRxJ/gGN7NEspcfnHGewIWuw7yJQ9AN9YpexX1iVriUtBd+Odx2BRG/cQ12BFN9EmFlfdPExOrmts2pALgZMvI3uKnBaQReuSxPKUNFieA8ptOCioszLwjgruBhc/dFQLIzd1ImRVZJtqu1yb/ERZTQW21pMBYVYgOXJEtQ1tpaH1eUBfvEaxqQpayTRcSOOGMGlDZQqBCTDh2/c84oHE1S/U7RXU/HTN5FYUCp2FWLBAAu5Eb5UiTiCKy2UtfJ8TYsYNOGjVpMr+sl6aTqaJwolJ+K50kqgIk5kd5FLQUZtoaNN9zVKFkchnVBkSNZIjWOxJCOlxXeflICnK17aY12B9+ol+abXHxLsmKUPZ9ChUv0GDXSCQxq2R+i5zQOwMK7ricCPm3dliShYBQJd07LFG5OQnBLLKMJsV3WMezpihywt+P9MsVzcja69FBo+19LL3a48/8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(22082099003)(55112099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1ZMdjc2ek00T3hPQ3lUeFpqODI3WEwwZVlHcWpZY1hIWFZmenlBamltVUNy?=
 =?utf-8?B?Y3RQUFE5MTJ0bDRNbHFCZlp0MkVJWWxraVNDVnRzc1NXSlIrV09iMFpGeEJr?=
 =?utf-8?B?Z3JSdmJkQWpUcFk3SDUyem12Mk5CaXVNcG5YQzBCN0VabW1KQXNZbENSdU0w?=
 =?utf-8?B?R1hQdGQrY3RnR1lSOGJaUm15allHTm03VVFCMDVpeDkzdWZSMWRuRGQxNGRB?=
 =?utf-8?B?L01rV1JtR3N6U1VLbGlVejcwdDl6RG4rMkZORmREUmJsQmlnNWk0Ukk1ZkN6?=
 =?utf-8?B?YjlhaDlNK1BRMEV1SU1vZm9RYXduMEd2b2lKQSttcTN5ZXpncm83Z282bEF6?=
 =?utf-8?B?cGxSL21UUnBDVHdVL0NXOHhiRkRscXZyUUdRejVaTVIwRjRjTTI4WmExWFJZ?=
 =?utf-8?B?RlREbGJVcFRDckFSWVFXaHhQeDQrTjN3QjViSmYrMEhlcUpjbzFoQXFoRTVS?=
 =?utf-8?B?bFVHMWVCczVNL0wydkVERDRmYjJBdHhrTWU2YzFNT3dFUkZKV28rclFEQ0U0?=
 =?utf-8?B?MythcE1xV0JWSTBGWXBEbCtWUnVkak9iK29kN1lHTml1emtIWVkvOXJ3RDUr?=
 =?utf-8?B?cGVQRDdIUW85d1VKRWFwTGhDRFBzeXRkUnEvZ05JQUJGS2FpblV1SEFIdGFz?=
 =?utf-8?B?UlEvS0RIUU5BV1FiRGRiR0gvQTNWdDlOY3A5QktDOVQwT1JZRGRQd0hYZmgv?=
 =?utf-8?B?ZGYzeFFTVFM3ZTFsbHdKdXBqc1F1eWhianJwQ1hxVW0zaTd3Q3dTSmNUMHpr?=
 =?utf-8?B?T1A4bmVMdW1KUXhrMzlsZDl5RHZDNFhENGQxbG5ZTFpPWURqdDRGWnZUcDFY?=
 =?utf-8?B?M3pROVRSRWgxcWpmQnAyaGpLMUNheG9HRlBWaksvZDBia25NVUNEb21rdzBn?=
 =?utf-8?B?RWNGTS9WdEF0eGFzL1NlZHZob09hdjZpcUg3eTFtL0UzRmpiQUQ0QVg5c25t?=
 =?utf-8?B?UlJVRkF2a242enFnS0lHdlE4QTZaVUxLOVlJSG1xM1VGekFvUlpRSkRmZWs3?=
 =?utf-8?B?SHBDTGVUY3h2NFNXSnRnN2hqUkl6Qkg2OTFXL1hPYWFseWRpSDRuTyt3OHc3?=
 =?utf-8?B?N2FnZVpXK1hheUhJY283UlczbUFhSllhNmFpd3cvZHc0M0FrWVkyLzNYMEE4?=
 =?utf-8?B?VURZcjhOc1VUeVRoSE9wODcxVDI0N0ZaaTdBK3hpNnA4UkFJQUVoejdjMC9j?=
 =?utf-8?B?ZHZvNEo3VzNuRExqOFhjVWpXWEZJdjVLNS8vTFdjSkdpQVB6N2JyZnIzcTha?=
 =?utf-8?B?cUVycnpVd2wzRG1CWDJPSzR5azAvbC9wU2hON2pFV0N6VEhJeUxGdTJkREZJ?=
 =?utf-8?B?bnlRMUdacGt1NmI2U0hXbTI4VHdTRVFXTHFmMWFabndLNnRxL0JjWVJuYStz?=
 =?utf-8?B?UytKQ1QvelVRNkkzSllFdzA4VmQ0MGFGMFppdDVFOWZ0V1ZwbVo0TnMydjhh?=
 =?utf-8?B?ZzdmRVRjU2JBdG0wR1c3OFdFd3FlTGJYTW41cEtEVWdzMzdoakhxR1JidkFy?=
 =?utf-8?B?NXNQcVRRblFUeGtpazhqMVI5bWlMQmdIWlI1WEE5QWx3SCthSFY0Y3ZmTW5O?=
 =?utf-8?B?R0UwbldFejZLTFg5bEYycEhHZC9EWjA2OXBSN08xcHJGRmRRcTlySzYweHRk?=
 =?utf-8?B?eGkrOTJLajg2T2tKempta0s0TVpSalZUQkN5NnpFbDdlOXhuSmx5SlR2U0l4?=
 =?utf-8?B?V3R1TFFEdEtXeFU5bVRhaWFFbjhPRkpScFNWUkw4Sk5JMThPVFlweXR3Nms1?=
 =?utf-8?B?NmVxUzFPbTNpazZwWG1CaWlhZStiOVBLOGhKWlg0UmVlVmJaUkxneWszRWdo?=
 =?utf-8?B?T3NnWFQyQWhHNGlNb3IwbGNGbGJsY0hTdVdZb3pVMjBNWXRXS3lieW9ZeW03?=
 =?utf-8?B?a3hMaHlyOGlyVGxpeVJ3VTMyR1prWTF2RlhnYlUrZmx6UGJCeUNsUUYydk1Q?=
 =?utf-8?B?SWU5WEVaRTVQNDhaeTN5Si9PejZ1TEcwM0VNeTRiS0ZjUnh2cEExYmJVNk0w?=
 =?utf-8?B?aE9ocHVNZnB5UmRsWU4xTGhHblAvRUFES3NjUWtPUlJiUFpYbFlqM2o1VWxW?=
 =?utf-8?B?RGx5c1pOaTVIcmUxeGFEUkZtVjFRSkJTYXV1N2FFMXNpTkcxbzdmY0RGZ2xT?=
 =?utf-8?B?R3lmSXhvdlFLNmZESklhb1N1STRGUEJJRGxzeXo1L3VTRUduM0IyNUVpcnE0?=
 =?utf-8?B?aW5NKzlkSGlnaFdsNzNiaWV6RGI1bENrWmoxdTFBM3hRSnUwbmtXRnozcVJ4?=
 =?utf-8?B?L2h6MWFDVnRJYzQ2WGErMG1mWXA3MUpBUG1YRXc0Y0tPb0tyL2I5VFFIYjhP?=
 =?utf-8?B?aXdOOFVjaS9sN2g3bjJ6YVNFYnJsZEdaZ3NCZldwaVV5MDZ2TWNoODdWclEr?=
 =?utf-8?Q?BwrGVSbkpgy2AYdY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62E18493517D72488D04187DF8C881A3@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be72bd39-f2f4-4150-84c9-08dedd65b1dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 02:56:37.8483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcs8W0kXBj4sjQ4gWY8fHRke6PspXfftW7Xa4ZBVsp/5Pr15teo2zGQEDmi7XKn9fuXcqZII3DpOZ59i1fdNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5240

T24gOC83LzIwMjYgMTE6MDEgcG0sIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAwOCwg
MjAyNiBhdCAxMjoxNzo0MUFNIC0wNzAwLCB0emUueWVlLm5nQGFsdGVyYS5jb20gd3JvdGU6DQo+
PiBGcm9tOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+DQo+
Pg0KPj4gQWRkIG9wdGlvbmFsX2J5dGVzIHRvIHN0cnVjdCBpM2NfY2NjX2NtZF9wYXlsb2FkIHNv
IGNhbGxlcnMgZGVzY3JpYmUNCj4+IHZhcmlhYmxlLWxlbmd0aCBHRVQgQ0NDIHJlc3BvbnNlcy4g
R0VUTVJMIGFuZCBHRVRNWERTIHNldCBvcHRpb25hbF9ieXRlcw0KPj4gYXQgdGhlIGNhbGwgc2l0
ZS4gRXh0ZW5kIGkzY19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4oKSB0byBob25vdXIgaXQuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0Bh
bHRlcmEuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnllZS5uZ0BhbHRl
cmEuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY1Og0KPj4gLSBTcGxpdCBmcm9tIHY0IHBh
dGNoIDMvMzogb3B0aW9uYWxfYnl0ZXMgYW5kIHZhcmlhYmxlLWxlbmd0aCBHRVQgcnVsZXMgb25s
eS4NCj4+IC0gU2ltcGxpZnkgdmFsaWRhdGlvbjogZHJvcCByZWR1bmRhbnQgZXhhY3QtbGVuZ3Ro
IGNoZWNrIHdoZW4NCj4+ICAgIG9wdGlvbmFsX2J5dGVzID09IDAgKHBlciByZXZpZXcpLg0KPj4g
LSBDbGFyaWZ5IEdFVE1YRFMgZmFsbGJhY2s6IHdpdGggb3B0aW9uYWxfYnl0ZXMgPSAzLCBhIDIt
Ynl0ZSBzdWNjZXNzIG9uDQo+PiAgICB0aGUgZmlyc3QgYXR0ZW1wdCBubyBsb25nZXIgbmVlZHMg
dGhlIGZhbGxiYWNrOyBpdCByZW1haW5zIGZvciB3aGVuIHRoZQ0KPj4gICAgNS1ieXRlIHJlcXVl
c3QgZmFpbHMgcmF0aGVyIHRoYW4gc2hvcnQtcmVhZGluZy4NCj4+IC0tLQ0KPj4gICBkcml2ZXJz
L2kzYy9tYXN0ZXIuYyAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+PiAg
IGluY2x1ZGUvbGludXgvaTNjL2NjYy5oIHwgIDIgKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jDQo+PiBpbmRleCAzYjZkM2Vj
ZDlkMTIuLjEyY2E3YzkyOWVlNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5j
DQo+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYw0KPj4gQEAgLTkwMiw2ICs5MDIsNyBAQCBz
dGF0aWMgdm9pZCAqaTNjX2NjY19jbWRfZGVzdF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0
ICpkZXN0LCB1OCBhZGRyLA0KPj4gICAJZGVzdC0+YWRkciA9IGFkZHI7DQo+PiAgIAlkZXN0LT5w
YXlsb2FkLmxlbiA9IHBheWxvYWRsZW47DQo+PiAgIAlkZXN0LT5wYXlsb2FkLmFjdHVhbF9sZW4g
PSAwOw0KPj4gKwlkZXN0LT5wYXlsb2FkLm9wdGlvbmFsX2J5dGVzID0gMDsNCj4+ICAgCWlmIChw
YXlsb2FkbGVuKQ0KPj4gICAJCWRlc3QtPnBheWxvYWQuZGF0YSA9IGt6YWxsb2MocGF5bG9hZGxl
biwgR0ZQX0tFUk5FTCk7DQo+PiAgIAllbHNlDQo+PiBAQCAtOTQ0LDExICs5NDUsMTkgQEAgc3Rh
dGljIGludCBpM2NfY2NjX3ZhbGlkYXRlX3BheWxvYWRfbGVuKHN0cnVjdCBpM2NfY2NjX2NtZCAq
Y21kKQ0KPj4NCj4+ICAgCWZvciAoaSA9IDA7IGkgPCBjbWQtPm5kZXN0czsgaSsrKSB7DQo+PiAg
IAkJc3RydWN0IGkzY19jY2NfY21kX3BheWxvYWQgKnAgPSAmY21kLT5kZXN0c1tpXS5wYXlsb2Fk
Ow0KPj4gKwkJdTE2IG1pbl9sZW47DQo+PiArDQo+PiArCQlpZiAocC0+b3B0aW9uYWxfYnl0ZXMg
PiBwLT5sZW4pDQo+PiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+Pg0KPj4gICAJCWlmIChwLT5hY3R1
YWxfbGVuID4gcC0+bGVuKQ0KPj4gICAJCQlyZXR1cm4gLUVJTzsNCj4+DQo+PiAtCQlpZiAocC0+
bGVuICYmIHAtPmFjdHVhbF9sZW4gIT0gcC0+bGVuKQ0KPj4gKwkJaWYgKCFwLT5sZW4pDQo+PiAr
CQkJY29udGludWU7DQo+PiArDQo+PiArCQltaW5fbGVuID0gcC0+bGVuIC0gcC0+b3B0aW9uYWxf
Ynl0ZXM7DQo+PiArCQlpZiAocC0+YWN0dWFsX2xlbiA8IG1pbl9sZW4pDQo+PiAgIAkJCXJldHVy
biAtRUlPOw0KPj4gICAJfQ0KPj4NCj4+IEBAIC0xMzQyLDEwICsxMzUxLDE0IEBAIHN0YXRpYyBp
bnQgaTNjX21hc3Rlcl9nZXRtcmxfbG9ja2VkKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIg
Km1hc3RlciwNCj4+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4+DQo+PiAgIAkvKg0KPj4gLQkgKiBX
aGVuIHRoZSBkZXZpY2UgZG9lcyBub3QgaGF2ZSBJQkkgcGF5bG9hZCBHRVRNUkwgb25seSByZXR1
cm5zIDINCj4+IC0JICogYnl0ZXMgb2YgZGF0YS4NCj4+ICsJICogR0VUTVJMIHJldHVybnMgMiBi
eXRlcyAobWF4IHJlYWQgbGVuZ3RoKSB3aGVuIHRoZSBkZXZpY2UgZG9lcyBub3QNCj4+ICsJICog
YWR2ZXJ0aXNlIElCSSBwYXlsb2FkLCBvciAyIG9yIDMgYnl0ZXMgd2hlbiBpdCBkb2VzICh0aGUg
b3B0aW9uYWwNCj4+ICsJICogdGhpcmQgYnl0ZSBpcyBtYXggSUJJIGxlbmd0aCkuIFVzZSBvcHRp
b25hbF9ieXRlcyB0byBhbGxvdyBlaXRoZXINCj4+ICsJICogbGVuZ3RoIHdoZW4gSUJJIHBheWxv
YWQgaXMgc3VwcG9ydGVkLg0KPj4gICAJICovDQo+PiAtCWlmICghKGluZm8tPmJjciAmIEkzQ19C
Q1JfSUJJX1BBWUxPQUQpKQ0KPj4gKwlpZiAoaW5mby0+YmNyICYgSTNDX0JDUl9JQklfUEFZTE9B
RCkNCj4+ICsJCWRlc3QucGF5bG9hZC5vcHRpb25hbF9ieXRlcyA9IDE7DQo+PiArCWVsc2UNCj4+
ICAgCQlkZXN0LnBheWxvYWQubGVuIC09IDE7DQo+Pg0KPj4gICAJaTNjX2NjY19jbWRfaW5pdCgm
Y21kLCB0cnVlLCBJM0NfQ0NDX0dFVE1STCwgJmRlc3QsIDEpOw0KPj4gQEAgLTE0MTQsMTQgKzE0
MjcsMTggQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX2dldG14ZHNfbG9ja2VkKHN0cnVjdCBpM2Nf
bWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwNCj4+ICAgCWlmICghZ2V0bWF4ZHMpDQo+PiAgIAkJ
cmV0dXJuIC1FTk9NRU07DQo+Pg0KPj4gKwlkZXN0LnBheWxvYWQub3B0aW9uYWxfYnl0ZXMgPSAz
Ow0KPj4gKw0KPj4gICAJaTNjX2NjY19jbWRfaW5pdCgmY21kLCB0cnVlLCBJM0NfQ0NDX0dFVE1Y
RFMsICZkZXN0LCAxKTsNCj4+ICAgCXJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tl
ZChtYXN0ZXIsICZjbWQpOw0KPj4gICAJaWYgKHJldCkgew0KPj4gICAJCS8qDQo+PiAtCQkgKiBS
ZXRyeSB3aGVuIHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBtYXggcmVhZCB0dXJuYXJvdW5k
DQo+PiAtCQkgKiB3aGlsZSBleHBlY3Rpbmcgc2hvcnRlciBsZW5ndGggZnJvbSB0aGlzIENDQyBj
b21tYW5kLg0KPj4gKwkJICogb3B0aW9uYWxfYnl0ZXMgPSAzIGFjY2VwdHMgYSAyLWJ5dGUgcmVz
cG9uc2Ugb24gdGhlIGZpcnN0DQo+PiArCQkgKiBhdHRlbXB0LCBzbyB0aGlzIGZhbGxiYWNrIHJ1
bnMgb25seSB3aGVuIHRoZSA1LWJ5dGUgcmVxdWVzdA0KPj4gKwkJICogZmFpbHMgcmF0aGVyIHRo
YW4gcmV0dXJuaW5nIGEgc2hvcnQgcmVhZC4NCj4+ICAgCQkgKi8NCj4+ICAgCQlkZXN0LnBheWxv
YWQubGVuIC09IDM7DQo+PiArCQlkZXN0LnBheWxvYWQub3B0aW9uYWxfYnl0ZXMgPSAwOw0KPj4g
ICAJCWkzY19jY2NfY21kX2luaXQoJmNtZCwgdHJ1ZSwgSTNDX0NDQ19HRVRNWERTLCAmZGVzdCwg
MSk7DQo+IA0KPiB3aGVyZSB1c2UgcmV0cnkgIT0gMSBjYXNlID8gaWYgYWxsIGlzIDEsIHBhdGNo
IDQgaXMgbm90IG5lY2Vzc2FyeS4NCj4gDQo+IEZyYW5rDQo+IA0KDQpIaSBGcmFuaywNCg0KVGhl
IHJldHJ5IGNvdW50IGlzIG5vdCBhbHdheXMgMS4gcmV0cmllcyBpcyAxIGZvciBHRVQgYW5kIDAg
Zm9yIFNFVCAocm53IA0KPyBJM0NfQ0NDX1JFVFJJRVMgOiAwKS4gbWF4X2F0dGVtcHRzID0gcmV0
cmllcyArIDEgZ2l2ZXMgMiBhdHRlbXB0cyBmb3IgDQpEaXJlY3QgR0VUIChzcGVjIMKnNS4xLjku
Mi4zKSBhbmQgMSBmb3Igc2lkZS1lZmZlY3RpbmcgU0VUIENDQ3MuIFRoaXMgDQpmb2xsb3dzIEFk
cmlhbiBIdW50ZXLigJlzIHY0IHN1Z2dlc3Rpb24gaW4gDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMzgyYTdjMmQtMmU5ZS00YTgzLTk0ZDEtYjkxNzkyMWQ5MWYxQGludGVsLmNvbS87IA0K
cGF0Y2ggNCBpcyBzdGlsbCByZXF1aXJlZCBmb3IgdmFsaWRhdGlvbiBhbmQgdGhlIGNlbnRyYWwg
cmV0cnkgcGF0aCwgbm90IA0Kb25seSBmb3IgdGhlIGZpZWxkIGl0c2VsZi4NCg0KUGF0Y2ggNCBp
cyBzdGlsbCBuZWVkZWQgZm9yIHRoZSBjZW50cmFsIHJldHJ5IHBhdGgsIEdFVCBwYXlsb2FkIA0K
dmFsaWRhdGlvbiBhZnRlciBhIHN1Y2Nlc3NmdWwgdHJhbnNmZXIsIGFuZCByZXNldHRpbmcgYWN0
dWFsX2xlbiBiZXR3ZWVuIA0KYXR0ZW1wdHMg4oCUIG5vdCBvbmx5IGZvciBleHBvc2luZyByZXRy
aWVzIGluIHN0cnVjdCBpM2NfY2NjX2NtZC4NCg0KVGhhbmtzLA0KVHplIFllZQ0KDQo+PiAgIAkJ
cmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKG1hc3RlciwgJmNtZCk7DQo+PiAg
IAkJaWYgKHJldCkNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaCBiL2lu
Y2x1ZGUvbGludXgvaTNjL2NjYy5oDQo+PiBpbmRleCAyNTA2ZDgzYjgyNTUuLjdhZDY3N2JhZjc2
MSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oDQo+PiArKysgYi9pbmNs
dWRlL2xpbnV4L2kzYy9jY2MuaA0KPj4gQEAgLTM0NywxMSArMzQ3LDEzIEBAIHN0cnVjdCBpM2Nf
Y2NjX2dldHh0aW1lIHsNCj4+ICAgICoNCj4+ICAgICogQGxlbjogcmVxdWVzdGVkIHBheWxvYWQg
bGVuZ3RoDQo+PiAgICAqIEBhY3R1YWxfbGVuOiBudW1iZXIgb2YgYnl0ZXMgcmVjZWl2ZWQgb24g
YSBHRVQgQ0NDIChmaWxsZWQgYnkgdGhlIGRyaXZlcikNCj4+ICsgKiBAb3B0aW9uYWxfYnl0ZXM6
IEdFVCBDQ0NzIG1heSByZXR1cm4gdXAgdG8gdGhpcyBtYW55IGZld2VyIGJ5dGVzIHRoYW4gQGxl
bg0KPj4gICAgKiBAZGF0YTogcGF5bG9hZCBkYXRhLiBUaGlzIGJ1ZmZlciBtdXN0IGJlIERNQS1h
YmxlDQo+PiAgICAqLw0KPj4gICBzdHJ1Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCB7DQo+PiAgIAl1
MTYgbGVuOw0KPj4gICAJdTE2IGFjdHVhbF9sZW47DQo+PiArCXUxNiBvcHRpb25hbF9ieXRlczsN
Cj4+ICAgCXZvaWQgKmRhdGE7DQo+PiAgIH07DQo+Pg0KPj4gLS0NCj4+IDIuNDMuNw0KPj4NCj4+
DQoNCg==
