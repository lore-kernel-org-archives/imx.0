Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353842BE8E
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171629; cv=fail; b=unZChWT+GVGkhLhQtUlzHFLJbKg07520sS3FajuyCdSzUJBZPYwlfxX9MrCTOPExlh//koHcG7AhuehtKl5JJGnyBmIYXhsbjh1r12hHQzAUUkT7WIVyrjA60M9tBz0Ipl0xzTxhlqhlxPhevV/qG7fPtsc/3fMYh5FfjysU6q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171629; c=relaxed/simple;
	bh=riJ03KmHepcuLM0GkLXnnuFQb2orO3V3tnEQqufqn5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdyxkZ3PCQmF1KXhKbDp0Tvn6Xvn79sebzhstOmnU7Ti6sB9qzV9CjvHdHwOEPJqv6sG+Vc/gnhoA69RO09ReMoZoFEq/JzCIWh6ElTOs6ckSJQDx8Holh8pCizxWFxyOCOTseQc7nO1LvJZuHMCY40fzgVa5RMr0S8b1Dr6rBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R2BzN1m0; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R2BzN1m0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/P1xxHtyB62hBdpdfc7llCnYk24EYQF7jUoLAJnDxSoisnIjG6Sjc6/qBi7Fi0uSNQVBGNSboOhhgi0heTae3V0gfPKRivLy5xy36ALgSmPrL+q7Hw2BV/rHXBhs8/XZssenYc0zFSdtWCIpwPkv8RvS024GAA5hyiOI9A86HiGbBeetAvSkDFd26HkKPCrGsUXcoMu2HNsFFk2We0TvDZ1ZV8r5Aw7umNE4PXNaJLpshy7gtLuXRNllvnCVreuQSayD4SMMB8Uwg6L1NQJBb1k/FygWV834gk3zaYn+Y+R0rjEk4R/kZ5++fpMgvgxGja+J+B4mM0INUXu1DxKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv7+zosoBoC4GP4GH9ib4hA0NsMyg9JRA4JDNo+SPXM=;
 b=cMxViF0ihRPirbDrX8NVirH0l/mzcqUS0uVYhhZrBgWUZLfHaN2u8J4iRirSEM3+JciPtKqTxfIz3lkYNMKSJeDky/7H69jgJMPLOnYjjtvqqgtWDdJeK5ObKSEcorx7WaYznwbr1AHlFWX26HajLm5u057L7WsIqd9ltB2utq1Or9TbvonoTnA0eGPsC+dfZTR965yjcpcxWlnRl5XNG9W58wEOtVJizu7mRFiiyP4mgqzrE6F3g220KL6IlNYBZcxNl7ySMsHL0qqfi5xaik5BGSYk3I7J2ngC22Sjwaf9RaRLl3gDWJ3zZMbiah0mF+ZO4RXPGZH7R/sHM0GBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv7+zosoBoC4GP4GH9ib4hA0NsMyg9JRA4JDNo+SPXM=;
 b=R2BzN1m04ZdVzk5gqowoJPMQqiPJ1sQv3MR6uMf9gKPA35KMXkxCtlf4flif+x7c37Y7MQv/Kjd4YXKZZbNXykdTyoYt9RprBzMh4xSSjrsIFjC6HiXXWCu+QZ9UmMSUHWx1oq55MGpoPhXJ69eshjTWhde4Sa51578UX6s8tPYxlJOyvvAGKCcB6XOBkUzXRtjA/D8jIq5nhiz2O37ofuMTskIzBr1ZXopHD27q6YtYV3sG2GuVif2Va0iAQ8rsicWpUSAo4lLhUyCSc0SKQIRo2wByHrImK0ZSPz7qrfaL68amA+Bj1AplwfUjxT/jNseikf/sPz9WtWuF83BWgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:00:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:00:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add remoteproc support for i.MX EVKs
