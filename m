Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26F47CC70
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984738; cv=fail; b=KXA1d2AkF/theK2VVWwa1r5p8GWzUAs4ab9u8GuDOLh7GMhAuynjhhGnQ+rxXIzm0jSzyQGUFYCRiXlbzzNPh57F3hWmg+HJS/E/bQ45Z4rWPaukNVM9QUMQ0BLHvpNXSBPh3IDHtMJxob/PpwCSutZiV4iFGVpzLscxPqkKC34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984738; c=relaxed/simple;
	bh=cLb59/guxQWFm6Gbub1grdHF5g83HWkV2aRWDyhdJOY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXsv69lOWj7zT5VEl32DDdKtWknDhP5XVNLmMBKkWH7WvHaquVH9XwbBEOU2KkX6rwJuLUDWutipRq/MjLA6ku1zULOax4Ppk3MuFm5kRR+dzbLwtvRfWcFTd4iy66q/fnuBMYyigbTD7unnXr9HlDCbvnzYkGFhhDDS+ClcYx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VYIYhEnt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Oi1epc4t; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VYIYhEnt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Oi1epc4t"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66295WJZ2028544;
	Thu, 2 Jul 2026 04:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1
	PE=; b=VYIYhEnt2MuYqWEvH/IVxMnzeNm2orxi7Nsm4pwT02W8VTuO31+gQCWZN
	9X/siqzZuo7CXrDt4W2PMo5L/ZKuPPuI7ycyalDWijzZjc6oVb9mKFX6JKHCRMpA
	gp5tNDh7rSWxq9jbSHSPwTCTJL5mNisztSlppNBdo5EuJV9gBNL3GGzjuHvHggrO
	xHlHSEK0XlsMqIESqz2KNjPiVoq07GsUOAxydMu2FIiqUVufolA0IgSZGI2WUW2i
	WU0rSJIEWwOkRx0W1CQlkELogYIx1gvnkZFP+zHTyEiAIgJVpSUzr3uZx58dsxn6
	ZbbEIH2QCGwlVLaH1RrwxuEkL1f5w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012013.outbound.protection.outlook.com [40.107.200.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5n23g3rv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYz6pmzVmPkNT8tzd9Gb0voBVqc7hS+xjkrPv6cv5REyrv6Y+BjbNqDVUQFMZjTzDlH+JW6bf7jWUx8rrZUG9kUHPLMtkB4B5hyy27yubRHIZgyvhKdWH49rN+B/7x0nkAr1THfU5AIMqc+cukQTZV6bP35JmfQmDoxGZ74ydgWjQaihpSmlGMd+RTroDPxST3so/8p/lSLzeQK6zkGVYOTvAKP3lSjcyAqPm91sR4VHyYtekJsvtxgs/SKkJ1hjOQviTNuphWLWRiK2/5H+gb9BXN/9JhoXrU2gdtiQb3Rz05buD5cLj9vUWL3NEVAD7XOlEdB73sjnAis7QZ2XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1PE=;
 b=Fm2BAwp9fVWCVAvSEK3goBqVJoc/+mG2QNCAhBjmgWk7qKIR/qccdWzXmfdK5ZlVPzINQdNF1CZOfkvkNpetEw4tRyeRFG5t8qtfGMJx4LP1Ap/tnWBLBtv0NyI2b5G0uGuYExlb+FlH234at2ZjgXlzzD+ZN0v2y/psz6Pd6aKgSDyirwtKurPgp80Ee4+tuqJU7GSMlahK9X0aNiCany2HpMKnSuNyqBWAMAFIPatQqoQ2MNw36gATFSLbYYPPxSyKycBrb6TadzJ2c0EYvYpK25qwBk/nJu7ol9XhiCwHD++Xmv1EUopAXkD5RffZ3kPih4T/SMr6gFrOYpmYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=echINyj1JV3ZLCDF+qTzOD/RxIRygLZ38EhNFhWG1PE=;
 b=Oi1epc4tgG9ZTbAgEFXfWI2n/ELHlihq9BzV2n8VGhe4/4V35bmn8lfGdn5zIercQY4kYhN0TypVrJ0E07v/SAOOW4YU3gpuJgXWCpMIrVILFhNJYExoi6IwZZ18mZglo3wM9LK6/Sql7jOv5OSHqGc5GC0t1GlmhOmLW39GdwM=
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by CH0PR10MB4905.namprd10.prod.outlook.com (2603:10b6:610:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 09:32:00 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::2a) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 09:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Thu, 2 Jul 2026 09:32:00 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:58 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:31:58 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYat3611021;
	Thu, 2 Jul 2026 04:31:51 -0500
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
Subject: [PATCH 02/18] arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
Date: Thu, 2 Jul 2026 15:01:07 +0530
Message-ID: <20260702093123.1048575-3-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH0PR10MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7714d414-d34c-44fb-8722-08ded81cc4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tDwigOm6M782qgQMl60GcT3+aI3of6mKPzTKvE+UmmL5+8l9qsLDzvAf363VzyUzzF2lH6v8/vOB1mB597Vg6Bw20owYWcPYr+fIxbe8YbJRzdav+vwfpiaRWaadBSY++tyXFfZH4ieIrnLS+tgM7csKj/dmEYSYAMdYKDL5YRAnIO9fVSLoeR+dYj7nO0nV8ptcZiYfBNswMrO/GUeX2OY9KVqS537WwxBd3osQlN8Nx9sEWoVssTy69xEMZ1hWlQ3N3LQusr6XzjYuEyt6/AOWdZKou/K1RoPbQMiu2GoSC9ggCdwwc9BO0a1GxOz0zZ60qY4RU7F1DhcwL4sk/Wc8kmEl/j+FbPFhp7mBDyi/u1c/CiIS1aCaE1AGdUs1rDf8iRhTGwlISVxfOewsuYBoWq9lGXi8GMuPNZ3a1YrJD6O7QmR1aumq0ZAToQtUQr0ODpwJtWtLpXNepuWEgFlMGy1E6vyBakxaR220oYBMjeN8vYmPmmD+1wRNo4zFo9/zHR85tJthTBV1IjARYMwCeh3L+tsy9SjT3IbVAQ9YNUgYZb6tAUH93ksKUZXZZwmMBKMeS0c0x7VdMi9TqIhiszAi2SODVvqbsfIiemR6iJn0B2eb2yws3S9GbFgRlQ7YBYorfj6mZaF+Jx1mfGaTQQL4IYdbrZjykD0ICdbw57OAUMGZ0LH6IYSlrHCRiqqXk2xU9Zfw0FKvrDMqng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jgMPLlHLB1a42gaJyW/73ogKoUGP0P8EiK2AJBaqT0EOAy5/+iQV+56kk26l2ZhXE3OuS97rdHaVXEQ98rC+LHgO3PDFY0VNQrabgKXQ7cDasSUIgtYUDmlJHwyPv3Pb4p5DD7K7RsUyYUdX8AObGdb+JgWRbMzQIsHsKRdWHZpku2js1ZoN8GYr947iRmgcyWl4IOXx5KFuXqMsmw8moKvRYrQreHEGlnCrY8Tyo++Ad5lvT3E33v5362e0JXL7qC1zhBZb2QbQLJKeqdoBYFlKK5Rb3i69fc5hNUcWOFwt6UstWUAGxyIbYM+WTvCKR83IEnaEZh62ohSYa8GT7iM2y+lqpuJm9uJDxFz3wAXek0N27WKZLzGqR2e+yGK2O1fcfPETTYYL1lDcuD47hYHgUhqLmJ18DFpwaqAWxh10b+i8Lk6p7Vb3gdjj5QCB
X-Exchange-RoutingPolicyChecked:
	Xrq1b/TLyubuALA88dvPlRykOPPuY+moDoY5rpbuylR9gctbfyrNDPcwUHyF5/pXUx4npVvY+YCx/9wlx24yAddfw2G3EM7hjDWHeExKGqmbIHXAD/7vcOSKj8k8VUZZ2UmNu1EJRZ789POtI0UPmuUmVZAkC+ZwC0clka0DeLFGvNoXxKSzX6aaEEs1hLei9+IOAmnV00jlBoUkon/6+BmRKa7ftrpweUSWsi48my7QmuAKG7wrSxrj8SnHEpXlMHdNCEqL99VAo6NASOB2PGwQMCfhd7IueGi8EyxtVbqv6zMj0MxkO2HWIDICXnFsEW02ueNQYBVPm24mGj9kxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:00.5151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7714d414-d34c-44fb-8722-08ded81cc4d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4905
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6HNAW/P45lBR
 cWVQUe5ejW+co2LfxAh+hDfwIAjyA6eV3zhn+GC1J54UnaHkxBes71T5Gnu+h4QYRDcZRdCDL9C
 b+lDk/ZMPtvuR7/3bCZ0OlSR54R7IgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7B+WT9as+Ez8
 qBeJf4yzU/G2qJBkh3nTjOJCx3Ygk1Rlw6As+uvmgeZxbXgcNykZjhfHmOcO/ZbgNyU9HrvDhim
 lFKBib5LP4K0SLnxzKuZWkUW3OAjXqhBBx7NsLTyxZpZmmmQDGDSjhrf5f5pYqqMCUjoai1qzsY
 StsWICTef6tLBuzWfCVbgUXmAqhU+DKHwBsM0+dzpJiw3xbRgiSGD1HlrEakkScdI1uqTYeInjn
 Y5+OjRvPnG1JJ1tM+oOKKupA6Ji82m9jwqKKaaYfAZZjSwdLkD1XSE1VDUQLqM2el7y29+Vc2va
 xedoM+JvOsnuvJ62h1isQK9kog1a6j7K4QwIVX2HkMCamE3A3awi1eTwYUBd2zm/NXnJYzM4pPu
 Tjg7tRRHc5NNq82J077mpMfteVdE+DggEKgHOCONcbq68+/J3wYDocP+UjCJYmjIXxGx6RFKY2u
 hvyb8t+lW2VZPG5gZOQ==
X-Authority-Analysis: v=2.4 cv=DN+/JSNb c=1 sm=1 tr=0 ts=6a463014 cx=c_pps
 a=qiA9p8iyC6UfobZpVQ7+mQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=lWlUmI80TkwTl8jqF04A:9
X-Proofpoint-GUID: sYnCvHWIRRIZA3XcFh6-TLkMhu92K_0K
X-Proofpoint-ORIG-GUID: sYnCvHWIRRIZA3XcFh6-TLkMhu92K_0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5a8414fc5751..b1988437f52d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4940>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x4942>,
+		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945>,
+		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948>,
+		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b>,
+		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e>,
+		       <&main_udmap 0x494f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -656,8 +662,14 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4960>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4960>, <&main_udmap 0x4961>, <&main_udmap 0x4962>,
+		       <&main_udmap 0x4963>, <&main_udmap 0x4964>, <&main_udmap 0x4965>,
+		       <&main_udmap 0x4966>, <&main_udmap 0x4967>, <&main_udmap 0x4968>,
+		       <&main_udmap 0x4969>, <&main_udmap 0x496a>, <&main_udmap 0x496b>,
+		       <&main_udmap 0x496c>, <&main_udmap 0x496d>, <&main_udmap 0x496e>,
+		       <&main_udmap 0x496f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

