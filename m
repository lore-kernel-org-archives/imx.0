Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023109.outbound.protection.outlook.com [52.101.72.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5229223DDF
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.109
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740718; cv=fail; b=DVOxVsQtJuN8Ci8J+huBdN9uNI2l7Tzmz+KGErPjNY2t3sejZl8xzgOVcQxwSHAnZKiGipQbLayxGGiRiMxdkWmd0UD/NY1uDn8TH+NlH3z36MSvuPDHodqMSnf3MI/PsnaPJQSXfyjvrJTKc3dC6SONT5EO7tTrL/ouXiQ29L0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740718; c=relaxed/simple;
	bh=2+xMc9KKpbyslo5x6Q9Xd9fbzNQs4GN6NSXbW01yje8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=sxVlJ0JjLTOWRHriKGVfQWG+Fg2r9iWO3c/lEOjDos1iwMuquXUy1VBjWL5lO4qw0uWRho6KL+P2/BbMPSja7IisQmxWTKbYYoOFNFN/FeWCc+FTCE+Stawz5YV0A+ovYejSB28hXUBj9+UJwO+/airB/aF+7D1M9UovL6RjNC8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=B2OlsDPd; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=B2OlsDPd; arc=fail smtp.client-ip=52.101.72.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="B2OlsDPd";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="B2OlsDPd"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i7rUDrnEQk/7XImfctPVwuMJf2bskHT4MbM+qkff3TUWkL0Roh+pY0dJ9DLDzBrIdiEM3KPFrc5L3ZKw3+GUun36D4UMaGKpC7S1T8ZsjuJF3dGWgGBlazbxavln6ES67iMoKdbfFT1hZlZG6D8OP4xR4bwwwgqGthmMxFWt+iCNS7RyU7eOeR5xJwJS8XEnxF288E6VaMiDJhTqkyd1yNPeXEzSehIIrXY2s4i4/rr4y+75oBaVEWSyUcl3vOnnU8+8Ct9rQk8h4U09SU7HkIPuad5oPOdjC3N+X27ELPg4vrnZDSTZy8551FWKpVm4yfKnq2ocrcVEzm9ueoPopg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqNbS73L/My0xkAHFh0AWgsjDUDmQqLF1pOjzN7+ebk=;
 b=jlOmREXmcJ948v5bSS1P2LRMlECtK19tKOdWaYskyXcvo2QkFBLbhJiruXWcmnaB5pEfkAtAGIvVnfGwvVpkjGl+JZF7Bs7rXz1Y22l7xnlf11e9uB4stVBlgrGxxV9dAZ961hMKbYGnvPc/H/9tORtFb1kDf2m9W2iHCuehrBOqsN2e0924g5Hxo/Y7DKnjpZeZUMo/OVeMGJkZlYkuMKCq/XhaiNH/u1/EKLuKJD5xzI+1fX4IehGPbgt69b9GXotql8rpXz6WYOvwgmVRHcpw1S9zwe6YSHbx+OyOQ7o5Oc5Pesbm9dpTstXCpclJfKTXgzBMxxbPIyg2off5zg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqNbS73L/My0xkAHFh0AWgsjDUDmQqLF1pOjzN7+ebk=;
 b=B2OlsDPdN7VLmYiiaN0R3QlOsDJjK7oqvwJjrEZzxQuEEmf8Dx+aNPK2YyiQE4oSmk+ygcRBMbMIlStozBo/4CCIPNo2H5wPw9svWWqau11ZbPlOVcrOZBWvCIA6mALuprVdgFbNWUIBe9+qJEg6vcM98gVRrFlgPOG7/1LC4no=
Received: from AS4P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::10)
 by DB9PR04MB8124.eurprd04.prod.outlook.com (2603:10a6:10:246::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 12:51:54 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::53) by AS4P192CA0015.outlook.office365.com
 (2603:10a6:20b:5da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 12:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 12:51:53 +0000
Received: from emails-8521323-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 801DB8015B;
	Sun, 18 Jan 2026 12:51:53 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740713; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=fqNbS73L/My0xkAHFh0AWgsjDUDmQqLF1pOjzN7+ebk=;
 b=fWEJ/NcuBGjndKhSQOoGCGe4LL5nJvbNp01ZQZlUB6q5p5wT1YK1T0bniFnSLl0E8yWYT
 SRC16D4QxWC/eypBVXPJvU9+xZQiJTidh3g4HeNxk43PEYvYz4M5nIgm2XniHewS+82+cyq
 E+UFVW/4r1OC1/mgIRxvXeHrHWGxZxw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740713;
 b=Bhw+4Z94fiGxJGg4fkK3j64h+MDuQ6PgmIxnRf2ycAyX0sHB/kKEF1JtOs+NW0tNl8R3B
 QVb6YESvvut940/grayfxlfLz3/IKb9/BRbMzlU2zpCoC9DPGdyUNrZ5qZGFXSABDTXg0wG
 GRC/sI74E6RBcDhT3W/bF1WvnKwCJ0g=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3kqxwmuhZVKnxfCs41/JoGp0UlxaabNWrA1+WTxjBm4EYxAnz6M+uDjNeIlYvVnkC0NE4yQzTmaPT8XQRZ4maa6zNye/b6xI8J7xQN1ir1pVbwN4A3rbBHyCPQ29R/s3/XCPLN1LTYZz7keewPmPolheS2877n7shtNw6Cqb2i1lSLzETb2bHSsL0NUE5+JNbepBjiiUWXAlSgJy2dkWkj2t0Gq/GsI86JIHVuLgJkZ8i77YzROuNMLRVUetTHuCTlydJU9Onsytz35qvAiH0yfIUxqSytr2ADXAaYXi0M2xlqGsm5LHR+kFsFvAkkJSOXQbVu4WL0fPOKCm6qQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqNbS73L/My0xkAHFh0AWgsjDUDmQqLF1pOjzN7+ebk=;
 b=glyB7smtjpOMs2KI62crVZhMtSRY+JhF+1H/ShOuzGgaGmWP+N1iNhQBeFPRy7nPUF6GdaRotkfOZaNQB/1bIVSJrV7Bb8vso3G0EENBOwm0lPJEYRSSzAFNANVGZ2TKxjK2aH/ltft7MZFiht5VL4XF18Dyanr+eVaIUTq+uOvPrfDRJd6Cy4p+ZxAULQwLng6p+hU1y4Hv5gE6aTBTD4qBRipBgXhmuhoTwriSaHEd8hnMpzIRv0xi6UiBgt4P4i945k7wAWEm/UBU0YENmLun5pFVjRvBeekkLA4D669pX6QL6MPwv0D5MG94sBFauFGSRWohH43bSxuQ8KIm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqNbS73L/My0xkAHFh0AWgsjDUDmQqLF1pOjzN7+ebk=;
 b=B2OlsDPdN7VLmYiiaN0R3QlOsDJjK7oqvwJjrEZzxQuEEmf8Dx+aNPK2YyiQE4oSmk+ygcRBMbMIlStozBo/4CCIPNo2H5wPw9svWWqau11ZbPlOVcrOZBWvCIA6mALuprVdgFbNWUIBe9+qJEg6vcM98gVRrFlgPOG7/1LC4no=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:43 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:43 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v7 0/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Sun, 18 Jan 2026 14:51:37 +0200
Message-Id: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnXbGkC/6XOQWrDMBCF4asErauiGVmy3FXvUbKwpFEtqO0gp
 SYh+O6VAyGl1q7L/8F8zI1lSpEyezvcWKIl5jhPJdqXA3NDP30Sj740Q4EKBGoex4sZT3ywPMb
 5zBUqK6Ql6jWycnRKFOLlDn4cSw8xn+d0vfsLbOuDav9SC3DBtZHBaKlaA+Y9z1/R8/Q9vbp5Z
 Bu34JMAsSewEN6glJ5813VUI+QvAvaELIQN0DcuqNCbKtE8CRSwI5pCKFkErx2CDTVCPQgtoEK
 o7QupO4sknGirhP4fsa7rD79GDGb/AQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|AM4PEPF00027A68:EE_|DB9PR04MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d2932e-9dcf-4b8c-8a4b-08de56905b3a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UG1ZY0ZIbWx5aTE2U3RoQ0pHMUhmZDYyUmNxVmNFWHh3cEZzUVZlL0xReE8y?=
 =?utf-8?B?VUd2eVlGcUhraENhSzdjdEdKaW44K0kvLzh2a0hEM2Vnb25TdHd2aUdDSi9j?=
 =?utf-8?B?ak0vcWFYZkFCTEdQRjJiQWhjdkNoK0pzSU5iRUs1ZW1MZ1Vveno4MithR3Rs?=
 =?utf-8?B?ZCtxajNjMzVzeWFyVXJFblNiZ0doSWF3RE13cXdodU1FY1hCWkw3NzN3Sm9h?=
 =?utf-8?B?QXV5dEI0U0JGbUYxRzl0TlY3N2QwMmpPT3FWc01XZDV1RXRUTDlpOVdiK1U5?=
 =?utf-8?B?RVBSRHc0TGNOYzVGSWoxYitmWkdYWklQN25iUEpacmhvQWRVZ2UvVlltck41?=
 =?utf-8?B?M0xNb1FsYks5VmhyTk5NVy9UQzByM0gwQWNVa1E5anFmWDRnME4xTTVvNnJS?=
 =?utf-8?B?WVNQR1lCS0ZGc1djZ3phT1pVc3k1dFkzQ3hrRTRaU01vWnlqVnpOOHBpTGlm?=
 =?utf-8?B?ZXo4MHMyQ2NjL1h3SWhFcWpOVFJXRytSWmhaZWtibWh6SUFOSkhsa0NFNktK?=
 =?utf-8?B?UWVrTVh5dW1QZm1STFFjR1V4VDFnbnlaU3haa3RENkdyUlVKWk1xbmtPa01y?=
 =?utf-8?B?Q0ExWkpSTXNlTnU1SVJ4dE45YmxFR0wrWVl3b1c4SXFyblVwUjlkMDBlam5h?=
 =?utf-8?B?RjUxTmJWNjBUTVd4QXl5WkxocXpLREpVMit6Nm9YSDFPcVcweTF0dFREbEwz?=
 =?utf-8?B?aEkxN01iWmNDRzdRclRhZjdtUkR2aDlHSURSVE5VdGhWRmNRWmgvcGJRVjA1?=
 =?utf-8?B?Y1Q4ZU55Ni9SY0tLYjRLK1JSUDIyempYbjhDS09vbWd4bS85T2xvdlBrU3k4?=
 =?utf-8?B?Q21EMGQ2cDBVQ3JuTHJXT0cyb1ZxZlpPTlFMc3VPWk9TWmZtZmsvbVhRMllN?=
 =?utf-8?B?aTMyK1llbDlDeU84Y2tnc2RXelhEOVdXK2tKYmJTM2pqQVZnUTFaT3c2Rlhz?=
 =?utf-8?B?NmNkSldBRzhlSDgrbytLWE95UlRocWNWR3pLNjdpenFRNnVCbjZ1b0NiaGwz?=
 =?utf-8?B?eHNiblpra2I5ZmpucGFpc3lQRHM3US91eE1TWFVQZTJFTE82NmtERGFId1FG?=
 =?utf-8?B?RFdrM3lVc0lzNENWakVHVUs3UHdwRUd1Ty96WmU1Z0p5YkNJY001RklBQWRD?=
 =?utf-8?B?dDJ4aSsxUldJcGRmeUhvdm1UdEFTS3htcTNyNzN6SHJLcFBCVFFydmlKcGcx?=
 =?utf-8?B?V1A2NWpreVpSZG9TQzJOYkxHNXhOeC9iMnFCTThjTEZwRFh1WlVRakRyMjY0?=
 =?utf-8?B?WFV0T29BMW83L2tHYUgwNDZ1eXpaTGF1eVFnNGMzZ0gwZWdJaGphdEJiT0ov?=
 =?utf-8?B?dHpzaDhNYUJxc3ZrQjFhMVFWaVozcFJjR2EyUVJIVkg4bk1sdzBkdFVJVG9T?=
 =?utf-8?B?QUsyS2YxWGFEck1mamtNWmNudmVqVWJONE10L2F3QUdVMmVTb3JaTWRBSTlZ?=
 =?utf-8?B?MndjN1dkNXJnZ2k5OFdYay9wcCtyNXU1U1ZSYU9zU0luSml0MUFLbTFFdGVm?=
 =?utf-8?B?cHFwcERIM3RhMnlYSldhblFHMVVUUTJuTGRpR2dtNDBtL2hxU2U2Mng1M0hz?=
 =?utf-8?B?WHRvMHRTV255eGM1S2FlM3E5SFhlNlBqTE13V015VUc0UjE0c0ZlYzdvbWFG?=
 =?utf-8?B?Ri9uTGJiemlUUzdNMXdwYTgrWVQ2eEFleDZKSnJndW1wOXIyTjVYRFgvRG4r?=
 =?utf-8?B?YjJJbGdXZnVWeHJlemZQSnRWRTY4b2x2cUVkbEFHQThweDE3Mkl1ejZScmZK?=
 =?utf-8?B?bkVKOWcyc252U3VRWkt0b1N0WGx1S2xWbXVlV2NBQyt5WU92dWRkQ2p5S3Ra?=
 =?utf-8?B?SFhJVW5jb3ZnZndhUUVsZXZ6M00yUHdGRmo4TTdIbWJRazJzOTRYYzVBNnRG?=
 =?utf-8?B?MERqOVZVYktZOFZTSnlsYVNUSzJ4c0w2Tjc2dHJWOUpTSXBpRGgwQTk4Nlgz?=
 =?utf-8?B?a1V3cDJtOFhhVXhINFdlS1FBblZuSFNzMEZRWHhwOHRjWGJMM2xESXIvdllm?=
 =?utf-8?B?Y1RyTlg2eUNLcHdiL0JZNXJvYStXSGtzTkRNY0ZreEJ2b0wxZ1dIQXlXZ0RW?=
 =?utf-8?B?TTM0clU5Ynp6NVAxMVF1OEV3VmxtQzB5RVpENnVHa1BQcXlnR2J1djRLZXRs?=
 =?utf-8?B?TjJhM2pYRUhoU3YrTEdWUDcrbXY1Y3drbVRiTTFHQ2VIaU0yNkw1SFpMRmlB?=
 =?utf-8?Q?3fFBUAyywFciPZ4CQeRWFpM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d8c8fcbef09f432f91cdfb46617e5923:solidrun,office365_emails,sent,inline:c4bf7be8fb70a9865d1ad9d7a64d2454
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69b66a0e-1d47-4639-af38-08de5690549d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk9GL1hFN2pMbkRVdTBoTnV5Q2M3eWkzNGNqR3d2Y3NSa29Ebm5aY2VvbjNK?=
 =?utf-8?B?SCs0UG41UFBEWWVLQ3VHT1UySitBMm9hTVdkRW01eDk5akZkZEpuRDJFSXlq?=
 =?utf-8?B?MDcwUWxFbnh5bkNDczc5WEI0T0FoMkExMmI4blRUVjdrYkx1NTJEamdTWk93?=
 =?utf-8?B?VExaT2NqRjdoQmdoL013MmxwMitqQ2llNThtcjVzZ1N2TUpPSnIrTXVTcHR0?=
 =?utf-8?B?WFNoTUJrSlVkK1B1K2dhdjF3VzhHOWtSeURKbkJ5czhMSitHWFozZmJ3VStp?=
 =?utf-8?B?WVVlMk91M2xvYk1VR0VIWW9TRFVpQW5zbGd6T3VJL0xJR2gwVnRVNWRkNm1n?=
 =?utf-8?B?cVUwL0d4QmhWVGlBeTFJelY4UGRTbHJhZTFrMGVmRXdQcVQ0R0FDUlk1RFBV?=
 =?utf-8?B?Z09Pc3hMemZyMk9ka3pWTmpuMCtZYkZEMTdzVTlYeFRhb04rbUpwN3ZrYXZ6?=
 =?utf-8?B?eG9KRWFVd3VyR2NkTXdBenVhY2Jidkx5bUtjQ3lRV2hWNnV0Yml0LzIzMjRt?=
 =?utf-8?B?OElVdkZNMEFOakg5OUFvQkhRRHJ0Z3AzMURabk01SVJjZzdpVFhDZzQrYlJl?=
 =?utf-8?B?SDY3TTUwQ1R2akVzQWdqdDdOYW1iNi9DUFZHeFkrTDliSUkwLzNWeklBN1B0?=
 =?utf-8?B?U2s1VmZPQXZ0ai93WktzUnE3dXBhNTZFTFlGSDZNa3M4U0NZTUhTRk5Vem9Y?=
 =?utf-8?B?aEVSYTFlL2pyQkN0NHgvK3NFU1NKOHRwWjhBUDJxdEtVL2k3alNtdkMxaHNE?=
 =?utf-8?B?NzBjVDBkcEtDNjVxZjlxbTZMZm8zYjNlaFc5U2hJZEJNeUk0T0dDSDBKcWhE?=
 =?utf-8?B?S0RzeFlOTHAwMlVFRm44U3h5OVVKaGVTekkvWUJFdTg2UmFWai9TQkpQdllq?=
 =?utf-8?B?dmtBOXBKYVl3WlRFTjFlOFpQbUFEdEV5UnhBYVFuNS8xZHlER2RhbWtrdXV3?=
 =?utf-8?B?ZkFlc2MvTEhvZ3UyTWU2YnNFUHZKUC9ENDZNUG40cUh1djJ3em5iN3JyMmti?=
 =?utf-8?B?bU0wRENZN29lRWpRK3hGSjBoZ0xXNkpQbFpIWlFLdkZWSG5lRlhxSnpjZStu?=
 =?utf-8?B?WEJJbXZvNi91Zkg4TXVaeE5yOWtJbHZhVDVja2hCcVIrejRhQTgzVTVsZUpL?=
 =?utf-8?B?bUpJdHJCNEdFbE9sTnZFM0RBZWRGQTdMOW5FVnoyK3JoeHpoY1BmdlJSR0Vz?=
 =?utf-8?B?RzNlZVZxaW9FWXBjajQzODFBejhmREFYRENPZWlTdklXamdXMXArblV2cEpE?=
 =?utf-8?B?Zms5UlpTQVBVZmJ1VFhlWVBZOU9pOW9qQlFSaC9MWit6WlMvWXEzM0VKNUN2?=
 =?utf-8?B?WFkzUDdBNzlGdnJSTVpLRURQQWpHZTk0WmFyazgvb0FiTzd1eHFGWkcwMXVX?=
 =?utf-8?B?U1QraXdSTE82dHFUdnRIYUtMbExIRXUrcDZGWWJiRHF2bVk5ai9kYllMVGpk?=
 =?utf-8?B?YkEwZHgrSTR2KzNXSkJyYXNQSXNXSVo3VWtzbHdtYjA4b3NQOU5aZGw2cTY5?=
 =?utf-8?B?RHBMemJOSDZwYVMxL3JUb2tLbTVkVHpHUmpLZzZsQ09NaWZjQkticXVSazJ0?=
 =?utf-8?B?U3ROdG9uSnphYVkweEtmQ0JlYk5adzNodHlvM2k3Y29tbnhKbE40bEJ6amt5?=
 =?utf-8?B?dWltNVN2TytLdDVIQk1NaFNtMWpIck5wbDc3NEhXWFdmUkR3Ly9FUjFsR0hk?=
 =?utf-8?B?dXc2YWFNNGVrK0wyTWoxSU52eHQra0VVQU1tOU1PQkJjeTlkVHVZclZLN0dG?=
 =?utf-8?B?amtKUjJpK0tpODVVcmIxYTZtWk9YQnZDRE5tUkJ1emU2Z1IrWm94VWMvTG9Y?=
 =?utf-8?B?RkZWenVnMWU3UzFhRUhYK0RCa3dYYzNzZ0xGK1V4NytVRlBBMDBaSVZnVDdP?=
 =?utf-8?B?K0o5UVRTWmNKM1FNZGhKK1ppTklDYnRKMkl3RTNrNzZ4ZlVqblRHc29wclda?=
 =?utf-8?B?Nkl0aHY2Vm12M3pQa0ZPRHVrSWdtQlRkbjlDamhlQ2dWT1grZzVUUjZhVkdn?=
 =?utf-8?B?b25YVHdvQUxUdjlPUWpUVE9YenZqTW1pRlQ4djA4dGgvVjVmeUZhZmI3Ujha?=
 =?utf-8?B?OVlKdmk0cm9Kcy9WRFVnVkFlYXlLTVdsYnYvem52aEljYnRLK0F5TVJ5U09n?=
 =?utf-8?B?M1ZYZEZ4czlpZEo1Q1hmbVdSUkhCWklXSGszUng0YmJQTGNLaEtIcG9kc2Fl?=
 =?utf-8?B?UCs3WTgzUStEWHB6TWNPTEpVdmlNT01uS1Z5M0hFSXgrc09vS3J1VGVaUGYv?=
 =?utf-8?B?Q25PejNlQzY5dm5WUU4weWpyMFFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:51:53.7982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d2932e-9dcf-4b8c-8a4b-08de56905b3a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8124

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v7:
- updated Makefile to apply each addon to the base dtb, for better
  coverage at build-time and dtbs_check.
  Fixes Rob Hering bot warnings.
- Fixed subject version prefix (v6 was prefixed with v5)
- Link to v6: https://lore.kernel.org/r/20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com

Changes in v6:
- imx8mm-hb-ripple: sorted i2c devices by address;
  removed unnecessary newline.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- hb-iiot dts: sorted aliases alphabetically;
  fixed gpio flags for vmmc regulator;
  specified led@3 reg field in hexadecimal.
  (Reported-by: Shawn Guo <shawnguo@kernel.org>)
- Link to v5: https://lore.kernel.org/r/20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com

Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (8):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  23 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 13 files changed, 2546 insertions(+), 9 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


