Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800A395AF8
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767320; cv=fail; b=B8HaS7NBs0L0U3Q5kfAjS13wLsH/cX0VB3avjylYWp/ehiqzoCl852EGXK6atuusRVdyml4BQzFAu7VvtmRdEfkIJHJ8suoy1wllZCFEmmj4qAh+vUVxiLDd1Lr1+XJqqLI3QsazPyLJ7ZVYhp2+kksHLGHr/VzNhcuwk8p9QAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767320; c=relaxed/simple;
	bh=CUKt/aY78GPJaWoyMHL2Xvqetn4uR/gKiqzW9b1og7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CDZHCpMQq2/+EEiL+afhbCrbktbThjgVyjjKTu/4SoEzP3CeKkH7yAXLYbTia5fw8GOfkzIXyZNghWxYPHTCzXNVcSdNC8eRRvnXV6OkEvd8XNM77ccJFbCVO6Bw5LzaJTsq931JsFRP9ErKyFpYtg3cYT2l6RlKzrIMPzMno4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ou9+A4yG; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ou9+A4yG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCA3Ge1XAYyLEHRyKOfp2QVIY4jyTNp/Nfc2qSf9y6f1Zym04xN3wc9zSULpKmNGLMGjeH5pGuctjpSF5NcFDF2gMJy0B9FR98AIgTkC1lp7b9EXofjY6lS/I0HFT0RWBC8HBVkw6Wb+rpOuMmKWScZottde7K8fjL+vfKlMWRORFlRgk+N+XlWfOBNcsuycxnXvwEXCQsoKKEQ7gdEP9+ePFDIXLoQS7XTnqR9Gd1SuQz4VQu1ucyCdGL8St4qj9b3OiJ85BlX5Nn47jd+Y6dvW3uwUQj1blON12k1TCE2qQ1S/DIc54iwZEsqOmUgRfHdqSGyCA6vzEUBzACRgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUKt/aY78GPJaWoyMHL2Xvqetn4uR/gKiqzW9b1og7o=;
 b=Cls5aXOmZCkjAV1cmLwymILyljW8WITN8H8VNOkXXb1i/6jgjlwJGQuDf1plftvaFtcO/IUrxCjS+RTwQEL9QqUDmXUh6NWpKeu7oeqsrecHTgempfx8Q2v5XQmWPj34Gs7MjdeWAAlDrnYwG/OjufnlzFx/2/wYXCweqJiqcmWp1ksWpI+1UOzAXkF+sdRC8WIPGR+gYJX93rIGq9UF08hMmH5L+j0yT0SV2PvHTdbcHe8h9cTK/mQeYXARYgO85n/jX/CCV0ZPBsFmEMzhRhRiigZNcq6Fod11FWAeFcOVmO9mBgBioLKlgPaDLyviCdOwugCDB6u7Dgluvs6ANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUKt/aY78GPJaWoyMHL2Xvqetn4uR/gKiqzW9b1og7o=;
 b=ou9+A4yGqPZqNSw7zzUq1nXdvfScjYzjNmx3Nfb70xU8MsYct0UQZ36cT8Hf4vr0kY0o2GwMQv7vf06bChIDsJ4b3DZzdmYMHIh/lrSQNkgrlCuUbJS51qeB7/pxyjTTFdX/VUUd9c+bhyGBXugrDfVvlH/Wqc9335EzOT/tiQGHoRUo6KYoUpmGzM4ddTshdH6QmA2Q26T7XMwmx33f5qt+XYbJhtHfre2zVmG6IE+YiptFCsiY6v3TaBhxN0RNWBbiRmHwZYLnuii1t8f5P01B9oR7lYGxkz/+/s1qoknWK+e5Wnxx/VHv4foTQqIhmhNdYEELM4aCywvP/1OThg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8549.eurprd04.prod.outlook.com (2603:10a6:10:2d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:08:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:08:36 +0000
From: Frank.Li@oss.nxp.com
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx93-kontron: Fix memory node
Date: Mon, 29 Jun 2026 17:08:28 -0400
Message-ID: <178276725523.2494559.15497281849836014639.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104311.633297-1-frieder@fris.de>
References: <20260616104311.633297-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:510:4::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 79230fa9-dfd5-48c9-83d3-08ded6229572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|1800799024|366016|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/Nq0sO+cM4X49x42x0YL8QN3Au+IfhA0XE6+vji2Dglkp9ruBhJbpDmMwt+k99GQgTdMtCTUv3i73HIxc2arurpXUCDW2DOUM96qVrp9CcYlikvKW5mEldMG7pVt0jZ3LxGNf+HqKps7BOiteRon6g2yCN7NGzvFDCx9Glq2EjdOIuM+/+Xrig9WwI1n1phdnoT/nWsp8bnazMzElQvkQ4mhey87x1RB01e/rfl9X3HKVtYgbtMWbov73kAvFBNsMnqjW415pqd9NUnTCq2RgY3WWMlm16Oh7krcYkF/r0GzUCDbllPgNKBVm0vJxZbR2KJ+/EkmD+58a0IZQ66VIcUwFB1K3+ZvAnLNFQ7ko4xFEdeP5DF7NjLq1EoX1cHQWpfkWjkOXgRk9YDc0RfqF/vwV0T4TKSw+bK4GwcTsnrr45EcFrGbCtslTdt4DoW+LGFisg3w/4nTPjwSPGq9H4AUBSZBswR9FmWNaojYd/P82bm99eL4xO21lOA0r/I0XdvKk8s6X4C3gwJvHvEBcb6Uid7hQ7IpCjugL8+5Tvb6oTvfu6b+NVONT7ZLWIPN1A4wKZOF3ESz/RbrgU2OBotjeV+k//QcQMR4ijl50oEd97AiWKoTgFraurMpMamk368NAbQMeQm8W0MygaVb5JfxzT7KH6ZwCEgRsuYZpjUllPi6FKht/WXCI+FtaiDwxPyb9SZAnkySyMcHNJKTAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(1800799024)(366016)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzAzdWdYM0hKVjc0RVE2YWVPSFpsaUxmR1pwcnR6T3E1QkJFMGZFazlGcnBr?=
 =?utf-8?B?VDA0VkZQdG1mUnZZdkIwY3I0YTEyR2pKNzFmNE0yakh1SDlkanRkZngxK3R1?=
 =?utf-8?B?WVI3L3NJQVFIaFAycysyWkJLUzhjTEJPMCt0SE80MmwyUkIrWHVpUWlUR3B6?=
 =?utf-8?B?Y3dWWUVLUjM4cDVFM2JLWkxwY1FpYm5MUmZQNFZ2WDBZM3FyL202TWhUckxm?=
 =?utf-8?B?Y1ZlVlI2ZUlBS0pOK280SCtEZzdDTE1FUldJTFZtcHVuSkFselBwSmhrd1N3?=
 =?utf-8?B?em5vQnBrWDJLNkFxRjZTSFNQUUlmYzVPTHlOczVIVjdVWG9sRGJwMi9zUXlZ?=
 =?utf-8?B?Y3BXU1Rac2UyNWhGdFVFdXpHTWkzSXVRRkh3NjFHVVFBQ1grY2YwVlA4UVZp?=
 =?utf-8?B?eSt0MDFSUE55ZmhvVnh0RDlRRkxWQjd6K21mQzZLWnBja3VUdEV5S291dnFJ?=
 =?utf-8?B?Wm1Zd1FENjc0ZTRGM2NQSHRrbDhTbXdNWEJnZmpmWDhMKzJMcVBzWEtkN2pP?=
 =?utf-8?B?V3VpWmdSWGtyYU80WFJZSERiSlR0ZmZxTkVTNHMwZ2EycUZyZ3E5YUY3Zm9J?=
 =?utf-8?B?WEFKbGJqdkhwZy9KTnUyT3NjL0dkNDRvTmFGVUFxcEpJc25OYU45c2pPaCs0?=
 =?utf-8?B?QmNRR1UyaEhvTlByMHFIenIvbDZaell5TUk3b0JMN2pxVDVMSjJtb1c5VjhR?=
 =?utf-8?B?RlJDalF4amlhMWFaNWVGckNxSXRNVGN6NjRwSVZBNGNNbThrdWoyTDRBYkY4?=
 =?utf-8?B?dDhMRmo4V0YvTFNEN3BVdHpDVlF3ZmJhZzlycU1tSllLQitrd3pKamg4RUZp?=
 =?utf-8?B?ZzFsdCtxVFJFM2h5ZXdOUEw0N1hDTEI0cndPRGYwN08rYkdDaVE2anorV2Zm?=
 =?utf-8?B?NVQ4TVpmOEFSVVhaWG84U1g5Znc2aGhCZFJxQWlKMTJPSEQ3NElmN1BTM0Rp?=
 =?utf-8?B?V29KcFcwdmRpWGczM0d0VHpOK0FPaWI0MnNMenV0amtqUFpPbG5JbkJrZTFo?=
 =?utf-8?B?K0NnSWpGbko5Z0NVQmFTNVI1TGE4Y0paQlhwKytLSCsrZUZNaVNwL2F4Slpp?=
 =?utf-8?B?M0NCWHlZcE5YTFc2QUp1cEVBZHVrUzRRT2wyOGhoa1RLblFpSjRFdTZyYVZh?=
 =?utf-8?B?RWt6ejZIVmQ0VWNaVkJlTFF3SHlpUTE4S0JDNHBNM1dRK2lORW1zRk94a0lX?=
 =?utf-8?B?WW0rbG9nZko2emJWc2JYdWZUcDBWVWxVd3YrVDFpTXVRQjdSSTRIbG1zZWNI?=
 =?utf-8?B?T1ROVjlnMHBwMCtKUEN1WmZ1TFd6Vk00dERTcG9MRFNCWFNuUVk2cE80bzkz?=
 =?utf-8?B?b3FtWVoyYzgzb1VjN3NjdHBFWElsbkwyYTgxV1VHdmNBUVJJQmVKS25QU3F3?=
 =?utf-8?B?d0pNUlp1MU1tVWk1MDFJNytGWStJb0dXRGVrUnNnN2JyajdEQXRVR3lDeC8x?=
 =?utf-8?B?OFVwZ091eGt0TUlFOTNiS2VJbXM4VkgzcU1mWVlOWXYzb1cyZ24zRStkL1Uz?=
 =?utf-8?B?WUJnQitHb0FkcmloRUxIWW9rMlFvKzh1UzdtMDk1Uk40T1hSa3l5dlBmYW8w?=
 =?utf-8?B?Y3N4TjJYL2swZm5lK2NhNlRnZEpwQmVFNEZTNWlmejdOV2tPVy9LdjBsUWNK?=
 =?utf-8?B?Rm1jcW5ZWW5mSXJyc0J5K0FFcS9HRDdjanl2aitYYVZvMHc5Sm5NeEpTTzA0?=
 =?utf-8?B?UzR1SExGR2pUeUM2d1E5anZscC9MaGxPQ3hKOGF3TnpIYkVOQTQyN2tpbnRr?=
 =?utf-8?B?eFRJejBSbFc2Z3hwalRpdGlHWktVeUdJY2xER0pteEV0TXVmWG9HbHRKUHl1?=
 =?utf-8?B?bGpJNXZHYVZ5dUR3RjI1dHRnY002L0YzTk5DWHR3YXJIQVdaNndlT3czWnMv?=
 =?utf-8?B?Z2g1ZE9zcS8rQUZNbDhxZCtHcGF3NU1aY0g2R2x3bVJNOEpWUGk1a0p2UHVD?=
 =?utf-8?B?aThuamRuSWYxMm5qU0J5cWl5ZDdmclRVa1BsNlkwN0VWcEdFNVNpN2R2Q0V4?=
 =?utf-8?B?Tk03NElndy8ra0txSi9hOHk3ZlduYksyMGd0c2d3QmdsOFJnYWVWOFBpUjk2?=
 =?utf-8?B?ODB4UTBLWUlmUVpwd0I0TVRTR0hRcG1KTnMybGd2bUlEQkplbE05QVNFcHBi?=
 =?utf-8?B?b2Yxc3UrOXBxVHBSWmFHTFBvZHhKeDcyWGRnMTdXMzRNT016SEhlMldyYmkz?=
 =?utf-8?B?SWVENHJVYlJsNVN0WjREUzJySjhWdWR6QS85SEg3VUN5Wnpyc01OTWpyTzVS?=
 =?utf-8?B?UC9xUHUzRHU4NG5UdHNYWW1MNTVLbndHcFJ6aDIyYVUyQmY1MFJtY1doTUJ0?=
 =?utf-8?B?d3dGOW9taVRITy9SVUlaZUp3UUIzcjk0UGdGd0ladWJqMWF4YkEzOHZnT3Vr?=
 =?utf-8?Q?CGacVC7XEx80iT3AQmTCXjcqlFVnrEGVJw5l0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79230fa9-dfd5-48c9-83d3-08ded6229572
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:08:35.9160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRZKIyp8FW6UL0fBEDdCl2kJ5XiuTCqPoLDzXcD8BByhx6fCV91fzUYjjLIp4FTVv79egizeUAVfQu6aLe29tQo3sb9+rYMTcurmOKoeTeXPv7SGfbfRO7SYXueb1Gov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8549

From: Frank Li <Frank.Li@nxp.com>


On Tue, 16 Jun 2026 12:43:09 +0200, Frieder Schrempf wrote:
> The start address of the DRAM area is 0x80000000. The minimal
> size of the DDR on the SoM is 1 GiB. Fix this.

Applied, thanks!

[1/1] arm64: dts: imx93-kontron: Fix memory node

Rephrase commit message

Best regards,
--
Frank Li <Frank.Li@nxp.com>
