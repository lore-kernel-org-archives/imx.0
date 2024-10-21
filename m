Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15581C9EB9
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729540312; cv=fail; b=DUSqDhMBDlDRg1FplAYSUQOUsuzfkp8ibvX92ZmM93rDrZCNS5iHNSWklwlmSAcGlHRm+aKs2796UqhVL5DJ2IS8NYgWVSPL/1pKtPnoIagGJLV04X6UAmmaHIEtVkFZ/RXtvMbB9qkGQHfsdyaME8bTiGRaYP31FrtUZHqPYG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729540312; c=relaxed/simple;
	bh=xUQMbSrJyrA8A5rQ8BGEYvSap4yqTUgX3OYui2fnTZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qmfsA861ipoMOoJQLGvB2ficN1wjTjetyRpBw++e7MzKQZ490lBt5NBv6WvD6zfVC5cGn8TBGitm+phAtZ8sYhJaUbZSO0IN9cBZx8l9q2QYgoAt6vm4f5A7recxEu+0fHb8eR5eMi/t7v4KlF/yJRHQjpdgR3iBQ3zNSJnaAk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SqX+o/Lx; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SqX+o/Lx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQa+9xy6J7qtm1oXBZuFbLlfoCAld89wg70v83V7eYVBsI9df/Cnft83J2eMRv57IviLkf+TKoNjUStr1UnIZtI3+fApV/49/64MIZJJ3TwVf7tsVGLEUXKXaeHmurm37mV5nkrsU8IAC8Y637E4rvamQFXR3/oBSzb9jeMa58FmyrI7mpWtaFCXmx7NimGJN1e1a8Rn01H81zRUhFHHuPtewnIW56+kzvrcrjm7kDGPUw8P/IF2pog9p3rriEp6gKtTW6+p4zmyyambb6Zvrhxw/r1NTmf3EnO39RA0mmIki+a3uE4lRAobueDnPNykQw6UacGraOUDY+2TfJZKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUQMbSrJyrA8A5rQ8BGEYvSap4yqTUgX3OYui2fnTZg=;
 b=c1AVzX1uLxZHkFHWaKKtsgp1cEGTWWB47LWJ4hWPQxEsORrFh9lzYng7laz7ESnfqWx/bw4Bg0vuDWbmr6eyid64BaALON3wvexl/2bxVcjjdmI5gimlwwXvYqrykgPLNvPWjrJOtzOv41nyGLE1o3F2jUEcDQ792O0OzoErhGIbV0/w8W2P8UImWorZ/1TM89ps7GiM5Ku7i/XFSOx6/KZDwPq+2oftn0igqplG3ixSszn+wEW9dLdmZ4h21Nn1cyBHmFsBJoyeQ6f8h0iZGGMvVjqcpNJ/Yi+Ra19uYULLm0xMq/tKZGkwYo9UG4rrBatUo5QlmquFDvCG9vBt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUQMbSrJyrA8A5rQ8BGEYvSap4yqTUgX3OYui2fnTZg=;
 b=SqX+o/LxAQcQy0gR/zWOsAjaUeid12QzyZpK/iHk/uAt5q365c3gAmqO/uVW93JcUZTBj9h1hIHTO43EuFd1GRQcuKs9UlemUYuQtDn9XfR3DnWKtD0NhOblGg9dTCzQVoLjJojEeeG/5E+bn7j5+xh1soUyWHTGgGGPcgLbjZ20twQudYoKqBROhXkXslhXuI08Sb8vl2HABGyHAdpSS10iyzGKtCBKtS/ZIxS9KE1+xt82TgWczC8wdnQ2KexWZSUx1OpNys83USbjLkTjH6gTUCCLNanwj3kNCP+DCb3D0277o57OusOpqiQI/QInMdTn34Kq0VXAP2Yb3vjYzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7330.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 19:51:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 19:51:43 +0000
