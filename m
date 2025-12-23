Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46C20E00B
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480709; cv=fail; b=YS6qW3/00ZG1Q5cCK0wMeoj2+DPjy3SQ3t0ZGae+LHIjvGDChVNUJCYZ9vwfYpeYgtyu/w5lQDXJUJImoAfFxy6IgwHw5qqjvD2j3TDz0Kf/4kDhE0V+A/NgduzB4FtIrqSSfXutjmMYzM9oX+1C6QayfNIKTDj7GvU9dtKaU7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480709; c=relaxed/simple;
	bh=rqS4FdRDQmoic/B86MkVRRgsdBDol0E0S4bMs59OOA0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T1C6HTlWGl0qAaoaafZZJ4ruZ6zcFIU45kYlFVJZk+t3opHGhWTVijm6oz8x0YyG7XakpXGf/9kLgyyVlg4u9E+ZxAV48mTyHODSgXmWr9j+N6V2lBZus+PWAvLhz1tjoNYowbb3CBaESKjnilQqja8Nxw0eheKl72cQC7VgJlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgKTvRCe; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgKTvRCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4fotI3oRVdF/oC6WMrGXdtAIa1uaW2FOoAOZmGlXbeDlGm4S6zNuGBTl3YLfg4PXtawANf5VLo8FuQ7wSuzhMhrQSemf7LflEVGdLfq6mvBmsAeJDyxzuNyRd49RGYm5OGTx4sk8i8/2KL9+nJ/gUCxCnTVpx5q03LqwUt6xAnVaEaBWC24HlpaepvPIxia7vmzJvYymUQ4fRcK6wZHDjC0/3XdjfbLx01pWGwhLXz0mlDTu8/iF3SK84llCJ+plZDfvtEaU3QhRyjK98Fp7LQUJuN6JOPpqLVSAIobIQPIS757cQnEfZ+VI52BlBF7Sj7wRNTohVr6aFxrlXVukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDopN808M60iaUFMowtCSE8XQQ2mSjwxkevDBWju6ZU=;
 b=dx7SO5DY1ZnF3lWOrUenaqatIwYMDj1tcymGsGA7Uk92HVRWat0o0ASoZTvEy4MKQ1GL8ogMdUfQO3rmEzqUwAz+1im2XOu4GewuGG3FJk4Khefn2zZ6A9ezIAb/OjTlKSrAX82ATSdkZF2Idk1NEL3AFjHg6RQn/9kNMQIhPXcGZnN3AhyRe1u75CS59/o9fSaNG4falM/zo/pwhjDExZvHNOLiCOxabGEnMi2NaLAhPoFWIVMFw0YHbGgaSsFCgIaRGpmDCf8TnGVJlwSFe5P1g+3h5D/n4Z6bxXSlhOA7nUJ94Ea1BmvVPA4re+WOcDpTuVEk/zzwgKGE0T8Eyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDopN808M60iaUFMowtCSE8XQQ2mSjwxkevDBWju6ZU=;
 b=UgKTvRCeZcpMzR6UG3ja5bX2/7HJutuQubPZ7Hnpl7f1kvSZiRfQLwc4Cf985Ci4ljEHUKdJDr0KZnaU/+ssLqaYI9Cdn7jVo6JqQTeP1h1XGlEto1Q3Wvfs4dxQ+jR6ccX9oYyyr9xceOgGeVuBfvGE/+lC6BoMLSH9FYFJ4QPJIjgtekVE38OcCCG4fLgRBQGASC9Z+6kxANNA41ogS6Qu7W6Q00flNY9HvgZQ9W47SpUxnjERitDwHB9RKjECZw+0UZfRRNAguemKlRFNGlEOQBdiK5zj5Db4W1UpvUsF2PTViz2S+gTOWa/fh4uF5c/oTO5685w7sz0R5AfCPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 09:05:01 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 09:05:01 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 23 Dec 2025 17:05:57 +0800
