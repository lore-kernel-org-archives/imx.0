Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A582443C
	for <imx@lists.linux.dev>; Tue,  9 Aug 2022 16:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z01Anr8BK92/LicI+loUH63paItXdkBYVLzheYowl0r2qXQBMKm4iYjVh+JYita81sY7H5vQiQW84x3zouXWtrDKDc/rEEIQ7cvotjwOSDGAvhptd01rrRzgJVg7ywyOu1H/+d9CDJYbiWAdtofIm7ZfDs0p98kiaqBgyyD+UnYSbTvYVX59FDfMp4cGj1wSI1LvSQWo6jtr6igQcErFTofnAjOizZX2RqiSoltMuHMEi+ulbqoPCJTdlNhmNW2DrU1xsdtEwRfThR1/Ra1JdkrG23UiFUeko+rKzErhR0tIN6Fn+rZ1FGwoGZeHdzuNXA23lpKZFoZwHMteajijGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBkC1+zgxFq1xobV9z9WYV2HrKlq/2Ctz0YHgCvUoGA=;
 b=Q3WQW9yiL9tdSRBW6lnnfHI4hNiAQS1G2VhlqSbblmNV3UTqMDVLu81DS+9mvrz1LD2EKbwA0MQfrU37/PCNLMQjZl9FLnaa144dSygu4BoZPtNpURnLukjW3w9AO6mHqWZpCzSk4KI6AkK4swA/7UbVu454S0/uH/YXf0/WkPbSmLJZwal3G+Uz0pXmnIlaJCzKt8Nu2WelOGA7B1RC10FUIpjFgOZoZXVckQ2J/tmqb9L0vPq8hIp1p2b1OV7qI2otBk923yN/te5mCsYxM3rPNa3Zs7N5Fb2PmuJlgWFz7KhgF72S0duDK8Z7324DhLujESpauzh/jZsU1lgzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBkC1+zgxFq1xobV9z9WYV2HrKlq/2Ctz0YHgCvUoGA=;
 b=qqcFiW8SyInN8SxeSiyDGUNyLmtRGhWiSz4NMHsM0DIosz+yVHDxwfDaqMwPGitvRySBy9wPWjsTV8hr3tDbWhvgcD2KNoG8//gJivtnH/wnEk29MkgwIjxXwpBpb+DfKuFZARqx9Ha96Aymi0GkowCAHsnF+GSegEFveyBjYbo=
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by PA4PR04MB9415.eurprd04.prod.outlook.com (2603:10a6:102:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Tue, 9 Aug
 2022 16:41:55 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%5]) with mapi id 15.20.5525.010; Tue, 9 Aug 2022
 16:41:55 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [EXT] Re: [PATCH v5 3/3] arm64: dts: imx: add imx8dxl support
Thread-Topic: [EXT] Re: [PATCH v5 3/3] arm64: dts: imx: add imx8dxl support
Thread-Index: AQHYpeGDYpiKQ0qZsEaieFkUBk0ctq2ggR7ggAQHwACAAM2G8IAAq2+AgADOohA=
Date: Tue, 9 Aug 2022 16:41:55 +0000
Message-ID:
 <AM9PR04MB82744F2CE2C3B7FD99BA94BD89629@AM9PR04MB8274.eurprd04.prod.outlook.com>
References: <20220801200121.672619-1-shenwei.wang@nxp.com>
 <20220801200121.672619-4-shenwei.wang@nxp.com>
 <DB9PR04MB8284548EFC5EBBA826B55F34899E9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <5d7f44e5-9114-65b6-af7d-4bac75c62a46@linaro.org>
 <AM9PR04MB827446CA7B2887414A5C641C89639@AM9PR04MB8274.eurprd04.prod.outlook.com>
 <781cf213-0ca8-6b03-2d60-280bfeb6d39d@linaro.org>
