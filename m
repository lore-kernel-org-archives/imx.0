Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962843FD18
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291964; cv=pass; b=gYZdnmMe3ieGmO//0U8+hkJQeuWSxV29/zH5/BNGvIaVHeUsK/CC324braqHTt+W2fpqbBS1VXzDrxhpXfpqsXrlr+OuieNiiivEYPuXuW11aMV4KBRJnE3pj6HT2gn72EcV6DVqLhIgT8si2NgL8VbpLdKqh+0WHvB+jLzq0FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291964; c=relaxed/simple;
	bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzNq82B8vyIgxtmuT0cp2bRD/BY1GR3/8OHoQjLNmVl7H3cG21h6IoUPR9Lh8XQ9Kl+PogGAgxZuHjcrlhGRvnZXXPENnN/tcoHjiViacGCDY3421PJIT8q5Km3FYeoBxBezg2SczqRcA9iG0Cwwum7P8P4VxJEAxrfiYt50Cjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vL4Pw1yZ; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vL4Pw1yZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso12005e9.0
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 12:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291959; cv=none;
        d=google.com; s=arc-20260327;
        b=hFImGo9daROSCW3otbRS3YY87Nw1plt9dZ808lLEucbkjOGE9W2Lv4h3xSfFMW3V/m
         S/r2eszwu55TFcvKLIoxM4T3groLgoQp2CdrC2YXlNwtd1ODUs8bmmnLvFNW87QXl0YS
         IKOSUfjyvDIpOwfzKyt5Xfy6DiBtRFj6xiKkoecQEYGXpw+ysddSm7rO2HE3lHKSSahF
         3eZMha427ruT7FgvXCpL8szhbMNJdGjLASHeqEy3nYZrqCTgwOb8GnzkQGEZhB7wBUzK
         U/o1BUfGAuZ8THcVs9iprnJY4JKeuNsoD9TuFfr1oMcpL8L9CSORmJl1thZ7SbCKY//q
         VTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        fh=QWOVjFpjJm2bG3GMK6xzW5Pr/MrCUgsmS5ozW8UOEh4=;
        b=RO+1B6ju1xY4FUHiDTkYVv4ZlSiaITXU7u9OE6TpvPs35VF5XDEVI9vw9wgV8Alwbm
         Cw9k0R0t4oni9078OVRvB7+BZtlj+gmwGiKHPflISK2XBh9hOfy6ogQx2hyMOaiytO11
         83LKY1aS1vY3D0PaNFgd0WI2p0AQOrIvXDYMas41rLXLZioH2krBKInu0MyhEN9x9jNS
         qnnCMMH1SkcHvD+yIDBfHmXX0uTnkPShl00Fq1pSx9xAwnlf8WXw1OXX3P2KQ6HrYWpL
         NAORqRuukbX+z51Ic/qxcFG087uTv9dVo6EIMZDZ4cGTv55vbTvUPf2YtS2G7Ha38MKN
         Pk1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291959; x=1788896759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=vL4Pw1yZ/YopHZXQmfFhFmnixkjDBtXNpMwv97HFtGuy3MHmswbT4tWt6TQRSfdm6w
         RkSgnAJuq2HyiZeXy8gHYzimRbMyOpAH/JdrleFSLKpany3c3Z4m2OmLIp7WNjjVgKDE
         AtWdJLUH6wz3qHNuEcflHuzwK+E4m47GUVkwhBq+bRuuGLlNSKWwXxFAlAfKBlr+rE56
         Bn8A06lTUntw7QKrFqDgIXf9t5wviAS94fqcqfHXHpPlH1WjHcfgOnaytH/QSBaFsGUe
         qq3f/NhQcxzVIr3+L7YD4gHqD0T7/Lx20v1mucGEnmgrOTP7MotmOMUQnVT1sQ1udXea
         RUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291959; x=1788896759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwRdv3H15Lg46ZE4qMWBFPfgUbPXiZ0nu+f7bpsc9EY=;
        b=mW18tK4L8Jl0zalVYvbTGkj15Pk0JqyirzKagq78hLs2jJ4etmP/JCgpmCiz2pU5sX
         ECm8tRdnrgBPqkAFVhmHfPpri4nLk2fuqD0SVt1xolRHDzMLDSbnMzRbRxdWxovgpzRp
         xtAiOWAhVis7FlZ8nLzTTbKkUAoyrou1Nyhu02omtM/xnFIC4JtCuxWIz0ApwPG8FJx6
         uqIUUZFKfckkFxxN4PhNYvNwylPDU8VQUibSI6qBQA3OVKotBsyo0Y4zAZspWnlxQmI5
         3VH+su+XN9E3mIRduGZLf4uu9909BGHSUkAXoe7uBwDp6HBgZQQcX40Jj/rTl6Y836He
         Vi3w==
X-Forwarded-Encrypted: i=1; AHgh+RptBUbTE/vB3IWiZbqbiufq791fL+/yUvHjBrhX9f8NKtEwgZknBwxIGPwxvnm3R/Q8Gbw=@lists.linux.dev
X-Gm-Message-State: AFuF++mY9/McdqJ5+4UPSUiKd0F1XtrOMxfm8+Ohs2dJxhFEG2A8iulP
	G5l0A+x3JKe++HbHo9YT/1fJGhE47mRuvqFJ/79BZpX+0l/T/axdm9xOUNiXbOFKE+ftvXV2THE
	E5+4X/02djV/SPsem6VtDAu3U+i5XVQbplC39ndSE
X-Gm-Gg: AR+sD12WSXyjqLyHtybOL4qxkOp2S8hTt0VtDMRik8alkjKBIM/nZc+jMVNAG8+gqmX
	XZPPBhVMwTLMZDPhffO39Lx7zzkod4E03ZqyJEDRGTXLUPB9EmlFQIDyeNqoIdR+jt0Lr4oBvYh
	zUn5gKcd3jTVmpMcgXN1SGv8BNM+g9K6sjJrcGr66/kJCP8Bo52ot+dhx2f5u5Uc60D+pjyrApP
	8D8TM55TI0uPz9V4NOzTip7/KD5JLa/ciUQ04cP/RjQt9oLfKwk3L3YIyr3fE19Dn/JE1PddMYk
	r57+nWe9HEty0ssEVvaj66lED7tFeVv0JC/gyoHg/FT7vh+VMDIifPyHtIdvJ8vmYy3mdiQ/SnW
	18na3YET7ibM=
X-Received: by 2002:a05:600c:6050:b0:495:7a0b:3b4a with SMTP id
 5b1f17b1804b1-49ce47dbac0mr115925e9.7.1788291958768; Tue, 01 Sep 2026
 12:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com> <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
In-Reply-To: <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:45:21 -0700
X-Gm-Features: AcwNN1Vx40LeKlkhxLn2rqkujAMnERf5APsKIrQ9ivuoQyg-T7s82dgNrM0lw9I
Message-ID: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> omap1 might suffer from the same bug: their suspend routines are also
> fncpy()'d into SRAM without a type hash and called indirectly. They're
> all ARM, so asm/linkage.h still seems like the right place for the
> macro.
>
> Do you think these need to be fixed as part of this patch, or as
> follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm not
> sure how to test the fixes for the others.

I think separate patches for the others should be fine.

Sami
