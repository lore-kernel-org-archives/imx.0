Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172736;
	b=CYpcTQl2bwnsnNq69HidmyHajzxNl2hNzECulACXdwqfjuGoiJZ7LqTrkcwHNtEqweHi
	 AqYxY0FD97NnQyrSPVdpD5iBhX5dqwLBu3LTwjBsyhqrGdcAeTqNlyXPdOqNyHO/WrdcC
	 DsinR93kboj4i5BqSX5qFM7jwwZ9+mi8vZJjXTR7dRkgynyRgrvrlCLGsHzrVyAsQINtp
	 spgAGX05cJKJDXZdfLvSjCG7AAjGY4PkzT29JdCUQ0EA6+ZG0NCwQtgcMsdEq5YaqsgQJ
	 E2qCqWMCN8qK8xhG/+AyElMJK/bGQIkImXCgzoc2FP3lKwdCDK51zjkVagoAvzyiWFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172736;
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
	bh=Wr0qcnoQfiheAKYMKG1xaaaKnQ/24kpeelVXy2i+v7I=;
	b=CixYNH2a75dp9jt0ZPOr/faKzES7tGzEQ+A2AjPNRv+T8nCgnGmaaPk/SvU0jDrra2WT
	 wsy+lwip9wGYeBDsSXlzL7QtS+XOZLA5prFC8q0oxETCp/aixB//LwYwVL7vbSaGeDxC7
	 aWOQvaj8dHanPqNbPSAlU0vZtG0HpypJup9IJ5++TbF5s87xBbCf3E94AAjaXU0lqYvyM
	 1S4/FUtDA5cgM3vea/VZ0FetZ+EB4GEB4FvhJdcxXjNeSScv4hVy3L8LS/Ym1of4NoBoF
	 uksweytEwAIULzeua4U/5w3BvPxtnlkoeKQ+ReYn4GKO97EgmHvm0OJ0T0FfCipe6ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=X3ZZI6QL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A01606A337
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 11:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A01606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=X3ZZI6QL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiDHEokgHv455pspzKWRApaQzVgVInx379iJmR3WISnx8B9OPDakvqJmb7RV85seUzbLhq1hBff0ppNJ7ipolWc00mdryLBf2WffYLiZ0hX7lkb1Sff8JFzlb7hQKXzJgZG0IJiEymLh/I7lU8VNFdJi8ZmWFpjykaQ6kh08NQ8CWDiD8Aerl6NG3YnTaiLZuaLxHud6jYyAIJ48c6x+yBS+nxm9Wx+8XMEoywcdyF6DvIrnpiJWO2NQBUfShO4poXRNFeQIUfv5UY/iZjcR2VPCZ7rjzoe3PkGR4Awht/kn5ruYP7Xs+nCN1rKFoDrCZK2V5XEdG4/50gZhoafK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr0qcnoQfiheAKYMKG1xaaaKnQ/24kpeelVXy2i+v7I=;
 b=orMQL42B7E5ux2wUoZVLF/EntV+bFTN5yZavfD4eRsdYN+knp3kjbxDiiGCKM6AvedPAYN/NLgsZx2ZQ1fgS6jjgc429xzcs31jxCeTmBL/4MSSYyIwWjIHUPJppiYHwL5IB8R40iL0TT7BBSQOkytdW8IUiGtZswzUToAW6cOQgDrcG8qnkWLarOIkykrPO6bUjvMxxBjSfiVaEmKOalflLitiwlWysjekucrR7RBzjKMVDo9eMtfApg0lpxVSGfxqEip6nw9McyDOrupDz+Fe1oXa+cvLTzqxGiYNyd4KmbpO6wuAv/Po+/ZV6ZWmYYiOuzhawPmhaK7UFhk3Obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr0qcnoQfiheAKYMKG1xaaaKnQ/24kpeelVXy2i+v7I=;
 b=X3ZZI6QLMe2DzMqblTyCU9b5A56W2/ib7cpZEdZMWnFKbwvuV8HMl5nAThW34q0HYwdXqqdyEtDkqi56LkTeg4kuu9cZi9/eyGFbt+eiKX+I2A+sdznK6u6XmuQEFEXb6n6rLgL7OJSPIvZcODrykqgiGy9kx6B4+1NFgU8Oafdcs0QL/nXzWWE7NELVqzO+dkTjoMzdmbIXQzkrHmQvOBBYesXkJC82vLLV6BMRVFLROHvcePi5Noq8mqJetnw+8YGqN4VVQ3klPoZefAw1oDKXcdOj5XSVl2Mrb+v4xnLbJuHNl5VGqww6TpjzYoTcbKSu6LZ0B4+WgtDL3aWdAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:05:30 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:05:29 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 20 Nov 2026 19:09:49 +0800
