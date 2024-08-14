Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF61A00F3
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652868; cv=none; b=NVcN7vcL+dPuO8kNQdzZaTgng7606CpZ91KF1dPCv2us0SmS0ebVHdI8KaXr7Zu8SJ8bCA0yJ+udUX47gBH6IcjTDf1q0zdmV1kh8rmZuoNeocxsLCKDjj/8AYwDDIElgNByBUShqdX453UfVBx+UqhzO+w3GMTVIF03pSd1P3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652868; c=relaxed/simple;
	bh=SCHhtiuOOre5UIbLOojVF8ki6EgWNqtLzrYpLiUUYa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiaG4cxMyoarEbLfH0HFegObEaHYkLqdZyJIQspyGNnL/TYKJpY2UTpNW0kiYeYxPvATI0ymZIiWWfzk6mcypE0UAwrzvWRmpIbd/qfjADueFwgX4rN9rfY40JGAErmLF8xdQUCjbv9j33Gdsb6gYmU4EAf6J+3mM5KTVMdSpo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddWk4w56; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddWk4w56"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f008b40d7so1357e87.2
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723652864; x=1724257664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MPQ1QUqseOgwKYNiAImYbxJzlGOMm4xDJh/aLy/Nw8=;
        b=ddWk4w56vgUM/3aB8eEay/i3qaR5zKyyHGwvYKO95w+Y29bsEGYRZL3gR2DV0Devnr
         fzF0+O5HnBJBJWZawKCgCGFuf7wvxL3ICF52M83FuKCrEIsM9exQD9p9UI6+qL46ZlbG
         pSKGNtw3AQou43OaNGrkYoKHVJwOGDAhq3k8a1F7KhXdoAutLD6XKJCvlfjxxpTPSKHX
         sfpIBTxR9CA0ufEjAazJ6bvlWHlA8XWaAurgeZJ+9+PZ2Tf6nYkZ3oa0moRcGtNU/s+j
         oDn6sgZJlnFIT7Yb06h3Xl5sGkYheLWjENHDhr37WfvIOz5L9TjR9mcnJSEF5Us9uG+h
         oAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652864; x=1724257664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MPQ1QUqseOgwKYNiAImYbxJzlGOMm4xDJh/aLy/Nw8=;
        b=J3n1YdKD1TZeXqXGxgx8w3ctq43BDF0lHbR2FDyeQD6RFRLp0cf6WzW4+YRo4n4euw
         vw5tlR+KLIN7PH1r2nL5gfq33zvNEjA0GUQ5B4L1Z8S4glHxv1v3Gxq0tVof7v1XLOHR
         XiPrlD8m7itGFPH50FYfWqq6KHqhhs01vUda6rJ9rUXGmm+sdbv7knhTuCPgd8GaLoOn
         Q0HhkmiTgbAfojiEGKz1BtVGRtXMhjl0fLRgrDU3JsBs00kcRxn/VRbICmmhIJ7yZLGp
         ksxMxrFNLYsG1Uk2I8eLHH8Joz0Hli3zON/Qo4gkvAwZ+9i/kwAhwtvaFDw5AtFYMG6/
         CRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyEw9d2eO1rvU5PlS8a8u+tat6RhP9cFUFjNqhkVF17xHxacza8xIZthhhaKfuwA8dns8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYw/iWfn3UA8r9LkLCjfO9O6qufFheUPUFm3YTkA/iYIqovG3E
	fiHWpKnLMmEDWbQSLobKw/Cbj0kdw2Jt5ulnizJsypmw8QzDfOZu/gj7ssqKOpOBpBGCNEAqX3C
	5SKfS5J3/DVhy4fr/4jXdpnxf1yk=
X-Google-Smtp-Source: AGHT+IE8T795cCVhLDVAkkR6XeRgBNw44XWGGSMe78NC8Z2bOheuicfqH7HWm4YY3z4o9PP9bb4zlgA2+xLen5QhdKU=
X-Received: by 2002:a05:6512:3f0f:b0:52e:f99e:5dd3 with SMTP id
 2adb3069b0e04-532edbd08edmr1178690e87.8.1723652864100; Wed, 14 Aug 2024
 09:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org> <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
 <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net> <ZrzPNmXLsqxjzM+J@lizhi-Precision-Tower-5810>
In-Reply-To: <ZrzPNmXLsqxjzM+J@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Aug 2024 13:27:32 -0300
Message-ID: <CAOMZO5DOUbhKHOfX0z+hV0KtCsqN0ta=S1U64QXKNSExHbM_Kw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Frank Li <Frank.li@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 12:37=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> After Alexander Stein point out, check spec, and dump watch dog reset val=
ue
> at ls1043a platform.
>
> 0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0
>
> It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian(=
)
> to handle endian.
>
> So this change is corret.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Shouldn't 'big-endian: true' be conditionally enabled only for the
Layerscape platforms?
