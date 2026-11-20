Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172739;
	b=o6/57uaqPhVDxUiKzPemoklB741GIVp3/TbVMVaRRSKNoOsFNNUiJ6LkgPRsZuUfaUv1
	 NJb8XNzFmtQAsVMxvyRGVLS8JAyq35aeh0xawHvdN+M4Ms2BR6X1v4oAT7s9dZkQ9MrW7
	 x1rx68ogLeTvywAZxf6ceaOR4c1gR/Otbg3O9jfjP8frp+yqrfsoivq7KzXxDBC1/VdV/
	 xzbtGSXp4nVm46fZhReFKG7HFQRdHAt4SfhRHnEtZLyth3UiECYR6Kf835Tpp92PloNZx
	 OkTVN9mxSF/5lPLodDNQjdNdNeJqc8RjVmuSsbMFP8e/YiUXZGMsBib/WgBltDiR5Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172739;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IzhSU0zfcerLH/CrJS/0v8U75yd0W/rOP1frjaGVqlg=;
	b=jPr+C2j31qvXN7+OnHGhV08qdcCNrMHCBP825SLeudShwpumlYXuuAeWXAHW4NIhN4Uk
	 xr2l44DgoCYVJwXwwjC5FlA0C749pDXDGPy+K2nQgOSlqzsroWTzPswiauFJBde/h4Yom
	 6vrSEKuyndogQEdEm9350GKCU5HhqtXQPwbfmidxmD3Q+UfZYwH+HChAymqyhtUrJF1qP
	 4tI3VK8r2C80Ht+G0fnXY0YYewiQo8IpEYxojx31gjEbiWyDom0x3G96xpsWIuUC4RLnB
	 DlriL41at7wNRdRgrs8fVGlhw2uMFS1tTtUn4f7jbFQIt/fRVmzfTN1IF0gIrF8cSOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ULCXBMZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.68
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CEA60A2614
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 11:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CEA60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ULCXBMZa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJIF5blcnrcYWXZteoBGHz3kxXSyKik/0H2XUu7d2iaJvQ20pQA5d2SlSxWF4IGSUdrfDJ0k3JOEJPLzWX50+Hbz14xM1wgt6NgEEh+z+XG/szcj26f7dvHou7OruxF4h5uSj6xGOjGG6znMlJjDSe1NRO5UBCUjj3QdijfqqED7lZzP3t9e78ZWDJvkQZwuts30yaMJGGVTw1Sz98MTPzzTg+6dWIBm6gWekMaK5XVeZLpnoD4UHuQH44NzNuiDqXLuHhxJ7U/Sz0JozOOYxLX1JVqa/VX3mJBFQIaw6A7X6AFdgqHHw6D2cE83oloWXXBRyQ3Y10E6cn0fdiOu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzhSU0zfcerLH/CrJS/0v8U75yd0W/rOP1frjaGVqlg=;
 b=QZQ4sl+BlPZBGGhehtU2Np9hxo4WCSuCaHIUXcOR5L4D2ER3QezxqEKvb73/FVFaucQmOOR+XBAwZl3o2LAxen6aHB+oJaYfgrOgGiAhrxZ1/JPvz0T3hRXCR15L+edF7Flckg1Y7dkk6wbcA6KYG8htKmAqUve5xseUJNfhyWdm8UC9Ek/w+wPNge7OyrQcTnL8B9kl6/YYzvgFbKaa8F1FNVW4NTClVIc9m23GjcyVmDKknsSI6eZ9Mr8JgiekE0xa2Vfaszl9symBUtePH4WZ5LV5o/aYRJgJLnUk1vgQsibVpWAiS2zm8DaA3gI/kGEIhgzrNAPJtMH8xI6Q6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzhSU0zfcerLH/CrJS/0v8U75yd0W/rOP1frjaGVqlg=;
 b=ULCXBMZahukGD6Dxo+/qv8gEx1R0zq4E0nnnz6sAm0YP8DszUupPIEhh5L8LrlZxB0IEhZ0L22duB6jJp1xY1HQ2bDkFiq4gQcd8VRi9lwHVfN0eX8l7rL3Q5TSzk08CYtfNThxXXiWcA/1f/ttJspTaF7JWnRqE5D/vywQ7ojuqw8/SSRqAZnnraqVsnYFhx474/AmNDl7c8pdeKtDZiWQK8i2rJAx43/fIo+v9Nz6hjqLIRTxemPt/TRR2zxaz2n924VCZu+HrOc+yKvG50FyDhww7ocz8s/mrgjKv5oh6PmvM3yVkn1mVgONOqUGJ+Oh9yk3A0+8EkmWuqnN1rw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:05:35 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:05:35 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 20 Nov 2026 19:09:50 +0800
