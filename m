Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73F38C408
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531525; cv=fail; b=UUf7SlRljQxf1r0uFlk/ecBaheOS2+NJyPEqzdvFoz0ea5gpbx4iLtQYam3sih8a+zqv93up/bInfbqYyla9YYg2maKy/xplLhUtwnfkuw7NcBUOBd5+wtjspahLyhxy7aTVYJQXuullgZU5B6Nz4Aa2NfDekd1x435p8Dh9Lk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531525; c=relaxed/simple;
	bh=hR/CaYbmqgydzWCao0l+4QtW8yU9/0rvAs28CbmKnlc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HJ9JtlbfhlWOSca+s1omXJ/JcazzwEKra7sUGZ88epNMKwVlAbglAIO8TQ/KA+LGCV4R205SnwObUrWqYt5uhuqt8txqGkc0zK+BJzM+FE1ifQxIAVV0BloOARCY7nMFGCS7maAStiKEP2W0sTiyLLjkhw9swJ1GEV4Ew7JU9RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hm+Z1mJP; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hm+Z1mJP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq9owfA9XatKUTbfFQ27/kyBIKFMPBTYgpexyS0kOmk3KzUKhCrJL6/OU8n1hoGPzysaxR0d5Eg1Y9AE7AhLmZ2m1Y++aOa7IN+/i/sAgg/i7eEgDjIXnUakdrkgwfBBECBeR6vDl2WcqTZp8X7v5gl9+BU3BTeZzoCxWtWrVfHXVMs987mRvrDUuNKk6lIqlyWiAfayIsBHynfOUzHVJTfOIPSHINvjQDF/4onBmVZ6qZRTXunl6J4OMO1/iN8mAhqg/Ma1y3/C+SK6Pi7e0lofJQKUWAvheFIsmN5654bQ/V2xYmKpQPL1+k4TmoBAKcSiWQ61zfxOIAlDHNkv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR/CaYbmqgydzWCao0l+4QtW8yU9/0rvAs28CbmKnlc=;
 b=mbjOZE8UaRuaHTOWJbw6flZo9jtDvP/eXXkkXL7VaJJAnPwPOHc5PUwIL7fSOTi+4eMUZ2DHYkbCiN2XOt/ywmH0EvQoIQoU9z7CWtAo8RlVHXn+JewFODkeGF9pAI/V1lvaAmCbH8UKRnLspVV1xJJ/4M51rUQxHQEmoUAOF1smNHCUNIIcUUGDRSieJpfm8Ul9EdH64BFt5w21HSsKv7G9WeXRFwAQZhkX+DXlt/GbTCCitqTIFkTastCU107YGSY4fnCcmrocBZEI3WKuFIc4DjNTNir5yZnU1AWOHEiCkdwTzCb+03WPRp6E839hAPC27hNLFsFJWX4EvVEzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR/CaYbmqgydzWCao0l+4QtW8yU9/0rvAs28CbmKnlc=;
 b=Hm+Z1mJPWHAvMKu0C2AIqAtKIVHVBSy8oEVZjcaKd/eQHqoVcAibQZUzkK466e0425YxJN18HQWoCd6109ERf0UDpgr/Y9Q+zGXMNh+a+pnF24dUBWF9pS3P9WJvWLGxbjpgtLUhIWOaSy/XA0oIgX0RLkpdCROcaEZdThgxxi0681V8VgCBZQ1uNu9WLJg7dKI6dKyBZLIwfcst+tetXXJEAVKvO16EBPfWbYKUOgUb62Y/B/qXvitzKKYMUTnEjcbZrEJ1GSjijbP2s3zkGlQWjZuuukZ8jbBjHXbYq9a/YyVQfjHMfhft0CaTRb4MP6FzzvnuhAJM3ropqlXTRA==
