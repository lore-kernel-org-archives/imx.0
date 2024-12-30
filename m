Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5E19DFAB
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735540168; cv=fail; b=gNMdtQZXP7h1oqHE0H3OCGs9hdMrSRhvt0bm4AS87TWrYkVb6czj+u4RkG97EFpjRL67+fV/iRZ+fkBfPDy1XfSnV/ZBmm34n7Gv3CGKPD08XNfITdV+xI24IGxQJG9Dk02B3HjjMBy9Z8g15BgCpdAojdeXXlN+/sJj59CY5gU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735540168; c=relaxed/simple;
	bh=uFscfM5snlX8bkCCgScYBhq0cosHkczM0dOglzH9T4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lmYKu6rb04OumRjgQokY/fcv9sOGpG3Dy4uUzKV89lqkwUD0dDGU/x6vsMYDXdvNDsGvJOn4P5t/yxPUmE6COdiCovKFGoK+hLLfzsx6meVt9TsaSr+tv4pgwq61v+TSbfofnzu7x4x6lPRWN1gkTHOB9ZhCpJmEC8W5ek1Wqzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KEDIUkoN; arc=fail smtp.client-ip=40.107.20.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KEDIUkoN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAKuG89OVM2Sp6Oh/gJX/QKPnnaSgfdhh2/EDjLDkgHI6nscOFSpPAhxLkFxBJuBfSiP6hojaluqofwr8J0GcEqD/iuyGOPyCa64emp8LBhe49J0CCNi6n1deTsh4myfTLioiKgLPbQ/nyfAH0sfYGqfi2/yz16fl5+UDDCLn8qTAwliLgbcvaqeN6HBU0xY558fCDGUcu+ccK9nZpqZu1SAvGGPqImagjUWQDLArL+/k4oV5JPhQym17JCAclVXLyLEsU0NP7R9Pm2iizWa0QR4GFbVU21xub5DW29iVD8akdJ2niQj5kX8NvAlnB/T8e4PBde5Rc8uUzGslLHy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NckyBKfmdsLvt2NHScb/q/NHCYtOoJmDk/9ECeGheb4=;
 b=kDjQRmfdtVrFFPoUX1RTC7rxMH39fNxb1BE2nuXvMlD4jzDl8iRturGbzFSIjmiQ4m2LC4uu+NMlYCAT/qP73qbT3Q6bTdssJ6PFwVJVSINv/LEbP/wKCLfVirRveVqs5DtRhgKAI1vK1c/3wmWEB55o3642XuKcDQNLJwgGnx8C3ZTygFbFkoUk/hLq5A75Fg3DyrbMLgg0OBKwGjVHlwBqAh0yV2GQsUnY7CiXyeZQLKj7YAHk9CiWBQvVanpDmONkrc51uaGrkPAqsXml8UJN7jDEqhbi3xYp5a484Si/Onpjx9tgUdkraMHEeihrP/vL/8j5niBRobG25oWLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NckyBKfmdsLvt2NHScb/q/NHCYtOoJmDk/9ECeGheb4=;
 b=KEDIUkoNcdXKpUPBasincp7A8FuQVLLDJZoVww2LT39GyGc0U1oZxNPm2QuFyLUOJfAR8UHPi5f5Z8QTfZHIjPLX9Y8xkelOE1z8aRr6cpAbsAKrp5SEVB4LP06VGF2d8y6KRAeHtNQ183Z9dTJuHyQF8f3Vmw3THc+PhBGwuv5o4oHdUnpkPkeG04fMAJ7rKZoI/22XtBhyKdGjuXyccn0PNNQrwb4mL1e+Pgq+rms0XOjS9IoTjCvvyWmgkg+4b/TQ/vCnGW/sI36xcZyWW5Ky5NvY6CS57Fk+n7c7M1ebESGOg/GrM+hxMjiEIHx8rprrZeaY0eIjbNzRFKWf5A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8731.eurprd04.prod.outlook.com (2603:10a6:20b:43e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 06:29:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 06:29:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Marco Felsch <m.felsch@pengutronix.de>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "marex@denx.de"
	<marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] soc: imx8m: Add remove function
Thread-Topic: [PATCH] soc: imx8m: Add remove function
Thread-Index: AQHbR9IRiS4d/DHhhUyZRtsVcBxxg7LZF/EAgAR//xCAIMgLgIAAGI9w
Date: Mon, 30 Dec 2024 06:29:18 +0000
Message-ID:
 <PAXPR04MB84599B542D5BF51445E46D6288092@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241206112843.98720-1-peng.fan@oss.nxp.com>
 <20241206114130.zt4rkotzbzi3xt5n@pengutronix.de>
 <PAXPR04MB8459052EFE2C6137146F9CFC883C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z3IpCXUL+tjHq9M8@dragon>
