Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345432939C
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782987; cv=fail; b=Zi6SxXJvFy9IYIZ36RoZnVc4l6sis0PLjrUNLputoXiuf3qojFzjztHfLSD8P7CO8SaWGaMWNssmqKnc/ZPrw8rdAII/X5s964NzlDzbs4tmKG09KMksZKOPCWqNeepz2Z9IdYUvI2uWDxF6HKXlK1/6kSC203TouN1aggOLN9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782987; c=relaxed/simple;
	bh=JrSiuYzTaMUkCkQaM9Aj1VHzKhlh/LoJQ0Ph5pftGfo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ww7riyCxooujnFj8ZwgyNYi/XVgF3IzrSBGrvLNlST3+HLRRQXXZ5TqepLCN9fql6jiyg1U/RPktG8koMMW/Y2CPMOBwKuOa2+WQxLeifhoFcmJ7Te1RpJyuHkxcRdz6k+SeE9rk9xWpQksUATwMlE4wX3Jn10JBKYtQbDMlNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDzSv3g0; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDzSv3g0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJOLVwkB8lob+frE9Gd/h2JUjBIWXiWF7oHitct+cPlvOs89vUJhDNaktGkYsChzvReHqp+R9aFTqPqDn6es/HXIwJ9RRc6GLhubT8PxVSrsBsYPVrBeLBACxOA/uYwj7WPwHCYqXP/K6IDf5Cqk/Z6oAwzutUeIslXhgdJGkfyE+Ehjit/7Xv7Qo8xAunpykAEo4cT4lpP99XKkfZS++Pu2KBkcq7JEs1kADosPhZfI4cJZhUtA5tRpAdW/QZMQVjjpaNIuarZxwoieSE2Ql2AvU6kGTOGezEeFOqyni1rivifnyYoHd9Dl0hUqZVLKdwsU2WWUOo2yvlycRlJRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ3K6ATUFZCg5gW/JQhmQJ7n8Sl6E3+ZnYFzZ1fGtPU=;
 b=oYc13433swVfr0s2ybTifqEDtwTz+Pe/j89KX58r4/EGQ0Wwjo+upUG+oK7GOOwL/CdXJ7/qe9uP5k3z60F1OkFK0iTDItjhEkDBbkHHiYvXAdmXCVcQFz+uOzzT2tEwppzCVIxPuYbTsEWIqMOqWFHQIhLVvhm3ptn8wiBVDyRV06yZrvSRVibqvh7sjNemcHV82Of1zWWBBhckHidpEae4yHbmzF+/S0Qpua3c4QLVXQiqL17L95VPB2CfES+tLlETiOeB3wGHrzGggjKJbeUly5/tzstwmnqKqiGyGSvaZ0SjxXlGuGuhJt7eOLJRI5DOOUpyyG8C0/6k1D7DIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ3K6ATUFZCg5gW/JQhmQJ7n8Sl6E3+ZnYFzZ1fGtPU=;
 b=cDzSv3g09QTDFvBW9tR1T3u8q5b8+kbzYUhtPOxVXKXSAcTqgUZ2RY2oZ7Y4KJYpYQpGVAV/GdNzURUC4k02Kw1eLrl9QkIs2CHtuxlyeEoMZrznWLY8SnfeAQ9msDQJNoTiKgQs3sAJ3xrH1JFdbt+rKfaxHAL6gxxx2dfeANLJ7XU/4ZLpKMWSlx+Z/+U6RDtHFagJEr/VnghNq86NbiKiyusbPALm5v1AAWsEeuaLD0a3Kj1de/2zAzCuz/w9FHv+6CzVkrYCDCUSP09yHm1CU/14IaRXnx8hSneqkdoowQzu/mWyq6IqnnLDkJNZoDP+bq8HCX1vBmnNedeaOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8099.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 07:42:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:42:59 +0000
