Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288573537CD
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938961; cv=fail; b=Uq+xG9FX6iEoI8SHSghq5UXDUijpHPRgxjlPmSfSsKpSyuXXCeLUkm0NlsMJOMmy7P7UqVmc/ZHGKV7K4JSWta2rBAqlntWIRTUC+C6jg/biP9Ah6I7nFLATGretzE42TquGTfWPeXivwwmFyFqC9Bm/E09Za7zkQtjkdYHOjvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938961; c=relaxed/simple;
	bh=y49xympJagt3z8jmwf9LGqLToqygrfC/hMvHChtOB3U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oEu2bHEkihF+5rTIFffjjAfBtJbyM5wrz/R3f1h+gDP/GEeFObR5MN/q/6wFFUi4TvI4eLS68N0nTxJg2s+51Nb1qGaMnc0l4+3NkRqzRh6i9PzSnXLgFWRNDG2MNMqiXLfo6F6uUmKOTuPtUb4BUkXSGXnAnhbn/aBNmvr2YcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uTVdzBsM; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uTVdzBsM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlHg6q81Lojr3PU2gZbYIlXTg9src8ADICzDo55g7yXNA5P8Hi3Bu5w1vSVk9SUKVO6+FxDRQd3xygUw26T0aZp+78MFpl8Ft1S38LgWnC4eJMenysJu8SnuTlJ9Q6QqOw864sI3YBysooRgDEDcuM49k9AiiHedKB+YhqTPlIjG/EVZbxEeR82XImQSEmEpi9+EdGuRGDrG/dYhIG9d81+G1hhFS9aDUReaX27jcw7BT2vI4daOPcy9h+sD/7OPZ6q/8BDKJM1rgzq4qRijfZ5PZStSJSxKOllIKsOAam/z0vwxJwnyUL56nsuGhmEIHaFo2GeUAAWGwIQFg4PurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkbnJxi2cMgPoXqW7Gmnrb4IwOyUL89QVECcegLZEI4=;
 b=lO0IV+6C+pVXNbu7AHSRmdPJKRQaJxJd97S03VncBuUp5DJZ+9FyJ0pdnhhELG60mABW5nkSB9lNQvxejlwDJtbsQ/JHAdgSFiNydwzcatEn6nVRo8pnAZSNAziXtnNNwEsaUVgaxKeYYvaAm1Rd0/Fe3869iUPApmir7zbO7/SVgr5Okahwtw7/x7GpiLGtzDDYVXLbb6/UqwFkT+vgS1HwS7R0r9M8NLR1kU1pbJ2t52qT+qMVOxCaSmC80lriHiq58fA56JWzPuaUIYoSoOVNxmBLf4M7aezkFwQTgehZg1CqDhXu3FqJTLVMKXxp/AKcwStU1rYjKMaRgnsGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkbnJxi2cMgPoXqW7Gmnrb4IwOyUL89QVECcegLZEI4=;
 b=uTVdzBsM4VNNI175JzFjgT66mGBxeZZdTqwruFGaVo39RnB56q+fax79CDrDv+p5QP3HLZrdzaBjDIXcwfGrvlbRa5R8Qspnwcub6FbUsAqarsKtVpRlSKWFdx1jyxUDQ24bGRUWyWJJWrq7yQkTGMh5P+u4ZeubG4A+xiqzFsqCx3PMz1h5wrt1esnVqp3K8Nga3wHmh+xFZkAdBaNWcV2kijq9CJ9C9bVKZdfRsKwbkNu42gul4uCfkeqv4JwUkJzY28CEfA87jzctqDVSR9za3bY/f6zceBxaXaX6DUNOANnrqs8mZUQG0eEW8pO+gliUOubF/UNLmZ0jwlvODw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8246.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 14:09:05 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 14:09:05 +0000
