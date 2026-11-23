Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438389;
	b=Yzu4kXpjMsxTB5MkxQjEagZKeerxyV839TrT+U9tepegZ2TnWq8m7jZiqwQfWwqPqDcB
	 ZH4BYFvwg7wB7ZzT+8hUsTfhcmtZKVyRPK8mO575g+E2X/LaEgurDct13G72MQ2HrkZEh
	 W3j7WVPJaaLz513pyhnOwoWUD4rP5pI2QL2UCIkOx5a5sMWAThP24wVUG/61kXAO8u0jh
	 r/vk9DkZCDxQ3mr76yDpXouti5yPdhNUN5MbCN5xlC5kUHYA4ueN59asPdRfMHJu+LukP
	 tZS2FxMeluiAF1Mf4+LtyGgcgOxzby5wnLnNwhY2ZYGDKwoUIwD4nZOwPU1p6qoljoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438389;
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
	bh=6qVgCKgUOwmeIT5fX5deR69AiVkRO2HnIDOLOuzmPLs=;
	b=3lcsjjc0WJSFJ1DpGW9YueCBLruHTaJEKGr/MUev5JNAq/mSuwvgjIF9lcQl+Rb6aNes
	 N7QddzrcrO/A3ZTs4XKAWXwb93JLTWoZ8b6Fsg90K5cpI0FYz1QUpSnkQjsrNUBlStffP
	 WUzHC1VwmnrFndZu8moSOsbK1IqrEBSj835iRPOb1aqTgSoNyassBvN2Nvg9W59hS9ToU
	 1yoDl22DE09OeHz6lPYULKoqJaKVktCJcoZ7LAqY0Fds7eLwbB28GEd3y+4ZAM7p06pT2
	 oh4i4eF4CVzwrtUQ1LBS9LFexvOH0VWsbjkYVn1ghqZMDxh1lITfFQW/qQ9TBTJsC2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=GyeL1hQM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.83
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020083.outbound.protection.outlook.com [52.101.69.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073C606A337
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 12:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7073C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=GyeL1hQM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1uum7sP5KvUl6fZOHhfBNVENAqaOQjE2bUHjyMM2IojSZyLfK2j66lluIzX5m1rNWuhawBHOPS9Y+Q3iTO294E9td9GZtb7Iild0C5QtkOLrqo0FdIFlNKOorwx9QVQXFspF0XQRA5DH203Ta17KGquiUHITY6mnnUXVcmQ6AGPQpFUAJ1CjiPaIS0OkuTO11/Hax8XEXHhXIyENr+zUV3aAowVnU5+g+xpU27wyOJ2OIuEaScCKf/XSKSK/fJloxuCNXNxwxYrqTfY7+bn+lvG4vbTlA5/zfKLrwX/49dWSnjOc1J5s1/NCUdv8dF+gbnfFXMgZTIm3fe9GewcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qVgCKgUOwmeIT5fX5deR69AiVkRO2HnIDOLOuzmPLs=;
 b=k9t7cbE7Q9xhdchkWbWyPz8cjbiKfzxVkdpGmhiYuVvyOhguoEEmGFsBJSTLAePutZPb5cCRq2uff4W5DaKGZw2wHxGy0TfOxLU/qgXfYd8l/03aByC47z8ok9lcXPYaTbOKr3i53dld9MA5touNlJ7vHM9/upsKNwoRzTFGn/+yNVIuUqcl3Fi4lrocoF4IMKR+UGcnpGMrj/+IqTw/Cswkr3RY7AED7f1o8fyra+XB7fw1Rr2E0jTW6CUuT+4f5W8yZp1/HYug0zmHP6kOY9f9iDwmN+luP39YCuYxGBoA5YAhwrihlDqH10Os26RjvIPOBqYctvRwO+Ee4nxqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qVgCKgUOwmeIT5fX5deR69AiVkRO2HnIDOLOuzmPLs=;
 b=GyeL1hQMVdmjtEr7BldkVU9LExjFCUfxvHdWq/1vJHXMzYyR3ehL7zi8p2gHVm60e+3K3+Wn4cXRrHzz2V+fpfKxCAq/WZNuR7/uRexxsPw8NH2vJL0tA/lSguMEglwgEqf/g89FBnU4Z0BIRqykbSuumthaQ/Egv8uE7yclMnsv9yEDZ8Cyj4qwDEH8U9BOSXYLr3cTapE9fEVDothnabVCiygZkXqYHyP+eCSTAds6NEYi0NpB/eYbc2XzS8ZeBEmmSyrt5ThDC0SiAGwW2A45X0Jn7PJT01FoRFNU7h5/vhaZgKyuUVS+pE46WBVO1FRLsklZyvf8IH0bhH+v+Q==
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:b10:105::21) by DB9P195MB1370.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:29f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:53:03 +0000
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893]) by BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:53:03 +0000
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
Thread-Index: AQHddbkFk/mNP9YwAEuNkLOR54LZl7c3DouAgASSagCAAAFggIAABWCA
Date: Mon, 23 Nov 2026 12:53:03 +0000
Message-ID: <93ece91784725dd2f37a40a7edc59cc9144e18d7.camel@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
	 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
	 <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
	 <0ca6fb6acea9fe40cf2190f3a67d6376f9bfaaae.camel@phytec.de>
	 <4a325394-9d5b-49cf-a3c0-6b945e6cd241@kernel.org>
