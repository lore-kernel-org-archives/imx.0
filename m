Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548E39934A
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785125338; cv=fail; b=f7Lb9Libfw0KtPvCje+LxgA4P2nStXvBNbihJdVIkL1t+bCFbXjJgPIgbEk1XuSoC0PPENlS3gS1vALbnGdr9l+zzz41DDKW7Mw95fcXGQZGRPEfsUTAgTwSfDJr6YAx7K7OnERylRuYbV1oPQPtQgEmXReZ2tSXoU2UtncAKgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785125338; c=relaxed/simple;
	bh=DAHey5F9WBLcYCF6J+gkivdyhD+YW1L8xhPi6THJfpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Je31kZwuIAsxMjgiZI1lTe0M8Xfi1r/7bMjiTi1QnINm0yBmCTfAcv9SyiRjzQ/LEseNtwGVH0SHyA91glArlPT0sosIR9m+WynOA9gQRwqPsiZMDPzGiqHGaLOx62MoeIfBtfG8dp9b5pK4uW2KcUxZT/LKRyXdJKy2/rWA55U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Jg8cS/kX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZUNITnfn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Jg8cS/kX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZUNITnfn"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66R1iSvs1363408;
	Sun, 26 Jul 2026 23:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DyrcmRTaQ1SJ1MdJybV0HAjZGRf9s8iqbDKka3G7v
	HA=; b=Jg8cS/kXsWyghiMFphinOgGvANEGr13/sjd37mnyMwM+hfhdR+1AG67rC
	NBhnEL4SAkslwErrUKs3Oqa6P/t1asDy1QqQkNuZtbaPed4WFxDXHoqB019zbVNm
	s0eYBQs13K7N/ed8Xpc8p4P+4u6F7lWX1mt76vN3t4WXKzQE4tWN/q8L6l0Tkl7X
	iVSgvEXKUCQUNBiK0IOjDbOJ8tfYgAjF0+CC3RoKrXLLTDoDcS5LolnMsZ8Xom7O
	erxEkeDKiinmc781hFip6zRrMsZqo6WAsY4BbtjKGVKo2XQBGgIS+prVA6mqsbDk
	DYH1cZntQeGX8TZ3BrKLTG2D+leow==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fnf3n35tb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 23:08:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi9P7K3UAOyvCer+iZy0UL9Okvcd2SqG8f3iIwgiiaHJhej5DH5MeABznvaDoJ2QgNO2QvNKVj2ic33aerEdd8GXYZbgXSYcGYhMWFr5ngpsGbIBQyRcfwlWh6eXRhOy0o8bgf8Mhv7PeLEVwmuVai9aZhpzbOtU8v/t+LmdcQ4W5pE+UU2uzoog0MnuQ02SYgRO2AwV9campbs5QE3qAfPk+LXyplK8++6/ki7MgZ7cfG+6eDxjeUDMrSz6pFrlBqP5UAFn/KsnaZqEag9LRF9tFuyCKDIGQA+k+zE9cdW2q0lsr+9zacJz8w94qJmRXSYveF3WWoDyGrjlrxmwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyrcmRTaQ1SJ1MdJybV0HAjZGRf9s8iqbDKka3G7vHA=;
 b=Z9TcpkSh3VbyqOEeToRTZncw4Bbi1oBniddMha5ZCstFzxc0lYFEf6Ff1+S8kYBVR2frBHmp33aXMh9RCs1zUxheGeDfxwYaY1aJ2O3Pj20EG1cvmVeKSG2s2FT+sA5I+xsIF0OMzv9i7A/uwD+o2QN3ttAWnpwFDYlqSgnzs4cxGJIELmAxM6CwV3imk49r4NTyf73uTP+i/Lc0nASQ0pcObMfr6R+3NLTwWGQW3RscJO2Tny0nKGvLis+57XIIypOyOLZYltCAublFrrD4k3W91lxXyDAkoXVL+v2wyzOBz/ko+5n7530O+Z3irqWCWHmdj1QjCo/NuPxsWZWa6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyrcmRTaQ1SJ1MdJybV0HAjZGRf9s8iqbDKka3G7vHA=;
 b=ZUNITnfntZKq4Q2l9zrdtsGrotzuqZvx7Lt/E/DTtp1H8kwiIPF/nUoWMc4bm3JZEvuNN9xVXanLyBCpjslTcda1/czBmdMulCKGdLH6daXNAXC/uK7DwUlT5hzVUFk7+t2iyK+mFmS5hShZ9xY786agjKcrxVrnOhAfSVY7T/4=
