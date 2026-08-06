Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A84D90AF
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047341; cv=fail; b=cCK4oF9LiJc0dCyUSBJtjiKlBHNXQwCNE3YLbIYYrWnnlwAgVX7XCywaaG9WYjIXw2T+DP4V3Kw/Ke56h6EcjhtEghC8HLltm/ElS2PIo16AMjrUg04e4Bm6QxadqJqf2hnjvVBsgNM0oDR4HuEKfSbj5Rx5RDb7IpfCqbXgrIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047341; c=relaxed/simple;
	bh=XhNi6T2dRoCu2L6QxQLb8B6temTkZFRg01fQtwFhz0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NrejNtsPMkeEuWQa8QJ5nXwxXZz7D/9fl9av8ZLEGQ1jhJOEThIx81Gtt/r1Jzgv8V3Cnv2xazUpHyCRQTy74reMv0XHwrSYN+CdarWHHD+kTvyVVDDvlvzY/3hkThcC0Qc/gR4lC5tHB1lWXv3luWnbch3fhiIElC3zGUF5Kpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZB4uxF02; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZB4uxF02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viSuJ95Zfgnhe6/wIanXPM0OzL4qL0RUbE3fDtou2gKTeDpeadDfE8U3YnfGXjD1g2XqjOAYg9cFp72pAeuo3anL6N5Hgz94GRYUJ5f+o7fx+IASsq0GBOOFxTVJtJ9kH0PbZ28zcoocEkBLn7oTNZ+9JVmHqGw0k7YqUPh2Zog4nO8rB0VfRHhff4U/xprhV9Q+WEBljs7Phw4v6Cdi4GxPdS5ey8Dj+l2JaAjW9PIQUt6aYSqfdyJgA+yRJo03TDLrbuxzjOFWjxYCj6pxj0h5sbzKuh7MV1atLEDCO129HAh06neUpL+qLj8HKzQiPDeFc7qkbwgEb4mHlt87ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0yP1Zjok3tLlEm52tZNyGBw3jeanj8TUEoDgGjAgVw=;
 b=BfM2KG2qHQ1dBIyFRwyq0k6/eeinh5fz9VSGwvFZVgiThWjK5xOcUdi4z0jiS9i0xUCEYl918rdsDjSpwOesxy3lh+GzwpQ/o0DojdJs87ShWQmo2nhL1D3vn4GoxK3LjGuHxZODx30594747f4ifQzg/y9ykfAWIxtami8GOjEu0eydrgFz720X1UaWdfGUlWnRc31aELUtqfgqVq5N/ga9RygH42ds3nMk6eswbp09UgBBoFp+RixhMp7piW1oEjYelDMcJWQmfO6I1qbo42kt9rshtrn5VBY0Wf+SJdYjzr+WCU1SVjcqIurgjS9iZjAQsHtnyCPC2j6Yx3igYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0yP1Zjok3tLlEm52tZNyGBw3jeanj8TUEoDgGjAgVw=;
 b=ZB4uxF02IeAkR2mwn5Yef8uNpEz8Z7LQT2kQwzbmfnUerWJlw940mJ6p0Yz9CMM0WQ9ovOOlVtFmJTq2HnzAKaibeW71kq0T9mU0Avq6L4B4RAFFe81QLMEeI5hylnDbmF5ucPxXvMiITqSqsCGK8racGFEzZy3zkvCLLCMCDXB9VJdkF/TAX7L2M5jau4cy15U2uT9fbbWKOOxMxfXQdZN2M4fM7hrO/6rZg9VZmoIb7hl1MmrVHZXhZrazhs3a2LnImpEnRNC5JNwm6e9hYfDDnMxgvqrgtZ05b5RJpjSoxlRtBevAK8cyT9HEPZVvQia7jq/rvHyUDDus2H/3aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 20:15:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 20:15:05 +0000
