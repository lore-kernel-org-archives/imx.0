Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8819D8A8
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462234; cv=none; b=a048uhlK/oIoz57KWYCpffTf1n8WM1Ew723oa1863khuZM+1z4n+vSzhw4XHsJLjg9SlegLVDCGEN88+MauzikYEU1eouLXTZdiJOa3EGxlJmPFvJjKmTP1+xKl/+xVuyfovqtowtZ4tigNySyHu6M60RtGciXAC7R8DmhzrptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462234; c=relaxed/simple;
	bh=jcU/orumlgsJbKSrF/Nm/W+DgTU2zdH6jx1nkml6CZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYFHOD1DrENUAChDOcIbv4iosSqoWDRbXDuKVPegoJe1LJ+mbMEZcS3DgtmOeRnk9ty3xvbYV/kBKzRQSaY2OdRwSdd6dABJZUc6mBHmu6oVq0Y1IzTSdNSaA/6r84Qir6xsRDMkj8Wa8CgrzrmVmDT7npGB9sq+SZpYPmN1ItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cgba/uvx; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cgba/uvx"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e330b7752cso20595897b3.1
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462232; x=1731067032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPmo8da7gVQeFsoekZ63qpPCKXE92H2RSDUtfff7nM=;
        b=cgba/uvxhgP6wnuLu8zXQr61jU+CXI/FV6f4ZCN3uXPZJ1uV+r37OZ4/EMc0wN8p/N
         8Ql81ly4JZ4QyauJelE584uHx+o+wUp9vdzqBSHu7kw4IJgZBOJjvRwvMu9G7OvQKZLD
         ek78+TPe8YcHJdwpDhti2jHzDJH5UQvGk35cU8RrHVEw2GUY/xktEm/gInGgv8mRfs9v
         SVphM0u1t6SeYGiTTYymQ73ct3Jgi/Eujh+fHp+t44lCiaHyVWIYvRloX/83zsjPbheM
         pIFwK+ed15O/oEnafM19JiKA43ofJl/TtuptztN38k1rRxUSsmxcb2laV/kl2zE5UPbM
         UVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462232; x=1731067032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyPmo8da7gVQeFsoekZ63qpPCKXE92H2RSDUtfff7nM=;
        b=QOcvnFSBcIHg/gvxbnvKHCOB6UlSbheBlm4I4nW8jV4TvHoQdMOSx9CkHFccRX5Syw
         WeiVUjKM1PEu+sJEmSffbypvruxQskSlpjROzwgouBpcOdCEzN6pMg8HHjhO9VrMuX4b
         yzeDEcdgKBWE3SVonKOk1fotPgTHzYtyP32rGEdWVGsnDaGeYEsCCEHXX75L/6PDEBW/
         PzfiBazbIoF1xNqBXIbftTqU9mmYeML7PYo0Q0lge2mdxp9BrQVeJQza25gijhfxPdKr
         ZMQFC17OwhH8f6HWJ2BPzK007FMo7bSEkXEdJ5rVn5vfrMrkCO2lIDYB/SJbWm9Cd3JV
         yoJw==
X-Forwarded-Encrypted: i=1; AJvYcCXULINu9UArbdxJqqzfDH9TdCn+Qof5w0l1o9LRItI3fkfFUchNml0tpwEBzaKclQDIoFk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yywqkkm/lFnBGxN7k+WvaUsvF/sxP4CV6T4gP0Ae5InUz34I772
	esSHIEMk4yI8FOq+ZrSl+dTBWXu0QiaxmUCbzOliJmDnz7v3OdGFcy65zi0W/L5yBcbrMAk1fux
	D1bCmJP910Vcz8UaJ7vla0JcTPDJ58ParC8C/lg==
X-Google-Smtp-Source: AGHT+IGjFViHhhsIEjWSeBRVVF02vu14Au/x1uufAjiQ0eyy+Lk2WKoLfjrFanaJSgIrSL/w8V1/5Fi83AtDrIju8t8=
X-Received: by 2002:a05:690c:d18:b0:6db:d02f:b2c4 with SMTP id
 00721157ae682-6ea64308628mr27197277b3.7.1730462231906; Fri, 01 Nov 2024
 04:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101101252.1448466-1-peng.fan@oss.nxp.com>
In-Reply-To: <20241101101252.1448466-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Nov 2024 12:56:36 +0100
Message-ID: <CAPDyKFqmeCCkv5Yr0K9P9eToYTYsQmQUYmbbJvoOJ0O5t5tsjQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx93-blk-ctrl: correct remove path
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"open list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2024 at 11:02, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The check condition should be 'i < bc->onecell_data.num_domains', not
> 'bc->onecell_data.num_domains' which will make the look never finish
> and cause kernel panic.
>
> Also disable runtime to address
> "imx93-blk-ctrl 4ac10000.system-controller: Unbalanced pm_runtime_enable!"
>
> Fixes: e9aa77d413c9 ("soc: imx: add i.MX93 media blk ctrl driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> index 904ffa55b8f4..b10348ac10f0 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -313,7 +313,9 @@ static void imx93_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       pm_runtime_disable(&pdev->dev);
> +
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx93_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.37.1
>
