Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165091;
	b=EVzQitzEIQHw0nSlWLeFIFJBwOrwyhkd48x9SDiEVKhOEhgwL/UduS6dFbMIj/W4ph6E
	 ReTVxd19VofcEjhdXkP1xXWjezU0rkcuQ7JK9iNYo32ykc6EfoPLR2eOJjzcrQhEOB9fa
	 utO1Puzcrq0sKBt5Vj0/sFK8Y88XFxp5tS8/QlRuu4CievYwCITjve/aDRUbZqLT1A3kQ
	 UN6+GItLKaUuiZZttDg7guFxw8FtYmS4IGMhfTrfTpM9gwabfAs6PWQr9qjWvIO1F9zZO
	 2SJ0SU9NrDgzRwjwtoUmum/ll2+po2+cX92PkGn2sMc7EHlZBNkq1y2s3qZnjN10wGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165091;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=;
	b=sDPRslghfZlusMl+LUJ9vpEfWu/AEJrK2I0uy1t2aOJgw9qJkXgd8tW6RdPkYsB8C5ha
	 xSNNt/oHn/nb5cVSIYm7phVTrTuRhgVGsUo8XCXjnFpHJzq5gu9WKg/zX3nFZ/H+i3MYr
	 UkL5itVXwmvQGh7EqoNCMeQelaM/2MRZ6ab/wIHpxL1Rj5TLW90mgOsKEPaHIGcTYfSBU
	 lvfG5HVMh/UvhGIRGu0wUkPetWbr0DC79gqON+oovdaJNZ+vLaK1m5ncMLDJIe+CFEfwC
	 ex90qVErJyC99Me/k9QkME3YtWdHQ7LGfM401lVB/j4FGD9GS1ciDJk+hXtcGHITmdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=cPOqurhc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.86
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021086.outbound.protection.outlook.com [40.107.42.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B7606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769B7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=cPOqurhc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEcMc8Eth2MHp6r625Q304fbVokCa5n56OJdU1EEGw9AOJNciWzMebwQiG5TPUfNtNErOzeNEjkcpdCQ6SLGnaL6zNKQ3toug+p6CEIC7F2zeB4MutMihtzdPM697Qc+wXpNZGczwRnIh9AgcYeSiAKmtWpMfWUgsvh5RnaXiswGEJp81FH16VekLm+7c4ZbBtxuDGibkpKsGr/xc3aeiS5XlakvWzwxkCjqvPkibPl0gu/i3d+nOB95TdFtuCodT+LErEB7M/iVJhrWafQjCFPe4xbB2yicE3khSvtRSZBkM14/QGjhSeWjapUpgsRLEGluGJm+PNpnxa7XcuwLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=;
 b=juBic4/Lqt4s3+hddY7dRp/UpFonN2rb+FBGoxwUZdQyobdDw6FAbg16KoMYARCM29MxE0wjSP+drLC+P34FGY5IHuTlqWOMZ42q9M247+QqrxNxMCZCEp2np6O3cI0tyDkCoBpx9Y4HCc/f7EVn8ShV0iwGMXrnppWbswPukSnWqBMu6dK2vXltN4MutXuE3Gn93fpwTu2wdPPxe6dc34BwLgmQ9/ZFkCL3RNeMVZpdwIx231lHJFL529Bh0N3suAsKp87rD/enr52e/lyyng0W6Fu1DbfhPDqE6s0d+ZnCRW+m0Lj17OA1xCDZm7E9kh7314a39Hook3Gj9Ay7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54gzJ0f1Iu4WoekbXINpvny2QXOKLI+uMBBubYVfK/s=;
 b=cPOqurhcErhHL4ZbitrGSOjBx7adUtgYsyU1dQT1N9trZdimvWI0Kv9eDI/STsSYloqjLVOXLB5K60HdfNq6p76VYYeILHm8QmCTO/1POXppdBXLFTLkrIyziHKy0lepWDrOe2lOFtPlzyIB53YvGdiorR03ZnT0f2G+f4ZH49ZWqNVVICAoUyJ3uyyL4c8kSqZb/qHA7P/rspf2UHjc4eGguoDcZ6nOzpvsF4m68FnF/DZXqUGz8T9DvehL+dmA75w2hWZjKIwDqLXnNxlzV0xHMkx9yb0FZwMP2z4pBN9r/1w6S4jkaDvYB+l+5WELFGw1pzc7ouBDCsUsYZFDYg==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:58:07 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:58:07 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com"
	<festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHdeARozyfnwPkovUOydj9BJXEYp7c100uAgADWJ1A=
Date: Fri, 20 Nov 2026 08:58:07 +0000
Message-ID:
 <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <av9XG97eKQ1gZCFb@SMW015318>
In-Reply-To: <av9XG97eKQ1gZCFb@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUUP216MB3514:EE_
x-ms-office365-filtering-correlation-id: a97609cf-aa2f-4a82-9457-08df46e4652a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|38070700021|5023799004|4143699003|56012099006|261022105027099003|261022075727099003|261021135927099003|261102123227099003|261021123027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 HMRPoZ83eBHGgLuRcKucja51kxULVkeLfbQYYOnxofiB47vKTiQZ3iYXqsgRVSUcP0PhrxbnjLX6WscpPxbxsBL07LOByN7fE2EQWIs6qHsKbbt+Stoh4U8Okv/aoeXaHDjS0fzGYZKbC8H5sUc2BYrBn8rZTgsBndRpxYTi9ewH0qNZjsVG9JgjG6Oz2CO1Wru/AK1/+xgWmeHro+242hyTPOjxSeTxsXlZeFbemwXeFDIpU3xlMluOEITwLq04x+mae7/f2MsPNW2IMkV5rqCb/xURNH+HBmidIhJ3+sNvn+GvoV9BNFXk7jTusW3+Sd345ee0iI0/f5FOLrvWX4ux2c4qZildiPUPPuauzHg7XHItKPPyuDX5dTrFRXPayrcYvEib6Gv+5fxGYbwaxnJkt8GatQdl6/XrPmmdZ3lxeVd7/qOFJkRnN3FtL0rEKqZ7DJo3RD66MtDgHnY0VNkbwhbx8q3PMpMUp0cvyts7bkQY3qMITqT9JSw+KreP7e/ypGKxFg5m7T8Pqns+2sXw01UoyYV9A+GhEoq3zorGo7Jve/n7VpS4HEH2a4Hjy0W9qS6KfjT2zCws1RiEB9xFj7H7YUrNiDoYP3s48aYiwLtVrgjUYkKKl+hljmJJnfg5lBUyxOu9uLhNbEzp4jkWFCGYJ3yw5jSx3KyPRrYwGxfAxr+ISSCNS/zvcRVR24Ekokumk3gExu6V3ZDdldxXrH9DdMEGS2jSWycA00E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(38070700021)(5023799004)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021135927099003)(261102123227099003)(261021123027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fpW7lhhbdCvIkYFE39b7FUFte+YXlfYPwjhkYP/ygYptVYeG99EYxkd02gby?=
 =?us-ascii?Q?+6eFkj++mTHCluJ9aFsbvSyJjFjo3xyOxsP7ygtQVsbS0ifqiSgvBmlU5Wfz?=
 =?us-ascii?Q?e8c2VGMwnCVmdYjxY/Z+frn9qS4Oz3DQDuIF8Vq2tspM3KoYr/uZ6gileKSD?=
 =?us-ascii?Q?+qtqxIms5xiKnR2k4SR5a41xUue6xH/Rskhnas/X6xJ3k/q51bXxGkOTjuXn?=
 =?us-ascii?Q?v78Etq/hLl9lDZCdOdUTc6bwQf1cHefSSWnNdXLvLNzmGC3WyURaCyS2xpDa?=
 =?us-ascii?Q?FjHe0OG2KkONGtP3U0LsUn3rlfKC7QL3lY3w/bQDJp1U8QB53eNZmintK6FG?=
 =?us-ascii?Q?w88o1lrayYsFhCg58+GGhbvZHC1plwIGt3tNfb3yIupgqV34MQv4G0PI5D/C?=
 =?us-ascii?Q?TQmT+bZQ7l86IOxD2dtCYgmOalCcHEoZWLQspHLknlwno9l3OIg/hRX+tc/w?=
 =?us-ascii?Q?BMK+OOuVk+yf2aQH2r47UjWy5bT6TG0aJlMBDtRpkXRvF84BgdRhodoFe0s0?=
 =?us-ascii?Q?YKhRtI+j1qpil/DTQ2UHs/arghQsi1/co5NAH+9BLzQDUXCc28fzX2fJwdWu?=
 =?us-ascii?Q?39nZlvSQqIKhQSyAhFSQpb0Kqqz4r7Aem1gWSiOuKNg+hqCDrTMf2sYPKiGf?=
 =?us-ascii?Q?tKsWjrsTkHIo+ST/mWSXpH+OSoHGbRG1XMNEh8QX6Wo8yeK6EGpNdrCmBSpp?=
 =?us-ascii?Q?IPRNOv9xLVFXVSZjciXgU57tm/Kg1jhHSRibdBSnetYl0jcK33stvPQKW9yk?=
 =?us-ascii?Q?uoF6hOjSITFap+UxiI4Aa3dfipze56DGbIGtXNTIbgYs7HsK8Q3qZWqX1WU8?=
 =?us-ascii?Q?YPwliDo8P+oV+02lG6cCpGo6zmmXg9uh07hOHFzLEUNEROiqLRojwhrhUkE7?=
 =?us-ascii?Q?dTvQ+Vb5RVBjZ4HIcr/e3vzgIx1suZeIJyYcAtGuWtxgWfg+OQMTngYU9a66?=
 =?us-ascii?Q?xj8q+P5icZjn3k+KDTuvWqSmGhJlcGv0weWE7xfCWFW2eyMgKuFhkRX2r894?=
 =?us-ascii?Q?x7LK/oDkh+DJhZ/67riT6V8RzeMkJBkOICtBUk68iIyODEGSUKZOV6F7uZBF?=
 =?us-ascii?Q?0X01/9VgtLJzML/zBUNmWy+8+qQgLhBBkzi2BvNURdQhWTpUB4UvRv8pdlyu?=
 =?us-ascii?Q?AKGkoQJAW6brJsX589NxU+MOF3O6PthZuONW2VP6nob+g2rou95zv8yr3KWT?=
 =?us-ascii?Q?1cNW+5pNyh8m/9OocB9Hro5UFuFtHZ15S865JolL0jIRSuXzK6cGL5MFgjby?=
 =?us-ascii?Q?g9oNUK6WqrVP5cAUGE484QTr+78StksWYonIw+YNwUMpmyLUmWR4ZtzNJZaC?=
 =?us-ascii?Q?o+qm2hVR0JJf7XejsShE/RiES5U4xAaKOO3SOrJHiyM7pZ5uGTlW+PFzuIOU?=
 =?us-ascii?Q?hwdZmqtJbnhSdqojpzjfq75XsYAhsT/Eld4zaRO86zZtKtCTrtdSCCBQi/sj?=
 =?us-ascii?Q?skGhlBQYc8mg9kMDey7kjJ8QXgHSY1xfSCeqiwnjy0kpQbbAG50m3RCyTgdE?=
 =?us-ascii?Q?quvNlnv/nSTD+zAgw6+NFBbvq1qMvThV56Clupx3KLQYTJ/0DZq7rj2HDDFx?=
 =?us-ascii?Q?BX1zourBR2hR6FjlC7pZory1hQZTWjnp0kKtLQ1LBjeRZDYH+RVh1rRbq/PK?=
 =?us-ascii?Q?t7qh6dhDd07DTKbELUOzsf/YMvfXIagSLsxZq6jtye5VTZ3saRdQdaS+rdsv?=
 =?us-ascii?Q?xyuaJxI2aXN65TMl7x2a+3Uo3ncP8DfpmMYzLRV6oEb95PYlgIocfrokyU8z?=
 =?us-ascii?Q?XXz3YlK6BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a97609cf-aa2f-4a82-9457-08df46e4652a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:58:07.2756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oi+eaebIgb6nWBUnZsqSVciHbFQdJTK3N6kTRFUq9jbv6qXQRDRIziMzcUX1n2IdfLTGiKm3PMno4AkHuoiZS+s+iGw3ljVAyTN6QdWqf2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 5:08 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
>festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
>ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
>driver
>
>On Thu, Nov 19, 2026 at 05:59:56PM +0900, Nas Chung wrote:
>> Add the control driver for the Chips&Media Wave6 video codec IP.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine.
>>
>> This driver handles the control region and manages shared resources such
>> as firmware loading, firmware memory allocation, and coordination
>required
>> by the interface register regions.
>>
>> It also instantiates and coordinates with the `wave6-core` child devices
>> for firmware and power state management.
>>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>...
>> +
>> +static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_bu=
f
>*vb)
>> +{
>> +	void *vaddr;
>> +	dma_addr_t daddr;
>
>Nit try keep revise christmas order, check others
>
>dma_addr_t daddr;
>void *vaddr;

OK, I'll fix it across the driver.

>
>> +
>> +	if (!vb || !vb->size)
>> +		return -EINVAL;
>> +
>> +	vaddr =3D dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +
>> +	vb->vaddr =3D vaddr;
>> +	vb->daddr =3D daddr;
>> +	vb->dev =3D dev;
>> +
>> +	return 0;
>> +}
>> +
>...
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/property.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/firmware.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/genalloc.h>
>
>order by alpabet.

