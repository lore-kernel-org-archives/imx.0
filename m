Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542F2D9792
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040505; cv=fail; b=RA5qYSaO9T1MWDEvH8lhDuk7/AFP6XARHlVP89ehBV8w1nOAQf/jfZngpx3JU384i9eXCLmmC4zvgQg5dKwZ/D6WQvmVsKykjN8RE4NbrCGUZp2WW4riNX09cdfr7rzeVUkLvxFODYkwdJoNKm1UkLlNxSRMmTv6rOwI5uRzwl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040505; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AJX40gabVRc2zB0+WGCuP4XgYgyxa7Sxzh7gDBPDIjP0q28bX2HMmhqS01zBI8a7LBPTQY2nNVcIB/Md1Ng5VIud3sYGxMxbWFmkbEdD3mn21t3dLKguwXXcAPjrTo19L5+xPAN1wDTMBEOVVUMiXNPWojJL2yY8jKKOytrnIkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dRCurTAN; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dRCurTAN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We4UxWxJe4wQHJMHGaQYl6uLV82ldddfqeiVWWg/78YlaTpFPW4vM7u+By1InSZ7/RacI54YwyknIXqA0hkpwovjqpfVDaOhBIAOlMxT9hO5BFNG8Hg1Yoc2XhGbQyNi57elViBxRr7iCvrCqjO3rMCFY2OEI8R+OPWy9VZTHNnKyx9UrsYtMeZ2BtPFEnX0RxC/0kksL2d1Aa/Y1imlzSshNc1kzATjprlzXUawclF5oi6nU/I+d+tnorjUsiBtPPwkD3KwuPdGRIccWdnXpi5OVuT7fzcmF1R19sWLnZz+GBbWCHJHLshPJkuzuCee2yc2+XNgXe6Us4CJkt13Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=aCbjHHZBBpmjvyTSaYRPzixJkCTm9bG2QcTDkIQ7mcJTqgB76hGwL+DZ1KaiSsryfcYmluLxHTFZIH8h2mY2BP6gu+3RmLaI5YAKYmzWJTR3aQc/uvYKwDKx2SWo6cZX0dPH+a1/94SZS99rzvj3QXXiQIkAFnUfvamH/KzvzlhJgj3Or9g3PDtQwEQ96o1+vbn5bPIg3EjZFNL2WMXxRxWPRLCB5NiGlSCs7js7G/1rPn63oYG1z1fpsssSr/2G1RI0imgSfpMu8kEsgWUdfT1M1p98kAk1+tfUxbeQwzrN/kBshtvPysLg+Z8IaH+4PYCXpUbLrB/IQODF0h6R4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=dRCurTAN21/4Oo3bHa8LXdsT7+2xliliTAEkAkwQ8Jod9pOgnHlq/hpXQtqMeDq0rzZgvKC0FqB25f1JRkwHmvfvP3Q7EIU7KC0mnJHIH44xxoP7tLzaiP99B+z3uFtRdlg5hSv23BHYgIItksizzqEOGpahRxKDNe7r09Wocpv5zRGTwPBPzpuBVqv9sfh+FdOYADl/atUAFW7LR8wBf1DyRVU34eQgQXSH8Z/82HaptcY2Pn5Im+nX2QM9qPvxDR07sljJoWY/t9vzKAw142AjdeaMkiTnB3Os2g0q+c6EwHwAVpWH0DY/VgeqzQyY1eSujm3F5RiWKIDFe7tNJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:48:17 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:48:17 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 18 Dec 2025 12:16:30 +0530
Subject: [PATCH v22 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx-se-if-v22-7-07418c872509@nxp.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766040412; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=04qY6L7onOJQE3OPNFXxoZ1x/uD6U4U+5D6USMk9MM6wsQs854iCoON1k7CJD1Uqi5OL0cjEv
 tBBNJ2H1bC9BuyVzj4em6duqqwWADZATO8beMRyw5+LLC+B4FjzMnWO
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8599.eurprd04.prod.outlook.com
 (2603:10a6:10:2da::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: dea7a860-fd01-4c87-76dd-08de3e016cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3ZETlAzK0daQnVraENoUDBBWkNXZE9VWk5tV2xQMStlOURhQUJIRDZScmtB?=
 =?utf-8?B?UGFjRU9KemJNelpKL1ZVQUJoenIyMnRIbW9sU094N0p4YTM3Zk8yRVFYZENa?=
 =?utf-8?B?dmJqMjMwZkN3UldHZjNBc3ZINGNNNjRuN1dwUkZxN0g3WVVwY1lQZHpVajdX?=
 =?utf-8?B?cTVVVk91T2drSlY1SVlMM1EzSzNQWjZBWitwc2ZTL3FXblFydGplbnhxMmJI?=
 =?utf-8?B?cUdVV2RkUGJybFA2ek9PSHpzalA2dVZQdVd0c1pMWG84Ym5ZeXk0ekMrdVdG?=
 =?utf-8?B?RStRL3dvVWthSlBIWVVwdDMySW9ySU1uQzAwcUE1RmRjL3MvVDdKWXlodXh3?=
 =?utf-8?B?WmlLSnZwS0tnVWNiajlsajR1aFNUa2U4QlF2RTZRZmV0L2h0OHU5QmU3TEpM?=
 =?utf-8?B?S0RObGY0Y3lnNEJKN2R0UzREb1MvQ01jVXMxblQyc2QxQkg2TXh5UFA5d3Fv?=
 =?utf-8?B?M0pKbDc5NXJjcGdpalBNSllOcTFNaVA0dWtTT1N0NkdUbnc4elRtS05vTnli?=
 =?utf-8?B?eDZGcjZJRVlDellsVnBzWGtId3NtdE50WEM0Q01ra1BXVjVFT0pGamdINWJS?=
 =?utf-8?B?WGt6cnZwa3lwTVNWbWpJaGtKUFhKRHFIVWVvWHpBbndYeXhRT25XQ0p4RUdr?=
 =?utf-8?B?c21HKzFrUW05YXk3bGs4ZXA3d2x0ZUNtUFhnRHVHSEdVU21HSGZGVHNKQ3Z5?=
 =?utf-8?B?NmFtTWlaWXhaeGo5VkhUQW1MSGNHVFU3TEVkZXlxbm56T3FobFB3TzlIQUow?=
 =?utf-8?B?OFlidTVPQ3k2c2t6VzY0NmsrSS8wMzJmY0NYZGZ0U09mZm1LUy9kMXFHcUd5?=
 =?utf-8?B?b1BKOXhsVXdlcEZRQWpsTURTK3FlbU1ZR3hKRlJISGxFWGZhRk82NWRhbjBh?=
 =?utf-8?B?NVJDYVdlQ3Q2MmFQTXVPZmlpVTV4TmlERGI3SEdzNVNabUt4dC9MaXhlekYw?=
 =?utf-8?B?ajdCcDB6WlJ4WFJsWDd1QXp2eWJLc0F4aDRlVzM2UUwzajQxd1hRYWtBQ2h0?=
 =?utf-8?B?RGFkeHJVVkFYekhTOFRIZjJLcVFWbzlETEtxSm5HSXZuSm5PelMrTFVjbjM2?=
 =?utf-8?B?ZXR4bk5Qa2t1c3NpclIxL0hQUnEwVTBWRTlUVkdpSEtmdkwvbGVFeGNoM0NX?=
 =?utf-8?B?TnJNUHAxL0pxamw2UjVndVdwci9TY2RJMHlYK3FyeDYzL1R5VlU5UEhrOGN2?=
 =?utf-8?B?WGZ3VzhDREwrd0xGVkNGNXZVTGgxMWMyUG9ob2NSSjBsR1pZaXYyR0JUQkFT?=
 =?utf-8?B?Q2hIK1krOUxlbnJRUS9jdndxTS9lTmlzNCtQcnd6RFI0bS9VVnZBbVRlbnBP?=
 =?utf-8?B?dmZ5c0hpdGFWSjI3eXh6RWxkcUZjR2F1elhZZVBrY0RnRWJuNC92eG5GNkhs?=
 =?utf-8?B?QlZhRHZaYXdSQ1VIVHcwNHlGVXVpSUFENkdicy94RjFKVkZYWDlUMlRyRmdy?=
 =?utf-8?B?eHVia1VnamdOeWhJQS9KYWxmbUdCUjRDRWRCN1hKMG1ybVY5S2hDQU55djZE?=
 =?utf-8?B?OXpkYXdyMk9QaHdKVmpLcGlFNTU5d3JFbHo4aHh2RlZWTXZsZkxLZW9Mb2Jk?=
 =?utf-8?B?cmNkMldST2lZWmFIOXJQTEhkRlo3NkRodzBuMFFWK0JlR1ZpZk5yRjgxeDd1?=
 =?utf-8?B?MGtwcnlZRUF5TmdzTDMzeHRTUDN3clkrLzFKQ3BqU0lBN0xnOEhPcE9iRGFa?=
 =?utf-8?B?WnU3R2gzYkZ4MUhtRHNuVnpxVGJWRnRjUjByVExURFRveTZWb1JENi83N1VJ?=
 =?utf-8?B?QlM0REl6MlpBM0Fqc0VVbTBVLzREYXEzOWJFZExBV1JUb2dqVlFzcGRCK01z?=
 =?utf-8?B?MFNHa1k2cktUVWhzRDBSb0txQzZKS3JzZllmcnFoMUw3OWZCcGozMzR4b1Np?=
 =?utf-8?B?bGg1M0kveldRRVRmMjlIR3ZzQkYyZGlwVm54akFnRVJ4THVyQXpSQ0ZRaGIx?=
 =?utf-8?B?ZFUrb2o4YU1JZ1plUTJyRjZacFFqUUFCa2FublZ6MHNPcExKaTNKQitPUTNv?=
 =?utf-8?B?TTRrbDB6S0p1cjFYWGQzQVUrWHJpSlBwVEZ0SS82dExrelZVY1pseC83NmY2?=
 =?utf-8?Q?xxYJFX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTJaZkk4cDBYU3ozVFpyNVhrRCthVHZUQ2M4TmNpUlVlYTdkVWg0Z1F5a0Z1?=
 =?utf-8?B?MWFwZ3ZQU2FQdk41dmZuY1JWWHZENUVmenpqMXFwc0JQL0s0NTNOZHlkeGhD?=
 =?utf-8?B?YlFEaTFMOE11bFkvZVNxWUNHZjVvbjJORXkzYW9NU0FlMmNKM2dOa2JSbHZq?=
 =?utf-8?B?b1RTM2NSMUtnZHN6RDlBSjA3Z0ppVzJBc050SWt2VGdVODZONnVaazBpTHpI?=
 =?utf-8?B?d0xHeE4vRG9PY0dRVG1BOGFzdHQ1ZEl1NFg2azl1akhnTVhPNW5RMFpHbURu?=
 =?utf-8?B?aUtiYWptVUFVMCtoUHhiMWhBVkdaLzZDdjd0T3RhUnJWMUYzOHNkK0dKbnMz?=
 =?utf-8?B?dUE1YkIyU1pITWlhTExtZVl5dVFzbnBCUjY5Q3VTdWtQSDhiOVA3NEplMTBW?=
 =?utf-8?B?MHU1eXZQQ3I2U0V1Z3hJMWVta2lPcU5PMjQ5Uk5iNWtDbVFOZGdKRDk2eHJQ?=
 =?utf-8?B?L2JhbStSNHdjK253RGY4ZnFWckx1VnFSTFdMTUlscE00bEJPWWlXbHpDeEJC?=
 =?utf-8?B?R2tBTmNPYWxxN1B3cm9hZjloU1FSWGdEUjd3clVzbGtTSm54bkhtSnVIQkJV?=
 =?utf-8?B?eFVzUHlJdlZBRlBaY3I4Tks3Q3UxRWRVZEp5UUMvRjJGMnpUd1JzRmpnMGw5?=
 =?utf-8?B?eUFnaXQwQnNhV3FEczZvV2NXbnd2L2lCSGdvOWVQMDYxTXhEMDFFL2hOeHJ4?=
 =?utf-8?B?cEJmWFBqRkFqaDFTQXlkc291SGl3YUxTQm4xQWRlcG0ycjBaVzN3Z0RicWFx?=
 =?utf-8?B?VG1ZaEIwcUZFV2ZzRmlaa2xuWElXcEh6S2VNQVo2SGh1eW5Ta2dtT0lUaG1R?=
 =?utf-8?B?MlBURXE0Q2xQd1hZNGpiTUQ0dnVEQktnMHQzd0c3Szl3VU5KQkF5bnIvaGtz?=
 =?utf-8?B?WGozV1B3QmJ2NXlzWXJmYkJYell6aGFJOWQ3cUszcDBELzNabEFxemo2Rkc0?=
 =?utf-8?B?d2xCeFQ1YUsyRUwxMnJxMTVjL3ppR3hIaU1xT00vWVhRYUlDeXAzRWtBdjR3?=
 =?utf-8?B?ZkFCWWJzUW10czU1R2kyMG1WUThYMkFXZWF4aTk0UC9rNm1XdDU3cjgyT2Rl?=
 =?utf-8?B?T1BFVlJ4bWhwN1Z2bEI0ZmRINnNVUjI2bXlOT2k0a2laUStjVzZZeUtWVzNC?=
 =?utf-8?B?TllBSkJBQitYTjkxdE9wZTRRdUxBaU0zL2pKT0RuRlZqQWZLQVlsUXF1b2tz?=
 =?utf-8?B?bXNrVEhEZTJ1a2hLOHpzSDc2c1llZytTU0RFMkMwMzVPem5wc05qdUttS2hH?=
 =?utf-8?B?RFVYR3hSMXZ2cjNpckdWSTQ2VWU3NVpScHRiNlNqRlRQcHVPSTYydW01T1F5?=
 =?utf-8?B?N2ZtSEtZa2w3NU8vWUEyZHlMTWhaOE0rb05XSU8vOEpiR0RCbmZYTm42Y3Va?=
 =?utf-8?B?Wm84OEVibWFxWlhHa2V4MnRDUWh3RW11N0tsb1l6bm1ZemsxS0VrT3M3amx4?=
 =?utf-8?B?dTdnblNmV3k4KzYvNWJHWTY0SyszakVKbkRWaGpvUU9XNnNobU5YM2RlK2h3?=
 =?utf-8?B?aGtueXJTaUlvTVN0a2ZvR0w1MU1VZlpBK3h0cE9HTHBvQnNlVUgwSFFmc2Ux?=
 =?utf-8?B?dzZVOVI5UnFGK3Frd0I1V3BzTEtKbEt0TXQrdmZpK2FTRWdmMklXS3lvZml2?=
 =?utf-8?B?c0dHSmFvTjhKMExKZFUrSmlNYkZSWWpxOTdiRDRNVVI5S3hDbXAvNDlxZDhP?=
 =?utf-8?B?cWVaYVBpL1lDeFBiZXNLNG5lOFlsZFdTck5LcUU0cFFoZ3FYV0FMd04yOVo0?=
 =?utf-8?B?eDVMTlA4QnBlbUZFUnVKVWJYSGJHTWh0b2pNaTFTa1pCeTFFT1pvVnFNZXZP?=
 =?utf-8?B?dDJENkpkQmkzdDlHOTZPaElIeXJ5b2tNa0crdFZ4ZjBCeVY3eTZobGhhb3Rr?=
 =?utf-8?B?QnFlbTlVSFcyaEtxNTBMbkZjT1RqTENmY3dCM0NZVng1ck5lQ0diOHhVckhM?=
 =?utf-8?B?R2gwS25GUEl1aTNhMXNaMk9sSHFRMGlVZHZjK3BseCt5NGhsNFBpRnVSd216?=
 =?utf-8?B?R0xPL04ySWtlaG02cmxFNjk2V1FWZkhBVmVaSXhaOG1OdzVtenlLRVU1UFEr?=
 =?utf-8?B?UGh1ZkJtdWxRdVNrazg0a0RIQXlwTFRlYW5WekducVBuaWlGMmhVOHY4a25K?=
 =?utf-8?Q?Aq81Z8fBI5BoERZcQ+AeMM0Bd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea7a860-fd01-4c87-76dd-08de3e016cf3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:48:17.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lAszT1nEsDkR4cOWqe7rH72En2jVoWkh/UW6gTqzuxsDUebDndjWCCP5DGInQgg+dsH0GypAlVdWLkKGFLHUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

