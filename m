Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913E36BCDC
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652197; cv=fail; b=QEK6KZ8y/QeRtpWhALBboSRfYtxEx8XulQ/hn9V0FxbZI1jFH1JVHvsuHG2wcWQOAc5e+zaXsd90J//QEaX2JIh/fS57uriNVuwcFCJbzezRDGtWIj/pt9xcY6H5bpLInYdwO9qp7uZXQGxthePEBONNH9bX4K5zmx6q+zVj190=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652197; c=relaxed/simple;
	bh=vKzHYI5vMbjHA/3rwxZHIg3Fy+jwlFjsmBZEe4LPaK8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ej36QOKk754ZTVzV1EPdQQviD9lxWRvP8KlnFiafsxwvRkKhb0m7QkTkZjbmS0EMLLWJTvDS4xZtp5bampjZ0V3u81C5S82kcyPEl+CeOvT57+nrZjAtILL1iI9fWS9FAKwKmaOwr7AId5ZLVTMNHHBi7ymmS2TOeGNj/Z9PtJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lmb5tCij; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lmb5tCij"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MedymG7HbuX4TzBRWYg0dIJcsv7+9LNOuwVgUovzL0uILL4H8RuPoyTJAGWjf485v1Vjdv/3+edynOyFeIZg0SZlGP5UAEsHiT87NG4BPvMbuSteoGlkaCan1UPMd/kHN6vp6Ypi+Xqcn6fsCuB2j1brwtKo2Uaw1cQtPXv2NriaCum74/TKHGNtKJgEfLE21r8b1RMNZsFSFP60+0TA1SCJhPQBivMon7laizQzmTx8NHYsBfmoIp4yB8Fj0WcIbBy1fK8sIMYpXOUYma8EjUnTNz1L/aLEFauzRTs6V9V85SD37HJd5N2+PeZio3oqrRU2C6vXbrHA12WGG4dUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKzHYI5vMbjHA/3rwxZHIg3Fy+jwlFjsmBZEe4LPaK8=;
 b=zGFDIxGdUKKxlrDo4gxw1l7wTqn9Xv8HH85NgWsq9FkO6s5ImsGaZnuZHpmiHPO9zXqDRfow/+dpqVrRW0U3qlo9L5gejcVCIhK1v2u8VpsMKKvFCi/Cu5WpV7BmmZgI2AyrNBrp6SKHjIi+dR4y3hZ+j2SdabLNBEB79OjCOzfoqvgGa9yAui/GhFed0gESohFTFxT9QeTGZy7oTKllg3yBYq+kUT1wxEXqu/0SPl+2+UiY9gRmv5OV1gB5+M2IpW6Ne63N+4uDyRyOsJ8RYjf5CTkIwKJPMJtQ3WU0CGeGts7dIBhcyyHXUkzMhveeW9sVhf1rALoJc/DteFKBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKzHYI5vMbjHA/3rwxZHIg3Fy+jwlFjsmBZEe4LPaK8=;
 b=Lmb5tCijWtroZL2nM6EH+MNC6F7vft65FUw0E0UrlXe/imsIYhnioJIXIj6xCDAoZN2zYW++VM3WChuzADJk7ZP2NfjdfqiEJ7fIC6nCRozvOXsAqyvHrN1366fZET6UmgsK5N9oT+PHtpiJEh/kgGG9aeFK4asBqlC2EIU0sCMLwR0Ci+XZdRTC6KV1t7O10s3Tm1J85Bna5F26CESYNCgFs3PZZ7pKyBjqstwrimcd8K6zO8wL3DX+RL3deuXw8vOX5QsBDD67+RgafVxKUg8RbaclYlwPiK9itJjAjZcJSpWPiFIto/b1SZCrZZNzbSfYPur9HcaEyMvMMS4y0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB12083.eurprd04.prod.outlook.com (2603:10a6:10:63d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 15:49:54 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 15:49:54 +0000
Message-ID: <0cb344b1-2840-48ea-a36b-24dc8a0f1205@oss.nxp.com>
Date: Mon, 9 Feb 2026 17:52:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] firmware: imx-dsp: Use mbox_ring_doorbell()
 instead of NULL message
