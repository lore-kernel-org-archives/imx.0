Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E81AF0B0
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365177; cv=fail; b=alHG71gqJzmYA5OFEnZSKF4KaxgCaaOqWCrEVYdJz0UpwrsRyjuMTuJKHLVE+KLrf+XbYqCnvifSjLDr6gFzlESN7Sp2oiVzdQTsPRy/HaplYVFnDDDTarfxF4b5CQEFNndyE5X7u4uOm750ozjo5+0dyouTgAcdGo3+SLdni9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365177; c=relaxed/simple;
	bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SacKuttX9a2Lsfm56iy0+o5dpW6QF/GtPKLozR+MvX570Vb2x8iY08iW1q6HxBcuuEll53A3jN9aQvcvss6xiUzuc8LlMBnmuY9hE5JhR8mhGmEnwEp+JDJFgEfCp/pE0971PRult6UzXJ8njPninkUYnoEBX/W89Iyp7jopq9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iQh5fWLH; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iQh5fWLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B76ZIGQpbwZt78WXYIo71OeqrWH3olWL+ckylpIFH6h7udfSZ0puoJd8N90WgeQ0QOk2sALDr36+rLDnAuUYDwiM06w+7g8ZClDmLnplfDKUI1HKQNSBaHeLh8WsbaEoI21b2qJOhzvCCT9O5PpLxbJAwMK9lxMTffU5jeTucmS8jmb17p78Os4+EacGDI5MMDgDBwJxa4ik+chMT7lFaYJg3VszGA2UMbphAddwSrPopda6nrg8g37khriVqNE/gswPxIcszdmxImURD6FgyTrXWX+fKAsKY6usuSp2868M192rmhH/BBJyzh7yZL1c7F1Im6NnYsUVCaZbHThztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=;
 b=R7oKcaQqATTw55l0z5XM6/1kEFRbwGU2v9ttZmKIbnd9UH3OCS3dmzSpev5DB3C9ZjYUCme4dN+vrQ/FIBN1ruGqbTC2vPMAQlhbOYoRve4xvp1+Ub9c/dKeQ+lS7P0/ELQ42Rmf1wREpcihZquCByw09QXw1urKBTstEeeIEmSuhGicAtl71rT/jWAPIAr3vL0p9sGAy0GHOmyKNzNoZqgheVU0k2dkrQ0DLUof07QbWoOlYo+G0f2U9N2KLAedWmokl+ok2z9SpGuTWwV569pJD9McxAsph/pj85lRBZVh/Ukcf5gQOZ9uPooB0F7q8sPOwkMCMPZQo7nzyw0QvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wzOoPXsvWdDxMxjsnDbL1CeKaWY4yC5vEVQwJshpzI=;
 b=iQh5fWLHzsc3I+1zJC1zdb0V6vsqcNgexcoZZghhH0Vs+4hzLiMgCYgy+5P+oVNUs/r52oqBEEEk3BAzNbcC3CoyX4g+t1ISilNIUdYvogKkf8Vqa2AOOPs6mIyMGibtz8ME3jakbPigRYfa8jOR/ZjUt4XNB6Dp26NXmGrvoIciOkYBKy3CTa0tbuvb9X0uVJVuvpI1pPfhmPwlXnMuLq/YqnVMiqkO94hUTwIU0mK3Q3clEDvO/VC58Jxb4RiTZBkBcF4YqrcxLohFPOYXKygaQPX/6APjhbh4StsMB9Nbog6OK5MGUZP7LBItGUgiBy6Q9hizCs/J6b4NlUbpzg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 09:26:12 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:26:12 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 4/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v11 4/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHbax1Yfw57yyH2DE+ljOIzQZQj6g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:26:12 +0000
