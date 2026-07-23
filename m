Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA8363C79
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821109; cv=fail; b=eR1abAecW75K8fTAYyY5pjhy+GI3dbkHGaxHlstelD78YupxfYiBZ74eAJ1IGvhAYEWCNsGtOCSgE9N8tU6ojfXkfEumNInEjBGSsghWGSv+aBRqt2/4ycYGbNtz2qBhDoAaSYX5KPSxK0ga+66PXOhdjMHaMJTr/VPDKdnPECs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821109; c=relaxed/simple;
	bh=moVIp9zNd0BH1l701SZmd/vwvZiJO9kPXxHwsJ0MoYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MXw0nRd0oFPXTI+VzyuSvQlFezTHg826V06JlAAweo7txJ1SHYXe18dyiplF9X+Dipo6eZL4P34nJIXyINbhhU7ls3KkBBtqr7hWe9eeyUg3U5cC+5DhG8oxipYn0jrvPWD3Kl76csAPYH1x6za3EEZCbkGUz1+oI6YdO8rLAmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fkq2H0II; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fkq2H0II"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=My+SMz54d8IdbUgW290Tn3gpqC0aMJFshjbdkyhU/9g05pLcWK3NLWYoCfzhL2yZeJbu4wGavSETrxyFeZp9NIYxMdn+19FDukcg/0YCf8rBXLv5hoZ0Eou5SSkwUjyg0One8VdaDrKeL01+lxQVNWvrflGK6fl5Soi/+zXuCH8Ueqg7QlIIajKNyL9TzHRM+S6ZG1D64VWcN7Kp0tiBfqnqyvNHj3avGIfLU8afn92CiqGjMB8G6ZXGMVTcBj7QWaVc6XttRiQtbRUlO2v1xkN0PIcZockYveHdZ3Ob560eo7tdIYo23faPRz6qVg8QFPkl/ubwy8jyR4/6DTbEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLByRISiCV8ywc0RJJs/lT+jmy3YhgX1JvMRV4VfOfM=;
 b=KoxlI9bNrBL3CmPz3xQY4J1A6Z8zVNWQAxJTRH8bEGfDNyNUWh0TY+0AW7CS4zzFCvafUsAbCtecRHqDAK7BTaVAy1xEclgz6NkD7vp6G42DuGu1ELK0cQzZgqFc1vv4fL3LpgssWa46JXzNENO7sA6NaJy+IzSNleukg1we9nVc2J5nsqE18yq3Kh4l+NLff3YYh/72w3iBvTI3kp3NhgkWEBldmZ3SwSyvz2LCYqZIAYKwbpr+XA4WN0cqwHRP3aVTIaclXwSJHkZMC5Bi1OShXjKnurwSAvVuuYEc6JCxCcPGxKc9Huh6sW4E0utkVdI/pTgCglVMtefibHgEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLByRISiCV8ywc0RJJs/lT+jmy3YhgX1JvMRV4VfOfM=;
 b=Fkq2H0IICroOaQPvq1Mt6gKTdvOK9vAyhnJ4AA5dtS+i4/eprjPpRcoMYjGotZebf11v0bfWqzo/jwI+3PQzPwuC7o3ElR+3hoVpV+A784HpJRHQab4lbbeM78rRoQJeqj14w8/7hBE/XVDh/SDD/mCs8ua7/SEnxbVe+4jKrQU6sV9PGQBTHcf4VyiExsfU1pKjFuD1ul+7S2FyWWQAIHNG5GNeD66Ck1trY7PijX02d6Rk3M/39VuU0teM0ieZfulkRnMPbsQ7TI+QaDbqZprIfEEhJxWp3cJ8ZQlyJ+5lqvRC/p2SVn6EftHba2mYdFMLU5Ff/IgWmispIPgqIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 15:38:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 15:38:24 +0000
Date: Thu, 23 Jul 2026 10:38:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: freescale: Add remoteproc support for
 i.MX EVKs
