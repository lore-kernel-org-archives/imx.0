Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676D3A6B79
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408617; cv=fail; b=p4O7LZ6N1vIg+8rEYvpqSX7msdrdXwoul80fdX6N8m5sKYtq0Y+G35kACKTclhOrkrJ5TsgwmN1PysT95AD3zfj+f7u/AbhFeffmOjwSvhalkBJSCvneh4oDji1gb+tqyYc/Ol+gHt3OosehshgnO46HIxJ0EQcUwssrL2wrhHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408617; c=relaxed/simple;
	bh=swLmERZBg/CGjMdq2+V+oMkkovoJ+Hrda0hSb76YdXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORre0fpDSb24Vh92nY7WeCvPXqIeyMKEe2miGLKHNw73eCPLYsV3Sk6/Hi3tgWbyGCdq+lWsMo0zg7UpyJUJrG2WJeLFYkLSLzOwfSWCzD/IxYmQypDugmUmPoissZ6Jif/BYVGDUCqOR+ar3idJ0UfI4Aw2u4LhbTDci/8vW1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BIuGTRYs; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BIuGTRYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9vZBXaMhnjwoosvNuuSplzYIfg1yG2F4mWvyAkPk2WkXstKFsLGmAPBzyle0lzQOJvcIoo5k9mSzfe74CzKqzBqdu8OoO0BKp5PgZy5mz0se5xB+RaI9BgARSPxA0/Z4jWAHDk70KYZ8iF63Z030rfGeqrwgksE4PS3I8W+Abgb1HlSwPXQRzu785UTKYilhiwApchdYeNxJ5EwzLgkCkrFPXf9jTcAx9Ml4VALKDdvM+PkFdYw65VU+SOHUA9naCS4cullqmD+UBaLxoJ9wqlqTRyvviDeAg0Af1gVkl9ViQTFjKJ8yEeOVklkKHPU36XWW0bBQ5aiX3qluqnSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a76NVTgQ0zAgaSL6s9Zv7DvqsANoCFyPCgRZmxTKjmE=;
 b=j0Y5tzSDIzztHysztjyeLwWZ9lesUDaL+bt4O0TF0x12GeXpiTLFAn5IKcigDJisPYVy3mk+uziRPruUeQlWxodU2u9wAF9NHwMCXN2jN7PyU2HXP/DbKo93Tduk0WEqin1+zlNUyYSi5yidVNvtrwIrWCo7xxodplFPUgQW0PSmwuGWPOxvEpaOYPOj8keMwEig11BPavstKqjb+t3cdRDUeRHuWMBIb/qUMvwTKC/95ysCzgLJfEf3JB3ifxEd/B3nNiErEHqPZhMvG2KFhn84Ogj94tDvzebHTkEdi/B7/7BoBV8HzI1L0TTlCZdPC1AhyV6FCkjJzZXeJwhF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a76NVTgQ0zAgaSL6s9Zv7DvqsANoCFyPCgRZmxTKjmE=;
 b=BIuGTRYsTQ17CYGu3Q6zj57+5x88ckKdBAP/Epo5lfGG+DjHfPCHhA9Qvz+jLyyvGFLhrO6PB3g3FDgdcEXG+iv6ci7JtOU3/O1zhHl8qWnralg6W9Y2+AlyXFyOHl6SYHpDdYGAUFair3yEISZ+cpYmNFi+k5gnt6sdZSQ9jA0eCCC4nVt13+Lqc7/Ki7grdXy6v5cv+CiB1i36vdlKAnaAml1EK9urt0B7nTXNTCCkEZmZNQJ3UuTrhVahPEC/0NFFbhaxqBtRWoJ3oL8VWrMpx4rCx6s8ymF242PcYZUsumW3AxcH3vF4y140NoOHRjEXhhTXVuIEbCgSKWzHeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 13:30:11 +0000
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243]) by DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 13:30:00 +0000
From: Robby Cai <robby.cai@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/2] dt-bindings: regulator: fp9931: Make vin-supply property as required
Date: Fri, 13 Mar 2026 21:31:01 +0800
Message-Id: <20260313133102.2749890-2-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313133102.2749890-1-robby.cai@nxp.com>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DBBPR04MB7819.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7819:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eac91cf-c9d5-4819-804c-08de81049f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c9nqSP6jJYhyrHg9a9ynfm8eeAOtMys2hEVYVNXa766l0ubhePqqeGN7nuXLsnsfX8vn4oLxAjE9xqikteJxTXxqjoSmfduane4VglPUcrV4VJWQ3qcgkGVzblH1+zFq4xVzDdMIn3BRsMoehUZHphc49ghC9SEXR4+v1hl4KeC7Qrr7PO+IqoF+AE0AHczloRyOkwFtnfGIKNO2N1BjYD/1b4k4Q0zp1Xox4j+g42RDseY88z+V4pQMT25dp59S2ipQXDJIkuY7TXSnhqJetZhZpTPY4zL9+smXvyDU0KwkZOYJdbjVQ1viBR60q22h7UG1RrFDz+Kx14ziaSpX3WdNnUyfdwPJFNoPf+jTkdCeiVFOkT7Y5DsoiKqQ/dN1NDkTxA0JxSDjf5dnzkxxhbM42KYM4XpkLpUPpfCpY1AyL6sWu0mG84kI3vuCqysvctZf7fukgWcPjuhTTEUlnkx/xpTdhdDus5yu8DLwBW+AbSX92nazAprOwa4TjdZhgHdidHL52afoVof3CqqlGNMiKw/HrdJZy1Zu4yOPqg0c2xOaSpof8/gh5yhWoH9T7Q/U160v3ZLKvaPIrtspzjVekf8fAox1diw/6IKOPH5lD2A+08shibQrD1do0B+0aH9GzOWTYXNFQOKb/jI+kKiqEGw4n1jKMXmGDY0eGOEEBPT3QzfzpJTBF3nLdXSe93GTBdb3/RXx3LqK4xRDfuD+n4bqHOvAu5AKnRhHbvTq59+6d65OGAIlIl/teXFl8PnAguIDvU9xuRNuwwiWLVjqlpzhm7QVmZJAKnqRVu8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7819.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFHWZl3nBRZFaIhUr9rvi6tsaKksg1HJ5uMwIO0yIZmBKcWnBORvr4hTgHsJ?=
 =?us-ascii?Q?cgRMhYPEGMpizhcceq6BSgRoESOOUUrgdj/V+8NPe5OmOCOGreMhBO/AY+xV?=
 =?us-ascii?Q?fUpWuO/o/XcMBfSmaR0MGWnhGxaEEksEmOGZv1kzSMFjMLumTfUFKeb/GjtI?=
 =?us-ascii?Q?c08UzU0356AiscCc8flYLx3JEQbI9vlGgWf7hFcK13s0DnJRq33/89jKz1sT?=
 =?us-ascii?Q?8syWTo1IIlgig7pn7OZSrKgIhWQDmbYi/Vd6NtOguUsc7+k/vf1LYHwhbY0l?=
 =?us-ascii?Q?z5mZCgEQ8FTC8JkoeP1AV/QaOeSXHZeipDC46IFbO+rQ6KY/FpKK4rRQX1Zi?=
 =?us-ascii?Q?v4IF/dp+nMalv6VPH8RFZ4V8wI7/9+UVj2RwGZGTbJpTXRyTPGbKdaFGrh1U?=
 =?us-ascii?Q?JSZ48sepcd5bpz4aOwqJ63XEN7UwOhmeqlrwNEMvsNSMqH5xFqhjW98QwXnc?=
 =?us-ascii?Q?oS/9t52B4hiYtxz/YPq1oLmC7v03cuVQ0iXQwB5zE4ZO2scy9xblln0V0faR?=
 =?us-ascii?Q?AClWHUOgPTkLGCFzH0vazQLOZ2CkcybIc81MkKO9eGyqOZ+nh689AfroAOMo?=
 =?us-ascii?Q?GwIl0i9/cRKgj/V9Ju49P+IahBnFLvy/3kOKDC0u5R/DAh7ZnIGanUyozMf5?=
 =?us-ascii?Q?vGTNrqOiOgKzNLtXAAbMMZdc9J9KWXhgV1MvTYl3vZVn8ROdIQP+TFNsY8Fa?=
 =?us-ascii?Q?koyJ5luHrnu8hjjgCahD1QaBW4U4NlR7jvEMnmSGAKlUvI3+Ch2xDTkw3kXq?=
 =?us-ascii?Q?2Y4qsPezjEoDooHfCrbFm/ZZOP2MkqEttvnXojJ6IrjRkaAOjc8lc0qxc30O?=
 =?us-ascii?Q?eJK+ufYFAwdZIGKI857MOV3xm63PKOvi5+jX+csqoQEgxqTTHnLwHrQmZaWM?=
 =?us-ascii?Q?/ICUiahVFfvyHINSh8i83pjs7iDlKy9mlJneIHpdzwK7sqTvJiOYoUYU8sVG?=
 =?us-ascii?Q?zxL+qp6X7/AF/M68MuSxihiwxxJM79ou3+z24cAQqLgCYL6YNZqhba2Zl+SV?=
 =?us-ascii?Q?TJ4OMAAep5IQunYay1Zuoh/lscnt7lb6HZlA2OXxyFYldJ+16vPexfulngUN?=
 =?us-ascii?Q?hc51a5IIbcumEBODPagN3dSKbzJssy3WWurhvzyWhYXVOagp2KIL6aoZ57Ra?=
 =?us-ascii?Q?czeep2Mvt3v2COP8X8GJdE6lwmpiw9PYl8ICN3SoapULB8xJpTC1OyICfIuj?=
 =?us-ascii?Q?CdZ42CyljIpLVFzHKZPrBnEtskULbJ0sOAU0gnMkiFnKh5U1O6e+xcMo9CBN?=
 =?us-ascii?Q?dHl1i9VygcjzL8LxsWzpReCQW91dxL2dDqxiTohgGXW51QzdapyxNKvnEOeC?=
 =?us-ascii?Q?neqt/a5cMgXDyEhfJb7qPtqpqAwUBmb50CJ7U6Rk32NncnHd2dM4lzOrA00O?=
 =?us-ascii?Q?s1aalN4pT6qIKxAZmxCt/H/NlQDoB1n7wodg9XiKqfqPj6jhv2LCr7gGodXw?=
 =?us-ascii?Q?OKZNL1UtTuFYMYLiAX6Q0iGGv+afPxvWMuOXmp5F4EtrlWWhyezh6RUrucXL?=
 =?us-ascii?Q?FCMVg9mKzOSl5sksJha5PI+KOR+oQYtMw70Q8yuBiE6/6gmHjoFg33Nzu8Bs?=
 =?us-ascii?Q?gp+Y3vYZGzwtwvq5yvqVLIPHkfYsHPmCnr8WPTLrIGh+edRpkmwaVc9NbwRN?=
 =?us-ascii?Q?amtUST0EhUhJ5r30HNn5bf/dgedYceydmR4FqEBwPGzOeDfEb5Dd9zImJfYk?=
 =?us-ascii?Q?mo/3dyI0ZpUeKM1c8Lqch6eaS6oDFJ4b4S9ESiZS7QSBPUDke8bPTqxezORM?=
 =?us-ascii?Q?OGkx8GK2cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eac91cf-c9d5-4819-804c-08de81049f8c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7819.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:29:59.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhfKafCfoKjfCW58o04nX1rvSJa2AeF1zzMI0bt0Q4PXp4ZDqoEtFkF6sULWJolWVrt7LBxMV7nT+fgtFJqeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

The FP9931 requires a vin power supply to operate, so mark vin-supply as
a required property in the binding.

Fixes: 80bbdefdfb417 ("dt-bindings: regulator: Add Fitipower FP9931/JD9930")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 .../devicetree/bindings/regulator/fitipower,fp9931.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml b/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml
index c6585e3bacbec..00d66b9230475 100644
--- a/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml
+++ b/Documentation/devicetree/bindings/regulator/fitipower,fp9931.yaml
@@ -66,6 +66,7 @@ properties:
 required:
   - compatible
   - reg
+  - vin-supply
   - pg-gpios
   - enable-gpios
 
-- 
2.37.1

