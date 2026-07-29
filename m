Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E3248A2CD
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330281; cv=fail; b=cZM7WV6VnLezIU/cSNEtbTac+V0n9cUjOU3ea8hSSAJOGV7NU2j1xhoeXDxM9Hg7Xze0x9ndN6IQkpMx7qJis/ufSM29GFzaispcO+lSggHYTi+5wyWpcCLUGHRi7PKZ4+516uzJjizkwu1Usvss2e6uzMW6+0r9AEbB2jgWmNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330281; c=relaxed/simple;
	bh=0+zc18fRTOSxa2brM0cETCfnXcvm8v2MEuXwYtu+7Dw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hwNkkFLQ4rmVHHcURLsv53Vfa31niUqzySgIvBMZnqa72Zc5oWyYCLHRDq+ITQdi+1h4CGGwJGE7Bs1FENgkQdinCdMe3x7nnSZjbPwnhAgUVvdPQuz7b0htG+ml2tCvnHS+OWksx7KnsN5wDhCXqiu562BIoJW6rESKTbitZbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l2kNxv1V; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l2kNxv1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnQd+jbLY9wobN8tPObgjjccxqxbpBRD7LoHOHPLy65fwWgXXzJEUohGAqGCD+6n/c3XW4qS3QCVh+NNV5gS0PqOBUVdOgB9hoYM4hjyNxfVwFF4ppaKYS/xKFf8pWoo3X4KZg7D1TyzCusEcP87OZWG+iexCx5u+A776x0ZEw+01hdHJNCJ3d1WQI+k0qtTLy4cLw0DYItH8MnkA4yY3tYoAV8zpC1+pSzIxLL7sxWvPrTeGN0sVXtQn8ktyoPaGOiuaz9VRT5Tu7QQRgqOJpHjMrS4mNISRWpnKkJlL0TRIZ+ZQ/fi2FfQH+/i++f7r3OrP2yxGPNfPUhuPEHCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzfBWh1xBU5XFqIRVkgapuCCLOqI2XpmNpPMiD4g1eI=;
 b=ABzDscKFfZtIXdzTuLEqOgyI25niHRW90Nq+lAgA5MtkEJIMyf3SwTLRlA228wpwSjaQOi3j8FIu1ymEEK1dfdBUioL3/JCcjaP+t7z8rwMv8sk/3meErIbc87BfkviSjPO+VPB+ZWFYkIBaTGCF1owWQySzX6hEmcDRe/yILbN2MYa5csCOMbIlWLqihPxTMxkC4moW6LoBrHZCVCYnImrxHi0SSnXt6QlB1yo8jbyrYKo93GcOSS7prcF78Q7CCNjMvPPMhBDfq+N7xrmg4ICC5m2mvtKUaHsUQ+wUQqCAViDciQhIWmzuewN//TrWcdxR2AQQ8L7OxmGVNl+QGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzfBWh1xBU5XFqIRVkgapuCCLOqI2XpmNpPMiD4g1eI=;
 b=l2kNxv1VwcKO+rYcMK3/mMROmmV91HiF+5KP5vp4TmZuwV7jga86JhF+WqUadh5tmmelTcIwWIwZx2iHYmSgWcou4pZzVsqmotUdgBKxxZNLXXGgt2A8bMATexO3ffCat7wBZjrnR+syssRWLhTFrF21iQvPZDEEFNY+HrDJZTMCgql8JWED7/4bXO0MPVLoFWWArR0T/r2Gw1eo1SgSYeirHiKbnVvBj9NkRilUgB9dL8ZNltxVXSYAjg2dQgbUO/mktWBDE8Bt9yhLYkUp/L0THYx03rom2t3nIJoatyz+QqVG5xU6NV5vjkGmDGSjcx4+8CWVvnV647XW83e/Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:04:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:07:59 +0800
