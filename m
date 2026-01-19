Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E13385B5
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811053; cv=none; b=Zl+hVSRS0juQ5MEjeW9nU9/rLLWio7ZeMQNDZUoH/zwZ4eLXfDdYC+8fQ1b26P2jIwDlqU5UCxvMvVKkRWf/1/FQ+6H1Z2uz1EOeqNpB+9VSWaCEOKQ2IWDoT6dlQ6X4+IR2nEH8Wlc1uEZgUZWoseXbAIlXDO5JKfnVN/t9UaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811053; c=relaxed/simple;
	bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGzKxJxMrCgxzjZrcSdTuC6My6GHh5rA2za6sogpTw2u5MaiTA/bFxF2mTL2yu/HOa2PVrYNAGOPww4vDvUgC0y60DMpdL9NxOMoBoeZe7mQKPU7i9Zjbvci3zfOdKTCV8nz/ECHFtkINS8M2D2vGUnAmHqmqAIrDdjsnfoFINo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTWu+HbO; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTWu+HbO"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124566b6693so3984116c88.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 00:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811050; x=1769415850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=DTWu+HbOZ9uVy6IjCkIlYC32MofIzRnxjEQgZRDTgFkBte+bY5uSHs7SV7h0ppMZR7
         1TSosgFjoEOUXDhBA0e/dO8IkAa5IHdHJqByJ34NnLVHKIeG0xY95Q7wzhCQkYGGG5Jh
         Sq6oJJ/3t9LDllPluxEjgfqakELicStFAjeINqAkuqa2JdkFz17l8MolwmkfLlJErVfg
         26804OFo54zf3IzTspxB+xMBCefZjRJSrhv9KuTUiOBx9Udo+bbfrAh2fGwgRhp1Q73s
         HiPH7s9MFaVa6RFL2Yv4MY9xyowNDxvC6KcvD/BPpEszIlRCs0DIe+a8rQ2MdoE98qFe
         MODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811050; x=1769415850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=BsIdma6BNBKLQwMQX1u5JGh6VTwV7Jb6d4R7AELsrQVvCOqU8P2EGfiv0ox0hW7/Vu
         TDk/ll9/6BnG0dIJNPLfIyX6Vse5rAISU2ByK7mQbFJtnCM+ttftoVkiZwIIunXPB59g
         tbbg+u/s2FLV4kK+XyZ+C+ZOuTxTElPb28U+qRS41P5adhZeW7D48uf/R+/7eQeUHCF3
         lpETW1LgrEF4bkN64WPVzCpkiKmow0mjHrgkHSY3/STnfHXxyHnMm+YDa67HBC1+geXG
         CIwghloWFie6RS64BWFCXLJCnwLJT4qt3ohi5BZtKjjFAzh8A21wNvSnRjW8LcMufRCb
         ypfw==
X-Forwarded-Encrypted: i=1; AJvYcCUdW83yLLV7jEC7jFZeitbEMObsRfNYwz8KI9mFmaa3+KaOnbfDInYLh+PhM4T7b9uiGzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/pldKOjka7Yvw5Ve9K+wuQsQqSOBOarUg49ii3auAOVj5EjaJ
	V1d1UGYKcP3XG2v95RBw5MthEb12Vr5k4mCtoixcTmWAKA6tq0zyp3GqUdmYwp4QVhc+Q7LEIxQ
	fs18tJ67HVV7n4UqTqjo/gW+e7u79pCQ=
X-Gm-Gg: AY/fxX77g3dDbNr8xGJzyaDR9wX6UF6jyYTDb05hfIcfFqrUsHhbcJO1pRenxN9TEe1
	RWdfBK0Bnvwi/ehzsE0PuPfhVimh0oXlA0RoYHRWOT/NTBKBa1CMs3Cyx8wwq3g6zTnZktHelU/
	qG5BJuI6hpiX524xEHdYfKvqJg4oS012XjDUfdW231oRcrpvkh24WvGpV8Skk/fjUikZ5zV4Bli
	xRfixuanEeEPXXZaKr434YfhC6wW3Kxf+jzPEIufh3clC9OqJm/8h9RRZEboglhhPHWh2vUHPIS
	iHvLfp2GB/b6guODhpCzEjMB/TAvgnsvFa0iIenxJmV2M1uMrSMCx0DfipCE9w7SbyPuNFKdF0Z
	i8ZvFAjJRzA==
X-Received: by 2002:a05:7022:a86:b0:11b:ceee:b78a with SMTP id
 a92af1059eb24-1244b33639emr7887537c88.19.1768811050417; Mon, 19 Jan 2026
 00:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com> <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 10:26:51 +0200
X-Gm-Features: AZwV_Qig-56UXGLfTyKon8QrH5w4OVjRr-qKTuvAKDTHLoGx-DgPQcPPQmb017c
Message-ID: <CAEnQRZCaAp-nUEd8NnQmT7MU-Kx=usV1OSx8xtiQB3aWUFzYAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
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

On Mon, Jan 19, 2026 at 8:42=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.co=
m> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Export clocksource_mmio_init() and clocksource_mmio_readl_up()
> to support building clocksource driver as module,
> such as timer-mediatek.c.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>

Hi Zhipeng,

Please add your Signed-off-by tag (even if you just pulled this patch
from another tree)
This comment applies to all patches in the series.
