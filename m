Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C913DB9F
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 01:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855023; cv=fail; b=AmZIZbwr8BW5dtlZ1JJDAHef6GiVUiUU1DSW5MxzaLNFf78/U6lyBNJpl6+6KHFw92xdY7O2jWZMmyoEAFBaM7/hJdKkzvpvYgaGFDVne/kPr3BRVTSrVIZtRd1hUW4FFqylzCXraM9tfzmNxkwVJ2mPZ5d3mImxGKd2FsTGthw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855023; c=relaxed/simple;
	bh=CyvMaKVh0MvupBrFYgtF/9SBoBgPjky7WmShrSsPxiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K+cnD/O5fjNBMh+BTz9pqxTIxnrLn7px994xNFRBBhnb2WqqY5HAFiZW78elZLy+ZGgJYvjDR1Nsve7XmUBcKZcF0HToIV9Q9+G3CHlqXFr6AH2lzO/dJHdnqxnCzmDdC/xMwtG6bZDuGd+IeAVDsyzHMjth9US9lb+F83krkZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hTeqkxjS; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hTeqkxjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWQqgdvRrPUW2lUChBrWxnk2A14QERQIgwtePSgLflo2mEqT3Uwb+oxGhX0MX4HmYrHr+b24vT4spRzLv2ZehDie1IFHeDbMJUzlDDCCnqIHbJsMkoLMT754xHjFYhGCS6Ao1KE1BS8AHqWGUHkr6nizwWkUWmxZWOl+ZT4ns0kE55eEH4n43ajvcYUSAph/+Pa6kT3Iyxd6jkhTGWwWtrRlh8Ht11ghmHDS7oTiCLl2R+uxcJZ+BsbMDVmuEeWBnEORSRWRiI3CYn65eaTuSe4wC6ypVgHc5um98e9Uu4gEo/lC7QECYnjLZa2/9iiDCFwIzzSfefGhEAAKGKqd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZpwAzrSxGi/dLluv7xk5tV3z3KMO/mh0/wxydzNIGA=;
 b=fvZ/5d4HaR/wOZWjBVyMupPxWOQDvZ9LpKC3RBd2I0LUj/E6yHBOxkW+hNbh1XJ1i0xzBFvB/xIwiNlMuHSWaiUnLYnukDSyJGRIBE1o0ZpA9oYmMWEJgPbNzugdli1lbY5c3Aof0IXrxtmgZRXOugZvLnr7zfA2eklPMTSvPQLw+fdXH5eueoOtMxTDuqEcMzTfo8IWx+oac3koHDiN9vFn7KiI6iIo0DHwTanCRs1yKbwa8dSDo2jq6pNSHqsXVbCzrGCmApbWHfKjlXUrNaFdyvU6Yvy4aLkyikMJg5FWi6uH7pxvESO6MZnTIKEDQVN9hfUClDmWFymICcTXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZpwAzrSxGi/dLluv7xk5tV3z3KMO/mh0/wxydzNIGA=;
 b=hTeqkxjSlBVl9y3QVJZ651qojVwA1yNFzhrkkYlPyztNmtnY+zQMPuTeXEX9glgL9LU84IiWw2g0KY3XZPCRFHquW025Nj5UXGBGEsLJBgNjtz7KLSJ0wd8EuSLVxVEVNDR8rqklA0Y3hx9taA+j1EpK47UhVQWwEVpxK93QctxqNM66GeG2DaItJanCqTh2zcPsU7DONu3rCI0qW8e8hBKUFeFZbltKRnWTSbJMqqQb3yfuV9aA2iGaFIpw0dSsZryuE+kmNFs1k2Ym0tO5nw7KBqyn0dINc23SBbDMVVVtafafrjxV6UKQMHHb/XHdTSDHmQlyyidAfXl4wrpLfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB11213.eurprd04.prod.outlook.com (2603:10a6:150:279::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 01:56:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 01:56:56 +0000
Date: Thu, 17 Apr 2025 09:53:05 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: extcon: ptn5150: Allow "connector" node
 to present
Message-ID: <20250417015305.trmoqaerhmc3dhtm@hippo>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <Z/+9TFLcIBXvlhNY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/+9TFLcIBXvlhNY@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB11213:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea03939-2a11-4b92-9402-08dd7d53220e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?715rcbdnuDhcibZgnquY+mCHN/sDnY+Xp62WbPfau8UmM6fsIgZvFgONn+1E?=
 =?us-ascii?Q?Q57LZ4VSTiSY2QC7+9SrEtfvRQQo2kMUd48HO8k4JB2ka9FpUQTrPjhKugO3?=
 =?us-ascii?Q?OsUUzISjB82wKHsYosP/h7zDnD92uL5W7dSLhzbm6FodVjrFf0NCpWP9XGgd?=
 =?us-ascii?Q?OERMBn+i8eMCfQqQeu+FewJGFr3YM8835PHOiRop3csvmtptEElR4H7KlvcO?=
 =?us-ascii?Q?XsLs3bhG0piBZnyir6HaG/9hHrQcfyeegCKo1qcxocsTdSWEEVJORAtN6zQ1?=
 =?us-ascii?Q?qj62gkh3P3zygt/HqPIITNyenCiumhS1Rg1UIMtKumjwNc4U91mavlo7T9SV?=
 =?us-ascii?Q?E+FShpe9iflyH5ALcAa1pnmB2FPRGUB8x1V1SaEmFi+3IvC5hbo/nKP0oXku?=
 =?us-ascii?Q?LUcP4O1tpZw1I0ax8vIugAdH9xXjJ3YHGu4WMkx3J0STCm05VYxUDCJOUsLz?=
 =?us-ascii?Q?Z0pVkAzXW5ZmqtWCYp5kqWVZSaxBy4oPIxg/d9NeJpoa39SZLZU+2EbO2w+a?=
 =?us-ascii?Q?48v5sZloZ163kRPWgHs1GsE5DbWyUyvnZ2oPrt1QpS36YvNeb3IQ4QtQbDw3?=
 =?us-ascii?Q?pezAzYi9ztJt6ZsVNdcX/bZkdXDQv+n7JIxUQ3eiz2A3U/VrYv03WyU6pYgk?=
 =?us-ascii?Q?FxveJcOJ3jj6A8wHpfjYo4K5tyfbQgPKK6FQkhNnLHpx5doVm6LQCsuuFmEw?=
 =?us-ascii?Q?1rJXdyFcnYkqcG09wP0rFnYEM+iWF9OTfz/6+HIyddvSqQCLeAqGDZ8EEoFj?=
 =?us-ascii?Q?rJNbQFLSr0WBzlQMjBL/ZWBFFwM2XYB5XUkQpfXYEauIKwN4Saj+voGuzU6F?=
 =?us-ascii?Q?7C9eaPph09T+SYELG4Qt/7VJz12RYFTPqqV0Kstpg1WSH0Ak96BIeurre/71?=
 =?us-ascii?Q?i61EZX3XcrAx8itZIPYJUcoC3cZy7pnBFaXLpvJ7ArIQaWG9L8wC+IxwCHsT?=
 =?us-ascii?Q?oFqCR6kMoudLGPKM1k2uRHq6DXzA6S9EaJ1yBbaXEfRi/yDR83mYN0AYFtKA?=
 =?us-ascii?Q?lE71yvTA17TAlbSjlGFfEalsnZzvVHMLu8h+K/y8EVLpQj3VHSKRl7tf29ao?=
 =?us-ascii?Q?fd7RELk4pjPDw2EJa2W3B5VaZAit5EE1zm7Ypsd6BRcqOvEo+rk9Uc8f1SjM?=
 =?us-ascii?Q?Sp/aJvFDn3vshe2vXZu+zzdF0vBD1BcyzHYZw0ry7YUP9brqV7THlBihnW3k?=
 =?us-ascii?Q?au0zulQt4sZTuOaqapLK1z4bqI7BhRfbhK1s6mYemqI5kkXVFsld6rjWOMNm?=
 =?us-ascii?Q?8h7SfrBprzbxCTlTGiK0dJcRk/G7E+dSowzRoMB7INNNjC3UuOOEX6hMiZy5?=
 =?us-ascii?Q?pBqQB/CCG4kTts1D7ZuvvR0FLmESCw6Pa2GhFPI2kq94IULM0z/TaQHcunnM?=
 =?us-ascii?Q?eOyL7Is9qpH92QPYvaoZKTiXjY6GjO3D1CUYYedZ9aNoJCSKHrwQztIK5aAV?=
 =?us-ascii?Q?5bcJxQ03hW3UsIMixE4bD1ToAzCi/7lwTcvMyMkomw44lD2AflznKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fESdSmwhs1A9O3ikVvZvtdmrWCd3HPZc0w1hvUw3pO6bjv1RFKBvXUixZ3v9?=
 =?us-ascii?Q?NbuqrFJmKM0yFVJdCwmsGNPeXN1enbpJxl8OGfNmKLgVkBtvobGPMN4PH0tq?=
 =?us-ascii?Q?CaGgFTQBF7MK6+bNGWoPpwEEgtqGiKdAjEVimu+peYxHFSFzvOQr/0HMgPAI?=
 =?us-ascii?Q?vg3umQBb9KYr9My0snumoMq1IfDS0YihqBJ/5pss8rwEz3Co9tR0FKkT87v2?=
 =?us-ascii?Q?IAJhLQzS27DficGEuJa6ZprCy8Ay7QUBwRZ/jCyg4aBENYoURZWHEirdW8cm?=
 =?us-ascii?Q?BjK3Y89FjyNs43lvWzM54gaItESkFHKW9YfNKmoG4ykRBOB0JcMD0fVjHNwm?=
 =?us-ascii?Q?os//aTRnAAj4XDEunUiLq9aVRcyMxbfRqHY0mn2aUG8VyhX5SI9QHDKjGGpE?=
 =?us-ascii?Q?xgUNC9nux41ryogH84L/Y54F2nOa2GjXML5xIirMCcSE6J/z3pSXLB3DyusD?=
 =?us-ascii?Q?1iYL6oQrwph5Ey7VeO75XxVKSvkpeFByacRM3kGWkoE9J1CaBEnvH3dVbepv?=
 =?us-ascii?Q?+jxBO7c43D6Q0Z0lmLMIpI6UVwb47j3vg0xjAnR168PUFEhT5omISVgOVXYv?=
 =?us-ascii?Q?YUteTg66A4T38zbK7+TQ/uq7Tlv+xwKfyzRZ/i7CTGQZTBOfhq5KoCejaFgw?=
 =?us-ascii?Q?VGSEg3MbxmKZrXJ4un729I/7cHjiVDRApi7D+ikqYlmCqDjNemoOec1a09ys?=
 =?us-ascii?Q?p2VYAYMIqC5+ZOvG5wu5hJhfklH+XjWgsi4MXHvsNj+Fgnlbd2M+95B3oiev?=
 =?us-ascii?Q?Kfioe+ztWwC3ZVNAw4ea79/ODH8c1pxJwK4UmfHmGlauLDCDn6bxaXpzCOYh?=
 =?us-ascii?Q?kD7MFYlYq/qJUNE3UOCdgtOFUl31Somxt8fhNlig1jshmOqasSESH2QEklRI?=
 =?us-ascii?Q?VbuKjE2Vcbcyhb8XYo6XAmM1OppeUEHxD6TZK/zYJelqpljfkHE5RPwHgQ/M?=
 =?us-ascii?Q?vdLwMh4FLgD8hfFPb5oHvP5f59XEy7x8tCfeLjD1M1ImTzxhHdLhgY7Q14nD?=
 =?us-ascii?Q?13jSaZLDq8G7iwlVmOTXY0CpBFgmKaXcdFMzOQX6C9/k5HLQehCKfHTL2iFk?=
 =?us-ascii?Q?yjEc1ebTWHr6nbiVszRGmH/aHywMeKDEvPiRp56fjhA1aD8XIPUqRzkpuVSV?=
 =?us-ascii?Q?1gWP/hT0zNh12uiQp6o93vk89pisKaOkUlnB+RgsEPnZQ2oBRlrgKp+nnsK3?=
 =?us-ascii?Q?fbNFkLO37AyXkiUCWL1XEVquQSBbaB1hIQg3X+ttsAykobZqGFMXW3nUtBqZ?=
 =?us-ascii?Q?sxtEVV8TeW5DiX69/SpIBlBVg5yaCLaUNCUukLmCUI01MVe82FTvUNQtXHJO?=
 =?us-ascii?Q?FmKg5BYjewV5fF5urCAxcYXKlyoKEYK5K6VBqThn1O1lIn6y4kg3OpwT+DA6?=
 =?us-ascii?Q?4EqOqfRjBuLaZwlEFJmYT7tzp8TyeimbE+6N2jegnAMp8dneZ98yU7GyJn1v?=
 =?us-ascii?Q?YVqhMXQDxbj/1e8CNItc14uKvrEq2GuQnnUBzXrzNxhxHOAdeXkNSH0OXmsc?=
 =?us-ascii?Q?hinadwYwactd5TpfpZ6J0faxAl2zCZ0bt9VETR78BwAgmCS2kkgyVU4oH1vJ?=
 =?us-ascii?Q?C42el+orOuyb/HrCQTLk+kz3QUH3gzzR+YCoZPi4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea03939-2a11-4b92-9402-08dd7d53220e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 01:56:56.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usp8JhOYnC4xJ/V0r8zdebE8yBAVdoB6qrhtYbRywr1deo+/b0BN12YIgdzzrDfLqgNe0RKuvdzqFLPkystaag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11213

On Wed, Apr 16, 2025 at 10:23:08AM -0400, Frank Li wrote:
> On Wed, Apr 16, 2025 at 06:59:38PM +0800, Xu Yang wrote:
> > PTN5150 Type-C chip normally binds to a Type-C connector, so allow
> > "connector" node to present under it.
> 
> Suggest commit message:
> 
> PTN5150 is usually used with a Type-C connector, so allow a "connector"
> node to be defined under it.

Okay. 

Thanks,
Xu Yang

> 
> Frank
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> > index 072b3c0c5fd0..79f88b5f4e5c 100644
> > --- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> > +++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> > @@ -42,6 +42,9 @@ properties:
> >      description:
> >        A port node to link the usb controller for the dual role switch.
> >
> > +  connector:
> > +    $ref: /schemas/connector/usb-connector.yaml#
> > +
> >  required:
> >    - compatible
> >    - interrupts
> > --
> > 2.34.1
> >
