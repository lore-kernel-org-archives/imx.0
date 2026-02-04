Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E91482E8
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770170575; cv=fail; b=iLyafej0wxXfGqObCVIxSr5k/N6go0p0USKzowS4Ku9MFgemFvWNTeY3ILcv3GxRwqAoFLfWCZZrR1aNzdoLoLvdITZGynPvvx41pKStPfWO3KHhfsM+bYZuJwvZYAhBpTcs1mbOvTKALLdLCp1hN/oJs56s1jl7fGisW9OTwx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770170575; c=relaxed/simple;
	bh=Ro2iFpr/N7yDt+rbLTKcVcDbe1B/vQSv3COCpwIxYfU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BiMtSdunlVeqCmEHFNzMWFrpcvq5esHDndfhXXcR9VFBbL7qzHXhBBjER1FFfdS6qfgvXFGMcDROM4rrQGrNBW0KSogoGIlRdY76jqRfn13brO2217aKduDW+PY3JwJQeVN257ffBhHjGokOVvr4AmtObY+1pJLc99Ym/Rnmqa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mswOt0CV; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mswOt0CV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9/XKZ7y7U8Un7TQ6uQlWloqX+UQfQir7lucSoo6GJPoIkLQSCnSdOy7yCb20CxEIrzse2BJQFtDFXyfsP11iLkm7W+LrwtDbDbtlaAibhVrNJliZ50mQg4w7RQuzSYcgGDE+ndl0CZBVr3Ve18djbgZaukcM3x9yFv8dQiRrvaSJoNcfp3XwpiIJIgdjSRnAdZzWk7LvAFdvxrthrz/bkQ0YhASWlKj9p1c3WA5hL1xf2Y/a/e7SbhcSIQgg1UM1sd1hvhxMOrpgwgQ41ApdoFybvz+Tc7Sbl/STMLgfUfewnlRMtT+ongsBnykKwHkd5qlDNDfpQT4jE0yk/3tGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oO5abzoVbrJAzu54E5lG42gJDyHL2/sRn0oMc0i0SI=;
 b=f2VBsJKXeueOzJFstlQcvIpGkote59OtvUOSwNrt/cDGT5Uw43DsodaeMgnzt88GgDgl0To4aU7pwIgwC+dY/62eD9Fq4w7DM0fBPp3UB0giLKimtWX9nUemwXHSp4R9yRIV/UZAomnfzidPSQNwjhtfY0HBE0sjW6JBMJg6sojrbQOHNusH8dFtGo0dVBKm1wYI6648ncbl5F4lBiDpnmHtwhBVo2s/dePEB3Bwlc+4x+F8uf07y53D9EeYCT7TX+Q2CEJipbL6boqW6nUI40dQ9nu8tbXQswApTEv7fe4Yf33JWuFuYRDC7+xU9GXJEoRXcz2hTQUgP/LGn5Y4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oO5abzoVbrJAzu54E5lG42gJDyHL2/sRn0oMc0i0SI=;
 b=mswOt0CVczIXQFW0DlshhEndw4ZGrUFC8JBuWiIL8RCfyg8LH6bkpW7Sn06AJk4mzw/nepnKC26mlCc8X8NCvI7iRdCwZqRcWZLSus/dZoRhxxErxqSC3e/zytFAspoJDXqbM5Et7FFZFqEfFJ/SaXSBt/v8UVjLWJN07pFz1kcaDsCTGgk6u3P4IYdofGgYBNGw3CX2Xmaxd+faz32CIlQusIl9vQ0V3lHg4SkcNkHplH4yJS/Zb9z+M8azvfcxfvrY/vo/BnnCiosHAtefyGsrxOlfB+6QYXNlEAQPRzB498S8m5gndXKn0VL/NEXYwarc7xLOzwpF1ZkpCuDefw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8101.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:02:50 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:02:50 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V5 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Topic: [PATCH V5 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Index: AQHclONCTp6Qq0NWX0SPerOYf2VwM7VxNnOAgACUNNA=
Date: Wed, 4 Feb 2026 02:02:50 +0000
Message-ID:
 <VI0PR04MB12114D842524F3BC8C5D4F0B99298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-6-sherry.sun@nxp.com>
 <aYIsN90NALJuw1ly@lizhi-Precision-Tower-5810>
In-Reply-To: <aYIsN90NALJuw1ly@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB8101:EE_
x-ms-office365-filtering-correlation-id: a4777531-c117-4684-50a4-08de6391800a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?idfttllCAJamOZVCZyEkBM7PAwsWa1hqoBloKnrjrSt/1+sx6N6fggIDCmSr?=
 =?us-ascii?Q?2wzCr2AttVG8kHDyAFPSJTQgxxfSqf2cr6cvrB0SUDtTpB7+7F1jnD4GzBWw?=
 =?us-ascii?Q?ji0b4JckEP0qg4GqovaEJkQo+j3PSpwb0rGqsu0Rnmxy04wQzG81CM/betRd?=
 =?us-ascii?Q?RFCM4+Cwc+A2wDZQmeEFwTJcChmKoMMqO/jARPc0z1r4ZlkILaPgUCvad5kP?=
 =?us-ascii?Q?L6t8JifV26aEjx9kR9h5AAZLCAKkO/1HmrtUnpSSlJecXHoS77QAQ7DLnfTD?=
 =?us-ascii?Q?GXmrfConDONNDWoBqUuM3KZqSpkuth2XiXy439qomQtClvn9ficbaGXmZFpG?=
 =?us-ascii?Q?UBtMEdYU3xrubVq1rY3t2U3+GYPUVkzWSEyD1HJeIZ++U9/LrIs3QERIYUWC?=
 =?us-ascii?Q?vYSDcjtOHiQ72GM5tzZdhXiLAN5P+aWnywfVCWbD15YyIK80PtLNcE6kBAmE?=
 =?us-ascii?Q?wyAQeT478foZiVHZoeacF5lIe130neprDM/Og6PpNSvg9ij3+MDAElb/unDh?=
 =?us-ascii?Q?/6IKsCdsVTELSHJWbhxCodPZ8d5pVJ7nVoQ1tGgI+3li/Nj3EzaU4QMjov8c?=
 =?us-ascii?Q?pTPLLu/pF78xWDxU2pW3sKDvHMDpaq9Q9GctW4rhbo6AUNFa0HFP1cx4nS8V?=
 =?us-ascii?Q?DzhduaQ41OEWpbvnkCnpJJXmNZdUk7w3nySVy5DDBd42QmXkwp+feYMc3+zk?=
 =?us-ascii?Q?LTx6uCSSXbnYxa0Wab/9gSVf3CGWiFe22f1dMRGXREzlsC4I0wGWC6vfEE1r?=
 =?us-ascii?Q?h+ot8i9u7tZSdfAKinK6+mfHwYv7awFR9c2ANtEYjJ9mzEx74wsPQgpbtGTz?=
 =?us-ascii?Q?YEskMISHMc//s6hbyoOM4TBC6cTbm2GvAgN2Yo8QNp+9V8KWe7Vdblndu0+B?=
 =?us-ascii?Q?5VszDsBR+KSaujt3gurmGswnPbhhKBVKoOpYhQ81fPnLib8aad/05TYyJ2P/?=
 =?us-ascii?Q?bvrR8LmskNNfxk2SQ9Egn68T0KVRzKvY8uXj3wd+FH1gHaI3RCWrQZi0zNwC?=
 =?us-ascii?Q?4YdDhueIEs1TUblkmw/QBcbbIKTCEzz9fwD6g5qCTSNsOwcvK8diyVTYmiKu?=
 =?us-ascii?Q?AgWAA8Xyp1D5rB7nXQGyWz5nbDW3eLoPiqiQAN7/GHsFdaymukOtN3AKxI5i?=
 =?us-ascii?Q?tLid6AEJ4iQJ3nufuPY4EkESvF70ZJ8W07fVnb4q69j3drms8/X9/X34NXoV?=
 =?us-ascii?Q?mewzUribyZTjIPWvZtx/W5HXA0W6eMNlbIzc+QILLnpAQFAkivsW4/Oj+Dtq?=
 =?us-ascii?Q?T3ySVEzBcfz6jCt2UbsVL2En5D+QYT7248RLTVwRfr0ED2kwr+iytNCGzuO2?=
 =?us-ascii?Q?b2sJ2uYkB1zzRN4UI1722YnT65hV0Us66cjEmTQzpiNouV8YtYN/5cDQA0TD?=
 =?us-ascii?Q?2qGwzJM6Px39Ts5FSlbikN/l5hkixXlVt3Bg48c99jMPTDu5yztCvWqK9bT1?=
 =?us-ascii?Q?EJY5ZYRCWijU7jE4Ab3jis+qCmyOvP+/F5XeF9F6pMy9WLEqaKr6NzHCfAjC?=
 =?us-ascii?Q?+1sRN8YCYsgP3AeaLvBuW3QLEI7wv0Kf8ysqysv59FHxJju30h1G3gQE1sVh?=
 =?us-ascii?Q?QJSyyapcbTac8hBaNTG9yZ7OJcpC4VHS43GCixxe6hXC0xAtEa3aAHV8/Jnb?=
 =?us-ascii?Q?FpnfgzstWY/8FhMdEjU9jzk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xYUnz/suqb7cSNJf/caUHnUUdyE7U13VdJ6xBcx4+QPxuZkTkAqcdiF1594u?=
 =?us-ascii?Q?ixGlqvmokYDGFuRcshEvqgiXelXGTc/1LxCWk5cPwhJVUnZDd79lGerjsDmY?=
 =?us-ascii?Q?lgxAbyR4zKB29zbaunLZn6eR7Kjg+nPJh74T94kIo59sDH1C45wZ4ILrs0XS?=
 =?us-ascii?Q?L+MnjYFqeG1awus4Q7U/C7LlbqSDWuibMkzkdP3ShfT21psVixPx17YnFDkx?=
 =?us-ascii?Q?3Xie+kgETULhb98ydeZqp8W2qu69lzC/pehhrQ370ghCelKHSFqX6DJbXXoH?=
 =?us-ascii?Q?tnqK40JpCEhAC228GYz+r/c1F/8mz9XWF4E+toT6yj7xdNxKO+IMAlsPVm4l?=
 =?us-ascii?Q?Z1KjIG0DZ1UvD6svhFfUeBh/zoCvLzllSV9b20PAlwxtXchGfra+go0NuXJj?=
 =?us-ascii?Q?T+YTYszuCU2uWSqfxeZuGMdt4FofmXCI4wDtX3CZS6oZQ0obILdtEblvXWuz?=
 =?us-ascii?Q?h7acNEmkkQrP24TtcoX1qqTomIBypwIUSM6HQ+aorAconIk8lW6U+fnwq1lW?=
 =?us-ascii?Q?+h0qZDLiVNme1ytIjgxI01RsSAAajAkGmxu170JGhw+0FU2Ki12z2slo/PrE?=
 =?us-ascii?Q?KznGipgZsioCIyM+MIMjzmZcW0CSFuDrSuKaAcnlBZRMOnjzbH2a8iKT7m7Y?=
 =?us-ascii?Q?QJRWJkO1blhDDPSw+ETWnjQGhylukCNgMynM2GoOLGcJtvAjhRQTMgMy4s7W?=
 =?us-ascii?Q?HhKmIR1YZO5mWalmelX8MJAETPZ8U/+uAKHFrT5Pi45bjNLtKMPtqq4aRkVr?=
 =?us-ascii?Q?p0I4OUxgiJBoP4Xtf98GVjnUtx0cxcYhhRsmTubLpgMyAJpH4dHmMAxakbke?=
 =?us-ascii?Q?zH99iEA9in8Fls3Z+YA0LhoAlb3Hn/qbf93HWVAag2t44o75ThiSXvYijsbp?=
 =?us-ascii?Q?FxnVLO/Z8PBIaElnW+Zoj+t9p3oNgci6SfGegVCJKyqIzZJ6qymI6MhLar3q?=
 =?us-ascii?Q?q1SK3qhoQRWgIGUygcnKSrTI9ZHQr/MJ83BtXDO+6GnoKRVLpHbS4gwvvmHy?=
 =?us-ascii?Q?xUOPy+0PhPL/AM9TdfN9iOewIZuyTYWHsp6VDzUb1iAgpH8QJ5yAqwjUUauQ?=
 =?us-ascii?Q?rcVvgG9SJJ9JL8gLn7p8tScGmxqhoUQuLiU8bW+p98G73sBgG/08nAVXp6gw?=
 =?us-ascii?Q?uzaTAVu9ubkAya2DddC0X8rY9F8u9aIe6jHaqh5VP4tRBdyOIDBWFwzHx3vk?=
 =?us-ascii?Q?vBE/NF80GkvpOfU1cYjChTMg0WPnmeJE9AO25qQTwTSEPKQP2qXQrOybBu+b?=
 =?us-ascii?Q?PhZNiKYO+mjwf/ExhACZgL2uW/TBIPJgpWSweKkg8OM0mNYbYGj5do5dYwdX?=
 =?us-ascii?Q?6RmWpCwks+MW+XkIGtdEdDuUVTm39FrCGWYC52rpSJLakmBGIPEFMYXSS0rq?=
 =?us-ascii?Q?GOhOvPUPX1y32owH/hJG+f5YpyuzYboPMA4yTXimJ+Sz5QE6SzXkMTdmfmuA?=
 =?us-ascii?Q?3cXEqhC49qWMmLMP6ccy8tkN3LCuoRvEipexre9doWscqRnHh0zyDRsLnODh?=
 =?us-ascii?Q?Ke/TcDOxyN6zdun3rcZ+zOIlSnSgF3dC3ooIeNJB+PDjqWBs2rIKq3TghEtG?=
 =?us-ascii?Q?c/kZwBe/htK8hitsh6mejya/zkSnoNLg/+DZUbZtbKS6dnM1xGO9cTEledaK?=
 =?us-ascii?Q?95FRIv/eEfa+Wgv34wEvqFDirsxnWToFLuE8qm8GY7v+EsImxB2hZub2O7fK?=
 =?us-ascii?Q?0/fJooahgeDpJLTMAoap9ewI/QlcvDk2ehnIGJcai8ugIx6R?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4777531-c117-4684-50a4-08de6391800a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 02:02:50.2541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: go01AqNKWbGR9QydzIO4vv9xaqG/56R23dWPKTh32H3YpIFTVJX0IfRe5qNXpwLcn0aENg7axOo1weArpYMXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8101

> On Tue, Feb 03, 2026 at 04:01:37PM +0800, Sherry Sun wrote:
> > i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> > (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the
> > i.MX93 Wireless SiP basically reuse the i.MX93 11x11 EVK board, with
> > some minor functional and pin connection differences. Reuse the new
> > imx93-evk-common.dtsi and add the board-specific changes here.
> >
> > Here are the detailed differences between i.MX93 Wireless EVK and
> > i.MX93
> > 11x11 EVK board.
> >
> > Function differences:
> > Function	i.MX93W EVK			i.MX93 EVK
> > WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> > MQS		N				Y
> > PDM MIC		N				Y
> > M.2		N				Y
> > RPi 40-pin HDR	Limited support(pin conflict) 	Y
> >
> > Pin connection differences:
> > Function  Signal name	i.MX93W EVK		i.MX93 EVK
> > WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08
> (spi3.PCS0)
> > 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> > 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> > 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> > 	  SPI_INT	CCM_CLKO1		on-board IO expander
> > 	  NB_WAKE_IN	PDM_CLK			on-module IO
> expander
> > 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO
> expander
> > 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO
> expander
> > 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> > 	  PDn		GPIO_IO29		on-module IO expander
> > 	  NB_WAKE_OUT	GPIO_IO14		on-board IO
> expander
> > 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> > I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> > 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |  1 +
> >  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 23
> > ++++++++++++++++++++
> >  2 files changed, 24 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 700bab4d3e60..8837d7ec4f3e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -439,6 +439,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx93-tqma9352-mba91xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxca.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-tqma9352-mba93xxla.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-var-som-symphony.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx93w-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx943-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-frdm.dtb diff --git
> > a/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > new file mode 100644
> > index 000000000000..9832b82b6ce2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx93w.dtsi"
> > +#include "imx93-evk-common.dtsi"
> > +
> > +/ {
> > +	model =3D "NXP i.MX93W EVK board";
> > +	compatible =3D "fsl,imx93-wireless-evk", "fsl,imx93"; };
> > +
>=20
> &lpi2c3 {
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&pinctrl_lpi2c3>;
> };
>=20
> Although it is small reduntant, it help understand how pinctrl_lpi2c3 use=
d.

Ok, will add the &lpi2c3 node here, thanks!

Best Regards
Sherry

>=20
> Frank
>=20
> > +&iomuxc {
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_GPIO_IO00__LPI2C3_SDA
> 	0x40000b9e
> > +			MX93_PAD_GPIO_IO01__LPI2C3_SCL
> 	0x40000b9e
> > +		>;
> > +	};
> > +};
> > --
> > 2.37.1
> >
