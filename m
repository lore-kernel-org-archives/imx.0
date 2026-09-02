Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBFC3C1F
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337204; cv=fail; b=eoMvqujYeZmH/3HILOoaJLCz9Wx6JZnOdWpZUWUmi4vX5q6DeNEw52hJpy033fvKXLAC9hmXLlCmbqsOsKmeYT1hwhIJyDq4np3mc5b/QowyK/oqhIt4SWbT2RaAAOtAzuxKQVHALYJ9EGXh3HlpSgVhItswYZIHGm4vZL9ocNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337204; c=relaxed/simple;
	bh=x9vAaoOqFgbFzxWxpoBd5d2V89Qq3Rs8YdHzw2PUj+0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rhs7OGfppLbuR4VWLlaoiUL2a8qTr+wFP/zaapoyRbxhwCT5BUO71LN+ls0unIrz12AKbFAzhLvfarRe4D4KfsGaRwLM6/QdhPyo02tvhmsbzc0WjeQ5HfsBTVL+Dd5HKOr4NfiBRTOWbJJq3QDD9gsYseBqLOKyFlNl17fBwng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OYNP1oAV; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OYNP1oAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATBnwPHEEj3+dRHsr3hs1ZZHweA64P6N8VeM2vxO+zR0uN8qE1lesfNRi7geYZ27W4X3zRsbfPQb4Nj88FPUYuO3N5ZqbHxYBUcMdxVapiEg2OKM9cRvE12pTLoh+Zso/RtQCoMmmBldvPt3ySroz9rPb5ggXC9iovtfBetiQZsenx7Hm5jxJargA/oF1EWj4GDNGwdlO5zzUYZqNb5nJJtsXqcMyWCh45Yy2GaL5wyPlU+aSGcehLcNexswCKN+e751FS9DlrcRolrJvuHveW3j2Gq2NV/WB+wPar/nHVqVtBaxA1r1igJWCj8jHF47oIOnU3xJBu8BMJWUkeY6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hfsGZd21YdrFEvbFw/4z1hLlVfZVzZjxpqA0LnxPH4=;
 b=OhPKFAkng1iS7eUSsQb9cdYtK9BjLM8U5yz+0zzC8rCJXUpKNXJlZY3mIMzSDorT89FZPweFX9hy/CjY8dzaIGcbifneGtzYARzZEOnwxFJF/82kIrjA8UTUGIHkKHKqRj+9yXC98h+YxgqzgkBUJtYFGFg8mfLOpLtnEKmL1stQXzioR2EFcLqU6Z5e5C2nV57LEO6uUc5OqCEaXORaJRhRKGjhMxPyPHwn4g7kmteX3WjPITDryaSKsa8ntl7om/XGlqM2Yd7EH2QT2B53cWKSMJpL1p6y9flMIxoOvcbU2r54ZNtuKU8FKY8V1quIH2BbNkCgSAys76W9b7rIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hfsGZd21YdrFEvbFw/4z1hLlVfZVzZjxpqA0LnxPH4=;
 b=OYNP1oAVvdqERQMQ00ixdfWbxPSqyhL7ZqPr+y/bpxiI1N2cKa+wxrEStCZYAcTPNGJljyafEpXnoYBBldOj60sH6Ja5YoDXEKiQUkaH6VaMveqNys7HK2c+/k5ixbqLRqPi2Jlhg31pLPvXMzuWRshmGeyb4duXSC5hxDGGtU5qSjGmWxEkZHfi5UKqdR85CYr3hBv4RvM79AFbogZDfo3Fy9xWab35h+Sx39dlgwnVGUJ6Bw2xAuvBssUqwDmWolLV6fy8XIYh4u29HUAtV4LpXgt78RutQOCiWCEg8/9QVTey6BbPGPceXb0ueWRDKaNtZwzZpyiF/yzzQo+m6Q==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by AM9PR04MB8890.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:19:59 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:19:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bratiranjan Acharya <bratiranjan11@gmail.com>, Aisheng Dong
	<aisheng.dong@nxp.com>
CC: "pengfei.li_1@nxp.com" <pengfei.li_1@nxp.com>, Jacky Bai
	<ping.bai@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE
 firmware
Thread-Topic: [PATCH] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE
 firmware
Thread-Index: AQHdM6wcDb5zkmLI3kW9kaZPy+4am7a6/6aw
Date: Wed, 2 Sep 2026 08:19:59 +0000
Message-ID:
 <ZR6PR04MB3757764D1F27A73F56EB6E36E188B72@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <6a8c10b3.c4e4d4f0.1baf6a.6667@mx.google.com>
