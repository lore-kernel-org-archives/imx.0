Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F31AA1EE
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319671; cv=fail; b=nFWqCcp+4t+xYkBCgfArRagv/tbmxiMgt9leF/5W2wYZoxALDGFHNGqHwymJ2wm29Y1Ex2TuUtZt7//iiBrd1x5KGKi17q3DmI+6rlaRLwbRXmSzVu3W4oRGBTb8mvpOKkDvWeGjQ3UKjFtrzYHxh2f+eWSJLkpErmlXhDXLMYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319671; c=relaxed/simple;
	bh=4xoQt97UQNIHr+oz20CT9ONctlmGp5oq2NT2GZrNYgQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=DUVG7hXziMyy0D6HsGiEbBRYX1tdxwThLs3vqYmX0upd8NvIMd0EuiFgEicBMid9ehAcrYomHrCtdcOo5zoNmIw5kYHVbjmAVn2s7NjglB5wEi+vGjK0wc9PMVT2qg2qINK3h2Wf7YXBgcta4BryZO/wM3STSbCyjMOaasMEfyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QxsUiQaR; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QxsUiQaR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIc+WVYwGcic161jD4AEO1YIZJ6ifuJCFcBUj9yrQg9TTgnID7/5NPWIg73MLTqTwkpGnkZfkUSFDTYbE90/zsLkqPN2D8YIpnLzsQ/1GYXW8B/kcBbgmoUlm6KOmxL5KivCUxROey+6rWFdaulvkSc92NiWiFGizHIggM+TBScjDpVVK9TFdHAsCjxlM2SLnhGLCRjGqMV/RO6yL0fObqV24HLPj5svpy7a6aqSFDEcl9C9vDkQvRFj4zgjXp7Z5cro7kahZ0VDPq8Q1vwW3uSsWQy4Y49UNduInfXXxHpQpc0sqojwxztV7dhl3pm+DLrKvtcFooV5ZJ+pZ7lGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7z5JvJvdxYMBcKTAPgb7p9FB8EQcd42CAqnvNESMO4=;
 b=BzqzP/cOYsdWBPePvgxtZAVehyJ8W5X0/bIPCYE2fy3cCd3QsheylbwE5D2mKkJWVbdgOKobMqprmKkBxjhRmAp8IzSh9RGVmLQ6rt7555rgPVqBsCn7/ntkgJHfPlmg1U14+1DCMaZfGC7IQbcupsePEMWpTrVe9xfvSyn4BiIpN5i5rco61780YCPBLUSDhH+a9jl3Sd9SQBgSovgpzC3iSSWvXn3gS0wcAmhPBneYR0zBIL/MnZG2z1be67Cx479BAYAAwP1+AhATOutKdrghnoh9oGb+aEndwXNRvbmQlWk8HxxSbjwyOEAHiKcu1Zwli9af18OVBaTpP7oQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7z5JvJvdxYMBcKTAPgb7p9FB8EQcd42CAqnvNESMO4=;
 b=QxsUiQaRwEMykOzZeLxwzrsJACa5Pa9iyq9CCATk9jnavcdBslY+bbpIfcjMT0pJWpQVw9z8IDcO4lTLvFXQvgNHmNxXc2Db8wDil/JvdxTsMgLrHfwaYl6fhEn4OLblwHC0iFTw0VkeWybeHGBhl7ymFkWEQZvrdQmbbMFCYTIip6l/ui8XJjqCZqJAc7+D0xd216Ylr/h1cOyA1+j9+B4oNDDv3FgoS0qFQL4NR+6/f+W7RFXH15coKoKGL0iGnI5zkEFjO+ghmVJc5emmZg8UGrnpuFCINXvfqtb22BxK3DP+0F3UF5Fm0qDFHxbR8idJwfh55oWAtGn5B0zgwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8299.eurprd04.prod.outlook.com (2603:10a6:10:241::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 07:01:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 07:01:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v5 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Wed, 08 Jan 2025 15:00:16 +0800
Message-Id: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAifmcC/23OTQ7CIBCG4asY1mJmhumfK+9hXACCsrA0tGlqT
 O8udkUTl9+E5w0fMboU3CjOh49Ibg5jiH0e1fEg7FP3DyfDPW9BQIyEJMNrkdHGaZDWOK+AkcF
 XIr8fkvNh2VrXW97PME4xvbf0jL/rv8qMEiR2rTGgfVtruPTLcLLxJX6NmUrXlI6yU17r2hrvG
 c3eqdJ1pVPZGSLVIHQtNLh3XDhSpePsfAVskQlqLv65rusX3ey5cEgBAAA=
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736319636; l=3016;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4xoQt97UQNIHr+oz20CT9ONctlmGp5oq2NT2GZrNYgQ=;
 b=hQrur0YWLFKl5hcSqHqCRL1Ph5vyheWyRRzIzKT3sl6smhBhRut3pAHsVOMUvh7J+EYqla5z0
 /zsj/ep5OymDML/HXswXmmpDOIwXubxfCPrZp+lJP2MugurWvZZTVcm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 709c23c6-2b8d-42fe-0571-08dd2fb2379a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bG9EQ0YxK1pvZ0F3K0dnYzNuUk1uZ3ErQXVlTWlQcHZWc2NsUmxEK3lldnY0?=
 =?utf-8?B?QUtFSGNiSHJuSnhJTkVNaXd6czI0bTdZUXRUYnBHTUZsM2JtMjBiUzMyWjhu?=
 =?utf-8?B?UEU4NU9XM2wwM1haMUZ2Y3JOcS94MmREVjBmeTk1SGpwQ3ZCN1FPUUVBVE5z?=
 =?utf-8?B?Z1BBYUdXSUEyVkdVcmIySFZaM0FCNnpHZkZDRjhpMlVwT0d6a21OUTdRYVFk?=
 =?utf-8?B?WTBKRzFSLzRsMk9TQ25EL3loaEtTclllSXlpeVlBK0xuWlNUNENrZHc2dURO?=
 =?utf-8?B?Z3ROU1V2bGsyVnVxQk91WVFKa2RVY2ExVkltOVluZXR0SmUxMnJFbzh2a3kr?=
 =?utf-8?B?TitFRXE0M1RLUXV2d256aTg2Zk50SGp0MHN5bEdPc3FPbzNuaWxuWWRkNTkr?=
 =?utf-8?B?THUwaFhtRUtBak5ZQlA0QXFxSmExSTIwQmNaV3hSVTFCNXNlWEI0eWkvTk92?=
 =?utf-8?B?RGZmV3JCdmN5dk41c1Mwb1lzMUJNeTFTUHdRWjNFWlAyRVptenNyaU1rUkh0?=
 =?utf-8?B?OW9KcGR1YmdnVHpxSGwyTDd3K0F5UjNST2xQdFdNWFZqSUhSY0IxYzBLbnBz?=
 =?utf-8?B?SUExNkk0aHFqWlN1amwwNmx6bnE2RS8wTTRxV29Cc1oxT1lPZXU1YUhnRmFH?=
 =?utf-8?B?NWdsUTdwM3FQUDV4bTdtU3IzQnlVYmpsK2pMcWw1VE5ZME5RbGVqREp2M09R?=
 =?utf-8?B?U2I0QUd0UmQ0UFBtdk5yUk0wVHRiU0tQci9vakRpeEg5SlozQ1p2OHVyYnZL?=
 =?utf-8?B?bVg0RGU0ckt1ZkJFNmo1WkwvWWd3K29Cd3NFK1ltRlQwTjhOSTJ1c3ozQnlp?=
 =?utf-8?B?aTB0K1JaZnVyUElGdXVMY25KUXlodWVTSEZzZGhNK2hNWW9KSzkxMHFpeVow?=
 =?utf-8?B?VWdicTJaNkFFREtoNFMycEk1U0EvQXNielR0ZGM5bW1KL0t4ZHVRSlFKM2hj?=
 =?utf-8?B?djF4VC9tcHBSZlc4dTB6MkZKZ2QrcXBSYVBOdExteGZFOVlhbWl4Y0lPWkRR?=
 =?utf-8?B?UXYyUWZmQmlBS1ZsRFIrc3pGRDNmOTZIV2x2c0prUVBwblh5eXhCNW93V1gy?=
 =?utf-8?B?Z3JLQUFycnhLZ0hOSGswdkRFOFBMT0xRWGc4WmFWNTZmU2NaYmtHbE1pTkw0?=
 =?utf-8?B?QXRkWjlIVThURzVxa3k2UTJOWFhLNTB5U3ZJZkhVR0RpL0tnLzdrWVY0dnJr?=
 =?utf-8?B?MnNaVm9zUm9sTDRYVWw3RkZBOUJ4aVA1Sk8veXY5Qkc1K3RtRDYzZG9nQk1N?=
 =?utf-8?B?ZjZrbXJZQW90NDROd1JiSlBVTEZneU5kQTlWQkpVSDhXTzF4SnNHV0ZSaXBB?=
 =?utf-8?B?cnV3Nm1VMzdrcDJSZUlEZmFRM3c3UTlxbEJqWEZvM0J6OG5VMkNaU1hWZEhH?=
 =?utf-8?B?YS82b1lhUG5ISzNKcHNROVd6R2FKN2pTLzB0WnBGQ1dYOXRvcnBWNzdsOFVU?=
 =?utf-8?B?S3NFWlZoa05uOHdDNzBpeFMvT0ZqN3lISkJEZm1FVUFPVTd3V002NTFjdDBw?=
 =?utf-8?B?SzF2OHJLaDlEd1JRQWFjN2hCT1lkZUhHeXpkbFd5OC93ZXNFVnJVUzNMZEsy?=
 =?utf-8?B?enBaN0hqK1VJdnF4bkZPMGhZRWZYY2dTZHdweTNoYTlFQXd0QndmTGZ0L1Ar?=
 =?utf-8?B?VzJWTzgvMEpXUmE2WGZkWXpPclNwK2srYVRlSVlSY1QwNW9aS2dkaHFiMXUz?=
 =?utf-8?B?QXBPNnRnZ2Y5WHI2ZkpSbWhKcFREUlRjRjlKRjVZaTd4M0FSVG9kZ0tiN1FY?=
 =?utf-8?B?RmpKejVBdEd2dlVhRXdQUXZpT0tqZTh1Rk1nY0RXWW5uVjU4U2wzWmNLMlI4?=
 =?utf-8?B?eHNIaXdyU1Q2SEl4R2tDMDhqNy9nWFVNV21xWUhPQlYvNGFRUlNRRlQreDZh?=
 =?utf-8?B?b0d3a09rSzYyWlJheUZHTTRXNm9nb3hwZlVocEFHVFFUemVUblgzeWpFaEdD?=
 =?utf-8?B?eCt5RWZYRit2cDhJelZoTTJmUXNzWHJjNjZJTHl5U2FIMjRGMUFUZkduT28z?=
 =?utf-8?B?K1lYMXlUcHF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3JPUkJTL015NHJIWWJCdFdLcGtiM1hud3gvMlVLL29DY3h2YlJ0Z3dMY0du?=
 =?utf-8?B?WFpENnV2QXF3WGd1UHNmNlVVRi9sY3hGSXJCYVZEcDdwWExPZmpoV0d2Vzhs?=
 =?utf-8?B?MFBIN212VzM5UTVCbnRZTnRhbTFxOXVZMzdJK1ZZMkdIZVRKNERwdDlwakZY?=
 =?utf-8?B?eDZFREZGbkNLZDlEQnFtWWNVYnk1ZGUzQ0IrckI1UTZCMG5xQTVlaHRvZ3lF?=
 =?utf-8?B?czBLeVZHTkx2SG80bzZZb0FxTmJwVklpRXZvN1MvTjltZHZOT2Nnalh0Z0ZS?=
 =?utf-8?B?aE1UMnYyMzdvclk2eXMvOXJObG5tdUdPU0NvL0tRc3Yxb2xEdVZXU1NyZmZM?=
 =?utf-8?B?N3gwOTREK1RJSzNleFU4ekNPcmpURnFjeE5RNjNLbVJlSzRtamxqKzUwQnpK?=
 =?utf-8?B?RUxWZDhTMnpMZmxmYlZWajc1ajlvZUtKanNyNitHU1pRTWNOaXBEKzhNNTFk?=
 =?utf-8?B?bFVqM01WQ25oN2N3VUdkOFpHZkxSbUNkSWNPbkpGalNHQjZNeHA1ZWFycXNM?=
 =?utf-8?B?MUo1bERFYkxOOXFZblI2bmRRd3NURjludU9mc0xiM29XZTkvdVU2K3J1WXRM?=
 =?utf-8?B?OTU0OUk5Z0lzRnFqYVI2WjVFc3k5N1FXdEdkdDBXc3lwSkt3RXkwS21xSVY4?=
 =?utf-8?B?eFFuSnE3aFlIYmpjTVBXQy96ZHNoQlBHWlQ5MjRwS3NRQ3pLZk9mRU5XYnlt?=
 =?utf-8?B?SVVqcjF0SUlsQjF4cGFlUmN1QlNaNjVtOTNKeXVlZW4zTXdTYUVnK1JuOVIy?=
 =?utf-8?B?aWhQL1k1QVlMRjFGckxXUlBIZXZoODhTVjNxOWZURHhvYVFkckJOSTYvamho?=
 =?utf-8?B?SmFLZG9wUVoyWFFTSnN2SGhUR3RPL2h0b2JGOGtGT21kSzdGbElSV1RZZlZa?=
 =?utf-8?B?UGtydm83aERMR3dCdnAvYVdXc21OU3JFRndsdkxFeUw1SGd3UEduU2lsZ081?=
 =?utf-8?B?SnloRkhFY3VxRlRYZUVKUFF3MTFoeFV0bHdSNUxaa2dGeEJQYk1iWHNyN0l4?=
 =?utf-8?B?Yk42bnV5Rk1rRHQwYjVyN0NEYzBBT3dGTTVESVZLVXZrQk1FYy9BbDB4cTAz?=
 =?utf-8?B?QVFJOGtKK3g2V0dtYU5nME9jeER0ejg5eC85cmFBaU5ibnFFQ3AxbWEzMnoy?=
 =?utf-8?B?dncxTTdYODJEQS9UNWVMaWxoaG13V1kyQ1d1QzlEckpTdzV6TkhJdEtpL2Y2?=
 =?utf-8?B?cEsvYW1sZHg2WTU5V3p3S0xuYUFMdWtCOGplRjdFaUhObDVLaUhRVzdnSTFy?=
 =?utf-8?B?UkF1TmdTQncvdzg0dXZPeTN3ck1vNkN1akpkMmpyY1dXb25yek15SUh1V0dl?=
 =?utf-8?B?SkZQN09ZbW1DVUV0YkRDeVk2Y0NQdVM2ZGliNnNHdytudjRaWmdMTU5XeVNa?=
 =?utf-8?B?Q1REWXEyM2drN3ROWGVlS1krRGhpUms0K292bzZIWnoxamtWaUcwdXR6OHpB?=
 =?utf-8?B?djVuN1Y3dlRLdE4vVTNYU0tXUHVrdnVkcXkvbkN4dnRBdTkvanljRURIYWs4?=
 =?utf-8?B?YkFTS2pSenU4UmNFalZzU21nZmJIbThPVTAyWktwdXVhSEJoaGk5dG9DZzl6?=
 =?utf-8?B?L05CZ3lGMTlSM1hycWY1WXlxMS92K3VlLzJqenlscGdnaS9YMnU5MzI4ZHlY?=
 =?utf-8?B?T05aUm51YUo5aURYTDVpRXpCQUdiU2pIZjAyMlFLeVNZMFNsUG94NG1vMjNr?=
 =?utf-8?B?S3lWMytwOGJuOXdtZmhuQXdZbXNXUnhtZGp1cGJGZVpFQWxWQ25WMWU5cmg1?=
 =?utf-8?B?ZEJhRUVkZ2tEc256QWQvdFZ0aFp2QUsvUnR0MDVQdi94NzAwcEtYbFI0NmIz?=
 =?utf-8?B?ZzlZNG1PN2VNMndldm9xciszakIyOFZhTDNHOTJIenZXYi9MRllnN3lEQVR2?=
 =?utf-8?B?UFJtU09VVW9vUmpzMytUQnQ5bnZJamVhUWJoWitmSkxwVkh3N2tGU0JFdlRt?=
 =?utf-8?B?STNNMmprK3lqenQ1RzhZNWVpZFRyQ3hweDQwYTk0TzIrcXIwY3NHN1dRdmR0?=
 =?utf-8?B?c05USW1MTzRLeXVmOFlHdjdwVlJRVTFSbS9CTXFLR1ozaEpGR0NxUGwrMGNx?=
 =?utf-8?B?UmdBNW5kMHRlQ1lwYTgyaXBMMDM2UFJxUmtEdk05QnRQYnMya2w0eDF5SHhk?=
 =?utf-8?Q?IUFxIvqnMMhkgvsDBQsQun6Dt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709c23c6-2b8d-42fe-0571-08dd2fb2379a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 07:01:04.2333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OEknNIXeM6P+s0WST6tuYgppQHtqpR25+7X6Wajv34qCN2LcdejOCTQK4a5GxS8BdHIqNJuXEpOfWyU6LeGyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8299

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v5:
- Rebased to next-20250107, but seems Srinivas's for-fixes patches not
included, so I picked the for-fixes patches and rebase the patchset.
- make gates pointer and using ARRAY_SIZE
- Use of_parse_phandle_by_args
- Read fuse when needed, not cache them in the very beginning
- Use %pOF for node name
- Check controller node name in imx_ele_ocotp_grant_access
- Use dev_info when detach node
- Use priv as function parameter to replace pdev.
- Link to v4: https://lore.kernel.org/r/20241223-imx-ocotp-v4-0-f504c1420640@nxp.com

Changes in v4:
- Add missing of_node_put(provider)
- Typo fix in commit log
- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com

Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/imx-ocotp-ele.c                      | 172 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 ++++++
 4 files changed, 243 insertions(+), 1 deletion(-)
---
base-commit: f3ff6cbe6236ef99719615666f66454d70defc5f
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

