Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F387374A0F
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785125648; cv=fail; b=G5/IUSHDgrw4uZ+3M5KS4PYqPdngs9anncCii0z75luG3V3Z6B4K5M2rn4yH/kur1pThJyO5wPI4T7sXidCPftNlts9Ijl8w0g/5yjznYvMJKcpOtmk0L86YBjV7uiUoKaF3v6ahIUXKv+PBcgIO69Dg+LbEwQPTjoubLkrzPPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785125648; c=relaxed/simple;
	bh=nTC2+dGW8zgEv8QcmclR2ZxFGEhL3bgE9jAuXixGlmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G9D73exAGRcE9komMi3G+E/ilKPY1B6DeBT7+LmnH7IVOBSzXNbPB6qV2W3xAaN+/UOHQysxmNixLtafzPdCplrqcjH8Es7pIie8AF95ii6uGqdGPlBkQ41295YmEXM+WY/6Zu8goA9oPoi67wlWS8UxRc0l4mrhZ4zYN7zLeMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UYWUeoVL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jbroyrYS; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UYWUeoVL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jbroyrYS"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66R1iWrK3757712;
	Sun, 26 Jul 2026 23:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cfCar5ZIugjgDwAXlRhkPDpToLqr6si9mgiwVqzSW
	l8=; b=UYWUeoVLz5oK1ORKF3Y8jDS+F+r4cmtcVTSto/a2yWrUObpSLSB5KhmDS
	Kq3Mz1Aah9LdXvuRg7xwQHbwAXhjIkdoTfKHzU0XtVssnzYkLlHU1flE96k56UJX
	PI+W/mGX+9UdZ7eBxid2n3aiu/0izTMla9WVMyGvJrhlT112VpHz8BDhJRGh1h9K
	sCDYZ3Q11YaOc4sYmpH/WdhqwlqRcPXiMSJnmV4eeGS0pEj6Yq8frrUs6iH4v419
	xrHPcVC6u8fVfKm2TRdeM6ugzwgffTmCIsuouWVOMKa7j3MYQRx0ZbGtVI2JN3LX
	pNBojXFAFZbhWTm2n7ufy5EbcK4kA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fne5kuptc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 23:13:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noNtJDdelZ8llKV86XVrTT1IT15n5Jc49WPVEKnFJlsk71SW2g77zxNuVM90BLlDKesS+JjAXBWFJdeiLhEBhUvF9KxfgpkboprREmq/H5z5qOp0YaDMT03vfbRHeLcQ+8v6ac0Dj/ec/e+6iH/IF6Ly5EEfaNEUrnO1OeNePKWWAohc7lF/V8DdQZ745elNO5FGa1Ouq8RaSQ+JHIJkcRNxoo4J0n0cGVAWT46zbn0Oo6mzTSKEVgQVNALlAgtEQt0v1L7XSKQZxk5roK5uFTWSTDretvVagm7mU7DLL8afdUu/V5hWHtT9ghix9Qys6QCmEBYw51a/Jifwr0stlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfCar5ZIugjgDwAXlRhkPDpToLqr6si9mgiwVqzSWl8=;
 b=skHZQkyxnVDfqwftyR734Z52teB1atDXM6k154R6LYrESOi05Vt/+QvuTKDz/kA28zYBad8Epes4L/svr5azjim7ihr0A/5kKGFRH2frFKxAAc9Ggb5QhYnyJXex+vK70cKcGT3jRKLg4G52YyqmQ2D2pT7mYharYGDMgIfecWs+2XGkrojy8OmscsxiIULJ4DhUmZ5Azn2/P0ne6/YN1eSbMvNR8fA+dCNNlVTWI5z8yYXyKNCzc+zMRPgzRS2daM22QWY8bfc2zh0chrprdpUQteyMU/zGUXo7ap8o3T9vOMv6Jpjeg+y+KrdUm6M5JGI+7dLrh7P08KXSiCODJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfCar5ZIugjgDwAXlRhkPDpToLqr6si9mgiwVqzSWl8=;
 b=jbroyrYS01OIF99Kd35RdtoegFfwaWdsZqI9u7R53sA5zf7EpIfc17almtf68z62It4vxbg+4GeyAt/ZGeGyf3tPV7sUsu/PrcCvuDb1botkFFqYy01DjmatyMULMc4U/Q6fFbNy9eh6resHrRyLr5v82TpkCoIAktIob3Mr6o0=
