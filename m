Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E726ED4A
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 01:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936778; cv=fail; b=QC4yLVdiixMKyIW0ZjvDi43jJrSRBx0GK4IRpqjfoKA/0qspbpZRjq5kx7EfCg5QKV28ZlBC2q8lqaprNUQDFW+1iGx3gf47NTH2hy+Mq3yJbXlUPhsCmwVlOmJFK9USt7UAtNi3G+C84d9LSsO3Tvcrwgqvg1DUNdvKMfBrQR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936778; c=relaxed/simple;
	bh=5Y/Zx7Ye+z3UkUAyRZORKhV+ohWPiv+x4WhIhTHbu5s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z2cdkP1H9JAq/UmUT0DpnVkEs1hrUKKooNaJoD1MnoZVLSv5maRFDY58mYQmYmdVKJBvQP3SeR6CmcdVoA8gIKa/3ZAXytNp9KJXIoJ8Of0DEltf1f/S5/5Tp0OR9q1H7XuDyocYMbI0YmY2MSTHg4ubpzgSc8CiVKzJOT5wAS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kY6mZPP5; arc=fail smtp.client-ip=52.101.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kY6mZPP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCDCnfCdnd7nwsL1KTHKPT2ifAKWij8iH8NaV0OC4uqflL7R7bJ/I/WU5ZgTgbf9hFi2S2aJxJ9y29PSRgAImXwae9heRHlMHRL+30V1chei/uteyFZ2ahwJPnnfi/wGIhCbN9Y7TUtPlyu17S7dOqLlm8Z/v/qjn+xR8mHnaEKw7zMwDLQMgg/1nBWbvmyqeG+aG3GpEWouEjc2GgDHKAuiAoor7FeW+qNB6z30H7diFJolnP/Px4jxI0qPmooe1L+N27QkShl4YOkWk1QSqdx5quGZz5ikdRbg4WrFIysTlbquzRQ8K+2SIGXzemSazGdi1T39gDcAdZUv/BGmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP4smW54yMoZBCN6Ka+RNK7R5G89rUAzU1ac2NggJm4=;
 b=cpW/DFd9ti4McCF8VcGsWhucjhpFTIK4aDxvJdcfrLae/RNfr7FBLIiQwPLgRrwzpbTeBE4sBWik23AWh9RRBN3/Ec4Xq4Kwg/TU91tP4TQjVxDQz9HnKlvCuSLPOQtMv/axJ8P4ZPu4+hWKXAu6pSa+W68qDEdqUcaZier504OMcDydVO/zXUccpoAEMGpuHRhWV/x5kgbjWEelavt0ASokXUfIx6aAYnm2N41WmOQ5E8gFiu78LvQKlmBj9Wu4n2DKOm9F3P6TRoKj7uyfArxayMNAL7Vl/ylYlM2nOsHEut6e1+rerygkvT37Z5bTSCL+8JmCSahbClIa0oSp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP4smW54yMoZBCN6Ka+RNK7R5G89rUAzU1ac2NggJm4=;
 b=kY6mZPP56hw+h/W0t70hRPRElnypzMyVQRw3aL+RRbADO0pGkfSl3NeZhw1iIMpARWTf02vr47pATwXtkDNXY1i+xyli28pStN6xHxioTVwL/E8Qj8smjLQPyATfgNIK7osuSWv60s9bDCgAJzFnBv51HXIYnRjTjcBy1KInMf1UFp0kpijmHVlX/1HTpIfrjhWDXGOC4bkt1dbDr9cyFsUBr7V8Hq8s9Zg0qBgODfA9tB6TvlBEEX7zoe2TpIV6fGkhzqk67KqgCHS+3h0OWev+nFfHicDGN+cTWF8dI7jUSqULoMT+bqIkrNbcg8S16VEC3PhEIO7rSiRCyILl/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 01:59:28 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:59:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 09:58:28 +0800
Subject: [PATCH 3/3] arm64: dts: freescale: Add i.MX952 EVK basic device
 tree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx952-v1-v1-3-a55a7fe2df0b@nxp.com>