From: pankaj.gupta@oss.nxp.com
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v34 5/7] firmware: imx: adds miscdev
Date: Wed,  5 Aug 2026 20:29:44 +0530
Message-ID: <20260805-imx-se-if-v34-5-26f1b06507cc@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb756f6-ddcd-4f11-6d14-08def2fb1a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|19092799006|7136999003|6133799003|3023799007|18002099003|11062099010|5023799004|11063799006|56012099006|10067099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	xEr7SVj/OFtVTmO4bLmYnTzb1oTCqZAxGLKGru6QTKf0yxv9Z0W9XMDp7JnbGiMzlpZCuhaD41aa9TidHZgDRjHwHTOsX95oagoYag4CZ9i7kZGqLMb9CPZIGEFhFqiCmn9G8Z0lPLAWxm8Gv88tV/ri4ojbQsT2Po7IIKWtii27vij/XfgAfHUoaLQ2NtLLtnTiRynTxMRjF3jZREAZhHLn0neq92Kla0IabubUkORz+qz1zYk8hP0xxeMNZ6GChqnjOwXe1ziERkj2FjXy/IWxjTsxS/uMp/pPOQ+/6d1AOQyEBPk1qriuyoj/zQa1grU5mot147A5xyCru94RG+IfNDGz6RxRJjnWGLKjhAZUs85d0mYpkyvrxuPqN1pOMJchIrP/LX6damsVfKeR5mHHO3LiA8tCX8vrnyfKQN+XnJvn0deMAhY6gA6HYWPriSQpoiEwwXHKYMNo/bgPZuRK5D01jIQwIza0jQ8zEao2ubIR0K3i3lmGEMqZnhYl5E+QVqIOIDOCWXDZ0cHmEIb+lwn62kFS8Kb27ZM2JgfGTt7Zh7P5IVnsS3+g4y0zn3XtKfXpga7DIunOhlVSmjoZOnGAcAf3RCm2eWuOvSO1W5/LYMZCHTOX826/gd7akK7Mz/mp66roJYGABKXSWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(19092799006)(7136999003)(6133799003)(3023799007)(18002099003)(11062099010)(5023799004)(11063799006)(56012099006)(10067099003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1Q5OElXZE9uY2NJWXlzUFF1S1A1blZtZjFUOXgwRytIZWcxYTlna3orVG5J?=
 =?utf-8?B?RnZqMEhSbDQ1SXk1UmgrTDAzazhtMHY3NENDbWpoODJ4dUNHTmxtZEp4NGkr?=
 =?utf-8?B?aUN0RkhjVnJ6bU1pWTg4SEtWWmMvRzNuUzFlY3R3c1V3dzhPQXZDU1pUaGli?=
 =?utf-8?B?UU9sb1J0ZGJoN2pKNnNxNUNMYklQUEpwZHNsbytXZmRFZGZMazBlQ1lDek8z?=
 =?utf-8?B?M0prVDJ5TXJFNXR6QzlJeXF4QUVrRkYvWDVFSGNqYkxxSDR5ZXFzeTUxTVMy?=
 =?utf-8?B?d3dKa3Vjbi9hd1NKdXpFelREVURyQmlDZC8vWXhDdFpPOTdYRC9PSlRHNldJ?=
 =?utf-8?B?bDNjTGozaWpYTnZ2V1ZVa21FNTdaRDdoVXNpeEx1Vk01cWt4Mkc5ZGh4QmFM?=
 =?utf-8?B?UWJTNCtEbmE3UEN0VmR5dW5LSit3bkhVUEFwQTl5UHVCSmZaSGFWQVFLNFdx?=
 =?utf-8?B?c1hob0FkQUYrVUZTeFN2WWJKeUVyQXMvdVQybUVJcHJqY2VGdXBUU3UrRVJv?=
 =?utf-8?B?Y0dmWUtsOVFPNG8wbjI0T2hEa3QzanpKY29WdG9nSFpNTEw5WGhmQzlKY1RK?=
 =?utf-8?B?SXptdXFTaFBhNnBwNHdjZjdjR0FBTGFNd2M0ZUtLZDBqOW9FVHRhRTRLM0dj?=
 =?utf-8?B?K3hCQWo2Zzh5dlpnWGh3U0NweEliMGI0TzM1aW51VS9LdEZUczVsZnZXREdm?=
 =?utf-8?B?RDJDaEZicFd5SXdyU3Jld0dMTksveHYrejZwanM2bFhKRmFCRGhueUtnazV3?=
 =?utf-8?B?a1FXSnRRSDRWQWpwclJQZFBUc09jV1ZSRTYrTEpmbE1MQVJjeWpNc084eVpr?=
 =?utf-8?B?Z0R0Q1o3VWpGN0pCRm5Eckg2RzBwYmxsU0hhUmJqZHNaT0RVVW8zdzZsL21X?=
 =?utf-8?B?cFZYTnNscW9HZFlXa040STQwZTVHQzlzWWdMZDNtOFBWV1Y2QytvYW84QnZK?=
 =?utf-8?B?L3Y1SGpLZW10d2huclVPV1ZHdVRnVHVmSWJPQnh1WmQ4K1NhYzJpR2RySjlo?=
 =?utf-8?B?RWdua1JFUUpsTWNLYTdhSjhDemQ4VXBhRCs2akQwSW1ZMDFVVVJkakhGM1c5?=
 =?utf-8?B?TGFyNW1WWjVPcWtsWDRQenBTekV5TDF3UE0zbm84dGt0aXhhYTR3Q2VBYWpZ?=
 =?utf-8?B?ZlBkaTNlbGdxbVRHQkduVlFjRHRjeG56OGt6SzBTRC9PTmxkMGxPdkM2YTdQ?=
 =?utf-8?B?aTNvQ2pZMDVlaGQ1RDJJaFgrTXJrMVd1Y2dERXprR3FoZ0QybXd3bmFiaGds?=
 =?utf-8?B?ZVJ0dlhMZHFpdy80NXozOEFXZnJJYUdaeDFNUnFUc3E5Q3JNV2I1T2h0dmNS?=
 =?utf-8?B?dVBoWkZjOE5Iemc0THJPYTNWKzEzTm1DS2JFL1h6WmJpdmszZUw5YkROdFlr?=
 =?utf-8?B?Skd2S1VZcnFjcEFvdjhiS0dycXlDK3o0aWJHVkJ3bTZzRllmVlpiNjVwakk5?=
 =?utf-8?B?ejM3eUhWT2puNktCRVFDY1JBSmNUaDhDM1ZCbWlGOS83bkZLdXZYTHhDTDla?=
 =?utf-8?B?bVJqczg3WWp6UUxEUmtSWDZiVm1VcDV6eXl4UEU3ZlFQSWFVRTJqdHBXU1RQ?=
 =?utf-8?B?QVQvODhEQUNMZURnMTA4d25qK3ZPRldDdVRLbEdpWXdQUUsvNFZCRVNCODVv?=
 =?utf-8?B?ZHZST1VMdEh1dENXTUVuWXRtV0ZtUkNOUG5naFlCSHM1MmZVQWwvTW9WOUN5?=
 =?utf-8?B?SzREbXZwbW5xUEIwUVVGVEhEaW1ZRi9ya05zaG16dnArbk8yMFdSVkxROGw0?=
 =?utf-8?B?NndUSjJmNG9qNkFJSENjWHJGUjBSTndiSmZpWmZuZGpVUml5Q1JQMGlPUlBt?=
 =?utf-8?B?dlcraWdXeXNld3pYTWFPNnJIV2NOekY2Uy92L3VaQ0tLMVd4NXMwQi9ibERD?=
 =?utf-8?B?TjlPNzVmUkZJZ295aGRGNlhJTktQOUI0eVV0Z1ZCTkVOZ0Q0ZVJYRTM3TXBM?=
 =?utf-8?B?dzFWbXlPa3NUWVkxVEpEUTZBRlFhR0hFQjJWeDVZbmNnVmNzQklnU0hJeWZy?=
 =?utf-8?B?bndFRDBNeWt5VVNwc2tSODBqSVY3MWVkTVN2YnFZdXoycjJrQzNwbStXSXVD?=
 =?utf-8?B?a2ZDOUFNeGhJNFZrZ1puU3dYYW1DRU10SThJNktRNm9QMUhVVnM1ek9FN1B1?=
 =?utf-8?B?djdIWHV3cDlCNVd6YlBvTFdzM3lXejhseGQvSlVHaTZ3MHFpeG9KY3BWai80?=
 =?utf-8?B?QWNQajlGZkgrY2I4Qk85MHFlQTgyK2dmWnErNm5BdXVaTmh2UXdGdzd5SUhv?=
 =?utf-8?B?amhxdGY3Uml6U01JejBrVnY2ZmRkUUhoeVJVS2JFdHpEajVkWVF5K1ZWazV1?=
 =?utf-8?B?UE10NUp4dEhvMFAwYTVOelR5bVZBdXBTdStaL2pyTnVibnVQSnFVVzhOck43?=
 =?utf-8?Q?074Ju8DIO7PEwxEt6Kwe2usUnI8X4R7X6ib0h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb756f6-ddcd-4f11-6d14-08def2fb1a30
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:09:05.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF3Tag93l61rgOTyiRCovbmhCcIpAEXYOj+5XVr+PK9qLOxowSrmIZTwjeAYX1iXwfmOuhOgIbMYzZLVsIkR8xybhcDFBsgih585nN7uzJgap7dH9I8/kInUuBNtt4XW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8246

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Following checks are performed on the incoming msg-header,
to block exchanging invalid arbitrary commands:
- maximum allowed words,
- check if command-tag & response-tag are valid
- version,
- command id validation check, to allow limited base-line API(s)
  and restrict following:
  - exchanging power management commands.
  - reset requests.
  - BBSM configuration requests.
  - re-initializing the FW.
  - RNG init
  - CAAM resource release management
  - SE's internal memory management.
from user-space.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v33 to v34:

Teardown vs. in-flight transaction (lost wakeup / unbind hang):
 - se_if_probe_cleanup() now sets priv->going_away under clbk_rx_lock
   instead of se_if_cmd_lock. se_if_cmd_lock is held across the whole
   blocking transaction, so acquiring it during unbind could stall for a
   full receive timeout. clbk_rx_lock is the short spinlock the sender
   holds while arming a transaction, so setting going_away under it and
   then calling complete_all() makes teardown and arming mutually
   exclusive and closes the lost-wakeup window.
 - complete_all() is issued before walking the device-context list so a
   waiter sleeping on the completion while holding dev_ctx->fops_lock is
   released before cleanup takes the same lock, avoiding an unbind hang.

ele_msg_send_rcv() arming:
 - going_away and fw_busy are now evaluated under clbk_rx_lock together
   with reinit_completion() and the buffer publish, so a new transaction
   is never armed concurrently with teardown.
 - going_away is checked before fw_busy so a caller racing unbind gets a
   permanent -ENODEV rather than a misleading retryable -EBUSY. fw_busy
   is only atomic_read() here, so no fw_busy_lock is taken and there is
   no deadlock. Teardown session/storage close commands issued on
   priv_dev_ctx are still let through so the kernel can resynchronise
   state with FW.

ele_msg_rcv() response classification:
 - Add se_clbk_handle::rx_delivered, set by se_if_rx_callback() under
   clbk_rx_lock only after a real response is copied. ele_msg_rcv() uses
   it to tell a genuine firmware response apart from a teardown-forced
   complete_all() that wakes the waiter with no data. Without this a
   teardown-time close response could be mistaken for the forced abort,
   failing the close and leaking its DMA buffer, and a forced wakeup
   could be mistaken for a response while the enclave still DMAs into the
   shared buffer. The forced-abort path returns -ENODEV and arms the
   circuit breaker so the buffer is quarantined, not freed.

Session/storage handle tracking (ele_uapi_allowed_fw_cmd()):
 - Reject a repeated ELE_SESSION_OPEN_REQ / ELE_STORAGE_OPEN_REQ with
   -EEXIST when a handle is already open, preventing a handle leak.
 - Reject ELE_SESSION_CLOSE_REQ / ELE_STORAGE_CLOSE_REQ with -ENXIO when
   no handle is open.

se_close_session() / se_close_storage():
 - Use __free(kfree) scope-based cleanup consistently and return directly
   instead of mixing it with goto-based cleanup.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260805-imx-se-if-v33-0-212e32ff0295@nxp.com?part=5

Reference:
- Link to v33: https://lore.kernel.org/r/20260805-imx-se-if-v33-0-212e32ff0295@nxp.com
---
 Documentation/ABI/testing/se-cdev   |   44 +
 drivers/firmware/imx/Makefile       |    2 +-
 drivers/firmware/imx/ele_base_msg.c |   84 +-
 drivers/firmware/imx/ele_base_msg.h |   19 +
 drivers/firmware/imx/ele_common.c   |  130 ++-
 drivers/firmware/imx/ele_common.h   |    5 +
 drivers/firmware/imx/ele_fw_api.c   |  186 ++++
 drivers/firmware/imx/ele_fw_api.h   |   29 +
 drivers/firmware/imx/se_ctrl.c      | 1601 ++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |   90 ++
 include/uapi/linux/se_ioctl.h       |   97 +++
 11 files changed, 2236 insertions(+), 51 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..c6b8e16bda78
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,44 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git,
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 4412b15846b1..3f41131a0fdc 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -4,5 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
-sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o ele_fw_api.o
 obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index b70e3ef88a16..2da8817af092 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,13 +15,57 @@
 
 #define FW_DBG_DUMP_FIXED_STR		"ELE"
 
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header)
+{
+	switch (header->command) {
+	case ELE_PING_REQ: return 0;
+	case ELE_DEBUG_DUMP_REQ: return 0;
+	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
+	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
+	case ELE_OEM_REL_CONTAINER_REQ: return 0;
+	case ELE_FW_LIFE_CYCLE_REQ: return 0;
+	case ELE_READ_FUSE_REQ: return 0;
+	case ELE_GET_FW_VERS_REQ: return 0;
+	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
+	case ELE_GET_EVENT_REQ: return 0;
+	case ELE_COMMIT_REQ: return 0;
+	case ELE_GEN_KEY_BLOB_REQ: return 0;
+	case ELE_GET_FW_STATUS_REQ: return 0;
+	case ELE_XIP_DECRYPT_REQ: return 0;
+	case ELE_WRITE_FUSE: return 0;
+	case ELE_GET_INFO_REQ: return 0;
+	case ELE_DEV_ATTEST_REQ: return 0;
+	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
+	case ELE_READ_SHADOW_FUSE_REQ: return 0;
+	default:
+		return -EACCES;
+	}
+}
+
 static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
 				 size_t size)
 {
-	if (priv->mem_pool)
-		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
-	else
-		dma_free_coherent(priv->dev, size, buf, d_addr);
+	/* For the case when priv->mem_pool != NULL:
+	 *
+	 *   If this probe-time transaction timed out, the firmware may
+	 *   still write into the SRAM buffer after this function returns.
+	 *   Do not release it back to the pool while the firmware-busy
+	 *   circuit breaker still marks this context as owning an
+	 *   outstanding transaction. The buffer is reclaimed with the
+	 *   device on unbind; leaking this fixed-size probe buffer is
+	 *   preferable to letting the firmware corrupt reused pool memory.
+	 *   This mirrors the guard already applied on the shared-memory
+	 *   cleanup path below.
+	 */
+
+	if (priv->mem_pool) {
+		if (se_is_fw_busy_ctx(priv->priv_dev_ctx))
+			return;
+		se_cleanup_mem_pool_buf(priv->priv_dev_ctx, true);
+	} else {
+		se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
+	}
 }
 
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
@@ -34,6 +78,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	if (!priv)
 		return -EINVAL;
 
+	guard(mutex)(&priv->priv_dev_ctx->fops_lock);
 	memset(s_info, 0x0, sizeof(*s_info));
 
 	struct se_api_msg *tx_msg __free(kfree) =
