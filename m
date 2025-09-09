Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020121.outbound.protection.outlook.com [52.101.69.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3117A316
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430992; cv=fail; b=Ds5l0OkYEpGS5SwNW3VkVrDM0vFj91jULUwYJ/mJN81lW4hnznlRMdla9KKsKRefSnyFpLsSER9T3fA4yoAhOa3ztKSIUT7kmSWCRwXVkBU/9TkcGNIc6Kaj79hYtnK32EIsObWI/LPlCav0vpL/4vBHsQkYSG/h39643UyL1co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430992; c=relaxed/simple;
	bh=FDXX9ajihCGbhTt/H5ryU7Zc+H2G0geAZsmyNglk22A=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=n/31fH94/toi1BM2N5N6v7zHg1EHwI+H0cCIyD5YLoSo6khzY5psx56H3IRYQi21GlUDcl0L31pJEREU26Yd6LnC+rmeOQlDxTn7mIAiADJufHZuSfEbb8TUcVDpSLbB3RbOPUQ7DcR8cEuBXIFS0m/WCZ7MrhtaQy1eDDHF/Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=muVT15zo; arc=fail smtp.client-ip=52.101.69.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="muVT15zo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axqBKxBhW2btO4Sa4GSUBMqywLBhc8ZkWbeJ2YGJM8wrMUT1gBHRyxiyDJTMF350aVz76Qw5St6yW9LU2PitdW910zdp8+0xyELtsKq2EjZygJIu6dMZc6IrL9lkdNhi9qd8i3Rbl9edoQrWmcnpSqRENRHbdZ4MkjCVpDpIxuC9udPKOmoxE1zdDvTc/lB7EsvJOGKfOxUOyK3EjnOaz/cEcaIGvd6cxgBW/rHbE58600/EuJfkIg9caGgDcPytrp5qe2hyG9Mx4qqlp1PZ7eu2/pH1SLVqLKA2+zPsKGvEp+/XgDeNSJ0IrBPSIXvZ/ihak2UHkDsWxWc7/Qbj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Dg+OOGhL1uVf3FgPxaH8qX3UIiNH8CVQ8NiCmtffJQ=;
 b=g++vtEDbCEBxw4ik8nneZIbOlQzzKJA7y8nC5zoynQ+ng7n90if9Vy6+IdHl6SZENTpw2jJPSHmxame60VTd4gxEbgYkrCptUJnqy5nRW8yk8FxszQPnNr0iFDkee59AOcOX0hrh0QVrweLrYEcRHZ/GtS9uc8CkFHoJnF2mDq4l0hlXIVh3pOawUU8wL+GuLMibo8myWw/+MaA0D7+DEjKkYptaYKk32jL1yL+obnEmyxVKNGys3BJrF+Bhu5aOW+ODWG+YYJMTiB9igh59dC+RCHphLFrFprL7bKOuMmbpGb2IxicRC/JZtPILEiZCAsPbStgVHOKa1dy8RNOVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Dg+OOGhL1uVf3FgPxaH8qX3UIiNH8CVQ8NiCmtffJQ=;
 b=muVT15zoV16MIWt4/wp9FvkLGnYR5D2yjbzLzoEjapOmubImKRv0IK1Jp9UCbh7mqvFbOviYBytbuJv2w3mfF8mYLy0bs7YIkc9P35vi9s0NBa6GLx5r6rzzSGwsJp7J2quTOX5my+WHSoA9nNOMBrjqS0D6Z3ELZJoPcQp3c1f769VYuGYRCY9tXiwr4lTDd1/hfUZq+chSAOLEEFZhUvVIXlfFyFP/LyorKALsIrBXIlzKqZkBJlHh7GTUVIVLr+LNBYQchrwR4qxPUlH+VxsSbX5Ur+QN16aI+pin+z3pTFZrJLsghXQ5m1phBvjsJdz4x3X66VFWSUKIhFxrJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Tue, 9 Sep
 2025 15:16:20 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%6]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 15:16:20 +0000
