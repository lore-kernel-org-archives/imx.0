Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AD515996
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902869; cv=fail; b=jiDioRuXFu27FR6C5ZyiNLoPmnBNv3mMn1N3JoxO2egyR9qee7Itq6k9alquuY+/EvzgMZs5phdU0A+h0Uyvwr2gBS2yJSPHgm3MkQonTIu9P3+s1IqPZqIJz/C+2ncWpK42DtKGQaLKJEUP/Ct2now8ixopBFq8eb6cRAIPkOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902869; c=relaxed/simple;
	bh=5AfHKPvz7FXaMmhMFjdTteRL8HNRGJfAV/2QxuQ21dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T0mCDH+apfDBtcLirpXuS2zKk4XBm3Ykw3PWbNkdayOfZG0NBzE1/EPTJCQ5IvJth/MycdhCq+7PwqHS6uT+zjJqA5xyA7efQtC9ZlDd9HR9sN1o75xfiyKU4pRCJWQ0xR6HONjp2SqomkeJkwtRLMfKrgg/x5LTeRg7SzrTVsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EwYe+col; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EwYe+col"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXN5E6mSe3TnNwZCN1J3PpMzYsOTfdyIIN1pO2cR1RASiWOHy1jixNxk3iLmeIirzA4u4a4qbkNTM54zEvHuwIJv417rgXMGS1ZXrnbSK6czpXD+DbPVZg/OBG3npnT5N7WgpEbJec73j2Qxb5d1MKnSCROMhhcZqJCbR8MneVrT+Bl6nSFYWOts+N5YYJVEq/EJNlVvjo+ZZOkuD8twNb0pj6Wa4qVi4rGLyhAzhs/WM3liiOniN6KY6XzwtjN4svuCZkp4gXFaM8AWDgK1H4lSCqcdXUh8agrIu+HrQJvaP3pFv880jsZF35cdWZjejVXdSNfyB3LT/H6kN1iwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AfHKPvz7FXaMmhMFjdTteRL8HNRGJfAV/2QxuQ21dw=;
 b=CGR4Em+AY3QFoq+N+AE9aklJ84crua0vrtE1x5yr/35+uWhT0dQ9cKvsFWaUEA1A2CawelPeHS4tTQiwI7EvFkhisOhPX8Pkuu/uvqd4OD75K69+ES2HYSJ42CUM/d/lLq7uV3bC1Qaxh77GMVKK7GS39hLC1Y269WqhNPLSSwp9p2Orpk3LWwG/qDhJLaUjZ3Sj4xYJDATqiMjeUCyY8sQlj5QeeY+OdzLwW+Opurv3QkCivZmqzGBsjBmF4/Vm5OwFbnuz60LFSSGfXmJmf8SWqX1OAUjC9im25xXAK7Spirll5gMgDrsk++o1OVYvODCuoKeV5QkNHZZ74zH6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AfHKPvz7FXaMmhMFjdTteRL8HNRGJfAV/2QxuQ21dw=;
 b=EwYe+colAK0VY0vN4KKU+Iu3tw37LtZkdoRGzRdaE8oH3eG6D18loS7pbrPHiapZGEUtEudKeF6b015bZzUr69drHUeJK694NVkX1Mrq3tlGt+Akz8xRO7HTzrAcp21I3JprB4DMO3jtacZLZS/HHt4DceKkEiW771M4ZyelSrzh3qNOvl8spmDMljbQGs/MwucrL6Bb0YUy5zLGsspaXU/VqhLoEUU0jSPGX7YatkkktRtyM0gjEW7xzZQIOO6brDMUZvPZ+FK7smXvhD303x9tajVW8cEbfTOi/5qnTf0g7gdmNZsxOZZ3IV54k5U46VOuoSYwhOw8Z3k0vfqLtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB383982.eurprd04.prod.outlook.com (2603:10a6:150:3b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:47:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:47:45 +0000
Date: Tue, 13 Oct 2026 09:47:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ming Qian <ming.qian@nxp.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [EXT] [PATCH] media: imx-jpeg: propagate encoder command errors
Message-ID: <as5Eh10VGuASuixZ@SMW015318>
References: <20261012141824.497906-1-thnkslprpt@gmail.com>
 <DB9PR04MB979186D592F056313CE59920E79E2@DB9PR04MB9791.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB979186D592F056313CE59920E79E2@DB9PR04MB9791.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:510:23d::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB383982:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3fc670-bc8c-4fe9-183a-08df2938f106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|376014|366016|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sxJJh+OKgDJSv4U9PNUuYtMMTMEXaqIrteAQh13Qc6MEOCYKFxX1n9Bz4IAOV6rWkoGQardYqBYTOoWu+2qa2wc9n2MCOKR48om+YOtdxqAeqUnDmjeM4XPzH9U4IKkvgIzCA6f+wRlTQblzfnlvF7snE7Sa6lNoOqHZwObFgh038+sVVWNexm+dNQRuxmaL2JVPm8/KXcWnnbKaXYMJ5U4gKnpUJV5JboTHpPIY+qAX0O7tHoIRz2Gcpm5WKp3EnyDRuhNmHY4OL0mYtcTkP593+ZUio0blDBXFZcbtw59mFq4KkTmkUv2/tqwfbSP1D8y04sOFN3m8qoCzsxhJizGNerdMS6TTLNOp4mt/IkDqpV5JT7HCd0tqeb3njeU8gl3BtjRHkJ628PIU7QrPnzr/oyiGp8GODHSXQortFxFo2AaS/AP2Vs1orbFOS9gm1SqYFeG5YovWyDFGCy25ogKmQ9nHj8QiIxp/0P8YxoqHBoKZicT7Hl+orKOaYGFsqTFy3X90tLe8h8SKgYLVGvArHtMeOmOaCu54C9oWN/O76Xl1hmwnBKBBlgLOsti9cVaLinANLdzmlbzKFfZgXdcqhnp6yxSbME5rFyZjuFR9XE79uOPmAsANXI3QKxVWavPoQyCfnMaaJ0ieVcu4rsohDaXACiEuMBjrEHa9oV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(376014)(366016)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4E9XCLQJHKcJam413T2Wa3tab9SfaFCNuuUvt0EzuFS0ak2axF4eKIeAwwyK?=
 =?us-ascii?Q?NROgKrCePoWVfE+898GfHoX0onUKNt9SvHHSeJjTIOldnKfy4V7c8P1nCNXe?=
 =?us-ascii?Q?AgtPMfmGlqTOfta23Ix5NJpLFtIU4UxAdu/wvFA2dkNyCFfb1uUisT6rZZVl?=
 =?us-ascii?Q?da9+cx7ufjXCQLKSpFrocAHbmVIFUQyQyhQkzdxBMlYS4lzOTXEoL4lU+VNQ?=
 =?us-ascii?Q?a/v5JlpIFmTHop8b0vnllFP9u1duLBhYJhN6D7pNl0KnyC4BPkW5xzN6FaVz?=
 =?us-ascii?Q?gq1b334HKnM0PLyCr/xoB6QmT9jRLnl1V47TLPBbL5+hXi8v5RUuJh5KjdEt?=
 =?us-ascii?Q?0wXqk0/JwZx13Vim5FoE7SXjqv0HE9KrEXk/JrAFVt+O+Jqup+nPpb/g27RZ?=
 =?us-ascii?Q?a80addySxKcQJTrd3x6leKY32xIrKFZhRR8ZS0U1+Ugh4vDRqfsmw7/YLmmh?=
 =?us-ascii?Q?u5yJHEonob+xQ2KQ4SoDsqSSQuwyXFX8v99/MSNJeu/H9aQa1w3YFvb7YMJx?=
 =?us-ascii?Q?ptPhmzf3OhK+1Es/yfKOIOCjmM8bjAVi3V3QqKBxiSiAdJ2uvs6MiTtQswGV?=
 =?us-ascii?Q?sjUqSLsoFhMehvLUZVdP/Aif/fJOWtF9FhyJTJf26lFj0wLbC+heL+NNLusU?=
 =?us-ascii?Q?Mv5MQBGDwUp8FvaXCXUMCmDREqbowznn1WmPUH83m+5B62hwW+qdk6zvo167?=
 =?us-ascii?Q?foJ2lxBEJ0xgmPjZ+Vebgk7iirHDGC/YpCn+rFJg7JnczvPPWknLvsM42+pI?=
 =?us-ascii?Q?3RjBS59W3pLRP4OGHvmpCjNc7EkFtTjk2mrOGDHhw2IOoiPmesxxUSgDFEEj?=
 =?us-ascii?Q?v5vTnyDSpAIVKF0WlZBxZAk4xLk6xbVDjcp6TsYY1w0+YG6fu9QueDrHAuY1?=
 =?us-ascii?Q?DpnxEqfe1KLquIeC35KPEOJTGmwY4OIm5lvk5SL5cDvgKItz57nqVs7N+aLP?=
 =?us-ascii?Q?w6f6NRkTbh4YUj+DugDZf628k2AUi130GytuQJbOPav9CiUBvxz8EO90GYDC?=
 =?us-ascii?Q?t6EdcjE/J0k/dYEE1iCCY793NORG6n4Q+TRn5oPk2cZK1TDA7X71HpvGIaB4?=
 =?us-ascii?Q?vvFhwq9dmXhbp42lZyc8jFrsnTpO+WM9DP3rN3oZ3IvGL9yD4P4L/oubtko1?=
 =?us-ascii?Q?WoWV9KspC/j9plRJXYerL6T3t1Y7jaJpxpB2v5VhBySiS0gvoeXQYcx97tNf?=
 =?us-ascii?Q?x4IpfQHFIYutAaSfvS/LDuUbTDJ60FywlUxWSSNFcCJW7diPqAtC25M2e2iG?=
 =?us-ascii?Q?2VGLvMXXb8ijX1VemTudswXjlqSdA/1BzariPR4r7Rcjtl6wch1zewEqBrdV?=
 =?us-ascii?Q?13OE7hIQQrmBRVi3u4TWJNMLroK2ocKGEQj7tD2pLCsGFER28+15V2nnhK5B?=
 =?us-ascii?Q?DTSU0wdkF0bjQGLVv5idFfypqxV1se2vpeu/PNqmL4Wy5Y2sqcsZb7gZEJ+C?=
 =?us-ascii?Q?r8KiFr/PvsN8G3k/btP3pKkgW6kSGSnkFrEdgb8FjDxLn/k3sHIcuWZzgbam?=
 =?us-ascii?Q?sZ7Vs+76LwVP5+Wr1Kb/ZJDhLRacXsCyi0z8CfwZKzRgdLL6CUYCGZt/04pB?=
 =?us-ascii?Q?elODfg5iCTorxtnb4tkJf8gkeXGJ9FFemBshWlw2ZKJjI5SKTts/RMT/bPBT?=
 =?us-ascii?Q?cIGUyhZ3rpmPxl3b4g1DsQuw0qr3qZwtCPH2jvtwMdujV+6jRsL/FUBocmRX?=
 =?us-ascii?Q?fqKuDNfaqA2mTBwFype53D/OTZ06XIqVKLSSJGpS1JpqDJBjm4g/UJ4aD9KQ?=
 =?us-ascii?Q?0HXe9hAi6/WdddSFxkJKb/HBdbiwrD4zezYQtMPZ5lkwSw/KGaj7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3fc670-bc8c-4fe9-183a-08df2938f106
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:47:45.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crjtMvIF1Tct2V9IiymeI9wwtxEhFQxU8Uo00Oe8HPDJQqZuv2SqkkieqSUYMq1q7dmWqKJTAteHCM7kSysMCiAbrov1TXEEYCL4aa799BfxKqL9IAyzFqPPZMq0bZZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB383982

On Tue, Oct 13, 2026 at 02:01:21AM +0000, Ming Qian wrote:
>
>
>
> NXP Confidential

Avoid use "NXP Confidential" for public mail list.

Frank