Subject: [PATCH v2 3/3] arm64: dts: freescale: add i.MX937 FRDM board
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-imx937-frdm-v2-3-5e27ceec02df@oss.nxp.com>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|MMZPR04MB400504:EE_
X-MS-Office365-Filtering-Correlation-Id: 924b0bd1-591c-418f-e3b8-08df46f633d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|921020|10067099003|261021121427099003|11063799006|260925022911599003|260925021311599003|260925021911599003|56012099006|261022075727099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9mr5DacyskljPKBPirP/lczgzo644Xjl34K6P+OvedPNg9f5RoqYLLvJ+6H4y8tKfTsmKh4PF/YBl9fXH7bozd+uYvP+nVzrVz9WdB0Ws1SfbkMEeWUCzwa5acmGRaGTb9eNn2W1JrMLeo9WSkRiFWZTYDNIVqvnfBfm4zFgevoqCocHroNfzL9/MjyuF3v45im6+GJF35I/VoyLfbuUbyESSFzYvMV9OW8zDMCdKZ1/5LH6JsHcMM3iprfxeJjWmp2BdxAo6cs8zsiq/Rzk4385dyCSr0wL/bsl/VX2x2KQW85if7zowOeqdSer/E4C9RBfCQKN5XHVWIIIW16Kc5HNwQWPFpglNXDSNMvPaaJtfGVP5NbrnKCMTPSGiivOtSm2tm43x2XgDXrC8HVa6qZvnDyn6Wpoej0ylihIryGjme4uMHORT1e3Tej0H05/qt2Ryr4y+EtiUzZe+aOcaz4M/garzCyJvyCi+vhyfgF7En4KDLhQeyWRvmkBJYpMSyTstvpePabIsEG8BBCUyl9VsE/mnQTNOFSHKOPvsakBqYXciCeJFQJfinKkCMvTAoP1kMmw02XPGVKD74qbfDZaPXfIyOzGH2ZrCJSNq+XML11Y5oVcTXLYa2guPB/oeAYrcmX6X7ee17BLjxUHFxh8/uAG/AbYeN7wrYjD/di+xdQRhRQQtMHl3j7sLIuxtG+4MaJZrA05v0v0LHrrzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(10067099003)(261021121427099003)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2xQWm9nWFNrUk44cXJXdE9Xdm84NGxWOVlTOGs4aHBXdEtqeCtNdEQyT0d0?=
 =?utf-8?B?dUlVcVZ0YkVYQlYraXFDZXFOZi80RFYvbkovYk9VNmVKb3hNWnZ0SktoeFYw?=
 =?utf-8?B?a2hNakxrcWdQaUtnNkJkZWxraHFyc1NjUlJZdkphWkNiaDFYQUdQNWwva0k5?=
 =?utf-8?B?Uks4QmxjQkRqQXFLMk01em52bHkzZW5LSHJZeURqUjRzNVh1cGRqaUd4M0p5?=
 =?utf-8?B?RXFhR3hNOHFQaUFxOG9XWDRsY1hJWGR1UzhZVjdGT0ZzNjNqTEVmT1VLZ29a?=
 =?utf-8?B?WWw0R0Y2ZVh1VlZ2WmJaVFN1SUhTek9oeFVHd3VJSGRTY3BUTWJBZ0JJR3JI?=
 =?utf-8?B?cTB2dDgyTWF3VU5NSzlnVmxHSENMVitzbmdnUnk3aEtKSGo3bEtMNjVwU0FB?=
 =?utf-8?B?bUhtRklZdzZiRmhGRmcwR1o1TmNITlhvc3I4YW1odFc1dTQ0cUNXdHBHZHZr?=
 =?utf-8?B?WUxJZVpvbUtZamFRcW5rdVZWa2FZTlE4S09XTE5JMjhvUUxwbHExNjNkNEsz?=
 =?utf-8?B?MDBVTEJSSUpWaXRNUnd1TE1ZVEVWVCtCSmt5cS8xWUpGcWMyWTRwem52d1Vo?=
 =?utf-8?B?NGVjWTU2WFowbkQrRWJiSVVwbGdIYTdyMUVkcDNhZnVFb08wOEc1a0V3UXFm?=
 =?utf-8?B?SENzbS9ydGwwVXErUDBBL2tNRmVlZXZIUGNFaEVqbFJYejN5UWVQSXJsUWIy?=
 =?utf-8?B?aVlXakR5MDVRUi9WQm9TTzdIL056SkkzQUJTaUo1MU1oYkliOUVFZHF5WnVM?=
 =?utf-8?B?SDFXUXAzY0JYSTRPN0tja0JsRmF1aFU3YzE0d0JBTDQzT3k5Vlp5L1BKM2hj?=
 =?utf-8?B?V2dYVHRwWDZUOGhoMTdlNzlMRWpDeE1LOFlHVis1a0FSYk9vMDgrTy8rbi9D?=
 =?utf-8?B?SWlscVc4MjRMdGdwdTZOVkF4Nms5QWdNQ1QvUFFFQ1U3V3hqR3pqZ2dvMHVm?=
 =?utf-8?B?OVFyNzNyc2djcC81ZnpvOFF0MmFldmJmMkI5SGd3S3J6YjZmZDFXck5salE1?=
 =?utf-8?B?VC9sN1Q0K1lpUFRUMXZsejZybXdkcjN5YS9EMWlESmRhdWVzTTRyV2R5dWwy?=
 =?utf-8?B?SHlNWE4yRW56eDd6MlB0ZVFjYjY4OHBqTGhSZTk1V1BOelo1V3l6am5rdmg3?=
 =?utf-8?B?RGh6VVZRUWxVQStYTStSYTl4aVhUaVNnQS8yNXNoaVNicWR2OUcrZURyV0FD?=
 =?utf-8?B?cjRlK1RJQi9QZ3NCbzVNK25DSnN2a2t6K056d0pXNENuSThCeE40c08rMEND?=
 =?utf-8?B?LzBFNUlmMVNPenBtYTlzVVhvSlVaZlBEUmpYR0ZESzFpeTJya3FZSEE2ditF?=
 =?utf-8?B?aVFONTg3NklhamljampXeGI4RGU2bzhGbFI1SHJHUTY5bEZuKzVHbzhRYTcy?=
 =?utf-8?B?UTJKRXZ4UlQySmJnRFJsSUY2VkNPR0k2ZXlKekZwb0phRXdLZG5iTE5TS2di?=
 =?utf-8?B?Q0M2VHVMNk1NT0llVnZwVzVaZDQ4VCt0Z2JmMUMrZ2RkeXdrWTZmRkplcXpk?=
 =?utf-8?B?UzhIOVp4YVpvTm9RdEhzRnZ1cTBvOEZvb0lyd0xkUW1VMm5XNFpHN094WHRK?=
 =?utf-8?B?d1pkblk5UDBJdFNCZ2paS2VvUkJIN2JoWXpBenI4RDRTNHNUanppS0VPanZH?=
 =?utf-8?B?dlhkdEt0cG9zWWJyUHlLVDA5TWpPTGg5R0tWYVlyTFdvRXBkYURNVlFiR2Nq?=
 =?utf-8?B?WDN4UmNzdU92UEdTYVJHS1VvUEVwbnFqOU9FdmJQVTExL2Z1WG9SZE9qMG0x?=
 =?utf-8?B?VU00T1NzWk1ZbW9GK2h6YlNqNnNIZk45QlNWekg0NTBzVkFHNFFPYlF4akNW?=
 =?utf-8?B?UVZYNGYwUDlxNWtEd1hhL1d1MlBFL3hmb2xWeDZqbmJBcW9CVlVlOEIyRWE1?=
 =?utf-8?B?cUtPbitySVpXdHFJb2NvcXZ6cXZobmRXNVArTEREKzNrVFp6eUM5OW9vVmEw?=
 =?utf-8?B?MTFhdUJSWGVlYXNwNkNPWWdrRXM3NUxWZC9ENC80SFBOdSs3YlM2T2YrNmQ2?=
 =?utf-8?B?ZnNwT2hVS3orcStkT0JqQ0ZIaGVhVnpTTzhxOTNNUXNRb0pBRFp3aUlmVTlk?=
 =?utf-8?B?dnRlK0ZOV0JSdU5sQkxDWGZYTWZPOENjdmlZWC9LVFNWdU1kSnhyWGRVQlZY?=
 =?utf-8?B?eWJnejlWSE9XS0t2aUcxUXVIMWVvK1NJbXBYWlpmOXJNNHZzMzBNZ204WkxQ?=
 =?utf-8?B?RzZaOGlLZVVyQ2pjazQyNjg0bFJpRjhNanNYUEM0QmdOZ2s4bUdiYnlpa3dq?=
 =?utf-8?B?MnVMZWJlbm43TmhVL1lRQkVHcUlKQTE1QVhsd2xvcVg5VEFOd0tjT0hjSTFT?=
 =?utf-8?B?N2dQYmR3cGdLOVBoalZRdjBCOGxHZ2dEQzVXaUFSOERnVloxYjhjdGlVcnM2?=
 =?utf-8?Q?QEzPfGnEhLAzRikBx+F+YNuAxk4DcjT8z8KiS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924b0bd1-591c-418f-e3b8-08df46f633d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:05:35.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqJkdcQd5kQZ+fhOGl+r9XzXRADJGP/0QnH/So8BaLLXTYeWxqWsIHA6e6RM1L36GP6qwCFARGOQEZcNZ7KML/9wnaPpYtYJAD5KJ/Ru+pA5TW7LJFYh/3TPfpFSxvcD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

