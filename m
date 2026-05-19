Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6029339870
	for <imx@lists.linux.dev>; Tue, 19 May 2026 03:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159854; cv=none; b=KAM1kIpxYZ6QgeR1rDARTfivvzN99tLoNPS6bXzffo6LXG0FjxkkSzY1ek7cu1l8JcQyc1fmiGeDLd1S9v6UyWlHGNA4g1xTADegG0eTnBkoJ86N0EB5PrGMZrgh+/HLck3RVqidFDX75w4oo8eZPi0lx1FfIMjKLQ+0FWb0u2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159854; c=relaxed/simple;
	bh=l4FDQKx2FnFKpP8gMilR6UBiYUb9byVAayChk1yagyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jxbjNjmFfLw4ZrII9JFrOsd4GAdRaOFlypqJUo5gWSqGRi17bzpKk9D4xW1KjzO8XgdsHncBeYZn8/gtgOqJ/eD3Y5v1jp0Pt0eU/RLDeZ/Wn1j7ffCgIhyG/f8hr4Je5yPugVS0wH8bS8Cid2gvxTUcxKsouSuVbZvsZRS/ofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egH/sYUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egH/sYUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2E1C2BCB7;
	Tue, 19 May 2026 03:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159853;
	bh=l4FDQKx2FnFKpP8gMilR6UBiYUb9byVAayChk1yagyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=egH/sYUCzzghjD6a/ykRtLtJA90H1yjBE30+01pvpAqS1HyS9dLk1behwC2R8KtEO
	 l85rlJbjjTwBTfgxebCBz4kMkz9IkFTdvSAiEImXm3LLnQKTXM7y9x4mg8GTGXe+Kl
	 YZbQbIpFyDIL26Z1R97BPZLYSl2bTndthL5V7MVFM3oJsEqcs1asjewlBc/WDG9FpI
	 UOW6+Y/Vs49BwLnOjLUOvIaPLb6+j3GqvoH/J7ulOmnKUdOD4+tc5xrSFh5o1Hlyrz
	 J21sdWlnVJHtoOChraxAf2rsr3fYli9kU5y0N/9hpAbk+rUKvQOUlz78M8IowSTwnp
	 lDg2WMS6zb1PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 5/9] net: enetc: fix race condition in VF MAC
 address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260518030535.1057228-6-wei.fang@nxp.com>
References: <20260518030535.1057228-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:04:13 +0000
Message-Id: <20260519030413.8C2E1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dynamically allocated vf_state->lock mutexes are never destroye=
d on failure paths or during device removal.
--

commit db9f948a9f4c7ba009b69fe241fc7fda20cc8986
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix race condition in VF MAC address configuration

This commit adds a per-VF mutex to the enetc_vf_state structure to serialize
access and prevent race conditions between the VF message handler and
administrative MAC configuration from the host.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index 09c6420408923..8e11a023d516b 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c

[ ... ]

> @@ -989,6 +996,9 @@ static int enetc_pf_probe(struct pci_dev *pdev,
>  			err =3D -ENOMEM;
>  			goto err_alloc_vf_state;
>  		}
> +
> +		for (int i =3D 0; i < pf->total_vfs; i++)
> +			mutex_init(&pf->vf_state[i].lock);
>  	}
> =20
>  	err =3D enetc_setup_mac_addresses(node, pf);

Should these newly initialized mutexes be cleaned up with mutex_destroy() on
the error paths in this function?

If a subsequent initialization step like enetc_setup_mac_addresses() fails,
the probe function jumps to the err_setup_mac_addresses label and directly
frees the array:

err_setup_mac_addresses:
	kfree(pf->vf_state);

This leaves the initialized mutexes without a matching mutex_destroy() call.

While the memory for the locks is freed alongside the array, missing the
destroy call bypasses lock debugging validations when kernel mutex debugging
is enabled.

Would it make sense to iterate and destroy these locks before freeing the
array on the error path, and also ensure they are destroyed in
enetc_pf_remove() during normal device teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518030535.1057=
228-1-wei.fang@nxp.com?part=3D5
