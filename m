Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72748421EED
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469204; cv=fail; b=UawFI+vB1C8QiTv/ByJSRCxYEfisr0hIs+e7ZFC22CcIqWZJipHFAdn0x2n6M46xVs0khi9sZUXbW40K+HJDK1m0f9fIEkyUJiPXGH4RaqiD2wf83sgDYUqSZQQ1+wf62Zt9aB1tzxPxvT0iKXNaJIv25KPNo38Qpv58cS2gGIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469204; c=relaxed/simple;
	bh=QFy2it39cMEvPRHGulc+E6IylTR9DV5cXER5ms2Esng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=CXCbKlJU3OHYGxjCZwHSeEoE5xN+NEgd+4Wvamk1v9VRdO36ot+c0coRj6Lmf2avBTagmM6vNWEt2MUTTv/R8pp+JMgt7d/sgpfsZPpU4wBh4VM41UnQP80RoAoD+PXfxLa2wBKTI9BHrcDwegjdbwEjP+choCEkH7XvQ42I0p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ent29sw/; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ent29sw/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIeXPJTzax4oy4ShjpYSqn8caaBa2cLAimgDCnuKw7w2fnME3GKNCiPi4IA7tlYtJw/II6Kzt7X8USyL0tpJfv9L4J94wBgcjDNDqYZngqH/yCzE0cMberve3xLFMhy3InwxmJo+llcJlIZlcKuEZHXAmWHuq5MeKEbEwjRidyztvMCsvWKtX2i8ScpMM7ntYJOW57hjq6Pew2F2hULY903Ci97190W3XjlzsKGSSjkZ28orzNUswFxTYKbYOn/iHgjzTzkUrTZDna5K7MeqVYbvQjMpo+hN8Ex6PsxH9Zzy1v6puLHNmjD4L+v5bEy1/wgVs8mOHKSTrEC9MGCb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLI6HHDtIbPQYF+JGH/PutU89i39MSgIovkGyuo5Fqg=;
 b=tRIWBEba/Fyqt5UvoE/TQr/Qk1zXVBynB5j3zP6kQWcwDPZ8os/9ku9VIvLFeAoBH8K+Bb6kkXVUnk+/stx/GFUbaqd6I1AT+838C/Qs0ITQ+r41ve/WMqbIBQa9P25wk+qYnaw7xnVhhuLbaoiVuJ8xcmacYnJqbTvF4gkeEo5ywgpll7QWxNZUvJ1TBOofPRORq4wrKcRx5IZMaWn0+mT0qFHUqJgdmNlOMuYfwyo2+7iCL440QZoxv+g7EW1dDhcLIAoPLyV3ZidFIrY5r3TdodvLxDPQmtuveeYgaDE6b5CIg7GUwafnzo6968BPpqXBXw0TDOmm1axf97pjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLI6HHDtIbPQYF+JGH/PutU89i39MSgIovkGyuo5Fqg=;
 b=Ent29sw/vkfA0ja9SRQxWq8uJ2lqy8vHXNF0E0nulGqy92UWofb/h+EOnNPEs2G2LfC24b304RefrwJ+hLs7c1bwzZt/Vnpeh/5ntD52KXu9qWUQFFNvMaCb9AgKVHa0ueRm4Q8LYLIdSzkwnEgy0bZ3ow9uwS93Jlm+9NmO6/YyqyQHoGT5PdwFhoSxg/B23B+LL3p5SwVnO4vninIEA3DdX8bNZkBXNAl6mgqNrqXXaHQGMGP5Bsdzsrv+P1aWnH++OAAkiu4HNTIh+Plw8SwexObpAERGRUzahvd3352gDGnxxRBGaUhhqNXR0OO94pnPyBWN4IiuKa5x2wzTTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 16:33:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:33:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com, sherry.sun@nxp.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, festevam@gmail.com, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2 0/3] Add i.MX943 PCIe supports
