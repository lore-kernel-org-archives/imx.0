Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE25363C72
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419857; cv=fail; b=UN6npKZT97OcFsVNM02R2GW7ysons51MB8gavsCp8p9AE/ihBufEPtVWQpxFA7e3ObuMnaRk5FX6WOO5ph/qXPLnCUOSMsHbbatx6nfkGErFDh9Op92ZcRJO0mFvixf182ZxJrTDvfcWll6iFMtUxqBkVgSOO9UshdLHDvDzWMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419857; c=relaxed/simple;
	bh=6iHR2bfih9LZAG5WqxneebawLRpvYt/q50l8EDeSRtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=omIWdLOvg9brWG55J93ZeKGJg5Mx3qYr5O8W/EtphaQ3cE7OhGSOUh820/m2sy1bEJdTX0pOZmNZs/xDTGpEmSbvvJLSIRLHzoUjAnNdWf/Im+rRMqITFZ//DGHUyqFjsP64+BsovLWtXdHq4ms+KSjSMWDeVbUCjcrjRDovHmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NuVkm0GC; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NuVkm0GC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMwJN8F5SwUf/CrR3nTf5aWpiQnIPh0qXNrOnOFlir6BqnoOM+JW642gJNyIdqMjHnBQ/TDXogB5amXV9qi++HZSkNwVorJ22cAysbuzPe/isZnDAMDG97EIe712jUtecvxAcveikSPkYOCIJcXjEZlJ1VkO5pJpv+s1GVnOJ5bBNoOXAxnGZ6E7ykUkKX0n8JY3PObzbvRgyhynz+dtzfpU91UIRBWSD9T+GVZ5OZ/XwFXGdXegniXCVpk3vXFa+LJWOmNGVAW6oPEZ8//YxFtrMTQJDE7Tdpy1CSYIWVzaCQ5XdGcXbBAAT4VbeJsM5RB1znqcfCZINf+cfo1UjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IILWd9UZQBuMVznqlI+VceGF/DfhgdPFw5lpNhmf86o=;
 b=p7oJnEe0tdN1Liiar7A6x2D8z7mjz6VL5JR1ykxdB2WQHZ/zGPwFXiD/Llu3kwCcyIgLW8VlPj9LEKYnvqVUQxCNg4VkbuUI9ydjzq0W9mdo27uxLMxGjCEXQBqu5uAs3OwozjYWPwu2hBbyE/p7T2RmG+cwjyD3m7bHx4F/bOehGj5fOVtsltJGvjN56zUXmXBoe+1Afv88GFu3JxSK7BFydxqMOOgBqn5AhuZkekm4w7OA4HoAyw52sfdud25vMbAUazVk5HQdzvY3bqlSE/xau/m724j8VcEBFfBR1pRbvKuEuL0tV/AD2nWqA954z7J7Og/r8JNDtWvn7Ow9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IILWd9UZQBuMVznqlI+VceGF/DfhgdPFw5lpNhmf86o=;
 b=NuVkm0GCWwcZPZmER6QnPtyC8RKPJ7VoqLXnBQX0CnOi+9thVOOFId1uUqPZze7w2X+Dswz+oS/xlaCIiBidOoiQAG36IGRtXreWDBjFQ00O8xKR+RI23x+17mUjzr8697fJLiOAUlnZK6dvCItdjIuItXrnBd92tIjBhYWtZCWq3XA0N2TkPtlJ7uzY/KJcLLct3rsXRLvEFIKIyGdRpx73Z6jeMJS6FR5SydeXYS96+Uyz41H6z3k5yNBqHz09xNa8/gO4oRPRBPJh48fYncE/x5p/tEdnGugkav7xR1m+QS5BE92YlX+qXKFU8FS3YJmqxrpDOnUfg3Tx5Z68Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9703.eurprd04.prod.outlook.com (2603:10a6:10:302::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 16:37:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:37:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
 Eric Chanudet <echanude@redhat.com>
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Subject: Re: (subset) [PATCH v6 0/5] arm64: Add initial support for NXP
 S32N79 SoC
Message-Id: <177341984573.125057.1781471017875719268.b4-ty@nxp.com>
Date: Fri, 13 Mar 2026 12:37:25 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: d26531f1-14cd-4d8d-d94d-08de811ecfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	pvraSr+DxXu993UbtcnYqfMlEvXFDsr/+si5KJcSHLYdN6EGpPU5HiRJzTtysiPi+TMj5Pzd5yyQz+fY8A+KDNtar0pd1zol01DjlknEIRjUq014cEj81hmp/C1HCK52nRVGQnfMgNU04FnbxB3vTqzK9qZmS0rWnanyyWTzIrXye0myYPf20uj/ZzTVQOhPzmHwQDU/k117xnLVXCs3g13GOlppF4mrPTJMlriwfoalZO5/9cvyrlFWPDBor0q0FiDMheuU0rd+pC+aYN6U9F+oDazbeJvrKq3BwqCVEx9B+4H5xeG9raZmqNoYyS/gbnlPM3ScZz8myty6TMmtUNm0AnwWFnKJyWuB7V6ZQsldpuBGHSrs5iU89E2tdjSXyQMpBVuf1mJx+fmmGoCUqtH9ACBWDSVtM7WMljQundPp4tTNCZgayIpxu/CNTeE7cF1+1OPXoilrff7YNmOb7Mc+fSNdrFJyMcEFzGx3tqY3nif0Y+Gt33zFlsJSCM3msL16fB+B8kmNOVqGdRGt50F/fzmfJOVBjvf3KEt5ztXC5GnsJRSszpWHDsHK7980MNkt0xuDWlLEagVYJYn6QTwLozndO/rM2ZZHIxqatJLGKtWdLzVDJtnZ1Y2fGodxqbZEds5TxafcgUyAMoLGie9ms3i0uw/uzZZWwRRdCIZjS+pmDQA5gSrqs8bULQhkCe61hhEGKFkkbAs0jEvWDg5kEQ+LJ5a8hSG1ke4rQ3zJQbLrSMthvWio4ZXrqNtpeDMfzqB0mMWKTaN2PgXmZAXMSMUWIZnLurowJujY68M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZtMjdVdHZwaThVRGVBRmhsclg1blNpSHFxVnNEZmJYY1dKeXRqQ0N4MVky?=
 =?utf-8?B?REtxc1ZabW9HeGh5L1JpRFczU0E4QWl2VXVBeHZoT1ZxTkdBdXRkYURQa012?=
 =?utf-8?B?U1hmQnZ3Zk9zWTQvSDZBNjJnTGRXQk53amFqMHZDM0RLWFc5VXpsNXVhK2J0?=
 =?utf-8?B?bG8xeVdpYkZnU2dNRStsMHhCQ3BhbUN5Sk5NZ0pxbHZ2NTgvM0tRZGdBZ1pD?=
 =?utf-8?B?YWVDUUV1dGdPa25wc280UnFjejlpRjErOUUvUlFjc3dLN3VJTU9OdGdPK3Y3?=
 =?utf-8?B?VkZ0TlFHM0QybnhoRE9YUTRMZTVuWVdERW9SdVhkQVZ2SElZd0I1TWVSVVdS?=
 =?utf-8?B?L093TWJoQlJGV3dyTXNiYlZKaitxeU9HcnBvem1xMFJOeHpSZERmTm91R05M?=
 =?utf-8?B?Uzdrd0t5N2taOWZxNFNOaGhjNjVYUksxMEJQTmJ4TVlNMEtJM1pHREVOVytW?=
 =?utf-8?B?NHVGeGNiMjJXSzFXSzNyeVhLU2cycU8xRjJqKzJnUWNOc2ZRNEY3QXEwaGJO?=
 =?utf-8?B?ZUtGQ1cvdzg1QlpCaHUxRHB4WGFQYXhOSmIxc3dPM09reHFjVFpuQWNYK2k0?=
 =?utf-8?B?YWloK0lTQjhXREpMVmErUWVWSjNHRS8raGlCRGxLU2tDOXEydjd0Z0RuUDd0?=
 =?utf-8?B?aHRqVHgrWkNPMmpQeEovdWVKWGFOb0d5YTIrV2RtR3NubjF3ZkhoVVQ3MHJT?=
 =?utf-8?B?a1VSUW55TEt6SGxPTVEyOWtHNXNVRlNKT3RlZStHeTUxV3VXRkc5SDB0Ly9r?=
 =?utf-8?B?b295TGQ4SjZCMHd3cjdqakdCUTBuSGRKa1dIc0x5ZVRESDdmM3AzL21oNzJF?=
 =?utf-8?B?a1NrU2tBeDRvd2Z3bkp3QzFqM1FZMEZlaldxbTdVajVqNXVuYTNWUm9mRWF2?=
 =?utf-8?B?cmx4QXlRYVZuRWZwUW83MXc3Zyt4ZXAzYWtxRXdGY3E0ZHczUHYwZFJXR3Z1?=
 =?utf-8?B?aGpJd1U4TWZoZS9FRmNHK3dobVNTU2hUYVdGMXZiYTlHcytKN3Eya3dJV2dq?=
 =?utf-8?B?SS9ZWFI4T1FNeTlHTytJUm5iUjFnRzhZNExOcGpwbTF6T2grMW1lSTJZbHR0?=
 =?utf-8?B?eXRvUTZ0NjRLUlhxODVjc0h4M3lOZkU0MVNxZGczZklTWFk3QTdKcUhnN2FW?=
 =?utf-8?B?VWxXdkFnUmk2UlBtVGVCdkUzOVRMYWxsWVBPeURNZzBWY0dNOGxvdEltY1Vp?=
 =?utf-8?B?VVZhQ05pYy95ckVsaGI0em5heG1YNG9WZ2gwVlc0QTVXZ1hZcTF4YVhXNDlq?=
 =?utf-8?B?WjZZUDB5ekIzVmppVmpVUzhvZUoxSlA0UEZieXI3V3lVMlY4MHNGaHN4YWpT?=
 =?utf-8?B?Y3BHUENid25Gb0YzV1FSVDZaekF3WjBSY3BhdkgveVZnNG4wRlAyeFAxb2hw?=
 =?utf-8?B?MXdTTEVncjVUai9uYmhhM0ZxaUdkdE5FTFlGZk5KMFRSbitLU2dLY3JtbXFF?=
 =?utf-8?B?bE44MFVLSGJFaC9YaGt3cWFoemFxU3NZVnljOWRxZXBkcEZ3ZXFtMndNUXds?=
 =?utf-8?B?SXJWd3hoaUw4TGlBQ3ZmTlViaGlRWmtyNHlTL3dNZ2I3aXYyV0h3Mnh3WlJk?=
 =?utf-8?B?bzBXQktPVVZLeWNYZmJjUytxTjI4VktUU1I3LzlSNVVtclZWQ01ZbW1tbjRv?=
 =?utf-8?B?YzdXWk5FV29oek41ZjRoNnB6cU12ak56eGxHSTF0WVczOXFOb21IbDd6UVp5?=
 =?utf-8?B?elpoM0hGME1rRDNvVWNrdDQrQUhRVUpuTWR4MER3dFp4NDAzeFdzd1hUV1F4?=
 =?utf-8?B?YjdwM2dpUXgwbXJQZFdaeHB4K3Y5clNxLzJ2Rzc4ZnVTSG9wMXg5RUdwMGtv?=
 =?utf-8?B?YVlJeFpxb0gzZ0V4MW42dzIxQmdFS1RnY0V2Nm1JVzZOVzFBR3pKeE5sakNs?=
 =?utf-8?B?V0xMK3AyZXpUYVNrS21CRzdxbXhPQ0RBTVp0YkVVTmtSeUdRbFpYM1h3UHdi?=
 =?utf-8?B?aGFZZVdDWjlnQXdkUGVVaEZEMHFGMlo3QS9ML2xOQ2JkeExtaklsc3ZpYjht?=
 =?utf-8?B?Tk51NEdkSEJTVXl1emdjeDE5aDVJdGQ4ZFhHdGJPRHd5SHNZeVh0VVRLaXZr?=
 =?utf-8?B?NmxFL3ozZHI5NmMvMDE1dWVpL051SktJRTZ5MGpseW5KQXg4UThRc2dlWDVi?=
 =?utf-8?B?ZWNqTzRyc0M4a1RUVy96QXQvY3Z5OGd6Zy8ydFlHVjdpai9uWm9JUXhDeGZO?=
 =?utf-8?B?YzJXZlRqTWk0SFdKZW10cTJaTDNkTHY1S2NYbkdzM2RabmZ6bWRveGdNQ28z?=
 =?utf-8?B?QmxwTVduVzN4bmlTdXVRRFh4ZkJTbU5SY2ZDTThKdU1NbCt4Zk9SM1VDeXdG?=
 =?utf-8?B?M0tKVnZJZHJpMEFET0xIR2JYenBXT1Q4Q2kwTlNBTjV6Y2pmdmRhUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26531f1-14cd-4d8d-d94d-08de811ecfef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:37:27.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAQJBR/W6KyDvKBB+uh4d+GLKep2cu9miqkY+VH/G2CRnorM+gWSjLxyYT2b1yYaNC58nO7BKjfCv69fRjamSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9703


On Wed, 11 Mar 2026 09:11:49 +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This series introduces initial device tree support for the NXP S32N79
> automotive SoC and its Reference Design Board (RDB).
> 
> The S32N79 is an automotive-grade system-on-chip featuring eight Arm
> Cortex-A78AE cores organized in four dual-core clusters. It is designed
> for high-performance networking and gateway applications vehicle
> architectures [1]
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: freescale: Add NXP S32N79 SoC support
      commit: e93e5057d86be6d3212ec6441b97e3af28726dc2
[5/5] arm64: dts: freescale: Add NXP S32N79-RDB board support
      commit: 8c2bd27ac9cc41a68ee526e79850587064b3a074

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

