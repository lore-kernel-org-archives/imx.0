Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2518DF73
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734125006; cv=fail; b=ajwzsvHa9U86Ui4uRazjPfwL1fuC6rEsiEWFKXVyw7einVtw8WMHZBBs4wuAiSsOD33LvId7sTlFZZAHGriUn30J84rNjNqNoEP8i4fh+gBK3iaFXhxJB1byxXw5GcKTH0hQ7hTwNl5MvIK+8FECVsAqjoaF5EnFXpF1xXB+ozs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734125006; c=relaxed/simple;
	bh=a1bGzaE9jS4jxNMXhZ0IcXxtvN3+JmCp40n9Ue8PNU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PLS4AiXJ0RwCVkfJ85usewowtjlRLQsRnWUf6TcE+Ltn95J+w1XXfnntULHUVe20JE+px4DEG2odY7rttY9ukkdHTDUrhOV5QCYKSR3dI+rREkKlXOwiAvs0yVugiLkAe/7/2K0o/wE7lNaVeTFAydvLa3oBmsAhIIo2tNmAdrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ra5Xfani; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ra5Xfani"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvwRgxi9BKGQPmPatQC0lFBvEu9LCouV3r4mKjsgRrCj78d86OpxYFZ6Fr5KszUk2B4iGREhKShCltrHO2g/OCWgyrkr03mVkWZ4jw5+5XASlxnMcu5/YLql3jti6+lDinUp0m+exmgUfBt4F9X9KcDvNfdNhkciYhZtX7aXX2sWRi6s/x3eFlcCcf/rsvrOVUVad6/7B7zv+qMAhREaYr6m5Q8D9fLl4adtfbpwz86S/KyGayniyeIehNFCPDDLdFYiwEhauCLAX52IUM6tjBPykgCXC8BwE/Zq1nma/KEbEKQu6SVDt1W1FKmxKJ/18wsfgUHganRtdnI1DZnMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzQAzwgrLSACgBR+HR+s455jSB0R2yU9/03zGj//XsQ=;
 b=y/WhzlWQ6wS72p+Kv9zJTIujaKbhzHoojtWtndnq/dnk3yKizU+61yARZjaoaZcU9nRinMTcfW/yjFeo0cNShareeV27VehL/xf/hu+2NKjx4lOOI9gRMe/v1vP/PJLX3F4Bc0wNZEMNM0cj9HYjTH8kG60iVbHzywRjjPszSu7p354GQZjRHVKWhF8y4+Y64zm/McIm7eKwhQS+LClLV5qi3WF00qEcoYFHDJ465U5YqFdSJw9kG1aQAYy/VwElnzhk4d7Yv85r/vzbY+qcbRKeayzVAuCW2jBhTdAP9s8ofcPXoC5mLdpacRgkrxSTQnVwy77VzugCAlgp5pW2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzQAzwgrLSACgBR+HR+s455jSB0R2yU9/03zGj//XsQ=;
 b=Ra5XfanieXfNz/YzDPRFTrXSRbfEUdQBlHplqyfP1K0qy9rjsiMTEISjndb5dSN3U0Y8fyCy2Mov/6C0/dGb6w8PI7kx7mHAl/hUc1/7VYs9EAtpappSKQ1l1/27q6N8hRnqxBQkiqESbhHIsGaM5fkQ9K33OuUYNWYKvYy6o8n/cyFYq+ktWBtEU3pNeeIyhpf4iX+O9XeAd0WBScgMMDMcIyrJR0/XHhnOlgr+MRtf7ZJm16zuUj+xV/aCllEwjUoPHlxQ9BTL/frL+l6Fj5E0YinsXUU2SrCHjk6C9QOwn7wFX8zS1BdbZ+O/DfGzz11Rorq+QjIeOxLoCz/5nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 21:23:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 21:23:19 +0000
Date: Fri, 13 Dec 2024 16:23:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ariel.dalessandro@collabora.com, Fabio Estevam <festevam@denx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid audio
 codec clock
