Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF33CC9F6
	for <imx@lists.linux.dev>; Tue,  5 May 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011924; cv=fail; b=HEW4Plu8Iw2DKab5GmQN0vutLeOKZ3UbaUEhPBJIx9PojmPqJRYed8UvPPBBZZMU1cfM6EFWror9tV0vGwJo30uk6BRdksp+yzAaHyMC9KfnaZPiNDHVNOY7dVHHGVnn2sJ2uPXVIIRASJqC4XGWHsPECg77V64l+iCiDo4hKvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011924; c=relaxed/simple;
	bh=aMQM/z+j3lwGITs10ZmVPCPLr7+DyasxOeMzYUlbMTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=pKoQNm51z2mYqY91yPWr1bT+xu0b2TR0UuLCwaCUxRu+a1YnQp9uBezTSx/arFFxKSGD/3P/2gklIU1+esBscmmUWX9phr/47iDSzEsvCGhvE7/NreXxwHbzvUnzk6F0XYFQ43S2IekNC9GF6P2SBss4NBLDmVOTFooghXgw73g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kyxe2KuM; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kyxe2KuM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz372QaXHhEMfVqd3kstDjC1wl4t3w9Qdp79Bok9t+ADrN0bSYSuyqDPDjFA1UZfS9XhQYAw2B85SeOlPHH7FT6aG9p5DLr26iQNyBOMLJa78NGO0aPRPehrVbEFNhLNXJVSfbqTysxkf4EhOVJvUohcBwjmesQVzXNbbEJdxLddiaFgNgE5rTV9tOBoiGX9Oaj3d5+n4u6c2E4gRlWZtd6UDq7Jq5wu2XzexYafoBTuMH2JWIR+TDQuDqNV6YLo4xWyK8l+GoT5LsiCVLFxYTe4WQdBhVPNOhihrtuxdJahR5qdz3rpmpdh1/JtQgJ4+pZ5bF5F61CgvTolWG/Giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfRzuK1HI6G8d4TIsqxuCTlT6zieF/kWtpfoCw6sl5Q=;
 b=CO+g0nZVEMFtd5+HRamep4N6aPgYHdF9sU0FMo0XltxmAoD8EH/+6HYm4xNc6CPLG5nUWu1kPXP11tiLbqhW0DzQwTM/ISxZMTHeWuTYhHjw8++Wl8cQunXOyeMJpNd8PhMYu9Hql+pbMfW0lN+7HbOmY1okcfl8OOnVJebCK/xttCqN4t/VhGOJvEVzqZTBkbzADDWCXN27nM26B2IpjE9RbnzV59CCfATrF4XPu0EmoY3YWSfNbZQ4b+24mP+Jn05SNll0vDxGp+/PXHIUndI6kUHi6rmEWbnUp85ae08/5o9XbmOUOg/TTCBJX41oBtHCsfgvyY8pQWTu+xIahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfRzuK1HI6G8d4TIsqxuCTlT6zieF/kWtpfoCw6sl5Q=;
 b=kyxe2KuM9YuXKCoyBrx12cQFjl5JwkqGVr59LACX8z7W3C/4Emsj6BIJqztdDiyjHKauNLviF3AXzNt8IuAZJ+F/AwC3AdDiUG5gG/8B+4NWEPFhvjND8LEIp6J5d/D4JNXjpfaXQaczoLp0HNxka9VfP8vVfqA27pNTT2cxvl0CzFxwQreffHdTXuA2mh4TRpHNKfytyD0KA8IbRGIgvy6yDxI+pgFK5qfz8+7yqbnwDsQoEEPtVLCXH/cs0U3C+XlhwrYEye0NrT27JktxgqAz1gCdEonrkmfkp94BFTXrPeWScubliUlw3WrlT7kEawyjt5Ug0/qvIWLd8kxFxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12233.eurprd04.prod.outlook.com (2603:10a6:800:335::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 20:11:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 20:11:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
Subject: Re: [PATCH v1 0/7] Add verdin imx8m[mp] and imx95 zinnia board
Message-Id: <177801190792.2069344.428143754036338345.b4-ty@nxp.com>
Date: Tue, 05 May 2026 16:11:47 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12233:EE_
X-MS-Office365-Filtering-Correlation-Id: c6927011-bab8-4cbe-38cd-08deaae28abb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 GnU+iQhvRfLrDNLtyt2Jr/vZKqXX4qK6Sblg872lZiHL/YxxqVIZwDshwinscn6ghYYK6NKgAxYYtzcIKcu4RwlvYKgGx04ivEpbQn4VBxMzIHSyGKs8Z7kE8QJuZMXQiqx92I7uKJx3QvgJnoDlYKL3mdpyFNm+dexusMKMShCXfKR22qoyRVdMuDXNCc6xNA/DEQmT4duE/rY0z14j27uqCoTzppwMX4F9h8oQ/c2OV72Dmjcy5168ggiXrcCgM5VVh+Y6EcvIYhdEFFTKn+M98l3Ilk4GLu2HV/9X13+T5JaLCzYGMOK0jag9S9D6w1yjfWb0yg1D63zqSVvkFXWH6qcBQs4SWtS2eCeJEi179kXAvH2d1oNsjopKQQVtFINg1I7mJ1S+kbAeHkv1PnKwwNyGDbWsUj5C8R0o6TXZElJkAcj/D2FIAxSOC2L3JdXpE8pcIlnJ4oMf75y1cY9EecvQSARtmlE6UfpW8tfsOeV8JGux3EI07S2OzLMdz4ye8l4YEI9rp8sWg4EQ5WoN0TxoY/taq49vRoDkMqzz0PSyUEp/oX1jbmLwuqVoAWhPBs31qTc/hifbLfKosFoP740b8Cxexcun7je452TazV0kasKbmhVwx6iDlvRfAG0Cfb2uHCw5caKeSmJ9EPbRzpDOQ9OhpDT/0muLEnljyH2ncCJdK0xn2gtSUbycWtx/4JjXolMGfzHd1cNBOiEXu7ua7lKwvqGqLbVYCdEbT53EEwpSUe9wfH9xr4Vf
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bTJ4NVVWbXQvVXdzRklkSHdKU3htdXdvdVgwbndxdm42THRKZzF2RzdTZ3RJ?=
 =?utf-8?B?OXlVYWhLUUtIU2wzRmVvWkdjR3lyd29Hd2EyR1BDQWFwRGRpeEppOFNZV0ND?=
 =?utf-8?B?MTJNMWx1YUx0MEJEcnlpbElYUHVPOTRNWDVRWWp1ZXBsMkdnNFVtQ2Q1czJ0?=
 =?utf-8?B?VHBXZGx6dnpOK0xpZlVDbFhHT2pNRi9weW1TKzVUWERKV1ZDaktFcm1ZY1Ra?=
 =?utf-8?B?ZDdldGRQKytHamdRT3pOTGZ2VmRURXVpUmtLZHdSMFI0dERxa3Nud0dYZzN0?=
 =?utf-8?B?aDl4SUZhOEgwVW5CdHhsOEVpdVp2REdjRWc0ajhNMDhFRVBLOHVkR3lBM2Zv?=
 =?utf-8?B?RzMzZXhOdTVvY0VBS3QwNzBHa1c5Yzk0Y3NXWlFGUi9yYXZ6Tml5YWlJL3ky?=
 =?utf-8?B?bWcvWU5UUmN2U213Sk41N0dzT0VMOWI2K1VpZ0xGVy9RN09CMHNhcjBmNm1N?=
 =?utf-8?B?a3lJeENLc0FjaXRaTDc3Rzl1bjJ3c05nR2ZxbXFuNGd2S0RoQUZqVjBMSVpw?=
 =?utf-8?B?NVhTSlJUQjlONXZSWUpNSVh0K09LZnpMcG9kR0pSejJMdllPb2pXZDBNc0p2?=
 =?utf-8?B?OEttU25lZ3RCWkJ3MUIzb29aVTA1N3ViVDZuT2Z3QmorVG9uZlRTM0tkMlIw?=
 =?utf-8?B?TnZrZGl6a2tpeTdGdlVXM0UvZDFodVdkUmZzZzFFWlBjYUdqc3hKcjFYdEJk?=
 =?utf-8?B?VUlnZlYrcjArZU5QUE9pdnFDOWpzUUVPZVRqUTU5ZkZUeGZFaGZoZnRDMTd5?=
 =?utf-8?B?bTByZVJqeHgvakFtSlpvYWtrRzJwZEVVNlpnZzVHK3RlRlY4RWc0RzlKQldK?=
 =?utf-8?B?Z09mMnJvVE0reGppYzMvOFY4ZWdEbHZ1QWJEWkFpOERNbTB0OWx0OGtlR1pJ?=
 =?utf-8?B?cXFqcjlzRVlqd3JwQjNtUFRoQ3FqVHVlOE1LeFVORWNVOVVseWJvaUI2dnB4?=
 =?utf-8?B?Rmp5QytaMXlTQzg3VkdXSmRzZzQ2ZW5PeU50SGhZMFFCOHN1QnozVzJVeC9s?=
 =?utf-8?B?eUlhdzFkSkN2aXhXY2hCSENaVGg2a0tDZE1ybWQ5ZnFjTkRsbzZERjh0cHNs?=
 =?utf-8?B?NE0wRzlxYWcweElDb3hJMWhuZFZrUGVpVGcxOHFiRGRFdFhpdlg1L2gwbGhm?=
 =?utf-8?B?dTFnMUNOZmt3SHQwTWx0b2RKNTg4QzgvZ2xQZ0tsdWJOMGlCY1VwZ1p0WnNr?=
 =?utf-8?B?c09wTTVEazg2Qi9SN2kvTWxJTUdrODhnTUwyNkFGMU5qQldybVUwRkExekNC?=
 =?utf-8?B?d2dnR1NjZTFqdTNiaytLY1psMDZJNklUUVFhbVpLNW5PczlJODEwRVgrcU1F?=
 =?utf-8?B?eHpuRWZ3TEpmM0hEelFJUmFkVURqcHRPaDdCSTNydkgvcmpFSjJrRndLNFdY?=
 =?utf-8?B?S3VEdnZiWHF3RENmWTcxNFlwNFdXNG5OKytIeGY3TVBia1ZQNHZUT050WXd4?=
 =?utf-8?B?VWJJMUtwRmFPanFlNUNVeFNZdFM3Q2dhSGkzUlpPRTdJVnhmeitla0JjMFFH?=
 =?utf-8?B?RmczMHgzODlYNUFtdyttczhYZ2c4Um43N3RrT3Z2ekhIMlNHQWp0UEpxanZz?=
 =?utf-8?B?MmsrbGRJaWlxd09KdTJWcHVYcDJTajJrMUpHck02SDZ3T0UxRnl6aU1BTU9h?=
 =?utf-8?B?czBQMjNZK3c4eVI3ZElSaEg2U0NwMmZDRFlJblpuTnpEYzF1RW11eTN3MVM3?=
 =?utf-8?B?THpXZkFnZlA4aUpZWnd2dzlPUnVtUXBKUUI3clBhWmkvZ1JFT21zNWxOU2hr?=
 =?utf-8?B?SnhlYWdmOFYvVklweXdsNFJRQVpKMmVKNGdjSlpyZW1TZ2xZUENiSzBXREkv?=
 =?utf-8?B?dkJNVUpVakRRSHJlOWRzQTRLN2JadHExNDM1dU0zLzlJUUg2SlU0ZENTdDJy?=
 =?utf-8?B?QitBTkduTEgrR295WjdvTjdPRXhBN2JkZHRUWU5ZUGxHYTY4VDRzbWNmSkE4?=
 =?utf-8?B?UllXQkZBK3JmZk51Q3lHcy9LMDI1SmJXaDgvQXRWR3Q5UGNHdHZHdzkxdHZr?=
 =?utf-8?B?VFArRElydm1Wa25FS25qRmZKT0N5N2FsK242SjFZTCtscUpsNmR5b3pCVmlr?=
 =?utf-8?B?dU1oeVk1bjE5N0wrOUh4eklkMmdBUnNjUXJtbkttbytYcm1HdE1HVFZ3UE1S?=
 =?utf-8?B?bWg2a00wQXpsNEN5VEVHR0V4L0ljUFNzU3MrQ2E1d3lEM1Ruc3VXMFlPbFI5?=
 =?utf-8?B?VlpuNGxIUjllN01sdG5yQ2U3VXlOb0tuVnJmV3JHSlA5c2xldFVsQTNkb0Nu?=
 =?utf-8?B?MzlWMUVsTThaQXdIMmtja3prdzFBNzgrelEyVEJtaFArR2ljdEtIOEQvd3l6?=
 =?utf-8?B?ZUlUNHVldEVLcnBoZHpyK0daRjRTMG83UUhCbm40WmhNTnB0V3A3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6927011-bab8-4cbe-38cd-08deaae28abb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:11:50.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mswZke56CMotxq7XXvnP8sDSpMsxqCmy5VMABmrHYXSZhlduCgueDisGyHUVpJOMiL1bTwCauZ8k8Fi+UKtAyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12233


On Thu, 09 Apr 2026 11:58:46 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Zinnia Carrier Board mated with Verdin iMX8M Plus, Verdin iMX8M Mini and
> Verdin iMX95.
> 
> It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
> 2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
> for a modem, USB and SD card interfaces.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
      commit: 70e7491569309e53ac4591d2e41c66867a43f3a0
[2/7] arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
      commit: 1adec08904bdb8edfcb78ba6144797db68a1b049
[3/7] arm64: dts: freescale: imx8mm-verdin: Add Zinnia
      commit: 4ae9c3f71915ba8a137ae37982273f6e0a521c8c
[4/7] arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
      commit: 64f3d33bb803d70044cbe9b98894c8098fa122b6
[5/7] arm64: dts: freescale: imx8mp-verdin: Add Zinnia
      commit: 17658e1c90b0df0e7152011e496cc251a373a581
[6/7] arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
      commit: 7bd750e7b7d1a70b838ba5f375547ca30f7c4b39
[7/7] arm64: dts: freescale: imx95-verdin: Add Zinnia
      commit: 76182019a4c41c1f187694f1c3db48a0112854c0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

