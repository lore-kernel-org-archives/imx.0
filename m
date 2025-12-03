Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD12DD5E2
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754176; cv=fail; b=U2An1cJNMlmEs0ErkB6YcBQOvyxLnAjOKs4bxVuaaGEiKGEMH434Fi/+pLEfFqpExCuibz5XHaCDzBOsXTwghzBqAE05BUpxfahrTwOfAu1K6tOAUNTru78RNWEkTicYDGKmT6r2sIlLPYhYV+szyhVwtdcimMN2FOBGTn+TSw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754176; c=relaxed/simple;
	bh=g7dbQU5/N5a4hs+UN00xOes0qPssS1c3+1gf9yZ04bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=miX89QXDWwU5VgDUVyQM8xJrMSg4gTpnmGjrR4/99b4X9djeQczC4IFgM+u6St8yb17sbXJv9PXWVbTgXYpQQCOKN58Hyf44PDuDwEUipKQrnT6NzJ3aNyAJ7S7eDa34cSEv5KZWtykwsz1roJRDnxLcKfym5YA5Fa1EuUfAeJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oG/MZQEM; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oG/MZQEM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX4gSCKR6kgl3edm0uXcQYPo1E6lX3KOja1zXvrCPFICvmkbPVoGQWndAsykHrjYmIqNINIw9jsrT+AIXwmjSbSFys1BTQyTn/SjxcFtpOamuap7I432XvAnNdGv8T9S/5sV9OMLbEVJwTBrSNATBJ92Ciu+9TEPpvYSvGIBoYVfAMSAiih4llpSyxWHuCWBx2TutydSmFcmFAWDuDsv7Y5ryDR1dTc1QXSTXz333eyaG/C7P9zoKhm9fUL7OvdBoqFPxSimXfqXY088nppRSsgDsipgiobah8xgq5QqgNuws2jeocWJILJfv16Jn6lLGy1cj71xrmbb+v6fKJMFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o45xUwtFXzr9hy4vf0tm/Hin0FGnDrpEPmB8Cm7B3gY=;
 b=UrMxsvz7SS121qriLuk4IiCKVyeWBoJkIMdfe6ZCkD05bFDQz+P+UR1vKuhB+rIuJu0Y5QIb7gkk4+P5yQeZ6GzrSO7UQ922KKxZ4FpEOLVKl7s3BJHJ9GerANZkMLiL2bPVnDeHPxde/BHy58Ny7whlto1k91+je/xT3kwquRGOZPg1hj12bWNgvygx0zq0lTG8xN81g8X1NLPLtiIPpZB/kzMhby5Ct0liZhz9dUuQ9zllKVBJqlA487RWHTyWJ4ZjmKZbL3ModM21qJcySQM/F8AixaA6nE+IzWUo0z7oUJo+LHleB6iA7G6BwHzvVH+ItfCBNMtaHwGCG24/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o45xUwtFXzr9hy4vf0tm/Hin0FGnDrpEPmB8Cm7B3gY=;
 b=oG/MZQEM9/7z7cDKtzf2PsSYlMeIl4PRIjsXVkwDKmpl63cHRKHafnGcCdDhr+gt4AZkYKI6EM/VKI3OQ+jCwH5qhDxyO68SCLtv1PUMfIR8pwrunZofGpTMOsASSwjo4GKjHaYJCEni5SKDIRRLfAr/QQgNtVLy4lPtBcV9MXvsZpTt47dolONduwAxqO+7IBna5pE00NEboFvTAuShOS6aVrOsM1bUHlqVuFg6ncVN/Xme2GDYQzwVHgQWOPex1G6MdmTrcx5Os+DLemegq3XyoxxyQT7cq775alLWTJXSOBvhJ+3wESFCa0UQPAi0i1Bm1J7R0Vu1/CcHNluekA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by PA1PR04MB10865.eurprd04.prod.outlook.com (2603:10a6:102:48a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:29:30 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:29:30 +0000
Date: Wed, 3 Dec 2025 17:28:25 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aTACuRjC_Zpf8IOU@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|PA1PR04MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca2eeff-a77c-4d82-e850-08de324e75e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8frod78FjuIyVYZqmO252pK7xVg9OsTD3qO23JklGfKFzSWirWTKwcfkf+1+?=
 =?us-ascii?Q?0EsWEu66FG3raT4IZWBMheMnkWaPoMlg57+N5K+GDUr6pLD/00U9gaDlxLOR?=
 =?us-ascii?Q?1wkK6r4p8O8zFNLQZKMrdHc9yZGhiXFVtgxHUnEK9mbapIMydfTjjHzyX//I?=
 =?us-ascii?Q?d5W/RK4KmsL7bH8ETVfVb4S4+gir5i6qnRV1kM5CylJi7YAK3IHxO4q2Y3u3?=
 =?us-ascii?Q?r1LlvRdYLuhbtrGPFIIFwYAbBF4EfdjWwe0qj8r+c2ZM+yRXt31LoGlJ8qn8?=
 =?us-ascii?Q?tWA0LHg8x7cc4k2SPW21194Dqg+Ni1nNAlbIcrKh6E/BzvW+W2DkN/6GKYtR?=
 =?us-ascii?Q?L5UgtwbI4sbA1lhN8oqRWpMfm0Az7K8/RcdYS2+BxV7GkIzW+UajIyYaSGb6?=
 =?us-ascii?Q?NKV7Z1nLXXMGiDpdBk/ZrYb1dMkepw8GHigyuIMRx/rASGrbYdD3ImSNKNbx?=
 =?us-ascii?Q?Ns7981T/vEfsG49rC/Kqm2XwV3q1kXTEYiLvlb5dVgYcZk7GNa5Nm4g8Fz7g?=
 =?us-ascii?Q?H76a1NUXAsr9uZXsY/sOH6EYNzY28U77OWRPQb6lbzta1j06B+wMMekb9miW?=
 =?us-ascii?Q?16vQ5sTF9fX2WBD5+oVqLTwCFpZBmC/kWOxjyuwH2ugPU5CsiOAeLu+OEaFk?=
 =?us-ascii?Q?owLI2hU0R2IiVikRCAG0tNZuamLbvdlYLUMOtNkH1C/P5QxeA/n9BOqmU6zU?=
 =?us-ascii?Q?7WZPbVphF/dsjLVluWJr76waTn7V4wd4FX/pfVozmEpJLT31L427GvEiKOmO?=
 =?us-ascii?Q?KfhOTFAKiiscNmfYHzCUBuonbgCNMh8PWs7bg9BKervooul2RMNhwoM7XQR7?=
 =?us-ascii?Q?FBeLZBrxli7NsvjkdH0YcsqgSCocrEBFdEUTMPZOUKleYT+L5O7vzLR/fKQn?=
 =?us-ascii?Q?DlpwInM/cy7IHWm/bf6/xKmDFJSkkrQN3nysQqCvRF2NUCepUXt7j+gGxyKJ?=
 =?us-ascii?Q?Sz8TGjh8HITmg06tAkJBJaJfxY2hh+3qqGDwYHJpwrLty23OmdlZGYilKiXA?=
 =?us-ascii?Q?a0VdP1ol8w11++aHu91z2AQWzpZkRlS0yM07e9pJTKTXRS9FtZohWL6iY3aB?=
 =?us-ascii?Q?74iJw/iJK2OoPqHKpGazEb8OqMmyuTb2ukgQ+F/bsYHMJ8Nlyi7gIYcUVXoy?=
 =?us-ascii?Q?9m7cpaEXuiu6wx+eopf4qEiYBM8BpPIePdsBlQ52rWI4ZlsGp3rXlUz6kH/v?=
 =?us-ascii?Q?32SLmoRysO/40iEQA67N184qf7UDPzvEIJE5Enizu4QKy8f5mrAMWgg3ujH0?=
 =?us-ascii?Q?Uiz/FvaLx4ZOaYdlmW2j1Aqp15cS0U6K0Bq4MlPr2zT4mWlZE9T3tnNnaTVR?=
 =?us-ascii?Q?zD8sdTEAFus1IaXjzp+X8QElDnPQWCEdaR5l1pvY8YqSDIzdkMy6wNcTH47e?=
 =?us-ascii?Q?ZbuNDNU8bTGgFkAEf41bXuSQ8G0DGg6yVa94iwy0pczjlQIHxV2tuzdWqU9v?=
 =?us-ascii?Q?cNJtGZuJl89ZLfE1+Ey6bhQMVdR69R5VJbR4jQq9FWcEu5IniU3xk4aDeQLI?=
 =?us-ascii?Q?l5Q4JJYF87wcegUaU3DgH8QvLdg9Ilg0BGSN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9627.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Man1wdCEOUUwY4Tm6dxyLwj1aeYadDEPCFtXU4vet/Di2myIooXCGVKYG77+?=
 =?us-ascii?Q?JL/d6sgOhqbsfKCK/9Ahe2btdtHTn7ArwQObBT3eVSvWnLdjgIerwVstb1wF?=
 =?us-ascii?Q?oszQ6PEdqFj9NrR6aX5Zh0MtUglisP8N+TPzjyml9a1goHZUeMGh587TjLAX?=
 =?us-ascii?Q?HbJLhtZOyYcnJPWFodPNWqZn6A6mq7wdoJeLYk2xyc3IOhHxZpmE7N5VSnXl?=
 =?us-ascii?Q?t+jjswC22BoyOV9j9ZizcUi9/FvGs5l/3ztMZfs6AyE7UDCfeG2Du4bHU7m8?=
 =?us-ascii?Q?riK8IeCPoUqm4D2TxsFHVd3H2kbgh6cgsbDovGR5UpNnUeyCn+bQt7dIrzVV?=
 =?us-ascii?Q?3zT7J99O3mWgwOix6qbaJX8E3vJMppaaJytkiNoR3bI21lvJVO3UNa9RH4U6?=
 =?us-ascii?Q?syvXpznyGsbp5Sz0ietczAM9OKYPWLRirbqt30gpv2UO7NHXkhlHV6GLTxHC?=
 =?us-ascii?Q?lqcPad6pIuh46VGntQSObAIXZPVRu9h32RdEuzAW8ZBEpOZaKxj8eyFE3NPZ?=
 =?us-ascii?Q?VWE5sW1HHO3BPxrORLuO1tK0cclpclRw7QpbbgGr37njyLMIwpGz0aX/N3g9?=
 =?us-ascii?Q?GSiYgIw8w1xd3Xb1gRSoA7B3uG2TO99NVzebDbJE4o3mWTLt/LpfB+XRAh9E?=
 =?us-ascii?Q?oMpLRBS7pax7Kil79BrNnARxA05MOCqfexM0laV8MA+Y57P7d4Ac3I4aCmmL?=
 =?us-ascii?Q?OZfR6T0EVkrbetPpkhhnoWFru7xbKBm8N4Q9Cd64i57jU9bgFCAQLxlA6+05?=
 =?us-ascii?Q?RPIykKUTkPbN360OkjCoF3zcSytKJMr0zcCB8n9ps9xuHBdv7EYlT63MzdzC?=
 =?us-ascii?Q?2Dby8BIUyyxZsNSxXkAgkTCJu9FXaN+6zbJau6UKZMJJYd6hpgKJF14XJW5+?=
 =?us-ascii?Q?1qu2QSgAX+cQnmsyCeo31X9CWeu5O76lAuyGLyCcMJJ0yn5Adp2An91NaQf4?=
 =?us-ascii?Q?b47vsx8PKwatjNw+RB6oxZCyBJhvUR87m/pop7kfbxJ1WbZjaTWD5IAIUlwC?=
 =?us-ascii?Q?UAu3mTEaxK3afz0F2vwuSNhlicHZLlaAE8eOJIGqwk1u9hIszKf29VyEgirn?=
 =?us-ascii?Q?LAeGQYl8CWD/h5jRbL9bsH71GbI3rr3l0s9mwJenKg3MP0gTz2iFFe4lS5zV?=
 =?us-ascii?Q?RRt9XlhVwXVybymhx2KGbVejMDaP/5u0eYQWrrKL5a74lfkPkqqdPOqpCyL7?=
 =?us-ascii?Q?rDrRDTas9gNTOGBessadjcDeHDy/EYClXzyUILkQVqEdeW9tTu+rVQcuPcWk?=
 =?us-ascii?Q?RvQIlZFzdumsOaa8Q5+A4QFivXSMczyCw92cPmsKWjT8V9F1d6VpGXiRXmN3?=
 =?us-ascii?Q?6jm2c1WRGcAQ76O3EPtWO/8OucgFaU0BNF0Gu2BgduR2OU7q8dbW4cPcoeGp?=
 =?us-ascii?Q?fDXYof4veWRzlAk9MqT6KfqjClJLXWQVFGZYa6Zbg5xyjSAjmM2586W96iBE?=
 =?us-ascii?Q?bvNKygwO3Ukr0iWzT9IRNRaiJLAp6idtgebiYu9TVrQ1CVbI1fZGGoskiF4X?=
 =?us-ascii?Q?3fMrmOJcCt8vPaMPUdN8cUbJ6+Ci7OTGPvmnRTigH0OHucTfGWA6cwGmxNl6?=
 =?us-ascii?Q?hSbxfgkjmDnbi1Dvh3qsr3EapY9ZDrdinDC/e81E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca2eeff-a77c-4d82-e850-08de324e75e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:29:30.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1knXDWvpBwP0oFLmKJbw4kyRcp7lIzx6D3+GmefHtFaOAQxpMdJIaHUqKmtnXsmDsIyacwMPK8DDUotyGPYiAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10865

On Wed, Dec 03, 2025 at 04:38:19AM +0100, Marek Vasut wrote:
>On 12/3/25 3:48 AM, Rain Yang wrote:
>
>Hello Rain,
>
>> > diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> > index e1f91203e7947..22311612e4403 100644
>> > --- a/arch/arm64/boot/dts/freescale/imx95-clock.h
>> > +++ b/arch/arm64/boot/dts/freescale/imx95-clock.h
>> > @@ -183,5 +183,6 @@
>> > #define IMX95_CLK_SEL_A55P                 (IMX95_CCM_NUM_CLK_SRC + 123 + 7)
>> > #define IMX95_CLK_SEL_DRAM                 (IMX95_CCM_NUM_CLK_SRC + 123 + 8)
>> > #define IMX95_CLK_SEL_TEMPSENSE            (IMX95_CCM_NUM_CLK_SRC + 123 + 9)
>> > +#define IMX95_CLK_GPU_CGC                  (IMX95_CCM_NUM_CLK_SRC + 123 + 10)
>> > 
>> > #endif	/* __CLOCK_IMX95_H */
>> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > index 6091c2713fa48..47f20e501315f 100644
>> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > @@ -2874,7 +2874,7 @@ netc_emdio: mdio@0,0 {
>> > 		gpu: gpu@4d900000 {
>> > 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> > 			reg = <0 0x4d900000 0 0x480000>;
>> > -			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > 			clock-names = "core", "coregroup";
>> > 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> > 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> > -- 
>> > 2.51.0
>> > 
>> Hi Marek,
>> 
>> Thanks for integrating this downstream patch.
>
>Which downstream patch do you refer to ?
>
>> Please note that CLK_GPUAPB and CLK_GPU are
>> always-on, so the commit message should be amended accordingly.
>
>The GPU clock do not seem to be always-on, neither do the GPUAPB . It seems
>the SM can turn those clock off perfectly well.
>
>> Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
>> in the frequency table, this also helps minimize differences between downstream and upstream,
>> reducing maintenance effort.
>
>Downstream kernel forks are not relevant to this discussion, upstream your
>content and then you won't have to spend maintenance effort on downstream
>stuff.

This patch [1] was the reference point. For the Linux working environment,
CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.

Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
of its frequency in any OPP entry within the frequency table. Removing it
could simplify the OPP handling logic and reduce unnecessary complexity.

[1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
