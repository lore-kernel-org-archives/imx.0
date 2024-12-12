Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EEC225412
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019853; cv=none; b=GwTbPXYmLsK9HZIZEX8uMsydXC+T9XdC+x9NLuoTKVsR28iMQaOnXFCidCaSpvqt86uBG73MqaJNO1sYn5w4qVmeyHE1YTqD/V2fQIp63OQvt27vitH0bzin/+YRGVn2G17FldBl1pB/g1AjmL6er08qxYIe9lS6tx8Tlzg+xbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019853; c=relaxed/simple;
	bh=E8TTZbAWIR0jzsOWYV1xtJIvxfZDCTwBmvcEuKREfKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IevxCDKHBrDOToyek4tzfamk1sSSyaEj7lfohP2x5Sa9AujSJykS9xHLbdjehVaHFSV7fUZ1CznJOEeC8ajCKY5Cwq5HtnMhvq6htzYWQGDSnhEu/XiaTLiaQ845AKMLW4DCyFJUgYnz4lmnMNCmPsE5cmcHPeDOPWzReOqN9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcBDpVMP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcBDpVMP"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3022c61557cso6943701fa.0
        for <imx@lists.linux.dev>; Thu, 12 Dec 2024 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734019849; x=1734624649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=jcBDpVMPUffnmhANFYnYSOUqZyatdBrkzgaZR69c1uTEvpyT8KTa4lJYU792yFS2Mx
         IdnREQCZLRJl3uznj5W+gmr7Cy/w416sp2gaDeeQyf/IZOPgLq++3uV86X/nBudG218T
         HKqd89GI+nJKM0S13pV/+/kZDcMLk0RcyA5LwYUBvxa9JgSSvvT0vmaXxKAJd5+B+6g5
         1q7umPactuOUGu7szIHBYZGYwQhNSO5yyc4Y7dhsP0p1pK0uW3jSCPhNf00k52MnAbp2
         9ySIjz/tGWa6a7jE8K/adj9ytLP+InIoj36TIb5fahx2jaY/2D0to9ByXFb4NJVhT0Uj
         tt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019850; x=1734624650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=v2qc7sCqLy9gxaNeEDExGUz9CaFE1CZOGNZC8j5BYLBd9kx8siz6cDB7yood+4E4tp
         c5hVU2M5yZGilytpQfAiim4dtoGQRwqRNXthtetq3ovduKiW3rVrzWeac937Sr1JUz5H
         4uxZcUMGkTeLia+zEGIUDyidGZn0ujnw97qcDOAWMM5JwqHw7Z2wggj1JR8YHceXRdsD
         0Ph8ASpELsRiORF5Qairqx4ozviY6UUo/ZFF9Q69oeu8DdOIMSfXYTyo1pjlpowowTnz
         IinXEg1Us9gBv/yWPO1e3YC/P/OnRqbGZuNgmv6Y5GknIfeRz51dNYZBpWH+TcGC5W5t
         bNKg==
X-Forwarded-Encrypted: i=1; AJvYcCXwYYqo7TCZx1useUr0E724udt/qxHlyxx+I+9QttZwfXzgL9ddzsc46eOSJMYUPQbHu7o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmIiE1Sy9wuT32xQtKQsvDxRRLz6OWSgSZRrX7hYTrGvXl9jih
	G+Z5W+rRXlv/Hz+gkvytBsYskEk8h1NFCDzaB+DrtbVeDhwNW1cL5vGgJvBaiQA79Ss9OyNO0ei
	dLLTCwrZYc1xqWzUKBkFtWEuoJco=
X-Gm-Gg: ASbGncuOevrTVagcJGmyT5sQR8vLaNC1rwmJUJ8gLV3MFJlIKLdq2Xhj1F2I+Mc/sKR
	b7ew06qOr/iF2pMgFbrCUd/0SMPoqThCdmgeYZ/kXrtRagLY6WNTBRYsE7E6HlGKLujU3dw==
X-Google-Smtp-Source: AGHT+IEfxOaxJF02cqCb3o+35QthKCmm4+8U0/gTtwd0T+FvVSHeVgyOje6efKWJI1tAN9KX489WrZ5iZFjUW8eIxGo=
X-Received: by 2002:a05:651c:2226:b0:300:39eb:1aae with SMTP id
 38308e7fff4ca-30251e30b03mr3100551fa.24.1734019849270; Thu, 12 Dec 2024
 08:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Dec 2024 13:10:38 -0300
Message-ID: <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 12:43=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Hantro hardware is splited into two parts: the decoder which produce
> tiled pixels formats and the post-processor which produce raster pixels
> formats.
> When post-processor is used the selected pixels format may not have the
> some padding/stride than the decoder output pixels format. This led to
> miscomputing chroma and motion vectors offsets so data are overlapping.
> This series introduce a reference pixels format that decoder use to
> compute the various needed offsets and size.
>
> With this series Fluster for VP9 tests is now 207/305 vs 145/305.
> HEVC test score isn't impacted by these patches (still 141/147).
>
> Version 2:
> - rebased on top of media-commiter/next
> - Add reviewed-by tags
>
> Benjamin Gaignard (2):
>   media: verisilicon: Store reference frames pixels format
>   media: verisilicon: Fix IMX8 native pixels format steps values

Do both patches deserve a Fixes tag?
