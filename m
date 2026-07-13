Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D53E8351
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942595; cv=fail; b=dUOAegijxeTzYSwKPMT8LIouedD9RlowRlj6bNz8S21dz6AyK84y+gdvfMEC6maM1u4pRpP+sDvcO+Mj6ev9gW45jJTMOluCfUPabaWjycSUDmygBPf3Cr1JS1WwmS6XNrOTiawTh0H2ASs1tamcAhNoXlTqr0dcYhpdop497YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942595; c=relaxed/simple;
	bh=Lr5VkeGGhpFgohqlp03OwVYi+s1bqn/p3OTvlcM7U44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G0mhnPZdcs/E+NuOVgqWOsfXpequn6y4E/XebFMsnXjM2VIf4Rll/5N+/wVD4nrigROzC2XjH2jlcpUzVkUJOOgLdxkMCWl/lpwbyXpBt2aOeLY6L4eYWR3Tt4inzaeBswpS7l3dJxqAjULLR0sdSHeXxocDARtG68rk/0pnKJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cT9cvlee; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VXul5pLX; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cT9cvlee";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VXul5pLX"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66DBCANp3408066;
	Mon, 13 Jul 2026 06:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim
	4o=; b=cT9cvleeJ5PP5qWyyLgg04jYYtPvKa8h5XTzjAtjh0EqG5nnBd0XmJFTr
	HsFgy/cW0OHPpWVgsW9gkT6X8/vHIaM8ayOhz37tKIoIp5x6y9oZX9Z4V8Y0HfM4
	0xX2/yE7rIWupSpU2kDy0HOUBIAqeoozs+vId0u6YQIXuHk1FUz1SZRMHbHX9543
	Qfci5Czjo9uD4Eh2xeS9mWHFDMjJJu5ugxeC23wtJwbQVNbxIqu9xpcdtDx9xpzF
	q8sYCF15hWUhC6DOJhjwr3rA6k/eGy3AGMrl/glUVJDic0zflHmlH+OyS8Q6Q6J4
	n1vWPNMn7tFP3rksXHRB+dCefSLeA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fcxxeg39m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:36:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTQdrL/XRR4uingdQ+S47KVhrjpKJP9Zxio916gdsGWNpHtj+zlYCFR7ikkPlnL3+Pyisgp88teuBngc2XAg3qyQTCWJER71RQ+ABaI17hVenAvzt6KnE2IvN5wgutijujluDiO3lzb4MN1UUJftg2nEbO6V8bWwk6xdr8a74CbKkctZfHBBNo2Jg9hs8bsPQ0gSf79QlAl8NgquvtADZR6020hDditLpudaXw8Wgdh+yn01p0LqYkKDhMReyfQpQb7ZNxopT6fkOALSZ1kmgI3gdeoH91WmcCsCKySMGPJpQIGr9X6s4g56G5mKVAWbbpcbGN3NCLUPHG14uvoiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim4o=;
 b=BCP+0I3VNyfHlmAMTz04BZKsxejTkD+UCAEEkFMEXEAcMEmtV1RDB0GxuSxeUeNwmyF2YLoBWDNkDYQjiE2H3jV8BFeAcYZCKjdbiRLCXnUESb7K1Z6qt28JLunc3Kpwe5czkYThOl7l4oVjmj4lngR+wOqDkFt2BRJ6FrE4mTuEPPMNmQQfXDPhihai0/aW3dn6xREnc9KAJjRnAYFTjFr0OsSwVRIG8AcgI/u6DyCNaJWrHGBv74iLBV2Gy17dX2iY9blTVG50NNBH5Yg6voNTrWbkJOTw7RRXzkzZ9y7OSdGdicmWS9TOm+HkEOpkRxbjQulDFBIGlkJd4ghu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIm3LNQwQWk6bAvWMJ15mvPztHrOc7cGBtFHw8yim4o=;
 b=VXul5pLXapXyZw3XBslNfuG9dVSXLIkIfXPJm8DMTYKZ6km5+PBADFnYf1kpAvWLWMbuxE2h5W55LjLWgUxYuFmVCbzBrQm0Z+dmVWaDcD2axCIVabGy6Gs4LhY8EtcFyx6DgfCnq4Vj80DniLvMEIkL1oXxQyG/KSxhQmDIgdM=
