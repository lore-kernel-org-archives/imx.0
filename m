Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA81C689D
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726672069; cv=fail; b=I/4qAm/U6Sg2lNVr0p3tZEMqHe3e9JGE9zxM00i/0VTAEwL94VSMNVvMejzKXWs55DMFXu1ziwNpcUydx0TvA8CsLlpOywp3Yh4a2woeg6PIiVjG1jIiwpragmppUs5z9VVa95YUj+Fi9/kg+GWfa2+yowasmNpZNZ1q7OSY3N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726672069; c=relaxed/simple;
	bh=Q+vt3rrWmlHuEcWxxa6/fKt0AcA9Bc7dhQR3maPGQzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GmbaoK/QeGLo1CnHZL9w1+Gx7SeRyV/xgnC0ag838AzM9XETFZ9Ap7xqWGhniMtR7oG1GQ/hYCjzEjLPaFY7HcRbGaG1jQePMKqrxxCZCcY3mduRC0uS7DFPst67qsgf3gpPre84CQmFbybaSmClyKvL923PziQ0QtYDTCwfHr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aBeCVbsX; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aBeCVbsX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC0MWCZeV2tiMSoLv2027HdOPAzpGKhSzjt81Raif58Hjj0NM0ZJEb7tLlDfiyRwI9YHLk6O7RwPJgmRgWp8+GoMVY9lHvnkBAJdQYwx6eh/f71u2XyFZWDwFLcJcbQZ9AZ+qKk2gB7XdcnmJEbBVAN3YkwKyQoL0Gai1hL9D2YO8tDp0OEBnpIFPFGPqoHdy00Z7DJ4W1cdOzeBtubkMH/3/IR55bo1qkgVbfwEL0sTphhspSu+gN8EEwatwdsI01YwemBDaWvmzbZSX/FZV9OjsF/FV6J930uW1wkDl/dEsm/kFuOhK0FrhUxHuAR9PcKTnvf2SoUDuNg23pKdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RUwXZroO1+W0uypUXN6ewN0l3Ml+lW3RJ3qyzYlV8Q=;
 b=XWcPPNF2PqMZAsYGdCRURmNzJYyFTPluVZ6nKMq+oowjVYkupw1pzqxoBw+7m8AOuK8ZOQCL1DnTsYXkBhH9N3YYpN9rA2q8LfqMtCZ0ziT89n+phykc+HvtstPCdo4sI0rBNDRE8NvjXAbYUggWndgUjQtayi/kSUOQpK86CpeiXKILMtDxItqB4R6f1IZHcbULZFELD+RZ6lWrqVx0xGV+dqRRgxKSaEsKhTpZ7wWCaj5bHMDCFvSDOrE0k+x4gz8hjcqe7ZSQGoddDZpBdL1YEAWOyFHjKhaJC3DY7L4zDNggDVAR9b/gS9e/Wk+iYMqq13riAG7ZPXVh9LI8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RUwXZroO1+W0uypUXN6ewN0l3Ml+lW3RJ3qyzYlV8Q=;
 b=aBeCVbsXXXP7OqKwwTC3B8WNYNbH1zH40uCwjn4soUvHeBoaZDGQnevwUSMplrCB486fJH3ti+Yv72jwzlr9Zb5G26FYysLrArQYYwtXFzqOBB4WI8NqkSK1bHwkPflHGPZO/ZzLC6Xu9gZiNUkXJhldIG+z7/aeTl1PPm4/9JYCCQ9eScIAsvpxkYa36bNQ9t4/C2NLBIOWbAMWTFgP1+eo6k9rDzr8M2urSQDOJMVYQjqGhnDQNxjJTAm4pwg7HRjW9XXrWALp+b+Yul//dhzWNl6tHy425NCMi647M3wgOKCbH9O5a0eqBp3nyS0eyqBLjck53xbT0JAzRC+/Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10479.eurprd04.prod.outlook.com (2603:10a6:150:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 15:07:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 15:07:42 +0000
