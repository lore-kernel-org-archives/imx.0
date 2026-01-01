Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020089.outbound.protection.outlook.com [52.101.69.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B529DB6C
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.89
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279976; cv=fail; b=k/0svDHNTmN6fcQw6u6VCsYUc2cz5rnrYRrjCxIZHTqpoE27SQtwIokQfdu2Y8CB+fZXz3T1aZAnqkeDMC++H5Knx8jBFtKR4Kn6TnW5+N+7OuQmPACV/SHx1b4aWtAqi0y2uvblpcMY7uG/rXN4T1uyq0S17KyU+rC6gqwyxL0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279976; c=relaxed/simple;
	bh=bfn+iyhoQGyP0mpT9m1yV+oaRQ91F8ocIr/NS5nA/3o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W6LkVx/epL7U9WmWbkdGn1ywEK3FeU5ZPRPTcBC67XEgkViXfuO5srA3H0i0HgaIqwaEhPJ8bxZx3+H/EAq+bOTKanszxFvrM+hIhc6+AHgAKjPoW10YZ0nmIA7txpfqUPgLoRurtVEyv/anVNQmKWqNF0wtfcO+7MbpX0wXNCs=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=MJoprt8E; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=MJoprt8E; arc=fail smtp.client-ip=52.101.69.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="MJoprt8E";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="MJoprt8E"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CJSWw0EZh7ckyee1Veb3B7aH34Eg2AKdcujF+VOoTLxKnkNy41RLsYSrO2zhQNH7e3UOxvwukF4KSphbLrpVqUKL+3UG/G93uqfcDa67oWOmAtpXFl8tFbjpjDirZ3xfpznhYX7jfYoWRoJ+SfaEMhi2U0VPPDUBZVsEBaZWnUt9bHHilVHwt25ESOLbyMyUtmRTGyDrc6oLER2IPLF67OtFYS8CB02vIxNfOmW7rEhkFd79w9dP12/2HKTn7/grWqCRmUwYJZnzJPklX+tCP7tprc+npiXxML8gBsKOCg3AIT0wlRvNcR/j08cs4D1n89TtKGVbdVKZBGEtJh0+AQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccztQsRqpsg1D2m+d79KUMwvYhwxNj+IvrELjxr7lIY=;
 b=HGd5+i7Sx/7krWSu1YJm+EpmpIPc7+cxPAbrDkyV3mg9SG4qIC2s8hwGWD5Bq6OAJ39CRzvXGMIRq4kSuviDi6hRVDh2yzRiiM3bCI1WYDoHlaUWFyy9ghTwOXztb79YqSOgDODEqqKt5p1f78JzrLRdoaRhCMYiN+Ud4tFlujRFQskPbaiEnD7KwNtEhFw/0asqttriS/d/Z0u1X9YIJx0WVo25fwyUKqPBD8b6dBqI+WGJtN9imfp5oLetmxMHdd6vys/zm+9tchPahjwKr4/uYGjNMg6Fanfh8P878yqQEIO0eooWjSGEqCUK9SJPkqQCydmuwJmxDkyWrD1NZw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccztQsRqpsg1D2m+d79KUMwvYhwxNj+IvrELjxr7lIY=;
 b=MJoprt8EEJwZ/U9msxGp2TtCqTH9h66D71qSFSzrNZ8/tuYvFiTZyQ2HivxnGxLM9DA9eV5xGjuxFmfFNekV/dRjNsazZjDaO+po0X/FvPYCz2HdzROHmLVbFq9VtEn+sFRJnXUm2SE0CJNTW8Ehfqd0Sj83OXr43SOuvvqXQ+Q=
Received: from AM9P250CA0012.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::17)
 by AS8PR04MB8515.eurprd04.prod.outlook.com (2603:10a6:20b:342::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 15:06:08 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::97) by AM9P250CA0012.outlook.office365.com
 (2603:10a6:20b:21c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:06:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Thu, 1 Jan 2026 15:06:08 +0000
Received: from emails-6047411-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-218.eu-west-1.compute.internal [10.20.6.218])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id CC44C809E5;
	Thu,  1 Jan 2026 15:06:07 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279967; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ccztQsRqpsg1D2m+d79KUMwvYhwxNj+IvrELjxr7lIY=;
 b=C54S30Pqj5BHEdL42ObtIkQOVoOFGJopa5DTSoZWJlOLfI7BbGCLD9Qr9iAx8v6aTKRRa
 xsb9DFjQ1rvf2qfq6CT0Xq0K3NZa+FPrrOFGRjJzPee2Y5gxvOnI2eCpOOtfWo7Nh4QvC3K
 YX6jivC+xvuAe5vkAvgLumdfWYmqAgI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279967;
 b=OeVAIiGG7Zkqx3iYUcR336//QmPe1TLwBaZkTvbmh+UfkimhvtCOrwiEKbDyCD9fBn98c
 Pv70aWeLt1Lu+eWfqu8fGTLOg/unpj84dJqH3ZNXl7TRBOZ8IB/xMZNWfmZ+iPQ1YSp1IhM
 UPAnw1E4xX0GeMy34fDhdWkVi7TU0pk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFpmxDVrGS57yR85M5Hlc4r5exZt2UQ4ZrQUYS1cSS8nGwTY87GqSnlR8H57tpeI/PlyPX4kTgP2sk7PnPSe3PUKEiw+i7TG/gC80feER6zepORvR1yPQ1dvkca8j0xUXdpaBkicoS+PRZtGKfEHUpmR0JIk0WKArSFb0WLnbRuZK0WZwXWyPcFiBQkrQMOnh6c4OqLuzheF89V/wqRUYvwx28Or9OtSq7WiEipR6L5qX0DNhbUieuqC5+LrnOhhC4qde2rtrznCw1dFNj8yfaT1UkeNiz0mYp8R+JDv2CvFeZPK51M3NYtZOKKGZN3EHTAHfd4BKTEGOrEVLsCHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccztQsRqpsg1D2m+d79KUMwvYhwxNj+IvrELjxr7lIY=;
 b=hhqTfvc/YhnwXZkKYibbr6jgKiaiQ6E9+FDCpVYZdBceC72h6LdY9+bIm3y32Q4/fcllDSbOIbSTu6pPhVFiB0Ukx1S8GHD18OgLGzZ3SbZYwvG3hkbdVo6iY2+XXeD4o588TrBEDpLup7AMvpq2BwwC7sWIaU2e7LlkGQRb3Z2NB9RxU2gsd8bSB0VDpT66YHkoTP/JABHbSegwcJ2dPESI1IS8C1QGuDGktlpFT2wBKiANZGqw3czU3aUl7ApUIO2ZnqFrLfly+N3aChkMAyu3ECLbOB6GOje+eLrGNfpGfcIdnStzuNKjOWX8VaBaER6ikZM39UgC4IgUYBGr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccztQsRqpsg1D2m+d79KUMwvYhwxNj+IvrELjxr7lIY=;
 b=MJoprt8EEJwZ/U9msxGp2TtCqTH9h66D71qSFSzrNZ8/tuYvFiTZyQ2HivxnGxLM9DA9eV5xGjuxFmfFNekV/dRjNsazZjDaO+po0X/FvPYCz2HdzROHmLVbFq9VtEn+sFRJnXUm2SE0CJNTW8Ehfqd0Sj83OXr43SOuvvqXQ+Q=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:56 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:56 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:46 +0200
