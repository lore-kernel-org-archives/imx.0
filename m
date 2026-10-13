Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572DD4078CC
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887763; cv=pass; b=TG+ubc+y2sAtdUT3LtC2ORYdoOtS0z1GHtl+OpbFJm78j8HL+RREJls6c4LBNC2oCP2YgHur1PXi9w+yyBWQiQ4lRyBypDIhlgSBbJ0oRr1S+Gemz6KPvkNOTqiVI9UkgpTAYro+jFWBjGGFnyj9pfRKnuRWH1OfKpWCs3ottSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887763; c=relaxed/simple;
	bh=ATKKoMBtvH+x+NnwXS+Q5BPcXq0fntwxaTtd2Uh64EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im4Op/AUL18BgMEMISPzVsgtz3XZClK1MuJGCfJpuN4X04c21L8raHui4vg+lsenbW/iqjgF/BiDp2chPXHCUb6r3cqekpj325q2Zutzi/IrvDqaz7qYkUcIuDVWE0Vo1Ohjn16SiVGdKbYIMRzG8rbltmeZlchErPEamoHSJyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndQml2tR; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndQml2tR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2a4e013a44so412712766b.2
        for <imx@lists.linux.dev>; Tue, 13 Oct 2026 03:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887759; cv=none;
        d=google.com; s=arc-20260327;
        b=JFeb4pouv4QBShBbH2H18oodlhByWzYDuGSnaLjkbwPXcW1M/e7YDzlm9WpmhO0sfz
         ++gubsrUJYU8m3qWKY5lGme3r6J3IZYauPB439vfY1C/Tsmxcowm0vC9Xg7kpFyvb3WM
         BZDjAjxziMTr1h44PtaH/JcxkQwW5PoNBoqO/MZ0y6VuuzVc0eUIJ+2RDhAwCzzIDLJS
         8ZDHD/+nBSD17YORxc/dH8w+cKIiHRHypkIpw4nWjcXfAveqbpGWaqAXCBVuWzYLs0Cy
         oyoKcIYtHYsHhkKPx6z/6IOjnuJdL7ME/OkHBbQpCNkq9uOP3jF91OszyIRulvJejbiQ
         yW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        fh=uLd99w1veqEw0YY+aRrZTdprbc9EY2Jqc6Io79BW6uY=;
        b=FJlO81jTRg7ZUnfVw72P0f9WWvMCAlb6fbyeDLGT0U6JOpXJ6/hah/mddP47BJbaIV
         JdDZgvdxTg/sGEzYDxpn7RGIwiYMNxT+DCLH6Qx/RH+vTctNfRqoxN/NVyaS/EnezK2/
         Cm9FSuYhLoOP/LLt7q0L45KoiJaKWkc4y1uxhX7p1asjwQTe72dsw4478KzWeIjdyBqr
         RrnPfHQHVwGVwH95R1LmeQfkK0OL8laj3vjZBOvQlL5aY+sHyTGuHyT/Jj2cECF3L3tg
         kUVrhf4prT8q1NbXAmPd2KvphnmkqX++44pVI0Qf7a1er2gXFPTEcMCrH+ouVHd3+W7w
         kNYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887759; x=1792492559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=ndQml2tRWkWJ+2d5cMFcg35os1ga4f1LcelsYZC+iTLEraVyga61jChdk0gSv/W79U
         dXUd3peL0JJ9tlMVMRGTZwbVGSeyG++V7rxWSgvU+SPS75c6XNpsEgMTG+ZVb9ZmloaJ
         ExwJNH5+7ioCYG+xrnHjSsnnvk3bf6NXeXgXppSzncXXJ3YP3nEFjehtplp6brSutTzL
         Bov6DEy9bGUjgeClAIOyw/0NBOK1TxGgapmCRSYWAkraDrXiSUlkV6pP0kOHKIsQMT4R
         UaHUIbA2q/H3u/8PQ9tEyaDuOsvwfLXS/2M4VeBg5IaHSwlLY7EZnjYXArlASUVuZ3Dw
         pqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887759; x=1792492559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=xkd73x+qHx+0mVmTEYyzMRHuLLH4c9LsFE2AJzcxfJ2yBgD3wLCdSVuIBytq7w6Age
         Vl3DJ6aDTeojCq83jenHQ5UARSrEypltXEro8NlgbsEkm3EEOnvodT6pJxkTfCoR1BRx
         mRNdIDq4ycP0GsMZMVrZV4Em3ZMEEnT18HTVaFlAHNY9QQO4S+MiubzA0ezOEMw8CZx2
         iLChFia3VtSjvAqJwwGoup9n4EFM0hgpm4o8Gsfs25krVi+htlV6JRGFBTwd7liscU/i
         8JrQAWBATQ+J1PIz3zQRwBts6TAextD+AXnJqf/DDpSszmkrHs0Trn/HHFY1rwK2rMka
         iLzA==
