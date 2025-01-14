Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CFA1FBEA2
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877422; cv=fail; b=eU8fz3SmUAktzJcechwRy42twVccA20iQube4P6007mcyjLMCbQpfwolnpC4skPIzYsTMOyFYw+RIQWyG3X2kLr87a7vo3gML+4bk4V4atENl37TCGNddGtR9i4FGoyWo/36Y0eD/TBFSX9N4DLMssJDQSgid2MHvBPRfBvyrqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877422; c=relaxed/simple;
	bh=MwWhsciBoMpYVx3nfk4Y4+QjcHp5RP1+rRO3HqEdxqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O7+vkAcsS8TEWHlw8HJKlvff47aFRsrFAlbyCdtphRx//SegDO/2BHsOWrBonM7oef2hFETTBEgHVqG8Hd7qfB5YpaVbxiCLmjf+uxYIDtrDUanrVz+crnJgGGm69wvQHXVqiLwS+KCMuobaN9P2t+5L1x8WzIqQjGD/ffl4WUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=geZK/YPP; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="geZK/YPP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUP8N/l/uf/qABCnbbk40LlPV0LSgLxdYLxKx77B2IHzcxzkOtMvs5++hexWOFE91SagH3CeWLvC8iYIzA/aNnv8WzFleQpT6pvty/Gt11fwiEPsMnOMpzhGIwqvnBqZac8Y/4+NpAguw5fraXa/FbwGs85Um2XrzuGkQn2uepFxeAVmJoSZyGRusf/aLPsmtASd3H4LFRsFEGyOyks/LKkv4F0/IV3h3QwVMoqKGnoTvoERF/cOMd5N2g9ZRwIaDRBe9uPxy9ZmLv5NdbDUZVL2LbIBe3xOLsqKjuRuFj2W9PboNizY4X8JVG3EJqajihwQY7gdwjjiubD6KFfpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iubt7JA4hSRfuk2cv3tYWvpJfLBxX8aaHEiBJhHz1mU=;
 b=HdN+SBvtT/X/J/gSwTuYSBhEeR2RvJOfvJQsncT8G4IA4cadsHTosXfBjBwblHyw7KcQfw+2i0E41zLY8lsDc0iMx2Vkbe8+sU9FhX8/ZZOKdzL9I0Olh/6M403QTAGs8fP+RAthn+iuHiKyT5aTxOWYPVt7AYu77Uih1UF6t2nBxBVPOAKZrgpW4Eai0snI/lsCP9RCr6K35LkcArgW4kBEEqvdfEEVx16z2ihoHgja3CQM6Wv2SlghP8vIEHd8f2VBrflO2abA65wUyJC+sJ9XLwk0yVsA6Ay592dxuwzNe3VLpVpMp2Ubomj8//vzfvPmL7iQgKG4Yj+kh6FINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iubt7JA4hSRfuk2cv3tYWvpJfLBxX8aaHEiBJhHz1mU=;
 b=geZK/YPPSGjais9CsRMlnPV1GQ+V3nWWcY1kNTqiZmuYFK3H3T6eNvoaHdFaCZA5I4E6JyBXowUx9sQsfHi/jHuOeF5Ifym0o4RMDQ3A/H9jG8RrXTMDzt9rB4N1BX02Gx709u/5eW+qSRHwCnFP/qTB6zc3Te3E2vp6R3tn2T/iCQCQ99NHvHIspHXwuWaHt96xEcJmajdAIwBsqLtS5XqkO1dFaHuVWo8yBUs7/cU9Zxun/oDH5iG9hJl4lDhYfKIiizIcENmW1bSLXdy1n8s5nMHxBl9LNteyMyBQ18C5wz8qJixc6T/jeGJD4Wc05c7z6eOl7Vw+jhYvHSn2fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9895.eurprd04.prod.outlook.com (2603:10a6:20b:651::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:56:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:56:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 14 Jan 2025 12:56:26 -0500
Subject: [PATCH v2 3/4] arm64: dts: imx95: Add i3c1 and i3c2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-imx95_15x15-v2-3-2457483bc99d@nxp.com>
References: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
In-Reply-To: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736877404; l=1691;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=MwWhsciBoMpYVx3nfk4Y4+QjcHp5RP1+rRO3HqEdxqE=;
 b=KMaoz2/dwZFKJNWzhaQaPkYZ+dYULEfAXsgILa1yFFtToqkuvS8YLVPWyTB1thiiXJ7Chjsvg
 ypLbQL4x3BPD4BXn4Zpl7GDM/Ua5PZw+nKuv79ykhcJmPcjnLTlGoC+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9895:EE_
X-MS-Office365-Filtering-Correlation-Id: 041b9372-631e-47bc-4c04-08dd34c4d63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L215SGVQdUF1MXQ4VHhBR0dlVDJOUDhkT0NiOGVURXVUT0FKWlJCRUlLQWFv?=
 =?utf-8?B?bVZQdGI1akVXRStJK3JWakZ1dktXLzhpYlUyMXZqTW1IRVBGY3RyTWRMQ0ZX?=
 =?utf-8?B?dkRyd2pLZjFYdHFNUVhIVlVPS0lXSTlzT0JaVnFGUE45N1BiaW1kQ25lWk91?=
 =?utf-8?B?ZXo0RkRUSU1vYkU5a21Ec2x1T2h6ZExQdStpZWRZZVhKSjNpMk5VSWJUaXZa?=
 =?utf-8?B?N2JtWWJsdG1iVUNmWkFPUGNrWG16MG8yWktNWENIei9IZDV2U1ZPVU8wTjJ3?=
 =?utf-8?B?RVVieWh5L2JWSnVGVHFVUmJnUUtzbGZGMHRDOWh2Q3hsUThybHJkQUZyYkt6?=
 =?utf-8?B?aG1FTDVaMWtMclVrajE0Q0w4ejJMY0twbzJPWGFwQVRzY2FRYm02R2tIb2o1?=
 =?utf-8?B?VUN6aVJIMjFlUTVZZWgyYjM3QXgxQlVBVGlkSkt1b0dtRjNxM2JJUk1sNkFp?=
 =?utf-8?B?Z3hJN1BrNU9HQ25mNWtkQUdXWG4zRnppMzNUaVF6UGNZZ1Z4MlBVVEVlblZX?=
 =?utf-8?B?c0t3OWI2WE4vdzk3dldLRFl1ZWh5b2NkNjBMYkkrL05UR01uZ3hMUFlIejY4?=
 =?utf-8?B?N004N2wydDhYbjJ3R2pXME9OUkhvUFlUQjdzU1dLbkVpSm04Mm9SL0twNEtK?=
 =?utf-8?B?MitYMDhxTEgxTHFJZENDdVFNOVYvWFBZc3M4bEZZU2tWTENzQkM5N002a3BZ?=
 =?utf-8?B?ZVNmdHpSYm1oVDdOdWd0K2oyTUFLUkxoTGE1TWV3OXdlWlpuaEthcHFVWlRM?=
 =?utf-8?B?d1ZndU9GeXhUWG1GU3VqMnVSZmM4WVJGM24wL1VKVTZwbGhVMTgxUDRMSGZa?=
 =?utf-8?B?MzRMN2ZXYlMvbGMwakRvMW1FVjlMUk9nbFBES2pjWGx3NE1kMHVCdHAwcXh5?=
 =?utf-8?B?LzQ5d1ZweVBkVHNJMlJCQmtSZC81MXZ5Wm53NWtPM2dpY3prVDdRVldQSUt3?=
 =?utf-8?B?aUF1UGpmb3dqTVpubnRVQ3R1QjdXcmJWN2twQlRPa1NEUHI0OExCUDRFeDRB?=
 =?utf-8?B?RUtkVUFPM3hKM25yZkFLNTcyS3pMTHlIQUdES0MxZ3JDWkZPTng4RHVLb2lp?=
 =?utf-8?B?WVA3dzFpS3BKRkxVa3hhZWdnMXJYODkvd1E5L3dXY2E2bEpqc2FJTHhhYVFH?=
 =?utf-8?B?R2pqejROVmYvZWFld3lSa2FWeGh3WnMzR05lT0pDQWlBM3QzK1VYT2pYSW5x?=
 =?utf-8?B?dFJkSUdvU1gzcTY4amtFbi91d1lBclluUzh3MUxIWDJkaUNaVGIvRlc4MUJ5?=
 =?utf-8?B?aEp5Y3lsVW1wVVRMR3ErenkwbXNrdkxBTHROcWRxRXlackZzVEROUyt4c2Nw?=
 =?utf-8?B?TFJZNlA1K2F5SktDMEdnc0tzYkExQ3YwdjR6YnNMdyt5UjFtQzV1dUZtR09k?=
 =?utf-8?B?MGV3Y0VPeEZFdlRkWEx0UWR0ZXdoM20yMHM3T0hHMnU5TndoaVV6eWJlanpS?=
 =?utf-8?B?SVpxZ3Zja0JRejBsUC8rSG0wNHV4Z2RSTEpzNlFvYjFpQkdSb3ZGKzFOOTR6?=
 =?utf-8?B?OUp5OXZwa2dWemF3K0RmUzJWTitvQTNkZUJnUjYvamxMbkkxN1BmQXZjKzFt?=
 =?utf-8?B?akRpaHJpS0MrZi85YUZqY3RtdzdhRGRlcEpmak80L3YzTGg5Vlh1RHJFbUFa?=
 =?utf-8?B?R0V4OFU1UkFMRmFNcjNVVGtOYm1WZUsvUVdwRFdOU0xwRmVXbVpqdk11VU1T?=
 =?utf-8?B?NWFCbVppQVFtZ3pna1QvUFFEZ1BaTUd4dXQ5KzJGeGZqZkNDWmdBcUNvUUdL?=
 =?utf-8?B?RXBvRUFLVzRoRkVMaXgyK0dqZm01SDhyVXovKzBVMlJvNFpQMnZGdGdUL0Rk?=
 =?utf-8?B?TTlNeU1ZNHhjMzM4Y0xTYnI4WmJqY3I2VFpUcy9nWXZWbzJGc2cycHdvQXJ3?=
 =?utf-8?B?SVVpWU9PVU9lSXBvdEV5ZW1UVW9IVzBMR0V2TjRFeGZYbnhuaWNYZ0pwUjNT?=
 =?utf-8?Q?qBpy99XkPCQQZIy3+IqN9wvdZHr8Dxb7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1RWWDlnK3lmZ3QvUXlubUJjb2pOdE1QcDdmY2w2SzZlamVZRzNJRFB3QVlG?=
 =?utf-8?B?cWpEbTBxZXRaeGZCQWZkb29hb0NFY2VuUzY2ajh6Y1hmY0djREh5WU5GZVZh?=
 =?utf-8?B?M0ZTWFNObDhnWG9lOWZheEtZd0hxQjNSckxwT0MwSU5iNHlSMWw1SEZKQUlQ?=
 =?utf-8?B?R3p3MlVpcGZCeVdjcUZQaWNrSTFReEUrUnA1Y0gxbDBMWnF0ZmFyZVU3UWV6?=
 =?utf-8?B?U3FYWVhJSDJqaDBIWXNtMnBjWmxhMUZSNVdsNFRGNjFGcnQrcjRVRm84QVcw?=
 =?utf-8?B?UmFTTS8waUNUbjFnZFVMOUJuckNpQkt2bkZDdDUwSy83RHdSQzFEb3Rxc0NI?=
 =?utf-8?B?UkdwVlN5VitlOGNUM01EbkM4WlVTWmYvZGJLYkN3UlNSbUFuODc5ZWdZQ2k0?=
 =?utf-8?B?TmtVbStBNFByQ2FkOTNmcGlRRldTV0VQdndsNkJ1MHJSR1RtaDdQbmUyRTNE?=
 =?utf-8?B?VjNCQXNEWXdFaldGcWhJd054d0RBS25GRFJEN1c1L01GVjJJaElNM0doWHpo?=
 =?utf-8?B?QUpZNXJsSU9FMVRsL1VVM20zWnJ6cmRUWGYzR0JEREM3UHEvVnIrbW9CeHZP?=
 =?utf-8?B?Q3c0akJ2aW5qd2hiZVhPeEJqckk4dndGT25wczZOd3A1V2sxMUIxNHRBTCtI?=
 =?utf-8?B?NmRIYUhFM1MvQ0JJOFdUWDBNY2JSSHZ1czZ6SVlNb2JyNTU2Q2ZLL2hUTVBX?=
 =?utf-8?B?UUx2L0wxTDNRNk5QSTFsN1FFNVkwQnJZN3RJSkVWTmFmWmR0Y2VSdXErUzhn?=
 =?utf-8?B?Zzd2RUpxMnBZeEFYYVhmVGczcmV4eUZZd3h3QzQ3YmlUTTBld3pZa242VUUw?=
 =?utf-8?B?clRnUEV3YWhxOTIzOFArdEE1RlJaWWVOMHczTmVqMUs0TEVESFhQcmlRVGxF?=
 =?utf-8?B?VUUydXdHRUVoajJtVkVvS3c5d2JuTENrc2VBS011a2poZ1lyY2VURUY1SW5s?=
 =?utf-8?B?Zm9IN3A2NThqUXVDSCtWYUcvVCt4aUwzQ0JvMWtRL3c4SmVwaHdadU9rN3Jj?=
 =?utf-8?B?MWpGWXZIWk9zRzRxUDVpSGZWVE1HYXpNY3lvb1FFbHlFTnVDdEgyKzNPVHRQ?=
 =?utf-8?B?RmNKNkpQSmR3d05pZDk3MmU1VklKWGwzRDlEK3NtMlRlelk3ZEhXV0szZHdB?=
 =?utf-8?B?YnpiSllzWWVzb0YwVCswa0VpSCs4Vks3K0c2bDVHNVpMUFE2Rm82QjZ5dCs5?=
 =?utf-8?B?V3VlWUFUQ2wzeE9kQzRhQ2RKNmlxQ2xQMWhyY0hBMEIvdU1NeUVNQ29WdkhB?=
 =?utf-8?B?dm14YmQ0My9oM2M0cnRDNFM4ZGZ2U0dqUUYxTllieDlDckdiMEVFTzZJR0R3?=
 =?utf-8?B?RGlBSmpYNGJVSi9QNEdqQTFHVkhVMkw4UHFsbXcxTHFUQ001SVFYUWdKM01i?=
 =?utf-8?B?bzJweUVWZ0NmeUhwUURFZzZLdmc1am5ROXBjQjZTc2FQY2xZc3JRYkRaZkdw?=
 =?utf-8?B?Y29FUUhOSzlJRmttZ2hxL2lXa1JwR1U2TnNoanR5U2pPZlFYQ3RLOHlSazZD?=
 =?utf-8?B?WEdtQ3hoL2NHeWgxTkkrSy9IWFFDTnExQkZKUUxmdkF2cGFhdWdZeHd1Sno5?=
 =?utf-8?B?U2RjeUtEOXQrQ2RFeTFrWDVTZXM1SmJvSHBLblZqWmZhVm5jTEkzbkVnYlN2?=
 =?utf-8?B?NHp4dHZSYjRHc3NaZlpjeG5wMlZ0RzNPYmFuZzR5ZWZScGNDbGlBUlFoVXZZ?=
 =?utf-8?B?M0VoWk5CdTRDYUxxZ2NCaEFBSk5pYjlHUzZVYzVSK1ZKN2xXSXVCY29XbU9B?=
 =?utf-8?B?dlAzYVU5TGtCam9BYm5vcXE1UWNEbE5VNVlJVm5JVlN3UzN5YVZGMEdnakN3?=
 =?utf-8?B?K3JEN2tBUDBNOEx1bUFOdXNNMzhGRzlLcUhicUszYUdRa1V5b1ZRY3J2VUQ1?=
 =?utf-8?B?L0pQRGlHcGRnTHFWdm5MZVRCMnkxN0FVZ080TkFBZjgrQUVmT09UcC9yLzVa?=
 =?utf-8?B?VzVNV3hZMW4welNWTzhuZVlWZzd6UVBDaWVVTlNPVWVjTDZEM0Jnd21Kck1Y?=
 =?utf-8?B?RytTUXIxKzl6RGlxcENWRzBETWZIaVp2d2RzY3VOaUJUV2tRWFRpMkNKWEtK?=
 =?utf-8?B?bWQxVFFiWnhFcmpRQklSaUVyZmtzbW05NlYxUlhkYnNyK0JJWHpnNTZpcnBv?=
 =?utf-8?Q?lVzgyyz3JeOBC/7JwXe2ymP1d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041b9372-631e-47bc-4c04-08dd34c4d63a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:56:56.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNISzieidV9DzlPgeNel9Af8nKvmgFMchhAGeVQcKXsz15NTaPWt7jhAXIyNyOIggl+HgJWvPzzeluUv7qLaPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9895

Add i3c1 and i3c2 support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 06c50369aa2a7..59f401ee647ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -673,6 +673,19 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c@42520000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x42520000 0x10000>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
+					 <&scmi_clk IMX95_CLK_I3C2>,
+					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c3: i2c@42530000 {
 				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x42530000 0x10000>;
@@ -1245,6 +1258,19 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
+			i3c1: i3c@44330000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x44330000 0x10000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
+					 <&scmi_clk IMX95_CLK_I3C1>,
+					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c1: i2c@44340000 {
 				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x44340000 0x10000>;

-- 
2.34.1

