Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3B39DBD0
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333078; cv=fail; b=WxHUaCL9L05wjXfnlHS2bnsvkuefqb22wfEaqULzaCJt164JTNhyJTe6GgUlAQxaGrDLDcexv86fYuT10YcDHcX9v2jy8uMCptrignoFz07n2ORB212aMX/5KjAVhn/quPe0d9X9XWo9mW67xIYbUsSZm/f2+lHiQh2CbZa9fII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333078; c=relaxed/simple;
	bh=UlkzmRo+7KYp5gkR76geCNLjOSkcoqdn1xIHcmiqkL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fUPS7z4cxXNoyOhQSF/3+SamBQb4P7b8oeTNHKDMMFClN9Wy9YJHJ1biQVgudMPXzDvC5YDpW1xfSBHvd8w2D26A/nVRxt7MK5UR60OcwiUQ+e3EcnsHmgoN6scCtSdlq085jeVFgpKthcWVD0t8fB3pscSGd+Ii0pN4d1yoLas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=golIqec9; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="golIqec9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIPY8WTFqhsEaWk4b6bpyQmQlot9wMdLo6vqNuXZEKizBgK0SpFETYGeSECUrDuFKFYm3kUr+DkzwEKeWbZr30ycHw15yR0M+1H+Gn9BZzPM5rXgTTCIl5EO/WIi8gTelRfpjKo2Ox63nvtOuHLO6M0DDQGUI6Po22+nGGh9ybrqXN3rpGQ/hLUdEF4IyLlhcjFHYaInOq6Lxb7ifYL9gpDYHbf0l1QxoCk9nTMOIBO8372+06u9MzYISP6uckFrasycyDHb7mO3f2TRRHRZkPHxVCc5dyQR0dNCNq2RKrusuDPXJ0LzvLN3sK0crxjioPKAQnR7kVSvYTDJrFXgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc3XS9qDtb5hBgav/i/hcwe2RbaHcvaqDBu44T69n2Q=;
 b=pGFOIcL4GT7rZXcatHdMBxRkoT5LqrgvFcfSrjRKF+lwZcePfgiTBwZAoj1JbdR7uAkI/Xiu2N6HRv6enQCf1q09b68jKvIbaWZr0pjOEUT3NeyMy1FpUEj8eNIn8Wz5QBlPf1SLsNvZlxhbEQp6+dtOsW8bVFPxdXTR/q+TLZR4KyjEX2p/0JyP/Wsc2YJkC7thbu3ka4EBWyZJUmNkny+YALMtfGGKGg/JcqionASMTa5GDA228fkP9m8U4d4nl2GnZ/vLrZAzzodS7rrTllUmeeKOMrUbC6eQscPsPaEx2MMlB3QT5niRdkBRgzcyTuOh9Wth18Rf0erLhn3gYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cc3XS9qDtb5hBgav/i/hcwe2RbaHcvaqDBu44T69n2Q=;
 b=golIqec9pz4I8qw2bpR+BwpleD+XAeSCvJa8oVWPNKb+E5ERUr93jBKokRFlrJ9LSHLqXQJ911vOmIXouRszEQGYt61tJEakAEIjmE7BJW1jTuZneYlipr855XC7d1bB+8G5eQQYPV23T/lDsKr7isYIpEOmFM+WJoJx96842Ms2dRU85XDZ9okmCIlRoMG7Ok1Y2JxVV6DaDQHR/NiOx58L1ULyDEwlPwHXSQoKIX5yKNHv22UvX4GRsolF29gWid1eg/xU2ddBrkKg6IzXH3V7dt0tlghrUsxjCtW584VR4V+p4KtNQJuejNHmnIkvcru8J9HhRzX4VMdW5HCcNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10156.eurprd04.prod.outlook.com (2603:10a6:150:1ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 16:57:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 16:57:49 +0000
Date: Mon, 1 Jun 2026 12:57:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX95-PRO board support
Message-ID: <ah26BWPDtZrirG_4@lizhi-Precision-Tower-5810>
References: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
X-ClientProxiedBy: SA0PR11CA0165.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10156:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ae7996-fb1b-42f6-2a05-08debffee951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jZfaLMBPAtxyuA4yWnnwqJE1FRJtEqp+xfWaksIsHlynOg3lPP7G4O8M4svGGy8vNEJW+3ZELlBBwsVrBDXab3+f6jOF/rI3pVH+gDirXNFljYkCEINfRQjXMEK9iXNPSG0jN2LgV7lViy3K+pzXMcIRszcq9eUiUnPgFOJEg2jIJzun+Pg3SST2sEPrvZgUy31sSIkl0zQbKTJIybdMKlH+vymgM4pPvty6CX4P/2EvaEOQ7hYD2KZD2ObSCRR5i2Sm3h/8ncfAHUMS/Zu9bEOuKXzb5Bgl6l/ZwDxaFMrOGUsnIx+7qQJLuAdCFX8ik9KoTUed1TmvJdjrRfQPjxrc2q6l8hSZRS2UwNlOZOdqJIPRi2JPrGFUwbf0Hh/fquOqiESgRCLzaCiHPUKYn5xYxtHFoif5rZPFw8n1i6qOX9mHeSpqfqRqi/XU//5jh7kB4J91m6yrt9u/4K51z+XuKo9shcA5ZD9q5bHs6bw7JoWfkXcvYcEAkrl0rishKHof/oWP5kYNOSQ5YHpUFGnxd5pMDKxRCzIVVuMzoTINc2eMd5MVCSZ2s3o1AviJh49mAfWLPa1t8hK3vwzorqs9BnNqCBTD0/VNt6XhYUfEenzat9AYe8CsT9FifLb7rsLzJ6fQ4iigrInZ0n7Cg0pnB141O5rfWC5Li3PCxIdP7bD7HdkwCdYmF8TMUjjdmAZsVyCerEEYxDK+Xs12Y/MT1tlwWXbPqG5hMNrF5EK4t2pnK2fYfeFGXNbZ+1l0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rsFm5tHmJUnEKOgn1VtbHmF5MDXRKN9lDUbwue1lxnqgoMLjHSgG5NfWCpJO?=
 =?us-ascii?Q?Wy87Za54Y+Od5HdGQ1k8r4ReSP39ADMNSqej1EHy/n8FQUVmdIsoBcCuBaoy?=
 =?us-ascii?Q?Cd4mq52+MJo5c8iqaz7oMnJ2WdY9GV+2qU+rdYGUgBJ3Q7nd/FKCMbH7KC+K?=
 =?us-ascii?Q?Uc+Ooi+OcFSVlP+ptWY28YXaf5a6nngcxqjqTWaqS25ANs/nf95LVrxSCvpa?=
 =?us-ascii?Q?qX3yJkcawU0twuYdVmQ0wMp6ljeeZ2z18oGNQqEXwMeeNuCLunOC+g9V4fN4?=
 =?us-ascii?Q?50nTtqZTpHPaF4j0OS8jLGTselIuGTKHa0dhD0u6FJR4Go9d/jNE7cCzvOL6?=
 =?us-ascii?Q?HvhM5/6q9Djyg5xA53nIzu7F2fMd6zsmSTBu9EEcLq0JbZpujepsp/QP45hJ?=
 =?us-ascii?Q?0HWx32BOiSwdE5YZOzcos2Py1neX0UfJsI/63s3SrWkpYnzggD1NaZ0Kbx/o?=
 =?us-ascii?Q?8IwvvKXe4b+GX8MWVW9HLaXpi30XQ/4N/kGdJ1j+oC0mHoK5fppQ47X47XMr?=
 =?us-ascii?Q?zW3B3njlfirJIxpaV03g+MA5lQLxjhHHmiidcCS9iTf/ADU4aX3Smi4/LjQc?=
 =?us-ascii?Q?iDhy5VCiipoVIhjsgm0+ltlB642XyW6QJkGzwcv4x2jdqex/D+hcgVrt9CmA?=
 =?us-ascii?Q?AeAk8whJ2pudjXp5mVIFgRm7udAfbsKs43tvFK5SGIW8Oh5EQ6FAiKUwT6hP?=
 =?us-ascii?Q?FRv0BqWmPUZwwsihbevchrehMYmr10yemJC4SWI6bAiNPojyZCqb7w92/7k7?=
 =?us-ascii?Q?c8xlR7zM2jui9ccS/3xturOQWhsve+0uWqNxHW60Rv21OtN37TZLCJYTz7MH?=
 =?us-ascii?Q?ICDxZM/FC5IlQ67/N7GQc09yb3T/N7SufHrSjE+TagAxbkAUYap6DsLoUPUZ?=
 =?us-ascii?Q?lLdsiwpqYWAELMxNGf5LLGAACMltof+TIdrvsODnvoshYY1htjDthkgp7jXz?=
 =?us-ascii?Q?No7hfBehicaRgTbEisXSScHhq6Sy2i9ijwSdbUHzAvTlhWrEsT2odJFGT6oi?=
 =?us-ascii?Q?vICWBMW1yBgqIg2LFzyMoNvRBi7OF9AVDegb6avVoDMd61ewsq2/Y1wBlzFh?=
 =?us-ascii?Q?/FImAX8HB9xBzjmRcnkEqyrqYm20bKRki62fCcAsdY/zy6fjqiOFT27oLpt5?=
 =?us-ascii?Q?T8amYcEOT6QtBK5XQPrkcqH1Iko92R6I3pISsIKIlBFUQzjYHPchE7RtY/Qx?=
 =?us-ascii?Q?Ou8oTp6hqu/l96OmBHwsjnvemDUVIoOIb5eRFwKjE3AT5+bR60yG56OfJfR5?=
 =?us-ascii?Q?TzqWM7qCzeS5R/ub2psNpZhFmzlG3fbk4sTRuU72/ITIeTbEOunp9bnfwcWC?=
 =?us-ascii?Q?ePcu3Kw6licGjrxftnGzEA434TOJlqLb4rBQhJjc7+BkKt5pJJ+NoJ9uTgBu?=
 =?us-ascii?Q?IQZtWBg8+QRAChNgPLm2b90Dt8RIIeCnAmNVVBy/kxaLsx4VI2XgIaaGGZPe?=
 =?us-ascii?Q?Z/6W61kdXIqNSdt8PjT2OL4waOfHjpWjp6M1c8hftRqeSFyZxkBYfgFmR1j7?=
 =?us-ascii?Q?B9qrtgjIJywal792YvUH2agnRJXBYionfILo5nu8UmAKu7qZifRnTMFZYwZz?=
 =?us-ascii?Q?T2u2NJ6jsGjAO8c1SQhEuZLC9oaB+CEc2hpGTT+mezOsdbr5sMWAAsskLWfN?=
 =?us-ascii?Q?oSaklIEAXdRT85qnSiw2SJ1VEBK1ndoUip+KzXls60pL/PRotTHXIMDGrETi?=
 =?us-ascii?Q?xyRVs4utyw6JR7OLYPWKtT/3vU0pcNCuHVwT41gxqxoE77yc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ae7996-fb1b-42f6-2a05-08debffee951
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:57:49.2187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nYO1xDxXAeXr7xn7wFCQmZRofndkHVS3h5ZLBzU2ikt+En6KhYP8XoYFigmdhAEJLGwL9HxpGy7lOCcNEwCUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10156

On Mon, May 18, 2026 at 11:58:18AM +0900, Joseph Guo wrote:
> This patchset add Devicetree support for NXP FRDM-IMX95-PRO
> development board based on i.MX95 19x19 SoC.
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
> Changes in v4:
> - Correct underscores in node names
> - Correct 'silent-gpio' of can_phy to GPIO_ACTIVE_HIGH
> - Fix typo in pinctrl_pcal6416
> - Link to v3: https://lore.kernel.org/r/20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com
>
> Changes in v3:
> - Change status of CAN1 to reserved
> - Remove unused pinctrl
> - Explain difference with i.MX95 15x15 FRDM in message
> - Link to v2: https://lore.kernel.org/r/20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com
>
> Changes in v2:
> - Run dt-format to reformat the node order
> - Change compatible of mqs to audio-graph-card2
> - Add imx95-19x19-frdm-pro in Makefile
> - Link to v1: https://lore.kernel.org/r/20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com
>
> ---
> Joseph Guo (2):
>       dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
>       arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts
>
>  Documentation/devicetree/bindings/arm/fsl.yaml     |    1 +
>  arch/arm64/boot/dts/freescale/Makefile             |    1 +
>  .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 ++++++++++++++++++++
>  3 files changed, 1023 insertions(+)
> ---
> base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8

where this commit hash? I can't apply whole patch and can't find this
commit.

Can you rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64

Frank

> change-id: 20260311-imx95_frdm_pro-7a8d03b50982
>
> Best regards,
> --
> Joseph Guo <qijian.guo@nxp.com>
>
