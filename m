Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17B3A453F
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050384; cv=pass; b=ZLQH435PGjX999f7fsfEU4R/+oeJhThk8pngiynWIU+09wsliWUHnBEKOsgrcgVv+TPTxKG/qFX7EDs/iQPt7SUKlKYX7vNPpGPzWhW7aaoywwXKevtDgaESlswAeIPfki/NKZ4cpDjloqWWOFvPfqqAeHRhFoE1MJHC0A5d5Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050384; c=relaxed/simple;
	bh=izuBF8S1Jow9r5hzBkHRDbHLg5CQ1A34xxxD1x1CJtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2ZBZONIah4m+V7i8QPCfXH0nvfti5J/gbaJqinC3BVDHZigs8GTKmbVZzqoSIMHMvSIMxdKcxmPDg+iLZcY7eYJZbrgBSniRh3Oe6cEKlQiTmoWNZa6KQKXLECmzdrF/YCkAkGV24PLvEFf8FrOpfxHLsRiaP3Adcn14sPDDt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meo+MZ/V; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meo+MZ/V"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af85996a92so349950a12.1
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050381; cv=none;
        d=google.com; s=arc-20260327;
        b=PSK/5DEz/VqOWm/rdF8txi/bBB78HCKiZ5eb/GadgwNXKVaTf0KyvfaXSUJ/DaKD6y
         CO4VWY4c39TPE06EDg/9gBiPKUnxUQt3N3mcivrstE+AfhEoPOwCNZ1CXeL+kcrz4aYJ
         1bGLGC4JU18WjXeW1kTYdGtQn7ON21ID4hRm6Npocxur37vo+auNvadYm/w4e0/mJJDz
         Y/2n2IuoeoIYg1mCKhIzWthBDr10PookjHbcAKH7G2AVeY59u8PtAnhyeqZjLVCqsZ2x
         vwI+9783hQEhkSFYFedXfdl79wyv5cg2Ph7/BpqtkczWrOZHWJsWtdmK2e0hDYL8jIw0
         sB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        fh=w+dRsa/nuLTQGZU1oFVWui34nh0npXS4TUoP/5MyQis=;
        b=ILTxzOob0SafDkcZHZj0BfXno0G3U8HRLSVOvUfD6HzAqIvjZmARjP/fDSLdce/AW9
         y9gIGGFKKSUpTo+e1mjeiWPRqFReGCAMv2feibM9YbAFva+R1geZavheLIqvliX9wuky
         mQp2rkkr3eXJijkEoT6D7IzpoOOn09I6/+OS+GLYPx4mSbFMrlWnzQ5uBAHXsfHnNSan
         m6hOyzNiV1px69oeguMNQ7i/VV87mewvVOVK5CSAsvILo+jfVXQi7zadCgSYMefjwCY8
         mkUQJhS+DcKZCDvClsbb4jxq1imYKCsdbtPo7bjbybvrqFQbtfzfdhclK+iefWv0XQtr
         MqlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050381; x=1791655181; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=meo+MZ/Vh0IvAQMH8SOOF9kdWd5xkLXo6MVX1TUBk29xC0Lo3ibzC73aqMcKPnOXAl
         myApZYjNRcqVeOWYtsuzNGbwSv2cMm8hHtXDY1DvCm+SoFq9ZD43FqMhApU/xhu15BwC
         vF4sbOvWkzNl3COTcfudEnpcOq4eMwIrk7SRkj20cx6b5+afwZ43KgFLCMlRJdoJ9TZG
         ButLBB93u1L2IiN3YwvIG3T7fudOgnObD31/6vuX2OEFpppnpFKM9KgBP5kpVn3mRFt2
         kps1+k0kYdOYutwD63AmfYRzdzd5Flpej6GB+cr4o2xDC9z+CKRlkOfLqn9WCpRl7vIO
         Tf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050381; x=1791655181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=ye9UzLjBBShxN86Najhu+pidxUqtLoLUVDgV28mB/Goaj+yN+jNUxwSOhXZHBeqo4B
         kjRBaCTdy9k69r9dVLOGm9KL+ofzCZDSpaI0McozB/OkoaMYdyrbNMjB49a6NfSKina1
         kzYiPbE7jbEx4j1OCATMnQ6LK3+8NX0l70hZKYbEvskaYobYWy2Unvveoct8EC9e6B7C
         AynII6pqMkGz6RQMew+iOulCIrHQDybSKZUl5dQ5sg1O1pkPhrg4uNx9r++ahUj4Nyf2
         +Lnz6raxatu7tLyyyjw2UVRwm6/0XszgZ1uDZKgIS4sHMQW33dDu4WbIy9Tx/W2Y+eAC
         cKgg==
