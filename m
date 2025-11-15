Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82468405C
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763174282; cv=fail; b=l0pZnAZiaxoEWfnDblQn9zsyRM4qYDUR9UiiwQFBwS7zVqEnzENv9wSMPFFKydXeZMljH2oOuAtChX+/HJz8tH2fvb+cWgEkXK+BvokC+CKG6VrrjlXIhfZy75ajPih8Ys6YDdqmWbgAL6Qwr1y/vWDBjF1zTFRPLXjHzqnB6j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763174282; c=relaxed/simple;
	bh=VI2q/uR0et3QSMvsRHs1sFIokJD48WUCOU2sdESXUaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gwlBkf947v4pn/1hRKtLz6GBQXY/bdvWxB4iRC92qRIOVSa67VlDmq8s9c50XiooOhhiw/G3YT2nClgyukcNi3dntjUOgZ3hJeu1UU0sMpsMqnU+BUGjHCezoBQ5Oqou68VP/xSMWiCEDN0ccPkzVOdejdigqheURp+uzSkXl9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WEznatZM; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WEznatZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPQkhH8INjSmhvbnjxytPVSQ22rB3Ir8XG6qjfWy+iio4wjZGF9rRNn+yAL6lr0bpKryh1gs02xKdIqEjUz09SQMJNHebEpABATvSkXqT5IYOZnicHPxylNSl4RSKoV+KIysjn/0Ytzzjr8nn2UIAcVcauhFNXBI14IS7PasYYOpoxA77pVK/WLbtD4y6Oy0fAksqimdL7c4KdO4iT1ZdIaO6xKK3ttH23nmwu9BFvSL5doGwBKK06KRwJ7HRA1uiGa61DUCjaDKQgv37PSqap7oamqGhSyd7vixp/N4HdEm6GxALggNU2WwHcQlU4R2mL64qEF0SwOTUHAofUlm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5GnNMT4EmLoEKng7iwZDEDjFINwh9zIhuA85oBYTVQ=;
 b=Yxfq/V7hUpZNw06kBwDCJz+wgWhs0dtVyVoKMiyFOHxtkUpHHpvdeoVO64sYhXelIj52MNWU2uSX4wkGWBTX5R55Vvs7pBjvBDtTonxazHGnFbxDVXACYL/rQU28XBN/VtjV+gC/3/6uCjZwaWQIRZZIXmO8WCTDidKuyKfHu/P7svSHabBBGTRnUC2cmX/LcwL3F37t/xYmKRJrxqsiycuuxj0dR4Yr/B7Zb0f25LdgDOsc2a9AxOVnuzqiAx6jfTJvXkwCo2reN4HL5O5TS3cc9TgFoe8H1q0JcC/93mizQdfeLrkdKdD6A4OYAQ/ISnpG35QU4VhKZD3XKuJM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5GnNMT4EmLoEKng7iwZDEDjFINwh9zIhuA85oBYTVQ=;
 b=WEznatZMtK5cvokhqL+hmFDQ7nxXD0Cynd9qLwSDi/2mpV+iwSH6hLT0VBSzTtr2j6wpAv0k+8m8pcdnLI+R9wf3YguWCyOFVbJDMneVDOec24qJj+IWl1UGtqzfKe1PQnL0EYSK3H7M2xUo3o6y3VpBh/MdBFu4E6xqiM/M0svxzD1rnhFtXL0JvGbv3PBZ5KcXbE87sra1HS8/Vw5EnV4PJfzLaBIR8dLY+VEv+EnxesjyJz5Re/Bl7AJm9jV/tG5mjIRZeRoqbU3rAb2BtIAqtbxULgc2QsCcA1mlJsZ0Qb6e7F6sgPjgkwUXLTY0hAD/9YLiT9Nx14hyjORt9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU4PR04MB12081.eurprd04.prod.outlook.com (2603:10a6:10:641::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 02:37:58 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:37:58 +0000
Date: Sat, 15 Nov 2025 10:31:18 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] extcon: ptn5150: handle pending IRQ events during system
 resume
Message-ID: <uodhj25r4z4icqc4htdemvhvwwe6ntqd4nlimcrquilaj7o4dy@47h3wgr3qvek>
References: <20251114074212.1214255-1-xu.yang_2@nxp.com>
 <CAOMZO5DNGKjRLUVKgyziG9nEzPtyRVcPWc21x0wc20ZjuS6E-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DNGKjRLUVKgyziG9nEzPtyRVcPWc21x0wc20ZjuS6E-A@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU4PR04MB12081:EE_
