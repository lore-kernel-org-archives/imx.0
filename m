Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060FA22258C
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768881172; cv=fail; b=cAfnkXhNfOFijwjFivNeZlx/ebfXADg3f1Vcc74I6ME2ODOMKYgeraujh+/z8gnXgJ1ozEWRN+Y0Nu4uCaH3N3dieaJByOyppYvASBIEzf4VeN2SngNU3UqObUpnxI6nSXHHbypoXfQSnsCLnMKRAQOBWJRmbCEwgiRKN+icMvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768881172; c=relaxed/simple;
	bh=qwISwCRPfoqq9U/YteKkKwE4KSfaXb1Im7nwKOpmHKk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fK2KdWSx9Gd8G57DIoyDCUogg8Bsf6+JhnWYn8jUdP7rL5+6Cmv2iQNMFDVQ9h/1prEeaZMD9T87avwQ7F4m9h22hf+bhK/5Dbk4DLd+Fk9hHqVB2eLr8pmQCV6y7NPu4qvY0NSvkXzu/h9yf/MUWrvPJp82tDNuNIOu9Cx9xZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bLfTgz2e; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bLfTgz2e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtTTh0IkU0DI+YQcgEWTTM1rv0r61LQsbxEMOifK4NtFzX9ch2oFt0dRrmkbBXQlfAH47FBhaXqQLXDnQjjnnrzjy4mX21l+Tc36tdLPXnGs53Aoj9eUb5D52SR7/AJOQ0T237rJ8V8M5z4S40VIpbriegIzIjTxL98eEL+b0VCL8bCEsUSxNax/KPrIVQFpPtPgHBYkWfycOAJEH7wuFsRGBzKvO0VaLQnK7ZRG308TXA60VFE8KmvCUlg92qyhMp7ZUOMEbGwlg0HSXI/rZqd8zb7yYpQEzMsVzYIPvYRuxJ7PQL0XX0rQRhIFUbaS1Zfi3ekfMx/o+Y4dmpdkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4OKstXLqNPE2YZ86cKPiDOmktQGcfxrK5TXWQfy864=;
 b=a0FvsYul7/SW5iOFxvKTbgK1bOaayNziautTcU76SmirfXE2HrHiPqNY83w5knIPDk++Yj81xjP4MlizexWl7FDLFO/A9ppLvxshVp8pk4pKWBRMr7CM8pc4sql+Pt3hocC5zLspYVmpdYBj06wP0wck4GF7ZvGJmB/eoRxCYFMPXfgdF3PjJz6lPA8xEnhM0JVOxj6IFf6qqrGWaGJEX9/F5Mu/I9u5LBtyfFHpNxp0isulVzdUY5el/DElsfr9YsFSfrhUvdv05H9qGtkRSqvODkIcj8KUwluLNJtEyvqwJ8sA2d4OJOJH5XNCE7TG1REWxFQCZrD7iRyLMGZZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4OKstXLqNPE2YZ86cKPiDOmktQGcfxrK5TXWQfy864=;
 b=bLfTgz2eFxMjuI+OAdkLcQLHMNhTdAd/9881fsH7OnckYhN0rwo1i36ra3r1fH0PIYlaps0S5IDj/5d2j1zI4G8YUQ2A96hlATBi9VIZR30oBhq73npPxMTA0zL+TI7h65mAh5Ez/KExaThrpAxZpMoCSOV96fEYT9NVH5LSTPWa5/34wqQob/WCz3jRULx1Ek1Q05q0V1bfX4TWVa+lMTFL5Wg0GtfvCTAQu+AjngEFEvYsH01za6ryVq/MfkSf3r3rHS4y7h2+HjtH6uSPCCa3ByPj157gaBX5JeVuuXhVZwdNUfPE4womeLs6OIQOg58FYUYtHlD+DdzYubyTsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:52:46 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:52:46 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] ASoC: fsl_audmix: Support the i.MX952 platform
