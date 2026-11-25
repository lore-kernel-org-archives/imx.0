Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795601375;
	b=oKq8/8vcvKr14cUKtgnRksZ04vgEdmryWp5lbf+I2S2loJ0a5uTlHuiEYw0iPS1PfZOO
	 ZNMLMOt+7pyrjOh+HDvA47XYcPToE9o3XDZfZJFXzYFnxm5I5tRYnxUmH6aPaIBpt3AeS
	 JwweRujPRl4lhqfjq2RWVdXagb4YyeuZ6q0edsU7Atzn4E43J16hIuky+uuCp32EubRZY
	 4PRYu2QFDZUGAA92b6Y85ZhZBLq02Y1kX2T+GzW3jcBkKwBF/m0rmTX7gArNEDvvxuay6
	 WcyUEld6P2SjtWbB6cG5OPbJo8rW6GvqB3KByYbd6/vFHoTRI0HoSHD/L7/sYkCrpBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601375;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=94jKpoVVfEuzuYGJ/QGmpD4nwJD9rbbVjreDdQE30gE=;
	b=FKZzPTi2fRf+CScq8gEGAr44ey4D1lZ72Mkbh/AEvxzl8pD8Sne270ObcdRYp6fVl9DI
	 5VW07EKFFCcfVFdDKZCCD7xVf7JhiOorf3hPV7DifcGb8oLYE+3gYclnniHtiG7hvatzn
	 Tq5dg+0fQFqo3QK6vmNeqEQ1lkWMQ5d4/R0oCWjS1pDdkEK4XpB7jfQnEhbded10Hvphz
	 MnPUdA7HKWFQ1V1iylkM/3XIZIrJxQ5w9118Nq4js1bwc0ZJAz/HP8CNftXKq6ZxlDALo
	 MepKgAlU9BT5z1+1LVJ9WcoSH+ZdC8FwXKNAE0woK2j0QuarD+tLhGpU+adlrD1ElZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="yDg5j/z/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.15
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8211606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 10:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8211606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yDg5j/z/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G75rPLKAph6x3VhsfZXMdOl6Y3RQnTsWVGlLNwMDSRlnhd3mKtTCSZMpw6vgrEUwv3VMQ+d9/5/DKRnnjmPdtTvHM4eJKWAadpD2rao2vQsTtUeaKH2T/dI7WS5YNxD6uoPKj9BoBcgKNYPozd4U7oK0VajT3Pyv0RaYuX0PNFDP8iy7lnU7pl+e9UmmNPXcrl9t9iMcmrtwvuduupQRcT+XUUfBxX4k5VLh1Xoth9au4gfe0NlxrHXIGe/IbJ7ZsUftIVWqQD0bdlF3AdL/xmp7pB3DcRZbTyWlZn+sqEEdagW6viv0jrheuTyHq4qSd9sfConL1Dt1goaZAG/1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94jKpoVVfEuzuYGJ/QGmpD4nwJD9rbbVjreDdQE30gE=;
 b=hitoE7ntinFWsLXKS1b9GhpUge+P/XcMkm4dvZj+nqJXp8GSOlJzrj8ULIRK7wQ5YOjJ4CtZ4wJMnvOw64BPCYu+F/Dub758KSeYxCmjP+PnEbJC2yL51Reswo22q/ZBsbuaEOGAECJHurnZ3HCAkEpfvmOc6QuxYVN4a2tUl6qjvSV48AOuGir3M4TiqaIzyZYyaAyIzEyAqjJwZbIo+jkOjiCI5v+7T3O+tWfVvh3kM10Rmr7OAUbGMAJJQO1eYkC0mClTm1qefPzqRnxCXSnvQQ/vDxUUni4y/JGf1vq3o78nopHG/b5oHDoT1eji6aKcIHXsoRhDPq2qaHkQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94jKpoVVfEuzuYGJ/QGmpD4nwJD9rbbVjreDdQE30gE=;
 b=yDg5j/z/u9C6xFBj2WZaPOzKk0NUthrITZl7H0ixNy/n/hjSkZ/ko/EvYW8p/xGe5iJfL4Zql30yu+vTouqayuCFNuKmTiJoc6Hgugx09+Pgq5KuSch07rSDO8tTPXLf93NPovT6wZ/KGIlpj9BJzdba7MKbHiLQW4n8ZGps/vcCF9goLhS1rTqeFykKAKMj21K3RzATy8HbPNcvtEqEQ1QdQNRJMjJRzymh65xyrGZ6qKBtAUb0edBgaqY4n22Q/w12J4Wu33Tbl1Ev0gEzKW0A+c7eL932O2s+IpxIKnJL3SRekbTX1oAWeCBXQ9Ylb7EKCrry7FB/ny4D0qbmfg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by BR2PR04MB659875.eurprd04.prod.outlook.com (2603:10a6:2c8:1b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 10:09:30 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:09:30 +0000
Message-ID: <006c7209-fe06-4aa1-bed8-2fa74b4d0edc@oss.nxp.com>
Date: Wed, 25 Nov 2026 12:13:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset
 framework
To: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::17) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|BR2PR04MB659875:EE_
X-MS-Office365-Filtering-Correlation-Id: 195d4590-7639-4835-02ec-08df4adc321e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261028144727099003|261102123227099003|261021121427099003|20046099003|6133799003|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BeltwXAygyjiBeFkMsxNC4dQe4QeKieJxYMUymCMz8rYvsxz4LiBYAL2ClgwIPNuQ/dpUk+0Cr7aHbcdX0n4Oo25UPBGEsLlVwZsltCBwtxRprQNYbo2r0mstPH+oFNR+u1G84ApmCrx7bLW3t5GC9JMcNa8o8TlfpkcPTT6t71zmLvXFEMEaiMRWuERbJPrqzX2FonbHX2OHMQvn2dtZSn9oa/2uplhbsanby7W12luTC1JyyGe9mLbxbAC47Yj5taEtM/BAnzq6iX+RsjkJ4CvieqzSM5AUIM+FVNCOCq+fvX+J//xDU7QVg1fZJJNK55vTRpl/DoGYXEOUX3rk4UN0vU6QJ2snUClwIRExN0baEe9ilXTHjF0otTPvp/QPDr9Zl8BjBz0h69bhGhLHD792gGlVQcB+DpdpR+76e9Yr2Uf8hKcKE927iYeo9XTdbYSBGi/cIXGjZ52rwXUIel4Nyh1RySjgQKhIlB9w8VLohQNzLesqIh0yK17b4jsxearYX556RvnqxwVhkda54Qr0OJObuQbU+a8ykD7j+csKDiGDZWQilgW3BUT6VqVz1y69EQsg/wuv5MtRFmenPBMolNGRabJcJFFAOYx150x2ZZUQhY3ZEPSArrBRb1/CDr6mHtYriw/s50S1xo31hAjfm+2G9wXtnX/+q7UuRBV2inJCuh8uoc2Y5Nw+l0Wb4i6RxU6272Gru0CS+WqKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003)(20046099003)(6133799003)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0hZdHhKNE9DYmFrcUtOaDhOVnZabklSRTZ4aHR2b2o0c0syNW52S0lsRUEz?=
 =?utf-8?B?aXJvVTNQSyt6WWJMdWl4RmpqQ2Uxa1BOam40cHBTdVJEeERzazFLRlNJRHdl?=
 =?utf-8?B?cUNraEFlbkZBeTJpSkhldEpsNmxBNVIzQ3kxdnZ0OVRBRHRwandUOHRtbjNS?=
 =?utf-8?B?MkJadGxZS0hHT2VhZjM5WlY1NEVoV0dkR3VVNXNGcmJXMDZLNFZYTk10RzVw?=
 =?utf-8?B?bUJhbk5zTWsveDBQZGl3WnZOYWxwQTB6aE9Vd3RqUTJ6aHdEQXVRaFowY2N2?=
 =?utf-8?B?K3RCL2Y1eE8wR2p4RFlQeFZqaTdVRWVNOGh6VVNZZEVjRlh4TEUvcXBhWXU2?=
 =?utf-8?B?ZEVOYWUwcUhQUmhFWmJiSjE2TEkzRTRMV2xIekxqWVpCWWVxM3VFNFQ5OXpa?=
 =?utf-8?B?eU5oTHNHWFFhb21kdDVkVi9ZME43UDdMYVVrZWY3VXo4bndmSkZkVkZyeDU5?=
 =?utf-8?B?bzlvMWE4dWg1Yit6TW8xUDcwaXlRc0VxZkhpQXBvdjBoY3AvMDNSRmxrZEly?=
 =?utf-8?B?M1JmSFN3Tm9ORnMyTVg3Tm9BNUFlNERXNDhoVWNLaUczY3FsRWdPT3diN2hv?=
 =?utf-8?B?R0RGTmRCTHpDUUR2KzJCbVZjblFNb0dBdFVJOFdYR3h5SVpUZnNJTm1wSnhm?=
 =?utf-8?B?cHZ0TDhPaFZWbG9oK0Q0WWZHVHJ6cGFlTUdRalFrbjdVM3Vjd2liSTJ5bmVx?=
 =?utf-8?B?aXc3SFBIOTg3T1Z2bUJHTklKNTIybzNvZkVTRzgwR09kS0hocjFiQXZaWWpp?=
 =?utf-8?B?VUwzWTJMR3dLY0l2R2hSZHVLZzNVWlhnbTQ5WGNuVkppNUVJNmtuWEJka3NB?=
 =?utf-8?B?WGRyWXJYNDYyZDdBSC9IcE4xWGkzcytjNTNEQklzWEYzelRrd0tVUXNpcVlk?=
 =?utf-8?B?Y0RjK3d2RENidXd5d0szOFlNem53MitTMjhXUWpYbUNYZmduV3BBN2lVTVUv?=
 =?utf-8?B?cjczd3pSZStGbGdyM1lRbTdiNjdVUGlqTVdnYU9DdUM5UVRKUkFyVnZUN1VZ?=
 =?utf-8?B?SzJsVTE1bVp4dWgreDBQdjN0NEltcm83cVZKUk5wWGZaYVFBK2MxYk1zanVN?=
 =?utf-8?B?YnpYUk41TkZmMFEwL2lhSDZzRlRKRTlXdS96VHV4T2xjZDN3RHB5NVZsSkpO?=
 =?utf-8?B?cFdKUnIzcTkySXF5SkV5a3hia1Iwd1JIQTJRbE9ndHUrRkZYTi8xczc4TE1x?=
 =?utf-8?B?ZnQ0SHpUV0pqTDhoY1l4VmhSRTFndDEzYU5GdngvTDJ3aGF2UDduVVE2VFBK?=
 =?utf-8?B?UzExRzlUNE1vWmo0THRzZzYxVEFTSzhFNkExVmg1aHBnMHNLSkxPd0xyc0Q5?=
 =?utf-8?B?akxONFJnNkxsYWcwaGZWdld2ejh5U0phZ0lvcUwydFRKNnh3c0owQld5anFE?=
 =?utf-8?B?aE0rdUVFSzBZUjNUUWxQS3lXb3hWMzA3a2hVRitia3ZjUUVpU09yOWE0SDR5?=
 =?utf-8?B?UzZZQkYxbG5JTXRPVlFLZzBTb0N0T1NkcXpIWXJsUVplN2c0NFlQcW1UV3Jt?=
 =?utf-8?B?eEw2eFl4bTJVV2RocnRVa25UZVcwLzJVK2lUYzhweHVodzFSYnpVc0gxWTFp?=
 =?utf-8?B?eS85Ym00OVZuQmRkVDVtdnRNSHJUTE9LeEFDQklZTjZxRmlOUkVEZkkrOE5v?=
 =?utf-8?B?NTRqTTQ5RXpXZ1NGVlk5eU1maEx6cTJCcytTbG9HWEl4WHU3NGVLWFRjZTRS?=
 =?utf-8?B?WFdHNWxudEdUTmdqQ3VhQURJVnllTjA5Zlh3N1RBZk4rQjJROU1oaEJLR3dW?=
 =?utf-8?B?SVFzSjNFTk1hczBjamxoby9kV09kRXlOaUVENmpvTjFnTGZISnBKaS9XTmhh?=
 =?utf-8?B?UnlDVkxTYjNiQmQ0d3A1RFBDbGNxSWE0ME9MN0xxZHA3ZlFJbTdWejd4cmtK?=
 =?utf-8?B?d3pHcE5GQU9jOWxzQ05hSnBmWjRUV1B2NTNUemNlOXhFeDJLUzJGbk4zTFhT?=
 =?utf-8?B?eW9YdW9oOWE2OHREL0czNytQelFKL3lVVFkvbzVKaURRVU10NDVRTzhnS3lU?=
 =?utf-8?B?cTFwS0NuQmVvNUtwMzlPU28yN2ptTkVxUloyVjV6eEhtWDBpNkIzUjN2aWlh?=
 =?utf-8?B?TEpUbk11WWpDbjFHRWtyMmxlbmF3VHZYcTlIUktXcnE4d1BWS21QR1pRVWcv?=
 =?utf-8?B?UWJuVXMwVzNucEkzckJzRjdOYTJmRXFwZXptL2l3Yk9FNUg3YlRFczVCUzIr?=
 =?utf-8?B?UzdVOWVLRFRGOUhJVnFOeFl6cTJWMS9YYWhrZ3FUWTFHSGxtT3lvVjl3OHZN?=
 =?utf-8?B?N2hMN2tTMjdUYlVJZ1RHY2NUVTkvOVZhdHBXMmVrTFptZU1MRUpKNXVUUXZJ?=
 =?utf-8?B?QVFjZjE5TUFqWWF6Z1M4M2MvZUVYNUw4Vyt0SW94OEJHZVpteTE4dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195d4590-7639-4835-02ec-08df4adc321e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:09:30.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOoQaahWdJgriRviXMsDSBuORHoJFn1qu2AaKI+4HU5pR3sX5lOzcizea1pg8nKSOdMI+p7Ms47AyNzQykwxFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB659875

