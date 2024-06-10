Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9201474C8
	for <imx@lists.linux.dev>; Mon, 10 Jun 2024 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038044; cv=none; b=gEzAfJ9HnuqBjDGd09/IwRM08Qn+RwqSNrdof+NrpRThkkuaC+awrFfZ/k5bYXUN2jHYnBo6jExMEOMObXSHkSP05iMi9lSWn1FA5kXI5WRC4hX/t5xCz2bt7uJ0kErXfZzOlBeKHGSpTTa44eVtUZQkNQX9UDpMelYdQMsIx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038044; c=relaxed/simple;
	bh=4Hj9IG1LMlzHH3A3y0qYTvhcNtKcDqLmxJ6EzjUt+qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP6qzxASLJD+JO857wqPVVQnHvgEtISi/aXtXrJ0UyVpQc70jvS5QJ9tBYXaq3caB68W7MyUmhizvB0Zk1F/OeNwcFA8AKXVUIJlTIQOoMwbq0piWfWhkjKvpm0wGLnkEd/4re6nbCAyqHu+45jItIpzx9tnUrTPOvhhqdmRkY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJmcHv+Z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJmcHv+Z"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70435f4c330so122730b3a.1
        for <imx@lists.linux.dev>; Mon, 10 Jun 2024 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718038041; x=1718642841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GltpCEOROqdEZtPzqZDYIjfn931I+xP8uUPheSuWph8=;
        b=sJmcHv+Z5qvVpuxRkkrhaodEF/+zlj0OBK8gzpRBxDFeyLxc2jRLeOyR6D2f/SyKAI
         TBXOAYGlds7lASD0+iMOapw0a/DsTWhHhQKwM1ID8Wi/D3+ybli43md6cA0jlwWDJgO1
         4o3nlO1jj47b+x2rjNSJaHjdxmiJ3kDqSDR/KQsuBwYLxIoIdqUOuBfb7htiqBG0XXLS
         OmIBh5097qjP8QWhHiUJRkjJmvlfzgRl6260AxyHnX320VaVifWLp8mWRX+cmvedqXxd
         lCWfLtweyS8cQ8K9QmEQ5kBurhP4ZNr/3qMsjqe5nY1c44xWFonhoG3XWWrjauHFe6xU
         Jk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038041; x=1718642841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GltpCEOROqdEZtPzqZDYIjfn931I+xP8uUPheSuWph8=;
        b=UmpLXSmkwwNIzfnbo16ROb2dbkdTF/ttumeYSZDOssXYEQt56dyPjQ9IkucSAFZUJJ
         y4TONn1VQoiQ+2COrxCVbA0sW4/r4CHdw3MC2gV0wZnVqa/kdWvNBcd/UZbGSTBoX5ZK
         Ccu06iIoXLbGBFBsvDqEIqAUX9UihJMHwLaGfDRt8dQdptmH09nPCJwVy+eAdB4clPVh
         HTATy7/YKlO+g7OyhuKSIAWgajQoWFfqAw1bsI9Y19mMuHSvIfOilzRlra/YXh9qyMTG
         91NV0T8U6ukfz49vljfDqz3K7ettzgVDWsjZ1OkQhOARhzwOOUDHws5NatI8AphOQPRO
         ir5g==
X-Forwarded-Encrypted: i=1; AJvYcCUXHN/eGTkZ6ZYbG1T5EuTTyypTupbUN+P3kCzB346jKNvFhZX35rgjWNBAY3njd1At09zwhSQi1QyC95RMOrVbKDMp
X-Gm-Message-State: AOJu0YwWhPLd+QmUbQnIX98RB13Hs3ZQAqJyNgiHlPNDfNPBwsh8U8gw
	OrAQLV4nDfNrXL6VqkDmcViO1OyzD8mTh2EM/1VxhDVlZtR5+vgjNYEXhcrRVoYIh4XhTfx573J
	z
X-Google-Smtp-Source: AGHT+IGb/lXCCC+JbIDGUdr375qb0RgEL7LsqGDkkx+quxB1SnI5zlcCI8SeIz3Y9Zc+WyklRsuyOQ==
X-Received: by 2002:a05:6a00:8506:b0:704:25de:f297 with SMTP id d2e1a72fcca58-70425def3f2mr4676511b3a.29.1718038041356;
        Mon, 10 Jun 2024 09:47:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b34:fecc:a6c:e2bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70426cc74f3sm4045691b3a.35.2024.06.10.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:47:20 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:47:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue
 while remapping optional addresses in imx_rproc_addr_init()
Message-ID: <ZmcuFRfjKRQG9OXI@p14s>
References: <20240606075204.12354-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606075204.12354-1-amishin@t-argos.ru>

On Thu, Jun 06, 2024 at 10:52:04AM +0300, Aleksandr Mishin wrote:
> In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
> number of phandles. But phandles may be empty. So of_parse_phandle() in
> the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
> Adjust this issue by adding NULL-return check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5a3fb902acc9..39eacd90af14 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		struct resource res;
>  
>  		node = of_parse_phandle(np, "memory-region", a);
> +		if (!node)

You're missing an "of_node_put()" before continuing.

> +			continue;
>  		/* Not map vdevbuffer, vdevring region */
>  		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
>  			of_node_put(node);
> -- 
> 2.30.2
> 
> 
