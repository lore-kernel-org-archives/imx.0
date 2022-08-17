Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397874404
	for <imx@lists.linux.dev>; Wed, 17 Aug 2022 14:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIMwDDRJUik1CrV58TpHBq+5oFJ825It5Bj2k4wPlmRvifwsNDbgr9X+tIUlfAj3nZEpF92AeCl2koRaTyXn2jJ+7z8WmjHMpwQTb7UvijqvnXsLoxcZ0i7osTvlTOUKlHPI9QJVx1pLt2jum8HWENRlKWFULLJeG/KcnYo+cUrSylhFGa9D26R1C/J3n824VvAWjoHjUhBcGDcJd9e6bOYpOym+YOH8BNZcULbt6Cjuqb4qXVyi6ZrdjAuvCu57RPMbiZAHmVSX/vLXbnPoetHGXNRuSqW3gi18JG5y04PaK5GFaJUav+rcrwGvWZ0dZk5lfKZ0cnODwOWrAY5tEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou0TJXeqYE9/leHofCXXp9xYowsJyExbncr+LGuwvC0=;
 b=cOt3ossRwzZ+QXv8D4k5ggHqhuI2fh4Q+L59gqSzcpktRD9MRcRIF175Ix0LSijzvRx1GhzFpL/8py9SUk0ioKK5+7gxZ7LXK4DoaG0C84NHsCuRTyESd+tfCPGejF1HnBkxfCyb1BRV76mDcgm36L2pqnGvueZnjDSHX/D5ZLOGketRDtRhAKssNc1SzBYp2ild0t6Jhybxo3bEmRbH0gSGKNsS1olabvBjybB/S7jU6JfA9JmjpoQOQFSqBMu+D51KTmXLqyof/37x3ZpKw1+MhU5oqM4GSKMSOdCf04Qbl50cPn0ibJWVE8hbuxg/s3jAOZJGx6Www9DHC1YNSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou0TJXeqYE9/leHofCXXp9xYowsJyExbncr+LGuwvC0=;
 b=H4qxboD4UQZEgjzCfXyFkdlzAuX2IPeNI9KydKcrIURP2RFeYN1cV9bhfvMgIR8Mlq9NHGwJHvNnyGQkJSq9Mr6fkNSEkQjGhG+hMvFM8kZdZWxr2v6sI7wbH+YyOaBNaepI9nRW4FbD7nzsldR5SLfI9kLOPThAaZ1jBG3eH4M=
