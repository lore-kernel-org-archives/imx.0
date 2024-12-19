Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C17722579B
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618362; cv=fail; b=P74U3gfAn9xXri0WkQT4ua1pK91fwSsk5FxXKUSCIKB04d9KklBN0yIKg/wtKF/sp9JsT/mV860ln/DA//SGV8bAXPmH3WAHj9NBIUU19q/4sZ1y26hUyqzwFMKejHhAxLUkpUq9Qqytotufh53FU9AT4URrU369lWkPyskSx+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618362; c=relaxed/simple;
	bh=MNgV6YsZemvhZ0huaO6V33VmqxL/Uor5YuHc4SvS6L4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j+1WLcCmSXaLYY1N/pons62jt+cDa2HltxILIGamMfVxlcmGmi3tvmS0E20BbaaQypCxADJ1Esa236mzmRB9Mz/F/HtG/cZ0ZAtlkXUMtY8JTxvWjuzzEsI2xC2XfFS5V3xWFMcVLKhUuOo7TUS1+qllSK+RMo8BOlo8M/fV98M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rDEYnqjh; arc=fail smtp.client-ip=40.107.104.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rDEYnqjh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLjR2MufGPpaJ/xUbzZyhXsRsvDEx6Gd2nxF1VFg7VM52wJcbIPSwpKl7V6QhZm3FfkCM4qkVyIzSK7QkQNPf1lXbzd+mVzUoj2cTNCJQ8Z/x9F8yPHLl2xT3QzfX11F7uI3M2Dp4Z0AkOt1AK5TwLgf70GuhKyvd+Ei76vJTcTcsFuDcvFCjmvjoW1fRy+clzGDkg0VRoa59XIWQlwi6h9Z0lOrqe1VP51t/sqWbSB/uxNbIFU26AkxuqNChAw2r3bO3IdOnkD34gDkfwCfFVG4ocypIaSWRRyr/sEthGLoMw446wlkso/VwtamRK7icacLqaQ4tr3f75ugpkPXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRakj/Xgdf9SAZMTHvQNk088xoMpLAeaT4jiRGUFlK8=;
 b=otdNYp64870gzPAnyArh8/v9rKntodniGqpavziHwZrodWssTxi9m2Mr/NY2BLEbKomnPhEUaJy9Fa7c+plsmzBWKPnbfMlH5/eKqT8vtYQ+R+AlHwJJqzZtO8LHL1+c2ok+eCUQLpRae/JEIXFEuOhYGXPL0Vr+tKfxyEUu2ZW0ff4s1VSOf5Yt0y32g0Er/I55bz2ve+0bl+BSYrbDPnKUeZ3v0zBlGp4q5Fk74WCW+2uR9e0C7YfnGH3wReC66104RqB1ph0SCzInUVTbGx3G9vsSJcleJ+B5k/RvmedMP62SAhYDZEFkY9LW0huOAAhG3oryfIZFkLw5bOlI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRakj/Xgdf9SAZMTHvQNk088xoMpLAeaT4jiRGUFlK8=;
 b=rDEYnqjhD/ch45QYBCiF66mAqMcn1mjrEu7Jx76B0l7M1td80MhFQcCqLP2yfcY6Ux8SbzeeWY+rFDoPtBEhtO5t+COmU8J3x78EHI4B8raLt3NttFaWBOmyB2Y9/h0C/SGIwX3GM1Vxe4VsYOv1wtuR3a9XMFiWUxeMtMHe5xXW3cPdm3OiyFuKIEBEDJ0RcbEK8hSmoa3zcxSjyqj0CoMtQ8SQa+XKz7DIyNASx6cMlPtO7gt/j5g/GRhdfguDAGBUNPUci1mLa3VUH6spz8ArE+GsaMPAS4nU2Qmxkn+PmuO8zX+FNy6d8eIPccgeTDCFSB2pKUUyZ3MacNwRiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:25:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:25:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 19 Dec 2024 22:25:18 +0800
