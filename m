Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF81345721
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834922; cv=none; b=E5XlokGeirApwG/6u7eOLM4EMFuRaOPBDY6QoJNh9M6seisibWIOLCDdqCfdXAeTMkYBpRksFOAlB+hcizGjE5p53P76Lp2AyKTXdDcPdVV3C1IvukQw2OihvgHebGdGh0RfAw+XnYvFHS67uKyh7eOt2339U/+wiTCqd8ayMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834922; c=relaxed/simple;
	bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epq8hEgZPcr27T9GqrgDAp7v1pyyBzkVJ5E4OVU03mVfpJ4HN8uIETUP4a7v5EfsnztPbWQ74llnGOAHgEQfY46KHE+cmBQ8iWWhtCv2bHQ6wD5kAHFlgF36rx1eROdnJCs5UZOSmFaWhXlGuZUsy/HJLbBAfWE7zQjE7f3QkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eeQr+xYO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eeQr+xYO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso2560170e87.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756834918; x=1757439718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=eeQr+xYOJvJ4URIpbPTviYejM9gYIiF84BvNQm5eo7TKGOdHjLBAtofnSXjmkQghmL
         x0P+oQNqXT2TSduZto1Scg0omtLvPuX2Bbsv6xnptxenF7e0sDzuzOXlos4jdlsQG0t8
         ESNgtfE68lC9b/fmXXBe7E7z96FiomPw8ikaSGotJCaYZw0EHyIPW6Jt1c+3wBu7r6BA
         RU9ru2AX/zAoRjl/epikesvmT45+2LyWHcijy0PbKDlyYpYLnuPzZsuhTR9v1fSzziZU
         xwS8VXf2Fag2p12ZppiHYCzH9ufLW7PCkl9JzSxz39i/e2r5q+DXfn3OzQAuzteDBjV6
         bVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834918; x=1757439718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=dbU3HyytC5E46bDXutavvFUi8XRTHll6G5QZN9ur3+w4ISq9GgqyqePhvFdAakxPHG
         7kPijyRK3VHKOmmfswW4y//Mh/tigZu6A2M5iq1nYFQgqZFGdgLPFlnKsk/upSejJ/12
         pw3zs2QeKu1PrLn3+jNcoKz1EZKXGBKk4q2JzpFXVNv6Hhv1L36g7L6wng2kObhPSjvD
         vIUo7AAwUzjFx6StvNj/ItLLW80ycLLbLHJ+iY4EdmlkR1UyUiorc2B1hP9QaUATmsCr
         hw1kmEVV+tsnhudPXyDympF13Eyg2f7X7bUB4TDJTBgV5PqE4K1g0k6KaRZnzFovJtoO
         kBUw==
X-Forwarded-Encrypted: i=1; AJvYcCWhPnxBq31pqZm+oIjCID/0vbarqYgCbYgyMtHuEkyQDGLVEYkmf9/WsoCb/noUMFGor50=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWtB6ake48LybEcufeggOv46MxzN0Cr3sao8ZOmGEDwNO1cPRX
	u6uQMDRDXx+DWydqfYxEpoGUww+/5MK+x5E+nU+uZ3+j/821iKsLhKea9r4mCnF9RtNmMOetlbL
	PuKw+ZAAplDDjdwtlDcijAxZxK8lEt62unqqwwsQ5xA==
X-Gm-Gg: ASbGncuM1eg4lBb6sYhDNobP1Jdy9l7hqljUsZ6uloIYvEylhFEnp8irBkn9eDD6lAp
	Go174nIVLByfsByS+3pn9Gs2p6nmvaqUQ2pq9coWPaRlDz2PZamDLEGnBid1jgmVReO/ijUp4xZ
	PDK0O9h7q6H6H0wHbGQIDIQJdGcdrjcV3JpmBWeN9ikEyxbOO7XGZyzjYnhBld8Gw3LDyNeCZsH
	tHbnq4Xf/hymfjRjfRRP+jyFHbpBy1SumvuEEyBHBmjd9ehtg==
X-Google-Smtp-Source: AGHT+IEj8d7P3cFn9WHSMlcQJco2rutroHWRWEZV/BsdBzW10JlelDxpX/d5bcqoiRzS4+dxD5+bg22V2Ltijnn3kOg=
X-Received: by 2002:a05:6512:61d5:20b0:55f:727d:408c with SMTP id
 2adb3069b0e04-55f727d46c3mr3142298e87.50.1756834918139; Tue, 02 Sep 2025
 10:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org> <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
In-Reply-To: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:41:47 +0200
X-Gm-Features: Ac12FXz-Ict8QGMZawDnah9byaE6SYSj17yQF92en6o4smsRWpZmv8sya_ULoRc
Message-ID: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
>
> How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to wo=
rk?
>

What even is the "generic recovery mechanism"? That's the first time
I'm hearing this name.

Bartosz