Message-Id: <177246919562.2086883.17926195087426226216.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:33:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P221CA0081.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3b0bef-d5d7-4321-19c1-08de78796919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	0E93UTuOYDpC2dxzcqao1nfvqX+isfX2QpFGXSNGWDtsa4SCA3G6InuhG4092uxLjWAJeunLtWxhHnFMvbSFWMweN9EJwp0+6D3jk83An2eAMfzFJjx9A++1h1Dq6o4LUsR9t5GAX2hvHjD6dclQ7i5BR2zU8b7HXJoBqzbiJUvgg95VaS8Olh/LwiUdIVNVNv8H5XyPrs8R4n15ApadARwypIvpR6cF8WtKOkYVYjmupHQy+AaRQBLq+VHZ9Ag+1yOZD1bTuyysmB1LRbbcHizKqxbxB9w4lU9Dwsub16Hrq7+v1vfgqmyXNtfqUwLY7K1Tp/VhKF1UVogydsmISvPVzcftP3x7NVDKJw35wF40Lj0tNkGkqp7+nSKMgo9V0hwJUZW9PNItqxd/j2xH/WWxvqgrTTzO75d2rEKTci+ANBE1vW9J4nKBF0LG1JLOFuk5zyrWtPiOhw+BzqW6XQb7AXX30J9rKbQavajJuwMNpzzZ2PTS14Lw/xoqTLCJGWjTfWqw1zMipxL9h0h/4ErepNdyEsh8U5j1aoGr+6kDe6G80UyPZzolFyJZNNqj7nUgGknfp+IDGSJ0GBIuBpyV1gdDUom2WOXlDEGo+S95rH0PNueSHYA1a8mPPQHyv5bk8iKpo+rTCE//WphJP1B8M15F3bA5aVeTkR3oe+ZZDfDFLq3Sop7WKKMLfPti7Q//bdg5Moh9yop5RWsiRVdpdSP47FqVjzZ2xUhdHlJ1l2+yrYzpvylWSSApF8QW+9purdqaKBok8PfEYEjwwG7W1rd7ipCD//0un/Zc7Og=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1BSMU4zWnFCU1lBWUdUTXczd25BQzFGcUxYQ1MvcnUwaC9wVGU5K20yNUpl?=
 =?utf-8?B?VTBvbkhEQ2M0ck9RdmJPWjQ3VTRrZnBIZjY3dzVqU0FkczN3KzhaSUlocHpU?=
 =?utf-8?B?Tno1SjNhQzJOdWZOZTZ4MG5VY3daVGVtTS9Nd0hZdTdobURVZXRsTkpOM1Zx?=
 =?utf-8?B?TXIwZGE5UEZzY2ZDbFB0SHdnWFJqUWJndkhwbm82YVZYVU5OQzNyckQ4MGxK?=
 =?utf-8?B?Q0NFckphQ3Y0ZnN5MjRyWUk4N0lja0dOSUE5aDR1NHFOQzJqOGh6eENCcHFa?=
 =?utf-8?B?S1lLb0JDMWE4dEI2a2lQNENoVkNxWWpZelVZTlhncld1bThYUE1SREQ0T0tE?=
 =?utf-8?B?Z1QyUG10MWdDRmQ4ZUxWTmIxeXAxU29kWHNGK0h6Ny9NdXQxYXQyT2laRlRY?=
 =?utf-8?B?VVpsbTUzQThHTENPYWxHSkJlYUtCYkIxbTlDZU93YUx5QXhSVGpMdkdwRmJ3?=
 =?utf-8?B?R1BVQ1lod1RtTUhsa2hESXdOOEhhcFpGSXROaGxCSTR5NUlZQkpYa3cvYU9M?=
 =?utf-8?B?S1dIb1d0ZTFKRmtlaDEveTRDUmZJWVREeld6NXZHRUY4ZlpmU2t5M0V2MHJY?=
 =?utf-8?B?THl3OHZQZ20zenZVa01qMm1RQ1BsS0xkall4ZGJrUHY1QmJ0cEZkZE5ONzNQ?=
 =?utf-8?B?WFhzZUwxeEtwMmVqR3BzdFI4UmZaVmxJZDNmK2VQWG5EZmxpTGFuOVVGb0VP?=
 =?utf-8?B?MlJWSnNJZlhEWk1mQ2pOK1VFNVFNblJxa0xpa243eDAyNFI0aUkwM2YwclpD?=
 =?utf-8?B?MllwWmtzcU1zYVk4ZGxZc3dBRjU0RUZwUWZNRUhNdkJiWkw5R2NuSGVadk1l?=
 =?utf-8?B?VktjYUNCK1BtNmw2YXlOR0sySTh4S0pwYkNKUjdOSjdPc1hhTjdRemkzMzY3?=
 =?utf-8?B?NW9qM2plMnR2M29aS1FWb0kvYnJUTEFuZy8yc1FnMmhFTm14N0pNckNqenFp?=
 =?utf-8?B?Q3BualVIME5YY2FiaG5xaUtWdTJXa213Z0Yvd3VDYUZSRjdwSUxXMjdheThT?=
 =?utf-8?B?dTJGQVNPQUE4UTF4R3JqckZiSjNGZldrMUxuanZNd3dnZ3BjSjQvbDZEcWtt?=
 =?utf-8?B?b3dyaDlheVNya1h2bk5hWTU2dDNKYjFHZmdld2o5azBJcEdkSTRuQjk0U0dM?=
 =?utf-8?B?UGNMOWMvM2RTSit2dk5OK0xNRU15bEx2b3pIeTVDK0dhZHhvVml6OGU2SS83?=
 =?utf-8?B?Q3ViTzE2SFd6NDlJR0FhUUF6NWZkdCs2YTloaDFsUmxuSm5JdVlJRGN2SlZo?=
 =?utf-8?B?VVN6Q0Q3R1pUSGNxbzVjNEN1R0xQbnkyQ0Vhc0xlcFNab2lZcXpRbm95TE50?=
 =?utf-8?B?MzRBajBrTmV5TEgwNHFuMHRSSnlWMlNuUG1pc1RTKzdycE9taVk3cWxQMHZs?=
 =?utf-8?B?eXUrRmJQbm8wM1BaUFlWZWJacjEwRU1tcG9JVkFqWXpyVjY4bHdReXpia2NV?=
 =?utf-8?B?aFkwaUdTeURROWViclNuYXFvNWVHbDh5VVAwTFBzSEJzYWk3WUNMdDV3aHhL?=
 =?utf-8?B?ZVhqcHVvclRFeTZSZWx1OXFNUVQxeUpGcWc2eXZqQ3VYTzB2b3lNdmlCUGR5?=
 =?utf-8?B?YUI5dmluRXo1L0hyT2xGbjJYcWJLNzMwTWVxSlRyYUxSMHhxeE16ZE1UcEFY?=
 =?utf-8?B?cmlDNDY4S3pGb1JmZnltSkhJM3B4djdQUnBNUTlqZmFYYjJUZFQrRm9WWTR1?=
 =?utf-8?B?RVdrb3FBZzdBTGNpakxzcmIra2JXOVZOVXlYWXBhL1BWcmNCMEhhRUtkdnpz?=
 =?utf-8?B?eHArVmJkQkNad2NRWnFqMDJiR1FVdm1GbVZYd2hVOUkrNC8xYTNCb3FmcTB3?=
 =?utf-8?B?WDhXeDdKcGZzT2hGL3RqRUtYbmZJRDQvUkNXTlc4RE5kcjFWUmViR3Y0Sjhv?=
 =?utf-8?B?ZzhnbXRMTit6WTdhQVVNMU5NOEx5djFNY1VHczVOYnUxZXU1VG1kR2pxZlNk?=
 =?utf-8?B?OUVmcVBPU2dIbW8vd0VLa3R5NythVU9hc1Q2UFJGOU14WWZxQW92WTBOUjRw?=
 =?utf-8?B?dUZDVjVXT0piRGFrbkRZTmRFNGNYR2VpOERVL0NyUnNKT0kyOHBNTndEMnhK?=
 =?utf-8?B?L0x5RzV0MVh6dzFyZnJyaEEyWjJQVGY4dm9zRTFnVmMyaXJGQ0FzOS9EazdY?=
 =?utf-8?B?azFFMitMM05tVDBUMkowaTliUFFjVDVJMHRxM0RGNzJwWEVocDI3UC9iUHR1?=
 =?utf-8?B?R1FlaUxQMUZhWXpJdzFOUnF3bTY4U3pybngyLy9wY0doMzJWWHBnZE8wMzFX?=
 =?utf-8?B?ZkJnMDR5UGYyK1d5TitHL2FGUXNydmhmaVRIMUtYaFNCcEdmV09UVmRGY1FQ?=
 =?utf-8?Q?ib3woip6J1v7Lm+Jbr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3b0bef-d5d7-4321-19c1-08de78796919
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:33:18.5892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC8qwWN3afU1gaIt0ZswR/GuCVP5FomvcCBG7QKtjIgaUJ8z1idFQQzBmvfAVL5M4kNjrIsF8ocu7cCYVDdhAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295


On Mon, 09 Feb 2026 13:57:42 +0800, Richard Zhu wrote:
> This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> attention to that it relies on the patch-set[1], and the PCIe1 port on
> the EVK board relies on the {2].
> 
> Both of them are queuing up to be included in the coming 6.20 kernel.
> [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx94: add pcie0 and pcie0-ep supports
      (no commit info)
[2/3] arm64: dts: imx943: add pcie1 and pcie1-ep supports
      (no commit info)
[3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

