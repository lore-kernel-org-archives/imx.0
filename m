Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B530EF91
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 04:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078663; cv=pass; b=O+qd6Tw8mz4aamDD6oiWBprtqsXh5ai58o9Fbe0Xj6zSwu4eNPYKyHasL9uM1OR/7pSNxCajoAYofg9gSS6Gd2c3cezMJCuArnfK67Xif3jRSq+QW4ucRGsp/c6OhbIxjywcWk3JzjBtiuD9qPqCQ+hMAx6Sdjd6ht8ARZc+xU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078663; c=relaxed/simple;
	bh=fuV2w3QsYdqjcL/mLCP+ZwdqV7DB7Ir3cm7vFKQ0UYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qR+tWGgJuSp4GBROLezXfpZnmOmAyF4MJo8Alii4deOBGdbrBuAT1YeT1yiv7edcZrKFYvHHIOaAaHqXuu6ovsbN5IV4HboZrit8xKnz57lrnQ648HQxR6TTKgmPKl4MqXxlGXtQ7n1Srh6+QV9hPwvAYuGIy0sBTk9WQDPlO6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad4+mrz0; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad4+mrz0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caf228a910so24619785ad.2
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 21:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786078648; cv=none;
        d=google.com; s=arc-20260327;
        b=iGKwukWGXzbcwoG5V27Ni7aQYsoLQaNn6A1zklcZR2sXKXf17rBB/jN/UCPlRB332K
         oaUMy+UnuR0+MlAobyOomHgQd5CBuZgxqPJIVzdB+AUX+1f8ikogwINwpaEsZB2VvGpe
         Qx0X898tQGvlsyRNNYUSd9eKDlgBmGyw74v7OsC6idoFPBw/WsTvPyx3qAaQELeHtUc8
         l7V6xgqmtcothNJzAmfchp1zIlLIZ9p9Ue1PvQ1BpUpIud2QA3x1IJC3YCFU1jMLpKrY
         3k59Ssed8SqpwSI30KsO/7bKDZR85ZJ8YA3va3FnQUmYSYpA2TFKzoRWI6waNLzwDuCr
         sc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        fh=i3QaGJjEIaJDgwqBcT49QKV3ghchOAIklGXKE9UlO7Q=;
        b=lDhxKM+KIj8SIMZgFvtmMlOFsEKp3/Iy8H4MvD6cTkYN+i7gCtS3ukeBl+ge7lpZ2N
         M7zMCQxZmQ7e7N1eZimXvzDsBS5MD9Vrf9dzFWa040vVHSNnkBZZRGwPW0mAOXnFgZwO
         awMmknWlgXaXB+mTU6snHc4RmqLmPCljD5t6ZSzcPDCth6YBXFlGwdKd1aeRheNRkkn7
         JdmdP54Sqg/wzfqZgyRNkRHVKiAIOvelUGDmO80ssxLGjjui3lp0Mwe3xz7B6Yg0LuiK
         g0sJW+x7c/qBCP56IqKoYz0t3IHrZo9/gZcuWrfZZqWf3rnXfvbfgRA4TVQpaV7m7TnF
         heCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078648; x=1786683448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=Ad4+mrz0fnsJ9xtsH6IQYgo1YLEwgWKP96CQWRPzrF27FnLvjVmJsWuFaCWpCoYcYj
         xFNKvDLGEs+wajGyoVWMzOtBRnvB4N1IdOV/8yKnqyAWRX7sMbbp6Y/OK9MVpxmn2mEC
         +pQw/2kM3DK4LvfOHClxrzKiT19hlLf0akf+o8z7+DITMc8IKk6lekMndgJgIJHZAO/I
         PueInItGiVTodk01f/pQQ9jHQ4xTnyd0I1kDV3C4PhyMQyqvHOD4LxvDzE51YuA3c8WG
         mH9nr5KMqCVpceV6070cFYuxdYljtM9dhJ0XMIhsU7uxxSCxo6yQiwK2ayblHidTpceo
         y+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078648; x=1786683448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=PJSYZZrXBQq/OB1zYYElk6cj7UIDUWSN05BfEryRmUBQQlUE6YsJBIHV2GjGyJs34n
         7PkeqkOi2DCdUQnHAc/HwM9cfcT5bxnx8/MZ29dc1KG1D/1ddSSH5sneP9YnVxQSoLL4
         8kUCXwhAs4oV7MP5OhevN18cP61WV8yLoxsd+8m7RcqdGedeAkPYXeqYFmOtvlAKyim0
         6ZRLUOOLcbQSyU+X04zsVXHoRyOhRZF07yIl2ctrfy2FMw0YDox+LvI/V6Ks9wnsoqpa
         AYYL2OqY79Syn36NA9jKthV2Bv++Xa4b//CYD5l3u+OskscMwugilYYiccfwmL8btv9W
         C08A==
