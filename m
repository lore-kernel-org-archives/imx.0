Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023096.outbound.protection.outlook.com [52.101.83.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F27441056
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.96
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123816; cv=fail; b=doYsA5cmk1AeYw2XOlDu/wKJIWGkpNH/zVftNEy2fo20VWj3Aekk7vPIpjOAJzY4C1H28V/TrFMSICXOOK0fvp5jt5kT1uW0NM05Avg7KyfaSOc+ouET90FYobEbG7JPAVBkKLs7RsBFTS65fG3btGR1sAIxzq1F6vAzYkHadME=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123816; c=relaxed/simple;
	bh=2CcLwsg8BMOZbdOlFsTbe6ajwwktGewHeYAqBuXaALU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Nx9t/3ZakGZfYrBR+aYV/UVHzv39kHhEjve0o5pg+R5+Ux696En/YpT6n/fLU6MbZFzP3veOAyEVaOFwX07876zsS+myDr201aS9/65yG+gNfEwGfC+uX+3hUGr2+x9HmeAmlR/rxawkNSRt4a9AEBGw0VdX9jVk3kt/nEQtI7Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=LH1q7EcD; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=LH1q7EcD; arc=fail smtp.client-ip=52.101.83.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="LH1q7EcD";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="LH1q7EcD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RqY1Mj2XqpcYydT+wNp0rXatm2TG59TOyVe2XOm4HV7V4GxFPKHh3RKJXRy+J7FDzXa5gsJgC/0ISFM3n9tITmmjUKnGH89mrrZtdLaLqQXRQIOjOcwyiUVnq0CKHSxu1AW5cjnCqCweGKwuz51KeqBZfg7iGBpzjrQdEZM88XzNO8D1pFPulZGykGCQGWp5li7sBjt+svA+h1k4C0+WI7q80FwFaYpQghDZhZp+mR9tXlamOHImRIzvwhpD6S4lSFJi30/bLYtlFXWCYS7w/Iu+vmXURqRYKoHB+xZRGE2OmCDQuql6bOXzHumpCD6SSYy9WyVT2cXYcAUAx8L79g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlTeDRU8PjIVaGuKnhlAC5O8g89aHt9j1wDSoozbkuA=;
 b=Cvo8OlDFApuUMPcJOy4Z02sMNlg8ZGVrYEzsDP/DLBy0MO0fwIHMQHM/NNhcceY+gYomfrGvHovm/1k/Zs0KxMl3Jwslx2RNyMJwiMg1aIAwviL/Z2S7ZGa3+n5PUY+lOLXW0/47uhrT5QNYh1+fgpwiZJ/TUnNnPDxZ9vzDLASWwdhEb3xkBocdeWzqtES1CvMhYZlx8Obxc7jSo562JYrZk2BILkOYa/iWeXqTbHv1GOHJ3JoDsUqv/ptkicy+61mJzNs51HeulNEPN6D/XME11aBbPLsdzheFjSETlfxj+QW2SF9r4xAP8fVbLj4GmF6hyUZ+WdZ+kyJYwfvLNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlTeDRU8PjIVaGuKnhlAC5O8g89aHt9j1wDSoozbkuA=;
 b=LH1q7EcD8xDRQXOBU144b25yyrbSNyhipB2+kc5xXOq1+Lh3u8p13fE4QS3aKMgNhj7h6/nkP91O5NfCLQOLXqKRsWQKzaz+7JsG2we38soXzpWqyYjowFyQkqbMu5mZEVYEIt8CY1fayTCFBox/SXPua3xMlEdyGzOEtqWTSPg=
Received: from AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30)
 by AS1PR04MB9239.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 16:36:49 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::80) by AM9P193CA0025.outlook.office365.com
 (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 16:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 16:36:48 +0000
Received: from emails-602202-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-107.eu-west-1.compute.internal [10.20.6.107])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 77965807CA;
	Thu, 26 Feb 2026 16:36:48 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:41 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+AlBVHJcLTBBNcQvVAbHHbqjOvt2t5eabckxO9/P07Bd7YRYmh14cD9r6zs1OOpkbwSKao60h6aJ6K/gfIqVRyASEXVtGdM+nncOKX59YuRIxFtepjsaWpizZjgw1iNDqmESrZgwIDYEofZs94uxBS4NMLSK71lX3lG6duc+vqYEbBuSBYLi0Mr+Q8gEterWUPEWo1hRG4YtlRFZVJK5yFTgoP3W1++Epw8PczOW04AGLRWl57ALsn9ytPbjYoWmK0pMRdcGhO805kgmPkjyDc6DpkMPa1vSURrAjIjCFtwiU78BuLPEF0FtaUtk68Bwd2nWKdXdcbDl1QCVNLCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlTeDRU8PjIVaGuKnhlAC5O8g89aHt9j1wDSoozbkuA=;
 b=EBWlhW+yliZcDq2+MwZKl9CJhWCqVTlyOGLwULojJ6VnauKe8al2tXRIzKp94zdMwTxicmiG+DRUMsJRMex4wO5aNKIpqAaLNZMhiF1QdmEZh5koctyYC2TYTk1iGOFcAmH0RUEgEKCeLwTBjFps0KpJCefwofjVxOD3OVLpGFsodaQEGBohT3fEel/eN2TecZxqRnQHNZ3rFnG64lWYX0CYhADQcIN5rHVy6aPSfeX+78wvpux4W04o6HBBUPUi2SjS0Owkn2tqYe1VPIBujTmV6YFCgubNLP1e7MyvTEcDSY7uuyG2i2iA4vkN2QDDFKsWLNqso7Xzy7yfgFnBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlTeDRU8PjIVaGuKnhlAC5O8g89aHt9j1wDSoozbkuA=;
 b=LH1q7EcD8xDRQXOBU144b25yyrbSNyhipB2+kc5xXOq1+Lh3u8p13fE4QS3aKMgNhj7h6/nkP91O5NfCLQOLXqKRsWQKzaz+7JsG2we38soXzpWqyYjowFyQkqbMu5mZEVYEIt8CY1fayTCFBox/SXPua3xMlEdyGzOEtqWTSPg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:38 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:31 +0200
