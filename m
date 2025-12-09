Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136A26ED33
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289225; cv=none; b=arrCW8ylGFjx6KV2uVVWBDO0nOZ5lGg1GMZYOiw99exo8HvGc3DNF9UUkM4L2GenEHIYLvkpEgLnyzlaDXmUAmKUxg+aN5kyN3GySm9RWH2cWQPu2197RFrqh3Xl7NbqrDhr2onDqmy/VPYOEMLhSiv3yRDrkfKu3S82IIdXPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289225; c=relaxed/simple;
	bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exBRaW/ZuMFr9OJbnTZ8zg3JZZSyNKcEgzpc0Nhx9/PmLIRxpg9G9S2zzG1haOvMq7vU+O23TZTUktJk53gJUfuCRjUFeygS8defLEMnSJhTKs7bPy3GfDdzD2NkfeOe/A8uvBanuC4M/MNvO6c9BZZ+7VCfQenWMVOMMmX9Sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfdXBmqO; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfdXBmqO"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aad4823079so5152804b3a.0
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 06:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289224; x=1765894024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=MfdXBmqOD0woPURsKnQ6gJBw44YOWtCTN8ge2wWo5KNmBizrD53QWfPxLmX3nu4QWu
         VC5kxT8jghV0/D0wr72uqBP9N8Zqe50CHkykurnuoHmzrCqr+mVBCgAyWWT5pqsqHmBv
         tjiy6uDURe/lJvPLxS0N+f/oIoCSk2DdUr7+0giuTLFVENHD4FwyfUWHUAAuDAh5fZmC
         4Lqz+RnHoSF7j+YcYc8YItizJxnso3ByG/oBkzxJiXBZ7NF+iQX3A6lPP7fCUzUuxGc0
         zU+raDosuA+xblqG72MHUnnt29ou0nP0QoFhENB4x5sZcf9KhS8JjEsTje1Vyd3O4HrW
         8Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289224; x=1765894024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fd+mJ8gHTs6Kr6af70JjQH9dVi3KRc/LWKQigRKj3wI=;
        b=g8IebmIfwWN+mdkKbbaAwIfklsuEu8l9hKuJP4YKuIZSSmb2mitVVOeYUSMzW9jXOo
         BQTWuORvE05syiiEJhdmZGj2tXRHexSSeyv5nbNNmE6VmTw0LB0N8oByGTJzpo5RGI0y
         +J4Gr3pQan9tXC44bLGuqEzEL3Eu5TONxQzcJbF8OIt/29co4qUuczHeiPJAVusQnhOM
         az1VL+LjNR5wI1jneDTPczLl/KpeIlWmwG5UFJFTbLSQz8HdnLPWaOTpHm1Lusbizt7b
         N+C/Fo2CYJZ7Yooo8VzHukb3PWOjjJu1rB7IBRxgzl2PdD6svLoCmwypzLHmenzCWg1S
         qnmw==
X-Forwarded-Encrypted: i=1; AJvYcCUcfTo34BY3o2g7CWZAi+LnPpx/Cb4+fZYvHd8kmC79gdiIe7QBaARY9EUDkdkyDy7DcPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw41fH/C/AfyWlQ44wTV/GyYcupRmVJ/0fF6HMxpBesre5WbGpO
	ppqVG7KDSVpmJAQO88wx3e2iByYSjMg7r4JzCm+ac6GPaxdocxJgJQrVfByzwp6EU58G9FLz7BK
	eUPjcTAjP0P8EsS68IbhL80Q6X38hnfE=
X-Gm-Gg: ASbGncuMmNVzKfBzOYzfpkbvTHOrUKfKfQ37WW9+njCAHS+XixtiHiH0eskDrQhrb4o
	383oXiwHk/NixM/n/jsrU24HWw5O4FoM05s0LRNjSVKH4xlgpZY6wMk2HNNP30E1Ub42/zaO8Ka
	9EfnH69/iPXFtlDPlkDcrTdidiILMve6+FUa9cmyJUUIRNE5dTVP/bM61jEyExhiXv4C/IViPKu
	uvhKVcuzqgQMF+SCoLsP5ZZJUVGrfPqIHdB7hbLWp25DgMe4k+3pJY2Q5XvSPr6hmpoHDupYnmJ
	cZW90kScWwpqpC4zQD9igiozAOeUtPs4BW0mWu9BpOgsciJp274Dhng6mKT+Jbvf+sDGB63oVl+
	NNCByCHYcpw==
X-Google-Smtp-Source: AGHT+IF5qKkipCzYEFzejnBb5df6vSYSFDP3s5q/B01Pgp/zxcwgrfIpRlHh7JiFs/tuo4o8rJk2zzjfEIRdHLWLt+o=
X-Received: by 2002:a05:7022:4388:b0:11d:fc64:9562 with SMTP id
 a92af1059eb24-11e0315ee8bmr7976330c88.1.1765289223387; Tue, 09 Dec 2025
 06:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:09:30 +0200
X-Gm-Features: AQt7F2oWIRtUxYk-A63rfaiqGIFxA7_EkG0XNavFrSy6-Iw6Vp4fAIgO0gAu08g
Message-ID: <CAEnQRZCPX-enWtWYXM1KD95=bTD5-i46L2Bej7gXP+mggCUwPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Firmwares that do not use mailbox communication (e.g., the hello_world
> sample) leave priv->tx_ch as NULL. The current suspend logic
> unconditionally sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
>
> Detect the no_mailboxes case early and skip sending the suspend
> message. Instead, proceed directly to the runtime PM suspend path,
> which is the correct behavior for firmwares that cannot respond to
> mailbox requests.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
