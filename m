Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD23EA97A
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564314; cv=fail; b=kpnbIKHOR7TxaINzNCgyn4nOoFVJRAayD2FKcgIxBVIDh0Uft2AVh++GGBsc4c+0YQEwN0FjdnYTngxIgajK9m/GNLYww/y5hWYNeq3Bw5ue/sUtb9VxfM17v5fHHqpltKtTROuhvhpTUkoenbfstSZHhOqZdv7/rChF520Cv9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564314; c=relaxed/simple;
	bh=kILKGItKMnaV6IaUkOjF6JoRhPjrYhty7VGm9hno0j8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DtJog1q53vmuGsF7bDp28dROkR1Kz2gVUtNTf7Eh3FKm0YXocsA1zjsJgvDtYhUyZdo6DMzAxFFkBlHy0UcQsL3JmWsdt2WA06/dO0GK7iwFMIcpQ7gSilqBQFq9KyPHdSDuMYN/LSIJVUig5kX3y+gZw5Qae54VPILNynGLm40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nEvWmgEC; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nEvWmgEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MosylKJcDuXYIgtzBYjGp68yga6f5qizssjeIo+Fw97cn7uIPNdT86HyuSihqeAUtDaPF3U8y6HGAr0OTPZUVA2AX4ntwXqET8N3JgQFg4erEK5P0Ln0OfCL043Y26zmyRWfh9FVnw7vMEpoFe4hE4jJXjU/4jjvr0Z1BfUAk5+cBmGBoZz3ffQKNbdEduqgS9KGhtFGeK931eY7UT3DLS43QjTpCDdERSuxVWL42SBO0Nki38TIEH5JySJOI2dBKotzlih77qruAu4PD+5CpaJtTlfQqhmcH07rbswlMcH7i6yT6ecviavm7UWoLtHA3ZYqSCXoEBrNZJNL2gdESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+lyl6eEgnh1DrlIW672Q1mMJBbncYU+RL2MqI1dc3I=;
 b=V2JHZHupT5RzCBUD/vnCwbb+h/Q/IFIf3+zGZWGUSkRTRxocjttG3jBk+xQKyPXhYxy8GuYk/1fEgm7UDmVDwS8jxE3aYdhOmS/ZdtMvO0qGCCBZSPJMfljkxAIr8sTwIwMeReazN5BDZ/EMCIsWhL7pv1f+kFkPOI0M2S+ST12lsTKrslZuCjvhBjoTqVSNBwvHnNxFL+DIlIp0OxvvVdJQx+HXZYdJ/oyXT08Y/YrUl/n0yI2vvv+lRRtOB1jdn7hpJVtk0Wd1PDYtwV7hsfbiMvFSrGVjMe1CYV/HjNro6TJ+OiQrdCZ3g15twxOyH6lYIV+Y6KPTjNHCVfkOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+lyl6eEgnh1DrlIW672Q1mMJBbncYU+RL2MqI1dc3I=;
 b=nEvWmgECSg4ujnXFe2wBu7L0YL4IrZ47VsZq8Cc7tub/nVdIawiTbCvX8OVZECiw5izZIpf9tXUN05IQ3SXbHoueSTjvwyEayHD6toLXrC0T7iVsi85ijowaNYmbak7jVmmxNn8MW+EyZmTfBpfHkNVq6Dhj8jYfmH+XE+qC2grl4YjOOI6cfo735TACVVLPL8kiL7kytTs17ijra02aez0V7ZaAaj9eK+XK76k87WITWda/zAGGWxcldua08kWOQ2a/ANBFOgPfs1JfRSBxjM4ldcZLHdDj8+BAOESTr0uKZtSfRAh7CUzOpixV6TH/E3iFv9djhPILPignqYDm1Q==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:38:28 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:38:28 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jindong Yue <jindong.yue@nxp.com>,
	Xuegang Liu <xuegang.liu@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Thread-Topic: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Thread-Index: AQHdMVVraEXmIS3CdUWUE9Py1IVZLLaojv0AgARlPOA=
Date: Mon, 24 Aug 2026 09:38:27 +0000
Message-ID:
 <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com>
 <aohftK95_iDsTPPm@SMW015318>
