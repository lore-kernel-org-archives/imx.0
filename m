Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732E1A275
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352841; cv=fail; b=TA/Xw0u97y/pPWnpeN4Z471nKsfqjRxifu5LVH4brxIhhZ89axgXru0Kq2tHKAuWt35oSzzGJW+VOmykIn49bEa1zX9C0yijkwPp/Q1NSiSLm9ZGqkDXfPuzf/0sK1tbIM4WXD8bsZ8HsjPb9AlQNn26qr+tiuw3rZJzPKb/JCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352841; c=relaxed/simple;
	bh=Qo20rYFWy6i6KxAC1QgWmg8uCj1CvJbn8gJ0L3nY4ak=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W/Y6wtoyjvhrI8+JwbIxR2DH4P1xXlbUTGdhoDinfRS5ibdNYHDLpGug0RM/sB5y+kQwmUCNQ47XnEKRf2BVV2g/vuwhzRL42s7zLKO94JGGqnpq4fdWZdmLeXW4W2vlLYgwjfnj0dYy/tRoZK3XcKoadqag7EGK0TjxfZ+G+0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FpEJJiiA; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FpEJJiiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1fDYLvhbw1ZxuCG2rjnASiQKge4LerQD9lIHHkEvgcxzBVdzTAYQ82PD+meOG3tJnsWc3+g4N7ArCl6Hy93eMlewPsWfY9rPpXVPpx462PdH1eiTjAi2UC/7KwM7QAxyaoAZYeFZ6ln1FbgaVjkD1H7N9y3bt1sTqoNzGXwLlNkB4aXt76KNzp3yZRIO5BOJt1+GT8KMKpiLlIdVbg6afEvXPlbrYKlxE/qyTf+skXP1vdmGVzu1koPXSS57zcyYoRLcti9N5oHmiSnPdas4M0RxwalYz4ADVkDGm4GL486+IrEBkXW+aSZdBtVddwJK2PN0wCxh0NRUYKQuyeLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo20rYFWy6i6KxAC1QgWmg8uCj1CvJbn8gJ0L3nY4ak=;
 b=bJILbYM/EPQiWpb+ADFPiHu6YEMx1wGwxKcjDI0224nV/ap7/IP8PLnovYjILW9G/HYCANeLUuaIspmmnrDlRs4Wjs9szjoWEGldyIFF03BoiXf6GzofRoti018rfudfpgP+hjHQfoCU2fyBe0t+QLxKQjUanwHO0U/cUqFI9EW1CiqOjJhbtgMQ/PvOam1Md0MttMllzzlpdBuyEeFyCzr1eGh10izg50j6Hhm8Ck8K4jfXjYusAVGOTgaCPtS/VziogUkbkUbcLhLAbODoEtfM/hySp9myXHBUZ3DzE85bSbTXRMmWkFJhcHgalz++XLLkqZ2N/fc9/47mrlD9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo20rYFWy6i6KxAC1QgWmg8uCj1CvJbn8gJ0L3nY4ak=;
 b=FpEJJiiAyv422/HDeSOK/nBtucZVGmTNK+GRPhePNEa6oox+96kg6guUwyRrfZzJ+oNgembmhuqB1e2WI7eidPZF7WyBbBAi37MK7h9JEvsfQvDSuE0AclK4KUE7evtMklukb97qlWgimvxtvjL/0MwckInqoVFP5ECdxEhOXvZPBJc+m1gUQVKHxO4R0UBuuiiI1/jrqphK06svzTQGRWM/OdTIIHKcqqxA9QX7ErAZAsWvJaYO9HDRwjqL8ZDBXGgE4KhDELDQ0SE02uqGa5+nfvGJagCmsDAjD32zbY8NhT4o5u0YASxSjhYhSkaMIZP48cjPiJuW2xNJzrgcRA==
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 08:40:36 +0000
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51]) by AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 08:40:36 +0000
From: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
To: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PACTH v2] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Thread-Topic: [PACTH v2] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Thread-Index: AQHc6P1+9TGcgn7i/UyZYzHOXyXmCA==
Date: Thu, 21 May 2026 08:40:36 +0000
Message-ID:
 <AM0PR04MB68021F0CAA9BE97549D91AF8E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
