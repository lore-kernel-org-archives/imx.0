Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604F318872F
	for <imx@lists.linux.dev>; Fri, 27 Sep 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441986; cv=none; b=dMB/VZes1SkFJr0fTGvCNUKHuBUeE/s5R9UrBWgl53NHhpAkYkKWIDgupFTzIZ11GNQEJ0GNiY2fwJ8qk/AJpimJTQlye0jUHzEXmUMXcTfVeUJQsSDACAUFytBRXRNF0VVLCSIytt7H29PcbeF7LDkpFyj8sEE1VcOV6F48488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441986; c=relaxed/simple;
	bh=1xzPtrP9WWBtWHwKXCw5RV2T+tvRkxZEb51Bi1KojTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwSLXoDFrnwvGeSyZnDHoNejmjd9UOfBxHXmvI1axCFOCLPEnN2qYMT0/6Ww64R2JSJk4RYxoTDmVv7YpYo7AgASKHOUvmhkQQi4h6PrGDkiK3RL32DDa/SV/HROogSzGZ4+H2vnA2jW3FxbmIL71KpCRLPHuZojexIai0PvY98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEqSuzHg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEqSuzHg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e0d9b70455so222477a91.3
        for <imx@lists.linux.dev>; Fri, 27 Sep 2024 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727441984; x=1728046784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=cEqSuzHg7Jizd1jeh1ywv7hiWppA/YSD4cDXdon8RGF6HfGqAWuo9Mie1VoxIqyuvJ
         /lQBMkVDnE1b1X9iMaykKG3GJeEiD0CHozLf8XL9qsiG5nLeXKJm5cc9mH9I4il5UWth
         OxS6lQXi+7hAIIL+UsJvXPOUnZdycsw6FqBkLrEXGzMdoatC/P54ZddYHcJg2/8Yxobr
         Fhn5ZXVvl+Wss7SEH64pzQvWPfmbJiQJJU5/45jsP/yRkVelXnRumKCOQPVua9HnP2Qk
         K/Yf6XJCTIwMow/O4ZyBnvmFerFzvWMHYfveZhsif5yyk5kP5+NpIVtqVxZaoHidsrL4
         CkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441984; x=1728046784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=ZnEcej9RG0QUmK7Iy2cdxuePIf/Kci2sRfKbEW5W2A2cGv4btARvmuS63HfTMS2z5I
         zKlpTj1F2BtVPwo7jKSMen6jnnB96h8bsB8aECk1RvGIPVevIGzNuaFTV4/JmEmoax95
         WqO0drfSELRWzfD5tcKLGcmB3PNu9g3eolgxUSZl94id0CXu7t5/1jZKNksuWgpA9zqQ
         7UEIgNpkVG/IvmWRa6XiOYJcqOp7Qcbvtmxod5WncKs+5o7bKNMErbmjmDeXGSNXHGq8
         +RaSH6PDjfDii0uuet0TJYObx1DeS3pUwWGX1BCQfmrjQ0u+qeOlsRtIegUJ8SsaxJ84
         X6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUI9df4sD1pArwOKopZFwIiXz/p/Aif2yPTt6g9mugfLHRJscTQ4CbIyvHoOkI7fPYiYnk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAnfwqrDEgCDyRNWCQr0lyHjNqpBome9bkDg79hpf75tAnJNMe
	FRoMLGAKJEsWRN8C+SAiQCI32zD7Af10b3hNrUvr85YPstAb+EWxg4eTDzv8BRr1Tll1XsaZnSq
	ZqRiPFq3j106dmEI/UnKrV6XgE2Q=
X-Google-Smtp-Source: AGHT+IHCtWkk/m0gIJI4HjMGIxf6HDCRDpOESUdGt/5A/Krn13z9jK+YnLyf6mEmoZB4cokgO5ouczhwAV6HyE5bjfY=
X-Received: by 2002:a17:90b:1896:b0:2de:ec70:837 with SMTP id
 98e67ed59e1d1-2e0b876f84bmr4254037a91.1.1727441983559; Fri, 27 Sep 2024
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <750d6ac7911aef9a461dca6d07e5c1fab6211ecb.1727438777.git.geert+renesas@glider.be>
 <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
In-Reply-To: <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:59:32 -0500
Message-ID: <CAHCN7xKKs9mUvnqZaLE2gCsDau4QtZ706LLoYcS_47-U86-nfA@mail.gmail.com>
Subject: Re: [PATCH treewide 05/11] arm64: dts: renesas: beacon-renesom:
 Switch to mic-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 7:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "mic-det-gpio" property by "mic-det-gpios" in
> > Audio Graph Card device nodes.

Thanks!

> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Adam Ford <aford173@gmail.com>

>
> Best regards,
> Krzysztof
>
