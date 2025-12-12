Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE7311C33
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530977; cv=fail; b=sTKXS0zVsYyt3wginJT2ksShzYyXaVTMVY5ZaJ6uinKhOY30JOrlWt+zpvS2mMsXXpv7VwMYVijxWgzlIVhfYnPDaoPeuIx6t+M2mXtA6i8Fdj3HGvIFhs1q7g9RkaBLDukiA5c1YCXWac+uEZOBrtARcAjCWTxcPrDXjHztQJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530977; c=relaxed/simple;
	bh=vJ1BYBzmWRslBxrWVxeo8RpvSEeMaZ66NsWCTohwwDY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jBRMHZA15gUTazP5//RKvlTucTt8gZbZsMx0x1SCxSUwOUoBbvEjFs0y4gkZzIG1mVHNFOzxDep60ghCzCQfsDns16nA5ubla+w+Mwb71H/DHEITDYQZQlK1m9qsWIcDiIILWnYtizEqXAoFTqyJJ4EXck5n7q6dJhUvpF/0AQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HnO8GCRy; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HnO8GCRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abow7cL7lHJhhuKkGrDXxOypSgGDhZoAOw6DJK2ws34RhIahuNDuUSwt56mlYTJrnLdmqucTV/ptt/g5CPMQADzglZHOu1B+wyzu7c6Ur+Elag92E9RJKGSPZva2d59GgJYkJTMnSEgZs2R1SOfGmvEtw/i2gIXILyw4tvOG3xWWWEbNlHj/SqrUMtLfdhJENu0q0rpYDXC6SVhuAoSKEeCeeFIj0we+2+WV/9mTqLL8OmLkUupyS8PNlW/VulV3uw1Qtj4teNdsypj9c42YJpw+wUXH8VhXQbY+Y5Ap1TzjfVIuaTGDTCgz63Zxn+mN/56oqafyIpjYk9eAdWtEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el80SiTlNgTL5ncrUsR3QvnOmOx4l9D/4KJSVk4Y3VQ=;
 b=nju+ll4leY6A7fKX/gzPYQncWsBc0VdERzdobFTyUYaZ9THhMQVyFfSw0CrWWnOGI70lsjE6n4TKeN87urksY55wv/ayN6+6NX6JIy24993cYMYOFXnG9z2x2odI5CpY6yY22JSfNOGVTPpLuSq9850qsC0O+tY2jRVbmuhLJ+/Q5XSF/8ZRMCRd+NMtsZ0lyhnggnRR4hAKpKKZyVpPkiCSMeeNCSYvRtlr3zTGtOsBwCH/UmIXipnlZmQylP/TzHyeiFcBZFAy5KKLn0BHgcKvmXfUNeabZMa+1Vi90Zdn3Tss9vGpBCaQzpFpZs2geEM0DdDViYoNw0cG8BdUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el80SiTlNgTL5ncrUsR3QvnOmOx4l9D/4KJSVk4Y3VQ=;
 b=HnO8GCRyjrmU2SkzozFPQtJM77Z6NzEiibK4ChaUTVq4TVbI5zioH083HK4aMrMuBSIWZOfo2vMfDjHVtAsqajmidADQrH/M5WxrCj2fTF33HyQuSzEtAMA5wFiG3tlI6hf8TrSISzGrdlKkhi+a0MG0uiXZddXfd0HvnbYIJv3W8eSkrI6ZNJdeOr/fAksyzy84Z9O9MsaTjxCKYteldO0t1i9KCmtUBDWAyTFmcYZFMxn2FFKGHCR8dsY4TI4NrjV6vCIG2uHk0wXWJQV4O+/dVxe4nv5y4dgsmkWw73p0BHJbo+QpDpH9dAR9bjlsDHFMh4sBVrfyxpSNgaBrzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:08 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:16:08 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:16 +0530
