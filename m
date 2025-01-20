Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A01AC43A
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365143; cv=fail; b=Wsnv2MDSIA6akYCr6ikLD/Vhn96IFxA7Em2lS2BzvKZOtFZSmWGrA32tk9VpBMevKFD0vllpIP86lfSyaESEBm+Ffl+5HFkzU0OSrR9AX+6yiAmebzJJNiyGZ8Ts5n8LD/nsSGdoh0LNCRec9ANJ8nAenOWzeo7UzI7+apKU/qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365143; c=relaxed/simple;
	bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kjVPQ+H9Pj+ZPDahdAIIrGn/lDxoCKXcDJMwqhIcyVcHslnhdJb7OjoYaun1XMthGBiHjMXF2hg8m4vhKtbghCk+6TCa2EG5TFoYUNWqLmSbNWhJhs29PiBmgbZa7Ef47yejnSdCQRwAqU5TPBbMDdIpQjEoUUBDvEpYX28x244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IHvmG4rJ; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IHvmG4rJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZCsBw/r0v6ocu3vXYILSTbkbqt4kN1bngc4QOxtGbIzn7VLKxIYvLF01Y3hdGFRHGjHg5if1+OrQAGX06TUGNcQxjioP/WlKx9tybGcVbMN+BB01BVKD4ScH2bPc1n4tbdyNbcsnZlvvB6/Vags8xrRWCgZ8B0nhnN9WfYMhHeCI4IFZvvPn8hRGwXyoWi+3HdU0qmUTS0LoJXA18qXPcbFtpWrZW7BU0avtQQgg3uwl4ecnOAVVroKLmzet/nuTRxHTHfwCW0rY0uJAFrf+3sdRzQDGRPU+pSv6QPTa1rZ728cHe7yCBjmZGjHuSJmO2S/G7sPiYCS9+jWCzyAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=;
 b=vlnE4RA9NlLaigiiuDZmGfuTsORXHBJYj1Tobc9yxEj3kl+KdUUYzTNrIdyJkonWtdh9aaUwvGUJAcRQUvH1lpGiyDd76hwoiUBFUOHU/Sggvh36aRbh+NuE9SrthM0PRvQgkRj9FGYYaCDbtz3eGHpbpya7WrnQjBuzq6PbIqdYMCq93RIbSClyiQxKq6qkju6ujChJI99sadFaLjwvn9DO/57CTLpBcPIlUmnnRy8TByg/zuUYx/SYvom2o6wn8/28z0oism2Zu64hpxVXGCTzK2bK66mB/tVQd3r9rx0DBmnhdoTj0p36HNNXdiqkIXRRbFEFhwlzt1S8MEBqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=;
 b=IHvmG4rJgH6hM3uRgcR+PGvccTewww5krJl7YzkIV4mfSU2bWLr82AccYoCSNrzyzSXavFT+GbnyDDyzYe8pQTh4zpJLVC+2SYKbZSJyqUwc84wSc4Lqrq7CeD8Rg1P7yGIY2ExNzvpPLRrvi88IUNnDvZjbLH+zxRamwhlBCKMXnPtkv6ExEHNXeUJ16ChpbcXS1a8nMRWw28Uboq1UKotb37uXLOrhSGwj5ObvVC80Wp6OBwlwSoQN0vfwdOmoCGUacdPUMHXQJ1Xy/M8ZuIL9q7P9DLlYyopQDeFCe88fbNzq1jQqVK1UqwQJGu81AWoKkUhI7TJ47oWCe7BuSw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:25:39 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:25:39 +0000
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
Subject: Recall: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Index: AQHbax1EWXZ6r7Sm2kSyd6nsCYpB4Q==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:25:39 +0000
Message-ID:
 <AM9PR04MB86043A3C34E5C38FEB5429F695E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic:
 AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f86e3621-4ff4-44f6-4dbd-08dd39346751
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RIFOZkEDzIPnQkIOisfFQ1ex+9oVz+1Tz6ihBr3m35LVAETzavJqz1bANeWg?=
 =?us-ascii?Q?Bw61kaib6eNEB1uWzo5AR0gApjE3wInPbC3e5Fn+S7+wLcIUek8mBYWM5Bzg?=
 =?us-ascii?Q?QCHkyiIlkQGmEKSMKdGPTKv3QLOwpfOwFgr3JMzEE7UGexxLkhZjX4lPwCrP?=
 =?us-ascii?Q?oFTTZ++7+zGrRr1ONkS19AVT2icIkV1qH0TkAATy2jkB0eZyTIJTapd3eDv4?=
 =?us-ascii?Q?nKMI/CuwvgAW+kioV09e0yNMkWnIwlm0BIKj/euVohx5u7rk3TWF5mYmdLGL?=
 =?us-ascii?Q?B2yjjc3ghkgmT/zHbI0T1dffHRUwBnxnL85DyuoxwQcvUUBSM+R4RneJ15Nd?=
 =?us-ascii?Q?SXdB4W15N0JCzz3fO6e5brL3r5/EUm9Cw5WFA3fQW03/H98lS9if0NmPM9t8?=
 =?us-ascii?Q?wTkswg72PNWE46Yh++dw1vKTBRjCQgN4qyWrV15+xTN6LgMJ2sPYPIPd9pMR?=
 =?us-ascii?Q?bhRKF01wN41nvZJAGJBlSDxLXEUxJe0mmrB6RyRxAZlUQs/e/0gVBzb1fmJo?=
 =?us-ascii?Q?zdBtv975r1xUIQ/i5CFM/meoq2FO46pvPBPeNWVUpyy8eeVPdlIPYJjbAeMp?=
 =?us-ascii?Q?2q3fMLMoiFVBJqaNDJL3vL8L01KYIEjEWveEynz65Xq4xqrTZfa8hOX3qM1S?=
 =?us-ascii?Q?7tUWPyvVZLsAlk2jYOxDzWKhXSu53YnGWTpFGFdKUFhS+BTpryhUJ8CVT6j7?=
 =?us-ascii?Q?HcSvwLyBvTXcF2W+lqjG9kOQT5FYDdFymONy3qBvnpSadvCoHbZxNpiea9Xq?=
 =?us-ascii?Q?xUrmhMGclkp9/N9Rzd+HJiUStPYsiSWP7tOvI18tH/79ntKjhjzNlE1eBc1w?=
 =?us-ascii?Q?T4gXTEcvbv9jg9P4mKOdDT4/7ps8TDrWo78XzIXghDsNvkRcYxE2Ji5sFNe1?=
 =?us-ascii?Q?qqlD+Fue01EUsoUuIq370s55BU4vwCsKXRcy1Jv31oeBs0eWg0FqANGXph/O?=
 =?us-ascii?Q?GLIvdovA0/dR6Pjl20J+Gw6s6xnYRj+4oShzQ/3YRlJua1yJbOH22aKYgDjk?=
 =?us-ascii?Q?Kihnqux7KTGfPSMpY2o3BZieQFIvCH3MZf4dWbDoHKom2A2QJJQA/tNrkw8w?=
 =?us-ascii?Q?ZfPwKnysuZJ7ePFM4Q7l6blDzJNyI/aGK5AKO7vOXW0pkqo1jz8N/+hkrcGo?=
 =?us-ascii?Q?IOjpHPJJE0P3cN9M11nEf5cZrCULMlGhcT58xdqO+XFGapNlr/YANyPGLSIk?=
 =?us-ascii?Q?EJ0cyFuk4LhhSWVoiv02CF22V8F7rQHiiFrrMZMnte5L/xZt9zPpyd5RDe1m?=
 =?us-ascii?Q?WdySHX8ou7FXLP43JVODhblOmjT88+7cYy0tMa4U+Q2uMxz9feRg254RAiO4?=
 =?us-ascii?Q?Kxehi+OIGe5ifTX98OAI5o18hGvgVP3dRDgB6ooP9SGTTGbut/WjJqcbfCeV?=
 =?us-ascii?Q?0pYpqhZAXuSlc7ULrkB6xOpHJjAejOAPreU/Jn7hmeQO3QKGP4CCd2mqh2zM?=
 =?us-ascii?Q?qmZOX3W8fhUWU5s05UhSmZQST5ZPjmix?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I++2R8apfj1KBlk3bfCMXO/zi7DxxE03bK2b4DEQQ+WQMMzZGlAWKSqJT137?=
 =?us-ascii?Q?Sl+I8Q1zbehtFV6TBjrHRHbFs+gsGJyApl8wNlabIxvGWASun7p6SNNg7svr?=
 =?us-ascii?Q?it44B8maQLAVXQFyPXObcPepgShri1ISxiDvs8EuAKfYR7vh/qdps2YFYlUn?=
 =?us-ascii?Q?8z4jhHkrSamHF4z7SiDOKIAp+kBibW9x8RLjcWJZv+1vYbCXL+MYm25IbBAF?=
 =?us-ascii?Q?exf3CQLpHCmO+MZNis4HhTUJbuQJS+5QNP07Gvx/4eq9DPl+z0QxSYSBcKOo?=
 =?us-ascii?Q?9955Ihtao5WqpnS9gL58eJiuSoadQXh21pyFel0KekuVAA34aXi80TVQPRpo?=
 =?us-ascii?Q?pIaQmonhtSNVsZ2AGmvFRnA88AW2eBaYRkocn4O0Z/R9GolSxHSb3ci1jnUl?=
 =?us-ascii?Q?ySSZi2KUp5q+EqId9tg4VYcmhR2L11/PqCbFW6tAUjd8T3rYsgG8y0h2MPCY?=
 =?us-ascii?Q?L26YXRktSeM89N9yP/0MDpg/zJeJ5I31bv6iNQVFBvCa04OYLZoeLa32pjW7?=
 =?us-ascii?Q?YqFF3EZhfMV4nPwdKfh6BRLLJyrSwaQFhudTCtzFXQLzbZjL8H/+XeYwApXi?=
 =?us-ascii?Q?9jKj0YvdGC41S+Id7s4xdDJXlQaDAJZMBtqt+n5QYx9jbzOfJ0Y66tKZGFl2?=
 =?us-ascii?Q?mxx3JnsNdirSTZF9DlwBfmWazzT0GmIjUrjxnHmFZUgpTQFLl5pBw+Vf144Y?=
 =?us-ascii?Q?NACkyv3lEe+kERbgxPKAU6LMT+l5nQNvEBKA5+A/aSG3ynK6QwHwqozfBb8K?=
 =?us-ascii?Q?K4+Q/SLQ+rxpFtp0+8WIej2I89aDyXfbgsqCAGY3eb6X3+5vvcp5+gPDlWF9?=
 =?us-ascii?Q?CPP48NFsMtbwzKbj/KpRETtbyXcar+l8cP5i156M1xUkK2Bl7x17ZqKLZQxc?=
 =?us-ascii?Q?CCjZvFdJlwkJssO56lq0ZpRny9gxyfgFBfObPw/5CqJIaqb4hBKCRtkohM/T?=
 =?us-ascii?Q?yNWTz5wjbz/qCuHo/TzTFK1rRUFI8DXpXv6df4uOuYRtEDVVdOcnRrAJRkqu?=
 =?us-ascii?Q?zX2op4lafP4aqzAUdL4IpPzvF2haSca7LFN3FvzZncc12bgcW1Lrrw3UHVSl?=
 =?us-ascii?Q?U1m+3glUHxcHvIPvEAzAXO4CR4F5Weiis0haF8Hn4qqKO4RRplsqF6Ot8JbL?=
 =?us-ascii?Q?WxnzjYhdc5k2MXXn38rm9ZuImm5Gmb07YwzwShyAVbvHIf05NCmksa03zQpj?=
 =?us-ascii?Q?UGuAJiaONBhqKa8Jw9ckZy6SLfGdryAxN8Pn2444A9iLUZHyuOE9dzS3WqkO?=
 =?us-ascii?Q?XbIuLFkxZPBtWT5Sy38hgpgjNI83a5U5ZGxjBdPRZaK9X0I0wqNrS15CJrZs?=
 =?us-ascii?Q?BTt799iJHFc29lteGMHuBXnhg14ohjGCZFO0EawfWVlk34wWFgmgnbQxp/PI?=
 =?us-ascii?Q?tOMpaV/Cw1LONTMhWXPKZ3wB/8X9mQuIRDXCICggxvrzl4l/naeV2kJmrkkA?=
 =?us-ascii?Q?dbFydOPeVg2FZkx+EUPDZCMEMxsnN0tZJb3YSdcEKzhq4WLRdMJm9SPRAAt8?=
 =?us-ascii?Q?2CSI1hAIQlITqR8gKkL1W+R9hNuN8sJnQ/9bSnsLUfHOZgiF9iie4awe2KRO?=
 =?us-ascii?Q?7JKVBApFRAj4BW/N1LG1vuIDU45G/gkIVaNXcK6G?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f86e3621-4ff4-44f6-4dbd-08dd39346751
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:25:39.0586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmpMdsW+upeWbM9l1YvRPSRgEa6a25V8AyGZCeFiXaEXU5Ae8mVlgaB/Z25QvgZbzKJ5i1BIz3m9Gy0CRxbD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954

Pankaj Gupta would like to recall the message, "[PATCH v11 6/7] firmware: i=
mx: adds miscdev".=
