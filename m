Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1A3FCB23
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457772; cv=fail; b=cN8hCjsdq/0Dt6mHJoC8NJXUZGpwZ4D8M1xU3HV6TN6sySMbHyLESkQvbN2rFPJKcbX81y4+QwaCpaG7fEkdC96jg/Jwrm4jpMeqV991LA7jA6QmyK7LEI9riWYXqFg1bIyrmOVp0DYHULKF3+7mtgqURAF9BMTQ1/E7+25CaX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457772; c=relaxed/simple;
	bh=q5kw+BZiaIRhQ3MaNe7Lv6nOUsHcX2aSyNsGiPCV430=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sP4qGiRlT7B+0s5UbPLbinhH/kg+4/u415I0PZiK+z5X4ewKKC4soLSEWMJhIzBw2rWGHcJn9IdH5qFQx+LgEfjwDAhW2OAuYjOfF87iv70ZYpHyXc4S42x20PJv5I1c1IHIm/DFQUaQoFAOb1Nqtubb7bMwoj06PBvwJ9QumFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=COXjM4OW; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="COXjM4OW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlpWvW8nHQMbShZolf/7piMFD1pS8rNGxf2io1YqkymAtMMutbihZ295lXm0Bd/o0/Yh8LEASa3KIPEM05eEFbbKrsvdyzE2KgSPy5hrOk7/pP3ItQ2jq8Vtlouswu3XC69hz59i0IEhXLEu66Vv+3g1Xcwys8vZ6T8bw41FPdVVAku3TMuHY9KzxmuRnmN15DkrRq/f6VZ8sPGr6TGDZ7scgS1l+zWYR0IhbFCbMvpDGQ8CZ5cqxmmFV1HliizH1nka4aLIy2SSlEMyn7c/pO8VdJkVMOq5XPLyqOPNJFWfxmezcLaGgASFhGPJVfbU8vj8lHcUdXZcoJFLtXF8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm7U5CbZjN9rzV1Mut4CAdmwBye793+CVzMozkQETkw=;
 b=allma1DyWEcLv41wapefAYR+kmbBavQfILOg5EuLpKh5TxUNUzGVZRx3igsiwjbTqbRqwbOlkKtnVh/Gsj11m9WyMu79D/at6aJ/cabg6l9UU1KKCVqR+LwA9wNpGI/S9qSNTAGqtJItho15lB3l71fSAowbY8TCpzj/91bdxYBW2fh+ylbFpizp+WWZjj3C33VYO3kzfk11FeCXRJgBPvHlD/Ydlml1JS4hxxIR52aRe0b4MPrYyKxhXOXh19Q9uzhFju3SC4amYrmm5KBFzIW3p4vcjl/rMMNAS5H7VvQ0gnskw9s/TwDON9HXL0tVCOjrzThPpc/FWPglaZQQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm7U5CbZjN9rzV1Mut4CAdmwBye793+CVzMozkQETkw=;
 b=COXjM4OW2c5upKNCauGxkCuNa9cczJPuXrrMcVhAiMveZCVPn8tHvwNzcsD3I9d+dA5t2V4IgwW7Itu85khywCQoxKvBpeRHDmiWq037Ha5mKVYPHUjmpCNRbDZ2mYoXRXxzB+1yWpEJ/6eB2gAikzW+ddN6gWATjYdshqSLyFiwhqJLCTgQoiiHw+Qi8OFk1E928zd1+d4P8KDEX0bioi+KpRR8K/PbzZCRFazs+rd84tJ2IAYZ7zeBG61+AytsOFt0qjEmFKhAZiWLUN71u1eacml9Vu2BkPcEyKGseGqQ0DMP5Uhl4wswwQQTewwEQcyo72epvmv3/MEQMeza+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS5PR04MB11417.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:56:05 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:56:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: imx943: various update
