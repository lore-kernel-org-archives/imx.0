Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B157361676
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334123; cv=fail; b=odCMZvaeCyih05d/jKnE+tbVIXEpNGXUVrpEwwOl5JJY6/Sd9nWk2pYCJhHUKLzq0ra+k2yRyHOh3metc2fojy3bycH/tb2/Sn7bnmxW8xoZsuKG5yIXh2bB3Lf8oBeTcUUO9Xqd/6VkodFMCdXTimm6nwQGE+Za2I/aSYvew7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334123; c=relaxed/simple;
	bh=u9SxWKyIPlbyp+oLr1KOoOziRg/8FfUycjB6QR+1g2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7Fg6zOfJH8bASZuHMecjC6VzUXi9g8R0qrEBxrQUcr8aab9OgoPKGHCAQ30X5FmFstSmiWqiGjEmA/t3rsDtbTLDqGXjB0XZOj80fuKeWV2AN+Zg+8vi4ivFUxPpGNW0PqyOVEmZ7hhSWgz3wgVjjBI6ekGND+Yho5v40Md8t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=g/tv1Yya; arc=fail smtp.client-ip=52.101.53.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="g/tv1Yya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3UE6183s9SZtmrIeOXvvw/jcqxIIEpYs4+IJ/tldcrt6SAEuuipZCj41cO3W2DOuMZuPko9IZ+v2TOzKSaiodW131qH911tsrrcQZGCmM/7uDHcfRXuWuYe8JnAQQX8iyv1qFpI0Kq/FA8meyhC4w9wLES39YO6ts2Uog5P9rwj92dYxudWn5bsmvSetdW2ueIX7Fxx1Bq0l2ZQ7jBiY64eseA2G1NTQow7iIxM0eCsgu+8nAKGPiYaK2MdVeQmg6WQHXTb/noJCxwANwSsXbbpRv47LX453yZXNnE36Wx0IKFMfHDKBTzWs39AsuAcoJ54/COgxTWUnMOnxUrafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQCVNJ0xhxgMaoaFhTWQILaSB8T+RgQ3cn2tYyBCj7Q=;
 b=u3ME7L5WWfyABZ3wUZXOeymSqQvMGtlaY9EytJRYyO5zKvxxNlxVgpYJnrETwehum6moT0juL1l0yES/bIgWf25+cksUhdQJqiJ6s1sydpQO9cccIyZFhmokk2Czo8vSP2G4T7n9jVtrWN7A0rJ1yJcbXIJ/fZIh5PDrGVzx3uVomrX8YgYPEW6yScWOUs7PRrvY9iKLKxbh30ubrOAupxVn3AzL17j9fYKCxFyYNKNoaBcK6mp+LTTRc6hFLBof5Zo+hnhlzmSYcH+0Xyp4oIF2+JWb955s0ShJ/GtrzHRq6bBtd+HVLqoBUzx2Ykgd+SWbPB76D4QK45+4CFbOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQCVNJ0xhxgMaoaFhTWQILaSB8T+RgQ3cn2tYyBCj7Q=;
 b=g/tv1YyaD5fOUhuq8WJ7UA2SWKqyC0rBynwyBK20SQpXRDfTJ4KsVYAYoChPOOCAuKiO/GAXvz1r6y7kuM4DktmRKximotdOndg1p2Eb+8PQXiwjSbLBsF57URS+5pZEm/4s2QpnNsxMYamsNNTR6BzPEjbGkCML7qFLs+c8u7m3UQcV/IFwlEOBvkllEKlHqBtKSfCzr+7XrO4IdY50zH66UnND+sl4VFgZw4v3VwycIqy9gdsbkyhdrPEThCirqYU7fXMh7p2AxoIR7wVYt4wEt0MuNaRuVALjwr2d+dd2j8zdBNf2X9zISwAvtnQ+eCSTHcshZ8ggI51Qi/Juvw==
