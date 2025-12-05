Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023106.outbound.protection.outlook.com [40.107.159.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167433446CC
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958989; cv=fail; b=AZNa2LN2kepWCKl2X+B4aHf7t3fqAbd1MWgX99epeFH55sNbMaqkYf8T5D9eewTMCOfLr0kQSHqKgIoRcsrg+/lSeKskc8PAez8Bt5VJcpLex1fhw41EpQEn9jr/ruk6HjilIqFNquyIg3cvYItKApWHYxcpNCUhsOwiwS/Z/zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958989; c=relaxed/simple;
	bh=oOZ+tZxdHlug05cfXFFTo7PUtUXlTzYmLhhbgJJefUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kfr3CgE2YrXzfqNu4lsyhRUjuy39/nAt3nnf6/u30jcV//Jck+UTLFnH4d8/xVj52Gix8Jwba79yAAuXimkyMpLvMldx/g/A+1mxsXkSGwOMsQKTM+b1dLlT8CAzodiJ+TbZZTMWOMWUjKPPCTPilMNKIuNqaRrB7lSCyv0JnnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=b+adSKxn; arc=fail smtp.client-ip=40.107.159.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="b+adSKxn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hteo3i4oRcjoVDFRIzyZPdOI02jTKj39w2GSBwv7VLXWtsla8Dy07vsM5ouf68mrJ5zTGWBLGuiT60trxnawyotONQVNu3KwGLZCh1P8MvLO35KJXzbMGhW0Q34ppg0AYOHTPqI471+0ryC5OI8iDEVGvVHsoqyvgwXQKd0X3k3ZMgq2SdaXXa/M0XJBOjj4+APU9fvI2mC4IAU7JEbx5+s3xPmpK9IiMiUxcX4KKA7qrnVPg127fyqk4RmFr2snf9HFnNuds1abDoSxE0ZXKOtogII8gH+RMoSuG2shTFlhBpiUvfee1XGKz2nCy6okaH4/Pt8hC6k26nKNWjon6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhkgCTMzBxmAwXkFWcfaSkx6FnLuRUiApvX1aTpl7EM=;
 b=WfiEffVrlj3jmLSP6VGpb9fvk2+p90rUy7PN2asTD94VsoNl+DHOMhyLJrr463YFAsW1f2QMz5an5k0bOokajWavAq2+x0XRJ9zBI+15zFQ9qNREIm8LE3mJh2+OgtHnk4k3RDDt1LrBeQQekhjBdjfJGNj54J6WOeoC9Y511tDX/jR/N32A3e03WN+y1cWQ3psRn/SPHrNoGAjJMC0wRkL+Zg9qZL9NPhZgtimE+vM416j9h0gZwz6mf3uMCARbZmB1hCh51ecOpcMU7atXpN2HNGdpW83YpP5HmP1EOoDLoPJDKft7tm87T3HLL/A3ttRLzf2HYJJrx+oyHxAyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhkgCTMzBxmAwXkFWcfaSkx6FnLuRUiApvX1aTpl7EM=;
 b=b+adSKxn11/AB8Gt0zd23rEj+AZGopjJPY1SofnBeuoi0PSq0/rgb4OvONYrmNgiASJmnR47bj+2yj50u3FuIGdFw67PvnKUz9pxxCQLDFib7d5pEs8jJByxlOSSIZIJYsoLulCG/ooZ/Rt5M7/Ot6sSWYB/wrUZIxAiu1rjKpu2hcFbZ4MMqZ7Um4bkQFvm1PSmCtnaC+b7vtmVuay065MC2GJtExhsxcFhImJlUE4gcDC/WtCj477oIOXhWJtoY09/zyr9c/nPfG2w3ugG8VcIljI8BPCkJJ0PrAplMO7pwILfXSmeff4IXc0COLls3fgvDQ66nY5Fp7X8M+BQgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:23:02 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:23:02 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/4] arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch controller
