Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021073.outbound.protection.outlook.com [52.101.65.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B693148C3
	for <imx@lists.linux.dev>; Sat, 27 Dec 2025 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.73
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766841866; cv=fail; b=Rz+vLkJ0CpnWycrfDyViYtzWdbteCG6it9H3U76N8QhSYuT+6uEks/jNDw+MbCnGFlVh2IX8els54pIy4Z8eVnPuS3QR4hUn7fswHzKA2EMVGKGo8IoVEgD3ju03E5DHAc0/6KpJTOsW6sHhICTiMGbI5tSYNRMgVRqn2y8/QfQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766841866; c=relaxed/simple;
	bh=8DGIoQsL+TyW34v1MxAPkfDcmQ4HH4MdRzgRGxEXbcA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ESVR4JJ6TQHopbZVOjKVd0RU/5H9A3/9Z4FgcH8c/tFKcfsOMmrlus8GFIx3TxMHVdSPQKo8EG4NMi5IYh7ESYzXhKQblHE6x+R7g7irAnzc+FOep2w5iOYd6hSmRL37dNWIwOZ443kskiwsI0eWcf7ISC68mL5Q5zU1OZsRbWU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=H7CwxTqw; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=H7CwxTqw; arc=fail smtp.client-ip=52.101.65.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="H7CwxTqw";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="H7CwxTqw"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F6vBJhrWm0eKE2MrLyKEuU18Etwfn649DqrvDWMX3gflj1I1bxRp1Y0+rGrjYyfPfbbcbgNYGPEX++/SjFhCQolA60VM0RQE4L3usuT9FPcItyhE0JRNHwkN1JPYY1hzXPxTh46iWpiufBn33YFAV+SXOLB7kR1B5a1Lyt4aBKSZG1oYV9T936TE20xIPShcUQY5J+AptOHTLGgJxhZKEtHnX0NKAk58ghxdBg32sNx12GcBshmHgPfs1yILSLYvh5YPc3m+lFQCXJcljnriyiM7GbXvGOS7Ia8X6eKMJNk1zQGFBo0cJa+OWnDhonGrLyL954yrNpq2ADG32scycQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pWXCRU8hGjAPv1iZv/n8Sxbjeicm2WZzIfAlOdI87k=;
 b=Jtn4khX+gpBJYsAPgQTbdHaa519NkqrNAC8Va8tKOhxpcZbglI45mWtzYJ1JYrw2NdByDv+ELNd3dQpyvBIkuYd0gw9/MxqaOxZ0PFiAUFRoBwJ+zWG/iqXOfyQj05Ega059wBUhCABRXr9OOAxC+8kYHF90B5Q5qtskBmz/4fpXOdgDpC21aFvq3L1T2F5CPtqA9aCRRAnUh1QT75JnF08uDTWtw1AOr7NWy/tEr+Ar40TzAfkcccU3/BJavn49Gf2q1C5qcPjHmQVw2Ebo1v9VOi48/62TyRlOQl23I3TDgHFVJU5YXbgmCYdHWGlYA7fBJHG3NxSzCl9GC2hcTQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pWXCRU8hGjAPv1iZv/n8Sxbjeicm2WZzIfAlOdI87k=;
 b=H7CwxTqw/HsZbjv5fFIuG3zFaeXLC4ZKzo6liGMZzORNYIka15PX0yWa1KQzciZoktwbF3/WhuAWvi8+yd1S3GliI8BYfqcE2cxOy36+7ADXMUq+2TxF5MguaFDE7yXxZ+oGekfZOHXkUuqoZ4sz+J92lV/uKVxINc5Rc9GhJsU=
Received: from CWLP265CA0358.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::34)
 by AS8PR04MB7685.eurprd04.prod.outlook.com (2603:10a6:20b:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 13:24:20 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::7a) by CWLP265CA0358.outlook.office365.com
 (2603:10a6:401:5a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.13 via Frontend Transport; Sat,
 27 Dec 2025 13:24:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sat, 27 Dec 2025 13:24:20 +0000
Received: from emails-7453405-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-64.eu-west-1.compute.internal [10.20.5.64])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E1A6580066;
	Sat, 27 Dec 2025 13:24:19 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766841859; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=3pWXCRU8hGjAPv1iZv/n8Sxbjeicm2WZzIfAlOdI87k=;
 b=XFd8r3OX9cDsXDRw1hcvEoAzFzTGqBBYJD4eJIeHRd/4dLEfHxZgK4psf1hW4ekHCPQ3q
 BxDNSXPjgrKAuuM69hvOJ1ihUxMlFoLyb2gLazIo+eQIgBDvm6g9gT3vYQSoF4msO6SMC/w
 LL/fOzH+twmejdp1pX7n9rF+Z3+nHlU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766841859;
 b=inNZDsxkg06uyvY2dY74i7+d0wzKZ32qRiPeKxSd4ncZYlZXna88t2xBI6hDTasfHqSZD
 tyud20E3p2UuemG1vKU5rAc/U4B6MqfRvyJ5mwLg5AK+l1SY/UZTkaS4fqkp6JAg/3hfKhT
 u6hd2KjclOq9lP8G/hmml1XIy5FDoAg=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVZA3+kO1/215tmJdwgWIGiBrpM2fq4PRsf/Dsgn/DCyM83bcs3GiiTGUPJ7BSTcEccpSoAp1ocPpKwg+L9UdnsGvXcHMX+iWUytP3yywuPzTWoSu82houU/mkw+zWjJVAd23PfujQNaRmsTK3nUYlEIey72VDpLRBgh1UlYpIrfKlk1Rel5MMmDlcH7xtUGfY8xzUf5jzzYwNrOi0VyHCOYUWIHGyjCdxtBJSlS+N9MdArPbsAAk5Xw9z4CVDXBjxiYjn4jibLRzbpQGn+yQwzQ+2fQldy31YM6FLJjPq9ohCFr4CBqxA3n42pLbr3kMV6p/dAFElEKvC+beONaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pWXCRU8hGjAPv1iZv/n8Sxbjeicm2WZzIfAlOdI87k=;
 b=XOYqTN9SuQ9vOCgUj+pCWCmYiKy4W07oN4ECeEO8k2OeiVWvj75NEwJ7blHiSwA/FixnyxfU8S9jBxgYvIfx/3hK5fX8Zef/+oBhJULZ2LqrweLzg9xuMxrS5KQg7pA0tSBf3kf7OuBm2m1W25Y3aSi37K3QUXHoRHghFhRA5X9nyrtDae2KiCjOdy2qbDZycx5EHAnrs5VQ42vGM1um7qCq+Umt1aGoBQr18d4nRNME0HM6KDO5x908y9zCoQY4R2kPTnKw30oQNLkNJ64scoo8Vo9ssFSYApVaEqq3bgDPFLQs7fmcbsjoZM6INCYWzuCcfJE7BXwiaSIMmi1pGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pWXCRU8hGjAPv1iZv/n8Sxbjeicm2WZzIfAlOdI87k=;
 b=H7CwxTqw/HsZbjv5fFIuG3zFaeXLC4ZKzo6liGMZzORNYIka15PX0yWa1KQzciZoktwbF3/WhuAWvi8+yd1S3GliI8BYfqcE2cxOy36+7ADXMUq+2TxF5MguaFDE7yXxZ+oGekfZOHXkUuqoZ4sz+J92lV/uKVxINc5Rc9GhJsU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 13:24:10 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.008; Sat, 27 Dec 2025
 13:24:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 27 Dec 2025 14:24:05 +0100