In-Reply-To: <aohftK95_iDsTPPm@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|AM9PR04MB8413:EE_
x-ms-office365-filtering-correlation-id: c3e6f12b-f5bc-489f-c789-08df01c373a0
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 FARQ6MfEWOjzAH2OwGd7iga+azOVEEHBx64AZPZ7YIq3/XPggElW3GGDWR8B+F00c59tNgRJb9mvqS7RJQJrY0YUgCgJ0TS8gt/fKaiI7smnEPlJN4gXM+uAKmZqwSAZE/OCH4y/kzqWBQ8pGoWkrb0fFxn7na1vAnQdEF1pq1z3XQvF2Fi7j0O7hNQwIT2bJ5N1e9cNnOVIFnyN3SEHWS6+pUQxoJGhGfjZo+prWN0BU4Vy0xzQ/KOuvy9+JAR6XFsWVagh1atacBEzUGax9uhik+I6XHeMfO3YxOPymOcHYxhQydUu7PwBXpaBjpzgAfOSXbCSzSOFqYsd1x/6nWc3118XG7sJNU1N75UMjIOMX+nBxHSWQK7tIEmk9h74OQkANk3HxaXyPdLox9FiulVLBKyigGfH6BFWOZJLmKBmLE11NOppx0GL7Vjw86CDg/2luvc4b9zGRSdSZWRGTQM/J75fLAzMLRonjD301Xd8x4K6d0LTBBUoygddX1eRl0lzR6oYsfwAdcCRbP1igzIU+hF9KSnvO7K2k6n7Q6aIoOYSCFDqtBF8aPTCxUBqGSfzcbWy3y5REeENfG2p0scWtPsrbQIP7p+w0MfWE4RxteDPr2Tj/EhLIVaWxQ9xcY8o/xaU1DWF29eUFwkak3Z/K4o+soU15bY+xfFKtjiG+6Z0MfyFk+rn4Y/5qtU2I05rVlBY27JmMkoL2USktp/DAh0SSreg6aI1uqFEons=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NdVa0mEiDs+ML71H8xPxfsuGkv3UejFI1h+XRv/PncQD1WKZeaa3KvY39Vgq?=
 =?us-ascii?Q?zqJsAT91B3K5ZlsCnfYWIHNYAkbYdRy56pT/898+DdJfk9iJzBPlI7okcfdc?=
 =?us-ascii?Q?mReiLxP30Su2EHTjohZ/QmSTajE3BIpi5vpdDxsdk7H3bB1X5LrJ39uzMU6m?=
 =?us-ascii?Q?WUdCqu2x5FovK7IwzTVWItIjySSeIZsXc8AHUfh7BUKGba5Fpp65aoR/THIu?=
 =?us-ascii?Q?YE5eGsH/MP2D5+qSYzHMW404tDJzk30kFw+uGEDitwp723EsbtuXByZtAb2L?=
 =?us-ascii?Q?l62DiQHwhgfJ4aQQ353u3CvzMUNLe3Adin/kIOUloUy2qomMs0F2WUG3y0i8?=
 =?us-ascii?Q?FphTAwLieorYZ6YMcHFoXvqm+DIq9hyRDEviPN6cgl4ONO+Vm4rPQDSH52vW?=
 =?us-ascii?Q?Pe9nbb8O0qByhGBB1JBpETmJmVSt9q/Iz3k0iZ/GFOSuLMz3Kgcv+oTYhKiE?=
 =?us-ascii?Q?95evz2xoy2ccVlXuQOlQjjAEwQq+pTV4eAFw9dqazXoIoqBe3coif6AGRRv0?=
 =?us-ascii?Q?2z3dOUIc3IcuPybYH2r30OdlxvJ83lMVnqJYONet8gih/zyuYB5PknEeB1Ed?=
 =?us-ascii?Q?tKZHc+hnaVHKoEdHl3aLyklFDW1MROOuGSNcof/FSlwFuWNGwixcss1kKtv2?=
 =?us-ascii?Q?JXlJ/gMtMVJzdCHGvdPdpebP3nYD1Bp7JsGOCF5Dfpv/H4UwJSsD9NG3vEBV?=
 =?us-ascii?Q?9b99BjMQWO7ibybOPBszBpA9EXOw7i7OmVaBL6vgsR/EsQApIGRdH24hGZ/1?=
 =?us-ascii?Q?6xsInR8vEf2ctgn4JNVr28vpVBifOXGGI4aK0s0O6L4LXX99XGyrlAsPheEk?=
 =?us-ascii?Q?VhIUd/cVgLGYjiclLiMnIKDAOizGD/bAERQ0OIxTPGo+gboNDFq4xKwkJbiQ?=
 =?us-ascii?Q?/eUOxbWAB5cQUtverp3hB5LjFsDINqEftxWZQ0Rc7FXdG/kmlVQrDQTBIjHq?=
 =?us-ascii?Q?KmFPCkzvHTrkppO8IAaleoeuVNzP69BPKfEAbeHKmEaHxkGbl/dqex5yii7s?=
 =?us-ascii?Q?P77MpIujxiLDCvBOpO/ZP7me9aCIdpto0M5ARHaVVYeRKHwn1ZwpsvQ9I71n?=
 =?us-ascii?Q?PFpWazVIJgPgG5fkneVddOASlNMLmner4rGH0CZI4hE/CAwUtDOiFqpVtbvy?=
 =?us-ascii?Q?/1b5w3piwkKBAdXvXX3AYpii3ACBo9Dkf32qUk4zdhf0eU8jF/0467biGjo8?=
 =?us-ascii?Q?aNnHzhiZNwEXCE85jLUeyViO0r5cjgb58OWFhdLi3O77dFvR6EDk4Syy1eJs?=
 =?us-ascii?Q?AaB/CtZTk86WbR4L/1JMizjZVXb8eQ2BMfLYiH9uzKN29QvO7X0cfh3SJA2Y?=
 =?us-ascii?Q?h517TPOGjiPci10qZPZT+u1pMsZ77WDReHR8MHQZ2J8XFGs84gXSYXDLpcph?=
 =?us-ascii?Q?zlv1WAl6fFA1wIDMOFGuc7J0HeAHOiOD24j+fZw+qmAxJGVBTZBSDBvypMjj?=
 =?us-ascii?Q?mUD6pTDXrfUKtp0OOOC6f93JyIUa8n1+ds+i9uCVkK2d+SdTmjHs4TnXzWmL?=
 =?us-ascii?Q?/J2w6GcGmMaUDuvp6KApSHDjVoV1j8so1fGGr/beZiiOjvfRM95YQe1bEe5w?=
 =?us-ascii?Q?UlJtKcfHVc4CF71TNERNwIk/HMsum+4VKGpFQSyKbm+xBG1zCUYRIaHTsOEM?=
 =?us-ascii?Q?tDYQYi7yNgmQKRgi0gJiDUhQmPJHku5oPStDx7DWmmztGYMkQmaT0Mz1oTjT?=
 =?us-ascii?Q?wa+moLk4EzKk9Rh03FL7+c/8vi83YSSDCAcEZtX8JFXExSwTRhFtTR6ekeyC?=
 =?us-ascii?Q?CSdUfa1p5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e6f12b-f5bc-489f-c789-08df01c373a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 09:38:27.9714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOJbhGDhiwr/AZPPYo2ZwaqGKQ+k5ed4CRyKspf+6lfLS8XSnQERICQfu34o5J91QetrrPaAxebSVJNESqcCiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

