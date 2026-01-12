Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075126056E
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214578; cv=fail; b=TCwLC6Y8Jbyb08JM0az61mRamqBXHUHQDRJb+w0nGw0jiI+xcmGGx4PIUaB1sCslJwUwSZgNLmpnMvkbbsIyIxhGERGb8N/mf3kSQJ0ZLG0v0j1ssQuVRGhqhEjxTCshqsu7pQVfFLTxOZYbKtiqzydUcQ4xSPqQzwuu+tusV4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214578; c=relaxed/simple;
	bh=QPtPduO/9e2ZVaZHTBBcZvcJkR5t2byeZmppCsXVBRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JRYAy1FzGjyCe5zsR7XyYWd3w1J4W/JFC6Yl8qrKRF3HzUO2KfalBPT7hBAgLbYN+3dvp2qmwD78iL3L4K9mNbzZiQfXeIOa2sh8dxhiVYhZv/pKZSDfAfxQ6JU8UClIbRp0Nje1LRXsrO/xBt0eWeP4ilWYY82pSEBtkedbCD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dzfoV7XY; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dzfoV7XY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw4e84bNdJgmrjdi4FX4yv3mu4KJFYocSc53pRl8L/eaVyfYnzpk+4pajfpaDObMpNL+1r8dUwL9IOri2X2P0Ep7vamz9HsAGBCrKjXFJVFO1PObxUwnhGhreondBR3J3GoBB/Xk+gY+YCNrNKzGODBtfmCCvuzaCLVYPSEggHt7ywq3DZzsENo+OEFXdyxQ7kemMaiQKn8QuEqoyNKHyMT0xEQYRa+tYL9OEc0xsX0CbiHnuuZaStaISlZ9D4IHwZIiV9U6Upj5MN0BFynQU+jjtk+QKuvo86+3W3KeTqO6/5UWGIVP/jMadfuRhtp64pi6kMd8WkZPKOsOZKd2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUlrW1FLvOsuftk6hH5ROn3Qkh1zAwi7HiU8uiehMbM=;
 b=tP+h+F81d2pjzGvaooiqigfCEgyfPH+Kuo6TKG0YdPJmJx4PdpdPtJiz8mq7MlNqTYdkPtADSnB0DKFypvTEsvZ3/ikc6uwehW+3nQ3zDSKI2hzeR8QTm3jheuVqq/qzQXSW4ukGY1QvuJbTwX72uPPnagkIgFXVS0sm/37dr2lTFnJpNlVuFyEj1PF8zbBcQHZzWcJ74bhGKExT48xa4O6GhzKcFyyGND2ccmqvcW8biMJcFFvopMFsEw8GJsFklusjfyjliSiuPxSgCxurYa19p1KdaXYAa4UpsoAK29BUiQff/0eQx+Lw8FISdBGYyBiNsex/ABogS2EerDFFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUlrW1FLvOsuftk6hH5ROn3Qkh1zAwi7HiU8uiehMbM=;
 b=dzfoV7XY4JSG94glpNWO1orL0379baXgwqVMlY1Ii3CfcPj5hETaQ2cv02zYC5Pic1lzXIVDDRmAufbslynZoyUlUgBP0lwNsxd1FGy2DXXMHN2XQdl1/SSeqhHwGcRxsX6VIIEzYBm9tMRdBl0n5YafDC1qvL2qfnxFxz5ZVI4BvKTZKTHot4m1PE8br4039tzZn6PkqRUG8xvppzsC/DCzUZlfgIRppdNq7fh7LJMRLKcK/dgAoGMY0nM0FSN0GDszDxulOSF4Q6IfIn/+z9H+NFfCbTbcJcviL9WvGUFRsJOvDcobPEfd8TYG0zzYI/J22/gbGfZrCT1qwOLtLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AMDPR04MB11556.eurprd04.prod.outlook.com (2603:10a6:20b:71f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:42:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 10:42:54 +0000
Date: Mon, 12 Jan 2026 18:35:39 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <6j2yhzqt6x3k55vrqjrol2k2qrhqmobvwjedkujyet4loyajxa@vy55aajfuvxk>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
 <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
 <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
 <0b61c962-9aa1-4275-a40a-220f6d7f1210@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b61c962-9aa1-4275-a40a-220f6d7f1210@lunn.ch>
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AMDPR04MB11556:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b848bd-5871-4f51-ab14-08de51c75759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnpLTXJpTFJQSGRLTlMvNzZJRFU3R2ZqTmRucFhtcDVyMUVyckVKUlpvQXpF?=
 =?utf-8?B?VWRjY0licktPUS95QUFkZHhzeEhyWjN5US8zUE5NRDF5SFZEQ0ZFYnhyZmhL?=
 =?utf-8?B?dnNEM1RETFd2WFIzMGdMTmVSOVg4UXJ3T3B1U2Q3UXNYUnl1REZReVc4bVRM?=
 =?utf-8?B?TlFuc0xTd2Z5SUh5WVhla2RzcnNWc2RtZGdTZzRmdTZsMlNiWFRHUENvVHBI?=
 =?utf-8?B?RW16MU02eStSejExMEplOUIzZjdGU0NWa0tmckZsWjgrSXlLTWlsSWo5cXlz?=
 =?utf-8?B?cE5Tc0hTUGpxaEdZcWtqOFNDVTNVUW5jSDlZdUh6NW9QM3hlU2tBMHljSndF?=
 =?utf-8?B?MDRocXh2RnpodGJ5ajV2MjB3YkZYNVo5UDVXQmFaUzhqQlpteEdlQm8vUHJx?=
 =?utf-8?B?ejIxdjl4VWRNNVpkaDJ2cGVoalJTb0U4Zm14WGsxRE12ZysvcGlFZjhtcDg2?=
 =?utf-8?B?RU5VN2tHY3JQNUM5Tnpqb01jbHdUcDVUMzJrR1JFNjh6TFFjMEZUNDR5Y0tR?=
 =?utf-8?B?Q0lIYkpaajhaSlRrVTRFemxnTHhvbG80K0JCZFgrY2NlUVdGNTdiSHNYS3Vl?=
 =?utf-8?B?VU85UnE4VVdTdlpHek52bjlKNGl4aVpvSS9CaTRVd2xWTkFpTk9zd1ovaFRB?=
 =?utf-8?B?OG5xR3MwaVQ3c3NFQUE2SkU5d0RJSG5WSElJa25hNGxjc3Z6RS80bVJ2UXpv?=
 =?utf-8?B?Z042em1VbUJQMjBLckZDT3JaZ0svRk9jcG4xQkhqZ2tsczdOUmlseGlPRnRx?=
 =?utf-8?B?VWlhWFpCaEpKc3poMEM5a0JJS21LY0VuSm4xdHdTVklIOU5oVDRNeUxBcTN6?=
 =?utf-8?B?ajIxaEJyV3hjbHZuaVZXbmlLa2FHNm84N3hxQ3ROakllSDFvNXk1Y0dGVjZM?=
 =?utf-8?B?a1pnR0FLenpDZDFEZkFQL2F2YWZldEZ1dThOaUpSVU5aMldBTWNhbWhER1Zo?=
 =?utf-8?B?L2YyNG9ya2Q1TFh1VGliNmFhZ1JkZ1dLZk1iV2ltWjFsaTFWNFpWNWRPNkMy?=
 =?utf-8?B?bURxb0hvYUZtR1UzQ0dFVWhVcVZ6SWljSzVnWEJEWDlPL2lLVXZDK2Q3SGE5?=
 =?utf-8?B?aHQ4RGVCZU5WNS92OFgvaDBOT3dnMlRDbWw3aHZHSmNqNkFoSHB5cW02VStC?=
 =?utf-8?B?SWY5T3picGp2RmdCODBMWms0NENZSmxNcGVXNGFSTW5vRGlleXA2WHVoajlu?=
 =?utf-8?B?QWJyeGRSRStuTmMyajBIc3YrM21ZMzIyK09RSCtMOERhSkNZNGs4ZE9vSW5T?=
 =?utf-8?B?YTQ4K3A1WlViVGZIb2JjdjVIVHREVVJGYk5ERnRWOHlQZWxxZnhtM3BEcDZN?=
 =?utf-8?B?M2tEbjFVWnJ5WXFBczlvc3doVVFaV0xVbDZXY09mV2pTUjVla1F4cWJVS3VN?=
 =?utf-8?B?eEk3VG9VTXdWTGhJcVlPdjMyTGF3Y2c3dDZmVUtZQURvZ3QzL3kxVE5nZ2xS?=
 =?utf-8?B?Zm9QdklTYkhKMFhibVUrN3ZFQ05BMDZkSHF1WkMxQTZuMTRTaVNaYTY5QlY3?=
 =?utf-8?B?OTZpU2lhdXhmQ3NSYU9KZFVOdHNLZzdWbmhXRmZSWnBtQ3EvbU9YQlY5ZWIz?=
 =?utf-8?B?bFdaQ0NZSHhjZTNmT2lDb0ZFcGpNeGNYUkZNNk02L2pTRFVSRGtrQldqbFVD?=
 =?utf-8?B?b2ZId1JkUjVwM1V1RHFiVnczMUE3QW0rWCtuZ0F1QnpDaEx4NVExNmJSalRw?=
 =?utf-8?B?b2gvaCtvb3ZhU2NiU0hUMEJhZ0VnZjVOQ1JBWEhvZTgzMDBpYUFDaVM1Q2Yy?=
 =?utf-8?B?UkJNd2pMT01QYkhUdnNEN1N2Y21lYlBYazFhU2w1NjRoOWR2OGNaS1BPRU1Y?=
 =?utf-8?B?YjNIZTd0MjAzblhBSkJjZ2V6RXJZelIzQmwzNnpUK0xoTlFuUnJqYTFYTXRr?=
 =?utf-8?B?Z21JZm41VklrUU5Jb0dnOURmcWM0R21kMmdBSkIvclRHa3VPY2RWTnAzV1E4?=
 =?utf-8?B?eFhkcTlNREVTQ0JocHhwQnJvcmxUTHFLNzBrVkh6WS9XT0RLN29VRlZwZkxu?=
 =?utf-8?B?Wlo2UFBFY2Vxem1SN1MzdDc0azlEY2F5aC9EN2lPcDg5V1FkMUF1aEZTOFhP?=
 =?utf-8?Q?Fp3ebU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3ByZloyNVVJbGdqTDYwbmJZcXh2NTk2dkxqR0gxRUlQdUs5M2E0WkFScFRJ?=
 =?utf-8?B?d1MrSkt1MWVuRmlxdWROSFBTcG1ZcWhkc05PZ01DcHk5MnJ2T3VHcHBpaVpP?=
 =?utf-8?B?bWNtRXNoMVF2MXovTmRMMkVtUjZFVlB4UDl2alhlOUFBZGFCQnYzUWh4RmtQ?=
 =?utf-8?B?VXpxNDFPWFlTVmRZMStMSFlkMDN2dnB0VUVscmpOZkRJa3FnQTI0TTJ1QmpG?=
 =?utf-8?B?RVBpeUtiZlllNnh1NThJNi9kYW5Jc0EvdU1BejArTENxUGRncnBiWGI1WFY1?=
 =?utf-8?B?WHd0MTNqRjdQTjd6TUhkUTlIcVBNUm01dG91RElEWU8xbnhzNnVzeFBEOXFp?=
 =?utf-8?B?eTByaG04QUhnNUpLQm1PaWJKZnJZS1NhK2RMQ0NZSHZvMHZpQk5XNld3b3Zk?=
 =?utf-8?B?bzV4QzZ2aXNtUDRKQ1NYaWRIaGliVVhaK2hjZ0xMTUg1MndIY1FtYXhsL1hn?=
 =?utf-8?B?L0djQ3phNWNDLy95VG1KLzBDYVFuN0VqWlVyRWpEY2YrVTAvQmtUa0R1aStr?=
 =?utf-8?B?ZmpxcDNvbVp2YklZdXhmWDNiakZCWDhGR25CeWpzT0dONmdMUWE3d3dqRm9v?=
 =?utf-8?B?SnVCM0ZoMUFDd3hKcnZQbytnekVFZHZjanNGMktVc3lhV3Z5YjNPdjVBUjFj?=
 =?utf-8?B?ZVdhTTNEeWRXQUNpQjRDaDVuTkFGOEhRK0hsTEpZdktZT0d6UXIrM3AxL2hP?=
 =?utf-8?B?WUtkZUxEcWZYWlFZSlJubXZ3OHpxVGZWNXBmak5jMTNGeUxGTEVUY2JHSE9B?=
 =?utf-8?B?RktaNmk1Qkdpc0lNVnFCdEFBV0wvUFdFTXBjOGZMaDZVQTRZZVIzeWY0SThK?=
 =?utf-8?B?NnNOcXhPOXMzZGVBSUZSaTZMcGVMLzd0S1VuNWkvRVk3WjU2M3ZReitjNEJI?=
 =?utf-8?B?cEdtVU5GMEIyN2tPYnVyMHMyUWZHdmVQazhxWC9pYWFEa0RyOGk3cFFtOW9p?=
 =?utf-8?B?M1ZmZFNQb1Zib2RKL3B5OTNiWThmcjNDRytMaVUxVnN0VjFFLzY1ZjQyVkVr?=
 =?utf-8?B?UzZqT0toUVBDeE5zanhrV1M4TVQyVkJiVjVaMkJ1Z2t4ak0xenJyMnVQMGVM?=
 =?utf-8?B?SWpkN3lxWHhzdEtFZGJsMVJDeU04OUswSEUxVTBnMFdQdmxoUlRNWlhiSXhr?=
 =?utf-8?B?VjQ1eXppMGRKUHJ1c2xBcjU1SHZJWWp3WVZ2elJINnhyeWdiekNJcnhweDIv?=
 =?utf-8?B?QjZnK0dGKzIrY0xOMGpxbndaSkY0VGlqc2F1aTl0QzUzMzF6Unp0THpyNkFp?=
 =?utf-8?B?dlFNQW4rN3RXSC9kS3Urcm4zbXVqMmhnNkxDSkwycGpjaWRJU09OZTBGWDVZ?=
 =?utf-8?B?S1A0a3NWYWRYR3NURytZRlRDMHZaZWE4Q2pseUZNL0dRSkxkS3dFa0JaeWph?=
 =?utf-8?B?MjZraVdEclN4L2h1MFc5VXdaeWhxTDhGUzdSdmZNOHlTalR1dERwSnRIZFk5?=
 =?utf-8?B?cmxzN210MzNDYm5SSU9XMmYyYk9JM3JqRVBTMEhoL1U3NXEzdUdZVkJvaHZO?=
 =?utf-8?B?c204RTdUVTJxbUQrOERWZEI2N0JaTmhFV0cza2U2UzJzVFBZZXlqQzhiT1Bj?=
 =?utf-8?B?SGlUQUFsR29nMXVNM1p4MHd2bC8ycHhhMUFNZ09ER2YxQm9VZUpCYlZ4bmIz?=
 =?utf-8?B?MnRrVUVvNnVSQUg5NVBveDYvb1k4MGF6c2FQWW1yekI3d016ZFYzNFFSRTN3?=
 =?utf-8?B?cTZKMXlHOWpTY0V3aUVkREc3QVp4MDUrYm5Pb2VFckhwQml2THdaVXpMWnVr?=
 =?utf-8?B?WjlvV1Z0RTN6ZW5uYitlK2hqd1ViT3E5cjZmSjYxRzNETlduWUtRNWtpT0xY?=
 =?utf-8?B?TGs0Q0w2V0pibC9VbHRmajdoelJKOFJrUHhFWWUrZFpCM0RBRElhTEZndHQ3?=
 =?utf-8?B?QXIwVTNtRnhBakgwRVRaOGgvVzJoUWd2dWJ2QXV3N1BuZnJ0RTN0U2hCaTdm?=
 =?utf-8?B?Q0UyZlNUMmdVS202Qk1ZbGQzdnByd013dnBhbkUzYWdtUDlJRG9Oek5xaURo?=
 =?utf-8?B?YWFhWHpxQzBaZXdQNStlUHJzQjVheXRKWWpWNVM4Y3d5ZDZ4SEJ6aXlPWUdT?=
 =?utf-8?B?NS9BaUcrL25nTkhWZTJ4Ymo5eWx4SmdxSVgraGZveXpxRXJnS25samlFY3oz?=
 =?utf-8?B?WGY2a29GZis4aVRTWHh1UmNVb2k3cUV2T0ZYQzYxWWs0MEZvT3NvSnRFMDh1?=
 =?utf-8?B?SXViTmxtTFFmQWpUbG0zZEVHbzRPU3J3djZETTVYRGlwOTRLQWlWa2tqMUVS?=
 =?utf-8?B?VVNNQmJxMDd4WUFWbDJHMkpDK0MwemduWk1jQjErWVBxbnZxZDQyMlVRa2hv?=
 =?utf-8?B?UjI0Vi90cGRsTVNOMWhmUExtTjN1K3g4VnBFVzNZdFJXeEJMdTZWUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b848bd-5871-4f51-ab14-08de51c75759
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:42:54.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKVYQSkI8MqErduXy83y4uCitbezvMRs6z7nOlQQrrTBykSTP+zAlXJvRPsj+Y9gpSEplyZilvGxMEiUBJzUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11556

On Thu, Jan 08, 2026 at 03:47:17PM +0100, Andrew Lunn wrote:
> On Thu, Jan 08, 2026 at 04:22:24PM +0800, Xu Yang wrote:
> > On Wed, Dec 24, 2025 at 02:51:11PM +0100, Andrew Lunn wrote:
> > > On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> > > > The CR port is a simple 16-bit data/address parallel port that is
> > > > provided for on-chip access to the control registers inside the
> > > > USB 3.0 femtoPHY. While access to these registers is not required
> > > > for normal PHY operation, this interface enables you to access
> > > > some of the PHY’s diagnostic features during normal operation or
> > > > to override some basic PHY control signals.
> > > > 
> > > > 3 debugfs files are created to read and write control registers,
> > > > all use hexadecimal format:
> > > > ctrl_reg_base: the register offset to write, or the start offset
> > > >                to read.
> > > > ctrl_reg_count: how many continuous registers to be read.
> > > > ctrl_reg_value: read to show the continuous registers value from
> > > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > > >                 + ctrl_reg_count - 1, one line for one register.
> > > >                 when write, override the register at ctrl_reg_base,
> > > >                 one time can only change one 16bits register.
> > > 
> > > Are the registers openly documented somewhere? Could you include a
> > > link in the commit message.
> > 
> > We integrate a SNPS PHY in Soc. So the registers are documented
> > in SNPS doc. Anyway, I can add a link for reference.
> 
> Humm, so the registers are defined by a Synopsys databook?
> 
> Shouldn't this patch be split into two? The access mechanism to the
> registers is specific to the imx8mq. But the registers themselves
> should be part of the generic SNPS PHY driver which should be shared
> by all devices using this licensed IP?

This patch mainly contain the access mechanism on i.MX Soc, so:
 - imx8mq_phy_ctrl_reg_addr()
 - imx8mq_phy_ctrl_reg_read()
 - imx8mq_phy_ctrl_reg_write()

and debugfs function to show them:
 - ctrl_reg_value_show()
 - ctrl_reg_value_write()

Do you mean split above into 2 patches? Put the first part into
phy-fsl-imx8mq-usb.c and the second part into a SNPS generic driver?

If so, do you know which generic driver should I use? If no such
driver, can I put them in phy-fsl-imx8mq-usb.c at the beginning?

Thanks,
Xu Yang
