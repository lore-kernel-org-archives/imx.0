Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E0332EDD
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333204; cv=fail; b=HD3YqaXrQe1EUYQQjqDJzcreGIFLMuJ6PCleOnfMC7KaJSh17dt8Nky9I675kTU35L5H08764ht3kSnSP+SkBuQY5lUxRn3B85cnA7R5CiXYP/MAfsqZQFDKm2HCg7TfGJqo8nB84W6ZtRAYz6qq1RL33gRvTfr59gpXrdt46P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333204; c=relaxed/simple;
	bh=zH7Z2ZhowapiHc6myVJ22txCXplMjk3tjaDmnggaSwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fve3zGPzyUNMpVnoJS7ywyo1rpJxWWwlY9n1R3s9EfnzzKMxahy6w8qSLhWScZnx2q+OsM3wIjNMnr88zdk5AbWAcrpzRA0xpEAqLh8nZOpoqgj0zMqs6x1BiRbInzMglm6x0DP8sBP45lrek7YHx6KK9NfxKkajSZwH6nAQYws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=O3U/TqRB; arc=fail smtp.client-ip=52.101.46.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="O3U/TqRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thwcWbKs7G7gpirSy0U2t5mXtKKtQicmTTOAEKLw2hJ3lnKFRxzveCkKKexJsdGjKOjfPr5sT3aY3kpiZ1lkOsSQ9DmWpgpegQ4f4tg/Lb1lYEspyhRnVN679DYJ4mo1cw5RO6z9Inazo3uoiWEf6wkibz9JZYvuq5lhPguXQGzqTku+X56S/W+of4qsvqKVQQWJoZEb6eeiRqzXygz0bzWfjY/Z+mmdkJaWTy05ERbKHqudKoRWARHMpLEIhIxeG6llq9ohtaGAWsw0XSw8UK0v10WXtgU81XQRHXptPRI/vkrxTSIfG/KWnqC3EkKjk0m9b28mTNAvzBmgowhotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3OR6/EXxYEZnYWebb1opRXAJi/f0pCvukd/4Hhuiq0=;
 b=LgbzcnwaU0VxEegKo7OQq0tF6GJRv9RHB9zxUjTvxRYgbyZHcA+lwTYwwmCuumesRALqKAa7wyGENMXq+u+ylJxPpvuvZnl+dAtzt2RhpZ1AnZw2655KxPIT27hlu0yvtcF2CCBBcwTntdVhpRzxvnIaFyUasyYyvX4zRTpUAlzsmWP5TKAh3kAnOf46VpD0wiB1sW5lmjQpaJw+Hds+VqtZsg5A9oszNe44lIqqHglsi4k/hnYgu+12mwwfyedsUsCNFBrAP7Q/lYhTC94gFzcq/sEKGURTnP3ohRavqpZ1iEYwxZOvPDdqcvz3DFy7KkoZ9KpFl/NPLMpNQqIw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3OR6/EXxYEZnYWebb1opRXAJi/f0pCvukd/4Hhuiq0=;
 b=O3U/TqRBnzvwv4fbHUsUnKT7GKP5/5I//xlChDqZrgPc5DzI7IEXLDDzRFZqQoVr7mB4A4HaRe3h7RwbXCyp1IgT0fOqBdgj8vr86/+capExk8lP998CWeFgwvCrK+V3oBGF/0WXGJsuACxShWxq37F9IfkqEYhmyLan2uQu8ZHmOiOKuT7kMID+BuI0MyujObt69Co4Xoegfq2kCA6SNx5YnzkcXSg8nGKfYcTENG8ioULBUNHtLyiPWKaFgDmrz0yiF08DlM2LtakH96Hwx3mhdsILNP5U/0S+iebnbkJlXUFO9aYpXJ7Tn+DWOBO/m3ty6lJLJ08teVR3mEq9hA==
