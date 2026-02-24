Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83332F617C
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 19:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961159; cv=fail; b=euebxSkFQiY3hdYkwWlmKY/nucmFmuNZG7CVuK4D+z9QQkNFnD9Ng6ES4cWk2Hl5CKGu2r7MJlinkTD5KVIYyc9N4VLtWbLkFS1xPYpU8b+YXYD5FFkFPsI2/HI+blQUzZ94/BXcZA0BWjLURs1y8aInirziUQvNTrGFGy204DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961159; c=relaxed/simple;
	bh=n4idGgb4vVtKlaRzdRbRGBxptDY8JnmRdbFrT8/cPUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pJ4l8sghC1YjIwsRBKZeYfYJabM5qiaBVLJHwMJSqe3LXc+ko5j+XGQYi3PRrMfJSH/XYcNoy0SNvPcjlGLy1TLx+Hs3D0h8Yov52Mb+vNZcnwPPYLU9WiJ7Ongre1RWnQ+bsIbjqAAKeTXpylFKvjtapjPkJQBDXN8XECArnO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fh/mdJzD; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fh/mdJzD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk3uakl5kGVgAtAtrsNX+PpaZQS5/rlPi4sjFaclbuh0YG3fUG4LCJXDG29QDRtKb4RI6Jq3t5LxHwkncAh2JEdbxaHgFu51N13zrH7XpLvKnr28Czdeief5d8+xhyrTTuC0ekjlhZjZWMGjrDLnrxIPwB94ZmOArhPbX1FmFIuBdSl+1AShCOteLEo1J8FqQfaBq6zwVBMlkMdq49rSfomdcqWwLRM2ubgzr+EGSBcCGq9ab0hq2o1HdW1h5EywN/SreX9y+NHEa5aNxJFjOX18iBlG8YvPSXioWg1hqiitGa/wV1I43fgMz4m/BVw2Fu2c2SBV1Ie+Z1KrNyHYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlEktUWUudkXZOFxzMWzZnmtSCKpSEhe3GPUkpTnv3A=;
 b=g8HYQd0huqqWQ4jzLK47zDSm29TTCS2IOIjXR4AmQyhsu7vuob8yk0wVKxbVXxQYnPl21QVXQQIE6ego/HFX24XpYGEgdWSv67cQeaaBmTKcofHGRhYHD4egEtMYVnd29bBjNYE3ArqrPw9GNJL00ROSzex1HUFvRvnXi2xjDxb9m2vUkvZ1+neOCMHuN2JQI12S9/XphutN1GUjffAJUqrYLbzUIUhKoqg5VXoqwonAyPugxo6GHTekgmcuPH1S/GhOEhWdHagApDymIB5YOD07fKZvi64kb39L8JrUkCowpjJrgVDe9gWWCDrRLroNv7NQYaKIEQqaIBl1AKybhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlEktUWUudkXZOFxzMWzZnmtSCKpSEhe3GPUkpTnv3A=;
 b=fh/mdJzDKIhKVjFWbjUiSvLyjMVPI5GZSMKjAEC3TaZAfiGTlUFgyG6kRPu782l5UkNvb+/tebosJtyYNA9yF+eyGq+1hg6O3rmh56MHR59qlW6kjSxBW/vekLwYmfcIoAIlq6CjVdaqcCRNZhgCMZNceMqfTWTyjDFnN3xTbM+102E8wc7EoTe1VYxn3L8hDhvxg6BzpeLcI2kgmvn/OMNvL9dpNDGH3hPH30XP6aszElDsJlSIViiG8TXbYssgiJNEJ6g9HfsYHHNo0hxN8Qcy5RHVcmdUMc79E5J3uEgUHWbpGa42ZnYNNUKFXSwly4/jy/1UpL+U6F5tNF3rSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 19:25:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:25:52 +0000
Date: Tue, 24 Feb 2026 14:25:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <aZ37Nmt_vpZ_Oeup@lizhi-Precision-Tower-5810>
References: <20260119183604.88192-1-stefano.r@variscite.com>
 <20260119183604.88192-3-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119183604.88192-3-stefano.r@variscite.com>
