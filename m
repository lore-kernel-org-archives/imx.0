Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6F207DFF
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698370; cv=fail; b=a8t2AE4mU17vJJ7tFJfOIEyCj6tx1GZiKfHryOtlsnOsfCKRWjYdKlhEV7CSgknL6xwRhUHMVXYdijM8CpDsYf2ExjOIKf+7+j9xEBmGVAdKDnLiWj6XrY+t439HEsO1lz23wvLVeA72ZJiFsmryCHEypLHpx83h/nWMd2O6y0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698370; c=relaxed/simple;
	bh=qjAh7JXM3ug12jOCcMTSfUwQ3j65SjJpFW6THDAF0TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6cyfNzWFme6+BrD0KYZkkf1pV0SPoeeW6LVvcmCOBJzi1Bb5yjN2yxjXlwktZhVjvYimS6BgbVoN91ER/u6eGQ2WM0ZVUMU6TUwsoP/6UONd0NRYQKMNjA6fFHPxRGZKdrcCB07iA2czNFcoN3iFSnZRcUv8sowHgV3xQXejUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L7dYXwij; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L7dYXwij"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVT7AOKFOqae8cwZ2eZ9vEQv3/+ZM/XzJOEHdSwDQHFuIMDbp/1nTxCEPRDU6WGnhk58HlKK8ueOFwX6fe3IL/B3Pv6X5RQ5yP+KAENjj+5e8/pyh0P5T68vwO7plOOqi1YayrLkrrh2hjUwR30oej9dm85Z6zbyzovrchhLoUgUuYm/7SGDmhiB3os36uvVICWKibH/LSr3v7TjhBcD8Vadjb/l9mTBQW0ehtZfhBrzHj5C9nZzEgGq+1s5Pp0YPkNFndR2NzUv5Q9Q4EXqM4eoEMKW1FXGUEaUJ1aiWLrUi/ZaPjDD5tQBgBoT9l3ufn9M/kToaRYLmHMZBP5Q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLDZdMfm0LSWtSutfUN+opQ8EXFgZw5Bsf307lvmrCE=;
 b=VU9cGXklPsC0DsgwQ5D1hq/lFZtFm0dO4nFM4b7tDI7qrA1+IHMVbqU/+WGzVU5KoxduEeao88JNh7CHOVB+g8+vkp/y2zncStDvZWWKVkfqqHBRP+KuI3Ci8unFhnM8fhcgUVXEWtL8+ywt5krn8jkb/B0WBuIICoEEXamoSZ1PRjidvxoFCD1sqy0ovYxnf4/AysDB06UxWL9zZKmHxcBKbcvx+YvQ1WBUFygWd6ZcTs76LAnJGVU0Y7jl4bUPbChpjusZptbauSBqIV/wd0iteJZVNFGlCLPrFGahotFrc1Pp4pgzYtAq7maOCHBOSXBc9s3w2VJytobkVQsMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLDZdMfm0LSWtSutfUN+opQ8EXFgZw5Bsf307lvmrCE=;
 b=L7dYXwijaRuDQEvKkAt6TgGVOjb5Sv+FEz3O9AH/7dE9d2/wgOrKSL7+AqktkNv18tIH/YmV9YHp+NHpESS2srwQWF7l5gkmBF6ZAtCMRGOfNcju0sRsrPO6O8DWYB6By3Vj1qSKHpEXkSBBYrRfVC4ls6PCc+CaZUmisJCuufDQmnfxn+5EO5KH0tltlzdtLfGLdOlFtOAcwmJ9Y9IM8m2z91Kilugn04Yi5lB78YUBEtHpyF216rHAeHhVbvG1pHN6zvwZYKIMZvxrscUxwc8sibu0cEEZrYX0zZI1kjEsFQfoE7AMPpNm+3Q1ki/6MCSrxvJd9a8P+n0MQ9zgAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:39:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:39:24 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 1/4] arm64: dts: s32g: add 'I2C' common board support
