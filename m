Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2059.outbound.protection.outlook.com [40.107.247.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3177E224B1F
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613847; cv=fail; b=QB91H4NBZLHcyWJAvlBEcpHXZ7js6e0X9732B5I4kJEvyY0ZfjhP9Hsz4cLGH8sSfnmd525U0SDcwC4WL8cQhMDN5rrvn82n3SSE0blRB0uDfv4lCwzmc44udxkoh1dNvB8M8D68J7SM6wRsI0UMBEMCC7XT60wazRGotCbzg5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613847; c=relaxed/simple;
	bh=YutGKzVnvJj5KOarxZjL0Etv1sm34ivtUBhsg6PrZlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J6nOu5vUqn+d2m5BgSXelr9PGNm9BuioWY5rcGVA6ZEZG07Xxd8vjHzWT+iVvFPvJui3UbZ9mQRW64uVsoHaohgS7gaWViGDz2x5jgrZUFfd+IBSEy3YciB982Ql18EunTFeJdpacvdjpL45eVSxSimjSQoWHk7+nnm6L9Wuxvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pHQD6ERA; arc=fail smtp.client-ip=40.107.247.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pHQD6ERA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZXj+2HjyPRPKnr34YIKdHiQWYiXC94bEJ77ZpNrzLLNst1+wvnHA7fbGzjh7yDg78xkOJPSH02P7WbSPfg1CX3a0vczr2nqq9o8PAAbCsFz8SYh7PfPOaiXNDzsVCQNKA3A3HN/pZNZzb9+1Nyjcj1OFpsNFkA6t25KMgDuYV5tZmKveCVP6QCKvieMMw0UzIl9g0yiFe3resSzKf/Ym15mvXi1533mQwEWUbQqlD97DUnDIrGZCsnte1fBq9quwDxrlHTQtqVChb6MZtKb3VVYRt/EnHhuu0uPdvvP6eG5iF8A2aAj8cijZC/IvHpgXhHGz86a815F7FvyR9tEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCn8GxIzq0WMXy2L8JFpBH088CalC4FenbOqphdvFso=;
 b=BRXBABQv0/eFyZQsgOgxzIqscqa/KL/6BUEcoyo4T5xpu5iD2A8ydFJGUmzqTgPseMMZODczC4BqlD/PfL2GBgXKToS9ohVy+MqBVZcVZIeKBaJkp7t49AWLcRpLtFaNqZXao5blqmd2wYBdGgZKWsZi+htxoYsQZySbSH55RNoS55Gn8+BBFHheh0KMbpyRkfxWZKwdnWYQm+NlvijuHBQyP+E0BUvk0SlWdZMmdk8lH4Hc9+iZjnhGz/YxZOm+So2qMwLgWt1+kVmr369eBgemzmS0omc3XsB/6MEedLJIAypqhk2Ry1cVLD50X894mk4wCy4PHrTUAz8MKEmJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCn8GxIzq0WMXy2L8JFpBH088CalC4FenbOqphdvFso=;
 b=pHQD6ERAWjtMkPkVOQehaOM0eDuCzvMpQAobxo8m/s7LOuWYCqpzoVvSmXcPptiyMPDb6ERuUZLam1RaJllk0m1KEaIoAVyTe+pi7+iMRUBPdDTf1vLT5kDjb/GVorVmwyKg2j/b0tQCq3MCbm64S0xH8OlPMMuCYKchMZ46S7DF3wehwtp0syfvy8TczbNiXf3CLQSCLK4YP6wyvdxeMxFIYG36tZVAVm7Cc17Nkq8mwvtxh25mO8WEU4hv75odWXZWGzX7JczI2MyhjjIm8OF++8jy3K0YpY7toN+8pTBQ4LHlTNQ7YoXOImtybtakx1nKHfbVnW9mfxIu67UDag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com (2603:10a6:10:47e::21)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:10:41 +0000
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a]) by DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:10:38 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 2/4] arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
Date: Thu, 19 Dec 2024 15:10:27 +0200
Message-ID: <20241219131029.1139720-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:208:1::45) To DU0SPRMB0099.eurprd04.prod.outlook.com
 (2603:10a6:10:47e::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0SPRMB0099:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 423a09b5-7aeb-448c-a313-08dd202e8826
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3BZK0lmczlEdVdLdkF4VVZTSjdjdllwTGluVHRTTmlXV3kvVUxORXQyaThT?=
 =?utf-8?B?Z1l0UW1ta2pRT2NxK3NHMkJYUEFucmh0RjBETTRUK1hQSTdKV21ZWjlldHlW?=
 =?utf-8?B?SXN0bm40RE9ybnk4SFZUMERlZkYxd1JZTlJ2anV2RDhNK3p5ZU1JNTcyZE8v?=
 =?utf-8?B?akpCT3VWcHpMcnVtZUlQZXNmeXJZR3gyY1gzMGtSS0UySDF6TFpSU1VETjli?=
 =?utf-8?B?QXd0ZkdPbGdHeXBxblR0Sjd0cjBPclp2d1VJUUhueEt5bCtTS2pCUUF6UlVy?=
 =?utf-8?B?dm5mRUFUd3FRWVk1dW9NWVZWMlNjRThhVGhHVGY0T0lZRVVJaVBWNkRVOHFS?=
 =?utf-8?B?MXB1NTJlaDV3VDdoa3pVOFBoQllxNjlRWHNDL2MwbzRyOGM5eFR6cWRxN0h0?=
 =?utf-8?B?MHo4czl4RDFpZEUvdjA0bWJwTXovR2MxRTQ3M05UY296ZXIwL0FtQSt6UWpO?=
 =?utf-8?B?RzNpS0dLKy9iVGMyaDhBN3E3SzFza3AxNWVsUjJXQWJTR3hUanpNalZrSHFr?=
 =?utf-8?B?TjYwaTVib0kxaWk5VkNqV010VDcyMVVzdVB1d1VjUGRid21EclUwZzh0Zkkv?=
 =?utf-8?B?ekN0N3czajFyNWZ6bmFmYXZjVFhycEhDNlN2bTg3WndkZitVclNoQzNraCtp?=
 =?utf-8?B?WjBFN1NScjd6SkVXTjRxSHB0clZZYWczaGJRei9OdkhJT1BUL3BMMEg1NEha?=
 =?utf-8?B?TS9yK3NOUUdOZWl3eW9BT1lINEhZMXBCKzk1TS8vZGUrem1QMTdXUE1ZY3Mx?=
 =?utf-8?B?MU9Wb3FNQXJsdTRHSFRrNi8vNEQyb1ljRlM3VHpmRjhxY2hiNy9KTkR6YS9t?=
 =?utf-8?B?ekMvZzJGWkxnTmt3V3JVVExQL0V4VjFQNFpMNmIwNEdsaTJOWU43VTZqUC8x?=
 =?utf-8?B?TFQrNGJNNzJtUGp6cXE1TTVjekhqUHdzYzR4T1dYbmNzTEZlbHBJUGVkVnhx?=
 =?utf-8?B?M0M4TGxaNDQ0TmxVck9uMGwxeHlxL2dqT01YQlUwZHpnck1xVGFpVkNvRW5M?=
 =?utf-8?B?cVFhWG1pdm5kUkc1OGk4OTI4OFVlR1dzRTF4SEtxUzFMNC8ybzRKb0h3elg0?=
 =?utf-8?B?RFVvdnNZMHFhOVNFVEN4Y0lNMVpud3kzMm5VKzZHRzZpOVJVeEVpK3NoUW1C?=
 =?utf-8?B?MUJvcWlYMkluYlRkS0V2UGt0elM0dWN1R3doVW43cjFNUmhleVp0bDBSREh5?=
 =?utf-8?B?L1hPZ3pTdE1xbXNGcHV2WVBLeUdSSGJLZGRoeGNUbm9hcDdXUUU1bkJqMUlC?=
 =?utf-8?B?a0c5WUhUSW1IVnVwcERHVjF4YTRIQkpYakg1WE0yOFdBTmQ0QnZiejYza3BY?=
 =?utf-8?B?SjZXUUFqNFkzSHVPVEppOXN0MG1PbFc1QzZvT3hqaW4rUzVuN1BHb2NZOCtK?=
 =?utf-8?B?SUtDR01OZlBIS1ZXKzlkVDRBcTFkcThldkh4bnR6YmNEL0VKbGdEZTc5aWwv?=
 =?utf-8?B?TldRVFNZUlhjTlZjS21EdEJXNnJ3amZ1UTFCQlRpbm5kTGdYakFrdUUzemhO?=
 =?utf-8?B?S0FZNGhxc1RxTDA4NmJEdllJVDdCUnJPMjlkM0Z5eml5ZFVUTzQxVlNFVTZ6?=
 =?utf-8?B?YTZ1ei9nSmpvSStKWHd1V1VjdWdVUnNpaUZidkliZXVmTjdXUEtFNDBFemlM?=
 =?utf-8?B?SmQzSElpMFpTNEd5RGFtT2JzNXRDUGxRYUdSZnJBbGFjcmVjNGlVeGF1KzBG?=
 =?utf-8?B?Z2RWV2Y2b1hWRjVNSmlTVy9OMW4renI1R3pkYUJmM3NFYTI3a3hIQzJlVEVk?=
 =?utf-8?B?NFU0Unl6Ykp4Yy9IejRoYUdUb3oxdDhsNEVqNlJlMDBhNWI0MzB0ZmxIOFp3?=
 =?utf-8?B?N3FGaHN2SzBjOUhFUjZQOGlMcmNtY0hlbEpsWnZ1WFNiTUNScUc3T01YTm1S?=
 =?utf-8?Q?COvLd/glLlJmC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0099.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWh5Um81dDFrbXQxakRpSmZNL0NMVktSdnBKUkRoUWthZzFEUHFzQ21wTDdl?=
 =?utf-8?B?QUhBM0VPbGY5UnB3S0JLYnhCbldtVnNKNU5lRGswQkNSeVM5UDJkNGtVd1Ji?=
 =?utf-8?B?UnY2R0psSHdjdHJyNWdwTWdSRDFzT0tPakZQWXVBdE4rSnRHNGVUUmxXQWNi?=
 =?utf-8?B?QzRnNmxUbDRQMmtHVU83QXE1aVlxQUt0V3dXWkJVNlRKSVBHcW1vODlXUTV6?=
 =?utf-8?B?L2tHb1ZDZUxvd3BVckJpeFBRcFQva1gvbWE0SEtrZ1ltakkrRlFGWExkRXFS?=
 =?utf-8?B?N2lNUDVmN3NxRTdsaTFLaHh3bG85cVhLQVRIcExpRFNlNUZGMDBtMXNaTnND?=
 =?utf-8?B?M2JJN0VkdUZMOC81TUFReWc0MmFxZU10bjM5b2ZNYzlrRFZzK0JVak1Kbm5I?=
 =?utf-8?B?eUpMdWEyZmRBSjdiMHMvbHBkb1cycWpFWWxBc1lXYlJXaEY5U1k0elA0TG1x?=
 =?utf-8?B?bXFNSGVPYzFQQloyTm4rY2NFUzN1S0I2ZGhKdXFOUWNNUkJWanplbmtETFFK?=
 =?utf-8?B?OGo1eG1UYlFPckVFWCtVa2JIbFJhd0F2VVZ1VXJZRnE3QktJTDFOdlBTbUV0?=
 =?utf-8?B?K1VQVHN3RTNwOEdadW95NXFsNTcvcXlBdWJPck9RMDFiQ2Q4elRWaHEySTZV?=
 =?utf-8?B?NHI0R3BKTi9aWGdJWXdYdGpCYmc0dEFDSzdkRVBPWmFGRnRVdUlHTE1EQnFo?=
 =?utf-8?B?NzE2VU5IQ0hKRUhQdzJXbXphYXNicG1pS2cvMFg0YkVkSXVXMXhLRmo5clBH?=
 =?utf-8?B?UXdCMWkxcVhVRkp0VVk4NTZUdEVwakUzK3F2b3NGSGRPU3ZvcDdBbVdMb3Bw?=
 =?utf-8?B?V1B3Mk52cFVOSU9HRmU5RzFEZkc5REhVS0dmK0ZWa3QvdXAzTURZU3Q2ZEF3?=
 =?utf-8?B?WWhTcTJxcTg3VW9lb2FLdzNRUkFYUllnOWhmaFhESUdHTU5RUERyN1k4RWVG?=
 =?utf-8?B?ZDdJaDdzc3UyVnI2Zmx1a0Nxb1VuZnpjQVZIMVJXa2FIZGNxdUo2UFFTWHFs?=
 =?utf-8?B?cGp1OFdlRVB1WXRObjQybTBSNXlXQzU0SXczTExoWDRFeHI2WFBHOWoycXpr?=
 =?utf-8?B?dUtQN1d1OXI2Wk5NNytnbE9aektDVzYyTWZSNFJoaEZtbWt4Tnp0N3FrL0c0?=
 =?utf-8?B?ZXFoTHVUNlVXSGFVVVZPRFpOODdyOTBmaDlOL2RNWUtCWnd6QmVZYWNmamt5?=
 =?utf-8?B?aG1SZGFqejdsSjFiVm8wNFU5amJzNkxsSmovaTFnTEw5ZC9xR2MveEVZMG5y?=
 =?utf-8?B?QVhPVkRhb255c1ROWExBbFJKemN2WmJpQ05xQU5YZ0tsb0doRzRiUUpkOGll?=
 =?utf-8?B?dWc0cUlBMld0UlNVU0tOemtEaE5BZmlNd0p5ZU1aRjYvOUtnQW1Tc2FxajFl?=
 =?utf-8?B?UThNbWRIWENYblVOVmV2bzVyeG92V0xFUXBoblMzZXZ4UzFqSFErWVhnRnRy?=
 =?utf-8?B?UjRVS3FERStpbVVTbEE3a0ZjczZrMmdtQ2RnK0NvdFBQWUVHSXdaL3MyN09h?=
 =?utf-8?B?M1ZTT2ZBZmI2YVY3RVpoK3duVEdncnNQL0JjWG9pS0VrTUwwU296TDd4aHBU?=
 =?utf-8?B?TytpdXhWWkFuMiszWUhCL3lWNjNENk5yQzJrSGZ3aTVzSWhKSVU2WStCclg0?=
 =?utf-8?B?Yi9iQmwzL2NuS2VPU3lTZ3EzNllIZkk2bmdnR1BoODNwU0FOOWc3aFJISHNx?=
 =?utf-8?B?MDdNakZ3UVF6L1pxYStUK0V6ejl3Mm51ZlJLOURMQmhLdnZwRm1mM1hLd3ZF?=
 =?utf-8?B?b0FRTFhybUl4SmJCZUJwdmJKVGVPS1ZZUG93bE9Pbis1K25wU3hVRzB3d1JF?=
 =?utf-8?B?ZEtwN3BPaTNuTmhlTHduSnAvd2dBRVZWK2xvUThiNUZSeVB4UXlDVmRJVEJw?=
 =?utf-8?B?TjVCQVJpZExkQWFvRVExWDRJMThkVk9HazRPTFZ4aDdDVFUzb1ROb3VaVHBx?=
 =?utf-8?B?TjVXcWlnM04wZ293elF6Nzh6YlB0RjRJU1ZCMFk5S2dWanMybGpUdVJBdWl6?=
 =?utf-8?B?cWNISDMzLytwUE91RU1Mc3JIclRSL2hmZXlnOUpsa3VvMmd6eDk0NHNOd1lN?=
 =?utf-8?B?UnViTTA3eEpzTDRMb1N6OVYxNzVCK1RzM2RZMDZDb2p2SllYZVZPbWVZcGFC?=
 =?utf-8?B?eDFZSWZ5Tm1zZmZsVmZXS1dGWkI4KzBHVlVIcWNLemNURllybVFZS1RUcXB4?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423a09b5-7aeb-448c-a313-08dd202e8826
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0099.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:10:38.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEy8VX2KPOb6/UKGoDyafj4YVBEtx5ujtgQiD6+ewtZZjI4oMi6DIFQoyVww+jata2/3mboqNaFJJzKyh1UD+Gq5M1Xfw/waIT0TepWALII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
(rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
are quite similar. The common part for the EVB revisions will be
centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
be placed in 's32gxxa-rdb.dtsi' file.

This refactor will also serve for other modules in the future, such as
FlexCAN, DSPI.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 126 +++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
new file mode 100644
index 000000000000..a44eff28073a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x101>, <0x111>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2352>, <0x2362>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x100>, <0x110>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		i2c1-grp0 {
+			pinmux = <0x131>, <0x141>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-grp1 {
+			pinmux = <0x2cd2>, <0x2ce2>;
+		};
+	};
+
+	i2c1_gpio_pins: i2c1-gpio-pins {
+		i2c1-gpio-grp0 {
+			pinmux = <0x130>, <0x140>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-gpio-grp1 {
+			pinmux = <0x2cd0>, <0x2ce0>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-1 = <&i2c1_gpio_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
new file mode 100644
index 000000000000..50fe6aaa1605
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x1f2>, <0x201>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2353>, <0x2363>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x1f0>, <0x200>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+
+	pcal6524: gpio-expander@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
-- 
2.45.2

