Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CC47CC83
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984798; cv=fail; b=YZXxuTlJ98DHp57T+OB28BsKhkpzu3Dd5u0Sr+XR2uOMIplv2t7CaFHVjEjiw04GFHYfdk/8Ybrma7OpY7anrw6JsWKNRXUNJu7ESXxfwSLQRxXZavcEUdHR9+wUafoiSTOLDb//3t7N/EtWg4FqokzFDppYuzgKWDPtg6XnkWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984798; c=relaxed/simple;
	bh=FgMtAYt9XVIYRLE9XRIi6D32+5FkJywxN14Cq13xT6E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f+EYH3X1J3Jy1iCB4bGAV53HmswpB3M4q/4mh0gIVNO8aIzUUv00Q6C/KHKoQjOJJ/IjJbzyodhAi7tKUcS/kf0YBtmtogL/0R9Whwq6qoI8HWezLj1nCKs4JRY2TmNeS6eHIbweziTTJQav3PO5Zzh0uXWdqQ5VtsUeWkSvFQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fJfLKQoZ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PcVS6mbl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fJfLKQoZ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PcVS6mbl"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66295SFI2028490;
	Thu, 2 Jul 2026 04:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ZA+wKGk8eq/WK
	fztjU1vW0AJTR0+GnTL+Ttip+UWaqM=; b=fJfLKQoZ5nToawV53AxNCbv30Gsbk
	5n20rAIE7z17zfKXQvX9FNNv4pjnKyYWScBM2NOytEAnpau2O9LifZHT5VghGd4I
	xjOorfZ3QbC0GgGqscU6zDNw+pw9YTcglOdL4eTZHyLlRYpAZkQcLVRaj7KValuR
	ci601is38wmG64zYSV1Ey+vCCjeQV5lGtJkETyIIPWmjPbjJnj+HCweJcgPwXKm2
	mQuMgWZQ3VISF6rWJWDd/rpIXboziAgce0WPWUDDbUkfQ3kbxF/VlXZu2edwp33K
	i9quQZLL+NgZv8Q2xjn5Tr53diqkb62ba5jP8IiPRNFl8yvjNfLqwNRuQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5n23g3v4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 04:32:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP7Mh0jkw9YtVDMsddY+vsvdx4hlR81YZB9SniSgeK0siN0LhaiDTHco79F/fLW3h3OUv5GGSjwnVTbyKV5gQzPef0HHG12Cod9a7GeclbSzIfOno/WZRn/M8nAf51Z5Sl6OKU91LgxYHeGwIv2Lq+dWFlIIto8DqKsTNmqxTtTiFNGB1sS7f/xHdpvk0b3MRLHZyKx8mbwTRvtxN6wYVkg/WCzWGlYv+0pgMSJfUmhMQGAtN6USM3QnQaoneDoenKIp9fF2q11SbaumJybdMMrPLGYGkcf7IP1OkOnu4CiCOU03w4SSVNURRyL3JHx2CRB+D6ctzRtyKIOIxLNSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA+wKGk8eq/WKfztjU1vW0AJTR0+GnTL+Ttip+UWaqM=;
 b=jVWEzjezVI6TCsbczRIQuS20gsF4TcD0uUOYCUXEzj/E3co2X98CNqkE+JKDvvHNIYJ2Mhxpitxfw9tC6RojlojB5CZHgrzn++vxEApSzTJR4AHVb0kJRR03jVPLtM3/fD13678pxrjljpm8nRcVhsc2VmwfTLhrGns7EaH091JrG2hBXq5xfBInemXtbZ1D2CbJeE9d3xlInv/dzkcHcZleUwUByTUzL9IEnqNCG4CoidN0fbz21Vedm9bd6Mjkp4YUtodCOrpzjBO8seXRmyVGOaQGyr/QOhJ2+NVd/rxVYKML7ilcaFgM21dkfA6vQ92NXqvGOYd0/JJhkzEv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA+wKGk8eq/WKfztjU1vW0AJTR0+GnTL+Ttip+UWaqM=;
 b=PcVS6mblZ61thezcsxLwwHTw//vC7VaP2oGubBxCYxisigtEuK/vCXFMwsLYIv3XLntS2QB9C/9K5QVrwhG3tWwoTn6srdjaFbiEs+3nRWLgXKdaD/01sQaCtr+0qpYErqD+vWlgsVJ6+pfLhVtHKgJYAkbjihTHdfcfUEUdQgQ=
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by CY8PR10MB6636.namprd10.prod.outlook.com (2603:10b6:930:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:32:45 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::23) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Thu, 2
 Jul 2026 09:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 09:32:43 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:42 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 04:31:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 04:31:42 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6629VYar3611021;
	Thu, 2 Jul 2026 04:31:35 -0500
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
Subject: [PATCH 00/18] Add DT support for CSI2RX multi-stream
Date: Thu, 2 Jul 2026 15:01:05 +0530
Message-ID: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|CY8PR10MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dfab5d-8c68-4d50-cf3b-08ded81cdea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|3023799007|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	LlSDuPKK6XKYBdeBNg+vdk+0qMTDzwYSAj5HjZIkhYAYljG24YedmUfHOmbk5Q4IuMFIYjkqoeb1ATYoku7ckRev9F2XMD6NfdUQzW9URQvMCi4s8S3B9Dz8yZb1f8H8f9OKPw6LOh3ODTrunKlb57LKYY1cUot3Y9NhWZ3fPwm1pxnLnsvHcsXYhcetFbg745qB+2hMGDBW+YLJNl4CxrGKj8BG8cwUi1L9lyPkQ3emmSvk4KcuCj0030HpQtzQ4Ox17SBP72ZfvAvRwdqd6gaMTOEG7cMhqdFr3DdBUcDy65eWDFTJqnsW1cPigcJuosCxaiFBQESBSF9IQNfb4iVKZn5iryXrcU8m7yV05CmtXU8iTVwwdImmcfOaoPFC9HOTkbxzTp4XNgpjM/vwOENqMF1LgAGx3FYpdYo7/sng90OoD/GooiFhp/CYsKubirlXmC6xL0J+QXxfN8jBh2Ek95DhEgbphT7yviqmE/WsxZGx0vRNTk8BY+NGqDo4i5b/mVOt/np5BKouBnuXyeOg/Lq/BckT0niwgGR3HXnFMjmvgyllFOvJkwe8E9vAsMm2AUgiPBTU7/s23u4eL5avsetRWeRohB25GI2qSuwHgNqdNfHtifX8DrxSN8dMp0UVdwph06GpwHjpCZUteSSVqSMATUfnaDC5/rJTKMaTFIJIru+guy1DAt5VhFhB1VRjvoezR2ZPeGgwlOlFRQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(3023799007)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l+lTnqLbBxsP7kc758+esbSRtLs4tJVdJmTaWKurprDZCWKroXvr6Ne/B3w5b6c+kspQpJm8esXIKKovhMD2yPKa8wke3S56V7VFwcEjBByXHa39DsiauePjVQklxdxgm8bFSRzdc/p1f1UAIB67KNLe2PUUv2DQ1uW2PYKSUzW0PxUfWYqf5rw0123NnYq0S0atiRSlIbUSv+NOSp1cDI6N1/9pWP0yiA8roZ8sjIRTOBa2R+XY7IY66fw9TXDSDzrHwoVYvbVjyyuOvB0NKGQxbM7vLhrelpFiQeba8gBIpOnNzYwQYo1Mkk47PowHH30XTk+yDYFht5xg/TWaED6nkMWS0nHmk6WfsaDRwpXLMzG8ptv530x2CUYfBo2eFiuDhbgnxgNTeFACJjf0TunUhraT80l1TiNj6u8TcBa1vRqFWTdzcI6bATEnpJ/l
X-Exchange-RoutingPolicyChecked:
	AxELvMLN8/W+kKirMKAJV83xFEGI8zsDSQtto70d3MmDGZqUJ6V/tFIPum0hwtIFFbKZ/X6cwOczE+BRLChbRTvhbTSFOBI4N4uap7JzqByaeN+LhgvOgOElGAascygx6e79sip0vUkIraxsuqxuA1Y9447cVDzfjBEa+9ozlCO0EpShtnYVDdbhM6PvWh7Mp4hHmXvzOb26L0t5LyLb+VxUC5rPgE5J4ofpUYnb83g+u45W++zwNfUsD5Wpk0Hx2mXgqu64ibX2L1TyO47IwvBEMq3YjRRmrWrc9y5rmgHfkw5HwRJBiLDwzBsTrISEWSzyeBC1oJKWVf7+ZEgkcQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:32:43.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dfab5d-8c68-4d50-cf3b-08ded81cdea3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6636
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX00Tzzpg6iUYw
 6qzO83JtZYl7OGMJybHpiHMZyXo9wk1kh5xo8YO159gFHcLRkqQN3/HnO2Rxiix+oKIK1Q17jnq
 fouFkx8wS0c4mJ2Aupjlm9ms10iEqrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX+QuYOHqKBxqQ
 pOY6VR0n/jkcXAQe+j/lLA3j2oxbrso3CmMHCz2hB1LzhGFdmQnM+zqUG/ESPvcQoD4LkBsnky8
 9gty1E8fWnLfrAit29irf7HH3NsGfKQYG6vjOynLMjP8UNSCvwz9geezjqjsOXvr7itMspaEEJP
 z13c57q5WAvnPNQzpxiwPRQTOkjKnLJmlZIsH5AAIw11OQqGHHwXWIVRu68Td4nXF6LyZfKj6BJ
 RfbuxsHp+ftx6KOA04Pxpodyux7qs+tqHDe+VSXpOfKPZOWiNOjYeHADpacYa1Q1JgPOE02MOl1
 gKHCYs42lHGPpn2AabE5t6CBlnRGZhl/i0SGIPZkGnDczS8tgDjqtliWRU+pGMYJNFSb9/Rxzbi
 Dj0zknATXhSxUOhSJm+B5WSF34y0tDGo2Fb/pwqHjXpYaFxksIKayE8q6N5nX5xhCchnKFPw4iK
 3dyaqY+J3GffGEG9bDw==