Date: Wed, 18 Sep 2024 11:07:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org,
	robh@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Subject: Re: Device tree node order sort tool
Message-ID: <ZurstMFJ4ZCFhZT6@lizhi-Precision-Tower-5810>
References: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
 <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>
 <20240918-igloo-unspoken-45443a52e338@squawk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918-igloo-unspoken-45443a52e338@squawk>
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10479:EE_
X-MS-Office365-Filtering-Correlation-Id: a877008a-e9ec-4483-41d5-08dcd7f3a49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEtYc21RNVk1QkZ3aXkwSldhcHU2NFRZbEZIemt3ZC9RR1VMQUFkY3NzVEFN?=
 =?utf-8?B?azZzc2dpbjBrTnJiQ1dkT1R0OUtOMEl5QWw0c1pYejROWE13RWYxU0QvcUMv?=
 =?utf-8?B?YjU0ZWRlVzJ4RzViZXhCTnRHZ3haMk90ckFpUm02WEQ1cEpFbGFvUXFsQ0tR?=
 =?utf-8?B?Nm15dkRBSHQydUEva3IxY2hVUURaL29POTczMDZBTWpuSzYrZnZHV2diRDE3?=
 =?utf-8?B?bXM1SFJIdU9qTUJxQnpSRkRqNjZvNmw3NUk4aGxXeTVzcFBpY1RDVVpsSGFx?=
 =?utf-8?B?OXluaXY3RXJXL3lMdVFydWJBL2RtTnZ3VlZHNGpXWllpd01oeHAxamtlbnhY?=
 =?utf-8?B?Q3BlcWlucFdPbkJoM3U3RG5qaDFuU2xralRTK2dwSDcrdmNCUUJmK3l6b1ZV?=
 =?utf-8?B?NDFWY1BPWDNXR3g0SDR3YUxENnZUNkRxMWlQTmdWcytNNWtYYitZNHd2OWJX?=
 =?utf-8?B?QlI2VFVNblZtNXlsa3lHaXZkamlNa1I2a1FzcG9LRGtKQ0lmSzZLemxITTBt?=
 =?utf-8?B?em9aTnB6MWRTTEtIeklGL3BWb0ZPZk5DOGtzcVJ3bjYxeFUxY0N5a1VxZDhV?=
 =?utf-8?B?Q2UxSitFWFNnSldXWDRPRnIxMmhCUC82QjZyM2tVUnhrTGdueEFHM0E1ZTRl?=
 =?utf-8?B?cTNmMzJLSmgyOEFEZmM1TlBHU3AwNHZnd3dxNXRVY1pZN0t3WVcrd2JCczNr?=
 =?utf-8?B?aHlDdGRGc1I0dDBSdkZ2R2Q4a3dIQXlQbFhDSlczTG1MUmcyR3FVR2t2bzhx?=
 =?utf-8?B?bDJxbCtBd0RPVDlKUFRsVDhlam5vSHJyb1I1UGlHeXZ0THlUZ1J5bktZYmhK?=
 =?utf-8?B?L2FwQXZJMzlzd0diK2V4cTFmK1phdllkN3FORW91R0xTTEJKVkRjV3h6dG0w?=
 =?utf-8?B?OG5rbWtnV3NybS9XYlRVV1RLL3dETVZ1bXkrY2VOSG41aW1QZWV6REVub0tK?=
 =?utf-8?B?QzJKNkpYemhCYkludlRNZEJUR1laSmQ4Ync2RmprVXU4eEVFK2M0TkpURHg0?=
 =?utf-8?B?MzlFeW1qbVNlNG5DSEdpTitYcVExbG9LZ05XNXpuZmpFb2JqaWF1WFlROVUz?=
 =?utf-8?B?M1RBWDZ3WjlnYXZRcXZhVlNqYzRyV2NqaGY2YWplZmFZN1lRN1llZXpOVERW?=
 =?utf-8?B?VDdkOU8ySi9waGZmNEEydTU4MmFqUk9tZWRIZWRUQmlCLzA4S1ZIZmJWNzRz?=
 =?utf-8?B?aDR0WHJ0eTN0RCtrU0ZzOGFVbmRqU3AvMzZqOU8yb21VUzRSYkZKRnhTWjRT?=
 =?utf-8?B?OWR2LzhQWGlkYnhkNFJOaE1DcDJjMDY0L3hOMERFbzJiZFhmK2gvZjVQUTN4?=
 =?utf-8?B?SWJBVmd5Z0VKeEdGeFh1ZHZWWWlhVmdBZElEbmhMVUU1cC8vQ1lJNXFlQmdm?=
 =?utf-8?B?SHJDbmx3RFozMzl0emY4bTlrcGwzS0ZlelRTbXRXK1FDZjFFN1hYQzBIY21u?=
 =?utf-8?B?bExuRE4xVXZrU1JiMEIvUzNrcVNTTmdIa0N2Q2RUbnFDdFFrWGUzZTJWeUVw?=
 =?utf-8?B?MXZ4aVVhbFNXTDQ0VkljSzJGam1GRE83M0dpMzVDTWNVZGlkcEhWNmN1Rmlz?=
 =?utf-8?B?Rlg0UFRZSG9JazVXRUtLeWhsUkx4Mys0cDVReDZWM0cvZytTR1ljVEt1Y0xq?=
 =?utf-8?B?ZkdwVE5rbDk2UW90WUE0citPWXlNZGI3OGF4NVVXZ20rNXlJeTd6Sm5ZZ0h3?=
 =?utf-8?B?a2EwZExnL3IrZ0xMOGppaTNQanlKVEJhYWdFd1k2aDF1emNVN1l3cCtWc1k1?=
 =?utf-8?B?Z1ZiR0ZHUTFNdHB5NzIwUGZxRVE1UmNWWDJBZlZGMHRZR0xTbjA3b29mOVlk?=
 =?utf-8?B?c2NLV1pSY1djdDlPSXdJSW4rVFVDdjBrNVQxT3JDSzFTemRXUFFTZVZjUHdn?=
 =?utf-8?B?d0kyYjErYVpMWHlkOFkzemR5VnFZOTZYdVprTUNGUndTakE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHF6eThKT1FoZ3BDTWhYdTk5RnpNOHZGd3dxcGVhak9JYkhocGJVallWeTlQ?=
 =?utf-8?B?OEV2d1N5dmJ3d3lSZHlTL1lONXBDc3VWczR0UXVsMVZwZmFUUXplUkRXWk1W?=
 =?utf-8?B?VTlpc1NvUHpqdlpLcGFqT2twR2w0MGZTeVlnVWVLMmtPRjhjSlIwWGhkY1RD?=
 =?utf-8?B?OFJmdU01TzU1NVcrM1JtV01DczZSZWFhdFY3MEtkdXlUekJwbFRLZnlJZzJS?=
 =?utf-8?B?eXkzUlN6aUZkMkxWU0ppUjcyVVVQamU4M2dGWkVJM1ZoRXpUZkF3aFNicmFF?=
 =?utf-8?B?WDZpOFlObXJkL2ptTklOUExqbDFmanNBOUZBeXo3WGVRMnloanNweGVlemNs?=
 =?utf-8?B?T1Q3ZDVRakM2UjNBSWNIc29jOEYwT0U5WndscVhscmN3Y0QyTERNUXdMMEg0?=
 =?utf-8?B?bndLdHIwaVVaQzk0b0tuYWhaRzlGbE81ZXZwRDdxblBPV2lRUU1GZ0VHSnE3?=
 =?utf-8?B?VmRWMTlnWlpQVW1zdlpWZU1YbVBRQUhVQmtENnIvT1dnUDRmZnFqQnNla1l4?=
 =?utf-8?B?dG00d1Q1SDU2NHJRbHB1aE84TDhFUHJMZFpqOXJ6VTc0ajZJVjFCWmkxUFhn?=
 =?utf-8?B?MXk0MHkzUTF6NXVRSzBIaUw5V1gyaVlPUitXMXBLK2dsaVY4T1hsUkJTOWkw?=
 =?utf-8?B?MVUzdEVpTlF0Y3p0VEJBUFVrUExwR00vb1ZvR0V3ek42N0hDNVNRZkdEcThP?=
 =?utf-8?B?dWhHOVNoMS9iMmdENlMzNHNBOGFldXcveVNvVDc2WjlOM1NFVytLdHdaMytX?=
 =?utf-8?B?TWxENmxGeDVBU3Zpa2M3ak9jaVNwcm9UWnhhcU5GL2FNTk1xSitpNnZXSHln?=
 =?utf-8?B?U3lOZzBxbHloZEpva2ZrZWs0bXM2UzRycUFRT0JIMW05LzZxakpScm44QzFE?=
 =?utf-8?B?dGhFSVZ4c2xseVhCTUErNEVMbDdhaGp3VitVSk1LK0pVZlVIQW9qY0Q3VW9u?=
 =?utf-8?B?MHRUTTk4Q29vT2ljOVI5V09VWStDYnZnbG9tVWRKNkxFMGwxVGpyd1hJcElN?=
 =?utf-8?B?dVNkN05LalJPVGJ5QkZWSm1zYkJ3aUYrVExwVWJ1dC9KYjluQyszMjF4ZlVC?=
 =?utf-8?B?Z0doT2t3NzNteFdQUE5uYW1SWitlcUx4bm8yUzJEOFJEalUvSW12WVNYcFE4?=
 =?utf-8?B?UktiN2pZa1hKK1VaMDBkbHZMVWt2Wi8yTGF2VmdpajJVNFpXZ3Qzb2hHQzNj?=
 =?utf-8?B?RTEyYUxiN3E2NlY1cG0xUTBJU0ZZQ1pyTkRTOGV2am1GNFVOYWhDc0JoZUtU?=
 =?utf-8?B?eVpPTmVwV2xnaDhIRUZ2YmxZQXRmcVBRMmZzZjZleXhEeVNYRitsd1ROU3Qy?=
 =?utf-8?B?ZThkUUhrY2lHdnFGL2l2dVZrM0NTN0FqWktieUU3Y1BlVUJXTkdzVU92a3Jn?=
 =?utf-8?B?VjNpdzRlVmtsV014bmROQU9XczBUVFpmdWYyaS9jbHhHZktuM3h2d0RvZE5Y?=
 =?utf-8?B?ZHJ1Rkp1OXBFVDB4QWxxWmVQeklCSkpzWEx2QXBXZ0hnVWhWK3VKek45bkRu?=
 =?utf-8?B?aXJYTXRtdE1MUUVyMGdoeHNZYUFEdWJJWHZaWUhHVDNrUVdoVVQ4VEZTTXhs?=
 =?utf-8?B?aGdyckJ1MGZpQXllZ0Q0R0o0Z3QyeGF3d3lYc3NiRE0xR0FKMXpnbytkOTJN?=
 =?utf-8?B?N2RyQnFiS3ZNa1dXQ3lFM3M5Zm1VbDZiVUNzM1pyQytjNjBHalpVQ1h2emdM?=
 =?utf-8?B?WkJNOU10RGxrWFdGbG5ydnMzTzhMOHpuS0NwYlBWbHBHZDEvMFVNbm52TS9o?=
 =?utf-8?B?alBRcTRZbUNYS3hmN1JUSDNPbUpXYUhiWnZ0Y28rUFloU21lUHVDcVJsQW9Y?=
 =?utf-8?B?aWVGMU03RTNXaEt6R080NlNjTFlOM0dlbkJaUnI5eDAybGlMcTE2VUlPM0dH?=
 =?utf-8?B?dHlDVC85SW14L3FZQVJ3VHVOWkk2eUV0UzJ6d094dkYzUzVrOG9VY0VETUha?=
 =?utf-8?B?bENDK25wUFN0ZHFlOEF4Nk5YSm9oeHRURWFzVHI0Qm1DVmw3NWpZZ1lNQlpy?=
 =?utf-8?B?OG8rNTZzR0Q5amhtcW9nZE52bUpyZnNkdXh6UnE5ajhCSzlDemYyZ0hUaEZv?=
 =?utf-8?B?VzhvaXZZM2J3T2hlRU9GNVhGK2htTkVpa1hGdVlhcTBMdVZ1c0dhZ0VwZUw5?=
 =?utf-8?Q?umCFYubTwXERaaNPH4Ewg26ZY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a877008a-e9ec-4483-41d5-08dcd7f3a49c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 15:07:41.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YeTUKpJb9PyuPtPTTJB/BEpmMDYgc77j1W93a+ZljgZTEw7OpkikSkz054L0ITKwEJW9KdzSvEBffS7KY3rEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10479

