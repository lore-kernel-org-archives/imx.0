Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795600213;
	b=ILsWsuH0T9GREVxoSV6hbEjIWeo9LZYZFCGzyUXKHDhqI7UdZaDNYktMvxrQzhmtCmne
	 tuQ8208RIQarwnFEDvIniXT1DZAoZ8418nOQ2fbrBUhx41H1yqnmdOCBts/R/Uu0IxqeJ
	 4/c17ni9j6f2b6lyFFmCX46BnznRwuevj1cbsQ7Psht95ZsXo/5DLI5CqH+GSRi1CVyYH
	 qOODSB/HAa8u58EklU3l26c4N2H3HJeUwE5ezj9xJQer+xA9dh5NdpRxHyfV4KYfSClc4
	 R+Oz7btx+K85DpvLs5wWNBu7WWoPLMZK4LUNrDkNAXKS1+MqcVZgke0Hh8/F5B85PFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600213;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sKGm3rsFxm4DxTktYnql5W4l+jGCBWi6/ZXAqiD6Cm8=;
	b=FdO3fpYVACjbnKWYzEcr6X/FC/LJEFHvlrAqPL5Dg4d6b6uPR5iZWmCbcihP9CtqNk89
	 N+YpHvNfrRe0lCpm7nnpmWQ8/VL6KrCfaVoNDQFA1SYhl8xohkvezRN3X5b0elsLKy4Xa
	 SJ/Mn1Lvd00kD3WV0sEiUD0IM10HcUShCMfDjOKYongBnEX7D68FRDOMyuzOlWzeIyaYn
	 OL2x83svrYbb+KhjBG9FqLhiCvQThnxEd9OFQf47lcj23rxWQgYAq3zxYvX8crmej0BTk
	 hfRXRtssU3Z/E0awaAWiwIO/r6N5McfHiUIvMFcPM6T/gA8ksLn17X44wBA+d3v77qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bshg.com;
	spf=pass smtp.mailfrom=bshg.com;
	dkim=pass header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=4ar5DsWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.4
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E68606A330
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E68606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bshg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bshg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=4ar5DsWT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBXVGFnXGjKRmWVVDuTDEtua5Q92VQIGjPFT791KCOG0WeZnfw9YokRa30ibg3W+diir/ru94HQnTf1wt7t8q5F8ZC7vZ2uuJtGioK7vBZmeSPnUeMVDGs7pyPNC3TExmXYqYIELz7BitN1Gs8IcTKktKmMe3iLZeDMV9r4wyrRN1k2nYj2Sb4tjyWufx/z4OixNwbblQNZ7L5zGjmRAe8yp/xoJkypH1wRb8ArsJecXQ91n9sEx2ALSmW8j1dOhOmuaOFl26dvAK8Z/hsN4elnnM3iRkM88Oj9UyO1JqLxgcnXylAX/UwAGvFhTphVocrtLyhMJWcx5UGtpd3xlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKGm3rsFxm4DxTktYnql5W4l+jGCBWi6/ZXAqiD6Cm8=;
 b=aF3nr1kCQ8+qc9PeqV7CVKj9HR+vuz8TX6afRLHpGTqWyre83U3V1vbGQdVySwRKLBGK6xjDgBCywilevjDVC8T5gHnwjnfxST5mkJUfvLChfsriDcvGv/i8MlzEL53VfW3iTG71TTi7msstluPeXVTRbreE6CHiTpnxmLcRwWZ2YKDKCreDmxiTVB0h5Fm2xUF7l8biPUvtSAwq3hzjaJWGCQ5EwNRRPZNi5+KujT2zyMVxQGUUTyHqH/vn4taIZIyC57Ygd0G/nUA+QiDCS0/MGA+J85wZDCnq6m4PddToB+gMYUrITwYakTtElhWv7ElrMQv/75uPzS31EtUrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=bshg.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=bshg.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bshg.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKGm3rsFxm4DxTktYnql5W4l+jGCBWi6/ZXAqiD6Cm8=;
 b=4ar5DsWTKQ6lQtLvhtFosBxPuCdQS2yGw16FpzEUZZEWqo/hE/UYish6SDwDjSPtHVEVtkt3D15niDC/EriBiDkjUBK84Swdjkf5+WxVCscwTWGdbKnTw6FjOUgevem0tELZSlI8R2x2f/UoA4GtEttdlULnyswpatL3aYVoXcyplKg6etVpzv9mQqULtTkT23gmIns0stXm/QrkH+pKWN4jhoxXblTdjS6Iz/6DsrgDd7xaQXPHKYucDX9oTR8HW9p1hYRsn84JSQKpIXCD/7CunmSM/FFWi+2fwbMERL/2SYhP3UzYZuf9rVxipG22VOFpT8kVLb9Y4S7mQk7jng==
Received: from PAZP264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:236::29)
 by GV1PR10MB7597.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 09:50:09 +0000
