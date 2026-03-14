Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B704719D07E
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492676; cv=fail; b=OcejEE3iQhiqBOQxX9jtN9UQjXR51yhq7NxJ/klj+qDK30Ager9xa0j6pMhCZHgxtgECTj0AnwNqM0NNsoWM7FnWLByhuMPvGnfzuEdJ01IumUMIBhjtAiw0oMg6wWkFS5HLGF5PQXPTau81LvJgMgGrCjIlFcG4hrkFFKTjggQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492676; c=relaxed/simple;
	bh=rZccLVBUhkKVIzOGblp2USDG/tJo53uiPDhsPiZTrRM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Y4aD0amHnPTLPhCyECoKWFFxqs6/mEWxRKLWt1Uoy6UZJ1fqJ9/Uyuj+1zJFq6YIFc6IJ5RltNxUnn6gv9HJjzJjSwd+VkMFl5PIzEwFQR+eUjuJDwO1qERieJ8sPUTfYCqDRBlAVWMMyCCeabDUd3KJ+97+5DF2Z1kWXu6/Yq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g96AJNw9; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g96AJNw9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojbIgcc6O6fRarmX79iBfS3zVpyHMVPNLpjbOmYP58Q0nI4GRMn6TjZdJWdF2WMOW0hwBYe/CWVn3sg0nD9MNoybli/IrB1FwhIKomdT3EsLTCA7cxm7xQwM/99V+kEFTsDD61Eco5b0eS8nikv1ynIxT066w9vXlDJp5zWZJL7/PsIlUy5fHMA/v0bub5smYfW1H40HaY2KpkT5nfHlEXlYsYtjE7exKoBRbR4CdG7Y0qJ7CbfM/lqXqG5i8cuyKAtqgPmZ9nKdADZDSX7g2jrexZjyCZAOWZGjRD1x7eG95eItaYWKB0TyfHypIkDTsoIWt1zLunsXtqxi3+D5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuAj5Kw+ciG086pfCdrduJ7Wk95euMQ7kHCy54Ulf2U=;
 b=ANwu9liRDBhic7VTi2zsNliCPYuDY7lWbL05noFuDMdZ/mf6xtKJVOixk1TQOfvI2SzI4kSZAPXY4dVBKijSUzkSm7c+3gaSz8HLBrto80FMIdk5YH1yeDgFgkU/6hHuS14wEW+H5yogUa/Lt4bNgMMsv+BzXhEMrw2sIEGtf5dFaUE+vUr4PzMB7goADZJLFBXQ+8coXp3Ym1/QI6fh9MCIo6Dg52bt0gEmgV2PKxejfy5kX8ly+YC6I8Phhuu4cWRBSIKDxf37EQsR30JdNGEsLiyK5OWTsnM79hmyOKRftM6OB6jPhLv30cOx1fczCn1otBsVyPBEblrAYvtfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuAj5Kw+ciG086pfCdrduJ7Wk95euMQ7kHCy54Ulf2U=;
 b=g96AJNw9l9aHNCEnRBmm4Gva8xwbwWzcqf+4byx5AIvr9eKoBIZM7n9fX7hJg5Qj0bjjkOYr69N/kwT3ruYwe5jt8AuepnqwxXRuPv8qjfwkA7j9iIJ6L6YIHhqKDtXutN8CWZwaLf4827NUrWIFeW6UuBVYMSJ0PjQ7uxH5HOf8c7erPoRbse5NsztH7fpCBr4uaw7FPaF79Avon3Yv+rkHn900klCru8Qb+DmgPyRe7lBBjWuQdmVHOPT2eWczOTS3qrLyfyWNdv07nwadNqBh00Shy/71cMsN8iQ9s083GfoxpSsnHt3ACFzquQYz9VBsB64dA5hchO1gMzpV0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:50:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] arm64: dts: imx943: various update
Date: Sat, 14 Mar 2026 20:52:37 +0800
Message-Id: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZatWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nj3czcCksTY92UkmLdMkNd81TTJDMLExMjw+QkJaCegqLUtMwKsHn
 RsbW1ANMqg61fAAAA