References: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
In-Reply-To: <20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eddb534-b206-4bf4-2921-08de3d0fe8d6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFlalMxK09OMGY3dHEzSjF2M1lwdURCVEJ4eTYzSmRTSTlvbDlGRWNjS0Q1?=
 =?utf-8?B?SHk1RUxFYXpMSFdRekgxZmVHTEhhUTNUZUZWVXYwZ0MwRUt1cWJTYU92U3Qr?=
 =?utf-8?B?S2pwNHhkdnU4UWY3NG5RTHFyVjhTUmlpVHJvSVhtQ3E2RzlKNHcwc1U0VG4w?=
 =?utf-8?B?bkZCYi9jNk5FQ0xFUlVIZFVoayt3cXFzSmtpU1pwMTEvN1BadWNBU0VWeTBs?=
 =?utf-8?B?UHllSnAySzAwNHo4UVJCdzVIeGFGdXBha2RsTUUyVXJYaHBNZUNFMUo0bGI0?=
 =?utf-8?B?K3MyalE0dkx0aVMxQ1NxaXVRK2s3MCt0bWE3MkZ5RGNkOVRxeTQ4SERlN2c4?=
 =?utf-8?B?Y2k0MHRVQy82OWdVblhHc3JGdDhCMGhBNVhDZFFodGNmL0h0eUZ1citIWGU3?=
 =?utf-8?B?VVhKcDhURTVJQmJrRkhNNWpKUElMb2N2cTVHaHJiS0dtVkdzcUNFZGJVUndt?=
 =?utf-8?B?REk2dnFhaW9EaUg1SGw1ZEREY3FydEUyQVEzZDlPWE5jOUh5RlBYRFR0Z05z?=
 =?utf-8?B?d3RNdXZJYVNYWmxEQWs4OFlUaUhaRHU3aGJrYTlKZGFVNXhMaElvQWR5UjZT?=
 =?utf-8?B?NnlzUFN0WDE0WTRGeWR0RWg4VlQ0ZVJkai9XY204bFloTmFKSHM0Rmx5alR1?=
 =?utf-8?B?SDIwdGJzbXRyZUZ0Zmx6d24rVTJoSFAvRkxpaCtlK0g3NTZtRmVPOUpFVHlJ?=
 =?utf-8?B?dW4vTUlCR2hoV2FES0Q2dS9JcmlOb240Ny9NWWExUEFKRzc0Zk9mcVJweG5h?=
 =?utf-8?B?dmlGZnZXNVNHZWIrQ0dMMFRXVmdpT0ZHaHpqOWtnRGJ4ZUY3eXAxVHhyVGh6?=
 =?utf-8?B?MkVkVVFwTVE4UHRYMk1JZUUrUDRIYU81RFI1UTdFNS9jdzNQTm9keEkrWWVx?=
 =?utf-8?B?ZjQyQUpIMjdKY29mVTlnUDNickFYcHEvbUorZk1sQ01uVURIcGdCMVJQdFhz?=
 =?utf-8?B?MFBjR2VyWEJMY1NYQlJYMHB5eitML25CMUJLeVhxZmR1eWgzeklIZENEODVh?=
 =?utf-8?B?UDBxU3krM1ZLSEM2dlZUazlVTkttSnpQb3B2cVdzTFRtOEJGeDJpMUJyRUs5?=
 =?utf-8?B?ZTdvVkdSRmpYNnU1c0ZxRENDL0tkTml0ejBsMjdkZk0rUDlkMXA2WTU3RmJI?=
 =?utf-8?B?VVNYNXYyUEU5U2VUc1ltYUVtYmc0YWNxU29BWVRhNFRkc1dlNXUwMkFkY3BN?=
 =?utf-8?B?T1BVU2tkUTBEamNaMExndjd4TkpQMFFVWGRrNitGRlJKbTRFVDFpRXdidzZF?=
 =?utf-8?B?Sk5zSUtCWmlaYjA3blpKM3I1ajBxUE1UYW5weDExUnBEWEtFdWlJdnNTUk5r?=
 =?utf-8?B?ZHB1TCt4bi90Ky91TmluUHMzVldQUERPMUtIbDZTMmRUWFc1LzRQdGYxdjhs?=
 =?utf-8?B?djhxTjdoV1crSDZFa1F0RnNNNmppbDhEZ0Z6VmRTdnlVOTRtWE56UEhPUUl5?=
 =?utf-8?B?TWt0cFJiR3J6bGdGZHljMVFOZi82QlJIRmJ5a0NON1dzMHlyYVRMR3l0eXJK?=
 =?utf-8?B?bU1KMERweUZTbi9DNnZKM1A4OXhSWXk1RWNFNnlRUXJvUVZ4TkVWQ3FCVWl1?=
 =?utf-8?B?Q215dTZxR3dod1BQMGNrQVJEWWs3SThId1kwWitHVDhzYUVSTHpoeGFCMjdB?=
 =?utf-8?B?QjR5WVJ1T3YvV0ZsRE9Wd1FPc3FqQndELy9RNVhRNzRGRVVMZlQ3L2daNnJH?=
 =?utf-8?B?d1VqZEN0c0VXVllNUEN5NkNmVjlFMlpuTjJ5blFHTDJEMWd4QnZzdVRuelNC?=
 =?utf-8?B?Smtac1hzbDRVSkVBWnpNcFI0b1lGTm1YQmpZNFQrR3VuRGVCZVAwbEJXdDhl?=
 =?utf-8?B?aGlwWHhKSTFTOFdLOWhEa2JxZFBkWDc5ekd5ZjVqYzNpRExEUktXenN4NUxv?=
 =?utf-8?B?NDRTVHVEM0N6ZE4xcnVRcUY5bVNHcUVMNk1lbVpwekVZUVhpQzducGFDdGxD?=
 =?utf-8?B?UDBkTkNjZmk3anZiZHd4WW1LRE1EYWFtaVVUVjlpMzl2a1U2cGxYejBEY3ZG?=
 =?utf-8?B?b2lIN1hjSFJUeGhObnowRGE4OUpQY00xVmc2SDFJVC8vUlpQeVRobWFhRVFs?=
 =?utf-8?Q?ktPBhh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRnZ1NqUnlkbkhsMVdDNXdYbUtyVHFXSENKRUVWaXN6WTR5ZUs2T0h1M0NF?=
 =?utf-8?B?ZzBraUhoZTQ0RW5lcWFSYnB2Rm5hWmlEY0VxbW1paS9xTG1JK3hwTkg5QURy?=
 =?utf-8?B?ZHhKV3VyZHJXRTVIUGVSUDN4c0V3SUlYNmNxVElsUVd1K3VmRm1MTWFXZGpO?=
 =?utf-8?B?NGN4M0wwM0VRRWVJdnlNT0FmNjBkTTAzNGZ6dzN0bFNmdlhZQkdueng2b3RT?=
 =?utf-8?B?eHFSNUg4UGlqM2lNTmNOUEswaWZGejZtOWc3VVF6bEovQzAvL0VPWDRYU1JH?=
 =?utf-8?B?QXE1c1RSNm0vVlhGU1hHOERUbkUzL2g2Si95NlJMaHhibkk3SlZvMWZnUXAx?=
 =?utf-8?B?b2s1Sk5YcXFuMy94WDNtd1ZPZ3hRQVptTGlPU1VEQUY0S0M0T1Jia0dtTzhy?=
 =?utf-8?B?UTNOeDd0dGJRL2xmbGVnTzQ3VUhEQkx6WjBRMTJlVUx2SC9UMm13RWRMaE1M?=
 =?utf-8?B?Q3Q0d3RyZ1l5L2l5aU5xY2Mrb2F5ZVpBODhacDNPeTd5eUNoZHFzc2NmeWYx?=
 =?utf-8?B?RXphYk1Ta3dveWFGdGNFMzZFMCs3UklpbVMrRWFIV3NZRGR0WFJKY1dXUXNt?=
 =?utf-8?B?YTB5R0NQckErTkpscnJNeENDSXRLQ1Axa3drQTZvU3AwdHhzYWpwRmhmOVpa?=
 =?utf-8?B?ZW1ORFQwQXh1SG1DdjVCNnNWR2QyVGxFUEpQZkVadHYyb290L2RudnZmNmFL?=
 =?utf-8?B?NEQyUkwxNVczeG5QUXFUZnhZRlRjQzRmelJaclQ2RGpuNHJpUk15YnZyRXBW?=
 =?utf-8?B?NWhRbDdOTUJ5dFVPbGRBanBURnVsbDhoODRDTUFRZEtjU1Q4V3d4VDl0UndZ?=
 =?utf-8?B?SXpiaTBkM05LNFNDTzd5RHdQd2NYemE0b1FYUnNCYjJYaktKK3BuaGFWZ2pu?=
 =?utf-8?B?cVFicWs1T1B1SkZFZUJ1V3ZSUjFFbHlVazNkckxYaHNQRjF0V1hXT0FWckhE?=
 =?utf-8?B?by9NK0g5anY2MEtZK2gyVGc0bWFhbEVqYXVyWjRWWDJ2bXhYdVlZZFlWVWlx?=
 =?utf-8?B?N05RdHF5OHBBRC8wSDgwRDRWNGoxcUgwOWdLQ2JWSWwxaG5tdDViQ2krVmpZ?=
 =?utf-8?B?SENqVVZxUWsrMFZrcWtqZDVUL0I4QTlqZTltOTIrR3J5bk9CUjhwL21TaXBn?=
 =?utf-8?B?aDVlQXJ0Mis3cUE5QWtJU0gvKzdiSjJON1h3Vi9ZOEphTXZvbFJDZEp5WHVy?=
 =?utf-8?B?LzM3TTZLWW1kNWpiZWpodWo2QmxIVlh2TmJWL3RORWpMWmVPYmo4T3h4ZU5w?=
 =?utf-8?B?UjN6eEdkMUs3bzdrYXY3Y0pTakg5R1VTclVBNlBGdXFkK25yd1FIQTZJdnFz?=
 =?utf-8?B?TnFMdi9kZS9hWWVDWmpDcUpUMEIvRlVDWmRMa2pDaVFMVFJWT0xLVUZpZnVh?=
 =?utf-8?B?cTllUVUrWWdObENzazViQnZORGZoaG9xS0FZS2ZmM3BUaGlKblBaU2lFTzIv?=
 =?utf-8?B?eDhTQ0hicE1RSklNYlU2cTFlMG5LMHFjUlQ4b0hhS2VQOUYwUXhDQjZjMkhC?=
 =?utf-8?B?TDNSR3VEVnhXWFBWeXM3Z0IveVJnUGpJMHdUcUJUMkc1MVN0YTVPWWZBSjF1?=
 =?utf-8?B?SXBmQ2tzbmZ2TEh1bDRid1VSUmUzaGp2a0RRSmdqMG5EbFQ5TWRXQStEQmRk?=
 =?utf-8?B?RzVFNEZnMUNZZUdsaTBtTUs5d1pVczlLTXF0WE5yYXJCVmNiTHJuNk9SSUZV?=
 =?utf-8?B?eFE3YTNLS0QrVFNGY3VhcjV3ME1sZ3NDandnZmY3a2VlNVd2K1hwVWRHM2Rj?=
 =?utf-8?B?dUpzU2VidGJMaEV0aTlPNnlMVjRXaW5jekpMR09pVDJmdCsxMnJyR3d5TlZM?=
 =?utf-8?B?cEVHRXZxSk5TbUJBT010NzFYWHFGRG1TMUJQeUx2UlNmeE9VKzBieUpCUk0r?=
 =?utf-8?B?MVZBeVB0eld2dU03dWc5azR4TmFWTnpFNE51cDJhZUpRbEpMMFFJc29SSUJk?=
 =?utf-8?B?MDZPbFZLR3FkQTR5ci9EcDRkV3dPYkFFMXN3T0o0OGlqVHNQQUR4WktkSE0r?=
 =?utf-8?B?OUw3MFRocjBEUjlnd3BuMW5WaGVZMHpiUmVtaStmZEc1Z2Myak9nbGhlWnNl?=
 =?utf-8?B?OTgrZ3dYaGxlZUZFYXNXajlVT01HVW81NmtpSUllaXpFU0tGckQvWXc2YmFj?=
 =?utf-8?Q?1mmjIn44JPBhMbwB1XkwotiZ5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eddb534-b206-4bf4-2921-08de3d0fe8d6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:59:27.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGSCYMBChuyI2/Hmoo6oQRiVSZj6/DDtqwGLiURn6k+j8t6OrY4l1b1n70RfiqfG6IovkUoFfckxHVcCv63RLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

