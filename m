Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210047D938
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984800; cv=fail; b=kOpUeZ5pME3MV6Tlf5hIrHKw8DHmuRtEoPFD2wb3upMOpzmTzEAYtfcllXOamN1IJ6fL9k+oanPQTrKSu97GML95uKpgVzIB+w8oD657jChvYPqRVSW8iVhSj2sQlJcDtVmetJ2t5Bt2k2BHeGlHWYmnKVsh1sF/FrMv30+HW6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984800; c=relaxed/simple;
	bh=9MtCSoOdcl+Vc1Qy3+G26PpKFDxGJW39pH09ggJvPhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/SrclvSh8uE6Fzgf2uKgKXECBaww+QT7UAjZvS3y6a+1DBE9JRqyC3XNvgB+XMr0zZQMpRqb6XLmmS3mTk4UG7DqLn7sK7yTkFcQA6lbKUzjkzvSW4Y87C42KOZbQu4VHpffvuN8U+qaH5cBtITgWs3cRs8RUDxkG3lX8o6970=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OX2aDKNF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aMgZGWcZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OX2aDKNF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aMgZGWcZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6626wYpH659053;
	Thu, 2 Jul 2026 04:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OLtcbw6Kli3Fh58S1gOJEVp9lLgnZWGQnXmGP99AJ
	JM=; b=OX2aDKNF3Fw4Vxp/XZquO4lhN1x3UKBgyTGhHx546z9VPINgusUMXGW3M
	D0G1iCiRMTshxO+/YOE28f7S+BG0BdFsQrnvsn1Y3S0s538o4zhi2bFix/6DTi8B
	c2g392v7xnaMxc+X7NkPBvs5ARqy5NJ3dvOy5SaV3DaH7BTZyL0w/LwXo+Kle+xf
	GpuibYOtKd8FDxPUBMPAfyfWGbwrJKBA/x/rQjOsO79h0i7eSDQv7MxVDYs3Ehz5
	2y86e6WmKmJmPQbYJr932z4tyLqhOmHooIKwVXPRkinIh9zeXzkMhoCaFIaad64b
	gz+EYB6/Fx0E/4/Q7xc5iKGAhQ1Yg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240y87x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:33:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJmpAIsjVMHw5fokMBPtqOppq+HpHXX5Zc3FKywSFjNWrL+l7GW3ERvAWx7gUbOSanToq6XGuDnY58t35txENXTEjaobuHvTawoQs/h/XKFOrXOHQqKnTSockV77Y6ZCLqxLX7sW9is8jvQizq1mJc9IKH+mM0EbU/DZTcA1G5LTrYVdNOqFfoKyM44LoAxWQrHMll1+qhlR1NLtHwJEW9udGN/OE1+Xs8QcT88yZPoQFObP6Ya8SCAQT9m0REiOCKMwvPv4AZp2/RYNPLgRDAmcbc1dSrDaklJGxdZG3dtYQlDORpwH0mUpFPOTa8kz+wmaMDLBCHAOttpOspb8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLtcbw6Kli3Fh58S1gOJEVp9lLgnZWGQnXmGP99AJJM=;
 b=Biu6vUI1V4yjx98vS6Mq08CYWo/j1FIS3F++7DLYOfE81ZGWcR2EHNlSgBba8WKjVIpGtflf+SaNXAH0bjvkQteydkk1X1AnTs200hSPfikdG1L4P8fxewX0ZT9jDosDJM4xB+yiJnORMwr7mIO5/81ZFtDIXZE9pQMTyx8+D5BAdAmH5tItp4pEM8D0cR+JPgdSrdnz7Zc2wupoM2AG1HAJ/LP0oUr8N3aJZM9B0od/pY0ZfWC36cc4tFSmLHiEy9PFnKg26pI/axdCWowhRgI1iTfVvbiTlJquLUIruW8E/Hyr59BmF+EdRkeZ+RE452sfYEK9hCoQj0kgrb/D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLtcbw6Kli3Fh58S1gOJEVp9lLgnZWGQnXmGP99AJJM=;
 b=aMgZGWcZrzGnrf4gv1ByaGHtxXC/I/w/YUnIJCo3gYzZXtieI9SyzF0IAygI0ObUKjKpAiqbXNbBxR76LVNqwyf+72WZpR2WCiXTQlyNyVTOrC4KCyhlW/OVVlNq+ZE2AIin3ODO0P8mPGkCjzCT0KJDxEoYVVlNOuCue3u/Ay8=
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by PH7PR10MB7766.namprd10.prod.outlook.com (2603:10b6:510:30c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:33:05 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::77) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 09:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:33:03 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:31 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:32:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:32:31 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYax3611021;
	Thu, 2 Jul 2026 04:32:24 -0500
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
Subject: [PATCH 06/18] arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
Date: Thu, 2 Jul 2026 15:01:11 +0530
Message-ID: <20260702093123.1048575-7-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|PH7PR10MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af9d943-1400-4d88-ebf3-08ded81cea79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|7416014|376014|1800799024|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0dd3OPJCdMKW7RKrWz3WCS2tslN2XbMDc8PLqPV421jTI8MsvemVZJIz2j7o7cr42oHIhPl6e/aXq2yBzNSH9MwjiAcVHdMWLJ2CWUB4WuYXJYTT2o5Kr14V4kD1uir+PppLovKcPR7vNk4vulzZ1hX3KviAluQGq3pIpwn2Y3n0h09A85BM2QtMboyNg8ZP1RaUX7ieE2obBB4ltsz3uAQwfn6emAs1uBsfIK59BIm/nTac5J7yqo9sVn2fbcf7PyUQbsndIYyBf9tb51m6hx/k6vGn1kxv65VykJirfcB3ZpwOwVusHp5ix7ePP/ERWVoyJE3a9gIylZQ1O88QGEJNazCehBMjONupOWr5cH4A4W+SqOsE5AGwNg29YBV52J67nC4lrUPvmRQxhwY/cAIUHdFbnIvN2ii3NzDJ5lCEWzVJvrX1/ASt0jJmNkAF0lxRLvhTdQjbqOFw4WH4phy5pR4O7KSnwpPY7UsNuM2h7lw+tAUjnRbpqfBdu50UyM1WHMcn1sKapVZJ3P1WK0YMi0uJkEbae33EhOkq6744Ssy2UdnQGspjNX9CUZWHlZuXodvizhFO1zDcHZMmZCMAEQAYFqrW7zjMRPygfZk37ArnJECFWeAKuHEchpqCA4WLYFxAzYfYFvVhJkOX0ErWIaL6c8mf9X4758Ubol560QozXPyy+lj9lKDXqqJNZ+ZQt29D8IpnoEU27H2OQQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(7416014)(376014)(1800799024)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FtTsVzbHIS/UB8z6P92kYcoMZYM366GOf06MZnGdcQnsiMqjCirqGKU2SuEVA1iztUk9bzry/2/zAYHaEkxgcv05d02nm9zcxWLEbXHZhz3iY6slKpWupSRzgMCpZ5Id3OHAtC+kuQAQHE8S6la/MMLpS0+CHH7v0DbnfdjCOQs5vg2XEThZlL6shEulAMpEdtMIlisDjM/zzGxH305+w82hlVcp3NW+ne64Z42xymY+0v5DFLigQjCQPnc6Y/Up/ScGQYaDWsk63WYF3h0V5WchnF0uMbY6vnNqsIEti3b8NFNIRj5NP1qRJs4r5nH6gDbX9j5L/2EbLrGXfIlkQ7PKPlaQXhpA0bUizKwml1vg2qwDSiYKPFGVSEz+YTPdg1v83lFM9jFzHcSHiWBA+PmA2DAAUB39dZ6/DVyKYdMVA1dMaaKFZUsE4KQ7RqjL
X-Exchange-RoutingPolicyChecked:
	jEzaHPRFljcxmrzF3HtA4LJW2vur+kkhJPH/5CZz/M9OYmHA7oGsnWmY8NReAfBb7UFK37vxJ97s5k0ejK1XBCr5dQVKU7QKDG4dXNmI6GIF24WiriLmpB9EbA3EogOiFfTmfuw6tm/6im8oWyHSeX+ZugUnsz82Mm2NuPfwmFIYOAlCY6n+YGZJ+mtQL7DOm74DmzUtC4KhX2oqF1EdHIIUNYMzAwTCji9qgvNG8AvMYcIrqPJPLmQbODYi45FP+XdDGS8mF/mvEZT6hNiVA3ArnA/ICRLjlsH0dgfpdGLJGxWP71xtdWrvCBaegK+uWN4UF05FNiCy7/QJ0wl9yQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:33:03.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af9d943-1400-4d88-ebf3-08ded81cea79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7766
