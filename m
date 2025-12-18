Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2413570C4
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071588; cv=none; b=jLlGAx/yNTm/AEJXi4hsKhD4obOeB9VUPZ+94HDpdyWXjK2TiMEUX0P3311RxxYUF/9h+S1gvM1o1xeMWsp19AAri3J8rV9ArpPz7d8vM2nT8heSflb+Q1TVxzPc4MLQ6DXmxMPKMhoUw4VGH5Fg6ZmhBlEXtk5tZbYIHuG2TF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071588; c=relaxed/simple;
	bh=MZFYNuXybRkvVzjEOIC4+EfAayF8myAFp7P6EDOSejQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAIsibD0Y7cmk4M79xYfLPc2EGIEoACH1JGTBSqgjL+VmM3Ays18KUsJ5XujPAxXhSuPMzIrovG+Z+TvkGoHwSnJTn/+ZGKzX+tjCmySHWTgVTXrcR7TsMqT1CBAp86eD/LVqICqx0hTPYGM6rAs53dGnXI0fQAaAZnUkEflc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so501012e0c.1
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071584; x=1766676384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=;
        b=UiTvZFkBUp0Thg21Wg0zLVK0x0OHZ1MzdWVBli+rtacCC4bQw+3ZdabuU4mRwk0zQM
         kex3Tj88S5VXvmwP949iyIAMZGGPz5m6nMQ2vHQIPEuWnj18dkAXnc5rDY1tba3fH4hR
         AOR0f57kHl5SnQZXt7SRrcRjHVh8D6lJTQH8vIVDdkNUXDgrdjP2nMFObEZkuIjQH0uw
         W/sINoqOFsqyptc9ubRZoZftJ7vB03epUaQDYUKSamT0GjwDiy9xFZgMLr3x2U/PBz8Y
         2QISQql6R8uR3nZaZNm1rYZsqM0wb9q00Tv6x54UZZy/dr4KwlOQM7uyhCf22wH4PEHp
         0jgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWijwmmp3GYzH2HUzgm8kH9Lk8IPmlwXgnyxG96XWOMozGub1fdNSIg7clsIx94Wg2TX88=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcXQeEjUGLAGNg1XyQ4hS4oBWUh2ZUJ1Ga/ZwsXI34VHVWfssL
	LgA3wraaQRwHmS670x90vkcrRarqYPeCnzajbLffQfgtRZLlUbtoeel+a6twgQb2
X-Gm-Gg: AY/fxX4w8sJhyUkFI4vyLJNHotE/Pj4j8cm2kKikn4o7KFwGR7gN/pN/exXM54R573l
	kiHFA7mXd4YSRz0y0UNHb3uwePnvDcEwIaNdPi5ct2wc0InlwLDvxOYjL/wk7BGnCJKMl8wBfxZ
	h5FMHnELp2ZPTj4aQ8DwjjaZ93nCTovhH37TIaZAF/I6r9lTXS29Gi1Ngip8SBe8ZkzKI9KiDRR
	tKqDqLRciTrgby63/kJl0eXX7QGWLPuQhHOtoaMro68Lw+gOLRp48Jk6qSRJJ3SVU5zy2ps85RG
	QpslTVyMObbpIIfXNGZHjl4KriwRnFN3BjxUM3A/ElhTH+mdTymtJ/svv0g0wSKkpzzR/laf2Qp
	N/zdXotS6vPOXHBZz/3NkXH3RtCHNoBlDAbyx3u+YP3QNJbuzDyIwNMIHP6mzMa3FlUEHIRu0Hj
	+a8wzF9KkqlNnhMfhkVjMJA8pss4/vV71Vgx5ybCUnsfgT05YVJUSI
X-Google-Smtp-Source: AGHT+IF5RPqwyI71amHWj5vzwcgrHWdBte19aJkDhK5FWnCRb4bzYyKsrZpcHkqmETBdBLUMAYBAAg==
X-Received: by 2002:a05:6122:178b:b0:55b:305b:4e41 with SMTP id 71dfb90a1353d-55fed663b71mr7885696e0c.18.1766071583944;
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56150f4e0fesm1104500e0c.3.2025.12.18.07.26.23
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-559f4801609so278494e0c.0
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViAECJyQEBatO3XFhYWRt1HeM7D8fqW8+JihSyHIrOBoj7RaEDCttu/lkk5Ws+rWzUrLs=@lists.linux.dev
X-Received: by 2002:a05:6102:644a:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e827475423mr7568578137.7.1766071582885; Thu, 18 Dec 2025
 07:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:26:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
X-Gm-Features: AQt7F2orA3yT0lOZg8JX_FxOJmakbvS5h-4BSNrnlwxZlZ9eRsbqovvybB3Xhko
Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:21, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Add "clock-output-names" which is a standard property for clock
> providers.

Why? Isn't that property sort of deprecated?

Will be replying to the cover letter next...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