From: Frank.Li@oss.nxp.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Joy Zou <joy.zou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] regulator: handle regulator late cleanup race with PM suspend
Date: Thu,  6 Aug 2026 16:14:57 -0400
Message-ID: <178604727298.445929.15032768759800271000.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:510:23c::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c670861-dad3-4d4b-2fa2-08def3f767c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	m+7EfFAZ+DHPNwqIsfunNf2CcBkWH1imPPczduRnsx79xsTFko54E2A3L67rihy1wa6RYA9gySMfpCS5MGm12STe2rosgs8ZVY9DqUTwhCdWkdDJAC6twQswFxSE+nTCYXoaoXv3PZXTL4YLb/qy2HUZGaUxe3A5Ha6l+wcMjBTkYnHy7rZ1XfqYwachJIey//FJQnAjUOAJL3k759xvZXfXv5MSQ9ilqTf8ip7jiO73kNxF0tc53RkAD4VH1MPiTlrHjTb8wkoP43wkE9YFihS7yYEaqZc+Hb4UT8Y0/wST5Vcas9svjaWQzivBrLZde2chkW9EJrKLA3hvFSpz41gonHJ8mT2L1HlKAGsMhNkMtfMTq0Z83HSGuj4UBIJ/0G5wR6z2O6TI3ALPWJ5lQw7GKGnmAYUuXBgdrdsNfHlHErg2KVjhB3xyKHz47wY/3vopi5nrAiCm9AwD8KFhwr8PWmVp0dx9/Ccmkix6ARh7yfsVWooacF8MTaTPJU8EuQ0hSdVR+v06DS9Lw4dmmOyNdkXpMmc/cuafondnNnkFNjJK/OKlUHeLnd5oXkCmZlRCB2dBC+k/eSobzZ5jm1vEWnMUrBe0PG/N3SH5Qr8aSPmDHWPqqnuLY8/D2AKCSw29sjRPJ06pCjBjHgUmvS0KPnoanV1FmuKWVOvvYTSLInKb8UhTXylE07zLjARn2H1Bvh9FOg+eCBENofrS9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUFwMXp4VTZCSHB4N2lPUE9kSWh4SlNUZURxeUVrV1hOTGptdEFOU29sSlFh?=
 =?utf-8?B?RnRRZ1d1QUtVK1Rpa09hRDAvN09NaEdDNFVxbjJ3MmJ3N3Q3dXNmU1Q4WHhB?=
 =?utf-8?B?dmdyanlUaS9tVi9XUDZianE3MUJsMHc0RFNLSnpDN1pid1N0VHVKWVBoRHBV?=
 =?utf-8?B?Qkx2YTBOL0ZLKzZjRWlHZmFhL2xnZUhjbVJtSC9XZnBQWUxxTUdtME15bnF4?=
 =?utf-8?B?T2V1YlZMTk55R2ZJK2ZiTld3OW5lV2hJM3VUSFVCSU8vUnovYU5jVTVZa1Vy?=
 =?utf-8?B?cytFajZZQ3FNd000U3RDYWtZdGpkOHdqb21kM3NVVHdOT1JOY2FHZkpDNkRK?=
 =?utf-8?B?aVY5bXREcGFMVTFudEVQQ1hZVFNqRGJUV0Qzdi9Lak1lWGFidmk2bGJvM0w0?=
 =?utf-8?B?bEV2eDBUVVNjOTgySSt2MTRqZE9NbUVJbVFoTWMybHh5Zm9Yamc3VG5sR3Vx?=
 =?utf-8?B?MzBGM21ZSS8rL091K3JaRXU0ckp6dUM3RlovNThLZGY5RVArc1VPNjc2cnc3?=
 =?utf-8?B?UUEvQXc3V3JIdlRaSGFQa1U3NW9aR1BzVVN5amVIcU5YMGhSNzdYWUVMMUdk?=
 =?utf-8?B?dTdJdEJxQ09UeWxmbGY1VVZoYUVGbUIxUzMyU1ZsTFN5dlkzQTNrSkhXVmNV?=
 =?utf-8?B?TENZU21kdzIyM3pjQUZPKzRUeWhWYU5yakVpdktnUk5hVG5hTmFINU5HWG5G?=
 =?utf-8?B?Y3Vvb0hPdGZFcEZVMTlTano3UXhpZmRtYmU5Y1pFRFNmU2QxbXlLOTNtRXZo?=
 =?utf-8?B?R0F1RnFXbSt3dHA1cEsxWlcvaElhTmsrQnNIRzRPdFRwc3lUSVlkVThuREFj?=
 =?utf-8?B?Y1dXR3cwY1NibFdvUEk2S3ZkKzh5RWtVY0tzVDdDNjB3NmlxYW4xUjh4UW9w?=
 =?utf-8?B?WEtOSktTQ0hiVHBwV0hYNjJobFFkNGNlUC95NEhQTFRZelZ0eEhSZVZTRXUw?=
 =?utf-8?B?U05MaVJWSnZLQ05SNkVXSFpJQ1ZmcFg5YWtZalpSZ0pMMHI0VndWS0d1NU5r?=
 =?utf-8?B?a1B6RXZGYWFRYTViaEM3ejVORlkrdTV6K1MyaVdOcmk0R25JWkY4TkVQcCtK?=
 =?utf-8?B?T0NGZFVTUXpmMHB6MDVHZEU0OExnUXdkNmlWQ2I0bGgvbzB2RGg3V3JGcVk5?=
 =?utf-8?B?am5yTG9GZENKd2ZEcVA2eXZVcXAzb25SWkxrWDVYVUhjV3orVVZlMEZSd2Zh?=
 =?utf-8?B?VTNVU0ZWeHNuenQ3L3BiSzdTemFETFh3ZVNTa1d0eEhuUWVMRmtmNytzbEdr?=
 =?utf-8?B?OTBucGJuSHloaDNkSWxuNll0WnZrTkNkUytsdlg4Ryt6QVM5TC9YbU9LMWY2?=
 =?utf-8?B?dlozZnRKSzhiYVFhbnZDZWxDTk1iQTU2aGtQT1dYNXU1bkxoY3J5TERBVmpD?=
 =?utf-8?B?V1RQYXpWYi9HZXAwK3AraHlkWnR3a1RWUkQ1bEhXOGc1Q0xVZGdTWXVJaWtK?=
 =?utf-8?B?a1hocWlQQyswQVNMK3N5YnJ1N0VyUWp1NGMrWGcrU1hJc01pVVJ1YngyaElW?=
 =?utf-8?B?UExzc01zQ0Y0ZmUvRGRwRkhkVFZXRmJSa0RKSXpsekZZYmlhd3ZvTWplTE8w?=
 =?utf-8?B?cmpvWDVPbHM3MFV3YmF1TkRwWmFCZXpFa2J5NG9ZR001WWpaQ3ZzZUI5VFNO?=
 =?utf-8?B?QjhnQm5XOEV1ODk5WjRtMnhkMTl2RHJIMXFraFVyMHl1by9Va0lWV3Q0U0dz?=
 =?utf-8?B?S2lGSHFpS2tVV292bkV4c3B2M3JuSWxFY1VoM1FDOFRuaDBRZjYvV0M5T1Nl?=
 =?utf-8?B?UUszVkltcjRFTFVRQjdnOG5PZmJ0UHVFOGpOM1gzaEZUL282Zy8yM2dtWnE5?=
 =?utf-8?B?a2QvOFYxRFIrUDBLUVJqWEY1VXpISk1ZNzJOZ3BGeStlSUpGaXFMaTltem5n?=
 =?utf-8?B?bmdvR3JMVWQrVTRzMzRzcmRIaGtTZjcxRW5MU3NQM2hEZE4rRDZQQ1A4R3dQ?=
 =?utf-8?B?UGFRRXR1ditJeDRRMVBLRklDSDNIekcxNE1rb0Q4REkrSE4zWUFjVXdBTUJj?=
 =?utf-8?B?ayswUzJRaW1MbytTdVlpT1czNHZ1ZmdSa3J3MkQ2RDVEcTRxWGVMVW4zb0FM?=
 =?utf-8?B?VVZqc3haWjJGMndkUTdaSHE3YWpvL2xObGtWc0c0UW52eFM3QVVSMlBnYTVr?=
 =?utf-8?B?aTFHRHFQZkVlK2FpWFNHdzdDeDBWbGVvSWovanU1b1ltSm4yNTB5U2JhZFBN?=
 =?utf-8?B?Y2kzY1IvRE5rMHRGTzJhWWhMVGlwWUhVdTczQTViSld6QXo1eXdQZDk0RFFK?=
 =?utf-8?B?MkRTZ3NBU0M5N3V4MnRCL0I5bkM2dElsQ1dPckdPb0ROcyttbjEva3lhcmpF?=
 =?utf-8?B?U3U4ek81c21hQVo0bUtEdnFtS0VJS0QzazdEQVY4eGdCeExwZndBTHJKNFNv?=
 =?utf-8?Q?Fi6zi/Xat82ijlUcjHbcSSCWMVW4TU7q4t7l5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c670861-dad3-4d4b-2fa2-08def3f767c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 20:15:05.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huFe5JmPk8eRcjcs4GaHkHg+vwE1MmyNq5smbG+BhdCAwR2mv17iP6m0ZudvCP740wglgiNA90kp/J+BpIFTyAxEuZFkfuHTJw4CFl+sAai07NqvJ6THF+mvhFbvz32h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348

From: Frank Li <Frank.Li@nxp.com>


On Fri, 31 Jul 2026 18:21:42 +0800, Joy Zou wrote:
> The regulator_init_complete_work fires ~30s after boot to disable
> unused regulators via I2C. When this work races with PM suspend, the
> I2C adapter may already be suspended, causing a -ESHUTDOWN warning
> dump.
>
> This series addresses the race and adds proper suspend power
> management for unused LDO regulators.
>
> [...]

Applied to imx/dt64-indend, thanks!

[3/3] arm64: dts: imx8mq-evk: add regulator-off-in-suspend for VGEN1/VGEN6
      commit: 806ce18b1a6d8c514b174439e7ad462ca88f55d8

Best regards,
--
Frank Li <Frank.Li@nxp.com>
