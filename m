Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9437F435A8A
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331133; cv=fail; b=a8OiSrc2rzUeMlUYEGb/840DAWIHWDJmLY0I5+zvXXi3GWLV5h0T9CNPjJf+3rVW4Zgk6vjS54C9+XbDP4BYK+ncYmBdr17cAPmhZ0NMM4tABKIssPsq6WTA1EsyTATbzzI+8bofnSxjRFXDua7LqHDROfofHm7gFbbRupWBUdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331133; c=relaxed/simple;
	bh=2ZFIxU1QFljDWeQAvXUokqqYFpgtG0HZxesEKEVRxBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cajlnTSk6cI8P4+ZcnDyVWkcR562JROzeQihfYCfg/Z+nmc4n2kQ/fTlGx5xLmf7OxuWnVdfCHXVfBh3pIKITpfPMTuOG94JmLQhhjnGDCoitU/e7nbfVUK7naPcEfl/D8NUPugywnkwYbaMsruvihx6ir6wbNnpoC1UVtEwtmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dDvANXax; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FDTWUyKf; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dDvANXax";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FDTWUyKf"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66696qJW321638;
	Mon, 6 Jul 2026 04:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=O0WPRCFQgXjM1Rhmf/WjzWWxEXNRy28Tha66G1O6k
	Gc=; b=dDvANXaxdVQXuvCuEszD126IYttsAeb/kW0YmnRyEJ+OXBYa3HuGY4D+o
	yW8bSSx8tl/nvZrypIf8k0U51vtizoAmvKBF8O9RinVWqFcXiKnl3IzJaL6iU9pH
	hMIIPpdlkZd1YgSA/AgkA9iW9YVTF97mR4MMHKD7O+0Bky30kdRZz5I7oc+1sOoe
	xAwGc+kxL1z66naeZHVli+pcAcuYJRUwxGU4oEUrZyx6HLw9R5kGCQye7J4eOupb
	u9JRu/c8Og3maFEzRSeUl8vtxRirtdtrCWxK+aeT8RhNVW6LysxUOw1H9dVxsXp/
	1jpwzCPpCl8FwgzesQigUsLQdxXWQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f7hakwn5v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:45:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv07f2ttLmJDI/1mHmc09sLmMiNfymRHsHlmMeBigc4CyuiB5A05NbFUBm6hkBR6NHReBwlQK//9t7AThEZuXcxTC3Ez0EH1kROYaBrTQZObNfNavR8woZ2KxypbhWg0l9wjYwoK/f2nPIyCIQyIzi3z80jwDnnSeYONZmd35z60xLVSkVoccg5yuKexwiV6YhGHhO/wtDvMLpkXXfV4/SBGzP8oR057R6gczPLzvQ8xFtQ72rQPKnuApOOJKGp35T34igdPWolfMsuIIdEmDBAE6tMWJfdvfJI56AdTYyjax3x0EU87rehP220YbC4rA7tVTdgP6N0JAPnRg8dBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0WPRCFQgXjM1Rhmf/WjzWWxEXNRy28Tha66G1O6kGc=;
 b=H+sGn1bzsl6L9x8tjrSF4le/kczQpOh7bOfsEjcPUtmJsruVe4RRHTMFr3zgs0Y0FSCPUnftB3jhyONFlcTUIjluFoKLOY99lQpbDEGdQOZs/p/iN/mX8iuYf9P6+LdSItPAZnIEh9IHMeFMLV7fK9ctnAUByesqaC8Mnedht+lKoeFk1fuh+kzi8UbQW/dPSITF1GJczzjbgWGZA/sG0DtPN+qfImjUmf3XVj9u6sZndyG09rf4FW37MPDq2mMU/izaKCjnp7Hhvxsun4OqDuSfK0noLxvf+MZmsxrjXvEEX9kGxGFP9jWu4fWOcZOOxI/Ua++WIDRWpOpjlwOwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0WPRCFQgXjM1Rhmf/WjzWWxEXNRy28Tha66G1O6kGc=;
 b=FDTWUyKffGTVo9Hs2oj89WCwae31ucSWDFUObwQ6WWI/GpjV5maIoBvwC+npsHl4XDzm0DDhanyP0JD3WDQyAtuTUQXiCylaBzjMFomkRXrowHSN3f+gEbQwaLTHG6ubZMwD+meuRKwTQwqW2o1Hd9KHHFMjEAv/HEAgxjkISM4=
