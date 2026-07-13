Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DAE3E7179
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942567; cv=fail; b=fnfEHL49Hs0w5w1CHYBfSa7EgFOezSpQmltaezZQPNU1elimt0QDeNnd7ZMgq+R3IsZ6NPEiEo8h0CUPwKc+Ug5YZACOyQXs+jTgxAP6+Zs2TfajEWj1Ebz/ttPPonFchWeVuOlTkts7qGswuv83jSpu+i5q8GIZarHYFsoiTDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942567; c=relaxed/simple;
	bh=XPqWVNgiMRRtOiImxTKqtGaBrzX3LC5WMcGQxwoQ20A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFNYIFRXnDYN6bqGKWWxE01w3qhFw3C8JZ2Ut6hklxIu7Bw/gnHbh4/HzpRSiaAt0CmEMvC8qyXWmnnKI3XwRbtoFvSW6KN5DiMEoKixbe1MbRRPcnAJvqUmRM3m0DoA0bekBlTJU3Og5jbz9J/VXXC1Kt+JivKePizrSs0Gmgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Brdv/6//; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iRFH0D1f; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Brdv/6//";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iRFH0D1f"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBd5J2051552;
	Mon, 13 Jul 2026 06:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iFOWTDvQRLMpiyuj2QpBLAlgmEh4L+EOBghFUuAwq
	Ms=; b=Brdv/6//0P8U8RNIvGKMFXObo7h7gA757XeQgqDJoS2wAXpvGNwi7FAvb
	wjfAc2Mvu5lsYK9688gHaGUW3g1OXiHx1ap9iB8UK6L82fxYlrRNvPNpi//fe/Kv
	3DziMYe3Z1jpb7SpYNJoNmERk1u1zl7t6tDVM9IQoG5MwemWt91ucElld10n3Reo
	9xBF648WJlZQpSJHMWfFq1LSMYXPzMZepJkRw9Gv8POtJNM1PsbEe0JY79vIMro+
	NJoGn8HT4npZpo+xNbUopUOqPrnafYjMKUCVLV3m91zNKQxHK2i5X/mjkTW0oiEj
	3WKV1hioqF7xQ7vaDIUt3occsHhiQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fcxx6g379-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEiqtw22VJ77SywPUYf5fb01/2rxOSLbsyP/ae1mIyq5sDPR3ti+PmInj98q92dHJrejSBAuujhns+00hLkp99vUXk00Juemrix7OO0yFG1QQzXohGHN1k7wMzHYNowJoHCUBxWxhPSo2bT6ILKRZKyXi2rSl8QSXjTmoUHRME8HH/ebxwuCMH+T6x4wkkgOWxltheZt00B+hysZSTNPR9J5daqA9QQWbPr39UGd/6sdprrXSwvSXWs4axoGvjhhvA/WZ4DqR3jSRsd4l+fCPDeQXaKo87f3X/Zu065jhFYAOTMwVczi5tnYPJy9Py8gGOJd4b1F1ynYvt8oJCTDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFOWTDvQRLMpiyuj2QpBLAlgmEh4L+EOBghFUuAwqMs=;
 b=dVnrxuTStF1Butup9yc56VqyFn0cn/bhjql+QGZkNP6DOTQvpfYQcURsihfH16L8/kG5VFW+64x7hjfEnS+g05CeFEub94v65Fehk0VIjmHnXFxD86nreevhHiqq4jV8qPtMT3k3nXLBMRz9Iz5iVePo9/BEeYegWpDeqtbLDLro4XZ1RfyXW6y9TewF2fuAtqHvSDggeiObA6LYN2tr6Y/WKtGZE5SwEoeonpEyqSI1SdjutCNuvDsARn+9DfUgse0ILorcla6dbIBH5dT4sgAy9X6fzcJTj4Q/ExRLCDunnQpH+IVAWVNgigbWduOpPgbPlo0nRCw1QogIprFTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFOWTDvQRLMpiyuj2QpBLAlgmEh4L+EOBghFUuAwqMs=;
 b=iRFH0D1fVqo2VgsBH+lN38fq8v791yFDC56UhYTbvgUa/zuEkB1smDN0GJ0QHrW7UUs32Sci6GKImG9kjimoLuhLwbrtxr+aqWx2SuskP3HiTIZUBJbo7FmEnioDcNH6xehtRsf4Fe4ed9l53hVEJR1wTyvk/rTvyjkGxDkQ8eo=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by CO1PR10MB4660.namprd10.prod.outlook.com (2603:10b6:303:6d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:35:50 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::26) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:48 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:47 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:47 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQH1471098;
	Mon, 13 Jul 2026 06:35:41 -0500
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
Subject: [PATCH v2 09/18] arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application daughter board
Date: Mon, 13 Jul 2026 17:04:14 +0530
Message-ID: <20260713113423.2310443-10-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CO1PR10MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e64c0bf-1f85-4a84-1587-08dee0d2e2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|7416014|36860700016|22082099003|18002099003|3023799007|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	SvetrKnhpuBG166bX/wFHn4qULj5yeL4Tu727hv21Z/E1kpI9RWsOEe+xCdIDCDuY5dwIe2S+U3jasXqpkYMdC6CBa/w6GQtGxuDbDz7hHfRlQUZ0+BuB9CFgpopBANu/mh2r/BHfRpTpM3HWze2h069u1WODPhs7fpIFD0hRsQlgkE7LT7n8iV32yLN4h2VbcAAzrIUoLRwOBJYElhOkNE05lpnBWb2z9vlec3/VJKXi2Es3wxRFsswdQKkbD+OoUQFuTUBlB+bs30TMyMQPee7rqft/hCWBbyjDyYGqq5YeFXQxpoYurnakruflhNB555qfLJbVoq+ZW62OzeA2vV9AtFUCYtAhEWD6Tz+BS7GwAzqpXeP3+yvJ/o4J29X97T8HlW8UN1DNjif4eThhiw3y4NhceUk32Mom4TeB0TE0lVMDXYk4xyFlL+EkdkhBxSMnL0/0qTPJ/ex31UBYX8j5Zo027ZEYlZ5OrEvVZs6aRJpga5/p+B1pYSmjgb+Z0iRzm7WsXgr+60cPXwStXZgK8ZeJ8FNKp5Yg3jJ0rhol6CsMHiEctbiA3imv+Ka6p34Ub6gb9m6bvd/uUQK2F7tHtaZWjbdsoKXb/9i97L0qlPAbiP3VQbuj7cQd4e4ZNAVCQnnsVI3tVQa32LWoQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f6F5NdcowZADOjAKNRvk5H9RpozUOosLXXLBby+KzyiXLbwxwVGGwpXygQL386g975/jpGJT5GDLGYEcu9QZN26p5HNczINuS99gzpvibEhHuK6J16w29eUTpzlNU8suD1qw3hq4lj84Uf9SIxHLDJlOJD2IS8nD3RDpQ1BOk7eiAyaPLpeKRvBkHtwhIfsn89QYFoMzGk0XiRtD3/+3yowOycJ8sRg+qtOI2gbNlpq+rEVoXd1gdcjrR4gCG4l50xBipmwsl0X6f+RM7lvJ24lgwtBVO5sfJWe7GvuRffV4p46gL04JRow7z13+4xZa6aE0fFo4hPtXkywJVv+TUyvAKcFpK9DNQNKrMWQD4JQvUdGXQwApdMv32B6jylRmsvecU76cQhGL2dEOeVcfHeWj33MtdnNh9bsVi1hhqdnXm83AAAIxdi3y249rKUhz
X-Exchange-RoutingPolicyChecked:
	RZnMMhVJyrZsEp+i4soyjIiy3VXXIDGo1plCbYjysXyJ2FN2gJbwBbflYWkKUWxR3XbG1S24KaOF6N+pVDWr3hbn3bZByOijZ/poiMqpwIsbN8gchHMFitsX30+GAXTsEliBHI0QxqF9/1QDcQr94s/pITRF2aawHM5zT7OJAZHhzEvpB7zm5cBvf6V3UiytK9a/Y9YsqjKt/jRCydWnKAywm2uK45dCs3uRl6yacNOFluqMp0jX50XNnt01BmsjXKENk8CVG/8cq6ANOMRmT2K3UDorfTmbT8UL1/RaGRBaor8lyzq8PaZiWZb65s1TU0UFPBUMNFtsVxJmZ77irQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:48.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e64c0bf-1f85-4a84-1587-08dee0d2e2f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4660