References: <20260520090910.2879570-1-carlos.song@oss.nxp.com>
 <20260520095719.7ACEB1F000E9@smtp.kernel.org>
In-Reply-To: <20260520095719.7ACEB1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6802:EE_|AS8PR04MB7591:EE_
x-ms-office365-filtering-correlation-id: 2b3e7bd9-9994-411b-f4f8-08deb714a16d
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|18002099003|22082099003|56012099003|38070700021|4143699003|11063799006|3023799007;
x-microsoft-antispam-message-info:
 dWAw9JDd/AIVfHjiA9b98c5v7DnvcTvwvsLN1DRFJJfdoeN3ik2BtOPZAaPsT3VlaP9nvbCnkuY6UlFz11M9/ELhT7oTCkILfJv3+8HIpLA/nXsgM2dVC0PwplhgG30taxokDvpRua82NCy+VpMhGeYjRMBGm/6ztBFToJBV1V1Ld/ssQUh35rrJDjdZ2xXQ5FVttF11DuetA6OWxkZHZRkjqev5iRziVgRvIaiyM88Q5uK97MUW6Hxbm149QqJmHhUZBfK35wBIM1P4FWIFRUIPyTvwYG2s/sWrD73cStT86sDO8bXXM3wSzrBeDqACDPtnSOCJO3EPTD9Wkx8abjrY63DulqpS2SEVW/CNaClbeQAOdbjjXaE60HTGqInbkFKgf1pZFpGrW7zUReoVwWTJaWQbxH2EHf1ldyRONSIoohPlbdXuJsm/n4L9aUfzvD+wdTiz7neaLRysTYZUWE1l0t+rPCkkcjOdNK1fLF/7RYOT+zMF2OKN7eWOYs7/qPEIOEdHeFulgBfPrCj2Sr8y/gBL5AKfSTteL6S1ftBQl5iL96lHW2kwCPGCKB/+qZt8HSJR27Rg7petAq9m6eviPjfB94ZazUCK5VOIAPE2owBqg6nCd8qC1v2zsxle0OtN29sP30CQlJJT9QfoyscFhWp+2s8amtldOZ5cI2ULeuh4Vk8o1WA3eP2XRoJv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6802.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38070700021)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmxTaDdtdUE4Yk5iTU5EUmw0WTRVQ25NWUh5bzQ3N3FiZTh6TTFYeWlDZEJE?=
 =?utf-8?B?dUpGMFVVdVo2MTRzT2I4aEt2RkxicE9QMHF2TU85MlVMcHhmRU1XTDBpTUkz?=
 =?utf-8?B?OWZRcVJnVWZXRXlEQ0hPdVZMOXlBUEx2Szg4ZHQ1Qnp1azQwRmxNSmlUUUI0?=
 =?utf-8?B?eXYvbmp1MnhUdTN6dDF4UmloOEQybzhnNkFxUVByZUJXZFpTREN3UGcxY1pw?=
 =?utf-8?B?d0d3d1VFUGRWMVhnWHViSUtjZkxHTzBLclYwQnNCbmViaTY3YlhKcm8rOGx0?=
 =?utf-8?B?MFFyV1R5cEdmZURETzBwcFBGdVNQeVoydTVTbWc1Q1V3S3p5aGZuWTlXUmxW?=
 =?utf-8?B?dWk0eWFPZ2tjbHhQMjJXWGJrT2hvUnN1MjNOcVorMkNHSFFNQWhxWElBTDFj?=
 =?utf-8?B?WjdNWUJPMkhNTUNIY1Vsd2pEc2lDYlJoRDVMMUtpblA4QW1wc2JKNGZQdXRy?=
 =?utf-8?B?TC9NYTlnWng2cVNXZitkc2NCOEMzRjQvOG9tdjlISEs0T2V3YTE3R2lhUzdZ?=
 =?utf-8?B?UXNKU3U4RDZLMGRNbHdTaTI1L3dpUjVhd0YwS1IzMkdXd0ZGYzhidTg5TnRS?=
 =?utf-8?B?ZEZ2b3RSelhaclFMYTh3aE1aT2g4cmJuZWZaQzhoOHRLbGtwTGpwOVlSeVhU?=
 =?utf-8?B?Sk1YVyt6dlg2eDJHbS90WDlIUnloTEpKRFRRanhiVzVCd0lTUzN5UGcwcTZv?=
 =?utf-8?B?QkM4V3Z2bW5oVUJ6WGpHNnlnM2hVTS9wL2NWWWlHaE1RVmZjOEVqTnRtbGJY?=
 =?utf-8?B?SmZPRThzRlZMdkpHemtoU2tqQ2s5VUNVN1pLTHVNWThGM3c3WWVac1RXT0lm?=
 =?utf-8?B?S3RlYVRzam1CTjdObTR3ZXE3RXhvSXBoRmtUUCt5dmZVWmQ4NkpkMUxSWTh4?=
 =?utf-8?B?bUc0azJBVFA5K3BPQ2NEUXNFTUhjMG9VWEEwbmE2ZDJHb3dRUFZlVys4ck81?=
 =?utf-8?B?MkNpV1dRNkU4RG5DZzJGbUh5cnJSZUl3SFBxN3c4ZUFlRkFna0dOTm1abXVw?=
 =?utf-8?B?RkV1VzMwK2NqNC9VWUkxNTFWNTlwSExUcWd3WjBKczl2bEdCcHBWeEl6U3J2?=
 =?utf-8?B?VjVIRDg1TEpPYVI4Y3R0VEZuZXpRRy9TTWllelQ0U2RlUzhwd1JYdDRXRkp5?=
 =?utf-8?B?a1A3dytDaC9mSjJJVlhWTVlLei9TTkVoNWJjc3kyVTdIaW1iSjdUTjBhNkRR?=
 =?utf-8?B?NzBPRlZSMHBxb0RqdDFCZVNrL1JOWW5lMFFwTmlhTjhRSVFHOXpSU1kyaW1X?=
 =?utf-8?B?d0liREgyZ3J1RExNdWo2YkRLa0RBdHEzN0pDeHZpUEp4MVBxcjZvK1oyZHRt?=
 =?utf-8?B?aW4rbFRwN0l0RFVKWXFRbDJKTEp3alYvQWRESFBQSUhtU3lDaDhJUWVha0FK?=
 =?utf-8?B?bWpEdVJWSzVYT1pIcDNrLzd0RmtQeDhLOFRBd2lrdlZJL0s0TDdwS2JLMWJr?=
 =?utf-8?B?UGZrK2NoNUFpRk9OcHh5RFhKLy9FdFR3NUJ5RnNlYTNrOXprZlFUSDhrd1NX?=
 =?utf-8?B?dmVPOUtTK25OdGgvRVF0dkdvclAvY2hVK2M2Zlp5Y1B1ZWtEU05hanYvZHVa?=
 =?utf-8?B?VlFoS1NnbGNmNW00eXFsWm8weGpuR1pUMFl2RGZpRFlGd1RPS01aTlp0OU1I?=
 =?utf-8?B?RWFOWnB3MnJPMGNyY1BxdVhMNXMvRnB0dzhiOHBPSkR2MjlpZU5WclNyT1pF?=
 =?utf-8?B?N3JhYnpGTjhnc3BnRG1WOUVhQjU0SkE3ZG1WczBld2xIWDRmL1RsSW5hYTVm?=
 =?utf-8?B?a1c0elZHTUJFK2V1c1g2cFQydDRRVWpyeWRKSWpuclZaZjI1dnBCeENaUUZm?=
 =?utf-8?B?RE4vV0d4ZzlLdndhQ0NpQXk4UUc0bDJsVkY4MzZSUWRFYUhtM2JXYlJjVy9Y?=
 =?utf-8?B?Y0E4UmowK3pXWkE5SlY5alhMaW13QTZzQ2lFZGZNcnh3cWFXN2I0aU4rSk9s?=
 =?utf-8?B?ODY3N3BqbUhLSkpBbHBkekVVY1YzRUdCNU1MUytPU1drNFBwejVhQ2ZYZml0?=
 =?utf-8?B?T0xGL1dXbVZ2VHIzUzFWd0dPSmxLSlRMd1BHZmVBQjhzZWx5R0owWVhKazlr?=
 =?utf-8?B?QXBxZ3U0Q3JRbzdRalBuMWtXejN3OEFJZVh4TUdtZDVvZkE4WXp3ZXZzTWRq?=
 =?utf-8?B?bmphL2ZZendvQkRKTUE1YnFuRlJWQXI5eXNzWnJpdzFYdGxMbVpnNExwdWxC?=
 =?utf-8?B?QlRUYUk1cXcvZThQaHM2dG1qQm9UNjZCVGc5ZExieS9GYUlCU1ZFTm1FMFFQ?=
 =?utf-8?B?cWpicHNjUG9ZUFBhNll6T3UzNkIyNnVIZ2pvZUJXZ0tLTm9ZZ1RIK2RNMHVH?=
 =?utf-8?B?NXhkV2t4MWViSElkd2p1NHRJTGtaMk16anQyUmJCeE1hSm1rOU5HUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6802.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e7bd9-9994-411b-f4f8-08deb714a16d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 08:40:36.8397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYYsf7QbNwd+HwQwCbOu8uM+lxF3A92l6ZlPTFUoeVhQ+LpE0UBVnr0e2YmYdDnZxt1otjufRVABwIF2XF6Udg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkg
