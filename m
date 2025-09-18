Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A74257853
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198859; cv=none; b=gDUfMXsosDJHnikvn61fXG+Xa3EHhTARNHURo02jIbLA7/fMECaQgBxgG5Ms+sFBIgcPHHoZqjcCVzmm+AlfQmlV65jDSEYv47YCE0Ps4tyN0rUFq9JNNBNFh4vZs0x5vMhXjhpYZ0teKBZMqkhpy/14JCio6VKdX6Ma13pcfZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198859; c=relaxed/simple;
	bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXWsgNtcQQTgoPdHjkrWWunBGEyApqAKYncRmtfW8Q9rtVP5z6tkQxWHMuziT6G+gMZMI8TDS356//VQbGuqrQtnxxfQSILuzX8dx6cvVO09F8X326QpDMExj32xwnNqhSMuGVP7GKYIOyB3HGY861uY2T9UkA274SWkhAHKZI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQnIbSvg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQnIbSvg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7761a8a1dbcso878596b3a.1
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198855; x=1758803655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=YQnIbSvgUTDUWBSMD9QUwcRY+KtiAlfiWtdBwIOXDwjoT2BEiqAczrjl4DXAtvM/xQ
         nyrrm59+IZbJaBwRnauDctZl0qIta48mcCcJMj24thAnLAfGfJis9rn86peB8Mz4LFCn
         bbKngbiwuNj8SMW3zakXIMLaQHBz1G8K4KzJ8jRe2BQ2w2MhMRcPVEDvMUsuYQ2MsNTn
         /UXVjOs+sNcN2+/aPEZMFhwuwj/ZtrSjGsIbqfLvm5yZ2UmK83+l5u+x1yDhIFND639L
         rwYxauDraaq45S4PZaKHtKSfOii6DpJ1Ig5bWpoQlTqKGCE3o/ySOdSRVgH42fWPMzCK
         YwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198855; x=1758803655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=nXLs3ktgOiKFzKK3z1UlX9cd/PE/oUxLpZWkCNsUfqX/3qiwytCHBUlXmPsWxYCk5P
         spy6nK+ByIJJ5D+o/MpGVodqmj174c3zjOjGXumxwkQXw8uQ4/HWODqcCPjPSlbfsUWK
         LHW0HxjvHCJaIlcNOC5Yxy0CssrcMjTpZI106ZKgGsk2JmWXsajS4SYbUOT5IPPRlR3q
         v93UInWuq+g8DoepwgCb8m0vCvso+SVDlrVhPMyJV05GSESwuJxciGnset+4Ins68Dxs
         yVo8jGhWYHFx/TwkxEp0hLjI5ObfMFf9LMjNaIWmzopjptfxywkLjKvWsCSPxBPgtVma
         31IA==
X-Forwarded-Encrypted: i=1; AJvYcCVkYQMijMCFVo+jXEyiDnMp25JW4ym+z8wsL+XEz0bZcS8wr74tXYFm3q+vCfUYaXW4mBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwklZgA/GmR77tjxAj2+mbuSfMNBSKxPeElep+Q8FFgotCZ3PtI
	LmbEaA5DS/DT+KUm0l0KWOrPiTplXf9vux3YuRyHcmSKf3WQNdXuQX416eC7mgdQ0Aav2/YtNiB
	jPgABAZf2e1zVBj6bwhDIU0F9kMUKMS0=
X-Gm-Gg: ASbGncvQ/Ux0P+4890AUgLiVYWnPbez3EnPsB0Huvg6KPAB4iyVM1i6fY3GQhUKT16n
	kVFnI/aAsePrI2oA3xDqv5cq0v1wzqHisx7XjZ3Ycd2ATnUR3Ftt+MEZNGPdj48Zufj5CHmpqhF
	MhzeEB8i6OHJ3uXVyKfAP3hZM9T2Vi7BFmPaDp9vz9EpHBW6e6qaZ3AcbUNG3U0XmjXbjNDpF4Q
	eIPF1qfERt5arml3YpOeUQ0hzB5wHW+LwPqkHJzrvBiH0BmbtuTTdLsR++y46+pGA==
X-Google-Smtp-Source: AGHT+IGnwyZAzgewsFS8BUxGi1+hNmSjaadWufVUdwqAGCS8aqyS2HM8fO6whTlbN/7oWRWldmq3iDfdXt1FIzoF+PM=
X-Received: by 2002:a17:903:3c2f:b0:24c:f589:661 with SMTP id
 d9443c01a7336-268118b963emr75488845ad.11.1758198855204; Thu, 18 Sep 2025
 05:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:36:33 +0300
X-Gm-Features: AS18NWDAzLMXylSrWYdgmw06GR6oKayTLcqLKRKndzdOYMuF8YWkd9yOlAi8pkU
Message-ID: <CAEnQRZD9XGSzYBYMF+0G9RtDo4y-RtX2n=5M9p8Osk3csYrbLA@mail.gmail.com>
Subject: Re: [PATCH 2/5] remoteproc: imx_rproc: Make detach operation platform-specific
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Refactor the detach logic to support platform-specific implementations vi=
a
> the dcfg->ops->detach callback. Allow finer control over detach behavior
> depending on the remote processor management method, and make it easier
> to add detach support for new SoCs.
>
> The previous hardcoded SCU API detach logic is now moved into a dedicated
> imx_rproc_scu_api_detach() function, and registered via the plat ops
> structure. The generic imx_rproc_detach() now delegates to the
> platform-specific handler if available.
>
> Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
