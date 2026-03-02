Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546E2E62B7
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469489; cv=fail; b=dQzwgVMoY29Nq4sKu9qcKonR1HViQp6yXKaTZ8+SJGZESKKkS1ijoRI/2xuFB+xKmi/yEec8A8ECIZkcR6XyJc1cGiQTHbWAwFT+9JUSw+H0u3ngRmoRdIk0WrI4DtWvJx11K9Z6EbrCoBhxTLHOXpvY/ezgXg3h317ySds2540=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469489; c=relaxed/simple;
	bh=b7hXV9bH7GwTTYyKNV3ChtJGekX58H2YQ/bMenngTX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=AS3iz/z6NqcTtTib4uE2Amh4btgz2iJIFJvTiqFRFZfmcBlA5QgakceFb0wb4BqjBiAkSGaM1d5XZiYK5XAK+0dFw1HNV3NHGW+7dujtP4dnd83LghXjqCAIHW2rvHdGxulNTStzTm9PpR8xj4F1jbHvfSZktqMyP2bzN4IG9uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aGxBIXRE; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aGxBIXRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itSSvJaPx5HpwLDkBYdpwmSGUZAx+ZekCevByiRgjXl7s+VJ1B5Nm7f+RfgyaMiR90d23/+W0GM5tRsmBNXQ5HV9Js89L7dNKY3iHGSIj8eapsGzr4/KoAvIh24muHwRemQ9iqQcRFKkwOWS+8znsr2sjqvjjRYsN0x/9YP4NOEDDfZuswHQGsWhyT5WM91Zkh03XVouYk3UJ+WfKbUtwWqFt/IjSpeK2z573raJej63xBYZgnlvwr4L4Qvr9e9tloW1yPL+r2KBx397jEmqalLRk9PvpxVTRX6/Uoz9OhLDa1OxLQdYRElTPdnJrTQbFMStsbooIM/JwoPFY0OHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrW9nggCEvjpPfyHSnChj2sGyxe1xboSavyDS2iw9G8=;
 b=Pd6HMNhnBRQ6k65uT/WVRX5PqbTeAKSCSrwGLx33VhpOfWXbxkwcC0VQlNFHfQoNDPGmJ3fsXU2QKYKNCIQbAXJ/y9lESCG//+6jkUPj7MOgaVIRrBreaYLjJcLuvrSf9rFAlaMq6IBSNHL+gD+xqjucUL+IpjmGoEw3uapsUTVxqUq9wH2YPd20RIOhBKj+f56w7f0o1Rwq0EkWXEGBhhr8nz6Po9kpHG+ephQu1xy5lsB3MhpneCv2yAER0fI9yZTxaITtbCz1b+NJvBPgipawNj7uqYHLutIFcGbRcNsR/ulRGfVQLyxEInkUlGvdSaq4+HqhMHhH5Wf/TnSzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrW9nggCEvjpPfyHSnChj2sGyxe1xboSavyDS2iw9G8=;
 b=aGxBIXRErzI41TLXculn3V6JaK2sRFsGn61maPkm1OVtRydLPZTRGkiwX5LmX1HCzGmnqfaMi/3tMgPnLNmiXhDYtEi0zmnvh0ldZof62jC54Ta+VNQFl1LgzkZA0kJ0YQ2L5GSysjpT98l/3Yd4qskVlOGYkr2huq37/YLBbDbEPVjMKvUo0ZZY06vK+z3m40eqhraFUsexHQ+xG2PI8Zm9XMPt9wdVwcVhhIKEg3uUoT/qU2rAL/FKSiIuF3sbRJSwtFTzJw+k1R3Nn/2vHNzkq0T2Kj4nLnQ70JQ/yQAT48BdJdtoWq8xaUv1ojwmQl3cv7IgEpvC3r61js6WiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12253.eurprd04.prod.outlook.com (2603:10a6:800:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 16:38:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:38:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Yanan Yang <yanan.yang@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Xiaofeng Wei <xiaofeng.wei@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] Add NXP FRDM-IMX91S board support
