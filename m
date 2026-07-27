Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA8347BD9
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785132792; cv=fail; b=EwQqcxfmhjgb61DIuJ+NIuBwb6Cd5QFLhhgS1bVeAGKMxN/oUaRpcIOli2U8vRP+JMc38T/DJsq+IXaxPjQ8yuxYYy5bjVxRC0B6lrgENDjnlKiU6Jg/6gBWFJSAZ4Yvy9OzOSf+C/aRNmA1kz49YOJa7qZi7P+0btWtsFxhqko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785132792; c=relaxed/simple;
	bh=nPj53EX86qLRd27ev0HVGcUvxtrWCEi609S07l9EEqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e4yjkwLJFv68dWpvmd/haR5BC9nZryYEpe6sfP2sun6pzMrS0bIxZ1KGQnBTRPKstpJpKM2w20G9N1tFdGl0CNsn3wfF2nhcc+c5lLcKFYzSASU8ANy4/wahIEGcd6rVouoSvHa9i8tVyDHihzjRPxjK7wOTgwf3cCE9HuEEnns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TBEhzBI7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hdQRV2gF; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TBEhzBI7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hdQRV2gF"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1j9Ee3689769;
	Mon, 27 Jul 2026 01:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3S0pzmI2BzaTpCziJFw46Pia29vzGYOXv1kNwTATE
	iM=; b=TBEhzBI76EZ0rPl00U4q6nBVOU/Z/NrOEjRciDvLPGfnlUWZmdCgeP5GO
	fyIuEKA67wBpjqvKKgkJZ7gx31ov5fQWRvYhDxSWtN4JMXuD3aXJ6DjOYWWhx4Od
	+RKVPzz995zz9mSTIUJuoyvKngQ3ajc45l8996X9BFpny0RmGZFqrczF/Lsdkoa3
	bJ+xBqT2U3DNHugE7GZ0YaeHB5AE+POLrdvFNCXR5cvxelkHRFkwGFccRc1c2R70
	U6hJK52dbCw9DvHnMuemeBURq2w3G3ISPv1pTqANYtJFFTJr9wDS3wErog3GSFkf
	g27+HFL4M8AzkD5HnXunFgVKWt+vQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fnh5rbctq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 01:12:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYLks3vRABgsUoN6LkNSxqrK1gQjfuFPbnb2o6SAlao3Hrx1syrSinysBTHb+Am/jrPJySRn9w77bnlDaN+5gjnt2JkFtqOPFIAkk1La+ZDv00q+MPuH2cA5Hd8WpbK52hr44XQLix7iawuiynuuL9hUbQxQWYassL2yihTCtRBlXiAs7sKFEzPOf9SrYNCgrY56tOFbXpn4TBlS/aPKeUbofeXA90xJcXpgqoe/3goP0OUtEgh+a4YKj0cOzVognBYrMdDIHXq5TNCgEkPMJRLir5wqacbDt3MbA5Wrfju7zAIQbT6sZP2HwZXX9VBoTUJaezmnR01vu6+BVP9q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S0pzmI2BzaTpCziJFw46Pia29vzGYOXv1kNwTATEiM=;
 b=BvZeduhsYLeHpGU1qcXlT1ehNbtGPZo/3r4rkYspD1NrWMi9Zn9dQ7pFUlbs/gJlIm3xiFZUMbdJ6ERqYFgGQFPCw+jEKtdzE6SHf+9sQLKIBmjU/lqUnt6FzelZI14W9tfOjsRt4bH+LSiRj8aIiWnBVNTOgQKeV+n6MoFD/FdFZFMAEK4W0BXzRxSmmz19uFMAvKd07LHvigEj1ivTdhHFQiilqVXyxTOwM67WRubXDVcjnorWJ1NH9R45SJoyEQf0eGgpxy8XW59KC6d+J+cQaM5zI3L/yZ4WMWCaPnL7H1Aw3lRBHcuHZDR0hOb/MgOuGYxmZPu4/Zgo6eVc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S0pzmI2BzaTpCziJFw46Pia29vzGYOXv1kNwTATEiM=;
 b=hdQRV2gFWF91r0QGwKZDWWNaE5m3QOkNQCycQgS584X2Dd2adgkkbLHRfEjugj4qrcJ1b8mr3meZ5qomyaQ9AK1Z+7vbcbv1AoEIrlT4K/ubqY9SEKOIxoogTtGp4MfbYMcFJuCboWTegfQ7SwqYug7S3EGl9Kdh6NyFSqdaRic=
