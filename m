Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258E2340DA6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942517; cv=fail; b=lu1QWNFposUcBUckuQozfd69osdM18io8gZejblhc+yZODf5Aw+lr6v9N6WgeNGzcqawH5BjBGl9w9RphLJ3Ri5wemP/4d7q4w8yoOvl6uQmkv5kFQ0jw76xuArDtl68RbWiEXITAvJ2Ej4FpulXTP+AWm/q5llbru4tkYPBIZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942517; c=relaxed/simple;
	bh=AefNe7MwtNjJ5M4HLm5nE6xgIroADhk+zLYMmkGyIrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgGtx+rgxXXOgO6Jp+XoURvX3fXwx90ytT0+jrSajivk6u6+Ah0YL+Za/4a/VlXTiIhfg9d52VWzQA68BX8IqMCcspktVT/s3C5u13imnQyqsJuXQiYE+x/LYgcEfTVMv6V4QDgkcZSPa6b6DMxveNvw4jTzWkEnm9+pW2FYoYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fDLW1X/Z; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MvmeaTPp; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fDLW1X/Z";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MvmeaTPp"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9Mf633167618;
	Mon, 13 Jul 2026 06:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8Ece
	sI=; b=fDLW1X/ZAroatKg3xAc+NJkCE0VLxiAb8JPGhyjHVXhJsbkUa+wM+lJS+
	/8ckhjW5Jpv1cBDlfmOWKhHbqyW2T7Z16EGRqaBpCGS31Q6JocNaIWB5+IBH/Sco
	soIo4JIdxU2zM9Nd1knK1bpmtTAgFqKMA1lFnC8r8mybkiquoT8//2U4wpNOfkK9
	ZAhgflUuAC6WViCNQXOUJUpxsfuCXcumPJXI2tsvYyAebx45eaZnWxLAvXjjf77+
	go8XvmfkxsHW14B8nsYhkuzkbgdDfzbi/DfoIvnzCVny8INRgVlX6gRMwlm6FxF4
	OlIv/COFCuhZkxe85hevS5g6e6ETg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcwb60ht5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 06:35:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXWveVni0dCgLY0IV/eufCOIBpJVCP8fTzG1rJx4Q/+jQ0pNT4ScI7bJx11HOoAp2mZx1V7GSlH5ysEzm3TJmIHQFUx+8bFlmZm98PNW0ympUBP/zE/MU2TxiA+jTN1MUHW7302XUT62A8oT6PdkO3nztJ6gvH1c2Inximj0zgH4QYw9M1tJTnW2oGgM+Qo8JJBXLXXQlZObAG0ED2MbIM8AGzq1ZfqCvs1Rd0L3ypdrhKpI70QP4nzKBXCaescUfx2+X9FDLx8A94EizyE99BGtuWNP/eCyJTks8EKFjc7vd/WjdqxVx9IIAbyNmpHuGy3yJ8ZKZHnoDxqk6MCQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8EcesI=;
 b=ZMhdy0K1ByIcN5Lzvm8QulJ+dRgCKl7dyMOdo2peNR3rWlrPaEN543seL4gixJ/ZE9kzqOZYq0ZhVEPy4cfm4HAZ3Ayj0Y/b3SUnA3dm7K5mbxIk8Lu9VYgz86nIkAM9cwKJIOyJiEF92r6jTeblqI2VqwuDqax/2fodG2N1I/TZCJJI+pkES0rxl2h5ysZMlNJaenhIDYXgyUDLi1V+H0vdpKQ1G88z7HwqJKWmVcVLkbDeV2mKFQ27CUxBo+wsfeulhEld54a8t97iIrxptbC2yiorIGJh97r2CwRyjY7501C7G/816yqqrGl8h5hMxO3TUlUdJZvEJwOmrvX5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YdOHSN58WO1B0hifEKfpaI/enmZKdK8l49ui8EcesI=;
 b=MvmeaTPpPPZr8msM7M9AZLANPcfbqzJSsGs1yhIQyFwsWPK3Yfr7Nput8nbI3FCXi7Lru/3SfS23H69nM+0csfgkiTvFaRMDi42uKnw9DCh42egzv5e2CQcV2IVWaNGhmWAKGSdLaj1wJ6qMd+zJgQDS9AKDmYBABJUSqg2TyZs=