Subject: [PATCH 2/2] arm64: dts: imx94: add mt35xu512aba spi nor support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-imx943-xspi-dts-v1-2-7c18e5b4f97a@nxp.com>
References: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
In-Reply-To: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766480776; l=2040;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=rqS4FdRDQmoic/B86MkVRRgsdBDol0E0S4bMs59OOA0=;
 b=A9kiW4d7TMJDHm0KFPNQuWYXX/CkS/crZExntU7MFc86SxfE3Z1dVQCyVwYnr2IvEZwJqFdIe
 oP/p/kofqKQAkii1G2hhGzKoiBtn5do6sOX/SuyL6s9dQxVcBjK270R
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e8e196-9f55-4e0a-5430-08de42025a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEE2NVkzQTdzeWY2K0JkL3Ryc2Q4UFpibitsVHg4SzlNdWhhVldNWWpMRFRL?=
 =?utf-8?B?cGF3ZkxDU0xlVkdhbncyYmsveE1VMzJCanNsNUptNjhzQ0tiWUxBQWp5UjNH?=
 =?utf-8?B?U1UxeVN1ZnJXVmdXSmZLcXZKNkdqUWI0ZjZIcG8reGJNYzhDSStRbUJtMnhk?=
 =?utf-8?B?T2FqK2QyM0hZbXFsem03cEp4a2JmTEMrVDFKaUttSzlnNG8vTEVhK0IrRGNv?=
 =?utf-8?B?SVNYc0prdUVRYm41TmlCZjdnUG4xMStodE53MW13bFpneWNoWHNjL2xvVStQ?=
 =?utf-8?B?WXZ0Tkl4cndaRE9xdnN5cFJxQm93MkE2bTBiekVXU2d4Q1BkTW12aFdxTHFG?=
 =?utf-8?B?a0thVU5qWmdldUQxZGNDbGRCSkpIS3ZJY084YVlneXNwcGp0UnIrc004dmNN?=
 =?utf-8?B?UjBOdTZmSUUvU2RvSTlQZ1ZGMkY3ZHFMcXBnZmVmamZnQnVrcUwzUkROTHE0?=
 =?utf-8?B?ZXZrU3F2amVGTWxJQnVYYzIzclRhbm9uRnNrektPYzcyQXhGcW84N1FPdm5G?=
 =?utf-8?B?MGZPWEhURHp6dWtudmxKR01pWWtmdk9QR1l2YmtCdzVOR0ExOER3N25RZm42?=
 =?utf-8?B?Q1lMeDZBdFdRUUFpSHdKWjFGRkQ4UTdWbDBDQkRNRHp6aVJGZDFoQzQvRHpG?=
 =?utf-8?B?Rm1YMzFYOTdoN2lsK1FVaEpVMW1aazVRYXVvYTZ6RHN5YXRFaG9pbFphZHgy?=
 =?utf-8?B?ZHhiVVZydUlldnJXU0o1Z2F4U01XZlpqdFJYZUhqbTdEQVZ2R3lVMFRuYnF3?=
 =?utf-8?B?ei9lTzNKOG5ndHhiZE1LeEF0S1NGQ1k4S0U0Slp2dUh6Tkg5VmwwKzIxS2Vm?=
 =?utf-8?B?bDhsS25NYVNSdGhpbjU0MHNYNGlSUXRrTzRBM1JxdXFXaUFlWHpzWnFpY2F1?=
 =?utf-8?B?cE9uWTZvYVU5SEZNVWo1NGEzZlB3SlVMdnhDNTRva3dxR1JXZ0R5K3NlODIx?=
 =?utf-8?B?bmdrVzFXSlp0TTVDYmdHRnVXaUN4SEp1Z1dXUTRSRTJ3NE5Hcy9wV21UZ3Jx?=
 =?utf-8?B?b29YWXFYNm5iOUpsSUFYdUl1Yi9vTlA0bHNvS2F5dytQQTBwTmpnaXF5ZGVi?=
 =?utf-8?B?QTU3NHBKeDlHaUVQSmJDVVc2dGFld2RPMGM2UFVpYUhuZE9tR1NxMWgwYnJi?=
 =?utf-8?B?Z1c5eUtuMkIwVlRubHBxUWZ2dzBmMjRTZkpoVVFURUlKNGdiQ1lveGxqQTJV?=
 =?utf-8?B?RWFKUEVDL21XekpXN0VBUEFGN1l5K0tkZklCd1kzWWowTTV5NEk3NXVBbm1R?=
 =?utf-8?B?QkY2RHArakhhRnRxVVJxNFp1SmdRaGtFaGlWKzRJRGlsTUhSM1N5N282N0NV?=
 =?utf-8?B?TFI2dWoyMnpQN25wQURCK0ROVTZaOTIwUXltZy9Ua1BHODM4eHc5RzZXY09C?=
 =?utf-8?B?djZ2QXozbmJHdktMTVZWNDVvbUZmUkpRMWs1NUpVbEFCNlJBMEdpdFk0SFlp?=
 =?utf-8?B?OW5PNXg2bTc3dW5VSXJ6SnBMWTV4NTdZQTRRbVFNTTl1OVpXR0FaUmJoNk8y?=
 =?utf-8?B?S1M1MnNid3RGb0NobzBzeUZHeGpSUzRZRnNVZWxmUFhUdDIzS2lycFRJSk1p?=
 =?utf-8?B?ODRzc0MrYXAyZHRTUGN1THhNcDZEZXRJUVc2NjltdFBDOHJpeUpoNXA4TzBj?=
 =?utf-8?B?bW9CemM1c3czSGkyMVlKRk1tNHNFV2FmTHcwZm1ITVZVUWZINFhUQnluS1NB?=
 =?utf-8?B?aXFHOHh1MG1jUFlXK2hoU2liMWcrODlVTWhPdUZRVXdraXBobDB0QzF4NDdi?=
 =?utf-8?B?R01Ibnh2RDFpMEh4KzRsV1p6TnpqVUlldWhpSHpJNEUyaTIxK3RvcWk4TXFy?=
 =?utf-8?B?aFhDTmdScjE1OWhubmdOZlZoMHhMakpidTkwNHIySVdSTVBIWnRpRFdZbmhM?=
 =?utf-8?B?dkN0SHZOZDNrL2daVnlyM05ndGNBaWVBZzdhZ2dHU2toQnRRWlh3dFZJblg0?=
 =?utf-8?B?VmlVeUZTTmViYXpjbUNLSVJjNHRLK2dKZG12SG1OMGQwd2tFNEYwdVdkSTV1?=
 =?utf-8?B?Q3VOWkEySW1VT3oyWFA3L0g2VmZFNm1tV1V1Kzl5b2tiOW9MR2lZMjNoYnBR?=
 =?utf-8?Q?jFm0C9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFZpSHRXbTUzVlpGWEEybEZDcTJuZmJiM2VyQ2FoSFFWWk1tb3M2L2hrZ2hF?=
 =?utf-8?B?YkdPdGFjcGE0QTl2Sjh4VnhHdGV0ZHEvcDNCTHJTVGpoYkk2dkVVUWNPbmx3?=
 =?utf-8?B?MG4zYkR6YVBrUnFDQkVzQ1J6aTJDRDZOa3g5Y29uWmtYL3VJQlFJUGxqeUl5?=
 =?utf-8?B?MWVOcEo2dG9QOXk0cU55QUQyWXBNMmgzZFFiK3hMUHArNUF6L1g1d3ZmNGhz?=
 =?utf-8?B?NjdtZWNlS0ZOckJzdkZXYlhRS1Y0S0p6UmRNYWtHK3dndDM1VFRMZjFLOGZY?=
 =?utf-8?B?c3FNWEg3M29WWjRvTG4rdU85dG56OHMrenR1R1RZaTlvWXV4YkdjeDJNK3dZ?=
 =?utf-8?B?Ny9ZaXVMU2JGQW11ak5GRVlwc0hzbEU2a1ZJMU9TVU1semhyZVgyc25ObFlU?=
 =?utf-8?B?NTNjQVpjOXJwNFgrb0lVUHFleHBiekpRUzhlakcxcTI3SjM2V2lQT0tGNDFj?=
 =?utf-8?B?VDYxd2pYdUxPRjVaMGhQRGowTHMvMWdzVUkxQWQ1ZWtaUGJkZktBQ2VWQUxy?=
 =?utf-8?B?WStKckRLZHNMTEUxR3lXODMrUFpIR05ianhSdDUrSDdGTjh4VkwyQ3Uyb3NT?=
 =?utf-8?B?K2E4eWVqM3ZvN3ZISXJRdCs2ZHRFSFRTc3k5OFVOMnlMWGR0T0x4d3BRWUNo?=
 =?utf-8?B?SHhvV211YWUvRElEZnhFUDlxODAyeU85QUxEWkk5QUNjRkZMc21aT3ZMb0I0?=
 =?utf-8?B?RlBRVUhxU1N6aHVqLytxSms2ZlRlcWFKZUJ5SGtxMFlBWGx1SUJSdVVGdDNW?=
 =?utf-8?B?Sit3ZklMTU9Ob01rMjIrSDFXSkxyQ2ZYY3FxcFpFRkYydmFvRlBkWXc5aUFk?=
 =?utf-8?B?dlJPMEE3WXc4MWw3MGtpQUd3OXVqMGIvVE8rR1lYNWJBT1Zpa0dTa3JaVktH?=
 =?utf-8?B?VEhha1l4QzlucE5qZkJJNkFKQ0NZcGZhNnN1bzUwQlZpSlRQdHoyTTAxckcv?=
 =?utf-8?B?WHdtaWFNbldvUE91UVh6dUdXMHBzaFFOVWQ0WGdXK2ZLL2F2c3V2eXRSd3NO?=
 =?utf-8?B?bjhpczZYZVozeEw1MjNuYjZyc0p6UmNSTGdmcVV3dGk0MGFLU3NLNk9GV0cx?=
 =?utf-8?B?VjQ5akVBemFoaEtNb3VSMVdDWm4yVU9FMWJ5OG1CRG5wSHNhdWN4SklhYWlO?=
 =?utf-8?B?S2FKaUl5TFBiUE5iM2pjdTR2V3diSHdCdURMeHVMSnhkZmRLY0IxM3M2ckhk?=
 =?utf-8?B?RGlQZDlsdW5IcllWek52NWxHMkt5ZnR0TU03TEZtTk5uVHZQU0VQRUdMTDdJ?=
 =?utf-8?B?QTRkVUlhd2ZZOHptZDZOQXhYaEtNMVh4RENMbG1lN0N1aC9xb1BNNkpPK0hH?=
 =?utf-8?B?SGg0ZTdtNTN0WXQzRU9zWVhsMHVGS2xkTDR4TFM0a3BuSk52R2wzQUxKZTkx?=
 =?utf-8?B?KzhtdFgvS00yQ1BsTnkzbnREZmdNZy9BSnRvaStHMG5VSm1DUVlEby91T29l?=
 =?utf-8?B?K1F1amU2L3RDNUQvVDZkYnA4cDdUWG5aVVRXejVHRSswUzVuVVZ1akVHa1JR?=
 =?utf-8?B?RjBaRUdtRERwSW5VZkFiYWx4c1Q5RE5GQUVYaytsbWZvM3ZneG9ydWh1VjNp?=
 =?utf-8?B?YzR4ejhjOFZOLzBjemhUSW1VSTZ4TXRMWnlJL1dab2g2bTBpcWNPcnJqWHJ6?=
 =?utf-8?B?bG5KUDJTTXFyWTNWM3ZJTDk0RFpGSkFWVnpBbllqS2pUbktRWE4xMWdhZ3Uz?=
 =?utf-8?B?R09YNnEyRmVYUzk4WGFPaUVTOG15TDhvalFBcU9yWVQ5MWNBWUFMQXJoaDQv?=
 =?utf-8?B?ckdKaUtHU0o3cU4ySUdzVnA5QUJEaXhodWhpUXZtVGFmQk9qak81djNscWlV?=
 =?utf-8?B?bEFqcEViQXVmUlovVmx6MGo4OEp5bGhyMUVZLzRoYXdYeHBadUtMSndzZW80?=
 =?utf-8?B?UzAvdG02d01PdGpFUnUzQU10RVdueW1JNXlGVmpDMTl4WmVmazZYcUExcUt0?=
 =?utf-8?B?RWVJZmFkbHhWZlZUUjZISkJDNDFKK3NmVDNkNGZEdVNBWVMxM3B1d0hHbXd6?=
 =?utf-8?B?NzY1QTd0clFZZ1VqSmlYR1BManRxaktFVkZicXBRSS9HZldkWDVweUMzNFdH?=
 =?utf-8?B?VTFqN1BweS9Od0t1ZGhvUGxJK2gwSEZEeFdYd1hVSkx1SWY4T3NlQ3BQMWdM?=
 =?utf-8?B?UkgwcFFPNlcrcS9MVS9RZG10RnczREdwb3IwcmlZdUFlaEdaYm1rYkNKQjlY?=
 =?utf-8?B?SHM0cndxTkxLaDZUNTdCTnJlTHh0dVN5c2FSeFFjU1ZORzhsYnM3RTNITUd2?=
 =?utf-8?B?amdDWmV0bXVrVDh2Q2ZCSmpqS1ljMFBIVHlDdFBwWXJPcnhTcXl3c2JFY3do?=
 =?utf-8?B?VjdrNHMrMlpqTmhBNjFjaUJuTEVtc25PM3Aram83eVRUa2lzWDNmQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e8e196-9f55-4e0a-5430-08de42025a46
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 09:05:00.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JTDVESMhVV7MAT1OsFpf7EOSiZkKd4C+nHEEmkaA5a2dUWxapgRmNqv25Wz1s89MfJ7UYK0DFaGNEzssRK4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8912