Date: Wed, 25 Mar 2026 12:55:44 -0400
Message-ID: <177445748186.3158404.3142643293426637405.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::34) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS5PR04MB11417:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a56ccaf-2672-44f2-7d86-08de8a8f66cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q/oFCbMGvUJToRRrjGp5VNu/9IZgp7Tf6CFopX4n566XVwx9VBVzRGEUNxkZo1X7PGIIzslCaYAZBKQyvFVGfIVBI+oGQi4Aa+AnyS4x30k7s/OA4ABGATKFHJIO6dxvykHGf8Pn2/jUrp5PA25Q72Fl4lK1X8k75ibzXwQrhqQvKcCucin8mUTC6DGeUHkG1l8+e4WbaER/xFggEFjhdwUpTvJRHYA5TlTbondxoaREZ50IGM5ZePeZo+YVkbCZF/y6o/iEWmfmoYmHxZQbNhY9FOaonOZy+MttOlsOqgMkotYmuH71bp7Sec+ed5WI6Df2/ioMR2WEG0CXxM23EZr7OMJSRcNM9yXlmR3oZJSw5sWs7qgjQYVj9dYHZAb5omo6amlCvBkWNCwCObs3m6XZ8SHuLn1cfu1IptrabXFbnw4JpCQC4VigLkUcyZrMQ2m8ldxTMYZ+ufKSr54VxNrQEuRHuztsDzVVYuqyAK5epzHI4LIqGcyru5tN16s1ALSYzChUR4nARmBgFw5iN7wKBCoV6WlNTfPjER6mlpd2GDiogBDVNCH7f5EpbksnforrJWonz9V2ibnRDf3KSV0Yq4jt00lCMFY6XRMfOvFmZEWoJ4LAedHY2nX7nGEatn+qUFui1Z4KTfMVd1ystRDAFaukU75ZQrI2YGLce8CGVq2prgcK4ehKaBZ/FhbmBbtT4kOcLznJ6CWEgbygRJ53tLPGfDipJj3AeVtweNVOpsbiPHs3KjyKcDQkBSQinIESll+8W35gweCQIFKAJk3N50CJWGNVbxeG4Zzc5OM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGswSHlZSlozREd3cU1IRXZRU3Z4NWhXcWNrcjEzYnRvelFpK1hDVndrZmFS?=
 =?utf-8?B?a1RXMThEV0NmZXdzaVhOV3VnZEpOOXNYMERzbU91dXFtVlFkUnMrT1kxV1NL?=
 =?utf-8?B?QVRMOWI5NTIvckd2eXZVbEhRVmhaMmovRnF4ZVBES0tmTStIYUdWNVA2NCsy?=
 =?utf-8?B?cVFHb1NoKzJEbzJiZCtZYnV4ZU50TTlMYlNObUVxbVF2T3ZxUlEzRXdndUxv?=
 =?utf-8?B?SDBxUjVjT3dSRkRlNFpnYkpxWXN5Z1lsdGRjR2ZoaXR3Y1Z2NmtibWlwcW9T?=
 =?utf-8?B?aWRXQ092eDJxREY4NStFQlMyYzkyZStseXNvOFlFL1BNc3BxWHViSFpqcFNp?=
 =?utf-8?B?V3ExWG13RjZ2NlV1b1l5bDVMNklSVmI1a0R6SUV2c1NMV0MrYm05TkQ4azJh?=
 =?utf-8?B?M2VCZ3B6bVAvbXljVDRRRituM21TaXRRSHhZb1BNOGJqWHBxWlpGOUNSU0tC?=
 =?utf-8?B?N2h2K1RQMVlHYmJzYzdEdXFHQklJZkhEM1NSREJ2Qmo5Rkk2b3orczVzdjg5?=
 =?utf-8?B?OVpHNEduUE5CSUcyeG5leXRzMXNMQUlXU3hYdEd3cHk5OFJHQ241ektPcWJ1?=
 =?utf-8?B?OHFWZ0hKWEJKQ202WXVWbDhKcHhkWGZlVDU4OEswN0Jlb2NmdnpYcksvUHZ6?=
 =?utf-8?B?Qjc3MHRlYWtMakFRN0tTejVrcnY2azZyWDQ4c09ucHNyRE5lKzh4Y3VQcE1s?=
 =?utf-8?B?ZGxoZlhoRlJMVnFjSnVEa3JJNEhaYXZoUXdzUGRRSHorN1FmYmZ4K1Q4NmVI?=
 =?utf-8?B?NFVCU0NoaW1YUk4wUmZvRmpLL0MrdXRaQWFVdWFzOUlGUzg4V3V6YlE0UHZi?=
 =?utf-8?B?M3lFWFhRVGhxOW5NUXdnYVplYWlRYU5KL3hxVWJEeXV5QktsdGF6ZUJLNGov?=
 =?utf-8?B?KzBzNFJLQmZ0WmtkeVVjek10L1A0STJmZmtQNlhCRnU0YjNqa0EzVXFrUnZM?=
 =?utf-8?B?Yzk5Sk9LRVNpLytlVjdVR2ZpaWxBdEJSbnkxYTVpWG4wYWIwQ05LK0cvYlJl?=
 =?utf-8?B?ZExiSkVTK0tZRSswRUN1WWVnYkI3cDRIVkdRZGRvdFROUWhxZTJlQnozMnIr?=
 =?utf-8?B?Z1g5ZHBQREdvQnc0emhBaVRqOVRFeVM0V01YS1RqbzU0NnlyYmkzK3FJMUVK?=
 =?utf-8?B?VzEvSEx0OXk4OWZsbUNYWm91dWtTOGtsRHVIZUdnWVNhVlc4TVh2SHJaRFQ5?=
 =?utf-8?B?TUdHL3gzc2cxK04wb3lMS0FmWVAyTHRMR2pYYUg1N3ZBN2w4T1FXM2RWU2My?=
 =?utf-8?B?RXZUR1NDV2VsVlB0WjZQY0VKM0JrUmsrdnJ1TFcrNEJwN1hUb1hJeTRsc2tN?=
 =?utf-8?B?V1p6QWRNVkNvZ2ZWZ2JLUHVzWVN6c2o0dHI2UU5OVUNKcjQyMVVtemNkNjRG?=
 =?utf-8?B?dHBlKzR1eGQ4Zzhjd1JSY2ZCZmlyWm9WS0IxcGxVOUVQclVoK2M0L3VsWTd3?=
 =?utf-8?B?TFRVbVhXUUw3ZkRyUWZWQy9HSnBvZHNubk81N013ZFZnaVM3ZnpKRmxYYm9h?=
 =?utf-8?B?TXRuQzJiTktCcjdHc1R6OHdlVm1GT1RNeksvZXRNZlhMbHFLZXQ1ZXhRWk5D?=
 =?utf-8?B?M2lreGlwQWtMRXFERCtPRmNUQXZWdVNnRzIxZkFyRG50eXBXZ0JyQm5Nc3l2?=
 =?utf-8?B?SWlYbmltM21QL2p5cVFQNTBDRGxvS3VUL0wyMXJkTWpRdnVwYzFjTGtBbThk?=
 =?utf-8?B?Rmh3NHc1em9Dci9TZ1JPTVlEOWNlcGQ1V3FOK0U1M1FoUUlBL2ZTQ2hhL25a?=
 =?utf-8?B?RnZnb1ZQSTBhcDlNbnVYc0lTanV3TzBPRjJRYkIwd1dkL2k5Sk50cjJJK0xv?=
 =?utf-8?B?N2RtaG04Q1c4aGw0anhVeUFyT1F4ZHpab0pCaTNnazZuTVFvQmswdFc0VUJC?=
 =?utf-8?B?d3RWbzZuaTNINkV3UDV0NVczM1l3V3NhZWk0ZThYQ3RVV1VZSkp2cU1uSVZL?=
 =?utf-8?B?QmhSVEVYSUhOKzJEWUc5SjE0Z3BhSytNeWk5QnJPUmZxVFdkUU9HcVNRdmdl?=
 =?utf-8?B?WTJyclUrSWxGSzF1QllrbHJwSWNRbC9lUWRlTS9oT1d0dEIxTXhieTJYbU90?=
 =?utf-8?B?MkJ4MVY0dXJGVlJKVUFTVTUxSzI5QlhJR0lxN0tMN2VCeFJ5TlhqbTJJRU10?=
 =?utf-8?B?UjBQbDFUcCtEbnJFNndFVEhGYm1sVlJUT0ltUW1QMm5ndnhkclRtMGxScDBq?=
 =?utf-8?B?MFdjSFFKRis4N04vNnJvSEd1Q240U2c3QmlzeWdHd3NkRXBmeTJUOVZ3aERS?=
 =?utf-8?B?VFNjVmJvNGVvTGkzYVRlL3RPUkdzYk0zaUxxQVNaakl3cnNPTWZEczJqZ0Y3?=
 =?utf-8?Q?HgbS+kiCemn1eG1Wma?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a56ccaf-2672-44f2-7d86-08de8a8f66cf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:56:04.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhYK99ErKXW9b+KWxn/zxLRsKuTH2TvDn1vJiRRuyCO0hj7AmBggvIU+pHnatPxCRUBxH6Hbe2hi9X6KWDt3Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11417


