Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96D76020
	for <imx@lists.linux.dev>; Mon, 29 Jan 2024 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563144; cv=fail; b=XjmimFrdEnWj0/oMtT0/B7LKcHuwBkOd5MINTIU2oNKkUxhTmhlYOSQzO3EvIXmx5YE8NUC2cDDsFQxQaAVWOdm8n/JyZmDwmO0Yi074kTJkKP8/S4YiZQ6EhueOch8HATNwZI7+REI6VMHlkTqAmXqhoJXWdfg7oLyCWOZMoJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563144; c=relaxed/simple;
	bh=cqVCg3YdeOsvdM+NYJlsl779LppRpdUqVTjvgSWAFWU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tETmJfkp88qmAFUYcZIkwuHdNW85LRFsOptUPoM5VXniCYQulevmPBknSP3h8y5Uo5tFbppmzs3F/wCiFxSV/k6ZTiS6lHXrKfT5Lm0HLRwPt9DkOyCv52/TFEhOuHuLKBGoScA1hLbTa0qJDoIY09PhzEd5fhce8NTLzQVL7mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=XelC7Ikm; arc=fail smtp.client-ip=40.107.13.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XelC7Ikm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXXTILvFvd48kbmDDfwE+twXia2r17TUjveugNZr09R2KjSGrGfjpDv9e0XAxVidEsN6rCMFSVPhVLE21llsqBjv4XSFzM1WDiT/jBBOJK+Q8wONEGKCGDFy9vqfdgWbvG6i3sQVhLq1EfqWh+/aYkBBY+IVMDtbL5sGhRyOS53OdLLrv+c4pe/ZxQi8D0619iQsn7oHedr9krRjsMyO7gysnvs4bKJB0C19Qu6tyUwlowTF5+spHRrfWQcu5nA1QSThkoukjjZxtV0268iLk78v6ycdn1p1R4HrRGCtVW3oZFkd0BgpNrRNuHBuPFZ53Mvr6+s9hU9airv6oItDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Z8EyWSjCRLyPer7DgImBB24XPGFcX8PZWLcd7iFws=;
 b=eloOWvv4alHaFqBPDrBoPhc+sdJBjGFhl72VaSAbYsafyefieg5XLTLALjqYtJiyq+H6p4ghGLztkCAKAtI+d0PTwgjIW/pqwh8/B41ZQN/jl0Vr7RHf6WloHIcbe/UGlziAFBgK5ZTY7tTs5vnzVQCFAY9qQKuZzlzLyvDAZluyGTeNdIo90gmzip9QkR7rFkvK2kj4+wCrBunqxua8PvAO3HSNyhXq8/H+3Yo25NLhhfc3T+jcMHZE6o2ztwjI7OChQXT1UxMPToJAptCSnUtrhM9P2m3Q5RaBxMKNminDNAyqKR01bpcSkLJ5WSniRbJP3RJQU+YDgVYfRWSEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8Z8EyWSjCRLyPer7DgImBB24XPGFcX8PZWLcd7iFws=;
 b=XelC7IkmdpQAiGVl22XX11cR7DHbSStpVdFhGZtpfVGZmQUl89ZrylwTJ3sb7em6pE8UldqsLqYF9+nss/ssmcToE+YdCfjKC/OjGCjQbEqLsih/izGoBr3uN9qDY0o4JEA72Lwpq3PS5Nkz7U1VAcGPaZGyakVR6W4y+Ia+pKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 21:18:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:18:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: ulf.hansson@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev
