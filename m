Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023113.outbound.protection.outlook.com [40.107.159.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA2296BD8
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316560; cv=fail; b=Rxm8My7reK90ZkRECrg+l4w+ETu4K9VHQIJazphagXcYi50g4trmY+/KUTAkLKk19z7LbZQY9gqcLclUIyXEvHYS699A7cHRA5JDYLGhbnypgZbLiTNdwuO0GLgXtYVx0TqMLBPX0HgkDnhiN9VvyyOLt/p33ZC3Heuu8/BfFPA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316560; c=relaxed/simple;
	bh=21ekZ4FDwcDkZOj3yXbI88ps9HR+I//CoXzol57ahVI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ph373Yi+gsD9K+z4WgISXT0g/n/qW3gnhknXiRHtYeHf3dwLxpQ0KP36sKtKrZngj0iyLzV5GV/UVnofVwCxMR6A458+nrFOHnt6ODRwFORENAaTsuCHsi+SyM9Nt2ESSmUMXjMUe3bbzAzon/qLI6Yl0v6jJeKNfSLHo5rXA+w=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=S8rVk1Qt; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=S8rVk1Qt; arc=fail smtp.client-ip=40.107.159.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="S8rVk1Qt";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="S8rVk1Qt"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zH1pJwZyjlD2tZG1r07RQeperKr9iZQPwiJibvuHL6u7QjnU4bec+McxuKGfIWnEdETWkZ5/svDMM+Q+SV5DSGIkqN7ajm2AfABJBhBGHlXux5/nvdGaFR3tsLurHQWSPlU+vxmxM5v6C85fQtkIdtJS+ab9cMxJolgVp0EAuW2DHa8CAxLASP1b50qbnXlb/84sQwAks7OyWQCgxVgOxPH7xFomo8Ob4fX0TXV7ITN+MBhXiwNG5sIbX2zVQmu6oyuz3XSrcs/86BiuBmnTOVelJrTk2cMiMXDN7Ypg45Npl8rhYQXsLdgjKYCBKA9lhxy0jIq017USfjJJxU9b6g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u50iMS3vcaM2ntHXkBnGt8osNPC63J2wzvvgbx5crFI=;
 b=t2tSi0loa6a4MPoKES0dgJ5gHmSDcBQ0pJTDDAjNxXPjGjko+tn0nAM9Su3eHl7peasLF+BykPb0PwF5+27VrRnSalc7OvoEkxgNJgiRzhN9hqc+NtKfoUaJuRhbDEZCH5exJijIn4v2D0JAonxML1PEWaFLtJO3FgFzaPID9H9LzIZIEm3q85bt3pN9zv2p1kkAIQh/zCMy8goRD4pDZl4WOoZ1fX2x3wA+eqOjt8Kkthfk+QVr6dIUZYX7xTSEBp26hvW0sSpqCBMxtw2ZoM1NhgkFGTI5EvdHz/3TGG1/rbdmAUPGLhrnHQ0NQ356oAb5MlUNvU1K84wHhUfl5A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u50iMS3vcaM2ntHXkBnGt8osNPC63J2wzvvgbx5crFI=;
 b=S8rVk1QteLfU7jttw22aaFax42PEqevd0cBmR1ohgpXlkIgMyWWU5O9Hyb2olEVFK8JBNCIGUocxXbWQ5LuzeLSWb3C09dHcKATqNwiNuoOO7rPCi0SzB9OdD7dC6RZE1Ls2m4rSn32YBBm8S8Hf0oyRvf9XRD7RlC6TF15tviQ=
Received: from AS9PR06CA0434.eurprd06.prod.outlook.com (2603:10a6:20b:49e::16)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 11:29:14 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:49e:cafe::3d) by AS9PR06CA0434.outlook.office365.com
 (2603:10a6:20b:49e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Sun,
 21 Dec 2025 11:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:14 +0000
Received: from emails-7063659-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-236.eu-west-1.compute.internal [10.20.5.236])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1574F800EC;
	Sun, 21 Dec 2025 11:29:14 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316554; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=u50iMS3vcaM2ntHXkBnGt8osNPC63J2wzvvgbx5crFI=;
 b=fnuiKERrSF0SiSW5dr0o/PzSnmEqrUt/xmlPubyt08CHDMhf7iCMK7/nu6ycrPRucBdBv
 3N/oCRCgUV09NmEB9BbCv3sbrIWOeHi38fk7o2Qd4koYZ89guzJ+A43AmqvHj/DW8qlIcHH
 y4rLkxc1uqbhD6YT7BBIfLz9kpUkd8E=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316554;
 b=hPB0NC76YKJ0VwtlWS166aRWoZkr5NYzL5Q7lZEH4ppc2wHfS8tJkX1za0MBclX+cVeSX
 iYeAzpqVDPnZFYFWhdcbUaQYEfYJf/lC3iCpQI/4CpP6+7WDYEu81RH1fJrFb+S1478KUJj
 sROTdpyS6PooNR50DuJFX5eCZTcXv7M=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVHbUbFFx9YyspPlDYLSH68fwzOZzccVDy4HnwbvhycST2MOylhkrnFZMRVeASX5pIr3s4P5NOtwqjDov2Z8QlfNpLociWCWL+2gqcUc3J/G/rfxx6ijaoGTSARbQqkw7vFn6Iq6lUNSJrw4uDXUAQGt6P1V8bRGy4wni9JQFsON4Hl95wgFOeRI7d9iIZMAFt+E0tRp7VW8V2FnQBbkDtPnjNjJT6yCpX6TooCfhDiJubgXq5u09ZERWxgcNnSPaqcrtlVzkbpAOKTHb/gkX8eckWU+N7S7VHt7maovAT9yzsEhyQQ71w4QAkOQabDSs+zNsptU55Z21ZJWOFqggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u50iMS3vcaM2ntHXkBnGt8osNPC63J2wzvvgbx5crFI=;
 b=HMweF9AH/3eMaElm2oPNXKdYKrrLptOHkdGN2gEoa0U0Kx9l3O5G9tQSQCY7PrDKXkawbLH5BSY259P43JUTb5KQ+t/rhkJpN/K5Esg3JodoJ1Iii6WIAItwFatrftfWluhpqinJNdiDeXksEZ92dHaEk4uAUTwsGHwb1DaLrZyG6xO+8rzTXTJlzUkBJn1AZYE2867MlbDZhnOhsk8Xhq+XOnA4jOD8/Qf+Yc/0TiIQx/KsNlfRPdr2dVQ3N9EpLq96ydPfOC5E+gXEtHom+F2O96mDQCkwxVACC33NmJIwoPYZVR8maQvkiuzkstBfA6GCHYi2Tx+FfqG7NPfqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u50iMS3vcaM2ntHXkBnGt8osNPC63J2wzvvgbx5crFI=;
 b=S8rVk1QteLfU7jttw22aaFax42PEqevd0cBmR1ohgpXlkIgMyWWU5O9Hyb2olEVFK8JBNCIGUocxXbWQ5LuzeLSWb3C09dHcKATqNwiNuoOO7rPCi0SzB9OdD7dC6RZE1Ls2m4rSn32YBBm8S8Hf0oyRvf9XRD7RlC6TF15tviQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:57 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:57 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 21 Dec 2025 12:28:53 +0100
