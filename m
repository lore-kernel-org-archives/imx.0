Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903742E03E4
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 02:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781748051; cv=fail; b=ZLobScmf9j4h5c+C+SxvqktqaWpATAr8JFfkaVMiVXau1dwvyLKB2BZPJn5Wf4LZyefjVBioPV1qtzIhm9gRA1lBLI4TTVhp8dwqiEUi+m65FIMMjoSWQYZzjkE///Zlv/eQdu1pfdLQ7v7LJ1JaVclK3SxYpAhJmwfI6P4VaQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781748051; c=relaxed/simple;
	bh=B9HrIbIx6Dy/K4q/NJPLppJm9idMdRz8PMWCY4JCU50=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bJSDdC1GXlWK2qI+JuANU0G5lYFBQ9eWKYhgS1d0DM0NRrQH2Za1O5KNgFg31nxv59NkjIdnR12JcggobVj9TWQNSrd1PgUPArNMkJAdIY5gu9ym+8ustjaymUmekLaIPwAnfjPyZpdZnGd9ZvIbz686kGndFQAf2A9Fc6mHSlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZKaY/qrg; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZKaY/qrg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glyJDC3zofoNAj1BDNO9c5j0cRza4QxCdiD8L2fPOwxLi2eDCQ0SCzdAuNoiTGcQmNeRw0wVMkUX7ZrA41yRkOR4lbqcXhYB7dbmfZFxnioN1vJUN6rNBmUaT3z00s8Lwc3GKEQRtQHVSSJJu/UwRU8u1D64OnT/1ReK/Enye9pZ3dcj9SrzFyr3wUW3tJBmtbvUntVdvMoKR8yW2HIe7elA5VTMPC8h9fngOajQPcF5KVkNh+gY7GxGxW/I4tPqPFNxjH1g9e1An5BjGHYb0lhrdcwFcprCDkKk+L0b2lxwUUe7F/Q8XOK8WbDz5couNye5/ao/lyCTWNjVfqzWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yoRC2dLSe/FEOQK3BADjIkFhRzV89Lq9AFufQKpmoM=;
 b=n9kYhGADC8y8Ee/4/fwZ6ptuGs3kIR1zGlsZosH0Qi966TDDhm62fFQlJZa0GXekxn+kia7QUg4Fs8HSuR2u9u/+2FHwSeneZW7ke0BE1mue9dsGwtVuDncuzF/k8+MoyU6O88H5qKs87PlXIL6esWSe2C0GLRrL0gseUItFksZWB+moVNY+7iIc8ezeYDtXvW7efXk4ePhpeMiCUAsNQkDZ6Xnz795uVX6fFYnSDNaqviLbUsiPu6hoguj1HQJDjoSiGOefz3lezTEAHUtTGCksmZWGleJlrxYrLhcApKrjnkCHBQ5CwUZB+5SOfO1j2Wp+OWc0amSsQwQuy6/wqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yoRC2dLSe/FEOQK3BADjIkFhRzV89Lq9AFufQKpmoM=;
 b=ZKaY/qrg9/avc+MM07qX/N+VqvpGdYXzRbmTDqs1/z+nOaIo5w9Mu7TxCQRXuz/9+W7l2OZa+gUGiv0+jic+vYzsUAKAG306kgF7aYUOljTFaBKXgS+FSvxXHALUkyFuGhIajBxLf2yrLJYjhkllqOdwQX4A9zdPyO1ragqmyA9oJ/VM7nA0w4+1PSgGxu3yAiNp6hUe4ziMJ5kSsX59OoTemEwUL25sjBCg4vKNURowyC2pR4wWVjxFSnEqMkENPskTdw7K9Ov0M5bXQfPOOpJg9VkikGA1FoGLqGvG9G5FAdNCVjnFsd74drWL0GuUehutM6zbeATpaV9qg1YF2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 02:00:46 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 02:00:46 +0000
From: joy.zou@oss.nxp.com
Subject: [PATCH 0/2] regulator code improvements
Date: Thu, 18 Jun 2026 10:03:04 +0800
Message-Id: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhRM2oC/yXMQQqDMBBG4avIrB3ISFToVYoLY//aKcXIJJaCe
 Pemdvkt3tspwRSJLtVOhrcmjUuB1BVNj3GZwXorpsY1neuk5+DZMG+vMUfjuGb2CK14L+idUMl
 Ww10/5/I6/J228MSUfx86ji8jP2YldAAAAA==
