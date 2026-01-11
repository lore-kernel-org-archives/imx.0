Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0623382E0
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135277; cv=fail; b=bwWLr5g+MUPiP8dOZ0enudnU3ovYDXanAw93g/RoAX7T7uzUuU3+u7Y3SQpRVwb9XKu2F/ZmZhv67xR9MP6iYvMNZCpvt0EBFNbOIPpKZnp97ptIQOl2RZ0tbYxblnhTa8E12CYRESfTORlhD2ht08vGhqySgm0+ZNdUCrA+Zlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135277; c=relaxed/simple;
	bh=cM8nbMhZN3QGSjfEy5eEhDtZfArxX5UJ1WPdOr9AelM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VnOfUP/e4X8aIt/gn+HLdx6WLhLaSmhqb+E5iuJXFFahaaglCbVBVQi3wGSy697XFg28HCEHeQ3u9OUDhPJ53kJX7+RWxGm4agkj1vaJ6fXZLfz5db+gZYy0t1gFLmFWZQiK/Zle7zPtyKpDxC8HDsVSAaFDImpwjyXPB0PKGKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FmQbi1kr; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FmQbi1kr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qugQZeZYl6yjnJDgzA8cpMupP2ViV6R1EmB5ErRUv3u9aYHadm+jdCwP3JCktjXr9Mih2kDOpMnwMboXw9yokt3OTRcw/1MSIECUWCHjxcpnxLFYdZJtSd8qNjMZnRsd8SkVuOahiSb5Uu9RmLLD2vdj8Em1QYM4sWF1zX5DbQWqJZixalGKHdTXov55FxhNmztcnjJlkS0NSXpBrvqPmzwPzecslkeSR2oa59tqt/bjrlBaGeRWT2+EsKrHUJPyE2vCQgo2BurXORmijaWbCKZLiAplEtDoABjM/GFW8MoHiMPdmrAmTdAmYFS2OjnTc5fb4ELaknpRsVe5sPULAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbi0M5rCMvo2ijaENvSmMkTnwTjf3GvNFHx8BcmfM0Q=;
 b=ByuqKArOttlyuG7lpd6hZsQavCL7JDHKm4Gm9EbrayJafAQ/W4Z77MitV6qwdhRKeEIyJTtQt8VfMjcYFApkSb3EnLBseilw3iHYKvrMcXNuYJIdePlpPKsLg0FU7Kpt/+F1nVbymc2rfhJ4KivSJ9U+t0DCfo/L3V0Dj4APX5ngcoT/FcdpguNxI9vXP5j3lVt8nfQOr5pGLsUUMP96fid/R+4rA74djd9hExfTzNjds9HD+3uC4FPRBcY8BCMT6eZuEAcSOwnDfB8H5bAt4qCu3Wx7oBg6wCvymLIp/FZ5+Bs+enO2z3njMHZxvEd6Ql3QUMQLcYVvgA6SQ3GSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbi0M5rCMvo2ijaENvSmMkTnwTjf3GvNFHx8BcmfM0Q=;
 b=FmQbi1krWQ+iHPaEOOCS8S4M5RDzMfmSLOesqtgMgaCnIfAdpqDqJ8Xn+P0U+10WunNPRkCNY6gGONToY3gZCGyFc5vbz+aPoEED0ibukRpzGIVg0IENvXteD5Krl9eWGm1driBiWmQ+yd+kdSw09eQheOkJYsKiuaits5zJIXCjm5Ln5Fp0TdS5sR6xE+EOXN5EDRyrhiI1KBiS0U8wDGDWrE/kKk/bPBCUlH2f4xT7fb3bQECC4iPq1AD7AKSzJk8bEwHde1ox0woAlEjHjSeJ/neJygwHo4VZGFtfX3K94zzqgV12PiyJmeSdaSAcX9Za4L5iLAjDgSABX3hR8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:41:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:41:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:12 +0800
