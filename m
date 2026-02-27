Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9EC315D23
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180703; cv=none; b=ZA3cvn263dadeWmswcQ9PDpk9XR8qEYw7p6t8ajnEy1lYscbGO4Xktu+6xac0Kc+FW0AYckHEOLXSMbECpUrKUTwzyw4QfdKjAl9J7nKFuwo/AkLCuMleAE1/IaGIalF/1vMeUgQrQcYFtPwTZ9glJ/lVBShcIcPXQrWogFNnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180703; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZINmVYE4J1FpEFJi9w1AEXq17F6iORHXf3ul9KQXQGG0AS3iEpJrOK6zXHZPWJwMfQNLUgHY/wosw+jRtw10/FEZZXDP3AvuLtP1c5obxd3g+VZKyMlPf5OXLfZhRwt+V2sJjTxfhAAbdzEX9Avxt9W/eGfrYo1t7KXtVlKXGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c70ab3b5fcso246593685a.2
        for <imx@lists.linux.dev>; Fri, 27 Feb 2026 00:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180701; x=1772785501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=M9qGWAjk8Z2NN0b6t8IAN0Ant9bVWTi8/rF+FOU3RlLaH6x5YmIfTq9B+SX8rx+/43
         OG1+2fKrSM6SjLtDJ8uIKKa+ajDe6WSRBewDd+p98JQVbBqPsya2kT2v6+40iXZXs4SQ
         AehZfZSOlvpiG6E/a87nh5GvjYcpjqGUySSO1RQ8OAWuc+qkO+m+NpPpm/joZrYobUsa
         YBbKRT55RO7J1XVXo0An74IHGMfjdijoFcfrGdVVm9kF1bVAkz1Nqc8E6/8EiYGc7LQL
         L4h4ylU6IDP+522wFCa1xyI5q5u7KMTHoHSqDenkk+knWRPL60G2/uozxhkH5z1Tersc
         PLJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQVu8bdbgFFdQzkLt8UB+PKOnNz3wFP5tQhhz5GT0fd4K9wP90X73kU4TFTUAZZd5kPxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYBvKozDW/8YXIOfGZzr+kAwYH3N9iSaAUXuOUd2nkWmG2PKTn
	GkffW1E9qq1zbAVMNU3X12DVr+ALcC5a0hgvTabW9wFbEgjUPmE/BmtqsCsH7y997o8=
X-Gm-Gg: ATEYQzyb2LojCPYTp8Qo2D2dtxFJQkIPWdA0AVOY8Ob+2keBXNLpNASq8wgy8avTFYq
	IP+qqtyJW+bkiFZ518i/5jhJd43vtFxORIZrx3NwUzOw7VK+r8zwvtOzEaLD+FNVPJsM5fFenBq
	d0e83QaNurm3HDRG8iOFqpGYeucm5qi/xDONOLMK5deqPRz54fMKvxOJ1SvBTIMrlA9EcPv5mpG
	wD+Slg7OVSFjtSS6JP7apYOzEudEPkGgYsUeV7MU4/fDi27IhRb0YkPKV8dyckmCq65jHw1IotU
	ZlRjrftzjjflPMq8VF6qtNZADKdcsfN0t5xYVOweEyMB3Nz/a2r3aBbXQ0UIUU0V1f2lSwcBqoM
	fFRhksEiusO39kftIhVQbBgVdWPHJoR3URmIL/r3CSIInRi2xWemKfN8L44lWFlGCdFfBNRCVqI
	2Tfgmyhk6ru6ZFH7vhV40HDgT+gB3gYaGmfF1riJVcVzadiTZP6hbu+fNEX706J4gjEilkLzM/L
	XY=
X-Received: by 2002:a05:620a:454a:b0:8c6:d34e:9c51 with SMTP id af79cd13be357-8cbc8d81793mr238605685a.24.1772180701511;
        Fri, 27 Feb 2026 00:25:01 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf71ae8esm406800585a.41.2026.02.27.00.25.01
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:25:01 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506a019a7f3so21987541cf.3
        for <imx@lists.linux.dev>; Fri, 27 Feb 2026 00:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA30ynguv94oqNTPvfSMJSenFOCEO1L7ZQWAHrlqVhqibfIiDRkpBIwGdVJx9ir9mwKd4=@lists.linux.dev
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