Date: Fri,  5 Dec 2025 19:22:55 +0100
Message-ID: <20251205182258.50397-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>
References: <20251205182258.50397-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::13) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 9738cfe5-f838-4d50-64d3-08de342b53c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkxJTXFyU2ppMHVYamQwOGhSNjVUbUtWMmNmcGFZRlNpYmJWMHlTb3NhNjN6?=
 =?utf-8?B?T2xSQ1l4WTZKanU2U1F5OHVSY2JGWkVXcjZHRGZkMmJyZ24wcnlVc0dLYnFI?=
 =?utf-8?B?dmx4Sk8xeHZJU2hJRi9zYjBid0dpc0RQWFpXdXRyMFFkYkpXTldOR2lPTFZm?=
 =?utf-8?B?SHJYckYybFh5MUU1VGJqSHp2TWdqRU9mbWhNd0FOaHVmSEdjV3l1SVdYS1Vo?=
 =?utf-8?B?SmpYekRhbW5uV09XazZRZFh1UzJveU9MNjBtYzBpTlpDMDJGMnhmSlNVelh0?=
 =?utf-8?B?UEh5UGJBS01yU0lnaUFYZkpUZ2plN0NDYlFSZTJ2MkFqeFEydXhyOXd1NTgy?=
 =?utf-8?B?RHVuNGF0MHIrOGdsRXR0UGk4cm43bysxeXhTcitZWnErTGV2blJ5bUJ3cEQ1?=
 =?utf-8?B?Zm84bW5qYlNzcW1uODdMNXlWUU52WmhVbjBpK1R3ZlZTemdXZ1c0VmJOd0pN?=
 =?utf-8?B?VFpSMWFTTDI5MkpueXFRcDk3b0U5SDA5TWJZTlBWU0RncE9MWEhDalhybW8r?=
 =?utf-8?B?TTdSRTMvR2pHUnROd2pHdjdkMnQwTnc0bXd1MkFnY08xeWpkSnVobXNxYjhD?=
 =?utf-8?B?dVgzMlk0eU5vdVNpVUs5ZWtmS0VnWDJYMk94bmN6MGhYVVJuUm0vZkJMak5n?=
 =?utf-8?B?K1dRYzBZQ3pQUktwdmY3a2pBNnhOMmNjMXROdGVvWVNCV0h6VHJ4RmpISGNZ?=
 =?utf-8?B?RkdLTHNNVTY1NFlJMlhJSlpqNEs4d0V4eUcvdnlrMVRRMFRBYnJtNVBNZFdi?=
 =?utf-8?B?eDJwRG9DcmM5Q3kwYlpISWlmSk9zSFYwMTRQV3VaQWpiZFNuN0FySDArVTZo?=
 =?utf-8?B?N0podUlGMUpESHlQcUNnSzdzNWlwN2tPc25rdGN0eGdhdlFsZDlzOG5PWjFR?=
 =?utf-8?B?eUZRVUh5dmM1WjhjaG1yQ0ZOWXJBMC9wbEtZcEx6Q0JoamRRcGJ3eEdZMktn?=
 =?utf-8?B?V3M4WUxpYVQrNjBLWm1oMVJWcEpreUhwa2Y0N2tNb01CeDROVjBhcUlmWW9B?=
 =?utf-8?B?OG1tK3NmOWZiWUxvUENxcnJrRlFvQ2RuSlpzbStFMHJtYjc0blFaSGcyTGQ2?=
 =?utf-8?B?YVdta0lSemxFUU1lQ2F4VWRSOWRVRTZjTXZRMktmRWhSK0xzR1Zta3NSR0Mr?=
 =?utf-8?B?Qm1Hb05jbU04VDh3dU5qNUd2QWk1NnlHVTA0T1hnZEU1M2FpbTA3SGNuWXg2?=
 =?utf-8?B?Tm90T1JVOVg5SExzTnlmV0FOYURLZFE0bFJxTmlRYlV6Ym1mblJnYzhBRGts?=
 =?utf-8?B?WjZTeVhNM0Z2bitDZGIvWmRSbnNNSC9VRk9CSHNvTlVFVzdRZjNSRWN1OTZM?=
 =?utf-8?B?MzU0bFR6YkhEU0thSVQxb2JQbTh1TkNlaitNUFZnc2Z6WFlzVEQrNFhveFF4?=
 =?utf-8?B?dlVYcFhMeUJFeWh6ajBrMy9xbE94TFZLM0lVMFNwUGVsNmNyRzhLZ2pqQ2hK?=
 =?utf-8?B?TjlwcnZpTEZLSDg0RVJTWlp5YURaeVVzdnNldHF0bzB0WGU5VEVWbFZSMWdY?=
 =?utf-8?B?RTNVeFdrTUxBcVRKUTNhZ3BVcjNzcXJFT3E5REZrUEI0dkVVbGJYM2xwb3Nn?=
 =?utf-8?B?WnczelRpWGNpQi9CR1AybW1IdXNZVjg4TTlEaWpqZzBLVm41emRaQ1NMZitX?=
 =?utf-8?B?VzMxUEh6SzhRQVlmSVgvZmFCdmoxaDlyQ2NzaFhuVnFlTVpnVGFaUzQ0dHhn?=
 =?utf-8?B?UkVuWFZlOFJLdFpZL29xdHNNdEJBbnNXWStuTlhQRG1OREZCek5WemE5RmtO?=
 =?utf-8?B?YWFvZ2o4akxGZVFOb3Z4bUFhUTNRVlJRZGZ1VVVxUzVFb3VqYjBNTGQwSWRX?=
 =?utf-8?B?WlJTWXlvaDJuZHNPTzVEeHUvVWtZcE90Vk90bW5LV3J3OVcwbzRFQ2NGdFVH?=
 =?utf-8?B?L2lJNStZSGpocVZTaFluOFdMSFVrNUJtNkhuNWxBcWx5NkxCdjVHbnc4Ylp2?=
 =?utf-8?Q?b8JBg3bTlZ80c5XGHb2N/o1A/XFNDm+i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZIU3pnZmFHd0pFUEVDVUdFQnFQK1NmZytuNzBnd3J0Y2RORVVncVZEUi9W?=
 =?utf-8?B?M2N1WUVVM3VFQy96QXJxSVVqaFRIRkcybkFoaTNJUTJycy9pM0pYdFNQK01T?=
 =?utf-8?B?ZUNDL0xlYlJ5Y3NQQ21mSWpGNXFhOEtNMGVHM2h1Q3dkYlA2WkRWckxvbTN2?=
 =?utf-8?B?Z2FGUHJzZzNjZ21nUEVzajJMUTBTRTBVdDRSSFh4aXVCVS9ZRGhUUkpzWktK?=
 =?utf-8?B?emVkUTM5UmtBMTFHdC9uQ1RFa2hGcW0xOHNSVXEyWVJoeEN1ZzhrbFBCL09t?=
 =?utf-8?B?QTlvdllYTUtJZWJPQmJCeWFCSEt1WjNuOXNZMDNIa2VMUElFSXFCTlFZbGR3?=
 =?utf-8?B?eEpUVmJiOExWZHd6UTJuZVlERVhJdnZ0UitGWXdtL0ZIbzlWR2Y2RGo5cDF5?=
 =?utf-8?B?bFAwaHBIUkQzOUUrY25kbWdOeE5vTmhKcHpCY0JaUDBGY2R5anREM0o0aTBs?=
 =?utf-8?B?d2R0Y2NxRGxzdVhpRytGU3h6YTkzdmo4UXZQZVlFV3ZmUGtWeUtqZDgyS0ZD?=
 =?utf-8?B?UHFHZkR4K21SUmhrZ0lRYTdRSU4rVFh6dFc2UGdLZWZ0M294dFc4MElTbStr?=
 =?utf-8?B?RUxteDhROGVCcDdoOFNrTHFXRGJuTGhhVElkNjhIM0dnS0ZhQzdlK2J4S2ly?=
 =?utf-8?B?alE2YWd3ekJUallOcVgvY0MxMDNQUjFiaVhjdlQrSTVvVGZqTXc5UkpxS2dN?=
 =?utf-8?B?c0xiU1FsKzVMamtRTmFKbzBQMmFmSk1MQUVFZ1FndExESkNTc0hkSWtJTGVD?=
 =?utf-8?B?L016VlpxN0MwTGFraFBSTEU1c0lyTnk5RzU5ZHlpOTRodUt2RFAxQTMrMzdh?=
 =?utf-8?B?ZDc3bXBNZGlwL2R4bmZJbkV2SFMyVGtXZFdldU0xZ0I1NTVxbnFvOFp0aVZH?=
 =?utf-8?B?RWJ6Zk0rTWRXa2x1NjBHc25DdFluZ2x0TGlTNkZjNm5pWlpRdUxGM1JaSnhl?=
 =?utf-8?B?K1RwK0JMNC8xbnl3Y2xOcmpyU1B3ZGova0dubStOSFptNXhEODNpY2R3ZGow?=
 =?utf-8?B?Y2hqczFoMkR6R1lhK2YrSUpLMllUTWJQVFBia2dqTndDNFJHWDl3SVpiSzJk?=
 =?utf-8?B?Nm9LYXhvK3Q3dk9rS3V0MGR2amRUMnNPRUkxNUs2UnBVdENhSmdkT2tXOXA2?=
 =?utf-8?B?WGRqNUh5MUVMVmsyS2ZXQmVMN0pEUEZSQXowSmJESHFhTXZIVUlsQ044Umti?=
 =?utf-8?B?L2ZaUm9Ud3E1VnEyWXY0NzdnT3NvR2sxaTk4cWgzcjV5QmdxWXkyMXV3akgx?=
 =?utf-8?B?Znp3UG1YdDhpbXR6VVI4MWJKMHczZWtBZE0wZDZvVWhLNVpLenAxRXZFblpC?=
 =?utf-8?B?dXY2UU9XU21tdlZRQm41K1g5UVlVTG0wNjBGdFRyTXU2UkF5OFB5UTlmODJW?=
 =?utf-8?B?NHNMazVOS2xCZlZvNU9JRVA0eWZaZExFTmZRTGVzZG5LUU5qcFJRWStYU1dj?=
 =?utf-8?B?eUkzeGFYN0JOb2Z2THBjc09WaGdFUUw1R0FZemZBNUJBQkZ6aUJEODlpUjI0?=
 =?utf-8?B?ckdvMUkwNG1lZ3N1a1U5enZvenZkT1dQd0dDeTJMaFVHMXZ0M1Vob2FFaHJ4?=
 =?utf-8?B?RUFZT3RtUzlCYTlvU0xqZElYL3JPUEpjSGNpcFJSeitCcGI1OGhRdnZoclNm?=
 =?utf-8?B?dzYxRi91dDdjZGtEa0pFcE5pSTNLQUFqUEtSZE5VUm1mcDc0UlRiajNxYWM5?=
 =?utf-8?B?RFBjOW5jTVoxeEFpL3NWOUhIek9FZTh1VmtsTGEvbEwzL0trdTBUZlRCMGFF?=
 =?utf-8?B?SVd0cERZLzB6a0ZNMXUxMlVYRjF0Ym9tamZEVUg0Qmd0K1RRWC9mRVA1Q2VH?=
 =?utf-8?B?N3RqQWJidjRzTEhhL1hxaE9SdWJKY2ZvcExOUXV0ZU9ZNjJCaURFQzNadjFO?=
 =?utf-8?B?Tkp5L2wwakl3RGtkUHJ6bDUzUmNpU1ljdXB3aUJXMVBIM0RVYWZXby9uR1NN?=
 =?utf-8?B?RkY2eTAranoxc0hnRTBkYXY1aTVMT29kc0JzUUI4aGtic3dOWXpObzBzRVA3?=
 =?utf-8?B?SXBQZDZVY1N1emh1OFdaZSs0dXArWm4rT2g2bkxwWGhXYXA5WURTUEVhckwx?=
 =?utf-8?B?OGhnTVNmekZEY29UY25MeS9XcFdyYTNPMFpQeUFMRlNNSVVSaE5odDdSMnBs?=
 =?utf-8?B?S2xTRmxMeURzZEpyL2dCK2NwMHByQ3A0UjlpckxYYStwVk5sZFFkNDJnVkln?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9738cfe5-f838-4d50-64d3-08de342b53c2
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:23:02.7505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeUxwk7T5BWT5nC8oFg5b4cFFndV1f/2Eq6BJ/UHaLRJcGVIUJwrlOSi+2gKJzDIlI+sDQjIx2G8mKFCwThIcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

The Symphony carrier board exposes a capacitive touch interface through an
FFC/FPC connector. This interface is wired to an FT5x06 touch controller
on the I2C bus when using Variscite’s 7-inch capacitive touch display.

This patch adds the FT5x06 device node to describe the actual hardware
connection and enables touch functionality on the Symphony board

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 00bdd3b91fdc..39bfbd0428a9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,21 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	/* DS1337 RTC module */
 	rtc@68 {
 		compatible = "dallas,ds1337";
@@ -272,6 +287,12 @@ &wdog3 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO25__GPIO2_IO25                  0x31e
+		>;
+	};
+
 	pinctrl_fec: fecgrp {
 		fsl,pins = <
 			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
-- 
2.47.3

