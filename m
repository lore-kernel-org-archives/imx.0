Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29623E6DDD
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942527; cv=fail; b=s75gUyat4oK58v24UKuqXhf9hFhOwwwAXg3dZldLCj5nBMM2zKhJium7yeAVnbpbykX1HXGrpRtKdMtJAndeNqhqENFdUeUfMKP8LyDxcyT+spRjaH6jWAkDfWC4idSZ2ymcrPKhpuQBWfgpt+b+rBjL2K5QvUqNwVv2qOhXwMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942527; c=relaxed/simple;
	bh=OGYouF0dFp4v7uQovDqUxabLu/smjBXaac4ebPL7Po0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6tXsFohsNpjTTGg/kcpGUmnEig2ALxwJ8rz4+73Z+DYA3dHZVVZm2CtdZZMVOOpCBHjbmsumXKz1BaKNsbAjf/IKNEeqdaJ3VYrj8YlWM+riExyNqiXm0Mm4XTvoZUR+vVkF06QRtoyz4Io7YQLPpGdxDPmOzH/qkWfci4FzjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I5STNqin; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=shp2Acor; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I5STNqin";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="shp2Acor"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DBAehE3381803;
	Mon, 13 Jul 2026 06:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFh
	zI=; b=I5STNqinQuwipRS7R0IwvSk5uQZ4QNTOWKKWRVhEkH1tnVnifLaseBEVH
	e0Z3oYy66VwhYOB0pJRbngSAyP2pXwwOLiOHom0s5U/EkghRIL3AUbdgMVq7I2hs
	+bVDnT36YXwlZPYlsN9KwVfscRdKPG2XEWpuI4eotf8G/TrhH+7gZbmfW1Kyyz0E
	EmONxYbJRM69TaGIc0l0Ie5F3SQyl99iZ2RQifLk2kTseEZTDElr3UhymgQ0oMFu
	jxQfFL+WX0FrIDxQrYqOtinLOSD2+50bV/o1zROYuj5mUdHJbGwS3ccI6NNc0e20
	Jlr8vBA6xgyvbqudxxYfYUz08n5Ow==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtg3ax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSxn8NeLLF+zYuAja2o5B52QwcgokaKl0cgUPaNXI3rDSsYO6H7V6PgJpjY012JDyptEZ3iOQtCsXjif/yEmUdhX+zX7kTTfOt/HIO6p2X8jhIUxUVK3Ma4BOp9vhQomeSVViP+fGGMfiyQ+mUZkiam64pBJeEd3uG/bY9oZ66oBCRdaspFOWZWwVJiTw7hrKsCMVLL7h6EzsX0Dh2EY3veNZYgRW7+zW1NGbVniEE+UskpbiHwdl1Zn+TEeVZmQS8tOx2HY9F23x2TJQ8aaXsZhg5RGq8k+REh1RZ+ieIGl+j0x9KD+mrFYkT00z3KtbsQYz1KuhXU16zBvcoAo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFhzI=;
 b=dJzFVfJ5iCKt4MID1GPDXq1YVk3uHb0QTmzjYSrw+JAKOP7Bi4Y4tTrVpjk4xszPX97XhY8vPw+8GUxzgIdeRrGU5bq+jgvlRxWVvRykQzlysHHuKPFpZaGqIEhVvrcb9kR+MiJKzBFec2HdeC4VWznVqWA5+l0B6W68lNx2h74hrm9ufJJ63+X3fbsmaraa/czBBXpuN/X4QFhiVrAUEjdpqFre9qO+Rtxyyy/YwXXhynr756YWhlny02KGHGmYcMCDGBS2WulocCIxMyvhHFw75HMkchPQBMx+wg8exPTk/qVDyfCRMo8/8ZDbq0p+Yh4PtGZ2UPAxtKNwr6WglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RckUNoeLCK4Xj+njkU0jLh3QsgM0nlKgQeyYPTFhzI=;
 b=shp2AcorTYWRvAGaDvqZtWJSuUbiBX90wk/vBwsKZtDLvk5T52gnmH21SERuR+iNIDM524unj19dZ2QD9ZdXQxZeqxUeKQt1QsdxbwX/JZejIzdEAwHnYEcWCcw9+1coo/TWgVB9zoV4y9QY5lQ6j/IoI5TCGCwI/qLD7pU6sec=
