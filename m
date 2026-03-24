Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7236346E64
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 22:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390704; cv=fail; b=FRJtWgnZIl9Cz2q+EqT00pQ3fQGTNLnCa3+0Rsutu+8RZt2/pY6NQj/l+j1OFbCh+dAnGRwYnsHZzwWvqkgjfgbFlsyXjZY2yrmeRLb6IiAVdZLY38TAEfapxJfs7aklSh3TY/Bg2Nj7izFadSXszExAcmBf664AtYiEI1XKYBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390704; c=relaxed/simple;
	bh=APDmpS8Hw66cBtqQPTckoMS14+YFyj28mhqPAl/Boko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=olh5EPfaqoCOvy+HVdn5+VRhQWtNRWQPWzHm9rYCpVAGt+wjl50tfjKC8F4AMqg41Z5LAaHjdfukRnQsRmP8NCs73ejdK9iY8LMexFKL4NBGzEwAEfaTLmZY3anbDXX2y/yYvTLZAqIzeno3/LboYLCn5FetS88L+FPOUmuv9RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cCC2QpKi; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cCC2QpKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojuN9sC8SqAriXrFzGVtWJdcIzeC82W2R2xLSBfnP9FjHvj+CNwrNsgREKnibvZkCo2hafXNOsbZQRCtsucmH1/glg0WZpMplXL4Cw7TsuDsPsR2XBGC9gNkB/wpskW68aIMcCorhfJRgWg/w1R2kjsOO82aJ4r0R0Cr/m9yNgRzFzvyr7oG66uwHoncVjbdaKv2W/pODK8vmZgkhGwZGvdhwUvvx2up+pt5PVNoMJUuvbENxZGDtcRL896UukekYlzLMLiysLh+Ej141jDIBcxfHEV4N25NcLCqSyXaRwyHqtqG7CC6BaobpcwUPurwDva8BTWSBVlfXi4y/eNqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyrWy//TCkhd7skCFTXIe+ytEhveCaPMo2gb8xrZ5bw=;
 b=Fx3LzzBkjDI6lYDCKTjrPQDdl+KEjnPtxG4BcAeVVsdzis1enrejy2u/bosa1kc5NO4hJIZpdPAiH61BlY6n4y06NUjVczUeX36Bk2gDUL5pTscYLfKxQbUwRMwn4/PGhLd3TA4bts8Cnm9kkVqGmnf1SyUoMEmqVLSZiTh1WLEROHRg5QXFfIFKO8z1/mkIo52lBXbWplWQQNhVRIqPGtcVHaKl//5tFEA04o4yliwt9NLAlt2Wau7JFsirA+aWq6VxHHjr5V8G52Tew7mnaolkRfZtLe23G4b+BlgQG6g95GrAc9uDHoLHv0i8PFrB+VOCR+jbb4R/kCGBEYMNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyrWy//TCkhd7skCFTXIe+ytEhveCaPMo2gb8xrZ5bw=;
 b=cCC2QpKi8SGTHhvN4x/dbdgaJPMOgHcPx1g1K2Qoo/Qln5tQByNCIkFuwTPyN3xMWOUVS32jBx6TqUfA5ZkdcBOkrzv0NxIdfwcXdjNNsHlLxrXZAVtIxU93y5j4/wGZf2DUjD9uMud6dt0zHSB6a2KSdh4KThICmJ5ZRzSA/sIu3/AtpQBlq57YpBvMxY8YSMDpcuVPpZLrtS2cX0KaBcczLfd1z9QDE/ZlcmPvVMxlAVtEOjDOJjKbshGpgYHwjiojP2MRTnOFq0U95kSZWzzq86JH62OFC0DF5tBwh1M3PL9Mn6NHsgyt+XmXUlschNfSUdyTNRIuvcAlOHWnqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 22:18:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 22:18:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20251015184846.2509016-1-Frank.Li@nxp.com>
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx
 board