Received: from CH2PR14CA0030.namprd14.prod.outlook.com (2603:10b6:610:60::40)
 by DS0PR10MB7020.namprd10.prod.outlook.com (2603:10b6:8:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:12:38 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::d) by CH2PR14CA0030.outlook.office365.com
 (2603:10b6:610:60::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 06:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 06:12:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:12:38 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:12:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 01:12:37 -0500
Received: from [172.24.17.28] (lt5cg60819vj.dhcp.ti.com [172.24.17.28])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R6CUvR535840;
	Mon, 27 Jul 2026 01:12:31 -0500
Message-ID: <cb63b350-6d59-419a-bcd0-dce9f5242c77@ti.com>
Date: Mon, 27 Jul 2026 11:42:30 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/18] arm64: dts: ti: k3-v3link: Add overlay for
 IMX219+UB953 serializer
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
 <20260713113423.2310443-18-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260713113423.2310443-18-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|DS0PR10MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 61852bbf-7522-4ef9-f9dc-08deeba60f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|18002099003|10067099003|22082099003|56012099006|4143699003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	nsW24/BUkMdOFkoOjK9/A19v+FAeKMtiA1f7BjDLyVgd3GOfjRk+S1rjncoXiNIFRgGE2sQnxyyHziE8L2kalWAADTXc4QpLt58vcOadfNyxcEa1emlb9ev4a+YbYJ+i9bDY9/b3dCpghd/v8AalE1fbZrw1ZJc4FLSij8z8w4HuDzEa0h9nTuo27BLLzTqy4EPPQl/RTMIUkRbehAfiSlrFPG9qhaCCUEueoZ5sEVtLRg/4biSXOgVYQv2g0sHw+FBXu5W5hhn6nhMoAFdzL/bicaAHA71KOpmURGu2H8O8cxjR58wSOUCs5nvWdl3CAYz2hvGemoukZyowM6v6KIpCoMqqUZGCN5eQxzlA+VCYyI2A1JOJvUn+1XN+7MCxn9/NchVEYGAS4hkV4CpHLCdTT1t0GRuXM6h4jkz5Ooy1AAyw0jX5fTJUQ12PWzNfk7lttQt6FOKQbaQbanpQWqZrhQoaFkH8zfelB+OCKZyqMzBmUNTh6YiVhPd+RDCtiv0MpfpwPNa1BI6AZrD9vleKUa3mtPvfGodX3wzVnl7SOVo6mMCi5NjYZJs4p9yqnHtLHNbdNwXkFwNEvpHmbU7TwECd6ts8Oax8YnZPVM5OtjF37UCTLThnFwlK+vqg0A37dkUjF1o9XNLXxJvqlA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(18002099003)(10067099003)(22082099003)(56012099006)(4143699003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XxrT1Ux+PJxha52tsNfERILAhqYEHcwT6N88GGJxZalMiHUBFvyBZ6sdGmRVPoE/LmrupwPdWyRb35Uj+VwNJda/rApft8OBdiTM0DcglZxwUstTlx9vX1p/H4Zu2egf5T+tnr4YbW8wuuIs4y1ZtDWWKeBZRGSF/yKtLgf38KCfq6eIRlHP4oWpDpcNacuqYsop1/6RoyFUSdv1bWuRFe7k9OfOhe+qPeWRiCYpwbj5jtLab1fdtW4dUOSk2pjX6o+3xP/7+B20VFezUt9w/yCPA6wcKqcDjo7bmel6/agAcnL2DIolL9AgMFmRmjw9RtnKTswEwEh3oZgxlrmkai2KwraRm+vR//KZfm4n1a+50NwLg3bnFRXPweyGKNWk2a+YDrKGjKVLMszNlc0XOMTQBvbxi/YYQMrLGtfyyd06ffxEdz04998Ymp9/XRXP
X-Exchange-RoutingPolicyChecked:
	pe4++qIHA6G7qiWSgyD/wUZdazam0iWTXDgXaSe+a4mzpWaBFbV5Htdeh9gnuXa+kWVZDoKvKLcSXjyTEzfiZaBOCGnJUq/y3srt1Ve6m42MCPC+c4N+8RehioRZly18dujD1tHNG6D9vEYES2T/IAR2t9Aw4SsJo94NDpzQglJf8CvLrvGpwzCNspUr8Th5Hpdn8mJB2KTlAR8LYZllzn6NWNir+M9mq7gwR7e7gBe/DUsm4mDZohHqu52zNyIzoQDRUdjwjJE83M1vLqif7TxgkHSA0mYS1OUQb1Espn5KA4+LxWmXFX8Byjvv+Qt+7lmxsIud+mFHbL8tcxBwyA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:12:38.6156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61852bbf-7522-4ef9-f9dc-08deeba60f4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7020
X-Proofpoint-ORIG-GUID: CJlpHe8VNZI6axpU6dvH6wAICPrISHgQ
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a66f6da cx=c_pps
 a=//qFBHKSfAsNB7iC0FeI3Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=KtRVGM7OAAAA:8
 a=sozttTNsAAAA:8 a=3CcUe8hjNdWRbhTmyosA:9 a=QEXdDO2ut3YA:10
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-GUID: CJlpHe8VNZI6axpU6dvH6wAICPrISHgQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1OSBTYWx0ZWRfXxRVKvkU1vFw2
 YO1X3BLuHUDDqXb3B9y/XjsSbsk+991UU/gbe7+F3pZI7wNVa2qqQ0i6KneMrN1teO4sFBgxZ9E
 53j2F/vL1/BFJtKMqkdEwCTQS5J21TU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1OSBTYWx0ZWRfX48jQ4XGjL2IN
 Aqnpd/5IOTeDmXWjvfSnsaZ4BwqQkV66l388LwIwcZiPhdBblJWxbSW5mgzesdXdVhRUxBS6IC4
 tYQpE/0TjjhdOFLFT+Mgju0/CGHczD878UmTiwMFDmeaK8WKsEcaTFrjaCa7PkCThUckBaRBj6x
 4nwqcW5RRp17BHwWaZlvIFzQGXtQaZuGjq6J5yNndL/7Ac/0VUPNHgxZWJ7TIqm5HpLLfxe3cUb
 Mhkd8VVrFirrbvAnNMTyvkuBlF839xUsYyFNIAAslkwASCAx6GQ7Uy0ToDcw7haHGDCCCRe1mx9
 4QuIjiYahxFxyZvk9G+RBruR3yl/wNMQWt68FCQYXj19p5HQ4NgDywdHLlVoEx5h3s5iuV0bAk0
 Pb2NZP0OE2De8AH4UmtIXG+UxWZP13tLsMRnuwh2t3zSNVIH35c/cwnHFcNFlntqUJdprW+Lqpk
 hqu72zxKy9rJrkdBXmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270059



On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
> From: Jianzhong Xu <xuj@ti.com>
> 
> Arducam V3Link camera solution is shipped with an UB953 serializer
> and an IMX219 sensor[1]. Add an overlay for interfacing the UB953
> serilaizer and IMX219 sensor with the RX0 port on the UB960 deserializer.
> 
> This overlay can be used to interface an IMX219 sensor on any platform
> that supports the V3Link fusion board.
> 
> [1]: https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Don't replacing generic V3Link fusion board DTB targets instead append new build
>   targets for v3link + IMX219 (sashiko)
> - Add status = "okay" property in port 0 of deserializer ports (sashiko)
> - Add port-specific suffixes to avoid naming collisions (sashiko)
> 



>  arch/arm64/boot/dts/ti/Makefile               |  19 +++
>  .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
> 
> [..]> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IMX219 Camera Module for V3-Link d-ch Adapter Board
> + * https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solution-on-TI-Platform/Introduction/
> + *
> + * Copyright (c) 2024 Texas Instruments Incorporated - http://www.ti.com/

Copyright 2026, with this change
Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> [..]