Received: from CH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::27)
 by PH7PR10MB6033.namprd10.prod.outlook.com (2603:10b6:510:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 09:45:11 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::3a) by CH5P222CA0006.outlook.office365.com
 (2603:10b6:610:1ee::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 09:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 09:45:09 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 04:45:08 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 04:45:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 6 Jul 2026 04:45:08 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6669j1vI1577284;
	Mon, 6 Jul 2026 04:45:01 -0500
Message-ID: <9d8b9ab7-2a71-4ea2-a991-21079a0bfd48@ti.com>
Date: Mon, 6 Jul 2026 15:15:00 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] arm64: defconfig: Enable DS90UB960 deserializer and
 DS90UB953 serializer
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-19-y-abhilashchandra@ti.com>
 <1a4a7967-e1d0-41e5-9c53-5f91f4e13ef0@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <1a4a7967-e1d0-41e5-9c53-5f91f4e13ef0@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH7PR10MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 135a44dd-45bb-494b-5a1d-08dedb434491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|13003099007|18002099003|22082099003|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6rknFn6d0fyi9WTBkCtyaMUmNjQahK5izOHgQNgY5YWPQaxIdeBGvzt3K3wDV2qrlMFNdvk6fuYnG0dogW3enVsIenpcQNZSFTri4fn+JRWiGVBrz6+kvTr+e1fJdNEzcf1xL2n9HNjnr67mW9JvWsWn7MC5AvlzDEaORyKVs4dY7t37vDZOYp8vXToUqXLltj8+LgKv2m4DGHd2Qjz0/YqhQJTFENAsxcE0HBuiNuBkY/PI1TiBke69QwzPAD78cieJprL6JqGYSsX981t3EQc9tJHPbmeTMaADjMJWPMvwsp6rs5/2RsL100R33z2/bzV5JpugYyXcYJUK7dhd3PBh8GaAKr3WaGZ8V0dButlbJjYe8dCjH4umzrt05ZtyfiG8wNJpGrAPXhRL5p0tqphBQaFN37BZl1/YPd5oBPyn6Q2t0TfzFY3T90cVqkA0AilA0O88rXX8cThl+D96vLGaFHsul5PbYlT6C4F5DgwYEardOfdne9l97OTa3EzOG9FgqHAgxX4LUDjqdMD23gRb0uFuPYZ1juEJXeQCThNu+dEijnghMSWy19lIzll16gcHdtDUKXCRoDX1hLfOlsXhoq6SBBNvqRgSEicoRPCreidOqEKY0ijnvRpdE77PjLEVpJPxZJ1Xkx3mB9HF/W47PeGVMpkTl/mQsCAIG1y/F8X2bh1Vo6DMwt1sobHs3vUopfysRP4ygPW26TTz5g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oGDoHD+JChA9sJt0qpbx2t10ffoaCCK2lUs1UA5U3zeDya5rSbGTDkrbK+6DOghug/4bQ2jM/UXl3hiBRyAOBjLUtTpL0r7SncOuVWIlHTTw7Z0/u1e7+wGygdSB/k3woUB11UgXSzQMADRPeNyJKDx986k9OXqLif66/E+7RdaOd5bfP9ZmV5mSxclHzbeaeOI3ouvx7nRm0pGswbiMzf9W9zeXJ9bYZJsL0L8HJTk15kOLat6p9zH9E6GlXaKYyFqoroZ+Y6boJDBoymhsV76M9yxMhObZrZ7UtL8twYoKTm7ymBxCTLBvJj1FyBdThsej3NMuPMft25gtN/PFJFqXmCbrl2s/QUIHjVd6GtSTRS44eD4/FrU+ISC+hwDI2Kh5kFQcumRRxX6fp2El67VAQwxSRgjjhsUGsyyxmMcevNtJ9EopbNuPCBEgPYuJ
