Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF3335556
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765973623; cv=fail; b=bpxjbwSjgihZP71/gM54fqoH3jXpKuNkNJqoz64t+VJOt/WzGaFr0kNfLgHmUps1J5OkS3jsGtSlI+KdlR/ktm+eyvGFx09Xw7tXmjBlvwukxTnr+kMFs6a4ZDrdqRaNNg27MEFQGbjNi9E5x5r9IF2eKnbsjJ5Kte33EEuiYOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765973623; c=relaxed/simple;
	bh=njNiwniHQPnjbQsK6SBumlk6bYMjK/x6VKuEL88vPK4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YQ5w6kilMO0ukjMVGyR18wm6pRlSyJm/zUUdTK7+kyfPt556xujlJP5ksNs2xU6WYopLXsEdDv/LA7SgEF8mt8jZyeeRNJVqlZs+Kr2X/uQMtwnDwQsM0sSbSxiRJftGIz4hZ8X/qpj2f0kW3bW/xGxX9ha7v79LIntrW+IYO/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aTQBj5yw; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aTQBj5yw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX53n6Vaw0x+7YynCMp3t9Yn9bAtQRT/Z2LQOYDBHYfA729J6BX9o4JQfCeJ9Aa09n2JWeMYnd/w/8c0eR4dvt4GEZ6gBIZCnl2Hju3juPsXALW6UyYN+T2iHB8kG9pYWDuGtnXgsiG1Dnlk9GNmF6iQD/H65XMK2XZ0zRUfkcST0liNBC6v6Oc4hNUKOojuvYqB6s8n4RFZykL3EKEkhpGJAqEXMQacUyLqaIO/r+CDsMv/9qiB/gekjcOUC5dwt/3Nee8acLqQb5cswT8Thw+nhjm2Rd+bP7WYrB7npybIhZw3CbAdhLvdNW6/h5qTweIhj9znWrg+h2dIDUZCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9yCccN5nYfZFG6ZWU4TO7/fBda7cVlelOCirXwdQmE=;
 b=EiQcpqMhiEQSMDU/0f+ZmFzHvhtX1toh8rZuvC8eP4uLXVYn7FW4oT/SszvXz10vbq8EKsLqO9PxmMhHSjxMetWp3DdWkCuSSc3K+vhCPyJgdFbEmfcLJVuJctsCW1AXCBxxMPQ7zDXIFM2FZVbJ5IzFAT8KuSnt+huMfplOYo9YLSoxAbp9+CWxwYsHrd2LPNQBgWJsJHNtTa71JZpy+uivopc0q6Q4An6g3nPjNiYSqTAH5tf0BWjhrOCy4Z6AZhxx+DynBezULXkL9/feXLEkWQ245EO+3FPHFcJbeYZQXsJmvPWwF7H2ttCuJz7odngz8iBAbv4GhYWYRJCSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9yCccN5nYfZFG6ZWU4TO7/fBda7cVlelOCirXwdQmE=;
 b=aTQBj5yw24J4ke5U5lJYzrhq/gcRbtR3TCQHA9smPiW8htSfLkQGXqEdqwXBuITB1IX6iq08ar2WxzfouObIHnF4eaYZtsGeZgZLxfufZ4LY1Zbo9E0vdC6wv6CKCubodafMNk9icFWHmkwCrkj0gHucGnwWXxIxtVIAzI3XB2UYPnQxmq4/pym1dgUdLm54xgf4rI5HdRBJBn9Og9UcZvn9VqTlKBcwwnschtX0EtdfM3wsT38rHetaR5UaPBwS+cDikcig39phgu7xy/3b2pBsW2CYtnDJYz+lGyNEscQWK5g1KfW1PuChyZjuDpYHB0g9Nx2KTDqUYGbIev8+1Q==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA6PR04MB11804.eurprd04.prod.outlook.com (2603:10a6:102:524::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 08:40:05 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 08:40:03 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v21 5/7] firmware: drivers: imx: adds miscdev