Message-ID: <amI1YzCNtoXScYwg@SMW015318>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
X-ClientProxiedBy: PH7P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: d00aa0ab-974b-4876-f474-08dee8d06e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|7416014|366016|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gtDvXbf6YX7hOjrSFKwBbXOK0IToTXZydpKGM7GxGAdhHCDTquGcQsidXRWfgSGXZxlPuGnwWDt5NHqXI7Rerpnzy2o5t3AmFjM4ojLh+X55rq2itA4iEDTgv8LW8LHZ7m0Mli8HJ3u3Au3g8wxLexy80br6SGHETRlyd/3lZ5BL/qWHvYfwHa+T0VuGhbBTjy7ib1ZW8UvtlfIJ0bbu70ozd2cXXykigmcid9ntGakyfjAj1xgAObqvo2RR2HgUHKTYw9XezvDhCIk8kI03pp/Lh4GTytCJtfOvUjeDOIqxN8tFfXqu4I1N5QfpesFYA63jYbzW2LaFvtb7KspfKjAZ8MJRKHFgR1PFQjmFSFVg9X6NFy45lHsLXTgxxBkAFmHjEVGQQ30KiWpMXx7jqZt5MfLmaFBtN9A9qet4yPZQUKQjO5/kDMxKbMLGPNbXj/GKdmTAdSF9OIjttT4K8mP9MOXowXME58/81l4dFWEJEKec5Q5PhNdxJxoM2gtWksL69AiQPxRU+APYYdVwfIRTaJyT5CHi52JPx4P/RSPcWIe/kykKM83ac2LasIaROxyLB5winH965HZoEw0kR1EC68xjgTjCHdrUBb0cFHmH86mDQgc1CcFsRUsqW2KN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(7416014)(366016)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ECpMhxVbymVwUaMt6dzEGlS8KYpd+NtquN4xbku+HVaAllmG0GWamm6inUb2?=
 =?us-ascii?Q?rRtgOBjgyacfJHnlxco5HNAANy/izLG5jHeG3WQ5D8aKxtTQluXR+8ZcdI7V?=
 =?us-ascii?Q?XdE9LUmBc8KBf1AWKt/pA+NzJzvy1G3eSKIj7Ioqc1J2wrN/S1IOn32D1kUi?=
 =?us-ascii?Q?hK197bbVRFfe0q4NoTYs2g87M/qlIT5Ku72kMH6leMI3lYu+Sn5KwD4pyEXq?=
 =?us-ascii?Q?Qr0qNDS8aHa0l9oR/Z/oOU/2AMFcTQe2wOZwNHhbrGYMaGEBRMRDkL7f4dMk?=
 =?us-ascii?Q?/2HddeWNs6TdiDQR/FeEEnprqiSDFXSqzYK1YPV/yS1WR4xhAtuiUWtH0Ho1?=
 =?us-ascii?Q?4e8dT1ADncNB32XApddVOaSK9q54qe661WWmnaZhf1OuoVzFQXIcWMrXwZNp?=
 =?us-ascii?Q?NMzqO35lfaXdu66NTbDDupTez6QWwmbzila50baqu/jf0dREplBfvJDyc2rd?=
 =?us-ascii?Q?mdURob5/adOhHXPxWKgclAnjfSZtJB81VfL7+truvSfvvSSGJwC3804UFWEI?=
 =?us-ascii?Q?ydRaBiNYTUZfgMEEIQ4xiUlYTiZWaXMVnmWzAEicNzeVQqXmWKW0vg0Pcism?=
 =?us-ascii?Q?O/no9MF+NO0XkOKMPC+NjVaD2gzu2BY30amM/ybpA6/hb3AF9trTjPtbAqtI?=
 =?us-ascii?Q?ntmDKCGD8GzHky65bVCf1mHoHEDGi81zFFGfPnz1TiUW3Jdg0lReAlF51tNa?=
 =?us-ascii?Q?qzcvhZ9gCm4/OA2o2fehVjtWMrOgiFO4obaubgypPzvqCScrAyo4nBnpZriv?=
 =?us-ascii?Q?O1opfAR+NmFqTdxPBF3D3EtZaLs1IR3zEO2vgWeipH9PvdPRmYlGmfU9Fxsb?=
 =?us-ascii?Q?6gyLnUP45YX3MMMU8RNAxou6JJPV7p3XjFmhEhuW4KTnAaE7yLyKq5GSdQhr?=
 =?us-ascii?Q?69biyYVBtxyOuprgZe4qB8uhsCdSjwJesGZokWvUKDq0g90MAlwJZypGpJst?=
 =?us-ascii?Q?2ekIg6nbIan4A1XhdMsva9OSmSBqm6pJbAHJtxfx6ad7Ry7WBve/RXVFd0z8?=
 =?us-ascii?Q?Kb997HXyxDX4SdiEznzi7qBhWqerM+lXZ7Af05moI4BUyCpPLskJWISaDOzR?=
 =?us-ascii?Q?zWOgU8sTcMpbpNQ4fOGgvtSLLaQjgadHXVDwHt5psYE+noMjZF63Np+oSGr8?=
 =?us-ascii?Q?wVeaoroVDHtKtK/pgLzFKL4Qjeu+NO0L+4xarvmu64zcFy1V4I8/NSQ9jo2a?=
 =?us-ascii?Q?dV36nas9GHX+ihc2o9f+9tlAXyC/qrjVBSBguqNPSebxovPvQwO0FnBFDYZf?=
 =?us-ascii?Q?91EJ46m/CtEl0w1PVYx/RU7skAWc1Rjx31ikCdbFm6JxAWbHAzL7PRfFt2QB?=
 =?us-ascii?Q?gXjKzFkKvvfafbTKrA7jvWa2RHZqssVYO3agPeXEP06H/MlsYvNcNFYklcHf?=
 =?us-ascii?Q?PdaD0HQTePGKDmmx0eAzjNbG+0AnI/aqHF0f/BAv4hzKXHfYg1s6mZQgQ2sy?=
 =?us-ascii?Q?4++oRnprVuJ/09XIwX0ryEy+3QcY1cbq8L8+Hc36UaQeC49QN31spB1Hj4cU?=
 =?us-ascii?Q?Gj19fqyKmlOGpx9b4vGQ9xYJHvKY8rzlIBF8VcmNSppRgqGoQYb+kV0Nimon?=
 =?us-ascii?Q?EVSyGu/JGF2r8ax+ZwYt0wIZRxGQ0LoskANnwMRGht4a3tonymN96zLDmm+2?=
 =?us-ascii?Q?JT9OziqTj/vkyoN15YOxW/YC0mSYWuckESWTfm0BskneSdaRZ16dDCAzHwys?=
 =?us-ascii?Q?LU2iD4wPGotVpb96+Kc4HsQfpYX95QfBTN6YaFX2uKa7TrfQsza6s46Eykf/?=
 =?us-ascii?Q?of52tYu14G0xbDuOsjXYmuClddMJd1nEJ6Obe8wddEr/Q94H3pLi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00aa0ab-974b-4876-f474-08dee8d06e71
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:38:24.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QylpFxEt99G2X18DPZ5RYh1KB0UVhD4Lpyc3D1yDcHToflAHXPgAyeuQ61lRhCm4nRU7XwfW8+RJ/bAEfqNJTu0GIccTQnW71WNR8PvMZ0oFIt2YAan65JTxZRXLHCLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743

