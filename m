Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0B1CF93
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299697; cv=fail; b=DifpHu/2BkXwXvoBGDSYxtYjykU6KjJ59QCTkJ/ljCp93BWCuEWhIqRyzOElZHqBDLGA60+2TyPx2IQ/t/4oe1vtofkqrDybRbIPQqQ/eC6bhYccWmA62LszQ+8IyPYhSoP+oMDcMOwNK1ZVxe59YTc4w/LvOnLsGpo3qm+S4jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299697; c=relaxed/simple;
	bh=PCXDmWzZ0SNDLFBxG+g9u2NFv2w/aq0DWc4l5Qx1+HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M3abXKw8sQLkcLAdpRxyOY6ti8X/pm5Z2aq/ahY4GIRnePUXj7L7amExLnITI/wec0wmpzotR8i8GjzpsHwCOUCJC8xRsmVsEhGpWewGdRdvKsN2S6Unm16ojVbiVPa3GK+t1isjwjf4nB/irjRDvmcomZV1mKBvizlHBu5tsiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RbTvM5mv; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RbTvM5mv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+rwgkTWJQL0QGsI6le/q246dwFEwz8FtpyO15ULhfl+WodO5EeagOekpCNrS/YC4TKwMhyjwJoAHxCtPxIKdlbdjyJo2U5OZErHQZxWBLjAY/g4Rr6LTw6DvwX8w0hXVbgvuxZszOw6GAmCpoFrrrsNkFbMNRwmY0W8jgNSK1QI92QD3Mxs6T1MRfnBnk+ak63bdV9CVqnWTzBv5HgEztk1G8WO6S93UZCR9B5IcyR2MdaxJYGTrCztroWNtpgtBdQXQSWtUBqfYIGITUPHhG01Vd/Q9kKdVS55Bg4omSy1Zoh1fdY1n7OTR9MMshOuVe6KVkLEdHJuKju0gNU0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPMeGZXTNu31Yqcii/MokH23LTsOrehpmIcL8Y4DdKw=;
 b=RFZeSAOUPvoLkxcsaZZ/0/BFp+SDK1ve2p7FmVbje67T84yW/ex0z7lNhI7j8U64xei7ljE2qtMU5qgp3AYnFIMYqNBD04ppNrxpbznmIpF56Kvr9OZ3Gibe+IGw8NPw8V3TgpqeAfIMTQG9IGoiEyCcf2dnEHSChOobR3+QpnLHe13Sq2MJGL6OjfQcieXDwESuVCHBATINLjzNUyiCkkzx0I03j13megcW4Cq97SKtORTZc60xcE5sXvrX5rkwWWQCtfQcBDwOxOxcjeWy2lHRbzslibKxH9E5gXyeXy1eZYXMAXTlYzehB20FDEvq6G9/i0dVb99Dw4bcC9jYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPMeGZXTNu31Yqcii/MokH23LTsOrehpmIcL8Y4DdKw=;
 b=RbTvM5mvY2XCZFC9poQKXzt4RuRcqyT/YoH549034xf+tdNN9k4WYfestKuADCvholDnERrYvMRTm0iPDQu+v1Xi0iuNrBZJHUuHbSf9a9lKu4QAv2yzZjhcUFE/W8kjFEX1TeYuKNDZ5nVI894ylycTGz+zB+yNBUOsWniDjCdPPiOI/NmgIrHT9hesQS68QWwbnri3fPRIe0240Xvwk/0t7aWfwdkz/QwYj7qak1Rb2VZ/DYPWJ6flKbM2hL+iNvQ7VJVuB/HdrPuIQAjkOcmw/MdU5YAqPgJOcT8WccH4BXxzvQ0nuYUAMESSpYBnYP5L6WvXxrRSzioGeINJvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10226.eurprd04.prod.outlook.com (2603:10a6:102:464::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.18; Wed, 25 Sep
 2024 21:28:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 21:28:07 +0000
Date: Wed, 25 Sep 2024 17:27:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add DH i.MX8MP DHCOM SoM on
 DRC02 carrier board
Message-ID: <ZvSAXAXeSUdPu2h8@lizhi-Precision-Tower-5810>
References: <20240925001628.669604-1-marex@denx.de>
 <20240925001628.669604-2-marex@denx.de>
 <ZvQ6qWMAEZaR/5pl@lizhi-Precision-Tower-5810>
 <08b805f8-a4c5-4aa1-95b2-66292a681aa9@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b805f8-a4c5-4aa1-95b2-66292a681aa9@denx.de>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5007d70d-0bbf-4ad6-353b-08dcdda8f27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WldMjlK3HeB3h9ERnSAjCGkWmbDUDZrjmGYH8YBlhp++6kZ67kD7TzCMCfnP?=
 =?us-ascii?Q?7E+rx4ZBcUo3j4H3AFGu3oFY2j2DxhC9TLSZKxZ0Z9s8f/id0WAFKIW7XYoh?=
 =?us-ascii?Q?X6+jSmm7sku4hdSzkiishqVqobaTFeZ9sRQLwNI5bTsD1lpV1Fbj4z6r/aes?=
 =?us-ascii?Q?Yfhd9yU6yTn7sgldDRRtxwq3umVknLFjBQoO9t3T4h2BTLDAyl0nKLd4uPcI?=
 =?us-ascii?Q?ygMCawvR2x0tfL0DDtpjS2G4UmRU9p+N6FHVFkJMBhI+RjtbtgxuSTz8Fv3t?=
 =?us-ascii?Q?k4vTKOj89iqYquKURT/KfBUbM9XeiGudlw7r+xunuxpm9GUiPlNhFUG4rdKg?=
 =?us-ascii?Q?r2H87ALr4PjdGgsiR0yOu3DYbVbyRLe/PNc+qIm5hX6CefD+L62cvXYWR7HO?=
 =?us-ascii?Q?Grh3TfpRGGhL/zbZ4xFfliJ+SxIjA0M0UufYPbnRBDRawIKnnkKAoKfnlu8H?=
 =?us-ascii?Q?Eza5+2+eerS/G7egsYFCBFmJvbmyOphckgtS93LbQq8R7uZxLHNdc9+JoYcE?=
 =?us-ascii?Q?Cffmkl7jiZFNsVcu+/VfQQXaQK7BnIWLBhA0mfVtOOKi4phISRrdqUeGQnpU?=
 =?us-ascii?Q?wQMy1jIVy5V+IdHu2kZ7iwGNhoL3BX/39w/5lGVUTqSvvez6Iwuj3YsCw9qE?=
 =?us-ascii?Q?qnboRSKCFpOjruNrB2xV14jr/GecGefvO/WGW6mKXFO7oDFUjDPwC19yroBx?=
 =?us-ascii?Q?qaYC/q5V5ZNlFcZLhPJ0+3D8A6FWxzIghmaeCD5pWlZGna93UVwF0sOCckkX?=
 =?us-ascii?Q?2EQCetwc4CjGA2bu46Ut4F4d81rCx+v/s5LtQKptA7tK3KOjYJ8UZsvlhq3O?=
 =?us-ascii?Q?otgybF62XuD3aA9ez2w6XnjSl7Wj5VqCiIJM0Zf3m7ip6jb6YL3myZU/hZQS?=
 =?us-ascii?Q?KITbGTnJMrNR+wiIrLevWnPZ58z3BV1myBMcRTyCy6ftot5w8PKtlwHH2Mu/?=
 =?us-ascii?Q?lT+o+wVHDn6p7vGYZZX9DTpwWJmw3WKc5FaEmr49kLD073S8xTh1rCecg4f7?=
 =?us-ascii?Q?YY8HBf3vOjIJ5KC0dD47qbqKqLMn+VcKm3JjebuyhmXorhDN5Nq9d/BFYsq2?=
 =?us-ascii?Q?NR9tkrz/CiZzE0LWASqYwsepluEAkXaAHTMOJ7wBMP2vWJIB9EkPbisxpJK0?=
 =?us-ascii?Q?Fy0SD/ke42BVg7KXG6fBIX7Rrn7H+q9ymTMcGBe+B8pefgzshfOad1xwNRNR?=
 =?us-ascii?Q?ETQQoPd9ZiHfR5CsaaqQ3xLP3+2LzAmxai1DyZ4LZXhtg+6aM5C1cr0jF5fS?=
 =?us-ascii?Q?eiaJx2aJJ+mK8mKVHw8vNr9/0vexM/15mgL+PS+kurGqN4mcjUgB6A2XWs2w?=
 =?us-ascii?Q?IsJEZZN7JL8Jd+9a5d8TEPiIVw4sXjnOgNqiYBeFubJOxBrXj+2k3h/EOKcm?=
 =?us-ascii?Q?s3vVfzp74JeP4+/9B1k3GWNZ5+rIT4pLenQbBBIW/WJ+qbSD0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ru0NjeQxJJw41ChR2I3jGphDMJXA2pjtJBY5o3NzHJ9YWbdToYxsKdvUbGxq?=
 =?us-ascii?Q?DBykFJGzUrNKAXH3qnlexsjZaozJ3svlWQKxBHqwstwefYc/a+K+P+zncOte?=
 =?us-ascii?Q?9HpgH+xeQBZ6/LyFjFviL/SUeEZqi7/JVq6JEloeTVT4dy21Z3Qm5WjLXwCO?=
 =?us-ascii?Q?PEYGXaXGsF85TYJfT36oa7g/yyiUdbdcQEryiiEOsn11FYJAfcf7ErS/cQRR?=
 =?us-ascii?Q?asX20hJrZ6vNplaj0eIGeeWgs9fOTPzSlZOWdtYqgdfijvh+fWzul8OYaOOH?=
 =?us-ascii?Q?Xt8eKYghmea1VRdEftguPWNTh4+N5+W/XYVBN7ejrPlMLqViL9s3sNEC/LhL?=
 =?us-ascii?Q?eatxfV4/AoMq4Q8sa2GmwfLKWfupf6n7W4bTVZeuJy65MDChn23DVo8IZ4tK?=
 =?us-ascii?Q?rhKjUKQNocLS054oy9raHEKP/RkVS7CgCyWr4ecVmp/NzvItdIVkyquqPXWI?=
 =?us-ascii?Q?KeDZr1uzdMvqfUWVa08W3qHgIQHYtUWtahIQxRBKX/+1lgcBUN9V2/bwgX7r?=
 =?us-ascii?Q?NU+GhNlRPB/HPAAkEbk2hdK3hAzBxI4QJB/clZ/LaEwjQElcd4i8XCa9k2OG?=
 =?us-ascii?Q?vVwB8hg7wkm8m2/7JjZt/uJd7/UXaxcrPPBU/Z7rczSnZ7tHyjV/CO9MTlIq?=
 =?us-ascii?Q?b7Ru031KPYmg2MRWmnM4jrVn3ywKvZbvE+jKtZaYKnXZvGKh6j9dKIkNP1HU?=
 =?us-ascii?Q?1P5KH58LjsfG1PUODTcUxHAkwrqF4rfMeVj69g7n1bkMjpNbHT4EiXLD8Vua?=
 =?us-ascii?Q?Q197lGQflD3vJ+QDVHCpKfa4+94sRNuE1RzZBk96ZOfcpejX61wDWghYHdws?=
 =?us-ascii?Q?1TeZfAEzJZkYCTnYPGiuQJZfL82kCawBh68h5IQIx/XGr7Ee9ZnELaKODSV1?=
 =?us-ascii?Q?C4ce2SDmbTfR2Py2cvXOeO3ofZoWDncuTdEMW1I4MCRIGXla9Ys3eZ55PbhA?=
 =?us-ascii?Q?fLXrOBh67algWQSRMptewHZNnmj/iTMIMGZEptgRKI8Ck+4QWAMjzGhmoV08?=
 =?us-ascii?Q?j0HjQWhXMIeHM3cPBoVUlXQVaZZquqjJqxbAiTSTApvJHDuQagJSLJXtwFpd?=
 =?us-ascii?Q?JEZA5Ab5RNYLV8jzYcv5wJyrtloxoYyPe2y0H7BzfVAEZfwu7hsg1Nk97Yky?=
 =?us-ascii?Q?TgF/Gng2beYzeDhTCrATrNbTfDxwj3jy1XF+Ksh/tf6cas8j1CEJD/SEf2uq?=
 =?us-ascii?Q?wYL6bR91v2Hx1yorDTO0Vf+HUB0PhWm7oqUEEIAEFRqqN6XfxGaH5wjgUxbk?=
 =?us-ascii?Q?ODvTxdf4fZGfpZWrowcnkHYQmdunXNA2F8zW3H8wmFpzUqp5M2X8Ofx1wRM5?=
 =?us-ascii?Q?GPowEqzLqw9AjsPIVwLuiuaZ+GKuith+H2EByVpOB0rp7hvAufZ2AJYi4RE+?=
 =?us-ascii?Q?fAJvnA0h+hT0NrRmzn8CLsSOdrPsfc1n23QE3w+S9JpdQZAGZ/RyVkNdWEkK?=
 =?us-ascii?Q?i9n/1AuA7I2RMzWWshVCIi+20wprPlNCWIkEBdV8YZZHm+ksSmysphGmkTHA?=
 =?us-ascii?Q?gLehcfqa9Rn6/N9qXG5Q93YIA/q6XQySxhAQYfnAkpAeW5U4DvMXiHr7HlKD?=
 =?us-ascii?Q?Ek2b+tYnNR0UiOhOevw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5007d70d-0bbf-4ad6-353b-08dcdda8f27f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 21:28:07.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wocpgg5/WLFJtlAn2J5bribBEQPi+QBJ/Uki24rgsontiNT36HkIRvBf1MlgzjKymnQFWwhrO4KshvUztXNEIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10226

On Wed, Sep 25, 2024 at 11:09:13PM +0200, Marek Vasut wrote:
> On 9/25/24 6:30 PM, Frank Li wrote:
>
> [...]
>
> > > +/* USB_OTG port is not routed out on DRC02. */
> > > +&usb3_0 {
> > > +	status = "disabled";
> > > +};
> > > +
> > > +&usb_dwc3_0 {
> > > +	status = "disabled";
> > > +};
> > > +
> > > +/* USB_HOST port has USB Hub connected to it, PWR/OC pins are unused */
> > > +&usb3_1 {
> > > +	fsl,disable-port-power-control;
> > > +	fsl,permanently-attached;
> > > +};
> >
> > Suggest run https://github.com/lznuaa/dt-format to sort node
> >
> > &usb_dwc3_0
> > &usb_dwc3_1
> > &usb3_0
> > &usb3_1
>
> I'm afraid the tool (I did not try it, I used plain GNU sort) is not sorting
> this correctly, look at ASCII table, 0x33 is '3' and 0x5f is '_':
>
> $ printf 3_ | hexdump -vC
> 00000000  33 5f

Sorry, I have not run it for this dts. I make misstake - and _ at ascii
table.

>
> So if the sorting was correct, it would be:
>
> usb3_0
> usb3_1
> usb_dwc3_0
> usb_dwc3_1
>
> But I would prefer to keep the controllers close to each other, i.e. the
> current order which seems more logical in this case:
>
> usb3_0
> usb_dwc3_0
> usb3_1
> usb_dwc3_1

next time, we should use better label name in chip.dtsi file. I try to
reduce trivial node name order issue in patch review. And make contributor
to be easy to follow.

Frank

>
> [...]
