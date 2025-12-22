Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5E22A7E4;
	Mon, 22 Dec 2025 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417984; cv=none; b=gjvlBquImW2nPknnnBQ8IsPb0wTfWYVIrZ+XqHL0WCOZiFxcEE6SFiHYtb7jRlHieYqgRjnDJ5b88ErSYT6pyrzAuhtr8sJIRruskcfuaGnxU6AnZ56+ravS+2D6z9PATwGA+IAPj0Qw6dEwXQCpRtm2+PO0bjUPMpiLisVCtC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417984; c=relaxed/simple;
	bh=/V5uTkOThZLY7I30BoPQTRuIgxnr/DGzQyp/Dlcr4so=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SFTRWkTXSsruVN+t5UQwTzgUh9plHISP1o69GhlJVC7ul2p2zRzL34oiWB2VnF9XgVhBGkg6jUem65sxXV5xjQp/LzERh2vDQbkGnzBeKffI65LX7Wftw62Y6erlYBZ8Ucbtp/ICIbcaSrBpkG69dwtZBh4cYZHrgUX2lb4znZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmYV56Du; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmYV56Du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B28C4CEF1;
	Mon, 22 Dec 2025 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766417984;
	bh=/V5uTkOThZLY7I30BoPQTRuIgxnr/DGzQyp/Dlcr4so=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QmYV56Du/16g5xUSf47U7QaqsJjAZ2u7QwuZVCJx9Nk5SQJ4u8m6YQzb4cyZQclbu
	 G0mVSmXctlI5ZUm+KoCQ7KDpoVi7R7CfcpqKoOQc2WcPlbgxSckbmDE98j/+YY3Kka
	 HPTZ3RuKE1dLljNhkawAHEqdjAt59GHgySCDrlgwE69TAPjDjYUZ6BuvyCpqQVrt5m
	 2ZzjDFCUbQf2ovaD1WeEPwmKxa8Njn7zNq5mB6YX/aGxHhapu2KcS1cpHqH91U/RIZ
	 o+ETH/Xdrx4Q39/fVmHCzgPtvO6uJ3wmMGL3eu68rmkQkNJaBAtV6IbpOEc8cFxP62
	 WmwQnOEATKJiw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  han.xu@nxp.com,  imx@lists.linux.dev
Subject: Re: [PATCH v2] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
In-Reply-To: <20251215-nor-v2-1-e75c0451e597@nxp.com> (Haibo Chen's message of
	"Mon, 15 Dec 2025 18:04:36 +0800")
References: <20251215-nor-v2-1-e75c0451e597@nxp.com>
Date: Tue, 23 Dec 2025 00:39:37 +0900
Message-ID: <86fr92cypy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Dec 15 2025, Haibo Chen wrote:

> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Changes in v2:
> - add 8D pp command in post sfdp fix up for the chip with old SFDP
> - Link to v1: https://lore.kernel.org/r/20251212-nor-v1-1-20a5a381979c@nxp.com
> ---
[...]
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 88033384a71e5d19f5a26ca91f56a49e3017183a..5797bb748be696b340ff1398155f5ac8b1f74055 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -167,6 +167,10 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
>  				  0, 20, SPINOR_OP_MT_DTR_RD,
>  				  SNOR_PROTO_8_8_8_DTR);
>  

Please also add a comment here explaining why this fixup is needed, as
Michael suggested in v1. Probably a shorter version of the explanation
in the commit message.

With that, feel free to add:

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> +	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
> +	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> +				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
> +
>  	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
>  	nor->params->rdsr_dummy = 8;
>  	nor->params->rdsr_addr_nbytes = 0;
>
> ---
> base-commit: 4a5663c04bb679631985a15efab774da58c37815
> change-id: 20251212-nor-2f37cf12eeca
>
> Best regards,

-- 
Regards,
Pratyush Yadav
