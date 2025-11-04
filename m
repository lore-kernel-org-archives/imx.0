Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020086.outbound.protection.outlook.com [52.101.84.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0288634F
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252570; cv=fail; b=Si0EuenbuYEyDqEXW2DJH2ejS7NAddPACRebTT0MHXsBN1ZNkJFqaEnAGMWOQPG2RrPteNSEo55uziwdGhd7zvZvpahAev28YsB9vDkhkWMav5UiM9s7FSNnl2D5bYV3x9N4FYpqkvCBoipaJcbs/PRRdcuTMm5OTPO8mqi3Xgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252570; c=relaxed/simple;
	bh=yLB4Fjh16dBoigdKX2odUP5bsqPiII+h0S83H0OSvD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gy+DAw9zrCBeI2VBhBBDFbKwqcAh1aHLjMbMmnWRoY/pY1HHUGqamLglN+LxY1HzFDm5OfYp0FMTW4AeG5zsO3oCfdp4Zd7tR3o/2EsGQ6bE4eXP15PmvDvDEU+qPr0s1Dru2+rtxgO4qmKFfn5fNzxBc16SPKZsnCKz7qUVZ54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=G0XGdpW+; arc=fail smtp.client-ip=52.101.84.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="G0XGdpW+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXCePKbhQZrD+VT60azVA14/aPbnKSx5ew0V68uS112RrI7pvIQDtityT5VGkZYrwL+T8cbEzFS9SPQMjKtAi6f+sdeFmoKmhDdeFKHqXg35QudijSyZAgCy0xtmSCVR0uVNP7fKUHdtQj1Mn7eXoDIZYI8JK3k5rwPK23V6VjWIGsapMKqpFdMDM/XfFi+iOosxIkrePxUJ8G9BARBUPyinJ0dpADHasWeUuXZBaYSDwNw4KzntnWXzqvV5WcA9FoVN0GNuJduLmhSrBYd9jWz9kVR7phV84hViLtRAoi2VO0dgaENjjCBuzOtI0n+TM4vAoRiR8hmGhnrujikbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhf/NeZeiwiSQ6JttG03ZJD9elhnrvAYaUczWdgTqus=;
 b=foBhXbjTykJCv58yEoOFD1Dv2hdrge3jNlszfPnhANzwx2B4aUKOi9ej9POCqXvCBZZW6zuKaXNIOL120TSCGS03P2yt4/mvso5RMyxpnrWpmo7m+yrO8T6puPQZkQOm2TZHxtQeHg0v4AH0F1y4p22RNRAFiCY+QLaGP64VBhxErzj+DOhci8BNCDPwlFVX4sFNqwfuK7FA/pyhGgCSeQE7FaPYsuJNcD1Grif9PtbzBHHG/bqS+h04VGuGgjeOArEM0SevuyO1tYm9ryK+OMvrF6sojNiiwLgPyv3/JsxrdeD0I5RBfp3fzVokl0F9dUD4qvExK347PmEQhxfJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhf/NeZeiwiSQ6JttG03ZJD9elhnrvAYaUczWdgTqus=;
 b=G0XGdpW+iC/Rjuujw7T3W2SeymjNmIDLiwc7prWIH9WK0KOIMW4zlTmkb/m8yZrd1Ig6oEn5BfwlUpYQ/LbZuVF/zuyVZOBl9gy7uoy6nPjbmXmN0cIzaCvoMm826W2jDU7VNvfEwTPJAtpNGL0GKpUaPdUDw0q0exJfuJ3Mm8/AycHvoDIGt1G4hInfl5bj0v+pzOO7Vt3fVG2XNI0X+TNl23YtsYCHJ46HcpWRChWPC14ytfVMCLk8zsHHchlxCrUhD0VN9rXLwDiBfaARObpUfIzIAKCbJ/uUp5GrmZlq8yxledCYgeBVS/OKgBxpETgu3Ru8mreDJkQXtXtYGQ==
Received: from AS8P195MB2410.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:63b::15)
 by PAXP195MB1293.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 10:36:01 +0000
