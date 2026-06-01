Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775225B0B2
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345916; cv=fail; b=bBKAuXFjMM5cj+oiLEwJKl6Q6Oa/MQ0LiLtAx70JPJe46bI64M8lNetCEeE8kuRk80+mc6PaGjZUq9eCZuj9rVH1tBdDK7BD/ZLWYW19KSZ1Msq6sK8UnBMIk+n7yBHMVz2Rcrbs7peIiAt5lI2hlUKCCh3ifLKTfMaKWcoPksg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345916; c=relaxed/simple;
	bh=jcJc3DbzuKN11oqxbTb4x48PqqFvddrJ0o08+5AexxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jne3KNbq/jBx32MZu45umAt9PhZ52h13n3Q7q5LjUm7dPdUITDM7uy6QBSoeJZGHl+40Rh261oUBBcPqd6cnLw64uUjyjCO71L3JENG8iRENxR8hoOEyxtKXrzN4YVOtRhinrxkqPGl/Bse9Le/Qa1dex1m6itS9i6YkdYaJIEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r8+QE1eh; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r8+QE1eh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtIUrl6rqRR7G9HZgD6nEDZYOBFv8MqWHUHIjJfy96OoOXNQRgxNxNTiQnyymoGMQuMsK2bXGSOjLp+R/qgN5+qMZDDzxkUxLlqjIuMXCBK2KFPW+a0ydOkCjZgj8GMpq8YW9Id3xn/u2LNusoixAKHVLYza050wxkdpJhlpfWMtup+a7Jp33KtstNJEb/P9EMPeU4kblRfdq+P48hgR6pRdZJs/8SWTElvrWXWveuUf+QgGzK+CqwHoJVrubbjVIyt6GzN4WI6zJ8nfMRFMgtc5Zhos6byDLpP4dQAWDu292i5HeL4TJ+YA/usZeXvrrI8n1KfqyPQKa/2AatMwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBzKJxcr6Wy3RY02yuVj3aZk+mF3bff1ZCncDrXsJG0=;
 b=oo7v0yI4FLiQygiigZQcz+7D9AmWu/a05ZciPqNEeYUHXv18RovRWfVHhlMPqcEzCXZPVletLw2/M1kYd5cgKemkkX86q1rO8AXPUN0XQNGUelK0d72a4yTGF/RoyCuBHqBPBGv3poaU6G7Pz6snhlX1CY4jU/Eh3YEAGCk/zxQp7t24/DXCFCo4rHFaBpd4HyFvbXNEnzND6i6VKy3OAMecSAu+id0ab6rPZrQxuhl/gBiIGvaXQc494LgjFZZ6rSqVP1FBERWHVre2RaE9G4EBq/1CMzinOylRLrN5o/c5jqPXUC2qfHUVAZSAWOJcSGeK6gn2ZG9yN2y1in3Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBzKJxcr6Wy3RY02yuVj3aZk+mF3bff1ZCncDrXsJG0=;
 b=r8+QE1ehiaBpOAw13t/CwWaGp3lplU6GDI8rEHwAyE5no/zuB4MlvFzLLnm8qLpGcJwoa77hVJH9q1I0oxlzKqHNJMs61y7qZgG9IMtYdryEmP4fUw7CKNmZu22i5NkA8LZ1kXYAVXGwJ3QJZuhsYhzGJBGvJ8RL29hCj8Oc5BsoefREpnO43lkD8GXJs+PC+UI2A7DMI/PZN/YTrpdqyPlNFf9wfKE5tkzD1RM0serCa5y72fdb+CarZIBM1ca+sGO/d0jYQ9AXnSzvdlvcQmJENx0xC+S5yDLPZ52y1jHOl3d5i9B6LZGx7bylzrKl697Ln+4Z8oqm0jZcPiErHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7043.eurprd04.prod.outlook.com (2603:10a6:208:19b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:31:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 20:31:51 +0000
From: Frank.Li@oss.nxp.com
To: Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v7 0/9] arm64: dts: lx2160a: cleanups, add new board, large pci bars
Date: Mon,  1 Jun 2026 16:31:41 -0400
Message-ID: <178034456917.460283.14831557030965834362.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:510:4::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4fc7e0-10de-4864-37b1-08dec01ccfa1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
 LQ02kpZjg1jXmdyMqL/TwromjTJvQBeD8MCeKqPtdI1Q8ofDxHr+DLLDADz6RHvbEhii4jEwmNzKKgAGb9KBa/yfC140R6CZNWEUEH6CrbVY/f+TnSo5lEg9cIEcMt2RioSRgtolnr3JEzg+elHuL/zcsVKT9IRREie8ZqYczKHLHXhKKHmIDY+XiUBFKKWP4QEhRmyXdAyVSzR5mTrZmVk+fG/iz6VdXqMRW3NDYNPpg10VaTThrBrnRlGYO2Lb6gGn59B2ShlbX9/1Ufq0U5cjzFftsp6EcQvWq1UoB+ElIBSWcRgdcNt1rdHJVfNICsKPRgi4aBbT7TB0KVjXWU12bV2970sigQCG8F5ORfL9RMN3LJjMJgftNFQ9EnLqvHKVQkND5aZy7ERydliNWmrgPLUICEgaOGvUVHtmItKahOIR7Fda0QM5hO9HdOjzqAZVPAUxLOYgGjxeq80/UFKCvy0rp5Gtoc8S6G4piF99M9USHMQyrg9EUtmLO4MCEovxH2xN7lK6eOGnUWugabeEOsMAsBNt4+ZicXe3cjF7mRF/wIj1Pt9Viqp5XFTXI9ySI5Fb1Me++rKHSwRXEV2SrkpNM/YFs/5niKmWv9wH+0QycSkhr2VUEXu0+s8t8Zie3f2GKwEuEhKmf9zPPscI03Iy/n9x+q7jOwKSmfjypF89euFC3PuVrV30FAqlsNsvztEXa+wAwOpnqSvSJ01D/hQe/lEUKYLZm/qbbHI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q05WTEZaZHJTQVRZQ3FPUk5Ya1U5aEQza1BPNnQyR1dBakJ5RnZQczV2bUYv?=
 =?utf-8?B?cVFtSzAzb3F1ZkNlT3FtQkI0VURwYVR3NCtwZEtkNVdGeUtvM2JTMGI3Q1Vs?=
 =?utf-8?B?YlBQR0ZGUkRDaDhPRzlvYUhad3JIdkVmUjhOOENvVmtMb2NnWGR6NlV3MUlM?=
 =?utf-8?B?ZlV0Z2Zvai9XNlJNbXE4T2ZNdEJ6cCtyRzRyUFZKNXZDZFlQOFNTRjB5YmFS?=
 =?utf-8?B?ak1TRFhPUXYwNWRxS1hxQ1hKOGNMc0VlSnZ2Y3NHazh6dzVDT2dUMVlOd0Z3?=
 =?utf-8?B?Z1JDam9jS0lRTjRLT1FCbVg3TWpUUlE4QmpXOGZKc2RhUkhraVZ4RjNBclJG?=
 =?utf-8?B?ZzBCalFBSW1DR2U2KzUwQis1TStXa29lTFUrZDc5bWpVQi9iN24wQ0tYandh?=
 =?utf-8?B?WG40cnlDNWlsc2dJZzB3bk0zR1cyY0RTWVQ5Zk9LRmtXeThiYkJtd1RWR3I0?=
 =?utf-8?B?L21HZ2ZNanR1MlA0TVVOdTA2NVUxMG9rSEs2aDE0OUUvU3ZXR2hHRngvc1NY?=
 =?utf-8?B?ZnNWVU1lSDhuS25OVEhla3FPZzRyVE9uNTJ3dUVhOXgzYmR6Z0EyMmJYWjU0?=
 =?utf-8?B?OWRFb0ZSa2xpY0hXOTVrelppcFVUV0tmdVVWaXhPQ1EvcVBQUXM4bTBZSVc2?=
 =?utf-8?B?NVhxaGpvQ2xuVTdyT0xIeVpobzJjb1VDR0I4YlJSVmNWRkllbiswRE9CUU1x?=
 =?utf-8?B?aCtNT3dHWXhyV2dHZzI1Nm9icS9WYjJHcm03OVR2YkZFV1JiZ3dwc3RpQ3o1?=
 =?utf-8?B?OVhZbk5TdHlQUFZmd2Y0MkM0czVRNVFOZ3paNnlCNThCNXNQQ2Q3ek5XdTZ0?=
 =?utf-8?B?N0I4MjVPWThZY3lZeG5qQmg3bHh4TmlYbWRNaDFzREI1Rk9vY3cvMWhTOXl4?=
 =?utf-8?B?eVJWd0NNcDlhVHUwNU1NQk9BL0tuSnFaM0JlOW82QkxWMEVQbGZEcEQ5M2Zo?=
 =?utf-8?B?OWFhVDFnOVFWV25YZVVESlIzaENzM0dTUXk0c2FxeGRFMXVmWEprSUtaMi9N?=
 =?utf-8?B?OVcwK05Da0NmWW1TTG4vajhCK2hoUWc2ZlVEYTk0WHpwMWlpVHhZOHQwRUZa?=
 =?utf-8?B?V3pYNnJMWTB6TUladWVUTloyY2ZGaytKeGpoZGlEK1Nvc3U0cCtMQ0tESmhq?=
 =?utf-8?B?QnB6V0tKUWFxVHE4TnR4MDAydUx0emZmRVRxRzR2Z1RWSmdCVE9SQ0FQbldW?=
 =?utf-8?B?Y2hmTld1TmFzSkYwbDREQmJ2K0ZYbGhOejE0U0t6OC9uRDhKNldsTitpZE1B?=
 =?utf-8?B?UThDVmtseGJYMkx1UEo3L2xBcWhzRHFSamRSQ3lJNHFTdmNOSDR1MmtKZjYy?=
 =?utf-8?B?eHYvNmhwV3l0UFJTbXJNWXpXeGpYSVNkdENidWY2WFArUjF3bEQwSUJlVE80?=
 =?utf-8?B?dG5qWkhRenROOXYvKzlyak1GNEZIcVlCMFAzc25xNlUwNXFoTi8wQlJISXp5?=
 =?utf-8?B?azV2SjRUT3NwMENNZkRsWjArWXpCcVF1TjcrYzJtR0hLaXVkbUdYajdaUXpB?=
 =?utf-8?B?TXVVOHNDZWtGWnJnUk1pZy9oNXBETHRZN29OTmhWTXV5MGxORzNSUEdzeVNF?=
 =?utf-8?B?d1R6bjFpVlpUMDlzWWZ1cjM0a3FrSVVIdCtWNlNlR1BnRk5icHR0bGxCb212?=
 =?utf-8?B?MnhhQTltOE9YUDF3UlZ1WkVuTmRUS3czNGQ5SEtxbm8rZVBkOURseXdUOTBq?=
 =?utf-8?B?TStJTnp6NjAxbDR6QnUzdTF6YTBtSTB0VlhkVzJ1dDZMQk9BUzB0bXUrNk1s?=
 =?utf-8?B?KzI5VGEyL2tVOE13emMxZE5XMkR3NGJDbDlmTHc1SEhDaUFCcjdJQmdEMHdE?=
 =?utf-8?B?U1BqbnpXNlBpWVFMRFBFRmJ2ZEdHZ2dnbEx0ZmhXUDZHN2pOclFITXJwUFVP?=
 =?utf-8?B?WlplRTdZNG1jS0dJZWRCczMzR0NjazcyS2pTN2ovVmJTcm9SVWJ5ZXQxOW5i?=
 =?utf-8?B?Y0p2Z2JuS091aENTazgrNXVmVEhlcmRLYmtRSmk0Qnh0ODRyNWlWdFFISzlN?=
 =?utf-8?B?dG81MXc2bFhwL0dZOGxrNmZmQ3NDbURiaGZQSFhVdm0wbTU2KzBQRlltQVNv?=
 =?utf-8?B?M1l1U2EyUVBCNTRhc00wSkFESmdFWlZXeFc0L3RTL25mRDdzNEJEbnVHRUsw?=
 =?utf-8?B?MlVkR3JGeEJvWm41dG9qbFpaSUlqVHpyZEU0ZHp4Yk5JZ0tXTzRsdWFrSE5D?=
 =?utf-8?B?S2FPZU43OU4vQ1FTSzltdVhDVDV2TXMxbjU2d3RKN05pTmtzd21BQnZXREJ1?=
 =?utf-8?B?V09oZ0syMDJVeHhtSmtFMmtJMU5RUGVZT2ZjK3JhRlRmUHFzQjhrY1BjeGIy?=
 =?utf-8?B?RkN5MVFOd0lOaEVQNXZEY2J5TkFlNWNDSUt0eW9DSWhiWTBBWFdYUlk2aXow?=
 =?utf-8?Q?zQNLN4rAy4ktHOIg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4fc7e0-10de-4864-37b1-08dec01ccfa1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:31:51.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZgCjJluPG13si8Cro45G98IYYilljYX34GlQFZe2an2WejPaCQc7PWgUA65MR2N57O55kdcaZfqyRwEh7Yd7WqbyvPz7OsJ6SIEu4yWKaV9ktYI13h5XY4FdVAJ/l++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7043

