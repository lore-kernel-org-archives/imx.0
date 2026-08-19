Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4206395AD2
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130058; cv=fail; b=oV7nyzZ18GpPQ5TkZMyOrmMVvgMucy7lhS7SCq8U4F/6ybV0zlWznIwoEvEqJj8cJtwR4T7IdLttG/k8RX1zc1gXw9jmEfnXaMQ4B5kC9E0qZiEGkQI8fpYdGQSZa3SPwgA2+945YLtdAft49wtQL5+48b/jy3b3oNt6Cr3oVQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130058; c=relaxed/simple;
	bh=7efK9ckOxUveYODJtPTBQtOYYyk4csecwCsJslqjO1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rr63aM4JL08KgNMgk1Fk8n9pwjjjfE6ycTnm3UQLdSqkfhs0Wu6AY2MWdkdczmOnMXNz8tPbNSGTu6LxZibrFRW9jrNyq2tIADhItP1TR5Zff8ppPlkaif0S8Bcht2JI5wZMze0YZ3x2W31CUAC19jdEgMo6kTJMAUEBmb29ByA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HlTa7frw; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HlTa7frw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjUZdXLM4/IAIborsZ5J3I4iiA8xDa5wjZe3LLgmth3HRlnRPgC3O5YtFMPxrjmbEW33cHF65bsI9g6DDVFlo7/qUPGpi/DjqC6iL0a8C4sdhBjzlLNWmi6k6vvoeKa6A+sJmGiOc1ygbYEkoDr24mK6le2VQBJrogBW6vtEZ/PaQVakms254Tip8tpzjPvmHofV+x7hQ8+z0YTOBQs+Eur5qOD4sHOzG5F+3IGoTGdYtwUYloLg7pUIOSuq4QnbP/YMfwk5DYdk9Gpohh81BgOonhrv4on+DSEPdn+cqKoVsnKyu2CTEnqLrT9lX6ql5BLnss1iY8xS4Jm8PKiWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7efK9ckOxUveYODJtPTBQtOYYyk4csecwCsJslqjO1U=;
 b=EgoMdTiyfWXt6wav1t07ksLJZRI9XIphIu038C41rhfyQylR3fJ3ePgYkltudqkm2DjvCoT2RoFrk2Fb3bXCbmDQrfVNtKBUWEKvOShbdX7qa1a1BAgMmyJJNl67ek7yEgr8iVUI4z5Kcswai3iezc0b4vGuuQm5MTEg6wl11iiDIjtXk2WIPf4nH2ltr0Toc+sYUyVmopMbMzRrDB8NsnU2qdugwg8Nvuu9XglLvZzF/w6tYiZZ9kYLahXmRaTwg/8uKmqd+xlkAjiiK5Ub+1rgtOY0PEXZtzAI/3VwjbCMNFuc51Hp21tCNRk9QlE8J5AZ3pSDOsQr0g+QHbPt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7efK9ckOxUveYODJtPTBQtOYYyk4csecwCsJslqjO1U=;
 b=HlTa7frwC+2pnrLE+m6ag4hHxf2iQdRB70W/CdcbsMYRTh6ASCpBAqgDqYvw0FwQQFTbPRwET3VwZvU+bNCUpZpLNEfbM6bvlu+l8YAopvwqcQ3drQFUUMb9YqVk+9Nq/wVsqlXdKtMDvryFUmC642gpsDAa5lOzEu1uM/RarB8/yYs/F8FBrH7dq0Ph2eQQqFF/RIoN5ZS5GZ+LaNR8Hb7OWO4oEHx/hbT34GqB2GU2qJgsF1/SaSItxX7bjb7/IT/RuwaxJuPTKEJveAm8UvpjzYDJVOG+LJJvdllz/Ifye9pH2XXyPoGI/0dmB266vwfgQJ+XfVC0OOUIuABKcA==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:00:52 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:00:52 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	<jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 2/4] irqchip/imx-irqsteer: Dispose of IRQ mappings in
 remove()
Thread-Topic: [PATCH v3 2/4] irqchip/imx-irqsteer: Dispose of IRQ mappings in
 remove()
Thread-Index: AQHdJj3M+6azbw4y60ugPmqe7RosxbaS9H0AgBIxZjA=
Date: Wed, 19 Aug 2026 09:00:52 +0000
Message-ID:
 <AMBPR04MB1233496B2BA37D441A5DB716EEBA52@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-3-Zhipeng.wang_1@oss.nxp.com>
 <anYtxoIxO9tuMUTz@SMW015318>
