Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C1481A8F
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491978; cv=none; b=nxef8Tn8jmXa+139QuuiIrUnoRLIFbEn1bq8+KZGoYL4ZyNrSgiE7R8ewOBu3/5ghoT2BUZOiO4li9RItXzEx/rTbnbgcBrIeo134q0IbmMw2M+7EvFJsLiJ+HZ7Jm16XVocJ3SVPY7ea3s5g1mMR4mG6aRWjymEBzHsTr3rCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491978; c=relaxed/simple;
	bh=Plptqs8+MeS/L6HmTwPUTp1dXY/x5J9010knqhq+i/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjMBvj8wR9S9U3kjgp4WhN5fp7huM4vyRBVfHaADP8xGeX8P82+juVZgUANn8eVThTzkj3kJxwOeIPoA6aSfng3C5NK7ftkmwBDnffAske07mFh44ngk0mY0H3Dl1812B5rqyT4KQsUEBKpkkKY8A+RLMOwkDFd9zX7AiFfYmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec423a5265so714285466b.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491976; x=1781096776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDFPb86PvQvyL1RfDQoX7OYCgpH5JEVJJIcrin/l7k=;
        b=LpnnfysSyCSb4LwSJJdtbNtlBXxtFtrL/BLyfH0vvkNoOzccTK2OdNHxAZb14uA/Rq
         5WXvu7hfVVfGW6dUlu6hWwl1f0ydGjBPBs4WmEnetA3r2gOqa5DN/tWUaxE1axCs2xXA
         +8EmfTPXB/OgMykSBzrydT5NKdwLfzX5N1/t0juKGDCrltcvAXWJr/+iK4/XlFqhYJqi
         371jIiw9Sy0+JnCnGKclRAFjafCgKG8JVEQoRymCTegNpsbRAbqrLy0J8TL5xtUoku5S
         4f+Yszcwwov/GqTpw25voQi7wymtuC9z0sTADRKumCRGOl+wmGqHHnKAhJxY5CB9ovFc
         VK8g==
X-Forwarded-Encrypted: i=1; AFNElJ9Q8jH4j3WWoe59+2xbCWAVkx/3vwSl5BYHjbx/kg1NGHrp/2MTXEJprLQsHVyuk0PM3J8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBtrvs2398awr5wLKzsM3dlcuNRA3QurFJQFq76W96h/MQ0Lb9
	hZlbd4lr7rLnRwR6LVpHuZRQyT6ZCJJaX/BYn/oSS+/s51UJ0ZKV+tofgE5Zg9Jk9XA=
X-Gm-Gg: Acq92OEQucuo0IwL9HzKiV6IVN7PjJZon9TkoGuVHP7eEzjsT8yuvvWc/hLirECJ+aN
	CPgeSleIFVCN2XwFSwLgICey3zQxJqEtiKLVWmYJ1/SgLUvgz3Z4TgVKxNIsSXf6hMe3/WxvTfI
	5W0qYfmRX1EjznHZnC4Djzxougc8yxlGFXm3Qq4vyGliYfnulkUbCKkvqoZu1oAMy+HPJScQkt/
	A2MXLTleE5FvhgFj1igxS1sWk59i5A/Pczt7tsjiCJxub4If5sBfGsxsIJS6Q255FdNHPgXETKW
	6ST3zQwP1B6n0R5iBN4EiWZCruqPCMW3vJ/UuHdQuGCjfT8kMhWnXnhTBCL+jYlYiVEEI4jnI+9
	H5GcNJ470ZSmHFgzymrra9XMyiME0L80Ohy2ifCAJyubP4KXZwWTO4M9vtubOokZi1mAk4L/LB9
	IDRb8xBRTfi1eXAoWArhr3AfyiswuSAPdEF5aDbmNnMsPy6bN/kKZexwu9hc8eKr5z4l/nCew=
X-Received: by 2002:a17:907:9626:b0:be8:c839:3c4f with SMTP id a640c23a62f3a-bf0aa105068mr188254266b.23.1780491975679;
        Wed, 03 Jun 2026 06:06:15 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm151688466b.50.2026.06.03.06.05.59
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:06:00 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso5223413a12.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5A8F1Hy6nJ2yKhVxZ9XM997Sa4ZP4PE+Fb1CN26aPV6CdJCnGn5zbySMEwm/WQK27Sws=@lists.linux.dev
X-Received: by 2002:a05:6402:e08:b0:686:9c15:3121 with SMTP id
 4fb4d7f45d1cf-68e713e3184mr1563082a12.12.1780491958656; Wed, 03 Jun 2026
 06:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com> <aiAkdZ5XuYC-wpCL@ninjato>
In-Reply-To: <aiAkdZ5XuYC-wpCL@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jun 2026 15:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
X-Gm-Features: AVHnY4Jn5WJuuexJ9K698In0uzIER4UcBvwdWNgk9D9nn5i9fKP95_v3uD6TZnc
Message-ID: <CAMuHMdXG200TTrZGp1YJGt7T2u9vUy9ipoRaOWw_jTaa8Ui81A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 3 Jun 2026 at 14:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> how do you generate the CC list? I wonder because linux-renesas-soc is
> added while only files in the freescale directory are touched? Any idea?

DTS:

+       pcieclk: clock-generator@6a {
+               compatible = "renesas,9fgv0241";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
