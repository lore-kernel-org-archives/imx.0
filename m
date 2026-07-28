Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E584C40D58B
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228533; cv=fail; b=bNbGwI6tzyzkCNMBiW88Zk3VZSsjywJJ5tthkM7t3khX6nGZ1HTjU7MoyLCsxbIeiSwA/N7H9mdq9w2QriWjEO4P9J+4R6p3OFBxw4qzM7PhmU36b2WOyuMdj6vWNhnN2exBdxgw+rMEEFZAkZDl+eOcJQkypnp/I103jdrs98g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228533; c=relaxed/simple;
	bh=YswpfPzMQLNNYgfbaBfjk651x9Nawk/gw224lbXutX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=isN40J8CxQesKxH64ijKd1feNcTFWjd1yVS2R1a+QE+uQ6uXcLDyCvHrkjFVpIc5OrSMU8eWJFBaRPVzD3NMpjl/FDkx8hlukDitPLVsWPe57amgfeRZFxkiar+3s0E0CRdiQoHNX+CtxVf+S8fycyJmhl4N3Am5CCE1fx1vu90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=edKpkpmj; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q9BcsGje; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="edKpkpmj";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q9BcsGje"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66S80K2b3214163;
	Tue, 28 Jul 2026 03:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=r1qf0lYX3XoEjHGfQZHN46+kl7KQRu5RzCtXHHKMM
	Xk=; b=edKpkpmjZRBmCu9R0lLGNz9Sr+JVN63AklgeMvBUMdE3wTkidx/PHSLkU
	ncAxiR1LEj6o4tAK5ZIhw5qLTvOS65W53eE4371vwSC1I7mn+ieCx+a+jHCf3o7z
	rPuhJX2pRvm2N/cSCDV/Mvx6rt8d2I99rSZ+Jt3a/2eNb9NTAziwXZTOSE/Mu37a
	9DnFUyjNbVhf7GSCmsAUM9c3XHKzz8nAdQKf3FKDLlGBgcV5wvDAKBP1uN8Bs7c0
	S9QUw3VyaZXguzCBgP4ncVfLrt4tGD7hmZoDgCB71pjfUDJyKJQPjUZo4yl9AhZH
	u5oRIRSW04DGdNLHfxlaUO+eN/zHg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fpn6ss92m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 03:48:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZdoRIEbdfnv2ZB+DJz/FGYw57dkqYjzjvwUqKYPa9xAzYmxO9sfd92Pb1yKig4odIBpUzfFkgvSvjips4ipiCL2/YFZY4etId5QbxqypEgvGuyU7CMmtjjK0JkHVWASHuo/PIdH0OfOJOZ6qV4wvekm9jO2WfX+qBAHxJaSKhqIoQBrzgHVMDlx6zTq9zFfEBElo8P/eXCwRWBnUkouXGBByQusfeuV7ALttQuh7IXUt/Q/Imj7Hyi58RAfjxV4aZeNXyrgt+zT1gUzJeP8ZxxCtnbDnsN+5wmNY4E5K3ULugX+X+PJmbfQerOY79G6X6Mm02m9nlKaugJKn6mCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1qf0lYX3XoEjHGfQZHN46+kl7KQRu5RzCtXHHKMMXk=;
 b=L7/JB8HymMcQIqdrGYguY/t2bTX6/glmRIVOqiREVLK1gWAxcrzYdnpBdrzvna+3ci1uKU6IcxG5woroG0NVB2wRzUWXIaKqAUARlt9qZBdIJTZVOHge31uOrgkUC1RabllabUEVSuMVTHAz4FDW2L6hL4HHdYsNMNXEcRcjvXuLkAyF+3vfRc6zjvlLSD9DC2zZMOyT+j5YvKWEbqcIV9GDJ9x8PEghBh2OH5xJBAyPaRy8PAEUOBviam6aKctIZVHL/Yrby/dRo4gaAJSjc8jLklApv/SxooOimXIGEakKAVD6kZydAODXrC8MxDo0O6/JeRvBFCGHr+ShdIndig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1qf0lYX3XoEjHGfQZHN46+kl7KQRu5RzCtXHHKMMXk=;
 b=Q9BcsGjeJO0Z2hzLXjItunlrGTH66NG0t1SamwVs9dLXtSiMxCslCP1vuteFXE4r7HvznUEe8Q+OjoEF5wiIfAKlqOUhwiy39Hk0w31noeZdw6W+XVnFsTk446iV6nwnYOLyxpLy6fv54UDLHKZGBWeWn7g50sMEb/9Fih6EF/4=
