Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C2B3FB06E
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318623; cv=fail; b=r/LUWUS6rOAuPb1WPD6W3/JjDul/7SPT3AMr51N7u3INwF1xLvjotFRAbeiwahW+AUKXnBgTt2409zs8I5kwf12USwgY6CvymRv/GzcXBTr1SCyVPZjpw4BRHQe30/JGlgmFZqh6RqJ9srFotj+6KDzH5qpVuGzW/t7K3XOY0oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318623; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tQ9FrUIAXhzyMm5+0xoKqUdQ1ZTI8WQ1lG0LIkT7tHMx9Sroit5/OcijElXD0l8h74J3DKG04+lQXsFzkRsRlnaSrXfCHTOft4PfZzexoWAWBlzZM8DuEKIsxxwHwCrWnHtBbQsVeBZeKDBsC68ba7cDtFLszGirdoAJ91qbj4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cjtQt93q; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cjtQt93q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVNaJ9hNqz/JcPMQGqU3cM2IcJrk5KGFm40kGR0E91MExKR/QuzFPDlyZF1/Pa3khVQoQ6fmUd+3E7irfE1e8Nf4rQNxtdF8INDNadbPRCZ6irKBtX8hmWCi1JWjdtgTpCGOdsrV+Au9UlqwwuWt8fwhHf9sBkWyaOb8HZ6Ub0XpQSkf/6p5Ueeb+b7FvniLkTOC8OIZnHRI8p1z37nCAA3XRHGh6Cze2z3C1rgOtB57BtP1yh+TBzhbiPw8nS/jD7LDnchUNp4deXDauUX77P8ZwXbYcbN7+HK9YWXHSd7qO+VOaWp9AkQ8Qv/GPXNrQY9o+FQzytGd6IjufXK4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=kabtH69/e8H0A3hFFCbomeuqIjU4IKp53hqUK6CYgksDGjUhrbAU5RNjde3eS3jHaHGlEIgVG+P/f/8eX+XjTuPAcvxYruItkTW91Pf++mHmhuvKnHg8ut7fWoFQsDiqQ+/ikBNsuh2hbiL6xWZYox8WiuPLQs2pBg9QPtznyyySN/CTBfFdzlL0uYod4WCMc/1Vw/TRb+ghT7jVmIyGicEW1RK2IORGhj2eGp0rqx85EGL2enh0z4mS1+AchCOVv3Mw1on9BTY0lC/EVHzO1WbDjkiVBcjQEvNrpuWDasLKoqA0RtK4qE43g3n1IzRaqpSzUnBt3qHwrxMlaE5VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=cjtQt93qK2yOPwPmtWiS320ck14tZFdmYM2b4Vc2oyHa26ltm1nNk/+3qx4yj9Sp/3PhFcLg9NeVVPg6m0N+M9jLCAevy52mBh/QgjcWXIpzFrDkuKXKrV8hjy6P6ch1wdZF3FZwUZgLbj5cTxaB37t/EguHKfW5c+iyH/Nw3HoZTAZQlYwQ1xvB1WpuMtOwFVO5mYODKlKJCzq7BZn96idTaEcC0qP9qYFPAtMlRuxOsREeidj7BiQFJHr/MoRFS348JrvAjjIXMgA4Lmm7NCm1h4+3mPx9RvJAtnOIADM6WrikxCIwQocnsBRr9qGmSBm4OpZB7i4zHt95aeK3dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:18 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:18 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 29 Jul 2026 16:10:48 +0530
Subject: [PATCH v31 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx-se-if-v31-1-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
In-Reply-To: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=FF3Jf8CQKrHim2hXnSwMENCHeHQqBrnmaUlOP1Yb8LSHN6imkcUEl8SwCGzX9zjEV4PonaSd3
 ToY59KYJhhfCb/CS9UKCMCxXynh58TG+QRFnHd8V2wsisR54UHGCcfI
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb2dad6-8767-4a8d-90e5-08deed56cbf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VklK066aS5inGyJcNAH/eUOTJoNML8Y9DAvbpgTRlLai/QFuDbGWVn6A+T5WamHYmIdAwU9qROvzONdE0Z5Tx9SrMLgc623SEaDmDGZC5esv+w6e0YD5Xiu/BxPF/FvJJQZsBMgYJBUmumiJq91zpZe3QjBF7WXknNlJe6cbOCC5LoX4MSHj7YBB8AWNhx0gniJrdTXHtcmxYRVFWi6o9gzzTtG3bvf09vIB1r7C886sflcXZIxkK+LOjKfXkQzNQy3Ep7ArLRdRt38NKH3mrC+V+K9x2KhcyPQlVmyJtIRgjI+Ltx6W6f8lapXBKvo3lVWmIK0BCN6Y+UxmI2FEa1eBLkURNJZEpDUMPuGi2K/kdpoWsugOLSambTX/5ETvBRg7qTAc3wtSuIxShK8fqhuxfIHGvFq10SIXeklW8A0VMvbIF3sWkKe78U6Ut7CWiMbejwBXMfJe4cAY+Zw7F37K+cA1CAeeFWRsER/TQCZ/+/GAotwS8kzhi2XZLAah+HLFH2eOqmYvDB8LtY+01Daz0C+GpUKUsJ08+fR+RzmpcU0VcQBi1yjrxhD5Wt4tCtGvZGUiJOo99NUf3lK9xz0CuNnt8lTmFNp2h3sdJinWnatlnybqiTBoHPDv6hQ1pDHdCGa/V632Go2M2hOqde8y1uKIT7HLPAp5Jcl53trFCHdYUQFPUclhD/s17B4NxtkvdPYvHwFoqW/ZPMPt3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjlVejhVQ3hkTHpNM1ZpLzh4RlJ2MXh3VERUcFhIN2ZLbUlNTDhMdUY1SSt5?=
 =?utf-8?B?cUVMR2xObGJzU1FJZkc4WThnR3lwMmZHeGFJalIyM1YrcXlCSW1DdUVDWk5j?=
 =?utf-8?B?Q05JTnRiTUxpTTByemxodC96ZmZGczhXMHhJdUVORVdtWDk4cXB6MGZzanQw?=
 =?utf-8?B?d01CNFg4WFNHL1pYQ3htZkxQMitXTy9zcXZkd2hNZUpneFdtMnByajdSSzNh?=
 =?utf-8?B?U09zenViUlNuRlVZZXNKS0M0eVVJalNueDYwbVUwSEo0NVVyOGovVEVJVmts?=
 =?utf-8?B?clhhc2dHNk0veFM1cjF6TVJwSjRuVGxsdTEzb2MrZ3FRRHhMZHRRMDRDQSts?=
 =?utf-8?B?RTNEa09pdG43ektWdWVrU21VR2R0aGZWWTBYOWttWE4vOFBpeUhFSC9CRURV?=
 =?utf-8?B?YkZUd21IZ2pISm5RSEJIVzBEZVVhaEVXUmF1U1UvOXpDc2RQRXkvVWxLSzJm?=
 =?utf-8?B?YTNaTzhzaDhDQXR3YmhlQVB4amxXbmJRbENtYmg2Um9vVTVOZjFhZFNGeFNr?=
 =?utf-8?B?M0hIV3RxOXBGUlBuNkQ2aEFxMWdseFhmMFhvZUU3NTdmeXdqS0RVOTFkWm5H?=
 =?utf-8?B?b2RFUjFDekdIaHlnRmdpZ1gzVWp6a3d6MmpyRXYxQVZ6TmUxUEdPeGx4aERB?=
 =?utf-8?B?akRlSm0rSmZMS2JCL2pLckg2R01BL2tKTTA1M1Q4NWpEZFZvZXpwdkRwd3Vv?=
 =?utf-8?B?UmJjaGo2UDUyTmN4bnFYZXRubG1ORU05K3dtbUFvRVJtSUF2N21OQ0JSdnJS?=
 =?utf-8?B?a3ovb0ZYcy94S1IwV1AzYWNrY1h5UktDaU01SnJ1M1NmT0hjNS8wNitJYU9T?=
 =?utf-8?B?L3htWEllZzJOeXV6NzEzRkNRelV2Z0NqNmFudTBhSzY0b2NWOU1DeFBHYXF6?=
 =?utf-8?B?cjZkMjc2NEhmYVJ6cjVxMnhFRWdlTEdzWWVUWjNGVFNDUTZDUk1pcmtEZ2M5?=
 =?utf-8?B?dEFUaVB2TStxaWROZDZycGtXVWVYRlpvNnNzM2hDZTRXZ1JFZ2Nubi82MEhh?=
 =?utf-8?B?TlBqcWZzUHcvYkc0K2V2VVJveHA4WUxzSzZTcTBPNGd2L2VLRUVubTFrRFRR?=
 =?utf-8?B?UEVZMnU3d3laRzZrK3RKMVRxT3lvbnZNbW1zOWdOek9QZ2RWSS80Wmx0K0d3?=
 =?utf-8?B?OWVhNG9GWmkvY2xNcWM5RTdBNStoZi83WHlRNW1sdW1RUkZDM2Q4amdMSjU4?=
 =?utf-8?B?RWR6blNqUE5qbFEyQ3orZjA3Sml4OWR0Y3V6MGs5YzJKUVRPL1FvVVBTRUNa?=
 =?utf-8?B?ZmV2c1p0LzQvKzMwMFp3ZU43cU02VVgrMnpMdjVSc1BXUVIra1N4NFpWVWlj?=
 =?utf-8?B?VGM0dVVnUXgyUEhzeHQwSFU0ekVKTU82RmlNWVpaZFRnWUQ4Q3JTK1VjNlMw?=
 =?utf-8?B?S0MwWTNoUlJuMFNRamJTY3V3Sm9tRWwwY3dIcDFzUGlRQjRYVnJvd2dYbUlM?=
 =?utf-8?B?a29pL0N0WXRucXBxUytJMWptOUZTNVN6TFpway9rUkJMMmw5b2draWxxaFFG?=
 =?utf-8?B?UVc4d3hmNFJBT3BpdTFYUjRTcFBVOUc2MlVlV0Rnd3FycWZxMVg1czdTZTU4?=
 =?utf-8?B?ZUJOZTkyL3oxLzVPQTh0eW5yLzZJWm1YNFlOelBNTkE4Wk9ueCszc0hPVWdD?=
 =?utf-8?B?cGZOcEJxOUlrL1Z2R0hhd1liQVI1UlhyWk1XcTVsTUJFbHBTRlgvVkYxclZM?=
 =?utf-8?B?NU1aMnJpd0x4cmNzdW5TamQyVURzOUlCSnRGL1Nudk15WTJjRVh5clczd3I2?=
 =?utf-8?B?QklaNXBSejk5UU5Td2FwL3Q2d3U5U3JpQjBHeG9MQmp0ZEJ2N3J5b25RSVQx?=
 =?utf-8?B?TzAvd2hSWFlGeXoxTGNBaWFhYWxFZEViSDhFRnplcjZYWW41M1o1VWxjYkR6?=
 =?utf-8?B?MTc2K2lFclVFUHBrOVEwQkxHQTdIbnpKN2xkMnFmcjNnZHQ4TTlqUXpOdXFR?=
 =?utf-8?B?bTFraFY1eE9ndjlMK1dpMGpoTmR6YTl1QnU5Q3hwYzFzdEMyaktIYUR4SUZR?=
 =?utf-8?B?U0RsRmRnT0JXeHRiQ1pBQU8xZXluUWQrY1F2cmc4UjhaUWFPaWZkT0JUMmlj?=
 =?utf-8?B?T1hZVStsV3YzOFhoYjBqZ1FEZEpaRGNJZDRjWEdSdWRBQ0ZObmJyempTNGR0?=
 =?utf-8?B?NDZZV1BQa1lBdmUrcjl4SzIvYk1NaVRWbFY2SXhSRDBaT1FMMjBnRng0Z0dO?=
 =?utf-8?B?NStYbGFOWHdjY3RyZGJOY0ZGYmdaYVRZZzMrZFZ0ZklLYWUxS1AydEpHekRB?=
 =?utf-8?B?SUo4VndaWEZXaDRWWDJzMXdhYnRTYTl6dmhhaEFEeWFQWEkrazJybldmemk3?=
 =?utf-8?B?cHRIay93SnJWcCtYbEpPTXBuQWk5ck40NXpkMkpkZGxvODFUMUNEYUxsSGFv?=
 =?utf-8?Q?i/jLXRH8uGK2fb4kNysMx7c3whunrzL7FpEnf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb2dad6-8767-4a8d-90e5-08deed56cbf3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:17.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmG5zaNzvjMyOYqJF3lUXGKdTyg9xMXH9CRoqSDq0pLWqxc0YBJ5REH5JI1ScIH/3/ZvmdpANzGInrIpjxSBGDSzIpFP9QlOkWjpF93MKLCZYSLiGh1egh1O6DJoQWzT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