X-Change-ID: 20260313-imx943-dts-v1-7e5b684421cb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 58781bec-d078-4739-075a-08de81c85abf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	h0lHzYh3ofHm3Tps/+nEN8+2ATbcJPXP9HMbyG8g+FmHI9mN0nf3IY7NoAuNfjcWmITqpNG7QkVCkydj3cbhm1RSRLDOSvSJ4ej/qEXxMFHvnM+5J6mwrnQm+O7FmiVxDUscdQvNmF/IG9lEQTrVUM2HUzy10BZ0jpnJ9ktDQwNiq0cB8lnwYbrt/H/zbK6LTN7Ui1XzcMG9cKYeJhXmfqICgstDQx68PCYbk6uNw7kmTsdGZYLvO0cpxvNS+0CfUKoZSmR6bFe3vYdXj8mAPJC8ybx+lxVy1yUjA3xsyXTVFxEmF9BwUYdDnDMu7f2BgJ448uS5N4gm1FF+1KKLg7N4t5qQFl89FvpfQEJl3VD1AO0qSp99VZqyF/q2K2S759AIGFN5akJm5TdA5456760RDeVXurNdT4LmL5FIfY0YTMzAX2a9LMR2c8arGM/Wvb6tDiiZgpCG5W9kGuGKbjG8/Uo+a3o/OxPOulMUBVf1omdcwfg/VedZ88B78JtBjk1NwFdwVsyAfoJaKYklcaW59Do+qd1E8/WYMSoFHP2w0VKsN4aC5nr3nHFub6m9wgDd50R+sd8/xDMeBVdx4yqtMW2DvRaL/+ibv7vR3M8JCW0Ghe+wJ9ScNgO9uA7disC5MdB7LEhheVKODtFrvc7kEZdblRa8aFpqZhOFVtI1Uqtbxt6lgJ6heK1mCScTjhsihcrQYZmMJENfNGtOYkvMDFcFv5jKpndNj0uGaZ66J8yc124hpaxqRusIhS/RFOoXUvi1OFrlSCOFwQf4x87jesCpRylsIkEQM1can4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0Rpc1pBZEc5ZHZWOXUvOTRtTzQ1Y1pnNm8zeU1ncUhURHBESU9oTXFsMVdw?=
 =?utf-8?B?MVVpblhQblpMSFZXQkRBcUszZ21MTlVhOWYxbWxSamJDeUtJR2MwTnRsUG9C?=
 =?utf-8?B?R2RuaWV4NzVBNndmWGVseUVjY1dEQmJLNXdBK1R0ajJGVExhZmtydHZQQk05?=
 =?utf-8?B?ejNJbTlCckV4Vm1Sc2V5T2NiUm1qb1J0Z21PNnFzYTA5bVl2UzNHTUhtWjM4?=
 =?utf-8?B?Y3I1OXVVM3pGY2dzUTUxVXpydDNwVVJYM2NGaUo5dm9tWTRIaWtpYTdrVkEz?=
 =?utf-8?B?bGVucWRHbU9LZ0ttWXNtdzQxQUx1MXEwK1l0NFZFeWJqc3E4cGZ5TGM2UFVL?=
 =?utf-8?B?eXZ3bDEwUDRtQkpZd2xBYXVSeWMyOG5RREVkU2xXZ2ZCYk5URUFWWUhENWJJ?=
 =?utf-8?B?aHNTVkhPSzZOWG1lRTY5Y2RRZjk0T2ZqbkN3ZHdJcEVZM3Ywd2cyd0ZRT2ZP?=
 =?utf-8?B?N1FjK3hUejdFaUczdFBqbytzTWl1NGd5ZHNUcHRCc1Z0QWV0ZnRvaUZEVXQv?=
 =?utf-8?B?dFd3aUh3YzZvd1BYYi9uYTlrd2NpSHhTTy9uUWYvQWhhZ3NrMEpWZEdxb0di?=
 =?utf-8?B?REJHcUZVQTlVUjhQK2gzT2w5K29jNkthL0UzYzByZHhJeHpqT3kvTE9mN1cw?=
 =?utf-8?B?UGJTNWFtSW1XK1pYN0ZBUDJpSWVGQU9mZkdYaHc5dEY3NFBaMER2NmpYV1U4?=
 =?utf-8?B?U0RBdWtnWTlFR0dYWWlUaHNndER4M2JsQXlqanhkZ0VtbEk0WllBbjQvTnkz?=
 =?utf-8?B?WEQ5alBLVGFmckFBWmVrU284WkdzaXd6VFZwcG5ORjh5STQ4Y3JISzV6MjZH?=
 =?utf-8?B?b0tnNWIrZ3NLRE5naEgvSmJUYkNEM01TNGF5ZHp2b1h3cE5ISVlNd0w2R0lS?=
 =?utf-8?B?LzRlT1lPeDJwUTB0YW13QlZEejFiNHluUEMxN3pIUGsxS2lJY0NWT3dmTkps?=
 =?utf-8?B?cHdnOXpoM2VOTjFzZ0N6d3JOdlRsR3FpaENUdWFRSlBHY2dSN1ZkdFhqUkh6?=
 =?utf-8?B?WGUyMTlxbjhSRWVsajRCcytXQUxqUGZqbTc2TGhucHpIa0pwSnZ5V1dFcDdJ?=
 =?utf-8?B?WVQ1NjRXdHJjL2VtSGM4ZGVESHh0emdMYnZWbnFLWk55Yy9VaWg4NWgxMERs?=
 =?utf-8?B?bVRIcWR6c0cwOTc1Q0FZQVNiS2l6TkhlTmU5SXVGY0RXc1JtcUMvdU1hU1Rm?=
 =?utf-8?B?OVZLVlNXM0NxRjh1MWlIM0hyU3RrZHhpc2wxTFVZWTZKTmtHRFBhc2N1b3gz?=
 =?utf-8?B?R0ZwRnF1SlVVODBWZkJGSEN1WlBVT0ttSG8xbWIwd0labVZzdVBBb1FKM2Q3?=
 =?utf-8?B?bjhteWplU2FWOUtaUENaZnB4WHBuNU90N1hObDRqS2VMekFFRjRrczBEaUIy?=
 =?utf-8?B?aG9LQnFLWUpGMHF6U3p2aFA4S2xIYzJyWXYydVFQWnBBMEsvbnB3YXlwSU5W?=
 =?utf-8?B?ay9aLy9WRmI1Z3BqZTNCOVlBcGF5SjRZVmFGTnRvTDh0SUNBYkdXVUt5bXlz?=
 =?utf-8?B?TFBlZkF6VUV1Q1BpVnBIL2VMNFNERVBURWdJcWdiZ21KcjFHamU5MTdSYlUz?=
 =?utf-8?B?T2p5SUh5UTZqZmFlWTMxYU5DK3liVVRLSWhDQUxBWXNRV1cyZFRxUXhYTDlL?=
 =?utf-8?B?SnppSEZmK28wQTZRN3ZjNll6R0kwcmx0NFJrNWh5cFhSd2I2OEZzenlRZ29W?=
 =?utf-8?B?bER3Y3BSM1VZcStYM0ZJVFpRZGlNWVR0bHNTdkQ0YXVzVFEvVlFjMFNSOEFK?=
 =?utf-8?B?amhjbzZKbWhERkI5bHl4bGU1Q0huVXdpYVZFakdhUjlFcjBTMFpNcmwvNXNU?=
 =?utf-8?B?a0ZCelVIRXQySERhdGZjem8xOGFYMC9DVHcrTVZDTEJtS0crWFlOWDFzUjk4?=
 =?utf-8?B?TktxS2Z2aWh5YzR4T2hnZUxJQmpMeGs3NG1oaEpaVENiWnU1cHpOeTZEd1pq?=
 =?utf-8?B?ZGxycHdaYkc2djM4Qk94Rm15RXhXV1d5Vmg5dzVZKzdpTnpzTElFcVhKNUpZ?=
 =?utf-8?B?VFVXaGN0S3gzcFdtcWo3aWRqTW9pUjAzMmJoQ21mK3lPTFVrN2RIV1ZrV1JI?=
 =?utf-8?B?TzVHU3dRTC8rV3JaVEhka3lkd2c5d3pucUhvS082Vk1DeGJrdzVzc1o1cWhp?=
 =?utf-8?B?ZUJkdG1NSGRyYUhMVDlPM2UzenNDRUl3TlRLelVLdExYaFNzdzhsSmRPaVNj?=
 =?utf-8?B?ejhPVnJVNWMrZHFWS2pMQk01TzdxZStVL1hJY1k1WEl2U3U1ckdCeTVqZXQ1?=
 =?utf-8?B?K09TMGdmWStoNlhMV24rendPU0E3NDV0V3ltdk8rdTNHY3NLbFJMOXFaSHRQ?=
 =?utf-8?B?bis1QjFjcTY4bzNxNkJWYVhOOE9DanZ4OEhWdTNTUDBROWFMZFlNUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58781bec-d078-4739-075a-08de81c85abf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:05.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joYW6F4I06OH76++/r3bdZRZcgjHZrO+gX+wpS2Xgivrh4M228M2GjHDzUCJHTZIMu1wKCAC1bdE65z9mFL1cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

Update pin header
Add V2X/ELE mailbox nodes, more SCMI nodes, thermal nodes, fan node
Add nxp,ctrl-ids.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Florin Leotescu (1):
      arm64: dts: imx943-evk: Add fan node and enable active cooling on A55

Joy Zou (1):
      arm64: dts: imx943: Add thermal support

Peng Fan (4):
      arm64: dts: imx94: Add V2X/ELE mailbox nodes
      arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      arm64: dts: imx943-evk: Add pf09/53 thermal zone

Ranjani Vaidyanathan (1):
      arm64: dts: imx94: Update pin headers

 arch/arm64/boot/dts/freescale/imx94-pinfunc.h |  12 +++
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  56 +++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 108 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  62 +++++++++++++++
 4 files changed, 238 insertions(+)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260313-imx943-dts-v1-7e5b684421cb

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

