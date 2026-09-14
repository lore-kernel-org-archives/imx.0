Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5536657B
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379474; cv=none; b=vAILGQ35FVe2j0z3DKPQ3brILoHn8G/bXdRkBjqblaBGEifGxxmR7FD83c8LWVQo/FkhmkilZxx6Y4NoCcc2+HWcBCRxSaiBo8uC42vCR26ngG4TdIlMyM+2dNSJzhWjJHus4r4NntLwNlea2pSxLtUz7kidy9XYgt7TiivoV7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379474; c=relaxed/simple;
	bh=4JzVNdARopy5vyg/Kz4U3yTYTsTYbN6X/InmYMLxbV8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K7RWYoyZAGDiMZkdaoR2kZe7jkGpGupdqflFiLgjKtzmp6OYWyCyHXgkDiB8un60kuDspyTZ0030qIrqqmRORcTl7S4wuK+vrf0S0FvexO3s4NMSxZXEzGfAnme/BIwHnYWS1Ww5OYJXkQCMD7L6tV9bIxg78AgqNQDaN6NogiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkHWtp+W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkHWtp+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787F91F000FF;
	Mon, 14 Sep 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379472;
	bh=OGE3EsfBSmTEi4zymf3uHW3puOKjYq7W0+wcWL8wkK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EkHWtp+W+UNGX9O39V+jhU7Qo64mdLqaTOvr+CF8DrTqSthVePNtDbXT82qse3F0u
	 jtjmgfTxw6aVOWCdDQSftzF7bAL9rrFSIIU9QqJJysa59nZsVYGNT0+P9eHGJ4UEth
	 a3axTvumO+wRNOsX2YzF4YUgaACLt3ncOWvb3LZYwE/0hd+gVpBFiLYzQ8BtM+DxuQ
	 JceCdldFks2F3MC/h1QFN9LJD2nzevJMMIUM9FS66xA0JYhjxfQHMbXBxGr5pAIu3Q
	 cOjdk76nGds7umbZyo+dgmvhn0EH83xjAphJH5oEhTNmUWwuAunTs5ol0DYHL3IzWM
	 +f/6C/hC1m5UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>
References: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:51:12 +0000
Message-Id: <20260914095112.787F91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unconditionally aborting VDM discovery when an active cable (SOP')=
 rejects DISCOVER_IDENTITY, breaking partner alternate modes.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch provid=
es an incomplete fix that leaves DISCOVER_SVIDS and DISCOVER_MODES vulnerab=
le to the same infinite loop it attempts to fix for DISCOVER_IDENTITY.
--

commit 03a3e7fd132280443ce55a6167c00de5bda37072
Author: Xu Yang <xu.yang_2@nxp.com>

usb: typec: tcpm: advance vdm_discovery_state on Discover Identity Not_Supp=
orted

This patch advances vdm_discovery_state to VDM_DISCOVERY_COMPLETE when a
non-modal port returns PD_CTRL_NOT_SUPP to a Discover Identity request.
This prevents an infinite loop of DISCOVER_IDENTITY messages when both the
port and partner do not support modal operation.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa20856..cc9ea5d5e78a1 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
[ ... ]
> @@ -3891,6 +3891,9 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *=
port,
>  		case SRC_READY:
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
> +				if (port->ams =3D=3D DISCOVER_IDENTITY)
> +					tcpm_update_vdm_discovery_state(port,
> +									VDM_DISCOVERY_COMPLETE);

[Severity: High]
This is a pre-existing issue, but the fix seems incomplete because it
leaves DISCOVER_SVIDS and DISCOVER_MODES vulnerable to the same infinite
loop.

If a partner or cable rejects either of those with PD_CTRL_NOT_SUPP,
tcpm_pd_ctrl_request() finishes the AMS but vdm_discovery_state won't
advance since it is strictly limited to DISCOVER_IDENTITY here.

When the port idles in SRC_READY or SNK_READY, run_state_machine() will
re-arm mod_vdm_discovery_delayed_work(), which will evaluate the
unmodified vdm_discovery_state and resend the rejected command.

Can this create a persistent infinite loop of VDM transmissions triggered by
an external non-compliant device?

[Severity: High]
Does this logic incorrectly assume a rejected DISCOVER_IDENTITY always means
the partner lacks modal support?

When a DISCOVER_IDENTITY VDM is sent to an active cable (TCPC_TX_SOP_PRIME)
and the cable rejects it with PD_CTRL_NOT_SUPP, the rejection is handled
here. By unconditionally setting vdm_discovery_state to
VDM_DISCOVERY_COMPLETE and ignoring the rx_sop_type parameter, does this
abort the entire VDM discovery process, skipping the subsequent discovery of
the partner's SVIDs and alternate modes?

The timeout error path for passive cables transitions to
VDM_DISCOVERY_CABLE_IDENT instead so partner discovery can proceed. Could
this break alternate modes (like DisplayPort) when connected via active
cables lacking modal support?

>  				port->vdm_state =3D VDM_STATE_DONE;
>  				if (tcpm_vdm_ams(port))
>  					tcpm_ams_finish(port);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914093828.1910=
201-1-xu.yang_2@oss.nxp.com?part=3D1
