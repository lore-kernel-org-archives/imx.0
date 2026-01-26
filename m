Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD7274658
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 23:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468783; cv=fail; b=URtHcQa4ytb2JK8tzODl4+4OVOtKr3YK1vU6whbykEq62RhnZNEwgEMulEJLcfdJm8KaVS+UjPN4rd1FM30vLzTpVJBswBjgeuiJrNGGZ/R74HR5lxeBlXG96nLXEb9Kx/PM2OOxljWIjjknstdiJx79BQwt5nzARgI61iuiEtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468783; c=relaxed/simple;
	bh=g9WgYbcjshoseWZ5ns8KaI25eHqt61GcND5CtCziuoI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Ns5ipcwN27JPaGcTxGQ5ZoR2VcmLdtyk/7c4fGX00/uAW/D9emG6dZZcgZEGwG23ivEYG4SzM/It1mBOlkCsl0V5vFbsDk7py7vZUMA2bDeKR6YIKml5MeLXOmYZm5It8og36mhIiapzVXYFREL4padKkd9aTXZsnuS+kqON7f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iFCNNIjo; arc=fail smtp.client-ip=40.107.130.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iFCNNIjo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiux8oG8PwICrdkd61kAgFk7w/iXiemwSsXLbp/HWAUT/xDfeAnLhSfXerROzm4BQX9BsTcxL+bpTjWy1TgENLNNkHnKaTC40omhEdrXPxNQFviJlynYTtNq0fQGqu+z3NSeLgqojszTesQNWQDm9C8I0g1+5Uz4/Nhs3U2nXunIrwzxMi9gNk4YiG/cpIiY8DXFDWsdIKakqGPRXfFAUV1yfHmzpfA16SvudUER0CCIAvEs736+k4xgxsNNUARCjv/T7RIB1/UhAY0dmfk4p4YEgvUsi9RGHyIbkurYczCvn/qK26YgS8/ChSnphW2Mw6KDuqRw8UFZQ4BvLoJXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55/JDou/LxBMVcuQ9NTxUOvQVov77+L980fqb/S5wv8=;
 b=O4ZSzyix1/Bu90dS6xIJ/rfg32jXz7y43F7poq5lKlK4hR3iJbXfpehxdG7zK23101FQeAICCqwxHnqfroTkpPc154Ioxx8sQLsu+pOGe5m3zMNtErY/Iu+BDXto+K/RXUO3QCuWv8eRS9q2dZn0w/hvRLt9tLqwUYGlgbKCz7z6yJUelpNYmzbJ6bxEuH4dUSBqE9M63hRdPmS4+/7ByDL3xl82kh+4oAMuXpOIk59mdEYT2hCg9v8FfktyYnwE+CxTWkuKMuBTp4PHealtvj9TCKblVfGLh6g9vtGkZQK7pfFXdeUFkb7xKBWRyPes3ccXqVpaEPY4S6a5he4jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55/JDou/LxBMVcuQ9NTxUOvQVov77+L980fqb/S5wv8=;
 b=iFCNNIjo/2GPQOo9xBbMyfbjS2IGjeiNTXpf0Mt3PetP6TBc4hMR+StyYPpvcTw8D7tpYHMtejO1SQ3CnKlkfn6yckKosAjthpZxa9SU/JGNXO3nHT9jPYaIKcuuybc7Txcbax4ot6tJvRMpfvd7PY9+5a0BNbzdcUd7uAmwmOJnhwfj+gcxAK5xVaUKYBjT8vl2MG4aD2fW5vHbnd4NSmOph1aFqg8tJWvinJfPohSe2AKa9V8OA3Uhk+YH/04jak9En01PqD/Limobk/XJbq4TG4C6nbviqaLl7CvwBilTHMnIhSM+bt35r6g5UmXwgz8P8M2yPu4om9teJADvAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7619.eurprd04.prod.outlook.com (2603:10a6:20b:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 23:06:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:06:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Jan 2026 07:06:00 +0800
Subject: [PATCH v2] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
X-B4-Tracking: v=1; b=H4sIAFfzd2kC/1WMQQ7CIBBFr9LMWgwzKBFXvYfpogK1sxAaUFLTc
 HexO5fv57+3QfaJfYZrt0HyhTPH0IAOHdh5DA8v2DUGkqQlkhbZvoU1yp3OXqGZCNpzSX7ida/
 chsYz51dMnz1a8Lf++wUFirtxCt2IdNGyD+tytPEJQ631C0KNdzuUAAAA
X-Change-ID: 20260126-scu-c93d45e319f2
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbd64a7-97e0-4545-a27e-08de5d2f849f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aW5vN3FyTHY3QXZxZFRmanRIWE5tWXg3dUhiTElINHZwc0JSeGFPT1hCNlN3?=
 =?utf-8?B?ZDVlNlNndFFYTERmS3hCZFRlN212bk5pN3B5K2ZIOGx2SGg4RnpwUGs2ZldN?=
 =?utf-8?B?N2Vpb1plL3UyRStxcTNPMHM1MFIwVFdwUCtSZUpYTEo2UFN5YlV1NHNmM2Vm?=
 =?utf-8?B?VXd4cWQ5RU5VOXVINDY4NzFnOFpNNzNVeHp0Q0xGOXJIYVpyS1Uyd1Vzczhj?=
 =?utf-8?B?L3V2OFYzd2pVRnI3U0RjcHNSOGhtZ25ZeFBmay9zbk9DUC9XeXBUSzdtaFpH?=
 =?utf-8?B?M1FvYm1TS1JYRmZKNlpNdFpjRU9vOVJNMWpTS1I5d0FWVHVGejk1SEUvTUNv?=
 =?utf-8?B?cGNRanNvcFozcktaWXNwb3p2Z1haNWFmZ0FMclBmQzlEZU5NVmZHT0tHeExv?=
 =?utf-8?B?RWdUbkJvd3pNc3FOM2puRk94cmFoanFzVlV1YUFkQVcyN29tQVpIVU1Qb2VT?=
 =?utf-8?B?a2ViTiswZnppd01ncEpONDZYb09SZWJwczVjYlUwbk1mWlY4WkpweEpZR0hQ?=
 =?utf-8?B?SGhvRnY0YS9RSnFCaS9admxXa2RqOWd3OTdQUXpEdmU5eXBFRlhtNXl4eXRQ?=
 =?utf-8?B?WE9WemtHUFlyMW5SK3hVamt2d0RyYkZqdDhZVDBjNk1qcTcvcnJ0cVVZeUov?=
 =?utf-8?B?ZmdIZWdWb2V1dWprUUlISWlFLzFhT0NUNVpRM2diQ1BtYUh6bkpYekdIOHgw?=
 =?utf-8?B?eTRTeUljbVRCZk5WK3pvTE9OcFZIaG5odEVTQmw3UzJpR0UybTVYa3pqZ2E4?=
 =?utf-8?B?S1BIOWhldU1iUlNubHlndDJ0Nms5M0hpNkk2TC9ZRW5FL2dJRHIzQ2l6QS9k?=
 =?utf-8?B?OVBhcnBHbHVTL1VDWmFWUWpUcmtPS1FnWDFYOU5Mdi8zY1p0TW9RM2gxNXBR?=
 =?utf-8?B?K01VUmNqbzFaaG52czhzenV0STJxVTZyOW5HT2R6ak5vdk5rcVZMRHhJVUFv?=
 =?utf-8?B?QStlQnZxQiszRzdSR3g1QlV5R2RBcTdySjMxYURRdWthVjZ1cTVUcTh0MWhM?=
 =?utf-8?B?T1QvczVBQ2FZS0ozclllTFo1SnJodVRkRUFIUU9rWEl5WERrVEVQazF6OXFS?=
 =?utf-8?B?RFVKeXJGQUZyQWw1Q1RodGpsTlB6ZUV0Ujd4Y3JWY3lLNUMxeVg3cytJSi9R?=
 =?utf-8?B?U0xXR1o4c0xKcUIxdm5tdWovb0Z1M0NUWjZrYmRYU2o1b3pYREVHZnRLSkky?=
 =?utf-8?B?Q1dRUjFwNmF2YkxadkpwR1g4RVJJK2xrc1RWeUFPOGlYa1NqOG4vMFZlM05N?=
 =?utf-8?B?RlE2citsVXcrQjdZWGkzNXViN3RFV1BlZVcrMThkcUFvWjlSTFZCNGJ6dmRY?=
 =?utf-8?B?dlJTdGY3aGNQengzeXdYRVZmM2dkV3Z3TnhPaDI2ZUFTSlBiMEoyeFU3WStp?=
 =?utf-8?B?eE1QcS91Wm9EYTB4YVdQWEczaXV3VE1teWxpOVBkUXJkdFRuMnVpQzFIVmEw?=
 =?utf-8?B?Q2NtMThrR202MEVZRlNuSWhDeU5YbzJhZ3REdklKcDlLdkRPOWtqWkpIRUIv?=
 =?utf-8?B?VzRwV3JMSGl6RlF1SWlwR3VsMHpXOG1QaDlXZkpDQVZocFBDZFhLUncrd2Zq?=
 =?utf-8?B?d0VYVm1PZ1JYSmZMbnV0RStWUnNYRVZxbjFiOXVjRm1ScU1ZQTJQRjRFUXFX?=
 =?utf-8?B?cDVsWEhtWUlPRk9iUW1oenNaRHJGN0RNeDZkQVlBU3ByRkU4ajNsblNHeVdt?=
 =?utf-8?B?VVIvUjcrMmhzRDhJUDVIY1JpZTgxMHUwemJ4RjJmU1k1RjNzU3RoVjdRVmh5?=
 =?utf-8?B?czk2QTJZTXdZMklrdDhIZkc4SEkvQTlzUGIxU3RZRXlJZU5KT0NJS093by9k?=
 =?utf-8?B?Q0xEQXhYcEZpZHJJUHJXVVRFUzVJYkRvalFtMEs5YnhKa2tXSldPUXN5UVlE?=
 =?utf-8?B?S01zZ1dtdnVpRlJ0S2s0cXJoMU4wZHJXNENwdDdZUjVsVVdueDRsYSthSnM5?=
 =?utf-8?B?Vm54TTY5TVo5L0xBcnpnUUFOeEV6emZNVE03K3FoUi9hK1Y5YldSN2NBRXVx?=
 =?utf-8?B?ckQ1QXpYbHdrTUdadlZpYU9nV2hkMUo4MFEzY2FIUVY5dWRpZ01naStBWFpj?=
 =?utf-8?B?ZGtCcGNSbWpHbGd5Q2hNZ1R3eDNqcDhvYVo0VlJuOGVNMVo0dmw2YnYwSlBl?=
 =?utf-8?B?WFBOVFRIMm5mZTRwbURHRllvVlNHaFIzT2l5aFBxWGFhOVJlOXlwY3Q2LzRG?=
 =?utf-8?Q?XRMyeRCTEc2IC6+0wL6gGCw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXA1b010a2dlU3ZQaU5wMXZzS3dFTnJHblV6NjVyQ251c0tSbnVGL0ZiYVpR?=
 =?utf-8?B?NkVTdTFsR25BcGJocVJWd1NSeGh2WUFzc3kwVHpONEowVTRjTytsN3pxaHpL?=
 =?utf-8?B?Y0V5VmVuV1BsSjFFUHFvSE9xMzFPc2lBazd5T2NHNVBYNWZqOWNqc3NZZnJt?=
 =?utf-8?B?eXRZSFYxNVkwNTZxT25IZm9iazk5VnZaYkZmUVRXQmxBUTMvNjN4b2ZwWEJ5?=
 =?utf-8?B?TzZuVDd4bUxRSEFTVUxWSUVSbHo3VDJSL1hwLy9ZWGxiUVoyQ2gvdjJBcHNn?=
 =?utf-8?B?aDRDR3plSVlsZ2pZWjEyQzZmNHpJT0l0cnV5Y2hDRVd6RlZVNThVNk9RV2Ro?=
 =?utf-8?B?eXdzbk9sYVpmem5DWXlORnNEVGIwdm1CMUVqaWVnUDJMZnpSMU04bVlkUTNV?=
 =?utf-8?B?NHZ2TlBSUXB6Z0lNZmJXRzhpUVJaK3NWcFFKSFYrdGd2NEJpdTlrenYxK21R?=
 =?utf-8?B?YzFvZlJERFhzV3FEY2dEVGFlRkR0V0YxbjZmajhnK0hzVGJIUjFzSDdZdFNR?=
 =?utf-8?B?ajRSRXp4UktSaFZtL3NITngwM2pIdkJ5MVJHT1dPdVdnL0VOUGlwNG5oQ0xj?=
 =?utf-8?B?NnRvQ0JYdmtqVytIUHg5Sys2bEtzS2lZaHJXZS9rSXNlTzVvOEZVTFNpUGh4?=
 =?utf-8?B?Nm5UR1VVRDNxL3VxK0xOOHRnSitoVmJmcWxpeDFjWWs5V1UrVlBxbG90RHRy?=
 =?utf-8?B?V1hSMWJVeXpPeVNqQzloakwwV0FJQ3p4TlJOZHBlSWw2dndyL1RlTVZXWE5u?=
 =?utf-8?B?QnhRWWNkNEZlTHNLWTVjRTNyVUtQQ1lqTFBsK2ZWMU9YSDlwZHZsMlFMZEZ4?=
 =?utf-8?B?VTFOM1hUODdGNzhMT3JOZHZiclUzTzg5N0NLeFJjd0FsOFN0cDZENUpnVUVJ?=
 =?utf-8?B?eE9Ycnh2MUt6WENxSDZOMGhVbUlSMjVQZjVzUWtzTXN6UmNxb1BQZDViTThh?=
 =?utf-8?B?WkExaWFvNklFUnFkaUtZTU1xMk81U3U3YjZqcFZzT2hJbzdKUmU5Z2s2cmFP?=
 =?utf-8?B?eUNSaG9OS21OY3JnMU1BSzZkWG5WQUJ5ZUJ1cHd0NnlCdUtHd1JUWWFCbVVu?=
 =?utf-8?B?S281WmVuM2QrMEVvR3d2VXQ5cHBJZ0JyWjdmYkRheXY3TVdQc0Jia2VkMHo4?=
 =?utf-8?B?YUZVM25EN1RLK3lkOFZxb0o4QU9xRklOOER1VlZaTGh2N2xmZmxab2dFY25r?=
 =?utf-8?B?NHVvcXJIcmRaZUEwUzNhRk1sZlVWYlg5dmNtVHBGakxibHBlQkRxUktrOTZ1?=
 =?utf-8?B?U0p3VnhOVW5zeER4LzV6V2FZdndWRVc3aVBpM0lmbmtVWUI4eCtsRG5wWnRT?=
 =?utf-8?B?SHdxWlJFRzdlNUdzRFVPaW9tNU1sQjBwczVEZnBBUVF2OUZhU285YUt3Zm1a?=
 =?utf-8?B?b1h5NEVmclJJeFB3MXNaSDJueEVNZit1UElxVEdINDY4Y1RyaGt4dzBJK2t4?=
 =?utf-8?B?Z21kdWlPVWhoU01uNFlHbVBNK0J0b3ZSeE9PQWg4aFdmc2FZN3pZd1ZkUkxL?=
 =?utf-8?B?VjkveG5yN2l5T2NQelpWWUw2aVVkcVQ4bjZ6aGd3M0JIRXZCbndGSXF3ZEpU?=
 =?utf-8?B?TjVENnFVNzdvaHQ4S0s5dlBKYlBVbVhOQkZpS25YVVdDTDZtT1JxMlVoR05u?=
 =?utf-8?B?QUlDSy9ldGlQRjNobkh0b2RjbWNYQW5uYTJvR3R4YTRaU3JNV2dkUTdFQ291?=
 =?utf-8?B?cGdBZUhqdWpvYWh3STNub0RqZEJmbmo2WXhNVG9ldmRURXM1aktsZjZIeE0z?=
 =?utf-8?B?RnZKNENMaWRoRnRjd1JKakdGSzJTd2NYTEdKd24wL0dtOXBwSnNWTldIZE92?=
 =?utf-8?B?RFNaRExoQ29JWUxkZmN6QVBRRGU3dksrRW5KVU53L2pocU03ajJCWVozVE9N?=
 =?utf-8?B?Qk1PZmE3cGptQm9HRjJYdGF6VWZEMFpqQkNTM1BYWlFsNGxlMGhJekhXYjRL?=
 =?utf-8?B?aW9MM1lsWXIvQTlqaHo4aVpGZzVsZ3ZyY1d4czBUK1kyQndtdWliKy82c2t4?=
 =?utf-8?B?alNHU3Q1UjVsN0VqQmtHNEJsaTllTU1jZnIxVEJGOEY1bnNGSHRIQlBYbHdD?=
 =?utf-8?B?NXl2cjdkOEVlRGFRemlPazRUU2xKTkhyQnNMRWtRbnpJTzFOV2VlaDd1d25s?=
 =?utf-8?B?am9lOWl2Y25RUXpOTmpydEl4Mjg1TmY2dTQ4d2orTnBZdGo4d012TzNXazQ3?=
 =?utf-8?B?SFIyN3l1Y0NIaVIrRytWTm1XNjZnZUdCcnh0cjZJeThnbUJjd3g4VTZZNXlk?=
 =?utf-8?B?U1FHU214czh4UThkNDJabE1yVUtjaGZyZFNLc2RiWXNGWExFTHB0TXVYMzZx?=
 =?utf-8?B?eUtQM0M2dEhBNUZYTENoY0N6cHUxRFl3SDB0YXh2RHdDVXVObHU3Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbd64a7-97e0-4545-a27e-08de5d2f849f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:06:20.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9h0gvciCQ0z+ifGWccCzGIB7Zcgn1LeqAqRQCPh4cZfEdEmMoAfrOFng2Lra9NcpOjbOvT/R+jR16CBDsg32BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7619

From: Peng Fan <peng.fan@nxp.com>

The SCU MU driver has already supported the simple and efficient single-TX
and single-RX channel layout since 2021. The older multi-channel MU
configurations (tx0..tx3 and rx0..rx3) are less efficient in practice and
not needed.

Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
binding schema. The driver continues to support them for backward
compatibility in case firmware publishes the legacy properties.

The example section is updated accordingly to demonstrate the recommended
layout.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- A minor grammer update in commit log
- Link to v1: https://lore.kernel.org/r/20260126-scu-v1-1-b9d31da12860@nxp.com
---
 .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index f9ba18f06369215691c69cdc1538b53dfd369f37..307f1c6278532ace94db92e6e8b68312eb4c8a4f 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -76,7 +76,8 @@ properties:
           - description: TX0 MU channel
           - description: RX0 MU channel
           - description: optional MU channel for general interrupt
-      - items:
+      - deprecated: true
+        items:
           - description: TX0 MU channel
           - description: TX1 MU channel
           - description: TX2 MU channel
@@ -85,7 +86,8 @@ properties:
           - description: RX1 MU channel
           - description: RX2 MU channel
           - description: RX3 MU channel
-      - items:
+      - deprecated: true
+        items:
           - description: TX0 MU channel
           - description: TX1 MU channel
           - description: TX2 MU channel
@@ -105,7 +107,8 @@ properties:
           - const: tx0
           - const: rx0
           - const: gip3
-      - items:
+      - deprecated: true
+        items:
           - const: tx0
           - const: tx1
           - const: tx2
@@ -114,7 +117,8 @@ properties:
           - const: rx1
           - const: rx2
           - const: rx3
-      - items:
+      - deprecated: true
+        items:
           - const: tx0
           - const: tx1
           - const: tx2
@@ -167,11 +171,9 @@ examples:
     firmware {
         system-controller {
             compatible = "fsl,imx-scu";
-            mbox-names = "tx0", "tx1", "tx2", "tx3",
-                         "rx0", "rx1", "rx2", "rx3",
-                         "gip3";
-            mboxes = <&lsio_mu1 0 0 &lsio_mu1 0 1 &lsio_mu1 0 2 &lsio_mu1 0 3
-                      &lsio_mu1 1 0 &lsio_mu1 1 1 &lsio_mu1 1 2 &lsio_mu1 1 3
+            mbox-names = "tx0", "rx0", "gip3";
+            mboxes = <&lsio_mu1 0 0
+                      &lsio_mu1 1 0
                       &lsio_mu1 3 3>;
 
             clock-controller {

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-scu-c93d45e319f2

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