Subject: [PATCH v3 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx-ocotp-v3-2-b22371098071@nxp.com>
References: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
In-Reply-To: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734618328; l=9105;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EFPjusyV5OCGOG+g+/w5SCv3f0XaX5a9BcxGOgvkLIA=;
 b=3NP25a18VA4EHmzCFGnuMDVYJWFUPocUa3sizGRj222JTW0VVsA6XDPZxsvZRKjwLamrYJTyz
 prv014V2E66BzEDlEbZEfkc4vcYCWvQqluQq/cHEhAh/p23qWI9ZLQF
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c0e95f-7f16-4939-2912-08dd20390e47
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ymoxdy9pRDJQKzJoVXN4cEhYeHVvUEFPaXNicGhSQktBalFGUFdhNWo3SEw2?=
 =?utf-8?B?SS9Qekd5V3MvaCtsQWhTZTVwWXM0MG80QnEwbjNBSVYzbDYzL2R5cG93Z3NU?=
 =?utf-8?B?QWc0SlpsUnJ4bm83Qjl3eWxuTDRFc2tpTnM4YVdNS3dmRmlSaWtPZUs3VzU1?=
 =?utf-8?B?Z0hzeTBTMlpaeDJ0d0JYWjJ4Ky93Z0YrQWxVcldpVmNFNHNkZGE5YXRIaXVH?=
 =?utf-8?B?K29tai9MRS9Sa2NwclNMOVJHOGNYRlUrbFpRakJFaTJaVFBhenNyRGVjZU5I?=
 =?utf-8?B?UElkeGpiQW5xTUJQUkdBUkNCK3BYWjArUzJVUXM0YUxtdE1KQ0tLWHlGNlNM?=
 =?utf-8?B?T3Bqays3NEhNSVZGWjF3bktKSHpEbUpmemJoVGRSdE93T0Z0Y0lmOXRGZVlw?=
 =?utf-8?B?Q3d2WkVVdTR5RlFtdmJTWnhkMXpuSnJDQ1FzQ3RyeExJTGZnNWdmM29KR0gv?=
 =?utf-8?B?bHd0bkFYa1JSeG53bDFLNGVrRlowTWVueHBaUkROSDdmOHJWVFY0bDBCeWhQ?=
 =?utf-8?B?eTk1eWdnODQ0d3VZNEtmQjJtZ2haOS9NbWJzWDA4WjYvRlhsR1Z1cWhmcjZh?=
 =?utf-8?B?SVVOeERWSEsrQXczSDFEZVdTOU9sa0thMVRMUG9yZ2NIdWZRSlNkZE1KYzBa?=
 =?utf-8?B?V0RzNjM3OXZrUmdrZ1FDRDdPWTVjT0hmSFc2SDFra1E2M3I1Ly8rZXBJK3Ji?=
 =?utf-8?B?Q2Q2WnNjcmpaZjVyOVhrZEhOdWx4RW93TWU3WGExUmNJdUJTMEF3MjhPTGFr?=
 =?utf-8?B?RUtLb1hocXhBZCtIaEJLV2R6VHlISDQwempSamc5Tm0wSEZ1NlRRWmR6dXE5?=
 =?utf-8?B?TXh4TEprQ1hTbFdIQ2lucnJzeG9qODVXcTdDUFZQZXZ6QUdZNDkrenNXS1hu?=
 =?utf-8?B?d2VObFd2Q1BVZ2F6QzlwbXhiT09qUEhpY1dmNDJuQlhwbVBvSXpsb0YwNEts?=
 =?utf-8?B?M3owZU5kdE5yMGtZay9rMDhWdkljWDJLSjNoK1BYSmp2TG1HS3kzQXRBV25V?=
 =?utf-8?B?dzZpZGMvVEJNR1pzQUhlUVhQeExhRlZ3dU1Pc3dSaTNRY21pL0xvcG9OZHBl?=
 =?utf-8?B?MEFRTVQrY1lXdDVUbDYxaVBZaDQ4NS9xVm9mV2pNZTB1UjFNbGlNUXQxYlJm?=
 =?utf-8?B?cEpobW85Y1VFT2xoRjNDcks0dzlZd0hwWjBVOFh2WUo2aVNmS3hGUHcrVzN3?=
 =?utf-8?B?Y1dRS2UzSXVsbmQvS08xNnFTaUdGbHRoVlhmUEJIcUszenZQbXBzZXYzVnhy?=
 =?utf-8?B?NDBJb2s5SC9SVE9GOXZ5ckd3ODNzVm81TGhnRlJjN2JNRVRsTmtEMWFaMGU2?=
 =?utf-8?B?Tkg0VU9ZbnJsbjJ1dDI2d3dKL1BPMkVBNlZIaFFjMXZZMmx4cVI1VUF2R2lm?=
 =?utf-8?B?RmE3YnNIVWxtRmNDVFp6T0lVeHpZMlBIVTNxSjZlZytnNUJrckJJMlJXZ0Fn?=
 =?utf-8?B?OGFPMWo4SjNkMnMxTHF2Y3FrKzMrdEdvODk3djJRZllvU2E1UTN4dGgvSWtG?=
 =?utf-8?B?bUNuY3dPTk00WjVSQ3Fra255bXBvQ0lDTzd4SHVaNGs5YmxYWlBJQlUvSG4v?=
 =?utf-8?B?L3JqTHVFTzVPVTdEOHpuT25NSGYxUmhpRmJObGRQc0lzUVM4a0p4aXNpamRO?=
 =?utf-8?B?azZlNUY5a0ZaSnhBTndyUjF3SXArcjcwMlNDa1I5cVdCY3dBMFpiQk9VMkZp?=
 =?utf-8?B?aFRCMVdKQmh5SE9aZG5NTUFDa0tOa2hDdXlWbEtXNzB6U0dpdlpEZXRta1pF?=
 =?utf-8?B?Y0dnRnNNREtVYXFRalczZUF1YlczOUM4MmpqTFg0eDZISUU4c09ENVRzYlYy?=
 =?utf-8?B?aFJmcXZ3ekdFaEJnSGFQQ3hjdFRRTnFPM1NHY2FnREpFWDFjQ0kxenR2RmZH?=
 =?utf-8?B?STlRcHJDMW1vY3R6a2lrS042bU13clNKTWl4VTVQdTNWTTE1NzVhSU5GSk1B?=
 =?utf-8?Q?YvLd5m1XJfkuoYnoY0E2tIQZStolI1tm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWtmWFRHS0RRcVo2SFNyOE83cGlxeFhZYitUL2F1M29jbkFmK1J4VFJGVDBJ?=
 =?utf-8?B?TStIQ3RSeTlZZVV2Q0tRcjUxaitpTHp3Mkd2eDVwNGF6b1dXd1gwME52Rzcw?=
 =?utf-8?B?dGFJbVB5MGM4UVVWUklSVUhSR3ArUjVKNUcwVXZ5cEp4aytaK0wxRm1xb2Mr?=
 =?utf-8?B?VVRMRnJpUDBDSXdWaFptdEhRMmIwQWpDMGNhZUJxRnNuL1FoeXRxcVM1b1pj?=
 =?utf-8?B?WndYcWlqN0xyblpVdkdoSENQcmVOTGxSeGI5cXRtOW82ZEZkejhTRzlHL3hF?=
 =?utf-8?B?MlF6b0pRSHVYb3EwMCtWR0cwR2hSSUFFL1pXWC84V2dpMzEvQ2pDVXJ6WW50?=
 =?utf-8?B?NkdnTWFpUVkvT0Nnd09tRWt2ZHlSbXE0S05Qbzg1MktCOHZoTk5aRmVodHIr?=
 =?utf-8?B?ZFVWbE5NNE9tQ2hEbGluQ2FOb1VKNzZBaCs1TUhpWjRZa1dtMVN1elRLd1lW?=
 =?utf-8?B?akJwV0xoQ01nZTV2dC9YeE4rclVidnF5OEFMc0xTMHRnOXJzUnhDVXVPK1Vu?=
 =?utf-8?B?eGpneTI4NzB2dEMzNW9mWnMzblROWUt6NmFzczdpMmQxampFVWxFWkp2Mkcz?=
 =?utf-8?B?cCtTMzVzVGRSMk54MHVyaTltVzRjT1VGb1hxcDR6dEJ0YXZTejVFempMQ0tp?=
 =?utf-8?B?d0c5NEl4MjRBZG1HOEg1WUdKUWlia0wyZjVpMWkrMGtqTjI1V3ZJbzZqemFG?=
 =?utf-8?B?Q1duRHI2enJFS0IzaHV4RGVLU2FXMVE1S3gyMG03VHFyMCtMOVVJNEtVWTQw?=
 =?utf-8?B?bTJlTThUdmxqSWtHZlNveWFVUmVxR1V2N0ZFUjl0eS9wSGFGcU9jQXVSY21o?=
 =?utf-8?B?b2crT2VVQXRvcDRtYlJUZldMREFSaHRwdDdWdXNqYm8yZWszdkxJeFV2aE5J?=
 =?utf-8?B?Yk9rZ3Z5TEJKTG5tY05MaG5laDBBQjkvSE1ERWEyN25EU2ZNODNHVk9RREN1?=
 =?utf-8?B?eXdqcm1PaFBiZUQrcXJGYlY5YlQ3MXdVLytDRTdvN1ZiblR0NnBTWW1qNTFh?=
 =?utf-8?B?VnVDVFNIdXQyYjlxZUUxV3owaU95MkFVcHJRZG42V3JtTVVUOEZRSTl1SkVl?=
 =?utf-8?B?WkFGcnI5U0dFWDNmQlVqZFBKQmlFRFd0TXJmSXYxUkk2N2F6dU9oYURwc2ZF?=
 =?utf-8?B?NVc2UWNMZk5mc21BSUJMd05PV2xFekZJUGdLcmtUdGRLMVduQml6dDFhN3Zk?=
 =?utf-8?B?bHdxbzZaclNmTlZQYkNPL29ia3pVN2VEejh5MWVLbmpVR2V5Rnh6RkF5dzJL?=
 =?utf-8?B?MXliSnl3M3FYMW1xVmxOc3RZUUEwMEZpSE1QUFRlQllwK1NodThSMjcxVlY0?=
 =?utf-8?B?VUNpTENzM0pjaW10ZXc3dEF4VFVBb1ZudHFrUGk5dVpRNzVjVHFSYkpFeUtG?=
 =?utf-8?B?cGVBSEh5TkFzSmd4U1hLeVhUVnhkdG5JMzhrS2MyS1F1aWpKT2YwZkpKNG1Y?=
 =?utf-8?B?UDI1K1RSVStndGdkVTdTLzc3YzQrdXhWWGRPL01tK2wxQjBCM2dpVmJNVHhF?=
 =?utf-8?B?UXVocndxM2JqZlJOY1laank0TVhYQWp3WHJwY05sZkY2U0g4d2NOUGpidTZN?=
 =?utf-8?B?NHNCK0tqaWx4cGIxVlQ0Ny83TjNoQVNKZGJRREExRUw3eld6bWhnWHNZNCtw?=
 =?utf-8?B?YmJsaXp3Zk9nbFFObGxSRCtyQUE1N3BoRDVNSkFhRm5BZXVac1RmSDh0K3dq?=
 =?utf-8?B?MUNxamhKbEdKUklZNExodTBNV1RrdHlYMGo2b1lDU3FrVDIyczQvU3VtdERY?=
 =?utf-8?B?bkdqb0ZVYXpHMlhMRm5uYi9NcDc4cit6TjhlZlFONnFINm1xemN6RVNGUVFN?=
 =?utf-8?B?LzVaaDZiMFcrWFBGYXliZGpNbEh4a2pIYUZxTy9ieWtlU2tPWGEwZ3VWWEt6?=
 =?utf-8?B?THBIRll1Zm1ONmt1ZFR0RS90V2dBRVBndXpPWW1oVFkwUU5LR0F0NFd0YTBQ?=
 =?utf-8?B?T21TdUZDaWJGdjcrM1dKNzFPa05FR2lxczFwaG52bFZ5Y3BZZnNPdWU2aWNK?=
 =?utf-8?B?dHpVRUVXa1pRTnlFR0p2cnVuM0VCeUhEbFV1OFVQbzBNSEsyTHNJcU1Pam50?=
 =?utf-8?B?V2dMc0tnSzlubU0zTkN6am1GMDErOGtCb2FtdFJEWXg0SnpJbSt1R0RRMUM0?=
 =?utf-8?Q?USu/R7TImOO7GMeCceXf65y78?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c0e95f-7f16-4939-2912-08dd20390e47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:25:58.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmcbndP4NUsvLV0xyPzYT2Ibmc4R19T4i0BhjRlUCBT8raGkDq8BkrYHdHN2WCL8qrJBSdCRu2uqC9qB7AFtKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate each node under '/soc' to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/imx-ocotp-ele.c | 183 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 182 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..173863b1fd7de150576b78f03c256a151b174389 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,11 +39,26 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+#define IMX93_OCOTP_NUM_GATES 17
+#define IMX95_OCOTP_NUM_GATES 36
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	struct access_gate {
+		u32 word;
+		u32 mask;
+	} gates[];
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
 	struct nvmem_config config;
 	struct mutex lock;
+	u32 value[OCOTP_MAX_NUM_GATE_WORDS];
 	const struct ocotp_devtype_data *data;
 };
 