Subject: [PATCH 2/4] dt-bindings: net: fec: add iommus property
Date: Mon, 29 Jan 2024 16:18:35 -0500
Message-Id: <20240129211837.239683-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129211837.239683-1-Frank.Li@nxp.com>
References: <20240129211837.239683-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:806:125::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 54cce242-d8ce-48fc-6e6c-08dc210fe8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Xrfp96yWl72wuDyQvWjJtFlgqKf+i7x7juVvB5C+OD6tNO/lCclK5Lv4+XkXjxeGo/79s6DYJPFJr+loXTyjgpz0SONXOIWYAhL1VpF13DcTwXst6TbrKa66L64C5RusQbu/D2qx1PQ8HmEQ9cSE0O3xf4pTFoZdam52U3bmudWrF2FI/wwsMSdDSFFz/GpE8pr/+UhsqytBIoHUks60ie416r1YiYyu366giKBsEiPrgTJDyl3mqA+SWkAYa5mbYDrjPSq02VDz22bmQQhPj2+WQd24MjslMnkgo0RgrQBmPlSNSJPREFEk17ytOCkP3UJHuYcQoXsuqbtInK1B8A5FwempjBTb4tEbEeUnAd+RuPWV6c85a9da/Ew0Ylo6MI1ZVgW1ptiQWHpIDcQqJeElsfMbRniaCcjtRMYtsWALmeW5RtOK100iC7lfDHeDV4mGRokKDmTftO/mFrroOo1ekgq2UCu4PLRn/Nb7anQSs1RJHx1g4SEBkvvkSSo8OBT5vldn/0nCOqPshbChhgyqd0+aFf5NPigPZmJgxRIvC1icu0oaX/Ibe6U2CrOv2yzognx8zd8jNeRjyxR/GUY79WS8bhA3Zs6M5gPc5yBtzoYbYlALEMr+8mvZXV4gpvYyPpMTUY3LjVtKRgLOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(1076003)(2616005)(41300700001)(921011)(38350700005)(316002)(36756003)(6512007)(478600001)(52116002)(6506007)(6486002)(6666004)(38100700002)(66556008)(66476007)(7416002)(4744005)(5660300002)(2906002)(86362001)(66946007)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CTyBPr9ke6avFr9YCp5iC3bZ7wJmeH5ivkKuG+gx3nCmOA2L4LCHsUoVdAus?=
 =?us-ascii?Q?pFDKSDIP7rrF7IqC2hDeXwS3I0kaMTRCvJYHlQ6W+Px6BGjTzzPza4JpUh7s?=
 =?us-ascii?Q?Z6PKPY1uth5UEtA169g9quw3KvixiuDxzEjZvafDAjvR542W5jJRNXPEcNCH?=
 =?us-ascii?Q?BjfKjI5M7IYXTO+6THrWbylHSCrBr1sGCW3SE5vbBo7kXKTJd0Thu9xCKNAv?=
 =?us-ascii?Q?80kG3c5IyE2R+/v122uG1ZTlc9NbxdqG+LyiyeLwDyxlQBZgRjk2nUHRG7LH?=
 =?us-ascii?Q?Q9/9eL7awGdIqqFv4NLVzoWBc6aPwOVHoytqZb0UzGU8o4Hj4phOLdoe3kr8?=
 =?us-ascii?Q?JjsjQcpWe2E7G0fKm2lrBwcx+J54tVpXiPzoV+iPguEWNpofebzJEgzIfUPT?=
 =?us-ascii?Q?gvwxALD3YFbhSdRUSK4eRP87hbdZfP4kFkJIUr4vXcg2P7bROXdwZMqOpP2e?=
 =?us-ascii?Q?IMMCu+E1QiFoa4pRUyC1Y74OR7fQaBZnE+a2qnc/b/XITFNKhzW+jeZh8BvG?=
 =?us-ascii?Q?gp2qN2kuH3W3bEuhK5ZikNCPnlxxdKJC3JX6DjBCdOeJ04qBSTl1bXpqNiL6?=
 =?us-ascii?Q?Trfd504yA+fkZTJ8m6yejflRMMh8LagIJy9idcwXRKV/wCXgwV5260axFavS?=
 =?us-ascii?Q?W1GksYnMGiBVMh2EfAVNU1YGq8DkPaM/DI8I7YPkx0+HuzTUoGmwdbw3sJiI?=
 =?us-ascii?Q?JyhKE7IAScwR27f7pa30IGEYmkMjsFX1BdFVyvOHDwUMpfUm+66F1NMgWPk7?=
 =?us-ascii?Q?6uIahyhIrlw90IFkG7gFUPcgB0Hm1smpCY5i8tiP9tK9RPgbdM6CZ16PHfxh?=
 =?us-ascii?Q?OrF2JZ6/87A9x0xpHO8pC4U/EZOszqFnv0TedUT+tnyb5f73GjVarHqHyS3e?=
 =?us-ascii?Q?NSGisEoJXNUQNkYs1eHj3hMiq4WqXNRQH/fl3nQagYm97gEAkDn/5j/Ftyzx?=
 =?us-ascii?Q?uAP+GcRoTNV1vUpjss8iFqUGlTPb/01YoZQit9anUwgC1n+7OnrlinPPjIKS?=
 =?us-ascii?Q?sTRQMLnEK2yewBvuEp7KRNM/vuXC6gMT2gAW8PvhTUh0PZaUY1LhyHCcC3iD?=
 =?us-ascii?Q?nFAD9JrsbnzomXIkFqn3MJbF97cc50LT+9GZNEliPdejBdrfKnX0zy40xyHu?=
 =?us-ascii?Q?dCOLXgDWNeOUUh52H2Slw1+oDK1jkVnt4iGGnr9h7TqKAqdeWwCZEtdRkPHj?=
 =?us-ascii?Q?dzClqv8YjWZeH3RwqmWLOnWNcWBX9VrhXqSxSdfN2qnEbMvn+1T97RTAGuKH?=
 =?us-ascii?Q?G/PuceQsu2WiIv4RVWAPYyTgLRTewP8So7OG5gDuDJBRd7cNS4iXd9tzDfLv?=
 =?us-ascii?Q?x+FSWbkPdIfDZBZLubDfZVnfCHQW1qQCxv77vvjkC5h5ftMSHrFQWXXJtAQ2?=
 =?us-ascii?Q?xG9kwv0Qfg0S7fQv++g+9IhNZlOIPk8vr9jvX8gDx0DYNNxu/xI2j3Nuviso?=
 =?us-ascii?Q?DeH+4LeN/XsBOR+y/0cyiSfBm8uuwSsrHtBPaFbpz7pSJFbVFamVMP1cPBfv?=
 =?us-ascii?Q?8PwWxvRM/tad7XzBO6kFT0LGNCguDWJM1wjm3DrEKF4NKzrth3iVt0tYaYaD?=
 =?us-ascii?Q?qP94CCNNrOMo40w1cSPuyQA9WYvPfpt72C1IQCF9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cce242-d8ce-48fc-6e6c-08dc210fe8c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:18:59.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm8EOBZGufgjoZ7LuRVN0lgJAIVvJ9yUyFS85UsR6PcTx+tOFImWtBVfSHoTULQLMUC4GBtjQSyY+Ftvg8so2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

iMX95 and iMX8QM have iommu. Add proerty 'iommus'.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/net/fsl,fec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,fec.yaml b/Documentation/devicetree/bindings/net/fsl,fec.yaml
index 8948a11c994e4..5536c06139cae 100644
--- a/Documentation/devicetree/bindings/net/fsl,fec.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,fec.yaml
@@ -224,6 +224,9 @@ properties:
       Can be omitted thus no delay is observed. Delay is in range of 1ms to 1000ms.
       Other delays are invalid.
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

