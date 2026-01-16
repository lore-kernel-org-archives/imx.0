Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CE357A41
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558485; cv=fail; b=kEAlRCTrHuBNYsUBkGM1tohjK4uzMv4eYkozav0op9Ofi6tkG73tuNp78nEZQ46CeIELghcuCOPV9FiXsfpfiYmPzqPrU9V6k4XXJoaP1Bdb5r8PjvPDZ5Tbsc9Kd4lFaeKGZEn90cImR0BT+skVJ6JcQnAp8tXpcQOwvYulg6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558485; c=relaxed/simple;
	bh=Sao3B7UBJI+te8sKD0d7wsj21m1Rlky/Vfoj8N8dtVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HK4mBuCbwtxAEE1WLgfqLCK1dVINegVlZjMv6PriE6PmU4BAS436aioU8PBzTKrwCBwDqCk5PeKxIQJC3H62qB5+zcytxtoBRmdpouyJz2zqHirK/bMSoTAp8t5IfNtI0MGFwRdupFBo2cpIKC96RUAX59jujyowri8HW8Ndrio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y8QSEoT/; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y8QSEoT/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xft01HcL76NYCHSscL2aVGbVnAXXjnfe/54k2oDuppchin5+utW0aNXgThiOmTORkdKXyA6yKaFt9HDV9PoSNhwStWm4OAP3ttPM3kqX7r93xHiQESZoXwCZB9B8mw6PFbF4jOFZySlQMneeMIL6rLpLcEoi5aJgFBTo4MAvslIqQ9xfxb4ch7NAw5p6OBBu3TwcR4E+K6Sv2XqDgedaeGhv8A0amNSmPy6E8+EDKyK5qQ1OyyWpvshg/aB4GsRSfje2F71yk8Iqss2jGPCfW3VDepsmQn1DPYQ0egI/Z8aCQyBxRIQApWb3u1PVvlh5X4mIogSVvfxsYLV5KR/AaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msJ/sTAAbi+tdvtomBkiAx4qwOG74yOXnsgdxm65kEQ=;
 b=gB1rm/SwG+EFG8QlYqVOpHZX8xNU8lankxxSTjInOh23FSZXpO2A5kvYa/PwareEH8KCR0Gln7UAoDw3ZLPDwAxoE/oXIL/xIfzdkhGWBat6JbqOprHlCbqAfg9TfCU/18h4ii4jy6+kB/1CNZj+q+ZcXt56no3Iv9JvK22FdZAbCVlzeubIkYd0VY9QiyJuyDmrIb6iqhfNFFUn38CyO3uFNi86u1OnsWuUsnK5fQWlmvcVtA7uKvawkL/CoZdc/Xmj9gWl7Vb7urGOj5s8SB1KYlOrCEIsk05hc61uconjkBe3ksJCmk6QQSp43WflIiTN9/qXwA7sWfannXPwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msJ/sTAAbi+tdvtomBkiAx4qwOG74yOXnsgdxm65kEQ=;
 b=Y8QSEoT/vdIUlpx5b5Twyd3Lq3I8PT5e9ECx2H3ohXrEUE/RE/JMJjUaC3M0SDmznAgCkWT7/rHfe2gdi4lESaSslKMVfjRNX7Q9rQJcmPQEzBDspilgMtNKdM+QwqENRny9PHYbmau7c1e6v1OOEBfdQAmN/al26iBOgj5GfFUJ6u2FLVPZJ2k99XJZRyg/IOdubOLxVC3BZSPWZEWstmlT96V8eWQzplsOtY+4fajGV/aj74D4q4AtQ752uRSz94ZdNuouvieMTKTR/hI4MpcN0htGw8czr94AuSuIkbmKQmPh896bitltr1LOH1cNnABJRfd1xbkEwTsdqWdL4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:14:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 10:14:39 +0000
