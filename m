Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022142.outbound.protection.outlook.com [40.107.75.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAF1553A3
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753324510; cv=fail; b=hEHnZtyWRJLN2MBPTot7rxsp/r3iq1z+MtTDC4gfiplhedeb/NrQ+G82wCP5zDKifgqDc2rTeo460ra01+wIVuP69PBHnUieP/Ub9xasH0ESTSEWDXDjv3Frllo2kgcqAmHjAP4ZDcEVMPNLcGR6wcxLve4efSrsbbDPlaWS5iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753324510; c=relaxed/simple;
	bh=CrJRmf/Mx852ARjkGylqHkQ4NKjhcl3Pn5e9F1EluJk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JpAUQiM6Ir8vRXQGdozoe93uECVfscioHxCmQyPVYfQ5W9r/12aavj9QQZ7+snOGOSc1+lglP4VmufYaXPvZOY+SknASWVkEcdaSnNu9ffymue6TYzv6SnQ56Mm5hkeGrdttmXeC7McC7Q6ZPnCFywEkLa3B+OxSaJHXimjhQcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=wx1DWqHs; arc=fail smtp.client-ip=40.107.75.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="wx1DWqHs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfHdVKKcRQuJq0bveAATTcYZ+X3RbkdrGGI8S5PHr80Iu5vYyDAw8Ha+KwuDksM30QGNIleUzwwcG40jlR+IoZXWAV7jlgZYlF8FbaIInBjoB2le47TMVMyuA6ItVgyWqurqzDLaPNDI119Dd4Dog+pa4fkVqg3a9pseVz7wrFkMxO8tkkcoDYeH/D2bjm9vP7QIhonUEo+Q+vhVLWI36zfVZkhutYCLTTYCfVeA4yJPaSKFrWZrgJl3O2OgLj5vBnzRQwpE4ovx/MkoWtmoMfclNKNFqT+t2d7flVT2HCTgmNCtKbvub6qDsdSfFna06FdkeHN/k6aTEllEYBetRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e/OFVkQPSTMrmVxOUTsoLjkFxgmeHQnLR0Nat2U/5c=;
 b=tTAqZM8uHPnUEJvG23xcMg8YDFMt3jgi6ZonPX8tNSh/fT0gNnfLAuzuJjguJTD0diUzxiuqnZgHDAuNIEh3qr+SkzgsNrudm8QNocK+TOsuREWe4klmiD7QG/9dEvWkCNyNMgJBEsvEht4DV8F20M2HeRYH2zoeqJxlDcKTk0jAnyeKBxxEx1F1oD78q8rRHJEFr3cCtb3R+XxxT1TiditgTNThJUJ9/IcHf+Mq2Sg1OjGGjux95q+6Odw6g0PW5VxiLO84N5dvRotiF6FEv64FUL0MRXkvFipyJK/74vTWFhKmvr1jJhPfwl8fVYYGf051fG+y/GE+iGMuDUHj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8e/OFVkQPSTMrmVxOUTsoLjkFxgmeHQnLR0Nat2U/5c=;
 b=wx1DWqHseF0fvOZ9oFawsL7lZzPMazb5i5SJM+hDPRgdIsSkQVRYXT2R3ujkKWfduh3ObJmvWTDJX4XnfeK5j5sCv/0Nv17Ve87DtIk8tOa1KM4mdzHt22oCA0rLCGA4n4kBhOEah0iHtm/sZfwwI1iHtU5BNyYR3CZzvVfGYrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYUPR03MB7032.apcprd03.prod.outlook.com (2603:1096:400:35e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 02:35:03 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::5ac3:4497:4694:db94]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::5ac3:4497:4694:db94%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 02:35:02 +0000
From: Richard Hu <richard.hu@technexion.com>
Date: Thu, 24 Jul 2025 10:34:05 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and
 WB-EDM-G carrier board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-add-technexion-edm-g-imx8m-plus-som-v4-1-d1c88155d6f4@technexion.com>
References: <20250724-add-technexion-edm-g-imx8m-plus-som-v4-0-d1c88155d6f4@technexion.com>
In-Reply-To: <20250724-add-technexion-edm-g-imx8m-plus-som-v4-0-d1c88155d6f4@technexion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Richard Hu <richard.hu@technexion.com>, 
 Ray Chang <ray.chang@technexion.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753324497; l=1270;
 i=richard.hu@technexion.com; s=20250604; h=from:subject:message-id;
 bh=I4DH8XrezDOYWsPjNdFTXTbU/1yxQzjQNMCct5koVK4=;
 b=LrjgR4ipYdhNFTFMIKBSJNZYTnL86Rvjy/N1oMoGBDULVDabzp+jvd4JKr0DVKHVFYmz0bB82
 32850StERl6CkMBwq1yQWWr4ETbClM6S+EbOtSwpXKyY5PbY0LLvpWM
X-Developer-Key: i=richard.hu@technexion.com; a=ed25519;
 pk=MKoW0/U0r4MjJdRNaq37Tb25KE1fzJUdMN0pa8XBJSA=
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To KL1PR03MB7454.apcprd03.prod.outlook.com
 (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYUPR03MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 6881b395-7f46-49ef-b100-08ddca5ab0d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amVzNEpqVzR4SnFIamlvalF1d1pTeFN3YklBb2U2eTdqWlp1RUFuOG9sVDND?=
 =?utf-8?B?UEc4M1VDa0FvMjJ4QUZzcEM1N0orTlBQcXdlQ1k5bktaMXRQdHd5Q3FNTVYv?=
 =?utf-8?B?QVN4UWxVbVM2aW1QeTZFZW82OCtmNFBUaHEvQXVZUmVNd296aXJ0SFVIdHdm?=
 =?utf-8?B?bTlieXJrbEtjaGZ0SkFSYW5SZTNtV2hOanRlNGQ2R0x2TzRaSHJjcjlTTTdR?=
 =?utf-8?B?U2o5dUpBeVFtbVZDWmNWK05ETjltMmZFQVpBSGdhUElyeERMdHZjZWhSaE5N?=
 =?utf-8?B?RGk1VlVla1FwaVRiSXhkSXVKNVlwQ3g5a0o4WU4wa0VKY0FGaXY5MWJPRFRX?=
 =?utf-8?B?b3ZCVTR4V2owbWsvQ0RtRlVQcjFxQUZ3YXI0UnNlcVJFSHBYdjgwOHBJN2d5?=
 =?utf-8?B?WnRnamd4eFBjLzhFeEwrQVlETUZEdkl1TWpIVmNPbDlZN3FLbFlJeTF0MTEv?=
 =?utf-8?B?SkNEWlYrOXlndm5NWmNCR0l4OFpjdTJ2VDVQWUpkaE43RFJweWJPTU1ZY3U3?=
 =?utf-8?B?M3pLNTBDaStYT3RwaVlSMW9CbG8ydERtVCt1ZmhQUUJaakNpZ3ZnenJYQkcz?=
 =?utf-8?B?Q2wwZzlaMjRKcGJOaWZDWFhyQndzSGttRXZuekhJMDdyS2p3ZXU5RXRGUHd3?=
 =?utf-8?B?M1hFV2tUbWJoL1FDdE4rMEh4OHQ2QUN3WTAxNW5ac3ZCRDFOTGtQUXhOUDJO?=
 =?utf-8?B?Q2YxTlBVdGVtWUdxOHdQUjMvTHNmbEtqZlNXN2xydmFJTEtKWnVWc1VQUll2?=
 =?utf-8?B?VG9pay9iemFIOWFJL29WOUFUUWlCVENxK1pVWHBJb0VMZ3F2QVR3aUEva3Zm?=
 =?utf-8?B?Q1Y4Y2RTOU9sRVZ1d1UxbG5BVUxBbjlaRHNCYnN0c0lWSWIvaVEzOFdwMnhX?=
 =?utf-8?B?Q3JJaC9oWFBUdHV0L3UyRVV1aVBRYXVablJmYmhoaTVyS1ZjWlNWN0xlVGVF?=
 =?utf-8?B?akkzeGtvd3JxTUh3dmhFOFlYSUF4V3NJOThhc1FsaldRVmpPdFBoUytiTWRk?=
 =?utf-8?B?MEVzNElzMVI3NXFKQ1BmL0lvWnFGQXA4d3hOZXA5RXJpWWtiRlJBalpablFv?=
 =?utf-8?B?b2hGcXV5RUI4OVFxQUpySzFZMks1VmpwNUhUWERVZDhjNWNsYXVsa0huMkpw?=
 =?utf-8?B?VUdYcVBCS2RpbkNETi9GY09CSUQvN0ZHeHppM0RpbXZCME9jelpvRTJJOUZo?=
 =?utf-8?B?NE1HNmY3aDNLWExEdCsvbnNoUUJabVNRcEREbU00ODZnNHRmcnFuNENja1Nh?=
 =?utf-8?B?M2VwWnRRLzZtN0xUbkRSaWV3ajEvTVVzdVplMkNDT3dqN0VkNnNQbXpJcTVC?=
 =?utf-8?B?MDc4ZG9xbHNzTkhIKzR3QTUwRkg5TnZVWnM2c2Z2ODNRY2RKdjA1TC9JY0Nx?=
 =?utf-8?B?SnlzY2EzVDJRbUo2Z1hHUThqaVNTdWZVVTlGT2w1MllBeFVLRnNsdzh4akNp?=
 =?utf-8?B?Z2xJOGkveTN6MVlxOU5mdCs0Uno5cXBYN3l3Vk50UG14NEdNYVNsall5aUxy?=
 =?utf-8?B?b0NaMjFHanI3M2QrVmtlTnZyTXhRdUMwSHN4RHlmRkNqYWVMVWMxSHorVmFt?=
 =?utf-8?B?VEt4alRLTXJnYzhpelFjNzdzdUhPdlFHYmRMdVl2Wm9NVmhQeDQxZ0tuNzAy?=
 =?utf-8?B?YnJBb2NVbC83ZitWNUFYMU9FcFZDNUw2cFVkbEY3UlN2eFA0YURIRVBRMWVo?=
 =?utf-8?B?QnJFMTgzR281cElUT2t1ejB3MHFMN0lVOG5VVU1CeEVwcU1vTWJDV1p1Zi9M?=
 =?utf-8?B?UFpqV1dyWEg1VjB0SU1UOTdOSXBsY2Y3blJSY0FuMm5CTDg2dnhnRW9iamVI?=
 =?utf-8?B?Z1lDVityQ0laWUNVbUxQWGRZSUt2MGRqTC9QdWtGU3VFSkdJR1BIem51dzI4?=
 =?utf-8?B?dHhiamdkRnJEa0Fwb1ZGM0pidE0vQTJwUkM4K05CZGhKd1Zsa2x6b1RJc2d3?=
 =?utf-8?B?YjBGTm85U2JiYmgwcm8yb201SDM3SUQrdWhKcEg3SkdtSDhPazVPdGlhd2hY?=
 =?utf-8?B?Q2xKU0Zxa0JBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVN3cUFXdVI0QmxrMUJxTk5oZGZSNk8ySG4rQkNwQ1pGQ25JbDdsYU1jbW9n?=
 =?utf-8?B?R05MUnVOWVZxUm9JcTdqV1pUMlR0UmhMUVpQUFRwb2VyMVpqVE4rM1FZZG5x?=
 =?utf-8?B?RjF3NUo4Um8vWkFkOG92Rm5TRFJTUkszbHJXMThQV2E1UmRPWEE3bjZscms2?=
 =?utf-8?B?U0FRYkhvcy9CdWt0MzRRNzNCZFhHZ2NGYnBnMXFrY0F2R0t4cDUyd2ZQYjZ5?=
 =?utf-8?B?a0VwbnlHKzU0YkE1UWRIc0tsTjJ0a3IydGZGQThqblc5Z0VTS3NRVEIzNFQw?=
 =?utf-8?B?YzFtK2VBOEpCUnFMeTc0MEJpdkZMeDJQVmpXeWpMaS9QSnliKzhmemF0UE5N?=
 =?utf-8?B?cEdSYjdoc2krdmNqSzlLbldLUHFxUVpPWGNaRWZZMmZvMHZOcExFRWU0eW5r?=
 =?utf-8?B?TVRCKzJHUWxyZllhOE05WWx1Rnh0ZTdJdDVuZ2xaQkdoQ1lqOSttWHB5U1Vx?=
 =?utf-8?B?RzBLbnVyR2VlNHZ4bzkyVDJkMVU1cDMwZmxLN01xNm11Y05JOWttUlYvQ0VH?=
 =?utf-8?B?VlVKWWVPSjM4ZWl3QXpQMjhBc1dTSk5IK0VLQlc5WGlSemFEL2UwYVV4YzBr?=
 =?utf-8?B?b2NqUjRVNG5ubzk2QVJpYlFPWkVqcnIwdHRKemozTkR1T2hyWWZGcTNGYTBU?=
 =?utf-8?B?SG5CRngwS0NTaE9xQlBHS0hJWXdqS1paU1RNRUdHZHQvNXk5blppU2lqc3Zr?=
 =?utf-8?B?TDc1cXlLZGhjMGk1MzFWL0xVSkNXNi82U3JJK0VCR0oyOEhPS2h3SG5ZWXp6?=
 =?utf-8?B?VUdjVmhOWllTRmo2cERReFZCa2dOL1V1bytqVzJDeEZzYnprd0cyMnV3aFZB?=
 =?utf-8?B?WmFHUkdEN2lBMlE1ckFsdFQ5UThnMDdiYjJyZzZBeXlweHEyMTBQN0JRMlVs?=
 =?utf-8?B?V1E5SmFTejR4bXQxVGo3NERMNDJmTnZwQ2x0SlFqT1ZMcy9SZ0lCNkMyMTdp?=
 =?utf-8?B?b2RwVjRQZzd4N1J1WVlOck9rS1QvUnpsWjJhN2I3UEdFWndnVG1RdVZmZ1Av?=
 =?utf-8?B?QlJNYml1ZkkzZ3Q5T1ZSdU1vVUROcDJnQytWRWhhaU85bElkZ1FBcVFvVld5?=
 =?utf-8?B?dWZ0cGxmUEh6MG4yUWphbE54MFBZTDlqdDdMZXE5MmlRRWY1SUxBbjk1d2Nw?=
 =?utf-8?B?ZlErcU16aTZtSVBUN2RwMlcxU0FjU3RYcWJxUUlFWmtEOXdxMVJXUzBtVEJw?=
 =?utf-8?B?WVU2eDIweElmNHhNR2gzRC8xNDQ4QzQ1YTVLd0NYN1ZXbnVsME9mbHczK1N5?=
 =?utf-8?B?aVVaQ3R1cFFQekJYVXV0Vm15YlFMVjR0MS9rTFJXMkpWbEdWNkhSRWttZ3Za?=
 =?utf-8?B?VUtRaHV2MkRoSWNtMFV1SFNhYjlUU1NmOEZXOTVKR2V1YkJHNW0wSERGZm9z?=
 =?utf-8?B?NGpTSnBIRFRmcy8xNXFzdWZ1NGN1TFJuWTdVdVFsSDhjNzhaNCsxdmlFdUN1?=
 =?utf-8?B?bitDaTJKWlh2bDczY1Jld3hyM2x2M25qb0dlWWwzUkYrNXVVYXpWalBIUWxh?=
 =?utf-8?B?dk1HeFpSejQ3dTdhcFFEdE1KQTRabm94SUFvK1ZnZktzL0s3MUNmLzFBenMw?=
 =?utf-8?B?dC9abjVTZEtWOHVyaUlGMllIbk93aDFncldMT2V3R2xIV1Y5SlN0dkQvZ1Vn?=
 =?utf-8?B?Mjk0c3d0VWt6NFlBbTB1ajFOT21sZjFDZERvQ2JsQlhhbWUxanY4VEhQb1Nh?=
 =?utf-8?B?ak01REMxUHdsQWVCdjBOMFQwcHp3ZkdLaWpXS1N0RW9zajNlOWN2bWhkUXNq?=
 =?utf-8?B?UnJEdGcwQWJQQUg2MVdRTkw4OVBJZmtGenRKSUNLMWVHVkZIaHdhL2ZRRy9M?=
 =?utf-8?B?Ulg1WEN2dy8zOGVNLzB5cU0rNzh1RXZVUkxEenZBM2ZteHBEdjIwd1Y3YndC?=
 =?utf-8?B?TjhzbURqdHp2UmpjZnhZZVMyL3dTNXFDc3hmUlpWTHptSGVsQ3VveUZueEhZ?=
 =?utf-8?B?ZUttTmRCSWR1L3hqVUdVU1J2SkxCWUo2QXNUdU5IYnRVKzFTTklwNmZGaGpL?=
 =?utf-8?B?U2lhSm5JZ3YxaFBMeXJaRkt3amU3LzVRUmg2OW9HeDNHenp4YldsWWFuaVJF?=
 =?utf-8?B?WnBBdHRYazVWV0FVZTlpV0xHWGRFU3pjRVJRb2xKYUF4UmRNS2FXYWdQVGJG?=
 =?utf-8?B?bEtRaDFtRXFkM0hVZ2grVkhMbVFrZU1NOUxHaWVBWFBNUU1xTHlOaXlBcDJJ?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6881b395-7f46-49ef-b100-08ddca5ab0d0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 02:35:02.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elXdWSREV5fN7rpt+7Q3JyUJhdW5Jh7G4j5qZMR10MJ1/fTNjOdnW8RMKQLoe/c0qLIrXJNBsnosJBXZEgqL6hWLlis7dGZOvkVdcNNETbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7032

From: Ray Chang <ray.chang@technexion.com>

Add support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board.

Signed-off-by: Ray Chang <ray.chang@technexion.com>
Signed-off-by: Richard Hu <richard.hu@technexion.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..a14f7f7dbe0e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1189,6 +1189,13 @@ properties:
           - const: polyhex,imx8mp-debix-som-a       # Polyhex Debix SOM A
           - const: fsl,imx8mp
 
+      - description: TechNexion EDM-G-IMX8M-PLUS SoM based boards
+        items:
+          - enum:
+              - technexion,edm-g-imx8mp-wb          # TechNexion EDM-G-IMX8MP SOM on WB-EDM-G
+          - const: technexion,edm-g-imx8mp          # TechNexion EDM-G-IMX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Toradex Boards with SMARC iMX8M Plus Modules
         items:
           - const: toradex,smarc-imx8mp-dev # Toradex SMARC iMX8M Plus on Toradex SMARC Development Board

-- 
2.43.0

