Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3F47CC89
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984822; cv=fail; b=qXr4p+laQTOAhcpjjNreJH7xRabR+cX6TP9INkEeq2bKRdD4oxQo9JpUi/uwckhqmcYwxqGA00Pb8rxpOr6i7Gxd0s5cmAiPmH8VZHIgwBzvrHAR3OWmutvHFEYOFQWobgpNvhX50wz8iwQOgrwYsNy5se9WFCUk+MFBvmksc00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984822; c=relaxed/simple;
	bh=74od5fRUWwvBiWOHsvJ5FYUBa3S1hvOJkPPSqXIbwe8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0odOgy3h8sVrjwHJUflXOsS4bEaabKUKFVhFogfctBzcr2NBaJbf8nbVs16Z/6gNgjSO6ReWHH1WJKBXi3hf7zvNn7TvjnfGiGaJDFeThlNZ6nM+Wj7KGbW4LhVoNaESREGFT1bcW4v6p0D7tbJRk5pMOdECz5MxrkHQ8R7JNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JJK3Fgje; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lXPpPsPn; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JJK3Fgje";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lXPpPsPn"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628LgxJ1285459;
	Thu, 2 Jul 2026 04:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NvzPOfaFUYgUEoE4GJ/Rtl0NXmiz6bsJcTXBuCvjC
	xc=; b=JJK3FgjeGdO1fQaF0qXx32Pk+8AzFNWMAfgGGew6gKYkdQB6+Z4B5beVQ
	YF3lpd8My9htbZdsBhlng1acvVT7fK5Aje9yOok4EuGYlFmdlaPPFYduu5apVIMV
	TNEtZC71t1joBc3HIEXX1w8+s4yn//XuFtq6PRjVrea+hvwjt33j/oUW7q2tHdIG
	jG/0ycEEDM8JoAuHHz0M84RmGCSNhBcJB6GnVmv1J3YrtUuRL0vIlTXj0Mb5iJOz
	Nc3vV5MWxDi2aNV6sxAp2KXKLoZvZAnzvTkV/XmKx+86MlFU9ex4/2+EPsCH1cWZ
	FAQxmbzPEjzKrXe7WIfhKYppQUUxw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvyhtdj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIyR9bpOu0QRbCUVJ3Bs1Uxog7TZlNGHyUDX63qjHFfJ4U1HkfgcdLqlqunGc+6JP+oRUkVE6yDUaGWFb4kOW+Ex48tpVqAhLUbmekR5O/H06h84vo18Ik+QtQKIERRbQsZqLCJJNsZ1sNcpIvdH1QQncMK0lZ+2kxB/Zh6WyDJRSDh43aNLGtTLeKOGo6U0EALcDlfaE2VKWRLGRFdH14Xht3BvBh2Td7TiA7a/Af8rYdlBlWy3jJsYAh0PXjCmQuSnWU9OWXdGj+1bIr9a+y07jMB8SsVFN5flDyErKDONBBWUtibbxBTVBsZTyNB7Aw8Jhv1CL4s03tZHyOc3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvzPOfaFUYgUEoE4GJ/Rtl0NXmiz6bsJcTXBuCvjCxc=;
 b=gwLmRsm/gC5eLbEq8KNDSZhRDlglU6aqkLmzcNDq2rm0JL8BqtY83THyL+td/dw98q+pB4wcRcCXvvAii5i1l+s5ILebwD3CnqPyF264zejAPxPy0mVyWygPbzMOYTgKeVhLMAKWZaW+toWjVUZtiXMznEji/A/ZHdMh87yLiKr73T/YocQpx8J7iHF2JV9ZXBBqC9QQAZ+efl0Q/MjmT2DgnUpFvHEnGjV9cIoc7ra7rsJ3rIBnNEoEv7vwhw5R0wzQ6ocxb2sI/sXrV6BsOmQs9SqnwabmPEXwP2zHZS730yxdz2dEFghwW9Cp1nSnJH7UA5RNN/uc4jBuAFbRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvzPOfaFUYgUEoE4GJ/Rtl0NXmiz6bsJcTXBuCvjCxc=;
 b=lXPpPsPnQSo5gioZ6P+oCsgPNEALXKQ1WY09TDKBHhGAxlIYmVHv9CCj10d/QDSL6ZZ5H2GhPjE/YWww67jck3aFeWoK0K6IFu3jlQW9ScWuKzQNN+bouHbMGGTAEhfx+PZ5Rlemn3cMoe16SVVDjQIjViQ7l6MtqDmlKZEBU1Y=
