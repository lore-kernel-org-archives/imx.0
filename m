Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023106.outbound.protection.outlook.com [40.107.159.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED66341049
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958993; cv=fail; b=a1AhYAJp4/Yms0Y2Fn5n/ydQr+4QUyFhowTN6kZXWDnVth/V4Qh9HjpLcNbBEBTksz1auOS1KqkTaKtcFgmBoMtlmPFWRugKIAy5NteUvk0bT8hgmG680qhPn/7/J6w2JVZVdGwzpPkWPTDOGK4nexr6Z8+vFmQmAUeDSzfZYT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958993; c=relaxed/simple;
	bh=rSEIZBLy53bgJePsdgxChfVS69XNVba95lJM72pSXg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qqjKxndombNRvOM5w/QVg5XjiPMLn2vYyfD7Otbs5E97NhF9zkE3OXtZdMnlHz3R+vafCskf4ejwWLTIxyq11wEtVBS/XG3sdfHEIFQDsmeVMCCSq8efxOl+kDkVzeKxbWN5pAkWN6txOH2w1KXK+wIfDqNNSoVQcTJFuhLXGMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=QvRlOWSY; arc=fail smtp.client-ip=40.107.159.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="QvRlOWSY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxcTC0KJofejA9b+H4xFBoOXRzKzRhtYS7zKA3tG3UrA1P4UF6+aIL747/NYrVOQfXY9CZaGe2NC058rNnDpHtqpX5jMRGlSRBYnQ/jJGVeul6FxaM3vYL7nPmMe5IVqZFJiwfjSZ1V5DzLmdlajvgs66X1lADCCPCSG/y4AfxvO1v7NyhbY9N782gc9J3GkPcqKLtF9PisSCyyn2cY+cB/YPwSsb2kpjQNcGQoebPl7Wouss02/c+A6Cn1+qUHxnxy+h3c0OT0mQhesa4acqnwCo0WO0bmmo7N9HfteEWL5r7dMkB2RT71BIM/ea4pGKfHHco7LCq4IFRN092Ql6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARL/SP3fo3lBHn242AboyITGOaAOXFiLEL8L9R8QUck=;
 b=mNfB9PTuZljoTCDePb5xsNLogw3Q/kq1b++c2qDyKBfVGRuBXfoqZ15xpUDEyVbDeiH7U0AwVvT8tIeNA5k/e2yMqM0ln2Sz64eWpleKFl+vE5H1B9g95lqwg8ovLFneU3KazpM7Kbr5O3Q2QnjmXKIjLigUNoFHIO5isS4In23hIxXtZj8IjWxo96fj9ymArTRrc/xRJGfsO0XcuqGUPj7gNk5Rg49y0ckJjxz2h8vqHU4mYM1UQbamPXBgSqqb9wgAicP/E4DDZ8yMs88EivU1EoY1E0BxJoM3haOFsrNeDM5P/7YMQ+ry4aX1785E6SmwEeaamlwWAxVmE46qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARL/SP3fo3lBHn242AboyITGOaAOXFiLEL8L9R8QUck=;
 b=QvRlOWSYJ1p+sxVTwGzwXCjqC0HfA80dxkRM+0lE/YICgg4FWxm0QhVv2YZTpICs8rIjZVBznt97xpVYkuhoL0Iwdt5ylYYvcbLT6Tp4ViEo1xNO0TkbLZQS7xfuM7XH78x8BHXwlhGWFYQPiHXjBgsXB/2fwgp4+C/dUjQLc5x3kea7eO/7WldmIgD5SQDgYMdyN8GjBjBxZPjBlO+U6c4Sw2O2jQ6bsWnJWcsWw0zk0xQvLR4anDvB3Zp0GChEQFCzbgdagRIP8cQWHJ1PjxwGaLut/wEIjcfltW6eBDb/9cpvOxi76H5OTZgn60081TpoWr/sZJgcICJME96ikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:23:05 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:23:05 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller
Date: Fri,  5 Dec 2025 19:22:57 +0100
Message-ID: <20251205182258.50397-5-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>
References: <20251205182258.50397-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::15) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: a4353d29-8029-46be-c45b-08de342b5564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M25VREtlbjh2eUhERGd6VThpd2VjUU82dFZBcVpkeW9pL203T0R0M3BLemZt?=
 =?utf-8?B?R2NGQjdqeHpQdWpTRUMreHlSL3JBYTNKaDFLZjhyWjZ3NkNKNXlBell3ZjhW?=
 =?utf-8?B?Z1FhV0RyTnVBWWtMMldERlh4QldDbU4zRUJsUGw3cjZDNDBYeUZpOENZU0lw?=
 =?utf-8?B?eWgvOVBnN21SeVBxVzlQME9CTkhWVEpDQmpyZEVHbDkvNnh6QkFSd2d1L0p6?=
 =?utf-8?B?VTJCL1Q4RUtEQTczVy9UZFRZdUs0QVBwaDB2RHh5aFhZK3JtZ01SYnBKMytr?=
 =?utf-8?B?by8yb2g4dTZYT0pUQ0NMRVBGZmhCcTdEY3FTRnF3NmdMa0RyL1dCNmhqUkFO?=
 =?utf-8?B?VHdXSE5aUitlS1FUekxNam5ERWhnYTRzVGpJZWE3Zy9HQ3dEMm15YUJzL0Mv?=
 =?utf-8?B?OFltdTMrTkN2RGFPK0E2Vi9UZjZoL3Rqbm03UFZTdnE5cDRuNnBqL2pzNW5y?=
 =?utf-8?B?ajZwYjE0NFlWbUtWM1ExTFhKWForOVg2S0dFUVU2K2d3S1lJNWthQkcrMDZa?=
 =?utf-8?B?c0RIdlhPVUxHclEzNStsQnhvWGpEb0FNamhydlF0TkpNaGtVUCtOOE4vcURE?=
 =?utf-8?B?WmVqbWZkN1J1Q2JJbnpaYjloQmFjZnFhQW16MjlCeUhjWWtjVWlrSE5GWnJN?=
 =?utf-8?B?ZTd3b05CajRSWHRHWmtROTlTUm5qSWYyYldxdmt0WmJBNkkyRFJMM1c2WGVq?=
 =?utf-8?B?Q1MzcC9kMWo4b2pKaFlMYXdlaCtjTEVwdndhZUhGblNCMkF0NjFjNVUvd3hx?=
 =?utf-8?B?NkJIb0lKWmRWajE2OSt0aytDQ2dJcWVhQ1Jub0pEV2w5VFVJZ1dENVlCNm5o?=
 =?utf-8?B?aGQ4ajFhT0VNR2twTWJ1T25DaVR6T3BlZmZGNWEvMnBETlNhQ1lHTGpSVlor?=
 =?utf-8?B?YmlGMjNWdE9ZTEhPL1FzRytqWnBlWTY0Qm9zQ3ovbzRiaDBVYkVXZnN4U3F1?=
 =?utf-8?B?OW5ZblRyK0dhcUx6SzBtcmRqTlpXM24zQTRrSWdIZ3V2YkxJaWk5QnRqcFR3?=
 =?utf-8?B?VWJjV3luV3BJcDZRbktYRDk0Y0NCSVZNQzMzeFhsZWpWMHB0b3AyVE1ld1Jn?=
 =?utf-8?B?SFFLVEsxT2dkL3N3SDJwWTc0V29CUXRNOGt5dnAxWmtzRURncXB1U0ZQQ2Mw?=
 =?utf-8?B?bURLM0ZJMzRGRkVvWlZqZ05jTnJVbFJKQ2xWc0xmMVBKUXIvbk5NdVNxUkJT?=
 =?utf-8?B?dkNid3I1LzE1c3YxM05CazNKRVVNbFhsMG1mU0xpL3gyS1paRjQ3UEJ2YmFF?=
 =?utf-8?B?UHZjbTNtRlRncUVRVkg3VlFzWFUxT21vRkR6NGNBQU9uOHJMNndJZnlJMk9C?=
 =?utf-8?B?c1NVWkhaZjFJMklVZ3AvNzNDdlllUHp6bG1hVm1SRXY2OW9zSVdDaEVQd0tE?=
 =?utf-8?B?bWl6VjlWZ1ptRVpWZkdYZWZmQkE2RHdFRGhHQmZ6UWVONG5Zd0RCUXBZOHhV?=
 =?utf-8?B?UXJ3VWpnUGMxUGlCLzZZL3YwYmRYY1RMZUNlSTZOMHczOW1qK2pHcnJRR1NX?=
 =?utf-8?B?TStSMk1rbGdjdFZDRFRZdmE3ZXF1NFVuUDg2ZVZobWkxMFJ1NjhYZG9PUkdz?=
 =?utf-8?B?VytxWURsZVF2V2hrSG9JZFgxSHhJYU1hQmdQVEJsNzhLU1FwYTVDK1luUmF5?=
 =?utf-8?B?TTJyWXR5b25hRkplUWp6SzQ5bmJWclFvZldPS2p4QlJYLzBOMjdSenJ5YTJF?=
 =?utf-8?B?M2U4QkJmRG45eWZMQVlGRkVuT1RmQjh1eklzbGFtaFJFN21BbE1oQm9US0Nx?=
 =?utf-8?B?a1ZlSjlubTR5UDZvY3Z4aldia3dEQUc0cFpNVlhyZGxYVG1uOG1GWGZHZ1Bi?=
 =?utf-8?B?S21wejllOGVMdlpXbXBSeVR2NVR2Q1dXVm5DckJJQjE1MWprUzcwZ0xNUElI?=
 =?utf-8?B?Y2xTYzE0Q1VvNE8vdDdWUDB4bWZnb2dPY3MxVkFTOWtwbStOT3pyd2ZwdzQ3?=
 =?utf-8?Q?G0lbvqwHgBap1KAxmiuRHVikCyRzCmgP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkxnWmN3TG9XOURydFpyTjFGOTRMNzlPN2ZXK01HY1hmMUFDb2FyR2tBNXVF?=
 =?utf-8?B?SWRuSll5K3pPRlY4TER2ZjFJcVhBcVA4NDd5cUpyUVVxQytSMCtWTGxSM2hJ?=
 =?utf-8?B?aVpXZy9zNElpT21KMzhZMytnRlQyMytvVkxwZjBvalJpZi9XejdpVnc0dWRB?=
 =?utf-8?B?OWd4aVlzOXpKajgySGk5Z01ad2MxVUdNSW5xMnJjSzRzTExlTzNkaGh2c0o5?=
 =?utf-8?B?TFpvR3N1TitRYzRJSnVvMEQ2RitOVWpScnFENWM4WHVGSStuQnhMdjVaL0hU?=
 =?utf-8?B?dkJIMHZEZEVFMk1DOG5nSnZSR1Uzc3E5TWVjMWZWZmoyaVpkMmxmYjRxT2hi?=
 =?utf-8?B?UDJUelBKV2ZGbjJzWXFQWkQ5NzFhdWRJWHJsRlFLUUZIV1VJY21FQWRpSXRP?=
 =?utf-8?B?d0pDcXhETUc2UXZTcHNNbVJSZHR4UHRjWXBpZTNVZFpPbXl0cFgzS2krT0kx?=
 =?utf-8?B?ZmtCVkR0ZXpOenV2R25MWFB1VldPQTd4OUpqdU9xSGtSdHJiYmVDWVIxVS9x?=
 =?utf-8?B?NjhEWmFQNk1mRDNYd3FMQVh0Z0Q4blArMjU4TnJwK25nelQ1WWlvV1NkOE9r?=
 =?utf-8?B?MVA5d2ptVGFWN3I2YjdjVjJaOG9HWjFyS3VVY3lGQzAxR21sZy93U1BrSjlv?=
 =?utf-8?B?VTV3ZElraTRaQmNISU9Za1NTNllmQW9YVzE5dFVrMnVtMDNtV3Vyd2xud3FI?=
 =?utf-8?B?VlA1bVJQK0dWZDdxQjlRSFI2dXp1OEt2MmZjZXVvelBIMFBpK0Q0WGJVUjBZ?=
 =?utf-8?B?cVBRZDNJd2R1RTE2ZE5RNmZsTVhrK0dsUnViQzlyWlpldHBmazUyM201UkNv?=
 =?utf-8?B?L0UydFhoUU0wLzF1VVJUcDhFL1FzUmZQVEFPVG9UZ0hYWk8xSmZoNmdtN0Jp?=
 =?utf-8?B?WFBQYkdWakFTQ3JBV3NZSWlQSjUwYm12VFpYV29CMmhYWGRIKzNHQUc3SVlT?=
 =?utf-8?B?RkwyclFHdkJpUzl1QTZzV3hLM1lwbERJYW1JL0Y5LzRjV2tEOVRRNUJBcisz?=
 =?utf-8?B?MXdzSWwvQzlKaWFFa2did3dJSTFCUlMvb00rQkxCbFpiQ202QzZSRzlWNUp6?=
 =?utf-8?B?dXJwajhleEhOUE85TkdNRy9JWjNRbEM1eXBRenR3OGFWUHI2UXM5OW1JNXR6?=
 =?utf-8?B?ZHJxU1doZjJuUFRjWUthM3A1NTV1Nkg4RXgyN2VFeUE0bkhXeTNxOEcwWHc3?=
 =?utf-8?B?QmxjNldxRXBXZ215WlozWWQ2YzJOTHRPdmJ6Z3Mzelp5aGZaVUdSRXBFaWxr?=
 =?utf-8?B?QVd3UTYvRDBYa0d3bEFVaFBsdlJBbWNQOWtrUG5SMUFEQ3dSdFNSS1M0S3oz?=
 =?utf-8?B?cmZFSVA4L0xqaW5DN0ZPNklLU1Y0RlJjcVhnNUJDRlljMWsvdWgwLzBzaFIw?=
 =?utf-8?B?bkg1akx6bDdoZDF2SnBhNE10ZEtKaDUwbXFnU0Z1SkR6NmtmZVl2NnQ1U1ZY?=
 =?utf-8?B?SEZMdnNLb1RjUVhuYkJHNnJ1UmdlVnBEek9FRy9ycTBVTlBCbXBKbVdENmFS?=
 =?utf-8?B?RmFXQ2s3QUtJZ3hBT0FGRmdmOTl1aFExUUNXVE1RNGVIODVjUGUxLzFMNitv?=
 =?utf-8?B?K2lYTG5Qc0FteEErVVJBTDBuTUlRNk9qMUw2Z3g1aUtPN2k1cnF6RzZaRDdw?=
 =?utf-8?B?ZVpPdHMrUmFJU05kcmFWNkZxVjNuN24xMDhlNVdBQlBQZDJWdklPV0NKOGZJ?=
 =?utf-8?B?UnJDa2FVQlZES3BVUjQ2VkxaejIySWEvYUtUcUkwRytFV0lSUjFzcW42MWxN?=
 =?utf-8?B?cFZuUkxsd0FYWVpDZXZaM2Q0bFFTRFV1UkMwUUg1cFg1VGpIRGs0cVVqUURO?=
 =?utf-8?B?SjVrQkJDUHVDclVyY0VMNHlqNmNHNGJYNVBlSGoxR1hFM0FjZGJnMUx5L3FO?=
 =?utf-8?B?aklwbnQvR0dhVENpcGM5OE1hMXhCZzgyVFNHQjdZSi9ESHNJWVdySzhsSndL?=
 =?utf-8?B?TE1ZVWpjSG91YnpuZkdydW5jV00zRlR4K1J3ck5ZMWxxZytrdU9lSmpzY09w?=
 =?utf-8?B?endjNVB4bDFKZE9RSS8xV1dwM0kzc0lzRHZyaTdtdjlnSXNXbWZxMmlvcWpn?=
 =?utf-8?B?TGREMzNabUNjOVJrdzFKc0E4KzJWUEduUERIRWFhNk8rS1o3ZlJlY0xwdGtD?=
 =?utf-8?B?Yk1RUkREU1gwVjl2cTVYOHFxRGg1Q3ltMXQ2K1VPczI2UzFFMU5uQVduOUdy?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4353d29-8029-46be-c45b-08de342b5564
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:23:05.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Yhpwqmx6POp4oZi8+EdnQ/dpWTo+1HobVb9dDtg94YaybB4jQK/Kq9W0x8gLKUTL/vWy3Pf6HtrgQcFNvJUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

Enable the LPSPI6 controller so it can be used by user applications
through the board’s expansion connector.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index ee69d6b268a4..c0842fb3cfa3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -276,6 +276,13 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>;
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 /* J18.7, J18.9 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -384,6 +391,15 @@ MX93_PAD_GPIO_IO22__GPIO2_IO22			0x31e
 		>;
 	};
 
+	 pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__GPIO2_IO00                  0x31e
+			MX93_PAD_GPIO_IO01__LPSPI6_SIN                  0x31e
+			MX93_PAD_GPIO_IO02__LPSPI6_SOUT                 0x31e
+			MX93_PAD_GPIO_IO03__LPSPI6_SCK                  0x31e
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
-- 
2.47.3

