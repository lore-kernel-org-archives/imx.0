Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064E329E73
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019815; cv=fail; b=o0x4B8sUSYlLMHv1XK97iAgC0zzgp1yDWJntSS9nze2LS044hqQi6bg+aTyb9JFVT1b/7Kvmq50B90OwfLNAZW7ED7m1NYrcd+q72XE9lBM2/aekHT9pQkDt/YYaz6wqoamswGKfyiyNJle1zM2MUv41FBJpeRuCLYJ6AM4fS34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019815; c=relaxed/simple;
	bh=rS/dSO2ti+YYBFE33QP5JwZ2hZ7NUIaEzdnDcblrEkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=msFzizaaDf5vT9NYvHblCnugyVqVASIRRnm57G/VWTpPoo/7hZ+i9HUi37/4VFlST0e71N9x5PGLiH1hNopmcv9d2mYdLbdl0PcVg5NJcQQj7/QFwZm/HKGS82Rz721BXX0R0KQjHv85RPzB8BNOjtNH19GrQk3y/oucvFIP8Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=fkcsQtzX; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="fkcsQtzX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL/yFHXEZQzYw6GenbNBR+/2GZ5HWkA+AE4AaRUlLCbBuYi2Xwoxi5Aocd9IZc0tgmjWg6R7PQ4bfzwI4+2HKBia4f1vIV/H1merP8mWVdAu75HuIj4U65rbGmll39szawc9SBYXxbHn2xXMVkXHUnhkhtUxQnkV1YTkL9o5cfN2W/LDM9JmbmqKxTCGFE3sQN6j+8nTBeo42NDyVUOrxQu4vJb2qGAIUAGyoRl4lX2GdksCIsDZkeqwP3b+O0ibrYHCmBPJUOpwfMPFwvSeoiJkgGSV3bjgKI8YR8//CO9rEngqbvBCTtqrT8mdh8GiXmrJoEoyezWiVnbNo9sCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=EuH/H96JGsRHAavCJ6J9/lBNjGkoSPxHch8SW4GMxMaHL3cL+EuIfdox5XdKGUaZCxXFcSvh0JpS0IGO+mlpi25qw3GJHD203LsbMOHwa2p2yMQBKvo1OmIlwW1IDsLRQfRcpPYY7UKKwG6j43Ga4S/B+KcmeCx2vldvNcU6M9PbdArquXFwEHo2zY4ZG7b46oxY9GYM35ncccNbG4uo6z++ewja7EPXFKjngTH1vEE5yqn3z0aCwv2ck81USGMaoxYDlW7BFqcW4X6KBxSU7rY1k+tZXk8xoT/0CWFYBo9rhXSoyj5ER2UToE9kVHYK4XIOmK9yE7Z2er7vgFFAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=fkcsQtzXN+22aNQv+s/YdY+k4ZJ0jGbsDgqXyYezQ5K07+euTqHBSBIZJERyTx4q+dA8c5ntbCcRGQAPRJyIFMfDKPk8DXMxpoNjtlqxT0CVqXE2ZDJJkcD5EIYb34UZFAtJr80vZAovk4CQ+bkrOoRnOnPiygQ/c4g9BSwtueU81cU9PonEZfFs2QH8Dxg+qNFskQCSti6Fa6YmaGEN9qP7glM0NS+4S77+hfd91mMeWaMdheclRz0N1pkg5mxuVwFYcokQWRTewTWyQqLVYxSo1/MjshpQuvlVIasJcOesrH7i/XYhvp6alXOykAella6f6dD2jTlm4fH+r4KNMw==
