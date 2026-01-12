Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE723587B8
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223345; cv=fail; b=mLyMDoc5YvosXTCBbfvaDz8uo+6IKaTCjaSde/oJmzGWqLUdMJoTMKVErwDNQDTAsjkGFJySOzmsadXKgre1cfRgwferRS0cVXZBKag2fcb0WmUTg73j52aItOtN7Gkbf7YB77CsGjYzISkOxTR8plq/C1fIFc+ldrHFOBLlZrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223345; c=relaxed/simple;
	bh=6ilqO8WzrwxgcSRRgxQibGOOKms6pZyXJ/QYcExUim4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tmW4AjUzYZf9AmAdWJfZAKqGmsUVR9n5rLr7orti9m+TUIymkgFJpWSXozePZvnCZZtX561FwJAoNuPrpfIz/1IJH8tQME3VhJMyRWmJSMVmb7KIFpR/N0yuxSQAeF2Ae9sQiWLAdEEt0LUW6L+6GE9tohL0kVIMtAUqOZTwUaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Pl78TWWt; arc=fail smtp.client-ip=40.107.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Pl78TWWt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/BBbYJQGfazak5lpyWaWrsKmMdhtPbI3U5NwgLspJI8REpEpMCnDFS/dVBzkoScXTJRFSCe4UFcPoCS0a/PLsC89VXZNDWllGOB1t/64q7J7ZvJNFIdgOV3FQuk8pbpHF9paN6afeGHPtaF2rQJLMjMSRd6L1RanmLzCoJP49bGnijVsWutslvbtbkvE5YoigDcpktIKOBzgW2yVV6NSObWOpmkZRIUaFawK7xZCaL01VTniDLdgZ1ZqCiJluM6hk+jqCpSW9AXxRr3I+8myU+Gw9dI6d1elMOQkKlaNu1LRmiXfHwdjcReqmOP0WciaHfWZNBfdBNB5ohdZulgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=AKLYRjxAtccZcAPOBjsKJno4O+Ds1r05fXcRkKxG01g/WPiLQyGWI3x1nBvpi8pG1oTbFpL3LhmKirqyv4yweUQ5R5NdNzteLtttTa4fF7peb5WK3Ct7xyqybGGq2X4COt8Ff7PhuWnHhLJ9cEdTxztdtnZ0x/vJGVJnBjmKZ0TCWg1qNNbFMw513Vk5qGJY4pfwAx2robOIGe32ffiPAjVCiyg6riPWlPxO+0EmI1S+TzCu63McDuoRTMKUNUmHLeKvc+Xn6UKpB+uBT74fbZGRGqXwhnU3W8yjDQkKKjc6vje6ysyg0yGq2H9qMWJJMNhc3uqL6uUrNFAnXw56Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=Pl78TWWtpJvrhKT682dBGI6uF6ueTgSK/+13O0MfKe+ZhAoMReMyrwoerZiCLW3/sWDg9G03UnKkt78wdzLnEjS53wixI5ezb6cUXUC1GJOR7GqoJ+Nh7a82hxB2lyeIm5urPCswwqTprJ0zabmprNp0D69IeTxZ2vyDiM2IxUCBmTrVwbZz0H/oBxK9LujQv4AaEV81QnjrWIzJ1xT0NzFsXJLBStQEjLCusIqXedPF4gT/H9VxdLVMtkEPo8bOctv91H8A5TMy+c9OOKFtUalYrHv+iZh/T2OOXVkGchIt1X2X1ovUIppLoveLjMzyBDXLNS4M3xlaXaQ+/efUDQ==
