Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022109.outbound.protection.outlook.com [52.101.66.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF0A248F47
	for <imx@lists.linux.dev>; Sun,  4 Jan 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.109
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767519556; cv=fail; b=VZQTaRd+w7ANF9MNKNo+18QpMqPDz1BMn7VFPmKcG2jWwqj3BqHwc3qL7QFTdrpqx+rKAxU3EtHJcCh+l6/qBClAKLVmDnxORp1bMaE2f2FExrcYJcK9QlNpkK2+9PuC8rMGe1YauppigY9VwYLRbdrniNyu8AwtZlM3yU38u3o=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767519556; c=relaxed/simple;
	bh=r+IenfrcFDo4HRzDbEiAiGkd16PFE8CD6hyRGIkApu0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=YbhF5GClx7+E+/ocp91TMn08XiYEkCxgmE2eRklCg1vUDiQGomYXog5s2jRdeAe+6e2muwz3/hK4bge0P3mm8wh6R9n3xq4vFEyQWPiZGY9tSqT3goOyM1EJeyPODagH31RDYKCaI5FNwV02Wfz7Hi24VuzxxRroy0TiPCFcOWw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=foXMBzMV; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=foXMBzMV; arc=fail smtp.client-ip=52.101.66.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="foXMBzMV";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="foXMBzMV"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W5hjbhekmxdI3OV+EkFvJSrIIimlR2c6KPyMVpOz8Dv2Jfl2vFW1FY2ycXy+VZ9Ae9w4TyLdRhZpY1++jJnPQjhj44d17UKBVKL0NicVPwP+o5Oi1gUEzhe7CqakBKGE+Y1JVqZ7/nXGuL5XFUZOiSXQUQTYB9P3MC8A2Ayu1XBa1qBsDT6LynxlRGQ1P2v05BLMFat7Xgnmgyio1q6p8Pm/PrblrOE63gSwsRsRZzBS5idyIrYsTZ7UmFRie6E7bhjTZEHK2MpLoo2RpP1hSIAGML9X3Ld1XgmmauSWjUicnszOJkpo87PoreOk7MNEnnuIBkm/5OdhU+cwdUev3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QJCpaLrzNWPUygreraVxBI3Iif+CESagiRgAczt/vY=;
 b=wAsepCaM0fmz60NQ+9Meoz4wgHqs8fvnoG9jWEOb86fKaVm0Z8euqcpA2FVkfjhtHnDrsk2NGsWXI8kd5celJe7hmiGCn07ImK24kiI0IXITO6Rvjc4h38QRg6476NunM1AIFGzG+IPFfADU+UW86YZqEsNTNHq5HVO3oog6bgMifeNnzBHgolVeQmhkTBvdmbLFBL+x7WWZvLjHw2begO8fUwnHoRbj/b7/73IPRN3frt83zA+c0NX1bAV/xLhQxATKqPZyvZqLDBOFeB+XIB/xwNsxAyuNKk9mjmH+71UZ9QN5LTQFkmQb4XU9aEOGB7GZ2HuK72tsIALfyGvCRg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QJCpaLrzNWPUygreraVxBI3Iif+CESagiRgAczt/vY=;
 b=foXMBzMVpX1+xWqUYhMm5lzKwvT6OGWzU6l/wJ8D11yRmBbrUBHfrFZXzIK+5N9Uz/ugt26cMhNIXmkLuytyd4big6w5NA8l+kvgLs/NI5cfk94FOD5BQcWvE5QtuqTfeSmCBETVPDWdDRnK3GvV/pjA/E1N9rAjTAhiG+fiI2k=
Received: from DUZPR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::10) by MRWPR04MB12306.eurprd04.prod.outlook.com
 (2603:10a6:501:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 09:39:10 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::6a) by DUZPR01CA0019.outlook.office365.com
 (2603:10a6:10:46b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 09:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Sun, 4 Jan 2026 09:39:10 +0000
Received: from emails-2380752-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-114.eu-west-1.compute.internal [10.20.6.114])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8ACA580076;
	Sun,  4 Jan 2026 09:39:10 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767519550; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4QJCpaLrzNWPUygreraVxBI3Iif+CESagiRgAczt/vY=;
 b=XVeRwYs4k2f+pAHbAMwbhF0YYHjZ1LGcTbF9NdfdoTzywkDTHcadudYO0sIkRKp5w5UfO
 9iOmOvVnB0p2eCAwSEzZbc0EFgBy5gNF8AAtHGknoCbxx53x2IFSkygnL/w4OqJqzG9YWpx
 xcNYBR1+iPEjizqteOp7o9204CaK7q0=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767519550;
 b=AB+IMjuum0Rwsl5nLkkheceHpuLIT3jlm1ZNg2jHj9vZepQDu+DtWHw8gxD/E9xWZC35D
 KvWNwrg0OhNkDEBfttPUflvaHiJRyg43ocbgNz8kG50sGAvnsag1ha+WzIOY7UqwCWL2Atv
 UyJS2tEdN6OcKfgNt/OczR07biYPLqQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oienyH7AI/Yvr+zYi3Fd2aHaUCaVoRMYsHDEV+pN7B1aVh45aGYha3f3sOGcn3KeNAEJJqnCiFteW0DF+rrjsEd0G8CtmFDduzQ9kPohbwbu8zjJ6nSejQ5YJZp3klhfG17mNdnLqmS8tSbLtE+jchv7OixaggbVi9m/1NjX0Ui5b2w/y+o6BzI/c3pL0lZpsM0ZnxaYstX7NQFXMdSL24KN3eignoFqbIC+i6U2aP2SPfsU7RmsJeuKQYHbawKRAP1dVmy7Vm408Kc7utrpGXAKAhpf3cE6Uvhhf3x2lYIMkSgHLALD1PPx8+x4on0pjlb2Ox8tVwK+wMdYvYOY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QJCpaLrzNWPUygreraVxBI3Iif+CESagiRgAczt/vY=;
 b=uxQdqdSIJE0wXoCraHCXA5aCq6NtgdZZfmCIYsM+wL2O10xHVgK8QqHDWa+R1uhbzwwTUkY95r1g4bjM/xIm88GUbRTq7P6/u+/QBT0oc1+qT75/DFV7788JMQt6cVfqc03YJO4iBA+x5Yke/FJA8cYoaSKWTY2cVSvSE9TncVniCMPVmHCiKstHutne6eDbUBVMDftX8J5RxpHXovLA2+97uEuqEWBGfmMzxoATe3xBnGyy43W8WLOw+rsNrzzxkBd9lt70vQ1RcvQ9q8X0GO7SR83l3cPzirLG+QPoroO70e4jyb2Q5uDkk1tAr83LHYz1/I/rjNs6OV7HOSG9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QJCpaLrzNWPUygreraVxBI3Iif+CESagiRgAczt/vY=;
 b=foXMBzMVpX1+xWqUYhMm5lzKwvT6OGWzU6l/wJ8D11yRmBbrUBHfrFZXzIK+5N9Uz/ugt26cMhNIXmkLuytyd4big6w5NA8l+kvgLs/NI5cfk94FOD5BQcWvE5QtuqTfeSmCBETVPDWdDRnK3GvV/pjA/E1N9rAjTAhiG+fiI2k=
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by AMBPR04MB12206.eurprd04.prod.outlook.com (2603:10a6:20b:759::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 09:39:00 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::fe8:fd92:aa32:e816]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::fe8:fd92:aa32:e816%3]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 09:39:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 04 Jan 2026 11:38:52 +0200
Subject: [PATCH v3] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260104-armv45defconfig-v3-1-f712476d44d1@solid-run.com>
X-B4-Tracking: v=1; b=H4sIACs1WmkC/3XOTQ6CMBQE4KuYrq1pH1CCK+9hWPTnFZpIa1psN
 IS7W0jcaFzOYr6ZhSSMDhM5HxYSMbvkgi+hOh6IHqUfkDpTMgEGgnHGqYxTrhuDVgdv3UC5UNK
 C4iA6TUrrHtG65y5e+5JtDBOdx4jy4zQcoP1xSolmTjk1rRK1VEZ2Fi8p3Jyh8eFPOkwbP7o0h
 /ja/2bYRv5fy1C4SjatFZ2AGtkX16/r+gaali3UAQEAAA==
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::8)
 To AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8747:EE_|AMBPR04MB12206:EE_|DB5PEPF00014B9F:EE_|MRWPR04MB12306:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cc761a-f2b4-40fe-a979-08de4b751d3a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TUtSdGZUUHBzZ21JUU1ZZ0l0NXdWQmRheFZHMnBVTTFJaDdSSm1EWEhYZDI1?=
 =?utf-8?B?RjJFREVHZm9ocjc5ZXJ5N0Nqa2g4YWkrNkljN2U5U0tCQ3QrTXFFWGdiMERu?=
 =?utf-8?B?dFBxRlB3ZElpNnFKNjdtRVJtdHRSMjRtK3NWRDcxMk1BemJtSkFJUGxrR2xP?=
 =?utf-8?B?ZzhkSjlsMHFNTUFEWkJYeFQvRGovWlZsMHV5Mjh4SENVbmhvVVNuM1VCcWhx?=
 =?utf-8?B?WEw4VDhLSUdWSWk3cDhzRXIwZk4yejFZdzV6em50NGhxZ2wxYWdiTThsejM4?=
 =?utf-8?B?WmwrcTlmWEdoN1dtZWRrWGZwdkZ1eGZGYy8wSTkwRGJzZnJsRFM5dUladjAv?=
 =?utf-8?B?MXBGc0JxdGl1RGljNGNHSG05cmxqeUthcEtYbVlyKzU1R00zTTdNSUxMME85?=
 =?utf-8?B?NFgzZ3dXazZaMjlvUFFidER4ZGk1b1lGNGFjTGNoNXFpNTZTZ09rSVZEK1VU?=
 =?utf-8?B?MmpkNmt3MDIzK1ZhUk5HWHVNM29YT3VqTDhSOEc0TGlXb3FSUEFtYzdKYzA0?=
 =?utf-8?B?bmZuelJBblBxM2NEMU5VeVZJU3hFdWhpeE0vTExtcmlaY1pDM3BOTVhmYUpY?=
 =?utf-8?B?WW0wM2JjYjFyenVjeW9pZkFCNTliQUI5aTFjbEFmS0puZnJnelVud1Eyajk1?=
 =?utf-8?B?RFZmRHFqNWduaEh1M1hMSzRLaHBNUGRyVFFkVlpMY2xIMHNYTkhta2VlYWlq?=
 =?utf-8?B?ODgxeDNVdEpNaTNadXRMM2t5eENPL0c4RWtjTWJXajQvNEY4TWJDUVR6ZlMr?=
 =?utf-8?B?dlArMXhpQ29uaFJVYUk1b2wyZUNWZzI1S2NYb2RNaDNNdGV6Zi8yajlkQUZE?=
 =?utf-8?B?eWhzTFUwQWo4ZWQyYkZyL2FRY2crK0ExVVVaM3hUNVVZMitDUDBlOTMvVjU5?=
 =?utf-8?B?VWhPU0taczdtOFdjSklWUUUzQnJTYVlBQXpaQnBrS2NrbGRxZFRUeHhFSWdB?=
 =?utf-8?B?bVY1dmFYMHJ2NHVzVEFTbGJPb09iS3BHRzFKdUI3TFMyRVFqaHNuYnVZUkU2?=
 =?utf-8?B?cGw2YnlvZm14VkpRUGhQUUIzK1Q5RWM3OElIMnVybDN4NUNUUmR6YlpKNWNP?=
 =?utf-8?B?RjZMYWZJemJaVDdXOWFnOGpDVTBkbDdCZWM0OFlpV3ZpeUVhd0UrTEdXNXd4?=
 =?utf-8?B?QUlMSGZuTE5ubVkvc1Z1emoyV204M1dmek9CRytXRFBwWkZOd21iNHN3eHpi?=
 =?utf-8?B?SlQ3SCtiMm53cW0yNzdCRzV1STUwTjVIQ1VSQm9ZR1ZTSXc4dEkwUUV6WFNi?=
 =?utf-8?B?YnRLWjhKMytNM0dySStzUjdoVUlkYkNEV1ZMTFZVOEM2V3NQWWtlUExYTFdC?=
 =?utf-8?B?VVcwSGJLVjVqZm1zL01oZitCaXFYZExUZ21WSjg3TExMRWdrYUVPRmE2Z1Rm?=
 =?utf-8?B?RG1YUm5MREJTZE8rOWEwVGtmNlowZS9FaWtYS1puOThMdlJ5d3Y4UXcveVBL?=
 =?utf-8?B?bFMxaGVLbHg2WTlyWHNVanluSDRvSm9uT0FRNlljdFNwQVlCVDRDYkVMNFFZ?=
 =?utf-8?B?MXAvQnhLaFdkQkoyQUVKTEdleEwrRnUxaFBPOFN5c0srYUR3RTRIVEdaZ2RG?=
 =?utf-8?B?dnVobXdiRGsyeDhtektBMEV0K2VoVHBuVEFsNCtNZHd6Tmo4RlJZeWtQNy9V?=
 =?utf-8?B?Z3JrMGZWYm91NC9tNm9HRWhBNlBVTmlQNUJmR1dWTnhwUUVxb2tvMTY3T0F3?=
 =?utf-8?B?QWxNeTNpMXZDVlJlM2I1eHRSYytzVkZheTNQY1JsSEYzUXgreGFSMUlnVDB5?=
 =?utf-8?B?SGIyZFVDZ2ZYM0QrQ1R6U2VLeFFaaTFFb0l2SlpMSWlZSTVySUNmRGhBc0Mx?=
 =?utf-8?B?NU9uUTZNNFZPR3VjY2NaaVJ5RVNxbVFJNSsrUjE4aUpkK24xNVc2ZjBURXV5?=
 =?utf-8?B?QVE3bFc5UWdsRkJxRGtZM2MrYXZrOHNMMG9VODIxaEhHTXcrM2dNU2ZaVkc4?=
 =?utf-8?B?NGIzRURCVnpXejR2WU0wY0swaWFyQ2lxNzNzdFdtejVXNWhTRTJ5RnRkSTYx?=
 =?utf-8?B?OUZEVFNwb2pFT3doYlROM1FuUnd6QWVBdUVXNDdjTmd2MmVZd25sS1ZrQm9j?=
 =?utf-8?Q?Wa4Je9?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12206
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 08de4925e7924b41b6ff8787bdc5e45a:solidrun,office365_emails,sent,inline:86834ad893b4e4062b4c307bcd1b53ab
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce0934d6-2ee8-45e9-ba05-08de4b751714
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjVNNjRDWCtqYzRMeGtqY1o0b0hNTWNYaHZPU0dxZlZGRlhiWmhXS05FNG5P?=
 =?utf-8?B?ZkRXVDh4QTlOakhpc2ErbGN2QXpnZGd4dGRrcnl2Q3dQSnU4Y0h4N3NFWDRa?=
 =?utf-8?B?cmZ5NitFcFQrbVk5NXV5N2xDbC9zRVBROTMyUWtPMzFGckVDcTc3R0xQOXd3?=
 =?utf-8?B?Yis3anJrNWE4MkFVVnZNVi84dndmNXUxMC9CcHVkTzZpeVhLODM4VEZodlRs?=
 =?utf-8?B?VDRPSXpyTXFxZmdqUnkwV29CZytzQnNIU3U4RFQzUWQ5a1AzUnJ3VDI1Tmh1?=
 =?utf-8?B?NjVxZDY1Vm1QelpBVXQrU1BidnljMEFnVXplZS9yNTRWRlBGQmpoQ0N5TE95?=
 =?utf-8?B?Vy9oRUU3ZmFTbzRKcEsvNnY5dm1QKzBqL1BVeG44eTcybXlrRnJFVXI1N3VJ?=
 =?utf-8?B?dGNDTG9HUTlVVUZYdHBUTEhBcnhpRE8yRHllUFIvY0VPS0lEdXF1eURmV3BP?=
 =?utf-8?B?b2pSRHkxNFJ4U20wTC84cmJtS0FVTmkrMHpiUzB0RW9zV1djdkI1b2tXZEVP?=
 =?utf-8?B?MFlVbEdFandoZzRXV3lrZzJMUlRSVjNoclNTdHVlVkszdEsvM1NQL2N6VUJL?=
 =?utf-8?B?RDRNcGJETkI0UGc4cFY1U3pNa1RSbEl1MDQ2S2lIcnVEV0FNekRMbGU5bGcx?=
 =?utf-8?B?YmQ1R3RnQVVxR0t3SVdCakpKb1RvcENPUDlHQlNoVnhwTWxsT1Q3ckg4bXlq?=
 =?utf-8?B?am05cWZqcFI4bWxhYXJ0UkRDSFAzT0JhMFJmNE5CY2xIVFc5aE9oQzBTY2VY?=
 =?utf-8?B?ZWtGOERTZTFFaDdqVU00TGJKOWNhYXczdkh4a2RDTFJPVlBvR29tMEVlaTRE?=
 =?utf-8?B?NmNEaVpZSTU2NVIyT0piKzNZdzBKc1FGem4rK1NCQ0Vrdm41V056RTI5T3pP?=
 =?utf-8?B?QlRRWC9MLzZxdE82WGdudExleVpnUVM3bHBycnV6UW5mZ3NmNGw3ZVlNSTJL?=
 =?utf-8?B?MlkzWDJ0YXBiZGxMSkVxSnpDWFMxeTRyRU1rR1ZiQWVybUdaQ1ZtSTEwVUlU?=
 =?utf-8?B?eUkzaTQ5bURKRUdPVStsanlpcEl3a3hiN3piSDJXeU4zZ2p3VHp2dXJhOHV4?=
 =?utf-8?B?MTQ4cHhlQTVHZTA4Q1ZMYnBnM1IvSzdhUnQ3UDgxK1U1Q2c0VTZ4YTMrOXpI?=
 =?utf-8?B?dG5yRVNwdE1Ia0d1TFE0RHpwUmJ3ekRzNUZzVExKSjNsZTh2eDNFYS9Nc1ps?=
 =?utf-8?B?ZHBXSnkrM3pCMVV6cVNjaHpBb2x6UWw2VThYVG81Z2k4NFMzU3ordTlCMmFj?=
 =?utf-8?B?WHdGbFRPNXg2bjMyNXl6MWw5aEQwU1JUZiszWmJZMzQybzJ1NzlBVFVmemFl?=
 =?utf-8?B?ZkdhYndYWHVKOXNtN25lRUowVUM0bXFCU1hvbFJUR0VNMkk4eUg0U0ExeVpz?=
 =?utf-8?B?blVQcFl3cFduVis4VWI0Um8yRk5ZU0VsY3Y5b2ZnOFlONUVZNkwwcHVjWWt1?=
 =?utf-8?B?T0hQaWlRb2xheWdNWW5icWoxUVZsTktYZnZMdUhabW1peHpRWHJUREVjVTdi?=
 =?utf-8?B?OHlMeEwyK3VxRmpXOXVBMW9oTmJJdUY0N3dVSjJVeTNMLzBxOXBiS3M3S1pR?=
 =?utf-8?B?bTZTVEptUXVHczZocm5MUnJ5bjgvckhNQjUzQ0VyL3kzaHpuaTlVOTJwbUFy?=
 =?utf-8?B?VzkrU2M2QUdFQUJMQWFIa29PRnRNZC9oU0ZucmR0V0pXZkI1Vk54MHZBYUt1?=
 =?utf-8?B?cVpHa0NOK1dXRi9GdDlEdUE3UUo3U2Z0SzlKTnZUYUpZdGJtZW93dEhtZnZM?=
 =?utf-8?B?OFdJWEZZSHdpZ3ViaHFnVVhYWVhRU3NtZUtPVjJqVzU3dXVHYjBSVDdJdTlY?=
 =?utf-8?B?aDJST0dGRVZXMy95NXlWTlJIa25kb01SQlNOTG9JazNWUzJSbVVGU01JZ1pl?=
 =?utf-8?B?bXR6RERqV0R2TnZ6UWNUM3U0OXNnWVp2VFdRaVRnSyt3Z2M4OVJ2a29IcFZw?=
 =?utf-8?B?NmlrVjdkNE42ZldYSmxvR0UrL0k0ME5Xd29XcCtWOXliR3huM1I5M3QyMU16?=
 =?utf-8?B?VEtFQ016QWdLU3pacU9BRVJTZFdLVW9LSHFwNU16YmkxUEhYTHJXUXhXZlF0?=
 =?utf-8?B?Sk1CYUpvNGhidDVVbkNmSWgxY1ozRWlQcCsrYmEzR01LeHhqbHZOVmlHeWF2?=
 =?utf-8?Q?WxdI=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 09:39:10.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cc761a-f2b4-40fe-a979-08de4b751d3a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12306

The i.MX ARM v4/v5 defconfig has gone out of sync with some dead options,
some removed and some missing.

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

Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v3:
- Fixed another type in ARM reference
  (Reported-by: Fabio Estevam <festevam@gmail.com>)
- picked up reviewed-tag conditional on fixing typo
- Link to v2: https://lore.kernel.org/r/20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com

Changes in v2:
- Replaced wrong i.MX5/6 reference in commit description.
  (Reported-by: Fabio Estevam <festevam@gmail.com>)
---
 arch/arm/configs/imx_v4_v5_defconfig | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..9139d1784c70 100644
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
change-id: 20260101-armv45defconfig-16baf2b1269c

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


