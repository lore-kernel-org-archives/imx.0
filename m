Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD02144D4
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099237; cv=fail; b=nywzuDzaTADaPQSYsgKbOtTKOZ3VItn1Vou8ZBCfOABRElR3A/8oVL3OQs+iYwNHqFEbAGr+DYFHuNVLqvdESM+/8tm4GCKoOW8BQwGg1pL4esRbSsfFa22tqjNLsOW9M/BVWUayko5pZ8kbdSTHVqJtfp7VUUcPGDu9OGsCuxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099237; c=relaxed/simple;
	bh=FqUAFBdVkUG3k3hp7+wuIxFm3Z5LtnRCTIZmVGDhfvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=agdJIHDTLis7d1ZMikvYl/HxNUG/K6YtaxbFSs3y7fgHPvbAwnw2m8C+5eKIjrIJUNwfEX7VgNIH38g4tgn0b5saJcKeBOilq9S5uPxAu07TcJjSFyf6KSb6ZFtC1ASAA4GOeksrv62kNRhhvfNXd23ZVLaSJ7yDxfQ4i6tae3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jvszs2jc; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jvszs2jc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvG7cSZrxL/1fshV2aCJPsKxRbZuK+voIdIF1HwQwkgKnCuDJquWF/tfMRaowzYTgRRnplhvQPCwkRdf3+1GQFn7QFaQWSxnJhfkW0p12unls2ViUESQ8R2Yg4AfvsBNk7vutTNDbDTE9NvwZVZ6oCWJazQvmkWgyrTdGiw8IUZ1tw3EkbEHy7iXJI5dUHZCBG31t1wBg80RFZtKTiVZMk4qpkOUnedLsYZysgl2CzcD7xNkWzEUCmFPbU8M72AYUd3F0OiDCHBsLwVz8JI25Bf0NLiTgTkKNKgXk9/p6pEEVbHlqELF7mMvSwXmocQQhwh2rt8IE9/epkmhieilJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEv+Yz5u27z0p7M6x1Nm/nJOWjsJ4TWUa/sZkIyOtrs=;
 b=d19sc0vp1PAbE/SgaVJWtmATNEgtKCtoBs7Uvvr1rKoI7avhchIKVCM3WgUPPmamvI5wlCHwbABlkey41RAzdH3FNE30QoGe3hJGc5Exidfdt3rr47VrSOdDRTR38tC8Ya1RwUXMxtKpt6Ps73hfeuN3KcuLIihIKeb/QNyQ5LmmGeoNgSPxbnelvdUkjebXOIG7KVWA59TQ1jVhuf3iOhTHSvOfpGHocpuSEL0Xx9HrCBQhEuQ9ypjgS6eDHU5f0cKSOa41FeafjLKcJwwF+FP5hyEN5fC+JForcuoemqEeRk8gGLWnBvNHunibV6+PQnvefU+r2zt32BBbFoRALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEv+Yz5u27z0p7M6x1Nm/nJOWjsJ4TWUa/sZkIyOtrs=;
 b=Jvszs2jcH3gZpyDSP/EzRPuMbOFjKX5eCm/yuivfpWB8BAfmuClwZF2kxsEyrVILW8Gv3DzLaMQOSiW1c9K5ATH8gJGWWznfGAq4pN578j4A3iKYFW7JIJEmltf4JGCzG2mKo39tb10qAKzDfKWFwEDdylF1ueqmFsVFUkq/+VAdGjkWIKgrX1Qs+L+Hy2gbfMYeDMaTrbbu2zj72UuqGPn90hdjcJp7roLA+faYbIdFhgWy+fC128GlI+7FmQt9ECq1CBmu0xW2ZEIJM+lkQwYMekBLtIQEeerMixuc5KwbCv3SRrYbP0x1BkE4+rGYJwUSkQGPBqsIzQdeUlflsw==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 14:40:32 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 14:40:32 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Topic: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Index: AQHbjOgzpPILpRKVCUGBCMqX1iCwX7Ni9I4AgAAOCaA=
Date: Tue, 4 Mar 2025 14:40:31 +0000
Message-ID:
 <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
 <20250304131314.GA2441686-robh@kernel.org>
