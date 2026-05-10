Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021086.outbound.protection.outlook.com [40.107.130.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BD36606E
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.86
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425947; cv=fail; b=hCHWBYHBHSRZB5QVpxTHEME3JhfK273+O/nhEaMr0iDCJjGSAzuGCkSfCkM/nsfyioLp/tFjPZwuZarZuX2dm6kymU/rj1AIp9EqVBThOimkfFT6LdKW99KAt1mb5sS9+qSvsX5voNUZau/gDqw/qqMCMxUriHuB8/ba8h0subE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425947; c=relaxed/simple;
	bh=XZ9cMtqKC0cCH0nBEYLHiIx1rDTen4MsUH/MfbJvmAM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sqov0KFvQxXQTsNTL5ZF65klD4zjObn3q6/SWjrGVAIoLmK8qqbhoevjvuWPw9Hg+bz0KYNeWeHl8Ne+Dgo3cMbcbpXFaxw1CDWVjN/m88C6j9mHulnkF2KMg3yBX/7gaTfVUKs3fKoqevjiNlnVTF6Ju3HTSvR3ciAiaXkS0zE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=P4BZs75X; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=P4BZs75X; arc=fail smtp.client-ip=40.107.130.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="P4BZs75X";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="P4BZs75X"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H8KwIpKShfKeEYDkFWwSqBykpeQwwfMPnYq0DFd19DywTCpiKe1U+Vz1/9QCfjK6Itbdpemc6Y+9thecoW0qqYkeavKTTXfVmXuj4pV+RnTEw/U+NUVCMa2u8grOS0hMX6nViMHYfyhLtC3xhhJXeQjOVIYgRYrjZIwlD5jqcsM7ZZ/yBmEjjbecZsaPi9kkJ2vx6OhF7OADlv0+qTjh9LxF6z9172io8oOei9aVrcdkmsQeYDGwjK20JTryi15M2ZW+PnZ2c9+KSvOBT5qBxSUpdGwtFcYNbGkywdbpNGBh7Qt8dAMj0Tggif0SwTuaLhts5ICBWx6JAj+Tr7/oZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=MNCjFPZDhCFhjILPY28ATw2bGfSNYyPnrAoMZWprqAzy9mnqr12O6zKJSh9Ih7zFqYIm/FNV4WHonu0zfEL31Qtjr9SUo9TfLfqL0ssPfubfZ4Rv+aQ/FqLCha4hx6RCWwdQWez1vvI/Knyp3xY3CYLsrgPG1mscQZz1Cyb+naW3LLzyOmb5lzgMldbmDZ1fs2Mn1EStCg0pzwLkM+DbYhzoBJhjt+pqEZQ0cI1JOojKcrASwSe8XHzZMBbJ1R+VNYmJjUOs9TXvnU0UN9nT2lJD0PoZ+gbpvEs5B7vjPSvl1ySadVTxQ/ESOdncFcDlXtk2V+dqukpjbfFLu4YZxw==
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
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=P4BZs75X+arxPjlce1SSSioFoYuOeXb3kmBZsTiSzvdWfZte2JPwHIc5Md4iGWZDGxtOunZi5GWfTLRn+sm/CZeEASCQls+iOuBZKTL0OrInUDdnV5ru5/KthVWkJmvONAcOTONMo+hL1VpKEASZSk/rviYplENqRIU1QEOd0GPPy+Adi4qD7ZZBi7+7Xi/q7atpwpQMTvRiGF2365cemJnUzr1nJLTbYm2Y+kPwL3vDN4743uyU3C4FtlVYJo85xp5sPExLfYK5ClSiaFw5T4Uls14GmKKo0OxE2GwTTXCPG6dtvQ8An3fdmZGYAEm5hMXzDBuogdcihe6SM5tYqg==
Received: from AM6P194CA0062.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::39)
 by DU7PR04MB11212.eurprd04.prod.outlook.com (2603:10a6:10:5b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sun, 10 May
 2026 15:12:20 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:209:84:cafe::8a) by AM6P194CA0062.outlook.office365.com
 (2603:10a6:209:84::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:20 +0000
Received: from emails-404593-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 283F47FF1D;
	Sun, 10 May 2026 15:12:20 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:12 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2x9TCfcfF9dJNNj+e9ZvEFzjYnkXsTndksV0yu/9GOXoLLNyIzpRC5Fd+NNeDo/rdy9Qd8OT09Mwy246afAimkbujxlL0eHLqAwk8hJkoIaCLx6e+PARy0XKymu2zac5nQIW9BzjiR83CtqtMDOR3K4A505l7NLHew8UKVpnSazEBXVq9c7VjmYljnA03uwgPJXBYHvJz98OweY05xn1KT/4XCWAgEbx9RsaCVT6IeVyeFGWL//4kGznYQu/mS7RhVyU+5HRRA5+GZwNSEX138zsxro3bMfpOOxiGeAc4EiGYXZMl1d0q4muhdpDDmkDJA48n8InKwr4veQQWa+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=iRIpXdp/1KfQSEB3PnwVwa+wAVP9+oKPwnsD9COGDIbMby/2CCLXN79V5Yk9XujbZtA5b5nfqzC0OOuuwgIuowSMXbD7GBSNXRbpet2cD65KKRBOUzdoPYslHmTuIXMbRPw7u32zbpC04sUd1s6liabnabZ+TuFqmYtvDdH81gbKk5OW+2yU0Vr7o47Sl8LGew0Gqw+f/NBbkUdQ6XhKcm4Ub2xtsX715vSS5HqCGkSbru+S+yy1EWjKBNejwaazmzvghONtlJd2KPT6UpliUVnGJUM/9MnGrPivJU2QFelib1fs1W3f8xrWXm+aFws0vd35eAh2wwTVzYV+fpYNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=P4BZs75X+arxPjlce1SSSioFoYuOeXb3kmBZsTiSzvdWfZte2JPwHIc5Md4iGWZDGxtOunZi5GWfTLRn+sm/CZeEASCQls+iOuBZKTL0OrInUDdnV5ru5/KthVWkJmvONAcOTONMo+hL1VpKEASZSk/rviYplENqRIU1QEOd0GPPy+Adi4qD7ZZBi7+7Xi/q7atpwpQMTvRiGF2365cemJnUzr1nJLTbYm2Y+kPwL3vDN4743uyU3C4FtlVYJo85xp5sPExLfYK5ClSiaFw5T4Uls14GmKKo0OxE2GwTTXCPG6dtvQ8An3fdmZGYAEm5hMXzDBuogdcihe6SM5tYqg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:09 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:04 +0200
Subject: [PATCH v5 02/10] arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-2-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|AM3PEPF0000A78F:EE_|DU7PR04MB11212:EE_
X-MS-Office365-Filtering-Correlation-Id: 3578ef3e-4b38-48af-c5f7-08deaea68820
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 o1HSH7Fqosf1yNm6NZx9DM3f8oRTcXfFibbTE/iHWrclf76m+nwLMDBiCc85iAVj4KeaEM20PJErAIsJJ7oaiY0f4bCE6GKPw2MWLcdVDsd7Hsrz7Yp8C+JspPtWtTCg3ZqMkGdh1j0PEZpaQFqOb9cgluZacKqWo3JUQDLYfrfv46LfcDO6ly1fV4TQxGcWwaRL1MB/2UASdvVRQgkJxcS0QDeB7uLV3x1kkBQ+DOulqZTi8tii4WJP2uxj50mmwJwpikaqmZDWr0WRsZpyFarFmUR7IGAvnkHzoW4DBZX5QauakjS2SoNvXmiTUevD6idIvpEakhrhpns0j1s5Lo7uZ/PmjzjBcxHfN70x3q6hPXNUw6o8eFZIyflMgpAEN8O4ZNfHV6L1CpECgY5bSk9Al/d6ofSOPf6HESqs4ghHz0kV7SDVolN7HUULFksXuALOc18Ew5zUGsLjk9yyFLKZAkIAis1Rrn6gk6oq3yXQ2NTxVrAJ4DdtXIl0EAINVBKZJaqykNxmMSa57gcqHL3J1aU89C5IwnBIbXMC1ifm1OciAdaAUGkQ25TdWq053av1g7tFp20HprGitKUMv9MGSC/GqCsVBnEX7IBy3bVM+t2Ju4MksOcMG0hwe2gk7iMpqbihn68H0Lu1cFMUXEuayRuQkkRyJDbH7WeLPKVVEHC10ez7PSi1OgDicgMdzST2BMH3VOKQKXRCz2gElX6FZUR8/0j+32Zg7p0iFb93PWMO6upGCmX+0Gt33E5AA+xHRP/+xvHN3DpkD3OWHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 XtQYWDK14HJtWklyLun9BbK0RJRVK8RF3sUFxSMNRAKaRtpf6QinO4ejNHyEIBS4D925UTEDg/Dmo+mWEXiacH5ud9aCfDNR8jkrYBYeEom+1i+h3025qIRwckoFtNA4BHMRwWS389GXqeWeb8pXWIap6mnljAaM4eTpYsayyab8kal5sapTB2d/1hsyO7fbkJBU/uSBrQbFdA3VQPkaxehaqaxZGdx6HbYR8/lXlOw/IivC+XGOtJ3GAysunBK/dlW7ELrRZvg4k9rfioDWt5uz9AFZQ4oU6CI3PI/idB+dxIhP9lIMNMh2710V1Y+49RmGkhXjPEriReyLpm3/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7de44e98746748f3ae118cee9fd0328a:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c511041d-3f39-496a-6fa1-08deaea6814b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|35042699022|36860700016|1800799024|82310400026|14060799003|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	cAzxklFpIxU0mkUIsoZRDpLes4KXI/QWZSDpxy3jGCxQJab4sYbaRWrBBBJewWVsCbJz3QCMWuUUhz1j8j5vzqpbTPqO2NUvNjYvztg6fGEnipMl52Z0id8jYvjv/Ut49Q4EfAlZAtMyOVvMUAmdpDbKheOV3MPyv/x+FG+rjPp1WMS6odaQlwv921hoEUcG5h41/gR7598glhPrEI25dCb5B0AubGFcDjQey11NdnzxMxmD+dw0YARB3C5KY0DP/BrFwG2bdf337Yz/DFzQ6q8VL0sFbCy2NLnnhJXPbm2Geh//xAcaKLtjpzp9hEmcNHc7wf3NtZqlcUlG5pMYlVkB2Y9xMrsmEkiTY6WUYv1F20LmGbn6WCfOdP7MM9UXpgsUJ4oGrM52PUdMwPShlOAARIv/G/7hlRcKRc22cSOjz4c8EtJ2GhKX7TewB9+LBBZGJ7IacpH+OW+lNxJZDk26OaismMxt+1Azg1Eo8Ri+13jJ1xqUmURR0ffNWZfxKkCWDA7MOzzrjYInhsiKHjpsSkSvh/2H8L2f2Xdn+lm5gEkFz+9Bj8m+RX5aGOkxWYPKtpfyHvbQgWnfzL4MgcMAX9bQltgcWtPmEz6Y2t6G/yV+wLWXE+R4lhUtiwh2TawSAdEVzs4lMeHX/Rxv3609kf6HDp7Kni87xvIT3oKeAjBvyaPJko/r9j13vKMlOpetwVCPCSi2q8uwirnaSy5a9jKUwQrzcjk8nxOlqSMN3V/H8TsOQlhemU7qHBpbL8pp3SiAsXXe/wre68lnyg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(35042699022)(36860700016)(1800799024)(82310400026)(14060799003)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7fuXEb1hc97pnPZUpHaoVR7a3H3uNaSECydK0/E0p1jCvcuGGvqAmnil0WTSlU6RToofseEpbNIDHQ62LNr2eFQVw8/eQRqTezPp2XYM3REYArJE6AveonpFjXHnuIPZO9STkrA5wCUb1ANIvSvFfiTxnHmvH8CtBMeoaIadaBOSxQvZmTKeNuInQeIcFbvsmW+44IAi1iNeLVA1VtXJD70i8Ewu17D/aO3zwCMDyp4/s/MAQaalJ3pfG7qCJnNixL1G/j9ckCOMxCwP4GylQLUaS0Exa+qbynn0PNieuC6sOEnvk5koyQrOZZ11vu2cCrkg280hNl7msuCUd55tUsdBRb73tmhMOKqiA1mOZUOF18yO0czfGJ4Cu1pROGvWMDY+TXv5RUmyPSKA7SiSBnL85cvwqhk2xRTT5uNJo3CAau5uGK3+OuoTzXkhMtx8
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:20.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3578ef3e-4b38-48af-c5f7-08deaea68820
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11212

LX2160A and LX2162A are different pakages of the same silicon.
While LX2160A had two revisions, LX2162A was released later based on
LX2160A revision 2.

Commit a8fe6c8dfc40 ("arm64: dts: fsl-lx2160a: add rev2 support") has
added a new soc dtsi for revision 2.

Update LX2162A Clearfog description to use revision 2 dtsi.

Fixes: 5093b190f9ce ("arm64: dts: freescale: Add support for LX2162 SoM & Clearfog Board") # no-stable
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 9d50d3e2761da..f95e9c19bfc75 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {

-- 
2.51.0

