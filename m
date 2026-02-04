Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714FD27F163
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218939; cv=fail; b=l31gYiYW7VyuBBu07ZuRQGOkGPkUhObxdQ62DL6NerWirGIAW0VrhVaqsIcBVy6sAvXQjpauRMxX3j4SaBm63HAYzXneFVB7Q5p9xAIhgBeF2Okq+cpSo78EGGi5X9374BTtUblxld6mpGQOeZ/tbTfsKncyaoHenBhERUHdY+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218939; c=relaxed/simple;
	bh=BX3X8CjHiF+grVw7TDgUjtu7LdIRtHGkwYjjP0pr5cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iiraaQhOLN3f2+tQMUTSlP8rUPXKRXu8kIpshWw68wPzT88Ok8DOVMgakfxXpPVcnthxIF1srTDfieqiGrJQTvVLrnqJP1p+Icp13PPjY+FWnt4ZZ7qlDMYiNcBRr44jTuUFhYViYuHn63VWnqkA3C06MiVSTUubi5pO2ePIa+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kFK8Tq6q; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kFK8Tq6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdUoU1Z5D2O28ibHciRJlu5/KxFb2eOMXgkkcaLEMsfKoXnCddfbIcxooGj4unFQn/A4U5SZNNEPZ9V2DWYvO3lAI4pSt4a9Ce4uPOAtjHsqgM/2uNOJER7V7h+K9vcUSH9IluOHn6G/Km1r6hy+6oHVk6NjgyaV1tgH28xlzZNE5t/wOiZx4YT0G8VXA6Q5I9Zvhgx/jLtl0NWBA3BDuhJaOyeuqhIVGZVOGGLDxx3+bGWMwjdRQuBOCRQZnQ8/LNFOzGFf6HKgDkl0bUgDBwo5EPU+ovnpKuyu5FIRmMwhLK25ALdNx8uMcibmzJoCru+1K8mO+eLn4x2k4eJpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC3DJy60ko0pItxceoOaXtrrtrUUF4dghMZHa0JzOzE=;
 b=Dld6LvaxJpZSozFHo1J/b4O7Gw76Sg7IS1tf4ruwTYZYjKh0JvC6fUVJSacV5LUNc/HG1NpP7dFivspYcYYEfCBnyf2NXAueZm/bVHSdmbOuq7jR/gKcGZPyN5VZYRJM41JSF1oTWlygpqvHQI7+N/Ctcno33YfC/5E/tHLUDpYLFxV3U+Ju0lnjVQK2gi/Yjtp30o1DWvMc2jWkOkDWvUXQLe8Ex6D3QEIEM5unQ2hyirucJBRKWfPinCymacDDRUPnN34/v/F8GQC3zy4ys97a6jrmE2J0jrt6t4xZXBPQTdWFWD7DK+3YFqqKCtU/7AM4r6BXq3MMWIOVKexgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC3DJy60ko0pItxceoOaXtrrtrUUF4dghMZHa0JzOzE=;
 b=kFK8Tq6qeeJuAJ86vCHMEr/mZoSsLNbKmVVXROFb514dKKFitQ3ABBM0yskoj9qwFXaDPrgi5mCKaB95N8AlK296CgAv6DALahGXbsGiPGXnj9dcAipeJnd3+lSvDTjK0ALVBTi8vJSF8Av/Np7QFebQEUCWRhMRF/B+tq324W1Lql+zWlnz6idxd2amQbhBgq1b5aO3o4E5X/UPMYJ6zYkT+/kQkTBA8WAqjg+nIZXDYwOTowkdwpu45Msvk0atxyzJK2+Zwj+S7uZxSL2GqxH5c91hJ6cXOhnPMy/IGB+TrCojoAfApKZnFPF3IJl7LFFlksmr7fYJmWPpoeyPuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:28:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:28:56 +0000
Date: Wed, 4 Feb 2026 10:28:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V6 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts
 back to imx93-11x11-evk.dts
