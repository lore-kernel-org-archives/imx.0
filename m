Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023133.outbound.protection.outlook.com [52.101.83.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47D310774
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.133
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617315; cv=fail; b=PgYanTec6djbD3x6Kj/16DZ4VufKAl7UmRKLpWZTcLjlPl1iHCDkNN2zfc18/ydZb5ZyateF3jeEG8l372z9Eu7XdNpm9tuHJYlhq/O4ejKBBoNf8rdx0lcJuMftds3ybFkugT3yTQX2IbUtVtKCHOO+/InESAeTwjul1Cw+9uo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617315; c=relaxed/simple;
	bh=rkvMfsuiC3furBu2vlrRBHEZV47NzhTXuvBVEFJjbw8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dVYoMI5Y2ppZa/Pgg4/Vgx2DN3ARZqNR4zttHMgPxiX6On3UJEjc66MVdZpZRP4DJ4mX4IDUxtfiZEUAmWcsTISVfErZ1PtGmnFiVFNTKbAwHQDyFta8YNeu91FG6fJkxTFDqzaO5zUj78PerV1cDBbSDHpDJqmT2Rx6edlCRVM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=JsK3/dTl; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=JsK3/dTl; arc=fail smtp.client-ip=52.101.83.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JsK3/dTl";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JsK3/dTl"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kkpA4CPigMvrbQF+sBVxcJ7E4vg+E5I45fzHbxsimsuzyqf8VTuRz6ymeu6SfnBiZP4jBGNcs/3haKjJZSUi3zV6d14cjKsdWuhQ4+3peN4rgpBfohjI3JFT42o95ZDW4il/Z1BvHFfeLIpRaUQ9qKH8CTswKgtOEMEcNwO9gE+hhiBAlGBXPdNRf8uHVCkSjK+XF+la1srqU0a49POkJP2FLlvDxilkYH/4RHMtfnkQoVaIYAkcRN/6LLwVBZkDkF9KVjj0vWFkZckPD/Th0d26U8QxmAjv4sik7QqxQRWtU1w0d7xyj2dju6H5Qn+nsDvCG3hEWpYGyh7dhTh3Aw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yWR6TsYiSVATAsHw0iwC5pvo+49B955Jqn2NVpQGcQ=;
 b=Z2L4Rm7BtasuNunHQZXtIy4fztHB5+Ntj/gm4dFselsjdgmKUSt/90dhyJiD/9SOf4WarTi3HOcYttYKDraKBAlQd+k5YaN/gtSYwQ5bdW+LRyNenB3cLNLoZrPmYj9zb5YCv98QOHg04nPphnp8YxORCWB6F3oNUUZ2HWw4HEWQYY+gA4D5UEuj61e9EGbi8yS0/8dCG5ioSOOzwl5hCIcU8hzkaYnFMQknGaVcvqGTbz5PovknqpYWLldA14GKNFsToWYXOzTCC79S/O2Xvhrh3tMK3s6GukWBgx+Lybz9K9vPcZsGFH9nD6cWJVNeqH+Chb3YIIMtWcaarkxhkQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yWR6TsYiSVATAsHw0iwC5pvo+49B955Jqn2NVpQGcQ=;
 b=JsK3/dTlQEat5s6MQcxRVTi9T/v4oRH9h0hMEYZaBy7sBnzie6BIG0L/IAOEuclUZt0UT7oHQeZ73e49Jhd/j7kL6c+5c8YFrDQ0la5RWrX962OIwR1fm/wAKynxhn+o99/yaAVMCzmWiTiaoNwj2xz+T7i4pCYxHUP7JH3lhps=
Received: from AS4P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::9)
 by VI0PR04MB10664.eurprd04.prod.outlook.com (2603:10a6:800:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:21:48 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::4) by AS4P191CA0011.outlook.office365.com
 (2603:10a6:20b:5d5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 16:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:21:48 +0000
Received: from emails-4404942-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-155.eu-west-1.compute.internal [10.20.5.155])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EA634806C0;
	Wed, 28 Jan 2026 16:21:47 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617307; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4yWR6TsYiSVATAsHw0iwC5pvo+49B955Jqn2NVpQGcQ=;
 b=TntMapOn5zdCY57q4m+WB3f7FutZhUCV7qia5ixBXgHjPYPV2vT0EEE/UHa7ha0QqZ+j0
 hnqTAXgnox1r1kH6VHJlUsF71lqfrCxybZN1kDjRvCiyQyyKXgZJsTW3//RmTRlp52Mvg3B
 xJzXj8MTojDtWX8sXXC2zUYtlni19Fc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617307;
 b=Kikirw4FgNzGUVdmJlxp7qanNt+xxNhFvyCBPUcqV1OXl285WUyTCGjua2oVqH+zHPnQV
 VT/7luntzKRMDJUPtYQLn7ep339RFHhclAX216IhEPiVHIz7wZaAg6If3axYakFyqw0HvmF
 /LbmEuqoD6yE5ASMAvy8FeM3eBVefSw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1md91URggxWa6xdNMyd9YKyNGHdadRhPcQnNgGAx4rpTAbEbV1wWh2aCkEcCXMUcmusooAIwSAFYEbdrkX8Z5bQMXL5MxOizD9c3yU2G/+52QUjbo6QpTlLtqhsL5602d6n3kP3ln19RRTNsnPis2BJm/VvZRqotESi3JOxvMf3Hs2+TGlzJcc9OLJIlVO8UjGRkvJvfbzEVqnO4aCe9OTax8bv4OdvDh0HlMFWel74WeEdn3Id+hiDTzKTvPQP0TNYjuPmPAAf5yik+2XbEAiKMshG11U3Mzeg8XsSmAaBx8RP42HmCK/l7wbj2m2fHqftwnJZyqk2uEx4RCTnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yWR6TsYiSVATAsHw0iwC5pvo+49B955Jqn2NVpQGcQ=;
 b=spdgIH6mtUSfdoaPPynlVX1nfL6VmRVD81W+egULsmx/S5XPAENLRV3T4F5X2dkmU9McPF+GT9f/3d1MvfPHQvtQr43XCNW13ThNP16L/7G64T0ax6vFdB37Dldp57Rr4LKduQqvJxd12kA3mAlrgjK4sGiku8WmB0QfSFBUzkuvJKfG0OsrCcW7gr96DqUWjgx6WJNMnW9BfbV0A+8wbfg3rPz5wqGD5MydrHt3sY7pMVKl7LcLWD32BeRChdODqB0/JI4XsDVLAM2d9zwgxuKdKbMLNaQGVr1UaRz0pAGitn6d2X9FWE/4vAD2Tl1W1oXYH/3yto7UHsjhgzbomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yWR6TsYiSVATAsHw0iwC5pvo+49B955Jqn2NVpQGcQ=;
 b=JsK3/dTlQEat5s6MQcxRVTi9T/v4oRH9h0hMEYZaBy7sBnzie6BIG0L/IAOEuclUZt0UT7oHQeZ73e49Jhd/j7kL6c+5c8YFrDQ0la5RWrX962OIwR1fm/wAKynxhn+o99/yaAVMCzmWiTiaoNwj2xz+T7i4pCYxHUP7JH3lhps=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:21:40 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:31 +0200