X-Proofpoint-ORIG-GUID: bCDU_TeJhMMkK_yuZlec-vUGhnX_10oY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX7Qd7kNz9qb6W
 rVxN/El7bnMNj47sod92Pt+500Fgii+tUdTvvRzj7JQmiBiFwbabeP9z4tspBHmuCg4m6vp0ufV
 vCK82qneevrHPamrgE7VFjxaG2PnHoo=
X-Proofpoint-GUID: bCDU_TeJhMMkK_yuZlec-vUGhnX_10oY
X-Authority-Analysis: v=2.4 cv=S7npBosP c=1 sm=1 tr=0 ts=6a54cd9b cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=H13oN-B1_iK1ym_BCaoA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfXy/S7mgJgtwO/
 HsHs427EP64NMc+cbM9spej4iBIEDZLTyr1pQhtcMENT0yEvAP8s7aurn7C8DswUwXtR3tYktMD
 nQXSpcKuozvrQIHJb46YKHrXgSlPJg9LIlxvPJ2mJpaJqfTre8GgQPRhuHvv47irr7flE1o1/b1
 aSODX6zbKhFSw/+f300wAW0lQqyhEhqeZ1NObLax4NGQCNOWSqFPdsX4sm15sA1O2lZG8BkMKMl
 XjUiN8QfBSkzEQYHjGtYsiPpJu/spOOZmW3Ux9tjlusOeh4hQqCI02U2kxTwLvTOQ+sQfajH+BY
 /ocTvSJR2bDv38Uo6RUQS6CKledh4MfbBuqrZoj5Ss2RNDhQgZ8AMJOsAFODOK1Tvvx+rF+ClmM
 ls02Upsm2hTZeho8WVrjWLdPU2TZtihakFAlcKV3izmEDGn3q2028mUifi1cvefwaV7/Q2p+l+d
 sa5qLKpiqEE0/NeCEbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E SK.

CSI2RX connectivity on AM68-SK and AM69-SK is the same as that of J721E-SK,
hence the same overlay can be reused.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add missing bus-type property in csi2_phy0 endpoint for cdns_csi2rx0 (sashiko)
- Fix minor DTS styling and whitespace inconsistencies in port definitions (sashiko)
- Remove unused gpio.h header (sashiko)

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 190 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 893cdd31209a..804f041ba408 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
@@ -308,8 +309,12 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
@@ -324,6 +329,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -399,7 +406,9 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am68-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
+	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
@@ -407,6 +416,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..d9c2f83e80b6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E SK,
+ * AM68 SK and AM69 SK.
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/?srsltid=AfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1nPluxX
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
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
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX*/
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg       = <0x36>;
+		clocks = <&clk_fusion_25M_fixed>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX*/
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
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
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <800000000>;
+
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
+				bus-type = <4>; /* CSI2 DPHY */
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

