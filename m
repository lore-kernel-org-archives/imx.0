Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE373E7BB6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942648; cv=fail; b=m5Fo7KDc+DuHugtNhxJZ6hL3t/XIm4y1xjr1N97xJcs9pmJXWrOGQ912RTPjwXBn5xbEfrrkan1FkbtxHpFBkAoLQR3gSNl45UBAtCIVZGownqO0A0fM2RRhqYNUorrDDKugCiOgB/g0NmV/dhWtZwCAoV+hWkPadLzaKsAJ8iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942648; c=relaxed/simple;
	bh=aIo0rLiLYspT0nE/Wc9FVGWY0iFssvsn3L4IyiUBfIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0jHxKC/H0Ys4213ZzANgb/XeDLf0Pkk7Kbi4oZaHyneN/6Hht5IzEL6iIPKBUi95K6pTtg2ZRdL86TbBewECR/Fa4se0IHO3mt67gEhBxm9jizAuyFTd8Pioa+aHMnxmHRobPcxbL0FVuiro7B2ZdNP172tijI7HyxoQixm1Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JZbxkRc0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ab7eUc6p; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JZbxkRc0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ab7eUc6p"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBBwQf3407734;
	Mon, 13 Jul 2026 06:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3s8AwGYO9GpodV9m9aNfdmm0xwyLWSXE9KjPi4qgG
	Cc=; b=JZbxkRc0t20p5XB3IS5sYp5a3F366NvaEBs3IUwB8RMtlDPpjKiSiCRX9
	ftTdfvFyCV5xVD+RhJ9178a2X8P85smPFXTaRQhCgZLKxrooXpOFAm7mZfdriJru
	lQ2lxWfMhKEma/vSXCbmXyPV7dTTJIUHPa/hvC5vuJtLTNH4l8q75wBrITHLSxVl
	luJxhdncEZMWF0sJCWSt8scsT4w0cvFwzNikvPcw8TZ398NQ9H3ENOuFOIOn0h8v
	/EBYdrq+hR9E+sB29qs7WFNuXsxjITs0+ViSMdStbMz/nqp9uKeCOeCpzfi0QFAi
	yN2aK9QxOZM8Bohr72YIgrYVy+X6w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fcxxeg3g4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:37:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcTJMr66K0IvBFglym4wK76jjB9PE0cCMJwbqE461S06SicrGjx4apS+FmtI7F05gauns0bclt5/PHC6lVeBeglZ0l/kh18nlb7ZI2JaJOgmJgQZTAkHcy/Zi2Oaxc+xbtQqs6mL/RvDSXS4QT4bMau03UzBJxjP0w/jhDEtLmktETtgEaUSHGD4JQ8PCreMblbuNt1Wr7qjWrPQqQgtRpA+nAspVWMNe2de5/U2/dpy3UpReeTlnxQhvQ1Z4lkc24IFEELv+QAzJLNvMR6xTEvhuAkaitSb0V4o8yeTxqbMjooKlcYiy81MmyQwi1Cjd9ebS2WoznpNZJwZfIkPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s8AwGYO9GpodV9m9aNfdmm0xwyLWSXE9KjPi4qgGCc=;
 b=psDvcHmiEwfye86cAuLfGcQwHbi6w7bB15QvCX/HlSAomA19G2IwDt1KJPw8CQU5OZWLPpcSrKOuZzKsiA0wnPmBKN+A/HorjBhozEfGh4ueEDqcrgIWsKo+lE9E85jU1t3HZWrEaiJW0g7IaawGE3C8RlOihcgtm1qbynOoYJuUIaDqWUvIA5vtqi8zk2ynMzIj8pJ4Oi5xvYXuh7O0EZfxqep/wIAZihohU2COdPsnF4AHSAYic0+w9H4O2g9bGrUKS+LMmkPz9jR97OkNI8Z7HGpe5fajD3LvJHFIaBqwMoZRK2Z0QmXCpnIV7INLuxR7msaCJY6N3m3xvTwXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s8AwGYO9GpodV9m9aNfdmm0xwyLWSXE9KjPi4qgGCc=;
 b=ab7eUc6pXE3HpDFTURT5IUjIoDXvKoja3SVmJOUBy5dWIRLL2iiSH8D/GUNqlrpgaL17z+oVXV8ZiffgwPTa1Kl8nNptLwZIns/UpiPGBZjfdyMO43qKl/cTXtpGuh+Pu1cQpzg83m96NPfSTKffAEObFtpL7xT+N4fx5Hypl6E=