In-Reply-To: <anYtxoIxO9tuMUTz@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-19T09:00:30.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|DB8PR04MB7051:EE_
x-ms-office365-filtering-correlation-id: b16fcf0e-4eda-433e-2df9-08defdd05ef2
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 Ltj/rsGmSGH/uq6smvhg5nTTnC8QeIGywJNb3efcBp7SOWyJUgfh0IXgrAmrupRWLeZbx6GF9+72T5sAN1ES4BVUoo5IGeDu9qAdsT4taYhGCyMv6AbkMJBCeqkOiEALAiSxWltDuk6VU2ZOgA888GLVJOQMGupY+IzXhE3CM8B66N1O3k/dWexPj8w12Tyo/Su6M0nFnNnJFwbPDgLeRL6SnVtzzJ2EaDe3UIS4a52rJmcx2j778SMatDhqYvjhlunbs5F51cRV3n38fPv1V8AsLpmSXBM8HgoXS9yyRdWwqoyD4tOVElQw7blRzRaOEplcl0++cCkEPL6au68312C4VyI5jaRT+CmGO1EytJ2KOzPcX9GOhLcuR1iUApLPRH/WTIUAPbyWqaRFoCN3pAG/Jn7XaPClfxvue1WGctiFpXbIYJWBbC33/ab2rmKQWa2owjoHkWpR1rPTTkLxUL5vgCYiwrMbWv+FhQ111fThtXd1F+qt/O5g+eeq8B7TPZ3fMgCx7lte/JHO7LTON+mTu9meR3Oq6lsMQVdNmm/kKY0KBo4f60iWF1xlc2n6oP9Efq9NNnW10+uWwwMRledMkE3ZTgIeC9xyHOHlcOmnUHy4K0r02Q34USJQft+ueYG1mtfVBEl+h/OFS1XYDLoVaEgivM2STdKRgQWGoefJ6xBcWaWSgX0QTaFBIxsy4JBgMOs0ud9qdlPTc5O455P6S+kqtax1qcSstiAaanc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUFNOXhiSUhZNjZ6M04vRTlEM0V2TVpxRzBhVCtHNmhTYkppbEllL0NYUXlX?=
 =?utf-8?B?K2liaElJYjZGSEExT2ZaSlQ4eFdBM0cyN2wxU2xUblpoT1dtZk1yNDllU2c1?=
 =?utf-8?B?M0ZWb1RkQXRGN0lTeE0vUkt0SmkyMmx3OXlBZkNEOWJnODRVT2ZBRkMyNFB0?=
 =?utf-8?B?RVlnV25Sb1F5QlZibDN0SlNmN0RkeGp5bDNTcjVETHpyRFBFQkE3QnVWeUZN?=
 =?utf-8?B?TTArMGtiNUZpQ09LbzIvUVpVRlFpbkZoWEFLNjROTFZxT0MzSnJPSCsvSzhH?=
 =?utf-8?B?cXNuUDlNeGd6dkU0VVAyaTBHUHNLQVROdEJtcGdJN0hMejV0WVRqbU9hNm0z?=
 =?utf-8?B?LzNnbTZrbllxVXdIRU9zY1NVRzZQdlllSjlvOElKRnE4Z1RlQ3QyeTE5N3ps?=
 =?utf-8?B?bUp3UmdaYVJwUEJzKzg0MnhhQk9JQmNJVDUxcmE0N2FWQTlQTGFjU1dZaEh4?=
 =?utf-8?B?SzJJUWVSdTRIbGxFV2tvWkZNSEtBS3dFQk42a0VvSDYrS0w0ajR6MEptOWNw?=
 =?utf-8?B?V1QvdEpWeXc0eXRrajdLeWl1cDl3dStoaG0xNmNSdDdXYjVSS3AzREFwZ0tD?=
 =?utf-8?B?Q0VLSmlrR0lDa3FDc0RPK2RyQlBHWUN6Y1AvV291bENWNUVpOGJLdTFIa2Jz?=
 =?utf-8?B?SE5VMTlkUXpRc0szeStueklONmJ0NGdIelcvK1NQYTErSWFtOG5HMWhzZ04z?=
 =?utf-8?B?V0kxWDRGYzNFUEl2cjhrak5ySWQ4Zm5Cclo2K240OFluSThVZVVvQWF1TEd3?=
 =?utf-8?B?OU55akNwTGhOaDkxU3JYUzUrRVdUQUxIcHEyejljTDJMNnI2WXptd1hRTUlQ?=
 =?utf-8?B?cmNlWVVZSGkyck81MXNMQWdGTXlzbjBWZ3Y4cGpobnZKZ1MrMk9JcHR5a0Fq?=
 =?utf-8?B?MGt4SDE3djV5WGdEZlhSUVBNNE5QVzNyYWtKNWIvdC9EOHNuY3BWV1pVaEJD?=
 =?utf-8?B?VU5KK0d0WnZTdGEzT0lIaEpGTGp1SnMwSUtiTHlkN2p3SmJhaWo3eWVHN0NU?=
 =?utf-8?B?ZmdWSnVrZ0gxMmZvTnF1Y2xVSjd6bnBqOU1JN0VNenMwZmQ1eVplQjljYzdQ?=
 =?utf-8?B?dCs1aDFCQUZTOFBtbFhFNE9EK1lDamQvdWpkaFZ3eHpqYVVBeFJsRkJRNG5M?=
 =?utf-8?B?eHBBR0tyc3h2WUphTGxrUEEzMEhralcybUVZVzRwTno5ZWxrZ0FFZFZJd29o?=
 =?utf-8?B?NkhxNE52MWozTlFlY3RFeE1wa1JLL3Z6VkJqeG9MYUt3d0pHNzkxcUdEaml4?=
 =?utf-8?B?REhwa0ttV0tjTWt0ZVppNmxvKzdHUXhrQUZqcnVQaVp3OTJQVEx6d1JKV2dD?=
 =?utf-8?B?SWhDMUh5ano2dkY0VGJNMTJ6NVFGeG51YTA2ZWhmOUhXRzdvZEdTL0RicGt1?=
 =?utf-8?B?c3J3TmFKajZaamlLd21scEFDcEM3UzlObE5JL0Frb3VHL09ocWtvZ0JlTjNV?=
 =?utf-8?B?OEFtOEhFajZaVWZESjg3YzNObEFUTENkUHVLaC9hOXpBRG9MZXhJclNRa2Fv?=
 =?utf-8?B?YXVsa3I2b2ZFSW5PcnQ4WDdOMDBiL3FOTWNVcnNzUmFNZnhOaGN1aU1uU0M2?=
 =?utf-8?B?OUw2QkJCWmJWa0diWi9ESFk3WjU4VFJlVDlndnh3YVpScjNPaFNvbjVzUnNp?=
 =?utf-8?B?OXJoSVQ3SlA5T2FtbDRwLzN3UEZFMUZoN1pGMjFpZ05JWmplcWZwNGxvUzBm?=
 =?utf-8?B?VzZvWGpXZ3lVa2ZSaFgyQmMyVWI0MFYyZmJSaDlYQmZrMlZMOUsyWHlZOTlR?=
 =?utf-8?B?YlhLdkNsb0FKcFMzeExLUXdwQjRleXJ0UXR2cnJlZjhaS055NlNpTXQ1c2tl?=
 =?utf-8?B?ZnRYU2tkYUxURHJpb3Y0V2ZFQnVNeXRXK21ycnh1eHQ2c2pwZ0NXeFVlZ1Jt?=
 =?utf-8?B?cGhicTljT0JqcU5maUlqU1FyVElmSDNtUHBNeXFHS2Fra1UvYStWdVlLaWR2?=
 =?utf-8?B?OUYvNnkzdTBGaGU4S3FpdFB5VlNiZ0FPQ3ZrZUE3ZVlzbDg4bklLR1hIREVD?=
 =?utf-8?B?MHR3VGJDZHBYbjBYZ05zZW1vbEtZNjd2ZHljVjh6NCs2ZUFPKzRKUkVkSEQ2?=
 =?utf-8?B?akIwaVpSckpDQXFIamF1VmtoemsxdXdvMHA0c3FjQUowMnNHa0tpaHowaGls?=
 =?utf-8?B?S24wc3RFd2w4R1lpZGdQL0gxSjVvNHRIVHVNYnBqaWRvajdNU0t5bldDYkQx?=
 =?utf-8?B?aFlnWDJ2QmhVdnZQOFFPSFRCTitjK0VyN2JVN2Z6OERPejFYU0FqWDVEQitq?=
 =?utf-8?B?M1dndGZZRHU4Kzh4Z1Q2c2sxa0J3Zm1XeTdEd2t2NkdrSmN5cE5nNHB2VXR2?=
 =?utf-8?B?U0tLSXZ6SGtLaTluWFFKZUZrMGU0TUZvNVFzYlFvYUdyZmZ1T05hQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16fcf0e-4eda-433e-2df9-08defdd05ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 09:00:52.1096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PfVBPo/MqbM251ezXZZq4zXIAr88z/XXj1SqlAQwKCypkB23tkJQPEn/HXprWncgWl7WKrpB49dr48iH8nQNmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

