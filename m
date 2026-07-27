Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB535DA79
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 05:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130205; cv=fail; b=mI+RyMLGdykD9SW0/sWjGT8slt1NRPH9AfqfD+N+SK8z8YQas9dh3lU2oAJK3ZMBNI1YFGh1RJe+G+HDkLdpWXP+I9DcIqDyHzm2/sKlsPb/IbTZoLOD8imAbTfg3/HT9l60CebXOu8OXB/xgyMs2G6AIrMeazkMA0vz0y9oLlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130205; c=relaxed/simple;
	bh=xGYiGpnx3cmq8yo18hbfBYEMJKpk3JDcmv/MfYZZ3+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SzuxeJBSpcVZE3VvwdyJPrjUtuw6huiaNYlPCaDuO6VjBy+XfdS+E41bsCVcXjm0+aEyjxbJEqZGtT5mwa7rPWeR+Rsayf5jX6w67THtqLz97g5lqPZnn4FjaFbm2TgZzLn7vsnrD9xXp/IHhLd6GvURmCLyqiqbsmdfzWtoBxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MnrFi00P; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JZypQVwr; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MnrFi00P";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JZypQVwr"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66R1iSTB3757592;
	Mon, 27 Jul 2026 00:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=L/ntJXRRr4OjhqHMMsGyMYGgYHo0I2TwRLv/2jgZo
	yw=; b=MnrFi00PHkUiY8OmJXKOAISQ2zyNGCwNYSGtZ028QpwRU5tYC0ocA+fCJ
	Km+Bf+Gk6Ty/N7XqRw7jQ8VOCJVOvL/Ymmybjwx40981wbZZFkbrotGsVFgar6eB
	BLRVaFlW7Flzj6uLFii5/4X+2oAzHYDr26p2cgj+AyQA8XNj18Vg4VSXinwftbUp
	o6Vx69Z9bRAq2gnzeGPxUo0n9z27pjlCS3GABDtf/fpuS5eovxY0Lj8CCyFcLaZo
	vdwi8b7sW0IWs4PhkIllQSAoLSoS5hFvs+vWLObcA+dPhOdUkUZAwqzaykvKP6UH
	WU7QCHQL6duMkCbuepi0VrRFHRhOQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fne5kuxxu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 00:29:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVgk9cozfgBJTohEIH//ncXQaMCyhWBkQ7Atx87dU2vMacKkUhOxnbMBY9LjcjY3iMrxJUaA18qcK4+U0jK2FtmIGnrEqQr07d6dF1aglBQMbAxjdwVSH5UJA8iO0TTYWOFe0Err9CZCbPOHcR/au1anz+Wn/6g0lWsqj0x8HArvZwfvXIl4iXbg4cj+SFDOY/73YKaQQY1m6NqdUezVLzs3CU4jSHvX/RpvVGL3qX0cYz6yMZ0lDoUKKi5R/3/iEKL7ZcT3+gI/yvQqHX9RwnW7/N2GbtZ4JrzmbSZS/GY97rSSjivGKAqosomL1x0nBAsMRLC2HcQVmoKv/pC+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/ntJXRRr4OjhqHMMsGyMYGgYHo0I2TwRLv/2jgZoyw=;
 b=hvNF83j0I9mJg89t5NRfa0G52KMA68ARnjtyH301V5QZGkWSS8f3J/mT2iBG7MQ+bRddIAjWh/5FdB6Jgl/n1u9J3nJnYxofp+1gA8BsWSYpobUwFge8aaDB9KoIyVvtDWM+OkHMnt9Q48O6S46RiNtiW923ozGl3jO6lF0gvHWwD6mUyDw7pW0yX/ji65hRRc3s9nC8TRzDK16kDH0k4Xte/jB7eUAx9mRfok3Ypexr7A37bEKBQ0g/C9SIqao9ohaJD7T/UDKgmR5lceAK9HTm3f3ZyhrqGFWv3/FL2x0IhJe5i0SYiKGcRl1h3l/pvFWwzZxCPpJpsMe3CMNzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/ntJXRRr4OjhqHMMsGyMYGgYHo0I2TwRLv/2jgZoyw=;
 b=JZypQVwrybraKT+XG31efozNUn0UT1E5p/WMxO/9HlssbnXK3gSFrBlrDq4uPqUP/QnNT9zw/ISKRcq1eIw5DSxlEN6Y7owzIUtON62c9B/PsDFob2jqvg2uMLnsWtxgld+i96o9pHWiaOi34rmaX8T/pf2L4k4lWfQrZtsLC6E=
