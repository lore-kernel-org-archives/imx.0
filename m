Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F8F3CF02C
	for <imx@lists.linux.dev>; Tue,  5 May 2026 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011429; cv=fail; b=LC42Dk08ylO0ThbUpYdVcIABNWb+32Uvey/kaPC+mpNeFmLP2I4oii9DJjGVyyfm0kJDGGCeZRW8VoiAlqn2z3AsCjUEuBB+S8Wo5P/B2lvf6IbCehKf6nH/ScgeV7g1WITsmzq80/8hTF/oQgP1Zk2EhuxXnnjA0YiRCoWj8Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011429; c=relaxed/simple;
	bh=HzfUjnlFKftXXQpohABzDo+Gc6v8xdErz0Jyzd5Pf7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=EOGt5qSDM1HcHXcVhArhrZWxH20PAaVXlmqLkXWm23aq3sWc9iJCqdV3PDsiIBKVK9KKQuxhecfNFiS0X7oMib0EvZzN8ZnRZqrKkHP0cGvKS1w0WzNbwdKAzMbcitFPp4MFYxD0WNkkbkQqr3M7MRWbAerug+SGVBYLV+eZGqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G/syd4QO; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G/syd4QO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZy/ONZ282GucQDWZa9LdTaEG9Vjf0kHTx1qKs1QwbCCJgNWeygCDsSrMzc4e4CvrZj/5SLKJumcEDEYGsqocL3YiktjhljeFRc3GUvJbd08iEQVWQTe4YuIZJHWJgq8KYtXCKjHczb+ssj3xUfQLQF5HFpwaL62dzB2+HsvVO5BZA6Xzf29Fny1cVgNc7m/BDoF8uuFHzN7XfvZHmSH4I4SGLQng4oSEN8Q+ufNasXidO8lTs6nZEFBtTXbtWm0T08ST2j6AlxOGbl5ns4gVRaVJ1Wd/ceerw3XLUgd1365d4Zg+D+VomMvaIgeztvBlq2ZoCM0308bS9Fd5d058Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQSlN9HAN+C9yuhLxAcnBQ3w2V/CnCPlR6nwlU+Iwcw=;
 b=m/AHRBhfnaYLj8I5lPki0+q7iHAta123ZAX1g5C2+luDeVvOrHnFgM4qTUkaPLLvI5vM9YDUIklq6EAZYRW5uSOXpgYdGG4OzX26VN6pJkV93nNfOFFmCp/1CnlfblvBFYXuM2a+t/uW71KXnddAKCTn5yvZ9ZBObPVTuk46qmTolyjKsuiNufScDSPjhO5bOif4SVq9tVvNH1AW/UCAjSCBv0eegDRATfB66K6eVpIP8fGzLYbqh4M32Wv158slrESGE2lAc8v6uzo0HgBmOYPB1zac7eFz8AhsFD3fFEsa6xUiAZQ/MvIpCjtxFNUH6bxhLnp5nnCnnDNed2VBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQSlN9HAN+C9yuhLxAcnBQ3w2V/CnCPlR6nwlU+Iwcw=;
 b=G/syd4QO2KpcpR0tA5eALyQoe+1gf6NzApEf77CFXuq0j4UqaTnP69GZ4ispC0APNE3QCcGkyjXC3HbYJxkDDEmn/CpAlbxiVJTNJq+PHIpEOGIKeOwSSbMRk7D8ZyjPxw+w6UqUNzO/Xq/1VsorbA5PZN7GjjseEvYhJ8lKLkwkMi3wNRMtuVHKQyb32MoulK+EXPqWSxiRNzPrV8t6A11fQ0f+8V/CWcUBSV+K3lG4ZkjB29gEgSrtGFXnCEZD9PLZ3Kd/H/sUYyYcA+DNfKgTEBwvNRvTRxJ/PDvQaujq5ZpzmE1rjPi2HMxJy+s1csvoVgFTUrYi1kQ6FnT3bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 20:03:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 20:03:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
