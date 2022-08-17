Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333DD4404
	for <imx@lists.linux.dev>; Wed, 17 Aug 2022 14:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFkxEQCy7dVlfeg9Ln5sMm2oOQfsnENO090YaCv7wDLR/F0JZAr2KFOQd0oW+DQUtl7QyW0IAIypzAzMYohieXetX5Co7uEBLWYYXQdklvyJZgrN5x5C88vAhIB5+NfBcNB+YK5PnoxBYnbhbbnS5xdMRzQnmrEMPdDPSWQsHwG/+nDc0xTLcjsqJkYCPGXrlzw1/+SCqWYAAML5RtGzPPZXlErgtaE3QqzdLvqRRm1qH0AauQgWWU4XTtYRjH7TcLgGCIxcYNAR3BEoFua4GuiisGEGMZ+p1cCOapRjRqRPD+NOCc3wySedBsPo1qeE2pBgdS8PLPnJq39FFCW39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gojZEH+ga00QAtnTqeSk8/NOr6vWAfryNqJDKCudMuY=;
 b=Vwyp+NjtjFVJa/8ew2jabPVHmcKsoO8UUfmONr8AgJ6X9hzXcIjptXruFMhEM8JjcYJYOhpkeW+tSDnv8B2laFjLk59fYWV6uiigmjIKu3ww2/J2D4i4tCSarRESVGwnB1Q2siLdKrKUtRT2SIcQOl5tr9DCyIXKVOVS8xhyxJOZ+AXH2tPvMu7uaT52mq+appvXiwG+gjWGQmFRWUSptbLTN0cVE9rJvycLSUXdict+4NW6y2lVJcqtiVddMBzFwD3yt9u8XQw7l69KKtbh2ZMp7uOcHiuU97WSV0k24Wd87EOBTci/iWVd/m/4FA6/79cbfUy53awpGbIBc9DPng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gojZEH+ga00QAtnTqeSk8/NOr6vWAfryNqJDKCudMuY=;
 b=eaYp1ZWQPexs3vsMKEetkQ3tq15+22q7PfwB8GDem+xVnpd6YwXgBw6eASxMC7pkuua6cxVV+7eF3fPRZXL0AxngzXROPdORrgCJ+65GJrXcGyxjFCxifj9kPSl3QRREOB9HcCRzgvcSqhK7NYjnROWvBDBTPCog6xI2LF5wTNE=
