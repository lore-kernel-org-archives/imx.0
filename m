Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E841F34A
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231971; cv=fail; b=NTK9TC2Co0Ik7IfVLboVCZwRKjii06BK8ignOkjLG7RJZAs9U/xM8PYZmBQdEfEbnHY/v27ciWYFIgGdqdb8ffkP3Cq+yQJEQTiNpSOi3TYEzmE1XOke4wSNIKjuwV5qk+sf+9S1ze+p/0N7jPgxiUbs1jeZALXMFX3Sp8g+ctM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231971; c=relaxed/simple;
	bh=QrLu8P4CZOk0ApeNhADNJL5Y0i17NRSXSQO1e4re8cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOnFkhzoqfsjrRN5JhQKZ7RlVDuSovd4jwIEqfcyVMd3FsFVuDHiv5CrgjNs6JZ4IXA6hjj5Ozhp2WR+vrbiRk2OuE/So4SJfqq+h4qa4DnbK9gG0OXx6ppiMiI1aNH+jsrgX86jhxDOVs4MeHAGynGXk2xMFLbmvEnoGqIVTsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hgj02qEJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Can9KTIn; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hgj02qEJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Can9KTIn"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66S8xxq3838637;
	Tue, 28 Jul 2026 04:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k22AfubbHSpv9LTCuJEolvR0LAgXNB2jW734FuXs7
	vo=; b=hgj02qEJdBa2R4K+NBFKREMChr6OheN1Ay0eXDLBDakegykcxRSxBwxIu
	TKT5PFmsKsVkWH8+bKJVrzxLcevALzFPdL4GaI9CHVedwRqDvnaKTTbFF7/V/S3C
	xHPvmdlzLugwh+QsWW2GQo/MgJukPSH54erSCkw+m59AiE53O/vBJlSMVil1iym9
	DhB50y+HQ6IaY01zVyuDMXreefq1MPazmwYzuDDBw97ZbCxba5cBRq7j7FnrAeZr
	oLv1+jjCwuVnDFza92FQco78ZnQsRH149K8sYfMfqKyiCKCjuqtu9+OSnJgm3ar/
	CDafmgjDHAEDETzP/IUwOidgoeGzQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fpsdk07gt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 04:45:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV+V54Y8Ieb64ldV6kC/1I/YlyePFHkTYQ1WWTAeolbtmaKbQNWaCJX99RpNLWHQnCB7FC6Xf+3/GN7rV/Loa1DOvG1zecXw9Wcy+OLJUNGuF9CRfHJQT+hzK7l8WQ6I5ifsMLpfP/PGTbsJsqP+01iRxGA88nceOCWii2W7QPUfoSGHWK3eB2ixvRjBo+ugaj1wrcrutdB9/qvZANBjU/vxltkSKmIu/Zf5LeVdf++rCsBUT6vvtKCvqEx+6diRaYmaehnT48OaOi3wtyvw4FFFNVDKxqCqi3JBuRdPn/7Qj9Uqk3Cp9fkQxa/ileoxi1m0IBZ5ecUKtp1EvKq46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k22AfubbHSpv9LTCuJEolvR0LAgXNB2jW734FuXs7vo=;
 b=UhaWEUUa0NuDJy6o2LZxQ/Mn4Bnx6OUoNPI30xjhYyKX01m+T2AZ7jolpffkxKiF+HmFhatswbv2KWOTNcBOYyZxJuudLb/MIkxAKMamw3AjfmqrQHtvoA+G1MG6f3POyNrp53FtYtyMIrzCsFVhHTbUaKuELv8TDz0T7lEwQ6YNzWS/K5ZE8IqmlQvA2/uSdUyjHmoasa23uV4ukKYSgJ7aOQbYQuZ4BSjKnJbndbc6IKL5J1QAcY7YYs6Z8POPbTUufaAJ5UA0wiPRSfws7kyL+Wte5LEG9f0QZFmo7zw5VUxcEJV6gLWSVYih8NCu83qQnLikn5OnFD+8v22hVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k22AfubbHSpv9LTCuJEolvR0LAgXNB2jW734FuXs7vo=;
 b=Can9KTInSavPY2P7wdtqMQcUqpdjuRHi+fKEvFKSvVTEXiYODC1v2JSIbOyrax4yUHFBOSoeAmA/cxoRHFZJmleOI9JJlLeCH4Oz2bnWJd/oro/brLfPvxMS9EgNGpiZdQrFZlV3J/0u3kLe5iGJXaDhiQiS1s+NGNxllWpQ0XM=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by DM4PR10MB6063.namprd10.prod.outlook.com (2603:10b6:8:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:45:51 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::92) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 09:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 09:45:49 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 04:45:22 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 04:45:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 04:45:22 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66S9jE7P3045412;
	Tue, 28 Jul 2026 04:45:15 -0500