Received: from BY5PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:1d0::39)
 by PH7PR22MB4775.namprd22.prod.outlook.com (2603:10b6:510:322::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:15:18 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::6) by BY5PR04CA0029.outlook.office365.com
 (2603:10b6:a03:1d0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:15:17 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id C47D0E8F41;
	Tue, 17 Feb 2026 15:15:14 +0200 (EET)
Date: Tue, 17 Feb 2026 15:15:14 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <aZRp4tqggA83BcYT@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
 <1fe4e13d-cc0f-4168-9c5d-db372433c384@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fe4e13d-cc0f-4168-9c5d-db372433c384@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR22MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7ec8f4-8a8c-4e64-0ffc-08de6e269885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzljVmM3Rnd5OC8xTTdHdFRzY0hGYUxUc1B0ZnZGZjFjVzlPeldmTXM0RmFY?=
 =?utf-8?B?Y2hqaDg3d1grbVVJT3MxbWY1d0xJWk5lZXhUcFlCaTJmZTk2bVRZUWdkdmJq?=
 =?utf-8?B?eU9UV0g3OFUrQ2VVS1ptTlV1ODl0Q0NuUUdhR0grMnJkcGsrVGtHcTJxR2d4?=
 =?utf-8?B?WmJ5YjlTOXpOSlp2ZXhTcVY3aHVMVHhjUFRXU3hQbFdmY1IxdWg0K00vNCtw?=
 =?utf-8?B?OVZhdzM5UFd2UjdUZHZJOERNZzhqNzZ1aktNVXAzWW9IaGE0RkNYejJyZzdV?=
 =?utf-8?B?ZjRoc2tmZnpTenFmMW43WmtXNUNVRjZ3QTJLNURIL0l6NG1QY1JFbjNmQjFT?=
 =?utf-8?B?VlJmZFJBRnh0cDZ1YXN2NlJ0Tk5UVS8rQnQ0Y2FxdkhZNWc3WmFsOHhnRnVY?=
 =?utf-8?B?N1FYWnRPa09sbzFnYWE2ZUk1QTFKaDNYb0JLdUFNRXk1NWMzQ1pyVG4yaHpk?=
 =?utf-8?B?dlNHUmRDeW5sSUZ4OU03a2RZQWE1Nkw5NkdKWFIwaEhUVytYM2Zqclo1UU04?=
 =?utf-8?B?Q3YxeC9GQ0syWHY1bFFmNGhpb2FSQUdTMXNaWmFMMXRlclNyWmpZblFNMWl4?=
 =?utf-8?B?Y0JuTDY0RlFIRlpmMVcyTkFKZzRsN2d3bnlTMy9BU3BXdXgvYXZKR0gxQVpq?=
 =?utf-8?B?SUFPU3lReFpXZnZheVlpdUpmSEF6WnB1U240V05DVi8vWHFqdnNJRHJpRGl0?=
 =?utf-8?B?d3g0MUtYTW91TXdtYTRXdnQ1R3ltLzlMQklidndqUlE4NGRObVpnTTlFemVU?=
 =?utf-8?B?SDZtaHY4RVYzOWZMaXErbWZjOWdxZVBvUzg0ekpxa1VDSmsySUtNRXY2eHI3?=
 =?utf-8?B?aGRvbWovbHBzM2FBc28yS0lvOGtDYWpVSlh1S2EwVWUxVG0wcEVUQU5JRy82?=
 =?utf-8?B?YWhXZ3dEUy9KRXNBbENwcGVjZ2lTdXlWOVMxdVcrK0tZRmJFMUtJNTNQQkJy?=
 =?utf-8?B?MHdMMmdjckcrS0hBbHFBRE1qSDdMeHJ4RXFMaVptYlhKZzZ2VkJFa0ZJRXlp?=
 =?utf-8?B?M25pZEU3cnc2c2MvTDNoS0lEWW1wcUJWdlVDTWpCbE1rS1FJdHpRZ0xqNFd1?=
 =?utf-8?B?a2YwT21xbFEyek5UU0ttZWxZaTlXSzR1MVJjMWJkYTFGMms4QWhBR09xZkZ5?=
 =?utf-8?B?QjFjako5b1c4UndzL09OY0JrZE5vRTdNNUFZL1JPWnFrc1BLTHZhVmM4ZVBM?=
 =?utf-8?B?dlBMRmFvcFlpQ2dOSGxwYzlHT09nYkZVMnMvZ0l4UVJGTmVlVWtVeUFwa0RM?=
 =?utf-8?B?R3hDSU4vcUUwQlA4bDFKTnlhMUtIbGtla0g3RzZNZDdMUkF1OXJnQ3pOeDJx?=
 =?utf-8?B?UFJCSklzUjQyUnVobk44djJDM3RSQ0xZUzRydDQ5c1JmRjVYMC82OXdqcVpT?=
 =?utf-8?B?WHk1REpIUnFjRzE1TlhSTGJ6QWNmQjFFQ2llb1htSFBTUUsyaEROUVZhT0V3?=
 =?utf-8?B?WTE0WW1xeUU4Z3gySGdTak9pSTNCWTVBQ3NiVysxbXhMWFFwMGFnN0dvblJL?=
 =?utf-8?B?Zm0rRE9EOVEwYzUrMC9ja2psNG9LSXpUZGt6aUhubWozZEdCNEtyU2xZU1ps?=
 =?utf-8?B?ZzVib0FZOXhUdXNGTVZCQXZGYU9kOGFtWUIxSmpLYmI3dFpJTWV2TStPUUtj?=
 =?utf-8?B?aXFtMnRqSjBkWXBuT2ljRmd0SzM3dWhIM2c3bWJsaHlQZlI0cU1RTjlzREpN?=
 =?utf-8?B?bnU3N2hyYlBHZFk3REEvQTA3ZHR3ZGRhdzRVb0xIYlUxcy9sWDBMZ09XU3Ja?=
 =?utf-8?B?aGtDUlJXZWRNTzJPOXJRSXljM0dXajA4U09LMVVrcEUwbDcxTVRITlZuVFAy?=
 =?utf-8?B?S0RkVnVZY1hGQTlZT09oc3RxT3IwWFBicE1UTWxmVlJqMTNiQkNyK3IyNm5t?=
 =?utf-8?B?dUxLNUI3SXUrTithMFhLUE5WRmVWV0pRQ005cXFXSkhOY0Y2elZGYmtRMXhH?=
 =?utf-8?B?L0xMaTNrc2FXdGtNR2ZLWWpRL3lvcjl0ZHRZUXdvSS91SW1oTlpKcE1iTUNH?=
 =?utf-8?B?QmRUQVRSWElEN1M1NitPbFFnckxlSEtGSWhTdEZkN0NzSHFkOUYrY0VGYkdR?=
 =?utf-8?B?YllQZzkwRjBxbjJHbEFxWm1mQmJ1K0F4ekw0c2JiSWs3NWJIVWpqVGNDVjdW?=
 =?utf-8?B?NE5PV0ZwankyNEdzZGR6NG9EZ295MVFTN21TV3FRVmlwTExNZGpQeUpZcmlP?=
 =?utf-8?B?aU14RXRWc0VNSTVmd1VPS21Pc1kzZzFHRU04SGFVQ3RyTmVUT2l0OXYvQm5v?=
 =?utf-8?B?RzNMNUNqbEtubmRrcmErOWVoRUtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xk6rZg/bJ4Rth5Z3KVxurUQVCCw+zZi0g09yBwaa7RVtxr53SIX0tuSLoDELl00TFddMXrOpNFm7q7+YJqsbyXfJJmQuk71HK3tCcY0XSMOrwCsQRc1wPwQxm6OnHuK+R+SyWE+lPRD9hpVd2OHNz29ieXh6lv2FoCdxUSRY59byAfIdkJ0H2qbucWD2hYbR5gkn2WS1WmKwdcr8DV/mrYLpF2xzOHw0Vgpbmk1JTd3nbxzokFSUlMiAJzUks0zU93Z4QfeZ4X2SfzonLNWf72usWQz1Tua4PFDiG3tvXKqtl2IkklJoqRUop2Xgxkv7sTw9/HDNblXAH63snCzQT3DpQ2w+qs2t1KRt6PekznqGIkoaJlHs5ckProbjSz0M9LBtdPJZdJX8LRnu7NX/MxkhfF2FaS/MjRaMmvd9g5/NEQwiycq2VDHdIrWxYIAr
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:15:17.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7ec8f4-8a8c-4e64-0ffc-08de6e269885
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB4775

On Tue, Feb 17, 2026 at 03:08:17PM +0200, Daniel Baluta wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 2/17/26 14:59, Ian Ray wrote:
> > Set `phy-mode' on network switch CPU ports to eliminate a warning.
> 
> Can you mention in the commit message what is the warning

Apologies for not being clearer. (Checks notes.) The warning was:

-- >8 --
mv88e6085 gpio-0:00: OF node /mdio-gpio/switch@0/ports/port@4 of CPU port 4 lacks the required "phy-mode" property
-- >8 --

I will prepare a V2.

> 
> and how did you get it?
> 
