Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02DD7482
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713322867; cv=none; b=HtRk8/RnMXlw1PLgCqD/sY5mqZFny7W7YnU1sQ4N3EDHxpO5tsFcaJr1gaKpaXT5PG9FZyN0KBK/j31EoWwik5V6Fp8Fw/lDJX1WUbRsKqQRomR8vi0uP606oobJIEJb5wcih9a0Ozhlj+OtfbsWAWX0dVeLCNa8pQ2aCo+XfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713322867; c=relaxed/simple;
	bh=3dcef40osgm+WNL3Un0dMoU5Efciu1Hqwptf1yE7UW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DILr9o/gSL6RKHFeEszBc7G/+E4kv1F9XQPhQXsUb97o9Czzx1QTNSQrW8wrs+rv7AYG/oHrIw2Iy6okS3BOaqc61DzPvui93QTDuOId+CVANXPuJFpRCEBFfarNYqs74xWAzAmVJkGpakW3HvvLrj10/9mEYJ0Tp8UwS3/kRVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S73BXpLd; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S73BXpLd"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ab48c14332so20411a91.2
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 20:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713322866; x=1713927666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dcef40osgm+WNL3Un0dMoU5Efciu1Hqwptf1yE7UW0=;
        b=S73BXpLdZ0OrLtwIGz33BF2bSzr70S6SBNwzLMJQgP2/rzayaaYgU6JVCH40e9oaGs
         F3fnpFUGK60KiWwCqtldQcKQn0qr2fSg3K8vdtmXt6QFFv/RIQ6z2C8Fe7qhIV8DEoIu
         lWwO4/3TFXuzRZfd2Ow9qGttpF00MVN1uxr3t8zqRJKJjGvTPuHHraRWrXsLh/26x+jn
         waz3hg1LZALkqhiaK1gIEsUv9kWdjrSy57A1ZKdtiwIUATgOzk8cgtyoHpAImAapVpxn
         gCUG7ZL5AEPnOXUm95wgi77Bb07lcBsZwuGvbKAWwEliYJRttQT+iHMf42oNQIG+N8S1
         OJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713322866; x=1713927666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dcef40osgm+WNL3Un0dMoU5Efciu1Hqwptf1yE7UW0=;
        b=A96mKw+GZkIq10J7OgrfJWGYOLHeAcugJIuMuclKGeXr9btd96dBcM8mgXdF3b0VH0
         U/Efh2BWD9FMoBwpWrpl2qszD5J2/rRBlue4c1XqiQ8LvnzySwThsGVM7upTs3S9Wesh
         q65xtCuiZjy4UrnTAAx8QRzc0JipBOrC183l4bEYosojkhPeS5wTQz80lpII8KjhSgT7
         /4SU6qqKbjti3hw4MuCC8C3zA5DVYTRYXh9X4Xv1gLYTnKYIZUt6PF794YR5xreLrZLQ
         3GTKyCvUQh0UDn/H+4tjMOh5UaFdXkWmZ6qT4C56BPyvMh0qcE86ma03TXkZZQjXB085
         wziA==
X-Forwarded-Encrypted: i=1; AJvYcCU/vpcD+t0lLViCzXglddJKtT3LO4xWLrkT8JpqgWyPb/RKBR0J/j396sQPaRY/kDvK1woXOmQmazbw5jPxw7hJQfy8
X-Gm-Message-State: AOJu0Yz/EPaUzdXsy/ul1144ymUIZH+ow62jOlTT0coHLQt+lBdK4C8c
	6p4e5vS5hCGNm4DhdluNxbNAHtH/JJnbcJVIXBoCmJNjboCKOyeo+AMqCrt3RJUqDtC3d+PC/HZ
	bQZBLg1ji7Czr/fD6arJQZ3W7lFE=
X-Google-Smtp-Source: AGHT+IGoFzpKM2GBjy2HLaM220rTX5lMUE7KlwkCXfWJFeox+mJNj88qw1rqVTQ7uBs6ir6T5i3BSgzeaV1+D2oly2E=
X-Received: by 2002:a05:6a20:8405:b0:1a7:703e:ee24 with SMTP id
 c5-20020a056a20840500b001a7703eee24mr18939600pzd.0.1713322865601; Tue, 16 Apr
 2024 20:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416190659.15430-1-wahrenst@gmx.net> <20240416190659.15430-3-wahrenst@gmx.net>
In-Reply-To: <20240416190659.15430-3-wahrenst@gmx.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Apr 2024 00:00:53 -0300
Message-ID: <CAOMZO5BA0f9Y9knYm3MPbZ-t0=v2V3kkLTa7111tUndNep7moQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-tarragon: Reduce SPI clock for QCA7000
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Tue, Apr 16, 2024 at 4:07=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Our hardware department recently informed us that, according to
> the specification, the QCA7000 should be operated with a
> maximum SPI clock frequency of 12 MHz. Even if it appears to work
> at a higher frequency, we should not take any risks here. A short
> performance test showed no measurable loss of speed.

Should this one have a Fixes tag?
