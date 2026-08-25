Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A8486631
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671732; cv=fail; b=mYuWQJuJX1+tS+rzxfxhLoAkhaBiAXcnPDJGrxXRzaJgamK8P2yf4jkAtWYd7c/fDOdt2Z5vhDeKK4IuBXsTVGm/adWyPvmImn6sRdPXqJ20EnEXontfb3Pnf7qn/Ylgo0A8DJAdNCPHhtfff51/KoyZOWINZa6ZFEGbtwwevzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671732; c=relaxed/simple;
	bh=eAWi6Hob2Vj5XvMdeI8sYrAQeoV0jEBBT8rmHB53ae8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a3YS0vZFvVJxN4kjtArUdVdNovbK6Z0GHxESRsgusjnI15mwRxZqw3/9Kv6rpSySK3QGVRVXOEBuVT1pRMNkQY2wKxLuH0w+/7MQ5uMihUZ3GJdS+Kf3uGMixhFmm0WmGxbtNTUl9XnhAd6smtCPeq2SrqXp7co5QgFEFZApTpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=acJZUXnA; arc=fail smtp.client-ip=40.107.130.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="acJZUXnA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U85qQbCBoHKnVNLFc4Te0ebtletxVOHA2vGRYJQsyK62Vq7XKlVvg7b21EAGp2GvEp20TzuRbrYKlhk8yuxKWzVHbRWdrB0wbqOzuZwXm6iyLDoeIwM7tVmmM3l4H4S80WWmTbwE8RByN7Q6cul52NOPfgPQE6Mp0Nj78BInwkb70DVoMGY0j9nFlwoWgFioGvfPA8KWHFZFa1hWAgydU552Qra94c+hHEorvZ2AbjIKZ9bC1zEP8QUgohtjGZ0if3ILUs/c+H9iymG6HeEfxpDDPEDDNv2E4QHHYLZQ19E+swqMG92R3UAsoi0ilrG/nKSzS1ULEhC560+IQT3wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgDGOq8srqdGn9Xs9eGFRVOV0BVwr7Q8yqyrTtk1q9U=;
 b=D3OhVESGWzp/Pd2V5qHaYbMHnXfu4c4a3aF15PJmYkkFLGnd8O+v2f+64p2a9u1AUWPZgJVER6XL+HENAExr3tMdH5We78WCtyZxAKywAwDy4Y8rhlHUNn6lzPHrUuTrlIQM0xXUHIDCkkJTDFqMGT+qXcZxSq4gAynoF3V4y7Kzpsi7hDu524ENpgl3/B57BWnZMjx47oLLLdeR5+RBLQwYdFoMH9UX9QYGq/qBeSVEJs+PdI1/jB63+rteF6w6QNXCfwN4KvX+49olzted+K+b3cGPSLZjNCp/+btlMM2k9IuDOBQXjMhmw81K6kQPje7YYVkusZnBTP3nzSIFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgDGOq8srqdGn9Xs9eGFRVOV0BVwr7Q8yqyrTtk1q9U=;
 b=acJZUXnAXsifotOHtr2siuqyV4xpL/ACMUqnytXEtjBo/1cS0cbg8YiVx0+LFcw5WgG+ITKhFnRafc42F+xVGfwidiRnGO3ejWddhna4/PaW1xJsWSQqyYLIEoZ/tZzunmw1WhOhAgvrVpJWXRtVhV0/b/p/L7di9c+Nk2dulG9wfuAG2qkq0HeTx51psUfc5exTJjbQS9HqboH+QKoULfWlV1zn/cl1aLB7pQ9YMz13xnS2EQdI2EGGIPOUCi/RNd9SKGmehKxMesfrbKTIS3zf2E1FiBdQdKEcdyzyJsvEMKta8VvMKx0PLXsqY1KJ4/gw+4xYsuD3Pax0/ZlYfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 15:28:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:28:45 +0000