Message-ID: <Z1ylwPiSt/jRJV8w@lizhi-Precision-Tower-5810>
References: <20240821143420.2564869-1-festevam@gmail.com>
 <CAOf5uwnUPDPVzM7vNPn-tGrt2ENuuUzVfKh1q7AiORcAMZm0UA@mail.gmail.com>
 <CAOMZO5DVy7x62zfX5UbDZUi=c8nbSHfD=Q39faZTBz87bz3W=g@mail.gmail.com>
 <CAOf5uwmg83-TVQvbNOCnzBh9JdQAC=5hpgbCeT-6qJ=+YBrssg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOf5uwmg83-TVQvbNOCnzBh9JdQAC=5hpgbCeT-6qJ=+YBrssg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4beeea20-8c77-41ce-c3e0-08dd1bbc5db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWEvVXN2Nll4SGwxcFBBNlJVQVNlLzE0OG9ETVZXZzNMVnc3eVhWYlp1cFNr?=
 =?utf-8?B?ZGpLUUwrRzQ0MHg5UjFsdHZRZnVrTis5Y1k2ajVBZUp2KzlpYjRSNk84clZR?=
 =?utf-8?B?TVphNlE1NWhTVUY1NHVaREV3SlZkbnFjZnZpTlI0MVNsQXFOOFFCNVZWYUZ2?=
 =?utf-8?B?S2UvNHFCQzZDZGRTZTQ3Z0J5TEtVVklXdXp0T1l6L2g3QVhzM1c4YnpXZ0gz?=
 =?utf-8?B?aEYwa0pReHh2WmhHSUJMK3JZWlhXQ0F2Ly9WYkt1VXdmczNXbStXMWxNKzhK?=
 =?utf-8?B?NnNiT1FmaHBXaVV0REVmZjhLRUJJUUc1eUlHSnNPWDRXVFU3QWJBRjhRTVhm?=
 =?utf-8?B?RWpHdm9mb0hMS25nRTFsVUtoTlVuWkJxa3Q1blg4aGI1USsyZ3BYRVlkMEJy?=
 =?utf-8?B?SzI2bjRKTXZjY0ZIVUJ4VG5qWWNOZWZjYzBvMG56elJ6QmZ6WGZaOWpZZ1NU?=
 =?utf-8?B?dTVBblNBT1Q3c1hneXhXV0gwT3VxeGpFWXV4alRwMVVMR3YzMVp6QzZISVF0?=
 =?utf-8?B?Q0tqQ3hraHAwMFZZSWNhdDlNb3kzNzlMZFB3YVlwWmo4UXhsQzgzaHNXODhZ?=
 =?utf-8?B?T1oyOXgyT1pzaWdvQ1YrbUd0OS9xVTBGQmoxQktNUXJWM1MxUlFyN2xJV1Bj?=
 =?utf-8?B?UzNkNnZTdW52KzYxaDlIS05HUE14cVFzVzJkZ3MraWNGWFRkc2FtTHFsaXV0?=
 =?utf-8?B?Sk5xQ085MkNkQ1FxQWs4b3ZLc0UzZm1LWkNIOXZUeW1BdGRZM3pmVXV1NVMv?=
 =?utf-8?B?bWVwbVNKQkEzeG1nSWtVR0t1Wm45UmUvZ2lodE1PbXNaVTNJNTlHV2c5TzZK?=
 =?utf-8?B?T25YQWh5VHgvRWpkRXYzNEZQNlBsU09wdlZET3pKK1FNK0dEdnZCU3pyM1RC?=
 =?utf-8?B?STd0UGlhcjZMOW9ZZlJyVXNXd0lXcTRBS2U0UzJINndud0IrNlVFcG1BQUF3?=
 =?utf-8?B?NEtqWDNWMVh1MTVQWEtpSlBtWnN2UDBRZVFxRHlJMitINytqM0RWSXJaVkpI?=
 =?utf-8?B?dFo4a1lDbW03dnVsV25LdUhqQW1jcUhIUjNIWCsxOEs0ZXR6aU1LazVIbHVz?=
 =?utf-8?B?TUZSaTZTeWZJZ21rcExKd1doM3l6azlUaWlkZW1taXQ3NGZma0lBTjRnT0ov?=
 =?utf-8?B?Mnl1Vk91ZWJvOG4wbGxSTUN3K05BbjNLZEZieHlXaWhNTzZSQ043R01xTFB1?=
 =?utf-8?B?V1J2UzVhbDdxZDh2RlN3SC9ZTDZ3Z1d5N2RNclhOc3IwaitYODM2b2E0cWtu?=
 =?utf-8?B?cUlINXE5d1o3NGtxRlZ2c2FVWVVRbGEwUTVNZHQycTFvc2RIV2lVOEpZVmJr?=
 =?utf-8?B?M0hUcVczSllGVURDeitCTndpcFY5a2haU0hxc0czUmpiOXNvM0hvRFpqM0xx?=
 =?utf-8?B?U1YrLzVOY2U1ZElCd1k4SE5QOGVRYVdLZFp2NEFoU0F6QXZzcHppNnpxanZX?=
 =?utf-8?B?Q1oxWW8yYTBDSVRXVXZ1YmtJeTFGME5WSVFDNVJaMldiVFFyZVRvRjF4Rjlk?=
 =?utf-8?B?Z2pGYWo0a3BXNUQ4SzVSRThvUlZqR2NJOG41dml0ZFBUemUzSTNEeFR3d3R1?=
 =?utf-8?B?TDJBYVZ6RE5vMkhJVXdMUkpoMk5EYUVmbEwyWW1ZL255dGZFL1dQdk5NbVB3?=
 =?utf-8?B?a2dUNHpTNUl4c0FrTkViWGE2VUFmWTAvbVJXcFBSOEgyVWZ1YWhpQVFpQXg3?=
 =?utf-8?B?N1VvdktJY3grUlJaKzVKQVAzMUtwdVA3Z20ydysrMUZoSU1KbldaTnBIeDBv?=
 =?utf-8?B?TStha1pSODk1Wk5NT3ErVU1GbVZuNjlXVUR0eVVVSkFQcVgzVm5URGhwbDF6?=
 =?utf-8?B?NDVYa1dXVk1pNXRSU1ZXUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhFdTZ5azVYWEgwdnBuVzV0a2xObkgzWmVHd01iUVE4NDEySUpUaWFUcmE0?=
 =?utf-8?B?KzZmdHZCT0Z1eVAzOFZaRE1jM3lTT283ZGVsYzJpNGVmUzVqTDFLaG5XSEVX?=
 =?utf-8?B?anRVQjVlajNsNU1QMFlYemJ6MEsvVkVFZkR0K0VwNTFPa0ZocVI1VDN4N0Y1?=
 =?utf-8?B?d3B3cHhNVk4zU1JNSDAyMEhHR0VBWmdtMHpqbUZTd1QvTWkySHN5NTZ5S0lC?=
 =?utf-8?B?NWlMZHVlVkFYTkV2c0tkc3pueEFCb1pzMlBXRktiaGV0VVV4K3pvWUJUZVFE?=
 =?utf-8?B?WHFZTWovZi92RU5xbHVqVnBoaGI0dktMeThVc2h6UHV0aSttand2M1JXU3h0?=
 =?utf-8?B?TElqQ0hBMDRVd3FxMDcveDJRWUhUZ0RTT21XMjRXbWFsRDIybms4QkFmZ25w?=
 =?utf-8?B?dnVZb0Fac1NtS2ZmaDNxUkhkZERlMGdpYnJIYlVSaHBVRzB1S1F2NGJlV2Zj?=
 =?utf-8?B?WVNiQ1Jva1JieHF0ZU0xU0NXQ01UNTMyTkFYK2F4eFAwN0dsUHFaZHdQWVFs?=
 =?utf-8?B?ekF2bFZPY0E0RkVKdEVSUDhGdW5OK0lTdWFHUW9iNHRtRVNmbGRva1dQSThy?=
 =?utf-8?B?OE9EdXFLbEpld3BtOXpFaG5ydjArN3ZHd1IxZ2MyMEJtTElLYzJjSHdNS0N0?=
 =?utf-8?B?V0MzeUQxVkI3M0lpaTRFVm5vWmVnMmM2MXNyem1WaU0rMWZaV0ZtUzVjeENO?=
 =?utf-8?B?TERiWnh5TUhsQTlwSXAra2xEZ1BoeFI4UWNsTGFtdmtreEFQOWtzQ1hqNFdV?=
 =?utf-8?B?WUZndHVuSmFUeFdnQVNIcy9TYmNkSnM5elRGZkhrT2V1aXlETGlsUWRwdXNG?=
 =?utf-8?B?RE9MSjN1Mno5eDZOS0RhOE9LaWs0QVVXMHBwSVBDanJWWVpMWW5uaWhXbHRL?=
 =?utf-8?B?aFVRaUZ0S2tReVF0MlE5bFM4QytVZkpsdzE1RkFxTUF1dU1xR3k1RStDcjA2?=
 =?utf-8?B?dG5BNTAxdEhrNjN0T044d1pFbWovYSt5SkN3TkVmdS9ua3JDUlc1OWNlL0RH?=
 =?utf-8?B?R2tUeG5yL3hNK3hzNWtxY3Q5V1JLWUNma1JRVHh6cXRBd1QxQzIwSWp0a2RJ?=
 =?utf-8?B?ZkZZd21HRVZ2amxUQnRpTjh1eTgyN0pLTlF2c092Mlh5dVNNaGNnVHNhSEUw?=
 =?utf-8?B?OTJtc0xWV0FnMS9rTU9wb0lRZm50T09ueXJiYlNjUW1Qbm1nRUxFMGVMK3VH?=
 =?utf-8?B?N1RLbUtlNnowTE8yenRXWEV3RG9EM2J1Z0IxQ3c4ZlVUdTBoRzRZNWd4Tk10?=
 =?utf-8?B?V05RZEo0TCthMFgydFFvNXlNUU5qS0svOHJQYkl4allMYTkrUmhUbW5tdGRN?=
 =?utf-8?B?VVdzMEcvRDVVM0RqaU1ubUJmd0oyVWc5OGNWNWZwbkU2OHZzckpSZjU4bU9X?=
 =?utf-8?B?d0dJdllSUlVhZjRSUGpSUE41UHNFeHgyNUZ4UzVQanRsWGJYWC9ZdTFlRSt1?=
 =?utf-8?B?UnMvVU84ak00UFFoL2lsbldtWTQ1bEZUTzROWXhUNlJlYnNaNlpXc1lmK0hm?=
 =?utf-8?B?MWViTlkzNDJZVVdJQWhIcnVnT280VTRuTnl4a29lUDBNYzVVT3U4bWNUTDBX?=
 =?utf-8?B?MkJHdS8zWlBGK09UejJBTnBPMHBMZXBFMWhvSlVYSW96dWxjMWFwQ3pCQSsw?=
 =?utf-8?B?VHFIUFFWd2ZydXR2RUZMMjQvcDJnYnJtS3UwMTZqSldHNmdPdkx6UDk5M21n?=
 =?utf-8?B?OTVYWkpOUUpKL25NU2hnT05ObjVrNW0reVRGc05PUFU2NnJHY1dYdFBaUW4x?=
 =?utf-8?B?RFBoTmh0UnBGbS8ydmliMFRKWTRmMTZDZyszRDR0THRnOTdGaDZHcDAwVmdQ?=
 =?utf-8?B?QW9WTi9oOFlRNE9Ba1dyc0greUlYRW1QM2F0ejR5S1Q3NFFPS1lvYTdWNGJ3?=
 =?utf-8?B?YW1meGhnTVc2WVdEZDRpNXN6NkM3UktvSmViTUNIcWVvZ29ROU5LVlp1aWtO?=
 =?utf-8?B?dlpEeXhZNFBmaU1wWk9WN3RweVdjSzhNM2U3U1hzUDc4YkxxZGxxRlF0VWx5?=
 =?utf-8?B?ZGpqbUVDSWNCdUNBYUFkcitGRUdubXAwcDZ2WE92VDdoZXM0Zm85T1N2V1ho?=
 =?utf-8?B?MzJ6NW9yS2lmRUZMejRRUlBDZy9iWXJlb2U2MHU5cE52SUxMZ29zczFXWDRr?=
 =?utf-8?Q?XlwV4tyQuW8kTLWugb+7LDFpz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4beeea20-8c77-41ce-c3e0-08dd1bbc5db9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 21:23:19.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oka64qt7V/lTo2Qm4LI5sLWdRQp9uQGXb9kOAUZsdwGE1qM/hFVsaDeI1flhbxuY9xBFN4ekbkRIvsbjPZnu/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