Date: Fri, 16 Jan 2026 18:07:20 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
	festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Message-ID: <luak64ms7n6fxfcozfmnijsdft4dn2ybiegmsiqbaor32vn3bw@2nwx7hohyzmd>
References: <20251224111807.2925675-1-xu.yang_2@nxp.com>
 <aWe_oNDOqHnQo0X2@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWe_oNDOqHnQo0X2@vaman>
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d83d33-41c4-46de-aa57-08de54e80f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgNH7m+FpTL9NaGagayZw7v08AEEBqSC5rgEBzs1JfOC3eKUK6NXn8WcLhpE?=
 =?us-ascii?Q?XwiOyvXW10JcGkEGsuSM1aypaIZ3KbYi55jvGXmdwyrAwtkhQ3rkXPBeVH+r?=
 =?us-ascii?Q?pt6RuwunnG6YpAWuokedRdJ5VvJIq2yzVimNeX8I4w00cbbZZChVH+gTfGRY?=
 =?us-ascii?Q?q/df/CjiY/3BuNs1ltiDaVkJG+vPYP6GQStZ9saWidDzqdFijaucAdTe6r7i?=
 =?us-ascii?Q?0mOC8XM1vDVlUVPpVrQJ/lNmfa73nBsOoTK+hoR1vStyMnytubO+Gr2RW7Ij?=
 =?us-ascii?Q?P5al5XbdZwLpD6KSecGeLPWZfoZ8FOOeuLokKMv86Q3Yr4p3bvczK0gRKqre?=
 =?us-ascii?Q?ATFytv+RNOSbQa2MC5w30QkUl1uQHkVgKGcZMAV6uvkmF8vIwc27wbR5c4z8?=
 =?us-ascii?Q?kIl0aFQvOU8Iy2CP8Q1QvdiQdRM6x5f1UODc6zp/z6iSXDYYHcQRXarFxO73?=
 =?us-ascii?Q?BtWOOcrosT0N4USkTyD1ziOf+mdzZ7In/b3DrZb5KYQDoUTbPsGbHZ0eB2j0?=
 =?us-ascii?Q?sJRJu3v76FtFUbed4hvsnbJsT7/I1ro6eisGb2/L5CR7YU+vHzQtfHQSa2Xm?=
 =?us-ascii?Q?qKiqhTrPjXgm52FziM5VcMeNeFgshEbajcqfWdN0XJis3zpFVlFq43QjGgD+?=
 =?us-ascii?Q?26WyTdOAZjp63shSxSDjuQQmdAyKMSlZfC41BNLA7s/mNS71eY7y2Vg33psN?=
 =?us-ascii?Q?cssm92s8SOhUZurREKACGy2THefu3rrWjOGHIuyELzROMJWydUAF2zQ1nSH3?=
 =?us-ascii?Q?Je/5zdEVOAizEvrZohZtyZTi5zS3C7MsADGt4bgWaxMfwuGbjv1242CC9+MV?=
 =?us-ascii?Q?LUc/EusWUIGn8ozyHVQ0Far7XZ93cS4l6TvZw+OhOItwwcPHjbZHUDiMaoX7?=
 =?us-ascii?Q?mTnur+aYKC5cET35QEDudsXYyya9PfY/1jEX9b2UuI6vYV9VdIo8VbSWq0tV?=
 =?us-ascii?Q?kOrlGqD2ctHD1Dagw1sNlMffxW0NgTEDypaF6IsQsq9oysn9LVruBC/A54i3?=
 =?us-ascii?Q?yeaIbGWPqv83K66pUEw+W7Z7GX2v1IJWXUTcaTMLg0FxUahlkF6Y8NwQGKni?=
 =?us-ascii?Q?/koa2ouIxzGBzQI6GD3SJek8VH9RYGdBXvsa1AuBTg5QAjL0ah/hPA7QtGMF?=
 =?us-ascii?Q?OuFC4+JLGpnio30vRNs9vC/UCcNL8UT1SBhY8Yah9qshZn0hhalyIzAKn9sX?=
 =?us-ascii?Q?lLLQmVP9Uwm57SlJC8pttg1STHHLJvFgVgxwwoNn8sBOwEvB+a+2tBR42dPq?=
 =?us-ascii?Q?m0hJ4qC7xZeQhOdDkB+yFijp/QkhO7nxGD5Ij9WESDsHI0+jedx/x1n3fdl4?=
 =?us-ascii?Q?bmEc1VAmvH0ZBgw1QgNVRkQC10IwzEagMr0+OhW1Ss8NgeksqUzLxutkPdh0?=
 =?us-ascii?Q?bJ9qw+SiRwG/SObnvz5OmypaXC78sqyN5EfyCG9tU5ZXuefQ8Gz8W5+0SH6g?=
 =?us-ascii?Q?yMjmcLQb5W4WRfhB4e2ZlCFXQq+z3QMuYFbKIvwQpkVcQ7QYYsX1IehCaqNU?=
 =?us-ascii?Q?y0cnFT/eQtEkOTdiHkQWUQBi+uqj5DyRkzxoYt+meGoZJzyNZmUK8k+Gg7AJ?=
 =?us-ascii?Q?JWUf1TQ+NXIhWyBYj/gtObJ9NO6vvQSp07l5T0e9v/u10ZGcLexUlM6vtmy2?=
 =?us-ascii?Q?iT8j12ItD+g6Y8hTFKxyc4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OqkgLlVZElPt/Ff2yHcpBgWRA4KTW3wlnWhqcMRSnxJysfyrOvyEyWLb0zEa?=
 =?us-ascii?Q?MEieSelSFK/cU/Ev5xcADfoObZZYVX7NSMPt6cC7xRsespXRETiLGC8CkbUI?=
 =?us-ascii?Q?edsIJ2Y04472fH3c2JgJEpxndRV+wx0l8b/vD20Yo5qM7fcJDdWkJOeF9FxG?=
 =?us-ascii?Q?s66ISZ24z4+m9piqjbPIm11K2FyqjuZC60gewBmqwzsBnCzcAlLesDCeQFPg?=
 =?us-ascii?Q?WkwUAKkL7b7TEkbxk7RMyorglhy31rTFHqzO54HkLSuKxIMGOG2Ds7l4x9ja?=
 =?us-ascii?Q?GMiGcp6f+p6d+J4SiDEsmgmT28n941uyuO9fjPxuACM4YAZXiMuXaEqP1jo7?=
 =?us-ascii?Q?q4Yn+DJEZBqSRwfxRwFRcY0jPzbcXaj2v/DRSLA7QI4rsVdpdBekU0r0xo1F?=
 =?us-ascii?Q?VmguVrUemVnVTNFe5yml4J1Z4X8/7srUwyQ5eZTsVhIvnqAbf5K8zETev8xh?=
 =?us-ascii?Q?9DQDEUeLsWF6sriZg5qVIIDsRlrMRk95kw/Kt0rqHrkaSfsC8Y6lQI6fxHAs?=
 =?us-ascii?Q?GtE5K6hDF1Uq1GiprFhd5DSSfjv2Id0gOYQrjX43lv2latbc/+gCkWUKaTyJ?=
 =?us-ascii?Q?1xd4myz4pOY2/kk+v/LXlv5w7U44gVdfpOjMbC/G9hB1INkVu6aGupP/o56a?=
 =?us-ascii?Q?px5y1NGszXp6NBj8TOIoIxoV4m2bz2/fofBYC0vi81MuICWdlHMabIWvEXmf?=
 =?us-ascii?Q?57CyQFTNbGkHP37AXUkN6Jzk4enAmAHVrvfLXpHUUzlEo9PK9PjQUjJ51Gu4?=
 =?us-ascii?Q?UCOCEXzIMTUu6J7sPJSaSQ8yLWoTfne7u2hwFeylXtPFxjkUs0ANROhgpjCK?=
 =?us-ascii?Q?NO4H5nMOAvKajDhyQ3Jpy/8WQAtUJWL/2504vnV3By5Srl5ecClAcyiiCCuD?=
 =?us-ascii?Q?j/CtGUxotsG2XK3X7JPK25UFsTpLuZKCyvw3dwcd7bDez1SKHxSPzpTeX+xc?=
 =?us-ascii?Q?ce3UAitrnHVKB+ZyL9UxiAinu87w03Em5kV0INwEXc7x859OqzsSIMiiWybM?=
 =?us-ascii?Q?QEMmATXPfdMfXx3dkGWvWiP63qT2eNA0fwuA/W0axcOzHVnvhjCEZSsPbVs9?=
 =?us-ascii?Q?auJKifKcf0sEkFfymXZmY/IGsag4uop/HA4aPspz481rhVH1eSQ5MzIuJ32s?=
 =?us-ascii?Q?wPAnVMJDjJx+vbYL+hFQcHHLiZA6wcXQbq6xYNCwTnXkehy1HM7ho4D7drBn?=
 =?us-ascii?Q?swB8IPDoHQ3JfMWVDe8i8VsTGagfQMMuu4Y2hmEPfRmjdkEp65KtNeaY+xqR?=
 =?us-ascii?Q?QDiTDvaJ7Oc3iU1PY/wSpQ+NqyFZn+i9kShR1cbFZumieZWyI/Cl/SKfetsQ?=
 =?us-ascii?Q?duIQKbG6EGqYLAR7oErDlnNvHUJFVWhaQG34f0OLf+Fuh4krKilsvW6l6gjZ?=
 =?us-ascii?Q?SP0/QSYxu7QXzkzin/8Pc9W64oTRESF/oEFu1nDPKTRE3xcgJKl5eJPjON0v?=
 =?us-ascii?Q?VjEtTfzZQboWIwsPogM7IElpK6UmZQOMyv+K5dEoJtWhpdMO0adlKjg7T1zF?=
 =?us-ascii?Q?C+dbQ3FBCx7NpQWHPtkIrj1x7h7K2GN3wH7O1olJHL9DOJ65quwQnuo1F0n/?=
 =?us-ascii?Q?GxQRrcxAyR6WN0t90rzxbfyDQvEfX3iQDEHcdOM83y4J5rRzfVOjgTKEQfyH?=
 =?us-ascii?Q?U1w8HhO0l463Kxr/NDSlYIZr875C/bR8GCBxeXMxho5y0bHo95A+qCj4+fnB?=
 =?us-ascii?Q?8z4aGRPU1iy6i3SdGurQIav0Z+5bol59+3NHWgdR2nIT6UX9uBPR6WCuRlpq?=
 =?us-ascii?Q?RbdpxS7jtQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d83d33-41c4-46de-aa57-08de54e80f16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:14:39.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejt8EhadPtNWfweNbmQtaWaKM8ljKdKokmUObuBCd66hk8K8AuAxmQXgGPtii6L6yhBrgJM38coraE+pB6qWrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837

On Wed, Jan 14, 2026 at 09:39:04PM +0530, Vinod Koul wrote:
> On 24-12-25, 19:18, Xu Yang wrote:
> 
> What is the with the CamelCase on the patch title! We dont do that
> please

Not on purpose. It's a bit field name. Will fix the title.

Thanks,
Xu Yang

> 
> > This is to resolve the problem of wakeup system by USB3 device insertion
> > if HSIOMIX on, in that case, the USB3 device detects RX term on so the
> > USB3 device doesn't downgrade to high-speed, we can't expect CONN wakeup
> > (for USB3) happen because the 24MHz OSC is required ON to trigger it.
> > Because the device works at Super-speed so DP/DM wakeup can't happen
> > either. Then the entire systen can't be waken up by such device attach
> > event.
> > 
