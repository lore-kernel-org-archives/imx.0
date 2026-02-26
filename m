Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023096.outbound.protection.outlook.com [40.107.159.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E947B437
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.96
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123830; cv=fail; b=pYJK4NNVYq88/GP6egzsD1f+O+x+AmNStPWzAzqObVKKB1p1dDLI5V159p99UNZQaooggHu7Nxth9ghMyPJyxrN99e664hSbOt04EUTeH3hl0XKM7oQbGxh6No25TZZjfA8RLECMis8xfiX/tKap1iL+qBjGVjFYJRR/rIyJx5I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123830; c=relaxed/simple;
	bh=xkLfTWsMinbTo2rCLspMUhLGtbr5MTrluhTy8rPttv4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PNuUAEQXkMsTWfzzoF8osvwFvFL99sNs60rky5MJlWf9zdrOpaFLGPGuHd4yg6kSACzkpOrNPQBmW+9O6HQ8dASD4wQzUWlyj6htwCpx0qxPjE2wGp16RRJnKx6zWzJYjrcumdhqokvTWly9u0qkvu979PP441TuRbhvTV+fcbQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=qEve+XSU; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=qEve+XSU; arc=fail smtp.client-ip=40.107.159.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qEve+XSU";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qEve+XSU"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fqR7mdLTvBBPJD+sVIeaGpF2Fvw5lwIYHQuvB1o0hxn86XgAEu6U3BIO/ygW4eDXpA6SXsZIjraIDWdXajzKyot15AL+U8CehWSroJOWOdhhU4TuH17ADQdYepssLstCliOywTI/+dcI9a4OkJQS74cGoR9Pz3aVUV+CMXbevhdBiUCUeiGN1FOOtyuM4qaA4fTKK5N44J/w44TzhgoViv1zleaNRTpkcbgD/btF/nLzupfD6n23pd+sC/kyUkiymyfExjRrLe43zF04VReosZBn3WK2f15YL9tbA7EniWRIDZFdEndMLI2gv6Lu9KRM/HjXDqlpKOmsmNIxfHJU6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWDqdU02qSJSRJzbU4q4Fyomk0y/DP1+3awGO8UMi+w=;
 b=W9ZOXfCdEKxCTd3evWUNRZ8Eglor+SmM3yms/2J/8duMKtVOqcq/Z0IWJMaFm4iLiWpd+kt05zEve/vNWr8WZcGcLrLXlGzCCtv3WRCVlj3dOZf6psscxMGb6YcxVOXrWUkHUOAU3f/kY+RMVwvEYZIHZMT1DTmPMHMtGbQGa0kRWlgXzSyKF18aYnRftNI+809r+a4IW0deIXxJ+uGMyL4IyNDFXGEN7SDLlS0oTNDNTsgdOhALyKBcd5/OzCQ8REaBuexOTjoZxflbwc4LXDRjlLbTuYhHeRXAPScF1q/y3neRtuqrAIoTcUb+I7gVXANcRWzY/ikoPjYNFS8frA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWDqdU02qSJSRJzbU4q4Fyomk0y/DP1+3awGO8UMi+w=;
 b=qEve+XSUi/E6yFIOr82EkB/yhTJV59R+yVc7pEEDmKGWYln/7d7vlc1yAigJaCAj8AoVUPtro+IKg6w0XYjhwFM2IxAKURIAsbuG2nUop08KyfQ0omSMrnaZA9rQR3LI+CE2E8j2nS0qM1pd6b/pYs6c9CUq9PhIe2lWPCTsY3c=
Received: from DU6P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::15)
 by AM9PR04MB8698.eurprd04.prod.outlook.com (2603:10a6:20b:43d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:37:05 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::16) by DU6P191CA0014.outlook.office365.com
 (2603:10a6:10:540::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 26 Feb 2026 16:37:04 +0000
Received: from emails-3380489-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-107.eu-west-1.compute.internal [10.20.5.107])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 99857807CE;
	Thu, 26 Feb 2026 16:37:04 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Feb 26 16:36:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+hBkoWAJKipED13RIPyHNNx5Q4r1Qow3cQDidMoJnJgucN7xNlLlqdTquB1Uj0AkdYWWakPYtjCPXC0ql0H62WpJmvnq2KBTfPEgu86h18Vltx+AYkc2en4sr5kEWbxKFMjf2cFPH7YdCz46i+aemcCOKrqmOs7NGFWSfuAeWfd77uLwacThPTR3mLhJTprFC6hT84M6G+r/+GX+Y9/yAP4pFVq2zZw/pbu0qfl5Dn6DtzK945rtVIKciZHZIrOneRIdHhN8l0fh/8FNy+8tj3lmwS7+bQN7Zzm+XsJaf+K1tWcJ95Drm+KXuD23gytsH8fWPEJXAhtkHS7xamGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWDqdU02qSJSRJzbU4q4Fyomk0y/DP1+3awGO8UMi+w=;
 b=mg8Z79AC7biJr5tv3yjqMrzg8aZ1YtS0h3ecw2I1mvnO7xY5cGucv2H76eB/2DqbaEcoBOtJKFDiHPHtu1q9zAmAD1AU0hUIsZl85E4Ilyv3uU/COjbA74miKHHQ+6kT2vGsBaxee4YpNyIAv9sZS7TO+UkgD/tMiw5ie7lLI/Hzl/BOHjF+FtYcrdk8C4ni1BfIDdRKY5vsU8YzwzkUygswgSUWyE6K4hb+5AR3SutNjggg+mkZVI2xTlFIgESMLVxrkJth2OINR5hStI6pn126U58vCtCebEWtSAdtfWuUuXfwaRdyAsZa+3gCLBJJxaCaM4kLxZ9FrrtGHPKmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWDqdU02qSJSRJzbU4q4Fyomk0y/DP1+3awGO8UMi+w=;
 b=qEve+XSUi/E6yFIOr82EkB/yhTJV59R+yVc7pEEDmKGWYln/7d7vlc1yAigJaCAj8AoVUPtro+IKg6w0XYjhwFM2IxAKURIAsbuG2nUop08KyfQ0omSMrnaZA9rQR3LI+CE2E8j2nS0qM1pd6b/pYs6c9CUq9PhIe2lWPCTsY3c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by DU4PR04MB10767.eurprd04.prod.outlook.com (2603:10a6:10:580::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:36:48 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::a0c7:9bd0:56e1:576a%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:36:48 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 26 Feb 2026 18:36:37 +0200
Subject: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx8mp-hb-iiot-v9-8-4533235eeb34@solid-run.com>
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
	AM9PR04MB8747:EE_|DU4PR04MB10767:EE_|DB1PEPF00050A01:EE_|AM9PR04MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 4801e2b0-a9eb-46b1-16c8-08de75554679
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 snhEQLkgfwfdtC+cH072bBOUEw+GCIQzQ18T2BlMBhzd2wVjZ00ybmuKuBLkofBhE3r6BKPgbR2lo0vCx7htud8CmZY+seYwsMwMKWf+pIceVFn9eBWuVJf2QOWaxPJ31j7MCjgTmnPQp6uohE9gnPsVgjdMaFpij4XLzKcpm707f9cwx/Zeqr/j8H3xeZgN3Egfz60SlNEF1iItGjK3eoevFUGrFTAVGlFmZqWrsjdmdnuHDvwkqNiW3ba/L7Ql+Xhlrltl3gKu8LLKbcP9hp0I8XP0v0ckX+Dxt3lhwaivIjQ5XTvvJTcUFVC5+NE6s2W4e04T3kRv1PKKrpcB0CJc+EPpu2ymHpcxgUk1YC8g/LWMHT9mMPdn52HA6zIIAmFC7m3tgs049wJIB5KBUkNV0DRExYq04R1yphdrkwQjQdOBjvAqUX2DT2Zd/eGDAD62C2Shi0tL+bn8joWOvmZ7MkuYxVEbuwzormXH5jbn4zZcU86aeKm7p/x4qVrOqqwVdhBZpsh0CDB2KD9kt0HD0PxThpouZi3G6JetNtcftYnfBX63WubV4PtC4BrtUaRlBQEVUBMKGcmQ+RkYzUuge8uWwBbfZrrvrsxibTND9t43HoTA845RJWMLEmxcAr4GKhPntz5TpQucSmsEt/RJZeIr2P1aEy11oeRvSqxGc0EfHbyevv9NOqOwlTjy1ClZjoJpAAxv7KtAGMK+n8kdnhq3oIK59JX7Rqtl3v0O7l+nrMyypNjNFRWndCvDwgrNEsx2d5Zecp/kgADbNeyy5VvpV6LKukC+mOu9J1U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10767
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d5f2f79f38eb475fb4fea105de99c501:solidrun,office365_emails,sent,inline:c670fe34631ff287f38cd6f3c87efa4b
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84fc90ca-990c-46ff-ed76-08de75553c7e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|35042699022|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	C/eJY5e1O6zSOlBlOIFEzZ0e3/w+PQ+CfIxPpugKMJqviZNO1/a+vtTnAuAHnx+HC/14kIMh7MixG5jYZJu05deazhV8nyQHCH5YB+TQ7nOQQvMjW5Vui36hLzeWXO8EFOp/uiQApbws4KH+XHSgGvKGDGhELvSqAGJEd3mAZLkfGjw7cI7n+fSXsNCe7Ez1pQIneNxhoPK4i/T+Y2tzfzGCdz6uOo3wL7gzr3JwA85kDOK6ytFkns41UYnTPRctKpnekW/CCfqK7qKYl99Z/4J+mKFQj94kcw5WeplwBohdj3z34NSF1xbc9PVez3nBb97gFl8gkA70Kg9cF93LIB7Imuj1Li9fJYDqGobIfA+GTph1nogKoJs37nGEQfDEzd6ZNTfql6z1D7S/vvw8lwxO6cCslSmVV2LtXrfNhV0LBZGbxJ46sh3rKUTJeYkN9Ip2YGaRv/9r95Ddr/gX3Hq9lq17G9ey4vBQgkpsxzXaOBIcxvZOKSuIgiQsBHwVpY27/YQIwlhcqR/ht2k7K8Hh5uSRL1f3qc357ZUJG8++tnmxF2ymsqr4SVeNstxskeHBSkrJOLETG8omrpn0FVfE3K697JhXY6wfO5XTWiDJcOh4yHxrrF5HuS2rMyFptrNcJ/SeAM1ocs7x4r0hqBSRsprJaNcJGC7/3Of2ww6wt+D1+GgVkSAutWnDL0uYylLy7z2CovEcI/MuWAsay1qAjEDL8kH2+hRPBdkfCXMz3reVHEyvcwNGoo0IcwxbIV8XYKPcRHwMy2RhyqKPtJdylOvEvl96dNuMpYWzFonhgdEbEY+p+kK166zJxgoZAg1Lu4oLZb27h3N7uY5cuQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(35042699022)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OrU7QhQnEjnU6p1TQx3x++LmNdg5EUhTcRduBzRkOC1qokJEl5wiZUT9pkEmsqazmoJu8mXdAfLu3flXZYwiLLBmKwbtTPWT3i4YfHPmgJ0mQ276UD0KQVGphTk3hDx9WK1rGHM1lpmaNS+W6yu6VpesoyIt4NzF73CfJcTZqsBpdOZuKj+DraHCm02HzWe13Rkldy2/GR9B4PyeltkcxKShkCFtk3+U+y+Tnl722uzQWxOl6UpS/yRdyxQdBpWtuMgvGpeXWnrUpvJ4S02WVn/rtMlHfClDqy2m2HO8sD4A3DyBvn5WiKA4wFJuvomGYnGhWd5aEXrbGJeHZXQPYFCw3oLEdRmmd0MmzxMj5hQENkmU8oaWO6yUq/O2okZ9NKO5qzhs9wSq7c1TIj0lJDhqgS/wcq35Hdo+35EHM4lD8KN7zAGVfJRN/M6TnWsA
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:37:04.7589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4801e2b0-a9eb-46b1-16c8-08de75554679
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8698

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 +++++++++++++++++++++
 3 files changed, 730 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a61ed098ff8d..1314aec6634b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -126,6 +126,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 000000000000..71746d3c106c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 000000000000..7c8a840686a3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.43.0