X-Forwarded-Encrypted: i=1; AKwUvBwb3oZ+OkxqX+NRSlgSX+597F9AZdObgsIFvIKF96vFknc9b2TcyOfITWp1KPdXZwGS1KQ=@lists.linux.dev
X-Gm-Message-State: AFuF++luXiFesiKICkYyc+CyP15DJjdSuhVu4aEf91H5ibcppi9w0GyC
	cE7ifjHXEVIHRcIDEIHBZoT7pHtgfVyOw7p8WCzVOpoD6dIIkcrrtMCoU50DVoc8XD5q4RxyuU2
	wohVBqgkYwdqSSqdKAquOmFeRnlJqEBY=
X-Gm-Gg: AYBFou3xfsdcP5ZdIZY0A/XeMjCRwjDxx//UGCF6+iMv1pqkPLRu93/FSqlDzg2uN7H
	Qy/4cu23r4jRDa324gT0QH8uiKd7GHmtjLCjryZI1f2hJoxWlj3a1OiYeGE6vHClUOuyR5NiAES
	Snh66bMxGpBiElqWlw0UFrUUiuTwqkXiRdvRk713NJN3o7kVIesOcKeC2M/zvGO0WNzulVXymTN
	lL6ypaGPIW3NTdbh8aaltfw/r08ZNxNHIgrH83UD7lpCr8Zo/oHmYriF+ybGtsZ/qHHVndM+HHg
	plGUli43PwpYFBIfLhncQUiqzOmn+8ya57E8UBuYHw1ZnspkhJAFQ3fI4iNrbaDwCbyik8kK57Q
	tRj7LQbjbcXEvzNSMm3jzoVsACsWotEE50Cvz6IxZ5d1fVXJXIHNRvSZRrQWtcvQjTFGdSWrIhQ
	kRMWQgguPQpFR2MztGxFs1YGTblu9LwuBjYs+amcSGNppOW6Eim5s=
X-Received: by 2002:a17:907:3cc2:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c2e4ad53be5mr531992466b.18.1791050380759; Sat, 03 Oct 2026
 10:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:59:04 +0300
X-Gm-Features: AclHuK9OR6BXTLgAb_C7YKLGSH3aGu_DtrvC657Cue-9gwAbeSx8tKkdBHiKuRM
Message-ID: <CAHp75VcRG-LzWSsg8neDOS7qj0wfp3QMoKkDKEYhoobRbfv+VQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> To simplify gpio_set_wake_irq():
>  - Replace the enable/disable_irq_wake() if/else branches with a single
>    irq_set_irq_wake() call which handles both directions internally.
>  - Replace the separate set_bit()/clear_bit() calls with assign_bit()
>    which sets or clears the bit based on the enable parameter.

...

> -       if (enable) {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D enable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D enable_irq_wake(port->irq);
> -               if (!ret)
> -                       set_bit(gpio_idx, &port->wakeup_pads);
> -       } else {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D disable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D disable_irq_wake(port->irq);
> -               if (!ret)
> -                       clear_bit(gpio_idx, &port->wakeup_pads);
> -       }
> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);

> +       if (!ret)
> +               assign_bit(gpio_idx, &port->wakeup_pads, enable);
>
>         return ret;

This uses an unusual pattern, we check for the error first.
But also this part should not be ping-ponged over the series, it
should be from the start like this, see my comment against the
respective patch.

>  }

--=20
With Best Regards,
Andy Shevchenko
