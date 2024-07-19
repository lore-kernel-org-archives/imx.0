Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1FD5E091
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378852; cv=none; b=egleHGSH0orZUOzUdCk2n36CpPuJ0Yxe8+hc5WrMracg1r3WvjJiATnsTnKyOy7abQErXoX3tQ2KlGM4TzbTGluh0nZDaq+obl5bASLc9V7sswEYzMaz0IaUck0w6Vj1cAfIFBa8D9U+rxwwlj+qOCmfSTXpg5hd4gLLSKBKEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378852; c=relaxed/simple;
	bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewSydPktmjaros2vdOAbbZeM1Uyc56B05X6CWRNvr6zp09fEfDmnlyA8ZhOJdkzbpe0mFhyQVWfI4eZ0jMzcLJgamEM77A2nOy083r4Pv0GyyPwXPZwwkNPj3zo1C0SsMe/BtBViTzj9HMODtTAbqcdvXn28FHR9YW5IDqr+zQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpv7Of6G; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpv7Of6G"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso1598923e87.2
        for <imx@lists.linux.dev>; Fri, 19 Jul 2024 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378849; x=1721983649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
        b=bpv7Of6GXwc8fmAcFmIrX1IlFQi5hyaTGgBffdHQOhN1+KAhuwDQLUVgurNZLxN23i
         1wJu6IvAdEAFzO3vndjmR3gcK1iDhYgOkNN43C+jdE2Gxa99FWS2Gi2ufbJSQGmDPBEQ
         nOqPuFYdYGw9FCDq6S4aeRsDXa8o8KJ5BbnoXXlHDRtHN4+8o/M6g03/lbqoEoW5mQBe
         IVfCfB8FFgYhWuGRWeCwUY+qAuc1PPXC6xPE20F2LQu1Y+uPLQPIH1ZB35JkmW9rq9fb
         eBimvFxi0kkUsZC0prMt5Hn7lQQeS3RTduTTCTMJOLAHVMBrs+X1NqYgFmx58pDSMv0s
         dDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378849; x=1721983649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6j0m/GV024tPr9HBEbAXHZCqMEuvAz0pcHffhTEQMs=;
        b=gKIIEsYflHPj8eYBfVqW6G7yG10QVD1hgQ3kDHizt13dIn+qsXj0nDhaVLXvfsGFoI
         DrQpKl8Uqg6BnrE5h+ZFg7QUQmYpLnefAZaJtk4c6+h9AlNzHJW19xDpUjfegbF9/FYL
         RPDE8tY1WzNMr7xzMZvhjvOMvMv9jm9JRzcOK/hFqMLZj7v+Up+M2liw9waAz3nwyu0q
         gL2FBxAIcx9qd7XGYytiwscNWaxyTmP9OXdt05x/X0JcHA8nWdF6qWVNdkrQUFeahQL4
         yQcPza9otlCt9u+Q6uw33fXPSXiyJ2GzjifRno1ExzJkpSzzV3uoaLVLKw1CtyIOy6eK
         FHyw==
X-Forwarded-Encrypted: i=1; AJvYcCUQucEacjbqUO3VGuGbh2t8kExd6LqRsuQSuOFc8+9rAVwg7VijsR5jdYASnlKE5VIwJw0zBUZnAmAhXpEsE9t6KsEm
X-Gm-Message-State: AOJu0YxX+qHo+81yBa3ZHHA9PYOgDnc8ZUSdyThP0psD+H8i5yOIwhGI
	iE0KUhieKmx29Oy7y6rf7Gdcq+4l48A/kz+XV0X+zxZHIqvYapDp14ea1eMBgkUUFgoQg4BsEgz
	XiPuOLWG6gcKZRpdpanjO/MMmyDI=
X-Google-Smtp-Source: AGHT+IF6oxl0sIj4f5dI1xPZ8i0jbh47IA+Yb9zWXLd3oU6mZBA4Dz5cL+FGoB48prP+Tte24qxe1YGA8xMINVBUmKc=
X-Received: by 2002:a05:6512:b22:b0:52c:e1e1:ae91 with SMTP id
 2adb3069b0e04-52ee539c92emr5555209e87.11.1721378848854; Fri, 19 Jul 2024
 01:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Jul 2024 11:48:12 +0300
Message-ID: <CAEnQRZDCMDZ=1hXSfGzAkz5kxL_xYo+fZXMmMQ_ytywRKRd0Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: imx_rproc: support non-blocking tx for i.MX7ULP
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:40=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
>
> However the reboot and restart kernel common code use atomic notifier,
> so with blocking tx mailbox will trigger kernel dump, because of
> blocking mailbox will use wait_for_completion_timeout. In such case,
> linux no need to wait for completion.
>
> patch 1 is to support non-blocking tx mailbox channel
> patch 2 is to switch to non-blocking tx for system poweroff or restart.
>
> Based on patchset:
> https://lore.kernel.org/all/20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com/
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Series looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
