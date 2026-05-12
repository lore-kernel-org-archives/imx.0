Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021108.outbound.protection.outlook.com [40.107.130.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C853C7696
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.108
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596778; cv=fail; b=nzZbPYlwFltrh4VDugC2NMF1r/v4jZ3upV/HgC+nLZLn+Nv1WZSpcy1hnMbXN14QliDRUJOqslBd3DI6oDV3ypbFf0KYxdwLRFUckujoTs/DGdpKyPycZxFu8iwKZOw1J9cVf1JTbPmaZtColUrzy14OqGxqj9W/Tjt1w0RQQaY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596778; c=relaxed/simple;
	bh=qJ8EcNYk8wCPP7KcHlIwjSwzVkhGztjQCgVpPnvNwxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T3hq3W8DkFlHCvPWHAXAnutu4lDVhZj59Sqjzx5PY9p4uUnj6CLQV/2JaA6dKYDuEnXwyPiO/zlIw9BLItV2fAayrVS6kJLHkGJsjmYhdedGGnipGj7xX6mS6JO7kT+sO/ZPYtWCXRq2oW2Jfv8nop3c1uxDKwROKeiI8qvzsGU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=YzJ/lQ+g; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=YzJ/lQ+g; arc=fail smtp.client-ip=40.107.130.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="YzJ/lQ+g";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="YzJ/lQ+g"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mZpl9Q5LFDfaG4mkx8U/hU0xnB+0nUtHOH0POU4xUFD5/Cn5UVoQYrYxmg/VF19V8Jj+lDq/zZVI+woNWHJnraKLwiFYTlU3WJBABj0tU4idsETemXnZyDszstYzUmEEhS61lEKqOO3mqpcra1eCV067HrCTKmoqjHEqmNtnLKTA3riwyyT1NGEfjO31LBQp94XU4bEuoe9BBOHteZn/U3xd+leIMAIHshMBi1Jh+QY6498CqRKckFxhn5i/PGFEc/MGUwc+yJoNcSLAZWCYSUOSNed/MB3q1bY9aQ1G+C2e6jeXTwQ0fs5mQjjND+onboN2lL/gZV+f88mBjAESSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KaWL8M041z37dIq6RhigKNhnr5is8x+tu6l3WUW+rI=;
 b=B7TRuc7/N/vOgxlfo8Cz1GFBFzBEgPPyADiGPP+qR/NyMU0YmtObGt47cUASm7tjL7JOK9MHdm095a2o17aEtLDDG7Uren38+UHzTKXWEP9u2ZdoEw3fqCTEoRHZ2+fNkUsu1BzB6UhTljTv8gmuOpwb3AnBJR1uhZREauAfSyR2XH0uvidoQiX9PvsrH0t4rA/UdkGUj4XCa//IihhT7vhR8DWqzxJTuxj3rDByLHOje046WPVraSR/BGTnrhBv6IDv4rbDzcYrG8zXFKNSJHgEKIis0KbOitFAI+ews8rOMZ2Crqm6J1ZngGSIV3BvNWbLZuzdLGTHM3TpO1iiOQ==
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
 bh=8KaWL8M041z37dIq6RhigKNhnr5is8x+tu6l3WUW+rI=;
 b=YzJ/lQ+gS8tp7lvWOxlkTvJIDpPpoWQaTl7pp3wYKq9wKjt/tRqKrcHoEGHmxcvqLi2Z0/vYWFf4R1sYYvde7mknBD010F7WfZpxnzoSPxnsLyi7flNmkcaLytK0MJGijUzC2Dj6gHmyoPhbvR+w4xeENMMdWKXk9NwKEqNgzitx1RWjVgcay7nSrjwB/RMFJctixG/qazWQuf2GiLONR6WNqWYNBEq0uvDPDkzZ7pKsYngsADveZI81bQsVTvUk/x15+9Crbas/2ZA9DDSp1Nt3bTzuCQww4GRtLCAiG/PY8EsLlPQdqZvkjsWAhQHcVuOZGiWxcovNMdVS5QUi/w==
Received: from CWLP265CA0411.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::13)
 by DBAPR04MB7446.eurprd04.prod.outlook.com (2603:10a6:10:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 12 May
 2026 14:39:28 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::34) by CWLP265CA0411.outlook.office365.com
 (2603:10a6:400:1b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:27 +0000
Received: from emails-106719-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 970417FCE3;
	Tue, 12 May 2026 14:39:27 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:11 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mByT5tTHsDLwLgD+k2YL66A++Ng2PFUtgw2gagx04UsiEaPChGwpbGuGfckccPVQXxcpayelXbRS+NEpmIYQ4psUyeUnPz2cjuRHd7IqfW4OfVVfrM39AxdMiat6ZNwRlcsCt7biAMME4rU3h+hK8exTkYoe3cEKNz1sAZ1UBmZDeL/OgQP4slOQbdri45A2S7NKOr1P55/sRsx1mNYZ9y7RMkq42nHbOgtFXZLOPxUJdGJ4wr30YXw1N3TRYAVrecW05PxsIfJGhmJP58KVue+6x2NB45LUsArapdr0LLIqz/GVG3sZCLFSyJH2HVUYohT3RXvJoIAaEQCkAp7qaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KaWL8M041z37dIq6RhigKNhnr5is8x+tu6l3WUW+rI=;
 b=jnG5NmeHvpir1j9+2JY2WiR4DBdLkNxmlodoZ8ESpaK1d03L5M2MYoVIy2NQI90ZIgJw65QLy9lsBX8DU3JLiR/9EpbOjoyqsKO0KxAjTRFde35POiWog6Mn0mPVtIGE0cPR/TSHCAMYUuvOnEdVUy1uQxt4u1OnokEyE5JTd8R7mbmqsv8xhtPhLpFdFVocQjcS8hWF5BHmoU8fnqv7yo/fFjOioEcP7eidYWt8vS54ZFO69ut0M2xLnamsNLNzQ+krATpW3uLeTBhvtUTZZSyCf0oKSqBgBcjpCzgrDqzQHR7Gj4haBG1UgxCTsyLacNdc7RXrKFsiOops/+wYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KaWL8M041z37dIq6RhigKNhnr5is8x+tu6l3WUW+rI=;
 b=YzJ/lQ+gS8tp7lvWOxlkTvJIDpPpoWQaTl7pp3wYKq9wKjt/tRqKrcHoEGHmxcvqLi2Z0/vYWFf4R1sYYvde7mknBD010F7WfZpxnzoSPxnsLyi7flNmkcaLytK0MJGijUzC2Dj6gHmyoPhbvR+w4xeENMMdWKXk9NwKEqNgzitx1RWjVgcay7nSrjwB/RMFJctixG/qazWQuf2GiLONR6WNqWYNBEq0uvDPDkzZ7pKsYngsADveZI81bQsVTvUk/x15+9Crbas/2ZA9DDSp1Nt3bTzuCQww4GRtLCAiG/PY8EsLlPQdqZvkjsWAhQHcVuOZGiWxcovNMdVS5QUi/w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:01 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:01 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:38:56 +0200
Subject: [PATCH v6 01/10] arm64: dts: lx2160a: extend 32-bit, and add
 64-bit pci regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-1-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
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
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|AM3PEPF0000A79C:EE_|DBAPR04MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: e10c97a5-6a94-4975-f12d-08deb0344541
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 030B3LyTV5TQOF9Rfp4+mxN5+aN0YSNFJDMU2861+bruyntuBEa+zeF/+dbPPqaG7HhK6WMMikK1DVOClTVdJc/DoT5tqPpJnG79Rj6bwKNWHjJP64QubbF0so+9crW34pYZGxMl2n6H3aNtSGGJRqWAM2fZtdMbgg93suhZMhMN1v0olJhw0d+kM1J2i1EFy8T6W+BgKw1Ny6MfvsLjjmN1xkysT9Lz/jN2p05ZlmEdaNoy6ZRjS4w6NUJ5fvx8DlW3HtQRUXPaeaJvFjltFGKxM0X3OVWhZBUx8MrJ3rm0tGgVUEK4xaW6kRPy8K8PKyxoMp8l1YbE6YBFEnYPx/RJFr2Sh6tx5ZID1eWtWwlwPaGTcaAU581jsPlQdhO7XA664Kv5BI3wH0IjR25brbWTU18VW/mOoD3OzRgkxJ8kZC9+c65z8fGtNvH3iu7IyGM7eT+oqadxAm2XhO6bQtWH/SN7ylydEqep8Np3xPn6T4Z5HefGyeDsb3+UVnrfTUfkSJpA0hpI4sJJRZJZq8QGl2orq7TM9juIdlqKTum1xPW1S8KPowbG3F8E4dtTS5r10YEMdhsGGjIXnc8Tz3UDG6bayj6q2XKdFrouT8dWCjdwL+nxaRo//jaxVib8ToaK7OIoMj+k0U5NmTkSqK3l2vFosCwW9MANLfr/3lhV7xxoA1HtaX+afSwuLN0XG2MwcsVLebwjVxvFtxMLIkTDgPglPmpO5USQEUy1//mdfn4xVPtJ1QpAmgEogAzhzgnhDAN5U/OqhrKHfvVFmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Hmd0bik04rOXSZaO+JOC4kcwnXgyw75cYpq/QEQGDWQRJMW4Job1D4ALrbRePna52Yy40h8/rEYyJnNN7d4vYS3R1zZ4+LNnnfuHkiItt8u9yPUheVbD7t5+zeRbYkJC8j/2+0pIPiUIoEcHuQ8X6tXuq2XUlZ51dWNJwrGn1V5axuU29q0r2YwgWcR931txBg+f7AYPUMGF6I5CeMveoEa5IKWt8Pm5I8p5DmfYaFredsheTDaavGEOzWrCgRDWdaWly++HAa2sTwyLsbrWmMdE+J9IbO1U53dKvvPoUQjDaeG0HWbaEdLDRyJuO2iLBWiQVcNCZUbfpXLKYDScPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f3939ca5f76a4871bb30a499aa1e5ffd:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0177dcb5-9951-44a8-3f80-08deb034352d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|36860700016|35042699022|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HGKRmjaZH2cX8unbHxca5shJZrOKCyHV6E9nc0+mo6fT8QKwJYBgOfSmFVYlMFmjdcVIdjYkz57ivbYnFqlrJdP7L82r0SIDuv+m98QpJPOkCBtprEIh7qS1D9ot1yueL4UnsESp9Tep9jQPp3ftzVcaMlDhcv4+2UX007xPWNWYXd9FC731476EVFEaAT5NrGXyzKCUXaT7lFjt5OVD+Iq1pZOp7wSybEqtoHJO66t9ogztH1cLR+8Suu33EnNJ6Sg45j+/i4ucOzO3JN2OqlkdEKXA80q/0HMkuS1Y8PVDgVxNAa0V5XuEJcawZUuplGtJYa1H4KqWqIR1C2CJr6tnTF4/ZtPF0eiTygO8LwhQVfIYZKf1zmVa3+6N7cFRbyvpymOzJGGkhpHTclHk03m9fxiHuwCHlbsJA7pV0csht6HmrGjpladDBjm8GWU51Koby3MyhFr51+KfJ9yCsI6x4YSVduAGdlcb28qd4gGDw1AFl0n51g5IuKJzqta+BY430TdoTqE6NhjcO3UoRGZ0+dJzizvzufPGocOa1vjJixbFiIf9Iky/KzcZToZxZefAf8Ex5CVpD/QZHX0DPw+lPd0BbmrYAfzy7GdFNy0bFFHxlfpwce0A4cSRblzCgmZlGRwaOdpwWtUC6OGKC+KYrquj2IzNZNXKf+GWHTaTqF/YL0dTSAhpQNDJ0WsXrBU6xgexGyg5+XlBxP+au4n5vE6//qF8De09GJLDRrHU9Z1f25wnFeRQ4N5l/jZuwiZ+bL7oyyw5Xj12wctVsg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(36860700016)(35042699022)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3TDCx94ZryiUsYCx1yIPqyAxuhQc9Y9ZqipY0Hb+5rp7aaFGp8Zxn5ZGo7uYq31k4qaQtcxTVJ+R+ZQoUpcZyciNhkqXsKoKHPsag4paZeUEOwHbHKOfZ1ew9wc8RIh5upizuwChSGD4VdhjQCc+fg4QeJB/eOZI6DUpMaxzAHGdyZS9j9vaIveI1qCuYAWScaI/jJ0JZiSk0kERIwFD9/I2cwd4uH+mXn7e4SvTo2baTWititXnNRMV/gvrZhkWT1UINC0ceoxR1qC1o4iuKl+5ETwC2+FQ+sAuS+G2y3B3lj+w7la8mYTOE0FGjsKj9g5sPIp5ld3yK3ASbMDKoOFIwvSdG6/v6MqHPFCOcZeRYB6uDTMWBuUSyXigJgarNYDaVx/vLe4m5hFLATHqqphSSDIFyAsat/3nwWLjoq+QH610dj7/pu47dxlLGrtT
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:27.9129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c97a5-6a94-4975-f12d-08deb0344541
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7446

LX2160 SoC pci-e controller supports 64-bit memory regions up to 16GB,
32-bit regions up to 3GB and 16-bit regions up to 64k.

For each pci-e controller:
- extend the existing 32-bit regions to 3GB size
- drop IORESOURCE_BUSY flag
- add 64-bit region
See [1] and [2] for boot messages showing ranges before and after.

IORESOURCE_BUSY is dropped since it has no effect when specified in dts.

Setting IORESOURCE_MEM_64 flag on 64-bit region causes bootloader pci
patching logic and bar initialisation to fail [4], therefore it is
omitted.

For LX2160A Silicon revision 1, the 16GB 64-bit area is split into 4
pieces, because the layerscape pcie driver fails to program atu for
larger ranges [3].

Similar memory allocation with similar flags was tested with UEFI and ACPI
on pcie3 and pcie5, on a variety of nxp vendor fork versions.

This patch was tested on Linux v7.1-rc1 and u-boot, with two pcie cards:
- pcie5: Radeon Pro WX2100
- pcie3: ADATA NVME

This fixes allocation of large, and 64-bit BARs as requested by many pci
cards - especially graphics processors or AI accelerators, e.g.:

[    2.941187] pci 0000:01:00.0: BAR 0: no space for [mem size 0x200000000 64bit pref]
[    2.948834] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x200000000 64bit pref]

