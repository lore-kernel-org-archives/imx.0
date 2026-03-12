Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031E3B47ED
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773319630; cv=fail; b=EY4H3LTiCMVNSYAiRzZrt8MwmOUu+6LD86BKjalkfp8J6rqsxSEGIrmCK0cKp8h+IhZkV7QFagt3LMPZKppcdoMEaIDM6HHMjWqKTcD5gJTLAI41IiPLVmCVQPsP9rEGkIG4DcYDYCi/8vmNwEBODGQ4FxtkWJCu1J4PaIsSH+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773319630; c=relaxed/simple;
	bh=G0mEXhoq6/t24TzIIT2lAp08M52HkPoPJhJS0F0GmkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IxuoKsolv2c4PpWAWG1Yq3UZmCcpDsopYJAhi4BhfRicL2jbD4xlmLCcNmtJnqcl/P/vDoNMj+8BC3qJoLnHzewsyxzhH0shu3/yX0xxuqNytmykQWK63MfXPlyR45nwbxHEata/4E/iDi/oq3pQ21A6c2ueG4/1WorDNgf/Am0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uCG5pB19; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uCG5pB19"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DY7iAl/h2y7BCF4EagY8Yb7lGWl5N/th6QHXtkqnNjd1CHhjnWKNLd2icXOTE7KTuyw/Ih8HleDhBH1iOjZ5VVbMB3kO7pV8kfd1aLXFFPo2t5/uTqVwlqc52lsW0iFKUhGTeDZiVvb4Qq0YOPI0p7HcilYl7C6SgQwkVuVnVcRhik37ImX/H44WG9+w5Ja8WJeElJ60Xcg6vaXxc8TCMq8/lGANtVvjZgMFnmtzJt8MBwlaaTFEG+SwEoPjrqdo0AKLodvm5R1P4697eEY1E7EOWxubinLv1PKNQ1Z28CNrJNQvJvvZ7bJJOBDWbVZ+LXr1vrpkEnlhE3hP9CXLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqVIdC0QD/C+iKSTWmJOXG8leZ8W3m+opCFv3/eudjs=;
 b=ih1s7Mpeaz8KiUYiX1N4n8A/PD2g4E6ToXDLjAyFQ/pNzv7vya0LW983Vn03AxA3GADTb5dNuY84z0BTrKkMBURl8HGS26uXdQ45UxLXF/zUIdsb8Ce3JloB2PrlDunqItEsOjhxBKWlT+bc9E+jAMK+9UpXUyiFsdpVmXxnjBsRnWUifvIKUUgg6T0bWoNaBSRi2Z4FxHmTPHdaIOSiX0o+a+oqjcN5T0RiYTzdgCWJ+tKMgirybHGGI8++FXmwxl5eF+MmY67b7w2Wob20FxOIYsHRiLJN8ERAsXd4NMtbv+Vn6/4KyymUGCc2eOhwwaN4I3c1UbuM7AQjR9DWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqVIdC0QD/C+iKSTWmJOXG8leZ8W3m+opCFv3/eudjs=;
 b=uCG5pB19FRPZHYId9xA90e8m6o/Gb3KleUl9+a71pkVx+qtctekfImF5Ozqfmhau03L6JqvFqTfr2OoJU/v8P/edPWx95tLHSvh/YC8sqMIdQeXK7TkJA6ZuY4hcrv/wZuzRNTFgY3sxUyOKKJpgdQiOkI5m+zEp2kIA/G0MdvKr5s2PeHM9l49zCPb4Q5svyX8wmXYMIjthzlsYQ3+Fo0Rs6lCHaPZJ7tT10LsdOaYP1f5mBBn+/vEgghh0uIRS2PVLPuY11ij1U7GLTs4HP6OawPJrTEbXBlFZ/6khtfG8uN2XYLVPHQeCXwJ+fBvUyRVS4MD1VQeqDf/IVwcLUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 12:46:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 12:47:01 +0000