Subject: [PATCH v21 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-5-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=38500;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=vJ1BYBzmWRslBxrWVxeo8RpvSEeMaZ66NsWCTohwwDY=;
 b=8u8dbwV8D5WNNz9/Gw4TaRGkrMB1o5XTfK3S4zf3dIaZWMgAa1iyyDPpvwEOam6yUTMqEmdbK
 3CY40cX/SH1BEh0Z7w5SFGRNfPy6lhlzXOXNLKYv9hgThln+N1/h0zm
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: a96dcc57-9117-41aa-756f-08de395f1575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2lhV1N6OFNnTjJSYXJwWklweFA1NStsdmJMWkMvajgxbDBSR2dTcnR6VUkx?=
 =?utf-8?B?djZXOW15Vkg5RGlRRE9XaDRRb1lpaVl2WkQ0WGMxdm1qNGRuWGl5R3lCWi9Z?=
 =?utf-8?B?aTN0aWsxemRiQUJ1UDhXYnBHNEhXTDM2R1NsWGZRb3MwNHFIa3VVVWU5UXFI?=
 =?utf-8?B?b2xiaHZLQi9ZSjU3UlptRWtZeks4M0RIYlh6MGtWRFROOXVwNUpjTGJlWFN5?=
 =?utf-8?B?RkVJdE5MK1N0bDcrK2dlVnhkTGRiaDB3c2FqdU1xQkpJeDNpVjUyYldVQWNr?=
 =?utf-8?B?c1Z3Rno0aUxzenVsZDFTWXdiS2REU0pXR2tGM1BTQmJXZCtiUzlrNFZuZ1Bs?=
 =?utf-8?B?enNFN1Nnb3FjUm1qQlNOWWFJSVo2UXVWZHlZY3VUNGhqQWloSSswa2UvaE85?=
 =?utf-8?B?cjRETnlrcWJLQlhWb0JmL2hxYWJnTVFUSEJETWlCZlAxUzR6ZGd1QU5sQTJO?=
 =?utf-8?B?Y3hWWVRScGU3N2JESzBibTljTVpvbENRMEh6eUVjQ0pEbW1YOGZWemVPTkdl?=
 =?utf-8?B?TFZ5ZTN4a0hjY0pPVjZ5T2ZUc1VYUVNRNkFzT0Izb1htWnhUemFNb3lJY09F?=
 =?utf-8?B?M0xoc2x6Y2pFZ1lDYlQ3Y3dQMmNSMnJHWlZLQTJFM1BmODJPM2IwbW44SW1O?=
 =?utf-8?B?NWN3VDFvVjA2aEd3bm5rbVEvYVdNbXhlVTVLWTBuUmtvR3VySitMazNzM0N5?=
 =?utf-8?B?Vng4eWtZS21xMXA0NUg3b2hKOVhjTkJwS1RaR1dGNG5XaHBtbEJVdjlyZWlo?=
 =?utf-8?B?YU42Ulgrb2FmUEx6V0hqakMwbkRnMGQ0VTlPZ1ZvNW51a05OYitqV2E5dU9D?=
 =?utf-8?B?bUJsQ0o0YXB4UUhmV1dmL2VhYTU2cEwrV0xuZE5OMXYvY2M2QkJHcFlaNHpQ?=
 =?utf-8?B?TXZnUFUyNTJVcGh6SWR3RzBaTXlDd2lXbDhSY1gvRVZuYlphTFlObDhreURR?=
 =?utf-8?B?U1hZK0pUamdTcHpoY21RU2pMc0RlRjZxQ1B3T2hhTmV0WnY0R2dmUEZ4S05y?=
 =?utf-8?B?TE05RTU0Y1ZLOUJaak90cVRNSWczZVJ2SmNFdEpWaWhzQXFOTTJubEliNDBi?=
 =?utf-8?B?Ykg3bWtQbWgzcG9JU2dPbWx4NEMwWC9wb0RiWW1RWkdsQndDcms3ZFRWWStS?=
 =?utf-8?B?NzVNZzNxeFdQZjNzTkhsRHF6SGRlNE9vWE5nQmdwWGZiL2x4WUhyLzhsRlhu?=
 =?utf-8?B?c3JzWkp4M1EvMWZNV2RXTG5sOGVHK21Nc0NmV3BSNHhYc0ZjdVFYY2lud2Mz?=
 =?utf-8?B?OTc0Z3lWMEJIellpOGJ1cnVHSDF4S2JZOVNZa25ZRmxJUkJnSjlXaFVPTlBH?=
 =?utf-8?B?YUsyRDk5ZEszaEVtSUJNdWFoYW5lWlBCdUxVcjBPR2daMGIvVmFlaXpUaVJt?=
 =?utf-8?B?ZmhSd1BCNUVRcmdGcm1ZeHMxdm1GRUNoL1h5dFZEaVhFd3EwNm5GVlJ6Yllp?=
 =?utf-8?B?dmtZVlhaMUJJTm54dTR1SkxFTDhLYVljYWJPbHhjSU8xQi95d05zU0hyUi9L?=
 =?utf-8?B?VVg3UTVCdUxQdDZ5N3hDTEdCTGRFdzBZT1FNczFuazlRMERtVUpWUDdESzNP?=
 =?utf-8?B?N0xzL3R3U0VQS3JiT0hCTEpiTGZrdWk4QXlNUFVvTWtCOFlhS096TDVOSFFx?=
 =?utf-8?B?QTQvL0NFQ1JFbXFBdGNyWWJ1dEl2eDFyZ2VoTXBxOE8xa0hJTzRZS2hNS0N1?=
 =?utf-8?B?L2RYekp3RzEwMDV2SzdNSzZwMlFLdFd4UUIyRFM0dDBJVXZZNVdSdTlFVHF6?=
 =?utf-8?B?V2l2aEl1bXc1R28xZFRoVWpReG1sdGQvaVJZQkZDWkZ1RGl6YjdyMXloSldj?=
 =?utf-8?B?T0VzQkh3MU5JZmFqRFAwWm9ncUxTY1REWkgwbVFuRFNzMXZUaFFIS1psZnFV?=
 =?utf-8?B?TnVjaURsdnhFRTB1QmdUWWEvQUlobnJSdmFXYXJoaFBEYXhESWZKcjZGR3JM?=
 =?utf-8?B?Zmk2YUdSaWM3YmJ6bWVSNXhmU2FpQXpPSlBnbStlZHdSelZvK3pXMEplM2pt?=
 =?utf-8?B?M0F6eXREVzFCL1FEdkZFOGs3R0daRFBCS0hxZ1J4QXdQVGxmaXFrSERuRFhm?=
 =?utf-8?B?T0VVQXVnZUFiWWhPVHhvUnZSTmp3MkN0Z054Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXVoUktLbzRnUjAyUUs4QVhzWkZvdHlYL01JcjNXV0VFOVMvZGFQcWtoNlBT?=
 =?utf-8?B?Vm5TVlhFTVkxQzJ3L1BRYmsvTGRaUGppWmd6dEo3TGRsRjhLOHRDOGJIczBT?=
 =?utf-8?B?UzFCN1E2djdNaUIvRmY1b3IybGJkZmM3eFRrSkN4Nys2b21nVktjVVB1VVFG?=
 =?utf-8?B?a0wxYVJpRDdiMHNmOE92SjduUHZiYjVVTHVmWkwzMk1SZ3dZblhOQTBoNFVO?=
 =?utf-8?B?VVBxOExkNmpjOHZFTExJQUh2OTZxN0ZUdFRhcG5WNWE2U1EyNVhvWDNybEFL?=
 =?utf-8?B?N2VkamRoa0xla21mdDFNYVI0eGlPTWJqTUhNMVdRMHRtS1J1ZWxPWXN3dGZl?=
 =?utf-8?B?QUhPVml1dGc5RVUzVTNvdDhsQTB5LzI3Uk9ITGxuRW1tWUYwQjJ6bUhjT2Iv?=
 =?utf-8?B?cnIrd0kzcVIwVGwvNldKaXVGcDM5UlgwVFhiUWNZcTZzQThLTTNWdGl2Yzdo?=
 =?utf-8?B?WjdrQmhXc0JsbUllN1BGQVVqM2RQQnNrMm1MUjA2TUUyWC8ra0poQmE4ZVRV?=
 =?utf-8?B?N2hHVWQxb1oyR3FMZkp3VitjTU1UNHNzT3lEZjRsT2M5aTV6RDNjQ2Y4SjVj?=
 =?utf-8?B?NnJoRGZJRUdMa0xNd2FyL3E5K21CdzlIU1phTlNJb21uTUl3R3ViZ3BuNE1p?=
 =?utf-8?B?cW5EZldPQ0J3ei9tVG01dlN6bHY5Y0gyQTdGZEVlTnNjaWgwSVZCRkZtK2tZ?=
 =?utf-8?B?Sno0ZnRGb2ZNVWt5KzlvejZ1cTlmclVjbGlhcGRoNHhVZUsrYjlvaWdXMW9Z?=
 =?utf-8?B?NkVBODNGc2FYNW8yUFcveEYyOUMva2JXL0lEZElTOXd1bGxQYTAwcjdHY2Vq?=
 =?utf-8?B?a3VSZDVyNnZKNlJEM2J4S0kwTjNNZEcybHlJTVdBb1pLTnBqRGhLcTNYVzlM?=
 =?utf-8?B?NlZpd1JEUWNNZlZhRTc1Q1pCNGRqZ3RTQkNGU1Z5a1RYVFJkSS9XVld5Vzdv?=
 =?utf-8?B?bkxvN3VWQXMvN21VU1JCM0RFM3lrVzVnZEFycG5MYm5lN0lnSWJTaHVIak1O?=
 =?utf-8?B?SEwwVHRiaGNKSXFCMHVHVXVsZ0FRcGpxZXJKZHNwYnEyWVZYd1lMVlJ6Tnox?=
 =?utf-8?B?ZzRPVnZ2Y1ZZUkVzaGF4QUF6b1FqTm5mMk1YdWU1cUNaa2FBd1lVVmhGa05W?=
 =?utf-8?B?MzZreTViT3RMQUZHaTVidWtkQmF6Vk5vUGl6SmlpUUEvOFRWUFJzMVMvSmo5?=
 =?utf-8?B?ZEdrbkdWb0J5L0dWQjgwWDUvam1CTk11MVYzSWNpVHMwN2NsTExpWmIySFVH?=
 =?utf-8?B?VnIyTlFLY2VIQmNqR3ZOYVpMTHRPc2xjcGI3N3BTUzVsdXI5WWl5Wi9nWkJP?=
 =?utf-8?B?VW9HYkZkcEh4TWdmSWhPUlE2YjNydDQxcmtlOFNmczZWOUo0b3o1YXJ4dmJ6?=
 =?utf-8?B?SFgrdFdOaDEyTDkycWNwZnA0cS9RZXVSWktBb0JOU1lRdmhkaDZVaW9EVmp0?=
 =?utf-8?B?UExMbXl1b3RId3VyN216MzFUaGVLaVN3SlArSWxnR29ubXVFbGpoLzAvTk9T?=
 =?utf-8?B?MEZGanc2dkxmT0pRUE9BTXNQNGNEVGJlTXcvTGRPQXBMS1VZYW5yU1lndnl0?=
 =?utf-8?B?NmVEd0pyT0U4amUzWUlESDlPa0k3SzkyWFMxUks5QVJ4Q3AzbTF1NERsMldH?=
 =?utf-8?B?MXNOSkZDdGx5amlqRFJiZmEyQUdLTnZmWkNqRHRTWVBYOXlEbEhRZmh2WUhX?=
 =?utf-8?B?UVRLcDdYZjgxa05NNzZ3T1JnSEZMcms5Lzg5TmdQa3BtMXVpWDhJV2luTmcr?=
 =?utf-8?B?cG1iL0hMMDJiNDZnQWVlVW9kZ0Q3Zy9NMTI2bm5kbGQrOTFQd3ZzUzlFUWtU?=
 =?utf-8?B?cmcvNVJDUXFrSFgwQ29haU1zaXRPRUNqOUF5MWdJS0pEaG14V3pXLzc3L1dv?=
 =?utf-8?B?cVpzcWJjWVROemVEYTNFSmFLbktZVTlXeHlzbXJaZytFSTVJUEUyNzZiUjF5?=
 =?utf-8?B?NmtVL0hBMTM0dkFTM0hzT0xKVUo4VjZCMFZ1bjBNMy9UbjlMMFlSM0JTSUxp?=
 =?utf-8?B?aFR2LzhJckVQUHBNeXdXK2tqZDcxQ2ZLeXJlcFl0eHhsNEZ4OVlUUW91Sk9F?=
 =?utf-8?B?VTllWkVGS3RPdHIzdEhnZU5nbWpvaVhMTFg3UktXSGpCYWE0UlRTRUQyTCtZ?=
 =?utf-8?Q?iL1pXrSuzbiGeW+TGz+iRucCV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96dcc57-9117-41aa-756f-08de395f1575
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:08.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZWYjGiFmVRA7+6NaKx7mXpH846HjXYHD390ReprCAK2t6ZO65iTKeqKLSPs/wNiM6y0KWJhR0jB1kQNTk4WKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Following checks are performed on the incoming msg-header,
to block exchanging invalid arbitrary commands:
- maximum allowed words,
- check if command-tag & response-tag are valid
- version,
- command id validation check, to allow limited base-line API(s)
  and restrict following:
  - exchanging power management commands.
  - reset requests.
  - BBSM configuration requests.
  - re-initializing the FW.
  - RNG init
  - CAAM resource release management
  - SE's internal memory management.
from user-space.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
changes from v20 to v21
- removed "__free(kfree)" & added kfree();
---
 Documentation/ABI/testing/se-cdev   |  43 +++
 drivers/firmware/imx/ele_base_msg.c |  28 ++
 drivers/firmware/imx/ele_base_msg.h |  20 +
 drivers/firmware/imx/ele_common.c   |  37 +-
 drivers/firmware/imx/ele_common.h   |   6 +
 drivers/firmware/imx/se_ctrl.c      | 744 +++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |  33 ++
 include/uapi/linux/se_ioctl.h       |  97 +++++
 8 files changed, 996 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..dad39ffd245a
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,43 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 4d1f0d43963e..185ba890765c 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -14,6 +14,34 @@
 
 #define FW_DBG_DUMP_FIXED_STR		"ELE"
 
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header)
+{
+	switch (header->command) {
+	case ELE_PING_REQ: return 0;
+	case ELE_DEBUG_DUMP_REQ: return 0;
+	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
+	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
+	case ELE_OEM_REL_CONTAINER_REQ: return 0;
+	case ELE_FW_LIFE_CYCLE_REQ: return 0;
+	case ELE_READ_FUSE_REQ: return 0;
+	case ELE_GET_FW_VERS_REQ: return 0;
+	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
+	case ELE_GET_EVENT_REQ: return 0;
+	case ELE_COMMIT_REQ: return 0;
+	case ELE_GEN_KEY_BLOB_REQ: return 0;
+	case ELE_GET_FW_STATUS_REQ: return 0;
+	case ELE_XIP_DECRYPT_REQ: return 0;
+	case ELE_WRITE_FUSE: return 0;
+	case ELE_GET_INFO_REQ: return 0;
+	case ELE_DEV_ATTEST_REQ: return 0;
+	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
+	case ELE_READ_SHADOW_FUSE_REQ: return 0;
+	default:
+		return -EACCES;
+	}
+}
+
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 {
 	struct se_api_msg *tx_msg = NULL;
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 8e5b015e99a2..f8fabac331fd 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -15,6 +15,24 @@
 
 #define ELE_NONE_VAL			0x0
 
+
+#define ELE_OEM_AUTH_CONTAINER_REQ	0x87
+#define ELE_OEM_VERIFY_IMAGE_REQ	0x88
+#define ELE_OEM_REL_CONTAINER_REQ	0x89
+#define ELE_FW_LIFE_CYCLE_REQ		0x95
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_GET_FW_VERS_REQ		0x9d
+#define ELE_RETURN_LIFE_CYCLE_REQ	0xa0
+#define ELE_GET_EVENT_REQ		0xa2
+#define ELE_COMMIT_REQ			0xa8
+#define ELE_GEN_KEY_BLOB_REQ		0xaf
+#define ELE_GET_FW_STATUS_REQ		0xc5
+#define ELE_XIP_DECRYPT_REQ		0xc6
+#define ELE_WRITE_FUSE                  0xd6
+#define ELE_DEV_ATTEST_REQ              0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
+#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
@@ -92,4 +110,6 @@ int ele_service_swap(struct se_if_priv *priv, phys_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 			phys_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index fcd0f561d72d..78440f62bf92 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -6,6 +6,23 @@
 #include "ele_base_msg.h"
 #include "ele_common.h"
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
+{
+	if (!header->size || header->size > MAX_WORD_SIZE)
+		return -EINVAL;
+
+	if (header->tag != priv->if_defs->cmd_tag &&
+	    header->tag != priv->if_defs->rsp_tag)
+		return -EINVAL;
+
+	if (header->ver == priv->if_defs->base_api_ver)
+		return ele_uapi_allowed_base_cmd(priv, header);
+	else if (header->ver == priv->if_defs->fw_api_ver)
+		return 0;
+
+	return -EINVAL;
+}
+
 /*
  * se_get_msg_chksum() - to calculate checksum word by word.
  *
@@ -42,15 +59,22 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 timeout_ms)
+{
+	priv->se_rcv_msg_timeout_ms = timeout_ms;
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
-	unsigned long timeout;
+	unsigned long timeout_ms;
 	int ret;
 
 	do {
-		timeout = MAX_SCHEDULE_TIMEOUT;
+		timeout_ms = MAX_SCHEDULE_TIMEOUT;
+		if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
+			timeout_ms = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
 
-		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
+		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout_ms);
 		if (ret == -ERESTARTSYS) {
 			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
 				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
@@ -59,6 +83,13 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			ret = -EINTR;
 			break;
 		}
+		if (ret == 0) {
+			ret = -ETIMEDOUT;
+			dev_err(dev_ctx->priv->dev,
+				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
+				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
+			break;
+		}
 		ret = se_clbk_hdl->rx_msg_sz;
 		break;
 	} while (ret < 0);
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 5bac14439d7d..bdc13d1b715d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -12,6 +12,11 @@
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
+#define SE_RCV_MSG_LONG_TIMEOUT		5000000
+
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -42,4 +47,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 63562a4d9a3e..33afbdc752da 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
@@ -32,12 +33,6 @@
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
 	const u8 *seco_fw_nm_in_rfs;
@@ -130,6 +125,13 @@ char *get_se_if_name(u8 se_if_id)
 	return NULL;
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
+
+	return se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &var_se_info.load_fw;
@@ -203,8 +205,213 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	phys_addr_t se_fw_phyaddr;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/* allocate buffer to store the SE FW */
+	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_phyaddr, GFP_KERNEL);
+	if (!se_fw_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	memcpy(se_fw_buf, fw->data, fw->size);
+	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error %pe: Authenticate & load SE firmware %s.",
+			ERR_PTR(ret), se_img_file_to_load);
+		ret = -EPERM;
+	}
+	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_phyaddr);
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+				      struct se_ioctl_setup_iobuf *io,
+				      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc;
+
+	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return 0;
+}
+
+/* interface for managed res to unregister a character device */
+static void if_misc_deregister(void *miscdevice)
+{
+	misc_deregister(miscdevice);
+}
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	struct se_if_device_ctx *dev_ctx;
 	int ret = 0;