Subject: [PATCH v8 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-7-9646a3025cf4@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB7522:EE_|AM2PEPF0001C714:EE_|VI0PR04MB10664:EE_
X-MS-Office365-Filtering-Correlation-Id: e52085df-c144-46e7-99d3-08de5e895632
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eWZBSHFGanNZYTZsMzk4RjhkbGF4Si9nWHp5STliOFByTjBWbmlCSnVHNlc4?=
 =?utf-8?B?UHVPQWRjK2NyVHQvdW9ocHU0Tis3T2xTdVM1UDlhQXdCWkthak81YmkweSs2?=
 =?utf-8?B?dHJtWHp4ZHFUWmRieHgzdUtWRGZBZHFlem9kODg2aEs1d2lKK05SbkVyWFE5?=
 =?utf-8?B?anV5UW1YNi9xdkZOWGZWQlFmeGdOM3pCTVNiSlpXMDh5dHBnTEowdW4zVjg2?=
 =?utf-8?B?Rkg5Um1OZnBBRDVwUFY3QnR2SmZUWXFxOFltRzU2QWNWRkg1c0kxNE4zMUky?=
 =?utf-8?B?bFRzblB1eG5LN0RxVEhpb25CSEFXSXB4cFpxMG1oZUJlYkxxSVlhNmlkV0Za?=
 =?utf-8?B?K2doZUIwTCtjY0w0NHo2NUpCYnFrWmVtNmpScXJBY1l5OXc0c05ETTVwRjdn?=
 =?utf-8?B?NVNRQnhieFpNT3I4LzVCYVFZU2VMbUhqa2hIcEtURG5IREdDNzQwMC9IN1Rv?=
 =?utf-8?B?Qis1cCtYWlpGQ0hxUE9BVUVMTHBqajM0S1JSMWJPV3Z6MWhNZkVsT1dkNXQv?=
 =?utf-8?B?U0JsNm12UXVpMytLOXIvNy92SldCSDBFZklkb2d0RXdRdUVFTFNBd2orcHgz?=
 =?utf-8?B?N2c0eEM4VjNrRTVQZUZzelNXeS9CSEpFL3pCdUNPaTVxNnFhUTBjMURKUWMx?=
 =?utf-8?B?SVgzbDNYMzBZSk1FSWZTMG9SV3BWUG9QamZLenFUajQ2SEdUTzFwZ1YyZHlD?=
 =?utf-8?B?bndUVlVaS0pDbS9zamNzTmhmMjhEZG5mMENvaU9WSVYrVFR1S1JUTjdtNmda?=
 =?utf-8?B?QXFmL3J5ZlQyRDV4Y2c1OWFxblNJSVBFWGZpQU1mT0RILzd1ajBSOEZhR3Iw?=
 =?utf-8?B?UnRrMTdCSDN3WW1GYVM5SVQzc3NXZ3p2OXJjS1hDMk4xbFJuYWpoNHYrKzdn?=
 =?utf-8?B?M1o4WGk5YWozMmdwZzUvWXkzcnIyeWhkbW54a3VZUTFJR2psRDNGMVJpTVVK?=
 =?utf-8?B?RDljMWs5VEllaElOYm4zL3IxZkd5N1ExWU1Zb1JzWEZwd0JzVTdnd1lQdCtz?=
 =?utf-8?B?R0RYZktNR3J2MGJReGV6dnBTZGFMUHI0VXRQOCs1VWdSNzZmYndva1ZXaC9N?=
 =?utf-8?B?T0lZSW5UL213bWtTcTNueHRLdmQydm5NWHMrNGd2Qm4rR0V0VDU5NmNBeW5N?=
 =?utf-8?B?d1hLUFBjeE51ZDVaK0UvVklGeDhZNWl6MkFIc3Fmem5TS1BlODQzRHBXbVRi?=
 =?utf-8?B?VUZTVnNUbTIvUFVER0U5YVo3S2FtQXI4NjFDN3ViVXdHNmtuMEcwY2tSbVhC?=
 =?utf-8?B?ME1vZi9wNHp3a2o3N2JMNE0rb0NxTkhObzJ4YXlXaDcwcmg3M1k4WkhLUHFm?=
 =?utf-8?B?ZnhHQjZMWjlWUmR6WVV2UlR1WEpRbzliZWhkcVVkbHpXRHlhUlNySlNDdWFU?=
 =?utf-8?B?bDgvZVpLZG9acGlIMEJocy9jTDkyMTZ0dGFkbTBNR0U3bXI0N0JCeHZEajBS?=
 =?utf-8?B?NzVNMWpXT3lqdzBRU0hGOWVXTWx0bnhRc2VOcStLajArOWxTZjhMdTFsRk9S?=
 =?utf-8?B?UmNRcUZJNSt0aHp0MTlCSit2RE5qZ2ZncWxtNS9pTEVxcm8ySElzMXdHL1BQ?=
 =?utf-8?B?MWFYV0xkVENlQ2NLcXV2RDRHWGRpTEhGaFh1ZTFZL0ZHbExEcDR0WHd5LzAr?=
 =?utf-8?B?V3FuZUJQM1hmWG4vMitwQlptWU5HTURxK0hxa1VVLy85RmZmNWtweTlRb0VH?=
 =?utf-8?B?NzJIQmxEQzJmcnBnOFZ2blh1djA5YTFpVmNqRDRDSzU5UFVkS3p5VUtFM251?=
 =?utf-8?B?M3pQM0J1UG9PSGhINXZZQ3djMW8wb2JYY0pMbVdkeTB4WExxUC9ZM2RXanBa?=
 =?utf-8?B?NUtmaTNDdCtaQmJzRUd3NGlXcTl6dDYzeW8wZGNaQWYvUk53b0F6SXRNU2xH?=
 =?utf-8?B?T29UdHd1NTNZNFpvS2ZOelpHNE5mTDdvU3BGTTRGNHYrbTVqZUtYZ0IrWlVZ?=
 =?utf-8?B?ckZyTmRSc2t4UUNiTlVGam5Rclh6TllaQytpZVBrcWpLY1JMVEZ0TlhyaE5L?=
 =?utf-8?B?T0xmTWVtMklrZk9WbXcvM0o3ZDFkTk5lQ2E1akFpOC95WW4veDFWQy9qaFh1?=
 =?utf-8?B?ZHg2VDhhcHYvTlZHVW9ybnAvUmgvL0xleERaUmJMT0t5NnlYZkRSZEdUSFMz?=
 =?utf-8?B?c3VpR2VSZGpWTGo0eVlWS2oxa21uUEwyanVaWTR5cFZpbEJpdXJhSVpCNEFK?=
 =?utf-8?Q?jnb9CpVdHKdYiDFb0p+Dph8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 99f62d845fb142629a66cb3643706acb:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2f449b0-7de2-4f76-bd7b-08de5e89511a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|14060799003|35042699022|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFI5clk3MFNzTGVsakp2Q3FOTGUwem00OENrUHBIUitoclJWeTR3cVVQcUJy?=
 =?utf-8?B?OWRrT0ZJTGJXOWRXVUtIc2w4MkUrVlUxTDFIV2hiamFIeDZmVkNVdGZWNjFv?=
 =?utf-8?B?eGFSdmRjVFFndzNkcnhnaGFscWVFblR5SktzdllLYzRLdXZNQnU4aDhXUklz?=
 =?utf-8?B?RkdHM1pQTXdXOGVZOGZVN2FMbVpJS25TSmI2UkdTMndSSXUvWitsQWh5WWhU?=
 =?utf-8?B?cWRPczU2cDVKb2gyTjRxVHpGZHh4a2ZnWkZtaTJGeWZIcDNUNDhjMGJLRkpH?=
 =?utf-8?B?QTdZbWtuZnM3NW43WmhxS3JreVZBTjJlS2hrZVpCWnorNEw4ajZJK0VVaTln?=
 =?utf-8?B?eGsyaXkvZHVuN2wxdEVaRlAyNkx5L0IzTVd4dEVUK0hVQmZsdHoydVJ5cHFV?=
 =?utf-8?B?SnNscEJCSTdLMjJBeG53STFmbDlDY0xDcUJpaTFENUgwRUgwcUxsV3d2Wmc0?=
 =?utf-8?B?OWg5NVZwK3RrQmpVZmJ2UmJndFQxQllDYWE0TGd1MUs2UnoxR2JybEZjWjRO?=
 =?utf-8?B?ckUwUUVBMGtkcUdJTmdhY1JHVkNpSEgxVWo0MUlYcktkbHpJQklZeEVnb0x5?=
 =?utf-8?B?NlpKTGxBWlNXQ3BLd1dPTmcxbTNZeUp0STQyc1ZRdVcyTEZZSkR6QTVjbWUz?=
 =?utf-8?B?MEVDRVdFSFdNU1B6bjlFb1RGQ0s3a2J2d0w2SWtPNkYyWHRHOWswTXNjWWpo?=
 =?utf-8?B?aHovWlVEditkQmJlazRjWTk1eWFydDRjVUluL0doYWhvL2NiejZpMEVSYmhI?=
 =?utf-8?B?bmVBK1NheEU5c1lxaDhQcWpuT21mNGVLYWg3TDVQWDNKeU4vQkpKK0RSM29L?=
 =?utf-8?B?T3ZhNGR4d05FR3BFSVJTVTBjOXJPK01Ld3ZVVnlpMHQ5OFkwOWVlVVNNN0NQ?=
 =?utf-8?B?NDNwK1RkY0VUdzBGakxHbStRd0lvYll2M01TR3ZkRmtTeXZQeXRGcDYwWGRh?=
 =?utf-8?B?eHBydUJib2FidnRpMUxHSXBkbG0vSVJ1cCtWekhQeDVFVEVPYmIzTzlqN29W?=
 =?utf-8?B?bVpVQ2JQOENKb2xHcUV5Ry9mM3RqeENKbXoxandyYnBnVmk1U2hDcGc1NTJv?=
 =?utf-8?B?ekk2ZFBRMGlYelVtaFRjY3I4K2U5enN2NnAzUjI2TzB5VFhGMHhqQXc1bjhp?=
 =?utf-8?B?YTJVUkdmYmw4bmMwSEhNZENleXBEbE4vY0NyL0xCU0ZBMGl5aG9hZXlyVEFX?=
 =?utf-8?B?SEhtMjdiQ2ZZWW15ZGlGUjJOeDMwNXNEQzk0N3NFbUdoUWVuQm1hYWEyR3BN?=
 =?utf-8?B?OCtBYlhJbkQ3TEhTZEpmRkd0d0ZsUXo0V3M4RWxGUjEyM0JYbkhueW4zZ3RV?=
 =?utf-8?B?WHZhYkVSaEpZVUZaNXhTNFI3V2VjVWg3NDdOOWM4S2E1V0lVNmZYMjY0eVEw?=
 =?utf-8?B?SEJ5c0dTOFpRWGZHaG1mNEc3OEdVaytOTlF4bmRHZXh3ZVRGNWJad2F1NTk0?=
 =?utf-8?B?dnVOMnJmYTFCbkdNSVJ5c1QxaEJFV1p1azJjc2h6YjEvQlN1SE5yNVFScDRY?=
 =?utf-8?B?QWJrS241alVkYUVhT0t0THdmMXVoRVhvdDI5K0lUdklsakdtMjlxMS9WTm1T?=
 =?utf-8?B?R1Z1SnduTjZYMDMrQ2RmNDExS0FCWEIwY2dmK3FaRUQrNis5Q1dpYU4wNlUw?=
 =?utf-8?B?U0M3a2dldDdnWVF1ajF4dlo2em55S0pRRmVNTmtNRDR5REUzM2hCb3VqNDd0?=
 =?utf-8?B?dGhwY05MZzIzSXAxUUxJV3JBWkc1eElOU3A2WklkQUk1dWVScWpObmt2ZzdB?=
 =?utf-8?B?RlF0NGZKekJDQ0twbXBwdUw2R3dic3ErOFFzcXoybkNoVWo1NitWR1dQWVly?=
 =?utf-8?B?WmpXaFVPN0VCNkRvNUtFR0VoUFB3M3lHT1kySkFYZTVueUtnRXcvSzgyUHFo?=
 =?utf-8?B?dkg4TXlIbnlpcDl4Ry8xSlBiQjBMKzZPY2w2RllXdE1WdEdlSnY3TzhzbXRk?=
 =?utf-8?B?NjdOS1A4NEdRWkJIdzNyN2JXcXFCdVBMWFJCc05TMUFwSzRpbFY5WmpTNFNY?=
 =?utf-8?B?YlNqTTliY21BSDNOY1U2dFF2VmFadm5VTndmTHpnYzcwM094Wmo0ODZGbHlS?=
 =?utf-8?B?ZzczM1plOUw4UVRYMmdEVUk5cGtIRkozclFzZnJMYzQ5eXI1c2x4ZExXTlJG?=
 =?utf-8?B?bUx3YWk3OTM5d1pkVjB6cTJicjV1d1JJT1UrWmUyaEN4bGpFcm9YK1c5WEhP?=
 =?utf-8?B?OStkSW9wSmdwSWhlaEpCQXp4RGN4SWxRK2RpemV2dU5ycDhRMGF4VEtNMEJ4?=
 =?utf-8?B?V2wzZThLWnBqNEgvL3pqaTVtcVlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:21:48.1854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52085df-c144-46e7-99d3-08de5e895632
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10664

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
index 36d3bc783a88..e33bbfd9bb42 100644
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
index 000000000000..6e8f603ab6f0
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
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x140
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


