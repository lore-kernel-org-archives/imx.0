Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023098.outbound.protection.outlook.com [40.107.159.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F503394476
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.98
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405099; cv=fail; b=cVkfPsBg7uvrnNBlBk950vlKUU1nmGFKDH5JP17qkvSDXR2YgjNikfk8Ns289viuhSOm6XgwTFOoyHVW/x4cKIB8SlC0ghJdWl0ay91HaqDII0kL/F7TeD+qQqpdZVPUegjGuSLTkGqq+TCXY5Neqa1GNRY27qwMg3yM8p7juKk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405099; c=relaxed/simple;
	bh=wI3BAa6A/OJlsgG0cZWwnOruACWIBgqU4ZhfWcxKUKA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fpAUJuyAGe3M0WkyvyNaiKtHWesfz0c2mVrsEcZh1iQ/72KRbk7/f3gK4M1319+KNBzD2K6LxmNs9NmDwjT9SQPKcLyjXS6qfg2foLeOk3KxxahHkOlxWbnC3wGfZ/k7nLMUR72skbIUCSe0yRve/pkLrdr9RbqlwEDWYTrODlI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=rOVjJX3R; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=rOVjJX3R; arc=fail smtp.client-ip=40.107.159.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rOVjJX3R";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rOVjJX3R"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ez6WkC0ZEFUY7C4HY7kA481JTCKfzponpgL335PvCtbb79bUiJ7OQDA1utuwF9mhrOiOasiYKSVmC1hF97fvxL9odeHHBoXCvgcpVwo7jeUAY2zULtn5g0x+s6QcYLvoYxFU3m+qP97aTM79aWuXG8Mr/GnVn8v4qcqXTyQ+OnxeOwIJmdVO+jLMrP4BdAIv2vc1/nhag5FI6Sxy7GS7DJ/LQJ5M1ZtBvbwCzXAUI8KoPyEpUJ45yR378EECTup+4l64RJezg25yhLmHNUuJ0nuyN8JaEc3yLQqGVp3FxtHeTBNwhKi01BiSB6L58+oMhAh0MXyI/wjU8PWkIwhR0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5CbqaCd6ulPdcqoMoCSEVLjL6atwXqK9y0VBBm1Fkw=;
 b=HbSRQFTzOpx34KPMWEkc0Ivr8eJrVePnjfoF/1bHVES6WeWTBZQeunL+xtwfWBkwXHIE7wPDczjBiST/TbMfgpnbhIx8M6c2NT8zx25xfQhNRokcITqKCl88VgGYXhFb7zotLkcUKbeSpOeXZA+COZstbKt2etuDmOfvRxrkZAZBcecRUACJbk6gduqjhJT0ZR2RjJCUAi/JvVTqdh8Ok0F28GRgRUoQ0crBdCxXp4ez/mx0qB4h1suJKIOW+y96ULA+sLd6FhbX7yLP62oEC2lmqLHQPF0V9KAIITVjDAj3i0HhRHtucxpciwDq+WtvFC7LTY9T6jmHL9SEU6o/mA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5CbqaCd6ulPdcqoMoCSEVLjL6atwXqK9y0VBBm1Fkw=;
 b=rOVjJX3RE0nClGWzXkBx/rgSVsNmgsKL8Dafam2PEKVxEuD1fRuvEIaoPnKw8z48O6SnpswovhKLSjf/QwsHJhMhaw4wzzBMiW1jDSE2FGq/Ygyl8a8lDUTLN4pS9E2Y58861qTkDR0Gcm+RakOE5KbXa1Pn8DhdczTly24GxnY=
Received: from DB8PR06CA0038.eurprd06.prod.outlook.com (2603:10a6:10:120::12)
 by VI0PR04MB10317.eurprd04.prod.outlook.com (2603:10a6:800:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 12:31:23 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::68) by DB8PR06CA0038.outlook.office365.com
 (2603:10a6:10:120::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 12:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 12:31:30 +0000
Received: from emails-2517817-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1FC8E80C6B;
	Fri, 13 Mar 2026 12:31:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 12:31:22 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxVmXQnzfJE0YIZxriW/qHeXaIQ7zCiWAKCJxUMwIMkzG/pNlL+um0U1QcP+3FCuJvScHwFpPX5Q3AUh7g3v13466VjxfRaLYsuRNOABHEHP/n7H2CFAoSNJsAlLth8y/KaXDfBmbkeO26KclFjNKp8ix22Co8m0OJFGvW87+HALlh917F3J+osPrzBsuVGCRXtv9TsOfT1dE6W1v+lAMBgDJFYSEmFcDsGuSMEyNKel1N/Joz9I5WngiHBuZ3KOoEhs6SmZt0sStOKttMe/hwWHJgQXi0Sgt9rUu3Em4GcVXQtUno/4gofwUxkuCdvNaB6SaQ8hJr+XWAbp84MdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5CbqaCd6ulPdcqoMoCSEVLjL6atwXqK9y0VBBm1Fkw=;
 b=fpmoMJOPesoMt+mOPMhjVIzWei7u3FCZ24GUWPWHpFYc0J9NKqDczgtZApWMLxrFdlY9cOuEpGvPnKoUkwrjieLKrzyAzfYpmfW2xv33QEsXH0DjbQTdXid1rthcCJGrLSaMt2EnsUWuH5pxmbpiICrs2iAWPimREXXNNjDZVJkuxb3S+95bIf45PboURWk47TF6PlKi0gh7lIw0RtrTnZCM8hmtL8asYUrxHcJ3oyQuJjaqE6sJ2zZvXPM1BhWp49ObfNFGwK71zUtaDOluHilzC+9Tjo9YwLuBnwzuOZp9SuEKQ7ZLWMldiVkEkXglnjmKbJ4VXcMVSiEuGDR9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5CbqaCd6ulPdcqoMoCSEVLjL6atwXqK9y0VBBm1Fkw=;
 b=rOVjJX3RE0nClGWzXkBx/rgSVsNmgsKL8Dafam2PEKVxEuD1fRuvEIaoPnKw8z48O6SnpswovhKLSjf/QwsHJhMhaw4wzzBMiW1jDSE2FGq/Ygyl8a8lDUTLN4pS9E2Y58861qTkDR0Gcm+RakOE5KbXa1Pn8DhdczTly24GxnY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 12:31:12 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 12:31:03 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 14:30:58 +0200
Subject: [PATCH v10 2/4] arm64: dts: imx8mp-hummingboard-iiot: add dt
 overlays for muxable ports
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-imx8mp-hb-iiot-v10-2-52b3084f2426@solid-run.com>
References: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
In-Reply-To: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TL2P290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::9)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PR3PR04MB7467:EE_|DB5PEPF00014B99:EE_|VI0PR04MB10317:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da3a57c-56a1-4765-48bb-08de80fc7427
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 YUua+k8lomItr8GO77R4f12Vi8QFxVVUoEYXo5JOvxZ9/XfAqDp99fql7HcuH1H195jUGf8qKo9FsOJkPh6CYAGXeK3PGLxkMrbatiiQ2KPhcxHlzOlq4Vcpl6qZwuEpGi6pu0mgLDHN5J151EvQlBvtd9zEftfFYX3ViLX05PKUc1pyqoSnt1z+lrFrpLxocYxFLowYAFhOgKiM5u6KVmb0aId4N71OCpa1ecmgSVx3nXbcrjFF+bEOlfnDUMBeTCXeA38C81GVP/TEWxzcszdsex6i6STZV43cycGPFop+WqaD7bs4wWI1ZzCOjGEwB9AThdftYS6lJ5A/aeIO2xA2y7Jc86tnZK60aEIgPyyumaqhvSCgUXz2jvT4ciY39Cr/MsFmvxVGfffBVyCMkxOytn1mf7FCBRHvO+vh3s9zSwwdcDffXZVMKTljH4ZkFf7qsihlelMgoYBMo1xRNyIKp9+4ypqzQxiNypg8SuQ6Ul5YJCnzeqlg9CvklkjYQrGQhkBVdX8gADHrHxTw9fmeaLnP/l6ewdH1mWuz8WqQitt+qbjgv9Wo0Tngc3jmz9gSiDncWNe+B0smDxqjs2/gzWFjCfLrNgDPbT+MJA0HeesFQznpiBQBa5dW8WNFgCqg86ZVVS0vsCy8n4dUmovIMctD3SPYsX307gJL3YS8cPIXhou7Hg71owEF/15mgQyfntzbJUwX+onsa2JBirTML5PtKhzguC3b9ERQ2Kquq7SPRhrVu3FFVOLmzbiNsQhx3QS+gyNbf7qKG9EqvlKh7SMCFlTs/ra9juqFr+k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 uRTx6kWnRUuDjZkJ4guvEAotsa19aEprE/szDNRAtX8Nv/4volCJF3jzOYhEqPamWRtohB1hoPmwwXsCXLJd7BD3/2TKibnSB8ee2zRM1G+b6HDzIm0xr3uMdVFz6g2U5T9UNGbIUibkBa4addSu7C++Vbvaf7XeV58BJp4Ga92k7J2jInZwwkp7uvHw2LK9SWs6Ymq9UqLP0hwOWUQYGPZL+2hYtlsRsOyYvZ/eN9taEnVptNP2kBoe5Gl5ODmRTY9eQI0j697nnHuWcGsbhIu+irVXjJfRzw5uD0hbgE3qiZGhmZ0ZhA4jsIyt2Jdj+rfJfItI90bjsjp7EvnV1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: fc61aa216ee7444392b0a0f301b97ac8:solidrun,office365_emails,sent,inline:9289b2abfe3e9fc97e4b402e7c3b6b90
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bc43850-8e1a-4d32-65e8-08de80fc642a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700016|14060799003|7416014|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1xN4dVtV6VkRZz7DgwoByaBQcShAyiBvp593DSnLdNjOo6ZLE81cPiyyxXiK0/lykliBfAoz8MWQB5HAl0Q/GmO7L6D6kLcDyYtjZW78spCl3xsOCoPAwrbUCJ00PFJKEDFkfPmewu5aMD5z5TWvAcKhTn1n8eCF2yZ58NjQ9n2UDU2ScQIpig4fE8P+bkNVaTZajwWPkg1jvHfNJBT6G9k1slDyvGAKUxNaYTfVYrYkZOm5QFZCg5NkLazMNiysnksGui6J0sIwi0lIoUXdCEMy6zS4goLC3vJL5I/cK/tOv93UrgRcwq1qalid2jqdzWVEFvKJHvwdakLX1bCHqvMEcaCUccrNED8cjjfat11ASpFxh2qlUbQahsqNYRK9M/BnFBvnHRAquKXrqUS+MurBNsGk7LLPNZvseaSnIfsx/eL6wcFDrAcuNL22A89ess1y+XCVTH6B9WHirBoE0faA7tyhjdvYuHlMwIqDWsUMLeUgziV5sHTvVQ1r4Op0C0dUK5SobheszwPbbN/HTudBD548teZZ/4V4lVMW1Tq3XwiIxlzobX1lM5SnztlHAzsdFKWcmPN3CHwOW9BjWGuWWMz3aTTQ+F5QFmSdHBboIrjOHLhH/yTSBEmvPkMibCBIrq8kJp7q9XM24OSIiaucytbZvdlCJpEQAiYeFgGTFIN6aAC+Mv/3kwSrBTkEbx5HtjYt30e11yh5U40lw2x5x4/zyeU3mJff6b/0elmke/ioNb9SgQ8S+RgzZ48CR+BqJiJ2b/1htPgpZAykEQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700016)(14060799003)(7416014)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yUihkaW07CJ9U963bgj+2Igr4yTL8KGFQOANOdAWkxp8a5BB6u4OI8AGuALq4Pn2mwmcvBhgXlAsmEmKp0rn1zbyuuIlUZb2hs8WYYQW0kN4QFkY3Lma9JpmFA0/nfZG84OhEtxwYEgVDMmWjgNzQWiI4YBhPqigaYQc07r8l+N0pH+JmQU7W2lq4W3gqiKCmR42EVOOwORiJJRr0IHrQfJP/c+4ZK46oofIUl4zZ2D82eY0RGouXNv8ad7WJDvJpKiCR2L/3RvetG9uAgn27jJ7u8kyRNnLz7tXXaAkVfYdy8Ufmw4V+7n+0o/nuXAV250v2kmSaBuV1CuakhP+y28ZVc9BcMZNxwf7w69dx6z4ElyL/s9u2sPY4fmkuYLCTND9sdyPBSWX90jeqp1++pDv8wRNewMJdYMyzspbiFmWfVQq9UjgQbCyLpg+TXiT
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:31:30.1627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da3a57c-56a1-4765-48bb-08de80fc7427
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10317