X-ClientProxiedBy: PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f92630-21df-4796-166d-08de73da85f2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dLYiq7g6rAJsvqiz6n3UT+Cbj7M4fRJDXv8rAmOj2lfq53+BvpFC4qECdh9h?=
 =?us-ascii?Q?fLzNt89gSE3hrm9XSjMMVbmQHhl+OeG4bBYYuqwFq+qfgPxoHM2lvwf/5Sfw?=
 =?us-ascii?Q?VZpn3qXxfU8FRRHyorWmFovax8GHQ0DEuTn8wvCvyEIG6yUwS9m2Ra4X9KM9?=
 =?us-ascii?Q?RWSGTFdKZoPMaZLUsbAt9fhjVsdj38sUzjVKg8gWFXraG/f0eztyBZZ4odVH?=
 =?us-ascii?Q?FuVrzZxyxwOg/ukmgt2gBia97KOmbQuHe9Y0UrK/VWnql/e4WWHcRGgQCY73?=
 =?us-ascii?Q?al6OAnoLtSfImDgKz9DmO25BMTkDvtbmS7qKpvCgj+sp/tDUZRunzSke89ZG?=
 =?us-ascii?Q?fm/pU8abW02vgKvPtnrlZtUHwT4iV39jT939ujIjPjHw0IdWJDCkBqOOcCzl?=
 =?us-ascii?Q?2i5jgZ6+zO1y1Fs2BikGS7W8VZkAQP9dmT7Dq8ngBLiJTgAOCGjMQqihP0wR?=
 =?us-ascii?Q?NNQ0UX9h45sOrAFJlIlXIly7YyiT6tna++UivDtAkcHSGk4ly1yTNNXl9GHJ?=
 =?us-ascii?Q?D2FJ3iewuDp2w+JPA4wbOWXB+eQEC6swvKaGgBvK1mnbOlo/RLDnXjTjLepi?=
 =?us-ascii?Q?nBF2DiNSuJBxpPZ5tDTB3xeH35P6AONwwlhDxXk2lSWZe36LocPxDsVL3vT5?=
 =?us-ascii?Q?BcZIOEGpb8xxtAsFu8k4F4JkWSzzx84LVc8WIbk3E4J600DRujMzZUr1x/Wn?=
 =?us-ascii?Q?2txk3z+pQFHr6SPj+HqUA7FngvnxJJjeOUMK/T6jM9nv/+cquQM1Uu1g+477?=
 =?us-ascii?Q?cxQNSV8RGXX5IMQ9fYrw39YEwlo7gOFnnAwsv80eDU/CFOeUqordG79sZ6jj?=
 =?us-ascii?Q?OyiV+HWoFjNnL3r/yKLoHoHO4mq41WtI8kQVmvVjOD3M945xa0DYTfUtlcNH?=
 =?us-ascii?Q?iQ4N48sbpzEIed4gz5ubLX/aT1nkfU9dC2o0VF+GvVx57gV3RBRAyrn/onZ7?=
 =?us-ascii?Q?Hmh96h73ULB7Fo9OkRvPvjhBb0aK2jDNgxo6x6Vy+cGrCHQsH5cz1aNtGPyu?=
 =?us-ascii?Q?mj7pmjq7lh8lskUcHDcoKOGydmHTDLFKBXIgCn6BSXl7QJaHsjP2ejajzvOu?=
 =?us-ascii?Q?p9ZTMsV5ZxUL556aAuvDTQV4FKS4qgMOKqNF8Ee4MyyVH08JiBalT1Yj1Ekk?=
 =?us-ascii?Q?AElYgfbFytJ1dPxIrANFFcQrfAxmx89pKN81t45JD6+cHh831s96UE/FTa/7?=
 =?us-ascii?Q?/BKmEBoBXNQemB1i78PfRCwWhA2hVgY85I5GNbv87OeO6lk7+xpGNuNtdDRo?=
 =?us-ascii?Q?UgSOTMfxqOOlxjFvMmu7n9aA/8VNTXthC/xMAT+DJXfXRXqUvTGNUsyAtKQx?=
 =?us-ascii?Q?EOMNNonlsrbLtY5xZgsQoEjUn26dX/NGstR9A1tYaeb1OjXOC/feodVv6u1n?=
 =?us-ascii?Q?q5Zh9M417zQXb0NOtAiu1W7JIbm1ZgZjXJtuix4Si1uMOF1l+oQbv0WZI/FQ?=
 =?us-ascii?Q?2J/147MCrXE+uf+pkXlgLQfPN8oCBX2vapqss1zwTQjgMGGzerQnmReOe7VD?=
 =?us-ascii?Q?FF79cArgwtxPPRntNoUGxqjcytR592MoqR7twHCT03msfwdCqfKjDIeAVDud?=
 =?us-ascii?Q?SV1/CX1IQCExwrDZviI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QGcBLMSvqDBDIw350pwCi8WvjupNLI0QOrd3fXHKE1s2a+Qm4TY+WvKPiE3w?=
 =?us-ascii?Q?hScytoM6YIWBMhgsUQMLnPk2Li91D0bj9g2CNZC6HHtDWDG96wKe/RKabvah?=
 =?us-ascii?Q?d1x9C7Yu6ZR9MQZyXkPq3BU9LJVTCDlbe/8za9/Xp5/L+7kAg7z1Gs+N1cbM?=
 =?us-ascii?Q?hg0uBPF7VdgP/r8xw4b5Iz0CjJ63U1Lk9PMQFx4tVqEjmpeIQEXx8wUXdivy?=
 =?us-ascii?Q?culm4SMZ8my8n+QgnYAwVrX5KPXJ7k+93mN+Sev3RsS2YaFc/fUQpWxh9wab?=
 =?us-ascii?Q?/CuK6deS8WU9qYEdrCfsFSNIpSHOgrH5O1uK1U6yCEfI1u+KfJTBa1RQFZ+j?=
 =?us-ascii?Q?VX8qcTBOkUPQAJ4jzxxJJn980xCGG4NMMWwpZtZ+n0SBqSbUb5c99Oe941Aw?=
 =?us-ascii?Q?H3SdP+5P50mE4AafRJ+E0ciSOiAKAw6ZXFsd1DxATLwI+ll7xsRG0N4Zeqxp?=
 =?us-ascii?Q?mE7erSi652znePvalYgermr6Hms0lP98wp6g9+JunlIiMo3uodaG2WXJICm5?=
 =?us-ascii?Q?rZbZZ4jQVfk3bbLAXXQNt0f0ITfxY+v4QZRYLFd3xn6Yg+xsYOWYbDGYGOm5?=
 =?us-ascii?Q?lZZtUetTFmODw+deTn3qnhIpHraj89fGNn/ds7EqW92oxgnaCq5HNplWeqzW?=
 =?us-ascii?Q?3Gt4HYSq3sC2SDFCN9FVmGzcqzFvv1+bBWYe/5xDVWmrtH57GhCp1I+1ic5v?=
 =?us-ascii?Q?0RlpKmx4GW44aFrPf9hqHDT+ymvviMXG/OqhvoR977lqbTYuBR45dYehVa8g?=
 =?us-ascii?Q?BiNaUoViNSR9STH4+VfcVbzNzn8n0c4yGlF4vkJEq87OBJUb2Yy0dRnXSxu+?=
 =?us-ascii?Q?RIEBiJFBJFi4ukIi8b+I+f00no6Gg5ItYwM/0XqJ/G8oyYQWRok+LdkJbEeg?=
 =?us-ascii?Q?wgjw5116auFDnlTMIB+8eOx14EOO/RtDoVg8Dl1idXFPpgA1IbwH6Mq39UOy?=
 =?us-ascii?Q?jjAOlSVRRzrUAyhOZBLP1mm45Q+M3Z7tk+kZIefk+E4udHCuzrHwFytZEndq?=
 =?us-ascii?Q?qoL6nl5tbRSyfWFPiOevaivTtCnLThUdrykTBmxbl4xaCSd8EdrVm9K4ZqWb?=
 =?us-ascii?Q?BAA/BC0lQEO8t8bQzjXPY5BIp0Tm3ngfTdsp3mmB4G3EuNF0huac0yu1kM7o?=
 =?us-ascii?Q?D42mltEIRcz9vnn3XvShgUkZUBBpctSiPB7TPFVJy3oe97fnVvzg1jyjfTXC?=
 =?us-ascii?Q?3V29khqLgp1IXNPOTJzr6eAoDNP1zfDSv12DW4/ggPWo9e1b/vsiT0I6DUQR?=
 =?us-ascii?Q?CkzboV+RFjzmJT0ohijKFT1Y4m75kNjfiAqNGGEViBbevaKopBoQ7BxhKSV7?=
 =?us-ascii?Q?xxmVO+BY1WnOuB2R+VUECkglKKuuDlUavsN9ELZr6CNhalneSOV6i4TbsabN?=
 =?us-ascii?Q?raoVGhdwUsA1Tm7jQRWRTIxUpefrmVdn9B0m0OCk1FZMTHydh2af4OeP+KMd?=
 =?us-ascii?Q?yfddTY+1vqGbOaS7YhVZ48ZZPJUxWuSU2vLd2mW+PJcyfLm7j70m7sgePd93?=
 =?us-ascii?Q?BneiPvc332o9Y45mN6WDezPEOizQ7e6bBzsktSWni0iJPrjTSlTJspFgmdMO?=
 =?us-ascii?Q?tVzbBvH0KpH6sSvpe0BhmufxBDnKgftPmSS/JMTAwSeBpCopFf7yhnlxvh/Z?=
 =?us-ascii?Q?AvMJCR4wHzqyCXB+ufyJFyK9jS9mwPDqdssBd8bgaDzREpDPhiUTFL0b1ENI?=
 =?us-ascii?Q?uLnhWVreH1lFINstmJ1PvtQjIqjuGmU9yqM2AbDP3h6TLThn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f92630-21df-4796-166d-08de73da85f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:25:52.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OoCxbQcLNCBf+pxe5Wvkr3FzGvk3zZ9h9y9Lb5FJFVJ8q6yS5Y2s6pttME0KhTK0QZloV7aaXa/75JTTtslOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117