@@ -47,24 +92,23 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 		return -ENOMEM;
 
 	get_info_len = ELE_GET_INFO_BUFF_SZ;
-	if (priv->mem_pool)
-		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
-						   get_info_len,
-						   &get_info_addr);
-	else
-		get_info_data = dma_alloc_coherent(priv->dev,
-						   get_info_len,
-						   &get_info_addr,
-						   GFP_KERNEL);
-	if (!get_info_data) {
-		dev_err(priv->dev,
-			"%s: Failed to allocate get_info_addr.", __func__);
-		return -ENOMEM;
+	if (priv->mem_pool) {
+		ret = se_get_mem_pool_buf(priv->priv_dev_ctx, &get_info_data,
+					  &get_info_addr, get_info_len);
+		if (ret) {
+			dev_err(priv->dev, "Failed[0x%x] to alloc from gen_pool.\n", ret);
+			return -ENOMEM;
+		}
+	} else {
+		ret = get_shared_mem_slot(priv->priv_dev_ctx,
+					  &get_info_len, &get_info_addr,
+					  &get_info_data);
+		if (ret) {
+			dev_err(priv->dev, "Failed to allocate buffer.\n");
+			return -ENOMEM;
+		}
 	}
 
-	/* gen_pool_dma_alloc() does not zero the buffer. */
-	memset(get_info_data, 0, get_info_len);
-
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
 
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index d532c3f49449..475074580dd7 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -16,6 +16,23 @@
 
 #define ELE_NONE_VAL			0x0
 
+#define ELE_OEM_AUTH_CONTAINER_REQ	0x87
+#define ELE_OEM_VERIFY_IMAGE_REQ	0x88
+#define ELE_OEM_REL_CONTAINER_REQ	0x89
+#define ELE_FW_LIFE_CYCLE_REQ		0x95
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_GET_FW_VERS_REQ		0x9d
+#define ELE_RETURN_LIFE_CYCLE_REQ	0xa0
+#define ELE_GET_EVENT_REQ		0xa2
+#define ELE_COMMIT_REQ			0xa8
+#define ELE_GEN_KEY_BLOB_REQ		0xaf
+#define ELE_GET_FW_STATUS_REQ		0xc5
+#define ELE_XIP_DECRYPT_REQ		0xc6
+#define ELE_WRITE_FUSE                  0xd6
+#define ELE_DEV_ATTEST_REQ              0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
+#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
@@ -97,4 +114,6 @@ int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 			dma_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 707fb69431ba..73548451b762 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -5,6 +5,27 @@
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
+#include "ele_fw_api.h"
+#include "se_ctrl.h"
+
+int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (!header->size || header->size > MAX_WORD_SIZE)
+		return -EINVAL;
+
+	if (header->tag != priv->if_defs->cmd_tag &&
+	    header->tag != priv->if_defs->rsp_tag)
+		return -EINVAL;
+
+	if (header->ver == priv->if_defs->base_api_ver)
+		return ele_uapi_allowed_base_cmd(priv, header);
+	else if (header->ver == priv->if_defs->fw_api_ver)
+		return ele_uapi_allowed_fw_cmd(dev_ctx, header);
+
+	return -EINVAL;
+}
 
 /*
  * se_update_msg_chksum() - calculate and update message checksum word.
@@ -46,6 +67,25 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
+static void se_mark_fw_busy(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	if (!priv->fw_busy_dev_ctx) {
+		kref_get(&dev_ctx->refcount);
+		priv->fw_busy_dev_ctx = dev_ctx;
+		atomic_set(&priv->fw_busy, 1);
+	}
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+}
+
+void set_se_rcv_msg_timeout(struct se_if_device_ctx *dev_ctx, u32 timeout_ms)
+{
+	dev_ctx->rcv_msg_timeout_jiffies = msecs_to_jiffies(timeout_ms);
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	struct se_if_priv *priv = dev_ctx->priv;
@@ -56,10 +96,20 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 	unsigned long flags;
 	int ret;
 
-	remaining_jiffies = msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+	remaining_jiffies = dev_ctx->rcv_msg_timeout_jiffies;
 	if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl) {
 		is_rsp_wait_with_timeout = true;
 		deadline_jiffies = jiffies + remaining_jiffies;
+
+		/*
+		 * Internal kernel transactions run on priv_dev_ctx (probe
+		 * get_info/ping, FW auth, PM IMEM swap). They are not tied to a
+		 * restartable syscall, so wait uninterruptibly: PM freezer fake
+		 * signals must not abort them with -ERESTARTSYS. Userspace
+		 * waiters stay interruptible via the deferred-signal path below.
+		 */
+		if (se_clbk_hdl->dev_ctx == priv->priv_dev_ctx)
+			wait_uninterruptible = true;
 	}
 
 	do {
@@ -71,7 +121,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 				se_clbk_hdl->rx_msg = NULL;
 				if (!completion_done(&se_clbk_hdl->done))
-					atomic_set(&priv->fw_busy, 1);
+					se_mark_fw_busy(dev_ctx);
 				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 				ret = -ETIMEDOUT;
 				break;
@@ -119,7 +169,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 			se_clbk_hdl->rx_msg = NULL;
 			if (!completion_done(&se_clbk_hdl->done))
-				atomic_set(&priv->fw_busy, 1);
+				se_mark_fw_busy(dev_ctx);
 
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			ret = -ETIMEDOUT;
@@ -128,8 +178,35 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 				get_se_if_name(priv->if_defs->se_if_type));
 			break;
 		}
+
+		/*
+		 * A positive wait return normally means a real response. During
+		 * teardown, se_if_probe_cleanup() forces this wait to return via
+		 * complete_all() with no response, while the enclave may still
+		 * DMA into the shared buffer. Treat that as a failed transaction
+		 * and arm the circuit breaker so the buffer is quarantined, not
+		 * freed.
+		 *
+		 * rx_delivered tells the two apart: se_if_rx_callback() sets it
+		 * under clbk_rx_lock only after copying a real response. This
+		 * keeps teardown-time session/storage close responses from being
+		 * mistaken for the forced abort, which would fail the close and
+		 * leak its DMA buffer.
+		 */
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (is_rsp_wait_with_timeout && atomic_read(&priv->going_away) &&
+		    !se_clbk_hdl->rx_delivered) {
+			se_clbk_hdl->rx_msg = NULL;
+			se_mark_fw_busy(dev_ctx);
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			ret = -ENODEV;
+			break;
+		}
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
 		ret = se_clbk_hdl->rx_msg_sz;
 		break;
+
 	} while (ret < 0);
 
 	return ret;
