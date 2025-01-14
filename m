Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C6207A11
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877415; cv=fail; b=TLNHEj8yq0PVcWB4N22eIoxrW8RkMemB79ui/Bbr28FljDQ69VdO/2eAnvFE+7CckOyAGCThhPUNu0qlB7/+JAyL+99diTlQL3S8LVOptZN9OQalC6w8EQbl88tBLLxZ1+l1iFZJ0fyyScReZA5zymxc6yod38ortjnL+WowH+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877415; c=relaxed/simple;
	bh=6Nh2gW0N6SPGWple58ETuG0QHXLY8qvxJe0wOfpPR68=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ij9hdw/jw91Js0HMUdC2En33HTpPjO5gyJh3uR82JYmAmPeFzWHoiiytoVFEdOCeBb2s5p0sCIzetTo5q1494tKynfgQvnE7Vkq5kFQcKRBpXmghls1v6Y8jYuMv6vOd5xxQURfXRr3igpDu6K0dMSpVNcLu61jcil88qO1DWbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c+UPY0Vi; arc=fail smtp.client-ip=40.107.247.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c+UPY0Vi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RELdMNC2jihTcctHrRDoiFmr/qzt5xdE053LwYD0dlSxaeNfuMOA4+AHIp88M4WDdmZCVn0KC/zRUNwvlHoFJrziHYvaoHEqJSwajtGXF5ETXWkOWhyuKcBhnyD1Xt1a60LE/L0SE0mZmrODVXvMHhjGz5fHsd6gUsGwL/vTuJzUw9vTrgbzOz9Lhh2b+c57hu0GjssDASnreZaD5d+474jWz/ncdoqXY+9F/l1JwGCGbN8ZE86SybbYYh0N5emwO/LpZoa2xkN1AYSOFxEnlw1Y/lqH6VhAF/OKEZBIhxwiWTUT9Lc3/Irl8h1FwFuEE7PClErTb1h/WrMXci5A2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvgiNDxM5LSgNF0oGIA5GwjktEJExGSujVCalEsX10k=;
 b=FdkV0o43/5GKCNH/OjLWb7C4XZ0pe6BR+Ece6iUcvLQRB/5pf4ddVlWsuDRWMPtWYKc/P2emQqRMf7I+ilzeZgsHTh7jwwyxvqVBSZEd+P2i9JRxS324O1WE5VYrDDehnpSTkYtcMaDK3SpIzPYml/RDQ+twfqkwiVVgfVJzfrC1q6w3/gvctj6gHDZCw8UfbEUhp0ubGkyPwjlGLqTnSTaRk7lszzKYvoGmQ4Ewwc32X5mQifKbT89SAOmUcbUzf7ki8fLEUGcXtX4XN/KOhBb87pEOesjMchLof+V9qsJUkttWW7inEvxlM3ZH4SJJe9K0GgfQ3XToTHsLO98qdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvgiNDxM5LSgNF0oGIA5GwjktEJExGSujVCalEsX10k=;
 b=c+UPY0ViGMjAN7MQfKpyc8924WYoi4oB/TMXJm4XFmBTlDXabuoGAEPljjns5oeRDaLap217usOdZic/DYehuprGIsTeh6XtHDOqcSmA6t/tsKNvg+tf4/59F5e7zp6ZdlNSPPTvzjF7Z8BsPtBiBW8ifNj8w+ZPHG/txcf/wufGzpCjRxL0+N1qhFCFMv0dAZWu79FE9BfZDYrrmzRTyRgvBkK6dhMr6csyGdzVqq8xuBjXHzuK37h46AWdYYk+kyIvn/9+zsUlAGasPWCjUKgdj5YT8m5wxq3tdj4JUS1fXDTB/AcOjgoVozNr8TlKS4cqBo1MHLfo+ZB6FrH/rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 17:56:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:56:50 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 14 Jan 2025 12:56:24 -0500
