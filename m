Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07B481B1
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563464; cv=fail; b=bmUsbMsun/5GWDaFUfTeebuYESY1pfHhuELhvKWiszKMTuNllOIKMCi0RKrsm/Gqn1JA59oAtWmElrZo8yjCAROdqo5qKkfJg5Fl9mQEJfwN9b9iTFsss5KHGy7I2wopAt3Q86j62KpldmmDS4v3GmmwGGTe+AsATEybn/lG5Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563464; c=relaxed/simple;
	bh=3c3TjSXL9hE4saOOdB0Zo6SA8qQsADvYUMsCu63vdhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OXc4f0GVd6psaAPYnDg22Z06gwW5AQKH9J5Nol+sW1GveLr3XzA2oWpbzLjfq0jbNU+WJ/Br68a8bSKU8KBNeWCIVHAMUYrUAQHwO93kAJq3NAOK4Pn+wn8Nb/QN8m296nQ0otfGaC5p+DOJ2BIZhLtfYhENn6Eb+QIcZDJLB4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K8S/zdXe; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K8S/zdXe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTXeLlP2jK/U1fwmSj4s8dxpQEDwU3G3dGCE5JIBGhwIU8zvBbAManBC+X8uL3DH3w4fb0sLtKwFFxgfH5BCyQXiPsFo5KMIcQy7o/7sNK2NaRBtyJN0AaDE2ozJ+bKfBDCb7XeXptcNuA2jVYRNhNXKE+BuwM795Rnns3Q5hSAehbh1PB0lf20dNhy+W0jL9237JczpgMjhxAyQRMBBEiVWEIJuLt3SYBHFdVlrKTz5IAq+mL/+tC55mFpXrNY1hBUfMt34sEVeCUZOQ+PMln5eFsQTQNXQ+rA/cQFnlJm42iCii8ct5SbUyLj4kmrz8WrM1PuihSYtnjIiiVF03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV5IhDbc6XDSL4jQpngg3d5qrdvxNw7N9wO/VhYiW+s=;
 b=lBQhInyLRXPpaM49NqoaDLkU/yTgocH5KjCP0YZ29SuU6kj5UDJEzAPOD2Q9a2OpzV2pFVjUP7DDdlXfLKetqF5D7MjQyci1dnaqiA7ITzidH+FjDYHxR3oc7W1xL5WiIUmpiY9MYjzuxOqQ6GUfIQgqiFtAA1svIZ30rQ+ZZZqbJViHqS5z+fTYty5kzzEUD4+hgciiEFgudFtUTvSgVH7BVmCFQeZDKedoFso//3pL7Xc0CGEQ37it3vb0Tz+jkdoP3Bq7k/NdJMfPQ9XMfuvBPL5J+E38QrgwNtQGbAYDruBf3ETYGnE84Jy2u7N+C1f5E3N9NrRO5MbHpYkkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV5IhDbc6XDSL4jQpngg3d5qrdvxNw7N9wO/VhYiW+s=;
 b=K8S/zdXeqimFVA/a2m3gOSmdMjuzHF8bRmX/qf2RNfNzNw5tQXlh4HC4+83AZNwrYD1KPgvQarhd1+obg7CvwFndv4g6dfdxGLD7pRbQn+X7giv+ICXgDRs1aeMH8kvXY3sLQB6p5M8CURZ+WNa0DsW5ljfhysIKPBWSonlgRfnmAF4k/bAG+nvaYVnNVUFG910KDACD0ImvlFiNVIQrEU9DiKzxDEM4wIoS5xNj6RL/DJCDjOABxN5udGZa0HQ/GbcgExrJUdN7CnMINooxBuMpsFqgK8+pFMC7kbEtpaQAHYi0sATYeat4LgVVCKeTLU5S/bEoawIeGyK9qhG7eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 16 Jan
 2026 11:37:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 11:37:39 +0000
