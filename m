Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC447CC92
	for <imx@lists.linux.dev>; Tue, 12 May 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570076; cv=none; b=YXHoI/iuMJtj8iodGVIXVDuqtJyaVmRp6eymR60c+g+EUYLg3XgeDuClNg+O5F8eB29B6akIhQWxenpNA205GZGh1O7ck0AXgi5u/Nfktew9Y9tFvEnx9DiuzZ95DAJOT/TBZJg8PZn5U8c2UJ1nryAWrcwFBmo6QAG2oP0k0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570076; c=relaxed/simple;
	bh=UcY4jP/18r1gef8ACE5/GJ4a0vJN1v/bPa2Q4C10n3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiJfdDCLnPR6ZlD50ypmGLAXjwz2alQB9j25RMQM7e2heZ1wvHYrflZlNtbeyHJ76hXGFY2CefiCWInM9HJ+cd+vNGp9njf2Mr2HdSPuG56nIf+AHUehhTUP6OwdIbR/c0ZUX+C44sPegFHdcAx4MzzyNf9w3ugqDxr6GY9xPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-368977e334eso842799a91.2
        for <imx@lists.linux.dev>; Tue, 12 May 2026 00:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570071; x=1779174871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=;
        b=VyNS4jM3e7R81prNVE0JMcxuxDZOmFud51nBOvDSJxi/1+PvfsIZuksKG8FC89WPsh
         Uyg6zxy29VRQjFkQQkz7YFD40wCOM9fqlS0gxv243bsP+fK5yK4OB0aaXXWiGlNheOdM
         nIxiVabvrJtk3NtaPuN0vsAhmcEbB1b3beTHZMWDfkkBlW/cemYxRMa5nGafAj7FAzYp
         VbXhtBNjtVs+nBxotaYTCSjpooNK/GGsjW1TfwZzftys8lSTtEdqWLkxi/AkngdAl1N+
         VT268VhKCbTU9psnXzWg2peExbod6AqcgvOxZxtVTMD3ZiUsIoovLIfb4hP25tgYQmQo
         ohqg==
X-Forwarded-Encrypted: i=1; AFNElJ/W6XXiXuJxN8uhHzswlwg16M5NInSNIaYoBTr5N7zHcM4txGGNU6cKPv+2mRaVHAMt6i8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR9RxrR7bseUVGqOytR0uppTc7Jg2PTN2wxgfWR+FFI0fTVwlK
	XKsl7/+9zdq67ewuMVMy2tPzlsnBSYJNR5H/Po6AehUlATUPqK9Z3rF9JmRPXaxa
X-Gm-Gg: Acq92OGfp9O9FJAT1vFTDHurxYNGkKxsbnNlv+qXIMToHDem9SLHZHyYCnTWsidTAFe
	Q1QD8dG0hzW2lzlIvIUcbw4G5eKwkMJblu8V711AjUY6AfuK4ckxC+3soqjrmOcpPR4GcyIoXA2
	1msSaa94BQjbDXWK0T2hsQM7fswuVh3XCmZkLb9E/NwKZu9TMc0K3XWEkUJGWiA5Nkc19+8l4U+
	R36ppIJ4EhkNPTbcT51zz0xz+sOLydq+d46Mr8qLBAIr6kBMlZZ2y2V03RDlJQbpjCt/Q3fL5nV
	aVBbcXaRTH04CTlTIBTqEWcKSSyG0VyurdRsWOQvcEbHBOGuF8LDiZt+m6M9Innqbpeoa6dAIuK
	kZVh83sOr0OcoqRXUY0QWrJNfFJ5IbaXzZ90VaNE56DSkwJ/Esd6FritB+ztxGEoikpvgsLv1Vn
	Y+gBtEqcqIQqncME4+SPa3RV/DWt5vGvc7Jhy2Hlv0OmDxInAg086mK9dWNzY=
X-Received: by 2002:a17:90b:3d50:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368b269e663mr2080536a91.16.1778570070596;
        Tue, 12 May 2026 00:14:30 -0700 (PDT)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b06d6b33sm572219a91.10.2026.05.12.00.14.30
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:14:30 -0700 (PDT)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1335cb20406so137096c88.0
        for <imx@lists.linux.dev>; Tue, 12 May 2026 00:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ878hdG2PonWkAOQCR/7ZTlKDwjVdziSm0qg0GYygkwZj9frgDJdvzHzYLcPmntT+B+Ff4=@lists.linux.dev
X-Received: by 2002:a67:e7c5:0:b0:631:26f6:701c with SMTP id
 ada2fe7eead31-636187cd6ffmr637420137.31.1778569604976; Tue, 12 May 2026
 00:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-3-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
X-Gm-Features: AVHnY4Jzn5XG3w_TFgzZrTYfNPhFMcAA9wRYKEMGtDIRqvMdxDHMc6dhfvtpVZA
Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: switch exact-match drivers to wc-ioremap callbacks
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. Leave
> the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

Thanks for your patch!

>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------

This change also makes sure mem->is_iomem is true, which looks like
a valid bug fix. Do you know what was the impact of not setting
this before?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