Received: from SJ0PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:2c0::35)
 by LV8PR10MB7991.namprd10.prod.outlook.com (2603:10b6:408:1f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:35:02 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8b) by SJ0PR13CA0030.outlook.office365.com
 (2603:10b6:a03:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 11:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 11:35:00 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:35:00 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 06:34:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 06:34:59 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DBYSQB1471098;
	Mon, 13 Jul 2026 06:34:52 -0500
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
Subject: [PATCH v2 03/18] arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
Date: Mon, 13 Jul 2026 17:04:08 +0530
Message-ID: <20260713113423.2310443-4-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|LV8PR10MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fd738e-7f0b-4d93-c8c0-08dee0d2c659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	i53MmMj7MK6ul9ug2qrx8Fso0HotQCP3iEsI4sWL8e3OdEgR1R3ETNrnMyEHkoLEugopU3GfJaMfWoFXfdbrHyzX7XMEZO2pYAbUlTGjk0QNmpsFOJgUiMzcCZ1FSeAhHZxrrylitx0CweMG85KY9oZhHlK0l/ju8qJAJeE2FNxMMQqbOaGGxAcGgygegO+S2WjFHbLnRILv20a3cKI4SoHMTk0IAcFlVdaEEaUUfdMpMbAOe4wjnBFVt1mD6FyOK0TD0F0J17Fio39qteiYScSHKI8SJBEETwKya/b6XThkOLTTK3Ja+wol5ClvptK2kHjp5M6LqRyqMcE63kZguN3oXCC3jC6COZ2z2pL4K+z7NhS9rvVGy/S2uPXXQ1N4em7dDBRWXrbuY1G0VWsLcUcSAfJhimdwxc/tuxMSKlkyaEnyOM5tnduMmgYYfHRnEZdntFtGpfFUozFPucPR5WsbiwfIkDvh6M+6n6bNPogAk2vfdYOQHqr0tt4sbwd2I/xarRzDlFFLrCAIk5rDUxYytiigyfZHjHctvS4Y1b46nAeYNDFL5xg0Z3cG+jLFN8nGBlawcM0cRaz40xMiZAa850KK0FFp7rfeeGemOKU3vyq9Knp3mQp/MNvrRhMIpN+TU7mbXeerm+Dr8EeBu+/M/ky5evbFxAwZ8ws71nsWpZXqGHOV0vN/rPVifF7YsL827ONsBU9gDXqYJSc3YA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nveeLQwc2DjCDtqdQ79D/oRHUEs4UNzt1x8egHLAoeqG1mDwDNjLYKdgclM9/71ofvghPvfnvRm4ahLfCX/NJVv5VFl+gdWss/Zux5vUDpB7wBUbAXB1dECBfB3+nvYVq6aEOGNg+Tp7QRgPH3lzR/S8vIIKJtEEz5QHn+SkeyKEqJG/EE2EmANcpsIHWutHvrNjgqy3MJV4k1LFthseq/RaYJzw8Ds1+wraoR7VYFi8UsJRHCnFFePYs7FqwRKm+IUHUIY6uMktIjZDeTgOW2w3JR3paqL16MBOKcLS1RJvg3YwgP0daJPuw6D82tUqQpNAPtV8FD1wF76vQFYl4ABeXLWTIn3BmiI3hqK+xlZeCeNg/NBmvYvy/xH8l1BrzH1koxBXtgESmemm7CBc2BXJsiWIE5WNV3coq5aCQpnzjWjeHKoBeo4AvaRsPQ2m
X-Exchange-RoutingPolicyChecked:
	EtHZ0+7wtUL1IMaArj/u5lRjTLTFDGrpU2jGrvPcqyc0rqOW9l/f2QgeiEOs0/+ZdK9QSi1ypxzo5Z4Dwrz+cgiarslV9LuN66qW6iwoh53HNjCmnXdw8e9xy3dXAXkVaM/yApG3YwH/Mn8fpdYhorBel3QnakgCWKdP9fJPWyxjRmiEDx6a4pKfjw2fh4hJcO4CPuh5Ywzr0VbLY4LKXWvOOKtfPARsP7S+sbFIztyJ3TmudQi9EOszbJCFTXPOn8m5Mj/p7Y5lljPiGylO4FtEAKBkpd/lJbs5g7ZIKmNMXFz0M2jucGoMyo74BepaTTnsk7CU3GkdssH8Ge+9JQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:35:00.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fd738e-7f0b-4d93-c8c0-08dee0d2c659
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7991
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX+1wQATAITqG7
 /LTtSRVHvWLhOm+X7Yhq8q6Q7ZlR6Koa5Kz7QY4figpWnKVk5GhG7RGK+Mf0a8+J23m/ObFO0gN
 2iO1PhvRfL2wqwGmmSH3xnmKAd722Lk=
X-Authority-Analysis: v=2.4 cv=HObz0Itv c=1 sm=1 tr=0 ts=6a54cd69 cx=c_pps
 a=VTZ9QiboGVM1ljQMw9N7kA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=hgJp_EOl-7JfuhX-_g8A:9
X-Proofpoint-ORIG-GUID: oT2JywLCxmR18ivTD1GLsHf54hR6ECEF
X-Proofpoint-GUID: oT2JywLCxmR18ivTD1GLsHf54hR6ECEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX/V2hC416Yqm2
 vJ4ZsiDoGGUupVjWrZYTX/EU/dl2nAkDSnEPxc4O0jPp+kzk45tr4aHWa42wck+5/LC4081ljuA
 ZD0O8nxvhdozGSxSqsU0J+LzHKzdlUX2NcvnAWjSF+uVOfyjxh+mGs9a10juaSCHnqegmOBi49k
 ZZ1pNxOHxlWtY+W7URebP3PUzO7/cIMCXuH20VpRbwbZPVSsNhbzT4ZQ8Tncq0HkeyRuPlT4RBk
 +/iLofLVXlxoV+YzR8ERst/0he3aHlIeEEo+7ghM7+nQDffc6bbYNvGM1WWNtKx3PJBa26wrIPX
 XOI9gDSVhaxaAGsyL/8NzZjq/3JOOQlVjaPacPQncXDIIqfFXFOpSu0A90I8uRWPcF42GsjiIz/
 RI6iz94aASUSgbO59jTe32ckQH93W0FWtrshoAIin6AbAjmJJsoU9JsUraI2YTGsR/w61jCUPTK
 10pJShlh0YpFgjgYeiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 5cac119e4292..f4b8713873b1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1239,8 +1239,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -1295,8 +1298,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

