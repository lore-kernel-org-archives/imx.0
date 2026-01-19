Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022DF1A23B9
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817774; cv=pass; b=S873YvRVWQGbYFwbyK9cJdMHv1ZCzImxchkDIBul6pEke+OBog4ZSntHkVs5vZ02mvQK/iWfyiCf2PuGVR5zpWLjqYd9CEKCT8DI1bFqd8q4KnXi/i+WdE+1a2X7WCvNH0J+GBKKBfToMApXg7CNl3hrBnkoO0grbxmvaQD3ugI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817774; c=relaxed/simple;
	bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnYnOkR2dbkJy3LSEx98/kiZFQQ4cDgNowyB5g0XGA0zrcSZBE5DMxjcvQZ8lP4cXYGu6EwfeEx6narSxUbR4rmooCdDH/LXgmDf2wbI+neIaaV/LOz4FVMv6W9x2bGDMgS1lMNuzLtmogDQs8UHUILzhlYJSlcY3Z4R+8iCrAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwFUCdgU; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwFUCdgU"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121bf277922so5535596c88.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768817772; cv=none;
        d=google.com; s=arc-20240605;
        b=QMapGEkGOmRCDBhP2ewU9e/U2tWtFcuwsBipiCTt1vw0KLmZmOYjTCHRWtikCK/Ezg
         6DB3H6GEy4KnHeRFCidNwrR2y3xo+orHNCYh90sgexgCQrSbkTwW5bwfhUK5t+jJMlYL
         bb4U1XisCfUhGdyx2dyVFFkEs8ozYGZZgd1PRIHfsuVJTHtsb+Klt62hUqYTo/1/3X2I
         Sf7PpppRKurtDethf6DnH0JKNOcYAu3Ntlw4H7/GqFSs0AQ4895t33C81VP5J/kyip6X
         YWVvx2Qp/Tg2qnYcS+yS+vlYwgc6dRBfsQEb6NAahHRk3wsIh2WgzCobXfysZuvTu211
         CDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        fh=kspnKdVz+V3TFBpukd74icQ5gv64hYa2aLdGq7cF2LM=;
        b=M3NlPXkYgPQthE3i3npQNySKdp00TWOhrD5wjRqdLuAhtXUDEbMD7+aMglQfg5QtTf
         7/cbN39mzX8y896CSSg2ZY47CQRUuPbhaFX91On+HKLqHNl4DRxWaVhbwDSMhqqMaAnV
         Q8UwHDAeLOpOGADmXaCmbCQUgZX0Aj8sjG3ddffPfg79qPLu70P9SbfcTsC8q0sHZrMc
         UfAURofN02OkZFS6EkIM1nL3R4xks3x5M9eOtAkb6US3Zou+sqdJwNirLWmCY37NiSPK
         cGugSXNPFpmCCA8eUzjMTJhePvodRu+++s3VibxwHg2KpcX8sRKS4PSRkUQtYnOuziDe
         g72A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817772; x=1769422572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=QwFUCdgU/jaBCqn9rIDXu7f5e3vvWFCVJbPgervT25pJF0F65EZ7AKQ+BfhwLFH/pB
         Bnk8S9kusoDzdR9kpOnYn//zPG7+JE5NCUfkuUq2ilkjzAVgJxYtCWqZahtcEXofTJfq
         8dz1cZA6BuwUbm582ZcFhbVHOcl/6TjusNSSZCjtnNUdmQuHc85eU8QlhcW5K/5cMsl4
         Q+UC28YYVdNM/OOFEWfrr7IcXnqWYTKgmzNMXbtjIgMWb+21tzxOtTgsBmqQd+VwZRdX
         /FgmGu2nzYDmJHmMuhMVvBVaqjGE6NkKlRJP6oi4YVKOYCpfuoa0nGA4xPzvEl+5vTX5
         MwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817772; x=1769422572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjW2cdDM+NTx8Y+zHvjqMRHQapz9fGB+/aetJ7+p/UE=;
        b=u7VbHl/BY1ca4wkuiME3FEdthXQWiuFkJeegIvSntVB8unLQyrxOxRsumLZljYJDYy
         1ArHvVcfhplMQPxcdPVGlZoxgPI2614u4wFo4dJcIO96BKx7dyLGExHk8e1HBlAw7N2/
         2TNKdVIgRhFYFuh3rsshxduXMLgQ6ziseIjjC+tUFXzkaqpuOs3vj8Vb4CSemRme7Pgs
         tKo1ju7qnWTzkb7XiHxIe9+ci7VS1KjbtlR6rbynxXfHeNM0IVFEV8YYoqnqdFUa5C+E
         ETNfZ0UsQPJVTNNMj5f/Q+U7BDP/CYgUud3Op+JJsjNbHmPsZVB1O83onzE2HC1gmVJ/
         BmUA==
X-Forwarded-Encrypted: i=1; AJvYcCUoe8dFRbZol+4vMJAi5e2NoxlHDa5kE3HLcfmgzfFCuDZZ/PRMbB/9WoQEEWAmJeCmqUU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/yk4xEMxsIwxAUk9DNYSXwPC3Ga1gBrskCva5BwY/m//1ROYT
	zQYacz/92oXVfFMtS6cMCoP82ff3wWbUclK0cFeYJvcl6F2YpJmAm0XeqaPih0Pax4c/lT+WqZQ
	GTze6Tm5OWdiM+Mczk3gmTMpx2bdKfh8=
X-Gm-Gg: AY/fxX63lSpZB0ZLyCnw8XDBSjvvDF4+EhormAoXVOsWeH9vbYK/UgEof7HTLXGp88Y
	OkvlgifnNjXGNyXJxo8COwgdJOjbWBUB0r1wOnGOl5Z8y/xqiPwmQiMHBy8lu1oB1CKDYo2Njfc
	aUj14uAWKn3pxBBNygOVFLmqk781ERiIXd/Ct14+XbO4551P23uUeeG41SDcDmuOqX1k/3Yafzf
	s6K8cC4HNFjcAI66v7XftxRFAOo2AmEgFFyo1L07dazeFBrr+FSqJKbYX6tYtIOGI+UdpAFh22p
	tR0ZDCEsg16JiG03++BUzmIyijPBEZO+Zwjv9KyssQBC9FtdWHTj/FbsXdxmFYAWWJhkqxvISPY
	PLdwPYt877g==
X-Received: by 2002:a05:7022:4186:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1244b3050aamr8034972c88.9.1768817772025; Mon, 19 Jan 2026
 02:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:18:51 +0200
X-Gm-Features: AZwV_QixVtScRtb2C4OPOYIUU0C3OQvhdNUPWS99N4NE6jCxi1_9ifc9b22NkVs
Message-ID: <CAEnQRZCm+r3TgvnwsYTbiC6K4ODGK=rCCsi-LxXq=EMtMAndaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clocksource/drivers/timer-of: Remove __init markings
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

On Mon, Jan 19, 2026 at 12:00=E2=80=AFPM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Remove __init markings to allow timer drivers
> can be compiled as modules.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
