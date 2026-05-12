Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC725A79B
	for <imx@lists.linux.dev>; Tue, 12 May 2026 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778629687; cv=none; b=ggfZg4TzMBcsbCXpaD6UTAK9k8OCGJp1PXKzm6zDIM/qnuX4GXTj/5z3XTuabe8JMoV+5lq4SPmMbqvJ3V/TRx1jMyvpXXpQ7VfrOl9UoeWAvzEgRjZFoX2DMYvvl8859+IW0+vjTygXQsjANHDj6ymeu4zEu4zPVKW+lMMh0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778629687; c=relaxed/simple;
	bh=2RYNedxUgbKGqiBoRMSRN6dX6v5KQgo2q+ga+pr2MKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mHWpMoFyAlhQThiXw+LYaf/FT25ZMgEphLTNRtk0EzmhL7BSM65JQMyX3Da1heZbP5Ladn1dgPY78hjpZa6g+WlPX41SDT8zvqbiy3ND9oha5k3/nhJ1IZXwBXHkQlk+rPKP0mGrI369uy/bmYhk/6qj1qg06YVDOMxXyCwotXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lodVTN5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lodVTN5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55585C2BCB0;
	Tue, 12 May 2026 23:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778629686;
	bh=2RYNedxUgbKGqiBoRMSRN6dX6v5KQgo2q+ga+pr2MKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lodVTN5GG4BHQcAw/qYh/s98pmJ5F6w2MCYOYiOHJ3LGHvtsb7kN0HMf9sdIeOe27
	 gfrC1eqYtORruhw8xRnHHUYUyQkQrzOuaqcDeTv1gS4u49hUCOq0k3ivmrt9eUMxbd
	 bimSjwlSXlk3h8vi3w0zz5cWIMTL8SOiXIN0qvG46bzcXIwUPRFgcfJ9YQrth5Qfxt
	 wUsboXSzPYyfhdIR+qDYYMZDAef7HbYX44+hBpECKnELZoWQLkeBd1uEpAgBgV/2UL
	 nJaYnd0une5yAgcIhcTSI1mEkZJgtNiTzkM0SFK14Dwkya7A6L1gguc/Ib97NzLT8L
	 +bGD4PrFIPj5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 15/15] net: enetc: generate MR interrupt mask
 based on the number of enabled VFs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511080805.2052495-16-wei.fang@nxp.com>
References: <20260511080805.2052495-16-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:48:05 +0000
Message-Id: <20260512234806.55585C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `PSIIER_MR_MASK` macro passes an invalid range to `GENMASK_U=
32` when `num_vfs` is 0, violating the API contract.
- [Low] The patch leaves behind `ENETC_PSIMSGRR_MR_MASK` as dead code.
--

commit f4d94f53cb9779f541f15301b0d99d09fa09287a
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: generate MR interrupt mask based on the number of enabled VFs

This commit replaces the fixed ENETC_PSIIER_MR_MASK constant with a
dynamically calculated macro to support ENETC v4 hardware, which can
have varying numbers of VFs. It uses GENMASK_U32 to generate the mask
based on the pf->num_vfs value.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/ne=
t/ethernet/freescale/enetc/enetc_hw.h
> index 94f53762cea82..77dd7913d1999 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -94,7 +94,8 @@ static inline u32 enetc_vsi_set_msize(u32 size)
>  #define ENETC_SICAPR1	0x904
> =20
>  #define ENETC_PSIIER	0xa00
> -#define ENETC_PSIIER_MR_MASK	GENMASK(2, 1)
> +#define  PSIIER_MR_MASK(num_vf)	GENMASK_U32((num_vf), 1)

The commit message mentions this should correctly handle devices with 0 VFs.
If num_vf is 0, this expands to GENMASK_U32(0, 1). Does this violate the
GENMASK requirement that the high bit must be greater than or equal to the
low bit?

Could this macro be updated to explicitly handle the zero case, perhaps by
using a conditional, to avoid triggering warnings from static analyzers?

> +
>  #define ENETC_PSIIDR	0xa08
>  #define ENETC_SITXIDR	0xa18
>  #define ENETC_SIRXIDR	0xa28

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 73e32c9b65a89..e9963ea154b04 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -162,15 +162,16 @@ static void enetc_msg_handle_rxmsg(struct enetc_pf =
*pf, int vf_id,
>  static void enetc_msg_task(struct work_struct *work)
>  {
>  	struct enetc_pf *pf =3D container_of(work, struct enetc_pf, msg_task);
> +	u32 mr_mask =3D PSIIER_MR_MASK(pf->num_vfs);
>  	struct enetc_hw *hw =3D &pf->si->hw;
> -	unsigned long mr_mask;
> +	u32 mr_status;
>  	int i;
> =20
>  	for (;;) {
> -		mr_mask =3D enetc_rd(hw, ENETC_PSIMSGRR) & ENETC_PSIMSGRR_MR_MASK;
> -		if (!mr_mask) {

Since ENETC_PSIMSGRR_MR_MASK is no longer used here, is it now dead code?

Should the definition of ENETC_PSIMSGRR_MR_MASK in enetc_hw.h be removed in
this patch to avoid leaving behind unused macros?

> +		mr_status =3D enetc_rd(hw, ENETC_PSIMSGRR) & mr_mask;
> +		if (!mr_status) {
>  			/* re-arm MR interrupts, w1c the IDR reg */
> -			enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIER_MR_MASK);
> +			enetc_wr(hw, ENETC_PSIIDR, mr_mask);
>  			enetc_msg_set_mr_int(pf, true);
>  			return;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511080805.2052=
495-1-wei.fang@nxp.com?part=3D15
