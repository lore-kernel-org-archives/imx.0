Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11463806D7
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225418; cv=fail; b=iWWOndP5SuKTS/vTU2PH0ybfAaSuJcOA//15THA5Qgzwk5QcxeEiB0ZCHAAXS+btVSnbBObQTb5b4A+AKGBn5n17wNdT3DWb2ifjl7MaE3b+x4xuXh8/Wi48JjXsOlujreiV3+3SHU6NOuxVY9eqkerHg/YYkf/sXsPeDEG+qNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225418; c=relaxed/simple;
	bh=Li/Vd6ouyhwiCGQEfg5PFa1xhnRwYEwV+O/gNDBujBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gIVKah6H7QwKNCO66z7Zj/+RHNFUouBjP6r+vU4jDq0NAF+07Jg2ajB52rliERtLzt6RrG2/jB+TK98m6v7+llwLlw7vv7470+kug929Eq5gdkDmOP5gRStnZ9/Hm6tJ2dYSf1VL1cGPGGRpIDgiVaNWX+qz90iw6D0kfED5lf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rTcxpSiZ; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rTcxpSiZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMmuMIQbyW/fUTfJX7mLqLDROGEYjE37n1CuEs9Pj1rAISijzWCp2R2X7a0rAmG5A5BgoVv+7EwZJtEhAf7ss439Zg1ocziHtYG/jIAd429xbLQ0+WVfImDcpOtqIIqnlWjRyCYZ1gmygtD2LijixSUnFZolf0obmpJnFHsl/tshRyoHn8CHp6hi/u2sAClrqeFlEJ+JiUe7bGIoAtm2NM4+JW5xPrGMon1x7oD1mbc4YBC+RzrplkhLsNdiBbXtQTHS9GEBkyNCE463aztnA6wFmKhW6bqU0l2gNBp56zJwDeazZASdaH/P83CntsKR/r1UdWJdAjInyj05ilZ49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BtaMnhN5UHdV9E4ge6ioqNmktKPq0XHfyY0aT5EGic=;
 b=csqab2rXAEbIktgVdbmuB9UB+jw81nxVzNRCIJGft4mK0LpF73KilDvYgqbwiCfpHOMiO4xC1Pj+IsGEmCmBhkUOUY7hrQMDo9SXSvesomM2WArdqSK6W+N6mmYQcEyUfVlHYSrFRvgHX827WwfHjBSDojy2ha9t3eviOyLlt1+FnSuy2bVVb5aBVCbuvmjehSogj438+HQ5qLXSb+3gLkMlTNCl0w7g1srrKKjwzjGNDq0k8D+EE1Of+3jB7tTqfLevM1V/eILlj0zM/8kmKHLoYHnojR6O6wxmb4hgHiiLA093no5x0eHXghzlqdsvAU/lvnllpVAtZW1JMJR4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BtaMnhN5UHdV9E4ge6ioqNmktKPq0XHfyY0aT5EGic=;
 b=rTcxpSiZH0VbAeSx1xfgFDLjU/8iySpNqCx8R9u6zF5jv0Cgqzb2LAPJM8VC6pZOZ7sOZk4xGS61SxWogYV6d1WE/lA6zUSHM0dPRBFIkSyPVvWjBFXVsYY0YlbKTnP7S1t/GTAFzDySRSfZh3myySxQn7m5V+xehOT5UQ4MwHoS00ZTDm4FvyUImvKkHbBxM56pUI2D1/glC8LwZ0oaE5a0yQL3eaKVCo2fhQMyrgjYWGvogXAVqodHmZHNvIgKghs88ANmxmjo+9ucdqTLRamS6KZDki5f2DfHIA/BoJEFCgzVCDpZkpH3/SFw9OuH1N/lR64ijYnmeESToum1pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB5PR04MB12203.eurprd04.prod.outlook.com (2603:10a6:10:64b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 14:36:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 14:36:52 +0000
Date: Tue, 23 Jun 2026 09:36:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <ajqZ-aOV98izIZIJ@SMW015318>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
 <20260617-prodigious-private-inchworm-beae1e@quoll>
 <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
 <ajlDU6FVl8XIjCWW@SMW015318>
 <ajoJFt6c1cKELlH6@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajoJFt6c1cKELlH6@shlinux89>
X-ClientProxiedBy: PH8P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB5PR04MB12203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9ceaa7-e21a-43a5-e5ed-08ded134ddd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|7416014|376014|22082099003|18002099003|4143699003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	o8sPNq0YpGSJ3LI+DwQZqsvUtJAf21Qn/fqerq9s9tA+KBSQ8XlhcXam/d6jHvsQNCQr3AmOnfnWw+h1qkViXXQ13bVXxlq/vqCzGwqsCwRpCIzZdmDXdf/p/M8/gFhVWq8OzIyxmaZGRLaa+2fzCKUhasfTYIoSSzTdJRfTa+CAXnL8xPhabdp1QZJG2+G1K5VsQ/ApgWDBWeGBHShtYosqz77UYwvORHGBxDu2vVw/fKlehGP0I3zcHHOLNZFmj3/EzHQU2siwYrOwqOH2nVY2s0kO7Fx9fAuJmLDokOwqhCUW/BEStgZNxqD0s40+eTU3ttNr2nziOkolSu8jA9V5r+HjLExVu/88ZfU+sOMDwoTvXw1JxeDJ9lAnTHHy3QmeepVLhGSd3sb+oYaZEH7H9/ugF7i5n9Wc4I/2W8kwrA9o2bO6vTCWTCCV/X4piTbBNpd+TgjY+4xncOKL4ofa0bDxVgzgWEmmmLUIN5ZhE9MudE1WPK6HNgKbOLP9JwlWw0ZzozOChCWCEw0xY4ePpDXWZn30Hrb49Q+tncB75qDxQG+pJhwwu7/xsfJ6sObs5Lp8XiRpdDwXNE73tLZo6aQEhwILZhWYibgz6UTdfLpCvhTPkcdrrY1hWXBHtrrvDiAIsYyuv0CPuIRREoMTrhJxQG/9+d65ozMDwLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BB0SXpO+h/YBdmqH9rJETr8iZj8D4K/mAJNvU3z7kCFyXzYuucIJxJULRWLS?=
 =?us-ascii?Q?FN3A615TOdkJornZP0wPwVadFMz61QRaViBQomTak0dkn4iMBn7bBSzhIq5j?=
 =?us-ascii?Q?5WtuoHmWLQFecgr7xBk+ERWu9r3fZji79cyoVz8y+7jBBSKvfd2VUqfjLETy?=
 =?us-ascii?Q?wqu3ambK9aM7BOMdhQ+Z5MGwrGG40PcG6/n+z/HnWCt61d7/9vj6wt3kEhnV?=
 =?us-ascii?Q?JfGnxgNispiYQPEUnXbmMwSWR30rO5zcjS9Ujqwj7mZfHEHokoUeVM1BzA+S?=
 =?us-ascii?Q?ICzncT0dO3Qvnatn8aC2tbmQ+eN7aAMz0mKutD8yhE1vf1g1nqTHfOBaAm/i?=
 =?us-ascii?Q?OaOJHnNbi489KL2z42RzyDS35y7TvjPv4UTt71ccxq5bDQQMB0cm8s0n4kF5?=
 =?us-ascii?Q?sz5ANBiOu+k0cJtQr9udepBoBXsDan/418sSs3ALegl/JWivN2DxjiaYyavE?=
 =?us-ascii?Q?k4JgyJivK36KCTykdjK8Omrfn8POQ14Y2dhXKemeG80Tn3xeHeRuPKyaGYiY?=
 =?us-ascii?Q?/XgJfP9TIBeRAVe/j0To8mtrgBotbi8fevXDYb6rh4dDLarOlaC9GhoFqpoB?=
 =?us-ascii?Q?e6sDdNP9nAxIuo7+4TGsgQhI/4AJID0OVAdyA3oXy2uyFxrFfIhT+uZDJxxD?=
 =?us-ascii?Q?M20Xa49vDl8AoY5ayOs/BFWrYEcqOTcsxyHLMEh+NDeSnt/rdjhNqcH/ars8?=
 =?us-ascii?Q?rZE61aLL2vmGBN5kI71TwEDGkKpoUPgAadkDMgXZNUl1laqVZxiuzvw7dKS1?=
 =?us-ascii?Q?xxQtp0dgylKPJggWEIWjwwetLbEJKljlzS9Jrr3kga2viQumiQVOeT3nzMic?=
 =?us-ascii?Q?I/KLW2kzCd3MZ0Bgoshe7grnOk/Bu8KAwHCsM4jC3ZLKC05n09LiuY9bsf0u?=
 =?us-ascii?Q?kkbBQDdtRygF9VtyBmhDWr6evtr1K9iQd/ZAe9c1fOveK45+y5U+KmYRIavy?=
 =?us-ascii?Q?z7ON7ctkdme+qDDcwsHtuVe6JbnClpSPhyWlU2zFxlsYv9JKSxXy1mny7Ii8?=
 =?us-ascii?Q?O1M+M67EjPaE8XSYGDHilIKXpfeQ9OQjy0X5mAaTYrnxjwBwPcvg1cVE+lCg?=
 =?us-ascii?Q?K8i04wXfoQyJsC1+oDWIlh91KrbzmvQNyqM0Djda+fN/nzQvt48okQYI7eOS?=
 =?us-ascii?Q?9ZaCQM7OFeCDRFcPtGdKCqAjfwNGMDyreN5W6XToHsOVw4DKJSR5gQ7+JoLl?=
 =?us-ascii?Q?uHF4u2PJgZbv0mYagRPAFy9I3GciCTgSDMyKgC62EdrL3gsaSaLKV39AALPc?=
 =?us-ascii?Q?3ZTIzly04jSG6tl9OBQ9HCV4qh9ai8DAOs3HM5CDGSJCPZA1MRY+UjJ9A7qF?=
 =?us-ascii?Q?God1wb7L4M9BAPMp8IyhD1FqBDtkULzaRVvYXvfLKQEqTDXOantw5+MKsjRH?=
 =?us-ascii?Q?1GAx+BE0Gx9klbCsB9igDtGUhZX6WoWqN6kVrCT6QEWyDcQ+oLzmT0yQdZX6?=
 =?us-ascii?Q?067I1ld4QTmcSq5fGHa7djzwzbthDPsyvbe69EkOtzmLm7KnjAOlCKO5n/3c?=
 =?us-ascii?Q?8B+8iD3+n1mCry5Um4qVldqg0z3ztqL2tXX1vmMqTyUhwK17BltDYrDeaRQo?=
 =?us-ascii?Q?JHTAfr4/LbGdvOAQKtLjIJ706j9cm+mH3rSms1QPIYM4DUFHZq1emDEmfurQ?=
 =?us-ascii?Q?e1X5RiQnQsxdmbXS+Qt+vUKNdLHtSj5X1jaQENwnygxCj9zpm23ilIA6RPi3?=
 =?us-ascii?Q?qpBHpIF3bmWnoUWMeQ32Ju2yDCqctWbTEeMxrjLurSChdenuASSRca/9O3SJ?=
 =?us-ascii?Q?YmZawRvkiJlKyTrb5lBbu1dkwZwZVNM5TLWLW0axXFV7rTON8eh1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9ceaa7-e21a-43a5-e5ed-08ded134ddd4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:36:52.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97V0y2P76Dr64TDd2zS7rxxcyCntcdzN6AsFAMFJa3F5QUc4LroqYrEGOSbhiGli3hDVSH3T4WDHEY6+qoE/Nq/NvgUEQ8As6xJws+bxvxQPBGdYaDtO2exuKOK9+tBI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB12203

On Tue, Jun 23, 2026 at 12:18:30PM +0800, Peng Fan wrote:
> On Mon, Jun 22, 2026 at 09:14:43AM -0500, Frank Li wrote:
> >On Wed, Jun 17, 2026 at 01:36:30PM +0200, Frieder Schrempf wrote:
> >> On 17.06.26 12:49, Krzysztof Kozlowski wrote:
> >> > On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
> >> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> >>
> >> >> Some SoCs like the i.MX9 family allow full access to the fuses only
> >> >> through the secure enclave firmware API. Add a property to reference
> >> >> the secure enclave node and let the driver use the API.
> >> >>
> >> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
> >> >>  1 file changed, 4 insertions(+)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> >> index a8076d0e2737..14a6429f4a4c 100644
> >> >> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> >> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> >> >> @@ -53,6 +53,10 @@ properties:
> >> >>    reg:
> >> >>      maxItems: 1
> >> >>
> >> >> +  secure-enclave:
> >> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> >> +    description: A phandle to the secure enclave node
> >> >
> >> > Two things here:
> >> > 1. Here you describe what for is that phandle, how it is used by the
> >> > hardware. Currently the description repeats the property name and type,
> >> > so not much useful.
> >>
> >> Ok, agree.
> >>
> >> >
> >> > 2. If you access OTP via firmware, then this is completely different
> >> > interface than MMIO, thus:
> >> > A. reg is not appropriate
> >> > B. Device is very different thus it has different compatible and I even
> >> > claim should be in different binding. Devices having completely
> >> > different SW interface should not be in the same binding, at least
> >> > usually.
> >> >
> >> > If any of above is not accurate, then your commit msg should answer why
> >> > and give some background.
> >>
> >> Thanks for the feedback!
> >>
> >> The driver currently uses the limited MMIO (FSB) interface to access the
> >> OTPs. The intention is to support the firmware interface alongside the
> >> MMIO interface so the driver can pick the interface that is available
> >> (firmware might not be loaded) and fallback to MMIO.
> >
> >Does ELE and MMIO access the same bank of fuse? If access the same bank,
>
> Some fuse banks are only accessible through ELE firmware. Some fuse banks
> are accessible using MMIO. In theory, ELE firmware are able to access all
> fuse banks.

So use two driver for it, one use current MMIO ot access part of fuse box.
use ELE access the left part, which MMIO can't access.

MMIO should be simple and quick than go through ELE.

Frank

>
> Regards
> Peng
>
> >why not always use MMIO. Any beneafit from ELE firmware?
>
> >
> >Frank
> >>
> >> Following your argument would mean a driver deciding by itself which
> >> interface to use at runtime is not something we want to have in general,
> >> right?
> >>
> >> In turn this would mean we need two drivers, or at least two
> >> compatibles/bindings for something that is effectively the same hardware.
> >>
> >> Actually, my first RFC approach [1] was to create a separate driver. But
> >> in the end it seemed very weird to have two drivers and two DT nodes for
> >> the same hardware block. Also I have no idea what happens if both
> >> interfaces are used at the same time.
> >>
> >> The other idea from back then was to replace the MMIO (FSB) interface
> >> with ELE, but this would mean that we rely on the proprietary ELE
> >> firmware to be available for simple things like reading a MAC address,
> >> which is not desirable either, I guess.
> >>
> >> In which direction should I move on with this?
> >>
> >> [1]
> >> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250416142715.1042363-1-frieder@fris.de/
> >>