@@ -131,6 +149,96 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct platform_device *pdev, u32 id)
+{
+	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	u32 word, mask;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(&pdev->dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	dev_dbg(&pdev->dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (priv->value[word] & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct platform_device *pdev, struct device_node *parent)
+{
+	struct device *dev = &pdev->dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_iterator it;
+		int err;
+		u32 id;
+
+		of_for_each_phandle(&it, err, child, "access-controllers",
+				    "#access-controller-cells", 0) {
+			struct of_phandle_args provider_args;
+			struct device_node *provider = it.node;
+
+			if (err) {
+				dev_err(dev, "Unable to get access-controllers property for node %s\n, err: %d",
+					child->full_name, err);
+				of_node_put(provider);
+				return err;
+			}
+
+			/* Only support one cell */
+			if (of_phandle_iterator_args(&it, provider_args.args, 1) != 1) {
+				dev_err(dev, "wrong args count\n");
+				return -EINVAL;
+			}
+
+			id = provider_args.args[0];
+
+			dev_dbg(dev, "Checking node: %s gate: %d\n", child->full_name, id);
+
+			if (imx_ele_ocotp_check_access(pdev, id)) {
+				of_detach_node(child);
+				dev_err(dev, "%s: Not granted, device driver will not be probed\n",
+					child->full_name);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(pdev, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct platform_device *pdev)
+{
+	struct imx_ocotp_priv *priv = platform_get_drvdata(pdev);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 off;
+	int i;
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	WARN_ON(!root);
+
+	for (i = 0; i < access_gates->num_words; i++) {
+		off = access_gates->words[i] << 2;
+		priv->value[i] = readl(reg + off);
+		dev_dbg(&pdev->dev, "word:%d 0x%08x\n", access_gates->words[i], priv->value[i]);
+	}
+
+	return imx_ele_ocotp_grant_access(pdev, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +269,43 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(pdev);
 }
 
+static const struct ocotp_access_gates imx93_access_gates = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = IMX93_OCOTP_NUM_GATES,
+	.gates = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+	},
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +320,51 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+static const struct ocotp_access_gates imx95_access_gates = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = IMX95_OCOTP_NUM_GATES,
+	.gates = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+	}
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

