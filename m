Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C22770A
	for <imx@lists.linux.dev>; Fri, 26 May 2023 16:27:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh4wfXlEiFjoQ+vwsPzk5Fgj816i1efUt4ApaNRgoGPSLTYHhki2icAcD1Y0dnh3TiK0USJWNw7cl3sGKHAuzobWieCLdBEzCSZGD/K9hoqEEYivvSxkAHtfC/vFmrujChAqawFMs+M1J4q+iP5YLJbv2yyMlbg5JmzUe23aVzmdwCSszTaUfl9UEoy4fi41FvCgmTn965rhMDMr74qzHSC+Klq2iwoNa3HV+JzVGgKu3fevlibryQJnuXWe7y562X2Ugfu3xMy03GSImJJ7xh8Ge6VowWeVj/fJQJK1igrx+dp9rIdlmLFaYXdqW5yaOfnSWZM0+WSHm6N3G814bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHnQAFUNF1eaDWVoz25hXmLZW1QXgT4RkjvNe/7siL0=;
 b=RMWe1kXbR8XcJ61ozUbtKsAm7u5X0P0JfneZQ0HTKpjx1GQWONfRwr8SMtE4t31PTPHgrNtIyMuNY6/jOymubDWOudApfS6P+3SDS+/80vfIRiTj8HukT1KThCfCztELZ+gopWqqiQ50wTSpWlhHDczjJfBaEp02fdh+GFdHzDPvJU+AqKYUf3guPopUi7bbm5shJnzY1Xf4dmnFYgu3Kk4ivrkFBoDFlnaXCN57gDBNw71cIX/+lWcL5PCf7YgcZ50TBE7ml9WAuib9KHa3PY1VjrNAxH0+xGQsvucX1xfaWUTnbAFFV8PDB59Rqu4NICD9GBSHWqr6pJidRVC3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHnQAFUNF1eaDWVoz25hXmLZW1QXgT4RkjvNe/7siL0=;
 b=bmbgWKEMgZB5M9YGnXDHgeQIfOjujVP0bO8YWi36xP9vwgge9Fv2XPbLN4bNvCvhDC9mzTjJlE6dno4F7hHYqwNCzV4ua6Lbs+Yl4vvMOlhfKIGbTrIEgrMZk8OMeiqGEz+QkbhP4+etOuLrT2EAdnm1sSRJ9ZItBcR048jt3yc=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB9446.eurprd04.prod.outlook.com (2603:10a6:102:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 16:27:23 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 16:27:23 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate for
 lpuarts
Thread-Topic: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock
 rate for lpuarts
Thread-Index: AdmP7oL2S4YqRh99SCqTvLpCB/ACxw==
Date: Fri, 26 May 2023 16:27:23 +0000
Message-ID:
 <PAXPR04MB9185B83E1AFF35F1CED8857089479@PAXPR04MB9185.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB9446:EE_
x-ms-office365-filtering-correlation-id: 227ea21f-e27b-4b4e-7d9c-08db5e0615ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 35Z9Pxuwi8lbN2fnxKuidrPacbHQYcZgsflYH0YoKtIGG193/4Vs/QM3lfp7i4ux07WgeimQYZwEsAd1RZO3J0Bc7MW9XCKjNOa9+fIWnuyAhV7nrZYkXu9PNBSf4YXz1uu8PJOmYiBTSb3zsOHVmkAz0CZVrgUlGB8rQ8FJ83SIMouQzqCDOdtp99tU5TbcEymvTrC9DZcIHcdiE2qZ2G7gb21yTCTV0iHdLBcZzxN6/cxQlrpQWQ4q4ig3foCB9rAxvXlVNwMk0v3aGOiVXJOgwEMEGvAwgdyGNiAEIg2NHt21vQWnihpJ4sqlhWY/3dxBklmtvOtivK2i+UMufOuNwXMSqL3bw6+fU65Mx+8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(66446008)(76116006)(66946007)(66476007)(66556008)(64756008)(478600001)(4326008)(316002)(6636002)(558084003)(33656002)(86362001)(38070700005)(26005)(9686003)(4270600006)(186003)(55236004)(6506007)(7696005)(2906002)(44832011)(8936002)(6862004)(8676002)(41300700001)(19618925003)(71200400001)(55016003)(122000001)(38100700002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5kzC6Kcn460b8IYCWTg9kig/ruOKdw12Nbe6QFbel57XJh2l/8LcctSAdlJY?=
 =?us-ascii?Q?BH49UZtKaMHBxdfFcVl/Ylc7QmSTPu/fPkuTxvhxivDpXu7eNHmQea3GvBRF?=
 =?us-ascii?Q?KGZ7oX+3KPKcDFyac1tle9Zi8gYmkN7Atttjh7ZOqLG25mVlc6iLFfx49EUY?=
 =?us-ascii?Q?NGnGlLEdzitm3bnT1b10FR78cysU3Zsmv1hsgOI5JaxYh27ljr5CZRktO/5x?=
 =?us-ascii?Q?Pch3Z/EQdVAKnLrP9dmZkRd/sd01vZVL+uMLz+uR7D4C+zr7lQSJcyZ8kR2W?=
 =?us-ascii?Q?Kz+5uxzXKXaBwiuiyVXBevu9vdhi6F8j4TeWRDJY2cY7vXcwxL9rRncm5Q3R?=
 =?us-ascii?Q?DkbYA4Ce7xi8W4Zz/Rvvp4rODenE80MKmcBnfI3nRX3/hdxaPExiDLZiUJO2?=
 =?us-ascii?Q?2VMM7IfFrkRCglkJOHCtx64fehuopq+EgiY9jYle5Mv5dkkRACh1JeYO0MAP?=
 =?us-ascii?Q?pRZADaE5s1GIx8ryOg7aadGc6bgiJKZOH3vuo/U7kniG8GqOK1TQU5bM1GwN?=
 =?us-ascii?Q?/qlZBRGgplPUWzgZHpPeBNHy1/FyJEIZQYJ8T1C5OYh8U+QKQ36Y+C0HGjQX?=
 =?us-ascii?Q?fXWL8lRMoRTCBN2BvaRhu2bCetrT/6GTBV+l1UkD/7LKPPCftHkJxIXh33tf?=
 =?us-ascii?Q?ajUPlVVUXRWnJWD9ROAJbWfHmNKCJbKDTttX1NeAw4TeBRgwL7wJHnwd8SC9?=
 =?us-ascii?Q?h5i9czbFDeuc3bJfdKxQR7m2fTz4wkU817B0lyqV/PElfNKzbp6+3lcW9phW?=
 =?us-ascii?Q?yZ6+sgDiOVz5v0jeJzimsS6uLi3aAxkR1A8KiBmg171jyidto1vfmKWFAz6N?=
 =?us-ascii?Q?/Eh1Nwy8WhqI2/B6ZbWd3/WSzy311xKth8EWnBjdWRqxQgsWfufygyuIq3ix?=
 =?us-ascii?Q?tB3xwVATKeTTHE4TGPkXQSZEzOC9XvRX/uJuNSTC/d006sS+UNDc/vtuUBu5?=
 =?us-ascii?Q?tSOZraLPZh+nswp+1xaN/0QVA16XA5eh9y4fRDmyFLr1PphzctzTYgH1v57W?=
 =?us-ascii?Q?movy6QAPwgndiG7vjaU99nl6w42East0iG0p3Gehd7FcLpCadMiLT00YSO4f?=
 =?us-ascii?Q?BtgtSNsdeu8+IMorZEZ783QSDBfRmQtjrjrpN+Ah0ogCPunxPcmfZa/zSHSl?=
 =?us-ascii?Q?lCPoXBi4WmFponMdlgZbRL1sZBLTw8CyyHh3Oy5wPOFnQuPuUKhzW+Fg/DSQ?=
 =?us-ascii?Q?TEDEODscEAMOokNBRI81LNoz1noqNpD907I5LN8AQtLdPHojRBR0V2VAdP7j?=
 =?us-ascii?Q?Ihe/6t6ry9QylmcMwUFTH42iyC5sLj06KsJ+nl3ZY0w7E52gWYrFQpK3v90Q?=
 =?us-ascii?Q?i6ezWeFUcZJJsHNkHrEez3yIIIAuzRD1GCnH62ZwoKKxuCr1GooewBfn8pNx?=
 =?us-ascii?Q?yM3dpNnAuJXm/mwk167ZjqytYOveVP3FHNMUZKf9/r1USLlShU/UIlguvHfx?=
 =?us-ascii?Q?2uTLnRPYVXJiUnG5ttmLurRI7F8ybRndmvW+rOJXfGkb8vPJV3IwBBpTfjY5?=
 =?us-ascii?Q?+zxOGzw4L4ZzIGYQiabYQshGVmhGg7yxUhv/ScLLUgEXp2z4fUyO+qtY6Mjb?=
 =?us-ascii?Q?8SSfNaGUI7797m/PfkCv+6PSBep+hRjmsIwPE1Rs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227ea21f-e27b-4b4e-7d9c-08db5e0615ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 16:27:23.1568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2KmYNpAmz2X2qN3St5G09Uq3A4xYRwpRPeDFiqaVFXI6iLl/Uyp4fXK5iqcyOKFRwNrP5RW/4oy09SGhfkH5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9446

Test mail.