Thread-Topic: [PATCH v21 5/7] firmware: drivers: imx: adds miscdev
Thread-Index: AQHca0fzBh349iqDGU2aBcz65HDXXrUeOU0AgAWeHMA=
Date: Wed, 17 Dec 2025 08:40:03 +0000
Message-ID:
 <AM9PR04MB860463DED50B8371D349E3F095ABA@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
 <20251212-imx-se-if-v21-5-ee7d6052d848@nxp.com>
 <aTxIsAQMe3sbxXQ4@lizhi-Precision-Tower-5810>
In-Reply-To: <aTxIsAQMe3sbxXQ4@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|PA6PR04MB11804:EE_
x-ms-office365-filtering-correlation-id: 5dfc26f6-a445-4933-d313-08de3d47df90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KOYrNxBU1NdICwktIlQ2w5EPljEoiAYewNZkf9IGMPK86KCQl1OrZWJeM0lm?=
 =?us-ascii?Q?+QgsoYmgXmvFZV8u/7k2xfK2a6m5MNLZfis1ioZN1KHAVC1SC8m3I5i5AU0E?=
 =?us-ascii?Q?yU/pX+yGRTjQ5x6iui3ILuOo3O1VTd104/wNwtRReK1qgtEMc1WSJZot0GJv?=
 =?us-ascii?Q?vGyKOGEyVZxTRGo/bjGLXeO9LKRngmEOiGg7Nh1PZA0gNOTARmpvzAq93ZnD?=
 =?us-ascii?Q?f1mHqPShOjEbtcA29WtHhb1TPkV2L9tjeHp9PIBbM+jlbspqb/QFEWPJnhGA?=
 =?us-ascii?Q?20OESDZgJloYpaoaY/N6Koc5iOHGTcMqInOb/wAD5WMNbo7bHFHooY3+3ZPr?=
 =?us-ascii?Q?DZKOwU00q0AWP83v5mmE+abIdMV+AbcpYODYikCowrPzCTvKCNK3Kvtvjyd7?=
 =?us-ascii?Q?95dcp+rj9kv4rJgAb6B6u8cvS5V5z2/k4VfbKr7lJfKAxc/qnv/aYvFNsQ06?=
 =?us-ascii?Q?MdaVtKpVdkD+PZotxmSvEcuvPoAwoLaOhSUverDgoDXPZ2yOhGRwb6/YsP8C?=
 =?us-ascii?Q?VETBfRM2vcKeFDAFHSk6ffRzaxtJtcjEhXAT09ASM7EIawIC0M249PnhKBqk?=
 =?us-ascii?Q?XK5vjKLqs7AS2Wni3VMFJZExDm2Cv0kzE47pWZU9v5FMepHVtct7Ev/xS1aE?=
 =?us-ascii?Q?/iuVLJBFTuykNPj11JqL4CNma0qMgP/7mgcDd/swl53yEePXg9St11qBEylu?=
 =?us-ascii?Q?Z85IXqkB8qOJwD/dal+tiVNjxFv0OlNe7OVzUQnGZ23Mr6xNzV+E61w8Z+l+?=
 =?us-ascii?Q?5jbezOU/CXQz7UJbKI04ZS5eVGtYqO6++R3rmPtCU4JjE7GwDLUj1Caow/iN?=
 =?us-ascii?Q?r7UmYIzHPBAW/2LXFwmo9iQJVqvy49ZY7QLZ5pMzASp8a6GjdAf89+ppuYMC?=
 =?us-ascii?Q?R0tXcZlwYHBINO4RJiUtrTiYGJy9tdZl6UD8+sNMHwfkmVCHZkqt2BphxLOL?=
 =?us-ascii?Q?DEP5RvjEbDRj/L8SKTidwbfngMHBCISGHHS7ZuVAQdWw05etRiJHryFKxuG8?=
 =?us-ascii?Q?r0yYS1ljtfjtSBkKWS0VOmQv+330by+iOoPINiX/HYGNyZCoGCPlaIIz/Rb6?=
 =?us-ascii?Q?Hz7LtV6AYKDg5Ih0zdvMQ77gUcHO70OOZTmRGBdZGMhI1nvDaIN1hx5bwQIE?=
 =?us-ascii?Q?vQBWtxDFpAV2D+sIr8wpxNiIX0cqNJQD45pMIsZjjb1DjZPId8qKn6JEl+BQ?=
 =?us-ascii?Q?bap0I+NSdW6gAPzXebeChAFsK60gPzStMmEIQuefOxdbF5GFm6IjVLBJUEPW?=
 =?us-ascii?Q?kDDFQxpY13eoKFfGEqXUmmgSSBywgQwhax+COd0aFNMXbjYSayDAezWzLRt/?=
 =?us-ascii?Q?gRA/RLNkIOcEp3CBuzcZd6lLso8N1vO5njtpaLavoBUUlXUsaMl8NE6rcZBO?=
 =?us-ascii?Q?KXojlgEXDd+pH49VOkaGjBrGdkQOQuajjg02SK/zkBTI9jiJgd21pWiQo9qw?=
 =?us-ascii?Q?rNaDgM2a6oVzAfovnDkS31/IzqKTrYsXB+AykvffY9enOLZ7zE5ktq02DRJ5?=
 =?us-ascii?Q?IHj4hxxNslcHmYFbUXvArZ2kuvSkc3AHtImgpYVEqZHMsEVPWm2hgaugEA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xvZWzqfy0COgKgFIGAi4M7KfGsNHD3jVQUFasj3x7HRToMY3csLJOdEoEJKd?=
 =?us-ascii?Q?9SumbaMeqkE31qTjynPDtzl7MGDuN4qlJc/LtKR+KFYk/1jlc3wzmjWidFkC?=
 =?us-ascii?Q?uol0VxgNdnlE5XqDUnKJ9+AGFiSDN70tSgD7IA+4heLDTV11fTvnRJP+qZ6S?=
 =?us-ascii?Q?eNyXTWRoCtEoNWG8XeaqfSgpTEOAuVcWhh8fdsJYVg9xvsQSMLkaPigFsiva?=
 =?us-ascii?Q?Ps410ASv9EK+UI5ofLPVf+qzjfpwatEWp+xBP3qbkcMrX3aLve0yzrgjmFLE?=
 =?us-ascii?Q?AxS2GGZ66xh2qd2DVb56JGfy08DpUnXYgbhXeWSCSzbQf/1OHXlwXmHkLLE5?=
 =?us-ascii?Q?b+qF3o2djpL3k2MkVLcSD8axjj+Jno7N5EaRoGECv0H2RfD06Pjox4InLCin?=
 =?us-ascii?Q?3fKm+EOehrugva2CM51O+tsiF1Bg8wfDX+zYvnFwCJ0j6LMtfVDbR1COsCPe?=
 =?us-ascii?Q?aF9FLsHB2dFlH7PyMUHSjKOofQppE1dXnKn6Ly2yYYFD/dsHdR51oxNAZeZ5?=
 =?us-ascii?Q?lVAejO61CGld0UZQaibYmGjOkUicx82jeN8VVN4Lqv508MRVIMNh42fcbJpb?=
 =?us-ascii?Q?nUDO6NBA1sy/PhpmRUQpemKlCOW+PbGR+nz4d6/3ByKGcnSWW60WdBG1Yjzc?=
 =?us-ascii?Q?bvnnvMBC9VhM7JBEU2F26nImDytSaCkhbBsQgYAtQ9wuYvegVgTfaxEhtaXX?=
 =?us-ascii?Q?iOgqm+RKlUq3Hnd8vPOS4yRl7NN9wP+gOyKy5EA1oet6zmZ1wc14RAmMOznR?=
 =?us-ascii?Q?FCPl4sQJ9+vRyUJwELYu4JbVQw8DSBq7j8O3bWggFomW1i7Ud2SRUNG2SJOC?=
 =?us-ascii?Q?V8HVarxqgjDo0BipjRJfUl0V3BtwOE7mCoXHaJZ3H91p91bBT2z75XeoEX5i?=
 =?us-ascii?Q?GkGzKLGnEcJe4tLqwczNCr+G+sYpVv3Afu93xy75n46KnnLV1M116gjeE7ea?=
 =?us-ascii?Q?hsVmQfKMD31/Uw7A6yk6v6pH2XVwil2Ef2a54U7ENK0RwfwlQSEhwO1EbQIv?=
 =?us-ascii?Q?xVVTZT0K9WtJkqyAxcatD7ChIwbmbcu9FO7BTXEKVHFmyA2Ek3dJiUDc8yid?=
 =?us-ascii?Q?tCnCFrrUQy6V+JJsNVlUq6xsRxb7HN+GRj1zdURDZ8lH4/8Bbu8qd7WuTDcf?=
 =?us-ascii?Q?Do3ZDbwOW+1L4fhOkt4zmxuHMEh1Ouif9PxwPFG8iPPzzGrsMfyzsD5T4fNd?=
 =?us-ascii?Q?z+PwOd1o4ZGgH50HFIG8M6p+d+IbwtkjcGGhv4RJFFeiGXyzZOr5FYa9y2dE?=
 =?us-ascii?Q?k9eqEPSAn2UgNBKnTeFtLVLynPNLSEtvgk0u1QtVkUVH6ecKOU92QmmYmr9Z?=
 =?us-ascii?Q?4OjLWP4ROv+AJBejjdja7J7eZt7DHBKztafCrv4mLIcEFaZje8MIiL3db2CE?=
 =?us-ascii?Q?+0RO6yZbajnzXWCpscD2IMUr9NSKfIiH3SE29jt5D91aM4XR0++V7AD22Uzz?=
 =?us-ascii?Q?iCggr1OikynMhT0EjgAAiKbVPSzYY9cYBUJ9TXR9fwguNNbodAWV2eP80ylX?=
 =?us-ascii?Q?nG7vPeYpv1mTRvqun2og+QqvRpeJ7zd97GrbsFsIj/VK4sBnQmIdaedpK0YC?=
 =?us-ascii?Q?e+CpXE+2z2wPKirhlzCdFXAF5t9vWASHhJm582yr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfc26f6-a445-4933-d313-08de3d47df90
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 08:40:03.5511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L75mC9uA8FJeYZ114QvgZI0JGCmz92PW01iZboGJbF6yncXqdiliMETiBRr3eT75ECR890ni5cKkvacMEwXvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11804