Subject: [PATCH] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-armv45defconfig-fix-v1-1-d7b64abda9fe@solid-run.com>
X-B4-Tracking: v=1; b=H4sIAPXdT2kC/x2MQQqAIBAAvxJ7TkjRtL4SHURX20MWChGIf086z
 sBMhYKZsMA6VMj4UKErdeDjAO6wKSIj3xnEJBQXQjObz0cqj8FdKVBkgV62BMPNbKVTTkMv74x
 d/9dtb+0DMN4P22UAAAA=
X-Change-ID: 20251227-armv45defconfig-fix-9f8186a4c5c7
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM8PR04MB7396:EE_|AMS0EPF00000193:EE_|AS8PR04MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: c26af650-7ee0-4107-bdcf-08de454b3e4e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y3FMZXQ3bllOM2ZaT3V1cllIeGRwNlQxWXNSZVFGczFoRDE2NmphYlM3d0FY?=
 =?utf-8?B?SWFnc1F3aENXWW13cUZBSUJtK1JYekNoVGJpN1JHWjdiYTQzcWxQZWo5SUE3?=
 =?utf-8?B?TjB4cVBXZW5GWktMd3lXYmlZd0lzTmRmSHROQjB0dVZLeXZadm5mSHJSZzM0?=
 =?utf-8?B?bjNoZzZwZE8xcFQ5MTh0bWlaSkFnNXdVY0tOamxHaHhGM09FZ0p4bURtZm1L?=
 =?utf-8?B?VFArcWVmRlVNdmIwWUlpa3U0QnlUbnh4dTdtR1h2cFY0dVpScENBeEIvWC8w?=
 =?utf-8?B?WU82SVhwejhFSUFwRW9GV0dadGh6UVRrT2hRRVcrN0x0aFBwSzNTZ2xpOGRi?=
 =?utf-8?B?SStZTDBZZDNBMkFRVWxQT2FsbVY3T2l6UHRRZ1hNSjRDamlZd1FodEFrN3FT?=
 =?utf-8?B?b1ZsQlZDUCtRTWo4QURnMVBZY1JBdmdWUEp6SEl6WnBKa3BDalFNc2RRWFh2?=
 =?utf-8?B?RWxFWnppQm5xUXJLNEtsWStudkN0QVl6dnJoTExCUE5qckozY0JaZGpGK2hZ?=
 =?utf-8?B?amlXQmxTYUVEdmZQSTEvV0g0NDZIa0hLTitYSTF1dlVJTU1qN1JNVjZMQ2VP?=
 =?utf-8?B?UUptbTl4NUJhandqYzNhVS90UlFOR1R3L216ZDdvVk9aeEFYSXUva25QNis3?=
 =?utf-8?B?bUtvMDAyU3BZNGltZHRkZE8rTTRyRXpjc0c1LzB4eTJ3MXBMdnFhejFvQlJB?=
 =?utf-8?B?WjNpMW8ydndqM1dIRFRFazVSVkJJWDdzRTVjNXd0RURjQlVvYzFQZmxqN1dK?=
 =?utf-8?B?NFdlTDZpZ2FPakZCaTRYODdxdThmcXJaRHV3bUZuQmttTkxYdXhPTUNTMlYv?=
 =?utf-8?B?WXM4dGVpSElRRGZYT2RZYk5sUFpwSGp3dmx5QWlsSUZxVEMrWmt3LzJXNnQ2?=
 =?utf-8?B?ZzhkVDk0RGNqNW0zemtFdGdWUnZrTURvNGdkQTRuVWxDVUlFVDY0L2NsV0J4?=
 =?utf-8?B?Q2dQYmNLR29na2dLQUE4Vmd4UG1YNURwL2tVa28xTGtUZTY5MjBPZUNKYTVW?=
 =?utf-8?B?Vm1oSmtLa2l3UGE2aEhuZHAwSnNtckJ6amtxdng0N1FLcWhYMThnOVk0UjU4?=
 =?utf-8?B?My8zNXhka3hMZDFBSldiaTI4aXRKdmd6OXBSWllpbm9EY2FXeU5RcnJRakph?=
 =?utf-8?B?UXVYM2tmQ2hhVVUxSW00VVhCRjN2eFg0aSs2RmNJb1p1SDV4cklZV2QxT0ph?=
 =?utf-8?B?c0FaTlkvZlJDSzl5T09ScVUxVDlDUkZWSjE5bFJ2eDBEV3ZoNzJRbkh3Z2lD?=
 =?utf-8?B?WEpYVHl2NnN0K3ErMXZUajd4dGhZYUZIRUxrdVR2bXFyams2UktqWXpaSmYw?=
 =?utf-8?B?N25MYWZDL1JWQnVQaEpMVUhVdThPbW1rSXhORDJlU3NLRDUwcEQzZ3dMa1Mr?=
 =?utf-8?B?S2JCVnRwOFk1Ylk1YU44aURwWGVDNGlVamlHY29DWTQ2a3hjRVF5S01uZG9w?=
 =?utf-8?B?K05QcEFCZ1g1dEhjQWFXSnA2eTBJVC94c0hFU1VpVFpEVGhRQWc2Y3JHVEhB?=
 =?utf-8?B?dlBNQTI1ZnRORmVaV3NnbktIZ2daVGlVNVNuajNjRVZlSUtJMkhuOS9jcE9m?=
 =?utf-8?B?RkZZSW4wVEZRQ1VOWjk3ME1abWFQNTVjZXFqYjJHL3NuRERsRjQrUGJZWmZ2?=
 =?utf-8?B?Y3VKTmM5UTB6WkdvL21pZG0vQlg1bjhkcS91N21yeTY1a3NjK3VTME5BVUJH?=
 =?utf-8?B?U2JGMG0rNVQzc2ZtRm85SEFNVzlRYURuVVA0Y3VFVlkzS0I2RldBRitReG1S?=
 =?utf-8?B?Ykx0Z1R1aG5IY3kxazlBaWtxckJMazZXOU0vbm5IM1hhUkpOc2l6cDZieHF2?=
 =?utf-8?B?cHBKc2REcEJYMlVDVXJrYjVJL1FuMXBLUGJoOUJZZ2xUazExRGQ1WVJFUUZi?=
 =?utf-8?B?K0Mzd1d4emlqc1pQaG54WGtTcDgrVUNhUnd0cC9OdGlHdW5MaytWc0VrUFZ6?=
 =?utf-8?B?a2xaMEVqOWM4YUFqSm9nd2ovNzFla2lManlFWTZBQldKdmZDNGZ5Y2JaNExk?=
 =?utf-8?B?cUxnQWIwVGVUZkVmZkZKY1Q4NkYvdUtvMFBiOHNlbVpCMjU0WVA2OStkNVR5?=
 =?utf-8?Q?AraumN?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6c91a5623e054f888463d3ab72e4843c:solidrun,office365_emails,sent,inline:793754f4572fbebc58b94758232fadd7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a58742ee-2a97-448c-07c4-08de454b3840
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjBJSjVqem8vRHg1VndiT1hHVUIvVmxrRVVqL1VDemZIWVphQXR0NU1ZK3VQ?=
 =?utf-8?B?TFc1V3pCTldGKzFVMFlzcTBXckRKQ0M2N05SU3hMM2hXRUxVT0p4R2lJK1NO?=
 =?utf-8?B?SFFCWmR0MStES0VJbDNONlliQUZKbjdIUFJnODRhbEhqd013LzBzUk5Scmtq?=
 =?utf-8?B?ck9DVXdwbm9Ialp0WUM1TVMxa3dHaHdUcEVFMlZJYjdoY2JVNzdLM3RLSXpF?=
 =?utf-8?B?Z2tNRWZ4NkJmcUE3dXJ5cEJGWFFrSzAwK2dFM2NCQ1FmSDh4K0R0eE1pakti?=
 =?utf-8?B?RGhWK0psNU9tWmtjRXowQXpDdHVrSFhrd3VjSHByOTVRRllBZlpjdURKQXAz?=
 =?utf-8?B?MVlLWEk2WWZhNGlRRmIvcXBORkRVR2d1bXJqbzYyVzlIRk1jSzdweFBhM0F6?=
 =?utf-8?B?S3pvSHdTQkVPKzB2aUNrMk9sZURZbVZrYWdjdnhJSFdIUnozSVpPWDBPd2FG?=
 =?utf-8?B?WFZreTBMSFlEUzU1SGs1S2NpMDExWGRwMXl2ajdxT0RaWUE2TXdNVytYT0tu?=
 =?utf-8?B?SjkyYW4wT1dRYXQwY3ZZOC8ySjYzVXByMzlmYi94bFpjT1JVMHcxWUt2SC9H?=
 =?utf-8?B?N1VocWd3WC9LbWY0S3oxbVhsMVMxV29zMEpMWmFkRm5wWS9xeXd1bS9aZzMv?=
 =?utf-8?B?VnJnUG5NR2dQZDVTTWo3bElYSldMcmU2SmE2Q1M5WlIrY2RRamExWW9kS1dq?=
 =?utf-8?B?MVpPdnpOeE1GSmhONXJvaU1jaUJNMG5xNXZ3Witadmdxbk9SbFBwaDJaU0RN?=
 =?utf-8?B?N3EvaHFrWEZjTi9qQ2RXT1I3Ylhsakg3ODk4SkFad2w4TU4wVTNHRGxDa01m?=
 =?utf-8?B?MnhYTytTSG5kWmlXcFF1RFU1c2duR0J2bWJMcm9CZ0tUSE5nMHNja2t6VXFo?=
 =?utf-8?B?RUo0Y0s2RVJoaldaWTR6UllFMXpFVXNvaTJ2Umk3eVF1OWpYblNINTJuNzA4?=
 =?utf-8?B?NHhwMTFlN1QwbTUrTnkrU2xFOU9JV1huMW5LUUFGMlNJaUYvd1cxa3doT2RW?=
 =?utf-8?B?eG16cEhvTGpzMHk3UE1HZGwvcXdCU1QvWTBMTHBwc05NZG9YREJjR1VybGpx?=
 =?utf-8?B?OEQvVWdUbGhQMlRFYlAyM1g2ckVRSG9mdzFLdnljeDlPYUswMFhDTzdUUTZQ?=
 =?utf-8?B?MXk4ZVBpWU11RUMzaDI2TmZvS1pFYmMxVjZML0ljU09DN21SeHE3blZNblg5?=
 =?utf-8?B?Y0ZWN1RkcEF1TkJoSW45YkZ4ZGl0VDVxRnJOekhENjI5d1NjcHYvTFJrOUFJ?=
 =?utf-8?B?dHZSaUVVcEM5cUYxSjgyTFAyY204VTQ4QXpObzQ2UjVBb0IxaEsxMStmcmg3?=
 =?utf-8?B?b253OVBBUXozZzRyUG9BcmRWWGJVcTlsU295QnppemhPU0pPS0ZDVmVRZmkw?=
 =?utf-8?B?NDc4Zk5QaExkeThIOS92Nk1MVTFML0w1MGRvQUs5TXNjYURIeWw3TTF6eTU2?=
 =?utf-8?B?MUk0NGVhME5HM2dhQThIeHJ0Rmx6bjljSWE5UXJrMkJVeW5Jcnphdlh1UGtn?=
 =?utf-8?B?N29OTkVRbmVDSUF4YWRwaEJvZWpNdGdBd0M4RnZzQ2kyaTVyUzJIWi9CcDdz?=
 =?utf-8?B?T3BKOHN4VldOVGMwQjFPOG5FTzYrdEkySFJnS2JyZ2VSa2R1Y3dnOXNuNHdP?=
 =?utf-8?B?dUhnK21rQlhIQXVqTy8wMUlMWHgxZGQxSlV6ZldaazhzVFVJdkRmMjNuVzBU?=
 =?utf-8?B?dFNhdXFIUDlNSG5IQ2FTejlvVVNMOThxekxNcHpGVlplVXAyTXYrTDNia1p6?=
 =?utf-8?B?NFlqSEhYOVRNbXpBT1VOZ2haMElvQlpXYytNMFk2TzM5Znh3VGZkdXhrR2lE?=
 =?utf-8?B?YjA2TDRScytReG11T2RzTy9BSytlM2tSSXJBOXRrVjNSZ3NjTFY0cTN6czVm?=
 =?utf-8?B?dm9ZZmRrQVhJYk9LbVFoeUE3bjZpc0pUdU5mK3JMd3pXUUo0WDlpaURBdTFL?=
 =?utf-8?B?cWh2cmo4SGdWK2gzZWthM1RKeUE2WjFVUmtJZ2UxN3Q4NGt3emJGQU8wSmpS?=
 =?utf-8?B?QTJVVHFlK2dqYm0vdWJEN3ZERkxPbGlNSmVpYWxkaGJ2cFplTEhBZyt1RTh5?=
 =?utf-8?B?dnJzSmMweEh0WlBCblRybWIrNXBuZ25sMzVNQT09?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 13:24:20.2389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26af650-7ee0-4107-bdcf-08de454b3e4e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7685

