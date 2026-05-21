Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233E3F8706
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390967; cv=fail; b=NFqwsMFZTs24+9d8W09PQIhUf7AL4fek17vlIJccqLaqv/bxjCYyhVlEk/9Jr3Lo3E+MiD/UVghWpHNvYRjJgQXgSQFxNKcEmYUMb3fYxiZ+1KJIV77Rvfni2PJnshD5qzIf0sixYamagG2RYYIwX9aXDaP2u6E23/GDpZ7FxPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390967; c=relaxed/simple;
	bh=0Iso18ACIpK1PmSynaSI86LD4PwVitTT1MEnl1N3VzE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=WP089kMf1hTbNtK3GcF7PsH44SxmCO9IXtm/HfXKRRfJyDwcyi5zeOEaYM4OYqBPfuW37YNdHpNVJEEZxoAOw9dhR5gREAX26sCU6gZWby2bLCYN46GdrrFeDuXtEHJsyk7eZNtZSz496JjMHQj3CZMDCOVbEnfxlu0uPC14pMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DF7sknrs; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DF7sknrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p81u//fSYM26PUzg4N6K8hCvNaa880okiICDGiCrs5JMgtNIxubZro2cbh56w2wuKuSBWonCCrgjAk8XiIHzhvBuag+WsA373BXOBCdptHZVQM6Udup+q+U8qnciiF6YPpM/1/C92BjsX7nN585ONRSbnBg7G8+/03/OGMTkHIJQlKCKlCoL9ErA495NgKq50/4xcGYJiQmIXKD1bGKUub26YGUA4M8h3RAaK1f8l7wqK8E2aMZONWyzZCkc4VbpaDSptm99IXDNI9w4nVEeKAhEYv1iW23foXSuQyrbAoGCPD2YAIF9tNp9pngfLwbhUl0d4qgXW2WE7uFRa9a27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ysHUHNPi1AJzR0znCY7exUnM6bGk2UipYGH584OAl0=;
 b=wJvuBt5FcMya2arDXmAkhbWEh3HcTk3UOFFyjRA2qWrgjEn3mIrG0CN+A41hyLF+30KUjyqEDe25l5S5dnN1ZYrBazCfoUdbZ+H6VwFfrqktBIDQvtLQh4x4uVCdJF2fvBNkao7HAGqSaZJr+ha+fZuBhosGKnB5Uj4pbwFDN3sv9Ukip1gUH50NmkN0SOqF2fBPdis09Bdz4R7PCDO1Wejk6bfSa0n7pvbmFuE+VUfm4HL47zXA18FJn6eOK9Gb3b7DaLSP5JNWqAhoGDhdmWozGTzINaWxui28VXc6o6eMfYvJKVQCjCZ7wFzTwthiPy8C84deoIi3Ff8iYfn1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ysHUHNPi1AJzR0znCY7exUnM6bGk2UipYGH584OAl0=;
 b=DF7sknrsmL5w5f7D8+QPnMcTGc3jRiLPsi0QzinsCEE97cMrOOmJqHffjzCyz5ZRCSVZSvnnp11EjFmqEpxq5rJChqmGMS+KUfp7QjvKH8Y2DxdSA2dlk/rupt9Z8oRTUmYBU+VRleq0FyEEFggtxBf2nj06PvJ0TwecB0jRPvFOJa335YH23lQd62yxor4lnuMk9ySgxXxfIuaEOy7KY91PZ05vM7JvaUSSHj0qyzHmJRnTVKT7EkAQ5Lr4bhhzZfEPFvs10j3zWUcrxJ522uy7hQ0cq3M53Ts35NtM7d/b9HtVClUObkHoo0aub9ffX+1RFUB3A1Yr899/ISe/og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:15:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:15:50 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v2 0/6] ARM: dts: cleanup some CHECK_DTBS warning for
 imx5/6 (round 2)
Date: Thu, 21 May 2026 15:15:38 -0400
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpZD2oC/33NSw6DIBSF4a2YOy4N0GC1o+6jMQQQ9SblETDWx
 rj3UpNOO/zP4DsbZJvQZrhVGyS7YMbgS/BTBWZSfrQE+9LAKa+pYIygW7mQ/ZxlRhefVr5U8uh
 HyQmj/cVchW6apoUCxGQHXA/80ZWeMM8hvY+vhX3XHyv+sQsjlGha62FgLVdU3P0azyY46PZ9/
 wCqmg2VwgAAAA==
