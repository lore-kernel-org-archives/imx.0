Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023140.outbound.protection.outlook.com [52.101.72.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7B372B45
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018654; cv=fail; b=SbHL79jS5ibQF9eFp7mfYu0XcfnBJQkr0qmcdP2hbAtqiYeycohqPe4rDLErJAOoMIMCRRXRQOLseYStSsw2aBlWx4rBZejor66LKXCAR1ZcO24j7jv7iBzmbb61pvO2cc+kxZ+iKGNvJaHU2YWCXZSZSZ1l4D7eoknFxh4MplA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018654; c=relaxed/simple;
	bh=7hROAL98BWg+cEEvcg8L8FjaRDVwf41CJG4WOYV0ynI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UZwAkjLi7F8sZtBY0EkRE0N8NJkv2bBSDduvrcJEvWXm5VKryzI/T5XTb3g5msz7UgqsleujeO2qSJHRhPKgl9sIk+UXO/59pNuu4qH9C/+sNBajPlv47atYCxKbH24nkR4KnwPnehbYDpS8xjbD9fAeI6ClL7W5FcQn/usTspM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=RnZ1c3Lr; arc=fail smtp.client-ip=52.101.72.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="RnZ1c3Lr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D73sWv2TgP7dRYKniWbflGUB11C6cOKZ86PaIwxtkJkmq38auyVulydZqUYv01bmUZlWFdH421Y2gL+SaEiEV0CN42ZuSIdSvdt0dEmJLhCeSncS6tYxVOeiVvfCVNr10AFF/7cbYo9Pm5m989iTeULi5bKGj4WE3qi8I/vwk/HBxDx5GztwtU9CCzmop38ykeKNAQLyqO3nTj5qy0YBpiKe9irXHs7DMBbwr36Tvo3Z+qF9OUqB1tmPLhmIQa0kDnQSVkqsEKOqs+MGmm/uj3k0fr3nFnpL8RgHRvJFuNVUKvZX4ETVV0hwSj1m2nCGB+31f4iTrX45iF63KNbAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c477LoGm9CazJWHmikLpm2ONm0tp2sZ6m1MVfNq7Q5s=;
 b=bDbhdGSH9V46NsyVjW9jfwR/Dwj1sWtR+Jg2oR+HgW1zPL2rhbJHNpF+Hjbk0ifb+dPiAos4P+0fkkO27c7p/iAhuflQczlG/rw/0z/Ny/scJvvQUN81fZUHda5+ilqXLohF+vACbozRiDKXQx0QMmCdCBZPAckxMeaREX+HEs30BO8tEHzlyhx1xZMpC6+GkP32h6G1vKlFk0RO1G5POs3t605Q939qxcSniS+r7R5VUFkimJFnbuKlDFeIcyaYX095IEmsUSQNDn5O2hTdsNW7fpgMN/9hIfNA/3hYEk76aD2X1luo33VF8ojdFtS/wtp+BF+XkOzHepeG497vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c477LoGm9CazJWHmikLpm2ONm0tp2sZ6m1MVfNq7Q5s=;
 b=RnZ1c3LrcDB+Ua9XuX+OvKokq/9QZTv+nHmntZGFBkO6JMH812MTBC0/BEFSywCyg2QzFy5Bm0KSb6tpcwbE8PB1sv7SOk0zmDven7wdgXIuJZW9KszObBtEkCbpgYdvsWjKkIANnFhj6hQfsubscD3MHr34v9oVDJWalKBZgH6Q1GVn+ledUl9R28eFmL4oq+JXUbtS1eo8Ix9+jTKhZPJ6pcJ8xm/jBSbAIb5NNvN5FIw9Sw/6t5L0aTOxqLdJeUvEdOfo5eMavctGYuTDASMgWqWvIoLnecMiZa1KKn5rZV0dYjOB2SnsIOFKd4UWyN0Ev+aEK6W9V3+FP7CUjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GVXPR10MB9482.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:326::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 08:43:58 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 08:43:58 +0000
Message-ID: <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
Date: Tue, 14 Jul 2026 10:43:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Frieder Schrempf <frieder@fris.de>, Srinivas Kandagatla
 <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
 <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
 <20260714083259.GB22086@francesco-nb>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260714083259.GB22086@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GVXPR10MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d49fef-67d3-49d2-e25f-08dee1840b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|3023799007|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IM4HaAFBc9Mrfs/iYe4ky9q3alc/BNpL3u9rmDvjmFE6Wfb66g1Y4rbBcVquw85B1YqSK876zlbqxgiBJaH871OrJZu/ppkQ9uL4yS2AgrvDh3rwnN2zsp039JZiBZ0i9lob6kIzF+aWAeqlKsmSezBQXwn174OZ2zS1kSxtxqpD9UXcGVujUvPwbctgUBhv6OoQ3dxipyUkSHrBYWjMjhVtvwAO4ew3Nh8jYe9AOTBy4Qn+ZMMwKxrfLkPLAQPGwyr8eewgB9Tq/tbp7PGREs0Iv2ec7KqYsQvTLYyy7BlLa+BbY7WEQSsKfCjIEqzxIja2HQFJbbctyW8o5IVt1sAkmD5lL/+kljamaMdFZCkGDjLN3L8ONKt7R+KNugshhgEgQ1PoZoG4qrxmLerPG5uA1Cg6U14FdVmz9K0Pj968sVNpW2Zqkph8pqTnLWd03BRhNaDUnM6aT7vP9nfT1HIsJSy55rFW0v3ST0T0puP/U9rxIFq4AlRFjeMl0SG6kWouM2NbBAvJSuhuwYFd+RrVKmhTR6O5efvIgGqUC9k9Vb3ycqnUy8oH6s/kJH2MnP5k+oOuo4gD+BSXoqrpBjmZ+TsW1G+QJEHmPuXCI8eEA1TeOZzBt7+cEnuUlRbKvE3PrdkWJ6gAD1A9KwYAUBpDEvNWl9VzH+3EVXvkhGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(3023799007)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0laYm95dXh6Q2ZwS21EcVBnUDlLS0c2MDlzeXN6UTFJam9sRGxBcUlnbEN3?=
 =?utf-8?B?U2c0eHJLbzZ2cFFGdVdQK2xtUHBwQkVJWGV0d1U4U1VPTGptS0Urekgzb3pD?=
 =?utf-8?B?Y3lsaTJ6MlRFTkdMYlkyclV6MXZvREVpU2ozY1Fjd0xmaEhMTE1uUjVvQnNt?=
 =?utf-8?B?WVFUOVY0N08rM0ZBTndjakFIcHVpQUtKZGVwdE96N1NoSGR2NklwakFETUFZ?=
 =?utf-8?B?NDY2YjcwMEd6VmdCdGRiaU94R216RVp2MkxwZmN6c1BodXY5cktSclppSUZi?=
 =?utf-8?B?U1QyMFk5cXB2Wm1ac0xKWHZGVHJOS3VkV25wT21wRUJleTNsZkpSRFU5cGFl?=
 =?utf-8?B?VTRHWlltQlBIbDVrYlFlcm1tR3J2NlQ0Qmc2TW5pbk9kVk5zVnpQNVcxb2ZF?=
 =?utf-8?B?cjJLQkZUTFhpK0Z6bHQvMmpUMzFyYklVKzBkYVQzZEpBK3NtemtFc1RzaG1v?=
 =?utf-8?B?ajFFZ0FINlBiMDNRTTlwSUdyR1lXNnc2akxxQUcwOHF6SERqWDdWT0xDK2l2?=
 =?utf-8?B?aW1DaEYrbXBIK2E0YzZEaklpOTNJTEdBK0RCcGJBQW1TRXJRZXlhT3pqdTZi?=
 =?utf-8?B?elFvMjJZVE9HYWJmd0FiUXpYakZPb21EKzAzNXJOdDZRZ0Y3VG5hUWN6WmJC?=
 =?utf-8?B?MlVSN0luVTkwNWxOUEkxeGxUa1Vsa2d0eWxKTWFiWFRPZ2ZyRWg5aXpxSmdm?=
 =?utf-8?B?N1lKVmczMUV2eVRKcGxXai9NeXZtTEpXU25QQ3NMTW5yTkY3VWo5NENBWnM0?=
 =?utf-8?B?YmdSdm5Ra015d2RvMTV3V0ovRmpCZTN0eVRlVVE4SXNPVmJYT2tKaHdheWY4?=
 =?utf-8?B?UkQzcUFEL2Uwdko5cWVKa0E1SzNka1VNTGxabFIxMVp0TmlpSmJGQ2xYdnF4?=
 =?utf-8?B?UDUxQkQ4RFBoN3ZkVnFJTmFSTjZERmp1SWN4UXNaWWt4eWpHaXNMcmtqeFJP?=
 =?utf-8?B?eEpjSG5xckhXVSsyQXI1WWZsc3ZaSHdib2doWHVHQ1hSV1RTTkhoMGVxT2sr?=
 =?utf-8?B?YUpNMFJnUGNKK3NXajdjTE5IcmVPMjRjZ05tZ2JENmU5ZmJUOGRSTzlJeWJm?=
 =?utf-8?B?ZFZWaHhVQjdSNmdxT1VwV29VNjE0aW9rYVNxeDdYTFo1cjNlRDN1V0hYYXJ5?=
 =?utf-8?B?a0d6SlYwaUgzZkhTay9zM0Q1em9IRlhWNTRGWCthd2pqQXdvRWp1ZkhjWlky?=
 =?utf-8?B?aG5nRTA0b1BBQTlPajREQTdZaUhWMWZOZ21YQ0lpVllrUlFGNlBxcjNEMERn?=
 =?utf-8?B?ZHp5V2swMEdibEwrZHBab0JmRFZrVjJkR3ZNZnJ0UlBIV2Q0NDJFUXZsWk9o?=
 =?utf-8?B?djlyalBFM2xWOVpFbCtGdU1GMC9HdDFJRkVDZko2Z1VndXhwcFAxa2M5Q1JF?=
 =?utf-8?B?ck5oMXRpSDQ0ZzU5UStsUVhSVjhKbmlTbTBYSE85d2F1SHBGY3RCNmlaektr?=
 =?utf-8?B?Y2JQUFhZQi9jZ09oR0tkWUhlM1piZUFnU0hKcmlVRVluK05YZVBEemFaRVh4?=
 =?utf-8?B?eFV5dkhjaW0xOENZdUdHVEFKd0JyTkVldHdWbnc2bUlJQUxRR1VNc0RodXZS?=
 =?utf-8?B?SExkV2c0eGw5MEp1dGNscW5ZeWNyaTU2cm1ON21LZ1J2dWlxY3BiQU9KL1JM?=
 =?utf-8?B?NFoyQjhoUllkNWwyZXpreHQxWmhZTDJEaDhIS1diMzJtaUQ0NXVxQnViR1pt?=
 =?utf-8?B?Q2FuUGYyNHdUSEg5S3RPTzZadjYzZFZMc0ZIT01MelV6bWNKTlFFcG9RaFR2?=
 =?utf-8?B?cUw3alRNeHJtbTU2WnN4MThoanZreGs2Z3hoZGp6ZWNyRVY0SjRvckVaR0RT?=
 =?utf-8?B?Z2xDZVY5a2VFRTlIeXEzL0VpWWtVRDJCbmFQVElISCs5VlhtbFZLWVZPZTk5?=
 =?utf-8?B?SitiaXZuemR5aUFNMmM3UnJvdWp6WEswaC93N3Z0Vk4wMXQzSHJVWnYwTFE2?=
 =?utf-8?B?RjNtYXRmTTdLYjE1WSs3Mm1VK0duS25tR1Z2N0VMU1VWUHJUb0pHb0E1RC9j?=
 =?utf-8?B?aEJjU0QyajJVc3hWVnJZRXl1N09SSHdBZjlrdFM4aGhScis3TkgyTnZvMGRV?=
 =?utf-8?B?MHFkWCtKaGFFQnFXM0dSUE9pKzNFTUF2bEVGamx5b2VSenJFSVhnSUMrL0w5?=
 =?utf-8?B?djA2NFhFREZPSXpGS3Y0Vm1ZU1dhRjg0NW9sMnQ2d2N5L3FxV2t3NUpRKzR5?=
 =?utf-8?B?cWE4WUV5dUZEU2ZJTkZNZ3Q0OHlPME1LcWZMRzFpRDIyd0tjc1ZaM0paL2to?=
 =?utf-8?B?MTZoS0N2YXR5UXJWeW4rQi9FUDhqZXVERXRZM2lsbkJLMXVXRmdWdXVvYlN4?=
 =?utf-8?B?OGx2Q2ltQTFWNDBVbzFEMXNIUjZGR2Q3bTJkVVVqc0NQUHZkZVp3ZERWVmVz?=
 =?utf-8?Q?XUyifoWevyRz8kBg=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d49fef-67d3-49d2-e25f-08dee1840b8a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:43:58.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKIczVEKqxlJFaPGYDwQ5N4GyLk8p9AIGn5X0UL0fumX9qmkg/sOQaRKdNFA2Q2uUZVpP0pFN3WUTZiYxFU+LD5/XF4ranvi/e8b3hmN2QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9482

On 14.07.26 10:32, Francesco Dolcini wrote:
> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
>> Hi Francesco,
>>
>> On 14.07.26 08:59, Francesco Dolcini wrote:
>>> Hello Frieder,
>>>
>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>
>>>> Add the ELE firmware API node and pass its handle to the OCOTP
>>>> driver. This allows us to gain read/write access to the OTP fuses.
>>>
>>> This seems something we should have in the soc dtsi (imx93/imx91), it
>>> does not seems board specific.
>>
>> My original intention was to move as much as possible into the SoC dtsi.
>> The problem is that the memory node is somewhat board specific due to
>> the DDR. And I can't move the firmware node into the SoC dtsi and assign
>> the memory node in the board dts as the checks for all boards not
>> specifying a memory node would fail then.
> 
> The ELEFW is required to boot, is not an optional component for this
> SoC, so I would try to find a way to have this duplicated in all the
> board files.

I don't think that this is correct. The ELE firmware is currently
mandatory in U-Boot, but this could theoretically change in the future.
As far as I know there is no hard requirement for the ELE firmware to be
available in order for the SoC to boot. If someone wants to build
software without optional blobs, they might choose to not have the ELE
firmware in place.

> 
> What is the reason to have this memory address different on various
> boards? Can we have a default in the soc dtsi, and allow the board to
> override the address if needed?

There is no real point in having different addresses on different
boards. But the node describes memory that is physically on the board
and not on the SoC. And I think that is why DT maintainers want to have
it in the board DT. It's the same with the memory nodes for the
remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
But maybe I'm wrong and if there is a possibility to move this to the
SoC DT I will definitely take it.

> 
> Or can't you add the address in all the boards, and keep everything else
> in the soc dtsi?
This could be a possible way, yes. In that case maybe we could even
create a generic dtsi to contain such defaults for all boards.