Received: from CH2PR20CA0024.namprd20.prod.outlook.com (2603:10b6:610:58::34)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Mon, 27 Jul
 2026 04:08:24 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::1f) by CH2PR20CA0024.outlook.office365.com
 (2603:10b6:610:58::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 04:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 27 Jul 2026 04:08:24 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 26 Jul
 2026 23:08:23 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 26 Jul
 2026 23:08:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 26 Jul 2026 23:08:23 -0500
Received: from [172.24.17.28] (lt5cg60819vj.dhcp.ti.com [172.24.17.28])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R48GMG346357;
	Sun, 26 Jul 2026 23:08:16 -0500
Message-ID: <24572ff4-1d5f-441c-b7e2-237d6caaa6bf@ti.com>
Date: Mon, 27 Jul 2026 09:38:15 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] arm64: dts: ti: k3-{j721e/j721s2}-main: Fix
 indentation in CSI2RX node
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
 <20260713113423.2310443-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260713113423.2310443-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ0PR10MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a89999-6c77-4506-9d8e-08deeb94b411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yshAJlGRQt7g1viCcKBOHt8UVO9Hqg7wZ9L6gK66GoMhXFGfVHDcdKesATTVey7WQ9CXtJuJnqQOdASlnu4h7xgq35/KD2g9GlxWHrPNeBlHGJ7+8MctTxKNDpnVaYedyqco7oOwryZxHcANNAZxedq+JCGQA6w47GfHvqX+2pW4+CVPcIVqiYg9liAcOH8M1TSUCXevi7Cv8T4y4It4zcXaMv7anR088qPanv9qKK6f411hqW2pKrq1I4K5FyajzfAfce93xNf50KUFP4Gh4EwU0RloIbJmYKQLUpD7PFzexMbJ787jeK2iEaAbU22Vp6cnb4WZC/9vxv2R/DUNGvLudTTH/k259NTPmmeqpRIfnq0VtmS1sM/pIN+UhR8UuP2m0X2kqIKbRFX2l0ydq6F1XkkmXpFmoMzr+9Dg54ZGay8K1ocKZjGSHzHUsfB+L3uyjfijOfgS8ZbfmMa+0ypkxHl4tETlYCBCvWZbXtiv49EpO9o8u7q1J0WgvUiZq87WoTKzKR+rAhxi4pZcQ/twhliwiGwJ+0IWYYqixf98qDKSBxIR6KXWjnO1GVfTnLiPxRQmW9pFzMuN1AxuAM1DZII4qMALRf84fiCwB8vV15jvmiISs3Mgb/EgqjDTnSnkxEzMeu7G80RIvLn8NxNsS+U5If0KyPG3Wu8sEKPgMGUv9QaqcnHr31rtRZ3fSTbshujJZARDrK7eseOdLg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uxLG7DwFVU9CQkToR+AuYvsmCork23Qrt2OnzZsou6/vCuANT/q/Cj44ZvrDPC28HnkONb7RvtPBnDjqxVPFh1PO3LcfixMytbht2Kp3Cc8u6btVLQOqaEpIZJ6T10o2cWU2vNaGaMhjKnHpnqu377nhnL4pd5N2snGjtjLkK2amh4yYCwD2YPan9gaKs75HCd5Eh5ly+iGCAMqxcrwUQCsmQAYGn445u6UcBYKsraAsr/9fQW+c6cVCkwTgecNsIUkyLqqNPlTwJda1Xm89RN9J+CQBgRvL3LvtO4YIiLbB9CFAKAgBa5LimkJDzqg5eqHt8kESfkGoVZb+68iqXU2JxHbVveKeJqheuH6ZXXgwZxYSFSJVz2ATsow8Vmfml5N9UMpkNWvJtjXoKORsNX0QRqCho8HXNg5DsUCihM247TuHrYI2o4Vor8Cdw6Mt
