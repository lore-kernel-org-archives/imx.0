Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2077.outbound.protection.outlook.com [40.107.247.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97111ABEC1
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365206; cv=fail; b=rIzhEjqNIFjeZ7e/dTvIbVqHurnfe1vjlgxdHX40FtZ6qVVLsIoXdv/555xy5FwKsAf/BH500OvgF6rLRqxHOQw/oj/7UUAXWhZow4MDcyg9hhDEzJGoSkDypq/A+sxyLe5S7vc3HLfDlmS8SwxuVvqYUQLXbJOT2v8E5qPx7Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365206; c=relaxed/simple;
	bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=a+lzLo1T5rOVEMhAf+OA/hKNtD5OxXYSIwlLYd3L5AHMn5bzlE6OcV/kGNaEJ41+zN9oSOxsyplA4usM6zsIa9yXXaRQtVvt0nKLwsak7EWXdXOHeejZNoWPUNa3pxdwwH3qDhKmEhCaaUo4J/+fArl1IPrn7KZba5JOtof5Qpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hn9f0DGN; arc=fail smtp.client-ip=40.107.247.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hn9f0DGN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqGFRwvbpZvhSQM9QFtcqDvlaPLloxXxudaN8aJSng0lElZwD+0W/rpneZ6yqZ0U1tqDcDjM/ugUT3Ck4nzU99gufBe0OGxYZ5jcKSqkDHCQO6h6g17eF7ZMA1oMlHtAy5NOx8Wxlv0ke8+5pw44qOQo6/brjNU6fHNScwjHLBdjyWQ2d71tRt5OHo+0MeY1ahJWaxqswiv2MVrih5u0LWb+EQnWVwVN5GvjXSirG7HRfFYrKbQhDwOlHnsC9Ln3OGO9fgs1jC4C94qCL00CyTydLxnFeYvH5ADnw4I0lryfRH+nV2ECH33OP3HJkpPKwhDFsRgXsJ+I5YTP3cJ5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
 b=qmf3Xo7+pf7L+n/cKpS2HfBkb5mFopJsI0WwrLWPr9fScgOLzRrOMap/DLD+za048TKKpSc6t90pbfZ8XLyfMeftdJXG0RTb71TpFbRi27dq5hCepo20w3NdaN7lg9lak1BNqx3Z+qPnnwXSEaXflel0WWuS7+znTuIbCZx17Uhi/fuTgBJmnv1WsRYt3SfMS0ZosUjZAl66eEul9O+YQt8zewGoBSFMDspLfKzPdQVxQW7ldJI3oM/ki8TetengRDp96CoG4BO+Zkb8HOFXqRqv33P5YwKEtc0Tx7I9Rimwq/QtdO61J9u12T6DITalsdPEWrxTgP4NcHVc+XTtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh2VwnMaxuHROiFG6PONvispi6vNRPHKEJl3xTQpERg=;
 b=Hn9f0DGN8yNSfWDNJhvwvyapQ/sWzEsvYBXig3zuqlAuys3bZNLYBfCIOTIAF7JGWsk4IKcovEnBt/x6CzWKayC0rF9T3tozKnhgrROkMj/8QEJCwGu4KowN+nol9JsotnkeQSe25coGv2X1quVC832n9ipOfn0ziwma3hsO6B6roqvYCnZYjERDCxw+730O90pB7qXkP7jrV6Ai6vMBYLBGGsKfEkIH6cJJGJqNvJZrtUh/mjhhDuvkl6yGWzItsXc57Ezk5O4GTAWbFGqsT8ONVcWETVOjuQ66bbeGmHsEzWIDdgt/Q/3XYLXJ1UWcdMrUQldlHktO3hlIkeMvAg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 09:26:42 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:26:42 +0000
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
Subject: Recall: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Topic: [PATCH v11 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Thread-Index: AQHbax1qRzedOslo2E+O/ywYu9sdxA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:26:42 +0000
Message-ID:
 <AM9PR04MB8604E521D265E980E8E9E01F95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|DB8PR04MB7131:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e84d4ee-ff3b-4f56-c1ac-08dd39348d04
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?b5tqtj+LX9q87CGhQQeD2/r3xLrJlNuNfcyv4zvFIPky5Ni6anCARFvMwtOq?=
 =?us-ascii?Q?R9nK1SawMRuR84NjJFwKRkLmlW/mC7BW5zaqb+7Vw24ncoLAXvB+/4YR+dK0?=
 =?us-ascii?Q?1hNfpm70yxoOPWUQPO5Nd/XVsvdJPHk9ZUmgbUB1l4KF2KYImQRvPULre7s3?=
 =?us-ascii?Q?V1AnIn4v0YkqJ1Ri4j/OeqfwU430J9iooQoOQUB1PdQImgraoBuSsIwOcwPm?=
 =?us-ascii?Q?x51u5X8u/d9magCRh2XyTBSuz90d8GsTIKoQJmmvxXgqmnbS1zMLniMY7n0a?=
 =?us-ascii?Q?2Qe8ZjcPtahXZF0sOyn63Jbb5zIaZqLnGZFnGD0JxEvMKsEybQlEuA2nNxO/?=
 =?us-ascii?Q?C9tkT70tZvAECzNQqE8+r0jPwTelHcWkCCNwJTv+00IkT/OXJ4mlZQkLbO2T?=
 =?us-ascii?Q?oPVQ0+DK1Jb0FyCxqNZE8GSbOeDpVP50qBmG3l9XTgPbJDoZNbMzkY++DYqa?=
 =?us-ascii?Q?lytUpC6zmMVcV22WgJalBrhJSB90kBpdYxQv6nodQXrXO02j/1bie9w5pnfG?=
 =?us-ascii?Q?YjSxBkG2TDs2svQufg4mRW9Th0iyvRJq09T3d6sDm0KeWkpi57MI1ei+OnSO?=
 =?us-ascii?Q?rvXmI0oh3zz9eZgfwpp5QA7v1mw3PskjozENRa61Z4FdwvFeyH7hzJ8kGgT6?=
 =?us-ascii?Q?CR6MXKGVrdD2dLY2ugpVoHU0938hDTH0BY0XEyXXuG352psaaScWytoHODEi?=
 =?us-ascii?Q?9fWIcMqdG/4/0OBjN5qAuiO15j51SFPwW5Otk9rkUcBePk/CtfPjchC0wIRA?=
 =?us-ascii?Q?5OhHFN3Tfo2J6I9nzPZkiszaP0pZ83N0emiFzKHGWQ4ZmZ3q5l8e61Q21fiO?=
 =?us-ascii?Q?adUpybEsJeHdMR5tqAcGeGNz/Uy7tyPw5jHWR9u4LJISrYYR35F908xHEw82?=
 =?us-ascii?Q?x904bqf3SE2sGFG8ubFyL8cVLvDKbh/EyI3FwWrs5wFjsZVkqj66l5BUe+2C?=
 =?us-ascii?Q?6BvGriQ8dFCFzPCWcg3pugiVlu12iAznH08X4u1UaCoIM+3JHerGCyGoghI9?=
 =?us-ascii?Q?BC0ReeFXFrWyv8G6w9NUwaRsKAUMF3Jc8jY+0s/5ro2WLI2FO7WxGHfXk0Uq?=
 =?us-ascii?Q?eL8aCYbYpd9wkXTTqndUIgK9Hur+tqB4+9T/ITh56JvvhFR2ojSSgqzXcsVf?=
 =?us-ascii?Q?HT77PPRmjipPSUqgtdXz/ypo5wRjFJnuEQm/RBHxppWixi6NPQvjVKESHxaD?=
 =?us-ascii?Q?6HTs8I7VKw3LXhzQWd1QrzSgHBIQ+BTqNZ66pf2vU/u8EWQUgPqIIBhpzW/Z?=
 =?us-ascii?Q?oHboalWoYI7sSiFLcaP3kiW94R1P188pG+AqCeaUfc20hLB47jxgeXd5TsNj?=
 =?us-ascii?Q?YHtbqpyfPyve8sP5oE2WydBYv1BrKQCyIRomegOnvdYXZ+j8r4HcXTREAv4n?=
 =?us-ascii?Q?yiB4sGu0f0oeBpGXIbc1cUOq5eGD/CgRGMlzky19C600DoS4JHKeIeqY13Rn?=
 =?us-ascii?Q?vQH620fofnUutOdYpkDDEvie5Bl2BuyB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kDoB/+oUuzo2w+92JHA4OjoQkdapIcqUdQhq2uGEhJGkN3POCBl5gK8YTnoq?=
 =?us-ascii?Q?B2xvr6ftRZjYARbD+55xZ0z92fkfxhCA0PVqiYf0jaH3PZ+Sioq0dRehtwSP?=
 =?us-ascii?Q?O7Shvtk6GT4BYMwC0pl2iRzdNCNoWEBP1puqRry/jkljVNvrqG4ARaftnOil?=
 =?us-ascii?Q?7Fw/mOwSm+9XDS1Ik4lFQ7LT/H0vZy81djawRWIlsycnKO+KKxAYju+tDgem?=
 =?us-ascii?Q?+jKhSx0PVQqYDQhIyKeR7p8yOIXz+Q3qK6LLIAJJaneC2A4ECv88HwPC+ISG?=
 =?us-ascii?Q?ZWvrqxVPmT2zECgvwVkRQDcQa/HDisxFUAFcr+/5GPA8/xSW6sil8sv+2xv4?=
 =?us-ascii?Q?WCNPpR0/FV67Z2oQos+/0WaR0adn4IG8ypQoX44qqZs/bKpnC4WYBUd81AQ/?=
 =?us-ascii?Q?zUSIjx1pGqmxhKcVfkhFimVKJIss7/rAKzrY3zxqtF4l8w6tm28eL7k2l8vN?=
 =?us-ascii?Q?SqInMt7uuvsv7jEqnin7tQMYBFH3nMOuAcYMNB9iPHm3JpwNlOiYQuyBx3ES?=
 =?us-ascii?Q?bdJC05WNLK8xpxVExQFKjjTn2Gcjd8MbJR0IGahinf1J+VsZ12Zadr7qNyds?=
 =?us-ascii?Q?S1dGiCxOlugxrGfTWfipnnSJyv2/vNTU4l1cbXY4uuUzK+9nmSXRiskNrDph?=
 =?us-ascii?Q?Jm0fnl2oxTtDu8HKCDRODGDaiwIg/vcXKokdCWjVk2Bm15LmweBOczFIPFsA?=
 =?us-ascii?Q?hHWMFXvfuM6hyKWd28+FZd1nJ977SjrHoNEmVUL7iwrzK0WqSRiG2rn1WlWF?=
 =?us-ascii?Q?3zIrWQmK6D2rbcA899/hGsgGGzyHKPMrrxUnV5Si4tIr47ZByViIPMMw4CKW?=
 =?us-ascii?Q?Fc0h4CGqIpwKVHSDU9VAg1I1/9qZeuKlG9AXqaT9SsFJLNNb4y8x83YOscur?=
 =?us-ascii?Q?MAuQ03IFIm+tQQfZrArZmj/HyHf8Z7XA4pYFisqMe9mQ+pze8nZ0Yd2PJ9B+?=
 =?us-ascii?Q?vxOTyxh3X5ET5ES48ixGzCha+LLr4ATJ7CATKOD2kCEUAs4g7Lg/CSE7QXgd?=
 =?us-ascii?Q?apSIKNAcMUdV/uqgQuqkFxEeA0+rrIL1nlUGp0dVTI6xqr86jn7fyBoMDq5J?=
 =?us-ascii?Q?YgTLyNsQ9/JBFAXsyc5/ITkPMF/wRh0Bc27QfBDdU8uRTBWS+EUS3CmFC39n?=
 =?us-ascii?Q?MXrCkdGxw7cIqIj8mnvTzFuQDByMoXtVav2+C2bEESO8q9HbArSHHGbOiMY2?=
 =?us-ascii?Q?AA/UQbodj7e3baBXqWCDCLUCFBzflyVe/SAQ0lZx8LLtP3G6lSWVQ1eqvmlZ?=
 =?us-ascii?Q?rzZDXAK5UFxCShLFoPOHWmKK0/Mq7DC73s0Z1PCqnzpbfH4RXRTrRnquuqUJ?=
 =?us-ascii?Q?JyUO+sgRlQXT3J6hoKuCCpdvM0EMuctEOXSbQDOPU9maQ4xr0ICBZfQWycGR?=
 =?us-ascii?Q?iOZMwsBVz47BAjYVuHkRwZ6pc8riNuY/WTtVvEi1Vn0uOPzJxljEtcjy5ZVo?=
 =?us-ascii?Q?YQBFF1+pUzrzbsHKrRr6nq+VGhMO1Qk95yToduBJ5bpfW5coL2ybIHR5pon8?=
 =?us-ascii?Q?0YjzXrlx8NSDr1vrarfAjhhwWCMZx4LPyjtGtjDjB9jF3CgB4Z6T4zcCpUub?=
 =?us-ascii?Q?8ALArr4ey7va+owCLxVbKwsxAaizmfvPMpKg5U7w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e84d4ee-ff3b-4f56-c1ac-08dd39348d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:26:42.2869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azHM9wu/ZuYAA37sTYzc3gpnzQHEBPMPU9UkFGjd7bZwzXWyRqJSflcbuUAg6g+gy1/7M8bZSCDuUYmI1COBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131

Pankaj Gupta would like to recall the message, "[PATCH v11 1/7] Documentati=
on/firmware: add imx/se to other_interfaces".=