In-Reply-To: <4a325394-9d5b-49cf-a3c0-6b945e6cd241@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESP195MB976599:EE_|DB9P195MB1370:EE_
x-ms-office365-filtering-correlation-id: 31cc3e67-be09-486e-7c39-08df4960b66d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|261009223027099003|4143699003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261021135927099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 7nQHpPULZt2m+CfQi+WUA2TluR2t5TbceN6fQLFjnSweJ9MyXrtUh5q/YuUFSYiEsvg0p3DFB/jx++fI5hOZ9AAS2/V0v3w8mbZz+btsXdKFDiWUKXzuGtS8e8X0xQLnFqCrWrRaQJ+HcVrPSAea7/5VZVm7fdjkNQEv7yP7OD6pTmDnrG4tOZEOUtWPUY2MEFZqkpDIEmzqiRqVA0pNkz1J9jri/WgWl4LkHaqg1LKoJnaONLu6FfTFGQaWmYjwxuz8k62vVdXpbu+1D5w3NRUYFcU+Zl1pRFARy2LxFyadv9gujtu1lFku7pnJ4/XM9/sOE8J8Cts+1nOBfkE6seG6A4ZBknUz3bXgfkmo/oFW3UGbCj5tZh+8DZWtUqDq3T/bCscfVkljaR8stjxMrExpKWiVASxgwm4ixpWoesTsj3hfCPgGB3EA2h+mNss1etDAtVyNRgbyuoOcPz7G8EWLoLzP4/neq3Y+ZVl9i4EjQYsm8mDFe9rG1caFp/kRl1tH6rGnlTjTK4kj45uuIul1ZENh2HH1QkLzX6CUTCzXJy+UTUOJngvfSfwT2hxNMgEQsS7VQo7QZKDRYuxA035yeHTdyivNdX8Ftkn7kYnMrqjVNedy7STFtc6oiRmUJ+aBYZPyRemrenU0RP6pS6NcocDB0EAfZuKAqEHu6Cvhfkdo9SMgWll81EvplMk4fDeYrZSFHfo4afMN/siyoH1acc4K8Jp6R08kS8sQSfs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP195MB976599.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021135927099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnoyanFUTmZBR0g1VTBVY25DSU10YUlNY01hQUFwYUhOTjRsSE9iQUl6dkhr?=
 =?utf-8?B?cVF3cEowZlQ5ZTcwR0RrQkkrY3pRM0QzeXNqMlJJYVoySlRHQUkxeGxuUnNJ?=
 =?utf-8?B?dHhNM1VDZWQxUkE4REhodjkwV1NadlloNHBWWHVHc3ZMQUVlcUtVakxvOVpy?=
 =?utf-8?B?MXZUd1JGVHM5NE1RVzc4L29oaFBhMkFkdFhsMnF5KzkwN2M5dkRwOW41QUc3?=
 =?utf-8?B?ZXdsam9rdzhzZ1RwTEJlNllMQWcybCs0Sm05MHRQc2tiRVIvWjZPYXJhUW1C?=
 =?utf-8?B?MVJqMG0xNGU1UE1lc1BQQkszZ1g0UFdqSWtWUUl6SEhVWUIzZHlIOU5NcmNa?=
 =?utf-8?B?SzFrcmx3azYrNytGT0xYNUNtL2JTRERDMllrUHhCMHF1bW9IdGZ5aGxiVjhx?=
 =?utf-8?B?ejVQTXM5Y3RNL2JMM0RGY2xJcUhKcHRydmtwMmNwSDVKd2VWd201M3E1VzBz?=
 =?utf-8?B?Zi9rc3pGUjhpK2REQmlyMGJVMGhCVGErNmZYak4xYzhjLzRSQ0FRbmx1SjRK?=
 =?utf-8?B?Z25nMWdxcGhjQksyTEt4R1F5SDcxNE1PSUgrQjd0Q2s1Tkl5NVVyUXBWbHlv?=
 =?utf-8?B?aitGcXpjWDg3QVpDQlZZcmJIL1dSZzkySjN2SzI2a1lQL0J5Y0JnUG12cXc4?=
 =?utf-8?B?bEdTUE1ITFdSZmdsSm9SaHBHWkRXVFZ4V3BSb2RTK0xUMnV1MmRwMHZhbVg0?=
 =?utf-8?B?bVVTWjVTQnJwY1d1OVZQSWRmem5rZ3ZtYWRCb0xoeXJjWFUwbVRtYWpob3Mx?=
 =?utf-8?B?NFlvWnJuVFBaY2RrS2ROeFdwRHhidm45UTRQR25xMG93bXhwR0NheEZNTWt0?=
 =?utf-8?B?aWRTTndkdDNIbWVMMzV4YlJNNnYwR2VEYkxrQk9vWXJxRlRFV0l3UkV0cE1K?=
 =?utf-8?B?ZThsdHhzR3o2WWZoejNkSUFpdHNKWkx6SWoyc2R6WExXbGh1T2ExQ3Z6WmJl?=
 =?utf-8?B?WDM3djNPUHNZZzVjY2xEM0pkZDlyRGRmdDVVQm1LQ1plU1BucWZ6Um9EN0dL?=
 =?utf-8?B?akhJOHFjMXllcWQxRmhxMDJ2aE9QOE9HOTFCbzk2bkpJR0pITzJSU21CaVZq?=
 =?utf-8?B?YVByUDVla2R3dGZRMVRJSkJxaW5lSjJ5WjREaXZXRDZwZUFjdHNpbWgvU3hy?=
 =?utf-8?B?bTVkcEY5V1BSNVdMbk5jbDdUUS83VGZ0UjZ3cXZKNmdva2tLMU5FbUM2NEs1?=
 =?utf-8?B?azg0Ullob2hkMEtPR2FLcmFXWDdJSk4yR01iWVFaNDhCd3Axem03MTJiQytv?=
 =?utf-8?B?bnNFUzVmbXVmd29Ra0trMzAwcUxtTVE5SE1GNlQxdWhSaG9URHBwaGU3cEwr?=
 =?utf-8?B?L04zYVJEZ2tVTU5MTkF2OWxLOExnRDdVUFhVUFpjT25jTTZLSHFFWTJiMVRE?=
 =?utf-8?B?b1lyMS90Q1kwYnNxYTVEanEzVE91d1NjU1VtZkJFZkYycit2Vlp6K3h6a3hX?=
 =?utf-8?B?NVdOQ0lacFVyalluektuTU9uNW1SdTJPZjJ3ZUNZUEcycmlCQzRtUGY0KzIy?=
 =?utf-8?B?bGpHbGlQZTFhc29LMklJbDNzbkQ4OEY0Z1NraWxvLysrTXQ3akZ6V09kbU5u?=
 =?utf-8?B?NVZWL1VaNGR1bDVFVGV2cG1sU3hpKzVwNnBGUlFoaXcxZWRXTzZORkdkc3Yw?=
 =?utf-8?B?UnE3d2hIQmtLYkc2SVRNckgwSjh0ZCtzNnBlWVNRRytEWnJVOWQ3SWU2bUNQ?=
 =?utf-8?B?blQ1SEs2dzlnclBIR2IrZHFNcXZWbTRwbVBWdHV6NEpZaDVVVE5sTFpDM2x6?=
 =?utf-8?B?UXNabE9oTHpBdnpsalFtRHhmNjZZYllybzdiUjZDbmxFQlVreXRiaGFDL0pq?=
 =?utf-8?B?cXM0VW4ySFMyRzlsKzNvTG1uMWRaUk03NmdKWTBkcmFpK0tFT3JPMW0zdjk5?=
 =?utf-8?B?ZWszanRnZXErY3VqMEJlQXVUTnZvVDYzeVVFbjgzUU9MTjlxUlo1azByWlVn?=
 =?utf-8?B?MEhOSUNrSnlIc2VqOTBlRVBSc0FBdFIzdGZ5aEMxVzRBM1VzZnMyWHpqcXVw?=
 =?utf-8?B?dnU4NGpVSEZUQ2diUmNlallOc1I0MlpJaXRMaXlBZElRb00veFBzb1F3SWUz?=
 =?utf-8?B?TDdvNUMxclhuS0IyUjA0dytNTktNVGtjWnd6NlZYS2d2NWtWUXdnR0hHMG8y?=
 =?utf-8?B?ZWZSU29QZWZtbGk5eFl3aHgwQS9HSllrTU0rUlE0akdmSGtMR1lVWitxMzZW?=
 =?utf-8?B?aVRXNTVwWnlwZnhNZVJVeVhKcmRjek5mUU9rcEdCZzUrV0hERDVvMm45ZEJH?=
 =?utf-8?B?NTduUy9JaWdpc1phZFlXTC92SW02TjV2QU54bHhISUxTWmJENXc5QkVkVXdw?=
 =?utf-8?Q?dVxZGs7ocZMic+ENNB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE95615B85CC954A93033B11858AFB80@EURP195.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cc3e67-be09-486e-7c39-08df4960b66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:53:03.6057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cKUKgE+9h97GKVHng7XR23eNmnmlIbxSToZgnHAuYaeNcl5MjvRox2vp1gZn6rFyIr55mvL89qrB83NLbG+Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1370