On Thu, Oct 17, 2024 at 01:50:13PM +0200, Michael Nazzareno Trimarchi wrote:
> Hi Fabio
>
> On Thu, Oct 17, 2024 at 1:43 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Michael,
> >
> > On Tue, Aug 27, 2024 at 9:03 AM Michael Nazzareno Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > >
> > > Hi Fabio
> > >
> > > On Wed, Aug 21, 2024 at 4:34 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > >
> > > > From: Fabio Estevam <festevam@denx.de>
> > > >
> > > > According to ti,tlv320dac3100.yaml, 'clocks' is not a valid
> > > > property.
> > > >
> > > > Remove it to fix the following dt-schema warning:
> > > >
> > > > Unevaluated properties are not allowed ('clocks' was unexpected)
> > > >
> > > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> > > > index c6ad65becc97..475cbf9e0d1e 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> > > > @@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
> > > >                 DVDD-supply = <&buck5_reg>;
> > > >                 reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> > > >                 ai31xx-micbias-vg = <MICBIAS_AVDDV>;
> > > > -               clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
> > > >         };
> > > >  };
> > >
> > > Let's just give a test to the board
> >
> > Have you had a chance to test it?
>
> I will test on monday ;). Is that ok?

Any update ?

Frank

>
> Michael
>
> --
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com
