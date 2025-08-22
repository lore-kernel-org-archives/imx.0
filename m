Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A29428852E
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854929; cv=none; b=s3cufDxHtv4dxGzBoQQeCadVSjODFkTbpNq2meZYWdBmqVKYYHxYnkxcBd70plk0zgRmEi84LwCLZojKJsML5cWDrWAZ/CJJviU+QZ5lLEszX0aVlk0gf0qNCvLaKUX+/8gLwJX0nRZucAP0AqHZAG7+nFNIS29aXQXIjsO1A70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854929; c=relaxed/simple;
	bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG051mVED5Bg6EiXQva1bpTQYpxHFSA35443ToNCSed0PbAR0fEEHQlexSTyE0JA0tbhBRnyDDhEaQnQ8NAWSUeknM76HjuUi/WOZiZ6PeESLPhqaD8353viK/yX5kpxxiSLrOrg1WzsQdW1GEmiAzMDn3HZ35lAt14bFu3c07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/rcTN8r; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/rcTN8r"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381f39a3eso754996a34.1
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755854927; x=1756459727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
        b=m/rcTN8rNdWchRjGre1EcJzMLGK3MEgz6i6Q+h3AKMYObNPIIEukUaOpf0RMIg14eA
         YwSiHJPGbmSzDjoOvAYZCVauJu7NLDgqQxgS67xl2KfxrHGP5GJtcICw85JFVfjDSKOQ
         xesakP8/ROsEyNPipv7ileXk7Od4u/es96XSZfvIp7UFk3YeHOkBTdosy4hVkDRzM/cB
         8Z5VP9ZE5TIeMAJyvFCoFMyZG/VeRNjC0MPdfxonI+mIQ+nbjU9/jdkYYQX2Z5n4FNOw
         irb4HMg/RwHt6Gx4pfFkTOAyCmfcV230YSFNVQQVOgqjWmNOtVGejhrqSfMbZxr3ahLR
         KvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854927; x=1756459727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
        b=DVUKrDmW3FctCty9xUL/1p0qCz4QrxzbN+6WkMeuNIp2kehRz3C7LCN6oMevanreWZ
         i9l0Cb0QPBXptZiEoix97CiBEjaSqcs6TxbwXpk/uf8L+L2LFZD3VrSEtOb4QZXitiNF
         sWkWYZkwWj5o1UmEXcfCCd+dYf3q+ipBdeR/nqK0JgU1sdB88baqTyE/4A6xuOHNm3yX
         yUq/W7IqbRz995jGrgV7iBx0B66Co7q63+3/EYjSbL7WixWBWBpLXMF/OpVGggWoqV2s
         oLCS+FAWxms9g8Mw5rHHzpUQ7PuDxqFDLPInNiYG7mSdPWNGJAORRbdhMCLRW5qo2ekS
         Iotw==
X-Forwarded-Encrypted: i=1; AJvYcCXsa5aMQzGg45YGZr4BthqCkiU3I+ZYBYLLhZfc7HlOnAYSixNNZXiXO0veJ9K3aZaHotI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqG9syK8iffBw23HxJuiwvROVIPtd7wPSmye8ESx2DjpoicIIS
	UDv34ZxkediTZ4CagVaoB1kAaWXuRwZNC1pcgzIohxa2OTNo6SvlyhuqGLaB9FDLl75XCKZzsAX
	DFuFq/P1c+X3OWJJTNIdq0e6jRjRB8Fg=
X-Gm-Gg: ASbGnctOROPYg02W9gBfGmDbjHINurqhlI5qPuzB8UFuERVqg/KTN7RqOFVUHrEnn6O
	4+LAcfMApkwhMCNHF2ibVAAzXo55MaY8T25eSjsrxigCUGtUTiaH/drcO8u0FjDmA9irG2WMUmB
	vL/msqZqyaLpUhlSWLPl0M7airPaKRkCe3W7FRZsEDXjMkujIBFMsVVWeP+T+KSiupf8Q1adTCK
	A4vwV9uynWG
X-Google-Smtp-Source: AGHT+IG0WUhPdSZY22zjNFYLvLkRtJyOHuecSxMaftHRAg40biaWvqUVTZ0TEJKgzzIWavFPuLuDyvykjJqKjLkk/oI=
X-Received: by 2002:a05:6830:6007:b0:742:fd4c:53b5 with SMTP id
 46e09a7af769-745008e592emr1631143a34.4.1755854926647; Fri, 22 Aug 2025
 02:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com> <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
In-Reply-To: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 14:58:34 +0530
X-Gm-Features: Ac12FXxMSIjWb7zWOXJ_ncO-BRx2eimh_ZSSxq_sHgWo2d3eJFCXvRVqNXXDoHg
Message-ID: <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 11:49=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> I don't understand. Don't you have a subscription to linux-iio@ ML?
> https://lore.kernel.org/linux-iio/CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEg=
U=3DM7FSYBv0ww@mail.gmail.com/T/#t
> If you found something new, please base it on that series as it was
> already sent and reviewed.
Thanks. I do have subscription to linux-iio@ML and did check the patch
series you mentioned.
That patch series by Xichao Zhao removes dev_err_probe() for -ENOMEM
cases whereas
this series is targeting slightly different cleanup of removing the
plain dev_err() log messages
that are there for -ENOMEM.
As far as I can see, both the series are modifying completely
different driver files without overlapping changes.
Since the objectives are related but independent and addressing
different type of change, I thought to keep
these patches in different patch series and have clear differentiation.
Although to establish similarity it would have made more sense If I
would have added the link to that patch series here.
Thanks,
Dixit
