Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7733E63A6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942600; cv=fail; b=h2a4FtFqkpW8Vw22WDtq6CWfS678p1awe+3QNPU0KPzxXkpsnUh1/EzO9jpr+X8o8fcCo8RwgFaJzJPVO21dIp2gF8+g4f7uR53b4WG5h8YlXghiJI0AtM9G00gq8HNtTU8t9+5a0Qg5Sp+IP3dKv4V6woMMxZ763I9hhPVhqqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942600; c=relaxed/simple;
	bh=2/+qV+pbNbGNzXYTmgWB0dbXLW45uXsr4H3rd/+7Jog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPGxzNNXQwYXpcFhJt1VpzHcmI70y1twb/wJXgWY6Oa7X8jCYkrDnTgmjk/CZ93CO1sFcoIl0okfQ3b7QNJ+VDKjhSuRq+V96KhDu16A4USLlysMaUkuz3ucKi+vCwW55R0tfz6FDYmlY40sKqjdhxooF/R/kV9zTCihEcwLsIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kVsXwtPS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nCxhbX9X; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kVsXwtPS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nCxhbX9X"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBWPS2051401;
	Mon, 13 Jul 2026 06:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rDUviy9yHwVd0NgBmrO32c2hthIKjBImj5zNsDgTd
	Iw=; b=kVsXwtPSifWzQaRfqOmaAS7JZjK29ZFwou1LlWxmoGlOaYKc1F1tFYr0n
	+7WPyzfxIE8ZN9xq/W3CyTAgm5DF7DLf4fIVOJNoPFtkttPxMgpfx+L0TpeOMZky
	rPs0P65kqHQWHIbovN3Tb4AhsJYb1KFDb4cf3Y2EzVGTCaeiiivxrG3t9CAqtnNW
	tJZ9TOEfXFsr7ONk9UUwz0+kNIazGCsEEniGACjQX8ZsfxqiD6nRWkUyQ7koUtFi
	m36Zf2TgSVehw5Sc5pHoo46nuMVMXPVVyCKJaG35QoKGThfvHE+dB76ifGIwJ5eT
	dAI5bJ8Pgme4tku4tp7nzy2exN75Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fcxx6g39q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXQYWzbCjon3eyLcdaBac71twzboHOlGRjv2GTCNvB+qUS6KRCKXMOPeMtIkrCTMBj8Nr7thOS+mX/51xPqazXdoyvoY2wbF9oZqeaaLTpIOweoe8DdVob/Owtz9T11jQTEtCyNjiCpGy2QdJKFa4WV++SjCKV/jksXXuJADeRMOsWETMMeEpt04a0niyMM/RbfE2r1xDMTDsTJ9PRbqQKPOvRuA6Bj6ejEPnp1iZ2Z5cYvp4LXSBR2/XQ2/n+hfGtTY6cGlQW7VzI/lkZDoKTyeqWJP/c4OkOVlEBK+zr+dyfTf45DHSndynhp6UuD+qIkYPNG8rBcOMXderVqNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDUviy9yHwVd0NgBmrO32c2hthIKjBImj5zNsDgTdIw=;
 b=jUMrnnui56MjGXpSDUZE6uA82nmAPjZamFS42h9HdTaol0jFtgwSBwuQHaU1qqjKOmNxlEJ4MyUg0HSpnwgMY003lt+hwd3xfvNpJeHd1bUGFPuUSzLkTTo+0HbeGstJ/GgTPI998ruOMAZcWHU4QePOQc89AUu4dCT6bqz/tBd1lVvgCUTpyi+g8b/L/88DgodkHwNUtm8eQ+sGY5rLMY4TmiAFrvgLBjxyNf4oE8sH1Usb8qt9/WE4pFM9raMuITEBfgrmZrgNTMn4ZQfSEujUT7SnbbKa20DGzZsJ4RbSPPh99PkJwh6zIoInuwr/atM1788uIuty4JvAg/DPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDUviy9yHwVd0NgBmrO32c2hthIKjBImj5zNsDgTdIw=;
 b=nCxhbX9XWI2uS0zs8czv+hWSSNZn0Wbst7ZavckmukcsolgijuN+PpDNiv/28ECjW7N5sqzgGmXWhEu4DO1hX7knaLjqPM6dr7sZDbRdbyh539+ESBTif5Eae+iTH7L5a7SghN/knzfGMQSyGyuK5AzluOW1B8QkzbUWaZypzKc=