X-Authority-Analysis: v=2.4 cv=DN+/JSNb c=1 sm=1 tr=0 ts=6a463042 cx=c_pps
 a=gOINuM4uNKhgYw9Qn2OeKg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=27mufEpmTDPYVq1u7cYA:9
X-Proofpoint-GUID: PnL2Ff1op2v9UxZOQXZv0Zw28VOYVLqM
X-Proofpoint-ORIG-GUID: PnL2Ff1op2v9UxZOQXZv0Zw28VOYVLqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

Driver support for CSI2RX multi-stream was merged last cycle[0]. This
series adds the corresponding device tree support.

Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.

The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
channels required for CSI2RX multi-stream capture.

Multi-stream capture uses a SERDES pair based on the FPD-Link or
V3Link protocol. The serializer takes the input from a camera sensor
and converts it to the FPD-Link standard, while the deserializer
aggregates streams from multiple serializers and sends them over the
CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
input from multiple sensors.

The remaining patches add overlays for various deserializer boards,
and for the UB953 serializer with the IMX219 sensor. Also enabling
DS90UB960 deserializer and DS90UB953 serializer drivers in the
arm64 defconfig.

Testlogs:
J721E + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/341cea78c93a5849a9b318a5fa1ad5b2
J721S2 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/e676bda929ae940f9c85e8dd3d03f644
J784s4s + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/e69f077af78468b9e5dfc20b9bdef374
AM68 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/aa913e3533b227a477d6363c04692474