In-Reply-To: <Z3IpCXUL+tjHq9M8@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8731:EE_
x-ms-office365-filtering-correlation-id: db5ed77f-17fd-4c04-ca60-08dd289b4a5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?13GSJka6GQR0EACpjomYdMppCTNOaeG8cM4zjNhORxGlOKZk1imENHOtV3jW?=
 =?us-ascii?Q?Olc1577NF0QMQphQodZeLOKngp2I1P8uucCkT7pM+IvHdmcdRK6O/l54Ft8/?=
 =?us-ascii?Q?2dYs4Wi250isv4opJSgy8sL0uTx020I23f6XkP8B7Nmk68/3Q6I+QsK7Yxdv?=
 =?us-ascii?Q?6T9fzHBoWE2zpY8wwyuPU7ZandDD4JdxdP1nv+GG/OUhwDbJc7vlxBEdNmAi?=
 =?us-ascii?Q?QhhYnXyAESXuFHmhjtzkgYkyRbjC8DyH916PYKpWJZalcqTPk5paqZaEm9zg?=
 =?us-ascii?Q?8QMqsaTaOFA8cOcY8/9n0epSckYZ9Em0d7dJW9h41schwx4w0asaGTClGqDl?=
 =?us-ascii?Q?ctGV/0XbZTOB/e9UbgA1Vz6hYMCyYGAV/4uq9WcYNpxeIDJmsm82q/eXROuM?=
 =?us-ascii?Q?4ckRnQa7GqwR/T4EXKk6Wigb0tudXoxDerWmRegxdRfWSbPt0Y3q/O7BSyGa?=
 =?us-ascii?Q?7U7jkHIdr9YJhcltTMgLf0PVpqyzvbtGKCK4FDWUcjAbxKSEWWN6ftTM8p//?=
 =?us-ascii?Q?ncBwKR1wbjQkeXAkPcRtbHEDsG4Bqva39DnlOp6HLWc1OiZOo2n886f6jxp2?=
 =?us-ascii?Q?CgWkIOvYAiM5dMTh5iklfsOcqvCHmxnmr3rSm+clD9xbWndUFCuemuAFz7ig?=
 =?us-ascii?Q?nVT3NQuvntL1WsK1kwBMlgrZyHWZAo+H7CQRQWPEgTNBgemjai1WNR9NlLXA?=
 =?us-ascii?Q?e+MlneN9prKxhyo99OuZYutIbydJYh7j1OLsnLw1s8DMroU0vRUuToQUxmIJ?=
 =?us-ascii?Q?fSXUv4iNmbeiGXhNXpLiaJFbP1DR00kyaedSS8JpeGO4RbMqvVHGrUtBF6oL?=
 =?us-ascii?Q?0cClCLWVmep/lrzVihFT6YxtB5ngq7S5VzqYsdyelpcqU/b9VU1HnusdkgFS?=
 =?us-ascii?Q?TC9cAiTxG7+19oEJ3i5BjAx/80boch2gdMLCuEZdPYWN/BBS2VkAT6dRzJpJ?=
 =?us-ascii?Q?d55S/5TRP+2xIuHzWf1RUqdiSvuUjvGGPivIz24dabicPqlRX9kp6tVcxMFW?=
 =?us-ascii?Q?eEIsy1mqRUF1SWsamJRtYqalRB8oevHm1UZT/OUqeLKKIVHT4/BNeSgnJNb1?=
 =?us-ascii?Q?NO/egmoY4vrpMuDt+3mebFwSSsiOtop/QfwUC0QuS+gqaaNQrkPlcBsG0tqR?=
 =?us-ascii?Q?bIWGVZpL1x7jKxk1lyIg3vKph9mkRy+YW1AD2t1PO6oBkP3ZVKkS3AJ1m/4K?=
 =?us-ascii?Q?Ga2+B6BgF/E/Df1XLITryFHJNCGm7CB4/n9JjztLj+iC1DIL01wUzG4EL9P3?=
 =?us-ascii?Q?AEJsDHbDVe4Y6tEDAUJsttJhW99M0Lct1HsRHNsPpmVw9wii0r+a9Qun9iRG?=
 =?us-ascii?Q?06jBVFraShO5f4sjmRyIuOxDYgjJ/ktnaZ+Arv7v5W0F+W3tpFqgJC0HPlwe?=
 =?us-ascii?Q?h+3CBm5blmp+s0Q2ngLaytjRv3PBS+mNpk0xsIomShQkm7WTJP43gNsGykhA?=
 =?us-ascii?Q?IixSpmN+DkPkKRHivMfbat7EktWPvS0L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rNjRz+gyeoMGzT64ym0uCHB15ruyeRycQFZUNknYvCLi3Tz+DBLNVHJN2kNM?=
 =?us-ascii?Q?AbVDtTZXfO89splqPXyI+bTPkAOiwex7mDiVvquSu7oCFtxQpvdw+L4Rn/wn?=
 =?us-ascii?Q?gPC77mHBBj1mZL8x/jU/bscSTlrpt8LQ+h77S0rJjfNshbdcgW1djgNxXX7Y?=
 =?us-ascii?Q?hYRg4/Y/uxx9TpT1um5JB3F0PpUPTkrh8Tycu4bMqB3mpfCHhDEjXJBAoHzH?=
 =?us-ascii?Q?K1vjt9W/1Ana+osvOrZmDdfo4+/jwfPLJxPGuk+L/+AIs0l4ypP4pYaBDBCN?=
 =?us-ascii?Q?lxYcpdBB+ZGpuEChbIEczBU4XhPRoKWFjzdUFzLX+oq3w9E6SG00qduvItjr?=
 =?us-ascii?Q?CU/n2YixyQOnomwdZ53svKfEeeJT+FgjXqY4KIbaPva9z1sxIwyEYf6w4Pff?=
 =?us-ascii?Q?lnC2gZApPcCV26qgtoB4TPmk9kDOfU5/SQzh8UmwAd+K97BC0aINEBbT3RVs?=
 =?us-ascii?Q?LSki+JSsMmk7en1h3vK/0tURGbmgnEmXQK9LjiYlQeVnbnnuQIDHf8wfn2Kf?=
 =?us-ascii?Q?nk90MlPrgDhLwknK78pChnbWz5Beeed2lNtJvi/rpvfKz04b9P/lxJOW2MOR?=
 =?us-ascii?Q?TB3AuKnvZADfLZ7tJnqrRFXAhBu204fSTH8pvkxdO/HuodC6Bz24d7Snv6/z?=
 =?us-ascii?Q?fUjfiqOo6RXkjcbCApQZRV36xu7vkZUS90X4RYLyVd3B8wnYZug+tw2HYx8Y?=
 =?us-ascii?Q?FS7tXnltmOfJiQuFdqJ5Wiep5HRLb7oSXHtfClT39S+tBPqlxPzTvTRtLoq8?=
 =?us-ascii?Q?S19r/CFHm6BerU6bUrrKhDncd0Ofa/zerWx6AsOBC85uD7fq2fqSkKCpgBhV?=
 =?us-ascii?Q?C39624x/VpnRY+hiOkb27clYd1pxRk0V4DeGiV2DXwvdGFVjJ3q7tZ70yi9C?=
 =?us-ascii?Q?vaH+Vf7w+rqdxEN7/EOejBj27WRCKtXbpA0ySKWLo/zOMhhJezdeb9G2tJ5+?=
 =?us-ascii?Q?9IjetU3ZTb08QPtHIVEYVYZI5KWkRVDvkDCu4n+lmg5IQM/4BV0/2UG9pbKi?=
 =?us-ascii?Q?khtqZcgC+pr5GdOv0T73nANI8dTrj34gSjyaVt9lu5kolowOhjgKyhpAdVp3?=
 =?us-ascii?Q?L0jeAtA3sL1BnCA9uptocOWcpnocXL3oL9dWgOBg0UKQc+D8XNtgnMaRCcj3?=
 =?us-ascii?Q?REH8jIfSVzQkOCOB9sSR63/T0xLUbLa7zDpP4kJflISatg/JXYxooLigO/GJ?=
 =?us-ascii?Q?Z1S51vTDADx21DLwUJil4QillZy9vwX31IE0Yk+cHaOWN61Uj/dpHAyNByHt?=
 =?us-ascii?Q?Mvra1i4rQcaug/4zRhtYMqPCP5/biNSs6ofugdtxx6VkRpTIfjAQxqpaaFZq?=
 =?us-ascii?Q?z5OGx1bOTzTSvc7V7eb9YDB0f8p2l6vOGipJNQRTOc5q5qts690hSEsenB7g?=
 =?us-ascii?Q?nXbmhmu+dee2vzkxPe8Dne6MEbbEfDekjxHAXZkgE4ZkpltE41XoNUTmeJhB?=
 =?us-ascii?Q?DBIP1/Q2z2Qxgv9OBW0EVeYotnSiRk9eTDZW4rXPYKPhHObl7DHCmTZ8NHih?=
 =?us-ascii?Q?Vg+Lv+P4kb0f+uG0jDpNA5gdmpoHrgY/0z/BUamCYc3/WFraaXPdNZvS23oL?=
 =?us-ascii?Q?6aiRC4VEo5VmDCpEmgA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5ed77f-17fd-4c04-ca60-08dd289b4a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 06:29:18.8819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVcDYXSOUYyCHg+PqhLqSmIXYG6DboI8FggElexZq38CwkUaYi2beowzNzCo3Yr6SGZloH0GXZJPluGFAPckzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8731

