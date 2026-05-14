Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC503BF698
	for <imx@lists.linux.dev>; Thu, 14 May 2026 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742373; cv=fail; b=F573+4POd7+UDilpdY2ZzvyYtXxu2zLkmPrDkgs/DhKFkWouN0DaqZcgMd2Jx2NIrfJSsxGLADKRSYmyeoR774pEdOAVc3YOZ3MK4eligjf0qI++ja1oUDO6Jett8zvVdZCpfkSd3sqNo8IY1wiLYt6K4xyHMSmG2SjZDSXWsvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742373; c=relaxed/simple;
	bh=yoihe7q1BQd+oA1jMGoGv6yIISFnrxM9kkE9aCL0k8I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Sme+9ECCo8zDoX+bGZcHXW8ZTtseq8dVgyMKXjEwR67jpuwkSy6wFNhDTMx0qkydKzOE/VLnz1r1q8keRwYPhGzmItHR/El3yDkUvBgYYZnB/VTI2rhAVZ7R0VeEag2Iiuy2ig7K73eBRrs8uQXnA6pXyfcR6t/IWCLZdBEJsxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cKYFawir; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cKYFawir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTPUJZ6H97KFxPX5kbprRn31QdIxjDPaXo7g0xhig6AS4dL9U6WwLeuObiUhWeJ2eTqd2nlmDCYBiZpIrJQPss2YkKCu6q/dL6jY30nmhAsB3Xq7hEvJVFXtDu3cH63RflNtjlU6+beXFMB7BnhghFgCg3ZILWEcY7+c95Tv7obqi17uJItfgWgytVT70IV8RQKUQuwoB6WKmFuBtzz9qkrY8TVukRNrswjNIdcwTAZhKEA4/pyLpDP54rv7Vv4pK/fm7Qhpl+ZKdV+WlilnUNn7Pm3Wwd0f57fHQKBuE48SFi49rbmkwebaWTstX5CFcIsWaoNvV5ejBlHEib9+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TckF2xvufE3xT8u6+HTnp14yqoCSRzaQqKUzkwyFr0=;
 b=KI8++c/nfOjyOJ9dC5CHxjdc3KAPmMMSgsI+rg+pnwdrZ7DIzUXnT4qLAvxZnQXoWdKykNlaJB0ITQDVJ3YzP1Wf4Ikyztodirc+X1LaILbtyhZhbd3QQPga5fYQIyPDZIEayaq8jpA+L4lW9B8fiCFCo+JVjHx7KUyWlTVawKppHqz6RfFweSCxCw7UNnzMF37YEZzNW5/pMquG6NbLG4rc+ea9LT3GQ+wKs0GvHdL5v9Gc/92TeAvJCW0qY2XO11FQ8uclKA7bxq5SmOVNJslCySpNdBZMkBo/oTD3YdMB7V20kdH5iLimxPX0djFqHzd5/oAB664oZC/+iY/3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TckF2xvufE3xT8u6+HTnp14yqoCSRzaQqKUzkwyFr0=;
 b=cKYFawirN3ZKjKn+o59tWo4+ULSMoPvgeLv8lipg6UXB90gLDTBt/vEatjiz0Iq63G3ZrbsrNzsBQLxX9Z+rtFWAo01QkhHi3kBX31KCUFZouxutMxsd/uLjpvljpb2Ea/90xopLMY3mziheb6apAqEpOVr/5VQuVK1mhngOw6XntgzLvsfkh310199oSa5lmpzVw6FlM/f1EUTOBjurxRvOqJTcs/NDGBhYPio5kVg0eXcYeKFU9+fKsBZHk9jh/7AGXGa36xLRmA9DiqeiWrIWP3hN8dGBQrMYXkCWi/4TKM139JO2BsqNyWSU4tJuDbA5Efxp5Z7AV6SBTJbUPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 07:06:08 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 07:06:07 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/2] add PIT DTS support for S32G2/S32G3 SoCs
