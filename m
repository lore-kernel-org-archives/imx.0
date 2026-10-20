Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462259;
	b=JyxWB+0iPx0z7USV19DObkv2Ajbg16W72hTo8g6cy3yMpz1FCDBDROm7cV9Q5T1pX2br
	 PdNbEe1Hbjg0mnGuGo6eiGG/uhrrkpjDH2x1NIvPqfvqtHAKPBY+X0gz1oHZKXkw3jzb6
	 fq5qg/QGm9wS/9MDEqrfaQRTx45q+CTFHamvHs5dGyUsAQ67Y6FPnk/4EjzZBgVQBOa6R
	 1Lu8SZ6zTMbVI6/WNlE9IrxL3HRyrwkH8hLG0ay5jIlADYbdyRXp0K6lVeszMt95BGtab
	 y3puw9WYgbbcpD1/b8hdzAVRRYQ43V8zidltlumLiKBKMFwGQyGjynOGt38jsZRr8Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
	b=uoYIx1EUmfgZm9m3O5yhZIkqFFlhWFPmly6qYvHsFPyG1RTq6fz9LLxQvNzXD9HdYxTj
	 pLeJS4QEtQmISzlIaoCIQatD+nUZuQ8qv+R9WRKqlmR+glQ/L+dsKOuKhKiAqhhKL1CFP
	 +jlmpCZwopeSFhmL7QAPIjlaUBrSBZrYyEFn8VeY5IjTm0cpwjSqX8pRivuvdZlKODxTc
	 FRgG/UT0bkkQFNk+anltW2QeDxCyXLNEi0fKz1Lu/fkb0DLdf3ig28VF7EzlTgrQtedNq
	 Ej8R0OKJnUmhJOTEselPSSkJAzFktPB5E2O/itGkGupEMDhYXucdAH6T2I033XfsUgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daUiAR3A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B6D606A31A
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daUiAR3A
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso14228635ad.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 19:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462257; cv=none;
        d=google.com; s=arc-20260327;
        b=cP9D6zQQwiK3picnSVwmN+fUi9IJ50swstGWg1Sh6EypHkyy3Zw2rnkNY9I9e3tINV
         BNp7enhGm9FztwyhVnWUbmQtjbf1pG/qSEKj+v3MDSVLR2hsTQNlA4EamonId0IlAXX+
         AtbPGDVyHRS76VE4Lls5CLRjEf6ICoTseblBIAfSDbu1Y29AEVm06wbq+NJgrRwCfyrn
         rfe576JAzH9PW5GYy6A4rpZDDC6SabOmxJpA6kQpqwZ4DgI0FW/apEn20JqZ3L17oMlv
         olVuoGsgILX8gNi1lOENNWAhxXfsSSw7HmV9tjiOyqu2muu2EtYYqQHXve7PU0gwVK4R
         MygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        fh=q/IMQ6rzYalxvFU4xDzXVHn3zRNdc3oqhdt0N8xGTNs=;
        b=kfbFHcGK/uuFkFXr9JtxauSeWmzhDMehZA7+10qjODvGTWyatZcMZzhEuwSBtv/ZxW
         PyPBvnlnpy8qRJi8cbs26oOJhGGFFEjrM4tbseGAD19R+7s+tAwLZW5yCX+6cudn5xKo
         w/qg/QSTORv2Hvk2yAbu1nOtBlxyzmTdZxOgRWne63dgJrIKm8MwCcNV0tuBFWJC2qwy
         XgGVkNcTbZeKWcDMgod1Aq1TB7oMJzL5+5XmRy2K9aKmwvDhrDDWQMLfdLW2MN+6tAHK
         5lnnL2qvkOHydQ5OqGuTRZhtBgYM9dN2smbXq1L9Me2cbY1R6a3LZ4IivZSBcbjsWY1R
         kGRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462257; x=1793067057; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=daUiAR3AJtzlL/FLTBJziXrDwr3Qz4e+1czgXhxGWdith+mpfWh2ViaI3kqYa2aDPP
         kB4s7JBn0+jBX8HJJC1hyj9dqM1mTLQep//PmoD4gI0b7Rsy6ZrZCUty3GfZ/EBtqfBW
         +Kws7RA/3laWZlayD54MSv327HfZ0rPxhgl5sgLC0QiipS4d4UXt+rnddt+RQlHHLQ3K
         p+DO5mGP/vVQPYkiyEglHi0axYIo1H0E3pRR2LjsNMwkgT4ExHIiEngAKVmeWS6f1Mc1
         0wrxDKtRUHTJuF6uAvNAxWd/Cn7nnfM6qWH+WtgYYJD5MAlBfWbFII1EBqBznl/sXkmI
         mESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462257; x=1793067057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=kcNjp9RW2kk8akmEGnDH5D5dBRT9UZAvGYQQIXtEJmk2JS3XiCtoBbkDZyl8y2EtyA
         iWNrUlcLbs8lYGXkpOtNl1n6kelu/I+GVk+cmHyNoh1RUEjhDHs7a2L3T4RRiUWV+W2i
         niPaHcB030zvqaWVQg1WGqKIxkSq3kwz6fEnZV0PfMLQAJ2VChAwNM6qt6P83+NFKFqb
         WGnTAFh5gpWSKR/2W8iTylrbfxB4B8OZyUp8V9BufqIGruf6LRLdXKoUiHzSG95DaL9S
         Sedxmbvn4C+Lk2cb3tNvkaICgRM+ByRAyxrUny40z1+72p+WzOEZZZjfOTxR1sTb9bqF
         8usg==