Most software on the i.MX937 is compatible with the i.MX952, so it
reuses the i.MX952 device tree as its base. Add imx937.dtsi based
on imx952.dtsi and imx937-frdm.dts based on imx952-frdm.dtsi to
support the NXP i.MX937 FRDM board.

Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
blocks and runs its Cortex-A55 cores at a lower maximum frequency.

The PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM,
unlike 0x20 on i.MX952 FRDM, so disable the inherited node and add
the expander at 0x21.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
1. replaced gpio-hog with gpio-mux in imx952-frdm.dtsi patch, so removed
   the duplicate gpio-hog change.
2. overwrite mux-gpios property due to different expander address.
3. modify commit message.
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx937-frdm.dts | 87 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx937.dtsi     | 12 ++++
 3 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..8bca1a6b8478 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -958,6 +958,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx937-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx937-frdm.dts b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
new file mode 100644
index 000000000000..374cf3804581
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx937-frdm.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx937.dtsi"
+#include "imx952-frdm.dtsi"
+
+/ {
+	model = "NXP i.MX937 FRDM board";
+	compatible = "fsl,imx937-frdm", "fsl,imx937", "fsl,imx952";
+};
+
+/*
+ * PCAL6416 (0x21) pin 4 selects the CAN/GPIO mux:
+ * low selects CAN, high selects GPIO. With GPIO_ACTIVE_HIGH,
+ * mux state 0 drives the pin low (CAN) and state 1 high (GPIO).
+ */
+&can_mux {
+	mux-gpios = <&pcal6416_21 4 GPIO_ACTIVE_HIGH>;
+};
+
+/*
+ * The CAN transceiver silent-mode line is on the 0x21 PCAL6416 on
+ * i.MX937 FRDM (the inherited 0x20 expander is disabled below).
+ */
+&flexcan2_phy {
+	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
+};
+
+&flexcan3_phy {
+	silent-gpios = <&pcal6416_21 6 GPIO_ACTIVE_HIGH>;
+};
+
+&lpi2c2 {
+	pcal6416_21: gpio@21 {
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6416>;
+		pinctrl-names = "default";
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+/*
+ * The PCAL6416 GPIO expander is at address 0x21 on i.MX937 FRDM,
+ * unlike 0x20 on i.MX952 FRDM. Disable the inherited node.
+ */
+&pcal6416 {
+	status = "disabled";
+};
+
+/*
+ * The 0x20 PCAL6416 inherited from imx952-frdm.dtsi is disabled above;
+ * re-point every consumer to the 0x21 expander (pcal6416_21).
+ */
+&reg_ext_3v3 {
+	gpio = <&pcal6416_21 13 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_ext_5v {
+	gpio = <&pcal6416_21 12 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_m2_pwr {
+	gpio = <&pcal6416_21 11 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_usb_vbus {
+	gpio = <&pcal6416_21 15 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_usdhc3_vmmc {
+	gpio = <&pcal6416_21 9 GPIO_ACTIVE_HIGH>;
+};
+
+&usdhc3_pwrseq {
+	reset-gpios = <&pcal6416_21 8 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx937.dtsi b/arch/arm64/boot/dts/freescale/imx937.dtsi
new file mode 100644
index 000000000000..7912a9c282d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx937.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx952.dtsi"
+
+&gpu_opp_table {
+	opp-1000000000 {
+		status = "disabled";
+	};
+};

-- 
2.34.1

