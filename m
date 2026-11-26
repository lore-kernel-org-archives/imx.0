Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795656870;
	b=S712zoCIxcFc44ifWGDqe0QEqPnAjox7/5EN5Vas5VqhNODBr+pFaQSRnMR8rE2Ej42w
	 X5Hz8Bc5/BbNRBrvrXRZjLh46k+dSHw8I0kCe1GxQA2v5TVK6LkGs7cqcayt1VBcib6eu
	 FujfSx1E9k+a35GCiPwG89fnnq8YfGNab0DbbkfflEDCPvNWDmdnl6OgqtCbjjl/HtN8w
	 /J1j0zgozlF/1rP/xcX/78IRBhUWOhbma/NUDdYqpMNzu46vCVYhKQAQEjZwde/Vmfl9G
	 K+6sI3+hOkZoJyvsPTbOgBOGqYzDUiPv50x12YeIpmnyt6MwwDKl5s/WWjEbuJsvsig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656870;
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
	bh=5FqDlwB3mG7+ZSaZ5nBDUeJF8rtejImiGc4HhfnrAbY=;
	b=C64pqlVe34IMf2YTMJXWQ+D9z08Vvttq7eXwKE4vZ20mzcnS2yQgIbtzSjkE3p26KHWc
	 i+ymMLV4yFMZxeagfxfpKb2KcAyOOB5dl6gITY10fQDqTBG0ZtK9GB/n36zIOIjpOZtUA
	 0GcGN+ILRVn+AirDj5RNrobnoYnLImYvXzNvmR11/0kTXCqks/CDPb/y8vnaYkESfS2BH
	 I9L1V83d+n+p4OdLtc233YO/Zqo0hdDHFDuPgdJDYiivsAw9OrdvpfE7Jyi3zDshxsEP2
	 WDf+G6S7p9IAL1qcAxNgO4xTL+f8qTK4aSUmEQJnmOY4UsYO/+iN4QFnZMzWx9HV1XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b="yTDB/Fel";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.134
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DFA606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 01:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=yTDB/Fel
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB+6v0khctkDsy27c4s6c339L6sP9EtviESFVENsmbTjcY6MB2NnWsTySnNp3ssoOx4PyHH9czdgeEOPGl8HQls79wo88H0fdCHcj9n7Tq5UZ/7vdjId237CL0s3cFQOBaXMAwvKQhKYb9HH7sUU+asvElZRLu4HVVbCt6J+ouG7mMFc4TdzdOWjsoKyzS3y0+dlPg04uPR7vpgEVwTGzGmHSUaQGncfI+Ze3/ZUvYAB4l3v+3rPhIN+rKSfnw+K0TGsyO9eNN54AFW2u8I15V68pqDkmRliYw+UrM6F3lP0TzYZNJ4NAg4N2L3LJYaM9xMxgM5biSYSqG+ZhRGmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FqDlwB3mG7+ZSaZ5nBDUeJF8rtejImiGc4HhfnrAbY=;
 b=FWWMUyGgMYgIwm7HfK8At7CBAY60qYh+vUXds6c8BWIQLJvIyZz+C8ffVaNvqrHTFSwiZSdX3BQkg+LH7MAU0QCuH+QGLNVZiMg6IxceBu5BHfdST/GJiNF/MUs2huCC0OwocwPuy5BdRcsTyAIFzNUU8f/GO3OW7A8wsJpYjR2s7z0FvUTP0gZI9ijVvovi0ZPKPIaqBMkNCi/NzxTdhl+ZDrjgUXHYp6tfW9oWeCdolM+8A++MxBuxLGJZy1rxnb7EKTcZv8bV8w4dbq5rzo4+kJGR7rjoIgo53LNmND+fFnUT+AT5h+KMsZPXYSxEkiyeranNTpSZ2D2/lzCfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FqDlwB3mG7+ZSaZ5nBDUeJF8rtejImiGc4HhfnrAbY=;
 b=yTDB/Fel9xOvs7+sVIxSBfqoOt2fvX0wb98MFwVERe6cUyfoUD+iWOSCuaJVzzb5v93MbzwI18P+Occ/xhIeZHd/ae1NSvWswK/ZCmqqOmJIqVw3sCEEqV+RJ1KqLOXioOrOLfP/nl9tqQf8JsAKMHNhZThvQrgQfx6XUEDG3Brey4U29J+SaybgHTm7NKatuhhxIPFve61venTDrEDBJjLCmkbtxP33ejfDBFxBFkmz3y8yUemCZVskbkvhNnhZvletn9wjA35f3Xm8EYb4TgmNItceUttK/ixgd7Ri+Vf7kiXy1Hg08HktRyz93GH7fMlQTP4e2+covgpdBzwTVw==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2804.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 01:34:24 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 01:34:24 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Detlev Casanova
	<detlev.casanova@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Frank.Li@nxp.com"
	<Frank.Li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
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
Thread-Index:
 AQHdeARslT7+PahjZk6zjlKKFGa+pbc14MWAgAWF4ACAALrygIACM3EQgADjooCAAGO5MA==