On 11/25/26 09:38, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Replace syscon regmap-based DSP reset control with the kernel reset
> controller framework for i.MX8ULP. The syscon approach requires direct
> register access and creates tight coupling to the system controller,
> while the reset framework provides a cleaner abstraction and proper
> reset sequencing.
> 
> Three named reset controls are now consumed: runstall to stall/unstall
> the DSP core, softreset for DSP core reset, and dbgreset for the debug
> logic which is kept deasserted to allow external debug agent access.


As Philipp pointed the wording here is a little bit unfortunate. The reset
sequence is already correct what this patch does uses a cleaner and standard
reset abstraction.

[...]

>  static int imx8_shutdown(struct snd_sof_dev *sdev)
>  {
>  	int ret;
> @@ -202,42 +201,32 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
>  
>  static int imx8ulp_run(struct snd_sof_dev *sdev)
>  {
> -	struct regmap *regmap = get_chip_pdata(sdev);
> +	struct imx8ulp_chip_data *chip = get_chip_pdata(sdev);
>  
> -	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> -	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
> +	/* Controls the HiFi4 DSP Reset */

I would remove this comment above, as it is obvious from the function name what
is the action taken. 

> +	reset_control_deassert(chip->soft_rst);
>  
> -	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> -	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> +	/* Release HiFi4 DSP Debug logic */

this comment can stay. 

> +	reset_control_deassert(chip->dbg_rst);
>  
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> -	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
> +	/* Run HIFI4 DSP Execution */


With that said, 

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