Subject: [PATCH v2 06/10] arm64: dts: imx952-evk: Enable USB[1,2]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-6-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f7fc7c-e619-43d2-5f3b-08de510eae6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2dsM2VVaHpBRW9MbzFJT2FNdkEwREdHdEU1cDAyMDExNmRJdk1LYlM5cWJx?=
 =?utf-8?B?QXArY0NZdExVYWZTT25yL2ZHV1hlaEcvZnpEb3F4ckVKUmpTeWhwQkU3N1M0?=
 =?utf-8?B?Rnl6cTdjT0NURFZkOGlwQlpZN013cnd4a3Q5S1NIekptZjZycjBPeVlOYmJ0?=
 =?utf-8?B?OE8xY0tKY0JHRWJvd1BQZHBwQWdHWWF4WEtVZkRVTTlqQk9mMkFaVUp4N1do?=
 =?utf-8?B?Tm55RW5HZHE1S21tdVlZamg4UDJld0xRRVZlTW5YOU9VbndXeCtlTEhraFdR?=
 =?utf-8?B?NlJwcDJ3N2pvNVpKUGwvTjRvSWVCM1lCMGl0NHZVektiZHRtc0YyMHBYT0VK?=
 =?utf-8?B?cEFBRWVRekFwVjd2OFlGQU9ubERjbkRQUVE1S1hxNnBVYzN0NVVGMU1kMHoy?=
 =?utf-8?B?dVMrWlZFYi84U05oWFRLSnh1dU5jVnNzbnA0UWdHRTVTUm4wTDlJcm9oZ245?=
 =?utf-8?B?YW9iWVhaWEdiUUpFaXArUWk5QndPeTJNL3RUYUQrcjNzdFNHTTd5aTQvN20y?=
 =?utf-8?B?UEFsRS82Vy9lK01xQkRTQkgvMnJYSU5RRjhhOC9laFlsSmtmUFFON2ZTQTQw?=
 =?utf-8?B?c2ZiNHRRb0Zmd0k3Q0hkb0J3Ly9lK1VJdTAwN1J5V1pwWFh0ZHNEYkdHU3Ir?=
 =?utf-8?B?TzU5bWVkc1pPZWRPOXVXUVE5UmRJZk5HOEw1azNmQndmSSsvd0pTZ2VzbXJq?=
 =?utf-8?B?ckgycTJSWlEzemhLeWl3S1A4NktyNWtXNUMyRFJmRXUyKytHUG9hWVRDemQ2?=
 =?utf-8?B?Rzc5VlhLdVJDT2IvNTB1Ymw3L05za3p1YkE3aS9DNWFDWGJBTlNkb3JESmc4?=
 =?utf-8?B?UDY2ejdlM0V2b2tpOUppdnV2Zmp4L0h4dEZqcmJDOEUrUVZudUc0cC93UjZM?=
 =?utf-8?B?Y1NxYTN2Yjg2RHg3N29YSXJrUHlKR09zQzNrWjYxZndUNXFGU2diSWQ2cXZl?=
 =?utf-8?B?dDRGS2JiaVlGSzZBbFBWbmNkN294cHBjakN1THNkaCtxcmpDc040bjBGTjBS?=
 =?utf-8?B?cXlxd0xUaDlMeGdpZ255MDhUaXNoWFlaQXd1Rld0cVVCZnJBekNlWW9rTXIy?=
 =?utf-8?B?SW5tWStYRzZ3QVBBZ2tLSXNPSVdpVlEzRVFTeEVHeG5QWXBlZ0kyRmMzekNQ?=
 =?utf-8?B?UHI4a1U1eEFnRVNWSE43dlpYaHdsVlhTZytNUFhTWkdzZHB1QnV0bGtFZFJ3?=
 =?utf-8?B?TWtSMldGMHNzUVExSU9aYTBzZkFSc0JnWmZ4bDNDck16bmZlQXNWVFFwSnU2?=
 =?utf-8?B?STY2WTBmdmh6dnVyZitZblRzaGxYbWRzTnRNSHFFUlNNdUlTWHZRbDZxMkpP?=
 =?utf-8?B?S0pzQXhZbFJ6QVN4eGtlTm03V1QzNVZCaWdleTM1aEQzQm82dWlZa1M1cWdl?=
 =?utf-8?B?TTVpdnY5Z0FZWTRFditBVERBYlNTTGZEd1NnTUZKMjNEQUZzeWVDb0ZqMWNC?=
 =?utf-8?B?R0RnTXM0WVp2dll5a2Q0NHNNTEtCTjc5STJFOWVXTzh5SmRLQzN2VzdLb3ls?=
 =?utf-8?B?UDVuR3lxQzZFZjB0M2tqa2pDNGZzRlc2aHY1SXRWdVlhODBMWG1NckZ0L0Fj?=
 =?utf-8?B?TnU4MnhtMDlCbWRScThNRkNUaEdRcElNV3U2enowMkczZzVQaWhId2Y3SVlJ?=
 =?utf-8?B?RFJheWJBTlNraTR5VENqcDl3c1JlZWVEcFJZVk9yMG5MdVBaV0JqTDY3K0l1?=
 =?utf-8?B?aitleWNyeTUxZnRQR291TjAyZHYwamFtbmg3anFjeTNmcEw4MjdiZWkybXRG?=
 =?utf-8?B?ZmRPZ3JlRDY3SFlNY081am5heW1jVU9tM1JHTk9mODRhaWwza2ozOXlhRUtz?=
 =?utf-8?B?UjZ2cVk2eUlDMDBvNTcvbFArdytCZUt4M2t6bEFkUnFndTFZREEwNTJHSHZx?=
 =?utf-8?B?TGhscEYvYXdtd3FsblFDd0xxYXBsTHorM29Ydi9qTVJONnF5RE1SaWVQbEhF?=
 =?utf-8?B?ZHB3U2xwbzBXK1haQ2g1Vk9La2oxbm1ybjl6dG5nVEwwdisxU0dMSlRVU3gw?=
 =?utf-8?B?RlM3V2tIcGVrTjdBbnpSVUNXcXB3bENzTE4rSXVxdFpGSWhoM3drc0FwUk1N?=
 =?utf-8?Q?STW9mu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFRNRUVsZW1EWWlHei80d3pHUW1Va01CWnBqd0RaUjdoZWROOGRRUmhIckJQ?=
 =?utf-8?B?ZVNYY1Q4cVR5b3NwcUJ2djdTVzhQVHNvdjhObjl3L2hZaU9lMTdCNGUyUXk2?=
 =?utf-8?B?L0JPV2plb3NENnV6VVF1OHhUOVhuMUR4amQvZHIvYlFaUFZIYjg2cDd5WHNq?=
 =?utf-8?B?alZpNm5WVlUwblBYN1pDVWtHd0wwOEhUTDBUL2NRakIwRklTQkJldnI4WnVJ?=
 =?utf-8?B?MkFuaSt4VVZuejZvd0toTExvdXRwS2ZnZGE2OWhHZUJkbDJEVURXL0Nab1Ry?=
 =?utf-8?B?UUl1OG4wa2VveXRWTUs3Wmd1eFhiYWNyMnV0MFNLQmpwbVRZTkVNT3B5a09M?=
 =?utf-8?B?Tjh2czRYSCtvSVdsWkc4QmRUbE4wZGRrdUVCeE9nZkpCYS9WMmdTb0w1c1o5?=
 =?utf-8?B?Q0lyQmdVSXdhSTlwNzNDbHZuazV4SHlxUzNhNWR4OURHcUJJSTkyT2pLZnE5?=
 =?utf-8?B?cGpHaXpNU1BMRXFiWXl0MHVhNjlncExOaWhxdTRTaThXb3pmNlMyaEQ2Q1F2?=
 =?utf-8?B?NEk0aFJNbHlaRWxCcSthT1F1K1dFTjNzL0Q5WVhJZDNUSnhBU2FFZGU0V0tE?=
 =?utf-8?B?dHZGTy93bythcjhXamJkQm1tczQyWURHcXhrSVd5UmxSV0dEQk5sWVRMZ1JS?=
 =?utf-8?B?c2pHUGxmbldCUkNXMEF0c2h3SVJGMk5INndYS01JbmEwbCtKVHBHWTl0OTFm?=
 =?utf-8?B?K1pLQSs4bnpFbEtuY09wbmdYOGJVdXdhYUl3S3c0SHZxdnppcjdISnBUS2JH?=
 =?utf-8?B?N3E4V1AycFNFbjlzb1hwV3Q3aWlGTzhHZ0xxSWp5UHVGVWVHWDN1SDg3aFZT?=
 =?utf-8?B?ZnFreWRDeThGVklWMlZXZHpiaWUvQTZ6NzcyTjVkRHFWR1RYaXNVR1MxR0JC?=
 =?utf-8?B?dUVLKzMxQ2JVdkY5dkdEK2lFanNNRlgrQ2lnQ3VEZnFkU0hTVDRnQ1JLYit6?=
 =?utf-8?B?ckVyZGwzVVU4RWlYSEg3MmxmTXpBMSs5WWdIZTRidWRzdEpFQU9hNndHT2Zl?=
 =?utf-8?B?ODdnL1B1bUhLeFZlMlo4WWpiSnl4b3lEc1RqMUtHa0lacWJYTGVhUDc2aVdv?=
 =?utf-8?B?U0poYkE2eWtwVXdRR2U0emg3S0dlcDJxcWxvNnJETXdPZ1RmUkhZeUdDanJY?=
 =?utf-8?B?ejVnWTNnWmtKWlFsenJOelI4TXhmbk5hUUphcmxXTVNtelQzYjM4MDhsbjBi?=
 =?utf-8?B?OGVoL3pWTHRlaW84YXlvRWNUdHJwbmpNbjN3U2lxclZVTVl2SWVqVmRTeExC?=
 =?utf-8?B?Zm5RVGFCRzZTWUlvK0QzeDRMZmt5Nng2SmVvNlZYalhpM2pNV2lmZlhtNFNS?=
 =?utf-8?B?RzVHWnlqcFZBQnBQUHNPT0ZtK1I0bDV5d28zQ1lGeVRvY0hmZklNTmRObGR4?=
 =?utf-8?B?Y3ZveFJKVFkydU9sZVZPKzB5WHdqdUxvS3IwanN6VlVOV1cyRFg4Q3dhMWdD?=
 =?utf-8?B?ZjJkNVk0M3dUa1FZNFB3MTllUWFYaURHTkg3OXRHYXNpWVFaQ1VhNzUyYkVi?=
 =?utf-8?B?VVM1S1B1L05pcEZyQnM4OGxET0pZOFpHWjNtYzB5eVliTDkvSmRjUjc0Vnoz?=
 =?utf-8?B?cWZzTlJkZkdFMU12Q1I2akR5TVNraWRVYnZwM3hyQXoyUDFZNm9jcWZ6UkFV?=
 =?utf-8?B?bVRCN2M4QStaS3BVZlNCK2krdGdmQlA2L3psSGl2S3RZMGRlMnRYeGM4S2FM?=
 =?utf-8?B?S2xSbkxzQW9uWWVCajFQbkx1SWJ1QU5GeUVGMDFwNVN2eTcvN1VNcHhLQjlw?=
 =?utf-8?B?ZHJoellSS3daQkZIaFFyak9QTUQyMm00Zlc3Qi9nYVpDYXBkaTBMRm5CU0hy?=
 =?utf-8?B?WXBrVFlETkhjekxIdUM1WGpjMnNYNjEzbVF6SEs5dTl2Sjd3aHI4aGkwYVc1?=
 =?utf-8?B?cDhmdGlYTUZzdEMwZERsVlJtUW1GbzdnR1h0QnZ1QllhWk9jbDZqVkZCTWRj?=
 =?utf-8?B?M0dML1hYWkttVEREWitkamtXUHRnUit5R2UvMXZuWEp0ZnFEWlU3bDkzbjQ3?=
 =?utf-8?B?anBHVDhnSnpNMk5SWnlJQ1I1OFhVVkZkT01SM3czTjJ0WTRtdWZaSlM2T2Rx?=
 =?utf-8?B?R0dMZks3c3RNaDVCK3BpQWc4VU56R1lNOUExU1FscDU4b1NsRVZQOWg1eDlk?=
 =?utf-8?B?RkVXWmV5TzdxcWEvZVNpaDNiaitnZUFuRGhkL252WW5ldkRLSFVmRjBCWmdt?=
 =?utf-8?B?b3JlSFRvWmIxNmhPY3poRWdUazNNb1ozSnlKZjFLbkVXZXhKNmNhS2M3SUNU?=
 =?utf-8?B?cEg1ZGRiRTBXSFVIMXpXYmtsblQyc2ZnZGZtSVhqMmFLL1lKcWlZb2FBWXVC?=
 =?utf-8?B?Nmk5SzRHS2VvY0ZnL2tqaUZCVmgxcnZSV2lKUjlRQWZ0QWswVG5OQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f7fc7c-e619-43d2-5f3b-08de510eae6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:41:03.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KthFQww5GZ3EtBlsumsidU9lpbVcAgmu389XzDbR37ZdH9FCMsjyUwGU2O5WKQqaKamuUumBwgJ9ix9aMqs3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable USB[1,2] and add ptn5110 connected to USB1.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 447aea3cfd079f5ac5689e2461913e43b763bf3d..0b6b28c24e465846e9d9664c44248af1ad407d73 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx952.dtsi"
 
 / {
@@ -87,6 +88,16 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 		off-on-delay-us = <12000>;
 	};
+
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 };
 
 &lpi2c2 {
@@ -192,6 +203,40 @@ pcal6524: gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5110>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -219,6 +264,31 @@ &lpspi7 {
 	status = "okay";
 };
 
+&usb1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -307,6 +377,12 @@ IMX952_PAD_GPIO_IO36__WAKEUPMIX_TOP_GPIO5_IO_16		0x31e
 		>;
 	};
 
+	pinctrl_ptn5110: ptn5110grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO34__WAKEUPMIX_TOP_GPIO5_IO_14		     0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e

-- 
2.37.1

