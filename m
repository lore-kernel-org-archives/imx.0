Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217158;
	b=PLikP4LVrJx0dj5Y+MW2b3MkHrFvlxLro+Gzble9OGHwFIL5rhFYvQbIbgr5K8H1Netq
	 xXQoMD0WLljQp5gqTHQ2zwZCvUrMbhrymgnJ6BlnsgNICUUHZ6H7nBN2V/pQ4BkQmUpbC
	 tLOse1GeugHD4wmPi78W2DLJ8CMV8Gwyll4huGZBCmPYzzMc+1RC2iSWR6ZlGmJY4oe+D
	 CPWEnNObUmo4RUTpWh6J2hwntK6T9JmYVjGe3tOo4s4M+Ot2hWoecMluOslg2nV3F+wy0
	 pWW4HQopy2C1j+Z0jJoEwSpFftU243InY2Yl9j5BoaYVVSq37ZrBTFu5W8uLDcFMWcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217158;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=h+ODeBP3nXCQr8BltSuj4hAHgEV7tbn+UyYYtBN/spA=;
	b=r9AfsAwmZZGmMArF+7aOsVO8wj9IqVuMU2JtM73lHjMXgfpgTzAG0p5o/D0ruKxS2yhu
	 fY1vAa+DbaTzAHkiu2b7TEe8z1hU6Wvdfn+nh0bmOii6KV2HsnyXkFoEmKrLhf5M6qE2Z
	 PKGwXs7vIfLVwUFjNdSxqhkNrg8Jvi57lDv2zBfINiR2LMXNxAOpnm+JyB9Znf2lJM0Bi
	 wI2plO3GQjjxPt2scm8CiXiWvf6cIgoWt+FuDavoTmWVFyqE88rXECv6RNDv72Kuot1fV
	 GBIQhwbzUV1wlXYArN6NHZ/OYgqejMHG41VtyqfLs/PFVburpn2uTdT2TDBJfgSskCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LwIcfEMJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.36
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E30606A321
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 09:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LwIcfEMJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6OWHrfJqnQg6szl7qoVZ797i1XwtuPRncTn6gc88wwlSwoLPiQIF9J3FHRnRc8p6D5GlYIpVT2X9wre2cpRdH5zlw88HTxrw+22UJ/lKy6cmnUeKTrLzzm6+GPvB1HgBoQFn7q/iDv0VZu/xFLNflMl/ZAW+Dmjd4xTdSAmz24SOFGNkrJ3s+HtjempqilQ3pcVsSzAPao6QdUU40GIO8mYb+vstnUkkeBVXlu7JQue0HfkgCs1ckRXYU6Pb3/iJ1RRnl6KyqoiO7ZKMlTdJ/uhAPeZIRjzrjildEcy2qDIh5LRQRhb17bA7jFUre4qfuJ/R3LL/vzMSIYw4DwehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+ODeBP3nXCQr8BltSuj4hAHgEV7tbn+UyYYtBN/spA=;
 b=imfiYNjRrS4KpmAkglcU8uYzC/zN6Wg2/S75mWokWaeep8iSfRH1fVgFXQWTQyGe8yOOCmibrIo1odsgcybnkPPnDNlK4fanb8/mMsH7MRkE62cc6WMjm/clCH9Y/CcqftbjKfWCbqfeiybkmV8bzGsg1wZRJ+qNLTW0uJvwKmr2ml9DHevCzkeCbUldG1LCxaqWLOjrcFItrZFdLV59KbtVWnhdGP0XU62cjsvjJPIkP3H737PmjLhv/L93bCUbMdXq/gmalL6t0IdcFr1t7vTG5cT9aHUKEOpo45RoRy50cXnuHuVrPJxZkOKmQT3ErDY23vt03n/VoWMHxj5Q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+ODeBP3nXCQr8BltSuj4hAHgEV7tbn+UyYYtBN/spA=;
 b=LwIcfEMJyTgwmYeZdxegH2NFvclyUC4RIPyvmpWdwKFWsJoLDLtvkGqYa+I2NL+4CfvN2qFA52mTZ+07ScZfxrRxS78QauhU7fw60eZo+e6Gc0Ey4Yv/m/RI2JpKEB57pUa+ZqHITeQHG/n9Dkvli4zmWF7benLzl/gKSY9p287gd9A1QQTIt84rAbfosEp6zWHVTHeqNuH+9YL5fo+MT4UcEUlWKfFg5eLv6T8TNrWz3Ug2jlQ/d+T3TRFqyrZu2crudgD/oQ2w2ipCLqcQXaiuSOD2wOaHJaEmfmVnk5mq2GU7xCtj/IAh1X9H6SN+CDUZRlqi4E0ZKP9IfLNQjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by FRWPR04MB11246.eurprd04.prod.outlook.com
 (2603:10a6:d10:171::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 09:39:15 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 09:39:15 +0000
Date: Mon, 9 Nov 2026 11:39:12 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Oliver Smith <osmith@sysmocom.de>
Cc: Vincent Jardin <vjardin@free.fr>, Fabio Estevam <festevam@gmail.com>, 
	imx@lists.linux.dev
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Message-ID: <ia74kefmqtcuvk6zvtbtxkxeqtfonm6alfqngincebps7l4vcy@b3ljfyzoedxj>
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
 <auX-VA8xlqSwLYGj@L30177.local>
 <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
 <ab9967d8-0d44-4457-9cba-6d2913e17977@sysmocom.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab9967d8-0d44-4457-9cba-6d2913e17977@sysmocom.de>
X-ClientProxiedBy: AS9PR06CA0603.eurprd06.prod.outlook.com
 (2603:10a6:20b:46e::12) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: f448e48c-a2bd-4acc-7c6a-08df3e455199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007|41080700001;
X-Microsoft-Antispam-Message-Info:
	IJxaZwdeJLUhVORugaUkn0UP8PmB6EXtiDzMNwAbCnRHd8jmMR/loAjhjtinO6uWgPmpfd4D9CefENW54xKzqqOfgYjY409TySZ+ze3u+x5XVtZmKnf4JIfdRnqZMqaqMG4GQWKP3ZI8gIiw1b9ClVWgcv+Ql2xxSEtKBuUCHivKrIoD+hKqDQN5Ojex+yOysvqFVeFHU8Mjo3p4cPEfzMhDa0UAUUEAHtRYmVD5Kqz5Qon62lL5TDnhJFlgQigwUSkXSs6tMjo9uSlnwTcVHKhhExHVGvVa8jX5/ZfW1ZywW2FQPT+4q9cAxeze8+0lgHnLAXH3y8YV20kdoQgivSwYXQPOKHr0NBqZeqds5b7WaF0UxQ23cVX7ACWvtD6cNhK+M6Xpp+boi7E8TtelxRhUw3JFt3zp8rSfLlCYLU8bnB8LCyqVnAmDgyEccnVthoDRRmJLtVURJ/8ExPDR85EdjKSvv+NDwLdNg2yEFdEoFhQpcfGkMHurit3I0qzZwoMm0zTwACH0OxexTGkqxJ4I5chrQrSfIeC/yPaakPiko5gS4Rvasd4pH422t0cqsuPhkHSKueTMBLlri3LVzMJexJz5vlQLv4QCRSeqptEyxj+LoHOkjjcvfxbrdbAfADaf7DsgUsleBKGitfltR+gSM/LbDBQ6eGAZ5QovSNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGJPRjFNUzBiUWhhZVRyNDVCQXZCZ0hjRElHS2ZYcWttYnlFYUpyemhwNzMw?=
 =?utf-8?B?TFAyOVN4M0NDVDMzdjBEOVQ1bldWK1Qxakp6MEVHb2hCYTdtZUFmNUdTSkU0?=
 =?utf-8?B?SmpYQmVuU3JPdGdKN0J0b0xLU2VRa2dXVG5selRRZ3FZMlFZdnIya3ljSkxj?=
 =?utf-8?B?K1lFS1J1aTlOUXZQMG9QZzRuSXdGcUNRWVhlR1BJRng3MmhGWWFKRFU2bzhZ?=
 =?utf-8?B?a0ZKY0pjRUxsZ29qT1I3dTFlamRWbVkzSzk5eXdoUG9nNGd0WjZaeUo0azJH?=
 =?utf-8?B?Z2EyREpTb0lGK2NNMWlJd1FIenpHWGo4OFdDUTBnSGQwSUl1NGY3Wi9NZEtj?=
 =?utf-8?B?SjNvSGpodzZ4TUJBV3RuSzVuTk5kdGZIY2YzUUdXM0paejJBL2svL1hJYjJB?=
 =?utf-8?B?RkpmU3pEUSthaDBxS1k5VlI0VlJXajluSGVwdG41b21pVnNjaEtMK1NtbDh3?=
 =?utf-8?B?VWE0Rlo2clFlWEp2Q1lNS3RvclMvc2JCbnBybzcvbUpNbEp6MlJTb1hYejdH?=
 =?utf-8?B?VDJnWUc1c0JLZ1VnY29pdUxxRmE3Yml6NUt6eXFWRzFOcDdsejF5OUM2Vk9o?=
 =?utf-8?B?TXNhZnNybWZ0dTU5b3IxZUVmb3hZVFdEQk85Y1VRcElURlI0VjZGaGd3eFJk?=
 =?utf-8?B?bUIwbFJ1cmhzUnNsTWphQXRUWXRjK0N1bHArYldZSHNYMEppTWR6cGJDcjJS?=
 =?utf-8?B?WmRucHp2TlQzSDMzb001M2hReE9TN0VlNDJRaTUyZlV5eDNSNlZONWh2SmJv?=
 =?utf-8?B?REJxTEpYNlBES1JmTFFSM3ZEbm9ZUGhXWlRjWmkrLzlUWXIzMXN4OTRqUHFP?=
 =?utf-8?B?RnZwVldQQ3BVQk05NWZUQXRGSHZsaDJvRTltdUhrbWhsVThRWGlkSFdqUFpK?=
 =?utf-8?B?TEJ2V0xBUkJVUXh3VFdsYVprYnowZitIeDdUY1l3cXJVVE9VU3Q5RHYxdmY3?=
 =?utf-8?B?YkxTblYyUjN4aDFXN1I0Mys3WmU3MUV5RnVRbkJiZyt6cGdKVTBIVkJxMDgw?=
 =?utf-8?B?WkpUejQ4N0VMVkdWYjdQNHBkaG1MN0pTcFRYSlhKdURyM3ltNWFvaURtV3F2?=
 =?utf-8?B?aGJDZGpXMVgvZVE5djRVckRSSHd5eElxazdjS1BWWWsrZldURXBTNmVSL0R3?=
 =?utf-8?B?UkMrNi9qZnlVUVRKQjk2NmFzOEJnUTJWcmZ5UzdZdGxCMUZpNEgzV1FXVWZ1?=
 =?utf-8?B?Qy82LzFNaVdaRUxiMlF2V1JFYXFnMDVDVWhPZ1dsc2E4SjgxdmFHaVZQV0hh?=
 =?utf-8?B?bk1FYmNXUUQ3L3ZqZ2dPT0U0NEZoazFvUXpxTFRuaGI3OThnSnBybUNabElK?=
 =?utf-8?B?N3lOTWhmNEt2bUFXMVhtbzNBZUNjRm01L3BpL0svTHNOMkdsb2N6S2pvMmM3?=
 =?utf-8?B?VGJvMGxMdHJrRW8wc0pPZ0pEV2NLd1hSNGJEWW43Nkt2cDlxNW4xd2k2UlV5?=
 =?utf-8?B?dnZWWnpmWm9aRm1OTVZ4M2JPK0x3UlpDeUpUaE5WaFdkZm9jNWVvWHVqeGtr?=
 =?utf-8?B?a1d2NlRSWjVKMVJzcTllS3hIUE0zRkdhVnI1ZDVkYm5UOWRGd3A1dis4M0o4?=
 =?utf-8?B?WEp2ME5HZFIrenFwZHRQR1JRRG9Cc2Q1WW41Wm44bW5hMWlpR2lYaTcrSFky?=
 =?utf-8?B?aXBqUDRrb3pnWkdKU0RzczdVeHk1N0NsWHRWeHlGakxKK1NyTGJjUjU5V2lT?=
 =?utf-8?B?czJjWTBWNGlMZU4vb2pZMm50dHJQSlA3eXJaOExrM1p0SG5KUDFBUHIzbWZr?=
 =?utf-8?B?aFBYOGlxQWl4ZStwVVdvQ3UxMnhRZGxxbmdmYmJybEdnZkM2SGlscXpMbU1R?=
 =?utf-8?B?YlhWa1l3NGtzTW5xY2ljU3FqVGFSWXRVWTFOSFVUSkZEalViTjFITHo0SDF2?=
 =?utf-8?B?MmJRYjFRT0I0MEc5RkY2aTdBZk9qTlRCdFlPc2M4R0pMMyttQzJWSm1vTXNn?=
 =?utf-8?B?aERmd3ZoYjdIT0Q3YVBOK2p1aFhrTGszSUlzbERvMzZnaFI0QU5hVmdhcVBi?=
 =?utf-8?B?M2ZDWW4yN1VRSWM4RncvdG8vUzhCckNLL0JKSTNhekMvM2NLV1JCZDJBT2t5?=
 =?utf-8?B?eHMrclJhem5KYmI2K0lWaFpteFoxa2svblBZS08vMFJ3NE9ZRTcwMC8vNlA4?=
 =?utf-8?B?czNuMEZ1ajZITGtPZ1U1UEJlNkhUNmRhdm9Ld3d2ajVlV2VWZUZncWQveDdh?=
 =?utf-8?B?U1lQY0Vzd0R2b0F5dkgwTjZtT1gwQ0lGNFBmMVhHQVpjWVZrWEQ5ZU9VbU5S?=
 =?utf-8?B?VkhETkgvYWxSbWtZMGplSmIwVmV6a2FtS2JPajA0UnJtUUxJWVlPM256QzlK?=
 =?utf-8?B?a2JvQ2xxeGVleldWakdrSWh0blh5ek5MclNGTGxjcFpIZnhVN1EzUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f448e48c-a2bd-4acc-7c6a-08df3e455199
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:39:15.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFVXXhElE29EwYlqI8bhiB3MXj8WPlRON9FkNI2tXV1DA4xu2v7E35EObYkvFXy3RNWbZOSQtFU1Wy5iQsf39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

On Fri, Nov 06, 2026 at 04:40:46PM +0100, Oliver Smith wrote:
> Hi Iona,
> Hi Vincent,
> 
> On 11/2/26 15:20, Ioana Ciornei wrote:
> > On Sat, Oct 31, 2026 at 03:42:28PM +0100, Vincent Jardin wrote:
>  > […]
> > > It seems to be related to the backport of:
> > >    https://lore.kernel.org/all/20260401144508.3062019-1-ioana.ciornei@nxp.com/
>  > […]> The 0x3F value means "MC layout process error".
> > 
> > Please look into the MC firmware's log. It should help in determining
> > what exactly is not ok in the DPL file processing.
> > 
> > 	$ cat /dev/dpaa2_mc_console
> 
> With both the old and the new kernel I get the exact same log:
> > root@lx2-1:~# cat /dev/dpaa2_mc_console
> > [W, PLATFORM]  UART print failed, all debug data will be printed to buffer.
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0001
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0002
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0003
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0004
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0005
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0006
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0007
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0008
> > [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpmac_probe_cb:766, DPMAC]  Can't create DPMAC 0002
> > [E, subnode_process:155]  Probing module 'dpmac' return error code -19. Continue dpl processing...
> > [E, open_device:2371, DPMAC]  no device
> > [E, dpmac_probe_cb:766, DPMAC]  Can't create DPMAC 0012
> > [E, subnode_process:155]  Probing module 'dpmac' return error code -19. Continue dpl processing...
> > [E, dpl_process:527]  Error while parsing 'connections'. Skip processing the rest of DPL.


The above two "Can't create DPMAC" errors suggest that the DPL (Data
Path Layout) file described some MACs which are not available on your
board, meaning that the RCW (Reset Configuration Word) used does not
instantiate those MACs.

> > [E, main:186]  DPL processing failed; continuing...
> > Running MC app, waiting for events ...
> 
> I'm not familiar with the MC firmware, but all this explains what
> happens, there's the firmware error and then because of the mentioned
> patch, fsl_mc_bus_probe() aborts early and then I get no ethernet
> device.
> 
> As mentioned earlier, dmesg also has:
> > > [    0.107175] fsl_mc_bus 80c000000.fsl-mc: fsl-mc: MC boot completed with error 0x3f
> > > [    0.114747] fsl_mc_bus 80c000000.fsl-mc: probe with driver fsl_mc_bus failed with error -22
> 
> Could you give me a pointer for getting rid of the firmware errors?

I need to have a look at the DPL file used on your board. Have you built
it using Solidrun's lx2160a_build project (https://github.com/SolidRun/lx2160a_build)?
Can you get me a link to the source file?

Otherwise you can dump it from u-boot by using fdt print before the
fsl_mc lazyapply command:

	=> fdt addr <addr> && fdt print && fsl_mc lazyapply dpl <addr>;

It would also help to know the RCW and the SerDes protocol combination
that you are using. You can find those in the u-boot log. I pasted an
example below:

	Reset Configuration Word (RCW):
	       00000000: 50838338 24500050 00000000 00000000
	       00000010: 00000000 0e010000 00000000 00000000
	       00000020: 0fc001a0 00002580 00000000 08000086
	       00000030: 09240000 00000001 00000000 00000000
	       00000040: 00000000 00000000 00000000 00000000
	       00000050: 00000000 00000000 00000000 00000000
	       00000060: 00000000 00000000 00027000 00000000
	       00000070: 08a70000 00150020
	Model: SolidRun LX2160ACEX7 COM express type 7 based board
	Board: LX2160ACE Rev2.0-CEX7, SD
	SERDES1 Reference: Clock1 = 161.13MHz Clock2 = 100MHz
	SERDES2 Reference: Clock1 = 100MHz Clock2 = 100MHz
	SERDES3 Reference: Clock1 = 100MHz Clock2 = 100Hz
	DRAM:  15.9 GiB
	DDR    15.9 GiB (DDR4, 64-bit, CL=22, ECC off)
	       DDR Controller Interleaving Mode: 256B
	WDT:   Started with servicing (30s timeout)
	Using SERDES1 Protocol: 7 (0x7)
	Using SERDES2 Protocol: 5 (0x5)
	Using SERDES3 Protocol: 2 (0x2)

> (And I do wonder how many other people may run into the same problem,
> maybe it would be better to just print a warning instead of aborting
> there...?)

On the other hand, before the patch your system was basically limping
and its state wasn't really consistent with the configuration files
passed to the firmware.

Ioana