Message-ID: <92c78386-d04d-462d-8dbb-9d4d18ae0a3d@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:46:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: freescale: Add NXP S32N79 SoC support
To: Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Larisa Grigore
 <larisa.grigore@nxp.com>, Andra-Teodora Ilie <andra.ilie@nxp.com>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-5-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260311081154.381881-5-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 85785e9f-0a69-47e2-2434-08de80357455
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	C/vsYi8zxaT8ZjU1ol0ky6u8mNBeT+nx6VafaS3lsWbfiulaQQdeoOGRAr2apO3Wa5CiYSUr3G8G+D1VCFm8OX6/2Wtr01FJbvJZG3vbmpCsT3Uq0BpuN87eA70z8EAdpholy6hxUTz3Y6G8FRdm15hIdSjZ26NciQW5uU+aWCEba7IoV0qHAE5FJxFLMS7i8Ke5CU+0/+6aTjMjVGoB3H4U1c45PLt2xWHytHlA2Tqmt5lzms9rj5HHtNOoA45/lpQ5gmP/EC89sxg10DXOFjNb0C30Q9O7IriecIZ9wuaWr/l6/FYkrstv4ILIKjWR4qdauw2FW/G9nd/8rzF5bjs7+GOoWkyeo0C/pz+Z9vdQnUrWEA4TwXM28XbtsbsR7R0r5Ymu36sJWMDFuojzT+biHPINaJA6QGwiLSwx+PkkOOcy1Ju4wAB/nuUnhGVMXY2QnqNExwfVDLar+c3zLMSX1nXaJDkcjMrHn/jlJbbuZrbnR/B4LmFVB4Y1PNKnmjfra9AFFzhoZbQTOxC3m6FOmtqX+ADzGWqswyCWyfpWoCwb4JCAPfABkkm3bPvqXnu3erIdXuMURiKAJ5GtQNCBab1C5AhzEB+yFkUfl3t+4Y9zXwaAbiJ9BlydHXDmOju+E7j6EIcU/QpUHKGio1HYUtUAHD9B92jJk+wIyUFJEOTArzzn9TYIRSjreixSlrpwlaVl1buoy0l4uuSUVulr6IgsplR6nLIl/bqkK3jxE0XZH8jkqYL/eTzRB+qL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWZza3RSUnUwYXFqQXVvRGlOck5DNGFXbE1tMGpEaTJKR0k1djkxMzNVZm9y?=
 =?utf-8?B?d20zYTQyOFJJeDN6NTdjUDFJaVVaWlR5N2pGa3ZrRUZydWU3Tk9mcSszL2Rh?=
 =?utf-8?B?cnMrRmNxNXZycmU3RFFqcW9sTHlnc0xOMTRzcHB5b252NGF0MXpKaHNkTzBU?=
 =?utf-8?B?M1MyaTZDL1dRNEIwR2Y1OFB1K2R5K21oRG5oQ1EzRHpuNk5FaHZETm5nWk5K?=
 =?utf-8?B?YVFGaW1EZFRraFZveEppMFJYVlJmOSs0MHEwU1QwMmt0MG05NS9KUGRBYmRO?=
 =?utf-8?B?c1ZhOUMybkx0NlRlWDQ0SEZSaHQ5Z0hxdjFyQmtYM0JsS2dsZDFaZ1ZCMDVy?=
 =?utf-8?B?R2dvL3ZHRWEyNlVxOFdVd1ZYOEZ5WFJvMW13Q3loSVNQcEJBcXJlaFc3cFVt?=
 =?utf-8?B?NE5FRzdlVFgvMEdSTC8zb0hFYjk3TzlUdURnM2pDSUxiUTRZUGw2SGlWMG9O?=
 =?utf-8?B?VXlUZEZmWkE0OXU2T1NEQzRiVWJUR0xjU1d3dVBLQm5mbE54TXdwSjhjYkVv?=
 =?utf-8?B?YndKWnNtR1BONWpjRTcwRmkvV0Jub2R1Y3dLVGRGYUloZmRNWEJRTTh0R3lo?=
 =?utf-8?B?OVZRaWJBNDZBNFlkTXlvRVR6V3dUR2FnTmxrZU51YVJ2azlFcWZob0VlVzZZ?=
 =?utf-8?B?SW5EWGZ4R0ZwTlFMTVo5TlBFMm1BbTRQV0tiVGpINkgyaXNsN1dpWlZYbUpx?=
 =?utf-8?B?R3NCV1FwaDZhMFRMOVZ3TExteFJZYlNacHZGK1E5WW1jU3hwUmxFWVJaYVlh?=
 =?utf-8?B?bWhKbmhpMGhuSTh3SHdnL1MvandzSW16dy9YeTNiKzhybXhjTjIra2E1S05K?=
 =?utf-8?B?TWV2N3RzTm5TUCswSTV2UnUxYUxFbkl3TEJ2MFV5WDZoWVM4N0JiZHgramhw?=
 =?utf-8?B?RkU5S1dRclBoMjQydUhoRk03UlBKY09yK1EyVm9KemxVUFJvZHdKcWtrTTVn?=
 =?utf-8?B?VWtqV0VzTjArbEVIOGZGS3BuSVF0Umh2K0pTa0ZYUXJLTmlZY0hTSmd5ZCtR?=
 =?utf-8?B?VkFIbTJKWEFUS05SU3FNbVB0SEVxd0VNVm1DaGVmRlZ5ZGlrUkxaNkdybXBt?=
 =?utf-8?B?TGNQS1Jrb2U1TlBiWVBSM0c5K3RYQU8rVW1USGNCT1hVS0oyTmtyQjJTMjhn?=
 =?utf-8?B?aWdpUnhlZ3dQZmVjZERrT251dG53blRCOENLYys5WEx5a3dONkJNdE9zem50?=
 =?utf-8?B?eU1LTHY1Y1ZEWUxGL29HckgzVlNNbmVrVkpiOFFlTGhwMEVrTS9mZjBBSWlv?=
 =?utf-8?B?OStDMmpkZnFEL3R4MGExNldER3NQdGFVOHZQcnZlRGphQUlqbTg5Q1FFNG5k?=
 =?utf-8?B?VCtMZDRNaW5jT0dyRGlzcDhyY09URjhDZjFGUlNmQTVUWUxaTHloUnBKSGtG?=
 =?utf-8?B?YmlwbUFRNzVnOTlvd3EyeExKNVdNSmlmOEF1OFNSaC9vbzVPN0xiaVB2Z3lI?=
 =?utf-8?B?YnVjd1lONHV6WVR5aWkrRDIvajVJcnhsaTUvQU1tV1pqcFp2WkszR0NhZHNE?=
 =?utf-8?B?RCsrVUVjRENTdHBacTQ4dEdhMEJRNkMxdW5XcUtwcHZ4aU1nYnlwQUdZN29a?=
 =?utf-8?B?NVpMZEtqajM5OUR0bG1rSHhnWG81OHVMclM3ZXNocEpaWVhxNHhEaUk2LzRH?=
 =?utf-8?B?NzFwZjJ6WVAxaTFrL3VGOW83UUlsYW9md3h6elIzR0RURUsyTGpvZXdzOHNl?=
 =?utf-8?B?SU9RZ09WNTlxWFV0YlAxMjRuMGRMNjBVOUVwTGZOU1JYcHB1ZU9TMEFnVU11?=
 =?utf-8?B?cUtrd2QvbnIwQjRoSUplZlAyVUVtemViaXFzVG1BR1BJd2ovS3RLRHIxeXI0?=
 =?utf-8?B?R2paVVVWUTViOXprSWFEM2ZxcUt5RWkwd0FkVnJ6YWJCdUF2clY2NGNlR1hN?=
 =?utf-8?B?KzdsVmlGOVVUcGt1UXpuL3pjQnBYZmZmdE1TeFRXbEcyRjNRQ1NJR2RUM2tH?=
 =?utf-8?B?Y3lZV2FIaG1kVWtLVkRBb2dFSnMyUm1vVFpqTHZtZjEzWTd6Y29iNUxEQjhK?=
 =?utf-8?B?NXVnYnp0Zjd4MUpFQk5pK1lWTWFjbjJwYytRV1BTbWx1Wm9TNU9nT1o0WTBl?=
 =?utf-8?B?RlIyc2pzNXh2V1dZQ1h0N3gwZjl2SXdyZnk1b1FJM3lLVjdFeTREVmdMdkp0?=
 =?utf-8?B?dXBJOEZWeXJrNmJFSHI0U0h5elErS3EzbXBqVjN6NGNpSmY1djAvN2ZuUUVK?=
 =?utf-8?B?aWNVd1d0bmJ1V3FPWWFzaDhaWkppeFFhNXF5SWhsYVNlcFBGeHJWcUpBQVJD?=
 =?utf-8?B?cHdvR2JZcnhoT0piL2l3eWdJRHNaTHJyZ0lxZ2o3UDZMakRBcEN1bWFFNXRD?=
 =?utf-8?B?L3pJMWpacExCdTBDOVN4UG5lYkMwdzJDQlYvVDBIOGlzNkduajRlMVZCVW14?=
 =?utf-8?Q?ZD7hkTlD2NWV0mDI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85785e9f-0a69-47e2-2434-08de80357455
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:47:01.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5b/vHqYtOl6hvUIRe8IgzfXCLwaTSwSo60G/aprN18LOtrvYYQAM2/RNDQ82d+O88XUwjw1s/ELrNGz6qS6IuMVQJwzBc4zcRJXpGovosk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071

