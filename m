Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023134.outbound.protection.outlook.com [40.107.159.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CC3A1D02
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.134
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425955; cv=fail; b=VcxxkZYaymMsZkCVGsjEpRcElXKcl3jwGkQpiW5XNhk7B6pyE6qKey2dV1lyHOzzJhvHs9/H2H3/CZgkicS+8CrEt9ezaXbtgO1zQlEfKqqmnIvFfhWucii/lpo5h3QZP4MjOqdTZRZiIsmt9KDo3bz2uxqHp2+jSsEX+Uwjikg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425955; c=relaxed/simple;
	bh=mdoVGWeNuoA/YpgR9B3kUIwif0+OPX2aHpF9L+pRzW4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qNNbEgt66CAPmxatYvmjxO3n/gd71u+fLEWgrFFO7GGih9pK8drfN16gz1OjXOFHuu68MT/cOEYlR0HXRFdMDlJTp+ari+VNtT9dJbzYqJLq24ak+rg7fXTG7yQ+g8CCn37QIE3cCtHpxGXtkxc+ghjZZy4W1SQH83UJ8r/1dCk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gIYDR5fa; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=gIYDR5fa; arc=fail smtp.client-ip=40.107.159.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gIYDR5fa";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="gIYDR5fa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c6vtrHLgFs30uBuRSKeskYADkVN0UNu1bGhb25a+gHDC7VnI8lb9nUX+Wk4yKlpuSCcmtw+OU200hl7artkpMRUj2zGCmCmfhrZtcE4TCuj37i4nV0+Ux6/M5U6ie0q+Wz7P44dQ9j0K2MKoJp7FDlVIKrR9TWK0mtarscps7KJLlA+hWUQEL77YQhmAOKZXu1vcIBgb3cn8DxCfoJRNkqmnpRdb/ydyUrTuCI5+UX0Av3Xq+HxDQ5f/8QeohpQp/rsJm2kuM7WlAKC23E5Hs+p763JM6AkiF7ZuPz7kRD3GQqqGSHfgAUCfHB92H01J553+yK+Zqts/5bthS7a+qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN38BoaSgkwD7+6L4ArKxwbS66akbPI+5REaRjyRp3M=;
 b=JFoOHKrbdBW+XQzTXcW8PqJUBfN8LR1cNLljsV/GdChHHGwBKo5J38aOeo0Yi9iwQ6NuIR/7IbIt6LjAR6f+rFH6GvnVh8zkSzcy3qLFnXM2/ubSnQWXT4FPuzCU+tqrniKELe2Nh8foC4CFfMLqhfVmIubayrpTggM2VGoxJRBuOQfYN8m02g8URN4FnC+He1k27O2bA8/W4cy8M80LkSFJ2pWGiAse2QzBIOzSWHEXesSqHIqsd1vVTIyrJK94DjypqAc8G3mXrfw8/kYoQ/hAu35s53rMg1eFu6APsNw1ciCjBqs/Y00T2d6g4evU1B6GhsGzjAeb8LJRAXj8Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN38BoaSgkwD7+6L4ArKxwbS66akbPI+5REaRjyRp3M=;
 b=gIYDR5fa9EXB9rOb60D+L2z8qDqnoHgAUh5FC+lHfF7y2YvJqLl7aGhkx9Zdmq9AZDphFMEAdRIMhz0r9W9wxG3a4xoIZ0HTyUOXdRfCli3ZqZTOHVNWxUO0xT+D9gpmVzRvDIORNGvbeu37shxoZNa5kJ5v/zshCZSmSOi7NfS4jj3hxtPs/fTsYMMR7r7hMNmJzjAkOLpt+oiXDowvLO9itvJ0jqCd6xuZ6Ir5o4lLvLH3eizdmzyjMWmZK1mGmU3uXvyP56kNhBE0Pq205f/PT5iJ1BzT3QPGqllT658oF1CnzeA3C+SBF+5Pxmx9oOTS+N/W0KHdjou2LBDZWw==
Received: from CWLP265CA0408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::21)
 by AM8PR04MB7748.eurprd04.prod.outlook.com (2603:10a6:20b:243::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:26 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::85) by CWLP265CA0408.outlook.office365.com
 (2603:10a6:400:1b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:26 +0000
Received: from emails-6537907-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DF697805BC;
	Sun, 10 May 2026 15:12:25 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:16 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg0wUds1s0a71O2knE2wZGdw8tKrDLrOtfYl2HRGU9p8HCNRyQC/tkzIsFMLxribOLb0uLubpviFfW1d8bPHtCs2SDio7sD0zFcIEbvAQ0BHCx+IwCHpQyJQNHUdZVQGeIkloynZqciz9Hd6Wifh4phKHxjFum0VedqYi0L+ECyZUaLF4DS/ZGaSy9BAqZVbVfXbVbn7fGRFJM9Em5IbivsN+WBM9DnkHopgPJv989M1tzLOJe8sRNyE+wd2m/rxy7oav0aaz7h48rdbFBqpL4AXZhN/KfYS74gLV7i3Iq2msgeaO6JI4hQYWFFGnV7VQ5FSGFfctkpNRd5t/rzLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN38BoaSgkwD7+6L4ArKxwbS66akbPI+5REaRjyRp3M=;
 b=abW1dQi8dZAWLgcePG/+9g7nxNz6nfspLpNML+EHFoG6lhPwYSTGAw6gQJWEHpEVNT1hOXar2ziubncN8LUHbOr7LhOHRYeQXDm+L6+LvjnxEol2gpxQtc03PmCFq7QDXqPxbjxAVgrHo3H3VESpsokFg62eZuB7qMCxTS6il+HkW82rxBynFPPNsfOhjSsZmCSOsODDIZPzX/5Tgfu8NKhrEMpS6JXgqXcVBfpYmQKEiRhaYfVaUw4kCHRXXcHrw6pFkYcEuhHoyYlJ9TYj6TW9WkBtb1IObvQt+pCj/7dnxIADhEHjUtUmmK7uvlYk0Hh7S7j+WtaW77b/NvO9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN38BoaSgkwD7+6L4ArKxwbS66akbPI+5REaRjyRp3M=;
 b=gIYDR5fa9EXB9rOb60D+L2z8qDqnoHgAUh5FC+lHfF7y2YvJqLl7aGhkx9Zdmq9AZDphFMEAdRIMhz0r9W9wxG3a4xoIZ0HTyUOXdRfCli3ZqZTOHVNWxUO0xT+D9gpmVzRvDIORNGvbeu37shxoZNa5kJ5v/zshCZSmSOi7NfS4jj3hxtPs/fTsYMMR7r7hMNmJzjAkOLpt+oiXDowvLO9itvJ0jqCd6xuZ6Ir5o4lLvLH3eizdmzyjMWmZK1mGmU3uXvyP56kNhBE0Pq205f/PT5iJ1BzT3QPGqllT658oF1CnzeA3C+SBF+5Pxmx9oOTS+N/W0KHdjou2LBDZWw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM0PR04MB12004.eurprd04.prod.outlook.com
 (2603:10a6:20b:746::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:15 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:15 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:12 +0200
Subject: [PATCH v5 10/10] arm64: dts: Add support for LX2160 Twins board in
 single configuration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-lx2160-pci-v5-10-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
In-Reply-To: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AM0PR04MB12004:EE_|AM3PEPF0000A791:EE_|AM8PR04MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 65562a87-5b1b-44c7-a4b1-08deaea68b8f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014|56012099003|3023799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 dmZsoNmHiCQqrrunzlFDACt6ECtS7DqNSRMYk/f45TmC+GkJkzkFuzY2yHtiLH1GKo1qdeWzQntw0BisyvOnbVol6bnoD4FrG+yOkwtGaDf/dkkube/b9+S4fz9c/RQQ5RbRxUNHVLZTw8+L2c0NZ58OQR8hLJ6Jk6CJhdYjdwxjMEazyWq11HZRhqwYYp20I9Fecu7K9OIEeurrgL7AXSYK5VuIyRqVZQ6nWTK9mofeUo3xu3wyqfVEQyAKaIpzt40BTPVnj3rSyae+Yrz1t6hvX3FY/067msq489UA+n4MgMsGYCGYnLDfVVsaJMeRmu0I8H1jJztbjaXxoRf6RZDuLJAJtH9e74WjOeM6Qiu732dXjg1V92qSCG+q5MbtKHpc2KtnpRfaFP3LStubL1UHeHotIhhj9e6HqDwbl8EJeMPiRSnaYlSRkjduUuhHEZZjzBerB8lzREa/UxCtHco6qTiUcMscqRcrodEMVKlz4ZbSm3/VHIIAVfyW276ZJOtBghPaXc0QcgtqJFpAs+HDggDY22AmahSjFJ8sDxQ3tzrAIzN51sLq6u1kP6C0am7txcE6YOAmNYBaX6CB13iyLXmvU1cLqvoHlXIP8UaLrGJfxYXJ5YZSzzVkwOl5wrw2WljallmJ0OHBsgPBaeOpv3yOztnC8c2CJ8XNRv/Brjlyp9djfjQg0DrhBL576b6jIfPeEGSIMgikg3UUc4/bpjZBGX06gUAR6N/fpAVgLkr0vOnH2tCIlFV/RbJ91IhWTTYk/kBiMRNc787MUQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(3023799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 v2vgjgV12Y6Evth1+YY68YH0S3eTrrm6dXl+ejfAM7zvjnfFGTE+5Rehlpj/9sFH8xqzKgvQUXqtSWbVqRvoT232zEsv+qNyApO7vkAowoq6HCRD0z05+ScOrivDlZ+SiB4JRqOmdXcP3ShqDA6QbYdZLe4SmXklRx/1b/yfJ0n8NhM3eBo/biFHvuFwlCafpFLjIqWYWhj/wbbDlK+N238cIcjIwKhVd7ABb34LxXekWHPaP/soBFPc1YULXGlKQnojCTyb+Xl0L90M4797wYABN/wwbj4n4avZO+8+XFRHxv1ZqDAwb6Sxow5/AtVrTx0VKBwbf/UJGXOvMCGvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12004
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7ad2fa9227af45b0a6d47ec9c57fe558:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	196fe292-bd79-4de4-56b9-08deaea684f2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|35042699022|1800799024|82310400026|14060799003|18002099003|22082099003|56012099003|3023799003|921020;
X-Microsoft-Antispam-Message-Info:
	8Df4gkXruzFOUDSFWVWBCNr569QkN8Z+da+LgFso5vce0sheeiONWbep4C2YM4Ggqi9ZLL1ZOnovNiuaKmd4ncgG0+j6a2w0q5RBzF2KZBwZ4cUktKtnZBaYRkj8o13v0dBcP+db0o5Suy1Z1dk9UIpYOYMepMbtJAQDO0R3pq3uCP4xhRaCufUlCzZOemmVWsgd/V9PUu0AbI1AEz6kkvmCxK6/vXE2iLbJWNbA9BnTPZ7SS6SIb6AUm4YDDCS+Pv/lNTl0UN3aVFgdXY939hKQ6KMSNoVC8e0A6K2EepMwbuPy8anbcDbOgmPkhnHbqYYe2DtQ3U1QP+fjyB0bO4M+lYj/ba84ERGmBitEYHPaiMU7n3ldAzaD+A0lOlHLn0n06GuNZlCvtXeM272GKLyOml/ZpOlLYIVbHWmJBJrO3+U2l2KcP+vGmrtisbsGr950X0uDdrhWjRI3RoTlCVmNA0GqiXCwW9dSWgb8m/ZpFUZTQYlzbfP717AgAG/wxOW00Y9WjE4XORhUM1vAn0flUDmh8ZUGyRirPjai2rNNXUW4g3kCJjYK0Ya2sAU7ce92vo6PectOA4Ypt9EYdgirsHcC9Acs1NNrhTbbeGxztV8ZzHLcyVuXjRvBJ6s4P9Iccdjntroa7P9ojMvv5ULOGhxS5Foj57Vq+PwVfeczXJhK0BsqQIssi0+FJvq0fkzmWu7KwPDuqrB29LPACwGtVHl0O/VGLjDayfdA6XzjXfYVYPFTBvh3gxm7yeaDZE5AFU/LHM2j3qC36W+EnQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(35042699022)(1800799024)(82310400026)(14060799003)(18002099003)(22082099003)(56012099003)(3023799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3oWRCHAbJA8z7zZ8V5aQ+XqxeK1Y+EIh+iJjk3fZ1+dh3pSA0fi8NQVwUa8Tsax8Wpjka8c+YDIEUMOuO8a1PjJHTy0DC4iUbLpc4AswI89E3GvW2GHdUEhB9i9blWJO7vYafcHZ2L22UNFCh0k+EbgML31A+CCXV8x9s/VaBSdqZobzquoGpxEqXdtXIz68ut5U9st6g6TSTiCQLNzZQBLYs91tEUJ0j+cEnLl8lrwIYfuN7BpJqVUDdV4QdjNmkUx7ZlLeDMfMCn5BxJCvDNqCbTFzocreb+2sO6Uqifa3AYjtH5VJx13c/iX5KNz9yt3ZCeWBYHc/c+ZwhQa8xzGbXAzeZIcKaQHTQkGKuDcTgq7aJfPXaxr/LMjtNpK7ehfVVZDfYYrT/nExu83toMmDlEiSZ3Mv3ehpOIXtAhK1ycrgtj4vRx/Yl3n5yw33
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:26.1440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65562a87-5b1b-44c7-a4b1-08deaea68b8f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7748

Add support for the SolidRun LX2160A Twins board in its single cpu
configuration.

The twins board is designed to host a pair of LX2160A CEX-7 modules,
sharing a single PCI-E connector in multi-host mode.

It may be assembled in two configurations (different assembly options
facilitating signal re-routing), with a single or with dual CEX-7
module. Their marketing names are:

- SolidWAN Single LX2160
- SolidWAN Dual LX2160

This patch adds the single configuration, featuring:
- 8x SFP (1Gbps)
- 8x SFP+ (1/10Gbps)
- PCI-E OCP card connector
- USB-3.0 front-panel header with single port
- microSD
- dual hot-swappable power supplies

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +-
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 822 +++++++++++++++++++++
 3 files changed, 825 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..59eee431562ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -51,6 +51,8 @@ DTC_FLAGS_fsl-lx2160a-bluebox3-rev-a := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-bluebox3-rev-a.dtb
 DTC_FLAGS_fsl-lx2160a-clearfog-cx := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
+DTC_FLAGS_fsl-lx2160a-half-twins := -Wno-interrupt_map
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-half-twins.dtb
 DTC_FLAGS_fsl-lx2160a-honeycomb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
 DTC_FLAGS_fsl-lx2160a-qds := -Wno-interrupt_map
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
index 802d7611c6479..6078ce47fabf1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
new file mode 100644
index 0000000000000..434b3f4873008
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -0,0 +1,822 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for single LX2160A CEX-7 on Twins board.
+//
+// Copyright 2022 SolidRun Ltd.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "fsl-lx2160a-rev2.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
+
+/ {
+	compatible = "solidrun,twins-single", "solidrun,lx2160a-cex7", "fsl,lx2160a";
+	model = "SolidRun LX2160A SolidWAN Single";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &expander0;
+		gpio5 = &expander1;
+		gpio6 = &expander2;
+		gpio7 = &expander3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c2;
+		i2c2 = &i2c4;
+		i2c3 = &fan_i2c;
+		i2c4 = &power_i2c;
+		i2c5 = &i2c_smb;
+		i2c6 = &sfp0_i2c;
+		i2c7 = &sfp1_i2c;
+		i2c8 = &sfp2_i2c;
+		i2c9 = &sfp3_i2c;
+		i2c10 = &twins_sfp_c1_at_i2c;
+		i2c11 = &twins_sfp_c1_ab_i2c;
+		i2c12 = &twins_sfp_c1_bt_i2c;
+		i2c13 = &twins_sfp_c1_bb_i2c;
+		i2c14 = &twins_sfp_c2_at_i2c;
+		i2c15 = &twins_sfp_c2_ab_i2c;
+		i2c16 = &twins_sfp_c2_bt_i2c;
+		i2c17 = &twins_sfp_c2_bb_i2c;
+		i2c18 = &twins_sfp_c3_at_i2c;
+		i2c19 = &twins_sfp_c3_ab_i2c;
+		i2c20 = &twins_sfp_c3_bt_i2c;
+		i2c21 = &twins_sfp_c3_bb_i2c;
+		i2c22 = &htwins_sfp_c3_at_i2c;
+		i2c23 = &htwins_sfp_c3_ab_i2c;
+		i2c24 = &htwins_sfp_c3_bt_i2c;
+		i2c25 = &htwins_sfp_c3_bb_i2c;
+		i2c26 = &ddr_i2c;
+		mmc0 = &esdhc0;
+		mmc1 = &esdhc1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_ht_c3_bt: led-sfp-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
+			gpios = <&expander3 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac5>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_bb: led-sfp-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&expander3 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac15>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_at: led-sfp-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
+			gpios = <&expander3 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac6>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_ht_c3_ab: led-sfp-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
+			gpios = <&expander3 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac11>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bt: led-sfp-9 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <9>;
+			gpios = <&expander1 4 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac4>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_bb: led-sfp-10 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <10>;
+			gpios = <&expander1 3 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac17>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_at: led-sfp-11 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <11>;
+			gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac3>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c1_ab: led-sfp-12 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <12>;
+			gpios = <&expander1 2 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac12>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bt: led-sfp-13 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <13>;
+			gpios = <&expander1 10 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac8>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_bb: led-sfp-14 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <14>;
+			gpios = <&expander1 9 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac16>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_at: led-sfp-15 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <15>;
+			gpios = <&expander1 5 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac7>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c2_ab: led-sfp-16 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <16>;
+			gpios = <&expander1 6 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac18>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bt: led-sfp-17 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <17>;
+			gpios = <&expander1 14 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac10>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_bb: led-sfp-18 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <18>;
+			gpios = <&expander1 13 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac14>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_at: led-sfp-19 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <19>;
+			gpios = <&expander1 11 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac9>;
+			linux,default-trigger = "netdev";
+		};
+
+		led_c3_ab: led-sfp-20 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <20>;
+			gpios = <&expander1 12 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&dpmac13>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-status {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <0>;
+			gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-status-twin {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led-fault {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <0>;
+			gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+			panic-indicator;
+		};
+
+		led-fault-twin {
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "off";
+			function = LED_FUNCTION_FAULT;
+			function-enumerator = <1>;
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * This gpio controlled mux can route the tacho signals of 6 PWM FAN connectors
+		 * to the tacho inputs of both CEX-7 modules (twins).
+		 *
+		 * The first twin controls this mux and monitors four fan connectors, two intended
+		 * for itself, and two for the OCP card.
+		 *
+		 * The second twin monitors only two fan connectors intended for itself.
+		 *
+		 * The table below maps selector GPIO states to monitored fan connector per twin:
+		 *
+		 * | SEL1 | SEL0 | Twin 1 | Twin 2 |
+		 * | ---: | ---: | :------| ------ |
+		 * |    0 |    0 | J10    |  J5024 |
+		 * |    0 |    1 | J5016  |  J5024 |
+		 * |    1 |    0 | J5026  |  J5025 |
+		 * |    1 |    1 | J5013  |  J5025 |
+		 */
+		mux-gpios = <&expander0 8 GPIO_ACTIVE_HIGH>, /* SEL0 */
+			    <&expander0 15 GPIO_ACTIVE_HIGH>; /* SEL1 */
+	};
+
+	ht_c3_bt_sfp: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 13 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_bb_sfp: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 14 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_at_sfp: sfp-3 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 11 GPIO_ACTIVE_LOW>;
+	};
+
+	ht_c3_ab_sfp: sfp-4 {
+		compatible = "sff,sfp";
+		i2c-bus = <&htwins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander2 12 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bt_sfp: sfp-9 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 3 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_bb_sfp: sfp-10 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 4 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_at_sfp: sfp-11 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
+	};
+
+	c1_ab_sfp: sfp-12 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c1_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 2 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bt_sfp: sfp-13 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 9 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_bb_sfp: sfp-14 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 10 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_at_sfp: sfp-15 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 5 GPIO_ACTIVE_LOW>;
+	};
+
+	c2_ab_sfp: sfp-16 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c2_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 6 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bt_sfp: sfp-17 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bt_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 13 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_bb_sfp: sfp-18 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_bb_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_at_sfp: sfp-19 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_at_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 11 GPIO_ACTIVE_LOW>;
+	};
+
+	c3_ab_sfp: sfp-20 {
+		compatible = "sff,sfp";
+		i2c-bus = <&twins_sfp_c3_ab_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+	};
+};
+
+/*
+ * This board supports industrial grade temperatures,
+ * the LX2160A SoC maximum junction temperature is 105°C.
+ *
+ * Raise thermal thresholds to allow operation near maximum temperature.
+ */
+&ccn_dpaa_alert {
+	temperature = <100000>;
+};
+
+&ccn_dpaa_crit {
+	temperature = <105000>;
+};
+
+&cluster2_3_alert {
+	temperature = <100000>;
+};
+
+&cluster2_3_crit {
+	temperature = <105000>;
+};
+
+&cluster4_alert {
+	temperature = <100000>;
+};
+
+&cluster4_crit {
+	temperature = <105000>;
+};
+
+&cluster5_alert {
+	temperature = <100000>;
+};
+
+&cluster5_crit {
+	temperature = <105000>;
+};
+
+&cluster6_7_alert {
+	temperature = <100000>;
+};
+
+&cluster6_7_crit {
+	temperature = <105000>;
+};
+
+&dce_qbman_alert {
+	temperature = <100000>;
+};
+
+&dce_qbman_crit {
+	temperature = <105000>;
+};
+
+/* sfp port 11 */
+&dpmac3 {
+	managed = "in-band-status";
+	phys = <&serdes_1 7>;
+	sfp = <&c1_at_sfp>;
+};
+
+/* sfp port 9 */
+&dpmac4 {
+	managed = "in-band-status";
+	phys = <&serdes_1 6>;
+	sfp = <&c1_bt_sfp>;
+};
+
+/* sfp port 1 */
+&dpmac5 {
+	managed = "in-band-status";
+	phys = <&serdes_1 5>;
+	sfp = <&ht_c3_bt_sfp>;
+};
+
+/* sfp port 3 */
+&dpmac6 {
+	managed = "in-band-status";
+	phys = <&serdes_1 4>;
+	sfp = <&ht_c3_at_sfp>;
+};
+
+/* sfp port 15 */
+&dpmac7 {
+	managed = "in-band-status";
+	phys = <&serdes_1 3>;
+	sfp = <&c2_at_sfp>;
+};
+
+/* sfp port 13 */
+&dpmac8 {
+	managed = "in-band-status";
+	phys = <&serdes_1 2>;
+	sfp = <&c2_bt_sfp>;
+};
+
+/* sfp port 19 */
+&dpmac9 {
+	managed = "in-band-status";
+	phys = <&serdes_1 1>;
+	sfp = <&c3_at_sfp>;
+};
+
+/* sfp port 17 */
+&dpmac10 {
+	managed = "in-band-status";
+	phys = <&serdes_1 0>;
+	sfp = <&c3_bt_sfp>;
+};
+
+/* sfp port 4 */
+&dpmac11 {
+	managed = "in-band-status";
+	phys = <&serdes_2 0>;
+	sfp = <&ht_c3_ab_sfp>;
+};
+
+/* sfp port 12 */
+&dpmac12 {
+	managed = "in-band-status";
+	phys = <&serdes_2 1>;
+	sfp = <&c1_ab_sfp>;
+};
+
+/* sfp port 20 */
+&dpmac13 {
+	managed = "in-band-status";
+	phys = <&serdes_2 6>;
+	sfp = <&c3_ab_sfp>;
+};
+
+/* sfp port 18 */
+&dpmac14 {
+	managed = "in-band-status";
+	phys = <&serdes_2 7>;
+	sfp = <&c3_bb_sfp>;
+};
+
+/* sfp port 2 */
+&dpmac15 {
+	managed = "in-band-status";
+	phys = <&serdes_2 4>;
+	sfp = <&ht_c3_bb_sfp>;
+};
+
+/* sfp port 14 */
+&dpmac16 {
+	managed = "in-band-status";
+	phys = <&serdes_2 5>;
+	sfp = <&c2_bb_sfp>;
+};
+
+/* sfp port 10 */
+&dpmac17 {
+	/* override connection to on-COM phy */
+	/delete-property/ phy-handle;
+	/delete-property/ phy-connection-type;
+	managed = "in-band-status";
+	phys = <&serdes_2 2>;
+	sfp = <&c1_bb_sfp>;
+};
+
+/* sfp port 16 */
+&dpmac18 {
+	managed = "in-band-status";
+	phys = <&serdes_2 3>;
+	sfp = <&c2_ab_sfp>;
+};
+
+&esdhc0 {
+	pinctrl-0 = <&esdhc0_cd_wp_pins>, <&esdhc0_cmd_data30_clk_vsel_pins>;
+	pinctrl-names = "default";
+	/*
+	 * Disable 1.8V modes so that microsd state is same between
+	 * power-on-reset, u-boot and linux.
+	 * This avoids sporadic read errors after hard reset with some cards.
+	 */
+	no-1-8-v;
+	status = "okay";
+};
+
+&i2c2 {
+	expander0: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	/* Half twins configuration; take over c3 from the other twin side */
+	i2c-mux@73 {
+		compatible = "nxp,pca9547";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		htwins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		htwins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9547";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c1_at_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_ab_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bt_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c1_bb_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_at_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_ab_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9547";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		twins_sfp_c2_bt_i2c: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c2_bb_i2c: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_at_i2c: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_ab_i2c: i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bt_i2c: i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		twins_sfp_c3_bb_i2c: i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&pcs_mdio3 {
+	status = "okay";
+};
+
+&pcs_mdio4 {
+	status = "okay";
+};
+
+&pcs_mdio5 {
+	status = "okay";
+};
+
+&pcs_mdio6 {
+	status = "okay";
+};
+
+&pcs_mdio7 {
+	status = "okay";
+};
+
+&pcs_mdio8 {
+	status = "okay";
+};
+
+&pcs_mdio9 {
+	status = "okay";
+};
+
+&pcs_mdio10 {
+	status = "okay";
+};
+
+&pcs_mdio11 {
+	status = "okay";
+};
+
+&pcs_mdio12 {
+	status = "okay";
+};
+
+&pcs_mdio13 {
+	status = "okay";
+};
+
+&pcs_mdio14 {
+	status = "okay";
+};
+
+&pcs_mdio15 {
+	status = "okay";
+};
+
+&pcs_mdio16 {
+	status = "okay";
+};
+
+&pcs_mdio17 {
+	status = "okay";
+};
+
+&pcs_mdio18 {
+	status = "okay";
+};
+
+&rgmii_phy1 {
+	/*
+	 * COM has a phy at address 1 connected to SoC Ethernet Controller 1.
+	 * It competes for WRIOP MAC17, and no connector has been wired.
+	 */
+	status = "disabled";
+};
+
+&serdes_2 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&wriop_alert {
+	temperature = <100000>;
+};
+
+&wriop_crit {
+	temperature = <105000>;
+};

-- 
2.51.0