Hi Shawn,

> Subject: Re: [PATCH] soc: imx8m: Add remove function
>=20
> On Mon, Dec 09, 2024 at 08:26:48AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH] soc: imx8m: Add remove function
> > >
> > > On 24-12-06, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > Unregister the cpufreq device and soc device in remove path,
> > > otherwise
> > > > there will be warning when do removing test:
> > > > sysfs: cannot create duplicate filename '/devices/platform/imx-
> > > cpufreq-dt'
> > > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > > > 6.13.0-rc1-next-20241204 Hardware name: NXP i.MX8MPlus EVK
> > > board (DT)
> > > >
> > > > Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as
> platform
> > > > driver")
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/soc/imx/soc-imx8m.c | 32
> +++++++++++++++++++++++++++----
> > > -
> > > >  1 file changed, 27 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-
> > > imx8m.c
> > > > index 8ac7658e3d52..8c368947d1e5 100644
> > > > --- a/drivers/soc/imx/soc-imx8m.c
> > > > +++ b/drivers/soc/imx/soc-imx8m.c
> > > > @@ -33,6 +33,11 @@ struct imx8_soc_data {
> > > >  	int (*soc_revision)(u32 *socrev, u64 *socuid);  };
> > > >
> > > > +struct imx8m_soc_priv {
> > > > +	struct soc_device *soc_dev;
> > > > +	struct platform_device *cpufreq_dev; };
> > > > +
> > > >  #ifdef CONFIG_HAVE_ARM_SMCCC
> > > >  static u32 imx8mq_soc_revision_from_atf(void)
> > > >  {
> > > > @@ -198,7 +203,7 @@ static int imx8m_soc_probe(struct
> > > platform_device *pdev)
> > > >  	const struct imx8_soc_data *data;
> > > >  	struct device *dev =3D &pdev->dev;
> > > >  	const struct of_device_id *id;
> > > > -	struct soc_device *soc_dev;
> > > > +	struct imx8m_soc_priv *priv;
> > > >  	u32 soc_rev =3D 0;
> > > >  	u64 soc_uid =3D 0;
> > > >  	int ret;
> > > > @@ -207,6 +212,10 @@ static int imx8m_soc_probe(struct
> > > platform_device *pdev)
> > > >  	if (!soc_dev_attr)
> > > >  		return -ENOMEM;
> > > >
> > > > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +	if (!priv)
> > > > +		return -ENOMEM;
> > > > +
> > > >  	soc_dev_attr->family =3D "Freescale i.MX";
> > > >
> > > >  	ret =3D of_property_read_string(of_root, "model",
> > > > &soc_dev_attr->machine); @@ -235,21 +244,34 @@ static int
> > > imx8m_soc_probe(struct platform_device *pdev)
> > > >  	if (!soc_dev_attr->serial_number)
> > > >  		return -ENOMEM;
> > > >
> > > > -	soc_dev =3D soc_device_register(soc_dev_attr);
> > > > -	if (IS_ERR(soc_dev))
> > > > -		return PTR_ERR(soc_dev);
> > > > +	priv->soc_dev =3D soc_device_register(soc_dev_attr);
> > > > +	if (IS_ERR(priv->soc_dev))
> > > > +		return PTR_ERR(priv->soc_dev);
> > > >
> > > >  	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
> > > >  		soc_dev_attr->revision);
> > > >
> > > >  	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> > > > -		platform_device_register_simple("imx-cpufreq-dt", -1,
> > > NULL, 0);
> > > > +		priv->cpufreq_dev =3D
> > > > +platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> > >
> > > If CONFIG_ARM_IMX_CPUFREQ_DT is enabled, I asusme that
> > > platform_device_register_simple() shouldn't fail else it will be an
> > > error, right? Therefore I would like to add the 'if(!IS_ERR())'
> > > check here instead of the remove function.
> >
> > You mean below?
> > dev =3D platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> > if (!IS_ERR(dev))
> >    plat->cpufreq_dev =3D dev;
> > else
> >   pr_err("Failed to register imx-cpufreq-dt: %d\n", ERR_PTR(dev))?
>=20
> Hmm, I'm not sure why we do not have error check on
> platform_device_register_simple().  Shouldn't we do the following?
>=20
> 	priv->cpufreq_dev =3D platform_device_register_simple("imx-
> cpufreq-dt", -1, NULL, 0);
> 	if (IS_ERR(priv->cpufreq_dev))
> 		return PTR_ERR(priv->cpufreq_dev);
>=20
> Then I'm with Marco that we only need to check 'if (priv-
> >cpufreq_dev)' in remove function.

Please give a look on v3:
https://lore.kernel.org/all/20241219145029.1776006-1-peng.fan@oss.nxp.com/

Thanks,
Peng.

>=20
> Shawn