Message-ID: <2ea14bab-d5e9-458e-ad6d-bf077ef4da61@ti.com>
Date: Tue, 28 Jul 2026 15:15:14 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] arm64: dts: ti: k3-j721e-main: Add multiple
 channels for CSI2RX DMA
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
 <20260713113423.2310443-3-y-abhilashchandra@ti.com>
 <97f891c0-4210-4779-9693-494a377b3cdf@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <97f891c0-4210-4779-9693-494a377b3cdf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|DM4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a60b09-7763-4e30-db9d-08deec8d01c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|13003099007|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Pdk5AXxDyOjTsTxCzoLIWcGLYxDG6jPE6MwKXhC3hvtKSjJZjZLieRnAz7OU2+sQuK1sahvskeldlMbE2+gdoMG7Cz4+2F3R+ayUWQht2ea8+6LKeHRoDP9rCcqpAIUXriNLZY/ahkziIetbaSX743uKTf5pLE2NW6i0q3M95I9myd7Yhp2Yn465oXMB6drB5Zieo8+3Abzcvc8+Df6c5TG87YWzbLI9hfhL1QjmyIi1gcbhQ/PHeurMqbSkV71PMDXFmsntvGzmVOjktDHOXglI1Rqtff/EVIMH7pStZohdtpSIEBGBH2VrVLkeZv7maoKDXLmjKvfyOa2YdXkdRNbkLi/1WhaZdckEbiECGLN5SQ9BvWRFjJjanv1ZZVF1BHmsYpeKkFgYqqjMNXlKHpO4wOryQwXCS0HMs51+dIPlDn/ANfEk+UGkjvYSjpJxMGKSaD2Nn0g735qlUKFDiHgQsmsjo3GjtF6iClFhJhODvZfg93xKHmEhRr8k4Q7qgO5dOUt1TtQhhJHAk+8duQrUp4NlpqckQDIeCIR5PiTJutW/UWRCe1gD77BT5yfTZqqgWIDkojm5nxArcySu+jk9D5GEeBCYGHwjhsi7+xPZdr5jD9z6Ps4slW4Zp3EVmXj8Ge4U6Ed3cIaDrQATMdjvsm2Zua6hQBqKWKWXuG/D7LYJ4hYBS4EiNdvRaYji+ZB8Lym+rLFM8O3V67awsA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(13003099007)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jOrnKbnCN8SMS0392MT8leHiTV2mqUBwASxrb93bZodxLG5O8PYsA7mW035bU/Ag1umriET6Rc2q7EOV0nJDwZf2GaJHCbzdVSQTu5+l3Xw8NjfstP3cqU0v2BEQKoC3qNretzAOgqarR1PbDnmNSh19g6jcl69wsC37MOC3KJsyKeeumFiGMVe8E5M5LlmSKj2gIH4kKtJfXcQ9kh+v3EBcw15aX7IhcSVnv/YKJfsWEPe0L4oP/7D19l+1QBNKqHbgxSQk35U5fttdR8EKiHwA1NZ2N1yrAtoMflWuR53TF33YsanL0aXOdscPxkTQIJeSrgFJO3QsoZCOegW4LzjpTxFzrLE8j1I5uzelkv9ur+JjWiCYO2xqUbV7Y9tx94i5NQuzsnVww3QXe3nYLrI6eYQhpjD9E4CQkaQMVFWH0Q8WCYMIUKSstZetZb1j
X-Exchange-RoutingPolicyChecked:
	Joksvk9VM8cJvjno67n6cKNaX249P6Y2ARW3teDeHy5Ch/vJ2LM5arqJ9agCy00dhfj5n+VvbL2vJXgaOtXB7hJSlrAF3TD6xfBAnoDfLInjy0WvAtbIBHy5fMsQvx7p6V4TkGzGcgOxUP736vRdYESqjusLvcxqXsKVLZAYBXO7Yb+hVAEeCh/bqm0PU3a3zpxDUfkZU4+dUFjGn/VrHkndECUlk1usX9ClMcCHO02H7167f153RVFN0WyCOO7aMO4fdcsX2CV4naPY4Z+bCBrSIVaVNamdw8nWxZrbNABjRZwwgPxHkLja4bfwv+YR0KiGWqTCF8sExUrCKy1nrQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:45:49.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a60b09-7763-4e30-db9d-08deec8d01c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6063
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NCBTYWx0ZWRfX375usdI1Kq2c
 LsobvepFV6YBBJg4PJgkHHhZbr5oALb7MNcYLSjd3C5kR74d5v3AgyYeuPScJODCUQXfHUZ2+d+
 clWNl0VTN+Zm4YlIakDbv87hSV76QBc=