Subject: [PATCH v5 6/7] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-6-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|AM3PEPF00009B9D:EE_|AS8PR04MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f72c262-823d-474c-a74e-08de49474af4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WmlCcUo1SzdHTEdvQklYS2R5UE9MVzdFdlBzTEovNUsyTzlsSklIakd2Unoz?=
 =?utf-8?B?VUY0bUp6b3NaeHVaQTJ3Q0xRTnJ4emxuaStLSFRxMFluaS8zYlRSelR0SjNI?=
 =?utf-8?B?cm5jZm1WWVdRMjZlZGJLOTltWS9tQnFBdEN6ZEp6dTRra1RWVmo0K25scjRH?=
 =?utf-8?B?YUdhS0l2eE5SM2ZBbEJoblk2cTkrZnRoclV4SVY5UTMvTGFCa0FzT3dnNWNn?=
 =?utf-8?B?RGZpYmJIOStocFJhVXBWNHVQMldJZEZwRzEwVDBidndxcWpKcklYRTJnZFYr?=
 =?utf-8?B?Si92SlIyZmhpUGIxbkxBUjgyeWNsci9EN3FtMGFrMGZFdlZDMUFYZkZ1UlRW?=
 =?utf-8?B?WTRIRW9lYUVIbllpUjN1T2crRGJBMHNhVWlDL2RFRE9LVVJyRWJZaFdFOEdu?=
 =?utf-8?B?T2lBd2NOTFhDNVJZbENpcTVRcjFkeWdTM1g2enJKcHpsRE1paGJqMklGa0tJ?=
 =?utf-8?B?RUVDdG9vKzhWenpLOTIzdGxxemRoUzI3VU5sSHlIMmFjQ1crRkNmRjNWQUp4?=
 =?utf-8?B?eUtwVHBxenlvS2o2VWI3YjVZcTNHRis5RlpqZ2dLM05Rb3lnaHhKNE5qMFd6?=
 =?utf-8?B?VnRjWGg5cFpIS1kwekpYZlE2MHJ4K0VpczB5azF2Z0hKSFNsSkhiakNpeXRs?=
 =?utf-8?B?N2srUFMxUFhUVWVQdEpoT241UnpkUjFZR1YwV3U2aVI3bmFzdERNVmFtN0Vp?=
 =?utf-8?B?Q2tVeHhyN2VEWUtJMWZQakwxRGpMOUNOL1RqblVzVVQ3dHZXRFlRd2tudDVw?=
 =?utf-8?B?ZVBhN1g1YXZhREpOYWNheXV4UVlxSVlGbWFIVzd4VXpsZUE1ZUtlQ1pLa2dU?=
 =?utf-8?B?QXRURDRLSW5wN2NYQTVFNlpoSWErcmJuLys5VVgxb28ydHl2ZlhSVnFDdWJ4?=
 =?utf-8?B?eDlMbUlERWdsZEZUVSt6YUtwTzJ3QWF5dVBrNXpxYXUzZHUvcm5PZ0sxajMr?=
 =?utf-8?B?aU9lS2hjR1R5NDN3T2pKcWtsVUZaQUZLYzgraElLYlN4Y042SkRDNVlRRXlD?=
 =?utf-8?B?d1hMMXdMVWtEbGRDc1VxVEh0SzVWRHF3dzJiZk81ZVZaeHM5VDUxbjJ5dFF4?=
 =?utf-8?B?WUxXTGZtUlhhV0pCQ1pEN0pXRjd2blVnblFBWk5jVWxITHdxWEJLYWNXTUls?=
 =?utf-8?B?T0g0djQ0Wk9SMlZPeVQ0L0wwRzNhMUxFMlBuSW5oNklrcmNnam50ZW5ER0NM?=
 =?utf-8?B?V2NndU5wZVhUZlIxaGpIcWJXWmM1WkZzdGdkYmljUllOMjY1Z09Xd29veXJp?=
 =?utf-8?B?S1dYeVdCMG44bUxYbXV1cTIwWDQ5NXBETHpiZFN2dWtEOEJpTksycVlSRnZX?=
 =?utf-8?B?R1NmRzAzRkhySGxGeEhMOEpDczFQMnkrY3ZiSjVuQWJyQTNnZCsvdkw1Sk1F?=
 =?utf-8?B?TmlyYzV1eVlKUEVwMVJtSU5ObXY5cGhQVlpGMlpyUHdtSjZOQytTYlNpRm54?=
 =?utf-8?B?S2xKQmZTWncxNWVuWkFEUWplWFp0eFB5aGNiTmh3SmQwOFlxZExETEh1NWtB?=
 =?utf-8?B?QlYrQ3ZGaTlsQStBSEZSMTE2RUZGUjFjbVVSRTExZVI4b3BabmpISTdsRU1E?=
 =?utf-8?B?SVZqV0U3aWp1ZTlkcjdVbjV2RkxaWG9ldXBkV3Q3MkNWWndGQWNmaXJqVUNR?=
 =?utf-8?B?Wm1hNjdyZ1FmUGJ5TFdEOTBjbjcySW9ndW0yTmdscGhXRjhEc2pzRU81NUZt?=
 =?utf-8?B?U1BqU0RVaHVPS2VGVnd2WjIrbUIvQ3ZMclhUN2hnL3NaVlVjSk5ibGlJTTRj?=
 =?utf-8?B?MmZuaHpDaTVDaThmNGRBRlZnVVJ2WkFMUGFhdW5SS2Y2M1ozWUIvbEZwV0gv?=
 =?utf-8?B?Z3NtOElwNHBPUVlkN0NUVzdHMlUyNVdnV2dZeEhIVE5oSTZkU25EVnJCN08r?=
 =?utf-8?B?dGVqV21YY1NhSTNiNFc4TTZWTXFXOHVmaWJKSWIzck9ZeG5hcCtMWVJuMkxO?=
 =?utf-8?B?R0E0ekJUMFZ6ckpJV01NQXFSVlZwTldkOGdDMmlFTmJnajYxcjc3SGdIT0Q3?=
 =?utf-8?B?QVVXR1d1cnZYQWR4OXp6eWhHMk5vVDFVRytRWkgvUWplcmNnczVtS2JrRjlx?=
 =?utf-8?Q?pColRt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ff489feda1e14ca9b25c8fb344b0bf81:solidrun,office365_emails,sent,inline:113452bdee034aaec32088b4b1e9092b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c04a01f-9f60-49cb-1124-08de494743c8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVZkMWJUM1ZMNDgyUFM4Q0s3TjgzdTgxUVVWTzY2eXBScTE1a0h4cVBDcmVN?=
 =?utf-8?B?Qk1VdGlEejNqZnlKRU9BWFcvQ2RNaFlLOEI5L1RTU2dqNGd5dk1FMkNDbEZr?=
 =?utf-8?B?dWVxMXBOWU91RE9IT00wUmMzR0FYdFdhcXpCTVNKWmFLelgrWjZxT0ZhTzVW?=
 =?utf-8?B?dmtDQ3N6bTE1N3NFSjVSdEZKUSs2ZUk3RThTbEhTRkNoSWYxcVZIMjlqeGZz?=
 =?utf-8?B?bkpmZTRPQUJjbVNyZkpRZ3F3ZWp5ZTdIdmFENWc5alREQ1RQK2xVMldNSnE5?=
 =?utf-8?B?MGFQNWVUTmVUMXVQc1R5MWdieTdvR1lXN2VPVDU1dzYrSjhGN0l3VTB2QjVu?=
 =?utf-8?B?ejh2TXlUdUNzQldyV0Q0Z1Y2U2xIdVVPVUVyRmg4MnpvM1RPaCtQYjlDc0Js?=
 =?utf-8?B?L3VpcWdBaU92bU91OTkwOXJ2WEFOall0dkZjOFJqUUFtU1o0dXZna28vMWFE?=
 =?utf-8?B?U0ZNU1ZWNXJ5RWZ1ajF1ZmRWR09pVUVzTENvZHJKOVFxUUQySUJhdFpUK3F4?=
 =?utf-8?B?YW1ONEh6U0hIYnBYOXI2Y2UzMThjeS8wK2dhTXplbDhuQnFIaU1oT0hRWWI5?=
 =?utf-8?B?QUhUNUZXQndhb0ZKdjRiUkJ5bjFhbmNmTjJ3Y3hOcFlPdkR3SFZLQ2VHOUxy?=
 =?utf-8?B?andOV2MyUnp3SngwNVRjRnFCY1BvcytGNmxYZ1FBd1FBMytHOEI5a1hMbmVW?=
 =?utf-8?B?MERRUTM0dGwwSHNXcjk3eWdudk8xMzFid01USXY1MmVDVkpXc1lCUkhaZ004?=
 =?utf-8?B?MXhhc05XL0Flc2hsRWtKbnRneW11R2ZNb1NUS01OVlRmRnJDWmdwRnhxRUw0?=
 =?utf-8?B?UlNLNlpQcXVJWjNlRU8yTFNnbHpnWjYwUGdUV1F0d1hoNTVnd21BZWVOc3g4?=
 =?utf-8?B?NGlzRW5rUDhJRVVoU1FFSmY4eFdNVDdxNGpDbUhQcVJ1cDloRzc1MGxKR2gw?=
 =?utf-8?B?WnQ3TVhGVHRKSWZqRU9sdUxVaG1kRk14UlBVOEhzV2FRZU1la0VxWGl2K0NX?=
 =?utf-8?B?Q2V4WHVVcndmNHBoL2RiazNsZUNIL3MxUC94eCszeS9TTmFIRkFYM1J3MkFs?=
 =?utf-8?B?YVp3TnhUdk5Tc0pwTzNMQW1KcEF2ZmxmV1B1UHZkZm53ZXFpT1BFTmFDbjFE?=
 =?utf-8?B?Z2pORzhuWjdueDVlb05rTktEVDVFT013NUlwR3lXUlUxb0VnaktDOHFUNWNX?=
 =?utf-8?B?YWtGK0VBeGdISTJ4ZE1DZlRRSHoxUkViaG83MW9JaFBHSSs4SGJia0Zoamd1?=
 =?utf-8?B?NFRRV0NHNWc1RDNlazVJTU13d2hXTDZWRGJrRzU3dE9QZVRtRGFrTWpnTkJO?=
 =?utf-8?B?RUlNbHQzNVMvVXZrZk43TGhGcDVJeDVWMURoVWQvNjJBRjdJaUYxZURMTTht?=
 =?utf-8?B?OE4xT3RMVnFMTTdLZlNLZWpJSDdIUDNFQjZLckE1M2JiTVZDZTFwVk1MUGFS?=
 =?utf-8?B?Mk53dFVmalVIbW1WMFdOSXZReWpUOXJhZWVhM3FqbytNdGExcHh3bkFBdmlu?=
 =?utf-8?B?cTVxanJoNktEMmRUMDFJS2RML3RqNG1mRngyMUxDZ2xRZE9RYzRqMUVpS3ox?=
 =?utf-8?B?eEdzZXJ6dkh5Snk0cm9ocjVvWGtIWnliZ3UxZWNIS2s5SDZJa25iTGwvdGEz?=
 =?utf-8?B?Q1VDOVV2M2l6eXFidmRBeDlqNnhRM290cGJ1RXpHL2Z5clhDMkJNYll6STMv?=
 =?utf-8?B?ZzRZS0RwZVpNY0t6V3RaeUxySXBrdVp3TGhIN0VWZXFlblBTUzh4aC9uS29C?=
 =?utf-8?B?cXc3WXJSU1JGMWVXQWd6dGx0bFdrT1Y0bjhtTjEzSk9GSHVEMUd2aFE4aGY1?=
 =?utf-8?B?QUF2VVhLREU5QVJEdFFHSU5oVXluQ1ZzcTJDRTY5NTZNaUZkSStWTWZzbHpq?=
 =?utf-8?B?NURBZGd5YTNGdWhlZWhQVm5CMnhqT1VpQUczb3JKMEdBWUpxeGNzYU82ODU2?=
 =?utf-8?B?NTNWNHJZZzVxMjRwNEwwOFNXRzl6YkxTYVQ1L1BzdFRTY3ZOQnlBVGgwK3lR?=
 =?utf-8?B?eWFYRWVlZkg1a2J1enpudU5GRTg1MjZVbHpXRTFNa3RpWkdhTEpCcFNkYkds?=
 =?utf-8?B?cHRka3pudVZVeGlveWFRVk4wWXdDelVDQlFUVXZ1M0ZqVDJTcEZQbk8xMk90?=
 =?utf-8?Q?cenQ=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(36860700013)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:08.1230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f72c262-823d-474c-a74e-08de49474af4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8515

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
index 97e600015464..73c3d234149c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -187,6 +187,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
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
index 000000000000..1d512cf7422f
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
+	model = "SolidRun SolidSense N8 Compact";
+	compatible = "solidrun,solidsense-n8-compact", "fsl,imx8mn";
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
+	/* LED labels based on enclosure, schematic names differ. */
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		/* D20 */
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D18 */
+		led2 {
+			label = "led2";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D19 */
+		led3 {
+			label = "led3";
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+
+	reg_modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbat";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to lte modems behind hub ports 2/3 */
+	reg_modem_vbus: regulator-modem-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to usb hub, and type-a behind hub port 1 */
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "usdhc2-vmmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usdhc2_vmmc_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <250>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wwan";
+		radio-type = "wwan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_pins>;
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	/* native chip-select causes reading 0xffffffff */
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&can_pins>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk IMX8MN_CLK_CLKOUT1>;
+		/* generate 8MHz clock from soc-internal 24mhz reference */
+		assigned-clocks = <&clk IMX8MN_CLK_CLKOUT1_SEL>,
+			  <&clk IMX8MN_CLK_CLKOUT1_DIV>;
+		assigned-clock-rates = <0>, <8000000>;
+		assigned-clock-parents = <&clk IMX8MN_CLK_24M>, <0>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy4>;
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
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <5000>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
+			adi,led-polarity = <GPIO_ACTIVE_LOW>;
+			status = "disabled";
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+					active-low;
+				};
+			};
+		};
+
+		/* AR8035 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			status = "okay";
+		};
+	};
+};
+
+&gpio5 {
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low; /* deasserted */
+		line-name = "usb-hub-reset";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			BUCK1 {
+				// supplies soc vdd, soc mipi vdd @ 0.9V
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <750000>;
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
+				rohm,dvs-suspend-voltage = <0>;
+			};
+
+			BUCK3 {
+				// BUCK5 in datasheet
+				// output floating
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			BUCK4 {
+				// BUCK6 in datasheet
+				// supplies ldo3, ldo5, muxsw
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK5 {
+				// BUCK7 in datasheet
+				// supplies ldo4, ldo6, muxsw
+				// enables dram vpp @ 2.5V
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				// BUCK8 in datasheet
+				// supplies dram @ 1.2V
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				// supplies soc snvs @ 1.8V
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				// supplies soc snvs @ 0.8V
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				// supplies soc vdd @ 1.8V
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				// output floating
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO5 {
+				// output floating
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			LDO6 {
+				// supplies soc vdd mipi @ 1.2V
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	expander: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_expander_pins>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SYSGD", "PFO#", "CAPGD", "CAPFLT#",
+				  "CHGEN#", "BSTEN#", "", "";
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_pins>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&tamper_pins>, <&usb_hub_pins>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MN_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
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
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+/* RS485 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	fsl,dte-mode;
+	status = "okay";
+};
+
+/* 802.15.1 radio */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins &ieee802151_radio_pins>;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	disable-over-current;
+	status  = "okay";
+};
+
+/* WiFi */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	/*
+	 * Use lowest drive strength for all high-speed modes to minimise
+	 * electro-magnetic emissions.
+	 * In this particular design HS-400 still works okay, no extra
+	 * pinctrl for 100mhz and 200mhz are required.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc3_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
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


