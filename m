Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAC1D9324
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733850; cv=none; b=GPn4Rrp7vphrZUy6HDnGj4bmKgVXFeJteGgqUi8FAf1gnj0i5jPC4BsMuew1mQqV9uwZuQCqxXefn6KanP5dgvCwTC8hDKb8JDGkqzbg5jxtzX04p1pr6k/NnRBtsgJy3eKaedY5EEuwsr6dEh1YGV0Oa9/iz/WNXKLJn7LAyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733850; c=relaxed/simple;
	bh=HYExp4oXUsQAT4HO6WQsgWUuJ0hNRivj9oi+MVWi8Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWDqVc+wcQK5sPT/YOY7ILwvuXs0xJOfhi1fQ5lN88BD9fO/PHvKjsP89LEV5f15CG8kQWZECm0vkFComIMjfTw4rMr2bEg1ulaGmuyFfco9s3D8EwLBwDeS62AYL8XPpSK4z6sr4WFJk3IG4G9MbShxy7rCvTkntvibOr63zZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeldVijQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeldVijQ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso22680a12.0
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758733845; x=1759338645; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5p9OhedmlgnqtH6MtrKzkYKSqLa11Xwu0UHh8KLtW4=;
        b=PeldVijQxN9Io/79XhY1dmxLNLOW4nCvyJ6ja0xtKT4D6T37KUQ2eYnd/9oMi7WH2K
         zKYlbZkyYWYxNHJcLDe5KrIRGMc1BacrnrUYIE1tCiAn7hUiTA/I9c8oxcuS74niOok0
         qedj/TAGx3aRW13pBei0oDxrR8vPMtU7LCsQdDf72osUZ16Ai9Xd8Qb6Z/oOX0k5QgXs
         9HYGYboyEM4x1kAz5Tz6PEpFoCErRlt/NWjJCfaj1+QfUbhC+dS5a7oVw9af+wss0nx7
         v2HwWHsb4g/y2EuaGvqaSzhx7BimcdSXxeOqA/PzitUY0f3G2g4aLp4T/YbKtBTx3iKy
         HFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733845; x=1759338645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5p9OhedmlgnqtH6MtrKzkYKSqLa11Xwu0UHh8KLtW4=;
        b=lnJpS5rmeViUtaq+uS8uUUl+Ak0QzWiE47iYv+zjPfc+oi89hoMgIuozrGa/+iGEGY
         kM3CCUru1Sky4OW3M/DajkgIwKP56N7Pe2QpA7ylTqwqlBl45Q9K0K9acUnyh9JuAqcf
         acYWPo7wWOaKjmw1eU587djIG9qzFhpOJcg6gY2dAcAAH49i8YFnMISFXhmkYuvlBnBS
         zGBT68bigJkyM0YuFCnPFOWKD8DUVB8/JFFooCQVPReXuMqvuxLBB0lkhup4ODaIXhlz
         EvC7IanZ5YATCgCMiJN1CXZ8I0gUNj5cTNFXnzhaEXBqbO1sC4BRYQB4HNFdcFdzKoRf
         3tmg==
X-Forwarded-Encrypted: i=1; AJvYcCUhaqniefhgQMmWo8u25zUV47jNt4jBzSdBGhEhK7uCoYiJzy8Gz+7Or7F+MLkEPkKvPZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ9prt8pbicW9SPjxXNwr2UIA1PdiiNlhMFaVGCimd5CwtGm58
	pKDt+EKk6DDH9C4nEJEPMiYI1IT1JripPyBtOBYmT3E0J98FlWP8fsK8c/xNqLEERP59RUtsyuB
	BHofH8idbdYo7HD0AiNSx53hWsB9h3K5CzqLXRYZQZQ==
X-Gm-Gg: ASbGncuuSEiJYIILACPjEbk7UvQskg9BqjsxOYw2rDmnnIlQDjbBOMasHg5ICvukC/o
	XD4vNu4s/4Pcg+mjz8CbglX79D1eZugUyaSFjoq+bVLZ5hbRdGu6qIjsQlm1F82v2n1YgWkcpb8
	ZGIpFwTIYR+3i1CEiB4yXoGDAVLl96ibx8inlmg9MssNJLC5iHTZk2zksaRi5SMnPWxWo/2HjNJ
	wmtMy91nP3mgBn49Vc6cJiDH8Irvfdj9vdPQfbnTkDHOoY+veKK/5IditHKIKYArL7gEAuWNq/E
	tMiCAyU+Jip9ea6qCXOD/ZmIn7kH6Tqb0G9GmdnZ
X-Google-Smtp-Source: AGHT+IHZl+DbJWqzsW4usvg5XU8XG95/QBxRsXHVNuqnHskrM2O5sL7CTEM1KL/dJojrWYwbNX3q4vepU43szuZh3Cg=
X-Received: by 2002:a05:6402:5612:b0:634:66c8:9e7d with SMTP id
 4fb4d7f45d1cf-6349faa3493mr143723a12.36.1758733845069; Wed, 24 Sep 2025
 10:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com> <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Sep 2025 11:10:33 -0600
X-Gm-Features: AS18NWBF6pgBTDh35FbgLrsaT57uZ-qc2vyxmLVdoUBaK9TLl5St00uV6e6iIsQ
Message-ID: <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Mathieu, Bjorn
>
> On Tue, Sep 23, 2025 at 01:16:32PM +0800, Peng Fan wrote:
> >This is the 2nd series to cleanup the driver.
> >
> >---
> >Changes in v2:
> >- Address a build warning in patch 4/6
> >- Add R-b from Frank and Daniel
> >- Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> >
> >---
> >Peng Fan (6):
> >      remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
> >      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
> >      remoteproc: imx_rproc: Use devm_rproc_add() helper
>
>
> Sorry for early ping - I just wanted to check if there's any chance for this
> patchset to be included in 6.18, along with the other cleanup patchset [1].

It seems very unlikely.  I am currently looking into how the PM
runtime framework behaves to address my own questions about this patch
[1].  Furthermore, I am worried about the usage of the device
management framework when it comes to freeing memory.  I will get back
to you with comments on that front when I know we are doing the right
thing with the PM runtime framework.

I dropped the 3rd cleanup patchset.  More than once I asked you to
submit only one patchset at a time and you still refuse to take notice
of my request.

Mathieu

[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"

>
> Both patchsets have received Reviewed-by tags, have been tested, and
> successfully passed builds (arm64 gcc) with each patch applied incrementally.
>
> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
>
> Thanks
> Peng
>
> >
> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> > 1 file changed, 57 insertions(+), 71 deletions(-)
> >---
> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
> >
> >Best regards,
> >--
> >Peng Fan <peng.fan@nxp.com>
> >