Date: Tue, 25 Aug 2026 10:28:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v42 5/7] firmware: imx: adds miscdev
Message-ID: <ao20pJG7gJp6mAgz@SMW015318>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
X-ClientProxiedBy: SN6PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:805:106::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: e25126f6-93bf-4036-7c58-08df02bd8d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|23010399003|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uFTIS90FEQ5ctnJQN+BIwjqZ615e1B1Dh67CmwjnuWNmzOaPC1uaEjvpCV8Qq1YR6pcBdCP8ttXUszRgCzS5JLSR2Fk/PCKpgpP2/H1GAi/fwm1saJA/2l3zUUJlaBargVMtCLAwYdWr+K/RN13zEt+6db0aWvRKZIMz6DQmCohPsrHL+VLJTxYuvz/eqv/6eHehnPnT6G7ClYY9oNRmZM5+yP70x6nUAiY78ie7J2rWPATW4F43zNAvACjjnRdb8V44qkNyAOzMRXsUdWWnlWCeWWlMSjkgcfa1R4JyBvg2EMEPMaV61vJqpuRtvu8SemnNw97RNaejFjbm1XC0/G5blFQGIxVDbeyLDcV6WeK/6xRTPMDQEhAUMtEaMgHo+5vvVSqIBhG62fBohflFlG7vcSrQD9E9rWqQB7ny0Eg8xVzQ0J71fekuhrgANxHXOuWB+KQcS017zf5OzZ6esF5JE6KykcgjyzcVisCSNps4CQBbB3iElRs5O0p2kJ509MXxVI8awerPbnIh0atvhQAOYOwBKYICrPdav51uxIc8MxD6tVa/cgu6w2J4QBAz05zBCYQ7hMrqf7PQ3CdNiYzIt6z6iEpIFDyrwBcVhe+xW3sjs/LfMnTZdJaBOve2fjdFjMqiNZ3JG1HiWZCKouAp1Xu3wRnvb0c2wL7vcR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnHLRVMAm0qI+wet9LeTboqBc/CM5NYVNbbbpQbOuDLNe0KJKxa8WnKbTuqs?=
 =?us-ascii?Q?0fcN1pyX+vhInuCh40FypmAGLzF0tTpp/fzvsKkinqJjDu+McFIAKn8iInKu?=
 =?us-ascii?Q?15c4yvfQifN8QOKa9zibf5BZGRoQ3T7oRl3Mti5e/FCWVnrQMVUmmp1S6n/K?=
 =?us-ascii?Q?qm3xwCC98PjsF0Q4syM1U9jdONisna8WnknMxE1G4D7Obf1jLbtLTLHvrV4p?=
 =?us-ascii?Q?Bb/DWFFT14wXn4RNbnrH9Vne3fO4ZdFe1YsafbEsqbnX6+GahdeHWD4IkJBa?=
 =?us-ascii?Q?hrPBNXCueb0M2O4IHVW+FuUATmk6gmYSRl/F925NNe86beOqefXh5xgm4nqL?=
 =?us-ascii?Q?Di2+oeYEf05JWqk+uTblBaGlgJJsrEInN2gxOYBs9BDS3q7yTPV/I4u5p1+H?=
 =?us-ascii?Q?5YDP6vVcVzHrl8jic5wW2AVZ7XNyNAAIFnhYDNdZIAWbpTO23p0w0dKKOSeK?=
 =?us-ascii?Q?RDS3edyVWx/l0MfdeefKMuEhacfrKRP8T7tSuRFcbYnm0UOCK8dgqvE5j/oY?=
 =?us-ascii?Q?r1OmjsPjWoO6URQi8QC05T0iKVr1n4n2FYShk56XcaaDefHihiF3XYmEOWr1?=
 =?us-ascii?Q?6p5fa5hQzgGH2w8LsEHNVBVVDkRteAhOdK7bcm3NnxTDwySJ9iunvc1HTuyb?=
 =?us-ascii?Q?sJeTGWyvlxfvwS+QbU2l5OpK09Y3SXPB97xP45vh0s1iFFe560ldqJKtBZZr?=
 =?us-ascii?Q?p6gJQAqV1d324hjkDUXUnmqqYvjWn3WZM4Sch/FhFs42Ai9t5B2pOEXbNK7O?=
 =?us-ascii?Q?iWrBSZTeRJKPxk8b9oXm3Q05u91i9QVhYNg8YuWuJL1pft+qtjRNlTF+HY8o?=
 =?us-ascii?Q?EHlKN4mUrqGnpIzxLSwWPFfnw7T3b4cUhQpY1NHfeHlY3vpuos8o+ZDlBNP0?=
 =?us-ascii?Q?zXBA+ewdMdfwAozIZLzeXFf1AZidZo+0RHub56kk2t/er8BjquE3HPkZ1oqT?=
 =?us-ascii?Q?QAe9Dos9LuxKruhqHS9oCn7/irqv7ZuoBwIngPzAYuOZaFTxZ7J24ncZ2jcp?=
 =?us-ascii?Q?siPZ2q1TqMMFc2LHB1u7QS4DBlF0KUKlso+DY57cWaCbchqg/8l/HOzl6V1a?=
 =?us-ascii?Q?DtD+AlKxaGzcEYyzmiFA5mk0uo5/q6KCDS6lFrATGc0Qhca/8cJr6DPjNSUc?=
 =?us-ascii?Q?NTlm/2HuGywU1EyOPbH1TAtP9zGi3Vc5E7Jf0HAajZkJDSy6C3xVwpxBgfRz?=
 =?us-ascii?Q?iiVJiEG+La2jYDOLgoIRd4eFHHykS/aYAIFAMRkSIXkiXNkZdUHu9jnmCap2?=
 =?us-ascii?Q?aGjD0HV9rQOiExfj6wsO25Q9/aXfKOU9WgmW4T2DF0UcWMV/VaCeSxj7Of0i?=
 =?us-ascii?Q?evPzOB1rusrCA0uZHe+llrfBehhWEdQyAhyJbMm3U+aGz+UHQ/5xbrXyAfgy?=
 =?us-ascii?Q?HAus+gErEw4pZ1OHecUffB/cjjCuBIm7w4VXADlzUBkvO/WwwMYzzQqJUXX3?=
 =?us-ascii?Q?EX+r/l1t3myStoWBdg9pyQVp+rGif/txXmnIuRiCcmrjcKFTpBkDkaBHjH1G?=
 =?us-ascii?Q?pIwmfjSi5w/9Ho3wDDB/gcDIxLHMLIAUuFRiTC4PtIV7owMMSNglwnxrhsGA?=
 =?us-ascii?Q?cv19bgRiDSlYzYNR+Mn6N0MqfdQcf4n1jrw28QOgtomf5VLYAz3+qPdbqUGP?=
 =?us-ascii?Q?W3g3i1K+tKiM3jJ8VBWePRUqoishlKTD5UfCxK/nja92wTZDldSzW99Lpr0A?=
 =?us-ascii?Q?c3nvO+g5eRGjsX3L0yISglsUaVLsB7CAImO6Qp4WvrwmkpejdOdmJGUWDaS3?=
 =?us-ascii?Q?4KJAXGlhn/63xR43JOZ62Qn7uKLk/7f+oOZDlZXgCFHtivy+CJZc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25126f6-93bf-4036-7c58-08df02bd8d49
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:28:45.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xk1A0ctqxK0O6rXvt+341u+ss1Ide5daPqTD9BhMYjFW8ZFnO+ruD50L0qXl2SOile9VyANkFI6xX7GxBGCgKBaxd8G37IdqUpnOVNorWWHtIs3uXOPENHcVF9VbcnPR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

