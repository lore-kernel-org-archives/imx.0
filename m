Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887C47ECC0
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984875; cv=fail; b=s//GkdZHmY5gS8Mz7s3uaNSlrputJlgrjQUUTAS6NmWRzdL0axMgomgBwVJzBcY2yFs45wxsfI2Ag3d7XZh3G7YoCP7mLkrSWjGe+gUefW9p5MDi4IxfstoLOD90kHvBf4plW2QlHdUVLsjJ67ql9e8s0p5u2Pr3JaJM/SdwCsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984875; c=relaxed/simple;
	bh=Qyyn8Wz0HqGSxJ/stwNu0wHVdhzBXyteB99SMGCO42Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJc5TDUYHrYmp2hurrQhhc0fjSTn6qav9mShj2Vi1hneH3dT7i1CS3wUj6HLIqIzeVuUChr5uDLl3A/zTdWUs3BtJhCl72b7Hb6k/5LpACTIJR6z7AZtas9S8nFw0Rnm4KQ2BDDDbS8/0YTM5+7tU+yGLB8Hg8HE7EGiyoTCEMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=V+xgbP7A; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jOj6ICpQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="V+xgbP7A";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jOj6ICpQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628cq711285399;
	Thu, 2 Jul 2026 04:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=L2qTW3nsm5yF9/TU0TXdF+Rgxbv6PHlHR2QSEEwjM
	pE=; b=V+xgbP7A/RW061ebqguVPP6zn31kGicwiMlJL79cPHkIqA4ljUnEEJ4bh
	CP9E4cA6CTuIMOOQptU+B7UnIjDTdT9CUVV7/3Lwl5m/VmRDgKRo2DVZL/gP8CjX
	VrL/r67+RmFSW/81924up7EOrD0i3m/D9W76hfyvwlQdmkVIkcuKQjzP0jcRZoP8
	/66RkThSbE+qB5RCcerVnmbueu3HVoskXKI742a3l5M7rrisra13wMHql8vUeDqR
	WxxujFhfOq+7Ep/s9qheNcvjND7/rcnIbse9E5vU7C0vPqaOVbAJiWHiWVFrOCdb
	u8kT3r8qVzuDIHDBR+8BB+ncGCBYQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhthv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:34:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrTgkAq9fxNBVqdX5kNpAlCObVOZX17YmDSOmX3qcwiu+Ux398Cw87E7fJDJy355qym2xqDIIaL5mCqsEtgSMX/v19pbiwTg7xkSLzyiUE9gNIz9WC4Y3UViSUeYWbWpP3lNWJYknGfzwZge7ubr7Xejbvu/uIjyLNZ04+sq46N0dU6nHB5TVG6s9xcmYiWUUNSeLZBi3ay7s8XvXRk1FszAHjrEabp8ARh6j5wqg+zJsCFcGMaPc3KJlxPQtHMsBBC2SH8/GHZs/BYh6ruLuUJmOaBD9JNMzvZpXHALEYa8b02V8st6VaXw6J8pe6WJIrxpKNKAYAj0Xjo83ng8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2qTW3nsm5yF9/TU0TXdF+Rgxbv6PHlHR2QSEEwjMpE=;
 b=ldpkicGJ6ftDezbg6Vbv8O00hKK351CCWEfun2TFpi4m6VaDAihJYYzBBaIDR0YclsQYX2yFgSPV2+AUf6qXrb1PhInxeL2acjd/ZUBn7xIyHomfePxCWajJAnNcI7R3XS6zonG16A2rp5SHGOBVlxOx2rEjn1n9LHGRLfYY5OY4QspVgzyUsxt2tlWk2Z8WnAwNXDJg0ejOG02+gpj2I8AMauQLHLxZzW32f3C5U+XO4xAk9OGrxcl8Ht5L5LCuSadHgyuVXU71QYZPvf4+Fuu6J7rllSM4/IUfjo1m0tnO1RzyUSmac5wU1qdHhtuGllK613qnzIrKhtWyzR+XYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2qTW3nsm5yF9/TU0TXdF+Rgxbv6PHlHR2QSEEwjMpE=;
 b=jOj6ICpQq01J7ySLcDp7XpMilVaBfRiRmaBCpxQ7iZlE2tB9QTBx/1BSMkpUk9hQc5gUq6vOcb4+UHRsaOOtLRq8Mgg/RBOZe6iO9ZD/TkoI9+LGp5SnF09tqhcPw6yyOqwyB135KXtTdIdw2PQAkZWG6dqjoEx6i0g8WhzJz/8=
