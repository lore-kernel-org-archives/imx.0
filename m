Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015EC339870
	for <imx@lists.linux.dev>; Tue, 19 May 2026 03:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159853; cv=none; b=O59ajloMMzJ+CWXfZzEIWAoW/ms5X5DQlHJTNuTDYkqP90U3dyvd+3L7MSYmR0ZWnLyLQrj+vzXmM4f0fB2c0jCdJAXWvY/S0qb7fRxd8sMA5/mU823kx8P531H/CT66YZ8GPNtXNSdo9dDiKv2iqNCcxnXjbPTi9IDDIoLsjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159853; c=relaxed/simple;
	bh=9kQW2Y97ZOQtzuHKkrHb1+29Zq/o4IG6cIvxkRO3FqI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i7anyU6tm68rYuaNd8WJpbyfo+pkc2e4y64VtrX2IlEK9jhhgR5IB40UtrYGybehONTG+s8d7kSDUf8w968LM62c3JzeNHmag18An8HSL1GLdYV16ReIVNkaIE2qHoPaKMM8T2wqXfBmWrm4jtjgky6sfguKpfafd5bKZlZYe5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXfIibzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXfIibzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3A4C2BCB7;
	Tue, 19 May 2026 03:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159852;
	bh=9kQW2Y97ZOQtzuHKkrHb1+29Zq/o4IG6cIvxkRO3FqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oXfIibzhd4wJKYCyZ+hWTtwq25ReWE5S9fUYG92pFAbFPnJ7m53fFKR2+wFBZoA2b
	 8lttiHchkykGLuOW3Xul0JMXVygci1WZI6gsqaHLtVpZlUv4EQ+YiDTKaOjDWJ3Fpq
	 492iuV+uNfnYaRvRtX55DPEGQYJPmNJghWveullqIWGYpsYe+MKeiyakcSGQfYNy+o
	 jEB2ASi0DfT68EMq7TR47iOKHiIxivptcaCMEySBT+sz2GPHhFsxhMM+Hi3a+OLlBq
	 na2Y0X+cP+xttP3dHZZFrGFbVA46e00zJmN8voHC/T06xogFjtF7CaCiXIBlqhLpml
	 rwSuTEjYZ1BjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 3/9] net: enetc: add ratelimiting to VF mailbox
 error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518030535.1057228-4-wei.fang@nxp.com>
References: <20260518030535.1057228-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:04:11 +0000
Message-Id: <20260519030412.4A3A4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Log Level Escalation
--

commit 3c862a59c5ccb8fa997ba3a5ebf3fad53f506fc7
Author: Wei Fang <wei.fang@nxp.com>
net: enetc: add ratelimiting to VF mailbox error messages

This commit adds ratelimiting to VF mailbox messages in the enetc driver
to prevent a buggy or malicious guest VM from flooding the host kernel log.
It replaces dev_warn() and dev_err() calls with dev_err_ratelimited()
during VF-to-PF message handling.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index b743b6d33ccc8..dea3a92c47222 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -494,8 +494,9 @@ static u16 enetc_msg_pf_set_vf_primary_mac_addr(struc=
t enetc_pf *pf,
> =20
>  	addr =3D cmd->mac.sa_data;
>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC) {
> -		dev_warn(dev, "Attempt to override PF set mac addr for VF%d\n",
> -			 vf_id);
> +		dev_err_ratelimited(dev,
> +				    "VF%d attempted to override PF set MAC\n",
> +				    vf_id);

Does this intentionally escalate a guest-triggered warning to a host-side
error?

A guest VM attempting to override a PF-set MAC address is a guest-side
misbehavior, not a host-level hardware or kernel failure. By changing the l=
og
level from WARNING to ERROR, an untrusted guest might be able to intentiona=
lly
inject ERROR-level logs into the host's kernel ring buffer.

This could inadvertently trigger host-side error monitoring systems and cau=
se
false alarms or automated host fencing.

Should this use dev_warn_ratelimited() instead to prevent log flooding while
preserving the appropriate severity level?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518030535.1057=
228-1-wei.fang@nxp.com?part=3D3