References: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx95: Update for smmu
Message-Id: <177801142180.2047518.11842093090977875609.b4-ty@nxp.com>
Date: Tue, 05 May 2026 16:03:41 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f0890b-ff27-4c3f-6990-08deaae16982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9IXJ6rKvojPF9gIOLkSa3XLOMSY8D2m7enXAIawmp4ggBxlsHyHoZs08S2fx4DLcBEAiR+wY3iuPiQhC/ONiyBjbnN3BcwzsmM+sBwYZYXylcpKdSXuy46uyHOh1DvSCI+8lsIeX/mKBaNHZphmqm/yRVb9oUvY3eEmh6DAPDto7OfJoolyX2xfKqDDel5MZ8mD2/tpIqMS8DFFrra7tF0szXdhAVsqIfyrTkx+0YNpCqIYcmJC3d6QQlMGCDydY7yz55dNyKv8c1R3dTmRNUQ3v6gb46eWklHxh2t+mhwPYXbktpAcTAh1qvydk56UPCPBQhdVmkSTN+xhxR9Lg5gqvxsep7AZPbFywnnVn6bwtII5aEmhsv0iukkObadnsigQobn/M5EnC9Mp2ywFZTh6r8u4QUW3KIV7oCwL8aKWZ2Jp6LW3258uB3cVoHiFuslmRTtnAPysPs2jYi3EHETnbTHsb7DZTKYrOyxwNHeYUX+AgLjJvMiOeLtbNNZC1CytGYyFO4J6zcGmZAF5sg+/0J6zaUna0RG0nIFzJofpE0yq3SNtXUaT6hTZaN5iwLJ/9Fbn6Sr4sYhKvRwU5eVO11pj6YVdiQ0rmKxgbgSQPyS/cuJV55036RlBxKNTElgkUzcQoH8uIsJIn83lagFDb5Xm3ROqYnvOEzKML8qKb3KopmlvfgJZi+c9WBvZk6klau2RC3BSXLsJ8aQpOQZ2cZLE72Cu1ytn0502KAM+GoFiU2oKnijiJUsoT+rTV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTdHb2lCY2RiVjBpZXoyYVhMTFVMT0dKZ3ZtTXRXTU44bVFJWUh6c0tldmJ0?=
 =?utf-8?B?YXdxNFNBK2dXSnJ4QUsrYVdBSjZETXVrWnVJZlQ5L1RvOG8wdFlEWTcyZzF6?=
 =?utf-8?B?Wm1nYjF1KzZ5Z3JxaFdpeWVGSjA3bmZmNVRnZ3VqNnU5UXVDWUtoUnBUUWw1?=
 =?utf-8?B?RWdocW1Ub3M2R2FCUGFudFhuNEJGUVh5S1hPYktvSmFmcVcxS2NEWUNXcFNO?=
 =?utf-8?B?VUVKQmpJbXdpaEs1L0plR3NkTE9ndjNaTmw5cWcwbXltSVhJb2dxZWhqZ2dI?=
 =?utf-8?B?TTNOMDVvZjZncjMxQUYzSzM1WFl1Qis2elpNRTJzaC9aZ3RreDFvK2s0SHRW?=
 =?utf-8?B?M1ozaEhmVVFaTmVudU9ZaWh5WEVDcUoxNEVJbWkxbG1vVFdyT1FUWjYzc0pz?=
 =?utf-8?B?R21PVXFMNGpoWEZ5UjNKWVgrMkp2RFVtazJPczlaS1orVTZ0OTQ3QXR1Uytx?=
 =?utf-8?B?ZGtOWW1TZ1krOWpwWHlMQjB2VTg5K0ZuTDRtQ1VFVEV5aFRmc2dvVU10YzE1?=
 =?utf-8?B?K2h6SW9yQ1Q5VklrK0FHUzlENU1rTU5lVkZlMFlTN3lyQkQ5OFRZSWh4dlEv?=
 =?utf-8?B?L2U0SjVzN2V5YWovK0dzaFFiVHcrVTRsQVpmbzRIdHRuaWhsdkxjdVN3WVdk?=
 =?utf-8?B?UmFDdDNzU2w4VlNybGkzTlc1aXloYmhmcmF5SDB2dWVjbHZJV29YQnZWVXh1?=
 =?utf-8?B?bGIvbjBSTlZwbXgxR0pFOHN5THlWaGF1YlhpTXp6NnlXRWtZVjNHdWpxMTVU?=
 =?utf-8?B?RUFueGZYM1dYeDkyZzJKYmlFZFk2K25zZjhBU3o0azR3VStoL25UNnlDWHh0?=
 =?utf-8?B?ZGFiaXhycHFEVzBFUVEvWHZWYlB5K3U4dVVoa2Q5ZGpVRHYwdVFkRHdhSFVs?=
 =?utf-8?B?eGFLeWRod1VOd204d0NKYjVQK1hFSTZRaGRBMkNsV2piM21lYjhuWTcrSTlR?=
 =?utf-8?B?bHFxMGQ1eFphN1duOGdwTmZhVFgxMmFRTExxdDZuOGI1Q0trY0tYcENaSTkr?=
 =?utf-8?B?eWpYK0V0d0RCUkkvV2YxZG9mVVVOYWcvRklYWnB3S1VIZmtxZEZIS2syRzNB?=
 =?utf-8?B?QXBqWW1qYUVrYTA3YjBUdE02RTErNnI2VzBCUlg1NVdlelpQdC9qejB4ckJz?=
 =?utf-8?B?OWNHSzlMVWJxNnEwenJFU0xxcFVWZFdsVkM2S2pLWmlGeGh6dmJnMEsrVzk3?=
 =?utf-8?B?OUVXYjVkTW5OaWJMZDZhekRudVlyTldxMkN1SVhjZzQvY25xdHJIWXdFUkRq?=
 =?utf-8?B?bmg2RFd2WXdyOEF2eW9Ra1dibFNXVmhGWTNzTm4xT2dVWTNBTE9iUzhDblZ0?=
 =?utf-8?B?djhVQWZlR1RiVG1aL3lTMnUxK1ZFbGlCU1luRlQ5Tkc0UWJYcVc4ZXhIRXYy?=
 =?utf-8?B?ZEFZOGpicHFZR3NteDU5U3M2QU9yOWkvcStqTlllZi9ra2lhMkJjUTdkOHY1?=
 =?utf-8?B?ZnIxVGQrQ2ltb045aFArd044SSt1NnZMK2tFS3ZEVGZnQlBLSlh1a1hIemRv?=
 =?utf-8?B?T1JONFM1TjBKSG5vcDQyN0hXS29sd01md29nY2J3Wnd4TGFBeFVCYnBybGtZ?=
 =?utf-8?B?VC80OVU5YzdPTGFQMmsyZE5wZHMyK1EyREpwK01lbThUS0MwSEJlQVlPVmtJ?=
 =?utf-8?B?Tld6MmpOQmJjMmpyRWpvYUZhS0kzbXlEaER3aTJkek9zNzQ0eWVJOFRmYU9I?=
 =?utf-8?B?dEgxMHFSV0haVlZma0dEWVZCWDk2NzlGMFpsNWtHc0svSmhDL3JGU0RuWnhW?=
 =?utf-8?B?a3llNmFmbzVmTWNHUWRLU1daUy9IRGsrTjkzQmJiSGNSWlJ0QytpK1JFZXRa?=
 =?utf-8?B?ZE5ZTW8yZVc0OWRLenpqSU81TUtsVXpnaXNBSURhalU1NlZmczB6Z1lmcTN0?=
 =?utf-8?B?VzJYNVFDc1ZhcjlrNW1lUUk0V0ErSUdjZGgzamdrcEpZaGhYZkZMb2YwaTdB?=
 =?utf-8?B?Zm9HTzEvL21SOVhIMHN5YTNaZHZ3dHpRcFRVcnQvM0R0ckw5ZFlSOEpDUy9Z?=
 =?utf-8?B?aXk1cFphcG5rMHl1NUFpdkpQeEo3TTJvVXVRbm5kL0pkakZmVHQ3MHJQMkNi?=
 =?utf-8?B?NHNpR0ZsakthMEhPZ1BNaEhpK3FoT3o1d3pTekx2SmhmN3loS05iZ3VwdFM5?=
 =?utf-8?B?d1hkMkNtdXlwQnJ6TFh2bTd0U0lSYTNyWURyV25BbDUwOGRqWm42ZXZzTzBX?=
 =?utf-8?B?Z3JVZGlOTXd3TW1kamhMV3hVNk5ycERVUVVBWW1yVW0wNnFKQ20vb1FtTHJU?=
 =?utf-8?B?OWxiYkdLbGtZZDd6WmNtTFpiSFNhQWNMaEorWGsrazZRcC96dG16YTdHTmN6?=
 =?utf-8?Q?XB0UEI0KxqC3P8dfvv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f0890b-ff27-4c3f-6990-08deaae16982
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:03:44.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmjRM348CoO5x5RSkafRh9rZwImWsKpVIIBreS/0HIH7j2lDVg8GonbzATtb6DEduw8gYVXMWjhq0ykDJ0NQVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976


On Thu, 09 Apr 2026 20:00:00 +0800, Peng Fan (OSS) wrote:
> Update smmu reg size
> Add SMMU PMU nodes
> Enable SMMU by default and add iommus property for sdhc/edma.
> 
> 

Applied, thanks!

[1/3] arm64: dts: imx95: Correct SMMU reg
      commit: 8e14bf7be3b296f074de0d4b35f267c27120aeb5
[2/3] arm64: dts: imx95: Add SMMU PMU nodes
      commit: ff0f8a2c2aadc467a61a664c7a81ededc2bb46bc
[3/3] arm64: dts: imx95: Add iommus property and enable SMMU
      commit: 81fb7735768b1fbfb8b53cbebd7f81427f5660e8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

