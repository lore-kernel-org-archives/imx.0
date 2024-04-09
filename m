Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5913959C
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675421; cv=none; b=ZGDnISJUQUNVMhEs8SrZ5paYQ7nEhK3q6/BdgUHAEH8fvqWi7MN/IrlMwizYQD/h16+7yZ9kZ3Fd9+yROqwT4Z+mWo4vPtF8pqA/femc3BOS2KJM+DdbKkFEJMEEOU/34J4memsz/gfGbQRQz9DNYGh6dbGWblWsNuztjeEBBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675421; c=relaxed/simple;
	bh=OSR3v33z3GyfOGpNy2e2PuZ7HcUErp92Ny0BMAv8boI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtXUnahFwZSuXShne3kt2g2RNgJ81Yz8/2td79HA3YCTkSfYXTYYcolxc2NuWN/bHDjoaMMOrsPkQmCSySnarFBCykqAc3VC26cxwqIKg607bsTz8vMTLEq40gd/9+WVifoMprH/VE4jWVGiS3a22qzPI3KYih9H6vm3ZdOONzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6151d79db7bso65420387b3.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 08:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675417; x=1713280217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrXgi9emwgSEedtpKFZ9CSpUf1af1pgKd2Pn8tKxkk8=;
        b=wxd4XKaW+tFiJN0DipLv7a8Xhu24QFJWwRNXVEQMVupSpVVy751ygGFIVBXwIgAKuw
         yo4QbP/plyKA4XtTYFchelTOGgybGIpHaN5jh+0djRl2ucVvU9J5DFHGIFUdXS8ofzSD
         k0SUQmpLIagRB6gGem2FFW55JaaSZLbejpOrzO2c2NKPwbYo2N4grzog8gnCnkUAjNWF
         /Uko7FDpBdWwYtKeyeq+g1ENu9sJYVSkw8NKKCZf+lQ6YCDHGHjeRDbGhzmrsReEf3K/
         O9WzLxQLcYcqTXzU47+fSaVTA/jFHsDfZZEILFP6qDKDTqWcXWyee4UZF8fUveu0KbTe
         MxCw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJWPMPRAvGus1dIDddd3SzuHnNF348UihyjyIHa+yIcNiZYSEgsveHmz4Uvi3NcYJ53fQyWURutriQZRhn/t6vrok
X-Gm-Message-State: AOJu0YyPEKnkqiiGQplfNKaQm2IVTnQYDoM6xufgSzhwV+s/Kn6ZZt6K
	6k5JSIdgX5OanSIxSLkwWbSRsTBI1JBqHY1J+O9qkOw25Ni1RiTFM+QEtD+9ZBE=
X-Google-Smtp-Source: AGHT+IEQhP/fJUku7vApXNgQkOka13IChFfHnowoqUyq9Doe9dQeceHYi5FvfP/SWCgicFgUa7Qrkw==
X-Received: by 2002:a81:df11:0:b0:615:1d51:6188 with SMTP id c17-20020a81df11000000b006151d516188mr10990925ywn.26.1712675416413;
        Tue, 09 Apr 2024 08:10:16 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r139-20020a0de891000000b0060a048aac3fsm2247250ywe.96.2024.04.09.08.10.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:10:16 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso5874537276.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 08:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4kOOh2L3Ej4fJMGY3D0+xrw5n7hkvMJwNUMSYII4s4hi5D2hIbs8kXAgeqmOQxrBIWr6+cXEjD0XjW7UXhZPkcUXe
X-Received: by 2002:a25:3182:0:b0:de1:1b5d:9599 with SMTP id
 x124-20020a253182000000b00de11b5d9599mr48436ybx.5.1712675415582; Tue, 09 Apr
 2024 08:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com>
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 17:10:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
Message-ID: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Tue, Apr 9, 2024 at 7:37=E2=80=AFAM Saravana Kannan <saravanak@google.co=
m> wrote:
> Don't bother reviewing this patch. It needs to be tested and possibly
> refactored first.
>
> Geert and Herve,
>
> This patch serious should hopefully fix both of your use cases
> [1][2][3]. Can you please check to make sure the device links created
> to/from the overlay devices are to/from the right ones?

Thanks for your series!

After applying the first patch (the revert), the issue reported in
[1] is back, as expected.
After applying both patches, applying[A]/unapplying[B]/reapplying[C]
overlay [4] works as without this series, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that the state of /sys/class/devlink/ after [C] is still not the
same as after [A], as reported before in [5]:
  - platform:e6060000.pinctrl--platform:keys link is not recreated in [B],
  - nothing changes in /sys/class/devlink in [C].
But that issue is not introduced in this series.

> [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=
=3D9F9rZ+-KzjOg@mail.gmail.com/

[4] "arm64: dts: renesas: ebisu: cn41: Add overlay for MSIOF0 and 25LC040"
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it/commit/?h=3Dtopic/renesas-overlays&id=3D222a4936b0d3dabd43bdffb3a578423b=
ff97b02d
[5] https://lore.kernel.org/lkml/CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H=
4Ucm=3D7_ig@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