Date: Thu, 14 May 2026 09:06:03 +0200
Message-Id: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::6) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: e2422557-964f-415f-8b19-08deb187451f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 MO5L75WN0f6NedcJu7FkShlqQfss/IOPsU9p/kZbAmzs/nMwQbYY/dTTmpcmN1OgZgHy8UAmZ/9iMX8e/5dokjUqVS678Pn0ub26GNh0DDmNawln1QMV5wAOO+ewH4TFd5y5DqM6YZ9UiFRVazgdMaNhmxnbIGFMIY/vF8hBD5zjII1BkFT07ah1asL4us23V0giD6jPLljBzqnRcmiyNdWmgQGKAlEEtCFUMlEOOzs+5zKDCPIn3hzlqs+VyOMvW7cBM2NOaAxTkldvZu9ZOwteyPWnzEqdV0I12fjqt92xqEiTxgrH1OZRKVRNPfOoGbQHr97azZp9tWjPLQGabwoZ8j0/b1SOQolAU2cGf0ZES06bV8m5T4NXZuf+irB+2fY92w2EpXNC1u1JoQh8RO/P2X1rpL+wR35fJ/4RB1gMx2T2NQyNjHL8hENdm5/91ZPfJt+aKxT/oTIgj1Cn/Nk5o9MnVYiKRqIVSPo2E3aZ2MmXF7oDJMX22jT1XiiJYgH/R3ITinHeW0CsKZpZ6FZahTE/6rgOrFYh6RYEzHzGgsVKO+nQ3THgqnrhHBKh44rtcovdJ9pO+orLSQkISzM6qJGzoZ6anLEauDeH96wGlsaC2RXoguEtb7ffMtIETKJgXeLI7G545bDVZWVAb0/MdJxhqUcJ/g/XgDXUHUfoeX+fx0UIkpjS5QZskMhw
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T1NNSXdoWVRXNzdTS2V6Q201M2FjWmZhWWVhYWYxbGtVczhld3FaVmRkNXE5?=
 =?utf-8?B?N01ELzR0akVzSWhjM1BtaUU5TVlDbXAzaElIVVhFSVNja3VDNGRoUjJLSU10?=
 =?utf-8?B?NEFaT09ydGExeUYvK1Y3Z3h1VlRDUEorODU4eVdOaTdiazVQeG5jaG43NFNO?=
 =?utf-8?B?blQwSXdnVWlwMG8vWjhxcFBhZkF1NlB5MTl6Y3dQaVBHR3A5Y1EwTENIV2w4?=
 =?utf-8?B?bi9wcXRKS09lcHBob01zaDdDOUF2dDI5V0VWNGxWenBYTnpBbEVYeE1MNG9o?=
 =?utf-8?B?QTNiVFh2QlFRVkpTSEl6QjExZFYrVGJaSzJ0dFgxSml2WGpFNmEzdzdwTVNs?=
 =?utf-8?B?cVYyblBqblJtcGlJRG94RXM1V2dkSmY5Tjl6cXdVdHBIbHUxRnZrcmJFVVlZ?=
 =?utf-8?B?WEgzNm5wbEM5QmwzSnhmUnJDRjkwZG1nS2dIdTAzM1pjMDVFVXhHRU1YdE9L?=
 =?utf-8?B?NjA2NmFxa3JZd3dybUJ2Szk2aU1nTmhCV1ZZU0d6bDFxRy9ncGhwWm5hd0Qw?=
 =?utf-8?B?S1JyL1ZQaCtXVE8xUGRCVUNzUk5Vb1dvaDVqcEVsVUozSWw1SXUxTmk1eU5D?=
 =?utf-8?B?S2hhUExuNDBFckIrMENKME9GZ3VsK25tVW9EV25TOWt0YU5OY0ZrYTMxeGpQ?=
 =?utf-8?B?a29VMVBLWmRKa3VGR2lnd0JHRU1jQ0FpRUQ0aTRVVXRzMTlJSjdkRTV1VXIx?=
 =?utf-8?B?TkxjZG5oeHd2VXVybzQ3VlNodkdjR21QV2ZuTUZpbFJGSXFGWFNGR3JNUTIr?=
 =?utf-8?B?T1B0RFc4a3ZvbVpuSlNqazlYUi9UR2dhVW9zdzJuZFdTVkhLR0xQc3hoRmJ0?=
 =?utf-8?B?ZUVlVzZVUUNoRnM2d0htSGhlejdtNzRqOE05c2VBSWZTck80TXVta0g1cUdO?=
 =?utf-8?B?aHRJWnl3ZHpQcFNhVFFaSnpWTFhOTk5oVXZNSk10SVFhdW42WTVkSlB5eUEz?=
 =?utf-8?B?MVFWMnIwWnBlY3dYRHdxZGRyQkxsVmRNR1BWaEx1bkRMN2RVb1BVVmJqZ2N2?=
 =?utf-8?B?b3hyZW01QnZGWjZML04xZy9YMXMxb1lHOEFFaUVQTUhvTGVZNVNpSTV6Tkxk?=
 =?utf-8?B?S2xUT0xpYnE0YXVKakFySkFtZ0tPS1lONzYzMDROeWJlLzJzK3lIMEhJY2gx?=
 =?utf-8?B?Ky9yTjRxamtsWkRjNkdPdHhHU2l3endDVm1ucndvNklKLzhXQnNpcVNoVWRR?=
 =?utf-8?B?V0VpbEFwbWVsc3V4ak5ZR0JDNnVRTUFDOXZEdGJwUElLd3c0Mm9FUm5vbGpo?=
 =?utf-8?B?Rmp4dlUrSXpXUXhPMU83WjRkdFg2KzlTMURabStsUUJ3Q1lrZWZ2YUVldkd1?=
 =?utf-8?B?SUxQQ1h6SStnNi9JdFJuT1pWQ2kzNkpoZXJ1UE9RUXFXejdJaTFDblpTVk5a?=
 =?utf-8?B?YmcwbTZ6TXVnYTN6UnJMN2lyQ3hiL3RMVEhKc3M1eVNaZjdIcHdRTnJxYnJt?=
 =?utf-8?B?eVVtR2t1Wi9vaVdqcnZZOHNYaTNFY1FHdFV2b0ZHQ3ZncDlOZW9wcGNZN0kv?=
 =?utf-8?B?aHUzdE1uOGcyeEFpNWJZaGNJSnlNOHRoQ1J1cG1nK0ltN1BKTUl0clpvTlIy?=
 =?utf-8?B?STREbjA4ZVR5YUpWUjcxekZ2TW4rd3FCTitGL2ljdjhQV1Y2VUFGV3o1bFpy?=
 =?utf-8?B?QWJUNEpzSWhmQm5jL2hHekMzMk9Gc09CTll0eXltdlZuMnRoM3U4S015N3pn?=
 =?utf-8?B?UVNWQmlCbHBMaEp5M09kakJKa3ZRQXl3TDBPS2ZXWjBNU0RhUktOUGhCTkFs?=
 =?utf-8?B?dWpvN2gxWHlZYlV2aTZlRmxmYU16eGxRV0o0WEVhQ0lld29ONWRuVDVqTEow?=
 =?utf-8?B?QmxJMDRiTDREUDFPeEhWc2pubmgrOHpKY1IrbGRyOTRlUWdoUnpUbEN6Ujg0?=
 =?utf-8?B?RGdEZ214MThOeFJyejVmU09zS1NOeU9MUk1hb3J2SGlrOFlmQzRJSFN6eVFT?=
 =?utf-8?B?SkdJalZ3STJBbjMxdDZJWStwdzRSV09WU1MzYzNkZUdydTlJanpKVHI2b1p3?=
 =?utf-8?B?OTF1Vy8yWFpTQS9rcVR3QThxcVlrMXduemNYd0g0QitMV2YwdE5uWDhTOElk?=
 =?utf-8?B?R1hRcGFNZU1Qa25VeFh6MWFwL3R5TlFJUVVlMGRTRkE2SElqVXN3MVhPSi9B?=
 =?utf-8?B?STdST2Y3QkZZdGZrT3N5OE5UaWJwTkJVYnlzWFdoU0I1NjloMkdZRU1zRkNj?=
 =?utf-8?B?WU9yNm1GRHhCWWZSdVNDOVIzQ0VrWmhjTW93V1dreW8raFlTL1hvL2ZPaDZC?=
 =?utf-8?B?NjQ4c3ZsK3JheUdwbkhZdnAyYmpNWW9aMlZhV0ltUUNta1Zla3VURXBhN2E3?=
 =?utf-8?B?TytMUTQ1RW96S0FUeXorT3Vla0JpZXNMZ0hENjAycG5vQ0M5aXJzME4vdkVV?=
 =?utf-8?Q?7mU7+s1vmiy/dY6J3pPdNZao4GR4I67VcS6tN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2422557-964f-415f-8b19-08deb187451f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 07:06:07.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AP9Lstw6SA6bi5++KkKTqCqsn+ihCuTmZj5vllqzERFaW37jLGkVO3FYrfRYT7BAQpSVrfCPvF4RaKeG3zQZKYMqzyrlV5Ek0eqmEdPDphDgjWgpuP8To7PpswUB8oQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PIT dts support for S32G SoC based boards

Khristine Andreea Barbulescu (2):
  arm64: dts: s32g: add PIT support for s32g2 and s32g3
  dt-bindings: timer: pit: add PIT node example for s32g2/3 platforms

 .../bindings/timer/fsl,vf610-pit.yaml         |  8 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 20 ++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 20 ++++++++++++++++++-
 3 files changed, 46 insertions(+), 2 deletions(-)

-- 
2.34.1