On Tue, Aug 25, 2026 at 04:33:37AM +0530, pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> Adds the driver for communication interface to secure-enclave, that
> enables exchanging messages with NXP secure enclave HW IP(s)
> like EdgeLock Enclave, from:
> - User-Space Applications via character driver.
>
> ABI documentation for the NXP secure-enclave driver.
>
> User-space library using this driver:
> - i.MX Secure Enclave library:
>   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> - i.MX Secure Middle-Ware:
>   -- URL: https://github.com/nxp-imx/imx-smw.git
>
> Following checks are performed on the incoming msg-header,
> to block exchanging invalid arbitrary commands:
> - maximum allowed words,
> - check if command-tag & response-tag are valid
> - version,
> - command id validation check, to allow limited base-line API(s)
>   and restrict following:
>   - exchanging power management commands.
>   - reset requests.
>   - BBSM configuration requests.
>   - re-initializing the FW.
>   - RNG init
>   - CAAM resource release management
>   - SE's internal memory management.
> from user-space.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---
...
> +
> +int ele_uapi_allowed_fw_rsp(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header,
> +			    u32 tx_msg_sz)
> +{
> +	struct se_api_msg *msg = container_of(header, struct se_api_msg, header);
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	bool is_cmd_receiver = false;
> +
> +	scoped_guard(mutex, &priv->modify_lock)
> +		if (dev_ctx == priv->cmd_receiver_clbk_hdl.dev_ctx)
> +			is_cmd_receiver = true;
> +
> +	if (!is_cmd_receiver)
> +		return -EINVAL;

is_cmd_receiver only use once

	if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
		return -EINVAL;

so is_cmd_receiver can be removed.

> +
> +	return se_cmd_receiver_allowed_rsp(dev_ctx, msg, tx_msg_sz);
> +}
> +
...
> +int se_close_session(struct se_if_device_ctx *dev_ctx, u32 session_hdl)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	struct se_if_priv *priv;
> +	int ret;
> +
> +	if (!dev_ctx || !dev_ctx->priv)
> +		return -EINVAL;
> +
> +	priv = dev_ctx->priv;
> +
> +	tx_msg = kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);

