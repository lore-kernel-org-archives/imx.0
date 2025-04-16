Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42881B87E9
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813400; cv=fail; b=IXpP4jYV8sSpttUO2Y5smTL7mB974nO5WNPml4a46r0MH2Ktjb3LaT1qjm0je0+5DKld3Q6ksLjJhD9STAmbw5vyjr8ILE74s7lS9DuVQ3w0M/y1DdXtIWZ+NYlEdSJ+alUw6aRdErJVswImDIXrvY+ZVV4rl4+9vDFH7qZu2iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813400; c=relaxed/simple;
	bh=k/rhTGyptMKWa8tH+16coeZnEDDHWkcx1SBsriIR1Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X+/3umj49uMzasEwAryISbrKTHpEockB1NR/7HOlufZAEftFJajY0lmgAyDlClR/AxpP4OAaSNEsn3MWoqgGee0cnI05uN7aIjL6AKElJcbZ92pcV6W1s/46VT1YorlONk8n66KjkZaPmpgISbJ8EPvS++eJS1gFc+GQknu6qfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gRTnibSg; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gRTnibSg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laEivRa4Fq2+rXntG7jocTeRmq3Qn0CnGZjY1oNlfePswMLmGTy14SUg2WsJo8Fx0p0qXHvPd5QovHVN7uUTZo1dS91SKF857QJNB2wLDn1YrKCf5kD+FIBsTMzUeXVxXEOy+IJcscksQmSl/SUnz4jtYpseq+5wAhxXShfcDnRv1g+BrpNfiIAWZxL23mbu9u+IQEo++cND8iDo01J3APlCCnSz2WHuwS9cpgRFZ/RGEtq++cbZVetlU+W/55vzr1e983F94t+py/svLDLZSU6WwP5LVGS+xsY8f53/6iRGtT/KOckGPCUEBHMJDrbQvcTv9TNqfMoXj3MNm/KVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Auk5O5xpUdtp+vAUolHpRtIKZrWwsUq3Z6ui/xa9tHs=;
 b=qXOuZu37i1OzdVHYDvgde2mqKuOtI72y5nEug2cBFTHEZMST797hGwASdB0l1srVIkV/T+cJhJY3/p85vcT7lMndIurpj3xLA6UdDZ7UNmBEavIEPuDElyJhbcqRcxp+mlZPclSJT/hnlULpfJas1XGbxUNtTUUi1ZGGUAYitpF6R7Td49UUzxWrXQytd0eFM17SeFdCQyy3wz+FkCs97JUgN1K/sf/hgrH7EuaRwvs57JLCxLGh2sSZFH3UyAS+az99ruPN+POSuK0REeNsz324pPvIC1YuI0fgWRddANs2/wr6zcujxeudrIN/6DUAbt99kFdOkMjvJFQi4trTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auk5O5xpUdtp+vAUolHpRtIKZrWwsUq3Z6ui/xa9tHs=;
 b=gRTnibSgWY+7kBgbb2am5NeSHA+rMQyZX8tf3OvyzwaZP/wTVa8x3Vu/PTaI4wzTXTVnQAKTRVD9Yq9S1a0xA+AgTLL6lk0uMokZMdqMpsuaLj81mO/RQFeKJ4dAGsPlRKpXEFBRfmkwpt6qQKSBKpRrLxrPeeb9LO58ZEakW2PjiuNPe5vinf2fzHvyqWoy5OcYCwNCdedoBhxO7oma5sRUh0/3/wkPHhZE7T9muQ38SKGUxCKwsmmJMTrj8tEYIDpCTThsnlH014BrColot3dbN4DfYhnwgjneYuUW3AoT4KM52ygkRIufTbgW1axw4vTz8RXMESn9i8pPIlGmIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 14:23:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:23:14 +0000
Date: Wed, 16 Apr 2025 10:23:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: extcon: ptn5150: Allow "connector" node
 to present
