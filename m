Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D21E32D6
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072043; cv=none; b=CWo9qRwopQg+v0Pb5M4HIl6y5NSFbuuGDCdyW49WhN5glW/46T8CHnX6awGd2+CkwCQWuA8iMSmxf0R7bCTpzVoWzxAkrqIEPd5O1kxasDaxkJDqN/KIGQnwkrg43Om1/YpeeVM1aLqXT0LlzDOnu662Z5OndFFuFp6dU7MZFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072043; c=relaxed/simple;
	bh=azzl09Wx7rt0wPbIl6zF794mRt/KoBI4Cg5cx5Yj+oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhKNE5aMhbdphuGVSvr580PW8I8cDdxL9Yv26wmB7uCozEnguGFL4538VBNe0oLWMWuI1LsfKkUol0lX30x+TWVkzGoikUtRisLUCUv/UU6PqSUznTP7LeKubNMQlJdPGtKNRu9N+VIHLC/ojHSKCkVAaRu4wgZmUa6yhSubLyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ba0d6c68a8so86960385a.1
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072040; x=1766676840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=;
        b=Wt8qCZjz1FXVvTCL2mEJcNtuBdxjBIXaUU4nAGb02dApmfDucHbXDgJAbEkFhxNFR3
         Mmi21JWpCyE7eicX9AfFJaC4voJc91GM0Qpjqx/velTZdAqXW7Qmk8Y3K2Wm4/X5rYuz
         gzkCn9rJ7CX1y/N6sonJIimk1e76H7z8LszALCuO3DrQ7NFYwI9J7/EWQQhHCS7x87fl
         HEo42brRVgSAKMc/ReAiG3LcjOxV4gIh/MpKcgYrjfb2ECW7dkio+MExF9lWQRqAyipB
         SBUbq3vRr12IvSjnE0LECDgOppleq4OAaXUMsyhMu2Wp3Gv2PHGAhTG8XjZkHf35aeT+
         JrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnK4gcvcfoj6KApuZeo6aguGEeW1F+DG5geTDuUrsNqhBNzgPNBaBKSqroaHJxE1wMfvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyysXxwv1zRlbz5emFmImKUfKp+TgxbUE/SLphtHjdhCDAE2o9y
	RBE7YJ27KqVGUFY9vTQjJnOeW4/a4SxYJ1N+m50HYsxNJAQR/ULUdHxEFTohYj5q
X-Gm-Gg: AY/fxX6IGhi+mgStNh75ZW/RrPsEhqj6hm9f850Hm9oBnBNONxw/P3zNv7Yr4NHKcP1
	TMvQ7VmmqYJ0/dx8S3N/UHcAyBBkvjAXiiezDxSRXSVSx+3ubtNKgLfg98Bfzt8nM+hNekzuI7w
	9zUWGNtnXkWWEWtxDgBfRhAi2VjC8Z/fsRQnIRGK93pPmJpb/ewaG9c1nMarMNSwAMeVqs1iJNX
	x/sVUo0cjSDDbfHWSlb+4vjNYJirj4p0F8u9l8cszzRLRlF2FYAzh3XVkekXT6cgVLR/n0SWhLy
	Sx2BB/UcG5nA+FDmq+L4v7dPGWF+lLa5QohjKUSvLrfrvuA+sux5znsQrBvLhZzv7krLTI8rShv
	4Eq/hmucuZeRfFcG0BnFVV3BsPd9u9Eq5dtFxdq0kU/BREPgIM8A7hUDzJte4UpaACAHROhnnha
	b/sjiyqMUDipIyt4+Wen6C4okuHYJiu3UC6lLAIPsrqqGymLQvzwsI
X-Google-Smtp-Source: AGHT+IF4Bw2ngNb4mw1npp3PB/p9P75M9vhHGWwPJeIoRPsO7QvXILBHo1DRgr4byGjUNbj9UATSgA==
X-Received: by 2002:a05:620a:4629:b0:8b2:eb83:b8d with SMTP id af79cd13be357-8c08f654d21mr7929685a.9.1766072040065;
        Thu, 18 Dec 2025 07:34:00 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5f1b56sm183954985a.16.2025.12.18.07.33.59
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:33:59 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8bb6a27d3edso70641285a.3
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:33:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiQWZc1iND/k5vSyKvt6H8DNp6KfnG4GjTyzwjxiAByk1lwRg9rIYRTWLR8rRkh4XgInY=@lists.linux.dev
X-Received: by 2002:a05:6102:14a1:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e827854ca8mr8511390137.38.1766071730637; Thu, 18 Dec 2025
 07:28:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
X-Gm-Features: AQt7F2qLc82Kbfmr6BXfh2mc72SoQ2IFZ770WV9-Gsf5ezj4RJc3ZYutw9_Yvk4
Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Support TQMa8QM
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.

Hmm, clock consumers should have no business with the names used by
clock providers, even less so whether those names are specified in DT
or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
