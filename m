Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274B3E5EC0
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942594; cv=fail; b=c8C1B48uIEi10hAL053RcBh7SpbhKPbih0LS3gUarNA7UBptQ2LxYKxwVIABxFtNRUEpea0xzo1NXHEuAV3kdh9zY6IFYi72NS38fKK8m00U4IBBtnRxMMIODLkp0CBZKxqinGRBYIzYVkkE3Ujy9IYNS60lKOYaGM1myhTQaOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942594; c=relaxed/simple;
	bh=gcCeA5+NEWpgghaS8HkaKBTp1LgzssmbD/0bNtzWLQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEJedlpzJ2n+XvfTqDa8ZlP8ipFg+hhaVt4DUWnnw8jRGfcfC0jzJcYiq2RsUjQnStvMwFtlEZHiapr1ESahVLEIbpreTFUT7mtfqgzE/JLMzRAMLuYodDK4aWuII96udxA/Dkw2BuDf4ysnmBcpYUvDdWn99HNmXSiE00DePno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=P/QvIc2g; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aanD+ZG/; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="P/QvIc2g";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aanD+ZG/"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBwQN3407734;
	Mon, 13 Jul 2026 06:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nuuByfmrKxhI61lqZJigLz0bRxakyF6piN7nBhvor
	bc=; b=P/QvIc2g4AOnKRQ6yNi9ACq3x7thx3ip5LEPNa62sqqX8RXoutcW1ypsr
	rD+rOlknHRN2JuMMxnpPxpkklHeDY/v7Ebi1EgyOYIscZWI92r/BAh27Ps6HnM79
	nWWW1zr6dQJlmvOi1EXdO/rkyGl664JfAi5A5HW0Cv6t+L8A7dophVlisu/+MQZ/
	xA12qKVhohSwpWzOy/tQLlagmfp+IasEEHO3cvjTT/E3xGX8Ms2Cv9D9DB740nGa
	fUC0nGI8esG7mq1khwdfi8Xn4MuO46X9DnWFvswcNGZ1HkWU4Ed9pbbyWGsxHTG4
	MQchggTB4L9FDMjR6LnZnrNqYe+QQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fcxxeg3ag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vY+FdyCpnaQTknMZYCRqd5U0ojFZzZvwS3+yDtw1LBFfByQagD06rovcqTPGDWszdER1AJVwMpvmq4qLGPX5hbTIYRzD2vNscOqj8c0p9hond6UQ2/MsuH5gie+esUfgmlDGp2EeiQeo+AsugBaGLDwklFb/gQxt34kXzIeh7tEk5j6sVqT8MZpRUOyLIRCsPsd8W7M0/BXve3zxQoKvOX18a9ZaSjZ7cQ+7In9Ronum0lmYd/kbY9ShQXst9fyg2jx9Vt6wiyQsueXctNXWDg3MHJbbcHX660TS8eEDOulG99Jx5Swpn7nEWAqy8+AxD/OZMl7yZrDu6Y06TyTaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuuByfmrKxhI61lqZJigLz0bRxakyF6piN7nBhvorbc=;
 b=YKA57Vtx6yz9gXso+iVu+LEi/qDMEtiXxr2NFxTh0d7g44dtTk4QA/etqnIuMFXzeLTwRBK/8yoyxjME3RNCnKw8jhlSZUNM2sR3eJ4ckkRDyKiyfy/jZ+BMrI6dHb+YFh0ed27hsaaFX+wqtcGWvRHc9mYpTrbFy5DlovM9dYnHMLbHrMSlUGXZrgqG4nDIPP7sbECKT62dm7HeiaMi0/0/sxHxoHF3rneD2Dydaz2RWT7yM/uuFxPfbFpwKCH1fUUY3VngejYfsY1Hbl2rabKdM3Wr8ragpG37xZW2ahfMoo78NEMsGHDnL3TU5UeMmO9KafhFZoL4biChYKWuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuuByfmrKxhI61lqZJigLz0bRxakyF6piN7nBhvorbc=;
 b=aanD+ZG/5PqtZpTRx8u923GqMpxuPnBPnGbpDseXc52P5pQcHBtle4bPFaCvETut4uYBYolu9INgNm0wR8hx/D1/2sl9YzJarkyhPCePIEQ2f0YNJ3mDzV3nlN3G9HwWki6BvS/HpftpONQsZcFyDHSanBcBE9xrXLcWeAMXunQ=
