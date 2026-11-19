Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110453;
	b=3+4bQGtfqDARd5OFHYu5vxpiaTDS27drH3FGtW75qPRIqE5dNNRQE6MbNfxTgB3LhRIm
	 uCoISS1L7magFaLDkKxui9W7g0svlWOpeeF4x2jJ5QnkSkAtfk+w8DqOwoMHtsmxZflEy
	 WHEDCMqgP6Ze6wuECIJr3S1frV2t/E8+8IlzHW0X0qvnp5SZ1d0FNt8uzUAm+cpLKQU5o
	 oX5PIyIZRMnGqRDTlutu9tOXG1hsLTY8K933rohVLdZ8aKkj6NsC5AAhietj+TpGdiqXK
	 NG2X9jW93PShTTMMRj/lURvmfqwBwj903TbvCmA+SXXJTLMoU98pyMa5GxKBllAFMqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110453;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=cORhPd8PpI2VcD7o5WmAv/IHaUBmshO6QNiLFRUGn+o=;
	b=ZJKTX381zMhvD/DMC4dpTqJgSZFhAoeK9jvdGlXF5UXvYBbKy5pnaOsytG2tCqDIFEyj
	 CsA1lw1Bvh4mnzaotDNqMq4V1BWmnSzyG2/aHldKaMHBy+7H33ahX8PIgsN92npBEYYET
	 bR0JCqAQlDLTzb99LNlekpPxVOYduF23kzkLDw0jtQ0Zc1C7m1EGV9IOstiXdMv1pqQdC
	 I4Bhnshhma5kkLxXway5HFf3CUO88WLU4ilEKnnuFLXp/B3997GTzxIzpq7F+s7t/Pk8Q
	 q/jEogli6cmDm6fGhehOPqmGni/r+BEoRp09QVFvPmSZ/W4Ivj4jmSGLiCkQ3KE+p7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=IxmEyFfT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.47
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47625606A32C
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 17:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47625606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=IxmEyFfT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9VWYPEB9aZ7a1FxGxhmOH1hscm3y/KtTh7yZXBZu+P84KnJynCMgCoQknEjWRnTZUT6CXyrzf35LKarBUe4dTQSOBJVzj0he/zHq3ZZFOh3SmZqB2a5YGPTmPfcRigy+JaVvjlMGIw4Lwrz7nXa+wH39X0/+qaTmvuIkHKXSWv6lTJ4Jtlb0R9swp4yf+yZDRwzWFEa/pKvq/sh0WULYPJ3aid71iSukG/aobZXQ6uaI53rTF9/WXi0VZBsilIGDnxOv90IZK+OTDSGp/9ELrSwWAH0EfWyTw/UprWPDY3oXi9Y9t2HT0OSdbXjqs3uq0G0lA0d7x07VQY9a2Sujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cORhPd8PpI2VcD7o5WmAv/IHaUBmshO6QNiLFRUGn+o=;
 b=kxl+kDyRIhoU0aOU1JJgM6KVmV/K5bLGbQ4IsF/nn2HEWH+495EnRnmxBtebuMpMbPlDs2lzZ2YwaUiYEujMTBdV3KB8386rbuGpqxf5lZ/VORUZacu8Us1gVB8niSwo7c1LVrr5+pQL9mdZDcTlwYCdjxKOwAY0lFVqDWJlKNjFDAYyjWRit3/wXqhe913UKc76a/hKHwgAzu70lcOliwrc7T7J4jh+c4HlzKW/TbZPWgnQ5CEEp/y4Gm0MeHVRAc5/5h6nO58AXotDK+h3myLtOP8Q7rFQJc+MHGI1Ae8piojsp4r3bbdHD5vRMGAes1MHIIL1UWfSXBX/EY43IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cORhPd8PpI2VcD7o5WmAv/IHaUBmshO6QNiLFRUGn+o=;
 b=IxmEyFfTOy5mZtRvPTsNyVhCd0V6AUM7sZtho6JN5MieHvAkJUH8UyBHc1+CCFx3CoVl1lzHuCGYwp0u9Efti3B6g0cmZqWMrtGmUtxPdWqJWsCv7pGOgq3cUFK1fvHLok7mifdX8i4pymxclmykttkNST1WLoEBdQy7d4Jt/Q0slMjJx9PsEz5ZBkC4xMfkFO+JeY2661MNEPZeIqaEa1P4qEl0udeC74kjhiRb3KIe10ZU4l7E1qMRVQ6XYn5qxbHGGsfZxrvOtPMRqLTvSSphp9x93TvlkGJiaNoF7cmdFDRW0V9IK3LhKXX93dQ6onF9HtvqausMwGMhfFOB1g==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AS8PR04MB8611.eurprd04.prod.outlook.com (2603:10a6:20b:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 17:47:29 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:47:29 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, "Frank Li (OSS)"
	<frank.li@oss.nxp.com>
CC: Arnd Bergmann <arnd@arndb.de>, "Pankaj Gupta (OSS)"
	<pankaj.gupta@oss.nxp.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Topic: [EXT] Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdd3UCXA4nO8zrKUaV1yIzZ9woybcz/RmAgAFFW9A=
Date: Thu, 19 Nov 2026 17:47:29 +0000
Message-ID:
 <GV2PR04MB12271E129EDA863074E4807B895792@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
 <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
 <180d2335-e328-48a4-b376-a90464279027@kontron.de>
 <3acc652b-d2e2-4a18-b70a-2656b309d798@kontron.de>
 <av3KA89WuUc5GdZj@SMW015318>
 <a2d7056c-602b-4c6b-bb14-211843aa3183@kontron.de>
In-Reply-To: <a2d7056c-602b-4c6b-bb14-211843aa3183@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-19T11:25:30.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|AS8PR04MB8611:EE_
x-ms-office365-filtering-correlation-id: a4da039d-e24e-4ede-6e99-08df46652e91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|11063799006|4143699003|10067099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|56012099006|261009223027099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info:
 Wce+hn99tO2W3nesz7SjrDunoHVF0Yi+/o2zjDbxDyQd9JFL9c8nT92BRRxpdpxK5+gH9rogA3+xfoJu6U6vLbO/1wuWBIF6KI6hmfuMdlWZwMsnEMRaDAZF/tf/w1eXt7b+JGCcvu1g+44bs5hwF0rtzMKziBv2l8MpzZmdCMx11vJSiUAWZYN58znh2zQ0zIt6Isf6Uct1ia6K+WU8eq4M3PqYxyTDaWqM79bfs5BlbQPGb5iSZeUfSAbTbCcWZoZmgTN+XW6KnlnNLpqk3NaxcR/Y1ArETjr3uA9qdB/J22htPfMnMs65Aw/6M6p4FaqTTWz0hL1SD2httJIlduVP0Ph987Q5iXVFqGnAwQeoY3DfUzOHRDplo6GTQr2C0NsOEFRB5l3/UaPrsZ1PLKNA7B1WXdPxZKuAAF/9eM4SltHry12YJeFz6QEa6amUkUboVRkxJyCerNea2J7UkxaxnrZ6FS0zY9CJ3k16HOq4eezXFwDUFqFyQYy0Enoi85Obf8mBGfNTkcA1iCZ1qhL8s7iCF4nO3iORZUQ0ecUUN7DP/CQ4hT4UQlU6h0FgYyyzHALicC3g9U37tlmqihhZZx+x3eRudz5gkFbYRDAZCGl2lpVa21X2qeWsts5FW/5XpsPzNFHmiY/paOkCW+u52Cgt9m5BCngZz+s+EuY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Kn9oXKjsVAIdmP/fpksLiJ1qsfR0jSzpdP4xcZNjNaU34rY2GuwdIvTOxybG?=
 =?us-ascii?Q?j1Evuc2ewVkyZq6iki5ld9MRcEf2YexiHbmqoHRhyrDutHlSrdxSLmPIS8lJ?=
 =?us-ascii?Q?mu8+iTbzlbWNH5K/1b9XRjoDsHAeuJyANWS7vcWlWq7EXynCpaNjJFVax1Fu?=
 =?us-ascii?Q?n9AQpxExvZI0L1DNgMYy6gRzsM2xQPpB9RydqX1SKB5yYXPAY5BIMKis5HGq?=
 =?us-ascii?Q?vPyOluTBWc7wyK8VXoOQ96Yr3qb/Z1c/Uyn5X3H1POEisNn8gytXTQw7abGP?=
 =?us-ascii?Q?Ohbs233Dnl7mdmFsexA8wufGPjYJCQ1T72OhDrNZaBLI/eT2ZIw//vc7mEh1?=
 =?us-ascii?Q?3uNYDNeNkwMDYjN3vftMJrZfWQCaLMt32xWjmtp9fRJfAKOCqOOq0EyHe8ID?=
 =?us-ascii?Q?F8sJmXqPFxJu49T4BougM14fXSHxE+tNw+mj0ucV3SqewsZ6GT8L6QyN4dy1?=
 =?us-ascii?Q?fQhWhEpQiVKzVdwfda7G7HCG0rcPZ2GgzFBxNOn9PpSU3zGPH50+/lVW0R1M?=
 =?us-ascii?Q?DfoZW6bYOKZpJsE8C8897rJYNvlbPyShGRoBp+3+fsNEvHupstJ5Z1pBSRRr?=
 =?us-ascii?Q?kO9Jdq9BMreLxua66W3NDFGAOcS9dToZ/Lwy8TUeex6fu9tbUpzdrDTs79tG?=
 =?us-ascii?Q?9c4+ecR6cTwcGperKdSDD1CFHx4J5r97W9fMgQcmvbA+gD3NzNhQs8CURBbX?=
 =?us-ascii?Q?qkuGfBg+wMF09Th+TB9OYjsgQBqFEiC/wAI4yR2Qw0A0zuu124BFoYZxzGlR?=
 =?us-ascii?Q?pDbKk6l/3s80eZYOG9OI4vVnG7jT5Zy8h4ktKV6kTtoKJBU5iJV9E1LLi181?=
 =?us-ascii?Q?pEOen9LlOH/d7aLOL5nB9wnaqrXT9IQaY8aKQSCcQmFvxun59DkGORwe3jq+?=
 =?us-ascii?Q?o4jnVRzSBIF6wHtFCXeh3KN0cCvZ3bmMLMoa529B/1z+FL7/mjGyE7jquW0O?=
 =?us-ascii?Q?3NrJm6xOBKtMjhgBcL2Wb5cXUWtFPkGQpWtXzE38VQseRCBNDZtONnNt5NmJ?=
 =?us-ascii?Q?JEgGuZPdKp0lDxtfgTxuMNNo5SobhQrexyaPesD+oYziPLi9mfw9hZH2PPuD?=
 =?us-ascii?Q?44g0O0GE6Pvz8fkxS2IyoCbpsXxbDg10PzXq6zzLKTUj6gjJT3/43gqh906N?=
 =?us-ascii?Q?vwVY6XZMmht8PiHLIRcIzhURVgwZm6w0+rJMV90dVgxcTSkyQI9Kb0LuqKC2?=
 =?us-ascii?Q?H94Bbq66OglQUO7B0I5F3iW1S9ANx23weJBfQMnYgz1tUqG0E2oETMROPIgD?=
 =?us-ascii?Q?fHKyIC/frBeBduijZEy0s/0H7utjsXzD8fhXlWWsD+Q1xQeOWDSYMVmZUeRi?=
 =?us-ascii?Q?N2ql+ECYrEfjd3glap+ZV7QZLboZKWnA5+1acYD48o2VJzBbXXpexHrFIaPh?=
 =?us-ascii?Q?IzOjtE6G/eoxbkIvdb89jPBwd4nhVA50saTUk1QQ5U/vXkNmSl7WmmAVzYP6?=
 =?us-ascii?Q?mMS8lUhSMy2GslF4VGlUl/hGzs9m5vsf6yclvSKrdfHLEVKehXK6aAQ7BQh2?=
 =?us-ascii?Q?havYgWA1AYPhqhxYR94DTOPCILq3v2iIX8yVhkvqiV7V9Ta6Ta7+3QyR0ezw?=
 =?us-ascii?Q?tI5cbrfyaKPbe40kyns8c2i7EKMlX1zSP0QQapK31Bpgay7bx/e1iguak0nv?=
 =?us-ascii?Q?gByieXyiwaWvRv1vLC/1zUpej4NYOUsWedBdpT118ZG9vVXt5LeqcX1CZNh9?=
 =?us-ascii?Q?aWeqrsmCWEjcXqkA49r3kLUldwaJqdXR9s2npoMu5wz7FzA0bM+71zdejjEx?=
 =?us-ascii?Q?J8EgSDP9Tg=3D=3D?=
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4da039d-e24e-4ede-6e99-08df46652e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 17:47:29.6330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvtXw83krnWYDzbBUh2DW4V3HcBijTqpyKVaXjCJ4v1q27sEn4wPTU5WJnhYAtXR4K05e8tkLP2X99hxSkNbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8611

> >>>>>
> >>>>> It is in linux-next about v37, but build bot find many problems, I
> >>>>> dropped it and request to fix it. And sashiko is online recently
> >>>>> and also find many risk. I request to clean up it, and local AI
> >>>>> environment have difference with sashiko, so bump to v51.
> >>>>>
> >>>>> I put to linux-next again to make sure that pass all build test.
> >>>>>
> >>>>> Other two problems, need more time to check whole review history.
> >>>>> reply you later.
> >>>>
> >>>> So this is still in linux-next, but was not sent in the pull
> >>>> request for 7.4. It's rather confusing to me that maintainers add
> >>>> stuff to linux-next for build-testing and then leave it there,
> >>>> neither removing it, nor continuing the mainlining process.
> >>>>
> >>>> Frank, what is the plan?
> >>>>
> >>>> I'm currently rebasing my work for the NVMEM driver onto
> >>>> linux-next, but as there have been so many iterations and this
> >>>> whole thing took so long, I want to make sure that this is not
> >>>> another dead end where I'm wasting my time on.
> >>>
> >>> I need to ping here, again. What is the plan at NXP to move on with
> >>> this? This is blocking multiple features that depend on ELE firmware
> >>> support for i.MX9 and similar platforms from being upstreamed.
> >> To be more constructive, here is a proposal: let's get the
> >> kernel-internal part of this series merged first (patch 2-4, DT
> >> patches 6-7, doc patch 1 reduced to kernel side). I currently don't
> >> see any objections or issues with those.
> >>
> >> This would unblock drivers using the in-kernel API, such as the NVMEM
> >> driver and this is also the part I already tested when working on [1].
> >>
> >> The somewhat more controversial uAPI in patch 5 can then be further
> >> discussed until there is a consensus on it.
> >>
> >> Arnd, Frank, would that work for you?
> >
> > It needs at least one user for the in-kernel API.
>
> I can provide the NVMEM driver as user. I just need to rebase my series o=
n the
> new reduced firmware driver patchset once that has been posted.
>
> Or if you want to have this all in one series, maybe someone at NXP
> (Pankaj?) can provide the firmware driver as proposed above in a public g=
it tree
> somewhere or send it as RFC. Then I will provide the NVMEM patches on top=
 of
> this for you to pick up and send in a combined series.
>
> Just let me know what works best for you.
>
> >>
> >> Pankaj, can you prepare such a reduced series?

Hi Frieder,

Thanks for the proposal, and sorry that you had to ping more than once.

Yes, I will prepare the reduced series as you describe:

 - patches 2-4 (in-kernel interface only),
 - DT patches 6-7,
 - patch 1 cut down to the kernel side,
 - patch 5 (the uAPI / character device) dropped from this series. It
   will be posted separately so the uAPI discussion can continue
   without blocking the in-kernel users.

It will include an in-kernel user from our side, OCOTP/NVMEM support
for i.MX8ULP, and I will make it available on a public branch so you
have a fixed base to rebase your i.MX93 NVMEM series [1] onto.

I will reply here with the links once it is out.

Thanks,
Pankaj

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260727-up=
streaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de/

NXP Confidential