X-Exchange-RoutingPolicyChecked:
	CRKM7tTP0sBKYwFFcD45bmy20ZlLhiy1x4X0J+MWTmhXODERi7eQ9SAqcDYlqxGvYQdixs5EXQbu9tW/LQ+ObnKQb1qQOed1tZXB2t38i2Lr9xxYmd4dqyuPt1GBRzlI1Hzm8QT36RmTrx1RCzsdA9GlcLgY7iA2DmHsf67v52HMARjA31+r8pVLGvQGN5pOVOYRs7CVF9m4QJRvr2bHwJUcbwGZMRxAfm406JxftWOIax6To6krckSS+4dv/HYWsRWBQhj/5N2EZ8OScqtbPnbJivayjFITtWSmag26t3/7jnN4dofDldYd9gbqw+WCV9VLJxx2GBk1dO4zw8YjEw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:45:09.1870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135a44dd-45bb-494b-5a1d-08dedb434491
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6033
X-Authority-Analysis: v=2.4 cv=BpatB4X5 c=1 sm=1 tr=0 ts=6a4b792b cx=c_pps
 a=QD3RM0NeKQHimiaxCRpEvg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=nre1ShAAXU8_lLh8bw4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OCBTYWx0ZWRfX17B7UPOTjD+6
 490X60cp39BU5954N29xYMe3iUOX+U5TdyIcsm3lFGYeRHQhfjVrMnoFZTUMi/fRLJowjvOzbi5
 bVbv5SYba6OFrbAkR7EZ5DYt7zw/arc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OCBTYWx0ZWRfX5d4Zk+gAamCm
 ptFE89ZaxoWGmLTSO2g3zbR3zAkeh8Z8Rv0lxXtMX4EJelQj5a0ZfWrxJQ0mOICusWGFUy97c/N
 bGQLYejf3pAMQn2KWH9BcXSvR57c+fy9b82pi8Q1ytYdRlt1hs2skGNtvFt7Kwopo4wUt4r3Tnk
 n54vm9TPGvnabNcAF4vX3sluNoQSY/tkqph43oDI+3SPAQMhZYXnR6xcVPRQJUHTbtI3O/OHCUR
 cCC2LeUlHVcIcSMRB/cPE1iu/vpqPnENJR6SGARc9OxKK1CpCSdmFBc+TStZ3Hm/Y2KyYb+W/3y
 zdiVbQS+QHJpSfVg09RVDKBpAU7MOGrMZUEkN+NQlikiow+vyMqsKxZZ8vrv1QiHJdjujTSj8vN
 1oWvrfsKxWQtCHw2Jc8F/UMRxqwqaJyxyvNeak8Nnj6HD1MRkYtMcmQNNeioK3GaL6q/Uhxoh4M
 yNkkFvUuRyHH2xfxXPw==
X-Proofpoint-GUID: GXXyC9GlkB7rlxlnStWNtq57NADDGrtQ
X-Proofpoint-ORIG-GUID: GXXyC9GlkB7rlxlnStWNtq57NADDGrtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060098

Hi Krzysztof,

Thanks for the quick review.

On 02/07/26 16:24, Krzysztof Kozlowski wrote:
> On 02/07/2026 11:31, Yemike Abhilash Chandra wrote:
>> Enable building Texas Instruments DS90UB960 deserializer and
>> DS90UB953 serializer drivers as modules.
> 
> Standard question: why... Use lore.kernel.org for past discussions.
> 

After reading some of the past discussions (like [0]) on lore.kernel.org,
I believe the question is, why we want these drivers to be enabled in
defconfig, e.g. by saying which upstream board uses/needs this.

And to answer that, the DS90UB960 deserializer and DS90UB953 serializer
can facilitate capturing through multiple camera sensors on the J7x and AM6x
upstream platforms.

Through this series we are adding support for these on various upstream
platforms like J784S4-EVM[1], J722S-EVM[2], J721E, etc.

Hence we need these drivers enabled as modules in the arm64 defconfig.

I understand these details should also go in to the commit message. I will
update the commit message with these details in v2. Apologies for 
missing that.

Please let me know if you have any any further questions.

[0]: 
https://lore.kernel.org/all/394eea31-2573-4b9c-b6f0-0ac47780a285@kernel.org/
[1]: https://www.ti.com/lit/zip/sprr458
[2]: https://www.ti.com/lit/zip/sprr495

Thanks and Regards,
Yemike Abhilash Chandra

> Best regards,
> Krzysztof