Received: from SJ0PR13CA0146.namprd13.prod.outlook.com (2603:10b6:a03:2c6::31)
 by SJ2PR10MB7705.namprd10.prod.outlook.com (2603:10b6:a03:57b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:35:17 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::9f) by SJ0PR13CA0146.outlook.office365.com
 (2603:10b6:a03:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 11:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Mon, 13 Jul 2026 11:35:16 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:16 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:35:15 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQD1471098;
	Mon, 13 Jul 2026 06:35:09 -0500
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
Subject: [PATCH v2 05/18] arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
Date: Mon, 13 Jul 2026 17:04:10 +0530
Message-ID: <20260713113423.2310443-6-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|SJ2PR10MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 52549541-40bb-432a-1c02-08dee0d2cfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xkrqZrN6EBk2w1DL4rbaPA79DGiD0EtjyIE2rcooidJFI3V7aGJz2WvO1iTEKQOoPEwYOP4tnvglAk+tJWHiUIDsfjLsjsH3IIjeDFdeqmBUFcaMBRVltDGuPALKkRrfcg0mwVFWhuJy3yt3ECYum2Z1TJCyUWdEAO6xnIRy/JK0IOmKab1z9gwlU9oYAIjIy+h7hnU08Fa2PNvJ4+rZUo1rHu8WJcK9xmeZEGTr//9GNSoepGg+sFX7h9Y76B5ApAfxiPkd5GZiCeDs7LxFFU3IB+x8jF89oKZC4BfRWkb+p+NyzeqJWQzx+aeafYsM/2UzTb31TCnISZQxU/naZ8aguSVAWrW5cXqq7w8txRHtURw+8JeQwaBm4jgw+ZVUcYZD43ObRpUyOfrdeorZNu4gWifEwHvswlrIhMROMp1ms7khLINF6DE5PlWMFAlVg2ox09gsWSa1bgSGri2NiIIq/YSLI6Du0itw7D54MmGBoIL9uVfH1nxQh5T1v8iDKzmAqF5kwzw3L7dxcIsPnMHFfEVYUBbgozreViy0/V+k9ZlieAIf12me5LwT+REzYaFprI2ZB2Yrd461IIM8JeUyAWNgE+7WgQ6NdyBckPTR9zF21MkJigBv0XNsn1lhMky/WJO3EAhoxbbAoylU7Z9JLSilgUWkQqiaZXk5RJu+xAphK2VtLQ/liOKD2wT7yVR0l708LxCelMJ5TCbdsQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LskuIEcYzNzZDP5QxqN2jUjUv9Nxcdy8zhXjbbn8D4UkteXU63X3iYRbrs4FJxi8fLXQQc5MZCUn6QRRm65JsOzvkrSfHvYR8ysErguA97MJ9nuBHmg86R1EexkezeSfEcHjfPkG2Yo213oNgRBaheRlrpRFwXtGBC2jo9pJ6cL2jVibwTxX0SFhhP5/Bd1zA0PSx4pPH9bnrOfpZtSRYkXr6/Eqz6bZBmhWEERMudDCoia+JJ45UIUqWJ2BW2LAr2LvfTyPRys6/7VoquUqnqYcC29ZonbXbL2Tk312dh4fQiz3bjubKsmGTEFz5UuoccenKoqI3W0r5ovm7CdLN4omBeLVuBFIoLrXCdGA0TWn42SpmlMauWesTb9yAz1sC3cU3ydEH3tvpO3iqWtshBTONoUMZtOykwMkQIZrOjfVY7FdvK3tz50um0KLgPux
X-Exchange-RoutingPolicyChecked:
	gNOjrV94pQqU+eRw5noW7MYSkF/hYP61mwhY7mVqOpljdqAJFiHQj8ZRZ71zuHdz2FGNSB5E1oForomJqRftKH/RISc2yGNgx+0mhJ6XwZL6Wf5ggg5CPUF0qYe20Lgv3NvvQ/sk+xzW2OJPBzDpaLPofgkvzTGWj1uZ+30dYcnvWYbYSRhQefP1E8Qop8Zpzsczi2VbWXwHYJrsphIFgTDdcsvjMgvnObNE/WhoQpMeRKcuJhetp9xeOX95nf++n8C6e6lq57yG6EbjL2cKWVqJoTkqNDMvqyLUNmWZAVZWDCXchidjLtBj51U584fXxOLGL7Su1AszeXLvYdo1ag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:16.4967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52549541-40bb-432a-1c02-08dee0d2cfbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7705
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX/M6frnYfHg9C
 rR0rh1fZUEc3q2B/GlwArX3xMRQyy482a+S+p9qEb2HqJ2NxOTI3zdSuaAAlTqg6PzEvOj6OfLT
 31lveq+hUclKeKwlSpcQzlma0DkoUt+1aOCdJoF9p5YWt5t4psdUVvFCQwdLsypc7mbYrvFpqSc
 vCG8u0qWRNTHSkxrhuZm5JN+URj4MZQcSiom4NT1O6nv2qt3CNKHTgOFKeh/ohzf1UbYEqj3v7Y
 BK0TLNFAZAe4s8I8o7BKsLPpG9Izhbyp5+JHTJYciqx5NQJA4uRIiRlFBAJoseuwzl2m7Q9h0v4
 p4UbtvUChdcdhul1W/1Cn5rFSztdEo2rOXchlo4Jffh4DcSckDwewGTC/+n/3OntMYfgOQmgN9/
 B8sGuOQqoNgOSM7KKDJMBK+8gv+5+4EmrRdMchqsr1fX13mkhBvTnZZNS/75FWWiJ38XHZmpIe0
 0/UIM/peO80xlowbl3A==
X-Proofpoint-GUID: dA55WekqkbLe1VP2kHar4sMycCEmIOSf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfXwct/04B9x9mO
 P8cTFaDWuQCtvyD/NFdpZFPHeHC3AJLtpT/wx3pWiBm4Mc9fadEqPokcM2P0PCJMMPGNNn/CVWh
 jbm332MXCPAeq77GQtD7Np6q1WxtmTY=
X-Proofpoint-ORIG-GUID: dA55WekqkbLe1VP2kHar4sMycCEmIOSf
X-Authority-Analysis: v=2.4 cv=Frk1OWrq c=1 sm=1 tr=0 ts=6a54cdb7 cx=c_pps
 a=huIvVN+S9WGU6koxVvae6w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=E-roaWRQ3u-TegewmaQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts,
Add additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..ecb537b96fca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1053,8 +1053,10 @@ ti_csi2rx0: ticsi2rx@30102000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5000 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5000 0>, <&main_bcdma_csi 0 0x5001 0>,
+		       <&main_bcdma_csi 0 0x5002 0>, <&main_bcdma_csi 0 0x5003 0>,
+		       <&main_bcdma_csi 0 0x5004 0>, <&main_bcdma_csi 0 0x5005 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5";
 		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

