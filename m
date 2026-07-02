Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075F47CC83
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984800; cv=fail; b=dEDlADoWvm5fmyfKuarZbBDQKNNmicVUu5+hicUozkAzN8/YQ6idF9GlfhFyJfySoLwMLDVxogPeTeGTcfHfDLMig9poZGG5/uHLhe43r6bwWLpJjELbka/Z24NZTyjaBZErUDzUEdPQfqT8iOFJhQVA/ByHpRGTsIADyZKVSEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984800; c=relaxed/simple;
	bh=hynBnfuzU73z0g8p9HRrl20Mwq5aZhffXr6KwViNTeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOqLQAQ7yGImpxZS0Og+3VPG490NabYrGnRHek+1hru6aAbOgX6i71ah9WV+MhO1asCdrUHpvLkTc457dJOPr9RpgZujKmlpcGRfcTxQZBOijCveYGV3dcI1EXCKqL66z9rObIzLooCzjfc4dqd9NDd1B1zu8Jx2u7C1M7MFP4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jNcSSpFL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=otS6HTO0; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jNcSSpFL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="otS6HTO0"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66295SFK2028490;
	Thu, 2 Jul 2026 04:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fsjiWethRlG4rzb1X9BsBbunsLIv28hcJ4BVZt5/G
	QM=; b=jNcSSpFLZz5dAG5ykwwGqLqoXwyqZejop16JlwtnXBSKWmbxJK9dwpcb3
	iV6zLZWkLGguGuEOstUatWo3Icg/g3vV8zSaLm9oTnYRRi0ttK4clIYi2WQS7Rwo
	uzL5d4X3CSkDSeikwVe3uAAUelsGq2opfHVNA6Wah4lRUL+veTzgq1ny4G0BytSN
	jW7dc2dhg+eVnAQj9R6m1v8ongOfW1DjYrx/idygy+BahUlbgbevZV1z5ES637jm
	F6fOnj/7AVHv34f6Icd5vwZmEeP6fXAU4pnCZrBNebwTyk9R50uoSP91jl03h7+6
	pm3iqH9FzpZWNu9lkhlbJvV7GyVnQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5n23g3v9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL1+2dJGVQ3ShH4KmxLOHi7TbifN3AywZprwQF+y+rY2aU3HxZ0S+nXWGtB2Cn7/cgybe8qznRtgflvrJMR4P8xVgFkVyUlXr4x0T+NszkU6W8cA/0qdeCLgQypXRy8BMPgZXMLbbQrhTDXLPKxNSIjE7cCYG7adN3yCdpRlyJ6cmlkR1KzAoL9xc3ZapQIAC94jZifBsF2QQwnRyvoGKKf8giqNNM5VX1zH4w88s+eivYiXzqTb9BcrrYL8bPvEOnKO8+E8EGx+PWCoBUsjLedxidcRRu3HB99bxk+fSjmDYPFGaXIur0hefrHBPCP47S597rMG3stP6HpwoHX0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsjiWethRlG4rzb1X9BsBbunsLIv28hcJ4BVZt5/GQM=;
 b=m3NKiinWvzz5kUbHNI5sNP1tldLNIGlKEzlfu1z8CtNyRooN8t0Btr9tq57vEcTGkcS9P3fqbcTPbr8ibM9wFmFNC+VqSCUqBG8JjHkZgj9om/HIAUkELHennDBrO99PN5p2GkAEhiibfiaOIGKh/036KVaplNfLd1J9To26leJE4noOx9VRbIv1AZ2ITBVDiXVHlOSkKW8T4Q1ift0R9DScfZdl+ibihinTb8fAlrPSqS27GbcRMXmeIc09Q5dE6jndTgG2IRAs1u6vtVTOgiVGy/ghet4izm8757VjCAMaf+IngewsCxloBnO6F75GXuLknHctSS/ZB/yIgbUqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsjiWethRlG4rzb1X9BsBbunsLIv28hcJ4BVZt5/GQM=;
 b=otS6HTO0M5y3U+mWlrwYuis1nftx/PshCv9kvvVZ6YJWZKCiqOCboy3RSX5jV0w5sKx0IBfMGwQS9h1OpuBufes2fsyUXPSC8ADjuyI16IPhp1NGzCrlrcP6ovBVVX05WtHhKeZ9+2cRbfdf3DWFGXrdH6LrWjEkTNK0lUu5e0I=
