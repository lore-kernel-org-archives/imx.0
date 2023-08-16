Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69D1AA95
	for <imx@lists.linux.dev>; Wed, 16 Aug 2023 22:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asHC5ftec7tKIDTbV6O/nRiydqzwE0ZVbsl3nhFpzip32sIu4uJO0JApuwte8Hq5VaDwMI2yUJf7lq+fGR9tma+w1REGzXkDyQ+KUQdEmMSZulhyVyyQ+NNXpvwYCEc5mD6ooUcb3iErUgfpdS9U3oruCt1q8sBtMC8COha1nMYlDjd2ugynC5BIv1gEw/VxSmOFh8KL4T3cOCEcqRKFUED40c9wlCz/MyTykIEtAEKTamCXprqpXMrSWmGWdBd9/QHryx7QxlrIql7SKxERRIWGE8F0N5/Uj3L/q3vJ5zkLGnMooE2qZZPuPd24aJixlFMBEyvCwbzvFZB06Fc7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz0IpLsC9kCcALYYHqn0MphTNnYq1FFyDg6mq8i2ECI=;
 b=ka0YBb/e3RIJI91EwzSGKz4kFf+B4r7hdWapFu2W9wEKRn68+rV01XfMcfaCGq7GwjU8jpFMsNFeorJ9EdjjE9c+5pHavy4TYNBndoVgG0wn7RSUnTHSlWVFCZrAk9EyjL3yKXQXMsSIsUlgT0NUoKbRH/Q39FyFliFWUhH8Rcc7BcapFg4YZVcq0nfulc1rG7G6oQsQdXobdOJaEZF0KQAm4GAcDZiq7kF8PDky4tGN72k5psp+StQD02j2QkOEHkK4wqu+9ndPp9eunU4tsfelHGqcScmqX7+RXeBzUgeEnw8DkhuXjitrPsXnGJdir+gstknmXGGdz0C0r+wAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz0IpLsC9kCcALYYHqn0MphTNnYq1FFyDg6mq8i2ECI=;
 b=pkwdpj2EcQwBW9wlxlhLD9uMQR3A5+82ieWovbl50vSgysQ0E6KOOMNC4wT2QfFaTHBHWiBdsnhO/7rZqfG9coQ+hqHWOaW2Dd1Y3f6humXyBVUlHOWeCjkpLF+TdFJtSBlaT/3DquTXzvA5OA/CNqPptoywghOPu+ZR6LMrdgY=
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 22:08:52 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::214e:3ed0:e3bd:ac92]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::214e:3ed0:e3bd:ac92%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 22:08:52 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Qi Wang <harrynicomama@gmail.com>
CC: "extensiontest66@gmail.com" <extensiontest66@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [EXT] Quick Reply Extension Testing
Thread-Topic: [EXT] Quick Reply Extension Testing
Thread-Index:
 AQHZzM4EqKAqpPTkSkya8esTOxsLz6/mCYKAgAAFDgCAAAvfAIABeX8AgAABqYCABeLXAIAAClVg
Date: Wed, 16 Aug 2023 22:08:52 +0000
Message-ID:
 <AS8PR04MB9176F282E953D6802A26DD238915A@AS8PR04MB9176.eurprd04.prod.outlook.com>
References:
 <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
 <99ec35d1-16da-4deb-e5d2-c8458dc38ca0@gmail.com>
