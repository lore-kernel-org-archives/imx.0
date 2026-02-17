Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09C283FDF
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341321; cv=fail; b=noHe6a3j7usN+I/ua6rcGuNX99OSozvIanit1ne3xCKJBYCS6veGsfsIcBL+HgFDP5uuDoSR87r/89ENZTP9j06BgRx8U/kUPBJiGFKaAcNbLSW9IrI0vCjAkv7s0LceqonskriDY66xcbJ8sjG9+SjSwoZW+NRFYMEgwKIh6SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341321; c=relaxed/simple;
	bh=BW7rY/UB1gS9ULW9BoAkiSdz6JIUYn6bK0Yngc5NYHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNZtHICUfHP9wlbLCtnDw+b+QFGp3JdVdSQp5+rExVqVDEfDNyVrob9hLo+CW1MJ2Mg8yTiMI+rAldfuS4WX2kpD66BpipUU+X9MYP/1OLKglOOh3nWLYkn1KQxStQ9HtjWiu6Nh7M9kvfYpaHychet5LGkbCDW3/0ENVZlvvrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=gfs/H7Nb; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="gfs/H7Nb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7yrC+J9mX6w0xm0AE40ZH0pJ9Xd6yT7mnneEcq1sRmWd33XpIQoO7IPShevI6GaCv6OuBu/XcMQpz9R6Atwe3WTUrf0HQwaQ7H0oZh759/5NECG22Vqx9oo8d6sZB9i73Qnj0zwbxyOplXpd6ZPxBXrSMjexxmG5ae0Lk5kta6iw/uQT+p5Naz7MkJXiHNYxdlRoqWXr4zjkfPsQsyj8GNhAAEWwYqiVQiuj0syR021/ckl0fDGgNocYDOaB/U7FljkiZhmpuPBxW24dmQEx2qePSNo1axfUXQO93Ke6QTuUAEQwbtzvzTY81OrcnQyFMP01V5LywBzFEuMT33h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bl+k1GV91xykRRXb61NiR5J72EFBAoOR+XEhRiy6yg=;
 b=V0uzvwfCkzoCinADMFgI1/Bg0sICwlx+FO/BALZzQ5TIGO0NLEJ0Z1jZ6uqpMUbgclN3jc/i5+AlWcqDVHujxDN/JRJAICxMkjfE8M1KeEWnVGOOR1ZFM4WchMPcq479chbwlcrhFrSdkQ8DqPaMMdy1oSnXIgcqKkGyaUt/iLq/moSXV/KLxHDTc0Wm757a6xCCr8Z+7BnN62Dsp2aTjaym4oFIbW8+e6g8Q2nqTLLXa5bfPcqUwuHUZ55rGLbbdC8sMiQkPeL2JC3g31eCB/hmL7h/fHUqS1efr+jMsS2s8hyCyoH9NqGtr0OsE1JpSG05S9K88bDoZLy0KSvMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bl+k1GV91xykRRXb61NiR5J72EFBAoOR+XEhRiy6yg=;
 b=gfs/H7NbFOEyZ/mN2r0uhQh4WAaN7842qHd9u0cz/RPMBHUwaYRPkYn7TWDz0nebJwaITq0ZWWYUoPmNPnfTETI5aSgn/yiiZQjIsJr/2UMZv8VkXJ5OodkG18tDzD5iYJN4l8e5fG+v6bR8MolRmqPz6+eFOECnYFLP1mWQpKh8daZNJCkMeiLZJM7Rx3EVv6DUQSX6a06yPa7k+A1JWZe1kZd491DRXtdT96o093vohXvaN9A9+JNqH32mLi0GgVCDtggelMZkqUDNEHcFzG0AxSSknJWEMJBrL3YmrsV4V7P0cP6l5BgfqXCuCbu25icARQA6d+sWJWt9/nz+xg==
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by SJ4PPF8420DE5C5.namprd22.prod.outlook.com (2603:10b6:a0f:fc02::fb4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:15:13 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::9f) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 15:15:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 15:15:12 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 95392E8F41;
	Tue, 17 Feb 2026 17:15:09 +0200 (EET)