On Wed, Sep 18, 2024 at 09:17:37AM +0100, Conor Dooley wrote:
> On Wed, Sep 18, 2024 at 10:03:32AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Sep 17, 2024 at 11:43:53AM -0400, Frank Li wrote:
> > > All:
> > > 	I write a simple tools to sort device tree to make sure nodes and
> > > properties sort as correct order.
> > > 	https://github.com/lznuaa/dt-format
> > >
> > > 	There are many dt files, which have node order trivial issue, when
> > > try to upstream. To reduce reviewer's time, dt-format can help correct the
> > > order.
> > >
> >
> > Hey Frank,
> >
> > Cool idea!
>
> I concur, it is a useful idea.
>
> > > 	I just want to make sure my understand about node order is correct.
> > >
> > > 	Rule 1: node@hexvalue,  	order by hexvalue
> > > 	Rule 2: label: node,  		order by node name
> > > 	Rule 3: node, 			order by node name
> > > 	Rule 3: &label			order by label
> >
> > Some subsystems have different ordering, like expressed in DTS coding
> > style:
> > 1. DTS: keep order of DTSI file
> > 2. DTSI: group similar nodes together (e.g. serial engines).
>
> I think it's fine to pick whatever is used by іmx/nxp and start with
> that style, get something working and then decide based on whether or
> not there are many users (or interest) if it is worth allowing the
> "style" to be configured.
>
> >
> > > 	Rule 4: children node already after property
> > > 	Rule 5: "status" always is last one.
> > > 	Rule 6: property order as below list[unfinished], otherwise, order
> > > 	        by name.
> > >
> > > compatible
> > > reg
> > > reg-names
> > > ranges
> >
> > Up to here everything above seems about right, except above caveats.
> >
> > > #interrupt-cells
> > > interrupt-controller
> > > interrupts
> > > interrupt-names
> > > #gpio-cells
> > > gpio-controller
> > > gpio-ranges
> > > #address-cells
> > > #size-cells
> > > clocks
> > > clock-names
> > > assigned-clocks
> > > assigned-clock-parents
> > > assigned-clock-rates
> > > dmas
> > > dma-names
> >
> > I don't think we have defined order for these.

It should be good for less special case. I got some comments during dts
review such as

	#gpio-cells just before gpio-controller, the same as
#interrupt-cells before interrupt-controller.
	*-names after *.

	Does above rule is widely adaptive?

Frank

>
> We may not, but I don't think there's anything wrong with the order that
> Frank has chosen here being a ‶default".
> That said, I'd not enjoy getting a bunch of patches for the platforms
> that I maintain redoing things in this order, so it is worth asking the
> platform maintainer for their take on whether it should be used for
> anything other than new code, before sending a rake of patches.

At beginning, I just want to compare upstream dts and downstream dts
easily. I supposed just help new code.

>
> Cheers,
> Conor.