X-Change-ID: 20260617-b4-regulator-opt-4eb51441e701
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c09c0af-6980-4db8-f7bf-08deccdd6976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XZ68WTHdG3I5ZnEbz/sXkQHruoATpRsXbiUUe1uddmkgPG6xM7TYnL215EbHhgS5qAD4Y8YDfSShh1wM1zuda3tmLcQgRDgtIDYqRNetPtFOFi4DucSVOd7GfB4lVg/WGawPbR1WhXCyQkYDHmEJNskIbwpr1m7nB8CvDKShn02GcDkzybOJdnW9mr+K9mp35vFqoPmJd0I2Lwey4gq7SXf9kskwwqgCdwAP3M/NLDav7+rIjdN1rCqnjqI1VaU52dujnJNWpxEMXyb3ajTS46lGGhK9Xpp69SzmbIdDsowOMCQS35Cov6uBMJhUckQwR7zBDHyqabvaYAtwwwzNnO7yo9f69Z9xw+BnS3WJMSNUf8v2M8RjscB8xhK0wCJ/OFiSCDHXMQQjFUdE8N3aaU8NCwRbN63NHJ6FiiE86gPaibRuiV2wpANuwK+oHD7irG2ITpj7sGw3hejzrtc3VfBbZ4vAoWy3xR9zlI3uDssvT1yAZwI9+Ydc3BkpTzVhyyIJqbLQbBy3LIl6u2T4gNqzdHNHZCqOPVxWkKQJDEIE5AjdnNtnWvvU81g7fqigDhUnZqiKfPWelfpaTo3DjfDO/8Em3yxBX3zjgOLsWRPCQ4cS5fdf/f/bVbNrVKEEvvzzReofE9tkQoPw12oPFkOlSHuFmELvyCFHqwvnhtbqskVH6h/Fam1PChTmWN58
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZxcTc4OVphaFJYUGM0Zy9HN1h6cVFId3kwcmtPdkphN3hWc1NUTmNxbU04?=
 =?utf-8?B?aVcxM3ZZL25UUGltWXpPeDJKbFF4bkVzc0NxUjRPNlpJRlFHSGk3QnBxSFYr?=
 =?utf-8?B?YlBPOWk0UkRNQnJDaVZzdjlXc01uZWRyei9qMkpTQTdPbW1mQ3JObWUwQmlB?=
 =?utf-8?B?ZEFFZFF3bVZsWmxBeGVBZ05ML1JFMENCK0EwZi9wbk90b21UODB1NjA3MlZt?=
 =?utf-8?B?dUdtTFlFYi9IRlpRU2ZLUzhzYzl6eW02NGZpNU8rYy8yK2N4bE1JMTNRTlZM?=
 =?utf-8?B?d09odWxaWHp2d2hnYXFldmoyWGdia1BwSEY0Y21vSHM1SW95TlhjbENLVU5s?=
 =?utf-8?B?M2QwMVNPYmtZeXVNRE9aVFA2TFFRbFd1dW01R0xBdTZTd2c5MWJsdnkyNE5R?=
 =?utf-8?B?alBKdklKT3lrbUhSNEpzdlpDcnFya29ITlQyd3g1eDNteThZNHVtNEgzRmlK?=
 =?utf-8?B?QmM5Qk5LcFNhV2hwL0xUanhwcmpqeS9wd2NocWF0WTJiWHphcVlYTmo2VDVH?=
 =?utf-8?B?cDg1bkZxU2hHVi9tWmZ2anZrYkEyekxOWFlSUmFocWREWHNDanA1czhIa1c4?=
 =?utf-8?B?RE5YWVVsdzBQaW5mc1Y1TGpDbWFtNGQ5dmt0alVkUGFBMHVEZkJYZ01wOXZs?=
 =?utf-8?B?azl0TUtjcEN2VFJhZXF1UTZLZFZhSCtqbkNlQ3dyWnlTWmpJRFJ3bGhLaUVZ?=
 =?utf-8?B?b0piNWp3Y1p2T0Jzc0U3Z3NvLzdrYVhMT1ZmV254dVZLSWovWmVxdVJIVmJk?=
 =?utf-8?B?WHRSM0xRMEQ5UHBjbkxSTGtESk5uVjBMaWp6MzAzTFBzRjZ3T2xjaW1wZXNi?=
 =?utf-8?B?dHRBckpjUVJEWDQreUdFWHNVT3VZTDdxdnJURjI3M2E4V2gzaTBPd1RqSUNv?=
 =?utf-8?B?emJkVzV5aXkwL2xDZ3k2blQxTUJ2c0JmcFFib0c4SmlKRldhOVBJUFZGVThK?=
 =?utf-8?B?L0NxZG05azgwOHVMcWh6NmJyR1Z1bk1NbFpna1haaVlhM2MwcXl6MFluenFt?=
 =?utf-8?B?c1c4QVBHVW1aQ2FxbVRXamxwYTN4OGVSNFpDbU1VVitlZGJSMEJXSHpxaE1p?=
 =?utf-8?B?ZnFKVXRVUWptL2pHVll0d1NVOXM4OEV4VU5aUzVKVytRWEhGL0luRXByYjIw?=
 =?utf-8?B?eExmcFlvd2gzaTNvRTF1eStZVEpUWGE0NlJUMENZWDdWVW5NV0x6cFJpKzMw?=
 =?utf-8?B?dUY5bEloVnZ6czF2ejVzd21Rd2tPdE1aMEpyYXp0OUo1WllMNnFZV1lZNG1L?=
 =?utf-8?B?Um1YMFo0dFVsSURwNnZNbjMwUHl6L1RaN2RaQW9DYWtKUlh5akJMU0lXY003?=
 =?utf-8?B?T2wwSVVOVEJCQUkvaDA3enc1L2MzTEtQVjdTS1hDVW5vLys5ZWFtOXZQTXZB?=
 =?utf-8?B?TnZpSm5HWlB4bWVWWUJQazh3MHRtMmhyNk9na3V3eTRobUNTN1NwWm00Q1Bu?=
 =?utf-8?B?Y0kyMXoySnlsZDhsOGNORDlWekt3QUprOEp2MDFCQ29vWjcxZHpJcmttb29k?=
 =?utf-8?B?VGwvaGRYeWV3M3dMNTMySXhXYUl0ZGt1WFNET2kvL1B0dkVYRkdsSnhvQ1kx?=
 =?utf-8?B?SkhtajRwSlpJUllabFI1Z3hFT2Ruc3B2bmkvVm1JekYzbGl5blVPanhJWVp2?=
 =?utf-8?B?UzBpQlhXSFBvSnlvZ1dnQmlFL2xlT0FJOXVsa0RROUNMNE5HYXppV3d6Qzk2?=
 =?utf-8?B?bWpvdWFkeGxLVzdaRi83NGl1UUZlVkN2aFk0cHdHMHJkYWkvd0hXNUkwayts?=
 =?utf-8?B?N1RydURYSzRoTnR4MlVVSExRb1h0dkMwcmVjN3Q5aXozNFQ1b1ZMVHpmT2xW?=
 =?utf-8?B?TGE4aDdJQnZiMWNLdXdsL2JEQnFkK1dBVUs5STJLTlg2bUJBd2dYcXNwZ2hJ?=
 =?utf-8?B?cXpQdEpxRnRZdXMvV2hnbjFYQ3NyNG1rRkw4L1gzWk9PaFlxMHZTaUdHV1Ev?=
 =?utf-8?B?bkdYZU9haGQ5K3RmWXRHQ1J1YjZkR3VzdHVuUCt5L2JsVTYrMFJvN2psQXdj?=
 =?utf-8?B?RC83ZW52RWVmaGVNSXcxK0lsTlh0azFVMzRWYkcvVDdlU25jajZXOEpFYjBw?=
 =?utf-8?B?ejFtSmFCSTVKd252eG1xN0lYTDA0Qmp3OVlGbzNQVzViQ1VNeUV3SlpjdnhL?=
 =?utf-8?B?MG01dWFPWlJONkw4Wk94THhOZ3JPSFhPckd5ZFJrT3k1U2w3WWh0aWpETkJO?=
 =?utf-8?B?VVZEY1lCcHU4ZE11bm8wSUEvZUhudDlXcmhmWFlFNFZFT0Q0ZE9VVWpQSm1m?=
 =?utf-8?B?dVNacGNmbGJhbm95VWdsTzVQdUV6dEIvenZhT1l5RWtjYkR4RHBSWHNNbmFw?=
 =?utf-8?B?U2NXTVV0WjJaeXNWQmdYK2JNaWdrQnc4T2J5alA0Smx2V2VibjhmZm9SclM1?=
 =?utf-8?Q?VVGDrNoyxk+rSoFFVF1I0rEuNiWZ0ZxtRGcth?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c09c0af-6980-4db8-f7bf-08deccdd6976
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 02:00:46.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB58TIo3YXfBreaSxSvK51W+47ma7lJ+ovLTvAqEBJ1QL42kEorLbbzOmGNU/NHznEoKQSQfZJWN1bpe8CKVy/28eOECe63j4HnWSidWe+qiaUfC1Z5caC6F3qXgzs4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

The main improvements include:
1. Correct the default toff_deb for PCA9451A and PCA9452.
2. Modify volatile register range definition.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Joy Zou (2):
      regulator: pca9450: Correct default t_off_deb for PCA9451A/PCA9452
      regulator: pf0900: Modify volatile register range definition

 drivers/regulator/pca9450-regulator.c |  7 ++++++-
 drivers/regulator/pf0900-regulator.c  | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260617-b4-regulator-opt-4eb51441e701

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

