Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA96314B62
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773953660; cv=none; b=lCMMw0YravqVffL3+dny2AlKZQo/nznFCF9QQBhpNDbWr+f5C4D90dTrrO79oQcJDJWjJ6EXskSyWRoswHlrS88tMmwBlVmrJQweX2e/bYuXOpK6ij/yj96IFpV0+QQbiMfki+OcVyoUukAUp2fipxJEpsVkrWaLxYc1J8wwUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773953660; c=relaxed/simple;
	bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izH6avA0CkrLWazBnvz1zQAaXtyHg9yHP9WXJSA9Tyno8Y77E4FQdPm/rWgXNQ+JWBJxNgJstb1OFoc1+k3npo0kHRqqq+DbuAsV+ZvQ35fYVxCTMRDdxukAYqAgcQsk4mr9CPcE7mK7r67rGXjQKz0Ell1YvODcwtC0QyaI+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5Da/vfQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5Da/vfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773953658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
	b=i5Da/vfQQUDm2uf3tcOptZL5DQrMwOU6IgvDH0Pauitz+9D5T+97ikCR2+7agzhUNtoyau
	EkkaDSiPmBCq74PTATbRJ5RACQag8VIgjeCDthLR9G6HJm3A097LBpFAl7XGMa26eyggq5
	H0KlMWvFZDeJgXUcqrfHAFpp7i/aLcs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-kLXwkKeVMKyPXyPYY7vLPA-1; Thu, 19 Mar 2026 16:54:16 -0400
X-MC-Unique: kLXwkKeVMKyPXyPYY7vLPA-1
X-Mimecast-MFC-AGG-ID: kLXwkKeVMKyPXyPYY7vLPA_1773953656
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso133105101cf.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773953656; x=1774558456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
        b=rtZBmrm3QcOlIcTN5fv0ThBAaLkbiwAgIY/qb499goI5SqyX1fkL/X9ZNldxtvpckc
         7YhvPNaHw/jm6v6vV8fLD+ho4Jw5w2IfOTk2wWhTrrfUy7h1qCJ6UHaF1dyxMU+Es4vR
         GCp6V+ovYGuXZHWd13h/vD08StOanruGTaZtDdmvLt1/64uU5EDvh3XDfb4qHFBvjpGm
         Zdh3TFmgYQM5wbEU2Na5fIREVKOfP7zKd9mmMIWgINhowwwWMJrFTclJ+g0/oTJ7VirG
         9xeNP8pZZHpsB1Em+mIzNzKVKv3HdBZTZEJXAtaMooX2JZ5ExnvEKH+k/LnCKZa9vsPu
         TVbA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrMOFd9mU+PtU46hz6xFY/xUG7d7VchCT2FHZwE01cfBZftnVf7gJz5C1dMewF4a+pro=@lists.linux.dev
X-Gm-Message-State: AOJu0YycOhX1EQW0hM/PRa2z8BR8KujnbMN76Voxv4KcJ0k+xhxiD9H9
	1xDS8Uy16dW6dq/5U64QpV1d+9dEHS4yf3et21l4GJ3zSDappbiDA7BjFqgcAYyaCneL/IddIR8
	ZjOj2DLCDrJRIIyjFp4u/EZTgYkdY6OGqsOkCAsUL4rSW8vrNUuzEbQ==
X-Gm-Gg: ATEYQzzYWwEy4tKd+1qjR1UvcAfWF9A/eLg4a7sQ0eZzunvBRaNlD70qccdJQry48XE
	B5y7O76etIziOIGEelhWZUbDRa679fE46B1FTbIw4plu1FTXR9igiByCqrlWbGjHmmcqiLGrjhq
	VmFs3TjBIin0ODhaPnP4jr1ZapLOsMm9us/Rnrje8wtGQSB9LN987UoIOUyHJN8WaSAXQkU+Ms/
	dyKnF/0LrUbmXKhAqNWe7fnmQA4wlk0Thw6p9I8Q4LnAo4mAg2MYfSngm5kyBbbA7c3OMenP62F
	S5ZW7t+vqO/2tKrXyi6sSgh/lSY1pZiKJPZsrJrzVvcYOaOmNVeM0WJdibVf8Bn6OG8S6ATFfC1
	uFIIRmmGxFmldb+2/7Nd0O0NUGmIunPmBNixbnjZmNS+pVBhfXc4dxUbsi100unoauzupKOoWLe
	PHBF0tknzJ0+oYmg==
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10125361cf.54.1773953656264;
        Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr10124851cf.54.1773953655634;
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e350c3sm6518601cf.19.2026.03.19.13.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Message-ID: <cf908b20e5f6237c887f6d751be82670d7cbd7b7.camel@redhat.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro	 <peppe.cavallaro@st.com>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>,  Fabio Estevam <festevam@gmail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar	
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,  Christophe
 Roullier <christophe.roullier@foss.st.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 16:54:12 -0400
