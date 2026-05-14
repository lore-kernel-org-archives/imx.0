Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A50735E94E
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756301; cv=none; b=SdSc15hUWz7IXI1G196V2pU02evLDhO7oP2GklPY36zNL7MGBrC6B93GT38iwtlD1x65IMctBm2g0fpdw9f9yK0OnSLMkjIL9HG2gtqPHbl8eTxPEk5d3GV62E1nmGGWOO5AqD5fIeRTKTr/0RfzavQYmzakBAvU/iv0Ym/TEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756301; c=relaxed/simple;
	bh=aaBvPmA+s7HFt10Gy/0y58DwC9jRLt4Qr4JNuPHVES8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WoxYudmAeXr37aajGaGBdFf7vQhLGWKWL6jdm975aHEBfrVH8xcSLETMFUCG5D4jwiuLXn4Xn+h983hCaGd5tMV2z/lMEWTyRrjbwCMm88Py9RByHsPjOvcy9xgFtZ1NOqdFvWgo1Wc145CIlg9nuD5zlzO2uHqbSNXgqAyvXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDec2bBs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDec2bBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B9FC2BCB3;
	Thu, 14 May 2026 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756300;
	bh=aaBvPmA+s7HFt10Gy/0y58DwC9jRLt4Qr4JNuPHVES8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CDec2bBsBCk3+GPbYxgNJ596QdyhY9aLbYQfcbhZk6OfkV/96GthUK5deWD7V4c/b
	 rMcTa+0HWIH1GPVHkXuemrKomZsyN2L21nmvHwKxcB0vjnzFTv20zEFC7qoH5IZ/La
	 f7SexezoOE/r7KhdIrkjVPU7Rf1YKkxYjtigQtfNfrG5zOLcBEmrBwyrqqbIax9dmP
	 o+lkJoHR/pJnOje3x3oowSIucJV1fvqJJIZv6pEH2/btjFg+k/fMEh4kNYfqKOy7zn
	 6wS6PhRPxFv59zw+ftnQSb/rVZkEspLGoO6+06fyuS/o5UatHzfIxArIFfdQDtnrh0
	 VYHJtRx1vzhPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/6] net: enetc: validate VF primary MAC address
 before configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260513103021.2190593-2-wei.fang@nxp.com>
References: <20260513103021.2190593-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:20 +0000
Message-Id: <20260514105820.78B9FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Double fetch (TOCTOU) vulnerability on the MAC address in the =
DMA mailbox buffer.
- [Low] Missing newline character in the `dev_warn_ratelimited` format stri=
ng.
--

commit 4e5ebbc802e563f230eda3225f5ff1686a5568c8
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: validate VF primary MAC address before configuration

This commit adds validation to check the mac address provided by the vf via
the mailbox interface. It rejects invalid mac addresses and returns a failu=
re
status to prevent network connectivity issues or unexpected behavior.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index a12fd54a475f6..756614ffa8c6e 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -493,6 +493,12 @@ static u16 enetc_msg_pf_set_vf_primary_mac_addr(stru=
ct enetc_pf *pf,
>  		return ENETC_MSG_CMD_STATUS_FAIL;
> =20
>  	addr =3D cmd->mac.sa_data;
> +	if (!is_valid_ether_addr(addr)) {

Does this introduce a double fetch regression?

The addr variable points to cmd->mac.sa_data, which resides within the
msg->vaddr dma-coherent receive buffer shared with the hardware/vf.

The code first reads the mac address from this dma buffer to validate it
using is_valid_ether_addr().

If validation passes, enetc_pf_set_primary_mac_addr() is called with the
same addr pointer, which reads the bytes from the dma buffer a second time
(via get_unaligned_le32() and get_unaligned_le16()) to program the hardware
registers.

Could a malicious vf exploit this window by overwriting the mac address in
the dma buffer immediately after the validation check but before the hardwa=
re
is programmed?

If the mac address is copied into a local array (e.g., u8 mac[ETH_ALEN])
before validation and use, would it prevent this issue?

Note that subsequent patches in the series (e.g., commit "net: enetc: fix
race condition in vf mac address configuration") add a mutex to protect
vf_state->flags, but do not copy the dma buffer, so this potential race
with the hardware seems to remain.

> +		dev_warn_ratelimited(dev, "VF%d attempted to set invalid MAC",

This isn't a bug, but should this format string end with a newline character
(\n)?

> +				     vf_id);
> +		return ENETC_MSG_CMD_STATUS_FAIL;
> +	}
> +
>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC)
>  		dev_warn(dev, "Attempt to override PF set mac addr for VF%d\n",
>  			 vf_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D1