Received: from SJ0PR03CA0263.namprd03.prod.outlook.com (2603:10b6:a03:3a0::28)
 by DM6PR10MB4236.namprd10.prod.outlook.com (2603:10b6:5:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:36:14 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::24) by SJ0PR03CA0263.outlook.office365.com
 (2603:10b6:a03:3a0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:36:14 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:13 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:36:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:36:12 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQK1471098;
	Mon, 13 Jul 2026 06:36:05 -0500
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
Subject: [PATCH v2 12/18] arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link fusion
Date: Mon, 13 Jul 2026 17:04:17 +0530
Message-ID: <20260713113423.2310443-13-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DM6PR10MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 172c54eb-d692-4e31-f54d-08dee0d2f21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|1800799024|36860700016|3023799007|18002099003|22082099003|6133799003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	e4oU8eflcojFUa+9THHZSDTcGXEVZGXimKbRNuouJeHmigi23zpN0dMGgp2aAjQswQCuXO0dOcBQHgwLDh9YRAEO+XDIAYNHRiAAU8v0h+aROTB/54tP8vgDuiiXpRCZg345Gk96JB7E1oqMdsexrXsRNH2TGXpzaosFO2Yb9CJovdyL1u/FTggO9348tjv2sLN0HqG+TfHEmh0mtO9Zq3hCDtSWRexf+7bsGOfFkuLt1TqlESXxI+HKftlANhLXFMrR6dd0+Vj2b5ksuIzUYtJNS5VoQ8adtWd/FuWGwdLjamksYKgQqwmtZ/WprvF67Vos3akUyVdrbl8r6GN5eAFOQsp9aqQ8Iw+LQBSo96GjXiZL+Ks7ODHyXx3HmwT4mNTxuV/DJdA9TWtfiWKT+6Zba+7R6aeR45KrVuQ7f47XbkBzZMh00wJpxnP4dWO+ndnsYihoP1jh9i9dh3qOeMGbCkQTyJar2wbFkZBCMC9HaXucNXIx74kWJUoo6WtkGcwafndYY19wnhW9GdNN42mdqO3UopMGG2syDlPyGuTuqLWqEddV1Y7OPRNH/I7R7BQ8BgyPI2fs3i/F4Dhx2JPKkOwvuoE0sox3qMkhmaT9NA3QwhpKSxtRYxGRuNOIqxZhSrybrzxgPNSRU+ztzA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(3023799007)(18002099003)(22082099003)(6133799003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fwzm6dIvr+ISmWkhLGNDhBEKBzQb04Ie0rwpg0gtgHHw5ei+eo7YE+GfhNxR1/dBOhkdtuqP8ZWBHhpiDWSD4K/1XhsdZqI/2nWAnPI8xZzb6Te/X1keiyOxcyESW1HWOKvzrcyIqD9JDThNnBmx3gFZRYAC9lqvg/o+zDUO8s5B5GExxhGawZ0XgX8NMYgchtqSDA5/jbmQ8nVV//uETZFh6dSV6/YdM/hEq8Kyu7qb1k6qx5xeMOPZ9L4a2sJNSXR+7U9Jb1zqTN9vyKQxTHkpHW+BN6dANNGlBId7f6gY06moce8mRORCsfem4uhZyzXdPyWoje5hw4k8uUIU8ulGNn9hggFN6m7lCP/yBs6rBd14IF7rKIzXm9puOopWhMS3kk3k1otFUTknjeuPWL1TfBI2jte0JPwRxh7A2bw+ys2aKPMVtCPLnS60kiNP
X-Exchange-RoutingPolicyChecked:
	F/haUOa5kiWYY3lQWTq2iRFX++f/c+spsd9RZs4bp8lqnxTGcBYFXC0b9+IJ/TYQKp/KL6gsnSRpFwJ+o30VQZEh2/K2eX9aXcUbhz+Ma5TyPALCQCdmfQv7nC5lqJrN9NBiziwMzpXjwQN1FdsP+ZZ2gJthPhvrYLDbmnnTqUuCcGYGwqJJmooPnyjIeS++gHxcifED9u1vdh4hcESsBbr3oEd5tTh0jY4wMAdHZaC92xR0WXhEK0r7ZDCbeNXPPNr+1aDdFD2rCsjOxCxRJ9Xx/GhwB8MqWwFactYhH97ljUrxVcfEh5VV3sG5lfsOKVfVK9IlqlQunF5I4EewNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:36:14.1781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172c54eb-d692-4e31-f54d-08dee0d2f21f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4236
X-Proofpoint-ORIG-GUID: FFOpJgmkJ96wUBllS3oooH7lRqDC0hyB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX45AkgXPUUBoh
 xPaZwQcyu3EXEgZ4QMz02h0G80TV+5YpOFlVzC+LpR+ob9dhJrnqTrT0CF0sw6xj1XB6Mo3gsQw
 P/y9XTGN/YhPRQhgoT7oRB/008C5V+s=
X-Proofpoint-GUID: FFOpJgmkJ96wUBllS3oooH7lRqDC0hyB
X-Authority-Analysis: v=2.4 cv=S7npBosP c=1 sm=1 tr=0 ts=6a54cdb8 cx=c_pps
 a=Y+Of8T+w2jezINbWzwznEQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8
 a=lSxIFS-ITpHO2R6jF6oA:9 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX3W/guVUwh1YL
 YYxFC1ITj4bMdLkaa5TiMLDz+XpawV00FR+8YoJcAtp/JBSILnKVT3C/WthHnyjKPbCrK5DmgV4
 osWXouQOcoaI3NWFOSJ18U6qH1fMYNU7fnVZD1UX7o3FV7jk865uLEgkXQfS0EHArdNTv8bcDkP
 Kd+RA9Kyh5iZAuXkBD7T/7BmTzsWJSFHjAg4z7jX4fWJ2ZyV317VnN8WRh/5TQcWCy+PbtwPo61
 DJGYPYuhcZjrNoJPrNAyWu10mCu6gejA7A0Nx1jx/E1fUqN7bVnz3BvL8xCEFBZGc+F43cSMD8E
 WVL89vP4Ah1ly/+J7nhQF5zMZLMHYioYn7dGi0jOH/CNVJfO88nb2Vojm5vc0jsbnix632bASL5
 OkGMG8EmH/96i1JPijxW5VKpvAiDoAClWBio0G9NJU24XPUS6b6LYPdQCNlW/tuy1pQW6ZYzdGn
 hXue9+HQQVgaR4/53/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on J722S.

[1] https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in both csi2_phy endpoints (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 213 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index fdd94cb7667e..a9ee359f2604 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
@@ -351,6 +352,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
@@ -436,6 +439,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
new file mode 100644
index 000000000000..b27c53015e6c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Arducam V3Link UC-A09 board
+ * https://www.arducam.com/fpd-link-3-cameras/
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25M_fixed: fixed-clock-25M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&csi01_mux {
+	idle-state = <1>;
+};
+
+&csi23_mux {
+	idle-state = <1>;
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* CAM0 I2C */
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25M_fixed>;
+
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			deserializer_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_0_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
+	/* CAM1 I2C */
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25M_fixed>;
+
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			deserializer_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+					};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_1_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
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
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
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
+				bus-type = <4>; /* CSI2 DPHY. */
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

