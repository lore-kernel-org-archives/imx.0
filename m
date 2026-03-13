Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021120.outbound.protection.outlook.com [52.101.70.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F114C394476
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.120
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405097; cv=fail; b=c8fScGkqMTn+mJ1BZkg/wU5sN7Xegc6+Gek9xEZbFD4t7fkuXO5qYDyoNDqH2o7M0AMlGD0FIpcaE2uzm4KwobJy5AKksEj5hlxrkHsqzoKtYESW8lat9Xwe6GsAIGT3pGfon80SWtgRzItCYLl66ujwGvzZhZQ6i2ThLJ28T80=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405097; c=relaxed/simple;
	bh=hXiQoDB6K2zXQY6cWDhlOIoN4PWnXpIYX9VED8hemQI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZaEs6Ma2us+76NrNQe36q5awbwyDcLEnvQUpLOfINJUY+wgrWR+JdSWUo3qVC8f8yoc48NHvHtdmRfzpwi4ZkNvgWRiYVYbhrOKv+u45nov/bZjxNBGWAUB6BoY52Cvvrh9EQFIYgFdGdnA6l5BwC1Yb3R04Fo0eaYKt6VmfGv0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=HihrskTE; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=HihrskTE; arc=fail smtp.client-ip=52.101.70.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="HihrskTE";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="HihrskTE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eEWz2C8/fzaHZcukLxeHdUav4xefkWoHwHqWCBjoUTaBzMto7cpzyo24if3useu5XbUl2BJ1rPj6QOQC3FkZYLcFK2L5N3MIv9weWze8kXGLc1NW6vL7V34CsJwQShAql+EDAOmxhygGCaf6EDo1+eG86YytY7eKUMYcAwKZO6VCxKi0JYNIZlunzYPbRmU3xOdkKHFkLKRInBYwhFf8PYgX5Tk7wFbqAT6vjIZW7NV1xZJ3ytEoTQrkp8zcd1ynH2ZiOJ1boXugSxe+ZOhylIjxS/OJ6qUJrvsEM/0kKiLnMRbFfeYfUdKILzdxD+FBYnl29XLPxj/qaDRsQXAZuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9S25YdSMajGpGAiu+r0YNJXJtBlQbzW2HCpDVyT+T0=;
 b=sOjX1dZkKCEWoZ1P6RsEXJ+miktj7gnqF3vDmlOtvcqcVFot53e9WQwqy2+VV3+KNhG46DWrVCYbuRcU3LtoFRsTqoz9RwC3WCkvdjkgYeorB6Z5QvMxYsMUHZVv++gI3XsZu2DcING+c8mEDHlx1k9u0dIdZp4/oHB3AcjM1f1ZaWFeG79vWKBsSknlWLsVXlzF7/eSTIkhD/KNlR3O7v1D934r5PTC2RSkmHB5zL+eeG/r3RV13/++vK1PkiptkIjwSY2WUvfnNBQg0hq7VSDfXrHEozE5h6E/Wv/iO/lNNLH+3IfNOYNEPqVBRq299CYukho4TkrXp8tf/PzMSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9S25YdSMajGpGAiu+r0YNJXJtBlQbzW2HCpDVyT+T0=;
 b=HihrskTE5BljO81PuEflwIpIuBCt4aUeRVoOF8+Fphv6ELZDRuW62+m0AHjIisfMXaibjCW770CWe7TfFlfV8ax6Q/QGy73ca/dDBQytV45/6McMQ1UGRx+bcLuLCogUkD71WGQozGgjITMglpxKFQaRKWWxdFDzZpmzzy4bIuw=
Received: from DU7P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::19)
 by DU4PR04MB11860.eurprd04.prod.outlook.com (2603:10a6:10:628::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 12:31:31 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::8e) by DU7P195CA0003.outlook.office365.com
 (2603:10a6:10:54d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 12:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 12:31:31 +0000
Received: from emails-9459391-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B00D2800FE;
	Fri, 13 Mar 2026 12:31:31 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 12:31:23 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n97o4dep19+6wxn8Q8U24+octdkjniCU6OCvGIYNTwcLT3QHyBLCQN1xzBGfzOg7KE+wXkaI7D8bYFqCUHGguUFe+NquolE1lrZQ1h6x1cGyAgalNhm3ghuK6pyUgIgn+BMvS6ydYbVQtBda3VQ4uL3IJvL7TPKtgQ9PbwRAP0SF2CmoCX5RiTLbx0c/JUc1Y/VeP0JWKz6CNHQpCf37+jpDeuxcJ6UknEw6/fTzshll9gy8ti2nt8wB5yzToWLdqTFHCHjmap4wrMFvxGHymiQdBv1Q79+5exJH0g6JTVcSOqWekRF0QzTahfz/W6fK+32I1S1DutLmUE0zlKUPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9S25YdSMajGpGAiu+r0YNJXJtBlQbzW2HCpDVyT+T0=;
 b=UeH8CGW+RkGo7mo+Tdu87xgmAOMtsEMwTpVODRZbDIfC8OfDgHdL2iK46r6sGzpJbECP9S6RMydbkdNKcMzYrCm4E97K6U7jhDlVnftUxmI44om2ULDRFSsIeSxPz32WJaZpBPjEj8N7AN/iUpWlUQxUXaO1G4TTNOr9qyAe6U13mQ7x+dOYPHIxfztoYCwAYfgpGOeKK+8b7DDbXAxZnNCrLAQVA2mpQzMKD+naayizNC9DEMiv/fFJ8sQ4WMnPjWfPmt2xV7sdWQZu+bH5nGjO8+T5BHSYhDx9VEWMcNiTrmTFULxXjkBId/ccnGN6CVt4VzGvXWEGARW7NWvuXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9S25YdSMajGpGAiu+r0YNJXJtBlQbzW2HCpDVyT+T0=;
 b=HihrskTE5BljO81PuEflwIpIuBCt4aUeRVoOF8+Fphv6ELZDRuW62+m0AHjIisfMXaibjCW770CWe7TfFlfV8ax6Q/QGy73ca/dDBQytV45/6McMQ1UGRx+bcLuLCogUkD71WGQozGgjITMglpxKFQaRKWWxdFDzZpmzzy4bIuw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7467.eurprd04.prod.outlook.com (2603:10a6:102:80::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 12:31:13 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 12:31:04 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 14:30:59 +0200
Subject: [PATCH v10 3/4] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-imx8mp-hb-iiot-v10-3-52b3084f2426@solid-run.com>
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
	PAXPR04MB8749:EE_|PR3PR04MB7467:EE_|DB5PEPF00014B9A:EE_|DU4PR04MB11860:EE_
X-MS-Office365-Filtering-Correlation-Id: df772386-bd9e-47ab-e6b3-08de80fc751a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 XVl8KOckGctDgdXdMpQueIxqwSweLw9OhMNQOHfonpIOzchZMOSrf93zloi3MFJC9zwiajw0SQpE9jyu4poOl+KlKAJDlF4Vyx06UPRa9Q0WOKtsb6YunKHTcPJGQq+SX59YlAoat0Jny+utYOrhMagJxin3094qt+qRMpj1pXzadWPqcEtVhFxTtgdsZSMPGvqnJPUSGyDTXNVg1XthHmpfiihttYLLyzVLcJ9595K7RJ1GAqpy386cuRZBEggANeoATZWInVb4ULrc36eoHjGMD/EhwYd0ZRD2DL4bkmeBtgau9+imj6YbRnMpWN2yRAtBBkgQmVs8FSFrBrwhGCAgoaHiwMGUh6iB1WrnJv+U1MyA3VFXlRvIkVxbYl2zLcSCIVf2Cnxo8LTqNi1Fm4M2ncsBy9KE25Iq13jPxHYmplT7bkz9p/TY+/CjEg2WJjYce6lBF0SxSNen2O0gM3kBpUUyMy9H7XaScVUCktT62y1xSjM1tUXOcF/nzG8NW2515mUZkhdNJftBB5HtXZRmL6CEhHsYMJdJ1EM38qCOv8DcwRPbZQFbpc8oDNc3F+otThA6P2gD88R1te2VF0GYWvHf7zXMQoQM0A2HjMTbMT7t8C8FoEol3mFFs/Gwzm0zEIB2iQqV+lMQgp9xyiPttzUDaoSGPmA0DoqV+8TccyN8+qRQau7/Q1i4RvkT0QGcWfKz+NYwVpvJFxbLgmfwoEmZlaDpd3B2rdYybugLJ83eMSl9UMK+q6Pa8T8njE6BfpvtD1DZQe1ThA0Phu9vvk9iQjKF8gsE51TomKU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 XME0rqDdP98ua0nZkpphkUZC+lvfAny/rpov9IdZ/zg6s/wKdkx4JDsb9muVpmZWwxyQdCVy0XkTOQuXkBizXa8cfI7h31nn2r64UIWiY/yaVl6ynZUM7GY8V669vsP2LeFuOBCZadqy2/VhQfWglbTbBdbWNwARk/NXv8ybqs67t/Y4Ka6VB3iJK7UT6gIwcdE/lSdoqGAJU049Rs9gJWBLGGmWvz3Hbm+d31PmyIPNTBHaTpp4QL943MvN5piZZet0MDmRFMp3qqaJIYcq0lv/nEhzibFd7nD5x+prqY5hZY56xmlCvRWlQNIB34RwJWSoYdTPz94nHWqT6lA5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7467
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 97d2181756ab492e8004162fb5054545:solidrun,office365_emails,sent,inline:9289b2abfe3e9fc97e4b402e7c3b6b90
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	561fb15e-2be3-4f61-6f11-08de80fc64ee
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|14060799003|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SRvSlTftIy9jr4X4Ghx92CRTzKf3UU792bXZ2RESlZW17C3NCxExZnR5VVcz5lEf55kBY7rO5pyG+a3X/+dM0GywSyd5pobs5iSufwv1fep0fx4D69NwzFTP6Lz6r/haA1VA8NZ1Csbys8YFZXC4OEeT0rkLT/wVALWzC2Zvc7mvvNhed/I3DULgz1MJz2OKvlJChEBu/RP0tC/vosiG0pc1HNA/k82xoTpVfDFehHEIdqjKlvNmX9mx4x/sOVKs5t6i3RLCS1edfcxf3T+/PIFrMS63et1F+yJ1vp1nxvfSlT3uW4oEuB9JcwtC5yX+XUpl0nxlbuz3+7cYL+57SFfN2oo51+eNBvZD6Hxfo9djGJdq73d/63PXOu0wAZTQyuOxxZ9yIwnGJp7WgBKRJ6XZlkM+UqLC1UUCvbC4foF9z2ht9gJgzFynUgT7TiZ1NteQhm9Xb7z5muWy9IWUZc3rwweW1hIo8nB+6tfkIvT+3vFAd74qMemVT/8XO0Oo92Xep9ulnkByqGsI1ZXkfiXkvS23jag9cFEoefyBuJPVt5dPukaW4o05ZGyb+TkmzzergQlrtfwYMtzRAbf6FoyXQp7wMeawFq4ESkWJ2C7YTg2INNWA/vVoAhVzeugNqMX91W6tHVeX1HlsECVDBFyL959KLaafj6whplq+Gq9UAOinpePSIZC5LC2KPUBOFB1CeSTGqrNqKSNAZez1eSnVVFPMFAHbcDCrfLQ5JDrym1K4pAs+IRFzpZiWKySaRayOIBSjEzBSeWInsKTe8Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(14060799003)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I1TQpo8z8748zNJXgrBIrqVh4ognX0hb5wg6LHeYSlAwqJoPijuzkH1huZ3DSz70szEsLrvr3JbKUQnYlZkHwzEJgunYPq48KOIEOAQIaUiHpnM6klE4fhvfL2LaT7OQV4QbcRXIsr63iRlOSWifkuFI8U2w9Mw1nH+6JA4qJfsRmjudhoyE0HyXZvukprgnSu2UKxmOS3v+OS3jJpC3lMEia8Cx8e7K5edWmPAbTydahVe3MDDkhyivY3lE/2TAOmvgo/rql0pFU9Erqv8+l5JrZJJFLy6YOfOETnm9GzpCYWaTtPr/k0/5Ptc4aZKZO6AH5orEutk8pwbXjOzBRjTMnrrmY1OF6BcbkTsanWLP/SvCe1bn6WRPIP35oEA9Hku6GyYEDfHoI6eVOMi8hYePPE76sZxMaqAqETmDy3cjrFuHpfykOZNQ0zT0u5Df
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:31:31.7601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df772386-bd9e-47ab-e6b3-08de80fc751a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11860

Add description for the SolidRun SolidSense N8 Compact.
The board is designed around the i.MX8MN SoC and comes as a complete
product including enclosure and labels.

Features:
- USB-2.0 Type A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- eMMC
- Cellular Modem + SIM holder
- WiFi + Bluetooth
- RS485
- CAN
- 802.15.1 radio
- supercapacitor backup power supply

This is a headless design without display.
The board includes an internal expansion connector for daughterboards
which may be described by dt addon.

The supercap is not currently described due to lack of suitable bindings.
Vendor BSP uses gpio-keys driver to trigger shutdown on power loss.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 2 files changed, 853 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 74756c680403..1ce4955cef0f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,6 +191,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr3l-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-rve-gateway.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
+DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
new file mode 100644
index 000000000000..c8c6760524db
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree file for SolidSense N8 Compact
+ *
+ * Copyright 2024 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mn.dtsi"
+
+/ {
+	compatible = "solidrun,solidsense-n8-compact", "fsl,imx8mn";
+	model = "SolidRun SolidSense N8 Compact";
+
+	/* LED labels based on enclosure, schematic names differ. */
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led_pins>;
+		pinctrl-names = "default";
+
+		/* D20 */
+		led1 {
+			default-state = "off";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			label = "led1";
+		};
+
+		/* D18 */
+		led2 {
+			default-state = "off";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+			label = "led2";
+		};
+
+		/* D19 */
+		led3 {
+			default-state = "off";
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			label = "led3";
+		};
+	};
+
+	aliases {
+		gpio5 = &expander;
+		rtc0 = &rtc;
+		rtc1 = &snvs_rtc;
+		usb0 = &usbotg1;
+		watchdog0 = &wdog1;
+		watchdog1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reg_modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbat";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3800000>;
+		regulator-min-microvolt = <3800000>;
+		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power to lte modems behind hub ports 2/3 */
+	reg_modem_vbus: regulator-modem-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbus";
+		pinctrl-0 = <&regulator_modem_vbus_pins>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power to usb hub, and type-a behind hub port 1 */
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "usdhc2-vmmc";
+		off-on-delay-us = <250>;
+		pinctrl-0 = <&regulator_usdhc2_vmmc_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		label = "rfkill-wwan";
+		pinctrl-0 = <&modem_pins>;
+		pinctrl-names = "default";
+		radio-type = "wwan";
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&ecspi2 {
+	/* native chip-select causes reading 0xffffffff */
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&ecspi2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk IMX8MN_CLK_CLKOUT1>;
+		/* generate 8MHz clock from soc-internal 24mhz reference */
+		assigned-clock-parents = <&clk IMX8MN_CLK_24M>, <0>;
+		assigned-clock-rates = <0>, <8000000>;
+		assigned-clocks = <&clk IMX8MN_CLK_CLKOUT1_SEL>,
+			  <&clk IMX8MN_CLK_CLKOUT1_DIV>;
+		pinctrl-0 = <&can_pins>;
+		pinctrl-names = "default";
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&fec1 {
+	phy-handle = <&phy4>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&fec1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Depending on board revision two different phys are used:
+		 * - v1.1: atheros phy at address 4
+		 * - v1.2+: analog devices phy at address 0
+		 * Configure first version by default.
+		 * On v1.2 and later, U-Boot will enable the correct phy
+		 * based on runtime detection and patch dtb accordingly.
+		 */
+
+		/* ADIN1300 */
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <5000>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			adi,led-polarity = <GPIO_ACTIVE_LOW>;
+			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
+			status = "disabled";
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					active-low;
+					color = <LED_COLOR_ID_YELLOW>;
+					default-state = "keep";
+					function = LED_FUNCTION_LAN;
+				};
+			};
+		};
+
+		/* AR8035 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+			reset-assert-us = <10000>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			status = "okay";
+		};
+	};
+};
+
+&gpio5 {
+	usb-hub-reset-hog {
+		line-name = "usb-hub-reset";
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		/* deasserted */
+		output-low;
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&osc_32k>;
+		#clock-cells = <0>;
+		clock-output-names = "clk-32k-out";
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		rohm,reset-snvs-powered;
+
+		regulators {
+			BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1300000>;
+				regulator-min-microvolt = <700000>;
+				regulator-ramp-delay = <1250>;
+				// supplies soc vdd, soc mipi vdd @ 0.9V
+				regulator-name = "buck1";
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <750000>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1300000>;
+				regulator-min-microvolt = <700000>;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-idle-voltage = <900000>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-suspend-voltage = <0>;
+			};
+
+			BUCK3 {
+				// BUCK5 in datasheet
+				// output floating
+				regulator-name = "buck3";
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <700000>;
+			};
+
+			BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3000000>;
+				// BUCK6 in datasheet
+				// supplies ldo3, ldo5, muxsw
+				regulator-name = "buck4";
+			};
+
+			BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1995000>;
+				regulator-min-microvolt = <1605000>;
+				// BUCK7 in datasheet
+				// supplies ldo4, ldo6, muxsw
+				// enables dram vpp @ 2.5V
+				regulator-name = "buck5";
+			};
+
+			BUCK6 {
+				// BUCK8 in datasheet
+				// supplies dram @ 1.2V
+				regulator-name = "buck6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1400000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			LDO1 {
+				// supplies soc snvs @ 1.8V
+				regulator-name = "ldo1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+			};
+
+			LDO2 {
+				// supplies soc snvs @ 0.8V
+				regulator-name = "ldo2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			LDO3 {
+				// supplies soc vdd @ 1.8V
+				regulator-name = "ldo3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+			};
+
+			LDO4 {
+				// output floating
+				regulator-name = "ldo4";
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <900000>;
+			};
+
+			LDO5 {
+				// output floating
+				regulator-name = "ldo5";
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			LDO6 {
+				// supplies soc vdd mipi @ 1.2V
+				regulator-name = "ldo6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <900000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	/*
+	 * routed to various connectors:
+	 * - basler camera (CON2)
+	 * - touchscreen (J3)
+	 * - expansion connector (J14)
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	expander: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "SYSGD", "PFO#", "CAPGD", "CAPFLT#",
+				  "CHGEN#", "BSTEN#", "", "";
+		pinctrl-0 = <&gpio_expander_pins>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+	};
+
+	/* battery-charger@68 */
+
+	rtc: rtc@69 {
+		compatible = "abracon,abx80x";
+		reg = <0x69>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&rtc_pins>;
+		pinctrl-names = "default";
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&i2c4 {
+	/* routed to expansion connector (J14) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-0 = <&tamper_pins>, <&usb_hub_pins>;
+	pinctrl-names = "default";
+
+	can_pins: pinctrl-can-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1		0x140
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK	0x96
+			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI	0x1d6
+			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO	0x1d6
+			MX8MN_IOMUXC_ECSPI2_SS0_GPIO5_IO13	0x1d6
+		>;
+	};
+
+	fec1_pins: pinctrl-fec1-grp {
+		/*
+		 * Some pins are sampled at phy reset to apply configuration:
+		 * - AR803x PHY (revision 1.1)
+		 *   - RXD[1:0]: phy address bits [1:0]
+		 *   - RXD[3:2],RX_CTL: mac interface select bits 3,1,0
+		 * - ADIN1300 PHY (revision 1.2 or later)
+		 *   - RXD[3:0]: phy address bits [3:0]
+		 *   - RX_CTL,RXC: mac interface select bits 1,0
+		 * SoC enables pull-down at reset, PHYs have internal
+		 * pull-down, so pinmux may unset pull-enable.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x2
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x2
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1e
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1e
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1e
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1e
+			/* RD[3:0] sampled at phy reset for address bits [3:0] */
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x90
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x90
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x90
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x90
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x10
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x10
+			/* phy reset */
+			MX8MN_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x0
+			/* phy interrupt */
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140
+		>;
+	};
+
+	gpio_expander_pins: pinctrl-gpio-expander-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x140
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x140
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c2
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c2
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c2
+		>;
+	};
+
+	i2c4_pins: pinctrl-i2c4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c2
+		>;
+	};
+
+	ieee802151_radio_pins: pinctrl-ieee802151-radio-grp {
+		fsl,pins = <
+			/* RESETN */
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x0
+			/* VDD_EN */
+			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6	0x0
+			/* SWDCLK */
+			MX8MN_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x0
+			/* SDIO */
+			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x0
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x100
+			MX8MN_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x100
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x100
+		>;
+	};
+
+	modem_pins: pinctrl-modem-grp {
+		fsl,pins = <
+			/* RESET_N: modem-internal pull-down */
+			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			/* PWRKEY: pull-down ensures always-on */
+			MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x100
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x140
+		>;
+	};
+
+	regulator_modem_vbat_pins: pinctrl-regulator-modem-vbat-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_MCLK_GPIO3_IO25	0x0
+		>;
+	};
+
+	regulator_modem_vbus_pins: pinctrl-regulator-modem-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4		0x0
+		>;
+	};
+
+	regulator_usb1_vbus_pins: pinctrl-regulator-usb1-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x0
+		>;
+	};
+
+	regulator_usdhc2_vmmc_pins: pinctrl-regulator-usdhc2-vmmc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x0
+		>;
+	};
+
+	rtc_pins: pinctrl-rtc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1	0x140
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x100
+		>;
+	};
+
+	tamper_pins: pinctrl-tamper-grp {
+		/*
+		 * Routed to physical tamper input (J12),
+		 * accelerometer and light-sensor interrupts.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DTE_RX	0x140
+			MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DTE_TX	0x140
+			MX8MN_IOMUXC_ECSPI1_MISO_UART3_DTE_RTS_B	0x140
+			MX8MN_IOMUXC_ECSPI1_SS0_UART3_DTE_CTS_B	0x140
+		>;
+	};
+
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3		0x0
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			/* wifi refclk */
+			MX8MN_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x100
+			/* WL_REG_ON */
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+/* Bluetooth */
+&uart1 {
+	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MN_CLK_UART1>;
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* console */
+&uart2 {
+	pinctrl-0 = <&uart2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* RS485 */
+&uart3 {
+	pinctrl-0 = <&uart3_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	fsl,dte-mode;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
+
+/* 802.15.1 radio */
+&uart4 {
+	pinctrl-0 = <&uart4_pins &ieee802151_radio_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc1 {
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	pinctrl-0 = <&usdhc1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	broken-cd;
+	bus-width = <4>;
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&usdhc3_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	/*
+	 * Use lowest drive strength for all high-speed modes to minimise
+	 * electro-magnetic emissions.
+	 * In this particular design HS-400 still works okay, no extra
+	 * pinctrl for 100mhz and 200mhz are required.
+	 */
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&wdog1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};

-- 
2.43.0

