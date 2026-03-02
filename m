Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725A3FD14B
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463996; cv=fail; b=IoMKZ/+xGb7iY5IYTtbK4z8QgV1vI8kpeU/svu8t5tVgayr5Lx00Wsa4rTDiZWkhcyZKSNLAqBniQiQhPPvv9Z8vaXbfxKj1/BG3GKCjG/T+9x8VrQ6q92QwDmC69nfKHR9TUSQvUC5uF/K1QSzUyFXCcno0pdu4dTucy3KicY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463996; c=relaxed/simple;
	bh=KXxVctZ4wGuIEcJeCICJKxaDSEs8ZHyC40/EJQSm1dc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HXBsvKtzh8ScMP4WLQDkP+yy6aIhCctFc//fRBbZOV9+6SA78pjces+oNc47Wr1ZSOdynIrfZHaPZQyenIj8f72jlmdpt8ya/h1YaHDswJmiRYVSctHpN09CL6SKiQYz6wTAMqFycqJG4OCsJONvIwnRfjDpfRPYVsLcjkrVGBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Toj5N0cA; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Toj5N0cA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ony0DV7Rsmu8PMcgD8/pFt3z/bK3xsoBg7wjTxRGcwMA/EY15KywRORs+1Zjg+20DcgHDI4juzPGPKrLlTsB8ACu2MmhSV50zFqg6Vdsg84C46Yhgl5G49xoQZUZXmWMQn5cUGPK38uOrFNPi634AH999Ge9p+8Bag2dp6dfc7EDwGEyGmvf0w8b5FZaXU2miqPP1o2BP+AKpmzmLlv/7ou7l7lNs1V70qxViVrKIzItD49fi1H6yBRQu+3TcY8A//4AHkb/VQ3KaTsU/5rTiSjhzP6yUQlYJJUYDSOT9P3PtoU7vAvaglnvL4n10IlWV9w6O60Gg1/mwUrcBrezvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NdCvVt/0xjnxI3w6/KZ4nlhNRpPST4kwIOtuHIoaqo=;
 b=nC768DWJZy5ELmsPaLWe5RGEOT7ydcvzIqzlyVI8eeE5C0fkswQoQiXAncw0vOCAhKH4/B8SpFiI1LwSK2TSto3dtzcsvoR96Npx58VImwHOZkhwYN/pogvE/mxBUM6d4ISiapBbiQQuqEGaAaGQvef7uJqev6/EmUA49xk0h93cb6AFEKg9HB+EnUCjcnGKDde+HwwH9W2Wu6pHO2EQA1PRBZ2rTtxrjWxevhbGQjr11uq6D9omOzaiVEue9Kg/SNTjVL30fKy+QMg+AV1MjYJcABEQbWdFwYtqSHqnpjKyHBqtbjTW2cTGVkwJoWk0qAj8kp+z74m4hODZgJ20RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NdCvVt/0xjnxI3w6/KZ4nlhNRpPST4kwIOtuHIoaqo=;
 b=Toj5N0cACtktt5eTuVHfudW2FoRkXrhrY8PVnKwbZSNvsHigzDBZU2fe9wZQ67kkp0PxELLVX/3rTi+MOArAMKawdK3m1+n7KIWKyxs8iRKdqmQYT4v6wlbCajkw25TSAaA5tNvlsKi9+gSjKCpV9ZYaI1JworsUVJhRccNJiWYr6VOfvPCVTARRCTbL5q8tFzr92O1/OO7A3y3Rd4uR+fHGkCHFl5BPE95t+AiTq2X0q0dOO/SmKpiCtRwAt7k9herDBJLQUX2s6W5eyYY32slDsu7Apt/mL1Ea5UIJMujnuRb30nr8ePEfIUADty+touQQX8oE8SzJ4kx7w5I0Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:06:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:06:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/2] ARM: dts: Add CPU clock and OPP table for i.MX7ULP
Date: Mon, 02 Mar 2026 23:07:40 +0800
Message-Id: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALynpWkC/2WMQQ6CMBBFr0JmbQ0dsBBX3MO4gDLIJNI2rTYYw
 t0tbDBx+X7+ewsE8kwBrtkCniIHtiZBccpAj615kOA+MWCOKkdUgqe5ej+d0GV9kYoIsSshvZ2
 ngee9dLsnHjm8rP/s4Si39b8RpchFMfRKSk1dUarGzO6s7QRbIeKvVR0WJkvqamjrWiF1+rDWd
 f0C8eVLrNIAAAA=
