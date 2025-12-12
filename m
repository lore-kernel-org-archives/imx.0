Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A273126DF
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530982; cv=fail; b=OeZc9RqRpotBS5AIEh4u9mHoM85/Ol5K+CmvyhGlntzXRtqKVLNWvSN7NmLG+YYfMcyVWEAEXg0u94eRE4Hqq7tyNLsgEw3+VigU3zouZnSMEKbwiUyukHrnXZawsbFjsc4EBoSBSJ0YcWd//wWgwRdTwFH/9BK0+e+5Ukzx7dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530982; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UoKc9UTYR6FzAz6RnEY0Hx4TwqngAxl3lG8I5pf75UBvi2SF7xNLUtKcM8QcAavr0gTiFjqIY5bdytlXN4l5ku6IIaMB5Yl/Z9IGaqsGCHYuuJeQKxKQ8NRl1N8MWCbCrHrdtYdAx3t0OmzEPtk+2fw/SzB6vCZjaRn7t5L4kP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FAvlIeae; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FAvlIeae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzDl/Cojrui2U8EqPVx1RAZ19QyucEznGFSe52wluAbc8HYgqPCYKXUPc7bxZnLcw0Ob4fgsqpTUDBypxFNZna/z8u4qQZ7bwW2tfUkL0XKOZFiUJ5LgeMJ3Zr9+BIFFtz9n1VMcIAG0nqXhFlkN5meCpi6+/d5kzqdX6JdMomTZpCpMcg+eojuinfT7KtPBoOFuxJBeWtKVSN1hFiECpOeeSO7Z6FUhkPjTn0nbsOZAeqY2Vaf6dl5ZmTondEPfBI9mhXAQT9/BqFfHg/Cw/Zz/U5hseNrzQDYadzZ7v+SEWut5cdM/xseFk5ZyfB+oaU1dxuM9tjLw+7SRICc3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=FXXlJ9wCKORPprP0ZiPxkuVDvZAqHb1CjVyH+cmtRRC+zPEagV7WgmXa+2eYfkinqNMAgrBqzenZa3aW6wOX9d3l3PH39324ghoryej5HaBIq3khbHmNdlknySo/qLwcIIT/eEP2zTb65z/XYnAABf39uj/lqg7OaQQMUn3wYIeqmwA1Q/TyaLoILOSKsDlUHYf/NSEO9zy6W0cz8OrMt8JzUja1d8BST9yzMHJMie/RAL8xBJeNmrlplmgyYK/e3J7HlArkcr4yXDVGS1xqQCawUtsNCm2ToeWQp7o5GMGK/aYR+v/SGECNPqAglZ8qbp/ZZcvy3F7iQt2AJt4Lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=FAvlIeaetW6TXY/s0OmOHnDB55NCsbBnA2rRp6ZET2h465pqjjvjYRtnKKqLpqQjqGaRFqfYKszLZf0TTbu8N/6BwmuxAykI6zYsayueZH3WiPEitMherMoKXmeUoQ4sgoymnFLhS9rU6UvQoHjE5f0oxnfifN4A+xaQQLNRjzaYrgfJyF4/eKjexGUpJzkiwLAotoBvLa6PMN8yHsh502su+68d2myAmOy/SRuvQDlSrJUfgXvwbeYt5M7/OpdVBdDRqTIeaaubFgReQugsQvWexN7a8NdqVBgpJ7d5vctNzkmDGjIoDIr/3U8aJucSUblvMlbgSaO+ZLJBDUw5lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:17 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:16:17 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:18 +0530
Subject: [PATCH v21 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-7-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=Qg+RcOzPBWLuV61D/DOFypqcKcIBY9pFGoAJINGnksmyanEhY3POa6xEDomoaIHaonCscmXzZ
 JPLK1BoTw8LB3xYRfwinqfFEE2S1/6OAbBZRNjrkXgQC4ZKA/r4ST2A
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a8dd11-18df-4a1e-1dfd-08de395f1b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTczZDhwUUs5THNWdlVDeWFHcGdpVVp1SzZlR201U2Z3UXFBTzk4eVE4aDFJ?=
 =?utf-8?B?RFZQZS9kWkgzbUxPcDdyVTNIM29PSFdudUhpMmFjZnpKRm9vN25nUm4wS1Va?=
 =?utf-8?B?dGVQcHlrVnF4WmlLV1lHTm00MDZzeDZFTmUrZEdtbkowN1MyNXh0TGpmRDBJ?=
 =?utf-8?B?S0NZVDlKTzZER1FRRGZTbFY3RmJ3aWdvOUNlanNOYUJTbVFkNEd3eEUyYW5o?=
 =?utf-8?B?MmVBUzRPUFRFcW1HSm1ScEZNajlBZW9Qc0FwVDFGeEQwdEZYZUltU09md0Vn?=
 =?utf-8?B?VnJ1UlpQdU5OMll4RVY5eFFpc3FiVEdRbzdSVTFVSmg5YVRGVWxPZ2o3QTB3?=
 =?utf-8?B?MjZSRlNpQmtYZHZQVjk4UEJQVnNPQ3BlQ2Z0MVhIVnNTZTdWRjkvYms2Mmxo?=
 =?utf-8?B?eEV6OWpjazB3VmVTSlJGQncxcThLOGZMK1dnb1czOXdXZEdzQm1penJUb3NW?=
 =?utf-8?B?eHFZZ2xyMmVtYlN1ekNpODVQNzJwNXJBZjVJcnJaU2cxVWVJOTZuSmltNTV1?=
 =?utf-8?B?L3BPd2JvK2kxZVJWNjByQmJnTmtzL0lBQWNrQ0d5cmdRVVNVOUNzZ1VCc05R?=
 =?utf-8?B?VFlZQnRlcHVIbHhTZlZwU3VtemF0MkFIWUllNUg4MTFtK3RKc3p1VjZDQVhQ?=
 =?utf-8?B?VVdDNDl6NndqZ2pFQXY3T2ZRV1RSQ2RrbnRqbEhKOHQwanMyNkgyNWZtV0ZK?=
 =?utf-8?B?NXR5VFRwTzhRMlplUCs5N1QyVDFWOVZMOFFDNElIYmZIS1dtZCtyRzcyenR0?=
 =?utf-8?B?SEFsWCtDNTRhSnVQNENyQkd0eUQzbTdBUStIVWw1UlZaeTlkQU4zOGlaT2R5?=
 =?utf-8?B?S1JTZzA5TGxBRGJWdjJXeXFGVzBMYWhPK0QvcVRkS21PemxXU01lempLaVV6?=
 =?utf-8?B?cWc5UGtYTnc2c1NnU0ZDQ3pxc3pVVjZkWGdRVlNJcW1rcS9xV2lNL2lJeGU3?=
 =?utf-8?B?c1NVNUNBVFg1SFdjMGhwNm5xRW5mRWNBcDBVR2x4TnNOL0p1UFc1RklFMjQr?=
 =?utf-8?B?ZWY4Skw3SUhBN3VnYlRHVHd2RHJWTG4za1dHdXFVeDVpMU12cUR6S1IxNEdB?=
 =?utf-8?B?RllOQXhnUTFMT292ZTFiNzdBWW1IQmhmemloazZXSHJRYnpRT3ZpY3JJTkRx?=
 =?utf-8?B?Wm0yQ09hOEZsdUs1RzlxVTNzQ2NVamkrZGM3ODl3djZXd2RlZ1M4TmhCOC95?=
 =?utf-8?B?ektYazBOTHRBQWx4VURGTG1ndE5XTm5ick15SHFpcitwTlZ4YjBjZnQ3aGZw?=
 =?utf-8?B?dUhuQy8rNFRIZ2dSSTY5UEN3bU5UOVM3czd4YmZDOEx3Nk5MNVlRYm9OZ2xv?=
 =?utf-8?B?MEtzMXd6by9PY2Rjd2o2Q2J5bjc4b3ZxWDJEOE93NlREWjAyWE02K3ZxN0Vv?=
 =?utf-8?B?WnBCb1pjclJJWGYycGk5R1crd2lQZjBodlh5WTBEeUtXSFVYOW9HWWxSUDdr?=
 =?utf-8?B?bzlRZVFqR3g2RUJxekpFNGJ1bDFLcTgvZmMyNUprM1hMVmZaUk12WFZhdlYx?=
 =?utf-8?B?OXBUVEJvTnV3dGk1SG0zOHdUeGF0QlZuTENyL3hoVEVySWdxTHNCa2gxZHBZ?=
 =?utf-8?B?cXA4UFdxMnNuVjlXeHhxeTcxWTlFUDhXVk50MGRQcWRiZTUvcU9JWFYrWnFL?=
 =?utf-8?B?VzdTMHkvdVhjL1VRc0RrVi9ZYUVMWWZ6eU9YNWRJZWlQOUk1RWt5MThMZHA5?=
 =?utf-8?B?OWRjUUR3cHQ0ZHlBUWdtQi9EdWQ2LytEa3NrQ3I2WDFiblNBNy9vYUJMMUpG?=
 =?utf-8?B?VzZMWDFFNlU5LzFiWitLc3F3L2JicDhnZitaa3lYWHZmbzRGUHJuMTQ5K0tV?=
 =?utf-8?B?VXFHY1lEaFBGaHBZTHdQQU1oVlhNWktvaUZ1eEcrYU1NQWFTdXhPbW9HcEhT?=
 =?utf-8?B?NXN2SWdYdEQ5WXVZRnEyMExVdkc2ZEZoRjhtMk1YMXo2Rmp0OE5tNllqRU5s?=
 =?utf-8?B?eEFXSHQyVnVTSlFMWEd3WUUvWm5pajJKcGNZN0xxWmZvdHptbTMvbkYxK2Qv?=
 =?utf-8?B?OVdDY1BEL2FwWmZKdlVEYXdmdTB4dVp1ZkV3RWs3Ty8xTk1Fd3djQ1JYeFRL?=
 =?utf-8?Q?LN+C+j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlTbVozazVRdzBIb2VNQlVOUURLZndVNlNTVVF6SnZVcXJJb2xGUW1vU1lD?=
 =?utf-8?B?RlcrakRrYkZFUWs0QVJqNTNSUzloWjNCbGVBTURlL3V0QWxWNTUyVndVQm1o?=
 =?utf-8?B?SDFHMStPblYwd2g2aEhvYWpjUlNQZzFGZ0dmSU5IeTFiWHJwYVVYOFhpM2N3?=
 =?utf-8?B?U3ZnWFNzcDhVUUMxK3EvZWpLalE2WDBLeDZqa2ZKMnZFN3dzNUVvOEF3UEw0?=
 =?utf-8?B?ckRVZDRPSUIzNWh2L1I2Yjcvb1BrclI0Z3Ewem1mWWh1ZENUZ2lyNndRZHIw?=
 =?utf-8?B?TTZyNmRuUFRUQWJHb04wNGNTem5FdVI2dHVuOHFvY2F5VGdDOEk2c2haZGg0?=
 =?utf-8?B?VUlsN1YyQUo2elBYbFRFM0hBOVVQclFRWjBDWHJhN2xtS0V2dkk3K3UrSHdF?=
 =?utf-8?B?TnBWNFFWY2s4RWwwWEpMbi8vanNuS2VRQ0ZmditYSDVXNGI0L0hiNFl6cWF5?=
 =?utf-8?B?Y1FWbnB2MElFS05PaC9xWm5LV1ZUcXpXZE83L1pmKzhKakoycS9vNEdpNlIx?=
 =?utf-8?B?K2swUkttYm5SUDZvdDlZbUhKL2g0cGtIUHZKS2c5dk1nUE5UTU9wU3kxZjNh?=
 =?utf-8?B?UEIvRTIwaXd1UWJyS2FNeEJoSTkrZnVndG1QZzkwY1U4MDB4ZitZeWI2Q3dG?=
 =?utf-8?B?bHJ0d1orRDZxVm1jMnBNRytPNUtIZ2QydGgzWTZxcEEwVlNWMzFWMlpmdGhC?=
 =?utf-8?B?dnBsajFERTVhb2tVRFJCY0xOeUxwb2tRMGZwZE55U2t5NC9SdnZ4RDFSUWU2?=
 =?utf-8?B?emlPUDNXUXBrVVQyQWpqMHROWkhWZDZGb3g2NzZpMlFnWVl5elNrQm1UbHVV?=
 =?utf-8?B?bnpzTTZiT2REUjdHWkYzbDR6RXlDTE5UWWJXTHowaGRuL3VHd3B1NkJvbnh4?=
 =?utf-8?B?c1NHS1Bzckk1QU00RTZLa0ZPOTU2b0hTSTU3aC9SdVVWRVhURmZ3OFdRZzNw?=
 =?utf-8?B?elhwZnV3RElZNmxqZXNlNXYzNTJ6VTd1RE5xL0RqQkkxSDRlbVhvYkZ4S21N?=
 =?utf-8?B?NE5GTGdDR3R3clRiYnBYd1hrVVl5cllqbGJhdmlia29IRGtGb2JoR2Zoa2VH?=
 =?utf-8?B?N1ZUQ2dxSnI4a3pMVFVVRG5Fa053WGt4bkh1LzlsY0pPRlF0Z0owRlFDZGw5?=
 =?utf-8?B?N0wyYWdNeHpDdmdwalUzWlRGL2RDOTVHRzFaQmVLVEtHWjRNSjMrd0k2NkdO?=
 =?utf-8?B?eFJOam9iUThjT3QzT1ZlQWlxQVJLcmlkVHk1aDJSTEVnajkrL2hIdzBONnBO?=
 =?utf-8?B?c1FtRWlSNHBYbDBhQjJmL0VCcmZ5b09UY210bjVNNU9jcGdiT3FPaEpmWnRl?=
 =?utf-8?B?cjhNNzdjQzAzdzRoaTR6aDFtNTV3YmFLZy95UVJSUlpUSWwyYms1ZnlTVmhq?=
 =?utf-8?B?WmdyaWRiTnRSY01QK01IUmp4ODJTcGdnVVhyUFFDKy9DOWlJckRmVnFDOVdn?=
 =?utf-8?B?QWRvK1dkNG0zSDZ1UzRWL015ZHYrcDY3YjA2M3pmSG9EQTU1WDduQ01VQ0M0?=
 =?utf-8?B?ejR2MXU5M1d2RDZzSTR2ZHY3YmZzOHRrZldtL2QrZjBxeHRTdWVLR2s1NmN1?=
 =?utf-8?B?a1RQTitKN1ZFbHM0WG1IVElqaEljVDN3anBUamdIUm8yL0dRL2c0b2NJdFZ1?=
 =?utf-8?B?ZkVVTy9lOWU5NXMvNjZOdEMwak9hRmg4UXNmYTl4aHhoN1EzM05PRE11MGpT?=
 =?utf-8?B?TVhYRXY1eDVGbmlWRmY1ZmRYb3UwU3RUZHFDT0RtUzlCajkvcHRuSUxUam5q?=
 =?utf-8?B?Z3JTck9zRlA2aTdsdm16VTBHZGE3dE1vWE1ESVJkc0hpU1dEa3hpYmwvL01V?=
 =?utf-8?B?UGp3SytNM2VOakZqbWlERXp5bDMwbjBqT1ZlZ1E2Yjc2MEpiOVhHS2JuaHJs?=
 =?utf-8?B?L1YrVWxJY3ZkWllGMk1OdkpqU2p2SVhTdUZ3K1lETWZJbUtHdW1GbHJEYVFV?=
 =?utf-8?B?YXAzdXQ2TksrMzlrTU9jNGVXbWkxU3ExV3hSVGlmeU9tdDFUbFNOQmNTdmk1?=
 =?utf-8?B?WFF3YWwybVRBb1dRNnlwSHU0Q0FRN2JFUDZIUjh2ajlZamVFWEtZb3dTM083?=
 =?utf-8?B?T1ZGUXN4bVRBUXJqUGE0N1VqQjN6NkxmM1F2NVRJZ2EzK1QwdE40R1ZNL3o2?=
 =?utf-8?Q?0X4L4reeYWkYQF6LjxOrEbjl2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a8dd11-18df-4a1e-1dfd-08de395f1b03
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:17.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+XhOd+BEcOFAvyCf/c5q+GPAfAjhbAUMG6CdYqyW5QjBW0arLr96mdj4iWJbXgSNOr2xtYIE03uwIbGQ3SpFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

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