On Mon, Jan 19, 2026 at 07:35:54PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite DART-MX95 system on module.
> This SOM is designed to be used with various carrier boards.
>
> The module includes:
> - NXP i.MX95 MPU processor
> - Up to 16GB of LPDDR5 memory
> - Up to 128GB of eMMC storage memory
> - Integrated 10/100/1000 Mbps Ethernet Transceiver
> - Codec audio WM8904
> - WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
>
> Only SOM-specific peripherals are enabled by default. Carrier board
> specific interfaces are left disabled to be enabled in the respective
> carrier board device trees.
>
> Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v4:
> - Fix typo in spacing
> - Remove vpu and cm7 reserved memory
> - Add GPIO_OPEN_DRAIN to i2c gpios
> - Move pinmux to eof
> v3:
> - Fix specific node name with generic one
> - Audio regulator cleanup
>
>  .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 ++++++++++++++++++
>  1 file changed, 425 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> new file mode 100644
> index 000000000000..923c4e6b848d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common dtsi for Variscite DART-MX95
> + *
> + * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
> + *
> + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx95.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX95 Module";
> +	compatible = "variscite,var-dart-mx95", "fsl,imx95";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0 0x80000000>;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "+V1.8_SW";
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "+V3.3_SW";
> +	};
> +
> +	reg_audio: regulator-audio-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wm8904_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};