In-Reply-To: <781cf213-0ca8-6b03-2d60-280bfeb6d39d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfdfeaab-9c59-4dd6-34bd-08da7a2611e9
x-ms-traffictypediagnostic: PA4PR04MB9415:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VghH9ls9OluWn5LCUUjA3iFKIHKO2ySESNH58gS8i6l0LsEXee+YnIZphD3nFSScPfDZDTqODYJiMj5LwDqRoWmL1fdNnEUvvfsucdgDNEwgUZltM3mqwCpJqw9F4JtHXZ88YyQvHcYOqFYkW1oRwPGGJHxkqMY0329yTL/IQx2dSNKoBp20ydNNbit9v+9Xs3yv2aSwZ2f14Ex5tlCYYF+CT4L1785+Paa7T2/6TwE8kvZckPBN2hXWBrIHHdvVvpUSSnm1NFosqDFvZjF3d/NAWKFLpGnWluunE7LLfg4iSTzT8Au1s1OB5VUUTARaj7P9IiKWKrPqDIgH2uBEVrwrkNZqhJzq7xL0RqZ22KidvIH4Gsre1IedU/4qGo86uH6sxOXcXDLcfyzYeXGWeIhjPg+7iND1bXDUk34ncVbyS6wXqf1gd8P+jpjfip1+HbxLKpZx05oKe4XlVzH0oJx534NtdwxAteR6Z54K7QvGygnSN8sYJLzCv6JTsz88pVuZ59MWsET5m6HmOHc5OmJ2SAYlZjBUJIMDKrxNNKWkc+syXcse/08jmvMmVx1YkP3tEk/dYkigQIPyyswYUIzXadK3dj1LLcJzT+Q3ifBXOQ4vhjpGvQbSAyWTHRSYRKBUi6ZujwjTjKzfBx56lE3WMho9m6EURqm/8OjVWi/pAeAtzqBwGrWH1rqOoxuH9cQ+O3y2ly4Ewi3/wk4NvcyBuMFWCF4YxN0A2mT1e1/U6fuebUWSsH9tYhqWX+RkNsU8mXcoln6YkOZqU+bDIv2mMGnuaQP/QY4gEB4fJXWpMtgiTCgt3aLLPK8kDmSGS35AWp8zuTXya1qOEksEcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(44832011)(5660300002)(52536014)(2906002)(76116006)(66946007)(33656002)(6636002)(71200400001)(110136005)(55016003)(316002)(478600001)(54906003)(8936002)(38100700002)(55236004)(122000001)(38070700005)(26005)(86362001)(41300700001)(53546011)(6506007)(7696005)(9686003)(66476007)(4326008)(66556008)(64756008)(66446008)(8676002)(186003)(83380400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2I2VGV2WkNjblBaaEZnNzVPaXJDcDhoMnZzWnlQVlNONmxyNVN1NEszTXUv?=
 =?utf-8?B?WldiUzViZ3R5UDJacktEOEVxc0V0dEZpQUtkalUrVEpyeDRIbUFnbHdYK1Fj?=
 =?utf-8?B?SUZ4eEdwMlMwU3Y0UjZJdFJ0Q2hYcCtuVGJKZDRGL01mUXJIZGI2V1JhMjRR?=
 =?utf-8?B?VHlXZlVadnBBdjFxNkl5TzdFUFVwNm0wNVJKVjl5U1pxS2RkUjJ5Wms4UCtv?=
 =?utf-8?B?R3hpaVdmV0MrYUwyQVlFQWcyMHVScW4zNm9UQWpnUEdOUDdmaWFEVFIyWGg2?=
 =?utf-8?B?T1JkRXFDWTJrODdVRjZIM3l4SkI4ajdhTlh3QSs4VjVNQzY3UW5TK3FIc3dD?=
 =?utf-8?B?ZUcveGtHSXJRaFRtd3B6MkNqN045SVZESjZwY0krNFFJeHgyV2RBaFVwR2tD?=
 =?utf-8?B?NmdkZzgwNDNLbXY2TWI2a0IxWnJwMTNXNFpaSEZYNWdGblIvcGRuOWJZZmpF?=
 =?utf-8?B?Yko4d3h1RFRHUHBjM2JYWGdGTWwydjY3Z1lGakZTSWVIVnB5cnltNldCcFA5?=
 =?utf-8?B?eUU0eDNoNWRlUVdyak4vemR5ckJlRzVFTWpyMkJhSWRFc2d1M3NlVGo3L05X?=
 =?utf-8?B?TWw5d1RSeWQzdHhsSzlCWlQzekJKOFY4M2g2NUdqOS9pWlpkc1JuajY3RUE2?=
 =?utf-8?B?MnBXdTlqSVl1aVFoclpEOG51VnAzK2JIQUFzdys0dUxUN3lFMk5kY2l2UUVm?=
 =?utf-8?B?M0RZbVRQNFU1czJSODJXeldvUjQ2elFaK2VVVGR0ZmJEd05vNEl6Zi9mT2Ir?=
 =?utf-8?B?QnlRU0lXdElCb2l2djRIU1VzU05GTmRrTGhXQW0rcWtmR1BvS2R4eVR2d2Y0?=
 =?utf-8?B?S0NFME50UEZQejJ3TEtGVDhTTk41YkdOSk9QR2NjbURnVUVEM2ZrQm5oWjI1?=
 =?utf-8?B?dUZ6aEpzK1g3R25mbHNLcjdCd3dmZWJkWFN1LzZoMGRmS3Ivdk9NTE50Qmhs?=
 =?utf-8?B?eWdvTjg0ZUdQMVZSMmk4bWdJYU1SSnBLUk5YalBtVllaZHU3TnhYWVRHM1BQ?=
 =?utf-8?B?RGptWlNzTC9PcmoyQWpwNWpjOVZwakRnNC9MSnJ5NVM4QzUvS0RaNFFMaGtk?=
 =?utf-8?B?NWRvZnovd1cwdEhFNCtkRzdCaFJVM2cvY3g3TEx3QXNTbzJZRDVtM2JMNk9v?=
 =?utf-8?B?V1pNL1JqdHRqVHkxRVdIc3lOQmkyM1dLTmRWb0NkQy9oUk1nK3R3Z3BwYTdN?=
 =?utf-8?B?cXNJL2R2K0U0YUgxNktoWThmRWpMSExzVnIxaVZhb05NUGdUbjcrZVQ4V295?=
 =?utf-8?B?SzY0WFkrSlFRQ2VIeE9hNFVqSmlHQkxvc0o5b29GNWhOY05FZWxWdUs1NUlt?=
 =?utf-8?B?MHdNNk9Ldm1nc0tEMlFUdWs4dThZRytzSG9URDdIRU80dXBiL0JzNUhPdEc0?=
 =?utf-8?B?UGNkM2lCVUhuSWlaQi9HOHNZQjFzcUVuZ2x5b1F3ZlBZMmpkRUNyL2Z0emdW?=
 =?utf-8?B?YkhhU1BOL3p2M20rU3JIaWJ1dUNDSnFSUTdIK2hqa3R2SXZQNFpoT2NPZlI3?=
 =?utf-8?B?empVeWRJSFFKM2lzLzNGMmVMak5oWkNUcFpzRzZ5czFiVjhHSGtrMmhUS3dn?=
 =?utf-8?B?ayt2M2Z6NUZBQXVJc2x6YW5WMVJ4L0ZkZWlBbjU1YzhITkwvUWNPNmJ6Z1I4?=
 =?utf-8?B?VFhiSWVxd0NMVVhGTWZKOFFWOHlhVTYwY3BxWThjb0p1Z2t0RGpOZmIwcDU3?=
 =?utf-8?B?N3c5d1hOUVZLRlhSNVlUWDRLOHFyQzBuM1BrTmFyMjFTMTFpRkhXenNpR0Fj?=
 =?utf-8?B?eVl5UW1GOEFXYVRhL210YXc3SG5tM2lIMWVwU0MzK1FyaHV0S3puYlYzMTE2?=
 =?utf-8?B?Ni9sYTFHczZuRWhyYVRtRzl3ZmdXT2JoOEdRdW1lbFRCUnhsM2ZQM3EzWG1J?=
 =?utf-8?B?Z0p6QWlWd2d6dkkyQ2ZnblY4UkttVEZpUFVvQ2JYS0VKZzduK2xyK0dXVXdE?=
 =?utf-8?B?QjAyT25qdjI2dHlacG4rUzF6dzZsRVRJU1BMRGJzL1JZYlhVN3RFU1ArM3lT?=
 =?utf-8?B?OEUxamVTQ3JzOXBBM1VtbWpFL2FPOTduaWhGRTR5U05KWisvS1VvS1RTdDFK?=
 =?utf-8?B?cWdhMkljTklYeVdrcVBQRzVvSkJzWFh0N29NSnVWdmh6d0lPT3I4RC9GQzVj?=
 =?utf-8?Q?y0+Q5g7dAWldSLrIew+fCB2/i?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdfeaab-9c59-4dd6-34bd-08da7a2611e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 16:41:55.3563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQ67suEJ2IwWW000TWS3JOqMjcMP9Q94ubambYYU/BFCGnIeXrGlqEej3cxStTNj6yJyoH9mveiENaNuX3bFGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9415

SGkgU2hhd24sDQoNCkFueSBjb21tZW50cyByZWdhcmRpbmcgdGhpcyBwYXRjaD8NCg0KVGhhbmtz
LA0KU2hlbndlaQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50
OiBNb25kYXksIEF1Z3VzdCA4LCAyMDIyIDExOjE2IFBNDQo+IFRvOiBTaGVud2VpIFdhbmcgPHNo
ZW53ZWkud2FuZ0BueHAuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47
IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9y
Zz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47DQo+IFNhc2NoYSBIYXVlciA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gQ2M6IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0K
PiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2NSAzLzNdIGFybTY0OiBkdHM6IGlteDog
YWRkIGlteDhkeGwgc3VwcG9ydA0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAw
OC8wOC8yMDIyIDIxOjE2LCBTaGVud2VpIFdhbmcgd3JvdGU6DQo+ID4+IE9uIDA1LzA4LzIwMjIg
MTg6MjIsIFNoZW53ZWkgV2FuZyB3cm90ZToNCj4gPj4+IEEga2luZCBwaW5nLiDwn5iKDQo+ID4+
Pg0KPiA+Pj4NCj4gPj4NCj4gPj4gVG8gd2hvbT8gV2hhdCBkbyB5b3UgbmVlZCBmcm9tIG1lPw0K
PiA+Pg0KPiA+DQo+ID4gVGhpcyB0aGUgdmVyc2lvbiA1IG9mIHRoZSBzZXJpZXMgb2YgcGF0Y2hl
cywgYW5kIHNob3VsZCBoYXZlIGFkZHJlc3NlZCBhbGwgdGhvc2UNCj4gY29tbWVudHMgZnJvbSB5
b3UgYW5kIG90aGVyIHJldmlld2Vycy4gVGhlIG90aGVyIHR3byBjb21taXRzIHdlcmUgYWNrZWQg
YnkNCj4geW91IGFuZCBSb2IuIFRoaXMgb25lIGhhc24ndCBnb3R0ZW4gYW55IGZlZWRiYWNrIG9y
IGFjayBzbyBmYXIuICBJIHdvdWxkIGdyZWF0bHkNCj4gYXBwcmVjaWF0ZSBpdCBpZiB5b3Ugb3Ig
Um9iIGNvdWxkIGFjayBpdCBvciBsZXQgbWUga25vdyB3aGVyZSB0byBpbXByb3ZlLg0KPiANCj4g
VGhpcyBpcyBub3QgYSBEVCBiaW5kaW5ncyBwYXRjaC4gV2h5IGRvIHlvdSBuZWVkIG9yIGV4cGVj
dCBteSBhY2s/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