Received: from MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23)
 by SA2PR10MB4474.namprd10.prod.outlook.com (2603:10b6:806:11b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:35:43 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::2a) by MN2PR11CA0018.outlook.office365.com
 (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:35:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:40 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:39 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:39 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQG1471098;
	Mon, 13 Jul 2026 06:35:33 -0500
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
Subject: [PATCH v2 08/18] arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter board
Date: Mon, 13 Jul 2026 17:04:13 +0530
Message-ID: <20260713113423.2310443-9-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA2PR10MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: c26f46ed-4356-4bfb-d06c-08dee0d2ddee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|7416014|36860700016|22082099003|18002099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	rC46ou+DnlTzCmU9W09s6eq/TQvaO4KCp1i44bC7qRaPazTcLuYyQxFOUxXYvmvfVA4p0EOUFN5cFBbVlcJqYzXKK0LRvhmfFNgX2a4u4GpimhxSU64a5Ca+oxL1l1HbQcdrtV5Wm991EcOIXNlhXWERxhihK7mrTFJgA5d3PJHba4r4WxVjh2JBExH+uWT7DgALr9yG4tRwg9EdWNmiLgPa0KVYWFfn6Wjohd+8rYPHbAVjS6eRaS3gog0imoc3HXosqxypUnefAPFGJREA3Aq8tx8xNIUY8sWt7B5QEFwI0OgoBOkDcOFeqg5bHeeyE1f/NfFrKdifUSQYfvdLzHlrT4+T1Z4vQVrAgG4O/63awUQlMqcbvionSAvnJSSx/vEQ4KpnhHSm1PZU1mGzcTDArs/Dk+HfFH4V6eI6P/0woFFGFhVWTcJb0m5u7PX+wMPtEk0dDrZ4VBP6FENmSze1+dMyTW32FcXDGxgNOWJlY5mChFEuIWBtuE/hCLchqBnRNNKlwLgyobgExHpNAF0nxzVaAqImEGl2mWb6q/hwmI5i33rwH+z9EBQ4lBAk50v/HLbwIqQs8CUPkuMBa3V1WgEB/I8OJ0GJGKhFT1JyHIRDSuvwuEaF9pMJgYTtM4FSd39ySXWRiilDVl2P0g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O4Gnn1fSKKP+tqVuMZQ5FKScqZHucUDdP4BQiEolwgXkGJKnM1YhdZ45V76QiEX/4WSPUqO+DVzVrmPj0DCcmyKlVsjgImCEnDJDKvhD6T5TwJJv01yEMrB0PM/82gZpikeK2CRk7RqFWA3DFnMmHlIJ4PgaQsZ8ToP31/kuYB5Sl3I2aY5jKUhFzcyIN+5Ro3QQftXqH43qxSxCS6wOEp/ptv8N+Hg8ezfioWU7o0dBISt6ipqf0aGelHbXnHd1p8iU8juBJgZcwfaAd/iDBGZFFXRiV/ZONpnlHuZ06x1aR5YMb/N9JZvriOCupbidt1ifpPy4Ls7W8240njTC/oPiPSvm/gi4VEGFvVTM3bnwSO5u9gAO85dm53z3IYkGOIHYtgtqv8rmUzX40NOejQnTKLeMHnirXQvxV4juV+GqjBNIv6TMtGhQj8oGxgWS
X-Exchange-RoutingPolicyChecked:
	WiADN7kl29nd8HD2bOlEpir/OJv25PTRTUf/neTMd65MYaYeBdYm9RtWUKymWwFO1oGIuImapwV/ImR2MSxN7GapQ8OcipGad0qj6VDG/0D2tgPO4dwoGxMjUqYfwM+jhF2uUG8eVHFdEmOG8mK8u7Dnh3xahefCJu45HcCEBGwRhQIfrIo276gxO9t9KooxDi5Ui6yvVYLpyIpoa+5F9EOiNDoi4Yt0al2cOdfnt+JZwkxIWWFqAMFmXX+fKMq6FdHTPgx+7AWVDYvX5BzCPn/cwAP3hAndEdOYIUG7ViblUdUfCAlACe8xGr5YXYLqt9+XlME8MKF+d7dUp9xk8w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:40.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26f46ed-4356-4bfb-d06c-08dee0d2ddee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4474
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX3QMLWwKQVi8z
 M4WhmMN8DyNeRniuOkLfWSEkLF228JPqqmkj06y1VD1vwKu7jXrqA5cXvPtBZTSbe4X2ynrgFYQ
 MMhZb1yO6Fam81M2Xg30NDaBJqzkgu9dIfYQPCmb3MKXgTJdA2Lph10ApQFvq6VNfp1AguoVtYn
 UGktkLEGNyqJZgY180qgtxNmGMA/WwLl1yekdu2xPnk6NmBox5K7cDoythiiG8/l8FaXbSzDUu5
 kb9f11dN9w/toiPtBPZXZuO/yKjgev5HDVGdPO6VMeCPkOmIwMrCtwTDqgy27V8RcGuKTUE6YeH
 q/W4C6GImgLo3KaqsFx9JY/5vJq+jY+zgRXFpcFD9X/v+T2+DERLQS+whOuPlG0HU8yaeMEvTMG
 dnzay+azxzUX5L0YYCzoSFh2eX1wqNPdjg6dazAWKk8u0X8v37C93H7G1qKWpz8J+zGZZGDEjBe
 jRzHY7D7dlHYNaHmaIA==
X-Proofpoint-GUID: ukjnmrtnetRRPu-mek2aWy4PADiGeHVG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX1b1w1huVepvs
 TD9egYnQrPuQJbITCSJxCH9pyWxVQzPjiHFExtbMieH3yk5HCj7q2yWvEdpQFaVILMExOvPVJ1d
 F0qNsAfxybkjPgIR0RZfky/lgABTQNI=
X-Proofpoint-ORIG-GUID: ukjnmrtnetRRPu-mek2aWy4PADiGeHVG
X-Authority-Analysis: v=2.4 cv=Frk1OWrq c=1 sm=1 tr=0 ts=6a54cdb3 cx=c_pps
 a=0/XwxnXJ+7qPZvmcTWkk5A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=5ehHSWTwxPlMNlvIWlcA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

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
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
- Add missing build targets in Makefile (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 190 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 350a8b5ad275..893cdd31209a 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -178,6 +178,7 @@ k3-am68-phyboard-izar-peb-av-15-dtbs := k3-am68-phyboard-izar.dtb \
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
@@ -323,6 +324,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -331,8 +334,12 @@ k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
+k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
+	k3-j721s2-evm-fusion.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -400,11 +407,14 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
+	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
+	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
new file mode 100644
index 000000000000..9bd4b86cb879
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721S2, J784S4 and J742S2 EVM
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX
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
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
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
+			port@5 {
+				reg = <5>;
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
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
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
+			port@5 {
+				reg = <5>;
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
+				bus-type = <4>; /* CSI2 DPHY */
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