X-MS-Office365-Filtering-Correlation-Id: fb63e240-5e52-4294-285a-08de23effd0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0NPUDFRS0hBbzIzLzEvYnJORERyUDdzWENDbi9HWkZ3eitWMGRxS1NLQ1FJ?=
 =?utf-8?B?ZFAzV2dFVnFyZVM0WEdnaUxscndNWk9ZYWhUT3FMTG9qcHNTSlZva2JGcXp5?=
 =?utf-8?B?blkwdlI3RUNpRVpJQ1dYMGRacTFKcTg4cGY2ZzFKaTUxSjQ1STRlSStHb0cz?=
 =?utf-8?B?U293SVVTWFhrV3V6VHA5a1RMM0tGUE02bEEyMTJBbHdQWWVvd2RyaUhWSjdk?=
 =?utf-8?B?SW5ZN0xUdlJCM0pESFJxS29YYTJWS0RpVHdWRk5JVU13S2RJOG54VGhhdHJT?=
 =?utf-8?B?Q0t0UHJIRFFhbWxsWHRJa1JoM1pJbmNQeU9qbXVJNU5NclhBcEJXMWhOM3NJ?=
 =?utf-8?B?RWZWUGJJTXpEbkdFL1dldzdVN0dqbDVaa1JTVXAxbVpHUDJDOWlHclBia0pJ?=
 =?utf-8?B?MW1zd0wxaE52bFU2NWZZblcxWEprWkVwQTYvMEVDNlBKbFl2WXB5UE5kSnAv?=
 =?utf-8?B?WGxkRXQxZVJHc1NjWHFQZnRJbk1tcFcrYlVqT0duZ2dIbytCZkJCNmZrVkF5?=
 =?utf-8?B?T2hnODVMamVYZUtHRDIyVVRYWnB5UklHUVR2SUlEVHZ4ZHQ2L3hsTUNSRStq?=
 =?utf-8?B?bi9FYWY3Nk5KZzBvc01TSzdIbjFxdFVZNGw1RWJNRUQwU1A0Z2piNHNaQzNV?=
 =?utf-8?B?ekF1dmNSL0t5UGFBZ1djaGpja0xUWUNSWkhGbjlnZUlJbkorNGdleFUyR3pi?=
 =?utf-8?B?S2JBaWRUYU01bWVJZmxkdWFqeEVDVy9LNkNsL2gvaXdEZGU0TXVxblkrdjFa?=
 =?utf-8?B?NnBQN0l0OTdjWmVpT2F4YVVHUW94MUR5anZjek91eFFJc0NqKzBzWnJHbHRO?=
 =?utf-8?B?cEdCNFF6cURyNUx5d0plTXJxYWoyZ2EvOWd5ZGxadWl0R1IzZ28xRnhaMzRh?=
 =?utf-8?B?NklMYVlaUWlEQUk0cnBmeldtUW9Cckd0SzlJbkt0WGZwcG1BVXN1Uk9QZHdm?=
 =?utf-8?B?WjkxUUsxdzRZcmZ0K0pZRlZ1QVZzc0hxd1RqaDBIc2prU2l5ZFdlUEEzUEdq?=
 =?utf-8?B?dlVGRGJzV0s2b2pHbXBYV3RXTnRUQzUyRTVlMjRoSXNXU1c1eWoreU1uVkFQ?=
 =?utf-8?B?bUVEcEVnMXZBc0NIenFpKzJVMm1ncjVUQlAvNUFaR284ZEFqc3kydHdOTWk4?=
 =?utf-8?B?L3VrdVhQRU1KUmFGTFJ6cU1NSFg5Ym82UDg0RGx1M3AzWE5GeW1tMjdPaW1N?=
 =?utf-8?B?SnVTSXlQVG4wdGhjYVUyMVJZTm5nRGNnbkE1SThWK2tDd0JVNkRNYjVheE9D?=
 =?utf-8?B?WGw3OWg4MnhkcHROUHgrSmoxb0VybFc4SHJkME9rUzRZRkx1dGU3RHdKUTl5?=
 =?utf-8?B?U0lxak84NHdNQUs3U1piUUhoWkZ4N2s3Y0lTeUdaR0FhTDQxdk5BYUE4TWVa?=
 =?utf-8?B?bzlJYitBbkRCMzBIV1FGSWdwR1oycmt0YVhOWEFrcUEyRCtOdytndUZLZ0xB?=
 =?utf-8?B?MHQ2QWRBWDBYNFFLUXByVyt3RklSZG5jWWUrU0tVQmxpTDBXWVFGTHc5Tk1n?=
 =?utf-8?B?M1NSSFU1VFlwaVNSaldGZWxQR2Z2NUpMNVprZHZ0ZWYxRE1qUGRLeUpKVVhv?=
 =?utf-8?B?Z29FcEhTdGNkdThPS3EvZzNha2thdmxnZUhSTzY2M29RMHNhQ1A1VVFrTUln?=
 =?utf-8?B?Y0JFekhNclFqdjhvT1hJVWN3eGV6aXpNMTZweEtNZGdvdnRkYU1lRG9HbUdP?=
 =?utf-8?B?SEUrUjNvcUxDK3I0TkdPaDB3WXd2dEp1WlNZbUNQQ3p6UVdiZG5hb01GeTBl?=
 =?utf-8?B?T05JZXRvZmtybHNYbVBPRzFQakFLVUhpNmRXZ1JDWEdpVDhUbWhsNERvWldp?=
 =?utf-8?B?T3FYbnZVSVpFcEU3T1VpM245Ynl6MG9ERlI2Q2VXOThUWG5TVi9QMklieGFm?=
 =?utf-8?B?WXA1cTJDRVBwOE5EekxGMHJiUnhEd3BXdFhyZndhRmdDZmJuWmdhb3hKdGZR?=
 =?utf-8?B?YTJLSHFoRU4xb1Jtb3FnWUNiUWRrcmdqR3F4cFE2NnpaUE8vZWdRWmpQMUkv?=
 =?utf-8?B?VVB6YXJoVGpHNVdKSjhFd3AxaGRYbVBRc1RlSU1FRXVsVmVNVDczZFFTMk1K?=
 =?utf-8?Q?Q0a0QO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9pOVVhZ2FvKzczKys1bFZud1ZPWFFZTDFOMm16dVpNMlMveGNuZzB4U0l5?=
 =?utf-8?B?bzVNdU1HQ2dTTkdVd2cwa1JhWTRKRE13T0xkVlZ6K0E0UGtmNmNpakR2eDJS?=
 =?utf-8?B?cFd5bkNwVFU1R0VRU1VOZWRZVUNnZGhqZ01yREZPK1ZKZTAvRSs2VE5EcHly?=
 =?utf-8?B?LzJ4TU1FKzdKVFNkNlVzU1czTDlIT0pOOUt0QVphdWVzMk13WjFUNXZ1c0Q4?=
 =?utf-8?B?RG5TMGlCc1dpNEJ1V2Z4NW9lc3MyWmdaalZVL3hEajA5YzZMYk52MWppSW5O?=
 =?utf-8?B?Ukh5OFhYc2gzamlKSnFpUG5DVnp5RkpKOERFaW1LNGd4WThTa29IbExRRHlN?=
 =?utf-8?B?VUh6NUR6UlE0dUg5b2k0OUNoUFU4enFnaWh2MTBCY0VaeC9PZmxZUzh4UlNN?=
 =?utf-8?B?YXN5ZkNseDVDSjc0bW1aWVBuYzUzRTZpK01COXJxRmdLc0cydXk0QXdiL0h1?=
 =?utf-8?B?dzdqMzNsV1J2SWhDNjhXaWMyZFJwMSswSlU3TnhoSTJRSG9saDJ6RkhhcC9x?=
 =?utf-8?B?WmN2eEpEWXE5aG9jTSt6UEpuYlFhbTNxQ29xT3BGNkdoN2Fvb2RTQ1BlZndM?=
 =?utf-8?B?eFpCL3hRVlBiaUwxdGFsak5USlc5aXJiZGFiSWJ5eXVhQWkwUmFKc1Y2dzJt?=
 =?utf-8?B?dzV5SUJqNzI1cnkrZnpKVzVXSks1Wk81S2pqeU81ZUNudkFnRWNzR1hWTTZC?=
 =?utf-8?B?S1BDOTBmN3YwK20xRmkzY0UzMGRkOStta3lXV2VqRzRUOEg1SXpORHFBem1R?=
 =?utf-8?B?VVd6c2RvcUhLTzluOVAwOFQvUkhhUUxkRTZyVHlrWFFVNkRGVlE5b3gwYThp?=
 =?utf-8?B?NUJBa3NuR2hFREVYN0hpZGZnUGl0SEt4ZVJsQkJuZTlMTWQ4dUJDZzh0ZWlz?=
 =?utf-8?B?SE5KYytyblYvM3ZkNmlWWjdNNDJJMUp3WkZrN1lQUFkwamlITTRFT3RsMWw2?=
 =?utf-8?B?aEYzOTVJTGJKaG5OeXZ0bTBMSVRxMnVDVDREakc0eFdBdkpNQjZ1c0pNZ3d6?=
 =?utf-8?B?N2VQYkJITSt6NENMWmF1MXVBRlBQdGFyUVVrVHE2OHFiajhHRkladzBpZHIw?=
 =?utf-8?B?WHhCTitlNk5sZVlUWGhKMHgreDNxUEIwQWhWbHBFcUFRbmw0ZEVNc1hHUkZQ?=
 =?utf-8?B?L3NYbGdRbGlQRUpMc05wNHRKdEgzOXFKZFVjYzJOUSsyT3Qya284VWUyL2F0?=
 =?utf-8?B?cDFwZkR0TnppOFBZUFBrUzJiZzFwTmVYQXNnNXQweEdLdTkwVUFlMC9qUk5W?=
 =?utf-8?B?Mi92K1ZUYjF4WjBVRmlFR3R5MEhVS3Jrckc5UENuMFRyV0hIbDBKR2dJbWVw?=
 =?utf-8?B?NVBZelE4MWVHM3RIT1BzWG9Bck1pd0JJQ0VaR2k0bi9Gd3Y4dWlUNWdGQ0FV?=
 =?utf-8?B?bURLSExCc1QxT21tQVNESVFzeEV4MVJWYkhjOFU5R2YxMTloV09LVko1Nk5E?=
 =?utf-8?B?NDVaRUdEZFRBQS9kUVpDazlSOCs0RkRJdGlURU9nNFM3VnVBSjl3TW5WRVBP?=
 =?utf-8?B?Q2JkZjk0SWFlVDQwTkNTRlF1bjRwNDMxUWtiSlNQWFEvOFRXQkhLSjJmYWNl?=
 =?utf-8?B?bHBCSk5BZ1J4clBqbFk4OWlXTVNJYzdUQVc2NFRzMFJWMDdicFNKa2MzbW0z?=
 =?utf-8?B?R3gzYXpDbmtWV0YwWXpyOHcxd3BONVNPUERZWENVNEpiT1BzWGZYTFRIVGQ0?=
 =?utf-8?B?YzdPQnkwQ1A5Nk1CemtqZnFQamllL0g3TEtSMDF0c1F2VTZvVWVLWTVUQjUx?=
 =?utf-8?B?RWxiQm5odnByUi9BZCs0OW1ZUXRwdUxQN1IxRDVXVDZkSUdwMG9GTFZYL3hY?=
 =?utf-8?B?bElMbEhNRUpEYmdsbDQ4Kzd3ZjM1bFpUQld3WndNT0F3K1Q5dEN2ZDNrRG9r?=
 =?utf-8?B?ck9SWXNQQUh4MXBMN29UZlZ5a25ObHJOTFU4T3N2VEdJejg4NG5yVE5QQTB6?=
 =?utf-8?B?bnkvaWR3dHJGOU9BQ25McXVkUnZzUktYSEJSaWY1TGhaQXY5cVRiZzRaUEJq?=
 =?utf-8?B?UVZkOURRZ2F6NGdlZUV1TlBhdTBqTEVrcDc2M1ZaOVFxcDN0dXZFOWhuMWRR?=
 =?utf-8?B?c2g5bytzekQ4dDZxZEVkYzRiWUVaN3JYMkpqN2V4MUp3T3UwK3NKR3c3YjBr?=
 =?utf-8?Q?pkFLscrEPOCSb9v1WIfnulbCP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb63e240-5e52-4294-285a-08de23effd0c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:37:58.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wxf96o7TQSSA6Ks3CrvGkNPmh2Zkm2BKO9euXhVowqScxsOBVd6Q5WNzfNRwhIwC60kLBz28WgLdc5Zf8Nfd5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12081

On Fri, Nov 14, 2025 at 08:54:03AM -0300, Fabio Estevam wrote:
> On Fri, Nov 14, 2025 at 4:42 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > When the system is suspended and ptn5150 wakeup interrupt is disabled,
> > any changes on ptn5150 will only be record in interrupt status
> > registers and won't fire an IRQ since its trigger type is falling
> > edge. So the HW interrupt line will keep at low state and any further
> > changes won't trigger IRQ anymore. To fix it, this will schedule a
> > work to check whether any IRQ are pending and handle it accordingly.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Fixes tag?

Will add it in v2.

Thanks,
Xu Yang
