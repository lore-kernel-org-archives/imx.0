Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C66463B70
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801049; cv=pass; b=qyyBQfG8v698mvBrT7H6b5QH3Ez0kmXuc2ny2QkS0rPGSZhYq02xQ7IKGqU8OUt3U4XV1OZXBUuoFYzXVzJYvg2QAwf63971RDp+U9Ni1CSNK/7MVCa75L4OP648lD54eV07Dt5I2WTqQMQ7O47yxccRjQeqIxaOLLAipqCzrXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801049; c=relaxed/simple;
	bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAcD7Uyx92xnWpcP2NqhYlZuUOJsJMHLvc6JV14GposQ4P90w6LUYT6z13ZqLr//DYPUW4iUL7XsKLQbkG++ag/ibGX6LCTWjLzMDBk21hUuSFal1gbOP7zTPvw5fKOZ797CsaR4WJQDt8IqerM9SeXbhe12t/q36mSnIUL805M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOcfRZ1u; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOcfRZ1u"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so206887966b.1
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801041; cv=none;
        d=google.com; s=arc-20260327;
        b=J2Mr4CPTk31KIbsnFuAFHfY/7PTRiAHGgaa5AO9xNlb9WHEcLlPg8fSAAsZd2gvz+O
         9qadNbYhL5KpdSEK7wWtxAIOcccsGRR+/nBPfOzXj7QZyWOMpY5xqVhllBQA/aXX+7E9
         PCe4gepmKkSirzAXoyNP0lt/B0xwtGivxujv6JY11885a5WvwrR0C9zEMmb0h1SdaXis
         TIbZnOAr5qFIdicMHz2mHFjHvdXXiU0ifOfxvThtrVsrsE1AxDmrCJxvJOf95ok6WUT1
         xGdFFQku+Jc1lpns2vt1ev8oQReYWQL4jsvGT5n+4aV31RIel5blvA0nsUp531fsL4oK
         FX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        fh=SiWBcv7Vk+IhG/uHtzgeemy/rVnLREQfUvaZf+3DKQQ=;
        b=NW8mIEEEY/i3+CaPZUA7hZ7pTSIoShjikuhO/UN5j8XLwfybihEJqSSeDt7o61Mup8
         lLMBpumfzOrR4lFo8FJtJ5EvwNj5HeRfSkTI6iXub6Xyh9hFGaiv4GdSUbRit8TBL5Sk
         hq4i4SjnXyvEz1cHIm1xMBDyjyt+sOn50MiSEgfsvNs9gzpwiLCnPELe/zWNCDwZPmr1
         fefycAKFZ69ZOA/G3R0wCd6Wkr1je+3y9YBIb/9v1zPXzI18xWzN9gQz5sJewk07sK6t
         zLMIZMLMwqgNGJrZ1lk41ozV3EaTVwI7wUy2lxE4EhEJBzSVyeGsi+EUgoZZzdlm+exx
         HVnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801041; x=1792405841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=GOcfRZ1upeHS6YfZVzndCeSik6ZBn/eXSTX4BF3YfICkft0NLkW0NITWLvx5enKezX
         NjtXfVZ8Kq+sxqogU5ofBK/RvHw5g+Em/LOAVIbDQJFqk43N+sfmHAuBPNvJyzAyetp2
         xPXESggxxKDuWBsaXXIpnFqjv28kSKKP79+rLog5TsTYESEaILnodMUIUFs4hcy5ZnTh
         ruG8WJdHST51k4KfX7yK8zcYCXRML9ZOGqZzDggty627rqRyUVU5ajjU2st33NpVLQHs
         Zj0rJDb98vmkj+TL8DccOaqPhVWHyoBDG20kt15XL7tmmDmZR1g9Oh2CBmFSBG8l8bWY
         DIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801041; x=1792405841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=1ujOlR/m8QOseO3621Sa62pe8YTWFcPlmg2B8hqg+1cj+LQ2UKg3iFfD1eGyUG1GTj
         BdmsB95PyQHtM5MERVyRtiU5m+G8DMdpNBVBrp4T7PzzeLPTE6V69c1mYJC/1e4p6Lo2
         DIn17sYxXJ+H/kqSGuT1eUwYEhhyeYt4Oe0p4Mvx9MmNRgleu6fOMF56GnkhYYzeIwai
         ULr6G7whHAy68HfCNhsU9BhOS951f5UwW64RKEV7EMlChq4e8udm5wMEWt3mIcrRZpl+
         LxaOdw1dAQv7UCcze99mUA6qMEMOuuDlKUIbEkIbi7uA1HrYtBIPov/hVQGmj0wYu8+d
         Yvvg==