Message-ID: <56e7a430-79dc-4598-8e58-809759cf0711@gocontroll.com>
Date: Tue, 9 Sep 2025 17:16:19 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: mazziesaccount@gmail.com, imx@lists.linux.dev, LW@KARO-electronics.de
From: Maud Spierings <maudspierings@gocontroll.com>
Subject: Strange PMIC behaviour with rohm bd71847 on Ka-Ro tx8m-1610 (imx8mm)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0091.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::32) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3d867d-8db2-47b9-85db-08ddefb3d4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmZuSUF0b0JycjBRWUFyK2Y3bmJCV25UMDJVd0NkRjlrUzhKVUdjWnFmQ2xN?=
 =?utf-8?B?b3VQYWcyY0VVdmUzekdBQS91cy9neEovdkgwbGM3SUJtOEIwRG1DVU9pNUla?=
 =?utf-8?B?QXhaSEJVT2cvbno0K1NiUHV4dEx2YW1IdytScGhpbENFdFQ4SnBVdXNDcnJE?=
 =?utf-8?B?cGR4cnFNSXI3K0dlQUgrOGJ6V0svYWlrcHdvYkhwaHB4Z3ZucjNuZ050WWp1?=
 =?utf-8?B?bWN6RjBERGhpKytUTHVWcWk4dXczNm4vekJrVW5JUGw0cmY5bmNPRkphd0hC?=
 =?utf-8?B?NGxYTzNPQ1gwYjVIR2ErVTVqWUdqWnNJWU43VjdBdFdCdHk4UUJ0aXJBTFY2?=
 =?utf-8?B?eFpkbjYyb1hpQlpJQ3QweXZhU2FTN0NORzFTbVVMOHZibFdDMzNhb2RIZWhE?=
 =?utf-8?B?M3VER0UxNDF1Qmk2YTFwYmRzNExUL3dxL2RMeWd2Vkk4dmVmZ3ZGWmFMTmJF?=
 =?utf-8?B?ZmQvQ2RHWk9rTDVLWE1NSUExM2MwR0ZXb01pRnIvanNybklxZ2F3SXVDZ3JU?=
 =?utf-8?B?SExNL1JkR21ZdTZXS0wwYkoxR1B5RWh4VnkyS3IxSzJGbXpnZW9tc2wxUGJW?=
 =?utf-8?B?dUdWVTRpTVc2TVJzVWEzWk84ZGdBL242R0I3YzVPRjFJTnV3QUxNK0ZMajFN?=
 =?utf-8?B?ZHpGK1FsWUhwVk5BcGVENFNjNExHbjlhdFVHWmdzZ3U0emFHQlN5ZUoydkFa?=
 =?utf-8?B?NTh4QTV1cGtHaE4yRm1pY2M0dkZJeUxCazFJeFhDdlRzem5HeGt4YjRZL3R0?=
 =?utf-8?B?MlFydlVvRDB0ekZFeVk2STBrcUl2dzdhSlkvbWpMT2JESUlpckVOVVBHOS9p?=
 =?utf-8?B?SVMvcUJuUHZvMW9nbnZBTmUyUUlWZFBZUnBnNGExUmY2UzFHV2ZOY2VJZHdm?=
 =?utf-8?B?dllWVSswbXpGcERxTTh4SWpvWC8wMWVMT1dpbUIyVGJZVnlWaWNhM29KUHAx?=
 =?utf-8?B?SzhXY1JSL3ZqQVNoamk1dkRxc3Yxa09jc21SZHhCa0JMLzJxc2Q2TTU2VjJh?=
 =?utf-8?B?NWF5Ky9XTzVxdTBEV0cxZW1HQzhWWUtyRmtqaTNXTmFOK3JLRzJQY0Q0cWY1?=
 =?utf-8?B?ZTNrTStMMHJhWkJ5V1hKemtTRmx2MmV6VmhyMkdWMlpXWFV4T1VYcjBBdmpm?=
 =?utf-8?B?SGYyN2Z0NXIyWFdZWS9qNy85eUFiOEFGOXVBWGRGdFA1QUczNE5kYzR4NzRS?=
 =?utf-8?B?ck4vWExQTVArSFA0Q1d2Z0xDTmp5ZTRjenh1dzRkcEpKaDNGM3U2TFlHUTFx?=
 =?utf-8?B?cTloMHUvZnIrWmFRMXk5aktFNmRJOFFmekFnVWlZbGpDSnVTajJ6blNyQXA2?=
 =?utf-8?B?MnVQUldxZVhMRFRUU05EZHdEeGx4NkxXYVFYN0ZlSzYzVjhudXVZbWh0dlJP?=
 =?utf-8?B?L1orSEZaN1I1OFJMUXFIbjNnNHJ6N1NFQ3dwWmxrV3FCQXhrdmJGTElQd2NI?=
 =?utf-8?B?eSthMjljNHY2cDlPcEljd0JCMHc1bng1WXRpVCtFbkQ2MmhNQ2QrKzNwdmRr?=
 =?utf-8?B?MkJyTHo3MHVGYXVQWWpzdFhxSGl0MHBwcU1KS0dkSy9VekF2Y0c5VFlFRXZR?=
 =?utf-8?B?MTNJUHFYT2UrRm4rSEFJZ2VWMVF3V1hZMGVVWi9wcmlDaWtVdld0bGRiejZE?=
 =?utf-8?B?dVM0Lzl0UjJRZXBsbytXZnlMNmRnOVd2ZjZwUkYwREw0Z0lXbnlnTTI5Q01D?=
 =?utf-8?B?ZTJQTnNmdlM1dVVwYlhWa1o4c3B2K3NVSXgxWmxjMVdaSjc5bDRCZGNIckpW?=
 =?utf-8?B?b1QxWkhveDd2bUoxMCtWR3JrTjdsazRteGVQZGluR3ZsOGVqaVUxOEVBSnRx?=
 =?utf-8?B?S3dVVkNhR1NhdERPd0ptSkFLQm91QVkxZHpQZVFrQnVBbFlUYTgrdHN6V2dJ?=
 =?utf-8?B?UmdRR3JiZFgva0ZoT1ZpNFlWSWNHY1JTTExWVnZvZDNHZk4wdEFnSzRQQlk2?=
 =?utf-8?Q?YG8TekqzU4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T05KUi9ZK2IxVVpPNkFvQ3ZNTnNmYmhXUjFENlYvVWUzYjZ1eXUzdXZxcXNL?=
 =?utf-8?B?dmM2cWxQTkx1S3dXOGdqUDZWVkFTZmVPT1hYbVY5WkxQY3Y5VGlOaHk2MHZm?=
 =?utf-8?B?NHFKR2p3WklUVEZ3R0p5N0E4c2t6UU9jVE1vZi9rS3pOSTVnRElMb2hpMTlM?=
 =?utf-8?B?cU55aHZIT2xodFl6eW5OcU1meVZWMDV3OFJ1UHYrR0p6U21zczZGMWxoQWR6?=
 =?utf-8?B?VEhjQ3ZsMGVjRDZoNWl1L2t0RCtvUkR1TVQyZXBoTmVNaUlNbHY4ang4MFov?=
 =?utf-8?B?bTlhb29obUVBV1RCQUlTMXdWaTMvOEc4WFVFQmlDd1RLN3dvZUxHNzFyWEps?=
 =?utf-8?B?aW5UN2tqSWJrcFhhM1lINUtBWU1SSnZhMldHN3RNY0tLbm02ai80d21MZGpi?=
 =?utf-8?B?bHFycXoydFQvRk91VWJuS0dJVDlNSlNaUVR1T2x6NWd5cWJjcTdiUTdIaEJv?=
 =?utf-8?B?NVVGNldwbUoveWVQVkU1a1BkSEc0Q0h0RUV1dGZVeFdKalpBQTY4VW9rNEpX?=
 =?utf-8?B?RHhKUjRyMEMwZUhlaC83SVRLbFdBOVRMcjJnMmZXVzAvUTl0M1BPbWljNXVV?=
 =?utf-8?B?NVg0V3M2L2FNbTJuVnZheS9YREllRFlLRWF0RC9lMGhRa0lvQjZSd00zc3VY?=
 =?utf-8?B?NWhTZ3BUaTlEUm5hWG5oY0tlVkIveTNyZEJ5K2lQNGl0TmZGblNrajB3NnhH?=
 =?utf-8?B?c210TElYTDJ1N0FXL2dTZnFxZzVNRXFmRVBQKzZUeWxnZ1hBbzg2L3VlSm9X?=
 =?utf-8?B?K0VCMk1yeUh1R2g1MXlQdDhWN1hzTTFlbXFORzJsR25KSjNvclJCR1hLQXBS?=
 =?utf-8?B?VGRUc2xiV0ZWd3NoOEQxeW5VUkRDN1hPSFRxeWdUUFc2R0RWOFFPVzRRa2U3?=
 =?utf-8?B?RVA4NEhXTmlVNTdCbGhabTZHb3NiUmFWdlNqUXJ1TmxlSkRnTU9SR0xKenVv?=
 =?utf-8?B?T2lTaThhSmo3bk5Ed1pxU0RlVlE5dTllZGZ3dmUxdmo2cm1mZlhBcWJIb21J?=
 =?utf-8?B?T2cxdDhhT2g4ckZQbzFLelRJUmJQaGxzY3I3WVEwTkpJT1FOSU9id2h0ZkE4?=
 =?utf-8?B?RjJ0KzA1WUhSalJNYmJWRHlndXovOFJGN3ovYzBwWmJwbnRBdW53QXM0N1Ji?=
 =?utf-8?B?UmtzMWxhWlA4N05CTjdabXdaL2NhT0Z6L3VnVVNxUXBPYkdNMnp2NG9ncUhI?=
 =?utf-8?B?WllaN1dWRlRzenhsUVJwSVBjTW5HT3B2V1E3RUJTVkYvbEM2Zkk5THRLTmoy?=
 =?utf-8?B?OGNramdPK0FNVkMwNXRaMXNFOGdlemRHZGhsb0QrRk1LSllDNkYwVVJ6d2ZJ?=
 =?utf-8?B?RHRaSWt2aHM2K3Z3WTJFcC9ET3orK0xkeEpyOU0yeHlnVWllaE4vNDBOZXRx?=
 =?utf-8?B?Y3ZLZ2xMNjdjL2JHQStlaWNoS2d6eGw3Y1haQXNxalJmK0ZsVWlLK0NyVks0?=
 =?utf-8?B?emRab3Z5ZzU1M3dITnR6Q1pFUWZ6SThEcW9pVm0rNDAyNG9mVmJPZlpkY21I?=
 =?utf-8?B?dnZEcUhQR2pZeGtxMGxjaXNBcUNQbmkxOXNsaGdFbmk2enVXaFlyTVQyMk9G?=
 =?utf-8?B?UEJOQlVMZEFvREJOVkZKdEZ6czRJT2xUK3hQQTRsQ2ZwV0xpa1VjN1N0NEpL?=
 =?utf-8?B?dDM0ZURVeVFMY0E3S2p3SU1oVUxGbnYvZGUwdVNod3RaV3BJbFk2WnJhVVlK?=
 =?utf-8?B?bjUrZFp4d2poaXBSZm9manVQNGhyb2IrMUJaemVDT0MrYWU2cVQ2Q1N0VndO?=
 =?utf-8?B?MXJsS3k4a1UxVTBHWFlQZENCcDZTbjZuN0JCTU1kOS9QdVpNdzMxSzRTYjNO?=
 =?utf-8?B?eXJyYmM2NjBtdCtNNXlqSFhZZkZFRGVIOU1nbHZVYXZ5OGdPZG1VRFFoNlVS?=
 =?utf-8?B?TC9iWmhVbGROSmxBTFdOM1RaYVc2Z1Jibk5LbWdGRDN5bFBESW1FaFplNjRn?=
 =?utf-8?B?eE92RU54TzVBSTMwdUR4dUNuUHZSaEIvU0JkREtYeWRhSCtvVlJONzhiNHZm?=
 =?utf-8?B?WGhXVi8xeDNTdnJtK3BoRjRkd3VGbEMvNW1FcFRuSGttdllvQW91cSszS0Iz?=
 =?utf-8?B?R1hpamg4U29qcGk1N3djQ1o3OUxBRldGUHhpK2prR1Bja1NRUXl5Sis3OWVP?=
 =?utf-8?B?d01PT1VVN29aRDVadmR1am1sSUhlaHl3ZXBRZHJydWNGaFlSR3laamdFSGxh?=
 =?utf-8?B?d0RwOC9vL1FLTjBDRC9TWnBoUXJldERjV3VKeDMzamZsMXhXQ0JSenhEa3F0?=
 =?utf-8?B?di8vSGhja0hwTE1udFYvcm1iRVFnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3d867d-8db2-47b9-85db-08ddefb3d4de
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 15:16:20.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbTYOKlI9JybF++oJZ62tCepQWKMHwdGTTI/wUc8oBBg6Oquhu5WFVlrV+qlSTju6P0w0j62xXIkv2oxQa7m/BsgapLI2i9UQfpXOAuEApc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

