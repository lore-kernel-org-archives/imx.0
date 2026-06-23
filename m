Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668E384CEB
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224638; cv=fail; b=BGqM72xTNwdwftQll1ongGdgY/kvWyxyk/I6dU0k2A7PbKCOU3JjVDu4gP637S82VQ9y7EWQ9Y5uYXJYtCDmNTYPzKDe/xlxIgMDRT/ovSRD7dJeCl7o6w3rRLLI8NjFk1nrVekb36ggRjohBTL0DoXLxCKNQJltgqsxvp18Mac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224638; c=relaxed/simple;
	bh=NtxcAKTN33pyqBRjBcjmAbEVi9XtsoxdkaAC8dQFEFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dhOQ58+7+m6cYqyAAeBEzHr9TJvZVX1zM+oIm4m3VjZFkg8hutKRKYXrsHkQFZN1c64HOY1m+K62be6dybqwlbFFBLJb+pFOzFOIogDL8A5TtobnrSiU4ODrdkQiQeaWAVuhCbD6NkI0V1qOQtBzVS0ZyTa2GWXvmlPN9a6ApPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=etQOtkKz; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="etQOtkKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9Q4sF1OHhPixVV5YFAy6xB13nbn8ROjXGam82N0pu2viZPxbWby0pQ4ikb0j17gu14U4eHzrOTnXKBqWqAsmW07QAYLnRy28dMHMfhjYuFX5viHsjgWYy8Y393VHn6dYssy7gU+4PhDspzF6z0vxbFbFxbdlH+M/WXvG3GteN6wJkAYCUsUr4hZ203c6uAqFotJ03WkSgg0T+waOzju/JnHtfzaQ7RvktjHHyXvafYC2fPKO5FsmUQwf4d9fygmao0dmCdYLil0Q42eP58T2I/wDEedhMsuuPhTjNfObBm/qbvU0B55PsEuM8xTvMXM4oVzqyzZx6ODhhCEl2uC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acwTRMsDddI6xJa2nWo4Bj+QAIjFayLzzSBSE/d612Y=;
 b=G3YNbpb9Kk3SSgzOPvsfcKrnrR9MDPpM9N/GNsnnsTryLttf+wWffx0ufeh5gys88Rgi9jT4ZQ42saF8Rs4HZ0s+B17wnAvCVYGt7HqC/c+8SgbZaMkXKqvQWbmiYZVRVugKyboyWZEgk+DH1PkNkiT+X0cZctY5rTjZWMEFw//5/zpdWhrM/Cf/gdZ+gZp7CvspLd4BT56j5+TJn79b2/t7bbQYXhUAQdQw3HOA6Y7XXF3ZdMTgr+6NrEpaMrWWTrustaaeM3os85QfDfwOVxKC2zIMEfh4RXpajMWtnB6Ryu/OWw59GZWhYbJ8Hkd5QabrgvCwoP69yw0CjW3D0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acwTRMsDddI6xJa2nWo4Bj+QAIjFayLzzSBSE/d612Y=;
 b=etQOtkKzsBLVkCyUkeb1FzOHcdNkOXzOS0zTzmRJ3rXDXWqerI5zrahi0/ydRzc/sWYZ4H7Z0SORAYjxVsqu51VZThodR72H4icGcxDc0xw2YNjhnE/uwErBXlY8xPAxztomp2JKQ7jtWQBettZbY3x+rlAyqtT+LGZfYhCTDxXCs+t6dRoF63zP5LODVtHf3ArIcTHr1viHwWGXlaS9T9GuZ07J4MH03GPpG5RWfSm+eW3bBfEchjSAowT8a5Js6CQVR0E14FqCzcejRYrhDYNnNl539h+CHbPJdjwEeBK+OuPkHMajxsUWWdiL68zaSKjq0t3/w8cX8F0qOZ55+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB8028.eurprd04.prod.outlook.com (2603:10a6:10:1e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 14:23:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 23 Jun 2026
 14:23:51 +0000
Date: Tue, 23 Jun 2026 09:23:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Message-ID: <ajqW7U8cM0ybj2Jr@SMW015318>
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: PH8PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: e11613b2-2c2c-4deb-50cd-08ded1330c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	c39EpK50rFM1ZK2gcQR1da8e/ABxPMSJhgwh5vu6a5JKY7wmL0vYFE++0OVrNifLtfxZT8nRRAmMaXDtPkeVw8mmtqNAYAMwagZN5mOoRylHoPAjVDnvqLBl8QaWEqJ0JfAKixmcZei/phatHj6Q+V1/9J6CwyucHO18zuT3YjV2CErpLDPUbBkJ1mOMqY/aVEtmP6KNpVPKq9Bm4kIwt+4fybn3rIsAsJ4jFrNJzoaanEVjNHeL+NoWCBD4GMCDPaqIm//xMA/Z110bwS7tsmgNrYn58bwUTXrVt2PTh1pfHHiJ5Ihm3Hur/CZMsUgD0E0icdv0OcFQdKG6hy/Y/veagUNiyT0a4iqY9nnZoXg7lbDZ68AHQVWZFlOOsSQSkiDLO9WlBBE5fZy0y1cJS8A6a205GTE38ALMXYAfm3UZOTsOS+FSp0nNHTdg70CHmpnxL1WHJFBnOMDdbILdmqnAqCTaRLPKEv6cvZ6w8xajXQ1DRnSTwSbCYqA+lkfc0dvp/gFchbIuaP+fgC8fGMuggf6Z1QdnlNevPV1mAu2izz0qHhArG/uzfVpzCG/8mjpn6ctLLeuyJyiWm1F7kFrnm/10yBnplFh+PsaUD6ohIsZGqE4em/kOZKKFpwTF3pyfl1ELXHxH5AM5YPSYuOfdAagghCsigHSs8pE8gqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L/f7QfYcWs1g/PIECjZbN7fmb8PBdze84U9K7uVKXLib+HaIUq19GEHThOXq?=
 =?us-ascii?Q?jyNLur2XQjTiRtmVg+ocDeSFiiW7otYNCeJxyP5gBlNCmgaFjkAbjND0E7PV?=
 =?us-ascii?Q?5+ReNRkBn6a3HkESAdAnvZsYVYca+Tnf2T6EaWLvlg0BeX4zppwb6wQ4an5n?=
 =?us-ascii?Q?6Mqw1HIWWWDNvBACcbunvWbb7WUoj2xsbVXcnRiMEZN53SfVoO1lse7Dj50D?=
 =?us-ascii?Q?oEUpOdzI19YQi83bcGeJ+WqCJR4HV+1u10h2JpAGmpV7oWha3rgoJj2o/4MP?=
 =?us-ascii?Q?YAkaf+44bRWwJyRdJB3L0eO/7lQ98hRodV50tKQPQC0lkTHNfib2d9m4YLde?=
 =?us-ascii?Q?7FweCmvs5sWOV0il3JUMe8lmkpYN4jcMcgg49296jA/A2t/YL/o5M2GknvON?=
 =?us-ascii?Q?Ths99Kr1ouuFTd355R5nT8WAo4sCTP88d2T1J0TSGQw2Yw6aqNJTIB52DZ03?=
 =?us-ascii?Q?yo6YN3G5wm+PzTQdU8pGUS2ktcx+TLtifsqvEJwYgtjsT/yaZo7d+ssAAmEt?=
 =?us-ascii?Q?0cBcyskgf8uhbmLWSkh9qTv6FuP4IqBHf6BIVMOjPXTbjcRDOuGWezt97m7E?=
 =?us-ascii?Q?piHr6IAvlt/YFuwBrnjnxnQAeliJi8hLkreXGoruk0EPu8jE/79PDIcTHZrQ?=
 =?us-ascii?Q?+V0fpI96c/JAO9k2oHY4XKMnzifthOpGbLtpWGubbgvQQOEzhIKxLJjYaZej?=
 =?us-ascii?Q?HJA8sgNPKlIGTIpkFz1NCAH91Ax0WYPBkCjRdWlR7/DK/GPiDW4ASqqFr2m9?=
 =?us-ascii?Q?S1jnQjJs7zmOiy7EUYZMxa8eJ43S8ZHs39t5w2o30i/Nr/ApNy/iVfXA3DtR?=
 =?us-ascii?Q?Ek7j1GEldqn3qvmU1l30pcatdEFk9A21U7dRPTPw94dPpZhtQ/nk3tdfoUpN?=
 =?us-ascii?Q?rwRtYjLOvKukkfuVzitNJiVTplEcd1UtwFjH8s4C6o4arMCD9FrrE3hgpQdH?=
 =?us-ascii?Q?gqOUJQVCFw9XViVQlc+weGB8phLXxW0AbdAlPzEqY7RbRi8n8hBSaZ0YB6oz?=
 =?us-ascii?Q?1Jerrj+/jlwaZFMhYYgBiHNH9AhoCCHycWBrp70QfnFpGEDrvkUxgO4DpJDy?=
 =?us-ascii?Q?gC8C7w7WCo6zNjbs5xBuAezidBvenq484BazFqYnPKTEBgZBzTCU3W3VihPq?=
 =?us-ascii?Q?ZLlZL6sTG9MsGQXmV8xLrcEfk2r1qnVFKINPJgQnWwkaxFyMD6ejJ8kV1SQo?=
 =?us-ascii?Q?uGnV3Wv4691lFARMyoGQmPiaMWNOSTbi52Zwicnpx58acmUSjX4oEsVSl0Px?=
 =?us-ascii?Q?YLtfpUOfkgO+82JWwyuyNEDTVs0Ax1HV8n7iAjFRKLV1CviC4FJObnyfEV2N?=
 =?us-ascii?Q?iLR6ZvaWqsQV28Iogo3N+hSWertuAM/qsTrIf2fWkv5mST5WkE+VaifkO24s?=
 =?us-ascii?Q?yuIETBKTuF4zOyNNa5Q2+wezIbX6SK0oTkDNGWpLsjEVbEq5Zxbv2KM1hx63?=
 =?us-ascii?Q?1ZE4rTziW9lgXEsipyMMtYMHkeCqOcU3BzMOJ06hGXTbcAdJReSQ++hMPDA4?=
 =?us-ascii?Q?6NYQdFGB3JpO8wKA/aI5w+MDbPxdOTZ3wjI3dZR+umrM6gfPBfgzRCU9xNN9?=
 =?us-ascii?Q?96Bz9CWlNo4Agd8Lrsm8JootIYEa5dEn7z8xaoLE5Z89Qu+xJaZA0Cv7XOK/?=
 =?us-ascii?Q?zmzf4NAgDxb0gk+mrc5I2QiHgRiTlZ3ZU0wNZZmrX9Y39wJWN50ygopebi7F?=
 =?us-ascii?Q?ECKVcdkuhpYJQQ9kMDsrEsV586NjVWpPzi96J4hDdwQeSQutr0Y4yzP/9t2a?=
 =?us-ascii?Q?i6UVV0eiIxv8WsAD0Zz+TSQXfeeU9vPVrNhtjrOKo8W+d7uHYZw5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11613b2-2c2c-4deb-50cd-08ded1330c22
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:23:51.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5Fri0BznzSDaZs2A0oWDgVIwn/j7we8EkaY271FKh9DjR+CZuKY02lLvZVMpbrIs5otCMVC3wrmouro8LEV25lr8ZKgwz7gSJgsBbsGg2gxVpYlseuOxD5ucFNzHrn3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8028

On Tue, Jun 23, 2026 at 02:08:21PM +0800, Pengpeng Hou wrote:
>
> svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
> and then waits for the controller state to become idle, but ignores
> readl_poll_timeout(). The function can therefore return success while
> the controller is still not idle.
>
> Return the idle-wait error through the existing warning/FIFO cleanup
> path so the caller observes the failed transfer without emitting a
> second STOP after the final STOP or force-exit has already been sent.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Dose you really met timeout? if yes, what step to reproduce it. Suppose
only few FCLK to emit STOP or force-exit unconditional.

Any way not harmful to add check it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/svc-i3c-master.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 93805df8a940..93ae6eb1a355 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1488,8 +1488,11 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
>                         svc_i3c_master_emit_force_exit(master);
>
>                 /* Wait idle if stop is sent. */
> -               readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> -                                  SVC_I3C_MSTATUS_STATE_IDLE(reg), 0, 1000);
> +               ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +                                        SVC_I3C_MSTATUS_STATE_IDLE(reg),
> +                                        0, 1000);
> +               if (ret)
> +                       goto cleanup;
>         }
>
>         return 0;
> @@ -1502,6 +1505,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
>         else
>                 svc_i3c_master_emit_force_exit(master);
>
> +cleanup:
>         svc_i3c_master_clear_merrwarn(master);
>         svc_i3c_master_flush_fifo(master);
>
> --
> 2.50.1 (Apple Git-155)
>
>
