Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021100.outbound.protection.outlook.com [52.101.65.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827A3932C5
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.100
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634499; cv=fail; b=toaGPxPVOwV7ONDND4IO+pSzUOGgYNa1wjApkebwFEINtrQ8Gu+NkvtOzTLxvbCOHkGQRgjAhLX7zg+zVjunCg1g8Rb31F4FXJI/lR4Mi+uZHgPEJ43TZdklJuRuVIp0AIfmqD0cKbGml8xbFufi4z7kUh016KkmmCyxANHtpDE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634499; c=relaxed/simple;
	bh=FUytqX845VCtWNQ8ptAQ0EvOD6VLKY3ENd4zJC+KEEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sk0i1LsHkktZYZKY0ElEXssQop4or9XdepXYYQVMqt01WPRz72nnwjyNbDAQBlwtTqfo59kHMZDJPKDp5YlGRH/0A3quxrgUNfHkjJdMFkoK+NV2bhJmDKPmmabCqe9bNkVFy+1FeF/7A94891rXqMdL6YGe9zFgzlEV3lcXZaI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=NMQ5lku+; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=NMQ5lku+; arc=fail smtp.client-ip=52.101.65.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="NMQ5lku+";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="NMQ5lku+"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Eel2FzzjpOTgHFqG1UDS2BCztn2Z4Cr7bPhbkAagXgn6wSyrB8+lnC/mRANZNGZ76EB9v9awuEwLXt0QYRkKg4OJx3RvXRYUEkTwCJaXDAGhaU02xnNUtYkLtTtBgJKryc9Z44Fvd13i1LDCBoYhsRZPcEGms82leMlxvxjjwwayPFxdTBRh4ewMzBhiGjPPXegRXBA1IialPzKTp9v2z9G6AcrCj+CHxMwmT5jJcFoD4qnO6rbaqZpsBn4+M3ZSuKMaSck5QHf8TM/3TKwPqep88NxzqlhKFHghAdnNoojka/Gunzu8zxwJng9Hj61LPwcDc3CgOR94LpWpxBc7OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=ZcjjWYTBSMnHIOHqLhu4Y5TLn8sm2eDbv7cjyXntSJgSVJEDNyFCcyTSUmb/X/2yo8euDrkpCXPa7Rfd/o8bxGospLRGMAso2bCAzpqEesn0bj5R12JXGT2FkK0JNGmKU5Ygb0HII92tbKLcycTsqzLndVE/z9pQQfYoj0n0gpaVOD+bkCNG+tx+DSW5aGTt94Tj16QohxzcWw+WyR+26BBAOjSe6cVsa2H0aKx+NWRlIRll5m6tzE8SP4eLR104UogJmSpojoBqO4ChA0pLXg0UgaMPJ+Hm6IjUy9UGNgkYEdPmrVMNL8uYYYVBKN8slIUsiUCiTMr4asJuoPET8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=NMQ5lku+MEdByjrnIfPxlhg4F+zKqjWRHVMTJT3hQXgt6bES/dkmsS1817v7HwO7OIItE7aqLDE4YHk0+s8t1+dtWV9WLcDRtQlCuyTgzhmMAp+JcDcXVfyCqD6at+NOWf1e4WBLFNhkLr3sfaU5fnnvnlej7xeIEc9OfJ8c1C0eIzMAy5c2Fa3F4BQzGjAMNIbAnodIQ+lCEQ2YGOO/+7zBzR70sVrVT+7DlNqRvM05Pzg3Bi2zLmP3inghY/WJPBmjmSOLkUoeY0Nkmkls4tGFN0YuEcxzcuFItPj7+2V8jpcKKDlCG2ekBsZMvygoS83rWqRlTxHtVYK0lYUXyA==
Received: from CWLP265CA0441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::7)
 by AM0PR04MB6913.eurprd04.prod.outlook.com (2603:10a6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:53 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::8b) by CWLP265CA0441.outlook.office365.com
 (2603:10a6:400:1b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:53 +0000
Received: from emails-4717192-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 227877FD6B;
	Sun, 24 May 2026 14:54:53 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:48 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJyTEpdETSiIfjxPj2dQiwoMFkEVZn64ZY93u1FwLMLbQlp3fXv1Gl0wv6ONV1+rmWLIr0EcKG4FIeViEEM365nbVizZmWhntifli7drL/rPc1bxaKGb8DRKFJ4ZhoAZhHHGpHH3qZiXJEwZeCZxPykq+N1vMtmTApmWik9lgAov6wxAAlytNMIiNTUxjTmXDZ2P4TdBd0bIM5Ur9ogZcaJFHPLnL6cdVp724tx6Ru0zSroTuqy7KehihQQWFqxn5T6E0Tivkp2Xh0JkV8UguIXiLkeDSZONScQv/abCCgCFAHvl7VbEVJC46EDmgEDKwUrSHXhF0oJDsjNZwgREHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=CrFJqv8UYNTwPcHwc4l/1ozeylAEBIXwX4ff/Uvooa0gfUUEd4IFEp38ncofocXr2agHA/ZD6MplbhJQ7KX1F3R/XdAk42JowRFcj1uv1FwIR2vk0RLMdk/2MoNHLaB2aBik8tgUqGCbIxUQyA9v54R75j/E7BvVXkIVLTmYFuKnEWYXI4AvdleZeeIpG55DTSMK2/9w5I4+kk1wHMBSmf9bqY2DqnurpP40OsjekOEmpiEXtP3dEHCBi5KyB0Z3a1oEsOtTnz8UGrV5s8qQ3Xn0gP4nJJy55+2NIPOuTXjYilb48mTdaBueM51IWWpqPTvHd1/C5TB1oqYdMXxXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=NMQ5lku+MEdByjrnIfPxlhg4F+zKqjWRHVMTJT3hQXgt6bES/dkmsS1817v7HwO7OIItE7aqLDE4YHk0+s8t1+dtWV9WLcDRtQlCuyTgzhmMAp+JcDcXVfyCqD6at+NOWf1e4WBLFNhkLr3sfaU5fnnvnlej7xeIEc9OfJ8c1C0eIzMAy5c2Fa3F4BQzGjAMNIbAnodIQ+lCEQ2YGOO/+7zBzR70sVrVT+7DlNqRvM05Pzg3Bi2zLmP3inghY/WJPBmjmSOLkUoeY0Nkmkls4tGFN0YuEcxzcuFItPj7+2V8jpcKKDlCG2ekBsZMvygoS83rWqRlTxHtVYK0lYUXyA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:45 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:43 +0200
Subject: [PATCH v7 4/9] arm64: dts: lx2162a-clearfog: specify sfp ports led
 colour and function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-4-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
In-Reply-To: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To DB8PR04MB6859.eurprd04.prod.outlook.com
 (2603:10a6:10:119::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|AMS0EPF000001AE:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 4385a638-582a-4d8e-659f-08deb9a469d9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 cz9FCHmYiGMRwV3EI1E6uaB2rgl5GP3cwcM2dcNhC8s++RnpSGaxaFqgQMXMgsPBZALWOKPkVabWuCf7zW+k5E6bKycSzym0Le75ephzO1Hm8htgFwb0UFNzd1VsYFakUn01mkdMfODW6a0YRTHsh8Scs4Va48VlvTeUz/h7ewQ49Q4xYSkXJFJBdtp1JuZCpsxWXohapj7qt1POIIP0yKId6AA2VcHdGuNVxm5sneVVcs+at2ATc6TSfTenh35O0Gncb4NW9bFQHBIDnHZrfUgdiJUAVHo2BTxUMuwpZcvf8tpX8ddUSUjoFJ0MReIeicXqMJ/JQtDiArviQykkI4eetM3W1TDuOoNzc3bEHbJ54hV/zSSb5CmPTw3F3ev+Brphvi+1RuYAH6UM6kdDvSg4dD318ljMuQ8xKlw2zyrQaQEu6/T6e5LSdCGu0Xy+mAMjXH68EbW+ukMuj+2zFtN2HCioFshzEvFKHfdbGCeyLGEcsDVNX208Nj5TASJguHy9Zi45AjSV5SP3x9znNpm2KL+Qxy+FElXo0dxi/WjUrdAyLf+H7CDcHlWiSV0HDvKtOV6W1MTvsQBMQC2AelOT79IP1s4Eg28UowEUzvwLHn+tiJFKvCb+9NDfMQDqmgafVJT+FpEkN/HHTJ1FBzz6Xwk3bIogdcccv9ZZWT7xGl3DIIHSk7kA2lCVdpgA35i9qqjnwbv80P+efOY/FhtkfIX4ZxWWKoCgMzV+TzcbLnClfuDMm5OrD+T5b+A2Qwkyujxc+7IUQyxKJD2spA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Moapofc6tZZWLNd9Kx/nG4tXfMC/GcIzM7TQAwmw/MUpCaw1eGwAmZq5cRKeLsi+IMrpQ1kWi92TGglgCKEa6h8nx5AT37mNChyiydfqk31s/2jI0KfNmrIb0Z2wyIfvHn9PiFY2ZbjbfokoqOeAl1OAKCcusYa8FPugyZtms0AGqvsl7V9oXreLelwGjjvK9vGIuJQMFiCw7TOEr2PONROoLo1wqv0FB8q3XnuD0CSnOFh6/YpCIbUPpcNxlWp9pb1ruaY7MZF8iE7Th0fwLP61pu5QZ7QItY3Ol+7lQ4uPGsVd1VrmCMP4/jT3ELbDuFzpDu7Z/QntoqLM1Ui8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: cd8636ff3ce248278b5e1c0a929f7a2b:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	619762ab-6f8c-4ce7-bd7e-08deb9a46525
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|14060799003|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	2sY3u8JVXqYs3qZmyP5woChaOSRIMDlCh501YMyDoq/e68D0oeWPftI6/7mA2NJCYoWz/fJO3oijW9nXmEer5FSCK1AMQZFswadgcQWGP0yJSg123p38KWBlNo8IXLVGo2KGiq6hR5/40FpSpHJRryYvkj+Y4pSz81p8tH3t6nJeOTz8pZBwuanmis593EKlQNVWbgrbygTKTQPxl+vY4tcUUvy9sKho/i/Tv2auEaCSYdjgEsVtp4MNy0DsfhTIyPIMcdNn4y5Db3ID+ZlB97IHHHx/oMjS+nV/E6rcyQ+DNwkkwEMMLFktkn+L4cdyvViUygsWlI72lCJdV5tnl9poHjGIwO6z+ye2AIHCq2JgYgaRUbLjw+aoddyXyhq0zqLMPnHgzv67V594nOXQ4nvYXgZJrTRQSt1JcgvYcqnyKrrVKv/6pz2rB0umki9+yugfr+eXtVw8B61g4QUaycLqlbhtKFXPzY2QuIsNEiCNlkQL+NLIijEBZqqprwzIr/dS5FaV9F0KXInMAeCPCQ/men0bcfo2ORI69Fp/g1jV0z3UH+LVDNfZuBWqFPfd+SlkojcKuIxkeSkSiVidLTpuCCXeQqClxnSPIlvDj22myd9CeQRX8ohXwZ83v2FxZdZi80Aaoyl7+33rZ11fKEt2dCKNZ6FpFSN6NAQLlez97Vi+OdFlrXouFptc2+3mkdh2GzsAupOcplSEEsTgLxrK9TFZdPOV2zqaMnlW0j998IFqfighqE65QDppaHUlilEG/iagAPW6DxZRb/sbMg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(14060799003)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	seq1148Zwu9SCWW6vv7J+1E27n07alLQh/A4FeSftXnOzLrhN3N5Domh3/NLJ6pVNoUtqzlamz4fRcbnUJKzHABUlEl0imggJexDo/4pMA7dm9Wz6du0XyRWIJGcp1AOJQTRqBPLDILjqrujbN52Y87wx7y0tTy9s0CS4P/fp0TxmQiP1gLe4RAbFQ4Fi4k6LFF8/C8W3PecRdxNMXBSzUOJmZfge1eTTSrwiWpXFd4KrKWJ8x29So3piN7Z5aOg6SSnuwarlS5mFSHlas94srfkbY/SJlEIRthuOf3nT/g5QRvbLU7XbQai2CfsbJRO4Bg/Lg9M5l44shtTyeEDo/7vOy97krqUr1hqURiH/ANk7WtU6ZOQ6GRCu7T6Q6Hi1VGZpFDsyT0DSMF303JWTZyv19xM6D+gm6PD11/Rh6q4EkMbJw1ZxGwTItH2GTfR
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:53.3782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4385a638-582a-4d8e-659f-08deb9a469d9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

The LX2162A Clearfog board has a green LED on each of four SFP ports.

Describe in device-tree that their colour is green and function "lan".

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 6fd85a5cac94e..99ee2b1c0f13b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
+
 #include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
@@ -38,6 +40,9 @@ leds {
 		compatible = "gpio-leds";
 
 		led_sfp_at: led-sfp-at {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -45,6 +50,9 @@ led_sfp_at: led-sfp-at {
 		};
 
 		led_sfp_ab: led-sfp-ab {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -52,6 +60,9 @@ led_sfp_ab: led-sfp-ab {
 		};
 
 		led_sfp_bt: led-sfp-bt {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -59,6 +70,9 @@ led_sfp_bt: led-sfp-bt {
 		};
 
 		led_sfp_bb: led-sfp-bb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";

-- 
2.51.0