> > Adds the driver for communication interface to secure-enclave, that
> > enables exchanging messages with NXP secure enclave HW IP(s) like
> > EdgeLock Enclave, from:
> > - User-Space Applications via character driver.
> >
> > ABI documentation for the NXP secure-enclave driver.
> >
> > User-space library using this driver:
> > - i.MX Secure Enclave library:
> >   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> > - i.MX Secure Middle-Ware:
> >   -- URL: https://github.com/nxp-imx/imx-smw.git
> >
> > Following checks are performed on the incoming msg-header, to block
> > exchanging invalid arbitrary commands:
> > - maximum allowed words,
> > - check if command-tag & response-tag are valid
> > - version,
> > - command id validation check, to allow limited base-line API(s)
> >   and restrict following:
> >   - exchanging power management commands.
> >   - reset requests.
> >   - BBSM configuration requests.
> >   - re-initializing the FW.
> >   - RNG init
> >   - CAAM resource release management
> >   - SE's internal memory management.
> > from user-space.
> >
> > Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > changes from v20 to v21
> > - removed "__free(kfree)" & added kfree();
>=20
> KK's means is that correctly use __free according to cleanup.h.
>=20
> fun()
> {
> 	...
> 	some code logic
> 	...
>=20
> 	struct .... __free(kfree) rx_msg =3D
> kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> 	...
> }
>=20
> Frank

Hi Krzysztof, Hi Frank,

Thank you for the review comments.

I misunderstood earlier and removed __free(kfree) in v21, thinking it was n=
ot preferred.
After revisiting your feedback, I see the intent is to use __free(kfree) co=
rrectly as per cleanup.h guidelines for automatic cleanup instead of manual=
 kfree() calls.

I will revert the previous change and update the patch to follow the recomm=
ended pattern:
-  strucivt se_api_msg *tx_msg __free(kfree) =3D kzalloc (XXXXX, GFP_KERNEL=
);
-  Make sure the source files has: #include <linux/cleanup.h>

This will be included in v22 along with a clear comment disposition referen=
cing your suggestion.
Thanks for clarifying and for your guidance.

Best regards,
Pankaj Gupta
