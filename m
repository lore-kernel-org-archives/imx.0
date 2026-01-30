Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1E2FF664
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756939; cv=fail; b=k2+gm3WBcJoXpt6M3p0jFsnnYvUqV2MpHFxonIiGdT7A2ovAktbZxQGy4b+nLzGSof+T2NTrHnSdORnT8SAaq2+ShIgJEvXbRq9hepSj8oAdzM9b9syJ9xg1ZoAa1F5+dfrmOcNYkH/YEon5lZQCo2YZR7b6zth6w5JMppDiC7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756939; c=relaxed/simple;
	bh=oGlF1G/HOotgDwCg7lQ6Z3ibMXbcg9w/+FLHVj28Wng=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vo/t6YReMVPF6bw09qnEPtZHcYlCpTjVkAvMJ5UX2CvfcPboxnhLJg+ABPn6XsSr/h5XWxTJbwxAnawVjmJYjhHQLrZ1Di4tqFiLj4a5W4Rp5KaqBogy11E9fHrAXZ+s9RW8g8ZD0qhKp+/xJgyEXV0WRfPFO1WwQxpnPhuH11c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D17NyQvB; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D17NyQvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxaslm+SAzpIuJzFq42esS0szskCy0np592WzXvzxX9lGaAd7qg8c7QGdVnhDT9R+r2O9jQy8PnuozXx5bpyO+DYRkgyDe+Q4RvP4SsP7KURWcWzL3viecZE+sDTdstU8iZr9GMr0JU3MFTGJAtghx6sHRj1pHENMUH1H072j55jdOmduZyEdqyMC5qFOT/X2w9dw/GsRRYleK0Jq2lzZoK/ncvEhT3kCedc0KR+q4UKFFghvs2S2ihDtJTCbNtg99R18VDLtMfRLsnmkNO9rSLqcMI6ronrv0e9FAxzmYJBjOybb2pcUwddeDTxr+5WTsaIfWkm5q3uYTSYvLxMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTH+sbyDJstPS3T/Ewf3dQx9WHo9qUXxXkVwe2dtr6I=;
 b=WfFnF+CytWFwUZesjdFoO2ra/aJwSCdG0lUNaz+mOD/GEvrsiWBMKJnoBiQUl6Ad40qVVLfwg9Si/SO+ZD1QdWHdwelJV6MolTIF1oTRvl1ZfuufGtbOQ+rWMyOPJyyisvByE9ntPVYvOM034HnBEaFl4BBFEiHQAe2OWoK9UKqSb2DG6cVqOCeb3a//MLfcdGj55zeGT1kLQQEYdetVsd4EWIfWtfZ0X5GELKm8JhdaUyQsYO183GOG5pGyEqA2YHoWKX9gyPO/yRhb14m9l1u6GTHX/z80v1KZtEq+NQkBuAz+IFhmHREBz98UhsYeCReGNO4iZTiuVSc7ZyIViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTH+sbyDJstPS3T/Ewf3dQx9WHo9qUXxXkVwe2dtr6I=;
 b=D17NyQvB9i53l6cqtRk42haUSgUDdxk6h6qUd4Y+d/6KiBnVpk5zTohTb0pvjT5WBZHSIYOgIAbWhRV7ofxg+DQyvGZZzGg9/MZP7wpTRvjsyPIljyLuHVh1uqusee7suNKbeAfEHJd1d4w/l9LERCG+BfwNwIm2145ZkI9fvAZ2xG7gkkrpkRKFa57ggBD5b02+kTVnolmgu5ENZwSYHyli6SGLx/QFlnbiClK9XeiTm8MR9Zso/H8aUEnahZiTdUfjVe+qblB070dKM7DppL5U1gAmO+ANbUPjzl+uJFKWhZumgcXREMXSpKrVrJcLrV63RGwD8blwg3iplYbBoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 07:08:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 07:08:53 +0000