Received: from SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:34:18 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::c) by SJ0PR13CA0156.outlook.office365.com
 (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 09:34:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:34:17 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:34:15 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:34:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:34:14 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYbA3611021;
	Thu, 2 Jul 2026 04:33:53 -0500
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
Subject: [PATCH 17/18] arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer
Date: Thu, 2 Jul 2026 15:01:22 +0530
Message-ID: <20260702093123.1048575-18-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|DM6PR10MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 3765c79d-d8ba-425a-fc49-08ded81d16ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|13003099007|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	qhavSpn92MjDJpzGrj2W4suauC3IL0qorVAWnXMmhO6EkoQ+8c2U5df3/H0UF0nN56G4dyaHlS0fjvlzUDNFlPiYJxK8KbvpH9xNF9xHdjzuSSQAUFbvWkSqRLbdjRifmFxR1QgSG/SDUxBkd5jR8+vNWMQduu5/VW6bvF0A/YkG+ghX5bDfOTzKgcMDHVeYlE+CJim0waKTUV+f84xv75T8yz/9T0VX7TEGnImC3oZYRj8BYD0fC+8uUHF7t64UQGd8jVRUe+balClwIPIge7FUsELw/qdMwfZWYVMihrbH1nTo4/TNYW/PPdJHEv/VApAfKzKAs652A+OQmPxJGM2DTKCqR7+IExqgx33Xxhdcs+GJsV+f9jFkY5kUx1ir4B+OyaciJMgFx3vLMjU9kvQdwel6HfEQlVXHiDeMVZd+lxCBJVjFdmtiPrAPbauAcK1iLi75kWKnseMksgy00x1dpJoX0NP4BB1dNu93ue3oofVIeWu6AK5lIeHLU1A5cYpZ2Yv3Gd1K0VBQ2ynz4uyXDanNJSgvixX75CLlBns6e941+sWfd4P+qkCkD3XD+4KKCMmUaM5ygTBdKynkDQBc0xocVzO/C8AfR6i+cf62zLZCwyFB23BdkcBdD99nhcgWzaOk6VhZD8Ct6NOM+Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(13003099007)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Am6/aJsjK8Vyx7ek84dLMLumfDuR/soCz/mHPHfGZMYipi2m595v/6MCwplKeCGE8Sm6xXVZbMTZMdw8Kg07F84QRQqx5ZsJgSwjP+QHEY4Dm6HaG5Kvcf8dipCD83R+FsN7Ydmzhd2ZxQpfuUfy5Aq7+VelUOyltK+pPu0+pPDDexdhycrhsnhqlCCeXsCEVtrhCjR4+9jrxbk9TlFegVMw48zmfM0KmN1Td5ZVwEbZBibSez3UPXxV6uP6Nqd6yBpmOg5EC9E1+JRO/vIfKfMWwus1pAK6WRfwywIAzjPFSBQZX9cMJfM957AFsY6/lw2+Yn3fm+Kxs3rePsDLwLZrHVjgRcPDTFP7zqFMZY9F0PygMB758tWy23biT6P/DKe6dccnuib4sDbe9evVhJnpuqdubJEv9P8nJ1X9+8HJX4hfsEsy5fBpekdQP1xA
X-Exchange-RoutingPolicyChecked:
	hwGrFMHcqSywE6SGk1sMUK6bKxiYVL53yVpzE+ZDzx25ZEMW0aDIB8lOM82mQdKOThPdJvLY9rZnO+akHGngPO2JMWfTHA7nhw6hMmS6BCyeg53jM9rYoosZFtQ/bMSoRVwT66LetBCafvBcNp2MCav9d/Z783mgxPQBAdHe036EhVH23uP8XZgTvtjfVte7l7X5sjPLKoB0QDOP5mHaJ5CSNfyE/kK4jd9J3pADOY1I6kPyZZcUYlKx/sdPgGIJWq64BDDPSi5V/kh9kh+z9M7aHnh689UDG3t4qx6Vudf6Nu51c2AIrZ+TrRil+XzLQwT2XBMQRkMwjuS+Oi2r5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:34:17.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3765c79d-d8ba-425a-fc49-08ded81d16ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-ORIG-GUID: sBPltFYYnm2a1VbWeXjWrfnv2l7qJmRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX75z0YXFj5wpJ
 EyVgclkZesKGaqGz6OKTaDtCUyZUrTRJ0v2Ycsk97whA5FaIiz721ql1GJb4FLFm6ARLpdOGFdZ
 h5M2SErcUjPhAaR2uQ00t6r+3lZrUZR2R0t7E+xrpelrmsaXkxZYlOKBdugMtqroLa9a7W3NNI8
 jCSAGwv+h44i/W5LeQti9rotgt8C8pYivI2n5aO7GdiRgTdnpj3U3es9JuGBGEVha+8a+93xdGw
 fWr2z9tH57c9FrzYPQWbwNrXjnl6ZIUCMYNIAvrjgBwZFZFKifhMfk1qtFa0x/dZfT7xyUK71eT
 5y6J1+pRG2t5kgUYbcIpPZIIEK2nUeo6DXvzulp7p3uQ/LGcJyo7OpN9CNVIRabo5q+21oBx6ex
 DTnDIoO708bmWdxUOTqDsUJHJc03asx3ElcWO2l7xOGKrjDWAjmCj6YYVkpmqcTzePFL/eIjxyD
 FVzhWqOB/3JOe0e4Kkw==
X-Proofpoint-GUID: sBPltFYYnm2a1VbWeXjWrfnv2l7qJmRU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX9SI5Zye5ohne
 y2cN54AEp6D+dZxu64FVWKJe/gFEUQvsbHDasBiZDcvFQEHQQPq5vk/FijoMBrgLab+BBjYfwfY
 FLKgHoksOmLEy81kLD4LZ9ekUT23wsI=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a46309d cx=c_pps
 a=XjJJ5mbNlFGUOIV2PhjyRA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8
 a=WAJRlFvdVj0afEMGv9QA:9 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098

From: Jianzhong Xu <xuj@ti.com>

Arducam V3Link camera solution is shipped with an UB953 serializer
and an IMX219 sensor. [1]

Add an overlay for interfacing the UB953 serilaizer and IMX219 sensor
with the RX0 port on the UB960 deserializer. This overlay can be used to
interface an IMX219 sensor on any platform that supports the V3Link
fusion board.

[1]: https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/

Signed-off-by: Jianzhong Xu <xuj@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  31 +++--
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 127 ++++++++++++++++++
 2 files changed, 146 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 386fc77e4c49..f252d402cb85 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -195,6 +195,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
 
+# IMX219 FPDLink Sensors
+dtb-$(CONFIG_ARCH_K3) += k3-v3link-imx219-0-0.dtbo
+
 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
@@ -278,16 +281,18 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
-k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
-	k3-am68-sk-v3link-fusion.dtbo
+k3-am68-sk-v3link-fusion-imx219-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
-k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
-	k3-am68-sk-v3link-fusion.dtbo
+k3-am69-sk-v3link-fusion-imx219-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -304,8 +309,9 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
-k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
-	k3-am68-sk-v3link-fusion.dtbo
+k3-j721e-sk-v3link-fusion-imx219-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -322,8 +328,9 @@ k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
 k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtbo
-k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
-	k3-j722s-evm-v3link-fusion.dtbo
+k3-j722s-evm-v3link-fusion-imx219-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo \
+	k3-v3link-imx219-0-0.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
@@ -381,11 +388,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
-	k3-am68-sk-v3link-fusion.dtb \
+	k3-am68-sk-v3link-fusion-imx219.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
-	k3-am69-sk-v3link-fusion.dtb \
+	k3-am69-sk-v3link-fusion-imx219.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -394,7 +401,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-ub954.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
-	k3-j721e-sk-v3link-fusion.dtb \
+	k3-j721e-sk-v3link-fusion-imx219.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-ub954.dtb \
@@ -403,7 +410,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtb \
-	k3-j722s-evm-v3link-fusion.dtb \
+	k3-j722s-evm-v3link-fusion-imx219.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
new file mode 100644
index 000000000000..049438f9fc89
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX219 Camera Module for V3-Link d-ch Adapter Board
+ * https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/
+ *
+ * Copyright (c) 2024 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_imx219_fixed_00: imx219-xclk-00 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+};
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 0 */
+	port@0 {
+		reg = <0>;
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@0 {
+		reg = <0>;
+		i2c-alias = <0x44>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2>;
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@10 {
+					compatible = "sony,imx219";
+					reg = <0x10>;
+
+					clocks = <&clk_imx219_fixed_00>;
+
+					VANA-supply = <&reg_2p8v>;
+					VDIG-supply = <&reg_1p8v>;
+					VDDL-supply = <&reg_1p2v>;
+
+					reset-gpios = <&serializer 1 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+							link-frequencies = /bits/ 64 <456000000>;
+							clock-lanes = <0>;
+							data-lanes = <1 2>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.34.1