Received: from SJ0PR13CA0169.namprd13.prod.outlook.com (2603:10b6:a03:2c7::24)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:32:48 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::61) by SJ0PR13CA0169.outlook.office365.com
 (2603:10b6:a03:2c7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.3 via Frontend Transport; Thu, 2
 Jul 2026 09:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:48 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:47 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:47 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb13611021;
	Thu, 2 Jul 2026 04:32:40 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 08/18] arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter board
Date: Thu, 2 Jul 2026 15:01:13 +0530
Message-ID: <20260702093123.1048575-9-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b4f60b-09ef-4e56-832c-08ded81ce141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|36860700016|1800799024|18002099003|56012099006|3023799007|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	umxwpZfZ6gJ6oOZWHOhHmneWa9vGSVb5ID7wrNPBJinP0ReohSpt50Gf9wWOsTbo729N+I00RjvR5q8lYDz438Css1+r94ZtFr6sRMgC6VmP07M88H/GUa6TlbWeuLSsri1dRHeRv1H5Dtzk/YUKelKhUKVZhFqyEZ0fjl0GMLASVZgiEboLtPlFR/ybZjgSM5gzWlCdAIH2dHCiIbYWBrUR7IuqNfxdR30sii+gpwb3lczgfYZL2NrwEedOQAsEtvCD0Ft3M8v6NCefKuXj2USUbM7H6lStOarhjCXfUE8fS/1LV56rTOdM5kZMja/KwU91MwFPhMe+ZxoEV2Oy+utCCCGtAiTK9rAv2/0RfPWG6ZRTJqqPGk0RS7j19GxqGn2Lw0DhcGBGPYpzyqLgddXF/94DSTF427FX+XA1Ux8NAUgzLSIsoRvBr0FukOUexJuJRioM/hzil6yjCN61kNWLGL5UMQ2Dk55ytItLsCNtT4cNjIKvtxb1zVFn1f4i7aSX9NR0brFFFr6yu90+PG0VytirJmfJ/iSRncfHAliaZloOdm/ELroJg5c7A2AS9Z6/X8C+VoEJ56RKHb4mjExqmz5EBUokmlJ5aJHQHIDipW677eNQE85jAC+6BRNoQL7OAkXD5J9S37hFB5nObQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(56012099006)(3023799007)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sNInSaaOFDMsOu0Zi7M1tc54oB0qUvMfEFKdEkKwmk2QVyuiQioac+spR6Scp6TjtvRy44SM3cFFTQtpF6I9UTzdP1/v3ZOwYdnWunjcadzX6jxhO6ruOpWShkVPsjvRO4mL/FUrVfYNuEz4ZMJ4joczQEiRVBNe0NRK7jbX01Gyvs02HTIVQiuPzNktBo32rlCHU5hZ1cQbJu6I4vhIbiHLDmBYpa617oEhZRXdje1e+TaSqS1V9k1ZKVlw0YrykEdRUCveKmD1VsZZBnKmRX9XNBHrUcAnCpfILmOCKGPvndyVVXkwHtn8kmmTl8WlCO9vQocpFruKTLUkKRxebnhES5knJTDygTMsxPI9iCk7U2/0tdgdVsO0MLZrJVEHI3z7XJzQICyeLgk9drS5XUoVLCkeSpIQp9JgL0p4AvqJI2YBxo5zNSKpZ6BItM4U
X-Exchange-RoutingPolicyChecked:
	hc69eXj6gY44FAqP/SHy2qSltmWQMX8O1vRG6Eze32Q5tfLnU0JFFoJ+MBB2VsfEN/NKvfJNBByq0WVgXWMvld9X2qXVva7ycQ9irwat8+jXPaHUSPnzH4s58qaiHrPGy6gMPi4FtON/Fs2rMzkDP8iQjhk7oZ/j6DGAP95B3/JP9Dh7Ri69X130kQiYFoOpCffvO9y0LYA9IQvwq+09JN3SexphMnUApCO+HRMb5LZMbR3GAVp088LYGkmRezrBA0tx+7N1H2+TCXnDZ7wlHvf76DiuL2H5IH74MVHpl4uOpgZOEM2y6JRSAqlLZrKaFRk50t7dWQOo9NF6AH4gRg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:48.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b4f60b-09ef-4e56-832c-08ded81ce141
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2S7gC4tHWLyS
 IimiNoPO32hF2hdZzMnMALWLsr7JfEkzjwB9Wi+gd5BHDH1DfEuKANGgj8OYLLmNTZOjTOQsfWH
 Vi3OIjtE0+cbUkso9So2vdMRuDiSiuQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX+jJFuvf1Ypsq
 xQYLfINXTy3HoldoT6gnlQbsyTEG5uEW4jmrbvZk1mY2/LRRc6t5stAiDhFAzCIEe7MQ8gl9acS
 mT1slGSsG1aw5uDAcHEp0kiX8c/FxCCDY/qhqDPfGlNLjS5RF4sfXTbMiqKun21p/Co9uLVXLUo
 nv94JFRRMvwsh3cG5zqHYFIa1WheI7r0TPabLvqXGyb/cdDZucw5ouomQ9xyIlOlF5/GG9rwTBn
 QLktSbCwhDqFNZ5D+NOGzhLY5ig1WLHIxQn5wynzz+0X1ljTC9fvYlWCmGBMonVvI22iqCSWCZp
 XwTn+grtol7esqZSex2S7Yt2upmZshYmilq4oFVkxAFRwnr3OzA+7wuug/M0zbhLSoUyQnTlzgw
 29UKMG9O/RkJrfmJwMk3NwwO7JnrjY5iEw33Anvh4R3YwfBNYsmkrzsocWz2SnmZxhYUJQkbYLj
 bcXsH8DOsYrunE/tvIQ==
