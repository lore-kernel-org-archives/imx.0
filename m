Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.43.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795586773;
	b=u+V/P8VCBIlpjMpVLjuHiKByBAxxYZcLgAyYnU5HND48K3Lnh3zyThG5m64rzdHBMGjm
	 DFsoF2ARN916p7GXMf+FkonZKn/ji1manHqeAyUTeV/mtAdBYlKA/tCAu27T3VgSIe7M1
	 Nadz+FPPs2sseCNR7yiST8WbDxBgfVbRM8B3tGhhLJYOkm33lxcRkxYitztCmiMYamE3K
	 Dvvb9ratcKWkItE8GGuYkX1cPQ8nWSRH+cB/yPBGH4JwOAOsmMXoCeyb9dktIHN1LNrRr
	 GA6WIV5UwdMajfpsLuKiYvkfJtrOZDiHXZTw0acQ5CzN5h7VUpYXuU80TvZVdh0tAwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586773;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SKRzxOZyWNhfpkOyDHeKNJvfGT5AiFvBuyUPZH3gujg=;
	b=wI24H1ZzvBv9PdoJyBDkvEusQHWqPKPFrU4JMF4oaiK1Yk2kCzWdxJennRLGZymlsjkL
	 opb740tr6DpI8m84MEszoOJ8MzeGy6pig9bFAUa3/XJ7Y+QEgr2d+2ti6QswPM8ZvSZL3
	 4lUGxeIBZvulig1iK+jlpvgUqP5MB6yVExa8Jc6Dkif2VV4uGNE8gMuxRL+M1RPBtCpDz
	 CNgEbkB5n7o24Xz4xTRpvq6Lh77GbMPPIYpfhiIREkrfMDdrC/XRZOpx4vhPLPbrGUifl
	 4atHvHKz6V6xMZ4nUbjVCAyhaWxmC0PNEdL286f8go9htFZmifLqMQDOPeAolUvYEtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b="GZ0Lm/dF";
	arc=fail smtp.remote-ip=40.107.43.119
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022119.outbound.protection.outlook.com [40.107.43.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66A606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 06:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E66A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=GZ0Lm/dF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W37thigMN/vj4q1TxvqZAr2O2pwFiDQJ80AgmBmN7yCGPC4JJZggZ/pcVtz94ueOOs1GHtrt3l+/YClsxtZb7FymUJCgOrovfU81q1BOkTNcCNT/g138zXbsxelcsBmm/i64dgjN+TlAuPWMWPXWAuhmtbiVjBtSMBiui37GqK0ZyoYQHsBIk1EDu0B1wmHT+eUpvxnRX85Qr4RG3ayy/6RraypHW9q9hhma0se55YcJQqLgZJMMDEMbSgIHo3LRN5IV9yQogctoyPUJFPHVbU2yjtzCZSAs4XfZkBA0Pc9HFXthJTgnIRsD7ARQGHbbB8dW7ZZz5Kh2VUi25wngWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKRzxOZyWNhfpkOyDHeKNJvfGT5AiFvBuyUPZH3gujg=;
 b=p7ekAXanjfvnJ9Tr97XBB+/I3WjIIJs34o+5hTcM8oNtlmuwSDAm2uNbRL1jSt3AKFJk7vq1hLMElkWvcN6bCn6pb4t3VSbHfDb7TTuNzHjb9NFfEcqbliqs8HKg735flEfnwO8LcrrvXiT3ev5V6EosNpBLv1/6/1+bnGgSbwkslBKFlGeyxCUkBzkrtepD5JmwsJpo+l3a5qFIiXWdH8gEgnUBM7Aut5izlFO/t2ZWhiPRg6rlPqUucL/kApqRJiT8DaRNLuJq1E8PyQawJBG/NM4hFIcQzAhkCfREhSB82WvrOE6OY7bkyJ8Dm6QMFK8EnIRmuiyWPlXM92aIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKRzxOZyWNhfpkOyDHeKNJvfGT5AiFvBuyUPZH3gujg=;
 b=GZ0Lm/dFUWniJSFG6H39i9jY3B5HkpLBeNPDMavsxbUvMd228vK9iDxW4wj/SUULXOxn7+jCK/GWk7MY/WNc8QF9ylmsS442WIGH8Q6UlmDK4HpZS+xZ49SSgxipZJVUBr2lK09dzuS4KDfmpOqY+BKeMTGGGFCXbt5y2Z3VegdZ70O0PstiIrlyeXxTo5Y6uonkQrzG1Smnv2ygo0Tg7uuHL0/Z15sY1fiUEaqWPqIk9vrGQN7A84Kg+BYLVtJvtntmEWvnE5WyMbLlsgvof3i29AVJ3yptAeuc+svxzXLfMcIX+V3aa+cwMt3oQHvFruOY3cZc/Eqsv8jFFRA1KA==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUYP216MB2905.KORP216.PROD.OUTLOOK.COM (2603:1096:301:157::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 06:06:05 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 06:06:05 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Frank Li
	<Frank.li@oss.nxp.com>, Detlev Casanova <detlev.casanova@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com"
	<festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Thread-Topic: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Thread-Index: AQHdeARslT7+PahjZk6zjlKKFGa+pbc14MWAgAWF4ACAALrygIACM3EQ
Date: Wed, 25 Nov 2026 06:06:05 +0000
Message-ID:
 <SL2P216MB244180F5C6B16CEA1CA94589FB432@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
	 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
	 <av9iadpXveXGb0R0@SMW015318>
	 <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <8624fb6a39e5e13466882f01ea54842252f154af.camel@collabora.com>
In-Reply-To: <8624fb6a39e5e13466882f01ea54842252f154af.camel@collabora.com>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUYP216MB2905:EE_
x-ms-office365-filtering-correlation-id: 1ed1cdab-0b8b-4945-44b4-08df4aba30dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|56012099006|261022105027099003|261022075727099003|261021135927099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|4143699003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 AEgbwJvLoUYtEVI/67aBWXLQP7T/pK6pTbEADYVPPRNd6Q6OAAv5kBfxdUUX4jiU8RqRZtxonqxCjZQAkpwQQPcqSxFBEIQZd9W1/Yhf/qT6w2qEfQKRB1WIf44UocFzJt6+VgsnmS9S8l2wuY3r6Yu+TzLhuJo5g8bfRTBLufFXiabT3lr4P1Htbgh7U4OD8OMQ1VjOvjXas0f7tAgbOiTvxjdsKNs8WZ09LxGmCA67gUUv759sH/Fd/RSpSX67jXRLC8K6X6zbX/El3TZHUWUmWE2JNzDPypALrD4xtf6zlDlRcEgHKO9AuPImfmDsNLdVCpMxjiMYMRdG83R3KfLow50krAp8ft0a+MPlk+ncyMfupiuKBWqIEOq7wK7UZ7vLfakCpoPcc3ErswpiIKNZgc24GWrOfH+PcLWlA36L/zW1ji4fzcfShVIs2rejjAWM82vD4AfBnZ2YnArEa07h0IcIW9VamilPJSfrXP0hxYJ7rOqI1KWQXVeP1Gr/EVK0nwnRJrgVQcZVWgAS930kNb21fazisGH31E3/42lLm589nyc/yx2A85yQ30c/btJcqjPn7IEXXkyVHVk+0T9Uzz3vPh1vXRBc/5WWJ3Z7wT9AmAcw7T0pdxYlR7lTp65QQEiyS+JvDY4KMyGRXYTwINaWWEuT8ttqYzKTTYM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021135927099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(4143699003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXVnUndBbUNsSzRTcXEvQm0wM2k0U0lZVXZPWFpKb2Y2OEFiRGFMR3ZiK2kv?=
 =?utf-8?B?UUg1WS9weDJHckRLVDdEeVVrUDZYWTZLcUsyYVdIaSs3dzJQaFpuZlVzTkNG?=
 =?utf-8?B?RmwyOCtiRVJ2bkJLM2t0dzJTanh0TnlVa20rZ3Vmc05nNTNpSEdxcDB2TWc1?=
 =?utf-8?B?L1BOWHZiMnpHU2czOFhMK0hFWWpIOFk0VE5lNHhrRkV2YjgwZGczTnRqeFUx?=
 =?utf-8?B?aW11ZDFxOE1rakI0eDRnUDRDbEVHTU9JV2NpSUFiMXppc3NTNnlSazhSN0pv?=
 =?utf-8?B?WTdJZG92YjZ3ZFhHTUlkcCttZXVSOUtRbWtuVFpVTjdYM2JudDJJN0RrVDRp?=
 =?utf-8?B?QWxxbWNvSmNSU3Z3WlpjanlFWTB1WWsvUDM1QTR1NGxPaHhzZXJ2YS9WUUdW?=
 =?utf-8?B?MUgxTnlaclBHOGwxSmp5Qk9XUnp5UVF3KzNreFZla291Z3ZERnMrSjdLajY4?=
 =?utf-8?B?L1VwZVZoUWVva1ZqZGFReFgycVBKNDhaSngyQmJkYkFjVUFZZ1ZaQVgxKzdB?=
 =?utf-8?B?enpHYzExUFV4cWs0Q2JHNUtFQXQvVGZyMFMwTWc5MWJMQk5sWHNsMjh3Rkto?=
 =?utf-8?B?Zm9YUE85cEtscDNrWUFkOUI3OFVOeEpvcVBVcEpMbERlTmZCN0NmOWJDbmJ5?=
 =?utf-8?B?WnNPaHJwR3EzNi8vc3hJdDU2V3ZEa1BncUxldXpRTk1TWUs3VlA0TXpYWGJ0?=
 =?utf-8?B?K09yZithQisyQmdseVlPRFRUb0E4dGpUL2VEK0hYUHVqZmxQRi9iTU12bjdo?=
 =?utf-8?B?dVp6SmZpQ0JGNnM0WGNlUXhsMkZPZ3orcWgwblJqQ1hITEpibForMlFIVXY5?=
 =?utf-8?B?SWxiVUZZYlFhQjArWnh1QnpNM29odkN6RjBhRkpQemhSYjljTk8yU2ZVOGlr?=
 =?utf-8?B?QitjM1pGRXk0VUJqVWNkcjBjeDg2TnFHaGhMNmt0NG9uWTcxbUpLN2dGSnFP?=
 =?utf-8?B?QVdMSy80c3g4d25aUW9tcDNVSitRUzF2b1NjYzJZWUoyRnJPb25ydlI5cS9M?=
 =?utf-8?B?Nk9tNXBXbmgzOUgyK0MyeGV2OHV4K2VJQ05KUWdhOW1OTXhkdWdmNm81eFVt?=
 =?utf-8?B?Ync1UnBSejZLdnMvV1ZWTzRtWEwxSnhDcXdrNmtwdnZWOVZOOG01UysrWmhH?=
 =?utf-8?B?SzhRUGF3TU9LNXFJdkwwUjQxbWFrMGJDdHgzY2hRUXFiZ01YOGFTOUEvNHpr?=
 =?utf-8?B?V3lEZzVrTVFub1RpNnN6Y0x5S1J5bVRrb0ZYdGExa0NIVGZKS2RGa052cTd3?=
 =?utf-8?B?REZRWmxjTEtGVDFNR3dYZkhKN2Q5SXM0SFA3amlUbTd2RDl5OHlXZEZiNDQ0?=
 =?utf-8?B?dzhmTTdLczQzdit2VDQxL3pYOHV1OXRUWGpOYkp6ajBPVS9YYkxQNWRVMThY?=
 =?utf-8?B?bFVoZnNjS0R1T2NKY0x3VndvR2RlcHF0dERnUzM2bWFkbDZkell2cnFKV29S?=
 =?utf-8?B?ZFQwS1F1UzR5ZjU4UkRkbHJZUlQ3dG93QnZZY2xZRGJ1U1Z5VHVwNktmQlQx?=
 =?utf-8?B?R3RjeDFQbmdjWkFPUU9scjlETmpJbzFvRit4V0hNVVNITEU2bmhzeFVZTG9x?=
 =?utf-8?B?VFpvaHZJYWZJa0Rra3dCeW5UTVcydy9ZcmE5UTQ3STVyenlPQVhTR2Vhc2Iv?=
 =?utf-8?B?ZzBubmtEOFNwMEhGL0NJQlpPZ3h5ZWdMOHo3cWViU1A5KzJ6K3lnTDhVMEVK?=
 =?utf-8?B?cUdPdytQdVRxM2NHWlBSUE5rRndlL3llcUNZUjc4OUdwMEpqMU9pa2NxVFNG?=
 =?utf-8?B?Nk1TdFdqQUVZMkc5a1lGYXJTL0xPbTU3WVRjVHVkekRjS3NsS0FHb3diVDZ5?=
 =?utf-8?B?cDlDZ2t2ZWJ1ZE1Ga1JnVmYwLzNCMFV0ZXlkZStMdnpzK2ZVQlNyYXEzdXhs?=
 =?utf-8?B?L3lvMGxIZWJtK2szcTNrWGlSc2d0Yzd0bnpjc0lzSk5Zbyt2K0J4Y2g4d3hN?=
 =?utf-8?B?QmZjUWVsUnVWdk01RmJXcFZlR2I4L3A0TzdqanVGbysxWW40L25zUkJGcWxV?=
 =?utf-8?B?RHJyMXBDT3JBYXRVQ01VWENROEVPMHZZOE9vd21TeDRtRGd2M2R4ajUyb1pn?=
 =?utf-8?B?M0ttWFFCRFZpME9kYnZlbkl5ZEF0MXRrM05kMUdpcUZudERuNDJaU0N4dTI0?=
 =?utf-8?B?ZDI1WnJmSXljRG4xR21wdnFlZXhNNHkrQllBemJodFIxcDN2bm9MVC9CWVZp?=
 =?utf-8?B?MStmcWlMTHpwWjVPVTkwOGliR1dxdHB1RVBrSXI1UjMwMUdmUFFiWStwcEtZ?=
 =?utf-8?B?bVlTYlVYdXBRL0pKbzFxdERvK1ZVUzhsYTRJanB2bVVpK043QkZLdzN6akZX?=
 =?utf-8?B?Q05PSFRkalY5M2VBQ2ljdWR3L3NReDVUeTRmMTd0N3U3WUNxVG56Zz09?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed1cdab-0b8b-4945-44b4-08df4aba30dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 06:06:05.3947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8doIicZTHYV66KoTFwE7IMu3OtELOR4QpqOE8cmWt/SMUZ8jCuu9KxIpkatvjRAnNXC5RnEl+FrXQjAZJLDyX833G5DeiHO+er6PHy1bU+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2905

SGksIE5pY29sYXMuDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj5TZW50OiBUdWVz
ZGF5LCBOb3ZlbWJlciAyNCwgMjAyNiA1OjI2IEFNDQo+VG86IE5hcyBDaHVuZyA8bmFzLmNodW5n
QGNoaXBzbm1lZGlhLmNvbT47IEZyYW5rIExpIDxGcmFuay5saUBvc3MubnhwLmNvbT47DQo+RGV0
bGV2IENhc2Fub3ZhIDxkZXRsZXYuY2FzYW5vdmFAY29sbGFib3JhLmNvbT4NCj5DYzogbWNoZWhh
YkBrZXJuZWwub3JnOyBodmVya3VpbEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+a3J6
aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBGcmFuay5MaUBueHAuY29tOw0K
PnMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj5k
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsN
Cj5pbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7DQo+ZmVzdGV2YW1AZ21haWwuY29tOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IG1pbmcucWlh
bkBvc3MubnhwLmNvbTsNCj5tYXJlay52YXN1dEBtYWlsYm94Lm9yZzsgamFja3Nvbi5sZWUgPGph
Y2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47DQo+bGFmbGV5LmtpbSA8bGFmbGV5LmtpbUBjaGlw
c25tZWRpYS5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2OCAwOS8xMV0gbWVkaWE6IGNoaXBz
LW1lZGlhOiB3YXZlNjogQWRkIHBlcmZvcm1hbmNlDQo+cHJvZmlsaW5nDQo+DQo+SGksDQo+DQo+
TGUgbHVuZGkgMjMgbm92ZW1icmUgMjAyNiDDoCAwOToxOCArMDAwMCwgTmFzIENodW5nIGEgw6lj
cml0wqA6DQo+PiBIaSwgRnJhbmsuDQo+Pg0KPj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4gPiBGcm9tOiBGcmFuayBMaSA8RnJhbmsubGlAb3NzLm54cC5jb20+DQo+PiA+IFNlbnQ6
IEZyaWRheSwgTm92ZW1iZXIgMjAsIDIwMjYgNTo1NiBBTQ0KPj4gPiBUbzogTmFzIENodW5nIDxu
YXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPg0KPj4gPiBDYzogbWNoZWhhYkBrZXJuZWwub3JnOyBo
dmVya3VpbEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+PiA+IGtyemsrZHRAa2VybmVs
Lm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgRnJhbmsuTGlAbnhwLmNvbTsNCj4+ID4gcy5oYXVl
ckBwZW5ndXRyb25peC5kZTsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPj4gPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4+
ID4gaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPj4gPiBmZXN0ZXZhbUBnbWFpbC5jb207IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj5u
aWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb207DQo+PiA+IG1pbmcucWlhbkBvc3MubnhwLmNv
bTsgbWFyZWsudmFzdXRAbWFpbGJveC5vcmc7IGphY2tzb24ubGVlDQo+PiA+IDxqYWNrc29uLmxl
ZUBjaGlwc25tZWRpYS5jb20+OyBsYWZsZXkua2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNv
bT4NCj4+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAwOS8xMV0gbWVkaWE6IGNoaXBzLW1lZGlh
OiB3YXZlNjogQWRkDQo+cGVyZm9ybWFuY2UNCj4+ID4gcHJvZmlsaW5nDQo+PiA+DQo+PiA+IE9u
IFRodSwgTm92IDE5LCAyMDI2IGF0IDA2OjAwOjAzUE0gKzA5MDAsIE5hcyBDaHVuZyB3cm90ZToN
Cj4+ID4gPiBBZGQgcGVyLWluc3RhbmNlIHBlcmZvcm1hbmNlIHByb2ZpbGluZyB0byBoZWxwIGlk
ZW50aWZ5IHdoZXRoZXIgYQ0KPj4gPiA+IHRocm91Z2hwdXQgcHJvYmxlbSBjb21lcyBmcm9tIHRo
ZSBmaXJtd2FyZSBvciBmcm9tIHRoZSBob3N0IHNpZGUuDQo+PiA+DQo+PiA+IHdoeSBub3QgcmVn
aXN0ZXIgYXMgcGVyZiBpbnRlcmZhY2U/DQo+Pg0KPj4gVGhlIG51bWJlcnMgYXJlIGtlcHQgcGVy
IGluc3RhbmNlIChwZXIgb3BlbiBmaWxlKS4gRWFjaCBpbnN0YW5jZSBoYXMNCj4+IGl0cyBvd24g
ZnBzLCBsYXRlbmN5IGFuZCBtaW4vbWF4IGZyYW1lIHRpbWUsIGFuZCB0aGV5IGFyZSB1cGRhdGVk
IGVhY2gNCj4+IHRpbWUgb25lIG9mIGl0cyBmcmFtZXMgaXMgZG9uZS4NCj4+DQo+PiBBcyBmYXIg
YXMgSSBrbm93LCBwZXJmIGNhbiBvbmx5IGNvdW50IHBlciBDUFUgb3IgcGVyIHRhc2ssIGFuZCBh
IGRldmljZQ0KPj4gUE1VIHVzdWFsbHkgY291bnRzIGZvciB0aGUgd2hvbGUgc3lzdGVtLiBTbyBw
ZXJmIHdvdWxkIG9ubHkgc2hvdyB0aGUNCj4+IHRvdGFsIG9mIGFsbCBpbnN0YW5jZXMsIGFuZCB3
ZSBjb3VsZCBub3QgZ2V0IHRoZSBtaW4vbWF4IGZyYW1lIHRpbWUNCj4+IGZyb20gaXQuDQo+DQo+
TXkgcHJlZmVyZW5jZSB3b3VsZCB0aGVuIGdvIHRvd2FyZCAuZmRpbmZvKCkgdGhlbiBpbnN0ZWFk
IG9mIGN1c3RvbSBkZWJ1Zw0KPmZzLiBJdA0KPmdpdmVzIHRoZSBGRCBvd25lciB0aGUgcmlnaHQg
dG8gc2VlIHRoZSBzdGF0aXN0aWNzIGFuZCBub3QganVzdCByb290Lg0KPkhlcmUncyBhbg0KPmV4
YW1wbGUgb2YgaW4gcHJvZ3Jlc3MgYXR0ZW1wdC4gVGhlIGlkZWEgaXMgdGhhdCBzb21lIGtleSB3
b3VsZCBiZQ0KPmdlbmVyYWxpemVkDQo+YW5kIGRvY3VtZW50ZWQgYW5kIHNvbWUgb3RoZXIga2V5
IHdvdWxkIGJlIGRyaXZlciBzcGVjaWZpYyAoZS5nLiB3YXZlNi0NCj5wcmVmaXgpLg0KDQpBZ3Jl
ZWQsIGZkaW5mbyBmaXRzIGJldHRlciBzaW5jZSB0aGUgb3duZXIgb2YgdGhlIGZpbGUgaGFuZGxl
IGNhbg0KcmVhZCB0aGUgc3RhdGlzdGljcywgbm90IG9ubHkgcm9vdC4gQ29tbW9uIGtleXMgd291
bGQgYWxzbyBsZXQgdG9vbHMNCmxpa2UgdjRsMnRvcCByZWFkIHRoZSBzYW1lIHN0YXRpc3RpY3Mg
YWNyb3NzIFY0TDIgZHJpdmVycy4NCg0KPg0KPmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDcwNi12NGwyLWFkZC1mZGluZm8tdjMtMC0NCj5kNTU2NTY4Y2YzOGVAY29sbGFib3JhLmNv
bS8NCj4NCj5UaGVuIG9uY2Ugd2UndmUgdXBzdHJlYW0gdjRsMnRvcCwgb25lIGNhbiB0cmFjayB0
aGUgcGVyZm9ybWFuY2UgbGl2ZSwgYW5kDQo+eW91DQo+Y2FuIGV2ZW4gYWRkIGRyaXZlciBzcGVj
aWZpYyBtZXRyaWNzLg0KDQpBcyBWNEwyIGZkaW5mbyBpcyBub3QgbWVyZ2VkIHlldCwgSSdkIGxp
a2UgdG8ga2VlcCB0aGUgZGVidWdmcyBmaWxlDQppbiB0aGUgc2VyaWVzIGZvciBub3cuIEknbGwg
Zm9sbG93IHRoZSBmZGluZm8gc2VyaWVzLCBhbmQgb25jZSBpdCBpcw0KbWVyZ2VkLCBJJ2xsIHN3
aXRjaCB0aGUgc3RhdGlzdGljcyB0byBmZGluZm8gYW5kIGRyb3AgdGhlIGRlYnVnZnMNCm91dHB1
dC4NCg0KVGhhbmtzLg0KTmFzLg0KDQo+DQo+Tmljb2xhcw0KPg0KPj4NCj4+IFRoYW5rcy4NCj4+
IE5hcy4NCj4+DQo+PiA+DQo+PiA+IEZyYW5rDQo+PiA+DQo=
