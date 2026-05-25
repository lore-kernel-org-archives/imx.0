Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFBA3E0248
	for <imx@lists.linux.dev>; Mon, 25 May 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699469; cv=none; b=J9naGaCQ4gIU5jggOuNeW3ekbj/T7vu8ewbSAco/a7ohz6uzsEVm5dGWqd62SjlkN7LNCE1bYYwbcnV+9hSXvKL6+rpRYuQ/5r+JuRX4tHB3sQvuLbocFQIsKChjj+8iNiT/eDYjCQVHodClNBLi/OWpN9FVdMkjyMovNXRA3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699469; c=relaxed/simple;
	bh=jtv4EOuMIZMxp3IObzjMFn8O343/bVeHAQBSCPOVqgg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sL4VMMrH/Zf9A4+5Uyfjl/aATMGvc1y7QiwddDRM58We7P4JIthmcUEdk+rHr4/H0if5LZp8MpEXpG08MUmSI3JypLhxKcbWEWgNnf10tCbIJli6eg0xdiPFYXAiDfHHZIe21mEuV3TMPaMqSSQ64thkfkJQa/6+VqgIzmanwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Heku1119; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Heku1119"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAE51F000E9;
	Mon, 25 May 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699468;
	bh=bTbnK6bbh5vaWhrPXGU+vYXB1ejIb0US3giAKNzWklY=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Heku1119rPx3MQ3q0vscC0yUFFCmKjI/2wHQ4+dfKawcXZGHUrIHUz+1lv0K46tMQ
	 tCcgUlMXDLTtx5s/3pVipOMHX3iZ/8YRdgNiKspFCINVSPGGtp/bdgZT/TxtdjEKfL
	 VyWZIZyNUJ9nom9MScIpldQj93DvlE41F6m+yfVZ4dfvqmCmBVnKChmhUnSGFyrxTb
	 lXc2YILxJOck5hD4B+5l9X/9om0to5mOcfvcsX6V3KJDJbMVQFN/dZhUo10+RKIFMW
	 XjnFm3cqA36cyE5TZnG0TvYfG96FLOTPVQYMfJlT7e0JO16N1r1/EkB1PlkHYyAGeg
	 Rd41hXIrjoFag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] firmware: imx: ele: Use dev_err for error report
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260525-ele-v1-v1-6-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-6-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:57:47 +0000
Message-Id: <20260525085748.2EAE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The introduced dev_err() lacks a trailing newline, contains a typo,=
 and introduces redundant OOM logging.
--

commit c914c76ccf6cf2fdb05859267c584040fec1d7b6
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: Use dev_err for error report

This commit replaces a dev_dbg() call with dev_err() for reporting a
memory allocation failure in ele_get_info().

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 05a518df38cd6..2f0046cd5ad06 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -74,7 +74,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_de=
v_info *s_info)
>  						   &get_info_addr,
>  						   GFP_KERNEL);
>  	if (!get_info_data) {
> -		dev_dbg(priv->dev,
> +		dev_err(priv->dev,
>  			"%s: Failed to allocate get_info_addr.", __func__);

[Severity: Low]
Is it possible to add a trailing newline (\n) to this error message?
Without it, the kernel log output could be mangled or concatenated with
subsequent messages.

Also, does this message contain a typo? It mentions failing to allocate
get_info_addr, but the actual buffer being allocated is get_info_data.

Finally, since dma_alloc_coherent() already natively dumps a stack trace on
allocation failure, is this custom out-of-memory error message partially
redundant? While these string contents existed prior to this patch, promoti=
ng
it to dev_err() makes these formatting and style issues unconditionally
visible.

>  		return -ENOMEM;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D6
