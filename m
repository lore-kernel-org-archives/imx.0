Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D1363C60
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575811; cv=pass; b=H/cxur7oG52Tvl8yNrSWOCgGPu/JQ9pxU2DOmW7NwMCMYDND8jW8y00dx+RbeQLR+idnhfZltrqlLNyF7gzNtnUX53XHxkaXMpW0GybqYIka3Vch3NhQ66JhWtC73JenXV9vcHCIIu2SO6pSYTFqgj+s7jFhO0xq6uV1dECKNuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575811; c=relaxed/simple;
	bh=M65GKSm/6Nikad67Nwpr+AO2trBm+ZFvLS2dH1EsVI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWAg1p5NX7NFTVK/8n73JQflNC/w+sZRBJ22/CLoJncqVLl9JPMuLEgMme8j8zUSqzmRrTUWrTdOiGfgyAWpJH4SWf0eSfVAwCbpa/+COQIQE3M6VsC2SPBUVBqt9Iq2pTwV2yL5Pwvf5yyg4vkpKARSsnOei1KZ2yg/1fAqK+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFozRQk1; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFozRQk1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4747943b8so2861040e87.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 05:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787575808; cv=none;
        d=google.com; s=arc-20260327;
        b=r81wyoNVfxDtPlxJMlCijD1ShsRFNjB9UMn3SYhfxSlcZ39Nznz+XQpuLjUAi6RduB
         kCRqwehMvMj9P3xYu1nhdo2/3kWmr6dHeTVSxuwc08bhLtPAesMophU5s8xxlGgxTkEV
         T+0d26u0uvTk5pRXI/8zQDOLuWWIh2Pg4qakLtuZUywdGjHuMJt0naINMbcn+Hqb5oFj
         Omx+Q0lkc8RqleGGT3k/kIn9kUNGZKFwvWzmLaswDIr3zWljVstvrbGa3gVFW31xW9Nm
         CRs6RN7AoPwW65blLRzXzGwOSRLrDT7dQDoS1Ln0csNBG9bmPWJG0HuaIn8rXVOFXXii
         wOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        fh=zS4YfSjOctIWYClk4uqFinVFNuPmbQQumCnUIC7GT4E=;
        b=KQdJBiid8mtBV2bXSj8ekRk7IA7Hq7cFUt5AdK7umezTB0S1YUBYR3p7DZowh5Nvan
         b6R47PHbSS9UWp1R467v16VBqALQOf2aAP71nlU08w3leVMHqM+ByfJdlSU8tIR+blR9
         c6wUzpdLLS4D7j00MB8+047ycKk7o7ZZy1DNV1aDWD83LG+JcgmEzGZbPzxRyrW/8CS7
         Zl4iNUYmLltJUnoSfHs8OlaYs9+BzFYGELkGft8ZJu7/5IvMHPxzM5H7Dyue65ePwMVC
         9DtOJAhlEkllGNUVZlczY4/dQVa1/1GTWRQ9xxSFm7sC3xRE3rpoKYxsuXQPv3ZHjc/8
         Q20w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787575808; x=1788180608; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        b=sFozRQk1M5aP2k5FrqrI+zZtCa9YZn0XmwT/PN6OHRhvGR5rx44EYlIit+ToJnTDKW
         4LjNleCu59PL1Eqd08I0+uXzZyzlEG1rh+DETyBLvpjhoi77Oz14zMpKhofSZId+euF3
         BzgPqMsQY3cFivcRnB/itgDWpigLil631NCjbC2gLttKOq+AOWWxYTbuVCKk3TrLHWzX
         eqpANXWYoHdSokLGtd8nHzxD4QO7h3ma7tkgImJZ0eED1xByY5J62/ou+vP8ox3R85Wu
         aIgECBt2P7ybrescUQbpJ8uGEMWtLB0ZScfZ9nABVwfaD8pAUERCCvuuTPe6/6dhSf4i
         cEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575808; x=1788180608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj5OrcPbUSHUeRrK+Yhe+jiBoqRvGnLexb+l8ZGxfyk=;
        b=Ie92T/MV4XbuLOUEyruSj98xunLBCJb12K8xgQJDiNUFdiKjT7BBlUi58trKLx3GsJ
         P27V7aZqgQrthAi+5Zb1joqUQMJdBvCrg36abVG5cO0z7JJhbg2IrWPaay6m388ijw/k
         Q+/mzfoLcFUqtEfEfnNSRtAeqTCsrc1ZKPZsRPW5hZaeEcp1a9PZ1rXtZrwBwiknMOWJ
         ojPLI3zCcBXPAYjoJBl4ZfAOKxqecRFKQb9ZoPx6g9XCAR7yln95QXtGxBDUQXnzojOX
         DEa8VpajUSFFsPx5TM3rZGyBmI2UCJmffC2fu5vrn+03QpjGqowojgMnn+OVB5X2S5dy
         oEbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqK2BO+KzoEotOyO06dhIbXbkMWerkI5z1ut7OlPOregiYLuYkKiXMb8pNXptCCwHXvS8A=@lists.linux.dev