[1] example of new allocations (pcie5):
[    1.182745] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.182760] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.182771] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.182778] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00001ffff -> 0x0000000000
[    1.183642] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.385429] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.385481] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.385484] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.385488] pci_bus 0001:00: root bus resource [mem 0xa400000000-0xa7ffffffff pref]
[    1.385491] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa0ffffffff] (bus address [0x40000000-0xffffffff])
[    1.385494] pci_bus 0001:00: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.385516] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.385538] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.385544] pci 0001:00:00.0:   bridge window [io  0x11000-0x11fff]
[    1.385548] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]
[    1.385605] pci 0001:00:00.0: supports D1 D2
[    1.385607] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot
[    1.386778] pci 0001:01:00.0: [1002:6995] type 00 class 0x030000 PCIe Legacy Endpoint
[    1.387336] pci 0001:01:00.0: BAR 0 [mem 0xa040000000-0xa04fffffff 64bit pref]
[    1.387368] pci 0001:01:00.0: BAR 2 [mem 0xa050000000-0xa0501fffff 64bit pref]
[    1.387385] pci 0001:01:00.0: BAR 4 [io  0x11000-0x110ff]
[    1.387402] pci 0001:01:00.0: BAR 5 [mem 0xa050200000-0xa05023ffff]
[    1.387418] pci 0001:01:00.0: ROM [mem 0xa050240000-0xa05025ffff pref]
[    1.387493] pci 0001:01:00.0: enabling Extended Tags
[    1.388960] pci 0001:01:00.0: supports D1 D2