Received: from DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6)
 by AM6PR04MB6038.eurprd04.prod.outlook.com (2603:10a6:20b:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 14:01:00 +0000
Received: from DB9PR04MB8284.eurprd04.prod.outlook.com
 ([fe80::8550:f446:5244:9353]) by DB9PR04MB8284.eurprd04.prod.outlook.com
 ([fe80::8550:f446:5244:9353%6]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 14:01:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Richard Leitner <richard.leitner@linux.dev>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [EXT] I2C_IMX support for i.MX8MP
Thread-Topic: [EXT] I2C_IMX support for i.MX8MP
Thread-Index: AQHYsiWWIkRZU8Ek5kC1az54IGRcq62zHsLg
Date: Wed, 17 Aug 2022 14:01:00 +0000
Message-ID:
 <DB9PR04MB828420CFED71AE624B11B8B2896A9@DB9PR04MB8284.eurprd04.prod.outlook.com>
References: <YvzFPR5rwVSLzNPK@skidata.com>
In-Reply-To: <YvzFPR5rwVSLzNPK@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f4b9fb7-a9f0-410f-cdf0-08da8058ea8d
x-ms-traffictypediagnostic: AM6PR04MB6038:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mCysHm0fWiW77XRA9M7oxoErPg0UCJsH+a9vU0Zkf6REf3YDF++1HWRZVDFRqgCYqckOSp18Hn8KSymM2KIOxnjpqMmSC1K8Qg3EbjRnQP7vfvuoGqhG2ycxjSsUmPT5ZOz5httX2oTle+dnb9N+1AHEOFxz2Ynh0LpY6momLVCgpjTYAUd54hbOtQ9GRSq9uXcJ3D460JAqjjfJ7+SsYIekmb38F8OZ8kEcv/tklakLDBLb8KcnLFBRrCKtu48dBa22yTzptT0Okr+T8m+RPNDu1eYa93+uXbUcwx+PBkthj75HQk4tH6yDgwjCqonM3n2W+wGFjUQ1xIBHfs2dsBHfSo3q10hpgj5jO0yPuV1n3mivUdkSBOCT2Kv2iVkZLe2f436VS4AJOa8iQkpP9nt9gPPfRpy2IrjQUIXLI+8tU4auixs22oCl8Ck5DrB+mUAjEFpRpLVjzIUe5OG6VpvcgMEKQHt938vfRr3cJ0aiGbFQq+0tevQsHNziikUTzieNzrrLb8U4ovqOgrAJceyCGKcsRxm0yCN21rFBX2c0o+hift28Og7GHnMfcTMZSOntzJltlM1ivZbRf/xk/lKLEyIvaOlH8iOgBc25TcwgPWyVPXbO890KdXwLpebCksagy3J7qlcQANjLdawOUEU+fHrpfPO3lhGvzvcnFTOCarRrC1yu0mD6a729053sovaK4Rz+zBTrlI8BK9mtZ8ZtAErbpnAIr8PNEGMKLVH0zq2bmPDienfHxBMWd+E7KOgTJQfHSucBUYl8fBuf58F9vIRA6oS1nw1WNSNhtuQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8284.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(71200400001)(55236004)(9686003)(478600001)(316002)(41300700001)(110136005)(76116006)(66476007)(66556008)(64756008)(66946007)(38100700002)(5660300002)(8676002)(8936002)(55016003)(44832011)(66446008)(52536014)(2906002)(86362001)(33656002)(53546011)(38070700005)(122000001)(26005)(186003)(7696005)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L3nREPmTDGSR7z9gd/5pnMLQ+V/2RHInYInzR+LLHnB5XfcGA2MGatkxcEL5?=
 =?us-ascii?Q?R9PN2D10r8M8JgUuL2YuoCins1r1/N0KZBGqxPfBosugg8goLO9NvOe2H0l5?=
 =?us-ascii?Q?TsCfWFnrxD2A3PTHK24MPO6cT+5+0KnwLDgud0M2cxfLDS4gB3LVLlZrYyr5?=
 =?us-ascii?Q?Jazs1T8EMVJKcn2wXksmNB7G2EB4mx+CCrJSIASwcBwpFD59iqvURNG7H1wt?=
 =?us-ascii?Q?5K3r/bJ3JiQzDN/sUsB1JWGx666hvfXwaDY0c9My5IXb6+M1iPgicIUkMKLj?=
 =?us-ascii?Q?dnsmfNBiza7RSttWCVriGSkpw2VCtM1VyK34kZqnh1WUkyeNTa5JRgN1FOkg?=
 =?us-ascii?Q?PUsK/v1bQIBAZA+eCp2WcYbjW0rAVzoLKzysiQuZuipeafQekrhHkuw2+wIz?=
 =?us-ascii?Q?O6ZPXpdR536aY2EmHI5/CM4IDuXFgQ+vfV34UTM5GNnObRkAR4nsW3mWUrgh?=
 =?us-ascii?Q?gZCrDCsPB56rjuMGLna23rYMEx/KE4AenC1WvaECPV2RXZOTTDXr6TvjMD58?=
 =?us-ascii?Q?QpJezzRnx8Avi7COv8ffbPf5KqF28bmENBt03lHVukqKLPSFPk899laPRkxV?=
 =?us-ascii?Q?ua/50TDDuZfg+sFRU3LcMTMl0k42oHWDSQWYEhuFD6NCSpW5Zsds2lqdOlHS?=
 =?us-ascii?Q?nrELVsTyY1i0Lb57SUqur0y85KCot6hYWzBrDfUuQn9f/eMMapFPo/jbwKgI?=
 =?us-ascii?Q?KuMWd8ND6AEiScYfsTlWJCymzKDFagI2NcibA/QFfUP4xwbLPZz5taSFb0kR?=
 =?us-ascii?Q?ehluZrZ13xskJ6nyY7jUj1evVCA+TWTudJ77B1NRu4aM7FeRFV/hP5PaZJBE?=
 =?us-ascii?Q?RXoCgfRKMjtzVU6/Z1qK4RwAHv+TXpaqMfI73B0b4Aqwsi2ckohkguSvehZI?=
 =?us-ascii?Q?ici8KIcfnaSHM/5Zm0n3Bbe6r3LXBPgbEEWuawUoQWM1sZtagVq3zD4JOqE/?=
 =?us-ascii?Q?y9jx5MC3rjAX9F2IXokwI+o67TqtzY0/JxIakD/N8wiWrdO/LTpLaSi6rsbe?=
 =?us-ascii?Q?dX4LWRThHKwp9bEYxXLAR6lTlkYjp2PPEMRExyTkhaWhWglZT3aA05NEUx7Z?=
 =?us-ascii?Q?N8+/6dyHe75bpQ8QvKSGFfXvXZz/zJPT+Pf7MXX5MFJRhqkk42Lm2vpiDWi8?=
 =?us-ascii?Q?KWqM3Jv41meeM+adOiP2e5wiUize7TN7BVvrBV/NyDB476AVzr8ZLLduOqII?=
 =?us-ascii?Q?hGT7VzTZsLwRHarAcfOAtFxpjFZdt9qJ4HTg6gWrl/SQ6k7D2PYT6iW87jqZ?=
 =?us-ascii?Q?5SAdU3TuXZ27bNOMurG43StAZTMUoqkR2xf33kM0rCgWNkpxmdAZk3qp8mKj?=
 =?us-ascii?Q?ErBcWTD8gSgKvsZJnnJWBRBMFhOYS5Hhk+XNMfWBsGokBP/145NMbhf0fmRg?=
 =?us-ascii?Q?WGQQ22ltDqHGdyevhig5NnrOpwpmaIxHhosDM9VZiD+0yp1B0Bfam7AbWA66?=
 =?us-ascii?Q?exidLs4z/0jST+e0DV8qTn9iGiaXnGdYwc0OV5PEl8Js7biF3zYrf4cLWucu?=
 =?us-ascii?Q?RU5IC9qyw28IYjRQXd0tDunDE0dfWARkJjpMDOo5o7Hhd4oB8TQwfPWGwgDC?=
 =?us-ascii?Q?PEX8UIbhhWdq3JHIfAINcO8cKCmVRovsl10HAr2L?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4b9fb7-a9f0-410f-cdf0-08da8058ea8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 14:01:00.6673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMwL/+MZiuIEYjnos+7yn9FL7gT+9RnwkTXvi2rxix7aJUvN0cxAJgENEEmP5YYtxdVjjwXcchtX9q2RPkGpag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6038

Hello Richard,

This is not an ML for imx product support. It is for i.MX related Linux dev=
elopment for upstreaming.

Regards
Shenwei

> -----Original Message-----
> From: Richard Leitner <richard.leitner@linux.dev>
> Sent: Wednesday, August 17, 2022 5:39 AM
> To: imx@lists.linux.dev
> Subject: [EXT] I2C_IMX support for i.MX8MP
>=20
> Caution: EXT Email
>=20
> Hi list,
>=20
> Just found out about this imx ML and I'm not sure if it is also intended =
for
> questions, but I'll give it a try. Please correct me if I'm wrong.
>=20
> We are currently in the process of creating a BSP for a custom i.MX8MP ba=
sed
> board which features 3 I2C busses. Unfortunately I'm currently unable to =
get
> them to live with the i2c-imx or i2c-imxlpi2c drivers.
> Using i2c-gpio (with adapted SW_MUX_CTL and unchanged SW_PAD_CTL)
> works fine.
>=20
> I'm aware of ERR007805 and tried therefore to configure the busses to 200=
kHz,
> but I don't get any signals/edges on the pins.
>=20
> So the basic question for me is (as I was unable to find any trustworthy =
answers
> on the net) if the i2c-imx driver supports the i.MX8MP at all?
>=20
> Any feedback is warmly welcome!
>=20
> regards;rl
>=20
> P.S. All tests were done with mainline linux 5.19.y.
>=20
> P.P.S I've also sent this mail to linux-imx@nxp.com before.

