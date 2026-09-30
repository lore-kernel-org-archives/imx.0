Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C53B42C6
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758902; cv=pass; b=SZjTnv1bw5qPFM9ox/TF9sbvnh2kHy+oJePJ6W/yRhmnytp3b3AJEC2KXB9vQjLMYun+6AdZtQ1VRDrYo2kiflxV212CD8BytmH74qTJDi54UOi+DO7FgC6yOAAVoUiM/PGYy+PGc1yM0sY96EoDXvCdyWTsI2G8ZGSGmvzjuE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758902; c=relaxed/simple;
	bh=qbQjUe7LqGgZ1fLLEceiU6XcKlk7J9op70NiSeuioXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPJXN7TSRWSVZu5gfqEt3A2biMm6SMGAhCTOMQ6FNcQMLJcNTdwvgZmfFh5mLvs41aboqsjNUH+wr/VwMU4+f+OZA1QhzJxadiU5kn0z+0wAetUY4MppXW4SrpTtxqdDaaAPotVJP1G6gruw2y7Ix6duIGoYDlzrJcHuAVTstyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EFxeBafw; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EFxeBafw"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6756acdc3a8so1394528d50.1
        for <imx@lists.linux.dev>; Wed, 30 Sep 2026 02:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758899; cv=none;
        d=google.com; s=arc-20260327;
        b=SAXuxScCqmYXANmYx2+meLPRTZ1HaP250L650jgXDmt5n1d3R+U8ydiPr5mAolqaBf
         XY/YQ6okA5zApvsNtvUXrMi7fxxmxSXbYXCXztMz8qcRpp/mcW8H6mC7Yo2GZbBhPdWm
         tdXtWfpQmg5bzaAK3uFNlgsiiuisHhzEHtJ6DrKl/+GPk5morICxZvTtzkZHUgzuD16X
         RavXH3xoBkurV/oqeh0U1jARm32jZKITEAHtQg0ghDCZkwDPyOy+kU8C9phqnM4KCIpe
         nSXYan7YzYCnnf0ih0m5oMS4hlnfHfr6c/Zicw//Gf2/SAUp0zOHWkxN/ZrUJkNgc7pc
         4eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        fh=jMpi5xEETjLu90pnbGG9DI3mQlzp1G9OeJx0g5d7oLI=;
        b=sCC2dCcCGMhUS6UWOebfo982+LAiJS/ybYli4mpNZMKGZx3GQifLW1lqXxf2Dx1n59
         EITJoQgHYuDVRqv8XMlLSC+8kzZeLG/auyo57215Q67e1k8jNodne0NVYuD0GsmDF8Yp
         DjGsJNgj10T1MjYJPQSE6Z8uRSVhM7+/ZrMxxkbbOareaFUqu9/mDGq5MnoWQtKR27y8
         I1PxvBPERAUVK7W6+yoXP66G02zB5Ux5GivKe9EG92HCinjjrYwMNEyPxn+pd+69PbZ6
         M7qkINCgU5V8HsLWTF0GfHRvM91YBjW8A8dt7uLo0ni8WuNJOQ+bhSx/H81jO1uZyqVh
         MT7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790758899; x=1791363699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=EFxeBafwRDtz2p0Cayiejf6/MmmUIKrhE8uJxKToFPP+gH5eBoPqzoceFDly8ztprV
         cQG2aj60WRBUVspSSt+MEXD9NMpWFTVKjQDCWsfP3Rg0tbYnefDC7nJklBWRiNoIBsup
         d3SPzfw2pbM5Mlob8vRSAimok93O0oR4MwxJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758899; x=1791363699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=WDIoPPBfxs3iky+BaAjbpYOsYBU51XcG3qyETXF03GUu8z3ME7h2fGnBb0P+sGs1Qr
         5yvNoNpBTg6y3nmhDXZsYmGgTUpgwOUUXeQKIhg+69a9Bm1kAHiMKLj6E8DgV8u30Psd
         nFuK0Fhaz2EypU3r0miKftHsahhKN5ecfxCzprWDl+ZhamZs6ZyND+WMaxu38C/L8wWw
         97DkHzjwOcF28wUkWLWhGwQt8evRbmaSXeukfP8Z/HQ0t6K1S4eBXDeMjZjEwCd0p02p
         VzJGPZp4mi3XdmhrkL2FYSshGGyYbcHYEvK78F0G8fg4TH7QzzLLsQ4Zms7yHrxrbr20
         NW4g==
X-Forwarded-Encrypted: i=1; AKwUvBwFAkn+GmjNqj3SQ9wUa/O5Tl/CGUZN93Sk7V9LhUJMNym+OObQ97zgDwy1CUVolLoxSBY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIZWJlFdPfGCv5ic++i5/ZvlUnZqoHznMw1EOI8a8u+QoT9I/WP
	TS7w2dgIamjFn+JYHYM5yDffuPQ5w0ucMfDCU1vX4+PJRIg0aD6Zus6YQeVw8LFHrifotms588H
	/D/t7UotzOrfqx5BqRrgWq1HEGMDlVYoG63pn9IeUcg==
X-Gm-Gg: AYBFou3c9TFa86fzrxfn70Xnsh46b6zq7UuXuWoP2FMTpH6EPnlMzgHwRfBQZFxZlrd
	JjSO/1vfwz2vW1be0lGmG2y7yvPQ099H/4Cw30oMByNkpkJIMX1mf3f1i4z892+7vpTBKhjgfv2
	JGgxBN9ZM5khL6yCCzPVIVTYgXmCKy1hESOH4ViYW/LpiCCNMN/QV/tTkh0BKi5F/uCy1wwUegO
	2Htuhr4wNE9xByxN63ZdZSaTSQlUya3TA4H2rMj5gfI0cL/F4CDPo+sTYpYpNw+ley3K6UDc78y
	s2qFiAn2ve/iZkfT2cu7aUj5I69OGtlzCMR3TWG9RorbleQ1we4bbdMQ2CvqXj4I5XVmA64GpPh
	3GQzREWMekz2Bp75ioY8eR8CP4TDng9cFBd5E59b1NfU=
X-Received: by 2002:a05:690e:144c:b0:675:5fec:681d with SMTP id
 956f58d0204a3-6768346ceb9mr330443d50.78.1790758899672; Wed, 30 Sep 2026
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com> <179070048452.199845.10870046832708018931.b4-ty@b4>
In-Reply-To: <179070048452.199845.10870046832708018931.b4-ty@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 30 Sep 2026 11:01:28 +0200
X-Gm-Features: AclHuK_jgSkzAP6aG0bqXQrp3Gg_ntpz85heYxuGMY1RMPkv--ExXYz7UZJOjz0
Message-ID: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
>
> On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > Support spread spectrum clocking for i.MX8M PLLs
> >
> > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > boards using i.MX8MN and i.MX8MP.
> >
> > While at it, it validates the spread spectrum configuration in the clk
> > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > extension, which converted the spread to the wrong unit.
> >
> > [...]
>
> Applied, thanks!
>
> [2/4] clk: validate spread spectrum configuration
>       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Thanks for picking up patch 2/4.

I put the two fixes at the head of the series expecting them to go in toget=
her.
Am I missing something for 1/4?

And how should 3/4 and 4/4 be handled?

Thanks and regards,

Dario
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
