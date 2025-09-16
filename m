Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CC275B1F
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015796; cv=none; b=gF6YBGSq6alBLqST8gylVUJEN0BmU7eUKu4UpYYhnG/2KD0On+cT933BYPRAIYdtXwhDHJz+YRoagzVgAZR6LEO0AtQJrq7dzaSzd/OWh/n1wnBk1p+f5EmPcaO8wPiM/jfIEtSBQmA+nnXj70UQt9l7jTXLqfH0QnMG5PaSaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015796; c=relaxed/simple;
	bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGls/mUY8KUoNvTqEKAmYvh324d6XWesD2gZEYsD2JmZdZEUoTlQUMgb01chEdJO7GOk43ZzcH7ZKweNJXmFU5IKh44AmcusbRus2lEMxc0jVob1dxjGc2B1YDmI7zEWYXpSVeaX57PSbvFXNbPniooFybNy1gbhGQTeYqp5mcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WakPHu+4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WakPHu+4"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60150590so32318317b3.0
        for <imx@lists.linux.dev>; Tue, 16 Sep 2025 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015793; x=1758620593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=;
        b=WakPHu+4lTgC0z56Mn1iNUtd/S5AdZXBLZOcvlXTjqHDLhXXFcwdN6QBH4pcQW8+aJ
         xU6dXItq8DWuShvWEo4rC8l6WfIq9v5uNnT4OUpGqyUGbbRR/d2kTkYORPtOgO/VkmnT
         b02FBS4VVuLclFoTmVAaIX/p+zrulIcBE9MyKjfXqWK+giaq8Yh0pNEpg/Hz5r5gseDm
         Gz1aDd6A1ciMRJScrATZFl+J4dawny57SiOqtYsFTnsw0ShtwCAbMqoLVaVhqMDwSyG8
         dJfCOFs5xBc6lZXZcHBySmvIwKhRgOWBB5ssvtnAZ92TKPcOJb/QCHME9TC1QO124ijh
         Ouyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015793; x=1758620593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=;
        b=XWXTZZnJLEvPwt/rkCxr1d0dJ1Ev4li473sz/+Z2phUoOukudRIzFYQ+/3nXBJ9MFm
         y74IAWWVApS58ZxIC+bR0ktinKRJSiSfM1U7xygLs3uRKtdOHZX91ro5CxWH4Qkg8EER
         QcseaBOqG4xTjDh5n5axBWoZyBnUFm6dFZOZDs8dWFeqWePo5PQzhjWhCj8N8REEQTPB
         yhM0sxWebfIb9R5SGeeVcKOqnCK9UFZn/xevq7MjsQ6mThTv8AzSFQTsOJGtGOHpiwBk
         tWkGrFp/PAoPYU9WXMRX+d+kI4Smqmyu1cT6ZqtbG2zFIpgFDmKTMf22TpZWsTuPV2fu
         mVLw==
X-Forwarded-Encrypted: i=1; AJvYcCWZmUOFLkNPtO3k6n1bdDHmiksxGhyamme9bjGDoVWofql0URfjG8x6aX7DeoMvhQEwPeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAD3BPdvCOKX+NGw/eVbBw2gdTMdk8afYH3VMM5A8CDd1jX55b
	pxlQrwYnGpDQCIXIHaJWywdwXtmUek9Megwx6zrkAYRiPypKC2e3VU0vB2rcq+rBHsD3V31Qoa5
	Ro5SXWdt+hsJhAU3a5/Y+8d8PwpE4Uq0=
X-Gm-Gg: ASbGncsbk9hmxJGi8se+lnjNVZxsmxuuEszjpFWfTM8rbFGWu+dzOh5VbbtmLR0a+bf
	GW2JHqXkDNsNHvCoTO9SCOR/5q9z72ExWKk4ADfonsdFL0JZHBzGxleRQfdu3twxMkvjUrYpwYI
	9d6OZeBgPO452yOmHMoytjTac8SqukMrbuVZdMf4YUod3dYEhVqCXD7Tf/qaeT+M7E29aB621ay
	jgPEXCxc4RXGc3JeNjdNHixj0CnglU=
X-Google-Smtp-Source: AGHT+IHV/RX93XAmuJF2uL0N4vvl4pBykKHWOWIaKMzu4BBoHbE2JJaflos/7YY6pTURHoTpA1UgbNRwBPMZjCyfZfM=
X-Received: by 2002:a05:690c:7088:b0:723:b16a:ce6 with SMTP id
 00721157ae682-730659be315mr116536247b3.50.1758015793437; Tue, 16 Sep 2025
 02:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916-flexspi-dts-v1-0-61567f969165@nxp.com> <20250916-flexspi-dts-v1-1-61567f969165@nxp.com>
In-Reply-To: <20250916-flexspi-dts-v1-1-61567f969165@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Sep 2025 06:42:54 -0300
X-Gm-Features: AS18NWBOYsyflacEeUU1SMpoaGg-Ie2TjGzWnHyRp3ZhqTvzAQSB9G1WINvKAyg
Message-ID: <CAOMZO5CTrGA19npaW+u0=V0nUV0nAqoH+p75L06yR28DVBGfYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: correct the flexspi compatible string to
 match with yaml
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 5:57=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:
>
> According to Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml,
> imx93/imx95 should use it's own compatible string and back compatible
> with imx8mm.

Nitpick: "fallback compatible"
