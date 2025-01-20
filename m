Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8E1AF0AE
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365119; cv=fail; b=K2J9/H0O+OQLeJ0LhIvMhycv6f5GyMoYt1hNIWibz/GXvrRmxK4iTJ+T3Xdd9EigYF7qjUm6AIUhSdQMwvGlyUWqY/9qxkWnOnTsjU16elkHCjICdicVGElsc99QqXfuNPQy70u8VpLW/eXnwSQrMkaO3CtUm7iMd+bWep7lY04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365119; c=relaxed/simple;
	bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L0haEMYEUgNaZyXCTVgl7X2fD2VXQRf278klUY5+VkJjDn4Iow5c4h8XRTvnEvEdUbEQjlXv2hsDiGyFt1lfAGYWvc5lxDQiQxEGWL/ui8eKpQWpTLH2x6hAI6tszoe5blf9XW3vJdqKwDDdr1rasy8UrBPivR0ghegGL2GgSv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gkR0vvAl; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gkR0vvAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBEP1qMiurIuhc9T/5ejSlG2h7QvT2naeMJuP40QBE8XD5Dg+i71D8P54fu1z1yinsNB7jafb7lnKlrbAxa+gj6GZSwhc0rnQcgYTtXdMbUE8gT2Q49PWMKsLnqm8wVft95bTKfDYeQmpVCa2p4NkpTkO99g3DI597sR2hPC2iwX3rsshWlNtiXBGUD4ZNtx070nH+VzynOw0miXN7UIiNO06KL7YGmFYR961YWpuGmFK6gwWjVDdWtURqPG9YSxPSdp5zmE4zrWUDPhzIT6+YbpTA8npR+VUlwqVKMHEClBXcl+XwfBYXsB3ixzRZaWsQ22UltHV5jWrGuvBScMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
 b=jsXwQWj3Wc0R4f4mF5/epmz3jTzMchoUqhP4+IStwJZ01XbQnAlk2cLWEraXNkCLO58VmUHILtQINxrLtTFHWA9hnfbEO43ck+1vulwOKlvH95kxeL68J9P28YOztA2KN2hQZskCPCaaLSKMr9FTC3N8EDw5y8UyWmBfeYuRy+AR6I/z1Kl9rqi8scoGDVRmK39taMmII+FmGu/jM/VwFFp2lwpH15pVotX9YCbyrD84PuaR0uCttMGxtTI5Hz5AD3zN/mRfJEvhhjqZUJWgNDFOiwW4gv45yJnvtjrM1ZgdOrGMWje611BCmJQ4OiKw1RZOQd2/PwM5u7oqm5qriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
 b=gkR0vvAl2E1hGbq0uGuE2RSGYvjVdvLLWOQ61IKKwDv/qJe2/VEpr7d8zanQIzrnerOEswNGmJbiB3b9q/rKB5Bta6XJE1Iowz03xMAaY4ts4CsKdKgDZyjeI/rsvGovBcuxte9Xv9Cxn7ohdZEWPW5BwRCEB4IgZkT6tnaVt2KL5XuPbKv3LX21upRlaHBRbu6taTDrTrQCgbDjsnCKkJIkObKMXTt3K/g6H6II5+r9BnRsd+66PUwr8yqQKyzJAsVLZUrwFQ9B74lT2B1/XYwrEISpDQLCsrii55gopyEEY+ytudR62mKxQ3HAJKnjO3KAochZlXW14VRHkbPXFg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:25:15 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:25:15 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Topic: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Index: AQHbax02AcbHMtgeLkCDv04L9LUvIw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:25:15 +0000