In-Reply-To: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
	 <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
	 <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B15SrgqxKkogaxn2LSLl4cus5m7CWnq-Gr6tpIPmpQQ_1773953656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-03-17 at 15:12 +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 16, 2026 at 7:31=E2=80=AFPM Radu Rendec <rrendec@redhat.com> =
wrote:
> >=20
> > On Mon, 2026-03-16 at 13:05 +0100, Bartosz Golaszewski wrote:
> > > Add support for the firmware-managed variant of the DesignWare MAC on
> > > the sa8255p platform. This series contains new DT bindings and driver
> > > changes required to support the MAC in the STMMAC driver.
> > >=20
> > > It also reorganizes the ethqos code quite a bit to make the introduct=
ion
> > > of power domains into the driver a bit easier on the eye.
> > >=20
> > > The DTS changes will go in separately.
> >=20
> > I'm seeing some weird behavior with this version. The probe part looks
> > good (but see below), but when I try to bring an interface up, it fails
> > with ETIMEDOUT. The relevant part of the stack trace leading to the
> > error is this:
> >=20
> > dwmac4_dma_reset+0x208/0x220 [stmmac]
> > stmmac_reset+0x2c/0x68 [stmmac]
> > stmmac_init_dma_engine+0x108/0x400 [stmmac]
> > stmmac_hw_setup+0x5c/0x538 [stmmac]
> > __stmmac_open+0xc8/0x2a0 [stmmac]
> > stmmac_open+0xcc/0x238 [stmmac]
> > __dev_open+0x138/0x2a8
> >=20
> > Now dwmac4_dma_reset() is very simple. It sets the soft reset bit in
> > the DMA_BUS_MODE register, then waits for the hardware to clear it, and
> > that never happens.
> >=20
> > Now, getting back to the probe part, there is one extra message
> > (compared to my previous successful test on v7), which I see at the
> > very end of the probing:
> >=20
> > =C2=A0 qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xfff=
fff00
> > =C2=A0 exceeds mask 0x00000f00), truncating
> >=20
> > This is a sa8775p ride board, so there are two stmmac devices. I only
> > see that message for the 2nd one, which is also the one I'm trying to
> > enable, and which fails.
> >=20
> > I realize this may or may not be related to your changes. But there is
> > no way to test on a SCMI-pd board without them. I'm not sure how
> > relevant it would be to test on the non-SCMI variant. I'm assuming the
> > DMA part should work the same way (regardless of SCMI-pd), so if I can
> > reproduce it there, and since I know it works on mainline Linux (that's
> > where I tested v7), I could bisect and see which commit in net-next
> > breaks it. If you don't have any better idea, let me know and I can
> > try. Meanwhile, I'll keep poking at v9.
> >=20
>=20
> Does current net-next on its own still work? Or is the second
> interface broken even without this series?

I don't think there is a way to test net-next on its own (without your
series) on a board with SCMI-pd firmware. It would require the
qcom-ethqos driver to have direct access to the clocks, but the clocks
would not be there.

What I could test though is a board with the "other" firmware (without
SCMI-pd). And on that board, I do *not* see the problem even with your
series applied. In fact, I tested the exact same kernel build I had
previously tested on the SCMI-pd board.

I'm not sure what to make of that or what else I could try.

FWIW, the "clk_csr value out of range" message I mentioned before is
still there on the board where everything works, so it's probably a
red herring.

--=20
Radu

