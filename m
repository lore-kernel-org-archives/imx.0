Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D61B3B19
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609422; cv=fail; b=NUBRJpIg99Ro3CbTU0MxhdiDXndFQr2+m9NnTo5/36b+TepUt6B/YvjUe/zeoaEiff9nv9YbFNgMS+Z5ONDCHa8HSx58eZIquFAznLz3AgnKNAhTEc0w4Qw7iUYzvFKON0CAUtpgwQtV3d6fiF+i23gAajnHZa/WfGjOfALA9RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609422; c=relaxed/simple;
	bh=DgMBautPDHCZKerr3Ndh6p3zfcswCuYwezt6vv+LMbU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RVeFFGw7CS6aUAQXSk6dZZl8h+Ifm2nvqTfCozqsx9Bs2vjbn9xohBBpgEB4C2hky6m+ddF5/Cks7eNKTGRW5Q+KYO+hps+c/y8V/TrWM5ZK4MuCl04IDJHsE+XmjTZCkPiU5w8lPfGNhO5ztWnxcFVxI9odSUwxxBZGyPM1wP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hLTpIG/w; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hLTpIG/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUYPfahc5DqmgbExmUsNHduSAvlxVW2ZARjocZa8lDFZnAaTnp2ZCvU3yIeQCjEFlmfj8Kph9uTD9TEgsGNeLgIz8hSha06DMzvFCsMkR3HTfQYjCDkjyf/ayRRTL6KaNADslsU8Bv8myG+KYo63a4nf2BY1ipfIbgXBa0CysuRX8Kjnv6/UymnulpGB38VtCaV4bZoh5Vx1g4wuciFioE1eu/gesSIDVonYra68wjorYKTXnpW7POAdd/S7OPVEo4NAWyFt0YJ5UmpE87RIitMBaYo87nVx5PsfTsLIBsjqxH9LG1KqSk579CI72g04krJ/qkjiYo+2Kg3EPImkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgMBautPDHCZKerr3Ndh6p3zfcswCuYwezt6vv+LMbU=;
 b=j/4ad6by0dszTtOME+uuOZn8A31zas7AoabobOJ10S8/MiVTDdPTSz0OEhlZxNP60nDCwLXjjZhTyUrZ+jQ/hTHnhnMUqdIxAg+sbinprOL1Az/zE0A4+tK5/N+osG+foX/Dg9Rvq9UCYG7UztzP1mY/hMi20HtQCRCYiI3oKL+hbLaCJZhL5anc8+RqE9+aZ2sNku7AzpE1+EB8IGEo+4avt+HMgP0jb8sjSg3Jc7kT4h2qPrL0grSvxd+L77K56eFefxqvIpi5zaEsYP3j922gD37xdw97R6WgRH3JEMPDy7V8kofnrByc+bxhtR/eVJ91l/zfJg5gC5OIh4larA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgMBautPDHCZKerr3Ndh6p3zfcswCuYwezt6vv+LMbU=;
 b=hLTpIG/wOtYea02shc3jD3z2YXNCzPg0E6rVjN2lhew+fgH5d7283L0SuJuKgjBveiPzFs7+EHxN/gyCZdN3EUtOyAHJUZocuIQVLxtxdm23++tstMMt0VL279AKPIV1/zSqnNJFgxk3WK0WdEtD4n5p0maStSLztJf1nE8MYJWxlOxs3S6+MfgecsqHvjJadOTmlXc4v7fwVNXJ1E4vaj3oELy58Y5F1vWH+Oxz5lhb8hMBz/Tc8M6x05RhWUUkTixMXYPK4R6FvaazvNXG2cnO0bWQX817u6yI9iuW0LKW+KbaDs2WyTON8lIvDTvcrW/eqxslapKWBsOr3+N1Rw==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 07:30:15 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 07:30:15 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@kernel.org"
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
Subject: RE: [EXT] Re: [PATCH v3 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Topic: [EXT] Re: [PATCH v3 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Index: AQHcq4LUzuYsUIyHmEuZBvAxCcm5vLWd3CcAgAAeC1A=
Date: Wed, 4 Mar 2026 07:30:15 +0000
Message-ID:
 <AS8PR04MB84208D5A9F6771E838B6B953EB7CA@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
 <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
 <dc5191d0-831e-4da1-b498-da41a57b30b3@oss.qualcomm.com>
In-Reply-To: <dc5191d0-831e-4da1-b498-da41a57b30b3@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|PAXPR04MB9643:EE_
x-ms-office365-filtering-correlation-id: 05d6466c-bd7f-4949-5a8e-08de79bfe126
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 9NlxXTZDo8s8bSl4capwslbwa/BmyouLvguJzW8h6RMA3VgWb4MzHcxw1lYQhPhOEpHDh5tLbKiCnlmb4faWNLC13O3EUXLHryTt4+EvfG0yxLV4P+6RQ4f2T/xgfkCbt0X4rQqGqzRxJ8GOLmsleB5H7LMj4y5J530Lkl2IOTcOogeAPTe6q4YTM/4V2Je3qBy+Kr3rtI1qWBWLkjkzEpmC8Yz8iyyLco+1CKx9FhAPi9i0OKw9v9Bo8J8dad+FJ4N2haYejsrLMA6wjKya+52INP/F5rYcjQCJjcTLmj0D5gRQUWJEW/se6K2RE4wi6r8YzUx8sCUqEbL7YzteJPJx5Pu3ElA2dK8udkzpNnXlanmSy2SxPHp11zeT5vj3W3EL4FcqOGsI9MALkM9Mg+tqVtb11dV2JacZOIARwSRT+Y5EZUNFoU+y081YoGvMX1CtQ6W6r0TjKXKk7Hp0hC49rQRsrugZjVgHLRIHR8lwW8JMBB/YvdtTB7JiBpADwANarAvF5u28DVhFR6+wfB+8MrwQvemCs5TaItDVQGZmOp154qsch3AD39Da7ViMHHcsl9je2f5s22Sz46vZPoULjBl2IrJV702yf4iPRGYKhkUzYIZgLizxbjDldnmCiAlmtVEsdS7U0EXrmCTLhXasa/Mw/F3sXq26qkaz4Qu5ep4oTx72gt7hW2iD5nTZf8y8zA49OVNsvqaNDVW0gNhytc0G598pP0eT++0HMbc7f3SzyZ6n3lzdMqfMwPNbSO6N/82qFDTq7FFv+IrJnvArcdYbze0HxtbkvrMwLAA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bFR5dWJvUGs2RmUzTmJZMU1qcFFCUkNHRXZHeEsrRTZud2w3WkJsbC93ck42?=
 =?gb2312?B?VWgyeXZsOVNpekV4TE1mRTFDeTQ4NkJnVlp3dEpXTTFlWmozR0p5cUplVXNj?=
 =?gb2312?B?aVR5S1E4UWl3dXhYN2JuU28rbEJFWTlmSEtzRFU3VjBudVEzV0pFMjdNK1gy?=
 =?gb2312?B?UnN3ZFN6RXJ2SHlORkkyTmd3cllyeXk0RGt0WmY5K0xWQ282WDY2M1pYQUx1?=
 =?gb2312?B?UFRTYVJIbUxDOVNOR3VSd1BYbWV3Z0ZNdjQ5SUMzUFhBc3hOVndJeTBxUlZy?=
 =?gb2312?B?cTNlTnl6Y1BJNGxmMUg3K0FYWk1zdkFWcDZCWndBaXNaQ3IvU1ZIR2JxYWRr?=
 =?gb2312?B?b3IyZWhLRmtETytiNVZySWltci9MOWhhVlRxNEUzNXRZK2xyczFMR2RMTVdK?=
 =?gb2312?B?YzZTaG9vWTVwOXpQakdOMTdLZ2Q3d2VyZi9NVFdEaXNkdFdkMG42U3RMSHp4?=
 =?gb2312?B?b3BPVWdQRzVDVDZuS09wMk5qRkFKL2YxWHpTcUJyL29Ib0lPYWpXc3A5WUlY?=
 =?gb2312?B?S1d4ZmRSRjJnZForUzlTS2lpeUk1T2lpdmtzRndpenkvVVREMWFOOTNwbHdF?=
 =?gb2312?B?RXl0ZWs2UVFHRmpJWUZ0MThKS1B5Qi9UaWp5VGRSamVFZ3crc1lBcit2SEJH?=
 =?gb2312?B?WXZIZmhkeGUzdUxjcSs4cUt1REp0bjFHZi9sR25mNUM5M0ZvMTIycHEra0tl?=
 =?gb2312?B?L3N4N2huRTAvd2oxcFBEalpjWlp4TDNQS1Z6VnM0WEExOUQ4dFdWeGM5dnUw?=
 =?gb2312?B?L0RXbzZPUkJxS2x4NmhyekdzOFNzREVCamhya0w5MHBHbTkvMXVnNFZBYlhp?=
 =?gb2312?B?Mm1OeGw2RXQveGZ2dzByUVZPbXF6OUYyalVjSVFyczhYUjFqWDc2YythV3lq?=
 =?gb2312?B?V25wQlgrMGtTcEVoblgzNGZWcDBxcE1IUjQ0QmRkZllLN0RxdkFaMG5WK0Vv?=
 =?gb2312?B?ZnQyWThoYVFQamVKM2kxbkdkWE1tblFqT1htajlmVW16dnN0eXAyejJTL2NM?=
 =?gb2312?B?cjZ0V25wbk9HOGlLeHlMbDJObEdTV1NtdlpNcUd1eEZJMjlCZDlNSEwrSElB?=
 =?gb2312?B?OXgwTVBpTVdxdWVoUVplaFdHZ0JZUDY3Rk9oKzBXcDNZc2RtbDEzNXVQMXJZ?=
 =?gb2312?B?RFhDSERLUnRhVnlsOFRBVVFZeTVlMjFONHRidm9aREVFdC9VM1cyem5BTTF4?=
 =?gb2312?B?dHB0UjVGVExEWk1VVVJ1dVV3RXVzOSsxVy9QVW40TE1kL21IajZ5T3lUTmFQ?=
 =?gb2312?B?U3E5U2lBaDVmN2RZTFk3ZjZSZllQdjFBN2NqR1NydHJYN2ZqdUZyYXB5a0tF?=
 =?gb2312?B?MUpKTFBqZ0E1TUhWM0lXVmtMQjdYZ1lHaERXMnpYbFUrMXhLNytKMnR3WHVN?=
 =?gb2312?B?K284NWo2Q21PSmhpelpnU1lHRmJCSWo4YlM5aU5YODNJME9lOVF0WWdhM1VB?=
 =?gb2312?B?cEtnR05UUUxGM25mVC9wTHVzZHMvZXBKbGl1VDlha0NTa3ZYNVJrOGl5MUJZ?=
 =?gb2312?B?VG03dCtCYzI1MHZuTm1LWTNZb0ZjMk9yckNGZkxwejQ5bEY0RS9vQWpsQ1Rt?=
 =?gb2312?B?L3N2UHNQd25NNC9neHJqZ1ZYYTVLRStiYVkxR3dSS0UzcGR1UnBrdkxoOENE?=
 =?gb2312?B?ZnpndU5mSXJlT3lhWjdRcDcwaFZMWVNZaXkrMlVNRWpzRmlYWEF6RnRUa3dK?=
 =?gb2312?B?TDNhelluR3JDZkdoWXBLMnlXZHEzdnRJc2VrKzZOSURidnd4bDRXdmNaUC9Y?=
 =?gb2312?B?YjFYWVBYSnU3Zk42Y1VyOHNmeUtSOEhrajhOWGQ2anE1enh0ZHhHa3F4VHJU?=
 =?gb2312?B?TW9HOW9aNjFjcW1sWjYwYkVPbXQ0TzBZL0RlVEZ3MEs5dmNycThSc2RsOHF3?=
 =?gb2312?B?ZE9vb3hVNEM2YjFlWUJQeS85cEtPYVJqRzQzR2NvYXV6S3NveUZCN2l2bXlH?=
 =?gb2312?B?RUsxa1B2WWxnakZMaXdFKzZkOW5BZlhpdGVmcjhjUnJRQThQNjJBNG1md3BS?=
 =?gb2312?B?bmloQkZRTE1kTDhOWFdTSC9WMmRmbGExQ3lhRTluajFza3RFZ1N3NzNiUVZB?=
 =?gb2312?B?K0xHV01USm1rbjBsTmlYTEQwZERDK1lJb2Z2bzNkbUQ3bW5WSjlRUGJCK3Rx?=
 =?gb2312?B?MVJTNFl3aExIOXhscXd0VDFWQUtuT0RzOFRVTkdOYUR1cERIaUswSmRENkJX?=
 =?gb2312?B?VzEvczVSL3J2VWdKQ3hzMlNXWUltRzdxSEVhSTAySWt5NTVTeHdKdlEwempY?=
 =?gb2312?B?b0toWURzODNuWmozeitsQlordWQ5cmpIYVI5Z0dzdDZHK0hqSUswL3p0N3ZL?=
 =?gb2312?B?Z0dtenplU2U1Ym0vOUNCcDc5OStOQ3BFS202TlNoRFptUGh3OUExdz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d6466c-bd7f-4949-5a8e-08de79bfe126
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 07:30:15.5784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQAwQMD0qapwYye2WxUNQpIclb0Z64u1fNJgPI4VcBmMG5HCeaOvUXpSTp+VpH2UdinbfkI+Xen+k9Vt7ewFUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643

SGVsbG8gVHJpbG9rLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCg0KSSB3aWxsIHVw
ZGF0ZSBpdC4NCg0KQlJzLA0KWmhpcGVuZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFRyaWxvayBTb25pIDx0cmlsb2trdW1hci5zb25pQG9zcy5xdWFsY29tbS5jb20+
DQo+IFNlbnQ6IDIwMjbE6jPUwjTI1SAxMzo0Mg0KPiBUbzogWmhpcGVuZyBXYW5nIDx6aGlwZW5n
LndhbmdfMUBueHAuY29tPjsgZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsNCj4gdGdseEBrZXJu
ZWwub3JnDQo+IENjOiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRl
OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNvbTsgbWF0dGhpYXMu
YmdnQGdtYWlsLmNvbTsNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGNodW4taHVuZy53dUBtZWRpYXRlay5jb207DQo+IHdhbHRlci5j
aGFuZ0BtZWRpYXRlay5jb207IGpzdHVsdHpAZ29vZ2xlLmNvbTsgYW1lcmduYXRAYmF5bGlicmUu
Y29tOw0KPiBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgSmluZG9uZyBZdWUN
Cj4gPGppbmRvbmcueXVlQG54cC5jb20+OyBYdWVnYW5nIExpdSA8eHVlZ2FuZy5saXVAbnhwLmNv
bT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MyAzLzRdIGNsb2Nrc291cmNlL2RyaXZl
cnMvdGltZXItbWVkaWF0ZWs6IENvbnZlcnQNCj4gdGltZXItbWVkaWF0ZWsgdG8gYSBsb2FkYWJs
ZSBtb2R1bGUNCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gdHJpbG9ra3Vt
YXIuc29uaUBvc3MucXVhbGNvbW0uY29tLiBMZWFybg0KPiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQg
YXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+
IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hl
biBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0
LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0
dG9uDQo+IA0KPiANCj4gT24gMy8zLzIwMjYgNjo1NyBQTSwgWmhpcGVuZyBXYW5nIHdyb3RlOg0K
PiA+IEZyb206IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCj4gPg0K
PiA+IENvbnZlcnQgdGhlIHRpbWVyLW1lZGlhdGVrIGRyaXZlciBpbnRvIGEgbG9hZGFibGUgbW9k
dWxlIHNvIHRoYXQgaXQNCj4gPiBjYW4gcmVnaXN0ZXIgYW4gYWx3YXlzLW9uIHRpbWVyIGFzIHRo
ZSB0aWNrX2Jyb2FkY2FzdF9kZXZpY2Ugb24NCj4gPiBNZWRpYVRlayBTb0NzLiBUaGlzIGhlbHBz
IHN1cHBvcnQgR0tJIG1vZHVsYXIgY29uZmlndXJhdGlvbnMuDQo+IA0KPiBZb3UgaGF2ZSBleHBh
bmRlZCBHS0kgaW4gdGhlIGNvdmVyIGxldHRlciBidXQgbm90IGluIHRoZSBjb21taXQgdGV4dC4N
Cj4gDQo+IFBsZWFzZSBhZGQgdGhhdCBpbiB0aGUgY29tbWl0IHRleHQgc2luY2UgdGhpcyBwYXRj
aCB3aWxsIGJlIGNvbW1pdHRlZCBhbmQgbm90DQo+IHRoZSBjb3ZlciBsZXR0ZXIuDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVkaWF0ZWsu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbHRlciBDaGFuZyA8d2FsdGVyLmNoYW5nQG1lZGlh
dGVrLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IFdhbHRlciBDaGFuZyA8d2FsdGVyLmNoYW5nQG1lZGlh
dGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4g
PiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgTWVyZ25hdCA8YW1lcmduYXRAYmF5bGlicmUuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgICAgIHwgIDIgKy0NCj4gPiAg
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jIHwgMzMNCj4gPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvS2NvbmZpZyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZw0KPiA+IGluZGV4IGZkOTEx
MjcwNjU0NS4uMjExMmVmYjg1MDI5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZw0KPiA+IEBA
IC00ODgsNyArNDg4LDcgQEAgY29uZmlnIFNZU19TVVBQT1JUU19TSF9DTVQNCj4gPiAgICAgICBi
b29sDQo+ID4NCj4gPiAgY29uZmlnIE1US19USU1FUg0KPiA+IC0gICAgIGJvb2wgIk1lZGlhdGVr
IHRpbWVyIGRyaXZlciIgaWYgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgdHJpc3RhdGUgIk1lZGlh
VGVrIHRpbWVyIGRyaXZlciINCj4gPiAgICAgICBkZXBlbmRzIG9uIEhBU19JT01FTQ0KPiA+ICAg
ICAgIHNlbGVjdCBUSU1FUl9PRg0KPiA+ICAgICAgIHNlbGVjdCBDTEtTUkNfTU1JTw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW1lZGlhdGVrLmMNCj4gPiBiL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVkaWF0ZWsuYw0KPiA+IGluZGV4IDdiY2I0YTNmMjZm
Yi4uNGFkNGJhYzZmMzRiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItbWVkaWF0ZWsuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVkaWF0
ZWsuYw0KPiA+IEBAIC0xMyw2ICsxMyw5IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9jbG9ja3Nv
dXJjZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9pcnFyZXR1cm4uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkX2Nsb2NrLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gICNpbmNsdWRlICJ0aW1lci1vZi5oIg0KPiA+
IEBAIC0zMzcsNSArMzQwLDM1IEBAIHN0YXRpYyBpbnQgX19pbml0IG10a19ncHRfaW5pdChzdHJ1
Y3QgZGV2aWNlX25vZGUNCj4gPiAqbm9kZSkNCj4gPg0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+
ICB9DQo+ID4gKw0KPiA+ICsjaWZuZGVmIE1PRFVMRQ0KPiA+ICBUSU1FUl9PRl9ERUNMQVJFKG10
a19tdDY1NzcsICJtZWRpYXRlayxtdDY1NzctdGltZXIiLA0KPiBtdGtfZ3B0X2luaXQpOw0KPiA+
IFRJTUVSX09GX0RFQ0xBUkUobXRrX210Njc2NSwgIm1lZGlhdGVrLG10Njc2NS10aW1lciIsDQo+
IG10a19zeXN0X2luaXQpOw0KPiA+ICsjZWxzZQ0KPiA+ICtzdGF0aWMgaW50IG10a190aW1lcl9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKyAgICAgaW50ICgqdGlt
ZXJfaW5pdCkoc3RydWN0IGRldmljZV9ub2RlICpub2RlKTsNCj4gPiArICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gKw0KPiA+ICsgICAgIHRpbWVy
X2luaXQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7DQo+ID4gKyAgICAg
cmV0dXJuIHRpbWVyX2luaXQobnApOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtdGtfdGltZXJfbWF0Y2hfdGFibGVbXSA9IHsNCj4gPiArICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjU3Ny10aW1lciIsIC5kYXRhID0gbXRrX2dw
dF9pbml0IH0sDQo+ID4gKyAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtdGlt
ZXIiLCAuZGF0YSA9IG10a19zeXN0X2luaXQgfSwNCj4gPiArICAgICB7IC8qIHNlbnRpbmVsICov
IH0NCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10
a190aW1lcl9kcml2ZXIgPSB7DQo+ID4gKyAgICAgLnByb2JlID0gbXRrX3RpbWVyX3Byb2JlLA0K
PiA+ICsgICAgIC5kcml2ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJtZWRpYXRl
ay10aW1lciIsDQo+ID4gKyAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtdGtfdGltZXJf
bWF0Y2hfdGFibGUsDQo+ID4gKyAgICAgfSwNCj4gPiArfTsNCj4gPiArbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihtdGtfdGltZXJfZHJpdmVyKTsNCj4gPiArDQo+ID4gK01PRFVMRV9ERVNDUklQVElP
TigiTWVkaWFUZWsgVGltZXIgZHJpdmVyIik7DQo+IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4g
PiArI2VuZGlmDQoNCg==