Message-ID: <Z/+9TFLcIBXvlhNY@lizhi-Precision-Tower-5810>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105940.1572672-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH7P221CA0077.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3abc2a-1b6c-4411-b7da-08dd7cf23988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s8BtEySq9k6S/B3A3/eo3w9G0funj1esrRvyfrax+PLkN0UUyKOviSWY0Db9?=
 =?us-ascii?Q?MoiW7ipgGsW8X8hrom/qE+RJqkWuGnChQ2VegLnHG6wthhP33WvE2L4o5tKo?=
 =?us-ascii?Q?DWEM6ALq5uhV0i7SOjzGeZV0+3fTkeXAr8M2UD+zCoM3dxVnD6tXeJksfH+v?=
 =?us-ascii?Q?m9t9iePXsOW//76AsM6ts95hTe6Efu35g3y8irYIXtD2X5sEQ4uYDexlyp8X?=
 =?us-ascii?Q?h/8LdGeOT+31d+l8fAxnJ9zeuZDHs+3Y9jUdyd9mJrToh+bV6SPQCb2Ir7Zm?=
 =?us-ascii?Q?67rgNeD3NJdy9gXdFFMf1qD2lRpmcOxE6jHX+3x88bZGPrTMioW4795mB/e3?=
 =?us-ascii?Q?NQHaWzMFzGXVxR+eblsyxxW60SPD7SAcaxCSzfFzuwaJhGJhYnfqXKiW1WxZ?=
 =?us-ascii?Q?woSDA6hFmppR/d4fOfZsfohgoSyGgPjwRJLUHh/HEyjiBrxA/qi0aKs0vQyE?=
 =?us-ascii?Q?D3lQioQIK1+tssMY+7aWNi4QPYSxe5Ncgfmarr0x0AGJDN7nnqhQCablgkVw?=
 =?us-ascii?Q?0t3xaPfgbTFeTNfAzVReECCKzMqbSF9meDQqzU12LSFuUZVuaXo+bb9z/slU?=
 =?us-ascii?Q?NogTLI6dVwNXsivxe3sRGrf3vNcMTOmVhzEtdPUmGB7vU3iBGBnbAaC6adgJ?=
 =?us-ascii?Q?vuhOZepvp+kLogCst0ks76tR60vR8SG/0YslLVN6T0juBC7h4cnEgC5n5a+l?=
 =?us-ascii?Q?mLixdP2/ZIlNpDF3fQKvH45cx+aUIKr9jOXQ760Qnbkk2nwqv2VJDKLKdYYJ?=
 =?us-ascii?Q?dQorYtwrAuhtLRQh5wgyYGMXwGvNgzzBXlzCfzK6D+1aO8DsEG85AiNCHTLa?=
 =?us-ascii?Q?ftEYkd1rHt1P8mmSOKRvaUBPcASacL8DoY5769pFNXLWMNjlahn/SfgqCPsr?=
 =?us-ascii?Q?7B/65IcFZEJXbhDJs5k9fHUxB4AW3+CBHCL+RK7MGzLZbjGSVeGeRMkAaXX5?=
 =?us-ascii?Q?NVMYFW+o9zVNHOnYRlgg70cqqrzUXNaafbV6euZbvnUkfHEQYK2vK8YC1PBN?=
 =?us-ascii?Q?30U2LpZL+heisYlLhnk2WRpu0wE8BhjGknZ0m3PHbyNEdQYWXRDzA7+9zzwI?=
 =?us-ascii?Q?uLYsZgC6Mdn2LmLinjO+VepGry59D7/RAmU1aUrfkT/yGC1nf5jU3t25eX1H?=
 =?us-ascii?Q?qs+BNWH4x+PfflPGnrbAgYGOkHKL3hoyAKC1qAGPcsX4+EhxWpVg+PnVw0ed?=
 =?us-ascii?Q?LPv0yTO1t/QUcVSOLTlkpmeWFi7wu6ygcZtdN9r7bCCaRZ5DeQP0LgJwDND+?=
 =?us-ascii?Q?7mQlBKEQ1PxvDun5TonzjnZAlnM+/5OeIhDMsYKuvRCXEcXHgyulMO/UURfc?=
 =?us-ascii?Q?fpRArk+bEhYL4YmWIvNBxla95J0XQ2ok6iLVarvvPadBVCk3iJnO01wrAYJ5?=
 =?us-ascii?Q?NcD2PqpckkeT/xby0jRbCHMN6cMuOHFafzbD1aZWPqEl3vez5MWF7BmCyTzP?=
 =?us-ascii?Q?NQBg27gOktQ1e++Tiy6bCbeBwaOiaYiA1UG66Mm8fOm+9dZXfP5M0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GemsiDqlPpewhqOHGkEoZ2StestGqbX3fNe3KzoZuECXQU8/nEErRhEzQsM2?=
 =?us-ascii?Q?hE4rmQtULcHA9K/5wkqDqSU2xC/KKMA/0k/pHTvIuQKlSEHZybCw8OA2Jo/I?=
 =?us-ascii?Q?I1KYVqLJyDMQ2XEsDalHcM7vpnC+PuM1IRn4u5tLM0cNLWsNRDUYLLbwfTbc?=
 =?us-ascii?Q?cTxSp7HtrdJETj5f/FgSl99Ua2/VBVD/S1iEuJ6Jz2DrbmQrAuF4GK7zzrNY?=
 =?us-ascii?Q?Q6UhbymaipNNb6NQOdT10QDI4I0yKfvfu2HCRE1LoTah/qq3I6r8/78I7rRL?=
 =?us-ascii?Q?9oIPK731KLZ1PJTDx43JKnhH4L8LqaBxR1+8H87po45LLFzJBtzLkTSak+gm?=
 =?us-ascii?Q?4EpzNjuJv6UQ7/ybuOzDgv8kVl/z9ylHGsUkmIkN587dXE1CNMT0i/gR7tVk?=
 =?us-ascii?Q?v2L+cUs6vnjW3uX4uYVPOWDdJHl19duJkHsGsq4yKNwuJSPe3gfLOm6+tRqS?=
 =?us-ascii?Q?2W6pGfh2/rgg+qDuUhqLOw4vr97h/69Fc+AP2qXqz6xAApAYSTExc7AS+7J1?=
 =?us-ascii?Q?LFCkGOVoGXKdXNJgUho5+xt8bLaZeuTQBhgY/9jhFR44Re+VOYEQM4qjmNax?=
 =?us-ascii?Q?5r6DWF80Lc7tgPbJV9e+0nBMrUAY3RZFf3YvMRzFF2YGLZfdKVeg4ePy8jPY?=
 =?us-ascii?Q?L03Mr8kCF6JqPDlyoriqIDl8/Ho4N4YWDnRSLmdawlhJQcJl65Kwy80CeBVe?=
 =?us-ascii?Q?oxdHD8QXWDZsMPnivaqcuvZ8tGqYIODVN9On4QJI1PPWDKBaMBXaXnTxXCN9?=
 =?us-ascii?Q?ymV7OV6aIM3FUoyKJ5ynFShNq2okTMgDTYAAEmruZpraB9ihnU8H0eQiP4G9?=
 =?us-ascii?Q?NgpbbYKa7c4dJLJEa26tKEiC3GW+bsxbNXlCLsYXypvma/KjvFF8G3hE5FxI?=
 =?us-ascii?Q?gj1os4ZO2Y/bMbblAqq92Noj4LAUtVCFHi1HAQzKSXFC7jOzGqW+qIuwy20b?=
 =?us-ascii?Q?IVIbcsblCQiVbi5fpSBNbNSKN68g7YNydNP+Q2xoBzQeGabzj/WWRdXozZA9?=
 =?us-ascii?Q?fADoleNfjz8qLVvF2vVt+dXF9PABXEToHyeWVfJHKblPM0fRUCphZnHAQDYY?=
 =?us-ascii?Q?4fg0xWe67O4zjKeM/4bADgNQtm/DWFDogZr9zi/AUD7fYwtP3LmjtAdEuhHc?=
 =?us-ascii?Q?Mynry+QDmG5DwLMJA0zZQnTZlVDdCdy1OvgAwwo0V0gHT4IH0mvADD3fDdf0?=
 =?us-ascii?Q?HiIfr9glrVIrHtL6QZP/TNeJnQ7iaU5+vhbUctHqyn4SmuwFpch+NAbE8ymr?=
 =?us-ascii?Q?jyenbh0e0aGrUoV1hZ+RBCYcbEo5KwQjZWJ41EsSibuiAKTIoCCvVB8Z7+KP?=
 =?us-ascii?Q?WZDl9ksxc7P5ajGd9270qUGRa5Qv83H0b0ujcmyce/b34k8gGLwgesnzwv/W?=
 =?us-ascii?Q?Ify+NOoytjEOmhtSyjY/nEdtNaUVRBntH72GaZB9uQXU+FvuYu4AR6e+sp3Y?=
 =?us-ascii?Q?Sx54y5fRrrb7nWzbU1MhqrDLn/tVALEIulsqWKwIq0+RZTruPYD/H81PNgmW?=
 =?us-ascii?Q?xHWbo4Dkjj+OUr980DwE8qN38Q3MfD3pL0wHv1s6WYbiwrs6r7iSs+94aGkf?=
 =?us-ascii?Q?bDMu8fcMR1G25B+MM31Jz3Q+7AwhyyajV3AxiaoI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3abc2a-1b6c-4411-b7da-08dd7cf23988
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:23:14.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtW+8rJaK6Fd9gOllz6lBjQ9lof2M2yDnym005B/by6u6drlfh1MgB3/oQaYannTuY+PqdVI+2FxN+Yu0O103g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847

On Wed, Apr 16, 2025 at 06:59:38PM +0800, Xu Yang wrote:
> PTN5150 Type-C chip normally binds to a Type-C connector, so allow
> "connector" node to present under it.

Suggest commit message:

PTN5150 is usually used with a Type-C connector, so allow a "connector"
node to be defined under it.

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> index 072b3c0c5fd0..79f88b5f4e5c 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> @@ -42,6 +42,9 @@ properties:
>      description:
>        A port node to link the usb controller for the dual role switch.
>
> +  connector:
> +    $ref: /schemas/connector/usb-connector.yaml#
> +
>  required:
>    - compatible
>    - interrupts
> --
> 2.34.1
>
