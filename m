Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488BE2629D
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770088803; cv=fail; b=F00Dny5rdmq2hLmGFPqclPxmAIK/RdJEEJoque0GdhdJUCAPugXrMcKH4vtKjxuWzi0kTCQt5S/FH+dLsAcpRjWzuW5mTN2zRR0SI+nsQ8YL9s+wLiKqJqenuJQWrFJdjAIfUrtC0V4zuyU6/8PEvU8jCFn/u79P1AttPJ+Wlh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770088803; c=relaxed/simple;
	bh=jEB6YfX7mLL4qzzPTCE6tYR42tNj1gvzI0+/hqJXY8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sHK8RxbEbk2ZNicUbP+aYMBHZnGFcld8umj9WgHLSXJ8ZMGt1eDGPQSSs2ulr4U8WfcBbm/hHttjmF7S0l4ssbU4fk5DxRv8G/0KrPWY4pHx1iwoucYgSdifhvICz0VnD9h/UhxBD7S2pI+krqKd6CCG+x9vC8tTFZxCvay6VNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WOxnwLB4; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WOxnwLB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqOY25DkWaUecmrVfJmpttvMENjUdTDkYspiP3Eh/+fkv092bQ/glrUw6DMxEkZ2PW6GYH0fCrY24mjkTi4K0Cz7nAEJP2mCerBRXcvurJiSPiuAv8apOs76ixTpLUPBT6YY0UCXvFYGZcmFXLHPMBl1CE0TSlZVAeAOmWCTp9hyILYFJ85iNC6/LFh1LfGFxMxHm4b7ofHroYNDydOEfJU0fOrsrow/12557tKPAtL6pLEu9Mg8YCaQSsN4H65nflrh4/86YOUUPeDg4T8AKea9AdXJO3lHq1AhFxF7XnLXQAmDmteWC/UzdD0qP4zBJ/uTb84TGdKbYg1Xnc796Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7bqJR4ycAUwe6aD0FzxNowqXV6rCRrarfIoGWEV+rg=;
 b=OsplwQ0ppxa8FLn7P00o5JjqF/Nq0VypoKa6TfBsyOCnJXX6aHSm/0lYG9DREtvrHN1Pe8z9u0O2yQcIsegVyLhUPeKPZ8Osd7JhyF6bw5Br2rdL1GimPlI/bEOjq7sEOLs+VtLACSVLUbdHqboUVnC9cgPaVxRSyOZHJxlMDUY9yYjD+Olw8eVxPOKVdOpFCkZPa7xki8gVvQQwc4dzwHusnFfAV3YdnuIOHsCGSFmYAxga/lg5cylYIo+dUXEY94OnUWpQh9T8/YIjWGDkmY+B2RM9XlTNOm2XmEN4Locdg8cugcqSEu734KULLSgjdc4lzK1VzI0mrjnDgSY0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7bqJR4ycAUwe6aD0FzxNowqXV6rCRrarfIoGWEV+rg=;
 b=WOxnwLB4j1CG2FoJzy9W5q5LBdYy09uvVByUhaOOs30pM2gQ7PDO8z5oMjHRnlLCV2ycv0dJaSExcAJkdBsj3/9QazlLnVp05hgsIw2Hhhfb05nHR6qM5uQSlmHvlGjoDMNYWLAkOvyZMNwddVJI0JieXoKlDy/srpzFplBMB4fkfyDq/k9YpHY6iHpWp8OCcgaRJFT93OxYi5BpaDpRw7f/iX2/vY5CAlEQurJ3t1lSXfwXHkrj65dT38T7UIETHKZLqplHmqCNNPsXwQq4SIUOc9C4QlaiMXBR7vAmuJA7oYnT0uQvIjrJpt3qXe1svR5qcWXQRh92YG4SQ9xpgg==
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VI0PR04MB12372.eurprd04.prod.outlook.com (2603:10a6:800:321::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:19:59 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Tue, 3 Feb 2026
 03:19:58 +0000
From: Luke Wang <ziniu.wang_1@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning
 step for eMMC and SD
Thread-Topic: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning
 step for eMMC and SD
Thread-Index: AQHckPWiESep4LyrVEOGodWo+VUFiLVuyViAgAGK01A=
Date: Tue, 3 Feb 2026 03:19:58 +0000
Message-ID:
 <DU2PR04MB856744B91B373FAE812F7A29ED9BA@DU2PR04MB8567.eurprd04.prod.outlook.com>
References: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
 <aYAcm+y5wkXtXq5/@shlinux89>
In-Reply-To: <aYAcm+y5wkXtXq5/@shlinux89>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8567:EE_|VI0PR04MB12372:EE_
x-ms-office365-filtering-correlation-id: cacbd37f-04c1-490a-255a-08de62d31c67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sUq+az8lcYgb8CZ2FGyoJKUX4HodBOUGfTDJcrc6V4YpzyaKBJZfpvoysTv7?=
 =?us-ascii?Q?6UQhv232XjMBctg7mlyxPjVBQt3S2wtwIqhCcWEVjCs7QGgDpB2hll6WXnau?=
 =?us-ascii?Q?va+AL3nbDFJ/+cifXgMG3lk5TfNIhd+bfgBhY1FS/KnqqP5gS/13mxdY0bZs?=
 =?us-ascii?Q?I5PpGEJWI+L7DOxcD5SfPbNnN/f/fOuR7jXVh9tKXpCpZUkPJXTcOshHdDJ+?=
 =?us-ascii?Q?IknYcR+Kd9ztcG2hjII5o9GFFnlUkUocp4sn8MNd60QhXF06aS9lWaTfImxH?=
 =?us-ascii?Q?3cPrcq8T4sJPj4XaMGHy9gkAYXAcCZjkLYe42Cugd2IR795/zshRfUQmNeMo?=
 =?us-ascii?Q?VeDv1GcTo4RHVn/cWtL1424/ms3OjqgLxi+xdHmujBTB3UbpMfskJ5bTsaHX?=
 =?us-ascii?Q?2ZUiXgqOEl3G2VkZZoPkbpvTkfvxIRf9dwdhanPADIkJWvl1uXgPVjwgYg5V?=
 =?us-ascii?Q?HyXwMp2gsss4U6exBkToy7if41w0fTKq3+vbdTnplCuO1fQ1/A7Izy8F94Um?=
 =?us-ascii?Q?4A71RDrZvDkUla2TQDcXD4BV7+/CPgkZyD3UM44+8NUr/DlyqGLHb/m8bysb?=
 =?us-ascii?Q?aZX9883dpfRORxPTTkuFjjskaCv+62ElhwROXE25jsO6TaboGjK+IteEuI/c?=
 =?us-ascii?Q?DeY3M/J+vbCYekZhr74ZKOx6Gbm+Mfw8nLTp0cyThbB2PUoxnxoVsn86oLLy?=
 =?us-ascii?Q?DOPuYb5D0WUJ+35G45eOWjnWUBOfLRZ5cSKq+1rnbih2oE5/H9qwscZU6Bdb?=
 =?us-ascii?Q?JNKMZESHxLjtRJCpQO7DL/4DSTzdwbFEYPH5CvOjTMB4BG33QUcpLg0Oi7GP?=
 =?us-ascii?Q?BIQCTC8gZJa0sI9DdbY+f7Js9VGy9SJFp8rmlUWo5x27Ygu9c86CvB7cesWQ?=
 =?us-ascii?Q?tqNqDipkvSyzWuFpdT8pnrKQGKKPTzZAgQSSLB2GYw0t2vt/FMnRIdqUBrr0?=
 =?us-ascii?Q?kFrifrqamB/XISn6r2eCxDgKTzhyHWccVZXye8mLP2YMUUMFlYv+w6Wtje0g?=
 =?us-ascii?Q?uOd04u/QY4figjEFCMWllgG6fDjpRQ8l4tOYHnbd1AfdFHFlRbhLxO5gZa9h?=
 =?us-ascii?Q?0LKJbYg7iLBZZMhPVis6KqiCSOdIySi3/JGZ1fFhI0OGrNQjD2AgypCSdLzb?=
 =?us-ascii?Q?hxIJgGpCVuElhfqVlmNLlIP+B6SMgkvPL7p+jKByKzRBGDq7P2wlRtCprmET?=
 =?us-ascii?Q?pkeLSCdo/yCrB02ZPjF7eFmycx81jo/2wnKQypDS3h/xn99jsbKYrXLoIUCB?=
 =?us-ascii?Q?m/EvXCAJLrhCbbv5shwnMHmrtKwO3IiJmDZFDsdRagnvrd5gp1MRVcHbrHAZ?=
 =?us-ascii?Q?wIe9PwII/e9wgnyWKQFlDprWdcfL+c/XHg6uYVSM0zaAD06MvKzEA8V5CHb8?=
 =?us-ascii?Q?1USjlUei16/JKgowvs7GniBgYZZDVVxEe4FV9SE1xRhDM3II5gAOIjXqaasL?=
 =?us-ascii?Q?p/uk/NUWxSMm3Tx0nS34I0CUEufuWx3QeEVYNs4HBWa2dFgynwrcsdnd5IrC?=
 =?us-ascii?Q?Sm+H9piAo+BGDm1nrTTZPREX8jTmJp+A+H0Cp2umNbRpZf7KLGsab7C5GrbN?=
 =?us-ascii?Q?NmhtyMdp+BlsJv6VTnmDHKZs1yNVEbPiUw9GxCnT9Qz4fzcaaMwIerZQ+KBR?=
 =?us-ascii?Q?oDWdLMulKTk7Ry4SJkVnDRc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T6ITxLOyEWtt7sLakrJFSXIx3Kri84WsC4M4WSInXC9EJSoZ5spfstTwACk1?=
 =?us-ascii?Q?OCSXESwWhq2lRDnzug69It9RqjYH0SewWqKKfpGkc1QXdzrsVPJ2jL7797Fb?=
 =?us-ascii?Q?9u8WZXjdJ2J7lkXoNiGWnE6sHgOeNK4JJG+4REQJZMgDwR//8HneQv5CUrLd?=
 =?us-ascii?Q?qVEX4+4W5ttiRWibBi/DvWu90Nd4AHcvZZeu3L+DNyFrgIynyUgZF1VAR/Tz?=
 =?us-ascii?Q?jb4Y9XhN+Ck7qk9Y6oH9PEgJ4zp7/uM9oaBmvZvfRhc/cLXHbyjxQOAEczQ8?=
 =?us-ascii?Q?YGj2KbJxF9ZBP9tPkAmdtdMxDezn1jiw4tgq3G4yqVs1oAFhiB2wyW1C8AXh?=
 =?us-ascii?Q?BBJs71EV607p9JfYRj88gyYhRpeI57TeDCD1J1L5EONVH0+RYocM2PU5WKjB?=
 =?us-ascii?Q?g0bs1EGwNlghdFVmKug2/bIc3z379rSXYSk5l5WXXJfFtzaDMfq0H0tkxE7+?=
 =?us-ascii?Q?bd41TDXL64tdgC+OVf2a9MH7m1nYn8/iNDwW0uBAHb90wHgEUIPBOrFJNotj?=
 =?us-ascii?Q?fnEG/aCGWPM/IMm14KLMKcVnkCOwsac8K3PU5yRuusnYLP0usBSnH0XDnB6d?=
 =?us-ascii?Q?p0RHf1L+UEYdVJ5pzFd41D/s7uYDd/3kGB5769c9xXiImFE/SudjkhLL07MZ?=
 =?us-ascii?Q?7qVA+6AOmH4MjppRSkm80aJ3/vwD0UlWA7Z317+MmX4CWacaLj55dRj6Y5fm?=
 =?us-ascii?Q?v8sdrr+JLNuV/60KcMK1AsmD8PnPHKfh5LtTra+JdSzkSEyJW0sIUTlXAPiq?=
 =?us-ascii?Q?cM/zo5m6/ayXl5rGHWEIo5Irb9/9gxg3V4XzBxGUff8H+z0uWpiZtWRMs1BE?=
 =?us-ascii?Q?drdgd1OlA0MWlQwbc4mjoDNd9Ky4WUxRMzv6R3m5cBNujbKG/dLe4mbLtwgv?=
 =?us-ascii?Q?d6qQO0WnI7eE/Y5N7jAbVp53FkMtWdArwf1+jPZgTmgDwsdj49Fej19GhB7d?=
 =?us-ascii?Q?9zfTasYmpiYmkasfnCl4bKbcNqzfsb+RUZQyHXaOGKlI9+m2IqARqncuJtZJ?=
 =?us-ascii?Q?W3FBNw+Hv7ujHzKz5dsl047G/PzOmhlFUceTbu+j5/xAvSd72rvRymHC45qH?=
 =?us-ascii?Q?4kmLYGvjJp4vRzOMEPux9j6HGh7Gmj1Uvam2Ri77j2p7V7USKRs39LGwN+SK?=
 =?us-ascii?Q?ir6AaJns4t57GwSkvmIUKPm3Pz6D1OWyp2qjVwzlNPIkooNaj/GO4083LqSJ?=
 =?us-ascii?Q?Ck9bexXNseKzcoRWPrcsKx4u7/kfSMu1GxvYWmw/N8uwAqyFvwS5+bL+0Xud?=
 =?us-ascii?Q?4hlGi7jYSnKE8Id+9ai++GN2k/BgSE4QwVUT9JEFoPhZfkR9RTFcvR/lvArt?=
 =?us-ascii?Q?BnMTTsC9MPSmRWmpDtiS2dFDhW97utQgnYSc6hnwjhY8Sq5tcC/zAJwjKn4E?=
 =?us-ascii?Q?xzXQP1LmVYzUDFk39ksadACIrU4nYQJ59gxRrg1gOdlvUuZJbS7xaYZ5TsKe?=
 =?us-ascii?Q?1qakskLkWg1baysRmLxPt9N1mmvaazHEnCrSsG/FFt39vgqeeMIYkcZCAjEg?=
 =?us-ascii?Q?fnmbGRP4KkQF5st8mhooZyczRSyb2Ue2KbKXJBeEV2mCzBxME045NKVSUljQ?=
 =?us-ascii?Q?zQjxmrdjtv28O2tCx+xhzqweDV59Kq6qBAh6fdaUfTXnyTdm0XqM0nySmfhi?=
 =?us-ascii?Q?j9NrUY9XankiF4zC72pMkFsxk99ZZ1+HGgeYLXG/IJIn74NzTbM5kHLSXgjv?=
 =?us-ascii?Q?OcNSeyZ5pflmg78+InFX9iF8q6TOkA+EuPyr28TL8sT1Itkn?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacbd37f-04c1-490a-255a-08de62d31c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 03:19:58.7148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/XEIkodMNaYAG+0NPgA17JB++KDLGNMclTcFdsoeFH0FbReHcCOfLh12NRwzWlo2nZxja4OnZxY+rB4EcJ/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12372



> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Monday, February 2, 2026 11:40 AM
> To: Luke Wang <ziniu.wang_1@nxp.com>
> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; Frank Li
> <frank.li@nxp.com>; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; kernel@pengutronix.de; festevam@gmail.com;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tunin=
g
> step for eMMC and SD
>=20
> On Thu, Jan 29, 2026 at 04:04:37PM +0800, ziniu.wang_1@nxp.com wrote:
> >From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> >During system resume, the following errors occurred:
> >
> >  [  430.638625] mmc1: error -84 writing Cache Enable bit
> >  [  430.643618] mmc1: error -84 doing runtime resume
> >
> >For eMMC and SD, there are two tuning pass windows and the gap between
> >those two windows may only have one cell. If tuning step > 1, the gap ma=
y
> >just be skipped and host assumes those two windows as a continuous
> >windows. This will cause a wrong delay cell near the gap to be selected.
> >
> >Set the tuning step to 1 to avoid selecting the wrong delay cell.
> >
> >For SDIO, the gap is sufficiently large, so the default tuning step does
> >not cause this issue.
>=20
> Adding a fix tag? one more question, I see all three patches are all
> changing to 1, could this change be in imx91_93_common.dtsi?

Will add fix tag in next version.
Tuning timing is related to board design. Costumer board may not need
to change to 1 if the gap is sufficiently large.

Regards,
Luke

>=20
> Regards
> Peng
>=20
> >
> >Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> >---
> > arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> >index 0852067eab2c..197c8f8b7f66 100644
> >--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> >+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> >@@ -507,6 +507,7 @@ &usdhc1 {
> > 	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> > 	bus-width =3D <8>;
> > 	non-removable;
> >+	fsl,tuning-step =3D <1>;
> > 	status =3D "okay";
> > };
> >
> >@@ -519,6 +520,7 @@ &usdhc2 {
> > 	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > 	bus-width =3D <4>;
> > 	no-mmc;
> >+	fsl,tuning-step =3D <1>;
> > 	status =3D "okay";
> > };
> >
> >--
> >2.34.1
> >
