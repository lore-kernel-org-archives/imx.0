Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D036329C5D
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019812; cv=fail; b=SgkLNFdc8ef+8Um06T1ykhzD3KWK+kSHoM4dFbLFaKOKJApmpA1yl0cT6pz9vBhtNuLJrn9dmuZm7H1S1zmD3Kp3Rw8rqNUFk/MpnW2gemn9YN6d5xZN+E1NvjPzq6niPBzkuCtDAzSPz/Eu1+STmWZMG0P5kavar9DHtbUcDXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019812; c=relaxed/simple;
	bh=C/sAl7VPwfUTkSjWIxafMI5oZk3+fb31sg3EEZM1Rpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YNISUavCGG2c0VrpSk712n4VdfcVjBaphoc9v++u0l3AVcCCaofI9oNuTXWWCemUS0+LiyNFsEeLaIUZic5YmNt4FW7I3FlIq0b8C0vvlJSnnDFGeD11zEVRKuNI2u55cSRF2/icFHDT6MHDajMoXaa4Era8A0ANv8neMLGqfAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=WfZytKG6; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="WfZytKG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neGY9ZaTXfKtHmgqK2NO/A4+/zLvEeJQoMt5D1ALM2wZSL0qgUz+wKkLfDNlNfy0O4qmW6imExRj3NHIxSNj7Zpp2jb86TGwJVlVXfi9JsjKWOr8lN5tDfJX9nc5O8JkhaEEOUX66wzOIpLXq6ohd6v7WGZ5Qiz+PzN6SaUq4HiRjM0w54L/8DhqO+kb7TR37E87nOAxN4ybhp24K3oTSoIpTFowr0KDYJfuzTorPkLzGpdVugxFcyVnXMkzf1hf1k1lHc7N7BAMpuwvmy/ChgohOHGr/hc7uYsFkqEmr+3xuaK2Z5shVNXpfKCoXMyT6zzY1KcTbzVDOJ55JvCbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=O1nyGmXLrLZ2zoUaW9MStwzqixASRqqjKZ7rZKkbSZeyCsz9d9bbngc9WcWIBGvnAz0++BaAkVo1nBEDKHYEpeu6k5sV+MjIgel+2yyu/pwxyVEdX8Yx7uMvU1X4fifRzSiZTGK9a2E9l3TniMt5B2P2HpEzNYUBS8rvUrVCAl0LI4H1Qx67xuOkodgVFV/92B0KiSLC/XhUqESNipgi1dHkcb+HXKQy/+P+9fVyE/F1e7Wwsi9wuWxKbok+mSLJ/YcAWPS6w0lkGnXzOtssqezyuUdLt+onKWhPDpJU6OA97TpKli4vaPXM73jyFAZbaxhOOUz05Dl7r1u3Sgg6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=WfZytKG6vqYhfXxQ2wQy3VlL9oiuIXe56wkmDXoeRUFcpqeEtzkkuXz/7Q891mZ+6dyEKj5+ZErRzMiBwkXyjqhjrjjtoKKvvxLkZs6zCmo3YR3ODfjqG8C0Os02GFYWPrqqC4ZxFIKwFZp3E9SVD0BtPhPRcwlkXbJ9uIARmLtQ/0R7VFaMed8FeM5nOySj6MfreKoC8Drqe1Skt8Em9WLtVVKXNRQ/yeXdvvqRz9qEvDIp4EIfDSqy6S40EsV2sGRIa9o6kjZ/O/7fbBC0E8vevxLj9DAhuji/vK9v6pOa2RLBYCmdkOjWtUJKL7gy6OJmrvOyAmAoosOcj0eC3g==
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by CYYPR22MB4349.namprd22.prod.outlook.com (2603:10b6:930:cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::3c) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon,
 29 Dec 2025 14:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:06 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EA815F2E5C;
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
Subject: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 29 Dec 2025 16:50:00 +0200
Message-Id: <20251229145000.421426-3-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CYYPR22MB4349:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba0fce9d-472e-4d98-83cb-08de46e98ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bVQbyRBtJKjr/paoXcGnR92kF1BEHcKi1jlhNfdnx3PwyqeekA4bHigS9Nx?=
 =?us-ascii?Q?P6VDRbwVCnoEdAN7LQ8Kwfo2IZNV7zBNCnq0MxC58Nx+3mEwMho5T6ifNQiy?=
 =?us-ascii?Q?hi7jsTIAY+2qzC7XDssyYJVMeqy9ZHnZd7bL9ebHELwNbgl3DI+HVa/2gKzH?=
 =?us-ascii?Q?oofPBiGo3wCrYnYFnmnpJV8L/Bsd3CjZxoDzyVLr3GYmh84MHF1ZO+ZfyMgP?=
 =?us-ascii?Q?BoOSqYtem0rDx5MOd8uw6f1rHUiNvxP5Gdy/2iftjp9qJ+osMMm2ZEXBRDsi?=
 =?us-ascii?Q?VKNzTWd0JLaULrtTcagxoWEWMxWyeP3Ut+5RDiAG8CUcdjMDUM4uhsHMLyov?=
 =?us-ascii?Q?rLxUplmjr0wvM09JoLo0ndwmtxrFppvdt3OVqzeN/qUbx9vpm1qkdELwLADT?=
 =?us-ascii?Q?sJz5XI4ohS5eaBP64ZE/iNIzdhVcJjlxqLdXw3oTr4zEDDOJymyCA8P1IVTj?=
 =?us-ascii?Q?IakUXeb3dkvnSkJgFk5iFCyl10Vh3CV2IY/QbDQk2BkRPDL8YXzC9hMR3JFu?=
 =?us-ascii?Q?4NHGWYo5TpJZ8sUcmUc7gUae1W1FEZ/rUzr8WFvac/W9vYEcMN9xALaVePOt?=
 =?us-ascii?Q?CZ5OIy/qyFQqcAbzptLGGqDqLlaQNaNWqSAiRIR8wJrzgJXJbPGbcg3DJvYl?=
 =?us-ascii?Q?uXebBPhuBT7a8AWtLGnDYUu38Vl6FKxKCfGi7MzrQrRV1RX+loigDf1u04Dh?=
 =?us-ascii?Q?6XOyuvZ1ExAEBZiFEemldJZrabNCrKR83exfW+yqchAZizQLdv+QFKvkLgon?=
 =?us-ascii?Q?AbvN9Bayfhww58kI7VkGaisz3YgYG6x5f8pLDvQCPGshxGqB2Ul3BoHuXKyD?=
 =?us-ascii?Q?fGcAxZ1BGSwvSABeWHxpO8xhxgHMwK9Zj3qgbtQ+4i9sGV1Wisukf2DEouPO?=
 =?us-ascii?Q?yHnY037+W/f/zLMmoe+Pam9ZaWt3uWmtDbU+hcWcfsvVsNLt+AUir+9tBfJh?=
 =?us-ascii?Q?agMGNNIUxojhCPEkiJrYtHCfyyhnR/12lTahl63GducYCwIyQPkQqFeWi3jF?=
 =?us-ascii?Q?cXNzQ3wdQ1nD6ZQmzYJYcNtSNk3RDiD9DsVJqXENGWnjjPNSciwvLpknQPOn?=
 =?us-ascii?Q?Nr+pnePsAtXmQ5O1pDQvFRgGiys0YHams3kRIKYhvUBTihK0N3vmdYn1nGB9?=
 =?us-ascii?Q?nB7jJVXQ5cJwVQsh7ejru0W+/RtnkZ8Spl54mTVI2p06j0wP4aMRKJf2W+yS?=
 =?us-ascii?Q?iJo7oTbMAYuouzkQ4s4OO9GavaBkppXUFJJfnPW+qy5MdG23ixaAcGay2omc?=
 =?us-ascii?Q?PIxDiNZBIzD6c4r9tqoFNqilQ4cHPxP6smVBCW58E/68dOtYQbJsoC5XiM2w?=
 =?us-ascii?Q?/BoejTmh3/Fz53VzRMYpyi2Zp6aKzRd3UJ9wzljyoqGGgPPjiYD9Pr93JTCZ?=
 =?us-ascii?Q?/SRQ+ijppey6+xYulYdJ8f/WvvL4R1fBtjD991Zako2n/syLKvMR/yj6bHGI?=
 =?us-ascii?Q?lmsDaKtlM7E4RS0lKZAKIvIuh/b8vZO0yDfM+W1N7kYZMIG5BtI2+G3L4e7q?=
 =?us-ascii?Q?JcIY1rUvqciJ56YfFIA31dbukuELXD+FoKTz+HgxAo1uVntaqW8xKeEnW78r?=
 =?us-ascii?Q?QIY2nB+wwsYyCNOaK3k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:06.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0fce9d-472e-4d98-83cb-08de46e98ebd
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR22MB4349

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..4dd9cc81c926 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE). By default, the watchdog is suspended in these modes.
+
 required:
   - compatible
   - interrupts
-- 
2.39.5