Received: from DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6)
 by VE1PR04MB6592.eurprd04.prod.outlook.com (2603:10a6:803:124::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 14:14:53 +0000
Received: from DB9PR04MB8284.eurprd04.prod.outlook.com
 ([fe80::8550:f446:5244:9353]) by DB9PR04MB8284.eurprd04.prod.outlook.com
 ([fe80::8550:f446:5244:9353%6]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 14:14:53 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Richard Leitner <richard.leitner@linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [EXT] I2C_IMX support for i.MX8MP
Thread-Topic: [EXT] I2C_IMX support for i.MX8MP
Thread-Index: AQHYsiWWIkRZU8Ek5kC1az54IGRcq62zHsLggAACUACAAAEMMA==
Date: Wed, 17 Aug 2022 14:14:53 +0000
Message-ID:
 <DB9PR04MB82843B074F7F2ADB0D455867896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
 <Yvz2IA9GB2NJmc+D@skidata.com>
In-Reply-To: <Yvz2IA9GB2NJmc+D@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe18c24d-cec2-4ea9-1ce1-08da805adaef
x-ms-traffictypediagnostic: VE1PR04MB6592:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cWVbtkMtWC+EZPl8cH6ssOd4cAssVvpmQD2ng4TDrBQmoEXGUPCTMJXKvg81mn41iu6+60bSu7hEMR4/KRUuknxqKML7LLomvFXSvkFM+I6ziEukb25BgJX2tPW5aFQPjdLLSOg3r115zaF44yRxad8t9VLxa3I9plKmIJ3+nALGq9gltdfGl8888hsjui2aY5w4Folfd4KYa+XNzEgpGwdc+65E+8uOhDxVFejqUSdo7laCS4k41uyM2z/8TaVZjM1iYNEDxneDR2JrA+pQHYFOFEX51oLZTQJnRw0tKohH8C2aYEvzpybK7JbqwapVNXZCh68zgPvH0pI8PyJByGjSFIDQ4Tm4UF2rwlIHOtmDUSByh+9e3tztE2Vx0XWxIwR8opQDJuS7CHNjtOjSp+CER7aaJ7R5tt/7hBLa65Jqp3H5pmI2MGim1PEgPGvnLBEWbCj1a+imPnOciWQdoseytMFlLDOOsHJO+s6oK7wP2g8bsG+GwVXqvtw6cJsYRuGzWiw1G7phytLkF+wLSPopsMX7XNsIfuT0tGLcmHe3BuSJ7ScXt1Cik6jg+Xvbd/VPZh/32zZE3zbWlPiHZPAXkioSVa1C/7g4yu5VC0t+vnfu7TBLXO4EgVflAdM3BVJ9COlojgvPgPm6mwMq0gMrs/4SiCUBS9AJ2VuGsnxqc/ouTfQZdUZHEOV5c0j2EWY3vtrmbEByTf6RdzyNoXDY2CzI7uSjgthsFJsmsKYpdAd+l/bPMWLyHVuSBO8oCfKUSYYj240COU7jNoyLIzkTSol3vpeP1jm+kNplG4CtvUnYor5rOqY3GWnthcri
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8284.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(86362001)(316002)(38100700002)(66556008)(66946007)(8676002)(122000001)(66476007)(4326008)(66446008)(64756008)(6506007)(55236004)(5660300002)(55016003)(38070700005)(52536014)(44832011)(478600001)(53546011)(76116006)(83380400001)(7696005)(41300700001)(6916009)(186003)(8936002)(33656002)(71200400001)(9686003)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GAPzFMJscYAirDhehfQjW8ActaG/0/VU0gF0jiiglwHtGOX8ggZahDHkk1Kj?=
 =?us-ascii?Q?Lg5fX+f0fNS6e7/d9adj+1LXRAS/V2LE3eILCPfuuOLsGYY5KAWgWfYpdE7d?=
 =?us-ascii?Q?4oXs2rqQEqZz9NBCm0BWKecHvuPwYAhXyxeeH7mypg6tBzmod1vQ5g+vmKVh?=
 =?us-ascii?Q?2pEik+FovNPVXBbSjI1hHEIRyx3xdiSwxdSauFLw1WvAXfRbZiDHJBENxSp1?=
 =?us-ascii?Q?FDs718a380xu0vef5kpGfc05VxbLPts4lqDt1p3ivaMhu+HWf+U4NTsaBC7K?=
 =?us-ascii?Q?3mcb1cVzM+mtGVJLOg17rOD6dvpWkwru5AKwakRE9xpMvwNM8GpRVnp4KwN+?=
 =?us-ascii?Q?m1ebZ3juz8KHFFZHelJeVUX8QBNvZwIjPsMkltXrNB97InsfJAUb3u67DYxJ?=
 =?us-ascii?Q?ZNmPfBDtbfnES4zoykr12gwsnFz4k/XxYOsmCCrcRyFjXrD7J+OzDhfV6+Qi?=
 =?us-ascii?Q?ScR3VUSw2MRuUA8JJvWM/3UVFky4+Q6hfjSwtAz2Zk96DvTmBIsi+gqV6U/Z?=
 =?us-ascii?Q?umd2lebHplwAMqvKRTuzn+6ouE7msb+HtRfQkjscIPsWrHs0wXbJwfyCcYzD?=
 =?us-ascii?Q?hHr+TnZ6/JD3Odr34OEwQ9S7/14DZHGNMugjzo0t2pzl13RDasRfciktJ/0v?=
 =?us-ascii?Q?jv9SAfiW5T7Mh2JQElibKQgE4HLyqrg30gGMLGJpcEfOOU8Fm8K6+/DcxIxJ?=
 =?us-ascii?Q?joMeDPXawymKJsLFNMWQDZ8x8EJLzo5Xgbwx8muC5yJ+tK/k7SxTYz3K5Q01?=
 =?us-ascii?Q?tTU0Sv7PZSx6nZ8pTqPaK06kRpYbf0ttHyXNIYku8McWhpRDmYFtm3ZD9dRr?=
 =?us-ascii?Q?dPrc1G+kksY0u6mjHvWlhi0WcaiFJtcIuQyCtbp254SFnzgksS89yOz5fy/Q?=
 =?us-ascii?Q?vaCY/vGNLeiRFg4b1rhdP0mcA3PNEdbKfGXr5WuYqIW7w27Ga2BOl1ZggMhg?=
 =?us-ascii?Q?dnj5WOpvOCd2Judh6ZHxIxIZSoEd7knExbIH0ZFqEUdbc0EskP7LhOq66KEI?=
 =?us-ascii?Q?gRefRJyxOreEqgTlMYesNDipTV4nzFjGXTfBofw3tmlAs3sK2fHBeKUJwfjV?=
 =?us-ascii?Q?Dbd9flxtFgxri72DZhEfIQsrJf5i+mvDNAzZx/UoqAS7i2ZlDsHYpkY/q5jY?=
 =?us-ascii?Q?Kk0XOCf6R+/mSql/yfIVasY+QUpfOhbjLZ9par4VW614RlCoeURyzjyBBEqC?=
 =?us-ascii?Q?Jyxnu9/ISGAOm+eFnRQ6Weh4JxbFtWTD1m1MkmAUH2xxSGIterV8fFfX8O4H?=
 =?us-ascii?Q?Hkr3VTM58cLFkMhb/u4aQUSuK1GFx7P/pwvxVsLD+IlFWbDEBACxUhgwcuko?=
 =?us-ascii?Q?TgNVyh7+15aqRn65CB8B8YnS6Qg/V4h7eizrn5jKPW21ak1xrL9Z7qUK8tZv?=
 =?us-ascii?Q?NIW6nkC6UmEv+BGYwfAETGs5rortFEaSG/2EkaVOx+0RzX0mMAFvX5umL1u8?=
 =?us-ascii?Q?EcynqM+tE78Y3HJ9L182GIByTAZ0u2KAdkAOG9tUqaXi02sAuXU+0rGM0xWf?=
 =?us-ascii?Q?fdBmmVDpbH7RC0KNFTZ+ZIBxIBrlX35Wy2MXhSwR+HQakc2jv5FrK2KAVa5l?=
 =?us-ascii?Q?AqoVNyfwWEIHEhdsrY6JgvJELJ7obdBrX1GV7PhR?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8284.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe18c24d-cec2-4ea9-1ce1-08da805adaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 14:14:53.4237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UU7u/iCX0ewc69t94U9t8DsSifbrQmaO0Kra9FzA7nC/AvQxlb4Vb6UXDTFrZBONmIm4pENquz/rjaMkNIr6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6592



> -----Original Message-----
> From: Richard Leitner <richard.leitner@linux.dev>
> Sent: Wednesday, August 17, 2022 9:07 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: imx@lists.linux.dev
> Subject: Re: [EXT] I2C_IMX support for i.MX8MP
>=20
> Caution: EXT Email
>=20
> On Wed, Aug 17, 2022 at 02:01:00PM +0000, Shenwei Wang wrote:
> > Hello Richard,
> >
> > This is not an ML for imx product support. It is for i.MX related Linux
> development for upstreaming.
>=20
> Thanks for the information and sorry for the obviously inappropriate supp=
ort
> request.
>=20
> May I then ask the question differently?
>=20
> Is i2c-imx supposed to support i.MX8MP on current mainline?
>=20
> If yes: Great! I'll take a deeper look into my setup, I guess I've done s=
omething
> wrong then...
>=20
> If not: Are you aware of anybody working on it already?

The support for imx8mp-evk board has already pushed to mainline. That inclu=
des the usage of i2c-imx.
For example, a GPIO expander is connected to I2C3 on evk board.

Regards,
Shenwei

>=20
> regards;rl
>=20
> >
> > Regards
> > Shenwei
> >
