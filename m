Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8521355F3A;
	Sun, 10 May 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410113; cv=none; b=Z6uiZaljjIxjjHOrUydXMdlZEUYD3zgAffn8Ss4arJVAXQoxUphiYzR4G1y/PPwR3P8eIcXci0mBEtL6+bJQ2VjNCbb1IvZQRc3vfKLPpj0+3s2ZMWzznLFVE9vX4maLiVjXgzNTRjmViMV/XppVSb2VGhhDJbLd4ES3jCU7nEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410113; c=relaxed/simple;
	bh=T2ob0QjbxCJ3afi/m82K2yGm4paVgiKCvGbfXVelqYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBWll6C3BL/DJ6kiRmRRPLk4KfmqGqROShlhKTOHlYK3XVrgLToY3FzkaVS7pb4g4ZFcaQ6g6zakQospW1DdnFwXHks3VlM8fjg5aljS+aLW1bHqY0vFstx+4vP14ZmuTuvppsAYFT9mKZwymoc7pBNX4XEiTGtC6n8CcQ8vJWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwaMscd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwaMscd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0AEC2BCB8;
	Sun, 10 May 2026 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410113;
	bh=T2ob0QjbxCJ3afi/m82K2yGm4paVgiKCvGbfXVelqYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WwaMscd3vCbXFu3xr7jTojuhOn8tilDDeSx54CmMdhvC6KL7CF+TqzPygoP5LewK7
	 QkddErOFml9efnzlgJkm1+YiZ3zpqotARyaqYonfQWijjnrka2rXEayIJSQRz1HWTX
	 6RCfVJ/axlZ3z7oQogWADd97UbIfNJBudw3nPv2ajxDagcTB9+AjAoBnp2oVEBIyMf
	 81FGCCxojLcn7jrlMA2E4B2T74bVX8PBPJXqnGPRgdWDzQuL7NT9exMMqb2btxc0IJ
	 jh8tnXtASH+2xc0VzIUnf4CZpFJg+qRyk/cmnCA686PEikZzqWXHcsT60eVh/ifKDF
	 R+1lj+B/wfHlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 06/15] net: enetc: add support for the
 "Update" operation to buffer pool table
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260509102954.4116624-7-wei.fang@nxp.com>
References: <20260509102954.4116624-7-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:32 +0000
Message-Id: <20260510104833.5F0AEC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The BPT update command incorrectly sets the `BPT_UA_BPSEU` flag wi=
thout providing the required BPSE payload in the DMA buffer.
--

commit 04028be08f5e1d61341410aae72c568ebdb38953
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add support for the "Update" operation to buffer pool table

This commit adds the ntmp_bpt_update_entry helper to support updating
the specified entry of the buffer pool table.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/driver=
s/net/ethernet/freescale/enetc/ntmp_private.h
> --- a/drivers/net/ethernet/freescale/enetc/ntmp_private.h
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h

[ ... ]

> @@ -175,4 +175,10 @@ struct vft_req_ua {
>  	struct vft_cfge_data cfge;
>  };
> =20
> +/* Buffer Pool Table Request Data Buffer Format of Update action */
> +struct bpt_req_update {
> +	struct ntmp_req_by_eid rbe;
> +	struct bpt_cfge_data cfge;
> +};
> +

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/et=
hernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c

[ ... ]

> @@ -749,5 +755,38 @@ int ntmp_vft_add_entry(struct ntmp_user *user, u16 v=
id,
>  }
>  EXPORT_SYMBOL_GPL(ntmp_vft_add_entry);
> =20
> +int ntmp_bpt_update_entry(struct ntmp_user *user, u32 entry_id,
> +			  const struct bpt_cfge_data *cfge)
> +{
> +	struct bpt_req_update *req;
> +	struct netc_swcbd swcbd;
> +	struct netc_cbdr *cbdr;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	swcbd.size =3D sizeof(*req);
> +	err =3D ntmp_alloc_data_mem(user->dev, &swcbd, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(&req->rbe, user->tbl.bpt_ver, 0,
> +			  NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, entry_id);

Will this command fail due to a missing payload for the Buffer Pool Status
Entry?

The update action is instructed to process both CFGE and BPSE data by setti=
ng
NTMP_GEN_UA_CFGEU | BPT_UA_BPSEU, but the allocated struct bpt_req_update
shown above does not contain a struct bpt_bpse_data field.

Because the provided swcbd.size is only sizeof(*req), does this cause the
hardware to either reject the command with a length mismatch error, or
unintentionally read past the end of the provided buffer?

> +	req->cfge =3D *cfge;
> +	ntmp_fill_request_hdr(&cbd, swcbd.dma, NTMP_LEN(swcbd.size, 0),
> +			      NTMP_BPT_ID, NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
> +
> +	ntmp_select_and_lock_cbdr(user, &cbdr);
> +	err =3D netc_xmit_ntmp_cmd(cbdr, &cbd, &swcbd);
> +	if (err)
> +		dev_err(user->dev,
> +			"Failed to update %s entry 0x%x, err: %pe\n",
> +			ntmp_table_name(NTMP_BPT_ID), entry_id, ERR_PTR(err));
> +
> +	ntmp_unlock_cbdr(cbdr);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D6