DQoNCg0KTlhQIENvbmZpZGVudGlhbA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBGcmFuayBMaSAoT1NTKSA8ZnJhbmsubGlAb3NzLm54cC5jb20+DQo+IFNlbnQ6IDIwMjbl
ubQ45pyIOOaXpSAzOjExDQo+IFRvOiBaaGlwZW5nIFdhbmcgKE9TUykgPHpoaXBlbmcud2FuZ18x
QG9zcy5ueHAuY29tPg0KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+OyBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPjsNCj4gRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5j
b20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Ow0KPiBQZW5ndXRyb25p
eCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8
ZmVzdGV2YW1AZ21haWwuY29tPjsgSmluZG9uZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+OyBY
dWVnYW5nIExpdQ0KPiA8eHVlZ2FuZy5saXVAbnhwLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNF0gaXJxY2hpcC9pbXgt
aXJxc3RlZXI6IERpc3Bvc2Ugb2YgSVJRIG1hcHBpbmdzIGluDQo+IHJlbW92ZSgpDQo+DQo+IE9u
IEZyaSwgQXVnIDA3LCAyMDI2IGF0IDA0OjIzOjQ0UE0gKzA5MDAsIFpoaXBlbmcud2FuZ18xQG9z
cy5ueHAuY29tDQo+IHdyb3RlOg0KPiA+IEZyb206IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5n
XzFAbnhwLmNvbT4NCj4gPg0KPiA+IHJlbW92ZSgpIHRlYXJzIGRvd24gdGhlIGNoYWluZWQgaGFu
ZGxlcnMgYW5kIHRoZSBJUlEgZG9tYWluIGJ1dCBuZXZlcg0KPiA+IGRpc3Bvc2VzIG9mIHRoZSBJ
UlEgbWFwcGluZ3MgaXQgY3JlYXRlZC4gVGhlIHBhcmVudCBtYXBwaW5ncyBmcm9tDQo+ID4gaXJx
X29mX3BhcnNlX2FuZF9tYXAoKSBhbmQgdGhlIGNoaWxkIG1hcHBpbmdzIGhhbmRlZCBvdXQgYnkg
dGhlIGRvbWFpbg0KPiA+IGFyZSBsZWFrZWQsIGFuZCB0aGUgY2hpbGQgaXJxX2Rlc2NzIGFyZSBs
ZWZ0IHBvaW50aW5nIGF0IHRoZSBkcml2ZXIncw0KPiA+IGlycV9jaGlwIHBhc3QgaXJxX2RvbWFp
bl9yZW1vdmUoKS4NCj4gPg0KPiA+IERpc3Bvc2Ugb2YgdGhlIHBhcmVudCBtYXBwaW5ncyBhbG9u
Z3NpZGUgdGhlIGNoYWluZWQgaGFuZGxlciB0ZWFyZG93biwNCj4gPiBhbmQgZGlzcG9zZSBvZiB0
aGUgY2hpbGQgbWFwcGluZ3MgYmVmb3JlIHJlbW92aW5nIHRoZSBkb21haW4uDQo+ID4NCj4gPiBG
aXhlczogMDEzNmFmYTA4OTY3ICgiaXJxY2hpcDogQWRkIGRyaXZlciBmb3IgaW14LWlycXN0ZWVy
DQo+ID4gY29udHJvbGxlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWmhpcGVuZyBXYW5nIDx6aGlw
ZW5nLndhbmdfMUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gIC0g
U3BsaXQgb3V0IG9mIHRoZSBzaW5nbGUgdjIgcGF0Y2guIEluIHYyIHRoaXMgd2FzIGZvbGRlZCBp
bnRvIHRoZQ0KPiA+ICAgIG1vZHVsZS1jb252ZXJzaW9uIHBhdGNoOyBubyBmdW5jdGlvbmFsIGNo
YW5nZS4NCj4gPg0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVlci5jIHwgNyAr
KysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVl
ci5jDQo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVlci5jDQo+ID4gaW5kZXgg
YTJmMDYyOWIyMmEzLi40YTJmZThiYTk3ZjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pcnFj
aGlwL2lycS1pbXgtaXJxc3RlZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtaW14
LWlycXN0ZWVyLmMNCj4gPiBAQCAtMjc3LDcgKzI3Nyw3IEBAIHN0YXRpYyBpbnQgaW14X2lycXN0
ZWVyX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikgIHN0YXRpYyB2b2lk
IGlteF9pcnFzdGVlcl9yZW1vdmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAg
ew0KPiA+ICAgICBzdHJ1Y3QgaXJxc3RlZXJfZGF0YSAqaXJxc3RlZXJfZGF0YSA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+IC0gICBpbnQgaTsNCj4gPiArICAgaW50IGh3aXJxLCBp
Ow0KPiA+DQo+ID4gICAgIGZvciAoaSA9IDA7IGkgPCBpcnFzdGVlcl9kYXRhLT5pcnFfY291bnQ7
IGkrKykgew0KPiA+ICAgICAgICAgICAgIGlmICghaXJxc3RlZXJfZGF0YS0+aXJxW2ldKQ0KPiA+
IEBAIC0yODUsOCArMjg1LDEzIEBAIHN0YXRpYyB2b2lkIGlteF9pcnFzdGVlcl9yZW1vdmUoc3Ry
dWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+DQo+ID4gICAgICAgICAgICAgaXJx
X3NldF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEoaXJxc3RlZXJfZGF0YS0+aXJxW2ldLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwp
Ow0KPiA+ICsgICAgICAgICAgIGlycV9kaXNwb3NlX21hcHBpbmcoaXJxc3RlZXJfZGF0YS0+aXJx
W2ldKTsNCj4gPiAgICAgfQ0KPiA+DQo+ID4gKyAgIGZvciAoaHdpcnEgPSAwOyBod2lycSA8IGly
cXN0ZWVyX2RhdGEtPnJlZ19udW0gKiAzMjsgaHdpcnErKykNCj4gPiArICAgICAgICAgICBpcnFf
ZGlzcG9zZV9tYXBwaW5nKGlycV9maW5kX21hcHBpbmcoaXJxc3RlZXJfZGF0YS0+ZG9tYWluLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2ly
cSkpOw0KPiA+ICsNCj4NCj4gb25seSBjYWxsIG9uY2UgaXJxX29mX3BhcnNlX2FuZF9tYXAoKSwg
d2h5IG5lZWQgaXJxX2Rpc3Bvc2VfbWFwcGluZygpDQo+IHR3aWNlPw0KPg0KPiBGcmFuaw0KVGhl
IHR3byBsb29wcyBkaXNwb3NlZCBvZiB0d28gZGlmZmVyZW50IHNldHMgb2YgbWFwcGluZ3MsIG5v
dCB0aGUgc2FtZQ0Kb25lcyB0d2ljZToNCg0KIC0gdGhlIGZpcnN0IGxvb3AgZGlzcG9zZWQgb2Yg
dGhlIHBhcmVudCBvdXRwdXQgbWFwcGluZ3MgdGhlIGRyaXZlcg0KICAgY3JlYXRlZCBpdHNlbGYg
d2l0aCBpcnFfb2ZfcGFyc2VfYW5kX21hcCgpIChpcnFfY291bnQgb2YgdGhlbSk7DQogLSB0aGUg
c2Vjb25kIGxvb3AgZGlzcG9zZWQgb2YgdGhlIGNoaWxkIGlucHV0IG1hcHBpbmdzIHRoZSBkb21h
aW4NCiAgIGhhbmRlZCBvdXQgdG8gZG93bnN0cmVhbSBjb25zdW1lcnMgKHJlZ19udW0gKiAzMiBo
d2lycXMpLg0KDQpUaGF0IHNhaWQsIHRoZSBjaGlsZCBtYXBwaW5ncyBhcmUgb3duZWQgYW5kIGZy
ZWVkIGJ5IHRoZWlyIGNvbnN1bWVycywNCmFuZCB3aXRoIHRoZSBkb21haW4gbm93IG1hbmFnZWQg
YnkgZGV2cmVzIChwYXRjaCAyLzUpIHRoZXkgYXJlIHRvcm4gZG93bg0KYXV0b21hdGljYWxseS4g
U28gdGhlIGNoaWxkIGxvb3Agd2FzIGJvdGggdW5uZWNlc3NhcnkgYW5kIG5vdCB0aGUNCmRyaXZl
cidzIGpvYi4gSW4gdjQgKHBhdGNoIDMvNSkgcmVtb3ZlKCkgb25seSBkaXNwb3NlcyBvZiB0aGUg
cGFyZW50DQptYXBwaW5ncyBpdCBjcmVhdGVkLCBtYXRjaGluZyB0aGUgc2libGluZyBpcnEtaW14
LWludG11eC5jLg0KDQpCUnMsDQpaaGlwZW5nDQoNCj4NCj4gPiAgICAgaXJxX2RvbWFpbl9yZW1v
dmUoaXJxc3RlZXJfZGF0YS0+ZG9tYWluKTsNCj4gPg0KPiA+ICAgICBjbGtfZGlzYWJsZV91bnBy
ZXBhcmUoaXJxc3RlZXJfZGF0YS0+aXBnX2Nsayk7DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K
PiA+DQo=