MjAsIDIwMjYgNTo1NyBQTQ0KPiBDYzogRnJhbmsuTGlAa2VybmVsLm9yZzsgaW14QGxpc3RzLmxp
bnV4LmRldg0KPiBTdWJqZWN0OiBSZTogW1BBQ1RIIHYyXSBpMmM6IGlteC1scGkyYzogbWFyayBJ
MkMgYWRhcHRlciB3aGVuIGhhcmR3YXJlIGlzDQo+IHBvd2VyZWQgZG93bg0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBwb3Rl
bnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IA0KDQpIaSwNCg0KVGhlc2UgMyBpc3N1
ZXMgSSByZXZpZXdlZCwgSSB3aWxsIGFkZCBmaXggZm9yIGlzc3VlMSBhbmQgaXNzdWUyLiBBbmQg
SXNzdWUgMyBzaG91bGQNCmhhdmUgYmVlbiBmaXhlZCBieSBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvaW14L3BhdGNoLzIwMjYwNTIwMDkzMzIzLjI4ODIwNzAtMS1jYXJsb3Mu
c29uZ0Bvc3MubnhwLmNvbS8NCg0KDQo+IFByZS1leGlzdGluZyBpc3N1ZXM6DQo+IC0gW0hpZ2hd
IEVycm9yIHBhdGggaW4gYGxwaTJjX2lteF9yZWdpc3Rlcl90YXJnZXQoKWAgbGVhdmVzIGEgZGFu
Z2xpbmcgcG9pbnRlciB0bw0KPiBgaTJjX2NsaWVudGAuDQo+IC0gW0hpZ2hdIERldmljZSByZW1v
dmFsIGxlYXZlcyBjbG9ja3MgZW5hYmxlZCBhbmQgbGVha3MgcmVzb3VyY2VzIGlmIGFuDQo+IGF1
dG9zdXNwZW5kIGlzIHBlbmRpbmcuDQo+IC0gW0hpZ2hdIERNQSBjaGFubmVscyByZXF1ZXN0ZWQg
ZHVyaW5nIHByb2JlIGFyZSBuZXZlciByZWxlYXNlZCB1cG9uIGRyaXZlcg0KPiByZW1vdmFsLCBs
ZWFkaW5nIHRvIGEgcmVzb3VyY2UgbGVhay4NCj4gLS0NCj4gDQo+IGNvbW1pdCBlYTc5ZGM0Mzhk
OWZjYzVkNTg4ZTcyN2ZlNTJmOTI1OTA3MDA0YjU3DQo+IEF1dGhvcjogQ2FybG9zIFNvbmcgPGNh
cmxvcy5zb25nQG54cC5jb20+DQo+IA0KPiBpMmM6IGlteC1scGkyYzogbWFyayBJMkMgYWRhcHRl
ciB3aGVuIGhhcmR3YXJlIGlzIHBvd2VyZWQgZG93bg0KPiANCj4gVGhpcyBjb21taXQgbWFya3Mg
dGhlIGkyYyBhZGFwdGVyIGFzIHN1c3BlbmRlZCBkdXJpbmcgc3lzdGVtIHN1c3BlbmQgdG8gYmxv
Y2sNCj4gZnVydGhlciB0cmFuc2ZlcnMuIEl0IHJlc3VtZXMgdGhlIGFkYXB0ZXIgb24gc3lzdGVt
IHJlc3VtZSB0byBwcmV2ZW50IHBvdGVudGlhbA0KPiBoYW5ncyB3aGVuIGNsaWVudHMgYXR0ZW1w
dCBpMmMgdHJhbnNmZXJzIHdoaWxlIGhhcmR3YXJlIGlzIHBvd2VyZWQgZG93bi4NCj4gDQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlt
eC1scGkyYy5jDQo+ID4gaW5kZXggYTAxYzIzNjk2NDgxOS4uMDFlZTM4MTMxZWYyZSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ID4gKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiA+IEBAIC0xNjM1LDcgKzE2MzUs
MTggQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZA0KPiA+IGxwaTJjX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTE2NTUsNiAr
MTY2Niw4IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gbHBpMmNfcmVzdW1lX25vaXJx
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgCWlmIChscGkyY19pbXgtPnRhcmdldCkNCj4gPiAg
CQlscGkyY19pbXhfdGFyZ2V0X2luaXQobHBpMmNfaW14KTsNCj4gDQo+IFtTZXZlcml0eTogSGln
aF0NCj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhlIGVycm9yIHBh
dGggaW4NCj4gbHBpMmNfaW14X3JlZ2lzdGVyX3RhcmdldCgpIGxlYXZlIGEgZGFuZ2xpbmcgcG9p
bnRlciB0aGF0IGdldHMgdXNlZCBoZXJlPw0KPiANCj4gSW4gbHBpMmNfaW14X3JlZ2lzdGVyX3Rh
cmdldCgpLCBscGkyY19pbXgtPnRhcmdldCBpcyBhc3NpZ25lZCB0byBjbGllbnQgYmVmb3JlDQo+
IGNhbGxpbmcgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpLiBJZiB0aGUgcG0gcmVzdW1lIGZh
aWxzLCB0aGUgZnVuY3Rpb24NCj4gcmV0dXJucyBhbiBlcnJvciBidXQgZmFpbHMgdG8gY2xlYXIg
bHBpMmNfaW14LT50YXJnZXQuDQo+IA0KPiBJZiB0aGUgaTJjIHN1YnN5c3RlbSBzdWJzZXF1ZW50
bHkgZnJlZXMgdGhlIGNsaWVudCBkZXZpY2UgZHVlIHRvIHRoZSBmYWlsZWQNCj4gcmVnaXN0cmF0
aW9uLCB0aGUgZGFuZ2xpbmcgcG9pbnRlciByZW1haW5zLiBMYXRlciwgZHVyaW5nIHN5c3RlbSBy
ZXN1bWUsIHRoaXMNCj4gY29kZSB3aWxsIHVuY29uZGl0aW9uYWxseSBhY2Nlc3MgbHBpMmNfaW14
LT50YXJnZXQtPmFkZHIsIHBvdGVudGlhbGx5IGxlYWRpbmcgdG8gYQ0KPiB1c2UtYWZ0ZXItZnJl
ZSBhbmQgYSBrZXJuZWwgY3Jhc2guDQo+IA0KPiA+ICsJaTJjX21hcmtfYWRhcHRlcl9yZXN1bWVk
KCZscGkyY19pbXgtPmFkYXB0ZXIpOw0KPiA+ICsNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
IA0KPiBXaGlsZSByZXZpZXdpbmcgdGhpcywgSSBub3RpY2VkIGEgY291cGxlIG9mIHByZS1leGlz
dGluZyBpc3N1ZXMgaW4NCj4gbHBpMmNfaW14X3JlbW92ZSgpOg0KPiANCj4gZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1pbXgtbHBpMmMuYzpscGkyY19pbXhfcmVtb3ZlKCkgew0KPiAgICAgLi4uDQo+
IAlpMmNfZGVsX2FkYXB0ZXIoJmxwaTJjX2lteC0+YWRhcHRlcik7DQo+IA0KPiAJcG1fcnVudGlt
ZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KPiAJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVu
ZCgmcGRldi0+ZGV2KTsNCj4gfQ0KPiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBUaGlzIGlzbid0
IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgZGV2aWNlIHJlbW92YWwg
bGVhdmUgY2xvY2tzDQo+IGVuYWJsZWQgYW5kIGxlYWsgcmVzb3VyY2VzIGlmIGFuIGF1dG9zdXNw
ZW5kIGlzIHBlbmRpbmc/DQo+IA0KPiBUaGUgZHJpdmVyIGNhbGxzIHBtX3J1bnRpbWVfZGlzYWJs
ZSgpIHdpdGhvdXQgYSBwcmlvciBzeW5jaHJvbm91cyBwdXQgb3INCj4gZXhwbGljaXQgaGFyZHdh
cmUgZGlzYWJsZS4gSWYgYW4gYXV0b3N1c3BlbmQgdGltZXIgaXMgcGVuZGluZyAoZm9yIGV4YW1w
bGUsIGZyb20NCj4gYSByZWNlbnRseSBjb21wbGV0ZWQgaTJjIHRyYW5zZmVyKSwgcG1fcnVudGlt
ZV9kaXNhYmxlKCkgd2lsbCBjYW5jZWwgdGhlDQo+IHBlbmRpbmcgYXN5bmMgc3VzcGVuZCBhbmQg
bGVhdmUgdGhlIGRldmljZSBpbiB0aGUgYWN0aXZlIHN0YXRlLg0KPiANCj4gQmVjYXVzZSB0aGUg
ZHJpdmVyIGRvZXMgbm90IGV4cGxpY2l0bHkgZGlzYWJsZSB0aGUgY2xvY2tzIGluIHRoZSByZW1v
dmFsIHBhdGgsIHRoZQ0KPiBpMmMgcGVyaXBoZXJhbCBjbG9ja3MgcmVtYWluIHBlcm1hbmVudGx5
IGVuYWJsZWQgaW5kZWZpbml0ZWx5LCBjYXVzaW5nIGEgcG93ZXINCj4gYW5kIHJlc291cmNlIGxl
YWsuDQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNz
dWUsIGJ1dCBhcmUgdGhlIGRtYSBjaGFubmVscyByZXF1ZXN0ZWQgZHVyaW5nIHByb2JlDQo+IGV2
ZXIgcmVsZWFzZWQgdXBvbiBkcml2ZXIgcmVtb3ZhbD8NCj4gDQo+IEluIGxwaTJjX2RtYV9pbml0
KCksIHRoZSBkcml2ZXIgcmVxdWVzdHMgZG1hIGNoYW5uZWxzIHVzaW5nIGRtYV9yZXF1ZXN0X2No
YW4oKS4NCj4gVGhlc2UgY2hhbm5lbHMgbXVzdCBiZSBleHBsaWNpdGx5IHJlbGVhc2VkIHdpdGgN
Cj4gZG1hX3JlbGVhc2VfY2hhbm5lbCgpIHdoZW4gdGhlIGRyaXZlciBpcyB1bmJvdW5kLg0KPiAN
Cj4gSG93ZXZlciwgdGhlIHJlbGVhc2UgbG9naWMgaXMgY29tcGxldGVseSBvbWl0dGVkIGluIGxw
aTJjX2lteF9yZW1vdmUoKSwgYW5kDQo+IHRoZXJlIGlzIG5vIGRldm0gYWN0aW9uIHJlZ2lzdGVy
ZWQgdG8gaGFuZGxlIHRoZSBjbGVhbnVwLiBXaWxsIHVuYmluZGluZyB0aGUNCj4gZHJpdmVyIHBl
cm1hbmVudGx5IGxlYWsgdGhlIHR4IGFuZCByeCBkbWEgY2hhbm5lbHM/DQo+IA0KPiAtLQ0KPiBT
YXNoaWtvIEFJDQo+IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA1MjAwOTA5MTAuMjg3OTU3MC0xLWNhcmxvcy5zbw0KPiBuZ0Bvc3MubnhwLmNvbT9wYXJ0PTEN
Cg0K