@@ -190,16 +267,42 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	/*
+	 * Arm the transaction under clbk_rx_lock. se_if_probe_cleanup() sets
+	 * going_away under this same lock, then complete_all()s, so checking
+	 * going_away and arming (reinit_completion() + publish) together makes
+	 * teardown and arming mutually exclusive and closes the lost-wakeup
+	 * window. priv_dev_ctx teardown-close commands are still let through.
+	 *
+	 * Check going_away before fw_busy so a caller racing unbind gets
+	 * -ENODEV, not a misleading retryable -EBUSY. fw_busy is only
+	 * atomic_read() here, so no fw_busy_lock is taken and there is no
+	 * deadlock.
+	 */
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	if (atomic_read(&priv->going_away) &&
+	    (dev_ctx != priv->priv_dev_ctx ||
+	    !is_msg_xchng_for_tdown(tx_msg))) {
+		spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+		return -ENODEV;
+	}
+
 	if (atomic_read(&priv->fw_busy)) {
+		spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
+
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
-	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
-	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+	/*
+	 * Arm a fresh transaction: clear the delivered flag so a stale value
+	 * from a previous response cannot make ele_msg_rcv() mistake a
+	 * teardown-forced complete_all() for a genuine firmware response.
+	 */
+	priv->waiting_rsp_clbk_hdl.rx_delivered = false;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
 	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
@@ -248,6 +351,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
+	bool schedule_fw_busy_work = false;
 	struct device *dev = mbox_cl->dev;
 	const char *devname = NULL;
 	struct se_msg_hdr *header;
@@ -325,9 +429,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (!se_clbk_hdl->rx_msg) {
-			/* Close circuit breaker on spinlock race */
-			atomic_set(&priv->fw_busy, 0);
+			if (atomic_read(&priv->fw_busy))
+				schedule_fw_busy_work = true;
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+			if (schedule_fw_busy_work)
+				schedule_work(&priv->fw_busy_work);
+
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
@@ -347,6 +455,12 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
 		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+		/*
+		 * Mark that a genuine firmware response was delivered. ele_msg_rcv()
+		 * reads this under clbk_rx_lock to avoid mistaking this response for
+		 * a teardown-forced complete_all() wakeup.
+		 */
+		se_clbk_hdl->rx_delivered = true;
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
@@ -398,7 +512,7 @@ int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
 		return -EINVAL;
 	}
 
-	if (header->size > SE_MU_HDR_WORD_SZ) {
+	if (header->size > SE_MU_HDR_WORD_SZ && (sz >> 2) > SE_MU_HDR_WORD_SZ) {
 		status = RES_STATUS(msg->data[0]);
 		if (status != priv->if_defs->success_tag) {
 			dev_dbg(priv->dev, "Command Id[%x], Response Failure = 0x%x",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 07e6b6a1bafa..b63a3fbf087a 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -9,11 +9,15 @@
 #include "se_ctrl.h"
 
 #define SE_RCV_MSG_DEFAULT_TIMEOUT_MS	3000
+#define SE_RCV_MSG_LONG_TIMEOUT_MS	5000000
 
 #define ELE_SUCCESS_IND			0xD6
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+
+void set_se_rcv_msg_timeout(struct se_if_device_ctx *dev_ctx, u32 val);
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -42,4 +46,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
new file mode 100644
index 000000000000..2e98f36f0697
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "se_ctrl.h"
+#include "ele_common.h"
+#include "ele_fw_api.h"
+
+static bool se_cmd_receiver_allowed_cmd(u8 cmd)
+{
+	switch (cmd) {
+	case ELE_SESSION_CLOSE_REQ:
+	case ELE_STORAGE_CLOSE_REQ:
+	case ELE_STORAGE_MASTER_IMPORT_REQ:
+		return true;
+	default:
+		return false;
+	}
+}
+
+int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool is_cmd_receiver = false;
+	int ret = 0;
+
+	scoped_guard(mutex, &priv->modify_lock)
+		if (dev_ctx == priv->cmd_receiver_clbk_hdl.dev_ctx)
+			is_cmd_receiver = true;
+
+	if (header->tag == priv->if_defs->cmd_tag) {
+		if (is_cmd_receiver && !se_cmd_receiver_allowed_cmd(header->command))
+			return -EOPNOTSUPP;
+	}
+
+	if (header->tag == priv->if_defs->rsp_tag && !is_cmd_receiver)
+		return -EOPNOTSUPP;
+
+	switch (header->command) {
+	case ELE_SESSION_OPEN_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->sess_hdl ? -EEXIST : 0;
+		break;
+	case ELE_SESSION_CLOSE_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->sess_hdl ? 0 : -ENXIO;
+		break;
+	case ELE_STORAGE_OPEN_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->strg_hdl ? -EEXIST : 0;
+		break;
+	case ELE_STORAGE_CLOSE_REQ:
+		/* Might be cleared as part of tear down. */
+		ret = dev_ctx->strg_hdl ? 0 : -ENXIO;
+		break;
+	}
+
+	return ret;
+}
+
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx_msg)
+{
+	struct se_msg_hdr *header = &rx_msg->header;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	switch (header->command) {
+	case ELE_SESSION_OPEN_REQ:
+		dev_ctx->sess_hdl = rx_msg->data[1];
+		break;
+	case ELE_SESSION_CLOSE_REQ:
+		dev_ctx->sess_hdl = 0;
+		break;
+	case ELE_STORAGE_CLOSE_REQ:
+		scoped_guard(mutex, &priv->modify_lock)
+			unset_dev_ctx_as_command_receiver(dev_ctx);
+		dev_ctx->strg_hdl = 0;
+		break;
+	case ELE_STORAGE_OPEN_REQ: {
+		int rc = 0;
+
+		rc = set_dev_ctx_as_command_receiver(dev_ctx);
+		if (rc) {
+			dev_err(priv->dev,
+				"Failed to register %s as CMD-Receiver: %d\n",
+				dev_ctx->devname, rc);
+			break;
+		}
+		dev_ctx->strg_hdl = rx_msg->data[1];
+		break;
+	}
+	default:
+		dev_dbg(priv->dev, "%s: Unknown command = 0x%x.",
+			dev_ctx->devname, header->command);
+	}
+}
+
+/*
+ * Return true when tx_msg is one of the close requests the driver issues
+ * from its own teardown path (session/storage close). ele_msg_send_rcv()
+ * uses this to let those close messages through even after going_away is
+ * set, so the kernel can still resynchronise session/storage state with FW.
+ */
+bool is_msg_xchng_for_tdown(void *tx_msg)
+{
+	struct se_msg_hdr *header = &((struct se_api_msg *)tx_msg)->header;
+
+	return (header->command == ELE_SESSION_CLOSE_REQ ||
+		header->command == ELE_STORAGE_CLOSE_REQ);
+}
+
+int se_close_session(struct se_if_priv *priv, u32 session_hdl)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv || !priv->priv_dev_ctx)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, true);
+
+	tx_msg->data[0] = session_hdl;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
+			       tx_msg,
+			       ELE_SESSION_CLOSE_REQ_SZ,
+			       rx_msg,
+			       ELE_SESSION_CLOSE_RSP_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_SESSION_CLOSE_REQ,
+				      ELE_SESSION_CLOSE_RSP_SZ,
+				      false);
+	return ret;
+}
+
+int se_close_storage(struct se_if_priv *priv, u32 storage_hdl)
+{
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int ret;
+
+	if (!priv || !priv->priv_dev_ctx)
+		return -EINVAL;
+
+	tx_msg = kzalloc(ELE_STORAGE_CLOSE_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	rx_msg = kzalloc(ELE_STORAGE_CLOSE_RSP_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_STORAGE_CLOSE_REQ, ELE_STORAGE_CLOSE_REQ_SZ, true);
+
+	tx_msg->data[0] = storage_hdl;
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
+			       tx_msg,
+			       ELE_STORAGE_CLOSE_REQ_SZ,
+			       rx_msg,
+			       ELE_STORAGE_CLOSE_RSP_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv,
+				      rx_msg,
+				      ELE_STORAGE_CLOSE_REQ,
+				      ELE_STORAGE_CLOSE_RSP_SZ,
+				      false);
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_fw_api.h b/drivers/firmware/imx/ele_fw_api.h
new file mode 100644
index 000000000000..c84fd583ad20
--- /dev/null
+++ b/drivers/firmware/imx/ele_fw_api.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef ELE_FW_API_H
+#define ELE_FW_API_H
+#include "se_ctrl.h"
+
+#define ELE_SESSION_OPEN_REQ            0x10u
+
+#define ELE_SESSION_CLOSE_REQ_SZ	0x08u
+#define ELE_SESSION_CLOSE_RSP_SZ	0x08u
+#define ELE_SESSION_CLOSE_REQ           0x11u
+
+#define ELE_STORAGE_OPEN_REQ            0xE0u
+
+#define ELE_STORAGE_CLOSE_REQ_SZ	0x08u
+#define ELE_STORAGE_CLOSE_RSP_SZ	0x08u
+#define ELE_STORAGE_CLOSE_REQ           0xE1u
+
+#define ELE_STORAGE_MASTER_IMPORT_REQ   0xE2u
+
+int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header);
+void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx_msg);
+bool is_msg_xchng_for_tdown(void *tx_msg);
+int se_close_session(struct se_if_priv *priv, u32 session_hdl);
+int se_close_storage(struct se_if_priv *priv, u32 storage_hdl);
+#endif /* ELE_FW_API_H */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index a8974eef190b..207219804b14 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
@@ -15,6 +16,7 @@
 #include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -23,22 +25,21 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
+#include "ele_fw_api.h"
 #include "se_ctrl.h"
 
+/* Maximum response buffer size in bytes for debug-dump replies. */
+#define MAX_ALLOWED_RX_MSG_SZ		ELE_DEBUG_DUMP_RSP_SZ
+#define MAX_ALLOWED_TX_MSG_SZ		SZ_4K
+
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_soc_dev_regn {
 	bool soc_dev_registered;
 	struct soc_device *soc_dev;
@@ -133,6 +134,13 @@ char *get_se_if_name(u8 se_if_id)
 	return "unknown";
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_if_node *if_node = device_get_match_data(priv->dev);
+
+	return if_node->se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &priv->load_fw;
@@ -284,11 +292,319 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	dma_addr_t se_fw_dma_addr;
+	u32 se_fw_buf_len;
+	void *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	if (fw->size > U32_MAX) {
+		ret = -EFBIG;
+		release_firmware(fw);
+		return ret;
+	}
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/*
+	 * Serialize access to priv_dev_ctx shared memory to prevent pos
+	 * corruption if two driver-internal callers run concurrently (e.g.
+	 * ele_get_info() racing with load_firmware()).
+	 */
+	scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
+		se_fw_buf_len = fw->size;
+		ret = get_shared_mem_slot(priv->priv_dev_ctx,
+					  &se_fw_buf_len, &se_fw_dma_addr,
+					  &se_fw_buf);
+		if (ret) {
+			dev_err(priv->dev, "Failed to allocate firmware shared buffer: %d\n",
+				ret);
+			release_firmware(fw);
+			return ret;
+		}
+
+		memcpy(se_fw_buf, fw->data, fw->size);
+		ret = ele_fw_authenticate(priv, se_fw_dma_addr, se_fw_dma_addr);
+		if (ret < 0) {
+			dev_err(priv->dev,
+				"Error %pe: Authenticate & load SE firmware %s.",
+				ERR_PTR(ret), se_img_file_to_load);
+			ret = -EPERM;
+		}
+		if (!se_is_fw_busy_ctx(priv->priv_dev_ctx))
+			se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
+	}
+
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	guard(mutex)(&load_fw->load_fw_lock);
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	if (priv->mem_pool)
+		INIT_LIST_HEAD(&se_shared_mem_mgmt->mem_pool_buf_list);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx, bool reclaim)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool free_dma_buf;
+
+	/*
+	 * mem_pool_buf_list is only initialised for interfaces that own a
+	 * gen_pool (priv->mem_pool != NULL). On interfaces without a pool
+	 * (e.g. imx93, which has no pool_name) the list head is left
+	 * zero-filled, so se_cleanup_mem_pool_buf() must not walk it here or
+	 * list_for_each_entry_safe() would dereference a NULL head and panic
+	 * the kernel on close/teardown. Skip the pool cleanup entirely when
+	 * there is no pool; there is nothing to reclaim in that case.
+	 */
+	if (priv->mem_pool)
+		se_cleanup_mem_pool_buf(dev_ctx, reclaim);
+
+	/* Guard against being called before shared memory was ever allocated
+	 * (e.g. probe failure before dma_alloc_coherent succeeded).
+	 */
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return;
+
+	/*
+	 * Decide whether the DMA buffer can be released before touching the
+	 * pending lists. se_dev_ctx_shared_mem_cleanup() resets
+	 * non_secure_mem.pos, so the "nothing staged" test must be sampled
+	 * here first. When reclaim is false the buffer is released only if no
+	 * data is still staged for the firmware; otherwise the enclave may
+	 * still be DMA-ing into it and the buffer is deliberately leaked to
+	 * avoid a DMA-after-free.
+	 */
+	free_dma_buf = reclaim || !se_shared_mem_mgmt->non_secure_mem.pos;
+
+	/*
+	 * Free any se_buf_desc items that were never consumed (e.g. when the
+	 * fd is closed while pending I/O buffers are still listed). This must
+	 * happen before the DMA backing memory is released to avoid a leak.
+	 */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (free_dma_buf) {
+		dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+				  se_shared_mem_mgmt->non_secure_mem.ptr,
+				  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+	}
+
+	/*
+	 * Drop the host-side tracking unconditionally. On the reclaim path the
+	 * buffer has been freed. On the deliberate-leak path the buffer is
+	 * abandoned on purpose, so clearing the pointer here guarantees a later
+	 * cleanup pass (e.g. se_if_priv_release()) cannot double-free it.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	bool is_fw_busy_dev_ctx;
+	int i;
+
+	/*
+	 * If this context is the one that caused a firmware timeout the shared
+	 * DMA buffers may still be actively read/written by the firmware.
+	 */
+	is_fw_busy_dev_ctx = se_is_fw_busy_ctx(dev_ctx);
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (!is_fw_busy_dev_ctx && b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+
+	/*
+	 * Keep non_secure_mem.pos non-zero while this context still owns an
+	 * outstanding firmware transaction. A non-zero pos is the marker that
+	 * data is still staged for the enclave, which cleanup_se_shared_mem()
+	 * uses to decide the buffer must be leaked rather than freed. Resetting
+	 * it here would let a later teardown pass free a buffer the enclave may
+	 * still be DMA-ing into.
+	 */
+	if (!is_fw_busy_dev_ctx)
+		se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static struct se_buf_desc *add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+						      struct se_ioctl_setup_iobuf *io,
+						      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc = NULL;
+
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
+	if (!b_desc)
+		return ERR_PTR(-ENOMEM);
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = u64_to_user_ptr(io->user_buf);
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return b_desc;
+}
+
+static void se_if_open_gate_release(struct kref *kref)
+{
+	struct se_if_open_gate *gate =
+		container_of(kref, struct se_if_open_gate, refcount);
+
+	kfree(gate);
+}
+
+static bool se_if_open_gate_get(struct se_if_open_gate *gate)
+{
+	if (!gate)
+		return false;
+
+	return kref_get_unless_zero(&gate->refcount);
+}
+
+static void se_if_open_gate_put(struct se_if_open_gate *gate)
+{
+	if (gate)
+		kref_put(&gate->refcount, se_if_open_gate_release);
+}
+
+/*
+ * Distinct lockdep class for the internal priv_dev_ctx fops_lock. Taking it
+ * while an open context's fops_lock is held (for example a firmware load
+ * triggered from an ioctl) is valid hierarchical locking, but shares the same
+ * class as the per-open fops_lock and would otherwise be misreported as
+ * recursive locking by lockdep.
+ */
+static struct lock_class_key se_priv_ctx_fops_key;
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	const char *err_str = "Failed to allocate memory";
 	struct se_if_device_ctx *dev_ctx;