Received: from MI3PEPF00008480.eurprd02.prod.outlook.com
 (2603:10a6:102:236::4) by PAZP264CA0172.outlook.office365.com
 (2603:10a6:102:236::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 09:50:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=bshg.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bshg.com;
Received-SPF: Pass (protection.outlook.com: domain of bshg.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MI3PEPF00008480.mail.protection.outlook.com (10.167.240.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 09:50:08 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:49:35 +0100
Received: from TRTWCN12235.de.bosch.com (10.44.104.101) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:49:34 +0100
From: Waldemar Rymarkiewicz <external.Waldemar.Rymarkiewicz@bshg.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>, Waldemar Rymarkiewicz
	<waldemar.rymarkiewicz@gmail.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Waldemar
 Rymarkiewicz" <external.Waldemar.Rymarkiewicz@bshg.com>
Subject: [PATCH 0/2] arm64: dts: imx8mn-bsh-smm-s2/pro: improve SDIO Wi-Fi power management
Date: Wed, 25 Nov 2026 10:48:23 +0100
Message-ID: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008480:EE_|GV1PR10MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ed5ac6-1803-4697-cdf7-08df4ad97da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|19092799006|7416014|376014|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vaZemSlBB2v58Pn/P+MW1XF8FG8Q3z9UnIdLh2M+SYqWe9y9Mn+gxegzPXV8JnBJn6hTPl5ScQAGoWp+dicRh+QjGQ7cGKfnp9Ot7F6egZSfElOZUTeJbE1URTPoQDUbLMaHwDkY8jNjlP7Oy0fcp07x9LmLLHhrkziKAjA3r4yoe89hln0r1jKDnuZS1B/09QBMaEot+FmVzBZq3lN0fUVpZtWygoERP78mcy6mS6o6Pct0XR5G0ktzKxwDOWfJxL/m+kpSsC3WHvhM23oArqdpxpyGKhVx2Va1wC//gskJcA5WFgCj7WiMB58e8kzRQV4mJ/WIZPe1msfbnLqZJdtDZA/zpMm7HgvYgNRQtE+J//n+dwOpXNhA9ANu/l7jqv15uBgVrKtKyu/G9KfYh/3z8y7BnVFqO9RyTPWzuvTkIejLQX9+tOHF6wURe51xW/1LbirY7P1SklahsfzklsfrWhyNlisouEHeA/M7Y0ojfBzFCY5Idsom/dSzr3tp0smx3JteOU5rCv5z6zkPltKhICBW+V73SXb9fHYWc9gi5pA0fZOXqYkWivT0eN/pQmn0Rvodtt+5uZp/6CqWtO70eJu3gzQ8D0MeuavPJk0mgSPD7t9I0tN6AeIIUJOM/iG3+WQ+RO1x9cnXbUJtjIXUwPre/yRHdsHohG1YLwhrdy+Itmj8I990Jtn23GBq0WI1WO1A9eYRapL+gATSDw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AynKfXWrhsKaVzenyU9i+SdXIuEgCM5/AflWsOyKEPWZVrZQoebVVDVqivMuEjWmuQeNx0ZhMBOThHR6uoQjWN+8MPVHUgErk8STS4My5eb1jZ/7xsgfN9prtDoiKkPFhZ15vuK58pKSp40qopl34gmeICPYTHi2tIWBfmX5NyuWOFsdMlNfQ4ss5rb1Jq/AbFKkQoQZ/grgfwzcxwjzO5fSJ3kAg5kNWCzV0co/by0BYBdhLyz0WPmQ6iKccydrLiR4+HpIpTnHk7PidYB34SCL0vTsfvMLrjXZ1rsadEqT4wz9bSv9SVxxIXWToJHFRVE9KGY0H9ZaY9bJR2CKXoFlm2Yr6QmCwKGXf92bmFemdoz0qE2NsqwYCLa6T9O3iBhIqEmzRHiVV+nRJRnsggXO4b0iB1uf3/u7AusYNiYh7w9Gz7fEJTljX3OYSTuB
X-OriginatorOrg: bshg.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:50:08.5359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ed5ac6-1803-4697-cdf7-08df4ad97da4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7597

Configure the usdhc2 SDIO controller on imx8mn-bsh-smm-s2/pro boards so the
MMC core can properly power-cycle the onboard Broadcom Wi-Fi module at
runtime while preserving card power across system suspend when requested
by the driver.

Patch 1 adds cap-power-off-card to allow the MMC core to power down the
SDIO card via mmc-pwrseq when power retention is not kept (such as when
the driver does not request MMC_PM_KEEP_POWER, on unbind, or during card
reset/power-off).

Patch 2 keeps the SDIO card powered during system suspend so the Wi-Fi
firmware state is preserved across suspend/resume cycles.


Kaiwen Zhang (1):
  arm64: dts: imx8mn-bsh-smm-s2/pro: allow powering off SDIO Wi-Fi card

Michael Trimarchi (1):
  arm64: dts: imx8mn-bsh-smm-s2/pro: keep SDIO Wi-Fi powered during
    suspend

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

