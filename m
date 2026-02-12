Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25872F3609
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913229; cv=fail; b=Ga1nFn1JgTuwOi7XsNjhLPR1UFhzrQotEv4gCgY9UGPNgjIol+WHrjMiszfTnJIeCHRx/9dQ+Nnh1ZDtx9cVHlRUM4BtNRqfmsBox17beRvXaklULXY0BDItxjlbK3vEMeA32++Abbi65KSFRxUyx+UCmMYE3QmiSrnWRzrEPYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913229; c=relaxed/simple;
	bh=s+fszz8GYI/wi05SOZi8BeyIQpnwivsb35gb3XEozYk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ay3hpaM3K1eft+DhBSP1+rEJ3xAlAF2Ielemg/FpauO0NjtglsURaYqM9SzYcSeFctQnjFnATVr+MozNvYPmz3ZmEnl5Jr9qiNwKRWsEuOYn0Zti+gzH5a1qkLBTdZBzS/pJ23JRlX2CcJaCGiufLoNjCQ4j3G3fIyVxjsxtoQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=feJgjzFC; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="feJgjzFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkNVhfcMAPqUNeL7HB35l5CpZFmQXbPp0rKbOcXJOhtDao6SEnXiOLjxtparz0nGtyQ/Ie/0M7fC1/Xbq7OlDv+paVG+ZOoA61OCKTg60fmoan3/8SP9xHVFo3bD9QCDLhqJECP2gebueqZBRgTGpu73tpFqJLNfyol6E5xb0HL6XGpyShQj41uUtuBkT+XMghfhGpmQKvSQ4SzKBQw6MAhStwfV7oxbj1AiHGZvIfoc1PyZiuHBSNXOlATbFzoz3Qcc7+O2p8CshkAqWT+7KnRZjOqs9jMilGxRmqbfbMzPMK42jA6sx07T4TPa8NWCb0MhTj0KnXfCaUmm+NDevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyKQtk1PhmiKRN5go2I9S1bv4dHKrKODNvNazlG+Cks=;
 b=u0r3W8Uqvxg3ACOszDZEAubjd3R7Fjf5ebEiM9BS84EYaGqAFlGzj+SCMpl7OY3mBgpgXQtLkYXTH5aM//20YipWBeF/HVewUWoKBJ7D4OWHw/cKBY/AionSSqBt+N984YYwSt3rMYCpRRMelsgXlPD9S0nTf1kXnhSxhJyQf+D2SM6qwRyRX52Vqbi7C4GHhoKpTcSUrxRrL1JNUNdrwCoaAAZTcug5mJy9bCxguI3PtNPLym7YImcxlEhjJ2gPSrsfFMXPl4ovKCXA94Kbz6JcKk6GE0Ee6bsts8kOTrvZnT+U/oST0P1NaEmmY77rQs8iVZ4JpIde9ZcF5iJWEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyKQtk1PhmiKRN5go2I9S1bv4dHKrKODNvNazlG+Cks=;
 b=feJgjzFCta+lmKHcwpAzSPzXIEcRW8YDwpd/8MV7Ca83aaYoh/A//pEii+J1wOprLcuPkhpgFT4huGS8d1k3V/pne4owfjffttrqWaw16S+I39lsW7dZpCnm2+W/tgQOdUsMANqmFPtZvDITU0j9Ev2Df5s6lnkSpZGvEk9uyPELIAJs8c+8isuA8cVvWHpxl2/cX+BpGeY1AWm/+u9fPefcoY1A7VqINMh1P/jiCbgSAX4OyYOJGsh2htXe7tcApL1Nls/nLe819AjMFCguxh0g/I0q+4pc8WcpF0D/L4sW0LgjSvXLtluOtu2uTCyc43fogBWsu32ycVc4bbJOCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:46 -0500
