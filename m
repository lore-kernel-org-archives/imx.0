Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C25211466
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 05:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787723236; cv=fail; b=k6Q/4wwDlYoCRXLeLO5aEpAufpIaXY0QJV/p45iTr2p5oX04BrKrB5ycnuWlmCUROtf/dy9E03eUtX6c9ldsi6iPQFN/b1ID20a05ErlKjXDLUi5WBMKL6JqXxdLyon1ixyOsemF5Mfaw8a5jAC7VPm4kyqi3iXjApMLV8j/e/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787723236; c=relaxed/simple;
	bh=K8NzlSkyBeV3KvM/ZHqmTg8yl7TO1El+ptVWr+w8fbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tn5IaGfdLHKuxkSsZmD+Mjx+LgdMUWTaxi8sn6LOUUUMYqD30rx2kXGyeYoV8iIEMfnOyc+0AL+qsCbOpCkNaqnoO+hSa6q6UjWT5D+QYhCMKx84ercyXk5zhbWUXO8VuAKZyaXw0ac52Q0CA1KiIi92jkUn7CuQZFbWHpznTYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OWMjUp8P; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mBtSD6rd; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OWMjUp8P";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mBtSD6rd"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3JZVV3146996;
	Wed, 26 Aug 2026 00:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Gl3AIZelsdHhR3pdopCeu+FNIMhSeam4N37hJ5jrf
	hA=; b=OWMjUp8P+LzBvWKTCpQzA6kcdTZCGLGV/rakRnUwZ8V6f5UNCDj9oEqPt
	ejtmWKa+BV4vNxI1kEDa9i413PLvCMR27w3f1/nL4Zy9u7J2Q0ISfoQH01xcVF60
	MT6RhsTGJAbC9ArHHDGec+6fzoGpQXFogTKSf98btZ+4woJpKOcy/VQi8SY80Tba
	AZR4qY9t7loz7O0oH5T7EG+g3vVSitPEUmpqPwnFwdy94DsEA2IATFtCgGtqGNlk
	09f+My05heddGmDV3CP9RV7E/mVvSDP09W29WHA5PCiFdJER5r9rpsyacmWGOKoF
	8KcWKY2WDRu6TsdtTUugMqcrilpWw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g9juyj5vc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 00:46:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3AyOaDALV7IAPNBViD5GxK9Hfh9Z9JmwDKxc4HOLhIcKaVP4p/YRzytf4mKnDSVWzkBT5EE8GdgikYwFcw7e8hiwLoTTiyLo5wFPGs65OUB48W8OHh/k7RmxHXbrOSl480evvzj6vi7W8EdVtw4j/C/ZsBPsTsjK9VAVCz2dtpYqQDnZpjNHQM4NekokOJJmNeQg9a/GjfjLyvW6FnWeFczR73TfTsYys0C2bxY7U8YTXGv4yk4FF1bsfZSZInBGaH69QxCvCU8WYyKKZ/8EJMv2Au1TorE5SgLd++9I1wgAGU7yfnaJMDLOOy2ON+ZuHRWgI3OhkvV5JzV9IXaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl3AIZelsdHhR3pdopCeu+FNIMhSeam4N37hJ5jrfhA=;
 b=I42wKzXjgVFGCE2DWYHACnNM+vihyxv7rXb/mAP5wdjVicfrjZ94Hwf+nrrOh9dh39LTsNtudll3vydqOAPMAS9MF5hYelnKcvNjEz7mYj5SY+51CnKI3+HCnySOCxFqTsV+EY4M9Ieua/M7V6U00zQNO8BvRFoFnmc1bS+NnBhlcb7IS0Ogwpn8IEbv2dRZemi3zmuG9U4BYwn4yhMMxpFDMrKIsYBVc9R1y2/iJwxw6C/bV+fzbel7g53RyxyI0UXil/K1r+lqaHtAiSmpe/QGpfHBrZKig+4iUkVnDLOncNIhVvYyWpiJ+D7TXZMyTDTBTpBCeOxNoQVPEmaevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl3AIZelsdHhR3pdopCeu+FNIMhSeam4N37hJ5jrfhA=;
 b=mBtSD6rdXdKMf9fabMjEsaPJEfO6CzHHjf9dH4rjyZOSsDpyUxVQTmMzhJryzkjyDtL4i9fWHGoiZqGgKwNJBBcqcQyU+bAh6MKULvTdTuQInoDpanS6Y/g5JjKhIAXN3Xm3ch9n7mDU1WHZHawsCZrqvuf8Xj7EMB1luy8V970=