X-Gm-Message-State: AFuF++lrp/0tPsLbjKom6K6obPu4kp/guIQbcdfMDzO/2LM4Lt1+pI99
	wcAxOfyHbOKYPeY5FlHQMdBvScrw8jMrjuqSBqjYHj/FGja5T5zHEeuY2SVjNrp7y8Tu2FkfsMg
	cFnf6ijwe/uXLv0JEEMHwnTh0ykYN14w=
X-Gm-Gg: AR+sD13fACdX/AXMMwJi1msDjfY2cXRnKmhLZrwqna7omk0kfzE130G6Be3ibwe2UbF
	KOTqZqaPYWHRoh+gSSe+yjizdWnNeA/TDddMMy4oYwoflkKc4no5qmOIkAU9KCj3Qw/SNsZsILU
	QQB2J8Sy81oVHi6xjmeVHBa0fmQDICp+qFYYCw6tPHIpIxjkKP6lfL+dtYG8qcuEq9sL6cPODDS
	2e7CYzcFg2DwhHG0ujm9GYzYi30/6xApJPUli5YdGeN3TTty+a73c5LC8LsZ0M91GhOZy4Lo2T8
	Wp+xFFSKjq/cGWUhMPgLkWk8EySVvi+XCMjW0OgNcqWZzv2Zs3yu6aKqD+sNEZKKDZXX6IOaVAY
	YlgFD8PgsIMi0kKahS/8o3T1xyjGSHx4g
X-Received: by 2002:a05:6512:3d09:b0:5b0:cce:da00 with SMTP id
 2adb3069b0e04-5b48b484764mr5090274e87.1.1787575808126; Mon, 24 Aug 2026
 05:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com> <aohftK95_iDsTPPm@SMW015318>
 <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
In-Reply-To: <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Aug 2026 09:49:54 -0300
X-Gm-Features: AcwNN1UOE8_YKDKnzMxa-AYkEswtmNEYtfnyPTae-IZsOuoBl4dxSuzeIfXj93w
Message-ID: <CAOMZO5CdZk3oyMpwPcTEeROBWBr70r9J7Vt-MiEA4+Y7abE5Sw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
To: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Frank Li <frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhipeng,

On Mon, Aug 24, 2026 at 6:38=E2=80=AFAM Zhipeng Wang (OSS)
<zhipeng.wang_1@oss.nxp.com> wrote:

> Hi Frank,
>
> Makes sense, I'll restructure it that way for the next version:
>
>  - Move Fabio's IRQ-count validation up so the count is validated before
>    the domain is created, and add proper error handling there.
>  - Since the invalid count is then rejected before the domain exists,
>    the domain leak can no longer happen, so managing the domain with
>    devm is no longer a fix. I'll drop its Fixes tag and reframe it as an
>    improvement.
>  - Move that devm conversion after the new devm_irq_domain_create_linear(=
)
>    helper, together with the other cleanup.

My motivation for sending [PATCH v4 1/2] irqchip/imx-irqsteer: Convert
to devm_pm_runtime_enable()
https://lore.kernel.org/lkml/aoXZf2z-50H8rimI@lizhi-Precision-Tower-5810/
was the "Unbalanced pm_runtime_enable!"
error during driver unbinding.

This was seen on kernel 6.18, so I would like this error fixed in your
series with a Fixes tag, so stable kernels like 6.18 can be fixed.

Thanks