Subject: [PATCH v5 4/7] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-imx8mp-hb-iiot-v5-4-4a4dad916348@solid-run.com>
References: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
In-Reply-To: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|AMS0EPF000001B2:EE_|AM9PR04MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: c744350b-9697-410c-ed57-08de40842b90
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TFplakRDZ29GeFU1RDVzUjZQTCtrYkZOQS9xN3M2ZytGNW9OOE01a0dGbStP?=
 =?utf-8?B?Sy8rblRBcGpKVFIwdWJuVEZ4SEpLQXNFR21RS1VmYnhjTU11SHNNSmFLWTlD?=
 =?utf-8?B?eWlpeWwwUTF1d25kN1pHUUdSV2d2UFgyaldsbFFKY3VWaDNGMDhoT054aFFH?=
 =?utf-8?B?cFY0VmZyUHJnSXZTRlYxVWhBZlZaYzE0QWhRYVNES1Avek01Zk9oZ29yUGIx?=
 =?utf-8?B?REhPTi90ajNLSlZVUE9ERGZiVm9ZeXRSdFJVMzlpL0tMaEVzZ2dVR0FOc1Ji?=
 =?utf-8?B?YlBMbTBhVGh5OUxyUHBXd2U0ZnZEaFIxWUt6WVYvbU5OeUFiczFQclZEVUV4?=
 =?utf-8?B?b0NkUGtRYzZidThxYTVvZFprS2lYRGpUTWpvbC9XQjFGMjhsWmpwbzRBYzdq?=
 =?utf-8?B?SGtDS0RrWW93ZEN6bGZhN0hFQlU5MXJkVW5Tb01WNEtDL1RtV0lwSVZCbmc5?=
 =?utf-8?B?eFdibmZrN1NycHY4aEJDL2JCWm5kczU4TkI3WjJXdnFiL1R3eVhySGxUcXFR?=
 =?utf-8?B?UWw4dE9YOG80K2VscTlTcmVHM3pYRlBIWmxtWlFqRDYwc3FDcldKZzY4USs3?=
 =?utf-8?B?K0FRSnR0a1dzaGgzUXVaUisyMlp5bjZnUFloM08zRnQyaUgzeTN3cDRhVG41?=
 =?utf-8?B?QTNyU2N1em54N2JUTjdqaFdxbWpGdDkySE5vdmtQVVBXbmhGQmR6ZnE3cHBh?=
 =?utf-8?B?N2lGcG9FM0RrbWR2MHI1R2ZJOE40MU5aWis3VUtGS05lS1lPZEw1cXdLb2o5?=
 =?utf-8?B?TkNRQXpteE9aK1pVbGVGeWFsZ3I1U1d3YVFtMG9jOHhGS2E0RFJ0b0Urbjgr?=
 =?utf-8?B?MkovZWZkY1R5dlVRMlZyNjdPWCtvTEFmWDRhc0JnRlFRa1l6L3U1TmZYUUtJ?=
 =?utf-8?B?dGo4QkpQZTl6dnRUOGVXU29DMXZNOFh3QkplbWJQbEt3d0c5Tng5N2FkaGhK?=
 =?utf-8?B?SXJYcmFFZVdQVGJpUUlKK1FkMXY2N3BBblJORlFlWmY0VzlUUFhQVlZjMlBl?=
 =?utf-8?B?eWpsMk5teDY3Mjk0QUZCMjYzS0JxZE93UzNWUmcvN2M1NW9mSGtKNytWU3Vk?=
 =?utf-8?B?eEd2bnUyUk81RjVaWHd6akw1L25ZS0tJQ1llUFAxS3hiY3h2Tm41eEcyakZT?=
 =?utf-8?B?MVJKWkM2UDAySWp3dGJlSUdxMDY1bEhIbEY5SWVicWpsT3d4WkVFMmlCam5u?=
 =?utf-8?B?czR2MXU1YTF5TWVRNUVkYzY5c1FoRHk0RGlLd3pVNkg4NVhSUFFoZit6Q0lL?=
 =?utf-8?B?R0M5ZUdkaEhWYXA0V3IvSHduZE5Wa0tOYmNuaGp0Yzg4Qml5aXo2Wk9tMjJ2?=
 =?utf-8?B?SmN0aFRXeldqRmZYYWE4V1RSM1I3N0xrbzRiVXU3V0JiZkZnSU1TaEo1cFds?=
 =?utf-8?B?Z056Um10WTl3bFNtZEhWcFMvYzdVM0w4Wk55Yy95TVZVRkYrVmxEckVKN0I1?=
 =?utf-8?B?MHlpOTZPT05aMXBObnQzbmdHZmZJdmZmTjJOWkVkS3JlMUltdWJ4MEVNUEhL?=
 =?utf-8?B?LzhhTTliMWEwREJHVkFsRTNFQ3h1dGNvTjUyZCtaVW95V1d4Tjk0aHUyTmVx?=
 =?utf-8?B?OHBCaGJobHZaa2l1Q3ZOcktTZEZGZFlOWmtMb1FReXhNN3h2K3c5bE5hRld2?=
 =?utf-8?B?VmF6dWJrOGdSTHI2ZUZTc2ZFZGVSdlE2TEwwZ1c4RUdTZStkTnBaeDUyc05M?=
 =?utf-8?B?bGVZSThFNGIyM2hUcjFCTzdsaTc2bUk1V0xqMzU1WE1DbDRkNnVhSmVkM2NN?=
 =?utf-8?B?a2JBb0pPVzRWSjU5OWZKMENhdUNFVlU4dGp0NEtsR2RqNnlFdXVrd1ExUnhC?=
 =?utf-8?B?TDV2WUFGdVZRb0tzRHJOMVpOU3NuVGVZQmhBUWxtQjBtOGkzU3JjbGtXd21r?=
 =?utf-8?B?K0tjZk5sTytVMk15cGpwY2xGRkRibjV2TWo1T0tlZHRrK2ZrZElSSC8wUzYw?=
 =?utf-8?B?YjF0a1lIZkhOYmZueXdHT25meUlobTR5WXgzNFI1U1BkRzBSbG8zMmdIM2hq?=
 =?utf-8?B?dzdUb1RoRmE2b3d4VVljRk05Y21JNVF2ZjBldmNlN1BsL0pCQndFMWRpT21I?=
 =?utf-8?Q?acAbdE?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9c2c039570d04067920991355cf0ee5c:solidrun,office365_emails,sent,inline:496ecece1675cc50818f13340f6c7d29
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e769ff8-15a0-470f-70a3-08de40842126
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWZRdlFWd3RXanVaWG5IUEdxV1dZNHQwQ0grc2JoWC9SdGhzTUgxOS93OHVk?=
 =?utf-8?B?bWJjYXo0SHNwakd5cnJ6eUZWU1Vkd1FsOHhVOFZBRGZCVmJDejdGM3Q3UTJ6?=
 =?utf-8?B?ak95OUk1TkY0bGcxUUpMditBd0dpWC9EbXlGSXoxZUxvVkZXcG5FblY4Z3JV?=
 =?utf-8?B?ekc2UytSb2UxSEVkbERDV0JOYTZWQ0o5SGQzMDNQYm84T0FaaFRSNFFvUERC?=
 =?utf-8?B?enppdEludEVhdkI5bGZ5Y3BNK2V1UE5DVFgwcTZ3eVpOYU1tQWtRN2UwemYy?=
 =?utf-8?B?QVdHTEFqbEQ3NkYrUjZWbHBiNDFDcWRid2Nlc3ozRDljVVllYmFIVTQ0Umlj?=
 =?utf-8?B?QUs3VzltMmM4bVM3QVZUcDAyOUFYMTgzMjZnZmRHdE1DalIxZmVCN016cmJK?=
 =?utf-8?B?dk96cnh5OCt2Q0xNUmJoY0RZQ1g1VFh4dG5adW82L2YvNUtVeG5NRFRTT2pC?=
 =?utf-8?B?UnRVN0EvOU1vQ3o3QzhzOThvV0kvMHFIWFV0Sm8xbFlqSktZWW1vZDRMdGJP?=
 =?utf-8?B?Y1NETy83eWloVEp5bVoyamcrb3lQMzFSalRZRTJVa0d2ZUROZHBvRGllLytW?=
 =?utf-8?B?WTRPN09mZVVkMmYyMGZSVkE5UlZGVUwxMy82SXpSNlRYM2dqS1oyMU4yKzVM?=
 =?utf-8?B?Q3BqK3hkRHZua3B3dVZ4Y3ZBNE5MK1dFNGxtajBBTkpXeUhLZEdmcjl1SzVj?=
 =?utf-8?B?NUNST1RTOVFoY1JqdFZoTkk5SE5mRjhkc1V3MEZCbU9iNXdVMWw2U0tiNW9i?=
 =?utf-8?B?WGJuUHBNRTJYcUFtOE5rZ2NnRHM1dkljOC9Wak9hbWFTbWM1ZDFTaTRpMmd5?=
 =?utf-8?B?ZEc1Rm5nZHljbnpXMHdkay9WTG45MVBHOENtbkxZRy9VNHplUE1VdHE4M2VP?=
 =?utf-8?B?NXc5YURvYWJGYU5WR2xEQXo3UE9iOHB5OFVTVVZaYTZ4M0I4OVBhYUh1K3Ji?=
 =?utf-8?B?VjIzZzRpZEJCeHJ2cHA0Nm9yTXRoYnVHUXdoQjNvSnMwQkFMQmUrZXpqN0h0?=
 =?utf-8?B?ZnZvSlNuSHhyUXVoZGU1RGI4c0VrdU5BVXNuNTVPN1RGbHduTFlWUzl3VGNk?=
 =?utf-8?B?dFQ3YnB1RVgwcGJXdlZWQmtZYjFweEV2aFRER0hrS3Z5bE5iZ2w0anY1NEtE?=
 =?utf-8?B?am54WHdLekw0d0krNGdHRUsvVmdOSjZrNU80U0RUeGRtdWw0UUtFTjVmQS95?=
 =?utf-8?B?UVFVRy9ab0ZJM2VQMnZ4UFV2bTZsczRuNjBQZDFzSWxuVTQzTkJQNHpjQis4?=
 =?utf-8?B?WDkyYWYrZVQrTko1MVJMRkM1cm5IOVVRQ1pPckRQWjMzWU9hUHhXblN3RElY?=
 =?utf-8?B?bkhyRnZsdUdEei9iQkpiMk9Gb2ZRcVN0RGJiejdLSmh1MmFFVTFxMW9HcFdi?=
 =?utf-8?B?ZFQvZEh6RnRwQXRYbmF1aTVRVTd6NlNTM0wyQnVmNGJrOFFLYW5RWWRud1Yr?=
 =?utf-8?B?ckxBUmF5eG1YS3dib3FETTJERXVYakcycXd5Qi9Mb2tWazlKZlMrVWx3d2xt?=
 =?utf-8?B?L1FOY0YxWnNaQ1JiR2hZenJMcjdmSHhIQSswejJGNW92YmdhMGZySWlsaXdJ?=
 =?utf-8?B?Skw0cG1QSmFWSnRRQ29hekNvMHh6Zm05cUlaV1o0bERsOEd2TmpXWFVWTGxB?=
 =?utf-8?B?VktJSGhTeXBYdUgwL1V2NUtFRzVJM1hFbUhZTCtJajdnQ2E4UFRNWE5VanhS?=
 =?utf-8?B?Zk1NUCtrRU9XaTNOMGhCNnRNd1l0azJPTDV5dkpMdG1kUll1Y0UxdHZING0x?=
 =?utf-8?B?ak1CZ1NLODAwcExPMWNGRTdJVHpwZnlJRm12K2t3dzRScmVkekFSSHlWY2l6?=
 =?utf-8?B?Q3p4cVZjZ3NaNUMvUlZKWURWd3Zuc0h1Sm9abE5iM0MzQ095Rm0ybkMzMGlQ?=
 =?utf-8?B?S1orMG1lS01oeFAzUXdFYWJERkt4L0pNRndTdURXV3dZcnhTcWNFYXBVN0po?=
 =?utf-8?B?Kytvbjh5UHdPcllpN0tLWFRRYjAwalM0Qml4QmlSWmhaRjhtQktOZmVlaTQr?=
 =?utf-8?B?ZHlVR1dvamhId0tIdTY0ZldHckhUeUdVOVFXTzRWSjAreFFsMEpGVVk2dG1X?=
 =?utf-8?B?RHhjSWtIbTc0K2hqL0FXNHMwTVJ2WXFFL2RuRms4ZWxxQjRkNytHWFByZ1VV?=
 =?utf-8?Q?VpIA=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(35042699022)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:14.2964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c744350b-9697-410c-ed57-08de40842b90
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0c..c4c6fd6de9637 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -203,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -213,9 +214,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.51.0


