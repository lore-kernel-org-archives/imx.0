Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8221B9D2
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790499; cv=none; b=gsyw3er+ONeyf0k1k9USFf1Gqg7ApxlJzNDLLn+S30V4vzKFaxYtcmEq9TWpmw2ZGUmV8zisqNYOW+BNoyDLPpG8LjXdpFHwzyEOZ4lZnI9AFjKap9NUNID1Y3S452KSMSn1W0a1tp9TNt+YmoHs/ibUqsIg81xLEvolGh0bqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790499; c=relaxed/simple;
	bh=PL+6NLii3pNAIMOwfsbGkrxmE6sEQOXFEePNerQiLlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZ6hSGv2nJMa5brjMJ3cFSmc8Y1eHGSUVhNBoSa0z6XExzVvN8CPUdfVUo3+1lPmzd2eXuao5l+Jy7Pql3pd45WBL41mzYv/J9kU0l56LhiVj9AT0UB8vTcAKXe7c9oboySQpX0vlS2QZDnJMNsCDidvkVqEKEEISW1zc1ETVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5e1fde1f014so1024030137.0
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 01:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790497; x=1766395297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD3LsoVy+6tGvT7r+bqKFlMWkABubbkzpuGbkM2JYfI=;
        b=bJtqIP6chTYiRO6H+swb1Zrp7PbxLzPalBXtAbP7X6H7W50I7Su65k3rCrOkJb0o/j
         BPGRPC3mq2Q5e0YegbMQNI9KuhIrn72g6MBQMg4IlteVXwfAwg8zwvUvqqX7JM/ZlPnv
         7Mi7XZHmeKfsi1rIfRsLigDilsLm7eJZSJTq9pGvalZ8Wug/BVl/03ljBio78d93ZTEW
         DAvzwAsM4P3rLvEa0iai0q56z59+qscU+4FiELpUTzjVxYIbSNpy6IvSieFNY0TyLUfn
         gTaaghjESEJMTPLafRPzFSObBIXA/DVQlwY9naAnzcV3CNF365If6HUyTDjHF0TLJy5P
         J4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW6UR7J4hJ4T3uQZn0vk7qzsiH2a7EkhuVkLrP/6G7CBrAvq3pFhsWMVeqX2BNan9VS9ho=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmUz86TAVdtFDU8dUZ6iOGaSpkdU0Rq9xpBslp+ru8Er/EiceS
	UHlWN5rLc9o6LJxhSj12gHe3jdBlaEHDMav4BQiqtUdgQSR80zJ8SKNb9BDrl65ET1U=
X-Gm-Gg: AY/fxX6lKLMew4VBQhqW5o3BUKWOk6oawMXbbzztMmcs40AqC1d9k3hUGFFSpNxLoE0
	4CX4OLj6Zk7LcqMKyl7doFyAokAkxCsYEnYytDAfxxNcQb1jbTZF+Jeo+VpGsAQfMq/jGtHawV8
	1tOQH0BZGrDFsIztDgU/Kp6qKeD2BN7rLqYJ/cYmLQYGKQDPIRNs6YtuB4FdLXVmj54WCiUapuY
	3C4z6NIUqtqtbdN26yNBqMSE/sd+2TrfGp/oRELpuL/ctUkWp9l8rLx+LfRmlbLOr97F3PTAdAR
	l11+zLFNoZAoWIcmRRK47A39H3MWHgo7lFnSJxA0G4H6OB73qEv8lxaWMwxGr/AgKME32v4wEe1
	W82B79gPxMhUJUrMfI5vPiu29Hz67h6FMiBLauPGgqS2dahwwgPhPyrO+lHZ1cZ/6SQcsDuHS4R
	RW5OZ4USL2LsbbbETNqjpax3cUQ/W5bTZEdg8I1K3jYcgzfyFdFWsl
X-Google-Smtp-Source: AGHT+IEvXbYhysHQYlRoqYZrVui8OBE+u9rdl28iepFN9KwCTOk+SC16OxLMscsq2IGWQllkBL+xEg==
X-Received: by 2002:a05:6102:a4f:b0:5db:f8aa:3a64 with SMTP id ada2fe7eead31-5e8276d8045mr2919718137.15.1765790496746;
        Mon, 15 Dec 2025 01:21:36 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7c85c43besm6176694137.0.2025.12.15.01.21.36
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 01:21:36 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5599688d574so846702e0c.2
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 01:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQMHTDSoEyAwih1vHmCuTRoPrAMMWjIe/qF4WJ/FDdz60Fx9XJ0DLe+kLMR/20tNCsrGY=@lists.linux.dev
X-Received: by 2002:a05:6102:3747:b0:5db:f031:84d6 with SMTP id
 ada2fe7eead31-5e827803cbdmr3453459137.28.1765790495946; Mon, 15 Dec 2025
 01:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com> <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
In-Reply-To: <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Dec 2025 10:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+U_Mv76CQ7B8CWGFDWA+Vh=L6r2DsAnDVPc13VpSK3A@mail.gmail.com>
X-Gm-Features: AQt7F2oAUeI2BPTR6xXu5vgy0Vjr6n4qDbSOW4fA1OROG46ue1ouIwHUCHWuG4w
Message-ID: <CAMuHMdU+U_Mv76CQ7B8CWGFDWA+Vh=L6r2DsAnDVPc13VpSK3A@mail.gmail.com>
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Samuel Kayode <samkay014@gmail.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sat, 13 Dec 2025 at 10:39, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> > If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> > *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> > fixes it.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>
> Applied, thank you.

FTR, Samual submitted a similar patch 6 weeks before, which did take
into account alignment of the continuation:
https://lore.kernel.org/all/20251028-pf1550-v1-1-c50fae56b9b1@gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