Received: from AS8P195MB2410.EURP195.PROD.OUTLOOK.COM
 ([fe80::6155:696d:3d01:e892]) by AS8P195MB2410.EURP195.PROD.OUTLOOK.COM
 ([fe80::6155:696d:3d01:e892%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 10:36:01 +0000
From: Janine Hagemann <J.Hagemann@phytec.de>
To: Jan Remmet <J.Remmet@phytec.de>, Teresa Remmet <T.Remmet@phytec.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: AW: [PATCH v3 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Thread-Topic: [PATCH v3 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Thread-Index: AQHcR+lWTVt3wYASd0C3+ciKzpLyjbTiXcwA
Date: Tue, 4 Nov 2025 10:36:00 +0000
Message-ID: <bac1cb2139a17bb583528ac56f9c16e1cbfffea4.camel@phytec.de>
References:
 <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To:
 <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P195MB2410:EE_|PAXP195MB1293:EE_
x-ms-office365-filtering-correlation-id: 74392096-5f47-437d-4789-08de1b8df2bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|4053099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fNr/xdhWpea1PVc883eCSsnzmZR6oAL0YWvyKulmRmlAHmYH0r6vWo8a5ebO?=
 =?us-ascii?Q?yD5YGQ5OyW4nrjOrH+v4498+kcQggrk2mXeA/LizG0gNzL2vCVlfL/9a9IlX?=
 =?us-ascii?Q?hTMzH0kkrYXROfT46SSUz/XX+NL33Esj3hfkC6ngOEQeYAT6cen42V/Jjyju?=
 =?us-ascii?Q?aOtRE/ZKy1pn7fVTPK2T5Urr3sG2TPlv2tqpahGlCJv3HkLKc9Hqa/KzYPTF?=
 =?us-ascii?Q?dEllkuhfU67meGJRk8IVWpDouicxP5qI4DD1EceKcHhh+NGnYF8cUQSQUNQv?=
 =?us-ascii?Q?kH3UJ97b8+cZSms3scvIb8/AxLsQDj2P5u1IVsJr1m+4H6STv0m9PP3NJHMm?=
 =?us-ascii?Q?JpkhGve5tx/1759Vnomfn91o+QASkEjVWuTQxBlPJ20ibTIZFjh8HMhNFd9A?=
 =?us-ascii?Q?xaNKIhO98vtdx8GuQEtUI5e4uL3SjvTkw8WS6gI92MrSyV77tiROpx3FYUv5?=
 =?us-ascii?Q?kJnCWQ4KWhChm7BWWiA+UoIIcyAb55VWoG6PX9h+6r8T5xOqH00QSzPaZRzP?=
 =?us-ascii?Q?WUgnFJW56KSKbpPnk2LfQlGvKLJEpRLN2CSoUMXngYyzDXgpXqaap6jI4V+n?=
 =?us-ascii?Q?nM7ImThSUdUXbvf+/s3UJ+nJWgraLTMrOqBCs7OEWTOBiQXKG3Ktcz7YjD8X?=
 =?us-ascii?Q?TFaV9s3tXI3MyrwSlSZ5pweDnGED7RE/hYg3yNMssQ+4OYiIkksTgGvXNyTw?=
 =?us-ascii?Q?7F9d3RnsLEs1CJZWzANLfL0GkuWGRNTGU8RfF8xwm6Ko7fSqbMICqx7Y952d?=
 =?us-ascii?Q?eIHJVb0TRJWTu+Z0MT4GA4N71MiGjp85V7uWmRv8mWpsJ2CvuMab6OxALwZ3?=
 =?us-ascii?Q?ZrSq0AYmogTdTwMIozazki4BnG4EEzJ3uak5anY2YR4DkYK4tv5K+o/QiXKp?=
 =?us-ascii?Q?cJZbYOsVaXko+inn1ZxFXPG/qRUwCWcCPv5hcMfFJtedkCH+YCjUO/o2lOZF?=
 =?us-ascii?Q?pzrTA2+tz4r9Qz7tKtNx3+RU6CvfS4G3om9fAUOyiScrjiUKDg+emc9qjcjK?=
 =?us-ascii?Q?WJgdEdDxynm0RsAuPbBeM5UEphZlrWv4zofOulrTWGyFkGOKV04q4hzdz4FH?=
 =?us-ascii?Q?4qaccWWD1s6OmyArzTttx1r0BWpthBuGPOas+F3FUUugHtmp5qhiSMeDr/IC?=
 =?us-ascii?Q?iHn2jgzv4wQ5jOote1ij5JAOMbJXwMlxax1bkoUYzLhpM+rRhokS759EaX0a?=
 =?us-ascii?Q?RfF65whe/4FsAagJVH78YSfISYUT+cCsM7FPcgFUEralcC7G28765MBUFqtT?=
 =?us-ascii?Q?FcKbMO+3I/I+4R6R9aiC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P195MB2410.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L2sJdsDtWPKtEVuxlZ5sOjSXzQc4HL4mXDj5kgLjWM3uK7xKDTRMmN8BlpXG?=
 =?us-ascii?Q?x1Ew9SSPYpW2y0OmQCeycCfAgaJz9ZahGWTt5xzoE84akxOFloXGlpY7Seic?=
 =?us-ascii?Q?lTCGDgPCZP8l8Bl7MEAlc8H7lZ+5oIB/L4lSqaXauuWWuDkUO8VaACAJ4Oq8?=
 =?us-ascii?Q?NiTsW/VOuuX7KcOM83QqvCbgKLEXo1MNT2t19B187P/u4hJZaDrl62sKiBlE?=
 =?us-ascii?Q?txiw7nM1tNb6NEfeBQ7zOmTOWptQeOfP2gKYaDxPJYwEWd9AFH95P9lHajD1?=
 =?us-ascii?Q?g/weQdjkYWWhbRcxrh+Ok+OtISXxoSbTfZ/7jdB8dYS0gZa6oEaczN3bRUzP?=
 =?us-ascii?Q?kIWtjwBw0uq8sPoBdKWoBM/NxmuDWLAfXZiR5gkf6PIvmGUdXtBLbHk0l8sU?=
 =?us-ascii?Q?ufMVQ/Qzw0TIUNg5MGtAl6PG1skTn1aNlvyqayhf+vZGzzllRUUBALUt97Q6?=
 =?us-ascii?Q?ISb6TEqdAom5mytvvR3GE0/t+96IDW5wU56o8AVbqDRdJIsSaTirK0j3CMgI?=
 =?us-ascii?Q?vUB/yvgzE4VRefNbULtCclEV6x5ups0Lqk1iDfj+a1qdAFnXZ7pjE1Vg0buW?=
 =?us-ascii?Q?5jjSaAkA2Tg7Y9C5DUOKZI70kzu3Ih6aryyro4v4QoUAR5enuACdcH+pTl9x?=
 =?us-ascii?Q?suJOnJxx097XAOXklGDVJK/6M3a8kQUHq0pvOyya9A2Id+4AdPqVHauYRqbU?=
 =?us-ascii?Q?FoxJ3illmbP/8j20Q04WUT8qZvgd1aS/RFim+rlS2PVvehj+Nkd7VQ71MIKd?=
 =?us-ascii?Q?KFpl+Sdd7VXeqosOxu3Q6VsAin6G2MNefbSoFE8suubzd/uS9m+RVafzZbfv?=
 =?us-ascii?Q?P8nw/Xr3ZpQD5hT5CqEq3qblcYMjbNk+L0wpF9EDkbSEddI9DE69jVC9Woo1?=
 =?us-ascii?Q?Ap1ZgHS7eGNpd48TFj++p7BJTJOqSFulG0tzo7p2AuUZhyVDC59sfSyym83h?=
 =?us-ascii?Q?R3Brs0/tTKxOe4X/POsC2HB/rdk/bqVrpeTVo9QQ7Akv4NZR5oUHpDrJbrKb?=
 =?us-ascii?Q?KY7+jOaOTaUdswwBQMmK/eLljexbfXtslMC6t5p2yqgvm7td1x3oMrbr0lfV?=
 =?us-ascii?Q?jedk5PaSaPZJRr53ghs5tcO6xbSB0hG3eA28lIjPsDa+0MuSUI1xKfwFhw+I?=
 =?us-ascii?Q?f0ibcLtjfOfgkBxAfuGTS7o646oDDVfcsVzXiODDYPwAfmW1AkEepKq4Iibj?=
 =?us-ascii?Q?zezZ/gOh7tBZIs4LuiKXPGYKHryEoUFpBED8h6b5/U81cIg6TyxUPccYl4ro?=
 =?us-ascii?Q?PW9G+iOUtjiH/qoFE0rnoNpMOOR6vbCz5NOWygH7iFav5dqP0WEhFKr09tJF?=
 =?us-ascii?Q?+/OK9LdQJpR0ur5a1GMiPvlyVQy1SCIio5GzEr35ujhMRLalmJ+3L38RinPe?=
 =?us-ascii?Q?E30pJ1P2zWVSL5NYg5sbozAUgWyQzpk/k+kAgS/c/42MLcFO3MHtJP9iZoiv?=
 =?us-ascii?Q?hF9NApY67EC05gzb5FcjOWsGQtaHbMaVbU+oCij3qEE9sO8nBeYZjH2LSE4m?=
 =?us-ascii?Q?DOz/kB0y1JCR6JVgeQogStYSd6QUqyYEBP1CQUchBvMDCkoOXyTtfE5kPZJG?=
 =?us-ascii?Q?C1xvlmsyfOrCdlhb+Aw=3D?=
Content-Type: multipart/mixed;
	boundary="_002_bac1cb2139a17bb583528ac56f9c16e1cbfffea4camelphytecde_"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P195MB2410.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74392096-5f47-437d-4789-08de1b8df2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 10:36:00.9802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmZ93ilfYStzTVDK9ANo415CJIirOdJGXBwL3sDRS7U6H3OmEdu4ut1YQObqDyRbRQBPK7C9rom77BQNh329qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1293

--_002_bac1cb2139a17bb583528ac56f9c16e1cbfffea4camelphytecde_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


--_002_bac1cb2139a17bb583528ac56f9c16e1cbfffea4camelphytecde_
Content-Type: text/markdown; name="ATT00001"
Content-Description: ATT00001
Content-Disposition: attachment; filename="ATT00001"; size=2865;
	creation-date="Tue, 04 Nov 2025 10:36:00 GMT";
	modification-date="Tue, 04 Nov 2025 10:36:00 GMT"
Content-ID: <46668B6B02A1604FA6CE4F3D1D7B3002@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

ICAKCgogIAoKVm9uOiBKYW4gUmVtbWV0IDxqLnJlbW1ldEBwaHl0ZWMuZGU+ICAKR2VzZW5kZXQ6
IERpZW5zdGFnLCAyOC4gT2t0b2JlciAyMDI1IDA5OjU4ICAKQW46IFRlcmVzYSBSZW1tZXQgPHQu
cmVtbWV0QHBoeXRlYy5kZT47IEphbmluZSBIYWdlbWFubiA8ai5oYWdlbWFubkBwaHl0ZWMuZGU+
OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2hh
d24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5k
ZT47IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4gIApDYzogZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgaW14QGxpc3RzLmxp
bnV4LmRldiA8aW14QGxpc3RzLmxpbnV4LmRldj47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPiAgCkJldHJl
ZmY6IFtQQVRDSCB2MyAwLzZdIGFybTY0OiBkdHM6IGlteDhtbS1waHlib2FyZC1wb2xpczogY2xl
YW51cCBhbmQgYWRkaXRpb25hbCBkaXNwbGF5ICAKwqAgIAogIApUaGlzIHBhdGNoIHN0YWNrcyBy
ZXdvcmsgdGhlIGhhbmRsaW5nIG9mIHRoZSBwZWItYXYtMTAgZGF1Z2h0ZXJib2FyZC4gIApVcGRh
dGUgbGljZW5zZS4gIApNb3ZlIG1pcGkgYnJpZGdlIGNvbmZpZ3VyYXRpb24gdG8gc29tLiAgCkFs
bG93IHBlYi1hdi0xMCBhcyBhdWRpbyBvbmx5IG92ZXJsYXkuICAKQWRkIHR3byBkaXNwbGF5IG92
ZXJsYXlzIGZvciBFVE1MMTAxMEczRFJBIGFuZCBQSDEyODgwMFQwMC4gIAogIApTaWduZWQtb2Zm
LWJ5OiBKYW4gUmVtbWV0IDxqLnJlbW1ldEBwaHl0ZWMuZGU+ICAKCkFja2VkLWJ5OiBKYW5pbmUg
SGFnZW1hbm4gPGouaGFnZW1hbm5AcGh5dGVjLmRlPgotLS0gIApDaGFuZ2VzIGluIHYzOiAgCi0g
cmViYXNlZCBvbnRvIHNoYXduZ3VvL2Zvci1uZXh0ICAKLSBhZGQgQWNrZWQtYnkgIAotIExpbmsg
dG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEwMDctd2lwLWotcmVtbWV0LXBo
eXRlYy1kZS1ic3BpbXg4bS0zODAxX3BlYi1hdi0xMF93aXRoX2FjMjA5LXYyLTAtN2U1ZGU2MmM3
OWJmQHBoeXRlYy5kZSAgCiAgCkNoYW5nZXMgaW4gdjI6ICAKLSBhZGQgU2lnbmVkLW9mZi1ieSB0
byBwYXRjaDYgIAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5
MzAtd2lwLWotcmVtbWV0LXBoeXRlYy1kZS1ic3BpbXg4bS0zODAxX3BlYi1hdi0xMF93aXRoX2Fj
MjA5LXYxLTAtZDVkMDNjY2JmY2ExQHBoeXRlYy5kZSAgCiAgCi0tLSAgCkphbiBSZW1tZXQgKDUp
OiAgCsKgwqDCoMKgwqAgYXJtNjQ6IGR0czogaW14OG1tLXBoeWJvYXJkLXBvbGlzOiBVc2UgR1BM
LTIuMC1vci1sYXRlciBPUiBNSVQgIArCoMKgwqDCoMKgIGFybTY0OiBkdHM6IGlteDhtbS1waHli
b2FyZC1wb2xpczogbW92ZSBtaXBpIGJyaWRnZSB0byBzb20gIArCoMKgwqDCoMKgIGFybTY0OiBk
dHM6IGlteDhtbS1waHlib2FyZC1wb2xpcy1wZWItYXYtMTA6IHJlb3JkZXIgcHJvcGVydGllcyB0
byBtYXRjaCBkdHMgY29kaW5nIHN0eWxlICAKwqDCoMKgwqDCoCBhcm02NDogZHRzOiBpbXg4bW0t
cGh5Ym9hcmQtcG9saXMtcGViLWF2LTEwOiBzcGxpdCBkaXNwbGF5IGNvbmZpZ3VyYXRpb24gIArC
oMKgwqDCoMKgIGFybTY0OiBkdHM6IGlteDhtbS1waHlib2FyZC1wb2xpcy1wZWItYXYtMTAtcGgx
Mjg4MDB0MDA2ICAKICAKVGVyZXNhIFJlbW1ldCAoMSk6ICAKwqDCoMKgwqDCoCBhcm02NDogZHRz
OiBpbXg4bW0tcGh5Ym9hcmQtcG9saXMtcGViLWF2LTEwOiBGaXggYXVkaW8gY29kZWMgcmVzZXQg
cGluIGN0bCAgCiAgCsKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArICAKwqAuLi44bW0tcGh5Ym9hcmQtcG9saXMt
cGViLWF2LTEwLWV0bWwxMDEwZzNkcmEuZHRzbyB8wqAgNDQgKysrKyAgCsKgLi4ueDhtbS1waHli
b2FyZC1wb2xpcy1wZWItYXYtMTAtcGgxMjg4MDB0MDA2LmR0c28gfMKgIDQ0ICsrKysgIArCoC4u
Li9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXBlYi1hdi0xMC5kdHNpIHwgMTg5ICsr
KysrKysrKysrKysrKysrICAKwqAuLi4vZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1w
ZWItYXYtMTAuZHRzbyB8IDIzNCArLS0tLS0tLS0tLS0tLS0tLS0tLS0gIArCoC4uLi9pbXg4bW0t
cGh5Ym9hcmQtcG9saXMtcGViLWV2YWwtMDEuZHRzb8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyAr
LSAgCsKgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLXJkay5kdHPCoMKg
wqAgfMKgwqAgMyArLSAgCsKgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Y29yZS1z
b20uZHRzacKgwqDCoMKgIHzCoCAyOCArKy0gIArCoDggZmlsZXMgY2hhbmdlZCwgMzEzIGluc2Vy
dGlvbnMoKyksIDIzOCBkZWxldGlvbnMoLSkgIAotLS0gIApiYXNlLWNvbW1pdDogYjYxOTM4ZTg5
MTBjNWRjMGVlY2FmMzE5ZmYxMmQ2N2EzNWUzOWQ5ZiAgCmNoYW5nZS1pZDogMjAyNTA5MjUtd2lw
LWotcmVtbWV0LXBoeXRlYy1kZS1ic3BpbXg4bS0zODAxX3BlYi1hdi0xMF93aXRoX2FjMjA5LWVm
MTA4MTJhMmQ4ZCAgCiAgCkJlc3QgcmVnYXJkcywgIAotLSAgCkphbiBSZW1tZXQgPGoucmVtbWV0
QHBoeXRlYy5kZT4gIAoK

--_002_bac1cb2139a17bb583528ac56f9c16e1cbfffea4camelphytecde_--
