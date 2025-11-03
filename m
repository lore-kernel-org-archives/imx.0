Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3362264638
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140513; cv=fail; b=FB2TpQ7l7vwWEH0I3gdy14xNzcIdf0g5JdHAgtmkZnI44GFVWKkqronhh5xctZ9e//bOAo8K8OkfPM0QKqzqN86yemnIAhrI/nnObsO/tguC+zSfaSbEueKqR9nLOHDpu8W7XA6bEeM/WXxaNsiaAtO7LsL/dJCxtWXOcmprjg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140513; c=relaxed/simple;
	bh=xD9+zXA5Ql0qGVQJKdn8+kQUbfKXtpFrg3VHzaDyWlw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NzHbcFJUw2bzu94Mn1QDz9fg+6pvNStFo9Ad4BUjw4+hFr52rvu6dxqiOaIvk25WmXOIdSpbuYM8Sh7PorUXsu7pOHW82ajyj3TsoqRDGFiQiRxtUm2Oo35MRuwIby5MC0FdNMubCES7ztnO6RtBfgSKAzm4IKXBGH7o1PkPWVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U5ivGn0g; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U5ivGn0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7asbEo2uV1v1+AVXrwv8c3ElUEcFZ055enCUefl1+tOtxPojpclK5OtqpY2+F6PwXOjZjCvEZxEYg7zX8SYoJtT7jAXaNX9Xz2sjQFY9iz/IaP+ykW+92xXRhK8QgAc9yYlh5riuAJIC7w1gxyKP/VTpGRIaDLbQr3WVcf4QqcfFCY6wN6Ng2J3Hp+yogEaUNf6bUkEjREtkQR2DBuo5uXol8pfglliSDvRhOHqWq6LnBmsOKSjkLU8JpiD7m9jX3G9IKLnjwsLYbSvQefCYPrePSPinU8wApAgPo9Eon0KwtMf2xxPNjsrevHuEeLGm/LqhQVK/5MQv/PX34mJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HimpNGphqrcUUfN2ri8BMNhM2UiKyXmu5LDhPKAb4E4=;
 b=ovPkHwzWAriRezhStNmrg8JYCVVrCtVeQDZbOYfJxLAW8S9BD/8TQCSCvvrZyUsUtwR5Lot583VMXZ7/v7J3jGqa+8TQyceFG8a1YlQkOPXxKGhAqXgQF8XOd4f5R9elIYwJ+ZsTFpJJ+dfxpTxyMoLgVRJAX6lzCkJ370NYkvLjRsk23mNIqDEy0HwFGSH6IYvony8j7joKSgCmggrsmSuzgDfeDTf4kbVFNxkV0bIuvl209O8jq4cCSDHihDkHOU5R+TBuk4A48Oh99Gswo9dpyBrPQf+WMti0MmXVsf611g02Xvo3DNJ3mAYf2xXjfLt0IX4xpBegbsDz/QZ8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HimpNGphqrcUUfN2ri8BMNhM2UiKyXmu5LDhPKAb4E4=;
 b=U5ivGn0gHIewLih8pRw4qZJGsWdn9nGgjyr+pMhoyyxvnZZdPcm7NXlIIAmbQ4e9ktR5PA720XtNqX3BIvLAId1Lvahdm1f1PwOFezrO8c8FACJhseKcU70xdN9oZKIAb+jMClaD8DInkQ4/5UP9q8tpMHC1nbJvMImS8zwnZNM2+6BNogbcsFvL4M6jQBqP3b6zUVkr33nGxXVmEEgUFYoLSuX3oSXgoiDHzJ4ZDoDgUfCjTON9XXJGeCVTsv6AN1PfzyuwoRdAQT8YO+5bdm/FuraaBsFxWxU+XyoPYG3OKi5Dk+MITMG0N5sStHrRjEBMYQVaijazYR0otiVv9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DU2PR04MB8744.eurprd04.prod.outlook.com (2603:10a6:10:2e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 03:27:10 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 03:27:10 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH 0/3] regulator: pf9453: optimize PMIC PF9453 driver
Date: Mon, 03 Nov 2025 11:26:46 +0800
Message-Id: <20251103-b4-next-pf9453-v1-0-a025d536eee1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYgCGkC/3XMyw7CIBCF4VdpZu0Yht5sV76H6aLgYFkIBJqmp
 uHdxe5d/ic53wGJo+UEY3VA5M0m610JulSgl9m9GO2zNEghWyJRo2rQ8b5iMEPT1qgHczOqY6F
 JQDmFyMbuJ/iYSi82rT5+Tn+j3/qX2ggFdtQqPSvRy765uz1ctX/DlHP+AhlKPGWqAAAA
