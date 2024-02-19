Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476D39FC5
	for <imx@lists.linux.dev>; Mon, 19 Feb 2024 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359816; cv=none; b=rt6Zwx2zUtBrdOhUilMl0ifrWKdRi+sJxKlHt38IR9Ov7NPL7SxU5Kk5RvsUIYriM35AbQyciddx1eRo0VBg3DXWpwlj6NIuLpoks2FuFBfIl2pPhM+pxtZaGKteOEpdVu/9VGLRlS1xq2K2K6TjWAtbMEYB2GdL4e39K4Dsu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359816; c=relaxed/simple;
	bh=+D5YYAsErOqCse+fPjYBEdC9kFrJx3mF+Nk1IPOoTbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsHGOS8Nl6OQ3brAG3rhRe9yKGKauDLIPJUvDWoTRGW7lleVKjzLXMoJ9eWyl83WwQXlDSNyBoCw69E8HPmeibpHT1OYHyi7hEDh91Zl/7Ju73Nd7sdE9Kjci35en+5l73jXVNpn3DXEfe0K1zJLSEsXseiMS4cZnd108mNRnqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kARTPqOy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kARTPqOy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29964f5c904so167388a91.0
        for <imx@lists.linux.dev>; Mon, 19 Feb 2024 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708359814; x=1708964614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D5YYAsErOqCse+fPjYBEdC9kFrJx3mF+Nk1IPOoTbw=;
        b=kARTPqOy9D4d5CYqYzL+5bc8lhBN3IWPuJqH8y/s4kYox7jP0M1Wz4df7I8XVHQL8l
         9LE47sYGUC9v091iqkWVkd6YnUadqhqwuEsEsloOiux0UBoND+NRSl+k3x4cDe5Ovzka
         sz4pcdvMKyeEFe07PeL3gGXuy/coKdjKvpf1F08KE+fdGkz5znJ9nUOHa58GkFCaGP/d
         y8kjzREcn6awjXCMNgnzqmlaKBVzWxEhmo2rqu1S9Kk9xvsyn3nmLD2g8RPtO4puKEgK
         FdA2baXrXx0wIkTsVkbalJDA/DtdVwZtzynrJ3RA41ULSu1wgEdFJ2UvWrPQ/kkGi6l2
         9Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359814; x=1708964614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D5YYAsErOqCse+fPjYBEdC9kFrJx3mF+Nk1IPOoTbw=;
        b=kIlHPpXN8WbxzOOVRQBl+G8gsTEjh9tL6hqSH6avkNEWyL+yxFrCC6eXN8lZhKylec
         onyjJVZgL/aBasHm75Quu2qJQovc8w1nMZNK8wjXT5oSZulA0juZhUr03hmVZ+rxYrjw
         ay27/Vmgwf0NGzB+AaloJLTyQiF22Ex7z6hd0h4JyfMx60tt/fEd09kryhentJJCz+n+
         EwJuDNoeyNYKX0eKfWGXBdNBji1MZ5zk+HNCLr/1SNX1879pkUBOmjma3MJLKBpvplHt
         8gOOiBuWZDvmgN/MghNmamrvrKbd60KpQG9LIcjBCOtntygTKroXAbLIIQeLpuGVOr5z
         xJiA==
X-Forwarded-Encrypted: i=1; AJvYcCU9WXb4LKQ8ubGB0FD8956C+jyWK1/CQv0/BSsvUajE1pELqwDgg52JQbl0kSmf6k5Yv3Q1u11IwENH3Pj9HOLPkf31
X-Gm-Message-State: AOJu0YyURhyFDBv5DGJ5nnoR3OD5khNQFs9o1xbVa8tLKif/uFbaAsoC
	UjYBiu0quk62icVCq1igmFBaBlH+4c/BkQEjKpOZ10leVYd14SgKcVyR7I1UsIXz2W6yB65U/PT
	XTEa8m0uFCvu3Znx2ueN7UKVBjps=
X-Google-Smtp-Source: AGHT+IGC4MiCOuJgMCaNYzE2gAv19LVxth2Ob5XBRgVfMJUNVLjwMVsCRccoio7XPQSJVvrQtek/awV3z4kI4V50KP8=
X-Received: by 2002:a17:90a:38e3:b0:299:3748:4ada with SMTP id
 x90-20020a17090a38e300b0029937484adamr6973062pjb.1.1708359813553; Mon, 19 Feb
 2024 08:23:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240219155728.606497-1-Frank.Li@nxp.com>
In-Reply-To: <20240219155728.606497-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Feb 2024 13:23:22 -0300
Message-ID: <CAOMZO5C4XFGoWYgexdFLgHiXAoAP7-aMdi=K6CG3adQE_mHAmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dmaengine: mxs-dma: switch from dma_coherent to dma_pool
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, 
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 12:57=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Han Xu <han.xu@nxp.com>
>
> Using dma_pool to manage dma descriptor memory.

Please clearly describe the motivation for doing this.