Date: Mon, 27 Jul 2026 13:00:16 -0400
Message-ID: <178517159495.2539725.6188983744595268122.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
References: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 638204a3-e9dc-4480-6cda-08deec008d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G31XfVLxFIfVm/Qrcsv/FKlVB69LfFOalkkvAQB5scYdwOdcjkkHWiIw1ItGqm3h9QBySl89zbicHtvpCawVOMdlRPqfbtAXZBiSia/PdIq13zezj65LtttVu2D0YqAKNxs7Xa1nhkQQoYbL0mTo8eqHNUzzGA8pORGhHyg06pfwms59B5/9Cvh8l8BUHmFIrIEmjWIHMPj3woMraJCIgzfT+E4/c8wSK/ocwIj77mrElZP0WLxRljZj6soic4UgrVMXQJCacW0TJbsrSfInd/XS3EXNm6+UfkWNsCNvk5yyCrkqAo0ZzsM7Cewfa5wimDt6FNTdk0TmoChzXPLdhgzUyRYqCNFKKh5sWhYrOMtNsHP+KMK72cQjR/eObm546DEDUL6p2MPvXaspBjXbAC7Gf1fvj3Di3xNBO+gLODzGB+ekbalxZN0s/GR53yuOLd0h3e1sRwZZKvQGmba9QzHz2zjSr+Z81HTF8cJ/2NnX6IP++qaaRrrFI5OTPWPWB66VE/8dcN9F3H0qR1r9pCCHEbrnX56fIEVqip8K3Q4vKUvd+6eOJ4/U533Em7aebhiF8EngoCiHpU7fgdRNNB5RaqPM8jQv8iqFsvIgmN6vfIZovxgU4Lpca43pHJ2AEaVocefSMzUuN73WcLgn3ouskDh+t/99O7zQd+JS7q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDY4Z3Y5VTlTdWhWOEhDdEd0aHpSdkIvdWVEZWc4T0VqWUgwbm1kV3JOMC9J?=
 =?utf-8?B?dlhaaTBCMGI0czI2c01FRVF4bXpQTkZ0bWNTdkpHRERPdWVldDJkSEdaL0Nm?=
 =?utf-8?B?RVVsYVhNU1FhNnBtQmQzdmxYTlkxd0pZYmNCVHJSMWh4NkdGQmhjcFk0S2wz?=
 =?utf-8?B?MkJJblduU3NXalJySzlXaG0wcEU4RW1rQnU3ck5qL2tYeFRLb0JmVUV2bjVh?=
 =?utf-8?B?ZklMWkw2NnhLT3BQOFQ3aDl5bGVmVDREQkJkK015aXZ5b0VFa1RxQnhLM3pQ?=
 =?utf-8?B?SU0rNExmRGpEVk0yMVZ5b0NKOGxDaThheko1Z2FTTTlzWFRKcTB0VmtIRDYz?=
 =?utf-8?B?cTRadHhoY3Y1Q1hYbG5uRVQ2ankvRkdsTzdWemxIVmRucnNRdkRVUXhOaElY?=
 =?utf-8?B?Zkg1Um1mNmhnY2R0eHJiei9hbU1GSThFdkM1VFZ3Rkd3ZUFEdEgrNmhuSmQ4?=
 =?utf-8?B?K3N2V0t0TWQxNjRTL0dRMy9NbnIrM0NwUEdURXpnRWVhdTdKTmh6MjY4SXlF?=
 =?utf-8?B?WlJRWnJiUGhFcXZpWjdmbVlCelhHOVFXZ0MrWUh6NTFrb1ZORUUxV01iSGhX?=
 =?utf-8?B?dXhBc3dubUxaczBKTFRRdmI3aTYwT3hoT3JVc3RKQ0p3NEFQLzNYcWJ2eGFX?=
 =?utf-8?B?bUFrcmhRYjh2QWlGUUdEU1BEU2RCYkIzY0x3QVgrSU4ydWgvQ25tWEFVbjNG?=
 =?utf-8?B?MGdNSGlRZkhERjdjVVV1WVpIUDg0NnkxdVZkRzNONjljbS9VR2txU2x2NjdM?=
 =?utf-8?B?ZkJVZHJ0QnJ0bzB1dW4rdk1ZejM0NDB0TjhFNzRnaFZ0b3k2OENHRndnaHFY?=
 =?utf-8?B?bkI3cXNTSUhKQldvcFo3QjdiMkJUQTFISjltZ3l0Rm81Z0p3Tm82bXdyRlVa?=
 =?utf-8?B?eTdjcHRNaXFQUFRwMmtUVGxmYTROVGsrbXFuRTRBWGhqZy82WW55S0JLRFFG?=
 =?utf-8?B?aTdVWTV5cFY3QkJ0TUZuMXdhTE5pQjBYbEVORzR2YVVESExSdXI0VFBFNEpo?=
 =?utf-8?B?Y0IxZzhOMkFlU2l2RDNtejRKNC9ESmhIRlRnUEJ2NHpwVTIzQWFOK3F5REs0?=
 =?utf-8?B?MC9idUFHUnpzSm1lZ3MvNk9jTHRRK0hPMkF5azJFdHlheTV0YkJkQ1VTaDBu?=
 =?utf-8?B?UzROdHN6MHdRSWxSUWVPdkZQM2VmNWc3ajluYmJ4cEZPci9nUEpreFVYOG9h?=
 =?utf-8?B?U1NUSTJxbTliNDRQRWRKZm1NK2srRzZTWHduUkhlcHoyd1dQVkp2dCtacmxt?=
 =?utf-8?B?VlU4Sm1Qa1JVTHR4a1dyMnc5UExCNmR1c045T1QwM1J0ZERnTlNuRitOdDZk?=
 =?utf-8?B?dk80aGJUQUIvM011L1Juak1TV0krdUxRMk5CNkw0RHcwdWQ1dGNBYUZyWGpq?=
 =?utf-8?B?L3R6eGNQc2EvSWNiTHFhYmVKalUxSSs5WWhDK2tuU1VEOVZkVUlWeThtSnk2?=
 =?utf-8?B?TExJNDZBVU5nUDlsSHpIeHRDS2xQb0lhRVJCckFJak9CNUoxTmNZb0ZkUkRk?=
 =?utf-8?B?SmowNzA2NFJNTGVjNjNFQTJTdDhhRXVDZ0tZbWZCVTRPME9tRVZFR3AzL0VM?=
 =?utf-8?B?U3ZyZ0gyZDhKc3ZrenRvQ3M1eVVmWVk5SXBmK2ovZ29IODdReFZGRzFjSWxt?=
 =?utf-8?B?TExmYlRIQlVyaGpBS3Bjbml5Nk1mWE5kZzFlQTlDQ1B2cytBTlVSWGUyWlQ3?=
 =?utf-8?B?VWdyeTEvTEZ5TnFzOXhVOEV0OWpINjFMUmNua3lDSk04REpyYzQ5ZDV2OHFp?=
 =?utf-8?B?T245Y0J6YlZJV2s5OGxPNCtKaGs3OEE3Z3l2SEFXSkhoVDNqSlFLa08rb3Ur?=
 =?utf-8?B?MmpBZHo5MUU0Mm9qUzk0Sk9KTjd6cUhxeUNqMzVmQ3FiNVR4ZC9hNksyRk9w?=
 =?utf-8?B?bkpNTFYyNmxuczVNc2IwNWJtMjc1UERCMW1qZHYyRGNXMFpCdFlmUld6bzR5?=
 =?utf-8?B?R0pMUXpra2hac2lyNW1JRjUrMDJMak9CNERUVUpzcms0R0FiVTNEdFpCbUVI?=
 =?utf-8?B?d1F2bktBUStpZHpHYUhWanZySmhVMldKbWFSY2V6MGZUTU5QNTBadEI0c1o4?=
 =?utf-8?B?d2JhaWh3eHRCTno0czBxd0Q2RkNhd1dUdTBlbzBsRnMwSUdQNSt1YzRva2d0?=
 =?utf-8?B?NmFvdDJDWk5XSW5NWFZ4NjI4WldzaCt0QUNmcWtTYWVvcmJ2c1FDVEswVGo0?=
 =?utf-8?B?dWNsbUxiZW8zMFVva0pFaXdyZmNldXFPTkk2RmJ2UXM5U3YxV0hIRTFZalVr?=
 =?utf-8?B?MHhET3drejdjTW5jM3NDWTJFMGw2WE1iWi9MaFRSMFpveCt6TFJreXZDMUJi?=
 =?utf-8?B?dExGRWRLRXlkR0F3RVNTVHdFQXdONTRXYW0zTWFjaXM5c2wzWVA3bHpqQ2w5?=
 =?utf-8?Q?YhotQsMcmrPW+BPA4WOr+0w6IyFfMoVFQK7mT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638204a3-e9dc-4480-6cda-08deec008d10
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:00:24.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XeUHccqeK1hLaCYbrD/OhC762lEFxgipwNf4JTrv2J90VjJEJcgHie+UVNZrmRhwnz4b/RyrG6pgaWuJ6NlAx0j7z4WdUG0kT92WwRn6OkrohgOxA0o+dQIeTywZJZ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803

From: Frank Li <Frank.Li@nxp.com>


On Fri, 24 Jul 2026 14:17:54 +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc node and reserved memory regions for the
> i.MX95, i.MX952 and i.MX943 EVK boards.
> 
> - Patch 1 adds CM7 support for imx95-19x19-evk
> - Patch 2 adds CM7 support for imx952-evk
> - Patch 3 adds CM7-0, CM7-1 and CM33S support for imx943-evk
> - Patch 4, update resource table address for i.MX8ULP-EVK
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
      commit: db8398bb31d740e621e3309e929a06adbc664f2f
[2/4] arm64: dts: imx952-evk: Add CM7 node and related memory nodes
      commit: 7d1f4e4f62a1b076fb91b708a2dc74432827c3d7
[3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
      commit: 89d93ad8afedfcbc8281d07f68b18829325d73ab
[4/4] arm64: dts: imx8ulp-evk: Update rpmsg resource table address
      commit: d93dce11f39aaf5c2b246e68f20d47b92e99d331

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
