Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3C43079F
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382579; cv=none; b=JMMb8XwL59TUIFMYfrSX7P7+/OKOKJksFQzJuLOxt7W8T2Sma4az5RLFU+WNyt5crmYKWg0KYQskTMLDB9b+yx73PSItJq8+AffcSmfaGOiTv93GMgHDKMigrgK8EtVv1++W5ic2imZbAOlfTEedf9vz3eSZqGdN0nuL1u8IrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382579; c=relaxed/simple;
	bh=8gWEwUfsO3F33rc5Vr/t2TJpJxPQT4ef+ZgW5fdDpk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tocZalt05HNPrpJq+Sf5BIAfK7pV2DYwEnp0UeIxdCrwrKmc+ma9bCF0q+5P6zW+tO0fI4D9aGfBZxPUx7DmKapmVraEa/U8vFLDk5xHN1b+GM1tI1rMHI6EgLs2qcc0mQJ3UyZkcHT8X9ZmhB8Di1HyTtCRBX/IA07buY1b9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gpiDWVi3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gpiDWVi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
	b=gpiDWVi3Mh01e6jZGSoXiS/cTqQ0klEJCh4ubwbCZb+DOcOxHG/c6ZK/4uAVy/1EFNhK/G
	H3dlZuT3w3Vk35RfvnK2j55xgnkgS2YO2p7NKNLvDJz/RZU4vOPMjYT7pxx8BNXXmIVLbO
	zHm0RqRX12fRD5MHEaE4p/cozF9hJPQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Yqz-ww_BPHav5WsZlk_dsw-1; Mon, 10 Aug 2026 13:22:54 -0400
X-MC-Unique: Yqz-ww_BPHav5WsZlk_dsw-1
X-Mimecast-MFC-AGG-ID: Yqz-ww_BPHav5WsZlk_dsw_1786382574
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eddfe28b4so73490167b3.3
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382574; x=1786987374;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
        b=RPcOPK8zaZlX2aHWKcMBnXJIeh2V4bGpk0GPETRTNblUlz1vmCdG+PjLC+7g+UuKJP
         I2Tb3Pmn0vYeE3QANjI/iuFrRTuzknSfozhpdnlzvZHFef5DY6vjm1vL0LmnMtWQJ8Fu
         m576aqhYrbSdFUSAi1vcxjULU7SCZUWt7I6RQObtpj5mK57HPRsZGzNK+UhxWoinQ62J
         KVtRK75zFa460noobnmI+kvBJY/s0gHAmCH8Nhpg6SrV5ql3spY/sk4w9kQyxeypeU2K
         11jP7nhqjLy0U7qRHBcNncuNQK0+N8+gdE+QXABej8J12todTWc4X77OUiQoQCne8dYL
         QxmA==
X-Forwarded-Encrypted: i=1; AHgh+RqiwQGjqxr5iFjVtyWPksKd8cAuvpYAmkhoMPfn/spWjHn+y8BIGVTsve2mIqCsHg9A/R8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPYGVg7lDgX/awHK6AkYPjKLee1oe3aJ4CLDJlnVZWk6qvq2/U
	T74xnSuFximIxk63UzGO3JUnnIAn9LsiG8HWohllF8dttKTgCuc5Bm4L36vxlyRM19EXbYeO4tX
	EXKABEkZNU4FDxyHhdT+FLd0lIFaHkpocQUyOsR1TGqoBwNs2X46zMA==
X-Gm-Gg: AR+sD11wLCQTZ57vDe5Kaiy622OEvNgfucAKrbHuDrx54DjaiHFCW7trTe92mJwVV5s
	UeJyfVGV5uIP/HNGlBneBpcUiUnuzWvHXuFs/z+XOq+zXm8uBV8a/YW5j6NKLN3+uXLNCfOm4Fh
	jrMWkG3vC8DOJgzKNge7Pc0e6vy2SFyG3BPSRthtqN0FfBktpTEyED0K3M7a3jqPVQN2jZrTEsd
	uG4HHEd3rroOWtF6ivIfwdgs89Ggd7U0DgGBe5tDi9wMAWpmN8Db+CTV2Sj275AqTHe2uLWuQhz
	tFx2idqKQ2nb7GuJs/6KQeQLSp8dsrYBTJLYzhcraj4LYeREVEUlAUCtlo8t8I3v92IWlMJeb32
	9/5qWn624ysRwzeB1TeBo2hWHfkcdW98x9z8=
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20804067b3.20.1786382573974;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20803727b3.20.1786382573576;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm60710857b3.27.2026.08.10.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:22:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:22:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error
 path
Message-ID: <anoI6eX9OzI0bsFy@redhat.com>
References: <20260808080215.2669452-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260808080215.2669452-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x5Vm9kox5ynxbcOz_hNjJknZuQ7icuc8tj6Ilecuo6E_1786382574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 08, 2026 at 04:02:15PM +0800, Guangshuo Li wrote:
> imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
> pm_runtime_get_noresume() and enables autosuspend with
> pm_runtime_use_autosuspend(). The success path drops the usage
> reference with pm_runtime_put_autosuspend(), but the error path only
> disables runtime PM.
> 
> As a result, the reference taken by pm_runtime_get_noresume() remains
> unbalanced on registration failure. The autosuspend setting is also
> left enabled instead of being undone with
> pm_runtime_dont_use_autosuspend().
> 
> Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
> and pm_runtime_put_noidle() to drop the usage reference on the error
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 1dae3410ee99..262645bef62d 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  		if (clk_hws[idx])
>  			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
>  	}
> -

Don't remove the newline. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

