Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.96
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163762;
	b=gukpnmc+MJZYTH+fYtXQA4OUZROvXwUwvdNIKMNZ8Aa9BkPLQusDp9O6Nk1g7eK501YT
	 aME5t3yvec7g6uVegNrdBkLeWnfUax24V+75mZq9TTKzbrfhBnA6hMd357nBLuHAQ7FSi
	 R645dgWBYyWVLwYW/aBwF06oVdgHs5YZVLpj6LXeeAzqYBnjH6LtRPhAYzSF22RFy+2SB
	 A48fuG2wwkwoZgU7RMkN+Cwb9rRL2VQjsoxI1kCkxx7oiBFLDAPehutx/zn3k3kcsZknx
	 R8ermKoIwnAQpJwOiTyaFGGSt7NUVw6nFhN9TRTurn/M74wTsJWxqaYk43o2G/dGRjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163762;
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
	bh=LxChbrrZV+zFqp+fLlUnZyMDafjkRbWdWeJvGgG26yE=;
	b=x2MXJ2H/sM9fJmcZgEXuqNVkB2CGWFtuEhzQa89DbGCqkUYlNQQBY/Hr6ghI2KHC4Tn9
	 36dH3iUhcOkvgv6nrexKOaIyzuwXnhlvU/L3LyIFCbcfcMorhLmHelf2Cj/WdtrhY8HoA
	 cDnSg9k/FyfPAoXCSfX/DMoj4TtL0WFBQIH4EoNhwi7hb5ax25Mry28MPNXr1OCs2sCJ9
	 UfX8zXY69DufuWp0iHt8HsED4oqqcI0MvEVBN8CfwK1RxXk7xZqkOIhew4QEGp17XC0n5
	 Zr6ttN61KhDaWt2uFSfGwsG/u5mpbnUUCiB3tO7G6J7Dngp83kdtUdb/vFM8w/lbpGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=hhyRIvFX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.96
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32CE606A326
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 08:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=hhyRIvFX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB6UYmcKq4rsGTSx1d/deITyTJTT7cwwn+MC2JAD1/UPxh33b9L4E8VKN5YHxNd55FeuUxfBsUwucznngxARdETwtuCkqRxyBwNyuA0oTafZpZBHxhhodf+Ajk4As3O9Uc3GiZioN5wORpZpgOXOMmLAYLEznsez4Tp8jXQRUv5HeoXHWHaaQfJzJeDCA2pdR88LQsibzXihzqrQEVte5Kccc5jsF0J7SVxMfWSghVGRuHh41fUbflxWrsMvBRsEsCFcC4iAlS8wdOMXqEGjWrSCa12iBj780NVazh1jAcJoAAz4IXQVmAuAX14eUStHSn2mWkryPmFkaGA6Ry3rhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxChbrrZV+zFqp+fLlUnZyMDafjkRbWdWeJvGgG26yE=;
 b=TJAQNBe3NwusOzScDIunxtOBtHdBFQGwlgVB0ysRcfOrfjPRkjjPpL7PchMUZOWh3MTMr9FEYbr7BUJ8bE7GT59dLUCceouYDzJZHS/e1yvT47MKH3szvAGJzRQDHMTnjFUi2KMDgipPXSVcz/pWhzPkcDC7QwXYkSykEyzu+tOX9pxJHlTc/Bm/f3ZJ5INlNvdguRDLxQj4wH8OTWpb8VQwrpf3O91RVzfGzyPMu2eREDuRWUCQHL+zIOGgTFn1QdelIn+T9Q4xz1+40aSMdUU40Vzi/B7zdIoG6n5io1UbfEJ9FNaZ8zbl+VGDfS0Tu+Y+KlhIal5hfkBbEYCbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxChbrrZV+zFqp+fLlUnZyMDafjkRbWdWeJvGgG26yE=;
 b=hhyRIvFXe+mllQ09Bx/scqI1j9EMhEUSJ3mL2sn6/f44EX0DOpalZzPBTc7XoCUVfH6ig+CmhgjAr2zoyyip3lrxx7/ZOtsm4MgREA73by6GVM9PixSmlgPqn5svpQK1VI5C20s3NMr8Gg+2bEzVuGSeLMFUCf6AbpW8j4x7KaXHCzfD3J+uCj+vKOuqnQtIDL6tlnxn+b+6GAAVNpmnaOLh220Yl6XV0SMB5YLDHTBAxzhpDvJFz43ZtCoX/isYQodlbeYy8qOJ2rGRmqk7v8niv/+x8HgAzogsDJtGbGPaqH2IuHTwjvlL1vv5VUlN+P3WHtALSdWEeV32hYMFxQ==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB540648.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:35:58 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:35:58 +0000
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
Subject: RE: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder
 firmware interface
Thread-Topic: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder
 firmware interface
Thread-Index: AQHdeARpUyb83kGqMUuzxLfi+MdlDLc126qAgADHbqA=
Date: Fri, 20 Nov 2026 08:35:58 +0000
Message-ID:
 <SL2P216MB2441FEA3BA37B5274BD55C3AFB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
 <av9eIKDq8XMM_rfC@SMW015318>