The i.MX5/6 defconfig has gone out of sync with some dead options, some
removed and some missing.

1. Add missing options no longer enabled by default:
- CONFIG_I2C=y
- CONFIG_LCD_CLASS_DEVICE=y

2. Remove options enabled by default:
- CONFIG_CS89x0=y
- CONFIG_MEDIA_CAMERA_SUPPORT=y

3. Remove options that have no effect:
- # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
- # CONFIG_INET_XFRM_MODE_TUNNEL is not set
- # CONFIG_INET_XFRM_MODE_BEET is not set

4. Remove options that have been removed completely from the kernel:
- CONFIG_USB_EHCI_MXC=y
  Removed by commit e7018751d2e6 ("usb: host: ehci-mxc: Remove the
driver").
- CONFIG_SMC911X=y
  Removed by commit a2fd08448f2b ("net: remove smc911x driver").
- -CONFIG_SND_SOC_MX27VIS_AIC32X4=y
  Removed by commit 3fbb01fb583f ("ASoC: mx27vis-aic32x4: Remove unused
driver").
- CONFIG_SND_SOC_PHYCORE_AC97=y
  Removed by commit 440534a0ecfd ("ASoC: phycore-ac97: Remove unused
driver").
- CONFIG_SND_SOC_IMX_MC13783=y
  Removed by commit 83e7e2278680 ("ASoC: imx-mc13783: Remove unused
driver").

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm/configs/imx_v4_v5_defconfig | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7d..9139d1784c708 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -29,9 +29,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
@@ -58,11 +55,9 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_IMX=y
 CONFIG_NETDEVICES=y
-CONFIG_CS89x0=y
 CONFIG_CS89x0_PLATFORM=y
 CONFIG_DM9000=y
 CONFIG_SMC91X=y
-CONFIG_SMC911X=y
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
 CONFIG_INPUT_EVDEV=y
@@ -78,6 +73,7 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_IMX=y
 CONFIG_SPI=y
@@ -100,12 +96,12 @@ CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CODA=y
 CONFIG_FB=y
 CONFIG_FB_IMX=y
+CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_L4F00242T03=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -115,16 +111,12 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_IMX_SOC=y
-CONFIG_SND_SOC_MX27VIS_AIC32X4=y
-CONFIG_SND_SOC_PHYCORE_AC97=y
 CONFIG_SND_SOC_EUKREA_TLV320=y
-CONFIG_SND_SOC_IMX_MC13783=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_SGTL5000=y
 CONFIG_USB_HID=m
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MXC=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251227-armv45defconfig-fix-9f8186a4c5c7

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