Date: Tue, 17 Feb 2026 17:15:09 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <aZSF_VIBRPodKCD6@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
 <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SJ4PPF8420DE5C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9d7569-92e2-4ad2-5eb9-08de6e3758f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUNNcDZ2Umd4bkQyZm00a0hHdnR2N1JKamI4aWZrUzZDWFRzcit5ZGo5TVlN?=
 =?utf-8?B?eHZ2d29jWmRvOGYzT0owSDlwSkJpRWhVcm16ZFpuNkxzYmZadjgrT2F0Um9L?=
 =?utf-8?B?TFVIQkdBejZEY0o5bkxNNVFLSWJkNkxFTmRjTDNjeXd4ZnVpMnFKVUxNRWZz?=
 =?utf-8?B?VmwzTGZNZTJNcC8vcXI4UmFRN1E3Zm5hSVF4c2hKcDZTZWsveUk5ZnA5SEZE?=
 =?utf-8?B?QVFYVWI5UzhFK2d3ZjVsbkJYeGxaQUNKejBWZi9YMURjN0RFVjJkTmpScHdy?=
 =?utf-8?B?ajRvYnJ2cEpvSmoyZ0RYUi9PNktiRWErSmVQVmFNYlpTNm9qWHFjVmtHOEV5?=
 =?utf-8?B?bEpzeGozMXFvM3BJZkVFQUJBN0Z2U2ZIUFN0czBseGFiays0Ymc1WXQ0WDNS?=
 =?utf-8?B?OFlodVhPTS8zWDZPOVBVSXJ0V05yWmtETUFjZ3NocWtxWFU0MVIzVENiOGJp?=
 =?utf-8?B?SXJBQjd4OFFmTURBa3BYVExnUEhFYXZFaGZXRXJYcE5NMkV5UXA4dU5YYTFq?=
 =?utf-8?B?c1k3Uko4bFpNdWVTVXI4VHROY3hWR2dWSjJuT2J6L2daN3JRUWc2QXd5M0lV?=
 =?utf-8?B?YkQvVEhIK21PRmlzLzBNaU1FSG43ZEkzN2xhLy9zWnFtUDA4K3FMRDZCVi91?=
 =?utf-8?B?VmJEUjN3b1VDKzJGWTVsc0w2ZnVHaG9oNTZSam9TdnhpMzNvTVkxWTZmNEE2?=
 =?utf-8?B?bFdWbDYxZ1NScU9mUW9zSnVrbmpYTENZWEpHRlNPbmowZnhMRzV0OWgzUmFv?=
 =?utf-8?B?MlRYQ2ZrbU1KRlVhNitaV0c0djljYWRoSmI5NGh4MWRTaTMvVEZsTVczNTY0?=
 =?utf-8?B?TzZPQVVtblBpYjVQaFB1Q3k0TmpOa0hZcElYeFFrcUUrZVJ5RzlDdXpSclo3?=
 =?utf-8?B?SGpUU2RvRlRMclJQUXU3Wm1sdE9TUlo4ZzFKWlF0T2FqcldUaC9PRUNKTXB0?=
 =?utf-8?B?TFU4aDVqRUttOG9Uc1kvOVExQjErYkdKTjVBSlhlVEFndEVxZSs1cmRlZzZV?=
 =?utf-8?B?Z3FmUEdJUDBSdDlhSVE5QUhRMnBpQUdIQlN1Tjl6ZEpEUXhlSVdkWlRPN00y?=
 =?utf-8?B?L3BBcHhhR0huZzBEU01yQ3JSZGovWS9tWXVsWlN3M0xyWmJ3TUd5K0syVU9P?=
 =?utf-8?B?UzRuZy83S0dPYjg3ZWVZNmp1czdpeU9MYTNtNmZnQ3UzREwyV3dYWkdLL3hn?=
 =?utf-8?B?Zmg2Rm1hUFZDcmVCaThWTUxvT1R5OGdFeU0zb1FQb0tuL3hkL0h4UytSSXpn?=
 =?utf-8?B?MUtKL00vZUZIbk5oYmIrQjdZZi9CeWFrZ1lpdU45eVpwdzRoTy9SZW5qUVJ0?=
 =?utf-8?B?dTEzeG5GZU40aVNyaXIzWmdodUxndnV1R0hQUU9YVTAwZEJhMXJNVHlGemNY?=
 =?utf-8?B?NDZ3dkNvZVowRjlkeTBFYVA1d1VqYkh2eHlSd0p3WGFGSWJ4M0hBa1MrcHdm?=
 =?utf-8?B?MnVwTTdBcFZ4T2EyNy9ucm1HbHI3OFJPcDVkTVNHc0lsejlPd1BtNVFFSkp3?=
 =?utf-8?B?Nnc3b3RJcUFJbkhWdklIcUR0aGUxSTJ3Lzloa3VDUlYya1V2ejN2RXQxSnZK?=
 =?utf-8?B?ZnBZUlVVNTJJdXRteTFYVDhQbUtUK3NnbzJxekxienZ0Z0hPS0dRZTJtNVBN?=
 =?utf-8?B?MjU5SkJVVU01WmlrdWY4UTN6R3JHTHNUeVc5SEFSK0VaNWlvQ0p3aWZtdEg2?=
 =?utf-8?B?c2RyU2p4UXJXL0M1N2c0UFZKcmV3d2VvMzFLNXJCV0U5a3RjZ3VkaGgyMGZ0?=
 =?utf-8?B?MjNId3hZL3ZPdENQRmZZcVM5SkVmUlVUTUZFdmxkcEc0ejJEZ1dQZEovR3dG?=
 =?utf-8?B?K0VnWTNFRFkrWmVkRzVKZEduUmZKRzY1S0wvNFBFMUxBVUdJcmdhT1R2U3VD?=
 =?utf-8?B?TmMvdjBpd05yVDhjeFJBdG84T2Y2cGdVQ0RFa0lEcmRRbTIyRlRaSU9CVkJ2?=
 =?utf-8?B?OTViOWRTTUlpSmgyV3lIUTZiYmsxdHB6S1ROZ0xMUHFrNnZJa0huTjlOdTlS?=
 =?utf-8?B?aDQ2bjhMcGg2NHdIRktGV25Vb3JncUo1bEFlVkVMUU5nNi9pVE5ZUmJnNnZo?=
 =?utf-8?B?QXZRdXY0UXozVlNCck5UQkhnNzN0ODl0ZWVUWFVjMVlVT2RnYmM4a0FncW9r?=
 =?utf-8?B?RHl1QWYwY1h5RC8xeVE4Mmhac0ZHcER4eW41ZFE0Skk4M05VZEtuL3YyWDlP?=
 =?utf-8?B?ODY4UEpxYkNPSFFEYUlFa0VqdWlCQWxaSnN4YktEa29mUkpRWlo5cHZjN0Qr?=
 =?utf-8?B?dlp6RTVuK0NBMlJiRFdjMTduT3J3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BWPMlUmTXj/PZDRdYAoqYLUJHGdtyPIIRrbcMZfg8upprqHcMfY1iO6ByYo8fxrgJaQoeYiWG/D/ZyeqpPW5SUKbKe1sIJIiscMOth2GBpuPOcPKrL0z5sR/e68NO3okwJFQCUy9AW1iQ8l/h+2SInqOL912mq0N/oTY+ZO/LN1IlPWdY2nyLAnxDy7wnl3vzjTShNm2jPu8Y5JvnGS8QCcy2w6ImUkSIydCduOBfPtcsF57OFWo0UBaPyBHkLGJ2rC23amy8kE6h6CilbrbV4td09Vgxqo2bLFgqC1Ss4DfNbJYEi2pvWUKqqr79Qxxy6e5FKCLe+eY58vmikCwYvGC9DcXoFvusEKJid+U3fmW5uJyIDOlTq1irhm2QvK62aiBtlAknSXg6Jf+XY8eotbkaG556i253BIukufBHR5Lq6hTIM6wq8dksZxfoaOB
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:15:12.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9d7569-92e2-4ad2-5eb9-08de6e3758f6
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF8420DE5C5

On Tue, Feb 17, 2026 at 03:58:42PM +0100, Andrew Lunn wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On Tue, Feb 17, 2026 at 02:59:49PM +0200, Ian Ray wrote:
> > Set `phy-mode' on network switch CPU ports to eliminate a warning.
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
> >  3 files changed, 3 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > index d994b32ad825..7326b8ad08cb 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > @@ -140,6 +140,7 @@ port@3 {
> >       port@4 {
> >               reg = <4>;
> >               label = "cpu";
> > +             phy-mode = "gmii";
> 
> Are the PHYs external to the switch?

Yes, port 4 is connected to an I210.

> 
> >       port@4 {
> >               reg = <4>;
> >               label = "cpu";
> > +             phy-mode = "gmii";
> >               ethernet = <&switch_nic>;
> >               phy-handle = <&switchphy4>;
> 
> You have back to back PHYs on the CPU port? This is not wrong, but
> unusual.

No, the patch sets `phy-mode' on three different boards.  (If I
understand your question correctly.)

Thanks,
Ian

> 
>         Andrew
