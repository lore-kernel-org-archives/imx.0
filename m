Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7A3C4574
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129777; cv=fail; b=A0SaKFCPl85F0vivbhgRA4wH0cCrclVUIjQvRYBMlVLE0c0ZcXWbtPh+B2H1Dh8puXOvQ4RrtrzSNS8JPatLuLE1sxlYzDtJZa/uvl2hxpW8/LPTUW7hmrjzBJvAkmf/TEJGk6cwPkmHLGn7Bfz/uRGRR77UZhU8kJorM913Zns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129777; c=relaxed/simple;
	bh=6wL56upH5S/rpkGFdMidZArB5ssW92aT21cWB3ic40Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dQSBo/oSPHa5HDyD72+psW0UH29Zy4ER+c1PIzelABEu9XhLNyhHK5b2tFVxZ0/Qwn9eG00Jf5Ldg9UquDgpYb8a1ryfLpKbUbixLM6O592zZLJZfkCCvnqgkxD96Lxru6W1GOOGdwDelLCA8B+vPsPg4B8i2zGVka945PiJLSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qmaiztvf; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qmaiztvf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vx6nd77G7ONJplAQDdim6lUeG0TexeMtsvyKF27wOwJ/UHJHCXk2ocVtkVNoKlkEb/WvdtbaIuFg7aVzVrATIhedOURg5DgCq7Xen36CDoTHnfWuhHboaDl2kobl0WkqmbtfiwkYPGc9dDBwdbe2AeShf3MWZeF9n/9HoeVHXW6uD7ZngSYQ3XrhXKinc5UoV5vt6Hy79vv7ISi0HikANwmZGX4N4R8HtX/cdcycWgBADCLGoIgt34MNTRTx1Acoa30hcYA1bWhyi/PHiEQnnbQZqERn5YR8JPkfEBjWcTc23aRYZJPauCoADRR4jvi0L2jQoViw9FJwmUuHMzfAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZY+5Lz0C5HRqQzdtWjCKe0sIsjWLZBVb/VZvBiuFoSo=;
 b=F5fVBa3YbYLlW/3ua5j1SeqR1vmPgjTTpCyCkdcYGa6jC7IF3UmB8p2kZ6L5V6GRf8qf/PYEekoUnoi378vNLwaX9xGTHaSxgEi2NEO8VG23nYqA0bU35Mti1Hgnc2vsDkSeD8XCZ9PkVOwsSnafwjWPksu/TSlhszsF439iSe92xzZ95w6VcEy6cVRSGtcoW3G0DQyBzhUphD1YGLI50k9Ui2QMIB8QOjLYClrhQQby8O3jTPmAKpl8ZD2bhjcm2l3aaLu2lF7uJWGyRgoW7IovgJUA1i2RgMHU/Un9Vkicn+QkrupqfmLQqfOR0YXitRMIImfyiuYTvin3vLLrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZY+5Lz0C5HRqQzdtWjCKe0sIsjWLZBVb/VZvBiuFoSo=;
 b=qmaiztvfHN3fZ3NmasGO9Pr0qbRGihCngWNHit1WewX9jyXcGNpOXp4nWoLjWH19cxr4Ef4furdtB/JBjb5UB3iMHjV6WWYdNYcu7Mt8AuJeRVA3sStvitKK4I1wo0b5txhtpPpwsQwK/xJ3/QPeMy0MI6kfEMDECmPn4b10YY0apFAjWz+AaMgdIp+TTuaqTy79vROac7Z3vHmSDFTmB3fGIPp2C2Zu4rgynymozqhWO5wypJ07scz6tL5m0/AbNIKEgs5KIvqt4FNhW4l9ug+N4Ubr2Tzr/SqF8DRQwd9hybqj6Ff6zA05M0Gl1T1FqxJvrB6rEkBef3hQV0hGFA==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by GV1PR04MB10106.eurprd04.prod.outlook.com (2603:10a6:150:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:56:09 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:56:09 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	<jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path in
 probe()
Thread-Topic: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path in
 probe()
Thread-Index: AQHdJj3HEERS6c/RQEWsbUCQeR/5LLaS8e+AgBIygDA=
Date: Wed, 19 Aug 2026 08:56:09 +0000
Message-ID:
 <AMBPR04MB12334483CB096D114238A30EAEBA52@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
 <anYroThNbI9hcU6z@SMW015318>
In-Reply-To: <anYroThNbI9hcU6z@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-19T08:55:18.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|GV1PR04MB10106:EE_
x-ms-office365-filtering-correlation-id: f9a99fb0-dd3c-435b-f5d4-08defdcfb6af
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 KZI/Ek0GNTebK4gs5Cg/wbZ97kgI9zJXQvh5iHzt5N0dCMN2cdIP/rJYHdHY4BzERENJXoOsPqmHcNpZFoKFhnSBSfCdPtUkWEEGQoY8/SO3NlghlAzM6KEPVraw33S0z9fzPd1GofBJ8qrSWJvVO9DiULikrQ4tGXpVLmKdztTHrNJ3maxV/Q4rnOOKzubdG2n6v6bFHhKKtZH3VQbRxjLTS4Zpt3M0/CE25vDNwukmpOeXJtIrEJuYEtZz37d0AZRPlZvZasiVtAvQ0ejV78E6h0dgZv4+miEQJUaiWL7g0G5nWkrnExMlUiZVZUYWvSexwWLloIhl+/XxcdgjWqSGa57+Vbx4MVm2whkp7Qws4CmlUkH6wHdaLI5QyvWO6EMDM0gmUQMuPw+mqZEcp0zxTKeIi8bJEOSFhwe2iygIP+Y/miaAH24RWZhv7ABy+KCZ3kFzhJ7A2O4qR+rWhrZPB3cPwFYG3ysS9UbPlBNXZic8QMnyjG4v+qQ12mFP30Ukw0HnnUp1F4fGRhUWgggrs67FhKeu3s4Z04c7Hg2TRaIr8QacF10dNGLerYcHhUO2Y7zIW4n2VBvHaoZ7kFv3iWDrIfZp8PR22hc3ns6Phk30iu560Kpu9bZRc4GtB4IamyIw32iQ+XsFKUnLFUXL5vJClpJZdKMf8+QanFdypPVbiBzNgBsYr4euduETwWP7a4tVXJElduxcKj6ptlmrOYIcvBX7t3ligQEK6vM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?taKcYTfj7qsov6fIG1XcpFFKmLcFUKxUIaHxqP/WIe3nD+KiPIctuMoRSJca?=
 =?us-ascii?Q?RGmIcomB6hguZ38Xxn5IrMJ5UykiFa/OPcucrn08H+BWeGHBNOfStIB+bY0M?=
 =?us-ascii?Q?ZQZw/zWo9F1qfZo6kS+xINY4kjCc8+Y6lUmtF2P0s8DvwJ/RAdeFgGp/4/Jy?=
 =?us-ascii?Q?5WuXubCK6m391Pi2HoVxch6DOnUQ155IACS83nfET35Pne9n/t9p0d7vamW4?=
 =?us-ascii?Q?GV/veaKh2+kGMNwfrFKbmkinPNPIWZB9AXo+J/tkKrzMIbBCpg8V1+ub3WII?=
 =?us-ascii?Q?xEDFH9OIpsR0mEaWPjdmWQ1tiYl+JRvcje9GP4dUuM2l3bG9p5hAOJnDmmYy?=
 =?us-ascii?Q?vS3uMsOxvFraXbGjE/jYtg64po3cb6ayeMzOiErjtMquDBNWCBQY7166L/Xp?=
 =?us-ascii?Q?c1+osTom/0jkUANerDmPXWzVuJYLcfq4+JGIIyVWC+KYAHh1/xrufQLNUsj/?=
 =?us-ascii?Q?NE+QDPdA6KLzVbdSrqb4v4tqirFAd7XxhTc/hLD0LL90kfoNtwBZZksCrAsT?=
 =?us-ascii?Q?Qdex7jNoWHbTG/OMP1PlFFTuDB9OECWpF3fCggQyt+Z25x/GsTb+QGShQ0de?=
 =?us-ascii?Q?bvWFrnC8r9xmrlxNQHfmH/Jf4z4UKg88Zym53luXy6MFnegG/oGgduJ1hvdO?=
 =?us-ascii?Q?pFliIKmOS/59wuFPjSzs33dGVmWSB806tng7TrKm9Avq6JSbX41aL7uijvM5?=
 =?us-ascii?Q?P6maNYcCrqrDSnkhGHfBJ+lOv8usXOjWG94FzDvqO7mKsLfqJ3OdmjEYrZVy?=
 =?us-ascii?Q?4szy263KchwC1mfQHJtgw/J0qCF8hgLwQ0BStje6MCsvkdTUfKcl2Gimw+HP?=
 =?us-ascii?Q?OK8SEyPTmzuADLrEcO/eOHJ/mmkNiT+ASEdn9FQks4MDwsKRtDCzLrgj27zn?=
 =?us-ascii?Q?icXlakjKvS8SPQTzfe1oRbFxEPK64Dq09/EhrwxpO+pneVTgtLKgXHm4Vz3t?=
 =?us-ascii?Q?5A+ahBSJJPtQ7u7aXO5CjxSX3fF5CKYTtktHLtgEdWv/VamXsiRJWBZWj0MC?=
 =?us-ascii?Q?zqWOOvAtvCVEJalX0L8qVsIv3Qcq0Qx1KUh2gExL8Tr7jBO2Utab0H5aGm65?=
 =?us-ascii?Q?sZcOv8SITTAguS+W5uFJQMRSxBB1vciaV9e96o69uNbQNz/8hF1beB7dJrpy?=
 =?us-ascii?Q?KSSlmG5vJnPFnm2SBVwNPxWCBrcE/cynq/r+neJeM1hZvxz6kmeWuHlyadHZ?=
 =?us-ascii?Q?BIDENCxgakNL8x0eIrLFLru+1YxJ5qB0DdowUjTQUBx3LHzxqsDRz2oTQA8N?=
 =?us-ascii?Q?xtuJa/lvv/fSwq50xeC4ibZ8ThURqdLhICj2NRAliJkEh0XgWugOIbFyNBXk?=
 =?us-ascii?Q?0QcfaxGWqiLhjeaPiO2C7Tk7nsTnsf2RjHVs/n0ltK1Nq9Hs0/GvluYM8xoh?=
 =?us-ascii?Q?4Mj2Jym2aMZMsSGSHTZyisF/ZEP2RR4X2IHFf7CZamMeOtLsQgl8XPUUHop1?=
 =?us-ascii?Q?DkTOkvocT25w4JT3AdbU3sJz9g3E1RMIignuS9xaLRdtglluQoAk3wpkX2Bo?=
 =?us-ascii?Q?vIUaiANPT2dnyF9h7fuLOdez6tYrJsZBCeUos7PaeXKqpfZoJrRvsNyzuTB4?=
 =?us-ascii?Q?IuFIr8rr0eYvhyJG52KjZIv8xqgJevuzupCuIf2MauDI7Z4T2J706HSjgE0N?=
 =?us-ascii?Q?mcYTMJjXrNP1uEf2OEz6RN68EluIv96koydCRSy50BQGkxFiLbLVUY4u6YeK?=
 =?us-ascii?Q?xumbrKeFzXgJoUDHhs+bByULwnwIMEGnTJEypd/pJaz2QB7kCSYUXuErH44W?=
 =?us-ascii?Q?t9K45sTbBw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a99fb0-dd3c-435b-f5d4-08defdcfb6af
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 08:56:09.8151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZryGuWL3HsJiVBVPooCjA5o5NAsmp76/cqJDByQSL/nKS5Ru/s6cBl4h+pyD1Wx3VV9QQOwcimkFFqxzMIt2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10106

> > From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> >
> > If the fsl,num-irqs sanity check rejects the value after the IRQ
> > domain has already been created, probe() jumps to a single label that
> > only calls clk_disable_unprepare(), leaving the freshly created IRQ dom=
ain
> leaked.
> > The domain-creation failure path shares the same label, which is
> > correct only because the domain is NULL there.
> >
> > Split the error path so that a failure after the domain has been
> > created removes it before disabling the clock, and a failure before
> > that goes straight to the clock cleanup.
> >
> > Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output
> > interrupts support")
> > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > ---
> > Changes in v3:
> >  - New patch, split out of the single v2 patch. Fixes the irq_domain
> >    leak on the probe() error path reported by Sashiko AI on v2.
> >
> >  drivers/irqchip/irq-imx-irqsteer.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> I suggest create helper devm_irq_domain_create_leaner()
>
> static inline struct irq_domain *
> devm_irq_domain_create_linear(struct fwnode_handle *fwnode,
>                                                         unsigned int size=
,
>                                                         const struct irq_=
domain_ops *ops,
>                                                         void *host_data)
> {
>       const struct irq_domain_info info =3D {
>               .fwnode         =3D fwnode,
>               .size           =3D size,
>               .hwirq_max      =3D size,
>               .ops            =3D ops,
>               .host_data      =3D host_data,
>       };
>       struct irq_domain *d =3D devm_irq_domain_instantiate(&info);
>
>       return IS_ERR(d) ? NULL : d;
> }
>
> Then imx-irqsteer this devm version. So other drivers can get beneafit al=
so
>
> Frank
>
>
Thanks, good idea. In v4 I added devm_irq_domain_create_linear() as the
devres sibling of irq_domain_create_linear() (patch 1/5), and switched
imx-irqsteer over to it (patch 2/5). With the domain owned by devres the
leak on the probe() error path is fixed structurally, so the hand-rolled
err_domain label is gone and remove() no longer needs irq_domain_remove().
The helper lives in include/linux/irqdomain.h so other drivers can use it
too.

BRs,
Zhipeng
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > b/drivers/irqchip/irq-imx-irqsteer.c
> > index 87b07f517be3..a2f0629b22a3 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -241,13 +241,13 @@ static int imx_irqsteer_probe(struct
> platform_device *pdev)
> >     if (!data->domain) {
> >             dev_err(&pdev->dev, "failed to create IRQ domain\n");
> >             ret =3D -ENOMEM;
> > -           goto out;
> > +           goto err_clk;
> >     }
> >     irq_domain_set_pm_device(data->domain, &pdev->dev);
> >
> >     if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> >             ret =3D -EINVAL;
> > -           goto out;
> > +           goto err_domain;
> >     }
> >
> >     for (i =3D 0; i < data->irq_count; i++) { @@ -266,7 +266,10 @@ stat=
ic
> > int imx_irqsteer_probe(struct platform_device *pdev)
> >     pm_runtime_enable(&pdev->dev);
> >
> >     return 0;
> > -out:
> > +
> > +err_domain:
> > +   irq_domain_remove(data->domain);
> > +err_clk:
> >     clk_disable_unprepare(data->ipg_clk);
> >     return ret;
> >  }
> > --
> > 2.34.1
> >
> >

NXP Confidential
