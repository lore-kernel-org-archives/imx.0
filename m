Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499654774
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913233; cv=fail; b=JwQgjmSXQJY94RfAewjrsFviCbZhf/RreY9xNeSkAnLY1sbKv80GDuANE/AAgmQGCAlCulmKMQ2y5VkqnZM41NpdJIgaw9No5d+mbs3WLqzPBq6IN30BsNB1cyTI9p2sd4bkdYrXCZ1mlVwftqagFqE0b8Cbi6vAVZUWFfOvoeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913233; c=relaxed/simple;
	bh=SxKTw6Fay18xWblZFsJRVzd2iC7UXA1lv1zAsC8eJrE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ckf+s2LtAX3fHT3MKt3UBIAnIsfFLZZyk0gsWmI+wm6I/ZxOTlmZjyYqiObzN4vv8hvDQtonNt005m9MnZmsGwEOGwtugFo3zY0RvO43s2uE7JOo1mjMxGQl40fDO02Zoa65IeiI5yolwkN+dQHJX2OwvaSoga9mSzqu0dGUD/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PiymY9Z0; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PiymY9Z0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0DRc70Lj/zBmRcUEV6mIC++gyslanAH8N+DCsHj15i+HNKcOeodjdfW5KpXgnUZlVhrq8eae83+93XNe+GdJlh6AifUqwO8jB8tOuElYAsaaqCTCLc3mD1pDTWENn18SeospIMQ10WV8aXubMOh3D5n5ihmybFbTO3iD53cdSKbNAwBxbbsPe2/wgGUm+i5nsP7coyIG/hXZfsn5bMyiyDUBymbwGUZ6M1Cdim270SBWuv802m0uu3UomVavZanQV8Rw9ktxUkrTCVkqJodUDHcUNLBAiNITNNS707TCYzRSakyNUmbW5u1RxW9iSHILo+BYk9T1BO5zSGhag3v5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTVhun3VL4i0VqUFEa1sxgRXFGKRiCn+QdX1NstRjfc=;
 b=vps6RCcA/hyxN6+dRfuea7qb8XwHLl77zkR6dJWq9+wA+MyHWP4chOmkAj5qmmFCX7VxYOfSX8WqLp7TnwWsezMezO11rfKD90V8AYt3M597NQElODxJsRZHP0hGSQMqK4M4AIQXDzJPdc3gvUeg/JIlWXKjZl5nYB6oAeYvJNELREfnfXU4ZDeH9mCmZVUvhzWXKE/MhQHQzrNTjP4vZxdDSCLHzE33Q9/t7tV53tY3RBDsYFQekUwYkzVL7GMT3tEOwOzE8ipxbymo8+Wj7dVAwKtkwCfFANsdkC4iBa3HEPHicjttDhgveyhnpFwLvpICK0iUHyxiTRR3E9oNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTVhun3VL4i0VqUFEa1sxgRXFGKRiCn+QdX1NstRjfc=;
 b=PiymY9Z0s5ovLM1oxSAvjM9qKtDFk4H66jiThpbNJR3hq+Dw1657at3EN/zCXhJLQLhuie6Kqwgt41852YR0D25yQsc1ZtNYiptjZrc1tg6V5SnGdoBMNsKMv/Uxa7TxtJsvD30SLb/6UpWw+3U0r+yFDYwIl0gSXy0NRwyiX+OItG3gQRh35a4dAPqmcoJXCS4IJFmph8DxXKvhgY3GGCpbQIjgCq5kGzw5zcztOkiS14pRLZnFS23v4pnYmcpOKR+tBowPni47kz33+WzYagKkciL1Ea88HPcATx0SkdFgskd2nIQKVE2lA6J7EVRindaCiDMjIbCjWbEvTTjIRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:47 -0500