Subject: [PATCH v2 03/12] arm64: dts: imx8qm-mek: fix dsp reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-3-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8f25be-123b-4e1c-2ad6-08deed71f012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8uh/PvnUeAqqxgYRik7Fx323yE64UKM9DljZOU8SgGLfyVN2jcDcZSw4ZkAOlnzu7qyOiFvxtG6JjR+bL2TTT9wwwnvnAVA6oqLOzouf9hOrIc4KVll5Z1bwxS1ZU5u6AqyF87wX3FYg4kbBF/SnVrlhV954AEfd6vIBNkglFzilLclvuGGGM0HUoeza/bZ9jwr6kyP35LypCRTGZm9fOzt0CE7mxlAqMN/0OtI5MyFDllCmdQXzb8KA9kMZmKXVeb4uNU7UApbLivY+D2Z5oHBUAC+R1iZVVscrrSjgoa1nWIpjljtd1ps7D9gEzpv5S2h7CAcwrjqtixcXYshcOXu0omsCDL9iZI7qqEPw1udkV1KTiG9PQsEazJ8Dcfn3ir0mSebsYGDTUjoUCCBrh7AJwp8C0v9cSPN6coSXjo8VZdFv0tzDVpG2t4Hwu1Aik7OdoE3druldu2KxFyqiFNzVw1fMBf+Z9URs6ffmU584zBRQ6/uH4QByyEEQMcyt7LVNantiSeAek6lpzbcwjKvTZfM47hgzoQaidkLTaoOAkMlAVuDl5Z2G1GbXy/ethApVTRcz7VF1/hLfTySVq74cKYTkqeWaUb0vJri126x+TbMvxZn4q6/tiu6oypgxyh6Z+XCZH0+RxsaRZb6DOf5J5UXNlWC4/WYEznJOoMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk1wV2RhVC82K0tWRGhodXp3bU5VRmNMaWk4ZDNER3RVdUJ1TXBZNi9uREJp?=
 =?utf-8?B?TXpBUHdHcTBOMWtzaVR5QmFBMkIwajhjQkxVTmZlOUhseXUrMDNNditWQ3F4?=
 =?utf-8?B?aVJ0WTZvVGVrdEp0MW9hRWhPV2M2Z3pnTjdFdlJ1eTNvakFyNk04RUIrTk9U?=
 =?utf-8?B?ZWZYUDRwazFqU0FmZGhKQ3lNT2hIdWx5QmRTa05pVGhVOFBncERYQi9qQ0ps?=
 =?utf-8?B?NlBYbVVubnkyZlU4dmZrRFZld2tXSHhoTVRqaTZWaXJMUnZoUGFzWXZpMWF1?=
 =?utf-8?B?cnAvUFVoMUVaUHUyd0ViQTF1VEUzN2tVM3RpWTFudHVFNTQrQlhrelVxNytt?=
 =?utf-8?B?VjFiM2dtN1p0d0xmOHJUR3drVWtObTVzWU9aZTZoUFdCM2lJQzFzT2NIUzh0?=
 =?utf-8?B?RzhpTWxldGJpQ2liaGpzTGpvRW85VUZINU5vbXBSS0ZJeEJaOUxKYWdRZXdP?=
 =?utf-8?B?M1ZDSDB5Ry8xeGFYMmtTNDZvRlNwZE1NVkIvaGVuMjBmbFBndWN4elFBQVZ5?=
 =?utf-8?B?bVNvcm8zSGxadDR4NktKTm9LV05QNUZ5b3hMT3FoUk5TNTkrSVZza2hsK1NQ?=
 =?utf-8?B?YklxVjVTNnZxQnMyVmVib0hHKy9oOVo2c3JnM0RtYjlxUGx0RHRjVHV1NFBJ?=
 =?utf-8?B?Q0ZMYWwrUWtYQlNIQTNndUJiUXlXNzZMSU1OakwzVnNkOWlmTUE2T1JxN01J?=
 =?utf-8?B?aG03Ykl2N3QxZzV2N3FSM2NOeFNzamtYSlNDLzA1ZUJ1Z0NWK2FQR0tLSlJ2?=
 =?utf-8?B?QkY0bEk2aGszbktXTkhjRlFxc0pKZVhpYytuL0kzODRFUkY5emd4aHhLeTV5?=
 =?utf-8?B?V2JaVE9YWDgvWkZOc3dTMUlSUEk5NllaZlRjbEFVdld0RkJHNnVCb1ZBb1oz?=
 =?utf-8?B?dXhCUmFuNVpNL1ppUkdIeDlXTmwzNDEvZXZnU2FjRXpHL01NZVhqUjh1SStE?=
 =?utf-8?B?dThmYzQ5a21KZjNTdE5xSHVuMUxTSUNaRHphZEkxUGV6akpXVHJTS3YvN0ps?=
 =?utf-8?B?dEZKRE9nYVRCMHdXOTFGUzFZNDR1NVZibGwxWm5FTmxEdy9ibEVEeFhwMHVX?=
 =?utf-8?B?V0ltOFdGMHlDblg1MUVSYmwvTG1wa05GaFhKWnRJdEdBd2txNVlEUGxRK1hp?=
 =?utf-8?B?OUxScDFrSWNucFBra1RQL0JXSEgvMlArSzcyUnZKQXZEMGdEaFlrdnNjZSt2?=
 =?utf-8?B?eHpZUzlhNCtZYmU2MDJtZjhzOU1lUEQxemdGSzhwY3ZFQlR2QXZPWW0wQlVG?=
 =?utf-8?B?V0VJZ0MyU3FkYzNFUUlPZ0NwQ1JOMU54cThVT0xIRnhOdzZYK3NHUzkzR25L?=
 =?utf-8?B?YmI1ZUZPZWhSVXRGcUxjd1dWUy9zTFNpekNxZWUyeWNNTnN5QVNVWk9GOVBa?=
 =?utf-8?B?cGdYMmpQUEk2OS9YbXBLZks2bUJZOTNLbEt0cFRPc2NOMVFQM01KYk1zRUJZ?=
 =?utf-8?B?eHJWWmFabXhNYTlLTlowaDFQem92VDZKdEV5dzRwZFF5cmt4eDVYYXVXUWVP?=
 =?utf-8?B?U2ZOQ2tNQnRDdXdNWno5VEc0aDJXRC9ad0EyN0pid2xMcWJ3WU9oOCtIZlUx?=
 =?utf-8?B?cHE5VVFMREYvbUh2cGZ5MkRwS1FHMTZoRTArUC9aUHYzS1ZxY1V2SDhwN3dm?=
 =?utf-8?B?T1JzZWU0THdRRWpZT2p2MTdjZVg5YUNaVUhpWll5NUR6T0EzZEtMZlVvelk3?=
 =?utf-8?B?Z3lOVnZCdWV6bHpmeGNBMkVUSHp1YWpNck9TeGZuYzFIaEpsSDZSeUlieGZ3?=
 =?utf-8?B?cEcrT1V2cU0rQzhaY0ludjZ6VzJaTUtqaGVBSS83LzRQNmhWeDdOSDFrNzVZ?=
 =?utf-8?B?aHVxMUtpc1ZOU3BnbEJjQVU0UVpVUk1UOHR1bC9ZcGYrQ0F5NXoyV040bkdt?=
 =?utf-8?B?SmUwbjRWM1AvVXRaOTUwTGZ6VllvUzNnZWc3YWcyR2tjZmxtUGkxM21vVGky?=
 =?utf-8?B?SXhMM0F1UjRsYlMwV1BzN21zSFVLL0FHNjg3SDg0WnptYkpUVG1nR1U2bmZ5?=
 =?utf-8?B?anE4SDNFYmJhMytLMVZ3aGdUWXE3dXhyalRHZldoNXpJR0VUL2NiSzQ4b09L?=
 =?utf-8?B?Z1pIcUM2MS9WeWRjUi8rQ1BIQmNXQVZvbFpWODdtNXlLbVJrSnRmSEZxdjhN?=
 =?utf-8?B?b0xqUVZ2bDA0aWxoTmNDY3VaVjdhVmVUWTVlbm5IT1p1NnVRQkxIQmMxT1lW?=
 =?utf-8?B?N0wvYWlTbVNXczErNUhISFRiTkNRdDZmQXpoWXZrb3FzKzdoVVllNUJtYUV2?=
 =?utf-8?B?bG0zaXJQQi9YU2FsdWs5YW81YVQ1RHJRRDhwY095ZDA5YkZPRGd3RC84OWdz?=
 =?utf-8?B?ZFJuQkNjajNUeFl6UWx4UUpuditlVTl3ZW5ENG9mdkp0cnpaODBwRm94Z09n?=
 =?utf-8?Q?pIPF4bEtlFZwvLIC37+pHTDhW+FyvzZeFVXaY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8f25be-123b-4e1c-2ad6-08deed71f012
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:35.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPt6QoHeGsZpvPKo7tXqQjBajNqCjKhpum+bhOwAH7opXWIYqtRLeFiyz3GQE7aBDaR9heKM9bJv7pwPFmY+5O4RVfoPr0oFaNEdSBtD6E+mTufTlRW3+A2QxjYGHLZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113

From: Peng Fan <peng.fan@nxp.com>

The imx_dsp_rproc driver checks for the name "vdev0buffer" to skip
mapping the vdev buffer region, as it is handled by
rproc_add_virtio_dev. With the node named "memory", the check fails
and the region gets unnecessarily mapped.

Rename the DSP reserved memory nodes to use proper names for
consistency with other remoteproc reserved memory regions and to
ensure the vdev0buffer check works correctly.

Rename the DSP reserved memory nodes to use the expected names so
the driver can correctly identify and handle each region.

Fixes: d0ee7ae8ce26 ("arm64: dts: imx8qm-mek: enable dsp node for rproc usage")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 8b67fb5d670da..1afa65bd955ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -105,17 +105,17 @@ dsp_reserved: memory@92400000 {
 			no-map;
 		};
 
-		dsp_vdev0vring0: memory@942f0000 {
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
 			reg = <0 0x942f0000 0 0x8000>;
 			no-map;
 		};
 
-		dsp_vdev0vring1: memory@942f8000 {
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
 			reg = <0 0x942f8000 0 0x8000>;
 			no-map;
 		};
 
-		dsp_vdev0buffer: memory@94300000 {
+		dsp_vdev0buffer: vdev0buffer@94300000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;

-- 
2.34.1

