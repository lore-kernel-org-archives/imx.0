Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020130.outbound.protection.outlook.com [52.101.69.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A9C224B12
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.130
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279967; cv=fail; b=I56943ZdHM7PGl2YCECgaayoPzqmHOvioPHkCee+BaI6fJ1+U2qd6AhDtNJzSdjuZNMojTu+2uM7iHP20IrfGblhmSumydn8DuLsxSpYXUu5pXfPAZbCwMOTCrq84TcI5pOPR9zbNXRkSXP6LPiUY3BiaDxw4ZSJiphh5jnkzBQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279967; c=relaxed/simple;
	bh=2TIepFdqE357k/NybRiHPW0dht1AJWUNrxaoZsP2kOc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uhAvZOp7dCpI7z7TdxRcPWbyY2a91/f+79pF8cqGvqTAdpvZFclb5ySnV78tEVspGBy/qlAJnzNwGe8WNNG7/8Zr0GiUi50qMEVKgTPBKMyfH+YVKgzirn6EiYL3ijALnpiSHxVk4DrxDLvEmmeoIaoWEYKLZsHxYAw0faxUCGA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Rv/TykUj; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Rv/TykUj; arc=fail smtp.client-ip=52.101.69.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Rv/TykUj";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Rv/TykUj"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ky32fE+vUWRjtn97adLCAd2QsFZ+ZM0SZ8091kn3CuYVGGfZLFDhArYSWElRHvN1Y0V5omnIpmoey/2NyS/VV/mWLE12R65tkExccrc/xSSkN1GCIlAMDPMEqbK5xcEyQio3Nrw8Kyefpl7wV+UGonemVeWyGlUrZe0zp3l+G6oOqqRw9RhL2C3vOmLJ9An4/6lWGguhem/dtokjEFrlEjcEfblv+2/L+BPNKUuuvbxYKbOu5GerpH4/ypz0h7sHwwraBmn6sAtYQ/v6/5se7Nw7drrWxi4Ta+VzufNc5rJ+aKaQLZ5Vly4HHBg3IMoxh9YoBlYIShJY+HmlwUheJQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=S4pTreHM8atQRAxbimxSvb6Wbss3OH3qKa7TO4X91aI9rbgHgjHnK5FLHdYEeXQJZVzVf2QnFn1ZMPxIWiEOKALbaJdtunPV8CCH6X8QbmJDhNQesSRSOhdFI7evcAbZ8/7v9b2/np+4H/Hzq3yYl0pHqbQQy3lZGgHm8T1fy7T2etDPdSfDZk1Wm703pSynHIAQJANL0NJEAmhqH0X0tHwSIpNvT6fAZgdWFx9g0+vDH+CnFl+UdK8A0CoUShkBYvGxSYU0N7k1UP/juXjN1jqX+MBJOhC+CpEsO9EuvqMg4tAt8A89KvPEjx+g6FqVXbWdDqts2kswNM5zKGzk0A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=Rv/TykUj8vCJBQz+qDeBQg8EPVEj4+eVNcRLiiq4f08SGkfErLVu9qJY1qnsqqeokNjzvc+/eH7L43vj7503CdtlzPIt/NLcOFKluNhALl43ebBR/P+46uC3kK3CCvjms3NVsFtPUvodr5qK+sPEs6rFlMPIJqofKGoof2HKU74=
Received: from DUZPR01CA0197.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::11) by DBBPR04MB7564.eurprd04.prod.outlook.com
 (2603:10a6:10:1f7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:02 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::f5) by DUZPR01CA0197.outlook.office365.com
 (2603:10a6:10:4b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via
 Frontend Transport; Thu, 1 Jan 2026 15:06:02 +0000
Received: from emails-6700196-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-24.eu-west-1.compute.internal [10.20.5.24])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9E520809F9;
	Thu,  1 Jan 2026 15:06:02 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279962; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=ee+6ikUWzndmaV/jsuUORZEcUjnVRqVtJLySAZWL27TJsGWzALmQ/7hwr1eCUVUDDsx1/
 CBCvwUonZuAPArec9wYUQFO2elCMcQmRuWI14E5GJZMBObnwE8DTiMGanWHiIlPmy6E6ERp
 CqZgdNIAmmoEeMhyw9pw41/ArM8/xtk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279962;
 b=e7PtzecfV+s/vCFnX5sRyPDx6pAgpGfe5KwaZC2c0SrYFuta4G1IX4TAbMwDCryyOy0lc
 1zLT9JSHiiseWRxCP8CLef3nsj+VfGErIiVirC9UX+p2RWcVDtkvGP5NI7T2+WIGPxQ+d3S
 9M2TilJGsrNYMYePIYWobizGla3zqCw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1FrGr9NrIc7ss53b8NdTEgiJrkkB1nmyzrP53l3Hk2yUPBdYTK8wR9mnEPcvM6f32h1LbiASbDdb5eMKFYtBo2aX1C6luqI+qBKOIz98Pi6cvsCQ9qg/8rzL7xhB28q5Xtuo4I2/H1Wl23pBAZ0iLUxsN5ZUo2Esn0EjEC4Km5HkMNEy7Ss4fKggNeEaa5WJQIc3HzXqBIPhRtmYOZATggxeLXWpeH7/B8OjkGaQSQnO5Y7gUwaae5Yxm1WzLCZu3IKLqkeitBQtksaZq9SH6bcISa7uxqZq6RGjzIHEPcuvXO6dAPBf4nN2/pauxxcSGlYImGZ5KY3h7XREbJrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=mqc3M+ChGkYPx+gSZymyj+nZJrDo+UzlxBl0x9KRzNV7f897XLLtQxI48S8Y9LKmtrmY5bRHsHyhuNkYnkgGaFrWG5yZB1QPsq8mC85e/OxY+EnfnS86VdcqV0LdcQXjExIS53SUPaTAjSlH/IkK/qGsFgBqeHh/EYvRdZ9w5nFMvzZaiknRQphsKg9vIB0dzIIvcYgJ1+i8UEC3iTx0wERqjnFkaicHuENbpss6l4qPs+/a7KQ4yApmxcZZUBnyTjfS9mIRLC28LggpnzMPMN58PKFmojQ4I6rd23fru3pjJeW7LBr3EfVNjLf3nD4exHOWFeJbYFXx/O1YvdnHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=Rv/TykUj8vCJBQz+qDeBQg8EPVEj4+eVNcRLiiq4f08SGkfErLVu9qJY1qnsqqeokNjzvc+/eH7L43vj7503CdtlzPIt/NLcOFKluNhALl43ebBR/P+46uC3kK3CCvjms3NVsFtPUvodr5qK+sPEs6rFlMPIJqofKGoof2HKU74=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:51 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:51 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:41 +0200
