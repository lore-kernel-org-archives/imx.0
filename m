Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792695917;
	b=MGgg19+hiHjao33vw8wbgUvPsneky4lv4899PDloldriWjB+8abWhfK8vZaRGyF3DBXA
	 G0s2Qta2K7jBzeHhVl0zrrK8gz0k4M+/fS2CWFNIAuZq+PjBJb26J+Whk0E2Qu1qM+x0q
	 IE1osP5LnVNDTAYzUOEAfzLBMiSFpQrh9GljPscMw5wREhkNhPDyu0ldBNGgij0NChDrh
	 jKg2FiX1zgsxxcqXLtwxOI4BsgDyMg98BizlzxAvHw+v3/Aur1LxuvyuABXD4uFuvLJIp
	 KJOoEUxm9IredOiVugCouKc97N+hkEO7EqOooD1zcrBS37Tjm8QuU/IXymmfcX7Bo4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695917;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uxm/yUaSqwop43ZpO6Qrl+/bYkIuIApLhmFjuNrCLNY=;
	b=Xz7jgfEXPJ0Ob28W+A5uUPoY/4Lrb4u/okTDA10lMT5Fto3jpH29RjFQdlPN1roE9x1Y
	 zksefLEYAIh1+gebfYHNnaRyEu3jSTkJ4oqFbdICsftUkZ6/HnlDRRCJf4d0dA000bWMP
	 OgB5n0KAAhBDFefA123h/3n2Rzd7oh/ks83vg8mDSY1lp1oUxixBT2al7UfvHrXiEIHCu
	 eqQ1xxEtf98ciXxTW8e9gsDcGg5mw0gpXtBH3PhmitAKDU/V7dbxgBZkuXk9Um2I5oxhk
	 GetBQd22/xiWLg+thOj85FCSmaYNnuIvGtbDfphK+8i32qUgjHII4+hxTWlMYHg8NkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F5606A31A
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 19:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbLSRqVvu3FMk0PxNBxzq4JFbF5q6pe0Zehf5+dBQ7j+FVGDkOTy2wS/5eHI2TuXT6lYJSgtJwsDSQosUrgeBybak5wkD2BlOZxeYzwXw8QJLzQrlQ03tFZaDEm7ThRRi/QVqg1R3vUN/xdrTfvwOpgkC2fPkjsnmak4nYP1R6OMEP1h0LCTQHWNCPckpXDj5LvAOl7O/F3KZK7CmOHVQQPKDtNVxQkneYSwYZlMjTHs/Y3wu5FSYEgLcq3MjeTU7NE6SxJA/ZHtiLWIVqeYgJR92IEe8xKlX8f+ct8QVqjRtF/5LVSoreCd0d8lhi9kovfT6B1u/F7soa/QGfKHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxm/yUaSqwop43ZpO6Qrl+/bYkIuIApLhmFjuNrCLNY=;
 b=b4LID5A6+/KJI19x3frfTILIZCZFTLBanfVesNmzLbHCsEef1+ArxK9jmhZ/A6fO3A34OD0TVnqH6ONMWHnxkonJ2m1hmmP7QEDN7yTyYB+v/+3YvX4Ynleg4QWYx+DSOEAFwf4QIeW0YVV+SmMnFcvuX27TGa8bIuL6JwxlM3WrDfKkdIOEHpMDBVoG3mBhtk9Uo3wRTypsaMglOWd+kwSuVrTwFFPwowtK4p0ZWZD9QJF0SQzcAO10S5+GIq+QUQOJ5Yn103S9lQjNuVqiVEpwgZIRr131GA8JOSo38dCeHSbO9cLn11sb2196y43gTVHBiL9wYD2XluOAnohNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxm/yUaSqwop43ZpO6Qrl+/bYkIuIApLhmFjuNrCLNY=;
 b=qKnmRfCBYFl35+a5/Q23KLk4313lkCouOjyEK5wx08OmTO7y6e6Z5UOb4ykN2DNES36/xPlvM4HnjR7PRiAvFyIS0DGy/JRdmrYahSzIc74s3/XXDf2Gnvw6mn99db0w5jpZHcsVhoFyDfJ4RvwCpEkIWGw5A/rnN1UhOJ5XZ0EzMdQ629l1qojyo1MZFjzya2El+SmLC8vnsD2DkuU3d9gpR717i++CBaY+n3vA3bEj/Ade7W6zM/2ydKKnI8tZ7JiSAdnvD7g+XXW6tESY2MQ+vt5R1LX8MGbXfiNlGMwPHx0PJHkbvKoJl0TrE7th/chGwC79yGbN5Sr9nhM0/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPJPR04MB036028.eurprd04.prod.outlook.com (2603:10a6:380:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:05:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:05:08 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v8 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Date: Thu, 22 Oct 2026 15:04:58 -0400
Message-Id: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpe2moC/23PTQ7CIBAF4KsY1mIo5ae48h7GBbRTxaStASUa0
 7s71Kg16fKFxzczTxIheIhku3qSAMlHP/QYqvWK1CfbH4H6BjPhjCtmCkk76IbwoAGO2KS97YC
 2RjIAy52uGoIfLwFaf5/Q/eGd482dob5mKTdOPl5RmaYmkXufAXppQBKUUXzWUhrOwLW7/n7Z1
 ENHMp/kFyjY8oZJImBdXcrKlcYa9Q+oOWAWAZU3AKEcB90opf8BPQM4WwQ0AoUoygZPqErBfsA
 4ji+Ij8vYhwEAAA==
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792695904; l=3113;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lOJb6NeJMCA0YIxf14QkG5fRIpMQg+cGQnUFBCIsQPU=;
 b=DIycpGChYjrTfn3qgGwRfv2Oe+0qxl9syW8oR6T6WZAHDT8TktALn2UvaAmxwfUBss9oUa2a5
 iTu0lHCV1G3DATaXk8ToZV8ZJ2+Yxqc/MzsDv8sFuMGDEgJUAIODkrv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:510:2da::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPJPR04MB036028:EE_
X-MS-Office365-Filtering-Correlation-Id: abef28f2-558e-476d-9c3e-08df306f63f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|261021123027099003|10067099003|18002099003|261022105027099003|5023799004|11063799006|261009223027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OeHdR1xgZnpYeurV/nOu88vVPwq9cpMxAf7U6uRqhyHaTwOhbuKajoOd6RinQHwLEO6EUzd/qkH/oIdL/223QaD8f1l8BqJF2KOhK+xLHn4MR+Mr90MSlMugCbWaMLpvsgmymvkhi08PWGJPLRRtyoN3EhzFZswxCWw8FuMIbHhzwxLaRTI//zOUwSWK5VOnmK+qHWWJmghwZ1vQsNa5pqLsH7GsSEqV51lC+/IRrGWpRwt+sjmF2LZvuxefIeqUaF8U1aVkTX/n1JZ4no1Yoc4wOxuIOYHEOoXG3jEwTz+YqA2Ki+ADtk1DwjtEdrMbxY/I8caAKL6cS3gRwrAoFeukEqJxmswkk53tKstOO0IQL1Ub528dhZvsw2P0cv3qVrfXGzGxDF7YJGjtiNpcZWZYbAlWMVXM4wm8ERq8m88s0lSQS0Abats8pwLmDGhD4AJiv7AG+F41qxq6FVfC3C9LsLJQWMWJ0R0tg5XW3HW1ZaIDQsNn45GRm3m1hGljAg0yJYBEBVfafeUtQI3EVCt2TjCArDgAjgCiN3ZmUW63O9dzGK+SGZUNtupDTdlHO6Pf12hZ/iMgzuXvz9OMeUHBGg1DsNhkFFMFweO6IGj64/fyHCqmXx93d+IoMcT9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(261021123027099003)(10067099003)(18002099003)(261022105027099003)(5023799004)(11063799006)(261009223027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHlLM3BxUmU0K2NTTjBBYmY4dWt6bUMvTXVjYVlsZ1A0Q01WYU8wd0dqd0Vh?=
 =?utf-8?B?WmZ1OU1WcllZQTM0TXg3eVhRUGN4L2NoMyt0eFJxMDN4cHVDYUswajFMY1VL?=
 =?utf-8?B?SS9pR1M3aTFTYm9Ycm5jQUpBamd3V2U2WVFzOU93TDhPaHlFWnhLRXlhcUJ5?=
 =?utf-8?B?N0ZQR0x0aENocHVnM1RIVGY5UTA2UW9sVURlSW41dFFhS0hsR1YzWkQzNkhG?=
 =?utf-8?B?K016RE8zSjFHSXdHT1U0RW94UllOdWNveC9nTjRJTFdEa1E3MlgycHhRWEk3?=
 =?utf-8?B?WGFrSk1ZekVmdTF2R2p1T0NXWEZuNGhSQzVYcmpTMUx5OHZ0NTV5Z2ZoWEJ2?=
 =?utf-8?B?Q01lN2J3ZDdQS3NxbTRtMnZEMTJ5VHduUG4yWk1YTkNJbFJPR0FyQURiVFNT?=
 =?utf-8?B?a0hwd3FmV3NSalJ3dHhNMXVBOGUvNmRranJUN0VrdTMyTHF3dkU4N0Z1N0dM?=
 =?utf-8?B?eC9yc21vOGdrb2h2cTlhTld5clR0NE9sVEpwTllMUTZyZUxPd0g5MDZ1clJJ?=
 =?utf-8?B?K3phZ2FkdllnRkNCRmFUeThDSVVNTzJ1RXROeXhLaWtZYUtxTU5aL2FBd3N1?=
 =?utf-8?B?c1MzRXUvZzBUakdnbmlwSURBOHFaTjFDK3hGeG1ZV2VYV1duYWJITUdzWEZK?=
 =?utf-8?B?b1JlQmw1ajNvMmZHR21hRDYzTkx0NFl3V0wvRkk0bE9URjRPaitzTm5tVEh2?=
 =?utf-8?B?WXcyTExWa2I2Z3lZMC9wNXJjSFV0ZHZYSEQ4Uk5WRTJwV2pLd2Mxd1JNc2ZG?=
 =?utf-8?B?aS9LOG5CdDE0eWtxNFdGUGdwNkl0aER6Wk5LLzU2K3ZqQ0ZvOEFmbGo0eVBj?=
 =?utf-8?B?ZW9tb3BlK0RFemJmODZzS3R6bWxXODNDdnNqdWkyK0hnZnM0eTJpd1lWNHJX?=
 =?utf-8?B?L0oveWRjNW5oR21rUTJsV0w0bC8vMnR2M2ZFVDE3dUd5WFZYKzRzSTV1Z1ZE?=
 =?utf-8?B?TEdJTFZ6NVJBbnRLcVJULzJ6YWxnc1JaVHFhdEtReGlMRjdYZUxzeWsvMVJQ?=
 =?utf-8?B?N3lKL0xsQnZBT3Y1TkZkR20yV3k5bDJ1RzNNMUdDMGY4QzJ5TkpKS1RtT1lQ?=
 =?utf-8?B?RVBWa3VFeUo1bWV0SGpBTjRvT3M3clI4eE1QQ28yb0podzBLdHlnck5aZmk5?=
 =?utf-8?B?YzVWRSs4cFE3aWZWOUJDZzhmMC9EZ3Z5eTcraGFIc0UyazNDenRBV0gwR3lL?=
 =?utf-8?B?Wm9obHVXeS9oUzJybUNZQjVVRUFOcHFxK3luaVkxcyt0UXJSa1R1bU10SzdN?=
 =?utf-8?B?c2tISHlqRGdNMk1WaWlqdUpNaTgwQm5WbmdBTGN1bW1ENUlXa3pFOEdYZEZt?=
 =?utf-8?B?RHJCRUlpeWVHSXNGMzlMZS9WWmJ0RTdCOG9jMTBJWWdDQVpRNk41aHlyZnNW?=
 =?utf-8?B?Z2lnSElzaXJpYVlkTEV1dUZxcXY2NVZYdHlDTlRYV2Zyd3hqT1Qxb1dZTEcw?=
 =?utf-8?B?VXViaEU1bnl1RzhtZis1RWE4czJxUjJEYzBBUU5yOHNWZXlHMkhPbjZzRVlC?=
 =?utf-8?B?WVp2UGJSWSswYndVRERHOVNySURnZWJJZnRXOWZIb2JVWEFNZ2RSVUtkODYw?=
 =?utf-8?B?L3NvQ0UxRVZVVDBJQVJOMnh6eTBtYnZ5YTgrZFJQa2o0MHVMNlc1T0lvUGpj?=
 =?utf-8?B?bDBsNit5cG40S2pCODRMeElCOTJkU244eGRaWm0vVGhpa1cyaEpnMW1tUThS?=
 =?utf-8?B?UUFTNFoyVFF3eW1zRzk3Y3BqVnUyaVNOdDZwaXFhZDhDVmY5MUhpNUFGd3Fu?=
 =?utf-8?B?dGJJM3lyTVFlYmVEVksyOEFlV3hNcUpwT096dkd4TkVMbW11bDlrOGlBb25p?=
 =?utf-8?B?aFR3bXczODJZZi9yZkp2SXRxQk5reTZuY2FQcmMyZlRYMWcxMzRxOStmcXZM?=
 =?utf-8?B?TUw2T05hTG9sWEJxREFRNGJ3VXp1ZGdlNG9QVldFeVFkL21YMGxhZXVIV1ls?=
 =?utf-8?B?TGFpeHlFbXltZjNySWRBNUthaHB5VldVMlNkb01HMnlWcVIxY09zNW9hU1VG?=
 =?utf-8?B?eEd6dEhGK0xlYVlZUllnVm00dk9IRmdMRWpIYjk1KzVBd0IwRGhMMlRxdHhP?=
 =?utf-8?B?cmNhRUpYcUErb3kwR3ZCVkJCelhkSlVzZTZwZFVKbjVGa0UrNGNYZVlhZzlu?=
 =?utf-8?B?WmF2Y0Q2YjlvUHRYQVpwN0REWmx2eXZKNXFIc3grUXgyL1ZJdm1salNLK0ZE?=
 =?utf-8?B?V1FzUWR6ZDlzRUxxVGgza3dvZXVWdFMwZjBKSDU0aHVwWllKRU5zSnI4YmFG?=
 =?utf-8?B?ZDdVNlFrQ0E1RDlCay96eHp1aHhZWW1uR1RaUmFMWmFhcEZ0WXFQTkhCUFJV?=
 =?utf-8?B?bi92OWw0elNZZW5iY2x0WERzTzhYSHZBV1NHNDE1OFBCS3Fkb3FOR2tNbHdr?=
 =?utf-8?Q?kHKMA1MMRohLGEOCOV1hpy62cdmdTJGoPkEPE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abef28f2-558e-476d-9c3e-08df306f63f1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:05:08.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGMGE22/GTsxMA4HwTRJb63GSaUIIen3GAgP/PniUtGWg40WGO4W2+vDfiNQk77/OVCEoDj0Gu1gJVDR7998Gy3swuY1Ox225W+T4DkteSDeUtib7DsY6Pd+88NiULA7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR04MB036028

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

---
Changes in v8:
- remove dev_warning
- remove dts patches
- Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com

Changes in v7:
- move imx_rproc_rmem_to_resource() close to caller
- collect Francesco and peng fan's review tag
- Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com

Changes in v6:
- collect rob's review-by tags for binding
- move imx_rproc_rmem_to_resource to c file
- dts move related memory region node into overlay file
- Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com

Changes in v5:
- fix binding region-memory-names's pattern
- add vdev1vring0 and vdev1vring1 at dts
- collect pan peng's review by tags
- Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>

---
Laurentiu Mihalcea (2):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
 drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