Add mt35xu512aba spi nor support on imx943-evk board.
This nor chip support OCT DTR mode.

For the reset pin, since the nor chip side need 1.8v IO
voltage for reset pin, but the IO expander side use 3.3v
IO voltage, so to make circuit safe, need to config the
pad as OPEN DRAIN.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..19c02bd49cf5b0410b5d9f513ee279446ff79616 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -594,6 +594,22 @@ pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
 			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
 		>;
 	};
+
+	pinctrl_xspi1: xspi1grp {
+		fsl,pins = <
+			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
+			IMX94_PAD_XSPI1_SS0_B__XSPI1_A_SS0_B	0x3fe
+			IMX94_PAD_XSPI1_DATA0__XSPI1_A_DATA0	0x3fe
+			IMX94_PAD_XSPI1_DATA1__XSPI1_A_DATA1	0x3fe
+			IMX94_PAD_XSPI1_DATA2__XSPI1_A_DATA2	0x3fe
+			IMX94_PAD_XSPI1_DATA3__XSPI1_A_DATA3	0x3fe
+			IMX94_PAD_XSPI1_DATA4__XSPI1_A_DATA4	0x3fe
+			IMX94_PAD_XSPI1_DATA5__XSPI1_A_DATA5	0x3fe
+			IMX94_PAD_XSPI1_DATA6__XSPI1_A_DATA6	0x3fe
+			IMX94_PAD_XSPI1_DATA7__XSPI1_A_DATA7	0x3fe
+			IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
+		>;
+	};
 };
 
 &usdhc1 {
@@ -625,3 +641,21 @@ &wdog3 {
 	fsl,ext-reset-output;
 	status = "okay";
 };
+
+&xspi1 {
+	pinctrl-0 = <&pinctrl_xspi1>;
+	pinctrl-1 = <&pinctrl_xspi1>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	mt35xu512aba: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reset-gpios = <&pcal6416_i2c6_u50 15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+		spi-max-frequency = <200000000>;
+		spi-rx-bus-width = <8>;
+		spi-tx-bus-width = <8>;
+	};
+};

-- 
2.34.1