order by node name

> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux_cma: linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x7F000000>;
> +			reusable;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
...
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28				0x31e
> +		>;
> +	};
> +
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC			0x57e
> +			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e
> +		>;
> +	};
> +
> +	pinctrl_phy0res: phy0resgrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16				0x31e
> +		>;
> +	};

order by node name

try run https://github.com/lznuaa/dt-format for new dts file

Frank
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3			0x57e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2			0x57e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1			0x57e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0			0x57e
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL		0x57e
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL		0x57e
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0			0x57e
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1			0x57e
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2			0x57e
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3			0x57e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c8: lpi2c8grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO10__LPI2C8_SDA					0x40000b9e
> +			IMX95_PAD_GPIO_IO11__LPI2C8_SCL					0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c8_gpio: lpi2c8gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO10__GPIO2_IO_BIT10				0x31e
> +			IMX95_PAD_GPIO_IO11__GPIO2_IO_BIT11				0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO17__SAI3_MCLK					0x31e
> +			IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK				0x31e
> +			IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC				0x31e
> +			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0				0x31e
> +			IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0				0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO00__LPUART5_TX					0x31e
> +			IMX95_PAD_GPIO_IO01__LPUART5_RX					0x31e
> +			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B				0x31e
> +			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x15fe
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x13fe
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_gpio: usdhc3gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27				0x31e
> +			IMX95_PAD_CCM_CLKO4__GPIO4_IO_BIT29				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x15fe
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x13fe
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x13fe
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x13fe
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x13fe
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x13fe
> +		>;
> +	};
> +};
> --
> 2.47.3
>
