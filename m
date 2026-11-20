Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164576;
	b=IRaGrRvEgJFcZ3VaTy9ApN6LV1kALPCFnFG6r1qEK5q4td8i1RK0RFFp6S8mlqmyEII/
	 0jdrEQUtYQxIZyRKW4W3mur9sZ+lsLDKCtYfVtmRtPeBvJ7RnKsFrMbP3J0H90ZhZqBsX
	 JAfR8avh75T6kChueKN9boAoZju5r3LBku06/86xyJ3+Gjd190yqMHejYbKI/UPgU9UZ7
	 rVHgelUYixXGRljCay2HwGZtb0vvaYrm9SgNvsf1uRdYN0FTXIhDdt4r3a7NBIFhmvewx
	 mSI/sxb3oisl1Xn9XmrGzdNiPTqRlSdcDKEcHoUqe98sYs8j7keu2kSP5F39vPNwQhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164576;
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
	bh=yqo1ijD4/BVDx9bIaQb0furKw8lDJoL0pLFWxi6DZ88=;
	b=LA/rQaY8mTygMOR1Cqhlh+Uhc68wL/DM3kTp2F48CnddC2OEK8RGiUZ/uw4NBxZq8IjD
	 lxalEZBefogKiQK2sFClvyyTTGTK0R936kXrTjD2+BdIKz5A1ZR6FLmPUe52KglE7seWd
	 Nh/qB0J778UpikRgztvLwPNhJVBk/RdvgplPXw4+TeZfLvltq18Sk6H5VYqem3uxSqAZP
	 5eO1r+ZfbzeChbP+nY45VJiBT8aI0EIZg1QSuVf9AEn7iWcePp/BOiCME5xkWpVozumOU
	 DcDD9OzXQDbyYoZZ+UpQRnCsOuTmev/k9KPzuaZBWzKlpE7b+qXYhuXQg1P5or6Rh2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=kGQBG55n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.114
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021114.outbound.protection.outlook.com [40.107.42.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12FE606A326
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=kGQBG55n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieGbQ6Ep72g48JcRKJ7+IpeXgQlqoX/fR5cORKDP9l5Ng67m7irVKRjsN9rI/Zqg+3DY4AOoUqndBLD1kyc7XYbMH0D6WtU6ylPY0Lps9Uy4eEWi8EemuhIKOytj9rHb2xAxpZauFsjrs9/byuSBz/k9z0HdtZrQbbGuFVs8qyrdP6ytO0EuihTGk3RyRABwp0n/SWzyUK7kKfn2A5a+9ab+NpeP3GQNpA8r2kwRZB9pw+ZeUjlauFEMBisZJthY+raXVAWSMzHdfqAsHbRp7GieILCKqevcBI6I4SrIL/iu9CgVeu/mCxgBwYwzqlua4GqCf/y8POJpkgLORGMMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqo1ijD4/BVDx9bIaQb0furKw8lDJoL0pLFWxi6DZ88=;
 b=nmu3qzNjk5udANaNZnyOxnM+1+IJc7eReP5/znXQr+qHkJpnn2HaJb4tE8aKVIUW0tRy8MSFFv5f0ns+BCcQqBejfPC6+D5HQLF6bWPA2Ts0wDUkN+9wMRO6KEgpJK+XuT7j5D9euSpiDLeE+IisyIL+ipgwD1i5n5yts1ewGe3IAERlCsIGnYqy1VGs2M/ox6uy+cvQwdo1hu2TlREjeNrxSckUYK7PrW4cwZ24iWJ5CUsP38dCsCezm5fDXRa+Tt/X+XW4vRmJmbzG81Hl+9UIPHiQZHjKOkILu3NCT8Zl52eTQWDJolwjtdS72D3W2u8Qv0M+hC4X40XOZFsZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqo1ijD4/BVDx9bIaQb0furKw8lDJoL0pLFWxi6DZ88=;
 b=kGQBG55npTXe5Odk6kNwoernmYOzMS1Jbx49Hhw8w0PLekHdt5XjHh2nHanrDGDhNGUHt+yhrNNaLird0ZVENsDHh5iDI4d4WEdko3nN2Uo/FnnQkFih1r/s/aRNf+Ii+Gxbs1oBCtJzhi92/Y/2csB8NLuJ17iRk1BgBo99y7znrtLVhLoY2VNEIp3tp9QhRYx+97KQ8sPqQi5JTugGsU6lcW4kMwH2NLzIn58m+Oj7OGOAGM03xa5NvIXu5uGaig5WljVr44hwon39PkkPVIxVVL+ioBlqaDJXjNLn5x7OAzHl6PGEmFYOE9b2RbGg1fpErfd3i4tVqka3+mJLFQ==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB3081.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:49:31 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:49:31 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core driver
Thread-Topic: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core
 driver
Thread-Index: AQHdeARptOqim99hg0WhqhbYovMXKLc12M0AgADM0ZA=
Date: Fri, 20 Nov 2026 08:49:31 +0000
Message-ID:
 <SL2P216MB2441714132C06C62DC92FB9EFB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
 <av9bugRyMCQRNEcQ@SMW015318>
In-Reply-To: <av9bugRyMCQRNEcQ@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SL2P216MB3081:EE_
x-ms-office365-filtering-correlation-id: 69a37627-4e1f-433e-0ff0-08df46e331c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|261028144727099003|261026140227099003|10067099003|261022105027099003|261021135927099003|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261009223027099003|38070700021|261102123227099003;
x-microsoft-antispam-message-info:
 E/mK9apx+8D5qeJifUQ+I32cOYJKLbLncuZqvpcPmNXjSTeUZuwFDbBzmabKXRk5D+GBXWphSoRWQSxwy7wLmGUCWyQDepR5OEhteKgjrSwCGdP0BUchoXzLz/vdW0Jg7N3YqjabCntmuAcKrnuNxxrPDreVFGFpVbda3pEx9VLZ15cXNKY0AWjgWzE9ZruyjvL82W6dp1qiBhq8cxd0hXqF8X7q4CWw3+bGsU84A5VQ+80w9gJ+KnCoN97uYpnT/JI92nxUGvZ8KHgx0s0PBDxyGEuwRYd8bYnYvI7Dse43c0ezJBL+q7QNCXmTLqiaI0KEtOJYmsfvkh9llQdICdmoXdep5bH8MSq5ViGFwaKSqcdBYyTc7C8XoACyHTtQ+0Lf46Cjb91LTAVBMihyalGfeCh55jkW4c5kJJ3a+Pdm8HJETA68Ax3XrxXjdDbO+W3VeU8sBgWBnWgoWWrgX1TklSC5Mk3WfDwbvn2aSoPfHLrKWRJ2YvVIse/lKGuUM+y9+kJ0T3zd0HSSriEZNQ+fLXSv7E6mQwwAKwnVYA1Ah2y+gRcRIbz7wGpGoGOMTuNaapq2zRZJvtT/ccBpSo+WxMD/zktWYvqaNP0ya4oUcM6UGuXbHkOY9kNJqtA2AhrPZubkbcFngVNGc8xf8ZqpHygfXUXDasLbKmcHGZfkkHN8fT50WZ6Zn9SNyCVebUNHd9YEyXuLMSKhbDsvb50UBuKkFDe6Nl40DXM1f6g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(10067099003)(261022105027099003)(261021135927099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003)(38070700021)(261102123227099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TzbfQCysEEHX7TDT2+od7VB8JNMFiRB090r7h1vWrGCdSgKxjpxqQ7cajM3N?=
 =?us-ascii?Q?fpRuftker/N719MmM//A516LzsjU6GKcs/qdj9sJk30R1UICsjaYfop0olPF?=
 =?us-ascii?Q?FUUae3JtQz8WHOz7NO16i7OGyPxBxl/S247bZgiNgTEL1ZbC2lrD9EK1vW7g?=
 =?us-ascii?Q?aokgoyZ1Il6c5pQQiD5mnjAx/mz9lU0NJLrylnIgTmA3qru1+3obteaLo1mH?=
 =?us-ascii?Q?2H1aTs6gkm/tBqs0L47O4+hlwr8KWItbZ/DYsozQn/Ep9x/RCWU+W0iWn0uO?=
 =?us-ascii?Q?Fpo7p3s621gKKk3a+J218krRXKzf1EoR5hZLhXXdTGdYXJRJTl3Aa0sNHn/B?=
 =?us-ascii?Q?lMrzlCfbwPbrrHK3LVjCXyHbiFok3WbkgxwWLeEQWt1sLXUlME5u53NdlAUX?=
 =?us-ascii?Q?iVOVf5kpUP/kSuSaVBxg2KLpyDsjO7yxW+miXJG8jZvxTCHKwEg1DxpxxkL1?=
 =?us-ascii?Q?D8GSZhG02ifkJj077ZHTADyOJeGgnu07+hOgJZb3ia4lfwJMbyP80SvmKAfw?=
 =?us-ascii?Q?EyC62J+5W0hRxyJUKebSmGUywDwd5fqiSsOp1MsXi1+Z8fuLQB5CRsSHdghb?=
 =?us-ascii?Q?PCLQF9MGkLccENmHLEioBBkD/nxcmcZgc8MHFqFQ2Nc8BvcPiyHrE82am5P9?=
 =?us-ascii?Q?qR6wdgZMxW1BgYv92EbASmOGr7scC9AQWyhNx/72YZLwBejsJyIgTVNEHS/Y?=
 =?us-ascii?Q?UAzSCjpX/GdlMw5wyVXlv7wCQMX84ISvHIjM5A6rllXk3LQmiKVHgUCFAncr?=
 =?us-ascii?Q?C0S0+Ls4YN2k5oicUbCpSYW6sgEGpZzMeNr1nxAXyEE2ffwQsg1pzaCx++q3?=
 =?us-ascii?Q?Sf5WYu8pHlk5t96L/XKae+eh+BW46YYTnld2TR4BdGho64kcC0rLYxgLTaLA?=
 =?us-ascii?Q?mSl9nRVWEgvierXj8logb60ZvYLptW3T5kV1UKnr6gFTUZzKC4XMTE7wtdwR?=
 =?us-ascii?Q?t3udM0GkjG64bYtZmb7QI0fJZLGrVpvdFDrz2czCxRlcGbF7BWuBNi+rq4lV?=
 =?us-ascii?Q?G63XUkHIXT8PXWh3jYOGqywRgf+2Z5CEGRP9K1BgxcJPpF5gGU+KQVRltjK0?=
 =?us-ascii?Q?Xkbwc8AJm+U2wmLtF0tZ2uw/50PJEXZBosMef3ZlY0Qy/CnRaC4HSXIk7Xgr?=
 =?us-ascii?Q?jq/YhLPF6goFBS7it6jeNZbfp13/51ZNoeTJBXZY/nZoeIrmzo6amHrxT7pi?=
 =?us-ascii?Q?d7sBFX+Uhy+5iPn/3Fad7UmKBJWpxJDUHEJ2cApUpExDE7eIrTR3JX3IMQgO?=
 =?us-ascii?Q?giZwjGJC1tFqzpPu4oFhUkn6z1J9+Vz2Asv9fZ9e9RnFKKABmruLIzIUe7LX?=
 =?us-ascii?Q?MSm6LuGHKdzl72LSipbeMhVTnT5TFFftRMb+QY+gQGT3jaV6viFRJL5z56Ko?=
 =?us-ascii?Q?o5SKFSDcGrHMQiClCEanOclbG9EhZBs/KAUpaegbBSmQ+R31992RLCQQWNec?=
 =?us-ascii?Q?7BBjtasrBpur6+SO1jlbqkY33IOPHabpDEoR6c6FOtfUwXeQcnQjIDTgDPo1?=
 =?us-ascii?Q?z6AhGy6PxOihWukwkdinshs/65Iv3MO+vL6MZEo5O5VBS2AeDVtCW1SjV2jU?=
 =?us-ascii?Q?AkvQ2faUCOWJQII6tEoYxVyAr6QLZ+tOJSBj7mkrx1/KtGSBsHqmXED51zjd?=
 =?us-ascii?Q?/VI92wBtHNdHxYgQJsQZciSgAqL/87fsNEmnQrS7sQc4r05Fdk8XRl3+j1FP?=
 =?us-ascii?Q?jFJTJDDBr0ll+pMmIYOmu5JnmKGkaFSgdiA5d1DoTUq14txjn8hykTjRRV+9?=
 =?us-ascii?Q?BEyJBEY+lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a37627-4e1f-433e-0ff0-08df46e331c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:49:31.6321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QOoKDJVBeLaRU04ptaNdFNE/u/VonLnXr8LTBntxNR7MmrQz+kKMAV4T/5RcjvHbrvGSjYLNQxR5VtsVEyynH4z04yV7BNHP1VTPMcaTbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3081

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 5:28 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core
>driver
>
>On Thu, Nov 19, 2026 at 05:59:57PM +0900, Nas Chung wrote:
>> Add the core driver for the Chips&Media Wave6 video codec IP.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine. The core driver
>> handles the interface register regions, each with its own MMIO range
>> and interrupt, while relying on the control driver for firmware loading
>> and shared resource management.
>>
>> It configures the V4L2 mem2mem devices and communicates with the Wave6
>> hardware to perform video processing tasks.
>>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../media/platform/chips-media/wave6/Kconfig  |   2 +
>>  .../media/platform/chips-media/wave6/Makefile |   5 +-
>>  .../platform/chips-media/wave6/wave6-hw.c     | 181 ++++++++
>>  .../platform/chips-media/wave6/wave6-hw.h     |  22 +
>>  .../chips-media/wave6/wave6-regdefine.h       |  65 +++
>>  .../platform/chips-media/wave6/wave6-vdi.h    |  20 +
>>  .../chips-media/wave6/wave6-vpu-core.c        | 392 ++++++++++++++++++
>>  .../chips-media/wave6/wave6-vpu-core.h        | 106 +++++
>>  .../chips-media/wave6/wave6-vpu-v4l2.c        | 384 +++++++++++++++++
>>  .../platform/chips-media/wave6/wave6-vpu.c    |  24 +-
>>  .../platform/chips-media/wave6/wave6-vpu.h    |   2 +
>>  .../platform/chips-media/wave6/wave6-vpuapi.h | 381 +++++++++++++++++
>>  .../chips-media/wave6/wave6-vpuconfig.h       |   6 +
>>  13 files changed, 1588 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>core.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>core.h
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>v4l2.c
>>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.h
>>
>...
>> +
>> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
>> +{
>> +	u32 data;
>> +
>> +	data =3D wave6_vdi_readl(core->reg_base, addr);
>> +
>> +	return data;
>
>return wave6_vdi_readl(core->reg_base, addr);

OK.

>
>> +}
>> +
>> +void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr,
>u32 data)
>> +{
>> +	wave6_vdi_writel_relaxed(core->reg_base, addr, data);
>> +}
>> +
>> +u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
>> +{
>> +	u32 data;
>> +
>> +	data =3D wave6_vdi_readl_relaxed(core->reg_base, addr);
>
>return wave6_vdi_readl_relaxed(core->reg_base, addr);

OK.

>
>> +
>> +	return data;
>> +}
>> +
>...
>> +static u32 wave6_vpu_get_product_id(struct vpu_core_device *core)
>> +{
>> +	u32 val;
>> +
>> +	lockdep_assert_held(&core->hw_lock);
>> +
>> +	val =3D vpu_read_reg_relaxed(core, W6_VPU_RET_PRODUCT_CODE);
>> +
>> +	switch (val) {
>> +	case WAVE617_CODE:
>> +		return PRODUCT_ID_617;
>> +	case WAVE627_CODE:
>> +		return PRODUCT_ID_627;
>> +	case WAVE633_CODE:
>> +	case WAVE637_CODE:
>> +	case WAVE663_CODE:
>> +	case WAVE677_CODE:
>> +		return PRODUCT_ID_637;
>
>what is use for? why not direct use WAVE*_CODE?

It is unused. I'll remove enum product_id.

>
>> +	default:
>> +		dev_err(core->dev, "Invalid product (%x)\n", val);
>> +		break;
>> +	}
>> +
>> +	return PRODUCT_ID_NONE;
>> +}
>> +
>...
>> +
>> +#endif /* __WAVE6_HW_H__ */
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> index e879a9743cb3..aa9b972c82d1 100644
>> --- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> @@ -14,14 +14,51 @@ enum wave6_command {
>>  	W6_CMD_INIT_VPU		=3D 0x0001,
>>  	W6_CMD_WAKEUP_VPU	=3D 0x0002,
>>  	W6_CMD_SLEEP_VPU	=3D 0x0004,
>> +	W6_CMD_CREATE_INSTANCE	=3D 0x0008,
>> +	W6_CMD_FLUSH_INSTANCE	=3D 0x0010,
>> +	W6_CMD_DESTROY_INSTANCE	=3D 0x0020,
>> +	W6_CMD_INIT_SEQ		=3D 0x0040,
>> +	W6_CMD_SET_FB		=3D 0x0080,
>> +	W6_CMD_DEC_PIC		=3D 0x0100,
>> +	W6_CMD_DEC_SET_DISP	=3D 0x0400,
>
>BIT()?

OK.

>
>>  	W6_CMD_INIT_WORK_BUF	=3D 0x1000,
>> +	W6_CMD_QUERY		=3D 0x4000,
>> +};
>> +
>...
>>
>>  #endif /* __WAVE6_REGDEFINE_H__ */
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h
>b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
>> index 69ebf0ebcb13..67704fdbe27d 100644
>> --- a/drivers/media/platform/chips-media/wave6/wave6-vdi.h
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
>> @@ -13,6 +13,26 @@
>>  #include <linux/dma-mapping.h>
>>  #include <linux/io.h>
>>
>> +enum endian_mode {
>
>name is too general and easy happen name collision.

I'll rename it to enum wave6_endian_mode.

>
>> +	VDI_128BIT_BIG_ENDIAN =3D 0,
>> +	VDI_128BIT_BE_BYTE_SWAP,
>> +	VDI_128BIT_BE_WORD_SWAP,
>> +	VDI_128BIT_BE_WORD_BYTE_SWAP,
>> +	VDI_128BIT_BE_DWORD_SWAP,
>> +	VDI_128BIT_BE_DWORD_BYTE_SWAP,
>> +	VDI_128BIT_BE_DWORD_WORD_SWAP,
>> +	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
>> +	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
>> +	VDI_128BIT_LE_DWORD_WORD_SWAP,
>> +	VDI_128BIT_LE_DWORD_BYTE_SWAP,
>> +	VDI_128BIT_LE_DWORD_SWAP,
>> +	VDI_128BIT_LE_WORD_BYTE_SWAP,
>> +	VDI_128BIT_LE_WORD_SWAP,
>> +	VDI_128BIT_LE_BYTE_SWAP,
>> +	VDI_128BIT_LITTLE_ENDIAN =3D 15,
>> +	VDI_ENDIAN_MAX
>> +};
>> +
>>  /**
>>   * struct vpu_buf - VPU buffer for a coherent DMA buffer
>>   * @size:	Buffer size
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>> new file mode 100644
>> index 000000000000..67c6666579d9
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>> @@ -0,0 +1,392 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 core driver
>> + *
>> + * Copyright (C) 2026 CHIPS&MEDIA INC
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/iopoll.h>
>
>sort

OK.

>
>> +
>> +#include "wave6-vpu-core.h"
>> +#include "wave6-regdefine.h"
>> +#include "wave6-vpuconfig.h"
>> +#include "wave6-hw.h"
>> +
>> +static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
>> +{
>> +	struct vpu_core_device *core =3D dev_id;
>> +	struct vpu_irq irq_info;
>> +
>> +	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
>> +		return IRQ_NONE;
>> +
>> +	irq_info.status =3D vpu_read_reg(core, W6_VPU_VINT_REASON);
>> +	irq_info.inst_idc =3D vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
>> +
>> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO,
>INT_INSTANCE_INFO_CLEAR);
>
>suppose only already set irq, irq_info.inst_idc, like below code?

This is a plain register, not a write-1-to-clear one. The firmware
does not write the next instance bit until the driver clears
W6_VPU_VINT_REASON, and the driver clears this register first. So
writing 0 does not lose any bit.

>
>> +	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
>> +	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
>> +
>> +	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
>> +		wave6_vpu_require_work_buffer(core->vpu, core->reg_base);
>> +
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=3D
>> +	    sizeof(struct vpu_irq))
>> +		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
>> +			irq_info.status, irq_info.inst_idc);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>> +	core->irq =3D platform_get_irq(pdev, 0);
>
>...
>
>> +	if (core->irq < 0)
>> +		return core->irq;
>> +
>> +	ret =3D devm_request_threaded_irq(&pdev->dev, core->irq,
>> +					wave6_vpu_core_irq,
>> +					wave6_vpu_core_irq_thread,
>> +					0, "vpu_irq", core);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
>> +		return ret;
>
>return dev_err_probe();

OK.

>
>> +	}
>> +
>> +	ret =3D v4l2_device_register(&pdev->dev, &core->v4l2_dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>...
>> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)=
;
>> +void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr,
>u32 data);
>> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr);
>> +u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr);
>> +
>> +#endif /* __WAVE6_VPUAPI_H__ */
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> index 1d4e016c2a58..fccb854a8a8c 100644
>> --- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> @@ -18,13 +18,19 @@
>>  #define W6_VPU_MAX_NUM_CORE		4
>>  #define MAX_NUM_INSTANCE		32
>>
>> +#define W6_MAX_PIC_STRIDE		(4096 * 4)
>> +#define W6_PIC_STRIDE_ALIGNMENT		32
>> +
>>  #define W6_VPU_POLL_DELAY_US		10
>>  #define W6_VPU_POLL_TIMEOUT		300000
>> +#define W6_BOOT_WAIT_TIMEOUT		10000
>> +#define W6_VPU_TIMEOUT			6000
>
>Need unit

I'll add _MS/_US suffixes.

Thanks.
Nas.

>
>Frank
>>
>>  #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
>>  #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
>>  #define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
>>  #define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
>> +#define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
>>  #define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
>>
>>  static inline bool wave6_is_product_w_series(u32 code)
>> --
>> 2.41.0.windows.3
>>
>>
