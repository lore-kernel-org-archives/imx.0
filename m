Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620A3C09FB
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260312; cv=none; b=JDQ95CRINpOHEDRF85atHtTnfPg4Zr/4OYpc+/X9W0+vB3nF0hoC8rMTBs2ZGrXuf7tONSUppTDiWHE09B0ebPJQqpVBfDEiucIubbrV1spa88qbp5avjnAD6pvC9MDjJcy594De8acURSziW5Ek1HnLu74WzytgCQD3zLfysy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260312; c=relaxed/simple;
	bh=Ee9g0R6zb7Rj5ojaxcfqHgIUshiy5vtwOAeLhGeYw7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pfWhDle+CTc6d8DlJg621dj3w458Lj0i6heVax7ebCFsQw82L6f7fMeHl9HRZIPPWviLhByVHVntVo7sfixcGqxfCtS35JnWwKgWutPL6bFli3X7SDRuXKv3Wvvp/A8I/Xlt8D+OGmL6gRtXpsPJ3wqE0U+laHUmNRDA2/i6ExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA8Vecy+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA8Vecy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD721F000FF;
	Thu, 24 Sep 2026 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790260310;
	bh=tDOsuF6hpllZJhIYq537DIMjzSlLMOAPOrQ0lF7djv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EA8Vecy+K8zseTFA+A60zbRbF2SBii2yfcFKHT86dNw3pkV9NiRQG5eJdR+59KAXI
	 fFGxRPZ50qeLfIpudDwiO3+01fYJmM2h10bzOwYA6EzAgPuaSdJmhFomae31OuswXo
	 BkabvwZvl1gkbXKf4D3KvzTLhG/OF2o1QyOad+gBJXb2pYda1wIc7TA5HQgvDXR9Mt
	 3gK/UuBGwT9KJWrtYj+VaxcMeYD7wzU4ZaV/PsUT+J7KUB/bdXwmVYWWIdbJlv9HXA
	 9bgo8wS/DT0hYdVQ1ca9pOjrqARwePk9dg+ynbt02k0hsKuzhGxDTD5JYU/TCiIDen
	 D/0XPHOcd+Y6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pmdomain: imx: gpc: remove all initialized power
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260924142520.1594149-1-lgs201920130244@gmail.com>
References: <20260924142520.1594149-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 14:31:49 +0000
Message-Id: <20260924143150.1CD721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] imx_gpc_remove: syntax error due to missing closing brace
--

commit 8c74b27165f06b794b40a774855d31374a0b317d
Author: Guangshuo Li <lgs201920130244@gmail.com>

pmdomain: imx: gpc: remove all initialized power domains

This commit updates imx_gpc_remove() to use match data to iterate
and remove all initialized power domains in reverse order. It also
ensures the PU clocks are released when the PU domain is removed.

> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226..d83fb37e22974 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c

[ ... ]

> @@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *=
pdev)
>  	if (!pgc_node) {
>  		of_genpd_del_provider(pdev->dev.of_node);

[ ... ]

> +		num_domains =3D of_id_data->num_domains;
> +		while (num_domains--) {
> +			ret =3D pm_genpd_remove(&imx_gpc_domains[num_domains].base);
> +			if (ret) {
> +				dev_err(&pdev->dev,
> +					"Failed to remove %s power domain (%pe)\n",
> +					imx_gpc_domains[num_domains].base.name,
> +					ERR_PTR(ret));
> +				return;
> +			}
> +
> +		if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +			imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
>  	}

[Severity: Low]
Is this while loop missing a closing brace?

Because there is no closing brace added for the new while loop, it appears
the closing brace at the end of this block will close the while loop instead
of the outer if (!pgc_node) statement. Will this cause unbalanced braces
and a build failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924142520.1594=
149-1-lgs201920130244@gmail.com?part=3D1