Received: from SA1P222CA0133.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::18)
 by SJ2PR22MB4760.namprd22.prod.outlook.com (2603:10b6:a03:591::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:58 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::89) by SA1P222CA0133.outlook.office365.com
 (2603:10b6:806:3c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:58 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id C8BD3F2E6C;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
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
Subject: [PATCH v2 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 12 Jan 2026 15:08:47 +0200
Message-Id: <20260112130849.3748465-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SJ2PR22MB4760:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60ac2c2b-9709-4e0e-f582-08de51dbbf79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sN1BnWX+pfCQwitIiZRCNeaU1XJQwHZTo1hgrci1NUOZ+wkIgrsAn2HWkAr/?=
 =?us-ascii?Q?ORShaJFnG5Qgn21le1kET3pxDogceb7CgdJKvuR+VUu4wuco0tfmeW5IcbWp?=
 =?us-ascii?Q?SV2iBCoBzk1lP1+J9y/keaicngoSC8cTRuOXBKEO6j/UifRb/BJuP2pqSKcj?=
 =?us-ascii?Q?kqJJD9eqZ40T/wV+X5pKa4q++pIbxTYz9pmt/Yqpzfzn+4T7wObbrKTSNfpi?=
 =?us-ascii?Q?NbsESrzR21+OcCFsnRmBPzPan7OUjjkFsb5ZGRH7r9/0FnChZnZKqq6CV9ST?=
 =?us-ascii?Q?uc9AJfso5rEzxAq3YYblF0YVd5AXCeB3x9tVTh/aD63kxuWg3RtAEdC5Y1E1?=
 =?us-ascii?Q?RqNLusmHTtx6r+s+ZJiavpUogJos69msQA5tEMEzhwgCJLf4NRGa/P0zDJqd?=
 =?us-ascii?Q?xso2HyOg8EGVMPi4HpqLK3XA2rG7aHKgxNkiONaRBly8fiINQkNDCMQ8QEnd?=
 =?us-ascii?Q?EPIRV4R3N66jk4jsmO8NAxlB9Q3N41LDDCgsGOI+vw9LdIYWRVaJQKSoENxm?=
 =?us-ascii?Q?S4wnBiU2zi96wtq2bi/ieLWb9ZrOmsHuyhnvdbTucMidvqnKIdaVEN9kwxQr?=
 =?us-ascii?Q?u7B+P79XpfyeeLob3mYPVHcmcqNX8PXf3znp/Az0uQZWQkZLP4wlffNWxv0R?=
 =?us-ascii?Q?Wqc7jpCTw0/17tRwXOPz0FbbEOpoxkREkJil0pNYmHuMPF/CHgBDnyi1RP+X?=
 =?us-ascii?Q?qtKq7rzdO94iE9tmHERdnWj0VxTLWQQ5Au1/O6z4J5hk2/8rDbVCE0r385L4?=
 =?us-ascii?Q?LdT4sxkSQYNSEGKIxk3Qy8ZMUki1zhob/LzkxXwVL8t0qgxrvlUijstLicD2?=
 =?us-ascii?Q?BMkmCSW96VLSUiio+Q6GeAg/mps5fvrXtPKKStGRUFNFRQerRKoQXQBzFnbY?=
 =?us-ascii?Q?gsuM9zlZGs8dauUOAPPvqU15z9yMAbIiqHZIGpiaap/+7hQG5XmHQCCGZOC3?=
 =?us-ascii?Q?7Tl1BE3aHOTVURDdKm2bbcloGUghg/9S2HJEk0IYmR1UCfAPsFVNvmX6ZGlw?=
 =?us-ascii?Q?xakvh/HVUoRsuAl8G9ypJashQL1uD/kS3Jr/J6oLjvHM9eTwIaj1hP2XZ70j?=
 =?us-ascii?Q?/aorQyMK9l5kBmUfybJci/k+dGohRKc3VIBvkAu95YBMsHNp2LBQB8jin1as?=
 =?us-ascii?Q?PAUx3IKrMOfNOYjb9UtdhsY4QOhaqMTCozFqTzVqcHC3ieiB7ZYNFn9BPXzR?=
 =?us-ascii?Q?U7ELvGqXXQbk5+yquWmRD1adsezFZuUkCTHEKGbwbS/tfzEO4RdBJ9Y/LF7l?=
 =?us-ascii?Q?p6J1FNh9lDBZbJrGJUNtaVW1q65y5stJYJqqN0UGlpifzEM0PnMFv9J4UOvF?=
 =?us-ascii?Q?vUbAZGITu7lbLOvmzgSFA95JmZGEN0wAESYSAjGJXr3YOwJWagmLLmSQqn0D?=
 =?us-ascii?Q?euQIbliCjAGMG56yt1jhhcuVcev/EosmLKc/nBqBBu+gWrRiuODSIkHO+DuR?=
 =?us-ascii?Q?S8E+BrUptfvWAqoOqV+Hf106Wgxyjy/A5Rbcp2Puhz6sn5ogcjApaQuZ5xNy?=
 =?us-ascii?Q?oBfhBVWCuUq0O0N4vBz7Exri8IAxp0eMFPDu7HjPtWwZT6BPk6vCTdaBkpg9?=
 =?us-ascii?Q?YdeH/SwahGvWVcFEDhs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:58.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ac2c2b-9709-4e0e-f582-08de51dbbf79
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB4760

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.


Changes in V2:
-------------
- Order the dt-bindings commit before using it.
- Small documentation update.


Nandor Han (2):
  dt-bindings: watchdog: fsl-imx: document continue in low power mode
  watchdog: imx2_wdt: Allow to continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5