+	struct se_if_open_gate *gate = NULL;
 	int ret = -ENOMEM;
 
 	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
@@ -296,19 +612,57 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx)
 		return ret;
 
+	dev_ctx->priv = priv;
 	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
 				     get_se_if_name(priv->if_defs->se_if_type),
 				     ch_id);
 	if (!dev_ctx->devname)
 		goto exit;
 
-	dev_ctx->priv = priv;
+	mutex_init(&dev_ctx->fops_lock);
+	lockdep_set_class(&dev_ctx->fops_lock, &se_priv_ctx_fops_key);
+
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->cleanup_done = false;
 	*new_dev_ctx = dev_ctx;
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0)
+		goto exit;
+
+	gate = kzalloc_obj(*gate, GFP_KERNEL);
+	if (!gate) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	mutex_init(&gate->lock);
+	kref_init(&gate->refcount);    /* device-owned reference */
+	gate->priv = priv;
+	gate->dying = false;
+	priv->open_gate = gate;
+
+	/*
+	 * The miscdevice storage is now owned by the open gate object.
+	 * priv->priv_dev_ctx still keeps a pointer to that miscdevice.
+	 */
+	dev_ctx->miscdev = &gate->miscdev;
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
 
 	return 0;
 exit:
 	*new_dev_ctx = NULL;
 
+	if (gate) {
+		priv->open_gate = NULL;
+		se_if_open_gate_put(gate);
+	}
+	cleanup_se_shared_mem(dev_ctx, true);
 	kfree(dev_ctx->devname);
 	kfree(dev_ctx);
 	return dev_err_probe(priv->dev, ret, "%s", err_str);
@@ -329,9 +683,25 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 	return 0;
 }
 
+/*
+ * Forward declarations. se_if_probe_cleanup() and se_if_probe() are kept
+ * together as the teardown/probe pair, but several helpers, the file
+ * operations table and the firmware-busy work handler they reference are
+ * defined further down in this file.
+ */
+static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx);
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose);
+static void se_clear_fw_busy(struct se_if_priv *priv);
+static void se_if_dev_ctx_release(struct kref *kref);
+static void se_if_priv_release(struct kref *kref);
+static int se_if_misc_register(struct se_if_priv *priv);
+static void se_fw_busy_work(struct work_struct *work);
+static const struct file_operations se_if_fops;
+
 static void se_if_probe_cleanup(void *plat_dev)
 {
 	struct platform_device *pdev = plat_dev;
+	struct se_if_device_ctx *dev_ctx;
 	struct device *dev = &pdev->dev;
 	struct se_if_priv *priv;
 
@@ -339,31 +709,122 @@ static void se_if_probe_cleanup(void *plat_dev)
 	if (!priv)
 		return;
 
+	/*
+	 * Announce teardown, then wake any in-flight waiter. going_away makes
+	 * ele_msg_send_rcv() bail out instead of arming a new transaction and
+	 * lets ele_msg_rcv() tell a teardown-forced completion apart from a
+	 * real response; it must be set before complete_all().
+	 *
+	 * Set it under clbk_rx_lock, not se_if_cmd_lock: se_if_cmd_lock is held
+	 * across the whole blocking transaction, so taking it here would stall
+	 * unbind for a full receive-timeout. clbk_rx_lock is the short spinlock
+	 * ele_msg_send_rcv() holds while arming, so this closes the lost-wakeup
+	 * window - the sender either sees going_away and bails before arming, or
+	 * armed first and this store (and complete_all()) is ordered after its
+	 * reinit_completion() - and supplies the ordering the relaxed atomics do
+	 * not.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->waiting_rsp_clbk_hdl.clbk_rx_lock)
+		atomic_set(&priv->going_away, 1);
+	/*
+	 * Wake the waiter before iterating the device-context list. It sleeps on
+	 * this completion holding dev_ctx->fops_lock, which cleanup_dev_ctx()
+	 * below also takes, so completing first avoids an unbind hang. Runs
+	 * outside clbk_rx_lock; the going_away store above already orders it
+	 * against the arming path.
+	 */
+	complete_all(&priv->waiting_rsp_clbk_hdl.done);
+
+	/*
+	 * Mark the private device context as cleanup_done first.
+	 * This prevents new device contexts from being created in open().
+	 */
+	if (priv->priv_dev_ctx) {
+		/*
+		 * Mark cleanup_done under fops_lock so that se_if_fops_open(),
+		 * which checks cleanup_done while holding fops_lock, cannot
+		 * race past this and add a new device context after teardown.
+		 */
+		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
+			priv->priv_dev_ctx->cleanup_done = true;
+
+		if (priv->open_gate) {
+			scoped_guard(mutex, &priv->open_gate->lock) {
+				priv->open_gate->dying = true;
+				priv->open_gate->priv = NULL;
+			}
+		}
+
+		/*
+		 * misc_register() is deferred to the end of probe, so the
+		 * device may have a miscdev set up but never registered if
+		 * probe failed before se_if_misc_register(). Only deregister
+		 * when registration actually succeeded.
+		 */
+		if (priv->open_gate && priv->open_gate->registered &&
+		    priv->priv_dev_ctx->miscdev)
+			misc_deregister(priv->priv_dev_ctx->miscdev);
+	}
+
+	while (true) {
+		dev_ctx = NULL;
+
+		scoped_guard(mutex, &priv->modify_lock) {
+			if (list_empty(&priv->dev_ctx_list))
+				goto out_done;
+
+			dev_ctx = list_first_entry(&priv->dev_ctx_list,
+						   struct se_if_device_ctx, link);
+
+			/* pin this context so close() cannot free it under us */
+			kref_get(&dev_ctx->refcount);
+			dlink_dev_ctx(dev_ctx);
+		}
+
+		/*
+		 * Local cleanup outside the global lock avoids ABBA deadlock
+		 * with paths that already take dev_ctx->fops_lock first.
+		 */
+		cleanup_dev_ctx(dev_ctx, false);
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+	}
+out_done:
+
+	/*
+	 * Free the rx mailbox channel before cancelling fw_busy_work.
+	 * se_if_rx_callback() runs from the rx channel and can schedule
+	 * fw_busy_work when a late response arrives. If the channel were still
+	 * live after cancel_work_sync(), a callback could re-arm the work and
+	 * later dereference priv after it has been freed. Releasing the rx
+	 * channel first guarantees no further callbacks, so the subsequent
+	 * cancel_work_sync() is final.
+	 */
 	if (priv->rx_chan)
 		mbox_free_channel(priv->rx_chan);
 	if (priv->tx_chan)
 		mbox_free_channel(priv->tx_chan);
 
 	/*
-	 * Being device managed buffer, no need to free the buffer allocated
-	 * in se probe to store encrypted IMEM.
+	 * A timed-out synchronous command may have retained a dev_ctx through
+	 * priv->fw_busy_dev_ctx even after the fd was closed and the context was
+	 * removed from dev_ctx_list. If no late response arrived, release that
+	 * retained context during driver teardown.
+	 *
+	 * se_clear_fw_busy() is idempotent and internally checks
+	 * priv->fw_busy_dev_ctx under fw_busy_lock.
 	 */
+	se_clear_fw_busy(priv);
+	cancel_work_sync(&priv->fw_busy_work);
 
 	/*
-	 * No need to check, if reserved memory is allocated
-	 * before calling for its release. Or clearing the
-	 * un-set bit.
+	 * Being device managed buffer, no need to free the buffer allocated
+	 * in se probe to store encrypted IMEM.
 	 */
-	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
 
-	if (priv->priv_dev_ctx) {
-		kfree(priv->priv_dev_ctx->devname);
-		kfree(priv->priv_dev_ctx);
-	}
-
-	kfree(priv);
+	/* Drop the initial reference - priv will be freed when last fd closes */
+	kref_put(&priv->refcount, se_if_priv_release);
 }
 
 static int se_if_probe(struct platform_device *pdev)