Received: from SJ0PR13CA0239.namprd13.prod.outlook.com (2603:10b6:a03:2c1::34)
 by SJ0PR10MB4478.namprd10.prod.outlook.com (2603:10b6:a03:2d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 04:13:49 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::a1) by SJ0PR13CA0239.outlook.office365.com
 (2603:10b6:a03:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.9 via Frontend Transport; Mon, 27
 Jul 2026 04:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 04:13:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 26 Jul
 2026 23:13:44 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 26 Jul
 2026 23:13:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 26 Jul 2026 23:13:44 -0500
Received: from [172.24.17.28] (lt5cg60819vj.dhcp.ti.com [172.24.17.28])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R4DbWF352838;
	Sun, 26 Jul 2026 23:13:37 -0500
Message-ID: <97f891c0-4210-4779-9693-494a377b3cdf@ti.com>
Date: Mon, 27 Jul 2026 09:43:36 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] arm64: dts: ti: k3-j721e-main: Add multiple
 channels for CSI2RX DMA
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260713113423.2310443-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ0PR10MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1aa87c-e962-4799-ba71-08deeb957566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9G9GPHNYW69Xv5yklG1C20T8rFlsE50y5uYFY2rnA/iFszEDhgrzBfFq1lqHZdCaNvknznzT4Kl/6ywq/A3LSVK/LekI1lpApZuMrhnil7kBVT4LurGgy5FK14tnBl6eJA50P8YwLAIEXBDpBqHTAqXJISrQHWJR5MB8H/QTCf4zbrRBFvHOBvjVFPy8xk9BBJBY1jauO5XdhUBYN2/dPuexCIiy9kn55auPyPHf7HxjMd7CBh/xbKzOKa8fgEE4Ku/ZlNNpJTvG/YFOPt5f67jX2kCentKNC4628F8t6SDzpjsOWzSYcNy8YyO1y2HkibKbFWX8sjnSjYq27If/eB0aAC2TbXxoqGOYl+5TtneVIoLEtTMJ9++0oN1BL6kHjsFEiXHAK5py6K0zlg6Dg9kDqaCMtIFRPC8Ev8AEK3m6FwTBtKIanKavqHqyIDOwbxFAQnj0aRwnMWVhtLwJw6eaYN5mBmbjQQbdUFRzjk5HtOXDBiPbR79qz0sDHoozHsRSsNpQtiigEiy+5yultDWGZ0e9MqNxm506MWaB0SmnVMekO9kVhZ7U/u3/VRC+SJg6LniEa+K7nVXELsyay31kN2dxu+qYdqzn0R59O1gQbkkbgI7de1BJiDcRlZU6OIqd8SntBgR6KEL52ATPAE29cJH1KzY1uE9N0tVh+HMFCM8OcJUIxyl5SkRukmkQGdWYrsekj7Md+kG+OaIXSA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lFPey7o39EVEUt3aTJI2yMPk09jqUdh69lJobEclczMOm/RD5PTOkd3eyGFXHbzPpPo5D8etGvgIxUv2cmeh1m9TeiCUJyDZkmGo3zu4fBsoFe3rVlXfdC1smCdAPZqi7N9zP25ojyxUI+giz3Bv27U9o9G+7CKqGyxn2tg6Qyzf25b4l7qC4E4YBlwJWbqHTEKjCS8TNUW/crskQEOalKHFyLb7GLgIZofvMaNTVu/d2QvtWFVN8o/6w0BE84P9lXgac/g3ze9Rqis3qIhLgZPwIWAvpSoABKXmFvT5JOMyF9urZ7IazmonAHpGgks0QXWjq9Jy0Q7q7swvsi3+tYQZkG6JCrP9rn9g53PNbi3YMoHjAEY79EA6TRNyGaMDYIcRujaeoHgP+X6HrBd6fQ/Lwk2mUFJqzMWLe3aJgpDkUqIPLmLvZ8t+TM/8eg0k
X-Exchange-RoutingPolicyChecked:
	n17hkbxRiues2e8++j6i58R76QznS9v71ouYBg2MaHhIob6htE42fvIXIqgGina37ewWfs8B7CI6vKvBqa0I+C10M8POvYaeEhBwHeHbJ3E2Q8GrwwG6LoyHw5Eju0BS6kBYC9tX3ktcHftAIT6e3a7xxAzPgUIpXMBPdaRNc6OeIoGoxpiwbKvpmufH8zFRvU6xPESzzxpNOO23xrzjHhTJ97CvY4A5aLhHyIzhcKvXFa3touoD71aG5eqWxePimL77aksteoQjmYiRsS61RPwZENsJJMlTQUGh+KpJ54EuZ04mtO3bQ53BXag30/SuKuRQnT5g4Nj8JHoekZHgHg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 04:13:48.4241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1aa87c-e962-4799-ba71-08deeb957566
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4478
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzOCBTYWx0ZWRfX930d2bHqZTY9
 MGfl1MGmLgFBU1lQEUdZL0kWGUjQltpbYUP3WS+vaO+Gb7SlB6Q1Hp0dGYZAckF1I1wufUzoNAj
 lVqZoCyfn+Ukx/kpt1OclfEYNQeg87U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzOCBTYWx0ZWRfXzgv6ExlIlRcT
 he+mwImhjW9SVv/TgDIUTfj4/6RREP1Ei+vVo0jyScDCcIVK/HGY1wJQeKUMObORG1HngnccVpe
 1SxoLYHasGzRHMJraD7/micSd7ZXqtiMwVWMJJJrNDq8WdQ+ya0HGtP/ejfxVqk+oplf5q3dhTb
 edTB8Yd7PwBrsBZE47KRFnr0LhE190fiUvMfSzq9/w3QWqUh3CCPyCxtiiNDWhVbZdEX7SvQfo1
 +L1benP6DaJ16DwG8TYXANpB1ZMfAGS8SSvLxDnkxUPWaG44/Dd5fQ10Mr99Bl7l49ZLsWHx2EC
 jNg8e+yIizttfUqTdrP08yIVPZwt35hEsZ5nLpbQ6fAU1WfzjMaOSx98sg2ymw8t3wsiC5OB2Z6
 kE3cvApfgYWgjqaHHUhTuMlbAXnVLK0ABmJJC1NCsicbCkNgyOMuDiDN7+8Fn44qr9GkBTmJDg2
 l+J8a/Ge2k0zR6hEZtw==
