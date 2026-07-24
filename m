Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF114908B6
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 02:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861239; cv=fail; b=m9qd32j/dhKpUuDUpEUHz6CyDN3+W60fe5wM29WXR2SGvu+s+sQUI2dX/A514Iz8d1RzyC9wH7fGbsbb48+YKUbLEz2PqgjsAL6FcYMyW+AMyFLk4sXgVxB1/52jgLC/NT2QFwF0XSOymKuYbatpFa5/k3q8DQlIIAVIu9aIRMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861239; c=relaxed/simple;
	bh=LAbJy02yYQPAW2+uF3jDwHiR1veqT0V3K2FRi89r7HM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BpjPQmt0MBoEGULeFt1ApUb1LR/58IJ3BMoRvRqHgBxSPzvKOCF9qS2NNAikYzGyAOm70rRtNILsKpmzEudoU84IRZXZzz3B27chYTCZe+pj+2z3OUzGiAKgABwYDc/5E31R/frd3HA6ZjuScJZRenjdPI9W67w+zme2xziUgTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c2of1D4O; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c2of1D4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBx4sjwsxyfFkpIGs7FKxkvvpCFB4uiozaUmdHkAf4Ced65Tk9w9CHnxL4ZA00tCp9JftpAM2bvrX+TrxJ9j0kHmpzapAtSW715VQGSTa4fQ0UTgMf9t1Lo92AIaWk4Gyfhg98DW2rE+aN0Nf8BhCDN4qQYCFzRdTg6h+pq/4oq0VJy10zQ39Ipp3e4U/djYyJaCv/SKMm/RE1nJ8hC699Hqimhxq6vrl2ofI+cUFvj9d90MZWLxUi8bM+IUOyBIAj48VO70McJaEh/tVl/GUKui6UbWxr3eirTT2itJo2f2Iyzu9A4RgGpG5lzAwK04pa5GOafx3z5hyZmGwJsyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKs6yZAKdo68Vz8Vx47L2xj8xWmmLrXDscx8QlGL1k0=;
 b=QEE9Qdd7mSlrcOFQms+ImZ2dheOSQPLZXC0g5K/wtGG1RCI4XGGr0KW9CruaMk8Gqwq8aT1QN8NYCQJoqx+8fFf9MhhxxIT2nUEarVOkNXrIFuqbwUoahFPAhEvDlpL0BS7lUTPhKT96SiCqibCWiQWGRnU9QDM2ZGNKUB9tRoyR00kcGnmfVLPLbt/thejO5AN3mtfwXHd5wBz0oFdtf68BnHiX8gdBJhYjjxrIiIU3tl6XJP2JI5glawHSqObf7yQ7n0udnPeh/wuuy5TgV7q7R4IQFmyWib0hrsrkz2ObMW823ZESeZQDNGPT2Oj8uU62K17oOOWQ/jWaC7JtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKs6yZAKdo68Vz8Vx47L2xj8xWmmLrXDscx8QlGL1k0=;
 b=c2of1D4OcutlP6NtIQ/zPDaje4ab1EnRc4+5LTUPq6amZALdu0pNU9hV5kzvhNzUJQD1bwxCBcx7yPwqR5aV13ip4Vf/ATMXbLPqBOF8YJKk1VuQim0y8v4qxdUNhD7TZvejWIBOgxApOu/pusF7j5BbvAaOn3B59O2yoLfVqCM/dCN2ENeeISIKQ1qnGau6v29tPsddxIoCy7aTBK1lq3TfQIIqSQT3bHkGH4QL/QVVJl6qyOr6q/hCRuUf2jyDgdNO6JtbhNLIwJs05S9Bx+oUJNn8iDqTlq5P3PcM6UzCcjGIAXwbXxOpWF49AaVM7reIcdkk9cuqfGHmZogHsA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7436.eurprd04.prod.outlook.com (2603:10a6:102:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 02:47:14 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 02:47:14 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "c.hemp@phytec.de" <C.Hemp@phytec.de>,
	=?iso-8859-1?Q?Stefan_Riedm=FCller?= <s.riedmueller@phytec.de>, Jacopo Mondi
	<jacopo@jmondi.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Bryan
 O'Donoghue <bod@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Thread-Topic: [PATCH v3 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Thread-Index: AQHdGoN5qlOe/SUYHUWhEKdkkuUHMrZ7SgcAgACsErA=
Date: Fri, 24 Jul 2026 02:47:14 +0000
Message-ID:
 <AS8PR04MB9080B78FA9B79A0805783921FACF2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
 <20260723-isi-v3-1-594919eae847@oss.nxp.com> <amI_5AqWpFCMwNhL@SMW015318>
In-Reply-To: <amI_5AqWpFCMwNhL@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PR3PR04MB7436:EE_
x-ms-office365-filtering-correlation-id: 6825c2f5-45c6-479e-15f3-08dee92dde0a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|19092799006|1800799024|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 xHTTIrcz+nUCqSlc7SUlm0pt161tklOICJovGzKyWqc33rI8mkC/RUyeb6ejs70oEAhnag7jPla3x0NsQXRpm+nwqUVE1UQZWSEcCAm+3Uwg2Ajj1e6NFtD0tvF8Ps3QjY9n2woWvQxJbwooHXU7dWpV3i+f3Di4P5RbUk6/qe6TEEzU3yzD+MAwiplm1tekCqmCCbbBpFrKjkcd57O6emNWBRJlqF89WoK0Ytvuc0LuU59Ndp6kpJofiIihH9tvSrkowQbvwq1e0x1IR1b2g34rZLWF5rscWM3iNcxuhoa7kUC/+/yvEomkffpfWKHfSBTFSqMAJZGyLAodcsBFyuKselRPtC6Fn57vijLkM4DaSqeKMfsO1qR/rZ/Bb21OvnNaQYpOWSFtOBDhkIP5cjZrp8Gvr1ktkmz2v8JpKqh+jH2PoV2vh2lgzOwUY8IcLRjzTStlohqIrO/5D2zGTcsCwenmkwcU2SNgF0vTtXOTtg1wjJV4RVPz/13q0JjGzD8sF/8jB2Kghg9nYiRrZOrTy0lteyQEK43WrINtyFEZpjZ4ymTHEqjO1ENKpo6OYHt2YyvJ+UifhCaqVwbfuxUj6i3OcBIDRn0Mb+YiJOW/oR/QlST7MuZ3rgfaujUTfRnFBR8BcZ46a4UaSCEF6EREJKksIq+uQq7g8qDamJXEV3UR1GLpGL58VyyPQHfEg50fYFPYUqTAGeCgfw+SP5ogf/KVXt4N4CAn46mvtuc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(19092799006)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YGrNmCpH0ZB3gLOwjSXgKpRX/ZwAqvXorz5KikTN/TjvadM9O0i001lJ8l?=
 =?iso-8859-1?Q?PB1IOUjHqF9Vgl3COMPObtBfXe0z7x8JguRZpURNsalRSFBynsZA3q6ofF?=
 =?iso-8859-1?Q?Rkyj+dBY7Kb9OhyXN6QKDm96m32zijU9U3j8JMVI8K+64IjH3jenKMLyn3?=
 =?iso-8859-1?Q?GcgDD/Xz0/DD2k1VPELbBt1HR6hBvFG7lMuSlPY0yTXR3IZrCW5wpgoNR9?=
 =?iso-8859-1?Q?6NiwpOO6HaUKXw6BINIi2ZtUBZ4hO83ddzqIiBHx/BFmQ7dkkqxOanLWch?=
 =?iso-8859-1?Q?G1eAqW4gNheOaLOtJvfy1yg6Oj7niXR8TgC2oK3aEPx4acuKSLDinXHLIj?=
 =?iso-8859-1?Q?RV7yjzRmXbOCTPjre05rSfYksS/DQZ/Na58tOkB+t6CanfdniMcj3KwR6M?=
 =?iso-8859-1?Q?Br7ImlzX2DlI7QTbi8QuKFxtS+i+zJI0Ykn9NkHP+o7axjIJK7fgCm8wSt?=
 =?iso-8859-1?Q?Gywo95rLAIwH6h2D57LdjSPBUdiUq1aH764aYjJTVrxvwnLAcd80TfIr4e?=
 =?iso-8859-1?Q?UjRH53q3zWyPDX8HF4TKMdmdtMHhmFhjBHkipN3dPkhjSbavQK4/bbliV0?=
 =?iso-8859-1?Q?GktKRImU80kid1M+Bqe4RqoWmUwKpxlRcdWnWAHlTTAXAKVGhlSi1jVaNf?=
 =?iso-8859-1?Q?QBHKS8AJjapXehzFf/EngCW7ECJNqsEoDghNZoS7jHCM+r7Y/8wtgeHMcX?=
 =?iso-8859-1?Q?CGImbhcSsFYsb8iln0u/qd2SHYO5CgplKm/WGUjxG/SIfWJ2/ifc4Pll7b?=
 =?iso-8859-1?Q?NZoXm+Q3UTszVx4NBcWDqlDhFdRlcoE1OMfBGiEWyCXFUh8dAc2mdiqDro?=
 =?iso-8859-1?Q?ZYT74A/stYLCS8wCArrMfQJquoEyRAwLBP+IKwLec95ga5q5N5mcmZpOfJ?=
 =?iso-8859-1?Q?CufmAR1dECKN75tRSEh9pp2cceEm7cCS46AWBGJyMggrZPfik9XqXqL00h?=
 =?iso-8859-1?Q?XCChsmxjty9QAAzLvDPXy1fYcUvdurTF5SW3D4W33dv74+Q298eRnbJFJe?=
 =?iso-8859-1?Q?/UjWxkjes4by20V+FAwgFTQdqpQqpx/gOvIwmE92NRsW6Tn990Tz+IKUjP?=
 =?iso-8859-1?Q?k62oGtNRfHb5H2oIJNJPdFPH09t3D/qPz7MPHIOjuE7sKtUX6iaB0wzlzH?=
 =?iso-8859-1?Q?7hrvIyXaN6pg9szC/PGdZeb0heLOKoU8zegO86x2BNNlWbqoI0yZHCus5P?=
 =?iso-8859-1?Q?qc74RM0nCyTFWUEl6FhPjym8vfdM6ynUFVRUK7EQ3hJZ7YFs8dJt9hiuwP?=
 =?iso-8859-1?Q?yAm1ybvEiVwOXvJWwR8C6t5LQfqq7MtLi030gaOgTZIs68pBrY2aQK9GBa?=
 =?iso-8859-1?Q?gAm3lJXFPL/cFSyeMIAeSHIuQdymgQ8vQayMseHlFUVeMJ2BpGRxEx3TgC?=
 =?iso-8859-1?Q?DbvGxJVVWPVv1G7ZPSTDJ8sUmzhBw036aLWv5fKmz8lUTgb7OviqtkZPmO?=
 =?iso-8859-1?Q?xB1w7krZgv/fxvXopCMIiQu8GZT29w+7bEpUzOhmvVPWFkSU3uIu1n+Omx?=
 =?iso-8859-1?Q?B3l3J8zM/0Otit5YpE8qx5uCdQNi7nDCl4p+KqLhnGYREFiyoN36mWndv5?=
 =?iso-8859-1?Q?+8eGAOuHDPPi0re2AbJBejzfcjBfOAUYe7XLHxSwPxo5rb/2VB1vsmU+WO?=
 =?iso-8859-1?Q?VBrWbaYVhrFJstcgj4XJOVOgc9RlHTUSXRsHLz3l4gPkclR5anv+q1CLhf?=
 =?iso-8859-1?Q?CSA7vVRiDutjv7P+1IXJd20FXHd5io5oaBr8pgS5kqXTXfMmg17PGLApzG?=
 =?iso-8859-1?Q?zBEcMjdTRp5CxGl7HgOrun2Ole1tKtaZ//50C6k+oVHcKc?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6825c2f5-45c6-479e-15f3-08dee92dde0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 02:47:14.0975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZcMVoVvwhT14kUCJSfL+t/3IaRw8e4Fw9cWAZ1/OURJaMcEiP3z6+f1dizgUvmWNj76wJ75QhFRiIwdH4gHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7436

Hi Frank,

Thanks for the review.

> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Friday, July 24, 2026 12:23 AM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> c.hemp@phytec.de; Stefan Riedm=FCller <s.riedmueller@phytec.de>; Jacopo
> Mondi <jacopo@jmondi.org>; Loic Poulain <loic.poulain@oss.qualcomm.com>;
> Bryan O'Donoghue <bod@kernel.org>; Aisheng Dong
> <aisheng.dong@nxp.com>; G.N. Zhou <guoniu.zhou@nxp.com>; linux-
> media@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v3 1/3] media: nxp: imx8-isi: Implement per-stream
> reference counting for multiplexed streams
>=20
> On Thu, Jul 23, 2026 at 05:16:37PM +0800, Guoniu Zhou wrote:
> > The ISI crossbar needs to properly enable multiple streams from
> > different virtual channels on the same input pad. Currently only the
> > first stream gets enabled in hardware, subsequent streams are silently
> ignored.
> >
> > The driver uses a single enable_count per input to track the input stat=
e.
> > When enable_count is non-zero, the code assumes the input is already
> > active and skips calling v4l2_subdev_enable_streams() for additional st=
reams:
> >
> >   Call 1: enable_streams(stream 0)
> >     -> enable_count =3D=3D 0, enable gasket and stream 0 in hardware
> >     -> enable_count =3D 1
> >
> >   Call 2: enable_streams(stream 1)
> >     -> enable_count =3D=3D 1, skip hardware enable
> >     -> enable_count =3D 2
> >     -> stream 1 never gets enabled
> >
> > Similarly on disable, when enable_count reaches zero, ALL streams are
> > disabled regardless of which streams are actually still active.
> >
> > Implement per-stream state tracking by storing the input index and
> > stream mask in the mxc_isi_pipe structure. On enable, record which
> > input and stream the pipe is receiving. On disable, clear the pipe's
> > record and check if any other pipe is still using the same input
> > stream before actually disabling it.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> > Changes in v3:
> > - Change from "Fix" to "Implement" as multi-stream support is for newer
> >   SoCs not present when the driver was merged (Laurent)
> > - Remove Fixes and Cc: stable tags (Laurent)
> > - Store input/input_stream in mxc_isi_pipe instead of using per-stream
> >   counters array, avoiding arbitrary 64-entry limit (Laurent)
> > - Use UINT_MAX to mark pipe as inactive to distinguish from valid pad
> > 0
> >
> > Changes in v2:
> > - Use fixed-size array for enabled_count instead of dynamic allocation
> > - Use BIT_ULL() macro for u64 bitmask operations
> > - Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
> > - Remove mxc_isi_stream_counters_alloc/free functions
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 66 ++++++++++++++=
+-------
> >  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
> >  3 files changed, 52 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 9bb4d430d15e..c07abdd6a1f0 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -186,7 +186,7 @@ struct mxc_isi_dma_buffer {  };
> >
> >  struct mxc_isi_input {
> > -	unsigned int			enable_count;
> > +	u64				enabled_streams;
> >  };
> >
> >  struct mxc_isi_crossbar {
> > @@ -259,6 +259,9 @@ struct mxc_isi_pipe {
> >  	u8				acquired_res;
> >  	u8				chained_res;
> >  	bool				chained;
> > +
> > +	unsigned int			input;
> > +	u64				input_stream;
> >  };
> >
> >  struct mxc_isi_m2m {
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 9f0231ca47a3..6bd61bfb15d6 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -335,8 +335,10 @@ static int mxc_isi_crossbar_enable_streams(struct
> v4l2_subdev *sd,
> >  					   u32 pad, u64 streams_mask)
> >  {
> >  	struct mxc_isi_crossbar *xbar =3D to_isi_crossbar(sd);
> > +	struct mxc_isi_pipe *pipe =3D &xbar->isi->pipes[pad -
> > +xbar->num_sinks];
> >  	struct v4l2_subdev *remote_sd;
> >  	struct mxc_isi_input *input;
> > +	u64 streams_to_enable;
> >  	u64 sink_streams;
> >  	u32 sink_pad;
> >  	u32 remote_pad;
> > @@ -350,30 +352,41 @@ static int
> > mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
> >
> >  	input =3D &xbar->inputs[sink_pad];
> >
> > -	/*
> > -	 * TODO: Track per-stream enable counts to support multiplexed
> > -	 * streams.
> > -	 */
> > -	if (!input->enable_count) {
> > +	/* Enable the gasket when the first stream is enabled for this input.=
 */
> > +	if (!input->enabled_streams) {
>=20
> The similar with disable case, if other pipe already enable it, do we nee=
d skip
> call mxc_isi_crossbar_gasket_enable()?
>=20
> enable() and disable() is not symmetric

The enable and disable paths are actually symmetric in behavior, just imple=
mented
differently:

Enable path: Uses input->enabled_streams bitmask to track which streams are=
 already
enabled. When a second pipe tries to enable the same stream:
- streams_to_enable =3D sink_streams & ~input->enabled_streams evaluates to=
 0
- So v4l2_subdev_enable_streams() is NOT called again
- Gasket is only enabled when !input->enabled_streams (first user)

Disable path: Checks if any other pipe is still using the same input stream=
 before
actually disabling.

Both achieve the same goal: enable on first user, disable on last user. The=
 enable path
relies on the bitmask to skip redundant calls, while the disable path needs=
 to check pipe
state because we're about to clear this pipe's record.

That said, I agree the current approach can be confusing to readers since t=
he two paths
use different mechanisms. I will unify the state management to use the same=
 pattern in
both enable and disable paths.

>=20
> Frank
>=20
> >  		ret =3D mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
> >  						     remote_pad, sink_pad);
> >  		if (ret)
> >  			return ret;
> > +	}
> > +
> > +	/* Only enable streams that are not already enabled. */
> > +	streams_to_enable =3D sink_streams & ~input->enabled_streams;
> >
> > +	if (streams_to_enable) {
> >  		ret =3D v4l2_subdev_enable_streams(remote_sd, remote_pad,
> > -						 sink_streams);
> > +						 streams_to_enable);
> >  		if (ret) {
> >  			dev_err(xbar->isi->dev,
> >  				"failed to enable streams 0x%llx on
> '%s':%u: %d\n",
> > -				sink_streams, remote_sd->name, remote_pad,
> ret);
> > -			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> > -			return ret;
> > +				streams_to_enable, remote_sd->name,
> remote_pad, ret);
> > +			goto err_gasket_disable;
> >  		}
> > +
> > +		input->enabled_streams |=3D streams_to_enable;
> >  	}
> >
> > -	input->enable_count++;
> > +	/* Record the input and stream for this pipe. */
> > +	pipe->input =3D sink_pad;
> > +	pipe->input_stream =3D sink_streams;
> >
> >  	return 0;
> > +
> > +err_gasket_disable:
> > +	if (!input->enabled_streams)
> > +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> > +
> > +	return ret;
> >  }
> >
> >  static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> > @@ -381,6 +394,7 @@ static int mxc_isi_crossbar_disable_streams(struct
> v4l2_subdev *sd,
> >  					    u32 pad, u64 streams_mask)
> >  {
> >  	struct mxc_isi_crossbar *xbar =3D to_isi_crossbar(sd);
> > +	struct mxc_isi_pipe *pipe =3D &xbar->isi->pipes[pad -
> > +xbar->num_sinks];
> >  	struct v4l2_subdev *remote_sd;
> >  	struct mxc_isi_input *input;
> >  	u64 sink_streams;
> > @@ -396,19 +410,33 @@ static int
> > mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> >
> >  	input =3D &xbar->inputs[sink_pad];
> >
> > -	input->enable_count--;
> > +	/* Clear the input and stream for this pipe. */
> > +	pipe->input =3D UINT_MAX;
> > +	pipe->input_stream =3D 0;
> >
> > -	if (!input->enable_count) {
> > -		ret =3D v4l2_subdev_disable_streams(remote_sd, remote_pad,
> > -						  sink_streams);
> > -		if (ret)
> > -			dev_err(xbar->isi->dev,
> > -				"failed to disable streams 0x%llx on
> '%s':%u: %d\n",
> > -				sink_streams, remote_sd->name, remote_pad,
> ret);
> > +	/*
> > +	 * Check if any other pipe receives the same input stream. If so we
> > +	 * can't disable it yet, so return immediately.
> > +	 */
> > +	for (unsigned int i =3D 0; i < xbar->isi->pdata->num_channels; ++i) {
> > +		struct mxc_isi_pipe *pipe =3D &xbar->isi->pipes[i];
> >
> > -		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> > +		if (pipe->input =3D=3D sink_pad &&
> > +		    pipe->input_stream =3D=3D sink_streams)
> > +			return 0;
> >  	}
> >
> > +	ret =3D v4l2_subdev_disable_streams(remote_sd, remote_pad,
> sink_streams);
> > +	if (ret)
> > +		dev_err(xbar->isi->dev,
> > +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> > +			sink_streams, remote_sd->name, remote_pad, ret);
> > +
> > +	input->enabled_streams &=3D ~sink_streams;
> > +
> > +	if (!input->enabled_streams)
> > +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> > +
> >  	return ret;
> >  }
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > index 16085f23bc0b..c0ec59856374 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > @@ -816,6 +816,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi,
> unsigned int id)
> >  	pipe->acquired_res =3D 0;
> >  	pipe->chained_res =3D 0;
> >  	pipe->chained =3D false;
> > +	pipe->input =3D UINT_MAX;
> >
> >  	sd =3D &pipe->sd;
> >  	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);
> >
> > --
> > 2.34.1
> >
> >