Received: from BN9PR03CA0522.namprd03.prod.outlook.com (2603:10b6:408:131::17)
 by CH0PR10MB7484.namprd10.prod.outlook.com (2603:10b6:610:182::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:35:09 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::99) by BN9PR03CA0522.outlook.office365.com
 (2603:10b6:408:131::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:07 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:07 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQC1471098;
	Mon, 13 Jul 2026 06:35:01 -0500
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
Subject: [PATCH v2 04/18] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels for CSI2RX DMA
Date: Mon, 13 Jul 2026 17:04:09 +0530
Message-ID: <20260713113423.2310443-5-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|CH0PR10MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fb856f-8acf-4155-356b-08dee0d2cb24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wyt95qKs/B0AAMs4irQMiCLYR++z+AQgyLpDF6TKxKuW+fTGqTGyJfZTjBVLGZzk59C/tKfIDrqCOLnEtA3fLsK22Suc/Y/FJO5eNgcctXNiUvLvyPbL2doV7tKGODHpl7cjldJjptaIGP5vmurrgQ0IRlWEiOkmDyR56XDEG+cxldpyMJYNwxQbDbVQKhrsxLQssZ0uUAEr2rwS4cHk6ruiDDn0AF247lxlcMVdxqvN6j9S3Boahnz8YNmo2+fwmCRPmA/5MpYlZu3de9CWLDO/OQGrnSuY9DJTbrZ7xMGnO3UUg4BFW6idXc6Oz+E9SlsCP1MM8wb6D2DgzzVw1cVS+NJlP5zvOz2POoCMUM070Y8iiY9cIfrbOZBN1X2znihXPdENzo5oRsfrJy97RjvwphztMzMCEhtNO4dsRbv24BT/rk5+hXmyfys8+ewb1hz+zcmeniJlilwO+2NJaXaaSoBb6nZxbtxD1gjVfCxGI7NUfSIbqsFhliCYQCWVyigSgu4fHx6LzHfvwQx23LDtrU7csR+AHxnc3uUpnlyOGATzcL5SUbWUbwb8f3dKFWxBxkzreTJEp8UZXt74plEDsfLUozluVwSpSVy/btCq0iHZrMGdIwh71W8u2ANfYlD7gb3kMu5X+KTUNNZ8FfY4u/vGG7AGoK6V9ROYxAcRwrHmcfXey+rbiGRLFZTbelS8R/ZuQE2PmcPCb4YVdg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zo7i0cVqUFeqQOCD/U4r0EMEtlm1s/BwTEmZV/E8iPbbYTMwCIia6sr9AgnD75Rfgrq2gXfLXsZI03tyvqBBhCVDOQvki3PdrkTTQTlnknN3lo7QSe81vIMTadwT2FGjyoIHkXx7sdZFFHLiCmhYBP/wvKWC726wpApz4OydMYjfsnWQUAbYC8yEawtgGGC/0p5VJUvvlXF4hIERDqyAFo3psoAe/NfZwQ1axSg6nDcW5eH5BCReMkQsCEkgqRGMICrQ17QTsqcJOXtJEfRGvNgTJDCvTVLZVa9gNtUsEq6rCG7OQdik4yl32j4xLj37wdQ8pdxPiIPYETMTz2tZvnyNVCftqoWDaRM/fcZ7RFYHIA9BkG+lwb4N6vBge+Z3SB/xEaYjEIaJIqFwiVvmybcdGx8EszhYo23XUq/l96AA51oPZQlLyMcrg+/Koply
X-Exchange-RoutingPolicyChecked:
	ibG/Eb6IDvU1LNB07HOJ8ZSMIpGJnHSHcSuccLsmlAiBQLyn8Ve/6po1i0unu71SlJvPD5FwDEdYRh6wg4WFf/dFJ0UPV/yqognOqS/MZN6Q8KZvZUuqb+FIXQhALPDIWaKvc8cOCw5TV8pvRN8Xe0/KVr8zx0hK0DHCfuNkl8nIoftzUZLn/koX4/jzLKQLbWWN51ssGoaIy0K26eJHSkMsjg1zhaj4MoZJvYxuzi23jZOQJXb9Z8NzeZ5gZ4m4ly3Wc9t99sU+RabbSTkfbzjvL4B+6Y6RsX8KHnSy8wVE3geWeiYdxmTwh9/ddjmGUMwVpCkGGY86PkQxjAkMMA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:08.7858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fb856f-8acf-4155-356b-08dee0d2cb24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7484
X-Proofpoint-ORIG-GUID: dU1ra7fGHFJAEGLlwaNkAgsXt_8JxZXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX6vIPwXTMuSYr
 Ho41cZWSHx7ns+rsMjuNXrSFA1bzaFoBnPfeDLbvTxpzGYCOw/kLJRu6Cnx81ifzgfjwUFTNAM5
 s04+epd41uYcJTkcnGNsSMCQjVx1p6T/pyHBHLKIzh/IgQycYx0BEu6d+IdlxFkUAI4mH338CMy
 rlqLICa3NwuWrqOWYsVOmgBL/Fl6361RmUFXjOVvv9jaUT2M2dWyOECi+B6NHlrN46frV2Kacbi
 LNg4GR4hc37oC6/f99IcrAjWbhj74LJlF96maNK09VtzU47h/qOpVYytK812/z99MSnI6vpp+lb
 SL1jBA9qtdxnUw/ih5pYoR/2QeAiIon7cxC+Cu52NCmzL5l72TndpOzybO5c4R1gurJFI0KD3yk
 q9WYnzI7Wrxw8FSLkvbjFvYI1XroYHgec+5DO7VO65Mucq2vwK1E2V6LpbIkAvDKZ3XKFwKjUxl
 L8knErFyG5EafVg+ZZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX4ZTIduthQtPE
 v4ieGJaNnCjytbuQwqEzNjXOF8irrRNHl3vM2xK8rOgSYsUPfz/tU/ZVZWsnfgwt4mlkBcNg8nC
 fEb8gOfAJTMEKWycOva8FGpAqMww1kw=
X-Proofpoint-GUID: dU1ra7fGHFJAEGLlwaNkAgsXt_8JxZXv
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a54cd72 cx=c_pps
 a=/2P0sUepIMZl1V3lWabuzw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=slwZH6uN_nfNMSXhCksA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18..4b4545a5af19 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -811,8 +811,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -867,8 +870,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 73 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -922,8 +928,11 @@ ti_csi2rx2: ticsi2rx@4520000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4980 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4980 0>, <&main_bcdma_csi 0 0x4981 0>,
+		       <&main_bcdma_csi 0 0x4982 0>, <&main_bcdma_csi 0 0x4983 0>,
+		       <&main_bcdma_csi 0 0x4984 0>, <&main_bcdma_csi 0 0x4985 0>,
+		       <&main_bcdma_csi 0 0x4986 0>, <&main_bcdma_csi 0 0x4987 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 74 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