@@ -220,12 +427,520 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		return -ENOMEM;
 
+	mutex_init(&dev_ctx->fops_lock);
+
 	dev_ctx->priv = priv;
 	*new_dev_ctx = dev_ctx;
 
+	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
+	if (!dev_ctx->miscdev) {
+		*new_dev_ctx = NULL;
+		return -ENOMEM;
+	}
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to register misc device.");
+
+	ret = devm_add_action_or_reset(priv->dev, if_misc_deregister, dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to add action to the misc-dev.");
 	return ret;
 }
 
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+	priv->active_devctx_count++;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    u64 arg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_api_msg *tx_msg = NULL;
+	struct se_api_msg *rx_msg = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
+	if (err)
+		goto exit;
+
+	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			     cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			err = -EPERM;
+			goto exit;
+		}
+	}
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0)
+		goto exit;
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+exit:
+
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
+			 sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	kfree(tx_msg);
+	kfree(rx_msg);
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				u64 arg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					u64 arg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += round_up(io.length, 8u);
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			return -EFAULT;
+		}
+	}
+
+	err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
+	if (err < 0)
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx, u64 arg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_api_msg *tx_msg = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
+			return -EINVAL;
+
+		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)buf);
+		if (err)
+			return err;
+
+		if (size < SE_MU_HDR_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
+				dev_ctx->devname, size, SE_MU_HDR_SZ);
+			return -ENOSPC;
+		}
+
+		tx_msg = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		kfree(tx_msg);
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			err = -EINVAL;
+			goto exit;
+		}
+
+		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+		if (err < 0) {
+			dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal."
+				"Current active dev-ctx count = %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+			goto exit;
+		}
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0)
+			goto exit;
+
+		/* Copy data from the buffer */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     priv->cmd_receiver_clbk_hdl.rx_msg,
+				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+				     false);
+
+		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
+				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
+			dev_err(priv->dev, "%s: Failed to copy to user.",
+				dev_ctx->devname);
+			err = -EFAULT;
+		} else {
+			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
+		}
+exit:
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+		return err;
+	}
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	priv = dev_get_drvdata(miscdev->parent);
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
+		priv->dev_ctx_mono_count++;
+		err = init_device_context(priv,
+					  priv->dev_ctx_mono_count ?
+					  priv->dev_ctx_mono_count
+					  : priv->dev_ctx_mono_count++,
+					  &dev_ctx);
+		if (err)
+			dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		else
+			fp->private_data = dev_ctx;
+
+		return err;
+	}
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		/* check if this device was registered as command receiver. */
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+			priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+			kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+			priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+		}
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		cleanup_se_shared_mem(dev_ctx);
+
+		priv->active_devctx_count--;
+		list_del(&dev_ctx->link);
+
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+	}
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV:
+			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+					priv->cmd_receiver_clbk_hdl.rx_msg =
+						kzalloc(MAX_NVM_MSG_LEN,
+							GFP_KERNEL);
+					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+						err = -ENOMEM;
+						break;
+					}
+				}
+				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
+				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
+				err = 0;
+			} else {
+				err = -EBUSY;
+			}
+			break;
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, arg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
+			break;
+		default:
+			err = -EINVAL;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -246,7 +961,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
 	if (ret)
 		return dev_err_probe(dev, -EPERM,
-				     "Failed to add-action for removal of mbox: %s\n",
+				     "Failed to add-action for removal of mbox: %s.",
 				     name);
 	*chan = t_chan;
 