In-Reply-To: <av9eIKDq8XMM_rfC@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE2P216MB540648:EE_
x-ms-office365-filtering-correlation-id: b8681bf7-7835-4f90-696a-08df46e14cd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|6133799003|22082099003|18002099003|3023799007|261022105027099003|4143699003|261021135927099003|261026121527099003|261022075727099003|261028144727099003|261021121427099003|56012099006|261102123227099003|261009223027099003|261026140227099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 /pNSh0LwBz/MPCUmYj2dshJ3NGaEzn2sh/2VNeuBXUIvX26NPY4Kk0vVefMJlucwvdU+dcN72PyZaPn9P/RTk41W7gCOrE/5psCh2cRLUhby5LsSWKFCg6ekFx2pUAVRam423qovW7GMx8DJdsEBaPW1mngRn3tqvsomtKXssQIOuZ5mKy9CjToO6T3c3LHpQL36NNYsR3ayPCi+YYTxc7ycxoysrCshbBxhJUX/7hI0kJhgUL6m+JwdVukuYQfsw9NaTFkjOeXqKTMhwC7KnF0lPv+URSfc7FLavKQksyU+YpNhZkY48EOoy66T8Qs7FRUqaIj9N/77W6TGHdPirocN0gZXu1Pwj0k3MgF3yO/w5hEqvBTde0CMLwvgH7519SAX/NwMBd8Hnn80pBYrsI1hF43oWOde/UWls4GUMwqGRG/vzW49H1JVsdSbqYKBEhYIzMAJenHvYPagAa7U1iRQFyuzgGq53H3tyUu1ThBv88rDnACghot4Z5uZGPt/JPAJZQtZFC629HUYcq5qhOZmNTPceCszS87E9PAcEEnmZBBr0rQiUdzP91eatkPBNbb6/udEWDGdCCD7Hh0/EsORVdWV2Ctn0Xhn8KbECF7bNB8np0SxyNlvqGCHykY7VQAb3j0lCaSuoMzZqkQR1PGB/mfs7/9stawwNrxfWOvQiA8FuLYlQI2mclzXLw1BkiQYEZRlzO1/C9ii+hCnrE8WWCgOagpxqlaXM7h+cuA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(261022105027099003)(4143699003)(261021135927099003)(261026121527099003)(261022075727099003)(261028144727099003)(261021121427099003)(56012099006)(261102123227099003)(261009223027099003)(261026140227099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YOFF8R6dfX4oQBhyilU1iw8oxn1OJ31ZzcqKL0R8DDzk5SnBMJ+KH+DnIxrk?=
 =?us-ascii?Q?/tCbhe5eSqQRpHoR9mjP4XrLFIUahU4qddydDUwEG2eJgWya/xqUeQZjg6GM?=
 =?us-ascii?Q?9eQffW288vXSJTVdtUI2X97WjKT1SVSwQ06aRUqnsr/EO/AW5uPdkEBuAgGm?=
 =?us-ascii?Q?Oq+qfV/G16zAx/UUnwl1EQTE8/Y2KImulpIXKMx7GIHEMzv2gU3UdsYdMouG?=
 =?us-ascii?Q?RVw3Nik0Vh6xgIURt8mZSrYTeuUcXiLefuqK0PfslYuO91AL7cgMgk8TpIkZ?=
 =?us-ascii?Q?9v0z/agZ2wxnsghJqvpl7tjx6DqDE1toNR4/SbKZ/mRiVxg23ftNvwuEXwUy?=
 =?us-ascii?Q?N5aw/ofHzHmT9F5hM1t2Y4shhjBPcQPgsA/+FrDR2mXmXXyM0DiolFVocwnE?=
 =?us-ascii?Q?85RSVW9cMA98n9kGjBAX5luMkc/c0FDciYdYl6vQzOnBA0Is+zNixoj7RIu2?=
 =?us-ascii?Q?nGR7W5csXr8gUaHHw1Ha6KgYbDAuOxJy8FoomCJ5tsu2QYCNqal/kFhwSCfw?=
 =?us-ascii?Q?1SYES1sCd0amlw3TeSs4gURw4kTHE/dkXck0xErW6jWCAHiHZ7EAEh4trswI?=
 =?us-ascii?Q?H3foTHcASd+A6JyrZvd7oLgAUwXD70lDQVNcGVwefRvngyBLleNHLg/bUxFF?=
 =?us-ascii?Q?RGABClcqwqzjV8GVloMNrJh0bYUAFm6Ectbse/rVlBNHhXWPBtDM1bHU+gEe?=
 =?us-ascii?Q?6rv13jM6VIs0nPYINEKm0ma7w4EpJHTfdOgZsqEmQ2ss9ifRYZ9UrohACdFZ?=
 =?us-ascii?Q?KSqb+FTTkYNCYzDgksFpEVOCTVk36mW2CtXSJ6nJgRUSzD84OEdQK/CKc6D+?=
 =?us-ascii?Q?nxYvGb8EsYwjo1DYTmZJZmsEoqC8rudhDdEgJKxWDQgBH1SOkfiH3I7UTqXZ?=
 =?us-ascii?Q?9c6E0Ir58AAT5xrX/nHhwy0OASPIqT948a8Pyh7xkG1FUvXYtXF5PSrGGSMa?=
 =?us-ascii?Q?LTW/L2lIYASNaPgqt0xN+we9S6D0QTNemSnTUXByPCnzT2wZz6i2jwKkexu4?=
 =?us-ascii?Q?VX69KeBiocgMDLWGLxfiCYVPhfUXos99RyT3PHYt636AK9qP7A8U85OYoWku?=
 =?us-ascii?Q?JvyL5GWYRRSj/nySuwjsWQ09fP7c2JMnqb8EG21MvrCtiXg5fY9TLqa6p0ub?=
 =?us-ascii?Q?94L86ckkLbymSTcF4h5G8zfno5OWc2gtsREquYEzLSuSUMYskIN37Q7s+oxD?=
 =?us-ascii?Q?NT0M8GyHSlBuWoViqxNW1yc5P66dcV31snnYhQVNNGYShSHLWtW57EzA5O8H?=
 =?us-ascii?Q?fG4F9rWq6Ads9Mmad4IGrr6CrFDP333zr5f7nQ1tK3ljOlt0yL/gabHbBpsP?=
 =?us-ascii?Q?tf+reem3G832/2YH/WZ/TVooAkV9jxSuBhiS9dFVefbw8SYoqDHhExGI7l44?=
 =?us-ascii?Q?WOesdgFi8cu1LvLf2eiGi2/VbPOi64GHataoRBpBYt9xd4NogSH7IWWzW51K?=
 =?us-ascii?Q?81GgdYRp+sKKMqJY2kwRHWptxE9j9gP3LGirhvc3uFrpjCYDdffC8lp3HiNx?=
 =?us-ascii?Q?c2pgxyz2IlV4LwdfRWI3pRzTGG/3MIa7AUC+0OsPuD6KrII5el2N7dRV/5EJ?=
 =?us-ascii?Q?0PPwF5VAFHxMQUfbuPB3y2p6eJOG+Le1mEFeyeGNLpIYCL1bNtgfjeAo86h2?=
 =?us-ascii?Q?2X3eY2FMzWBQnmMWBF6RiWqdlNN/4pu+IJ6WKWKhonevM5dRuTkH68W1mErq?=
 =?us-ascii?Q?1RU93CvK6qoH3XAtYTJQJa23ta2RlA7/itpa7rcGLPaWcR758cVB7w1aznbO?=
 =?us-ascii?Q?3f+75RrCIQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b8681bf7-7835-4f90-696a-08df46e14cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:35:58.0392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hHCdyS6b/7pPDyd765URmdaC89opOcHrgDDBJUORP885m1FxlVDzDiPheKMzcd8YMlfbM3CzJ0xlJyxeWLj1wReyjYh9iwStNuvNxbzxkUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB540648

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 5:38 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder
>firmware interface
>
>On Thu, Nov 19, 2026 at 05:59:58PM +0900, Nas Chung wrote:
>> Add an interface layer to manage hardware register configuration
>> and communication with the Chips&Media Wave6 video codec IP for
>> video decoding.
>>
>> The interface provides low-level helper functions used by the
>> Wave6 core driver to implement video decoding operations.
>> It handles command submission to the firmware via MMIO registers,
>> and waits for a response by polling the firmware busy flag.
>>
>> The decoder commands cover instance creation, flush and destruction,
>> sequence initialization, frame buffer and display buffer registration,
>> and picture decoding.
>>
>> Sequence initialization and picture decoding complete asynchronously:
>> the interface interrupt reports completion and a query command reads
>> back the result.
>>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>...
>> +int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst)
>> +{
>> +	struct dec_info *p_dec_info;
>> +	u32 reg_val;
>> +	int ret;
>> +
>> +	guard(mutex)(&inst->dev->hw_lock);
>> +
>> +	p_dec_info =3D &inst->codec_info->dec_info;
>> +
>> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR,
>p_dec_info->stream_rd_ptr);
>> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR,
>p_dec_info->stream_wr_ptr);
>> +
>> +	reg_val =3D DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
>> +		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
>> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION,
>reg_val);
>> +	reg_val =3D INIT_SEQ_OPTION_MODE(W6_INIT_SEQ_OPT_NORMAL);
>> +	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION,
>reg_val);
>> +
>> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
>> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
>> +	if (ret) {
>> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
>> +		u32 reason_code =3D vpu_read_reg_relaxed(inst->dev,
>W6_RET_FAIL_REASON);
>> +
>> +		wave6_print_reg_err(inst->dev, reason_code);
>> +		return -EIO;
>> +	}
>
>I see many place use the same pattern. Can you move to help function to
>macro like
>
>#define wave6_send_command_sync(...) \
>	wave6_send_command() ...
>	wave6_wait_vpu_busy() ...
>	...
>

Right. I will move this common pattern into a single helper function in v9.

Thanks.
Nas.

>
>Frank
>
>> +
>> +	return 0;
>> +}
>> 2.41.0.windows.3
>>
>>
