Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B91E5724
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034309; cv=fail; b=EPVGS9b5046hrerp+sOs7EjASiMKT1HWYVE9y2X4xCg3VJ2/sF0s7EK64TYHs7UOu3POFnKDtipmcvqLpyi8xcOEw/pisAwwa/joLhtk3ikGoEHDiV2Po51X3aeNF/Ka7x+A4cM13hzHRHEG6qO1cXGNkm6n4bWasCTbAoobHoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034309; c=relaxed/simple;
	bh=XrwHnd1I8Xj7Dd6tDZy1Vp/Jd2bNFW4kbVkcZy5ydBY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=meP/6iEVUI38zTj6jfsjEjYEQVzxnYUYlXf5Cu+XY+YQG4JeN1JJOhKc9FYDqE16MwdAQlF1JPWIAek+xL/3sBIMzyGNEd9EJqaPi0LEva86dOOv0FaIuw2VVa6+lygffaNGs/tSwdRKB3BqblQSPzHxJKAfHW8/zIjWiuXu+Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E9sU1dwC; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E9sU1dwC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfKAN05V0riyYERd8D8z5W0+5+v5Er7pitKJifssmmhJMiJjuR/8Ii6GfJSFoIq5bYmmc64q1q2comhKXgFK2X8uazAlWHG3VDgGaAVqzL9/EUVycNc6QePuCT3izSHEBb65jh6bkWGQqdfP0DQzJJzSmJAERhrrRE1U22WHsZFl0MHwBwgARlhy5Oq90SA9E3klfyGoqzuwe6nrp6JOvP2SdAxPaTyl+oazznJaeKCHLpFzp4EDwvMitznZXJyra/jiFcSS8xMcQyu3HlPW+WCB6ctGrJFx/wE98IM76WK3YpvruyiS4rNQC1K6lLnKU3ZIGRBMnJr6/I9kPFyYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrwHnd1I8Xj7Dd6tDZy1Vp/Jd2bNFW4kbVkcZy5ydBY=;
 b=U3o+v5pfSaj8mOhSeAbOhAW0eXDiYsIrPjZbYU/5XRPBOzy3gCdm5rjNw2UGjmBROdKw/j76nANtoKVXk0El1HRUGXcUts2vUHflI7u9nmDtt1EhXLW03CJCTwnQj3Gzfs58OU56+074DsE534ILoKE7viOVs3QXAL+Gf0R/zXaXJCRBdl9JP21mibpi0u0ZIguDDMjjrrWyEL7t1IdqLPEfjWRVYIbIepPFwL7lBrSHzHDUXQiS4xYQ3TpfmkFILeY2GrR2PDqixBBQC06bidjdRQkq7VmV4FQSQRFZASN7CCdOkJ4eh7khX/OMNyG8UwRrw1SEc3OUkTyutbRWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrwHnd1I8Xj7Dd6tDZy1Vp/Jd2bNFW4kbVkcZy5ydBY=;
 b=E9sU1dwCr8i4IznVcQcVK06FgLeLvBKWQ2jSme42Dleq199Htz8ChS4GL7VaoH5oSh7EY8f9gWsberQQQjVxPb8ItMS6Xm9xSbrgbgFBztjHmrNqdGu0y0hPFYXnsM4YVnRQVuN0O0kzbe7irCh/7WkJdV2ltuV0aD6tUXd1Zg7cdYAhDXPbG5UcyFW1EZYEKCDXLLyojgrZu1VN4pON6jCyiMuXeHoeEhc0D3dLy6guzF2P4UdVenIzMwHHsNLicts6pfH1mYfpUTWn9wQ0dkszFaqUJrM0qO7cz4X4JNWVSDKRFjjYAUGwuwDxsCqmWsblHnGd0mDuozml5bZhOw==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB10828.eurprd04.prod.outlook.com (2603:10a6:150:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 05:31:30 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 05:31:41 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
CC: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chun-hung.wu@mediatek.com"
	<chun-hung.wu@mediatek.com>, "walter.chang@mediatek.com"
	<walter.chang@mediatek.com>, "jstultz@google.com" <jstultz@google.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu
	<xuegang.liu@nxp.com>, Greg Kroah-Hartman <gregkh@google.com>
Subject: RE: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Topic: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Index: AQHcq67R/jfgdFFso0+2DI4r/Bm39LWeu40AgAI93KCABBkHAIAAaeug
Date: Mon, 9 Mar 2026 05:31:41 +0000
Message-ID:
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
In-Reply-To: <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|GVXPR04MB10828:EE_
x-ms-office365-filtering-correlation-id: b0ebcb3f-e22a-43b3-27ae-08de7d9d24ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 DbrwkBCSufP81wdq7i4UH3Vbo+rT/ZLd5IpjsKtzY/aUg/fak7nIsJbe0bnTMBwohRWBDxWYU68IjKxZVAOje9pi0srK8GmzauFuwR9kkImakPMN4nL7AyJX6ST2WhXt+d9GVtfhH7nNoG1e1os5SZDVfT5dnMM4+PTv06EKA6QgwzQU93cOazFXI61JBmKu4wpWnf2cer39Gh2uoDv3TVuT+wE8LWqe3UmJeXfMKNz5RK9nZ9QWficncrV7WNExunxSaDMe6U+s47dZFmvFjtJY0gzDQgREiZoJVNxKvmVXS9ONmwRoBu05r1fy7sj/5DcEo0d2F2SpN+tX2XB70HsTZYsW50SQe1rY90jIwluKTyJBKXj+aLjySfPrSaz/vhyu7+V8QdtWkBvhhhxRDwr6nj/o6jIJ1FNY8FmWGeVFUjY7jKQb6vGyNv/SIA8eyubdeqgd+FV9TsGeyV1e570s1xvhA9OQRIJowlYXW91j7ZeSD5X2dZOHs+Al/usk5TEd05X/8cYxszoZpx8B07LiyTyPHDGV7N1JN9CN2qZzmM2IFwPsOu8RXpfnD5Qtz9N+vHaY2PRb1nl9QJaVAyjJndqPRmyZSwIaxmssd9U/0+JM/sLHaG78HDd2zhapvvI+jZeT5RbBFsEdc97cI4gikX4MDJaNSINSW2lbtQ/0uWbui1oR4beao5xv+0w6YYKuUpV2qQXXyDkN09Z8pxP0zVZARTwUKRkmChCVnPpcaixlD/3vTh4Mhd6hGbDhWETTZHL5IUgyIjXKUhdqWkjRnkjh7N/LyKS853jeDWo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dTZWckd5VzllU0poaEQzUWdzSk4xbllOQ3RQOG5yUzNyME9PUFV5RmpvYWlp?=
 =?gb2312?B?bitsTGJCWHlJUE1ERCt6Mld6TXFtYnorVUFhWVlMNTA1VWxucjlYb0Vnb2dn?=
 =?gb2312?B?MmR4VWJWelc3WXEzZ21WVDF4NXRiaGxaU24zSUJXWWpnNm1TZ2xPYVhSaXhz?=
 =?gb2312?B?L3dvdFdLYXY2L09iTVI3M2tjOU5UZ1VoUEV3UE5rcFY4bE1oL2RWMUxBdmJH?=
 =?gb2312?B?WS9FM1kvczErQVFpaWdacjg4YWY5cGNvaVRIU2ZJUkFEc3h6UnFLeWl1ZWNF?=
 =?gb2312?B?M29WVktsLzZyNHhKYXFGTEplV1Z0S2hYajBvZ1JaY2VIVi9ZVEdCYlpMOGJl?=
 =?gb2312?B?RHY1c2FWS0tXeFlJcVNROFRPU3g4LzczdzBpc3JSblp4K1NjZHpNVE8wR0FS?=
 =?gb2312?B?RXJwYjhHWitUOFBBbTBHenZlTk8wVTJXOGRyVExjUHFaeTNlSTA5c3ZxSEh4?=
 =?gb2312?B?NUVUd2dwSEltaVZSVktkNWpKcyswSjhlOFBxRkxhNjFRWThiMGh5WEI0d0JM?=
 =?gb2312?B?U3VJR2FzUzlGSmFYRFdCNXZtN3hzaS9oNFArVlBHeXZpNC9OTWRIZnhDOGNY?=
 =?gb2312?B?YTNVSEdrQUNvZ2JFcUFNNVFuU3BrZ3g0YkY2a09Nb09Ka0hqUHZWSHh5OE1X?=
 =?gb2312?B?cmpyUkFSTHJYZU5YVkRlUGdCYUtZRGJ3U0k5a004VEF6UWQ3b0lmNWZ1TXQ1?=
 =?gb2312?B?ZTVwWHBLQzJLa2hWM1lNOTA5bllwTFBEZmpmN1N2dGRrcCtWNUQzTnU2cWtj?=
 =?gb2312?B?UHNxZXVQeXpqMUNIMW5FSXluSzVLWHA1S3hYdC9jb3NrWWpjdEVsREhrOUF0?=
 =?gb2312?B?VDVZVi9NVkVibFAzek5INnB6ZnFLNkJWSUZOcUROOUZVbHpiRlFOTWVaMzU5?=
 =?gb2312?B?Y2I1WnhXWm5JMlAyajhUcGdCQVJ6OW9meEZOaDRJQmhBaUd0UFN6WW9jcnB2?=
 =?gb2312?B?U0VHMHpZR0RyT2tUZnNWVmZmUW5STFJyWDh0UDJYbjFBbXdDTUQ4dTZmRWFV?=
 =?gb2312?B?elZnTXVmWjZTRmlWRWFrV3pVdi9KN0QwZ1EvZVVKQm1jWVplaUVGcC9SMzRs?=
 =?gb2312?B?YkNPM1dUd3R0cC9RbTEyR1NWd2Q3YTVHM1BoTHVSVjFVZFVnc1RPN1k5VnBu?=
 =?gb2312?B?dFJ4RjNxK0ozRTZ2YmZxdmlmYW1sSmhnRHk4WUtkTEpyc0s4ZW1LZXZSa2V0?=
 =?gb2312?B?MlA3NzB5VFUvZjRkWktmbWlsaHpKdzJrS0x6RmVmREQ3UWtWZXlqQkE2aGd6?=
 =?gb2312?B?d2ZoZTVSY25XMWZ6UXpLNmIxallTV25CbnhPa1EvTDg4enNZUFNkci9JRkYv?=
 =?gb2312?B?UnZaRm1WNjdIM0FLb0xlZ1dVUGlnOVNsWDNsUzhzQ0ZCZU9QaEY2MmlMck43?=
 =?gb2312?B?VWVrUjRSV0xsNUJicVhmbW9rVWxoRmNoOUMrcVdCbTB0OHVtK3cxU041ZGRZ?=
 =?gb2312?B?YVFSL3h6K2l4NS9Cdy9RZFNtenBOQXZHTnZEZGlkb2Zsa2lYb0tNd29ld3pn?=
 =?gb2312?B?RkNNbjVkT2tBdXB4dHlTZmtTRlRmNGpLM3puVDZLSmVGcEwrNUZYWjdCYk40?=
 =?gb2312?B?eHVVMEEzRFlGbWhsalJQcXYrdFRxWXRoZG5OWGpma3FwSTUxWlF5RVRLWEho?=
 =?gb2312?B?eWp6YTNQQXpzdERERVQ2OE1jSElRVXdQTHpJUUx4WGlWd0pTUStjNVdwUVBt?=
 =?gb2312?B?ekhiS3A3SWlCSHhjTVlyT3FabmJUQXEwUERYR2lFeWgzbDd6M0NQS3pyS2Qx?=
 =?gb2312?B?OVFxL3VYUTRRY1B4S1N6U2NSYjMraXJ2Y2ZKaDZYNmdnY1U5c3FTRzUvVWZN?=
 =?gb2312?B?QWFOSVdDeFp6b0JMcUI3M1hlKzV1L0NIZVlCKzdnWHdSYW16b0hXOHBJMmRG?=
 =?gb2312?B?eHZQdHo4SXRlR2N4Y3Frd3JjSXRNOVpNV1lHSTI3TG9yMFpjbUFBTTBOZEl4?=
 =?gb2312?B?QjRQTE5PWlg4WkRpUEswcXBzN3JEWGM2YTU2RXY0TUlHYVA1Smg2cE96NVdh?=
 =?gb2312?B?NHZrdGU0VGhEQ2xycjdPeXRZRlo4OGtENXpCZjRJSDRBZ1lHTERqTStacU13?=
 =?gb2312?B?RDNlTXorNGtWUURKMVNnK3lNU3d6TkUwTHVqNTM3NHU4YkRueURqZTQxK09Z?=
 =?gb2312?B?MlhKL3BFMXVITGNQVndKcUc2bHNxNzA4UnZCVWtrWFU5ell0OS9ocTF4Ri96?=
 =?gb2312?B?ald2andvNktmUlhQVStVK1ZFQlY0d1krV3FWVHQvK1A4WGNiYzdwY0hOQ0Vr?=
 =?gb2312?B?TUZ3QytLS0pNMU5vZUZZNHRsNkNJTndhbkp1T2VUNHBjQjNmUkFPN3cyRkFH?=
 =?gb2312?B?bElqMm1yZkN1dDNyWm1zSkgxUk9UbE4vV2pTZ0p4L3JMbEFDeGQ1UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ebcb3f-e22a-43b3-27ae-08de7d9d24ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 05:31:41.5756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GA981gYgd4cd+Dgw3IHWQ8vYlitQzyvw428p15YC9LOLgGYATm4fIYK2WAKGPzmDylDiZVG1CDEIj8b+As9oYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10828

SGVsbG8gRGFuaWVsLA0KDQpJJ2QgYmUgdmVyeSBoYXBweSB0byBjb2xsYWJvcmF0ZSBvbiB0aGlz
IQ0KDQpNeSBhdmFpbGFiaWxpdHk6IEkgY2FuIGRlZGljYXRlIHRpbWUgdG8gd29yayBvbiB0aGlz
IG92ZXIgdGhlIG5leHQgZmV3IHdlZWtzLiBJJ20gaGFwcHkgdG8gaGVscCB3aXRoOg0KICAgLSBU
ZXN0aW5nIHRoZSBuZXcgbWFjcm9zIHdpdGggSU1YIHRpbWVyIGRyaXZlcnMNCiAgIC0gQ29udmVy
dGluZyBleGlzdGluZyBkcml2ZXJzIGFzIGV4YW1wbGVzDQogICAtIFJldmlld2luZyBhbmQgdGVz
dGluZyBwYXRjaGVzDQogICAtIERvY3VtZW50YXRpb24NCg0KTXkgdW5kZXJzdGFuZGluZyBpcyB0
aGF0LCBiYXNlZCBvbiB5b3VyIFJGQywgd2Ugc2hvdWxkIHVzZSB0d28gbWFjcm9zIKGqIFRJTUVS
X09GX0RFQ0xBUkVfUERFViBhbmQgVElNRVJfT0ZfREVDTEFSRV9QTEFURk9STV9EUklWRVIuDQoN
CkJScywNClpoaXBlbmcNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFu
aWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6IDIw
MjbE6jPUwjnI1SAzOjUxDQo+IFRvOiBaaGlwZW5nIFdhbmcgPHpoaXBlbmcud2FuZ18xQG54cC5j
b20+DQo+IENjOiBkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnOyB0Z2x4QGtlcm5lbC5vcmc7IHNo
YXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5n
dXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBtYXR0aGlhcy5iZ2dAZ21haWwuY29t
OyBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb207DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsNCj4gY2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbTsgd2FsdGVyLmNoYW5nQG1lZGlhdGVrLmNv
bTsNCj4ganN0dWx0ekBnb29nbGUuY29tOyBhbWVyZ25hdEBiYXlsaWJyZS5jb207IEFpc2hlbmcg
RG9uZw0KPiA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBKaW5kb25nIFl1ZSA8amluZG9uZy55dWVA
bnhwLmNvbT47IFh1ZWdhbmcgTGl1DQo+IDx4dWVnYW5nLmxpdUBueHAuY29tPjsgR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAZ29vZ2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBb
UEFUQ0ggdjQgMy80XSBjbG9ja3NvdXJjZS9kcml2ZXJzL3RpbWVyLW1lZGlhdGVrOg0KPiBDb252
ZXJ0IHRpbWVyLW1lZGlhdGVrIHRvIGEgbG9hZGFibGUgbW9kdWxlDQo+IA0KPiBbWW91IGRvbid0
IG9mdGVuIGdldCBlbWFpbCBmcm9tIGRhbmllbC5sZXpjYW5vQG9zcy5xdWFsY29tbS5jb20uIExl
YXJuDQo+IHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0
U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5h
bCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5p
bmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0
aGUgJ1JlcG9ydA0KPiB0aGlzIGVtYWlsJyBidXR0b24NCj4gDQo+IA0KPiBPbiAzLzYvMjYgMDY6
NDYsIFpoaXBlbmcgV2FuZyB3cm90ZToNCj4gPiBIaSBEYW5pZWwsDQo+ID4NCj4gPiBUaGFuayB5
b3UgZm9yIHNoYXJpbmcgeW91ciBSRkMgcGF0Y2guIEkgdGhpbmsgdGhlIGFwcHJvYWNoIGlzIHZl
cnkNCj4gPiBpbnRlcmVzdGluZyBhbmQgYWRkcmVzc2VzIGEgcmVhbCBwcm9ibGVtIGluIHRoZSB0
aW1lciBzdWJzeXN0ZW0uDQo+ID4NCj4gPiBGb3IgdGhlIE1lZGlhVGVrIGFuZCBJTVggdGltZXIg
ZHJpdmVyLCBJIHNlZSBhIGZldyBjb25zaWRlcmF0aW9uczoNCj4gPg0KPiA+IDEuIEN1cnJlbnQg
YXBwcm9hY2g6IE15IGN1cnJlbnQgcGF0Y2ggdXNlcyB0aGUgZXhpc3RpbmcgcGF0dGVybg0KPiA+
ICAgICAoc2ltaWxhciB0byByZW5lc2FzLW9zdG0uYykgd2l0aCAjaWZkZWYgTU9EVUxFLiBJdCdz
IHNpbXBsZSBhbmQNCj4gPiAgICAgd29ya3MsIGJ1dCBJIGFncmVlIGl0J3Mgbm90IGlkZWFsLg0K
PiA+IDIuIFlvdXIgYXBwcm9hY2g6IFlvdXIgVElNRVJfT0ZfREVDTEFSRV9QREVWIGFwcHJvYWNo
IHdvdWxkIGJlDQo+ID4gICAgIGNsZWFuZXIgYW5kIGFsbG93IHVzIHRvIHVzZSBkZXZtXyBmdW5j
dGlvbnMsIHdoaWNoIHdvdWxkIGJlIGENCj4gPiAgICAgbmljZSBpbXByb3ZlbWVudC4NCj4gPiAz
LiBNZWRpYVRlayBhbmQgSU1YIHRpbWVyIHNwZWNpZmljczogVGhlIElNWCB0aW1lciBkb2Vzbid0
IHJlcXVpcmUNCj4gPiAgICAgZWFybHkgaW5pdGlhbGl6YXRpb24gb24gbW9kZXJuIHBsYXRmb3Jt
cyAod2UgaGF2ZSBhcmNoIHRpbWVycyBvbg0KPiA+ICAgICBBUk02NCksIHNvIGl0IHdvdWxkIGZp
dCB3ZWxsIHdpdGggeW91cg0KPiBUSU1FUl9PRl9ERUNMQVJFX1BMQVRGT1JNX0RSSVZFUg0KPiA+
ICAgICBtYWNybyAoaWYgeW91IGdvIHdpdGggdGhlIHR3by1tYWNybyBhcHByb2FjaCkuDQo+ID4N
Cj4gPiBJJ20gdmVyeSBpbnRlcmVzdGVkIGluIHlvdXIgYXBwcm9hY2guIE1heSBJIGFzayB3aGF0
IHRpbWVsaW5lIHlvdSdyZQ0KPiA+IGNvbnNpZGVyaW5nIGZvciB5b3VyIHBhdGNoIHNlcmllcz8N
Cj4gPiBUaGUgcmVhc29uIEkgYXNrIGlzIHRoYXQgd2UncmUgd29ya2luZyB0b3dhcmRzIEdLSSBz
dXBwb3J0IGFuZCBJIHdhbnQNCj4gPiB0byBtYWtlIHN1cmUgSSBjaG9vc2UgdGhlIHJpZ2h0IGFw
cHJvYWNoLg0KPiANCj4gV2VsbCwgaWYgeW91IGFyZSB3aWxsaW5nIHRvIGNvbGxhYm9yYXRlLCB3
ZSBjYW4gc3RhcnQgcmlnaHQgbm93IHRvIHRoaW5rIGFib3V0IGl0DQo+IGFuZCBwcm9wb3NlIGFu
IHVuaWZpZWQgc29sdXRpb24NCj4gDQo+IA0KPiANCj4gDQo+IA0KDQo=