In-Reply-To: <99ec35d1-16da-4deb-e5d2-c8458dc38ca0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|DBBPR04MB7899:EE_
x-ms-office365-filtering-correlation-id: c108425c-fbf2-42b3-9aca-08db9ea56016
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zh/anwxfkecYVJDZUgR8igsczatXeZMYHhVNzBpJnu0NuXejt1+Tct3UIONU59yGrPg6IueRWBRyeZM6mLEzDGAEPY2qGvUSMpwfKNNj7NIhz58TenQ2bDwX6JLThT7ptm5GlEW1fFuewyRwv4ORTITqTfuSQ8MB7dN88i6Xb3YaEuDZBLmcOOwIySeIRIc7YL0NFUFZ2HvX8s2OYvWD0/leviXrPwiWW26+A34AQrPb16LTlydi11Kr/oIO/lYICnxj9X5tjuZP3N4EHi2Cr1XIasp1ZHfw8MtZ0tHo9gK17M9dBGu99ry0SLNHx2eIb/zbAbgdaqj+uM6ac8aLGRPWOud0I2Njs87u1D07QCaUSMZbaEKiEKeAMV5zcWhxotRwJQ3i9Witim6wGLi+16a1sNtJi9R4DugoQRwrPrOQ5AjrEELCNLi/a1aBwYlyTR22WF2b1oXNVl4URNYr6m7I65rMTWZYqEQhh0eaS99Pm4fxuQrHG7djBdKZrpQxRoYmGB3u9El6WHuKzMZ7rsC9RMhekx7n29xMb0CZ0m9vRFYN8sazI2Ok7dm25GKz7kqqflgWeUMA0mpabyj8VEeEEgXenpKknJxvf5LcvGc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(122000001)(71200400001)(478600001)(86362001)(41300700001)(52536014)(4326008)(8676002)(8936002)(38070700005)(38100700002)(76116006)(5660300002)(64756008)(54906003)(66446008)(66556008)(66476007)(66946007)(6916009)(316002)(55016003)(44832011)(2906002)(33656002)(83380400001)(66574015)(9686003)(6506007)(7696005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZJ59Xlpq/GO13SCsrP9qB8MFrgoJ88rphdIeag5y+nCpP2LQO0c+lCOUzXFn?=
 =?us-ascii?Q?KDA7X8J+qso+zlmYFaU95wtQWBJseVCBftOXxPPMSPF1GCw1+DFEZG08P12X?=
 =?us-ascii?Q?CY8hgWKwgty9zzTXZiwcFpY6IRAEDLaZFqhDu/iZDDzk9wobnnyONE4vHodF?=
 =?us-ascii?Q?Z0aZ2hXoq4qLgVvBGILGK8wzF9nLIDMZW693OtqUmYBoCuNFtoBuF5JdfV3l?=
 =?us-ascii?Q?REmfxdjHVUhllF5FaROxr/JR23+AuUDK7c68189r5uFb3C0n6r0GgHo1v4hT?=
 =?us-ascii?Q?ZAS8JaFpKlttV/d/vgF2Gl0/lAJNC/bG0N91FAoYqWFwo6b6RAVcB+NszPxL?=
 =?us-ascii?Q?fZk/t0FemoD0ip+zKFFqcPKeOCviJytzDeySGWPCnK8TKnTQjSe1/hSUdyKU?=
 =?us-ascii?Q?ZQkzoxur09bayFA3VJQ5vtQoaB9oGZzbjDf5BDfIcr5Glt9pf/9kp1PYeAO+?=
 =?us-ascii?Q?WKeAgRrcz0zVmkgGk5uzdgBIo5nav9EECa9WL9muf8mZbwEbXdnmdKkMKQjG?=
 =?us-ascii?Q?/F+WX5w+mDb01oQo396rXIslZX+xmMfT8jWA92oJ5wY/6nVFUO4x6DI5qiVe?=
 =?us-ascii?Q?bG8w3tNnorPiMHg+tHSJqet7KMO0Ug5yfzFHSPD1tDMrIjdDmIXKas4YP7At?=
 =?us-ascii?Q?u98IA9NA4kPTBjtShvOOFuUrw3B7MlFwl+9dvkue+fVok9v5rksVPW5lus80?=
 =?us-ascii?Q?cMU5ANBpDheNTs22z0BRyKyh0iQQdkZsLPSI+E8WUop1yJERu3JZip0yHIws?=
 =?us-ascii?Q?au7rAdOGg1uEEIuOG2amDOuJ3/kpOyW0f682CSYLb28TPF7qnJW867EHpxcB?=
 =?us-ascii?Q?0LHGrJyc9HpMVi9pB5xJMFsDFBih//+yHQCEJ7+e2Jor5Bg/4xQCtSANc2Zf?=
 =?us-ascii?Q?eNEvOvmQohyL9JL605lk14tvTRtEFj1V2DjDnw5yyOe8xEGbMURdWCIgwcpK?=
 =?us-ascii?Q?XSYdFBM5FHveQapP8dCqHq6iuyBoN9/XOm83NQVuLJY2Ih4VM5YxJ8OdrLEd?=
 =?us-ascii?Q?+HL89KXoxBiDgLjSo5fNYTs7CbNkTZXOzdruSLvRqa3pZYCoM3+mpfvTbxUg?=
 =?us-ascii?Q?nxVAfU56/IJRIuS4+XHeVxnIXYBHSeOhe+1yJ0rYNwrL6RF56FN19GJt94e3?=
 =?us-ascii?Q?nR8rvuu7osZJnItfUmma5Fi70EuElvUww3iRjl33iIlR595V7973Khxyd2gf?=
 =?us-ascii?Q?HaGnBRd14IKOGHs7p4mS2jXKUXlMXauyR4lHyyf5Nr6LRW9tJMxvwvvQqCYF?=
 =?us-ascii?Q?PVKck9ezT3+cHv0oxnAGY80ggSyODUQYcQR0ORgvz3rZp0K5e/l8914X5HAm?=
 =?us-ascii?Q?/cLerOWGQuJTySIZ7A3V8lp8e8wIRn4xmI2PVSQWHxS7TYYM1Vc7tIIQdPBE?=
 =?us-ascii?Q?9izY5Kdu+vnX8zj7KZHitocArfrhxDPUKKyqvbzUiKxwBVfk+Wig+TteyOr9?=
 =?us-ascii?Q?kZZpnFxrz8jOHvzABgMCakYD/dBiLviiFNltnWrsdJEC8pP7uA9kXhEIqpnm?=
 =?us-ascii?Q?mVy19YoSQDwt5ZFZUYDUU/CBE07c8Zi6ielLzVmExOksKnvb3tgoFUJopA?=
 =?us-ascii?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c108425c-fbf2-42b3-9aca-08db9ea56016
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 22:08:52.1797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o94Fz35F8BLWC0UcRNl1Fph0VXjMEPxSnwMcEqWE5/laQFlfGCV/aj+/l4DYV8db89kHIrjW2jkuYHYMZsmOVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899



> -----Original Message-----
> From: Qi Wang <harrynicomama@gmail.com>
> Sent: Wednesday, August 16, 2023 4:32 PM
> To: harrynicomama@gmail.com
> Cc: extensiontest66@gmail.com; imx@lists.linux.dev
> Subject: [EXT] Quick Reply Extension Testing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> > > > > > > Browser extension test thread for quick email replies.
> > >
> > >
> > > > > > > Please Ignore.
>
> Testing link

Test what?

>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Replied with love by Quick Reply Extension
> <https://github.c/
> om%2FHarryWangATX%2Fquick-reply-
> extension&data=3D05%7C01%7Cshenwei.wang%40nxp.com%7Ce4d198ccce6b4d2
> 3ea5008db9ea02bfd%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 38278182990471272%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sd
> ata=3D9nbaxnutqlH2r9Sy3sZddz8di%2FuCbA3VHjEzP0kETr0%3D&reserved=3D0> :)