In-Reply-To: <20250304131314.GA2441686-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DBAPR04MB7445:EE_
x-ms-office365-filtering-correlation-id: e3b0c6b9-1b8c-445b-37b7-08dd5b2a841c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XMbL7RgsvTaep2+USPHu6VXPS7lfq+a59OujAZeO97oJkMf0eUzRsDGG7WCB?=
 =?us-ascii?Q?vIxLzoGLmrHZubgkoke3KX1Y/CF82QJgI3UqzTZl0nZV+FHypMWOr1jwSSEI?=
 =?us-ascii?Q?hHxJIY91ziqoxa01kNEGUSk5Os3SMwcOkgowqGHhMHP+TPhXkx1lP2Py3gbK?=
 =?us-ascii?Q?jbmTjPGeeO9mcc2hsimT4MKi5yYTRdAN4ZJJGbfM61THbmt2HKO3QDsy6Fec?=
 =?us-ascii?Q?FfjgaEsajFKpGx0+1wP4kRD96BvkJyMMwvzUhCrhv20WGzLV5R4fRc/ASDxu?=
 =?us-ascii?Q?JON4B4mpdrQbqSlAF5iR97CjvmKkJhpQK276NB/wre6iE/EN+PtPFAxznfQ2?=
 =?us-ascii?Q?wDwQ9z15HRyqp/aHCgU86wU/kwFWYqYcV+goHJGBueV8uGQwjTiqpEGgHytm?=
 =?us-ascii?Q?9sH9AKKq2IU8RXr2ivCO9TgWrqQgR2bNBJ52Y4sbH1bsjTrUZYthN6BEJfjC?=
 =?us-ascii?Q?Hdpv1EGdJ9vglT7jLLchHJVy1YWq9fOrO0Py1Ek9hrw6mrsJN4IEqcQTl+zk?=
 =?us-ascii?Q?5eFJ8vl8RzW6TtLOO85m6qc4veRnlMasMR27aNx5zBDQ6lazfCz9YbOiQwzK?=
 =?us-ascii?Q?Ae81v/+dn1wp+l4oYxUYTPzws+S8rFos57KeHz0HdSJiP5DwJ95bbCHyZB7l?=
 =?us-ascii?Q?UoNQjTxRJQYOkC3bWmHiz6ccDkLRPVQn0piGcvaeQ+eU/6lMbgnwuJyn1uOp?=
 =?us-ascii?Q?QAT+CowqeEZN7YDg5qOEMrzQGylEcTSl7jQUN350TeKdn/el19+wc6YokwJg?=
 =?us-ascii?Q?gMhaPi2E4vcFpCyMlzKREAABnrkMDiUYXTcMHOYk0RSIwwnTjFQJzJFOCK9N?=
 =?us-ascii?Q?pTe4yp2d+NTcaIrFYzz517Rip1+wot8AnbRjAkBNv/5Xcs60+jST7SKJc75R?=
 =?us-ascii?Q?yku0q1nF3Xo5ww7FGHKd/ZPYDI1ET+l+LstM2rFT6Cy/OW+b8gW8EFack6o4?=
 =?us-ascii?Q?MJJ/q+WZV6XC7rbHH28eGQtZ9w+IZQZ4vPHe4VagHccADKnhIpm5IP7FHNdh?=
 =?us-ascii?Q?UPKltkW3m5wirKIOuxJNGsyCiTX6gHQG3Eqjys9HsCWw2Lu5B8kzGd6ucoId?=
 =?us-ascii?Q?JxVB1YbmimJhauufZek83LQ9kGcxJamU8dOYqoOTC4/iEG7l7/2KgKMwVLrM?=
 =?us-ascii?Q?mTcExAVy9UNBO4XRx80si3CXL7IcQ6G1c4V78N+LAe0r7etam/AkhJWY9Ug9?=
 =?us-ascii?Q?pHeFjMD2ZiSlytCG6X6UgAZED9IvtKcl2BzJSoPqO7F+Lh64G3Aecxvdk79M?=
 =?us-ascii?Q?2pn3V7qKcz60D8muBL5qklaFFlRiLWhF5zgwWK/a4FJsIdiPhLU/6KOwETmY?=
 =?us-ascii?Q?dPBAdrnFNRrdcWeD0DMPA3nDnRyr3PRzdTpk96TtWPFAmK4vRsAtvrUJObjP?=
 =?us-ascii?Q?arkq/VREK2E3NlNwmuAcdCaBzG9GLUWDbgeS/uJkrRRBUIUD6qn8gDqM7YzE?=
 =?us-ascii?Q?0XKoTU52khZ+6SzZS0Ut5nK45UtgjoPY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iqvFodj1Wu6CkdiPJ9h40MlFNAEx4h/cF+HdHrQX/T4kM6hnjOZY/Lpq8cxX?=
 =?us-ascii?Q?TNsvVYVa0gi+zSxNLDWtCDMV77270qlp5EBCNIPFcUH3pq6iduTpLZYEvYnK?=
 =?us-ascii?Q?hlvaJpjT9YZafJ+nBTQgNwQhRHWg2ZPlFP99ndHCpiG/nH1dJ8J/1SV4JMVr?=
 =?us-ascii?Q?O/KIsn2E/cP725NmtNcsq8Ju6AzQnyXDtESjQswdcJKrXper4VuZfvHLjNqt?=
 =?us-ascii?Q?ddZ4fUASYR5/KE5Vfwa7CGGdZmIcW8ak31gwo/xtV/uBZCyRa/gbzufbRWyu?=
 =?us-ascii?Q?Rvp3l0ySCQZsZV2AGifXjxc9nV9Om+GX0C0JNIqMa3MFChmiDYKx7Odmywcx?=
 =?us-ascii?Q?z7RNhTBpjb48yJdHNx0xlbyOluwPjinQfMEXGHru2yyBqeufSuANeSMhterZ?=
 =?us-ascii?Q?8lOTsYMsBDycOl+ZWzEt5SnqZBiIuniGlpjHvilyMTBqDwW4gDsiuJLpPCYe?=
 =?us-ascii?Q?gFxXUnxADImCsxKhqQDvck+4OZvPqkonQE0y5HgoUp1i/n4cp6xu3oPO6nXA?=
 =?us-ascii?Q?rZnolcaPQblOk7+KhPwqFPXtKZdqEq7F0GveIDhUH7G0GivDCEt7ILGpM8DQ?=
 =?us-ascii?Q?rr4Q1Z1TB8ERzkncWlnQExsWmzrVjEBsvkN99LZq0BjetrilD8LnsjUsj0wh?=
 =?us-ascii?Q?4gzFz/86vPz5cRvSCe3QsvzbEZxFRtgUnVKvShGUQ7Gr6aJs4wo9L6qN521R?=
 =?us-ascii?Q?rjJvOnStFXgwG1hMMxeDV/ze+v9p5q08wooCqDhLn9TacDOCZv4NACfRfU4a?=
 =?us-ascii?Q?YngSFoH+IXDaFwqUwstgjdpk/0572FO3ctydjddIWB8XCCYcv2VlSxpdINVP?=
 =?us-ascii?Q?0F8v3gNSRuUJNJzQr46w/3NZCLbRwORUYhHmFWyOFj2FNgs9SjrTu/ndle/5?=
 =?us-ascii?Q?/sNQ5tX3R/8KaKxhtXK0dsvFQeupAn+qVew3+M+jnWMvdCUzY6Wcl4hlLOHh?=
 =?us-ascii?Q?6uTse8MXfYr3Mh/E1V7leKQz2ZQF3lFPcwTkY0bliTc/bT81TTQc/UhI0RaC?=
 =?us-ascii?Q?xJCMihZB9vm7EWqshgyIW0QUi1jBr+b718yKsbzEgjWWovSWrvbXl76TkHOH?=
 =?us-ascii?Q?RnBKKgL59YB8UVz5jqGQgqpyGkhEQyUF/P799AEXkgRewMtPe8iOBnPJc2H7?=
 =?us-ascii?Q?pP1jzA4h1CWJwoYBEBvYbDi/MlGEAS+0H83hRy0phUoMNVafyV39HWfZH3Ru?=
 =?us-ascii?Q?dyAW9hoLh2krlQMSY1lBakFNvWxvNVTxlAYbo4j2TRiJs0sO3ezp6plMQc9S?=
 =?us-ascii?Q?Y2Rs6OO0zh7TUy1qLLv/d/L16L2038d2xWEZYwmi1gF3QrxoQ9lyE14rNIJT?=
 =?us-ascii?Q?VA83S0lHa/Mn5fIJu87ERwoFTpiyIGxBNL+bjMphjmDjmO0cjCmDcsGiupkR?=
 =?us-ascii?Q?U9cTH37fnInppSZ1bDnJw44cCq2iBBhLQMIHUUmE7h7ZRhZTNyQjwbvZPwsV?=
 =?us-ascii?Q?4przopbtYaQlAw4foYvPWA/ns/5nhJsLD+KiLloKb6138ckpl3V0s9T0Q3rv?=
 =?us-ascii?Q?Yl0ye9lDIZbDBkMsM+OSrbVPrm8abc1xJck9XxReSmCsdCkIxSBFPuwkKpl4?=
 =?us-ascii?Q?hArlU4lh7Mo3cJ9ROq4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b0c6b9-1b8c-445b-37b7-08dd5b2a841c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 14:40:31.9188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19bTG61yiTg2mjuGpEem9skSa4JTDhhuP/Sv6LP5SQ1V9jBZAKoXiL8gHD2dU7TMy6hgVgwPZqHng/xlUkGzGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445

Hi Rob,

> Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
> interrupts-extended property
>=20
> On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> > Add interrupts-extended property for edma that has multiple interrupt
> > controllers used.
>=20
> Did you try using interrupts-extended? No. Because either is supported by=
 the
> tools already.
>=20

We need to use interrupts-extended property for i.MX94 because for the edma=
's
interrupts, some are connected to irqsteer interrupt controller and some ar=
e connected
to the GIC. make dtbs_check report error, so I add this dt binding changes.

Sorry, Which tools are you referring?

> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v2 changes:
> >   - newly added entry
> > ---
> >  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11
> ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > index d54140f18d34..549afb8611a9 100644
> > --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > @@ -38,6 +38,10 @@ properties:
> >      minItems: 1
> >      maxItems: 64
> >
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 65
>=20
> Doesn't match the size for interrupt-names:
>=20

The interrupt-names are only true for vf610, maxItems is
enough for such case. do we still need to update it?=20

> > +
> >    interrupt-names:
> >      minItems: 1
> >      maxItems: 64