X-Proofpoint-GUID: yah7Mx1Ke4AitqhzcaFNrnYR-tczg-CS
X-Proofpoint-ORIG-GUID: yah7Mx1Ke4AitqhzcaFNrnYR-tczg-CS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7D9l7/ooKOk6
 SUCDS3vmQ64XYgd+sKmccmeqNMxgmpeVEVa3uZ5/nomwp/Mx1uLgxdG4x+bc9hkfPPq8GVIGZuy
 NE+9jX2yUDgrfkD1xxnSZMrfrWw5qCQ=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a463054 cx=c_pps
 a=auv0RDqIM0MEGdyBMEg3Kw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=hgJp_EOl-7JfuhX-_g8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2qXrq30yzk5/
 BAA5+4rZzyiSwO+UcsJ4yuU5sehnPSA+VeOTGlQCIuuoLkhU6cox9MNjGDAO2qtCDIi5NLcCJiy
 GIi2JFggrDT2w+3cACU3CPX0TyN3WnJmmGghfNYZCBSlqyOYCfy5/L2bpzP5k39HvdNy9/q6Ui/
 mu1yyXT/0iwYNS51W5t/C0bc/BzqzXhmE6Iyzbg6UOzOLALdh2wzay5Sm3ay0QOxJZF9Fgfub5+
 DUCPA2mT2eb6tnMoga/lREAcSGdvwHHq0MslbV4kPvs8W46lMeojGq/cZKN73CrHuBCnhOpv0C7
 mBc1S9Z7KqQHPC0vAMb4oNRNYG3B4OhKTJNU4ks64juNDrFxJsbYweqm+/QHl4MHQPgAM0Ar99J
 a3HoyFr6dN63v0PGdwdclwfGprDA7LeVUzR5RQVIcVmkegHO4dYP5PniZkxrA0l/CLZMOc+AHB9
 DBOOZeu+GzfgapvNIWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index d1dbf1e24fbf..98d2090c4c9c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -173,8 +173,9 @@ ti_csi2rx1: ticsi2rx@30122000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5100 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5100 0>, <&main_bcdma_csi 0 0x5101 0>,
+		       <&main_bcdma_csi 0 0x5102 0>, <&main_bcdma_csi 0 0x5103 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 247 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -230,8 +231,9 @@ ti_csi2rx2: ticsi2rx@30142000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		power-domains = <&k3_pds 248 TI_SCI_PD_EXCLUSIVE>;
-		dmas = <&main_bcdma_csi 0 0x5200 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5200 0>, <&main_bcdma_csi 0 0x5201 0>,
+		       <&main_bcdma_csi 0 0x5202 0>, <&main_bcdma_csi 0 0x5203 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		status = "disabled";
 
 		cdns_csi2rx2: csi-bridge@30141000 {
@@ -285,8 +287,9 @@ ti_csi2rx3: ticsi2rx@30162000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5300 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5300 0>, <&main_bcdma_csi 0 0x5301 0>,
+		       <&main_bcdma_csi 0 0x5302 0>, <&main_bcdma_csi 0 0x5303 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