Message-ID:
 <AM9PR04MB86042D52931AC54FCC388A3B95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|DB8PR04MB7131:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 016068f7-589a-4e15-761d-08dd39347b0d
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ldE7Wiz+GUbL7OxhdkuIdAbUyt989u0ciWRjT8LeDhX19QhVVgx2Xdu5uy+f?=
 =?us-ascii?Q?/VBZkZBm80NNUI1eZzjefrqvvPiQKfww2TJ1z7WWTl4cQ0/B+bVp6E3qowVW?=
 =?us-ascii?Q?5ZxTK+3faOT6cCBnslK36gGsZCn6b2C9Dv510a4AmgcqPR9uzImcaJmaMZkf?=
 =?us-ascii?Q?QcIoXhvclB+OWjN+nsUFReXN5K1+YF8TCm9MqggYKyNcvTGLjc2Lf7rh8nGb?=
 =?us-ascii?Q?eTasCj4s2IbgM4XwpYxW68WOXtHAjVB7AR2dIyYZSzJ7V0pkK6XhbYTcUq8d?=
 =?us-ascii?Q?PbOY7nThW6EiMUu2UEBzV2w8qORBO3CeUBKah2EqUmvVo5jtYUwnV2kTR8T/?=
 =?us-ascii?Q?I+iHo3q+UQcvKTiC05Q3jNnhvQC29CxeXMWMFv1ilKcrwGnR5GRsnnQKYBWI?=
 =?us-ascii?Q?SqVC5F94RQZRZEvoZDiQGjE4n15ZA69+6d2whwZlGkQaWjiTZqME/RgGRuWK?=
 =?us-ascii?Q?gDc8mTUAOLlPAVDB/0Ngm+BFG2Pscrjm+iVkXpWZOVs8V3NB58FlwJd0g0F1?=
 =?us-ascii?Q?TcQO/qf7Z0mEQr2j2NO6nqjfkTut9rlCU6DS1VbaE/MuqHAOaYtiQZ6Soe5b?=
 =?us-ascii?Q?E+xAsdJdhQakh3fk4EpMmHGQI/3b+UYwOdWUp2RAv2v5UZGu0KmC/AdsQvXw?=
 =?us-ascii?Q?yAbMRXUL0vqzqAtwhNrCO9Hz2vD299/GPXtXNSWIF5b8uvRD4WOzUoSeoRR/?=
 =?us-ascii?Q?IlfoGgbZP+LFQvWYjqVzbqO7/s5myQorayg2NMsABB31tPgQHFxpP1/Y+0rR?=
 =?us-ascii?Q?lLBER84wcCootW1V5MQuxdn+ozxKXGMhH7xzEWvLjc1rcKFFrvuDcMgmAIXn?=
 =?us-ascii?Q?/RoCrZAt6EQIWqMCQl3g5wQy4G/UaBaWyJZiE/tGiv40apBmiaQR/6QDbjF8?=
 =?us-ascii?Q?d3dVYo764nBkqh36HK0MONpOE+H/cSLlRjCQRtylYcc1K+lNmMis295ot79t?=
 =?us-ascii?Q?eozv/HuDOl7/z0vdIqLKGIjw5VjYk7u9NJ8Mjlm8spT1xuDWTdp1YqpLewqB?=
 =?us-ascii?Q?x3p2j4vXuljGv4QcIFnCUVyBI/cm6cXdnihnoXqmefJeMWMgHcpc3bCaUk5K?=
 =?us-ascii?Q?qAXoQuy1v78xp8MRpttBxywd1K5Qp0Dg8jLJoTWvOtFz/8DVlmmnXKi/loUG?=
 =?us-ascii?Q?4+NdcvqQjWNYaf6Uul1VjJoiN5TUfgxzPWpjd518Ea22Ywhh6TSzpD4A2IWB?=
 =?us-ascii?Q?jgLuzxbMK9+HJSGDI9rUVmRtUrSAAFgVjOUW7KAMbins7dj+EE3ukP/HKJGz?=
 =?us-ascii?Q?zsxzkSm/UM3Zo69Wo9zjHbC7ptxTvO4fMy1Qghcbf06qT24Ktf2qIlMF+7iF?=
 =?us-ascii?Q?ZG4V+YDRzwW62ndAYVFUyjtAmuW4Ch/zRBXwkchf/mIBXizGot3vQ+5p2vUE?=
 =?us-ascii?Q?QUNosTBUE+uzPUfytIQvTG8p4QrJvIjffJGGY0KJ9jg4gG1JQFDK9DIqKmQV?=
 =?us-ascii?Q?IvgVyf9GuRGQl3pfaOqCjzqqVZbax1n5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2fSu6gpXX83mMUFpwrpyFEd7Cm8bDhq5aYsJy9kp4JabuVN9KP+1IZcNoK5x?=
 =?us-ascii?Q?3X2vBXmfYvm1OHD0RraUGH+A30SfWFZ0gXgmqeVdZvILBYt6hGHscX0QhDea?=
 =?us-ascii?Q?wTblsuB/kwDqpXoJQqutitnD8I6RHsmlVnGqIsonHCBDeay1GLG5Sf3AfkK7?=
 =?us-ascii?Q?1XiTxviehaN3hf/LZHTJ7KkuP462dsTsL6znGO14ng5SClz6rYFUh7pwA4eF?=
 =?us-ascii?Q?DJ0ojOGV0t/pcrTmohDplAUidScW/bUEN0PYVbGiNy5Q/5FlPRt69XNoZwKq?=
 =?us-ascii?Q?9AiAmfBqwS8x6krIUSjEwzdEpRwKAgxSNheq0sncMqWJqofq7N2gdw5gJq1C?=
 =?us-ascii?Q?GfFjKPwCXkYy0iOBaGKJv8ZeuPN7zcxgWbE1mQ+plL0+unsEjxwNwoVjx53X?=
 =?us-ascii?Q?gb2j/Xn2oLNBsc6yCUnPelukXQQ01NGUYrpU8nDMqVdwgmXEMT49a15UPWHR?=
 =?us-ascii?Q?ZxdlnQfLeudm8gaxHa6z1nEnyTb3o/R6eQHxwT0Jm2VqVlCXRnendcKGO8zY?=
 =?us-ascii?Q?SjVmL1NUMmtOfBEThFWLsURCeQyS1Dfhtv6HnKK1ezRX352j1XAHlp3AdNzC?=
 =?us-ascii?Q?hH/2sTJjmxc1DTZuseh4jHoP8MyfqUoVsO2uL7r/js1ol3EeocciRB2LyeHw?=
 =?us-ascii?Q?wQdRWfMj0vO/6JWYnOzmh6Lwbg357RLWthnzx3twrslJKWTerSFD2/vcPsFa?=
 =?us-ascii?Q?m3Ep20lySAmv++EGGDGPbAMSYs2Spa38ISKAsFhvdWxJGeVQPda5cyKviWBr?=
 =?us-ascii?Q?WN02EKksi/TaX9NOv0ABDI4CnVawu6z9ppBS+oEEXzNkxhjOn0kgmQaEJOPc?=
 =?us-ascii?Q?Re2xSNLl9WMMc7Nbl+nxH0mUcr4DgNo+tRGO/i5VoF2ZYAkJYf3KQwCrGRIz?=
 =?us-ascii?Q?alki6TrQNlqjBnUM5NZFuaMQXIRxAvKlZmEJJswyMs/IThWhya3S5Tq8bAii?=
 =?us-ascii?Q?TZe7ExV8WfNiVZek5YoW9had4TtC3JhlngJ80JcsYZe8P2Qsty2PsPtTIO5B?=
 =?us-ascii?Q?p2xQAVAzd6NcbKEtV2kM3tdNhZyPDtVS2Jr4s+OrhoNr1oLpPTq5J/BWYMOd?=
 =?us-ascii?Q?o/V+dUlUQ0q02lcomtkOM9/FJ0bbnX6AFA8c+NhIdQQiOdMSOklzDgPMtof/?=
 =?us-ascii?Q?C3mAByYADeE65PJJ7C5vuJjf5YYKPzcOCC4WXt3+5EimLYnHcklN9Z4K89cq?=
 =?us-ascii?Q?ziI8O8WE6rXf5LAw3yGc+hjPAZ8l9uTP7GqV9EP5NioDtznWU///8amGlQrk?=
 =?us-ascii?Q?3OSh9UeQsUkMe7mEoBEVU02gcg3KDXJgJSeUsvufT/mZlXrrgY4GS4Xpzx/O?=
 =?us-ascii?Q?gR1BWU3xIa191etPrh8qMu+rTQ3ubARiiLu5RpHd/5mkcyvbNL/JRZ4Tynny?=
 =?us-ascii?Q?C5Y9RmujyI9hfVtZWpKSgWUu/A2gcevSBh5uINCVgEWaznvqYZOghFPSJwic?=
 =?us-ascii?Q?ILwaNiXQILqui1FDeRw/kt8i+/8lKsxsIMfrnYI8hW+kIzvQDwA+ouePT3yn?=
 =?us-ascii?Q?gQvvjPX6IBkyaFr3Bx4t6/KMCB4Xl3Pc3Gss74rZbCnqA0EdTonvgIXJSRJv?=
 =?us-ascii?Q?C/he9WmLDKzZ7bT44Pct/aR4xSOa1lku1VApqnBP?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016068f7-589a-4e15-761d-08dd39347b0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:26:12.1665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jr2dtIGjZc4p5PXAJjHJ1JgFX5I2QJFWvrxNQbpWJRtsbIDCr2fKBs8D+lFeuM1+cI8twl5gLKqRXo58sVBb9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131

Pankaj Gupta would like to recall the message, "[PATCH v11 4/7] firmware: i=
mx: add driver for NXP EdgeLock Enclave".=