Received: from MW4PR04CA0213.namprd04.prod.outlook.com (2603:10b6:303:87::8)
 by PH7PR10MB7087.namprd10.prod.outlook.com (2603:10b6:510:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 05:46:45 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::13) by MW4PR04CA0213.outlook.office365.com
 (2603:10b6:303:87::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 05:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 05:46:44 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 00:46:24 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 00:46:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 00:46:24 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67Q5kHYY3428391;
	Wed, 26 Aug 2026 00:46:18 -0500
Message-ID: <cd6818c3-bbad-4ab4-9a4c-4d9eda0ebc10@ti.com>
Date: Wed, 26 Aug 2026 11:16:16 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add DT support for CSI2RX multi-stream
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
        <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|PH7PR10MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: c67859bf-8d04-40d3-9f32-08df03356941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ndvyd9jua2EyRRQV/FA0qGNHzqU8/4R+DB6OSjiBK8Rc165HDAha4sOVXDLYHvdszuwe0Hm+geF7BeuYBLsHcllFuce9r3173FiFsNefxX+l0O+5D5ERq2kUjRP3UgmvOxFeh0wI4zHqbKz/OinEtwwYg2edC3R1RuoRY1zRcWV1YNoGStRnEXpqydnl7E2L53Fbl1LnQX3UZpN9jEV9ulSdKfJjvZvU2EcXu8Za1CFU8vyYluyFp9IFQkcKNZ4tyIyGB3z7hUnBEoSm5cIKgLEiyTwxmu5K7GAL7pL4/trvLRm+vyB/tp/uKTQ3tsMXQDFTWv36h7IlXEAWaKnBKtd27iO154MdRNALJdezfFvzn1QRute2m+Qzrxcnedem8nvfEzQ4NaAgb4muq5b7ac6fL8Fw2nUST6wK+gF/wcsDrQUEim6h0dcTYB7xAqpD53dUaeUX6+m/KjWuhIOJgUxzoHDvY2m9DQENLBMZU94SnX9ENw0Wgt2FAh35EP2/M7LCuDopqFgTjuudW18F9fpkTKw3V2nCzbb7YI7cpauPN9An9B2enniUo0MAhQ4g8JOSV6uwG77gM3CzCKUCs+MHKD3NgaVJ+Rx7RsXK/Cak215XXJPnxxtQhDD1RWv0inGA/r/9QVaGd7uoq3wzv9K1MO7U99J/29cR9TF9bVLQu4ahOOUlpkOmJe4h0Ms60coZ5j/xXhW01LxeX2V5nw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p6KGL6y6B5s7GqEw1kJl1havgsPD9V1Mzz57TYMT8KER733g40R4dHelVh8c+lUyVUn7U709iDvf7t+QuNP0ttTi8x34Or9T8uiVehA331taAWIRy6ZD/vansXPlIucsKBgNNr+ByMWR9Q93xGaG0J0xwF3V1IcHNMYMYR/IVEDbQEw2tzTPATWf8viyzrnncqgt2gwXcOULj3VLZ0yD4KpXzT5H+RJk17rTrCeCxWkkMhFrObD3hTn03dKaeMeC09KMAeCTimy5k0tAHSYX1pj+apXI60jeH6St257EV7T4R9/B4uVKNptCazgQOjsm4Gi8+drWB3/EgkKuJz4qRXt+xOqOXFJ7WTSFujdYA0QvqI8mKHDF+4uznmmJLqzJ12EpsXTtzI+z5NL9038KdFoyAyB9VTLsFOe9gxpDBfJutXkqUS3teW7FJu659NOh
X-Exchange-RoutingPolicyChecked:
	5TXm6oofmaQW+B6opOOC/X3e0vP/sc3V2nFwgALNqwJj6sYFq1LAdQBA+B3J3b76QfglR7h3K67xBEUxUs3o+KykmTbtHaEdYPKehG/8mI2Jbd2JvnKDsVmyjU92us+bUW61XpsIzvRw7zuExrFFEHQ03Xd4//o8kdQCmBlMQBPlT3aFIY1ZZxPXRm3wgiG7IAK4WdqWpJU2PBdMU7JTcTj3ELWKY0rKTEcoPQ1I3R26F2qfh2gNiYXlZTQNpkOj29SNO0qq0/fZ+wEAUguHDfYarOwfm18M7Ku8PWRPWLbFEH2t91C1XEArx4KLsc46a+hjasNFWSPEfLhyFp+8zQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 05:46:44.2660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c67859bf-8d04-40d3-9f32-08df03356941
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7087
X-Proofpoint-ORIG-GUID: U6TVUCIWxw47uEEnXUa4Dx2VGZgFmBe_
X-Authority-Analysis: v=2.4 cv=XMYAjwhE c=1 sm=1 tr=0 ts=6a8e7dc8 cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=aJAQNMmbZXsmYvqd1TYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0NiBTYWx0ZWRfXwmAihV+C8nqG
 WM0UmqhzLHOZq2yZCXZpPaAt19yisrgjwxkiMYzH2R8G8cWig/+QkOtwqrezZjCjg7VQwK2cYcd
 TisJZMHAv+muMkOCTAIohPhfmmtAo1s=
X-Proofpoint-GUID: U6TVUCIWxw47uEEnXUa4Dx2VGZgFmBe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0NiBTYWx0ZWRfXxJewQjn3HHYk
 I7xxJJG4QFrGLWZieZV98tfIH+6VmootwFI2W9tYgqwDYLvUN4jN4CGCQHqNuN2+PnWIjxGerOE
 JvSV9oVftYYrJmCvzauM5/5jRZXFyHtlmFcey5Ju79DeU9NQrlxL99hc2Ojw+gQw4SkuEYmRYrp
 fYwJy1NP8Fr+Xj5gtVMJW9aQ3Hh1oEfjtrlC1PP5jb+mGjV7rlhGFI52zwklF/axSu056sz2Vjc
 yF5V3ykn2C85jYRShZxFjrBWAw4/cyhohuRzfe2wvt/eVZ2PlkvehaeK+gIjyZTFtmX6h5ILhPK
 nwT4nk7fj+q0n67YLxhkZ9UIqp36qD/UfajoO6TVYfv3c4i1+ikYEd/zirY+Jc+VDmlBemjo6dI
 gUymqBW+z+8LCtsCDOjjivkGo9jYayNg1w0w+q+Jr4X1cJEIfj3CI00zZ7SHDAqPGFh1u+hdMlw
 I3g/zkfoqhLAV5PW7gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260046



On 13/07/26 17:04, Yemike Abhilash Chandra wrote:
> Support for multi-stream in j721e-csi2rx.c driver was merged last cycle[0].
> This series adds the corresponding device tree support.
> 
> Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.
> 
> The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
> channels required for CSI2RX multi-stream capture.
> 
> Multi-stream capture uses a SERDES pair based on the FPD-Link or
> V3Link protocol. The serializer takes the input from a camera sensor
> and converts it to the FPD-Link standard, while the deserializer
> aggregates streams from multiple serializers and sends them over the
> CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
> input from multiple sensors.
> 
> The remaining patches add overlays for various deserializer boards,
> and for the UB953 serializer with the IMX219 sensor. Also enabling
> DS90UB960 deserializer and DS90UB953 serializer drivers in the
> arm64 defconfig.

Hi Abhilash,

Thank you for the series. LGTM !

For the entire series,

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh

> 
> Changelog:
> Changes in v2:
> - Add missing bus-type property in csi2_phy endpoints in overlays (sashiko)
> - Add missing build targets in Makefile for some overlays (sashiko)
> - Fix minor DTS styling and whitespace inconsistencies in port definitions in overlays (sashiko)
> - Remove unused gpio.h header in overlays (sashiko)
> - Don't replacing generic V3Link fusion board DTB targets instead append new build
>    targets for v3link + IMX219 (sashiko) (Patch 17)
> - Add status = "okay" property in port 0 of deserializer ports (sashiko) (patch 17)
> - Add port-specific suffixes to avoid naming collisions (sashiko) (patch 17)
> - Add reason in the commit message on why we want the DS90UB960 deserializer and DS90UB953
>    serializer drivers to be enabled in defconfig (Krzysztof) (Patch 18)
> - Rebase on top of linux-next (20260709)
> 
> Link to v1: https://lore.kernel.org/all/20260702093123.1048575-1-y-abhilashchandra@ti.com/
> 
> Testlogs:
> J721E + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/18b5b81157fa67ab71f711f5b2cdc0a5
> J721S2 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/0b8f3617ce7620961d533edfd7c51be0
> J784S4 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/7791f3b224f6df34824ae418b9bd9963
> AM68 + Fusion application daughter board: https://gist.github.com/Yemike-Abhilash-Chandra/29c1c9793939633926b1db3fe058a629
> 
> J721E + DS90UB954-Q1EVM: http://gist.github.com/Yemike-Abhilash-Chandra/6d2e1f3f0cafd0eec7eb65061ebe221a
> J721S2 + DS90UB954-Q1EVM: https://gist.github.com/Yemike-Abhilash-Chandra/a145ae81e7946cdc1c600cb377d3ad44
> 
> J784S4 + J7EXPA01EVM Fusion2: https://gist.github.com/Yemike-Abhilash-Chandra/8d7f06881d5435bfa5d9bdbfb209bc38
> 
> AM68 + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/2c607145ba80e3554320042b29af9985
> J722S + Arducam V3link: https://gist.github.com/Yemike-Abhilash-Chandra/b1fc2e2e8f15372f1379afe5c23668f5
> 
> (grep for "ds90ub960" for the deserializer logs and "ds90ub953" for the serializer.
>   grep for "running tests" to see the actual test pattern genertaion capture logs from
>   the sensor over the SERDES)
> 
> dtbs_check: make CONFIG_OF_ALL_DTBS=y dtstree=arch/arm64/boot/dts/ti dtbs_check gives no errors
> 
> Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/CSI_MT_DT_V4
> 
> [0]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/
> 
> Jianzhong Xu (1):
>    arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer
> 
> Vaishnav Achath (13):
>    arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
>    arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
>    arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
>    arm64: dts: ti: k3-j784s4-j742s2-main-common: Add multiple channels
>      for CSI2RX DMA
>    arm64: dts: ti: k3-am62p-j722s: Add multiple channels for CSI2RX DMA
>    arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
>    arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter
>      board
>    arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter
>      board
>    arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application
>      daughter board
>    arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application
>      daughter board
>    arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
>    arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link
>      fusion
>    arm64: dts: ti: k3-j784s4-evm: Add overlay for J7EXPA01EVM Fusion2
> 
> Yemike Abhilash Chandra (4):
>    arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
>    arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
>    arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
>    arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953
>      serializer
> 
>   arch/arm64/boot/dts/ti/Makefile               |  83 +++++
>   .../dts/ti/k3-am62p-j722s-common-main.dtsi    |   6 +-
>   .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 200 ++++++++++++
>   .../boot/dts/ti/k3-j721e-evm-fusion.dtso      | 190 +++++++++++
>   .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso |  92 ++++++
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  24 +-
>   .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 190 +++++++++++
>   .../boot/dts/ti/k3-j721s2-evm-fusion.dtso     | 190 +++++++++++
>   .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      |  92 ++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  22 +-
>   .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 196 ++++++++++++
>   .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 299 ++++++++++++++++++
>   .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 213 +++++++++++++
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |  15 +-
>   .../ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso   | 282 +++++++++++++++++
>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  21 +-
>   .../boot/dts/ti/k3-v3link-imx219-0-0.dtso     | 128 ++++++++
>   arch/arm64/configs/defconfig                  |   2 +
>   18 files changed, 2217 insertions(+), 28 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-fpdlink-iv-fusion.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
> 