X-Forwarded-Encrypted: i=1; AHgh+RojO7WCv/rTSMmIVZhn5wYopm6nG+ckxRJelrA7fPVwDcCTcEq8lCBtsEt4084eZa+IzMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBGXzCOKzwwxyKALnuEzrbcKbB5pMHfZyfUxtKN7MF3aoqVRsv
	mEso7eIADRgWOFT6GMiurChN4+JrJd2zRD4WKqkmpR7bRWKIBgCD9AZzpAGFsXJFl3qonboKRNQ
	hrMK/2Arow6HcEhNSvpCEdsDdTiKHSuI=
X-Gm-Gg: AR+sD13Yl8EzF2tbLo2PZnUEAFOWpFFtFo6U1To0Xb1awxC8Pp8Q3ehIgajqlGL1NR/
	G2/On3/gStWWdxnamxv9Qh7psRLlM35igntbN+IALOKu484PHsS7mt2RLo3RMrQuMMvG9/D/jE0
	AE5moUp9dykUhAldpMmEWYbfIp+wmj3yeys7FQ+/9cLvM/j/hUD9Z4lVMUPzrl/y2jHZAvlGTlq
	kn43XDSLfBkEZv+H6OIUvjfjECO7ECBTisXUR06LJ9Vz55vYZOmxiJ+O66dI/8r5/u25/GcLk9V
	QXyAIzV/Vise4KzsDQslo6FECmzb5KmVeDhzVHC/yc14MVsOzv/msQ7a8+GKLd3d2ApF3W4xud5
	ANl0f52NotJ+DRq/ulUwKAird0vxd57aOflPVLRZgOghighxzfLAaypYN
X-Received: by 2002:a17:903:1b70:b0:2d0:cc92:f7c2 with SMTP id
 d9443c01a7336-2d0cc930325mr247857335ad.1.1786078648456; Thu, 06 Aug 2026
 21:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806065254.28204-1-phucduc.bui@gmail.com> <2026080623-repressed-griminess-e3fe@gregkh>
In-Reply-To: <2026080623-repressed-griminess-e3fe@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 11:57:17 +0700
X-Gm-Features: AUfX_mwRnOY7VUq-ck_xwOmg8y-ARldqTcX5XmuIOCDKQs-VxTrkOjINteaUTxY
Message-ID: <CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanapDnBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from
 IRQ lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for your feedback.

> > From: bui duc phuc <phucduc.bui@gmail.com>
>
> All lower case?
>

Yes, I=E2=80=99ll keep it lowercase.

> > Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> > re-probed when the interrupt resource becomes available instead of
> > continuing probe without an IRQ.
>
> How was this found and tested?
>

I found this during code inspection while cleaning up probe functions in
the Rockchip ASoC drivers.

https://lore.kernel.org/all/20260806052136.21034-1-phucduc.bui@gmail.com/

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure, including -EPROBE_DEFER. The driver
handled positive IRQ numbers but ignored -EPROBE_DEFER, continuing
probe without an IRQ instead of deferring.

I only compile-tested the change. I don't have the hardware to test this
path at runtime.

While reviewing this,I noticed that -EINVAL also deserves to be returned,
not just -EPROBE_DEFER only -ENXIO really means "no IRQ".
I=E2=80=99ll update this to:

if (data->wakeup_irq < 0 && data->wakeup_irq !=3D -ENXIO) {
        ret =3D data->wakeup_irq;
        goto err_clk;
}

I also found another issue in the same area:

        if (data->wakeup_irq > 0) {
                irq_name =3D devm_kasprintf(dev, GFP_KERNEL,
"%s:wakeup", pdata.name);
                if (!irq_name) {
-                       dev_err_probe(dev, -ENOMEM, "failed to create
irq_name\n");
+                       ret =3D dev_err_probe(dev, -ENOMEM, "failed to
create irq_name\n");
                        goto err_clk;
                }


the error return from dev_err_probe() was not assigned to ret,  so the
error path could still return 0.
I=E2=80=99ll send v2 soon.

Best regards,
Phuc