From: Peng Fan <peng.fan@nxp.com>

Add i.MX952 EVK basic device tree, with UART1, SDHC[1,2] supported.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   2 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 217 +++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..05d8ccd89186478ad4310f56a02783b51034f839 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -414,6 +414,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
new file mode 100644
index 0000000000000000000000000000000000000000..2c753fcbae3c5d545f5d835bd70492667061d626
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx952.dtsi"
+
+/ {
+	model = "NXP i.MX952 EVK board";
+	compatible = "fsl,imx952-evk", "fsl,imx952";
+
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+	};
+};
+
+&lpuart1 {
+	/* console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX952_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX952_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x138e
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x138e
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x138e
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x138e
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x138e
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x138e
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x138e
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x138e
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x138e
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x138e
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x138e
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x138e
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x138e
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x138e
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x138e
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x138e
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x138e
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x138e
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x15fe
+			IMX952_PAD_SD1_CMD__WAKEUPMIX_TOP_USDHC1_CMD		0x13fe
+			IMX952_PAD_SD1_DATA0__WAKEUPMIX_TOP_USDHC1_DATA0	0x13fe
+			IMX952_PAD_SD1_DATA1__WAKEUPMIX_TOP_USDHC1_DATA1	0x13fe
+			IMX952_PAD_SD1_DATA2__WAKEUPMIX_TOP_USDHC1_DATA2	0x13fe
+			IMX952_PAD_SD1_DATA3__WAKEUPMIX_TOP_USDHC1_DATA3	0x13fe
+			IMX952_PAD_SD1_DATA4__WAKEUPMIX_TOP_USDHC1_DATA4	0x13fe
+			IMX952_PAD_SD1_DATA5__WAKEUPMIX_TOP_USDHC1_DATA5	0x13fe
+			IMX952_PAD_SD1_DATA6__WAKEUPMIX_TOP_USDHC1_DATA6	0x13fe
+			IMX952_PAD_SD1_DATA7__WAKEUPMIX_TOP_USDHC1_DATA7	0x13fe
+			IMX952_PAD_SD1_STROBE__WAKEUPMIX_TOP_USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CLK__WAKEUPMIX_TOP_USDHC2_CLK		0x158e
+			IMX952_PAD_SD2_CMD__WAKEUPMIX_TOP_USDHC2_CMD		0x138e
+			IMX952_PAD_SD2_DATA0__WAKEUPMIX_TOP_USDHC2_DATA0	0x138e
+			IMX952_PAD_SD2_DATA1__WAKEUPMIX_TOP_USDHC2_DATA1	0x138e
+			IMX952_PAD_SD2_DATA2__WAKEUPMIX_TOP_USDHC2_DATA2	0x138e
+			IMX952_PAD_SD2_DATA3__WAKEUPMIX_TOP_USDHC2_DATA3	0x138e
+			IMX952_PAD_SD2_VSELECT__WAKEUPMIX_TOP_USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX952_PAD_SD2_CD_B__WAKEUPMIX_TOP_GPIO3_IO_0		0x31e
+		>;
+	};
+};

-- 
2.37.1