@@ -386,15 +847,30 @@ static int se_if_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->dev = dev;
+	/*
+	 * Pin the parent device for the lifetime of priv. A file descriptor may
+	 * stay open after the device is unbound; close() then still passes
+	 * priv->dev to dma_free_coherent()/dev_warn(). Without this reference
+	 * the struct device could be freed while priv->dev still points at it,
+	 * so the reference is dropped in se_if_priv_release() via put_device().
+	 */
+	get_device(priv->dev);
+	kref_init(&priv->refcount);
 	priv->if_defs = &if_node->if_defs;
 	dev_set_drvdata(dev, priv);
 
 	mutex_init(&priv->se_if_cmd_lock);
+	mutex_init(&priv->modify_lock);
 	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
 	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
 	atomic_set(&priv->fw_busy, 0);
+	spin_lock_init(&priv->fw_busy_lock);
+	priv->fw_busy_dev_ctx = NULL;
+	INIT_WORK(&priv->fw_busy_work, se_fw_busy_work);
+
 	init_completion(&priv->waiting_rsp_clbk_hdl.done);
 	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
 	if (ret)
@@ -460,7 +936,7 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -472,12 +948,1093 @@ static int se_if_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
 	}
 
+	/*
+	 * All probe-time initialization is complete; expose the
+	 * interface to userspace last so that an open()/ioctl cannot
+	 * race against a not-yet-initialized device.
+	 */
+	ret = se_if_misc_register(priv);
+	if (ret)
+		return ret;
+
 	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
 		 get_se_if_name(priv->if_defs->se_if_type));
 
 	return ret;
 }
 