[2] example of previous allocations (pcie5):
[    1.716744] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724060] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
[    1.733277] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.836220] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.842186] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.848883] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.854363] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa07fffffff] (bus address [0x40000000-0x7fffffff])
[    1.864892] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.872216] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.877438] pci 0001:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.883526] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]

[3] error programming atu beyond 4GB:
[    1.716762] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724080] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.732615] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.741142] layerscape-pcie 3800000.pcie:       IO 0xa010000000..0xa01000ffff -> 0x0000000000
[    1.750379] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.759089] layerscape-pcie 3800000.pcie: Failed to set MEM range [mem 0xa400000000-0xa7ffffffff flags 0x2200]
[    1.769089] layerscape-pcie 3800000.pcie: probe with driver layerscape-pcie failed with error -22

[4] pci bootloaderp atching related errors with IORESOURCE_MEM_64 flag:
[    0.967809] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    0.967830] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    0.967842] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    0.967849] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00001ffff -> 0x0000000000
[    1.169315] pci 0000:01:00.0: [8086:1572] type 00 class 0x020000 PCIe Endpoint
[    1.169733] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    1.169771] pci 0000:01:00.0: BAR 3 [mem 0x00000000-0x00007fff 64bit pref]
[    1.169796] pci 0000:01:00.0: ROM [mem 0x00000000-0x0007ffff pref]
[    1.173389] OF: /soc/pcie@3800000: no msi-map translation for id 0x100 on (null)
[    1.173515] OF: /soc/pcie@3800000: no iommu-map translation for id 0x100 on (null)

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 30 +++++++++++-------
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 37 ++++++++++++++++++----
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index f54005e37924b..b5f52f3f84c7d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -14,8 +14,9 @@ &pcie1 {
 	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -30,8 +31,9 @@ &pcie2 {
 	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -46,8 +48,9 @@ &pcie3 {
 	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x90 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -63,8 +66,9 @@ &pcie4 {
 	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x98 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x9c 0x00000000 0x9c 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -79,8 +83,9 @@ &pcie5 {
 	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa0 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -95,8 +100,9 @@ &pcie6 {
 	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa8 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 479982948ee53..3f63fbf2485e5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1193,7 +1193,12 @@ pcie1: pcie@3400000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x87 0x00000000 0x87 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x86 0x00000000 0x86 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x85 0x00000000 0x85 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x84 0x00000000 0x84 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
+
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1221,7 +1226,11 @@ pcie2: pcie@3500000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x8f 0x00000000 0x8f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8e 0x00000000 0x8e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8d 0x00000000 0x8d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8c 0x00000000 0x8c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1249,7 +1258,11 @@ pcie3: pcie@3600000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x97 0x00000000 0x97 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x96 0x00000000 0x96 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x95 0x00000000 0x95 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x94 0x00000000 0x94 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1277,7 +1290,11 @@ pcie4: pcie@3700000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x9f 0x00000000 0x9f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9e 0x00000000 0x9e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9d 0x00000000 0x9d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9c 0x00000000 0x9c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1305,7 +1322,11 @@ pcie5: pcie@3800000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0xa7 0x00000000 0xa7 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa6 0x00000000 0xa6 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa5 0x00000000 0xa5 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa4 0x00000000 0xa4 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1333,7 +1354,11 @@ pcie6: pcie@3900000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0xaf 0x00000000 0xaf 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xae 0x00000000 0xae 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xad 0x00000000 0xad 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xac 0x00000000 0xac 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;

-- 
2.51.0

