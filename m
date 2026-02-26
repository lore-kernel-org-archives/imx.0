Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020091.outbound.protection.outlook.com [52.101.69.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473444105E
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.91
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123815; cv=fail; b=lTaHotpC9LMzIVD60fHJgpKeCyoBD4wbfHEoi4fNNXcz1/syg8GCRRYkXSC9sb/GA1tVhEFHxHlT2hq62N2rX179svVNHiIuI6gFgC1cnA7JhaZosNQAImBx2F3zqImoyXsnRiIlpAz51vBPAu3ksQWSDw2NCxunuirLSvvuBKk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123815; c=relaxed/simple;
	bh=cgTDQNJ4TTpr3QcGNQ942e8rjAQPzqAVsXWba03A/H0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hEf9sK695pwp92Kr4piY0JycHORg7jwNcwz7xEcLKK8YWP/foVXAdRkk6qoY5zlVrKzbPdoqnEekySDa14BmxJuxjTtp79PhneOq+hqUi4eMVCVNPY8mvpj8n1MSMF7Lvc4uQORglzq7NiBQiSEIPInP7bCmg/A/1nmlrBJHD/A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=JabJIkKy; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=JabJIkKy; arc=fail smtp.client-ip=52.101.69.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JabJIkKy";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JabJIkKy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cLXPDnLXHwum39sbJiR93j07g/FQ9Y+qw3iaCIGEE9qCZZuZpzB0XHe4nZ5pdpiMpkkU09IRFm0zbqA53VOsxPkMRBGQKOH0gw0ubUdNG2gcHEXObOHP2mnAXDdmimThCDTeSepysm8SunjQLAdNpU0mIqnoZsATVibqblknGImHRoB2l6gizXljtR/Sbe3JYo7RvU5in6phBOMIJQSk9Ysr3/SLNqadJfEWb35c6Q3vh7dZM1prucQr5lYukfntvp6+cPG0feiRMBmPa94Kn3T9Jx1c7TgW+gJklTTWwgAXVImw+0ap3UL8w4PexSp+HHz1Zh/AB8zFBrX9L5bbwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtWdc+8u+VyXgkyBHjHyMtKtjdzEGQ6siapClp7WaRw=;
 b=OnPiTOTn1D9CxcMg78Q+OWUjfzeMO12Le9lNhAeSM0ykPXsZgHZHfUNmEyoD1RDgZWtRsCsAoKDP8+6EF9M4lkhuTfKz2Yt1WCu+Taegjd5OIrBRVIzvVyDALSf23UjWdW1nMdf6bHhAeONXx7w96abU/tC+w1A3ORlDzamc38uC9JQt106wXkxXsSZqnJolfIwC6gpz5QMtebB8QS5V4bYxt9KlBYIW0c//d/lq4pfqr35lVKAmy2zje3PdkSQr0Q7gWzhXDthTJWbtJfnNx/1Rtc+blR7RND9qfKC3NSg5eaN14eiOG8wcp1dJIWOG2DuydvygzyI5OSgcIJBldg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtWdc+8u+VyXgkyBHjHyMtKtjdzEGQ6siapClp7WaRw=;
 b=JabJIkKy3mgh2l7Igowa4Haq4eTE5g/uf++MaUV9gUdY9TMbDr2ESXbgTVd40aznyZ8ou1FZQ+heGVeDcRGsOw3oP8gKM3hBqaTSQTV0kkYNXrUZhpm2HhH18i4T6Lz7reioYFCoO90ViMFPbGtQcIDNR1XkQBEX3GvvAGYD8T4=
Received: from DB9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::17) by DU4PR04MB11054.eurprd04.prod.outlook.com
 (2603:10a6:10:581::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:50 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::ed) by DB9PR01CA0012.outlook.office365.com
 (2603:10a6:10:1d8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Thu, 26 Feb 2026 16:36:49 +0000
Received: from emails-8277310-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D4CE780794;
	Thu, 26 Feb 2026 16:36:49 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:42 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3OVjF/7V567EwKIwT2haF/M228CzxjqP7+J/by9OAKc5dFgKTuE5Q1OmNlc8e0+vufY35jk6TQj0hlBiyaleKHPkGMiA1aah2a9AlO9barcgaa8xtWhcJI6Qa9T56bBLaIY8x9d7JiqU/l07Q/g+yJkeLZ4xvdK/1P8eQ6woUxXKjbhUd10UL33G8rxz0h1ATR6u4SSRZk7M0+nlDqOH9rSVMx4l4qLH2P5MoG4oDj5VK05nua/2k6ZTznqPLdWBS9OsEz7AASS8WTOsd+NIZNKR71MpsXuq+/nezctbj9z8tIma10wWX+7lC4HUuQTZxI6S54cH6wigYeVUPicFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtWdc+8u+VyXgkyBHjHyMtKtjdzEGQ6siapClp7WaRw=;
 b=pkJsI7KUm0j8M5TUZ2sDYi6AyaQE29O/zeH6eGLac3+QZMYQ/+JzvOrbDYg7Vkxt3Lcsahcyx3a/LgxFTANov1Kf0BteIJQ+xXntPh3h0yF75GjZOhrX9uJpjqsxDCQWcZCVAdQsehBUfE9r6c2YJHjq3MhDl2o43ByFcu71idyAbsAEh++Rd2epfUFecQahHtWrvaqcDRDKdvbH9dkObxzx+NXXb6deG4cxRuszx3M9i0GW9TJ2Z80NG0a9qkzX5Oh7a8fduhfU3r8NQhfHIx+2osoxKkzuFdrRxxR8x8I/yDHwOQIUEj36Q+J23dOD318p3sI+1JQeTnn0yy+oUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtWdc+8u+VyXgkyBHjHyMtKtjdzEGQ6siapClp7WaRw=;
 b=JabJIkKy3mgh2l7Igowa4Haq4eTE5g/uf++MaUV9gUdY9TMbDr2ESXbgTVd40aznyZ8ou1FZQ+heGVeDcRGsOw3oP8gKM3hBqaTSQTV0kkYNXrUZhpm2HhH18i4T6Lz7reioYFCoO90ViMFPbGtQcIDNR1XkQBEX3GvvAGYD8T4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:36:39 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:32 +0200
Subject: [PATCH v9 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-3-4533235eeb34@solid-run.com>
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
	AM9PR04MB8747:EE_|AM9PR04MB8081:EE_|DU6PEPF0000A7E4:EE_|DU4PR04MB11054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e90dc19-791f-4f64-a077-08de75553da4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 Ty2kmHa4l3R/J3k7UfO2dxGRcUm5qzhUQ6LPPt2HRBtqY1jWwWBRtkeG7dsHIGx0DibLpycB2L8M7st2357kJr7Tfu+orVc+ZG048alUYYPYdTjGazuRfWqzfeFrJIaX8vKKqIhtuujGZbA5/g4yU9xAEt/FRpnfpfdmjeMlB34kJDqUBpJxp8wUskZ+zBwXi0x18fDI+guqNjrlYlvVDvALKlOVToOnGlaybXcBY/tbdebHAz/MuaryJTSz1sW2WMrpYwMUDLoBE3ObfSM9SJKEBTnHrFvD9oiyKYisnwWs2fH4wIxtdTzDE5u9/XRnBx+Gp1D9QNWXcRE+7W0dBwZUY21MV7CaMcPoC59pQmwVzwi813y4I82/lWzPHcjelsXYfIeA/EipbEF4MW/MO9al/scahHVjmYnjGicp1lXnXCnmVWQ7nFA86w0EmUUjA1I2BCUQ5ZQAeXRoRfubjWOj0FatPeEP++1Y7KACUtPv+PTONb8y0B+hcZma2Y0/Zf/dGj3ZBSxuxjsS+svmo3Zdw+qg8f22kdM79lVPwVmybb9/jMMRJst8G3wjDQaMNi5vvmF1yDQOJr9NaBMT7QBvtTqlrBnsOaoc97TclIVuevCYOna3xWO4Nl0zyzzgPO8mol1nVqvtjVzFHXdB8mIlbcKIkGSUAcemIOhR84D+aYZk/v87UukCtjETvZ11kqDlRsy6t0XQvxYQwK8XRnSw4P4BYBck/wXqQ5sEGYZHWdaTV7OEPKdx2tfsfrvjbW9xNI4MwCh1NhihvViHMv7gapkFKX0OH2OciP8sCjU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3a14daf72b584722ae79d5415f5cf25b:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c72876f8-c61a-47f5-55f5-08de7555376d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	zWalDfhDiFBD/DpT3oF97UdZMJxj5qLr0xq0VZhtbSXsNV7kcxlni2H+jt1Z1419Br5RfanUtvWCB8e3BIMUiUmgZK9y3dAkyFGIiFZHNCHloDWliEsnsNc1+4sOPaCDLdteLti0O0MxNpTJluLu1tiZWl4ZewE0tOYFVkCmBfqBLbBC+eW6P84O037U/sHSXLNkP1CDIvD9TLSii2ZpUxX6UBIrRDpbRBMP1htYd8maRFiGHmDVPr5yaZ80ozn2X7Za1Mha5Eg6Jcmns+AbZ6PknneGLh85d5LYxUoF1L10/Nn3pe16K8OtkzzG6c6hoVBGR4kAjwLDmmeeLtnLVPMkt2G2s1OG2PTHfWZidblO30Xa6X5gfLmobALsklP449Lm+rykxXJXprNUJKQlcOEANjVf7MZj0dSIs29+rdGXcLt7bevUTU707KkCUCZRQvoITdOAtwA0/TzA3W2YgYUwNeB1ujsxTetob/ujT9/jgYuoz20qxD84umMb5jMItgriX07l20IJtX+T+W0uoaWnLinnaccN5HP6nB+dt46qNnndh/F3PDImhZOUxQaUQudrMvKKlBoxfX1EGYEoOkEYP9jgAkjBCvxJl3MP3t+4pbcE3ISxYw8K0ilVm+qxtS+A5IpK71ahUq/0XJ86ZtHCpSvy4RTYXh6taq9lLLgC9y/97QOoBsVhi6vMCYomqwjBCTX46vpYJSSKYHx7ahWJY4SVumqWZmQbIvbFxYqAhmiCFDxUTlCk20K3j6fYnPLyczVgPu4XsShxajOI6kF6G5f8eij9zOgPedf+qfMrG1cJ+vBKpiaYGsCO3qmi83snCzVXTbAg4qmN9i25Pg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zv1e1eid4AoiLl2mQJG8XYc17EB9yiis7iidTd1SjMoc6q7T51U3qOfwf+XNo21Pcl4YtT7ZPsbVfE+o/7k2VMMsa0rMhetzyhVdifXL1yyCAklTenjuN2BEUILBEnMSDiHEmX5tJNNa0bQImpGdpayRoGRshN5WncbRhjycCmy0jwolRPBc0VZmGmFH8lg4eQCUj2CjvCBzmvJ/u30LikoaYQbErHvKz49kdVh9M2Jq6GCoWsZXfU4fStO8cbLae6oNrqBCIdzjkuloKUUHfMksJLWeDgYECyG5uPirpwtNUABXaAJgZ7gxueZ2insunhBXkfdBPHOirrbvRv3MIHG0Y4iYP7nCQ2MUs6BKVc9oVIIHUAGBWxp+cDvyPOSTOlxkmCKCiREWUKLCVL/KFz4BXUNIaEplB+33RtUeokBT0CMYpoVrFMu2OT0gAog+
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:36:49.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e90dc19-791f-4f64-a077-08de75553da4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11054

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.

HummingBoard Pulse mini-hdmi dtsi described a new endpoint node with a
different label attached.

This duplicate label causes confusion and is suspected to also cause
errors during dsi_attach.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc0533..0e5f4607c7c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.43.0

