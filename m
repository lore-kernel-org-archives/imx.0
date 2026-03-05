Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AF35E949
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704868; cv=none; b=scxkxMRifnZick2rK9Kr7MeYWBvcUH32wttyWlfjMpVh2WJontXZdBL/EEGbXzGGEh6KJEICSTZw/TSEnH61fKlj/7anilGKs5LdzSlXw2lnPtE7Xj8ST8WE3BONROVVQQ3+evmH4Q/bD5CTg432GgWh24uO8JaHUAOnFGcekA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704868; c=relaxed/simple;
	bh=508+zCdHt9MWfUxEq50brZahkkEiVxDT5BqlILcd3+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OD8FB5EwtDKi64vPzVq0fObJEGhyO6bDmUZIRz8H9NXHY9p0UEWI9uTuUfujGsn87QNHQfwLKl5wHwf2lGgfTBRK5eAD9estdyyO/MLJPi8Xfg4kNawMBvBPg7jJjoFHEAxQW/J8k+XvP901Uu1XiGgVvYjIYjiZDSQI5/W7RLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso3992463b3a.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704867; x=1773309667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=ufdqrj1AZtn+zLvkBqVbjHsyCukmj0qBoByOHn+jsjQ6xYCA8gr4lDN/2P00cfz+4H
         2juneoIL1hrnDsflifU1zJhQcc004/0I4krdXSy8wcTdUhvT99/e7kE5BW2S/hX9Fc2L
         Yko3fw9Ui4RDkmo/+vTCj8Wre51UIh2ufFwfZqEXy/DUQJD2sgaAo+MSMscqn4u59xmN
         vCoIXdjz1h1Acmq4lw4oezM4egUozCyWuBjrVq4Ea2wdJjP20yieDweKEPngvESIxfXt
         inV3GQz/UvssGL3UV7IAb7IMD1H1dJV4awZwcnNLTDl0Wy3smP05WSSPex8PG4Qj9HVu
         2HKw==
X-Forwarded-Encrypted: i=1; AJvYcCXKDWQ8OS1HeIdpTsA/mC+lFd+w2/N8BukWmnpYnaNkOH0Pmopd+mY871TgVEnbtncIJrk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkY/mplVPXqGtXYEN9kIgD/DjocHEzKnsZ855Ggk2xqALOYtPU
	mRoz4HKsIIZ3hBjgCWxaDXaxHtwZUPKo7/PMECxvKB88r2prDHXpqSO7SKW8X4Wj
X-Gm-Gg: ATEYQzybF4j+R+dc9L5yWMqnO+1AzwsjUq5dixTHiET1GRsj2NGFQcRHhueX0B73yRV
	9kfFLQ8Hqzuh+u5smdzxQD94I5sbVAx7K2M+TEtkJqDDZt4diZBY0zkOvQ1Pg4CjVkby09XFknq
	aU765GNm/UN7VkYfvbRCpRygZF/xxxV+qLQnwhgCXcZ2eAVFcVn8jy707/TWzZbLsyp7oFHIrX9
	Z0BRMnHGcGpuQhsBFU2JiWx5BMRyUcIgNlUVQudCxqvdneGF87c7usfoZ/wzhZKiLOAeO0TqhLu
	kagoVuqmHDCg0N/0Cx6lFFQ47yY/L2NrWMelVistlOBD5rbuVy12BXVBWmsqm+UqQ0CWZIN9pE5
	vxeh9mnSOPNyrqP5Z3iKbUVq/1HMMalAmVLNvVWnr/H1F9ZzVm9ZF6t090WubrozTLlh6hEL1qf
	dnJu19geYEGRs9M15tNKQcYynWpIwvST4wypBhnhxCzGiJS4D5TrMmw1urC/I=
X-Received: by 2002:a05:6300:2109:b0:366:14ac:e20a with SMTP id adf61e73a8af0-3982e215fe1mr5063272637.72.1772704866653;
        Thu, 05 Mar 2026 02:01:06 -0800 (PST)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738a6a8374sm2058911a12.26.2026.03.05.02.01.06
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:01:06 -0800 (PST)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-128b9b7e3edso2200828c88.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:01:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdwpqA7GHvOo3T4TII05crJDQaNhAquFnrmG3pO3g9taUF+P7Ms3waUoBfBFxlZ6N2/F0=@lists.linux.dev
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