Subject: [PATCH 4/8] ARM: dts: imx23/28: add "led-" prefix to LED subnodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-4-696bcf1a992a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=7848;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=s+fszz8GYI/wi05SOZi8BeyIQpnwivsb35gb3XEozYk=;
 b=M72+xWfLYi2Z95Oy6yAAGoxF+M8A4r5XbA9jMoDE9KtSss2gqNazqwzQ4OzWfW7dPb1rvBDhv
 LhqZ7s50Tr1BpBJ7bduM8CQHW6n7dLxH+BgFpDm5uMDplcZ9tW65Ncp
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
X-MS-Office365-Filtering-Correlation-Id: c564f8bd-dc0b-411a-2e30-08de6a529af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTNPZUVJQ3pXM0NEeGkxL3lVVW94RXg2RmFyc1Z2MkszblJtMHcrd0c2S1ZV?=
 =?utf-8?B?MUFLVlF0OUIvY3o3UUxIbHI3NVJXelovT1RlMVRXcnpyM1VGU0NJWi9OMHBO?=
 =?utf-8?B?UHRkY1FFMkRLWU43cCsvY1UxVC8zR3h6cFhGNGZ5YmVVRTY1SUFnRStVczFi?=
 =?utf-8?B?TjhXSlR2bjQwSVN1aUIvdmRDUHp5cThJMThtWFRkT0lRdFFwQXVTcERYNEdt?=
 =?utf-8?B?eWl1cjV5UTFqQVJrTmlxWDNYeDgzVnE5NXJLcUFSVWNLKzJpOGlhWEZYUHAx?=
 =?utf-8?B?WGNBOWhYRGg5dDNHVXdtSENXVmpMb2xGdXJUYjBWaERyek9CK1N0WmFCQTlS?=
 =?utf-8?B?RHZBRlBCbjdFVGdVaUpEZGRpY05tVDE3dnhac0JwajhGK0RlUzV5ay9lbDVI?=
 =?utf-8?B?VDM3dEdIRG4rYjdwUXNHTUovZ0lTQUlMMHAwTlRoclN6T1o5MzZiWlRzZW5R?=
 =?utf-8?B?QTRsZDRTdDZBWElDcHVXYzk1MTN2cmwxSlFyVEtEZ1o0cnlYR2lwbkZGenNK?=
 =?utf-8?B?RzJqTWdSdFU3cVBaUk9EQzFTQi8zNEZMb1N3U2MxV2krdU02ZXJyVVVzRzRM?=
 =?utf-8?B?ZnlLdWhOQXJveEhOS2dUWjBkRkJNczNEUVQ2WGFpWDBlL1RVdWZXbmZGNG5r?=
 =?utf-8?B?K0RHK1plckR5bnhraHZnYkdoNG1RczBoRnJUejRXUXRSdC90UHczbGdudnpn?=
 =?utf-8?B?YkpwZStQNzNvSjZwUFk4SDVPdjMrVUYwYWxwNXFqMTNqMThUSjduTHo0MUFQ?=
 =?utf-8?B?d1AySFA4bm0wWEY1YmliMGszQVdVamRnV2ROY243SDI2WU9MS3U0amxMTUNx?=
 =?utf-8?B?a1NFLzIzSDlsMkNNQXpQbk83UE1vNkRTSkJjQjRkUG9pN2JaRHEwWXNTdDYz?=
 =?utf-8?B?VUVhZmNlYkJSRytwS2V4ZDR2cm1GUS9PcUZiZW9yUHMzMTlJclUzV1ZqNElD?=
 =?utf-8?B?eUtaeUR6THJva1ZqS1lFaGdNQ0tvbVZDMzFkcFpKWjBSQ3AramNrY2JHUngr?=
 =?utf-8?B?dFVnUWxySXZVbE9McUcrbWJvNERJRTdvUXg0eHlFMUQ3VDRyQ09IVEhQSXR4?=
 =?utf-8?B?NTRYbEFZaGZRN2RmKy9Bem14NlVudG9oQm5DOFpCZ3JPLzlmbVpWSGVWY0Q0?=
 =?utf-8?B?bGVWVTJMbWRHU1M5eXc1N01rNmx6TUg2TWVoaW1BR1Q3MUNJaUNxTzhUWmw5?=
 =?utf-8?B?YWh3WkgzeitmL2IwZklNMWhPN3hxMFYzRXJia3lTSWxpN3RrZTlaY3RXQVZn?=
 =?utf-8?B?MVNzZ0gxangrZ3R4ZzBzb0x2QmV4S1paeXZlTTh2Y0Q5Q3UrVHpIWVF6SjRW?=
 =?utf-8?B?SG53TlRIMGoydDVyWXQva3JQMmI3azVwdHl3bkgzamlEckFyTHU3VG5vRGJK?=
 =?utf-8?B?MGJzRWFhaXYzN3YwMGY4OTRGS3pUSHJGTGhRUzB6UmJlY0EwSkRsUE1reTJD?=
 =?utf-8?B?dDVZUFd3Vnh0NmFOU3F6VTl2TFc0KzVNbTF4RFo3REZsQ05hdzVFOHRhQWlk?=
 =?utf-8?B?VU92ek41aWtITDVEb081MXl1c1VycnBCeG1HWloxQzEwUmRaTlRSUjBKWFpF?=
 =?utf-8?B?Wldyd2pvZG9tZmxZbU8ySGdUREJLaVBiTnNzQ2MwRDl0dW9VZTFHaWxGSGd5?=
 =?utf-8?B?TVVnZzZqMnZUNTlCazhaWVBiMmZPdlFzbWo1SHJsL0VnL3lQU2NvRjBsVVlS?=
 =?utf-8?B?RHNEaVZ1TjN2aStmN3g1SmVaaU5sd2laMU1JbzUrZTFoSEltbUJaVStXbWE5?=
 =?utf-8?B?OUxhUWt0dXh3S2RQNytGRWQyZjY4ZUhxNE83c2l0bWNCU2dBYkNCWENuMHQ4?=
 =?utf-8?B?WTg4L1pwUE9SUHNIY0NJWWNnMnNadGg3bFdEc2xkZWRtMTFTM2lVdlFRb1px?=
 =?utf-8?B?K2tZZ3g5RDMvNVY2Y1pxTjFXUnRPL2pWOTlDZHFaTzRobTRCTDhRMVhqQWM4?=
 =?utf-8?B?K2pucWJIN000VHIxdDQ0Y254TmsrMXFySVkvSWdLWE16TndERExtSjY0UHpi?=
 =?utf-8?B?UHBuYXRzL3JYMnZQV2VyRXFrZWo0SFpkdFVISjRmWGh2MUpzblA4WCt6SGJs?=
 =?utf-8?B?NXRwbWJHZS9TVEFlQ0lRcmJPZEplNVdZRVQ3cGROU29kSWZpT1d1RnE1Ukt3?=
 =?utf-8?B?Z3Zyb2s0M1lmVzlteTFGYjlMNGdtbTAwMTNzdXpackg1dzNJUG1CQ0xteitT?=
 =?utf-8?Q?wajTG4rVcI1+SChevSc9Za8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRHeVczeWVNaC9qSE56YXRXNlBTZVBLcGpoZVJsR0dZeC8rR0J2dHYzbjkx?=
 =?utf-8?B?MTlXUHpiajU2S093YXpwK3ZNYzlWRlFXdXlKOGozT3BGYXhSMTZoMWFPWE50?=
 =?utf-8?B?aEF5T0pDN1hBKzRKT3YxTW1KRGpQOUNhM0k5ZGRyN3cxNmcvcXRnU3Boc0xh?=
 =?utf-8?B?RlltQWVmcjVGd09JMFF6RUZQRHA0ZG1MVWh2Tmh1c3Y2TExNK3VMSmE1TUpE?=
 =?utf-8?B?QStqODN5VUhoRm1xR3VQL2d0NFRiT1VUN3lxcEtTN1dOUmlmTmtQSTBydE9l?=
 =?utf-8?B?bGN1SmVJN2ROZDR0UlRhVHZUcmtxa2NiNExUVWprbDJZZGxKRG5LYkc3b1J6?=
 =?utf-8?B?Tkw3RVhvcWtLdkNLWFJEMkt5cENWZytJWU5mYjdaMnp4VjE2Z01nc2x1Sjcz?=
 =?utf-8?B?QzlmMHRmM1hLWUFVZEpNcE1BVCttbzhWMkt5NEZtYTUvNmJ6QlBhVTRCNUlG?=
 =?utf-8?B?YWZZUXp3MUEzZEVPTjNxY1Q1VlZRMkxVd0pPeHFxd3FpcDA3RzMzRmFxcGpw?=
 =?utf-8?B?SkgrUHVzek5peXAyYzRwdyt6T2NqVXNHNWdaT0M2TWVORGF6Z3d4RTNXNGtz?=
 =?utf-8?B?b21MWDFSTGhDNW9oYkd2bGdOMjB2d2RVZTVEL2pINTBvdHVEd1ZuTWxtNTE1?=
 =?utf-8?B?RDRocjdScmhMaVRqd0tqVHdZU1BucUVGWFk0UmhNc2xkSWUwR2g3Y2xIODA0?=
 =?utf-8?B?QUtwZUpFUGtUa1VPSUtCejZ5eVIxc3VRaVNrZUphSjVkMmYwa2FCQmloYWlj?=
 =?utf-8?B?UUhNNzhuMUFlaTluWVFCd3MrM3N5ODVob0pIaGFTTHpTWlN6RnpUNkV6ZE1Y?=
 =?utf-8?B?dWN1ZHRYUDlVNTgrQ200Wk1uSWJEd0ptNWcyNndLVVpRS0JUZk1SVmJmS1VI?=
 =?utf-8?B?R2NqbnErT0VWdHpxVHY4Zi9kamNFZnJUUjhJMmsyQjRvNGhwcXpIN01KdTZv?=
 =?utf-8?B?SHA2dElvNTNiYzZYdnJoZGNrdE1pQTF0dC8rV0RrTERzYnVxYWJ2VUxKS0lK?=
 =?utf-8?B?UTdReUwyNUJDQ0xhc0Rjby90VHRVSnRkU1lFemlzbEllek0xVzdUZk5kNklQ?=
 =?utf-8?B?QnN6bXM5TDNOakRyRytUVUl3c3Yxc2QzSDJONEQ4S1MyQ1cxcUIwRUhFVHYr?=
 =?utf-8?B?MW0zaWxkR1RqSysyVlZhNGZqNHZtSXJ5RC9MeUZqS3A4TkNQYkk1THNnQ2Uz?=
 =?utf-8?B?OFhOSTcvVERYKy9DWXNldDRKRVhTbmtOemNISnArZ2JCMmVmRzhOZnhzYTZo?=
 =?utf-8?B?aGZXSWFRMzRMcXpia25PclBsbDNOMGhNQzJjMHBOM0lDKzdYa2NlQi9xVkda?=
 =?utf-8?B?OUxLVUhTdDZLNFJEZXhvUzZGQW9QSXFoOXIyb2JYczRxYlZMc1dzOFZrVXV4?=
 =?utf-8?B?NWJYS0FjdEhHL1BtckU4cVpmMFluUVdTbjVsRDdxZnBsSjg5VkorWjhVd0xM?=
 =?utf-8?B?MHI0WklDQkdyd0swNW5vZHJEWDF4WW1MRy95bUJJNGFtbWJuQnl1eXpBUUZo?=
 =?utf-8?B?N3AwNkNSVjhjNmVEWjlJZnBGUlJ1MnJBU0h6Ky8rMmIrb1lQZ1JIMk5CRUpm?=
 =?utf-8?B?dzhaZVM5cmlvdGh3WnVydlJnV3FsMVZjY0htaUNwcjRXU3ZMUjJnK0hRUzRt?=
 =?utf-8?B?TkJnM3FTYTZTT3Fjcm94K2dBS0dBOGE2N1pkUVdkT04rZGNhbkJHWnAyazE0?=
 =?utf-8?B?Y2JNN3d1Yy90eStzSzBudGRMenhXS2xKb2dwT2xpRmZRT014N2RqYzFySy9R?=
 =?utf-8?B?VHNqQVgrMEFLbzBRa1grVVgwK1I0RVZWaDBYd1hUMnpOQUtuSGN0TjZieHp0?=
 =?utf-8?B?NXlOWkp6S0VOelIyMjRscmxmdzBRQTNRaCtLMGhkZ0N6M3F4QVBqSmxJVUJr?=
 =?utf-8?B?enRBWktOclJRYWZRejF3alNubkdzaERUSmtBcU9ROUp4dnFCb1R2d3RGa05t?=
 =?utf-8?B?VzI0SCtJYmprNVFHQUpERU9lMGdFb1hHenVGY0paTyt2VVFZNzJ2bEQ3WFN6?=
 =?utf-8?B?SndYWDV0SDFyaEdPckJHZ21iejMvWGJhN3dncXp1NTFNbXJwSXhaRyt3M2dn?=
 =?utf-8?B?c1A5QTNIV2dCeFBrbVd6NEVRRnk1R0FMaXBOOFh0OWhPVEJkbW5nK2pBc0Zy?=
 =?utf-8?B?Wmx2d1l2VmFLc3hYamxQaVI3YUNSOVVMY2JPeGtwby80MmgxdVBnZ0h3OGZs?=
 =?utf-8?B?NXRQRWhvdk5WbXhCMnNESG1mNUgxbkZZMDVlZWllY1ZUaU5CNzN5YVVQWCtt?=
 =?utf-8?B?U1krTVo1Sk95aTVteEpncDdPZEMzWmpaVDVPVGpranNmcTltc0owZU96YWY2?=
 =?utf-8?Q?zQ45h1ooL0aSdIYNvI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c564f8bd-dc0b-411a-2e30-08de6a529af2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:15.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzMGMbQVnvxxcg+Aic0+L9fXgkXDk4xJi2NTRwqhC4z4YP+V0ScpbTdSWLS50gIuq7b3vgsWQbOhvMves1M9vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

