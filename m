Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA53CB2D0
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776739; cv=none; b=U3SPyEomQZYmDCgprARPU+hhB/m9dwDU803/iOh91/s6hY0Q7IooA81oL1+jg9xhNzfyh52J0fSE5wE42ZTi9mA+/hXZmJJLpB+mvrB5YObx2IeQvopWLMh/H2f07Pi0vwJUgVfGrFpH+iYpnj6kedfkFI0/3e4Q41SHcrKejBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776739; c=relaxed/simple;
	bh=O2zFH58nPfFf04vRiUuDOrYRAbbXyVE61U1YWYciCP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uAsZSyd29w7jj1JnVLFmoU3X2OOCKSLL8CwTZgkPnMEM23C/mb5s/aGY/JcemhKnK4rCXvu6Qpeydusm1gIa+PlaEUZ1CPQvCId/i7BBDmM1IxsLBx6ANnw1NjuIODXB66wJvffCzei3z7Vp7hTlIkpGtXFBy7wATL2sI9ivy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGfrTq00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGfrTq00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2376B1F00A3A;
	Mon,  7 Sep 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776738;
	bh=jN7PqAdguZJTAWmYzxZ9r5RLPt50IyAQrXaFQtSocZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGfrTq00c3ocM5jVfQYxkoPGG8qQbYrh3qAfxbU5b29rQSwZFYgmfsHCOaIYyJHGd
	 km4MYITBsVF6eTxHT920Ket/WWardbq2U8+JMlsiV47fqc4rOeMgm4mzvHy+95KSS4
	 8aM5UDCk6+J4FqELEFDYXj4xvzwO30Ydnv4vjCaFePSFtMLsqDJbv8XN54erlKztew
	 bJUprOTHL5MDqacks/nLFq0nTT81Xkr82G6nauIYoGWCX4v/qijIqO/ZSk/x7DOkKz
	 JIDiV0FpewlLU4Ye8IJUI3esSp2/Sb7cclcYADQ3WKbNt4k1L4apKpW6csLg/ZM+tW
	 YothXc8BWwP4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: chipidea: otg: fix invalid role name print when
 no current role
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260907101643.2844296-1-xu.yang_2@oss.nxp.com>
References: <20260907101643.2844296-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:25:37 +0000
Message-Id: <20260907102538.2376B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A hardware failure during role switch to gadget mode triggers a BU=
G_ON() panic instead of a graceful error in hw_device_reset().
--

commit c6988a7e6f8c802fa9431c1e969bc414e366bec6
Author: Xu Yang <xu.yang_2@nxp.com>

usb: chipidea: otg: fix invalid role name print when no current role

This commit fixes an invalid memory access and BUG_ON() panic in=20
ci_handle_id_switch() when logging role transitions. It ensures "none" is
printed instead of dereferencing ci_role(ci)->name if the current role is=20
CI_ROLE_END.

> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index fecc7d7e2f0d7..5eb3b32c2e871 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -179,7 +179,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
>  	role =3D ci_otg_role(ci);
>  	if (role !=3D ci->role) {
>  		dev_dbg(ci->dev, "switching from %s to %s\n",
> -			ci_role(ci)->name, ci->roles[role]->name);
> +			ci->role >=3D CI_ROLE_END ? "none" : ci_role(ci)->name,
> +			ci->roles[role]->name);
> =20
>  		if (ci->vbus_active && ci->role =3D=3D CI_ROLE_GADGET)

[Severity: High]
This is a pre-existing issue, but the same underlying BUG_ON() panic can st=
ill
happen during a role switch to gadget mode if a hardware failure occurs in
hw_device_reset():

drivers/usb/chipidea/core.c:hw_device_reset() {
	...
	if (hw_read(ci, OP_USBMODE, USBMODE_CM) !=3D USBMODE_CM_DC) {
		dev_err(ci->dev, "cannot enter in %s device mode\n",
			ci_role(ci)->name);
	...
}

During a role switch, ci->role is set to CI_ROLE_END by ci_role_stop() and
isn't updated to CI_ROLE_GADGET until ci->roles[role]->start() successfully
completes.

If hw_device_reset() fails to read back USBMODE_CM_DC during this time, won=
't
the error path dereferencing ci_role(ci)->name hit the same=20
BUG_ON(ci->role >=3D CI_ROLE_END) panic instead of gracefully logging the
hardware reset error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907101643.2844=
296-1-xu.yang_2@oss.nxp.com?part=3D1