Received: from MN2PR20CA0062.namprd20.prod.outlook.com (2603:10b6:208:235::31)
 by SA2PR10MB4634.namprd10.prod.outlook.com (2603:10b6:806:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:37:10 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::8f) by MN2PR20CA0062.outlook.office365.com
 (2603:10b6:208:235::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 11:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:37:08 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:37:04 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:37:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:37:04 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQQ1471098;
	Mon, 13 Jul 2026 06:36:57 -0500
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
Subject: [PATCH v2 18/18] arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953 serializer
Date: Mon, 13 Jul 2026 17:04:23 +0530
Message-ID: <20260713113423.2310443-19-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|SA2PR10MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d560032-06f5-4568-8a05-08dee0d31287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	Ebtt1mA0fCUy3rBBCzwfHYWiOouGhafBbcnS5tEBUpUJ4aaW6m+kDpaHIS+kGfzCZ2oeTjZMN9wwhp+nw1E7WFPiwZ8a6rljEKDAzrwJAk/a+/ACOnmcgxiJzdZtLfK+mSAOv0FwAuyikHR3IX2OAB3hjYh61jxG2NXz7ebO0IK2nSju1no+ckXM72nnML7ND2Xrb/C/Vl5vFx7aZiezNlHvjUdiFQxv4GGr25dOoBIi0pFLkR/e3dPWEKBxkM8PDdWUw9cbmKPmgsP3tdTF0rnb1fwhO47bxS5dQb74VpG7RXA0L+ih5BTqRhXBCNF/wzvT3xXabpM/EhXbtUwMF5e+W+Zzjhep6fNesctcWCyP9ISTN+0TYJbXOoyMMydW2gOhk3zffTZAw/yl9JBjt5UwZCzFfzj5yl0u1PkcvozPT0/LlAKSw9P0VZeMMSJynOUa74Y2i96MRGTAQfYTfP0CzS6oT85r/a8mgnSKaq20MqDM2W7NnC9tOZ8tCPaycsw1p2VZ8w6cTZwdGEPzjCiiN7Bucr30zOiNlmLvUvr+DW5tIW39ebMiuMcWTEyovQmmF7ZcwM0Sy+awUBUwy9bkkSUF4n3aYcIchGDQPFNernCoqxPgH9mGR78RZmP5X0akiZc5E/V2IydoE1jAhYFZMJkmch0ORJnDquVpfk8U+eRIuO9C3j7qfHLTGxf6FJIM9k60lCvVx4uYvZo7lw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rw7EeMhz30Sq7/K9/4sAFIb/B0hNydwFO96k7H8QZx5Zl3Px+tnEjK6HlmmMB4lvaydlwZf4JqbQ3X1/VyoP+C35/bC+8M0abeIdq0Ln5jEeDooiyBaFpUuzahFM1HfInFM6o30dyYUK2LXEWRsatBDcPl3Bs55DiZOiWTKbLvo72Ma1aAdzuT8eYCyx1VZUG3US6TJN4Iv5thntxp6ueTDw27spDLlFmS30bvnOaM+qM7sFubfuhoGoaoMHJAif1Z+BE3MTRhp5eGvN4laQud1n2unZMo8vOwri/VsFL86pNdW18EyTAJ/YpFPUca0pPRg10Yh+LidZLxHrSKjynhyIPvBQkQy747ruwwlyfX6sjISdvROvnCQvGFm6M7UvFh30K/zr0FjKeR207ieobLi+6qvMzSY2uXOhiwnbBKPGnYRErUYRqm9vtHapA3Cg
X-Exchange-RoutingPolicyChecked:
	nAKxPGo7q9au8aqF4dsK4nqjAgItkHZlAN3CLhrwq/gtQTPWSAWnwIArI0Omr58fjJsHR3VSa7l5pDUCN68XZgmgELokTH6qyAc5X3BMnXwVeE6+u/Aw8KLdd4ZruUON4/g6TvKaJEhF8RU3jtoianfkW3rOMQJKGtRx3YJn2/YnM3ee2E46T+QUX9lfo1owphCIWKe/l5E9peRHJ/vUWmcOcK4WBzZqR6bToLMj71bmrIcyIW5iaTBKT0eNZwaZAmKVXNqaSZChRyxqWa/CgMb0y3vLRWXklMq6IAiBVFwptgLK5zn3ue1qWLhl7ImAS5/HynrCel35eUT7MrJP/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:37:08.5610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d560032-06f5-4568-8a05-08dee0d31287
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX2/JbM/07/Mpc
 cmDg4WsxGT9SeahVUS+dYObGrnVRN0WeGowoYqJZu/+qhEO6T4GMGU5+fyblGg62n7KKEml6M7j
 gZ+yC02dC8RiSSnjL7pybWKcbnzDpdJawE0X0nbiO9gyoe8p9Ot2ApvRivgYqR2q83jlp5I2xNN
 dy16dDe1HK/Y8M/6w0RQWXicC9aqT9hUI6mRbDsCw3N9cX7FmC0GClfNQ+kHnIPV3TqZkH9j5YI
 iRSuHNJhjRoZULufrI9btSkoivejcn2l1r+9oQ3nOSmIM/wxGawicpsrapHmml6iEIhiXlK5sYi
 QiNXAdUhdLbrr59D88W1uZ0pn+fIHsPWysOUJpDNo3v9r+XJfEGLr1pK6yX/0X/woo2QNISS6HO
 1hgW7akwCZtcHKjQJULAPHD7LXMTpOymN87czlv/elg/SdZ/tkvizOOxv7+x9mMfwcU+H8nKkjC
 URudq3zscLnZhnkll+A==
X-Proofpoint-GUID: M7PbYHhf58ZcuM3qhjUsxArMC5d7qler
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX63u7ojIzPg0U
 lPP9NHBxy4EqrgVirJf+zGaipVrWpBHXFulPf2qZSPzjpAJtHS57IkTv80QGJSKyMksezzzY6Zx
 CrNYU+XTbAULBLHHh7Y4Ab9JVUkwK3A=
X-Proofpoint-ORIG-GUID: M7PbYHhf58ZcuM3qhjUsxArMC5d7qler
X-Authority-Analysis: v=2.4 cv=Frk1OWrq c=1 sm=1 tr=0 ts=6a54cde8 cx=c_pps
 a=78/F3YNzMekUCeQDO2i9lQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

The DS90UB960 deserializer and DS90UB953 serialzer facilite capturing
through multiple camera sensors on J7x and AM6x platforms. Some of the
supported platforms in upstream are J784S4-EVM[1], J722S-EVM[2], etc.

Hence enable building Texas Instruments DS90UB960 deserializer and
DS90UB953 serializer drivers as modules.

[1]: https://www.ti.com/lit/zip/sprr458
[2]: https://www.ti.com/lit/zip/sprr495

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Add reason in the commit message on why we want the DS90UB960 deserializer and DS90UB953
  serializer drivers to be enabled in defconfig (Krzysztof)

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6f633d4dfc64..efe76f2bfe9b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -917,6 +917,8 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DS90UB960=m
+CONFIG_VIDEO_DS90UB953=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
-- 
2.34.1

