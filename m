Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F138B7C4
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113049; cv=pass; b=Vd4D4zMj/6C9GUP2ZAS+kSFRls8YW6h8fyXIOA2xeHxm6s/dD5s1NHKiH0ZbZiE6tJmQDvnbzyW7jO9vibjp9ELNXflasjyzI7rGEo4LxSLbAp8aMgvrcrcP/hWKjzhRKPvU1ErJYBy4AtcrdXXVFxBFLi+23y5A+kiX2w1CLzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113049; c=relaxed/simple;
	bh=Lcr5dVXyCC6NuA15tJ5l/HwAKYVsMmOxotK4MXcexts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPwXBvXLZymGrBFk2mZ+Y/7z9Cd2wJLgItBZYCU4Bh0nFV/FJzwXgSnxYUbTLKa+fkovWT6cq1K+x8FbwNIM+f45+unuReU7vw2IH6aLue/NKx6h3z7WJ6i1kUaw26XdhI3N1cTOGuSxWmSptzKPeMq01nc4aJlFg1+KJQ7Raa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULamL+gW; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULamL+gW"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-41706b23543so1793800fac.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 20:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=gXet3uJNG+bVJAUlMQObUXOh2ou5Q6KXNaJsTInGYGIvOAqFq/YUPzDuNx8WToa3Pn
         whVMydhBw5ISlMhiuEepS6RqLbUuebmYeKVdo217ZDM0Ppf3yYOZf81HiUUBjghhEVDw
         YCk/g+HmMdsmZB3aaVkHSUKGh+vRHuGi7uHMSYat1PmKoZwjR9c20XuEyIuYuE2wPuvK
         xPp/GL/bxsFfjz0c4wp/oh4xIrkqkssumNWsnfJEz8f5eQ8cOV7dX8WIH4Ly/6Ww1Ek8
         xmuaOFqjKhCJn46iyiptBaT44Zu33lA8/2eaOoQfFcP0DkQTwTB7ctayJFlnk9KuFjEZ
         XtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=2ZJRJD1n955mjuGdSSfi/ey2zV7a3wgYkTj3HkwUJtk=;
        b=SaEzOfre2okgvHJA6APoUMNFFpLyaIh6vozPpC2SYfbhDpS+6x8CPezEPrhsDPX8dw
         jrAiniMeIfamCyrsGKdxtN8veBy4eiVbM90aHMPHxMAK/YuzxXr7Iiod6FfxzDbaLMsr
         019s1lA6x62FN8M5RUHG2HSMFzmEgzeUNgxsoU2TI1vJuKnv6qSvF93k1eX8Ysq+OFnZ
         miL9WsE1Ghw6SrhM08EOEdk93UwInQs3Z7roF+YvHIFg/AWgd5KmEA1TWTjD+7+5CKAD
         sjDpKezOOo9WC2FcCUtn3nqyxnCU0qIYkXxT4oiqz8olW05aAxS2lWBgHuoh1Mz67xms
         wTGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=ULamL+gWW8NgQVsBQrUoM3P3DUfhGPxTqavmbejCCnBnqXzQcpx/9KZFf57ATs0i8t
         T5xn6ZL5C0+JTgkOfDkjyjja/pH178JxvkewDLRgdv9kiW8VBsJPdooTPK3Q4AIO2QHU
         uPt13yWZk2+gm3SPWRRH0qRaodPas5FDm/aMn7t9e/KO44enPU2pjjV6CMBjYPA2R1HW
         58uurxBra58+dQfbay51brm9xctReOCRjF6cVvfB9QCUDVYzAv1KGphWnsrkKtCKFDqr
         jY76a/555SBKsNKMhwrBd5dv3GjiiREw4/IVjjIU3QrNaf80aXis6c443/et+EmBZ5F9
         7P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=l91yrjTWA+X6UHhlQ0btliwivUsxm5wSbg+vhbdaLpOReH3aQkI6oCyFeCDJbu8yUt
         qoAEokgivbFlSlQVyUjFXa2Hcv1BpRxijsVL3qw0AmPCD6MnLTC23YT2TneFvqsfTitT
         cAae2IksoZBTxJ+7HKhEqh8L6btGYh+9FBmdfplugiFGbr049tm1xSNKRoVwo/s5p/pX
         pZiE5KCRQ9b7xxX2ZyVkgck9EqbnBxbVmv/T1JGcvU5VR84usERTEAZ2fE5Cm2P6iybk
         vosZhtxHlIiSjrNOYiT+e3CfS5vNp0hE5cj9kUWVwpPYzBUmYGoVxbIRaazmdLF0/U2H
         YVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0gbVvpfNoTHQKM9FbDleQaPDdRXAIQewwy0AimWNi3JuWBnkvlF+ie7iOMTb/OrPnxEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlc1Fj+lsv6MhA3i6lY91g3l5FnqcTZn2F8ReZbSR2C1H253Xq
	hRZb0rNSeJqDFZOg6/SL20k9Ymsn2XM0ODC/W4f4rJ0J6tRbn3ILPD/Dw4M8Zo17m4V4xCEDw3H
	vYDv5sQ/1Pq2AFbkyrx8rMrm++PDHbqM=
X-Gm-Gg: ATEYQzyPnaXEB9TMhJDxKfs+RbSFQRjbfTNRCewCUV2MNONrYfqaIJOfuu/okRD3mnE
	gKoWmak/XmAZUBkpRl5pl89+o0d5btsbVmxmgVNm88lUOiVu8fCmx8XK8G1TxaLpoK89in1H9RG
	0lkwgvmDc+eQbfsfaioDrdm6KxQdpF7WBvUR/qhlSKSE0jmNLUh4R1zZK2zWMXCMwLjU3DWwgXA
	60bkyoK2mRWQABYfVlyrYxoNRa+rkTYbZJ32gKC9qq6UwCDe150g/q9skmqfxSosej2+/CKCVcT
	cJf+cvV9
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi
