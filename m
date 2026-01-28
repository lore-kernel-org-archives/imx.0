Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020090.outbound.protection.outlook.com [52.101.84.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D630F7F1
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.90
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617314; cv=fail; b=pZvJV4zpGjx9EM8lqJandW5lV0fSjPH+8AQHjwiSNSy9YFBMN5nGdqiysGwxk4Qn13Gehhdc7sx0IjzL0Jnn6dMtgMn9T6WbjjJINL47o1I9XkmkANnX3eFfz7Angdtx93sRKekqtrA5G+DA+lVrcfXpoX6Pvl2xpsqejF9gCGk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617314; c=relaxed/simple;
	bh=Mk48B7UgQzpcfEDEOjRjTMWoZX4pe17WkGnJLwhMG8A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CLqiQYMv44sg9WZ9B3l7k7G77MvaCrpFa/2GkDi3jaTmQ7xuSMBElGAzSM0lIQPDP9nK5aVYrBRxgDb/tzG6ShDgJF+fdtwp6XtQ12/qOYO3Yl6Ql9WnLSxMW4wP0DI2AlvOY1wNwnk3uAQdNfiT7ZeE8WiPsZV3dazxxVpnEV8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FENwZkkM; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FENwZkkM; arc=fail smtp.client-ip=52.101.84.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FENwZkkM";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FENwZkkM"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VaoBwbMshwz3YR0rdPEsg0KlSICjahJGY2mRxpKW6goPQJ1DABhUO7Xjr83KqEqA2vHrCNFzckuAy3dc0nBm4oulARIbhmMPzqKTVRqWfdG9jE3vXCRLsV/JORcsyrBds4rRYI2WetTh96JtrCh3sQQ0P2NlHdK6tor+OtbrRlgzYELsYtBZ+FkkmuKUwV3MxXvBFC/4j3oxIvvMcoNDtyokIg3Y0ewHaWXrf6VVCyLdLBjUuaxoW6qOb8BYrkqRLWeDv6YtC17bxcbrs8LU1iiQpiM4LyhNGfgy5kYs/3yMf/fHRN3lLQeLzWGrsCtGcFEX7ScYa1oUKCLV0KHXag==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr0Kfv6eYAdO4YyVS6AP9LWIUQZvaHtcJ/37HPeg+Xo=;
 b=X2dgyUaUDIvMqhfkXMah6sjgrzQuFrnt7H7y3pWDQZf/PepWWRgC7BTVhBbUkbqNrH1MbSoSuiAO/0VMRa9VnBfUwAZ0vLXlAB5h1lG6vQhdPX9ylA+FJI94LJZiGUvX5lcK1uCSp7VmNOkiYEXBOpQS/XdXnMVQJEE/1DgEUd0SGNmQK/bWrRji8QfgOD+ZDRxf7BuAU3+niUjduXsCxKDvBjl4xfGGfwfVJNDyKIpMZdr49Qpn9hmFQz4k9AnGhAR8kIYBNdub0HHsDuZONLyShdM0oCYnDKG6+8YJJM1FJ9Z+zkq0UdnwpwFD5lggPdPExfp6DPPyBSyvEBmT6g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr0Kfv6eYAdO4YyVS6AP9LWIUQZvaHtcJ/37HPeg+Xo=;
 b=FENwZkkM5JylknT5g9j2ylzw2yOwW3A+dDWqq5FVatyML9lriTRpHyVtkMtpfshjEQgec5yN5z2YhfyECjxxGDNPv4nrORUpZB92cN30mKgcobIhdvfEOtZMfm5oT3FfF45uZVFXSWp/ik8iO9R8q6e6LmeRce9mOr0wp9eauNU=
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by AM9PR04MB8292.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 16:21:47 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::ca) by DUZP191CA0028.outlook.office365.com
 (2603:10a6:10:4f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 28 Jan 2026 16:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via
 Frontend Transport; Wed, 28 Jan 2026 16:21:45 +0000
Received: from emails-4404942-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7022580010;
	Wed, 28 Jan 2026 16:21:45 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617305; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=hr0Kfv6eYAdO4YyVS6AP9LWIUQZvaHtcJ/37HPeg+Xo=;
 b=h9qBu+4OFz6KOZj8NXMEllaGLZxWcDiMWlfDP4a9It0bXrGarapHIYOPJO6EAB+I1Bbgk
 hoCYkX7exfCDJzzxoJtHzAGOi1qEE2zYaUcj9WOA6eS7ixdDN4SWXfLI3+pdwo+PX92dkyg
 yKD9P9dBaxWMfvYTLgR5NmReYw3kzjM=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617305;
 b=fcUw1sN/al2qS1o4BMi73KDBNMwghvnfpBj51GuMyuVujyGyFi3kSkhdtPjKKSD8/ThzB
 inG3cQBQqeypZxHnVprCn+0t8WpmKYO3uq9BYD69xtCynAuz2pScYMbqS5ljvWnfo9gFJFs
 6GN8DhCypTNcGpunIFBnxo3VqjQ8UCk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKE7Hhjob+a/k1uVwtGd5yPHhXsolD7qQ/B8bCK9pt6jGNTaYa+HfA+IsG1XfeVDRFuZeYUNiL+JYHHG8hB7LcSK85kxsj8K6itpGTkJnDoGjUgxXOyGEOnXpRXWUknG6DSHb9udHTSuR1B+RcyOByaT4lCkP7vlAeWdc4epYY6R9+n1qQgRgjJfz1lycU6/Av7hiwo4PymMjQHU+IOS2B4nVgQxuQTuRPo6P3uIjIXk0/aMvdJ0d9oh+CPD1smflmzGGfrNRowShH3CC2YNh4WkaDEh3sN26hogwX/6cHLFnmxkeUjibnwDycGC/OSxHuIkX9i4rdSG+xOqIq5XMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr0Kfv6eYAdO4YyVS6AP9LWIUQZvaHtcJ/37HPeg+Xo=;
 b=ljRfqOWBVDQ9gESDzx7+1P7MhHJTeIkrupGwReL5O0CmguPiqEtA8zTHDSZ6ZcTv9nOoED6BDh8pCMOueJ8ZErunkPGcGYfi1jiXPg1X6Ld+n4SUdqrYwp3Rtlr2VJe27rcvtMszVqT0eGNAkyKb8ZJQYy29k4FwwZ9UxbDU0lfjiVszGu37XuryD04oV5SB7Bn8tz7O+mxSi4sIL7Q6KriBmpdxCyN1Gou2LPVffiOks6upAuNFup1duE8YL3LpAvbORCcT9Jhg45XHMx0UN+aR1P+rE0G0VxMS1NimOjG9GI0fxhiq9fcvDNd9YZfkXoSgxlGOqvfzX+YuJ5SKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr0Kfv6eYAdO4YyVS6AP9LWIUQZvaHtcJ/37HPeg+Xo=;
 b=FENwZkkM5JylknT5g9j2ylzw2yOwW3A+dDWqq5FVatyML9lriTRpHyVtkMtpfshjEQgec5yN5z2YhfyECjxxGDNPv4nrORUpZB92cN30mKgcobIhdvfEOtZMfm5oT3FfF45uZVFXSWp/ik8iO9R8q6e6LmeRce9mOr0wp9eauNU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:21:37 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:29 +0200
Subject: [PATCH v8 5/8] arm64: dts: add support for SolidRun i.MX8MP
 HummingBoard IIoT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-5-9646a3025cf4@solid-run.com>
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
	PAXPR04MB8749:EE_|AM9PR04MB7522:EE_|DU6PEPF00009527:EE_|AM9PR04MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: fe328e51-96e5-49fb-237c-08de5e89548f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WEl0NDRxMElmeDlqZUNMeGxHMytIRFd2cEdJRnRuaXpFdGp6MGFlZ0pLUE1n?=
 =?utf-8?B?Sk5NY0JZQlF4djFZYnhrU3RYZWhDMCtzRjFjQ0twVkpkcG0yaVRjREVvSytU?=
 =?utf-8?B?bERhZmV4UEVVRlcvQkpyM1daMks0dm84VERRVFowVU5ERFJXY2FJajdRTFg0?=
 =?utf-8?B?cjIvYjd4ZXorRUxSMCs1cTFVQjFrUXp3enBUVlM3TUxCZ24rVEg5ZXdHcVFi?=
 =?utf-8?B?NFp5MEt1TlZrbEpNL09vVzR5ZzBteUxVdUNuVTA1TWtYMzVJK3dpNm1mckg3?=
 =?utf-8?B?azNBbGNocHIxbEp0SFh6N3g1NmQwMnZhS2RYdzRuK01uZUJqQ1lmcEFXNkZF?=
 =?utf-8?B?eVhzenhpSHpicGxqV0FpcC80cnJ3bEpOUmlhT0hhU1Z6ZnVISkdXdTNnaDhK?=
 =?utf-8?B?UHF6bGxHOGdEcjJLekd2bGNEQXNPd3pQbUVqQlB3aE1Cdjkvb0M2QktpQ2Fa?=
 =?utf-8?B?ZDg5elpKWXNKMG1xR1h4MnlTOXU4YmtWaXNocVNBckl1SEozaGlZMVFFdDdW?=
 =?utf-8?B?WU5od24vd1FSNVdUb3FPdHdnL2Q2MHdESUpTVWw0bGxDNVg5U0MwQ1puZ3Jq?=
 =?utf-8?B?elV1RHM4MTNhREd3WWttbjFKRUtHSVJrOGd6WlRrcytrc3dsTTlMU0ZZU2Zv?=
 =?utf-8?B?eVJubEhkb3hNMVNvM2RIN3JDSXVvQjljQXNqUThUbjZQNFlEdGxNMVd0QVhi?=
 =?utf-8?B?ZElRYlNkZVc2a2k1RDgwejRoeEtxOXZhQzI1ekl6R0hRdS92Qkw0SUtrZHg5?=
 =?utf-8?B?V3NubjB1Y29EamhkNmQ0TDkrc0ZUVWJwcXVidTUvSVlJbDZmWkE2aldjTE1q?=
 =?utf-8?B?a3NyMDloZjVOc2RGdXVPZ3A4MU1wZ3RyN2dVSHUxK0pZK2pLV3hNRHVLa0c3?=
 =?utf-8?B?TXRTak5QWWx2Z1pwQWRKU2tYVW1RWG1qcDZHb1p6TURlTkIyWDRaZFd6bDlS?=
 =?utf-8?B?cFJBMHlHd0JvRnF5bUQ3YjRES05RcFJWaC9PMGJLUkVWeHk0RW04SE5hRVZJ?=
 =?utf-8?B?dVJrSmhnWEhpT1ZhL1dOZm03c1NiOVl4eFhBeUpob29tbU5na0NJb1dHOFVz?=
 =?utf-8?B?enF6Z3NiMzVSS0ZybWVRTy9BZUhvUTk0bGlsNW9nU3RoQWxFK2ZTR21vdnZR?=
 =?utf-8?B?cUpXT2RIaUsvTjUraGRrUkN5b3E0M0hNOVgzeFZCTUpvRld1bHVwTnlmNmVN?=
 =?utf-8?B?VUs3UnplSzRTQjdxbjcxSVZPdlBsWlgzVmRnOXVwTmRSaGVjb1dab1hPV09u?=
 =?utf-8?B?Y285bHZFVlR2NVhnZUJiZzZEaThzQm5OTDl3ZGh2cTcrR0hmWGgvWVdKNmlo?=
 =?utf-8?B?OUtPa1N1ZUp5dk5KelVwclpVNEZCQWErSW5jNG5ETGx1VE1HK2ZKRE1sdVFN?=
 =?utf-8?B?TFlXbjIzVGRHc2o5UUt4RVVFVkZ6RzZJRklpKzNUWmM4Z0RtejI5Zm9uTTZC?=
 =?utf-8?B?NHU2MFlEL0lpcTErNHhJWXBJZG5JSDUwaEtNVUpUczdpQVZ1OVNEYW5LblRa?=
 =?utf-8?B?OHpJaFZDV0JYSVNWN1d6Si9MRTdpRDNkRmQxN3JwNmVvQ2t4WkU3RTRzbGJV?=
 =?utf-8?B?ZnlKNDZrUlppRURQWkJySUVhTHdsUlRpUHRxZjIvcWF2YzZwTWd1eldNbzVz?=
 =?utf-8?B?MTd2UnFJR3d4TVRsU3daYkR4QnAvSE5vZmxab1NGS2NQaG4wdDFHa0pTeFBl?=
 =?utf-8?B?TTFobjhoZXUzc1VMRFpzQVdSaDhyRVdoRGNhVEk1T2xSRkVsOXdUTXlCSElS?=
 =?utf-8?B?dnU0cnVxbXZpbUtpUzdpVVZhaWQ3MnN5ajZ3SndqcHFzVFhnU0ZIb1pBcWpR?=
 =?utf-8?B?M0J3eFpWZm5aOGZ5c0h0YmdEcFp5YUU3TEZKbjJDcHlOTUpSdEc1Q1lPTnRZ?=
 =?utf-8?B?ODJkaThNd3NuYXlQWEtqa2dzRW9VMlBReU5VM0YzOURkUSs1eWo0bEhTbEVH?=
 =?utf-8?B?VHF4dXpkNXlpZUU5cUpBSjNkMnlNejdGazY5QUs1a3FxaVNBdFFINFBqN0tG?=
 =?utf-8?B?bkJTOUJJUmMybXJKRDdRdXFPamVqNEgzbFptc0F6OGRQYUhXRmxPeThlOUFt?=
 =?utf-8?B?K1hwSUZEU3gwRXZiZWR6cEdlRHR2UDZVWit4VjZSZjE4aHRNeW9oZk9SdUdk?=
 =?utf-8?B?V1M3bkk3YUlRenlrTzZQSDhWVDI3N2dUREtxRFhhbSswSHR5RlFmKzVSNnp4?=
 =?utf-8?Q?hz74HUV1obEeBoSdIOMy3co=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9378ebe988a54a03b17a9e96de1f1ae5:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39f0821c-a458-4155-14fd-08de5e894fb6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGszbDRjZzg5aFFsRFJCNm1ZcnFvMGpLWDJFL01xUzUwN1pGQjNiRVVPOUVO?=
 =?utf-8?B?TDRoaW1wbjZES0hJZnRvclBBY2pKblFmc3o1R253S0R6U1hvS0QxM3RUUUhW?=
 =?utf-8?B?MlZrcktBR2thVUdLZkZFWHNEZkN3OExsZU9jNmZDWkVPNllmM3oyY3AwaEJv?=
 =?utf-8?B?ZmVuSVA2aHlNLys3Vk9YOHdtRjF4eGRJMGxQQXg3R3NYRU1aZGlmemc5K3V5?=
 =?utf-8?B?ZGpYTnNGeEJiZUJ3bEw4dy9ObE1ZQUxuUXdEMlNsdG01ZWw5N2c5c0J1aHdM?=
 =?utf-8?B?LzVNdnNySkkxYXVmcTRyVEQydmhQeGlNa0RJMjJjaEc5ZmY3VG9rTWVNNnph?=
 =?utf-8?B?R3EwOVVTM0hGN0VwUGRoK0hhVWlGcEdHeVdBaW5wWUJ4SDMvR2JzZVEralkw?=
 =?utf-8?B?dDJHQzlmcE9FM2YyYTJZaDZnVG54YjlpaFo2MmZBM0lDSE9IUDE4NldLWmYx?=
 =?utf-8?B?UlExR0hwSlU3aWg5NFA1WkwxdVE3YVljNTg3YVpaMlVNdnRPQitxV1NDVE1S?=
 =?utf-8?B?SUs3T2dQSlJwUGMrVWRndWJzaFhUMThwK3B3OXM2VzIzSHlxcVVRTGxxUmUy?=
 =?utf-8?B?N0FNa3hqa1JMUElrR0V6cUwrMFNBOUdXTlJOS3ROOFhDVGIweDJEWHdoN1pn?=
 =?utf-8?B?dWlpMTVRRzF4QXRDSEdRQUcrRmtuNjhUSUUvY0JDcnV1Y2czU3N2Y2FSczYy?=
 =?utf-8?B?M29zN3RDNG9TRWRqWGVkVUhBc3piNkpjTGpWQlplaFZqMUpwR0NPc3U5ZXRM?=
 =?utf-8?B?M0dJVS8xZlBMTEVyV2NxOE5DZEQrT2l5K3BObVJ0TmNsUFFzNjNZTGVJd2Uz?=
 =?utf-8?B?OFdPdDhzWVJFY0JORFJpT2VTTXFyUnJvRzI5VlVNbHB5a1Q3ZG53TjAza3Rs?=
 =?utf-8?B?aXV3MjBZbXE5bFZmVEpUbXN0cGZDMWdVbTUxdWdzZ25DN3NadUcwdVBWbDVQ?=
 =?utf-8?B?Y3doYURZV2EzSFRSWnRLODBDdnZLVWxXRkVmSzh2RHgxY1Y2Y25Eb3YwdkIv?=
 =?utf-8?B?VEwvd0pYN0ZUM1ZoaE1MQThmNmZOaER0RzQ4NjlSZXk4blZUT0l3T09nK2wz?=
 =?utf-8?B?UXVySmo1bDQyb3FBcDZHWEhDYSsyZVB4T0p5NXBOaEtEalBiNGd1T21odXZq?=
 =?utf-8?B?eDZ4TVBWb2R6ZksxTk11NTRHMXBhSmludldoTzBzaTI0SnFobUdBbnQ3UWRt?=
 =?utf-8?B?YStlczlvN25IYUxXUmlBUTJ0OXVPN2UwUTZYcWJkVnduQkJzcGh1SUZ2Tnhr?=
 =?utf-8?B?TUJTYnQ0ZGxGbTdaZWNCVnZyTWE3cEJLRUZuRitETEZsN3VtcTFhSHpPUGZW?=
 =?utf-8?B?QzBQeENvSUp1Ujl2cGxLb1BCV2tmd3dONnBSajZBaFJIaG9EazhOcHVKdzRu?=
 =?utf-8?B?WEdobVhCNFNtMTMxa3p4aUpmUXdNRk9VVTdhZUpVRWFrNlczMHZhK0lhU0Fi?=
 =?utf-8?B?bllBZlF3SG1hTTJRL3RkN1dZUkIyU1YvNDcvaFE4RnI5eG1CajlFV0dNcmIr?=
 =?utf-8?B?T3V5T0c2a0c1SVNacWszNHBJOEYwVSs0azJlMjFKeDZIWUhlNVB2MkE5b2FR?=
 =?utf-8?B?OWhkdEs1TE4vc2k2VHpGeWVzOVNjai85RCtuMVl4d3Fnbko0N1ZNSFlOMVJo?=
 =?utf-8?B?UUo1YzhlQUQ5M3BOVEl4VSsrRUV4bmJlSmthMkZIS0VBMlpuY0ZMK1djalA5?=
 =?utf-8?B?NEd5S21lT0NYK2pGMm9aMmp6bk5wcEpjTVdpWDdsM2J0WjlYVEZKd3dIcG9W?=
 =?utf-8?B?Tzc4SDRDeUl2cVc0N3R3V21JZlFQaGdabllVejNVREFHalVvcDBLZThiWkt3?=
 =?utf-8?B?SUlQRlJHN3NDSDN0VW8rVlQyMkRyVkN1R0l0bWlhWGlTdXhUbTRReUFvR1pI?=
 =?utf-8?B?ZXZnemIrVHJraGZPU3BDbjdia3J5WTZDd0d1bFJZWm92ZzltckFmbWZGRUFM?=
 =?utf-8?B?UCtoY1pYMUZDdklnNkphRTFjUEVhTGgxT1VNd0YvNnBlaHhrVU83ZkFEeFF5?=
 =?utf-8?B?d1hvRWZoOS9ob2FLcVVWd2h4QU5kU29sWlNYSUlKWmJKSXRDU2VYSG5YZnRP?=
 =?utf-8?B?czFwKzlJMTZhb3NvM1R2QmJGY0w0aXd6dTBWTFNrNmNQNUF3bDhUMG0zYzhT?=
 =?utf-8?B?bmtBZmRPMHdsbWFNTkxHMUFNdXZkOWNyOGEzTDkyVCt4bWkvWlF1VTFZUXFG?=
 =?utf-8?B?d3JMV0lvK0h6a0s1RTRwRGZ2U05FNDRPZEw5Z2VwM0FsTUMrZENTamlxVEl2?=
 =?utf-8?B?bzgvTi93SGM1QWY0azAzWUNCWG13PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:21:45.4947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe328e51-96e5-49fb-237c-08de5e89548f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8292

Introduce support for the SolidRun i.MX8MP HummingBoard IIoT platform.
This board is a new design based on the i.MX8MP System on Module and
does not share much hardware with previous HummingBoard variants.

It comes with some common features:
- 3x USB-3.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 M-Key connector with PCI-E Gen. 3 x1
- 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
- 1x LVDS Display Connector
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

In addition there is a board-to-board expansion connector to support
custom daughter boards with access to SPI, a range of GPIOs and -
notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
to this b2b connector, or a termianl block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb overlays.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 721 +++++++++++++++++++++
 2 files changed, 723 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f99a24ad115a..0847347786fa 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -213,6 +213,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-pro := -@
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 000000000000..c4dc32621f6d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,721 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard IIoT";
+	compatible = "solidrun,imx8mp-hummingboard-iiot",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos; /* J10 */
+		ethernet1 = &fec; /* J11 */
+		gpio5 = &tca6408_u48;
+		gpio6 = &tca6408_u37;
+		gpio7 = &tca6416_u20;
+		gpio8 = &tca6416_u21;
+		i2c6 = &i2c_exp;
+		i2c7 = &i2c_csi;
+		i2c8 = &i2c_dsi;
+		i2c9 = &i2c_lvds;
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			label = "m2-m-wakeup";
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+
+	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches both flexcan1 and flexcan2 tx/rx between
+		 * expansion connector (J22) and on-board transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	mux-controller-1 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches can bus between different SoM board-to-board
+		 * connector pins which is used to support different SoMs.
+		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
+		 */
+		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		#mux-control-cells = <0>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "1v2";
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <11200000>;
+		regulator-min-microvolt = <11200000>;
+		regulator-name = "dsi-panel";
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "m2-b";
+		enable-active-high;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "m2-m";
+		enable-active-high;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&vmmc_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vmmc";
+		startup-delay-us = <250>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+		label = "m2-b gnss";
+		radio-type = "gps";
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+		label = "m2-b radio";
+		radio-type = "wwan";
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	num-cs = <1>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	ecspi2_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
+		spi-max-frequency = <166000000>;
+		mux-controls = <&spi_mux>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <43000000>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		/*
+		 * This reset is open drain,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+	clock-frequency = <400000>;
+
+	tca6416_u20: gpio@20 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "m2-b-reset";
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_u21_int_pins>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "rs232-shutdown";
+		};
+
+		lcd-i2c-reset-hog {
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			output-low;
+			line-name = "lcd-i2c-reset";
+		};
+
+		m2-m-clkreq-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			label = "D7";
+			color = <LED_COLOR_ID_RGB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <0x3>;
+			chan-name = "D8";
+			label = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupt-names = "INT1";
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		/*
+		 * AM1805 RTC used on this board has only nTIRQ pins wired,
+		 * which is for countdown timer irqs only.
+		 * Driver does not support this, disable for now.
+		 *
+		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+		 */
+	};
+};
+
+&iomuxc {
+	can1_pins: pinctrl-can1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+		>;
+	};
+
+	can2_pins: pinctrl-can2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
+		>;
+	};
+
+	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
+		>;
+	};
+
+	/* UARTA */
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
+		>;
+	};
+
+	/* UARTB */
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&pcie {
+	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* M.2 M-Key (J4) */
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};

-- 
2.43.0


