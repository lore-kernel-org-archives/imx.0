Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02683A4520
	for <imx@lists.linux.dev>; Fri, 29 May 2026 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040085; cv=fail; b=MvYUVkh4NJwXRAj5dmvD8MbOxkE5B/zoQFL+rlJRZ/7wikLoBWGyREWTIRbkAWaUparetE5Sb/Q0b9PaOswCDVGLdtHdry7jTHTbe7mcZbkfDFvqOyTzyWQjMdQgzmrcTMdKyLv+xmJDBWK5msEQK1XWlXksmAb0epVyW9Ukw5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040085; c=relaxed/simple;
	bh=pG62XA85jKUOMumXsvS4WV+g1fKRlfpp03rS1vyE3Ag=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=f5pKk+UZQOaVG6Y4wLRGphSiUjTKAWg/WyK4DIl4uaunfTenLHwc0NTIDNyUofWWtPMlRNogkervPwW7i3MtTLHRyiFZ/H6cp2ZVIvNnw8NVtvu+flnYdPqRnm0Ho9nLQHWlW/fyT8vevGhGBvwrLpjoSG2MG1fykGQoAl9nmhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JzFR503L; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JzFR503L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmSFBbu2gj/AnlVgh+1jIU6VA7fyDk16adpjWNpI0nVbtrwjyPESTCU+s8wermeYZo+FAn+BTfW9FoS0tW2DwRn9i19HTmI6PsevnJqjTjyc9vUG+lMduudKXpnBnkOcrORb6uxG63ZU+1cMS4Vd7d6sKJZTuwPB60IkE6UxlV20d6w0VEuFLSEzbh0YlMw7h6DjmUfUjNOKuexAxFp5iOak5kcmFEP7ecEjkNE2IXuIJyM6qNGoQoHiAy/UJNmDrGuHm/91ZGy+eJeu2B8qOMhhDsh2Q5Ny9OnBRk4b+6QhdVc0OfocVIVdt8vA9S90i8b7EN2yE7WAzIcbRKWJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYFw6W5Xxrcpld/yNA3aWA27tNFzbyVObiXzFRg2wEM=;
 b=wNRmZNzPRUPh8vvN0UjBGibNuNMBo76/PqyycIURUTKvyCxHs54MmWRB2jNXw4jDtc6m/IxM6AuxpVO+cqIMhdOLXGP6f3iBoS0hW4rVrDWs/2ukh4p+qQfr+UziVzGUbghNIbHr1VBRZRaGt+sCbjlnxAqTs9n+2JbkOsudhkjEqw5wgQcgBKUHp+lMI7EG1KI55y6aPsQ/zgK/ZOqogrX4ugmtzrQ6V1q7Amkl+He1cMBPuCABqr2EN592uPxSWrcWTDnpxoOzhXpIZJW5voa1LnV7ktSXplKiZZFWT7eRMR58wmqlypyW3qwMsTv4++q9R0uiylJfQ/llz3wyJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYFw6W5Xxrcpld/yNA3aWA27tNFzbyVObiXzFRg2wEM=;
 b=JzFR503LjaET+PdZF4918qhy/WgYO4kKitEqHlt3SNzzYGyp2Z3r0R/725uAGHnh6ozZMGD/rIVFhSjCiAK1DqyX4VlvjxZZyiXkfnNugzI5qm3u7tzc0Ah0snk9Q1hZPecwfNwA+Hr7GfiIDuH+29mT/AYhDRDb84WVKlLWSa14cEhwALymXVhlWxeUD+2iDJjujqlhshVHG4BSBxedMeVMiftEi0vZxHhK6wOi301Gzw/Sei+ItXehSUluv5yPlMazCpTGtpv330qD3bgaBLm3I25q1dzx0lQszO2+uu9xuDEdBWmz97po7Xv0ukB23FHdqsKrldJLR0WfKMZsHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:34:39 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:34:39 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v4 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Fri, 29 May 2026 09:34:35 +0200
