Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73162264CF
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014348; cv=fail; b=KyoizlvrC4U+zA7A/j1HnA3OPftLJKYjMmUi9s2RD3r61FWHpebDyAT9h12i00ubCxf/GfwIh6EVkDJKOhGM4CeWL/56Rkyo6SvFez/5ivAntsBE2z91vxtZWUIeQfNDfxpBNpvhCRn/BbSA/3GvaPjnptDmdo0VJvt95gZtvr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014348; c=relaxed/simple;
	bh=mpTpZkz6ff450WYAFMIAZ5GLWsamjvGcAffHVqbBnvI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BIOCa75oYWf+jCE3aeqCR4Y005dnKFw9DYRVO5fWJYwGnoe7TQ5gwxhcqB4ORNU5KrMAOOQKqHVEOC45m/HIDAdmunbIJVr8o7wPE5or+V4aqjEtfd13/ztHoRVW1EWYpBKC/CtR92whx29QUNRyhIS3CdlUORJdnRQOTvTu084=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=am9d8NgM; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="am9d8NgM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILZo2spwu2MYla73DNV9bFS1tUUxKHuABY3YixoTEHjFSQ943jVIDHHdWDRlPekdTdriK1zkrvExSNZ7H1H3gScjQZ49XW/HZeuxcktcEm5vwUR1Dm8+1xz4fn9FnSOGF5NcWpVUegY1+g8Pn0KMm0L4BcJk8pWLHgTp1Oa+x3W34+GM4QXUrOxIX7u+1r9/aV9Gphi7jRFiNMUzyxiWCyo2wHS4rrxz2UacfS6YngF5nc9jmFlQWrsUdeANdy47ySme1gD1LztEEt4wCG7ZZFRhPqybhlhw2Jz3T+rtpA0LYxxsY0eza3fZS1xcj2qNnODTYq7zFv7VYNAqdngHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLBo6A24NghBOFmC4O08Hq5ZpomVjigGGqEkgzk4qrM=;
 b=Ozb0Ggmn2e08inCWNpvLE6FXrnT/8DzNTFf3TwXRQFAQR2kB3z2oYbKIiXN5biN9K32qRZQgWd63nGhx5ux+JtNvndIBL6HhM0J/XAN1Mxdkh5oCbDNztzg3T8et41cQLaZvtiOC37LbE3q8PmflLKEXsQGORjND9Ml7uyut8IKEMgI56fyrtLkEdGm5SyAVPBkJ+XnC5mZg65UIE0yZdZeJfeu2kXMsbMwCAyfleFot4Ulxtux9w8L1jFeGhtIClOHaTVzCTbWOLfb778/5EYfwDP/KRjH0Mvw6wknhzUULCj/j7SGc8hfo8sRFLpXTBlRJwO+F+n1kUx8XpqO5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLBo6A24NghBOFmC4O08Hq5ZpomVjigGGqEkgzk4qrM=;
 b=am9d8NgMpkqR8dLxdMbJlRR2jJAP3q+pXXEQX4KMMjb7g7iead2v8E7L1AArF9nyY81zOK+FmNoN1ckHn9YgjgTyqLqQDLaTcAxo2w/cOhQU55Sjwbed2nmYz05bKZEsm2+sQI96qq3x8WiEGCq7sCbcbGiZOeqM1+fOVXnCq+Jfh3Kvnwh+F5YLmUDWKcWWklxvqhM2PkGhdAtSTdhcVLPcNus+HrmU4SUUymlenXmIp3eTDiI1iVXkI1KHCSqlDany14Er5CKK8vrFLzURN32EUlGwWz1acd9WvyYYOwn8s55jiSqSyFOHfrI4QH3exlVV4Ix6Bg7cuBqGkSjd9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:25:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:25:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:10 -0500
