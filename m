Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436938;
	b=oRVMg7zLxVR7GjIGWgp1dJnpDgMwlw52aTiJQt1kNjuQ4P2O+9V6x/eBlfU0xPcN31Hc
	 eMt2PbOg/TZdDhOZpCGl0rgFQdAVhdXwbQh+E5pVW67RAC3jpkMe8HIZxYGe8jxL3FFoz
	 70mKOezYmaV0GiZRpnKo+tP9fchSkvNJkExLv8TQQ6JbSEs6ytM60PB2JbcsLG8nDgk7m
	 osJ3wsYV+ojlsqesyf+5FDBnzZBAxZePygIgIAbIviLfTiIYYUIZEGgWjx113uQHvD9la
	 pdzYFR2o/ZUZUiTq+ZB8Rm6WIjeswaIjUVF1pjLpeo/nZeRTYo9O69Na+CT/mZ+SYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436938;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0s/oP6XOh49ysPVEkcGYCSZEPPP3mSHIizLv7bMM8GY=;
	b=OiWmHGX8iBgvNtoLFmrLSwgesCNHCGrmFgwYXxy7/DUT3FSaxAb/21KL4OYnG47g3JgK
	 mY+/uqOKsvr3mbxEsWM/JpC5TZXF2PLx3Mypa37fZW9xN/xeUmWouQ+Ydfig2a7Eidj/g
	 UJc0bDdQNO/OwW4vXbk6F6Ejpef1e9Yop5c3BTYldsL1ja1Xa/YtwM059nO0wHOh7hiF5
	 JXCOsaz4LxvrWiGkSbCEQyk0juAvp/X+l3gunF5i/jrQbT6caQZAH1rVx12cxQrLbVk+9
	 lGtPaslxS5uZTOjMH2bS1dKrzaQeeDuW65smN3X11MLpjal5u4DdXrhIMXIA9HfawsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=KZMIRPLz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.108
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022108.outbound.protection.outlook.com [52.101.66.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F4606A31A
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 12:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=KZMIRPLz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcysiXUsPiwCrcRoLA17bCriiKZLSjVD9RR85e2q4apuLOkRu8HwFfVzhyeDExFNdgkk2UKLiH7WHpg1PJ4ROk+cK7WgF+96NGSMxXgUGfhwAYP3tBynYXdte9dqEaYdx16fJYsicLlIb3LiCo8TtH2bItlykY0qedRG6Wrbnu17982xI0ltbyZLBVrWHvQivV9mQfwPDZP3Irkd8NFO3ceS9ThdiQDUp/WN9DUcNvY9ejzABWdOD2Bi/i6gYzXX/aZ8DIBCM2/XfCtFlH2po5W5CDINLUW4ukzNNCdLfh60Q8Bt9CRMETw2xyJJsrPgKAdx3v7sb+2hRef+uRXe0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s/oP6XOh49ysPVEkcGYCSZEPPP3mSHIizLv7bMM8GY=;
 b=GCMSWyN/QPJv4Vk+M9ltn5oE4Qptc8gCjpK3pozxtZfHJinhygUpHCBDOGQ6C84jK603K/OZ+rT70Rfa7BJj9VDYqXy77jUyMv7klb/0A51SxG8PJmx7YVA5SZqMWwZiXEn7y8E3UWSglicR0RVP76biYc9AwekKliW4LNmvcEJj83WLy/hRhGB6+gmXKVctKZbPLT+LnIMqezPc+kKWa/W/UXyEis6Xagx+O4o5TjtG+wiFNvP00Kc5jiJ+ae3g1j6gfuesRfTSqFsMLkgm/KA5RCeVD/HkrdSVRTpotyW8dElRY8PwdWxW3pVOHpzVs3JWNNXWXmzgqC1RmG32Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s/oP6XOh49ysPVEkcGYCSZEPPP3mSHIizLv7bMM8GY=;
 b=KZMIRPLzPY6KH5OKhIP9rlBrYMwPWDoW8Tqt/by0fGVskHV3lMp9YH6L0WbpHe8K2cLgEFZ/7fx938hjBZGqT+7e4vjmEYO3UaeAHfYPt/zpEyVTEGaofBpr+qSvTfJiZM1O+4gTdYbAi8EOvfDX5kNkMArLdaocIyNXTOYVUtJBhnnX0Id5F47M0wFVi4P6PK+FVnzJfTcAnfOAY6NWD4PJ3iBmqzmL1OMCgAFTcclwPZxObzKWiJ3jHj8uug5dcxAhAgEq73yo+y8V1kZh85QGlfW0F4i8cs7U1cAa94/2LEi3t2EWHiv9view0zDjw8tZdamfKGQDlZN9RWF8eg==
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:b10:105::21) by AM0P195MB0673.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:163::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:28:54 +0000
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893]) by BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:28:54 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Benjamin
 Hahn <B.Hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, Jan Remmet
	<J.Remmet@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
