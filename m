Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDD15CD7C
	for <imx@lists.linux.dev>; Thu,  9 May 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715264240; cv=none; b=TehmKhY3dh0LUOTrqL+9CK5Qg28wYWY2CuEx4WJy9p9OVa4EJ2rF9Sk5jNuuEmux93lgTCmYXnxJwIHMQgcg2/B3zLHkAUmkzTzbmVHLAuEDYCytqyz9rCUIxi5RS6MPK8KnLQgouROFvD78ywBEwDBUc3e2QTvK+O6LwwfuYSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715264240; c=relaxed/simple;
	bh=PR9G2+1CHGEwlck4+knT3SclL6xiZ0MN+KWBAeb4SgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHGT8gx+eL3bZ+8jkj+wwmkGXtcmd7/37NdMEQ6AmGPj+qRfKKN8M58pbZo7jwBxsdxHbgqx/8JkPQbG88gO6Wqi2ssdOeQ+p2naU7MRGwhu1XZQYvplSdIW+Ak1TrQF7qgP0Ib1yNJZbGbdwjOHPSpHv+pvfZ8fqYIAof6p3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxKZpNPp; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxKZpNPp"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e3f6166e4aso16560221fa.1
        for <imx@lists.linux.dev>; Thu, 09 May 2024 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715264237; x=1715869037; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR9G2+1CHGEwlck4+knT3SclL6xiZ0MN+KWBAeb4SgE=;
        b=BxKZpNPpr2p9AgnQ6jPt77trYdO29eY2ylNvCRrDUZEkT2oiHhq98h4HAPjk4y3JNY
         M/hYiMcp9Rr6vHQzUs/ps9K408TkWm7FI1qtKHVRbFk+cmrdSOjVgWR7H/B1sHooTTFl
         1kr37dIYfdcomy6vz57fZd2uUMFswnVJBuzDYU1+zaKTkLDRPsx+6p8UX+pqiLibpC5Q
         wr+Sh1vEWjacNdcjniK/NUR5hWGTENMnrYJ1bxnC8fuCpHBPdtkWaXFkaWmnHKs9zwjy
         KzgGhz00iSSBI64NVMoIp9UCJVGWa9a0/Uu4hGKrog1ICFx6k0gSMAezkFMcsjr69bef
         PeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715264237; x=1715869037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR9G2+1CHGEwlck4+knT3SclL6xiZ0MN+KWBAeb4SgE=;
        b=cqTFLWO0rlEX9t/4Fy0oV1/vq68ZEoN1+Y6iywVVuBQEhxjzfYEmUJaDCP59jrMNjY
         XpareseArvlfvHNTyq/VNbcxan1BhjbL4kRs28VPE4b8b0hrGXQddqxQzFuidNlkqkwT
         MF4YWo+OxvX7I4qEMK7D4k/FDpRMCidPxP5pFPpWhcigZXBJIUTnDzL1xFsZ12wKZevg
         rdby4hX9U/aVlTjtBnyTL2NF1Ou0mT46L9ynL1nnKBoUAXt8JNbvDSJFXTKTLzbL5Y2l
         M0+LXVgXnq1FOLSaHpx/oOarLN2tu4IMNWSKfuqu61EK0jQbapruFEz3L3UVxbtgPxPG
         8/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUxEFYoJ7c1ZeSyd2He7rAYwB8wIOFLjFsSCXW4ZHBvGvMwJq11bOU/UMbykQG72iexmPt+o2lt4JAADJrMijx3RqOv
X-Gm-Message-State: AOJu0YwbR4X3U4k47SB0VNL5QqwSu2HGj9wVuDS8dG6TEnS8oag1cLJZ
	TpJg/f0kuxmTSI52jEskGgAyf/kEEqSWhXoi6xV8vYQBrCiwAfdI3PYjN1nSBfXaJQXN08a2T/B
	8XD6dh8p1ZN7sLU1npT1r2ntz7MZCyChXaeA=
X-Google-Smtp-Source: AGHT+IH1luO5MtWwUlZS3dA3xdyuezrAkR1FJS33ZArvaOKKJhaSuwDOzRbI/SpjZ8kqdgtXsFKIWLpcdaeOImhaLSk=
X-Received: by 2002:a2e:2416:0:b0:2de:8697:e08b with SMTP id
 38308e7fff4ca-2e447084518mr49281291fa.26.1715264236601; Thu, 09 May 2024
 07:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com> <1715231698-451-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1715231698-451-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 May 2024 17:17:04 +0300
Message-ID: <CAEnQRZAAuA2Xq-Pj3uuGAgtwz4CQh0ZNJm34Mb0mrgMcsjPiWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Initialize audio PLLs from
 audiomix subsystem
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:36=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Initialize audio PLL1 as the parent clock for 8kHz series rates,
> audio PLL2 as the parent clock for 11kHz series rates. that PLL1
> and PLL2 can together support full range of audio sample rates.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
