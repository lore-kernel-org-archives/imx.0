Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE119F115
	for <imx@lists.linux.dev>; Sun,  9 Aug 2026 03:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786245549; cv=none; b=qh2g5bzCpq6DHLGPFPuuItrwsA4aGEunnWn90XUXonjx7qOX6wGazryzNQezal5udlsvsK1eFZmNNDSinQZ/LymrrxNJ+pqa2u0nn4Pp1vdLjSaADw8SUW9JFU9gKFcUUIBgPrC/eirkM5fj+geyF4MHIaZY1j7qsF1KB/igOro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786245549; c=relaxed/simple;
	bh=r7G0JT2eGDbj+8Yd0QCpoHi/pv4OTNUhFzMmpRffM6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MNBySAvV+c6Bk5KQz9zI+DE/XuVxaX4L9IkDYCCXEUZR3p/VYwK0gXiVKylxuFxW225je+buxk6jp1R9ztc565sMUTsLgiYiuEu4Qxp7hWZvzju0YWmrW6vZ4CKlOWSmE06f9P38AwTrFBqxr5FcM3Gem74Nu11A/1sNie8NPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8bWyYJe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8bWyYJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EBF1F00A3A;
	Sun,  9 Aug 2026 03:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786245548;
	bh=ONCoyR7TFjERJInjuxMQeUtOoUB+vm7VxLXffePDnb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8bWyYJe/komECwPwlpQCmSD8hbuAxRjZxvFzkudLy+yuSaYzp2LudRL7NxZCtK29
	 bpzRHPSw3vZ18RXbKmrcWw26I1UT3YsK2ewBBkS9vhC1OPMmB5MjjCxHOBmAcwfij/
	 yuT/sFhtOje+qza1nmq5vTLkSdu2dSO+G1crfBQTg2IPuVC3c0/+TslGPxOn6vsrom
	 Ul50wt75KBfqtQEVSgFvTkcWbjU1ekGy/Wgww6NU9/lHerC6sUVZMIOXobMIXQf7rS
	 dxQuDnwi2DNykvpgQaUL07kFdshElhnRCx91ZZj9Ni0VPNZU/8XDwUsoa7a4DKVHfx
	 IaulQwZaFnd+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 2/7] ptp: netc: remove unnecessary
 pcie_flr() call in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260808032146.2335723-4-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
 <20260808032146.2335723-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 03:19:07 +0000
Message-Id: <20260809031908.46EBF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Disabling a PEROUT channel that is already disabled incorrectly fr=
ees alarm ID 0.
--

--- Patch [2]: [PATCH v2 net-next 2/7] ptp: netc: remove unnecessary pcie_f=
lr() call in probe ---
commit e70feff8e69f873b89699e822c09a88a2517534c
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: remove unnecessary pcie_flr() call in probe
   =20
According to the NETC reference manual, function level reset is not
applicable to the timer as a supporting function. Remove the pcie_flr()
call from netc_timer_pci_probe() as it has no effect.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 0e0972596d880..d33c49c86ac44 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -774,7 +774,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	pcie_flr(pdev);
>  	err =3D pci_enable_device_mem(pdev);
>  	if (err)
>  		return dev_err_probe(dev, err, "Failed to enable device\n");

[Severity: High]
This is a pre-existing issue, but does disabling a PEROUT channel that is
already disabled incorrectly free alarm ID 0?

drivers/ptp/ptp_netc.c:net_timer_enable_perout() {
...
	} else {
		netc_timer_disable_periodic_pulse(priv, channel);
		priv->fs_alarm_bitmap &=3D ~BIT(pp->alarm_id);
		memset(pp, 0, sizeof(*pp));
	}
...
}

If a userspace process calls ioctl(PTP_PEROUT_REQUEST) with a channel index=
 but
period =3D 0 (which implies on =3D 0), and the channel is already disabled,=
 the code
proceeds to this else block without verifying its state.

Since the channel's struct netc_pp was previously zeroed, pp->alarm_id eval=
uates
to 0. The driver then executes priv->fs_alarm_bitmap &=3D ~BIT(0), silently
revoking the allocation of alarm 0 from whichever channel is actively using=
 it.

Could this cause two channels to conflict over the same hardware alarm
configuration and corrupt their output signals?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808032146.2335=
723-1-wei.fang@oss.nxp.com?part=3D2