Date: Mon, 21 Oct 2024 15:51:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	marcel.ziswiler@toradex.com, imx@lists.linux.dev
Subject: Re: panel-lvds for imx8mm-verdin boards
Message-ID: <ZxawyXcHTJnDJPR4@lizhi-Precision-Tower-5810>
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
 <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
 <CAOMZO5B+sJih9A24-NLUvKQXVkBrvFjf+9Fi2x1CFhRjD8EYsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5B+sJih9A24-NLUvKQXVkBrvFjf+9Fi2x1CFhRjD8EYsA@mail.gmail.com>
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ec9bd0-acb6-4830-100b-08dcf209c9fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bzRTU25taWpoUFFEaE9xNnR4MjdRZmFjbU1XRXdGMGMxZEpGK2pGWEVjZTNS?=
 =?utf-8?B?dGkrc3g5dVRvcFBCUjBjKzNneU04WTJBQXg3c3hwV3N5UlkrMXZmV1NzZEg5?=
 =?utf-8?B?aC9pZnJNWXhpckZFOFpaUVF6SGxOS2tHc0NINTJVM3JBZGFIUkgxQ3p1Vngr?=
 =?utf-8?B?b2dyODhCY3dtdWVUZW5EZ3RiaGZQUTRLYnBhOEU2ZVBUblMrQ1JjUlEwVlBw?=
 =?utf-8?B?bGl2aWM4V2pKOUQrLzhkMzhMcklOZFVkVHNhL3BCWnBaWW5zcjZNVmNCZ2d6?=
 =?utf-8?B?RlJzRnhjUTQrZWhKdFZlOERaR0JOc1puTDVSMUV2L0x1TEViQm1vYWdaUjVV?=
 =?utf-8?B?aVlEWUo3b3hFaWpxQTBpZ2NKbnFSbE1UUEZPazBIRldNWEhPTml2SnM3NHk3?=
 =?utf-8?B?TkJicnEvY2RJeGZKUVVIZW9MQWlvejFEcTlYQ25VUSsxVldsdlZyR0tLY3Nh?=
 =?utf-8?B?U2FPQ0YzYmc1a0ZhZHJvTWUrR01oam5PaXZwRnNMQXJuM3lONXhvVEcxWENP?=
 =?utf-8?B?bHF3a0VlQ3F6NExOZ0VmUjNvZVZwclNKZWNCSVVTV1Y5SExCYmJvTEM2SDll?=
 =?utf-8?B?VXgwQWxGcTJ0NmthN1JqbDNzZ01NZTZGbndhYXVBQUVhZnY0bTZnRUpwVG1R?=
 =?utf-8?B?MSsvTzdGYkZwK2c1SFlEbGN4ZVdicHkzdVBLcTl3eVZqdzdyUi82V01oZ2hy?=
 =?utf-8?B?d1ZvNnBZRW1oVk1kV09GWHJVL1hjbis1WVZaM2FlbW1qR0tHa1pQNGhHYkE1?=
 =?utf-8?B?dVpTWXY5TXpmOVErQ3YxQ2JSbWloU1ZJQ0o0QkZXaHJTMWFLUzVHTFJabXdU?=
 =?utf-8?B?T0ZmVUVTZ29PWWpvSXJJcnNNczBneGN3K1E1QlR4RGhoQXp4Sit3YkF3dnpQ?=
 =?utf-8?B?ODFETzRhREZ2azZsZzdsc0NGSHNjVGRkak42MVZrOW5HWTJHYi9iQWZYZkdz?=
 =?utf-8?B?MFdJVmVqNzlEdHA5T0JBMFFnMTgvVjE1YkY5bzByeWhGSVlJWWF2TGNTMHdw?=
 =?utf-8?B?alZHTElkZ2IrdVpkeCtIbUpkU0NuQVR1TytoUlVrcVJMZ2xwVjNXNktmSTV1?=
 =?utf-8?B?K2l0cjlJZDRUeGozUmp6YXFLanlqRXdKSE9LYUVydTQweFZiV1UremJOaFpO?=
 =?utf-8?B?aFMwREw3SEVFZjkvQTNvV1I0OHJtaThlR3BGemRNWXhjTklBalgzOEo5V3pV?=
 =?utf-8?B?MlNac3Z1NVhjSnNjbTZrZk94WUZIeWwxSzJFZ1pYS3ZxeEQxMUo0cWVqSVc3?=
 =?utf-8?B?NEh2MW8wT1lzN2dBOGZZVWs5RHYvcjFPeUJqd21wcWc0aGE1aE5kdEN1Vkhh?=
 =?utf-8?B?UFF5ZU02V1pGbW0wNkVVMlpVRWNtWHVhTm0vdFY1elYwUWlNR3VucDJwWTg5?=
 =?utf-8?B?U3FkdWxGaS9JZ2pYejA0SzFkWVpwRkFQR0ZUQjJGOENoUE1NNktObmYvUmpu?=
 =?utf-8?B?K0NuTkJ2cGFSKzhOUkw5azFTcmNtOWF2bjBUSkZXVkxoQmNJZkdjYWtLYzBr?=
 =?utf-8?B?ZHRrcDFZa3N2d0hKTmJWQVJRWnd1WUdDZXJ3bTFwZlZnbitpdFAySExFQkdz?=
 =?utf-8?B?RVpQMXp5SG5rK0h5bGgrc2NkOGJkTEY0WW94WnNQaFdsT3dzcjVXdmZBWmgz?=
 =?utf-8?B?Tm55QURldWZpOU5SR3NyMkpxVHZXcUlackI3Wm1ERCtJc25qY2lISGc2V3hu?=
 =?utf-8?B?RWxUM3VraVh6bkdIc0ozZVNNNHY3eFlPaWF6ZEk3bnlpY3EwL1VucTRTVHB0?=
 =?utf-8?B?Vnp5ZS83SE1lT213SFdXejdZQTg2bFZPelU2NUNvWGpYamxTbE1ldVdMTzNI?=
 =?utf-8?Q?Mckvu4HFW8nvvDbJ2LnIpLTyzTBxnDI0jMaqE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dUl3SWx3MmZSUEVCVUh3VXhNeGFRZ3RUM2VaSGxveHFJL0NGRWlKSnYzdW5V?=
 =?utf-8?B?azQxMWg0SFlDZ0dQNGdmOFdPM1hvZTIwS2R3djF4ek05ZC9NQnhxWUVzbmpV?=
 =?utf-8?B?cnpVVitVQk5DSEMzS2NCWURQeW83UGhDOTNSQnA2dFRtQ0E1Skl6c2Y4Y0Jv?=
 =?utf-8?B?RkFybVBSMVQwUDV3Z3dOWXhFYWU1b1ZQeWdaNUdPWElOUHhpZXIrVEhJaC9F?=
 =?utf-8?B?bGk2ZGU0S1QybkdhczVjNTFFOU9WRlRIenVrYWd6ZWNINzhUT0ltanVrVFdJ?=
 =?utf-8?B?YWlxZGJMdnY5TVhwOFZSR2ttQzc4ODVPNWNiMzZGY3RVWHZGUXREODAwczdZ?=
 =?utf-8?B?eU4wWER5OHFQNWtPUm1tQkVqc2hidXFYRW55cDlhVFBnbURqSVZENnBUdjJM?=
 =?utf-8?B?L2dtT2VFaUVPM0p4SmlKSTFER2dsenJ6dU5STDhGWWx6Ny9FOW9tNkY0YmFj?=
 =?utf-8?B?UDloSVZ2SVp5c2d1b1pha2NUaUxoQXcwMTRzQXJHSXYydWlJZ3h6eklUcEVr?=
 =?utf-8?B?YUh1QTNDWEt5Q1ZaUisrZDM0L1pWYXdCYmhMd3lpOTRQUlIzYVV5eHZFWTd3?=
 =?utf-8?B?Ukd1dEdnUVBpMzdoRUUxeE0waGZGOUhwQzlHcEtRbTQvbnpJU0F2ZjhIMHpq?=
 =?utf-8?B?blBqMkZkbGo2a09jekdDb3llNXB3eVNWL3NpeUZIeW02bkZTdDMzc2ZmSDhH?=
 =?utf-8?B?Nk85b0FON0gxcDJvWDRrVXVlSGdFbzRmbUN6aDNnRDlraThGNnB0Y1NydjRH?=
 =?utf-8?B?dVpTVFBjc0ZxbEJ1Y2Z4cE05UUVkczVMdVpqT2NhekdPYVRmWUVnRWNnVXhr?=
 =?utf-8?B?L2lHYXJEalNYNUJFUEs5VVdSVXVwS2I1QllSOUsxU0tDaTNQeFdIMWZUY3FW?=
 =?utf-8?B?amtuVE10QWRwUkJ5T0tmZlZjTmlIYWlmenpUTlF0SWh4Y1E2aTNEbm1tV3Iv?=
 =?utf-8?B?ekFPdloyK1RHam1JbE5uRlJPZ2RsZXYyYWVsVkZjcTNTS0ptVTNiTjhzV0xT?=
 =?utf-8?B?YmRNMmVqVGV0TmYvWmVpTmUwZzJuZjNvdmFxb1dZWUZySVlEYmdUdWpDSmJK?=
 =?utf-8?B?OUkvNmNab2RITjFtNkhUVFdaYlVtTC9xL2RYaWZFdllSN0NqMzZNWjRWUHU5?=
 =?utf-8?B?bWVFMmVocXhjS2I3TVRQK3duc3ZWYnArWjVzT3hhamt4eU41aWFZcVcwNHN5?=
 =?utf-8?B?ZVVOeGxpQ1dyRDM4bmEyM0dBU0dlVHF1R3ZMQkZSVC9CR2J1YXJNZ1B3ZkUy?=
 =?utf-8?B?ZEp4a25MVVFhU25PRDI5cDczSElOOE1iQzRXWGJHdHNycjdPdnBzdXlhK29M?=
 =?utf-8?B?NDIwT3pVK0t4U0FHako1Tkh6cExyQ1k2Z1pvejE2cnV2YjZDYjgweE5HK0J3?=
 =?utf-8?B?L1VvbW9CK0gzY3c4QmxWOGVBUHRobEo0QmpyTUNuc1J0c0hxcWREc1FFUkhj?=
 =?utf-8?B?MXRXd2t6NDhnNFNoREpXMCtvRkcvcWNNblV1Y0FWVDVyaUlVRnRUZ2hZTXZo?=
 =?utf-8?B?OEU4bVFDQjJDMU4zNlJWVWRKQW9jaTlSRkUwUGp1SFJsOGgzTXFkbFNaQ0VM?=
 =?utf-8?B?ZXFMMVVMZVBxcDB6OE90di9LNXRMQnVTdnY0R3ZJNmx1UHFhSTBTOG9Za0Z0?=
 =?utf-8?B?YVBPQ3dHZURzVUhteWZJWkdhMzNWcE5ldFlkSmROSWxybHlrb2U1R2xMVGlZ?=
 =?utf-8?B?blpobEFlN2RIWXNTY0loeTdBMzgxWEo3dE1VNGpnYWNZMEZHVDkvSDQ4ejlw?=
 =?utf-8?B?NXNVZ3ZMSjBwNTRVeWNhOGVtdFNpMzV5a0xid2NTM1Q3a2xIUUxjYzRhdFZN?=
 =?utf-8?B?QkZMZGdUaXdOMG5pUkthcUlYdXlrNHNlVXcxKzlBYkVzOU1WTTJRdGlmbUhw?=
 =?utf-8?B?aGFxR01FaHpNNkJ6TkRxdjZremVRZmJtWmEzK2EvbmNZbExlaVFHZDl6bDkw?=
 =?utf-8?B?QVpoYk91MmM2d09TVmcraVNQdnJjekFZTGh1TDNLRG1rVlhhYWNpRzkxQjZs?=
 =?utf-8?B?Tzl0OFlCcEI2RXZhUWdYcDZ2aUw0WE4vT0hFKzhyZTJjN2FjQWQzdXV3RW1E?=
 =?utf-8?B?V295U0QrSlUrc2kwN250RUdPN0gxcjNBT0tBQW8yc3BoQ3liaDhDSVpMbUhP?=
 =?utf-8?Q?IFDtAXYQN57rF6exmvITo2tBv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ec9bd0-acb6-4830-100b-08dcf209c9fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 19:51:43.8159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L4TpOaa0X97rUoBSGtK9dB9BX0LSwaZ6wtHlAtd+vQ4ReqFFHEa7FDjUTcpv6KvkYXE3NpuaTzdLrhCG1jqfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7330

On Sat, Oct 19, 2024 at 09:24:37AM -0300, Fabio Estevam wrote:
> Hi Frank,
>
> On Fri, Oct 18, 2024 at 6:13 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Adding Francesco.
> >
> > On Fri, Oct 18, 2024 at 4:24 PM Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > There are some dtb check warning
> > >
> > > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> > >
> > > Can you help add actual pannel-lvds compatible string to clean up these
> > > warning?
>
> Would it make sense to change panel-lvds.yaml to allow a single
> panel-lvds entry?

Not sure! there are bunch of compatible string in panel-lvds.yaml.
Maybe device-tree team require a specific panel information for it.

Frank