Add the "led-" prefix to LED subnodes to fix the below CHECK_DTBS warnings:

arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dtb: leds (gpio-leds): 'user' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts          | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts           | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts         | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts           | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts     | 4 ++--
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts | 6 +++---
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts         | 4 ++--
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts           | 4 ++--
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts                | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts             | 4 ++--
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts               | 2 +-
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
index e372e9327a475e6cb895053fd0c7e3e420d51d94..38be7dfabcc09da1a3f54b48d4b4d931e6aca0cf 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
@@ -116,7 +116,7 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pin_gpio2_1>;
 
-		user {
+		led-user {
 			label = "green";
 			gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
index 6c87266eb13530685e3ffc23db6b8b294d3ca106..63bbaa15c54d94d4c5bad97a44386dee1cd9c231 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
@@ -29,7 +29,7 @@ reg_can0_vcc: regulator-1 {
 	leds {
 		compatible = "gpio-leds";
 
-		user {
+		led-user {
 			label = "Heartbeat";
 			gpios = <&gpio0 21 0>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts
index 0d845ca81e8996edf4b07a798dac16fcce19215b..774eb49cfbc0f1426c6bde2a724db78000f1447e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts
@@ -31,7 +31,7 @@ sound {
 	leds {
 		compatible = "gpio-leds";
 
-		user {
+		led-user {
 			label = "Heartbeat";
 			gpios = <&gpio3 28 0>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
index f170df37b3f887d931c3b59562e698c1fccdc226..f4485334e9f8352ee6d78a0d50bf894d707557f4 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
@@ -21,7 +21,7 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pins_cfa10036>;
 
-		power {
+		led-power {
 			gpios = <&gpio3 4 1>;
 			default-state = "on";
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts
index b73020ff1053d4511296a8c4c739a1ad384fff6f..5e3f09109605a439db57709c6c39d28071a043a9 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts
@@ -12,12 +12,12 @@ / {
 	compatible = "i2se,duckbill-2-485", "i2se,duckbill-2", "fsl,imx28";
 
 	leds {
-		rs485-red {
+		led-rs485-red {
 			label = "duckbill:red:rs485";
 			gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
 		};
 
-		rs485-green {
+		led-rs485-green {
 			label = "duckbill:green:rs485";
 			gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts
index 473d99b9b42f539eb717c839b3b97a254a117f9b..2168a59a33b34d4f5031dcbbf38eb96c167a8d9d 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts
@@ -13,17 +13,17 @@ / {
 	compatible = "i2se,duckbill-2-enocean", "i2se,duckbill-2", "fsl,imx28";
 
 	leds {
-		enocean-blue {
+		led-enocean-blue {
 			label = "duckbill:blue:enocean";
 			gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
 		};
 
-		enocean-red {
+		led-enocean-red {
 			label = "duckbill:red:enocean";
 			gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
 		};
 
-		enocean-green {
+		led-enocean-green {
 			label = "duckbill:green:enocean";
 			gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts
index 4e28212e9626067ef2bec2d00f3e9afbb9745c61..9bc703e7b2bc4cae9f9234452735fd7aa20fea6d 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts
@@ -31,13 +31,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pins>;
 
-		status-red {
+		led-status-red {
 			label = "duckbill:red:status";
 			gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "default-on";
 		};
 
-		status-green {
+		led-status-green {
 			label = "duckbill:green:status";
 			gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts
index 13ffd533fdea780c98da27e5de80a73a3ee7c321..d5a1983f92890cc20930eb41516853f34f4e5be0 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts
@@ -30,13 +30,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pins>;
 
-		status-red {
+		led-status-red {
 			label = "duckbill:red:status";
 			gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "default-on";
 		};
 
-		status-green {
+		led-status-green {
 			label = "duckbill:green:status";
 			gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts b/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
index 330d3aff6b6c26e75d06376884b66c5ae5e14f89..d1ff001b4037920fe36784bd5ce062686a780637 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
@@ -108,7 +108,7 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pin_gpio3_5>;
 
-		user {
+		led-user {
 			label = "Heartbeat";
 			gpios = <&gpio3 5 0>;
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
index 24bacc9ba10bf42671426d37d35c25055261e27c..9dc970ce7dd0546252fdb1e1e4ef66a2672abc87 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
@@ -27,13 +27,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_pins_gpio>;
 
-		user1 {
+		led-user1 {
 			label = "sd0-led";
 			gpios = <&gpio2 26 0>;
 			linux,default-trigger = "mmc0";
 		};
 
-		user2 {
+		led-user2 {
 			label = "sd1-led";
 			gpios = <&gpio2 24 0>;
 			linux,default-trigger = "mmc2";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index 07c098ea2e154ebc9ef9c792f6b9351e1a74e67f..ff2cd1db5fe5f5618ed0f260cfcff6b05de26521 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -122,7 +122,7 @@ sound {
 	leds {
 		compatible = "gpio-leds";
 
-		user_led: user {
+		user_led: led-user {
 			label = "Heartbeat";
 			gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";

-- 
2.43.0

