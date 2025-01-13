Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD98235C13
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762228; cv=fail; b=AKeXbC8jOMZQUJlcTDqpB9Lu/OOr+wFml9+vSZtTdJYVubjXkFIHiVanFd9qbli5YEpQg32zL2oGhgWXTXWvn/EKSQpvVT3OvPY4hh/KhjGNNEhAMeECK0cLYOUDj0WeSzZIOQuymTxzszmTg5n3nd42KAsxWiQ9jdgxloPLQtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762228; c=relaxed/simple;
	bh=MjOlLWdg94lndcC8BjY8fZP21iQ1heMaEbYpDet78/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pZPr/BDihNJ8L81KEVf4o4E0S5tUnOiD2D63Vf3YcacW+229BgLVizEJuuWKG7eoSScB02R1EYajYs9evpib/Y8zsRPuOIL3AjM1ErW0ALIVCAvPMKiN8xJFz8Iia1kTqCp8ypEvAaaTrWIVKvG73M3N7MZrJ2OAPAM+zYn0yCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BShCz7xA; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BShCz7xA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXQhldF+Vtbnut7rvYBjNwMeBI4Rv+8knrMFd/oUUn59i/H578fCssgroq+JiSxAVXiMBbCumFaPJ1GvesDN/gm3h6sTR5dNhylDF5GBqXOC/N3HZqAdo3/LKVDNgVLciIQb0FFXoU1C8V9/0FitJRu+I5+c6mLAObCK6ITVzIV/1ZPjDUfCeFbIfXETNCBy0J1mKeVUrMObv7gToORqqHwVGH08xlf5zqyNpDbg0P5UZNhzQZQYttYn/YJWPspQuwdQ7u0nCL6I6i4WYbrA2yLA6oZ6JyU7WgOZ/WBd7o7xkBxY0r0S6ZA4FYOSFdPQmhyeIj63CW+U9SmLx1nErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+icfPVVCHZ1W3eDg28Mmwy72m1TAugk9qThd5JMjB0=;
 b=qkRcTWP6w85rWD9J3o4BJuiqUmFSnRjV/2lPJvRLbWN7lFaooTykF85PgLuoE2kysyq56DXgCFjT07C8iHDMMBLur718vMel0ZhUbigxVglT/MrRhmAcu/q6ChH9bPNVc+V4Yu3igtTwiBIBaXT4OCV7EDpR5Ofr8pjHojylJLbcR24nZRwa7BFVosDy2iV4TwKtN0CAbGumZaHwKbipUhgFjKg9l4RbJgFMvg1u7waIN4/JESHgFFVyEfpNbyXIfz9TKNE86yamS94gQL2RRrsZT8kk9+Om5/+4nmsDBnmftaFDmlIH8oKq9YBXub/TffOo+Xik0mdcoavDTIQTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+icfPVVCHZ1W3eDg28Mmwy72m1TAugk9qThd5JMjB0=;
 b=BShCz7xAELBoM47LwNKspKL8R7oXqRJhMILDcsYetH21YVbGpADyqiFZYAiDEF1cL0259qgBXKy4lYOiekRYykHXUByZD4BYORmKEL2y8BAEv6osndSv2cZPqbTwtYjYbEAbfm+gY7tzr9NN+p0wI+VisvM2vYtRqhEb6LOMM8Rg7cmjueMTN1mFRr8xwiuCewCj/S21OHJYDQbLgadKnP+HZ7nzFzAeVg7toI4FsPG3ZuG9tekEiyk6KkbOjNvFEMK1ItxdwZcQhHb3+9j8+JStf2OMEXH6rt4XYom0n4/a72X8vK1VCu/5nkI1tzPaxWyTM8OLVK0BXYzdZ/9o1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM8PR04MB7955.eurprd04.prod.outlook.com (2603:10a6:20b:249::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:57:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:57:01 +0000
Message-ID: <840698be-5cbf-4388-81f6-a139c5a74cf4@oss.nxp.com>
Date: Mon, 13 Jan 2025 11:56:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: s32g: add common 'S32G-EVB' and
 'S32G-RDB' board support
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-3-ciprianmarian.costea@oss.nxp.com>
 <Z2WVCyJbJTpU/FrY@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z2WVCyJbJTpU/FrY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::34) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM8PR04MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: e57321ed-8c9c-4496-07be-08dd33b8a004
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGhSbFVnbmpreEtucGozQllmTEJWTjdLeWw0eG1TSjhZZzRGRUJIOWQ4VndV?=
 =?utf-8?B?dEg5VVhDdW0vNG5DVzZZZXdBbU14TTlsYjFzREorU3lYbkJPRThvYXFVemxo?=
 =?utf-8?B?cE1yUElYQlFWUFd3VGdhVWpzT1I5WnQxODdmdE52QUdrSDNJQmlCd2VYWE9P?=
 =?utf-8?B?YUJJemxoR1hxbjBkbWRadGxRRlFqelEwQkxFTjN6dTV1b2pCYWlhdTJqVEds?=
 =?utf-8?B?Q1ZPUHJEWXN0OUxwanBkalpmdDNaVnU1L2JHajVmUFhjczYzRHlEZ0Q3Zzd1?=
 =?utf-8?B?MXNvV3V6VXNCMzFXYlZqTlMyWkp1OHpWd0xUWXhIcVFLRUJZMGVrUWx5WWFj?=
 =?utf-8?B?cCtHaFhFdSsxTXZaMTdhSlJBWjJQVFNUd1RwWjE4VUFQTVE2Y3hBWWRUZ0lE?=
 =?utf-8?B?ZVloM0tYcmtTMjNJVW5YMTVsZVdyWVVvV2JGZEdZYkdPUnA4eTVEMmVIQXNj?=
 =?utf-8?B?d3UrRnZOdkdMRHJSVXhDTjh3SHRSRXcxd2MzOW9US1o1ZlBZKytobzNVZFFq?=
 =?utf-8?B?QjA4MTNBTFVoekR6bG11anJDMm16YmtqanR3ZzAwS2RRRUpWNzBESWQ0cmRx?=
 =?utf-8?B?SHpVemZKaDVnQ2RYdENDUXBCY0dlN05acnAvRWFub1U4SDlzZE1pY1VZZWsz?=
 =?utf-8?B?MzFHbTIwcUNLSVdVWklZWEh0dnY0WmJtV3dQeCtoVXFadUlhVElFbDJWcmpz?=
 =?utf-8?B?UFhBWnZ4aFR6d2JmeVF0Mjk0Q1M1QnJNbUVtRGxxV0dPM0VHS2llL2NiZ1FY?=
 =?utf-8?B?YjVaOWVWazgySnQxNWFnUlZ0ZnVzeVJYdHZpZHZseEFqU1FXRGxoWThjWllU?=
 =?utf-8?B?TFZxWTFEQnl3VDBoSnlqU2UzdmJvUjNLWnJRaElUSTBuN2dHcGFPRDRDbTJS?=
 =?utf-8?B?S0MyK2dZOTJJZ29HUUYzRmxORWUzb2dLaWNKUlRNYkJEVkJXbkoyQ2J2b3FS?=
 =?utf-8?B?SXZ1b3gvYzRWRitUMUVTNFNZaXpjMWYyWW1TaFAzVS9sWlBQUkFpS1JXR0w1?=
 =?utf-8?B?L2hNQlpKU1BWWjU4RFpYVE5rWCtsdXZkNVV0SGVkbnBVQzJwZ3FzZDl2ZThk?=
 =?utf-8?B?N21Oazc2UFVqV3FlcEliT1poTmFQNVFtS3FkejRNOHVuZVhNaCtHQjBRSGRk?=
 =?utf-8?B?dVVGaDgxRXVrOXdsQkFHakNHZkdLeXpkVkFnS1hCTnQ0QjlyVEFkWGJYZE5I?=
 =?utf-8?B?UGE4RVRFR2cxSGtKQXFRbmR1N1VXdEVtZTBVMWFPc0phSFNLdkpQT3p2QnRO?=
 =?utf-8?B?YVJXU0lZWUpwRDZJWStHMEZzNzcreU1vZk16dm5Qc3hiRnhjQzhRQnhXNkxi?=
 =?utf-8?B?TGo2TXpzUmpLV3RTTFh1ajdIR1MzK3E3SjBWOGdBekxINHl6TkdJK0tKL3cw?=
 =?utf-8?B?Ykp0VDJXRWdtTk40NGJ5TDVXTXZvanJlb1Z2NU5JWmJjcU9ndkFWQW9GNHFO?=
 =?utf-8?B?ZldYb3g5T0tMV3ZnWlg1NERyRTVDUUFCT3QyN3N5QXVmQi9wNGF4V1hRRzA1?=
 =?utf-8?B?a2Q1dW5uYTIzRVk0cnFyWUtMb2gxb0FqWDNsQ3FzeDY1VGxKRWJDZlpaMFpG?=
 =?utf-8?B?em5Qam5GYjJBVnNubUd3eVdqOHQ5ZC9GZ0UvWmYwS3U4QzE5Z1VDcU15azIx?=
 =?utf-8?B?aldIYXZmb1kvSjM4b1JFbzJXQ0pCMnlYaHB4dWc2ekszbjBVOEZhVXVPcWNq?=
 =?utf-8?B?OWlyRGJyTjk0Y3Q2clNrWTRQcngzTGFISWUybjhtUk8zeE16VWI4ODBTQVh1?=
 =?utf-8?B?bmdzdkM2YUp2OS9aRGI1RkpIQWRURXpsZXpYZ0g4eDlMUEdCNm9MR0VCNWVB?=
 =?utf-8?B?UGVZY1YvT2Q0bmFIMWJpZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnRieVJsYVRjckQvcUhJR1Y4UDkxMnRzSHJrNVltaFNYN2pDdzF0SWNwRStU?=
 =?utf-8?B?cVhIUXlhckluLzZrTUluemJFWDBDTEs1OHhXbWUvSGRkUUZjYmoyYXgvcDg3?=
 =?utf-8?B?RmV1RmZacTM0aDRaaU10WTllV2dobTkxWUFXaCtXRC9XNVlhaWkvK3Ywb1B6?=
 =?utf-8?B?WU9LZnFvV2EyWjRSbThGZS9LckdhVjQzYlk1aC96bG5pd01BSEhNWFlxM1Zm?=
 =?utf-8?B?SU1RZTNTU2RCWjF3cHhEVURCa2RwMWh5aUxjb2RGaFVoYk53VElkc0c1bHEy?=
 =?utf-8?B?WE1Idk9lOG5scHV5Sm9peGpjYmdyMGl4NS95Qy9XQXhWUXg3NGxhM0QxL29n?=
 =?utf-8?B?WHlZQ0EvVGFBc2JyWSt6WW1YNXV5Z3BiNmpIanhWajcwVDM3THNFRnZLdFJw?=
 =?utf-8?B?MGZGYm1BOGIyU2NDdnRGMzFGTXBXTXRvVUE4S3dhOTY4bmdKb29rUjVCTXRa?=
 =?utf-8?B?OWxKaGVJcUdOdk1KUVFRbFA0N2FpWnBGdDVBVzhsMHdFVUlKaFFFS2UvYzRY?=
 =?utf-8?B?ZFVEY0MvSEJ5QzRpeEkvTmRDN3YyejRRcFdsRzN5TmNpQmVaMC9lZDV3enpL?=
 =?utf-8?B?R1dGaGgyLzUvajZRcFg2QVcvU1k3dkIwT2NoU2Vpa1V3WldJRnhFeHNhOFl3?=
 =?utf-8?B?eXl4ZXlOaFNjU3RFazNOdzFPdzNJSlZNZ3NEWEtXS1lhOG1vK1lMSmZLWHc3?=
 =?utf-8?B?R0FycThYWlBmTHBZS3BxVFNhOHBtNmhyTDdYY2V4TW5kZXJscHVwanlZSFFT?=
 =?utf-8?B?a2R1SW81bWErakkzWmEzZUVadmZvZGxuRjg5aUkyNWFIdE12aDMzRy9kdndl?=
 =?utf-8?B?NkhQVDJGajJxRC9QZ3I5QlJvdUo3bkVJSjcrOUYwREdRdWg0MC9KSFNZbEJm?=
 =?utf-8?B?S3pKa1BHSmZ3QVIzQm1lTVlZSGZ5WGpkc3Fic3NyUGVSNXRPeE10WFhBTDQv?=
 =?utf-8?B?aE1kaVg5SHR6TWliQjhPa3FESzE1dytiRThRVHZ6cmNUU3FDYzR1SFVTRjFz?=
 =?utf-8?B?NE5yaGdlWmllaGVsK1NPekVvbGdRZ0hlZXBoRG9aREo0dC9FVVhqdGIyYXVT?=
 =?utf-8?B?eXpGSE1oMmF3eW9rL3NucnlUY2xXRXIzbFd0eXVFMktCUEVsN1pFS1YwVkxJ?=
 =?utf-8?B?ZFIrYWllbWRJaDBNM1ZxRXVCVGxMMWMweDc4OEFkL3IzUmx4NFFpc3I2RFNV?=
 =?utf-8?B?d3FKNmxFYzNBLzJKdk9pOWJyeVRJekNRb3BpVmYrNFN5TWFvdVR2U09PeTlI?=
 =?utf-8?B?eTVwc3IxRUFGOVNPRWVleUtqRFVqdDJjaUgvRi9KbmhpV1NqZU8xS1NBWGRO?=
 =?utf-8?B?TlU5d0t0Ni9mREF5YXJJV0x5Sy92ZUJqWlZQdnk2YTVHYzNQYTZCbnBhdEtS?=
 =?utf-8?B?eDdBSExDVldEdlQwU1ZRbmRSZlZsbDRNWTZRS1hYK2J4STFFMGEwcTdMRDk0?=
 =?utf-8?B?Qy9FQ1krZ0ZnZ0x2TUJuRmhZQ1crSk0zd0ZCVEZuM28zSE05TERtblh1ektj?=
 =?utf-8?B?QlQ1a3R6aVgybHh6akdPMVc3M0ovVWJlQisrbk5kSWtmdkVDNGk4OHBiOFNq?=
 =?utf-8?B?NmprMDF0N1hsdDZ0ck8zdEZJdVRETnE1K1ZOWjFkZG0reVZZOXYzblVIbzdn?=
 =?utf-8?B?MDhyUVJVWUdFaS96REs0ME01MmFBbHpTd2MrUmpKUXZSU0sxSWt0WWRpWDVM?=
 =?utf-8?B?RmdvS2NINXE0cnlQU3NlZ2l2NDU2S21tM1hkUmorNEpFbEhTRjFORU42VXh1?=
 =?utf-8?B?ZzRCV1NoeWNhdG90ZFkzWTA3RzdSM3JiR0NicXU4QjhFTG5RM1V6UUZiQ2Jl?=
 =?utf-8?B?ejVVYjBQWDduV09Yek1tM1pweEYzV1pSazhDUHBYbUFJdy8xdFB3czF1MUNP?=
 =?utf-8?B?dG9uNGJQRXhETGRLUkVodExTZnBaWFYrcHQ4U0lHenFVWmNpaTBsN0tIWjdq?=
 =?utf-8?B?UmtPRG1jdnpXMWlnajRyaFhBcktvMXNtMy93dmZpcXNVTWp4UTNFamFxc2Ev?=
 =?utf-8?B?d1V0K29rbHJHSGZ5UjdQTmc2a05Hd0lrNXVqMzUrVzREeVZFN291NTFwUFRr?=
 =?utf-8?B?OU4zbG1wYmxQWVFBTDJoa1JISGZ2dzRxVlZDSHJ1M2tycmd4THhnZFZ1Z2lu?=
 =?utf-8?B?L25FZWhnM2VMdzBiWHgwN1prdklCVG1MQVdEYVlRbk5lOTR5TlpqK1Jtd1B0?=
 =?utf-8?Q?X5fQ3akK+dFzJcsgkfFchMI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57321ed-8c9c-4496-07be-08dd33b8a004
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:57:01.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cfwy0nlKZKlM1qMpWom4uzJ3mbFB30fI7lqjUWZiLoDsL1RC9c1z9T5PvPZB46CHDBQAz68mz2E3fkC9bmcwFt47Q3hqhloOP6VipoBQ2/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7955

