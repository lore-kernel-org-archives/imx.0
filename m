Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD232E7F25
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 03:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522541; cv=fail; b=DlaRXwyxtuW1f+O384bFTz67/v6oTrba0UJHpZOJQ9WC9eG45ZEFT8FuG0ejKup54nDoRal3pbT3nvFqLJy5bWFoXswEINaN8X+BJKOxGCNS2h5tZArm4g4DSTrQ9Vhgm3jhFsIyMb+oJQv9XQMfp9a4TvUPQOySy9ykLjpRFUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522541; c=relaxed/simple;
	bh=oFCkX75JGUNApeytvC4wt+e9irT8v8hXnGvhEqCylUU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XMnO9lMNeJKsAFHENGYTKrUMTBz4HbF663dJAgSHAA0OJD3Xz4lMHEIyZvDrxBM0A/3+rB+6gP/D44d67ScHPPZRCJx7LVtstzU0FFrUV2GQDK+n9xj3Vm45MDj1yeVcULxUuHLRZ/zcjLSY0NX62QUIGkRyzFBaabcXNsUA7mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NDN2hcpK; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NDN2hcpK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeySYJ8tdIU6kD4pnL7DvZd2F95rD6h76OMwg5ZJapAp7rAKxXtd9yurPl6SW0PJy4ku8dsThA67V6wYEYJxMZ5AHHxc55+ImWBCfn6/+MxBwTot/CdeNoCQFwgNxtnPj9wSI9U563sjs1mN07PH1EIvfZYXLOIwcCyACdaa1QALhgKkdI/azZenVXWwaVAqx7CGv2RhanWOPolZOMFNsxxseTlMi5x0tyirI7OFlqiTRSU/a4q9NdTMjq1dBJ/bd5EX+Bxtyyy66Y32yAHr7oCtXuQ2HiQx3ic/ACWDwkeFd3q2hllvKex3Wl03nskA8+FVZCBasxuLrlUJwz7HfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0nJiRJ9e+wAwMBgiB7dXqplp38WHPPZH/92NjLxs/w=;
 b=mQ+Deso+jFgwoSnnfVhYH61wHSnuClzYw7Q6GKpHt7NkyWhZ711qUPY/TU+0zrdU5lSNfu1BiAJLRe2Hbol7PdU5U/jlY4uuUOUxkSlJS5u8lQPx3sikq9fUGTpnXo6bZU6aOrkB3atuULj2sXYWoHQVJsTDa/7iCdT5DeKbGWHFkK+ZTUiI7QzOEflAh3hkEJ5PcRQGTkdmBsNcfQQFn3ji+Ijt1HI5pu/ybAeOidMUmetCDjPUuYlRB8J86ry35rBBMffLSOBs2kWWbi0Ztl8vqAvpJH4nVd9P803xfFlWbJB4hdpz3KE97cGm8zqRlCCViTFdVmSmJQGkliQDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0nJiRJ9e+wAwMBgiB7dXqplp38WHPPZH/92NjLxs/w=;
 b=NDN2hcpK5yFTMWdCigTQIvQ3De7Zf15DIEHLpxq++uB0uEzbviy3PQL54yLciLIAjCP3hA8WEd5gt0yyAEe8wPDIBAxWLqLgvkEZcxYLUf1LZnWZ2sSOHoE341uD+O2iXH/QpOYgOIuTevMmu1dGg8RD1ggT+J9pUI/EFnBr06+T9WBg9OU5IWbG+pOgtE7zWycbWoNqrzMbbApjB11RCDGirbAyKeiH8fMLl++wSmN4FEaS7UdXsF2+xZCGNXJSg3DtwWw2VDRnM8yDfsRTlGYMxtg1wuSbLmSypp7joQttElW9LCqd5E5KYtgBxxo1sLFQakLNS7jS7oUA0YWi5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DU4PR04MB10792.eurprd04.prod.outlook.com (2603:10a6:10:58e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:22:18 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:22:17 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Wed, 19 Nov 2025 11:22:39 +0800
Subject: [PATCH v2 1/2] arm64: dts: imx8qm-mek: correct the light sensor
 interrupt type to low level
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-dts-imx8qm-v2-1-2579434f95cb@nxp.com>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
In-Reply-To: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763522589; l=1215;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=oFCkX75JGUNApeytvC4wt+e9irT8v8hXnGvhEqCylUU=;
 b=I+JplB2t5ufunYYypIDiPWIJs627UxuxURQ8wRvq4OguJaXu1YY6Iegd7CT0WSOsZBvwfMvRH
 +gqPn4nfUo8Ca6esNYTWxDLcNRRCZm0XPIjTua3mo92Nq2AkVs/k2MT
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DU4PR04MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: 931583f7-2e34-4193-fe6f-08de271ad6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXJsN0d0eVdxMUFySEtnZ25wSStWZVFWb2prVkJlN00yTCsrQVVRNjBrejBT?=
 =?utf-8?B?b3FtbEdLSnBmSU4wY3N0YUZZbzZLdUI2REpXTklNNnpnVEYydXlxNk5idmxR?=
 =?utf-8?B?QXhOQ3phbkU5Q3ExalExdHYxZE9CUUk5RllEMm1OMTVXSG4zWUQ0WjVJU2V3?=
 =?utf-8?B?Q1IvdWZaa3BOSlRRUmJNYnNINDlEVFJOZDErTUR1WkNIVGkwYVZSR2Z4WHp5?=
 =?utf-8?B?azZ4dU5KcFVWZmlndmFJUVpSWlEwYnVwSzZTaGZwcy9PQk9zZmRvc1VMRTZV?=
 =?utf-8?B?NWJDeDFsR3dXeDM0VUJHZERYMkVySERWNWJpRGErZDVvbzZoWVRxR0xLVEFP?=
 =?utf-8?B?ZHQxR0NzaFdBUmY5bGFBNDJuSFhxQU0xeXQ4OU56aFV4Y013RkpJSHRSRzYr?=
 =?utf-8?B?UVFwUGRKbWhOeVZiYW1hKzlvdjZObDNHNmxNcjdBdFBHdDd1VEQraUJsRHpo?=
 =?utf-8?B?NjczUitMQTkvSWM1S2NXcndxYjdXajQyZ2hpcVY1ei9BRVVoZkRIRWxSK0k0?=
 =?utf-8?B?WGRFbTJIaXQvbUpvK3dsWXVFTDZJdDAyUXJQeEVRQ0Nmd0w2UjVQVjVlVEdF?=
 =?utf-8?B?OUV5RDAwK2M4UGRJeU1CVHJxakZQR0lXOGl1cEhOVmg1cXQrWEI1VFZaMFlt?=
 =?utf-8?B?U2tQT2hoeEFuNWFNcncxYStCTlNueXM5NVZDZHVzTk5JQVF4TWdnbzRBenAx?=
 =?utf-8?B?dWdBQzNvVVpiMXhNc3JTanRRbzJHeWdlRDhQbnI2MzAwN2lFTFRYY3hLVnlV?=
 =?utf-8?B?S3VGcnFFdlNRRmt6SjgxVUZRQ2JIS1V1SzdyV1llb0lYTThrTWpxSHlPZmhJ?=
 =?utf-8?B?cDAvd0dwem1DVy96ckc5NmJ6WEFjd2ZNZ2srK25Ka0xSYUxCN3NlaXB3MTBn?=
 =?utf-8?B?a09rVC9GNWdLRFdvZjA4RjlVTzNqRUIvS3VVbWtpazZaSUpzRGlqYlo5UmRB?=
 =?utf-8?B?UXRLNkUweXU2MTlmNmZTN2VxRjdRZW5BUXJnNmdqSnFyYzRsYzhTb3g1MzhK?=
 =?utf-8?B?bnlOdDhtSStHbVE5K2wyWE9ZSW1jLzZuZEZJWXJaVlYrWk1TMDV3eENLMi9Y?=
 =?utf-8?B?K3doMFlIQklZNUhPSFU2Q1doUkhLUGVzV21hT2VvTEd2MWpaZC9VTHVOMi8r?=
 =?utf-8?B?U1k3M0VTWGFLUWZNTmlqRkRQZGxTMG91Y1JWSEorME5rTzBUUFlWS2c5alcx?=
 =?utf-8?B?aWVSWkpCMVpsUytjRWRIdllXVG1sNzVXSkRZNFZmRExneVhTQmlrbDVmUDZB?=
 =?utf-8?B?dVI0OWV1TjRFYll6NWFsbDU5a1Y4TkJGdnkrZmo5Rm5Hd1BZTlRXc2ZsblV0?=
 =?utf-8?B?Slk4cm13bjltaitINUR0V2oxWjY5ZmdWM2RkdGhITUJKN3ZpeitDOGw1ZEsv?=
 =?utf-8?B?aW5SamREVDVMZTZLT0M2UDh2NG81WjhqV2NVZnpMYnQ4TDQ3c1QzY3NLeSta?=
 =?utf-8?B?ZGkwWHpoRE52WDBsV1pjdElqZm56UU96Rk01K0xiMUwwcWdoMzR2UVZHaFZz?=
 =?utf-8?B?YnQzKzM1MldTeFVRdVFMcjVvTzd3S2E4RUJ6Wkh1bENVdHdNNGZTeHJVS2VC?=
 =?utf-8?B?MTYwZU1vbjhLSFFCRnR3MXJIdE45YmZKUlVOdlN0aFAvM2VCelhSaTBybllN?=
 =?utf-8?B?ZDVRaEtYNEVNbzdQNHQyWjB3WjZWY0Q4V29veitKN2lQTVEwV2VOOU1udkRh?=
 =?utf-8?B?MFk4QnNmY1p6U2JWVFFodlRWY0FjVzExRjc5bHJJQ0wwM0xIMTJwUjh1d1BN?=
 =?utf-8?B?T3dScGpzd3pXVHZtUVlWWWNtM3pSbnE4eGdWdXNHVitHQXA5dXQwY0JZK0d0?=
 =?utf-8?B?TEFzTG5TMjFpczhkYnZyc3Q1OGN0eUtoZCthVnFad0VQWGhzL1NSdUpVcnFU?=
 =?utf-8?B?WHk5aHhGUTQ0cFhoVFZpUjlQMjZGN1hJOUlnSHkwUStybk1uT21PNUd0U0xm?=
 =?utf-8?B?SjJYNDF5UFg1TWhqRWk1SlF5czFmUTY2dzdDRmdockFacVdMOHM4MzhoOGoy?=
 =?utf-8?B?ajJFZCt2VjRpQk9lOER1TlFTWUNzek5TNlNHQlJBa0lZL3J5NTFYbHJ1Qi9S?=
 =?utf-8?Q?O4lbbh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmUxSFZZZ3pHWVpleC9LYWEwVEZDMEhtY1FEVkp4TXNDU0Fka1poYXJWODlZ?=
 =?utf-8?B?M0pWVlVQbzVPbXV5blZTZkZ5RldJMUtTd29VRTdGNU5ZcXhlTXBpbVVLR0F3?=
 =?utf-8?B?aS8wNkRUYzIzL044N2RMTnhxc2t0Ylo5a21kY3NXQXFhdlBHZFRvZjBncC9r?=
 =?utf-8?B?S01FZkp3M2IvVDA3NVFhVi9KNnF0QWp5L2MyTWVRTWE2NWM1bzhxRWErU0xV?=
 =?utf-8?B?QWJKcFY5NjhzdTk3Z2tNNzdmY3NpVWFRanBCY0Fta3ppb3FlVlgyd3YwQjlK?=
 =?utf-8?B?dFZIR1JNdkRzRmxDQTA4Q2NlRThvR0Irc0owWldNbUpsNTJwcHJ5bmtuVGVp?=
 =?utf-8?B?am5WNlJUa240U1BlYXAwdE1BYnRwblVoVFZ5eUpIZGZFamMzWlV0aCtIVVc2?=
 =?utf-8?B?ekU4ZGxzL09oa2lqOUp4MFl5ZFZnUmIvTUZLNHFJMWNkOEpnZ0FFd3UrU0NN?=
 =?utf-8?B?KzBmR0N3RzNyVVZQV2pMWnNsWU1vOEcwZzMwTUJ6bklndE82ZjkyaEp4Ry9v?=
 =?utf-8?B?Q0FyL0k3RERGN2h2a1FqU1dyb2ZzK3RGN1dxVlZCYXEyY3ZkcGJvUEZna21P?=
 =?utf-8?B?cWZneHR2YnZOZXVObFZWRzhpbFZyeG16T0NiL0FiL093ODlCUS8zeElIbGNR?=
 =?utf-8?B?UWtONlVxUU96YzFITWZvays0eVFLQkgvVFhTeHhHUnA0SW1wazhGMTlVNThR?=
 =?utf-8?B?cE1nQlljVHN1ZWk1ZmNLdGJLa09ObUUyTFVkN3dWY0V5QnB2U0hkWVZjTW90?=
 =?utf-8?B?MFdKQ0dYZFBNNkdCOHRnaXgwTWtWQUp1bVBYa1kzUUxmck5peFBTSGV3TXoy?=
 =?utf-8?B?MktPbm12eXNzMXlreFRaTTNTcnc3cjMwbWJDekdjdjJZTVJxR3dOMGtnb09r?=
 =?utf-8?B?bHpTaHJDNU1zS1hnSE91NTJ5UGkvTURWeXRCSnk5MzdPNkFDZWNZcU8rY3Q3?=
 =?utf-8?B?TnJsWW1pYld5SGdrcm9jclhEOTlqakNzbFpkODVjYUt3Y1BzYVFXOXhDWmxr?=
 =?utf-8?B?SjErNlh6VUFKQnpuWkZiVVR6azFqQmlNb1AzL3A5VytFaWFHNmMvNnFTUHIx?=
 =?utf-8?B?WTZ1UjdMbjlsL0QxR2lFSmVkd0NaeFZ0U0VZODJQazJZUmRaWmcyYWJHVVRq?=
 =?utf-8?B?eGxJWmJraHZDY1VpWXVna2toKzFEL3VsL0RQUlFteWxJSHdVcHJhUG5XMC85?=
 =?utf-8?B?R2gzRnRPM2hWY0NDN3JIc01oM205YVN3TnpjbTZ0MmZ4alQ2c3F1UnRzbTRh?=
 =?utf-8?B?SmpLUEdBRkxUZ1U2SUIvbmNzSnBnK1FxenpoSGVTMTJ4dXRPQUowK1VCcFhN?=
 =?utf-8?B?WVNrQ2FuT2hvTG1mWDduckk1UkZSRnhFdjZldTZnalFhRkQ5TUNaTDh1ajZn?=
 =?utf-8?B?Z0tqRUZ6dldMNEZ0MmI3SXVDVmFNNVZ0NGhCMDhybDRIeVltWjJ4RlN1bHkr?=
 =?utf-8?B?ZjdyV1BwNXpVZVRQM3dIZVlZbVBqZzliUkQyUWt2Wjc5dUlEVkNyZFhGK2NE?=
 =?utf-8?B?bXYvYzR0V2xrN3l6ODM0eU04cStjL2RXRkxQQ3ZXQXNTdnpJUXFHR3d2Y1J2?=
 =?utf-8?B?THlJNWNBK05MUG90c0VqY21CNmRsNUoyNFNNcDFQYWgwdGFkVjRTS2Q3YU5n?=
 =?utf-8?B?SkJLRjNzOURzdGVKMXV1em1HZFdqYkNwNXB4enhFZmpWbTdPUGRRQmlib0Nv?=
 =?utf-8?B?elRUSmJiSlRYQTkxTHNGcHJKQ00vVDQzdlBGY1FFODEwTWZEN2w5Y3h5YmRK?=
 =?utf-8?B?ZGNUc1kwRk9oZW5kN1ZWeGdZbHl3VjJ3OWJ3dkFDYUJkN0NXWUFuMVJyZHBk?=
 =?utf-8?B?N3N2S1kxazIxcmMwVENGUlN4VDJNaDgvNHp5amlFSUFGdTZYaHNaTVVwcHp5?=
 =?utf-8?B?NE1YYmREU29tK1BZM2hEb2ZBTFJaV1RyeW9jOUhCK3BwY0pjTnNBUHJISlNQ?=
 =?utf-8?B?Z1FETkVuSDBtYnNXMWpnRUgrWGFCZUlsclMyYStnamdady9lZW9MODUyTDJv?=
 =?utf-8?B?YXBSRVp5MSs0OU9LQng4VWZvUy9rekhWRmVpUmhMQTJaYjI2M3I0VTNJQnFr?=
 =?utf-8?B?c2lnV1p0bVFmay9ZVnJKYWFqVURHbmd1K0p6N0ZMUkJhYmMzRUNCYStocTZS?=
 =?utf-8?Q?LQxAJDnnFClaJWwFqZw8saAJY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931583f7-2e34-4193-fe6f-08de271ad6f6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:22:17.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZE10138TTHbtTK8mAnAEycOsmKyjer4LfSL9uoAiZdFY1haUiTGKRAq84DYr/RoZtDu8heeXCMzz7WzuDuNrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10792

light sensor isl29023 share the interrupt with lsm303arg, but these
two devices use different interrupt type. According to the datasheet
of these two devides, both support low level trigger type, so correct
the interrupt type here to avoid the following error log:

  irq: type mismatch, failed to map hwirq-11 for gpio@5d0c0000!

Fixes: 9918092cbb0e ("arm64: dts: imx8qm-mek: add i2c0 and children devices")
Fixes: 1d8a9f043a77 ("arm64: dts: imx8: use defines for interrupts")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 779d9f78fb8196b04c41516963f16ece082360e3..667ba2fea8678215c611dc0ca19e8fbc397f9273 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -576,7 +576,7 @@ light-sensor@44 {
 		compatible = "isil,isl29023";
 		reg = <0x44>;
 		interrupt-parent = <&lsio_gpio4>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	pressure-sensor@60 {

-- 
2.34.1

