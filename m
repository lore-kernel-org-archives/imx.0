Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E401E7C18
	for <imx@lists.linux.dev>; Mon,  4 May 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930251; cv=fail; b=muSpKCAq8MBPh5gv53iQ8kdppcoeYvYQOjJ2hIEDS8HGhNNSqoAr4V7IVdSEhG5fmhaYglKvjiKDIO5eZMdGVThrtxAzj8lzguPG8NNE/eIiJOmcD3c6OsMpBGBM3+M78wLHuc3wfDHMrVAVy67yQ2axnFMjkldmUBPqw4/w23U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930251; c=relaxed/simple;
	bh=neDSXQCloJF09EYf6sDg2BoOwX745iP75k/fmFXFIbA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=tBmkxXiKYlyEHo63eTBsyHmpo/jqZC+Y5YPamDJ7HVNpZvc+yS8fjAG64HuA019JFKehcWhD4J++FbukUtPx46wcfkxmjhixtjXJEZp1xuIshMv7U8n0NN1bik4s8KiBjXZpr7ZvYFC3ZggpDv+Z3u5Xf4DJjjE+w3M77sJ6c5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Tndiwd4V; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Tndiwd4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWhNT08EfuV9pJDubzAgOKzodQIJi9s8/80RhL7ZxzVrKMqFJK5HgmGQhlq+afWO9K7jRGwA/Ogifva316yzEjo05Z5d55wbAu9oyOTdTdfdlrTcK4HYn1r8g7yUDvU/NtbpzKdGreT6SS1es0O9tqkuK/BYtDZeZmQX3pv31bQx0m/VO8PHVKp1AMxzNWnNAZkjhIOYea0+ujoDhRtxIH6cX5j0LF5pBOXA8d5VkadPL/4t6wm9PJOvTdlM9B3ixeRGdeKIV8CX9gcnKA7gqE9fXR7lQY3Mjj9lQa5u0r8OMz70ezCTqLRHHK/vkAFVpFkF+WccYiaj6/f7d9jBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR2AA6bJU/RV5ZedeuLJXv7Yee9YYE13pT0jBOjRY0Y=;
 b=gn8oZpX4R/JL7Ah9ynO+i34VwQz8T4lJUWfTsOJzFyf4OH6ilhI6iGqc53npvl6DM+f83je0uBaYSKUt6H3W49DhOycOUL0ba4gNJgaRIilFVuIeNayF4vWrrdGMG4xS5o68tlrenaHAvFEjUNIVkFiJJAVpjh/o7736n5ioyHL46XWVnIg3G6uPyZEV2nUSXw0DutcyHjmPTNVnnSNf5wtbn7QCtERyr9Rm+6SH4E3VfvNawnxCCYbS7XirTMVywa5lebfH9BBLPoIdPWTbVOh5HNLyzWb7ilVH/w6B0EQZZgqFeGZ2OX1S6lJBfJRoLP8pQ5xLqd0KAymysy6mFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR2AA6bJU/RV5ZedeuLJXv7Yee9YYE13pT0jBOjRY0Y=;
 b=Tndiwd4VVu181E0U4lDEla1ILjUNIzUi6hr8WLa6lZDDdl7/9mcpwcuhah4I8atd92F++3d3Z+zOAs7vWH3Xf7FJLz0x6fWuIRx/qtqu/73k4VA4a03YRqJMidJJUoIrgvkAItOBJ8sOPLLCR2RUDNXgsQcjgTrvUdm40cX0rtnMqYjDO39LCzlUtvT6igHHIfBLr4qGJhABDzMIzSJ9y8fGxjGpsVXT4sDrjfnBpCABJ69JN14yPoNRraoOfcoTOYRREgaowT7FjB9rT/hfGqGciJQJl2LomCkjcpLLWgvcJGUF5KCTOJEE6u05j78FztUwuy2j4QeJtaamzSBgbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10618.eurprd04.prod.outlook.com (2603:10a6:800:27d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 21:30:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 21:30:42 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, dario.binacchi@amarulasolutions.com, 
 alexander.stein@ew.tq-group.com, maudspierings@gocontroll.com, 
 josua@solid-run.com, Markus.Niebel@tq-group.com, 
 matthias.schiffer@tq-group.com, primoz.fiser@norik.com, 
 francesco.dolcini@toradex.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260324061556.980621-1-shengjiu.wang@nxp.com>
References: <20260324061556.980621-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] arm64: dts: Add NXP i.MX95 audio board support
Message-Id: <177793023924.2584701.11614675781433236557.b4-ty@nxp.com>
Date: Mon, 04 May 2026 17:30:39 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10618:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e73fbc-6fad-402d-7dcb-08deaa2464ed
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 5R4BQ+EYgSCCTatDCMj7KAD+YI+a5MplabPaBo5nRpKxSFAHfygnf1Wm9BWHNsTEE03hCZKtsPWmut1raLccHaknjnJw6bIAFAQmbxHOFiATo1ZKo61vFpdIev0SeYkbcxDWaIf7So4n7dFbLoU6j8TXDj2Yr0g0LNWrgwx+YMXryoF3xA46EAhdZGYT3P8QshrsZ7qhh4tm/EcQp5usHLzBixEWioY+6DmeSVsm+0THiOMpt9knN9uRiLGkZQT/APEoHu5s1gdgz9DJ+GpqR6UZ3CQCKO/PAGENP2Sz1HAzq7Pjd1OBlCcEy2ZdrfC/ztU1cXMDRv8xpyHjFaC2khSG1xkl3ztXUEdKrNAGcAjEyl9lh3Qvcjlg9ii9WImqwZ9e0GF/wUw5v1/3A0GW72wLbL7PAiXIW7izE+Bp5+XgC84imTu3FVMTzxqbEFHQ2izwJ95pMi/Wlop1xAh7XJCg5bxKWvqS8a5R3lGglnp3cNERjXPgkyRUUTQYiDHKYKYBT1kHJ4eRLXgyaGesvJFC1EfjEVksi0i2qncnwNHuNdtNzvoma9AWkrbVm6g+9RblDvkf/aImya3ZSabGQ+nouJcDe6caRNOIqr2iqzgnL1v3ZF5e338T4lygZtEjX4C2hVRJzM10Gr+rP8Vv/rggMhA3jM5Evw0Xqz8PrG4lYJ7qy6PSfTj43t5+FAD/3v9anvwB0GM/TZfVrFiyYWK/U5HEkrbV7Bp0CwksfigEl0TyNx9Ue/Yx7suDzM46hCdCo/+NZW4OuGxDfYwstA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?R0QxWDRiVnVVTWdEd21pUW9IUWJUdFJQT3lvOFVMSkNqaFZ4bFZsL3JXVGJ5?=
 =?utf-8?B?RW5QVldHL3QzTk9rZnRpbEk5a3VRZmRTaUllc2tSbWZSUTBSZm5DTk93ajJP?=
 =?utf-8?B?TGRrczhCZitjZXNIZ1Juc0UvbHJDUDdhN1FXMVBlNWdFZEJCWEZSL0FVQVRU?=
 =?utf-8?B?UXR6MnZ0U0J3VWFvRkxKWVpZR2lSQzQ5b21hTmUxM1JZM0ZySTNGeEpmVU5D?=
 =?utf-8?B?WlZZcEc4WkpuUVYvZ3FFblZIR1FaM1p3QmU3RUNlK0hhRmFkUlk4L1J2ZGF0?=
 =?utf-8?B?L1YyMndLOXd5emxzNlEraEdubVM0b2ZVSlJYN28vOERNaHhoOVorQWxoY280?=
 =?utf-8?B?TllpbjBuNDNjcG9PYW5iNUNsVlYzRGZYY2ZwZFEzNEpPUUxiYktpQ0FQSTRm?=
 =?utf-8?B?TllhNkhtR2UvendUbzUrVDJNQnVtT1FkZ3FpMUd6amRreDVjTmdnVDY0akJx?=
 =?utf-8?B?c3pxTytZRDhBRG5iVkp4S3p2eTZOZUJURXR3SVFOamprYVdOWVNFM1RZNVdY?=
 =?utf-8?B?TzFaWDdvMVpXd3FmQU1RWlV3ODNUTXBYSTJMbitpaDdXUk94VmxmdDN0MEVi?=
 =?utf-8?B?dHdMYnZ2T2QwU0luQUp0eEJsMkNFZXVEc0IrTktxd3I5MndwV0p5ekhkMGlu?=
 =?utf-8?B?b25MMStVWjVhL1lYQWNIMkg4VHN2WFk2cmRUeVRZMHBvWHRhaEtRMWdSWVVO?=
 =?utf-8?B?U3ZERzEydVBMaFljVDVzOG5oaU9qUXJCQ0dab2pPSDdCOGRONy9VamxBNkNW?=
 =?utf-8?B?THdiSjFiTzBOS2EyN3hwSW5KakZqajlsemJSMWFzalU5eldYUnYwU0FpU3Y4?=
 =?utf-8?B?MVhNRFloaU9nQTZqSlJ5cFE4a1lYbk1sbFAwRERvcGZuNlZCcW55Zk9JbDJI?=
 =?utf-8?B?Z0J3K1lablQ3RlhVZlloMUR0WXlRQUlYc3B3L3NLcnFST21rZHoxS3ZCQ1N0?=
 =?utf-8?B?M0dYdFV3dFA1VnY3MXd4SDFhS2g1dW43dDlld1l2VGsxT2VGaTcwdkpuWGRD?=
 =?utf-8?B?bUo5RzJwNWFOOEtxdTBENVgvdnFCQ0pEa0Qyb0FSc2lEZ0NqRkY5OGNaeGli?=
 =?utf-8?B?b3ZMU0hBV3I2U1B5VkNWMFdUMW9qbXI4TzFZQWVjWlJ1MHZxQlZMVHdobkJ5?=
 =?utf-8?B?QjIwbDBsanUvVHpGVzFFNDRMSGtrclVObkl0Qk52NlBlbTIzbjJ0eXIyMHVq?=
 =?utf-8?B?WGhhVHphQzIwZmtSUjdOZzdYcDkvZ3g4cVlNY2wwVkRYcGRhSlZLM0ZGNXVo?=
 =?utf-8?B?d1B3STZmQ3RlMDhicmJ1YmxnUlpPeGVpK0FSTHU5b1lRVm1qVlpqVVMvZC9X?=
 =?utf-8?B?TkVTUUdUWmExbWJ3bFZtbFk0dWQyem96N2RsUDZhZ0R0V1djTklNSTNpU1ht?=
 =?utf-8?B?d2dHbXZsMmpBYTdMTzlIc0YwY2pxdlpHbTBLd3ZpWlB0cmJ1NzUxNDNySTdo?=
 =?utf-8?B?bjR5MWFSZDh0anZiL0EwVXZyOTcyN05ZTDkwaWRhaUV3OE9URUlpUFlUbTVV?=
 =?utf-8?B?WnhUaHRNeU9vTUNsWVFkWmRUMTJBcnI1R201Z2ltTmFuSndjZ0c4TlFvOVpU?=
 =?utf-8?B?c2tvd3NiM0ZWNGpXMC8yZWtTQm5VL2hKWjZGNGZPdW83WFFmcld5MGltNkpT?=
 =?utf-8?B?ZjFpSVFSR3BQR3gyZTJVV0Q0bE9tUUNIM2x5eS96dndFamtIdTVzK1dIelRC?=
 =?utf-8?B?RjY4MzRFT2lOQWd0VXZvbTlzMUJhclphbldWcGNXMCtwN3BHKzFwb3I3WVZI?=
 =?utf-8?B?NEFaaXN5bnN4ZzFacUt2Nk1LYlcrNlhiS0dyTTd6aXY2cXpnanJlODdUdGhT?=
 =?utf-8?B?bVRoZndJeHNPdWRTV1RlNWw1bHZML2VBdDJDcGtad1RoOWlZd2llVGEwVEd5?=
 =?utf-8?B?M0VkNThjQWFMRE93MmF0RVF1UWk0OGFHL3h4MEViRnd0TUJCYjE0b2dCN2c1?=
 =?utf-8?B?cGdvMUlFOThSaEEwSGhBS1dqVldsRkhqdkRrMVV0bjdxRkJDM24za20yZHFs?=
 =?utf-8?B?eG8xT2FXeFE3TXQyMTBxUGEzUEVtTlNvcHRpbWpDWnNIYjRBelpKMW1KaVI5?=
 =?utf-8?B?Rm1IcEtlbW9ubkhzNmN6dERINWN5Zm9pWDczM2VBaXpmb3RMeVZ6SXhxbFlT?=
 =?utf-8?B?dTFJS0JkaEdzbjRFL0RkRGhaSzVMTlpJTWFsZ2V1WXlpRHpRRTJEbHZnKytt?=
 =?utf-8?B?Zy82ZWFDeFdIaXZwNFNzRDZ3VkxmR25aY244Wk8xMEl2QjBBWVowbWFZSTB4?=
 =?utf-8?B?UXJ1VExPMlcrY1Z5RU9HcHczSkQ5d3pubVhHc1dyS2xnbEtwQUh6RklvZVB3?=
 =?utf-8?Q?QfR1SBbICWsBk00hnJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e73fbc-6fad-402d-7dcb-08deaa2464ed
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 21:30:42.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/IftX0iNSO/BAb5KZ9QlOCpWU3yKvZKb/TzG+HwIbRRhRm76lgbTZQqUNn56Xgkb6TQpjEBrV/czSJNiMfL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10618


On Tue, 24 Mar 2026 14:15:54 +0800, Shengjiu Wang wrote:
> Add NXP i.MX95 15x15 audio board (version 2) compatible string and device
> tree file.
> 
> Shengjiu Wang (2):
>   dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board
>     (version 2)
>   arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board (version 2)
      commit: 990c229608000831f435d5dbad982f710401fda1
[2/2] arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)
      commit: 7b5d318616888360a93cf0830705ce51b5452078

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