Message-ID: <b7968f1a-c4bc-4bad-bcf8-407ff2d8db27@nxp.com>
Date: Fri, 6 Mar 2026 15:44:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-1-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-1-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e63b149-e2fc-4219-af3e-08de7b53fcd5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 cBfct2eyZYLoN8eSMBSuPDQQPRtYY4nCz2Z6Uk5RxbYovWE4f95GZbtfxqxjDEi6D3gjX9/zGpjYBSCYXxxjveFHMTKCexqnsTo7tSTGU016ZlooY9Fq3RH+qaUgGduomHXuIUgbwfIQBG4WuJsF9yZBDXCRSuIUY7TLIqiSJA52r3FNunqBeS7n5FB61IHAfY79yXNhORQ9TqOvfX2i10CNWU4HG3nUTIbpXMJWKJ4v5tj2819lMG5f+/JKI5b3nVu0nnhSpaWUrQOAGSQZKL/ngyhKK8CoiGYOf1YP5RHRjMUVDSpU9Ja93GajkkChjgC/BuK4QLz0/JVvyaXPKJ5/rOAZ14JHdJtj1UV9/wBbSGe1LXdDdaNgLcW8Jdp9fTgJgsvodw9KU8EZEcEBnIBhwPwxg7vNB7vMADdXGMnIuRQC6cYLEWslnaK1QT7E7ggOIp1gsB67fIRL0PC2GNxsOau/l6vl2veFTJgIi1nndadnp4C56k3KsUbbve7CVonzIyAaUm0gOz5QFtOp0USem5JxQlM1ysHmk+Z73cQpPCZB9McZjeCKjb4100O4ah1fS7pO/FauYU/gQNq8aVZ+6o8AaVx5pMX62s4gyhLFJ+FMRgskToqNuswELPhYUYMwoXb8ZMGlhjzLErLB8vXyD4qesMlKyKQ5jJcQUrIDJgHjx6QnBrYLEPTkrCe9ir/oH+F0WhML1bdXJHUMnQXHJnnmlD0YfUtjH0uFk/2fvqPHwCMb9r91ahgKzNp/H50spnOYQUWx7Mzn3bRyWQmQz6vAgCRO1Gvv3dR6Vf4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZVRCRTc1Ym1uWDI1cThNRG9IRjJ3bTYvVmZXdzNTQWhrV0RSaG43TGtaUVdr?=
 =?utf-8?B?eTNHS2YwSzlXak8zaXJuWFU3R0RUREtnNGJ1UGJFVXVTampJVFJ0ZHZVVDhv?=
 =?utf-8?B?SmVrcjBoTGRjSHFPcGR0NHJqaDJKa3lGMnByL05wOFN4OEpUQzZPN1JkcWl4?=
 =?utf-8?B?ZWV2SzB1Y1hHWHduNDdkaEM1aUkzdis2WFNNY2RRaFJGV0hkOU1CMkVyU2E1?=
 =?utf-8?B?TVQ4TFRPeHp2ajVWVEI5cmQ5bERNd2VsUG5LeFltNEw1WFpQT25TaVdQc1pY?=
 =?utf-8?B?UjB2TmpOUm9tOTlkWFZvZk5uREF4aUErak9sd1J1TmZqak11SGFRRVlvNDJm?=
 =?utf-8?B?QWhoMDhIWUhwWlpSbXlsWlpGY3kwRVVKS1ZENEpNS0hDUGVFRFo1Wi80UEs3?=
 =?utf-8?B?anVjbG85eTlob0lya3BOMThPU3RhYlNvaVJ5cG8zYW93QkZ3QzFtZVhlZmVk?=
 =?utf-8?B?c0R0MktxT3kvYUp4Z3I4MTl3Q0hUWjl2amhibW5DR09la2lScDBtTkVBNkFC?=
 =?utf-8?B?N3NmeHIyeENGbFc1djNialJxSFQxM2VpTll0NkRKZWlsNFh3SFVhVFJDQVFI?=
 =?utf-8?B?bThHajdDUFI1OTdralV5c1lDa0UyWVFjYUwvSm5tRnJBY0c0cmZIUFIzUVpq?=
 =?utf-8?B?U2JiQWh0enpGRGdFRUZyUlRJN1pHbzcyTGw5VG5IeFlueUs0ZE16bDBVRFNk?=
 =?utf-8?B?ZHA3ZFZLQzE4Um1FOGFRdnVndmZBY3NXQnFpc3lTVlkwKzl0LzY4QWYxc3dn?=
 =?utf-8?B?NllLNGdYWWlHaE00a3FWWjlCZTlHKzZKYkVHUnFPOEFoRlppV1BndDI1aEN2?=
 =?utf-8?B?MUFKam5NTXdhQ0xkOG5oeExzeDN4YWdveitRc2JtRlk5QVYzS2J5Z0N4SkhS?=
 =?utf-8?B?NXRoZkdyb3dPamYyaUd2Wmt3ZDBZYi91WGNIaTl6WVhmb2N1aGUrMFd1Q0RI?=
 =?utf-8?B?TXNzbUJYYlVhYlBOY0o5MFdEVkZVVkQrcFBPTXZiN01XZHVrQ3VNS2M0NkhK?=
 =?utf-8?B?Wk12c3F0YnNleDR6YlZsNXQ2VHBZS2tsSHNrMVEydENBY2ZIS0t1M011d0kx?=
 =?utf-8?B?eUhsY2FzUituQXhpVlcwSU4xL1FJUjZrckVLUWFYL0swZEoyVXVReGFSQ0pq?=
 =?utf-8?B?K0JGa2N6amV6M290RFdYYm5HU2loTGx5L1dGMWlaOGVNbXF5UFg1UGF3YTZV?=
 =?utf-8?B?TVpQd0JYMCtTSis1R3lsTU12cHo3Z3ROckQ3UGRocFBBSHhwb3ovQ0V2RnM3?=
 =?utf-8?B?QnFSSUdrYXpMOUVmek1UTkpoS21sVEJ1Wm1oRStkT2Q4LzQ2encrRXd5SmVp?=
 =?utf-8?B?TFFlWkNGdTlQRWRLT0FIMWV4eTBsM2c1WnUzK0RsVnZjZjhlM1AzSVN0YWZo?=
 =?utf-8?B?Rm9XdE5PYkVFWVJkNFNBenVua1puQzArVXhKZVB2MUFBeGRMSjZ3YzhkcWF0?=
 =?utf-8?B?L2I4WWtqSXN3T3lLd3JkdnBuV2lUL1UrYTJCVlYxZXAyMm9jM2t6Zm5NVy9R?=
 =?utf-8?B?eHB2Tk1LT3lkeVcyK2JveW9LR0lOMkk5b3ZMa1FKWkR5Q1lsREJVOXFPbTJY?=
 =?utf-8?B?VStlRnBkMk5jY3ZVZDdta1RTNjBrRHdNNzN4ZGpRY2V4RXVBdHRWbHlWbWV3?=
 =?utf-8?B?dU5VdHVDWG9hVkpXdTdLYVkrTjM0RVVyKzhWbHFOVXRGK0Evb09pRmJrRFVh?=
 =?utf-8?B?Um1ieVR5Z3d5WXdxTm1Sc3hLRVR4Z1YyZUsrOVMvcUZCVExpMXY0S2xOV3Z3?=
 =?utf-8?B?SGo5aHNUbEx5bXlRWm9pTTIzRnowbnQzdTRxM3lZWXNYQUFDOXB3Wll4d1M3?=
 =?utf-8?B?ZHJzRnBHdHFzTUtXZU9IYk1HWVlhY1p5YTBwOXBwNkNHUlFuanlLYmZmbDBl?=
 =?utf-8?B?cGVhMmMrYmlPOWo3MkJIV3I0MkNJdFgyUXI1dCtESy9kbnNUbkhYNFRuVjBG?=
 =?utf-8?B?UGRlaXNBZjkvYW5tdUVzZmV5dUJlMnFjN1d5emtVQXE1OUhBeUdKdGlqcFM1?=
 =?utf-8?B?NUJJOGF0QnVybnI2K2haZjRDcWRDT2NIeERDUW1iYldMNENaQkdsUHB6Rk1F?=
 =?utf-8?B?VTRUMGN0c2VGZDg2RFNKV1NpVi92SnYvOVNqYldZRldyRFZCZkI0c3VjbElJ?=
 =?utf-8?B?Y1oyZHFIYy96UDlLS0ZkNDduL0RteGQ1NHJCcjgrSTNiWEpVblV2WHFja3k4?=
 =?utf-8?B?SjNTM1lFa2ZUUWs3RllzVnhPM0NyVytsQXMrUUZtOEFkd3lTNnl3NjBkN3I4?=
 =?utf-8?B?bDVMOUNVNWhCSEorV0VOeGs3am9YQzNleFBLbkVnczBlRmdISlFmWWhsN1hi?=
 =?utf-8?B?cTVBcHREWjdzV1Y1R3JuWkxucGJjeTRCcUpxVE9ZQ0RDQ3BvTjZZQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e63b149-e2fc-4219-af3e-08de7b53fcd5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:42:59.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voCYpzaUfNyi2kFjsM5RgFoYIgsieWdrPkUamRk7LxVOSke34mqu0qPc8kzygs7D1bGo8WDdzvf9LypUhXejTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8099

On Wed, Mar 04, 2026 at 11:34:10AM +0000, Laurentiu Palcu wrote:
> i.MX94 has a single LVDS port and share similar LDB and LVDS control
> registers as i.MX8MP and i.MX93.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 7f380879fffdf..fb70409161fc0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -20,6 +20,7 @@ properties:
>        - fsl,imx6sx-ldb
>        - fsl,imx8mp-ldb
>        - fsl,imx93-ldb
> +      - fsl,imx94-ldb

Cc'ing Marco.

Recently, Marco said that LDB node should not have a reg property...

https://lore.kernel.org/all/4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy/

>  
>    clocks:
>      maxItems: 1
> @@ -78,6 +79,7 @@ allOf:
>              enum:
>                - fsl,imx6sx-ldb
>                - fsl,imx93-ldb
> +              - fsl,imx94-ldb
>      then:
>        properties:
>          ports:
> 

-- 
Regards,
Liu Ying
