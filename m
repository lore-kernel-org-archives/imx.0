Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68D2D12F5
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818931; cv=none; b=mJrZffxf2mS/B4WJxPU+BBIZK5ysS/6uSGmaACO3UjxvYATy3QAF/jKxhxK6YPqK/OFl+cxQnPIPhtKgBiG077olMXDWiNnCopukGuFeNHxtHL8CUBbtNYYBpXEElTIXYmY/F6dIxfWpXRpXaATG6BssZslyvECWRIcuIS6wt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818931; c=relaxed/simple;
	bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1+trmoUnSGtsIr1KRflH+YhPRwrGb2hj2rU6c/XMxb6wngP9Cm5pYVPOyGR4HFQvcJc28nLKdA1DARaK/bHrZiRP0RDVpEnuZBFnbugKLHh9r1bwM1XH+wKDhgYtGL9Td9QgFod0WwGSFYO/icIaIEyH1dA9IG3n4sKz5cqZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCp5LAWc; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCp5LAWc"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12336f33098so2958961c88.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818929; x=1769423729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=bCp5LAWcNKv3A+d7uaU0xa6NkhNj8hpxQu9OTcFPHmhhZAwPs/CLbPujxbbBIZ2Sa8
         8bnqoAjqW+MB5HhYRgGJQuQy4oXhGB148by8kS9l4p+5ONpQ7hrAOdJPA7sjguBbSFpf
         5lAttxfu/3E4oCIrbINeubhJi9aRY388nQ9aW4R8D0tL46huinrBRmVVZDWx8SLAsA6L
         ov7K3gYopK19/iP2TfB54wZME59WTxxGrzxWe8/qJpEAH9udHq8HlDER+EpaamFfJ9LU
         RJR3uZWiOISwBIP589y/3gAoWwDcsI5I7vXbtZX2jKswjpm5U16frQt1GKcmH+EmWpEb
         /6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818929; x=1769423729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=SNyIEv97m+VOd638TCt81Td8/vvqzrqqVwk+K5HWt29O8q+D7sWq8NtAHIrFcY6v2O
         HVO4E3lqKOiBEMgKzXA8zNZ1gZhNo/mA+imyrR9jBImoxFyS/h3g7uVP1BWzPWdTZyFf
         S4KVmzhQGmnT0skj9rQ3LP1QrSxvia42XSmapi88JlG/jLY6T6M1MQiSxmM4uTdHFMGY
         VNwQtKAQXoETx8Nvhn+7bP6fyVvvUxSAWXc5hYHIbDsFQSH/g/vgqdURnte9Ozk61RrV
         hSFA+H6GkSSGE9btac25muYpAplCRZ/FqGydQaDPQX4xGmS+4yH3GGlD4346VbComWtq
         zRpg==
X-Forwarded-Encrypted: i=1; AJvYcCVtWPQAPBRZF75b62VcL0+3ReUdV4tbjOBh2o0l5P0+SnnOiq5CMx1g7vkqTKfH2Razr5Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3B+A0s0VsFQKTinwKzCvcJOP63jPJjkpaYjYQKfBEB7RhQhlB
	BD3lTW/mp9HPvx70dNPz7gpUGhQlRLa7yFTgmdITYslzGWHQLlUnvZRXpNNROK9AT3JybBceMw6
	YfJK0WWKrTSEHCpu8R705xqS5w6Ebets=
X-Gm-Gg: AY/fxX6SDTKowHK9XFT9b/LSSHDRx0Dlb5vbdnpWGQJI5f3qh5LRNXcHdhICgroTylK
	w7e9A+hTySORjnCveRKSAuFbJxUrebH3MZDun8bBQdR5Msp12ZJ6qVSpEIbKvC0C8PWuRk4OKgi
	1zl9QHuH8k7yWTWg45EH5SrkGWgIiRMSjJA17yTonwUrLxk0Ycj3djDI6D0YS9fwhBjElbVnXrU
	/XIrPWfiT8bChf/mLe4yy/I7aNgpu6I/Ki9Tqj8ZgEjnHRZA0pYWGpjipePuhrR2x2BYBZmZciV
	mH7wJWJVMXjAFeyRNTPv7LDCYdnv8B8IxkqmHghR7NZ9RWntGSqaGcKSWVzINu6XK0n+F/RSfHz
	J0hQhQj0biw==
X-Received: by 2002:a05:7022:3c12:b0:11b:95fe:beed with SMTP id
 a92af1059eb24-1244b36f52dmr5548679c88.38.1768818929182; Mon, 19 Jan 2026
 02:35:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:38:09 +0200
X-Gm-Features: AZwV_Qgr_591rcHqBwOlaouog8Vh6-BcA6ABe_pXfwA_9p9X95EWt1kL0IH2W8c
Message-ID: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 11:56=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Change defconfig as tristate type and add platform driver
> to support building it as a module.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

So you can now select the driver Y/M/n even if no COMPILE_TEST present.

I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow=
,
this change looks good.