Message-Id: <177439069752.2425500.18084583054318171655.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 18:18:17 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 776c6ea3-2029-422e-455b-08de89f33c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EzxZz5JX+Zy+M/R3nI+zu1bsBkSwdnAaXMM52PzQN3E8fW1zNT3ab3qb6n6POSbWMXK/dguYGZmUHbpNqc2DFXgSXDs9D4JyOUXCyL/9zVMbTNfcROrZ9JWk5Kvmhg/428K1yOw5VEzZKKEB+QLn3lTM8DD9k4UyC2AEyXeVDaN1W0MKwcZETmvY8qqjk29Fs4d/5KS9NIv6Al1kweTTgIjS6GHWnfRbUyMY8/U22Kr1dZunZ3PJT13r0/HaQFsGGZdkEupo1Y+eY7Xxcb8wbyI2tR9pL8w71lw1TO2Fob/QD3ePbZMU8LbR4nVkDc34O/uG3hWDCferXJ2ExblUe84WGKlQGPrhfHMzdGzjVk/Zxu74qRBYwZ6KCq4XJd1oaqpPALnqvkGoF9xYgVkLfgrtzxnUf3yq8unXWth3Tj1ZJv84PF0wjWeZquBg/+BW4hg0kK1nOoyd+N55RefD9f5blTbV7pmS5/vbxq64exgXcTW6jLl29qRdGPLgLLrpqjBma6CeO7a7DLC9fYY4xONw2IQvhbWctAmqo1dAL8vAjbpD/GOMpDDXQ/MA2B8yZ0OgSDJwntIGduGQ2X1YZQd7/V96VJ7WWDU0It6QMh2o2qqMx1AJyLbwltAlCOXZB3JEKx87V0ov74ZkLYezlBZ5ooIo1FTEh3ZHI4AkNrM2tr3FJCIIg0iZJQ5xj53LUI9hjyR1t0vS0GPwdGBQCG4YmplbwDK3OkSy2E4CJtw5VzBjGrUNi3Ap+x9hq7KDHnlapPmvRzTd4w80tTWUoc6d6d7GJfNgR2uYGHFwJ7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVieTJhM1dPVTk1MkZQSnVWQkt4UTd1N01mODRSTjZ3d1JjSEtSL2tyc2Jq?=
 =?utf-8?B?NHlLYTViSGRHUTRSZTdaYXBaT29XZWpIU1BtWlVTdVJwTVZjUzErQ0NoMU44?=
 =?utf-8?B?eXY1V0NvVXE3Rk4vOUxIdS9yeXRMUGVZOG12MHNkMUdkUHc5d0ExTGcyQWRD?=
 =?utf-8?B?dStBTEZqZ3Q3SDExMTZHdjBDdDJIVUZPdHp2MWRsNnFZMVdJWnRBQzU4cEtF?=
 =?utf-8?B?MFBOZHIzanV4N2F2MzBvWFZ5U3Nyd1ZjdUNUVCswaUp4a1gvMkhCdnloQ2xV?=
 =?utf-8?B?RXZmUVhrZEkxM1pja2VaMkRNaVYwQ2Y1aE96Z1RDN1ZiUzBudjVzcVhGMng1?=
 =?utf-8?B?Y1ZJR0hKb1RwR1lvSHJLL1g4dzlvaFVJc0xBSHE5amF6RWFnVWtwWkxYdTdE?=
 =?utf-8?B?YlJZRmYzNFZvQm1RTko1cTcyRjd2SnltcDRQSDljQjR6ZzZML1V6cklTZFlo?=
 =?utf-8?B?dEhTOGxvOXlBWVA5Y1EyVFZZNXhJNHliQjRESHVaekd1RWRXbUxVYmVkb0JU?=
 =?utf-8?B?QlI2dlErL3d5dFJyY1BNSVVZZ2l0VVVncEsvN3R1YkZ1ZUFvakU0Vk1pSGNC?=
 =?utf-8?B?QXBUc0dwSTcxbUNHci9uenRWZ2dRRWRVT3EyMEFIaW1pRDY3MGxRcEhZMytK?=
 =?utf-8?B?bHNHbG9NRjFDZXphOHZ5VmFvbStwaWlBN0U1bEI2SCttTW9CWmp5S2c2bTdE?=
 =?utf-8?B?R054TkJnNzhKbm15em4xTXNZWDlDamlObENUS3pIa2VBeEZmM09OUE5uclF2?=
 =?utf-8?B?MVBQelpQWlZ6Z0hpR2ZEVkU1TDFGN0NKOUpZYkFhQ3VselFydnp6cUJIdlNX?=
 =?utf-8?B?N3pOZjFLb2tkdlB3VWRnNmZYMEFzTzNWRFBnNk8vcnhRWnBXb25LbEd4STZU?=
 =?utf-8?B?d1hGK1dldVM3U2wzTDlaU2VTeEgyQ2w1N2d0R2hLdmZwTVhIQm9jM3J3YVJF?=
 =?utf-8?B?RE1qU25McDJTamU3ckZaSVg1SHE1VjF3L1BTOGRGRm8rYzBsRVZkTFhkcTlX?=
 =?utf-8?B?cDA0YUIySElYN2NOTHpPSTJDVWJvYjRobUxZTmcwMVh3cDZ6WjczT2Zhc0NR?=
 =?utf-8?B?VW05QUtuRkJ0NHltaytEbjVxcjIra2JLRUhvL1VwMUhPK3k4TFVLZExaM0lE?=
 =?utf-8?B?cU5TbXhYbWxFNGFTR0lsN1ZUMEV2Z0NpWmtNTjhNTlNHUk9PVnhaK0lKRjFZ?=
 =?utf-8?B?SFRzSmVnK3ZWdlhkM0tjM09sbS82S2FGWjdoTzg5bGRUeFFmcHJXQm1SN08z?=
 =?utf-8?B?cHNCTGJFL1lFbmpTU0RFSjh2R2NZR0c2dTduM1h1ZC9mR3FUbjZMM1FnV0NR?=
 =?utf-8?B?VjFhWmJpcTZMajNSeUZYeENIYTB6cE9JRVlPYmVLZ2xFSnhOK0Zud0l5V1Ew?=
 =?utf-8?B?aTl3YzE5dHN5R09ZeUxXUlRFckYyRUlJeDFOejd2RC84Q0NaVzFEdFh4VHI0?=
 =?utf-8?B?d0RQWlRja1BGV1hYRThlQlVVL2FhNkpVbGY2QXRJSG5YT1hGNU93M0t1cmM5?=
 =?utf-8?B?cThlUDJZMGdMdlVHNGc5NENicnRHR3liOFdHNDl2RnlRaU1WSUdBY3BTUmtw?=
 =?utf-8?B?cm81NVFBOVh2RzNxdkFGYk1FZURWanRCSjhrVGlGVFdnWXhKK2NCVGdKcFVt?=
 =?utf-8?B?K0RSN1hlVFlvbE80RXM4QmIxRzVaM2tDbmxLV3lsZ0dCS2V2L0NFUURCaUUw?=
 =?utf-8?B?RU1GUSsyRkN6bkFheVdBd3ZGaElROWMwRTUyaDNxc1BmUkhnbUtOS2NyT1Ro?=
 =?utf-8?B?OWF4M1hTdlJITWNYQXBYRVpBTW4zcWMzc2VFUllyUXRsTGp0RHdpREVTQlIw?=
 =?utf-8?B?UEt6RlZjV3dSd3VHSVl5VkxMRk1neU9wY1UxOVNRdlYzTzBNR3dtaEo4c29H?=
 =?utf-8?B?UUg4bjU5ZzlKOWRqUHV0MW4rTHlZM2UxcVBZYWlPN3ZFeW1YZmF4VFJnOFl0?=
 =?utf-8?B?bzErcHZSMEpQS0IrVExBTmJUQzJqNUdSRHY1R2N0SmZ5RldMRitabkhhMUlv?=
 =?utf-8?B?Y2xWWCtpL1A2bEhjQ2IzWnphSWJ5R0VOVGhycG5PREU1MEx0ZE1nZGFUcUZo?=
 =?utf-8?B?Wk5Yak11YTR2SEVSZEVlOWpoL1RadW1IUWNBTVZvUW5qTm9vQ2NETHFIclhW?=
 =?utf-8?B?NzUzYW9YRk9rR0QvdCtkUnpsY1o3UTBTUWl0Q1ZrSkdNZ2lEUHAreHhiWStS?=
 =?utf-8?B?QTg5WXB1SzYxR1ZqQnFBM0I3a3pEOFp6RXZ3WlFsWnlodGV2RW1tdlU1OXQ3?=
 =?utf-8?B?ZGVrZXU2NTdoV3JYWDJoM0lkcy8xUTZUdW1FWUpyWHJIL1ZoRzRjbU1kajVl?=
 =?utf-8?Q?RqrJ9kfAD16NA+hydU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776c6ea3-2029-422e-455b-08de89f33c95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 22:18:12.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wy7scVZF392trm7H8PqLAooLKhgzDnDmRoOeZ+mvB4yUCjV/IkjVV8FhXTNzZkKMXmIknZnOoneZAJ/tpywBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128


On Wed, 15 Oct 2025 14:48:45 -0400, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: lpc: add missed lpc43xx board
      commit: 2fa7edb7e9d5a704880eba7bb7eab796f2411263

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