Message-Id: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: a77fd38a-cba9-467b-52e5-08debd54bd94
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
 Adl+YxFrOtxu7/XsdLSRHrAjOTqdzkSlCjvc+TKLrRRe5AwV3K9+13HDZkZEtSQIZfv0n6aM8FNBpmiHYPBbS2CgGbyj6MbWJ1935FkYDpJpqIsy6nuoZjp6wmgGKMiUA/433Mg4NCSkd34+87HG/DFKI/l5WXh7RuZLtPWkOn+Y0qXMi61pKxPk/+slnG/UUe5YQQdrR3nYUM1XP7C2wGS/1D/TZjXDFQlfV7OINo8sExSUuFL9i6a1a4+/+Sn3U3p+0IHdXxuuB2sepOBolcibyPjRCzvnxq2dd4ULr76WpdpeWl39Z34o966HtG16gDSbUM5K1uS+O2Z7Ng9DcNgsAZgZbwiQd6SlSpJqmijWH9Tqr44WmK+cY806WYeWvo3fcuYhRpE7UndmlX17RLUu/g4vDVXTSm5lBU3gy+xyJlYOi3KcNfCIkHuxpRiFTImMG1jKYP0xpyyXS0XlS2t5m9c9ntySaMGR19y/SDLnJVw3/DYIXT7pLWUviRPm76XNEXPygL9MIeLDi97osLO3ZaebKgnFCeKUI9olsmvtQLtjbERv5lKfJXjjtpTqI9Fo7CFIS6g1fMKBwzCZ6/uSPMKkdvXdRCs1uL+/xEKzFmv/SAqPYGLr6CfshPVcNt4bZRNlXvgyiTvGmkgGuKd+oaYlBjxgg6rUuHqUX5zjrQXjO9eDI16sPjauPKkQ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MCs5RVIyYlFGa3ZCVVI1dUlBL2hiRjUrQ2hrNmlvYWlJNHBNaHNQaDcvMm02?=
 =?utf-8?B?dkFQOTRkcElrR0VKdzJ4UFlsNWNiYjdHelpFVXJTM05jUEM0ak1ucWdQWG1M?=
 =?utf-8?B?cEYyNzhRcG4zc1NvS3psUmdVa0lqUFRnWk5NVUVQVlYwTWhpRFJ6Z0xsblFC?=
 =?utf-8?B?SFEyMkwyK3laS2VEdHdMNEJPVzRhSEpRWmJzTWlZQWl3SURWazJPZUxPNjk5?=
 =?utf-8?B?ZEJ0Ukh0QjJtUmJuZXBsT0ppcTd0T2RPOXpMTy8yQytTblVVUFR1ZzdKeDNJ?=
 =?utf-8?B?VUVSVUtnNkdXUWw2Vng0ekw1Y0tleDBqT3VkRUdvL2sxaVp5YXF0alNYZm1Z?=
 =?utf-8?B?U0VCYUpsQ0NhSG5LWlZMV2xQaThDQVlrME5QZ05MOVh6dkNOUWtrTHlISnNE?=
 =?utf-8?B?MVNEVVQzWXVpdFhQWkZKQitIdkQ5d1c1SU9uSitXalZWbVpWZ3ZHbWlCZEtv?=
 =?utf-8?B?TmtWVEVzVW96U1RsaFJOeGhYSldla3NOT0NZZ0Z2bEZuZGdEMlJtM0owbkEz?=
 =?utf-8?B?cW5KVUpock4vdUNiZFVpeDdEM3Bxa2xCdXlzQ2xvMnl6RnVsMU5MWDZkQ1I0?=
 =?utf-8?B?RlpSNTV5cXJCS3ZydDdvd2RoZGZlZE1PVVBDZGIwWFc3YXordFArSWJURnpn?=
 =?utf-8?B?NWMrQnI0Vnp3Wm5XWWxHYTg3cStFR0VLQzRHU3JISGQrZDNCSzJhdTZOeUg4?=
 =?utf-8?B?aVREVkxJb1RBQ2lxSHRPNldmeVR2S2d1WXZNQi96Tm8vU0d6NUlSV2FWYUhr?=
 =?utf-8?B?SWo0Y3R1eG80WFZ2UXlJV3ZrSXpIcnJqRnhmRmxPUkUzUFZ5YjBxQXVnd29G?=
 =?utf-8?B?RVFLZkdoaU1lejdPM0VTcjZKTGhvS1M4OU1KckFQZ3BESzZmU2Q2b25VdUd1?=
 =?utf-8?B?MlBocHRaclBLcHlJUHJObnNldk9IQjZxVjlGN0Mvdm8zZXVsSWVLbnZzQUpp?=
 =?utf-8?B?eDRLZ2xrRlloSERvdXdjWmtPKytVT2h3ZkM2T0tJMGN5c3ViYjB4T3M1OFpT?=
 =?utf-8?B?ejNXSE9HdCs1MS8wa29MZ295WHQ3dXRTRCtobGJLMitzUmdGcmlaZThiellt?=
 =?utf-8?B?R3c5czRmc2RhdnhVVXkvbVFIZkdDcWdzUnB6K05hMWZWZE8zQWRTVUo1a1g4?=
 =?utf-8?B?bnRwOU5VTUpHNWNHVER5K0YycjVpRzFEYnVRYnpDMDZ0VmZja1JXQU5PREZK?=
 =?utf-8?B?VElBaUhsNkFzSkswMGVaOTlNS1FWeGFVdmRKTEFwUGJ1UUdxRlF4SDJvZ1NG?=
 =?utf-8?B?a0k5WUJkVFdGM1pxYXNiZlNYdU90VHluU2trblo3MXNuQmdWNDBqMkhTU1FT?=
 =?utf-8?B?OUlOWEc3Nk1iTVBjN1hwTTVvaEtmNGpIRjBBcmt2QXVGenNlZEFZajFhcU93?=
 =?utf-8?B?ZDdQRzU0RStvbXMrY2JYM004MUx5ellxZ05PNFVMakJYeFNaU05mdW1iUVkv?=
 =?utf-8?B?TmR0SzdNWHY3ZWJSaXY4OGxqN21GcXZ1dlk1RGZLdVMyczZRc0FjVFZtTHox?=
 =?utf-8?B?eHk1dU02TzhwRHBOUUUxd2xpYXJRNldHTnpnSG1vWGRnQnFLY2NobVZ6YkQy?=
 =?utf-8?B?OUYyL3V0MlRXdWNUNWJyVlpQdTdLQ0dKT1hSVlZZd3FHcUprZzNVZ0dDR2Zs?=
 =?utf-8?B?NGhoeG9Mc0Z6WG1ZbXFzeDVVZldWS3luQUhrOUdLWXlpOWdHM01jQXRJZ0Zs?=
 =?utf-8?B?d0VYZHV3Vi9nb1ZJaVp1YXBGdys5NlV4NytnV0IrZVRQSWI2WXNPTnpsQStm?=
 =?utf-8?B?MHhYL0RRTjhKRVQ5YnlhVTJJY3ZmMEQ4VDFlRUpFdS9mTVlGMVprTExXNENU?=
 =?utf-8?B?aWZtc0E3ZFRyWkxZL3craG05L1hvbTNEb0w1TmRFSkZVeEhUMXE2eTRNaGxn?=
 =?utf-8?B?MFU3Uk1obXhHNDgzN2Irby8zZmJ5SFBqSTVPeXdvaHp2ZHpYSnlmdGpQRWFY?=
 =?utf-8?B?VVJCSHNxK0IzdXJrMWFQa3MzUWRnSVYwV0szMDMzREcwcnRnUUdKbzFLVDZ1?=
 =?utf-8?B?UmRleGg1VTdKTFlaTzNhWnNRMDZQeHFwd3g4c24rajN1bkJYUDh0d2dGRzBu?=
 =?utf-8?B?QU9aS1hyOGtnTytSaWRUUEFoRzczMVRuajlrZmxmaUFKbGt3QkVDOVQ0QUgy?=
 =?utf-8?B?Q1NKWDNab0R0UFBXTHFocEM2NWQzdzZmUmgweVE4YmhNSEU1KzJydTluaWNQ?=
 =?utf-8?B?WFdzRkYvMHUzMk9hZXVKcER5N1dadVFndllKUG0zZmdlTWMzV1JZQ2NkeXlM?=
 =?utf-8?B?V2F2bnhqb0pLK2JMTXU2aEY1Q050RUdYSDZqNEtQeDBIUmFVNEhrMmxQMHV1?=
 =?utf-8?B?WmN4ckhHYURySnprMlNaQjNWM2lDWDFZc0tUZnVBcG5LM3hiUUVtbmlxYVM4?=
 =?utf-8?Q?C2cA1KvZfvdsUvDlHxNQ3i0Ms0gxSWHHBAVy1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77fd38a-cba9-467b-52e5-08debd54bd94
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:34:39.0271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+tPRGdAeyVOxIUwLhL2fC94l8xjn1a2bhYVJvAk7GBdgcJ7fj+ij/6IZnFII2bFCQ+STk4dEZvkGQ8nYD7CAAaQqeO4spSEF3snkf/fS5ivNVEvlnYGINM8Y0LTjE34
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v4 -> v3:
- fix indentantions again

v3 -> v2:
- remove vendor internal issue tracker

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

