Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109222BAA2
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043115; cv=none; b=Myn9Hix6vGw9HOEShxP7xANzdlcjkWiVRGwGSPzaQ/XufGDWy0BWYoPj9MIB1G3UVgk1TAanFwlEvUq39/1G/M+6tjCSBBhsIDnrq+OWo7XwndLNdewXnbGH0bAtz3LiSAru9mpAYWeZALWFYQq0OjVFF/JmXt7nSSdk/MTU+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043115; c=relaxed/simple;
	bh=TsAFTtAPHFDWqClgUwsN+5G3GYn9qmIlLxL/HqroH30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJt0yD+oOTLcDhTZ7k016tbhRiTUC61nYXR3k5M9MVnKiEfeEFSW8N4PdATmfDwaNdAk1bjVn+VJx4wgoWiHuRTYnYhU3WuSj6/QsIwWYUmrtMaNEDUD3UtfL8b1nAMN64sTy2yxXnn9UUBouZ8BmYVRbHLyc6t9nOe7M/EO6zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uhHwpFmK; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhHwpFmK"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e479e529ebcso1571173276.3
        for <imx@lists.linux.dev>; Thu, 16 Jan 2025 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737043113; x=1737647913; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xZg7i9Gkt1p2UGCmQVCKIa0P9txKm7ecHDqIrA9B8RM=;
        b=uhHwpFmKijI8jURoJvgk8bVxyuBIaTpk3sCcWOr9q82/6Y/lsn93W98Qgs68CKnFkX
         h5Mqm7ZGgamKYAqvrlKJL7HCoKHfC2NDuMpSa8B8EFk/pjq2hzC0yeZLPtBGLf8vmjvL
         mXrL6Yh0NOeL/XoYTQG10/3pljrCWZ+4lYD+oy243HJk0vQZojBS3QOBOQ215Va69GT3
         n0LTsr1ng7EB/kv2/gg1XkdMc+twy2fFpfrkfGJXnkKb5PsjeTH/EcVaHwXIAmvhyLRL
         9bvtTsYGWZcQjxVUNpm/7J+bq9IT4StEFgmi/dvShlBW1Vk9OwSm+OfvF3ZHGOGwId09
         s6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043113; x=1737647913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZg7i9Gkt1p2UGCmQVCKIa0P9txKm7ecHDqIrA9B8RM=;
        b=vwwMtONBUMXFDPCoP/0AIHds1/bSYgSJBK5HwOgubNyfW+O8Ju1lk2EcwJafxC/6Ga
         R8PHNwUbufJJ4JHc35bgck819PmzixYrGjGijufZK3HltAbKflTmkL/O7jcI/UtyFwgW
         wSnOKXeL/+nWdlhkCdCtrGLHtjpj4owNeWQK6mtOkQJT7tIAV30GUq/j45XhG/x5Gu5v
         AlBLH9G641iG53h16NJ3D3PqKjcojjU3vAdPT+66Yz59rOWlojEBK1IV7ff489aw3j6e
         I3axzatdohsB+eUzvqUWCA0Uwm/xw7jb+cjjaDnJdKlSkSjBT7Mrk4Dc42nVtw7LIsJC
         znDw==
X-Forwarded-Encrypted: i=1; AJvYcCVa0upwpQ5AtBpeWzUgkttJIindsmCz36AEH5V3+ybcXd120psxiROK5e0Umzq+R9yqejk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc96/5T2hS/mbtuIjfScU8E3Geqx5tQvo6tVC3U2GywlE6aLwV
	tCBv5UV/KPW81Hh5qTeNz9QI28g5Dw36RZSWz6KKgigp4h04RfmQll02Qsl39Pglb5sqHkBkaao
	uk3kANNcGICBLGEFh/otqUxQGUXzMP5s7FfMoTg==
X-Gm-Gg: ASbGncslPnbuaXmW9Zp4TlteAgpkfuZP5RdJJ2HZerproD/5tgHK4gdOKT0qopDetBM
	E9jT1pXEyYE1E/SQj6rUQ+CNKZvJcNOdeknWX1sk=
X-Google-Smtp-Source: AGHT+IG1qVTRfq3rD5NuthhfaJDGZx9itjIkE76nEv6cFISZ83dbq/vsbg+foxsWE2MrG6pQrDxrf7Opr66/DdtZa/k=
X-Received: by 2002:a05:6902:161b:b0:e57:31f1:972e with SMTP id
 3f1490d57ef6-e5731f1a4b2mr20182789276.29.1737043112819; Thu, 16 Jan 2025
 07:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250115014118.4086729-1-xiaolei.wang@windriver.com>
In-Reply-To: <20250115014118.4086729-1-xiaolei.wang@windriver.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2025 16:57:56 +0100
X-Gm-Features: AbW1kvYIxEEhaAOaS13it3QYjlHMEzrYgUS_q1Twane_cAE7ZLMDO-j-7TvLw_Y
Message-ID: <CAPDyKFrpwPLjk+fzAC+1=z5rWJ0UiSTndbq2hET64KDcwsNzKw@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx8mp-blk-ctrl: add missing loop break condition
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, Frank.Li@nxp.com, ping.bai@nxp.com, 
	l.stach@pengutronix.de, marex@denx.de, aford173@gmail.com, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 02:41, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> Currently imx8mp_blk_ctrl_remove() will continue the for loop
> until an out-of-bounds exception occurs.
>
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dev_pm_domain_detach+0x8/0x48
> lr : imx8mp_blk_ctrl_shutdown+0x58/0x90
> sp : ffffffc084f8bbf0
> x29: ffffffc084f8bbf0 x28: ffffff80daf32ac0 x27: 0000000000000000
> x26: ffffffc081658d78 x25: 0000000000000001 x24: ffffffc08201b028
> x23: ffffff80d0db9490 x22: ffffffc082340a78 x21: 00000000000005b0
> x20: ffffff80d19bc180 x19: 000000000000000a x18: ffffffffffffffff
> x17: ffffffc080a39e08 x16: ffffffc080a39c98 x15: 4f435f464f006c72
> x14: 0000000000000004 x13: ffffff80d0172110 x12: 0000000000000000
> x11: ffffff80d0537740 x10: ffffff80d05376c0 x9 : ffffffc0808ed2d8
> x8 : ffffffc084f8bab0 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffffff80d19b9420 x4 : fffffffe03466e60 x3 : 0000000080800077
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> Call trace:
>  dev_pm_domain_detach+0x8/0x48
>  platform_shutdown+0x2c/0x48
>  device_shutdown+0x158/0x268
>  kernel_restart_prepare+0x40/0x58
>  kernel_kexec+0x58/0xe8
>  __do_sys_reboot+0x198/0x258
>  __arm64_sys_reboot+0x2c/0x40
>  invoke_syscall+0x5c/0x138
>  el0_svc_common.constprop.0+0x48/0xf0
>  do_el0_svc+0x24/0x38
>  el0_svc+0x38/0xc8
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
> Code: 8128c2d0 ffffffc0 aa1e03e9 d503201f
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v1:
>   https://patchwork.kernel.org/project/imx/patch/20250113045609.842243-1-xiaolei.wang@windriver.com/
>
> v2:
>   Update commit subject
>
> v3:
>   cc stable
>
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index e3a0f64c144c..3668fe66b22c 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -770,7 +770,7 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.25.1
>