On 3/11/2026 10:11 AM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add device tree support for the NXP S32N79 automotive SoC [1].
> 
> The S32N79 features eight Arm Cortex-A78AE cores organized in four
> dual-core clusters, with a three-level cache hierarchy (L1/L2 per core,
> L3 per dual-core cluster) and 32GB of DRAM memory. It includes an SMMUv3
> for IOMMU functionality.
> 
> On S32N79 SoC, peripherals are organized into subsystems, such as:
> - CIS (Coherent Interconnect Subsystem)
> - COSS (Connectivity Subsystem)
> - FSS (Foundation Subsystem)
> 
> This initial support includes basic peripherals:
> - GICv3, SMMUv3 from CIS Subsystem
> - PL011 UARTs and IRQ steering controller from COSS Subsystem
> - uSDHC from FSS Subsystem
> 
> Clock and Pin multiplexing settings for the chip are managed over SCMI.
> 
> [1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
> Co-developed-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/s32n79.dtsi | 362 ++++++++++++++++++++++
>   1 file changed, 362 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi
> 

Hello Frank,

Sorry for reaching out again. Did you have a change to look at the
latest dtsi & dts patches from V6 ? I've addressed your previous
comments. Are they acceptable in the current state ?

Best Regards,
Ciprian

> diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
> new file mode 100644
> index 000000000000..94ab58783fdc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * NXP S32N79 SoC
> + *
> + * Copyright 2026 NXP
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cis-bus {
> +		compatible = "simple-bus";
> +		ranges = <0x4f200000 0x0 0x4f200000 0xc00000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		gic: interrupt-controller@4f200000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x4f200000 0x10000>, /* GIC Dist */
> +			      <0x4f260000 0x100000>;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			/* GICR (RD_base + SGI_base) */
> +			ranges;
> +
> +			its: msi-controller@4f240000 {
> +				compatible = "arm,gic-v3-its";
> +				reg = <0x4f240000 0x20000>;
> +				#msi-cells = <1>;
> +				msi-controller;
> +			};
> +		};
> +
> +		smmu: iommu@4fc00000 {
> +			compatible = "arm,smmu-v3";
> +			reg = <0x4fc00000 0x200000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> +			#iommu-cells = <1>;
> +			dma-coherent;
> +			status = "disabled";
> +		};
> +	};
> +
> +	coss-bus {
> +		compatible = "simple-bus";
> +		ranges = <0x4a000000 0x0 0x4a000000 0xff0000>,
> +			 <0x4e000000 0x0 0x4e000000 0x1000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		uart0: serial@4a030000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x4a030000 0x1000>;
> +			interrupt-parent = <&irqsteer_coss>;
> +			interrupts = <264>;
> +			clocks = <&clks 0x9a>, <&clks 0x9a>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@4a060000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x4a060000 0x1000>;
> +			interrupt-parent = <&irqsteer_coss>;
> +			interrupts = <269>;
> +			clocks = <&clks 0x9a>, <&clks 0x9a>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@4aa30000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x4aa30000 0x1000>;
> +			interrupt-parent = <&irqsteer_coss>;
> +			interrupts = <270>;
> +			clocks = <&clks 0x9a>, <&clks 0x9a>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart7: serial@4aa40000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x4aa40000 0x1000>;
> +			interrupt-parent = <&irqsteer_coss>;
> +			interrupts = <271>;
> +			clocks = <&clks 0x9a>, <&clks 0x9a>;
> +			clock-names = "uartclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		irqsteer_coss: interrupt-controller@4ed00000 {
> +			compatible = "nxp,s32n79-irqsteer";
> +			reg = <0x4ed00000 0x10000>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 0x9a>;
> +			clock-names = "ipg";
> +			fsl,channel = <0>;
> +			fsl,num-irqs = <512>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +			};
> +
> +			cluster3 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-size = <524288>;
> +			cache-unified;
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-size = <524288>;
> +			cache-unified;
> +			next-level-cache = <&l3_1>;
> +		};
> +
> +		l2_2: l2-cache2 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-size = <524288>;
> +			cache-unified;
> +			next-level-cache = <&l3_2>;
> +		};
> +
> +		l2_3: l2-cache3 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-size = <524288>;
> +			cache-unified;
> +			next-level-cache = <&l3_3>;
> +		};
> +
> +		l3_0: l3-cache0 {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-size = <1048576>;
> +			cache-unified;
> +		};
> +
> +		l3_1: l3-cache1 {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-size = <1048576>;
> +			cache-unified;
> +		};
> +
> +		l3_2: l3-cache2 {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-size = <1048576>;
> +			cache-unified;
> +		};
> +
> +		l3_3: l3-cache3 {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-size = <1048576>;
> +			cache-unified;
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +		};
> +
> +		cpu2: cpu@10000 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x10000>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_1>;
> +		};
> +
> +		cpu3: cpu@10100 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x10100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_1>;
> +		};
> +
> +		cpu4: cpu@20000 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x20000>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_2>;
> +		};
> +
> +		cpu5: cpu@20100 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x20100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_2>;
> +		};
> +
> +		cpu6: cpu@30000 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x30000>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_3>;
> +		};
> +
> +		cpu7: cpu@30100 {
> +			compatible = "arm,cortex-a78ae";
> +			reg = <0x30100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_3>;
> +		};
> +	};
> +
> +	firmware {
> +		psci {
> +			compatible = "arm,psci-1.0";
> +			method = "smc";
> +		};
> +
> +		scmi: scmi {
> +			compatible = "arm,scmi-smc";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			shmem = <&scmi_shbuf>;
> +			arm,smc-id = <0xc20000fe>;
> +			status = "okay";
> +
> +			clks: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +
> +	fss-bus {
> +		compatible = "simple-bus";
> +		ranges = <0x5b490000 0x0 0x5b490000 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		usdhc0: mmc@5b490000 {
> +			compatible = "nxp,s32n79-usdhc";
> +			reg = <0x5b490000 0x1000>;
> +			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 0x58>, <&clks 0x50>, <&clks 0x5f>;
> +			clock-names = "ipg", "ahb", "per";
> +			bus-width = <8>;
> +			status = "disabled";
> +		};
> +	};
> +
> +	pmu: pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};