T24gTW9uLCAyMDI2LTExLTIzIGF0IDEzOjMzICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDIzLzExLzIwMjYgMTM6MjgsIFlhbm5pYyBNb29nIHdyb3RlOgo+ID4gT24gRnJp
LCAyMDI2LTExLTIwIGF0IDE1OjM5ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2ZzbC55YW1sCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2ZzbC55YW1sCj4gPiA+ID4gaW5kZXggMmQyMWExOTQ5ZDk0OS4uYWU4MjNhNzY3MGIwMiAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Zz
bC55YW1sCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9mc2wueWFtbAo+ID4gPiA+IEBAIC0xMjI3LDExICsxMjI3LDYgQEAgcHJvcGVydGllczoKPiA+
ID4gPiDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQSFlURUMgaS5NWDhN
UCBGUFNDIGJhc2VkIGJvYXJkcwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgb25lT2Y6Cj4gPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZW51bToKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
cGh5dGVjLGlteDhtcC1saWJyYS1yZGstZnBzY8KgICMgaS5NWCA4TSBQbHVzIExpYnJhIFJESwo+
ID4gPiAKPiA+ID4gWW91IGp1c3QgY2hhbmdlZCB0aGlzIGxpbmUgaW4gZWFybGllciBwYXRjaC4K
PiA+IAo+ID4gWWVwLCBhZmFpayBJIG5lZWQgdGhpcyBvcmRlciB0byBhdm9pZCBlcnJvcnMuIAo+
ID4gCj4gPiBTdHJhdGVneSBpcyAKPiA+IAo+ID4gMS4gaW50cm9kdWNlICJjdXJyZW50IiBiaW5k
aW5nCj4gPiAyLiBpbnRyb2R1Y2UgImN1cnJlbnQiIGR0cwo+ID4gMy4gcmVtb3ZlIHByZWRlY2Vz
c29yIGR0cwo+ID4gNC4gcmVtb3ZlIHByZWRlY2Vzc29yIGJpbmRpbmcKPiA+IAo+ID4gV2hhdCBz
aGFsbCBJIGRvIGRpZmZlcmVudGx5Pwo+IAo+IFRoYXQncyBwb2ludGxlc3MuIENvbW1pdHMgYXJl
IG9uZSBhZnRlciBhbm90aGVyLCBzbyBqdXN0IHNxdWFzaCB0aGVtLiBPcgo+IGV4cGxhaW4gd2h5
IGRvIHlvdSBuZWVkIGFueSBvZiBzdWNoIHN0cmF0ZWd5IChhcyBleGNlcHRpb24gb2Yga2VybmVs
IHJ1bGVzKS4KCk9rYXksIEkgYW0gaGFwcHkgdG8gbW92ZSB0aGUgYmluZGluZ3MgcGF0Y2ggYmV0
d2VlbiB0aGUgZHRzIHBhdGNoZXMgYW5kIHNxdWFzaCB0aGVtLiAKVGhhbmtzLgoKWWFubmljCgo+
IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YK