X-Change-ID: 20260226-imx7ulp-c48516ee22b4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG3P274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::25)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f950000-5ec8-4335-6858-08de786d499e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Ib6F7BuNrUlV9IqE7C4jBJmSE3rkS/8W0Ore/oVScX8yBknxs/QdUo6dsXw7XltRkDv1k8BFxNEXBzTkPkFuHaHTwT6OTGApeIC7DGo+XmnxgZlhyuET2o/xLXDBDp/ASg0OCmqUUnAjZEZjTemWnoX4Lsmw2epp8DfG1+pCinUFQ5aqh+7lw6CgSCbwcaJ0sg1X3mrgZ0u+zIl7nzVqoxcI3iDDbdAyBf+X51Y4zEH8T1x3ZBsSCO6ysFPjvccBvqoFUh1iaWwTRZQI1rJA3oNZjc/LQA1dG35YV1Y0gKSoJiZvvqql+srEKmdirB99DVmOqAhKHB3j9pwwbP5KIMdqQfUus242BRYGtVHLWvRQADnxyW/vp5JFpYRAz9AkDDMp7EgFD2jHzgCjjN0oA6rr801H7rqSIBC4SfWOny0kOwGW98vvPj2QKhCis6D66631Ygl14lh2sxJ4VpQHF85cWzAqykybXyXf8SB6Z6EMUCy1ziY5AV3HNKlt6L23Xsj93tcWcw+pxMS7ldYPFgaF5inQ2UGz3Gihi3gDxgW5A8T7aRbFixblkA/9Fe5W/ZM+AvNRwmP+aBkm/b6LMtds0Li0mLtykjoZ7lp54oUQ3LkSkTMTG7R2BLdo/l2vQWvvfDg6kzkni9Vhn5h0myOOggNzua3FPGKybifXFjo9tiOIb4HeRQjh8xLp9Z7apuOTZsppEE3uTYLt2BQjPzSVgUy3kfdoEgwi+gXeAbpU31uo3nB6MYvYpX7QWbjoQ2K9vRD1I3yY0Evz1w7fv9OI2BxrY1KpD1XvInBhUYB2pov4lkkH+IKEm2hZr6t8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzdZdFgyaGo4cHVtMm5kN2pWeFRpajFkMmFURisvV1VaYVNWY0JWcG1rdm1U?=
 =?utf-8?B?TnZ2eWJscGdSOHAzS1pMeHJmc0dHRkhlNkxmSHJpZjdUeVhHZjJPQmJFWjdj?=
 =?utf-8?B?eFVOcGVPQmpPemxEZEVHMzRZdlBwL2ttSjFrTWZ4M3RBVE1IOXZtNmd1Z1dC?=
 =?utf-8?B?TFV2T2hhMTZ1NHQzc2t1R2w0L3ZNdGp2YUlQNnB2NWZSRkhIRzFkUmNOR3Fs?=
 =?utf-8?B?akp3azc4L3diRlZsbVlXZ2dhb0s5L3Q1M0VhRCtxeU5nQTdJS0xuNlNuMnVM?=
 =?utf-8?B?K3NVcHo1SU5aaUZ0T3IzTTJRTkU5TVAxV1RWdi9iRVpuOXQyZml3ZjR6citI?=
 =?utf-8?B?VnhRQkNoYkRTRkcxbm50RUs2VytyUjhKOUY3bEpPZEZGQmJEZTl0K3hTWFdV?=
 =?utf-8?B?MlZ6c0JSaytyZlFRaTBQdTB2bUlsV01OWkFNUFY1TG0xMjRiMWJjMnpielJs?=
 =?utf-8?B?QnBjZ01rYXQyeVlKM0xmQ09LRFJlSEphbTNEaHJ3Qi9vcWZtSi9UZjQ1cjB3?=
 =?utf-8?B?TWd3bVVNV2EveTJmSjFWMWxFS3k0TUlqNEFmUjM1QTlnZmpvc21lZnVsZUVG?=
 =?utf-8?B?TCtzMzNPK0dJQytXb3hzUnZwb3ovazl0WG1hTE9qY2xiL1R4M05ZSSswaVhi?=
 =?utf-8?B?eTdyVzlrcGJhM3V3Q1c1NlQxSngyRng1elZGSjhHTFNaV3RDTTQ3Y3h3RDln?=
 =?utf-8?B?djBZcWw3bUo1b0FDM05KSDRNdFZ5WGFCbFVKRzlZdi84cGRHM2hwbGJuWVFp?=
 =?utf-8?B?b2NLQlJNM1J6LzNaVzMyeDFYR212UHd1Mm1aK3hZYXk4cWp3M2g1eENSTEJF?=
 =?utf-8?B?Y05xcEs1cnlhZGtyME5tdW1haUdIV3dVeXNiZlMrNFZYL1Fya0Q4Q1owblVH?=
 =?utf-8?B?bVZTbklKTFRTSTA0RDBFaHdqRHhMaW92aXNkRUwrY3l4dWV6c3FkanZiNXZn?=
 =?utf-8?B?UFFqd05WSkFDZUxQVHBQZDc1NmZSbk1oSytQNEJjNVppaTR3RDRLY29yUnBs?=
 =?utf-8?B?TlcxdVA0eG9vZlhWNTBpZ3ZOUlRQcS8zNGVEc3BuelhmUGhOZDZBdjY4amd6?=
 =?utf-8?B?UDIyOW5RamIvWEwzaXBHQjg2LzdURmlDZ1doYkVMcm9MZUd0ZjRRMGRWV0Ft?=
 =?utf-8?B?UEplb0RBNkJDaUE1YzA4enB4MjFPWGNIYzVscHRDSXFibm1XZ05Md2hOMDU3?=
 =?utf-8?B?MzFnQUorRTYwNEp1NnNMYkN0Q1pWSHZ5c0VOYWpNUEptQWwyY1ZvaS95bWJo?=
 =?utf-8?B?MTJUSUNwNWZmZnZSMWYzRUlwaXdOb0NYc0JYdUxDM1UvSlpCdEl1R2xLWEd3?=
 =?utf-8?B?RVVrbVp2TkhOVzQrM2VHTW95NnR3RVdQc2o1MDlLMmx1R0hnNms0RTZvRkZm?=
 =?utf-8?B?VzUzYUJ2OHpZY2lRWHdWRlBUSyt4Z2toRE9FZVg0cnJqR0ZLQjBvTTA1UWRV?=
 =?utf-8?B?aVd0RnhrQ0FsOFpwY3JMeWNKdXZLbkZ2OTk1VERBcjk3eVlKWWkvMTRpY1cr?=
 =?utf-8?B?UmlDM3NPVUNQS1lQZERBVzdwZ0dwSjZZbTVvOC8xWHIxL0RRbmZpOTFwTWZU?=
 =?utf-8?B?bUJqRGhFZTc2aTBVeVFzUFlWVEx6TXYvaWk0RzBZUXBhUFFYWTYrdk1vaDdu?=
 =?utf-8?B?NENNRnR6NmdiTWJISXhyaGFKWnR4Y2ozNnVZUG1ockR6YUFYRnZkSDhXQWlX?=
 =?utf-8?B?YnRRSmNGTDZtOHY2NzAvSXZVMjBlVUVZbVpUZG1RaU81aGV2WnhEUTRJVEZr?=
 =?utf-8?B?ZFhJT2h1eG9lTkxmMk1IUXpQUmkvUTRmMGVEN2lIak5LSldyZUQwaTJ0NGhy?=
 =?utf-8?B?NTR5NFU1MU1tVGRpWDJ2b0JtRXc0TGpGU1AwWVRkQ1JhZ3J0alBjU0QweDBD?=
 =?utf-8?B?bkFYc3U5aDZOSmVac3JPZGRnUTNiSklLK0NRQWVSTG4rbGcxSVpYWXllaWFh?=
 =?utf-8?B?b0NmWnAweEFEbTF3MGdhckI4a3hMTUExeXFxVjRZbVdUSEFtL2hDL2tnUk9i?=
 =?utf-8?B?UkFYVUlCWEdPbGhsK2FoOTFSVzIwR0daZ09WQ0k0aWpXUzBNTjhFSWFSdDhZ?=
 =?utf-8?B?Ri9MeXE0RUZLQ2NuOEtTT2ZUVElzR0FWVk96aVM4VWRpWXA1SjcvMkhrcmNw?=
 =?utf-8?B?cWxJNGF2UVRzc0lPeXcyNmNFb0UrL0V3WlRVYVd5ZTZLeEZFcGpLamJSM0kv?=
 =?utf-8?B?aUFjN2FHdlE4VHpHcjZVMnJxbEZoQXQrN3lHNCtrVXowREp2TFhtaHBWRFd6?=
 =?utf-8?B?UTZDWWM0THljWEs1MlFjc3J2c014RnVQUlQxV2RCUS9EM0tXU0tSazFmTSsv?=
 =?utf-8?B?TnJaZnI2SWtPLzM5S1hoN3BmaTNVeDNoWFp5R2pLWUVwbmJrMmNRZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f950000-5ec8-4335-6858-08de786d499e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:06:31.6283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nnwgxovKWxR7b88QHEn59z2tnWG19xJfqRl8IxuZ1ZbOD0mWL5VvSemHGR4uXPz5toESQui4HUYAZTs+1+/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740

Patch 1 is a binding update to add missing #clock-cells, otherwise
there is CHECK_DTBS warning.
clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

And the clock will be used for cpufreq as done in patch 2.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Add R-b and Fixes tag for patch 1
- Link to v2: https://lore.kernel.org/r/20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com

Changes in v2:
- Update commig message in patch 1
- Link to v1: https://lore.kernel.org/r/20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com

---
Peng Fan (2):
      dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells property
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  5 ++++
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             | 28 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260226-imx7ulp-c48516ee22b4

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

