Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023137.outbound.protection.outlook.com [40.107.162.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFAF78F26
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835573; cv=fail; b=g8e+88Q0s94jEU5asnkAu2OMuoPF+jW/7eA0VljSdCoJzUJY+fKIGQWBUA31wK+j1VecieOb2tQx3Z288G+Pn1mjXTHL6hmSlMcDy5PpavWDm/8n1/Kn9h8+LT6T2/nFGDwIvBJj8nRz235JLxiArfXddqsPdhPfRBXS80FUs/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835573; c=relaxed/simple;
	bh=4lv6IRUFMCg4UMkDs+ZQvkW34lA6CAfH6l/TmMbEH/A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IaU87EQ05sPsVMXuadHffAswO0OIAZlmv6f7fRyba9IeXif1SNL1kixoMjWbLBgkpd/9ckeiYY3E/2N1zOtR117N4mLeEvkrtIo6gFIov3fXzHh+j0FQyDjlatK951nqKOhNTjsjVdLOiq9QmJgtKRe5H8nCTlJIGWlhQZ4vUTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=FwGd2RV5; arc=fail smtp.client-ip=40.107.162.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="FwGd2RV5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HU2LE5cgCIAzxdySZdTFf3qE6Z+9bx1HNfcRt5pyf5yZKwhGfjGd+SJVdYqP3gGE2Y89WuAjSSzzBEdNhHzoJ7dY+S3vKR9+E6shxlOdJwdNdmex2CD/fVdkAQAe4EIcSg1QEz8IAPJjuqUZaoOBXUpgRh5kbnaqrJ6qX7rDUjXqw95kIlYlde02Sr9idqLo9FSHaea2ulQqcmff0pIY5U+J7cKwZZWRozgYj8ZmS5ZwWqdw+SJ+PRxzq9B+MOS+w3p9AVVOCbeRpiKWiWtw9eMdWl8L7g527nIOeeIXIZspMizmLFEDpBTkUYqwnQTkmBfBpk1R+7w34VNUzqBaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6OXzBnsPaZ9O8O9qDibJn0XAnlp8Tubmd8EpAvqVQU=;
 b=d2ei7Bjk6IuZkPxLChBGiazbozoMwB3LZ8Xh0YpHcgRcNkuSsLhRd0VqHjfx1wuODq44/McpAUlu6g0OO6TISOVKvRkm4XS2tCPpRGPu4HloANNLPaNCSyYV9H7iTpQoxciL2xcB2Afv3vWCihP3O8176QJhapLesZc+hkHBZB2SD/ie6ZgtN6DHBr1+5U6baakZHODqcQZ1T81khvf+Wlf/bLbEejXdQ8H79o3Rv9zw69QlLoITeOjHqYUs1qMlYAr2FvHdQNKfCYiOimn+XwhR0EcgX7QJSfA/j6qHN5KF9/SPfOIK+lEDw6ovHnDP10+R79+IJ5vA7QmUFIzh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6OXzBnsPaZ9O8O9qDibJn0XAnlp8Tubmd8EpAvqVQU=;
 b=FwGd2RV5NT8jf9O3qhx3s1O5k1scFShq5tE5+xnDxkWejFXDjukjYQ38H1rtZxBf0vVHDQADelAjQKoks05Po64Eoe6p8mm9oh1K2JX65KSxcEQX8Hux9sS66LzSxU//7MiJxbuWFSRqR28KqxHa7Lh+D79IUxgePKVoJDFtiF/c6gSPMd0Cj6N/YCSyY2tm+J6EaUYB6leeXztYbUk6f7t5N8HoXjQeN40raijaMHvdnTOn8HvgwMWcxI1fNE9nsC+mIVi0gMvKrEZQB/TN7tHI+fmf7HzKGagRG0brbIbxFYm8Rmm0vGX5VmPunz2pLTR0GgO/x545INYJQAxWng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PA4PR10MB5585.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:273::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 08:32:44 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 08:32:44 +0000
Message-ID: <c3214acc-5e94-4fa0-94e7-a93916c00669@kontron.de>
Date: Mon, 23 Feb 2026 09:32:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines
 in DL devicetree
To: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260220103636.9697-1-frieder@fris.de>
 <20260220103636.9697-5-frieder@fris.de>
 <b1ac1eb1-41c6-4267-8ab2-cb5a72cc625f@oss.nxp.com>
 <CAOMZO5B7kYtXzKtguYe=2YEnSm6rwa0vTHJwn1p6pUqjgZ-b4g@mail.gmail.com>
 <53e69d31-c435-4fb8-8e4d-63a4e27887a1@oss.nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <53e69d31-c435-4fb8-8e4d-63a4e27887a1@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PA4PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d0abdc-8c81-408e-1361-08de72b61d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1I5M2M2bzM4a3B4MVQxUzg4elJwU0JvOWZsYk1Ja0J1WmNLUzJlTCtVRWM5?=
 =?utf-8?B?dTRTWFhmd3d2L3ZCRUZxTGx3Z0hXYWhTT2hqbWx3QjR2N1lwbjNncDFEUEJO?=
 =?utf-8?B?SzI2MVBTR25qOTE0ZDJrV0YyQzhuMHA5NXkwenRFQVBUZE9kMlF6Z2lNa3RV?=
 =?utf-8?B?UnZsTXIwdkhhZU0vV3paQXdwWVVJeFdyaksyajBBVEhBam1DUEVmRXNMOThi?=
 =?utf-8?B?blV5ZXZ3em5JV0swa0R5Qm5zMmtkbmY2THJuZmtjUmhoa0V3VmNFZm0wRXVj?=
 =?utf-8?B?SG5qK2RiMDhwckNINEtMS0tNRTJrRjgrWjk2ZDYvRDNYYmF0YkJYUnFEZEI1?=
 =?utf-8?B?UHVoL3hNRFd6MEpVTFNXTzk2SXZxZjJFTjk0L2VLd3ZGOUd1dVJIY1hZSDlR?=
 =?utf-8?B?b0lUSlg0K1JjUE5jYVpvM3hJODVKUW9laEgwUzkzVHh6Z0JmeFZjNC8yM2hs?=
 =?utf-8?B?azYzRGhBTEhKd0NsQ29MSzhqUURSZlhxS0QzaUxkZE5ORDZPOEtiTlZRa0Ns?=
 =?utf-8?B?NWVCbVpQaXRDMkVhZVAwc0hnQlBGNFplalQ5U3pET1l1RHdCTjVYM2RWZWpH?=
 =?utf-8?B?WTc2RlZlVnFQSGE1UlRpdHdXUUFveFBsVTJWVGxDY240SllONHZCOGNDNitw?=
 =?utf-8?B?OGlFeWxjL216TGdIMG5rK1dicWtIQXlXbi9jZUFObkZtWDdJYkhidmxBQ3RO?=
 =?utf-8?B?ZDlaMnB3YTBRbHUyOUJaTE9zSXZSdUJqNHNzZ2VZOTFSV1hjNW9iSGdwbTFS?=
 =?utf-8?B?MC9wb2tYNmZQV1A4OFBrbFBtSEUwdjdYVnZaRkxFMFMrS0tTS292Unoxdkx0?=
 =?utf-8?B?dmV5RHpvZlRNem9TcC85MFlsYStaa1hlM1dkemZZWXBhZUM5dUpJb05qazlT?=
 =?utf-8?B?d3VEblQ5RkdFOG13K0o4V2J2VGZJcy9LTU94WXhlRk9PejhIN2ZodUgxUlF5?=
 =?utf-8?B?Ym4rTDVyZ2R6aWs3WGNvejMzVFNUYUxyWS9JN1I5Z2p1TkZWeXhOYjYzS3RC?=
 =?utf-8?B?T2dkTmVLdjBHOS9scjVhSEsvdW8vMERhQnRqR2FFdkxTYjQ2RXFZQ29OTUFB?=
 =?utf-8?B?NXNoQTZVMjh3TzU3SSszU0hHbk1rTFBzMzNudGtXbmtiUkJ4VUpLSERpZWNJ?=
 =?utf-8?B?K1d1TnNlVVdGaGpWMTlWVEs2Sm9UaUpDTTRRdm5CYkNacHVNNGJYMys5cHFL?=
 =?utf-8?B?MjRBeXlyNytvM1hKbU5Kam1YcUhybHhuUUZOZmYvcjBlc0J1ZXpPc2xWMUFk?=
 =?utf-8?B?QWRzRlV3R3YwU1BWMUFTNHc1NmNSTytuOGwvVU4wL3pUQm9ReEZPVHhzcTBt?=
 =?utf-8?B?clB4OVVxUUN6VTM4VWxzRVJlZDZoN0FiLytMTld4UmhMQklKeDd1cUlnOWg5?=
 =?utf-8?B?TG5ZVHBTdEZMTHB4eWNTeHllVHlPNTRHMVpsejZXc3puUnFQLzNyWTA3dGd3?=
 =?utf-8?B?UXk0eDIzVldlbk1LTFBkNHErMm5qM1lHdmdCdWJ6citVNitqQzNwcTFSSUlP?=
 =?utf-8?B?a2xwZXNWU0dlK0ZpbXRlcTlsTk51QncxTnFCVTNLM3VULzYxbmR5MExUM01z?=
 =?utf-8?B?a0pheG1Nc1crNlBrQVBnNGFlNnpjaFRLWW1JeFl5T3RScjB4U3lUbjdKUUJK?=
 =?utf-8?B?QzEzbUl5eCsxM0R6bTJndVdXUTc4V1BvVVNnT2ZZNFUvOG5ZZmtUdGYwYnU0?=
 =?utf-8?B?dHF1a3VmNElQb1pPcnAybkFTRFdlSjN5N0FrU2lDY0dBdDFCNm10SkxZR2RC?=
 =?utf-8?B?OExmZXpsaTBlcXMwa3VTMmFFSGRTRmtLK3IwNEw4a3hoZDZtOGc3Uy9lYjdR?=
 =?utf-8?B?cTV4bzhDaWQ0TFp1Z0hmQkUyemZWZk1LQ3dOdVUzaWFiWmJ6bUVIQzl5RFEx?=
 =?utf-8?B?dWNzeEI5ZEVOZTNLWGV2YVdxWi9nbHk0K0xqWU9vTFkzYWxXM2xnd29rSDZV?=
 =?utf-8?B?N3diSUFOb1VuWDFoOWVYUUZ4T2JHMWc1R0JwMFhCZmVha3M3L0pXWklhOHFL?=
 =?utf-8?B?T1BvWXlRd0FDSkE2NTN5Z2dYcjBoeWt1UXY1bUdqNWxsQkdseEFJNll1YW1j?=
 =?utf-8?B?QUFGejhyY1ByRXE2OTBGMzdTbHk3SmNXZEg3S2ZEWVV2L2xzNkFyTVh3MmQx?=
 =?utf-8?Q?dWc8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm1hWXNqTWlXQzhuRk9hN3dJSHdnUVl3cDEyMFFvWnlrSFFCR0lwektYY1RC?=
 =?utf-8?B?SjlxRWR3YVYxM2ZYdG1oWVptY2ErMzk3Q3c0V2N6WTRwS2d2UFJodEtLdDV6?=
 =?utf-8?B?NzJKeDJkd2MzNDhVc0lMaGQ3cFV5bDV6M2xuQ0ZiUkd3UmRnS0ZGbmZ0emNs?=
 =?utf-8?B?ZXRLL0I3djgreXc3Qkg5YjhQVmVvOG44eTEydDZlbmJUd3N6V1grMTJWOXhL?=
 =?utf-8?B?ek1OdFhtRHVqNGNTNzU1anArWmtOUXpKWXlxRkFwblllVk1XUlBBY2VWTlZ3?=
 =?utf-8?B?VXNUTEs2aWV1dTMyd0RNakVPbTBWaWVrTXhWbHRxbHFrMHR4bWJBYUhISEVk?=
 =?utf-8?B?cDd6SExKbW94ZXB6UFB0cSs3alYrWkNhK2NZeEN0cS9vZnFqcFlESzY5aGFj?=
 =?utf-8?B?b2x0UjNlZHBMSG1jTzJNYVNiY0JjUzByTWhuekt6YkFJLzRtWHZmS29ndnhI?=
 =?utf-8?B?dFEzaVhFaFJnVnJjbTFsbllZaXhKWDk0cEVqZnk5U3FvaUZMYkFyaXpNVFZ4?=
 =?utf-8?B?dGN4eFBTQW9EK3ZWQ2Q5eFBTYTNHa2pNOFZLTUFqSXhtdGpYWitvWldSbmI1?=
 =?utf-8?B?dEtBSkRMSEJDV2JQTmRremw3U0FLM0R3UDdtM3lod3RZbFMwN1VUZEg4WVdI?=
 =?utf-8?B?QVJ5VzNTeC9FNFByQVg4S21FOCs3RERzTVRTbW9OYnZpZEtHZWNDMTIvYlJn?=
 =?utf-8?B?ajIyZjl4NVROdEVNVTA1WnlPNlExdGFqcjlKd2oxNEY2SXN3TG9MaGc5N2dx?=
 =?utf-8?B?WnBHMU9ZUDZhanJtS2JqRnczSjlQTTZUdkMxaEFmK0QyWXFhWGZLOTFLMzNa?=
 =?utf-8?B?cXNGZjRBMWNjOWZBcnlCN2oyVThmQysrcVI1V3ExcU5sOE85R3FqUXNiZ3Vx?=
 =?utf-8?B?RmR4emN6eXczU09tTHg2Z1BvME03eVBhZHZPbHlXQzBhSytKaXZ2WVJLdlR2?=
 =?utf-8?B?M1A2ZFoxRVNwZ2NmWFhnc3hSY2xLQWpZMU5QVmEwQnJaVSsyeDkxNzZLYlpN?=
 =?utf-8?B?Y0YxbUpQWHYzcEZwc3BEaXRubTQrcHBiemljaFhmVEg4L0tHMFVhRm16bVpU?=
 =?utf-8?B?YUR6clNWcXRqdi9JZ1M5d2JSaWJrWHRYTVlScWFoem5qRXplWUhxV0dwR2xY?=
 =?utf-8?B?UjQrSUtZVkJEb21OSzFpcGgvWFg0MDBaNjJlY01WSmg0TUYrcFJhdEtKckpm?=
 =?utf-8?B?c1ZpZ1BIc2FtTXpkeVNoOWVJS2toK3c3bVNPSjBXQThZNDNoT0U1VW5lMTZx?=
 =?utf-8?B?R3RUbXMyeWtqRndiaDR1eHNmaTE3K0JoMnM3VEFEWDg1V3U4YnFjNVRDMDZ2?=
 =?utf-8?B?YXBMdkNReFFoMmNLVCt5NU5BTWJaQzNoMWZkT0ZMM2VialpMdGJUdHJSTXBG?=
 =?utf-8?B?bE1NbnZUSUpBODhpVW5KL2dTcURRZGkwZVdpbzhSNnJxMktqRTc4NDRGdnRw?=
 =?utf-8?B?NkUyQTlGNHpnNkdLYTkyS09kNGJlWitNRGFlUVFKZjRnY1JVcDBDT0JmQXNE?=
 =?utf-8?B?SWVibEQ5RFFPY1BCeVQ2ZFY4MnhQU1RCbHAxTG1BT1FMMEJTU1JpRUtlZkQ4?=
 =?utf-8?B?Umo3VVN6MVhadVNNK2lEUSs3amdMVnR6R1ZPS1Fzc0Fvd0RxZVc1K1ZlZ0V3?=
 =?utf-8?B?T2VwdFBuNVVXbGdRNzdadDNrVmtVNjVWdGpmL2ljbWJhZFJSc0UvNmRTdmxF?=
 =?utf-8?B?SU9FZVowZnlQRnd1Qmk1Rk9hRlVUandMa0swNko1eU11YVowaVZ1bXkvQ2o1?=
 =?utf-8?B?Q0ZHOE5ZbkFzQUU1aktCbXp1QXdldENLVVI5V0o1K0RWcklRYjZiNDVGSEVB?=
 =?utf-8?B?Z1lxWENkREpiTGRlK09MWkorZG9WeVI2RUpBSW5Jd1dPYklCT2trOS9IdnJ3?=
 =?utf-8?B?S2FVSG5iNFA4RFQ2cjQ0Z2VYcXZERGpyZFBVTC8rT0ttOVA2K2JBVmRVTThw?=
 =?utf-8?B?R0MzNFpwRWtRMVRVamxZa3JYT3I5bXR1YkdVWkZaVzliOERZMk5POVFLdE1t?=
 =?utf-8?B?T0pwNngxWkpwTEh3MFhidVE2SU9sT2lkcGQrVlpORW5RYWI5MENnQlpOaksw?=
 =?utf-8?B?aDM5QUJwUmVib0FFV3kyc0ZvU2Q3bDJpZzMrNjI2RnZaR2duQUUrZVZGbWh5?=
 =?utf-8?B?ZXY0bXVwWFBOUGpadDdkKy9xdXhZaXRoaHVSYlR4dENISXhQZ3RZOUFOYUdx?=
 =?utf-8?B?NFZYSVYzRGhmaENEak0zRDRNT2NtRlAzTHUvVlpHZ3JLUWtzSkZxU2Ira1J3?=
 =?utf-8?B?QnVoOVBIL0tXc3lJZGY1V3ZQbmtnT1o5VGJnTEg4eVNEMUJ6OFFwS1YyeVN0?=
 =?utf-8?B?OW5wQ09iM3Y5Sy91dmNkVS9hckMyOEFjYVNzMG9YTEtFWmJ5cUwzNHVCdzBq?=
 =?utf-8?Q?/NqN93MSbltA/+SI=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d0abdc-8c81-408e-1361-08de72b61d8a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:32:43.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqJuCJ67gEdG6DNmZAVZDCIlKTsB7rOa+ALMHZSF3howOlVC+Q6AXKNfSdC8LLUVJRZEFbW25hcytS6ab4zpCslBVw0EpjH1o/3YnHcX2Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5585

On 20.02.26 13:27, Daniel Baluta wrote:
> On 2/20/26 13:57, Fabio Estevam wrote:
>> On Fri, Feb 20, 2026 at 8:20 AM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>>> On 2/20/26 12:36, Frieder Schrempf wrote:
>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>
>>>> To make the code more readable, use the macros for the GPIO and IRQ
>>>> settings.
>>>>
>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>>
>>> Typically your Signed-off-by tag should come last so you need to swap S-o-b with R-b tags
>>>
>>> in the commit message above.
>> Is this suggestion valid?
>>
>> Shouldn't the tags appear in chronological order?
> 
> Tools like b4 indeed are taking the tags in chronological order.
> But I always considered that when sending next version you pick all the tags
> 
> and then add your Signed-off-by last.
> 
> E.g https://www.spinics.net/lists/kernel/msg5995225.html

I've always been adding the collected tags below my S-o-b tag. And I've
never heard any complaints from the i.MX subsystem maintainers, so I
assume it is ok like that and there is no need to change anything.

As far as I know most other subsystems also don't have strict rules for
the tag order.