+/*
+ * Expose the interface to userspace. Deferred until the end of probe so
+ * the device node only becomes openable after SoC info has been fetched
+ * and, on SoCs with IMEM management, the encrypted-IMEM buffer has been
+ * allocated. This prevents userspace from opening the node and issuing
+ * commands against a partially initialized interface.
+ */
+static int se_if_misc_register(struct se_if_priv *priv)
+{
+	int ret;
+
+	ret = misc_register(priv->priv_dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to register misc device.");
+
+	priv->open_gate->registered = true;
+
+	return 0;
+}
+
+static void se_if_priv_release(struct kref *kref)
+{
+	struct se_if_priv *priv = container_of(kref, struct se_if_priv, refcount);
+
+	/* Free priv_dev_ctx if it exists */
+	if (priv->priv_dev_ctx) {
+		/*
+		 * miscdev storage belongs to open_gate, not directly to
+		 * priv_dev_ctx. The gate should already have been detached
+		 * from priv during teardown.
+		 *
+		 * Reclaim the internal context's shared memory directly here
+		 * instead of through cleanup_dev_ctx(). Teardown already set
+		 * cleanup_done on priv_dev_ctx, so cleanup_dev_ctx() would
+		 * short-circuit and leak the host descriptors and the coherent
+		 * buffer. By this point the device is fully unbound; if this
+		 * context ever armed the firmware-busy breaker, se_clear_fw_busy()
+		 * has already run with reclaim=false and freed the host
+		 * descriptors, emptied the pool list and cleared
+		 * non_secure_mem.ptr. A reclaim=true pass here is therefore both
+		 * safe and idempotent: it releases the buffers for a normal
+		 * context and is a no-op for the abandoned firmware-busy one.
+		 */
+		scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock)
+			cleanup_se_shared_mem(priv->priv_dev_ctx, true);
+
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(priv->dev);
+
+	/*
+	 * Be defensive: if teardown did not already drop the device-owned
+	 * gate reference for some reason, release it here.
+	 */
+	if (priv->open_gate) {
+		se_if_open_gate_put(priv->open_gate);
+		priv->open_gate = NULL;
+	}
+
+	/*
+	 * Drop the reference on priv->dev taken in se_if_probe(). The device was
+	 * pinned so that a file descriptor closed after device unbind can still
+	 * safely pass priv->dev to dma_free_coherent()/dev_warn().
+	 */
+	put_device(priv->dev);
+
+	/* Free any remaining resources that weren't devm-managed */
+	kfree(priv);
+}
+
+static void se_if_dev_ctx_release(struct kref *kref)
+{
+	struct se_if_device_ctx *dev_ctx =
+		container_of(kref, struct se_if_device_ctx, refcount);
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	kfree(dev_ctx);
+
+	/* drop the priv reference owned by this device context */
+	kref_put(&priv->refcount, se_if_priv_release);
+}
+
+static void se_clear_fw_busy(struct se_if_priv *priv)
+{
+	struct se_if_device_ctx *dev_ctx = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	dev_ctx = priv->fw_busy_dev_ctx;
+	priv->fw_busy_dev_ctx = NULL;
+	atomic_set(&priv->fw_busy, 0);
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+
+	if (!dev_ctx)
+		return;
+
+	/*
+	 * The circuit breaker is cleared from two places, which need opposite
+	 * memory-reclaim policies:
+	 *
+	 *   1. se_fw_busy_work(): a late firmware response actually arrived.
+	 *      going_away is not set and the enclave has finished with the
+	 *      buffer, so a full reclaim (reclaim=true) is safe. Only do this
+	 *      once the owning fd has been closed (cleanup_done); while the fd
+	 *      is still open the buffer belongs to that context and is released
+	 *      on its normal close path.
+	 *
+	 *   2. se_if_probe_cleanup(): teardown. going_away is set and no
+	 *      response has been confirmed, so the enclave may still be
+	 *      DMA-writing into the shared buffer. Freeing it here would be a
+	 *      DMA-after-free. Pass reclaim=false so cleanup_se_shared_mem()
+	 *      frees only the host-side descriptors and deliberately leaks the
+	 *      DMA buffer that the enclave might still touch.
+	 */
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		if (atomic_read(&priv->going_away)) {
+			/*
+			 * Fatal, but deliberately non-panic: the enclave is
+			 * unresponsive at unbind with a transaction still in
+			 * flight. Both the coherent staging buffer and any
+			 * gen_pool buffers this context owns are abandoned
+			 * (host descriptors freed, DMA-visible memory leaked)
+			 * to avoid a DMA-after-free while the enclave may still
+			 * be writing. Emit one headline error here rather than
+			 * per-buffer so the count of faulted contexts is clear.
+			 * Do not use WARN/BUG: this path is recoverable and
+			 * panic_on_warn kernels must not be brought down by it.
+			 */
+			dev_err(priv->dev,
+				"%s: FATAL: enclave stuck at unbind, DMA leaked.\n",
+				dev_ctx->devname);
+			cleanup_se_shared_mem(dev_ctx, false);
+		} else if (dev_ctx->cleanup_done) {
+			cleanup_se_shared_mem(dev_ctx, true);
+		}
+	}
+
+	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+}
+
+void unset_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *old_rx_msg = NULL;
+	struct se_clbk_handle *se_clbk_hdl;
+	unsigned long flags;
+
+	lockdep_assert_held(&priv->modify_lock);
+
+	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+
+	if (se_clbk_hdl->dev_ctx == dev_ctx) {
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		old_rx_msg = se_clbk_hdl->rx_msg;
+		se_clbk_hdl->dev_ctx = NULL;
+		se_clbk_hdl->rx_msg = NULL;
+		se_clbk_hdl->rx_msg_sz = 0;
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+		kfree(old_rx_msg);
+		complete_all(&se_clbk_hdl->done);
+	}
+}
+
+int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *new_rx_msg = NULL;
+	struct se_clbk_handle *se_clbk_hdl;
+	unsigned long flags;
+
+	se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+	guard(mutex)(&priv->modify_lock);
+	if (se_clbk_hdl->dev_ctx == dev_ctx)
+		return 0;
+
+	if (se_clbk_hdl->dev_ctx)
+		return -EBUSY;
+
+	if (!se_clbk_hdl->rx_msg) {
+		new_rx_msg = kzalloc(MAX_NVM_MSG_LEN, GFP_KERNEL);
+		if (!new_rx_msg)
+			return -ENOMEM;
+	}
+	spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+	if (new_rx_msg)
+		se_clbk_hdl->rx_msg = new_rx_msg;
+	reinit_completion(&se_clbk_hdl->done);
+	se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
+	se_clbk_hdl->dev_ctx = dev_ctx;
+	dev_ctx->rcv_msg_timeout_jiffies = MAX_SCHEDULE_TIMEOUT;
+	spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+	return 0;
+}
+
+static void dlink_dev_ctx(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	unset_dev_ctx_as_command_receiver(dev_ctx);
+
+	if (!list_empty(&dev_ctx->link)) {
+		list_del_init(&dev_ctx->link);
+		priv->active_devctx_count--;
+	}
+}
+
+bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
+	bool match;
+
+	spin_lock_irqsave(&priv->fw_busy_lock, flags);
+	match = priv->fw_busy_dev_ctx == dev_ctx;
+	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
+
+	return match;
+}
+
+static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	bool already_done;
+
+	scoped_guard(mutex, &dev_ctx->fops_lock) {
+		already_done = dev_ctx->cleanup_done;
+		if (!already_done) {
+			/*
+			 * Ask FW to drop this context's session and storage so
+			 * the kernel and FW stay in sync. Done here, under this
+			 * context's fops_lock only (not the global modify_lock),
+			 * because both close requests block on a firmware
+			 * round-trip; issuing them while modify_lock was held
+			 * would stall every other context for the FW timeout.
+			 *
+			 * Skip the round-trips once the FW path is marked busy.
+			 * fw_busy is armed when a synchronous transaction times
+			 * out; while it is set ele_msg_send_rcv() rejects further
+			 * commands with -EBUSY without waiting. It is only cleared
+			 * by se_clear_fw_busy(), which during unbind runs once
+			 * after this loop (or earlier from fw_busy_work only if a
+			 * genuine late FW response arrives). On a hung FW no late
+			 * response comes, so the breaker stays set for the rest of
+			 * the loop and the remaining closes would just return
+			 * -EBUSY and log spurious "failed to close" errors. Skip
+			 * them and emit a single warning instead.
+			 */
+			if (atomic_read(&dev_ctx->priv->fw_busy)) {
+				if (dev_ctx->strg_hdl || dev_ctx->sess_hdl)
+					dev_warn(dev_ctx->priv->dev,
+						 "%s: skipping session/storage close, FW is busy\n",
+						 dev_ctx->devname);
+			} else {
+				if (dev_ctx->strg_hdl && se_close_storage(dev_ctx->priv,
+									  dev_ctx->strg_hdl))
+					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
+				if (dev_ctx->sess_hdl && se_close_session(dev_ctx->priv,
+									  dev_ctx->sess_hdl))
+					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
+			}
+			/*
+			 * fw_busy is caused by one timed-out synchronous transaction.
+			 * Only that transaction's dev_ctx may still have coherent
+			 * memory referenced by FW. Do not skip cleanup for unrelated
+			 * contexts while fw_busy is set.
+			 */
+			if (se_is_fw_busy_ctx(dev_ctx))
+				dev_warn(dev_ctx->priv->dev,
+					 "%s: deferring shared memory cleanup while FW is busy\n",
+					 dev_ctx->devname);
+			else
+				cleanup_se_shared_mem(dev_ctx, true);
+
+			kfree(dev_ctx->devname);
+			dev_ctx->devname = NULL;
+			dev_ctx->cleanup_done = true;
+		}
+	}
+
+	if (is_fclose)
+		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
+}
+
+static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (is_fclose) {
+		scoped_guard(mutex, &priv->modify_lock)
+			dlink_dev_ctx(dev_ctx);
+	}
+
+	cleanup_dev_ctx(dev_ctx, is_fclose);
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+	kref_init(&dev_ctx->refcount);
+	dev_ctx->priv = priv;
+	dev_ctx->cleanup_done = false;
+	INIT_LIST_HEAD(&dev_ctx->link);
+	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_LONG_TIMEOUT_MS);
+	*new_dev_ctx = dev_ctx;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+
+		return ret;
+	}
+
+	/* Take a reference to priv for this device context */
+	kref_get(&priv->refcount);
+
+	scoped_guard(mutex, &priv->modify_lock) {
+		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+		priv->active_devctx_count++;
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_cleanup(struct se_if_device_ctx *dev_ctx, void __user *uarg,
+					struct se_ioctl_cmd_snd_rcv_rsp_info *cmd_snd_rcv_rsp_info)
+{
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (cmd_snd_rcv_rsp_info->rx_buf_sz &&
+	    copy_to_user(uarg, cmd_snd_rcv_rsp_info, sizeof(*cmd_snd_rcv_rsp_info))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info to user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_if_priv *priv = dev_ctx->priv;
+	int rsp_status_err = 0;
+	int cleanup_err = 0;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EFAULT;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ||
+	    cmd_snd_rcv_rsp_info.tx_buf_sz > MAX_ALLOWED_TX_MSG_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small/large(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
+								MAX_ALLOWED_TX_MSG_SZ);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOSPC;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		memdup_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf),
+			    cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	err = se_chk_tx_msg_hdr(dev_ctx, &tx_msg->header);
+	if (err) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
+	if (cmd_snd_rcv_rsp_info.rx_buf_sz < SE_MU_HDR_SZ ||
+	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+			return -EPERM;
+		}
+	}
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOMEM;
+	}
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+		/*
+		 * -ERESTARTSYS here means the wait was interrupted by a signal
+		 * after the command had already been handed to (and possibly
+		 * executed by) the firmware. Returning -ERESTARTSYS lets the VFS
+		 * transparently restart the ioctl, which would re-run the command
+		 * with the just cleaned-up (zeroed) shared input buffers. Report
+		 * -EINTR instead so the syscall is not auto-restarted; userspace
+		 * can decide whether to reissue it.
+		 */
+		if (err == -ERESTARTSYS)
+			err = -EINTR;
+
+		return err;
+	}
+
+	/*
+	 * ele_msg_send_rcv() returns a positive received-message size on
+	 * success. Returning that raw size as the ioctl result would make a
+	 * successful transaction look like a positive (non-zero) return value
+	 * to userspace. Record the actual received size in rx_buf_sz for the
+	 * response copied back to userspace, then normalise err to 0 so the
+	 * ioctl reports plain success; the firmware status is conveyed to
+	 * userspace inside the response buffer itself.
+	 */
+	cmd_snd_rcv_rsp_info.rx_buf_sz = err;
+	err = 0;
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	rsp_status_err =
+		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
+					cmd_snd_rcv_rsp_info.rx_buf_sz,
+					tx_msg->header.ver == priv->if_defs->base_api_ver);
+
+	if (!rsp_status_err) {
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0) {
+			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+			return err;
+		}
+	}
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf), rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	cleanup_err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+
+	if (cleanup_err && !err)
+		err = cleanup_err;
+
+	if (!err && !rsp_status_err)
+		fw_api_specific_ops(dev_ctx, rx_msg);
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				void __user *uarg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user(uarg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static void rollback_shared_mem_pos(struct se_if_device_ctx *dev_ctx, u32 length)
+{
+	struct se_shared_mem *shared_mem = NULL;
+
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	if (WARN_ON_ONCE(length > shared_mem->pos)) {
+		shared_mem->pos = 0;
+		return;
+	}
+
+	shared_mem->pos -= length;
+}
+
+int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			u32 *length, dma_addr_t *ele_dma_addr, void **ptr)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	bool is_fw_busy_dev_ctx;
+	size_t aligned_len = 0;
+	u32 pos;
+
+	/*
+	 * If this context is the one that caused a firmware timeout the shared
+	 * DMA buffers may still be actively read/written by the firmware.
+	 */
+	is_fw_busy_dev_ctx = se_is_fw_busy_ctx(dev_ctx);
+	if (is_fw_busy_dev_ctx)
+		return -EBUSY;
+
+	aligned_len = round_up((size_t)*length, 8);
+	if (aligned_len < *length) {
+		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
+			dev_ctx->devname);
+		return -EINVAL;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %zd, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, aligned_len, shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    aligned_len > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += aligned_len;
+	*ele_dma_addr = (u64)shared_mem->dma_addr + pos;
+	*ptr = shared_mem->ptr + pos;
+	*length = aligned_len;
+
+	memset(shared_mem->ptr + pos, 0, aligned_len);
+
+	return 0;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					void __user *uarg)
+{
+	struct se_ioctl_setup_iobuf io = {0};
+	struct se_buf_desc *b_desc = NULL;
+	void *dma_buf_ptr = NULL;
+	dma_addr_t ele_dma_addr;
+	u32 aligned_len = 0;
+	int err = 0;
+
+	if (copy_from_user(&io, uarg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		u64_to_user_ptr(io.user_buf), io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	aligned_len = io.length;
+	err = get_shared_mem_slot(dev_ctx, &aligned_len, &ele_dma_addr, &dma_buf_ptr);
+	if (err)
+		return err;
+
+	io.ele_addr = ele_dma_addr;
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(dma_buf_ptr, u64_to_user_ptr(io.user_buf),
+				   io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			err = -EFAULT;
+			goto rollback;
+		}
+	}
+
+	b_desc = add_b_desc_to_pending_list(dma_buf_ptr, &io, dev_ctx);
+	if (IS_ERR(b_desc)) {
+		err = PTR_ERR(b_desc);
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+		goto rollback;
+	}
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user(uarg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto rollback;
+	}
+	return err;
+
+rollback:
+	if (!IS_ERR_OR_NULL(b_desc)) {
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	if (dma_buf_ptr && aligned_len) {
+		memset(dma_buf_ptr, 0, aligned_len);
+		rollback_shared_mem_pos(dev_ctx, aligned_len);
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
+					    void __user *uarg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user(uarg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -EINVAL;
+		}
+
+		if (size < SE_MU_HDR_SZ || size > MAX_ALLOWED_TX_MSG_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small/large(%zu < %d)",
+				dev_ctx->devname, size,
+				size < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
+								MAX_ALLOWED_TX_MSG_SZ);
+			return -ENOSPC;
+		}
+
+		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		err = se_chk_tx_msg_hdr(dev_ctx, &tx_msg->header);
+		if (err)
+			return err;
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	u8 rx_msg_snap[MAX_NVM_MSG_LEN];
+	struct se_if_priv *priv;
+	unsigned long flags;
+	size_t copy_len;
+	int err;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
+		priv = dev_ctx->priv;
+
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+			buf, size, ((ppos) ? *ppos : 0));
+
+		mutex_lock(&priv->modify_lock);
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			mutex_unlock(&priv->modify_lock);
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			return -EINVAL;
+		}
+		mutex_unlock(&priv->modify_lock);
+	}
+
+	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+	if (err < 0) {
+		if (err != -ERESTARTSYS)
+			dev_err(priv->dev,
+				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+		return err;
+	}
+
+	/*
+	 * Reacquire fops_lock before touching any dev_ctx state (pending lists,
+	 * rx_msg) after the blocking wait. fops_lock was dropped before calling
+	 * ele_msg_rcv(). If cleanup_dev_ctx() ran concurrently it could have
+	 * freed the DMA buffers and the pending lists, leading to UAF and list
+	 * corruption. Re-checking cleanup_done under fops_lock prevents that.
+	 */
+	mutex_lock(&dev_ctx->fops_lock);
+
+	if (dev_ctx->cleanup_done) {
+		mutex_unlock(&dev_ctx->fops_lock);
+		return -ENODEV;
+	}
+
+	/*
+	 * Snapshot rx_msg pointer under clbk_rx_lock before releasing it.
+	 * unset_dev_ctx_as_command_receiver() can acquire the lock, NULL out
+	 * rx_msg, and free the buffer at any time after the unlock; using a
+	 * stale pointer from the shared field after the unlock is a UAF.
+	 */
+	scoped_guard(mutex, &priv->modify_lock) {
+		spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx ||
+		    !priv->cmd_receiver_clbk_hdl.rx_msg ||
+		    !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
+			spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+			mutex_unlock(&dev_ctx->fops_lock);
+			return -ENODEV;
+		}
+		/* Taking snapshot is enough for the one common pre-allocated buffer. */
+		copy_len = min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
+		memcpy(rx_msg_snap, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len);
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+		spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0) {
+			se_dev_ctx_shared_mem_cleanup(dev_ctx);
+			mutex_unlock(&dev_ctx->fops_lock);
+			return err;
+		}
+		/* Copy data from the buffer using the snapshot taken under the lock. */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     rx_msg_snap, copy_len, false);
+
+		err = copy_len;
+		if (copy_to_user(buf, rx_msg_snap, copy_len))
+			err = -EFAULT;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		mutex_unlock(&dev_ctx->fops_lock);
+	}
+
+	return err;
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_open_gate *gate;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	gate = container_of(miscdev, struct se_if_open_gate, miscdev);
+
+	if (!se_if_open_gate_get(gate))
+		return -ENODEV;
+
+	if (mutex_lock_interruptible(&gate->lock)) {
+		se_if_open_gate_put(gate);
+		return -ERESTARTSYS;
+	}
+
+	if (gate->dying || !gate->priv ||
+	    !kref_get_unless_zero(&gate->priv->refcount)) {
+		err = -ENODEV;
+		goto out_unlock_gate;
+	}
+
+	priv = gate->priv;
+	mutex_unlock(&gate->lock);
+
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
+		err = -ERESTARTSYS;
+		goto out_put_priv;
+	}
+
+	if (misc_dev_ctx->cleanup_done) {
+		err = -ENODEV;
+		goto out_unlock_misc;
+	}
+
+	priv->dev_ctx_mono_count++;
+	err = init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
+	if (err) {
+		dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		goto out_unlock_misc;
+	}
+
+	fp->private_data = dev_ctx;
+
+out_unlock_misc:
+	mutex_unlock(&misc_dev_ctx->fops_lock);
+out_put_priv:
+	kref_put(&priv->refcount, se_if_priv_release);
+	se_if_open_gate_put(gate);
+	return err;
+out_unlock_gate:
+	mutex_unlock(&gate->lock);
+	se_if_open_gate_put(gate);
+	return err;
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+
+	dlink_n_cleanup_dev_ctx(dev_ctx, true);
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv;
+	void __user *uarg = (void __user *)arg;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock) {
+		if (dev_ctx->cleanup_done)
+			return -ENODEV;
+
+		priv = dev_ctx->priv;
+
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV: {
+			err = set_dev_ctx_as_command_receiver(dev_ctx);
+			if (err)
+				dev_err(priv->dev, "Failed to register %s as CMD-Receiver: %ld\n",
+					dev_ctx->devname, err);
+		break;
+		}
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, uarg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, uarg);
+			break;
+		default:
+			err = -ENOTTY;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.compat_ioctl   = compat_ptr_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
+int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
+			dma_addr_t *daddr, u32 len)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc = NULL;
+
+	lockdep_assert_held(&dev_ctx->fops_lock);
+
+	if (se_is_fw_busy_ctx(dev_ctx))
+		return -EBUSY;
+
+	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	/*
+	 * gen_pool is internally thread-safe, so contexts may allocate
+	 * concurrently. The buffer is tracked on this context's own
+	 * mem_pool_buf_list and released on its cleanup path.
+	 */
+	*buf = gen_pool_dma_alloc(priv->mem_pool, len, daddr);
+	if (!*buf) {
+		dev_err(priv->dev, "Failed to alloc from gen_pool.\n");
+		kfree(b_desc);
+		return -ENOMEM;
+	}
+
+	/* gen_pool_dma_alloc() does not zero the buffer. */
+	memset(*buf, 0, len);
+	b_desc->shared_buf_ptr = *buf;
+	b_desc->size = len;
+
+	list_add_tail(&b_desc->link, &se_shared_mem_mgmt->mem_pool_buf_list);
+
+	return 0;
+}
+
+void se_cleanup_mem_pool_buf(struct se_if_device_ctx *dev_ctx, bool reclaim)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+
+	/*
+	 * Free only the buffers this context allocated. A context that never
+	 * used the pool has an empty list, so this is a no-op for it.
+	 *
+	 * Unlike the coherent staging buffer, the pool path needs no
+	 * "nothing staged" (pos) gate on the reclaim=false leg. Pool buffers
+	 * are ephemeral, per-transaction allocations: se_get_mem_pool_buf()
+	 * refuses to allocate once the context is fw_busy, ele_msg_send_rcv()
+	 * refuses to start a new command while fw_busy, and the success path
+	 * frees the whole list via se_cleanup_mem_pool_buf(reclaim=true)
+	 * before returning. se_if_cmd_lock serialises synchronous commands, so
+	 * at most one transaction is outstanding. The only way to reach here
+	 * with reclaim=false and a non-empty list is the single fw_busy
+	 * context still owning the buffer(s) from the one timed-out
+	 * transaction. Those buffers are exactly the in-flight ones the
+	 * enclave may still be DMA-ing into, so leaving them on the list (no
+	 * gen_pool_free) deliberately leaks them to avoid a DMA-after-free -
+	 * there are no already-consumed pool buffers to reclaim on this leg.
+	 */
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->mem_pool_buf_list, link) {
+		if (reclaim)
+			gen_pool_free(priv->mem_pool,
+				      (unsigned long)b_desc->shared_buf_ptr,
+				      b_desc->size);
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+}
+
+static void se_fw_busy_work(struct work_struct *work)
+{
+	struct se_if_priv *priv =
+		container_of(work, struct se_if_priv, fw_busy_work);
+
+	se_clear_fw_busy(priv);
+}
+
 static int se_suspend(struct device *dev)
 {
 	struct se_if_priv *priv = dev_get_drvdata(dev);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index dd4a1ea7e35a..35389095ed1c 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -10,20 +10,40 @@
 #include <linux/miscdevice.h>
 #include <linux/mailbox_client.h>
 #include <linux/semaphore.h>
+#include <linux/workqueue.h>
 
 #define MAX_FW_LOAD_RETRIES		50
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(128 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
 
+struct se_if_open_gate {
+	struct miscdevice miscdev;
+	struct se_if_priv *priv;
+	/* to lock to update the structure */
+	struct mutex lock;
+	struct kref refcount;
+	bool dying;
+	/* set once misc_register() has succeeded (deferred to probe end) */
+	bool registered;
+};
+
 struct se_clbk_handle {
 	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
+	/*
+	 * Set under clbk_rx_lock once a real response is copied into rx_msg,
+	 * cleared when a new transaction is armed. Lets ele_msg_rcv() tell a
+	 * genuine response from a teardown-forced complete_all() with no data.
+	 */
+	bool rx_delivered;
 	u32 rx_msg_sz;
+
 	/*
 	 * Assignment of the rx_msg buffer to held till the
 	 * received content as part callback function, is copied.
@@ -45,10 +65,46 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head mem_pool_buf_list;
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+	u32 sess_hdl;
+	u32 strg_hdl;
+	bool cleanup_done;
+	unsigned long rcv_msg_timeout_jiffies;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
+
+	/* Add reference counting */
+	struct kref refcount;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -113,9 +169,43 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+	/*
+	 * Set once teardown begins. New synchronous transactions are rejected
+	 * and a teardown-forced completion is not mistaken for a real firmware
+	 * response.
+	 */
+	atomic_t going_away;
+	/*
+	 * Serialise the fw_busy_dev_ctx and fw_busy state updates between the
+	 * timeout path, late-response callback/work, and teardown.
+	 */
+	spinlock_t fw_busy_lock;
+	struct se_if_device_ctx *fw_busy_dev_ctx;
+	struct work_struct fw_busy_work;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+
+	/* prevent modifying priv member variable in parallel. */
+	struct mutex modify_lock;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+
+	/* Add reference counting */
+	struct kref refcount;
+
+	/* stable gate used by .open() */
+	struct se_if_open_gate *open_gate;
 };
 
 char *get_se_if_name(u8 se_if_id);
+void unset_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx);
+int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx);
+bool se_is_fw_busy_ctx(struct se_if_device_ctx *dev_ctx);
+void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx);
+int get_shared_mem_slot(struct se_if_device_ctx *dev_ctx,
+			u32 *length, dma_addr_t *ele_dma_addr, void **ptr);
+int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
+			dma_addr_t *daddr, u32 len);
+void se_cleanup_mem_pool_buf(struct se_if_device_ctx *dev_ctx, bool reclaim);
 #endif
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..6302ff66034f
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	__u64 user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u64 tx_buf;
+	__u64 rx_buf;
+	__u32 tx_buf_sz;
+	__u32 rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0