> On Fri, Aug 21, 2026 at 07:10:33PM +0900, Zhipeng.wang_1@oss.nxp.com
> wrote:
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > The IRQ count is validated after creating the IRQ domain. If it is
> > invalid, probe returns without removing the domain, leaving its host
> > data pointing at devm-managed memory that is freed on probe failure.
> >
> > Validate the count before allocating resources to avoid the leak and
> > dangling pointer.
> >
> > Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output
> > interrupts support")
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > ---
>=20
> This patch should be second patch.  After move to second patch, some erro=
r
> handle will be nice to have.
>=20
> your 3 patch needn't because no error after it. change to devm_ version w=
ill be
> improvement patch and put after new API added.
>=20
> Frank
>=20
Hi Frank,

Makes sense, I'll restructure it that way for the next version:

 - Move Fabio's IRQ-count validation up so the count is validated before
   the domain is created, and add proper error handling there.
 - Since the invalid count is then rejected before the domain exists,
   the domain leak can no longer happen, so managing the domain with
   devm is no longer a fix. I'll drop its Fixes tag and reframe it as an
   improvement.
 - Move that devm conversion after the new devm_irq_domain_create_linear()
   helper, together with the other cleanup.

Thanks for the review.

Zhipeng
>=20
> >  drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > b/drivers/irqchip/irq-imx-irqsteer.c
> > index c1df84551efa..571324de8bd1 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_devic=
e
> *pdev)
> >  	 */
> >  	data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
> >  	data->reg_num =3D irqs_num / 32;
> > +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> > +		return -EINVAL;
> >
> >  	if (IS_ENABLED(CONFIG_PM)) {
> >  		data->saved_reg =3D devm_kzalloc(&pdev->dev, @@ -253,11 +255,6
> @@
> > static int imx_irqsteer_probe(struct platform_device *pdev)
> >  	}
> >  	irq_domain_set_pm_device(data->domain, &pdev->dev);
> >
> > -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> > -		ret =3D -EINVAL;
> > -		goto out;
> > -	}
> > -
> >  	for (i =3D 0; i < data->irq_count; i++) {
> >  		data->irq[i] =3D irq_of_parse_and_map(np, i);
> >  		if (!data->irq[i])
> > --
> > 2.34.1
> >
> >
