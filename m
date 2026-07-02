Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B847D930
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984800; cv=fail; b=kpIzyJ30A8FAfGHk6215KjjQHDk311k5QohmB1dw/3Gla0GlSJbyBdk88eTN5oPt0Ho/Y7s2Eb74TgvZlV2pEo8lnf05C7s37sGPKSjHWUo/vjFqeoa4eGik1p24NnaZRBKA1UoDpV0/h4Wv38LUPzJe7KBMWtOsBovjIIVJ+rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984800; c=relaxed/simple;
	bh=Lr5VkeGGhpFgohqlp03OwVYi+s1bqn/p3OTvlcM7U44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FD2GxnDtZdKtq8iC7KYHZ4ztI8mHb6aS4Qk3Daopbx39SpLSChGcL4JhPn7cr5yaD7tYLpBi/lhBMtGa4flCJn02erjzNrIBZvYJEz0Q5W03Zk1fn94kCy0HGvsnXTqiiGzidNxE44PgNkCNHq9SxtT69fyrrmAFvPy2l/drXCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oshm65G3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jFPHeCqQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oshm65G3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jFPHeCqQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628cq6o1285399;
	Thu, 2 Jul 2026 04:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim
	4o=; b=oshm65G327SfmMykprY6onqJ10YP7avLVOnVBM803BM9FPvmm6aqtm3Ul
	Y9hO3YfmHeHjHY32ldb6mwQns4HaJlQF5G5SmLPKTxTYdryeHm2WHU1p+7N6wrSz
	5RJXF7H49sUojokGS+7CQjQM5gjYfCSxQwofBqiTScX9X6ehCb3rkgZh8Xro8fhV
	nB+bSAK60QCCZjsESxTfydxpzpk16UNneqtxBZbtsRgSO0K8D3KCFYGpmqfHM/E8
	JAGXVnqGx7L4QYjTomKOwXNjW40UAYxCGBeqwsl9Kxht710pswr05g/Ajr60aE64
	E/cdpp4gN1r+Ldj1dJggVhZ8C5YLQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhtbm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDeyZjcKH2OSb3DDzcHNXsAeY9XiBkZCgC8snZjjbZUBrOQy9j5/paSTR3nMLF/PD1BGzN+6bpqzPunlY+O29XM/tesA0I2pP/OowTBsctiMKszWFvmYEk7bWGQiN1H9a8uvoZd2iq1vfkRBtiSARE7GWmaI7WVQ5bnv49PfPLr5hSkc4FOJV4KjE8mzdrLFuqATK4LTpdJpTq14AInjAxgMCsB1GBgt9nC/8+LCE0GOauYdu+hfOg/0Orye21l6ZEzwdHFvn6f2Gez13ZmlTRO81VF7X+2uM1Wa88RGghggaYFQm1277RpT794RZQ4kEd/DGfh7ZibWh/M/rGhP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim4o=;
 b=EeYf8UcZfJS+ge9BD+MWQaflFvezfWZifeG5dizZciKxJW9TzFErWzOaJ55YYpki/Hp0DsWYM6ZfZoStMb9P1i5GyyDEMTIYnnDw/1UGFERIC7SHr77GnbyFJYvA529DmTsb+5hZtUIqQ3yyxnLFXlgl58XSX/9CgoTzDGnzIf6m277vb1WhMEGy/v/Gf0pKWVhwUUeXFSPmxPHZZ9Tqpfw93je6ovl15ZbV6VIcKT1p5Y+aVvN8EuSowv+gWch6a8GI4lV3DzPOT4a/cDQ0rLdtD2kIzsz1AtF7qxT3e9n/UDOUpjkCgv43kQJFGajS0MgTTUxziPothaGknXZZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim4o=;
 b=jFPHeCqQmpxO7zCCClP/VqrnXNBHUp2gH4S5rCxbwECrsSljqDU9hgApQRDqDq170EEQL5DjuFQ4sUjdDAdIuqdHsc2uYxMa8uCgtQ7qCRNnetcrp5aTogisiBpIaHeqrpPZZP8TO7U85YH7+jAvQRMeQ/k+5oaVdl0b0Kv4RxQ=