Subject: [PATCH v9 2/8] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-2-4533235eeb34@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
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
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To AM9PR04MB8747.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8747:EE_|AM9PR04MB8081:EE_|AMS0EPF000001B4:EE_|AS1PR04MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bca8da-c2fc-42ce-0119-08de75553cf0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 v54Rtd1pZ5ALZbaCwHVqIwy1ZoGD8F0DhhQ+Ek5IujHSQifrt+qCxvLfPXL5V6am1fTxB8HsHNpId94PoSyNC/+/hi59OkgOsJ4fRNGUeXHQeqJjUwtzQr+ry/ndqsxudCWPlbXjdpinShjiAYfLQP6F+G11f98IqQKhL4/S7nbEVu5EoUh70wFiQwyQib1P2HXORKkNaKuSO8HB+vJJky6uCTKewW1dEo5ZGauUiM7k4LubcWygxKllvCUtDbP0YCxhCN6x+HgKzwETXMtz36QzRxbppEBTQd8eJLDaol0QFl2dLJe28htS5+1RNe+2ocHb+Uye48XiEgcFXuyYq5Zax7YYfoy9jVkYZBuPMNHIAhc7qL2Ah+ebqpOBXglX+GkGvJ9IFuOAVBY3bNoCvMR5zKZb3QsCkzDDAbqKRgFAJB2OwV2dbnjgJqpTYG12zFBBROOZ3Y3ZH33IoHJGNOnJE/i/ljv/7pHpIq/zXzeBhsuAJL6SV0uGsRkrQPVrXsvxnvfejsyUqOBdEIooxgu6p4qrqKHNMwSlow/QYTc31EKcavWdfwrVyngWpv0LMIiGudi6I6YSFTus4IrAwPc/Bz5avBwrYUcsuFaB72DkkudFVeV0B69yjPSO7nU5E9jIrBnB4RvVNQpUBQnkajOLcOmaPnS1u37HBM1th8kxzc/OoF360dgtULhb0o5/TIp11TMktm7w2qqjSo8ew3joGKl3eWc7XIzUi0AofV580rpPup1qDCsue087y1pcZHLnGRp2IEs9VX7Ze43hvTcll4TlptUoENcJDXtXg7w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2f496c51a2f340bb99e5040ad63d4740:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8060bd9d-c515-4bdc-46a8-08de75553699
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|14060799003|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	KOf1A+fY0MN4wRdm+ZjCmt4LTAKwWRn7joYsTN6zGByIUXoAsh/Sa3uxRxL83gel1wi7DSXRUD5yhRrjAGyIe5t5Y9tKV43wQYdmcW1Zs6Hfpw08hk2EiG/8PcMKK3UfhynpIrnXWib3UjG7L2ffTnP04Ln0YQbUtjB9249CprZQGIs5l5b8jS9FZX1lz7X4KBDhgzH8Y7OMuHVh8oNQjSfbz2du7+qNWwgt41xBZuUfAyDvFjGYO/ypGKE8qe6NuvR4sIwqzzZp3G6fF4TcPZbMhiSnmFOmTppMdtb+00BSivoHAIMPKd5iTqPdoi4IrheHw+M4/rc2uvpY2l1CbuS2P5xcMpPMgV8zApRGwiAf5Se6ABEfl5Kzgo8xdj/skNJGn5/onnamHtX0wpFzHbvnC1gupzVAatIoLXiKMc0cD0T6oWBoh4T7xZ/YhaO5/zhfviCws2gvLKweF2jhJdVImLr+/s32g/ythC6bEw5r4k+MgG/K1eYqVGw912AkAEQ2Sn/OI7SKmYNH0owSkQnuhZ564VcalLCoaBgCGShQX7UJKgceAQTRZOnTIhu+4D7qxoYlzyGbOecG+gb5WKuYDyoQzHo7mXprWmJeF7KPtBXHivkOjNSixoS56HFAxPOzEOOBn9sMKTBqw+qjBXzpkc7AWlEOR3D+7HAJflNKzdw1rQTTlWVN3zUBfCAeSg/tCv7l/10p+Rr4uivt5roWx1o0Jg+jc+eRLRyvw3MJHUrTjRzJMo44WxnhmMFcOG/0wQxxGPYRc2vm4vWtpmr1zVOXThLJdY16xLOSPD8b0dbUby0SGBT7ygE5ISwVjv2UeTvuO5IyUun4DDJ71A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(14060799003)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+DLJv2Yo0n37YGhfW0XM5NkFrhqxALnSjm6ahJqNV4tJgikMtmvCjogM1Z2/aDJU1R/g7l+yIbM1GGs3+YlBQshYa88Vp3NgvH3v/sVVKFO171VJnLravUnusazBcluPb8nUsVe2GJGmaMGgTRXCePDcNwefkNB3giyNhDyHpvjKDNfVU/qSs56JQG2HefqyvIr4cRmsMPl6RhNYsn6bvCKvmxl4/BZDrTksk85PEFJRE8H+8T+Q2JFj/wxJuN2K63c+bCBmMFzh4hNfL9c0yTYnrWUtYiVrcQ+eLtVkD/NVLq5qcPZ9o/GUq6wUwi1I5dNHPiqWpqIiNSIpw/ZScriRs4xFOuyeZo6De9aTXDtMte87ILbJMXOC69v5WRcAeDvrZp3sWvcL0C4b65CSDYxuKAT+OXdMFz4ofsLIm/aWKFcIm89T2HodzPYWnxtp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:48.7197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bca8da-c2fc-42ce-0119-08de75553cf0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9239

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79f..7bc213499f09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index fa7cb9759d01..0b4e5f300eb1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.43.0