X-Change-ID: 20260511-imx25_dts_simple_warning_2-10d3c75b8889
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=3075;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0Iso18ACIpK1PmSynaSI86LD4PwVitTT1MEnl1N3VzE=;
 b=j80NJAJx/0n4ocSIjYSyfO1SYC1EbaWDbroeS+7WB/dYnZZy42GOyDPvxDEJyT6U48CL/rclR
 05DRGJlMSEED47j4iuTaMPNbGAXegt1SCAlt6xWQ+J/4QzxDP01owGF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2940b2ae-90f8-4e3d-53dd-08deb76d5ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y3StYzChSLz4fzB3WORbp7mnLIEAv2O2WUi+tRYI25NfDpJNhWuso4dtz1c4zftzOAZ/lbnEN6C4LWWcA0aQTxaJ187Nv9Ox1FP/vJxFGMnhy4XQYWvFcRVFLcGiAhfyTT9MXUafROxrFYmBRocvaU4/Mivf2hLytq9pri7vbBVwYPHyMhg1hQC1oOfkJFUtRJxzeGl53fM/a+0dypmR17EM6unAe2G+neiQjxNdccG2ZmzSNjPONQsYYVaqN/P7UEDCg+2AhzIa/ofyuOYFIDH8bkqwBl2nvFBi+69xBTFXUjqCvpcnIl13q0EQXL0pWdpzn547yi2Lsz1wWyXPBexIlPscguNA+WdKU9NLhAZS5vLr9PBwod+lrcemcL0ClCN8iKgGbWIhw11AsxK4sX5Ypfvwo73YpjbOx8xXRrR3NNbARQ+6NeF+vUQtklGL1T7Gemq52sqQ5SrWk69R7xRf2qr62e847ukgq1uyveq83MW2qeTO5JQtsyHcGXd6FSsTw7b6lXyqUijulkctDOcZHsyDz0rUskShjSOnB4c945qd1s/Q069WrVb1UNsRv32UYikphSgXKMt0UdVMYpMlpekUp5KnXAWjmBMxYUyTkmEWUxUYVNAtrfiq2eHnSlr8QMauhuvZwXiSnCdKWLmOYbEeQO8Y9RAKN8IRwskCg9y7HrizXp+wS8dUOVKYpE7plznmBN7CnAFkhM+Iww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STQrWU56M2dRMUNjY1VQYjQvemhZa2xrT25kS3dUQmNodkhlQnB1WEl2c0RO?=
 =?utf-8?B?V01CTXduaXp2VXVMY3hUY1VMYWhmQzlyeVVxRmw1SlJmVmhEcEtXaU1IYjBB?=
 =?utf-8?B?Y2RadVMyYmgzUjI4UWxQTVNJMjFxMkpJV21LcHBsdEhPV3lQNDZyMEFsV2k5?=
 =?utf-8?B?ODJnMUdFWWpySS8zUTMrQ28vSGFLZWMwVlVOM0xUWnhwQ09NTjl4Z2lXTnkr?=
 =?utf-8?B?Zzk5TnZGaEFJeHlwMU9UTWNNcWtFU1pQWG8rZ1grYU1VS0JCaHMxbjQ2TmI5?=
 =?utf-8?B?V2piWUw1bnFCTWRhcCsrMUJHYlNKVURSdFIzMzYvRUdCZzJWSkgxS0VINFIw?=
 =?utf-8?B?ZnRrZWhDUzdMMTMyK3hHN3VTN1FsbmVRYlo0TjdodmlhWXcxcFU5RmxXc1VD?=
 =?utf-8?B?ZkRCcGpyQmVVbkRCMGpKb1U2dTJyNkJMUk1FR1ZMbFY4czMybFFJQTVOaTZB?=
 =?utf-8?B?UDA3VjEwZCtseDZrZ0w2dlFUOFM1akM1dENEN0VvaFhYQnVsMWRoK0UzK09p?=
 =?utf-8?B?ZnVpMTVJOFBGM2RlM0tGMUIyV1VaN1YxWnR1S3FqSVlxbjhydENia0hzR0Nt?=
 =?utf-8?B?dlluajZmMjVXS09zMThnbHpvcFJhbWNoVXd4d2JoYmVRbkdJaG9KRVpTQWpw?=
 =?utf-8?B?T0YvYlFtVGtIMHJxdzluR1U3OFFsTFVzSnA5RnphaktMRkxRNUZQRkNTZGxU?=
 =?utf-8?B?SmhBVnJDTVZoUGFHdWdHWG1vRUR2U2pCUVhWcjBBdExweEJrL1RMdHUyWFMz?=
 =?utf-8?B?OG9wa2xYcWRmNThLenBISEEzenRCMk5vTWc5MEYxUnNJbTFBMzZTV1hveUlK?=
 =?utf-8?B?aDVkWWFDeUF6em8vMjJlNXdRNTY1QS9HSHVKdFRyUUdiRHptL2M3b0ttTTZV?=
 =?utf-8?B?Z281UVE1eXlCdTZ0VGN1akthUkhqS1MzVkpzaVk3azMwbm5rTjN6ZDNKNkpF?=
 =?utf-8?B?a2V5bzRGT2xWelMrRFlHcXRFYzJlWGtxYTR3bVZMNDVqTEE4RVNBeGo0a0lJ?=
 =?utf-8?B?aEFlZ3ZVR3BrZzdmNHV3YmxQc2l0bE5HbEQ4UFd2QmtzamlOeS96MjMrT25u?=
 =?utf-8?B?MFNnYTkwYlo1K0l4NWcxbjJPRlQ2aGJrQ05TZXMyS2dnemp4RVg4cGdwY0ZZ?=
 =?utf-8?B?U1VJVWlUTGZySW9TQnpDNFZzeWxneFpRSWorMlhXTEgvUklnUTZVbzdTWWk4?=
 =?utf-8?B?R0U2N2pKckVkMktQdW9lUTBvWDU2a1FYS0I2L216Wi9TVHJ4SVVGL0pRRVky?=
 =?utf-8?B?RUpnMkljWitKT3REZXV5WDk4SkhIRTEyNVY0VENrcDlZdWdPa0J3dXA0MzZB?=
 =?utf-8?B?c2dZZ3A5cHdZQ3JWUExVNlNmYWd5dkNMT0NwT1ppcngzK2dyV2dKZXB0aHc4?=
 =?utf-8?B?Z0xqQnFlWXJzaEJFdUk4QUpSZXJVWlhJQnU1WWZMQjZEcC8wTkExVGVGTGhZ?=
 =?utf-8?B?YnVHbmMwK3o5aS8wWVZMWnNnaTIreG1vNDdSb0ZaQW5xa2dXMU5sN3NIdWcz?=
 =?utf-8?B?Mlo2aFZPcWNKYVF0bjVVMm1nZk04dVNoS3BqbDhrVjZ4R25nNk93enNEbU4y?=
 =?utf-8?B?SmZBQkZEa0tiaUpoNDhJdDZ2WkE0QlJYWHZCeGd0YUpKV3RQa3VIaVdpYjlN?=
 =?utf-8?B?YzdhclM1azJ1eEdCOFJFeXRMWlFsQmFUL25tKzh0ckV3d2R1UU42YmV5VjRD?=
 =?utf-8?B?aVhoUE9hblE1Y05Tbmt5dkIxUXZhbDJyR3plbUcrQ3ZEYXZ1bmlOVGNrSUpK?=
 =?utf-8?B?aVR0UVIwZWFBR2ZHeHpmSTJFUGc4ZVRBSWNGWFlJckV3Qm5lcGJ2bGZKQmNn?=
 =?utf-8?B?Z2ZlbThXd2t1dzViV3puUGY5YjBDZkl1ZHZsMGFyeWRWRFdxZzdKZGMyQkxi?=
 =?utf-8?B?U1pKL2JQUHcxZXd0SDJ6eVFldDkrSkh6eW1UZG9ISGZCeGNTMFFOdGIwQWNJ?=
 =?utf-8?B?RExOQXFkZnVIbm9RdkhpTFlOYldKZzBHYzVyNFQzaGZJWFBIZVFZaVdXZ256?=
 =?utf-8?B?RFVYZDY2QVZNb3RJVXdwa1VYYWdzNWU5RGQzWnA4VUhCM05CeGVmS1JjdS9G?=
 =?utf-8?B?bWxHTGs0MlpwTm44Y0EzVjc5ZUlLSm9COTZScm0vWDFjQjRaUjE5WTZocXJM?=
 =?utf-8?B?MUJHQU0wYWZKME40eU1ySTJKMGJpWmNxWWorZmhDOGl5bXRtL1FnbDlHQnp4?=
 =?utf-8?B?KzZOV0R5M2dHRkk2YW5menplYUNXc2NGT2xMMUFNN2s0cWpXWGxNUXV2Y3Ni?=
 =?utf-8?B?Wmg1QmxlSjNYNUNkdmR3OGdDd1puUXVUOGoySGkyakZWR1ZOWG1kUGJSdlo2?=
 =?utf-8?B?dUo4b1FxNDJFVC84d1hDeGFXMjdoNmxRd0lQdS9aWEVPRUszL2Fzd3p6UjlX?=
 =?utf-8?Q?Ovwft6SwyjDNdisxD174CYNjLajw/ieM40/W3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2940b2ae-90f8-4e3d-53dd-08deb76d5ecc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:15:50.5508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYZTsAjGikgZ7Xvpm4/m2g11xxQEIsJq7fkyQfraIb7rJcE2b6zShP58hiOZBP5EIyWnaKYyUgXcCkxfzMpG1GqF+vHZNWTTJ/UfjkV7NePlk05XKfnNkOheKIkPL/NY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

Cleanup CHECK_DTBS warning for imx_v6_v7_defconfig. (below 500 line warning
left) after apply pending binding doc patch.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- fix sashiko AI's feedback, detail see each patch's change log
- Link to v1: https://lore.kernel.org/r/20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com

---
Frank Li (6):
      ARM: dts: imx: add (power|vdd)-supply for related node
      ARM: dts: imx: remove redundant bus-width for video-mux
      ARM: dts: imx: Add bus-type for ov5642/ov5640
      ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
      ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with edt,edt-ft5206
      ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy-ieee802.3-c22

 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts            | 11 ++++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts            |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts                 |  2 ++
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts              |  4 ----
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts              |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi        |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi              |  5 ++---
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts             |  2 +-
 30 files changed, 37 insertions(+), 39 deletions(-)
---
base-commit: d26bfe9856a36453f591b9620dac996ff9f02443
change-id: 20260511-imx25_dts_simple_warning_2-10d3c75b8889

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