OK.

>
>> +
>> +#include "wave6-vpuconfig.h"
>> +#include "wave6-regdefine.h"
>> +#include "wave6-vpu.h"
>> +
>> +static const struct wave6_vpu_resource wave633c_data =3D {
>> +	.fw_name =3D "cnm/wave633c_imx9_codec_fw.bin",
>> +	/* For HEVC, AVC, 4096x4096, 8bit */
>> +	.sram_size =3D 0x14800,
>> +};
>> +
>...
>> +
>> +static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
>> +{
>> +	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
>
>now use min()

OK.

>
>> +}
>> +
>...
>> +
>> +static int wave6_vpu_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np;
>> +	struct wave6_vpu_device *vpu;
>> +	const struct wave6_vpu_resource *res;
>> +	int ret;
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
>> +		return ret;
>> +	}
>
>Needn't check when mask > 32, if check,
>
>	return dev_err_probe()

The mask is exactly 32 bits, so I'll keep the check and use
dev_err_probe().

>
>> +
>> +	res =3D device_get_match_data(&pdev->dev);
>> +	if (!res)
>> +		return -ENODEV;
>> +
>...
>> +
>> +	wave6_vpu_allocate_work_buffers(vpu);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>
>devm_pm_runtime_enable();
>
>you have not enable clock here, so you need select PM at Kconfig, otherwis=
e
>if !CONFIG_PM, other register access will be hang because stub do nothing
>of runtime pm when !CONFIG_PM