X-Authority-Analysis: v=2.4 cv=e9M2j6p/ c=1 sm=1 tr=0 ts=6a687a52 cx=c_pps
 a=xSIn1YjG+VojQN1dL9/zMw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=apn0q0EWAAAA:20 a=sozttTNsAAAA:8
 a=t6-u7qCHwSwoaeaRFcsA:9 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NCBTYWx0ZWRfX6ONw5FVk+Z1U
 NhQzS1DkPN0AS6iisKUoxvqKDn1FTjWGOxUSlZynv1RkjtJVLBSqbcpLvsqOXusg4yBO2NGY70/
 RwP2gVNrm2fc9KRxkY8g7QeKHOV4GfVouscNxV7HoapMYSNpCGoZpHHf6zviolz3nouuvquEi1b
 2owj1K95vwfCsAhaeRBzZYGv4bX1im0V6Pwq4GFT4Y81bxVZBL4hzIjYsc6QPi/mdgZkG3+2hds
 fsu2GJVw2MT9uyNo92KJKVOujKuDOiF2Y488UUJCfXf5rGGYES3tFfHwkPGSmDYp5e334oXjvvb
 Dg86h++4RMcwH9XLCofjtQXfwGROv/SfTpMQZCUgUHMSOhbiV2HKZSaVRbMphZ42tQJNyHTgEB/
 AvpeXEAZweHd14SaLxwrBQRaDS9u6HF0EDfAlM+ugcnxdcWEHYwAiZhcw5HfEqrLD/8caNaqpge
 Mfuas3MFVeyQ8UWicvA==
X-Proofpoint-GUID: 2njM0cY-vz_1tyPnOAj3XZeL_DvoC1fS
X-Proofpoint-ORIG-GUID: 2njM0cY-vz_1tyPnOAj3XZeL_DvoC1fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280084

Hi Udit,
Thanks for the review.

On 27/07/26 09:43, Kumar, Udit wrote:
> 
> 
> On 7/13/2026 5:04 PM, Yemike Abhilash Chandra wrote:
>> From: Vaishnav Achath <vaishnav.a@ti.com>
>>
>> J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
>> additional DMA channels to enable multistream support for CSI2RX.
>>
> 
> If hardware supports 32 channel, then why you are limiting to 16
> channels only ?

While the J721E CSI2RX SHIM IP supports up to 32 DMA channel contexts, in
the current RM configuration, only 16[1] BCDMA RX channels are allocated
to the Linux host for CSI2RX.

Hence added channels accordingly.

Thanks and Regards,
Yemike Abhilash Chandra

[1]: 
https://github.com/u-boot/u-boot/blob/main/board/ti/j721e/rm-cfg.yaml#L1205

>> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index 5a8414fc5751..b1988437f52d 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
>>   		ranges;
>>   		#address-cells = <2>;
>>   		#size-cells = <2>;
>> -		dmas = <&main_udmap 0x4940>;
>> -		dma-names = "rx0";
>> +		dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x4942>,
>> +		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945>,
>> +		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948>,
>> +		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b>,
>> +		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e>,
>> +		       <&main_udmap 0x494f>;
>> +		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
>> +			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
>>   		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
>>   		status = "disabled";
>>   
>> @@ -656,8 +662,14 @@ ti_csi2rx1: ticsi2rx@4510000 {
>>   		ranges;
>>   		#address-cells = <2>;
>>   		#size-cells = <2>;
>> -		dmas = <&main_udmap 0x4960>;
>> -		dma-names = "rx0";
>> +		dmas = <&main_udmap 0x4960>, <&main_udmap 0x4961>, <&main_udmap 0x4962>,
>> +		       <&main_udmap 0x4963>, <&main_udmap 0x4964>, <&main_udmap 0x4965>,
>> +		       <&main_udmap 0x4966>, <&main_udmap 0x4967>, <&main_udmap 0x4968>,
>> +		       <&main_udmap 0x4969>, <&main_udmap 0x496a>, <&main_udmap 0x496b>,
>> +		       <&main_udmap 0x496c>, <&main_udmap 0x496d>, <&main_udmap 0x496e>,
>> +		       <&main_udmap 0x496f>;
>> +		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
>> +			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
>>   		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
>>   		status = "disabled";
>>   
> 

