Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869963542F5
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765861; cv=fail; b=MoQ74plQGIm2uvxizHBP3QtxwSyKveO3FTAWpAQP47eC9kYb9CQ6QqIIybXoyx3acI88Ks85R0y0WxQ3AwtIndpB+m9V3rWlYN37Xm1SFNh9jqD4FhZtTfMuRPzvp13UcwOsmydkQbHS9A7Swg4FT8p5qieHRcs0BZAsPfbV4xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765861; c=relaxed/simple;
	bh=9AVZ7g98HCUW+biiIWRQXZLKTR9QxA9KKTGOEOX14Y0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p29z5PkaP6RI6K9F4PIQm2cmUjCJGFCNSTL6pEW0kihxe0qooU5CjS/QBUh4L782e8+O9L/b3ebhzdNirmdOuCYJb0ijx+IqEUBTwtKy0IXYzpPt4FazPrMNCQKr9wnaBx9mgVfi4qtJyKvAMaTBO+pLsMiU/t7rMkP6o4pXJtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C/4wTqO9; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C/4wTqO9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUZJl+jeKELDzON8qPdhJ/vxzYd1IXTE83MUWLLda6HduTvtReaTH3ujkwYZVIZtVlehQO4YuMDCNiBpwTEQmoIqyEUSv6oS0aTECPlYEwSXoAVd/z9W/xNPCuY6+pbkiYjHzBLDf5WQ5ZvdXbz/OCRPj9PSdfpynxkvK8QZfCxwnj+HKCvMcZgsZrT/qDlOja/HZC23qH0aOMxfhA0TwzWoxr5eVA0aGgj5SnvkDmuy+qg32SUmc+4uZM6PDv1YkUlraRVn9kKWLEgV431T2qm/3VBWqkZ8e8LRcanipq5U4jVTOd6TYAxgv77bbQBxYSLELIhJcO2CBqWmoK3HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOF325JRxpprVW1RvHtQsgTq6lX5grr2hfPUcHLt2ZA=;
 b=Y/fos/pMsTCXZdzxSnUyxWVpGKUnLN9AkjiVrOkh03MyBMXS1JiX2MrkizufZwo+L8YGOtpTA+FXOmEjLnPrYKNG3Z0ivFrW3712Pod0Ko14wj7lPGWKlwGZS9ERvyk7xFb+/WTpeMtmhWSOEsiJz5YYPm2ChciQseQtnzLk7YMByWrCqJG716uBJYP3pHKra2U1XQb1PxAfzba0gWx53gcNsnEojc14cD9yeKyV8ivVqF6+IbPBEXT6ouQBFgYio4BLUWU26XBz6prN6/pcYm9r7ADtjZZ/SIVV8bita0PGSkW+WnBylBeILWlQ1VIcp2HhyBUnHGrwv8BWK2MFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOF325JRxpprVW1RvHtQsgTq6lX5grr2hfPUcHLt2ZA=;
 b=C/4wTqO9fVB4d8CWLYUHhO+MLv7YqReCwK4pfGc5LmYWf24a5rbmDv9L8wG2ggjVhCF3Vd5SDhdJ6ecPpCLvyo5iHxyLAkiU/KCMPmgKMq16ZhD732a/N/Ux5CuezjdGRUpZGGmZKSQeyxYpUMIcV/QkSqoaZEmF2r1CwrBJxYkGcd6ewetS5jphhYxS7MvbvI9AdOtpm09oozPgQ0AHZzfZuB46Ogxjp3fpRyqB2Hqzqzh/XMnZmqFuqhODz6nKGaBdnDoM1BlnlWip107wAOypMtcyLYTtemWXfoBh27TNN2CX8L9A/9UPoKpgqiBulJbUUzDKwOJj+hZZ4B743g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV1PR04MB11038.eurprd04.prod.outlook.com (2603:10a6:150:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 09:37:34 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 09:37:34 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Fri, 30 Jan 2026 17:36:28 +0800
Subject: [PATCH v3 2/2] arm64: dts: imx95-evk: update the dma-channel-mask
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-b4-imx95-v2x-v3-2-95af05bece95@nxp.com>
References: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
In-Reply-To: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV1PR04MB11038:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b05e90e-7e05-4896-bff5-08de5fe332c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|7142099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnFQQjhpdFpZR011R1VSYTNoeEJ6U2dmbUh5WEpURDRuOTZ5QkVxS2s3MnZi?=
 =?utf-8?B?bXQzK2ZrVkxnKzd3dUpZT3N4VHRveHZiRXRxQ0NLMUFJSHpVY0JYalBRQ0ZT?=
 =?utf-8?B?aVRBenBYQU5kRE4rNGxNSzhsSjhzSUl4dm5MYk40Nkw3ZXM1SERVSHUrSlhJ?=
 =?utf-8?B?c0FlSk9wQk8yNFI3U2JITzJxaytwOE43Um9lMlFZVlRRclRPY1BScjBUOFEx?=
 =?utf-8?B?ZWdySWtjRXZ5d1RKSko0TWw0bWU2bm41KytPa1NVL2Z4eW9kK2M1U0RrTGkv?=
 =?utf-8?B?VFF6TXlQQkxWVmp4YVUwelhObCtSYmRTcG51VnpOUEo0ODhvOXRIK1QySnha?=
 =?utf-8?B?M0duZDltMmk2N0c4eGtFNWlQb1RSWWFUQmtyM3JWQTVYQmFwT2NsdG9Ca2s0?=
 =?utf-8?B?bWZyY2N3QXhjempzRGxoY2RCU3lBWUJid1c1cCswVXNBTkJGM24wWDJKZUxJ?=
 =?utf-8?B?Q0NpZWRFMURERHpHQk9HdTRKOUkvemx0NHZMRDNyYTlJYWI1RkRuQjl5Q0Rl?=
 =?utf-8?B?Ly9wVjdDQnBJMFYrNk1McXJkNWVydFVGcjlyRzhmZnhRQWNRVkhTVVRpcHIz?=
 =?utf-8?B?VmhoaFVjTjdpU1VRQnh6eWpLZ0VRUkM2RE01eVlSd2RkWVMzMkhGUlQrMUVV?=
 =?utf-8?B?QjRuMXVhTDZ0RlhOcXhPYUpmcXRTTnNZaGxGMnVCUFpNRUR2T2psQURIdFQ4?=
 =?utf-8?B?RUZvcXJVWDNQYnFZU0FBWjhYMWVFWVF1OUxXT1h2ZWNaM3BSL3VpZFZzRFkv?=
 =?utf-8?B?d0owc3FEODZVc0p1b1pFaFcxSkdOblI3d2twVlhscTRmNy8zTWpnaW93NkJ3?=
 =?utf-8?B?cG80L2hCL1hwVFdUTGQ3OGhraVZKc2R5S3JZVXRxbEtObTd2bGNkV1lkdnlt?=
 =?utf-8?B?dGNQVkZ4VmFlN0Y1eHREMzdhNWZCWGJjc2dFakVSaCtNV2JtdGF6bUJySkl6?=
 =?utf-8?B?ajZ6U1kwZCs2R0o5TDJPdG5Kam9UYmE5MmhNVXRPL3p4VUI4RU14YWRRTmlE?=
 =?utf-8?B?dHIvdm9iK1N3bjA4MndBdmZGRVpwRmNxOGxNSkgyVVBUOS9EMnpUQ3FucXc0?=
 =?utf-8?B?R2toNUVaS3hIUy9BdytNMWZ0aTkyanF5aWthSTQwa2Q2SFIvejVDNlFoWjY3?=
 =?utf-8?B?bjc5RWZqd3drSHVzQitVNnltR0U3ZWhxdzV6MThxMHMraURsMGl3TFRxNlhn?=
 =?utf-8?B?b2NzZ1BIVkFGMXRwcUpsUllTNmg5U2hQSUlhRkNraTd5V2RvT09JUkJ0Q0Qy?=
 =?utf-8?B?RC9OZ1ltdkFZWUhLSGxsREJNdGV5TEE5RmxPQjRQaG9KYkNtK2RJMzMwQmto?=
 =?utf-8?B?aEl3SjhacmhBYkdMUUpqU3NtRDdXb1hJYW5qc1IyYlhNbVhSTEhEZXNSdks2?=
 =?utf-8?B?Vk55VVFWWkhnN3FWT0ZIZlF0TW1RMUFZaEp6Z0MzbW0zZUVEU055YnZ4cnFS?=
 =?utf-8?B?Q3dqTUxqSlJFaEFTZEppaHpTK1lSYlJ0Ni9pczN4T2t6WlJKdHpyTkNlSlds?=
 =?utf-8?B?QXgvanBENGlja3NLL1c3SVFSV0pNOEg5Zk9aTktGN1dONTU2SGpLd1FCRnFR?=
 =?utf-8?B?MytZMW05eUdhN01zMW9wZXpEakgwK2c4OWZxelhRUFhCSDNPbDA0R0VzNmVn?=
 =?utf-8?B?Z012djhTUDQ4YnV6L0d2QVN6aGpjTTBFNTYvSTZWTWcweml4ZkNHNmQ3eElC?=
 =?utf-8?B?Q1FoOGpkaTk5ZExTaFdFNEdaT0FnNlYzL3hxZU9sL3FyWXB1VlpGMEJtYXpC?=
 =?utf-8?B?MndMVVVuNHJLTWxFM2pGY0tENFd4VTF3TGdYRENleEhjd0xoOVB0TUh5VUMx?=
 =?utf-8?B?endyQ01UK2szK0dqNUR5dGtKNUtZWHY5N1NYdGRnbHIvdjZQRzc0U1J4WjZK?=
 =?utf-8?B?dGhReFNheEJnN1V4R0ZxK3VTdXNjOVlHcEFOcksrMkc5M0krTzZDdFRTaEVM?=
 =?utf-8?B?SWRTWWo5ZXJJdEw3elFJckVWWW9ZWXBxRWFESTVrWnBtMDgybndnUHBLc2U3?=
 =?utf-8?B?VUJlZEdiK0RFQ0Z0VHRQSDZPYTFrR2lmRVlSR0lIdE1uN0RoRldmdXgwbE1D?=
 =?utf-8?B?WCtudkk2eUtuOEZHR0QySlZuWmg5OXJDR2JTdHN1Z3Ryd0pWYjBLYndab1RH?=
 =?utf-8?B?QWV0R3RPaXZYVjZSQmRBYTdzdXE2cUtIbVRTUlFzVzRCdTZCbEI0Z3dtN3p4?=
 =?utf-8?Q?clWCz4jkPA8oMYLoHaXS+oeVY/lImPo5/EuKxPEyKLIX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(7142099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVZ3MGM5NUkxbElNbGpUVGdDNndiSjVqTFJoaDJNZnc2UVZ6QTU4SjZjam1Z?=
 =?utf-8?B?bEV0VENxLzNNNEhkRG1pWC9BbmJMMGF2dkdzTDFoVm5hSG1wTFdmME5nTW9M?=
 =?utf-8?B?c2F0cjJhRkRHNUFBZjhLb0xId1dZRVpHRm9MeVQ5bGg3RUEwbnZyN05ZWEZh?=
 =?utf-8?B?V3czdUw2TTVxT0hxYnV1VDl3dDlVMVQ2RDc0WkRwTU1MaHhiN1E0Q1ZaR2FB?=
 =?utf-8?B?cnNNOEY3dVZQWG1kYm1QdTgxOW1PRGRoeit1dzVCeGZ3VVJkRit4VGNzL1Fs?=
 =?utf-8?B?aExiMklDVG02bThob0R3UzVqNUZLZkdJNHdkWVhNUW9FM0FSWWI1RCthYzNF?=
 =?utf-8?B?bnkwMkhWMGJRTno5VklySEVLSnRqWUNHdFY3SnFCL3BvUjY1TFdIYkpCUEVZ?=
 =?utf-8?B?aTBaVFhVSHc1dEMwdmNhbW40ZUZpeFlSbWVvSVJMK0kyS0dQczRyb04wNFlq?=
 =?utf-8?B?VnBQcjIwamJVaFhRM2Z6TG5uQWNFSDlOOFVLQ2pVR3Ftakg5cmhUMmtLTHdF?=
 =?utf-8?B?My9BMkJiZ1kyOXFQUmtWYmN6VWZmZzllZFFQdkFxMVJFdklUQytkVmtnUnlo?=
 =?utf-8?B?Ym4wK3JPaHRxWnJ1QnozbHVGODJGWlQ4VnYvK1Fub1BvdEsrYVpBMStMQ1Nx?=
 =?utf-8?B?Q2J0NHNFdnd3VTlYUzBPR0NldWkvV1RnZnQ5NHhWVFRHVmtrV0Fvb3RjY1ls?=
 =?utf-8?B?TTJoU3pFNmhWbGFrOElJK0p6V0FEZ3VWYUZXSDBJWFljbHJiY2hYcDJpS2Z3?=
 =?utf-8?B?NUVVWFFIS29wRkE4dnE2M0pVSG50TkE3QnZmZGpmbE93WmNiRHhlWFRyS0tF?=
 =?utf-8?B?M1p4L2p0cjNuT1lwZys2VUNXWTVPQnVuUnNIeUdHTkVlSXlHZEVSZUFkWHBk?=
 =?utf-8?B?SUp2KzRaRGNlTW1FZkxqYU9ZamY5VUtDaThZZ2QraFZLTGhRNDlEaldFYVdZ?=
 =?utf-8?B?TnJoSHNVVHN0R3NnWld0dFF3b0pEZ3VScWlmQytPcHJDWmRYU0lsLzh3Wldp?=
 =?utf-8?B?TVk1Y1FCbFRXemE4djZTeVlWRHVQaW1LNmY4ZXhRMURJZ0xjd3BjQ1gzdlpI?=
 =?utf-8?B?NGdnT1BnQkhWQ241K0NvcnMxWHlzeDZoTGNXTUtVeWYwWlBjRnVsVFd4YjRJ?=
 =?utf-8?B?NlJNR3YwbWp6bDBWNnR1akhXWDRzWnR3RnZQWDlWM0RmTVRRaGFGblNSRnZz?=
 =?utf-8?B?TndtREpGM2xkYndvazZVd29rejJVZjZab2JlbmZwb09wVTY2OUdzMXRmOEJN?=
 =?utf-8?B?VmZnS0dtR3NQc0JuRnUrVDkrYXdIWWo5UnBFZHp2R0VGek5PUDlaSno0UTFq?=
 =?utf-8?B?d25ZeE5laFVXNTNFOVZiZ2FVL2dzOXBLYm1jeTJFVlYrTnV6UHRMZHpmMENM?=
 =?utf-8?B?S2JQWGl6MlhML1hsU3FSVzZiNVNTL0tmdDkvQ1dsVi8yczJ1RU5CYlFCYThn?=
 =?utf-8?B?dGxKbmNMWFYxVUV4NU5wYURLWDlNUzBlYWsrdEpqbHI1dmxxenJmOXZudGpL?=
 =?utf-8?B?aWpiMDlhTERUUzg5TnJKVHc3dzY1a3FUY2tTdC9WQUFML3cwVHk0WFRDcGRC?=
 =?utf-8?B?Si8zRFE0YnVWTkRPd0lwall4NDhucUwweXpSR0tMWDNjL3F5ZWorYTkva1N3?=
 =?utf-8?B?VnhIRlFlYng3ZzFPelB1eFFMNjJvTmFFdjMxOXZVeFJXa1FhazY0RzhDZDdu?=
 =?utf-8?B?b1ZtZVc4NFBjNTRRejNhZjR5aUF0cjR1d2g0RTFnTEpxSUNiSng4cS9SWVFI?=
 =?utf-8?B?MklkVDBKaFdzaUE3MTNjS0xyZWFpckNOV21pTmhUanRJKzl0d0ZtQ2g1bWl1?=
 =?utf-8?B?Zk5WK3pYRndzNHpoZDI1YmhXcjJMb2hzM29Rc2dhdCtLRldDeVM2QlBlSHho?=
 =?utf-8?B?VTRBMXJHSTkxaTRhVWdQMzB2QzFCMTZ1cmpaSWhGK2ZGNnRFZThiNHE0VG9V?=
 =?utf-8?B?Mm1FT1VVOU13RTZZNUhpOG1EMVJZSkd1NUEyM3lSZVIrZzhJQ0V1aDNiZGho?=
 =?utf-8?B?Qkt6eFdmVlB2N296Y29XMy9uSlVqQkhEVSs2bFdZRy92cVBEUWhrZkFLNmE4?=
 =?utf-8?B?TzZLeUNheU0zTndMdVY4U3htRFI4dFZuVjVOZGFWMExCSzd5aXd1cUZxNDdL?=
 =?utf-8?B?LzFxWEx2ZkZkQy8rdXZRTGUvOWpIcUI3cVczZFVUOHdBWThmT2ZXMFdlT043?=
 =?utf-8?B?N0s0WEowTW5wZzY5TXB3UTU1bm9icDRic3Y3aHFoYnNWcVhzSEREbjNUYTFv?=
 =?utf-8?B?YW9jcWYrVWxEQWxmVmdVK2NEd2ZOamJia0xHZTJ6YVltQkFtUDdhYy9POVNB?=
 =?utf-8?Q?X3PQVw1Kv7Tyg2PHDk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b05e90e-7e05-4896-bff5-08de5fe332c2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 09:37:34.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzM+pCwKPnOQHlt+nE0jrBe9VITiJHiMuU4UIjeieb0YMmx1EmTrv0Ott+Qf4F+Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11038

Have reserved eDMA2 channels 0 and 1 for V2X fast hash in imx95.dtsi.
So update the dma-channel-mask from 0xc0000000 to 0xc0000003 to mark
channels 0, 1, 30, and 31 as reserved.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
index 808a9fe3ebb2b9557be9e428583e76c32517de08..264703f6eef64813d64fe07713cf92fd02fa0778 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -55,8 +55,11 @@ sound-wm8962 {
 };
 
 &edma2 {
-	/* channels 30 and 31 reserved for FW usage */
-	dma-channel-mask = <0xc0000000>, <0x0>;
+	/*
+	 * channels 0 and 1 reserved for V2X fast hash,
+	 * channels 30 and 31 reserved for FW usage
+	 */
+	dma-channel-mask = <0xc0000003>, <0x0>;
 };
 
 &sai3 {

-- 
2.37.1