On Thu, Jul 23, 2026 at 09:00:02PM +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc node and reserved memory regions for the
> i.MX95, i.MX952 and i.MX943 EVK boards.
>
> - Patch 1 adds CM7 support for imx95-19x19-evk
> - Patch 2 adds CM7 support for imx952-evk
> - Patch 3 adds CM7-0, CM7-1 and CM33S support for imx943-evk
> - Patch 4, update resource table address for i.MX8ULP-EVK
>
> Each patch defines the remoteproc device node with mailbox channels
> and the associated reserved memory regions (firmware memory, virtio
> vring buffers, resource tables and shared DMA pools).
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Change to vdev0buffer in patch 1 for i.MX95

Others also need change

Frank

> - Link to v1: https://patch.msgid.link/20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com
>
> ---
> Biwen Li (1):
>       arm64: dts: imx8ulp-evk: Update rpmsg resource table address
>
> Peng Fan (3):
>       arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
>       arm64: dts: imx952-evk: Add CM7 node and related memory nodes
>       arm64: dts: imx943-evk: Add CM7 and CM33S nodes
>
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     |   4 +-
>  arch/arm64/boot/dts/freescale/imx943-evk.dts      | 135 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  46 ++++++++
>  arch/arm64/boot/dts/freescale/imx952-evk.dts      |  50 ++++++++
>  4 files changed, 233 insertions(+), 2 deletions(-)
> ---
> base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
> change-id: 20260715-imx-rproc-dts-6c78f82652f9
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>