X-Forwarded-Encrypted: i=1; AKwUvBxtXxm+9CIhRb6G7qt/zfc1avWrrCrBIoefrSxmPuryCZhUCeg29Zv1+yXoZLHYAEJZ2QU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLJ0skvZ/TDSSH+qM7HKzW6qNP3crjpOHuEJPO4VEFufpevGoqZ
	pB7djEih7wzbF5ZkA6h+MXc18Yp8NFW+B1kdv7owwF3kNYrQPndzOjpG5FIerNCbyisJ6bTg1Li
	JvsORmwQtpVQUtXQKD15/DEFamlLnQt4=
X-Gm-Gg: AYBFou35v7dnInPgUWrYbfp6TjpfYWA+2alKJYlOWyaFsoMr9PWElZ4DSyRarcxHshl
	3nD2roLSWPOYVOrglJGHIgIrEdn+elblwn6/Avl765yeroP4+A0xxB2UJ6wB6q5r81Do3nGGZc+
	XEGsE/itWK9GVxyGEflu+gldS4vKBHOSJFEYMUKTbs5nt4LUcK1CXh4pbWRfAxbk2WZS9RSxIXF
	cKKz3bfCXi7YOwm48RuRLkZEJvdMBHzBb60tYpYcht6ZjEaqZQLXcHZNQ3I5mGiEazr9Rj3PgMB
	6pbKdjJo7HN7VbFilkTKm3kNV2/xIJ0ljqzo3CxNTiokFL9QJ/bbV5xzfhzBvJ6h0o6/giiQ4E8
	f0xgWlsnr4hCDffGB9etNB3A3+/7/yqYK5rxMzTdf2EayuU3m/zsqMrUZiIDDwo+deSpDGWlUki
	fgybHuhA/yh8g/bpgDNVdtLNSDAXQy2nn3v/ck+nhx
X-Received: by 2002:a17:907:3d4f:b0:c26:19e3:e979 with SMTP id
 a640c23a62f3a-c31aa02999amr829174566b.25.1791801040894; Mon, 12 Oct 2026
 03:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89>
In-Reply-To: <asytkrYip+v2vl/i@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:30:04 +0300
X-Gm-Features: AclHuK89C5O-S_Ib4WjyrexO79x7Ht_pFlIF6GUEOqfiEQUn-PMquRFiuZzNiXE
Message-ID: <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >
> >The code doesn't modify any reader part of this member. So, the above
> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >assign_bit() does change anything.
>
> I will replace with below:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so concurrent calls for
> pins on the same port run without mutual exclusion. The plain |=3D and
> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> can lose updates when two CPUs modify different bits simultaneously.
> Replace them with assign_bit() to make the modifications atomic.

Right, but the code does change only the writer side. There is no
reader side that was changed. So this patch does *not* add any
atomicity. You also need to check if the reader side already uses
test_bit() or something like that. Otherwise it makes no sense.

> >> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> >> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> >> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> >> wakeup_pads to unsigned long and reorder to avoid wasting words.
> >>
> >> And fix the enable/disable path unconditionally sets/clears the
> >> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> >> Only update the bit on success.



--=20
With Best Regards,
Andy Shevchenko