Received: from CH2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:610:58::39)
 by PH0PR10MB4456.namprd10.prod.outlook.com (2603:10b6:510:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:33:18 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::7) by CH2PR20CA0029.outlook.office365.com
 (2603:10b6:610:58::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Thu, 2
 Jul 2026 09:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:17 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:04 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:33:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:33:03 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYb33611021;
	Thu, 2 Jul 2026 04:32:56 -0500
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
Subject: [PATCH 10/18] arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application daughter board
Date: Thu, 2 Jul 2026 15:01:15 +0530
Message-ID: <20260702093123.1048575-11-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH0PR10MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: b35bffb0-dff4-481d-964b-08ded81cf27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|7416014|23010399003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	kojDssbs4UuZkttFjSwvqZX/P59auZp6H/cy8Hd0hn+OC4Tgow1ow5eMyh0ejceO/87Eym8BH69UtViG17AXT6TUa6NkU8BjiAks9RzrqhTDTkPc/+SOyd3XVrNUllOXT2HkvC2/eugWMxV4iOf6YbaR5G1p7M8qADq4gtf7d6Gi50TKqOms+YqagIjRCeaOK1LHtkuwCeFEn4KVEpNnHowANSF8RJ46tJZBqUlnkKY0uHXErHG0PpU6FRzY7qEwWAd6/z4hSiP2M1/h+wl0X6T38GDoyzH5NViLUUjIW//FFGQR0pATE+x19wiFQ8kXd3pAY/BJaHwD7o5V5PdBO1JQCe0vCu4eeZ3Lr+q7R0Qo22mIDk9j8lFK2w3ZuFmVfuF+fprwQLcIxMdGoVtbOnVTEaf0ZxdQvXFGc0ZlAduVk/sJiWOvXcGyq2xSZapx0GR7Zz1gI2z9/mJMTirjyJc3eBZsumdqU1ewqBPM8gYYzAonvqb5CGwQgA/lZXF0GsnMJeF+v+kJN8JbZaHWuoOA05qzmtCBcOGTxsYAr1a9Bnyk/9kv3h+ga+U4XjxtLto/B2lSlF+lG1IYaelM/CCkqfHqyO2mkMqcKtjaBB8yjE0sz4gdemxhqRlEwwNdeLcanyZ+ZHq9hgIh0XVHGg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(7416014)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pj8Nr0yj5AGhS9m3SEB3GxHR6hliyyi4Fx6ZFUCozunCaq+pBC5itNB31nUuBJSH9NNRdDQkPix6YNRMYVG8l7QuAMPrX+fw1vkZqgFjj8+jzIaazHHtEjRN72Cdv3nk5XsNJ2ywYko/UAwejPb9g9Bvl+l/TdmwMECpN7uA5d74IN813rltIe7D8R+GojAZlIgfihBN/Z8hQqYzJBOqDqTfeJti+nye5OtJ8KoKrEddYSxlv1e2L/fDFj6Zx4jJs4CuoZU/Gzj2TSpQeWSbOfxY4ZGdGNW782xzReZFJKnnxjK383NOCVSO/GFEuwSJWvD17W0a/WSSloA90+Z550M35fKWLpBlsfvcFTNPj1NMjX47cr1lzKs5femA3lJNwEII6StlfpJJtKKYpV6aiqph9e/Sy+EPzTvcrFN2/sAUqgCsScC9bLtrWN/a/Dq
X-Exchange-RoutingPolicyChecked:
	BJMl2kb0AFF7NCHoJFEWjLEERq0Uellj9DD9QpMPIQF1idcOnGegT1K6ScDike33/iPpTj8gMGXLYZIW4BpTjGnQ3HxqdpULJJaUnJqMBPWRlNV/nz+omBt2xISG6S8A6mbu7SDdgBofBTlEEWJPGq5L6kl1UVD4bfjLABGap0yjIdX/X/ja7u393MbirzdslYHtfwB9OjbtDbZB3XJnih0N5qXeoQlsS1QZIYErFNwgOppdLg/AZ3ed8hra5x+OxZcO43dr5pzO3ulQWfYUglC+4IBUyqncnCjSbow4Z9A3hXpSFItJtzIvpiPmJGxHkMgAqm9ZuOzmQXDFoLYIiQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:17.1457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b35bffb0-dff4-481d-964b-08ded81cf27e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4456
X-Proofpoint-ORIG-GUID: enMZYmUL5SeL-UgG7GqGlrrXj5ne_Hp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxEs5phz8NKiw
 aIn/LaecvvTDuQ1fpETpN5p4p4vJQ+sKvcLnhnXb9RtiURV1WQTv6pYzV0E5OGIVbCc91HiUKqQ
 xZ8ahvfSU26g8RkqbJbFBUlDR+Mk84vdk34uGisxAo5OnFuocak6HDET+382qVG5RLkYjSJHTRB
 EgE9tf+2UjwIzdp5GtmBdZsfSFEhEvhIaaEswC6c33J/imzB2x7e5MsOebboBAaU01H3gYTP7CQ
 rhJOmuvo2DM2mcZsX5qQzxhePvZ36sJyFWra1rmzSjnpFCfBsRTyEfaph6mOnflTwnDQIaPhb4T
 2cZ6F89ED+J2YRvQgtM/i2yiD2czqwfoayTf3UxaVqe7XGMTRkzt9JsLagFd/Hoben/oWq3w6S+
 hTGsdU6WO8ebjR2ZpHdDiF8ZS1VEWASHhjho40kab08xxNlrqCMUDA2Z8QHozm1LPCjXl1eolQ8
 gohnSlHP9QE6EpKgZBQ==
X-Proofpoint-GUID: enMZYmUL5SeL-UgG7GqGlrrXj5ne_Hp1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXyRmrOKiRaMgR
 kRTwVBCTDsrTz3OqWHmtkJB5+vhQ8jedwoDu3jeYDqj6ynuXy0fLqeXCU5rh+Dpmn2Kdg73JoxZ
 2cp/UpFQ5QmqfSY9GCWRD1xPhdoaadg=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a463062 cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=7gAdcGXbCpeyZ2MACgcA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J722S EVM.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 196 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b31bf2f305aa..cb16eb9039aa 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
@@ -301,6 +302,8 @@ k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
@@ -371,6 +374,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..cbad2409a9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E EVM
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
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@3d {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x3d>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			ds90ub960_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+				reg= <0>;
+				status = "disabled";
+				};
+
+				port@1{
+					reg= <1>;
+					status = "disabled";
+				};
+
+				port@2{
+					reg= <2>;
+					status = "disabled";
+				};
+
+				port@3{
+					reg= <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_0_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5{
+					reg= <5>;
+					status = "disabled";
+				};
+			};
+
+			ds90ub960_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@36 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x36>;
+			clocks = <&clk_fusion_25M_fixed>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			ds90ub960_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0{
+				reg= <0>;
+				status = "disabled";
+				};
+
+				port@1{
+					reg= <1>;
+					status = "disabled";
+				};
+
+				port@2{
+					reg= <2>;
+					status = "disabled";
+				};
+
+				port@3{
+					reg= <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_1_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5{
+					reg= <5>;
+					status = "disabled";
+				};
+			};
+
+			ds90ub960_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
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

