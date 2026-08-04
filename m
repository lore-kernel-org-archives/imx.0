Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607C12FF69
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785883075; cv=none; b=itJszaqZIMk6uS4HeGm6MVf1k2UCgjRYWzVjoQTcmIY56+p62hd1qQAh/+F1GgIsspkYTR+v3pklLh7m+7ttQEGKnqNZsQXF+SoBFiuveA2xqaRhC65gx75wh1BrVCqfmo+bNAF5oAnOAI1+sL54jMNL8b4c0KiKI7n/iDM7nkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785883075; c=relaxed/simple;
	bh=/2EIMTTWrfxEGCOKLgjISezRmyuh9CQ3qRHzoTviDHc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEIyZXlX92OD1Dk0aDMYBczbaBIQOWXyMWqWlzy31SvDL38GTPUjHM8a9CTaotbHgJlFpT2ZXh96ktbB4IwtMNjPbOOryRW5X8hF1jobjuZxodZxRUiw+Js3DZGnU/eshtMXn+lrex9sDiOPXEuOevIgSfILClNx/gD3KuTEGf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qJxvCCoq; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qJxvCCoq"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wrNlf-00000001eYa-3df5
	for imx@lists.linux.dev;
	Wed, 05 Aug 2026 00:37:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=w3dUr3+CtN8GVKAG40TfaowDBp6UMc2gGDn/8Q7eNdI=; t=1785883071; x=1787092671; 
	b=qJxvCCoqIMJ/M9AK0/hBmjXZEJf5jaf0AwFwMB1Cf9gsAxFi38+5j9pt0D92OwBBEGVcB3Rcpmy
	8vKqgrDjS2dXpHYGXuj7HebcP/uDcSnTFQ1K5Jx9UWZckx1NAF3W2ru942ikoWNNGMrM7ng8s/s+m
	cEekWvKzmOXGPKUulNYvl0uHZaD5cMmxOFsQtebQjqE0l6tJxxaukETrk3Ya58wy7Jf6rpgB4b5ti
	5zkhqmV6Oe4KlCJSxAst9dIJE1eSJnZDP8Z3CechskWqW86eUtHd/71dcq97/kM5QAG4CG3ttHdZK
	4/MhKEjahuYShlm9e07vqPA17woJJfQjI9vA==;
Date: Wed, 5 Aug 2026 00:36:36 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: robby.cai@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] regulator: fp9931: Fix VPOS/VNEG voltage
 selector table
Message-ID: <20260805003636.1fb41fbb@kemnade.info>
In-Reply-To: <20260724103441.800522-2-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
	<20260724103441.800522-2-robby.cai@oss.nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 18:34:40 +0800
robby.cai@oss.nxp.com wrote:

> From: Robby Cai <robby.cai@nxp.com>
> 
> The VPOSNEG_table[] mapping does not match the FP9931 datasheet.
> 
> The datasheet defines the VPOS/VNEG voltage mapping as:
> 
>   00h-04h ->  7.04V (-7.04V)
>   05h     ->  7.26V (-7.26V)
>   06h     ->  7.49V (-7.49V)
>   ...
>   28h-3Fh -> 15.06V (-15.06V)
> 
> However, VPOSNEG_table[] has two issues:
> 
> 1. Selector 0x00~0x04 should all map to 7.04V (5 entries), but the
>    table has 6 entries of 7.04V, causing all subsequent entries to be
>    shifted by one position.
> 
> 2. Selectors 0x29~0x3F should all clamp to 15.06V (23 entries), but
>    the table has only 41 entries. Any selector value above 0x28
>    would result in an out-of-bounds table access.
> 
> Fix both issues by removing the duplicate 7.04V entry and appending
> the missing 23 clamped 15.06V entries, bringing the table to the
> correct size of 64 entries (0x00~0x3F).
> 
> Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>

Somehow I missed this.

So also for this:

Reviewed-by: Andreas Kemnade <andreas@kemnade.infe>
> ---
>  drivers/regulator/fp9931.c | 54 +++++++++-----------------------------
>  1 file changed, 12 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index 002b41f53eff..ff743a8b0dfe 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -37,48 +37,18 @@ struct fp9931_data {
>  };
>  
>  static const unsigned int VPOSNEG_table[] = {
> -	7040000,
> -	7040000,
> -	7040000,
> -	7040000,
> -	7040000,
> -	7040000,
> -	7260000,
> -	7490000,
> -	7710000,
> -	7930000,
> -	8150000,
> -	8380000,
> -	8600000,
> -	8820000,
> -	9040000,
> -	9270000,
> -	9490000,
> -	9710000,
> -	9940000,
> -	10160000,
> -	10380000,
> -	10600000,
> -	10830000,
> -	11050000,
> -	11270000,
> -	11490000,
> -	11720000,
> -	11940000,
> -	12160000,
> -	12380000,
> -	12610000,
> -	12830000,
> -	13050000,
> -	13280000,
> -	13500000,
> -	13720000,
> -	13940000,
> -	14170000,
> -	14390000,
> -	14610000,
> -	14830000,
> -	15060000,
> +	7040000,  7040000,  7040000,  7040000,  7040000,            /* 00h-04h */
> +	7260000,  7490000,  7710000,  7930000,  8150000,  8380000,  /* 05h-0Ah */
> +	8600000,  8820000,  9040000,  9270000,  9490000,  9710000,  /* 0Bh-10h */
> +	9940000,  10160000, 10380000, 10600000, 10830000, 11050000, /* 11h-16h */
> +	11270000, 11490000, 11720000, 11940000, 12160000, 12380000, /* 17h-1Ch */
> +	12610000, 12830000, 13050000, 13280000, 13500000, 13720000, /* 1Dh-22h */
> +	13940000, 14170000, 14390000, 14610000, 14830000, 15060000, /* 23h-28h */
> +	/* 29h-3Fh: clamped to 15.06V per datasheet */
> +	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
> +	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
> +	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
> +	15060000, 15060000, 15060000, 15060000, 15060000,
>  };
>  
>  static const struct hwmon_channel_info *fp9931_info[] = {