X-Authority-Analysis: v=2.4 cv=DN+/JSNb c=1 sm=1 tr=0 ts=6a463045 cx=c_pps
 a=cLTib2BoJD1e+Gs0wkBYAA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=6Gx5YW5ajZytYw55i70A:9 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-GUID: NtccXHsZ2yKBwdfl6sYyesXQGZ7c7XfI
X-Proofpoint-ORIG-GUID: NtccXHsZ2yKBwdfl6sYyesXQGZ7c7XfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721S2.

CSI2RX connectivity on J784S4 and J742S2 is the same as that of J721S2,
hence the same overlay can be reused.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   7 +
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 191 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7e2ed5c94e79..79ce2ff38cc3 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -160,6 +160,7 @@ k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
@@ -283,6 +284,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -293,6 +296,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
+k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -351,11 +356,13 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
+	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
new file mode 100644
index 000000000000..f200cdaa1bab
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721S2 and J784S4 EVM
+ * https://svtronics.com/portfolio/evm577pfusion-v1-0-fusion/
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x36>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0{
+				reg= <0>;
+				status = "disabled";
+			};
+
+			port@1{
+				reg= <1>;
+				status = "disabled";
+			};
+
+			port@2{
+				reg= <2>;
+				status = "disabled";
+			};
+
+			port@3{
+				reg= <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5{
+				reg= <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy0: endpoint {
+				remote-endpoint = <&ds90ub960_0_csi_out>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2_phy1: endpoint {
+				remote-endpoint = <&ds90ub960_1_csi_out>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1