Message-ID: <aYNlrXKKg7ImRzsG@lizhi-Precision-Tower-5810>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
 <20260204083551.2867263-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204083551.2867263-4-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd489b2-54f2-4fab-c7fe-08de64021c17
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lS++cNFEDpukRbTvJ3GOHo8K7vA6yPD2wZEEpGij9NlrQJfXVCGWrEPJiYp4?=
 =?us-ascii?Q?/mTe76t9dd0gtjQY4D+Mtafgw+/WkvyVPxGFlAx3lvJMjlnNFh1IOZxpeV7X?=
 =?us-ascii?Q?tfjW4q2CzgjA5IjdLTyIUM0HHKvaW8FfRyo0IKGvk8hREmt9j4KDGGxDE8gn?=
 =?us-ascii?Q?3A08SQCVvJztjLWyRidrFvmI0HfR3EcJOEsC1rGmscpPETnBDCUOLMecNy0y?=
 =?us-ascii?Q?eEra3+lzaHm2NFAuxSvCj7jc4XN/9rjJCYL1erWDL2gF9dzPXQGyczJomwJ8?=
 =?us-ascii?Q?BesIku6SWBLlaMo7wXCDr7FHQw8bkKGP1w7ps/AFi6nf9aCQqC4CVrmbZtP9?=
 =?us-ascii?Q?NEJtmSdkG+d3bU36y84nf2CDd4aQedmzx+O13crR4/KOOq9NV3AreRM6nMy9?=
 =?us-ascii?Q?fkxHOgoMQvVRib7YhFea1q2G7Pii1fRLdxDE/hpMrpzLyLXIps1SWpvMBenv?=
 =?us-ascii?Q?2bhL4jOShQAhOjOGJiy1gE0qO9/ep2jBpUbdnWSU5PkAgpwjui34tqOK33tO?=
 =?us-ascii?Q?dKiiymOoH1meZqDRhn7C7dLvsB/XNyXZ2C/awXhN4G1nRLOyizaBmB+MA+zH?=
 =?us-ascii?Q?XePSRmjBxFA5D7DXQ7KwopbyeeHqiARMV+BXs9c7vqiM96Nm0J1Xo7B4nuzn?=
 =?us-ascii?Q?XhjggZP0VH6vSTq7EuFAHW48IusP3Gkc+n8TdWnZNMMnXWeMgfL5j3cGtyvC?=
 =?us-ascii?Q?Ip+FfqgOpGeiYdG52EUUHtV8f+PXsiAzkPYkBlCtOvVzFps44VRejpbJutos?=
 =?us-ascii?Q?6PbiKc+OMeslwAGx0vNSmCzaMOSGM5/1XOmRp/lQLFjrfVEcMP5kJMxqK+Uw?=
 =?us-ascii?Q?bgZEaUMpknokJ6YiLhKmZJPZQxzOQ9XwLYlUNn7aSxCuahacte7f8eqgM5aL?=
 =?us-ascii?Q?ta5rlPpJMd20A0eR65R6DCdA8tyoRMzLISQqisROi/6xwDQeg+0ZzmlKZVQS?=
 =?us-ascii?Q?xbHJjWLMQv53wffqwxdGMOnpsLVO4llT3dewdUtc/bxl96e7aZmWmx0bcEsr?=
 =?us-ascii?Q?P7ezgLxTOTvnqaW/JmvqNP50z/72OMZs+hONx+ytq8En6lqYaI4YLWDDHM1v?=
 =?us-ascii?Q?VVHqXwQS70Qkym3/JIeFxfvW0b+C7K/TWibqPHA4AgC+J3aB8X/gtFDH/mm7?=
 =?us-ascii?Q?h/l1UpJtU6K41XxSMWXZC9ZtD6qYrgYsKE1Y4e/QB6cwiD1xt88LfULiBBHa?=
 =?us-ascii?Q?M2qIxLDmFWFGZIC5+KvN7ESNONuivBd6JrWsPFUCJvjQGBnjkTuMI8DYweR2?=
 =?us-ascii?Q?Za4h6QVhOZSpRVEuA8ptDWUxFOZLR6ln/7RTRI6If3NkoVl+bzH056Esj+tp?=
 =?us-ascii?Q?S6sszElpLSN32sGRvdZpvD452djXK7frc1WbEJLi5N2OY7OCD2g0nQE5snGU?=
 =?us-ascii?Q?ExS0LOcNy6cjeuhfrYTMLQVx3pefEzm70Wf1eUm7+RPvIDlXodHU1alp7si5?=
 =?us-ascii?Q?193mcNIpSC/b+AXv+SkehguFT9JU9L6uaLzaEfCMf4wpdgdbf1711bp1Tjpg?=
 =?us-ascii?Q?JxGxez2o+enrKvKAisP0UmCg2zGnASMf22nS6XsAq0CshAxNZXPpFGnunjcT?=
 =?us-ascii?Q?OXGSRMoaROZ9/98W4YsjXqw8V6pkfTBr2Nx4u8IEgR3yzbgwY5TGY0RXLwgc?=
 =?us-ascii?Q?S17APfR+0k+P3PeQv3W5Fn0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VLpolX1HjGUkIx3DFxaunLMdSk7WB+89fE7MRXfSBhjjApzzm413UmtFuu73?=
 =?us-ascii?Q?/BhhIt1en5xoz6t7qubQV1OnbbOdxUGYJvUwvO5LDMAoAlkwQh7IMrA2RBYf?=
 =?us-ascii?Q?mn2mYICUl5XbNgi6xxuzOwbs79VHet7eGUXXp/zsTJBx0meOmniKtJPSZIao?=
 =?us-ascii?Q?4oAyCY2dHj5GXzrabCdHdvej9PNrxn8F7QSdVEl7pgnw2yy6Mg6abpxxDsYd?=
 =?us-ascii?Q?VvrY6t2XgkC+kC9MrWNCqJl0PhSzshSwCW4qmwhkmncb120S8uM4xri/Jg1l?=
 =?us-ascii?Q?ZAIwkCLPBjpfKgfrYP902iaSMWPd3RqU4JTcSvIe+azJNLOsf2YmJ8hERGHx?=
 =?us-ascii?Q?qzj8G/QOrYEtJbOS6LDVztVBSZjfe/tdUN2U1+GXLrnJtpo0E49rXwUcTnOw?=
 =?us-ascii?Q?GRdokbOPh0t0ffzl8s14ziku6+kc6iFMw0uMU/xPeaET5s+SUjcmyB1Y3Kq9?=
 =?us-ascii?Q?XQOgsqwSOsc9tnSuu4txkIGE5JLGkmgR95c9gg3ZUYWku9KfsI7NHgo589gc?=
 =?us-ascii?Q?VThO1Fu43WLAp2MdseZgH1aWLWgaOHCmlivB0x7aRFWjvStjOSs3k+Av826M?=
 =?us-ascii?Q?snqcDDHQKucForND2S582TaAuSbEI4D8hne5S0dzKuSuyR5FU8RxlFhsgwoh?=
 =?us-ascii?Q?Qphes8+y9Xv/nHOXaQ8HiB98nDG/yf86WGtykSSZ609akA2pcbMd9DL3fO2e?=
 =?us-ascii?Q?CFwL8BKDbfyXIztV+UVMCcZwwdwduSdz+asR2YFXAy6nGSbGPNCgFTIMzPTc?=
 =?us-ascii?Q?/q21IN/k7/LzVv0rkMg0XNSLjULojZGtJdE/Ij4KVw4NHhhE3DPUnuSKepQD?=
 =?us-ascii?Q?zQv2MqfbKpB8dlfSK+GY3MR9ON1TrCiS1hKe1A906tXIjnNB04Q74UohErWd?=
 =?us-ascii?Q?eKtFwO6ru80EUrpIqA8gm1GSrmCqvEFnSYyMtCNnQT5+pyHCd+tWkhlZLMh4?=
 =?us-ascii?Q?xGn5J0VcMDksYf+3nUc2GW4xfM0oN8OSjH4TKCsx6fmxT6v3/tDPnnvym5IQ?=
 =?us-ascii?Q?a8Bp+fu7WjBtF85s9b29yhO+hxMBU8UDuBeRYsW+IiCX9nTDs067HO5EdrZo?=
 =?us-ascii?Q?HWVpOjdba9ociqfHUvR4r4VL5wIp8UtmyFQmbSQ07wpMgrB6m3C95oTqXltP?=
 =?us-ascii?Q?fIe/GlGZjJ4GI6AcFxSN1r4tuLormArW/rRg7CIQMqtgxJShg8fbwMehFOQ4?=
 =?us-ascii?Q?FD7ctJt67XRJZldIKgxDuXEcavu8O/14hO1q8oyaewG1oPphHN9pL6/t9gpU?=
 =?us-ascii?Q?EpGzgMfhBTiTNwmHG9/FW5tQ1sA3Edt3h1Ycmbq7lgzjyqx/YPpTg1QbvkFB?=
 =?us-ascii?Q?ebLBq8KTE0s0nQemPS3cTDcmJdq5LcTb6K9xBIHTz5hcPfoGLnvX/o36AJZl?=
 =?us-ascii?Q?Xo4ab1jHNPbBLH2wzcNbkT70NjtmnZSQdE/1WaYbEOyEmiyAUkrMq6kO2yg7?=
 =?us-ascii?Q?CJZUjnPuZnJ/C67s9P5fkpnCd1QkgOo/fzKxgwvv3M0rKr0IX8sOZh+SRAuC?=
 =?us-ascii?Q?rsglsp1GMd0digSHCdg74TEUYnqsQZXLK0rsybvNsk3AayZM05vUKNPtN8vA?=
 =?us-ascii?Q?lI7+PaVmxZToM1X+tmPU1RNj4eHp2KXnRiLB0njQzNuCkQhgufcT4F5OPy5e?=
 =?us-ascii?Q?SUuaoMf0LvOgmK1+OkdAT+ueHHkVqJWgbtPIng6YKlM+5uTS0OnkzNAG6nBu?=
 =?us-ascii?Q?K9jNBnoUux31XjMI1PiY7SU5AHg0mqjexLFJkNpyEofr9sTKVpZ6GLusaOtb?=
 =?us-ascii?Q?vqaukLr3Ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd489b2-54f2-4fab-c7fe-08de64021c17
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:28:56.0463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8SRzNWvFrgXcPOQu1XRGmLT9/q2uVifNJH+NhB9IfhuU7uqWiAUq5OwGbBOTR9Jt4RFQto+LilldWEIuHuqRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On Wed, Feb 04, 2026 at 04:35:49PM +0800, Sherry Sun wrote:
> The previous patch renamed imx93-11x11-evk.dts to
> imx93-11x11-evk-common.dtsi to prepare for adding the i.MX93 Wireless
> EVK, which shares most of its design with the 11x11 EVK.
>
> Move the board specific differences out of imx93-11x11-evk-common.dtsi
> and back into imx93-11x11-evk.dts, ensuring that the common dtsi only
> contains the truly shared parts between the two EVK boards.
>
> No functional changes intended.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../dts/freescale/imx93-11x11-evk-common.dtsi | 198 -----------------
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 206 ++++++++++++++++++
>  2 files changed, 206 insertions(+), 198 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> index 6279b8eb4ea7..301e9f05122e 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> @@ -107,15 +107,6 @@ reg_audio_pwr: regulator-audio-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_m2_pwr: regulator-m2-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "M.2-power";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -128,28 +119,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>
> -	reg_usdhc3_vmmc: regulator-usdhc3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "WLAN_EN";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_m2_pwr>;
> -		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> -		/*
> -		 * IW612 wifi chip needs more delay than other wifi chips to complete
> -		 * the host interface initialization after power up, otherwise the
> -		 * internal state of IW612 may be unstable, resulting in the failure of
> -		 * the SDIO3.0 switch voltage.
> -		 */
> -		startup-delay-us = <20000>;
> -		enable-active-high;
> -	};
> -
> -	usdhc3_pwrseq: usdhc3_pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> -	};
> -
>  	backlight_lvds: backlight-lvds {
>  		compatible = "pwm-backlight";
>  		pwms = <&adp5585 0 100000 0>;
> @@ -161,44 +130,6 @@ backlight_lvds: backlight-lvds {
>  		status = "disabled";
>  	};
>
> -	bt_sco_codec: bt-sco-codec {
> -		compatible = "linux,bt-sco";
> -		#sound-dai-cells = <1>;
> -	};
> -
> -	sound-bt-sco {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "bt-sco-audio";
> -		simple-audio-card,format = "dsp_a";
> -		simple-audio-card,bitclock-inversion;
> -		simple-audio-card,frame-master = <&btcpu>;
> -		simple-audio-card,bitclock-master = <&btcpu>;
> -
> -		btcpu: simple-audio-card,cpu {
> -			sound-dai = <&sai1>;
> -			dai-tdm-slot-num = <2>;
> -			dai-tdm-slot-width = <16>;
> -		};
> -
> -		simple-audio-card,codec {
> -			sound-dai = <&bt_sco_codec 1>;
> -		};
> -	};
> -
> -	sound-micfil {
> -		compatible = "fsl,imx-audio-card";
> -		model = "micfil-audio";
> -
> -		pri-dai-link {
> -			link-name = "micfil hifi";
> -			format = "i2s";
> -
> -			cpu {
> -				sound-dai = <&micfil>;
> -			};
> -		};
> -	};
> -
>  	sound-wm8962 {
>  		compatible = "fsl,imx-audio-wm8962";
>  		model = "wm8962-audio";
> @@ -350,12 +281,6 @@ pcal6524: gpio@22 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
>  	};
>
>  	pmic@25 {
> @@ -548,16 +473,6 @@ bluetooth {
>  	};
>  };
>
> -&micfil {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_pdm>;
> -	pinctrl-1 = <&pinctrl_pdm_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_PDM>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <49152000>;
> -	status = "okay";
> -};
> -
>  &mu1 {
>  	status = "okay";
>  };
> @@ -566,17 +481,6 @@ &mu2 {
>  	status = "okay";
>  };
>
> -&sai1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai1>;
> -	pinctrl-1 = <&pinctrl_sai1_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
>  &sai3 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_sai3>;
> @@ -647,21 +551,6 @@ &usdhc2 {
>  	no-mmc;
>  };
>
> -&usdhc3 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> -	mmc-pwrseq = <&usdhc3_pwrseq>;
> -	vmmc-supply = <&reg_usdhc3_vmmc>;
> -	bus-width = <4>;
> -	keep-power-in-suspend;
> -	non-removable;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
>  &wdog3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -808,40 +697,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
>  		>;
>  	};
>
> -	pinctrl_pdm: pdmgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm_sleep: pdmsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1: sai1grp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1_sleep: sai1sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> -			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> -			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> -			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> -		>;
> -	};
> -
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> @@ -996,59 +851,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
>  		>;
>  	};
>
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> -		>;
> -	};
> -
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index b88876bb7128..c6db9c85f2ac 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -11,4 +11,210 @@
>  / {
>  	model = "NXP i.MX93 11X11 EVK board";
>  	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> +
> +	aliases {
> +		mmc2 = &usdhc3;
> +	};
> +
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	bt_sco_codec: bt-sco-codec {
> +		compatible = "linux,bt-sco";
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	sound-bt-sco {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "bt-sco-audio";
> +		simple-audio-card,format = "dsp_a";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,frame-master = <&btcpu>;
> +		simple-audio-card,bitclock-master = <&btcpu>;
> +
> +		btcpu: simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&bt_sco_codec 1>;
> +		};
> +	};
> +
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +
> +		pri-dai-link {
> +			link-name = "micfil hifi";
> +			format = "i2s";
> +
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};
> +		};
> +	};
> +};
> +
> +&micfil {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_pdm>;
> +	pinctrl-1 = <&pinctrl_pdm_sleep>;
> +	assigned-clocks = <&clk IMX93_CLK_PDM>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <49152000>;
> +	status = "okay";
> +};
> +
> +&pcal6524 {
> +	m2-pcm-level-shifter-hog {
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	pinctrl-1 = <&pinctrl_sai1_sleep>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> +			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> +		>;
> +	};
> +
> +	pinctrl_pdm_sleep: pdmsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> +			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> +			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> +			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1_sleep: sai1sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> +			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> +			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> +			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> +		>;
> +	};
>  };
> --
> 2.37.1
>