Date: Tue, 20 Jan 2026 11:52:06 +0800
Message-Id: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: e288f702-bc49-4dfa-3e6a-08de57d75eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YvGixpu+iE34uz7RqL/18QkLXNlvEHj5edO2ifCyV2zuifWajYVX2CSV071T?=
 =?us-ascii?Q?a/+q2748Gh3GTK7TE0TSEwZ+cpZYtIHuSK5KheJc07v5wEOzcTJGkoImw1UY?=
 =?us-ascii?Q?8ue3ArPbyfubYUHFeVF9Il/vykvc4++IdNxiTGeU+2VmoOnRu1HDBXNFkUck?=
 =?us-ascii?Q?1Z8nempTeJ9kQW8CqoD2/GMpCye20YftU7ouTBGB44mrI18J/fqrlFh3OjdO?=
 =?us-ascii?Q?4Nd0hhW5M3688M6UWuxjxgrItJU/0ip/E2oGMr8IhAg0WTgVedLiXCCk2ySU?=
 =?us-ascii?Q?xVtYYUCk/fLz4sT/CbC3rbYa1ak/fuJ+s+njASoPFKaP9p2qRuxbvhLzrPZr?=
 =?us-ascii?Q?9ANPpD8YOf+IFbyw18GgJiLDtUGRyYIEpsTpg7CYIJ//01vqzemWtresSDu9?=
 =?us-ascii?Q?rhyXWuU2kB+MnnppqPizivkSLf050y1MHzTcfBIg+l0OLPh1ZCoSu6VYWp/j?=
 =?us-ascii?Q?j1Hhc3DKWAaBiJxShJN+hJrRKiofcDVhAe+RO6XYOBa3aOfjPnIhhjO15GUR?=
 =?us-ascii?Q?sFOetEnJwGj1aVx8/Lu49b9EpKC/fLjebh9ZleK92qA+B40NEntnEx6QxMTV?=
 =?us-ascii?Q?abS0CrlTOIetJ4mlWUNAa5ZNcs+81B15DGa4pG+EYIRCn8NtgXLpaqKnYGgE?=
 =?us-ascii?Q?X61qzS4qd1f3LBY8rX253OBAzQYrmyRk4dx1saPhXmTpedSWu2QE5OrNYm+T?=
 =?us-ascii?Q?eJJM6cNj9eyvXbF+ZpwqUwkFDIwZn9Rui55/DtKwNaWaidiSB1gA75gRyrKd?=
 =?us-ascii?Q?I2xI1oFJm5BOXr4Uxg19lWea4NSUtu09F1D4nFrQLYcmPeMMz75fE3cMTnag?=
 =?us-ascii?Q?mcJ+s30vSrXL4b0IYdmD5ZQa1rl2iJJlG0UZqfOkSpTxHVGSqW44d4apItha?=
 =?us-ascii?Q?6wzNWu69ukxvpz14fFw19Tykdr4DR2rDJuboZneMj7kkG5g/bSnES8xVRRCg?=
 =?us-ascii?Q?ZdK6noO4Dc9sI/ox97xzHpY9c3ss6HWsW3nsBgcBglGEduZBapGJl2JFzYzA?=
 =?us-ascii?Q?Mo78XZJBlp28bB6FTOl5qlKQmF/+Q+LFtA4eJb5AzDneMkE7sBsTRShLKYGl?=
 =?us-ascii?Q?FT6skMvSS/J1fobnOyrveFJaDx4FSR+GSJhsuRW2R11Zj66XuuKG+8Ev67MK?=
 =?us-ascii?Q?uahLk1acgKaB/04Eo11jF2zYzfp3ffdj1HbMjz/wyMUcyVBEYm/F7siIv9zo?=
 =?us-ascii?Q?wWLQh8iUOSNMSI4wG2jESgx2bJ47qs1V0YmqFStBe/goyhg4TRt0zks1B3jm?=
 =?us-ascii?Q?fOIpbTkWF2Es5UvPJjVE3NZUgzVGhBpMCinP2471w5cWzVEWRs32NxujARI5?=
 =?us-ascii?Q?ymBXtJ1RaI6MUB7CXc5D55G7kTN9eMIW027Fwz1xrmm1+6BFycU3FlM2bLLt?=
 =?us-ascii?Q?1QgdXgNraVBYvtLasIJBbt0be7K85zSM5l+SU7AEyueXdv1jqxtsOIFVR7LG?=
 =?us-ascii?Q?A0i6uZvxmt2G5ei8h9coKC0ySHQ0q+2PPSuEVgClSfUITP9seQhEfTNvYBkZ?=
 =?us-ascii?Q?hj7iYFFuEE7pHnZuJql8E6DfnttYHKeTbo8rkSChAdNqRbd50FaQk61VARjc?=
 =?us-ascii?Q?XLCCKvGAsikJnKo+w+Lt37hnDEPwomGsNIsU59BP+aRsFOSacZTsM5HKZ2ob?=
 =?us-ascii?Q?zdgXCglgYJp4yVdifH6/ki37PlWwcrsMV20FiR+8eKVs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rA0pCPr5Vf8XllfBFoEnQEGMn+Q1iva2mQ5XMu5urQnj3KmfdqL86ScCWgwu?=
 =?us-ascii?Q?hwl/V8cl+FL28JAQ7IbeEGyAqfyHo9L7x0HOzCOYaE79vkaVWNMUaiv0esFr?=
 =?us-ascii?Q?tFZS2KiHbh2LhY3Y3zatpdYtvgHRDTSfZNMJX1vU6Caix+RW0SuHSGPtnWs6?=
 =?us-ascii?Q?YlejsbXsi6HhccnLXNq00tHlPdtsdPqdQFGg3064KMSelS4MqS4JLvqJy19Q?=
 =?us-ascii?Q?KIAoFMqKZn2x/OhCxPHUPinu7NdC/eUzgcEqU0J0k9x/nPjCpwJm117+o9t7?=
 =?us-ascii?Q?cq3jWTDYLG1hRvMvRf2NjNieyq9stBDeYIw82ADY1SqeU3G1QXBof0hqeB6E?=
 =?us-ascii?Q?2DvtSwg9kUsdQYrpslz/1yXkasvu5EI9aEI7obFmxLWazvG6XxjfBZLmkwN3?=
 =?us-ascii?Q?1Fg18EZiAwioBOY27b1vvTLKmIdVcDAp4Qq15K4FbVVEqv2vMmOBMXDMBGY8?=
 =?us-ascii?Q?ae293h/VfK2Zyn2MiGkWsmOlYSG2vLY2X9SRpmgWlVUXBlSAzN1xpHvgpcGo?=
 =?us-ascii?Q?Qkm3vJJ5SVhaZgMev/5bYAwG97zax0oj2Trsc3TiFEx6qan4PwjlAPvpo2NB?=
 =?us-ascii?Q?ZvbMq98mdKo9hX+VDFJBnnqkq4wQUyWirawHaZzzZRHMeRJ8rvJs43RlmmGb?=
 =?us-ascii?Q?8k6lNTY5sDWbBrwQ6F4cIh9PhptTr+D9PIlSMB88XSIMqftfaKLPxf2d8ryb?=
 =?us-ascii?Q?DO2Xxtgsw8fdkCrsJFbWgxj9H8TWB7Y5n298IkR01TxbqpkjTMtyTrvNcqzq?=
 =?us-ascii?Q?VXB/EInOsR0HpSWdJDnxPC6XI/ClF8GMGLO+H3LzvIJyuqwiah0kCGltZm0k?=
 =?us-ascii?Q?UMe7A7TNwljHMUw3HHX3+5aeoYmnwibyGHhg2XBD5hZHob+yB0KlZe1/NaMT?=
 =?us-ascii?Q?dyTvPXL0rI8G5e3TEiUoPHzYLjY4mPj3WcCfQOiwzPmgZHQ3eTty9ZJ2StsK?=
 =?us-ascii?Q?PsmnRpITzMn5CW/ieuq+IUlfEKVJobu1LSzszoFrhWqY95YjqH2mipbhK8Gg?=
 =?us-ascii?Q?wJDAgRJp+4ihgctXFFxk7G2CG10bStoHdbnZpDCk9AvgbjTFOW+NQUFnYeVS?=
 =?us-ascii?Q?XHNhf5c6kBeV41+S+4VZmXdmBXC/MVPBEmN05qka2/3nFhgcqeODChj3Ocxf?=
 =?us-ascii?Q?F2a7Dna/7tTjhy75/qmoSUhhFZ5U7DWLvk8PPETVPWlvWMte7ghd//WcUE1x?=
 =?us-ascii?Q?tvbzsaB78flSzPMpWYi9pR9DCnLzfQSlmNOzfn5tkDZk5MR4FEHREweEkLJ9?=
 =?us-ascii?Q?NyS1yheUx9e25+/xVRm0tLwGIx1DURu2RUuJqNq4u9UzH6gKOmbtRzjePffa?=
 =?us-ascii?Q?hYc3J5vO25wSswuE70OqdW9it1oetfLsK34f3ZY1Ey/MdakVDMmpi404702R?=
 =?us-ascii?Q?E/5pE5g6Dm4E9c4d3rAqfEuz/FGijWNAca33Qbgu2AUExHNv5mdfQ0n/qSAc?=
 =?us-ascii?Q?t20LoA47IlG3vUrollosHBKSds0OA/w1XjofkKvI0Y6rkT553hr2fSHpCtGz?=
 =?us-ascii?Q?FyyhKNIh8soKQ9n/VRd4iNlde4IxutsIFnV+kmDdezhuYBKKi31/un17esd8?=
 =?us-ascii?Q?KH2bfemhDyukHpDLLcseGyo3enrGs+A2aU9tZ+Z4lwh7HyHiYHBBKjQSTuK4?=
 =?us-ascii?Q?JQlk/RpWVBhntWUTFHTbunPE5Wb8ZGqZ9rikZY+Ubq6BWywilbRamjnJjbl3?=
 =?us-ascii?Q?EdbONruWHbUUYn4vSSEu7DFd2QrCnOAyxGzroA7XuxF/bK83EOCYde1A38Om?=
 =?us-ascii?Q?B0TAlX9wIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e288f702-bc49-4dfa-3e6a-08de57d75eef
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:52:46.0025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwoOavIt41NlwDAqjiA+AAv5jG7ueiA255IA3IjJHVWxCadu5twafPt1bedfaPrY22ErVJf15irQEttXqtG46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343

Enable AUDMIX on i.MX952 platform, update dt binding document and
driver.

SAI is connected to AUDMIX, and the AUDMIX can be bypassed, so
add 'fsl,sai-amix-mode' property in SAI binding document for this
case.

Changes in v2:
- Move the property to SAI binding document
- The property name is 'fsl,sai-amix-mode'
- Move the code for above property to SAI driver

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
  ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
  ASoC: fsl_audmix: Add support for i.MX952 platform
  ASoC: fsl_sai: Add AUDMIX mode support on i.MX952

 .../devicetree/bindings/sound/fsl,audmix.yaml   | 16 ++++++++++++++--
 .../devicetree/bindings/sound/fsl,sai.yaml      | 16 ++++++++++++++++
 include/linux/firmware/imx/sm.h                 |  2 ++
 sound/soc/fsl/fsl_audmix.c                      |  3 +++
 sound/soc/fsl/fsl_sai.c                         | 17 +++++++++++++++++
 5 files changed, 52 insertions(+), 2 deletions(-)

-- 
2.34.1