X-Forwarded-Encrypted: i=1; AKwUvBxpWVrYOP+kPCz0uVyIUAEHfCV1D77vR0qOO5WNceGmjuNXB36S89T64lkZ4FUHHWj/bec=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0/T+iRpG+59Ki/OEgQeI9DS/SHvf5SjyLJ7UEedczy04Y1oQs
	vgFak7mS3xDmAR5GV8/oETNr2jqLF2ll8GACsJqCUtGtyepbp9D9AH9VNm2lOZ3USud1dlaO7YO
	+Bf8bekvJf4/eU4HjY++p472JpQ9Lh9E=
X-Gm-Gg: AYBFou13J2dIZZGTBNEwffRJiWBrZVVejT6m+i45YUJWEv1zkDgR2eW705dHoijKwWj
	2cWHnZSFWxtXfWv5dQyChHqvSfQNjKUZNDV2PxFqbo+TfYk6bof2P2NY0SEDdOhMxamHvC7s1pA
	JiaXkTr+315cUQ9lgndwSD1KnIoSb1LSHl/vKMq/BynMmOYrVOBW+CWhr1r3KUov47QdV91EpY4
	ELBU1LqPRaZXvNF19oKI/5BzLEZBxQ/C1veUXou5+hHzF9fVKN2YqwWN9Ne98Qr/RAB47dUYTq3
	gPAkKdRnUegyqCkyv4LFS+oPC0Hpl9WNICUxaUGcSnMJfUmWyZOad5vLAVtvVtI9bLERCelcpfA
	razf9zfDO/XAzUhr9sIoqBp5+IwjFNjqxDqFMor9llCpzy174L/6A7LEV4tgcCTH+oDI=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id
 d9443c01a7336-2e9a6e5296emr76192995ad.61.1792462257434; Mon, 19 Oct 2026
 19:10:57 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com> <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
In-Reply-To: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 20 Oct 2026 09:10:45 +0700
X-Gm-Features: AclHuK-OxoOqEZe9QHO9PQT5BaN1GB4IUM0kwzQZDjYp5iThqBCJWYOaobvziFs
Message-ID: <CAABR9nGOmx6zvost-Y9Zd2nzQa+ZMYxt2PtZ8xYPLZqZVGHegg@mail.gmail.com>
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,


> > In DMA mode, the generic dmaengine PCM component already applies
> > the integer PERIODS constraint in snd_dmaengine_pcm_open().
> >
> > Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> > the redundant component .open callback.
> >
> > Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>
>
> FTR:
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>

Thanks for reviewing and testing!

Best regards,
Phuc