cleanup prefer declear varible here

	struct se_api_msg *tx_msg __free(kfree)  =
		kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);

> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	rx_msg = kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;

the same here. Check other place.

> +
> +	/*
> +	 * Session close is a FW-API command; format it with the FW API version
> +	 * so se_val_rsp_hdr_n_status() below (called with is_base_api = false,
> +	 * i.e. expecting fw_api_ver) does not reject the matching response and
> +	 * wrongly report the close as failed, which would leak the handle.
> +	 */
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, false);
> +
> +	tx_msg->data[0] = session_hdl;
> +
> +	/*
> +	 * Transmit on the caller's own context. Using dev_ctx (rather than
> +	 * hardcoding priv->priv_dev_ctx) keeps a userspace close() subject to
> +	 * the going_away check in ele_msg_send_rcv(): if unbind has begun and
> +	 * freed priv->tx_chan, the send is rejected with -ENODEV instead of
> +	 * touching the freed mailbox channel. The teardown path passes
> +	 * priv_dev_ctx so its resync closes are still let through.
> +	 */
> +	ret = ele_msg_send_rcv(dev_ctx,
> +			       tx_msg,
> +			       ELE_SESSION_CLOSE_REQ_SZ,
> +			       rx_msg,
> +			       ELE_SESSION_CLOSE_RSP_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = se_val_rsp_hdr_n_status(priv,
> +				      rx_msg,
> +				      ELE_SESSION_CLOSE_REQ,
> +				      ELE_SESSION_CLOSE_RSP_SZ,
> +				      false);
> +	return ret;
> +}
> +
...
> +int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
> +			dma_addr_t *daddr, u32 len)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_buf_desc *b_desc = NULL;
> +
> +	lockdep_assert_held(&dev_ctx->fops_lock);
> +
> +	if (se_is_fw_busy_ctx(dev_ctx))
> +		return -EBUSY;
> +
> +	b_desc = kzalloc_obj(*b_desc, GFP_KERNEL);

GPF_KERNEL is default for *_obj alloc macro. Needn't set it

kzalloc_obj(*b_desc), check others.

Frank