Thread-Topic: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
Thread-Index: AQHddbkFk/mNP9YwAEuNkLOR54LZl7c3DouAgASSagA=
Date: Mon, 23 Nov 2026 12:28:54 +0000
Message-ID: <0ca6fb6acea9fe40cf2190f3a67d6376f9bfaaae.camel@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
	 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
	 <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
In-Reply-To: <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESP195MB976599:EE_|AM0P195MB0673:EE_
x-ms-office365-filtering-correlation-id: 41104230-439f-4c30-61a9-08df495d56de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021135927099003|38070700021|11063799006|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 FP3XmQsSNqFKZPEU0stfzT94qapNPrpEoHbTaqnFBNujp1NFAgcOS89dIch1NirVgThKpMMFvXUYf4AQpuOAeGgWZ8dTnhsbZeP2vcmjcTMi4017a5H+PXjk7wuwv6oageYCWWD8HBmJXKGZ8RLvuy/o39OPYlX6fg2S1WJYnjfVT5pJLfohzeVy5mqXYsqj2TxT8IvUcWq2EgVlvU3R37goUcUCJVMYSlkJcpnZM6vqrcihw2TkbISLlRc2d2hnS/VwCX46R0m4YV9dZq4mD0iN/I3fbm/5rrW813dT3JpsEZqRwKx62gaVuiDJpg3W0Zcz9H07SnYOxYEaY1NoKAKhmtu1d8jiq4DaCMbgT/BNZqTtve+zZzBTW58KdQMsFJyDmR+ifr9W1/oFNchiFNWhQgyXf+sY0qq1pbiyOKSSTKyMp/HBWh55NVhPKW+pjff12G3XkCHcKublpixPiD40M6hgLmO8gyiRFxBaiJ2AwA9ex267V8y2uz5fMzG1pArOd9WSTSlxWVP6oGu97QfX7aO6UUXVk4WmSKdPTFe+z1FDWqDLKqEcbS+GUF/kK9wTJrATf7btooVGhsJfLKfzk8gpbS5NtkFBf6aSR6/kXgr41Hv9X/NWVo4LQLCjz6J734v8Jq8hluakFbS8DF7dyIUz4931aynQz8wamXeIyH7Wahd5OYZ476pl21Lic4G+7/cQL4fvhN6eMUb/c8S5Vw/VYZfPSSZ61BlWYvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP195MB976599.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021135927099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RC9EVUI2Q3JkMmdNUFVva3RxRlV6RmN3dWh0KzNZeUxMc0grY1JucnM2ODgx?=
 =?utf-8?B?cmNveHB2bE5OY0JmZWFoSUlYRjVMSnpmaWFGankyc0ExRmlTZk55TGZ0a091?=
 =?utf-8?B?cGNOWk1OaHdXTmNySXFOZjB2QkJ0ODA4Z0hkbTFPNHh2ZGlWWnpjSG9NMnA3?=
 =?utf-8?B?Q3Z3NVExc3N1MlBpSjNSRS9tMVRJY0tMMmpPNXM5cjJDRUhUTVAwNzRXRE13?=
 =?utf-8?B?RXhZQzZScDdTb0ZWYnNZTmJDWkRQbytuUnQ0eDJBOG95Y2JpU3loMmxGZDhh?=
 =?utf-8?B?d0l3YmoxRk5jVzUvZHBlNVhuYkduaUIzL0lrVW5VL0UraUZXYk1vTy80UnRy?=
 =?utf-8?B?aW0yTVorRWxLMzdVYmNCTjYwc3p1T2dhVzYrdE9INEF4WWE1YUFRNEJhbFIz?=
 =?utf-8?B?UWFkYndBUDFLU3l0NFlKSS9xTkd3c3NBOGZQUWJ4Z05vbmkxS0tmSEtJdE5O?=
 =?utf-8?B?YmhxTzh0SHluZG5kN0pJZmI0ZGN6TXFRSXdzaC9ieStiSUNPcCsrbVdVNWNO?=
 =?utf-8?B?WHhQTXZBRmdUZjAxUWVLaXZLMUw5Qjg2ZHBTYUxTRDM0c1NPc0Faa2o3eXpJ?=
 =?utf-8?B?eTlQai9TOEdFUnBTd2JFNU5wa0tzS3J3a1NpSkFkSjRzaWFWRDBvaFM5WEZW?=
 =?utf-8?B?YjNJbnBOcktNMHFXUUVxeGlnSG53QUJ4YXlqUG5uUGF2YUFJekQvUU5nVlc1?=
 =?utf-8?B?TkM4UEI3Z2x6QmhKQitpSjN4alBEL3J5VDZ4SjhMTXA2aDVmc3Q2WW52NnZw?=
 =?utf-8?B?ek5PVm9xZ3A5akRQZGNOVi9Fcmc3SXQ2dlVKb3hTRzJiWEEzQ3dZSkorY01a?=
 =?utf-8?B?cVJGMzNoRkIrT1IrN1NxU1I3RERwUmYrZldGT3V2a2UrWjUwUWhGallxNzgy?=
 =?utf-8?B?WkhrMDBSM2Yyb1ZjZ2dvTlBuUGlBbFZJMld0dGo4eFFQNFphOUh3dit4ck5P?=
 =?utf-8?B?UHdWOWFQZmNhbmpKdVM3ekVtVS9rY1NwRzVqaTlLaHREQ1JVL0g1c1hCYXVI?=
 =?utf-8?B?OEV1Q01pL2hRaUxXL0M4aXREOUVKUUNBTk12YlE5bWRnMjRHVnZLOFVzRVIr?=
 =?utf-8?B?Ynd5eUEyd1VHaVJ1ME50Zml5aDhvRWtRMnNTTEFCbmVpYVZaNEU5blV6MWg4?=
 =?utf-8?B?clVNQ0tiYzVKRTA5VmZpektHRUNTVGg1SkdLQjZWSWc4NURYK3FLNW5iaTJh?=
 =?utf-8?B?am54SWtIUHBmVG5TZ0FUM3g5OHA5UEo2dnExUnB5bHFCNDJjMWJkUGxYMGoy?=
 =?utf-8?B?ZGM0aW9HWjVLODhoY1pOYzI1M052cGsxK1BKYjBLQnE3RFkxcVRxKytkajNQ?=
 =?utf-8?B?SnpFZ3ZYWnlzdTFIYXRSRHVGNDlDVFRNam81ekJQYkpFRHBFTUtmRWdBK1dM?=
 =?utf-8?B?b3M0NFhvbGJPeFIvYmhBanBxVHBLajJiZklMcnozNVB2VmlHY1M3cXFGR1lL?=
 =?utf-8?B?MDI1dDRQL09NKyt1elk4RUoyM0s1bFdwcE1hUlRPMFpaTTAvSXdBb0h4Qlpq?=
 =?utf-8?B?VjlQNGhmZ2cyWUhEczc0YkZ0RVI1RXlKZkNxU29mbVBxZkZ0L3JmZGlpc3NX?=
 =?utf-8?B?Y21QT2VyZmUraWFJUEk0ZCs3QkFEZTk1SzRzNjNXbWdGOUFlSCtUV2tlUkRT?=
 =?utf-8?B?bm1RM0RhcW1wQk9DS1Q4RkFKRHFxNk5VeDRIYUF0dmx4d3FzZUtYai9jVCs5?=
 =?utf-8?B?bWIwd1hQQXVUUytISVpYdXFSS0wvcDZuMzUvUGVPTnBpcUZQaTI3YnJLb2hR?=
 =?utf-8?B?ay9Ia1h5b3pNVlc5NnNLWldlTzRZYzZJK3hCL045WXRlZUJqRERnS0YyWlEr?=
 =?utf-8?B?cnlVQW1qNVgzbytHWXJSaG9FTmZDbVl5NExLK01SQmJ1QVhuZWZERnhudUNQ?=
 =?utf-8?B?b085UkVOdkszbWo5UjNURWJTcXpPN2I3MWZKNDhoR1NrUndKc096S3Z4OU9D?=
 =?utf-8?B?OTRiblBBSWRYZGZ3Q09ZWXMrUnk2RFVqWW5ORkdqQ0R1TURHeFVPQmE1Y3o0?=
 =?utf-8?B?Z1Z4ekFCV2FQcUFRcVc2dEppU041MTNDRjB2aG8zNW1iNFJSdkQ0VFMvbjYy?=
 =?utf-8?B?VjVXeHV5MVZsWTd1eW84ODdtVWVMV2tKa21CZDRNT0pzQWRDR0VtUHhSbStV?=
 =?utf-8?B?T3pIZmlqMUVkSzBDZlJFY1h5K2NPU3FzeHlSeEpCekc4cE1ldmlZQkppRTI0?=
 =?utf-8?B?d29FaHk4NW16NDJ5TitZSFI3Vi9QTlZWN0sycmtSME5JblFkWmh1SUF6ZERI?=
 =?utf-8?B?T2YyM3VVUXRsTmxacVZ2S0Nhb1huQ2JmNFdXZHd5L1BXZFRwa1JwUlhoWnIv?=
 =?utf-8?Q?ZmzoiPdWEhSMHX4gp5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D3AD5D1ECE0204FB84B93AE22E2BB97@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESP195MB976599.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41104230-439f-4c30-61a9-08df495d56de
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:28:54.8063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aj2iVpbzknq9okiiG/A1rwbGhzwQOcfvsJFSOszQSVW2n5GOICJVDzVlmTm4OqsQ+mWHTlIEfaxqGVPw83GKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0673

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE1OjM5ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDE2LCAyMDI2IGF0IDExOjU0OjQ0QU0gKzAxMDAsIFlhbm5pYyBN
b29nIHdyb3RlOgo+ID4gYmluZGluZyBoYXMgbm8gY29uc3VtZXIgYW55bW9yZS4gSXQgZGVzY3Jp
YmVzIHByb3RvdHlwZSBwcm9kdWN0IG9ubHkgZHVlCj4gPiB0byByZW5hbWluZyBvZiB0aGUgcHJv
ZHVjdC4gUmVtb3ZlIGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWMgTW9vZyA8eS5t
b29nQHBoeXRlYy5kZT4KPiA+IC0tLQo+ID4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2ZzbC55YW1sIHwgNSAtLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNSBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vZnNsLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9mc2wueWFtbAo+ID4gaW5kZXggMmQyMWExOTQ5ZDk0OS4uYWU4MjNhNzY3MGIwMiAx
MDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNs
LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNs
LnlhbWwKPiA+IEBAIC0xMjI3LDExICsxMjI3LDYgQEAgcHJvcGVydGllczoKPiA+IMKgCj4gPiDC
oMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUEhZVEVDIGkuTVg4TVAgRlBTQyBiYXNlZCBib2Fy
ZHMKPiA+IMKgwqDCoMKgwqDCoMKgwqAgb25lT2Y6Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgIC0g
aXRlbXM6Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gcGh5dGVjLGlteDhtcC1saWJyYS1yZGstZnBzY8KgICMg
aS5NWCA4TSBQbHVzIExpYnJhIFJESwo+IAo+IFlvdSBqdXN0IGNoYW5nZWQgdGhpcyBsaW5lIGlu
IGVhcmxpZXIgcGF0Y2guCgpZZXAsIGFmYWlrIEkgbmVlZCB0aGlzIG9yZGVyIHRvIGF2b2lkIGVy
cm9ycy4gCgpTdHJhdGVneSBpcyAKCjEuIGludHJvZHVjZSAiY3VycmVudCIgYmluZGluZwoyLiBp
bnRyb2R1Y2UgImN1cnJlbnQiIGR0cwozLiByZW1vdmUgcHJlZGVjZXNzb3IgZHRzCjQuIHJlbW92
ZSBwcmVkZWNlc3NvciBiaW5kaW5nCgpXaGF0IHNoYWxsIEkgZG8gZGlmZmVyZW50bHk/CgpZYW5u
aWMKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo=