X-Change-ID: 20251103-b4-next-pf9453-c9f8fb6e0c10
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DU2PR04MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: f5128d96-efd8-4689-225d-08de1a88df7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anRyRC93UjhVekhodjJmZGNSS0xIbEhTUWdZakZGcVBDYkt2eUZZaVdCUUdv?=
 =?utf-8?B?eWU4aHFsWnpjaC93S3phYXdsalZ1YW93b05KU2Rvbld4ZGVuaDdkRktCbWRY?=
 =?utf-8?B?ZWpvdXlkSTVFQ01EanFjZndSSTVmdURrS1RCNGx2dHpKRkJwN0NXYmdpbHE3?=
 =?utf-8?B?d0h0UHk5M0NUQmw4WC9EU085emQzajYvbkNoeFZFQldlK2RCNi8yenRIeFpq?=
 =?utf-8?B?QitjZDAvYmNMY2YxcWhGN09ld2VxN21QMlFwMDg5U1F2VEdRaW52T0ZCdjV0?=
 =?utf-8?B?OFRjMTFzcGRpM09jNW9BWThzODJveDVUU3BjVk9uOTd1N1MrRDVZell6bnVL?=
 =?utf-8?B?bVdpaGpaZTlQZkx5eFVQbUNKYy81WEZTalNzNno2aFRRU2dMM0Q1amJNc1ZB?=
 =?utf-8?B?ZzlKbFN0NTNvRTNYTlZsS21PZ0FyRkorc0hqdWliQ0Y4eUZ3U3FJdWtqT3pJ?=
 =?utf-8?B?b3llWmh4cnVQZTZxQkcxaE9KK2pxSHhlbitpSE05bWxEM1UwUnB3b0E1WUhz?=
 =?utf-8?B?MDU5VWlWai8zKzFnWDVsK2FXRVV4REpLNzR3RDJVbEFxSW5iUlJFcnFHZFZG?=
 =?utf-8?B?ZnV4dkh6OUNTQ3pkTWVoNXNrb2VNRUdXL3NjT0pnNE5lNXJDUEU0MlVJcU91?=
 =?utf-8?B?NUIyazhuSllONGdNZEVDWFBRd21CQ3FOZkZaUDR4aE0vMzVrMnI0UGJLOVha?=
 =?utf-8?B?UGFET0FRdHg5Uzd6dXR3VWxYUkNnbDU3aU1JdFB5Vms4TkpoUTVqNzFBemhU?=
 =?utf-8?B?YS9OV0V1V1pZL1Rjd2s4SHg5OHI4NTh6YzV6bkVCaDF5MTFYbElUM0JzSEhZ?=
 =?utf-8?B?Yktpa0ZWZzYrcDBPZFAxSWtXZHVhYmwxWStwWmNTeUllUmVXQUw4eUtKNklF?=
 =?utf-8?B?VU1WRFlRNjZVQWU1dzV5cFhuendPY3VOdGl5WXU0YlI2Q1B3WXduZ29HRjlE?=
 =?utf-8?B?bXNjc2NvZXdKWVhJaEs3alJyRS9LZjFOamY5NGkveER6U21NUFZxN1pmS1Y1?=
 =?utf-8?B?YVhJWjRsVDBGdmZOcklWUVRyL2JjVWU3dG5XQmdrcmlIZFp5cytrM2VjcjVv?=
 =?utf-8?B?RzhTMFdlNDZKS2Z3eTdSVGpkYjBFcSs0SDFkT084NWVFRWUxQkFrMGF2YkEw?=
 =?utf-8?B?TmFVZlFUWlBLZWVEU21IZWZzdXhPSU1EOWZLZVNuR01MWjJOWTRoZXloRTlV?=
 =?utf-8?B?dlJHTkJhY1FWOXkyc2lhSmphWlRodVdHVnZvRWVWNDFIYjZmcGxURU5tY01n?=
 =?utf-8?B?SUpscm9ScW9TUkVYN1hMYjR6dm5MM0RtSjNWTXQ4RzZ5L2tzQW1KRjhqM2xX?=
 =?utf-8?B?R29rS3ZZbklGaXk5VENlUENmU3lJZkhYUjhPK0MvcHBGMi9UdGhmS0t2WmJI?=
 =?utf-8?B?TUlWd2xOYlprdFNYaXNrQlF3QnZZU0FRVjRuNVk4clVyUlh2UUVqU1J1UVph?=
 =?utf-8?B?S2VET290QjdxR2Y3T1h4ckpPcFdDMFltUW9uMmtDRTdUTWZhK25mZXpuYzNZ?=
 =?utf-8?B?WjNpSlZwT1psZEJ3MlRoZ1dnZzMxQ3R0M0ZZNUR6ZUQxRnUzRy90NlNXbEE4?=
 =?utf-8?B?OUk4alBYZXdTdjMyN0JKY2pOUmhPMTZzTWpDelZuOHZac1dWSFIzNnVPMEd1?=
 =?utf-8?B?UENRalZ2bzNLSU9WNHVtNnhkYUY5WHBCTXh3dnNlSHVsbTBUWVVTUEVya2VN?=
 =?utf-8?B?cXpEbm9XTXNTck1LNWM4ajFqa0tSRG8wTy8vdVAwVEtVbGd1Ny96OWg4UjBy?=
 =?utf-8?B?dUgvQjN3bnBKOFJ4ZVBSemsrWCtGVU1nSGlMa2JjRjJCTER0OVRvOUxmeG93?=
 =?utf-8?B?Q3JSdW41ZXVscWtJR3gxREtGMEcxdHZkRzlnZVgva3lYMnZ5eXRuVzdETzFs?=
 =?utf-8?B?WlUvOE9mQXMxWWY0bFUvZFNSR3A4b0MzSW9nRm5mV0Y5cWViZkJVWE9QUzly?=
 =?utf-8?B?MG9GNUhaM2NOd0MrNHNoZ0crR2d2MGF0NjkzQUYrUUxsT1lYTGFrVDQ5akNa?=
 =?utf-8?B?TU1KQlNGRmlUOUtFYk9sY0hIWkwzdlp6Ri9ZdlM2Rnhkbnk3QVAwZTdSZW45?=
 =?utf-8?Q?XL0+uj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTR0NGhKeWFHWStrb1RTcDNHZUJsd0pQaEdLam91OWtqc2FORm1pTGNTL3Rw?=
 =?utf-8?B?WkhOUVdQUUQvOGs4OXZjSjl4RE1GT3hNNHAyRldocE9BODZ6MEV3YUFPSjJa?=
 =?utf-8?B?RGNZMmxCTDN5UGY5eHE3a0ZrbXFXZ2VQY1Z5N2dzb09SQnBSV3NRc3FQK29x?=
 =?utf-8?B?UVhWZWdDOEJoenhnM29ydmVRV2kvaVpNQTdZRFZOUDFhd3grd0VxcDBEbDZQ?=
 =?utf-8?B?cTFvRXovRGpvQ3MwR1hmME1Dc09JZWcyMFhnZ29tV3QwajZJeXJaNGkyQ1hi?=
 =?utf-8?B?QjNNSFVkcUh0TEZyWXRkd1VnMGFnOHRPUzY3aFFHNUlaTmVTUE5hdHVLM0o2?=
 =?utf-8?B?Y1R3ZFVIcmFSRHQwYStZTm1vUzZMV1JpQkgzUk9lUER1N0FZNkJHSTRNZXpF?=
 =?utf-8?B?eG04UGVQSENtVFRFb1o0TCszUURPNG5VNTR3ME9wRXRSaHNoR2doNWwvTGpQ?=
 =?utf-8?B?YlJHZXR5VHh2c3FvZWFweko4dHQyNy8vRURsUGIxRnY3ZzI3TmczNG1RMHVh?=
 =?utf-8?B?R21lY3J6b1Z5Uk9MbVFadTl1K1NLMFpKMzcxYmljMmtybWY4SzQvb0g2ZUty?=
 =?utf-8?B?WUVLVi9VeThlV2MzblBWNDQxTTZrK1RWTHQ3aVk0NW8vdEpuV29YS2twMGtz?=
 =?utf-8?B?RkhuMjJpaWhsekcvcFRjZjBibDdhcFdsL3lWa2NGTjZyYWEyOHIyd01NVUpn?=
 =?utf-8?B?cXAwVHFkS0VqakpjNjliL2FiQytHaVNIdWFjRmduU05pOVJBVWlBTnJFMFd5?=
 =?utf-8?B?ZFo5VldjV3NQVmVtZEVJUkVyc3F5empzOVlIdGdtbFRSUlI1NFo2SzdpaDM2?=
 =?utf-8?B?T3lGNG5panA2RXdzVzVrSURTTGQzdE1Ham9UdDJJS3M4S2Y0aGkxQWlUV0ZK?=
 =?utf-8?B?cnFMMDJVWThPYzVxaVlJMHp2dkxLQTNLNlhDL1JtdThtdDUxNzVjOHRIeXBE?=
 =?utf-8?B?UmlBdzkzWEFqWTNhaEVnbjRRdVk4Vzh6WW00R28rV0d4MmtuZkkwSnRkbC9u?=
 =?utf-8?B?UldhNmtpSFN5SUZ5dld5NE1RTTdpY2g5N2hoVmR4OEtqZ2Z0SHEvemJVbXVP?=
 =?utf-8?B?YUN6SjYvanNIcThWa0VqRmlkOTZkOXJMaTlHZUZwM0pIU1djNFZGOERQSnlu?=
 =?utf-8?B?RVB3bVBHZVZwSGpTbFFVcEk1TDlrS0J1TlNGcTA0OEE1T0lNeUJJNjFXdGNQ?=
 =?utf-8?B?YXFCbkxUSjBiSXdQbjN4TVJiTld1UEN3SEtVVDlkaCtEN2NlSWp2QTVmSXpK?=
 =?utf-8?B?WWdzcGE0QWczMGhLNzJVTDEwRGVXa1d4cEZJT3RLY0duVHdDaTZlYlJKSCs3?=
 =?utf-8?B?NitlV0dIbnlaeEk5dVFCc2Rnd204TjRaL3laTHA4VlBtcEZJaTFnc05oKy9h?=
 =?utf-8?B?REYzeVMrN0tCeE5iL3ZpelBVenFOWk9wTUFBQmRsQ3FCQkt2amdYS0JOb0dP?=
 =?utf-8?B?NWR3anF1N2dKSkRud0wrUDcxTlVBVW9TNkdGQ2Z3elRRZkxHUHp0cjJLb2pB?=
 =?utf-8?B?cEFYWVZHTVkyVk4vamhHYmFzWGtpcXdVem00bGFjUDFYNWIzam0vb3lxSnR0?=
 =?utf-8?B?L3grL3R5bnIrWjhqWUNSMkJsclQyaCtoWHRiZFRCd2NCRTUzaFVTWGlRY1dD?=
 =?utf-8?B?R3UyZ1FweWgyL0tSZW5HZmdPMEhPVjJmdXgzMnlWd0FsM1FPY0NUc3NGd0hp?=
 =?utf-8?B?NEFJTDVLVUYwTTBxTW51UXd3MjVLT0t5ZHZ1RWdjNUlzRlBXZjFuZGNWaHdI?=
 =?utf-8?B?QUI3UDdTd2hsV1pTTWhCeHpENDZ2MXhtclhwbGFvN0ViUUJWV28rYWNsN20v?=
 =?utf-8?B?QjNIWHhnWHNkOTdVS05PQVFkUWVOQ0JRbXUweEg0MEo2RVcwTU94Q0FUTUVK?=
 =?utf-8?B?WmtZNTdId0VZaFVFZW0yR2hKVUxuNG82SHY0UHNTbGU4UWdOZ2s3Q3dmTkpJ?=
 =?utf-8?B?ZzhFUC9xUGk5eGdmaEJXbDcyVHdXM2tGWFo4dkFRemlURUdWdTVIVmxGVHEy?=
 =?utf-8?B?YUMwcXVKQ0F3Q2QxSHQ2bmRieHh5dDV6L2FydzVzaEdTRHdFNUpyZDFjSk9V?=
 =?utf-8?B?SER4WmM1Q2RoSlVrU0dCWDI1SWx6S1BHQmNoN01CdnB3cWp3U2FoRUVnSHpx?=
 =?utf-8?Q?ZMXFb3y7zXz/H+Z5KFz49UrkD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5128d96-efd8-4689-225d-08de1a88df7e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 03:27:10.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NvTagvrwWE90rLTfm8rHYVHRCe6DMYdmCHCjnFjUA69LToIO2U+eJXie/KuK2II
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8744

For the details, please check the patch commit log.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Joy Zou (3):
      regulator: pf9453: change the device ID register address
      regulator: pf9453: remove low power mode
      regulator: pf9453: remove unused I2C_LT register

 drivers/regulator/pf9453-regulator.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)
---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20251103-b4-next-pf9453-c9f8fb6e0c10

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