Date: Thu, 26 Nov 2026 01:34:24 +0000
Message-ID:
 <SL2P216MB24418E53B7682C06788EC547FB422@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
 <av9iadpXveXGb0R0@SMW015318>
 <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <8624fb6a39e5e13466882f01ea54842252f154af.camel@collabora.com>
 <SL2P216MB244180F5C6B16CEA1CA94589FB432@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <awc44XyssnfAyyjs@SMW015318>
In-Reply-To: <awc44XyssnfAyyjs@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SEWP216MB2804:EE_
x-ms-office365-filtering-correlation-id: 37fa7147-cceb-4a59-69d5-08df4b5d6719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|10067099003|56012099006|4143699003|261021121427099003|261021135927099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 76HZr9FSYRwzRZTgRDlRaALTmGOL45Gm+m0ixjuJFTOhHWC8ujXmgsBa6xq+WR0tQXe/dn081f4DIzIoYrv/fUaK32XoUQzoqlt6JukK3wwegvHJHT1SyWi0yRrPbAYg++lfXKFgH81OjxfFDYZBaHA3v1MK9vGcPs8zr2fxFRuyvKzdCcaF9ODOXU3k///xuiRax267iGrQP6Bu5k/LhbWfHmGu67oF6NWMduvnNQheGf8kyOH/T8asee9xdttmsgSlEzHHDeeM91Vxd0AfzEiJmyBBlpiLbtUQnOY6dEqb0oUNZXB+51rc/IFHh9RGp4ODHU/gTuqao9CKqXdHcR1g2JfOYM1N9QcVh81CyI5WKfUaWxIXfNdwSCx9LHwKeKe5EG1WGFNc6uyV/IzwyPgcsAp/FWTPFznP+IAcQDaS28Jg8e4DsPK22XZxKusrRN5svRrv9rAKvETDJEbUbuKGKkOXt9oZZauB3wPR9q1WEdqAFGRx4MO0n/rZ7SBqgjx3m/2UqcU3p8eVcONXY/QnX4U+nwVIpxwE/VOiFlmJIpW/x6uIsWscbafHRrU1O6W07ZVWHYIQHiFg3l4q+s93vXRWNRjXNjiJZDEo080U0yOP7Qq6E53L2OArRLkOxSWnuNIDU49EDCJhuQkEI62jNpwXteWwhU4kEoAwAOg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(10067099003)(56012099006)(4143699003)(261021121427099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VsQ8PZP+QSOPGf4iUHlCsQsDJSXVrCnWqompd18sFWivwyATFEuc/GCHW8?=
 =?iso-8859-1?Q?MYkfmoM9QY6MKtVPKF7RzH61MP/Y7JrklyoWth05a7OecbMFypyMFttp5T?=
 =?iso-8859-1?Q?sfL/dIryYJ80hrOpL3fmqXvMXUfBa+RyMrQqfRWq2kmzmmBquqoFpxLUCq?=
 =?iso-8859-1?Q?r/xenKi9aW6VVXLojDE/JAY64ZAwnMQRy8RvEvUAuTpw3YoBqbt44RmvzK?=
 =?iso-8859-1?Q?deWg5ic5e9WyqGsFSj/zlPDaWj/Mx7mbJqj96zSt4LVT0EMJBxOUFG7lTt?=
 =?iso-8859-1?Q?lNsHTZCzdCiAgC9YX4Wy2wwhcEsFWwtWITpdzkk4p3k58wVlqFziQulR25?=
 =?iso-8859-1?Q?tlOn0k5wt4yDu0ycH0WXRsVICnWG3+nFE5fYURYtaC4QCR8r/D4jZrfXqb?=
 =?iso-8859-1?Q?8DsjDYaGgiABIf6g6kfxlflXjTU9hN5TGNtFt9odfR3qq2uQhmEGuO13LD?=
 =?iso-8859-1?Q?v+QT53JT0PxgXjUzvIVtbqWYKSkNRWsLGy55SxgObvyzmThrNCmIEacSPJ?=
 =?iso-8859-1?Q?g/KUVw9n54fX7BjStH8x6FEqPsJmMBhi1zKHMFK7LKMdweHTNubtlDbIPU?=
 =?iso-8859-1?Q?ULnjH6pjfEV4KfIN7QalvMNQCP+BDHkts/mJ/zMWbr+2HAPqsREOVLK9ob?=
 =?iso-8859-1?Q?qrfqkoQno/LEJbxH6VwBcjAzbwmSYZPDEw7SFaE/kmZv/JA1QisyS3PO+t?=
 =?iso-8859-1?Q?HjX2QJQpYeXxCcGwJ1Ksyscj1f1G3QeoS8d9FSAX6hJ20v9HPa75O6G6JW?=
 =?iso-8859-1?Q?LBVJ/WuJWz9HAfFyYYSdACSXbzFD7QuFL+E22az92m+M/ghn+Tc6jrg8pz?=
 =?iso-8859-1?Q?i8lYs2LXU6F61DqgNB0CuUcf/n8MDncXdDeOJJjnJEHvxQ3vo3G8u/kcUk?=
 =?iso-8859-1?Q?q26Ma3Yljj+AxBT0yfz/0xR4viHO/QzOfcnhoay73/q0iMCPzKxCkjZjom?=
 =?iso-8859-1?Q?zjxoGIkIpREnHs4v6uHfg3aYlg+cRyFM0Co+umFf6ZyzAyXldbd1Y1mgL5?=
 =?iso-8859-1?Q?rjHdQLxT/NJnQ+seq9gLiZyLKAHclRcA7ObhBCgx909GwxtzG0PI5jmRlt?=
 =?iso-8859-1?Q?ucHs16EV8KJfbYhGU7kHhNitaYTC1StobsF5IvSWqLznBAa2wuvElwipTW?=
 =?iso-8859-1?Q?/hNYQFyTQ6buwaLpQZ8+Y7I2xomv7d3GZymnPps1f+rpkQw+zJvWeckz02?=
 =?iso-8859-1?Q?95EC7nE+h/yd6Z/2IQtB5A8ZdXrpDwv8cK/A2TUK9heEl2y6GEW05p9n3O?=
 =?iso-8859-1?Q?kpVA5n7uMKPiz5KMqAhy70oLM3hNrOYvPMFGaeINE7W3UX7q0EAEoNUwq4?=
 =?iso-8859-1?Q?gpr4j7bsGXBsydR0X741TZsKsfmWHrS6sxh8tUVAHG6/bk9yCPANLLSlXj?=
 =?iso-8859-1?Q?lQpAPi4TP3bvMKuP+nWPhEo25oy/7WKmLw8JgRPux5gzz+4ljqJjikbKSf?=
 =?iso-8859-1?Q?MNTneSVGipeuJaDDD+ZDmclt1q0Io3J0fDTZ7GN2TKgJJIk/z7pAqrE8Y9?=
 =?iso-8859-1?Q?SdohNUCqXrONIgi1JPa/jTd/2HIwr9hfsWfMw1XSU2jPl5aR9QQJ0flNJo?=
 =?iso-8859-1?Q?MzqSymbxaerTHFjDhTcQqEmePzpPwQMnsnABX2xj1+SFD+AL/bPAApSMa4?=
 =?iso-8859-1?Q?kmK28gD8HngAP6eN+959YuH72OdQmF2GQO15Qj3jVbJKT69CPqF8hc1FrE?=
 =?iso-8859-1?Q?YJQAbE6EYs7fnB3rkfxx9+IhUYUIzgUiMAUOXL9/rAswy44J9aXHTTrPav?=
 =?iso-8859-1?Q?aHpTMB/fBNOPbsvNTeAis12tsK1FW3+RP6BAsZyChwoxuK5AShcLkc7zbc?=
 =?iso-8859-1?Q?ieahghzMcA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fa7147-cceb-4a59-69d5-08df4b5d6719
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 01:34:24.2586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x74+2oSnUPFAqvuHRjM6oCfgey8bCZXYAvbQOjknTOkTqIIi/Mxhh4SUM1O1JOUwwQEtC2jhG7k95Fx5LMG5UAesd8WcOuCiDxBONin85rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2804

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Thursday, November 26, 2026 4:37 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>; Detlev Casanova
><detlev.casanova@collabora.com>; mchehab@kernel.org; hverkuil@kernel.org;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com=
;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; ming.qian@oss.nxp.com;
>marek.vasut@mailbox.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
>profiling
>
>On Wed, Nov 25, 2026 at 06:06:05AM +0000, Nas Chung wrote:
>> Hi, Nicolas.
>>
>> >-----Original Message-----
>> >From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> >Sent: Tuesday, November 24, 2026 5:26 AM
>> >To: Nas Chung <nas.chung@chipsnmedia.com>; Frank Li
><Frank.li@oss.nxp.com>;
>> >Detlev Casanova <detlev.casanova@collabora.com>
>> >Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>> >krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> >imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>> >festevam@gmail.com; kernel@pengutronix.de; ming.qian@oss.nxp.com;
>> >marek.vasut@mailbox.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>> >lafley.kim <lafley.kim@chipsnmedia.com>
>> >Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performanc=
e
>> >profiling
>> >
>> >Hi,
>> >
>> >Le lundi 23 novembre 2026 =E0 09:18 +0000, Nas Chung a =E9crit=A0:
>> >> Hi, Frank.
>> >>
>> >> > -----Original Message-----
>> >> > From: Frank Li <Frank.li@oss.nxp.com>
>> >> > Sent: Friday, November 20, 2026 5:56 AM
>> >> > To: Nas Chung <nas.chung@chipsnmedia.com>
>> >> > Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>> >> > krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>> >> > s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>> >> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> >> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>> >> > festevam@gmail.com; kernel@pengutronix.de;
>> >nicolas.dufresne@collabora.com;
>> >> > ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
>> >> > <jackson.lee@chipsnmedia.com>; lafley.kim
><lafley.kim@chipsnmedia.com>
>> >> > Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add
>> >performance
>> >> > profiling
>> >> >
>> >> > On Thu, Nov 19, 2026 at 06:00:03PM +0900, Nas Chung wrote:
>> >> > > Add per-instance performance profiling to help identify whether a
>> >> > > throughput problem comes from the firmware or from the host side.
>> >> >
>> >> > why not register as perf interface?
>> >>
>> >> The numbers are kept per instance (per open file). Each instance has
>> >> its own fps, latency and min/max frame time, and they are updated eac=
h
>> >> time one of its frames is done.
>> >>
>> >> As far as I know, perf can only count per CPU or per task, and a
>device
>> >> PMU usually counts for the whole system. So perf would only show the
>> >> total of all instances, and we could not get the min/max frame time
>> >> from it.
>> >
>> >My preference would then go toward .fdinfo() then instead of custom
>debug
>> >fs. It
>> >gives the FD owner the right to see the statistics and not just root.
>> >Here's an
>> >example of in progress attempt. The idea is that some key would be
>> >generalized
>> >and documented and some other key would be driver specific (e.g. wave6-
>> >prefix).
>>
>> Agreed, fdinfo fits better since the owner of the file handle can
>> read the statistics, not only root. Common keys would also let tools
>> like v4l2top read the same statistics across V4L2 drivers.
>>
>> >
>> >https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-
>> >d556568cf38e@collabora.com/
>> >
>> >Then once we've upstream v4l2top, one can track the performance live,
>and
>> >you
>> >can even add driver specific metrics.
>>
>> As V4L2 fdinfo is not merged yet, I'd like to keep the debugfs file
>> in the series for now. I'll follow the fdinfo series, and once it is
>> merged, I'll switch the statistics to fdinfo and drop the debugfs
>> output.
>
>statistics is not credital part for function. It'd better skip statistics
>information patch in series, and add it later after fdinfo merged.

OK. I'll drop this patch in v9.

Thanks.
Nas.

>
>Frank
>
>>
>> Thanks.
>> Nas.
>>
>> >
>> >Nicolas
>> >
>> >>
>> >> Thanks.
>> >> Nas.
>> >>
>> >> >
>> >> > Frank
>> >> >