Subject: [PATCH v2 1/6] media: synopsys: csi2rx: use
 devm_reset_control_get_optional_exclusive()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-1-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=1316;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mpTpZkz6ff450WYAFMIAZ5GLWsamjvGcAffHVqbBnvI=;
 b=/sZrFhT1tDVVa1FNX6w4hm9trinB5NncB8t9Lr6L4/H12LWmL06a1x6dfxLa8BIWj8z/YkqdX
 Idb4+rpETYgBbtFdtjb2sFqqbVTuwl4rKBx8qkrMYaS8LCxLXmq4W8t
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 034a4803-b333-4b04-4e5b-08de6b3e1033
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WGVNM2s4MlRIWXRacmMvNllxM0I5a2ZUNU5XajRZYlIvS3VHcWIxQTBYVzR4?=
 =?utf-8?B?eWNhM2dmS1ZIc0JOanlOaWZYQkc3K09VUlVodnYrUXgvTTlFaUcxSnBFbm5u?=
 =?utf-8?B?ODUvSG0xZE5uUGF3b2FqVThXVkh5R0luYVpLZVFpM1RBTTMrS0RPUko1aEZR?=
 =?utf-8?B?UER0d1F5R0lMODRBNUZKRElDaHZaNEFYOG5wb0YyNStTS2w1MnR3WHkxNVJn?=
 =?utf-8?B?VVgwdUFLcFhQQWhHdE9kMmdKN2hWbVNreitETzRuTUNKWThkUTlwd3JtTEtN?=
 =?utf-8?B?bGk4YnJpbVRoZWZEb2NTcHM5Z1FnbkZaTnBEejJKbm9ydjV3RmtIZk4xUFdq?=
 =?utf-8?B?dHdEN1g4UnFGK2ZXK0h2WFBhT0NEZFFWTk1INHRabHQ3SHU0MWpERWZBaXdY?=
 =?utf-8?B?YWRHZkNwWjVhcmJ5QW1CNjJlSGlzbGZuTldrVkNKZ0lNVk03THMwRW1YM1pE?=
 =?utf-8?B?emhjRnp1aVRRMlMyY0xHbzlGZ2h2ZFlWc2lmd3VKU3BKTGQzL2EvZHE0VWtS?=
 =?utf-8?B?MWxMcXF1cm5uUWZPUGN5MzVRQVNpY0lCOGhCS2VGUXpxb3FNbUhzN3pRb1FJ?=
 =?utf-8?B?a3RzYjNZdFdwdzFGbURhV2hLSitXQUF6T3poVzg4cXVKOVRXK1pBeTNoWTNo?=
 =?utf-8?B?WldWQTFlRlVwQWt6Z2VqSlVmdU5lb05hTG5tSncreG1oWDA1Y1NGR1dtNVBn?=
 =?utf-8?B?ZXEra2N6MFJJdVRFMkU4aDdqUmNzS0htMmVQTyswKzZtbEphY2NEWnVKa294?=
 =?utf-8?B?UTRTTDdMRjJ6dzBuU3FzYnZDcXF1RVNrUUlrM1VBQ01Oc3NUVUdwYTUzcDZw?=
 =?utf-8?B?RDZPSlNram1vTnpZSWkwY2h4WmRiaGxVUlJ3MmczajlHbCtXREc0bVZWcHNp?=
 =?utf-8?B?MXh2NE5tdSszWjB1MzJHaE1ydzY4dG9ockQzT0MvSmd1N2gvTmhmcVNnaTNw?=
 =?utf-8?B?UG1GcjY4RWNLUSs5Rno1citweVRXNDZ3VjhLVHdST3BCS3g4ZUx1eGpSRHJ1?=
 =?utf-8?B?dUdkOVVhbzZjdW5RSmFTUFRZeUZvQVVwTDFTR1Rxbkc4Z3JuZFl2dktTNEkv?=
 =?utf-8?B?Yk9rNjV4UVdNU3drTGFsNVdXOVNGK1N2RnNnZWkvZjRCbVhRZS9DbnNEUlVq?=
 =?utf-8?B?MUVieElOa3NNczVqVVFoUFBjNVA5NHFkSFFWdjRKVFpOcHN1QWw2a3lESWVl?=
 =?utf-8?B?bDFGcHNoTVJ1S2NyV3RJWFUyUUVuTmFOcE1kZWU0RG9BRXh6bk81c3FucWli?=
 =?utf-8?B?QlZRdmViNmpjQ3NJd1hncHY2em1wYUlOOXdYU1JFcUswZzFuTEpsYXdKOGVv?=
 =?utf-8?B?clFET3RWWmxpU2I1Z1RiaXI4NlhNbUZPZW84RldKemJ5Wnk3dmY0UnU5WE5R?=
 =?utf-8?B?RzZSUDNwQnpPKzhhYkFDbGFoSU96ZGdQbzVIT3JIT040ZkhPNTBKa0hnTGow?=
 =?utf-8?B?dUh1Ykc4SWVRNnVER3VxWFR1d2hWYmF4TDlKMC9ubWpIQTZIblg4VndzNHE0?=
 =?utf-8?B?cFN6UVR6dVN2ZGNPbzIyeUp3Y2FGZ1pqUmpBMWt2Wm8rd3ozcmdGSjRpbERE?=
 =?utf-8?B?b1pzVURkangrR1F3amtyV0lpRVhxbytXMzdSVUd0WitDQVNHSDNFYStNbG0w?=
 =?utf-8?B?WW5rMUxjOHB6UXdmczRYSDcrb3lzckVYK3YxTTBaR0FxQ0hTVlJlZ1pXcnJY?=
 =?utf-8?B?aTFSZ040cmF4VFpTRlhhMnMra3NZdlpyYTZnZWtpc3FmYm0zWGtjTHVEYkhM?=
 =?utf-8?B?eElsMFFJMUxPK1dIdThTU2YwQ3V2U2dHRXNYMUx1K0ZOZk9hRXF5eXJFNmU2?=
 =?utf-8?B?eXM5ak1CYXI5K2NOK0hjK3RDN0ZVRDNsdGswY0wyck9Yb05oMjN3SzNRS3N4?=
 =?utf-8?B?dS9jZFpLc0JBeFI2VUJLTE43aUU4RU9jMGtXODVQWGg0WHdFQjJpM1ZiR2x2?=
 =?utf-8?B?QmFmYTZBMTh5cEo1R1NDcGtDeGU1L3pTT2h2ci8ycUtQUzZma2tCK2tRM2Nq?=
 =?utf-8?B?c3VLdEF6dHFsS3NXVnFRUENGajd5MkgxY0F3dEtUb2g4TXZuUVlsR2M4cURT?=
 =?utf-8?B?ZWpSamNSWnhpZitDU056cEpqUEh5WSthZVg3N0NPM0E1Um5BSERVaTdiMmtj?=
 =?utf-8?B?WnQzeklxYkwwcS9BcHVweFNINVZGN2VVZHorYVZ5djBRUE5DVEY1ODdoSy94?=
 =?utf-8?Q?ttT0VGZsZ8Fqd/W9nJ+RcuE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VlExMXVxcFBWZVl4YXFCa2tMMDBKSkVCTkIzdnp3T01OcFR2RkNKakVnSDd0?=
 =?utf-8?B?VXYzZnJ3bW9qVUFtL05CNlJXOVBkQWFIeDNHd1pJbHJFbHJnRjMwQWhNOGZZ?=
 =?utf-8?B?YnkzV0k0bllNUVR1KzBuejgxNmNpankwcERNcnFnc2NGZEhPQ2VDM2g0YmJ3?=
 =?utf-8?B?UjhjOGZRQVQzcGpCRWVlQUxnZEU1dForQ0xkdGFrcGZuWXZXZVdBSzNqbnVF?=
 =?utf-8?B?eVFDbUtLcndWQUlUQW9JLzN5eHRGeG4wV2JLT2NhUncrTXZPS1VkaXZCWVh4?=
 =?utf-8?B?QXMrTUZFM0lBalE5RjZzeWZuWENuNStzMk8xL20rMjlRanpFMHlONTNDK2hH?=
 =?utf-8?B?aUR3MkhCWTdXS0VjSitBbk5OWkNad21jTFNMcUlkVTdvQkxEQ2FlUHhNdkFo?=
 =?utf-8?B?ZnNJaWxXSVVHU2xRWFdKZUNSVldLcFV0TGpMdi9Eci9JYkYxa1JHdWQrNGdK?=
 =?utf-8?B?L1p6bTc5bDZRWFAwYVhaWTU3NTYvek1HM2cyTFpOakxjOTVENkdJbUNMSmsr?=
 =?utf-8?B?THFuR3BLQVRWekpDQ0I0eDIrdXYvU3ZyK1VmUGdneGJIcEcwTU1wMkVnM1I2?=
 =?utf-8?B?YXJlN3BhalFBTmRaVm8xYVJidmZ1bTNQTUoxcmdFTmE4SytZNHkySytLNmFq?=
 =?utf-8?B?WmNab05IV0tzY0RFZjdLYXhtc3hUVVZScHgwbEhCQlU1SXhHREZPbVpHNDJG?=
 =?utf-8?B?Mm5Fb1RjSTVJRmhDeEdibk10YXhUanJydXNjQ29PdmM4U3hpN3BQRXpEVnJ4?=
 =?utf-8?B?NDVMOWtwT29pT2MyVGk2RVZyNTlUSXM2TlpFY29LRTlXUUNVWUt0TmJpVU9n?=
 =?utf-8?B?dCswSHpNOTc0ZGZlUmE0WUo5eThUT2c3eWRSRWo2TXJDbitUalJCWjdIOUdu?=
 =?utf-8?B?eEZZZDFQSk9NRnFBSnRtY1R1NHVkZ1RwdnVSRnp6YWk1akhoelNvUVNIZ1U4?=
 =?utf-8?B?R3o1N1Rzczdrd1dqYXQvZXV6YnlYWkc4Q2l4Si8yc1RJVGZWOHFwcWxoZnFM?=
 =?utf-8?B?VGVtQXc3YWtBV3VTODJyMVI0YlJjRFQ2THBWZmZQN25Qa1ppUVdvVXAxYTdE?=
 =?utf-8?B?UkRVMlVzb0RtVVVlZ1YrYnEvODZURitvdTA4OW95YTB4NnM4TVN5WlBpcnZn?=
 =?utf-8?B?SUYveUNiQll3S0VMajV0K1pEekRtSmtsdkYyeDBnRlhVRWVWWDM2bjJ5b0hW?=
 =?utf-8?B?T0NVWnVwWi9jWE9BOWRYUDNoUGcvbGRjbFJSVk04QmtuQVIzVS8zZ0RjRHZU?=
 =?utf-8?B?STloYzBWWi9xZjZHQ1BPK1ZEeDRHcDFSUStxVGRKNnRDTXVyYXhOOGRGTlpx?=
 =?utf-8?B?VlA4Z1l3Y2s0SmhTY0p3QjJEa29ZUTB0VXlxN253OERJM0UvTUpUdlJ2Zmpl?=
 =?utf-8?B?WnNkaXRNTVpqdnFMYnFPdzlZZktlaThtM1JQdnR2blBlZ0VnZUNHTzZsNGl2?=
 =?utf-8?B?YThUbnYvbStyQlJ2b3g2YXBvOVVQaHpJamFZeG9mT2w3WkR2SHkrQkoybDV1?=
 =?utf-8?B?NHY2K2NxOGNQUGVkdGxxMmlGdG9VcjdEWnk1b0Vsc01zMnJncmhDemp6TVlj?=
 =?utf-8?B?cmw0UGZvd2FSZmVtZ3B6aTAvcCtJVVQ5WFkwVlh3TGNoZDFvSTJnTDRNTDBv?=
 =?utf-8?B?RC9UYVIwc0RSamFKTlZJQTBZbnVYaytucWQ5clAwWVVyNDYyUnVTUXhzZGJw?=
 =?utf-8?B?Q3lKdGcxbVJGSlUzZmhoejBNT1B5T1RRNU8rdURCdEhVcmc0TUNZVHZsYlRM?=
 =?utf-8?B?MWtITlFPMDBNQmNmVjBtWmFvZ2hLNXhaRWl3KzJnSXl1M0l6bEcvemJ5alZC?=
 =?utf-8?B?OUZHZDZKUzN4NXYvT255T01mSzFjTEhrYkkyUFdRRmtJMkRuMkkzR05lYzQr?=
 =?utf-8?B?d0pLVyt5UVFvNlhYMkJvSnBtR2Fwbk5WcjIvYWptZ0NzQTJFOFBpRjZ3LzB4?=
 =?utf-8?B?bDh0a1p0Sm1MRUtEVDFTN0c3TmVCNUxFWlA3QWxEOGRVL2dyU1FWcTc4aE5z?=
 =?utf-8?B?azZEWXo1cHZDQzZyR0F6SU9laG9xQVNDRHdRcnRzRy82MUlhTit0TUgraU5o?=
 =?utf-8?B?UW9tS3Z6WER6dkFQTTk1UUNzNFFTU1RuMCtSS2xHQ1VBS1VrTlhEUUNxampD?=
 =?utf-8?B?amd5cmRWVGZ3bXZISnhSZmNTdnhOTDJsalVwY3V3V2lhQXBDeXdQZ0M4N3R2?=
 =?utf-8?B?czZvRkNMbnl1aHEwVkMyNmh3MVoyL1ZhOHdiRTJWUDJJSE1pK1JOM00xTGFr?=
 =?utf-8?B?WkhhNEd4c2pERGdLcXFsL1BYWHFzdTlNWU9UelBhRy81UngrRThqQzRlV0pq?=
 =?utf-8?Q?NFsVOMgWmVJt7ljPPF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034a4803-b333-4b04-4e5b-08de6b3e1033
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:25:43.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DB2PgP8zJNG3nCkJAUKliYPaEDpUYi6/TzseR3qZ56FD7N6FPyTBARe+BbtSZm55zoFUgVsV/lb9EtTL6tLPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433

The DW MIPI CSI-2 RX is used on different SoCs, not all of which provide a
reset controller. Switch to devm_reset_control_get_optional_exclusive()
to support such platforms.

Reset presence and numbering are validated by the DT binding.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add csi2rx tags in subject
- add Michael Riesch review-by tag
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a599e43bba9d19476ee4d65124303bd..0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -639,7 +639,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->phy),
 				     "failed to get MIPI CSI-2 PHY\n");
 
-	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
+	csi2->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(csi2->reset))
 		return dev_err_probe(dev, PTR_ERR(csi2->reset),
 				     "failed to get reset\n");

-- 
2.43.0