J721E + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/f1bfaa7f62b185c492a81659100a9c02
J721S2 + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/15dda67fffc542d30bcc3a83dd7d5782

J784s4s + J7EXPA01EVM Fusion2: https://gist.github.com/Yemike-Abhilash-Chandra/22a74bae79c1fc7eb92d158fc1ee81b5

AM68 + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/8188ac234b21406f336032c14c9fa9d4
J722S + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/24d49bd30ba3a499ff7c93fa4d5cc1ad

(grep for "ds90ub960" for the deserializer logs and "ds90ub953" for the serializer.
 grep for "running tests" to see the actual test pattern genertaion capture logs from
 the sensor over the SERDES)

dtbs_check: make CONFIG_OF_ALL_DTBS=y dtstree=arch/arm64/boot/dts/ti dtbs_check gives no errors

Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/CSI_MT_DT_V3

[0]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/

Jianzhong Xu (1):
  arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer

Vaishnav Achath (13):
  arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
  arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels
    for CSI2RX DMA
  arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
  arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter
    board
  arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application
    daughter board
  arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
  arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link
    fusion
  arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2

Yemike Abhilash Chandra (4):
  arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
  arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
  arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
  arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953
    serializer

 arch/arm64/boot/dts/ti/Makefile               |  62 ++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    |   6 +-
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 204 ++++++++++++
 .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 191 +++++++++++
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso |  93 ++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  24 +-
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 191 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 191 +++++++++++
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      |  93 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  22 +-
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 196 ++++++++++++
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 296 ++++++++++++++++++
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 213 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |  15 +-
 .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 281 +++++++++++++++++
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  21 +-
 .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 127 ++++++++
 arch/arm64/configs/defconfig                  |   2 +
 18 files changed, 2200 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso

-- 
2.34.1