Message-Id: <177246948016.2088875.2256464909392307298.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:38:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12253:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b09e02-91e2-4f1b-ff37-08de787a1388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	G4itst/uWnA+5RgAJiF2mIaXL8m8bfd842sen+VEOgN3DTgg0CQkLwybPoXsEIiXMYLJ4bF22UtCveBzPw5nqMJBxcZO8oMzDQhrUrin6oLAngNDbrZp690aYxkNSeDHq1vgsKaUmLVWbD/FJg1vpAHdMc4XHbgXlXbkzpSkuDb4+0Tz4XKjQ3NAsMahGWCawKocm16JAkco815W1CruIg8hBNQBxw6ntkfocPXUWseBrpHDH875W/2AYLKcDfBZ42SWGP5UCCEt5PuZK6Hu/LQxrnyePdZpzLi01GmUiTK/CWwB/5mSyPuwQmevG4Hp7S5yliDdl8dZSNs3rpwIzgv3NguHCnnZGApZVhimDkhUnJPSQ1wNJHfN1ekBCkWD/kQiwtU4Cv5UY8fG8jE2qtkWB/w5bRSRoHuzuggmS9KXSjvqfH/OYTtfmMNxO4AcbI/tKXz8wRFrWvfeWJOH9LUB5vKG7AEZFGCMwd8etSONBlQzHgdg5iENEayCtTRqX/JtiwhaNak3hf14yS8IuXqLJG8tNBlmSgYamsNRNBCavIyaGxZuFF8N+6Be6SZ/huHhOikQUJUtIbZOfOMgZ2JQIze7oZhREzs4RTTIpMeDN8YENbRKCkDOQ3qewJhaCNk6xDotVCVIFccHsYaD5lNLfpaetjs7L2tRr3hE1+76aQ8KgDULactEDbadrntURfM41h2O6/p3FGb9ejeYtwgXUaPf7v0MLe25ee7/l+7DXxmvJq/WI6FdRGClsdAYU/TiSoyuCu7eIvyOTYS+u/cIi81zvQkmwws7NBgBHg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFRweXN6VHVucGk2MVFqZUNHK29OREpBRUovREZGMk9BTkZqUTduVjJWNXE3?=
 =?utf-8?B?ODZCOFRQVUJ5cStNRk0rcDVHaDZxVEIwUTVQcldoakp6c29KUWxDK0NXMzVH?=
 =?utf-8?B?Q1B6dWJaU3NWVHpjL3c3YThpOE16bldlVlJtektqM0l1Y09aSi9PMldXNjY4?=
 =?utf-8?B?U244VzBxVmFmV0szMStmS1c4STNCK1FncFhqRndiQjkzYWJWZGhRUGFLNTNt?=
 =?utf-8?B?M0FYTjYzQUthdjhWV2lhdjRsTTdkWGxRWm56ckM2UFVvTFJzMURiOGd4ckpq?=
 =?utf-8?B?VnJFd2VMYm9qbkx1K1BpOUNkcVlvZlYzb2VkbHVUdjJMbk94K05wRFY5MDBM?=
 =?utf-8?B?SURBR3RzeSs4bTJ0akdxZFJYTjNrSE9JdTJrc2Z5aTVGUnpqN3liOEhUUlF5?=
 =?utf-8?B?RVdreDZQTlYwS2VmY2plemRxcWNjWnJOZExRdmxGMk1la0MwZFVRcFJPc2Z6?=
 =?utf-8?B?UUh1ZXg1Qmk5dFFKU2U5bzJIQmhBM2RMVUkyaXVWbFZQODZrNDJlQ2E0dGhW?=
 =?utf-8?B?OVFxaENVTWwxWmpBMmdQNldkcHBCdzhUUU9jSHRuMitEYnBGaFRrOHZ5TXFj?=
 =?utf-8?B?dThENnVWTXpQVGNxQTR4Mjg3L0VlOUFnUWRwMnZGcEJ5TTI2UUZTVkloZlJU?=
 =?utf-8?B?ODBaeWlDbXFnNEc5Wjg2aWtpQUpmYkdFNVFFRGcwZEc1d2RxRGpESU9QcktL?=
 =?utf-8?B?YU1qR2U3ODdqSDQwTlFYMXZQaFd0d2NMM3QwQm1RYXRKR1BoclJrREJmZjdN?=
 =?utf-8?B?UEw4OXo5Y2IwZzdLRUpheWdFeDJ4Q2pDTTRnZkcwTXdEbTBjRVI1OHNiMWo0?=
 =?utf-8?B?Z1JTNDNQTEQzaTRqbENkcUdhWTF6akozTGdOTkJiTzFqUHp2Q3BqdXlXR1BL?=
 =?utf-8?B?RmlnZkMxb1NiUmNMMko2YVdUeXBvOVRlZ243MjErVXRvZEJxZS9pQXRacFY0?=
 =?utf-8?B?NTBWb0s5VkhJeFllTHFQdHBOWFpZRHpvQjJDaXFmOVNtZXhucUdyU2N3VlAw?=
 =?utf-8?B?NXBQakEwVit1dElKeDJpbmVaQ2lJZng5VzdYNmdRSXpQRjZBOElzVDVsZmI5?=
 =?utf-8?B?S0w5ZDdsekZIWW1kR3hyS1VUZmFZTFNyeURMN2s3R2ZmN0gxa0xybkNLY25k?=
 =?utf-8?B?SUpOS2tjQmlqTGJ5bFN3bDhOT2pJM3h5VmZsbmh0QjRqT2REc2k4T2NmdFlL?=
 =?utf-8?B?VHF0OTBZcFI5bDA4VllYTzl3emIzTmVjVEhld2YrSnVHLzZJd04ybEl1WVpm?=
 =?utf-8?B?dFo1MWRDQVJNUHordm52THJLSSt6VnBHMm1tU2ZVNm9McmpIWFhpVjVzL3dY?=
 =?utf-8?B?WEx1b1ZaY0krWGpCYU1KdWovd21ldDF6VXJXeno3OWlrTUhOazc4UU5pQnhT?=
 =?utf-8?B?MERld0t3TWtKaG9ncWNHeC8vM3IxUzJiYk1BTUp5dzhaamFZcDdDOWk5T3VC?=
 =?utf-8?B?Qld6TW9VRUdOdVp6NUtBTGNqTHNBazhpNVNqT3hEdGZ0cEIzV3hOZ2ZRYURa?=
 =?utf-8?B?Qi91a1k0TUpqNnhvK3ExTHZxLy9sam1FdDZnQTBhR2dzVHVUaHZySTZocm43?=
 =?utf-8?B?TWE1WG0xNVZsS1RTSEpDTGJoamFtSVBVK3ZCSFBEWllOM0VBaG5OdGtjZkRG?=
 =?utf-8?B?aUtJZzhwUG5nZXc1SmtwZnZlTVJEcEE3Zm53UTk5MzBHazZPUlYxV1dVeWh1?=
 =?utf-8?B?Z2M5TzkyUzlHd2RwNk9OYnBpSlpiRzhVT1g0ME5jQ2RGc0svcFljdUdaTEZE?=
 =?utf-8?B?bGlZZWtSaGQyY2FEVE1EdkNkd0lCMzFTRU9oaTBadHRNUVlTYUhhME02VXZM?=
 =?utf-8?B?L1NoZ1UxdGdDRCtqZ1kzOUtza2ZSSzIyVDZxTHIzMVZ2ci9NL1lBUy9xdHpn?=
 =?utf-8?B?WTJxa1lBWHI3ODdYbm1VZ3d0QUhONU1STzRWRXVoemtOaWZJSXFPWXlOa2Fp?=
 =?utf-8?B?YzBTd1VKckRkdCtwcUNJQTVieUxSOVBEV1ZGMzB3YWRFM2V3WHZjYXo2a0xM?=
 =?utf-8?B?NWFZNGdxRE9LL3dzNUFTd2s2N3IySjAvMXprVHFFcElyUWdrd3V0by8rT1ly?=
 =?utf-8?B?NUZjelBsZlcxd05iZ01panlQb1J5dndzY0NJcnN3LzdQQXRhejFMYUphU05h?=
 =?utf-8?B?RWpOZzI2bk0ybUU5blJiY0N6NkcvaVBwZStLS3hjYUhtajZVZktGRXo4c2F3?=
 =?utf-8?B?aGxRM2g1Q2FNZitNMUhHWFAxeEtUVXpwNGdqaE4wRU54bFh5THNkV3dhbk44?=
 =?utf-8?B?RDEyZTZ6UEppenlVNFVFbDZGUllLdUFuYnVJZHhCZVhGSVNaN2JQekluOWR5?=
 =?utf-8?Q?sWsTyWW1c51s1wTzie?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b09e02-91e2-4f1b-ff37-08de787a1388
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:38:04.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6053h2uXsuAr+mqr2NKQN48ZEILwvSvcWsyBjymJ0rwNHyKxQwEIT8mbcA7SuoFk/XSJTaVB6DiHfvQnpn47hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12253


On Tue, 10 Feb 2026 19:47:53 +0900, Yanan Yang wrote:
> This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
> variant of FRDM-IMX91 and differs in several hardware aspects:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board support
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