From: Frank Li <Frank.Li@nxp.com>


On Sun, 24 May 2026 16:54:39 +0200, Josua Mayer wrote:
> This patch-set is made of 3 parts:
>
> 1. Extend lx2160 pci node ranges to support 16-bit, and large 64-bit
>    bars. LX2160A SoC has always supported this, and SolidRun carried it
>    in vendor fork for several years now.
>
> 2. Cleanup some status properties in LX2162A Clearfog dts.
>
> [...]

Applied, thanks!

[1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci regions
      commit: fe4e8591406fbcaf718500436f01c4c6bf6aaeb9
[2/9] arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
      commit: a95eda05c63a09dde4d2310132544597ba9fa92e
[3/9] arm64: dts: lx2162a-clearfog: cleanup superfluous status properties
      commit: 9daef7147485b82998f0edc5f5134d44ea98c9d1
[4/9] arm64: dts: lx2162a-clearfog: specify sfp ports led colour and function
      commit: 71f99ff0b675c4679d358e2534a07822012d07de
[5/9] dt-bindings: arm: fsl: Add solidrun lx2160a twins board
      commit: 1c4e7398015e248ea80ed40ff02552c56b803e7b
[6/9] arm64: dts: lx2160a-clearfog-itx: remove redundant dts version tag
      commit: 81da028c8324bb490943117e1dfacff412847e13
[7/9] arm64: dts: lx2160a-clearfog-itx: move shared includes to dts
      commit: a2cb6757f56a4aa91a59403f167163fc6d57d016
[8/9] arm64: dts: lx2160a-cex7: add usb hub
      commit: 077ecb51d46b4a41d3c9085c92a1a04a566458c4
[9/9] arm64: dts: Add support for LX2160 Twins board in single configuration
      commit: b73fd8c02f95d4e8609ccecca1142ab35577aaf6


Fix typo and small turn commit message. Use term "PCIe"

Best regards,
--
Frank Li <Frank.Li@nxp.com>