In-Reply-To: <6a8c10b3.c4e4d4f0.1baf6a.6667@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-02T08:17:29.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|AM9PR04MB8890:EE_
x-ms-office365-filtering-correlation-id: 84715370-0c39-46cf-b7cf-08df08cafb0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|38070700021|6133799003|10067099003|56012099006|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 ElGe1HSDGRpPOfv+n13QFccNVNRtUODnHAdwZptZvT1QPv0XLgrEJKWay+lJ8hDpj8qOaIAcySp8mxvycgv5PB2kdJUQuV+bKfixt95WdcNZ6GE1p3RfCx4l8Jc+k7/fv9JVgy40dFFAhwtJh4Njr86kCYEzqk6WBvjnml8SOML4m7DXfDIMEEwsoYQeRcX4YT0s4YoT/vXnuRLeMxSsLJb3m5dRPqG7oMpthArrexWx1zb5pP6CGlNHOs+MQLDv1XJG4tE6tSivAJmPufTOnWcr1Nnvvow+Nt8tRvrMEEsBfkBI7p9Uik6HoahGgpyIHljGGfC0bgT8y+1lPmo9Uvc+dNXzpNXITk2Q0PyNH8WEWTQOPbNHoGiCLUcJOqt7g9R8YrGKO3a/39G917hr8B1XMZRHS7nxIHUKymstglI6nC5e2bCQuP6mZh1PONDMIxqQ8+GPwl6LjJQWaZcwAIQ+S4wHsTenyU32pB+0L9tG4JYHYAeRvyeHdkBnlPd1DgMexZmEocsEc8Fp4tlQGjJ44Dwa5b9k3h9VTmpwkX2zyx03ATwdceE7JNASiOI6TrDPfQYZBZllLoS3Tvx/RdE0gSe0Ctra/1jRRr/xna8J3PWbHwROUbXl7ed3xMJdwIvG5NbTyvYFQXz13OrHHwr5YufU4F7Gos00qalyy22OlTXE1XkwlHVTe2oZB73ZXbhOGQyOScRzxfKDwRIIXLBae3A9Gi+v+gUM2EIhulY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Sxw6CvZOP/UOvZXCtft3aaLSZfrzzuTyF12dNyIJ7VHOXNM+TTr/5+yxuwEx?=
 =?us-ascii?Q?B+oyiZDvc9m2Wk49PthPAKyszD2C11k67rZAUhdVIndrqaralihBV2GMjDAt?=
 =?us-ascii?Q?grm8q/VMTRhuzN0NiMxPcBObZVuf2i8nrpSdlQkr6J6VMJhnJOMuj3tiqLv9?=
 =?us-ascii?Q?v+2qkhMO6Axh4/nn2ySgQepZUboYemya1/XQ4O6V+WT6psKzoja9GDySRUah?=
 =?us-ascii?Q?oCE4PIqe+N36mdsFekRfFLkK41LEY44dbSM2nJp0l8SRzSNasgPAkbSAk5Bq?=
 =?us-ascii?Q?74pfIGdT2C/VG1sgPnnEiYSDpWbr6FfZGJrv7qJiqlfREdkvQG0dWx0xHuoN?=
 =?us-ascii?Q?5B42PVgqPpsy9U9frH/KsxIjohioIPCH03gP3i1HVFa21n2PeeR0NGq4EvWh?=
 =?us-ascii?Q?kJ+BNOpt4erSTLu43Y2zWh7PHE6H0m80rqD4fEyZg31oSzmVcC/lOzpSwW3x?=
 =?us-ascii?Q?fH9Rc0ZhsH+QtSRGAhFPmrG7JIfLi69d+pYlcddeXFCxIt0PbGOlt2sdMjj0?=
 =?us-ascii?Q?8z86aUy25yHCbElTqEBn2RcUFaNm9FQ8CmBmFbC9jbXkGilxFosxvHCt4wiR?=
 =?us-ascii?Q?7C/j0hpKCbouT6DEpbZcyUbHTOZVkOzKu6hhGmsocPoBWux+sxVk5gPBVUxp?=
 =?us-ascii?Q?hWVYSL1OJAWhZ0tvbaQ/OdLZP6c1fU0IuD0ljxMI2axJst0BZzFfTv9E8a3J?=
 =?us-ascii?Q?+9rIyCNNj6v8COQlITCE9rjlPac4oPQFmtWQ7vmae9rf9im4KYM3KY8ahZM0?=
 =?us-ascii?Q?QWKbAwXlKbfRGzMQ5FwD1SAJhXaHmJpaqPzKxS/n7hdrTNWyKzx9fCWkLVsE?=
 =?us-ascii?Q?JA38OvqcgiSFr5pWhry1DRFS8Po3tB4Vf9zDdPQAFUJoscmBFhR2Ag7elxYh?=
 =?us-ascii?Q?/LLcN+uB8qOawv5EYH3uuy7NAGKUAAM1zGjdd45Yl2A7F6A8zpAEoJO1TtxB?=
 =?us-ascii?Q?2PS//Kx+ha0m73qabIZMoUrg691eT9bBiD5eqoC/q75bl+jyBXY9uO1PmOcs?=
 =?us-ascii?Q?I9ocPQrBBnQV6IlKysHYehHkRZPqakxYWLDb4C48dTQLIYKrdpjrbtwehZMF?=
 =?us-ascii?Q?4/PGMDxGqzop9dmzxb1iGxTsVCVE05LtcnoVajP9vMRFWfVQaFuNUzDIoLdH?=
 =?us-ascii?Q?rjFeHl3NIyLw2NiEBUycT4VdTnumOEsK1QKPeheKTslDBYtjTl0Ga5bTHka4?=
 =?us-ascii?Q?YRTHf0RbB5DZUfe5PyVSlWxOWXRzrS1QAbY7Ih+Ik3TUzJfFsl9VUwTOiPIA?=
 =?us-ascii?Q?uxW+w8T/qyEQmaACySLJv2odLBuGOILfssHFbhbFEWPzHc80M1sA1C0viyTh?=
 =?us-ascii?Q?czaXuRPdtRs18MNVt0vN+C80HtuxefJTkrNIAZ0k5fkNE71IC5+5YRBqOpZt?=
 =?us-ascii?Q?mbCdKZoX6CaeaZAzGk/6x4AJ30xDFE83+olVtNjLc0V9sI/9Hhqfbx2dbc6a?=
 =?us-ascii?Q?DAjQE0TG1ZPeNGRoO1LXp2D+pgidKFO/wtdc6IGgpDSYSA04NCEnzjJyfu4x?=
 =?us-ascii?Q?Mu4AUQ6OoEDDdX+nHXyn4cwOFEqM7a2JJf19yZud6m9AfYX7Rjdc8DDI/PtN?=
 =?us-ascii?Q?dRRHd0EavtxjdYHxOBNMsZZxou4KyR7lKVUhMaFLUJg1A9G+iQEK5C3DfT/t?=
 =?us-ascii?Q?+CrVw2MTnTDFf8yBfUXUJIP0y+bHRBI3ZrQ+23uJ1A8XBJZvvD+CYa8sWWiJ?=
 =?us-ascii?Q?n9XoASkWiJ5Obb4ml3SZ1AXrVY1La9xjbzP4rFpXF9QAucT6?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84715370-0c39-46cf-b7cf-08df08cafb0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:19:59.7686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19yKu1Vi992YQ8TeGfDZ+oJ3RpERiVwXaw+iwd0hxKX06DiCSwHoFAN5B6yg2kRCk2DPXYpsckpGLdlzpM6qGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