Received: from PAXPR04MB8425.eurprd04.prod.outlook.com (2603:10a6:102:1c7::16)
 by VI0PR04MB10420.eurprd04.prod.outlook.com (2603:10a6:800:21a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:51:59 +0000
Received: from PAXPR04MB8425.eurprd04.prod.outlook.com
 ([fe80::43ea:a593:a9c8:ec1e]) by PAXPR04MB8425.eurprd04.prod.outlook.com
 ([fe80::43ea:a593:a9c8:ec1e%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:51:58 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@kernel.org"
	<tglx@kernel.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chun-hung.wu@mediatek.com"
	<chun-hung.wu@mediatek.com>, "walter.chang@mediatek.com"
	<walter.chang@mediatek.com>, "jstultz@google.com" <jstultz@google.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu
	<xuegang.liu@nxp.com>
Subject: RE: [PATCH v2 0/4] clocksource: Add module support for timer drivers
Thread-Topic: [PATCH v2 0/4] clocksource: Add module support for timer drivers
Thread-Index: AQHciSnDAU4TcybsxUuwaXs/5nPO/7Wc016w
Date: Tue, 3 Mar 2026 09:51:57 +0000
Message-ID:
 <PAXPR04MB84255A6DA0E26D0F4AF46824EB7FA@PAXPR04MB8425.eurprd04.prod.outlook.com>
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8425:EE_|VI0PR04MB10420:EE_
x-ms-office365-filtering-correlation-id: aed2003a-9224-439a-e8ac-08de790a8293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 T5yYZObNtc1gQNSjD7AG2Uo1MkJBS4pXOxR8oP4mspiXhXJnwc/oQVIZKoMElJAe1Fa4S/C0IHLtj4rp+RLDX/izNgDR2RyfNjz5Rdf852Vr9JXZql+2ZpaflHeP5K4NkjG1ohLRCQHUNw1Mi0Fjx7QC3g5S/iorj88VA8GMhcNIvL5b/v09HtgLC6+2KmWtYY7PoBgAvCGDrL8KD++7Xefbxrk14iB80r5y0wyioNOAIdzeaOF/wWYf1qIJlfz7r0Ls/3aK0L5SoiUHorpoVoKrU+8FBszpo9PRHPbamAhJoMkFXF5ywaFRaUxMaeYNxjbZyuNWcqMt6tjZmYZFf5kqazRRbIK32Vr8fmhD84zM8QDmWGigiiGQmPMiy3kcIgvtjppE22O0gWGTQhDfl6nGHfapqZQpoWjUsExaqOmr78kHpFSSVvY6Xse41QIIRtVkBq1zjXNU15dUCmXpy7IyiVgNoHQsjI2pQ6XQOk9siQE3fiWOUnLxxfGY3M3/BkqeBZ3DhtX//Pdry+ImPEKU45rvhUc+xLlsbFBRX3uvNv0S4gizzipYHX9gSNsNQV9uPJueksLxlFzNFHdY04h/vXdRKLiO9d9xMrFkfjkUs9WP8nPA5gRgXPmsslocAI119XpPuhJ0h97RU6m3YwZXXMJmWEJBtP/9FzdSUjJ+GVVyd5YW0D2b2Btfx74T9qXWB6ISzuJ0pYZBZrPDy7BGfYq2Q+syWZUvkK4sRbocLEL6wS4NOXNFyAbHFjY00VKOMreY8j7KVJ4TE2nmiKKbnnoHrji5KICbvNqYZug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8425.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RzR4K20yM0l0MGJnWTUrNmYzeXErNDhmT2JhUytZZ3NTUXBwMHk0eHh3bWRB?=
 =?gb2312?B?anVkZWFtQTF2a2NqV3IrZnM3T2JTWW12eGRwQnNST21ndFBrcTRCYnJMZm5o?=
 =?gb2312?B?a01vajExYmF4U3JvVVRLYW5JM2s0SG5TWlVUYmNUeG9FQXBDN1NxcmxFbGZM?=
 =?gb2312?B?NnU1eEFDcGV4WjZEM2E4c1dqT3ZyazhzRTVqSWI3Y2xRQjJDSGRrTXI4dTBU?=
 =?gb2312?B?QUdib1BBaThGa0hLSmR5L3l4bnJJWVJDeEV6d28wdzVYUHJFQTExU0xwbmYr?=
 =?gb2312?B?dmpUTG1YTC96c0UyNnNKb2ZVQUFxS1REWEtwOEtyUzRZUGVFZUkrUmhUbWtG?=
 =?gb2312?B?bmxKaG4wdWRuTVVZYnp4QlY5Sko4U1g3Qzc2VCs1YkNBd1l6UDZINW5LYi9a?=
 =?gb2312?B?eDVVNDFkQzFndHQwYk9iMU5zRjk5WmUzck4yeUp0Z0IzeWY3RC95dExlV2VI?=
 =?gb2312?B?QXIyTFBHaDJERkpmdytUalhselNmZGNCQldtUzRzWXBJMjRVV2ROa0tuejgv?=
 =?gb2312?B?NjlXREFYTHZQTHVIclg2YmxXa3hvTzNaYzQ2Y2FObjBoYTFqNW9LSWs2Y1Y4?=
 =?gb2312?B?R2FUbUdQcFlyVTUwRGcvYlJuMFI5d09YZVBNNlF0WWNIT0xvaTN0Y29najNR?=
 =?gb2312?B?V3VvQk84YVl0aWdIcjU2a1pObDY5VFJEK09YUEFUUWJ0N2UybDl4cGxBVHc2?=
 =?gb2312?B?R3BBbTJTQ0tQSTZvNjdwdTFEcUFMNjJqWk9URDFZYTFaYWZnUGxqclVNQ0d3?=
 =?gb2312?B?aER6N29KU0w0OVBYd3hSVXNYbHVPKy9lajc0ZVZmTzFNMDJXYmd6Nm5zMDJF?=
 =?gb2312?B?SkZoSzM2MmxOZmg4cWFoNkwzZGNOVDNMSkdoa0NLcU9SelB5V1lBMzVML0wz?=
 =?gb2312?B?VHZiY1BwMGtWdDNHQ0ZpVWpyMU1mOWNCVzhoTlVUT3dRLzJxMTQvM25PalRK?=
 =?gb2312?B?bHBqV0Y0dFoxemNJMjZzTlo4YWlCRmdjZDZ2VlFldmw5d3VMdUxWTk1ReFZz?=
 =?gb2312?B?YS83dXk1Tk5NRUYrVmtUc1ZIbWhvK0R1dkE3QkorUEhPZjNkbS9ONlo1Zzlq?=
 =?gb2312?B?VGkzRWk1UXBJOEZJYWMxcnZjSlVhQjh5eU5PM2NUTE9RRW4wQnM1T2lMN3dp?=
 =?gb2312?B?a3hTSHBBR3ZaRHh2ZCtiZ1A5YllNejAzWkh3K2o1eE5wZHhwc1E3QjJvZFN2?=
 =?gb2312?B?NGkvbXNXaWs3cWo2V1cwd05FM3pXYWVyWENIMWg1emRzOEF4ZXU2cFZLNjNF?=
 =?gb2312?B?b2kwaHRnd1IweUZYVE1FVmpKMUpjbFM1U0YrQzkwSi9QSWVLNUk2NXFRU3BF?=
 =?gb2312?B?YlNYVlovaER6cUtSZXZvT0NXZTZRdGdMekV3YVlPSXBsTTZVOXI1cGpxR25R?=
 =?gb2312?B?enZWSlBRSnlFWmhudVM2WkMveEJaQkpaODc5YWNhUUtJbTlML3MzL0Evdlhv?=
 =?gb2312?B?Qk5lODMxL3QwdXNxSmJPeVIvU2JZc2UyZlV1bm14WDlhSXU2SFVVbWVVbU9V?=
 =?gb2312?B?TXQ3byswWkUvK1gzcnpobFMwVFNpSWM4cFZGdjV0NkNGTXBDc1ZXd1F3Vmht?=
 =?gb2312?B?WHJweGptRzFKUDJRR2R0OTBEMjlJWnZ0MzIvVXNZSHFJWkluL3VVSXpET01w?=
 =?gb2312?B?U2R5SHl3RG5vTzdpNTdLWmp2ZmtPL05DSUNDSUIwQzJ4Vm5qU1RhV1c2QmRi?=
 =?gb2312?B?QXJrWmhueGJ6ejQyQmZLVEtqME4zZnVMZytYd1lpQjRZanBKM0tmeFVvelVG?=
 =?gb2312?B?VytYck10dVJpUEVLOW1TQmpMVGRUc3c5SWJvQWNtbnFBclkzYk9IakV1TFA0?=
 =?gb2312?B?NFFscDA0bmRjM2MyaXRDMVZKQVZCQUt4M2RrcUpzYWR1UkVlOXhHU2VzUk1p?=
 =?gb2312?B?MktFQXJJODhzUDdacWhrU2Z4eWJkRmFoOXQ5VUhSTGVQM0tscHBtQVNoNDE4?=
 =?gb2312?B?T0hKMlFwb3VFUzJvamxpVlJaZGhjNkJtNjBiRllTMVRPOTFSdUV4VVVmUEpI?=
 =?gb2312?B?WnJWWWhtekUxK3B5MHRaNWl1bDhQdkk2Z1pqYXNQcWY1NEc1ekJjZmZhUlBZ?=
 =?gb2312?B?b3duSnpBQ3pOc2QyYXIrWks0RnNVeUlVQjl5ZDkwQ3pxY2tERDFQSmVWRksr?=
 =?gb2312?B?Zk51bzc3ZTlOZ2dFdHBCYlBYd2dGODluaVVaVysrdmhhTkJlMXM4VDQyUWlT?=
 =?gb2312?B?dTdzTE5mV21zaEFHc0lsSitNRXJ4NFhQYW1hYmxRbFA2NmpySyt6ZFBDcFBM?=
 =?gb2312?B?NFdPbkJ0ZGJHbDhiL09SeXhNeWd6WEFrZ2FWVUlNcnJvTmduZDN4WUNhb0cx?=
 =?gb2312?B?Tk9LR0JIREE5SjU3RVJCdnZIeXMvcDJuNjJRRmNtQmM1eUIwdThEZz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8425.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed2003a-9224-439a-e8ac-08de790a8293
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 09:51:57.9510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CK3WIEDuLayDty1f9dZVfQyTkq3L+2X78v7ZKG4HkQm50btr5jYWwpQit1rIbKe16ukh8E0wfbjFudDa+xV0Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10420

SGkgRGFuaWVsLA0KDQpHZW50bGUgcGluZyBvbiB0aGlzIHNlcmllczoNCg0KICBbUEFUQ0ggdjIg
MC80XSBjbG9ja3NvdXJjZTogQWRkIG1vZHVsZSBzdXBwb3J0IGZvciB0aW1lciBkcml2ZXJzDQoN
ClBsZWFzZSB0YWtlIGFub3RoZXIgbG9vayB3aGVuIHlvdSBoYXZlIHRpbWUuDQoNClRoYW5rcywN
ClpoaXBlbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaaGlwZW5n
IFdhbmcNCj4gU2VudDogMjAyNsTqMdTCMTnI1SAxNzo1Ng0KPiBUbzogZGFuaWVsLmxlemNhbm9A
bGluYXJvLm9yZzsgdGdseEBrZXJuZWwub3JnDQo+IENjOiBzaGF3bmd1b0BrZXJuZWwub3JnOyBz
LmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFt
QGdtYWlsLmNvbTsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbTsNCj4gYW5nZWxvZ2lvYWNjaGluby5k
ZWxyZWdub0Bjb2xsYWJvcmEuY29tOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
DQo+IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGNodW4taHVuZy53dUBtZWRp
YXRlay5jb207DQo+IHdhbHRlci5jaGFuZ0BtZWRpYXRlay5jb207IGpzdHVsdHpAZ29vZ2xlLmNv
bTsgYW1lcmduYXRAYmF5bGlicmUuY29tOw0KPiBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0Bu
eHAuY29tPjsgSmluZG9uZyBZdWUNCj4gPGppbmRvbmcueXVlQG54cC5jb20+OyBYdWVnYW5nIExp
dSA8eHVlZ2FuZy5saXVAbnhwLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDAvNF0gY2xvY2tz
b3VyY2U6IEFkZCBtb2R1bGUgc3VwcG9ydCBmb3IgdGltZXIgZHJpdmVycw0KPiANCj4gVGhpcyBw
YXRjaCBzZXJpZXMgZW5hYmxlcyBjbG9ja3NvdXJjZSB0aW1lciBkcml2ZXJzIHRvIGJlIGJ1aWx0
IGFzIGxvYWRhYmxlDQo+IGtlcm5lbCBtb2R1bGVzLCB3aGljaCBpcyBwYXJ0aWN1bGFybHkgdXNl
ZnVsIGZvciBHS0kgKEdlbmVyaWMgS2VybmVsIEltYWdlKQ0KPiBjb25maWd1cmF0aW9ucy4NCj4g
DQo+IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBwcmV2aW91cyBNZWRpYVRlayB0aW1lciBt
b2R1bGFyaXphdGlvbiB3b3JrOg0KPiBMaW5rOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzA1MTcwMjI1NTcuMjQzODgtMS13YWx0ZXIuY2hhbmdAbWVkaWF0ZWsNCj4gLmNvbS8N
Cj4gDQo+IFRoZSBzZXJpZXMgaW5jbHVkZXM6DQo+IDEuIEV4cG9ydCBuZWNlc3NhcnkgZnVuY3Rp
b25zIGZyb20gY2xvY2tzb3VyY2UvbW1pbyAyLiBSZW1vdmUgX19pbml0DQo+IG1hcmtpbmdzIGZy
b20gdGltZXItb2YgdG8gc3VwcG9ydCBtb2R1bGVzIDMuIENvbnZlcnQgTWVkaWFUZWsgdGltZXIg
ZHJpdmVyDQo+IHRvIHN1cHBvcnQgbW9kdWxlIGJ1aWxkIDQuIENvbnZlcnQgaS5NWCBUUE0gdGlt
ZXIgZHJpdmVyIHRvIHN1cHBvcnQgbW9kdWxlDQo+IGJ1aWxkDQo+IA0KPiBUZXN0aW5nIHBlcmZv
cm1lZDoNCj4gLSBCdWlsdCBhbmQgdGVzdGVkIG9uIGkuTVg4VUxQIHBsYXRmb3JtDQo+IC0gQnVp
bHQgYW5kIHRlc3RlZCBvbiBNZWRpYVRlayBwbGF0Zm9ybQ0KPiAtIFZlcmlmaWVkIGJvdGggYnVp
bHQtaW4gYW5kIG1vZHVsZSBjb25maWd1cmF0aW9ucw0KPiAtIENvbmZpcm1lZCB0aW1lciBmdW5j
dGlvbmFsaXR5IGluIGJvdGggY29uZmlndXJhdGlvbnMNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+
IC0gQWRkZWQgU2lnbmVkLW9mZi1ieSBmcm9tIHN1Ym1pdHRlciAoWmhpcGVuZyBXYW5nKSB0byBh
bGwgcGF0Y2hlcw0KPiAgIGFzIHJlcXVlc3RlZCBieSByZXZpZXdlcnMNCj4gDQo+IENoYW5nZXMg
aW4gdjE6DQo+IC0gRml4ZWQgJ3Vuc2lnbmVkJyB0byAndW5zaWduZWQgaW50JyBpbiBjbG9ja3Nv
dXJjZV9tbWlvX2luaXQoKQ0KPiAtIENoYW5nZWQgTU9EVUxFX0xJQ0VOU0UgZnJvbSAiR1BMIHYy
IiB0byAiR1BMIiBmb3IgbWVkaWF0ZWsgZHJpdmVyDQo+IC0gQWRkZWQgaS5NWCBUUE0gdGltZXIg
ZHJpdmVyIG1vZHVsZSBzdXBwb3J0DQo+IA0KPiBDaHVuLUh1bmcgV3UgKDMpOg0KPiAgIGNsb2Nr
c291cmNlL2RyaXZlcnMvbW1pbzogRXhwb3J0IGNsb2Nrc291cmNlX21taW9faW5pdCgpDQo+ICAg
Y2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1vZjogUmVtb3ZlIF9faW5pdCBtYXJraW5ncw0KPiAg
IGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItbWVkaWF0ZWs6IE1ha2UgdGltZXItbWVkaWF0ZWsg
YmVjb21lIGxvYWRhYmxlDQo+IG1vZHVsZQ0KPiANCj4gSmluZG9uZyBZdWUgKDEpOg0KPiAgIGNs
b2Nrc291cmNlL2RyaXZlcnMvaW14LXRwbTogU3VwcG9ydCBidWlsZGluZyBpbXgtdHBtIGRyaXZl
ciBhcyBtb2R1bGUNCj4gDQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgICAgICAgICAg
fCAgNCArKy0tDQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL21taW8uYyAgICAgICAgICAgfCAgOCAr
KysrLS0tDQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWlteC10cG0uYyAgfCAzNg0KPiAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW1l
ZGlhdGVrLmMgfCAzMw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLW9mLmMgICAgICAgfCAyMyArKysrKysrKystLS0tLS0tLS0NCj4gIGRy
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItb2YuaCAgICAgICB8ICA2ICsrLS0tDQo+ICA2IGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4g
Mi4zNC4xDQoNCg==