Subject: [PATCH v5 1/7] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-1-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|DU6PEPF0000A7E1:EE_|DBBPR04MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8c679f-3473-4c4c-4c3d-08de494747b8
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OElDeHZsZFplR3lJUm4wMnkwOXNITE1OWWlZeVVuQ0dodmY4cVJubzBGTHc2?=
 =?utf-8?B?MVVvR0xlRXlURUY5RWdXcDNOdjloaVo2WHdISVRBTW9pTnZ2MklGeFd4aTNz?=
 =?utf-8?B?NWVPUHJkN21tQllnVHNTK3h5aXJRcURLc1NLcVNBY0RlZVhUcVdzbEh6NTBC?=
 =?utf-8?B?QkljalJuVktrZTJWOVVTbnhxT1hTQWNSQ2gvMnVZVElHd1VMOTEwbDNWNGJv?=
 =?utf-8?B?cFhPbjZ4QTZOUVhHeVVNS1FZS2lYMlM4aGE0RnBUcGZocllQd2F6NkFrRmtn?=
 =?utf-8?B?VXhiVXM5a0lkbnpFVjAxS0tGMm0yTW1MdVhLNHRvbmdQTVhwNE5YckEzczhH?=
 =?utf-8?B?WVgrZTZhWTVFbGxnWHp3Wk9BNEFmYTVJeTlDUzJiQ2hqSThyTEZDL0hhb3F3?=
 =?utf-8?B?bW9BSlljTE1RdGJnN05JUllpekV6cVNQSlY2ZEg1RXRYRzg5aS9VTTJJcWo5?=
 =?utf-8?B?RnhmT0U4ZnlXRy9NOUt0QnZNYmdMNngrNUhXTGFBcHZNcjdFVWI5OFVIQWsz?=
 =?utf-8?B?czR3WEFjbllaaG05OHNQME0rM016NGNWRXFBUUVuR0dyblkyMC84Qmc1bmJw?=
 =?utf-8?B?d2xJeGpJcklOSXFTOCtTcVdmS2dBTHpiSS9oVk9GT2JJdVNBd3lQekx1WGlt?=
 =?utf-8?B?QTJka3ZERFk4N2VOenZ4MVdoTEo4aTQwaERYdXZBMS9SSFJSdnJuQWF0cnBX?=
 =?utf-8?B?dU42cXB6S081bEt0dEZIcjlhRUxOM0x5WG52bnZ5emMwdXNrQTNpUTVpdHB3?=
 =?utf-8?B?bVlIZDdqa3RkcXkxbkVJeXBLcnlQRmVmcytGZEx3VmVMQXYvRXRWUEo4dXl3?=
 =?utf-8?B?Yk10MDU3NUNRUVM4MGlxSXNVLzhOMGxxSldMRU9pRjVxQ1haLzh4RWVCTzNQ?=
 =?utf-8?B?WE9DWFQrWFpGTE1tVHRWeUlSaFExNzg2UFdMdTU1WWUzcHVFN0szRy9JVnZy?=
 =?utf-8?B?RUp5VFdUNm9BcGo3NjlVdURRNWtFYUFkVXdTTXpJcEI3eFYvWGR1ZU9DSDZB?=
 =?utf-8?B?VTdtNlVSbmo1b3lCZ1l0RUhRM09ERk95aXVnMHBpMGxHOTNFNEpNeUZ2Q2o1?=
 =?utf-8?B?emFsUlhFc3YxdWJKSVVmY0tKWHQ2U3JuTTNmL2cyT2VrL0Vzc2ZZK1VkZjRY?=
 =?utf-8?B?V0hQeHRFUWJ2ejlGQ0VmL1BoRUxkcHJYaVZ6cTV1a0dTNGl0NzZTMG9qZE55?=
 =?utf-8?B?V2FMcTFBM3RwN1oyR3A1WGdkc3Evb3RNNE5DUjhQdmxXNkNTSU5TWWhTZXhs?=
 =?utf-8?B?NHBLY2VlTnV4WGRnNXFBM1hFc3FWeTB3aHhTQjhZelVnWkU0R05XOFpoV2hX?=
 =?utf-8?B?YnhQV1hzVlJSRXZoUDI2MUgwUDZJOWpaRm5CWENwVWcvSWI0QW9wVEdHMzFR?=
 =?utf-8?B?aHNPd0VDNDRFdDlkN2lKODFIaXgrOU5uditxZ0lCTEhFOXFDWktqUTh6NFNG?=
 =?utf-8?B?T2dhZDY1SVZBMmNvRUVNK3dXdU9jeWhNMXM5N2kyang4TTY1MXg5MEhPR3g0?=
 =?utf-8?B?YlMvMTB1aFNsNHBJNFlrWjhtbGRxbGlKbnIwQnlBdXordVRINnA1ZVJ6dU1k?=
 =?utf-8?B?cDBhaXpRblhkcnEza2xaRnFaOUZwRkRIeVVuYWtDbDBhRjg1aG9ZblFZOG1N?=
 =?utf-8?B?TWNQeStPRndiSlgwQlhQdjNWUnJpYTJSRmNxNWJTbnZKT0g2YldDc2xING9a?=
 =?utf-8?B?dllhMkJLRy8wMHVSU2pDZkNwM3oydUZrbXFqL0RWUjFVMExnRnJxa1d3MHFK?=
 =?utf-8?B?ZHg3NnZscDRjeUtJSURWZURCRE9neWY2UmJ1LzdHekZIOEtMWVBSRWxldkdQ?=
 =?utf-8?B?OGdqZDd0WU1QTk9rMmJsbVk4TDdwTGNXWUUvVGJpSUk3RnQ2NENYVHRtbmQz?=
 =?utf-8?B?QUtFL21LUTFLOGFjU3JMcEEzekJlaFowbDVIV21nb3ZST3RKb1g1Zkphc0xu?=
 =?utf-8?B?cWQxOHI4alFyNkcvUzdMblNQRUpzblJOWTMvTWh5disyYkZ2Mm02SmhsTGFw?=
 =?utf-8?B?Vi9kQ3NvY2lzYjl2R01TNzVTcWppTDlvVVF2OHErQmxVTWxWVTUwUFh0ZWpJ?=
 =?utf-8?Q?N6LcGs?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 59251ffd313f4233af17993bb413da90:solidrun,office365_emails,sent,inline:26930c0537ba504e631f24a22efeedcb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4640c7c2-4a9a-4e53-fc3f-08de494740b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3JwK21WTTE2UFBjUnhQZW0rbUUvejBSeGhJOXl5OFNzMGRkTDU1RUJSRGxs?=
 =?utf-8?B?QnI5dXNweWdXWXNmRCs2bUJWOUdqVjllZjd0emlnaEVVbXd6VXFjQW1JNG9w?=
 =?utf-8?B?dVdtYUw2N1VxL3pPRzZlbThCOUlzcFA2bUQrbGhxSVpSZGkrbXFpcCtPNjln?=
 =?utf-8?B?U2FtZXdxWlJxREdlMXVpTlo4TGtodVozUUpHMDJmUlpsNkRmY1pLQW9tb3Zw?=
 =?utf-8?B?OHhQUk1lNVpkdHQydDJ2ZVNhVDdObEtQczBqUmkyRzIyWXpMN2JhMFNaVDcr?=
 =?utf-8?B?OHc0dlJOOENFcjdId2h5eE9kNUppTFQ3NFhCYVE2K20rTWFJaFZwVzZ6alNw?=
 =?utf-8?B?QmY2cFQzdEVZcDRBRHplV2FhTlJraklHc3hSWjlpdW9ibUNqWE5zcXZvelFE?=
 =?utf-8?B?WXltZ1NCaHo3NE1uM0ZhOHBEdGJTQlJwRUN4OVV1akV0QUFuSjdQRWl5WFRF?=
 =?utf-8?B?Mk80VmEwZ1hzSS9IK24yb0laZUhTdGdoQnkvYnJPMXU3aitnZGpFczB1MkZa?=
 =?utf-8?B?dE5BVDdZcEFMaHVQOHNQOUdpOE16aUt4cStFYXlsdEdyWmtDeFlNRzZ5Q0dp?=
 =?utf-8?B?MmRxVVNpMGlIclJqdXFmcyt3dDhlWkRyaEI3UmNlMjlHVW1waVFnMGNuVCtG?=
 =?utf-8?B?a3ZVREJ2V1ZtR3VhdkxhY0NTSEhUOENRWjNjOWNHSUttQ0IrK3ZwNmhSc0RH?=
 =?utf-8?B?UmFXTW9NU0FkVnFlQkxCSmtKTExpK3FPbVJuUTk4SFVuOUpibFp1SjRQV0Ra?=
 =?utf-8?B?TXEyQmhKUytKK01xRHNXUHNkVWJqOGRGVHc2OHovQm52OFYwdTlnWUVRbGEv?=
 =?utf-8?B?dElCejhJN0xuRWUyalVDSTZ6YkRaakthTmlWbWZDMWJaVXBOZkU5UXFZeWx4?=
 =?utf-8?B?WDFaNkt3N3ZWNktQdnJJZExwc0R1Ti8wMnNYOGtyVmVMdWtwWE9GRTduOHNY?=
 =?utf-8?B?c3hIWVAzQkp2cUt0ampqRmJVcDRiMXJzVC9XTFk3SlRuSlVxbUwvdEtwc0ln?=
 =?utf-8?B?WWlOYmpjSHFiK2RwaWlzVk03emE2RVNBVm1ya0RUajlwYTNjOGJvN0tYYy9E?=
 =?utf-8?B?Y01GaWNmUGhUREVDamJjMXhERmJNVW1rVmJxV1ZYbnBmTnFEZG8zMy84aExn?=
 =?utf-8?B?ZCtrcER0UWhxSm1YYUdYYnV5TXc4NU5Hby8wdmsyUWppQVYvKzJ2dFV2TG1m?=
 =?utf-8?B?bmtRMmJ6U0F2bHYwWU9KM2t0RDBNNUxvUFhnSFBCM2toQm5ncksyQSszekpH?=
 =?utf-8?B?bS81bDhRZzVPd2lyUGcxaFNPVlRQTkxoR011ZkVqeG1UMkkvT2w3NWJ2VDJN?=
 =?utf-8?B?VnZNTjdRTzBrZ0NmSGJJb2xqeEZoZ2VzZktCTE0rNjE5dHBEaS8rdkFMN0xn?=
 =?utf-8?B?eTQ1eHBqQ3NhQzRqdEtRWHlIeUVReTV1WU44NmJLcG9wVTRaWG9sMno1TzBR?=
 =?utf-8?B?NVpFdTN5NldUNFo0Wkp2UXJPZm9nQUNNdHo4STJia0Z0RXhRWWJXanppNU1a?=
 =?utf-8?B?QmxzNVkyTUJXT0IzRWtmSGplNzJyUGt4c1E1UlRpTWR0aGU1YVRBeHY2NDhU?=
 =?utf-8?B?Qzh5Nk9Yb2F0eHY5U1AyeWpzMFBIaERRZ0dUdkoyZE5WZW9ZTm0yWGJEYUFk?=
 =?utf-8?B?cjh1Zm9lNXByWWJPRmhFeGlBamRXaEVYcWtLUVJlV05rcFZBcUgxQ0lYKzQv?=
 =?utf-8?B?UTdxTzFjL3ZBUWJtRlp6MUh4VkMvc3NOR3VxeWJIaSsrRTV3ejYxd3VoNXZT?=
 =?utf-8?B?eTkyQzFYVVRUVUJ1azRTM2VpUXNCbzJ5YnUwcDE0eTJVaU5MUklLN0VQemdm?=
 =?utf-8?B?NDN4VVVSY0tSaWJQWFFMWkhhc3JTc09ld0tuY2t4M1Z6TWp0bmpoeG50RzhO?=
 =?utf-8?B?Y3hrcUdveUZyWmU2K3ZrTUQzSUJITXB4bTJmOWg2aXFsWnpld05kVXd3eU5k?=
 =?utf-8?B?cE5DYWlUSkxwWHlYMzBDazUyMkU2c1E2eHJpU1VJZTlseDdSMWpUTTc1T3pX?=
 =?utf-8?B?dGdLVDRjNGliUzh5RUNXWDVrWDZFbTFMdFVPZm1QUHhqeGNKVzdPZG1hL2c4?=
 =?utf-8?B?VS9TWjFYSHB4TVZQUTl0dXRISEhkaU9oaTJvQkliWTFlSDgwLzRBcVFXRlUr?=
 =?utf-8?Q?r42I=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:02.7517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8c679f-3473-4c4c-4c3d-08de494747b8
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7564

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..97144a52d5a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1208,6 +1216,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.43.0