Subject: [PATCH v2 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-imx95_15x15-v2-1-2457483bc99d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736877404; l=762;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6Nh2gW0N6SPGWple58ETuG0QHXLY8qvxJe0wOfpPR68=;
 b=DLkJRcSgnvkpox39G/smXyoLqpT4UMrdaNcw9QjFXJcdQDejOCcC7xcF7uFEs9gAQHr4VYnfS
 UMLM1WZv+XLC1HShuKralGQ/0TgbQt2bJ/5LhyOc2ajdXPhgOY+TmQr
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: 042601fa-b98c-4b94-8035-08dd34c4d269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkRLU0JNeDVtVHBOcVFkVk5EZ0RwOGt5Z3psbXUyeW1PN1lQTTlFM1Vrc3lL?=
 =?utf-8?B?QjdrdkRERlZ2NGRYbngyaTRiSXRpTzZkREc4M0xCRmxaZVNFcy9rZVNRd0pV?=
 =?utf-8?B?bHhPWFRsWFRNenBreWE2OE1ZcFpjN1hQRU4vRUZ6a0FzVWp1Tm91eTI2eDk2?=
 =?utf-8?B?Z0h6YlgzNlJ4bEd4TVJaemMvZTk0RjUrakZGTlM1Q3dBSEV4TGhDaEdaQ3ZU?=
 =?utf-8?B?dGUwVnA0b1BoU094SHppdk1DcEYydlJTR3MyMGlzZG1wT3ZxVFBXLzNyc1RO?=
 =?utf-8?B?RkxKQmJVenJHT1hIRUFEOFVYZEh0S0IwTmFVNGZOM3ZOdHZzUVNEOU1ZRnp4?=
 =?utf-8?B?cmZYZWppZzF3Q2RHTktKOW0wUVFwc0dpby9pK2FNTkQvYURoTG1BbXZST3gr?=
 =?utf-8?B?dkw5ZUZtUVpJMlNDNERqZE9vWkh0blRsYVdiMnlrSGJJRTI4dm1TVUpLaXg0?=
 =?utf-8?B?dmY4YnF2end6WDIxRTkydE96aTh2MnlhNk9mMnp5OURjZGtoTW52cXB4RkNn?=
 =?utf-8?B?Y3ZtUG1jeC9heG5tQjVNa2t4R29wOFF0VWNsM3V1cU96SWdCd2FiQklGdzBH?=
 =?utf-8?B?MUFJYVA5Y1BzWDB3TVRKSW9sdFh4Zlc1TlFKWTNkL2ZTQW5pWGljbHBVSTBV?=
 =?utf-8?B?NHBKZEh6Q1RuL09IZi9qWHJqNUlicmhZMXBLTkxnOFVlVEN2VGdZakoveElB?=
 =?utf-8?B?eUgrWk5paGlpU3lNZWJYWEFPV3hLRm1UUnhNQ0szeHdiNDcxdnZtR3BTTGxF?=
 =?utf-8?B?VXlUV2UwS3NUZDRaUi9OeG1TMVRpc2k5ZUYwQWNMaUVBRXByMysxR2FpeEJQ?=
 =?utf-8?B?MWtGZHdiMGlwQ3JBdVRkT01FdUoxY244Tm1KWVM2L1B5NFp5UXFIVzBLeXZx?=
 =?utf-8?B?cXFNT2s4bENYMmlHVEI1aGRTSTZVR2FUSUNEdHA2bms0UDR3Z09zZElPWm5Y?=
 =?utf-8?B?cUZxUUk2TXBsUS8wbVNIL3VYM0ZPeVZzWkF1UldFMFJRdTQ3ZDlaOVh2L05k?=
 =?utf-8?B?aEdqenB1SkVqWnZRdzJmVlk1L2hETzBBOGxQcnZQOUFNbm9mK0FPd1p2T0gv?=
 =?utf-8?B?MnNDMUVzZE5URS9oQThPYUJvMmU4ZGtMTkFGOTU3Y0t0YjhNaVBCeXgrNUxQ?=
 =?utf-8?B?L1NqYm1SWkF5RnI5SXBSTXJFVFZNUXdJcjZoL21XUlhDT1A2d2ZadTJ1U1dG?=
 =?utf-8?B?VTFRaVFoaEtobGdCVkhpdStIU0JOeEhFVVUyNWdnT0xiN1lrRkJiTU1yUDJo?=
 =?utf-8?B?VEM2UzFweUFYTHEvSVhYM1FrZXNtem1qUjVuQ24wMm5UVzRFSlZUODQrUVJ0?=
 =?utf-8?B?L0lyUENrQVo2NGU4RWp4QllsdXpzNi9YZ3YzdE9IMDk5TzVhSG5pQmpTbFpt?=
 =?utf-8?B?ZVIvSGR5aXFNQlFXdGRQZzdSZVdTdWIzVy9xdElKOHM4MEtCak9tR05ZY0x0?=
 =?utf-8?B?bnUwSHNSUkFmanBzeVFqMU5FZVBNTlZlMVpma0x2R05icG9rS242ci9TdUlk?=
 =?utf-8?B?a0psQ0hZVUx1RjMyamUzSmpKbVgzalk5N3BmTE4zK1EwUCtNQlg4aGRiYnpL?=
 =?utf-8?B?UGkwbHRrRk0zTS9MTnJnNjRhYTNHZ1BFaGh3T082RzNRY3NWNUJIc1V6OEQx?=
 =?utf-8?B?dlIvZkNXNEZFdGE3TmU0bjRmU2IxLzZJNDB5SWtoMmhvYnh1Tm81WHpleVgz?=
 =?utf-8?B?SVNQSGszY0pVMXlNbnhJZ0EyejNQZWRYOXFNTG03TXJrRU5yNy85amY2R29Z?=
 =?utf-8?B?U3pHYU5QaDc0QVVoWWxPNjZINEo5R3RjazlOT1NoaGRIUmZnUE5aUExqOTJp?=
 =?utf-8?B?bG9Ja2VwNk10dUNHUkczQ2d1dk9uZGZXbU1rdGVvdVZ3ZDNVZzhtc3plTXhD?=
 =?utf-8?B?L1l4YStUaUloRGQwUEVqOC8waldDTUlHZG5qeXZPN1BCMUxlTzBvREtFbVM0?=
 =?utf-8?Q?pw5WUXIm2ZTze2U0IrdS/KMMwWovvxLl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGVhZUIrWHZjQlA3TVB6RkpreXpMYzhoUGJMK0ZSMHNzUDQrSitRYllSNy9V?=
 =?utf-8?B?VmYyckdjMzFDNzJsM3hVRW92M25XNm9USnV1TStRRkhyR0NNUHQ0TlVoWUZt?=
 =?utf-8?B?OE5PYmExQkY5Q1QxSXR2UzdhK04yemN3OGpTcXFYY1NWbFpJODVCNjZwNHlv?=
 =?utf-8?B?NXd1YWpZbjJINkd1T0NnbHRKbUEwcWI1ZmlhZExIU1BrRlcyUlFqak04U1VS?=
 =?utf-8?B?V3FPKzJ3VHVRYVpKQzZoc3FMMXR2cCtQTnJ0NGUxUHBzT0V1OTcrb005aFJI?=
 =?utf-8?B?em5QQmgwMGRkM0M4dHRVdldHU1JBYkVDcWF3ampnaVRmWVhNREk1ZGhPSDRW?=
 =?utf-8?B?OENTdzlaZ0NhVXNjNDJvanM2TFlybCsxVm9HUHpaSFRXd3pTMkhaZkVKTnBT?=
 =?utf-8?B?cEgvTlJXLzBWL1FER0FWZXJ0Snh2STlRTjBYcW1qK2hLeWhhUzJkUlJhcTc0?=
 =?utf-8?B?T1VjUDQ5TWpibW9GbzdnM3Ftb2hQck1nQXBMd0E2clkxQVJvR1FMc0xqQVZ6?=
 =?utf-8?B?VktmRmNtK3JZSWNjdUFkZUxmVVhybENIajJLcDFHRGdlWHdaVFJJYTM2UElr?=
 =?utf-8?B?NXYvdW02TDFiYlRnVXJ0dDluaUoxZ2RIUGcyUkRHNlpzeXlySVZrRlRJdGpD?=
 =?utf-8?B?eHNRWXZMdU81OG5hOUxXcis0YThwb2FHNlNSRTVia0JidFZsNUd6eU1vOFhw?=
 =?utf-8?B?dEdYTnMvMy94MUNObDk0S05rL3p0RURTSlJjWUVPZk5kWVRsUmQ1cHdQc0VS?=
 =?utf-8?B?MTBtZWoxVWpkRmtld21VVzdBL3lLMUI0UW11QzdpOGIxSmF5VFgvNXZ6Y1Bi?=
 =?utf-8?B?ei9ta2NxOXB5aVRHQy9WZVd6QkVTU0J5UmtUTlpOeFI5M3lsajJUSTZWaHZR?=
 =?utf-8?B?TU9xNnpmcENzU05uY3dLNFZnaDg4OWFMbWEzSnlubk1ad0M5NmhzcDhXQzVq?=
 =?utf-8?B?b1J0UWwwdWc2ZnhMV2taUHVuZVZyMjBDUlVYNFFpMEhJQXNmK3NvU1hUenJ4?=
 =?utf-8?B?NHVrSkRRS1NCMCtlTS9WRFpxd1p3VlM2dSt4d0MyVUJPS3M2ZS95QXNNZXd2?=
 =?utf-8?B?d1NFTG84WmY0RkkzUlI5K3dwb0ZCQ1I1cFBXRGlhaVdHKzVjNGdoY2pRaWxV?=
 =?utf-8?B?Q0dRaVkzdThMZmNHR3I5bVZ6bkpmLzZHS0RldW1VSkROZ1Q4REM4SENiek4y?=
 =?utf-8?B?NUlZUDFWYzJpVTRONVJDRnNWQzVaUTBpZTZzRzdqbVhSeHBLTEU3RkMwaFNm?=
 =?utf-8?B?WmFtVTJxUUtEZitLejgwcm96c0MzOERzcEFJdmpHZ1NmNE9tcW84Vkd4NVI2?=
 =?utf-8?B?anRqakVYc0ZZalZwRHNNZWdYcWhFd3l3bGs4K0RvUFpEWi9Wb2o5Rk1OdWtK?=
 =?utf-8?B?OUZoeVhyNmhuTjhCaTdRMURNVjRTVnNvc3ErUTNaQUs1SFRkUWtJdWc4Tmlx?=
 =?utf-8?B?RDFSSkpuQzR0L0xTZUdweitMWGh0NFkwcWRyd3l6OHdoNTZNeFgzVE4yd3E4?=
 =?utf-8?B?K0FuaUFtaUJvS2JpbFFjUS8xbE5KbGNNeW40MWdwZUV2eHpYM1NQNElLUm1N?=
 =?utf-8?B?WXg0YS8vRDRtaFVuVCthNldma21WaTBka2lsTm5SSGJxY0RxRklOTDR3QXRP?=
 =?utf-8?B?TDluNCs4UTdnVVZqc0w0NG0yUjBmb0ZMY0VqbCt3bGpWZUg5ZXJDUDl4UEhk?=
 =?utf-8?B?dVRLM0puZzh3YUtiVTBzdVVzRDh3bmtHU281NGQyUksvSFJ2U1hIYVZwOFpo?=
 =?utf-8?B?Yi9kOTBaanVPNU1ubDZhWDRvYXQzRlRkbDkrSyt3L0tBV1NHVzRpWEtsMm1x?=
 =?utf-8?B?Q2lhZW8xeGIrc1FYRndrQkJZbVhwYWJhV0QyZm5aSlJGZXBmNjFqTlNDQ0hB?=
 =?utf-8?B?bXhGSUdvZm04cXhkQ21nR2xWdnM5Rk1NNVNaODVnUVU3U1gxZDJHbmdqRDFm?=
 =?utf-8?B?K0NKamlOdzZhRHUvWDVnaEt6N2VSWjgrWCtIdFlRMVI4NUk2ZU5tZzNXdXdr?=
 =?utf-8?B?TklrT0o3VGZ2Q3VBbjduMVB5MHZZUmVvaUFieFBtL1VFamNJa2k1Y2RLcGNF?=
 =?utf-8?B?d3ZqUE9CbzhWUjByOEhuUVlJM3NIU0VSVGFDZmJJdDNoS1dzNEdZMjNocEpp?=
 =?utf-8?Q?rjt0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042601fa-b98c-4b94-8035-08dd34c4d269
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:56:50.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr4KbOnNLX6kwtHMsImBgEfXbVmXl6nT5DSyO4A1H5BuUJyWhYWSLdsoFC5LN+CZCZWSowag+6JOzBUH/fAv1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

Add DT compatible string for NXP i.MX95 15x15 EVK board.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3713175548637..4d2edc8f1d1ab 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1352,6 +1352,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 

-- 
2.34.1

