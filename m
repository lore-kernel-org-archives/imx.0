Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221734575F
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772570; cv=pass; b=NNDHJuyx33m30pdFO9OwN2xR7EhuGOZnl9eVwefgkVp+qpT+e9BdqW/QX+1ufUWj/2ZvubhBXsCkmv7gdce/h7iTHDule0+RPkk3wa2AJ6B5FLMA/AqZ88MEnlcascbbnIE61CdBaQzF32znK1boYH4smWEZuq2cSnGRuvxAtNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772570; c=relaxed/simple;
	bh=wFOcMo2tbzJO2qV63c870tTsa6KEv3ciZMWj7P7OD20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbIcMQ6Br4qzb8AzfrtaIYa0iWJb8RynDLWdyBD8QECD80lID1AQM8Ha10Y2mGWP/KvsvwsDqf+yGDPh3YaXSt8LrHPom3DMB12nY3uKndsxBsjLnhkHLicaxThuVD/KABdCZXzfbuHi42NNDbRpgdxb2hHLfMMgVDTD2ZIVVoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WFMkyFJD; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WFMkyFJD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382fceabddfso15700071fa.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 03:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769772567; cv=none;
        d=google.com; s=arc-20240605;
        b=D88aXK6ob0VoZ3W39UzdUrTo605kMbBLgoMPnPVCmvPNvspfL0d7b/uxDJfxSj27eE
         1OtDU/DFVrDrnKlGKGRsu44LR7qWovvJzZpjUIXQeIw5nW9s7ZKyUG2rmo+AGu7xdhQs
         xRHnXYgwysPP7n/XC500k43G4r3P66uIFN5LQYT8GxmB2nQ7hvFE1B9BWVsWbPut5kci
         q+1HIL8sArVKebrKg0GfPyMxuDPGLiRbgoY7tRWr9i535X+XFEp4o4uQSD9PyaUQ020O
         D1sU0/JpQlCL0Y20dhoCQ0wngaozVbEMwHYx9ldLo2VnlnT+gg769Lb4/JK+nhNZwdjl
         snNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        fh=GSmaOYrO70v7TSNzkkAfkLGYDS1tdjrkA2OZ75JFVvU=;
        b=Hk6tU+zLvBTIegwysBjedl7/peVuKHX7jIt1inB5T7ClFVfd0VPxU8kr1uRNiKGo8E
         Z3vJ3v3BxcOv3BqQ7kPx8g2ghfdPJwzVN9KuGHGfRlOMLfZkFIKILzZSK5/zY9d+ohzG
         LTSB8R5i/a8I92v40rzL/OljxewXfwBFbfmc5eqaC5DT5tFY/+UjYH6adlgwBUOoUwdi
         IrIg2hMfWVy2BKhoZhIYEAfRNjYHz57BPD23efRlEg77FmiTrO6TjTa2rsnhrGs1kfZF
         6jLeiLvs5rBH7MfzpwWkXOHCZyVwYkEZ1aeXSt2rnjaby9/ivKsoDD4wqq0pOnmeJ1zU
         kGJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769772567; x=1770377367; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        b=WFMkyFJD8c4q+AXucPWXv6/e8zu1+iKRm3S+nYahLlMyO0GGiEGcAGRALnbroe9OPg
         lRgsaJ0sHLGZqRSrGzKoiKWiabltw1mrH/hbwUTvouDH2jh9Qf1xu5lDT2A18+fwFWbo
         DYgvvh5rm63VLhdUOekppzDwVad09ZIFC75CU9YIYnDXWbptLzwp7g1NM2KuCl6lJgRd
         jT9xR9IeN0MSxe9s/669mCeyzs5hRtuWIovSKDuMt5DIRLui+WFjMWbePAPqEZ7Le9wH
         We50ljOIX2X22XE3MLFVnRmO8rBchPN5j5hKnI/l+Tp/XDXUvjGKQiHMWiT2zvUxd9V+
         TUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772567; x=1770377367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbEnXixljZraid29u+TVBlnssG6MakYScyhKGxGYZ0g=;
        b=BGFipjKJD//zM6D6c/bEsiuiRtPSfyFxUeyX/rNbzZoK2B/Y9q+wtAX6u1ESWbqABp
         9kQ2HFfc0u9yXlxQjg4+qMkoadS8Sh8xrmFbjpjm3U/sTZ1dWwnAgZtSXGIGI5DksqyO
         so2BtP+Zq4TLwdJ4MnjySzEj42YeedJCuebqI8jxESfu5Km3+SSaTa7XtQQ9uz5DDsox
         e+bjoGkK6wubbOfpbLS0wmuP2mJWUEL5U2LNbzcngCbrPeuUZCvoLjolQU4n5UCybxXy
         XoCNEbxzjlDzUNNzbqg824DWdAe860xQt0gE/ocA05Bnyh+gPopkim+koBaa5VwweE/T
         Y6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX8hsJprynTcil/x1Hz54AJrf/JCycnz71FEdZpnM0k5LqR4U5xCPCt5J7tea81s1pUu+o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUxJObw9cexPnetC8RAejXhVrJ3GJo72qht62XRHe4euPJnigX
	q+D/UYjM0ZR/3iK4+Ki/ADaC5dhJR7HuK7byP2a5j92m4sf6h47uWvw9VOIZ4PtbBvgQFhklVad
	3fq/Sqj0hGzXGCq02eXMMmIzGFNT17pMXREIT7vT1CA==
X-Gm-Gg: AZuq6aJNpUXh4o0udgnE9Cd+MQNGmmDeRhQHQHQC4BxCp4Puh3G/UHU3DsgJVwKHWYM
	o2DAwZk20L/zWCglqpoGDwo97k9AKurhX5ZkCXAcWVvRHQ4rZB8M9z+kxnwazT1ukOO6Kfviom2
	Xankb2K2q5UXKKEi2GGvBz4XLeLS/RpkEkXwz8qQMZfcg2Pj9wws9zultrGr6FsQWJrTM8eipMq
	ClYvlWNUHWRV8lwIfMeuyY45LIRtX7l/ZJN1d2NBMyV6NE86hVLJYJwPfbwuSb1BMwokteb
X-Received: by 2002:a05:6512:224a:b0:59e:417:27f9 with SMTP id
 2adb3069b0e04-59e16429e70mr896593e87.44.1769772566817; Fri, 30 Jan 2026
 03:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130051107.2130200-1-xu.yang_2@nxp.com>
In-Reply-To: <20260130051107.2130200-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 Jan 2026 12:28:50 +0100
X-Gm-Features: AZwV_QibZsm573nlfq_ooYxHiuwgVu5XH3YEh5JOtPYvggTnLni4Oi1IejkPYVA
Message-ID: <CAPDyKFpAiFSUXBahWzEbqPnyT_R9FFxryohCKHA=REdcv-vyiQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
To: Xu Yang <xu.yang_2@nxp.com>
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, kernel@pengutronix.de, 
	festevam@gmail.com, khalasa@piap.pl, benjamin.gaignard@collabora.com, 
	frieder.schrempf@kontron.de, p.zabel@pengutronix.de, shawnguo@kernel.org, 
	l.stach@pengutronix.de, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Jan 2026 at 06:11, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Fix out-of-range access of bc->domains in imx8m_blk_ctrl_remove().
>
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 74bf4936991d..19e992d2ee3b 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -340,7 +340,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.34.1
>