X-Forwarded-Encrypted: i=1; AKwUvBz5G0FpLLHJ0z02E7VGWmljfVFoUIraDIey7+ToufiHY4ltw3adT/dcpIkQOeVFWjTZNPs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJqDb8S82nHDgs6K58NW4PsKP5VuX8ogoPKfDuA2C7z8nO9xKEB
	+AkzkAoiO5OIA3AeIe4Ra3cVVQ/VMmO7KX59+Mre93RMUjkaKnmn3+ofKh3/5AgNKOCsQxB3/Yu
	FGcE3suG406wmGbHqZHLRFT9/WAGAWZs=
X-Gm-Gg: AYBFou3Sj7qaobQbT9v/Eh98n8MsT+zE9GlJi1M4+keu+yuwPtAGHdNhdjHepuEV7bW
	ev6wBoIt26mYj3EFW9vqOXzXsD9bbOXJKsiWsarrgMKdc0Rpikdxe2e+xk6dRQZNrx0o5e1vdqc
	6j6BZ+iva0zX6NN9mbBtoyYAwU7CIiUvSZOJIv+CsTK5UhRxWMo1EwcHJw0nFP7UvnryKfcTbUF
	2sSlqj5DUgiVhMf7vtkpK8SFKgp4rQuza/mhwmz/Wr0Vy+HBhLseRGxiGv1h8suTzYD/zjzxhMB
	//XLBYYiVTcQCvHfuOA2IejvdeDqYhBMpf83f2amD0feexDrmMdt/gqvbXqUyBvrHOnUxvPUMlm
	raVMar6zuP3nMEfCCHa0SJkCHR6TA6fF0SvSiMU0pA91nsyBsuxdQkZOD930Oj8u1KgSZCAyjlx
	vEKG3eE2DL93vzmlgniQoCDj4TqQOdOWYJVOUjmC7ZD4Hg9xhefy0=
X-Received: by 2002:a17:907:7246:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c31a9d56575mr1092545066b.26.1791887759359; Tue, 13 Oct 2026
 03:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:35:22 +0300
X-Gm-Features: AclHuK_etHkgfHNMFVBnkCMnseRcVeyJYO7O0Oj_IyfMyFzvQ7RtNYlt2MPQbFQ
Message-ID: <CAHp75VdaDyfDL=34kOV0u_nHnJ+XXNwJU4=33v_Q8Eq=tHrYng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> This is a subset focusing on bug fixes, that separated from thread [1]
>
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interru=
pt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
>
>   2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
>      can run concurrently for different pins on the same port (different
>      irq descriptors =3D different locks), so the old |=3D/&=3D on a u32 =
is a
>      data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
>      unsigned long.
>
>   3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
>      as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
>      the bit being updated unconditionally even when irq_set_irq_wake()
>      fails.
>
>   4. Fix a race where devm_gpiochip_add_data() makes the chip visible
>      to consumers before the IRQ domain and generic irq chip are set up.
>      A to_irq() call in that window hits a NULL port->domain.  Move
>      gpiochip registration after IRQ setup is complete.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
(no need to resend for that small issue in the commit message in one
of the patches)

> [1] https://lore.kernel.org/linux-gpio/20261011-gpio-mxc-cleanup-v6-0-cb4=
7ce2ad758@nxp.com/T/#m49d6a5a14a64774eda299bb711c8d316681e652b



--=20
With Best Regards,
Andy Shevchenko
