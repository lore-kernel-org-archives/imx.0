Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747393C5544
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735916; cv=fail; b=A2StcNo9ieJ1e7oAhEIK70k7pqxLQGlmpLL1rolke2WgKpUq6OX/FOEBa23+H6Bc/Xb/qzsCU7757MsiEZ/u60FztGWpSCoQOziigVx3O0jIW+MYf2R/gjucTB6DGJEQfaTO7Wjr8wESQcdJlrgdD/P61SJ+ik6wzsbUZoPtGeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735916; c=relaxed/simple;
	bh=sQqg9m5e8uktLno+sSerYsG5hfjdUouHBJIC91XMajc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KoTIWGrbL75NJdzwAF2n1Cp/5mORdPD5MKQjD5itP8pnc4JOZTB+QXCZZ4ETubWUAv4r04dY0HB1OKcEIqLnTTdbiSTDeaPd/xz7i6F9kx1suZyfUtVbUVhCuBKD/99qDFUdqG3vwWwOtJMDPvxiJE4gSOWXWrCxWTbcB1vCZf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uZkHH02N; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uZkHH02N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKJXFcqgmYDkjGrSYjOeXwFLiZNu1wK+u/00tS6aqi6LtHgMo/b3X3d6wULnF60j9rrvyttj1AOR6gbtL1X7K1UFbvEpDDoCCZVZWg+m6C01aRjOyenPfpKpUlNUXqZYCRzaw1etrjk1+8xsYjqx96A+/AI+00UUxHsxCiZfBviScvGI6fBmBYqQBiUXPTWErdRLpUcxW7j8TfoSrrXUklh68XJgl5rfdQzjmy6X5Mh/mbWR1wGIA1poOyfx7C357w1zsnv7ZK5Z4YVc25TOtF/UmP/RR8kHc9syuKBAFPmgKPCjNqVDSr89CT0A5mhQFnmrJoXSPjvEAbABztzc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MI7OnBi4E6kzZ/dAHbeeDcqhZjXLpZJ4oRMyPaBej34=;
 b=KnZfi14FPDIlj1r+cEDio3NAkCHvZvzX3KNP0AjdxivULXAYcGg/p9h9EFP6o6seJabXc+vIfiOc1Qc8oy9Cvm2K7Ndex2hrKaVJJrKrj9k2UoN4XlHxiwTMwhe0W8FGmdynQh+g+P3VW9nJPkbXcX80Z9eEXDKnyQL5kRYCh2D/OzAd1RETf2hnil1RtWlmKxRdcZhHbO7wQN9U9LKGHmuxT4qubBSxtJRwD1iVpxG1HLXhm2DNSHLU15IQQxa9kbN1Fpgpy/UlEUaVSOIjH0rNNwxfOMmdeaaL1x6hB9D3pfRdZcoCHQMAzmcbqTsA8RiYa0PUDvwtzM/KfOZWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MI7OnBi4E6kzZ/dAHbeeDcqhZjXLpZJ4oRMyPaBej34=;
 b=uZkHH02NRBMo3/Lb09Ar2E2HJwyP4xisVm8qJpBOsZOTOz8ZDr7V1odkkH9kBxFnuq68/ae9chx8OLs9zHQ7Khz1VguB9BNnaIb93DYybd2nyBGZnU3hVH/Q3ETAQD73Kh40Bb/daJxsQlPE5KyRFfmDcB0m1Bb3wFo421dPkhn8jLfqdbKWtDgBSp3vaz4PbVgTe1tYUEqnrJeY8rIZCbWSQhOYbz3NiabPc01hGP+rkkl8PVzizeYE2RXjiz2Bv4sswYdidVp5zfU+/hwcEM+4eOzW4S1xV6B/4E8B5Zsruj2hqv8DWpaHFOxjOgcPgbYa3l1rJp73A9rAZlx45g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:58:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 11:58:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 09 Apr 2026 20:00:01 +0800