X-Authority-Analysis: v=2.4 cv=X/ti7mTe c=1 sm=1 tr=0 ts=6a66db00 cx=c_pps
 a=AaT4FrH4hTNSk8p5YcQWtA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=CH03zmTt2gyv2RquU3wA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GxrWHcWnHVbHLdLcY1-fYOpoFv_CxGyv
X-Proofpoint-GUID: GxrWHcWnHVbHLdLcY1-fYOpoFv_CxGyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270038



On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
> additional DMA channels to enable multistream support for CSI2RX.
> 

If hardware supports 32 channel, then why you are limiting to 16
channels only ?
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 5a8414fc5751..b1988437f52d 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
>  		ranges;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -		dmas = <&main_udmap 0x4940>;
> -		dma-names = "rx0";
> +		dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x4942>,
> +		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945>,
> +		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948>,
> +		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b>,
> +		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e>,
> +		       <&main_udmap 0x494f>;
> +		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
> +			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
>  		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  
> @@ -656,8 +662,14 @@ ti_csi2rx1: ticsi2rx@4510000 {
>  		ranges;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -		dmas = <&main_udmap 0x4960>;
> -		dma-names = "rx0";
> +		dmas = <&main_udmap 0x4960>, <&main_udmap 0x4961>, <&main_udmap 0x4962>,
> +		       <&main_udmap 0x4963>, <&main_udmap 0x4964>, <&main_udmap 0x4965>,
> +		       <&main_udmap 0x4966>, <&main_udmap 0x4967>, <&main_udmap 0x4968>,
> +		       <&main_udmap 0x4969>, <&main_udmap 0x496a>, <&main_udmap 0x496b>,
> +		       <&main_udmap 0x496c>, <&main_udmap 0x496d>, <&main_udmap 0x496e>,
> +		       <&main_udmap 0x496f>;
> +		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
> +			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
>  		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  