Subject: [PATCH 5/8] ARM: dts: imx28: rename gpios-reset to reset-gpios of
 hx8357
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-5-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=2046;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SxKTw6Fay18xWblZFsJRVzd2iC7UXA1lv1zAsC8eJrE=;
 b=IDDHXSydu3jp+3BDLcJrX9+lIZokZvGq+tz3T8GWJnLtifWlSAkB9Ee8rLssVLsuMNdQPX6fI
 DOSLnpkkkCsBE4WXiWnNcSsiCKweYPUACFaSL+FXiK1oDRbSdi5UI1i
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c58f765-50dd-450e-a474-08de6a529c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUNMZFZSN2s3R1JqY25KeGladVlXWTFYd3c5d21Xb3hWT1RGbDdpNnQxeDRC?=
 =?utf-8?B?SUdsbjNnVm94UUx2TjJWcGtFMW1nM3dPVlhHUnVacmRicTMvT2p6RjZ1THVh?=
 =?utf-8?B?RWkycEkwQkxNOGoxMHl1eWJvQXZZYThtMHRZM04rQVBCZmkvZk5Fa043Q2FS?=
 =?utf-8?B?aW1QNFN4eFpudUpYOU1vNXJmTThMQ1ZGeit4MnNUczJ6YnY5eDgwenFPRGs1?=
 =?utf-8?B?THZLUldzMHY0T0QvVmxmNDZoVjlqeEJKYm1pRGp3U0VwblpicDUyUjJQRVlS?=
 =?utf-8?B?cW4xekhTK2JrTVBYdDNveU42ckNIVnowcS9GRTVvMnlvLzJVWk1FWDRmN0NR?=
 =?utf-8?B?TUJLNTgwTmR2a0hoTldmYXNSeThLR2dxNlZSOXhkaEdUSTZOdDdVekdZbk5z?=
 =?utf-8?B?c3pLcC9GaDRRdFBCeWhkdVIrU01rUzI3eTZ2eWE4emwxWDVZdTU1U2RPMUpV?=
 =?utf-8?B?NkVtUFBCbDIvcE1KYkhvVGdxa1JIcVhDelRlLzFGUFhVcFRwcVd1bGFlWjFF?=
 =?utf-8?B?TGh3WmoxemdnT2YvNVlYUzZnOFhDbC83cnZiUklIUHpqQzFzVU9LUDdCbVdY?=
 =?utf-8?B?WkowcHlaV1lnU2xIMXZOZ1FpUTlCaVhqem1UdXZyNHRZVWRlRWFoSGZBZFRo?=
 =?utf-8?B?dnJ6eFp4K3piUHg3MVAwWDliRzBqTzc2SlRDSEtzRlNPK0ZJMTloWjZsd2l4?=
 =?utf-8?B?NGtsMFVsNE5yRmUwelAvVW96d1IxaHdhV25RRG51ZFN6RmtGUllvWWFNQjda?=
 =?utf-8?B?UGx0OThNYVI0L2J1ZmllTEZuNXlUMjNqaWJOZC9OejlyNzhiRTR4a1RVMENy?=
 =?utf-8?B?V1VrTWxUYTBzbGEwUkF3dyswWjA5U2xqRHlkckY1N3BOcEV5UFY2dnZhQkN4?=
 =?utf-8?B?S1ExV0ZEUXVncVZpMTRIUEZTbDBWN3JFTjBqWWF6NzJIZ2FER0IvWnFOQUx6?=
 =?utf-8?B?TjZxclNOVjhGZUNzRmlnZnVmZm9SYi9tTGhNTXVESG9FaDVYSW1ZVzdINEIz?=
 =?utf-8?B?QVhmTGFETC8wMlp0UmJsU1NiR2dVVmkySE1wNHo5VGMyRUUreFRwUlNhNHhX?=
 =?utf-8?B?U3cvTFNJdU4yd2FoZGJuand1a1dob2toeXFudkgvdDR3cTMzSWRkU1ZTemtK?=
 =?utf-8?B?US9WOWJnQzJVUTVhVWcxU0t5T2I1dzdLa3hVa2dmeTZ5RGo5ZEFGOGVmY1hP?=
 =?utf-8?B?WHJNZ2NYL1k0dXRUdktjMGtOc2dlQ1BDWTRQNUJwMVhqRlE1eFlHKysxc2Ft?=
 =?utf-8?B?dVZYK0V3ZHk4dFFUZy9LUEE4UzJYNVFtOVBodWdhNXdvSnBmRHphS3QyampU?=
 =?utf-8?B?QVR5NE1rQUdOdll3bm5qMUpQN094NHRlbk5vSERVNGc1RmhxUVVhQ0FkVHRF?=
 =?utf-8?B?TjF3OTRxK01DNlpldGE0MHR1eXJxT3kveUxmVllVYmxjWXNhNmc2ay93Vzdy?=
 =?utf-8?B?bkNPZC9WMjdDV2lnNkM1dmRhZDhOVHNFOVc1RjJselJBVzcwZUM5VVhjcUpF?=
 =?utf-8?B?OUNadk1zQ3dtZ3JSeDMzalZhTmNia1BRRzFhczdzK3AzOU9EbytZN0xZUXhr?=
 =?utf-8?B?WWpSbDIrd3RtWDlwY3l4cmtVbGFFQytBVzJyOHFSU2prazNycEFYVjJaRkhJ?=
 =?utf-8?B?S3ovRmdlc0N2TjBEQWFUMkhJZzZTNWttVVFsYU5vVTdpUDl4NVdFQlhrQmhu?=
 =?utf-8?B?VEVKOXEzWkZjVUhGZG94ZHVGNDFKNXdKcHM2MlNzVXJzb1ZiOWxLMG5KK3lx?=
 =?utf-8?B?OEtMekxYU1AyWU8rSGE3MjZZemlKUjRnaGVLWC9vOW9jYjJ5TWo4czdEbmRV?=
 =?utf-8?B?R3A3OXpnM2pqclZqU1pEQXNSbG5vSUMvZjMxZEZQbVhialhHVkVGUTNBQ00v?=
 =?utf-8?B?L1JZQmFNRVM5dTZkaTQ1Ty9qbVZ3MjFyeURBZjY2aHlGOUsydjZhU1c5eFNy?=
 =?utf-8?B?TEFsSUJCL1BjZkVobW9VSXI0Y040blo4WFdKamNGdXBtTEphMWdDbng3TjZv?=
 =?utf-8?B?ZitEOWJGbW5jYWVhQS9iM2NlZlo5MEZUd1UwNldvTGJ6YkVFV0FyelR1YVJU?=
 =?utf-8?B?TVFINzQzTUMwUDgxKzlMRldOMnAxQWhuWlN2aXN6ZXZveE5Wc1MvUXpPMklt?=
 =?utf-8?B?emxGcnI1dzg0ZWFWZGpsRjRZaGtVUmpoUjJFMm9FaE9oZWNZWWoyaGFkY3h3?=
 =?utf-8?Q?9bvuzL0QwJVch4/C/+l+878=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHRMQURvckJPVXltZkF5c1U0Uk5JbUxYYmI4MElxRDFQWE1OclNMYXRiN21t?=
 =?utf-8?B?MU1YNlpYVWkxZXg2R0ttZmFqU3BZNnI4S29zbHpyeDFSTGFYbWtEVXhPdGt2?=
 =?utf-8?B?QmpaaHpabG1MakkxblF4OUVDYlhuUEZ2S3hNdkg0aDN2VlcvWllMS0g4cG03?=
 =?utf-8?B?RW1BMm9yQWhacm9WeVlSeUVMWHhCNUpxbnFublJLS2FsN1dSemtMd1pLTHR6?=
 =?utf-8?B?WmlTNVUxemJudWwvQjZLbHkwRjlYdnBzdzlhTk5pUzZSa3FKSVFuUFlzcXFY?=
 =?utf-8?B?VDZhUndjOEs2YkUrTzF0UDJzVzNJUitFOEhHajZ2czJWejByRXJzS2xQV3Jp?=
 =?utf-8?B?VWM2blhJMmZkaXpvTVBqM2pWKytZK0hpNWVGcUI0S0xseGlOQVVsbmxhK3dk?=
 =?utf-8?B?RGdaUmpKbkM0dkFFeE1ZNzNLN0FEaDMrcVVnMi9ERENoajNwbzF0bitKVDEx?=
 =?utf-8?B?RnVVV2dqOHFkWGd1YklHalR4U0RNTzdJY0UwQVRiSkdLWWVUczJjS2tVRlhU?=
 =?utf-8?B?c3VIUURMa0FoZXdVNWlaeDJ4MlhRdGR0T25YMHBNQUhYemNWZmFlWWFMR093?=
 =?utf-8?B?Ylk0ZmMwdXYwWFdoSzlmakFLbkZ5Y1pIVm9XMnNQNGtiRDVUcVJzL29mY3Fn?=
 =?utf-8?B?QlNjRVBhWkdCOGMyMC9BMTI1WWhkeERCR0U5QUlkNGtHbklJRkFVa3pFSTZ1?=
 =?utf-8?B?WWJEQ1pzMXlTQTlkdExlTjlCRE1XQlJaTndkOGhWK2NvaHQ5c0E5ZGk0WVVo?=
 =?utf-8?B?WGdON2Z0VjNnM1pRN29qR1V3QTdyRlJpSElzKzZXcCt4U0E2d2hnR0lqZ2py?=
 =?utf-8?B?TWUzdmNlZHR5QVBaSlhENkZxM3FJMHArYzVyU0dJbFoxcTlSS0VYNGUzMFg3?=
 =?utf-8?B?RUdiYmZXbWlKVDlrSVgyT3IweHlPQUg2U3h3R0JRRXE2c2ZoZGFSN2haeTRx?=
 =?utf-8?B?NUlHcFZlZFUzUzFuMXB5WVgwM01CU3ZOemw3MkNxdE40T3U0V1FwL1JIVEVK?=
 =?utf-8?B?WTBaMnRIaUM2NHdyT3p0enFsZy9GZ2JZMnArWWRiNzBQZWZqQncydHovV1BF?=
 =?utf-8?B?WkthazJWQWJvdngrNHNoelJzQXE5UGF3bktwNFprZUVLT092S1IxWnUwSFhh?=
 =?utf-8?B?WVBLaW1DYlZOSHpIU0J5V2IwZVBFajFhQTkyMitjWEZIaXBrZE1KRTcvWENr?=
 =?utf-8?B?ZUYwdTJNckk0NWlZd2tjRzJkaXBuMjcva2tXdVFKWFJPTEdJRTVHTnlUaVJV?=
 =?utf-8?B?cnBHRHRuNE5QWFMxSm9EMnZKWlM1Z1BMN3g4T0NJeUM5MWNpMm5qSFRCOHJ2?=
 =?utf-8?B?WnNYaStLQ0R5cVNIZ053ZGdaSzNaZDU1UFBTc3V2cVI0dDlpQVBwM0RLNmd3?=
 =?utf-8?B?N0N4NVhtU1NjeTZjbFVJTFR2M2JLYlpuaXVRNkVIcVdjSU9IK2UzSHA2VzJF?=
 =?utf-8?B?aFBlSFA4U2h1a0JhVVZFdlQrQmNvUW9CVmtEOFpDMDdNRG1HS0loSld3WkZt?=
 =?utf-8?B?RjFqK0hkYlcxaFNKSXpBRkRSbEY2TnJ0WkRzUWxOMXVnT2hLdHozeEFNMzls?=
 =?utf-8?B?Zmljb0JVdURrYTFvaEpoZURuTHBWOUVJZ3FuZTM1cXR6TlFOUDEwYnJRVnRU?=
 =?utf-8?B?TG12bGRlTUxQSEl2OGMwUUh4OUg1cGxkSlNKT0l6b0lubCswc3p1OEV2a2JC?=
 =?utf-8?B?K3R3bE0wZG11YUYyelRGT2o3d0FETUhYb1RSblpSRWdvcWpnWXJyMWpBWGtk?=
 =?utf-8?B?MzVIVVJEUENwUVAxYnFPck1nUVZ4cUM3NVdiYU5vV1NHdC9xVEJyVUMySldn?=
 =?utf-8?B?dlRVOUhaMmF1U0VyZUVsNXo5ODlQSzdPak9zZXZldXdMTXlBYkJkM2k5NTVx?=
 =?utf-8?B?ei9qL1FGcmNVd1RZZmhLWnJxb0lBcWV5ei8yOVNtUWpQR3Q2ZTNubzZwTEpv?=
 =?utf-8?B?M1IxcE0yYTFHZ3dYbjBScVlZQ1U1UUNXQ2w5Z05KWW94dTNCREkvcUJQQmpn?=
 =?utf-8?B?bDMwNkpvRVBpMUdnS3YvbzVFTXk5cmt5RW9Pb0x0NCs1K1FQREN3MWtMaXNx?=
 =?utf-8?B?SHNkYkZDYXlzQW1ld2ZENCsxRFZBUUJQRkY3N1Rzb21Da205VEYvdUE5Vzgx?=
 =?utf-8?B?S1UzTkRORWsyc0daMFpjTUMrVUZtTUw2dzQydWdQYzJTMHdoVUl6NmhQVi91?=
 =?utf-8?B?VkhBa1UwdUM2Ulc0aUl4WFVKUEdjbDQzY3drRE0xUHVnMHFkVCtkdW9RcGRO?=
 =?utf-8?B?K0lwSjh2TXRuNWU4ZE1YMHVJemdlR01aTXdSN1VSY0V2OWF0Mi9lZVUvRXZ5?=
 =?utf-8?Q?MK3diNOOPYHAQmNC34?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c58f765-50dd-450e-a474-08de6a529c69
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:17.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz4ac6QmilquD7PCeyDZ8FEpRR9T+fBT623jMvZ1lhBZlOgJNEOuzmM9bXxLjE0dM6OtlinkfnpBf7L5OPHohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

Rename gpios-reset to reset-gpios of hx8357 node to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dtb: hx8357@0 (himax,hx8357b): Unevaluated properties are not allowed ('gpios-reset' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
index f0ce897b9d5c4327170a5e40c75a85d1d6528256..dfe3f08426ac6c507249c66cce48520b88698a61 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
@@ -107,7 +107,7 @@ hx8357: hx8357@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
+			reset-gpios = <&gpio3 30 0>;
 			im-gpios = <&gpio5 4 0 &gpio5 5 0 &gpio5 6 0>;
 		};
 	};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts
index cb68edd6101bc827a3f60746dbe6022e47b78860..aeac1d29058d1a32017f8da36710d5a32ccf24a3 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts
@@ -33,7 +33,7 @@ hx8357: hx8357@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
+			reset-gpios = <&gpio3 30 0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts
index bc2d6fcad12f917e0123e64f3b9279a1d37cd99c..add6a23728e7d84803dbe70b732f35d87b310ad9 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts
@@ -32,7 +32,7 @@ hx8369: hx8369@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
+			reset-gpios = <&gpio3 30 0>;
 		};
 	};
 };

-- 
2.43.0