> Subject: [PATCH] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE
> firmware

Oh. This is for nxp release tree.

>
> imx_get_se_data_info() returns NULL during early boot because the
> EdgeLock Enclave firmware takes ~900ms to register its services.
> Returning -ENODEV here permanently drops the driver with no retry,
> leaving DDR DVFS and lpm-cooling non-functional.
>
> Return -EPROBE_DEFER so the driver retries once SE firmware is up.
>
> Tested on i.MX93: probe defers once, succeeds on retry, lpm-cooling
> and DDR frequency scaling both operational.
>
> Fixes: 711990e353bb ("LF-13910: soc: imx93: lpm changes to update
> exported apis")
> Signed-off-by: Bratiranjan Acharya <bacharya@enphaseenergy.com>

Looks good to me.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
>  drivers/soc/imx/imx93_lpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/imx/imx93_lpm.c
> b/drivers/soc/imx/imx93_lpm.c index bfa52ff8f..26d72e3e2 100644
> --- a/drivers/soc/imx/imx93_lpm.c
> +++ b/drivers/soc/imx/imx93_lpm.c
> @@ -621,7 +621,7 @@ static int imx93_lpm_probe(struct
> platform_device *pdev)
>         se_data =3D imx_get_se_data_info(SOC_ID_OF_IMX93, 0);
>         if (!se_data) {
>                 dev_err(&pdev->dev, "get se-fw2 failed\n");
> -               return -ENODEV;
> +               return -EPROBE_DEFER;
>         }
>
>         /*
> --
> 2.34.1

NXP Confidential
