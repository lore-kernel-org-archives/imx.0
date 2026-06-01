Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE87387590
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347544; cv=fail; b=Mw/RpTqMfhNTTJob293f8EXITNYLhei92EQC6ffd/VayoIiDeBjG/iAL2tYE1GUEVQSJrpP8cMW6G1oItfm0AH8ce/JfDaXW2XHLO3/AL4qbRIIDsQbjnQXRMnc3oeIG0679GnaQwk3TPx+KR/BuK9srrTxXRaTkGNsxwomxsng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347544; c=relaxed/simple;
	bh=wOSk8Ca1yRbrUlyrFIDePl5+4bxKmG63db1CStavyio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g0t0/FaCsP4iT1qlgfJkrFw671cc6iWcjHnckpnjipL6Ele5TDXkLLWFr45Ym/tUxZuyFSJNn7eAhiOFh+BN81VHxWHwUCiILcoJAZKqwHcaEqUie0utbU+tbC7oDPe3RACqiSzrVkmbsFKE8TqSjH1FJQTViE3FMhVqCdMX++4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ChUo/LDt; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ChUo/LDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/sGfZVfeANK2bT+ruGdox/JYipQ4Dv+sOmxJH39CSIOGVK11ntWdT+pm3HccEXTsJcrtvBevrZjuu5FhdXcpahShYmBW3LYdAdn/NvmhwHGbc5jUps609AwcPnE2B40Ni0FyhX2jfOZik/acyWsrTmgyth4QpKcFcCY/qGOACwgnG1bjI1myRx2fmq+SEHW+kfFLrSZmhChgfOStZ1pISwgYkst3fFBQCVRTPadFys0XPUovFquo3KhP/vTeL0uaCSpRQX1Wp+KGoYG42uTCz8Uj+loj226SstZMjQSE8CXwxtuZSpFWnkQI0HwH0dqyz3E8CoMGHs8WluaH+etbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGYxJCjdF95DuNMbi/6jgnY885dOXC0b0B9T4ierqks=;
 b=vMWj/b0W8H5pUTT/yAntWJM15WxuBClXgDY+42tNJR/OLGdwXWnpV46Om3md+vIA+ImUZZIDU6pn3+HZ57mhdwdYBbFMpalqlJb614ffq33LSZ2i+T5HhUihMmfJl/hsh5EDTVGDuBtmT8Jvb22t9npgU1vtjBTi7VVHWrj6AnhziZyJXyVJRRcZfx39CPE5SaPljVtDSFrKRgfjes8MUJJU0d/Pf20Q259y38t1FBfJ/BfFm9hiAve74coLhj/xHgeBV/AnxX6Cte9cvi4CVXA0RLrV/+gv56yizgGM5xhDM4c9+eG1gGrqa7DoSPlqvYSJpXxrpZ4agnGEnbezMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGYxJCjdF95DuNMbi/6jgnY885dOXC0b0B9T4ierqks=;
 b=ChUo/LDtu3H59B7hzEIleUcg66EZdBJaoXBTdRDpA9VbGKMrl/IAMQsPJLP8WDvR1DgTAUSYTddjhfWEpid/17j5g75NAOWlajCk0gkf12JZNB+XrNT1Lo08Ds0bcLwur4UHBP1bJ62MMgsn65M0o0idmXmudPOVCwZTiMxHqn94pWzYoR2+zSCundYtO3QT3DYuyd8Rai9dEq5eZvGQJ5w17U4acWzIftdV0LkGbQuPeYfQ6IoZA4Jtt1hcisyVJfv+XrgTuWQWlpDj8EcvfE4URiWJUYUllrfSUJZlPrlDH7SrGsU2jx00WJzxoXFMiCcdlbLwoKOgkQYQWwU43Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12079.eurprd04.prod.outlook.com (2603:10a6:800:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:58:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 20:58:58 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
Date: Mon,  1 Jun 2026 16:58:50 -0400
Message-ID: <178034752170.574725.4565114987223878453.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528220550.34891-1-stefano.r@variscite.com>
References: <20260528220550.34891-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12079:EE_
X-MS-Office365-Filtering-Correlation-Id: 143d6231-52cb-4526-19c6-08dec02099d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 ZF5wxbB/y8HvaY1q6PuqiGQe5q+fptEAHqwiiBU+tELdRNZKl/PxaXs9ek3eFXwY7DK97qbtSRJRsXrqAIaEhhyl91TQOBfIEVIe8iTgWCme1xe7sJMTlz3T7GNxaq1dN2mt8kt/1RspFz/kybxQ1ZmeHkXR/AvikPhD/yTaNie3EVGx1FC5gY42yO1Cs4EtHBi5CbJbowOrZd2CHi9t2sieeJTGN7PXL01ZKq9JQMyLYs0SAgITBOlj44BSxSOyaE4eNnMMA6OMihUVaMPXw8mL7XyBbwVDZsWqVsUvh01v6fDTYcpLfmFfqRVHwjzC4GlA2zdswzozkogNXghYT1WW76DGe4QJKjVaMZhLqMCspyFRfJFTWBYMy/M9hPIE4O7a9e9lMsc8FDkxuu+vEfI5PB5t6QIKvO+brAONW9UZTiqFUJx4JhrOX6PSLqwGsFn2iarOSZRa4r3ibBk+yAYs6+PQlC4W678p7cx5VvAz/7rPpYQHUhOQbNo6MObDQqGJPgw1qSJ4ntiWXGYBVuy+SgEK2zU3/YYkf7Qy+RjjyvIser5uaZpTw+OWJzC1az90/rJNGIr9Mi59WPeqP1HmPoHWGF/78lVakvSijHAbOaTmlzGSuGOrNdykmWS6ADqSpwE2t5MskrIt9rb/alx1p1Sba5FQNEd3fm5uz8cRFABwrllPoI/VLDKVZQMD
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RTMrRm9TVW5wbmZ6YmNZak5CempJTldSOWh1K0FGaENtT1FaZlVhVkJpVDAr?=
 =?utf-8?B?c2puOC9ISlUydmdGeStJZDVFY3hZUDAvRTdTejl1bHR6a0c3ZVpGM092ZWFD?=
 =?utf-8?B?VXVHbEY3MUN3WFd6TzFIQ2JYUkg2VnpWKzZBZkFBSlpXZGhRUEFyTWkvWmlQ?=
 =?utf-8?B?U2pSRFZTSzhYMGM4NHY3UitGUW1UcnloUHpUbGs4VEpOa0plWUtDNWZtSGta?=
 =?utf-8?B?djFXZUlwSC9LS3FWVUk5UHIvWXFvWUIwVFpNTnEreUtxTUhqb1g5eFNzaldr?=
 =?utf-8?B?WWx4dk9mZXYzTzl2QklLUVIvOFBlM0R5YzJKN2pOQUZTNFRUdTFrWFdGWGcr?=
 =?utf-8?B?TjJqcTlkSHl4YkRHdzJSKzFUVHpLOS8rWWc1ZUxZTkw1QTUvWndZa3RUcWJ0?=
 =?utf-8?B?SXhSTjluNTVhYTQ1U0VZbXcrZ2RLaGZZc29KbE9SK1dkMU8vMFZwcmI1SWRX?=
 =?utf-8?B?ZDI0OVY0YWVqRUZ1L25iL3F3L2F5TEhyUUdEQlh4OXBEZ3htVmFEdVNacm5p?=
 =?utf-8?B?QnNSRUttd3QvNExoREdJRm1BVnZDRlB2b2J1T0pSTlZkK0dMM2FFOWMwOHZ6?=
 =?utf-8?B?dlB5SXR3VE4wakFORENVRTVHWDFDc2hTTUthMk5vMXZoeXBzMWhZd2YyMjBW?=
 =?utf-8?B?V21ZQXg2dzNWZkpzeXNabzZwbUlQanZ5Rm13SURzYjNWU0VsdkVaMDlHb1hW?=
 =?utf-8?B?TE13UzRvNGJ5UlhCbUxXdG5hTmE0OGJPRHpqZ1RGYWxoYjRVVUpXbW9iYzhY?=
 =?utf-8?B?K3FDblltbXFHTUpWUUNoY3pMdmNaUTVENEFQNTJ6WW4yeUQ5OE4zOXpkenJI?=
 =?utf-8?B?WWRpV2xXNFd1ZFRUZExJc1FsdTVEZGIzdXNHNmJyTHpXMGhoMFRGNWVodDJ3?=
 =?utf-8?B?M1EvRmpvVk9TejVVTkprMStUZjZiR21Xdk5YLzRCT0RBYnc2SWxKUFFhY1Bw?=
 =?utf-8?B?a2x5K0w0dkloaS9WZlhxVnVlaXdxVERGTFg2bzZzUktCRXpsRFc4QVFzQnFZ?=
 =?utf-8?B?SzhkWjdOQ1Y0NEtYNlhxY0piYmNESjNMQXRZMjM1QW12SDRDYTJOWG1hZzhz?=
 =?utf-8?B?cmFvRHlZdWRITTNVZXd0ZUZFV0tyWFBBWkJ0VHdHdm5NL3MvaEcvVnhmYTRn?=
 =?utf-8?B?MjZ2blRsWm0wc0pGeGlzbzBKa283NCtZa3dEUkR0b3pjRlVrMVJ2WGpnelJp?=
 =?utf-8?B?dnErRGRzTzk0UHFrY0RIb1hTbm9vdUJRYnlQam9OMmJCV09JUC9RR2dDdndx?=
 =?utf-8?B?aUtuWCtDcjk0TDJHZUdqclpYeXc4ckkrMnBpdkdPQlZVZkp6YU5KbFFZRnpC?=
 =?utf-8?B?SkNoekNwMDFRdnNNOUNmeTlPenE5UUg0UFR2a0pvRGFRTkFlRE9sSGVHdFIr?=
 =?utf-8?B?MzZlUGZOOENvanZ1Y1luaUxUbXFYS1dHdFdJMElXUXVKOUM1WDBkRlBvaDIw?=
 =?utf-8?B?ZG5UQ0twOXZyL2pqRDNqTGYvSG1KeEM1WW00aEttc0VTSUhranFLeXl4NFpS?=
 =?utf-8?B?MTF5S0p0a1k0UTAxUGZMc1R2V0RiRW9BTTVINlZlb2FGR2VTS0JXZ3Nucyta?=
 =?utf-8?B?VVl1Rzh3c2lKOHNOVFdWcHUwQmxjekJhczlDMjU1ZExqN01pbllBKy9md05I?=
 =?utf-8?B?RnlOWkFHZHE3VXFVRlBVZWNqZUR0V1hlaitMdytjYy9maWtERm9ub096NTRZ?=
 =?utf-8?B?K2ROdVJHZlVUSkFFUEtvYmxLb01tekRkRWxyVzBsSzJuTkpzdzlFaDdvNTB0?=
 =?utf-8?B?Z2tSeE02WHZZNExtV2RXMUNOM01aRVh6SjJJalRFNk83NnFpNWJwek1hcEtH?=
 =?utf-8?B?d3FPV2Jab2FBRHlKYXdJTDNMY2FtU0ZiaEJPdzZ6VVdTRFlONkthV0FwczNI?=
 =?utf-8?B?Zm9PT1FwVXhlV3V5TWxtOGxYVFd4SEtoMWZ2QUZIMHZ0cmUxaGZpaFEzZUNP?=
 =?utf-8?B?T2dOdUJadVhyS0dtdHJFTjkwcE5kKys2SGhQSkRpbVgwR09kdkNYaGJzT0dI?=
 =?utf-8?B?S1oySWFoY1VBYjRwdnRwNWh1OHlxR3NRRGlBTHhvZS9vWlUzUkZ0ODJrQnl1?=
 =?utf-8?B?eGlBVXNHSGZHYTEzRFE0UDVaMU85Ym9NdnpSU05PM1diczdYcURzSjQwbmJM?=
 =?utf-8?B?bWV4MXIxeWowaFRXdWkyTTR2NzRaaC9sMDRoVGxCWmg5WFFxQzZsdTFVUW9C?=
 =?utf-8?B?dDJNUEtwQjFWQlB6QWNPaXRyZUJQckZHdFY0bFVZeFZYUGRDN0x5SEJiTFVn?=
 =?utf-8?B?L29mdjlNSXlPR3V5YmFDNXBGOWs3ZDBTY21UTGpZaGRIVmR5eGxNa2I2dmlJ?=
 =?utf-8?B?dWdtTVYycXA2aklyODNobGRVYnBhc0podGdtVldxejlpQmVTdllKV1RvM3Bh?=
 =?utf-8?Q?cuHhyQebsX6wfTAE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d6231-52cb-4526-19c6-08dec02099d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:58:58.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANSIQup86cMiDiw97nQUWa3YCBS7sylZuZVcwXMt1HRVMN+pxZ4I18POtBUsTr3Vs6YjRAZGu6DblvyO3/ZLSKUcnWRi0jnbWKHGUI8TapZa8bQGb7zcBPmagBRRoZck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12079

From: Frank Li <Frank.Li@nxp.com>


On Fri, 29 May 2026 00:05:50 +0200, Stefano Radaelli wrote:
> Add the reset GPIO for the TPM device on the Sonata carrier board and
> label the node accordingly.

Applied, thanks!

[1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
      commit: 821682642c519cb523206af1d04b58719aadefb0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