The SolidRun i.MX8MP HummingBoard IIoT has a variety of connectors, and
configurable ports:

- 2x RS232
- 2x RS485
- DSI Panel Connector
- LVDS Panel Connector

RS232 and RS485 each share a single UART from the SoC via a mux, which
are configured from the base dts for RS232 by default.

Provide addons for:

1. Reconfigure UART A from RS232 to RS485.
2. Reconfigure UART B from RS232 to RS485.
3. Configure DSI Connector for Winstar WJ70N3TYJHMNG0 Panel.
4. Configure LVDS Connector for Winstar WF70A8SYJHLNGA Panel.

A variation of the base dtb is generated for each addon to ensure that
make dtbs_check covers the resulting dtb, and applying overlay is
tested during build.

It is however expected that bootloader should apply any combination of
addons based on runtime configuration.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 12 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso | 67 +++++++++++++++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 97 ++++++++++++++++++++++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          | 18 ++++
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          | 18 ++++
 5 files changed, 212 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e974bc952bcc..74756c680403 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -240,6 +240,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+imx8mp-hummingboard-iiot-rs485-a-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
+imx8mp-hummingboard-iiot-rs485-b-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-pro := -@
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 000000000000..6c41f2633f14
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&dsi_backlight>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+};
+
+&mipi_dsi_out {
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&panel_from_dsim>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 000000000000..ca4e7b8fee8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		data-mapping = "vesa-24";
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		height-mm = <86>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		width-mm = <154>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <144>;
+			hfront-porch = <40>;
+			hsync-active = <0>;
+			hsync-len = <104>;
+			vactive = <600>;
+			vback-porch = <11>;
+			vfront-porch = <3>;
+			vsync-active = <1>;
+			vsync-len = <10>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_from_lvds>;
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		gpio-hog;
+		line-name = "lvds-l/r";
+		output-high;
+	};
+
+	lvds-ud-hog {
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		gpio-hog;
+		line-name = "lvds-u/d";
+		output-high;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..ae64d6efad9d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..2718fa5b2c66
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};

-- 
2.43.0

