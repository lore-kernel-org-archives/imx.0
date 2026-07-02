Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60710481232
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984883; cv=fail; b=nxhIFTuWF3vARMpLb/kO6caR3259M35zYB7B7gHtTHgYNMboQzpqtcCqloYk+I+xkTsTrrPb2cLGFTk4THrZaII89Z+dOXXNOUBK3fjFRAzvZPK4tHZ1t2E/byMtHoiUaLmhFEsqiUQOwRj4g/sC3Ec4a4GYa0h5c6j6iuVU/88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984883; c=relaxed/simple;
	bh=tXeTmUia1ewujl3qIf4fxrhKLkjlJDgHb8+KAR/DD2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFnYU4TAPI0HcNd7zhILiZAAheoi01+dOep8QTblcoP0q+OIzWlSaasW2NMpd5fya1SHWDjz2egCSd++sGW7b7mICSBlcgvGI7Z4ionoe/BlscCYEtaZLhfScTRbxNxNqWVUdZbTclYYKZvcirR2GIGKtD0YEUon13MJuOvpwe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ML7KGIG8; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PiIacxty; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ML7KGIG8";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PiIacxty"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66295Ucd2028522;
	Thu, 2 Jul 2026 04:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eR+XAi2joJLvpLpVlKdJZTazy2tSLGQhM7oZonmhL
	vs=; b=ML7KGIG8CiHrm7myZQ8gYhbS3xvQTiRtqhnV38x7t37lPzrFEiZM+I+26
	renujvWWHsOmKK9gYOXEdzRC1pHeVqWxY3sMvMifOfIbFElBrKBpY48QTq07KKZj
	GWN2/HNW6RUTTrR1V+quGDiPMjooSVNNpb+0BF7jqCNe38CSRL76i0o+0nr2TgHw
	rpn7K9lLlcippPzan1BTsJPNDif4DqAP1KwOEJvnyuALVfvdHsqIOuMR262PNHMi
	lyMf8tokaltWWddIcLdPHgzKrYY6Qy+ZHC48VNmTEOkiQCjjcyKWTtG8tW+vVz3x
	FxtmdFc8Y6RpKEcC+MUQ6gHJ+q49A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010045.outbound.protection.outlook.com [52.101.193.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5n23g46k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:34:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4YZPblPj6WXJiIhzEeizzJ3Mam0Ad6y+Jil7txJFcajeOTZucM0vZrmuCjtkP41V4I2Z25EXhE1jn4wv/VEV3+TXQtuOSuZ/VWSh/lfxLp4gNxrV3g5G/vqtfCYi5VY7J2PrqtNjkOoDKZFEQhWHvkJYQ8IInKw6vzBbSemgpCISquSpeKlSa7NrQ06A9AvKhKtgY9QLlymcZWcb6znErzcdW8hyyxWa3Mlad0D8kLxVjY9wWtcZ3IkOdbKhfKpi5mb95VBS5S0jO1UmbbxnS73YxVjn9D0b9HaXT3JTrgmuexJjepJ3d9hOzg0mm4C//0EJ7yVJVpeFOZB76tyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR+XAi2joJLvpLpVlKdJZTazy2tSLGQhM7oZonmhLvs=;
 b=x6MF69LagPE180K8W5T/JKbNyfOyPyCO5w2z3KdbhH43cMbihnxpEUOpQyVwuXyFttjgjRaru8ev3TDyI1jYPWBC8E19ndkS1iT+H3bjuk/JnbehOU99hpRu5lPcq9WxE+Acodq6Kx46am3HPlnzVVPG6ic/LPeMmcwkoX7WMVQHOSarJiQSqlyuaHhmLdt6P+8BpWNtUnWsy5m77pn40uNgqubUsb1jvvG9mpiu8Uv6eiqF+J+DG1spICdPsB7B+U7fJOoUJBmTmDvgg3qFQ7NEfJQvTjWAn7GtdgOa9nOMKwhJtgb6JlFkieYghlTXkIlLhlMflzC9O4J7Cbo3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR+XAi2joJLvpLpVlKdJZTazy2tSLGQhM7oZonmhLvs=;
 b=PiIacxtyH3ewrlem0XD+VyfCGyjw1QVxKn2S3ykHIWhbp+mmaQnKl3f9YJDwVFNKLAJJh0Vzkcz2qYqqqx2QseAgUeQ8b9Jn41BfECHXB9ylOHgAJsnigGJDaK1oUAfE5vocYKUKr2YQGoRQsl8njFBIy6KmcJpMZ+r2jFAat3o=
Received: from BY3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:254::21)
 by BLAPR10MB5123.namprd10.prod.outlook.com (2603:10b6:208:333::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:34:30 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::81) by BY3PR05CA0016.outlook.office365.com
 (2603:10b6:a03:254::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 09:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:34:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:34:08 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:34:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:34:08 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYbB3611021;
	Thu, 2 Jul 2026 04:34:01 -0500
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
Subject: [PATCH 18/18] arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953 serializer
Date: Thu, 2 Jul 2026 15:01:23 +0530
Message-ID: <20260702093123.1048575-19-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|BLAPR10MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ed571d-a187-450e-b1d6-08ded81d1d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fF1wYt3uFFEAHiiguy8XMLysH58aYa+4FtxHMrIDyJ2DInHYK1bnfyd+WEK11NAtYY2A56PV3w/vsyCNJ0kZ8V5NkNEiPw7bLjNb5+2mtGlMuYnf/oqcVx8qBMcKK2bpvKhM7rs4Gn+b56AjJMQtDuPYTR0ynivQapDFwAzVFaLqiODMcXRUXDX6V7hCQGcSmNPyEvFDzAqe3O63Z5MgkR+QcRicTbHO1O3ODxPz2kPwZToBpsMkTsnBlhOMAJ1Nf6OXciP+h7bmaswrnnw7w6t08R9lNfv+1CDIUPGL6f41c/vpskkBDTcUqFRRH0wF9o/ZhWqfVtp1E/WGdiwEItbmx8MBaZb36GXUzYcFQNZdMPTtcvlycCLQKy3+Y02AOSh7jYmA4VFu6sdoexYlVQ2tn0/gk18rCJTcaUNV7UMC8VjL4Tj+8Sanhb7CmkYYL/IQfFlgTJhoqM9K8uvehlSwwV1xtdF74EUpAEM41wXOnYchB1UOTXh/YzT5eUXTbquXDZ0LWXrleM4S0e1rktxZrQz+b4MbNSpUnV+kzyvM4XQ0Gwkhvc+cz3YmxAV0kDiS6E4YebmY6G+0uLTcQCAGXVml96K9mSyYOctZJ9wXTc0SHsOxw1XE3294fX/b6JP6PVs8HMXbTm2KCk5cg7q+6XS8u6hb2dnF6ExGCoVZKCfjzXfDKVspXvouQnYkSr3JqbN5gE6cpGCeaijz5Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NbNDHLXq18tcSuSntSoZ2S8urz5Jju5UMaogOOmG0/E6ySEpeAP1ZrJa4dFcIDWnfx62oWlOnAOJXEMuKdwi690PLK4kzXCmnkjO4rpHWFM/ko3QFbiwlDEvD1a6OMEWi5P1YI3HTRmzhkEtI4B3pLX3CtQkdknLW8gPTJkULpl3SHLzvaLF0IGtcEDcKzIpQM2BqirhwJ2AbQVUmyqGEexoICIeSV4GIg5xmNSWtNxmtAYtYpw3sTI5WIGzhuY2pePoXlks6BsdDqL3GE7X22eJLzKIxhGUfjH22j2my+uI9+ybRF11zOfTF1CbM0cPgUfYchvBZuJUO69qlmcBOpVjE2A2Zm7mtNHmyx2zuxecc0YppzebuZ9NSbJ+h7GHv5oKlt/4sHTbkZaq/TJPeLRJBmjBsqWPlS63Yngc+nyHRZqw7JqKjz1HR/RUJGwx
X-Exchange-RoutingPolicyChecked:
	Cx7SfaMqSxnj73S67B/8Ouo3Ufm2EZnPmHg2NyqNcZSbx1/BUZVZFv6vCdmGJfZB9p3e/3pZA1rNy/nn98ppaL83oLHLgAuzTMw+F37ws0e1WLTlwzcMfUh+nTnG5LhrA0W6gNafEIFc21+7WgvqLfobpxf6PFLB9wVOja8mklofLHbSOxxJdlZEmqo1h7dzg6den7PZRLWT8fuXSQWcSLYJcXtaoSzHRWEPVF/ryFR9AFAKb7zZ1TZ3cFXLr1UudfZCQ5UHKic1FZjBLNALIcalmZnFC5KFF2O7efCHaG0a7Dic/yGaDDLEsMejk0FYh59NbjbuNFHOI2x13gbE0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:34:28.8359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ed571d-a187-450e-b1d6-08ded81d1d41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5123
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXxVZC6fjMPtc1
 rcztdk5adxGvkpU6r7fX/3+ySGQx0MaPPeZ0XyuZm0vda8ALZUHxXhPeoUyBPXAaJMm62sJmzSr
 fQWDSKCvbrxe7qHtI66Ug6V3/8xiiE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX+VN7uW0/BzAa
 LbLksA0utuGnJYkxpZ7ZgSwZyAjhD5nZy4BywtOwdLk7tErSHzYtDy0Wl8DKPT+AtNdfzSMMBOa
 P3iMBas/nXMyFEg4S2NyzSQZn1pAZBYydBxIbk90jUiJMvlrui+9K90vlT9QppSv/c9nSM0Okr6
 Tz/8b+oaw2E7kf204Qt69syKFCHDIpnx7vU46FxPWsdMmsyIzzcfv1HPqnSrkJ2g5d1LN7QlcJ1
 dfF8kelkznvVLhaZTmqtEYx/zryQBoHEFPhXJaBYBIK6PJm3EE7AtygHuD7SDvQf8zzMsmM3tTn
 e8WlxtTObZmRu2PZRsaAwyIML/eQf4n0obbvk98dn5tVKl50DPUzAK+yOxxO9APzUqP1gjPxd4D
 UAKAKmr+xMxop4R6Gqe8aQLj8Oi/4K6ndLEOpmRsyS76bjn13GGmFq/PxbOsIDBR0rphmYlNnid
 cB/Vt1VWmD4inPe3Yuw==
X-Authority-Analysis: v=2.4 cv=DN+/JSNb c=1 sm=1 tr=0 ts=6a4630a8 cx=c_pps
 a=ksElJwkXcxqN7TVlQt8uAA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9
X-Proofpoint-GUID: y6Gr69vzSyLrPUm6ou1hMUw7rSXo2yP6
X-Proofpoint-ORIG-GUID: y6Gr69vzSyLrPUm6ou1hMUw7rSXo2yP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

Enable building Texas Instruments DS90UB960 deserializer and
DS90UB953 serializer drivers as modules.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 207e213cc45b..bf4703160015 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -914,6 +914,8 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
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

