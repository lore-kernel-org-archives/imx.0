Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084694;
	b=XShbY0caepTNLF5KG06XiyTXBwN1Rve7A6TeWdYUqg9J/BvMVgibSGCCgHPFLnYrKRj/
	 u2zhBjVluWuzX/kqjijg7Q4P+D3whFDuSK3aqVfVBZLJaePDQN9pH09ab/6AM0BDgbi3n
	 N5WeeoPxJS1k1yVVmFr2EfkTJFyODnQAv1RBRijzGds7LBvkraeF51m/Q/4GkMhA4p+Wn
	 OuaB9P5rcfDtJ77f+Fu3j2J07Vmte6ILd7Naysn5mFi44ics7w7IXwUmOGdPo6u3/hSlu
	 Vi5cBxFR5MqYF7pmoOzkrlUbXLoGamOfrVTcZwoq10yiKSH5tqZzGu/dWyMAQP1GpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3pcyGAvMf58HInW/rNv20dPAompvXtqrqZgDs1TKSqA=;
	b=ZI+joF9l+DkfXJLGCu+qJhCS3wVlF8nakPxgpz/ngXHPW8EqwZC+yCGaxQVRSNEusnit
	 3IXhOVwWMnIevvtI1h/PVh0yZIvpWUvcU1mvuxFs/toTs9T9B7xyM7xOhF1yGS06jAgBS
	 gr7SlS17ZtQ0Y7X1PeN2p5Nd60epvxL12qTTGV8Q+P8UuMWZaZKa1TVf+7ZelFOaXot/i
	 39OvOV+s5TogLc2yIjAxEdo8+hXWkNpCKHxtKEt+FhCTDt2qPSk5xE+NEOQEadDexTmHI
	 OTlimmJaX5F83f6RYDIjaP67KKYowaPQZ7DQp01K64AZcRYxJpyZcoIVR3k69pkNFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPIYvPzA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F5606A320;
	Thu, 19 Nov 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPIYvPzA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A077C1F000C4;
	Thu, 19 Nov 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084694;
	bh=3pcyGAvMf58HInW/rNv20dPAompvXtqrqZgDs1TKSqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPIYvPzArsRl1abQFgLDbW5IAiC+mpJF55iV/RrEGXPCq5ovSryeeK+MJhN69f579
	 lXvo2YLQ5jpWoLSs8nvYhCyIxL3/xiPO1OWkyAANnNchR+e0FWlUyxGCsYEhVSNZAI
	 hOE3BHuEUNnCmO8kdPGwZdwrH6HNPyqSzVj1AgDKNcFQId+nzlKRWeQaoSVPqX5mFl
	 IlJP9vzE/Bw1AOfCoCernWt+C9X1gLzEFNTPErA1hxuXPfm/6RjYeABcqYfITpMdqu
	 mIjnSbxK21xsxrutpw2C6TF7JCGic7+RJOuk5C9+BrHpDqVOOoVrGAU/0gWE4uwD9F
	 DCWZSkmJgRSwA==
Message-ID: <sashiko-outbox-222969@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/4] net: enetc: add i.MX952 ENETC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118-imx952-enetc-v1-3-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <20261118-imx952-enetc-v1-3-25721440602e@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:38:13 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: enetc: wrong PCI bus lookup in
  enetc_get_phc_index_by_pdev() on i.MX952
--

commit 9488db0afb3e3295b4063b2f78e46b5195953993
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add i.MX952 ENETC support

This commit adds driver data with a 133 MHz sysclk frequency and PHC PCI
lookup support for i.MX952 ENETC (revision 4.6) PF and VF devices.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drive=
rs/net/ethernet/freescale/enetc/enetc_ethtool.c
> index 7965dfd06f5f6..3c6c6fc0ab8cf 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -1149,6 +1149,7 @@ static int enetc_get_phc_index_by_pdev(struct enetc=
_si *si)
>  		devfn =3D PCI_DEVFN(24, 0);
>  		break;
>  	case ENETC_REV_4_3:
> +	case ENETC_REV_4_6:
>  		devfn =3D PCI_DEVFN(0, 1);
>  		break;
>  	default:

[Severity: Medium]
Does enetc_get_phc_index_by_pdev() look up the PTP timer on the wrong PCI
bus for i.MX952 ENETC1 and its VFs?

On i.MX952, ENETC0 is on bus 0 whereas ENETC1 is on bus 1:

drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c:
#define IMX952_ENETC0_BUS_DEVFN		0x0
#define IMX952_ENETC1_BUS_DEVFN		0x100

Unlike i.MX94 (ENETC_REV_4_3), which provides a timer endpoint on each
bus, i.MX952 only has a single NETC 1588 timer on bus 0 at PCI_DEVFN(0, 1).
Because enetc_get_phc_index_by_pdev() queries si->pdev->bus via
pci_get_domain_bus_and_slot(), calling it for ENETC1 (on VFs where of_node
is NULL, or on PF when the optional ptp-timer phandle is absent) searches
bus 1, fails to find the timer, and causes enetc_get_ts_info() to fall back
to software timestamping.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-imx952-ene=
tc-v1-0-25721440602e@kontron.de?part=3D3