Received: from MN0P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::33)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 08:48:29 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::5e) by MN0P222CA0025.outlook.office365.com
 (2603:10b6:208:531::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 08:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 08:48:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 03:48:06 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 03:48:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 03:48:06 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66S8lwRt2316953;
	Tue, 28 Jul 2026 03:47:59 -0500
Message-ID: <027b9706-9948-49ee-89ff-5a7bf72411e2@ti.com>
Date: Tue, 28 Jul 2026 14:17:58 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion
 application daughter board
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
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
 <107e93d2-cf73-4d57-8b8b-7892ab964dbf@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <107e93d2-cf73-4d57-8b8b-7892ab964dbf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a10550-63bf-4a79-ed5b-08deec84fe73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|13003099007|56012099006|4143699003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hMZpjap1jHlKfKQuNP4OmThPs47k/dcIXVKwJjUL3fxHoZQO7dZ5ZcyYeEC7yoQIHKxDubUWyg+AoTAGtrpeieTzVZdBfHwk3JH8+6SVwCrCZCLCYzf5tQtpt3szyvCBsXRR80SLrDC2bFkTPV5ml7tZDE4Z+62e0UVN1BgWZbkNeEb8IeEekrs7kRSEzPUEZD9UfiKOlQE/WX5i6g59uNwtovAFXv3/7utwU2l0Je5Ty2MgR0awD6mCgDTV5LMJtA1SUtHNHo2ZMjTAxYZy3cLHYoab7p/cz7LJ3s4Ggsw4eZLL0L0sxCcp4vhbi9aNyUS2LLfCPVitlhmKOpuEuCBAD2e5Cdf8CNJv93Z9J2XnOsxq3DcQZ20UDHR/wVOgvyU5NGUi4ArJjGCrfudL6bgXrMoECK7KcYOTjM+qB1zCfhXbTxm6OTYk1VQz311JarYtQ0kYFgT/8TRKCbLKLuiqqYwyl+Ooy8Oij3L8X71rzphwKj7yjNSIjQ8d8Eg5gsGs/YECo2ZilB9XuyxpXnMe6eECSxPRMwBTJE9JnelLmu96kULeS78R1FnxiKZSNJmxGWr2E2XlAJ2eq3Xnzj3s8h/6P0zyX/spmm2BqU7eyuITWVy1cMIG/zZCvU9FyrpCObapA9m+35irR/EtRg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(13003099007)(56012099006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4uXqrehLC8Xe/no8YCSCVSehsOF8j7goPMjD3IkeKnoNFywtIOED2wBLXqRAndb7lIsj8n3ss7MPk5EYGqh2nAd83KnXUTADitg98U0UT0BM2ZYGMyMBx2NjAMnfUIDyAChn8H5qiwkctTAy6ySBqqrM2Q07ad5skBEKc0MOFl2UjhQHbiqA1Ot1aLrs25aClyCh0t6hcN1YCu/CQMqcle0tOTrz+oYmCqMW6v/BHlxX/a4gpJ6oY9YkfN7Va2e1HnP/lr97RKo56+hb01nAXH1riKOOJtjr6p2MN1Lv677amxNuzOv98V5E2d0wk5S74GMpOcgFzTbUMxxMDfPfBU2ZK/hU9T9eE4UK8oA6HedTi/PMzFotyVwsxBz5Je3TLe20LoJxYy6j4XVA8G39YQ6IcdF0ZBrr1BGsvsRzq+TYuuBJ2jfA4slfxwq2Bg8p
X-Exchange-RoutingPolicyChecked:
	NfLp0+MPZL4Njl92LYhIZ1eBZZ7dN8dL8cXh0/uG8MivBe5ienl/4c44foUaaQX99kLEuNLSSoe+zY5mIwmqwOSnZO+6Hne+BESPlg8uC8ZGTKWcmPqAxH9YD4FahWu+GapZCbYejd3weZkezjfGHHtyDhAEP764h/nzymgtxMpHLt85gJoF6qHdmkYbFAGY/BHGRzp9VCtC7xm5xV6pu6JVL5AOJ7fd7dcc04vDJ+lyBqcE49/WqIKRv8ryJC1BmINd9qDE2wVABDsz5GtZvD2KCq9ydJ58Lgr6et55Kw/oKX4qkGl/9gNeD2Tckq6pqO7LQaIloUbY5Tv6d57NLA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:48:28.0903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a10550-63bf-4a79-ed5b-08deec84fe73
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NSBTYWx0ZWRfXzPgOyBHT1Hjw
 fJj2oOudPhUkDsnidUNzVx8R7pU0L07WhSscmgcu2aR+Ae+DCI5bhY0Jfzq0Z1ARsSms95jlBJl
 8aykva6+7VkKebHhgO4LOrEkhu8BySvpqaxeW8BP9H+f431PjuU+At74icoTjZZMyNIOG8DJ1VQ
 GduAhpeAfDPO8lGCrdv7Zck9K2ziSWxfQ8a/1fBaUtQUNnd3up4xtb9fbP6X32cP6c+Xjq8XVJM
 sO3VJuIp2O3i1n2N5YKQucPUWhz4kyRTLfRM4o0v0O8dFmKIt9EnJ0A+qzLUu6PyaFEx18W1mGe
 dpWOrlwu43j2CVgg9HnllcO81oG1vCGOZKSzMB6pXpc2Lh2UFLyJPbCcBZBKDRyLcRMUNVPX+y5
 t5cABi4+85jPe+W5y6hk+bG7BSodJ51mRmzpPEUyMPD4GXOFX/po+NuWSH7UJ5LcuFK57a9NGhK
 F3X1bkzjGVB8as6ca2Q==
X-Proofpoint-ORIG-GUID: V6v5pfna8UnRAIrql7_pO56ijhK_7nG8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NSBTYWx0ZWRfX60+NgFshPc4v
 hjcwBlo+Mq3zaqWvKEddbTunGxqDaxBvqINS5a60eQ5if66y8qVRXtYRekxa8Ew07eSsWjkupTz
 LQPYEM6O0WYQ9TddclnkHpbdm7Pd2Pc=
X-Proofpoint-GUID: V6v5pfna8UnRAIrql7_pO56ijhK_7nG8
X-Authority-Analysis: v=2.4 cv=dvnrzVg4 c=1 sm=1 tr=0 ts=6a686ce2 cx=c_pps
 a=56tib/hgGBcemyuyLZC9AQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8
 a=cpm9HVpAnOFhCx2DeQoA:9 a=QEXdDO2ut3YA:10 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280075

Hi Udit,
Thanks for the review.

On 27/07/26 10:59, Kumar, Udit wrote:
> Thanks for patch
> 
> On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
>> From: Vaishnav Achath <vaishnav.a@ti.com>
>>
>> Fusion application daughter board [1] can be used to connect multiple
>> FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
>> deserializers, each of which aggregates input from up to 4x FPDLink-III
>> sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
>> ports on J721E.
> J721E to same of board, please
> 
>>
>> [1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX
>>
>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>> Changelog:
>> Changes in v2:
>> - Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
>> - Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
>> - Remove unused gpio.h header (sashiko)
>>
>>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>> [..]
>> +		deserializer_0_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				status = "disabled";
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +				status = "disabled";
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +				status = "disabled";
>> +			};
>> +
>> +			port@3 {
>> +				reg = <3>;
>> +				status = "disabled";
>> +			};
>> +
>> +			/* CSI-2 TX */
>> +			port@4 {
>> +				reg = <4>;
>> +				ds90ub960_0_csi_out: endpoint {
>> +					data-lanes = <1 2 3 4>;
>> +					clock-lanes = <0>;
>> +					link-frequencies = /bits/ 64 <800000000>;
>> +					remote-endpoint = <&csi2_phy0>;
>> +				};
>> +			};
>> +
>> +			port@5 {
>> +				reg = <5>;
>> +				status = "disabled";
>> +			};
> 
> Little confused here on port number,
> I am wondering, why 5 ports are defined.
> 
> as per DS90UB960, one single part can have 4 input (from sensors)
> and 2 port output (towards SOC) page 5 from [0].
> 
> 

The DS90UB960 has 4 input ports (RX) and 2 output ports (TX).

Hence we define input ports starting from port 0 till port 3.
Port 4 and 5 correspond to the two output ports.

So the ports definition here include both input and output ports
of the DS90UB960.

Thanks and Regards,
Yemike Abhilash Chandra

> 
> https://www.ti.com/lit/ds/symlink/ds90ub960-q1.pdf
> 
> 
>> +		};
>> +
>> [..]