OK. I'll add "depends on PM", as other drivers in drivers/media/platform
do.

>
>> +
>> +	init_completion(&vpu->fw_done);
>> +	ret =3D firmware_request_nowait_nowarn(THIS_MODULE,
>> +					     vpu->res->fw_name,
>> +					     &pdev->dev,
>> +					     GFP_KERNEL,
>> +					     vpu,
>> +					     wave6_vpu_load_firmware);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "request firmware fail, ret =3D %d\n", ret);
>> +		goto error;
>> +	}
>> +
>> +	return 0;
>> +
>> +error:
>> +	wave6_vpu_release(vpu);
>> +	pm_runtime_disable(&pdev->dev);
>> +error_detach_pm_domains:
>> +	wave6_vpu_detach_pm_domains(vpu);
>
>use devm_add_action_or_reset() to avoid goto in probe()

OK.

>
>> +
>> +	return ret;
>> +}
>> +
>...
>> +
>> +module_platform_driver(wave6_vpu_driver);
>> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
>> +MODULE_AUTHOR("CHIPS&MEDIA INC");
>> +MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
>> +MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> new file mode 100644
>> index 000000000000..96d67e931e71
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
>> @@ -0,0 +1,137 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>> +/*
>> + * Wave6 series multi-standard codec IP - wave6 driver
>> + *
>> + * Copyright (C) 2026 CHIPS&MEDIA INC
>> + */
>> +
>> +#ifndef __WAVE6_VPU_H__
>> +#define __WAVE6_VPU_H__
>> +
>> +#include <linux/completion.h>
>> +#include <linux/device.h>
>> +
>> +#include "wave6-vpuconfig.h"
>> +#include "wave6-vdi.h"
>> +
>> +#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
>> +#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
>
>If only use once, needn't define macro.