X-Exchange-RoutingPolicyChecked:
	p7hzqZYYA/qsNNlsRVFVlO4x0sHLUPgSkGUaTR3jeOQoqt/93XHi9+PTwOo3KWjHuQG0P102jyOMFZ/7bMSR/Zj89o4nhAMNHEPzqXDSBf9vk80wP8KblP8DIsFksmjKzasXZXa0Q/nyFcAEsfHlot+w9/ZOjo2N3LxLA03Ief8lGscpJdDJcBeaNYlHQrfu67usu6iIxpNLmbQFJAWX0zay8JdBm3cdw2jOrtATRwevjJnxUHerMn+MUuEYw/495fQte+YsHqpPAqtsuEhLQTN8BqXRVOfwpH85wrF7FMDjHRSN/RSW2X4EP5V7N5dnR1+bHKoEipDB4d1P3YQh9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 04:08:24.1003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a89999-6c77-4506-9d8e-08deeb94b411
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Authority-Analysis: v=2.4 cv=LveiDHdc c=1 sm=1 tr=0 ts=6a66d9bb cx=c_pps
 a=4LksaTFCu4UF49iUfNHgJg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=1LWa0RtJbRoDEjjNY-IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kZjFY6O4uI-QaXaHuxW-_252Jyc98y9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzNyBTYWx0ZWRfX7X1yLwKm3ztY
 ak1rkSErW1bhQ5itTXf3ALDc2wyrVKPFUzLMj4sPyLdxogmLO/sAHW5oD0oBp+uW9ux2GvgILCN
 v1LLcVAoTXOp8v0Y7hosGHCn7jAiXI/A0DTgj7UItu2qL7gUZWvRQylFDHQiPVJ+RvKy0qGge5i
 LiGkWPzQikEERuJS/qF2yHrG9Xlgz5rjMUPE1kwpuZS6rL0IshfuNHyO9cpHbGYF3Rx3ofIENoE
 nzJTt/zlnYBozVSPKW4eTBkY3qwUY9iSdjRBUjkxGxTkVKG2G+fNysqM6B9kn7aR5NOOg1TXS/7
 I9cY9p2mSS2f/6p2XOk9TzS9qsnUeA8ogwD7/q/V3tkg/hpMQdwgS08JzerGunkJJX81ukwuDMD
 z0PR0FaEnjKyonRjCt9XimdsJpSnJ8ONMNNAr7YBKzxeSeeE5sFojr2ogf9ygPBlONncVWf+0vO
 YAyWUyXIt32oUH3Erlg==
X-Proofpoint-GUID: kZjFY6O4uI-QaXaHuxW-_252Jyc98y9D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzNyBTYWx0ZWRfX/3eOiBxFgw1w
 cc5vQ53XA7KoV8yeCcGBiV3nGNrrx638SM3lObWIQkJYVpDVmZTEkQtrWT545dvSXUTOVmlFY6c
 TJxuedQHMMYKh4281LXEVuQqx5/4SlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270037



On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> Fix a few minor indentation errors in the cdns csi2rx clocks and
> clock-names properties.
> 

Not sure, if this need fixes tag, Vignesh ?

For change set

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi  | 4 ++--
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index d5fd30a01032..5a8414fc5751 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -612,9 +612,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
>  				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "error_irq", "irq";
>  			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
> -				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
> +				 <&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
>  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> -				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
> +				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
>  			phys = <&dphy0>;
>  			phy-names = "dphy";
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 1228ac5711bf..5cac119e4292 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -1251,9 +1251,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
>  				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "error_irq", "irq";
>  			clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
> -				<&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
> +				 <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
>  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> -				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
> +				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
>  			phys = <&dphy0>;
>  			phy-names = "dphy";
>  
> @@ -1307,9 +1307,9 @@ cdns_csi2rx1: csi-bridge@4514000 {
>  				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "error_irq", "irq";
>  			clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
> -				<&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
> +				 <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
>  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> -				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
> +				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
>  			phys = <&dphy1>;
>  			phy-names = "dphy";
>  