I have been having some issues running mainline Linux on this specific 
COM. Specifically with the shutdown/reboot behaviour seemingly being 
inverted.

I have now figured out how to make shutdown actually behave like 
shutdown. It seems like something is setting BD718XX_REG_TRANS_COND1 
(0x20) to 0xcf. The only bit of code I can find that touches this 
register is this:
drivers/regulator/bd718x7-regulator.c bd718xx_probe():
use_snvs = of_property_read_bool(pdev->dev.parent->of_node,
                      "rohm,reset-snvs-powered");

/*
  * Change the next stage from poweroff to be READY instead of SNVS
  * for all reset types because OTP loading at READY will clear SEL
  * bit allowing HW defaults for power rails to be used
  */
if (!use_snvs) {
         err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
                      BD718XX_ON_REQ_POWEROFF_MASK |
                      BD718XX_SWRESET_POWEROFF_MASK |
                      BD718XX_WDOG_POWEROFF_MASK |
                      BD718XX_KEY_L_POWEROFF_MASK,
                      BD718XX_POWOFF_TO_RDY);
         if (err)
                 return dev_err_probe(&pdev->dev, err,
                          "Failed to change reset target\n");

         dev_dbg(&pdev->dev, "Changed all resets from SVNS to READY\n");

}

Even with rohm,reset-snvs-powered set I still end up with 0xcf. I've had 
to add the inverse in an else block to get the desired outcome.

else {
         err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
                      BD718XX_ON_REQ_POWEROFF_MASK |
                      BD718XX_SWRESET_POWEROFF_MASK |
                      BD718XX_WDOG_POWEROFF_MASK |
                      BD718XX_KEY_L_POWEROFF_MASK,
                      BD718XX_POWOFF_TO_SNVS);
         if (err)
                 return dev_err_probe(&pdev->dev, err,
                          "Failed to change reset target\n");

         dev_dbg(&pdev->dev, "Changed all resets from READY to SNVS\n");
}

In uboot I get:

i2c md 0x4b 0x20.1 0x1
0020: c0    .

So something in the kernel is touching this register when it shouldn't.

I am curious if anyone else with this pmic can confirm this.

I used `i2cget -f -y 0 0x4b 0x20` to get the current value.

As a reference my tree is at [1] I'm using the gocontroll_defconfig that 
is present in there and imx8mm-tx8m-1610-moduline-iv-306-d.dtb.
This dts does not have that property set yet, only have that in my local 
tree.

reboot is still shutting down instead of rebooting but I feel like it is 
going to be a similar story.

Kind regards,
Maud

[1]: https://github.com/GOcontroll/linux/tree/gocontroll-6.12.45

