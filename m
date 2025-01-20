Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2072.outbound.protection.outlook.com [40.107.105.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95C1A073F
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365075; cv=fail; b=PB7lQP4JIYxU38+7679QM6vuO1PtBP27f0GcadzyckV78FydcSJpvJg6fScG0CPr8sf+67G+jP8HLZb3tFkcC28Elm1iDoTwaUDkOY2r7emw+lbwXnF/hpeqb77YjrieCFwSBqbYPNqGte6SlAA05aOlbFGrS6LT5PrCg68D1O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365075; c=relaxed/simple;
	bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=udQXX6u1nzfYLjMG6Z5JCi2k/DlWHdT8MXR31QThW9h73dJ90wcphBK6zxum75Lg2yD/TQyB2fXWKbwdm1efAKs53lPfTPZ7DNdF2TpC5rC0dqYkPjJUKfiDCgwwT3YjZf+uUCMpbVBX4J8vWvt8p0BEPN/gzXxUlZUKC02hXwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c5qNCIZt; arc=fail smtp.client-ip=40.107.105.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c5qNCIZt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXpo4U0e81f/FExYOaiOw8UoK1/QkZbTUseMI20400a6pwIuqfkwjV+aNV9oOaTq40rY9onavw9gZcd/MIMSVA6j2gjQKdfPRMmjHx28e72OWFKaV9+FOQHIu+ZOqVb6I8/qcPLBeu3damgG8r97LZLqISkuIL5aOjS7vMe8Outhavv1je2B2fzr5GuRVg28Q/6OIbAm0fuit0pdxk0cWDZvok796SC1Gn2VSbpizH0S8L/OIs5jkB8aArBmKtSxcgSvYMp+Twc5KN4s8t7/20uTIsn+sRfjwSGoiDccCpwkV2rqkrKu3VRFJSNJ0fc/0h8zFP0liHZESw4meDI5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=;
 b=n+W5XcbtwiMSFeYNE4Wxuca/Hpnxx1iYgT2wFAfwdTpdhWCdohjwguiGPw/TZnOC79f4Hhr2f1LiyJKyfUVE4jQZzsKjBEFEIJD1BdvpAHrDdoZPX5iYoI+7yxAD7FiCaZzOBvyXwabdn5h6ViVbjGLMbmJrzLP5L81k8y2A5yEEQqrJYVRjYergizYl3yUcPZ0p76QV+c/m5rGvTcE0IgBmaIf2/WnaD5/xrN69HaS2faZqZhQ0dSVTo1ukW7FA3OtTq4iX4fSCUsm/QvXfvwKvsiL5RS6lJtq0oUIt9P+Ka7jFRp0UnvSuTqdCoCUQ5C59Yjsd2BXvuygsQAstTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpcB/b6jROZ52DeCCNJqBgqAtlO++Eb/NphZcBHkMrI=;
 b=c5qNCIZt0amKmcmGz9GtggIBjdTPp1NjILpg53hgnfwxeSS8MPgBfWCKjCd24uXy5V3Wr7/Nh5esrKSGRA7cEcHEql2/rp0kTMN9DCI7ni0nzOjYq2VoJYVunUEkmQmEIplh4AHXH26oFT5K8CGv7+EUDZuygY/ANn6ds+13LQ6+7NwmPvL8wF4iQP2OokWB4BmaCR0OEk7A7yQrZgX1+dAnz0bxb/B4392DNETLDpCuj1tNfwUIuPd/VzEnPU3hfLy5o23w+py8UEkA5CG0C0FOKB8xa3qK2Z5B5p1KJ7hqdNFZnhdxTMUnMXCriSgQqnZZwwqhYBWkwTUz/q4YXg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 09:24:31 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:24:31 +0000
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
Subject: Recall: [PATCH v11 5/7] se_ctrl.c
Thread-Topic: [PATCH v11 5/7] se_ctrl.c
Thread-Index: AQHbax0c3XkcLODRFUmC39xWxhSrjQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:24:31 +0000
Message-ID:
 <AM9PR04MB8604BB412B3B5B4416002DEF95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|GVXPR04MB10731:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce562ab-822d-42e0-e704-08dd39343f03
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rwQuJmTKxUVBMbsH4c2heDku0u0vGwSQvxTh6R1CFzWP35QoI8gHeB/nwNeZ?=
 =?us-ascii?Q?xavux9askmOWXI+3I2pj9/K0Dcfc2BwN3fHcB3SjjLchUPU2Laz5hODco2S/?=
 =?us-ascii?Q?erqZzmqFoZektm7fW170sFo8BZZ+bL7VCfa4wDVEF71WLmq7NT7YnlrJ+1vw?=
 =?us-ascii?Q?OTcmpTdxNiarePbv8ev7efL5iqK4fzKFP/eIyZ+3lwqRl/OWpk0lfITUTT+x?=
 =?us-ascii?Q?m+sKYC+y0bHrmfPheFYocO/vB4FrK9EGlezc2HfwPAiOHAYyRFakS+vy/z6r?=
 =?us-ascii?Q?h4W/NyNL49p/9r6cXWcRXgNoT6emp1JxxJQCnRcHv0QqgAI825dOzsIp6Fz8?=
 =?us-ascii?Q?v/23YPan7MI7aAvAD/MIClNzJREuLEuKRv/b986L5Ms1eUcgL4MTd9ENkve7?=
 =?us-ascii?Q?J1huwdGh3T001i5VY4e/Qwk2lIQx+33+cU2ZfaaNtAotO/rKnZXr/H8puKMc?=
 =?us-ascii?Q?zy7W4SvjBrWK7DbUTaZK3o/Oh1c2KkHMoSE7iYSbTVLe2X98CWxRDGJAStMJ?=
 =?us-ascii?Q?q/dFwrTQ9fkJume12ng1m2RW/erzmNOkIx/to79+61+9T2mDA2zvK1hIHCaq?=
 =?us-ascii?Q?OWhGNq9nEnDiQunDflYzdZGbKky0GS2TnMm4i/vuM3HpqlwsDpoYA+Zcc3CU?=
 =?us-ascii?Q?y/RTEHUD3YUvUeSRB2dF+1q185aRgUa05AQmk3JAFLXQz6Rx/GSfk+Z36Loy?=
 =?us-ascii?Q?cuhVeS8ctk2a9eUl5Q5gITnWvPOJ0A/rrSGQe/sNxVJso0q8bFRgQTN1kKut?=
 =?us-ascii?Q?1UIZAmf+DfCpTOGc9ewZVmsSR+iIQ508geGOB+91CWXs8NbWvxv1bj1iZ5PN?=
 =?us-ascii?Q?N8h/AL/RzE8CLloFQw6nBpUbv5wOVq2+Po1DJK4sXudQ/rgUjiWGRdhG41h8?=
 =?us-ascii?Q?tKe+14WB96BgPXD26WlSBVpioSrCe3V1RViHdl1a81yCdgqFC+EFtTREow2j?=
 =?us-ascii?Q?ElBEDLCh4q5DkekkZn5DnxEX0ajlXdLgp3ueEXiJfNz41JHWxyqV0lclrjdg?=
 =?us-ascii?Q?rLeAMSfOryHLZDuFy8eYzlzyfhuuIUb+3ULsDi/ZcEzIm2FM2HB7yp35/1CR?=
 =?us-ascii?Q?eWK9bfZV6/SOkcyhGf9hzOHJ1U1GKMbjZ2v2/euILrPmSQXLX8sNdrqCmnCe?=
 =?us-ascii?Q?h6Zu8nn3BHqF74pyky3h/B4JVNfYr0BOKiEHrvbzia5Y7Eois3N3b0roT+us?=
 =?us-ascii?Q?XiH0dqg2uxqCTG9k5n2vEiuADIezmcb5Qvu2IDcf0Kd9/VdgC/KJfpLHc1t4?=
 =?us-ascii?Q?GpH57PJCfyc25hbWaSbRJunIunu9eNx2hAuSedc4SxjrlZmMOUChobWWNNmM?=
 =?us-ascii?Q?Wf+IovkHbqPAUV+t28a9/MHUprV6J1c6WdkzUBxuMZvAW6AjGqAQUOKs2pQ6?=
 =?us-ascii?Q?8FpGF1WR+mUS+BNw7DcuDS8tMjkynmwYk4jfIJgU//tU8GEXNXTzPFJw66yN?=
 =?us-ascii?Q?+WT0raUJRGieH3k3Zn9+NhUTvIaaWzX/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?En8GMSTWunKrkLpdu+alMm27yXep8BjK72AwyvZ/HYKs1WPCoo7h0qitet0b?=
 =?us-ascii?Q?db2FomqtZ5O//psu4vYqkSg0/NkopPLmOaUtIs3jMPPPQo9LjzYuz9bovTpR?=
 =?us-ascii?Q?/Rv4hkKKCYioNnusDJUvVEQ8ga6XdreT7Gd6JYy8KB/AZJycZqzhd0gblGUn?=
 =?us-ascii?Q?5oufUlsI54bcNBo4o6xgCr7Ptq5rqIsk7+5wG+n1M4lf2AnJ9lHVFS5hfyrW?=
 =?us-ascii?Q?vq0wg8mBBxEotAe07rPk7VQfOEFQ0/6BoNJhMDqyPjBOGH2zgy7qD3KTU6q/?=
 =?us-ascii?Q?u7L4JF/EB3h6o5sIYiPqcJ+oMSm5tQXXDmEyHGdRjZcq1j1yDVcS5Nd6rKGJ?=
 =?us-ascii?Q?Uqrrzo0T/6uYQLlOlBmmUJQR+QQvVUUup5e+QWA2/iDmClQboHQ992+rj6lx?=
 =?us-ascii?Q?mVIOSP1mmAuyfwADuLYoKH1o/ZzPZpLL0KDrQYn1YraFLsSe1O54MsKUZQW+?=
 =?us-ascii?Q?9/tBgH6aokwjmFkGqjpqCBCvzyrwOHfiWx6yrLr0g5jTjYdSPLreGykblUvc?=
 =?us-ascii?Q?ObScNP0REr9BsbzoRS3uwj7e4LgWvDU87yOragap+6JY9v9uTZSzQQMBqazv?=
 =?us-ascii?Q?JTsu4jaAX+bSUfgTUEsTrU9B2ZrObe+FUNRN+0FngcdLepmDl9D3mnL6GkF/?=
 =?us-ascii?Q?OsTA5waxDaq4g6T1fqoj56YJUERk1aaoR3VWIQPcf5TyGJQjA6qPbxcem4rK?=
 =?us-ascii?Q?9heNj8d8khaAAaia69YIMtfpFQbp1B95Tep85dkm94ihzhUbzCweYViSyMcR?=
 =?us-ascii?Q?BpnICa+xbQq5tvejtcDLFdoBh3QGHc4cGOyAkvFw98yciJs/bLj2jGSAHmGg?=
 =?us-ascii?Q?JIwxaNs3+2OkuFtH4PBXzpSR41AnPUsibpX1/8PuSi+LZSftERcch/tYz+5I?=
 =?us-ascii?Q?xiFy+2L2Ch6Co2vC+95xS5loAmODvOM7OgKHzrYpSLKOSoP89wASFAy32njS?=
 =?us-ascii?Q?MIy66xQLAMG3pKWjMByIJ7aWDAqPGZP7XK5pmpEgH6xEg09UNXjpL43EAbKb?=
 =?us-ascii?Q?QtnR0wtPdXp+3TQH0n2YzY0PDYSPDR6DGPANPrVSolwuMxQ5N1QH6ajgJAxe?=
 =?us-ascii?Q?Y0Peq5KdXpDPE1mW5cVee/xDwkNC8iynH32pn71ftjbmwk+oThUbgu/8yWA1?=
 =?us-ascii?Q?v3wTD5WwnQ4b8gETBq8YYj/yDii7mxEqKgJ8kazzrCZJRB7YJmmNaVmAGLDo?=
 =?us-ascii?Q?NH/NWKz5jcnjdsc0fCHsoCJCeOz44gvncnn7OGH1mmtMNyaJKyX4rTXFf4nM?=
 =?us-ascii?Q?UYoQM31kxNgFArCGrpd/t/h3KNX+c/CDEu2eYf2ZZdnKyKzJcMAAv91MzT3y?=
 =?us-ascii?Q?JYntfbZdFFPW/UDrxK3JjznTCkLCJ7ApP6FZpKAmTZQFCEjVk3yclAzz77Kw?=
 =?us-ascii?Q?AIVNV8IBw87o8Z9NG0z15e63bEO9qmHp483o13KIZroM0+zz4bYDln/LDQzs?=
 =?us-ascii?Q?nvphpEdOds+JQ3+toCesL2RA/wBzDCj3kVtt72QutnnnMvbaov6dLEEcSgzs?=
 =?us-ascii?Q?/rQXpxP4tbSyfQFcCtKT0bs6wT+18GNY8hhmK8FkfA0Zz9KVS0f+MIcl/9bw?=
 =?us-ascii?Q?ODioCCKFVs+PnxnW8hBJj8lbHmApHAskN4f+EMPi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cce562ab-822d-42e0-e704-08dd39343f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:24:31.4240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXbjb4xQt++EqPgIFsb1pq3vV9A4Y7/mnkHn34biuyqKZp7nBfwYQzXA7WLC1+jNsj7ziNgZar3t/kO/8pDglQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731

Pankaj Gupta would like to recall the message, "[PATCH v11 5/7] se_ctrl.c".=