@@ -255,6 +970,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 
 static void se_if_probe_cleanup(void *plat_dev)
 {
+	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct se_fw_load_info *load_fw;
 	struct device *dev = &pdev->dev;
@@ -279,6 +995,13 @@ static void se_if_probe_cleanup(void *plat_dev)
 		load_fw->imem.buf = NULL;
 	}
 
+	if (priv->dev_ctx_mono_count) {
+		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
+			list_del(&dev_ctx->link);
+			priv->active_devctx_count--;
+		}
+	}
+
 	/*
 	 * No need to check, if reserved memory is allocated
 	 * before calling for its release. Or clearing the
@@ -319,6 +1042,7 @@ static int se_if_probe(struct platform_device *pdev)
 	priv->se_mb_cl.tx_block		= false;
 	priv->se_mb_cl.knows_txdone	= true;
 	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 
 	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
 	if (ret)
@@ -340,6 +1064,7 @@ static int se_if_probe(struct platform_device *pdev)
 					     "Unable to get sram pool = %s.",
 					     if_node->pool_name);
 	}
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	if (if_node->reserved_dma_ranges) {
 		ret = of_reserved_mem_device_init(dev);
@@ -348,7 +1073,7 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -389,6 +1114,7 @@ static int se_suspend(struct device *dev)
 	struct se_fw_load_info *load_fw;
 	int ret = 0;
 
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 	load_fw = get_load_fw_instance(priv);
 
 	if (load_fw->imem_mgmt) {
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b5e7705e2f26..5fcdcfe3e8e5 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -14,6 +14,7 @@
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
@@ -37,10 +38,38 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -89,6 +118,10 @@ struct se_if_priv {
 	const struct se_if_defines *if_defs;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+	u32 se_rcv_msg_timeout_ms;
 };
 
 char *get_se_if_name(u8 se_if_id);
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..0c948bdc8c26
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0