Date: Fri, 16 Jan 2026 19:30:23 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <wbimgcjsfkwyxlxzq3hovcktqywur32rff4jnfklwmawou2s3n@rs5h6uiko4c4>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 1918620e-8568-4507-ad42-08de54f3a74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0dYaWVvQjd5SGFlV015Q2FnTmtZMjR4YU1kdlJickYxeiswSk40RkRTeVFW?=
 =?utf-8?B?WUVpNkh5Z0NtV01GanBIN29jMEJiR1ZsYmJCUld6NXlnbmJXRHhsNjdQeURl?=
 =?utf-8?B?MjlOYkQzQytYU09MaE5rdTJFSmZJc0R5U1ZnRkFyQ3RudFBvYW1OUjdTYkRp?=
 =?utf-8?B?TXZLK2pkNlQ5UUNqUjhQNzBYUGRHUXNoTTRiTUhMOFA1Vzd1Wld5aHhUM2Fv?=
 =?utf-8?B?bkVRMGN0MW15OHF2Z0QwK203czB5S3Z6OFdSUnVRU1JXRTBnMElwelRndXo0?=
 =?utf-8?B?bWVjOCsxSGJjMFNybnd3a0l6a01nV1ZGV1hwanBvbkF0QWw0ZXNyd0YzanFF?=
 =?utf-8?B?OTlKV2N6NlRpeHRIYWRISEozN0JLdWg5QVdtN1Bvb1dza0lTanR1c2p0eWxr?=
 =?utf-8?B?cThLcTM4WGFJTU5qVG52eVV3WlM1N09DKzgxdGpibk81L0RmMTQxQ3BRUVR5?=
 =?utf-8?B?OU9mTC9WajMvVFZOOFV3dG00TGVleFVxNGpJLzJuNjEwNFM5akFYdzB0a0k4?=
 =?utf-8?B?c0JuejUxeU5EVnFHd29Kd0NsUlVDaFpPb0VSK1pHQjduSUI0eURuRmZhVWVy?=
 =?utf-8?B?M1dQeU5ReFNjRFh5VmRvZnhxQTY0eVJvV1dnSWZlQVVXbXowU21NSkdCTzRJ?=
 =?utf-8?B?bndleGgzZlBYSEpWaDJmNDZaWkFYOTl6Yml5enN0dFByL1oxUU1CTFFPSGR4?=
 =?utf-8?B?QVVBa3JQditvOWhMSmMxbVcreldXaEJ2NnJNVW05NnJ1bVJPT21EWG9VQ2h5?=
 =?utf-8?B?TkV5WCtyM0xTMmtSekVReFQyVkdGOGNPQmZmaHBwdHNqOE1jSUhGVnlJNFc5?=
 =?utf-8?B?WDlNeG5KcC9DNm9uV2NSQWU2U3ZPQVFvSmV4OUlZZ2VJb2ZuWVozdVVRVnpq?=
 =?utf-8?B?bHNTUjgveFZTcERxUlNFdUw0ekNIYTQ0QlZTV1dON2lkdEJubTZYTW45dWZX?=
 =?utf-8?B?azVwSmxnQlpOYWpFVmFyY3ltSnZKR3dvTndHaFZxbWtxeDNRTFBSVFlCaFV4?=
 =?utf-8?B?N1QxNldKNWhPa09iNnZ0ZXhBVE9aRElpODN4MHp6Z0ticjNlVUE5ek5JWWRj?=
 =?utf-8?B?eVpVYy91MElNd1FqMlgwb0twOEprTTc0ZnRkNkZxK0xlV1B4YXY2bXRJMXRO?=
 =?utf-8?B?WXpmMnNJUE4reS9pbXhua2F4bUQ0ai9EQkhJKytaQlVPaXVBbDhpY045ZjBH?=
 =?utf-8?B?NCtTdkpEeHMzc3dMUXVDVGFnWDJ3bzFxN0lkdE9NdklUUGJqMnhhbTZ5R29n?=
 =?utf-8?B?czdVU3BJaGpwY0l1MHhaL0VyVDZjd2VVamlMQzlUN2hVdjZ1REppZWd5ZmlG?=
 =?utf-8?B?d2lKeTNQWU1WSVh4OFlnVFNkQWplZE41NU91ZkxTZGdmMTdNR1lYdFhZamVQ?=
 =?utf-8?B?WSt1Q2pzM1dDY3V3a0VKc0svd2g5b0g2OFg3VEpFT05KSnNOc1RPckhuK0tx?=
 =?utf-8?B?MVJzd29yemNsbFBsSHpIZVJ1N1ZkOVVtVDNidkhOVzFIUm1QZlIyZWhjN0ls?=
 =?utf-8?B?NTRHVFNpelFGamRqUG5UVWRxeDl4ZjA0UTZVWVE2KzY0dStOTG84WTFHWmQ4?=
 =?utf-8?B?K3Y0UHdYRjZScEpXOTFteGVMTmg1bGdVaHkrTGtmeWVrbTJYb0kyV21RUTRk?=
 =?utf-8?B?VjJsS0p1TDZ3Qm8yTnVva2lqVnZSR2xwRkNFUDF6WEl5MXN1aVZ0Zm5qMTdK?=
 =?utf-8?B?OXdUbVJ4d2JGbjZQR1p3a0R1TjlBSTlUdGY4T1NHaWE4NzBCcHR0cVVvQlNE?=
 =?utf-8?B?cXZpeUl1WndiTmszSzI1SXArWEhOYi9OQUh3Rm9BZUFUeWYycjNtQldNb0NG?=
 =?utf-8?B?aXMwaENxOVorYU9zWGE1alFRanRONXZ3WVAwbms2WnEvNUtoY1RmMXVXbi9r?=
 =?utf-8?B?UXg2RUhZMW5UdkRsaUJDY1JvLzY0OU1DaUtwaG9xVlJsa293UlFxV1BrQUVI?=
 =?utf-8?B?UUxhR3U3dXFHOW9TM3NkRnA4ZlpaaGRKd2xYYVFEMTVkTWgrZC83Ymc1R1Jr?=
 =?utf-8?B?RmxYaU02QTAxRHYvalFHR1Z3eXlJTEFRVyt3N1pidUJRZXVQeHAzZmFwVFZM?=
 =?utf-8?B?cW1CVlFxV2RHSGNVeDc2RjNWMVVTbllyNDEyTUptVy9QUjJ3RHk4c0VzNTZT?=
 =?utf-8?B?UVFJVnlhSy9tdlFhYW9rRGZpWjlUcHFuSkFpZ25URlNBaFBWY1VyTGNYbW5U?=
 =?utf-8?Q?fKCb4EbI6KNcMRgW/ZhNWRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFlwdlFENHFpRG0xZmMyNmJ3L2R4R0JPWUpzdGhyblZFOFlZY2RtUmdOK3RZ?=
 =?utf-8?B?Q05NTVlscEVQOXlFZmpjRzF0V25jMXZEMmwvTUdONHI5S0F0MTl1QUN1U2Jx?=
 =?utf-8?B?RUJxM2Z6KzNqZnA5dGhEUUhCcHdGRkRUdEExb2lSdWZmeXZ6Y08yaUlxSk1T?=
 =?utf-8?B?cHhwWlhWUmNBZXFOL2lYL2JDN0ZxcVJIbkt6M3BGRTJFbHYwNTNqNGxWYklz?=
 =?utf-8?B?QVJHRUxsQ1pkbllpa0Y2ZDBuYzZUZDc0OVRDQUdLWmgyT04wNWZ0MFZpbXFs?=
 =?utf-8?B?TXF5cmZ6WVcrUzhSSmU4L2FYRTdyekY0N0xZZk5oZW5Td0FxYVdRTWdyb1po?=
 =?utf-8?B?d01NWGhnaUxaUVJpVGp3bTVBaWt6cDRtZGJOL1pXYmdkYnhCN054Z1JCek9D?=
 =?utf-8?B?SVFabGZJblNHbW53T091YVo3L3NGaGRhR2ZDd2txZXB0ZUphZHhZNXlPSE0y?=
 =?utf-8?B?OVRReWVFYmlkSlg0Wml0dFNSN0pwR25SdjlYV0hPY0grQ3ZkVFF1QUFkSnRG?=
 =?utf-8?B?dXBCTGJUTnBrV3IvU3crQ3FTNVhUbGY5SHRNZkdtai9RNVNwVHpjYUhRdzVI?=
 =?utf-8?B?YVZmNlhieDVSYWxETCs0eHArSUFsM3VZS205UUxpd1U1TFM4eDN5NDl6WFh6?=
 =?utf-8?B?R0VSNHU0cjk3ZjlpZERrSlZsMURiS29GMmp1QXZxbGlhUHFUWmpDdVNpQTl1?=
 =?utf-8?B?OHdzWjB5ZVNxWEk5NlpzRHVVNVVoNU5VTGdFMlM4VjFnc2xqTkYyVUVBRlVo?=
 =?utf-8?B?akNaaElXZDdLVkt2NUh4VlZrQ0FSdkhPSmgvM3FtVmdidXJSY283SURNaGwr?=
 =?utf-8?B?NjREWkNoenpRSWpsYkNtZTlBeklTSlJwT2hqaU1wc0tuK3FWVFh5b3ZBNE1o?=
 =?utf-8?B?VWRSZE9MSnJ3RGlIdXl2Y1gxZ0dqZ1hKSWhXb3YvRC9VQlRRUmNMRlNrM0hv?=
 =?utf-8?B?NjkxdDkzdkowQjRicE1FZ3A4M2gyVGtiOTlMYzFadkxqTkhlc2l0cGI2a3dr?=
 =?utf-8?B?OVk3eXdub3ZYekY5WEtrZkJQNEc5aGY3OURrY2VyWHJUTDNDNWprQlVxa0lh?=
 =?utf-8?B?eTFZQ0lhUDF3c3V5VXcyUkVLY2huZU54Q1hSZzN0WnZmVldjTWFwdnlqVjR1?=
 =?utf-8?B?NytzTE43SjA5azg5UmRxTGZJS3RIcEZzR3Fkakw4UjF5RWlPTHVsMno1MzVP?=
 =?utf-8?B?aHZpZHpQQWZpbFJNOVBCak05Uy9BRG9JUzRHbzFVRHkveVd2V2h4TGFTQTNS?=
 =?utf-8?B?S3hCbTNWR0ZLelJoUXZOVE0yZVYybUh0aUV2ZjlWRjZ0Zm1pWEdESUdSQk95?=
 =?utf-8?B?ZVFxWGNLTVJBK3lzVjFUMnZ0OXNWMkZHWVlmd1NuT0pzdGt5ck5WNGdlKzY2?=
 =?utf-8?B?c2tQc1dRWnhzaHFHVHJLRUpCeDRsUEdoRGpCSVBsTU13WGdKNm8renMxekRP?=
 =?utf-8?B?dDM3bW1KejE4OVFtNy9temdvSWtRMVFKY3FEZG1adTJjWXVzWmR2dDBqREpn?=
 =?utf-8?B?RDZVV2N4YWRwMDhDN2VJVlFpV2JxVENZcDlHbnlRTlpMbEdZVXVYTWhJajlu?=
 =?utf-8?B?ckxpYmtqSUtOd3BlZmIrNXl1dkFvclU3RVZKUXJZc1FoV2hUVjFjSmh2WjV6?=
 =?utf-8?B?RWJReG02OEJIYVE2TCt6U1pKcE04RWhZOWFPSGxrSXhmOEFtM25PdXllVXNh?=
 =?utf-8?B?Wm5vbEEvRVlDR09adm5DUTlFSnVnRXU5Y3pYUkY0bFBqWkdhaEN4TkJoNms4?=
 =?utf-8?B?dnZ4NzhrQVVzSm5LU04wSHE2SUIvWDdKd0xRNWg0RC9QSStNYmpvOGFNbTVn?=
 =?utf-8?B?SHJ3RnBqTEpEUDdZeFNoZWk4NTdab2dkNHJXc0YzaVJ6dE5hUTJBbnNMQlRU?=
 =?utf-8?B?ak8zYS83U2k5bG9XS3BrZGN6OGVMT2dSbklETVdWYjN6OTFraWNqaWdhNUg3?=
 =?utf-8?B?QWw4aUVqNGxDM21mYUUvQ0V2OVFVdDlPcEJLaXFhenYvWEdZakVDWE1tS0cx?=
 =?utf-8?B?ZWxZNUlrNU81eG5IZ1ZlYWgrMk1sTTBuUnR5WU1VTnhvK2k4OWlQdWFWZjJR?=
 =?utf-8?B?ckV0WkdjWnNIVXZEbXMxRUpDeXp4SzBnYlRYYXluUTNCU0UwUm93UkVvdG1N?=
 =?utf-8?B?aTlHOWM1RHlPQklvKzJJclRVM0VueUZrV3pjb00wcFluSEFEaEZjV2Izek1T?=
 =?utf-8?B?Ly9ZSHEvN0M0cmV0YUVEWFBMS0E0cFBhbkh6c3VpM3lZRmJjbnZ2WkNia1hE?=
 =?utf-8?B?RkJsYlhFR0NPNWs4SmtIdWI3TmpkdUgxRWxsSmRROUsyUzlrWWpsRnYrVDhN?=
 =?utf-8?B?YkZWOHhQTXVoVEdnSmd0S0ZNb0NiR0FYVk52YjV4ODJSRGRxUGMydz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1918620e-8568-4507-ad42-08de54f3a74c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:37:39.5523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mK1yNmlxyxxpj5SyhMTbgCgIdX3StBfWOBnLFxQC6R8Ra3c+EBgph6y5q8FGEZa84mLXC97K1Q28Cte2+/qvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856

On Thu, Jan 08, 2026 at 07:24:31PM +0100, Andrew Lunn wrote:
> On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY[1]. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> > 
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> > 
> > Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> 
> Please don't ignore my comments to V2. Think about the code split
> between the generic IP licensed from Synopsys and the vendor specific
> code used for integration into the SoC. You want to avoid making a
> mess you later need to cleanup because somebody else licensed the same
> IP core from Synopsys, and need to put their own vendor specific
> integration code around the generic code.

OK.

Thanks,
Xu Yang

> 
>     Andrew
