Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699E3559C0
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817694; cv=none; b=qDOA3PvQgvNMTL/QdaYE0EvXTXgocI8SmeyRQIFiTUYS503686HPLePdQvI7dtEf/3O1Z0OjRWtwq/2LOad4ZVUTppBTwQXyFtUZLUoRCxYg6Boz7EidHmclcrD347FbEwJ9w7ecG3ZUCxw1uVkq6sKPe/lbI6bbdmAgiC3TAu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817694; c=relaxed/simple;
	bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5mCgeDdv9TmW2KLBDnpvYkRGS8n0tMTEZ60PE9wPeQHmsWJEL5HQA8WdsKcZAD7oDx+lqAXs4vn32zCfyqbrl05mbmFDHw/vMLBK/VaxxOOWjX8AvoEhi50cpf5NB1qIIPrCZ46b3PRflGYsaB29m1ocRRcRX4qn3wTLG/ebR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq0kNjq/; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq0kNjq/"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12336c0a8b6so8892278c88.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817692; x=1769422492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=Oq0kNjq/kjEZvecc/rBcer3RXDGxYd5zRTDiMUMhUWZFpKsmMMaj6UmnjPWURJ3jNX
         L6ez67hOTLptnOXDAm2fHwrNXKJZGik5YDnH6fL9R0iFcKBuCvSNjNA65rG60FZk/Ntl
         vkgm4Sk6Q66ZNqNB0f8ilBDhnaq/0SviBJ7l/rW1eDjtAyXezzN9+N+Efq41jYwW6fBP
         bjl0wz5JFTrKdKI8VgRu846xlfQS16G0o/C1+Hs32ugRlm7KUJH4Nqp4Z4CmWWAgg0Wm
         q0RFSsh1j7r9AkV0G40SE6V09G7rjRfixtu9tjP5CbYYCpuwFoyRv+Rftqb4PuRL7vaE
         flmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817692; x=1769422492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=DYffGkvYovcZYHq+mbxbyX6byh6UMsXgCb6aUKWHvq1w3L7VuHWoL68kd5eEhe7Mwq
         GOBcvQjTGis7qLumPr4EWtdrp4oF+iUEpPfykFobU7w6UD99FplciqeVvH88aFLNP3Xk
         f0OcHv8iw6AydoPWd/2pT+CFzW2h8YzY8j884eFiuFU4DeAMys05r9ws4hRj7yLqUo9/
         Sm6vGnIUwj0VVmBLEm7QroQbyiRawY+u6w1n3Q015Jz+giGGB60Ui1xtgtBM/YrbMte7
         DOigRsSrc84kBHOniP4Fef04j5cZWAp9VhXfJai1/BYZwX3oWEjW8Uh1CmePZixe03GI
         1Qfw==
X-Forwarded-Encrypted: i=1; AJvYcCWTUFqCKOxOOj5LC8Cltieq4KRU456Ijt8iehH3t/WfHt/Tsjv5Bcj6ihrV845xnhpkemo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwREhKaD31k/ma2wsFgTbheaQWEYAAKe5AKD/DfigT36vF64ExD
	WaAri74kiJDSOH/4JCA9y05OfHGCe8gkDPcMq0J0bO7F0WxuxyA9Amol4Ih7Y+uWOQcmAWh4v12
	1RvdULNr89EXfOqVJX9YgSM+QXgWtYFI=
X-Gm-Gg: AY/fxX5kMeeL0i29decLW2MRMsKBsbSVJJ8VaXb4+L2i8PBsPOrEhxzk2YyzVbnJayX
	dWLq8o9+MehQBzGEQCnatKi8qtQC69z8IV8/ZcUrk34Mu8HnwSeRNtLOxVpPa4mMWKNE2w3HSEj
	8HaLRAoTcjzzo/x6PYq2pbRmgUGJNJOjFlz+rowJJ2hEQhtsFDNTcEuOEPGFv4DNnnXFwC7yqRZ
	a0qO+Z9eeA8V0MSTkSxbhDI8iUq7W8IthTwuj9TfrDlM3Q3+G5Czngi26/FIJZn8wuLsXi9VKrF
	YYvQXVuOrMwTuGyqWCJj4STEQJ/tDfx7vIqppr5HCyfQPDIYe7fA1v3pnoAPiOo7Rf9deg8kGXH
	p7RiSY+8zxQ==
X-Received: by 2002:a05:7022:48f:b0:11b:9386:a3cb with SMTP id
 a92af1059eb24-1244a77e0a4mr10011720c88.44.1768817692373; Mon, 19 Jan 2026
 02:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:17:31 +0200
X-Gm-Features: AZwV_QhxRo6F5HrkZuvbzdlVN1eKqrMGyjLqsb6FzOBXX-W-zaQ2c6zE6aIsaxU
Message-ID: <CAEnQRZAtLYG=ddDSfF3LMOtpGWYAU4Y=UJKAyi7NH-sZyLubMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
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

On Mon, Jan 19, 2026 at 11:59=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
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
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
