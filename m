Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4AB469839
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344847; cv=fail; b=nL75h25TnVrDQ4HYXZDk33hf5yxrUJ6+vUv1/3uvISJcC3ApocuRVIspnUOk4TObDDNkhCHr7GbgR77zZ3h3gwd3UP1Wsuhrzcs7xg7WkBeRUh7XvXZtBuWn9qNgQ7cebcvXzVgMquq67v7cgh+ja8Phvs9pW1xyXX0dRAnYH/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344847; c=relaxed/simple;
	bh=4/2UysGWbUTri3iClWb+kILx9Sx//gm9m+gR7nTL8uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pju/uggGv01Dvu+OwYQss9MwIPLwE1/SvKtSjGckbSYH0bIh8erJPVc4NcuVVPsl3ZsJkpnPFJwMX06b8AyzX7iCM7PcEDbFFz5qpsHYsg2SocyzsYfjJQIve41P2cBe4m1s62oNDwx4lDPCJ0swOe6BuQYYShgfcmhoysla30E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F8bHQzy3; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F8bHQzy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mD0QC0AwgFqKIAjVq3/3Q+pJKmnNiivFzpREZYK01FRI6jq9bWMlJqmkKUGi6T5p3wI/G9WEZSRbo86xx1U19dvigWwtFs4c2cqX0es9glwS9RThbJnkwNIfqAdUx3SLVUvhifwIfNRICzZ6ww14zfe23AJamki/t38o5C8Xkuz5ltmg2QaKgD2hCk6J1jX2FtkV1s+nTMHm4IXd1TfXE6l/KOxJpLCNfAqPqYeLxNeVIvcS5yelEOWcYhETmisRGSF/eGvlQIIWdt5XNNHLFM+RQ8zpPIi3Uf4v9D/7+c8/J5VfLO+TbZdHeWMpezUwh+Wo0PE/WHhL6uo1X2bdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEivk+NJy/gW4XbV7Y8X5kad6bVp0qYzfRTnk7YQF/s=;
 b=eZTpgWLLnLeg7feTkGYnS7CwdwTfLjIUwLz8zMOD3DGCwxF5z4FI1kyMQCmnbyCUq5NIJz4EtCWItPf/in4Zgi+3o3TOd/ObenGPzsRezdvhks7z1DPwrfKadwTTVFkmDGqyxzsHWyjtC9T8tx79EuX9MKg/x69ZChe3Zrpm/MVgJWXfFb5Gxv8048gRzrHX6xoDxfvnMOxOu4WAXPUcpg572QXQZutxEjbkQy4jRiAjghf94BFZ+7AR2uSXWXkRQMUAjyr2Rk8YRfWPSMcw881/xmJfQSd56DqmAxzvYOmduwctN9a16hgDRe7KlyxWhzVildndos5eQv/3e9b5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEivk+NJy/gW4XbV7Y8X5kad6bVp0qYzfRTnk7YQF/s=;
 b=F8bHQzy3Xz8uWNf+DjIk2D+buSoUgk1EDsR4fe3laAsm3WU3Gb/FgTHoiIZhecyCDyl7Psg4NCR5Relj1Plk4CtNbWSADdv8KvRFMQzE5iJIKw1UvcYemkXXBi6hpkp7KvtXmmoBZoyKjBUqDlEsVHrbrZWv8RPVNjJbXlbUGx0jKKMLtk0XNJ4UeljDfTQSyzHFP4ddhRxAcKNH2ohov+O+EaMCRGDABPKD5I7K9x54nn83yqhaavX+UQnH0Ck3x5d3ubNTQJQlCOk1IH3WBZgXtWmlsM/tcP3IMnpGdC2JKks12cvQoegNtDyGy0VNE331N3X5iPT6jksJxVt2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11711.eurprd04.prod.outlook.com (2603:10a6:150:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 17:07:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 17:07:21 +0000
Date: Wed, 29 Jul 2026 12:07:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Valla <francesco@valla.it>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node
 names for remoteproc
Message-ID: <amozP57T9CUYWAmk@SMW015318>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11711:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ac1812-70da-42c5-1189-08deed93da2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bjtLytBaqxGgVpfPww10Q4RRPFrryHEd+dFTD5rcGHqEpINnAYIHd12Tub2oZa5iAKVCuHjebKZJlK1bmHKloGWmIY22fmSVT+k6V44ttg3a/dAoOa++WC4f5V7H3fsopS+qhl3v8Ju499Uru/dPSuQLOAguMfoX7xcX/hmETiPnMWJioltluktHdhpTNpyjWqFsdjOsn/hyMLFxZhQ8uhlbr29X/RL8aV6EYuKMRalVuxsghVuAxoLg6y1lpnI/GI7yE9hr/SOd3OKXM5JySyFazXXQwRvO2z0gm+WgA+w75clb3evJmt7HNFezfYCuHDOx17QhwYvA+stwEvdETnQkAYlUCARkKrfSPONLSDEg0sMe2CtclUwgPSmEVMDijq3+1keAz98JezY/0lNM/thYapdI7h4SD1+rMPwEUcmgMMxc1Tlh2SrXTv+wE576QuaNfeOWfZKBsKTZTNGWHY3uLmvwP63jRka2Mxnc8SaiZDVZuec6VvABU3KkM8SBOVFQmLoS2THbHM253HIpiBmj128jH+k4lQLPQuSYVHPPvGFf7DJ4YcNAWTW+TqA5cI8aRMB3JJOi9S5pRcOAYyJaLdr0p3WFfIVFdLczu8fOj0uHEWMH1mL7zZE4oMDz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8KnEBPe12yBOsJFrFHAUV5XbM3/99Hu2Sue0uMUJPuBi8Cdos/7G+R0Hplt4?=
 =?us-ascii?Q?EjqEi9DVJjhmvyKxefo6ckytFsENaooBBmmV4JlUTZ2Bq95+s1nyOoPsXcjK?=
 =?us-ascii?Q?Ojr3H5bAgmXLFRO3RLcd8zc8hHBkEquR5GcxCgZf8mrAO/sho9U+PD4veD/z?=
 =?us-ascii?Q?W8lhkVhkJXYPleeHVR080f4NxgmYh+umkkxtxgt1xoicorDX5SlgrHyXbJRB?=
 =?us-ascii?Q?NNiXviPKPnI0I6cGARiURxZ/psK26K7HkpBI229p3W+jR/eN6RNPftdfZ1jD?=
 =?us-ascii?Q?Ut9u2WH6Ud3h4V8jVHiPZ7lHPei904ARGemgu9uH7/feMdiT6d4X5POApPrZ?=
 =?us-ascii?Q?yL21wthzJoHPJuPzxGjh/WODUH0QAaGcsWz0LOZ9jitzJ8weo9G6GDBpnOAC?=
 =?us-ascii?Q?bFTo0adFILTDJlm1TN9Jeeh5tjipTjMYuIxGsBOicKy5vXJKWDTvC14LlZho?=
 =?us-ascii?Q?YwcbNB4RIChYvEh3Ow9se9rIN1Wg3iGBH6or2tWoj5OZFE6zdKFUlqRl3sGQ?=
 =?us-ascii?Q?Z2snEpbVomEDnIqyYrsu+ERkLddyAn+wkaZ3a7Kb8ldSD5Y0saNJDpQGV+1u?=
 =?us-ascii?Q?i4FEfUhMaEk12q08zzQC/HR8vb70C6A/wcU5kBJnY2trjp6odQextnUVQKKF?=
 =?us-ascii?Q?DiSKUKzIL4ySxtVSUuAwOghLO+LinyBFRyrS/SkaxxHirJtSFGL0TUqc3fWB?=
 =?us-ascii?Q?j3eerPH/k6Iye1akFQTE/zPIc1KB54OYtTgUgE/GhMchks/fupt9E1s75LoC?=
 =?us-ascii?Q?87hsVIrP/Nhe7tw2eBL2yezvKlo4r6BlXnlay3QJOp0b7A/1eCaJEDukrPoK?=
 =?us-ascii?Q?YDRCdU/SYC1choEz5EBm6MbrdcJJtJVG+VTzjq9Xro3WJOVXWxgu9mXXVuUt?=
 =?us-ascii?Q?M2UsbLYw0q5/v6kgUlNmtI55p8ME/xUSoPLK2ElyO+TaURTnhpYixKt7r9ho?=
 =?us-ascii?Q?YyAPg62p8z7V2jVnWhYfny/eGhl+eodjdy6soAVatxKFxXf09NOI8IJVIYBY?=
 =?us-ascii?Q?5VWCFJRHsxPlYWECAiqR703CUSYCy4S9ZUNVltWGpU4DV9IgytI8T/9Z1uvK?=
 =?us-ascii?Q?tGt1DpmA7owX356rWAlMxS8rtLoiEtWcDL7MzXkFq7eUApFnVypprgU4bsug?=
 =?us-ascii?Q?Pzcoq/LlaKkSgt3ddr/qNqxaMtwyzXawrwN4TlIgm1nV/4qLr4sK6YNRNJaN?=
 =?us-ascii?Q?FqRB2wjq9UYi9o58HNL4GYfN3EEbZU9/29t6XiIiASxA9Ucp6GE5zwaGVH/5?=
 =?us-ascii?Q?imd1d7yrlz/0BUEdVaTiDth732EQ9EGo+uyzwdbNEmsTJh7xvM07ZWch1AYz?=
 =?us-ascii?Q?goPrzsYMOUp1+Xb2wgDCGPJ2wtyz5PStkQSPyCZEKb/6Z7bzIV4dv+DTJsXx?=
 =?us-ascii?Q?9qazHT+1kAIm7UlKilZ225+yhUHGiRjYZriuy/vSqotGIh1ynmi3Uz9joqn2?=
 =?us-ascii?Q?KuDBqhNKxpS47A09dUTAdKYqucOsYtAovME6EO6sJdY878lIbcI3/pf3CTQK?=
 =?us-ascii?Q?9FqBFC0QxdaJGW1RcAs1dprg/y2zDW8kdilx4EhW6p9o1H9D1t0X88uij0Wa?=
 =?us-ascii?Q?AQVhG/M9P/ie+OQPKP24mOn9EkFr6trWWnOlyK4Qyk9uYQAeEz6glBJ2DIle?=
 =?us-ascii?Q?jzEu0FzQtLAuzYzyOumd/sEddaowUvq+IyTDqQtpPl6ZikzdP//uWaPkJ5qW?=
 =?us-ascii?Q?D29aznwEoud8dJUT565QhEAqjSciHLFcPIsyfufmF3LR0/7FRob6AMGSocwO?=
 =?us-ascii?Q?ClbUAMCs1FKwtb/2zjdqfZm9hcOasH5kpZbwQR2ehdV1lm44MHpH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ac1812-70da-42c5-1189-08deed93da2e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 17:07:21.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uNIxzX72jZ7BMXirpY+ez1sKsZwHbzY6NplatSEQdeVbfMG7c0OCuAsm8Nk0bI4UokWIAid8R5wOsaB6iZ4eTYH/FY29LuKQ0ZrAb/5mukmcwW9eJK1ffsJVbQhjSPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11711

On Wed, Jul 29, 2026 at 09:07:56PM +0800, Peng Fan (OSS) wrote:
> The imx_rproc driver uses node names to identify reserved memory regions.
> It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
> resource table, and "vdev" prefix to filter vdev regions. Several i.MX
> board dts files used incorrect node names (e.g. "vdevbuffer",
> "memory-rsc-table", "memory@..."), causing the driver to fail these
> checks.
>
> This series renames the reserved memory nodes across all affected boards
> to use the expected names.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Also fix vring, rsc-table, and dsp buffer node names in imx8dxl-evk, imx8qm-mek, imx8qxp-mek
> - Add fixes for imx8dxl-sr-som, imx93-11x11-evk, imx95-15x15-frdm
> - Update commit messages to reflect expanded scope
> - Link to v1: https://patch.msgid.link/20260729-rproc-dts-v1-0-368bca0b309f@nxp.com

I hope Laurentiu Mihalcea's
https://lore.kernel.org/imx/20260605113621.1479-1-laurentiumihalcea111@gmail.com/

move forwards,  by use memory-region-names to fix these problem

Frank

>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Peng Fan (12):
>       arm64: dts: imx8dxl-evk: fix reserved memory node names for remoteproc
>       arm64: dts: imx8qm-mek: fix reserved memory node names for remoteproc
>       arm64: dts: imx8qm-mek: fix dsp reserved memory node names for remoteproc
>       arm64: dts: imx8qxp-mek: fix reserved memory node names for remoteproc
>       arm64: dts: imx8qxp-mek: fix dsp reserved memory node names for remoteproc
>       arm64: dts: imx8ulp-evk: fix reserved memory node names for remoteproc
>       arm64: dts: imx93-11x11-frdm: fix reserved memory node names for remoteproc
>       arm64: dts: imx93-14x14-evk: fix reserved memory node names for remoteproc
>       arm64: dts: imx93-9x9-qsb: fix reserved memory node names for remoteproc
>       arm64: dts: imx8dxl-sr-som: fix reserved memory node names for remoteproc
>       arm64: dts: imx93-11x11-evk: fix reserved memory node names for remoteproc
>       arm64: dts: imx95-15x15-frdm: fix reserved memory node names for remoteproc
>
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 14 +++++-----
>  arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 14 +++++-----
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 32 +++++++++++-----------
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 20 +++++++-------
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  4 +--
>  .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  4 +--
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  4 +--
>  arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |  4 +--
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  4 +--
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 12 ++++----
>  10 files changed, 56 insertions(+), 56 deletions(-)
> ---
> base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
> change-id: 20260728-rproc-dts-3f331df7ceaa
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>