I'll drop WAVE6_VPU_PLATFORM_DRIVER_NAME. The core name is used by both
the child device and the core driver, so it stays.

>
>> +
>> +struct wave6_vpu_device;
>> +
>> +/**
>> + * enum wave6_vpu_state - VPU states
>> + * @WAVE6_VPU_STATE_OFF:	VPU is powered off
>> + * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
>> + * @WAVE6_VPU_STATE_ON:		VPU is running
>> + * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
>> + */
>...
>> +
>> +#define W6_VPU_MAX_NUM_CORE		4
>> +#define MAX_NUM_INSTANCE		32
>> +
>> +#define W6_VPU_POLL_DELAY_US		10
>> +#define W6_VPU_POLL_TIMEOUT		300000
>
>Need unit surfix

OK.

Thanks.
Nas.

>
>Frank
>
>> +
>> +#define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
>> +#define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
>> +#define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
>> +#define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
>> +#define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
>> +
>> +static inline bool wave6_is_product_w_series(u32 code)
>> +{
>> +	return code =3D=3D WAVE617_CODE || code =3D=3D WAVE627_CODE ||
>> +	       code =3D=3D WAVE633_CODE || code =3D=3D WAVE637_CODE ||
>> +	       code =3D=3D WAVE663_CODE || code =3D=3D WAVE677_CODE;
>> +}
>> +
>> +#endif /* __WAVE6_VPUCONFIG_H__ */
>> --
>> 2.41.0.windows.3
>>
>>