To: Douglas Anderson <dianders@chromium.org>, jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260207200128.v2.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB12083:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e9d8cb-d012-4036-1639-08de67f2ddfc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFN1b3NjcmVrZklleHJmeWcrMjFyeGdRd0g2eGoyM0NKdjJMUmhLay9XSFBD?=
 =?utf-8?B?MlYwSmJCODgyZklpcytBVU9xOTJwRTNTTUIxM1NvVWI4YjZJOGQ5Q3prRUZz?=
 =?utf-8?B?SXJ2NW5uTUhtblNmUGJxb0xNWmJaRHh2K0QrTmRVM0MvNXZjZ29uSU1mVnJG?=
 =?utf-8?B?Zkp3SjBsR2RPUEh0aUNMWS9KSHhNU0JPUndMNmdDc1JBOFNJV3NjQ2k4dWxH?=
 =?utf-8?B?eEZkUFVkdDVZQnV4WUpTVjBHbHlST2Y4TUdPVmdwWGtGWmlpKy8vU1dYUlpK?=
 =?utf-8?B?NC9pOHZMeWc3d3dtVEhOME4yWmEzcUZmV21lWDVBVEhJM0FOT2FmcDE2NlJJ?=
 =?utf-8?B?MURkRlVjWjVvRUdEWGZ0bmsyQk1XS0cyeTdJWExWZS9JYTlqOG1UNlVZUUtq?=
 =?utf-8?B?d21KTUVITnVWYUlpWHJCaTdjNmtJYmxMR0ZjVWFodzhiYjJTNC9lNHNFSGNY?=
 =?utf-8?B?T2tkRVAwUENDZmdCZ2UzK0RaVEJyakVpZ0p0dHA4d0FtYmFNK3pXcnNHNTlU?=
 =?utf-8?B?dEJMY1B2QzRHZFlQTXpKWHdFd2h5cUs0RjhXWEt5QmlkWkRJZVBRdEllUE1r?=
 =?utf-8?B?Q25Td201Q1ROS0tNamlvYkJuUk9yVzNRbnJ1anZUQ1NWRUhvb0RqZEQxQkd2?=
 =?utf-8?B?ZFZNY01FTG5OUWlGUTA4NW5ETS9yNW9GMFp1QmErTmtJbGdLbnR5aGdBQ1FB?=
 =?utf-8?B?RENsV2I5RTVXdnNURkF0MnVkcGsvb3Zkeng2ZThwQzM1aml4Qm0wY2VMUDEv?=
 =?utf-8?B?bXhPWHZmUkNXdjh2T2FaWDhtSFNDa05HdmdHOXdjMmNsY3VhbTAwSzFhcEZQ?=
 =?utf-8?B?NUtvMEM0R3FCbEpRQUdTV0ltTXU1dW1LM1p4eFJsclpaZFI4YjNxaDFKMDBt?=
 =?utf-8?B?bktyY1RKL1hkSFZjMWpYbDE5YTkvYXY0N0owT0ZORlRtdEhIalZXVWFNcC9x?=
 =?utf-8?B?U2Y2c3R2TzNuTUpLbWJnSmV4ZkZRb0ZFSWRvQnYyaUx1Q2Z0T1VWWFlvbldO?=
 =?utf-8?B?UE0vNU1SUDRScm5HTmthRWlOb21qOTloMGtYZnFKOHRPQkp5YjNSNkVZekw3?=
 =?utf-8?B?Y0IvNUMvcUh3NlVyNWN6UTBVVC96dWxuTUtnMTlxK2tsVFVZV3RTQXhpVHBZ?=
 =?utf-8?B?ZFpWaWdXL2M4OElZYURTdjA1bm15TGd5QUlNQ2huSmFDVzZlTk00MFgvejB1?=
 =?utf-8?B?MjZZb3FEdEFkek1zTlZnNXhHTU9GMUNRbWtSYWM4NDdjQjlYdHVxVVZQaVhT?=
 =?utf-8?B?dDRFcGJpOXkreXFITVdjYWpIU2dPS3VFSHg3cmJ4M0IzNngxN1A5YmpKOW5P?=
 =?utf-8?B?V2gxcGlGbDQ0VHJoY2ZacXhFNG5QNUVIWFBVT3NqdWNzR3lQMmJsdUt5VGlh?=
 =?utf-8?B?eUxNTHhNOHJ0TFhDOTBGRFIrU1lzQU1GcjAzM2tRV0NNVXU5d0JsdkdVekUz?=
 =?utf-8?B?bHJBSVFnN0ppYS9HMVFQb0xpdU1qZVVGMDFJNXhUYzNyc2tyRmc4a2Z5b09j?=
 =?utf-8?B?Z2lGRnhuZHJJNTdHWkx5WWRnQ1I5OXR1NFZTTENxMDVwanhoVjZUelJMem9r?=
 =?utf-8?B?Mmhvb1prSVdUTHRxRklBYWR5cGM5RUYybmU3RG91blVMSmYyT25qSStWaXYx?=
 =?utf-8?B?U1NUQWswcnh1a0t5ZjZmUXZyZks4WFRMdzFTenR2d3dRdU5mQTlNYU9Ib3ZD?=
 =?utf-8?B?SS80M3JGZ2VrQ1BuSFY5YVN1aitmZ05WOFg1bEpRNGxmc3lrbWVlWkloVENv?=
 =?utf-8?B?T1dEbitqZmdSVGt0OFAwWTY2L2d3VmtWaUxkOUszMjA2eFNpYmxFbkQ5Tm1x?=
 =?utf-8?B?V2lmYWNtWjJzcVo3allCZ3NsRk82WHRJaC94TDRkQnNZNlB2a2UxRDJiVkYy?=
 =?utf-8?B?ckQ2eHhTVzVjWGY5ZS93WWV4R1VPSWwxYkVBZ1NSRE5rY1VCRkRXRi9lakFR?=
 =?utf-8?B?a2FVZVB6em9qMFMrdFZjaC9DRThOR2d2WXhYWkFjcTRSTmh2SEI0WXYzeDdm?=
 =?utf-8?B?NkpXdnFJQTA1cWhLVllIV2svU1NOSHNqWFA4cFlQN2NvMktZQmJlSFMvd1cz?=
 =?utf-8?B?ZWNoSU5FUlRpbGZTbmJka1FnUEYyR3kwbWJPYStnbkdoR0FZTEhVb1lFdW5x?=
 =?utf-8?Q?qS4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0N5YXJ5ODJMeStMSXBCUXo0YTBiMEh2c0k4VnJXMDBHSUxOSlcyMEtkbEpW?=
 =?utf-8?B?ZVdCdUE0cWl5SHhubFI3L2ZYdkVwcmhONngzK0NxM3dpakgwbXgzamtIQjIz?=
 =?utf-8?B?ZHdkKzFiRG1sV3Q0ekVFTEtnMzRsUWhKaExxL2hCOVBhOWtPTG9hbGJiQVVN?=
 =?utf-8?B?WENMT2tLQmc0S1lCWjUreHIyaWp4c29RWGphVkZBQUtKUXRwWjlpUE4xRUJL?=
 =?utf-8?B?WXdpam9zRi9BTEVUSEVwN1IxVUZ4VE9ieTUxaXUvS2dLRUVCbk0wUFd6Zklq?=
 =?utf-8?B?WGF3enZmdG9jWTFuakduSG1NdmhJWVUzVnJSRHZ0ZGp1UmJlMEVDdUlUaVdT?=
 =?utf-8?B?VDhCMytPQWZpbEtCRFZxdXRIMWtyaiszVW9QWW9YRk9DTy93OXR3VWhxR09S?=
 =?utf-8?B?bjBPcjJLZG5JS0lHZzgyakNxK1F3U0krbGxJR0ZvdmxXajg4bzBBZDRoNkEz?=
 =?utf-8?B?clpqR1NqWU01UmttQ2ttQ0xTcWxnMTRHbnkrclZTbEVxSmpiRDhpR2x1Zi9a?=
 =?utf-8?B?NU5iOHpJcWdOd01LbVZTWkFPRWJIVThVMXRVWE40VkhqdHo0VkVlTmthditw?=
 =?utf-8?B?Sjh0dHBPYWJVeTI2WGpCbEM4VkJMa0syYko0eEYrMjV5Yi9hMnNaWnNublBs?=
 =?utf-8?B?MkhETnlxUUpDdkhXWElCZGF4Q1d4K3QwdndWcHNYNUZZK2FOWXozMnFjbjA0?=
 =?utf-8?B?L2wrNDBVU2hBejAwYkNBbml6a0ZZOTN6NFpUTnN3blNVNkU3WWV3b25WL1Vq?=
 =?utf-8?B?T253bnp1VVU3SkJtMVpWekxzNUgyT25wMUVabmtSNzZWY3g0NThtcEZlSzlK?=
 =?utf-8?B?bTBaRzM1ZmhUbmxhMDZVY0dxejNGTC9hYU0zaG9Lb210NmZyNytsNEErenhu?=
 =?utf-8?B?cVE1QVBnbklIdUlyellnYVlkQ2xDa3B2TkU3Z2ZRNUQyaG8yNGdRcTJxT0JZ?=
 =?utf-8?B?UktaTU1zN2F2MXpzQjFHWXo0Q0NZWmxPSjllSlBjOTkwSkR4WXlEUkdiVEI3?=
 =?utf-8?B?SWFOQ0QzMWszY0orS3dEYndQRGVxQUhxcTN4MzNjWTZvNXJPODhvekovcWZa?=
 =?utf-8?B?a2ovZ29TM293dm9NbUhPQkZlSjdFditQWVJCcXVaZDh6MmhwUFhSVVpzWC83?=
 =?utf-8?B?U253WjFHb0dxLzE2K3ZVR0hYTC9LdTdRdndHdVBMMjlETE1iR05ZVEErR0FY?=
 =?utf-8?B?YXEvNDlxTGl5d1FyUHB1QlN0NzVSYzdHRHIzRlhhV05aMThGSnN0V3BqVzUr?=
 =?utf-8?B?R29xb3lRVHVuT29jMGoxcmNBWFFscHhHb211NWFtT2pWWGJSTU9uWWZqSUta?=
 =?utf-8?B?WGJtbHBia1RKTGJkQjhpendTWGxBcE0rL0kvVU94ZDloMUZrVGhwZjVpK3pP?=
 =?utf-8?B?ZmpYR3p3R05qNHYyYi8vWSs5S0tsS3FNaWF1TjFCOEpQU282U3RWL3NKdjVq?=
 =?utf-8?B?VDlGdTZjaDFraSt1VnVIZjJtaWsxdHI3aU5qMkYxRUxISXNzMC95eC9PU0Zp?=
 =?utf-8?B?U0NackZEVEdnQ1BLbnpkckRpNjRuS0lDWjhZcWF0Um83ZmFwcmVaTWlDbjVO?=
 =?utf-8?B?b0ZqWWdmUWV6TUlGeTBzYmVkMkxVZmRQK3kxVXF4SkVJTjFIczFlUGx4dGQ1?=
 =?utf-8?B?a3dwdlpkdmIzZ2JPOWhXVDhPL3pLdzIrVFdNblM0djVkaFBHQzJ3NVhocWJS?=
 =?utf-8?B?VHI1dVBVUzB3RmgxRlB5c3RsNFlsckVMVWpNZ3hYQnFEbDZuakZCSWZ3aGR1?=
 =?utf-8?B?bFA4bXZyMGFqc0JSN3pYazJRTnVIRlhJZzlCZ09pcW80UGpmcFdhT2pPNVoy?=
 =?utf-8?B?OGEzWUVRb1dLNnVXMUxjRy9rbFY1WXRhSlR5Y2U3UCsrWXkyY2lwZUc5V1Jt?=
 =?utf-8?B?N1cxT0hseE9RNitaSWxYMW9CKzEyNW5QSytHTWhtNUtUT0YwOHZTR2VnVGZ3?=
 =?utf-8?B?aXk4MjljMW5QbHZrT1ppY00rdHRIYkxISGsrN0RnbWQvNG1sem9MUldBL3Ix?=
 =?utf-8?B?a2M4Q1o5KzBSdEpmQ29yeit6cmlYRFkxVklaemNJZHFiemVWYzFkbEk5b3FH?=
 =?utf-8?B?UVBRcWdLcHl3MEtDSWF0T1h5eFV0SVFjZlRacmVOR2FZdFhwZ2NVZ0s4Y29Z?=
 =?utf-8?B?RzJUSmYwZUdqMUNXRll3eXRRakc2L29CSWJZMmkvZnF5Tlhwcis4cVR5NWRZ?=
 =?utf-8?B?MHg4NzVvNXJiNVNSNXpoNlM3eUI4VnF4VDdMajRMcWlvRlFnMVJTc3R6NHhK?=
 =?utf-8?B?MHQxaDRMTWV6Tml5aVRLdzdLREFoNHBmTGpsZGZNb2tDdS9RcjdxcWU5aEFr?=
 =?utf-8?B?anZ4NmovWXFsVm9jQWllVXhqaENyZThlUndzU3AyMzV2UXB3OUFRdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e9d8cb-d012-4036-1639-08de67f2ddfc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:49:53.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/PId8+113CXsmvd8MvdrG6wHKhJVAvtTZmscRDf6rYd36ZdUNYsSf835O1AY1UGnuaMQ5j469976wm6VC1PWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12083

On 2/8/26 06:01, Douglas Anderson wrote:
> [You don't often get email from dianders@chromium.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().
>
> This client only ever sent NULL messages, so the transition is
> straightforward.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