Message-ID:
 <AM9PR04MB86047A37271FAC64B0DE82B395E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95279f47-460f-4084-67aa-08dd39345911
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7BWUHjRVEt2J5Qjg5bL/+4HYDUL/F/vLqmhe4Ki9NWF6N1h/VSrrgyI6tSZO?=
 =?us-ascii?Q?F1s4ns+7ao7dmQq1mWsqX+d1BcCUyaBN7lTRjouWL6FTZMyX8RyFPgNewB6g?=
 =?us-ascii?Q?1lNut2kKNdipiwcjYITEMc1vNyVSzYp5GKzoZdEuZ7vFHlAc5pEyPh6D/mwr?=
 =?us-ascii?Q?rGr2rQqdEt2yGh9mCtAaofTaFmnfBL9zAtwP0OG7hu+uBBsImgz1dq4xOYQ2?=
 =?us-ascii?Q?T1sHCFt2teNEBsHeiVbsMwGuHpVNOUuhEzjjcU73lE1ivL3PUaM3I7dclytH?=
 =?us-ascii?Q?7TYndqpVqDqIYL8A1TJcd8MLAo+pUmnn0GLFNv2MNQTEn6qoSn6H7lpyfERO?=
 =?us-ascii?Q?R1cQk9z9gx0H8rKUDoSqymQJ+mck6j+KDWIqOCBi1gLHnDkdOqDAoMdlxYNu?=
 =?us-ascii?Q?bxi26IwLdn3Jo3f6SSwaNpfje+FrOvs0jwFOBaufILoTXxlz4oVZHCVJaq8A?=
 =?us-ascii?Q?OdrC1sjzKb0ZGO3hf3/mBcmZmK9spkefj0kINtmepF/rATKaYs974oIx1rxp?=
 =?us-ascii?Q?RBATloZvRMSdT37ux8/9G2nJ5CAGKTmwMcatOk+2r8VE8zxmEE+ZCleSwOkr?=
 =?us-ascii?Q?c19zi+4nP1Q+tYCDjraP6+i7jLN55nieY7iWhkS6o6OHB9NvXL4BDG88qXo1?=
 =?us-ascii?Q?+gMbdfXVI5acYmhF77AJsDW9p5IQDRzs8NL7Z9MKetR0W9Swr8Qn1YAseOun?=
 =?us-ascii?Q?Lm11ZtdM+cp93hRCSWz2PpnckNP8pAJL6rbvaIZU5HGTguKg68CgU/t3IvU/?=
 =?us-ascii?Q?k3DrWYn/FUUgC7TSkhbsyyHTrUE9n3dIyz1r+wsPadvc7lnmcchAYIz/oq9z?=
 =?us-ascii?Q?GsnEUQPtycrInS3xbSQudrA5e4qiS85/9AD43KJd8i8cQXiVzK/6is0YCA6Y?=
 =?us-ascii?Q?VcCRGqnr48TcfkF0Hd7WXPRY/dhxHqUOMTgsIR1n0NoSKj8vZlFKAAkpR2g6?=
 =?us-ascii?Q?U5UsFSO8/YmD2mnVbqsQUMt6nM6zlUk8o0B2C9jlgCVLPpk0HcxJUAdB4a9Z?=
 =?us-ascii?Q?is3Y0Ds98gY+BbXfReGwMEWgS6F0RBpHHcqPQNajRhhPbcSv3u3wh2eXI+Qb?=
 =?us-ascii?Q?fMVlqp3l3nkyqw2I8+vIbr2bTc0L69WPPsurgjUaRlWxANn55xwLNR79CfkI?=
 =?us-ascii?Q?A97Ugl0ro5P3gJNOCOyI4HiRj8tVE3DlHns2H/lxNIxkDcX15ZHHnPj5QRkd?=
 =?us-ascii?Q?Zql+tWyskvBAl4HO4+qeQv8TGqzpvuJko8ACcWVbcBkjlxZczeq27CO+v2Cp?=
 =?us-ascii?Q?ou4Cb5Fw2k7LjTyfFDCqsjSWmYg8s08gI9RXSy/qrWK4csdl7l98RuPwNN77?=
 =?us-ascii?Q?D9G/Zdmrf0p/KyI+qkpKhj3c7XHUzDr5f5tEwoKMrWWFfXjfdMR8PTE214lU?=
 =?us-ascii?Q?fhKybH9G5MNXkutqtNKcem/M7yGPJg3fYR8KqbWzHOdpbns2ITT5vWY7Uodz?=
 =?us-ascii?Q?AtAMThv17G5te2li1SrA8pgACQMyvCVy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EwlfYDJcSwJ1LbSyKDBkf550+FoJc65U1ggugcDrqpkwdVvZx/M4TqDJt1WG?=
 =?us-ascii?Q?Lb2eJsMr7XjtgEZ46ofXdoJOS/T6/SULitd1nT2Acsxn2xvzQ1gPzKE3xyVb?=
 =?us-ascii?Q?gmijclKBC2J7X0gaQQt8QMC/M/AR/k3+s6BAItIbsWOnWH+yfJtOarUPsVXi?=
 =?us-ascii?Q?StH7RijQ3EcX5mEF5/bJMCiL5oq5VI+UXwNh7zpntV6Z8SYrZTe8Jx9fHHKe?=
 =?us-ascii?Q?F6xobTYuorsQv/0J1l822HteDHcxR6Z1JKzCCJYLzgvBJ7eagncRVd/7H8K8?=
 =?us-ascii?Q?SRrpYcZfCLGtnsdNyYe9nxc7IEkP59VN3JVFS5O+8/WbsRzZellD7Z7L6XrH?=
 =?us-ascii?Q?LfCBQaipLgptI1u30Y9HImt573quIfrXqFB4qvG3OYnf0CSdwvVNW+pqV8Zo?=
 =?us-ascii?Q?ZCi82ev58FBNcSqKzB3Jpv8Pz/KGsw8y8jQ0chKCPsk68eHICRcQk5yxzG/0?=
 =?us-ascii?Q?V5OPO23VfNjBX37Q75N79mtsay9xCbgQOYIqVn6+apmDw1zQktuQEsfdC7zS?=
 =?us-ascii?Q?DEfUlV9B7GAULkMEMCGOI+TkIAPEqD83b/Pc24zL8cvbTbDmRgjNdGfbLBwh?=
 =?us-ascii?Q?EiQdarO6jk7YLuw24JZbpxTO87josmTXsbl1GypmcGigJgCDMcRMIGJ5qAHr?=
 =?us-ascii?Q?35UMs4i/+5Sm2rGpxd7OUiArm4s7HOktaw96XIPcQUkxFdZ7fm3zZs5uZuNv?=
 =?us-ascii?Q?JqSg5Mq5uX4az++l8tIhoWZ62t4tDtKJBdQIXxc3uI1MSdtRFOHvm26VrDMn?=
 =?us-ascii?Q?A8nWnc5TbHuiw8NjMyr858kFBcPpZd/Q6s9nxJGLaUhIC2Rac5f1foib4R2C?=
 =?us-ascii?Q?a3KIo79zwiGGHPe6ZHFN/xkg7IYOUiCHCR7eJhY5bbIZcmx8W/vIMK/TyIHj?=
 =?us-ascii?Q?YrsfgWE0ZxYnkXfZcfQmbKCV2RY9paDgTe0cR7h+BiloDB5jfL8SiC1lWPEg?=
 =?us-ascii?Q?AShmRDvBeG5OVi3uKgK42gpNlvL+YI6S49VMJwHAmf8tercGUFQF3kpSw5GG?=
 =?us-ascii?Q?Jn3EpVNpKZc6PsvTbVK5j2d3eGSz+/yW+WHYBFaGBVNHgIdf6cgtXYo0uBi9?=
 =?us-ascii?Q?y2q30X07CxFVEulvH/dcNV3IIepkSwKiUryQK9Zfj+yesjlrNtoAzeliWCkS?=
 =?us-ascii?Q?ZtX9chpwmdr+DNzRjpElDX7bYHFT2wRc8a1fFkjmKC1orNa/NOzPIs+1mUGB?=
 =?us-ascii?Q?ZyLOhm7Qe1OlC0OoDqzshZZRjmSAjT9RiE6FLSDyPLh+3Br4iuvJ8Or2f+C4?=
 =?us-ascii?Q?HtVi6aGtD2MnnpPeQoPyx7t0cXs4MzNoS2nqtbHDJ/zFMGJbl23pAXV5pCYE?=
 =?us-ascii?Q?NxaQkxD8v7rWvFuiGm1bJPfl4XQN0Ld8DcHfHdXmhijVnQ/bLSDQJURVCnMo?=
 =?us-ascii?Q?cTnRZMGwWOH5p5H2LLtH+ExMhEa2EcOwW+9E4lIAZLJTSjTAuPLjgEMHGc+6?=
 =?us-ascii?Q?tqtXQBSrVC2gADzCE4k5GyZWu0OjNvU/WRZh2VSqMhjSvJC3zBzivlA4sFFz?=
 =?us-ascii?Q?BUuI/J9YS/FL/4VkshiIlxtWohJtsTOXiBJfuzEyFpOCx465MKDOdMYZyNLy?=
 =?us-ascii?Q?pzxvnGtnslCHG/5D2JF7yKAc9r1ZZShHOLTLoYs0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 95279f47-460f-4084-67aa-08dd39345911
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:25:15.1282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hn9CfxD0LBBZTPodU8yScNmWOQU6cOZPKF2qA5dDNPE+sda4CxADLBbESFIFb7oTzI90eIxQoSiI1MNyRBQEUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954

Pankaj Gupta would like to recall the message, "[PATCH v11 1/7] Documentati=
on/firmware: add imx/se to other_interfaces".=
