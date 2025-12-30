Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6321C9E5
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102179; cv=none; b=TAPxq67wzkkG8HP1nCzUU4diy9Gij9h72ve5J1gJq3NcuQwdkbaiZfGDbZ5K4klR9lJii4JTBSoj07x40upf4VLouCboguGDFJ9H2i8LIYPn2plFh0GVsxUBG5SmQphLWOFzvxh58jsC/C7wXoh9T0jsFlxot+5nvfj/tTI8+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102179; c=relaxed/simple;
	bh=p9KA0nl7i5BOX44fhmZtO/USDE5WvOuDB+Z4A54etQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVvCXfb4k5madY4heML/oVCkSXKyLQWKLMT4NOzfM7YqZ8Z4KcLOhDW+yG1foSa+1H+mq0jD5WTa0V4a3KLv40yK43VfRei3ALMsKZViO41SIlDm/vJGcs+pJdlRN6YgPcCUYBNx6Hki0me3wS4/FcDS2EP1xy+qbaGZx07MpVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obxNmjj9; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obxNmjj9"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37bbb36c990so94663421fa.0
        for <imx@lists.linux.dev>; Tue, 30 Dec 2025 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767102176; x=1767706976; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=obxNmjj9Fug236J4YAu0iQuh3PZbVfYhXeZs6ClAdwQsX05PnJ5vawwBlVZLzYeU9G
         eTOlOzCLBn7iqX0jWXgJs/wE9i6A3ypEiEshaQPZePS6vWZQXuzuh6/h/j8xg02eY0hz
         E1pthJYufjlzYs52xT1rZCGJtm7HOuPRSQCSl5pobCXhKKSiYUUL/JPz0cWNOmfxD2hz
         i1by1/A/+Owi+GdxlYKSdMv1ejj35nE7icYunYgtVsAmDxVtUNz5wGndNiGuD5CgbtZA
         FxyAmtaieckG2KCpFjwdYtqMPCEPLsQuJIlHZ4eInq1ngLE5+xW7jmjhLl0KUXPGx0uI
         18LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102176; x=1767706976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=mUf7RVbIc/YzkKyekT5ExgcgBGlX4nikztBov9zvwn9/1yMq/RDAWXGBjNN1roWfrx
         LOPoajswemqwj4f/p8mQTwDoA6F1CSvzrqJ017qSjqJzwuPFNxW28c7YgkPCOLgYp9aO
         DvLxjO6S35WLd1gc9JV7sREDcUUgXX/5IlVjliMgt7sQamH3j1wMjk6rhIDIaP2YQ1PI
         K4H46LQ5xmvEViRuzaRH4QtDiHpe+53CKqqXJXCyvF/DV2BcKdDeLqT4aMWDVV4xXpUQ
         QT5PLqHMgWYLqzAqdevTnwiwEHgUSk6tfnRtl/pVkjuPqi40RVrFMU4gKaUkL0mZO2XS
         VVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXdjyva+e6YBwTJGNFrCgBvABX7+mqzu3lwY6Bf5GARGJq3BneGJI6vg2V4ELpjH+sOqcI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2lgXpNqH6u/SVmpKhIdgqiTPHdTBHOcBNaKzq3RG11V2eQoHM
	+OnNsnO3nKW4FewDkE6isk7lAGtrnGyq0LhuSxSfSFLzqAkf0xAG/hFatSVWVipm7ZBepQx+lLt
	kFwaaUxK3RdgmOqBQuho8ahl41LR4kS6/x7O3GLoKpQ==
X-Gm-Gg: AY/fxX7jX1OeMZNUPEv9DnOqNZRrhkWSjOgArlVBJxmjywLssCS0s4Gn1RW0NUtUN14
	W57v6gJvXU061uCPBAckwHu+8HxLLJyhdAZs/PZe2KXMkuiKVP9/AZm/SdJ9Ots4yriZqR6eKHT
	bFBCaxhbYwZyjqrlCY8NP6BKZxHcPKI9nvqg692hKXGbvfSrt6Z85kVYoTHnrcyngSFNURokO4q
	eUPc9M3DBcP1JkMCEjctn1oOmEflJi7APC+poi9XwzW6IkMCmseTKE7/baIopHpeMUmyAY9CIXa
	NDcAIFA=
X-Google-Smtp-Source: AGHT+IGnsU8hNigKaB6hVKDS7nf4goo4fbF6JJBGTSO/BU8M8fMqqI2YvS58YCByHu7aYQAfLz1NJS8b8AXypc1f7ZM=
X-Received: by 2002:a2e:9a09:0:b0:37e:7a16:38fd with SMTP id
 38308e7fff4ca-3811319d043mr116531121fa.6.1767102175653; Tue, 30 Dec 2025
 05:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-1-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:42:18 +0100
X-Gm-Features: AQt7F2rVMfuvBZZs-hEcQQIpTtPZbAaFhZv2Z89dF-6-qgfGMGI_jCUJA6HlFl4
Message-ID: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> On the i.MX8MQ, we encountered some concurrency issues with H264 and HEVC
> decoding.
>
> There are two main reasons:
> 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> 2. The g1 VPU and g2 VPU cannot decode simultaneously.
>
> We attempted to make corresponding fix to address these two issues.
>
> Ming Qian (2):
>   pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
>   media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
>
> Nicolas Dufresne (1):
>   media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
>
>  drivers/media/platform/verisilicon/hantro.h   |  2 +
>  .../media/platform/verisilicon/hantro_drv.c   | 42 +++++++++++++++++--
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |  8 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 23 ++++++++++
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c         | 11 +++--
>  include/media/v4l2-mem2mem.h                  | 21 ++++++++++
>  6 files changed, 100 insertions(+), 7 deletions(-)
>

Can I pick the pmdomain patch separately from the others? Or does this
need to go together?

Kind regards
Uffe