Received: from CY5PR13CA0052.namprd13.prod.outlook.com (2603:10b6:930:11::34)
 by CY8PR10MB7368.namprd10.prod.outlook.com (2603:10b6:930:7f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 05:29:45 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:11:cafe::22) by CY5PR13CA0052.outlook.office365.com
 (2603:10b6:930:11::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Mon,
 27 Jul 2026 05:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 05:29:44 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 00:29:44 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 00:29:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 00:29:44 -0500
Received: from [172.24.17.28] (lt5cg60819vj.dhcp.ti.com [172.24.17.28])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R5TaXf4042529;
	Mon, 27 Jul 2026 00:29:37 -0500
Message-ID: <107e93d2-cf73-4d57-8b8b-7892ab964dbf@ti.com>
Date: Mon, 27 Jul 2026 10:59:36 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion
 application daughter board
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
 <20260713113423.2310443-8-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260713113423.2310443-8-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|CY8PR10MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 5936329e-f5bb-4908-65d3-08deeba01103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|36860700016|82310400026|18002099003|10067099003|22082099003|56012099006|4143699003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	3uEyRKnoFAYS6jvJsSTMX3ABOOfBFUat9l1Fr/bx+nf1rSziCTBebcSL368NYophH6Bddk+Eq5Hfg2ioe+nTbDTk4MtlE1UqyKiBVoYRukL/Ry8sTOrdjcuwvrGBprF/72O7e+aczotET+4j0IB4JzoDdzZN0kyPRsd85ntE/TTk6pwExhNpou2HVBpOv3feeMfSabj/3qzRpAFyzkN/oTRrVSqe+ZEpONSYza0pVmrCAtH0r/4KJF1wJmueQyNbe8dnLQCW0Q0X5NbVM670rndk+3ThpDo/7rGbCX0tYO/+WN5cC+jq6KS/OJR4aylDTreKgPda4pgbR4ZRp5LQ0u7EcxIHOIQPZ2IrA/5fKFFuybtpoWg5R84PsUKj53bbDfkIkgv7WpdZIu5mKHmOD6Sv3fL/1CEDTIdopjZwuesP9SZojrK+GMZyDlEces1XRKQ3mLTBdrBCcGXqGxlyoYBqtPoEK0w1mDvNzYCAW60AQ/GHbzznWwGOK/yHdWLM4aihhg5HS7XsKpQXp17lwtCn+QnELywRkiLaXv9ZggtMVwpmLn/+Zt5JIAtPNOkVZL9E7r2yOKskrneNKjPtRi4i17kDkxnMQ3obONOKDaf1MRtPsbYfhnV2kh/wngNFA18PEla4gLbRbMcj73tI7A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(18002099003)(10067099003)(22082099003)(56012099006)(4143699003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4q1L+oVWuxKK6ol18A0ZLogRxNJvUDJ8bTksi4ZzZh6mbx9eMb0xIePdFRHAfcizbiSCZ7joVpPpq1sHiwTMTlYF6X3ys2zxrEFSjV7Jtf+6jRLoGCE2pO02bgeL65cjvlbWp3m6DX3Carz5HIvsgjXcudlidW3xaMeClNx/os3TpLw0toyWsmB/4x9bS/eNHl5KucuP9Jhu6tfuBqXTEDG4dzF64EEJpX5r1IRY9kyp5uIF9BG1dP+yGKh/1zEPzGF/txtP+6Ky+XRBpuM1EhzTa+3pivZNm8u4cqoVr/CGxXoPr5YvmB5ZsMarKLRfyDw+9oxGVHoXhWn/L7VblcbaqxnmW/5LRrj3QGt3mni13DEHVEJbKK+8gv/77AjH4b/MmNNepaYBE0bMAVQhXmxY2hzQgHvekP0mbjmA8VbleYzOe6qlC2pTjZ5K1HJY
X-Exchange-RoutingPolicyChecked:
	UEeF9SeI8r9RvtCrTQG2mOPT2vGMXMfuHebU54q2Z1QXLeS/kySNyQUxgD1HIg0Viqs6Eb8KCgVPVHoQzM9WxwxySK/9OMdafzVHIqRzwSO4fAGBo/OpRtDmwmMP1nfisYB6avUoiHlWFc94U5aE9giczSraI5vziLUHQ7fK8f2mKgqYrpyiewN/XjbqSMrYPekGqFKHNDhp6jgR2g/dSMlCIoDVKDb9J2j0E/1NB5wMT164yehT+vEwoys4DwOAwjQdhhQTzLTOsFMmuQaewNlWzV44jfrHcpbVv6OnfqVBl/w5d956YKSVUuV/Xe29x2rqBuHZJLM5jZjFo615Sw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 05:29:44.5105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5936329e-f5bb-4908-65d3-08deeba01103
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7368
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1MiBTYWx0ZWRfX0sQs4QOUa0AJ
 iCGOOc/ZYay3BX+p4Ilo7wUa0gqqWr1kP+lS+vipDkibJf4je2u04iDAEb6lFAxMr1ZBNzWIpV/
 WSOmXCPVZL8jEBllVDQERmvuaE08XNQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1MiBTYWx0ZWRfX+6CUUcEONkLb
 e5ppHas6imTgoX9BIDjq/vPyEPkotJr84AT55aY0S+z+zZOhJwkMyxp9jRJUr1tS4h28qwm5vI7
 h4J7dga0v36ySz9SHUF7c0i4tAGqtft/DwrXHZubzX2Y3uPf8rpYoYb1KrKWkKADPNqml+3EELl
 h7AVcqnqdSlreRBmRk505LVO2YuXovfeYzf66dFwNR+Zx8+Owmb0fCzNCQ2Yrx+qIlqcIHHSw0N
 pY21yLBHsGl4ocs6P9GuvyIBzG9E5Gc3sTlwRybq0WVLTD5v8vCR8AZopEORElEpS6I1laxBOLq
 bSkbyT2c2ChCZwupYrk8uyzzkia20kmAZ8AorQfp4+YnjQsWzazz8bsSfIDrxSCvwSicgsge6CA
 ZRbputSDjRvJD/JL8tL4h3F5o3uo3qa9iTYPr+2iJpHt3mK+5MPy1SQ87Pv+uKMC6EqBfKxUWr3
 555eE8OlifCfrZ7QEHA==
X-Authority-Analysis: v=2.4 cv=X/ti7mTe c=1 sm=1 tr=0 ts=6a66eccc cx=c_pps
 a=TAA+lrqbVY7ItQ3T6C2wEw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=TavsJCUsWUQ5puhj2-EA:9 a=QEXdDO2ut3YA:10 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-ORIG-GUID: wHfIidp2joux_k5cwvikr-1IXP3TLnJM
X-Proofpoint-GUID: wHfIidp2joux_k5cwvikr-1IXP3TLnJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270052

Thanks for patch

On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> Fusion application daughter board [1] can be used to connect multiple
> FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
> deserializers, each of which aggregates input from up to 4x FPDLink-III
> sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
> ports on J721E.
J721E to same of board, please

> 
> [1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v2:
> - Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
> - Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
> - Remove unused gpio.h header (sashiko)
> 
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
> [..]
> +		deserializer_0_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				status = "disabled";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				status = "disabled";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				status = "disabled";
> +			};
> +
> +			/* CSI-2 TX */
> +			port@4 {
> +				reg = <4>;
> +				ds90ub960_0_csi_out: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					clock-lanes = <0>;
> +					link-frequencies = /bits/ 64 <800000000>;
> +					remote-endpoint = <&csi2_phy0>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				status = "disabled";
> +			};

Little confused here on port number,
I am wondering, why 5 ports are defined.

as per DS90UB960, one single part can have 4 input (from sensors)
and 2 port output (towards SOC) page 5 from [0].



https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf


> +		};
> +
> [..]