Received: from MW4PR03CA0277.namprd03.prod.outlook.com (2603:10b6:303:b5::12)
 by LV8PR22MB5947.namprd22.prod.outlook.com (2603:10b6:408:266::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::78) by MW4PR03CA0277.outlook.office365.com
 (2603:10b6:303:b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:06 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id DE835DBCE0;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 29 Dec 2025 16:49:58 +0200
Message-Id: <20251229145000.421426-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|LV8PR22MB5947:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2dad918b-185c-47dc-956d-08de46e98e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?67uxrotiw3tvc3QAYenB+kxkBc4ccL2TxB+60mrpqQLseZceTLiPFnNBPgb3?=
 =?us-ascii?Q?Hrji6jdtljHtZJ0kcA8Vvy2KhwZxWk9RJPJynbduYZQH7EKvsWDnz3wjxLYw?=
 =?us-ascii?Q?So2Lv4tPHROSTXqlp6bY8Sssa/kyrpm0aLmTxfa1GmObBqdO7nav5O7Z9OJD?=
 =?us-ascii?Q?H3vopAG/j+hD+x0QQVSXuhsQm6YgT5QU2/+x4LGNv9E5+F6s1VJGZa6T9Eg3?=
 =?us-ascii?Q?p633BOKx3Pr086oYWkOtSAjQGJsIejP9BNB6osLNHOnsbp9GEpRlZlTuOVlD?=
 =?us-ascii?Q?AnDSLLb8LKOXKd34o008l8yNWIFgvdK2xujxsQAh4Bbj81dUIl4UKLVDByfL?=
 =?us-ascii?Q?qVGrstFbACNwuAI6jk+UL708A40ZVl+j2EIdctxl5UmRcg6qdOq8UUDZOWJo?=
 =?us-ascii?Q?hqZeMoE9zRy7znNGbsap9P9mRMDFMBCXYna1lpecWHqcWZhd+1uEDnHW+tUN?=
 =?us-ascii?Q?9sEW9cl5ZpRxHBv8XbryiEgwLy/LPqrSWcnA7DwCeWUwroj/E/FEzEGrRTpn?=
 =?us-ascii?Q?fC0BWRoYMbq6hRa/iRzwnal5p/i9qCmx29BUdAwqlvu+fStVPwqaTcQq1P+6?=
 =?us-ascii?Q?abmlIuh/Q1WUHGijbceaI05ZRscJurpbHlYBKsE60KTaf2QKBIQHXTfmVA2Y?=
 =?us-ascii?Q?tgkmH8HfZG6GiunyhNNQSfLB4HSUHqZ92swLz+HwF8d1sqA9hKBLhobOlCWE?=
 =?us-ascii?Q?7rIOMa+bC1PRh65pEvLI9xRzoupY/NkRZlC/K7nHQR10XeSm3gOMxR/YYLD0?=
 =?us-ascii?Q?eplKhuwKeMFyod8I8LbS7i7rS7LO68az8UB9WXXhfevbor08VZo0hFyHB2fE?=
 =?us-ascii?Q?MDYqL1DT4vGh5eGzdwQtMS+Ypeda+bQ9LByFg4BVsIvr9RQcM+qrJQ+B0mJu?=
 =?us-ascii?Q?pDOOTK1g7K22G9swL+R5zacyHiOokp8AQqf7ZCVedraWsjmIC5j0NZsjhWFg?=
 =?us-ascii?Q?ormMvYbsxNm/BZYeciGfk2PJcJI3G5InXfLFvs2dS4qRV9dnDep86wAJc8e0?=
 =?us-ascii?Q?UvniLuTSqsSj6Fw+I8aiwU6S8jt0VknIAbjrYjS543NVzLqv06WQCQ8F9mOV?=
 =?us-ascii?Q?epW199De9DABhIEp+nyxT7cfr6ChylxZN6OD6d4OuJMIzdKPvM7l+I3PT05U?=
 =?us-ascii?Q?BIlyKQoiMgX9UHHeSg+aZo3bZYQ9TO0p3PRKLfdWFLseAq35MwY0oTi3TXTB?=
 =?us-ascii?Q?EjYIdEU/r7jweppJsqkhUr7mZcTnV60tHI0Zu7xSLYnzbZ77gPRlM+j4BH37?=
 =?us-ascii?Q?d3JcEFeTkWiMX1pZPAOJOceLlZqRNL8sAO3FYzIapws8ERiX0U+w4AiG0DQs?=
 =?us-ascii?Q?oVrIQ/11QP28PEbz5FK854zwG1YUIdaNY90dxt0unTr7IzElDg8u3CGsfjLx?=
 =?us-ascii?Q?qpEjPEV52QmtTNvt4vNrTUN4R+804/vhmj48GYIpekqY1NPwWF7EJFXs58Np?=
 =?us-ascii?Q?yb+QcjJRsoa4e6PPSv9QRx5+TbE46jbv20hwXQevHTqdry99elFY5YpjXiN0?=
 =?us-ascii?Q?yiiEqEWUZ1FjiCLEP17FTUkbKYmKP3gK2L+j6MNCFa9b5Ct/cFSocm7yarzy?=
 =?us-ascii?Q?FuDmcd9h9zGhT40EV7s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:06.1461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dad918b-185c-47dc-956d-08de46e98e6a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5947

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.

Nandor Han (2):
  watchdog: imx2_wdt: Allow to continue in low power mode
  dt-bindings: watchdog: fsl-imx: document continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5