Subject: [PATCH v2 2/3] arm64: dts: imx952-frdm: model CAN/GPIO selector as
 gpio-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-imx937-frdm-v2-2-5e27ceec02df@oss.nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 06aeaa11-daed-4763-8d20-08df46f63056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|921020|10067099003|261021121427099003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JHSYZRBKaxwLe55r41aIF+0mpz9kuZfFD5Z/wc/wte9xjajymw3yz43Tdux+eZhwB35sVpxNMY9clUFjRy7TV0c9B1H08hRKtICJffLS5P2YWry2auq5weHAF5AjIcl5PdBaLNNvEqIiTepPt+q83Mv8TaCH/gIF5qqK6XHSijRgALiIc8uymxMbSI2uzqOv3A1WrQDP3c/+mUTx9oRwXOfkbC62nkN8vz28cipi69R9nEtU0sjJmNJsUm5Spc611WXunGTFi6uKeD5FNmKkdEQ4tybM4vYggjIVf870g0Plax8PYQCxy4qO8sXQjbaezNhQDqNkzRjxnUyjKCbtTqEbI1CoQFVGb0E+i6BS2Ng+dU85Obs4YkAKk1zFSBaHNzzleDjEc1zRMsDzXg6i9IcfHNmwV7Qklu7MEjEAoQYif32zrX/iuNq8xMtTfNdCMxz/4EzkUnb5ylha7MiRyxyCfl2Bk8q8rNh2lo+jnxzZ/XKYsKqsk2xbuiEoUYhMRChriZEOKpVP4ug9XFIITToCamjz2LsbLUd5mfnVCELGhB6F8xpwHN96bXs2fgGcrY/ToTkf0Bneca+/pvf1HBC7l1avROEOTryHqHmOlhGbTJPYwoh6xX3o3roHWEnNVBxEjzaJZ5+csu7bX55KoTKFiiXFkKTvqgq/WJh+nCPBIZVBlIn9dFzhnKcoxSxfWOrRrHrF22/2ElRvmSTLcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(10067099003)(261021121427099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnIzWlBuRG11RmIwYmpjUW1nT1lqeVRhOUVCRS9DNk4vQWF3UHpRd0lvVUFI?=
 =?utf-8?B?Qy93K2FaQzFvMkdTR21XTERNd0VGOVZadlkvSWN3OWVVK2o0VXZHQ2JBOXhC?=
 =?utf-8?B?Sm10cW13THN5a21ZVldCSjR2d1hIV0srODl2MitJVldIRjFWclBEd0dRQWpB?=
 =?utf-8?B?RUFielgrM21NTmFaTWVIdVZjL1RHazRoVW9LUTJRTVl3VVFPczlVM20yQW4z?=
 =?utf-8?B?L04zaGJ0SUZsZUJaTVhJVnkzZjRYaGppYUlmUnBMWnRLdS83MEJURHorcE5z?=
 =?utf-8?B?SG5BZHRvdUhXVTU2eEpmbkdickdmZXE3QVpIdXp0d25XeXlxVkgwbnhOQ2Fl?=
 =?utf-8?B?U2lPTWxGeU9nTmlDRTdyRUFGSndWWXlsY2ZsMnJON25GQmttRDlzVTlCU1Uz?=
 =?utf-8?B?SHQzMlhYQ0JqdTFOL0p5aUgwVTBvZ1IrcnZFODZCVFJyNkVmK2toaDJCN1RO?=
 =?utf-8?B?aGZkY3RpRG5VOFQxZ1NvR3ZBVnhaWEpmVUVjTC9wdk5JYVUyMzlCYngvUXdt?=
 =?utf-8?B?RVliaDJka1plV3llbEhObG1NeFlvdzVLOXVXWmJldytVbmtPVElsd3NpL0U1?=
 =?utf-8?B?ZFZoc0FUeVBYTDhSN2RsakFSamN5cjFKbTVITmwxZ2o1ZVRDS1haUUhYV0NX?=
 =?utf-8?B?cStXcUVOdjNub3J3NjhOcmppdVo0VjlDTXJteUtMcVRCSjhKd2YzN2xjTWlP?=
 =?utf-8?B?cHNXd1pXUnI1OFFzVW9ScTFSRVJYMEYxdkJxVzN1SDJZN3I3TU1saEZRUUZQ?=
 =?utf-8?B?SnRQTTN0MDhzSm14UzBQVWNJWUk3bEN2b3JvNEdGMHRGVUlTWUhqRkJpdU1C?=
 =?utf-8?B?VFJ2RjJISVR1ZVlXVS9NSisxVmdJRkRNemZpWGFWUEUzamEzYVlFQkFRNU55?=
 =?utf-8?B?ckhvOGhxMEdNRjV5M0l2L2taRnMwY080TVU1TFFDUEFoc2Q4S1NQUjdDZFFJ?=
 =?utf-8?B?UHFkNjFuMGhHTThrRnlRbXd2RUVwMUd4ak4wQzU5RS9OMWF4WWd5UXk0Y3py?=
 =?utf-8?B?SHIyQi9xT0ZPV2R0d3lOZHBZSnNlQ3dJQ0RVZXQ1OW9hTnMrNXRJRGc0V2Fq?=
 =?utf-8?B?VStJTFkweG02aGRCVncydVFNalpyMGZDUnY0dzlJMUlsTWgwR2F0VEFrYXM4?=
 =?utf-8?B?UGZWZVRpalQvaklMdG5WSTVBSFB3blo1L240R3Z4NEJPQVZORUhvZXlvSGR2?=
 =?utf-8?B?MHEyYTlUZ2NNZ2VJWUZRSURLa0ZyRFZvdUlkaUJOZW42WnMrdzdLZUVtR1dz?=
 =?utf-8?B?V21vMTVnU0NMS0J5ZXVPSXhHaHJCaE82TGhidUt1RElwOW5MNWNaMWNmR1c3?=
 =?utf-8?B?TjNoRy9HOFlzbmRBemFudEdNcnRkK2h3UTdmL0lFTFc2OHRqeGtGVDlFVkFM?=
 =?utf-8?B?ZXgrS2hkd014dldpS0Y1cjM3YlEvdDdEcXNpZnZxWjdmQzZyQXBnVUg0SXBS?=
 =?utf-8?B?NVBtdktZY3RIODZQK2VIQnYyYkMydHIvY3ZhTHByZkE2Q0VmdktFbU05Smk3?=
 =?utf-8?B?cEhuQU0zZW80TFhIOHlGdE4ya2JEOXhIWjFTVUJYa2Q2bVpNSmxhUm83Tys4?=
 =?utf-8?B?YVFNY1NuUTNSSlJYVFhjSk1DY2xPbEpOSFlOZG85aU9GaVk2VmJDRnZFV1pj?=
 =?utf-8?B?QXJOSitudldjMHdPbXgybzFzdnRFVkx2TlcrK0ZNQkgwdFRTV3MrY3V0YTRs?=
 =?utf-8?B?R21uZUhTS29VVEk0TUxCVEdrQU9pQW55UlhGZlBDRnp2Q2NQQlhRT0xMQ0g5?=
 =?utf-8?B?ZDRVcUpTRWpIME9rcHdUQkNqMFhPTjFTR2w1UnhIZXZpaHRURjdJYTN3Rklx?=
 =?utf-8?B?Wm9COXV0UmUzUkhuU3dEek1rcktvczNPUEQzRWkvcE4zM1R3YmVaMVZweFB6?=
 =?utf-8?B?N0pqLzE4K1FoeFhOdGh5SW1Kd1ptbkhoT3hmUDNaVEJ1a1dWUXlwRGYycmd4?=
 =?utf-8?B?NmhXclFLQ05waE56b2JDWWoxaGlCU0VET1J2RmZ4RlVrNjREVUhrVkQ2M0FM?=
 =?utf-8?B?dC9Wd3krODhKN1g5VjJWNmlDR0oyNkovL002N0NNcmxtTEgxUlBxTit3cFdy?=
 =?utf-8?B?ZTdtalQ2NXlnVElXSWt6WXdBM1NuMXVtc0k4VzZWZVNqMEl0bnFBUnZWeWFl?=
 =?utf-8?B?YzBxUUJmZjg2T29DQWMrZUd6alU5NjVPNHhMemN2NGlTWVEvZzdIeWRDQzBR?=
 =?utf-8?B?OTNGYzAxcEowanhLTTdlODZtbkVPcEtFOG9sWDRIV3lET3UraTIrUnhqdld4?=
 =?utf-8?B?L3BUTjdlNjUwRXhERTc2S1hIWEcwcTkvVWdyQ3dHVHZNUGpQWGwvOVJ2clg2?=
 =?utf-8?B?VTlISFBsc2pKSXRYMlVEdm56dE1aQU9jRkFmdUJWREc3STJXNjB2V3YzMlM2?=
 =?utf-8?Q?6nRvn++MPhpMM8vmGtaPVRalYU91EhG4MZNuS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06aeaa11-daed-4763-8d20-08df46f63056
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:05:29.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVcm8FiKc00DFjsbunYed995MxBipSIW0NMn7EoaWCsFv0m1vemprhBQxX9Tf0GJtKzXkKy3+0ltw2vRifJ6zM5EG4ox4WtstSv/HBwxDBtcnN7k7W7lbnk+XCBAvj8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

Replace the gpio-hog used for CAN/GPIO selection with a gpio-mux
controller and pinctrl-multiplexer states.

The board provides a GPIO-controlled mux between CAN and GPIO.
Describe it explicitly instead of relying on a fixed GPIO state.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
1. add a new patch to replace gpio-hog with gpio-mux in preparation for
   i.MX937 code reuse.
---
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi | 28 ++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
index 4d325e848aa8..88e77d6e9c45 100644
--- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
@@ -39,6 +39,25 @@ bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	can_mux_pinctrl: pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can2_fun: can-grp {
+			mux-states = <&can_mux 0>;
+		};
+
+		gpio_fun: gpio-grp {
+			mux-states = <&can_mux 1>;
+		};
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -274,7 +293,7 @@ &asrc2 {
 
 &flexcan2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-0 = <&pinctrl_flexcan2>, <&can2_fun>;
 	phys = <&flexcan2_phy>;
 	status = "okay";
 };
@@ -304,13 +323,6 @@ pcal6416: gpio@20 {
 		pinctrl-0 = <&pinctrl_pcal6416>;
 		pinctrl-names = "default";
 		vcc-supply = <&reg_3p3v>;
-
-		/* When low, select CAN; When high, select gpio. */
-		can-gpio-sel-hog {
-			gpios = <4 GPIO_ACTIVE_HIGH>;
-			gpio-hog;
-			output-low;
-		};
 	};
 };
 

-- 
2.34.1

