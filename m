Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7816E3E9C29
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467555; cv=fail; b=upGl1ltzub12srPAKHDxO5ov5tvrJKhAu8k+oyKjLKt5h6k87QyjFLbx0s5nVpBi3c15adD2JIds1gKyMEdLgEVgrT5fsuGVCM+CsHcQ0U0ZtY6NLbDBuwDl0cTNiHoIu273SBGUtdF84PD5ODaY8l+QMt3NhWpar7ugr8thJ0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467555; c=relaxed/simple;
	bh=95McH/hpsH9ncsDnmi7xOS8pIzDVMXUrU0DVVbpGhVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c5J0R7Tsq4Cxt7YKjFhYxtmkoo9wJpkUPWzjB7eHggkrFjYHxfMPZLSjUvkrubEJMtV0DPLfc9iBDj46khvLHATMC2yOlasBq5lJepVqPsbAAVY9FAA39eG91Gwgbm+PDMZSULEMrH21zXfZLFdxiVXDDxT1mDNyaBM3d8fA5O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YCCQIKzq; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YCCQIKzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaLiEsdNN8DMYHs0abV+G5Rutqe1CI6XwKYAw+I890lZvCuIeYW9cmowatHVZmaqZPI7Iw6ZRvvQRJekWINzmRUgmv7UzFAxQnloHaMKh0lcsNqx1JClKnj/b7v5ruKClFmVwPyjDeYB7h8PxHw66Dt0kPuIXj5fSBgfLBBqHLI+6SSf1Wy9Iz360r5yjwY/LLCrT0Hz8XOiLTsWavzjSy/S7EMwrp1aIMFwCUoy+dbbebyNuPLFuHGfUphvHQsweaExg6zhbaUQwFC9J8qtcP36oa3mChO/s2nP07S+zHHtFrjg3llC5eMtjMy+XMkatogQgtpibi3EQORxbXktIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI1ND+Ff6XkLm2feP6BcfyrdLa8jaJmTEWoNYFrbIiM=;
 b=GLkyPoF9zUX3pn4rOolkSxeWM8QkcKvqL4R3sf5x2a3XeNYbNatW21+2MPzFv6zF4uytMSHQtd7pXfMqD7vI+Wp/1i63j1jy9dD5zrNB+rugTDSYFc6FDRBJi2o53XPo5SDcyvNJploEokL8wFdxlR/1oOHawHXMgTplow2CoGb1hWutthx/qHF8ewyU+EoKUF0Wz4/9w9MoUD1vTNA1Xy/hVha6QfypFgqzxGJnXppZzepqr90DG2fTTq/RpZEVLZGnuT4J0Qi10muyIrWOApaxgUipI93NL4yAR+NzP6c/lPy9oN4vo7LlGxBnF3XKaUBVgNkxBN5G/suHhXC7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tI1ND+Ff6XkLm2feP6BcfyrdLa8jaJmTEWoNYFrbIiM=;
 b=YCCQIKzqF6cdyN5uHiOQbRRtbvrqo6wR+2mDVtjmAw6zkYE8UF1HqoQdk70S6eL9yU1Cy1lF0N0m2WU8ZcFpG91m7/WGWi2fTVK3jEGjd3cZ0Wwl0JHkYfLyOPNj+AcYtHwQFsqcMQkBFhxy/GCEYVmgJ3d+dg86t3Kfe4whhmRKgmzmj/TtVE97Q8gV3mhlPH1ffeu81l51sN3OOSKB+c5h/ia73gaiHcxmy/abu7bsXKTznZXOViKoO6MGS/82YArgFApKzuR1y3BMtXxxq/2LY2CVn9FHXJLP6jNP4gKcAp9zZY2/yW1v2/lqw7bS42o9ZFX3Akj7e3wcv5F35g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by PAXPR04MB8560.eurprd04.prod.outlook.com (2603:10a6:102:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:52:27 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0159.012; Fri, 26 Jun 2026
 09:52:27 +0000
Date: Fri, 26 Jun 2026 17:53:58 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com,
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
Message-ID: <aj5MNiKSCiEDvDzL@raspi>
References: <20260624100326.413699-1-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624100326.413699-1-piyushpatle228@gmail.com>
X-ClientProxiedBy: MA5P287CA0172.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|PAXPR04MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: f444840b-e295-44b8-813d-08ded368a11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|19092799006|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ajt3TMJnqeu0pfvkf8Epr1EFU8ulgKZOO2L+5SQUwyyD44aqJDcx8VV/SL8gx2DvKHoG0AZ1nMdbl/N62WC2K6Bm72So/qRYB1QAPtOnrf8PPcsuk6NTptM2K1WkBfTLFb3+mL5QeNMjZY13pP5rd44fciERu7+h8+0iQ6TgzFzp9DlFSXp77zByTvM6l92SYwqObTW56gET6TkbtT2Jj4H6sInqxJtfu2re7mj9ZXZQPLZ5RjvoVU0AGK4PVmOvOtkNO8ljurPvrfxIgyfTlip1FZSJz3exnJqirDR+S0+1pZC/Zi3r+k9qmdRE2Tb2JsPyUJIyVQ/X6NNIOIWAp2NMRU8kwfKapeCuUKatB1QTWHeLqzo6zZav8XuwfD4yJO3PM/qZbX2c9uiUFXC8je6VXgBERBQI9vNZvK7MUhQ8wCe5dMPbx5RVgRE9U31KgsJm9zPz8XZWi+JCpqincLqQeHBzA4BuWIS1QMx1ha2ixtzmzVo7/sE1wn941hsgR8Vq7YFMG6eaz7gtUCiUNP+svXcgRD0dr8qXG+2jttIS4MElctptzTttm8VqeBUK6EHDn4+jQHMPOVwj4TDYtyk5uNd7DqzmZfvXXXi1XzVv6pBFOmysIMsWVz+InOD+7dNbmbhzJmjYyeidaxseixL8BRQehyf+amYhgyetaDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WRY9eWljr9/RFIGNMHbe/iU6d2OmFrlMy00tIBRgdXAI0MneX9PTB4G01d0a?=
 =?us-ascii?Q?zJrcEEeZozH+EyVGNsSFdrdBtLl/pxs2Mj3EX+XW1n8BR1A67K+RBhaHfaYZ?=
 =?us-ascii?Q?nD9UTM71iPeVEs1RkH0zocjlJQiIgsbv2Jj3R/GwCx1xitGTv/W/JleaaiPn?=
 =?us-ascii?Q?8yMyKxR5W8/7JsMny3AbnfrLE5DwVEu+5LV+Bm5Iu+dKrWNPojfkotd2ekB8?=
 =?us-ascii?Q?fsr14O2KCfUe322zmLY15eAU+h7gNuy7MAuzzav0a2vfiU/HPuo40dtcb3t+?=
 =?us-ascii?Q?P9Ffe6xKq0cQ4o/Z3BcCnWEJsLSdO+4vAPh/XBf3wUHWUVFq0iefQnlPfiXe?=
 =?us-ascii?Q?A+nF9Pg7MSHQnEPgfIr9f+JS/uJbTBDJY+byHkFDP4QOzI0uqkDdDRRdNDGU?=
 =?us-ascii?Q?tzpGckOspczPyfs93UkZpHXk3hiY5cxjSyni/xBP85Ulx7yXElo8VEYR5cDc?=
 =?us-ascii?Q?d8d/D+D8QCeZJ747zJkrSSLmKlEpWNZal5FejlUTPTXCJxE0VHdimwJI5E6s?=
 =?us-ascii?Q?E0gKvVOYncekFjLReTS18pxQqQjTIgBNgYVZghx16XrXbOQbBLR8fe6XtLLu?=
 =?us-ascii?Q?ui+thkdl+ycz5Nhii/iixQPiGO+WGQfSu4ZnHIEua0QpD8Sc8zvpkykhAhHL?=
 =?us-ascii?Q?eAB06rEGCh3bn2Uof2Wb/5MP+imPiy0umShYHJPbyvha7GlmIRKBJSBwLWMV?=
 =?us-ascii?Q?Y5SxUdc1tGCn8b1kKf6Uw6q7BG1EtgfiO+I+CatvwXVFS+IJJtOClGuNqrBk?=
 =?us-ascii?Q?v5taw1viVwIPXUkJTnAzEsAMUGTE0kdqmb/fh0XJDAE/bSfUKz79yTZikS7X?=
 =?us-ascii?Q?mgwezvVh9QvaaTffE/Y7ScUiExuOGNDaByKoxRj/iRjbf4ukGAi4iP3WYTt5?=
 =?us-ascii?Q?gq8r7C57/asuJ4JRUGL5dcpAjMZbSBXIcOV1djBbdG7e0rLma5SQu16znzEI?=
 =?us-ascii?Q?a48EHUK4bZ8y5k5gyx1o4YcdQCrlnTNw6cxKNy8hojjgs58PnPVf6oRinnzD?=
 =?us-ascii?Q?tTE8J+LYvgVTSp3AtjAaliDr9e+gsJCTLEPVUd1p89QD/KsGTOElcOp15aD9?=
 =?us-ascii?Q?JehT5vIcNoIkFS9kTDUAemJAWS5E2AhiK3jpe0ZW2xskFQrQG6vS4wSBBlbi?=
 =?us-ascii?Q?eBuJ9ILA1AsQNOGlLMgM5cXBP9daKTfZtui6czeXiY3Us88eW/BH2kxywcCf?=
 =?us-ascii?Q?SpTUnGmz8AeUWb57v3fd687ESwu+6OyEvZ+mt9kdZcTAixsr3ca/OanpXgFY?=
 =?us-ascii?Q?dHy/B0JNYMczTAjNFfhy+GK9X526X4IQxPcw9yhGdTHi+/z+exMa2bwM7MQG?=
 =?us-ascii?Q?r1Iv5Hcf/gyFgFB5+9io4WWkvx07MULaLuNjgp6uC4GwBu3WGRK3JgurB5ly?=
 =?us-ascii?Q?CHReJxKDC8zRAFl9cB6svDd9B/hGk/Wn55QbQIffuJhu6hEY9ZHOoIGebGTI?=
 =?us-ascii?Q?0DPbTAOrkxyn/HRx6id2dtz/gHa1OQTgj4NNxLhA9lQtI/jp6SHFbMA6WWrg?=
 =?us-ascii?Q?zLs2GBsw93zYnfqETVDK+R4VngEkIHjCtcFBQRO5VhqHb2ygwlOwOiSudJJM?=
 =?us-ascii?Q?fFu1r8B5vYL8HLQP2L4zNiusDHg/DN7i1Va/G9FvapuAfX6ZEeLs7nHrK/gR?=
 =?us-ascii?Q?BzzuKTkfYyoyDSqvQ4BJLGrA0bay+905Mjb0xD92YEAJ8btnsSHFmJ0bke2Y?=
 =?us-ascii?Q?Ip6vyXdmFOmyTlPprTTW/4xrWfWFmkYllsatYrbg7Pd2iD/3/DH60SXsxBgm?=
 =?us-ascii?Q?GCajyvQuww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f444840b-e295-44b8-813d-08ded368a11a
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:52:26.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i02quHJ1u62e+qndgYjFlt9rXoclGbrI0Ykb7HaoQyzd06R2/nicCelRIOpuIkrjurCca2K/onP4UZtKidA/Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560

On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:

[...]

> The current dc/ implementation is a multi-device component driver with one
> platform_driver per block bound via the component framework. The downstream
> i.MX95 driver is a single monolithic platform_driver mapping all blocks from
> one register base. Unifying appears to require reconciling two bind models,
> rather than only adding match_data.

I think that upstream i.MX95 display controller driver would also be based
on the component helper.  That's something for sure.

[...]

> There is also anticipated divergence which is not yet upstream (i.MX8QXP
> prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
> engine), although mainline dc/ is KMS-only today.

Just want to point out that I sent out v5 patch set[2] to add i.MX8QXP
prefetch engine(DPRC + PRG) support for KMS.  That changes the driver's
mode setting code a lot.

[2] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com/

[...]

> One question for Liu Ying is whether the separate-driver plus shared
> helper-library approach is still the preferred direction, and where the
> helper boundary would be drawn (which blocks/ops are shared versus
> implemented per driver).

Yes, separate DRM drivers + a helper library approach is still the direction
I want.  I think that the drivers and library would sit in the same
directory drivers/gpu/drm/imx/dc/.

The purpose to add a library is to share code to reduce overall code lines.
I'd assume that shared blocks or common part of slightly different blocks
should be covered by the library.

[...]

> how the component and monolithic driver models
> would be reconciled given the differences described above.

Like I said above, I don't think upstream driver would be monolithic.

-- 
Regards,
Liu Ying