Date: Fri, 20 Dec 2024 14:39:13 +0200
Message-ID: <20241220123916.1452582-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::33) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a94e1a-fd13-468a-92c9-08dd20f355fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTF6VDd1TkRsRlo4U0tKNjRwYVZtbUtGRG1Ld0pudjNSenhEc01TSHFZSjg1?=
 =?utf-8?B?WjdsaEE2cXZ5SFd1SWo0U3cxS256Wnc1NFJ2UERyZ2M4NUEwTUZnMVdBTGQ0?=
 =?utf-8?B?NjRWZ2g3WFZOb2IreGxVTHVLV2Z5Y0VYV3lkcytzSXdtUzBZbExwYkcwMU5V?=
 =?utf-8?B?MGhoek5kb2RQOHlCR3ZVZGtuUEc2eW9kcFgyR2YzM2RyRGZEZGhQc2JiTXk2?=
 =?utf-8?B?SFMySjZ5TGR2S3NwRExYbG9HV2lwbmlwb2FGYXRtMEdxL1dOeDhMRmt4ZWZB?=
 =?utf-8?B?N211VzR2RUFjeFgycFo1OUwvSnhydUVLL2JFb2lwcXNwVzB2QzZ4eDhTSHFl?=
 =?utf-8?B?UVlFWEVZQldyNlAyc1lhelIxSDI3U3E2MXV6dmpjRXFOeHJTMUxxZjdlc2pk?=
 =?utf-8?B?U1JyUksycElWL05lZVFST3p5SlQ5eDhyUTVnUGZhTnJ1ZlZrakppR0kzTGxB?=
 =?utf-8?B?TkE5ZVlaaVVYdWU2dWJvN2duYWNrQy9IUTloS0V5bXhvRWZ4blgrWFRxdDEx?=
 =?utf-8?B?V2VjeHZZQUpsajJYOUNhM3VCVDhoUXlsMS9pN05uR01aRGhIUy9lQTFlTFdy?=
 =?utf-8?B?VG44SUxLY1dJa09xSE93Y3QzNWxwTEFQRTJVTDlqWTZLVkNBa1JBSjZMc0p4?=
 =?utf-8?B?OGRra1Y2UmpidHc2bFJDVlRrd2hkSUd2SWFQcnBSWjUyNUkyVXBxamQrM2hj?=
 =?utf-8?B?WUZObkd1MHFFVm9uRjlQQWRzZlM3TUhUQ09PY1h5UFNaUTVBWGd0UDhIQjJC?=
 =?utf-8?B?UE1hMzdNWlY4TkE0OGk1MTlULzEvVEE5VXFrQ2FQL1JOMStUVFVNQStKOHlL?=
 =?utf-8?B?V1QwdW9PZk5UTE1PQlRHbktHWURlTnVBYlR4WTBEUHA0VGE3VWJiSDF4S3ll?=
 =?utf-8?B?NGFkeXVUeUJSc21XMFlMNGJGdEV4QzkvSWpBUWV3Tkg3YnFDTDd2QkxjVEdT?=
 =?utf-8?B?Lzd1QmhLOGJOZ2MvbUh0YTEzdXhXREtFZnFDNUhLaWUyTFZIbk1obmhxU1RR?=
 =?utf-8?B?TGFVV3FncU1VQ3FWS2dWRGxFcktZTzRORkU4YzBaWXdKbHFiMzFhNUcwbzdG?=
 =?utf-8?B?SzJnbVEwOW41NnExUXlUWTl3Zy9SWk5QbnFqL1B6RXA4RmFweGJjZEFUak5Y?=
 =?utf-8?B?UklwMzVySENXelk3SVJLQzlMc0p0S0dJcm1pK2oxVTNLVFJScUFLK242K0lp?=
 =?utf-8?B?a2k5NVo2QTl6ZUgvRUJDb3ZLdzNvNW5QQjZNT0l0b0htT1FTb0xQTzdDU0Nh?=
 =?utf-8?B?RDNoaU5UNUx1emJIY0JUOC9sM2NrMURnRm9uWUJ2czRtelV0eVpjUkV0MDNY?=
 =?utf-8?B?VXBZODYrWHdhbDREZ1lJRTd3Rlp0T1ZGcXdxTWpuWTRNWThvcGZZajBqNTZ0?=
 =?utf-8?B?MnBPRDlScjBiYjVtVHY4c2F3ZStXbnhUQldDTDNhT0dQNjVmYnF2ZDZ3MlZp?=
 =?utf-8?B?SzN5bDhvbDRTTkdBMGg0OGRELzBVSFppS3dtbEkvYnhuV1hiUExVajRoNjZ0?=
 =?utf-8?B?Qm82MWdXVVF4bzZrOFRUWUZuazRlU05saWxqOUxwVTJsNUZFYlF5VDdiYTN0?=
 =?utf-8?B?K3dFa1crdXV2cTNoQm0xU0VuNjI0aURFZTVvcFJReUJPekNRYVlLcXQ3aUdv?=
 =?utf-8?B?ZmZnSDBIZU9udTFSSlNxVWNORjYzZW5SYU1CY3NlbWE0WmhManlWblkzbzZt?=
 =?utf-8?B?c25Ra0JITlI1Tjlsc0xaWU52WVF2dnFsaVNRRDR4eUROMkRDT0lkRmN1cSsx?=
 =?utf-8?B?VGV4dlpBVHczTFhkVEE2QWZ1VDZwQ0h2TnU4Z3RsdWpDQmE1SHppaWdNUUhW?=
 =?utf-8?B?UFVUOERZRGtlUHYyUllqWXBHRDJsOXplK2RVeDZuZjhtVmVGdVA4NnZJZWZU?=
 =?utf-8?Q?nfiaaHJBhDwgi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFQxaUkzMi92ZUJVRmt2QllSQk4ya3lWR1h5L1NGL1FwNHBjSDBhLzc4VHEv?=
 =?utf-8?B?dHVONk53U2tGaElPaDh1TTF1TGVQa21YTU9JaUhqdGJOMm1oUlgrbzNrekhp?=
 =?utf-8?B?ajNqcDJ3U1NBcm0wT2M4bDlCOHFYaVBuUmJoQktFS05oV2FzUmc2MFBEc0xi?=
 =?utf-8?B?Z01tSWhKcFBJTEFVTzdyWTM0TXpUbTM5UXNBa3ArbHhIMzBEQVBJU1R1aVFl?=
 =?utf-8?B?UGw0WkdxOHpqc1pVUFAydWJiajVlL2kxdHM2OGVGdkcxUTlEbWQwQUxLbXF3?=
 =?utf-8?B?NXA4eERjN3NsT3VQblp5NUlvL3dJNlpvbERVc3ZzVldNQXJJck05VGMyb1B6?=
 =?utf-8?B?VnlxRHhyMkk3ZVR4THFyeVI0ODBhTld0ZHlTYWMwSmJEZzFadlIxOUIvdzND?=
 =?utf-8?B?OXZNcjUyRGJTQy9pTEk0UndCckx1bTlZS0VqQ3BVUWc0TmxiMVNzM1dpYlBo?=
 =?utf-8?B?VHhDL2pWSHRtSUs3V2piemlqRTZLVno1YTBsSXoxUTVMUXVKSHU1N25iQWR6?=
 =?utf-8?B?QSs3SWJpKy9nbnFhV0p5M0QwcVkvak54SVUwbmdKQW96NGJZMXdNWHJqOFQ0?=
 =?utf-8?B?enZLbWpsZzJYejFCZ1dXYUZ6Nmd2djdqYkV0aHBOR3YvazZTeWYzZEZudGl1?=
 =?utf-8?B?T3JZWlhqQ1ZQUmhRWXhrU0toVE8xZXVTcXBFOTBybnZIYXdPM2xjdFh0Tmp3?=
 =?utf-8?B?am83VDRyRVpjMTFxNkFLdEIzd1hXVDg0SmZIZHpIaUIxOFBYcjkzeXpSVHh4?=
 =?utf-8?B?TUhnM0hJM0VyTkhCQTY0SEFvL09HdzBQWXozN3hJOHl3M2dsUHd4NnQ2OUZy?=
 =?utf-8?B?U3pJUEVZVzduaFg3Q3A4Ni9YeGNTVXpnLytzQlNpWHBURUNySlcrbmc4YW9S?=
 =?utf-8?B?MWtuZno2dmxNQjlsVGNhTzdUUGpwQWExOUFLZG9HQkJzcVJ4L2dadnJqdi8y?=
 =?utf-8?B?Z05ieUlpamx0Z0RUZWNYMzcyVW84bjlPSVk4elUxemtNU1pmVk5RK2F6RGRD?=
 =?utf-8?B?WUh6WExNa3ptU0hENEw0N2M1dndINWRaQkFTWjZKcnFEZW5FeS91dXd1clpj?=
 =?utf-8?B?OE5rQ1JONFpYT1BnS2I4RmdMTzdCN1ZnRVdrR3dIOHBZMzRpSGdzOG5ia1Vk?=
 =?utf-8?B?Z1lGc3JnYkVBY3V0aDR3NkY4aUU4WGhPQlV3VnFnVFdVdFp4VGlsQ2R3WWtj?=
 =?utf-8?B?bloySTJKb1d2WHk3SGRqRWZMYTRnN1FlQ3Y1eUU0WVZQZ24vaVpUU3dJSkZS?=
 =?utf-8?B?ZjMyamtqd3pyUVgxc1N2R1RlUG42NWlMMklhTXdxWHNIc1pla1ptaGtEaFM1?=
 =?utf-8?B?S3A3Qmd1ZEFyWGptNDVLT2YzcGp6RmppSDVIdnk3Z0Y0NWtqTm9ZK1FGN0pC?=
 =?utf-8?B?VjVWN0hWaXkrMkxvQnRGQ0N6V29LTFU2MlBVVy9TdzFjRXFTUklTR1gyWWlw?=
 =?utf-8?B?SzdVZHBBQ2VJcURkbEUwNndZUkV2WGlNVjdYdFBGN3BKbkljOUpULyt1Tm5Q?=
 =?utf-8?B?SEI4U0hnbVhOb2JzOEd0Zm1IV01Ia2Qyd28xMjY4YWNqdmlHeVBsRXJkeVZz?=
 =?utf-8?B?T0RvRnhoRjJxaFRlVytibFlJTFFZY3ZVNXVlSSs4Vy9XQ3M0L2dwWnVKOTRm?=
 =?utf-8?B?ekdmTEtTSUVCRGVOV1dMenZQWnh0Y241dWQ2N3NiSzJ1ZEhFdjZBTGcrSjNs?=
 =?utf-8?B?MlNhM2RyaUlOMytJTndJM3NKMzV4bFlCVDY1SjFNMTRsRE5jRlQ4UWRsb0Ix?=
 =?utf-8?B?N3Z2VWhwTlFSS0hLR1p0TCtLMTJubXRXRFRsSkZrUG45ZFYwNi9UdThmcE5v?=
 =?utf-8?B?SnRzZXF2WGFHUWVMMXBkTjdlSkJkL2V5WkdxTWJuMUE2aTFiMmNPUVVxcCs3?=
 =?utf-8?B?U1pTWVFzQWVMWG1iamdZK1dWTmlMSWRhWmFIR1RQcHl3VS9PTGpnZ2YxaWZK?=
 =?utf-8?B?VU1wQXJVbE5XTlhWMGpBWVZNaURIVHZBMVRZSHAxYm9ybk03dmVRVEgrb2lJ?=
 =?utf-8?B?dmVuNmE0RXZwOFhacjdzVkgzY0gwKzlyc0JkZHBIZ0FtUUtyQmZXUm1UL0lh?=
 =?utf-8?B?NHZkK3ZycmFwV2FLc2t0NlYwejYwZUMycVBzMVF1Z2k2RGNvdHRidHVnTUdO?=
 =?utf-8?B?ays4R0JEcTMrR2ZBNmFTTFBNUlFWTitFUkZkM2pCSVgyL3hVaExNeWZwK0Iv?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a94e1a-fd13-468a-92c9-08dd20f355fb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:39:24.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oG+gl26vAyjli0/O7/YyvOm2QypgwVwrBAWWrKBMY6/LI5ieDJEzrUOHJsGigTF91XfdeQkUjWmLwQhFUQC0nkoAWWkPt7201nU9QbtKitY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
(i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
will be added in further commits.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 7be430b78c83..1a9683c234b7 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -333,6 +333,39 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401e4000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401e8000 0x1000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401ec000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g2-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -341,6 +374,28 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x402d8000 0x1000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x402dc000 0x1000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6c572ffe37ca..5d28b439906d 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -390,6 +390,42 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@401e4000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401e4000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c1: i2c@401e8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401e8000 0x1000>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c2: i2c@401ec000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x401ec000 0x1000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		uart2: serial@402bc000 {
 			compatible = "nxp,s32g3-linflexuart",
 				     "fsl,s32v234-linflexuart";
@@ -398,6 +434,30 @@ uart2: serial@402bc000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@402d8000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x402d8000 0x1000>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
+		i2c4: i2c@402dc000 {
+			compatible = "nxp,s32g3-i2c",
+				     "nxp,s32g2-i2c";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x402dc000 0x1000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 40>;
+			clock-names = "ipg";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
-- 
2.45.2