Received: from SJ0PR03CA0079.namprd03.prod.outlook.com (2603:10b6:a03:331::24)
 by SJ4PPF5488850B4.namprd22.prod.outlook.com (2603:10b6:a0f:fc02::fa1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 17 Feb
 2026 12:59:59 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::58) by SJ0PR03CA0079.outlook.office365.com
 (2603:10b6:a03:331::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 12:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 220CCE8F41;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: imx: {bx50v3,b850v3}: Update device trees
Date: Tue, 17 Feb 2026 14:59:47 +0200
Message-ID: <20260217125952.53997-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SJ4PPF5488850B4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b983384a-2359-4610-8984-08de6e24745b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RyNtL/O6TE1EJV5i2h6gzElrU/IlK3i0iITHiOgv8mbPes8sOPw1PhaiE1pc?=
 =?us-ascii?Q?X0NeFSSE8vcots5DdnVsYCE6c8h41uFsiF5yhBRElS9Y1iFbiMswlu2iVwN+?=
 =?us-ascii?Q?QzuFw5o3Ck+4bNM/8g2lxdJU4r0j6AvGY51lKgkdrCVocX8wmyybkMqyNguY?=
 =?us-ascii?Q?N+1uh4F3u/VSPaa4EM5lWCadYaYOCX8edAZjzW8kDZ2kHBdfT1SSnkUCb94c?=
 =?us-ascii?Q?VM/JMsVFxllyOSjQ45J+b3cIPeCu1yYAInYLUeXf84/kRLj1HM0eL6hH+sXC?=
 =?us-ascii?Q?pDtmihZ1JQtDsfK1SSsC0g1uFK8Rebr8/7R9NmDoAIPZWw8g5+6QG8ixR9yu?=
 =?us-ascii?Q?OyHHXQQ9eCcogkPxJljrKxUggCcubl4htOwuRPEUaTu+VLAMvHAVot55NqNB?=
 =?us-ascii?Q?OMecxM/nhug0S8Kwb3OfzM7xK+nLuJNus/Z+WIbhIyehTZBiQHTTVl5RZcwN?=
 =?us-ascii?Q?LY1rsuPOqQa64f4MAGJCOVCFC1JR9WyZXbph8pnzkgqDCEnn+g0OJ6olie9o?=
 =?us-ascii?Q?2rfCowHGuk7md8NpCLhwxqhw5Zx9FHUv/EQP2bnVSOt3tAnvva4kB6+doSvQ?=
 =?us-ascii?Q?lqPKOlE95oipJXTyxjRJtMt5nNE7iCG89ofNXvqIFtpH5kR+M1qGMtRS15nh?=
 =?us-ascii?Q?4Mr1/84rXvKx+fVrUEzGAEoFT4b+KlSH9lSOA7BvD2vjVHcJiosZZ8AtpPbK?=
 =?us-ascii?Q?2A9YTUYFyVq55B+JIK8JeRRI4msuPCdUbF3bxPzZO/AcwBd1LGpzbF+0Rxqr?=
 =?us-ascii?Q?m3Vdadw1hB4rYtEZqLgk8D58SYhi+h5dYrzBs6BfEkh/OTpUUAwu+4rwKips?=
 =?us-ascii?Q?VB3vNUCNkkncPK+cnIAsvzdal1/fWbWg8QZwV5kgc6QTr+UPzj1Srg4c5tsM?=
 =?us-ascii?Q?Jh5PWHdCxUddB49Hdn8J94qR1+zaRqQlrqw6w97GBe3c7ce1mHPxdoRFc28n?=
 =?us-ascii?Q?DIXL5Vh2NXdAyy5lLpKy37MRtLNkGDr34Mggfiffi2XekE5njLZPgnZYEHps?=
 =?us-ascii?Q?i9JKWtfSV/bKWXPYhyE+IwVT9GYU3qluhcmCaNHlYUtYoDpsKECaiMmUl5nr?=
 =?us-ascii?Q?urOprLimDbg2/QNw5mGyqNZqypOfM0zRhl254Cr32Hga6DaejQR/pAeI0Ffn?=
 =?us-ascii?Q?aEaClpiXRWJjN+H3hGUkSPscpkkF1t43B2PUjc43AYxTBuTol6ie3rqmB3rd?=
 =?us-ascii?Q?KG/2ruK+BB4WK6/IUredvkkJ9yqr3waVox6iquj8behi3LlF5qgcSGVHmY5m?=
 =?us-ascii?Q?u4JznW/ngc9XOG5OzR3rh1o++xb3puAgjl8c45+sx8i6Xwvo6SIbl3c2t6a6?=
 =?us-ascii?Q?mqxO2RuWxyASAGKNjK1o/kLw/zasjUjFP6+KdhGNNe3eb+H9k/IbEA/SjTqF?=
 =?us-ascii?Q?KbwLcLKC1VL6Y/OkrZ4FZkx9QPwnbbkmv31AXxVC7kGUZhDAB51D4JU+mZzT?=
 =?us-ascii?Q?lmarN1Gxh3/qwHQuqEgkULGV9wPVYEo+dzmnhoIj93bCRvYir4rV1ZAaBvQN?=
 =?us-ascii?Q?fdBP3onNME7pyWJns/2RIU8rE+dBkOXDhueejmW+VanPyQWiHDQBub1Wg6rq?=
 =?us-ascii?Q?YEtTBvPvgCk8IlE6QmG/tjZh8zmkRXTX3YJIZfPjv5Xgj6DDaO3rBJ8WFnLd?=
 =?us-ascii?Q?8UkwQPPBud5WuZ0v8rfN/0r5YdNeDh1qtKu29gQvolJLXPqDPCJVzMaMjWnb?=
 =?us-ascii?Q?QpfZlw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pUb7RV7PQOyhY6JsWqn2rakq9FbvHP7oD5lFgB596D2lP7YagsDbC4ljySqB5VfYVRdA084f+DZFMhna6k0SQmPz1dCdG8QlQu7tYO1W/CQ759ltm9F+rrmV2iF+GT+N7W2WCFFth/UFqejdS5+2M8G9M+MUbtIcZe6tTrsbsUzCrMZxMqoBEPbVhJMVOGwG6FTb/28fX5m+V9XBT1jpsYEvUvV1iBuyjtJeHTrV4epTNcqDeJGBdMvuxh9WxBnd0rbYsqpAHGO83tUSRe0NpRzPOMqEP5538PZ6qg0trmiBYY2IXhYYUokm6VhLyV8Ku2yM/gUXIhSZlV4/2sDgHWAcrobM9tDY8ptOpuQ1MRy/856dqs7OuNN+hTzHK8AudnKqWdTkf49aic+igyB8aiSysaqrrbpXDVORO6pyu+8jv9jCzVPq7iSW/Aov0716
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.1118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b983384a-2359-4610-8984-08de6e24745b
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF5488850B4

Configure PHY speed and mode.
Configure b850v3 gpio4 line name.
Disable b850v3 usdhc4 interface.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Ian Ray (4):
  ARM: dts: imx: bx50v3: Configure switch PHY max-speed
  ARM: dts: imx: bx50v3: Configure phy-mode
  ARM: dts: imx: b850v3: Define GPIO line names
  ARM: dts: imx: b850v3: Disable usdhc4

 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts  | 17 +++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi |  4 ++++
 4 files changed, 23 insertions(+)

-- 
2.49.0