Message-ID: <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
Date: Fri, 30 Jan 2026 15:09:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
 <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5a9767-1b1d-4bd8-827a-08de5fce6cef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OThSY05ZZHdUQ25SdnNHRzRsak9RelN1N0F0SklUWTM5Zzc5LzU1RzVGUEVR?=
 =?utf-8?B?ZC81Vkx5aDhqYkk3MmY2bzMzNlhJZG1nY1RqMmJrWC9JVzFaWVVQcUxTVmJZ?=
 =?utf-8?B?Tjh6VVVJZWJTSEVOUFZWRzB2bFRubm1pY3hyK1REakFpZ0pLVVIwUmJCTU9W?=
 =?utf-8?B?a21lNWxBTGZnYkpCK0s4bzQ2Z3Ryd3Q1YlhreXFMQlcwNG9KNk1FZkJRSXp3?=
 =?utf-8?B?OEtzNDJGbERnQkdlc2JxSXFHQ3RSKzJZTjdESmJEbFBhNDA1Ym9MN0kwcFJk?=
 =?utf-8?B?UG5BWTUwSUNxVlJPWC9RaCthQzV0Sy9PejBTYlVWbDhhNWdLekdBcGZEVUJa?=
 =?utf-8?B?NDNPZlJCblRERi93RVgzZDZlZWxtWkdRTlJMOE9sN0VRNkRQR2NGNG9RUk9y?=
 =?utf-8?B?eDhSN20zSzk0RjFwMnVSTUs1bGhrbDJxVFV6YkVzNHd5OEF3RjNtZ05FR1E1?=
 =?utf-8?B?RUk5MjN5UURyNHNpSlhYYmM4Rm1CcmFBZHlTUk9IWmpLR0FsQnl0R2dsWVgx?=
 =?utf-8?B?SGNlUkxSOFZlQm8xZFhwZkoralY1K0JCbGozeTg4dDJuZWJEelJmMlduN2Rv?=
 =?utf-8?B?Zk1YMGVPWFR3bmRaMjNMeUtRY3lUUFhQcnlpTmlhZUxhV1J6WjdPVkJvNzlO?=
 =?utf-8?B?L2x4WjAwMFQvQ0huSzVBeVZEc3FmTFdTWk9wa0NKeTNIV0FBRXREWUk1dkYw?=
 =?utf-8?B?T2Irc2F4WDlrMm9FYzA2Z2M0cGxkSGViZWY0TndRbWswc3FQcGc1eXl5aWtq?=
 =?utf-8?B?cVlpNHhwWjN2ZVBkRjJDVWxxVlU4YnVTZHo2OFp0eXVNU09kNE9QUnBveURl?=
 =?utf-8?B?Nis1VHd5NVBiWEFTeGxZTEZOdXBEZlBiNVZpc3gyVVVWMVJGZ3k2WnovUU1m?=
 =?utf-8?B?eHdEZ0VqWGdla1pjUVRHWXViTXBjVmVKSlowOXA5UXcwSHVaQjNqWjhGaXcr?=
 =?utf-8?B?M1pLeEIyaFhCemlpdWYwWkxrUGlxMDd6MmYxM21wRGR6YkgrTVAzVmJPeklC?=
 =?utf-8?B?V3pzeitBaTUxZWVDMW1oTkVrTXV5NUJBQUhvekJqcTV6d1dxWTdjMW5qcFBm?=
 =?utf-8?B?d0RFVEdRSTJoVmxwNnJTaXVsWTVsdWUzeS9FakgrNjRWMENQa0VJcUQzV0F3?=
 =?utf-8?B?N3hJbDc0SUNMcnczTGFhUm12NHdxZk8yeEt2UTNkdUFIQzNlTjYwQnp4ak81?=
 =?utf-8?B?aEV5eUNqSUZhdGJrRkVXVmFOSUVZZCtiMlF0L2hTaDI4MnJBaDNEcTh1SllT?=
 =?utf-8?B?ako2N0Z3a2RxKzNiVzRScExCUTQzS2R5ZzlkeCszeDQ2VUM2cTN6a0FDRVV4?=
 =?utf-8?B?RlJHbVRuR3BjK1pKVSswaUpLOWtKeVJCY0NyNVZFNWZKa2Z5emZqWWtVZTYy?=
 =?utf-8?B?QUt4TjkzelMwU1A0Ri9TeVhoSmQ5TzRpbFVvMm56K2xFVERqMEw1Y3dpdnkx?=
 =?utf-8?B?V2poYVpFcndZUVBSRVRCektHUG1ETG5MeldyV2p0dTB6WHZrTWVNZjNCY3hx?=
 =?utf-8?B?WURFWGVYdysrUlRXTjArb1gwZmxVQk1RQStYdVVtcmZVeEQxek8rcnpPRTFZ?=
 =?utf-8?B?aGkwMVBQQnRoY2lMekJTRDlzNHlKblc1WWgvR0tBU0ZyN3Y0NS9NS1liK2xu?=
 =?utf-8?B?ZFp1Zk5leUVEeTg2RWIrdHkvbUN4NExYaXdnK2pJWDFEc1dFRkRNczFzOXBh?=
 =?utf-8?B?TWVQYzdicWFjcGkrRnA3cUdpZDFCSlZFU0FkWUQwMklUMmNoSnJQa1BKWCtL?=
 =?utf-8?B?SGVWS1BHdW0ySmtBRVFuNnNUZ3lENXptdXgzbm02dGVERnN0TDZsNGFYdXFK?=
 =?utf-8?B?NGUwb2xSOUMwbE9KWWFtWjViMmUyT1pZTnYxbnJBeUdHdlYzQjZSK2k5dDFi?=
 =?utf-8?B?QkNHaE9HR3dncWxvWFdiU01GNlMvNEpTbTFJc05XMWgvZVZzUWVBeWYxRVZo?=
 =?utf-8?B?RVp4bE8wV2N2ZTlxZFFrQnB4M3FTUzRzcUpkaXNVNU54WWxQZmU4RE1PMnhv?=
 =?utf-8?B?eTd3MUVyU1V1QVloVFJmRnc2eUx1MnUwTjM0U1hMeXVpVWliZW9OczJrRjVo?=
 =?utf-8?B?KzMwWkZWR2tLdjJhNmNHL3RGbXp6cnZkUkd6MW5STGpndEszVmdVM2psdW1D?=
 =?utf-8?Q?LCIk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RHQvamEvb0RhUFA1L21DNEhESy9mNFpOM1EyU2NQM1JOTDJNc3BWaTJPM0pL?=
 =?utf-8?B?ZURJeXhOR2hQNGhLZGIxOFJTeXMwVWR5bGhzLzYzaitkbWNXWXA0b0VMSWFK?=
 =?utf-8?B?OTh6SjZKdjNpeW5ZeSs0Y29UUklMd2JWdHBMcUxxT2V6eE53Y1BnVGp4ZEVQ?=
 =?utf-8?B?bFVid0FPT280SkYwbHR4QkgydW5QOStrQWJ5cHNlWjEvZ1RCV2JBd293U2RP?=
 =?utf-8?B?Q0l4KzFEQmd4Y0Q3MGE1MnVqdkNNUStMTkIyVmZJWld2RFVVSk9jMmlScEFa?=
 =?utf-8?B?emJGV08rOHJsVzJycWtudWZqVkQrSm5mcFFHbkFYdHVCSGFuU3ZjeXNTemJU?=
 =?utf-8?B?aGVNb2RkeGtGckVLYkFBclIwSW1vakRha1lOdEs4ckJwSXpsOUNIK2lIWFpS?=
 =?utf-8?B?VGQ5MFBVYXUzekRjaGJ6Q2NsN2RVeVQwNUNlYTVBN1lyTjEyTnM5dHl4bjAw?=
 =?utf-8?B?UUZ5b0RIcGJCTWgyZk1kS3BjQndJNmNZMjIxMW1XS0RoMG9YNURNWlhiWGx4?=
 =?utf-8?B?YWxHWkxoNGR6dzNBLzZGdHFyQ2t0YS9rNHBXVW0vSnBsSmFIVXRLQWhwcVJN?=
 =?utf-8?B?Y0oxdXVlSHkra1lxNWhvSm41NVpHbHNnTHIzZU0zNWw5ajRvOER6b3IzUi9K?=
 =?utf-8?B?Nld3alc2bWFnWW5ldXdXblNQQzF5QWtFeEdaWWVmRWJmR2xmbDZWVlNLSHZa?=
 =?utf-8?B?RFZuZDh5ZWFtTUNCN2dzTmczVFlDRUdzVUNzcU1EM2NnLzRqNEUzNzNDQmc3?=
 =?utf-8?B?SFNXMWUveUczM1VlazgyMk1maXMveTlTRUFxRkhqMmluL1JIQjd0VEp3aEJM?=
 =?utf-8?B?RVBzaDdDZitFamNZbzFnZEZwSjg0bXoxWENuWjYzYVoxNUplTXpONzRrRVVS?=
 =?utf-8?B?OFUra0dCVHYrSCtaUjBQdzZLUzFFc2tTQjcwMnN6VXpnR2FQZkdTaTdQa0lD?=
 =?utf-8?B?V0hROC90Mld4TFlOMGpTNGdpVkExNWdzRW9XMkEwb05IU2dNZzNKUWYzK1h2?=
 =?utf-8?B?bVZRK3g3TlMybjRTNytyRk96aFZ0cTZVVzJrcnJIQ2RKaTVFQ1ROeDloY091?=
 =?utf-8?B?TGlqbVZrOGRkbFd6aFVVYkVabWpqQ3FsZU5BalJiYWFRa2MvdytObzV5TTRj?=
 =?utf-8?B?YlYwdE1LVytqcWs4NG1XV2ZEa2V2QlQ1ZXBWTlpOYVFsRmF1QTFNMlpoWGxV?=
 =?utf-8?B?aXdMUGhXYUU0K0lQaUFTYTlFaTNNR25QRlN6VVdoMFo0WHRMOTNPNVF0OXFV?=
 =?utf-8?B?QTdFRGw1QlN1TEhpUTVOODY3WlFWY25TVFNjSnNhSUNqTThuRUg2YVpzR3JO?=
 =?utf-8?B?S2RtVHJTQlVhMjN6dExSbER0aWlmYW1OWHpnWjRuRUtCV3RvcCs2SEgxRjJC?=
 =?utf-8?B?dGFVVVhjdEJpaWpVSUJ1Z0xGVmozYkl1YWxmZzZVZmNwV2JZVzh1ZlB3NDJS?=
 =?utf-8?B?TzUzS0JYZHNjNWM5VldYbytKaCtFMDF2Z0o4MmxGRnZkcHBaUUpRZFhPcCtE?=
 =?utf-8?B?UXhoR2xCT1FwM3dYSXFyVTBhME05cU5vNmk1eDRlSlB2bEZuNkVwQTh2QWRS?=
 =?utf-8?B?bzlGcDcvd3pWRFBCOTkwKzRsWkMrdTF4YWg3SDRzWkswQXlzZWpIa2NORXRE?=
 =?utf-8?B?MUt1YytSSmZjR3Iwam9Kek5UZ0dqWG9Gc09IL3hEQjZZdTd0ZGxoMWZsREJD?=
 =?utf-8?B?c0NWSWxGVXl4UzhHMFpsZ1J5UWRZV2ZuZjkzbFh4VXpPS2hRUlFnOUN1bkZn?=
 =?utf-8?B?ZlVuWVhkdGQ1eTBxYlhqM1ZJeDFTMXhaQnVWQmRjRjM5ZWpNN0ltSHNXdmNZ?=
 =?utf-8?B?QWJpTGhkTWVYMFNKVmwyK3hKbndjM0s4cTQ4bFNTWkdtUWJCbWY4a0tRZHBV?=
 =?utf-8?B?TUpoN2x6Sm1scnJSeFZoZERQeVM3ZnV1dnRUKzQ5WTcrUlpSSTdBZ2lvdlBk?=
 =?utf-8?B?Z1dERVNrVmIreHpoRW9CTzVMbW8wK3NUVDJxakZyc09DWCt2eXBpTTdNcy9x?=
 =?utf-8?B?b0xVdERDSjdselZWUDBIZ3dpM1BnMGFXeG8wRFFsNkc5WVZWOWowMlhwWFFo?=
 =?utf-8?B?Mm41YlZaV2ZlNnRlR0Z3ZVI3S2NTYmpkcE1pUHBJZ3lsM0g2M1U2OEtaczNU?=
 =?utf-8?B?VWk0S1JGeUJrcHM3RVYyYWNZLzlodHRQV0JRbjRyUk81cVN0S1RkSnZheDgv?=
 =?utf-8?B?YmZvWHJPQUxmTlNsZzZEd1Y0WWticzdacUlveGpNV1o2ZUhIQndVOGhGSG9X?=
 =?utf-8?B?Q2hkUVIrLzlhcGNucUVTRDJuV2ZWNnZwbkhnQ2dpZThaYXFkNkdNT2JQa2dH?=
 =?utf-8?B?M3hqRUY5aXo4ekFhci9yNy9GNzVJT2FpdlVvOGhxelVldnYzV3k5UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5a9767-1b1d-4bd8-827a-08de5fce6cef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:08:53.2148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y26Sd8RmiLT0ml3O/bo3xRlai6tQ5CcHLeT4Ako5uSdFs6rvgIzbkDKlASYSRvfaEx/YSwd7snCPCnE/DAI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861



On Fri, Jan 30, 2026 at 03:06:19PM +0800, Shengjiu Wang wrote:
> On Fri, Jan 30, 2026 at 2:49 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> Hi Shengjiu,
>>
>> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
>>> There is an audio channel shift issue with multi channel case, first run
>>> the channel order is correct, but second run the channel order is shifted.

[...]

>> Can the channel order shift issue be fully fixed instead of implementing
>> a "recovery method"?  I presume that this patch implements a recovery
>> mechanism.  If it can't, any chip ERRATA?
> 
> Yes, it can be fully fixed by this patch. I will remove the "recovery" for
> confusion.

Then, you need to add a Fixes tag.

-- 
Regards,
Liu Ying
