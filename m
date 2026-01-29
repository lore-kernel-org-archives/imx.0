Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023100.outbound.protection.outlook.com [52.101.83.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D133BBB8
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.100
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684337; cv=fail; b=e/GR2xPJoghosJoYEyWhhXGvQOHEQA/xNqiF8DGs2uXDIYgMb75jMSai72Gbh5tvxWjvIuvMMlkzUZqCnuSQ5Nfci1J4IvshmD7o07mkdX1aYJDuwCqVRF6OsOC28e9lrA+BNI+ls/n1VQGpHOiySUjX7tAw6btT5eYeAdbAY+A=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684337; c=relaxed/simple;
	bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H7JLuap89WypXkLf1197M9ttwqha7uFtdL3uLAk18jlM4Pj7YA/dIhSiNHXVH9cvLNgW8zVtyyqpbk20tACo5G2gwSc9RU3EtANBl5wO5m3TRHIKMu6kyL/ZXwDCaGFhLGRcYISCN9PCdgpEPT0sEZFOS551hCzP9o2y+QuCJV0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=qCpnJpLZ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=qCpnJpLZ; arc=fail smtp.client-ip=52.101.83.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qCpnJpLZ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qCpnJpLZ"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Doe+TsRlncmR8ZIe7GMaBjKmOaLxVaTLSWIYHZP7vsXnlSqTi77FEkb0S8F74ez4lOv3LN/bK2ysfkIJ4tWGiokdYuF9sBoWk5i0dJe64OIDPYHvf4tNdMiJC+Jc6p2XvgQZfy/jZM6W7CQRp4JMcxQPP1BuKXEGBB8/16QEarxBddydaWMZwdeNCF0DIyvr5ym8EmjPIIWjjESNsSxcXwLKdIr/hn7Ck21VKmHIzBWuEsHRGAo16y4/j5HmOhlIXEWZgH6APBpAdl6GlnoYnFUGliTd3NX9s95y0m2fPeNW6US1ZtiIvWkthNwlbFtsNdmPDzli+vutX97/srDqGw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
 b=UWdciYjMPKZ0FiZG6hSg55dDxQ5vFa4poswosIl33/T26toBUaqbR43lNAWzLYrvigw/KVnz4jQmMB0EPyRN/vRjXN/BjeREVCPFwFasrvprMWA6S3idQRl0NpKE32epxnLhOnHYyWy7nFTmo/SmmtHeb9O6I8ALb8l7x20Fq+uQqC3St0zO75x6OLY1inCbIgdz6zDR50btTW2dlMFESI+fdkjgIBtBUiWyjZOkPt81nykkpgulrzd9vBKpNKg0FIEROLjZj989sfrNCF8UM+VTzGGIoDwQa6+owodwX3F1kTf9P8ToWgvGHZL7TgTqd79hYB7NI4VTqO2f3nYhHw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
 b=qCpnJpLZpJXehfMHhVXh48N+oit27aMwekx5KfVvoz3yuc1lcnDIgJ06YBT1u36VFbzfkXoyGEnMSecHvqp8VITiOSb/+CJ9+MHpTwkCBts4A06CDDkhqXgRBWpvSbUhZbBbQIVj6kNZ+Xda1J8bc1Q3MbyUeYgkshDR1chAZPk=
Received: from AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 10:58:53 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:c0:cafe::a) by AM6PR08CA0030.outlook.office365.com
 (2603:10a6:20b:c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.9 via Frontend Transport; Thu,
 29 Jan 2026 10:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 29 Jan 2026 10:58:51 +0000
Received: from emails-7705423-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-155.eu-west-1.compute.internal [10.20.5.155])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8B82980190;
	Thu, 29 Jan 2026 10:58:50 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769684330; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
 b=LTZrQ3uSqCIjAC82k+EvBeibvf82zSe3JqGXR6+O2yARpIi/a2oABo69jCiwBd5bdYLdV
 t/IcADbiKAk9fPu/rQHmnnVVB7MZSE7ltItmhCzMnj7mKewAvjm3azfncl4nGaM6XwlKzm+
 07Cxp1o5BE+UZyMUnn/b7rbP8HvqjRg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769684330;
 b=A6Rjz4rbhYKBNpPGE0S7UkPwAGhqXUOA8M88gmx89oEGNt/MO1/l40vpa8COVU4r2DoSn
 Q6tAn/Dfml7VZSUOUvMaIyusfmIJu6yiF0zDX/cBkAwQA170d6ujJoKxhOtdkxSoABnbhN2
 tmeIJ81brAi9Sfpf4HpbSq79+XTlnKM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjxzyqdkiSmSl32/zkn7SxCm6DvyzXazUFrMiCalWOI/CzgOYg+FOjRc8b2WxzkmsHRlLi0/n1+HQfnF++yYrjoONyLFpU1eU6+dSUDnUKTtmD/SSLc31wV5iQbrt0I739Qmo2zjrmomxg0EEe94h6pgOSL6ODMlF7NlsvIu6AKmXIPyuSHuMf+cg8xBXfiBPkz7DzmAcfKru99CkXuD5fSCqaunt4UXyEpKKP7SeqqlOuS6QozVMFvCT/hbstSuSz9hjQgzENmnui4yGFRMwY/wVv4+HVewoBcYY6vFFGODOLFBOMio6nX6pQ6nlTeu77KLALnYmZOiRGfB2lItVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
 b=h/bGTV4fJ5uobvYl/kIPDcPda4PmuUJjNC0mKLmbQ9zQfG39TvIIFMV/lNOX+emsFlkG5QIZkBdo0hyXgWk0pEFnEQnMwBLQzpaONWuc6Rj/QrvlANJzPJQFE3yX2C+ROKfMnn6NCc71+xhbMcusNrBsNalGxzwS1O9X/FdNLW5Za7s3W8sHIwikmrJkeIphoa3/oJmxTlhmuTx+fQme8Aq/FQ7pT0a7hDfwD7xg7JmojubUDgoDIZc9PcIqOmbKHme4nH9lClfm8htDuTyhCp58WQ+U9WqQ+J1cO1ztVRfcWimAfww2KTPlnrENTJWIuKTitm0rrYQ8eaxklS6iPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2r/xanngliCAIh02w+qT9bj4zK9T0gmHu8mts1Osg4=;
 b=qCpnJpLZpJXehfMHhVXh48N+oit27aMwekx5KfVvoz3yuc1lcnDIgJ06YBT1u36VFbzfkXoyGEnMSecHvqp8VITiOSb/+CJ9+MHpTwkCBts4A06CDDkhqXgRBWpvSbUhZbBbQIVj6kNZ+Xda1J8bc1Q3MbyUeYgkshDR1chAZPk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8591.eurprd04.prod.outlook.com (2603:10a6:102:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:58:41 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 10:58:40 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Thread-Topic: [PATCH v8 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Thread-Index: AQHckHIr0TS1/c+gt02Hk2vou+h/ELVn0heAgAEpeAA=
Date: Thu, 29 Jan 2026 10:58:40 +0000
Message-ID: <c87d6af5-f2b9-4a4d-bfcf-431c84e06601@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
 <20260128-imx8mp-hb-iiot-v8-3-9646a3025cf4@solid-run.com>
 <aXpD13sHZYoXGQY7@lizhi-Precision-Tower-5810>
In-Reply-To: <aXpD13sHZYoXGQY7@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PAXPR04MB8591:EE_|AMS0EPF0000019C:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e74bc3-48d1-4c7c-0e32-08de5f2562ed
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T0JMUlgyZHJZTFc5MTk5bXovZkZudGRDa3ZtcVRZdTBobFJiZXcxTmgzMVp4?=
 =?utf-8?B?VngzMGZFcmZmOXpuVFZFY0dVTGVyU0kxYXZUZlcwZWt5QlVYKzlpQ1QxU2Ri?=
 =?utf-8?B?cU84L2EyZmR5MDE4M2p6RWpLVkpyYWFYMnRsS0h0WFpLZ2JXQTBmR3R4dyt2?=
 =?utf-8?B?M29Qa3FNdDZ3SGJTWDJNYm5MQkxNK0pxSHBRNytkSnR1K0VBQWgzM0VHcUVG?=
 =?utf-8?B?U1hEWWxpS2lQTURGSTNPQnpRcHRLVmk0b2hFM09LY0RrOHpsOCtkajE3NVVl?=
 =?utf-8?B?MGg2Z0tsV3JGdjEwbnpKejM4VHhXT0F0Q3JGck9Vc1BTWVFNRlZhUW41dWNv?=
 =?utf-8?B?OFBDL3ROYy8rM1lvMHBTaE9zbUc2empkWlhoNW4wTDQ4Vk1GZWdmTG1GaDZ3?=
 =?utf-8?B?MW8yRVVOMHpPaVl1SlVQVC9rZ2x3VXdOUHFMbHNMdjNiMVYxdnJvNGZaZGZK?=
 =?utf-8?B?UGU2eGpuQkU3b2w5VnJDNTd5YUJjbXlxejhOUXoxT3dYKzZJNDArSmVXYmp4?=
 =?utf-8?B?VVQrL2ZsRTgyVWVhL3pHZ2hZMTZzUDJTeGcyM3IyN3VWZUQ1UldyYWROWmV6?=
 =?utf-8?B?dkE5TFFVaDdtaXNJZ3h4QnZFbFA5REtZZnU3bEZuemgrRXQ2SnN3Q3FJS2Iv?=
 =?utf-8?B?UGt2alA1ZzZrcGRhNDkzSW1BRkZEQVBESjV0K1h4S2RJQ0VZaUZTR3J2ZnRr?=
 =?utf-8?B?Sy9UNS9wbkdmM1ZndFd6Qkkwa2xsOWZJK2tGUW9nQmpia0hXQjgvV0lacDdu?=
 =?utf-8?B?Y2VVRDY3Q2hTMGI2SzExRExoSjQ5ZUluRklaU09sb3ViNDVhZXRocVBOYXQ5?=
 =?utf-8?B?TkZWMXkrekx5S0J0VkE2K1dXbFl3dGZwRkEvN3JDQ1FiYnZZa1kyWVRiY3dv?=
 =?utf-8?B?V3dpWlBtb0VGWnJCdnJsTzJ3OWVYME1zdWtiblMvM3F6YnhMZ3hmYjVyWWMw?=
 =?utf-8?B?cnRvTUhtdFlwWGpOaThFYUJrK3FkaWNWZjlmZFVHblQzTlNZV1BaZFNXOXdo?=
 =?utf-8?B?bGJxcFpqeFIwK3I2KzFOQjA3c3pHRWgxWHJ4NG5pbTZlbVczaXgvamFJakc0?=
 =?utf-8?B?MlBEeWE4dXcxM1F5QVQ3UUJXRnBtdXZ3RHIxeTV3WnBHYkVWOXhsZDl4ZU1o?=
 =?utf-8?B?bHJkcWJ6ZnpQV0tGT2hTTW9XUXNwMmg3L2tUVW1kbG9ZakYwT2NrUjc1M0xm?=
 =?utf-8?B?TDdCbW9JKzEzUlpSNWlBYyt0Nzd6bEhXR052VzZnTEh4ZS8zU0R2RytHWEpl?=
 =?utf-8?B?N3doVStPSTVoQVIvaVFDcmxsb29rWi9JM3QvNjlKKzIyTEdnS1l1MEZzU3V3?=
 =?utf-8?B?ZnovZ3BFSTJHYVR0K3I1cmhVdElJdk1Ea0lPT3BkNEtjbjMrblprcXR6eXF1?=
 =?utf-8?B?a2dyR2s1TlFva3JqYlBuTk0yNGhSbm84T1p1cU9VNjh6c0ZsVVV5T3VDSW5s?=
 =?utf-8?B?cjZOVFZWUnhmNEk3YjZSVFpkcXU1bjZlZ25KUzJBMWN3c05JMmcvWG1iZXND?=
 =?utf-8?B?WkJ2VHNJT09STlFNalFEY3RkczkrV0tEYW0zZkVLZ213MTg0Yms2akU0TC9z?=
 =?utf-8?B?aTlXbFR6cm0zeXE2RWR4VjBpRUloYkpXYU1BOVV4bHMyRmhySWJFYVQyQzVV?=
 =?utf-8?B?V0NsYitJN3FINDl5VWtpbEl2azlWZnhOcTYzN0hjZW82TW9aVTlQYlQrOVpG?=
 =?utf-8?B?aUhGeUl1Sm9EcElNZ0VaR3drWWptSEt0aWpML3BPamJDcGtJOWJzVG1BRlJO?=
 =?utf-8?B?VWpaN0NlSFhndE83b2k3bjRkYUtxbWhtSmQrUndvZkVJc0pVVDZaV09MbTho?=
 =?utf-8?B?TXExT2xQUWRqRGwrclMvTTNzSWIyL0F6OHViTFBnY2czODRlSGxhWnp6cit5?=
 =?utf-8?B?K0JXWjhaRFkvNEJmQ3loSldKOGVkaThNUThGT2pPL3Q5QkwxbXlaanowZUhl?=
 =?utf-8?B?NDZlQWJKUGdSQmFqYTRveGo2STBSMHZkVjJFcE9VU1JKRnJ3b0hIUFY5aXIv?=
 =?utf-8?B?MTMzWjRaMjlKdm1HL0crbDZ3VUxRNC9rM2M5RTNPdW85YmpKRDJCRk9sdDZt?=
 =?utf-8?B?L2FJS2hrWkl1ZVJrOWxBN1lJalFKT1AxdktHY1F0SVFzbGlFZ1BzQXhJcnZt?=
 =?utf-8?B?aXZoank4YmtNQjVHL3BHVkZoaktSMlZxMmtTZm1pdkp2MWhuQjJaVFdyYXNx?=
 =?utf-8?Q?gfT2G+LNuJ8wXDs7Byo1vA4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <667B1C7C50B0D94893D2E94DB11DA1B9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8591
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ee05a0fd490743d587da1dff16f26ed1:solidrun,office365_emails,sent,inline:542bd80e4450dd43529c7d8f437737e6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7aff311-74ba-4cf3-39da-08de5f255cd6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djhmV0JlRjEzcTlhMEJxK3VZc3d6c1VzWndleDAvdGRsZE9KVUo4ZW1IdXRK?=
 =?utf-8?B?SVhwc1FyVU10dFEyTXVzNFE1Q3lZRWF3Nk11dTNlVkhHcmJzRXp3R3Z5S0xD?=
 =?utf-8?B?RWdkeU9ESGxudTI0VFZUZE1qWUZlaUhpWi9IbWI1a0lWSHIvSkNGMUdQQVZx?=
 =?utf-8?B?akduTEpiRGhaYktzMy9NSjNLQWl5cnlrRUVqc0oxMWVtejEvc1dLYjF2cnA1?=
 =?utf-8?B?OXd2T0ExMjJlY3l5QllrYm9zeXpEeWhmeS8yL2pYWXN1eWYxVFdQYlBuMXJq?=
 =?utf-8?B?U2pmeHZFMW03ZXg0M2ZzNjlDVkZzVnU1NXlIQTI5TjNRN1Rld21CZjBtNy8y?=
 =?utf-8?B?RjJ0ZWdiSzFLcjBnWXJwNmx3aFB0VUxiRXZ6Z0Q4MHVTLy9leXNTNnJmSGZX?=
 =?utf-8?B?cjcvd0tqdm96OEVRRS9rdEVEOFBkNWhydGlUOUJQRFc5N0l1eW9pNmU2ZHdl?=
 =?utf-8?B?WW5iamdOblRoVFZKWlR4eTgxanZnQ01HbDhQV1BBK3dtOG8xQTFPVUFac05P?=
 =?utf-8?B?K1RxMmtzSEVvb1k5QWlka3FjaVhZdzVtNG5CNjdNTVpOUVlTL1NFMTJJVk5H?=
 =?utf-8?B?dE8vazF5N3d1ek9MQXJ2ck1zcDE5SzFhc1R4YXlTT0FoZkkyTFdwTHZYN3Mz?=
 =?utf-8?B?NnZzR3pOclNXczdNZCtMdXRwZWxjalpta2RJODNaRWNqZ0dOMmNoYVZLQkdU?=
 =?utf-8?B?VnVxVkJqRDNEcm5lN2tTbGhhZkFWYmFHODlDVzQ3VU9sTkJYYm1wS0VVR2Fm?=
 =?utf-8?B?M0kwZkx0NmI2M3dNUnlTVGF2WGMzY1pNVExkVUpueG9rUGdTcVEvdVhoRElr?=
 =?utf-8?B?U3lWTU5oaEVHKzNiemxJK3FqVWRXZi9Ma0pmNmV4MXlBTGhSU3JOTFVZanZL?=
 =?utf-8?B?a0IyNWxxU1FoUmlyVVhhbnVsSmFNM2NxU1FNVDVVZlcrOG5qVlpiUUlKNWJt?=
 =?utf-8?B?MDcyWDVGZUNadGdTa2hzcGJ4T3UwWmp2TVVKTnNoUzBuQXR4REpnS0tIbzFq?=
 =?utf-8?B?bzdHVHBrUVJPODJwWDFwKzZwUytxU1dDWDUxcFFPWVpiaXRXZCt1Y00rK3hG?=
 =?utf-8?B?V0E1WFNsSFUybXNNQVNJUTV6ckRUUjZrS2VJdkVSMUR4dTd2OC92czNFb0F1?=
 =?utf-8?B?clV6RU5SZm9NS05YWE1jWWdGc3paZjNLalNNQ2RXTTg0OUtrV0VzaExFV2Yv?=
 =?utf-8?B?bWtNb0NLeVV4UnBEcGtqMzdNNkNtOU5PZ0l1OXdCeWtYWllBWmJGUGxUWCtn?=
 =?utf-8?B?N21WdERZYzBrNjJLZjJzNzRVQmdCWHNtVkFoU3Q0NGVIK0FGSCtoYitIQTE2?=
 =?utf-8?B?a1N2MmRFSmFyc25ldFFWKzdPSGdqclFpSW8yeEtxUzgrVTZ3TU1xa2dnZjVH?=
 =?utf-8?B?YUJPL1BBZkdKR0twQm4xaU1Cckt3RFNIb3BaZ2kzdzZkS20yV0s1RHAyaUJM?=
 =?utf-8?B?MVBDclBjdkQzZGRFMFM0Rm1XQ0V1dGttb1EwK2FnaUI1VTNxbzhmWDZyN2J6?=
 =?utf-8?B?WHJpeEVLM2pjb0g2cUM5b1oxMjMzdngvdUJ1cXNrZFlTWnJqNXAvWjJTTy9Y?=
 =?utf-8?B?OTFxNDl3YjZIOGl0NG81RXB0NW10Mnp2blc0TnArcS9QZlgyTzR1aUdwMnBz?=
 =?utf-8?B?WENsQzdyUnZkNjAwaTN0V1pQcHNYVHN1T3lId3dHNW1FU29oalk5eDEzVmps?=
 =?utf-8?B?cENDVnhIQzE0aHp6dEFVY0ZXLzJWa1hENG9Rcml1cXlUS3I2TlpvZjBKWGVz?=
 =?utf-8?B?R0NRZGFncERnbncwMFZCK2x6eUtWL1RJaFNibTlLZ2dJa1J4bTVYdkhVdGxI?=
 =?utf-8?B?cVBkVSs3MlA4bEVqY2ZnS1NpTU0vREN1dlo0MHpWMDBJd1V3NlFGdmZITDds?=
 =?utf-8?B?c2JpbElTeHE4aUZzbDhwM1pGWUtVYzdPRmJzVFM1RGk1VDQ4aHdVVmN4dmZn?=
 =?utf-8?B?SyttMDVXdTQreUZXK0xsa2M2TGlOYkNxaHFMUFhCSHlwZXRSUDBVNnNCUHhO?=
 =?utf-8?B?cmRpQ0U2NE1ISzNZTWF4aEJzZm1YVEhNNmw0Yzg4TTJjYW9SWW8rYXNockZG?=
 =?utf-8?B?akNpUDlzd0NlcWE0U2FsczZMMjlQcXF0a3dFTmhIMjZzektsdGl6enRYSEgw?=
 =?utf-8?B?VWluSVVDRytZelpXWVVZUDNPVldLekwycmhIQ3NEOGtTalNSWnBZVEFrUHVi?=
 =?utf-8?B?VFBwS2tGOXZDMTNFeDgybklPc3FEdDdaQU5jTXlCMkhkN0dyUUpnZ3g1b3V0?=
 =?utf-8?B?dWNNclhoM05YdFhOcVlhOCt5RllRPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:58:51.0271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e74bc3-48d1-4c7c-0e32-08de5f2562ed
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

T24gMjgvMDEvMjAyNiAxOToxMywgRnJhbmsgTGkgd3JvdGU6DQo+IE9uIFdlZCwgSmFuIDI4LCAy
MDI2IGF0IDA2OjIxOjI3UE0gKzAyMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4gaW14OG1wLmR0
c2kgaW5jbHVkZXMgYSBkZWZhdWx0IHBvcnRAMSBub2RlIHdpdGggYW4gZW1wdHkgcGxhY2Vob2xk
ZXINCj4+IGVuZHBvaW50IGludGVuZGVkIGZvciBsaW5raW5nIHRvIGEgZHNpIGJyaWRnZSBvciBw
YW5lbC4NCj4+DQo+PiBIdW1taW5nQm9hcmQgUHVsc2UgbWluaS1oZG1pIGR0c2kgYWRkZWQgYW5k
IGxpbmtlZCBoZG1pIGJyaWRnZSB0byB5ZXQNCj4+IGFub3RoZXIgZW5kcG9pbnQuDQo+Pg0KPj4g
VGhpcyBkdXBsaWNhdGUgZW5kcG9pbnQgY2FuIGNhdXNlIGRzaV9hdHRhY2ggdG8gZmFpbC4NCj4g
Q2FuIHlvdSBhZGQgZGVzY3JpcHQgYWJvdXQgd2h5IGR1cGxpY2F0ZSBlbmRwb2ludCBjYXVzZSBm
YWlsPw0KDQpJIGRpZG4ndCBkZWJ1ZyB0aGlzIGluIGRldGFpbC4gQmFzaWMgb2JzZXJ2YXRpb24g
d2FzIGFzIGZvbGxvd3M6DQoNCkkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgdHdvIGVu
ZHBvaW50IG5vZGVzIGVuZGVkIHVwIGluIHRoZSBmaW5hbCANCmR0YiwNCndpdGggZGlmZmVyZW50
IHBoYW5kbGVzIHdoaWNoIG1hZGUgdGhlIHJlbW90ZS1lbmRwb2ludCByZWZlcmVuY2VzIA0KaW5j
b25zaXN0ZW50Lg0KDQpJJ2QgcHJlZmVyIG5vdCB0byBleHBsYWluIGluIGRldGFpbCB3aGF0IGhh
cHBlbmVkLCBhbmQgZm9jdXMgb24gcmVtb3ZpbmcNCmluY29uc2lzdGVuY3kgZnJvbSB0aGUgZHRz
Lg0KDQo+DQo+IEZyYW5rDQo+PiBSZW1vdmUgdGhlIGR1cGxpY2F0ZSBub2RlIGFuZCBsaW5rIHRv
IHRoZSBvbmUgZGVmaW5lZCBpbiBzb2MgZHRzaS4NCj4+IEZ1cnRoZXIgcmVtb3ZlIHRoZSB1bm5l
Y2Vzc2FyeSBhdHRhY2gtYnJpZGdlIHByb3BlcnR5Lg0KPj4NCj4+IEZpeGVzOiAyYTIyMmFhMmJl
ZTkgKCJhcm02NDogZHRzOiBhZGQgZGVzY3JpcHRpb24gZm9yIHNvbGlkcnVuIGlteDhtcCBodW1t
aW5nYm9hcmQgdmFyaWFudHMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3Vh
QHNvbGlkLXJ1bi5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1
bW1pbmdib2FyZC1wdWxzZS1taW5pLWhkbWkuZHRzaSAgICB8IDExICsrKystLS0tLS0tDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5n
Ym9hcmQtcHVsc2UtbWluaS1oZG1pLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXAtaHVtbWluZ2JvYXJkLXB1bHNlLW1pbmktaGRtaS5kdHNpDQo+PiBpbmRleCA0Njkx
NmRkYzA1MzMuLjBlNWY0NjA3YzdjMSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtcHVsc2UtbWluaS1oZG1pLmR0c2kNCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQt
cHVsc2UtbWluaS1oZG1pLmR0c2kNCj4+IEBAIC00MSw3ICs0MSw3IEBAIHBvcnRAMCB7DQo+PiAg
IAkJCQlyZWcgPSA8MD47DQo+Pg0KPj4gICAJCQkJYWR2NzUzNV9mcm9tX2RzaW06IGVuZHBvaW50
IHsNCj4+IC0JCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpbV90b19hZHY3NTM1PjsNCj4+ICsJ
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9kc2lfb3V0PjsNCj4+ICAgCQkJCX07DQo+PiAg
IAkJCX07DQo+Pg0KPj4gQEAgLTcxLDExICs3MSw4IEBAICZsY2RpZjEgew0KPj4gICAmbWlwaV9k
c2kgew0KPj4gICAJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMDAwPjsNCj4+
ICAgCXN0YXR1cyA9ICJva2F5IjsNCj4+ICt9Ow0KPj4NCj4+IC0JcG9ydEAxIHsNCj4+IC0JCWRz
aW1fdG9fYWR2NzUzNTogZW5kcG9pbnQgew0KPj4gLQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmYWR2
NzUzNV9mcm9tX2RzaW0+Ow0KPj4gLQkJCWF0dGFjaC1icmlkZ2U7DQo+PiAtCQl9Ow0KPj4gLQl9
Ow0KPj4gKyZtaXBpX2RzaV9vdXQgew0KPj4gKwlyZW1vdGUtZW5kcG9pbnQgPSA8JmFkdjc1MzVf
ZnJvbV9kc2ltPjsNCj4+ICAgfTsNCj4+DQo+PiAtLQ0KPj4gMi40My4wDQo+Pg0KPj4NCg0K