Received: from CH2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:610:58::23)
 by CY8PR10MB6610.namprd10.prod.outlook.com (2603:10b6:930:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 09:32:59 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::1b) by CH2PR20CA0013.outlook.office365.com
 (2603:10b6:610:58::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 09:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:58 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:23 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:23 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYaw3611021;
	Thu, 2 Jul 2026 04:32:16 -0500
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
Subject: [PATCH 05/18] arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
Date: Thu, 2 Jul 2026 15:01:10 +0530
Message-ID: <20260702093123.1048575-6-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|CY8PR10MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: ced9c0ce-cdf3-47d4-10d6-08ded81ce725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|376014|1800799024|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/dxXsW1DQWmUCxc7AvAJixOUJSNqe1IP/V/cYNxRneRRbUTq4W+7w9KlUvkFU1liD37B5x83JUoDF4rVH+7j61M0g/qkuEX4OweFJMB+lzybrcmAt2pqcVJpukM62DA1xp0pnDLoiIU4qMKGATJ5+fr2ADotHJXVsQ4q9IqeUWXM/94kwg9D+0rCUdhOz+4cjTokWvE1ZJvTSo1icrxFTXARnOor0IkNqIdkXLB4mwQ4eQ9wqjVIcYSowy1FgQhkqKTHQmA3k8Py7ejBEQ+8U6eTeEQTe9kQzWt2aA3/fmSZvY/tjfEV/wB8xOI83Pku4OTvhA4mu8UVY9UNu7rxZwNrX7kP2lFmmSDI3GwVgGDKWwJw4s5s7l33bddkD41KuOrpwSOphEr/M44SDRb9WDNxwlIosC2diKMd29asj9QhLDOcdlVKI5GUIQs2NtyecOKIQwxXxS4fhQJGFWo/MxcrWwUV2EHfMetZGJtrXEO2ln9C1jFwG7efuuek4FFb4n8oWO0TX9YkMFZ3XhST2AOhW6IX8NkYE/BtMpy+TzYbvfvbuCXE9stU7hvkyJt4TOHd+Yd+9Tx9POIdtf8Uo3rjChNBY81vnFouyyZTTSt31/7Wzk0GuKiIEtlJS5TossfhfAVZjOj9JX7irriaS3unCouA69DJCgy0Fy6E7UrmThaTWtvMc8jvGzmkzt4f7+AIUq7Te7QIUL6eecmcMQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(376014)(1800799024)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PVASoUZAEWf6JKcqPyLl3EVV0lWxhqCtzv79+Rd5zNA/Ifa6+dXImaGclPBVGDxcQ+H69SgptkPMEnPH/kgOfjjKzj10So5uk8iSXBPnmDSELui7qOH2aHWkAxJ+ItZg7Wd+GD3s0AI3HTs6yfP7iCR3s+ahGd2yptUNLIROw4ExYRKittMo6nTDUv0T4kqyzMsrQq5WAs42TykP68bec4ey2+jWWMtYgW0yMVHuIrfNv3ykH4WZ9Lv/fUT6hpeJDWAE/fgmqwXqYrg5mLtBcDTMqFP0RXpI3U+d1Ru9IhtNu1SzqszBm23JSQomvi51E8U3mjM7inokS+GN7VX4yibay9M9MUajf7W6ehPBKTlhG0r/hsAnW5oRlU1vXqW1fy6p1jjMhh7MyhRH1V5Y4t3BgT4mlNGuUbMxvgYwGcViadzvsw0bb6gBEoKnU6Ce
X-Exchange-RoutingPolicyChecked:
	QdVPMFTHTQeCM294327SP8extMd32ZZxjcrYQvo6BeXn4YxvaNLfyjGsdEgD0gLvLZMFQa1jcFzQFmYIQec7JJiizqL4XL7Jk/9LyApKE534SZ5SXJEDjik46d8TxXDLHmjjUFN+lpyiE9GcAS2QQJPg8u37OA2WM0b391v6Fx//MeTS8pA7eYVn67AQPzYvh9GLX5W8Iy4DTNfdyQvzV2pvRH51qffYT4WdaTZ44/Vrene1SZnf9ZwvDoOC75xKAlMMfkmSqOJVhLlB3jei2L7sz3cSxkDeQzNZHp+6rEICwKtnggNvi6V/na1iw9kzjEGG2bt8FXBLK3t3CVSZvg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:58.0866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ced9c0ce-cdf3-47d4-10d6-08ded81ce725
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6610
X-Proofpoint-ORIG-GUID: TEohU0ckOzqtzoNW71YZeb7l9nJdlyU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX+ZH0iv7h0nZv
 UFgz2P0HKBfRwgQlR+bCTHyvrzDdkQDpMqhZBph1qw6qSBj9OE/VfQjKk2UMBZ2GPTZtsk2Z9t5
 NiDUrFAnh7nLEPYzPtVJDDCT+7FqzOO5tc+qdFYVaeR3JUXiyZAXBxc43Wth7jwEPXVCi8AjOAy
 LWfUaNiaD6MofgJbDI9pGTOzA8xvXNJZIwLuWM6KaOUBUgI/Xw0m39Bc+pG2ZXvShOSiwVqOPo1
 xCSIL28f3kDkvOet0NiyWOnccUiNSaN+Pu11jBIaoltBDGH2q0aeUf30JmmFel8F96WR0sCrbnW
 g/o1ysQe3keLoVSISzSgSZW5aq6R/6xmF+5ZH+2sz7L7tU9R2BBGi3CXnd41CYGsvwkenI9Q339
 CUxjtCuoId66xwK9gD+SNUzYoJU7ytlbFWl40XqF6NA3b6XtytG/EV73VQnlXUupgBG84GTrC9Y
 CEyiAXc/M3srSzuWWfg==
X-Proofpoint-GUID: TEohU0ckOzqtzoNW71YZeb7l9nJdlyU8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXz77rbGnUjtD3
 ttgDHU89b+FPwjcSKyMu2z1vatHQ1svEckCxP36t2ZgZdDP2ln9N59c6nLzMogcDmNhoQz4zu0A
 QUq4L/i9oMuB2RzE02oNOxhW8BJCl3c=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a46304f cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=E-roaWRQ3u-TegewmaQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..ecb537b96fca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1053,8 +1053,10 @@ ti_csi2rx0: ticsi2rx@30102000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5000 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5000 0>, <&main_bcdma_csi 0 0x5001 0>,
+		       <&main_bcdma_csi 0 0x5002 0>, <&main_bcdma_csi 0 0x5003 0>,
+		       <&main_bcdma_csi 0 0x5004 0>, <&main_bcdma_csi 0 0x5005 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5";
 		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

