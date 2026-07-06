Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556B3BD654
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317404; cv=fail; b=MKsvNbs8xPw6sKN3T7J2Qwgk28b1D1yDlt0DVtmV9JtQasKWmHjNkMUjVJ1ZDK6K8xivEjyC0hwj/fGLKUVCeL94ESAt+q6OBGjoYdDdTUIfNikzfOVlOfUY42Pumkh9E7NtovTLYDd8DTY6Y8Wuz8WAJs9F19oaHXb/to+ZXXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317404; c=relaxed/simple;
	bh=AoWRT7P/mBSquGCTMnOdF21CI7z+utArqoqh+5IRzT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cTwnnC4hNbjWVdpHk9plpYrWq2H+zC6nmQgNJaBxUqIwPDQVWc3/6tEi8kK8qKCHmFcrgnxseU/1CNkG+L461xsIDGHS5xW5rif6UtXw1vIuHYhlloVeDWIGdUbZWKqrCN2ZJrAlZmCEzKMPYIyt1z53dZQXZxwW5kCqSa941iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=jSsyROUO; arc=fail smtp.client-ip=40.107.200.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="jSsyROUO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3Jk8idmFU/4bv9gVETzjpRiR8yYDng5nvZOtOr9+qNoBkct4EDtSxvdoFZL8kbETEBG2XpP6NfWYqKF4PNmyrVdmkSLy0k8N0r8QMBf36qdDviWaEt3F8AWnWU0qiepIXhrD9OQDBK53UNJ+wlxo8G/ULup3gXcE8mTSWMmM6FsRSRaVW4r+6S+WW5lCRgFBWqgunu77vMUWH3rLHLpkQnhSEf6gKGKSgCKLwDUQR65bndrebpnS2uTHAiu2n4/ocSaEy0zy1ZXwLDx8S4fqyC5sUzxig0FDAxgwG9ReeZo1MP9+xAB5O1GayVdgrFH4521K1JodOmuNCkY2BLNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoWRT7P/mBSquGCTMnOdF21CI7z+utArqoqh+5IRzT8=;
 b=lRDCQiXa520/ncybYHdRLyjws4B4ZWJ2rfj6XoD70KJoyLcEEEd62ydqeB7X+fbE1aEfr0Bx5GnCmcjZy/kQK/WuY3Q2x1aa183JzwGMiP9KucALJUzlQDdhwpas9m16cQn8FdLNfl4WgupUTa3/qkWcKXcE6C5CyKBIVyfstkS9u4htfqRtbs0sLRwenNgKmJJHqppKxg/f1cBSiLs5K4kcKjdhLftM1zMjY92XkJiHS/ue9eSbtl32C3n/Bet2DBhQ5VhrC/cYBIqIREP+oX3ujhyobL1zV25TPyWWFb3cwOBe/q1tgVqy+yqd4ZJ9AjMEobU9pxu4nh7SvNyiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoWRT7P/mBSquGCTMnOdF21CI7z+utArqoqh+5IRzT8=;
 b=jSsyROUO8bzhOBWXr7708sVQ/sljd37z00pgMxWKh9IO7tRM0/qoJ7T26WT+36a3njSf682V7Km1KNhtDeBG2DQBc4mOO2vZE1XkjuOEdPVrXRci+yRATsQLV8u4oztbagv2QzSaJ8yP5qmfEOiSSSjL/J21yVip9MYBfzNzK63pmR/VZk/bQYWlKugCR93xxVtnm8NugkplnwTotd5lHNXJCfMJs2/750pCjMSDHgPKJCsp6ylZIKUw/YPyqWYWUjSV62yCwLVSZt7emULzGmk1P3fiPVRI4si2BrKBh7gDuFE6j+RORJl8DWz3o9te77COH6kRJRspXSy0HItPSg==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by SN7PR03MB7207.namprd03.prod.outlook.com (2603:10b6:806:2e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 05:56:37 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 05:56:37 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Topic: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Thread-Index: AQHdCtnjnz0nRNJUy0KvJZeMk+WUf7ZboFcAgARiXQA=
Date: Mon, 6 Jul 2026 05:56:37 +0000
Message-ID: <eceadce6-8782-4cb9-b3af-c5451c20cb93@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
 <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
 <20260703105931.103B51F00A3F@smtp.kernel.org>
In-Reply-To: <20260703105931.103B51F00A3F@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|SN7PR03MB7207:EE_
x-ms-office365-filtering-correlation-id: 827efca1-d328-464f-8651-08dedb23578d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|3023799007|22082099003|56012099006|11063799006|18002099003|4143699003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 9umkDa6eKluc9kZWAPpuH4WRsJVhhkGSNMJouiKStxbdnbvAfb+D5jpj8jfXGL+Lb1zMG0TD9leejUQdhYsc5TCMnScMu9gHW4M+oqKcbdZbySQnDM4VQL5SNP+8oNrp1SI9nIWrBfLV2BhMVcDQsAXT06oYW079DE/HAURbTKEq6ZRLLCJEs1PLGQ0wGyTUh/R6vXrUa4U/uGaR/6U+Q0KUZBtGIieRhpd4NeZwmqmPN/zbdZ9HHnSPjbEKSMctP4OF+p5DT/7A6W7VifRxCc2KIE8PRksSwHF6RE+DuA6LKGxXPwBoO7F31UHtrUNNjA03y1zBK8hlQphzB36Wzm58BR9GVYdIGh1/OsJDqeM4rnEExKoLjkMKQFQ0F/W7KBdGgx5rdEV5cddhdj14g675ruSOWGc1KpiDC3jZ94xVEzNavwN1IoI1tukIHQHpoHaV6NfvCWemad9vzldbe0qLLwN3IJpuDF92q63Ed4fR9UzcYqJFl8OctLWxLQC7RwhfTOiSQ0jl6wGXaUPXBk6ZVaCtyjiBNPj94oQSHGeMB9bU6bK1MynVvEilXr06la/F2N+lpUqP7tyzt7Cnewi7XcI1Tq8VYSED7kgrwQpYP5TJfpPTOZu8QTSX4vMbBwkPztuzyGS+Judpjui7V7PN8lVHJWfIci9xeOu7gfmsfbNiA8ZNjCUvS75g28P9d7VsIWqfSZEo07YCTL7Mzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(22082099003)(56012099006)(11063799006)(18002099003)(4143699003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzdDRUZKY1BKUHpZOFl3YkRnTDByS0cxZVJXUnYrdnlmM2YvVWtod0ZmYXdE?=
 =?utf-8?B?cnBGbWlPRWxLZHpzMm9aSFU3ODhaTjBzU0NCVURJbmRHYXhNME1vV3kzVU9j?=
 =?utf-8?B?YXRraGJoYjdTWmtodkp6TGxkMkdUb0lCdVFRUk0xYmxuUFJGamllUWIyZXcw?=
 =?utf-8?B?T0pXMnpRMEk5UUQwWk1YMVRQV2NrdDVYU2R1MFIvVk9RUDRTYXdYRmZJaEJV?=
 =?utf-8?B?Y0dkYytqVEg1K0xqY0Z4U1grUnZ0Umt5cUhlME55RXlvUm5jbFd0TEdibVRO?=
 =?utf-8?B?czdYOUpuajc3QzdWWjg1dDhXTlMwbHd0ZEdCc1QzQ3JtM2E4bi95WlRFbUV1?=
 =?utf-8?B?UzZEK0ZKMkJzODJmdFV2eFhudXE5TmZhbFlST2cyYVFjVE9jSTNDaFN6bEs3?=
 =?utf-8?B?QmhMUTdZTlhKN29FdFM4TnJOdGtvbU1kT1lPTS9aM2NhZUgwS3lqYW9mMTBZ?=
 =?utf-8?B?MzBRRWc2NjRGaGFFTmRpRUtDQTlvSG1WNFhXUFVpS21NNVJXRk1HYmJka3hB?=
 =?utf-8?B?UkZod0xTN2FpZTRDeGptT04zNm9wWC9hejAzVHpxL255b0VLUXBNYTZzUzBs?=
 =?utf-8?B?NnQwYzhxa0lWOUM1UmZ5SVBPUUVHanVUNjE1TEFDWWpDZE5OczYvZENLdUZD?=
 =?utf-8?B?Wmhkb2dhUzhVVW1ybDRXaU1kQVhJUVVCK2dBaG51a2hrRFFKWElIcmd6WnlD?=
 =?utf-8?B?ZWxRSXVzTWQ5cUVtQksrbGg1dGNpaUpPUnA0VzlEeEFUN1dWcVhUYTFKT0VC?=
 =?utf-8?B?MFRJSnlsa3dGM1JvYlhBTDBQaU9qL2NDa200ck1wU2JwZ2hvaGJYbjBlUXJ6?=
 =?utf-8?B?Q1Z0YXppbWRzUHVLakFKUmhxSHBDajJpTGUxamtKdWFaS3hxL2F5NFpQZGFI?=
 =?utf-8?B?c05pZENoUEJzVUVvQ1hZOVlPdkh3L0xNOGpXOUlJRlN4a0orUnJENUM0aldI?=
 =?utf-8?B?VWpETHErTW9kZHZQNnRFVXhaSGxPWTVWZCtNMGdqamFIajBBSDYrZVNnWGcw?=
 =?utf-8?B?VVFvdXZ4NkVnSnpRcWZQWXJjYlZpN1NvVkdsYUd6THo4MWIxVzdjTGMreFhE?=
 =?utf-8?B?WGN5MEcvcEI5VjZGeURlSVFSRUNCTmZXMDdWMzJ1aXBaOXhubnBNSkdwVmt3?=
 =?utf-8?B?anNDQXZ5WVlJNHA1RkIxNHpBQ2ltd244aWJ2UlZlZzBYUVBQc1k1TGU0YmZp?=
 =?utf-8?B?T0s1WC9JN2Jma1FYMVN0bUsyOWNraVdxREFKSHFDT3BUWXRWWE1ObzBQM2p4?=
 =?utf-8?B?NEU5WXhyUWk3SEpmcGxVMlowOEg5dDV6WkRoR0VLR0tJQm9ZWUdJcmxQTUZh?=
 =?utf-8?B?c01BcGsydmlBdzUvNEdzYXRCSEl5NnJkTjQyc1hjb0Z3dGtzaEJVL29tNkU5?=
 =?utf-8?B?WFB5SU9hdEpqMFdBb1FuSzFER3hZUHNudU15d01RdDFCRVpVbXBjVGhINTZX?=
 =?utf-8?B?QWV0NkdjamYyRkpycStiKzVlV1ZmUGtDTHlNTG1oRFNGZlRMOXY2UmpCVlZm?=
 =?utf-8?B?V2dEL0VtL2szZVJyR2NKL1RGRSthUWVYVGxZQmNzQktJL0p3dlhwVjdFOUdo?=
 =?utf-8?B?cFpPUHcweVQrOEpZMmQ3bXY0Y1dCQjFQMktWOWZMc25QSFBUVVZVUkVrOHlD?=
 =?utf-8?B?RXZvS3lDOG8xTUI3alNWNGxVdktya0dHbjJJR3ZteFBVWU1JSURaK05sZyta?=
 =?utf-8?B?MTFlQTRQa2tHSGZYVGZLWEEzaDlCMnJ4YlB4T0JaODJVYjNUMXhBS2VUSTJP?=
 =?utf-8?B?RTdacmFjSVRvVjBtK1NhZ3V2cnpWQlRRVzBxRGlCTGZtNWJvM2tQQTZ0UFhQ?=
 =?utf-8?B?c21PRjlFa0NmVlB6d2RwSTJrN3dUdWtYejVvd05lWGdoamZrWTFvYzljVTN2?=
 =?utf-8?B?bmZrbXhDVVBMUU40U2lVaHUveWk1Q2ptcEZ0clJJaGxRbUVwYXIyMmtvbnM3?=
 =?utf-8?B?dWlyenZYTkg5MjQwWTdtc2FnaE9Sb3dxZEVvb3pjVUFNVFlJZG42UHhlSmw1?=
 =?utf-8?B?Qms0Z1Baem1FVnZrcG4wWkZhMkRxYm5ySjkxUzEvVUZpZ09DT0M3dkhMQTA0?=
 =?utf-8?B?N2FVbitScUkwUGVYVkVwS25iVTlXTVFaTjl1QXJRVmE4TEhhVG5SSE9jME9U?=
 =?utf-8?B?MTdOVmZtNnIwbERxNFppUlNhMzVrTFdzRi9STE1uUkxnaDJKYTdiQ3NRQ01P?=
 =?utf-8?B?Wk04Tm9EQk5yR2dLRUUzSFFzd0h2WW9BOTBaZ3N3NjBwRy9jMUVudkRqWVRx?=
 =?utf-8?B?enVrb1JWdVQwMFRZbGdaZENBak1NTkNEbHp0R2V4cUE2ZFdMWWR0eW1FdSsx?=
 =?utf-8?B?SEQ2RkwxT3FDVk0wNmR2QndleVErQlZiZjhxM1FsRHNNcTRBd2JTcWNTNWZ3?=
 =?utf-8?Q?aKBkgEpgTci7y4bA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3320D889D10554CA33B342CE50D7102@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 827efca1-d328-464f-8651-08dedb23578d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 05:56:37.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdVtyzy7X7sC5h7kFbw8F+sSEEGKmRtBYWrNDFgTFLaTAMbXojhDGWkEKa6hvR/Ieajd+FNwbYaJvSYmcoVFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7207

T24gMy83LzIwMjYgNjo1OSBwbSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gZHdfaTNjX2NjY19z
ZXQoKSBmYWlscyB0byB1c2UgZHdfaTNjX2NjY19tYXBfZXJyKCksIHJlc3VsdGluZyBpbiBpbmNv
bnNpc3RlbnQgTTAgZXJyb3IgbWFwcGluZyBmb3IgQ0NDIFNFVCBjb21tYW5kcw0KPiAtLQ0KPiAN
Cj4gY29tbWl0IDBjZTIyOWIxZTg2ZjQ4ZjhiYzc5NDMzYmVlMDhjN2RhMDkwOWJhZDgNCj4gQXV0
aG9yOiBBZHJpYW4gTmcgSG8gWWluIDxhZHJpYW4uaG8ueWluLm5nQGFsdGVyYS5jb20+DQo+IA0K
PiBpM2M6IG1hc3RlcjogZHc6IE1hcCBDQ0MgaGFyZHdhcmUgZXJyb3JzIHRvIEkzQyBNMC9NMg0K
PiAgICAgIA0KPiBUaGlzIGNvbW1pdCBtYXBzIERlc2lnbldhcmUgSTNDIG1hc3RlciBDQ0MgaGFy
ZHdhcmUgZXJyb3JzIHRvIEkzQyBNMC9NMiBlcnJvcg0KPiBjb2Rlcy4gSXQgaW50cm9kdWNlcyBh
IG5ldyBtYXBwaW5nIGZ1bmN0aW9uIHRvIGhhbmRsZSB0aGlzIHRyYW5zbGF0aW9uIGFuZA0KPiB1
cGRhdGVzIENDQyBjb21tYW5kcyB0byB1c2UgaXQuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNj
LW1hc3Rlci5jDQo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+
PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+IFsgLi4uIF0NCj4+
IEBAIC03ODEsMTAgKzgwMCw5IEBAIHN0YXRpYyBpbnQgZHdfaTNjX2NjY19nZXQoc3RydWN0IGR3
X2kzY19tYXN0ZXIgKm1hc3Rlciwgc3RydWN0IGkzY19jY2NfY21kICpjY2MpDQo+PiAgIA0KPj4g
ICAJcmV0ID0geGZlci0+cmV0Ow0KPj4gICAJY21kID0gJnhmZXItPmNtZHNbMF07DQo+PiArCWNj
Yy0+ZXJyID0gZHdfaTNjX2NjY19tYXBfZXJyKGNtZC0+ZXJyb3IpOw0KPj4gICAJaWYgKCFyZXQp
DQo+PiAgIAkJY2NjLT5kZXN0c1swXS5wYXlsb2FkLmFjdHVhbF9sZW4gPSBjbWQtPnJ4X2xlbjsN
Cj4+IC0JaWYgKGNtZC0+ZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spDQo+PiAtCQlj
Y2MtPmVyciA9IEkzQ19FUlJPUl9NMjsNCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBTaG91
bGQgZHdfaTNjX2NjY19zZXQoKSBhbHNvIGJlIHVwZGF0ZWQgdG8gdXNlIHRoZSBuZXcgZHdfaTNj
X2NjY19tYXBfZXJyKCkNCj4gZnVuY3Rpb24/DQo+IA0KPiBJdCBsb29rcyBsaWtlIGR3X2kzY19j
Y2NfZ2V0KCkgd2FzIHVwZGF0ZWQgdG8gbWFwIE0wL00yIGVycm9ycywgYnV0DQo+IGR3X2kzY19j
Y2Nfc2V0KCkgcmV0YWlucyB0aGUgbGVnYWN5IGhhcmRjb2RlZCBjaGVjazoNCj4gDQo+IGRyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmM6ZHdfaTNjX2NjY19zZXQoKSB7DQo+IC4uLg0K
PiAJcmV0ID0geGZlci0+cmV0Ow0KPiAJaWYgKHhmZXItPmNtZHNbMF0uZXJyb3IgPT0gUkVTUE9O
U0VfRVJST1JfSUJBX05BQ0spDQo+IAkJY2NjLT5lcnIgPSBJM0NfRVJST1JfTTI7DQo+IC4uLg0K
PiB9DQo+IA0KPiBXaXRob3V0IHVzaW5nIHRoZSBuZXcgbWFwcGluZyBmdW5jdGlvbiBoZXJlLCBo
YXJkd2FyZSBlcnJvcnMgKGxpa2UgQ1JDLA0KPiBQYXJpdHksIG9yIEZyYW1lIGVycm9ycykgZHVy
aW5nIENDQyBTRVQgY29tbWFuZHMgd2lsbCBub3QgYmUgbWFwcGVkIHRvDQo+IEkzQ19FUlJPUl9N
MCwgcmVzdWx0aW5nIGluIGluY29uc2lzdGVudCBlcnJvciBoYW5kbGluZyBjb21wYXJlZCB0byBH
RVQNCj4gY29tbWFuZHMuDQo+IA0KPj4gICANCj4+ICAgCXJldHVybiByZXQ7DQo+PiAgIH0NCj4g
DQoNCkhpIG1haW50YWluZXJzLA0KDQpTYXNoaWtvJ3MgY29tbWVudCBpcyB2YWxpZC4gZHdfaTNj
X2NjY19zZXQoKSBzaG91bGQgdXNlIA0KZHdfaTNjX2NjY19tYXBfZXJyKCkgYXMgd2VsbC4gSSB3
aWxsIGZpeCBpdCBpbiB2NiBzbyBTRVQgQ0NDcyBnZXQgdGhlIA0Kc2FtZSBNMC9NMiBtYXBwaW5n
IGFzIEdFVC4gU0VUIENDQ3MgYXJlIG5vdCByZXRyaWVkIGJ5IGRlZmF1bHQsIGJ1dCB0aGlzIA0K
a2VlcHMgY21kLT5lcnIgY29uc2lzdGVudCBmb3IgY2FsbGVycy4NCg0KVGhhbmtzLA0KVHplIFll
ZQ0K
