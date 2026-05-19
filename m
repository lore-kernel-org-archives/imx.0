Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E93E2AB1;
	Tue, 19 May 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179139; cv=none; b=piXyOb0eKmF17jqCv6E1HIVUuTEatdCpvsp/dFKFHu34qAVZxolSWLS8q5l2kYVSHWZyJxAphjGrMvVTOebBmOIBPmcbWF/lPdaDledqxDf4nMSQMm/5PTgvpTOoJT4pxiAhp3yp6TnjFyu+Kz0PVNshnRFMdqdvHkyQCnWikPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179139; c=relaxed/simple;
	bh=gPyX+rEwofz5Bqhdnk3R7BPVHNj2F4Hfqkt/x50IcNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VSnHZ+3vcbCfFc76aPKhhBGX5sJLUnsIhRh+/TYu/e8q6GQuAlhBnO96xMrnvjW1WUATnFMJovNqyorRb5hJIwOayYDyByugBDJG9+VXhcRk69POufAteWOvCi7GQBg5sZrPdZtbjwFJFcQX4rhzEsqVtr7laKAC+VDt+oX5pcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwulZTT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwulZTT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0919C2BCC6;
	Tue, 19 May 2026 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179139;
	bh=gPyX+rEwofz5Bqhdnk3R7BPVHNj2F4Hfqkt/x50IcNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZwulZTT4blq+IudoP6yXsx9PTk0GxA7AvxO2iN0AB5zPhgI58bOEoi1cbzm4qRtgH
	 H4fqfjuzUmSB3hjXaoFJASsbPPkaChmoyIjUPsCf7aRH+HWhy3cfGzmPZyyWIOBe+f
	 X6FgmPcfP8/Fv+LlabG6efCDgGRxANdCZAbd3A6EhEMQ40UQDOQcCyQ63QMLuPJ1P6
	 lIJrpzdZr6+6vCm7JTZncAKqbGEW4l86kGNdsOlTryoMbBA9QrNpDOSTFy59AkDQvQ
	 xs5BXDxbZ7/WH/2YIB/gn6oyfqX9BG2AIdVyLc3Rnijphug+Jov1+lakIgDd8bf9ai
	 ppmAhPCtfVzaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 12/15] net: dsa: netc: add FDB, STP, MTU,
 port setup and host flooding support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260518082506.1318236-13-wei.fang@nxp.com>
References: <20260518082506.1318236-13-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:38 +0000
Message-Id: <20260519082538.B0919C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Stack-allocated byte arrays passed to ether_addr_copy() and ethe=
r_addr_equal() may not be 16-bit aligned, risking alignment faults.
--

commit eaa86c7415fcd30cddae2cda4bd6d4ca21da6e88
Author: Wei Fang <wei.fang@nxp.com>
Subject: net: dsa: netc: add FDB, STP, MTU, port setup and host flooding su=
pport

This commit expands the NETC switch driver with foundational features
including FDB, MDB, STP state handling, MTU configuration, and host
flooding support. The driver currently operates in standalone port mode.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 2141b3aa96b7a..9dcaa04d9a65e 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> @@ -367,6 +422,220 @@ static void netc_port_default_config(struct netc_po=
rt *np)
[ ... ]
> +static int netc_add_standalone_fdb_bcast_entry(struct netc_switch *priv)
> +{
> +	const u8 bcast[ETH_ALEN] =3D {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

Since stack-allocated byte arrays are only guaranteed to be 1-byte aligned,
could this cause an unaligned access fault on architectures that trap on
strict alignment?

Looking at netc_port_set_fdb_entry(), this pointer is eventually passed to
netc_lookup_fdb_entry() which calls ether_addr_equal(), and to
netc_port_add_fdb_entry() which calls ether_addr_copy(). Both of these
helpers require their arguments to be at least 16-bit aligned.

Should this array be marked with __aligned(2), or could the code use
eth_broadcast_addr() instead?

[ ... ]
> +static int netc_port_add_host_flood_rule(struct netc_port *np,
> +					 bool uc, bool mc)
> +{
> +	const u8 dmac_mask[ETH_ALEN] =3D {0x1, 0, 0, 0, 0, 0};

Similarly, does this dmac_mask array need explicit 16-bit alignment?

It is passed directly to ether_addr_copy() below, which has the same 16-bit
alignment requirement:

> +	if (uc && !mc)
> +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> +
> +	if (!uc && mc) {
> +		ether_addr_copy(keye->dmac, dmac_mask);
> +		ether_addr_copy(keye->dmac_mask, dmac_mask);
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D12