Subject: [PATCH 1/3] arm64: dts: imx95: Correct SMMU reg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-imx95-s-dts-v1-1-858e83ae1a37@nxp.com>
References: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
In-Reply-To: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dda6cb-5d00-4c14-032c-08de962f51c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9IgadHqqxSmXWuKTgDzJE27FrxWXOX49cIXtJ0K5vQNu9z7hTfAPEwCjYiLdkct0DIxzGeRHVHaeo77uW44URD0S/1OtQjA5My/JVJsbr7Xri2/mm0Rv3kbiWmCfqYNRu/72EZLSnjeinlCjS0lrTYIVOpECt9K9WuWPEoV1MJ4vN6Cp+fnuaIsxqpxI3VN2IMH63cKF4ivV3vfAlrQCwiDq4n/eZYKlEAlor9UUrX75q7e/MwRyQm1dmVMtbs6cs7+jj1zXgG0JD9vXHxvGGd70ocHSotiDMkmvPQ2MPgRfFzIZGPBaQOeFPiqwd78DkFFa28VYi1hRoKGhcwKqPz/dgLWeSavpW26zS5fJwSyqVLEcf2RtwiBoihvwLnniVMNWIMSQHak2QYf7nY9sdFkDcRltRl1lhzK+LBwL6KWWqk6gVs2PqXubnndSYUCK2MJohkPw6TR7f9nBJ2q3E6JFib25ODLta4SeyJkPDBA6atNvfJsHHO0z9OOEplXXNbOHb0ynAhvtfuQhAvu7bMLkGknZrvGNykQCOzJzuhpTZlfUSSP/BhlMEwU44hR1x+IEVnVHTvD3+QLIO7maVvdG3z0NJnItzymGYRXOoGBxi1Zmcjtbv3GIgU8QPzZ0K1EjkIIz7VXhSJ+7DXQmOB0YH19qd08DqPJOlbyHlEQWCmoUGutDKJIOdldp2jCzM2eILahdVVv/l73Y/luwkVzeS/dTuY4iWFze2F8C2Mc8TMuzKVxCiSICO78gHp7l+QREPFGXB6tjEHPV0jp2Ax8IGtGJeGt6hk5O6ep9T0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZuaXNXYVlHMzdLSmVoVDNpakRHUnJkeWMyeVRQa0pNU1VlNlNmeWc2Q0U1?=
 =?utf-8?B?RnNZanNMSkRNWk9hMmxnQVpRYTZqekQ4NUtZa0ljMDJxTjFNd0VWcUVFbzQw?=
 =?utf-8?B?RkFHeVpiMjZsdmgrVUtidzcwdFJBT0lGeGxTY2Z3Rk5pTTZVWWFOQ1E2bXZU?=
 =?utf-8?B?b0U2TkMwVi9KZGg5blVEaVJUaHBqL2daNHhjclhmWmlHWkFPL0ZRRFUyY3Fi?=
 =?utf-8?B?V2V1UDlydmh1Q25vYkhVTEVSYUpuUnFwNFJhWld2V3p2NVpxVG1COXNSNFAr?=
 =?utf-8?B?V1ErUmo3QjRWb3B6QmVLVXdXTGN3WHhmS084Q3FjZFNXRGJiNmhIaEhZMHpE?=
 =?utf-8?B?NUhUUXdHT3lTOFVqNHhTYVJ4aXZYZkFkbXpqdWdmelIwT2ZWVm84aWRXWG5U?=
 =?utf-8?B?S1hGUHBEQWxuTy92Y1dDdGRMTy9vRVdGK2UreWpXSGVRNXBmMVJaMS9nRiti?=
 =?utf-8?B?eWI2U2VHcmx2cUVzUmlhcUZXUmJtWks5b0g0UFJib1d5M3FERmVKbk1BRFZZ?=
 =?utf-8?B?VVFnU3hOWHdvZTRsQmpCVE4wcmc4NDFBaGN0MnBwWEFBOFlBb1lRMjFTZjRv?=
 =?utf-8?B?Y0s5REUvSkdxR3lGQjF5YzVaL1NLTjNRMXRsQVZvRnB5NXIrYVdnT0FYVXVa?=
 =?utf-8?B?bElQbUN5TWtzS0hjUCtKTkpLNk0vbTVmZHRtL0x6Z0FyWkdZVGxqMmxsekZj?=
 =?utf-8?B?N2J3UklPZ0tCa2kvdVF5VjFrMHdoWFFzTWtSa2x5bjBmMlIzdzBPN1Rxb1FQ?=
 =?utf-8?B?bXg2MUtucXkwUDdzeExaK204UVdNNDZ6TnJaSnNlYm1ZT2JiQUd4N2NIRnZ1?=
 =?utf-8?B?T01LaFVCR0dxdHV4OFJUTkRpb0JtcnVRMnl0UTBnVUZLczUvOVIyUk0vcDZa?=
 =?utf-8?B?ZkNva0pHaEkwSEZhNjJMYVp3R1Azd1laak5rUnkwNXl2TkxmM2Yzd0tpa0RD?=
 =?utf-8?B?RzBXYU51cmordG9yTzJjeVlyL2dmQWZXQ3d0NjBIZFBQaVppRUtzVlcyVVJB?=
 =?utf-8?B?MitCZWxPcHlFVlVWcklOQ0RubUd3ajBldEozNGs4VzhWUXk4RWxvT2ZRT3Fi?=
 =?utf-8?B?cm9zWGpxRXVRZ1dCdzBRM29ZZXhrMVViaEhjRjg1SERhdXdua2JEOXFDRWpv?=
 =?utf-8?B?TEpqNFV1a2RLc0ZkZTkyMklUdXRGYnpRMmlMaEh3dk5JRWZHYTZ6RjFlS0k3?=
 =?utf-8?B?VFd6bUViZFVBaCs3ekRqckRMYjhWQVBXOTQ4Nzc4MDYvNjRnRlMrZ01DY2Q2?=
 =?utf-8?B?N253ai9KQUhnZlFoMDZrNjBHeFYxQktiV2xWLzh6ZWtDTnRGdnovUXViYTJK?=
 =?utf-8?B?czMzd0krUGJwbng0V2o0cXFGUCtYSmdSVjBPK0kxTlFqdDhCQnlJR2djY2cy?=
 =?utf-8?B?aW1KS29qQ3RpZXY4L3hudnJaYTczcGJCMFQ1TnhmR2NROUxkZ09US1djQy9X?=
 =?utf-8?B?MWgrMS90b1hZUjZCYXJkemJzSGZKOEFTbUo4c1MySnhzOHFxNk9PdHdicnZT?=
 =?utf-8?B?OG5xdktwYWc5d2ViNm4ySzZXbXdSWXQ5Tmkrajl2MDYyMlVNanJtTmxxTVhs?=
 =?utf-8?B?VEtpcURCdG4xaWdSR3lFWGdUK0VEc2Eyd3E0a0p4TzVqd1BFRy9lNUlkd1dh?=
 =?utf-8?B?eURLSWc5WHhmWC9EVFNaUVh0a0cwV1V2RW0vNGVvVWFhY1JPcS9vVEFaSThz?=
 =?utf-8?B?WUJwZXBJZ3hhV0hRT1lrODMrTjZkN0llODRVcjl4Z2MrZDZDSlVVNGlzWXNL?=
 =?utf-8?B?a1N2Ui9TSEp5dHBpbXdXUmtIR1RvVjRKUjEwbUhaWnUxS015cnh0Nnlwck1j?=
 =?utf-8?B?K0Q4a1VhcGdURmdMWEduTUg3VDRxTzBTNy9ycXVZT0ZRTUFWamo4OHJQMlFU?=
 =?utf-8?B?djJDNjlkK3g2cDlFWXBDZVNzcm8rdWwybFNzZGVPOFlQNDdTQU85anRvcGF5?=
 =?utf-8?B?K3dvb0JXOHlwQjFFbVlhYjRBUXZBZ2xOS3M3K09PT0RjWW1FcndGLzJIYXdm?=
 =?utf-8?B?cDFlclMvcC9YNzhMTUc5SXIrdnlPaG83SHVrQldjMVhKWUIzMm5XK0R1VHg1?=
 =?utf-8?B?SHkxY2tGQ2tLVCtkSHJ2Q21hQm9hVEowRjBrVzRCYkxJUFZ3WDN5ZklKbnBY?=
 =?utf-8?B?Q1prT1Y4RER4Y1RpazZuMTkyZkRGZlZ2NWJKVVNkamh1UHZOOVc4TXk4SCt0?=
 =?utf-8?B?ZUZrU1Zwa2hrT0JKN0hWWUx1VEp1alZvK3czUG4wT3lDMVg1Y1pReHI4cUlU?=
 =?utf-8?B?bUNHeE5LTWhaQ3lJUXV2MEVOK3JZelBZK3FQeTRBZkRzSGZYd3dpbS8wekQ3?=
 =?utf-8?B?SXJ6NlpLamdidG1veFczb0pZclFnclU4VnJqTnJTYWRYczlUdTFzdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dda6cb-5d00-4c14-032c-08de962f51c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:58:31.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTMQio7cyMthu3NrANGtExVVqeCkoBMH6Sxe4fftGSufbFp5eFTBzcuDpmWfbi3rZWHp/V4liALh2sjBg/tgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

From: Peng Fan <peng.fan@nxp.com>

Update SMMU reg size to 0x40000, because MMU-700 TCU occupies 4 pages with
each page 64KB and the last page is reserved.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd0fe80ea244feff4469e536321b1c..28b19a47a59daaff308fecce6e7b9ffe14133f74 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1761,7 +1761,7 @@ aips4: bus@49000000 {
 
 			smmu: iommu@490d0000 {
 				compatible = "arm,smmu-v3";
-				reg = <0x490d0000 0x100000>;
+				reg = <0x490d0000 0x40000>;
 				interrupts = <GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
 					     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
 					     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>,

-- 
2.37.1