On 12/20/2024 6:02 PM, Frank Li wrote:
> On Fri, Dec 20, 2024 at 02:39:14PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
>> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
>> are quite similar. The common part for the EVB revisions will be
>> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
>> be placed in 's32gxxa-rdb.dtsi' file.
>>
>> This refactor will also serve for other modules in the future, such as
>> FlexCAN, DSPI.
> 
> 
> https://docs.kernel.org/process/submitting-patches.html
> "Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
> instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do
> frotz”, as if you are giving orders to the codebase to change its
> behaviour."
> 
> So suggest..
> 
> Create common part, s32gxxa-evb.dtsi and s32gxxa-rdb.dtsi, for S32G2/S32G3
> RDB2\3 and EVB G2/G3 boards to avoid copy duplicate part in boards dts
> file. Prepare to add other modules easily in the future.
> 

Thanks for the suggestion. I will update accordingly in V5.

>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>>   .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
>>   2 files changed, 272 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>>   create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> 
> I think you should squash patch 3/4 to this one. All is for the boards dts.
> 
> Frank

Sounds good. I will squash patch 3 & 4 in V5.

Ciprian

>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> new file mode 100644
>> index 000000000000..a44eff28073a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright 2024 NXP
>> + *
>> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> + *          Larisa Grigore <larisa.grigore@nxp.com>
>> + */
>> +
>> +&pinctrl {
>> +	i2c0_pins: i2c0-pins {
>> +		i2c0-grp0 {
>> +			pinmux = <0x101>, <0x111>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-grp1 {
>> +			pinmux = <0x2352>, <0x2362>;
>> +		};
>> +	};
>> +
>> +	i2c0_gpio_pins: i2c0-gpio-pins {
>> +		i2c0-gpio-grp0 {
>> +			pinmux = <0x100>, <0x110>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-gpio-grp1 {
>> +			pinmux = <0x2350>, <0x2360>;
>> +		};
>> +	};
>> +
>> +	i2c1_pins: i2c1-pins {
>> +		i2c1-grp0 {
>> +			pinmux = <0x131>, <0x141>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c1-grp1 {
>> +			pinmux = <0x2cd2>, <0x2ce2>;
>> +		};
>> +	};
>> +
>> +	i2c1_gpio_pins: i2c1-gpio-pins {
>> +		i2c1-gpio-grp0 {
>> +			pinmux = <0x130>, <0x140>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c1-gpio-grp1 {
>> +			pinmux = <0x2cd0>, <0x2ce0>;
>> +		};
>> +	};
>> +
>> +	i2c2_pins: i2c2-pins {
>> +		i2c2-grp0 {
>> +			pinmux = <0x151>, <0x161>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-grp1 {
>> +			pinmux = <0x2cf2>, <0x2d02>;
>> +		};
>> +	};
>> +
>> +	i2c2_gpio_pins: i2c2-gpio-pins {
>> +		i2c2-gpio-grp0 {
>> +			pinmux = <0x150>, <0x160>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-gpio-grp1 {
>> +			pinmux = <0x2cf0>, <0x2d00>;
>> +		};
>> +	};
>> +
>> +	i2c4_pins: i2c4-pins {
>> +		i2c4-grp0 {
>> +			pinmux = <0x211>, <0x222>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-grp1 {
>> +			pinmux = <0x2d43>, <0x2d33>;
>> +		};
>> +	};
>> +
>> +	i2c4_gpio_pins: i2c4-gpio-pins {
>> +		i2c4-gpio-grp0 {
>> +			pinmux = <0x210>, <0x220>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-gpio-grp1 {
>> +			pinmux = <0x2d40>, <0x2d30>;
>> +		};
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c0_pins>;
>> +	pinctrl-1 = <&i2c0_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c1_pins>;
>> +	pinctrl-1 = <&i2c1_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c2_pins>;
>> +	pinctrl-1 = <&i2c2_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c4_pins>;
>> +	pinctrl-1 = <&i2c4_gpio_pins>;
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> new file mode 100644
>> index 000000000000..91fd8dbf2224
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +/*
>> + * Copyright 2024 NXP
>> + *
>> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>> + *          Larisa Grigore <larisa.grigore@nxp.com>
>> + */
>> +
>> +&pinctrl {
>> +	i2c0_pins: i2c0-pins {
>> +		i2c0-grp0 {
>> +			pinmux = <0x1f2>, <0x201>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-grp1 {
>> +			pinmux = <0x2353>, <0x2363>;
>> +		};
>> +	};
>> +
>> +	i2c0_gpio_pins: i2c0-gpio-pins {
>> +		i2c0-gpio-grp0 {
>> +			pinmux = <0x1f0>, <0x200>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c0-gpio-grp1 {
>> +			pinmux = <0x2350>, <0x2360>;
>> +		};
>> +	};
>> +
>> +	i2c2_pins: i2c2-pins {
>> +		i2c2-grp0 {
>> +			pinmux = <0x151>, <0x161>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c2-grp1 {
>> +			pinmux = <0x2cf2>, <0x2d02>;
>> +		};
>> +	};
>> +
>> +	i2c2_gpio_pins: i2c2-gpio-pins {
>> +		i2c2-gpio-grp0 {
>> +			pinmux = <0x2cf0>, <0x2d00>;
>> +		};
>> +
>> +		i2c2-gpio-grp1 {
>> +			pinmux = <0x150>, <0x160>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +	};
>> +
>> +	i2c4_pins: i2c4-pins {
>> +		i2c4-grp0 {
>> +			pinmux = <0x211>, <0x222>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-grp1 {
>> +			pinmux = <0x2d43>, <0x2d33>;
>> +		};
>> +	};
>> +
>> +	i2c4_gpio_pins: i2c4-gpio-pins {
>> +		i2c4-gpio-grp0 {
>> +			pinmux = <0x210>, <0x220>;
>> +			drive-open-drain;
>> +			output-enable;
>> +			input-enable;
>> +			slew-rate = <133>;
>> +		};
>> +
>> +		i2c4-gpio-grp1 {
>> +			pinmux = <0x2d40>, <0x2d30>;
>> +		};
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c0_pins>;
>> +	pinctrl-1 = <&i2c0_gpio_pins>;
>> +	status = "okay";
>> +
>> +	pcal6524: gpio-expander@22 {
>> +		compatible = "nxp,pcal6524";
>> +		reg = <0x22>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +	};
>> +};
>> +
>> +&i2c2 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c2_pins>;
>> +	pinctrl-1 = <&i2c2_gpio_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	pinctrl-names = "default", "gpio";
>> +	pinctrl-0 = <&i2c4_pins>;
>> +	pinctrl-1 = <&i2c4_gpio_pins>;
>> +	status = "okay";
>> +};
>> --
>> 2.45.2
>>