On Tue, 24 Mar 2026 13:44:06 +0800, Peng Fan (OSS) wrote:
> Update pin header
> Add V2X/ELE mailbox nodes, more SCMI nodes, thermal nodes, fan node
> Add nxp,ctrl-ids.
>
>

Applied, thanks!

[1/7] arm64: dts: imx94: Update pin headers
      commit: 91faaca1db2ff31dd9a964c419ea39dcb396022f
[2/7] arm64: dts: imx94: Add V2X/ELE mailbox nodes
      commit: 87ac991725ccc441af0fc16d54f9cee7e05bd4a2
[3/7] arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      commit: dee18abd657f2cf5c1540eafadfdeb9444f4721d
[4/7] arm64: dts: imx943: Add thermal support
      commit: 81b428c2a761d9f40fb95eb0c556544541988263
[5/7] arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      commit: a2cdee4ce35863e0e6d4f58808f8e051b9608073
[6/7] arm64: dts: imx943-evk: Add fan node and enable active cooling on A55
      commit: 12cac5ae8bc741de9b03a2c23d128bfaf0c4c4ce

Adjust pwm@2f after codec@1a keep order by address

[7/7] arm64: dts: imx943-evk: Add pf09/53 thermal zone
      commit: bd25e888974ffa2e6097b2ee352c8f6f860f5e87

Add extra empty line between children node trips and properties.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
